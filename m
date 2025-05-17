Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C0CABA7A9
	for <lists+dri-devel@lfdr.de>; Sat, 17 May 2025 04:00:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C43BB10E2AF;
	Sat, 17 May 2025 01:59:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="keXoxn3O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C37110E2AE
 for <dri-devel@lists.freedesktop.org>; Sat, 17 May 2025 01:59:53 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GCV3OZ015194
 for <dri-devel@lists.freedesktop.org>; Sat, 17 May 2025 01:59:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 q3352WtWEAgrfNRNaWvhRPVcoQ33rQi+QuFS41/lD6E=; b=keXoxn3OMpxjCbWX
 jbLwcFhPbRQNDjHTfMDAUscz4yKs8DNYKlv8no1BNLFA2PDK4yl8VC6qmRSciaUA
 jJHu6iGvjq3f/pCNmZvYVBdNklyN26cHkArvdL5x+GKlZ+vrDiuxYdqwyhtx/uIm
 2ivYf/CpGuc7L8PPMpNIebUJ3K+khCxGsyCbEunU46bp4paaNoY9o7EaDJK37wrL
 fW3JpdHsaSony2HTNpZyC+RLNRvc5cBXdGfnDikMNKQGcl7JuqahFox+EuTbJPj/
 BYc3NjyhDlJh56C1ezWG7IccglETUcpPpFwxyCgdZRGK5vq8yck4FdQjwBcODp93
 KiOdUA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46nx9ju221-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 17 May 2025 01:59:52 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6f544cf3f6dso54616896d6.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 18:59:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747447191; x=1748051991;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q3352WtWEAgrfNRNaWvhRPVcoQ33rQi+QuFS41/lD6E=;
 b=jIMYF4Xzam9RAmqedauubhn7nnw/H4VCeFikyCMCIfvOFxJ08qsHiKHXU+2xHv6z6E
 OUi9Wr7EEq3W6PbWYWj7csPb7S3axXLszZtKap4fk+haICTovSwNjkSBe9og1/FO+DxW
 chXZDGXUO2A2S/atfdVJFEHnMpBXfkpn633cyQA76SS8WWYiVdmrDjuJB2qHnb6dYRZS
 ZaQS4Go1t+y1WMpeWP/4ji9yH6eZAwExctU3mxSvc0ZW0BdINFEGn08UdDheW6tnVydJ
 QlQN0aTxg6/EpdKU1oz+yjAd70zf1yTMXC/3fyFFLRLGPvWL/27w8P+03bCYuObN9fEL
 8hlw==
X-Gm-Message-State: AOJu0Yx0e/y4Dqisftp0kw9Ide6F7fXSSkxMgH6eMlbJbKFyj3HfyQe9
 5a/42GEhlI1iAGOvdaEkhx4aNaWZJKLVik8i9ZQPvwNbkPQLDAt4KZKLCahrUPjKH9R7kysE4jB
 9YeKEEAjDvw/39I/8D8zoFCfPIoi0NlBzdyTNRHE/ZUnwZ3UifPuOy7Y8GLzqYM3XykJ+P20=
X-Gm-Gg: ASbGncs1gGNDbQMHL8zk1FMJjHxy7rnC5WVswZkCFqUnx0RTOzyy7oYEYGAIOjHW7Sn
 GTq+ZShc1y5edTkkjAsFY++gBuWOcbDegt5ZdrFH5gZLL5/rbS6Wt1h8r5vr3XIDIvGYw1CKFbw
 Bd4inxQiXchXh4XqhZce8WBX49MjUOBQd1969/zu60oj/+BqFQAIBTGVwOl29ZxaHd2xI4mK5a9
 we1prqDDEbroEcIV0WXSUK/Q0PQpjZ+h9+dp+BNZVDn9OwX8LSdmktGifmxYsGchUzc1hMZgZ1A
 jB4RARzsGB39VeqekqpLaaJCMTdkTF68s6RafF4M7GwFBTYsuzUE3YYsQbxJcefPqQ9a7ExyRSd
 Kk60LgjJrpr8U0n92LhJm5Rv8
X-Received: by 2002:a05:6214:1c8a:b0:6f8:997d:fc70 with SMTP id
 6a1803df08f44-6f8b088f5efmr95044066d6.27.1747447190900; 
 Fri, 16 May 2025 18:59:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtxqKQU3hZ5IAOU5hMOyEqRGKacJD+b2JSNgjUotcLGZq2anuLnHuSA7StNh9TSna2zp0eMA==
X-Received: by 2002:a05:6214:1c8a:b0:6f8:997d:fc70 with SMTP id
 6a1803df08f44-6f8b088f5efmr95043726d6.27.1747447190486; 
 Fri, 16 May 2025 18:59:50 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e70180f7sm672167e87.128.2025.05.16.18.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 18:59:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 17 May 2025 04:59:41 +0300
Subject: [PATCH v6 05/10] drm/display: add CEC helpers code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250517-drm-hdmi-connector-cec-v6-5-35651db6f19b@oss.qualcomm.com>
References: <20250517-drm-hdmi-connector-cec-v6-0-35651db6f19b@oss.qualcomm.com>
In-Reply-To: <20250517-drm-hdmi-connector-cec-v6-0-35651db6f19b@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13797;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=LL9Ai6hOxzinFf1Ck9VLp8BJQivJG1tCD01ZOKHzaG8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoJ+2LJt8v8A8B7zVWyCqXAbLAgvgnWS7lWZ5il
 ybhmZUg4YGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCftiwAKCRCLPIo+Aiko
 1aYdB/9J0SzwzTyatjVG/G51uZUjMbtARI70B0iifMBlEUOFy0ymO2uKnF4u3m1FIKLdDKHXbsl
 H0gPL61iw+9WWosDWkdJV9bwdVwW7VsWhTIsTGtQMsorwSrUwXO2I+ILyp/yxhwsCf5wZabxoD8
 lsMXz+XAoRwHWBJeLYqEPTZpr+r3uVZjeqIlBpEEaV3xHsoOFbx+UHvRaB9HB9eS1M3n2Bhh1Pw
 0Lz6hctX7AMThmi8Q3k4CumSdCcTy12X/lpj3DTyUbuNUwy0mdLocfLyoXCJpmRT+4LteTTm3+Y
 fTkSkfr60yLXbHmehLYa7YbId6lnKivv3DBNeAAkMZqGXR7z
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: P1NvBIL57Ntj3xTEM8KrkhABziptmu1i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE3MDAxNyBTYWx0ZWRfXxdEEOW5Pm5nl
 ytrMdsT736vlHXupDu4ohoX+o/HnM2XybAkCvSgmmtDj8cWNwIZlXdHoJxiZ4abrQRrgdlOWZMK
 vPP8/MJB7t3RJRHm9d1omP7j4nMcxt1RvdSs2CYkWY6G2WysZX6gGfqMjEeOoCDrvtoZiodOCmQ
 h/NK2LeX0r51DRm0lWOtjvv1bXMGIORFLzRmqythdiqMkjouktF6BbgKEWnMJInOyWMV1Q4RQUj
 B5pHynWtSznkViOyOQKkChExy7anAWL8c5vxUMyIpp4ZwEGSR9E7nUcvV7fvbMGrmsvSQ+ShN5d
 C8hY6ucA0m1K78EE7vY7SSEWZEUJasG6oYPKar4roGaWPGpxSSzlzs6P4693M4P4utItrKoU+87
 InVdTxGd6rtoIXqu5mllxyn3nE7dZwDuYioJvKfuacvv+8ZubxwdiUSZNeB0PmaYVc1yPTL7
X-Authority-Analysis: v=2.4 cv=CIIqXQrD c=1 sm=1 tr=0 ts=6827ed98 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Iec3o4o9FL51ny9dwhwA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: P1NvBIL57Ntj3xTEM8KrkhABziptmu1i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-17_01,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505170017
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

Add generic CEC helpers to be used by HDMI drivers. Both notifier and
and adapter are supported for registration. Once registered, the driver
can call common set of functions to update physical address, to
invalidate it or to unregister CEC data. Unlike drm_connector_cec_funcs
(which provides interface common to all implementations, including, but
not limited to the CEC adapter, CEC notifier, CEC pin-based adapter,
etc) the struct drm_connector_hdmi_cec_adapter_ops provides callbacks
specific to the CEC adapter implementations.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/Kconfig                    |  12 +-
 drivers/gpu/drm/display/Makefile                   |   4 +
 drivers/gpu/drm/display/drm_hdmi_cec_helper.c      | 192 +++++++++++++++++++++
 .../gpu/drm/display/drm_hdmi_cec_notifier_helper.c |  64 +++++++
 include/drm/display/drm_hdmi_cec_helper.h          |  72 ++++++++
 5 files changed, 343 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index 3666e791d6d6eba58f095d7fb691de1fd0b95ed3..6376ea01ec3093a72de25064e31223d2c9868ed7 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -8,7 +8,7 @@ config DRM_DISPLAY_DP_AUX_BUS
 config DRM_DISPLAY_HELPER
 	tristate
 	depends on DRM
-	select CEC_CORE if DRM_DISPLAY_DP_AUX_CEC
+	select CEC_CORE if DRM_DISPLAY_DP_AUX_CEC || DRM_DISPLAY_HDMI_CEC_HELPER || CEC_NOTIFIER
 	help
 	  DRM helpers for display adapters.
 
@@ -82,6 +82,16 @@ config DRM_DISPLAY_HDMI_AUDIO_HELPER
 	  DRM display helpers for HDMI Audio functionality (generic HDMI Codec
 	  implementation).
 
+config DRM_DISPLAY_HDMI_CEC_HELPER
+	bool
+	help
+	  DRM display helpers for HDMI CEC implementation.
+
+config DRM_DISPLAY_HDMI_CEC_NOTIFIER_HELPER
+	def_bool CEC_NOTIFIER
+	help
+	  DRM display helpers for HDMI CEC notifiers implementation.
+
 config DRM_DISPLAY_HDMI_HELPER
 	bool
 	help
diff --git a/drivers/gpu/drm/display/Makefile b/drivers/gpu/drm/display/Makefile
index b17879b957d5401721396e247fa346387cf6c48a..0ff4a1ad0222078bf495175915007f1b1f903296 100644
--- a/drivers/gpu/drm/display/Makefile
+++ b/drivers/gpu/drm/display/Makefile
@@ -16,6 +16,10 @@ drm_display_helper-$(CONFIG_DRM_DISPLAY_DSC_HELPER) += \
 drm_display_helper-$(CONFIG_DRM_DISPLAY_HDCP_HELPER) += drm_hdcp_helper.o
 drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_AUDIO_HELPER) += \
 	drm_hdmi_audio_helper.o
+drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_CEC_HELPER) += \
+	drm_hdmi_cec_helper.o
+drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_CEC_NOTIFIER_HELPER) += \
+	drm_hdmi_cec_notifier_helper.o
 drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_HELPER) += \
 	drm_hdmi_helper.o \
 	drm_scdc_helper.o
diff --git a/drivers/gpu/drm/display/drm_hdmi_cec_helper.c b/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
new file mode 100644
index 0000000000000000000000000000000000000000..a25f60509043136630c1ab25e4f3e80f85a639b9
--- /dev/null
+++ b/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
@@ -0,0 +1,192 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright (c) 2024 Linaro Ltd
+ */
+
+#include <drm/drm_bridge.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_managed.h>
+#include <drm/display/drm_hdmi_cec_helper.h>
+
+#include <linux/mutex.h>
+
+#include <media/cec.h>
+
+struct drm_connector_hdmi_cec_data {
+	struct cec_adapter *adapter;
+	const struct drm_connector_hdmi_cec_funcs *funcs;
+};
+
+static int drm_connector_hdmi_cec_adap_enable(struct cec_adapter *adap, bool enable)
+{
+	struct drm_connector *connector = cec_get_drvdata(adap);
+	struct drm_connector_hdmi_cec_data *data = connector->cec.data;
+
+	return data->funcs->enable(connector, enable);
+}
+
+static int drm_connector_hdmi_cec_adap_log_addr(struct cec_adapter *adap, u8 logical_addr)
+{
+	struct drm_connector *connector = cec_get_drvdata(adap);
+	struct drm_connector_hdmi_cec_data *data = connector->cec.data;
+
+	return data->funcs->log_addr(connector, logical_addr);
+}
+
+static int drm_connector_hdmi_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
+						u32 signal_free_time, struct cec_msg *msg)
+{
+	struct drm_connector *connector = cec_get_drvdata(adap);
+	struct drm_connector_hdmi_cec_data *data = connector->cec.data;
+
+	return data->funcs->transmit(connector, attempts, signal_free_time, msg);
+}
+
+static const struct cec_adap_ops drm_connector_hdmi_cec_adap_ops = {
+	.adap_enable = drm_connector_hdmi_cec_adap_enable,
+	.adap_log_addr = drm_connector_hdmi_cec_adap_log_addr,
+	.adap_transmit = drm_connector_hdmi_cec_adap_transmit,
+};
+
+static void drm_connector_hdmi_cec_adapter_phys_addr_invalidate(struct drm_connector *connector)
+{
+	struct drm_connector_hdmi_cec_data *data = connector->cec.data;
+
+	cec_phys_addr_invalidate(data->adapter);
+}
+
+static void drm_connector_hdmi_cec_adapter_phys_addr_set(struct drm_connector *connector,
+							 u16 addr)
+{
+	struct drm_connector_hdmi_cec_data *data = connector->cec.data;
+
+	cec_s_phys_addr(data->adapter, addr, false);
+}
+
+static void drm_connector_hdmi_cec_adapter_unregister(struct drm_device *dev, void *res)
+{
+	struct drm_connector *connector = res;
+	struct drm_connector_hdmi_cec_data *data = connector->cec.data;
+
+	cec_delete_adapter(data->adapter);
+
+	if (data->funcs->uninit)
+		data->funcs->uninit(connector);
+
+	kfree(data);
+	connector->cec.data = NULL;
+}
+
+static struct drm_connector_cec_funcs drm_connector_hdmi_cec_adapter_funcs = {
+	.phys_addr_invalidate = drm_connector_hdmi_cec_adapter_phys_addr_invalidate,
+	.phys_addr_set = drm_connector_hdmi_cec_adapter_phys_addr_set,
+};
+
+int drmm_connector_hdmi_cec_register(struct drm_connector *connector,
+				     const struct drm_connector_hdmi_cec_funcs *funcs,
+				     const char *name,
+				     u8 available_las,
+				     struct device *dev)
+{
+	struct drm_connector_hdmi_cec_data *data;
+	struct cec_connector_info conn_info;
+	struct cec_adapter *cec_adap;
+	int ret;
+
+	if (!funcs->init || !funcs->enable || !funcs->log_addr || !funcs->transmit)
+		return -EINVAL;
+
+	data = kzalloc(sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->funcs = funcs;
+
+	cec_adap = cec_allocate_adapter(&drm_connector_hdmi_cec_adap_ops, connector, name,
+					CEC_CAP_DEFAULTS | CEC_CAP_CONNECTOR_INFO,
+					available_las ? : CEC_MAX_LOG_ADDRS);
+	ret = PTR_ERR_OR_ZERO(cec_adap);
+	if (ret < 0)
+		goto err_free;
+
+	cec_fill_conn_info_from_drm(&conn_info, connector);
+	cec_s_conn_info(cec_adap, &conn_info);
+
+	data->adapter = cec_adap;
+
+	mutex_lock(&connector->cec.mutex);
+
+	connector->cec.data = data;
+	connector->cec.funcs = &drm_connector_hdmi_cec_adapter_funcs;
+
+	ret = funcs->init(connector);
+	if (ret < 0)
+		goto err_delete_adapter;
+
+	/*
+	 * NOTE: the CEC adapter will be unregistered by drmm cleanup from
+	 * drm_managed_release(), which is called from drm_dev_release()
+	 * during device unbind.
+	 *
+	 * However, the CEC framework cleans up the CEC adapter only when the
+	 * last user has closed its file descriptor, so we don't need to handle
+	 * it in DRM.
+	 *
+	 * Before that CEC framework makes sure that even if the userspace
+	 * still holds CEC device open, all calls will be shortcut via
+	 * cec_is_registered(), making sure that there is no access to the
+	 * freed memory.
+	 */
+	ret = cec_register_adapter(cec_adap, dev);
+	if (ret < 0)
+		goto err_delete_adapter;
+
+	mutex_unlock(&connector->cec.mutex);
+
+	return drmm_add_action_or_reset(connector->dev,
+					drm_connector_hdmi_cec_adapter_unregister,
+					connector);
+
+err_delete_adapter:
+	cec_delete_adapter(cec_adap);
+
+	connector->cec.data = NULL;
+
+	mutex_unlock(&connector->cec.mutex);
+
+err_free:
+	kfree(data);
+
+	return ret;
+}
+EXPORT_SYMBOL(drmm_connector_hdmi_cec_register);
+
+void drm_connector_hdmi_cec_received_msg(struct drm_connector *connector,
+					 struct cec_msg *msg)
+{
+	struct drm_connector_hdmi_cec_data *data = connector->cec.data;
+
+	cec_received_msg(data->adapter, msg);
+}
+EXPORT_SYMBOL(drm_connector_hdmi_cec_received_msg);
+
+void drm_connector_hdmi_cec_transmit_attempt_done(struct drm_connector *connector,
+						  u8 status)
+{
+	struct drm_connector_hdmi_cec_data *data = connector->cec.data;
+
+	cec_transmit_attempt_done(data->adapter, status);
+}
+EXPORT_SYMBOL(drm_connector_hdmi_cec_transmit_attempt_done);
+
+void drm_connector_hdmi_cec_transmit_done(struct drm_connector *connector,
+					  u8 status,
+					  u8 arb_lost_cnt, u8 nack_cnt,
+					  u8 low_drive_cnt, u8 error_cnt)
+{
+	struct drm_connector_hdmi_cec_data *data = connector->cec.data;
+
+	cec_transmit_done(data->adapter, status,
+			  arb_lost_cnt, nack_cnt, low_drive_cnt, error_cnt);
+}
+EXPORT_SYMBOL(drm_connector_hdmi_cec_transmit_done);
diff --git a/drivers/gpu/drm/display/drm_hdmi_cec_notifier_helper.c b/drivers/gpu/drm/display/drm_hdmi_cec_notifier_helper.c
new file mode 100644
index 0000000000000000000000000000000000000000..28f8e008cc59fabd7d540f8e90e48ac386447cd8
--- /dev/null
+++ b/drivers/gpu/drm/display/drm_hdmi_cec_notifier_helper.c
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright (c) 2024 Linaro Ltd
+ */
+
+#include <drm/drm_bridge.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_managed.h>
+#include <drm/display/drm_hdmi_cec_helper.h>
+
+#include <linux/mutex.h>
+
+#include <media/cec.h>
+#include <media/cec-notifier.h>
+
+static void drm_connector_hdmi_cec_notifier_phys_addr_invalidate(struct drm_connector *connector)
+{
+	cec_notifier_phys_addr_invalidate(connector->cec.data);
+}
+
+static void drm_connector_hdmi_cec_notifier_phys_addr_set(struct drm_connector *connector,
+							  u16 addr)
+{
+	cec_notifier_set_phys_addr(connector->cec.data, addr);
+}
+
+static void drm_connector_hdmi_cec_notifier_unregister(struct drm_device *dev, void *res)
+{
+	struct drm_connector *connector = res;
+
+	cec_notifier_conn_unregister(connector->cec.data);
+	connector->cec.data = NULL;
+}
+
+static const struct drm_connector_cec_funcs drm_connector_cec_notifier_funcs = {
+	.phys_addr_invalidate = drm_connector_hdmi_cec_notifier_phys_addr_invalidate,
+	.phys_addr_set = drm_connector_hdmi_cec_notifier_phys_addr_set,
+};
+
+int drmm_connector_hdmi_cec_notifier_register(struct drm_connector *connector,
+					      const char *port_name,
+					      struct device *dev)
+{
+	struct cec_connector_info conn_info;
+	struct cec_notifier *notifier;
+
+	cec_fill_conn_info_from_drm(&conn_info, connector);
+
+	notifier = cec_notifier_conn_register(dev, port_name, &conn_info);
+	if (!notifier)
+		return -ENOMEM;
+
+	mutex_lock(&connector->cec.mutex);
+
+	connector->cec.data = notifier;
+	connector->cec.funcs = &drm_connector_cec_notifier_funcs;
+
+	mutex_unlock(&connector->cec.mutex);
+
+	return drmm_add_action_or_reset(connector->dev,
+					drm_connector_hdmi_cec_notifier_unregister,
+					connector);
+}
+EXPORT_SYMBOL(drmm_connector_hdmi_cec_notifier_register);
diff --git a/include/drm/display/drm_hdmi_cec_helper.h b/include/drm/display/drm_hdmi_cec_helper.h
new file mode 100644
index 0000000000000000000000000000000000000000..fd8f4d2f02c1ea952a203fadedf9d55278ec275f
--- /dev/null
+++ b/include/drm/display/drm_hdmi_cec_helper.h
@@ -0,0 +1,72 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef DRM_DISPLAY_HDMI_CEC_HELPER
+#define DRM_DISPLAY_HDMI_CEC_HELPER
+
+#include <linux/types.h>
+
+struct drm_connector;
+
+struct cec_msg;
+struct device;
+
+struct drm_connector_hdmi_cec_funcs {
+	/**
+	 * @init: perform hardware-specific initialization before registering the CEC adapter
+	 */
+	int (*init)(struct drm_connector *connector);
+
+	/**
+	 * @uninit: perform hardware-specific teardown for the CEC adapter
+	 */
+	void (*uninit)(struct drm_connector *connector);
+
+	/**
+	 * @enable: enable or disable CEC adapter
+	 */
+	int (*enable)(struct drm_connector *connector, bool enable);
+
+	/**
+	 * @log_addr: set adapter's logical address, can be called multiple
+	 * times if adapter supports several LAs
+	 */
+	int (*log_addr)(struct drm_connector *connector, u8 logical_addr);
+
+	/**
+	 * @transmit: start transmission of the specified CEC message
+	 */
+	int (*transmit)(struct drm_connector *connector, u8 attempts,
+			u32 signal_free_time, struct cec_msg *msg);
+};
+
+int drmm_connector_hdmi_cec_register(struct drm_connector *connector,
+				     const struct drm_connector_hdmi_cec_funcs *funcs,
+				     const char *name,
+				     u8 available_las,
+				     struct device *dev);
+
+void drm_connector_hdmi_cec_received_msg(struct drm_connector *connector,
+					 struct cec_msg *msg);
+
+void drm_connector_hdmi_cec_transmit_done(struct drm_connector *connector,
+					  u8 status,
+					  u8 arb_lost_cnt, u8 nack_cnt,
+					  u8 low_drive_cnt, u8 error_cnt);
+
+void drm_connector_hdmi_cec_transmit_attempt_done(struct drm_connector *connector,
+						  u8 status);
+
+#if IS_ENABLED(CONFIG_DRM_DISPLAY_HDMI_CEC_NOTIFIER_HELPER)
+int drmm_connector_hdmi_cec_notifier_register(struct drm_connector *connector,
+					      const char *port_name,
+					      struct device *dev);
+#else
+static inline int drmm_connector_hdmi_cec_notifier_register(struct drm_connector *connector,
+							    const char *port_name,
+							    struct device *dev)
+{
+	return 0;
+}
+#endif
+
+#endif

-- 
2.39.5

