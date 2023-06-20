Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB3E7376BB
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 23:38:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7415E10E19A;
	Tue, 20 Jun 2023 21:38:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5389610E38A;
 Tue, 20 Jun 2023 21:38:00 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35KKdmPP015208; Tue, 20 Jun 2023 21:37:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ZxfjTOL/Bn9YrhXSc61e0Mkq9PrRfxa4UHo9HvQZ1jk=;
 b=lf9QsiQE/V/c8qlkgaMcXeep5B8bHx0EU8ma0f0NvOoPZIklVrZSCshl+jDCKACa/RH8
 S1F5a86pKrje/CsZ7urswrgWyqBeDzY/st+76JuPdBwGOjDRozyb35Wy8li1ljTXVjtM
 pq+VB3DVmpf8Hb1eASGF5iCJFLs98XBmYKYZG958ldr105Z8MHrIQOWD9nwdNZkqFydQ
 jyZIhKp3zP0UdTLwg92v6mieYq1EE8KfvD1fhdCbvQdbO6BFz0dEo/4e1JoY/MBih46c
 WewjHOuYWD5M7bUldAnRcIJDCDNmEm/gLgplIGmINbKZhwOTGuyTc5kTq6isAuA2w9vp 5g== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rax7n2q2r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jun 2023 21:37:58 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35KLbuRI031506
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jun 2023 21:37:57 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 20 Jun
 2023 14:37:56 -0700
Message-ID: <6ebab21c-5b1a-f9d7-e0c6-6a091e27761a@quicinc.com>
Date: Tue, 20 Jun 2023 14:37:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [Freedreno] [PATCH 1/3] drm/msm/dpu: Add DPU_INTF_DATABUS_WIDEN
 feature flag for DPU >= 5.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Marijn Suijten <marijn.suijten@somainline.org>
References: <20230525-add-widebus-support-v1-0-c7069f2efca1@quicinc.com>
 <20230525-add-widebus-support-v1-1-c7069f2efca1@quicinc.com>
 <wpjxrnhbcanbc5iatxnff25yrrdfrtmgb24sgwyo457dz2oyjz@e2docpcb6337>
 <f4fb042c-1458-6077-3c49-8cc02638b27c@linaro.org>
 <ycgei43x4kfmjk7g7gbeglehtiiinfbqmrjbdzcy56frxbtd2z@yk2f5kgrkbrt>
 <e23de804-060d-3278-5045-1ed03f0de80d@quicinc.com>
 <c5cfc132-effb-8269-ac5d-ed8c988d1a16@quicinc.com>
 <08b6aaf4-6edd-4f41-5d98-11ffc27e766e@quicinc.com>
 <6d11e420-1b95-0029-ec7a-17fbc8acb5ca@linaro.org>
 <827875ad-a446-10e7-6608-f9b0fa830a00@quicinc.com>
 <2b01b53a-9d8a-3b7d-d1bd-7d25eb77a9c0@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <2b01b53a-9d8a-3b7d-d1bd-7d25eb77a9c0@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Vz4YXzcAcdO-tlb8_r7dgm6VRuJd6TH-
X-Proofpoint-ORIG-GUID: Vz4YXzcAcdO-tlb8_r7dgm6VRuJd6TH-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-20_16,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306200195
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/16/2023 5:37 PM, Dmitry Baryshkov wrote:
> On 17/06/2023 00:10, Abhinav Kumar wrote:
>>
>>
>> On 6/14/2023 1:43 PM, Dmitry Baryshkov wrote:
>>> On 14/06/2023 23:39, Abhinav Kumar wrote:
>>>>
>>>>
>>>> On 6/14/2023 12:54 PM, Abhinav Kumar wrote:
>>>>>
>>>>>
>>>>> On 6/14/2023 12:35 PM, Abhinav Kumar wrote:
>>>>>>
>>>>>>
>>>>>> On 6/14/2023 5:23 AM, Marijn Suijten wrote:
>>>>>>> On 2023-06-14 15:01:59, Dmitry Baryshkov wrote:
>>>>>>>> On 14/06/2023 14:42, Marijn Suijten wrote:
>>>>>>>>> On 2023-06-13 18:57:11, Jessica Zhang wrote:
>>>>>>>>>> DPU 5.x+ supports a databus widen mode that allows more data 
>>>>>>>>>> to be sent
>>>>>>>>>> per pclk. Enable this feature flag on all relevant chipsets.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>>>>>>>> ---
>>>>>>>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 ++-
>>>>>>>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 ++
>>>>>>>>>>    2 files changed, 4 insertions(+), 1 deletion(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>>>>>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>>>>>> index 36ba3f58dcdf..0be7bf0bfc41 100644
>>>>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>>>>>> @@ -103,7 +103,8 @@
>>>>>>>>>>        (BIT(DPU_INTF_INPUT_CTRL) | \
>>>>>>>>>>         BIT(DPU_INTF_TE) | \
>>>>>>>>>>         BIT(DPU_INTF_STATUS_SUPPORTED) | \
>>>>>>>>>> -     BIT(DPU_DATA_HCTL_EN))
>>>>>>>>>> +     BIT(DPU_DATA_HCTL_EN) | \
>>>>>>>>>> +     BIT(DPU_INTF_DATABUS_WIDEN))
>>>>>>>>>
>>>>>>>>> This doesn't work.  DPU 5.0.0 is SM8150, which has DSI 6G 2.3. 
>>>>>>>>> In the
>>>>>>>>> last patch for DSI you state and enable widebus for DSI 6G 2.5+ 
>>>>>>>>> only,
>>>>>>>>> meaning DPU and DSI are now desynced, and the output is completely
>>>>>>>>> corrupted.
>>>>>>>
>>>>
>>>> I looked at the internal docs and also this change. This change is 
>>>> incorrect because this will try to enable widebus for DPU >= 5.0 and 
>>>> DSI  >= 2.5
>>>>
>>>> That was not the intended right condition as thats not what the docs 
>>>> say.
>>>>
>>>> We should enable for DPU >= 7.0 and DSI >= 2.5
>>>>
>>>> Is there any combination where this compatibility is broken? That 
>>>> would be the strange thing for me ( not DPU 5.0 and DSI 2.5 as that 
>>>> was incorrect)
>>>>
>>>> Part of this confusion is because of catalog macro re-use again.
>>>>
>>>> This series is a good candidate and infact I think we should only do 
>>>> core_revision based check on DPU and DSI to avoid bringing the 
>>>> catalog mess into this.
>>>
>>> I have just a single request here: can we please have the same 
>>> approach for both DSI and DP? I don't mind changing DP code if it 
>>> makes it better. If you don't have better reasons, I like the idea of 
>>> DSI/DP dictating whether wide bus should be used on the particular 
>>> interface. It allows us to handle possible errata or corner cases 
>>> there. Another option would be to make DPU tell DSI / DP whether the 
>>> wide bus is enabled or not, but I'd say, this is slightly worse 
>>> solution.
>>>
>>
>> Today, DP's widebus does not check if DPU supports that or not.
>>
>> DPU encoder queries the DP whether widebus is available and enables it.
>>
>> We can also do the same thing for DSI.
>>
>> So for intf_type of DSI, DPU encoder will query DSI if it supports 
>> widebus.
> 
> Not if it supports wide bus. But the check is whether enabling wide bus 
> is requested by the output driver (DSI/DP).

Hi Dmitry,

Can you explain what you mean by "requested by output driver"? FWIW, if 
the DSI version supports wide bus && if DSC is enabled, then wide bus 
will be enabled in DSI.

Thanks,

Jessica Zhang

> 
>>
>> Then DSI will do its version checks and for DSC it will say yes.
>>
>> This way, we will never check for the DPU's core revision for DSI and 
>> purely rely of DP/DSI's hw revisions.
>>
>> Thats fine with me because that way we again just rely on the hw 
>> revision to enable the feature.
>>
>> But as a result I am still going to drop this patch which adds widebus 
>> to the catalog as a dpu cap which I always wanted to do anyway as we 
>> will just rely on the DSI and DP hw revisions.
> 
> Yep.
> 
>>
>>>>
>>>>>>> Tested this on SM8350 which actually has DSI 2.5, and it is also
>>>>>>> corrupted with this series so something else on this series might be
>>>>>>> broken.
>>>>>>>
>>>>>
>>>>> Missed this response. That seems strange.
>>>>>
>>>>> This series was tested on SM8350 HDK with a command mode panel.
>>>>>
>>>>> We will fix the DPU-DSI handshake and post a v2 but your issue 
>>>>> needs investigation in parallel.
>>>>>
>>>>> So another bug to track that would be great.
>>>>>
>>>>>>>>> Is the bound in dsi_host wrong, or do DPU and DSI need to 
>>>>>>>>> communicate
>>>>>>>>> when widebus will be enabled, based on DPU && DSI supporting it?
>>>>>>>>
>>>>>>>> I'd prefer to follow the second approach, as we did for DP. DPU 
>>>>>>>> asks the
>>>>>>>> actual video output driver if widebus is to be enabled.
>>>>>>>
>>>>>>
>>>>>> I was afraid of this. This series was made on an assumption that 
>>>>>> the DPU version of widebus and DSI version of widebus would be 
>>>>>> compatible but looks like already SM8150 is an outlier.
>>>>>>
>>>>>> Yes, I think we have to go with second approach.
>>>>>>
>>>>>> DPU queries DSI if it supports widebus and enables it.
>>>>>>
>>>>>> Thanks for your responses. We will post a v2.
>>>>>>
>>>>>>> Doesn't it seem very strange that DPU 5.x+ comes with a widebus 
>>>>>>> feature,
>>>>>>> but the DSI does not until two revisions later?  Or is this 
>>>>>>> available on
>>>>>>> every interface, but only for a different (probably DP) encoder 
>>>>>>> block?
>>>>>>>
>>>>>>
>>>>>> Yes its strange.
>>>>>>
>>>>
>>>> I have clarified this above. Its not strange but appeared strange 
>>>> because we were checking wrong conditions.
>>>>
>>>>
>>>>>>> - Marijn
>>>
> 
> -- 
> With best wishes
> Dmitry
> 
