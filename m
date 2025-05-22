Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C2EAC1408
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 21:04:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBCA010E83C;
	Thu, 22 May 2025 19:04:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ICUZxNiF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E66A10EA01
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:03:52 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MIFPT9015209
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:03:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=UkdtLDWPWV86WMIXjh/84M
 WseBY4yX2yXHBPJxMZ3kk=; b=ICUZxNiFZgYqtRmX8jYmbzvBUWf4j0U1zyTYei
 Xr0unvWTNsM76pf6SWTw5P8OETXqmV2f6VS1eiwcumXNQ8F9YTKaVm2pUoLNWwFQ
 bpnvs7H7zs2hLYBOI6Xl3XIegqYBJ4t1RtSfl2i7Dlu1nffl8+qv89ebNngVpuZp
 hw+kipCWog8G2uNxBaXXYRzogqInOQ0fN5CGCQjyn+qy/q3U8Yb3ZZurRGfKoo+y
 59heevnpSqxuXUsnuARs8y9RV0ew4vurOZ45q36d7eErdciYpCRv/lzDEImUWTtG
 0hb1iyNrQeX15NAGRNC9fdBpv4oyCn2ocq/b0+vyfCecSvwQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9fb1m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:03:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c760637fe5so1435083985a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 12:03:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747940613; x=1748545413;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UkdtLDWPWV86WMIXjh/84MWseBY4yX2yXHBPJxMZ3kk=;
 b=I+Az5iZMGHKOc5mmKdTlpBAVD+VUKiPyV1WX6y2YSz+jyWR2RLDjZdnEEZrr/Dd5YK
 W2dEItnEMackjSGrqW+HjOqoCUEZCMLfFV2Il5e8lRJIlImIo+cvDhoOJ+adOClEx8LK
 o2//mNUYyAkPzf/FQFbMQC1pAbq+Df3Cra3sY/abCidBUdYl4JbYMhuSXqoZ84WqheDG
 8r9INRLoShhGSh75RCkHIC6KaLfTJybUJE6v+8NMKqINleBIAHHUp5Kid4Un/urf3NBO
 YxbFjsB1YLCfLpPFo4s5LFpQyEXgUUO2mEuI7fNKAtzFY11+mGdSNmP6e7TMptPJyDtv
 azsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYOGT+JoDZlci+9u3DKH/rQ6lteVO8Hzkw2ChtFfnDQ5gNRY1MHIpdZMLp579us00nqUQeXa/J53Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4AJrp8UZZg9eplI4pSgkCqg5P79HiDgSh78/76Ea/WeDwj0Ur
 cajuIYdYQzC4q+FfsZSHdiGE3dWl8OYo8r82p4YcLZ0iu4TMQcGEglHq/vVKKSFq3kJZshruKPO
 NYklQLhoipBalVf4HUNqmFUgV25WpZoqBUAvG0r/N+Esi6FXxzUJr2GoP5b8r5BFQ5tGu7k8=
X-Gm-Gg: ASbGncsOnlm2Gt4tSBp0aJmA5uteK80RNyUoKUxU59XvJJgjcvbinZrGqsh4yGmzU4w
 IzpbfBjP+jQ5EroheteRbatfuBmMk/x9gfDoYuctU/Ugsvi16ybECG7KUVNx9/5cZ9bwoJAepKq
 9MeXqsMP5KY3k32keyM8QELAjDdogy+IOJ78qmaqb/mc1kcMRqeWlsjEY84FkDe72vPsqPlALBc
 LPBK4IIyJVpXvOZ/whXbkv79V50BMMqM5uqEDFqeYJGax2qzv/gBDCw13vOibdaU+pNFseFti1b
 TLqAt6Sxu9ICOtG++S6DDI4RMPVY2mG+5DokXdx0TFMdkCdmkq+AHAzETifVf8t+MoeCWIWU+se
 5yHHNaNFrXUtziI8fL1QWiGF7
X-Received: by 2002:a05:620a:2549:b0:7c7:93ae:fe56 with SMTP id
 af79cd13be357-7cd467a9b62mr3939271885a.51.1747940612578; 
 Thu, 22 May 2025 12:03:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEy/n5ztww6OKTyWk1l8kEgne9HO2Dpgd6If8J3vYhRa+Ry7rHzuHnJj7UGH+LV1945QHf4sw==
X-Received: by 2002:a05:620a:2549:b0:7c7:93ae:fe56 with SMTP id
 af79cd13be357-7cd467a9b62mr3939266585a.51.1747940612101; 
 Thu, 22 May 2025 12:03:32 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 12:03:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 00/30] drm/msm/dpu: rework HW block feature handling
Date: Thu, 22 May 2025 22:03:19 +0300
Message-Id: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPd0L2gC/4XNwY7CIBCA4VcxnKUBBijdk++x2cMIUyXR0gXb7
 Mb03UWN2Us3Xib5J5lvrqxQjlTYx+bKMs2xxDTUMNsN80ccDsRjqM2UUFoqCTyMEw85jbwnvEy
 ZCm+tgOCBSLqO1bsxUx9/HubnV+1jLJeUfx8vZnnfvjS9os2SC9451wtrld+3tDvFAXNqUj6wO
 zerF2GEVquEqoTADq3Fdg+odqmU5nvCk0/nc1PHE4K3EFTIB/ToZABj+38g/QcZ2a1BukLWG3K
 OQIKDFWhZlhteW8P/jgEAAA==
X-Change-ID: 20241213-dpu-drop-features-7603dc3ee189
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6762;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=LvHpzkBXpQpS6a1CNyb0eHhKR06FkrHNFz2Vb8Rs+HI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoL3T790+sMC1fTh8sf4v2cPnQ2YpE/MKGy7u7q
 8uc9hDMus6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaC90+wAKCRCLPIo+Aiko
 1VgACAChGrC/R4NUQTnzHLFYbc0EkGkOD2LbpA7jOehjTtJ7O3jaWmQDFKiz4BMfqlRCptcBXb2
 0R6QpdXB3PZNG7SloFQYzZn0OI85ze6TBTQRMIprq2yFPCJWQdKHrJp/onLTwNl5IApkIo7jQRV
 clcOz1/TFLuKKdHSn5LueLfFfHggD+c3U1Z5rhE6bZfIkomtBL/MUA1LKV4xdK8nDwunfeZPeNs
 I1J4eWleTcXgDJZyPOCl1wir9p1ANy26kogPbIzCMCVR4noqttb1ZUTJUQaJnSUnatePYSE3mpE
 r71VPk96fq/WR6b8YyJVzyS5aRhGd+coYI+KmO55iJ7LqWB0
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Q1FyNu5s884u4IS_Ng63Xth13W0Lfvxf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MiBTYWx0ZWRfX993f3Qtc3wIm
 K9tIxNvtx4nPAAJr3svVhyQsC/NdtQK4kl5la6IZNeKCotIPjJ4JS8fcIzK7Z36mK7aJ5s/Xxxt
 I/E3soDPM0XcFV9KgRVQYtkDR+l84h9OREhdWynx3igeQOM7UtNCnSo87rSdkMompVl/upquE6e
 vYMS0k9yLUkvt4gQ4zqnKfIEXfgAFUFBnNIFfSUWO7qmeOq14KkAdFMYJb/tRoLOsmYH0EIZX3r
 XuF7jojYEzVi8nqHqx1mBwc5SNprDFh7gIEpkGfGv91+LH7j51dtBRXicglDE3SkiojO2iGJy/s
 8GscgLDZz25azaLtmIojS+z9kjqegROEuTGq3V4pVKBO+wv5FWXmVEUFAfl/SzLIFyyQoK7fFHa
 VpGty0KYs1dC5h+Ivt+h8McZOcHMDpZ1yG5Il+rAbDw1F9yA21zErDVygh2qhx12iUE23zOT
X-Authority-Analysis: v=2.4 cv=GawXnRXL c=1 sm=1 tr=0 ts=682f7517 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=t8tNeZB39Io7CcBQPAcA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Q1FyNu5s884u4IS_Ng63Xth13W0Lfvxf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220192
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

Some time ago we started the process of converting HW blocks to use
revision-based checks instead of having feature bits (which are easy to
miss or to set incorrectly). Then the process of such a conversion was
postponed. (Mostly) finish the conversion. The only blocks which still
have feature bits are SSPP, WB and VBIF. In the rare cases where
behaviour actually differs from platform to platform (or from block to
block) use unsigned long bitfields, they have simpler syntax to be
checked and don't involve test_bit() invocation.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v5:
- Added version check in _dpu_encoder_phys_cmd_update_intf_cfg() (Neil)
  Technically it's not necessary, but it makes it easier to follow the
  code.
- Fixed commit message for the DPU_MDP_AUDIO_SELECT patch (Neil)
- Link to v4: https://lore.kernel.org/r/20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com

Changes in v4:
- Rebased on top of linux-next
- Dropped three controversial patches, will be submitted separately
- Folded MIXER_SDM845_MASK into MIXER_MSM8998_MASK as they are equal
  now.
- Link to v3: https://lore.kernel.org/r/20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com

Changes in v3:
- Repost, fixing email/author issues caused by b4 / mailmap interaction
- Link to v2: https://lore.kernel.org/r/20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com

Changes in v2:
- Rebased on top of the current msm-next
- Link to v1: https://lore.kernel.org/r/20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org

---
Dmitry Baryshkov (30):
      drm/msm/dpu: stop passing mdss_ver to setup_timing_gen()
      drm/msm/dpu: drop INTF_SC7280_MASK
      drm/msm/dpu: inline _setup_ctl_ops()
      drm/msm/dpu: inline _setup_dsc_ops()
      drm/msm/dpu: inline _setup_dspp_ops()
      drm/msm/dpu: inline _setup_mixer_ops()
      drm/msm/dpu: remove DSPP_SC7180_MASK
      drm/msm/dpu: get rid of DPU_CTL_HAS_LAYER_EXT4
      drm/msm/dpu: get rid of DPU_CTL_ACTIVE_CFG
      drm/msm/dpu: get rid of DPU_CTL_FETCH_ACTIVE
      drm/msm/dpu: get rid of DPU_CTL_DSPP_SUB_BLOCK_FLUSH
      drm/msm/dpu: get rid of DPU_CTL_VM_CFG
      drm/msm/dpu: get rid of DPU_DATA_HCTL_EN
      drm/msm/dpu: get rid of DPU_INTF_STATUS_SUPPORTED
      drm/msm/dpu: get rid of DPU_INTF_INPUT_CTRL
      drm/msm/dpu: get rid of DPU_PINGPONG_DSC
      drm/msm/dpu: get rid of DPU_PINGPONG_DITHER
      drm/msm/dpu: get rid of DPU_MDP_VSYNC_SEL
      drm/msm/dpu: get rid of DPU_MDP_PERIPH_0_REMOVED
      drm/msm/dpu: get rid of DPU_MDP_AUDIO_SELECT
      drm/msm/dpu: get rid of DPU_MIXER_COMBINED_ALPHA
      drm/msm/dpu: get rid of DPU_DIM_LAYER
      drm/msm/dpu: get rid of DPU_DSC_HW_REV_1_2
      drm/msm/dpu: get rid of DPU_DSC_OUTPUT_CTRL
      drm/msm/dpu: get rid of DPU_WB_INPUT_CTRL
      drm/msm/dpu: get rid of DPU_SSPP_QOS_8LVL
      drm/msm/dpu: drop unused MDP TOP features
      drm/msm/dpu: drop ununused PINGPONG features
      drm/msm/dpu: drop ununused MIXER features
      drm/msm/dpu: move features out of the DPU_HW_BLK_INFO

 .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |  49 +++-------
 .../drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h   |   2 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h   |   2 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   |   2 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    |   7 --
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |   7 --
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |   7 --
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |   4 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |  17 +---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h |  11 +--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |  39 ++------
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |  43 ++-------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h |  29 +-----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h |  19 +---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h |  16 +---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |  38 ++------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  14 +--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |   5 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h |  16 +---
 .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |   5 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h |   6 --
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  40 ++------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  22 +----
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |  46 ++-------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  43 ++-------
 .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    |  49 ++--------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  43 ++-------
 .../drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h   |  43 ++-------
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   |  48 ++--------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   3 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   5 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |   7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  42 +--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     | 102 ++------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         | 105 ++++++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c         |  21 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c     |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c        |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |  14 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          |  28 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h          |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c     |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |  11 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |   8 +-
 52 files changed, 257 insertions(+), 813 deletions(-)
---
base-commit: de63bbeb5af60172f1dd4d45bdc897816753fa69
change-id: 20241213-dpu-drop-features-7603dc3ee189

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

