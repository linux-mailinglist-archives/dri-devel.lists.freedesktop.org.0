Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E77164A63F
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 18:51:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CCCC10E23F;
	Mon, 12 Dec 2022 17:51:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78F9210E23F;
 Mon, 12 Dec 2022 17:51:46 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BCEnoLe022710; Mon, 12 Dec 2022 17:51:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=vX19RixNXtE5JzIcwAaYuGfkWjixcyt3CqvWW6bxrsg=;
 b=eDZi9K7Bu0C3QoQaPrEuA5UVNbz9NgupTaAuY20YsC+Q6kAzhnUr/GQvzQ1Gt8orX7/6
 wBMDPhYGlEREx+T6yijnOM38SqRKy2fwDQN/hxHFGTAmfL4mCScCS/nP682lKIQmGGLp
 1LSGl/o5aIJiuUEikRI2tpHyQnRT7aSVCgscQ9A/07UTzT1mf+ebRkt6LXhKD0hruW05
 ZPAz718H4tdlIPVvYrvbH1F9O0/A3bZIiFbpFTWR6ajPNBFhfzb4hOynM82Sbrl8XzhV
 AFOpW+4GFtZ02xN+mlQXULYqYcJPQ0QnPpUO4mmSNyMu/WPSBWrhJEFHvJfEWWsVcQXR Zw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3me09g9fh6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 17:51:40 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BCHpdrZ016805
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 17:51:39 GMT
Received: from [10.110.7.185] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 12 Dec
 2022 09:51:37 -0800
Message-ID: <8b306c8f-3089-4aaf-7fc1-038a8330c89a@quicinc.com>
Date: Mon, 12 Dec 2022 09:51:37 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v11 2/5] dt-bindings: msm/dp: add data-lanes and
 link-frequencies property
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@linux.ie>,
 <agross@kernel.org>, <andersson@kernel.org>,
 <konrad.dybcio@somainline.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <devicetree@vger.kernel.org>,
 <airlied@gmail.com>
References: <1670539015-11808-1-git-send-email-quic_khsieh@quicinc.com>
 <1670539015-11808-3-git-send-email-quic_khsieh@quicinc.com>
 <5a3865ed-8847-db04-3d60-f35438250bef@linaro.org>
 <5aa16223-dbf6-996c-1985-794302dcce91@quicinc.com>
 <be1411e8-1d07-7643-977c-a306016fd660@linaro.org>
 <b6d90c1f-5365-7197-be63-96c3d8cf0746@quicinc.com>
 <e53844b7-601b-f355-302b-cc871962a446@linaro.org>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <e53844b7-601b-f355-302b-cc871962a446@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: QrhoEHetR2ye-nVKglRGVqESAFaIt6LU
X-Proofpoint-GUID: QrhoEHetR2ye-nVKglRGVqESAFaIt6LU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999
 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212120161
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


On 12/8/2022 4:35 PM, Dmitry Baryshkov wrote:
> On 09/12/2022 02:22, Kuogee Hsieh wrote:
>>
>> On 12/8/2022 4:11 PM, Dmitry Baryshkov wrote:
>>> On 09/12/2022 01:38, Kuogee Hsieh wrote:
>>>>
>>>> On 12/8/2022 3:33 PM, Dmitry Baryshkov wrote:
>>>>> On 09/12/2022 00:36, Kuogee Hsieh wrote:
>>>>>> Add both data-lanes and link-frequencies property into endpoint
>>>>>>
>>>>>> Changes in v7:
>>>>>> -- split yaml out of dtsi patch
>>>>>> -- link-frequencies from link rate to symbol rate
>>>>>> -- deprecation of old data-lanes property
>>>>>>
>>>>>> Changes in v8:
>>>>>> -- correct Bjorn mail address to kernel.org
>>>>>>
>>>>>> Changes in v10:
>>>>>> -- add menu item to data-lanes and link-frequecnis
>>>>>>
>>>>>> Changes in v11:
>>>>>> -- add endpoint property at port@1
>>>>>>
>>>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>`
>>>>>
>>>>> Applying: dt-bindings: msm/dp: add data-lanes and link-frequencies 
>>>>> property
>>>>> .git/rebase-apply/patch:47: trailing whitespace.
>>>>>
>>>>> .git/rebase-apply/patch:51: trailing whitespace.
>>>>>
>>>>>
>>>>> Also the dt_binding_check fails with an error for this schema. And 
>>>>> after fixing the error in the schema I faced an example validation 
>>>>> error. Did you check that the schema is correct and that the 
>>>>> example validates against the schema?
>>>>
>>>> yes, but i run "make dt_binding_check 
>>>> DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/msm/dp-controller.yaml" 
>>>> at mu v5.15 branch since
>>>
>>> I wouldn't ask you to post the log here. But I don't think that 
>>> either of the errors that I see here is related to 5.15 vs 6.1-rc.
>>>
>>> In fact after applying this patch against 5.15 I saw the expected 
>>> failure:
>>>
>>> Documentation/devicetree/bindings/display/msm/dp-controller.yaml: 
>>> properties:required: ['port@0', 'port@1'] is not of type 'object', 
>>> 'boolean'
>>> Documentation/devicetree/bindings/display/msm/dp-controller.yaml: 
>>> properties: 'required' should not be valid under {'$ref': 
>>> '#/definitions/json-schema-prop-names'}
>>> Documentation/devicetree/bindings/display/msm/dp-controller.yaml: 
>>> ignoring, error in schema: properties: required
>>>
>>>>
>>>> "make dt_binding_check" does not work at msm-next branch.
>>>
>>> I went ahead and just checked.
>>>
>>> `make dt_binding_check DT_SCHEMA_FILES=display/msm`  works cleanly 
>>> in msm-next and reports a single example-related warning in 
>>> msm-next-lumag. I pushed a patch to fix that warning (wich can 
>>> hopefully be picked up by Abhinav into msm-fixes). So you can assume 
>>> that both these branches have consistent error-free display/msm 
>>> schemas.
>>>
>> I have clean msm-next branch (without my data-lines yaml patch 
>> applied) and run "make dt_binding_check 
>> DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/msm/dp-controller.yaml", 
>> then I saw below error messages.
>>
>> Have you run into this problem?
>
> No.

Did you do anything to fix "older dtschema instance"?

I had run "pip3 install dtschema --upgrade" according Rob Herring response.
but it still shows same problem.
Please let know how can I fix this problem.

>
>>
>>    HOSTCC  scripts/basic/fixdep
>>    HOSTCC  scripts/dtc/dtc.o
>>    HOSTCC  scripts/dtc/flattree.o
>>    HOSTCC  scripts/dtc/fstree.o
>>    HOSTCC  scripts/dtc/data.o
>>    HOSTCC  scripts/dtc/livetree.o
>>    HOSTCC  scripts/dtc/treesource.o
>>    HOSTCC  scripts/dtc/srcpos.o
>>    HOSTCC  scripts/dtc/checks.o
>>    HOSTCC  scripts/dtc/util.o
>>    LEX     scripts/dtc/dtc-lexer.lex.c
>>    HOSTCC  scripts/dtc/dtc-lexer.lex.o
>>    HOSTCC  scripts/dtc/dtc-parser.tab.o
>>    HOSTLD  scripts/dtc/dtc
>> sort: -:2: disorder: 2022.1
>> ERROR: dtschema minimum version is v2022.3
>> make[2]: *** [check_dtschema_version] Error 1
>> make[1]: *** [dt_binding_check] Error 2
>> make: *** [__sub-make] Error 2
>
> This means that somewhere in your path you have an older dtschema 
> instance.
>
> When you sent me a question regarding this error, I asked for the 
> additional info. You provided none. Instead you went on sending the 
> untested patch that doesn't work.

since i can not test it on msm-next so that I did test it at my v5-15 
branch.

besides, i think i have to sent the whole series patches include this 
one to address your new comments on other patch.

is this correct?


>
>>
>>>>
>>>> But I did not check trainiling whitespace this time.
>>>>
>>>>>
>>>>>> ---
>>>>>>   .../bindings/display/msm/dp-controller.yaml        | 27 
>>>>>> ++++++++++++++++++++++
>>>>>>   1 file changed, 27 insertions(+)
>>>>>>
>>>>>> diff --git 
>>>>>> a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml 
>>>>>> b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>>>> index f2515af..2a7fdef8 100644
>>>>>> --- 
>>>>>> a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>>>> +++ 
>>>>>> b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>>>> @@ -81,6 +81,7 @@ properties:
>>>>>>       data-lanes:
>>>>>>       $ref: /schemas/types.yaml#/definitions/uint32-array
>>>>>> +    deprecated: true
>>>>>>       minItems: 1
>>>>>>       maxItems: 4
>>>>>>       items:
>>>>>> @@ -96,6 +97,7 @@ properties:
>>>>>>       ports:
>>>>>>       $ref: /schemas/graph.yaml#/properties/ports
>>>>>> +
>>>>>>       properties:
>>>>>>         port@0:
>>>>>>           $ref: /schemas/graph.yaml#/properties/port
>>>>>> @@ -105,6 +107,29 @@ properties:
>>>>>>           $ref: /schemas/graph.yaml#/properties/port
>>>>>>           description: Output endpoint of the controller
>>>>>>   +        properties:
>>>>>> +          endpoint:
>>>>>> +            $ref: /schemas/media/video-interfaces.yaml#
>>>>>> +
>>>>>> +            properties:
>>>>>> +              remote-endpoint: true
>>>>>
>>>>> PLease add empty lines between the property definitions
>>>>>
>>>>>> +              data-lanes:
>>>>>> +                $ref: /schemas/types.yaml#/definitions/uint32-array
>>>>>
>>>>> This is already a part of video-interfaces, so you don't need $ref
>>>>>
>>>>>> +                minItems: 1
>>>>>> +                maxItems: 4
>>>>>> +                items:
>>>>>> +                  maximum: 3
>>>>>
>>>>> enum: [0, 1, 2, 3]
>>>>>
>>>>>> +              link-frequencies:
>>>>>> +                $ref: /schemas/types.yaml#/definitions/uint64-array
>>>>>> +                minItems: 1
>>>>>> +                maxItems: 4
>>>>>> +                items:
>>>>>> +                  maximum: 8100000000
>>>>>
>>>>> I think we can have enum here too.
>>>>>
>>>>>> +
>>>>>> +  required:
>>>>>> +    - port@0
>>>>>> +    - port@1
>>>>>> +
>>>>>>   required:
>>>>>>     - compatible
>>>>>>     - reg
>>>>>> @@ -193,6 +218,8 @@ examples:
>>>>>>                   reg = <1>;
>>>>>>                   endpoint {
>>>>>>                       remote-endpoint = <&typec>;
>>>>>> +                    data-lanes = <0 1>;
>>>>>> +                    link-frequencies = /bits/ 64 <1620000000 
>>>>>> 2700000000 5400000000 8100000000>;
>>>>>>                   };
>>>>>>               };
>>>>>>           };
>>>>>
>>>
>
