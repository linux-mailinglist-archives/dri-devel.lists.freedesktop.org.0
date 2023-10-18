Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 819F27CE8A4
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 22:20:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF8110E45A;
	Wed, 18 Oct 2023 20:20:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88D4B10E459
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 20:20:42 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2c3e23a818bso854711fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 13:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697660441; x=1698265241; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KQKss7gP05u0WG9WVmMnpWQKE2m5h/QydzbHUfL2Pls=;
 b=obOmVKk3LcqblbknTEaBkoitbgc6HZltvJIyCY4IkHGGCLQaZjNu1MjHaDlAOhZHt+
 APzH5e4cVP+9rpdskvt9Ms97yUdP2JEIBk2mrVx4rfiM/hjF6+raSqsjdBdAfJY+dYyh
 yGdImzAAA+vCTw3Zqlavey/MlN61JIgAvdKfA0k4kIUU0t7lpCqzuBI03sA5MMxBkxg8
 gSaDdxyy24Uze8TPR1irs5Xir73SeN/rxRZbaWpKrIY6Nzl4JuxP5SPGjOdp7hVsD+0v
 UKoj5H9VlvfX1VgPPdZL32Hp9UVG6xV5Wj2TVd+3wzmkygR585+vV+avgyqQsciySY0I
 qx+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697660441; x=1698265241;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KQKss7gP05u0WG9WVmMnpWQKE2m5h/QydzbHUfL2Pls=;
 b=RRnrQVWwwmIdGeemmsI4SUe4Bu0FZwu5jxqdppkVcjQDB9p20sKVDzXrYGIBdeRtFn
 Lm6Jp8NAx0Sn7q9onncK5J2ch4eyn8dM9/rHcadbEuADvyp5ipYDRGt+hBAuziMAHAIJ
 WoJ52ytHaYRL0NPnGU92QfSB5zhr6am/05nxxPiLBOFQ8OY5PAtMAO79ZZUGLuGTU8LS
 yV2k5LQfkS6EvSH0bqwV0vClEnBIZm9LJQZIYSBzNqHWBi/4hdcsukmfE6n3x9YVIHgJ
 n7mPbwgw1kKOEWLjwFR0JxfjxyBsxRwMM3c+Vmg6esKlgwv4xn1B7oCyuUMurBPpTqia
 6TsQ==
X-Gm-Message-State: AOJu0YwNb44S1/pQZv/+iZu2tRvze18Cto3YJkPt51HBvlN9o6DNb6QU
 Bkb08ixjvgVE6CVcSE7dnJh1ow==
X-Google-Smtp-Source: AGHT+IFeDKwEwJ3M5ZLG1RKyvsLBfGrzubtGFe+FHVuwHAAM5yqRBP1MtToK7ZstjT0d4wYbYT5nYA==
X-Received: by 2002:a2e:a414:0:b0:2c1:86da:3f61 with SMTP id
 p20-20020a2ea414000000b002c186da3f61mr2349795ljn.9.1697660440730; 
 Wed, 18 Oct 2023 13:20:40 -0700 (PDT)
Received: from [172.30.205.86] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 y16-20020a05651c021000b002bcda31af28sm833526ljn.42.2023.10.18.13.20.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Oct 2023 13:20:40 -0700 (PDT)
Message-ID: <11b5db69-49f5-4d7b-81c9-687d66a5cb0d@linaro.org>
Date: Wed, 18 Oct 2023 22:20:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] arm64: dts: qcom: sc7280: Fix up GPU SIDs
Content-Language: en-US
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
References: <20230926-topic-a643-v1-0-7af6937ac0a3@linaro.org>
 <20230926-topic-a643-v1-5-7af6937ac0a3@linaro.org>
 <opqdrmyj3y64nqqqmakjydn5rkspizufyeavm7ec7c7ufqz4wk@ey2a7bq3shfj>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <opqdrmyj3y64nqqqmakjydn5rkspizufyeavm7ec7c7ufqz4wk@ey2a7bq3shfj>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Luca Weiss <luca.weiss@fairphone.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/16/23 22:22, Akhil P Oommen wrote:
> On Tue, Sep 26, 2023 at 08:24:40PM +0200, Konrad Dybcio wrote:
>>
>> GPU_SMMU SID 1 is meant for Adreno LPAC (Low Priority Async Compute).
>> On platforms that support it (in firmware), it is necessary to
>> describe that link, or Adreno register access will hang the board.
>>
>> Add that and fix up the SMR mask of SID 0, which seems to have been
>> copypasted from another SoC.
>>
>> Fixes: 96c471970b7b ("arm64: dts: qcom: sc7280: Add gpu support")
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sc7280.dtsi | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index c38ddf267ef5..0d96d1454c49 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -2603,7 +2603,8 @@ gpu: gpu@3d00000 {
>>   				    "cx_mem",
>>   				    "cx_dbgc";
>>   			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
>> -			iommus = <&adreno_smmu 0 0x401>;
>> +			iommus = <&adreno_smmu 0 0x400>,
>> +				 <&adreno_smmu 1 0x400>;
> Aren't both functionally same? 401 works fine on sc7280. You might be
> having issue due to Qcom TZ policies on your platform. I am okay with the change, but can
> you please reword the commit text?
Hm, looking at what the SMR registers represent, it looks like
they should do the same thing and it may indeed be down to the
TZ being picky.. I'll rephrase.

Konrad
