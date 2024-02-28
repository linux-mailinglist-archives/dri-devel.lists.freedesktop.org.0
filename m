Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF09D86B341
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 16:37:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0584210EA1B;
	Wed, 28 Feb 2024 15:37:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="DBD+byta";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B61410EA1F
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 15:37:18 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id
 e9e14a558f8ab-36523b9fa11so19514875ab.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 07:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709134637; x=1709739437;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=svD1W1a7QFf9Gza+G3SPXvK0VpFKMCR1+Xi0Z1FWhGs=;
 b=DBD+byta566pMZabXx6U0UnR2NSePTw0PX87brVPMFidFmh7zlntSoxD/yF0NBhmVt
 VuLbYr/Smbf9UOYiEEdKUmxdi2Vzji8tih0utYgfQD6AqoE9pW5ExrpTzPAdz3Gvbe1f
 TombP3dsYrz/rgZfLP2i28wjqm01/pbbPA8EY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709134637; x=1709739437;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=svD1W1a7QFf9Gza+G3SPXvK0VpFKMCR1+Xi0Z1FWhGs=;
 b=mcDmA6N6zYHbdZyFQbHBzcyYmX1sOOcACwMr/fX2iNhDTPAO/PJAE5fFQMxWdt/bKY
 yUrVBZrVXYaocLExBD2RQGogilN8Ok0fi1gB9PPJqPfDZPTJj9qLvlSfDMI3O4sHx6+y
 92x0OyKsyMRclia4Pj1LjiNmSi8He03nd8+wrahy9veL6hblD+RvMlah1yKpkPi9qLug
 m/dDmaCDh/en9fEaBsJGDY4FqdZtxHLwfLPrpV+b2bvqblqS6Cf9xxegLh2uciiGPvv8
 H6akWoz7kcXiQhPCfS9ZWOyPDrkb3yc/wImxAnB23Do8pcCbPZ0P1kx/AOFCFG0hnHLa
 uJgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWH0CRkEbLpPJXB33ByBxI/dDWHAg33lP1XMDaFEpxV+J/3K9LdZfxkEJnRGP0mfjmG/rQlKIGxSmAKt1+0crMSQjoHPkepBNcv573SaS7/
X-Gm-Message-State: AOJu0Yw7UbvSLLyss1FzBwDzaTdtLImjt8cr57bMMQ9kHVWnK1X5Aw3R
 OMSTNuqkTSfEaDdl6+C2qGspVoFkj2W92CHgRILU0lJ5EEYXDRDdGgv6UImlzg==
X-Google-Smtp-Source: AGHT+IFwnHar0bSnDcMYJo9D3FZDjlUk0s+GVf8S+gT0uUdrPI6XVBO5n/eqspfTGLxTLggHdT93YQ==
X-Received: by 2002:a92:de43:0:b0:365:1e8f:1519 with SMTP id
 e3-20020a92de43000000b003651e8f1519mr13223206ilr.27.1709134637291; 
 Wed, 28 Feb 2024 07:37:17 -0800 (PST)
Received: from localhost (144.57.222.35.bc.googleusercontent.com.
 [35.222.57.144]) by smtp.gmail.com with UTF8SMTPSA id
 i6-20020a056e021b0600b00363ce0ac359sm2766041ilv.47.2024.02.28.07.37.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 07:37:16 -0800 (PST)
Date: Wed, 28 Feb 2024 15:37:16 +0000
From: Matthias Kaehlcke <mka@chromium.org>
To: Javier Carrasco <javier.carrasco@wolfvision.net>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helen Koike <helen.koike@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/8] usb: misc: onboard_hub: use device supply names
Message-ID: <Zd9TLL0IM08Wh63i@google.com>
References: <20240228-onboard_xvf3500-v5-0-76b805fd3fe6@wolfvision.net>
 <20240228-onboard_xvf3500-v5-1-76b805fd3fe6@wolfvision.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240228-onboard_xvf3500-v5-1-76b805fd3fe6@wolfvision.net>
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

Hi Javier,

Thanks for moving this patch to the front of the series!

A few more comments inline.

On Wed, Feb 28, 2024 at 02:51:28PM +0100, Javier Carrasco wrote:
> The current implementation uses generic names for the power supplies,
> which conflicts with proper name definitions in the device bindings.
> 
> Add a per-device property to include real supply names and keep generic
> names for existing devices to keep backward compatibility.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
> ---
>  drivers/usb/misc/onboard_usb_hub.c | 49 ++++++++++++++++++++------------------
>  drivers/usb/misc/onboard_usb_hub.h | 12 ++++++++++
>  2 files changed, 38 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
> index 0dd2b032c90b..3755f6cc1eda 100644
> --- a/drivers/usb/misc/onboard_usb_hub.c
> +++ b/drivers/usb/misc/onboard_usb_hub.c
> @@ -29,17 +29,6 @@
>  
>  #include "onboard_usb_hub.h"
>  
> -/*
> - * Use generic names, as the actual names might differ between hubs. If a new
> - * hub requires more than the currently supported supplies, add a new one here.
> - */
> -static const char * const supply_names[] = {
> -	"vdd",
> -	"vdd2",
> -};
> -
> -#define MAX_SUPPLIES ARRAY_SIZE(supply_names)
> -
>  static void onboard_hub_attach_usb_driver(struct work_struct *work);
>  
>  static struct usb_device_driver onboard_hub_usbdev_driver;
> @@ -65,6 +54,30 @@ struct onboard_hub {
>  	struct clk *clk;
>  };
>  
> +static int onboard_hub_get_regulator_bulk(struct device *dev,
> +					  struct onboard_hub *onboard_hub)

Let's call this onboard_hub_get_regulators(), it's an implementation detail
that regulator_bulk_get() is used for getting them.

no need to pass 'dev', there is onboard_hub->dev

>  static int onboard_hub_power_on(struct onboard_hub *hub)
>  {
>  	int err;
> @@ -253,7 +266,6 @@ static int onboard_hub_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct onboard_hub *hub;
> -	unsigned int i;
>  	int err;
>  
>  	hub = devm_kzalloc(dev, sizeof(*hub), GFP_KERNEL);
> @@ -264,18 +276,9 @@ static int onboard_hub_probe(struct platform_device *pdev)
>  	if (!hub->pdata)
>  		return -EINVAL;
>  
> -	if (hub->pdata->num_supplies > MAX_SUPPLIES)
> -		return dev_err_probe(dev, -EINVAL, "max %zu supplies supported!\n",
> -				     MAX_SUPPLIES);
> -
> -	for (i = 0; i < hub->pdata->num_supplies; i++)
> -		hub->supplies[i].supply = supply_names[i];
> -
> -	err = devm_regulator_bulk_get(dev, hub->pdata->num_supplies, hub->supplies);
> -	if (err) {
> -		dev_err(dev, "Failed to get regulator supplies: %pe\n", ERR_PTR(err));
> +	err = onboard_hub_get_regulator_bulk(dev, onboard_hub);

The local variable is called 'hub', not 'onboard_hub'.

> diff --git a/drivers/usb/misc/onboard_usb_hub.h b/drivers/usb/misc/onboard_usb_hub.h
> index f360d5cf8d8a..ea24bd6790f0 100644
> --- a/drivers/usb/misc/onboard_usb_hub.h
> +++ b/drivers/usb/misc/onboard_usb_hub.h
> @@ -6,54 +6,66 @@
>  #ifndef _USB_MISC_ONBOARD_USB_HUB_H
>  #define _USB_MISC_ONBOARD_USB_HUB_H
>  
> +#define MAX_SUPPLIES 2
> +
>  struct onboard_hub_pdata {
>  	unsigned long reset_us;		/* reset pulse width in us */
>  	unsigned int num_supplies;	/* number of supplies */
> +	const char * const supply_names[MAX_SUPPLIES]; /* use the real names */

The comment isn't particularly useful or accurate. Not in all cases
real names are used and outside of the context of this change the
comment is hard to understand.

I'd say just omit it, the name of the field is self-documenting enough,
there is no need to repeat the same in a comment (as for 'num_supplies'
...)
