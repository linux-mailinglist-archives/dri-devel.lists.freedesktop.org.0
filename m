Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1DB74683E
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 06:04:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B42B310E28C;
	Tue,  4 Jul 2023 04:04:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D20510E28A;
 Tue,  4 Jul 2023 04:04:31 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3643DH3s012310; Tue, 4 Jul 2023 04:04:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=FO4rH8yiwbgjnIGZtETTls5/kiCfby0nXJfAMfRS8Po=;
 b=SwUlNmlRGZn61T4qUbsUSZof4iowkBN83/7ZcgdBEnpt0TzvNoqU4IXvOrSLicFHO1KU
 YvYH4tQtPZWrCcWI9IxCFxsKyNru3FmOUjkjs2PMg3zWgEuVjE/WCq3vx1Z8m6oYWFYE
 Uq+iqDwOFSruf43XEsgTnJuHFJMtco6zY1ThNFqFqt4GTROBKApwOzZUFG3SuGG+qGaQ
 hvsb3P4OZudAHzPn9V+IcWBcKqaltbNJXfci4iYvrOz1Cv2Pf45gSalrZCTa93Y/WAfR
 /FinOfjwvN6l12U6ltUsGm264QFuL/uTICzz1YheM1WrjYkqd1dfSLASifLsqZTfQD6q mA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rm006190x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jul 2023 04:04:24 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36444NYt013655
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 4 Jul 2023 04:04:23 GMT
Received: from [10.110.19.132] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.7; Mon, 3 Jul 2023
 21:04:22 -0700
Message-ID: <50855184-1fbf-8e36-f0eb-a46be70b1eca@quicinc.com>
Date: Mon, 3 Jul 2023 21:04:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 04/19] drm/msm/dpu: drop dpu_mdss_cfg::mdp_count field
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230619212519.875673-1-dmitry.baryshkov@linaro.org>
 <20230619212519.875673-5-dmitry.baryshkov@linaro.org>
 <0aafbba0-52dd-96d9-94a6-0452996e1eba@quicinc.com>
 <974a294c-d85d-a79f-5b83-bbbac12ff7a2@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <974a294c-d85d-a79f-5b83-bbbac12ff7a2@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: TF23xOaRSq_ipwfxkUpkLCkibWnPL-hH
X-Proofpoint-GUID: TF23xOaRSq_ipwfxkUpkLCkibWnPL-hH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-04_01,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=954 adultscore=0 spamscore=0 impostorscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307040033
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
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/3/2023 7:20 PM, Dmitry Baryshkov wrote:
> On 03/07/2023 05:01, Abhinav Kumar wrote:
>>
>>
>> On 6/19/2023 2:25 PM, Dmitry Baryshkov wrote:
>>> There is always a single MDP TOP block. Drop the mdp_count field and
>>> stop declaring dpu_mdp_cfg instances as arrays.
>>>
>>> Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>
>> The change drops mdp_count and stops using the array which is fine and 
>> I will support that.
>>
>> But looking at the pattern I saw while using core_revision, both 
>> DPU_MDP_VSYNC_SEL and DPU_MDP_AUDIO_SELECT can also be dropped from 
>> the catalog in favor of using core_revision.
>>
>> Hence for that, I request you not to stop passing dpu_mdss_cfg to 
>> dpu_hw_mdptop_init as that has the necessary information of 
>> core_revision.
> 
> Sure, I'll restore it. Please note, however, that it might be better to 
> pass struct dpu_caps instead of the full struct dpu_mdss_cfg.
> 

Thanks for restoring.

Can you pls explain this better? dpu_core_rev is part of dpu_mdss_cfg, 
so dpu_caps wont be enough for this one.

>>
>>>   .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  7 +---
>>>   .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  7 +---
>>>   .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  7 +---
>>>   .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  7 +---
>>>   .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  7 +---
>>>   .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  7 +---
>>>   .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  7 +---
>>>   .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |  7 +---
>>>   .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  7 +---
>>>   .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |  7 +---
>>>   .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  7 +---
>>>   .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  7 +---
>>>   .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  7 +---
>>>   .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  7 +---
>>>   .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  7 +---
>>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  1 -
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    | 38 +++----------------
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h    |  8 ++--
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  4 +-
>>>   19 files changed, 41 insertions(+), 115 deletions(-)
> 
