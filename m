Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F1C58F8C8
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 10:06:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 195C09F68D;
	Thu, 11 Aug 2022 08:05:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD849F5B7
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 08:05:04 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id d14so24480165lfl.13
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 01:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=AWObm1t2SGsfX+EOzuUn4SeYctPOHns23Pie8FOr12w=;
 b=blQsdmvcfi8aabm0W+4Bgxbof6mNYs6NonqMhJPZ1aVJaqcsFhXMdZFZDyiII01Fhf
 x9SHadRxyjNFE6LHkQukeYi/PX+T/LeY29ukbibda1AWyUU0JolhqKes7iKm6crF8upp
 PjVSelSX7gWdWVdY0E/fsOGQZv12TmTl0F0n04rlQS7j160OcGljnSOY0O6hsfmWLYNU
 erUQklKIcGEFmbm9uSYCv7VuYJBAX7vbCUJzTehyFcxuXxX4lfsmNtLHHZwkqSDtoRU4
 bFh+tOND5apR5OsJm2vyhaqZz8bRcXZMncjdCXcWwNp59SYUWZFKcpRUCvltmUjvXpVx
 jqOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=AWObm1t2SGsfX+EOzuUn4SeYctPOHns23Pie8FOr12w=;
 b=xpGEdOmVFl7JQzXOlF8GSnoW75EH3CV6w6E1v2ue463w8JVP22y26SAD1A7octGYEp
 ejhJ2yiDMBlUxU2Svwgbm780Cz7DC+1QD0do9PLiO2ezrECyyDjznep+SIq2EXUgN7e+
 c3Z5+CdFZtrsthTpxlVg/tIf4KBSqI+KabzZVhByCvG7jlFomHOVXc8Kg3VgGV9ndzPo
 jEjT6q7UIPUHfgUpd9XihfQ/YTbAzkjk+5j4HW4bXbpFfnjcdHNeBKV06aCuO70Z0YjV
 d4lHK44Dxls9BIm5tC6vN4S+sr0Y4b8PfTNG3oNbQTfRUOla3bQrIC5kcEtDliZfDZBw
 AytQ==
X-Gm-Message-State: ACgBeo29vFvcm5G1foESJzgTOjjNnFz684bk4YYzZuw+1VOVk9fxz57Q
 F9iMqpw7uWvK1VucoG8O+xvcCQ==
X-Google-Smtp-Source: AA6agR7A6T7SL1WDl9JlKh+6jE8mNB65VeBjyl40+g28JZzZxZZVG575FetC+Nlr08Mgmdi51/8NDQ==
X-Received: by 2002:a05:6512:c13:b0:48b:3b30:637d with SMTP id
 z19-20020a0565120c1300b0048b3b30637dmr9499019lfu.447.1660205100855; 
 Thu, 11 Aug 2022 01:05:00 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
 by smtp.gmail.com with ESMTPSA id
 y8-20020a2e95c8000000b0025d47a29734sm721935ljh.47.2022.08.11.01.04.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 01:05:00 -0700 (PDT)
Message-ID: <74afb676-4a85-7a8e-f7ea-20d8a0967d7d@linaro.org>
Date: Thu, 11 Aug 2022 11:04:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/3] dt-bindings: display/msm: Add binding for SC8280XP
 MDSS
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220811040121.3775613-1-bjorn.andersson@linaro.org>
 <20220811040121.3775613-2-bjorn.andersson@linaro.org>
 <db9b74f9-1f65-5b88-1c81-0a3fd6dcf9a6@linaro.org>
In-Reply-To: <db9b74f9-1f65-5b88-1c81-0a3fd6dcf9a6@linaro.org>
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/08/2022 10:56, Krzysztof Kozlowski wrote:
> On 11/08/2022 07:01, Bjorn Andersson wrote:
>> Add binding for the display subsystem and display processing unit in the
>> Qualcomm SC8280XP platform.
>>
>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> ---
>>  .../bindings/display/msm/dpu-sc8280xp.yaml    | 284 ++++++++++++++++++
>>  1 file changed, 284 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sc8280xp.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc8280xp.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc8280xp.yaml
>> new file mode 100644
>> index 000000000000..6c25943e639c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/dpu-sc8280xp.yaml
> 
> qcom prefix is needed (also when file is in msm subdir)
> 
> The file name should be based on compatible, so "qcom,sc8280xp-mdss.yaml"
> 
>> @@ -0,0 +1,284 @@
>> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/msm/dpu-sc8280xp.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Display Processing Unit for SC8280XP
>> +
>> +maintainers:
>> +  - Bjorn Andersson <bjorn.andersson@linaro.org>
>> +
>> +description:
>> +  Device tree bindings for MSM Mobile Display Subsystem (MDSS) that encapsulates
>> +  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
>> +  bindings of MDSS and DPU are mentioned for SC8280XP.
> 
> s/Device tree bindings//
> so just:
> 
> SC8280XP MSM Mobile Display Subsystem (MDSS) that encapsulates
> sub-blocks like DPU display controller, DSI and DP interfaces etc.
> 
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,sc8280xp-mdss
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  reg-names:
>> +    const: mdss
> 
> You do not need reg names for one item, especially if the name is kind
> of obvious... unless you re-use existing driver which needs it? Then
> maybe let's change the driver to take first element?

OK, I see the driver expects this. It seems it is legacy from
87729e2a7871 ("drm/msm: unify MDSS drivers") times. So it could be
changed to grab first element always (older MDSS with three reg items
still has mdss_phys at first item).

> 
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: Display AHB clock from gcc
>> +      - description: Display AHB clock from dispcc
>> +      - description: Display core clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: iface
>> +      - const: ahb
>> +      - const: core
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  interrupt-controller: true
>> +
>> +  "#address-cells": true
>> +
>> +  "#size-cells": true
> 
> I see other DPU bindings also specify both as "true". Why not a fixed
> number (const)?
> 
>> +
>> +  "#interrupt-cells":
>> +    const: 1
>> +
>> +  iommus:
>> +    items:
>> +      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port0
>> +
>> +  ranges: true
>> +
>> +  interconnects:
>> +    minItems: 2
> 
> No need for minItems in such case.
> 
>> +    maxItems: 2
>> +
>> +  interconnect-names:
>> +    items:
>> +      - const: mdp0-mem
>> +      - const: mdp1-mem
>> +
>> +  resets:
>> +    items:
>> +      - description: MDSS_CORE reset
>> +
>> +patternProperties:
>> +  "^display-controller@[0-9a-f]+$":
>> +    type: object
>> +    description: Node containing the properties of DPU.
> 
> additionalProperties:false on this level
> 
> which will point to missing properties (e.g. opp-table)

I'll fix existing bindings which have similar issue.


Best regards,
Krzysztof
