Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91254811F5C
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 20:51:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F38DB10E7C4;
	Wed, 13 Dec 2023 19:51:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C4D710E2A3;
 Wed, 13 Dec 2023 19:51:32 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BD9Lnup013669; Wed, 13 Dec 2023 19:51:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=M4JcSL3sMHXUln2gLHpJ17WoyQYr/B8H7hcqzLgeJp4=; b=kM
 4I4WwHtIDnNkE2KKgOhZ5XyhepctJxuYl2pS3CHBgaDBZ/MMtItLKABB43gcdhFC
 z78j2l/FqycplsCUUe1rZF+y0BiPLJxomkj3reC3xsiLf8u56TdXmNjj3RDmf2iu
 O6GNbF0ApidtbkOxOeUEE5+jyRElVATLHd53s7fI0hwgmY5fFoATWMjsIZ2+l+iP
 koV95TDZr1ym7QEVldJMopYJcTBahURhudDiTD7RiIXb/7eKBY1SkPpwPt7hFQyH
 nO//Q+RdgN2o6chwhbz7zgVkeEpqlkPQT4ufm8jAeNrVtsx8cQV+nmEhj1+PoU3l
 tHtdspm+zfvonYSlKkpA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uy5tu23tt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Dec 2023 19:51:28 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BDJpRWo022953
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Dec 2023 19:51:27 GMT
Received: from [10.110.0.246] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 13 Dec
 2023 11:51:26 -0800
Message-ID: <4a1caaae-f0c1-47d2-a74f-8c17fc5da2bd@quicinc.com>
Date: Wed, 13 Dec 2023 11:51:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/msm/dpu: Set input_sel bit for INTF
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>
References: <20231130-encoder-fixup-v1-0-585c54cd046e@quicinc.com>
 <20231130-encoder-fixup-v1-2-585c54cd046e@quicinc.com>
 <CAA8EJpqeu18q4jN82fUvsEdBRmEjG_mYLQQUWD+LDxjiQQQPsg@mail.gmail.com>
 <a076fced-f4b9-804e-eb73-1fbb510c4951@quicinc.com>
 <77c229fd-5414-49ad-bccd-7a5732345695@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <77c229fd-5414-49ad-bccd-7a5732345695@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 6fPQbmM28-0-uHXhtlllX2_k_eK9msb7
X-Proofpoint-GUID: 6fPQbmM28-0-uHXhtlllX2_k_eK9msb7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312130141
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
Cc: freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, Marijn
 Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/2/2023 11:54 AM, Dmitry Baryshkov wrote:
> On 01/12/2023 23:29, Abhinav Kumar wrote:
>>
>>
>> On 11/30/2023 11:36 PM, Dmitry Baryshkov wrote:
>>> On Fri, 1 Dec 2023 at 03:31, Jessica Zhang 
>>> <quic_jesszhan@quicinc.com> wrote:
>>>>
>>>> Set the input_sel bit for encoders as it was missed in the initial
>>>> implementation.
>>>>
>>>> Reported-by: Rob Clark <robdclark@gmail.com>
>>>> Fixes: 91143873a05d ("drm/msm/dpu: Add MISR register support for 
>>>> interface")
>>>> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/39
>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>> ---
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 2 +-
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   | 2 +-
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c | 7 ++++++-
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h | 4 +++-
>>>>   4 files changed, 11 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>>>> index 3442cf65b86f..d0884997ecb7 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>>>> @@ -320,7 +320,7 @@ static u32 dpu_hw_intf_get_line_count(struct 
>>>> dpu_hw_intf *intf)
>>>>
>>>>   static void dpu_hw_intf_setup_misr(struct dpu_hw_intf *intf)
>>>>   {
>>>> -       dpu_hw_setup_misr(&intf->hw, INTF_MISR_CTRL);
>>>> +       dpu_hw_setup_misr(&intf->hw, INTF_MISR_CTRL, true);
>>>>   }
>>>>
>>>>   static int dpu_hw_intf_collect_misr(struct dpu_hw_intf *intf, u32 
>>>> *misr_value)
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
>>>> index f38473e68f79..77b14107c84a 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
>>>> @@ -83,7 +83,7 @@ static void dpu_hw_lm_setup_border_color(struct 
>>>> dpu_hw_mixer *ctx,
>>>>
>>>>   static void dpu_hw_lm_setup_misr(struct dpu_hw_mixer *ctx)
>>>>   {
>>>> -       dpu_hw_setup_misr(&ctx->hw, LM_MISR_CTRL);
>>>> +       dpu_hw_setup_misr(&ctx->hw, LM_MISR_CTRL, false);
>>>>   }
>>>>
>>>>   static int dpu_hw_lm_collect_misr(struct dpu_hw_mixer *ctx, u32 
>>>> *misr_value)
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
>>>> index a8a0a4e76b94..f441df47fdde 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
>>>> @@ -481,7 +481,8 @@ void _dpu_hw_setup_qos_lut(struct 
>>>> dpu_hw_blk_reg_map *c, u32 offset,
>>>>                        cfg->danger_safe_en ? 
>>>> QOS_QOS_CTRL_DANGER_SAFE_EN : 0);
>>>>   }
>>>>
>>>> -void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c, u32 
>>>> misr_ctrl_offset)
>>>> +void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c, u32 
>>>> misr_ctrl_offset,
>>>> +               bool set_input_sel)
>>>>   {
>>>>          u32 config = 0;
>>>>
>>>> @@ -491,6 +492,10 @@ void dpu_hw_setup_misr(struct 
>>>> dpu_hw_blk_reg_map *c, u32 misr_ctrl_offset)
>>>>          wmb();
>>>>
>>>>          config = MISR_FRAME_COUNT | MISR_CTRL_ENABLE | 
>>>> MISR_CTRL_FREE_RUN_MASK;
>>>> +
>>>> +       if (set_input_sel)
>>>> +               config |= MISR_CTRL_INPUT_SEL;
>>>> +
>>>>          DPU_REG_WRITE(c, misr_ctrl_offset, config);
>>>>   }
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
>>>> index bb496ebe283b..793670d62414 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
>>>> @@ -17,6 +17,7 @@
>>>>   #define MISR_CTRL_ENABLE                BIT(8)
>>>>   #define MISR_CTRL_STATUS                BIT(9)
>>>>   #define MISR_CTRL_STATUS_CLEAR          BIT(10)
>>>> +#define MISR_CTRL_INPUT_SEL             BIT(24)
>>>
>>> The public apq8916 TRM documents this as a 4-bit field. I think this
>>> was followed into the later generations. Can we please document it
>>> correctly and use an uint instead of just bool for set_input_sel?
>>>
>>
>> Can you pls point us to this document you are referring?
> 
> I have this link in my bookmarks, which doesn't seem to work no longer:
> 
> https://developer.qualcomm.com/download/sd410/snapdragon-410e-technical-reference-manual.pdf?referrer=node/29241
> 
> 96boards forum has several links and mentions of this doc.
> 
>>
>> I was not aware that bit level details are revealed in external 
>> documents :)
>>
>> Even though its a 4-bit field, it only takes a 0 or 1 as others are 
>> undefined.
>>
>> Exposing all the bits will only cause more confusion like it did for 
>> others thinking that input select is actually configurable when its not.
>>
>> I think what we should do is just pass "misr_type" to this API to tell 
>> whether its lm misr or intf misr and set BIT(24) based on that.
> 
> This would be another simplification. Can we instead just use values 0 
> and 1 instead and maybe document that by default everybody should use 0.

Hi Dmitry,

Acked. Will change the input_sel parameter to a u8 and add a note that 
it should be 0x0 by default with an exception for encoders.

Thanks,

Jessica Zhang

> 
>>
>>
>>>>   #define MISR_CTRL_FREE_RUN_MASK         BIT(31)
>>>>
>>>>   /*
>>>> @@ -357,7 +358,8 @@ void _dpu_hw_setup_qos_lut(struct 
>>>> dpu_hw_blk_reg_map *c, u32 offset,
>>>>                             bool qos_8lvl,
>>>>                             const struct dpu_hw_qos_cfg *cfg);
>>>>
>>>> -void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c, u32 
>>>> misr_ctrl_offset);
>>>> +void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c, u32 
>>>> misr_ctrl_offset,
>>>> +                      bool set_input_sel);
>>>>
>>>>   int dpu_hw_collect_misr(struct dpu_hw_blk_reg_map *c,
>>>>                  u32 misr_ctrl_offset,
>>>>
>>>> -- 
>>>> 2.43.0
>>>>
>>>
>>>
> 
> -- 
> With best wishes
> Dmitry
> 
