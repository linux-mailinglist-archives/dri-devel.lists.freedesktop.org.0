Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C20FD7DE770
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 22:33:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD46510E7B5;
	Wed,  1 Nov 2023 21:32:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFBD210E7B5;
 Wed,  1 Nov 2023 21:32:55 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3A1KwwBa011494; Wed, 1 Nov 2023 21:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=lvSlxL9K7g3+sJ5q3nV6NpS3XYTP9bt7fZuWG9wQ+9c=;
 b=orZXuOqjuThGFan+qurYjWGDHqmAROltVhrP62fFUV7wyCPiBTp1eiTxQtcRvvPlfHa8
 +08S1u56JDx6HpTW2v75KToFCFAeI518aCmeRq+v/zLyAO6+is/J0nXf+vUCLU6jmRLo
 3q3kzNP7y7bP7vU/843fmqgrI0zbKQMriJIlIqIXkihTI6eun26lS0gCCtoxUePc/7Q0
 qa2/zP6I1TEKHYfTCczPgez4EFjjdo4ZDGC8xUfMXb1nDhVFawbCeeEcXCN1vrg5MVRu
 CrZH0NXgLIIvutY19m7g1SyGgHdLFbIfqIa9F9b9fic5RkJuVp6yK6m9fReOQtr/kNL3 wQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u34sc4geu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Nov 2023 21:32:47 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A1LWkeY004288
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 1 Nov 2023 21:32:46 GMT
Received: from [10.71.109.77] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Wed, 1 Nov
 2023 14:32:45 -0700
Message-ID: <e9b54301-584d-3d5c-1484-f97b32f06de6@quicinc.com>
Date: Wed, 1 Nov 2023 14:32:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6 09/10] drm/msm/dpu: merge DPU_SSPP_SCALER_QSEED3,
 QSEED3LITE, QSEED4
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20231006131450.2436688-1-dmitry.baryshkov@linaro.org>
 <20231006131450.2436688-10-dmitry.baryshkov@linaro.org>
 <c2f7733b-bfa3-a8a6-6909-5da26cd513af@quicinc.com>
 <CAA8EJpr35LgyfNOcwiE0FgGR-CfS6b996HZk0tnQrVpOX99aRg@mail.gmail.com>
 <6d25aaec-58ef-6f66-d2f8-d351ab703d05@quicinc.com>
 <CAA8EJprX=8w7WDb8YF3Tf5bmkeym024oESSeoBtq5OU25CtcgQ@mail.gmail.com>
 <167ab91e-7194-0cb9-e2d8-2bbb83098e75@quicinc.com>
 <CAA8EJpoZMYQKsPiiwNv7v-72L9nOcN2Jc4dkdmTQyzB9trYgag@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpoZMYQKsPiiwNv7v-72L9nOcN2Jc4dkdmTQyzB9trYgag@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: JAb35PcTyFCnJq0nDu1PQgBph4lF_GGZ
X-Proofpoint-GUID: JAb35PcTyFCnJq0nDu1PQgBph4lF_GGZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-01_19,2023-11-01_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 phishscore=0 priorityscore=1501
 mlxscore=0 spamscore=0 clxscore=1015 adultscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2311010159
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
Cc: freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/1/2023 2:23 PM, Dmitry Baryshkov wrote:
> On Wed, 1 Nov 2023 at 21:56, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 11/1/2023 12:39 PM, Dmitry Baryshkov wrote:
>>> On Wed, 1 Nov 2023 at 20:43, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 10/31/2023 1:19 AM, Dmitry Baryshkov wrote:
>>>>> On Mon, 30 Oct 2023 at 22:24, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 10/6/2023 6:14 AM, Dmitry Baryshkov wrote:
>>>>>>> Three different features, DPU_SSPP_SCALER_QSEED3, QSEED3LITE and QSEED4
>>>>>>> are all related to different versions of the same HW scaling block.
>>>>>>> Corresponding driver parts use scaler_blk.version to identify the
>>>>>>> correct way to program the hardware. In order to simplify the driver
>>>>>>> codepath, merge these three feature bits.
>>>>>>>
>>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>> ---
>>>>>>>      drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
>>>>>>>      drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 6 +-----
>>>>>>>      drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    | 9 ++-------
>>>>>>>      drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 3 +--
>>>>>>>      4 files changed, 6 insertions(+), 16 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>>> index 32c396abf877..eb867c8123d7 100644
>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>>> @@ -31,10 +31,10 @@
>>>>>>>          (VIG_SDM845_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
>>>>>>>
>>>>>>>      #define VIG_SC7180_MASK \
>>>>>>> -     (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED4))
>>>>>>> +     (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3))
>>>>>>>
>>>>>>>      #define VIG_SM6125_MASK \
>>>>>>> -     (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE))
>>>>>>> +     (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3))
>>>>>>>
>>>>>>
>>>>>> This merging is coming at a cost of inaccuracy. We are marking sc7180
>>>>>> and sm6125 as scaler_qseed3. But they are not. Let me know what you
>>>>>> think of below idea instead.
>>>>>>
>>>>>>>      #define VIG_SC7180_MASK_SDMA \
>>>>>>>          (VIG_SC7180_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>>>>>> index fc5027b0123a..ba262b3f0bdc 100644
>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>>>>>> @@ -51,9 +51,7 @@ enum {
>>>>>>>      /**
>>>>>>>       * SSPP sub-blocks/features
>>>>>>>       * @DPU_SSPP_SCALER_QSEED2,  QSEED2 algorithm support
>>>>>>> - * @DPU_SSPP_SCALER_QSEED3,  QSEED3 alogorithm support
>>>>>>> - * @DPU_SSPP_SCALER_QSEED3LITE,  QSEED3 Lite alogorithm support
>>>>>>> - * @DPU_SSPP_SCALER_QSEED4,  QSEED4 algorithm support
>>>>>>> + * @DPU_SSPP_SCALER_QSEED3,  QSEED3 alogorithm support (also QSEED3LITE and QSEED4)
>>>>>>>       * @DPU_SSPP_SCALER_RGB,     RGB Scaler, supported by RGB pipes
>>>>>>>       * @DPU_SSPP_CSC,            Support of Color space converion
>>>>>>>       * @DPU_SSPP_CSC_10BIT,      Support of 10-bit Color space conversion
>>>>>>> @@ -72,8 +70,6 @@ enum {
>>>>>>>      enum {
>>>>>>>          DPU_SSPP_SCALER_QSEED2 = 0x1,
>>>>>>>          DPU_SSPP_SCALER_QSEED3,
>>>>>>> -     DPU_SSPP_SCALER_QSEED3LITE,
>>>>>>> -     DPU_SSPP_SCALER_QSEED4,
>>>>>>>          DPU_SSPP_SCALER_RGB,
>>>>>>>          DPU_SSPP_CSC,
>>>>>>>          DPU_SSPP_CSC_10BIT,
>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>>>>>>> index 7e9c87088e17..d1b70cf72eef 100644
>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>>>>>>> @@ -594,9 +594,7 @@ static void _setup_layer_ops(struct dpu_hw_sspp *c,
>>>>>>>                  test_bit(DPU_SSPP_SMART_DMA_V2, &c->cap->features))
>>>>>>>                  c->ops.setup_multirect = dpu_hw_sspp_setup_multirect;
>>>>>>>
>>>>>>> -     if (test_bit(DPU_SSPP_SCALER_QSEED3, &features) ||
>>>>>>> -                     test_bit(DPU_SSPP_SCALER_QSEED3LITE, &features) ||
>>>>>>> -                     test_bit(DPU_SSPP_SCALER_QSEED4, &features))
>>>>>>> +     if (test_bit(DPU_SSPP_SCALER_QSEED3, &features))
>>>>>>>                  c->ops.setup_scaler = _dpu_hw_sspp_setup_scaler3;
>>>>>>
>>>>>> Can we just do sblk->scaler_blk.version >= 0x3000 instead of this
>>>>>> merging? That way you can still drop those enums without inaccuracy.
>>>>>
>>>>> No. QSEED3 from sdm845 has version 1.3, msm8998, sdm660 and sdm630
>>>>> have version 1.2.
>>>>>
>>>>
>>>> Ah got it.
>>>>
>>>> HW versioning is getting harder to generalize with the example you have
>>>> given. In my opinion, in that case lets keep these enums intact because
>>>> we dont have any other way of knowing the Qseed version otherwise and in
>>>> terms of LOC, we are not really saving so much in this change.
>>>>
>>>> In the prev change I agreed because along with the name and the version,
>>>> we could still interpret the version but with compressing the enums into
>>>> just QSEED3, this becomes very confusing. So now, in the future if we
>>>> have QSEED5 HW, we will have to change this anyway as its LUT
>>>> programming can change. So we need this distinction.
>>>
>>> I'm trying to eliminate them, because they cause more confusion than
>>> the bonuses.
>>> Currently we have QSEED3  / 3LITE / 4, which are somewhat compatible.
>>>
>>> We are aiming to support QSEED2 and RGB, which are incompatible with
>>> the QSEED3/3lite/4 family programming sequence. So they get their own
>>> feature bits (DPU_SSPP_SCALER_QSEED2 and DPU_SSPP_SCALER_RGB).
>>>
>>> QSEED5-to-be will either be compatible with QSEED3 (and thus can fall
>>> into the same bucket) or it will be a different kind of scaler (and
>>> will get its own feature).
>>>
>>> I'm not a fan of DPU_SSPP_SCALER_QSEED3LITE/QSEED4 and I'd like to
>>> remove those two bits for the following reasons:
>>> - We already encode this info into the scaler version. How should
>>> driver behave it it has e.g. version 3.1, but DPU_SSPP_SCALER_QSEED3?
>>> Or vice versa: version 1.2 but QSEED4 feature bit? Having a single
>>> QSEED3 removes this issue.
>>> - Adding QSEED5-compatible-with-QSEED3 requires changing several
>>> places which deal with the feature bits and the per-version setup
>>> sequence. This seems like an overkill. It is easy to miss one of the
>>> places and thus end up with the half-supported scaler
>>>
>>> I admit, it might not be ideal to use QSEED3 for all scaler versions.
>>> I'm open to suggestions on the better name for this feature bit. But I
>>> have no doubts that there should be a single feature bit for all
>>> QSEED3/3LITE/4 scalers.
>>>
>>
>> hmmm, the concern i had was that from the version the driver doesnt seem
>> to know which qseed it is as you rightly pointed out in your earlier
>> response with the examples of sdm845, msm8998 etc.
>>
>> It needs this feature bit to know which qseed version it is to use the
>> correct scaler function. If you remove the other two places below, this
>> will be the only one left right?
>>
>> I was thinking of solving this problem with something like
>> QSEED3_3LITE_4 but then this is not scalable if QSEED5 is also a variant
>> of QSEED3.
>>
>> After we remove below 2 places, are there more places where we test
>> these feature bits?
> 
> Hmm, true, this is the only place enumerating them.
> 
>> One thing we can perhaps do is move all this feature bit handling to one
>> function like dpu_scaler_is_qseed3_compatible() and move these feature
>> bits there. That way you will have only one place to change for all the
>> code.
> 
> What about renaming QSEED3 to QSEED3_COMPATIBLE then? This would leave
> us with RGB, QSEED2, QSEED3_COMPATIBLE. The QSEED5-to-be will either
> be added as a new entry (and a new scaler function) or it will fall
> into the QSEED3_COMPATIBLE bucket.
> 
> I'd really like to remove any chance of confusion between QSEEDn and
> the scaler_block.version. I think we already had that wrong in several
> catalog entries, so let's not walk twice into the same water.
> 

Ok thats fine. Lets go ahead with QSEED3_COMPATIBLE as that aligns with 
the expectation that we will use the scaler3_lut for everything thats 
compatible with QSEED3.

>>>> The below two changes seem fine and that way we are eliminating the
>>>> usages of the enum and we will end up with only one place using this.
>>>>
>>>>
>>>>>>
>>>>>>>
>>>>>>>          if (test_bit(DPU_SSPP_CDP, &features))
>>>>>>> @@ -629,10 +627,7 @@ int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms,
>>>>>>>                          cfg->len,
>>>>>>>                          kms);
>>>>>>>
>>>>>>> -     if (cfg->features & BIT(DPU_SSPP_SCALER_QSEED3) ||
>>>>>>> -                     cfg->features & BIT(DPU_SSPP_SCALER_QSEED3LITE) ||
>>>>>>> -                     cfg->features & BIT(DPU_SSPP_SCALER_QSEED2) ||
>>>>>>> -                     cfg->features & BIT(DPU_SSPP_SCALER_QSEED4))
>>>>>>> +     if (sblk->scaler_blk.len)
>>>>>>
>>>>>> This part seems fine.
>>>>>>
>>>>>>>                  dpu_debugfs_create_regset32("scaler_blk", 0400,
>>>>>>>                                  debugfs_root,
>>>>>>>                                  sblk->scaler_blk.base + cfg->base,
>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>>>>>> index 43135894263c..ba3ee4ba25b3 100644
>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>>>>>> @@ -438,8 +438,7 @@ static void _dpu_plane_setup_scaler3(struct dpu_hw_sspp *pipe_hw,
>>>>>>>                          scale_cfg->src_height[i] /= chroma_subsmpl_v;
>>>>>>>                  }
>>>>>>>
>>>>>>> -             if (pipe_hw->cap->features &
>>>>>>> -                     BIT(DPU_SSPP_SCALER_QSEED4)) {
>>>>>>> +             if (pipe_hw->cap->sblk->scaler_blk.version >= 0x3000) {
>>>>>> This is fine too.
>>>>>>>                          scale_cfg->preload_x[i] = DPU_QSEED4_DEFAULT_PRELOAD_H;
>>>>>>>                          scale_cfg->preload_y[i] = DPU_QSEED4_DEFAULT_PRELOAD_V;
>>>>>>>                  } else {
>>>>>
>>>>>
>>>>>
>>>
>>>
>>>
> 
> 
> 
