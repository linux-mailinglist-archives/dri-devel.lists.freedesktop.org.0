Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE6B8C4574
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 18:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA03310E0F6;
	Mon, 13 May 2024 16:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aGjaIJGq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B85C10E0F6
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 16:58:30 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-61bed5ce32fso49180807b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 09:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715619509; x=1716224309; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FYzGbEJKkgXKMkF8uHa4ezT70rrAZuIzkboCItlGciY=;
 b=aGjaIJGqMN0PwHnwcF9S4zigt5Kx1T5vRHzocHNl+ZJ42qzMMszdsO4LAhumTqeR9Q
 DRs28vQf0Ip+Ucy9f0KKivxDWPBIgVHqdtWuhDy2JgkgNjMs11kFCYLz0lrs7+w6x9KZ
 8dwC25cYCVLq6hY5cOjMqWetDagIcgxv7td7tnvDli2jgoctSsD5WrsjsFXjnL+psVhp
 vA1we46RMGtDeF2oa+g1SrCHrJPw36hViJ1VZYPXJn3TSMRmZ+2gAadAw9WqG76snu5I
 hg5lPn0fPSevAJoC6DhlCWIqDmwyv5Wa2byeqgwxqW/VwXehKzYjqmvRhIHDfSE0bubW
 g/yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715619509; x=1716224309;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FYzGbEJKkgXKMkF8uHa4ezT70rrAZuIzkboCItlGciY=;
 b=cgp5ecD0Us79fvqUztJFbQMO0AxADh7csqMrleXFqnmgWdphc3EiMcrSEZwRDCdxzX
 OOeeJzI+bS6K173M1q58/WqsI+pZx66XBb3PeAYFpXoUJ2WkchAX6zgz+3YJZ1g3Tzaj
 RUPyMaaseDv66iszhuPfhqxUEiQxyZdaI8DgxoDzXGPMObQ5XRK2ClOdvfxRURNDVFGw
 TMEIpEihtvAFaTxDZS+dVzxK+WA2/9BSaXHkZPGXM98fezBbS7nW5qGOfcoZnPOGvT2Y
 SNMzftPLQNty8pY5lNQX7+BXCuz7d+Ca+aNKS//9fzVZnmGFpy1qdNCvKauct5DifUn5
 Sw8w==
X-Gm-Message-State: AOJu0Yy6wwIYgpSJxeBJqWHRk/Vta/+9OypFhdChhoIH8Uqx+VECMqGm
 +3imkt4GM7cUWMLtHw6Dh+RWeh4Nw8wN7dWVPmPu+HAafCw3SJpnWzFDkKMx9suXcKVWFzpGfeK
 NoQBMzfvWUp3Pi8etsxhcM7veFekBCgCDVkDs3g==
X-Google-Smtp-Source: AGHT+IEXpWRGnmuY+t5qHCD88rsKWAw2KXbR51bgXSwAaMdoMKoJahXIhcHPVPgOfm/Ra24Cx8KycPeeNLhV7xaRYXc=
X-Received: by 2002:a81:a0cd:0:b0:61b:33f6:9bbb with SMTP id
 00721157ae682-622affdf582mr100457647b3.28.1715619508910; Mon, 13 May 2024
 09:58:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240513080243.3952292-1-victor.liu@nxp.com>
In-Reply-To: <20240513080243.3952292-1-victor.liu@nxp.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 13 May 2024 19:58:18 +0300
Message-ID: <CAA8EJppT63E-4YnCM+hQhbAK_ZXh4O2L0Bz+XzTyywto22AYVA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: adv7511: Attach next bridge without creating
 connector
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, daniel@ffwll.ch, biju.das.jz@bp.renesas.com, 
 aford173@gmail.com, bli@bang-olufsen.dk, robh@kernel.org, 
 jani.nikula@intel.com
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

On Mon, 13 May 2024 at 10:55, Liu Ying <victor.liu@nxp.com> wrote:
>
> The connector is created by either this ADV7511 bridge driver or
> any DRM device driver/previous bridge driver, so this ADV7511
> bridge driver should not let the next bridge driver create connector.
>
> If the next bridge is a HDMI connector, the next bridge driver
> would fail to attach bridge from display_connector_attach() without
> the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag.
>
> Add that flag to drm_bridge_attach() function call in
> adv7511_bridge_attach() to fix the issue.
>
> This fixes the issue where the HDMI connector bridge fails to attach
> to the previous ADV7535 bridge on i.MX8MP EVK platform:
>
> [    2.216442] [drm:drm_bridge_attach] *ERROR* failed to attach bridge /hdmi-connector to encoder None-37: -22
> [    2.220675] mmc1: SDHCI controller on 30b50000.mmc [30b50000.mmc] using ADMA
> [    2.226262] [drm:drm_bridge_attach] *ERROR* failed to attach bridge /soc@0/bus@30800000/i2c@30a30000/hdmi@3d to encoder None-37: -22
> [    2.245204] [drm:drm_bridge_attach] *ERROR* failed to attach bridge /soc@0/bus@32c00000/dsi@32e60000 to encoder None-37: -22
> [    2.256445] imx-lcdif 32e80000.display-controller: error -EINVAL: Failed to attach bridge for endpoint0
> [    2.265850] imx-lcdif 32e80000.display-controller: error -EINVAL: Cannot connect bridge
> [    2.274009] imx-lcdif 32e80000.display-controller: probe with driver imx-lcdif failed with error -22
>
> Fixes: 14b3cdbd0e5b ("drm/bridge: adv7511: make it honour next bridge in DT")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
