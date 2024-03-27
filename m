Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9A888DA22
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 10:21:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6145510F994;
	Wed, 27 Mar 2024 09:20:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eclQSfZz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD9010F992
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 09:20:58 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-565c6cf4819so1050812a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 02:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711531256; x=1712136056; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=PVUyFVDIZulXwICyQlj9QTD9tz8APS9bTNZy6SBhqeM=;
 b=eclQSfZzmja0XgKH2QynXyXne5ICIDxyue7S/LsiPzGir9gjDURq3hmHU4BVHCtMMZ
 Xl06G1GaaNXNM+PWCr/o9swbkSFvg3o5iMVSG4aXUZF257ki5agowrJ4LC6tULug6TLm
 GbEAPgmCLVU/l5HQ9BmUsAojkgB3c+vfPnICWTKLM4bMs26LQumsqf/ZsKvds4EN8hnP
 oBW0YI2/qbnVoYiACg9rhbRZAfKhEInRXJLKHud1dpxzhRk4iJr7uCV3taTTWY5Y4XSx
 TDt9ziNi7gMtYB9evsq8njcI2yPs9pWjV3AlyI89fPbu73j+gFmF5Qj758JN2SHG+x57
 Rcig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711531256; x=1712136056;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PVUyFVDIZulXwICyQlj9QTD9tz8APS9bTNZy6SBhqeM=;
 b=MrVDTNC+6RwDtpmyY9DT4SaZgdHVlUpFC2IevCiYgd/0ePg1RQtmVg0bEXlnz4GgsB
 nTm8GrSBUY6n3YUGGAAWL6hX/1pYkGXVx/Pon6g/Ylyh6p0Xe2qwHHDcpg0mxioNU3Ml
 6zkAAPB9Me8CtNmE+BRn0h9W7oz4MnOW8gAc2FQAgH+KZVHzTy1gKPpAKdYBBVSYx12w
 HLI4rRAbtgi7KznQpPd175Xob6jwkHX5LW3JIcbKSik9jmY/g5yXRP6gyZgR3mafXwcM
 o4w6bn0M8T0Zvc/BSRRRFixVfymvBzfYChcwF93lOSvXLVCXpkMKweoxK1UZSTTofERG
 5JZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpGknMjNnVk607o+BGFcUfKz6jfsybNfVZn/aQXrG/89OWIRBUkk4F8XZOW56Mj1pYbmMmi3bG/nlncl76t90EucHRIckuVFNrh4yJdbPl
X-Gm-Message-State: AOJu0YzzxegN8uRpFcmPYHdcTPSugPIy97sXCla3w9BSt7TyNWarG+xP
 oqXzuzjAgy+ci3SA2Usl9tNPYh4YU0S1fLU3aa6d1bJ/uqOsHVuk6RjIp2pJSJo=
X-Google-Smtp-Source: AGHT+IGLscm5Y0ou+WRFTa1lB0ylXsfaScVPOvRTVPiEOHnOb++TwNjd6k7n3DNGtNl+LNVgThDk1w==
X-Received: by 2002:a05:6402:1654:b0:56b:aaf5:e546 with SMTP id
 s20-20020a056402165400b0056baaf5e546mr3294677edx.16.1711531256342; 
 Wed, 27 Mar 2024 02:20:56 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.206.205])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a056402004d00b005689bfe2688sm5114415edu.39.2024.03.27.02.20.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Mar 2024 02:20:55 -0700 (PDT)
Message-ID: <30f470b8-e243-4d6f-b626-7f509b6a9858@linaro.org>
Date: Wed, 27 Mar 2024 10:20:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/1] dt-bindings: display/msm: gpu: Split Adreno
 schemas into separate files
To: Adam Skladowski <a39.skl@gmail.com>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240326201140.10561-1-a39.skl@gmail.com>
 <20240326201140.10561-2-a39.skl@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240326201140.10561-2-a39.skl@gmail.com>
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

On 26/03/2024 21:05, Adam Skladowski wrote:
> Split shared schema into per-gen and group adrenos by clocks used.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  .../devicetree/bindings/display/msm/gpu.yaml  | 317 ++----------------
>  .../bindings/display/msm/qcom,adreno-306.yaml | 115 +++++++
>  .../bindings/display/msm/qcom,adreno-330.yaml | 111 ++++++
>  .../bindings/display/msm/qcom,adreno-405.yaml | 135 ++++++++
>  .../bindings/display/msm/qcom,adreno-506.yaml | 184 ++++++++++
>  .../bindings/display/msm/qcom,adreno-530.yaml | 161 +++++++++
>  .../bindings/display/msm/qcom,adreno-540.yaml | 154 +++++++++
>  .../bindings/display/msm/qcom,adreno-6xx.yaml | 160 +++++++++
>  .../display/msm/qcom,adreno-common.yaml       | 112 +++++++
>  9 files changed, 1157 insertions(+), 292 deletions(-)

One huge patch of 1150 insertions... please split it, e.g. first move
the common parts to common schema and include it in msm/gpu. Then move
device by device.

>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,adreno-306.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,adreno-330.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,adreno-405.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,adreno-506.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,adreno-530.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,adreno-540.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,adreno-6xx.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,adreno-common.yaml
> 


Best regards,
Krzysztof

