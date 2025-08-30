Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E59B3C620
	for <lists+dri-devel@lfdr.de>; Sat, 30 Aug 2025 02:23:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1944B10E3D1;
	Sat, 30 Aug 2025 00:23:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="J8RJnxQx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B795E10E3C5
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Aug 2025 00:23:07 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57TLCZlj018649
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Aug 2025 00:23:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kH4F789rUONV5RVLnN6XvDn+O4ndP150jopdWJYF18w=; b=J8RJnxQxY1g0eIZ8
 /FBRGycO0rITrdKwWJ2S3286wyH/UtHL/qJPywhIqyETlcPSEAXpowmFi6rxoEQe
 3vLGyyAJ6k16VizOAchCacy14vPS4vUkmKeqr/txCyCkZLkUhwBn6kMEfPVx3K9g
 O1CRDMDsV77AYPdJh7PgZLZevPotTaL2KaL+igVME/DSyuQy9YC9t4wUQB5axnnQ
 iEDnb2DlL7r5P2pJHZv6xZZUx9XrfLO3UVSVnWMuPVHQRBDcJPZle2pI9KmVBTrD
 N31iHHHn+6mh6zUnHQ23oMHfxq+yNqSK4YBAogvzGX5Z/kicoqtRbsI0KE+6nwN4
 AV8lCg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48tn67nbub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Aug 2025 00:23:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b30d6ed3a4so27092871cf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 17:23:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756513385; x=1757118185;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kH4F789rUONV5RVLnN6XvDn+O4ndP150jopdWJYF18w=;
 b=sBI78ru6w6zPVkDkCcUGf5uU/Z/OQCXdRwh6pDtcg4oVx9raa21XljCZxwg27hH6Wa
 3BYq3pecvY8qBKEaUO3tshV21qvFRV7mlw1N3OFkAGuTlicQ6JmS2GMJwPndaxRrJtQU
 aBfmSDvArIUPS1B1dublQ3An6CaCTVypWbAb+t1i9brP8jzH0uNAhJj8cHhU/GWBsLKO
 I/rKAj/LkbTWep7gmRJNUnwG7e+7ed1WvALHyI9auRDDBYgClEt3Nw2qUjhkq2ixfHE9
 UMtCClIsXFK6NAElMP0QiuHGPefFNg+WzI92Y6GyFfTQE6xVJ26BYl6YyXC4jNL3xOJ7
 d3EQ==
X-Gm-Message-State: AOJu0YzntuZZW8P/o0V49Scko8M3PpAn4ZWXPQzLM9aTk9XYy0mixfT4
 0UPOhdT3+JYHXJGTgzJEcfRwAQssPDjdzQpy8MotffmVx2l+IJ8jNPSghURDbXnTowFfHxLkwQK
 XaSzz6AjyIBitXNJxlFjhDHI+4K0Kti+lMRlTl92xsC4LfJiqFA2zPqeL5bTEOYkhrC9zWJY=
X-Gm-Gg: ASbGncsUCQCnMaVr7IsezsvkC8aCxK0KLl6iS5uqO2Lr5eZg4Knt4XtdFrnpeOkYoj7
 C2wJriN4tJV18Hjw0XbZjLuUAAtP1wokhkka2Cp//e+bpphqzSTZCAu5i2EF//uTPNUM6EAfrOG
 uVP4waW28TqXY6bvYyaG9Z41PY1/qZ1Vc/nch+Y5fBdO9a7ub8G6+mYqUjBNnZxRoEoRIVE45dB
 na3Sc7Rzjppy9WxO2WuDKQAbRR1TCw4zlr3FwD/V5HSkxR75uzilISV5Kc904IGvrTSmsIYR4nI
 7KDe5tfyNdFYns16RQrak0moDZSOEOYUUMqhhDygQoRrUH+3FGGzBOoyPsuSvUGLawbfnkZCoDR
 upEXZob9jPdv6DeVDhLI+ygZzEMeDFpoXVIrFadZtnm16wVZlBkjH
X-Received: by 2002:a05:622a:4c8:b0:4af:2267:ef66 with SMTP id
 d75a77b69052e-4b31d873df2mr6591371cf.18.1756513384859; 
 Fri, 29 Aug 2025 17:23:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFA4NK5l7LhihpNUoDzqT2vumCNfJdqQs5yfFPqsO8l4doHfbc/t3ai6Yj0eCsazsEatXRCMQ==
X-Received: by 2002:a05:622a:4c8:b0:4af:2267:ef66 with SMTP id
 d75a77b69052e-4b31d873df2mr6590911cf.18.1756513383995; 
 Fri, 29 Aug 2025 17:23:03 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f676dc52esm1019907e87.8.2025.08.29.17.23.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 17:23:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 30 Aug 2025 03:22:57 +0300
Subject: [PATCH v3 01/11] drm/connector: let drivers declare infoframes as
 unsupported
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-drm-limit-infoframes-v3-1-32fcbec4634e@oss.qualcomm.com>
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
In-Reply-To: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Liu Ying <victor.liu@nxp.com>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=25217;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=voT7aMvCokvd0wqw9VJDsY1XcFoLXNViHe0msR8SNbI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoskRjA+KjllDkq4LzZoGJXoyU3RPblozDvrzcr
 QSLBvuSFVGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLJEYwAKCRCLPIo+Aiko
 1UkvB/0Zq3aMNM3YpNCSl3kbPFf7aqRpOVw71YcbkyLlmTJKJrJIdtmkIZ6O0MIvnsd8RNWtHTs
 CMxcLoLtETlX0MjEq5nFPWj8fIZK36AXTYyhuZ8zFMOZIbAIeA/r1lKTtd7/NQnjV2DkOVZvk7/
 lVqyaK6R3hEGuThIkU9gFrIarOjA7uE+opFrDSlWr3qNCSF2H8Bz5vEdvEVeCATV54O9dKMFelw
 nTbvPFc59ASgWwKXFVXkrUuTkbvHmIisX+HtkBOXz4WlXH1yt8uABj2bPwjcEuX8XI6XR7KIWGk
 LzPOXx5ma0EuXkC15nzQS+QLeRTjuQgrFJmLCQx2I0SVRAWI
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI4MDA4NSBTYWx0ZWRfX/2OnQ4/ZHRCU
 Tt1PpOd+IbQg8ABYF0yygWnCH2USLLJDp+qdOQOagIY9korBLZdG3QUniIbO8dJwKkKtW8l5i+s
 yhoymKHZPJLwk1qA8X+MlMv3hchOVQU9dWuKvRd8JgEQe+wNl8j4ep4Z4VAoyqDhn+fgTf/F996
 EOJklmD75nfqBEiOH63xg+5Ok6mlrCArO1mwojq5jtTk8TpSl08wsqxBxKKxO9xrp6abtGK3e2H
 6AlvBMbbESgbinDzS8SisXNplEHvq3egfSU+Aj2pYjnRvVSQxSFBYwyKclvCaoNQQX/IfL+xT4C
 jFlwHGjioVT8F0B/ucSQsCyAFU7NML20CYckb7faM16+ThyJB8UZnHCTQMIoFaYJdG63ceAC1ho
 5AgEYH9K
X-Proofpoint-GUID: veAwiQm8SMpCj9ZVP-DQEi1lyGeUdYHd
X-Proofpoint-ORIG-GUID: veAwiQm8SMpCj9ZVP-DQEi1lyGeUdYHd
X-Authority-Analysis: v=2.4 cv=P7c6hjAu c=1 sm=1 tr=0 ts=68b2446b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=qxzRNHnKRX2O3p43D1oA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 adultscore=0 phishscore=0 malwarescore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508280085
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

Currently DRM framework expects that the HDMI connector driver supports
all infoframe types: it generates the data as required and calls into
the driver to program all of them, letting the driver to soft-fail if
the infoframe is unsupported. This has a major drawback on userspace
API: the framework also registers debugfs files for all Infoframe types,
possibly surprising the users when infoframe is visible in the debugfs
file, but it is not visible on the wire.

Let drivers declare that they support only a subset of infoframes,
creating a more consistent interface.

Acked-by: Liu Ying <victor.liu@nxp.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c     |  7 +++
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    | 53 ++++++++++++++++++++--
 drivers/gpu/drm/drm_connector.c                    |  7 +++
 drivers/gpu/drm/drm_debugfs.c                      | 16 +++++--
 drivers/gpu/drm/rockchip/inno_hdmi.c               |  6 ++-
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |  4 +-
 drivers/gpu/drm/tests/drm_connector_test.c         | 49 ++++++++++++++++++++
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |  9 ++++
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  6 +++
 include/drm/drm_bridge.h                           | 14 ++++++
 include/drm/drm_connector.h                        | 39 ++++++++++++++++
 11 files changed, 197 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 091c5335355a2b6c70dd823df69ce060fd56c4f9..944fb497ca339ddd63c132c2df0888011cc0487f 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -786,6 +786,13 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 					       &drm_bridge_connector_hdmi_funcs,
 					       connector_type, ddc,
 					       supported_formats,
+					       bridge->software_infoframes ? :
+					       DRM_CONNECTOR_INFOFRAME_AUDIO |
+					       DRM_CONNECTOR_INFOFRAME_AVI |
+					       DRM_CONNECTOR_INFOFRAME_DRM |
+					       DRM_CONNECTOR_INFOFRAME_SPD |
+					       DRM_CONNECTOR_INFOFRAME_VENDOR,
+					       bridge->autogenerated_infoframes,
 					       max_bpc);
 		if (ret)
 			return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index a561f124be99a0cd4259dbacf5f5f6651ff8a0ea..182ef9075e2f6cee1bc9b52b07e336e3f28f94b8 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -687,6 +687,9 @@ static int hdmi_generate_avi_infoframe(const struct drm_connector *connector,
 
 	infoframe->set = false;
 
+	if (!drm_hdmi_connector_software_infoframe(connector, HDMI_INFOFRAME_TYPE_AVI))
+		return 0;
+
 	ret = drm_hdmi_avi_infoframe_from_display_mode(frame, connector, mode);
 	if (ret)
 		return ret;
@@ -718,6 +721,9 @@ static int hdmi_generate_spd_infoframe(const struct drm_connector *connector,
 
 	infoframe->set = false;
 
+	if (!drm_hdmi_connector_software_infoframe(connector, HDMI_INFOFRAME_TYPE_SPD))
+		return 0;
+
 	ret = hdmi_spd_infoframe_init(frame,
 				      connector->hdmi.vendor,
 				      connector->hdmi.product);
@@ -742,6 +748,9 @@ static int hdmi_generate_hdr_infoframe(const struct drm_connector *connector,
 
 	infoframe->set = false;
 
+	if (!drm_hdmi_connector_software_infoframe(connector, HDMI_INFOFRAME_TYPE_DRM))
+		return 0;
+
 	if (connector->max_bpc < 10)
 		return 0;
 
@@ -771,6 +780,9 @@ static int hdmi_generate_hdmi_vendor_infoframe(const struct drm_connector *conne
 
 	infoframe->set = false;
 
+	if (!drm_hdmi_connector_software_infoframe(connector, HDMI_INFOFRAME_TYPE_VENDOR))
+		return 0;
+
 	if (!info->has_hdmi_infoframe)
 		return 0;
 
@@ -898,13 +910,23 @@ static int clear_device_infoframe(struct drm_connector *connector,
 	struct drm_device *dev = connector->dev;
 	int ret;
 
-	drm_dbg_kms(dev, "Clearing infoframe type 0x%x\n", type);
-
 	if (!funcs || !funcs->clear_infoframe) {
 		drm_dbg_kms(dev, "Function not implemented, bailing.\n");
 		return 0;
 	}
 
+	if (!drm_hdmi_connector_autogenerated_infoframe(connector, type)) {
+		drm_dbg_kms(dev, "Infoframe 0x%02x not managed by DRM, bailing.\n", type);
+		return 0;
+	}
+
+	if (!drm_hdmi_connector_software_infoframe(connector, type)) {
+		drm_dbg_kms(dev, "Infoframe 0x%02x not supported, bailing.\n", type);
+		return 0;
+	}
+
+	drm_dbg_kms(dev, "Clearing infoframe type 0x%02x\n", type);
+
 	ret = funcs->clear_infoframe(connector, type);
 	if (ret) {
 		drm_dbg_kms(dev, "Call failed: %d\n", ret);
@@ -930,23 +952,34 @@ static int write_device_infoframe(struct drm_connector *connector,
 				  union hdmi_infoframe *frame)
 {
 	const struct drm_connector_hdmi_funcs *funcs = connector->hdmi.funcs;
+	enum hdmi_infoframe_type type = frame->any.type;
 	struct drm_device *dev = connector->dev;
 	u8 buffer[HDMI_INFOFRAME_SIZE(MAX)];
 	int ret;
 	int len;
 
-	drm_dbg_kms(dev, "Writing infoframe type %x\n", frame->any.type);
-
 	if (!funcs || !funcs->write_infoframe) {
 		drm_dbg_kms(dev, "Function not implemented, bailing.\n");
 		return -EINVAL;
 	}
 
+	if (!drm_hdmi_connector_autogenerated_infoframe(connector, type)) {
+		drm_dbg_kms(dev, "Infoframe 0x%02x not managed by DRM, bailing.\n", type);
+		return 0;
+	}
+
+	if (!drm_hdmi_connector_software_infoframe(connector, type)) {
+		drm_dbg_kms(dev, "Infoframe 0x%02x not supported, bailing.\n", type);
+		return 0;
+	}
+
+	drm_dbg_kms(dev, "Writing infoframe type 0x%02x\n", type);
+
 	len = hdmi_infoframe_pack(frame, buffer, sizeof(buffer));
 	if (len < 0)
 		return len;
 
-	ret = funcs->write_infoframe(connector, frame->any.type, buffer, len);
+	ret = funcs->write_infoframe(connector, type, buffer, len);
 	if (ret) {
 		drm_dbg_kms(dev, "Call failed: %d\n", ret);
 		return ret;
@@ -1067,6 +1100,11 @@ drm_atomic_helper_connector_hdmi_update_audio_infoframe(struct drm_connector *co
 	struct drm_display_info *info = &connector->display_info;
 	int ret;
 
+	if (!drm_hdmi_connector_software_infoframe(connector, HDMI_INFOFRAME_TYPE_AUDIO)) {
+		drm_warn_once(connector->dev, "Audio Infoframe not supported, bailing.\n");
+		return -EOPNOTSUPP;
+	}
+
 	if (!info->is_hdmi)
 		return 0;
 
@@ -1102,6 +1140,11 @@ drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *con
 	struct drm_display_info *info = &connector->display_info;
 	int ret;
 
+	if (!drm_hdmi_connector_software_infoframe(connector, HDMI_INFOFRAME_TYPE_AUDIO)) {
+		drm_warn_once(connector->dev, "Audio Infoframe not supported, bailing.\n");
+		return -EOPNOTSUPP;
+	}
+
 	if (!info->is_hdmi)
 		return 0;
 
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 272d6254ea4784e97ca894ec4d463beebf9fdbf0..f031e8f8df57da15bb0f8fe21fd62f02a1576ebe 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -553,6 +553,8 @@ EXPORT_SYMBOL(drmm_connector_init);
  * @connector_type: user visible type of the connector
  * @ddc: optional pointer to the associated ddc adapter
  * @supported_formats: Bitmask of @hdmi_colorspace listing supported output formats
+ * @software_infoframes: Bitmask of @DRM_CONNECTOR_INFOFRAME listing Infoframes generated by DRM core
+ * @autogenerated_infoframes: Bitmask of @DRM_CONNECTOR_INFOFRAME listing Infoframes generated in hardware
  * @max_bpc: Maximum bits per char the HDMI connector supports
  *
  * Initialises a preallocated HDMI connector. Connectors can be
@@ -576,6 +578,8 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 			     int connector_type,
 			     struct i2c_adapter *ddc,
 			     unsigned long supported_formats,
+			     unsigned long software_infoframes,
+			     unsigned long autogenerated_infoframes,
 			     unsigned int max_bpc)
 {
 	int ret;
@@ -623,6 +627,9 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 
 	connector->hdmi.funcs = hdmi_funcs;
 
+	connector->hdmi.software_infoframes = software_infoframes;
+	connector->hdmi.autogenerated_infoframes = autogenerated_infoframes;
+
 	return 0;
 }
 EXPORT_SYMBOL(drmm_connector_hdmi_init);
diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 365cf337529fa2a88b69516d57360d212419c126..03e4ae81352bb7ffb3cf45219a96e7959eafe365 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -672,6 +672,9 @@ static int create_hdmi_audio_infoframe_file(struct drm_connector *connector,
 {
 	struct dentry *file;
 
+	if (!drm_hdmi_connector_software_infoframe(connector, HDMI_INFOFRAME_TYPE_AUDIO))
+		return 0;
+
 	file = debugfs_create_file("audio", 0400, parent, connector, &audio_infoframe_fops);
 	if (IS_ERR(file))
 		return PTR_ERR(file);
@@ -679,7 +682,7 @@ static int create_hdmi_audio_infoframe_file(struct drm_connector *connector,
 	return 0;
 }
 
-#define DEFINE_INFOFRAME_FILE(_f) \
+#define DEFINE_INFOFRAME_FILE(_f, _F) \
 static ssize_t _f##_read_infoframe(struct file *filp, \
 				   char __user *ubuf, \
 				   size_t count,      \
@@ -726,6 +729,9 @@ static int create_hdmi_## _f ## _infoframe_file(struct drm_connector *connector,
 { \
 	struct dentry *file; \
 	\
+	if (!drm_hdmi_connector_software_infoframe(connector, HDMI_INFOFRAME_TYPE_ ## _F)) \
+		return 0; \
+	\
 	file = debugfs_create_file(#_f, 0400, parent, connector, &_f ## _infoframe_fops); \
 	if (IS_ERR(file)) \
 		return PTR_ERR(file); \
@@ -733,10 +739,10 @@ static int create_hdmi_## _f ## _infoframe_file(struct drm_connector *connector,
 	return 0; \
 }
 
-DEFINE_INFOFRAME_FILE(avi);
-DEFINE_INFOFRAME_FILE(hdmi);
-DEFINE_INFOFRAME_FILE(hdr_drm);
-DEFINE_INFOFRAME_FILE(spd);
+DEFINE_INFOFRAME_FILE(avi, AVI);
+DEFINE_INFOFRAME_FILE(hdmi, VENDOR);
+DEFINE_INFOFRAME_FILE(hdr_drm, DRM);
+DEFINE_INFOFRAME_FILE(spd, SPD);
 
 static int create_hdmi_infoframe_files(struct drm_connector *connector,
 				       struct dentry *parent)
diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 1ab3ad4bde9ea7305021186ea221d2ff9057fdbb..9957615b407cd959928b9c9d116d3955a7924e61 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -645,7 +645,7 @@ static int inno_hdmi_disable_frame(struct drm_connector *connector,
 	if (type != HDMI_INFOFRAME_TYPE_AVI) {
 		drm_err(connector->dev,
 			"Unsupported infoframe type: %u\n", type);
-		return 0;
+		return -EOPNOTSUPP;
 	}
 
 	hdmi_writeb(hdmi, HDMI_CONTROL_PACKET_BUF_INDEX, INFOFRAME_AVI);
@@ -663,7 +663,7 @@ static int inno_hdmi_upload_frame(struct drm_connector *connector,
 	if (type != HDMI_INFOFRAME_TYPE_AVI) {
 		drm_err(connector->dev,
 			"Unsupported infoframe type: %u\n", type);
-		return 0;
+		return -EOPNOTSUPP;
 	}
 
 	inno_hdmi_disable_frame(connector, type);
@@ -1065,6 +1065,8 @@ static int inno_hdmi_register(struct drm_device *drm, struct inno_hdmi *hdmi)
 				 DRM_MODE_CONNECTOR_HDMIA,
 				 hdmi->ddc,
 				 BIT(HDMI_COLORSPACE_RGB),
+				 DRM_CONNECTOR_INFOFRAME_AVI,
+				 0,
 				 8);
 
 	drm_connector_attach_encoder(&hdmi->connector, encoder);
diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index ab0938ba61f7d75dd0bec473807a04a20e1cffbd..a01f837a0a7b4685a6fd9db9908890cd423ff197 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -50,7 +50,7 @@ static int sun4i_hdmi_write_infoframe(struct drm_connector *connector,
 	if (type != HDMI_INFOFRAME_TYPE_AVI) {
 		drm_err(connector->dev,
 			"Unsupported infoframe type: %u\n", type);
-		return 0;
+		return -EOPNOTSUPP;
 	}
 
 	for (i = 0; i < len; i++)
@@ -640,6 +640,8 @@ static int sun4i_hdmi_bind(struct device *dev, struct device *master,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       hdmi->ddc_i2c,
 				       BIT(HDMI_COLORSPACE_RGB),
+				       DRM_CONNECTOR_INFOFRAME_AVI,
+				       0,
 				       8);
 	if (ret) {
 		dev_err(dev,
diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index 22e2d959eb31459f9981fef488228904d67cb6f9..1b42a9fad8715b496ad14ba589bb9721b2075ad9 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -641,6 +641,13 @@ static struct kunit_suite drm_connector_dynamic_register_test_suite = {
 	.test_cases = drm_connector_dynamic_register_tests,
 };
 
+#define DRM_CONNECTOR_ALL_INFOFRAMES \
+	(DRM_CONNECTOR_INFOFRAME_AUDIO | \
+	 DRM_CONNECTOR_INFOFRAME_AVI | \
+	 DRM_CONNECTOR_INFOFRAME_DRM | \
+	 DRM_CONNECTOR_INFOFRAME_SPD | \
+	 DRM_CONNECTOR_INFOFRAME_VENDOR)
+
 /*
  * Test that the registration of a bog standard connector works as
  * expected and doesn't report any error.
@@ -657,6 +664,8 @@ static void drm_test_connector_hdmi_init_valid(struct kunit *test)
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
+				       DRM_CONNECTOR_ALL_INFOFRAMES,
+				       0,
 				       8);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 }
@@ -677,6 +686,8 @@ static void drm_test_connector_hdmi_init_null_ddc(struct kunit *test)
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       NULL,
 				       BIT(HDMI_COLORSPACE_RGB),
+				       DRM_CONNECTOR_ALL_INFOFRAMES,
+				       0,
 				       8);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 }
@@ -697,6 +708,8 @@ static void drm_test_connector_hdmi_init_null_vendor(struct kunit *test)
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
+				       DRM_CONNECTOR_ALL_INFOFRAMES,
+				       0,
 				       8);
 	KUNIT_EXPECT_LT(test, ret, 0);
 }
@@ -717,6 +730,8 @@ static void drm_test_connector_hdmi_init_null_product(struct kunit *test)
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
+				       DRM_CONNECTOR_ALL_INFOFRAMES,
+				       0,
 				       8);
 	KUNIT_EXPECT_LT(test, ret, 0);
 }
@@ -743,6 +758,8 @@ static void drm_test_connector_hdmi_init_product_valid(struct kunit *test)
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
+				       DRM_CONNECTOR_ALL_INFOFRAMES,
+				       0,
 				       8);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 	KUNIT_EXPECT_MEMEQ(test,
@@ -776,6 +793,8 @@ static void drm_test_connector_hdmi_init_product_length_exact(struct kunit *test
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
+				       DRM_CONNECTOR_ALL_INFOFRAMES,
+				       0,
 				       8);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 	KUNIT_EXPECT_MEMEQ(test,
@@ -803,6 +822,8 @@ static void drm_test_connector_hdmi_init_product_length_too_long(struct kunit *t
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
+				       DRM_CONNECTOR_ALL_INFOFRAMES,
+				       0,
 				       8);
 	KUNIT_EXPECT_LT(test, ret, 0);
 }
@@ -829,6 +850,8 @@ static void drm_test_connector_hdmi_init_vendor_valid(struct kunit *test)
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
+				       DRM_CONNECTOR_ALL_INFOFRAMES,
+				       0,
 				       8);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 	KUNIT_EXPECT_MEMEQ(test,
@@ -861,6 +884,8 @@ static void drm_test_connector_hdmi_init_vendor_length_exact(struct kunit *test)
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
+				       DRM_CONNECTOR_ALL_INFOFRAMES,
+				       0,
 				       8);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 	KUNIT_EXPECT_MEMEQ(test,
@@ -888,6 +913,8 @@ static void drm_test_connector_hdmi_init_vendor_length_too_long(struct kunit *te
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
+				       DRM_CONNECTOR_ALL_INFOFRAMES,
+				       0,
 				       8);
 	KUNIT_EXPECT_LT(test, ret, 0);
 }
@@ -908,6 +935,8 @@ static void drm_test_connector_hdmi_init_bpc_invalid(struct kunit *test)
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
+				       DRM_CONNECTOR_ALL_INFOFRAMES,
+				       0,
 				       9);
 	KUNIT_EXPECT_LT(test, ret, 0);
 }
@@ -928,6 +957,8 @@ static void drm_test_connector_hdmi_init_bpc_null(struct kunit *test)
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
+				       DRM_CONNECTOR_ALL_INFOFRAMES,
+				       0,
 				       0);
 	KUNIT_EXPECT_LT(test, ret, 0);
 }
@@ -953,6 +984,8 @@ static void drm_test_connector_hdmi_init_bpc_8(struct kunit *test)
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
+				       DRM_CONNECTOR_ALL_INFOFRAMES,
+				       0,
 				       8);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
@@ -994,6 +1027,8 @@ static void drm_test_connector_hdmi_init_bpc_10(struct kunit *test)
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
+				       DRM_CONNECTOR_ALL_INFOFRAMES,
+				       0,
 				       10);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
@@ -1035,6 +1070,8 @@ static void drm_test_connector_hdmi_init_bpc_12(struct kunit *test)
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
+				       DRM_CONNECTOR_ALL_INFOFRAMES,
+				       0,
 				       12);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
@@ -1071,6 +1108,8 @@ static void drm_test_connector_hdmi_init_formats_empty(struct kunit *test)
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       0,
+				       DRM_CONNECTOR_ALL_INFOFRAMES,
+				       0,
 				       8);
 	KUNIT_EXPECT_LT(test, ret, 0);
 }
@@ -1091,6 +1130,8 @@ static void drm_test_connector_hdmi_init_formats_no_rgb(struct kunit *test)
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_YUV422),
+				       DRM_CONNECTOR_ALL_INFOFRAMES,
+				       0,
 				       8);
 	KUNIT_EXPECT_LT(test, ret, 0);
 }
@@ -1149,6 +1190,8 @@ static void drm_test_connector_hdmi_init_formats_yuv420_allowed(struct kunit *te
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       params->supported_formats,
+				       DRM_CONNECTOR_ALL_INFOFRAMES,
+				       0,
 				       8);
 	KUNIT_EXPECT_EQ(test, ret, params->expected_result);
 }
@@ -1170,6 +1213,8 @@ static void drm_test_connector_hdmi_init_type_valid(struct kunit *test)
 				       connector_type,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
+				       DRM_CONNECTOR_ALL_INFOFRAMES,
+				       0,
 				       8);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 }
@@ -1205,6 +1250,8 @@ static void drm_test_connector_hdmi_init_type_invalid(struct kunit *test)
 				       connector_type,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
+				       DRM_CONNECTOR_ALL_INFOFRAMES,
+				       0,
 				       8);
 	KUNIT_EXPECT_LT(test, ret, 0);
 }
@@ -1482,6 +1529,8 @@ static void drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector(
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
+				       DRM_CONNECTOR_ALL_INFOFRAMES,
+				       0,
 				       8);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 8bd412735000cb18e66aeca21433b2ebbefe2b44..c41c1cd875ba1c58610480a468cc3c36c48624dc 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -138,6 +138,13 @@ static const struct drm_connector_funcs dummy_connector_funcs = {
 	.reset			= dummy_hdmi_connector_reset,
 };
 
+#define DRM_CONNECTOR_ALL_INFOFRAMES \
+	(DRM_CONNECTOR_INFOFRAME_AUDIO | \
+	 DRM_CONNECTOR_INFOFRAME_AVI | \
+	 DRM_CONNECTOR_INFOFRAME_DRM | \
+	 DRM_CONNECTOR_INFOFRAME_SPD | \
+	 DRM_CONNECTOR_INFOFRAME_VENDOR)
+
 static
 struct drm_atomic_helper_connector_hdmi_priv *
 __connector_hdmi_init(struct kunit *test,
@@ -192,6 +199,8 @@ __connector_hdmi_init(struct kunit *test,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       NULL,
 				       formats,
+				       DRM_CONNECTOR_ALL_INFOFRAMES,
+				       0,
 				       max_bpc);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 07c91b450f93ab9e795d040d6f60f485ac71cfe8..856830482c31f708455b358921544fe82640f04d 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -556,6 +556,12 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
 				       BIT(HDMI_COLORSPACE_RGB) |
 				       BIT(HDMI_COLORSPACE_YUV422) |
 				       BIT(HDMI_COLORSPACE_YUV444),
+				       DRM_CONNECTOR_INFOFRAME_AUDIO |
+				       DRM_CONNECTOR_INFOFRAME_AVI |
+				       DRM_CONNECTOR_INFOFRAME_DRM |
+				       DRM_CONNECTOR_INFOFRAME_SPD |
+				       DRM_CONNECTOR_INFOFRAME_VENDOR,
+				       0,
 				       max_bpc);
 	if (ret)
 		return ret;
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 8d9d4fd078e72977677fd992d725261232754e3e..71e64818a93d803067097532f9025418d7ab25b9 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1205,6 +1205,20 @@ struct drm_bridge {
 	 */
 	unsigned int max_bpc;
 
+	/**
+	 * @software_infoframes: Bitmask of DRM_CONNECTOR_INFOFRAME values,
+	 * listing InfoFrames to be generated by the DRM core. This is only
+	 * relevant if @DRM_BRIDGE_OP_HDMI is set.
+	 */
+	unsigned int software_infoframes;
+
+	/**
+	 * @autogenerated_infoframes: Bitmask of DRM_CONNECTOR_INFOFRAME values,
+	 * listing InfoFrames generated by the hardware. This is only
+	 * relevant if @DRM_BRIDGE_OP_HDMI is set.
+	 */
+	unsigned int autogenerated_infoframes;
+
 	/**
 	 * @hdmi_cec_dev: device to be used as a containing device for CEC
 	 * functions.
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 8f34f4b8183d83dccd3e820a444fbf74fb6c16f2..e18e748036ec2618e885fca392a175d632120f98 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1839,6 +1839,21 @@ struct drm_connector_hdmi {
 	 */
 	unsigned long supported_formats;
 
+	/**
+	 * @software_infoframes: Bitmask of infoframe types supported by the
+	 * controller and generated AS IS by the software.
+	 * See @DRM_CONNECTOR_INFOFRAME and
+	 * @drm_connector_hdmi_funcs.write_infoframe().
+	 */
+	unsigned long software_infoframes;
+
+	/**
+	 * @autogenerated_infoframes: Bitmask of infoframe types supported by
+	 * the controller and either autogenerated by the controller or written
+	 * in non-opaque format. See @DRM_CONNECTOR_INFOFRAME.
+	 */
+	unsigned long autogenerated_infoframes;
+
 	/**
 	 * @funcs: HDMI connector Control Functions
 	 */
@@ -2336,6 +2351,8 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 			     int connector_type,
 			     struct i2c_adapter *ddc,
 			     unsigned long supported_formats,
+			     unsigned long software_infoframes,
+			     unsigned long autogenerated_infoframes,
 			     unsigned int max_bpc);
 void drm_connector_attach_edid_property(struct drm_connector *connector);
 int drm_connector_register(struct drm_connector *connector);
@@ -2488,6 +2505,28 @@ void drm_connector_attach_privacy_screen_provider(
 	struct drm_connector *connector, struct drm_privacy_screen *priv);
 void drm_connector_update_privacy_screen(const struct drm_connector_state *connector_state);
 
+#define DRM_CONNECTOR_INFOFRAME(type)		((type) > 0x80 ? BIT((type) - 0x80) : 0)
+
+#define DRM_CONNECTOR_INFOFRAME_AUDIO	DRM_CONNECTOR_INFOFRAME(HDMI_INFOFRAME_TYPE_AUDIO)
+#define DRM_CONNECTOR_INFOFRAME_AVI	DRM_CONNECTOR_INFOFRAME(HDMI_INFOFRAME_TYPE_AVI)
+#define DRM_CONNECTOR_INFOFRAME_DRM	DRM_CONNECTOR_INFOFRAME(HDMI_INFOFRAME_TYPE_DRM)
+#define DRM_CONNECTOR_INFOFRAME_SPD	DRM_CONNECTOR_INFOFRAME(HDMI_INFOFRAME_TYPE_SPD)
+#define DRM_CONNECTOR_INFOFRAME_VENDOR	DRM_CONNECTOR_INFOFRAME(HDMI_INFOFRAME_TYPE_VENDOR)
+
+static inline bool
+drm_hdmi_connector_software_infoframe(const struct drm_connector *connector,
+				      enum hdmi_infoframe_type type)
+{
+	return connector->hdmi.software_infoframes & DRM_CONNECTOR_INFOFRAME(type);
+}
+
+static inline bool
+drm_hdmi_connector_autogenerated_infoframe(const struct drm_connector *connector,
+					   enum hdmi_infoframe_type type)
+{
+	return connector->hdmi.autogenerated_infoframes & DRM_CONNECTOR_INFOFRAME(type);
+}
+
 /**
  * struct drm_tile_group - Tile group metadata
  * @refcount: reference count

-- 
2.47.2

