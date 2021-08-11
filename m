Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5A93E89BB
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 07:26:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0E316E0AA;
	Wed, 11 Aug 2021 05:26:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B8E6E0AA
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 05:26:34 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 b25-20020a4ac2990000b0290263aab95660so370810ooq.13
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 22:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=jKw0GFQ6ES1SXq7f3K/KZLMXlxNSWW1xnzU/Bn2f5/U=;
 b=oQglrCuBdilvHbZV6KUJUzMJ3zfGeJpnr+USDtU7GzXcNH9zYQ5E/abys4BpNU6qmI
 nDMndzuYQNIZ891UVmMRHcnnLGpXbW2QK/XzoahnCunjGkoJL+JNU1dm5xFBgjJjryzl
 F2HTsGbGYGW+M5iDuPg8o1bV6G1IKGnHufPUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=jKw0GFQ6ES1SXq7f3K/KZLMXlxNSWW1xnzU/Bn2f5/U=;
 b=pBHqymE8xKI1d+NFt456y2CUrfwrwz+N2LHM9QyJDS9YBnKpauNsu+2+7HRbOYEuoG
 Fmm0WW7nposaWn1uqMYeWRNJaarymbgl/G+23XsXwsN72NkYDYsHE0zYJ4WTIyP6L2SI
 JOPt/QSOUz3uF3gkwzoJ0GKPPGKWbvExcqVUfBPww+daeGkeAPqhqflI+SaqBWh+DoDt
 xFt4V5l5OKNwdRSX2xQhOBx9tjgEK7R23YF5www1MmX8b5qyUbGDoa7IahZGmLjur/4D
 bdh/xeMR1ubRU+DPB6rDmzXR8iMG+eYCngtSUBvdejsfPQPq+TELlKgkJf8hJL6w/91B
 zBnA==
X-Gm-Message-State: AOAM530JufUangfSYXz7xJhT1/AahIj4nBqSRYzz2M4TgjbsgGYF2/H/
 OoMRfCgdPKXX0sdcb5pcRKuj8kVUJ9yvwTC6q3dPtA==
X-Google-Smtp-Source: ABdhPJxodrz0DuJFGpejWPyD/CG1hN1z7rUNEXCtuHnaaSzfGEoDRmUwje3DWqyQLr9U6pCrk+syW4tO5VWwCAajHMI=
X-Received: by 2002:a4a:96e1:: with SMTP id t30mr20991495ooi.16.1628659593721; 
 Tue, 10 Aug 2021 22:26:33 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Aug 2021 22:26:33 -0700
MIME-Version: 1.0
In-Reply-To: <20210624000304.16281-5-laurent.pinchart+renesas@ideasonboard.com>
References: <20210624000304.16281-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210624000304.16281-5-laurent.pinchart+renesas@ideasonboard.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 10 Aug 2021 22:26:33 -0700
Message-ID: <CAE-0n52Mw-ZzdqwKeEX2-WP6NyqdXvfzq=KeZJug9A-NiVo8aw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] drm/bridge: ti-sn65dsi86: Wrap panel with
 panel-bridge
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org
Cc: Douglas Anderson <dianders@chromium.org>,
 Jagan Teki <jagan@amarulasolutions.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Andrzej Hajda <a.hajda@samsung.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Neil Armstrong <narmstrong@baylibre.com>, 
 Robert Foss <robert.foss@linaro.org>, linux-renesas-soc@vger.kernel.org, 
 robdclark@gmail.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Laurent Pinchart (2021-06-23 17:03:02)
> To simplify interfacing with the panel, wrap it in a panel-bridge and
> let the DRM bridge helpers handle chaining of operations.
>
> This also prepares for support of DRM_BRIDGE_ATTACH_NO_CONNECTOR, which
> requires all components in the display pipeline to be represented by
> bridges.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
> ---

With this patch applied I get two eDP devices on Lazor sc7180 (it is the
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor*.dts files if you're
looking for more info). As far as I can tell, we should only have one
eDP device on the board, for the bridge.

localhost ~ # ls -l /sys/class/drm/card1-eDP*
lrwxrwxrwx. 1 root root 0 Aug 10 22:24 /sys/class/drm/card1-eDP-1 ->
../../devices/platform/soc@0/ae00000.mdss/drm/card1/card1-eDP-1
lrwxrwxrwx. 1 root root 0 Aug 10 22:24 /sys/class/drm/card1-eDP-2 ->
../../devices/platform/soc@0/ae00000.mdss/drm/card1/card1-eDP-2
