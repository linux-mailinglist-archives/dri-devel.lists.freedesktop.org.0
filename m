Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A2B6C692F
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 14:10:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD4D810E791;
	Thu, 23 Mar 2023 13:10:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 528EE10E097
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 13:10:49 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so1139204wmb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 06:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679577047;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=cS0+o7zM8LJLx7DPZpjCY5hNeBNoQNuN3JhovgtrJLE=;
 b=dKvkK0XKn7p4RyvseicMyVPdTSPyhnwBUnQJFRBFmi+6Yv0f5w+DbBHByWYdOMznAL
 wV28yrjelFiJOmMF0alCZx8zYwXk2DD0fQv2lfcU7XP0aPeqXJ1bklM8S6A/lwsGXTx0
 vGUgylBVemB6yAkBCW2TSbdp6ZwuRHjFu9R/2p0KlGBD7UsQUxwGemNlyhtkXokrSSUj
 eX4MzB8kP0bmAjpxgM0I9MCEno3wYJa08uDs68kCeIA1Cni3OB/UhW2vy3FvNYHNfbsp
 uWlOYjsahJpT3ocqIVNAyx0hq1LHo0IfCxGiM8NhhQWbrCG549z9grj2eXMvROx+dsMK
 wsZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679577047;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cS0+o7zM8LJLx7DPZpjCY5hNeBNoQNuN3JhovgtrJLE=;
 b=yt7RGUKgqHwpHejaA0jsyKLHjnsUHwInYgha0yW0l5Cxesy6OTcJb4RkHtu4jW4hj/
 oRwN2SZ5lgWHq/zDNf9OVjOc7diRpCjCgknvMHzqO63tdubhQmYObKAvI4bt7iITqDcH
 AuuyoOpp29fbHj3csZRZr2laZGYo4w6z4UuQqqqUTqpReerOQepdaBVYSnBQBEu8231u
 we8LSNux9ktI5nWbo3acT8oPkZ+ZkRRlR6SUGroOrdwRWrVGR5krSRrKY4LZBaUjJI1t
 oJ1h1y9V/U4O7f/Q+Lgl4en1Q9jLRkzQ0bSoS/OPJmA9vWyBZthRULPnOpEdQjjf8HNA
 Dafw==
X-Gm-Message-State: AO0yUKUkLvbD508+vrpyzvSyKUu+Y8804KgwxfYeM1MaWtHUJuikjkaJ
 Gv9QpjT8V0OZEHSL9VaRivCgCA==
X-Google-Smtp-Source: AK7set+tD0sGlRcEp0fyadjt97h4jc6tN/UCfkedKwkxauiWrNi7eFbnXeR9vkvPW0mAtApW+y0URQ==
X-Received: by 2002:a05:600c:204d:b0:3ed:2619:6485 with SMTP id
 p13-20020a05600c204d00b003ed26196485mr2354633wmg.3.1679577047703; 
 Thu, 23 Mar 2023 06:10:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:e25a:65de:379a:3899?
 ([2a01:e0a:982:cbb0:e25a:65de:379a:3899])
 by smtp.gmail.com with ESMTPSA id
 p26-20020a7bcdfa000000b003ee443bf0c7sm1859376wmj.16.2023.03.23.06.10.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 06:10:47 -0700 (PDT)
Message-ID: <316d7d7d-b370-36e1-648a-400447d2dd47@linaro.org>
Date: Thu, 23 Mar 2023 14:10:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 7/8] arm64: dts: qcom: sm8450: remove invalid reg-names
 from ufs node
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lee Jones <lee@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Bart Van Assche <bvanassche@acm.org>
References: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-0-3ead1e418fe4@linaro.org>
 <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-7-3ead1e418fe4@linaro.org>
 <9614782e-0d78-e8f2-a438-452cfa86f80b@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <9614782e-0d78-e8f2-a438-452cfa86f80b@linaro.org>
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
Cc: linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Krzysztof Kozlowski <krzk@kernel.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 23/03/2023 11:49, Krzysztof Kozlowski wrote:
> On 23/03/2023 11:25, Neil Armstrong wrote:
>> Fixes the following DT bindings check error:
>> ufshc@1d84000: Unevaluated properties are not allowed ('reg-names' was unexpected)
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8450.dtsi | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
>> index ef9bae2e6acc..8ecc48c7c5ef 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
>> @@ -3996,7 +3996,6 @@ ufs_mem_hc: ufshc@1d84000 {
>>   				     "jedec,ufs-2.0";
>>   			reg = <0 0x01d84000 0 0x3000>,
>>   			      <0 0x01d88000 0 0x8000>;
>> -			reg-names = "std", "ice";
> 
> This is also part of:
> https://lore.kernel.org/linux-arm-msm/20230308155838.1094920-8-abel.vesa@linaro.org/#Z31arch:arm64:boot:dts:qcom:sm8450.dtsi
> but I actually wonder whether you just missed some binding patch?

I'm aware of Abel's RFC patchset to support shared ICE, but this is a cleanup of the current DT,
and the current bindings schema doesn't document reg-names.

Neil

> 
> Best regards,
> Krzysztof
> 

