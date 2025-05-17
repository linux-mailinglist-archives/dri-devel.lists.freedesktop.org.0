Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA52DABA7AC
	for <lists+dri-devel@lfdr.de>; Sat, 17 May 2025 04:00:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA58710E1E1;
	Sat, 17 May 2025 02:00:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HF9ErV4S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F5D410E1E1
 for <dri-devel@lists.freedesktop.org>; Sat, 17 May 2025 02:00:00 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GFumo5028833
 for <dri-devel@lists.freedesktop.org>; Sat, 17 May 2025 01:59:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 FTue6qDwrYubFQMk1w1EWo6BYJAZv6w0wv+khPYE838=; b=HF9ErV4S/gjbPymd
 qvweci5y7r5Fcmm7KFalbEl68BOP5fDO9t2ZHV6nhVeSGJrPT5K7/lZPZFiLYrMG
 f7GLV6yulvOyChR2i+zAqsq6ad/NH2GIt+gBFtWFY+FfFjpnhnNDig7rP8lx46U/
 IEFlvMsh3wt5byh0ehGl532e3KulWtPyed3V3J3nVW4w+ICEJM6xYHfhkiNN0+sc
 G96IDgig2VFAn+1/xw1yblU9F9Ak8VRu5CiAs+56i8amC+qmFrrP5mDWuKDZDTIy
 XetF4cWndvUAxKJL8nfYFgdF+BnGqRCeXSLBEOVc4ZAjzRH0Fv5OcSe/WMOJQfdh
 v0DPAA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46p01n2m89-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 17 May 2025 01:59:59 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6f5462cdfb2so47008186d6.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 18:59:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747447199; x=1748051999;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FTue6qDwrYubFQMk1w1EWo6BYJAZv6w0wv+khPYE838=;
 b=mHUwPDez+5STwluLks5IA88Oapm8rILYR95w8qsaJAcyDgvtbABGfb6RjaiLvNOO7Y
 jzewim43vnDNIzVJ88A6Ul/ROHC2lCtfcOs1f8nS3slf/ssm+/GGUhVb4k2gQRCJZBXf
 lXHYSJvDMinpJO/0si5ENlaXo+PH/EyFBQzj7UEYQz50hpxyOv6EFi6kkqFYks7Myo/L
 OzDTh1b4hZCo+JQJtCiLJgzocCcSgrSKWp2XZuZAyMYohy5Pljo9lhxvNvTL6SJNJb5D
 ZAPMD58SXszRUABljMJJkRB79TXtSe9n0n62xzDql3kziOTYOmebT1pQYDzfNZEBXrpo
 XXxg==
X-Gm-Message-State: AOJu0YyaKkpujQIyBCM5YKW5kllnwjXEKJslA5FMigdqFzt08HTrkwPY
 v2Xnk5Lx6/Nl5ytCQhsy4B/6PsrMyBIOgPqBuTOMHNgc3hdW30NHLrwF1iH8kFPeqdbNTIn85t4
 ejbJaZX1dVOwZxpz8y/+21UP0Dnoi+GgMr4px1X40iKNoxeJAXlLgluuDHmj1JCpn4c0uxrw=
X-Gm-Gg: ASbGnctjWy8nrrkiQiCHFG86/xPt7R3LLhg0Pi9pZbFASb5DML2MasUavoWXaEQzQBs
 bdEokUOFlgeDZG4uR2Q+SPqO+8iywLY6GQ9x9JlKPBkrE8+TH2tdK5yq0CKSAjHyeJSpX8mvs0u
 jXUDpT27yHyqr3Li8BO1UQc3kzw7630KuwQq6KsvvolHMkzZS2Tbg0zb3SO9FSaynZNNVMgdoRc
 7MqlWfKwafOuv5XZSr/6Bje0NBLLVSvCPQdNzscosAOjfzxmoAKnhxD+Q426YMOLinFBbhWO7r3
 54AdLK9U/hWC7w0OWoQQnUl5jH+oJ6aVnDpJQ8mw5AUNaSTbKBvoxCJ7KS2tDIafrPqoTmAGNLM
 q11n92pKZH6n8LlYKDF4gQiOS
X-Received: by 2002:a05:6214:f05:b0:6ed:1545:65c3 with SMTP id
 6a1803df08f44-6f8b07db221mr102928666d6.2.1747447198727; 
 Fri, 16 May 2025 18:59:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtswsxir2AkXnsumiHReYiQoFeVMytjn5PXkDMFwMyII2mkUh6azr4loh9BoL3Y1eUqvgagA==
X-Received: by 2002:a05:6214:f05:b0:6ed:1545:65c3 with SMTP id
 6a1803df08f44-6f8b07db221mr102928416d6.2.1747447198298; 
 Fri, 16 May 2025 18:59:58 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e70180f7sm672167e87.128.2025.05.16.18.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 18:59:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 17 May 2025 04:59:45 +0300
Subject: [PATCH v6 09/10] drm/display: bridge-connector: handle CEC
 adapters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250517-drm-hdmi-connector-cec-v6-9-35651db6f19b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6377;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=i2siyc5cNZp28Bm/+U+t6HAhNXnqz68ofKezvInamp4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoJ+2M7qOLRG+W3LW+MxgS8jnsazA2dFRHMflnQ
 ZzCzXxJHtiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCftjAAKCRCLPIo+Aiko
 1U1mB/4uhxDIOc4OBops3pK6MT/S5ECQTQQ+Jzn7GQV/sgWUjXkWZGG6m3aG0939SUscvi/0oiM
 Wnd9bOnKrGyB+7TzLckK+1nE2l7ezBOuKtnJ58mMqlTol8D0VbVVvWzOj0W0k8HaWuD9kzWdJzH
 Nb59u+N3GyCkqo+4sXOLBInzkEMGZCMaYxFlcV2+llVR+X63mw7RQHO4YOabWtfvxNCbZsLv9S+
 zl8SpxgBYzEzKKs3IhJsO2XQF3z0TEhwwN5TndnuOlc+tczb9AUbaUfHnha4KfRG0QSq4UEIP4b
 fj9ozsbfLBtBckqTz/o+vw438NGXrDHkts+k7DpVAHdd24nZ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=M4lNKzws c=1 sm=1 tr=0 ts=6827ed9f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=d0TFWrSkjAMFaLnAG04A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE3MDAxNyBTYWx0ZWRfX2bE23dggPNvk
 FRIO7T02fXXtOS25jTbI5B0fI1Q/2+ndYT995B5Ii1wLiqFSlTtY0kJ5Kd0eIRlu/xjCgD8VtgX
 HY4A15nbxKiidBybZtd6bmaPUS1tRwH3m1dxq8/s+ujbVfN+8rCLzfSFXsUrVUUIvex2vKQWnz1
 5dyd8/uG5MuL6jLs3/hxqB2rzg0za9MJJsm76k/W2As1zKV0pqqeg6wC78N/cLHJWJ1c7IDnOIv
 XNcsWQofnWtx538JyXpYI5y19MqayX4w/AyfPh4JlvzByJBQp9yvcTLjSQ6SDAYmZLmZBCzhOSV
 0V3aSawKnBg3HXheEHZREN1yORrZ/v8iTea8HZvoKBTPCIvu1Nv0mxB1ntDJ1pMCSSS73utYSXq
 0Wk7i9nuTeugTSo/Y56N7ir4KrmwtdrgU1XlNfx2BdZKyoSOq1dFdMEMDpQ94D5E5ylgGXX7
X-Proofpoint-ORIG-GUID: xroOmZlX0sG6UPHy13qDIlExazgCyi4u
X-Proofpoint-GUID: xroOmZlX0sG6UPHy13qDIlExazgCyi4u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-17_01,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 mlxlogscore=999
 mlxscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505170017
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

Implement necessary glue code to let DRM bridge drivers to implement CEC
adapters support.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/Kconfig                |  1 +
 drivers/gpu/drm/display/drm_bridge_connector.c | 83 ++++++++++++++++++++++++++
 include/drm/drm_bridge.h                       | 26 ++++++++
 3 files changed, 110 insertions(+)

diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index 6376ea01ec3093a72de25064e31223d2c9868ed7..df09cf9a8ca19ea894d6f2fad68c0b191e81e3d0 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -17,6 +17,7 @@ if DRM_DISPLAY_HELPER
 config DRM_BRIDGE_CONNECTOR
 	bool
 	select DRM_DISPLAY_HDMI_AUDIO_HELPER
+	select DRM_DISPLAY_HDMI_CEC_HELPER
 	select DRM_DISPLAY_HDMI_STATE_HELPER
 	help
 	  DRM connector implementation terminating DRM bridge chains.
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 0377dcd691a871643710d667248b05f8eb9e84d6..3d3607a24189f433e11da98caa0d327a3d3bc29c 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -554,6 +554,66 @@ static const struct drm_connector_hdmi_audio_funcs drm_bridge_connector_hdmi_aud
 	.mute_stream = drm_bridge_connector_audio_mute_stream,
 };
 
+static int drm_bridge_connector_hdmi_cec_enable(struct drm_connector *connector, bool enable)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi_cec;
+
+	return bridge->funcs->hdmi_cec_enable(bridge, enable);
+}
+
+static int drm_bridge_connector_hdmi_cec_log_addr(struct drm_connector *connector, u8 logical_addr)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi_cec;
+
+	return bridge->funcs->hdmi_cec_log_addr(bridge, logical_addr);
+}
+
+static int drm_bridge_connector_hdmi_cec_transmit(struct drm_connector *connector,
+						  u8 attempts,
+						  u32 signal_free_time,
+						  struct cec_msg *msg)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi_cec;
+
+	return bridge->funcs->hdmi_cec_transmit(bridge, attempts,
+						signal_free_time,
+						msg);
+}
+
+static int drm_bridge_connector_hdmi_cec_init(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi_cec;
+
+	if (!bridge->funcs->hdmi_cec_init)
+		return 0;
+
+	return bridge->funcs->hdmi_cec_init(connector, bridge);
+}
+
+static const struct drm_connector_hdmi_cec_funcs drm_bridge_connector_hdmi_cec_funcs = {
+	.init = drm_bridge_connector_hdmi_cec_init,
+	.enable = drm_bridge_connector_hdmi_cec_enable,
+	.log_addr = drm_bridge_connector_hdmi_cec_log_addr,
+	.transmit = drm_bridge_connector_hdmi_cec_transmit,
+};
+
+
 /* -----------------------------------------------------------------------------
  * Bridge Connector Initialisation
  */
@@ -677,6 +737,18 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			bridge_connector->bridge_hdmi_cec = bridge;
 		}
 
+		if (bridge->ops & DRM_BRIDGE_OP_HDMI_CEC_ADAPTER) {
+			if (bridge_connector->bridge_hdmi_cec)
+				return ERR_PTR(-EBUSY);
+
+			bridge_connector->bridge_hdmi_cec = bridge;
+
+			if (!bridge->funcs->hdmi_cec_enable ||
+			    !bridge->funcs->hdmi_cec_log_addr ||
+			    !bridge->funcs->hdmi_cec_transmit)
+				return ERR_PTR(-EINVAL);
+		}
+
 		if (!drm_bridge_get_next_bridge(bridge))
 			connector_type = bridge->type;
 
@@ -748,6 +820,17 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			return ERR_PTR(ret);
 	}
 
+	if (bridge_connector->bridge_hdmi_cec &&
+	    bridge_connector->bridge_hdmi_cec->ops & DRM_BRIDGE_OP_HDMI_CEC_ADAPTER) {
+		ret = drmm_connector_hdmi_cec_register(connector,
+						       &drm_bridge_connector_hdmi_cec_funcs,
+						       bridge->hdmi_cec_adapter_name,
+						       bridge->hdmi_cec_available_las,
+						       bridge->hdmi_cec_dev);
+		if (ret)
+			return ERR_PTR(ret);
+	}
+
 	drm_connector_helper_add(connector, &drm_bridge_connector_helper_funcs);
 
 	if (bridge_connector->bridge_hpd)
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 0e5f6a007d536215bd50e11846433290c2060b9c..cc9f7df38102e3c43913b35312f0ed5c4d8a7bd0 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -32,6 +32,7 @@
 #include <drm/drm_mode_object.h>
 #include <drm/drm_modes.h>
 
+struct cec_msg;
 struct device_node;
 
 struct drm_bridge;
@@ -737,6 +738,16 @@ struct drm_bridge_funcs {
 				      struct drm_bridge *bridge,
 				      bool enable, int direction);
 
+	int (*hdmi_cec_init)(struct drm_connector *connector,
+			     struct drm_bridge *bridge);
+
+	int (*hdmi_cec_enable)(struct drm_bridge *bridge, bool enable);
+
+	int (*hdmi_cec_log_addr)(struct drm_bridge *bridge, u8 logical_addr);
+
+	int (*hdmi_cec_transmit)(struct drm_bridge *bridge, u8 attempts,
+				 u32 signal_free_time, struct cec_msg *msg);
+
 	/**
 	 * @dp_audio_startup:
 	 *
@@ -912,6 +923,11 @@ enum drm_bridge_ops {
 	 * to be present.
 	 */
 	DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER = BIT(7),
+	/**
+	 * @DRM_BRIDGE_OP_HDMI_CEC_ADAPTER: The bridge requires CEC notifier
+	 * to be present.
+	 */
+	DRM_BRIDGE_OP_HDMI_CEC_ADAPTER = BIT(8),
 };
 
 /**
@@ -1048,6 +1064,16 @@ struct drm_bridge {
 	 */
 	int hdmi_audio_dai_port;
 
+	/**
+	 * @hdmi_cec_adapter_name: the name of the adapter to register
+	 */
+	const char *hdmi_cec_adapter_name;
+
+	/**
+	 * @hdmi_cec_available_las: number of logical addresses, CEC_MAX_LOG_ADDRS if unset
+	 */
+	u8 hdmi_cec_available_las;
+
 	/** private: */
 	/**
 	 * @hpd_mutex: Protects the @hpd_cb and @hpd_data fields.

-- 
2.39.5

