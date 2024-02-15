Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EE6855E18
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 10:30:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C120310E539;
	Thu, 15 Feb 2024 09:30:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jqy/SKfA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A605D10E531
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 09:30:00 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2d0fd07ba8bso6995181fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 01:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707989399; x=1708594199; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=VmOpXYe614s1w+uX5FaR6Zt6hCQGhtbYPhMdt0CcCLo=;
 b=jqy/SKfATR+L++BM8YyeC+cSah7ph8Q2elEJCW6sp1uimS2Uluw1cxaMFmJoY5QDFE
 8pfymr6G+WA5YQEJCaxX4h6SYoMcvwAOXDpPXmuLBb4ZjGc4B9HUjx2Cvqd8zAa3S9RW
 cRmnz1qXgOxOpFz4/9E1rWUON/u+NAR4BVQjIhID7n3zrVsm8AmZEQTBqQQWMyUrJ3Yc
 g70Dvxycr3VSds4kzNPxuRVt7hs2DbEAExNLGHLSsKuEU7lFtrlPN8d4MIYUvGMoVY7n
 HXLkALf0wsV2W763Ixc2xcUixyqKF4NjDTf4ihBNOZv8QwSQgafuKgwyKPZWMa/HQWep
 n+3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707989399; x=1708594199;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=VmOpXYe614s1w+uX5FaR6Zt6hCQGhtbYPhMdt0CcCLo=;
 b=vCDQ91VuHJqR2kRg+cQ1depKSmYmJIIw05NGfStwuKnUH0HyDxQF6p8ViAKhDSQKv2
 Xevz5ntapKgMhYL3b13L3TNLJhwptHNsjoVlUK1ZFcuX83tPB2OxE6EtIUU9uP9yYTxQ
 UIOvKMsFjpESi4fZQ5AS9b+rM/6frewVHvE0lshnNi+tYRtWEHPJSsCsNbLB0bLwakt5
 nU1BQ0nLJ1dWE/RuPRKt8AqV941cLSSRfGr7KsgG40BmEs5Wi188Xx4R6829vJroJWnM
 BApjDscdA2xeL52XdibV5xeCmCX7sDDDjHZ8ZluKH9kpk5oaI3mLdNizBHSkALnbWZr6
 pl0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6i5jF+PIJR5xjhi7Xt7Jm8Zx7QlghNhiEwd5zEer0WS15NmLd6zD6Lf/7QHm6HsWR3Fr+krVK/oBdfOzEaQVcrdMzNIw4VNmk9VMZAvEX
X-Gm-Message-State: AOJu0YxTF2y3RLer+ufGbO04pbblvpkOIErWx6dXQzpiu/U++u88NgOh
 hLeQ7Dh8L6P7D0xUP2dFV44DUTfcdgt9pF6Mg+2Wj9NEczF+BGbgP1Fk33mUr0I=
X-Google-Smtp-Source: AGHT+IEuFGqFxGBfmmBUmEzoDATve7jHeXbEQRCoqEiqnF8PVK28X2sVOXLp6dDGXz+4L0UUY8TwFA==
X-Received: by 2002:a19:ca01:0:b0:511:79ac:ec0f with SMTP id
 a1-20020a19ca01000000b0051179acec0fmr963353lfg.26.1707989398807; 
 Thu, 15 Feb 2024 01:29:58 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4589:7160:c264:fa3b?
 ([2a01:e0a:982:cbb0:4589:7160:c264:fa3b])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c468c00b004120b4c57c9sm1398694wmo.4.2024.02.15.01.29.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Feb 2024 01:29:58 -0800 (PST)
Message-ID: <ffb16ef6-fc9a-42b1-b9c3-4e8f6b52d849@linaro.org>
Date: Thu, 15 Feb 2024 10:29:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/6] dt-bindings: arm-smmu: Document SM8650 GPU SMMU
Content-Language: en-US, fr
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
References: <20240215-topic-sm8650-gpu-v2-0-6be0b4bf2e09@linaro.org>
 <20240215-topic-sm8650-gpu-v2-2-6be0b4bf2e09@linaro.org>
 <CAA8EJprpYEhGi5b+uWGWtOa+qbSwUR8C0j9NLC+ah_-nvy-=Ng@mail.gmail.com>
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <CAA8EJprpYEhGi5b+uWGWtOa+qbSwUR8C0j9NLC+ah_-nvy-=Ng@mail.gmail.com>
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
Reply-To: neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/02/2024 10:25, Dmitry Baryshkov wrote:
> On Thu, 15 Feb 2024 at 11:20, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>
>> Document the GPU SMMU found on the SM8650 platform.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> index a4042ae24770..3ad5c850f3bf 100644
>> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> @@ -93,6 +93,7 @@ properties:
>>                 - qcom,sm8350-smmu-500
>>                 - qcom,sm8450-smmu-500
>>                 - qcom,sm8550-smmu-500
>> +              - qcom,sm8650-smmu-500
>>             - const: qcom,adreno-smmu
>>             - const: qcom,smmu-500
>>             - const: arm,mmu-500
>> @@ -508,7 +509,10 @@ allOf:
>>     - if:
>>         properties:
>>           compatible:
>> -          const: qcom,sm8550-smmu-500
>> +          contains:
>> +            enum:
>> +              - qcom,sm8550-smmu-500
>> +              - qcom,sm8650-smmu-500
> 
> Doesn't this cause warnings for non-GPU SMMU on this platform?

No because it doesn't add those to required, it simply allows clock the properties.

> 
>>       then:
>>         properties:
>>           clock-names:
>> @@ -544,7 +548,6 @@ allOf:
>>                 - qcom,sdx65-smmu-500
>>                 - qcom,sm6350-smmu-500
>>                 - qcom,sm6375-smmu-500
>> -              - qcom,sm8650-smmu-500
>>                 - qcom,x1e80100-smmu-500
>>       then:
>>         properties:
>>
>> --
>> 2.34.1
>>
> 
> 

