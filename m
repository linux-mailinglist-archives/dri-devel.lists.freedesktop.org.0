Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F3D9D3AC5
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 13:38:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C619010E734;
	Wed, 20 Nov 2024 12:38:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jetwEOqk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0BAB10E734
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 12:38:28 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-53d9ff8f1e4so5149138e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 04:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732106307; x=1732711107; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=LcUEOpFKPbKPpXUIzJ5sVKWN691GW1SaJnZt3c54KG0=;
 b=jetwEOqk51pbcvc/GKKhHXW3MHzyWSRf5akVzr+nWjO9CZjQA/Z4J9uFyYA2UXxGqK
 LOi0OHB2M9ri4JF9ZNAY3xWX2GYtmQolZ3ZdxZ3LrwTC+aHB0Cv9OofNAu3dO9NBIEXe
 s6uIho4EshfPOwu8HUV/lpEuORjALJDJ1iUYD3lE+sWSEwRRV4XoWOiYEy82XEqSMy+Z
 CMRSulVAgbOT2twQNByPP1li1tV5I8wK6rwdkzRoZNzKTONSLsbvbfb8PvvQzZWmOL3q
 IYnFQCg+2KR6zFIZm3+zlhac962B9+xOse1ASIK2u11OrOQlRTVxSFGfrC7TV5baACvD
 W8mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732106307; x=1732711107;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=LcUEOpFKPbKPpXUIzJ5sVKWN691GW1SaJnZt3c54KG0=;
 b=RsbtYdZn+xzvSaXzikiI7KYuy4sCtx37DKT+XLY+0T0I775FaVh1lfUDovA9RMqgAq
 lqM3E5qEsJSGM8fj7p/CKsov+oyVsldPwGy/mTJNT9AB7kYTC0ySsxbW3q5wvPAml/ra
 ZrjcsDzZSz9gWhEKBGJeBOEomFiPLnFwRh4TVsA4qsRekFAb7417mt+/H4+lY5e76JfX
 8oWFW3w7J4kmXVNF/z+rOC3klri4NN7WPJF8joED818AR6ttl/58oPtGvqgqKBntRXD+
 sp7lkGB39RYIzdXMUHNTCQsoRatwUzBm1gsfSntv3MsKtHi8sTmAfOYUv01D98FRxe9V
 r2FQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjml4bzDIPRMaT6/vdpTbDqLnrrCLMKN9XNC2y029B+CFM0mlBpn7hOGmUSIWfXJIcYT7YEt72X4s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz82pdDrhxNX6OB2D6vkCXlmN2mTbyIww+PdIHOiXceDDVQ81zi
 IwTBGj/eJuc8GMk8/KdLOOzzb6Wlcw1uenpB2UIK7hTED5gIHWzIVwC7+tfrGQ4=
X-Google-Smtp-Source: AGHT+IET0Zw1GUg8juWJTYxh5Mnsf3Wkht9UNm0mLBOVYbwCAwfJ4/8EQhMft+wrL/1dot2VgyvChA==
X-Received: by 2002:a05:6512:b8e:b0:538:9e40:94b with SMTP id
 2adb3069b0e04-53dc13384aemr1066848e87.19.1732106306977; 
 Wed, 20 Nov 2024 04:38:26 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:927b:2848:1f7d:3776?
 ([2a01:e0a:982:cbb0:927b:2848:1f7d:3776])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dbd4783c1sm626248e87.239.2024.11.20.04.38.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Nov 2024 04:38:25 -0800 (PST)
Message-ID: <14583b16-776f-46ca-85fb-c1d151a72781@linaro.org>
Date: Wed, 20 Nov 2024 13:38:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 10/11] arm64: qcom: dts: sm8550: add interconnect and
 opp-peak-kBps for GPU
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Connor Abbott <cwabbott0@gmail.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20241119-topic-sm8x50-gpu-bw-vote-v2-0-4deb87be2498@linaro.org>
 <20241119-topic-sm8x50-gpu-bw-vote-v2-10-4deb87be2498@linaro.org>
 <ctx4ajfhrpu43scq7momrx6lhel6c5sk43yjtvowv25ur6swzh@igo7gofc4lpg>
Content-Language: en-US, fr
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
Organization: Linaro
In-Reply-To: <ctx4ajfhrpu43scq7momrx6lhel6c5sk43yjtvowv25ur6swzh@igo7gofc4lpg>
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

On 20/11/2024 12:47, Dmitry Baryshkov wrote:
> On Tue, Nov 19, 2024 at 06:56:45PM +0100, Neil Armstrong wrote:
>> Each GPU OPP requires a specific peak DDR bandwidth, let's add
>> those to each OPP and also the related interconnect path.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> index 9dc0ee3eb98f8711e01934e47331b99e3bb73682..808dce3a624197d38222f53fffa280e63088c1c1 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> @@ -2113,6 +2113,9 @@ gpu: gpu@3d00000 {
>>   			qcom,gmu = <&gmu>;
>>   			#cooling-cells = <2>;
>>   
>> +			interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
> 
> QCOM_ICC_TAG_ALWAYS

Exact, bad copy paste...

Thanks,
Neil

> 
>> +			interconnect-names = "gfx-mem";
>> +
>>   			status = "disabled";
>>   
>>   			zap-shader {
>> @@ -2126,41 +2129,49 @@ gpu_opp_table: opp-table {
>>   				opp-680000000 {
>>   					opp-hz = /bits/ 64 <680000000>;
>>   					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
>> +					opp-peak-kBps = <16500000>;
>>   				};
>>   
>>   				opp-615000000 {
>>   					opp-hz = /bits/ 64 <615000000>;
>>   					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
>> +					opp-peak-kBps = <16500000>;
>>   				};
>>   
>>   				opp-550000000 {
>>   					opp-hz = /bits/ 64 <550000000>;
>>   					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
>> +					opp-peak-kBps = <12449218>;
>>   				};
>>   
>>   				opp-475000000 {
>>   					opp-hz = /bits/ 64 <475000000>;
>>   					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
>> +					opp-peak-kBps = <8171875>;
>>   				};
>>   
>>   				opp-401000000 {
>>   					opp-hz = /bits/ 64 <401000000>;
>>   					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
>> +					opp-peak-kBps = <6671875>;
>>   				};
>>   
>>   				opp-348000000 {
>>   					opp-hz = /bits/ 64 <348000000>;
>>   					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
>> +					opp-peak-kBps = <6074218>;
>>   				};
>>   
>>   				opp-295000000 {
>>   					opp-hz = /bits/ 64 <295000000>;
>>   					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
>> +					opp-peak-kBps = <6074218>;
>>   				};
>>   
>>   				opp-220000000 {
>>   					opp-hz = /bits/ 64 <220000000>;
>>   					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
>> +					opp-peak-kBps = <6074218>;
>>   				};
>>   			};
>>   		};
>>
>> -- 
>> 2.34.1
>>
> 

