Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3CFA999F8
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 23:10:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC24510E256;
	Wed, 23 Apr 2025 21:10:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cuqlrtKY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F4F10E256
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 21:10:12 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NApUaU014055
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 21:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=Gaa4TeturWzyIFwu8cwVqF
 43gCRMKyHks46p68aqEw4=; b=cuqlrtKYH/23nh7T5GFBBLqsmjkCFRcHDPY+ou
 DbBYYb8UNSI61ec6qhe3SEa+XPPUxAXGB5YGvbJKLdq+NVd5oMYUGnu3EBNPnMUB
 Ft82kq7KZ4GXfASALFUoo4RYPD8GgvHMDaDZLarKtRt1yvl0aGKEzjDOHskR0DFT
 RlLpUYGfXSl2mPkS/i+8W2LUZ8zqQ/pU2+Onkxbj3AjAf1t6xY9W/T6sd9UHdaCy
 CFEjiBUbmcUXU6rWDIjDJLCywivdQVNNnZvlSCrXHoWni+Bhbm/E3AECOzPIb4lH
 CnxOsiRji2GC/gKK2u+xJo8BeVyeMm9UniCbQWtvAiKNbLKQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3bcwk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 21:10:10 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6ecfbdaaee3so5449066d6.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 14:10:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745442609; x=1746047409;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Gaa4TeturWzyIFwu8cwVqF43gCRMKyHks46p68aqEw4=;
 b=b7K4PLK52s1FITw7QmRSm5/GgBPUYEQhmUxbiygHfllvIDMuww/+BzIWchEnxgYfmf
 oYnApxg5TGlPm14pRhhS4+HYGigW/KKeDp9PsRXOKQHj1Y5EgRAMX1QRvp/BC73j6+bw
 Myp4ZuqxINozDWlQs7ii5CMr8si2xiTmI4AaQvZ7KsW4CNMPv9csuMF6q5ue+FnCRjNX
 1fTqhPIE8AEoBzQP8WOhnrZSigBhxb1aOeaOOQhbscmm5vvxA/3/ayHmm4LCE44F014G
 MZJwaMVdjtRLuNiI1Omh5ysGf92Q5SeXMwSa1t1ndHaGCHZ1L/DL1GgTz2vZMxWnFEJ/
 2/ow==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5xYMqTKJbN/jRlMFIPTAklh49HflX/JFvm4MMMqITzC9tHAEfZS178LgMshRHaaeXguWScQCXdXM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzA9sm04v8YMRZt70jTSrgdc54h+RlwTYFrXcmOFy+8vqzv/5DG
 xgXikdBGsBC+Hkz4w1wXvjU6o+QlFiwScNaNGNWNhDACbr7bxF+OaqGXwv0DuU/bylFGUZbmV2+
 LbGnJ712zQ39CrIuD82tmvGtKVtwkwiYRtFueB4a45b1C8ZDqFrAn6+VIZ86cRr1VQUY=
X-Gm-Gg: ASbGncuchCR7ZlMJdLIiFS1KCNDhio6Qy1GVvUnf0pLKM87gSlLn2ps2A19Jh1ibFlf
 fYcxGP1nJhHqPfXswVJnDG2fFSVhHM2oFCDJXHvJtZlLzth5+QuOOanKFMhV9xXuLi9VphPutah
 5SrEw/TTTFwn1Y/QcN35a27V34VdDBcdftn1jr/rH5khicjZQwS5KlBGAktbIFQ/xuhZprNp45B
 GlnId0WW/t2mgF3qmOlHEDfmr2ybnPuh2foxcU9tytBSlBgKqCVTS7U9N5bpGpXAQprKxvW/6SH
 K7zHiLwmeb2T0hyMSSjPUo6+mtWAvLcUmQNVmJ0IMqMqaAgeIOg4c82VYNSJ5eOcK+UV06W05l0
 M7O/o374t9p4M1BUMik+drJcI
X-Received: by 2002:ad4:596f:0:b0:6e8:e828:820d with SMTP id
 6a1803df08f44-6f4bfc739aamr4372216d6.36.1745442609368; 
 Wed, 23 Apr 2025 14:10:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGE7Bn4p+WATg0q+ICMoXucgKsyTUfj4NHoRs66BP16GFpVxFmXOgfq2cYmjSrspq1UUkzsmA==
X-Received: by 2002:ad4:596f:0:b0:6e8:e828:820d with SMTP id
 6a1803df08f44-6f4bfc739aamr4371446d6.36.1745442608764; 
 Wed, 23 Apr 2025 14:10:08 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.10.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 14:10:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 00/33] drm/msm/dpu: rework HW block feature handling
Date: Thu, 24 Apr 2025 00:09:56 +0300
Message-Id: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACVXCWgC/22NywqDMBBFf0Vm3SlJFB9d+R/FhU0mOlCMTFRax
 H9vKnTX5Tlwz90hkjBFuGU7CG0cOUwJzCUDO/bTQMguMRhlCm10jm5e0UmY0VO/rEIRq1LlzuZ
 Eum4g7WYhz6+zee8SjxyXIO/zYtNf+6sVf2qbRoVNXXtVlsY+KmqfPPUSrkEG6I7j+AD4UEQQs
 wAAAA==
X-Change-ID: 20241213-dpu-drop-features-7603dc3ee189
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5988;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jeV2CdgCXKP9mX1CiT3h3t3hCkQmPqAG4j55H1iiq88=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCVcpQVMxF5tzqEX4RsauRdDfAlBXbQKCMrT++
 r+hXfeMEmeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAlXKQAKCRCLPIo+Aiko
 1WJUCACUoaX9jE40MmdEgcQfFQS6lB0hE8tvm13PGuQaKaHwc3Uubm3h9/q/WUOyOtc606kngbC
 sS9pkDjrDMINtt2uKgVSWYuxqXKP2Q379LOKbWFtz3mhtJ3uZSTj91TTVDsZTWZv1wIY5wFyzS+
 cGc09rOw67JL6AzO6iEa6h3uX28yFmXCjh/t3heXaiqv5aZjIRioS297XyJ8iStAZdEP3qfGoss
 j7xQJuupJurtH6CG5KgkuTPVNUS3S2jEwf5mz8hp7AHVCMujkiuyg6nPBXtLzPczzLQdo0zNwJg
 j8z9csh6A7fNSnQudHx1RsEINFF2qXJsT7IXzA22W1hqIlnU
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0MyBTYWx0ZWRfX4WUZxLVERt00
 UZi6++G+rFDoSJid0K6c3+kGDShaEYN9y1Dwm0NWCLLgXIqwT7bMyz+HiIH4od/a2UNk5Ldirlp
 Ua47OCuIndq3N57UoiDCnznU+qVA30028no0d0qsbK3i28icj2irduahXtktCyxPJVdITz+Z0HV
 ak60HbiBLrMS0yulnammV6HFltv89anDQBGeplNHIRRf6J3COmYX99g1MTeSHV30lJemW8aKxh/
 5QF/8tqkErZno6sLYwR5EkK63PiI4835adG86aviwElZMiLD3ILOUXb7J4kuQE7deEr3IRa7bQx
 1LdIHUCv2lStL0I7W+o3KCUZCp68xIbqFEn/+UtZXLh800n/lSBf87M7dZgfaT9Z25WPmcgkaXm
 a0VSJoqYJHySEbA3GjspzK5k+S49rz0nP2Bwr3okPVkBe+1XAVwd5VeipCmFQ9+yjIusss78
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=68095732 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=dC62eGL372UhZDOq83QA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Abux49ZHMynuYXcXGeeSgr0uAiJlF4qW
X-Proofpoint-GUID: Abux49ZHMynuYXcXGeeSgr0uAiJlF4qW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230143
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Rebased on top of the current msm-next
- Link to v1: https://lore.kernel.org/r/20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org

---
Dmitry Baryshkov (33):
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
      drm/msm/dpu: get rid of DPU_MIXER_SOURCESPLIT
      drm/msm/dpu: get rid of DPU_DSC_NATIVE_42x_EN
      drm/msm/dpu: get rid of DPU_CTL_SPLIT_DISPLAY
      drm/msm/dpu: move features out of the DPU_HW_BLK_INFO

 .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |  53 +++-----
 .../drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h   |   4 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h   |   3 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   |   4 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    |  15 +--
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |  19 +--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |  19 +--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |  12 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |  21 +---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h |  11 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |  43 ++-----
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |  45 ++-----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h |  31 ++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h |  19 +--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h |  16 +--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |  42 ++-----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  14 +--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |   5 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h |  16 +--
 .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |   5 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h |   6 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  44 ++-----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  22 +---
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |  50 ++------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  47 ++------
 .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    |  53 ++------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  47 ++------
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   |  52 ++------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   2 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   3 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |   7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  51 +-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     | 134 ++-------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         | 108 ++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c         |  21 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c     |   7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c        |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |  14 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          |  28 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h          |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c     |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |  11 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |  17 ++-
 51 files changed, 304 insertions(+), 864 deletions(-)
---
base-commit: 6ac908f24cd7ddae52c496bbc888e97ee7b033ac
change-id: 20241213-dpu-drop-features-7603dc3ee189

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

