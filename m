Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EBD1206BC
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 14:13:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 462A96E519;
	Mon, 16 Dec 2019 13:13:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3278F6E519
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 13:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576502009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ESw13qsXtS5GAzrB4inLK4gjv+2QB7PSTbcXH2KyrA=;
 b=a5/4QmKGb3cnd1cxEOQ9d6Q97kJMgDFDagpMUraVkpN5wuyWS6FV7dsxyLuRsWWTfZLowu
 DMs4Ec2K4A8gX0Rh6qpuOrX/I1PkZpAs1l3orDFDkc7+YTyEhSAJLVvxRWsIDt/VGgn2DS
 A1TrcA+zOKvjU3AyQqg6sLs/Dru4Xso=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-lbkaGAmbMwittiOikudo3Q-1; Mon, 16 Dec 2019 08:13:27 -0500
Received: by mail-wr1-f71.google.com with SMTP id c17so3680757wrp.10
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 05:13:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+ESw13qsXtS5GAzrB4inLK4gjv+2QB7PSTbcXH2KyrA=;
 b=WsKjaQGLQ6+sXG+aarghvibU6998+y+ov7LVm1jV5c8Zt1M7NQqvZgAKD3IY61cY3q
 oAbIjHix2i2zX3AhEyLV2CxxO0WupZRTyoEACv7wGdwKV8uAsnUSb+VVPGel1E3Y7swk
 DMQMf7LLUPfVDjkSlS9PEKpXmup6taRQEQe/CZq6wsODhYOuXFONGXw0gW+e/9laceQt
 aGlKfoymBLcISGiypenzuiYcQfdSkIJEQai/zyhzp/Bmm7YOC3Ns8I/vg+Qwl576fqOh
 n3wP4/eD4xwTPiBKn42q7OVGqMAY9nEGqCrZ0rUiBTgcvZS9Ny5AfBWKx0DXDVL7kqlN
 XHdA==
X-Gm-Message-State: APjAAAUifnZw6xzp+c8OdF4sFZ/zjbE8m67kssM1Axz09L5HG/QjWgeU
 m2As0SrQxaw9Joou6Xbep4H76MbB5dQHFile24gVqbSnQdFSm7a7bSFlk0ggvd3T/vVwGhJYtJW
 stJ4qX26NGd6o0I0VdByqBF1SOGkr
X-Received: by 2002:adf:fcc4:: with SMTP id f4mr30365380wrs.247.1576502005909; 
 Mon, 16 Dec 2019 05:13:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqw/hciskZHHjVZXU1R7ePK6B7XZK/+8q5quFnDb+/EZVlyKRlr77htMpnWckibopohTrw4cew==
X-Received: by 2002:adf:fcc4:: with SMTP id f4mr30365351wrs.247.1576502005697; 
 Mon, 16 Dec 2019 05:13:25 -0800 (PST)
Received: from shalem.localdomain
 (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
 by smtp.gmail.com with ESMTPSA id j130sm16747019wmb.18.2019.12.16.05.13.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2019 05:13:25 -0800 (PST)
Subject: Re: [PATCH 4/5] drm/i915/dsi: Move Crystal Cove PMIC panel GPIO
 lookup from mfd to the i915 driver
To: Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20191215163810.52356-1-hdegoede@redhat.com>
 <20191215163810.52356-5-hdegoede@redhat.com>
 <20191216121628.GR32742@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <36fe5eff-881b-a7f9-360f-f0a18298075a@redhat.com>
Date: Mon, 16 Dec 2019 14:13:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191216121628.GR32742@smile.fi.intel.com>
Content-Language: en-US
X-MC-Unique: lbkaGAmbMwittiOikudo3Q-1
X-Mimecast-Spam-Score: 0
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
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lee Jones <lee.jones@linaro.org>, intel-gfx <intel-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 16-12-2019 13:16, Andy Shevchenko wrote:
> On Sun, Dec 15, 2019 at 05:38:09PM +0100, Hans de Goede wrote:
>> Move the Crystal Cove PMIC panel GPIO lookup-table from
>> drivers/mfd/intel_soc_pmic_core.c to the i915 driver.
>>
>> The moved looked-up table is adding a GPIO lookup to the i915 PCI
>> device and the GPIO subsys allows only one lookup table per device,
>>
>> The intel_soc_pmic_core.c code only adds lookup-table entries for the
>> PMIC panel GPIO (as it deals only with the PMIC), but we also need to be
>> able to access some GPIOs on the SoC itself, which requires entries for
>> these GPIOs in the lookup-table.
>>
>> Since the lookup-table is attached to the i915 PCI device it really
>> should be part of the i915 driver, this will also allow us to extend
>> it with GPIOs from other sources when necessary.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

Thanks.

> One nit below.
> 
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 23 +++++++++++++++++++-
>>   drivers/mfd/intel_soc_pmic_core.c            | 19 ----------------
>>   2 files changed, 22 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
>> index 027970348b22..847f04eec2a1 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
>> @@ -25,6 +25,7 @@
>>    */
>>   
>>   #include <linux/gpio/consumer.h>
>> +#include <linux/gpio/machine.h>
>>   #include <linux/mfd/intel_soc_pmic.h>
>>   #include <linux/slab.h>
>>   
>> @@ -686,8 +687,18 @@ bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi, u16 panel_id)
>>   
>>   /*
>>    * On some BYT/CHT devs some sequences are incomplete and we need to manually
>> - * control some GPIOs.
>> + * control some GPIOs. We need to add a GPIO lookup table before we get these.
>>    */
>> +static struct gpiod_lookup_table pmic_panel_gpio_table = {
>> +	/* Intel GFX is consumer */
>> +	.dev_id = "0000:00:02.0",
>> +	.table = {
>> +		/* Panel EN/DISABLE */
>> +		GPIO_LOOKUP("gpio_crystalcove", 94, "panel", GPIO_ACTIVE_HIGH),
> 
>> +		{ },
> 
> Usually we don't put comma in terminator kind of lines. (Yes I see that it is
> in original code, but we may have a chance to fix it without additional churn).
> Rationale is to prevent some weird issues (like wrong conflict resolution)
> where record may appear after terminator line and will be compiled correctly.

I need to respin the set because of the pinctrl map unregister thingie anyways,
so I have fixed this for v2.

Regards,

Hans


> 
>> +	},
>> +};
>> +
>>   void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_is_on)
>>   {
>>   	struct drm_device *dev = intel_dsi->base.base.dev;
>> @@ -697,6 +708,8 @@ void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_is_on)
>>   
>>   	if ((IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) &&
>>   	    (mipi_config->pwm_blc == PPS_BLC_PMIC)) {
>> +		gpiod_add_lookup_table(&pmic_panel_gpio_table);
>> +
>>   		intel_dsi->gpio_panel = gpiod_get(dev->dev, "panel", flags);
>>   		if (IS_ERR(intel_dsi->gpio_panel)) {
>>   			DRM_ERROR("Failed to own gpio for panel control\n");
>> @@ -707,8 +720,16 @@ void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_is_on)
>>   
>>   void intel_dsi_vbt_gpio_cleanup(struct intel_dsi *intel_dsi)
>>   {
>> +	struct drm_device *dev = intel_dsi->base.base.dev;
>> +	struct drm_i915_private *dev_priv = to_i915(dev);
>> +	struct mipi_config *mipi_config = dev_priv->vbt.dsi.config;
>> +
>>   	if (intel_dsi->gpio_panel) {
>>   		gpiod_put(intel_dsi->gpio_panel);
>>   		intel_dsi->gpio_panel = NULL;
>>   	}
>> +
>> +	if ((IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) &&
>> +	    (mipi_config->pwm_blc == PPS_BLC_PMIC))
>> +		gpiod_remove_lookup_table(&pmic_panel_gpio_table);
>>   }
>> diff --git a/drivers/mfd/intel_soc_pmic_core.c b/drivers/mfd/intel_soc_pmic_core.c
>> index 47188df3080d..ddd64f9e3341 100644
>> --- a/drivers/mfd/intel_soc_pmic_core.c
>> +++ b/drivers/mfd/intel_soc_pmic_core.c
>> @@ -9,8 +9,6 @@
>>    */
>>   
>>   #include <linux/acpi.h>
>> -#include <linux/gpio/consumer.h>
>> -#include <linux/gpio/machine.h>
>>   #include <linux/i2c.h>
>>   #include <linux/interrupt.h>
>>   #include <linux/module.h>
>> @@ -25,17 +23,6 @@
>>   #define BYT_CRC_HRV		2
>>   #define CHT_CRC_HRV		3
>>   
>> -/* Lookup table for the Panel Enable/Disable line as GPIO signals */
>> -static struct gpiod_lookup_table panel_gpio_table = {
>> -	/* Intel GFX is consumer */
>> -	.dev_id = "0000:00:02.0",
>> -	.table = {
>> -		/* Panel EN/DISABLE */
>> -		GPIO_LOOKUP("gpio_crystalcove", 94, "panel", GPIO_ACTIVE_HIGH),
>> -		{ },
>> -	},
>> -};
>> -
>>   /* PWM consumed by the Intel GFX */
>>   static struct pwm_lookup crc_pwm_lookup[] = {
>>   	PWM_LOOKUP("crystal_cove_pwm", 0, "0000:00:02.0", "pwm_pmic_backlight", 0, PWM_POLARITY_NORMAL),
>> @@ -96,9 +83,6 @@ static int intel_soc_pmic_i2c_probe(struct i2c_client *i2c,
>>   	if (ret)
>>   		dev_warn(dev, "Can't enable IRQ as wake source: %d\n", ret);
>>   
>> -	/* Add lookup table binding for Panel Control to the GPIO Chip */
>> -	gpiod_add_lookup_table(&panel_gpio_table);
>> -
>>   	/* Add lookup table for crc-pwm */
>>   	pwm_add_table(crc_pwm_lookup, ARRAY_SIZE(crc_pwm_lookup));
>>   
>> @@ -121,9 +105,6 @@ static int intel_soc_pmic_i2c_remove(struct i2c_client *i2c)
>>   
>>   	regmap_del_irq_chip(pmic->irq, pmic->irq_chip_data);
>>   
>> -	/* Remove lookup table for Panel Control from the GPIO Chip */
>> -	gpiod_remove_lookup_table(&panel_gpio_table);
>> -
>>   	/* remove crc-pwm lookup table */
>>   	pwm_remove_table(crc_pwm_lookup, ARRAY_SIZE(crc_pwm_lookup));
>>   
>> -- 
>> 2.23.0
>>
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
