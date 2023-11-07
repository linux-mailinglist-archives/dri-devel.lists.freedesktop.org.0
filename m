Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 306257E4ABD
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 22:33:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC3710E6BC;
	Tue,  7 Nov 2023 21:32:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A9E10E6BD
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 21:32:54 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2c50305c5c4so88961681fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Nov 2023 13:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699392772; x=1699997572; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cKkRos3AxLhlHLKkODxjEWuIyo1+V0s7ezJV36Xh+VA=;
 b=Cu1EiyITRZGEqKxbBFL8iEerMiSZNAg+pPXauGWDcvxcF6RYH9JAo+xBlKRu5ajudo
 nlZVZHUsP8mFqBLXR5VLhWF89gjN01PB0wRnGXmCdEqgfOcYLqpMSTSInVrMVDFZcTTN
 XJstl3Ajb/aRpxZ8fp7oa0Hy9JZVyUm7X62Rizcr3EBwhor7xqZLAbSWz00ij4A1+qZv
 ZdBlN4xLNy1le9RHuSS9WqdYIWLn3nRI1wDujsvYUfBPNxzD7HSR/CdyUUEtJBVt8jaI
 wRZfJjpQ5hui+Ky8AamNAqGUkorTmj8Q1APg7ZQrR8AtLv4BPxT02hqsv5hdHnDP/hPC
 2Mng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699392772; x=1699997572;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cKkRos3AxLhlHLKkODxjEWuIyo1+V0s7ezJV36Xh+VA=;
 b=FyqXluhc034/Sr7aQyeCHyeVm21uS80MR/MUBldB2yjwmWs67KHWDV3QSMuAH7LBYT
 Cgc6SJCrgMgrzIwIfWaVUJq+jRt//UgpU82C3Svh3aY8gZn09e8lkyEqwFxMCTtw5pfp
 k0PS2sW+8V28+J6LCIcDrCmOGtuZ0Uehz3GByUus6r8uym934UjLf87mcAdPbxN8mrmT
 tdnFqODt3jo8nxwNDzSn6KfQ1/HvaG95/dxNkXdjTyzTKqDZYVt3GqyheKO9UV9kv/Sf
 DF1GRzVXfs8EI1wgzBVthP/5uzafmOgnh76UyNN+q6mYZe8AX6PsIY2crV9motLW2qVY
 Tiww==
X-Gm-Message-State: AOJu0YztlUilM1eU1V2Jr3EZg/aq6E6RA473u9bOtqb7ewMbIx24hug3
 vC5B7Q+F0Ntk7K4VMn94OoS3Bw==
X-Google-Smtp-Source: AGHT+IGwYIGt9B8zSOa/PbmGSb6wiXglnteks8C5u7N6FQhpALXFUimVeS/glybjViPVk1eEEX9IQw==
X-Received: by 2002:a05:651c:1065:b0:2c5:25f3:8e1c with SMTP id
 y5-20020a05651c106500b002c525f38e1cmr146186ljm.21.1699392772585; 
 Tue, 07 Nov 2023 13:32:52 -0800 (PST)
Received: from [172.30.205.109] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 t4-20020a05651c148400b002b6daa3fa2csm1607587lje.69.2023.11.07.13.32.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Nov 2023 13:32:52 -0800 (PST)
Message-ID: <45fa235c-c09b-4ded-abc8-ac1d9835890d@linaro.org>
Date: Tue, 7 Nov 2023 22:32:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] dt-bindings: display/msm: Add reg bus and rotator
 interconnects
Content-Language: en-US
To: neil.armstrong@linaro.org, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230928113535.1217613-1-dmitry.baryshkov@linaro.org>
 <20230928113535.1217613-3-dmitry.baryshkov@linaro.org>
 <aaacd997-4b85-4086-982a-c992ad52831a@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <aaacd997-4b85-4086-982a-c992ad52831a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/6/23 16:45, Neil Armstrong wrote:
> Hi,
> 
> On 28/09/2023 13:35, Dmitry Baryshkov wrote:
>> From: Konrad Dybcio <konrad.dybcio@linaro.org>
>>
>> Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there are
>> other connection paths:
>> - a path that connects rotator block to the DDR.
>> - a path that needs to be handled to ensure MDSS register access
>>    functions properly, namely the "reg bus", a.k.a the CPU-MDSS CFG
>>    interconnect.
>>
>> Describe these paths bindings to allow using them in device trees and in
>> the driver
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/display/msm/mdss-common.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
>> index f69196e4cc76..6b4ce08a60dc 100644
>> --- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
>> @@ -66,12 +66,14 @@ properties:
>>       items:
>>         - description: Interconnect path from mdp0 (or a single mdp) port to the data bus
>>         - description: Interconnect path from mdp1 port to the data bus
>> +      - description: Interconnect path from CPU to the reg bus
>>     interconnect-names:
>>       minItems: 1
>>       items:
>>         - const: mdp0-mem
>>         - const: mdp1-mem
>> +      - const: cpu-cfg
>>     resets:
>>       items:
> 
> This is not enough, on sm8450 this still appears with patch applied:
> arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: display-subsystem@ae00000: interconnects: [[182, 14, 0, 30, 3, 0], [182, 14, 0, 30, 3, 0], [53, 2, 3, 183, 14, 3]] is too long
>          from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8450-mdss.yaml#
> arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: display-subsystem@ae00000: interconnect-names: ['mdp0-mem', 'mdp1-mem', 'cpu-cfg'] is too long
>          from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8450-mdss.yaml#
I assume this is with the path actually added in the dt, and
not just with this patch applied?

I guess increasing the numbers from the getgo would probably
be good idea too :)

Konrad
