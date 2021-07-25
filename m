Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B14B3D5069
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 00:18:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E21A36E4D2;
	Sun, 25 Jul 2021 22:18:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E48806E4D2
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 22:18:16 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id x7so9013732ljn.10
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 15:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=dUhRXsVILafLbrcPB/Q67vmty0U4fF9veTlHlCnEtoE=;
 b=VqTyDZKeiBNSF6NY6wJ0B3QVeonvwGYiWYwC/C+IuteaaqkDUxehCSd2G/mtnhHTzK
 msMphgqw2cM+0qROxPr9ph2omWLOSammr3kv9gt6Pzne55jLwsy8F661PhND3T1ry3IR
 fiEczxO0OAxsr0J86IZC8tDYg3kGw5091+yXSjCCd8qY+2oPTTSqwEgsIG036W1+nm1d
 nvvicSsBF5LENUTy0jv61/AyHP5ZHVn89lxtg9cgZQFhNPqBqjqejjViGXATG+VmapkP
 YAfPXk49SibWv8wMQZx3teBdNxz8TRBdOEpEBVu/nU7Ek9hcINlrpu70/2/zpkmvlPvT
 0eqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=dUhRXsVILafLbrcPB/Q67vmty0U4fF9veTlHlCnEtoE=;
 b=r56GH9isR/ey28oBkTg5ruOEKEDQJdqVlnEQy/tblJa9rck2sPDcPJgtkkK4XkNt/b
 WcPKlmp3iBg73kJH+ML80ZcD9/HyokvT9r71fObetElxdT+hnXVQKyhwn2MX8kCCjlxR
 DKZyZmEZXVstSiPQ0utBB3VAo1Tk3sWvpQo+nSpQb5ID+dwNCAo9Dyp2fy2EvZUVGvQZ
 xzBfJxIXANvuHmWtxc/xHVHXmg/66orlvHmDdrI95Ptgq6u5rpldH18Afgb246VFUv1+
 Uagi8+6hB2KOAYnd7YnniQJrT1jlaQQvtinS/uJxmOe/T3fIXUX4ObP6o19jeRD/Tfbv
 emLQ==
X-Gm-Message-State: AOAM532VFW7gB7jviNM8wJa3H+GBwMCcoG8CHRsDzHCt1Akw92hcxjsm
 rdsES6sBybdHwT0XdzXrdSE=
X-Google-Smtp-Source: ABdhPJy6QvaawejBf4U+EnmKUnrnqwaUPLrkiynHcuqhsBM2ozdPNtDPQ0xlDMFv7kw7Q1HxHuogjQ==
X-Received: by 2002:a2e:8110:: with SMTP id d16mr10417607ljg.42.1627251495466; 
 Sun, 25 Jul 2021 15:18:15 -0700 (PDT)
Received: from [192.168.1.6] ([194.79.5.201])
 by smtp.gmail.com with ESMTPSA id 10sm2867285lfz.115.2021.07.25.15.18.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jul 2021 15:18:15 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] drm/panel-simple: add Gopher 2b LCD panel
To: Sam Ravnborg <sam@ravnborg.org>
References: <20210724103358.1632020-1-akawolf0@gmail.com>
 <20210724103358.1632020-4-akawolf0@gmail.com> <YP3IM4PbN68qd4ec@ravnborg.org>
From: Artjom Vejsel <akawolf0@gmail.com>
Message-ID: <b588df49-2c85-f8c7-115e-6e86d0692daf@gmail.com>
Date: Mon, 26 Jul 2021 01:18:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YP3IM4PbN68qd4ec@ravnborg.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, paul@crapouillou.net, robh+dt@kernel.org,
 thierry.reding@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Sam! Thanks for commentaries, I've sent v3.

On 25/07/2021 23.23, Sam Ravnborg wrote:
> On Sat, Jul 24, 2021 at 01:33:58PM +0300, Artjom Vejsel wrote:
>> The Gopher 2b LCD panel is used in Gopher 2b handhelds.
>> It's simple panel with NewVision NV3047 driver, but SPI lines are not connected.
>> It has no specific name, since it's unique to that handhelds.
>> lot name at AliExpress: 4.3 inch 40PIN TFT LCD Screen COG NV3047 Drive IC 480(RGB)*272 No Touch 24Bit RGB Interface
>>
>> Signed-off-by: Artjom Vejsel <akawolf0@gmail.com>
>> ---
>>   drivers/gpu/drm/panel/panel-simple.c | 43 ++++++++++++++++++++++++++++
>>   1 file changed, 43 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
>> index 9b286bd4444f..9676e25accb3 100644
>> --- a/drivers/gpu/drm/panel/panel-simple.c
>> +++ b/drivers/gpu/drm/panel/panel-simple.c
>> @@ -4306,6 +4306,46 @@ static const struct panel_desc yes_optoelectronics_ytc700tlag_05_201c = {
>>   	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>>   };
>>   
>> +static const struct drm_display_mode qishenglong_gopher2b_lcd_panel_modes[] = {
>> +	{ /* 60 Hz */
>> +		.clock = 10800,
>> +		.hdisplay = 480,
>> +		.hsync_start = 480 + 77,
>> +		.hsync_end = 480 + 77 + 41,
>> +		.htotal = 480 + 77 + 41 + 2,
>> +		.vdisplay = 272,
>> +		.vsync_start = 272 + 16,
>> +		.vsync_end = 272 + 16 + 10,
>> +		.vtotal = 272 + 16 + 10 + 2,
>> +		.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
>> +	},
>> +	{ /* 50 Hz */
>> +		.clock = 10800,
>> +		.hdisplay = 480,
>> +		.hsync_start = 480 + 17,
>> +		.hsync_end = 480 + 17 + 41,
>> +		.htotal = 480 + 17 + 41 + 2,
>> +		.vdisplay = 272,
>> +		.vsync_start = 272 + 116,
>> +		.vsync_end = 272 + 116 + 10,
>> +		.vtotal = 272 + 116 + 10 + 2,
>> +		.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
>> +	},
>> +};
>> +
>> +static const struct panel_desc qishenglong_gopher2b_lcd_panel = {
>> +	.modes = qishenglong_gopher2b_lcd_panel_modes,
>> +	.num_modes = ARRAY_SIZE(qishenglong_gopher2b_lcd_panel_modes),
>> +	.bpc = 8,
>> +	.size = {
>> +		.width = 95,
>> +		.height = 54,
>> +	},
>> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
>> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
>> +	.connector_type = DRM_MODE_CONNECTOR_DPI,
>> +};
>> +
>>   static const struct drm_display_mode arm_rtsm_mode[] = {
>>   	{
>>   		.clock = 65000,
>> @@ -4753,6 +4793,9 @@ static const struct of_device_id platform_of_match[] = {
>>   	}, {
>>   		.compatible = "yes-optoelectronics,ytc700tlag-05-201c",
>>   		.data = &yes_optoelectronics_ytc700tlag_05_201c,
>> +	}, {
>> +		.compatible = "qishenglong,gopher2b-lcd-panel",
>> +		.data = &qishenglong_gopher2b_lcd_panel,
>>   	}, {
> This list shall also be sorted alphabetically, after the compatible.
> Same goes for the definition of the variable &qishenglong_gopher2b_lcd_panel
> that shall be listed in the same order as here.
>
> Sorry for the nit-picking - but if we do not ask to have it fixed then
> we quickly have a mess.
>
> 	Sam
