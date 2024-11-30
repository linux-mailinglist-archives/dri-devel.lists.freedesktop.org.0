Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E6A9DEF9A
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2024 10:35:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E67FF10E04A;
	Sat, 30 Nov 2024 09:35:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fJ7LEr96";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0176D10E393
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 09:35:38 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-53dd0cb9ce3so2259830e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 01:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732959337; x=1733564137; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DJpAceZsvwXrkIr1FtmUK4kMCTXmq7VlVQ0IrLAf8OE=;
 b=fJ7LEr96P93A/OfgPOt9/zOiVKN1TdBTSXjy0jkAkCrxyRId9ssUCWAzYXPL4zbq1W
 kGOG7ju91PdGBXirnH0mHbjx7xkiYW3GEUvodE/7OEhCMFUtriKCZR4DP+vecjp1maSH
 P6xb5BZO16xBFo9cUjyOnZuLfvaBKkUxkY3co+mCKsMXq/F2UBkparGwaklY+F8Ti6Ux
 bOflaOjaFpX1YTxOnohDit67ztF32eVqWW+91Z9Ty8eHmNpAbPwPt15qsgl5dxXh4jmj
 qyOfzwqPu68ps6fpD0il6EhWoSGMtebJdjsEeXHXnGC/hFfM7xuSOJtTeCb2+6vi+Pfn
 p75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732959337; x=1733564137;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DJpAceZsvwXrkIr1FtmUK4kMCTXmq7VlVQ0IrLAf8OE=;
 b=fiPVnqpqFndqPskvLOrlsNAByBQ7YYT+Rz/ny6Jho6/hEK+OyhiQshJMT+d3dTk7lc
 nJlzwNZYeCwCiUHyOL5Lf9cAJQsEmcdwedx0X4s3x2XaHgQtgz8Yxec+rWjHowQg9l0O
 feBE5SDK9xKffzKpm834RW1u/llqf+VH2uh0someXOvKpHnsG+dX16ZrfpUpclQWShMb
 xfXDS8VEcnLU8UKvpeYpSFwhGcdtKNth4IGcX741FmX4leT0L984HiZaXBhhOwu8z083
 HTe211mSXBLdIVD7fY/IBz63Kk3UFzTdtJrUP0JZrEUVmLMAMFlkPXjToYPx0WuCEomQ
 m8Vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUV5uJtWz5MlpXu4tKLFOQO5GieUggGwhig/GgIA0v1+m8Q6x7mtZb9CWT8FEYQnBXvzNsKMroRinc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyL/isfqZRqO/roKhgUx/+ODZ6xl/k/uBpGDSeuUdjL6/hqom1k
 5rlotodEPE4EbRgAh4plrkynUjjxYjynQKJATCD6JbKGR1c1ip3pUPhG//ZwLlc=
X-Gm-Gg: ASbGncsSfCZ3erYUpX+Nnp/8sKBrZe/3ZlUwfUYpU16HO2r5RN09AdGEaGJ7QzVbbHN
 /ht4bCMJXpfyArT0BJD25zUNLItS1zKk15n02QEZ4VwGssqwlGxb9i7rv4hxsh2o74zE2ANsaL+
 4PnYV4lbQ2wE6FHcOOVGFJAcfD2Y7Kn0sjQLfrJhTH3+BDox2JEjXpPWPXV6/LE5FJY6t4QRg84
 t19E6u1FQj3QuP6B5rzA8CxyiZi5erG2uWU6n8ZUmkzgSnIk0VR05p/naVsZmnZw/ApLKLD8YTT
 iC8Q11ukaD+dL/FpOKE8xFwE85HFhg==
X-Google-Smtp-Source: AGHT+IFbMjYux+SSZ96v0jN8KYReJVZhl0TeMioEfshmhbV98iI9mESjw7Z64iU8uw4lxUzUNRlHYg==
X-Received: by 2002:a05:6512:39d0:b0:53d:e5f0:32bb with SMTP id
 2adb3069b0e04-53df01120a0mr5805994e87.51.1732959336835; 
 Sat, 30 Nov 2024 01:35:36 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df64432d6sm722760e87.85.2024.11.30.01.35.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2024 01:35:35 -0800 (PST)
Date: Sat, 30 Nov 2024 11:35:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Nikolaus Voss <nv@vosn.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Liu Ying <victor.liu@nxp.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Fabio Estevam <festevam@denx.de>, Marek Vasut <marex@denx.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, nikolaus.voss@haag-streit.com
Subject: Re: [PATCH] drm: bridge: fsl-ldb: fixup mode on freq mismatch
Message-ID: <lio6natmz5d5hdmdxwuj5ghfbpl4medb2orhw2m27m6g3rvaga@tanmydgbufg2>
References: <20241126172610.AD8B51622C@mail.steuer-voss.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126172610.AD8B51622C@mail.steuer-voss.de>
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

On Tue, Nov 26, 2024 at 04:45:54PM +0100, Nikolaus Voss wrote:
> LDB clock has to be a fixed multiple of the pixel clock.
> As LDB and pixel clock are derived from different clock sources
> (at least on imx8mp), this constraint cannot be satisfied for
> any pixel clock, which leads to flickering and incomplete
> lines on the attached display.
> 
> To overcome this, check this condition in mode_fixup() and
> adapt the pixel clock accordingly.
> 
> Cc: <stable@vger.kernel.org>
> 
> Signed-off-by: Nikolaus Voss <nv@vosn.de>
> ---
>  drivers/gpu/drm/bridge/fsl-ldb.c | 40 ++++++++++++++++++++++++++++----
>  1 file changed, 36 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
> index 0e4bac7dd04ff..e341341b8c600 100644
> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> @@ -104,12 +104,14 @@ static inline struct fsl_ldb *to_fsl_ldb(struct drm_bridge *bridge)
>  	return container_of(bridge, struct fsl_ldb, bridge);
>  }
>  
> +static unsigned int fsl_ldb_link_freq_factor(const struct fsl_ldb *fsl_ldb)
> +{
> +	return fsl_ldb_is_dual(fsl_ldb) ? 3500 : 7000;
> +}
> +
>  static unsigned long fsl_ldb_link_frequency(struct fsl_ldb *fsl_ldb, int clock)
>  {
> -	if (fsl_ldb_is_dual(fsl_ldb))
> -		return clock * 3500;
> -	else
> -		return clock * 7000;
> +	return clock * fsl_ldb_link_freq_factor(fsl_ldb);
>  }
>  
>  static int fsl_ldb_attach(struct drm_bridge *bridge,
> @@ -121,6 +123,35 @@ static int fsl_ldb_attach(struct drm_bridge *bridge,
>  				 bridge, flags);
>  }
>  
> +static bool fsl_ldb_mode_fixup(struct drm_bridge *bridge,
> +				const struct drm_display_mode *mode,
> +				struct drm_display_mode *adjusted_mode)

The driver uses atomic callbacks. Please use .atomic_check() instead.

> +{
> +	const struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
> +	unsigned long requested_link_freq =
> +		mode->clock * fsl_ldb_link_freq_factor(fsl_ldb);
> +	unsigned long freq = clk_round_rate(fsl_ldb->clk, requested_link_freq);
> +
> +	if (freq != requested_link_freq) {
> +		/*
> +		 * this will lead to flicker and incomplete lines on
> +		 * the attached display, adjust the CRTC clock
> +		 * accordingly.
> +		 */
> +		int pclk = freq / fsl_ldb_link_freq_factor(fsl_ldb);
> +
> +		if (adjusted_mode->clock != pclk) {
> +			dev_warn(fsl_ldb->dev, "Adjusted pixel clk to match LDB clk (%d kHz -> %d kHz)!\n",
> +				 adjusted_mode->clock, pclk);
> +
> +			adjusted_mode->clock = pclk;
> +			adjusted_mode->crtc_clock = pclk;
> +		}
> +	}
> +
> +	return true;
> +}
> +
>  static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
>  				  struct drm_bridge_state *old_bridge_state)
>  {
> @@ -280,6 +311,7 @@ fsl_ldb_mode_valid(struct drm_bridge *bridge,
>  
>  static const struct drm_bridge_funcs funcs = {
>  	.attach = fsl_ldb_attach,
> +	.mode_fixup = fsl_ldb_mode_fixup,
>  	.atomic_enable = fsl_ldb_atomic_enable,
>  	.atomic_disable = fsl_ldb_atomic_disable,
>  	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
