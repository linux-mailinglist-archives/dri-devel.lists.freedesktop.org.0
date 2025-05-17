Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 895BBABA757
	for <lists+dri-devel@lfdr.de>; Sat, 17 May 2025 02:17:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF2910E1B9;
	Sat, 17 May 2025 00:17:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="UYJSOIm9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B303C10E1B9;
 Sat, 17 May 2025 00:17:22 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GCHouU002120;
 Sat, 17 May 2025 00:08:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kTk7xRffMswbzTXuCCq8zid0YNK/PoGynlrIilTSHtQ=; b=UYJSOIm9XrMznxGv
 PKX5+m2/91QCG52MSgmxGrifK2NCdeqGD9rDMyIhxvccV80N442w39RfVsbaoG5a
 K5K+xX2MwGmblyN4zAIQZwuaui5+hagJ1N82o0fFLDDzqUnMxKH1P/xS5ZEW+Tqz
 79YWjwgo+vBsn7N6ORkpTCAMZL9I/VRR9zVDIQi+xl69YnjFgLevQzr1iRNGw6q7
 +GffuUqQfHPxoY+stGEhzwchYXpoXBsenBz/QOw6QxURwV3TqTK78hWvJYI+y8Jo
 A0mNH18wxnvinCxGZ4q2AJUuBo1liaFyiB3euOKiZvXCgyJbS+ZWAV3scSACL4E/
 Obss8g==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcrk93c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 17 May 2025 00:08:30 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54H08TBm016475
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 17 May 2025 00:08:29 GMT
Received: from [10.134.71.99] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 16 May
 2025 17:08:28 -0700
Message-ID: <75f503ea-e8cf-48f3-b39e-388ac456821f@quicinc.com>
Date: Fri, 16 May 2025 17:08:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/24] drm/msm: Add support for SM8750
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Jonathan Marek
 <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>, Rob Clark
 <robdclark@gmail.com>, Bjorn Andersson <andersson@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@chromium.org>,
 <linux-clk@vger.kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
 "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: qHZxSWgUZHAJEnbr4A_2uY0OfozDuEx9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDIzNSBTYWx0ZWRfX8++ol42qIIV8
 PXzgLMQuPf6306r81xIAqfBTAdYXO6UmdhZQxPc7oSOu9WeisyuCQJsE1gvbWLz8G4HxuYqYjv1
 a2otz8Ay1NjWTyGXtHpHUZE71o2N58r8vzFRdAnoI9zchrIFfFxqmeCTKTj3/QtyVXzM1OG9Abc
 6+SQ/q0jWmKperUPLbFid3uG/J9VZ3VHlroFg3eIt1S8IzmqAKHUaig6nTu5ywWR1KWiANMTQEc
 qRNimJVIWXA+ml0Mu8eFjCVpt9Mu8h84x9Wvlr59QOY/OC10NyfgYEycYTcpsMPoVgLspe1+l2x
 HJBmX4ErHh/2U8jeymUnkf1Kvl2azfdCPWiO8qs2GJIf3XxcEcpB09R8L8Z+MqZAwc76zfiVw04
 FGbw44RN7dMklaQwPWNklJCkTByt6O2DQXx7qoWq3+CbW9yN+tCTK/Jfrgk2Vysn7G7/iBIj
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=6827d37e cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=e5mUnYsNAAAA:8 a=k5wYIqEnLEkAo4cnzkIA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: qHZxSWgUZHAJEnbr4A_2uY0OfozDuEx9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_08,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 malwarescore=0
 phishscore=0 mlxlogscore=999 clxscore=1011 bulkscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160235
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



On 4/30/2025 6:00 AM, Krzysztof Kozlowski wrote:
> Hi,
> 
> Dependency / Rabased on top of
> ==============================
> https://lore.kernel.org/all/20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org/

Hey Krzysztof,

JFYI, I think there was some discussion on IRC (specifically #linux-msm) 
about having the feature bit dependency back in February.

I believe both Abhinav and Dmitry agreed that you can keep the changes 
to do version checks and drop this dependency.

There are still some ongoing discussions regarding the feature bit 
series, so this way your series isn't blocked by that.

Thanks,

Jessica Zhang

> 
> Merging
> =======
> DSI works! With the fixes here and debugging help from Jessica and
> Abhinav, the DSI panel works properly.
> 
> The display clock controller patch can go separately.
> 
> Changes in v5:
> =============
> - Add ack/rb tags
> - New patches:
>    #6: clk: qcom: dispcc-sm8750: Fix setting rate byte and pixel clocks
>    #14: drm/msm/dsi/phy: Toggle back buffer resync after preparing PLL
>    #15: drm/msm/dsi/phy: Define PHY_CMN_CTRL_0 bitfields
>    #16: drm/msm/dsi/phy: Fix reading zero as PLL rates when unprepared
>    #17: drm/msm/dsi/phy: Fix missing initial VCO rate
> 
> - Patch drm/msm/dsi: Add support for SM8750:
>    - Only reparent byte and pixel clocks while PLLs is prepared. Setting
>      rate works fine with earlier DISP CC patch for enabling their parents
>      during rate change.
> 
> - Link to v4: https://lore.kernel.org/r/20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org
> 
> Changes in v4
> =============
> - Add ack/rb tags
> - Implement Dmitry's feedback (lower-case hex, indentation, pass
>    mdss_ver instead of ctl), patches:
>    drm/msm/dpu: Implement 10-bit color alpha for v12.0 DPU
>    drm/msm/dpu: Implement CTL_PIPE_ACTIVE for v12.0 DPU
> 
> - Rebase on latest next
> - Drop applied two first patches
> - Link to v3: https://lore.kernel.org/r/20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org
> 
> Changes in v3
> =============
> - Add ack/rb tags
> - #5: dt-bindings: display/msm: dp-controller: Add SM8750:
>    Extend commit msg
> 
> - #7: dt-bindings: display/msm: qcom,sm8750-mdss: Add SM8750:
>    - Properly described interconnects
>    - Use only one compatible and contains for the sub-blocks (Rob)
> 
> - #12: drm/msm/dsi: Add support for SM8750:
>    Drop 'struct msm_dsi_config sm8750_dsi_cfg' and use sm8650 one.
> - drm/msm/dpu: Implement new v12.0 DPU differences
>    Split into several patches
> - Link to v2: https://lore.kernel.org/r/20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org
> 
> Changes in v2
> =============
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
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (24):
>        dt-bindings: display/msm: dsi-phy-7nm: Add SM8750
>        dt-bindings: display/msm: dsi-controller-main: Add SM8750
>        dt-bindings: display/msm: dp-controller: Add SM8750
>        dt-bindings: display/msm: qcom,sm8650-dpu: Add SM8750
>        dt-bindings: display/msm: qcom,sm8750-mdss: Add SM8750
>        clk: qcom: dispcc-sm8750: Fix setting rate byte and pixel clocks
>        drm/msm/dpu: Add missing "fetch" name to set_active_pipes()
>        drm/msm/dpu: Clear CTL_FETCH_PIPE_ACTIVE on mixer reset
>        drm/msm/dpu: Clear CTL_FETCH_PIPE_ACTIVE on ctl_path reset
>        drm/msm/dpu: Clear CTL_FETCH_PIPE_ACTIVE before blend setup
>        drm/msm/dpu: Drop useless comments
>        drm/msm/dpu: Add LM_7, DSC_[67], PP_[67] and MERGE_3D_5
>        drm/msm/dpu: Add handling of LM_6 and LM_7 bits in pending flush mask
>        drm/msm/dsi/phy: Toggle back buffer resync after preparing PLL
>        drm/msm/dsi/phy: Define PHY_CMN_CTRL_0 bitfields
>        drm/msm/dsi/phy: Fix reading zero as PLL rates when unprepared
>        drm/msm/dsi/phy: Fix missing initial VCO rate
>        drm/msm/dsi/phy: Add support for SM8750
>        drm/msm/dsi: Add support for SM8750
>        drm/msm/dpu: Add support for SM8750
>        drm/msm/dpu: Implement 10-bit color alpha for v12.0 DPU
>        drm/msm/dpu: Implement CTL_PIPE_ACTIVE for v12.0 DPU
>        drm/msm/dpu: Implement LM crossbar for v12.0 DPU
>        drm/msm/mdss: Add support for SM8750
> 
>   .../bindings/display/msm/dp-controller.yaml        |   4 +
>   .../bindings/display/msm/dsi-controller-main.yaml  |  54 ++-
>   .../bindings/display/msm/dsi-phy-7nm.yaml          |   1 +
>   .../bindings/display/msm/qcom,sm8650-dpu.yaml      |   1 +
>   .../bindings/display/msm/qcom,sm8750-mdss.yaml     | 470 +++++++++++++++++++
>   drivers/clk/qcom/dispcc-sm8750.c                   |   4 +-
>   .../drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h    | 496 +++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  58 ++-
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
>   drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |  14 +
>   drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |   1 +
>   drivers/gpu/drm/msm/dsi/dsi_host.c                 |  81 ++++
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   2 +
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          | 157 ++++++-
>   drivers/gpu/drm/msm/msm_mdss.c                     |  33 ++
>   drivers/gpu/drm/msm/msm_mdss.h                     |   1 +
>   .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  |  25 +-
>   27 files changed, 1730 insertions(+), 49 deletions(-)
> ---
> base-commit: 4ec6605d1f7e5df173ffa871cce72567f820a9c2
> change-id: 20250109-b4-sm8750-display-6ea537754af1
> 
> Best regards,

