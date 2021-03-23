Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5A7345851
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 08:10:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B55046E093;
	Tue, 23 Mar 2021 07:10:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA0196E093
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 07:10:06 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id h25so10761685pgm.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 00:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=+K97PdVuEE+1g5sFpZ/HQJps6vR1JaS12plaQgGGVrc=;
 b=hJPsR0X8zUt01jIOr510j6YVCgU5chpqEtRn3weogf28emnKpbetTL+jaiJCKCfBeO
 1sI7ghj81uIZvzwFy3Kw9NHdOWH17EYsE6SN/FBJNDwCq8UG3f8Y/fbxraf7I4+zVX+Z
 esuBJPP66rpgSEeOoDQUjQu95RLTM06PCrCZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=+K97PdVuEE+1g5sFpZ/HQJps6vR1JaS12plaQgGGVrc=;
 b=pjinGc4mtEyL/tFg3QdD0Gxnp6Suyp41tE8aX8LJ46OioRZ1y6FsKc9K6aSe6dMxin
 3kKuREQygHhmbTnYRCJA2RSO2HVdZ4yFg891y9qY7ScQsddtlwwrWC4GOSz7jNbSdViK
 ODx0reg2pnAPzufAsoK25WM1Zl3KalaLY4RpnJQy9bCAhmxA8z0aLikqk8C8nPk3XHHQ
 yZDbrVlC7fCPYwyVbVag+Zw1Ee6OEloDuEp7vo0iU6/TmJnYHqZBVkzz21KKaoIXPyhC
 A13iIsu0aNTJGfS7ERBrLZRgIX71xER5fyUKiIsiAY4zobEM29r7ZsS7PSDXIY6NONtl
 j+lQ==
X-Gm-Message-State: AOAM5302/JlPzuk5abeIWLSKRpi5Cx+7eUCMDyTd357EQX3mWbwP9tju
 swgArq/EM3W6h6twEYn59rsOoA==
X-Google-Smtp-Source: ABdhPJwBA4HX/OVdGFcBVhzxavJbsPmpXxWAd100ZSbxVqWbcho629Mo06rAJsZji1oYXubYDKV3Aw==
X-Received: by 2002:a17:902:d2c5:b029:e5:c9ce:cb3c with SMTP id
 n5-20020a170902d2c5b02900e5c9cecb3cmr3914484plc.74.1616483406508; 
 Tue, 23 Mar 2021 00:10:06 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e90d:d453:87ae:2e10])
 by smtp.gmail.com with ESMTPSA id x125sm6171927pfd.124.2021.03.23.00.10.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 00:10:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20210322030128.2283-2-laurent.pinchart+renesas@ideasonboard.com>
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-2-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [RFC PATCH 01/11] dt-bindings: drm/bridge: ti-sn65dsi8: Make
 enable GPIO optional
From: Stephen Boyd <swboyd@chromium.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Date: Tue, 23 Mar 2021 00:10:04 -0700
Message-ID: <161648340457.3012082.17691256832017517403@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>, linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Laurent Pinchart (2021-03-21 20:01:18)
> The SN65DSI86 EN pin can be hardwired to a high level, or connected to a
> global reset signal, not controllable by the kernel. Make it optional in
> those cases.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
