Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4906EE592
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 18:20:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24DB110E07F;
	Tue, 25 Apr 2023 16:20:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E36410E07F;
 Tue, 25 Apr 2023 16:20:05 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33P9Bsit032385; Tue, 25 Apr 2023 16:19:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=GAKBJuU432KjY6r9vQ6cWVnjmGCdwzvQx6ZQ0Kdw0r8=;
 b=m9nS76j0fWLAWh8VGc18uRAkp/MSSWzTfB3WUjmh6cLwhZT30LbDDqMlFcxB+YNFTOdt
 ZUBhRdQ17/5K73tnSktKBHiA4VFBpwQYLaKZCQRu1fVIkQPvMD0hLcNpe5E0+R5GaKLe
 wZ7ct59oHWXxJH7/uEhfXpXVZnAGuk3EVG12ikU0ZgK0p/lkmq2AN78ttQif9EoUp3X1
 q0UTzmIi+dxb9Tu4WqXcZaEdqWPdRRsvwjrYVO6FMxoYWqHMc7NlppuW7hIJdqc3vPpA
 YiyHZmCiGfGy7mevqCK3y5Bi4Xbbg1MuDU0Uoy7U6ZrOWeLFBcFkri6FDn60HYOEhLdB eA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q5r0uuxav-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Apr 2023 16:19:02 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33PGJ0fJ001437
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Apr 2023 16:19:00 GMT
Received: from [10.110.104.134] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 25 Apr
 2023 09:18:59 -0700
Message-ID: <7541b780-482e-ea92-f788-18c8fbf45d77@quicinc.com>
Date: Tue, 25 Apr 2023 09:18:58 -0700
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
 <65bb4d8a-c607-4152-0ae3-bf3134955925@quicinc.com>
 <5td7ikd76obc5bn5sndnt7fbzjuwmyxtu35ma3lykzmmbyfffk@b24jh6imaocy>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <5td7ikd76obc5bn5sndnt7fbzjuwmyxtu35ma3lykzmmbyfffk@b24jh6imaocy>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 690RTfHoedT4ThY_eBhBqotQcxFe5vnn
X-Proofpoint-ORIG-GUID: 690RTfHoedT4ThY_eBhBqotQcxFe5vnn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-25_07,2023-04-25_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 mlxlogscore=893 phishscore=0 mlxscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304250147
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



On 4/24/2023 11:54 PM, Marijn Suijten wrote:
> On 2023-04-24 16:09:45, Abhinav Kumar wrote:
> <snip>
>>>> dither block should be present on many other chipsets too but looks like
>>>> on sm8550 was enabling it. Not sure how it was validated there. But we
>>>> are enabling dither, even other chipsets have this block.
>>>
>>> Correct, they all seem to have it starting at sdm845.  My patch message
>>> seems to lack the word "exclusively" as the PP on sm8550 appears to
>>> exclusively contain a DITHER subblock (unless other blocks are available
>>> that simply aren't supported within this driver yet) and no other
>>> registers.  Hence this aptly named macro exist to emit just the feature
>>> bitflag for that and a .len of zero.
>>>
>>
>> I think after the TE blocks were moved to INTF, dither is the only
>> sub-block for all Ping-Pongs not just in sm8550.
> 
> So you are asking / leaving context to make all >= 5.0.0 pingpong blocks
> use this macro with only a single DITHER sblk in PP?
> 
> As far as I recall SM8550 is the first SoC to use zero registers in PP,
> which is specifically what this macro takes care of too.  Then, there
> are only a few SoCs downstream still (erroneously?) referencing TE2 as
> the only other sub-blk, those SoCs still use sdm845_pp_sblk_te.
> 

So, what I didnt follow is why should sm8450 use PP_BLK_TE Vs sm8550 
should use PP_BLK_DIPHER?

Atleast for those two, both should be using PP_BLK_DIPHER.

Thats what I was trying to note here.

This isnt even right as there is no PP_BLK_TE in sm8450.

>>> Now, whether we should have the features contain subblock flags rather
>>> than just scanning for their id's or presence in the subblocks is a
>>> different discussion / cleanup we should have.
>>>
>>
>> Yes, separate patch and hence I gave R-b on this one. But had to leave
>> this comment to not lose context.
> 
> Fwiw this is a different suggestion: we already have these flags in the
> sub-block `.id` field so there seems to be no reason to duplicate info
> in the top-level `.features` field, deduplicating some info and
> simplifying some defines.
> 
> - Marijn
> 
>>> - Marijn
>>>
>>>>> -	PP_BLK_DIPHER("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sc7280_pp_sblk,
>>>>> +	PP_BLK_DITHER("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sc7280_pp_sblk,
>>>>>     			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>>>>>     			-1),
>>>>> -	PP_BLK_DIPHER("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, sc7280_pp_sblk,
>>>>> +	PP_BLK_DITHER("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, sc7280_pp_sblk,
>>>>>     			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>>>>>     			-1),
>>>>> -	PP_BLK_DIPHER("pingpong_2", PINGPONG_2, 0x6b000, MERGE_3D_1, sc7280_pp_sblk,
>>>>> +	PP_BLK_DITHER("pingpong_2", PINGPONG_2, 0x6b000, MERGE_3D_1, sc7280_pp_sblk,
>>>>>     			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>>>>>     			-1),
>>>>> -	PP_BLK_DIPHER("pingpong_3", PINGPONG_3, 0x6c000, MERGE_3D_1, sc7280_pp_sblk,
>>>>> +	PP_BLK_DITHER("pingpong_3", PINGPONG_3, 0x6c000, MERGE_3D_1, sc7280_pp_sblk,
>>>>>     			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>>>>>     			-1),
>>>>> -	PP_BLK_DIPHER("pingpong_4", PINGPONG_4, 0x6d000, MERGE_3D_2, sc7280_pp_sblk,
>>>>> +	PP_BLK_DITHER("pingpong_4", PINGPONG_4, 0x6d000, MERGE_3D_2, sc7280_pp_sblk,
>>>>>     			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
>>>>>     			-1),
>>>>> -	PP_BLK_DIPHER("pingpong_5", PINGPONG_5, 0x6e000, MERGE_3D_2, sc7280_pp_sblk,
>>>>> +	PP_BLK_DITHER("pingpong_5", PINGPONG_5, 0x6e000, MERGE_3D_2, sc7280_pp_sblk,
>>>>>     			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
>>>>>     			-1),
>>>>> -	PP_BLK_DIPHER("pingpong_6", PINGPONG_6, 0x66000, MERGE_3D_3, sc7280_pp_sblk,
>>>>> +	PP_BLK_DITHER("pingpong_6", PINGPONG_6, 0x66000, MERGE_3D_3, sc7280_pp_sblk,
>>>>>     			-1,
>>>>>     			-1),
>>>>> -	PP_BLK_DIPHER("pingpong_7", PINGPONG_7, 0x66400, MERGE_3D_3, sc7280_pp_sblk,
>>>>> +	PP_BLK_DITHER("pingpong_7", PINGPONG_7, 0x66400, MERGE_3D_3, sc7280_pp_sblk,
>>>>>     			-1,
>>>>>     			-1),
>>>>>     };
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>> index 03f162af1a50..ca8a02debda9 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>> @@ -491,7 +491,7 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
>>>>>     	.len = 0x20, .version = 0x20000},
>>>>>     };
>>>>>     
>>>>> -#define PP_BLK_DIPHER(_name, _id, _base, _merge_3d, _sblk, _done, _rdptr) \
>>>>> +#define PP_BLK_DITHER(_name, _id, _base, _merge_3d, _sblk, _done, _rdptr) \
>>>>>     	{\
>>>>>     	.name = _name, .id = _id, \
>>>>>     	.base = _base, .len = 0, \
>>>>>
