Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 775548D4198
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 00:58:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F8710F74B;
	Wed, 29 May 2024 22:58:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="jPjYbR+K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E389910F67A;
 Wed, 29 May 2024 22:57:51 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44TMuvRA016844;
 Wed, 29 May 2024 22:57:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MMJs3co4mvSkL4XZ0cNe7QgiSUAwcWuDvZTL61W3bNY=; b=jPjYbR+KObqoOIv6
 7oQUKSi5oSQwVcfsrKcq1k3/SNO8nKru98PUPk7kP+ljnEk8qHGwplWJmOnzwhLh
 JOdL3HWAXP0twqn1EpfNxNn0U09L8IF1h8lY9HEB0mL7jQ2LKA3Eik8Rg8NY9+E/
 kSXQPSoU/JYxisQidLaFlQ6CEve4D72FnvVPR2dSumsLcEVtXsE3tf4aZhyYhBS7
 bl+psx7i/y19a+V5UxepOY1Ppyb806J9LAmvy0V88M3qf4WDJuwfs2JawzMSJT5l
 UYJc5VxJpxDr1U8bjA27Wlzad56J/DACornuWwb/peJB2yPBC04dd0JM6EUTx9uH
 mCzdlA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0ptc58-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 May 2024 22:57:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44TMvgrB006929
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 May 2024 22:57:42 GMT
Received: from [10.71.110.249] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 29 May
 2024 15:57:36 -0700
Message-ID: <d1a9be5d-b0a0-73bc-c66f-6d45049fbaf1@quicinc.com>
Date: Wed, 29 May 2024 15:57:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/7] dt-bindings: display/msm/dsi: allow specifying TE
 source
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>
References: <20240520-dpu-handle-te-signal-v1-0-f273b42a089c@linaro.org>
 <20240520-dpu-handle-te-signal-v1-1-f273b42a089c@linaro.org>
 <224fa477-07ba-e7b2-2f7d-8f7d21f4a0c7@quicinc.com>
 <CAA8EJpp8kRPKboHNHwD+R5f1AcndjaQdGG=Q4ygmRE9VMNievQ@mail.gmail.com>
 <5cde2f43-89ab-d2d4-d68e-605f8f5d1da7@quicinc.com>
 <CAA8EJpoMtr6OGjL8qq-cHadQSOVyDAaL8=2TLvOjBbYV2Z7+Mg@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpoMtr6OGjL8qq-cHadQSOVyDAaL8=2TLvOjBbYV2Z7+Mg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: jC9m0TZ3p9B7s5YTbJuMUWSKFQnJGUWq
X-Proofpoint-GUID: jC9m0TZ3p9B7s5YTbJuMUWSKFQnJGUWq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_16,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 mlxscore=0 spamscore=0 adultscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405290164
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/23/2024 2:58 AM, Dmitry Baryshkov wrote:
> On Thu, 23 May 2024 at 02:57, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 5/22/2024 1:05 PM, Dmitry Baryshkov wrote:
>>> On Wed, 22 May 2024 at 21:38, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 5/20/2024 5:12 AM, Dmitry Baryshkov wrote:
>>>>> Command mode panels provide TE signal back to the DSI host to signal
>>>>> that the frame display has completed and update of the image will not
>>>>> cause tearing. Usually it is connected to the first GPIO with the
>>>>> mdp_vsync function, which is the default. In such case the property can
>>>>> be skipped.
>>>>>
>>>>
>>>> This is a good addition overall. Some comments below.
>>>>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> ---
>>>>>     .../bindings/display/msm/dsi-controller-main.yaml        | 16 ++++++++++++++++
>>>>>     1 file changed, 16 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>>>>> index 1fa28e976559..c1771c69b247 100644
>>>>> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>>>>> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>>>>> @@ -162,6 +162,21 @@ properties:
>>>>>                     items:
>>>>>                       enum: [ 0, 1, 2, 3 ]
>>>>>
>>>>> +              qcom,te-source:
>>>>> +                $ref: /schemas/types.yaml#/definitions/string
>>>>> +                description:
>>>>> +                  Specifies the source of vsync signal from the panel used for
>>>>> +                  tearing elimination. The default is mdp_gpio0.
>>>>
>>>> panel --> command mode panel?
>>>>
>>>>> +                enum:
>>>>> +                  - mdp_gpio0
>>>>> +                  - mdp_gpio1
>>>>> +                  - mdp_gpio2
>>>>
>>>> are gpio0, gpio1 and gpio2 referring to the vsync_p, vsync_s and vsync_e
>>>> sources?
>>>
>>> No idea, unfortunately. They are gpioN or just mdp_vsync all over the
>>> place. For the reference, in case of the SDM845 and Pixel3 the signal
>>> is routed through SoC GPIO12.
>>>
>>
>> GPIO12 on sdm845 is mdp_vsync_e.
>>
>> Thats why I think its better we use mdp_vsync_p/s/e instead of mdp_gpio0/1/2
> 
> Sure. This matches pins description. Are you fine with changing
> defines in DPU driver to VSYNC_P / _S / _E too ?
> 

Sorry for the delay in responding.

As per the software docs, the registers still use GPIO0/1/2.

Only the pin descriptions use vsync_p/s/e.

Hence I think we can make DPU driver to use 0/1/2.

>>
>>>> In that case wouldnt it be better to name it like that?
>>>>
>>>>> +                  - timer0
>>>>> +                  - timer1
>>>>> +                  - timer2
>>>>> +                  - timer3
>>>>> +                  - timer4
>>>>> +
>>>>
>>>> These are indicating watchdog timer sources right?
>>>
>>> Yes.
>>>

ack.

>>>>
>>>>>         required:
>>>>>           - port@0
>>>>>           - port@1
>>>>> @@ -452,6 +467,7 @@ examples:
>>>>>                               dsi0_out: endpoint {
>>>>>                                        remote-endpoint = <&sn65dsi86_in>;
>>>>>                                        data-lanes = <0 1 2 3>;
>>>>> +                                   qcom,te-source = "mdp_gpio2";
>>>>
>>>> I have a basic doubt on this. Should te-source should be in the input
>>>> port or the output one for the controller? Because TE is an input to the
>>>> DSI. And if the source is watchdog timer then it aligns even more as a
>>>> property of the input endpoint.
>>>
>>> I don't really want to split this. Both data-lanes and te-source are
>>> properties of the link between the DSI and panel. You can not really
>>> say which side has which property.
>>>
>>
>> TE is an input to the DSI from the panel. Between input and output port,
>> I think it belongs more to the input port.
> 
> Technically we don't have in/out ports. There are two ports which
> define a link between two instances. For example, if the panel
> supports getting information through DCS commands, then "panel input"
> also becomes "panel output".
> 

The ports are labeled dsi0_in and dsi0_out. Putting te source in 
dsi0_out really looks very confusing to me.

>>
>> I didnt follow why this is a link property. Sorry , I didnt follow the
>> split part.
> 
> There is a link between the DSI host and the panel. I don't want to
> end up in a situation when the properties of the link are split
> between two different nodes.
> 

It really depends on what the property denotes. I do not think this 
should be the reason to do it this way.

>>
>> If we are unsure about input vs output port, do you think its better we
>> make it a property of the main dsi node instead?
> 
> No, it's not a property of the DSI node at all. If the vendor rewires
> the panel GPIOs or (just for example regulators), it has nothing to do
> with the DSI host.

Ack to this.

> 
> --
> With best wishes
> Dmitry
