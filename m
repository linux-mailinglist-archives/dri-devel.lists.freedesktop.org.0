Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C69A7AE2118
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 19:39:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6494A10EBA5;
	Fri, 20 Jun 2025 17:39:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dycrVVoU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64DB110E231
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 12:34:00 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2353a2bc210so15019355ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 05:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750422840; x=1751027640; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xD71SdW5peKOXqfnFLf71PUUXbnUP93dgxGEinYj8ME=;
 b=dycrVVoUfbSDmhoWdM3FrNi8bEwl8gdfmwCw4lNeTRJ700QDPimTKOwVF8NZRRAdmL
 nUx6TkubWkNnMZzhoXb9hF8C8mR/GL/cxYfm7y7Aeovt2UY3qFtauiq5BKYBE2xzijb1
 IiMtX+ECZVJcFmCZ6a6tzP2NfONh4IpSqSBHcjZk2546F+sV8f7dGSblykUZKvBRPjKZ
 UCtK5OtQrvF8mY59W0mY3AM9DB5TdMDhxQF6nmw/DF7UOFSlojOMeLQRd0bAwUxoyb8X
 p0ul5FhS5HT5Elhs+/3HoO/1zlm+ziMnuorT1cKyeF7U/dLB6GY2r/H/x4SgxqQOjs5W
 qBsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750422840; x=1751027640;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xD71SdW5peKOXqfnFLf71PUUXbnUP93dgxGEinYj8ME=;
 b=LB0A/4gZhSekHAoS0X3AvBSvBCcOfZQijD/nBzsh2G1NHy6ukjNV2s0TEKvkzF46aw
 mugf7Y1/k3R/FTXPBS7B0Fj6g7IAT1tSbPD6ByjzYDYfIwO2xdXWdYUGlfqAi2WyibKx
 rJVfJlPHEzcnaiq1vDxjVgEznRAD1SBXr2TBsGYAZxANiG1tXb1+iLH/ICSThitil2t6
 kNGhVkfdyes22g/Qi+Y1QmO07FT2JJVjBsi3uvyh0MFLufStTYN6RisUXUaCmKRAFeXT
 lT0Wj3gZoBbp4IJJD1stN+CrbyqBYrkPTE5bctoDYEiQbqvWAUVUardmQ0AidLgunV1u
 koSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXT0kWHLJbzOqumNMZORUdsHC6nIqaIesWONwNe2M/VOoUjhfGllOzLFiFnI0R6PJfinaLaZXYDSEU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKjvVUBhv0kJ3WLrdLZlfGEexcQOmHXEWM0X8rBPEqhBDpkp/4
 ELtwJiped+vUXzoLcJ+zM8kRUcDxjTjyArjkK8gTPeG7cZS3yUYNSZ5R
X-Gm-Gg: ASbGncuh7zp6w/zSxcXqyox0ZC1yyCFTIWxL1fCs5B4kvoZFeZzTdCdl2VFKFFc23ZN
 6LC0PjeH0zxQOARKP7qmvhgijqduqMJpii+lFMMEd7D/YFSqLPsv9U8LX1/4p0GTPAH0HpUUl+c
 TxagDxpxHuqjv5ujDGiLNolLE8AMwbkW6880MTXjc+cR4nlh+yiSdQ0ruBFtmIwPPidpKKMLBCp
 vg2EA6wkW/IxATNJKoswvogbHh+saeLZGwac42CbWHmz9HusbdusDrBCudeoGoyiVMhmfixhW/0
 tSXM2lw22ir+FKMVPgRs3uCk3VWa4yLLFyDKsuzh7e4sm3Y+p2TdGGpG4mdzmQ==
X-Google-Smtp-Source: AGHT+IHNKFm5yGIukI363S3mVHZokkhSd7/SyqBWeC5OnvO2eekuRR5ZQ+wr0su1YjcLk4a5Tvu/1Q==
X-Received: by 2002:a17:902:f546:b0:234:8f5d:e3a4 with SMTP id
 d9443c01a7336-237d977939bmr43326905ad.2.1750422839714; 
 Fri, 20 Jun 2025 05:33:59 -0700 (PDT)
Received: from hiago-nb ([2804:1b3:a7c3:450a:5588:4056:772b:c07f])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d860a854sm17056685ad.116.2025.06.20.05.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 05:33:57 -0700 (PDT)
Date: Fri, 20 Jun 2025 09:33:50 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Aradhya Bhatia <a-bhatia1@ti.com>, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Francesco Dolcini <francesco@dolcini.it>,
 Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [PATCH] drm/bridge: samsung-dsim: Fix init order
Message-ID: <20250620123350.btgncwhwuxjqok7c@hiago-nb>
References: <20250619-samsung-dsim-fix-v1-1-6b5de68fb115@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619-samsung-dsim-fix-v1-1-6b5de68fb115@ideasonboard.com>
X-Mailman-Approved-At: Fri, 20 Jun 2025 17:39:34 +0000
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

On Thu, Jun 19, 2025 at 03:27:18PM +0300, Tomi Valkeinen wrote:
> The commit c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain
> pre-enable and post-disable") changed the order of enable/disable calls.
> Previously the calls (on imx8mm) were:
> 
> mxsfb_crtc_atomic_enable()
> samsung_dsim_atomic_pre_enable()
> samsung_dsim_atomic_enable()
> 
> now the order is:
> 
> samsung_dsim_atomic_pre_enable()
> mxsfb_crtc_atomic_enable()
> samsung_dsim_atomic_enable()
> 
> On imx8mm (possibly on imx8mp, and other platforms too) this causes two
> issues:
> 
> 1. The DSI PLL setup depends on a refclk, but the DSI driver does not
> set the rate, just uses it with the rate it has. On imx8mm this refclk
> seems to be related to the LCD controller's video clock. So, when the
> mxsfb driver sets its video clock, DSI's refclk rate changes.
> 
> Earlier this mxsfb_crtc_atomic_enable() set the video clock, so the PLL
> refclk rate was set (and didn't change) in the DSI enable calls. Now the
> rate changes between DSI's pre_enable() and enable(), but the driver
> configures the PLL in the pre_enable().
> 
> Thus you get a black screen on a modeset. Doing the modeset again works,
> as the video clock rate stays the same.
> 
> 2. The image on the screen is shifted/wrapped horizontally. I have not
> found the exact reason for this, but the documentation seems to hint
> that the LCD controller's pixel stream should be enabled first, before
> setting up the DSI. This would match the change, as now the pixel stream
> starts only after DSI driver's pre_enable().
> 
> The main function related to this issue is samsung_dsim_init() which
> will do the clock and link configuration. samsung_dsim_init() is
> currently called from pre_enable(), but it is also called from
> samsung_dsim_host_transfer() to set up the link if the peripheral driver
> wants to send a DSI command.
> 
> This patch fixes both issues by moving the samsung_dsim_init() call from
> pre_enable() to enable().
> 
> However, to deal with the case where the samsung_dsim_init() has already
> been called from samsung_dsim_host_transfer() and the refclk rate has
> changed, we need to make sure we re-initialize the DSI with the new rate
> in enable(). This is achieved by clearing the DSIM_STATE_INITIALIZED
> flag and uninitializing the clocks and irqs before calling
> samsung_dsim_init().
> 
> Fixes: c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
> Reported-by: Hiago De Franco <hiagofranco@gmail.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Verdin iMX8MP

Best regards,
Hiago.

> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 29 +++++++++++++++++++----------
>  1 file changed, 19 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index f2f666b27d2d..cec383d8946d 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1473,22 +1473,31 @@ static void samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
>  	}
>  
>  	dsi->state |= DSIM_STATE_ENABLED;
> -
> -	/*
> -	 * For Exynos-DSIM the downstream bridge, or panel are expecting
> -	 * the host initialization during DSI transfer.
> -	 */
> -	if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type)) {
> -		ret = samsung_dsim_init(dsi);
> -		if (ret)
> -			return;
> -	}
>  }
>  
>  static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
>  				       struct drm_atomic_state *state)
>  {
>  	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
> +	int ret;
> +
> +	/*
> +	 * The DSI bridge may have already been initialized in
> +	 * samsung_dsim_host_transfer(). It is possible that the refclk rate has
> +	 * changed after that due to the display controller configuration, and
> +	 * thus we need to reinitialize the DSI bridge to ensure the correct
> +	 * clock settings.
> +	 */
> +
> +	if (dsi->state & DSIM_STATE_INITIALIZED) {
> +		dsi->state &= ~DSIM_STATE_INITIALIZED;
> +		samsung_dsim_disable_clock(dsi);
> +		samsung_dsim_disable_irq(dsi);
> +	}
> +
> +	ret = samsung_dsim_init(dsi);
> +	if (ret)
> +		return;
>  
>  	samsung_dsim_set_display_mode(dsi);
>  	samsung_dsim_set_display_enable(dsi, true);
> 
> ---
> base-commit: 7872997c048e989c7689c2995d230fdca7798000
> change-id: 20250619-samsung-dsim-fix-58c8ec8193e9
> 
> Best regards,
> -- 
> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>
