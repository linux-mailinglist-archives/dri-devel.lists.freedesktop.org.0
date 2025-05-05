Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 410BCAAA465
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 01:28:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5084810E5A2;
	Mon,  5 May 2025 23:28:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="fkCnzTdP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26AB610E4F1;
 Mon,  5 May 2025 23:28:28 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545M8Xxc026325;
 Mon, 5 May 2025 23:28:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0CFm2uDuF4QslEcgCv0g0HtvXtQzjBrqc+iTCQS8mQY=; b=fkCnzTdP4HUQ+8vK
 3JvCuyPtLLhi6ffEvUOTXYENaqgXRZ48mxJSamtlaPlI1fmc17kRRAQpEdjF+tq/
 rixjwZBc8FferMlI7crGeJTGbKoWb742myuQYN+LtcNWDTwK82DcJJT9iFXdBDPT
 tElWxH0wFPNnzpOh5s8vBkQ4ZYJGfuhq/crQ9juZvm4GyJ2l2ADzfQiXq8Qohmch
 nzsZaV2Y5twDWg2TdA6A+tDHqL6q3fx/AoUpaobcB49VpSVoQtvru4XZadusWiDo
 nVP23sGbeIHlE7DHTAtvUU1j70yTnsAUiEpKExbT6uSyu7/7FUFWo3T2ZBuPOz59
 /o8mcQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5uur555-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 May 2025 23:28:19 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 545NSIGg016450
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 5 May 2025 23:28:18 GMT
Received: from [10.134.71.99] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 5 May 2025
 16:28:18 -0700
Message-ID: <342326dd-3739-4a8f-b83d-fe21bb67b46b@quicinc.com>
Date: Mon, 5 May 2025 16:28:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/33] drm/msm/dpu: rework HW block feature handling
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Vinod Koul
 <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>
References: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=L9cdQ/T8 c=1 sm=1 tr=0 ts=68194993 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=8YDd2d3uNFf-k3v2XIwA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: c0f8rar1s6Sl_mr0AwWaIm5v7ftWnRTd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDIyMSBTYWx0ZWRfX9ZfMUrFJJeNM
 avlDbWX50FQTA56C2EJ4nZaRAh0SVAVrmlJFI9t8ukzL9SNRqveILb9AZV1NJRc5At7dQXA3FrQ
 69kNdbQsJ1jYGkN93iyqTIPPmjeKqP6lfOsR6hQf0GL+4hV0JZTtjsZPQ5B7ijPWRWVu/r7uyzv
 45ZW/18GLIWH+xK3zcARvryMrjbvJp13y6tiZNNqcKEC7QWLW2zGavq/NNuep+AkCmdknVdqwUg
 n3ZquMp7zs+9VrUQs84vIZX7o5wh9GtceStN0/eQFRIbWyZvHlWFU+tw0C9g9X/5g25ida0J5eD
 y5PT7b1VxqmP992hcLhfdRz1aShmYAuvkKaUreGUlpI+nqR13bNfh6ldq9RIkB1x1q3N8F2gg0D
 QPvIWsOvZn7vctVd8wAQCjXQWE1j8nwYKwUnd6P/ixNY4MbmPjlX4TP0/MAK4tMluDM768ST
X-Proofpoint-ORIG-GUID: c0f8rar1s6Sl_mr0AwWaIm5v7ftWnRTd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_10,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999 spamscore=0 suspectscore=0 impostorscore=0
 mlxscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050221
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



On 4/24/2025 2:30 AM, Dmitry Baryshkov wrote:
> Some time ago we started the process of converting HW blocks to use
> revision-based checks instead of having feature bits (which are easy to
> miss or to set incorrectly). Then the process of such a conversion was
> postponed. (Mostly) finish the conversion. The only blocks which still
> have feature bits are SSPP, WB and VBIF. In the rare cases where
> behaviour actually differs from platform to platform (or from block to
> block) use unsigned long bitfields, they have simpler syntax to be
> checked and don't involve test_bit() invocation.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Hi Dmitry,

I agree that some features like *_HAS_LAYER_EXT4 and INTF_INPUT_CTRL can 
be replaced with a general version check.
However, for other features (such as DPU_MIXER_SOURCESPLIT --> 
dpu_lm_cfg::sourcesplit), it seems to me, you've just replaced the 
feature bit with an equivalent catalog field.
So while some features can be dropped from the feature flag list, it 
seems that we would still need feature flags (in some form) for others.

Overall though, I think that dropping the feature bits makes it less 
clear exactly what features are supported for which chipsets and makes 
it harder to relegate features to specific chipsets.

So while I do see where you're coming from here, I'm a bit hesitant of 
the overall move to drop feature flags for the reasons above.

Thanks,

Jessica Zhang

> ---
> Changes in v3:
> - Repost, fixing email/author issues caused by b4 / mailmap interaction
> - Link to v2: https://lore.kernel.org/r/20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com
> 
> Changes in v2:
> - Rebased on top of the current msm-next
> - Link to v1: https://lore.kernel.org/r/20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org
> 
> ---
> Dmitry Baryshkov (33):
>        drm/msm/dpu: stop passing mdss_ver to setup_timing_gen()
>        drm/msm/dpu: drop INTF_SC7280_MASK
>        drm/msm/dpu: inline _setup_ctl_ops()
>        drm/msm/dpu: inline _setup_dsc_ops()
>        drm/msm/dpu: inline _setup_dspp_ops()
>        drm/msm/dpu: inline _setup_mixer_ops()
>        drm/msm/dpu: remove DSPP_SC7180_MASK
>        drm/msm/dpu: get rid of DPU_CTL_HAS_LAYER_EXT4
>        drm/msm/dpu: get rid of DPU_CTL_ACTIVE_CFG
>        drm/msm/dpu: get rid of DPU_CTL_FETCH_ACTIVE
>        drm/msm/dpu: get rid of DPU_CTL_DSPP_SUB_BLOCK_FLUSH
>        drm/msm/dpu: get rid of DPU_CTL_VM_CFG
>        drm/msm/dpu: get rid of DPU_DATA_HCTL_EN
>        drm/msm/dpu: get rid of DPU_INTF_STATUS_SUPPORTED
>        drm/msm/dpu: get rid of DPU_INTF_INPUT_CTRL
>        drm/msm/dpu: get rid of DPU_PINGPONG_DSC
>        drm/msm/dpu: get rid of DPU_PINGPONG_DITHER
>        drm/msm/dpu: get rid of DPU_MDP_VSYNC_SEL
>        drm/msm/dpu: get rid of DPU_MDP_PERIPH_0_REMOVED
>        drm/msm/dpu: get rid of DPU_MDP_AUDIO_SELECT
>        drm/msm/dpu: get rid of DPU_MIXER_COMBINED_ALPHA
>        drm/msm/dpu: get rid of DPU_DIM_LAYER
>        drm/msm/dpu: get rid of DPU_DSC_HW_REV_1_2
>        drm/msm/dpu: get rid of DPU_DSC_OUTPUT_CTRL
>        drm/msm/dpu: get rid of DPU_WB_INPUT_CTRL
>        drm/msm/dpu: get rid of DPU_SSPP_QOS_8LVL
>        drm/msm/dpu: drop unused MDP TOP features
>        drm/msm/dpu: drop ununused PINGPONG features
>        drm/msm/dpu: drop ununused MIXER features
>        drm/msm/dpu: get rid of DPU_MIXER_SOURCESPLIT
>        drm/msm/dpu: get rid of DPU_DSC_NATIVE_42x_EN
>        drm/msm/dpu: get rid of DPU_CTL_SPLIT_DISPLAY
>        drm/msm/dpu: move features out of the DPU_HW_BLK_INFO
> 
>   .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |  53 +++-----
>   .../drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h   |   4 -
>   .../drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h   |   3 -
>   .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   |   4 -
>   .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    |  15 +--
>   .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |  19 +--
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |  19 +--
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |  12 +-
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |  21 +---
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h |  11 +-
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |  43 ++-----
>   .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |  45 ++-----
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h |  31 ++---
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h |  19 +--
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h |  16 +--
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |  42 ++-----
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  14 +--
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |   5 -
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h |  16 +--
>   .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |   5 -
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h |   6 -
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  44 ++-----
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  22 +---
>   .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |  50 ++------
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  47 ++------
>   .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    |  53 ++------
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  47 ++------
>   .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   |  52 ++------
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   2 +-
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   3 +-
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |   7 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  51 +-------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     | 134 ++-------------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         | 108 ++++++++---------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |   4 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c         |  21 ++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |   3 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c     |   7 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c        |  10 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |  14 +--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |   5 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          |  28 ++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h          |   3 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c     |   5 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |   4 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |   5 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |   2 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |  11 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |   2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   4 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |  17 ++-
>   51 files changed, 304 insertions(+), 864 deletions(-)
> ---
> base-commit: a4efc119e8149503e5fe9e9f7828b79af2fe77c6
> change-id: 20241213-dpu-drop-features-7603dc3ee189
> 
> Best regards,

