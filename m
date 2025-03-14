Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C64A60D72
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 10:37:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D6F10E97F;
	Fri, 14 Mar 2025 09:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jCrD7s4u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DECF10E97C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 09:37:10 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52E7l2EI026487
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 09:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CBpK3t6rlGZcq0SZKc89sdkSddHeB+d6hiOpvUq4aM8=; b=jCrD7s4ukTI22pvP
 oK02UbmVV8ND9WYJiKuCNqAEauB1abfVc0RQ08+f9yvgWEXSfN3iFBsViCL9hQ5g
 b+4kbjEcgrbaggU28ZAjSRu0mopcsNSda1AyDTk6uW/v8UbD7+cexvmS4TQJaaPe
 1iAF5B/eCKDbhPRsQYzyuCJCz3d9nQhYKp65lLVoUsJI0hXRuVOtgj79A3FOnyJS
 JjtcEShQyIrJCGZVVFU8Snq3dylskllAv1khwAv3AHW5cH+YuhoWzHf3ZZQ3a+jp
 SGWpSmiV+enxJPzIAzmhgBbsBpjGPaCY6Xi0IsKovaJhqWhqlkONQNMElIVUfbHy
 0wY5pw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45cgcd8ae3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 09:37:09 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6e91ee078aaso39881096d6.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 02:37:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741945028; x=1742549828;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CBpK3t6rlGZcq0SZKc89sdkSddHeB+d6hiOpvUq4aM8=;
 b=DBvuSdYPv53hp6t3lw8FMogSsFG6w2TO7ggiEH6d868Y7kQO4LQlVBQNyi+1km8ofD
 CcPucKY2w4GH3SHU1wwN6mKWuCNDTHcSLVEl/BEUSp8tIAMvXCO8agb7viG0H5Tx4DYq
 ZQm7m+92oZ7obx9mSdrErF4VFOFMsy6nNB1EIb/V2psY4JS0c7brYUYvLz/+Z82Cvnr4
 mLCGXxS+8M6WP2D/2GJYk3rxvNAwKU3v6i9lKwhGeFWoA/THabfZe63MRvJIFxZden9i
 7oyYVAUzHbpIqFZom5IfMONNa4J3AfqWd+xkQYFAO7OYxBEe0EPnXBCRvWUu2kp+TfD3
 ektw==
X-Gm-Message-State: AOJu0YyWKkg316K9hGqZoDpnRC2x4YwpVonBzjnkovKVJpq5iOydOnD9
 XuQps8W3+64x/zDzq+QIU8TJUhfyxY06iySGs/ujyTPQ1JgmSuQBm6xRTrpydlxvdRoBwTF53MS
 oR2KK7SaAAwrTymVHIQEZZd5HkQkeXo+IrKNJmwaiu8XkA2lcEEM7dY+0N08juxRNKHc=
X-Gm-Gg: ASbGncuJolg+++G1JjusXFsrHF0ZBrLDBYuadfQoGzOkYWpLqb3DBUGiE8yIHR0Ua6S
 d6f1LWoE7hZxnVF544RpyZX990PySe3I7r/FJ07WGa4CL1BaatTZvlXi+9TDGkrwXRvhVjT7VlK
 9N0L8pALBC8aSXnl2+8Yw6zoly4x7H7aWydXHu91Dw2Nj4yHGm6eGVfqMVtIoCnXsF406KK0fz4
 Ao5BAbrmpUi1TRXncbBN3nnGYERgcug9kBRHg2vVlXNFCUJvHx2DGKaFVSIA0Nst2d76rhXl0no
 cXltoWE37gWhufMhoStO2O4bx/9rPlL6e+wwSvTphQWg9R7PWHy3j8qBA/6LK21SPNRVm1Bb10K
 uKI7r0kecCIyQ6/hTJiErroNhwvJm
X-Received: by 2002:ad4:5dc8:0:b0:6e8:fee2:aae6 with SMTP id
 6a1803df08f44-6eaeaaf404cmr18754596d6.41.1741945028149; 
 Fri, 14 Mar 2025 02:37:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqe6//rANJI0oTLkkxcEbigu337gvRXL5ms7i67EIhYK/9gg+s7ZHXLkBrgkcmQ6aV1Hacrg==
X-Received: by 2002:ad4:5dc8:0:b0:6e8:fee2:aae6 with SMTP id
 6a1803df08f44-6eaeaaf404cmr18754286d6.41.1741945027739; 
 Fri, 14 Mar 2025 02:37:07 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba7a8368sm478585e87.32.2025.03.14.02.37.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 02:37:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 14 Mar 2025 11:36:51 +0200
Subject: [PATCH v6 4/4] drm/msm/dp: reuse generic HDMI codec implementation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-dp-hdmi-audio-v6-4-dbd228fa73d7@oss.qualcomm.com>
References: <20250314-dp-hdmi-audio-v6-0-dbd228fa73d7@oss.qualcomm.com>
In-Reply-To: <20250314-dp-hdmi-audio-v6-0-dbd228fa73d7@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Hermes Wu <Hermes.wu@ite.com.tw>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13442;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=owywd2MhluQ5wnxzrezZCXfehvG7zcy7JkjEZ8baiIs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn0/ix47pah4PSeLlXGTCnDqKoDcYmUFpBphGxj
 ilb7i2UGe2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9P4sQAKCRCLPIo+Aiko
 1QtbB/sFiiJghIIso4uDNmAwDKJ9HTgPocY+wzAp4lDiBKxOpri1yxyDMN4YzqHq3BLy4sAaIOy
 DI0HY+tSeqL0qhlat4eO0tnr+U6GdEuEOTjN7jSTyb8eWdTjMnu3xCyK/qc+j5R+WHbHhNUN60u
 WUOrSKC6XyaR4DjyPV9sj4QSDayUhLGRIaRkiOYwhU3Fzt3wjXd1sWBEJ4EU5RBu3a1FdvRawC7
 yT0IgIwkoOcqBAMCpeKTbtrxtG49baN8ZWbf7/+TYb7IbOczVwZ/SwJEn+xgLmpd5jp8miCuEQ1
 sig3bVj7sUXgMHE37IQcV/ZoTz2Jjvy0SEKpAW57LBW3iNKW
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=UJjdHDfy c=1 sm=1 tr=0 ts=67d3f8c5 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=rffrVGSa7g4bM9eyZP0A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: pAryOmVfux1awae6JU5wbL2n5qQzx2fs
X-Proofpoint-GUID: pAryOmVfux1awae6JU5wbL2n5qQzx2fs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_04,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140075
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

From: Dmitry Baryshkov <lumag@kernel.org>

The MSM DisplayPort driver implements several HDMI codec functions
in the driver, e.g. it manually manages HDMI codec device registration,
returning ELD and plugged_cb support. In order to reduce code
duplication reuse drm_hdmi_audio_* helpers and drm_bridge_connector
integration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Kconfig         |   1 +
 drivers/gpu/drm/msm/dp/dp_audio.c   | 131 ++++--------------------------------
 drivers/gpu/drm/msm/dp/dp_audio.h   |  27 ++------
 drivers/gpu/drm/msm/dp/dp_display.c |  28 ++------
 drivers/gpu/drm/msm/dp/dp_display.h |   6 --
 drivers/gpu/drm/msm/dp/dp_drm.c     |   8 +++
 6 files changed, 31 insertions(+), 170 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 974bc7c0ea761147d3326bdce9039d6f26f290d0..7f127e2ae44292f8f5c7ff6a9251c3d7ec8c9f58 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -104,6 +104,7 @@ config DRM_MSM_DPU
 config DRM_MSM_DP
 	bool "Enable DisplayPort support in MSM DRM driver"
 	depends on DRM_MSM
+	select DRM_DISPLAY_HDMI_AUDIO_HELPER
 	select RATIONAL
 	default y
 	help
diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index 70fdc9fe228a7149546accd8479a9e4397f3d5dd..f8bfb908f9b4bf93ad5480f0785e3aed23dde160 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -13,13 +13,13 @@
 
 #include "dp_catalog.h"
 #include "dp_audio.h"
+#include "dp_drm.h"
 #include "dp_panel.h"
 #include "dp_reg.h"
 #include "dp_display.h"
 #include "dp_utils.h"
 
 struct msm_dp_audio_private {
-	struct platform_device *audio_pdev;
 	struct platform_device *pdev;
 	struct drm_device *drm_dev;
 	struct msm_dp_catalog *catalog;
@@ -160,24 +160,11 @@ static void msm_dp_audio_enable(struct msm_dp_audio_private *audio, bool enable)
 	msm_dp_catalog_audio_enable(catalog, enable);
 }
 
-static struct msm_dp_audio_private *msm_dp_audio_get_data(struct platform_device *pdev)
+static struct msm_dp_audio_private *msm_dp_audio_get_data(struct msm_dp *msm_dp_display)
 {
 	struct msm_dp_audio *msm_dp_audio;
-	struct msm_dp *msm_dp_display;
-
-	if (!pdev) {
-		DRM_ERROR("invalid input\n");
-		return ERR_PTR(-ENODEV);
-	}
-
-	msm_dp_display = platform_get_drvdata(pdev);
-	if (!msm_dp_display) {
-		DRM_ERROR("invalid input\n");
-		return ERR_PTR(-ENODEV);
-	}
 
 	msm_dp_audio = msm_dp_display->msm_dp_audio;
-
 	if (!msm_dp_audio) {
 		DRM_ERROR("invalid msm_dp_audio data\n");
 		return ERR_PTR(-EINVAL);
@@ -186,68 +173,16 @@ static struct msm_dp_audio_private *msm_dp_audio_get_data(struct platform_device
 	return container_of(msm_dp_audio, struct msm_dp_audio_private, msm_dp_audio);
 }
 
-static int msm_dp_audio_hook_plugged_cb(struct device *dev, void *data,
-		hdmi_codec_plugged_cb fn,
-		struct device *codec_dev)
-{
-
-	struct platform_device *pdev;
-	struct msm_dp *msm_dp_display;
-
-	pdev = to_platform_device(dev);
-	if (!pdev) {
-		pr_err("invalid input\n");
-		return -ENODEV;
-	}
-
-	msm_dp_display = platform_get_drvdata(pdev);
-	if (!msm_dp_display) {
-		pr_err("invalid input\n");
-		return -ENODEV;
-	}
-
-	return msm_dp_display_set_plugged_cb(msm_dp_display, fn, codec_dev);
-}
-
-static int msm_dp_audio_get_eld(struct device *dev,
-	void *data, uint8_t *buf, size_t len)
-{
-	struct platform_device *pdev;
-	struct msm_dp *msm_dp_display;
-
-	pdev = to_platform_device(dev);
-
-	if (!pdev) {
-		DRM_ERROR("invalid input\n");
-		return -ENODEV;
-	}
-
-	msm_dp_display = platform_get_drvdata(pdev);
-	if (!msm_dp_display) {
-		DRM_ERROR("invalid input\n");
-		return -ENODEV;
-	}
-
-	mutex_lock(&msm_dp_display->connector->eld_mutex);
-	memcpy(buf, msm_dp_display->connector->eld,
-		min(sizeof(msm_dp_display->connector->eld), len));
-	mutex_unlock(&msm_dp_display->connector->eld_mutex);
-
-	return 0;
-}
-
-int msm_dp_audio_hw_params(struct device *dev,
-	void *data,
-	struct hdmi_codec_daifmt *daifmt,
-	struct hdmi_codec_params *params)
+int msm_dp_audio_prepare(struct drm_connector *connector,
+			 struct drm_bridge *bridge,
+			 struct hdmi_codec_daifmt *daifmt,
+			 struct hdmi_codec_params *params)
 {
 	int rc = 0;
 	struct msm_dp_audio_private *audio;
-	struct platform_device *pdev;
 	struct msm_dp *msm_dp_display;
 
-	pdev = to_platform_device(dev);
-	msm_dp_display = platform_get_drvdata(pdev);
+	msm_dp_display = to_dp_bridge(bridge)->msm_dp_display;
 
 	/*
 	 * there could be cases where sound card can be opened even
@@ -262,7 +197,7 @@ int msm_dp_audio_hw_params(struct device *dev,
 		goto end;
 	}
 
-	audio = msm_dp_audio_get_data(pdev);
+	audio = msm_dp_audio_get_data(msm_dp_display);
 	if (IS_ERR(audio)) {
 		rc = PTR_ERR(audio);
 		goto end;
@@ -281,15 +216,14 @@ int msm_dp_audio_hw_params(struct device *dev,
 	return rc;
 }
 
-static void msm_dp_audio_shutdown(struct device *dev, void *data)
+void msm_dp_audio_shutdown(struct drm_connector *connector,
+			   struct drm_bridge *bridge)
 {
 	struct msm_dp_audio_private *audio;
-	struct platform_device *pdev;
 	struct msm_dp *msm_dp_display;
 
-	pdev = to_platform_device(dev);
-	msm_dp_display = platform_get_drvdata(pdev);
-	audio = msm_dp_audio_get_data(pdev);
+	msm_dp_display = to_dp_bridge(bridge)->msm_dp_display;
+	audio = msm_dp_audio_get_data(msm_dp_display);
 	if (IS_ERR(audio)) {
 		DRM_ERROR("failed to get audio data\n");
 		return;
@@ -311,47 +245,6 @@ static void msm_dp_audio_shutdown(struct device *dev, void *data)
 	msm_dp_display_signal_audio_complete(msm_dp_display);
 }
 
-static const struct hdmi_codec_ops msm_dp_audio_codec_ops = {
-	.hw_params = msm_dp_audio_hw_params,
-	.audio_shutdown = msm_dp_audio_shutdown,
-	.get_eld = msm_dp_audio_get_eld,
-	.hook_plugged_cb = msm_dp_audio_hook_plugged_cb,
-};
-
-static struct hdmi_codec_pdata codec_data = {
-	.ops = &msm_dp_audio_codec_ops,
-	.max_i2s_channels = 8,
-	.i2s = 1,
-};
-
-void msm_dp_unregister_audio_driver(struct device *dev, struct msm_dp_audio *msm_dp_audio)
-{
-	struct msm_dp_audio_private *audio_priv;
-
-	audio_priv = container_of(msm_dp_audio, struct msm_dp_audio_private, msm_dp_audio);
-
-	if (audio_priv->audio_pdev) {
-		platform_device_unregister(audio_priv->audio_pdev);
-		audio_priv->audio_pdev = NULL;
-	}
-}
-
-int msm_dp_register_audio_driver(struct device *dev,
-		struct msm_dp_audio *msm_dp_audio)
-{
-	struct msm_dp_audio_private *audio_priv;
-
-	audio_priv = container_of(msm_dp_audio,
-			struct msm_dp_audio_private, msm_dp_audio);
-
-	audio_priv->audio_pdev = platform_device_register_data(dev,
-						HDMI_CODEC_DRV_NAME,
-						PLATFORM_DEVID_AUTO,
-						&codec_data,
-						sizeof(codec_data));
-	return PTR_ERR_OR_ZERO(audio_priv->audio_pdev);
-}
-
 struct msm_dp_audio *msm_dp_audio_get(struct platform_device *pdev,
 			struct msm_dp_catalog *catalog)
 {
diff --git a/drivers/gpu/drm/msm/dp/dp_audio.h b/drivers/gpu/drm/msm/dp/dp_audio.h
index beea34cbab77f31b33873297dc454a9cee446240..58fc14693e48bff2b57ef7278983e5f21ee80ac7 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.h
+++ b/drivers/gpu/drm/msm/dp/dp_audio.h
@@ -35,23 +35,6 @@ struct msm_dp_audio {
 struct msm_dp_audio *msm_dp_audio_get(struct platform_device *pdev,
 			struct msm_dp_catalog *catalog);
 
-/**
- * msm_dp_register_audio_driver()
- *
- * Registers DP device with hdmi_codec interface.
- *
- * @dev: DP device instance.
- * @msm_dp_audio: an instance of msm_dp_audio module.
- *
- *
- * Returns the error code in case of failure, otherwise
- * zero on success.
- */
-int msm_dp_register_audio_driver(struct device *dev,
-		struct msm_dp_audio *msm_dp_audio);
-
-void msm_dp_unregister_audio_driver(struct device *dev, struct msm_dp_audio *msm_dp_audio);
-
 /**
  * msm_dp_audio_put()
  *
@@ -61,10 +44,12 @@ void msm_dp_unregister_audio_driver(struct device *dev, struct msm_dp_audio *msm
  */
 void msm_dp_audio_put(struct msm_dp_audio *msm_dp_audio);
 
-int msm_dp_audio_hw_params(struct device *dev,
-	void *data,
-	struct hdmi_codec_daifmt *daifmt,
-	struct hdmi_codec_params *params);
+int msm_dp_audio_prepare(struct drm_connector *connector,
+			 struct drm_bridge *bridge,
+			 struct hdmi_codec_daifmt *daifmt,
+			 struct hdmi_codec_params *params);
+void msm_dp_audio_shutdown(struct drm_connector *connector,
+			   struct drm_bridge *bridge);
 
 #endif /* _DP_AUDIO_H_ */
 
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bbc47d86ae9e67245c87a8365df366cce0dc529e..ece184d20c0f8bffa3c2a48216015185d6cbc99e 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -13,6 +13,7 @@
 #include <linux/delay.h>
 #include <linux/string_choices.h>
 #include <drm/display/drm_dp_aux_bus.h>
+#include <drm/display/drm_hdmi_audio_helper.h>
 #include <drm/drm_edid.h>
 
 #include "msm_drv.h"
@@ -288,13 +289,6 @@ static int msm_dp_display_bind(struct device *dev, struct device *master,
 		goto end;
 	}
 
-
-	rc = msm_dp_register_audio_driver(dev, dp->audio);
-	if (rc) {
-		DRM_ERROR("Audio registration Dp failed\n");
-		goto end;
-	}
-
 	rc = msm_dp_hpd_event_thread_start(dp);
 	if (rc) {
 		DRM_ERROR("Event thread create failed\n");
@@ -316,7 +310,6 @@ static void msm_dp_display_unbind(struct device *dev, struct device *master,
 
 	of_dp_aux_depopulate_bus(dp->aux);
 
-	msm_dp_unregister_audio_driver(dev, dp->audio);
 	msm_dp_aux_unregister(dp->aux);
 	dp->drm_dev = NULL;
 	dp->aux->drm_dev = NULL;
@@ -626,9 +619,9 @@ static void msm_dp_display_handle_plugged_change(struct msm_dp *msm_dp_display,
 			struct msm_dp_display_private, msm_dp_display);
 
 	/* notify audio subsystem only if sink supports audio */
-	if (msm_dp_display->plugged_cb && msm_dp_display->codec_dev &&
-			dp->audio_supported)
-		msm_dp_display->plugged_cb(msm_dp_display->codec_dev, plugged);
+	if (dp->audio_supported)
+		drm_connector_hdmi_audio_plugged_notify(msm_dp_display->connector,
+							plugged);
 }
 
 static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
@@ -907,19 +900,6 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 	return 0;
 }
 
-int msm_dp_display_set_plugged_cb(struct msm_dp *msm_dp_display,
-		hdmi_codec_plugged_cb fn, struct device *codec_dev)
-{
-	bool plugged;
-
-	msm_dp_display->plugged_cb = fn;
-	msm_dp_display->codec_dev = codec_dev;
-	plugged = msm_dp_display->link_ready;
-	msm_dp_display_handle_plugged_change(msm_dp_display, plugged);
-
-	return 0;
-}
-
 /**
  * msm_dp_bridge_mode_valid - callback to determine if specified mode is valid
  * @bridge: Pointer to drm bridge structure
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index ecbc2d92f546a346ee53adcf1b060933e4f54317..cc6e2cab36e9c0b1527ff292e547cbb4d69fd95c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -7,7 +7,6 @@
 #define _DP_DISPLAY_H_
 
 #include "dp_panel.h"
-#include <sound/hdmi-codec.h>
 #include "disp/msm_disp_snapshot.h"
 
 #define DP_MAX_PIXEL_CLK_KHZ	675000
@@ -15,7 +14,6 @@
 struct msm_dp {
 	struct drm_device *drm_dev;
 	struct platform_device *pdev;
-	struct device *codec_dev;
 	struct drm_connector *connector;
 	struct drm_bridge *next_bridge;
 	bool link_ready;
@@ -25,14 +23,10 @@ struct msm_dp {
 	bool is_edp;
 	bool internal_hpd;
 
-	hdmi_codec_plugged_cb plugged_cb;
-
 	struct msm_dp_audio *msm_dp_audio;
 	bool psr_supported;
 };
 
-int msm_dp_display_set_plugged_cb(struct msm_dp *msm_dp_display,
-		hdmi_codec_plugged_cb fn, struct device *codec_dev);
 int msm_dp_display_get_modes(struct msm_dp *msm_dp_display);
 bool msm_dp_display_check_video_test(struct msm_dp *msm_dp_display);
 int msm_dp_display_get_test_bpp(struct msm_dp *msm_dp_display);
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index cca57e56c906255a315e759e85a5af5982c80e9c..838bc7d052c5cfa31572f7e23a6b1d09c4c63b5f 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -12,6 +12,7 @@
 
 #include "msm_drv.h"
 #include "msm_kms.h"
+#include "dp_audio.h"
 #include "dp_drm.h"
 
 /**
@@ -114,6 +115,9 @@ static const struct drm_bridge_funcs msm_dp_bridge_ops = {
 	.hpd_disable  = msm_dp_bridge_hpd_disable,
 	.hpd_notify   = msm_dp_bridge_hpd_notify,
 	.debugfs_init = msm_dp_bridge_debugfs_init,
+
+	.dp_audio_prepare = msm_dp_audio_prepare,
+	.dp_audio_shutdown = msm_dp_audio_shutdown,
 };
 
 static int msm_edp_bridge_atomic_check(struct drm_bridge *drm_bridge,
@@ -320,9 +324,13 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 	 */
 	if (!msm_dp_display->is_edp) {
 		bridge->ops =
+			DRM_BRIDGE_OP_DP_AUDIO |
 			DRM_BRIDGE_OP_DETECT |
 			DRM_BRIDGE_OP_HPD |
 			DRM_BRIDGE_OP_MODES;
+		bridge->hdmi_audio_dev = &msm_dp_display->pdev->dev;
+		bridge->hdmi_audio_max_i2s_playback_channels = 8;
+		bridge->hdmi_audio_dai_port = -1;
 	}
 
 	rc = devm_drm_bridge_add(dev->dev, bridge);

-- 
2.39.5

