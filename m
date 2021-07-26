Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6543D5852
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 13:11:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F4766FC6F;
	Mon, 26 Jul 2021 11:11:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14AE4897D7
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 11:11:19 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id d18so14724180lfb.6
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 04:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=5EyBo1JuUMfBD46+7a7QLvUvToo/Z3sQEl1J9W/36Qs=;
 b=Ke0QaHseaLGk+DQ5sqBNgN57yTTsc8onasdkMho0NkbrcvTFUEcS/ka8kjnkoKAcqG
 MrLE69v+ucLwzMCJrJOyYthBE3vM60wqOi1tIcewqPhawx9Ux9WOaC/adaoRAH2KvRiZ
 UOaE61HXZYYr5J3Wqh8jYLOKh9BKkrNsAtPjtO8yvwXIKPPtcqCRSdidYIuANFGfcYPE
 WscoWaxJTd8lqF/lQa9OSMeRSOjAQj8xqN0mmaXg8OTKizjy9GaI8tkParYs6790EpAa
 eR2P0FNmzw3e9kVbJyoCtYyOn1g/+4pJHzSjuH75darBYGWNy8Gv41b2cQFMrQUgW/Gp
 Ctmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=5EyBo1JuUMfBD46+7a7QLvUvToo/Z3sQEl1J9W/36Qs=;
 b=c4OwtDMPxF+ZTltLJVTrXOE8zsowUhk7B/CT2tMIfW6s1PIfh9lBMc6t7SSqr4lSr6
 2cpmarfrLK8AzvIbLuHvYH1yd2IZWM7Dt9UZ2BKc68XKJkfXOe0MdphYStWi9PP0EEvc
 TrG8zdcGa5cebnbCy2ifTi1qqvaZMNGBvBmi0ElvYTI2rpJui+D1VDnkGF1UgV/+E3Dh
 fdpdIih0gnWuGqxgiaYR9P2I4mrsSYyutAPXDqUs+kElTe+gtAIKds06G4VV+ldAM3+I
 R6ckKqcLju2bFQGz/5TtBM7DKzZecD2C9z7tIHMOPl/MYLs+JlNGEX+SuquaTAKcATA7
 QNew==
X-Gm-Message-State: AOAM532bUGM7xvlUC21VXOeI93XLIdxLdd/KG7Fq1gLbdiuLMJJtAuni
 dQ2eDXAGeNQD3KD7dpgj7cs=
X-Google-Smtp-Source: ABdhPJxgQDCct9Cq37qPqzYVuA4PfWDgCw5DRcNcCusL3g7e+O9reyRSlQy0DcNU+WHszPAykbZWFw==
X-Received: by 2002:a19:790f:: with SMTP id u15mr12486087lfc.267.1627297878326; 
 Mon, 26 Jul 2021 04:11:18 -0700 (PDT)
Received: from [192.168.43.35] ([5.141.101.155])
 by smtp.gmail.com with ESMTPSA id r11sm2850336ljp.135.2021.07.26.04.11.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jul 2021 04:11:17 -0700 (PDT)
Subject: Re: [PATCH v3 3/3] drm/panel-simple: add Gopher 2b LCD panel
To: Paul Cercueil <paul@crapouillou.net>
References: <20210725221527.1771892-1-akawolf0@gmail.com>
 <20210725221527.1771892-4-akawolf0@gmail.com>
 <K3HUWQ.S5LBW8E092T01@crapouillou.net>
From: Artjom Vejsel <akawolf0@gmail.com>
Message-ID: <54910ba4-4680-868e-94fc-88a11f9abfd9@gmail.com>
Date: Mon, 26 Jul 2021 14:11:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <K3HUWQ.S5LBW8E092T01@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, thierry.reding@gmail.com,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello, Paul!


Thanks for your investigation.

But while this two panels are compatible with the timing set in the 
driver, their timing ranges are different ([1], [2]) and therefore 
should have different compatible strings.


[1]: https://wendangmao.net/doc/753b5635102de2bd960588e2-51.html

[2]: https://www.newhavendisplay.com/appnotes/datasheets/LCDs/ST7282.pdf


Artjom.

On 26/07/2021 12.02, Paul Cercueil wrote:
> Hi Artjom,
>
> Le lun., juil. 26 2021 at 01:15:27 +0300, Artjom Vejsel 
> <akawolf0@gmail.com> a écrit :
>> The Gopher 2b LCD panel is used in Gopher 2b handhelds.
>> It's simple panel with NewVision NV3047 driver, but SPI lines are not 
>> connected.
>> It has no specific name, since it's unique to that handhelds.
>> lot name at AliExpress: 4.3 inch 40PIN TFT LCD Screen COG NV3047 
>> Drive IC 480(RGB)*272 No Touch 24Bit RGB Interface
>
> From what I gathered the Gopher2's LCD panel is the exact same that is 
> inside the RS-07 handheld. According to the teardown (in [1]), the 
> RS-07 panel is a Amelin AML043056B0-40 (see [2]).
>
> Could you verify that? According to the photos, the product code is 
> written on the flexible connector.
>
> If that's the case, instead of using the 
> "qishenglong,gopher2b-lcd-panel" compatible string, could you use 
> "amelin,aml043056b0-40"?
>
> Cheers,
> -Paul
>
> [1]: https://steward-fu.github.io/website/handheld/rs07/teardown.htm
> [2]: http://www.amelin.com.cn/en/h-pd-355.html
>
>>
>> Signed-off-by: Artjom Vejsel <akawolf0@gmail.com>
>> ---
>>  drivers/gpu/drm/panel/panel-simple.c | 43 ++++++++++++++++++++++++++++
>>  1 file changed, 43 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-simple.c 
>> b/drivers/gpu/drm/panel/panel-simple.c
>> index 9b286bd4444f..6b69c0c70814 100644
>> --- a/drivers/gpu/drm/panel/panel-simple.c
>> +++ b/drivers/gpu/drm/panel/panel-simple.c
>> @@ -3563,6 +3563,46 @@ static const struct panel_desc qd43003c0_40 = {
>>      .bus_format = MEDIA_BUS_FMT_RGB888_1X24,
>>  };
>>
>> +static const struct drm_display_mode 
>> qishenglong_gopher2b_lcd_panel_modes[] = {
>> +    { /* 60 Hz */
>> +        .clock = 10800,
>> +        .hdisplay = 480,
>> +        .hsync_start = 480 + 77,
>> +        .hsync_end = 480 + 77 + 41,
>> +        .htotal = 480 + 77 + 41 + 2,
>> +        .vdisplay = 272,
>> +        .vsync_start = 272 + 16,
>> +        .vsync_end = 272 + 16 + 10,
>> +        .vtotal = 272 + 16 + 10 + 2,
>> +        .flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
>> +    },
>> +    { /* 50 Hz */
>> +        .clock = 10800,
>> +        .hdisplay = 480,
>> +        .hsync_start = 480 + 17,
>> +        .hsync_end = 480 + 17 + 41,
>> +        .htotal = 480 + 17 + 41 + 2,
>> +        .vdisplay = 272,
>> +        .vsync_start = 272 + 116,
>> +        .vsync_end = 272 + 116 + 10,
>> +        .vtotal = 272 + 116 + 10 + 2,
>> +        .flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
>> +    },
>> +};
>> +
>> +static const struct panel_desc qishenglong_gopher2b_lcd_panel = {
>> +    .modes = qishenglong_gopher2b_lcd_panel_modes,
>> +    .num_modes = ARRAY_SIZE(qishenglong_gopher2b_lcd_panel_modes),
>> +    .bpc = 8,
>> +    .size = {
>> +        .width = 95,
>> +        .height = 54,
>> +    },
>> +    .bus_format = MEDIA_BUS_FMT_RGB888_1X24,
>> +    .bus_flags = DRM_BUS_FLAG_DE_HIGH | 
>> DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
>> +    .connector_type = DRM_MODE_CONNECTOR_DPI,
>> +};
>> +
>>  static const struct display_timing rocktech_rk070er9427_timing = {
>>      .pixelclock = { 26400000, 33300000, 46800000 },
>>      .hactive = { 800, 800, 800 },
>> @@ -4651,6 +4691,9 @@ static const struct of_device_id 
>> platform_of_match[] = {
>>      }, {
>>          .compatible = "qiaodian,qd43003c0-40",
>>          .data = &qd43003c0_40,
>> +    }, {
>> +        .compatible = "qishenglong,gopher2b-lcd-panel",
>> +        .data = &qishenglong_gopher2b_lcd_panel,
>>      }, {
>>          .compatible = "rocktech,rk070er9427",
>>          .data = &rocktech_rk070er9427,
>> -- 
>> 2.32.0
>>
>
>
