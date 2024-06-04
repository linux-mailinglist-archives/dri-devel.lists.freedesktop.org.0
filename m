Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 361628FBAF3
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 19:52:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDA4810E2B9;
	Tue,  4 Jun 2024 17:52:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="erw9OvE7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8219C10E2B9;
 Tue,  4 Jun 2024 17:52:18 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 454HSNs2005979;
 Tue, 4 Jun 2024 17:52:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xyx00geyLFrC218kmTryUN9Ei7VUlaBmJivrrBGDzls=; b=erw9OvE7J7jjZ2e/
 TaR2M5qeKQDMlI02ogdD62VrYnQ5/M0g6Z2yqmIGkG2HQQFsbdydZy7ljOUUG2av
 hQdaDg7TUaEBMZdhiPMRkoNskFeCuPNYwFAf66bkyQ2ldUQAsQrKhWeAtlJzez2P
 i7vT1w5Kaj7esib081tPWmmK2ntChKzDZPQq0hiKdl6ORegVMXgQa2jsXMeKGmd7
 3d8jXtQuGK5GsuGaWGUtF1g38otSpPOifDfhPxHAMJQiClaR6VQ88L/Cm97AqP48
 DyAe/Gjpkz2kNEwlly+hNgQEbFYtFKpjbP4aEUa56r5BuDLbM7mCFQJdhzB7aqV3
 Ox0fUw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yj7brr1ua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jun 2024 17:52:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 454HqA2g025219
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 4 Jun 2024 17:52:10 GMT
Received: from [10.110.31.89] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Jun 2024
 10:52:05 -0700
Message-ID: <a380d953-a920-6cb1-3464-9aa925561393@quicinc.com>
Date: Tue, 4 Jun 2024 10:52:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/7] dt-bindings: display/msm/dsi: allow specifying TE
 source
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
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
References: <20240520-dpu-handle-te-signal-v1-1-f273b42a089c@linaro.org>
 <224fa477-07ba-e7b2-2f7d-8f7d21f4a0c7@quicinc.com>
 <CAA8EJpp8kRPKboHNHwD+R5f1AcndjaQdGG=Q4ygmRE9VMNievQ@mail.gmail.com>
 <5cde2f43-89ab-d2d4-d68e-605f8f5d1da7@quicinc.com>
 <CAA8EJpoMtr6OGjL8qq-cHadQSOVyDAaL8=2TLvOjBbYV2Z7+Mg@mail.gmail.com>
 <d1a9be5d-b0a0-73bc-c66f-6d45049fbaf1@quicinc.com>
 <CAA8EJppFZQTghtyweGG_8zSqqZpEp=ho0bXuRxgyU2qGL4+ppA@mail.gmail.com>
 <4b604c91-7b1f-46b3-6b41-fe7d45190b78@quicinc.com>
 <tymwexyhuujgrz2cvxkruimst3ff4mnevcm2k4h6qdmpmb7yqp@zqbwwc5t66ya>
 <c9cc5a0e-35b5-47a6-b271-46cac9e19872@kernel.org>
 <xc4knruvh2kasc563vbatppof67w5ui7bnoiq73euogvkjw2hh@meq3vz2qeekk>
 <74bc1fc0-2843-4d4a-ae6c-b656745bf02f@kernel.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <74bc1fc0-2843-4d4a-ae6c-b656745bf02f@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ce-2IuWxSFFN6vT0zC8RLZp-Mluy2HJg
X-Proofpoint-GUID: ce-2IuWxSFFN6vT0zC8RLZp-Mluy2HJg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_09,2024-06-04_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 clxscore=1011 phishscore=0
 priorityscore=1501 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2406040143
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



On 6/4/2024 8:36 AM, Krzysztof Kozlowski wrote:
> On 04/06/2024 17:32, Dmitry Baryshkov wrote:
>> On Tue, Jun 04, 2024 at 05:22:03PM +0200, Krzysztof Kozlowski wrote:
>>> On 04/06/2024 17:14, Dmitry Baryshkov wrote:
>>>>>>>>>
>>>>>>>>> I didnt follow why this is a link property. Sorry , I didnt follow the
>>>>>>>>> split part.
>>>>>>>>
>>>>>>>> There is a link between the DSI host and the panel. I don't want to
>>>>>>>> end up in a situation when the properties of the link are split
>>>>>>>> between two different nodes.
>>>>>>>>
>>>>>>>
>>>>>>> It really depends on what the property denotes. I do not think this
>>>>>>> should be the reason to do it this way.
>>>>>>
>>>>>> It denotes how the panel signals DPU that it finished processing the
>>>>>> data (please excuse me for possibly inaccurate description). However
>>>>>> there is no direct link between the panel and the DPU. So we should be
>>>>>> using a link between DSI host and the panel.
>>>>>>
>>>>>
>>>>> Yes, I totally agree that we should be using a link between DSI host and the
>>>>> panel.
>>>>>
>>>>> My question from the beginning has been why the output port?
>>>>>
>>>>> It looks like to me we need to have another input port to the controller
>>>>> then?
>>>>>
>>>>> One from DPU and the other from panel?
>>>>
>>>> Dear DT maintainers, could you please comment on the OF graph entries?
>>>> Are they considered to be unidirectional or bidirectional?
>>>>
>>>> Would you suggest adding another arc to the OF graph in our case or is
>>>> it fine to have a signal generated by the panel in the 'panel_in' port?
>>>
>>> Which pin are we talking about? DSI or panel? Commit msg suggests DSI,
>>> so property is in DSI node part. Seems logical to me.
>>
>> Input pin on the DSI side.
> 
> So adding it to panel schema is not even possible thus I am not sure if
> we discuss this option (maybe not, because it would be odd, considering
> you got Rb tag!).
> 
> Adding some input node to DSI connecting panel output and DSI input...
> for what? I mean, what sort of data would it represent?
> 

TE pin is an input signal from the panel to the DSI host.

Today we have two ports in the DSI host node:

1) input to DSI node from DPU. This represents the pixel stream from DPU 
to DSI

2) DSI output node to represent pixel stream from DSI host to panel in

Now, please explain to me how does TE pin belongs to (2) because thats 
where this property has been added.

> Best regards,
> Krzysztof
> 
