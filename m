Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B78647AD4
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 01:36:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FAAC10E4F1;
	Fri,  9 Dec 2022 00:35:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB6210E206
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 00:35:48 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id 1so4628436lfz.4
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Dec 2022 16:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u9i6tSwEYMMAQhxXNd22Ibb8itC1fP4PyffqUvO3Sp0=;
 b=w0dCi8LMFFLIwv9l8ZHEkvSMj0cu9rLyqukdYLaOGOhZdP5ShfHSzL1DFsug8nOW2U
 7Hv32ruiYInr8Zz72srEFfkLY522kax3mnidwyoSp59oBxJcCrOrtmtZ10RKx1pxkGs7
 /mZK2JvRnhX8tNPCCPKno/nePmAcuMD3rUzYkNPn/SUdBQoj5cioWtcaXJmAJEqDxlsO
 kXUx/kJGdyo7Iddd+BIiswkWaaKvYo+KiWhm56KBO+n0ZcLHApOD6JoXz+3ZcfceBZcZ
 IhKDod81lUt8DaXm57bK0lWbAULZACw42SZ9hZJuCwSVjUkOVFh3YVxZ1QWIgFy5lqyu
 +tGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u9i6tSwEYMMAQhxXNd22Ibb8itC1fP4PyffqUvO3Sp0=;
 b=lAu8vB6G9ij+tOt5j3NyrcxMe++rKMfEAaDC0S+X3JGGvD5tr57dxYpIfv6wa5klID
 liF+32tEdanTliAftCtjW3YHNI9rZoY9Z/N9t1qri2IABo4PbO8QClsWfId4+5AWCvF5
 q0rbAqRUXBrZsDDMnP7wCCq4WxDUAZfsJWqNAFjCFwqNKmpCL8EEG1VvMsc0YpL0jgUt
 BMy8BDv1SD9vo/XlCLczJqtUTzbKoxLSHFEdwsdCxNanA/uO8nC4hqAEKgJ9LesIBuzc
 y2pAiyT4431Gdhpx9oLkykKGcFfRZ5M6PMW58jH4/kU0aQ+U6OkgbmSu+azbIHASnCNt
 tm0w==
X-Gm-Message-State: ANoB5pneuQdOHTHT/MBpLiyp2Hs8FOtBxCmsL4jKwUZiZqqy9fjV44TM
 067N+Isr6PwZEFJfNVjhsuwHIg==
X-Google-Smtp-Source: AA0mqf7I3ZRSP2xjQAxL8LPJRhqpQO/Grjq0p57nj0CmHvYCy7hYf+K/liWo0VkYQwpbumlYCYOjmg==
X-Received: by 2002:a05:6512:1394:b0:4b5:de9:a12f with SMTP id
 p20-20020a056512139400b004b50de9a12fmr1417991lfa.12.1670546146352; 
 Thu, 08 Dec 2022 16:35:46 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 bt14-20020a056512260e00b004a44ffb1023sm19597lfb.57.2022.12.08.16.35.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Dec 2022 16:35:45 -0800 (PST)
Message-ID: <e53844b7-601b-f355-302b-cc871962a446@linaro.org>
Date: Fri, 9 Dec 2022 02:35:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v11 2/5] dt-bindings: msm/dp: add data-lanes and
 link-frequencies property
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
 agross@kernel.org, andersson@kernel.org, konrad.dybcio@somainline.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 devicetree@vger.kernel.org, airlied@gmail.com
References: <1670539015-11808-1-git-send-email-quic_khsieh@quicinc.com>
 <1670539015-11808-3-git-send-email-quic_khsieh@quicinc.com>
 <5a3865ed-8847-db04-3d60-f35438250bef@linaro.org>
 <5aa16223-dbf6-996c-1985-794302dcce91@quicinc.com>
 <be1411e8-1d07-7643-977c-a306016fd660@linaro.org>
 <b6d90c1f-5365-7197-be63-96c3d8cf0746@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <b6d90c1f-5365-7197-be63-96c3d8cf0746@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/12/2022 02:22, Kuogee Hsieh wrote:
> 
> On 12/8/2022 4:11 PM, Dmitry Baryshkov wrote:
>> On 09/12/2022 01:38, Kuogee Hsieh wrote:
>>>
>>> On 12/8/2022 3:33 PM, Dmitry Baryshkov wrote:
>>>> On 09/12/2022 00:36, Kuogee Hsieh wrote:
>>>>> Add both data-lanes and link-frequencies property into endpoint
>>>>>
>>>>> Changes in v7:
>>>>> -- split yaml out of dtsi patch
>>>>> -- link-frequencies from link rate to symbol rate
>>>>> -- deprecation of old data-lanes property
>>>>>
>>>>> Changes in v8:
>>>>> -- correct Bjorn mail address to kernel.org
>>>>>
>>>>> Changes in v10:
>>>>> -- add menu item to data-lanes and link-frequecnis
>>>>>
>>>>> Changes in v11:
>>>>> -- add endpoint property at port@1
>>>>>
>>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>`
>>>>
>>>> Applying: dt-bindings: msm/dp: add data-lanes and link-frequencies 
>>>> property
>>>> .git/rebase-apply/patch:47: trailing whitespace.
>>>>
>>>> .git/rebase-apply/patch:51: trailing whitespace.
>>>>
>>>>
>>>> Also the dt_binding_check fails with an error for this schema. And 
>>>> after fixing the error in the schema I faced an example validation 
>>>> error. Did you check that the schema is correct and that the example 
>>>> validates against the schema?
>>>
>>> yes, but i run "make dt_binding_check 
>>> DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/msm/dp-controller.yaml" at mu v5.15 branch since
>>
>> I wouldn't ask you to post the log here. But I don't think that either 
>> of the errors that I see here is related to 5.15 vs 6.1-rc.
>>
>> In fact after applying this patch against 5.15 I saw the expected 
>> failure:
>>
>> Documentation/devicetree/bindings/display/msm/dp-controller.yaml: 
>> properties:required: ['port@0', 'port@1'] is not of type 'object', 
>> 'boolean'
>> Documentation/devicetree/bindings/display/msm/dp-controller.yaml: 
>> properties: 'required' should not be valid under {'$ref': 
>> '#/definitions/json-schema-prop-names'}
>> Documentation/devicetree/bindings/display/msm/dp-controller.yaml: 
>> ignoring, error in schema: properties: required
>>
>>>
>>> "make dt_binding_check" does not work at msm-next branch.
>>
>> I went ahead and just checked.
>>
>> `make dt_binding_check DT_SCHEMA_FILES=display/msm`  works cleanly in 
>> msm-next and reports a single example-related warning in 
>> msm-next-lumag. I pushed a patch to fix that warning (wich can 
>> hopefully be picked up by Abhinav into msm-fixes). So you can assume 
>> that both these branches have consistent error-free display/msm schemas.
>>
> I have clean msm-next branch (without my data-lines yaml patch applied) 
> and run "make dt_binding_check 
> DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/msm/dp-controller.yaml", then I saw below error messages.
> 
> Have you run into this problem?

No.

> 
>    HOSTCC  scripts/basic/fixdep
>    HOSTCC  scripts/dtc/dtc.o
>    HOSTCC  scripts/dtc/flattree.o
>    HOSTCC  scripts/dtc/fstree.o
>    HOSTCC  scripts/dtc/data.o
>    HOSTCC  scripts/dtc/livetree.o
>    HOSTCC  scripts/dtc/treesource.o
>    HOSTCC  scripts/dtc/srcpos.o
>    HOSTCC  scripts/dtc/checks.o
>    HOSTCC  scripts/dtc/util.o
>    LEX     scripts/dtc/dtc-lexer.lex.c
>    HOSTCC  scripts/dtc/dtc-lexer.lex.o
>    HOSTCC  scripts/dtc/dtc-parser.tab.o
>    HOSTLD  scripts/dtc/dtc
> sort: -:2: disorder: 2022.1
> ERROR: dtschema minimum version is v2022.3
> make[2]: *** [check_dtschema_version] Error 1
> make[1]: *** [dt_binding_check] Error 2
> make: *** [__sub-make] Error 2

This means that somewhere in your path you have an older dtschema instance.

When you sent me a question regarding this error, I asked for the 
additional info. You provided none. Instead you went on sending the 
untested patch that doesn't work.

> 
>>>
>>> But I did not check trainiling whitespace this time.
>>>
>>>>
>>>>> ---
>>>>>   .../bindings/display/msm/dp-controller.yaml        | 27 
>>>>> ++++++++++++++++++++++
>>>>>   1 file changed, 27 insertions(+)
>>>>>
>>>>> diff --git 
>>>>> a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml 
>>>>> b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>>> index f2515af..2a7fdef8 100644
>>>>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>>> @@ -81,6 +81,7 @@ properties:
>>>>>       data-lanes:
>>>>>       $ref: /schemas/types.yaml#/definitions/uint32-array
>>>>> +    deprecated: true
>>>>>       minItems: 1
>>>>>       maxItems: 4
>>>>>       items:
>>>>> @@ -96,6 +97,7 @@ properties:
>>>>>       ports:
>>>>>       $ref: /schemas/graph.yaml#/properties/ports
>>>>> +
>>>>>       properties:
>>>>>         port@0:
>>>>>           $ref: /schemas/graph.yaml#/properties/port
>>>>> @@ -105,6 +107,29 @@ properties:
>>>>>           $ref: /schemas/graph.yaml#/properties/port
>>>>>           description: Output endpoint of the controller
>>>>>   +        properties:
>>>>> +          endpoint:
>>>>> +            $ref: /schemas/media/video-interfaces.yaml#
>>>>> +
>>>>> +            properties:
>>>>> +              remote-endpoint: true
>>>>
>>>> PLease add empty lines between the property definitions
>>>>
>>>>> +              data-lanes:
>>>>> +                $ref: /schemas/types.yaml#/definitions/uint32-array
>>>>
>>>> This is already a part of video-interfaces, so you don't need $ref
>>>>
>>>>> +                minItems: 1
>>>>> +                maxItems: 4
>>>>> +                items:
>>>>> +                  maximum: 3
>>>>
>>>> enum: [0, 1, 2, 3]
>>>>
>>>>> +              link-frequencies:
>>>>> +                $ref: /schemas/types.yaml#/definitions/uint64-array
>>>>> +                minItems: 1
>>>>> +                maxItems: 4
>>>>> +                items:
>>>>> +                  maximum: 8100000000
>>>>
>>>> I think we can have enum here too.
>>>>
>>>>> +
>>>>> +  required:
>>>>> +    - port@0
>>>>> +    - port@1
>>>>> +
>>>>>   required:
>>>>>     - compatible
>>>>>     - reg
>>>>> @@ -193,6 +218,8 @@ examples:
>>>>>                   reg = <1>;
>>>>>                   endpoint {
>>>>>                       remote-endpoint = <&typec>;
>>>>> +                    data-lanes = <0 1>;
>>>>> +                    link-frequencies = /bits/ 64 <1620000000 
>>>>> 2700000000 5400000000 8100000000>;
>>>>>                   };
>>>>>               };
>>>>>           };
>>>>
>>

-- 
With best wishes
Dmitry

