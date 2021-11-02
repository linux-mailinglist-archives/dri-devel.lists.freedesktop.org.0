Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41529442C7A
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 12:25:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 386FC6FC9D;
	Tue,  2 Nov 2021 11:25:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B8A46FC9D
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 11:25:18 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id d13so32735603wrf.11
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Nov 2021 04:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=kvwZwXYZNMaH47QodfleY8bbkp1N3IyDMKhN3HLkWDs=;
 b=WrLN1H1gli+0FAH4hIEVtQk4LFBbrTRdndrL6Qs1WNEayoub5ihVeo9+bxt8pBM2WC
 tR8lk4YMxRMaZDKI1JW7sLMTT+bgdQWVfmfGBq17p0GCIgJ0v1YT7cPSKrIMoIVAf5WO
 CTCpZEoPsVHZn12BR7v1FJ8jtR/iTm0EGLtwS1Hfbu9pRXcsj8TLCD1EMN24SLvJT9kN
 YxD2LNToi482xegZf0w59CPqAa/uhiXdUaCgSswjHKNwwzVtzOuAvrM3wyvyZ0lhL1hl
 ioiTwL9g39PxPIxG9vzotw/VBjq4cD70Uv7FFYGLr/Exrqi+2IVfwDJ+n3e4D4BgY54e
 Ae8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=kvwZwXYZNMaH47QodfleY8bbkp1N3IyDMKhN3HLkWDs=;
 b=C4DF4x+DqFWNo8TjqjvzgInj92ARwMgFMnzeu+gme6YylsAL3ligg0ixJLZBCjjKtK
 45DIDaQwEhVBLZMoELoRbdelvtPKLTx9HiFcadQWFA2L4fd9iLWDyT6bLxskVwafXhJ2
 GuM/LKYck3JiidHG7wrrQOKShIMbZDUTksE9Wyu95dqFahWu8wnBK+9tTn031rbiNvdX
 a9ExCjIAVDpdesTYYsUblzPXGkdv4RzlmzcKkqq5+8TfbujYqjvsuGTDYxyGuNN4N4RY
 h+Avx1HF7la/gCoKTq04RKs2ozp6gSaqsZmxgdgLSW9pIhcPHSzdtvxdH9F5bsfQoR5g
 aPlw==
X-Gm-Message-State: AOAM531HiG8hOePXbUDQu+poNeCSHYiwR+lweM2DQ2b+p2LxhpjipPRR
 M5btucwLKHa5xqhx25KaUkr9YQ==
X-Google-Smtp-Source: ABdhPJwdN/kxMXerNBU6R+sPqACa1SYL/5CCOvDpJC9if51jTr5qzzFe45lGutl20K+r8bLSO6WptQ==
X-Received: by 2002:a5d:49c3:: with SMTP id t3mr28446450wrs.207.1635852316964; 
 Tue, 02 Nov 2021 04:25:16 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id c16sm5876323wrx.96.2021.11.02.04.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:25:16 -0700 (PDT)
Date: Tue, 2 Nov 2021 11:25:14 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Corentin LABBE <clabbe@baylibre.com>
Subject: Re: [PATCH] backlight: led_bl: Add support for an "enable" GPIO
Message-ID: <20211102112514.75v7evbdp4ccyyt5@maple.lan>
References: <20211102100455.2016610-1-clabbe@baylibre.com>
 <20211102111942.xd7eqz2zrtb7zotc@maple.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211102111942.xd7eqz2zrtb7zotc@maple.lan>
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
Cc: linux-fbdev@vger.kernel.org, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Pavel Machek <pavel@ucw.cz>, khilman@baylibre.com,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, lee.jones@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 02, 2021 at 11:19:42AM +0000, Daniel Thompson wrote:
> On Tue, Nov 02, 2021 at 10:04:55AM +0000, Corentin LABBE wrote:
> > From: Jean-Jacques Hiblot <jjhiblot@ti.com>
> > 
> > This patch adds support for an "enable GPIO".
> 
> Before taking this kind of change is there a good reason why backlight
> should manage the GPIO? I thought that the LED subsystem was a sub
> system for LEDs (not LED controllers). In other words if you direct
> that the LED be lit up then isn't it the LED driver's job to manage
> the GPIO and ensure that it lights up?

Sorry... I should have paid more attention to my sense of déjà vu with
this patch.

This approach was discussed and rejected when we first introduced the
led_bl driver:
https://lore.kernel.org/linux-leds/20190705100851.zn2jkipj4fxq5we6@devuan/


Daniel.



> > Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> > Signed-off-by: Corentin LABBE <clabbe@baylibre.com>
> > ---
> >  drivers/video/backlight/led_bl.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> > 
> > diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
> > index f54d256e2d54..ebd7acc32980 100644
> > --- a/drivers/video/backlight/led_bl.c
> > +++ b/drivers/video/backlight/led_bl.c
> > @@ -8,6 +8,7 @@
> >  
> >  #include <linux/backlight.h>
> >  #include <linux/leds.h>
> > +#include <linux/gpio.h>
> >  #include <linux/module.h>
> >  #include <linux/platform_device.h>
> >  
> > @@ -15,6 +16,7 @@ struct led_bl_data {
> >  	struct device		*dev;
> >  	struct backlight_device	*bl_dev;
> >  	struct led_classdev	**leds;
> > +	struct gpio_desc        *enable_gpio;
> >  	bool			enabled;
> >  	int			nb_leds;
> >  	unsigned int		*levels;
> > @@ -35,6 +37,9 @@ static void led_bl_set_brightness(struct led_bl_data *priv, int level)
> >  	for (i = 0; i < priv->nb_leds; i++)
> >  		led_set_brightness(priv->leds[i], bkl_brightness);
> >  
> > +	if (!priv->enabled)
> > +		gpiod_set_value_cansleep(priv->enable_gpio, 1);
> > +
> >  	priv->enabled = true;
> >  }
> >  
> > @@ -48,6 +53,9 @@ static void led_bl_power_off(struct led_bl_data *priv)
> >  	for (i = 0; i < priv->nb_leds; i++)
> >  		led_set_brightness(priv->leds[i], LED_OFF);
> >  
> > +	if (priv->enabled)
> > +		gpiod_set_value_cansleep(priv->enable_gpio, 0);
> > +
> >  	priv->enabled = false;
> >  }
> >  
> > @@ -209,6 +217,11 @@ static int led_bl_probe(struct platform_device *pdev)
> >  		return PTR_ERR(priv->bl_dev);
> >  	}
> >  
> > +	priv->enable_gpio = devm_gpiod_get_optional(&pdev->dev, "enable",
> > +						    GPIOD_OUT_LOW);
> > +	if (IS_ERR(priv->enable_gpio))
> > +		return PTR_ERR(priv->enable_gpio);
> > +
> >  	for (i = 0; i < priv->nb_leds; i++)
> >  		led_sysfs_disable(priv->leds[i]);
> >  
> > -- 
> > 2.25.1
> > 
