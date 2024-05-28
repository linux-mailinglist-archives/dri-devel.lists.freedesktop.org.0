Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6F78D1A6A
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 13:57:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ADF610FE5E;
	Tue, 28 May 2024 11:57:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="CT4g4mYm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 562DC10E081
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 08:05:53 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-354df3ee1a9so443448f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 01:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1716883551; x=1717488351;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UMy+Uu5CgcnWYfPnGr/Pbi1ogBpYkJGhllTCfOIPptM=;
 b=CT4g4mYmVkhDrpHt1YCsxgbHz+Uo4NVuWb7gTdxviG3BEM1VuPzzQ200Rd2smm8zVF
 vzFRG2ZsiNNUxYNiSdgv0GNjuZIlO9jWVErxbdCydJwrjoeqInRqPYRTkS4T/DnwVFIi
 j6JupGhP5jUS0qUtYIUw9JD/2EuxSXbk1VahGy8v8km+CykJ7oGlkPtirhB/C0wJD8Cj
 p+Ur3u/sliUU1EBts1lcWpUVEe452NsksELmk2O9uBOJ+/v66m1kXmQAL35tAa4OmV+v
 Ll1xCiZm43EMYQOZ4WBxQ+F49T4H2v2mDCBpzBdZT0YYUeMHbC00hD5w/OunkZZH5eGI
 wilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716883551; x=1717488351;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UMy+Uu5CgcnWYfPnGr/Pbi1ogBpYkJGhllTCfOIPptM=;
 b=ilnyU3BsqXaAupIIfP8i4RAKKfasetWDrtkFZxt/WgY533FzI0ADxQxj+ApBjcYlvj
 deP2l5lguG7WOG55erjmIKKAo5cqlG6fA1O1Qz9nfCti1feAiSgbyD8+XwS11eJY/6K+
 Z1jaj396FHdzqbaLB6YzZuK9LLoVv9SQPse3m3KInt2TM8pMN3HMKytH52ns98rvrjnb
 mEOsgqfCyQ51dZq/V06QPAV31CpRfWEUJZprsqwKuc2AejX3awWyLxEMtVIkvc7I1svT
 L1EH5Rw28czHgNeRKOXeD/NB9RK8id50XgEWEjFNNr5Jk7Vcyy5Z0KkA1A6SnFPKaiRT
 mmmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVk//W8Nhy2rfYjYlu919YFWJBByA7CbN/0cjYg73Cf5raN/FJbZso0dHyegZ85jZEknh12BUdNxJJL9i+v+rrmUbSAqZiE6lD8ia8fDDr3
X-Gm-Message-State: AOJu0YyTFzgwmGCuhOcRYKS/pnwKYROitLqZUu//jsWAIlIVm21cuhGw
 BDKJbvnkCBAmT8f6Ce/eMmYqFocrJ97HcyESAVQ66ojg24RyOBCqKjGRs3s19g==
X-Google-Smtp-Source: AGHT+IGIxMVNRgWyG3iRph9zUz7316j4GtaZGYvI++IC6K3gZdhbbnhI0RrDwXfjTcqni2BhZhekQw==
X-Received: by 2002:a5d:6911:0:b0:354:fb2a:7daf with SMTP id
 ffacd0b85a97d-3552fdef9cbmr8229121f8f.57.1716883551174; 
 Tue, 28 May 2024 01:05:51 -0700 (PDT)
Received: from [192.168.108.89] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3557a1c92e7sm10975070f8f.66.2024.05.28.01.05.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 May 2024 01:05:50 -0700 (PDT)
Message-ID: <0cd0136a-bbaf-482f-8e81-a858a6cdce2e@freebox.fr>
Date: Tue, 28 May 2024 10:05:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/bridge: simple-bridge: Add support for TI TDP158
To: Maxime Ripard <mripard@kernel.org>, Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
References: <d3de652f-ce89-4f57-b900-07b11f8bf8f9@free.fr>
 <20240528-potoo-of-pragmatic-tempering-df08f1@houat>
Content-Language: en-US, fr
From: Arnaud Vrac <avrac@freebox.fr>
In-Reply-To: <20240528-potoo-of-pragmatic-tempering-df08f1@houat>
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

On 28/05/2024 09:43, Maxime Ripard wrote:
> Hi,
> 
> On Mon, May 27, 2024 at 06:03:56PM GMT, Marc Gonzalez wrote:
>> From: Arnaud Vrac <avrac@freebox.fr>
>>
>> The TI TDP158 is an AC-Coupled HDMI signal to TMDS Redriver supporting
>> DVI 1.0 and HDMI 1.4b and 2.0b output signals.
>>
>> Since it's an I2C-programmable bridge, it could have a proper driver,
>> but the default settings work fine, thus simple bridge is sufficient.
> 
> No it doesn't. That bridge supports HDMI 2.0 which means you'll need to
> change the TMDS clock ratio when programming a TMDS character rate
> higher than 340MHz. And you'll need hotplug support to deal with it
> properly too.
> 
> So sorry, you need a real driver there.

Hello, this is an HDMI redriver, which simply cleans up the HDMI signal, so no programming is needed to support HDMI 2.0.

Dmitry's comment on v2 also indicates a driver is needed to power on the chip properly, so a dedicated driver does seem to be needed anyway.

> 
>> Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
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
>> +		},
> 
> You'll need a DT binding for that too.
> 

Ack.

Thanks,
-Arnaud
