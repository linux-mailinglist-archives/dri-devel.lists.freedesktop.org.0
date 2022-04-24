Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF1550D500
	for <lists+dri-devel@lfdr.de>; Sun, 24 Apr 2022 22:08:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55AC410E6C4;
	Sun, 24 Apr 2022 20:08:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E5910E6C4
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Apr 2022 20:08:16 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id i27so25941208ejd.9
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Apr 2022 13:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sudUzil2TeGtGGqvHjugQsy8d/UrN+DwGR4+Ef4x1Kg=;
 b=maOBumgDQGBkUzklplB1UFE2bwWZfJQfJTafW0PmOMkFWVnN2oeXdc7HPJnueqqqV/
 YNnhAncdsA+C1p1GcZ98NsTyatxwo0LXVBs1NiLmxnINTWSbMfEOVnihqXtTcDMhSTKG
 EmHkhppovTi80fY72HGDLMYCZUe/+FpITY4xmjr0qPR1k9TfcVBX0rUesp0oQ9mIM4Jj
 4xJx3E3XfAGdqzzJwF644y9q2lZfCerI20QlBzZ/mJelnFMlMTaA4S7y4At4iU+I5iKO
 f7yOxm/FAY2uizoM5Pk9kLXG+U9FB3ClSK2JvfFC7bMsQxMNWB0b6w9/QBdNDfuVCZ94
 IrDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sudUzil2TeGtGGqvHjugQsy8d/UrN+DwGR4+Ef4x1Kg=;
 b=LV3b8OdgHf2+trmEo1sfMPBtzsOpYqrgj5tucLZQcOrifO7FknaX8Pgl5jjTKvMcRm
 Owst3PF81v+jEMz4yFVze+Xd/K7CxrUb7bRm7mSATCVatN33Ll0Wi5QIPI56R2+SFmN4
 z0S3XpkJsgyq/v6hFUQoQm4KX/uXTAoTFRq5CG2ehNqRYvq4duhS1YR32yfpo5+juwYa
 1GaWMEFmsqorKrz+1bHyWtfU1IYwFSGY51CkqHFOqqcahAiWyRRfDL8VcXOCF8ik0zdg
 QPCJYFy9JXe/gC4WO+OphDPLfguEM/3WwEkV3jvysWTvA/mmVpyBqRh8/ZNIJq48sqMJ
 JV5Q==
X-Gm-Message-State: AOAM531B8p2mQPEOYcc1kCg47kvl3LGu1+0kHzKnfYKq0vX3jM7qjC4U
 T8kFL/0JpXly/igpsHDyEuE=
X-Google-Smtp-Source: ABdhPJyHJKKOxw8s1yJlNHqrD4UJnk4HSPgCDiT1JHiiYrtZFxHbUJW0QWUiJ2r37sWgPoDPw2ht3A==
X-Received: by 2002:a17:907:7704:b0:6cf:48ac:b4a8 with SMTP id
 kw4-20020a170907770400b006cf48acb4a8mr13128991ejc.305.1650830895109; 
 Sun, 24 Apr 2022 13:08:15 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-32-107.static.triera.net.
 [86.58.32.107]) by smtp.gmail.com with ESMTPSA id
 p12-20020a50c94c000000b00425c48132bfsm2982323edh.55.2022.04.24.13.08.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Apr 2022 13:08:14 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
 Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v3 13/14] drm/sun4i: Add support for D1 TCONs
Date: Sun, 24 Apr 2022 22:08:13 +0200
Message-ID: <3164754.aeNJFYEL58@kista>
In-Reply-To: <20220424162633.12369-14-samuel@sholland.org>
References: <20220424162633.12369-1-samuel@sholland.org>
 <20220424162633.12369-14-samuel@sholland.org>
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

Dne nedelja, 24. april 2022 ob 18:26:31 CEST je Samuel Holland napisal(a):
> D1 has a TCON TOP, so its quirks are similar to those for the R40 TCONs.
> While there are some register changes, the part of the TCON TV supported
> by the driver matches the R40 quirks, so that quirks structure can be
> reused. D1 has the first supported TCON LCD with a TCON TOP, so the TCON
> LCD needs a new quirks structure.
> 
> D1's TCON LCD hardware supports LVDS; in fact it provides dual-link LVDS
> from a single TCON. However, it comes with a brand new LVDS PHY. Since
> this PHY has not been tested, leave out LVDS driver support for now.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej Skrabec

> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/sun4i/sun4i_tcon.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/
sun4i_tcon.c
> index 88db2d2a9336..2ee158aaeb9e 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -1542,6 +1542,12 @@ static const struct sun4i_tcon_quirks 
sun9i_a80_tcon_tv_quirks = {
>  	.needs_edp_reset = true,
>  };
>  
> +static const struct sun4i_tcon_quirks sun20i_d1_lcd_quirks = {
> +	.has_channel_0		= true,
> +	.dclk_min_div		= 1,
> +	.set_mux		= sun8i_r40_tcon_tv_set_mux,
> +};
> +
>  /* sun4i_drv uses this list to check if a device node is a TCON */
>  const struct of_device_id sun4i_tcon_of_table[] = {
>  	{ .compatible = "allwinner,sun4i-a10-tcon", .data = 
&sun4i_a10_quirks },
> @@ -1559,6 +1565,8 @@ const struct of_device_id sun4i_tcon_of_table[] = {
>  	{ .compatible = "allwinner,sun8i-v3s-tcon", .data = 
&sun8i_v3s_quirks },
>  	{ .compatible = "allwinner,sun9i-a80-tcon-lcd", .data = 
&sun9i_a80_tcon_lcd_quirks },
>  	{ .compatible = "allwinner,sun9i-a80-tcon-tv", .data = 
&sun9i_a80_tcon_tv_quirks },
> +	{ .compatible = "allwinner,sun20i-d1-tcon-lcd", .data = 
&sun20i_d1_lcd_quirks },
> +	{ .compatible = "allwinner,sun20i-d1-tcon-tv", .data = 
&sun8i_r40_tv_quirks },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, sun4i_tcon_of_table);
> -- 
> 2.35.1
> 
> 


