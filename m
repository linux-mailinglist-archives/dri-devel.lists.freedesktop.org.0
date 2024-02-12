Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5ACE85160A
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 14:55:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 261AF10E089;
	Mon, 12 Feb 2024 13:55:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="al1Un7OB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79F4510E089
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 13:55:26 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4116650a345so2752165e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 05:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707746125; x=1708350925; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=rPZItga0K6a/d3qYmA5SX0F5b4igv+uCIQlz3f+nZfg=;
 b=al1Un7OBACy7h36bc1H4Cwrkm31K2OybTs7TMuoJNAtCIMx+u+FadsOWp6o5moVdai
 Z4QTu4/1yG2sbs3euYg2d+NR5WkeA64d+uEsuNYArF5k9MTpvtNAkpY7XS2xiicuTDPb
 Lj69M8x+HdHfosiFeRC/xbvcssJY2QhnsB4td0MiedFi6HBZKyTBPhSbOfmGoWk67wxk
 9O6V7vOhAvk+dltzvFQnn6Y1i0edhnBBQByzVC6vkZVcdsTIF3RLRJN6NLKCQSbPC6n5
 XpUJ1fMLdJ/KLqdwNEuKv5V5KICr51AE6u3wdOOPcTrvwHYEO0l8YFqKyoy554LUF5B4
 axZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707746125; x=1708350925;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=rPZItga0K6a/d3qYmA5SX0F5b4igv+uCIQlz3f+nZfg=;
 b=G2RYaTdjGa24U4L3QN2VUQS91OxBnOO/oVETGv/K81I9azJvX2pilVroyHGUJxZypl
 4M/BQWjhVwXpxLBe9j+gSfUhgQtscDnyKCtTJ7biNECZ8yB1cH2jyjimjRuLRQYnTGOd
 +I5hqtVnsdmzKhb2SV6+fWmhLvOAuKmOxNKuVyY/V9NsW4vtUrhjpxcyNxljw/KJlbQF
 YXTUExMSA/bAl60QAsER3YWHrklbloXN2zDwWawIYJ98HctQE6btoLI3Mro35qSaKPWi
 j5RmoInAz7bLjRuIJuvRRvr9klixAhPFJLgnMjlhS+K8vHoOCuixwz0hKcJWkuY9YoMV
 tVlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3mBqpBTyF5RFmFcDIOHGjCrKRBP+rJHQsU7/igopGPYPr+cxnCdvDHKwPK67UGxDjZFLK7yOCzA5+FAJudVaOI9Myqxuk5tPcH6FgSbou
X-Gm-Message-State: AOJu0YyaJZrHMECmbpKtqQk88XfbdF5ZdgU70FGONcRrFmihEiWifNFi
 0grovuoETceeRUZD1PezHoESNeIrcD1CIxck2LKrzXBapmRDZZO2yk6n3clT/pU=
X-Google-Smtp-Source: AGHT+IG7KY1/dGz5O9hkR94hPzKo0X0u3+e+5j1NEGuM5qVmSOXQKof4lVhHGwJ6xxSDf7MW8jNfAQ==
X-Received: by 2002:adf:ffcc:0:b0:33b:72f2:2283 with SMTP id
 x12-20020adfffcc000000b0033b72f22283mr4536501wrs.17.1707746124778; 
 Mon, 12 Feb 2024 05:55:24 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVkTD1yETNCUWfYwYCnpQdU5FS7SXa7H6wVPKrdy75+Sc7wy7dhEcOGBxivwS8upXzw9QSUx1H9UjRq76n9r4PVgnrWMUd0VH06GG/8U7GJqcHc4krhSmF60TYGvNcqZKM2WQAwv8Vdc5vKz0Hu8ODUgi998rEPcD0aVet908xw7RzW952PBXlzbOu2Mq/ZwM6T1KTyv0+yzmAshAyjWt5P5w3Cw1NttKbn9pqMnHM5B+jFiCT+uGYyDv64f++9FIU/DGFlelj6KCV7KRzDCOZKYvioTfwYoJB1/Ma3peqWGRWx9l8pwZmCCJNG/DzYs/rXm981E00zEJyiBU01WMVnC3jBdozdPWWJHWiN9SfxQgYM7EyysBMG5PXSHi8mXqwToUWJRQp2eBRsqykQFViyHIp6+U8sBRd8/ZvuWqKGGa6+wPHe+zGdGr5LC/mcniH936J+EmU1QfN5U58z4AFBB4xY9npKCEce7xDA9USySSod4bDRyLme8XB+B4NkRyDcy8RjOfZtLcXGr8TkoRulZkRsFeM2b8W3HSaEyKynPjz4ZNVUYa2enZUNXWTTaz668GOR/PFgmXcQfKxGFSnaUAdoS+V1aYmoaqJB5+Yle732nfv8RrVmngYZjSDpQvET2DSQJXhUC9EiX+7WxVKZzPiRTzFX7pibS2TbDnOZDnjXIFUDhHUVA6FeyOAfJ0s2vUo1wN7+atYwCOznpyE7BMywwfp+1d4uZNLhJ7icFqrfeDgVC6BtcUw+iM4d5nnuoxcsz0p1DQj7crxYWZ1zkyHt4ZS9MAgeWZm1qLqhvcfyx4RzTfF8WciP
Received: from ?IPV6:2a01:e0a:982:cbb0:fcee:f026:296d:135f?
 ([2a01:e0a:982:cbb0:fcee:f026:296d:135f])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a056000014a00b0033b1c321070sm6865830wrx.31.2024.02.12.05.55.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Feb 2024 05:55:24 -0800 (PST)
Message-ID: <575f4d10-6022-4e9f-9b0e-221ea2d20fc6@linaro.org>
Date: Mon, 12 Feb 2024 14:55:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 4/5] arm64: dts: qcom: sm8650: add GPU nodes
Content-Language: en-US, fr
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev
References: <20240212-topic-sm8650-gpu-v1-0-708a40b747b5@linaro.org>
 <20240212-topic-sm8650-gpu-v1-4-708a40b747b5@linaro.org>
 <70caf0d0-28f5-48b9-b10e-5541488dd982@linaro.org>
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
In-Reply-To: <70caf0d0-28f5-48b9-b10e-5541488dd982@linaro.org>
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

On 12/02/2024 11:50, Konrad Dybcio wrote:
> On 12.02.2024 11:37, Neil Armstrong wrote:
>> Add GPU nodes for the SM8650 platform.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 169 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 169 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> index c455ca4e6475..f6f9e603fb2f 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> @@ -2582,6 +2582,131 @@ tcsr: clock-controller@1fc0000 {
>>   			#reset-cells = <1>;
>>   		};
>>   
>> +		gpu: gpu@3d00000 {
>> +			compatible = "qcom,adreno-43051401", "qcom,adreno";
>> +			reg = <0x0 0x03d00000 0x0 0x40000>,
>> +			      <0x0 0x03d9e000 0x0 0x1000>,
>> +			      <0x0 0x03d61000 0x0 0x800>;
>> +			reg-names = "kgsl_3d0_reg_memory",
>> +				    "cx_mem",
>> +				    "cx_dbgc";
>> +
>> +			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +			iommus = <&adreno_smmu 0 0x0>,
>> +				 <&adreno_smmu 1 0x0>;
>> +
>> +			operating-points-v2 = <&gpu_opp_table>;
>> +
>> +			interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
>> +			interconnect-names = "gfx-mem";
> 
> ICC should be unnecessary

Ack I'll remove

Neil

> 
> Konrad

