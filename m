Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A66C6ED857
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 01:11:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8DB310E057;
	Mon, 24 Apr 2023 23:10:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 918D110E057;
 Mon, 24 Apr 2023 23:10:55 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33OMWh3L005351; Mon, 24 Apr 2023 23:09:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=8GdsQCr0p4YLH4qvUym0R6hMLq4gi02IrKOF11qjjxM=;
 b=GonEO0e8cnPaHgdUgLhLR1Kqg2EA8P9/zCIsmWpzlyPpgJRrxRJ3gc6XyYbw6FAa1wIT
 EoMsQIm2LXTWU8UhZWJo8EFRAA2vE4QeAK3BwO/NJVpObseDxXUJNVeu9OwUDZ8hUtk+
 OCyPbnk49TrxbLN9A4oPNCJMdu+FaadVZ781Nrrh78W2kBR79fXUO81JuyP262V1EKpl
 DT5yRfwUEhd2ei6bXDsb75I6gOBW/GYCMxwz3+wltZv4dzcTxZD2KZwoxn6Jl/cZgBUY
 iNMoBnpGjXkBIZ2G453xN3aIx6ScGkDv/4iJA0o9IOZRBM4v4x4E2qNoS6d5m4e7N+dJ vw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q61jdr57d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Apr 2023 23:09:49 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33ON9msF024347
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Apr 2023 23:09:48 GMT
Received: from [10.110.104.134] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 24 Apr
 2023 16:09:46 -0700
Message-ID: <65bb4d8a-c607-4152-0ae3-bf3134955925@quicinc.com>
Date: Mon, 24 Apr 2023 16:09:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH v2 04/17] drm/msm/dpu: Fix PP_BLK_DIPHER ->
 DITHER typo
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230411-dpu-intf-te-v2-0-ef76c877eb97@somainline.org>
 <20230411-dpu-intf-te-v2-4-ef76c877eb97@somainline.org>
 <a0a0b8fb-0d6b-d11b-5596-d61c41aabe7f@quicinc.com>
 <bhatfkgdkjt2bih4lcwa5cxcp3w2tkjrqmbdhqhzqa2cizrmxs@py3gr5vifsoc>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <bhatfkgdkjt2bih4lcwa5cxcp3w2tkjrqmbdhqhzqa2cizrmxs@py3gr5vifsoc>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: BM0PKs6kXF-Aeb2IrdblbYtISv0IQxnd
X-Proofpoint-GUID: BM0PKs6kXF-Aeb2IrdblbYtISv0IQxnd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-24_11,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 clxscore=1015 mlxlogscore=999 malwarescore=0 phishscore=0
 adultscore=0 mlxscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304240210
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
Cc: dri-devel@lists.freedesktop.org, Jordan Crouse <jordan@cosmicpenguin.net>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Archit Taneja <architt@codeaurora.org>, Robert Foss <rfoss@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Rajesh Yadav <ryadav@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 Adam Skladowski <a39.skl@gmail.com>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Jeykumar Sankaran <jsanka@codeaurora.org>, Sean Paul <sean@poorly.run>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Jami
 Kettunen <jami.kettunen@somainline.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/24/2023 3:30 PM, Marijn Suijten wrote:
> On 2023-04-24 13:53:13, Abhinav Kumar wrote:
>>
>>
>> On 4/17/2023 1:21 PM, Marijn Suijten wrote:
>>> SM8550 only comes with a DITHER subblock inside the PINGPONG block,
>>> hence the name and a block length of zero.  However, the PP_BLK macro
>>> name was typo'd to DIPHER rather than DITHER.
>>>
>>> Fixes: efcd0107727c ("drm/msm/dpu: add support for SM8550")
>>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>>
>> This change itself is fine, hence
>>
>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> one comment below
>>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 16 ++++++++--------
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c         |  2 +-
>>>    2 files changed, 9 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>>> index 9e403034093f..d0ab351b6a8b 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>>> @@ -132,28 +132,28 @@ static const struct dpu_dspp_cfg sm8550_dspp[] = {
>>>    		 &sm8150_dspp_sblk),
>>>    };
>>>    static const struct dpu_pingpong_cfg sm8550_pp[] = {
>>
>> dither block should be present on many other chipsets too but looks like
>> on sm8550 was enabling it. Not sure how it was validated there. But we
>> are enabling dither, even other chipsets have this block.
> 
> Correct, they all seem to have it starting at sdm845.  My patch message
> seems to lack the word "exclusively" as the PP on sm8550 appears to
> exclusively contain a DITHER subblock (unless other blocks are available
> that simply aren't supported within this driver yet) and no other
> registers.  Hence this aptly named macro exist to emit just the feature
> bitflag for that and a .len of zero.
> 

I think after the TE blocks were moved to INTF, dither is the only 
sub-block for all Ping-Pongs not just in sm8550.

> Now, whether we should have the features contain subblock flags rather
> than just scanning for their id's or presence in the subblocks is a
> different discussion / cleanup we should have.
> 

Yes, separate patch and hence I gave R-b on this one. But had to leave 
this comment to not lose context.

> - Marijn
> 
>>> -	PP_BLK_DIPHER("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sc7280_pp_sblk,
>>> +	PP_BLK_DITHER("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sc7280_pp_sblk,
>>>    			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>>>    			-1),
>>> -	PP_BLK_DIPHER("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, sc7280_pp_sblk,
>>> +	PP_BLK_DITHER("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, sc7280_pp_sblk,
>>>    			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>>>    			-1),
>>> -	PP_BLK_DIPHER("pingpong_2", PINGPONG_2, 0x6b000, MERGE_3D_1, sc7280_pp_sblk,
>>> +	PP_BLK_DITHER("pingpong_2", PINGPONG_2, 0x6b000, MERGE_3D_1, sc7280_pp_sblk,
>>>    			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>>>    			-1),
>>> -	PP_BLK_DIPHER("pingpong_3", PINGPONG_3, 0x6c000, MERGE_3D_1, sc7280_pp_sblk,
>>> +	PP_BLK_DITHER("pingpong_3", PINGPONG_3, 0x6c000, MERGE_3D_1, sc7280_pp_sblk,
>>>    			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>>>    			-1),
>>> -	PP_BLK_DIPHER("pingpong_4", PINGPONG_4, 0x6d000, MERGE_3D_2, sc7280_pp_sblk,
>>> +	PP_BLK_DITHER("pingpong_4", PINGPONG_4, 0x6d000, MERGE_3D_2, sc7280_pp_sblk,
>>>    			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
>>>    			-1),
>>> -	PP_BLK_DIPHER("pingpong_5", PINGPONG_5, 0x6e000, MERGE_3D_2, sc7280_pp_sblk,
>>> +	PP_BLK_DITHER("pingpong_5", PINGPONG_5, 0x6e000, MERGE_3D_2, sc7280_pp_sblk,
>>>    			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
>>>    			-1),
>>> -	PP_BLK_DIPHER("pingpong_6", PINGPONG_6, 0x66000, MERGE_3D_3, sc7280_pp_sblk,
>>> +	PP_BLK_DITHER("pingpong_6", PINGPONG_6, 0x66000, MERGE_3D_3, sc7280_pp_sblk,
>>>    			-1,
>>>    			-1),
>>> -	PP_BLK_DIPHER("pingpong_7", PINGPONG_7, 0x66400, MERGE_3D_3, sc7280_pp_sblk,
>>> +	PP_BLK_DITHER("pingpong_7", PINGPONG_7, 0x66400, MERGE_3D_3, sc7280_pp_sblk,
>>>    			-1,
>>>    			-1),
>>>    };
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> index 03f162af1a50..ca8a02debda9 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> @@ -491,7 +491,7 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
>>>    	.len = 0x20, .version = 0x20000},
>>>    };
>>>    
>>> -#define PP_BLK_DIPHER(_name, _id, _base, _merge_3d, _sblk, _done, _rdptr) \
>>> +#define PP_BLK_DITHER(_name, _id, _base, _merge_3d, _sblk, _done, _rdptr) \
>>>    	{\
>>>    	.name = _name, .id = _id, \
>>>    	.base = _base, .len = 0, \
>>>
