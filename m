Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DEA6D02C9
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 13:16:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BAEA10EDB2;
	Thu, 30 Mar 2023 11:16:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF1F10EDC6
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 11:16:26 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id br6so23996837lfb.11
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 04:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680174984;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AvPpycTH0teP/o/yiSVYv5EBd+TMZKQ2Wu3+Pfy2MvI=;
 b=hMykP36fZXaGKqejZgr8S0OsNxQAXnDsPEQwjYmqJSgpvK7FFle6tk5uq81GeaPzos
 bJb1plu7gLJXV0trB7lTAlO/giOMdK0oqc/XkkzY3GHRtII5QLtyCJ8WBSWUlkPmr71f
 FQamm3VWzbNGeoQ7cb77/7WEB0YPHKBRs2j7SR21HrEbkALkvZ6HX+vsM+eRcGVAKgkg
 MVrP02SxY1Rnw/DfNwLvZk5iXGVWQd/2q0DWupeizuBrcBG5SJPgisB9zcZY0Z/zpXf3
 0pJk4DZc0f6INNCnGMYMAn9l7IxFrJ+gPSUPLUBLFX+LsbaWiJncCnyTAWY5Vm4cCLTd
 5hJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680174984;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AvPpycTH0teP/o/yiSVYv5EBd+TMZKQ2Wu3+Pfy2MvI=;
 b=sB9eZfkAajpSihm/aS4Ga9yayjoYCPj9StTTrz+2P6yXJJ91fsmXrojFc4jnVSq+7s
 FrMEaogwV/afrcmXK31QC+H6xrBciQbmtVH5u26NSdu7c1lHMcvJloH5hjwX3Ch2HXaY
 4vNbAbeM5iS2JXm31ekq38RTOrxcXVY7+JbW3qEW3BGuZZzPU5wk4HbcP+IbXLquoEyo
 Ot1v1AJm+J+fk6uyY92RYTAyLkCNWyJxtMHjguep8h01dOXffUwkSsFnB8RR4vC3ntxX
 CejY3bTVDsuDU+Vz0JW2c4RYKLuKYzkTTJdxMubsmtQTA/CQz7/eqq98/DhFF2hLv7wA
 L2Nw==
X-Gm-Message-State: AAQBX9c9NpLzZPNrpjPQ6MuL4CrDzpPToKBleefs/sN8Md4C88irfJzt
 Z8S/1rL/MIv3Wjlq0ShqOPIK1w==
X-Google-Smtp-Source: AKy350b5Qny8LE4rfSokRluKR6HDNxQ4b/QKJKVkd7r9M+RB0/d+uZpV22KifhPV3hCrtEtrXeOEag==
X-Received: by 2002:ac2:4911:0:b0:4e9:cfd2:e19 with SMTP id
 n17-20020ac24911000000b004e9cfd20e19mr7251121lfi.20.1680174984603; 
 Thu, 30 Mar 2023 04:16:24 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 q4-20020ac25284000000b004e1b880ba20sm5842840lfm.292.2023.03.30.04.16.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 04:16:24 -0700 (PDT)
Message-ID: <9ff4fc88-f4bc-3e05-cad9-176449d7258d@linaro.org>
Date: Thu, 30 Mar 2023 13:16:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 0/3] drm/msm/a5xx: scale MX following the frequency
 changes
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230329222500.1131836-1-dmitry.baryshkov@linaro.org>
 <34470797-493c-d99b-4d0c-0f9381c5b7c1@linaro.org>
 <b9b1ae11-d9cf-0139-41d0-5af4ff2c8e6b@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <b9b1ae11-d9cf-0139-41d0-5af4ff2c8e6b@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 30.03.2023 13:15, Dmitry Baryshkov wrote:
> On 30/03/2023 14:06, Konrad Dybcio wrote:
>>
>>
>> On 30.03.2023 00:24, Dmitry Baryshkov wrote:
>>> Konrad brought up the topic of scaling the MX domain according to the
>>> OPP changes. Here is my RFC for this functionality. I post it as an RFC
>>> for two reasons:
>>>
>>> 1) I'm not sure that we should scale MX if we are not scaling main
>>> voltage following the CPR3
>> It should be ok, however..
>>>
>> [...]
>>
>>> Dmitry Baryshkov (3):
>>>    dt-bindings: display/msm/gpu: allow specifying MX domain A5xx
>>>    drm/msm/a5xx: scale MX domain following the frequncy changes
>> This is a stopgap solution, CPR is a child of MX.
> 
> Not so sure here. Vendor kernel scales voltages and MX levels separately. Moreover, please correct me if I'm wrong here, the kernel doesn't scale VDD_GFX directly. It programs GPMU's voltage table and then GPMU handles voltage scaling according to performance levels being set. MX is handled in parallel to switching GPMU's level.
> 
> I have implemented this voltage scaling locally, just need to run more tests before posting (and unfortunately it depends either on CPR3+GFX or on programming the voltages manually).
Oh no.. I forgot about the ugly goblin that we call GPMU.. I'll have
to dig into it further. Thanks for reminding me..

Konrad
> 
>>
>> Konrad
>>>    arm64: dts: qcom: specify power domains for the GPU
>>>
>>>   .../devicetree/bindings/display/msm/gpu.yaml  |  9 +++-
>>>   arch/arm64/boot/dts/qcom/msm8996.dtsi         | 14 ++++-
>>>   drivers/gpu/drm/msm/adreno/a5xx_gpu.c         | 52 +++++++++++++++++++
>>>   drivers/gpu/drm/msm/adreno/a5xx_gpu.h         |  3 ++
>>>   4 files changed, 76 insertions(+), 2 deletions(-)
>>>
> 
