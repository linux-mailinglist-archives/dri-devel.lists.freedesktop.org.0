Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C92EFB82CF8
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 05:51:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B6710E65F;
	Thu, 18 Sep 2025 03:51:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="G81Oh7NX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E163910E638
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 03:51:32 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HIaAAj017667
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 03:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2aFg0keuUaiCvcSu6LI8UzHfBFFR9GyPPp6KA0oigY8=; b=G81Oh7NX+qOcxkYg
 Q6OflROxqJ7IfuuhuWjWWYxvZLS/LesVGUVLkWGl5/tT4MvhjR1rOfjDqmSCLhlm
 ZTMSLj6D5EAOokT50k6wRreo9PnMMwo35tXSmjnuHfi6ZSaB4EjDPPuDwwNaCyWD
 /eS7c1TrX6nmDWHEeQhCHpqMvdfUS9otgT/Zi3Q58qjEOO//gMqNyRytmMJxJTUV
 sx48L/FXDgybcjFNH3l1uHcNAPzyGqVBPFM6lPRUszW7ZQGDHiRoA7PWjgNsDuT8
 v95HTGnqmi6/ldKgh0eOuX4vyB9JAvTEecHgrBo2sKOfBKtz9rKQTD7CvGnsT6R+
 7752MA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4982de9ayg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 03:51:31 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b5d58d226cso10944131cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 20:51:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758167491; x=1758772291;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2aFg0keuUaiCvcSu6LI8UzHfBFFR9GyPPp6KA0oigY8=;
 b=WK8k/RxI7JZjEtSonld8glDh1JSGfHWckM70s9bO7Uwz2Bv8u9iYpHKFd8f/414Ghj
 aAkcjbQGQGuX8vR+vBBTQ945xsrnGNHxnt8wmaJVHFIwmyHSX6NZJ5UZ0Et7n/PeiLzp
 drJd+gX5/Wy88wHwB+ohlzyIyH0jUjWVDsi9GwdJqRknGdSzGP3ERgZ9PWWqds/H3z3g
 JjD/hXFxwmGjNP0jyu3AwxxxaRp7+crZxxC3CQjI4XmSPE6Qk4xj6KUBPQqOTubS4Zzn
 sDTUZ5Mck5ExQBHWl2/jI9lJKPv6LDW5sAEsQLIb52h4In7UJ3Jhat7FpBsamBNw3k6S
 C0Uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEUSE/Mui91CDD07QqqUCvrMjEJ1JyAWLhGNYEv4/+9IhFUs3Bs0BRY9EyzY05LmfpfUZTjjEyChI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAKQaCqNMxQY4ItquOTZGNvdqqX5eyMU7Xtfqhyua8/LRadsR/
 H+Q4nIWPxVFa1eswujt6W6Sd4kERJrBzrmfMRC+9fBWVAQK/9yXXSLVcUof04aR16IRUgaAfYc6
 SvnHj/kwHK6SWeVDqNaMsYbVcYHHLHcADI846mIjCaBmFrYDAioKY7XhFHjObBq5fWRDUi9U=
X-Gm-Gg: ASbGncsaVDF6jwVhw1wUfr/Q9Vsdlxk1fHPiqYMAaCxjtE/Q4df0Ztd8PR6cXtOTJNF
 yGc0A4mhnmWaajVZ5oeYcwwG6VxhUXmSjv2BvBv+1UxZuNEZ5cPkKRxOwB1KqYSlBRfjwUa3hOy
 phBmEGN41MbTCflbP+5WyhbXFzcJbHCs2ZykevrR/p92Opm2ncxezB4SdD/rcp/IHU8fpHaa09K
 qAIA6H1paD5xFLOBqG/n/28gfTpYemwvm2NxhScqEIC8OkCy4sqwHS6k0cTu41KatMoeg9PpPuo
 5V/kM+Z4oUt+HkmCVY2jSZ9Aax9Zx4NwWlsxHK0brXa/5INWHky+7zXgkwE0OUJhri0H57JRseJ
 KAhsI0IZDfWuFfsT+UVODFVDKY9ITAgialw0jEWDi64vxbRvbqZ0X
X-Received: by 2002:ac8:5a8f:0:b0:4b2:ee19:ed57 with SMTP id
 d75a77b69052e-4ba6799d2d2mr50926771cf.12.1758167490667; 
 Wed, 17 Sep 2025 20:51:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNpP8PjKrWWX8fJxpN8mpxakNvZGAhPJUW6Kzmnc2OVvCJOd10/Vr/df7omOH16dGAJDtG/Q==
X-Received: by 2002:ac8:5a8f:0:b0:4b2:ee19:ed57 with SMTP id
 d75a77b69052e-4ba6799d2d2mr50926541cf.12.1758167490063; 
 Wed, 17 Sep 2025 20:51:30 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-361aa38c4f7sm2799911fa.62.2025.09.17.20.51.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 20:51:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 06:50:26 +0300
Subject: [PATCH v5 5/5] drm/msm: make it possible to disable GPU support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-msm-gpu-split-v5-5-44486f44d27d@oss.qualcomm.com>
References: <20250918-msm-gpu-split-v5-0-44486f44d27d@oss.qualcomm.com>
In-Reply-To: <20250918-msm-gpu-split-v5-0-44486f44d27d@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=25185;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=MPlM4YS1WNe5lcUQo7syRlnRAdiC33DpGMTUZ2Yq/Ws=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoy4GuRkoMds06CJWjhcR2NzxMhRnAcqHKWf65Q
 UBaLZI4D7SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaMuBrgAKCRCLPIo+Aiko
 1YrEB/9X7sjrqwipG+XeWj1RvHGXAxylXQ4CkdDdhkpQZpcH7gGEmUzfdKNozD5doZ/w6gMo8Jr
 EtztzmbNeXpC01xGb3wEgzpCcADZBWNzZCOOq5XsHIyjxd1Euz6X7ARCIxThTlAlhwFfxvqlC7l
 w0O/JPfkodeK7esAmxAK15Hcm4Lvs/vyyC7M+1o2M/jcPXTKLscLh5QJBtqMvy8DebTgpd+cAVW
 97vzuWvGPbxJ3xmn7rNdHSya81hY9bGq91eX8iNfHr3yTyUhE+jCoWwULx59JkdgDXfM3d9rr1l
 XjrTRKpeGZ8xyRCNAq4coVqWdTmiiu1lwndBC+NCHIP6XzMp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=YfO95xRf c=1 sm=1 tr=0 ts=68cb81c3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=O_sw1XWOr4TBHZv0ZsgA:9
 a=Stk6j59YW_Pzu7xC:21 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: m9iJ1RSrMxKyvcCV7AEjJzvAEfAVdgfD
X-Proofpoint-ORIG-GUID: m9iJ1RSrMxKyvcCV7AEjJzvAEfAVdgfD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDE4MiBTYWx0ZWRfX1B2yul7p0HJA
 ThPnPV6QzsR5gWijpJ7ZSy5Pj6jOB14LsEX/X7kJnBtZ/JfSqMWarzgzRao0pdjGyJugU4D1sPS
 oOmBdZHhJw0LsqUjPtzuFi7mvN0wOuOMOrr222rMn9HiYLTz2rqZA/pJd50c6AU2pDgyvhT0eW1
 rRjBNfCJI24MsZNOTakrxThzffB3laJjZu1l64WgCAQ+TYe2KdYbHWDH+p4/2oK2pq3ORO6+tgr
 oTAARJ1svPpTZdzithUCO1ArDxs2dPdOGwRAOfXXlo+vj/mCsE5bDQt/S3Ss0nTtDM8LaFRC2SA
 AWDUtgMgBH2z2C3YZMNoi7u9VV/tnskMgaF+OY20HKqnYN4QMWgSJs+hsTmtOCrVIq2O/poz1W7
 UTyPy0Pd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509170182
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

Some of the platforms don't have onboard GPU or don't provide support
for the GPU in the drm/msm driver. Make it possible to disable the GPU
part of the driver and build the KMS-only part.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Kconfig           |  27 +++++--
 drivers/gpu/drm/msm/Makefile          |  15 ++--
 drivers/gpu/drm/msm/msm_drv.c         | 133 ++++++++++++++--------------------
 drivers/gpu/drm/msm/msm_drv.h         |  16 ----
 drivers/gpu/drm/msm/msm_gem.h         |   2 +
 drivers/gpu/drm/msm/msm_gem_vma.h     |  14 ++++
 drivers/gpu/drm/msm/msm_gpu.c         |  45 ++++++++++++
 drivers/gpu/drm/msm/msm_gpu.h         | 111 +++++++++++++++++++++++-----
 drivers/gpu/drm/msm/msm_submitqueue.c |  12 +--
 9 files changed, 240 insertions(+), 135 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 250246f81ea94f01a016e8938f08e1aa4ce02442..f833aa2e6263ea5509d77cac42f94c7fe34e6ece 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -13,33 +13,43 @@ config DRM_MSM
 	depends on QCOM_COMMAND_DB || QCOM_COMMAND_DB=n
 	depends on PM
 	select IOMMU_IO_PGTABLE
-	select QCOM_MDT_LOADER if ARCH_QCOM
 	select REGULATOR
-	select DRM_EXEC
 	select DRM_GPUVM
-	select DRM_SCHED
 	select SHMEM
 	select TMPFS
-	select QCOM_SCM
 	select QCOM_UBWC_CONFIG
 	select WANT_DEV_COREDUMP
 	select SND_SOC_HDMI_CODEC if SND_SOC
-	select SYNC_FILE
 	select PM_OPP
-	select NVMEM
 	select PM_GENERIC_DOMAINS
 	select TRACE_GPU_MEM
 	help
 	  DRM/KMS driver for MSM/snapdragon.
 
+config DRM_MSM_ADRENO
+	bool "Qualcomm Adreno GPU support"
+	default y
+	depends on DRM_MSM
+	select DRM_EXEC
+	select DRM_SCHED
+	select NVMEM
+	select QCOM_MDT_LOADER if ARCH_QCOM
+	select QCOM_SCM if ARCH_QCOM
+	select SYNC_FILE
+	help
+	  Enable support for the GPU present on most of Qualcomm Snapdragon
+	  platforms. Without this option the driver will only support the
+	  unaccelerated display output.
+	  If you are unsure, say Y.
+
 config DRM_MSM_GPU_STATE
 	bool
-	depends on DRM_MSM && (DEBUG_FS || DEV_COREDUMP)
+	depends on DRM_MSM_ADRENO && (DEBUG_FS || DEV_COREDUMP)
 	default y
 
 config DRM_MSM_GPU_SUDO
 	bool "Enable SUDO flag on submits"
-	depends on DRM_MSM && EXPERT
+	depends on DRM_MSM_ADRENO && EXPERT
 	default n
 	help
 	  Enable userspace that has CAP_SYS_RAWIO to submit GPU commands
@@ -189,6 +199,7 @@ config DRM_MSM_HDMI
 	default y
 	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_DISPLAY_HDMI_STATE_HELPER
+	select QCOM_SCM
 	help
 	  Compile in support for the HDMI output MSM DRM driver. It can
 	  be a primary or a secondary display on device. Note that this is used
diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index a475479fe201cb03937d30ee913c2e178675384e..ffa0767601fc8b2bc8f60506f0aac6f08a41f3c5 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -108,26 +108,29 @@ msm-display-$(CONFIG_DRM_MSM_KMS) += \
 
 msm-y += \
 	msm_drv.o \
-	msm_fence.o \
 	msm_gem.o \
 	msm_gem_debugfs.o \
 	msm_gem_prime.o \
 	msm_gem_shrinker.o \
-	msm_gem_submit.o \
 	msm_gem_vma.o \
+	msm_io_utils.o \
+	msm_iommu.o \
+	msm_gpu_tracepoints.o \
+
+msm-$(CONFIG_DRM_MSM_ADRENO) += \
+	msm_fence.o \
+	msm_gem_submit.o \
 	msm_gem_vm_bind.o \
 	msm_gpu.o \
+	msm_gpu_debugfs.o \
 	msm_gpu_devfreq.o \
 	msm_gpu_debugfs.o \
-	msm_io_utils.o \
 	msm_ioctl.o \
-	msm_iommu.o \
 	msm_perf.o \
 	msm_rd.o \
 	msm_ringbuffer.o \
 	msm_submitqueue.o \
 	msm_syncobj.o \
-	msm_gpu_tracepoints.o \
 
 msm-$(CONFIG_DRM_MSM_KMS) += \
 	msm_atomic.o \
@@ -163,7 +166,7 @@ msm-display-$(CONFIG_DRM_MSM_DSI_14NM_PHY) += dsi/phy/dsi_phy_14nm.o
 msm-display-$(CONFIG_DRM_MSM_DSI_10NM_PHY) += dsi/phy/dsi_phy_10nm.o
 msm-display-$(CONFIG_DRM_MSM_DSI_7NM_PHY) += dsi/phy/dsi_phy_7nm.o
 
-msm-y += $(adreno-y)
+msm-$(CONFIG_DRM_MSM_ADRENO) += $(adreno-y)
 msm-$(CONFIG_DRM_MSM_KMS) += $(msm-display-y)
 
 obj-$(CONFIG_DRM_MSM)	+= msm.o
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 28a5da1d1391f6c3cb2bfd175154016f8987b752..f7fb80b6c6d333149eaef17407cfc06d2f1abf3f 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -51,7 +51,11 @@ static bool modeset = true;
 MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=on (default), 0=disable)");
 module_param(modeset, bool, 0600);
 
+#ifndef CONFIG_DRM_MSM_ADRENO
+static bool separate_gpu_kms = true;
+#else
 static bool separate_gpu_kms;
+#endif
 MODULE_PARM_DESC(separate_gpu_kms, "Use separate DRM device for the GPU (0=single DRM device for both GPU and display (default), 1=two DRM devices)");
 module_param(separate_gpu_kms, bool, 0400);
 
@@ -204,53 +208,20 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv,
 	return ret;
 }
 
-/*
- * DRM operations:
- */
-
-static void load_gpu(struct drm_device *dev)
+void __msm_context_destroy(struct kref *kref)
 {
-	static DEFINE_MUTEX(init_lock);
-	struct msm_drm_private *priv = dev->dev_private;
+	struct msm_context *ctx = container_of(kref, struct msm_context, ref);
 
-	mutex_lock(&init_lock);
+	msm_submitqueue_fini(ctx);
 
-	if (!priv->gpu)
-		priv->gpu = adreno_load_gpu(dev);
+	drm_gpuvm_put(ctx->vm);
 
-	mutex_unlock(&init_lock);
-}
-
-/**
- * msm_context_vm - lazily create the context's VM
- *
- * @dev: the drm device
- * @ctx: the context
- *
- * The VM is lazily created, so that userspace has a chance to opt-in to having
- * a userspace managed VM before the VM is created.
- *
- * Note that this does not return a reference to the VM.  Once the VM is created,
- * it exists for the lifetime of the context.
- */
-struct drm_gpuvm *msm_context_vm(struct drm_device *dev, struct msm_context *ctx)
-{
-	static DEFINE_MUTEX(init_lock);
-	struct msm_drm_private *priv = dev->dev_private;
-
-	/* Once ctx->vm is created it is valid for the lifetime of the context: */
-	if (ctx->vm)
-		return ctx->vm;
-
-	mutex_lock(&init_lock);
-	if (!ctx->vm) {
-		ctx->vm = msm_gpu_create_private_vm(
-			priv->gpu, current, !ctx->userspace_managed_vm);
-
-	}
-	mutex_unlock(&init_lock);
+#ifdef CONFIG_DRM_MSM_ADRENO
+	kfree(ctx->comm);
+	kfree(ctx->cmdline);
+#endif
 
-	return ctx->vm;
+	kfree(ctx);
 }
 
 static int context_init(struct drm_device *dev, struct drm_file *file)
@@ -262,9 +233,6 @@ static int context_init(struct drm_device *dev, struct drm_file *file)
 	if (!ctx)
 		return -ENOMEM;
 
-	INIT_LIST_HEAD(&ctx->submitqueues);
-	rwlock_init(&ctx->queuelock);
-
 	kref_init(&ctx->ref);
 	msm_submitqueue_init(dev, ctx);
 
@@ -280,7 +248,7 @@ static int msm_open(struct drm_device *dev, struct drm_file *file)
 	/* For now, load gpu on open.. to avoid the requirement of having
 	 * firmware in the initrd.
 	 */
-	load_gpu(dev);
+	msm_gpu_load(dev);
 
 	return context_init(dev, file);
 }
@@ -307,31 +275,13 @@ static void msm_postclose(struct drm_device *dev, struct drm_file *file)
 	context_close(ctx);
 }
 
-static const struct drm_ioctl_desc msm_ioctls[] = {
-	DRM_IOCTL_DEF_DRV(MSM_GET_PARAM,    msm_ioctl_get_param,    DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(MSM_SET_PARAM,    msm_ioctl_set_param,    DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(MSM_GEM_NEW,      msm_ioctl_gem_new,      DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(MSM_GEM_INFO,     msm_ioctl_gem_info,     DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(MSM_GEM_CPU_PREP, msm_ioctl_gem_cpu_prep, DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(MSM_GEM_CPU_FINI, msm_ioctl_gem_cpu_fini, DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(MSM_GEM_SUBMIT,   msm_ioctl_gem_submit,   DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(MSM_WAIT_FENCE,   msm_ioctl_wait_fence,   DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(MSM_GEM_MADVISE,  msm_ioctl_gem_madvise,  DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_NEW,   msm_ioctl_submitqueue_new,   DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_CLOSE, msm_ioctl_submitqueue_close, DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_QUERY, msm_ioctl_submitqueue_query, DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(MSM_VM_BIND,      msm_ioctl_vm_bind,      DRM_RENDER_ALLOW),
-};
-
 static void msm_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 {
 	struct drm_device *dev = file->minor->dev;
 	struct msm_drm_private *priv = dev->dev_private;
 
-	if (!priv->gpu)
-		return;
-
-	msm_gpu_show_fdinfo(priv->gpu, file->driver_priv, p);
+	if (priv->gpu)
+		msm_gpu_show_fdinfo(priv->gpu, file->driver_priv, p);
 
 	drm_show_memory_stats(p, file);
 }
@@ -357,6 +307,23 @@ static const struct file_operations fops = {
 		DRIVER_MODESET | \
 		0 )
 
+#ifdef CONFIG_DRM_MSM_ADRENO
+static const struct drm_ioctl_desc msm_ioctls[] = {
+	DRM_IOCTL_DEF_DRV(MSM_GET_PARAM,    msm_ioctl_get_param,    DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(MSM_SET_PARAM,    msm_ioctl_set_param,    DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(MSM_GEM_NEW,      msm_ioctl_gem_new,      DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(MSM_GEM_INFO,     msm_ioctl_gem_info,     DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(MSM_GEM_CPU_PREP, msm_ioctl_gem_cpu_prep, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(MSM_GEM_CPU_FINI, msm_ioctl_gem_cpu_fini, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(MSM_GEM_SUBMIT,   msm_ioctl_gem_submit,   DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(MSM_WAIT_FENCE,   msm_ioctl_wait_fence,   DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(MSM_GEM_MADVISE,  msm_ioctl_gem_madvise,  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_NEW,   msm_ioctl_submitqueue_new,   DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_CLOSE, msm_ioctl_submitqueue_close, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_QUERY, msm_ioctl_submitqueue_query, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(MSM_VM_BIND,      msm_ioctl_vm_bind,      DRM_RENDER_ALLOW),
+};
+
 static const struct drm_driver msm_driver = {
 	.driver_features    = DRIVER_FEATURES_GPU | DRIVER_FEATURES_KMS,
 	.open               = msm_open,
@@ -380,39 +347,40 @@ static const struct drm_driver msm_driver = {
 	.patchlevel         = MSM_VERSION_PATCHLEVEL,
 };
 
-static const struct drm_driver msm_kms_driver = {
-	.driver_features    = DRIVER_FEATURES_KMS,
+static const struct drm_driver msm_gpu_driver = {
+	.driver_features    = DRIVER_FEATURES_GPU,
 	.open               = msm_open,
 	.postclose          = msm_postclose,
-	.dumb_create        = msm_gem_dumb_create,
-	.dumb_map_offset    = msm_gem_dumb_map_offset,
 	.gem_prime_import_sg_table = msm_gem_prime_import_sg_table,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init       = msm_debugfs_init,
 #endif
-	MSM_FBDEV_DRIVER_OPS,
 	.show_fdinfo        = msm_show_fdinfo,
+	.ioctls             = msm_ioctls,
+	.num_ioctls         = ARRAY_SIZE(msm_ioctls),
 	.fops               = &fops,
-	.name               = "msm-kms",
+	.name               = "msm",
 	.desc               = "MSM Snapdragon DRM",
 	.major              = MSM_VERSION_MAJOR,
 	.minor              = MSM_VERSION_MINOR,
 	.patchlevel         = MSM_VERSION_PATCHLEVEL,
 };
+#endif
 
-static const struct drm_driver msm_gpu_driver = {
-	.driver_features    = DRIVER_FEATURES_GPU,
+static const struct drm_driver msm_kms_driver = {
+	.driver_features    = DRIVER_FEATURES_KMS,
 	.open               = msm_open,
 	.postclose          = msm_postclose,
+	.dumb_create        = msm_gem_dumb_create,
+	.dumb_map_offset    = msm_gem_dumb_map_offset,
 	.gem_prime_import_sg_table = msm_gem_prime_import_sg_table,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init       = msm_debugfs_init,
 #endif
+	MSM_FBDEV_DRIVER_OPS,
 	.show_fdinfo        = msm_show_fdinfo,
-	.ioctls             = msm_ioctls,
-	.num_ioctls         = ARRAY_SIZE(msm_ioctls),
 	.fops               = &fops,
-	.name               = "msm",
+	.name               = "msm-kms",
 	.desc               = "MSM Snapdragon DRM",
 	.major              = MSM_VERSION_MAJOR,
 	.minor              = MSM_VERSION_MINOR,
@@ -511,6 +479,7 @@ bool msm_disp_drv_should_bind(struct device *dev, bool dpu_driver)
 }
 #endif
 
+#ifdef CONFIG_DRM_MSM_ADRENO
 /*
  * We don't know what's the best binding to link the gpu with the drm device.
  * Fow now, we just hunt for all the possible gpus that we support, and add them
@@ -549,6 +518,12 @@ static int msm_drm_bind(struct device *dev)
 				    &msm_driver,
 			    NULL);
 }
+#else
+static int msm_drm_bind(struct device *dev)
+{
+	return msm_drm_init(dev, &msm_kms_driver, NULL);
+}
+#endif
 
 static void msm_drm_unbind(struct device *dev)
 {
@@ -583,11 +558,13 @@ int msm_drv_probe(struct device *master_dev,
 			return ret;
 	}
 
+#ifdef CONFIG_DRM_MSM_ADRENO
 	if (!msm_gpu_no_components()) {
 		ret = add_gpu_components(master_dev, &match);
 		if (ret)
 			return ret;
 	}
+#endif
 
 	/* on all devices that I am aware of, iommu's which can map
 	 * any address the cpu can see are used:
@@ -603,6 +580,7 @@ int msm_drv_probe(struct device *master_dev,
 	return 0;
 }
 
+#ifdef CONFIG_DRM_MSM_ADRENO
 int msm_gpu_probe(struct platform_device *pdev,
 		  const struct component_ops *ops)
 {
@@ -630,6 +608,7 @@ void msm_gpu_remove(struct platform_device *pdev,
 {
 	msm_drm_uninit(&pdev->dev, ops);
 }
+#endif
 
 static int __init msm_drm_register(void)
 {
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 646ddf2c320ac94ff7b0f5c21dab60fe777a10bf..dd77e26895fb493ce73181581434fb42885a089e 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -436,22 +436,6 @@ static inline void msm_mdss_unregister(void) {}
 
 #ifdef CONFIG_DEBUG_FS
 void msm_framebuffer_describe(struct drm_framebuffer *fb, struct seq_file *m);
-void msm_gpu_debugfs_init(struct drm_minor *minor);
-void msm_gpu_debugfs_late_init(struct drm_device *dev);
-int msm_rd_debugfs_init(struct drm_minor *minor);
-void msm_rd_debugfs_cleanup(struct msm_drm_private *priv);
-__printf(3, 4)
-void msm_rd_dump_submit(struct msm_rd_state *rd, struct msm_gem_submit *submit,
-		const char *fmt, ...);
-int msm_perf_debugfs_init(struct drm_minor *minor);
-void msm_perf_debugfs_cleanup(struct msm_drm_private *priv);
-#else
-__printf(3, 4)
-static inline void msm_rd_dump_submit(struct msm_rd_state *rd,
-			struct msm_gem_submit *submit,
-			const char *fmt, ...) {}
-static inline void msm_rd_debugfs_cleanup(struct msm_drm_private *priv) {}
-static inline void msm_perf_debugfs_cleanup(struct msm_drm_private *priv) {}
 #endif
 
 struct clk *msm_clk_get(struct platform_device *pdev, const char *name);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 3a0086a883a2c2e57b01a5add17be852f2877865..088a84dbc564066310c6ef9d9077b802c73babb9 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -68,6 +68,7 @@ struct msm_gem_vm {
 	/** @base: Inherit from drm_gpuvm. */
 	struct drm_gpuvm base;
 
+#ifdef CONFIG_DRM_MSM_ADRENO
 	/**
 	 * @sched: Scheduler used for asynchronous VM_BIND request.
 	 *
@@ -94,6 +95,7 @@ struct msm_gem_vm {
 		 */
 		atomic_t in_flight;
 	} prealloc_throttle;
+#endif
 
 	/**
 	 * @mm: Memory management for kernel managed VA allocations
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.h b/drivers/gpu/drm/msm/msm_gem_vma.h
index f702f81529e72b86bffb4960408f1912bc65851a..0cf92b111c17bfc1a7d3db10e4395face1afaa83 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.h
+++ b/drivers/gpu/drm/msm/msm_gem_vma.h
@@ -95,11 +95,25 @@ vm_map_op(struct msm_gem_vm *vm, const struct msm_vm_map_op *op)
 				   op->range, op->prot);
 }
 
+#ifdef CONFIG_DRM_MSM_ADRENO
 int msm_gem_vm_sm_step_map(struct drm_gpuva_op *op, void *_arg);
 int msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, void *arg);
 int msm_gem_vm_sm_step_unmap(struct drm_gpuva_op *op, void *_arg);
 
 int msm_gem_vm_sched_init(struct msm_gem_vm *vm, struct drm_device *drm);
 void msm_gem_vm_sched_fini(struct msm_gem_vm *vm);
+#else
+
+#define msm_gem_vm_sm_step_map   NULL
+#define msm_gem_vm_sm_step_remap NULL
+#define msm_gem_vm_sm_step_unmap NULL
+
+static inline int msm_gem_vm_sched_init(struct msm_gem_vm *vm, struct drm_device *drm)
+{
+	return -EINVAL;
+}
+
+static inline void msm_gem_vm_sched_fini(struct msm_gem_vm *vm) {}
+#endif
 
 #endif
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 17759abc46d7d7af4117b1d71f1d5fba6ba0b61c..9ac6f04e95a61143dc6372fde165d45a306a495c 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -1146,3 +1146,48 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
 
 	platform_set_drvdata(gpu->pdev, NULL);
 }
+
+void msm_gpu_load(struct drm_device *dev)
+{
+	static DEFINE_MUTEX(init_lock);
+	struct msm_drm_private *priv = dev->dev_private;
+
+	mutex_lock(&init_lock);
+
+	if (!priv->gpu)
+		priv->gpu = adreno_load_gpu(dev);
+
+	mutex_unlock(&init_lock);
+}
+
+/**
+ * msm_context_vm - lazily create the context's VM
+ *
+ * @dev: the drm device
+ * @ctx: the context
+ *
+ * The VM is lazily created, so that userspace has a chance to opt-in to having
+ * a userspace managed VM before the VM is created.
+ *
+ * Note that this does not return a reference to the VM.  Once the VM is created,
+ * it exists for the lifetime of the context.
+ */
+struct drm_gpuvm *msm_context_vm(struct drm_device *dev, struct msm_context *ctx)
+{
+	static DEFINE_MUTEX(init_lock);
+	struct msm_drm_private *priv = dev->dev_private;
+
+	/* Once ctx->vm is created it is valid for the lifetime of the context: */
+	if (ctx->vm)
+		return ctx->vm;
+
+	mutex_lock(&init_lock);
+	if (!ctx->vm) {
+		ctx->vm = msm_gpu_create_private_vm(
+			priv->gpu, current, !ctx->userspace_managed_vm);
+
+	}
+	mutex_unlock(&init_lock);
+
+	return ctx->vm;
+}
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index a597f2bee30b6370ecc3639bfe1072c85993e789..def2edadbface07d26c6e7c6add0d08352b8d748 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -345,20 +345,6 @@ struct msm_gpu_perfcntr {
  * struct msm_context - per-drm_file context
  */
 struct msm_context {
-	/** @queuelock: synchronizes access to submitqueues list */
-	rwlock_t queuelock;
-
-	/** @submitqueues: list of &msm_gpu_submitqueue created by userspace */
-	struct list_head submitqueues;
-
-	/**
-	 * @queueid:
-	 *
-	 * Counter incremented each time a submitqueue is created, used to
-	 * assign &msm_gpu_submitqueue.id
-	 */
-	int queueid;
-
 	/**
 	 * @closed: The device file associated with this context has been closed.
 	 *
@@ -394,6 +380,20 @@ struct msm_context {
 	 * pointer to the previous context.
 	 */
 	int seqno;
+#ifdef CONFIG_DRM_MSM_ADRENO
+	/** @queuelock: synchronizes access to submitqueues list */
+	rwlock_t queuelock;
+
+	/** @submitqueues: list of &msm_gpu_submitqueue created by userspace */
+	struct list_head submitqueues;
+
+	/**
+	 * @queueid:
+	 *
+	 * Counter incremented each time a submitqueue is created, used to
+	 * assign &msm_gpu_submitqueue.id
+	 */
+	int queueid;
 
 	/**
 	 * @sysprof:
@@ -455,6 +455,7 @@ struct msm_context {
 	 * level.
 	 */
 	struct drm_sched_entity *entities[NR_SCHED_PRIORITIES * MSM_GPU_MAX_RINGS];
+#endif
 
 	/**
 	 * @ctx_mem:
@@ -613,6 +614,7 @@ struct msm_gpu_state {
 	struct msm_gpu_state_bo *bos;
 };
 
+#ifdef CONFIG_DRM_MSM_ADRENO
 static inline void gpu_write(struct msm_gpu *gpu, u32 reg, u32 data)
 {
 	trace_msm_gpu_regaccess(reg);
@@ -673,6 +675,7 @@ void msm_gpu_show_fdinfo(struct msm_gpu *gpu, struct msm_context *ctx,
 			 struct drm_printer *p);
 
 int msm_submitqueue_init(struct drm_device *drm, struct msm_context *ctx);
+void msm_submitqueue_fini(struct msm_context *ctx);
 struct msm_gpu_submitqueue *msm_submitqueue_get(struct msm_context *ctx,
 		u32 id);
 int msm_submitqueue_create(struct drm_device *drm,
@@ -688,6 +691,44 @@ void msm_submitqueue_destroy(struct kref *kref);
 int msm_context_set_sysprof(struct msm_context *ctx, struct msm_gpu *gpu, int sysprof);
 void __msm_context_destroy(struct kref *kref);
 
+static inline void msm_submitqueue_put(struct msm_gpu_submitqueue *queue)
+{
+	if (queue)
+		kref_put(&queue->ref, msm_submitqueue_destroy);
+}
+
+int msm_context_set_sysprof(struct msm_context *ctx,
+				 struct msm_gpu *gpu, int sysprof);
+#else
+static inline void msm_gpu_show_fdinfo(struct msm_gpu *gpu,
+				       struct msm_context *ctx,
+				       struct drm_printer *p)
+{
+}
+
+static inline int msm_submitqueue_init(struct drm_device *drm, struct msm_context *ctx)
+{
+	return -ENXIO;
+}
+
+static inline void msm_submitqueue_fini(struct msm_context *ctx)
+{
+}
+
+static inline void msm_submitqueue_close(struct msm_context *ctx)
+{
+}
+
+static inline int msm_context_set_sysprof(struct msm_context *ctx,
+					       struct msm_gpu *gpu,
+					       int sysprof)
+{
+	return 0;
+}
+#endif
+
+void __msm_context_destroy(struct kref *kref);
+
 static inline void msm_context_put(struct msm_context *ctx)
 {
 	kref_put(&ctx->ref, __msm_context_destroy);
@@ -700,6 +741,7 @@ static inline struct msm_context *msm_context_get(
 	return ctx;
 }
 
+#ifdef CONFIG_DRM_MSM_ADRENO
 void msm_devfreq_init(struct msm_gpu *gpu);
 void msm_devfreq_cleanup(struct msm_gpu *gpu);
 void msm_devfreq_resume(struct msm_gpu *gpu);
@@ -726,6 +768,7 @@ struct drm_gpuvm *
 msm_gpu_create_private_vm(struct msm_gpu *gpu, struct task_struct *task,
 			  bool kernel_managed);
 
+void msm_gpu_load(struct drm_device *dev);
 void msm_gpu_cleanup(struct msm_gpu *gpu);
 
 struct msm_gpu *adreno_load_gpu(struct drm_device *dev);
@@ -733,12 +776,6 @@ bool adreno_has_gpu(struct device_node *node);
 void __init adreno_register(void);
 void __exit adreno_unregister(void);
 
-static inline void msm_submitqueue_put(struct msm_gpu_submitqueue *queue)
-{
-	if (queue)
-		kref_put(&queue->ref, msm_submitqueue_destroy);
-}
-
 static inline struct msm_gpu_state *msm_gpu_crashstate_get(struct msm_gpu *gpu)
 {
 	struct msm_gpu_state *state = NULL;
@@ -776,5 +813,39 @@ void msm_gpu_fault_crashstate_capture(struct msm_gpu *gpu, struct msm_gpu_fault_
 #define check_apriv(gpu, flags) \
 	(((gpu)->hw_apriv ? MSM_BO_MAP_PRIV : 0) | (flags))
 
+#else /* ! CONFIG_DRM_MSM_ADRENO */
+static inline void __init adreno_register(void)
+{
+}
+
+static inline void __exit adreno_unregister(void)
+{
+}
+
+static inline void msm_gpu_load(struct drm_device *dev)
+{
+}
+#endif /* ! CONFIG_DRM_MSM_ADRENO */
+
+#if defined(CONFIG_DEBUG_FS) && defined(CONFIG_DRM_MSM_ADRENO)
+void msm_gpu_debugfs_init(struct drm_minor *minor);
+void msm_gpu_debugfs_late_init(struct drm_device *dev);
+int msm_rd_debugfs_init(struct drm_minor *minor);
+void msm_rd_debugfs_cleanup(struct msm_drm_private *priv);
+__printf(3, 4)
+void msm_rd_dump_submit(struct msm_rd_state *rd, struct msm_gem_submit *submit,
+		const char *fmt, ...);
+int msm_perf_debugfs_init(struct drm_minor *minor);
+void msm_perf_debugfs_cleanup(struct msm_drm_private *priv);
+#else
+static inline void msm_gpu_debugfs_init(struct drm_minor *minor) {}
+static inline void msm_gpu_debugfs_late_init(struct drm_device *dev) {}
+__printf(3, 4)
+static inline void msm_rd_dump_submit(struct msm_rd_state *rd,
+			struct msm_gem_submit *submit,
+			const char *fmt, ...) {}
+static inline void msm_rd_debugfs_cleanup(struct msm_drm_private *priv) {}
+static inline void msm_perf_debugfs_cleanup(struct msm_drm_private *priv) {}
+#endif
 
 #endif /* __MSM_GPU_H__ */
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index d53dfad16bde7d5ae7b1e48f221696d525a10965..aa8fe0ccd80b4942bc78195a40ff80aaac9459e2 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -49,10 +49,8 @@ int msm_context_set_sysprof(struct msm_context *ctx, struct msm_gpu *gpu, int sy
 	return 0;
 }
 
-void __msm_context_destroy(struct kref *kref)
+void msm_submitqueue_fini(struct msm_context *ctx)
 {
-	struct msm_context *ctx = container_of(kref,
-		struct msm_context, ref);
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(ctx->entities); i++) {
@@ -62,11 +60,6 @@ void __msm_context_destroy(struct kref *kref)
 		drm_sched_entity_destroy(ctx->entities[i]);
 		kfree(ctx->entities[i]);
 	}
-
-	drm_gpuvm_put(ctx->vm);
-	kfree(ctx->comm);
-	kfree(ctx->cmdline);
-	kfree(ctx);
 }
 
 void msm_submitqueue_destroy(struct kref *kref)
@@ -264,6 +257,9 @@ int msm_submitqueue_init(struct drm_device *drm, struct msm_context *ctx)
 	struct msm_drm_private *priv = drm->dev_private;
 	int default_prio, max_priority;
 
+	INIT_LIST_HEAD(&ctx->submitqueues);
+	rwlock_init(&ctx->queuelock);
+
 	if (!priv->gpu)
 		return -ENODEV;
 

-- 
2.47.3

