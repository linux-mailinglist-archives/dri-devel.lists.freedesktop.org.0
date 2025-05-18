Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED5DABAFE8
	for <lists+dri-devel@lfdr.de>; Sun, 18 May 2025 13:21:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3FD110E2C7;
	Sun, 18 May 2025 11:21:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iCrG3qaC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C116910E074
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 11:21:41 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I7LlN1018103
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 11:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=DtMbpHsYyq8IxkCCqitMrf
 IcdqaVbs7kiHyoXi5G2h0=; b=iCrG3qaCWp5lTftu1QYwcQuzyKhSWdPWLS9Glr
 Zy2XGM8kjCHxuog23ACDH7WItUs2N4cRNZcn+t/Nl0dL+KReYXce22iBJ5JdBtxh
 uEtbGzO2PpRKbyVwQO7RuudhaItxk6oHtt8D977A6m7R96xUgdGSPHEjE2fYmcI/
 0tJJ60CY61jfBhlj+PbjRoNKFRyd3KZCOjhjed1Np2GM/vJX8rNk+2263PGK0Gjo
 TA/7bbOsp4BSs9jFDh194HME8PMjWw912AU0KhzL7dWtLAx9jnFVIE5+B9DQdjjF
 w4SUUTk1TwQH7K27zuiyZhYNe/pOqK8K2Db/MDPUNqm0cVuQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4swc5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 11:21:40 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6f2b0a75decso98270756d6.2
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 04:21:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747567298; x=1748172098;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DtMbpHsYyq8IxkCCqitMrfIcdqaVbs7kiHyoXi5G2h0=;
 b=eP53kiXPAnd4Q3rPQimNncCtdHx7di/gKu+vrfRleRz/xvC6CWzNWN9jQbPTl9rJdH
 z48DNzz3O3B1wReEHBPXOnIZDmAVOVmLtp4x11k64TBypZZ9qIFYJ6BZbu2K5ZFD+rpD
 k0rWu9IS2xVs9JbgAs0qmCanrmuikVAxm0HE7Yroz+fg8teY4DqQkCR1IeIYlWa6rBge
 vk5rKDd49hsUiaguQyON1qmzGTumi6E2F4fWQVodjqf8Bt55wzt/QWliJzz3qJ4PJ2g5
 sUQpLikOVRMlHw6uMYQtiiE92GiAgI3JdCgwrRiu65/JQPaCH5oZgvnje3/v0wVgUiLx
 CwMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvdcuTrEVPTXfc7Ogy4Q0JX+E3rW3lUg1tRwyTVw20BHTmJhNSWTKG9HrLP1qlPGrkxeXblf6xQyE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXfvvaRSNeKLsW0KAiQCjNM8etCwqIw4mVf/buCOXkKcMzEjKp
 cpNaI1Y3xUKXJXZKX8iM2bSMTU3pc0aobLLkPmzpC/RnyU3guhFLoaSsKkCMYS+Ukg3eJqJiE15
 kEIwNifxrSU+h2bkmbtzKsnC5TgwXucFxAHz26lBtIGrniiUa+cpdA2DPrXoZUxPi68nWBCus+9
 qF+rk=
X-Gm-Gg: ASbGncvVxKqCUX3Jt+7Knedi8FLioXhWO9JDtIeiYv46v/MidlEG2hKFLomvjcnH9iR
 /XYbmL3rPtQxeNUzbjHb676Gc6DRLeqwntoVaTUnkQFxTKhlDBDm2mPEgoLjWEX+X/+6F2Pi5Cq
 Y4xqmnklIRmuL8JsyhlHKb3tQG05RV4HJphG10yvbkLrkxwBsgm42Aq5MVT5EPhGf6P3mUPRcqV
 ISdf2uXymWP1PY4yPS0bQ/bOClXTfGEMBGJuW8EIwMp8Bx2FLBV5kehyMXROVBkU3893TqtEYrH
 ppD9hByz4GKtVTDTSZQsXWkgXF4xsVEjr21nwJXKBnlBAECkS9EIxy22GemoY6NxepQI5Kogt3t
 5RA4rmruTkHimr9PrkX8wT+PH
X-Received: by 2002:a05:6214:5096:b0:6f4:f123:a97a with SMTP id
 6a1803df08f44-6f8b2c65bd5mr150316286d6.15.1747567298545; 
 Sun, 18 May 2025 04:21:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqLiWIyECuX8rlBPulhzi6aemt00MCcnN0evfEEcuiCXQFgv8XdaQqt/ZFHIXho5+QSjC9UQ==
X-Received: by 2002:a05:6214:5096:b0:6f4:f123:a97a with SMTP id
 6a1803df08f44-6f8b2c65bd5mr150315886d6.15.1747567298220; 
 Sun, 18 May 2025 04:21:38 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328084ca34csm14186881fa.30.2025.05.18.04.21.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 04:21:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v6 00/11] drm/msm/dp: perform misc cleanups
Date: Sun, 18 May 2025 14:21:33 +0300
Message-Id: <20250518-fd-dp-audio-fixup-v6-0-2f0ec3ec000d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL3CKWgC/23Oy27DIBAF0F+JWJdqhpchq/5H1QXmkSBVJsKN1
 Sryv3fiTV2ZDeLOiMN9sDm1kmZ2Pj1YS0uZS50omJcTC1c/XRIvkTITIBQY1DxHHm/c32OpPJf
 vO92dsFYm75ICRu9uLdFiM98/KF/L/FXbz/bFgs/ppiGC7WgLcuAKgk1pNBCyfvssk2/1tbYLe
 3KL+CPo6BGCiOjQDlTKRB8PhNwR2CUkETBiMDoNcfTyQKg9YXqEIiLbiM5gyELkA6F3hOi20ET
 IATI45UTI5h+xrusvACBS3b8BAAA=
X-Change-ID: 20240615-fd-dp-audio-fixup-a92883ea9e40
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3213;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9J4rqW2pXqEVwcZ4RKNBv+n/cNEsrz1nBVyzy6c5Bhg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoKcK/oSgN7yXgFO4+3bkCl2DkBasInwY4hcrZO
 CnT1iV4MDmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCnCvwAKCRCLPIo+Aiko
 1SB3B/wKXaCQqwfxs9wTPNniKTi3kHMBEEVeEZgZ38YEdK/Zx9TOyfHago/j5ok1ahPZG6zNFX9
 d44wHDAUXXquUgNagCXa9mqrIZkgOMss4XMHI/b2QpKIHtVZJ7/omvpk9DTkZrCjBQtx4MjEeoc
 9F19SfDKKcnySqvY2hi1PNnFrdMmnR07QexY7YCwCs96kIGdu2vET/4bgolwb4I8f3gE3DiTOac
 s0+P4yU4OFqEdi8Du9PvY5XzdwP/lDP6OeJSJeUryV/zXjCbUzP9UFMkgjqZkuqYwbkChkJVUhl
 ii5ynWcFLdWaIw3H+zBGNWY3Y914LbQhMc1uWtkKxvXUJAvX
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=6829c2c4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=625LCR9qH_oaHj1pw7oA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: f-796l-QkI0WlYSxQYcqme1ZrRjDWO3n
X-Proofpoint-GUID: f-796l-QkI0WlYSxQYcqme1ZrRjDWO3n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwOCBTYWx0ZWRfX5kX2/tUrggOp
 yrUSgJ/tw5ZiBR8wbzqKOQ67Dry3bpRMJ6OeWFhnSNL9Yy5QnQ5qn0qtXvRAGhePz0wuiK7gNyP
 0WRqb60WWFrGGrSGS0sRby6NQBJBh8iVrAAHbNIt3prOMYVHY+REX86SYBANATGEpuMSxzp2jrk
 kbFGEyQzfnFz64ZT5c6zxyLHBSJmq9dzWP4kA9A6j89DFslTMr19dUY5mHD7NsTEZrLlAidHD29
 SuujSdS1UVx89oOTuoZpmC925t8pL8739hXLZHklcqpvMWUSdvh93WtwlaB3nNmYajZy+1CLoYa
 +UHH1/6o5escvewvlvBSQmTKQ15oElZf2SxdkuGEA3fo74Nxbqatzf9zc5uwpZljA5j9DVBK/4X
 nfnUk2xCUbnBWR6RbvMVrW7E+rX4GaWSk6kUPQTKj+T8y7aoGCa3HwHsh4A7xTOUtr7Kr/vz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=753 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180108
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

Rework most of the register programming functions to be local to the
calling module rather than accessing everything through huge dp_catalog
monster.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v6:
- Rebased on top of the linux-next
- Link to v5: https://lore.kernel.org/r/20241222-fd-dp-audio-fixup-v5-0-370f09492cf6@linaro.org

Changes in v5:
- Dropped applied patches.
- Removed MMSS_DP_DSC_DTO programming from msm_dp_catalog_ctrl_config_msa() (Abhinav)
- Pulled the hw_revision patch closer to the top of the series (Abhinav)
- Link to v4: https://lore.kernel.org/r/20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org

Changes in v4:
- Rebased on top of linux-next + msm-fixes, dropping picked up patches
  (Abhinav)
- Reordered patches to move dp_audio patches earlier (Abhinav).
- Added several more patches, dropping dp_catalog.c completely.
- Link to v3: https://lore.kernel.org/r/20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org

Changes in v3:
- Fixed falce -> false typo (Abhinav)
- Dropped wrong c&p comment from msm_dp_read_p0() (Stephen)
- Changed msm_dp_aux_clear_hw_interrupts() to return void (Stephen)
- Fixed most of line length warnings
- Link to v2: https://lore.kernel.org/r/20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org

Changes in v2:
- Set safe_to_exit_level before printing it (LKP)
- Keep TPG-related functions (Abhinav)
- Link to v1: https://lore.kernel.org/r/20241108-fd-dp-audio-fixup-v1-0-40c8eeb60cf5@linaro.org

---
Dmitry Baryshkov (11):
      drm/msm/dp: split MMSS_DP_DSC_DTO register write to a separate function
      drm/msm/dp: read hw revision only once
      drm/msm/dp: pull I/O data out of msm_dp_catalog_private()
      drm/msm/dp: move I/O functions to global header
      drm/msm/dp: move/inline AUX register functions
      drm/msm/dp: move/inline panel related functions
      drm/msm/dp: move/inline audio related functions
      drm/msm/dp: move/inline ctrl register functions
      drm/msm/dp: move more AUX functions to dp_aux.c
      drm/msm/dp: move interrupt handling to dp_ctrl
      drm/msm/dp: drop the msm_dp_catalog module

 drivers/gpu/drm/msm/Makefile        |    1 -
 drivers/gpu/drm/msm/dp/dp_audio.c   |  130 +++-
 drivers/gpu/drm/msm/dp/dp_audio.h   |    7 +-
 drivers/gpu/drm/msm/dp/dp_aux.c     |  216 +++++-
 drivers/gpu/drm/msm/dp/dp_aux.h     |   15 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c | 1298 -----------------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  113 ---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  607 ++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |   19 +-
 drivers/gpu/drm/msm/dp/dp_debug.c   |    1 -
 drivers/gpu/drm/msm/dp/dp_display.c |  150 +++-
 drivers/gpu/drm/msm/dp/dp_link.c    |    1 +
 drivers/gpu/drm/msm/dp/dp_panel.c   |  256 ++++++-
 drivers/gpu/drm/msm/dp/dp_panel.h   |   13 +-
 drivers/gpu/drm/msm/dp/dp_reg.h     |   19 +
 15 files changed, 1244 insertions(+), 1602 deletions(-)
---
base-commit: 087b2daf4fffc7cf4eb754e1f0b07464ee376851
change-id: 20240615-fd-dp-audio-fixup-a92883ea9e40

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

