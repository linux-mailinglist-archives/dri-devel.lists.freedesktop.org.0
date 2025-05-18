Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E227FABAF7F
	for <lists+dri-devel@lfdr.de>; Sun, 18 May 2025 12:55:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C55410E2C0;
	Sun, 18 May 2025 10:55:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q70Rr1RB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB7B410E1DE
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 10:55:39 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54IAnlx9012486
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 10:55:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Eic/j3udXgGjDEe50aB6TDhnyHwei1FJfflAUaczOYo=; b=Q70Rr1RBQa65ev2R
 cRiWVvDHtOl2T1t3EJ6AV30Rd2Spxsq1gzQsEDucaf/6pkrPdD9vWMuT68qrIfN8
 wfvkpq1aTrk6nkh3Ri2HdHq780OI4K3aY1dDwD6Fhe1hrIracaELUp3nHrC5X2NG
 TUeqFJfdGyKPT748BNxuE5JG+CZhGFaERXXpikcLqG8rr90Lzbxt2lrxRLZ2Lc8f
 iPjE9lpAgVRJylq+f8F3qnpnEV1Vg4ZAROnD/fCHKutiAxMK4eyyzdhPx8vrcvhn
 wpxLGHdmoc1k50PC3ZyjtV2mwfWbXkrPga6MbXWoDNVORo68Q4O6rpPJqiHRTsqh
 pas8NA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjnyhvrk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 10:55:38 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6f8b14d49a4so28464886d6.2
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 03:55:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747565737; x=1748170537;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Eic/j3udXgGjDEe50aB6TDhnyHwei1FJfflAUaczOYo=;
 b=UjvIqVm/WYl1CXMAg7UrdBxKA2it0b4y7iC+fgyfFZkfLw7Gh2tyuydDU4kmaE/8DK
 gUhOVUrjT9NVL+rWWmHCGYHixpCHodx88MAbKxC/jmFhEtmqN2A5zMDODRzx/1rLrngi
 Tcl2d8lyckD3tyq/erY5R0lBTJoB6gf/VaFl4GVECtNEgmYf9vguJEYTPMEVzykedxzN
 mKudcAwkglPMU+mnP6uOgWJmAU8laiT/uTeOcP1oX5l/8zGh2yHmbS72sosP2PbBhkaE
 nJU2VMK32z9TojT0JgXjllvioXrcYhe15IPtFe0lYW7qXJgyy0OXZ0BlbcqwHfZofl0T
 +MDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLopNsIliCwt5/E5uFdusrcC7k7z8SofdprWtisxEB2Gth+8aFa8X1g79+GYmPIZfxFQ9cN1CkXig=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywb5heNjjV8iwaaKDMpUE301EqqPOllxSXyod/U0MtRXVNU3HV5
 eY99WmD7v/UZlysJF+CPQ6N7PW1JDz7bkKfYk4zOzyWRAiaeW5acT4h1r7TPJfktcMaT7DSuNs7
 lX2c4TyI+pFQkuD9O3OzaEh1SbRHjdWatYswuEsWtF6hGRDcT/6n5i4IiVQFOGbKSz45p0gQ=
X-Gm-Gg: ASbGncsNR8Y/Uxks2/Jne73aNRKyH4CAZmbRFmKZ6iDkIT5lJ6ijbODv0dHeBhLoZP6
 R6QHlN971REg+y/RkMPLEwN+QjkHLprNV/k4Xbpa01QvfcFfdvOGGyf7VCw/Opdf8MH1aDoPhkQ
 W47eg6nbfsUCqwdN0Pp2Q3eK9oYWhqbYOJqo1xiJyVP3EUJ8vmNsrMY8l/hLPwznLRkP4mfSRbB
 1bZfesOM9a2YM3GiVfNiSAmTBUPc1esXoviwgHlYWLztwn+bPYwGWT2BGIaPCpdHEYa0d/T42Ij
 J9xtzed7b+LbapNwGKK75E7s6E3qWd6qz8uS+JKxLhnH52aQUQzwPQMJUwSwq7HO/8BCMzrLyLM
 lW562/0LhS1ICEbDypBzwzN7w
X-Received: by 2002:a0c:fc50:0:b0:6f8:bfbf:5d49 with SMTP id
 6a1803df08f44-6f8bfbf5e85mr94272776d6.5.1747565736645; 
 Sun, 18 May 2025 03:55:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGY7+ORjwD4vUwzc9XCroeHBWmPc13T0Kc0uPLyjlzWGrGPHsjGFlHJUtNmn6HQETsO2Fntiw==
X-Received: by 2002:a0c:fc50:0:b0:6f8:bfbf:5d49 with SMTP id
 6a1803df08f44-6f8bfbf5e85mr94272536d6.5.1747565736083; 
 Sun, 18 May 2025 03:55:36 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085cf8ccsm14314451fa.99.2025.05.18.03.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 03:55:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 18 May 2025 13:55:24 +0300
Subject: [PATCH v3 06/11] drm/msm: make it possible to disable KMS-related
 code.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-msm-gpu-split-v3-6-0e91e8e77023@oss.qualcomm.com>
References: <20250518-msm-gpu-split-v3-0-0e91e8e77023@oss.qualcomm.com>
In-Reply-To: <20250518-msm-gpu-split-v3-0-0e91e8e77023@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13609;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/CfZ3JVdieLRawFuuuWtMdMn25crFvhgWl3NQ/L97lI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoKbyavhiFLC946rCZkGhVU+aGkzuuBlMB1jk4D
 JdThGi9UPSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCm8mgAKCRCLPIo+Aiko
 1ecvB/4qTLgcq6PTOajxXULjg0lBSGg1KV8luXrkM6yml3JVOmFTs/rJcoat6MWsxkdKQjlyxaa
 5LpDKoGQseXkgplGC67W4mSZWEVkizrmp36AqHP/B3sFsBKE7Bra1WImEpOB4j5yZ17UmbVAgUl
 s1oEZFaDZSDQ28c/X7bRF+CYABa4bbj4xrrHyd28QHY1tvLD3m6WI0Lq1gETRDllJOj+ao6n/UN
 DFco2ibkJs4O2W0eN9QHt8ZUercSBcA4FK75Tkf04VFN6BWM+Ta4pAKMIGw+P4PkMElfXOkKTC7
 iniUV5RVe/cggUOa4sv0gd3420/TLEDZ0C/bEdT3Xbi8uEaf
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwNCBTYWx0ZWRfX/SCCjuz0jY7m
 qLgfe0+6HuSB1Su8EzRzPNtxgp18Su8+NvW9+dm8V7aWVJLd6nMiRl4umZGPkOCOC9O6ky9UZpv
 ROY1n5W5g1tEMohU5Z32rda8j3CJ0LSvQgsLMXMF3oxeyNx+YDT3EO3FpciA1fHk06MpX5bj74X
 8wzU6WXWB0an8xdz7CFtJJ/HVrzQVVXJorhSmZahGH9DUGIlVnqRy6ND6RJpFE1/FLhDjZfwFqy
 cGmScQoWA2ANcp198LL6yxx3fa6fgD3GLUMC6g32IZSNatoyzlcSQ/tkCBSbOd3L/l4vriMMWGY
 +ltLTRq3SC0DZ5ldPe9ccKaYlTf0EJWPdSXzsRIUQ6k61BdR8A8ojozfC+/hSdXhSMTQ2zW47kv
 kxMw2bqMI/nwvwHpb6d0t0HNFMMn69hTuo+bFlWxrvDGrsHwoTQ8B/Rz4i+RiZ7aH7HrCSlZ
X-Authority-Analysis: v=2.4 cv=Z9XsHGRA c=1 sm=1 tr=0 ts=6829bcaa cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=HLjn-ILLvqAx_VdQRNoA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: 9HfNmDt4vtaeB0MB4Ug2HsR6tT2huNSv
X-Proofpoint-ORIG-GUID: 9HfNmDt4vtaeB0MB4Ug2HsR6tT2huNSv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180104
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

If the Adreno device is used in a headless mode, there is no need to
build all KMS components. Build corresponding parts conditionally, only
selecting them if modeset support is actually required.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Kconfig              | 14 +++++
 drivers/gpu/drm/msm/Makefile             | 19 +++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c |  4 +-
 drivers/gpu/drm/msm/dp/dp_debug.c        |  4 ++
 drivers/gpu/drm/msm/msm_debugfs.c        | 92 ++++++++++++++++++--------------
 drivers/gpu/drm/msm/msm_drv.h            | 10 +---
 drivers/gpu/drm/msm/msm_kms.c            |  6 +--
 drivers/gpu/drm/msm/msm_kms.h            | 30 +++++++++++
 8 files changed, 117 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 7f127e2ae44292f8f5c7ff6a9251c3d7ec8c9f58..cada5832db3e894c9bae4c6b0c6d935dbf5d933f 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -66,6 +66,14 @@ config DRM_MSM_VALIDATE_XML
 	  Validate XML files with register definitions against rules-fd schema.
 	  This option is mostly targeting DRM MSM developers. If unsure, say N.
 
+config DRM_MSM_KMS
+	def_bool n
+	depends on DRM_MSM
+
+config DRM_MSM_KMS_FBDEV
+	def_bool DRM_FBDEV_EMULATION
+	depends on DRM_MSM_KMS
+
 config DRM_MSM_MDSS
 	bool
 	depends on DRM_MSM
@@ -74,6 +82,7 @@ config DRM_MSM_MDSS
 config DRM_MSM_MDP4
 	bool "Enable MDP4 support in MSM DRM driver"
 	depends on DRM_MSM
+	select DRM_MSM_KMS
 	default y
 	help
 	  Compile in support for the Mobile Display Processor v4 (MDP4) in
@@ -84,6 +93,7 @@ config DRM_MSM_MDP5
 	bool "Enable MDP5 support in MSM DRM driver"
 	depends on DRM_MSM
 	select DRM_MSM_MDSS
+	select DRM_MSM_KMS
 	default y
 	help
 	  Compile in support for the Mobile Display Processor v5 (MDP5) in
@@ -94,6 +104,7 @@ config DRM_MSM_DPU
 	bool "Enable DPU support in MSM DRM driver"
 	depends on DRM_MSM
 	select DRM_MSM_MDSS
+	select DRM_MSM_KMS
 	select DRM_DISPLAY_DSC_HELPER
 	default y
 	help
@@ -104,6 +115,7 @@ config DRM_MSM_DPU
 config DRM_MSM_DP
 	bool "Enable DisplayPort support in MSM DRM driver"
 	depends on DRM_MSM
+	depends on DRM_MSM_KMS
 	select DRM_DISPLAY_HDMI_AUDIO_HELPER
 	select RATIONAL
 	default y
@@ -115,6 +127,7 @@ config DRM_MSM_DP
 config DRM_MSM_DSI
 	bool "Enable DSI support in MSM DRM driver"
 	depends on DRM_MSM
+	depends on DRM_MSM_KMS
 	select DRM_PANEL
 	select DRM_MIPI_DSI
 	select DRM_DISPLAY_DSC_HELPER
@@ -170,6 +183,7 @@ config DRM_MSM_DSI_7NM_PHY
 config DRM_MSM_HDMI
 	bool "Enable HDMI support in MSM DRM driver"
 	depends on DRM_MSM
+	depends on DRM_MSM_KMS
 	default y
 	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_DISPLAY_HDMI_STATE_HELPER
diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 7a2ada6e2d74a902879e4f12a78ed475e5209ec2..7c4508f0e5c84914633f8f2d5ddd04bd10e4d189 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -100,18 +100,15 @@ msm-display-$(CONFIG_DRM_MSM_DPU) += \
 msm-display-$(CONFIG_DRM_MSM_MDSS) += \
 	msm_mdss.o \
 
-msm-display-y += \
+msm-display-$(CONFIG_DRM_MSM_KMS) += \
 	disp/mdp_format.o \
 	disp/mdp_kms.o \
 	disp/msm_disp_snapshot.o \
 	disp/msm_disp_snapshot_util.o \
 
 msm-y += \
-	msm_atomic.o \
-	msm_atomic_tracepoints.o \
 	msm_debugfs.o \
 	msm_drv.o \
-	msm_fb.o \
 	msm_fence.o \
 	msm_gem.o \
 	msm_gem_prime.o \
@@ -122,21 +119,24 @@ msm-y += \
 	msm_gpu_devfreq.o \
 	msm_io_utils.o \
 	msm_iommu.o \
-	msm_kms.o \
 	msm_perf.o \
 	msm_rd.o \
 	msm_ringbuffer.o \
 	msm_submitqueue.o \
 	msm_gpu_tracepoints.o \
 
-msm-$(CONFIG_DRM_FBDEV_EMULATION) += msm_fbdev.o
+msm-$(CONFIG_DRM_MSM_KMS) += \
+	msm_atomic.o \
+	msm_atomic_tracepoints.o \
+	msm_fb.o \
+	msm_kms.o \
 
-msm-display-$(CONFIG_DEBUG_FS) += \
-	dp/dp_debug.o
+msm-$(CONFIG_DRM_MSM_KMS_FBDEV) += msm_fbdev.o
 
 msm-display-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
 	dp/dp_catalog.o \
 	dp/dp_ctrl.o \
+	dp/dp_debug.o \
 	dp/dp_display.o \
 	dp/dp_drm.o \
 	dp/dp_link.o \
@@ -159,7 +159,8 @@ msm-display-$(CONFIG_DRM_MSM_DSI_14NM_PHY) += dsi/phy/dsi_phy_14nm.o
 msm-display-$(CONFIG_DRM_MSM_DSI_10NM_PHY) += dsi/phy/dsi_phy_10nm.o
 msm-display-$(CONFIG_DRM_MSM_DSI_7NM_PHY) += dsi/phy/dsi_phy_7nm.o
 
-msm-y += $(adreno-y) $(msm-display-y)
+msm-y += $(adreno-y)
+msm-$(CONFIG_DRM_MSM_KMS) += $(msm-display-y)
 
 obj-$(CONFIG_DRM_MSM)	+= msm.o
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 0714936d883523e5c53bfb42f932234db76c58db..08ea11d452f2ea93fba8bdcc487385433e81d224 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -709,7 +709,7 @@ void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event)
 	fevent->event = event;
 	fevent->crtc = crtc;
 	fevent->ts = ktime_get();
-	kthread_queue_work(priv->event_thread[crtc_id].worker, &fevent->work);
+	kthread_queue_work(priv->kms->event_thread[crtc_id].worker, &fevent->work);
 }
 
 /**
@@ -878,7 +878,7 @@ static void dpu_crtc_atomic_flush(struct drm_crtc *crtc,
 	dev = crtc->dev;
 	priv = dev->dev_private;
 
-	if (crtc->index >= ARRAY_SIZE(priv->event_thread)) {
+	if (crtc->index >= ARRAY_SIZE(priv->kms->event_thread)) {
 		DPU_ERROR("invalid crtc index[%d]\n", crtc->index);
 		return;
 	}
diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
index 22fd946ee201397b72b43c8499714139deb7ba82..7835d93015b31a69aac824ca04dc65b374546e5c 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.c
+++ b/drivers/gpu/drm/msm/dp/dp_debug.c
@@ -5,6 +5,8 @@
 
 #define pr_fmt(fmt)"[drm-dp] %s: " fmt, __func__
 
+#ifdef CONFIG_DEBUG_FS
+
 #include <linux/debugfs.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_file.h>
@@ -235,3 +237,5 @@ int msm_dp_debug_init(struct device *dev, struct msm_dp_panel *panel,
 
 	return 0;
 }
+
+#endif
diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 7ab607252d183f78b99c3a8b878c949ed5f99fec..2b12f2851fadbc3c924827e11570352736869614 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -117,6 +117,36 @@ static const struct file_operations msm_gpu_fops = {
 	.release = msm_gpu_release,
 };
 
+#ifdef CONFIG_DRM_MSM_KMS
+static int msm_fb_show(struct seq_file *m, void *arg)
+{
+	struct drm_info_node *node = m->private;
+	struct drm_device *dev = node->minor->dev;
+	struct drm_framebuffer *fb, *fbdev_fb = NULL;
+
+	if (dev->fb_helper && dev->fb_helper->fb) {
+		seq_puts(m, "fbcon ");
+		fbdev_fb = dev->fb_helper->fb;
+		msm_framebuffer_describe(fbdev_fb, m);
+	}
+
+	mutex_lock(&dev->mode_config.fb_lock);
+	list_for_each_entry(fb, &dev->mode_config.fb_list, head) {
+		if (fb == fbdev_fb)
+			continue;
+
+		seq_puts(m, "user ");
+		msm_framebuffer_describe(fb, m);
+	}
+	mutex_unlock(&dev->mode_config.fb_lock);
+
+	return 0;
+}
+
+static struct drm_info_list msm_kms_debugfs_list[] = {
+		{ "fb", msm_fb_show },
+};
+
 /*
  * Display Snapshot:
  */
@@ -180,6 +210,27 @@ static const struct file_operations msm_kms_fops = {
 	.release = msm_kms_release,
 };
 
+static void msm_debugfs_kms_init(struct drm_minor *minor)
+{
+	struct drm_device *dev = minor->dev;
+	struct msm_drm_private *priv = dev->dev_private;
+
+	drm_debugfs_create_files(msm_kms_debugfs_list,
+				 ARRAY_SIZE(msm_kms_debugfs_list),
+				 minor->debugfs_root, minor);
+	debugfs_create_file("kms", 0400, minor->debugfs_root,
+			    dev, &msm_kms_fops);
+
+	if (priv->kms->funcs->debugfs_init)
+		priv->kms->funcs->debugfs_init(priv->kms, minor);
+
+}
+#else /* ! CONFIG_DRM_MSM_KMS */
+static void msm_debugfs_kms_init(struct drm_minor *minor)
+{
+}
+#endif
+
 /*
  * Other debugfs:
  */
@@ -238,40 +289,11 @@ static int msm_mm_show(struct seq_file *m, void *arg)
 	return 0;
 }
 
-static int msm_fb_show(struct seq_file *m, void *arg)
-{
-	struct drm_info_node *node = m->private;
-	struct drm_device *dev = node->minor->dev;
-	struct drm_framebuffer *fb, *fbdev_fb = NULL;
-
-	if (dev->fb_helper && dev->fb_helper->fb) {
-		seq_printf(m, "fbcon ");
-		fbdev_fb = dev->fb_helper->fb;
-		msm_framebuffer_describe(fbdev_fb, m);
-	}
-
-	mutex_lock(&dev->mode_config.fb_lock);
-	list_for_each_entry(fb, &dev->mode_config.fb_list, head) {
-		if (fb == fbdev_fb)
-			continue;
-
-		seq_printf(m, "user ");
-		msm_framebuffer_describe(fb, m);
-	}
-	mutex_unlock(&dev->mode_config.fb_lock);
-
-	return 0;
-}
-
 static struct drm_info_list msm_debugfs_list[] = {
 		{"gem", msm_gem_show},
 		{ "mm", msm_mm_show },
 };
 
-static struct drm_info_list msm_kms_debugfs_list[] = {
-		{ "fb", msm_fb_show },
-};
-
 static int late_init_minor(struct drm_minor *minor)
 {
 	int ret;
@@ -343,20 +365,12 @@ void msm_debugfs_init(struct drm_minor *minor)
 	if (priv->gpu_pdev)
 		msm_debugfs_gpu_init(minor);
 
-	if (priv->kms) {
-		drm_debugfs_create_files(msm_kms_debugfs_list,
-					 ARRAY_SIZE(msm_kms_debugfs_list),
-					 minor->debugfs_root, minor);
-		debugfs_create_file("kms", S_IRUSR, minor->debugfs_root,
-				    dev, &msm_kms_fops);
-	}
+	if (priv->kms)
+		msm_debugfs_kms_init(minor);
 
 	debugfs_create_file("shrink", S_IRWXU, minor->debugfs_root,
 		dev, &shrink_fops);
 
-	if (priv->kms && priv->kms->funcs->debugfs_init)
-		priv->kms->funcs->debugfs_init(priv->kms, minor);
-
 	fault_create_debugfs_attr("fail_gem_alloc", minor->debugfs_root,
 				  &fail_gem_alloc);
 	fault_create_debugfs_attr("fail_gem_iova", minor->debugfs_root,
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 5ec129bf6a9c83ec8e3d5b667411dd0917a76582..f6b4c5e1dc3a18516e0e40703b24d3ae37b7c35d 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -72,12 +72,6 @@ enum msm_dsi_controller {
 
 #define MSM_GPU_MAX_RINGS 4
 
-/* Commit/Event thread specific structure */
-struct msm_drm_thread {
-	struct drm_device *dev;
-	struct kthread_worker *worker;
-};
-
 struct msm_drm_private {
 
 	struct drm_device *dev;
@@ -167,8 +161,6 @@ struct msm_drm_private {
 		struct mutex lock;
 	} lru;
 
-	struct msm_drm_thread event_thread[MAX_CRTCS];
-
 	/* VRAM carveout, used when no IOMMU: */
 	struct {
 		unsigned long size;
@@ -261,7 +253,7 @@ struct drm_framebuffer *msm_framebuffer_create(struct drm_device *dev,
 struct drm_framebuffer * msm_alloc_stolen_fb(struct drm_device *dev,
 		int w, int h, int p, uint32_t format);
 
-#ifdef CONFIG_DRM_FBDEV_EMULATION
+#ifdef CONFIG_DRM_MSM_KMS_FBDEV
 int msm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 				 struct drm_fb_helper_surface_size *sizes);
 #define MSM_FBDEV_DRIVER_OPS \
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 9dfe0fb4755ddd11277f524234297ccd5ea96001..ea133e50d0bfd2b2b60e5ceb37dfaf72f43a2828 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -246,8 +246,8 @@ void msm_drm_kms_uninit(struct device *dev)
 
 	/* clean up event worker threads */
 	for (i = 0; i < MAX_CRTCS; i++) {
-		if (priv->event_thread[i].worker)
-			kthread_destroy_worker(priv->event_thread[i].worker);
+		if (kms->event_thread[i].worker)
+			kthread_destroy_worker(kms->event_thread[i].worker);
 	}
 
 	drm_kms_helper_poll_fini(ddev);
@@ -300,7 +300,7 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 		struct msm_drm_thread *ev_thread;
 
 		/* initialize event thread */
-		ev_thread = &priv->event_thread[drm_crtc_index(crtc)];
+		ev_thread = &kms->event_thread[drm_crtc_index(crtc)];
 		ev_thread->dev = ddev;
 		ev_thread->worker = kthread_run_worker(0, "crtc_event:%d", crtc->base.id);
 		if (IS_ERR(ev_thread->worker)) {
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 14762b39edca381c817fa509d0d1da6f535e5da7..c15868bd380937d64455f9bf2d2571c7492396b4 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -13,6 +13,8 @@
 
 #include "msm_drv.h"
 
+#ifdef CONFIG_DRM_MSM_KMS
+
 #define MAX_PLANE	4
 
 /* As there are different display controller blocks depending on the
@@ -127,6 +129,12 @@ struct msm_pending_timer {
 	unsigned crtc_idx;
 };
 
+/* Commit/Event thread specific structure */
+struct msm_drm_thread {
+	struct drm_device *dev;
+	struct kthread_worker *worker;
+};
+
 struct msm_kms {
 	const struct msm_kms_funcs *funcs;
 	struct drm_device *dev;
@@ -161,6 +169,7 @@ struct msm_kms {
 	struct msm_pending_timer pending_timers[MAX_CRTCS];
 
 	struct workqueue_struct *wq;
+	struct msm_drm_thread event_thread[MAX_CRTCS];
 };
 
 static inline int msm_kms_init(struct msm_kms *kms,
@@ -210,4 +219,25 @@ void msm_drm_kms_post_init(struct device *dev);
 void msm_drm_kms_unregister(struct device *dev);
 void msm_drm_kms_uninit(struct device *dev);
 
+#else /* ! CONFIG_DRM_MSM_KMS */
+
+static inline int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
+{
+	return -ENODEV;
+}
+
+static inline void msm_drm_kms_post_init(struct device *dev)
+{
+}
+
+static inline void msm_drm_kms_unregister(struct device *dev)
+{
+}
+
+static inline void msm_drm_kms_uninit(struct device *dev)
+{
+}
+
+#endif
+
 #endif /* __MSM_KMS_H__ */

-- 
2.39.5

