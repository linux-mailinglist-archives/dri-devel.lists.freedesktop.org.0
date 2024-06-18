Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F6390DC38
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 21:12:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5409E10E0A8;
	Tue, 18 Jun 2024 19:12:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ELHtzZTV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EECFB10E0A8
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 19:12:05 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4217136a74dso49015055e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 12:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718737924; x=1719342724; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f8+/cR8dmnRCIY8KO1c6EzfyrRTOkElOzLEANvqSOFw=;
 b=ELHtzZTV9yVt0hsmrTy3p8G8aUynzbiGFrWA2/prOhmRGFw4p4j9dpG1OZkYoBC8mU
 k7EsVMSKutO06dCI+XNfP33uQ6KuOjiroP5d8zw9WsQ3Df3H1oaaWLlREebliOyLlpAx
 ITYJcJCkYPIv+jbANU8GQ+oJmY3Jtl5QmfSz020XU0HafWaiQvushUJqPDhWlwKOzUaq
 mTB/FbHmNdeh0uXQaOlkF7n00h34MrpTEeDtrbsW9BbXmhK63JutS+JXmuZ3RLEKpFW1
 Fi88EvEgbmHmRZfF7Mdgiy2gafiWX1gwsaCiW1b+xm8rxkwnQXffXbwWdySR5ZOxFxi5
 x+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718737924; x=1719342724;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f8+/cR8dmnRCIY8KO1c6EzfyrRTOkElOzLEANvqSOFw=;
 b=YGWqTjZVMEuPTmFsWexuXp4wma0e0ethR8wXhX+L9ocxgeNRaUuQLM00VU4XIKjE2T
 KEAbZkAUWoxIW4H8DxS5gbeyr1uP5hxOHiVaTLI6LELId2PSXOHAYyqB6zydm36gjsFF
 bKqRy99ZNLQ9uH0YBE6jZy9BjjIBt6fqRd2SjUuhUkm7BD3nalvWYluYkqNghEjyGCW9
 eFSCJuJo97lNIARoQB7E861Wp3mrj/QxUJiTM5DCaigEoMzStRz5c1+LenyvbjdFbdL+
 /FgVH5sbGDCCgAUSe70DPu6bMGztqLTLjANOlykQFDu/8lRC6+79CpQsGOx4TN9q9o0m
 QyJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSAvEFDcxhwx124nHuPHuI8Q8GYSgBou1nS7qpGQ/BfneTEUF//YIil7+18COhAKMtJvI1Y9GlRtLPxxx5xZdrheZBkfHsa1+2y65WaNKK
X-Gm-Message-State: AOJu0Yzez2OPTenuJH7kWf9gz0CMrfSNgJIK3aGuEdixxpw8W7NlRR2W
 GkbO3P3Dd2EUvOJnnPiLrev8f/KPnc/21F9xs7lZkUmGcaFZ9mv/0MEB27MdRQ0=
X-Google-Smtp-Source: AGHT+IHdn2YVcteO5gHaAZyTpV2RKc9NRMuQMnYAe8emYCZSQL9/iTeEcqYKL05YMuGAZiFOdSXtsQ==
X-Received: by 2002:adf:fe11:0:b0:35e:5bf6:5432 with SMTP id
 ffacd0b85a97d-363175b8c65mr437516f8f.21.1718737923890; 
 Tue, 18 Jun 2024 12:12:03 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:5d11:7fa7:8997:f811?
 ([2a00:f41:9028:9df3:5d11:7fa7:8997:f811])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-361a85074a2sm2280828f8f.25.2024.06.18.12.11.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 12:12:03 -0700 (PDT)
Message-ID: <85e03d10-59a2-4f15-bb85-7b2c0354a5d1@linaro.org>
Date: Tue, 18 Jun 2024 21:11:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/23] gcc-sdm845: Add rates to the GP clocks
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Dzmitry Sankouski <dsankouski@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 phone-devel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-input@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org
References: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
 <20240618-starqltechn_integration_upstream-v3-2-e3f6662017ac@gmail.com>
 <wnf3mfgdm4p4f5wrxdtlx4wccnizdvohc7iiyu5t22eeb67r57@xun3r73hksrg>
 <ad04e203-4244-4cd3-9c9a-fae002962990@linaro.org>
 <lwrz4rvn6ogseea5v6j7plc3yi3xnzo76dvrsl3muat3iswlkb@zmwa3xo3xgw4>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <lwrz4rvn6ogseea5v6j7plc3yi3xnzo76dvrsl3muat3iswlkb@zmwa3xo3xgw4>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/18/24 20:55, Dmitry Baryshkov wrote:
> On Tue, Jun 18, 2024 at 08:50:52PM GMT, Konrad Dybcio wrote:
>>
>>
>> On 6/18/24 19:50, Dmitry Baryshkov wrote:
>>> On Tue, Jun 18, 2024 at 04:59:36PM GMT, Dzmitry Sankouski wrote:
>>>> sdm845 has "General Purpose" clocks that can be muxed to
>>>> SoC pins.
>>>>
>>>> Those clocks may be used as e.g. PWM sources for external peripherals.
>>>> Add more frequencies to the table for those clocks so it's possible
>>>> for arbitrary peripherals to make use of them.
>>>>
>>>> See also: bf8bb8eaccf(clk: qcom: gcc-msm8916: Add rates to the GP clocks)
>>>
>>> Each time I look at the table attached to the GP CLK, I feel that it's
>>> plain wrong. In the end the GPCLK can in theory have arbitrary value
>>> depending on the usecase.
>>>
>>> Bjorn, Konrad, maybe we should add special clk_ops for GP CLK which
>>> allow more flexibility than a default clk_rcg2_ops?
>>
>> If we can somehow get max m/n/d values for all possible parents, sure
> 
> Calculate them at runtime?

We'd be calculating the mnd values for a frequency that's either equal or
reasonably close to the one requested. My worry is that we somehow need
to get the maximum values they can take (unless they're well-known)

Konrad
