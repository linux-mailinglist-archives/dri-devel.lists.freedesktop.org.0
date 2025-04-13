Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3B6A8728A
	for <lists+dri-devel@lfdr.de>; Sun, 13 Apr 2025 18:33:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C9410E3AB;
	Sun, 13 Apr 2025 16:33:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DNwVQkEN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08ACA10E260
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Apr 2025 16:33:10 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53DBrG1D009861
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Apr 2025 16:33:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 azFBwHLQXPerpMmdfRciqUITnxOyygfssSyIhnJzkY0=; b=DNwVQkENUKAXuJeH
 2TB2JPOfq2mQRr3VAAzuKdvOg6R5Ub6CTUXnZiuOIbYbjNvnOUsjr9Tff0Zhw9ad
 lHF1tnbXvvktP3qazumPBgVJxGfUbodAK0xI6duPeAnxDIXHeP4EJCZQkPbvyf3G
 LoxWXF9MOdDX09bYp2hhFDwMNByxBCakkWBTmbjFLnx/WxLF8J1yoaPkuiUOvm8n
 ylMWdWePMWKisVIVJMiqFCzSPlCuakomfkKP3PL0PVa6KyXE7MG2xf137iRkZC6J
 +x954tSL474lN9Y+dpnnNvV5AWUhy1X5jmROOXUudUUbvjqPWk6lz4Awd7QxO3Yn
 fNa8gQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhfct8qa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Apr 2025 16:33:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c543ab40d3so545556385a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Apr 2025 09:33:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744561986; x=1745166786;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=azFBwHLQXPerpMmdfRciqUITnxOyygfssSyIhnJzkY0=;
 b=mRL0hf1o+lbbrL8ohwYe5kZHnjPNVayJHv/IqqpGWC2IINTsC1lU4keoWWTzSAbXwG
 NV9xf3SMv0CNH6wmQNpDAP54qg2mN+eKby6el5mMZ0lPF6Fz0WMJcvFmdRZ2F9Xv+R4N
 9ved7qUXPJoH5rGpOZiBQuKL237uzwqYwoDB/VIgjmaCUUBc6ZM+zMkDW7HeLqp68bTd
 rj82QDZ8X+htLtDKV5p/r4xrU3UVvO9vMPTFKAWa64JQdRViCzzO4lEyYMNd0jpp4NDa
 7yN0WpCf9ZlDshM/xbSt2iXvQFHgkKn9tj7+dR8TAo7V4Cyu52ob7iTFWIreFdzSV/7p
 CwTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKqkxvwrqCJ+TSryvp+iNh4fLhdLGIaNu5ps4nttBx8YJqh4+ik8EwzQBEElcMByc17a7ORl8xwrU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxD4rLO4j9YPC0/Mi3DFNbGPUSUgHb4hwtLTQMXl8vG4qnJdCjo
 5fvA9eoVo3S2xUf3A40ZAIhaZMKNt4wz51pLwkSzWRzS7X0RZ17RWv/fwA5tYYUhqFIxm7tIEzS
 jUJrXRaAZx3JA5+z9qpuzbYScsSOIty8NOZCYKs9AKLLThX6zXbfEZsl4P9x3TfcKN/s=
X-Gm-Gg: ASbGncvPsCirU1jhEYdLGylNvTF9N0an46oLlhcumx7uQux7VFxB0+b4+b3mpht4sr7
 Tb++3agfmj0bMcxkvty7Vxtqy3olTSIkl5XmZzk9s/rKOK52S3JWuowrgI2uNWyB4C+SpUDXGzL
 hcfBTiilxx2Ajcv2mqY4r7owC4FNKhs6IGb3wHT7UsWl1+ZzPQs+nmfaycW9n00LTiXKtiKiGl4
 IaHlfl1p4yBJ8DNT31nw2xx6atLNnlLA6F/5ipEzeeDS//L2HHC5yYkYjlnudk8SnNuWdDocfY4
 JZjVIE9AfCuZvPxqF9h1EonVFYS6WgLuvVc1aTqUHC0yfWQBhOG2Alfpv6dI0HDP/Y8MM5RILWE
 1MjnxO1QiiAc7nomaQEIX4dZn
X-Received: by 2002:a05:620a:4724:b0:7c5:a25a:f0f3 with SMTP id
 af79cd13be357-7c7af0be327mr1526502985a.8.1744561985607; 
 Sun, 13 Apr 2025 09:33:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLMJzIEl2kCOydIdEvp7YhZGpk66QEPrtOYb7AsG7UxmXny/eCUtxvHFELtGmxYMFRFk9lYg==
X-Received: by 2002:a05:620a:4724:b0:7c5:a25a:f0f3 with SMTP id
 af79cd13be357-7c7af0be327mr1526497485a.8.1744561984973; 
 Sun, 13 Apr 2025 09:33:04 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f464e9812sm13345431fa.49.2025.04.13.09.33.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Apr 2025 09:33:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 13 Apr 2025 19:32:57 +0300
Subject: [PATCH 3/7] drm/msm: make it possible to disable KMS-related code.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250413-msm-gpu-split-v1-3-1132f4b616c7@oss.qualcomm.com>
References: <20250413-msm-gpu-split-v1-0-1132f4b616c7@oss.qualcomm.com>
In-Reply-To: <20250413-msm-gpu-split-v1-0-1132f4b616c7@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11059;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=b7aQBivum8PLjThk33cbBnwZSmkIYuDPMqj++mqttyQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn++c5Vo6fgTGrRaMVfNNNQ6hesCZgIlTcDd3f3
 6N4S7H4C4mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/vnOQAKCRCLPIo+Aiko
 1RZiCACeKHml970t5zGfV77VMeom3lsbrw3F2HGOEzvJgLmVdetDwLN5tCfcwX16rZhro+CAr2i
 e+6QWI7LvoAWOj7kV44RZaZMdeDLjWKXXAXeSs+AplJde7N5ziEyuqUXUrE4mHm+fiVN3brgaLN
 WgnxPmaA0HbNUTU5Bk9xzm08NkklG2FsYjTjsdZYCjjsTP1ChnI49x56B39pri/LhKQ8gUj07gM
 8bULuRO/XLvVTgtA8gTenRhv6vTBCpMR6RSd72+tNDFHW3+7ToagiATTUdU7o+casBBhoJBCud7
 bXt6nznv7qoalGUJbIy9CiB83D/ZjZdmYwy7rWcQ8hWe9r1s
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=CfUI5Krl c=1 sm=1 tr=0 ts=67fbe745 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=N8FS_TdUqCTfgw2huykA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: sTmmLCcCH7nrLu4zjMJUlb62Dc9nC8dJ
X-Proofpoint-ORIG-GUID: sTmmLCcCH7nrLu4zjMJUlb62Dc9nC8dJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-13_08,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0 clxscore=1015
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504130127
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
 drivers/gpu/drm/msm/Kconfig       | 14 ++++++
 drivers/gpu/drm/msm/Makefile      | 16 +++----
 drivers/gpu/drm/msm/dp/dp_debug.c |  4 ++
 drivers/gpu/drm/msm/msm_debugfs.c | 92 ++++++++++++++++++++++-----------------
 drivers/gpu/drm/msm/msm_drv.h     |  7 ++-
 drivers/gpu/drm/msm/msm_kms.h     | 23 ++++++++++
 6 files changed, 108 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 974bc7c0ea761147d3326bdce9039d6f26f290d0..0be31c5acdd1b7ef80f0e820ff430692616122e0 100644
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
 	select RATIONAL
 	default y
 	help
@@ -114,6 +126,7 @@ config DRM_MSM_DP
 config DRM_MSM_DSI
 	bool "Enable DSI support in MSM DRM driver"
 	depends on DRM_MSM
+	depends on DRM_MSM_KMS
 	select DRM_PANEL
 	select DRM_MIPI_DSI
 	select DRM_DISPLAY_DSC_HELPER
@@ -169,6 +182,7 @@ config DRM_MSM_DSI_7NM_PHY
 config DRM_MSM_HDMI
 	bool "Enable HDMI support in MSM DRM driver"
 	depends on DRM_MSM
+	depends on DRM_MSM_KMS
 	default y
 	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_DISPLAY_HDMI_STATE_HELPER
diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 5df20cbeafb8bf07c825a1fd72719d5a56c38613..3749b0af779e73a93d7c219d3fbd3865b9296b50 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -101,18 +101,15 @@ msm-display-$(CONFIG_DRM_MSM_DPU) += \
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
@@ -123,21 +120,24 @@ msm-y += \
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
index a65077855201746c37ee742364b61116565f3794..5f4d3f050c1fde71c405a1ebf516f4f5a396cfc4 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -88,6 +88,7 @@ struct msm_drm_private {
 	/* subordinate devices, if present: */
 	struct platform_device *gpu_pdev;
 
+#ifdef CONFIG_DRM_MSM_KMS
 	/* possibly this should be in the kms component, but it is
 	 * shared by both mdp4 and mdp5..
 	 */
@@ -97,6 +98,7 @@ struct msm_drm_private {
 	struct msm_dsi *dsi[MSM_DSI_CONTROLLER_COUNT];
 
 	struct msm_dp *dp[MSM_DP_CONTROLLER_COUNT];
+#endif
 
 	/* when we have more than one 'msm_gpu' these need to be an array: */
 	struct msm_gpu *gpu;
@@ -177,11 +179,13 @@ struct msm_drm_private {
 		struct mutex lock;
 	} lru;
 
+#ifdef CONFIG_DRM_MSM_KMS
 	struct workqueue_struct *wq;
 
 	unsigned int num_crtcs;
 
 	struct msm_drm_thread event_thread[MAX_CRTCS];
+#endif
 
 	/* VRAM carveout, used when no IOMMU: */
 	struct {
@@ -275,7 +279,7 @@ struct drm_framebuffer *msm_framebuffer_create(struct drm_device *dev,
 struct drm_framebuffer * msm_alloc_stolen_fb(struct drm_device *dev,
 		int w, int h, int p, uint32_t format);
 
-#ifdef CONFIG_DRM_FBDEV_EMULATION
+#ifdef CONFIG_DRM_MSM_KMS_FBDEV
 int msm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 				 struct drm_fb_helper_surface_size *sizes);
 #define MSM_FBDEV_DRIVER_OPS \
@@ -360,6 +364,7 @@ static inline const char *msm_dsi_get_te_source(struct msm_dsi *msm_dsi)
 }
 #endif
 
+struct msm_dp;
 #ifdef CONFIG_DRM_MSM_DP
 int __init msm_dp_register(void);
 void __exit msm_dp_unregister(void);
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 057b20367724a4ca60f2d60c038077dbcc1c7abc..aabbe851f0d533cca4a2ca00b79fbf8603870be3 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -13,6 +13,8 @@
 
 #include "msm_drv.h"
 
+#ifdef CONFIG_DRM_MSM_KMS
+
 #define MAX_PLANE	4
 
 /* As there are different display controller blocks depending on the
@@ -196,4 +198,25 @@ void msm_drm_kms_post_init(struct device *dev);
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

