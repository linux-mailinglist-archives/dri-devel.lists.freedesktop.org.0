Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F065C63979B
	for <lists+dri-devel@lfdr.de>; Sat, 26 Nov 2022 19:17:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C69E10E121;
	Sat, 26 Nov 2022 18:17:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 029A610E121
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Nov 2022 18:17:36 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id h11so3684508wrw.13
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Nov 2022 10:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2jWGZXUq/8NH1N5iaORK98xsLKjvX4aUS6R7xoBAWfQ=;
 b=Yk5MtSvDrz2lDTvFv5gsRvSq/RqCktYOZF1CEjtsNASsLLFKNubrwQg2NYJnWnRITd
 GL0KicO22ToPwOJU8pJ++LwRKSPJeznbWJW8bwGAMDvuO+r+z70M6BUMRw9X5D25JuY7
 KlZKDKQaIWjcCt02MxOnTIRGb1asuP6swytqACX0niBGMj/nOQ1SMc5rlr4JAfi64P+C
 zOPYariaXTC0f9gIvkl5oiATTQb8z4Txovjn6iivjX4CABwD5a3FBrjwrdgiLI0DiRR8
 ss7NBDaDqzGFcsjXjEfZXYQiKx5MJSjV31Hg3txAe3xnWeYFfoOIEng0+K1uRrFBMH11
 YsAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2jWGZXUq/8NH1N5iaORK98xsLKjvX4aUS6R7xoBAWfQ=;
 b=uhmsZGpXLvrDp0rVt7oXqWraGufwZAzQq5qpw+p4y5ka3HGFA5piEka9wYmGUnbM49
 z58q/dDnKZW554kXCuburfvO47U6sH+ba/9GUeh9VZmSwN55gw9k3EwvIGHWCm4dlOWG
 jLMfl7iEAthPxsq1LaPdCEKKJIkZ7l2laRFCuyFvOl0lpk2yTbbwEtW5YJ6B+FrO7mr+
 Hr/+DipAo0KqCnAXR40SwOPTms08tG8AuYW3+H14ASR4MhUIPLRRTce10pMAH7vE/kFi
 /rlZctgHTED9fKaWc71ONugRx85h8BahcaBCLBIz8EQ8NPFgLkbdl9FJ4eopYPWSzX0g
 04bw==
X-Gm-Message-State: ANoB5pmhgaXjgZNKn5cXTTocXWsy3HDpWfb1TX2JRJCwIYchQBoI3LgB
 hQC1mpqDccSbi1g8JD0toWHuZA==
X-Google-Smtp-Source: AA0mqf7/vDq4XHW5zFgdG2Q9cyHchw3hTW3makpdYNiTuYZBdx1CLJjIc+CScDaZNEb+YfbJlhIJBQ==
X-Received: by 2002:adf:f2d0:0:b0:242:7c:eb9c with SMTP id
 d16-20020adff2d0000000b00242007ceb9cmr8035275wrp.178.1669486655181; 
 Sat, 26 Nov 2022 10:17:35 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
 by smtp.gmail.com with ESMTPSA id
 t6-20020adfeb86000000b00241e5b917d0sm7604113wrn.36.2022.11.26.10.17.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Nov 2022 10:17:34 -0800 (PST)
Message-ID: <bf70adbc-f52d-6355-6b7d-b19561fed731@linaro.org>
Date: Sat, 26 Nov 2022 18:17:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 05/18] dt-bindings: msm: dsi-controller-main: Document
 clocks on a per compatible basis
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
 <20221124004801.361232-6-bryan.odonoghue@linaro.org>
 <fb3f9ad7-7b6f-fe22-8787-5bfa1d7caf05@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <fb3f9ad7-7b6f-fe22-8787-5bfa1d7caf05@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robh+dt@kernel.org, agross@kernel.org, dmitry.baryshkov@linaro.org,
 swboyd@chromium.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/11/2022 14:44, Krzysztof Kozlowski wrote:
> On 24/11/2022 01:47, Bryan O'Donoghue wrote:
>> Each compatible has a different set of clocks which are associated with it.
>> Add in the list of clocks for each compatible.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   .../display/msm/dsi-controller-main.yaml      | 154 ++++++++++++++++--
>>   1 file changed, 143 insertions(+), 11 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> index c4da7179999d2..88aac7d33555c 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> @@ -9,9 +9,6 @@ title: Qualcomm Display DSI controller
>>   maintainers:
>>     - Krishna Manikandan <quic_mkrishn@quicinc.com>
>>   
>> -allOf:
>> -  - $ref: "../dsi-controller.yaml#"
>> -
>>   properties:
>>     compatible:
>>       items:
>> @@ -48,13 +45,8 @@ properties:
>>         - description: Display AXI clock
>>   
>>     clock-names:
>> -    items:
>> -      - const: byte
>> -      - const: byte_intf
>> -      - const: pixel
>> -      - const: core
>> -      - const: iface
>> -      - const: bus
>> +    minItems: 6
>> +    maxItems: 9
>>   
>>     phys:
>>       maxItems: 1
>> @@ -147,6 +139,146 @@ required:
>>     - assigned-clock-parents
>>     - ports
>>   
>> +allOf:
>> +  - $ref: "../dsi-controller.yaml#"
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,apq8064-dsi-ctrl
>> +    then:
>> +      properties:
>> +        clocks:
>> +          maxItems: 7
>> +        clock-names:
>> +          items:
>> +            - const: iface
>> +            - const: bus
>> +            - const: core_mmss
>> +            - const: src
>> +            - const: byte
>> +            - const: pixel
>> +            - const: core
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,msm8916-dsi-ctrl
>> +    then:
>> +      properties:
>> +        clocks:
>> +          maxItems: 6
>> +        clock-names:
>> +          items:
>> +            - const: mdp_core
>> +            - const: iface
>> +            - const: bus
>> +            - const: byte
>> +            - const: pixel
>> +            - const: core
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,msm8974-dsi-ctrl
>> +    then:
>> +      properties:
>> +        clocks:
>> +          maxItems: 3
>> +        clock-names:
>> +          items:
>> +            - const: iface
>> +            - const: bus
>> +            - const: vsync
> 
> minItems are 6, so does it actually work?

Hmm.

I ran this using a recent version of dt-schema from github

DT_DOC_CHECKER=~/Development/qualcomm/dt-schema/tools/dt-doc-validate
DT_EXTRACT_EX=~/Development/qualcomm/dt-schema/tools/dt-extract-example
DT_MK_SCHEMA=~/Development/qualcomm/dt-schema/tools/dt-mk-schema
DT_CHECKER=~/Development/qualcomm/dt-schema/tools/dt-validate

make DT_CHECKER_FLAGS=-m dt_binding_check O=$BUILDDIR 
DT_DOC_CHECKER=$DT_DOC_CHECKER DT_EXTRACT_EX=$DT_EXTRACT_EX 
DT_MK_SCHEMA=$DT_MK_SCHEMA DT_CHECKER=$DT_CHECKER 
DT_SCHEMA_FILES=display/msm/dsi-controller-main.yaml -j `nproc`

Neither of these throw an warning in my compile log

arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts:&dsi0
arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts:&dsi0

thanks for spotting

>> -           compatible = "qcom,mdss-dsi-ctrl";
>> +           compatible = "qcom,sc7180-dsi-ctrl", "qcom,mdss-dsi-ctrl";
> 

already dropped in v4

