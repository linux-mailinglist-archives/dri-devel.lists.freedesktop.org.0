Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DE44B07D4
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 09:10:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CC3110E75E;
	Thu, 10 Feb 2022 08:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC0AA10E329
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 09:38:03 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id k25so5546468ejp.5
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 01:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=Zf09fhxJvGla0or8oZSrVuBndlVe2UUzv9p173zbREU=;
 b=WHviiT1WQk+xsZsxR/fBCk46zIrC19/qroBaWDxQz0Ez8y8Y72Kazx+dlLiytz62YF
 BDVX8jKeMY8PE1u9XYb+yxY5Xg9wJ0LYpSCyI89zcVTzVsNMLe1qxqIdmT//p1bLhSxQ
 QGA7cMlPULd/w60DeAhTW3N/bWKgGupB2/ma/woQM0yhoNb7udKmnATqipLJWZ8VDd/E
 +0/7IgJQA8i9S+f6j7HYsBzdMbWm8Nu4oZxvGd+V//y5EXVqg8SYKgKbqIwtAzekLNL/
 +e5fmDZKFYzcKaa8/Gsjbu1vLq0tJfXv7LcrmI1zLiEt/rAA9aEvG5r07ds1twXvqWdO
 m3uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=Zf09fhxJvGla0or8oZSrVuBndlVe2UUzv9p173zbREU=;
 b=iOR5xC7j+qKCargziWzJjmQsYZeRqLHQf027vBLVmoMr/oVQvGZ6U3KYxitx/6qNDt
 rvPj16R+o4ypQEbVYqreJ5+mnlwkoL6niYeveB284E6r7L4Tymi1Pn4lVzVjJM5j4Bp4
 uf03eIipMXc7VvMbV/2rpVGc29gH6i3uuGqjmcFoGzclXu0cEdWlHvpkuZhMoEqWkDNg
 FlmRCFrQ2B+VHarZzwmxAp2p2w+mTvHHbsn++ClcT7NrJYfdPc6h8POMDQyVS3oCWaZd
 sR8F/X5FGiyfkkAFzn483euNbk+9X8N1FBhhLM4toyiWoGEI8pYH01lcd5HHkrCyN0zs
 JQsQ==
X-Gm-Message-State: AOAM5332wOXvjl12GypSGsw30S4qmpkrbCZgMadPYkRYuawCBcL5GLfu
 u3mK7QbbZD7drhYW2l7fBcc=
X-Google-Smtp-Source: ABdhPJxsK4FUiaTKFg6rEouHeRW1xALlerrDB6lcbd1V9jHAoopzNVe249E6EHggNlVVpsBpfckLZA==
X-Received: by 2002:a17:907:7ba4:: with SMTP id
 ne36mr1143957ejc.79.1644399482390; 
 Wed, 09 Feb 2022 01:38:02 -0800 (PST)
Received: from Saturn.fritz.box ([194.191.225.82])
 by smtp.googlemail.com with ESMTPSA id u9sm5755751ejo.119.2022.02.09.01.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 01:38:02 -0800 (PST)
Message-ID: <36f517300a15b2460a02512ef3c5814ad0ed2290.camel@gmail.com>
Subject: Re: [PATCH V2] drm/imx: parallel-display: Remove bus flags check in
 imx_pd_bridge_atomic_check()
From: Max Krummenacher <max.oss.09@gmail.com>
To: Christoph Niedermaier <cniedermaier@dh-electronics.com>, 
 dri-devel@lists.freedesktop.org
Date: Wed, 09 Feb 2022 10:38:01 +0100
In-Reply-To: <20220201113643.4638-1-cniedermaier@dh-electronics.com>
References: <20220201113643.4638-1-cniedermaier@dh-electronics.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 10 Feb 2022 08:10:20 +0000
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
Cc: Marek Vasut <marex@denx.de>, David Airlie <airlied@linux.ie>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Dienstag, den 01.02.2022, 12:36 +0100 schrieb Christoph Niedermaier:
> If display timings were read from the devicetree using
> of_get_display_timing() and pixelclk-active is defined
> there, the flag DISPLAY_FLAGS_SYNC_POSEDGE/NEGEDGE is
> automatically generated. Through the function
> drm_bus_flags_from_videomode() e.g. called in the
> panel-simple driver this flag got into the bus flags,
> but then in imx_pd_bridge_atomic_check() the bus flag
> check failed and will not initialize the display. The
> original commit fe141cedc433 does not explain why this
> check was introduced. So remove the bus flags check,
> because it stops the initialization of the display with
> valid bus flags.
> 
> Fixes: fe141cedc433 ("drm/imx: pd: Use bus format/flags provided by the bridge when available")
> Signed-off-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: linux-arm-kernel@lists.infradead.org
> To: dri-devel@lists.freedesktop.org
> ---
> V2: - Add Boris to the Cc list
> ---
>  drivers/gpu/drm/imx/parallel-display.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imx/parallel-display.c b/drivers/gpu/drm/imx/parallel-display.c
> index a8aba0141ce7..06cb1a59b9bc 100644
> --- a/drivers/gpu/drm/imx/parallel-display.c
> +++ b/drivers/gpu/drm/imx/parallel-display.c
> @@ -217,14 +217,6 @@ static int imx_pd_bridge_atomic_check(struct drm_bridge *bridge,
>  	if (!imx_pd_format_supported(bus_fmt))
>  		return -EINVAL;
>  
> -	if (bus_flags &
> -	    ~(DRM_BUS_FLAG_DE_LOW | DRM_BUS_FLAG_DE_HIGH |
> -	      DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE |
> -	      DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)) {
> -		dev_warn(imxpd->dev, "invalid bus_flags (%x)\n", bus_flags);
> -		return -EINVAL;
> -	}
> -
>  	bridge_state->output_bus_cfg.flags = bus_flags;
>  	bridge_state->input_bus_cfg.flags = bus_flags;
>  	imx_crtc_state->bus_flags = bus_flags;

Tested on a Colibri iMX6DL with a panel-dpi based panel.

Tested-by: Max Krummenacher <max.krummenacher@toradex.com>

