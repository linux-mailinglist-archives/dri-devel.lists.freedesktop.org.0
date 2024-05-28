Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5748D1A67
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 13:57:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D51AE10FD8C;
	Tue, 28 May 2024 11:57:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="novXicXq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 287BE10E1F0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 08:02:31 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-420180b59b7so3905805e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 01:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1716883350; x=1717488150;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LB+K4J7hwIQAn1PZhzmiQlJU/5ccvyZx30NNjl7BKfo=;
 b=novXicXqWiBAOpfDKbtbr1NXVcvgRu20A7WdGSv8njzLrOX99OsT4PfDKXwbiKvIMq
 yfeikLYRGm8NSn++ifVQNtLKyFDLnUDn84vNktSrf2uSdVWl/7YtuxRNyCZHLHk577vQ
 ULJEKTDH8NCeko5bib0RTnClNFBLdv5o0TENmkxcxSINLXIImBJvYouDZyXVCL8hrJw1
 u1QwMAsRmk/bDiKA7Tphcuq7T88MhC9cRYJxrit79JSNm+PRx3tdqFtI/s0kBjKlIYqs
 FCPPRp3fEJZgsrOSuy+X/hywbtbrWVD7ikbVmrGWgFgdNvc8Rk3V0ves8FMM3JqAYo4f
 mRzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716883350; x=1717488150;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LB+K4J7hwIQAn1PZhzmiQlJU/5ccvyZx30NNjl7BKfo=;
 b=WscBd6lvNtWhRNhC8T78vt3TRZOn8eFfdUUxpivvAB6EBH51iH7dYsXCiJBGSz5I20
 5MUhny6bmtGCFLGBjZOBzf1QNLZd3SrULdPn7tQGxNLCuq4xlQDtwZZ7LYXHXG4ShlIL
 QUPCC/tXNWzO6rVg5O+1nrPqrSICuT2EjgZLK6aMAYp6CWnse8lbRqx9S4xJDqkVC982
 6Pnc/MDWnvLl+/WPuWFOCZU8ZvoykopIQhDsP6fpvn6V5V0PFVJT/Ibpe20PN0uM9H7L
 EXfpFnLBxInuvBr650S0kqDVaPHv3HG9id5jibRPYh9R1fyWK6twwpW+rfTWinVk9VzW
 5gCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhO3LCmkMWnNyQv1eHVUOBD2tBqc4cUgvNZsKI0jdqYTOKTfkJjOc0b+BynmUzfFjgA92/e/tCpdHYDLy3fyZKdwCXuUN1O7d5r9lghobC
X-Gm-Message-State: AOJu0YyY3++9vfdorCg2YOPiJiTdI0kust8uGSA93W7fD9MmqCeQS6iV
 Bi00ZGHUTyR/6A0AaIHU4IosQJcE/BbVL+zfEPX5wCI9O2BYt3+j6Q1YpOftUg==
X-Google-Smtp-Source: AGHT+IEQWPJElogoYIdEXJLRh3Zf/f3skxFXjI2XXftU5B+ovpPCshEfYCuU2HswyyEqU9xTo16GNQ==
X-Received: by 2002:a05:600c:4446:b0:421:20aa:6048 with SMTP id
 5b1f17b1804b1-42120aa619fmr3108815e9.26.1716883350075; 
 Tue, 28 May 2024 01:02:30 -0700 (PDT)
Received: from [192.168.108.89] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4210897c66esm133001685e9.26.2024.05.28.01.02.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 May 2024 01:02:29 -0700 (PDT)
Message-ID: <42632a86-2d29-4349-948d-d27dbda5bdc7@freebox.fr>
Date: Tue, 28 May 2024 10:02:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/bridge: simple-bridge: Add support for TI TDP158
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
References: <b41f2f86-0d99-4199-92a9-42cbb9d6a6d5@freebox.fr>
 <ddd5joylbkovcdogfwhvzaepd3d6wxsnccgvpq2x3h6fmpo2hk@2sitzl6bjt7d>
Content-Language: en-US, fr
From: Arnaud Vrac <avrac@freebox.fr>
In-Reply-To: <ddd5joylbkovcdogfwhvzaepd3d6wxsnccgvpq2x3h6fmpo2hk@2sitzl6bjt7d>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 28 May 2024 11:57:26 +0000
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

On 28/05/2024 03:13, Dmitry Baryshkov wrote:
> On Mon, May 27, 2024 at 06:06:05PM +0200, Marc Gonzalez wrote:
>> From: Arnaud Vrac <avrac@freebox.fr>
>>
>> The TI TDP158 is an AC-Coupled HDMI signal to TMDS Redriver supporting
>> DVI 1.0 and HDMI 1.4b and 2.0b output signals.
>>
>> Since it's an I2C-programmable bridge, it could have a proper driver,
>> but the default settings work fine, thus simple bridge is sufficient.
>>
>> Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
>> ---
>> Change in v2: send from correct address
>> ---
>>   drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
>> index 5813a2c4fc5ee..b138279864750 100644
>> --- a/drivers/gpu/drm/bridge/simple-bridge.c
>> +++ b/drivers/gpu/drm/bridge/simple-bridge.c
>> @@ -292,6 +292,11 @@ static const struct of_device_id simple_bridge_match[] = {
>>   			.timings = &ti_ths8134_bridge_timings,
>>   			.connector_type = DRM_MODE_CONNECTOR_VGA,
>>   		},
>> +	}, {
>> +		.compatible = "ti,tdp158",
>> +		.data = &(const struct simple_bridge_info) {
>> +			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
> 
> Bindings please. Also, note that per the datasheet the bridge uses two
> supplies, Vcc for 3.3V and Vdd for 1.1V, so it doesn't fully fit the
> simple-bridge.c (which might need to be adjusted for the second supply).
> Chapter 7.3.2 of the datasheet points out that Vcc should be brought up
> before Vdd.

Good point, on our board Vcc/Vdd are always on so I didn't catch that.

Thanks,
-Arnaud
