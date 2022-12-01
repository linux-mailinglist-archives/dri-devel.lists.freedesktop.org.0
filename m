Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 953A663F97D
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 21:59:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC0A510E165;
	Thu,  1 Dec 2022 20:59:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1940210E165;
 Thu,  1 Dec 2022 20:59:49 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B1IvkNo002451; Thu, 1 Dec 2022 20:59:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=XDgYg3w9shpU1glhcMgxaWYoqR5vgNCgIMuxjynzP7o=;
 b=R+ms/Ci2pyX8uyiIZoHVv7bJYDBKzVte/W8xeeyAc3R+XLmeOPAIo67YqQqLf0NUEnAA
 KVkVa0s3WynAo1aOxlxGNYP7i8a3XZPZWxsRU3PSwgBt8nXsCIWQNnPOk10Att3pENSt
 +NkVgQoecNJrP2PG8F4t0rtieuZRqwqn+5AaZckZMGAkSbB3PR4MymHMvH7JScfL4OMf
 lzLaZZ8lr6WZ5NrKCQH+7wOxii+/+qeIYQS8SwipQ8HoLOl8LSlW1WyVFaDBMWocctIN
 Gyse8Bs9I+hHd1VAbFtOfzWJqf4DA6Ot4N2pPpM8XfLJJj+/biUNm+zIMWy0xAwzpPGI NQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m6k6jum8c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Dec 2022 20:59:42 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2B1Kxfvp022383
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 1 Dec 2022 20:59:41 GMT
Received: from [10.110.18.228] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 1 Dec 2022
 12:59:39 -0800
Message-ID: <ba417e4f-d80f-aa7b-6d0a-ee9d72be4e65@quicinc.com>
Date: Thu, 1 Dec 2022 12:59:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v6 1/4] arm64: dts: qcom: add data-lanes and
 link-freuencies into dp_out endpoint
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@linux.ie>,
 <agross@kernel.org>, <bjorn.andersson@linaro.org>
References: <1669852310-22360-1-git-send-email-quic_khsieh@quicinc.com>
 <1669852310-22360-2-git-send-email-quic_khsieh@quicinc.com>
 <7bf73466-e476-4a1d-5dc0-1b63ea742226@linaro.org>
 <29d12e26-b3c8-dbf6-de1f-5c6ae4a5a705@linaro.org>
 <f03233b4-2850-c206-724c-0b6568b6a876@quicinc.com>
 <4ff2a5f9-1fc9-a431-b5f1-f65df7e47caa@linaro.org>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <4ff2a5f9-1fc9-a431-b5f1-f65df7e47caa@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: XEN-oko8Avm_18G1lCVZuKLmUNVTrzGX
X-Proofpoint-GUID: XEN-oko8Avm_18G1lCVZuKLmUNVTrzGX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-01_14,2022-12-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 mlxscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212010161
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


On 12/1/2022 9:49 AM, Dmitry Baryshkov wrote:
> On 01/12/2022 19:32, Kuogee Hsieh wrote:
>>
>> On 11/30/2022 4:21 PM, Dmitry Baryshkov wrote:
>>> On 01/12/2022 02:07, Dmitry Baryshkov wrote:
>>>> On 01/12/2022 01:51, Kuogee Hsieh wrote:
>>>>> Move data-lanes property from mdss_dp node to dp_out endpoint. Also
>>>>> add link-frequencies property into dp_out endpoint as well. The last
>>>>> frequency specified at link-frequencies will be the max link rate
>>>>> supported by DP.
>>>>>
>>>>> Changes in v5:
>>>>> -- revert changes at sc7180.dtsi and sc7280.dtsi
>>>>> -- add &dp_out to sc7180-trogdor.dtsi and sc7280-herobrine.dtsi
>>>>>
>>>>> Changes in v6:
>>>>> -- add data-lanes and link-frequencies to yaml
>>>>>
>>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>>>> ---
>>>>>   .../devicetree/bindings/display/msm/dp-controller.yaml | 17 
>>>>> +++++++++++++++++
>>>>
>>>> Separate patch. Also you didn't check the get_maintainers output, 
>>>> so required parties were not included into the distribution.
>>>>
>>>> Also as you'd check the get_maintainers output, please fix other 
>>>> email addresses too.
>>>>
>>>>> arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi |  6 +++++-
>>>>>   arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi |  6 +++++-
>>>>>   3 files changed, 27 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git 
>>>>> a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml 
>>>>> b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>>> index 94bc6e1..af70343 100644
>>>>> --- 
>>>>> a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>>> +++ 
>>>>> b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>>> @@ -90,6 +90,20 @@ properties:
>>>>>           $ref: /schemas/graph.yaml#/properties/port
>>>>>           description: Output endpoint of the controller
>>>>> +        properties:
>>>>> +          endpoint:
>>>>> +            $ref: /schemas/media/video-interfaces.yaml#
>>>>> +
>>>>> +          properties:
>>>>> +            link-frequencies: true
>>>>> +            data-lanes: true
>>>>
>>>> No. Use $ref for both of them.
>>>>
>>>>> +
>>>>> +          required:
>>>>> +            - link-frequencies
>>>>> +            - data-lanes
>>>>
>>>> No, they are not required.
>>>>
>>>>> +
>>>>> +          additionalProperties: false
>>>>> +
>>>>
>>>> deprecation of old data-lanes property?
>>>>
>>>>>   required:
>>>>>     - compatible
>>>>>     - reg
>>>>> @@ -158,6 +172,9 @@ examples:
>>>>>                   reg = <1>;
>>>>>                   endpoint {
>>>>>                       remote-endpoint = <&typec>;
>>>>> +                    data-lanes = <1 2>;
>>>>> +                    link-frequencies = /bits/ 64 <160000000 
>>>>> 270000000
>>>
>>> s/1600/1620
>>>
>>>>> + 540000000 810000000>;
>>>>
>>>> I guess the number of zeroes is wrong here. This is 160 MHz ... 810 
>>>> Mhz, rather than 1.6 GHz ... 8.1 GHz
>>>
>>> Ok, I was wrong here. The old code definitely defaults to 570 
>>> mega-something. Now I'd really like to read your description for the 
>>> link-frequencies property, because the 
>>> phy_configure_opts_dp::link_rate is clearly specified in Mb/s and it 
>>> takes a fixed set of values from 1.62 Gb/s up to 8.1 Gb/s.
>>>
>>> I think the drm_dp_bw_code_to_link_rate() function is incorrect by 
>>> itself, as it multiplies with 27000 (27 Mbps) rather than 270000 
>>> (0.27 Gbps) as required by the standard. So first, we should fix the 
>>> function, then all the rates would become logical.
>>
>> no, drm_dp_bw_code_to_link_rate() is correct and should not be 
>> changes since it impact to other dp drivers too.
>>
>> 0.27Gbps/lane is specified at DP spec.
>>
>> DP use 8b/10b coding rule (10 bits symbol contains 8 bits data).
>
> At least it should get documentation that it returns Kylo-bytes per 
> second.
>
> But, getting back to link-frequencies. The documentation clearly says 
> that it should be allowed data bus _frequencies_. And frequencies are 
> measured in Hz, not in bits/sec or bytes/sec.

ok, in the case, we can specify link frequency (symbol rate), such as 
81000000000 (8.1G hz), at dtsi to match link-frequencies cocumentation.

then at parser, we have to divided by 10 to convert back to link rate 
and then divided by 1000 to  convert to kb.

is this work for you?

>
>
>>>>>                   };
>>>>>               };
>>>>>           };
>>>>> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi 
>>>>> b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
>>>>> index 754d2d6..39f0844 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
>>>>> @@ -812,7 +812,11 @@ hp_i2c: &i2c9 {
>>>>>       status = "okay";
>>>>>       pinctrl-names = "default";
>>>>>       pinctrl-0 = <&dp_hot_plug_det>;
>>>>> -    data-lanes = <0 1>;
>>>>> +};
>>>>> +
>>>>> +&dp_out {
>>>>> +    data-lanes = <0  1>;
>>>>> +    link-frequencies = /bits/ 64 <160000000 270000000 540000000>;
>>>>
>>>> Same comment here.
>>>>
>>>>>   };
>>>>>   &pm6150_adc {
>>>>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi 
>>>>> b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
>>>>> index 93e39fc..b7c343d 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
>>>>> @@ -440,7 +440,11 @@ ap_i2c_tpm: &i2c14 {
>>>>>       status = "okay";
>>>>>       pinctrl-names = "default";
>>>>>       pinctrl-0 = <&dp_hot_plug_det>;
>>>>> -    data-lanes = <0 1>;
>>>>> +};
>>>>> +
>>>>> +&dp_out {
>>>>> +    data-lanes = <0  1>;
>>>>> +    link-frequencies = /bits/ 64 <160000000 270000000 540000000 
>>>>> 810000000>;
>>>>
>>>> And here.
>>>>
>>>>>   };
>>>>>   &mdss_mdp {
>>>>
>>>
>
