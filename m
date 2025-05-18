Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B15FABAF8C
	for <lists+dri-devel@lfdr.de>; Sun, 18 May 2025 12:55:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EED1410E2A2;
	Sun, 18 May 2025 10:55:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ir+ELF7v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF80010E29C
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 10:55:47 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54IAdlHj015673
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 10:55:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HqNjmXtz1qaJNCZgR4hL9y6URhQnIUAfTEcJYyk+gLE=; b=ir+ELF7vGxKy9/pi
 loHP5FXKwVJ7BH33Bnn08pFELTj2kIWoHFsHJCO3xdqFV+VnSDQqBw3QshLya4T+
 4Sq4rGYE2qzet/iPIkAlXZMTslP3o1GsVij2hGYJiW4eEKW0Z+RSFOCSlhjWWOQr
 jKNvOTyiU+OJsiHaNfMLZdviJel6o86AAYOnbWsYE46CGE+Yc5tFFtOYrQk0PD8A
 TAKwv+cQsfcAg/2mGLeTWo760h8reJGD90xOf0mschqrabmwjPLJsflskM8Wy4CZ
 1T8ujkTw3HGjnnRuZGOH3VLHVuwGdayDy+lU/atlVeu6V3ayAjtO3BsCD9ThaZMb
 tIJ31w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4hv68-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 10:55:46 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6f6f5104d07so93372316d6.3
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 03:55:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747565746; x=1748170546;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HqNjmXtz1qaJNCZgR4hL9y6URhQnIUAfTEcJYyk+gLE=;
 b=WoxQZ2RPxzJMXfeBpXPg8gPu/HBL+Z8rdy9PO7DmjlihIFKU2780siiISu8kNEDdZG
 fL4ideFXHLzoGWGjPwJF3wSoZiXcHwhipHzsKzfh6gnD4dNIMeH00apSZQHqd/44k9V0
 aYeKEAb9n5bpuG6oV6GfZ5zCRDk53xks76S/ytuVoUTj9SLimzP1dglMAk9aXkZdyw2K
 0NgsQRvU7LdGVWQVBZmmMn3atuEzcYJGz3A/hK/5lJ+uVy+vjohHtblrwBmBynCRVA3r
 V04sAmZzLsluHgS8wGa1hrb3zROtEvzHXwiiIabc5PkWgUbGoMXL/gcFEiaufLRFWlrq
 Ku1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXa4HZJNW9mC2ssNsvZ8RDbdOeZihMRoPIe2Rw+xl3ryHCXWKNV5INSt/VnxLvbqIlWjj0TL5Q1SwA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzx51U5Y6+4kIXv3BIWCzEmTYJ89LjpMp12Zz4azAgT1U4g1Rkw
 gxLJbiK7lTraLw9ktpyFur6MstltuvyRH1osQylCcOC157HdOA51g8vnsAOB/OX3X0yvrS3KnKn
 Mt0mJWypZhLWGmTx2H6B5XypIkxuwnYIMYbJPQiy8MKSEB/mSLjzb/CxR72upZi3AzqGv7VU=
X-Gm-Gg: ASbGncvQClxTwi9B81dsxnFo1rQa5zgbPqaCl6sZvzT7gMGe5dCoH8NZ4pEjCxuoT69
 QuPqORgnqO8FwtuSIS+s43DxFJq/Pn/WbXnuUiWcNB4Xz+AmOu/l00GzWU8Jj4Vu7CPbcNJwD8P
 QoIsqG12Nm2OOBke1FUY+P6xFSsSQSFCwt2K4veJcgGCm547Pb7khSzGPBePGTfiExbuIBS1Mu1
 dvuRkg0xthkZvgK35ZLqJPytZbbRAAG57yVJ65Z8SRU5BZaMiLOI3CIIcM9JuzujBOoLh+8jS7E
 HqGU6BnjFtTssSNa5nLAGeRAlepl55urp4rExA7sfdlUplYy9ybHjn8nogqzlK4DEA5uqo0APKp
 wQDq20IxQiUcQDLGZKo1e0/yo
X-Received: by 2002:a05:6214:da5:b0:6f8:ae32:39ad with SMTP id
 6a1803df08f44-6f8b2c5b0f9mr144453706d6.15.1747565745827; 
 Sun, 18 May 2025 03:55:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFchODaacjsOZPGQk41p0ikkmx0YOmo4vleL6JSbPqxlP7Bu1h2tj+Z5u3bLogGwlGmWXWq9g==
X-Received: by 2002:a05:6214:da5:b0:6f8:ae32:39ad with SMTP id
 6a1803df08f44-6f8b2c5b0f9mr144453436d6.15.1747565745356; 
 Sun, 18 May 2025 03:55:45 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085cf8ccsm14314451fa.99.2025.05.18.03.55.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 03:55:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 18 May 2025 13:55:29 +0300
Subject: [PATCH v3 11/11] drm/msm: make it possible to disable GPU support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-msm-gpu-split-v3-11-0e91e8e77023@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=18000;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=dGc9s5VgMNOqWbxw9fUNkmD3sWid8RKFYdVeg7jDFCM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoKbyahftU1MQgHjtNHYjQ+1quIaFWX/Vxn+91n
 gE4nJqWiRKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCm8mgAKCRCLPIo+Aiko
 1b/RCACTfEgF8fxsbDtn3hqchznv+JN8YpCV88wqeJI22B8LYhB24Q+4ULvH0mAUbX8/+IRfbrD
 y48kheeDdDm9E3bMQD84GfhAF9W6V0QLPbDqbr1bWIaUoHcxmq0hxq8m7n1/Yi7dQPYPa2u+xv5
 b8xIZDgq5B0+VygB63vAkrx8PZ62X/TuLk3ixXT+Kh4IflULPSePJzCvKAA26iyv9/LGPwFraD/
 A6Z+ipJMUm7gPKTK3rKNI86IlrOeUDSxHhNrkjcohrz4T8n6E0NM40Y58kXcnm7xVBabEhw+bNc
 gJcecP0liSxdj4bC56cMdVyKPhYsbASdscVgJwJz+3/s0OQS
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: gpq4ZEumH0m_BKNwvtT1jVxxsbpT-hhq
X-Authority-Analysis: v=2.4 cv=C4bpyRP+ c=1 sm=1 tr=0 ts=6829bcb2 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=GxR0MxA7E3X_JZP00ToA:9
 a=sJjY2mzUKQrl7NF8:21 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: gpq4ZEumH0m_BKNwvtT1jVxxsbpT-hhq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwNCBTYWx0ZWRfX7ej+me3xt85A
 gkau2jpNTUDpPeHKWowWs78abA3fKXpUv88YUODWPortMvY0W/ffJ2W7txdql0EItnhR/IvvdnY
 vszlvgaMrzgtsHWtwf5Y4fksRMVrPOPx3mSsPlzOkUrj3e2DsnlOLXnxbIGCf0LLrsDpP9QIGue
 i7JWeL5nq4IEcx/2pcKJHcZBLfybnecHNxvpThA7GV3i1BoH+ltmrJNORDHM6apmIYfVxKJm7yl
 OVZvGwNVR/kzP+Zxkj99rYMUmBKVr3xrPmC+cA9wvtDVbf8aVmc++Lkb7SCTU6J6iJ3U9Z2t5wO
 OyEpmw/poU4ZHucyqTe463DLZK4uicTUf3wSVUVPORy0aqaIQgPKTMEM0M0pBdYyQCXO+ulq0dR
 rBVmRFNknGhyGElLf639PKLpfFGHutEPjt7Hlzk5LnLZ8C+D4pAuK5OIMY3MuERrtnLVfgwo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
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

Some of the platforms don't have onboard GPU or don't provide support
for the GPU in the drm/msm driver. Make it possible to disable the GPU
part of the driver and build the KMS-only part.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Kconfig           |  25 +++++--
 drivers/gpu/drm/msm/Makefile          |  14 ++--
 drivers/gpu/drm/msm/msm_debugfs.c     | 135 ++++++++++++++++++----------------
 drivers/gpu/drm/msm/msm_drv.c         |  37 ++++++++--
 drivers/gpu/drm/msm/msm_drv.h         |   3 +
 drivers/gpu/drm/msm/msm_gpu.h         |  71 +++++++++++++++---
 drivers/gpu/drm/msm/msm_submitqueue.c |  12 +--
 7 files changed, 194 insertions(+), 103 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index f6360931ae55a2923264f0e6cc33c6af0d50c706..4c94c0a43f1c204866d8259d3c1c38065c957a1f 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -13,31 +13,39 @@ config DRM_MSM
 	depends on QCOM_COMMAND_DB || QCOM_COMMAND_DB=n
 	depends on PM
 	select IOMMU_IO_PGTABLE
-	select QCOM_MDT_LOADER if ARCH_QCOM
 	select REGULATOR
-	select DRM_EXEC
-	select DRM_SCHED
 	select SHMEM
 	select TMPFS
-	select QCOM_SCM
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
+	  SoCs. If you are unsure, say Y.
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
@@ -187,6 +195,7 @@ config DRM_MSM_HDMI
 	default y
 	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_DISPLAY_HDMI_STATE_HELPER
+	select QCOM_SCM
 	help
 	  Compile in support for the HDMI output MSM DRM driver. It can
 	  be a primary or a secondary display on device. Note that this is used
diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 7c4508f0e5c84914633f8f2d5ddd04bd10e4d189..6a24f78d7fc51cc1c9cd706d746cabd5f567d282 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -109,21 +109,23 @@ msm-display-$(CONFIG_DRM_MSM_KMS) += \
 msm-y += \
 	msm_debugfs.o \
 	msm_drv.o \
-	msm_fence.o \
 	msm_gem.o \
 	msm_gem_prime.o \
 	msm_gem_shrinker.o \
-	msm_gem_submit.o \
 	msm_gem_vma.o \
-	msm_gpu.o \
-	msm_gpu_devfreq.o \
 	msm_io_utils.o \
 	msm_iommu.o \
+	msm_gpu_tracepoints.o \
+
+msm-$(CONFIG_DRM_MSM_ADRENO) += \
+	msm_fence.o \
+	msm_gem_submit.o \
+	msm_gpu.o \
+	msm_gpu_devfreq.o \
 	msm_perf.o \
 	msm_rd.o \
 	msm_ringbuffer.o \
 	msm_submitqueue.o \
-	msm_gpu_tracepoints.o \
 
 msm-$(CONFIG_DRM_MSM_KMS) += \
 	msm_atomic.o \
@@ -159,7 +161,7 @@ msm-display-$(CONFIG_DRM_MSM_DSI_14NM_PHY) += dsi/phy/dsi_phy_14nm.o
 msm-display-$(CONFIG_DRM_MSM_DSI_10NM_PHY) += dsi/phy/dsi_phy_10nm.o
 msm-display-$(CONFIG_DRM_MSM_DSI_7NM_PHY) += dsi/phy/dsi_phy_7nm.o
 
-msm-y += $(adreno-y)
+msm-$(CONFIG_DRM_MSM_ADRENO) += $(adreno-y)
 msm-$(CONFIG_DRM_MSM_KMS) += $(msm-display-y)
 
 obj-$(CONFIG_DRM_MSM)	+= msm.o
diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 6e60a74b13d72c47e45cb9dc65ed67b977e900fa..fa9a94a86d060e28d4ee93fda1f22924fd5af606 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -20,6 +20,7 @@
 #include "msm_debugfs.h"
 #include "disp/msm_disp_snapshot.h"
 
+#ifdef CONFIG_DRM_MSM_ADRENO
 /*
  * GPU Snapshot:
  */
@@ -117,6 +118,76 @@ static const struct file_operations msm_gpu_fops = {
 	.release = msm_gpu_release,
 };
 
+static void msm_debugfs_gpu_init(struct drm_minor *minor)
+{
+	struct drm_device *dev = minor->dev;
+	struct msm_drm_private *priv = dev->dev_private;
+	struct dentry *gpu_devfreq;
+
+	debugfs_create_file("gpu", 0400, minor->debugfs_root,
+			    dev, &msm_gpu_fops);
+
+	debugfs_create_u32("hangcheck_period_ms", 0600, minor->debugfs_root,
+			   &priv->hangcheck_period);
+
+	debugfs_create_bool("disable_err_irq", 0600, minor->debugfs_root,
+			    &priv->disable_err_irq);
+
+	gpu_devfreq = debugfs_create_dir("devfreq", minor->debugfs_root);
+
+	debugfs_create_bool("idle_clamp", 0600, gpu_devfreq,
+			    &priv->gpu_clamp_to_idle);
+
+	debugfs_create_u32("upthreshold", 0600, gpu_devfreq,
+			   &priv->gpu_devfreq_config.upthreshold);
+
+	debugfs_create_u32("downdifferential", 0600, gpu_devfreq,
+			   &priv->gpu_devfreq_config.downdifferential);
+}
+
+static int late_init_minor(struct drm_minor *minor)
+{
+	struct drm_device *dev = minor->dev;
+	struct msm_drm_private *priv = dev->dev_private;
+	int ret;
+
+	if (!minor)
+		return 0;
+
+	if (!priv->gpu_pdev)
+		return 0;
+
+	ret = msm_rd_debugfs_init(minor);
+	if (ret) {
+		DRM_DEV_ERROR(minor->dev->dev, "could not install rd debugfs\n");
+		return ret;
+	}
+
+	ret = msm_perf_debugfs_init(minor);
+	if (ret) {
+		DRM_DEV_ERROR(minor->dev->dev, "could not install perf debugfs\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+int msm_debugfs_late_init(struct drm_device *dev)
+{
+	int ret;
+
+	ret = late_init_minor(dev->primary);
+	if (ret)
+		return ret;
+	ret = late_init_minor(dev->render);
+	return ret;
+}
+#else /* ! CONFIG_DRM_MSM_ADRENO */
+static void msm_debugfs_gpu_init(struct drm_minor *minor)
+{
+}
+#endif /* CONFIG_DRM_MSM_ADRENO */
+
 #ifdef CONFIG_DRM_MSM_KMS
 static int msm_fb_show(struct seq_file *m, void *arg)
 {
@@ -294,70 +365,6 @@ static struct drm_info_list msm_debugfs_list[] = {
 		{ "mm", msm_mm_show },
 };
 
-static int late_init_minor(struct drm_minor *minor)
-{
-	struct drm_device *dev = minor->dev;
-	struct msm_drm_private *priv = dev->dev_private;
-	int ret;
-
-	if (!minor)
-		return 0;
-
-	if (!priv->gpu_pdev)
-		return 0;
-
-	ret = msm_rd_debugfs_init(minor);
-	if (ret) {
-		DRM_DEV_ERROR(minor->dev->dev, "could not install rd debugfs\n");
-		return ret;
-	}
-
-	ret = msm_perf_debugfs_init(minor);
-	if (ret) {
-		DRM_DEV_ERROR(minor->dev->dev, "could not install perf debugfs\n");
-		return ret;
-	}
-
-	return 0;
-}
-
-int msm_debugfs_late_init(struct drm_device *dev)
-{
-	int ret;
-	ret = late_init_minor(dev->primary);
-	if (ret)
-		return ret;
-	ret = late_init_minor(dev->render);
-	return ret;
-}
-
-static void msm_debugfs_gpu_init(struct drm_minor *minor)
-{
-	struct drm_device *dev = minor->dev;
-	struct msm_drm_private *priv = dev->dev_private;
-	struct dentry *gpu_devfreq;
-
-	debugfs_create_file("gpu", S_IRUSR, minor->debugfs_root,
-		dev, &msm_gpu_fops);
-
-	debugfs_create_u32("hangcheck_period_ms", 0600, minor->debugfs_root,
-		&priv->hangcheck_period);
-
-	debugfs_create_bool("disable_err_irq", 0600, minor->debugfs_root,
-		&priv->disable_err_irq);
-
-	gpu_devfreq = debugfs_create_dir("devfreq", minor->debugfs_root);
-
-	debugfs_create_bool("idle_clamp",0600, gpu_devfreq,
-			    &priv->gpu_clamp_to_idle);
-
-	debugfs_create_u32("upthreshold",0600, gpu_devfreq,
-			   &priv->gpu_devfreq_config.upthreshold);
-
-	debugfs_create_u32("downdifferential",0600, gpu_devfreq,
-			   &priv->gpu_devfreq_config.downdifferential);
-}
-
 void msm_debugfs_init(struct drm_minor *minor)
 {
 	struct drm_device *dev = minor->dev;
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 45953affccc73c622a805a139902ebedcdf38b86..97f2595a4a83ea04361c3aed63439d4e5e032a60 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -59,7 +59,11 @@ static bool modeset = true;
 MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=on (default), 0=disable)");
 module_param(modeset, bool, 0600);
 
+#ifndef CONFIG_DRM_MSM_ADRENO
+static bool separate_gpu_drm = true;
+#else
 static bool separate_gpu_drm;
+#endif
 MODULE_PARM_DESC(separate_gpu_drm, "Use separate DRM device for the GPU (0=single DRM device for both GPU and display (default), 1=two DRM devices)");
 module_param(separate_gpu_drm, bool, 0400);
 
@@ -320,6 +324,22 @@ static void load_gpu(struct drm_device *dev)
 	mutex_unlock(&init_lock);
 }
 
+void __msm_file_private_destroy(struct kref *kref)
+{
+	struct msm_file_private *ctx = container_of(kref,
+		struct msm_file_private, ref);
+
+	msm_submitqueue_fini(ctx);
+	msm_gem_address_space_put(ctx->aspace);
+
+#ifdef CONFIG_DRM_MSM_ADRENO
+	kfree(ctx->comm);
+	kfree(ctx->cmdline);
+#endif
+
+	kfree(ctx);
+}
+
 static int context_init(struct drm_device *dev, struct drm_file *file)
 {
 	static atomic_t ident = ATOMIC_INIT(0);
@@ -330,9 +350,6 @@ static int context_init(struct drm_device *dev, struct drm_file *file)
 	if (!ctx)
 		return -ENOMEM;
 
-	INIT_LIST_HEAD(&ctx->submitqueues);
-	rwlock_init(&ctx->queuelock);
-
 	kref_init(&ctx->ref);
 	msm_submitqueue_init(dev, ctx);
 
@@ -717,6 +734,7 @@ static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
 	return ret;
 }
 
+#ifdef CONFIG_DRM_MSM_ADRENO
 static int wait_fence(struct msm_gpu_submitqueue *queue, uint32_t fence_id,
 		      ktime_t timeout, uint32_t flags)
 {
@@ -787,6 +805,7 @@ static int msm_ioctl_wait_fence(struct drm_device *dev, void *data,
 
 	return ret;
 }
+#endif
 
 static int msm_ioctl_gem_madvise(struct drm_device *dev, void *data,
 		struct drm_file *file)
@@ -820,6 +839,7 @@ static int msm_ioctl_gem_madvise(struct drm_device *dev, void *data,
 }
 
 
+#ifdef CONFIG_DRM_MSM_ADRENO
 static int msm_ioctl_submitqueue_new(struct drm_device *dev, void *data,
 		struct drm_file *file)
 {
@@ -845,6 +865,7 @@ static int msm_ioctl_submitqueue_close(struct drm_device *dev, void *data,
 
 	return msm_submitqueue_remove(file->driver_priv, id);
 }
+#endif
 
 static const struct drm_ioctl_desc msm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(MSM_GET_PARAM,    msm_ioctl_get_param,    DRM_RENDER_ALLOW),
@@ -853,12 +874,14 @@ static const struct drm_ioctl_desc msm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(MSM_GEM_INFO,     msm_ioctl_gem_info,     DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(MSM_GEM_CPU_PREP, msm_ioctl_gem_cpu_prep, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(MSM_GEM_CPU_FINI, msm_ioctl_gem_cpu_fini, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(MSM_GEM_MADVISE,  msm_ioctl_gem_madvise,  DRM_RENDER_ALLOW),
+#ifdef CONFIG_DRM_MSM_ADRENO
 	DRM_IOCTL_DEF_DRV(MSM_GEM_SUBMIT,   msm_ioctl_gem_submit,   DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(MSM_WAIT_FENCE,   msm_ioctl_wait_fence,   DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(MSM_GEM_MADVISE,  msm_ioctl_gem_madvise,  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_NEW,   msm_ioctl_submitqueue_new,   DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_CLOSE, msm_ioctl_submitqueue_close, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_QUERY, msm_ioctl_submitqueue_query, DRM_RENDER_ALLOW),
+#endif
 };
 
 static void msm_show_fdinfo(struct drm_printer *p, struct drm_file *file)
@@ -866,10 +889,8 @@ static void msm_show_fdinfo(struct drm_printer *p, struct drm_file *file)
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
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 1ff799f0c78133e73c6857e3692c2dca2c5e60fa..ba4012ea2f6845061380ae2daa8eb3a0999f2e9e 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -424,6 +424,9 @@ static inline void msm_mdss_unregister(void) {}
 
 #ifdef CONFIG_DEBUG_FS
 void msm_framebuffer_describe(struct drm_framebuffer *fb, struct seq_file *m);
+#endif
+
+#if defined(CONFIG_DEBUG_FS) && defined(CONFIG_DRM_MSM_ADRENO)
 int msm_debugfs_late_init(struct drm_device *dev);
 int msm_rd_debugfs_init(struct drm_minor *minor);
 void msm_rd_debugfs_cleanup(struct msm_drm_private *priv);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index e25009150579c08f7b98d4461a75757d1093734a..6db6ef6b02db2450be68cc27e65be9aced6da7ce 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -358,12 +358,13 @@ struct msm_gpu_perfcntr {
  * @seqno:        unique per process seqno
  */
 struct msm_file_private {
-	rwlock_t queuelock;
-	struct list_head submitqueues;
-	int queueid;
 	struct msm_gem_address_space *aspace;
 	struct kref ref;
 	int seqno;
+#ifdef CONFIG_DRM_MSM_ADRENO
+	rwlock_t queuelock;
+	struct list_head submitqueues;
+	int queueid;
 
 	/**
 	 * sysprof:
@@ -425,6 +426,7 @@ struct msm_file_private {
 	 * level.
 	 */
 	struct drm_sched_entity *entities[NR_SCHED_PRIORITIES * MSM_GPU_MAX_RINGS];
+#endif
 
 	/**
 	 * ctx_mem:
@@ -559,6 +561,7 @@ struct msm_gpu_state {
 	struct msm_gpu_state_bo *bos;
 };
 
+#ifdef CONFIG_DRM_MSM_ADRENO
 static inline void gpu_write(struct msm_gpu *gpu, u32 reg, u32 data)
 {
 	writel(data, gpu->mmio + (reg << 2));
@@ -612,6 +615,7 @@ void msm_gpu_show_fdinfo(struct msm_gpu *gpu, struct msm_file_private *ctx,
 			 struct drm_printer *p);
 
 int msm_submitqueue_init(struct drm_device *drm, struct msm_file_private *ctx);
+void msm_submitqueue_fini(struct msm_file_private *ctx);
 struct msm_gpu_submitqueue *msm_submitqueue_get(struct msm_file_private *ctx,
 		u32 id);
 int msm_submitqueue_create(struct drm_device *drm,
@@ -624,8 +628,42 @@ void msm_submitqueue_close(struct msm_file_private *ctx);
 
 void msm_submitqueue_destroy(struct kref *kref);
 
+static inline void msm_submitqueue_put(struct msm_gpu_submitqueue *queue)
+{
+	if (queue)
+		kref_put(&queue->ref, msm_submitqueue_destroy);
+}
+
 int msm_file_private_set_sysprof(struct msm_file_private *ctx,
 				 struct msm_gpu *gpu, int sysprof);
+#else
+static inline void msm_gpu_show_fdinfo(struct msm_gpu *gpu,
+				       struct msm_file_private *ctx,
+				       struct drm_printer *p)
+{
+}
+
+static inline int msm_submitqueue_init(struct drm_device *drm, struct msm_file_private *ctx)
+{
+	return -ENXIO;
+}
+
+static inline void msm_submitqueue_fini(struct msm_file_private *ctx)
+{
+}
+
+static inline void msm_submitqueue_close(struct msm_file_private *ctx)
+{
+}
+
+static inline int msm_file_private_set_sysprof(struct msm_file_private *ctx,
+					       struct msm_gpu *gpu,
+					       int sysprof)
+{
+	return 0;
+}
+#endif
+
 void __msm_file_private_destroy(struct kref *kref);
 
 static inline void msm_file_private_put(struct msm_file_private *ctx)
@@ -640,6 +678,7 @@ static inline struct msm_file_private *msm_file_private_get(
 	return ctx;
 }
 
+#ifdef CONFIG_DRM_MSM_ADRENO
 void msm_devfreq_init(struct msm_gpu *gpu);
 void msm_devfreq_cleanup(struct msm_gpu *gpu);
 void msm_devfreq_resume(struct msm_gpu *gpu);
@@ -671,12 +710,6 @@ struct msm_gpu *adreno_load_gpu(struct drm_device *dev);
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
@@ -712,5 +745,25 @@ static inline void msm_gpu_crashstate_put(struct msm_gpu *gpu)
 #define check_apriv(gpu, flags) \
 	(((gpu)->hw_apriv ? MSM_BO_MAP_PRIV : 0) | (flags))
 
+#else /* ! CONFIG_DRM_MSM_ADRENO */
+static inline struct msm_gem_address_space *
+msm_gpu_create_private_address_space(struct msm_gpu *gpu, struct task_struct *task)
+{
+	return NULL;
+}
+
+static inline struct msm_gpu *adreno_load_gpu(struct drm_device *dev)
+{
+	return NULL;
+}
+
+static inline void __init adreno_register(void)
+{
+}
+
+static inline void __exit adreno_unregister(void)
+{
+}
+#endif /* ! CONFIG_DRM_MSM_ADRENO */
 
 #endif /* __MSM_GPU_H__ */
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 7fed1de63b5d9e20df88db8d9ca6ea45ec1a2846..dfb6f42a963ee3d314f11716d8649f3bf82a3eb6 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -46,10 +46,8 @@ int msm_file_private_set_sysprof(struct msm_file_private *ctx,
 	return 0;
 }
 
-void __msm_file_private_destroy(struct kref *kref)
+void msm_submitqueue_fini(struct msm_file_private *ctx)
 {
-	struct msm_file_private *ctx = container_of(kref,
-		struct msm_file_private, ref);
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(ctx->entities); i++) {
@@ -59,11 +57,6 @@ void __msm_file_private_destroy(struct kref *kref)
 		drm_sched_entity_destroy(ctx->entities[i]);
 		kfree(ctx->entities[i]);
 	}
-
-	msm_gem_address_space_put(ctx->aspace);
-	kfree(ctx->comm);
-	kfree(ctx->cmdline);
-	kfree(ctx);
 }
 
 void msm_submitqueue_destroy(struct kref *kref)
@@ -226,6 +219,9 @@ int msm_submitqueue_init(struct drm_device *drm, struct msm_file_private *ctx)
 	struct msm_drm_private *priv = drm->dev_private;
 	int default_prio, max_priority;
 
+	INIT_LIST_HEAD(&ctx->submitqueues);
+	rwlock_init(&ctx->queuelock);
+
 	if (!priv->gpu)
 		return -ENODEV;
 

-- 
2.39.5

