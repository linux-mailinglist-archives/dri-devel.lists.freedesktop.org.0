Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC98C58F7D3
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 08:43:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB03DA3E8D;
	Thu, 11 Aug 2022 06:43:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D13AA3E8A
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 06:43:06 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id s9so18370726ljs.6
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 23:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=y5FLc62ya38DCrndtGr7VVaO4umLSwe5yc3jrPdFBrc=;
 b=L1T1o8ZLdd5kbxyZjbXT0VQ5v2U/q5JVdFy57DZbCP0SNbQjsqKePpl+rzYwQFzV5M
 29v0Q06y1/W7DMjRiu9GCAd9Djt94Mhrbeky9w4L5xk3u1Co3GhxrrXef0rcSpsmUckr
 rXRRTKiX5qPxWLB7gIfUwN3+QeyEk9BrOucigGqNMtUfLEkDqEAp5aMKbMXSY4VB2eF+
 3xiDTTLRKjILEuGa6KU+qs0gK2H9Tx9ymABJmRl86YRLig4XV/LXIsTY6wtaKfcIIwpn
 D2o8Utp4GVH6MpEYvwUfk+79wt5tNkYv5ruSIjzGrVSF6VF9e5usgLnarhq0gsHMIISS
 W1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=y5FLc62ya38DCrndtGr7VVaO4umLSwe5yc3jrPdFBrc=;
 b=c7hScYLisNETrPuqSmC82vUoHIc1o8qj0aQNfcyegPfPgCAMoZK5J+ppwFLSln8PdG
 Vf5M6GkWcBqDl423047S7HTli75QN9lKqmVKjMP6hzSKeOvQvOPTV1YA1z+MHjUZLjMo
 nUa3bAcxHjIW+PAHM+Z11OTYa3PRgNa0yCsvh3HH3i7evitEZv+Np16p0n47nzO6tyZN
 9UJXsWlbApQIAWxehto2buG1bwl4doZm5sJgTj2CYkwOp3NmuQMgVZ8n2cb93kPa2ram
 lIoSXejCaQYftSFh+8S/oNYx+ndiVNuYFgEDZvgRJsFPjyObCgawNWVIHZpu/gt5mm9e
 vDXQ==
X-Gm-Message-State: ACgBeo39Ik+eDnYRGtfKLavtoPjXaNGan5ix3z198ov1zGVB985KM8BZ
 LoY9/hzQ39wfesOLZsL7pCUOZg==
X-Google-Smtp-Source: AA6agR4h+jzDsmikLvCssyfAVWexiXl8Fvftjc223qA8kNJVZYUbk3OTI+SNepuFVGd3G3IP6e5rpg==
X-Received: by 2002:a2e:b4ac:0:b0:25f:fc9f:bc2 with SMTP id
 q12-20020a2eb4ac000000b0025ffc9f0bc2mr2480323ljm.185.1660200185171; 
 Wed, 10 Aug 2022 23:43:05 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a05651c015000b0025e6e1c836dsm683249ljd.126.2022.08.10.23.43.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Aug 2022 23:43:03 -0700 (PDT)
Message-ID: <97934c11-4308-a579-9088-9356e0ccab1c@linaro.org>
Date: Thu, 11 Aug 2022 09:43:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/7] dt-bindings: msm/dp: Add SDM845 and SC8280XP
 compatibles
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20220810035013.3582848-1-bjorn.andersson@linaro.org>
 <20220810035013.3582848-2-bjorn.andersson@linaro.org>
 <c5cc8752-d7e2-b870-6887-c025137ed8a1@linaro.org>
 <20220810192029.GF200295-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220810192029.GF200295-robh@kernel.org>
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
Cc: freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/08/2022 22:20, Rob Herring wrote:
> On Wed, Aug 10, 2022 at 05:47:52PM +0300, Krzysztof Kozlowski wrote:
>> On 10/08/2022 06:50, Bjorn Andersson wrote:
>>> Add compatibles for the DisplayPort and Embedded DisplayPort blocks in
>>> Qualcomm SDM845 and SC8280XP platforms.
>>>
>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>>> ---
>>>  .../devicetree/bindings/display/msm/dp-controller.yaml         | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>> index 94bc6e1b6451..90f9302d1731 100644
>>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>> @@ -16,11 +16,14 @@ description: |
>>>  properties:
>>>    compatible:
>>>      enum:
>>> +      - qcom,sdm845-dp
>>>        - qcom,sc7180-dp
>>
>> Alphabetical order, please.
>>
>> The DTS warnings from the bot look unrelated to this patch.
> 
> Yes, but there are a ton of them and I thought Bjorn might care. Looks 
> like the schema is pretty out of sync with reality and they don't really 
> look like dts side fixes.

It's in progress by Dmitry:
https://lore.kernel.org/all/20220710084133.30976-1-dmitry.baryshkov@linaro.org/

Best regards,
Krzysztof
