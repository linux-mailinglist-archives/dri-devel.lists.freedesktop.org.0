Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B059742B2A
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 19:26:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AE3710E3E6;
	Thu, 29 Jun 2023 17:26:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D116110E3E6;
 Thu, 29 Jun 2023 17:26:38 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35TGR3ju032236; Thu, 29 Jun 2023 17:26:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Qpi4CKj7LD2MZyQq5FEOioWfm1c6qFWR8XXj6QCLa/Y=;
 b=QphGtSSRGBluwKqlV1r6EJ6u3pvFr2p2nDrp5zEV/W2HhEzDHGM5jVaigF5gba6Pf+2k
 +UPavONsS/DVRdUsAdjCz6HxWwgBX/Gd4QRKu2vAM+NWeq95WbeeJ0z2cI77S2EPgpef
 mTS5064xubDSP1ASzYJSFDpIqtln9CFWy1RNff32qOos9b+7dqw6CC5h5933rpPqv7Mi
 KnPx/EeDc6a4f8IlOF5Aejmf7Vy0Go6WhtbwMr2v1WsjVS4nf+mro6dwuont7eA0xdpu
 Ro7SVkE2lpW1DtZ25fQ1B4qo6L7fMHqWloA/hnvgiwUH8i3F/2HHwpTLbzDnAakI7E6B wQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rha8e0mu3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Jun 2023 17:26:33 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35THQWnF006296
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Jun 2023 17:26:32 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.7; Thu, 29 Jun
 2023 10:26:31 -0700
Message-ID: <53df7008-0a72-dfa7-27d9-96c07e410ac3@quicinc.com>
Date: Thu, 29 Jun 2023 10:26:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [PATCH 2/3] drm/msm/dpu: Set DATABUS_WIDEN on command
 mode encoders
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, Jessica Zhang <quic_jesszhan@quicinc.com>
References: <20230525-add-widebus-support-v1-0-c7069f2efca1@quicinc.com>
 <20230525-add-widebus-support-v1-2-c7069f2efca1@quicinc.com>
 <c74c9e0e-d059-f0e3-4350-03089c37131a@linaro.org>
 <cce68370-3fd9-4c9a-258e-af0d5d057fda@quicinc.com>
 <n2c5qlujxhbbj2aqlgj7fetzoteood5h4hmbwt4mapi77xlvmt@bpourzaideti>
 <81a5e241-ec82-7414-8752-4ce3cb084959@linaro.org>
 <f14f2c31-38c2-0600-3a29-17e83afececf@quicinc.com>
 <26tvhvqpxtxz5tqc6jbjixadpae34k7uc7fyec2u5o2ccj4tdq@tjvguzlolc3g>
 <8dcd643f-9644-a4e7-a0d5-eefa28084a88@linaro.org>
 <7d5256cd-c0bd-36e3-9b59-63ad8595f0ce@quicinc.com>
 <b119470d-f656-71d1-8b87-b4b8196f5220@linaro.org>
 <a4688db2-4230-7485-a688-bc6253d2d4b8@quicinc.com>
 <dab90e58-c25a-9b5a-bae0-dfc50de7d363@linaro.org>
 <0f988169-58cb-eccf-9590-f5097e085f22@quicinc.com>
In-Reply-To: <0f988169-58cb-eccf-9590-f5097e085f22@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: vVpJRfMaAir9KAZTGv0ruT2A6U9NwV9c
X-Proofpoint-ORIG-GUID: vVpJRfMaAir9KAZTGv0ruT2A6U9NwV9c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-29_05,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 mlxlogscore=999 clxscore=1015 impostorscore=0 priorityscore=1501
 spamscore=0 mlxscore=0 malwarescore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306290158
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/22/2023 4:37 PM, Abhinav Kumar wrote:
> 
> 
> On 6/22/2023 4:14 PM, Dmitry Baryshkov wrote:
>> On 23/06/2023 01:37, Abhinav Kumar wrote:
>>>
>>>
>>> On 6/21/2023 4:46 PM, Dmitry Baryshkov wrote:
>>>> On 22/06/2023 02:01, Abhinav Kumar wrote:
>>>>>
>>>>>
>>>>> On 6/21/2023 9:36 AM, Dmitry Baryshkov wrote:
>>>>>> On 21/06/2023 18:17, Marijn Suijten wrote:
>>>>>>> On 2023-06-20 14:38:34, Jessica Zhang wrote:
>>>>>>> <snip>
>>>>>>>>>>>>> +    if (phys_enc->hw_intf->ops.enable_widebus)
>>>>>>>>>>>>> + phys_enc->hw_intf->ops.enable_widebus(phys_enc->hw_intf);
>>>>>>>>>>>>
>>>>>>>>>>>> No. Please provide a single function which takes necessary
>>>>>>>>>>>> configuration, including compression and wide_bus_enable.
>>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> There are two ways to look at this. Your point is coming from 
>>>>>>>>>>> the
>>>>>>>>>>> perspective that its programming the same register but just a 
>>>>>>>>>>> different
>>>>>>>>>>> bit. But that will also make it a bit confusing.
>>>>>>>>>
>>>>>>>>> My point is to have a high-level function that configures the 
>>>>>>>>> INTF for
>>>>>>>>> the CMD mode. This way it can take a structure with necessary
>>>>>>>>> configuration bits.
>>>>>>>>
>>>>>>>> Hi Dmitry,
>>>>>>>>
>>>>>>>> After discussing this approach with Abhinav, we still have a few
>>>>>>>> questions about it:
>>>>>>>>
>>>>>>>> Currently, only 3 of the 32 bits for INTF_CONFIG2 are being used 
>>>>>>>> (the
>>>>>>>> rest are reserved with no plans of being programmed in the 
>>>>>>>> future). Does
>>>>>>>> this still justify the use of a struct to pass in the necessary
>>>>>>>> configuration?
>>>>>>>
>>>>>>> No.  The point Dmitry is making is **not** about this concidentally
>>>>>>> using the same register, but about adding a common codepath to 
>>>>>>> enable
>>>>>>> compression on this hw_intf (regardless of the registers it needs to
>>>>>>> touch).
>>>>>>
>>>>>> Actually to setup INTF for CMD stream (which is equal to setting 
>>>>>> up compression at this point).
>>>>>>
>>>>>
>>>>> Yes it should be setup intf for cmd and not enable compression.
>>>>>
>>>>> Widebus and compression are different features and we should be 
>>>>> able to control them independently.
>>>>>
>>>>> We just enable them together for DSI. So a separation is necessary.
>>>>>
>>>>> But I am still not totally convinced we even need to go down the 
>>>>> path for having an op called setup_intf_cmd() which takes in a 
>>>>> struct like
>>>>>
>>>>> struct dpu_cmd_intf_cfg {
>>>>>      bool data_compress;
>>>>>      bool widebus_en;
>>>>> };
>>>>>
>>>>> As we have agreed that we will not touch the video mode timing 
>>>>> engine path, it leaves us with only two bits.
>>>>>
>>>>> And like I said, its not that these two bits always go together. We 
>>>>> want to be able to control them independently which means that its 
>>>>> not necessary both bits program the same register one by one. We 
>>>>> might just end up programming one of them if we just use widebus.
>>>>>
>>>>> Thats why I am still leaning on keeping this approach.
>>>>
>>>> I do not like the idea of having small functions being called 
>>>> between modules. So, yes there will a config of two booleans, but it 
>>>> is preferable (and more scalable) compared to separate callbacks.
>>>>
>>>
>>> I definitely agree with the scalable part and I even cross checked 
>>> that the number of usable bitfields of this register is going up from 
>>> one chipset to the other although once again that depends on whether 
>>> we will use those features.
>>>
>>> For that reason I am not opposed to the struct idea.
>>>
>>> But there is also another pattern i am seeing which worries me. 
>>> Usable bitfields sometimes even reduce. For those cases, if we go 
>>> with a pre-defined struct it ends up with redundant members as those 
>>> bitfields go away.
>>>
>>> With the function op based approach, we just call the op if the 
>>> feature bit / core revision.
>>>
>>> So I wanted to check once more about the fact that we should consider 
>>> not just expansion but also reduction.
>>
>> As we have to support all generations, there is no actual reduction. 
>> Newer SoCs do not have particular feature/bit, but older ones do. By 
>> having multiple optional ops we just move this knowledge from 
>> ops->complex_callback() to _setup_block_ops(). But more importantly 
>> the caller gets more complicated. Instead of just calling 
>> ops->set_me_up(), it has to check all the optional callbacks and call 
>> the one by one.
>>
> 
> Alright, I am thinking that perhaps because this register is kind of 
> unique that its actually controlling a specific setting in the datapath, 
> downstream also has separate ops for this.
> 
> But thats fine, we can go ahead with the struct based approach.
> 

As data_compress has already landed, let me introduced the struct along 
with the core_revision based approach in the core_revision series and 
this series will expand that struct to include widebus too.
