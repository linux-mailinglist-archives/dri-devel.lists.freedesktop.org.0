Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDCD50D4FA
	for <lists+dri-devel@lfdr.de>; Sun, 24 Apr 2022 22:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A92D10E2FB;
	Sun, 24 Apr 2022 20:02:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB0F10E2FB
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Apr 2022 20:02:12 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id y3so5572622ejo.12
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Apr 2022 13:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dQ2zuEEM9D4B8zP2luv/uhpKwe/qIrjxdV2ITP0d7oQ=;
 b=b0bf8Ie49UnPf7zAmygL7y0u+9QaBQhBOx1Jv+qY8yR6F5vFuxiyNVnlzg7aLkWuxP
 llC0yL4GgIugC+csQ3TrIgKvW9q0p875p+6w30k1+cc5/rYs9f9O8eBFQ2Cu11rZNzBz
 YXUz6Gw3Q2wMSTTNKCgh8+ohYLIbx/Xl8u1wFdQgxrbL85P4izMIvaNgL+GZm7pkYRiS
 RK+3UyUtKkO1Tv2+esNGuz57tP4j1VMC9hOKblJ8aBTkArnBrl1OWcjk/xhTVNI7ep5Z
 nS3wNNN5P9HzggE5x1rqECW/bwri1hk13dnkhbddagnE7PNf870vvI8bCuUuvEFhRSEI
 ECCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dQ2zuEEM9D4B8zP2luv/uhpKwe/qIrjxdV2ITP0d7oQ=;
 b=w2arP73cduvcyAkbx6MBmo/+P6oHcVyE0IOnf5qwZb3jvwLqCnAMMIUBedX1+BSJZH
 U9Gv9G8kjXHd713WnyhnXITfCjSlIN6yGJxU9beAV3V4nYVwRFYNCAljtQH+P48XpwNQ
 rqQWc1+NhBHkSM+Sr8PAhWyvcce16zdr6cg07J8o312h9Ef0Ku66vInt8GBqfR4OSUx1
 Cu5VFc7eaeSLGFhJEjJNKwO4/widaxHP2JzOxv3WKPxnVxRe1kuwn6ZdFX+9XmCw7G+3
 HLnqQT2dUW6ZFWs28feg55Zj8laDe9o9OGotPABXLQfBM3770haBhLZ+82VmNxWTBDzI
 Jp0w==
X-Gm-Message-State: AOAM5324fZw6pZDPDic0WNBD521Lq01h8FdWd3OgkYRD0ifDVXiuWYYh
 /IAEcR0LXEv5IffPhRiDXi4=
X-Google-Smtp-Source: ABdhPJytztWx8tUy51Xm/BMwFgB7UytfXDaFNrw+r4wJjoo0S7TKJiBtHMUiNcrlryGxs0rAah+MuA==
X-Received: by 2002:a17:907:3f9c:b0:6f0:28d1:3ad6 with SMTP id
 hr28-20020a1709073f9c00b006f028d13ad6mr13422972ejc.365.1650830530894; 
 Sun, 24 Apr 2022 13:02:10 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-32-107.static.triera.net.
 [86.58.32.107]) by smtp.gmail.com with ESMTPSA id
 d2-20020a170906040200b006e84213fdffsm2921083eja.201.2022.04.24.13.02.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Apr 2022 13:02:10 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
 Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v3 10/14] drm/sun4i: csc: Add support for the new MMIO
 layout
Date: Sun, 24 Apr 2022 22:02:09 +0200
Message-ID: <1814351.tdWV9SEqCh@kista>
In-Reply-To: <20220424162633.12369-11-samuel@sholland.org>
References: <20220424162633.12369-1-samuel@sholland.org>
 <20220424162633.12369-11-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: devicetree@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne nedelja, 24. april 2022 ob 18:26:28 CEST je Samuel Holland napisal(a):
> D1 changes the MMIO offsets for the CSC blocks in the first mixer. The
> mixers' ccsc property is used as an index into the ccsc_base array. Use
> an enumeration to describe this index, and add the new set of offsets.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej Skrabec

> ---
> 
> (no changes since v2)
> 
> Changes in v2:
>  - Use an enumeration for the ccsc value.
> 
>  drivers/gpu/drm/sun4i/sun8i_csc.c   |  7 ++++---
>  drivers/gpu/drm/sun4i/sun8i_csc.h   |  1 +
>  drivers/gpu/drm/sun4i/sun8i_mixer.c | 18 +++++++++---------
>  drivers/gpu/drm/sun4i/sun8i_mixer.h | 14 ++++++++++----
>  4 files changed, 24 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/
sun8i_csc.c
> index 9bd62de0c288..58480d8e4f70 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_csc.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
> @@ -8,9 +8,10 @@
>  #include "sun8i_csc.h"
>  #include "sun8i_mixer.h"
>  
> -static const u32 ccsc_base[2][2] = {
> -	{CCSC00_OFFSET, CCSC01_OFFSET},
> -	{CCSC10_OFFSET, CCSC11_OFFSET},
> +static const u32 ccsc_base[][2] = {
> +	[CCSC_MIXER0_LAYOUT]	= {CCSC00_OFFSET, CCSC01_OFFSET},
> +	[CCSC_MIXER1_LAYOUT]	= {CCSC10_OFFSET, CCSC11_OFFSET},
> +	[CCSC_D1_MIXER0_LAYOUT]	= {CCSC00_OFFSET, 
CCSC01_D1_OFFSET},
>  };
>  
>  /*
> diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.h b/drivers/gpu/drm/sun4i/
sun8i_csc.h
> index 022cafa6c06c..828b86fd0cab 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_csc.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_csc.h
> @@ -13,6 +13,7 @@ struct sun8i_mixer;
>  /* VI channel CSC units offsets */
>  #define CCSC00_OFFSET 0xAA050
>  #define CCSC01_OFFSET 0xFA050
> +#define CCSC01_D1_OFFSET 0xFA000
>  #define CCSC10_OFFSET 0xA0000
>  #define CCSC11_OFFSET 0xF0000
>  
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/
sun8i_mixer.c
> index 6b1711a9a71f..4ce593c99807 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> @@ -564,7 +564,7 @@ static int sun8i_mixer_remove(struct platform_device 
*pdev)
>  }
>  
>  static const struct sun8i_mixer_cfg sun8i_a83t_mixer0_cfg = {
> -	.ccsc		= 0,
> +	.ccsc		= CCSC_MIXER0_LAYOUT,
>  	.scaler_mask	= 0xf,
>  	.scanline_yuv	= 2048,
>  	.ui_num		= 3,
> @@ -572,7 +572,7 @@ static const struct sun8i_mixer_cfg 
sun8i_a83t_mixer0_cfg = {
>  };
>  
>  static const struct sun8i_mixer_cfg sun8i_a83t_mixer1_cfg = {
> -	.ccsc		= 1,
> +	.ccsc		= CCSC_MIXER1_LAYOUT,
>  	.scaler_mask	= 0x3,
>  	.scanline_yuv	= 2048,
>  	.ui_num		= 1,
> @@ -580,7 +580,7 @@ static const struct sun8i_mixer_cfg 
sun8i_a83t_mixer1_cfg = {
>  };
>  
>  static const struct sun8i_mixer_cfg sun8i_h3_mixer0_cfg = {
> -	.ccsc		= 0,
> +	.ccsc		= CCSC_MIXER0_LAYOUT,
>  	.mod_rate	= 432000000,
>  	.scaler_mask	= 0xf,
>  	.scanline_yuv	= 2048,
> @@ -589,7 +589,7 @@ static const struct sun8i_mixer_cfg sun8i_h3_mixer0_cfg 
= {
>  };
>  
>  static const struct sun8i_mixer_cfg sun8i_r40_mixer0_cfg = {
> -	.ccsc		= 0,
> +	.ccsc		= CCSC_MIXER0_LAYOUT,
>  	.mod_rate	= 297000000,
>  	.scaler_mask	= 0xf,
>  	.scanline_yuv	= 2048,
> @@ -598,7 +598,7 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer0_cfg 
= {
>  };
>  
>  static const struct sun8i_mixer_cfg sun8i_r40_mixer1_cfg = {
> -	.ccsc		= 1,
> +	.ccsc		= CCSC_MIXER1_LAYOUT,
>  	.mod_rate	= 297000000,
>  	.scaler_mask	= 0x3,
>  	.scanline_yuv	= 2048,
> @@ -611,12 +611,12 @@ static const struct sun8i_mixer_cfg 
sun8i_v3s_mixer_cfg = {
>  	.ui_num = 1,
>  	.scaler_mask = 0x3,
>  	.scanline_yuv = 2048,
> -	.ccsc = 0,
> +	.ccsc = CCSC_MIXER0_LAYOUT,
>  	.mod_rate = 150000000,
>  };
>  
>  static const struct sun8i_mixer_cfg sun50i_a64_mixer0_cfg = {
> -	.ccsc		= 0,
> +	.ccsc		= CCSC_MIXER0_LAYOUT,
>  	.mod_rate	= 297000000,
>  	.scaler_mask	= 0xf,
>  	.scanline_yuv	= 4096,
> @@ -625,7 +625,7 @@ static const struct sun8i_mixer_cfg 
sun50i_a64_mixer0_cfg = {
>  };
>  
>  static const struct sun8i_mixer_cfg sun50i_a64_mixer1_cfg = {
> -	.ccsc		= 1,
> +	.ccsc		= CCSC_MIXER1_LAYOUT,
>  	.mod_rate	= 297000000,
>  	.scaler_mask	= 0x3,
>  	.scanline_yuv	= 2048,
> @@ -634,7 +634,7 @@ static const struct sun8i_mixer_cfg 
sun50i_a64_mixer1_cfg = {
>  };
>  
>  static const struct sun8i_mixer_cfg sun50i_h6_mixer0_cfg = {
> -	.ccsc		= 0,
> +	.ccsc		= CCSC_MIXER0_LAYOUT,
>  	.is_de3		= true,
>  	.mod_rate	= 600000000,
>  	.scaler_mask	= 0xf,
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/
sun8i_mixer.h
> index 5b3fbee18671..85c94884fb9a 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
> @@ -141,6 +141,15 @@
>  #define SUN50I_MIXER_CDC0_EN			0xd0000
>  #define SUN50I_MIXER_CDC1_EN			0xd8000
>  
> +enum {
> +	/* First mixer or second mixer with VEP support. */
> +	CCSC_MIXER0_LAYOUT,
> +	/* Second mixer without VEP support. */
> +	CCSC_MIXER1_LAYOUT,
> +	/* First mixer with the MMIO layout found in the D1 SoC. */
> +	CCSC_D1_MIXER0_LAYOUT,
> +};
> +
>  /**
>   * struct sun8i_mixer_cfg - mixer HW configuration
>   * @vi_num: number of VI channels
> @@ -149,10 +158,7 @@
>   *	First, scaler supports for VI channels is defined and after that, 
scaler
>   *	support for UI channels. For example, if mixer has 2 VI channels 
without
>   *	scaler and 2 UI channels with scaler, bitmask would be 0xC.
> - * @ccsc: select set of CCSC base addresses
> - *	Set value to 0 if this is first mixer or second mixer with VEP 
support.
> - *	Set value to 1 if this is second mixer without VEP support. Other 
values
> - *	are invalid.
> + * @ccsc: select set of CCSC base addresses from the enumeration above.
>   * @mod_rate: module clock rate that needs to be set in order to have
>   *	a functional block.
>   * @is_de3: true, if this is next gen display engine 3.0, false otherwise.
> -- 
> 2.35.1
> 
> 


