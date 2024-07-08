Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0523792A8AF
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 20:09:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FCDE10E135;
	Mon,  8 Jul 2024 18:09:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HBuD2Akn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A502110E135
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 18:09:05 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-58ba3e38028so5364494a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2024 11:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720462144; x=1721066944; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=h9SclVHHKmhSqXdWBkdjpfcUGGg73PYZ76UnLpmlrPA=;
 b=HBuD2Aknpxy2ShNADuDlVen7mQJAfpA/K3tYccoQN6/QlivFaWAhMDYbInQ1MBXI+X
 v4jl6gGxIhD2cNehldSngmsX8FCBA+/fhR1TsTYAnNBfmsEvZFW8FsX+E17sy21qqJcy
 uowuDI7ehvRQCq0zILR2l7DhZIr8KSz7gaj2AajVLK4Moek3Lou2k89FNQaY1MeW91Rx
 qkWhKJreZVThegEFDLhj3THkOrxUvo1dcULIHEtTt10n3d3iZdhzutw1WD2kBmU3eNKB
 zgLR/VJm7HusFMqUtFFCapczHSWGS6gKFn4WST7oUDw7V5ECDjNlukzBL5Ui3mRTFwtX
 RVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720462144; x=1721066944;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h9SclVHHKmhSqXdWBkdjpfcUGGg73PYZ76UnLpmlrPA=;
 b=wtWtIu2BcbzNupo+Z3wSvU7GPrJIQzpRAhn3iE4+9wJAFzqp2lAidcBaJqGuYunWM1
 VdSaH4CBNHwvJ6ModeHtxwScNTDdTsaFk75UfiSk5FNus9bTbaSw/bdlElQdUDzfrX7H
 i8JEL/25H8p56hZ3PkAZDNWLr2ooZO2sG7QrsFZsRPMvtJxCfgMVWUxYS29Dzt8m69Cm
 Qjd69FchCQ/w3XG4EKDKXW2tpBH2mKIS6dOIozyX92EXBGxR2IxZ900HtvddVdkZ1HbP
 j6R4ryLBFZKkHpJGbwy8hNZ11eJBklUiNkqccEwd7dc/26R2v651w3zR2FrsRsU293uf
 Jg9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2abYpHoxKYfYc22BSdbo1Lco2XVIsJBUGTSLb6AYHgBigKDG67lwi5AanAklvHLfweePdNc92Q13b1dJgXIvwZsG2BKmS5dRKzuq3iXG+
X-Gm-Message-State: AOJu0YwG5cXTZWLzfawDKlQ+grFWpBFZp7BcmFPjBQeZLRD4jYq+qnuU
 r/8hDTaP8I/iuVJA/MbZojBUW9p0hBJFeX8/5NgdeHNCGRFe2i2tUwYyKUPGckU=
X-Google-Smtp-Source: AGHT+IEY4wUlDLgxf2i3rdkVHcpk1OUK0j5ihUIo/iySjtcBRkZ3zUlg7nzE4G/y1pYBhf9gKCamKg==
X-Received: by 2002:a05:6402:84c:b0:58e:2b65:385b with SMTP id
 4fb4d7f45d1cf-594ba0c9e5dmr286249a12.14.1720462143775; 
 Mon, 08 Jul 2024 11:09:03 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-594bda308efsm98182a12.81.2024.07.08.11.08.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 11:09:03 -0700 (PDT)
Message-ID: <d83ff8c4-15de-4e20-9c27-eb0247184b5f@linaro.org>
Date: Mon, 8 Jul 2024 20:08:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 23/23] arm64: dts: qcom: starqltechn: add new features
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: Sebastian Reichel <sre@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
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
 <20240618-starqltechn_integration_upstream-v3-23-e3f6662017ac@gmail.com>
 <13fea5c0-5906-4075-b734-52649e35eb69@linaro.org>
 <CABTCjFDebBxf=XcvTbVtifROFHrQLXtArLtj0wHVF_e529NVAg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <CABTCjFDebBxf=XcvTbVtifROFHrQLXtArLtj0wHVF_e529NVAg@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8.07.2024 5:54 PM, Dzmitry Sankouski wrote:
> вт, 18 июн. 2024 г. в 17:12, Konrad Dybcio <konrad.dybcio@linaro.org>:
>>
>>
> ...
>>
>>>       gpio-reserved-ranges = <0 4>, <27 4>, <81 4>, <85 4>;
>>
>> Do you know what these are for?
>>
>> Konrad
> 
> <85 4> is spi for fingerprint.
> <27 4> is spi for eSE(embedded Secure Element)
> The rest shouldn't be reserved.

Thanks for digging this up!

Please add a comment for it, like in x1e80100-crd.dts

Konrad
