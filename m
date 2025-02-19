Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44888A3CB35
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 22:17:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6560C10E065;
	Wed, 19 Feb 2025 21:17:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="YdKxKivw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DABA310E065;
 Wed, 19 Feb 2025 21:17:52 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51JG4Fnu011661;
 Wed, 19 Feb 2025 21:17:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 w48HOZMFw01ljPkQupwltv/5BomVknzkOw4r7VsrW58=; b=YdKxKivwenLwBHZL
 4s+orJp2TcH0p/rj7gUOPXyMDunbpoCHvQdNu2MscCzj2gdZvvA95ddMnazi8QMQ
 DrpyZ+59oN0mBpAxS6IKp0nm1maY3mhcTMnC+dNsa8hYX5uLWWFD1BNZQUXjkYVl
 Fbq4OsR+4jNKMezm3a4Gn0QOTqkT7L1pNUG/UtXMM1+K8yjSSbxKH6tUpIiYUptw
 snOCjLt23VtuPJhSQNLF68D68WHpUWRZZwH5UKiMDg4C5DSq8pLt1nae/EmYhg1b
 86k2hFt5BhRktAglO0WMvkNK1WLPMCPxS2yj+hBg5XALFQJvqrd2xS83zcT/mCXe
 Xdhi5A==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy3kyhh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Feb 2025 21:17:45 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51JLHaji030396
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Feb 2025 21:17:36 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Feb
 2025 13:17:35 -0800
Message-ID: <eedf08c5-d781-45c8-a5f7-b0369e3efac9@quicinc.com>
Date: Wed, 19 Feb 2025 13:17:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/16] drm/msm: Add support for SM8750
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, Rob Herring <robh@kernel.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Simona Vetter
 <simona@ffwll.ch>, David Airlie <airlied@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, <dri-devel@lists.freedesktop.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 <freedreno@lists.freedesktop.org>, Jonathan Marek <jonathan@marek.ca>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Srini
 Kandagatla" <srinivas.kandagatla@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Maxime Ripard
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, Krishna
 Manikandan <quic_mkrishn@quicinc.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: SvzmE1HiS2uImoE2ToLabryis8mtKYIl
X-Proofpoint-GUID: SvzmE1HiS2uImoE2ToLabryis8mtKYIl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_09,2025-02-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1011
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502190160
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



On 2/17/2025 8:41 AM, Krzysztof Kozlowski wrote:
> Hi,
> 
> Dependency / Rabased on top of:
> https://lore.kernel.org/all/20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org/
> 
> Changes in v2:
> - Implement LM crossbar, 10-bit alpha and active layer changes:
>    New patch: drm/msm/dpu: Implement new v12.0 DPU differences
> - New patch: drm/msm/dpu: Add missing "fetch" name to set_active_pipes()
> - Add CDM
> - Split some DPU patch pieces into separate patches:
>    drm/msm/dpu: Drop useless comments
>    drm/msm/dpu: Add LM_7, DSC_[67], PP_[67] and MERGE_3D_5
>    drm/msm/dpu: Add handling of LM_6 and LM_7 bits in pending flush mask
> - Split DSI and DSI PHY patches
> - Mention CLK_OPS_PARENT_ENABLE in DSI commit
> - Mention DSI PHY PLL work:
>    https://patchwork.freedesktop.org/patch/542000/?series=119177&rev=1
> - DPU: Drop SSPP_VIG4 comments
> - DPU: Add CDM
> - Link to v1: https://lore.kernel.org/r/20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org
> 
> Description:
> =============
> I got modetest writeback working, but DSI panel on MTP8750 still shows
> darkness.

Hey Dmitry,

Just wanted to emphasize this note on Krzysztof's cover letter.

Can we hold off on picking up the DSI parts of this series until the DSI 
panel comes up for MTP8750?

Thanks,

Jessica Zhang

> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (16):
>        dt-bindings: display/msm: dsi-controller-main: Combine if:then: entries
>        dt-bindings: display/msm: dsi-controller-main: Add missing minItems
>        dt-bindings: display/msm: dsi-phy-7nm: Add SM8750
>        dt-bindings: display/msm: dsi-controller-main: Add SM8750
>        dt-bindings: display/msm: dp-controller: Add SM8750
>        dt-bindings: display/msm: qcom,sm8650-dpu: Add SM8750
>        dt-bindings: display/msm: qcom,sm8750-mdss: Add SM8750
>        drm/msm/dpu: Drop useless comments
>        drm/msm/dpu: Add LM_7, DSC_[67], PP_[67] and MERGE_3D_5
>        drm/msm/dpu: Add handling of LM_6 and LM_7 bits in pending flush mask
>        drm/msm/dsi/phy: Add support for SM8750
>        drm/msm/dsi: Add support for SM8750
>        drm/msm/dpu: Add support for SM8750
>        drm/msm/dpu: Add missing "fetch" name to set_active_pipes()
>        drm/msm/dpu: Implement new v12.0 DPU differences
>        drm/msm/mdss: Add support for SM8750
> 
>   .../bindings/display/msm/dp-controller.yaml        |   4 +
>   .../bindings/display/msm/dsi-controller-main.yaml  | 124 +++---
>   .../bindings/display/msm/dsi-phy-7nm.yaml          |   1 +
>   .../bindings/display/msm/qcom,sm8650-dpu.yaml      |   1 +
>   .../bindings/display/msm/qcom,sm8750-mdss.yaml     | 460 +++++++++++++++++++
>   .../drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h    | 496 +++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  59 ++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  12 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  35 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |  71 ++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |  19 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          | 210 ++++++++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h          |  18 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   6 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>   drivers/gpu/drm/msm/dsi/dsi.h                      |   2 +
>   drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |  25 ++
>   drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |   1 +
>   drivers/gpu/drm/msm/dsi/dsi_host.c                 |  80 ++++
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   1 +
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |  79 +++-
>   drivers/gpu/drm/msm/msm_mdss.c                     |  33 ++
>   drivers/gpu/drm/msm/msm_mdss.h                     |   1 +
>   .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  |  14 +
>   26 files changed, 1655 insertions(+), 101 deletions(-)
> ---
> base-commit: 44ddcc7604ae61eadc748ccc6156bf4b98697978
> change-id: 20250109-b4-sm8750-display-6ea537754af1
> 
> Best regards,
> -- 
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

