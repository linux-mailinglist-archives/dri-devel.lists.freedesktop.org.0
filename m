Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 579304CECF4
	for <lists+dri-devel@lfdr.de>; Sun,  6 Mar 2022 18:59:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C78B710E597;
	Sun,  6 Mar 2022 17:59:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B3710E597
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Mar 2022 17:59:16 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id u7so17413772ljk.13
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Mar 2022 09:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:references:cc:in-reply-to:content-transfer-encoding;
 bh=+3qIoUHRI10NawzgN7rY9zgH4hZ9L/0AXMb8gxkoyO8=;
 b=Hyf8QST7RabGM2AVPbepQ6PRMhnVUKjpY2ID6klmfHrP9u2Y1jVMlTZSoJTugaWIcy
 A7pgyGhX7wFjjuEZ1McHmS3It7RbKBo18zMuaABlcdE6b/CGRovuWlDeQW9CKAqVfl9h
 D0zdZIHUuQIPlxZ5z6lTvAW02dmOKHW4GZ+7VkchuwTMxo3X9Dt1Sb227xMRgk5EKQlE
 Gy3OcckpUYuNXH5LbrZkQH98p93gRpHKz40q7Zs2mQed3cct14AnJj+UT6KXUB4XHvY4
 dxm+E2TOF/16is5uevzlpNk6Y9YR746dh0XfZymb9mEWFZYw/GqQoWfWdVLmyclp2kbC
 35Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:references:cc:in-reply-to
 :content-transfer-encoding;
 bh=+3qIoUHRI10NawzgN7rY9zgH4hZ9L/0AXMb8gxkoyO8=;
 b=xcXs+C2sMzcmO4E/pf3bJ5LBx5dP/BH+Em49mxmgV6fAYtoxxZAn/werLBMSuw0Gg/
 4q+Ghextn8ou5kgzjxszKjx8thRXZAivnOrdordMXs10O7uJ80FpNSptpdigquFDSC/t
 bOJ6xaeE+oc9sDMzIAAtb7228DQtpIOA9pCHDdbSVOi9HqByvSC9HcBd4S0IYEIW3O/x
 S8ONC8oe+Jxxe9H1BN/Upt5DXjEiVS+LLQ9ix4g3ens7gzYDiH/w5juojur0oaLGL5dA
 5XZ5qOGpgwzFKesomayE5SNpoR7TtatoIJudpbZjWHfhcaLSfxkVezFz8CJsrDf7HhJ2
 40Pw==
X-Gm-Message-State: AOAM533X4HxyFlfcCTqU1Mf3xACEZKUBT706atYCo3XmTL3zhV1hdQL5
 AF4Lj+Gx30BEycwZ73XofHE=
X-Google-Smtp-Source: ABdhPJy1W0usnFBRGD+mPuXzUkbEmQiut+NoaNV08IYxZ6Sab28FYiFvuyeMJppGLn3gbIs04b2Lwg==
X-Received: by 2002:a05:651c:1192:b0:246:1d6b:d323 with SMTP id
 w18-20020a05651c119200b002461d6bd323mr5248289ljo.360.1646589554666; 
 Sun, 06 Mar 2022 09:59:14 -0800 (PST)
Received: from [192.168.2.145] (109-252-136-171.dynamic.spd-mgts.ru.
 [109.252.136.171]) by smtp.googlemail.com with ESMTPSA id
 s3-20020ac25fe3000000b004481d8f1bfcsm1490642lfg.1.2022.03.06.09.59.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Mar 2022 09:59:14 -0800 (PST)
Message-ID: <1cded859-d3ce-f285-3b02-5d81fbfdeafc@gmail.com>
Date: Sun, 6 Mar 2022 20:59:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] ARM: tegra: Move panels to AUX bus
Content-Language: en-US
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
References: <20211220104855.428290-1-thierry.reding@gmail.com>
 <20211220104855.428290-3-thierry.reding@gmail.com>
 <47a01cd9-c3ee-912b-fa9d-73449990a7d9@gmail.com>
In-Reply-To: <47a01cd9-c3ee-912b-fa9d-73449990a7d9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Thomas Graichen <thomas.graichen@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

22.12.2021 22:30, Dmitry Osipenko пишет:
> 20.12.2021 13:48, Thierry Reding пишет:
>> From: Thierry Reding <treding@nvidia.com>
>>
>> Move the eDP panel on Venice 2 and Nyan boards into the corresponding
>> AUX bus device tree node. This allows us to avoid a nasty circular
>> dependency that would otherwise be created between the DPAUX and panel
>> nodes via the DDC/I2C phandle.
>>
>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>> ---
>>  arch/arm/boot/dts/tegra124-nyan-big.dts   | 15 +++++++++------
>>  arch/arm/boot/dts/tegra124-nyan-blaze.dts | 15 +++++++++------
>>  arch/arm/boot/dts/tegra124-venice2.dts    | 14 +++++++-------
>>  3 files changed, 25 insertions(+), 19 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/tegra124-nyan-big.dts b/arch/arm/boot/dts/tegra124-nyan-big.dts
>> index 1d2aac2cb6d0..fdc1d64dfff9 100644
>> --- a/arch/arm/boot/dts/tegra124-nyan-big.dts
>> +++ b/arch/arm/boot/dts/tegra124-nyan-big.dts
>> @@ -13,12 +13,15 @@ / {
>>  		     "google,nyan-big-rev1", "google,nyan-big-rev0",
>>  		     "google,nyan-big", "google,nyan", "nvidia,tegra124";
>>  
>> -	panel: panel {
>> -		compatible = "auo,b133xtn01";
>> -
>> -		power-supply = <&vdd_3v3_panel>;
>> -		backlight = <&backlight>;
>> -		ddc-i2c-bus = <&dpaux>;
>> +	host1x@50000000 {
>> +		dpaux@545c0000 {
>> +			aux-bus {
>> +				panel: panel {
>> +					compatible = "auo,b133xtn01";
>> +					backlight = <&backlight>;
>> +				};
>> +			};
>> +		};
>>  	};
>>  
>>  	mmc@700b0400 { /* SD Card on this bus */
>> diff --git a/arch/arm/boot/dts/tegra124-nyan-blaze.dts b/arch/arm/boot/dts/tegra124-nyan-blaze.dts
>> index 677babde6460..abdf4456826f 100644
>> --- a/arch/arm/boot/dts/tegra124-nyan-blaze.dts
>> +++ b/arch/arm/boot/dts/tegra124-nyan-blaze.dts
>> @@ -15,12 +15,15 @@ / {
>>  		     "google,nyan-blaze-rev0", "google,nyan-blaze",
>>  		     "google,nyan", "nvidia,tegra124";
>>  
>> -	panel: panel {
>> -		compatible = "samsung,ltn140at29-301";
>> -
>> -		power-supply = <&vdd_3v3_panel>;
>> -		backlight = <&backlight>;
>> -		ddc-i2c-bus = <&dpaux>;
>> +	host1x@50000000 {
>> +		dpaux@545c0000 {
>> +			aux-bus {
>> +				panel: panel {
>> +					compatible = "samsung,ltn140at29-301";
>> +					backlight = <&backlight>;
>> +				};
>> +			};
>> +		};
>>  	};
>>  
>>  	sound {
>> diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts
>> index 232c90604df9..6a9592ceb5f2 100644
>> --- a/arch/arm/boot/dts/tegra124-venice2.dts
>> +++ b/arch/arm/boot/dts/tegra124-venice2.dts
>> @@ -48,6 +48,13 @@ sor@54540000 {
>>  		dpaux@545c0000 {
>>  			vdd-supply = <&vdd_3v3_panel>;
>>  			status = "okay";
>> +
>> +			aux-bus {
>> +				panel: panel {
>> +					compatible = "lg,lp129qe";
>> +					backlight = <&backlight>;
>> +				};
>> +			};
>>  		};
>>  	};
>>  
>> @@ -1080,13 +1087,6 @@ power {
>>  		};
>>  	};
>>  
>> -	panel: panel {
>> -		compatible = "lg,lp129qe";
>> -		power-supply = <&vdd_3v3_panel>;
>> -		backlight = <&backlight>;
>> -		ddc-i2c-bus = <&dpaux>;
>> -	};
>> -
>>  	vdd_mux: regulator-mux {
>>  		compatible = "regulator-fixed";
>>  		regulator-name = "+VDD_MUX";
>>
> 
> You should add stable tag for 5.15 and also add separate patch to update
> the new arch/arm/boot/dts/tegra124-nyan-big-fhd.dts which we have in
> -next now.

Thierry, are you going to address this review comment? I see in
linux-next that you picked up this incomplete version of the patch.
