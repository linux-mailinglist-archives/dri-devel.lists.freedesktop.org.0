Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 866456B906B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 11:45:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4521D10E769;
	Tue, 14 Mar 2023 10:45:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2972210E769
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 10:45:13 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id j11so19355321lfg.13
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 03:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678790711;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ShxiHC0Rhg1UPin7KQtsZbyHHx1N7ivCqUU6bNrksTs=;
 b=Jkqeao4FAapprb9b8Jx4gpZzOfC9C3LrN4mW6W69carg034590yXJoJK16BepmeL46
 AJvHBM1DJ9dwsVNE/2achVtlwZV/i1llD8cbScSqS7pU/4ilD/UFodBdCvkyXFClidGR
 Q/Xsd3dTYULVzyvQYcOw88Z1Q1V/aebiGjfgd9bf5tDXEryZUzjE6YzELSXOKb1ZfHRZ
 gpoVas/GZvZPv7KBx5ya/+rdeB2KRO/bYc0RjyChNxlv6Xx0NBybrz4dakHexisknrMU
 luTtwwZxyVCbFG0Bxk6NjIGKM23PRFWHPAft4kz0OkLVsSPiaXy57rir/6K9VaWMFHNZ
 LAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678790711;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ShxiHC0Rhg1UPin7KQtsZbyHHx1N7ivCqUU6bNrksTs=;
 b=P8CGPldcVTb/DHCJBXuIy9w7irzBG4MPbd+TPTGAQMJPYD0eOP1L+3BsRtbBa+iC1s
 fIqNuX2hyXrpLcrVXvuacOc0ESy+X7LzXAeCwyRV1c/tvi7aJsyrGgaqgYLlfGwB0d8y
 EYkv9MHM6mwDwCkq6mtfhQxWqGIVhaj9o3tiAn6zqBQceOOItk4LmAECoQxOesgQKXs4
 1kecRk+3U4lbFoo7kWc0OQ+8IH+eN7nx9imADLeG/iLvG1kLlL3oXnfbYbbbFW4YKJN9
 y5ZomSsofa/sJ0OS7Oxn47l9N1dm1MtG3hgGLJ1unRtWRy8HgzA5+Ia63ItR5/CbDmLJ
 EYyA==
X-Gm-Message-State: AO0yUKWbdkNcgFfDJcNe90nYDW//SjYTWgPmnroXK1tUufBFWGrEaN9N
 CnHglbJ/OymbJUyjezjQqJy/Hw==
X-Google-Smtp-Source: AK7set8v4npFYo9eTHAmk8y6U1yWqLP1Y79WNkD45A4aiBzidm2Tl4qoX9bIz+Xpvn/GFeX17rl+Ew==
X-Received: by 2002:a05:6512:3743:b0:4dd:afad:8afe with SMTP id
 a3-20020a056512374300b004ddafad8afemr710968lfs.27.1678790711545; 
 Tue, 14 Mar 2023 03:45:11 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 i8-20020ac25d28000000b004cf07a0051csm347916lfb.228.2023.03.14.03.45.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Mar 2023 03:45:10 -0700 (PDT)
Message-ID: <91df0342-428e-562c-56dc-172588ad6954@linaro.org>
Date: Tue, 14 Mar 2023 11:45:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 09/10] dt-bindings: display/msm: dsi-controller-main:
 Add SM6115
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh@kernel.org>
References: <20230307-topic-dsi_qcm-v3-0-8bd7e1add38a@linaro.org>
 <20230307-topic-dsi_qcm-v3-9-8bd7e1add38a@linaro.org>
 <167830146346.3587111.3542934829511061872.robh@kernel.org>
 <20230314001829.dzkxkqgrrbfiu2lq@SoMainline.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230314001829.dzkxkqgrrbfiu2lq@SoMainline.org>
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
Cc: devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 14.03.2023 01:18, Marijn Suijten wrote:
> On 2023-03-08 12:51:03, Rob Herring wrote:
>>
>> On Tue, 07 Mar 2023 14:01:47 +0100, Konrad Dybcio wrote:
>>> Add a compatible for the DSI on SM6115.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> ---
>>>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml      | 2 ++
>>>  .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml         | 8 +++++++-
>>>  2 files changed, 9 insertions(+), 1 deletion(-)
>>>
>>
>> Acked-by: Rob Herring <robh@kernel.org>
> 
> Shouldn't the examples in qcom,sm6115-mdss.yaml be updated below to
> reflect the binding changes?
Yes it should, willfix

Konrad
