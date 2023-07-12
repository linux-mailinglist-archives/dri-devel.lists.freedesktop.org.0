Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C5574FC45
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 02:41:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 941F210E46C;
	Wed, 12 Jul 2023 00:41:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F75810E46C;
 Wed, 12 Jul 2023 00:41:21 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36C0cXuj006044; Wed, 12 Jul 2023 00:41:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=HGrpoIb5cX3H4beNosLmCuJWQWBE69cGa39NZUmHoMs=;
 b=cndsCgdVSaDVb2JyFdOpSvuyWcWFSs/2fv4/Sl6L19c4QtGt2fgKky98+SC5cPPDD6T5
 79/8tSzE/bra8Kx9H8BTXkqROwhN+h0xGnrpf2N922FBctaug6EvRKSI0n1W9igDl8cR
 k84NDeuxIPdxPj70baCW5JTzTUFswT7UQE3hHaE1otr/ZHnkyNC5k0tmUKlX5Ye8WueO
 7uQwX/pfSKzLmFmZWfLjuJ7udSCqkkVNdmwWVAs1zuniLNzpYIHZCqKiZEjemMEk2CoE
 UivIewC8fKZw43u1boM1CiEcFgkHSBHES/RFYzv0vB/6IjOtFaENsXMMHnmVC8BWU4hX Gg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rsetdr97a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jul 2023 00:41:12 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36C0fCA3021952
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jul 2023 00:41:12 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 11 Jul
 2023 17:41:11 -0700
Message-ID: <b738bf91-3d20-6b9e-e2c6-d257c468921c@quicinc.com>
Date: Tue, 11 Jul 2023 17:41:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [PATCH v4 04/19] drm/msm/dpu: drop
 dpu_mdss_cfg::mdp_count field
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230619212519.875673-1-dmitry.baryshkov@linaro.org>
 <20230619212519.875673-5-dmitry.baryshkov@linaro.org>
 <0aafbba0-52dd-96d9-94a6-0452996e1eba@quicinc.com>
 <974a294c-d85d-a79f-5b83-bbbac12ff7a2@linaro.org>
 <50855184-1fbf-8e36-f0eb-a46be70b1eca@quicinc.com>
 <CAA8EJprQLpRNHShWWWZeSyKx3erat3Q7WUXhVV1pYp9UtQEgng@mail.gmail.com>
 <CAA8EJpqysGpZzEs1QGDec9Jian6gDy+SG6a_VormPF_cdq47hA@mail.gmail.com>
 <99ec07f7-8892-9cfe-e843-c0f2d9eef658@quicinc.com>
 <CAA8EJprnPzQz2Nj+iA-M63YeE=esdPZs5dYrnkNEmH1wdMn-Xg@mail.gmail.com>
 <f2722ecc-6ad7-a2ea-111a-96e665385849@quicinc.com>
In-Reply-To: <f2722ecc-6ad7-a2ea-111a-96e665385849@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: bIScI5O0otQ8lp76W4lpKpTrHEVqrKab
X-Proofpoint-GUID: bIScI5O0otQ8lp76W4lpKpTrHEVqrKab
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-11_14,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 mlxlogscore=999 spamscore=0 mlxscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307120003
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
Cc: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/4/2023 12:01 PM, Abhinav Kumar wrote:
> 
> 
> On 7/4/2023 10:28 AM, Dmitry Baryshkov wrote:
>> On Tue, 4 Jul 2023 at 19:10, Abhinav Kumar <quic_abhinavk@quicinc.com> 
>> wrote:
>>>
>>>
>>>
>>> On 7/4/2023 4:52 AM, Dmitry Baryshkov wrote:
>>>> On Tue, 4 Jul 2023 at 13:06, Dmitry Baryshkov
>>>> <dmitry.baryshkov@linaro.org> wrote:
>>>>>
>>>>> On Tue, 4 Jul 2023 at 07:04, Abhinav Kumar 
>>>>> <quic_abhinavk@quicinc.com> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 7/3/2023 7:20 PM, Dmitry Baryshkov wrote:
>>>>>>> On 03/07/2023 05:01, Abhinav Kumar wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 6/19/2023 2:25 PM, Dmitry Baryshkov wrote:
>>>>>>>>> There is always a single MDP TOP block. Drop the mdp_count 
>>>>>>>>> field and
>>>>>>>>> stop declaring dpu_mdp_cfg instances as arrays.
>>>>>>>>>
>>>>>>>>> Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
>>>>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>>>> ---
>>>>>>>>
>>>>>>>> The change drops mdp_count and stops using the array which is 
>>>>>>>> fine and
>>>>>>>> I will support that.
>>>>>>>>
>>>>>>>> But looking at the pattern I saw while using core_revision, both
>>>>>>>> DPU_MDP_VSYNC_SEL and DPU_MDP_AUDIO_SELECT can also be dropped from
>>>>>>>> the catalog in favor of using core_revision.
>>>>>>>>
>>>>>>>> Hence for that, I request you not to stop passing dpu_mdss_cfg to
>>>>>>>> dpu_hw_mdptop_init as that has the necessary information of
>>>>>>>> core_revision.
>>>>>>>
>>>>>>> Sure, I'll restore it. Please note, however, that it might be 
>>>>>>> better to
>>>>>>> pass struct dpu_caps instead of the full struct dpu_mdss_cfg.
>>>>>>>
>>>>>>
>>>>>> Thanks for restoring.
>>>>>>
>>>>>> Can you pls explain this better? dpu_core_rev is part of 
>>>>>> dpu_mdss_cfg,
>>>>>> so dpu_caps wont be enough for this one.
>>>>>
>>>>> Oh, true. For some reason I thought that version is a part of 
>>>>> dpu_caps.
>>>>
>>>> And after additional thought. Maybe it would be better to add a
>>>> separate struct dpu_mdss_version and pass it to the hw block init
>>>> functions?
>>>>
>>>
>>> I would like to see this evolve. Today, we are assuming that only the hw
>>> block init functions are the places we would use those.
>>>
>>>   From what I recall, the DSC over DP series needed the core_revision in
>>> the timing gen code somewhere.
>>
>> I hope you are talking about the DPU driver here, not about the DP
>> driver. For the DP driver please use struct msm_dp_desc.
>>
> 
> Yes DPU driver.
> 
>>>
>>> If we see that pattern is possible once that lands, why not.
>>>
>>> Right now, I would leave it at dpu_mdss_cfg.
>>>

Changed my mind on this due to two reasons:

1) the earlier agreement was to pass dpu_mdss_cfg but passing that will 
be against the design of dpu_hw_*** functions because they have stopped 
passing the index and as dpu_intf_cfg is encapsulated within 
dpu_mdss_cfg, passing both is duplicated information.

2) I have cross-checked that even for DSC over DP, we should be able to 
pass dpu_kms->catalog->mdss_rev with this approach like I have posted now


>>>>>
>>>>>>
>>>>>>>>
>>>>>>>>>     .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  7 +---
>>>>>>>>>     .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  7 +---
>>>>>>>>>     .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  7 +---
>>>>>>>>>     .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  7 +---
>>>>>>>>>     .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  7 +---
>>>>>>>>>     .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  7 +---
>>>>>>>>>     .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  7 +---
>>>>>>>>>     .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |  7 +---
>>>>>>>>>     .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  7 +---
>>>>>>>>>     .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |  7 +---
>>>>>>>>>     .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  7 +---
>>>>>>>>>     .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  7 +---
>>>>>>>>>     .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  7 +---
>>>>>>>>>     .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  7 +---
>>>>>>>>>     .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  7 +---
>>>>>>>>>     .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  1 -
>>>>>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    | 38 
>>>>>>>>> +++----------------
>>>>>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h    |  8 ++--
>>>>>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  4 +-
>>>>>>>>>     19 files changed, 41 insertions(+), 115 deletions(-)
>>>>>>>
>>>>>
>>>>>
>>>>>
>>>>> -- 
>>>>> With best wishes
>>>>> Dmitry
>>>>
>>>>
>>>>
>>
>>
>>
