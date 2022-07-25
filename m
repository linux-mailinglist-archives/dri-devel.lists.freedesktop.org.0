Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 577B857FD85
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 12:31:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECF3A18AEEB;
	Mon, 25 Jul 2022 10:31:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A53D711BD44
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 10:31:32 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id k11so14858469wrx.5
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 03:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QR4thViojhLm7m3iVqTAzOPrEuZ+oboQVEbkcRYR7U0=;
 b=hcY3ebDhxmUgKAKSOPUOX7d/LMYdV3cijN2N6OfC0kvVYjMwOvmOolx+2NETIKYqUp
 GPy3YFMR7smmOlatz8CKT+4p2UQ+6lI9Ejv06f+y6zEFBSmLUPFbbscFbBBsOCvH434Q
 ke8WXFQ+uXl36Kdevvs6uhTIaQQgtIFRovUfQ/RDq3AHQ469OhSceGOKRnPmFWjpxVnH
 VERQ2rtptnToPx6leEXxAAby7RDypiZaQady2IbBpsvPlsYJ0uSwLW6l0adFiFhqOZ8D
 XJZDsGiJcpWWsVtF7ngMWVpb9VQHwHEkKK2RVLip5CsQWVUMkj1jqMMhHMjq3wvU4bke
 J0IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QR4thViojhLm7m3iVqTAzOPrEuZ+oboQVEbkcRYR7U0=;
 b=CUifwWk0+Jz9rUw4848QdbkaXFWio/VvDXVat5FItWoebjwv8yXTQiUIuqykz9e6O0
 5PZQxNGg3v4EX+NBJh+Bt+29rYI4XfF4bU8sloqA3z0JUgZH4AJL9JHkpoDk8rFbrE8M
 E+H7j0DVtfrB0iMw2bmaYHZB8DNoRJa5bGSK1KXvx4ibrpWqlQ4zdzTu5hPw0d+y0Q5W
 PtygNnBYBVaARkgqP4QChXci6B+l11rarEfwbAZ3sC7Kwm5NZxjNyNnFs1cqnZ05dZ+k
 gDs2WT3CajcTIXJCxvpmdfTGhD+SA2gdD1F8s7lxpHHjx/pdcWb/iaCerdPffUu8Xgtz
 /avA==
X-Gm-Message-State: AJIora/5E5Ai0LcaqGyKkUGlv1z25EM1qOCAAYQvZ/XNwxxkbSFwSFHP
 j9W6Nj2zX6YihrBbmT66bo0ZHg==
X-Google-Smtp-Source: AGRyM1uhInd5p9lSRbYGnaq9oTNYSYBtNWlkq9wyaVzmMkSkg4hYhWboyJgYIo9QbRHYBeJSc2cjCg==
X-Received: by 2002:a5d:584c:0:b0:21e:7f48:bf19 with SMTP id
 i12-20020a5d584c000000b0021e7f48bf19mr5190179wrf.474.1658745090915; 
 Mon, 25 Jul 2022 03:31:30 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 l18-20020a05600c1d1200b003a04d19dab3sm29367538wms.3.2022.07.25.03.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 03:31:30 -0700 (PDT)
Date: Mon, 25 Jul 2022 11:31:28 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Subject: Re: [PATCH v6 13/13] video: backlight: mt6370: Add MediaTek MT6370
 support
Message-ID: <20220725103128.xtaw2c4y5fobowg7@maple.lan>
References: <20220722102407.2205-1-peterwu.pub@gmail.com>
 <20220722102407.2205-14-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220722102407.2205-14-peterwu.pub@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, heikki.krogerus@linux.intel.com,
 krzysztof.kozlowski+dt@linaro.org, alice_chen@richtek.com,
 linux-iio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 lgirdwood@gmail.com, cy_huang@richtek.com, pavel@ucw.cz, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, deller@gmx.de, robh+dt@kernel.org,
 andy.shevchenko@gmail.com, chunfeng.yun@mediatek.com, linux@roeck-us.net,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org, szunichen@gmail.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, jingoohan1@gmail.com,
 linux-usb@vger.kernel.org, sre@kernel.org, linux-kernel@vger.kernel.org,
 chiaen_wu@richtek.com, gregkh@linuxfoundation.org, jic23@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 22, 2022 at 06:24:07PM +0800, ChiaEn Wu wrote:
> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> index a003e02..846dbe7 100644
> --- a/drivers/video/backlight/Kconfig
> +++ b/drivers/video/backlight/Kconfig
> @@ -268,6 +268,18 @@ config BACKLIGHT_MAX8925
>  	  If you have a LCD backlight connected to the WLED output of MAX8925
>  	  WLED output, say Y here to enable this driver.
>
> +config BACKLIGHT_MT6370
> +	tristate "MediaTek MT6370 Backlight Driver"
> +	depends on MFD_MT6370
> +	help
> +	  This enables support for Mediatek MT6370 Backlight driver.
> +	  It's commonly used to drive the display WLED. There are 4 channels
> +	  inside, and each channel supports up to 30mA of current capability
> +	  with 2048 current steps in exponential or linear mapping curves.

Does the MT6372 support more steps than this? In other words does it use
a fourteen bit scale or does it use an 11-bit scale at a different
register location?


> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called "mt6370-backlight".
> +
> [...]
> diff --git a/drivers/video/backlight/mt6370-backlight.c b/drivers/video/backlight/mt6370-backlight.c
> new file mode 100644
> index 0000000..ba00a8f
> --- /dev/null
> +++ b/drivers/video/backlight/mt6370-backlight.c
> [...]
> +static int mt6370_bl_update_status(struct backlight_device *bl_dev)
> +{
> +	struct mt6370_priv *priv = bl_get_data(bl_dev);
> +	int brightness = backlight_get_brightness(bl_dev);
> +	unsigned int enable_val;
> +	u8 brightness_val[2];
> +	int ret;
> +
> +	if (brightness) {
> +		brightness_val[0] = (brightness - 1) & MT6370_BL_DIM2_MASK;
> +		brightness_val[1] = (brightness - 1) >> fls(MT6370_BL_DIM2_MASK);
> +
> +		/*
> +		 * To make MT6372 using 14 bits to control the brightness
> +		 * backward compatible with 11 bits brightness control
> +		 * (like MT6370 and MT6371 do), we left shift the value
> +		 * and pad with 1 to remaining bits. Hence, the MT6372's
> +		 * backlight brightness will be almost the same as MT6370's
> +		 * and MT6371's.
> +		 */
> +		if (priv->vid_type == MT6370_VID_6372) {
> +			brightness_val[0] <<= MT6370_BL_DIM2_6372_SHIFT;
> +			brightness_val[0] |= MT6370_BL_DUMMY_6372_MASK;
> +		}

This somewhat depends on the answer to the first question above, but
what is the point of this shifting? If the range is 14-bit then the
driver should set max_brightness to 16384 and present the full range of
the MT6372 to the user.

Especially when using linear mappings (which are a totally pointless
scale to use for a backlight) the extra steps are useful for backlight
animation.


Daniel.
