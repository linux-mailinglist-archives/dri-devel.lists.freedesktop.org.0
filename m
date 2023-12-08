Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A816809EBC
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 10:04:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4780F10EA15;
	Fri,  8 Dec 2023 09:04:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C45510EA15
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 09:04:29 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3B893qc0097380;
 Fri, 8 Dec 2023 03:03:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1702026232;
 bh=IKXwFq5PfsAddiMHAxf7fzBCO0WeV1mL4hx37z6UehM=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=X/Plt2twHbYZbvhL4JUDKm+d8Gxs/2UBHbc42jUiXNo4TB44gBWN0C4n6Aoi5jo/a
 SDPfmjjcrKa5SogTrQkKgIuZGlWUsUlv7EeLC4pgfCqHWWoY7PGL+bh/EYbFxaONTB
 Fx8f8E/TsLrgYvkZMGC3Wu0sTalmrN3tsJG/c7DQ=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3B893qrw074250
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 8 Dec 2023 03:03:52 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 8
 Dec 2023 03:03:52 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 8 Dec 2023 03:03:52 -0600
Received: from [172.24.227.25] (uda0496377.dhcp.ti.com [172.24.227.25])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3B893mtr023651;
 Fri, 8 Dec 2023 03:03:49 -0600
Message-ID: <11316142-e05a-4a2f-86cd-79de9e15c8f9@ti.com>
Date: Fri, 8 Dec 2023 14:33:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panel: re-alphabetize the menu list
To: Randy Dunlap <rdunlap@infradead.org>, <linux-kernel@vger.kernel.org>
References: <20231207062233.5318-1-rdunlap@infradead.org>
 <ab12bb39-6b2e-41a7-910c-af124f06a0d6@ti.com>
 <255a12ae-78a1-4e5a-b39a-c990aefba91a@infradead.org>
Content-Language: en-US
From: Aradhya Bhatia <a-bhatia1@ti.com>
In-Reply-To: <255a12ae-78a1-4e5a-b39a-c990aefba91a@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 07/12/23 22:28, Randy Dunlap wrote:
> 
> 
> On 12/7/23 01:52, Aradhya Bhatia wrote:
>> Hi Randy,
>>
>> Thanks for the patch!
>>
>> On 07/12/23 11:52, Randy Dunlap wrote:
>>> A few of the DRM_PANEL entries have become out of alphabetical order,
>>> so move them around a bit to restore alpha order.
>>>
>>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>>> Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
>>> Cc: Sam Ravnborg <sam@ravnborg.org>
>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Cc: Maxime Ripard <mripard@kernel.org>
>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: David Airlie <airlied@gmail.com>
>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>> Cc: dri-devel@lists.freedesktop.org
>>> ---
>>>  drivers/gpu/drm/panel/Kconfig |   90 ++++++++++++++++----------------
>>>  1 file changed, 45 insertions(+), 45 deletions(-)
>>>
>>> diff -- a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
>>> --- a/drivers/gpu/drm/panel/Kconfig
>>> +++ b/drivers/gpu/drm/panel/Kconfig
>>> @@ -95,34 +95,6 @@ config DRM_PANEL_LVDS
>>>  	  handling of power supplies or control signals. It implements automatic
>>>  	  backlight handling if the panel is attached to a backlight controller.
>>>  
>>> -config DRM_PANEL_SIMPLE
>>> -	tristate "support for simple panels (other than eDP ones)"
>>> -	depends on OF
>>> -	depends on BACKLIGHT_CLASS_DEVICE
>>> -	depends on PM
>>> -	select VIDEOMODE_HELPERS
>>> -	help
>>> -	  DRM panel driver for dumb non-eDP panels that need at most a regulator
>>> -	  and a GPIO to be powered up. Optionally a backlight can be attached so
>>> -	  that it can be automatically turned off when the panel goes into a
>>> -	  low power state.
>>> -
>>> -config DRM_PANEL_EDP
>>> -	tristate "support for simple Embedded DisplayPort panels"
>>> -	depends on OF
>>> -	depends on BACKLIGHT_CLASS_DEVICE
>>> -	depends on PM
>>> -	select VIDEOMODE_HELPERS
>>> -	select DRM_DISPLAY_DP_HELPER
>>> -	select DRM_DISPLAY_HELPER
>>> -	select DRM_DP_AUX_BUS
>>> -	select DRM_KMS_HELPER
>>> -	help
>>> -	  DRM panel driver for dumb eDP panels that need at most a regulator and
>>> -	  a GPIO to be powered up. Optionally a backlight can be attached so
>>> -	  that it can be automatically turned off when the panel goes into a
>>> -	  low power state.
>>> -
>>>  config DRM_PANEL_EBBG_FT8719
>>>  	tristate "EBBG FT8719 panel driver"
>>>  	depends on OF
>>> @@ -317,12 +289,6 @@ config DRM_PANEL_LEADTEK_LTK500HD1829
>>>  	  24 bit RGB per pixel. It provides a MIPI DSI interface to
>>>  	  the host and has a built-in LED backlight.
>>>  
>>> -config DRM_PANEL_SAMSUNG_LD9040
>>> -	tristate "Samsung LD9040 RGB/SPI panel"
>>> -	depends on OF && SPI
>>> -	depends on BACKLIGHT_CLASS_DEVICE
>>> -	select VIDEOMODE_HELPERS
>>> -
>>>  config DRM_PANEL_LG_LB035Q02
>>>  	tristate "LG LB035Q024573 RGB panel"
>>>  	depends on GPIOLIB && OF && SPI
>>> @@ -350,6 +316,17 @@ config DRM_PANEL_MAGNACHIP_D53E6EA8966
>>>  	  with the Magnachip D53E6EA8966 panel IC. This panel receives
>>>  	  video data via DSI but commands via 9-bit SPI using DBI.
>>>  
>>> +config DRM_PANEL_MANTIX_MLAF057WE51
>>> +	tristate "Mantix MLAF057WE51-X MIPI-DSI LCD panel"
>>> +	depends on OF
>>> +	depends on DRM_MIPI_DSI
>>> +	depends on BACKLIGHT_CLASS_DEVICE
>>> +	help
>>> +	  Say Y here if you want to enable support for the Mantix
>>> +	  MLAF057WE51-X MIPI DSI panel as e.g. used in the Librem 5. It
>>> +	  has a resolution of 720x1440 pixels, a built in backlight and touch
>>> +	  controller.
>>> +
>>>  config DRM_PANEL_NEC_NL8048HL11
>>>  	tristate "NEC NL8048HL11 RGB panel"
>>>  	depends on GPIOLIB && OF && SPI
>>> @@ -438,17 +415,6 @@ config DRM_PANEL_NOVATEK_NT39016
>>>  	  Say Y here if you want to enable support for the panels built
>>>  	  around the Novatek NT39016 display controller.
>>>  
>>> -config DRM_PANEL_MANTIX_MLAF057WE51
>>> -	tristate "Mantix MLAF057WE51-X MIPI-DSI LCD panel"
>>> -	depends on OF
>>> -	depends on DRM_MIPI_DSI
>>> -	depends on BACKLIGHT_CLASS_DEVICE
>>> -	help
>>> -	  Say Y here if you want to enable support for the Mantix
>>> -	  MLAF057WE51-X MIPI DSI panel as e.g. used in the Librem 5. It
>>> -	  has a resolution of 720x1440 pixels, a built in backlight and touch
>>> -	  controller.
>>> -
>>>  config DRM_PANEL_OLIMEX_LCD_OLINUXINO
>>>  	tristate "Olimex LCD-OLinuXino panel"
>>>  	depends on OF
>>> @@ -566,6 +532,12 @@ config DRM_PANEL_SAMSUNG_DB7430
>>>  	  DB7430 DPI display controller used in such devices as the
>>>  	  LMS397KF04 480x800 DPI panel.
>>>  
>>> +config DRM_PANEL_SAMSUNG_LD9040
>>> +	tristate "Samsung LD9040 RGB/SPI panel"
>>> +	depends on OF && SPI
>>> +	depends on BACKLIGHT_CLASS_DEVICE
>>> +	select VIDEOMODE_HELPERS
>>> +
>>>  config DRM_PANEL_SAMSUNG_S6D16D0
>>>  	tristate "Samsung S6D16D0 DSI video mode panel"
>>>  	depends on OF
>>> @@ -774,6 +746,34 @@ config DRM_PANEL_STARTEK_KD070FHFID015
>>>  	  with a resolution of 1024 x 600 pixels. It provides a MIPI DSI interface to
>>>  	  the host, a built-in LED backlight and touch controller.
>>>  
>>> +config DRM_PANEL_EDP
>>> +	tristate "support for simple Embedded DisplayPort panels"
>>> +	depends on OF
>>> +	depends on BACKLIGHT_CLASS_DEVICE
>>> +	depends on PM
>>> +	select VIDEOMODE_HELPERS
>>> +	select DRM_DISPLAY_DP_HELPER
>>> +	select DRM_DISPLAY_HELPER
>>> +	select DRM_DP_AUX_BUS
>>> +	select DRM_KMS_HELPER
>>> +	help
>>> +	  DRM panel driver for dumb eDP panels that need at most a regulator and
>>> +	  a GPIO to be powered up. Optionally a backlight can be attached so
>>> +	  that it can be automatically turned off when the panel goes into a
>>> +	  low power state.
>>> +
>>
>> I don't think you intended to put PANEL_EDP this down the file! But just
>> in case if you did, why?
> 
> I was alphabetizing on "support for simple" on the entry above and the
> one below.  Even without "support for", they would read as
> "Simple ... panels".

That's fair. I suppose anybody seeing the menuconfig would see the mini
description.

Reviewed-by: Aradhya Bhatia <a-bhatia1@ti.com>

> 
>> Regards
>> Aradhya
>>
>>> +config DRM_PANEL_SIMPLE
>>> +	tristate "support for simple panels (other than eDP ones)"
>>> +	depends on OF
>>> +	depends on BACKLIGHT_CLASS_DEVICE
>>> +	depends on PM
>>> +	select VIDEOMODE_HELPERS
>>> +	help
>>> +	  DRM panel driver for dumb non-eDP panels that need at most a regulator
>>> +	  and a GPIO to be powered up. Optionally a backlight can be attached so
>>> +	  that it can be automatically turned off when the panel goes into a
>>> +	  low power state.
>>> +
>>>  config DRM_PANEL_TDO_TL070WSH30
>>>  	tristate "TDO TL070WSH30 DSI panel"
>>>  	depends on OF
> 
