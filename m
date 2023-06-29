Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C3074311E
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 01:29:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE7C110E3FC;
	Thu, 29 Jun 2023 23:29:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDDAC10E3FC;
 Thu, 29 Jun 2023 23:29:48 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35TLbLZ4031590; Thu, 29 Jun 2023 23:29:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=/QTyDMxjeb6S1ofSl7RyYNWEtok2JzJofl5BZM1/v5A=;
 b=cGC4TaRWlL+Bsd8a8WqBCu/H2GEpArmk5JWPbUpc9qt49o0GK0sHWJWIJGd70J8rfeZ1
 35f4OQ0U9MNwg4quPaSjd/wLwrWhHf80X+KcKaza0tOxW3V3q6AcuVl8roTtMDAKZueE
 C/aruURkiW1l0y3vjVsd4RsKqs9YBr5N8/ro9Ng2r4BH/lbY4H1aurglHXXz9KmgigiJ
 J1S7PBuuOM9bKYc2b+C4aXkh3JtNZ84aVMjI2aSJB+HVg8rbCZZZfm84MxTPDNt9cBc7
 udAnH2RxLfQHDZCYgstCZZGsPVIEOsQlSV1PD9VqXCSKYoH/GjdKKXlZPTMs23ECbdgu 9A== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rh7s2skfy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Jun 2023 23:29:42 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35TNTf0j021671
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Jun 2023 23:29:41 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.7; Thu, 29 Jun
 2023 16:29:40 -0700
Message-ID: <413e6880-787c-06a1-8448-2b470e372c7e@quicinc.com>
Date: Thu, 29 Jun 2023 16:29:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 6/6] drm/msm/dpu: Update dev core dump to dump registers
 of sub blocks
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Ryan McCann
 <quic_rmccann@quicinc.com>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230622-devcoredump_patch-v1-0-3b2cdcc6a576@quicinc.com>
 <20230622-devcoredump_patch-v1-6-3b2cdcc6a576@quicinc.com>
 <114f34dd-e5ce-f878-5b23-4c14dc800547@linaro.org>
 <1e41b909-4886-8392-edbc-78684e52bbf9@quicinc.com>
 <412f68a3-e3cc-f26e-2e3d-59727e5c48d8@linaro.org>
 <37c4bde0-0798-7506-ffd3-c8689ab78ba0@quicinc.com>
 <dffa5b4c-3273-3b8a-a170-acb146063f43@linaro.org>
 <9fcf6fb4-20eb-500d-a5fd-a0a328e530ed@quicinc.com>
In-Reply-To: <9fcf6fb4-20eb-500d-a5fd-a0a328e530ed@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: jLVmSvlN-WG506e_MXDjuH6OWVPViI9U
X-Proofpoint-ORIG-GUID: jLVmSvlN-WG506e_MXDjuH6OWVPViI9U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-29_10,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306290213
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_jesszhan@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/24/2023 7:44 PM, Abhinav Kumar wrote:
> 
> 
> On 6/24/2023 8:03 AM, Dmitry Baryshkov wrote:
>> On 24/06/2023 17:17, Abhinav Kumar wrote:
>>>
>>>
>>> On 6/24/2023 5:07 AM, Dmitry Baryshkov wrote:
>>>> On 24/06/2023 03:09, Abhinav Kumar wrote:
>>>>>
>>>>>
>>>>> On 6/22/2023 5:13 PM, Dmitry Baryshkov wrote:
>>>>>> On 23/06/2023 02:48, Ryan McCann wrote:
>>>>>>> Currently, the device core dump mechanism does not dump registers 
>>>>>>> of sub
>>>>>>> blocks within the DSPP, SSPP, DSC, and PINGPONG blocks. Add wrapper
>>>>>>> function to dump hardware blocks that contain sub blocks.
>>>>>>>
>>>>>>> Signed-off-by: Ryan McCann <quic_rmccann@quicinc.com>
>>>>>>> ---
>>>>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 194 
>>>>>>> +++++++++++++++++++++++++++-----
>>>>>>>   1 file changed, 168 insertions(+), 26 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c 
>>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>>>>> index aa8499de1b9f..9b1b1c382269 100644
>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>>>>> @@ -885,6 +885,154 @@ static int dpu_irq_postinstall(struct 
>>>>>>> msm_kms *kms)
>>>>>>>       return 0;
>>>>>>>   }
>>>>>>> +static void dpu_kms_mdp_snapshot_add_block(struct msm_disp_state 
>>>>>>> *disp_state,
>>>>>>> +                       void __iomem *mmio, void *blk,
>>>>>>> +                       enum dpu_hw_blk_type blk_type)
>>>>>>
>>>>>> No. Such multiplexers add no value to the code. Please inline it.
>>>>>>
>>>>>> Not to mention that this patch is hard to review. You both move 
>>>>>> existing code and add new features. If it were to go, it should 
>>>>>> have been split into two patches: one introducing the multiplexer 
>>>>>> and another one adding subblocks.
>>>>>>
>>>>>
>>>>> Ok. we can split this into:
>>>>>
>>>>> 1) adding the multiplexer
>>>>> 2) adding sub-blk parsing support inside the multiplexer
>>>>
>>>> I'd say, drop the multiplexer completely. It adds no value here. It 
>>>> is only used from dpu_kms_mdp_snapshot(). If the code there was 
>>>> complex enough, it would have made sense to _split_ the function. 
>>>> But even in such case there would be no point in having multiplexer. 
>>>> We do not enumerate block by type.
>>>>
>>>
>>> Can you pls elaborate what you mean by enumerate blk by type?
>>>
>>> We do have DPU_HW_BLK_***
>>>
>>> Did you mean sub-blk?
>>>
>>>>>
>>>>>>> +{
>>>>>>> +    u32 base;
>>>>>>> +
>>>>>>> +    switch (blk_type) {
>>>>>>> +    case DPU_HW_BLK_TOP:
>>>>>>> +    {
>>>>>>> +        struct dpu_mdp_cfg *top = (struct dpu_mdp_cfg *)blk;
>>>>>>> +
>>>>>>> +        if (top->features & BIT(DPU_MDP_PERIPH_0_REMOVED)) {
>>>>>>> +            msm_disp_snapshot_add_block(disp_state, 
>>>>>>> MDP_PERIPH_TOP0,
>>>>>>> +                            mmio + top->base, "top");
>>>>>>> +            msm_disp_snapshot_add_block(disp_state, top->len - 
>>>>>>> MDP_PERIPH_TOP0_END,
>>>>>>> +                            mmio + top->base + MDP_PERIPH_TOP0_END,
>>>>>>> +                            "top_2");
>>>>>>> +        } else {
>>>>>>> +            msm_disp_snapshot_add_block(disp_state, top->len, 
>>>>>>> mmio + top->base, "top");
>>>>>>> +        }
>>>>>>> +        break;
>>>>>>> +    }
>>>>>>> +    case DPU_HW_BLK_LM:
>>>>>>> +    {
>>>>>>> +        struct dpu_lm_cfg *mixer = (struct dpu_lm_cfg *)blk;
>>>>>>> +
>>>>>>> +        msm_disp_snapshot_add_block(disp_state, mixer->len, mmio 
>>>>>>> + mixer->base, "%s",
>>>>>>> +                        mixer->name);
>>>>>>> +        break;
>>>>>>> +    }
>>>>>>> +    case DPU_HW_BLK_CTL:
>>>>>>> +    {
>>>>>>> +        struct dpu_ctl_cfg *ctl = (struct dpu_ctl_cfg *)blk;
>>>>>>> +
>>>>>>> +        msm_disp_snapshot_add_block(disp_state, ctl->len, mmio + 
>>>>>>> ctl->base, "%s",
>>>>>>> +                        ctl->name);
>>>>>>> +        break;
>>>>>>> +    }
>>>>>>> +    case DPU_HW_BLK_INTF:
>>>>>>> +    {
>>>>>>> +        struct dpu_intf_cfg *intf = (struct dpu_intf_cfg *)blk;
>>>>>>> +
>>>>>>> +        msm_disp_snapshot_add_block(disp_state, intf->len, mmio 
>>>>>>> + intf->base, "%s",
>>>>>>> +                        intf->name);
>>>>>>> +        break;
>>>>>>> +    }
>>>>>>> +    case DPU_HW_BLK_WB:
>>>>>>> +    {
>>>>>>> +        struct dpu_wb_cfg *wb = (struct dpu_wb_cfg *)blk;
>>>>>>> +
>>>>>>> +        msm_disp_snapshot_add_block(disp_state, wb->len, mmio + 
>>>>>>> wb->base, "%s",
>>>>>>> +                        wb->name);
>>>>>>> +        break;
>>>>>>> +    }
>>>>>>> +    case DPU_HW_BLK_SSPP:
>>>>>>> +    {
>>>>>>> +        struct dpu_sspp_cfg *sspp_block = (struct dpu_sspp_cfg 
>>>>>>> *)blk;
>>>>>>> +        const struct dpu_sspp_sub_blks *sblk = sspp_block->sblk;
>>>>>>> +
>>>>>>> +        base = sspp_block->base;
>>>>>>> +
>>>>>>> +        msm_disp_snapshot_add_block(disp_state, sspp_block->len, 
>>>>>>> mmio + base, "%s",
>>>>>>> +                        sspp_block->name);
>>>>>>> +
>>>>>>> +        if (sspp_block->features & BIT(DPU_SSPP_SCALER_QSEED3) ||
>>>>>>> +            sspp_block->features & 
>>>>>>> BIT(DPU_SSPP_SCALER_QSEED3LITE) ||
>>>>>>> +            sspp_block->features & BIT(DPU_SSPP_SCALER_QSEED4))
>>>>>>> +            msm_disp_snapshot_add_block(disp_state, 
>>>>>>> sblk->scaler_blk.len,
>>>>>>> +                            mmio + base + sblk->scaler_blk.base, 
>>>>>>> "%s_%s",
>>>>>>> +                            sspp_block->name, 
>>>>>>> sblk->scaler_blk.name);
>>>>>>
>>>>>> Actually, it would be better to:
>>>>>> - drop name from all sblk instances (and use known string instead 
>>>>>> of the sblk name here)
>>>>>> - Use sblk->foo_blk.len to check if it should be printed or not.
>>>>>>
>>>>>
>>>>> No, I dont agree. If we drop the names from the sub_blk in the 
>>>>> catalog, we will end up using "sub_blk_name" string here in the 
>>>>> code to indicate which blk that is in the dump.
>>>>>
>>>>> If we add more sub_blks in the catalog in the future we need to 
>>>>> keep changing the code over here. Thats not how it should be.
>>>>>
>>>>> Leaving the names in the catalog ensures that this code wont change 
>>>>> and only catalog changes when we add a new sub_blk either for an 
>>>>> existing or new chipset.
>>>>>
>>>>> catalog is indicating the new blk, and dumping code just prints it.
>>>>>
>>>>> with your approach, dumping code will or can keep changing with 
>>>>> chipsets or sub_blks. Thats not how it should be.
>>>>
>>>> Well, we do not enumerate sub-blocks in any way, they are not 
>>>> indexed. So even with sblk->blk.name in place, adding new sub-block 
>>>> would require adding new code here. That's why I wrote that the 
>>>> calling code knows which sub-block it refers to.
>>>>
>>>
>>> Today, unfortunately each sub_blk type is different so we have to do 
>>> this case by case.
>>>
>>> Ideally, this should have just been
>>>
>>> -> print main blk
>>> -> print all sub-blks of the main blk
>>>
>>> Without having to handle each main blk's sub-blks separately.
>>>
>>> That way the dumping code would have remained generic without having 
>>> to do even the multiplexer in the first place.
>>>
>>> Need to explore if somehow we can come up with a generic sub-blk 
>>> struct and make this possible. Then this code will become much easier 
>>> and what I am saying will make total sense.
>>
>> In such case, yes. However I'd warn about having a generic array of 
>> subblocks. Having named subblock entries might complicate 
>> snapshotting, but it makes the rest of the DPU driver smaller.
>>
> 
> Need to explore this. But not immediately.
> 
>>>
>>> Even without that, conceptually these sub-blk names are reflecting 
>>> whats in our software document. So its not a random name but reflects 
>>> the actual sub-blk name from the hardware.
>>
>> Yes
>>
>>> So this belongs in the catalog.
>>
>> But the sub-block field already has a correct name: scaler_blk, 
>> csc_blk, etc. Having both sub-block field name and the .name inside 
>> results in kind of duplication, which seems unnecessary to me.
>>
> 
> No, there is a difference and not duplicated. One is the name of the 
> struct so it can really be anything and doesnt need to match the hw doc 
> name. But the other is the string name which we can give exactly to 
> match software interface doc and makes parsing such a dump much much 
> easier.
> 
> One point I dont see you have considered is the block index of the sub_blk.
> 
> Today, yes I see only a "pcc" or a "dither" etc
> 
> What if there are two PCCs or two dithers.
> 
> Then their names can just be "pcc_0" and "pcc_1" or "dither_0" and 
> "dither_1".
> 
> Having name gives us the ability to easily incorporate even unsequential 
> indices.
> 
> For example, every sspp's name today is not sequential. it can be 
> "sspp_3" then "sspp_8" etc
> 
> By having names reflect the correct indices, dumping code becomes less 
> complex as the catalog will still have the right names as dumping code 
> will just use that.
> 

The QC team is in agreement that we would like to go ahead with the 
names from the catalog and not drop them.

Hence we will post the next revision with the name still from the 
catalog and drop the multiplexer completely.

Since the intern has a short period of time to finish development on 
this task, we would like to go ahead with this approach and post the 
next rev.
