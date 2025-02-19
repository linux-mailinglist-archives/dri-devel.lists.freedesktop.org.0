Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 510F1A3C598
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 18:04:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE7B10E85E;
	Wed, 19 Feb 2025 17:04:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vDDFQUo5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0669F10E351
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 17:04:14 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-ab7e08f56a0so818066b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 09:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739984652; x=1740589452; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=nS+re8IZzfg78cocQERJ5nCGG/g/BmDYdKGFLYilFLk=;
 b=vDDFQUo5WcuT/7GMO6V3etbTRC+8djhrFfaLzC1wYLQAkX6NCSJDWiGlPqWAGnJQKA
 jjLKeufXJbPvHrVs/TnLceCw7d9y6bIcWOZokB3hur7eMozpTMi6vSaEMcYAzlrOsjwh
 3v0WMs+r70X3xmEiAi5/XblVsP0hp+BZ4ck5gW441zEJ0zx3Qfm7Z/RbN8ASjev0ijEo
 ZZhPrY2cl/kVBtukELMfhIL/YGo9vyh2DYyO8ZvcuozikhKc3SZGMTB1vnePeQKjteQn
 VcRnXpkJDxRKbGd73kQUJdJ+jLywMV3H11s9xcRIlxOxlpWHHhqit8i3Bzhls7M/gWvm
 x+Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739984652; x=1740589452;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nS+re8IZzfg78cocQERJ5nCGG/g/BmDYdKGFLYilFLk=;
 b=jDj2mtkz79hyDJg7624o0V4olrkrTLmIoEhCFOiLnhPzhnWn1cdwhHzOkt8FBY2DDV
 +7t0NpKV6ZYWgK4SXHD0b+B5sfQ6I1QuQ4UjVQQwMxTyu1uoAGq7YkIV50K0CU15mmag
 9fIAchjJJKJsbRGj8dR1ub0ij7LW09WquIk5wKmET6Ju8BCBL2PSdIykAYvbOggl6Hfn
 x5lS8sIiorX4m8VF9KjG283cZZI8aWAsyqI/1HNEDovm8wThpX2D4mcJJvjTsEp5Rg8+
 xoOXrTwk4kk0NRBa3ZWlaE/u1GK8xt+cX4m+lYZVyu/0Ak3nF8/kUVIC78yVJvtIAnk/
 VxZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjoc1F28kWSLRq5TbyqZeVtc8laN63LImWJZtsa+5y8Cb2W/YoBTUCl+MVtnrv0B3c5LtFXQJTaJc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz97N85U7rwXdkfv71/LASrXejA4A1GAY6nh7+kjUFbyxkxT2WU
 j2MSePNKT/II9h2lu2NIaOwadLj2XW0ofiFEfecgDlTelw2GOM8F4S/pRMRYXrc=
X-Gm-Gg: ASbGncuc9hu7ko/6chyVUi2RdMQyowyWb3nYJ2nbQ1jwadrcbrWBl+NzUBsIVNQlPD4
 ljWMl3Gcy2gdlYtBXYh7hKl9P4Q56GflZr76Ams0V4hl5WKTH+0YeJgsn9IRSsLd0/s8IWdlfo1
 q+oPsdw6si4LcH35UI4+7n5F7QNe98qYyy4Wz9emqXHLzW0/l58slv2xR84gbiCZgwPdMpahdUq
 R3IpKJa+XEStlqXpyrfU4Tc22VYVrynxDiYYEhlMlYJkKtrDDDpCdMGnCpKb4E/yKaJZUr4Q90L
 a+t+n2CoEF/eTT0+eQHR3znXq0bEpBlMjPs=
X-Google-Smtp-Source: AGHT+IHSBmAP86VSnxXjkgY3cMH8/9ybX2ae7f5N9URrzW7hspPUH+L+dLL7ObVqx/KKAuYObmZ2zg==
X-Received: by 2002:a17:907:7248:b0:ab6:6176:9dff with SMTP id
 a640c23a62f3a-abb7053d8e7mr780406166b.0.1739984652450; 
 Wed, 19 Feb 2025 09:04:12 -0800 (PST)
Received: from [192.168.1.20] ([178.197.206.225])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba5323202dsm1299545566b.6.2025.02.19.09.04.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 09:04:11 -0800 (PST)
Message-ID: <4b2426d2-a7bb-4c19-9ebe-77f6a90caf5e@linaro.org>
Date: Wed, 19 Feb 2025 18:04:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/16] drm/msm/dpu: Implement new v12.0 DPU differences
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-15-d201dcdda6a4@linaro.org>
 <qlotuliwnm5spneolztca7avmh2a46pz2xqlxzqbw5kwa53m6q@oyhnzz7fhay3>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <qlotuliwnm5spneolztca7avmh2a46pz2xqlxzqbw5kwa53m6q@oyhnzz7fhay3>
Content-Type: text/plain; charset=UTF-8
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

On 17/02/2025 20:18, Dmitry Baryshkov wrote:
> On Mon, Feb 17, 2025 at 05:41:36PM +0100, Krzysztof Kozlowski wrote:
>> Implement new features and differences coming in v12.0 of DPU present on
>> Qualcomm SM8750 SoC:
>> 1. 10-bit color alpha.
>> 2. New CTL_PIPE_ACTIVE and CTL_LAYER_ACTIVE registers for pipes and
>>    layer mixers.
>> 2. Several differences in LM registers (also changed offsets) for LM
>>    crossbar hardware changes.
> 
> I'd really prefer for this patch to be split into a logical chunks
> rather than "everything for 12.x"
everything 12.x is still logical chunk. I can split more, but without
guidance what is here logical chunk, will be tricky.

For example 10-bit color alpha looks like separate feature. But
remaining PIPE/LAYER active - not sure.

I can split them but I would not call such split necessarily logical.

Best regards,
Krzysztof
