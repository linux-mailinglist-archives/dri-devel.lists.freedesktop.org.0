Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 835D390D390
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 16:08:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE82310E69A;
	Tue, 18 Jun 2024 14:08:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eVTOKlgS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C4D110E6A6
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 14:08:07 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-52c85a7f834so7030576e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 07:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718719685; x=1719324485; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EPYowminOVvr+nmoaSaS+pLCI6yVw569Zh9cdjJsE7M=;
 b=eVTOKlgSl60NaQudJECtA63g8983Miu82KuCz9G3TgMN+ROU4ODtNP7LAB1Cu6bHUA
 xkhAQAU+q5urY+EM265RMrUvwwePq06rPGMatRHIBDnjQoHJOFwKg5unN+/lZuAWrll/
 oXonZIP1s4Kvr5yRXPHgX1HG4f1J5OMxgB+wJ1uaSxntWwU+BHLm0Zm1EcPQ9+UCGjjp
 puXrhSLhHx7hgoRT5O2L4E3xaqp4Gnq8b4L1hWl/niZoq7gNWwegwaCE9MGNmJ8JyzS7
 EQMtCxtDViAwn3ffMrcdIlvrbWS6TDM13Bx2FR74bzz5qF6etMt/dznwc5/K4dW2hrH3
 0YMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718719685; x=1719324485;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EPYowminOVvr+nmoaSaS+pLCI6yVw569Zh9cdjJsE7M=;
 b=Em9tbwXT4W4MKpexspP8v9dpkTkpNf4KXZgRv3FKKtvaTF1TBYH5GpOI65pyz3Kjg3
 fzDzQRt3jcq8mBhQJ+jjtHOaotfzYLAdy0jRBIqGYRMLgxBDdrablWJDXZz20ieWN91j
 E3ztjy6koC5zNcTJ7d98LwPF1paqqhEbsHyAM7KmRZE6zlz4O6M/ulKexk04N4tTW7L4
 GlQfSj3/IRyJ4vFxSFiQpA1JQM3RZGguwm97uWwtGBHs+uz69P34JygInsMvyUhPI9FH
 RvpKP61Avlmo+4/EFNGgdo3AT6ZSqulpVsJqXBIzvylY+4vQc2ZanxOO2NuBpKAizTb5
 UXqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAGbiZQbu+jt6T2btvrJ/UBmsteEstl3dvhZHnocIphoWRcDKKUZGm9WpHVxKwNNG/bOLSEFHFUzpmBwbUuEY40c9YgAXO5uEB8uBDpr1c
X-Gm-Message-State: AOJu0YycbMBVmPupaP2R/SeumN2XO3/d6r8SVbzeFw697XTb+0alZi85
 49h5aYnOr38VaMXeHwMB58dQ3R+/2yGsmqFpLRx+NYNu6bAPBhHGWAIsViGnpss=
X-Google-Smtp-Source: AGHT+IFjNs+7IdOYMMPvNdFNexxA9RGwd73g79/svh7QWdlywyc8T5oNxWK+VByqXQUr181S1dbiZQ==
X-Received: by 2002:a19:8c5a:0:b0:52c:88d6:891d with SMTP id
 2adb3069b0e04-52ca6e5637emr7805302e87.9.1718719685041; 
 Tue, 18 Jun 2024 07:08:05 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:4fb7:492b:2c94:7283?
 ([2a00:f41:9028:9df3:4fb7:492b:2c94:7283])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca282581csm1520479e87.37.2024.06.18.07.07.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 07:08:04 -0700 (PDT)
Message-ID: <e6a81932-0609-4476-82b6-43ee30b7de43@linaro.org>
Date: Tue, 18 Jun 2024 16:07:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 22/23] arm64: dts: qcom: starqltechn: fix usb regulator
 mistake
To: Dzmitry Sankouski <dsankouski@gmail.com>,
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
 phone-devel@vger.kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
 <20240618-starqltechn_integration_upstream-v3-22-e3f6662017ac@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240618-starqltechn_integration_upstream-v3-22-e3f6662017ac@gmail.com>
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



On 6/18/24 15:59, Dzmitry Sankouski wrote:
> Usb regulator was wrongly pointed to vreg_l1a_0p875.
> However, on starqltechn it's powered from vreg_l5a_0p8.
> 
> Fixes: d711b22eee55 ("arm64: dts: qcom: starqltechn: add initial device tree for starqltechn")
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---

How did you confirm that?

Konrad
