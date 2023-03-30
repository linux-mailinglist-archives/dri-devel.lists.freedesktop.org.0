Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 343246D02BF
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 13:15:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A089A10EDC5;
	Thu, 30 Mar 2023 11:15:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3DC610EDB6
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 11:15:28 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id x17so24044696lfu.5
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 04:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680174927;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KYjmpU57KwSPL7/p6FbubpWHhlYWml1cxHdUtgHJtpY=;
 b=OG/0oL5NrGs1hPay9BrfioBavscaJ6lnEdGD4s+LPkJMbu12d+Omx9FEJbv0bAgsgG
 kevBmj/wQw8fxQbrqnjWALHiUVVywAWrxTIz/fL12dzyzXpXIT7rj7cLCr0q9NkPJBmQ
 0jARXw3WNJlU15nzHEK/fFHH2km6Tk3SaHSTGbo2mgFYzkULH5fYQodbnvDzchVu0n+H
 5/cGRRxwVccmA0eORS4p1tlevjT1aV7AR5rhtT1utyC97gWrtdsXkXvONlRlUHr7B6k0
 KWjXNXxeYY2GH7Z1vu7HCm8wLSkbP4HxIZA1AQyHSlkhF7guuTCBohdKvTgscGBqoWUh
 eAcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680174927;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KYjmpU57KwSPL7/p6FbubpWHhlYWml1cxHdUtgHJtpY=;
 b=e748Q0ONIfN1Wh5ugpRWZnDb+BdBpcSvQXp8XKIVZJlTSklu2Crf1+5iFGYN6lRkr+
 kvyJ50weM+Ff1JLTAaBzdik+0xTTQR+EaIlMMJYVl8d43Fs3ip1OkxBbvdvMubFLdGFm
 Ded7cuvlQ85VGxuT1VdkR710+ScXrRdL7dPP0dg6oBS2GK8PbZWAHyyH4WpBhC39cpaF
 0lIPMFeGvWsN59WxmVFJEVhCScegvTC+4aw6QD4gJdHVM7yagPgPo/GwbnyuLy9g1nZN
 ukFxkfhGQ8+8BbLvmzEbhs52pPCvobVDxgcvrJ3hbyDuJ7rjWEkdSVeEpAmEWqiNjlcg
 0slQ==
X-Gm-Message-State: AAQBX9dwu8enygS870B9BgrOR1OFYzN5iSgNfD6c7LDJBcBWi86wkifm
 BL5fyWMGUiW4Bvly6NUUYD0jCQ==
X-Google-Smtp-Source: AKy350Z6D+a9FxYWdjXymFvnpWjMSF6gMpDhe7WwnImx2kAaP03PPHN0bMIrBKrBKLaNUF+2lrkA5A==
X-Received: by 2002:a05:6512:523:b0:4db:1a0a:39cc with SMTP id
 o3-20020a056512052300b004db1a0a39ccmr1801299lfc.5.1680174926837; 
 Thu, 30 Mar 2023 04:15:26 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 d8-20020ac241c8000000b004cb14fa604csm5815652lfi.262.2023.03.30.04.15.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 04:15:26 -0700 (PDT)
Message-ID: <b9b1ae11-d9cf-0139-41d0-5af4ff2c8e6b@linaro.org>
Date: Thu, 30 Mar 2023 14:15:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 0/3] drm/msm/a5xx: scale MX following the frequency
 changes
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230329222500.1131836-1-dmitry.baryshkov@linaro.org>
 <34470797-493c-d99b-4d0c-0f9381c5b7c1@linaro.org>
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <34470797-493c-d99b-4d0c-0f9381c5b7c1@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/03/2023 14:06, Konrad Dybcio wrote:
> 
> 
> On 30.03.2023 00:24, Dmitry Baryshkov wrote:
>> Konrad brought up the topic of scaling the MX domain according to the
>> OPP changes. Here is my RFC for this functionality. I post it as an RFC
>> for two reasons:
>>
>> 1) I'm not sure that we should scale MX if we are not scaling main
>> voltage following the CPR3
> It should be ok, however..
>>
> [...]
> 
>> Dmitry Baryshkov (3):
>>    dt-bindings: display/msm/gpu: allow specifying MX domain A5xx
>>    drm/msm/a5xx: scale MX domain following the frequncy changes
> This is a stopgap solution, CPR is a child of MX.

Not so sure here. Vendor kernel scales voltages and MX levels 
separately. Moreover, please correct me if I'm wrong here, the kernel 
doesn't scale VDD_GFX directly. It programs GPMU's voltage table and 
then GPMU handles voltage scaling according to performance levels being 
set. MX is handled in parallel to switching GPMU's level.

I have implemented this voltage scaling locally, just need to run more 
tests before posting (and unfortunately it depends either on CPR3+GFX or 
on programming the voltages manually).

> 
> Konrad
>>    arm64: dts: qcom: specify power domains for the GPU
>>
>>   .../devicetree/bindings/display/msm/gpu.yaml  |  9 +++-
>>   arch/arm64/boot/dts/qcom/msm8996.dtsi         | 14 ++++-
>>   drivers/gpu/drm/msm/adreno/a5xx_gpu.c         | 52 +++++++++++++++++++
>>   drivers/gpu/drm/msm/adreno/a5xx_gpu.h         |  3 ++
>>   4 files changed, 76 insertions(+), 2 deletions(-)
>>

-- 
With best wishes
Dmitry

