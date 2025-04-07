Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C47A7E37A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 17:11:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F28310E4EA;
	Mon,  7 Apr 2025 15:11:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pGJU3Eio";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07EDC10E4EE
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 15:11:25 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378e2dE002203
 for <dri-devel@lists.freedesktop.org>; Mon, 7 Apr 2025 15:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JYUU1oL1b7n2VxMLpZgbKpTf+49UGtsm3W7xKJkRyNI=; b=pGJU3EioQY0/W+sp
 aVPfr7JdUaVEo30kPETKlOt41ahZ8eMOGRqVfEcD1jf6c6pbQZ6VMa9KU+YkLoLg
 aLXYzjAQvoBmzkXxr9TORs/ugUoyXvXC0a7OxmMsdsACSDaPT/x0+QMeYb/njb0i
 iNKfsJH5VUR4teqPvnitK8Bo1os6njx4iJA4/BZCla+7cz3LOVyvqeRcaANCB/pm
 +WZOpv11JF++IbPQU3kpSY6BFzffIjWn9wcR3GDBcddr+45suwGHsJPzKwYIAB1Q
 S6MMwCLPmk6zGDpeHcenzw+GvGtO+//AV4u/FX8dnoDsQ4xBneBtudOPVNpNgk8r
 Ci5pZA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twtavnaw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 15:11:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5b9333642so469703585a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 08:11:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744038683; x=1744643483;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JYUU1oL1b7n2VxMLpZgbKpTf+49UGtsm3W7xKJkRyNI=;
 b=bGDWR93qKm1Zt4wAprEuf/7JrUkR/3r8ZcsDbn4XA/rDtjF3I/3I5aIRbggaBx2Lt8
 rOnX7QoxwiEsfsSr6lAKxJ+ZvRip5hSDs/3Fo2RiMiQCwZvwOYl+1/OXI5vrf++HMwgW
 pOYrsXdkg08fJcoLx4BzRRKUA1JncVd9R85T19WpTV5qmesNTqaZaGy+SFUKptz74f5L
 CA+YO61LZtsvtTzES6uHuWmoWure4C5mplHdlETfEhhkGlp51XyhVrL6hJJTMlv6WHlu
 Nie9Qz7jzo0T3tXWsLQhkcQOMLyXOCbxHtINVJkCrE6HmXVnWTdh4ql8bLUnQAC98/LY
 QuSw==
X-Gm-Message-State: AOJu0YzseC5NVj7zd5jG/ApOh9kIV6TFrZS0qeHP3b1A17pggGuZ+PA8
 o7sBhdt0TbWn/lfzuOChUbKLqHsBAX//uSgQJVEl78x2HEue54tMQ/k57Wy7fsOehFntBXPJdof
 ooOBRtGkMG1rcf9570BjTxJ1x9aEv32XMqikmJrh05X428LbsKC5ZFOTdWYu7M3tLuyI=
X-Gm-Gg: ASbGncsae2hbeY+nYePyDmDnjZC2RP+KOoxV+PJbx+bi+nnC7crVFyTkumkxnxcrjHM
 lYd3DVqe3zT5RSYoDD8vP5vKcoHDPwd4wrpD7q+Ge/+kQTaYX3Ow8Ql85EesAagM7B1qwx34wIU
 pkITNUy9WlteCEiY8tGp8iKM67Tvk3mZcIwaE3BlpzFFB9lwZaqxN3k4K2hEAqBlXSYmIU3yvbp
 CEbZmBVA+iKvC9n/XciImrKyh1klHxkObJyDLOPV4bgFwU3aVsIVUbWCiWy3neOLgKr0aMUHIek
 0NSngTMxx8DjsFkfMuXWB0smpjqDSk9nU7eQqPRQGKUd7kU0yEBSEA0efmg/nLOMaH+H7Y6iU6T
 WhvVD+sCwgoeBO2zMnM4hY5EYBjaR
X-Received: by 2002:a05:620a:1aa6:b0:7c5:a441:f440 with SMTP id
 af79cd13be357-7c7759e9d30mr1725584385a.12.1744038682998; 
 Mon, 07 Apr 2025 08:11:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRS1FrXPz3AmbGE2tg5haOPLRSCdn0vGVwkzaeJ13cWsadNmoGINiNLetvdppkqJEdmfvUAg==
X-Received: by 2002:a05:620a:1aa6:b0:7c5:a441:f440 with SMTP id
 af79cd13be357-7c7759e9d30mr1725579785a.12.1744038682596; 
 Mon, 07 Apr 2025 08:11:22 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54c1e635becsm1312572e87.127.2025.04.07.08.11.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 08:11:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 07 Apr 2025 18:11:07 +0300
Subject: [PATCH v5 10/11] drm/display: bridge-connector: handle CEC
 adapters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-drm-hdmi-connector-cec-v5-10-04809b10d206@oss.qualcomm.com>
References: <20250407-drm-hdmi-connector-cec-v5-0-04809b10d206@oss.qualcomm.com>
In-Reply-To: <20250407-drm-hdmi-connector-cec-v5-0-04809b10d206@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5742;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=QRIGbScjEyySA/y+XPmHc6N8KQV7f9VPKEmp6IO+aIA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn8+sE/8G0BItHha2H5mPB5R3piO8M5sc/iCJl2
 HxpAngot/aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/PrBAAKCRCLPIo+Aiko
 1SViCACs1J6fSUZmaxRVTP6iMOebd9Fb1uSx7axRVey78qD/25pmbtvGOkMancYhR+kFh9wufek
 ChxHuePP3D496KDJsAD4dDz7kzRsY5gOGAFv7X6PjN8kXt7E5JRkjJ6hkP19wrhEz4FJq2A4yoc
 rNgwDUX4wi4GHa5zKUqR9qirQHz0w3mnIHKtpc9drtS3VhXLTvoC9k3AZsU+yroqzqbmg6r4q0u
 52o5KCJwScsXY+zsbseKHJwEs10HeqEnF9dYqtSR9NY8aOCmc0fyUF1aTLw01BFyDnEYueX+H7n
 LpLXGRA6Ar15N5nFmAfR0GDQlytfNQqAImi9/jHcnDHOIkCu
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 6QVVXBtYLRXXDlTKr0T1w3kzBjSYxQyn
X-Authority-Analysis: v=2.4 cv=LLlmQIW9 c=1 sm=1 tr=0 ts=67f3eb1c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ctLpbLA6xJCkk-8Cp5MA:9
 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 6QVVXBtYLRXXDlTKr0T1w3kzBjSYxQyn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_04,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=999 malwarescore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070105
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
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 83 ++++++++++++++++++++++++++
 include/drm/drm_bridge.h                       | 26 ++++++++
 2 files changed, 109 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index daf6117268d9d3bb0c0c12b5094e79ad13cf72dd..54b49be7837a174e0a25eec3395fd10d9c487c9e 100644
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
+		ret = drm_connector_hdmi_cec_register(connector,
+						      &drm_bridge_connector_hdmi_cec_funcs,
+						      bridge->hdmi_cec_adapter_name,
+						      bridge->hdmi_cec_available_las,
+						      bridge->hdmi_cec_dev);
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

