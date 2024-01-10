Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2E182990A
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 12:29:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CFDF10E769;
	Wed, 10 Jan 2024 11:29:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39BB610E769
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 11:29:50 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50e7d6565b5so4496040e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 03:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704886188; x=1705490988; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HAkF12kWNFoMruhw1tXFopfrZD7wBVUFQgsn7muBhX8=;
 b=gdq7c78pfStDWImu6C+e2Ub+7/8sneaNQXbWVm6x95BKCOz4jv7M6V969ObLZK4wRi
 7HmIRJ8f3wElN1Ky2RK+RjL5Sw1OtK0+l/6t5kfNv70NRSnAoOJYeZUthMsTnMfVoTfY
 FKmXpw5gfJLqCpt6xvwSFmzVJTMFiNa91uE4eBXnMBMjw+WJNMz7gKyqmpIcDmcNXKOI
 ZIrYxhYNey5x7M49KCGBWmgHm40nYY5vcjGiO9sv6/B8H0kDxm8Y0NzTYh3MEL1MxwvT
 3LLBxWONzgRjYIgHzUqiNCpJprCY9/lvkLwAPXwZe02SSUya+P+vXOeLecvpp6aj6dAJ
 h1zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704886188; x=1705490988;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HAkF12kWNFoMruhw1tXFopfrZD7wBVUFQgsn7muBhX8=;
 b=grQV2DTbKIPrNVistnvBbnXmA3RaYM2bNAhCo7EPP7shkXmk4g6wqQDKyNdJ9lXAvq
 yCH4KvaJ206utAEJXe3g/SYvGKdwGJ4eE9+b+E6ORsHv88hubFZQ2aQkxnHOaqRBfd/5
 /ZCN5BUXdfHJ21ywYM/jtfeTKFnn+vDehYj1A0Q65Ox9D+tEss2/I7ZAxjpRDET6H7GT
 nAHruW9dO2/84RC27U9ILHIVID0xBTp/9HC46ujw1/HPpLXs+78ebDa93ezszuH14q0m
 qDl5zW9oJr9MHmrgj5R5H4gERdKuAfNHx/St4b/pWR0xxnZX3FpofH8MwOWG80C+ljGV
 1Mew==
X-Gm-Message-State: AOJu0YyifKeKqdfopZIHI9sfNPa7MRKNAyX4HSP7bJEXGFQ4INpcF4wu
 oOG8g5TIjzVkn/XuolNIhUMx/aTmeSqUsg==
X-Google-Smtp-Source: AGHT+IEeyrVbvmxHPlptn1HDzewfBjNsVi4jhGnvJVBqvIurtb0y+etCYo4xX4fGB6JzAXSi8Ds8mA==
X-Received: by 2002:ac2:490e:0:b0:50e:5448:3316 with SMTP id
 n14-20020ac2490e000000b0050e54483316mr280029lfi.137.1704886188452; 
 Wed, 10 Jan 2024 03:29:48 -0800 (PST)
Received: from [172.30.205.119] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 f15-20020a19380f000000b0050ea902d191sm640405lfa.153.2024.01.10.03.29.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 03:29:48 -0800 (PST)
Message-ID: <9ba86081-1484-4d1d-9555-317d10e1617f@linaro.org>
Date: Wed, 10 Jan 2024 12:29:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Enable
 display and GPU
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>
References: <20240105-fp4-panel-v1-0-1afbabc55276@fairphone.com>
 <20240105-fp4-panel-v1-3-1afbabc55276@fairphone.com>
 <3fdc6e74-d817-4341-bf64-9096608990d6@linaro.org>
 <CYAZ37LBKG4E.2096GKVUXN8Y2@fairphone.com>
 <2zkiop7xg7w4vkpjpol25qna5wwbq4ja5o6iwuqh25m34k6mgd@aemrbzqgx2oe>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <2zkiop7xg7w4vkpjpol25qna5wwbq4ja5o6iwuqh25m34k6mgd@aemrbzqgx2oe>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-msm@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>, phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/10/24 12:23, Maxime Ripard wrote:
> On Wed, Jan 10, 2024 at 12:00:23PM +0100, Luca Weiss wrote:
>> On Wed Jan 10, 2024 at 11:58 AM CET, Konrad Dybcio wrote:
>>>
>>>
>>> On 1/5/24 15:29, Luca Weiss wrote:
>>>> Add the description for the display panel found on this phone and remove
>>>> the simple-framebuffer that was in place until now
>>>
>>> Why? They should be able to coexist with a smooth-ish handoff
>>
>> Does that work upstream? I'm aware that downstream can do this but
>> thought this was still missing upstream.
> 
> It depends what you call smooth-ish I guess, but KMS handles the
> handover just fine. You're likely to get a flicker during the transition
> though.

Yes, the panel driver will assert the reset pin to get the hw
into a predictable state, so there will likely be a split
second of black or black+garbage.

Konrad
