Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9F0625481
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 08:41:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94CCD10E77B;
	Fri, 11 Nov 2022 07:40:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com
 [IPv6:2607:f8b0:4864:20::930])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D9610E752
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 07:40:49 +0000 (UTC)
Received: by mail-ua1-x930.google.com with SMTP id t26so1111195uaj.9
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 23:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RSCEsE/k2zop7T/QkKVjsEEgTxwFxYe+bGHoI98bBtY=;
 b=F2dJGfr/6QuqyV8T3+ORTE5PscCUIRksA9H7zYvuBPSuViw6/kOe//nCkXR6hrojc/
 3voOCwRsLN3dNFb6PHCVnGacjtn3lkiwsiBVSYPCgz9YqkRe3tZLXP92HJ//ch9GzAGk
 QvBNMd/ze3lm8DEqW/oEuR5k2WODJ4f+t6Gq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RSCEsE/k2zop7T/QkKVjsEEgTxwFxYe+bGHoI98bBtY=;
 b=NNSGRZgzoaCTUi/lPUV/YhV9l0dJmvP9UKmgTQcXtHcQC99xrnvwwxi42sbVqwbFOu
 hRBYzID5dDMVEoCAtc0PxtVK5keCOnBTBfBm2Vx2nSikaaXIbme1uftU5tVed2UKqIq0
 FhWnMACbL99IaUMd3UUdOSb/tVfRijd1yg1D4UZZdafnh0+fCFa1lLSN8YwkaNFgkyE2
 EcPmc7Jj7JwqA8BC4ksolIWTSIHGidqOXS66PbcvKSayNRq7zYuDXEPk0VdJbCUDwKmo
 pv/8nNHCFTI6AKmHkj2m32apshAN0Fo1E1JCPx6F2lP3uUL3oScSNGhCQVSlqJzE5k8/
 uXQw==
X-Gm-Message-State: ANoB5pnBAGpurcn0XP2EcZPZQSoUW3SOttW9Ichv1DeXCfKCHvk0+OO3
 1gvwQRYTitEw/sWCnX+IrnJoWn0vc39NO5TsA7BOZg==
X-Google-Smtp-Source: AA0mqf60bQlM6y1waTIKCFYX4aHza3GEl7ztw9lALAFIoTrEbx+lXYrSHIrK4i/aPKj7zLkoBjp6Ul9kYl5ocidQGV4=
X-Received: by 2002:a9f:2f01:0:b0:3ad:bbe7:e134 with SMTP id
 x1-20020a9f2f01000000b003adbbe7e134mr187214uaj.43.1668152448952; Thu, 10 Nov
 2022 23:40:48 -0800 (PST)
MIME-Version: 1.0
References: <20221110184852.1848917-1-gildekel@chromium.org>
In-Reply-To: <20221110184852.1848917-1-gildekel@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 11 Nov 2022 15:40:37 +0800
Message-ID: <CAGXv+5HmNT9hEncMoQJ2dj+7YWnmq-N-z4Y7xNQHzT0mst=kug@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: make eDP panel as the first connected
 connector
To: Gil Dekel <gildekel@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: chunkuang.hu@kernel.org, airlied@linux.ie, jason-jh.lin@mediatek.com,
 justin.yeh@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 seanpaul@chromium.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 11, 2022 at 2:49 AM Gil Dekel <gildekel@chromium.org> wrote:
>
> [Why]
> Some userspaces assume that the first connected connector is the "main"
> display, which supposed to display, for example, the login screen.
> For laptops, this should be the internal connector.
>
> [How]
> This patch calls drm_helper_move_panel_connectors_to_head() right before
> crtc creation to ensure internal connectors are at the top of the
> connector list.
>
> Tested by ensuring the internal panels are at the top of the connector
> list via modetest -c.
>
> This patch does to mediatek what the following patch
> https://www.spinics.net/lists/stable/msg590605.html
> did for qualcomm.
>
> Signed-off-by: Gil Dekel <gildekel@chromium.org>
> Tested-by: Gil Dekel <gildekel@chromium.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
