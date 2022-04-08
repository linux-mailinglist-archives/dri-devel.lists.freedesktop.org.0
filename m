Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F9D4F8FCE
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 09:49:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40AAC10E131;
	Fri,  8 Apr 2022 07:49:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00AB210E119
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 07:49:13 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id q20so4941356wmq.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 00:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=SWpszhyEBEa7rNr2Yt/uZaQzpgwI+84JhC50zBu0zwo=;
 b=C5iJj/Boy7aENXH76q+tpOfcaNGntAIY81YRiAH0SO0XEbTSMGp+0nIY7wak9PT8Ce
 xK2Cgi8uvYVjygdDAl3TZ0D2TOu2fBY9kEsXTQdhEIKG9P1R8NzRr5GTxgssds6BoiPh
 k581K2cVCqaRRcpCc0FTVojbS1DarOPsdx4NUlfH1bYhMX2lWnfE2K2c26Iv0PV9J1ce
 bH89DtLRxetafk7Y3Yc2ZPOiJCdc8svK0Y/0pW6tmwDxP68D0tWvbNWBUgXtPAhIvnDI
 OPVirjFeyBBrn5Yk8Dfby2oOPicOfEfBYsjhnkW7YOUNzpyZoYiYodSHUmUcF/euPCvc
 K0FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=SWpszhyEBEa7rNr2Yt/uZaQzpgwI+84JhC50zBu0zwo=;
 b=7WyvYSz4eb3QBUe9qfLlGRbKUE0okI8CcrtREs3HpF4Il0fOfQaEj3bFknwMHB5xYU
 YAfIbtRBBjIslyorDn6BP4Fky/zAhWH4DuqJg82xnAaqUOJ/SzpdIR4Fr4vr+wNVNXHk
 wOME4TTQOqk3gd9m+DqFjJ5EpuXO4aaOl5fHMACvh1OT1tZ/Xf87xsPR+0/OzTpl98+L
 RnXcdLXqgBNVCl3vXT9YiX1zQwsi5c9yKMdZnfsqW7ocyCle+xYWCW9P0pCo2QnrZTnD
 m+VW4bPg2GJe2c/F5w5MM13s3lOKUeStSMVz0oCG+t9r60BUN9R0rLd5mgxCV5x9r8kp
 LZWg==
X-Gm-Message-State: AOAM5302RFr+1exK0txgkMpwZuhM0cTUMrAga1UdO7dRz3r6UUp2eV2f
 KjDgCxCXX5Sq4/wWLKDZ48uX0Q==
X-Google-Smtp-Source: ABdhPJxEUP0kNqnBesTvyWuNSGfhjJhVPnNDnp1rOA+CchP4oe+GBkjWnIcA5Xc7hb7jvlr467WQ9Q==
X-Received: by 2002:a7b:cb83:0:b0:37e:bc50:3c6b with SMTP id
 m3-20020a7bcb83000000b0037ebc503c6bmr16133169wmi.67.1649404152364; 
 Fri, 08 Apr 2022 00:49:12 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:eacd:ce6:e294:acd1?
 ([2001:861:44c0:66c0:eacd:ce6:e294:acd1])
 by smtp.gmail.com with ESMTPSA id
 3-20020a5d47a3000000b0020412ba45f6sm22710462wrb.8.2022.04.08.00.49.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 00:49:11 -0700 (PDT)
Message-ID: <58e38622-a041-3e5c-3dca-fa95cd5f59be@baylibre.com>
Date: Fri, 8 Apr 2022 09:49:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/5] drm/solomon: Move device info from ssd130x-i2c to the
 core driver
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220407200205.28838-1-javierm@redhat.com>
 <20220407200205.28838-5-javierm@redhat.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220407200205.28838-5-javierm@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Chen-Yu Tsai <wens@kernel.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Mark Brown <broonie@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 07/04/2022 22:02, Javier Martinez Canillas wrote:
> These are declared in the ssd130x-i2c transport driver but the information
> is not I2C specific and could be used by other SSD130x transport drivers.
> 
> Move them to the ssd130x core driver and just set the OF device entries to
> an ID that could be used to lookup the correct device into from an array.
> 
> While being there, also move the SSD130X_DATA and SSD130X_COMMAND control
> bytes. Since even though are used by the I2C interface, it could also be
> useful for other transport protocols such as SPI.
> 
> Suggested-by: Chen-Yu Tsai <wens@kernel.org>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
> 
>   drivers/gpu/drm/solomon/ssd130x-i2c.c | 51 ++++-------------------
>   drivers/gpu/drm/solomon/ssd130x.c     | 60 +++++++++++++++++++++++++--
>   drivers/gpu/drm/solomon/ssd130x.h     | 13 ++++++
>   3 files changed, 78 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/gpu/drm/solomon/ssd130x-i2c.c b/drivers/gpu/drm/solomon/ssd130x-i2c.c
> index a469679548f8..aa6cc2cb54f9 100644
> --- a/drivers/gpu/drm/solomon/ssd130x-i2c.c
> +++ b/drivers/gpu/drm/solomon/ssd130x-i2c.c
> @@ -53,76 +53,43 @@ static void ssd130x_i2c_shutdown(struct i2c_client *client)
>   	ssd130x_shutdown(ssd130x);
>   }
>   
> -static struct ssd130x_deviceinfo ssd130x_sh1106_deviceinfo = {
> -	.default_vcomh = 0x40,
> -	.default_dclk_div = 1,
> -	.default_dclk_frq = 5,
> -	.page_mode_only = 1,
> -};
> -
> -static struct ssd130x_deviceinfo ssd130x_ssd1305_deviceinfo = {
> -	.default_vcomh = 0x34,
> -	.default_dclk_div = 1,
> -	.default_dclk_frq = 7,
> -};
> -
> -static struct ssd130x_deviceinfo ssd130x_ssd1306_deviceinfo = {
> -	.default_vcomh = 0x20,
> -	.default_dclk_div = 1,
> -	.default_dclk_frq = 8,
> -	.need_chargepump = 1,
> -};
> -
> -static struct ssd130x_deviceinfo ssd130x_ssd1307_deviceinfo = {
> -	.default_vcomh = 0x20,
> -	.default_dclk_div = 2,
> -	.default_dclk_frq = 12,
> -	.need_pwm = 1,
> -};
> -
> -static struct ssd130x_deviceinfo ssd130x_ssd1309_deviceinfo = {
> -	.default_vcomh = 0x34,
> -	.default_dclk_div = 1,
> -	.default_dclk_frq = 10,
> -};
> -
>   static const struct of_device_id ssd130x_of_match[] = {
>   	{
>   		.compatible = "sinowealth,sh1106-i2c",
> -		.data = &ssd130x_sh1106_deviceinfo,
> +		.data = SH1106_ID,
>   	},
>   	{
>   		.compatible = "solomon,ssd1305-i2c",
> -		.data = &ssd130x_ssd1305_deviceinfo,
> +		.data = (void *)SSD1305_ID,
>   	},
>   	{
>   		.compatible = "solomon,ssd1306-i2c",
> -		.data = &ssd130x_ssd1306_deviceinfo,
> +		.data = (void *)SSD1306_ID,
>   	},
>   	{
>   		.compatible = "solomon,ssd1307-i2c",
> -		.data = &ssd130x_ssd1307_deviceinfo,
> +		.data = (void *)SSD1307_ID,
>   	},
>   	{
>   		.compatible = "solomon,ssd1309-i2c",
> -		.data = &ssd130x_ssd1309_deviceinfo,
> +		.data = (void *)SSD1309_ID,
>   	},
>   	/* Deprecated but remain for backward compatibility */
>   	{
>   		.compatible = "solomon,ssd1305fb-i2c",
> -		.data = &ssd130x_ssd1305_deviceinfo,
> +		.data = (void *)SSD1305_ID,
>   	},
>   	{
>   		.compatible = "solomon,ssd1306fb-i2c",
> -		.data = &ssd130x_ssd1306_deviceinfo,
> +		.data = (void *)SSD1306_ID,
>   	},
>   	{
>   		.compatible = "solomon,ssd1307fb-i2c",
> -		.data = &ssd130x_ssd1307_deviceinfo,
> +		.data = (void *)SSD1307_ID,
>   	},
>   	{
>   		.compatible = "solomon,ssd1309fb-i2c",
> -		.data = &ssd130x_ssd1309_deviceinfo,
> +		.data = (void *)SSD1309_ID,
>   	},
>   	{ /* sentinel */ }
>   };
> diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
> index a7e784518c69..1f00fd3c0023 100644
> --- a/drivers/gpu/drm/solomon/ssd130x.c
> +++ b/drivers/gpu/drm/solomon/ssd130x.c
> @@ -39,11 +39,9 @@
>   #define DRIVER_MAJOR	1
>   #define DRIVER_MINOR	0
>   
> -#define SSD130X_DATA				0x40
> -#define SSD130X_COMMAND				0x80
> -
>   #define SSD130X_PAGE_COL_START_LOW		0x00
>   #define SSD130X_PAGE_COL_START_HIGH		0x10
> +
>   #define SSD130X_SET_ADDRESS_MODE		0x20
>   #define SSD130X_SET_COL_RANGE			0x21
>   #define SSD130X_SET_PAGE_RANGE			0x22
> @@ -94,6 +92,55 @@
>   
>   #define MAX_CONTRAST 255
>   
> +static struct ssd130x_deviceinfo ssd130x_variants[] =  {
> +	{
> +		.default_vcomh = 0x40,
> +		.default_dclk_div = 1,
> +		.default_dclk_frq = 5,
> +		.page_mode_only = 1,
> +	},

Why not [SH1106_ID] = {

and later:

if (variant < NR_SSD130X_VARIANTS)
	ssd130x->device_info = ssd130x_variants[variant];

instead of less efficient ssd13x_variant_to_info ?

> +	{
> +		.variant = SSD1305_ID,
> +		.default_vcomh = 0x34,
> +		.default_dclk_div = 1,
> +		.default_dclk_frq = 7,
> +	},
> +	{
> +		.variant = SSD1306_ID,
> +		.default_vcomh = 0x20,
> +		.default_dclk_div = 1,
> +		.default_dclk_frq = 8,
> +		.need_chargepump = 1,
> +	},
> +	{
> +		.variant = SSD1307_ID,
> +		.default_vcomh = 0x20,
> +		.default_dclk_div = 2,
> +		.default_dclk_frq = 12,
> +		.need_pwm = 1,
> +	},
> +	{
> +		.variant = SSD1309_ID,
> +		.default_vcomh = 0x34,
> +		.default_dclk_div = 1,
> +		.default_dclk_frq = 10,
> +	}
> +};
> +
> +static const struct ssd130x_deviceinfo *ssd13x_variant_to_info(enum ssd130x_variants variant)
> +{
> +	int i;
> +	const struct ssd130x_deviceinfo *info;
> +
> +	for (i = 0; i < ARRAY_SIZE(ssd130x_variants); i++) {
> +		info = &ssd130x_variants[i];
> +		if (info->variant == variant)
> +			return info;
> +	}
> +
> +	return NULL;
> +}
> +
>   static inline struct ssd130x_device *drm_to_ssd130x(struct drm_device *drm)
>   {
>   	return container_of(drm, struct ssd130x_device, drm);
> @@ -846,6 +893,7 @@ static int ssd130x_get_resources(struct ssd130x_device *ssd130x)
>   struct ssd130x_device *ssd130x_probe(struct device *dev, struct regmap *regmap)
>   {
>   	struct ssd130x_device *ssd130x;
> +	enum ssd130x_variants variant;
>   	struct backlight_device *bl;
>   	struct drm_device *drm;
>   	int ret;
> @@ -860,7 +908,11 @@ struct ssd130x_device *ssd130x_probe(struct device *dev, struct regmap *regmap)
>   
>   	ssd130x->dev = dev;
>   	ssd130x->regmap = regmap;
> -	ssd130x->device_info = device_get_match_data(dev);
> +
> +	variant = (enum ssd130x_variants)device_get_match_data(dev);
> +	ssd130x->device_info = ssd13x_variant_to_info(variant);
> +	if (!ssd130x->device_info)
> +		return ERR_PTR(-EINVAL);
>   
>   	if (ssd130x->device_info->page_mode_only)
>   		ssd130x->page_address_mode = 1;
> diff --git a/drivers/gpu/drm/solomon/ssd130x.h b/drivers/gpu/drm/solomon/ssd130x.h
> index f5b062576fdf..4e0b62a41aa3 100644
> --- a/drivers/gpu/drm/solomon/ssd130x.h
> +++ b/drivers/gpu/drm/solomon/ssd130x.h
> @@ -18,7 +18,20 @@
>   
>   #include <linux/regmap.h>
>   
> +#define SSD130X_DATA				0x40
> +#define SSD130X_COMMAND				0x80
> +
> +enum ssd130x_variants {
> +	SH1106_ID,
> +	SSD1305_ID,
> +	SSD1306_ID,
> +	SSD1307_ID,
> +	SSD1309_ID,
> +	NR_SSD130X_VARIANTS
> +};
> +
>   struct ssd130x_deviceinfo {
> +	enum ssd130x_variants variant;
>   	u32 default_vcomh;
>   	u32 default_dclk_div;
>   	u32 default_dclk_frq;

Neil
