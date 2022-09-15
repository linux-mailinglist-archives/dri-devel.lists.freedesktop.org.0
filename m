Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D935B9B3B
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 14:44:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C194D10E1C6;
	Thu, 15 Sep 2022 12:44:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D4910E1BB
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 12:44:30 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id q21so30264198lfo.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 05:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=GbMPySDSU6WmgItxp994TYVOui10YiB6AOxxeQ38DWA=;
 b=OqodDEGO+HX5IYC9wkHWaQK5n7oCF9NayMeRaEdr5CfLpP6ZdmbbjKl0tYIp+k83/4
 bl180r0LxM8gmM+gUm4C2glC2htKXT5ok97uABU/WEVMlya+FWL2czplb1WcjMcCYlL0
 Cc/AcAwuPyOaFrCI4928xwDNL6hnRfgxgDOHxiANtwI4QcXwGTvm2xfcZB5vw9eR4i46
 DPPKaWjwnl7WqZUSjsR70Zysx599E3JZHvOcKTSUt5LX3Jmh7sFyMiBegFW1J6GmHifq
 mugNViCCsDLuqqkpTpQWAaZheQ5Xub+jqgdN7DdIfo3cEoGhEwnWww9aiR4gWPDEgQJ1
 mBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=GbMPySDSU6WmgItxp994TYVOui10YiB6AOxxeQ38DWA=;
 b=1pG4/1xrbRZUtHyXk9A3LfcwNUdH7YUNneGe2sPlIGA/OsiEYxMeyHF/9mA7ESCoPQ
 l7pDZsndbr7kEcrBj/RKND0GyPOE0fHjR/80nylvfjb10TCfCbePAo6gByBRaFcsKVmu
 WaPJbx/Fm0Ud/YQLSfXvYp17bdxw6DTB0vW5XP1hPR3DoBARshCRALS7BnaUT17CPz3k
 POr2d3Z/F0vq5f4K9jyGVPYh34eHGI2NFME3hunsx/rHS8IddkbE6adfiy3/pj3TnF94
 +4CwysHSVm/AbpipjFN69UL9lGqCKmWeljCDP2qJa2p7TZ4Gb7BPaFAWgBCkdWSImUsB
 JK+w==
X-Gm-Message-State: ACgBeo28dh3zMe4tKwW5N2MlWk33jWPFNCntqe29GbucU2xUUB3vIaIi
 sSBuTEF9hySEyJLWJffdkg2oeg==
X-Google-Smtp-Source: AA6agR5e3aLhLl+SPavx1J3SMAHglV+z0HW2twco7cekVm4i6twl/pbFFjIx5uZ3q6jZeGHephVbIA==
X-Received: by 2002:a05:6512:3185:b0:49c:3310:6910 with SMTP id
 i5-20020a056512318500b0049c33106910mr4619068lfe.352.1663245869189; 
 Thu, 15 Sep 2022 05:44:29 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a2eb7c8000000b0026c16e9e45bsm1954318ljo.17.2022.09.15.05.44.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Sep 2022 05:44:28 -0700 (PDT)
Message-ID: <49cb7d54-6546-5228-0c30-6b37faa87ec9@linaro.org>
Date: Thu, 15 Sep 2022 15:44:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v6 04/12] dt-bindings: display/msm: move common DPU
 properties to dpu-common.yaml
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Herring <robh@kernel.org>
References: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
 <20220901102312.2005553-5-dmitry.baryshkov@linaro.org>
 <20220907195904.GA98468-robh@kernel.org>
 <CAA8EJpoJk-_LC25uyqkQ0Q8CYziNuU8nSnExm40542xZcvcbxQ@mail.gmail.com>
In-Reply-To: <CAA8EJpoJk-_LC25uyqkQ0Q8CYziNuU8nSnExm40542xZcvcbxQ@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/09/2022 00:13, Dmitry Baryshkov wrote:
> On Wed, 7 Sept 2022 at 22:59, Rob Herring <robh@kernel.org> wrote:
>>
>> On Thu, Sep 01, 2022 at 01:23:04PM +0300, Dmitry Baryshkov wrote:
>>> Move properties common to all DPU DT nodes to the dpu-common.yaml.
>>>
>>> Note, this removes description of individual DPU port@ nodes. However
>>> such definitions add no additional value. The reg values do not
>>> correspond to hardware INTF indices. The driver discovers and binds
>>> these ports not paying any care for the order of these items. Thus just
>>> leave the reference to graph.yaml#/properties/ports and the description.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   .../bindings/display/msm/dpu-common.yaml      | 44 ++++++++++++++++++
>>>   .../bindings/display/msm/dpu-msm8998.yaml     | 46 ++-----------------
>>>   .../bindings/display/msm/dpu-qcm2290.yaml     | 41 ++---------------
>>>   .../bindings/display/msm/dpu-sc7180.yaml      | 45 ++----------------
>>>   .../bindings/display/msm/dpu-sc7280.yaml      | 45 ++----------------
>>>   .../bindings/display/msm/dpu-sdm845.yaml      | 46 ++-----------------
>>>   6 files changed, 64 insertions(+), 203 deletions(-)
>>>   create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-common.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
>>> new file mode 100644
>>> index 000000000000..bf5764e9932b
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
>>> @@ -0,0 +1,44 @@
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/display/msm/dpu-common.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Qualcomm Display DPU dt properties (common properties)
>>> +
>>> +maintainers:
>>> +  - Krishna Manikandan <quic_mkrishn@quicinc.com>
>>> +  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> +  - Rob Clark <robdclark@gmail.com>
>>> +
>>> +description: |
>>> +  Common properties for QCom DPU display controller.
>>> +
>>> +properties:
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +  power-domains:
>>> +    maxItems: 1
>>> +
>>> +  operating-points-v2: true
>>> +  opp-table:
>>> +    type: object
>>> +
>>> +  ports:
>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>> +    description: |
>>> +      Contains the list of output ports from DPU device. These ports
>>> +      connect to interfaces that are external to the DPU hardware,
>>> +      such as DSI, DP etc.
>>
>> Haven't we been over this already?
>>
>> You have to define 'port' nodes or else anything is allowed in them
>> (and endpoint nodes). If you want to define them as pattern, then fine.
>> But you must have a ref to graph.yaml#/properties/port.
> 
> Last time you asked to do this, I did a check. Adding any additional
> property results in a schema error. And this is logical.
> graph.yaml#/properties/ports already limits the node properties. I
> thus do not see a need to define port@[0-9a-f]+$. Did I miss anything?

I see, what I did miss now. I missed adding properties to individual 
/port nodes. Please excuse me. BTW: is there any reason for not 
enforcing this in the graph.yaml?

-- 
With best wishes
Dmitry

