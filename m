Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B59F8ABC380
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 18:04:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41CE810E427;
	Mon, 19 May 2025 16:04:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BqUbHqTs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5781510E409
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:04:23 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9I1GT016028
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:04:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=jxWvAcx+btlkTvxlgLONDQ
 zMycdb0G68/297niKyl+0=; b=BqUbHqTs1etyPg6RKYcG8uGaoLxLEnRo+N/J9q
 URHkmWZ/cOhSEM5QJASY+RGjxNsWKbFeKSupZ2wGMJdZqPqmdkenMiGfdGgbSnBG
 k1P3+6GAJCENFCdu6e7ckbHdJ76grz7/4qOjL3EXYtXh57QNhH3VvsYY8kG+Ot7Q
 GkpQ3Km6oJ1ZXgBbdPBcgIJp/xTRW2JZtbOUsy+Aa8M/6eUr9WrsK/Jklvekzh0c
 blxOgRBbo3o/Qgdwud4MwTVUNLO+oLsWgDE40f01S+PIESmXeXb2xp+XHAapIKCv
 h+gnxDUCuX6tDX30HcC9iB7SPVvEcHTKFI8WRU3tx0urccwg==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjnymxp4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:04:17 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id
 46e09a7af769-731bf641372so5276779a34.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 09:04:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747670656; x=1748275456;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jxWvAcx+btlkTvxlgLONDQzMycdb0G68/297niKyl+0=;
 b=iLAW6Pzd7hgL1+hOikEhAxFEEeJNo4KAOHbaAAcImRtLgEp+f7eC70rFmAvLQN8Lkx
 KeYRAkZk4kDAWJozMvf8A7/S3N+TvYOiQZD49JGM4JaxasAnCV646irPbE6yf3G7rcWU
 tXMCjZ+2vTRh0USJncF56zX176eqVYCZKRluUKZ/FCAYsTWFy0cP6wcZ8YsZlOElFuWV
 oqQMkQyCLM9BsJF0leA+y7ZJUHi/yO5Fx3Sqsw1s4LI+0ssYg0ucT9EO2XpxAsTXIUL2
 nuAbrFA246lrUmKbgnR7Voo1ekw55cX4GOBm4FW6xKvhD4lkK0zhldpBuZHaN+/WoWBi
 +A7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNUY11pMrxgcIb+yORe/BkfzcnFtTEdz9mfLaNhJMRqXuKBUY/p628sNQKqLCtERC+PsRiX54AnZY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIf4s28PoQKcVRPZjGfQ8sZEWICKeSwIg++36EDzuc7tUb65Pf
 pDEmka17cE3FK/bsySCceld7S9NQWaoIzXrFEeY7ixJnmW1YOD8W0UzPdPH36Ybq22QZ5H0U4BY
 nMRzo9UOceiij0a6P/3JEVV/uvFC+mN6L3OcYFerwv/GnV+APKa7/hjuA77h7qsxywGGKDXM=
X-Gm-Gg: ASbGnct+BVsCSmpdu/uckNOoK7Rvz4+/OyKeV0/5ACoAtdZjjcdgUAmPi4Ka0c0aFYA
 xHejfaNjomamZ3gi9WVGx2Zx6mFNdUPuGz/W1hQejbMu1rlq+wdHYyGYN9/wYUuhXb0e+XmsqGt
 08r3cItfw/kXjsblNeKOEJHTBIsS1BC10N/GLLLlq+fa3+c95uE3ft+L27xnIPS28Foy5Jt1VDa
 cuENN1Nd/Bchi4Pj9PwdrLZxXuRxJYmtpAfogtnOuiK/OVkglR9D3x406jRauS2y/KFhSlE7p65
 ZwDMqi2pCuVRRM7hFDVpNhF2Ys6V5g51KvWYa3+QikE/rKCd3H7M84FCAJjLp9niSnphrYUaYnL
 /YbWNZXAjRZ5qJM8or80NpIS2
X-Received: by 2002:a05:6808:6b97:b0:401:e5fc:e726 with SMTP id
 5614622812f47-404d88898b3mr8551965b6e.31.1747670656229; 
 Mon, 19 May 2025 09:04:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyFGZpmlXywRLZ1++pjBqVEBauvf55pcbHXxBAFTvleGfzMF/V0y74nyr1VHNLJveGo86+lQ==
X-Received: by 2002:a05:6808:6b97:b0:401:e5fc:e726 with SMTP id
 5614622812f47-404d88898b3mr8551925b6e.31.1747670655849; 
 Mon, 19 May 2025 09:04:15 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.04.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 09:04:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 00/30] drm/msm/dpu: rework HW block feature handling
Date: Mon, 19 May 2025 19:04:02 +0300
Message-Id: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHNWK2gC/4XNSw6CMBCA4auYri3pA0pxxT2Mi6GdahOl2ALRE
 O5u1bgjcTPJP8l8s5CE0WMih91CIs4++dDnKPc7Yi7Qn5F6m5sIJkouuKR2mKiNYaAOYZwiJlo
 rJq2RiFw3JN8NEZ1/fMzjKffFpzHE5+fFzN/bn1ZuaDOnjDZaO6aUMF2N7dX3EEMR4pm8uVn8i
 IqVYpMQmWDQgFJQdxJEG1Iq7hNcTbjdijy+kPwLyQwZCwY0t7JSbgNa1/UFCNs4ekUBAAA=
X-Change-ID: 20241213-dpu-drop-features-7603dc3ee189
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6421;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=uJMKq0JLE1bARBxJ7zLLvunqVZ02tC4rp/yup9kp3DE=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ4Z2WOX6zet01+xxy4yZKhm7snvxqZLZ2X9Pn+J8/t3Hr
 VNoreWmTkZjFgZGLgZZMUUWn4KWqTGbksM+7JhaDzOIlQlkCgMXpwBchIH9N4uf/L5n5gt+qZ42
 Ov764nuZD0x/baMttrkvCmfhepH75XjZ8j+iP4/Obeh48CnIPqGGRX1m80vZ/e9qpfd/M4xskIm
 bJpbwfN3Zoy6T2KJ+HRXZ9kT8J+tlro/FGs4yYmo5LwSYHvhd4DvXYHNhukyKopJo0KaLlXvTK+
 4GrFwww3yOIz/Th3p2sSTd1K6QN6szgwL21uc8uxt2fdJSM7cFTz2vs6nyz/zYemrLvFoN5UUPk
 t+LecR965/2te7mjufrAttLNNb3vrc6aWa874lU2MN0ph2/yw6KvSztZvm5h0fJ9E/p1fb7heay
 llIvTsgtkpLuP+ZpI2Who5Vk9suSs/Nmk0Tn5JMWQoExAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfX+Mij/Aao/QJL
 oqFGSBKJ7HjgwBfS6RV+zreLqPt8Mblg04nP9YhoK4LRRlK6FYXCXdxtxAWAtN9L9PLyIAL4c6U
 143a8YMPzUU/naY/XdlC58kC0aumPkEW7Q3TU/jITmpHTgcUy/RYVD4ftWhJjlDSW6ATcZKBEyp
 R4qUbRLJf4AvVW3Tf24KpcUBbrzb+Ds0d8dg7xBH3QGDex8gTledrk31NUUr+YuqIjy5cASRVCT
 HjkxyYChGfj1Ja6MwFwLTSOVhfdNH+6u4iH1twebbFMH7EVg/+aXtQC5j5lq3/3BIxUGX7mIWj9
 bknHl6OKQt9fnnYxTTD21CRH/guKFvjAT7hBi8rB7OKkL6oI14Gtl1zuUF6jpcVE/Nb0KbJ+mBz
 9ZaSaZyTvkkSCmtWLIlIgNzfiwOX2gF3/4dXTByQCKKufu/SvADzu5JUZNwaxtGFREqbRWM3
X-Authority-Analysis: v=2.4 cv=Z9XsHGRA c=1 sm=1 tr=0 ts=682b5681 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=t8tNeZB39Io7CcBQPAcA:9 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: EmMpXcN9ARZx1l67AoWiR4y7sbpCHDeB
X-Proofpoint-ORIG-GUID: EmMpXcN9ARZx1l67AoWiR4y7sbpCHDeB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190150
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
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   2 +-
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
 52 files changed, 256 insertions(+), 813 deletions(-)
---
base-commit: de63bbeb5af60172f1dd4d45bdc897816753fa69
change-id: 20241213-dpu-drop-features-7603dc3ee189

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

