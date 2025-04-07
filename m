Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE77BA7E36F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 17:11:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF5410E4DE;
	Mon,  7 Apr 2025 15:11:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fkr8oBMW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3578310E4DD
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 15:11:08 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378dkVv028065
 for <dri-devel@lists.freedesktop.org>; Mon, 7 Apr 2025 15:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lCTTLYELgEB4afW0sXqvdFWgp95Hv4OasYO1O5ZEWH8=; b=fkr8oBMWhgPwN0nv
 9krg5bNsDo+xMLfWxw4fahCSJ3BSifYd5w1XHRWTopISL4O2+owZ8jYTNHAVKcql
 FY8yDpxUZvCXspQV8MCU6f+jjEyDY1EgaIyKILaenJtFf3ELq/gczgJFss/SJQL7
 FisHq+UrDmovcec9Po8m61b4RLGIRhj2QrmqsYDRZcxNKYcbHVyuBv2E7ItclHq9
 fzMSCS2/HSD909/NspQFcezh/+O/KvaNK2ABRaLExRpcg9fjvDF/N16KFghzJpYw
 LVLng60pioW+q2eWpt4k8sbDw7aIJK3p/KQWAqsvNqadmZWVkBHIB8IbKN8z8s0V
 dnXYYg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcyvn65-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 15:11:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c549ea7166so721690385a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 08:11:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744038666; x=1744643466;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lCTTLYELgEB4afW0sXqvdFWgp95Hv4OasYO1O5ZEWH8=;
 b=WtpFUdpqgzx985F7R12isgNhrWpwIKIuvYCDjaFtin1w4FYPOAqEF8OY4+Ea7myEX+
 gqEIlPdCpvnPWWnvoDynPKfmRLG0AhMllRBxT1k/hpOtJ97c3M9mzbmbGWRN6aDMMYMm
 wLPGoert6Ui38CEjInrB7OsGg1vSESCvsWdzCwG3nIZR9STv6iEm4gyHlp8M2pPZefs0
 KQSyR8YvO97UyB5hUt/Q/iVM6L5hsMsuFDsb5GrAWeMkSoA2TBxohM9kLJinkxVO0Pfy
 vnPZAKIaJvpaQAKqH9kYtzQofyzGhw5oMiLN8aZ/XTXf95Qu4O4Uk4DArSNVfr+mBAcm
 j/ig==
X-Gm-Message-State: AOJu0YyuIxSpZ7BVzLgifizlkhAaIPtx/euD5bT9SmTg2MZ9LAii6jtE
 BgWG+qfDK5mcfPFPWXQbt/KV6puW4nSz1BY+nRBVu5voR0ClWvJZIkg9yfjpoMohL6S22rQZLnw
 o3FuIGBTKWNCgo9WT37rLW/e1VikTXNW07sWIShp+bSZ/S3w1n3C4UEN5zhkuvNEo+gY=
X-Gm-Gg: ASbGnctW2px2YY1AJrDh1Wv/LovS7nFFWo62Zo3k1mmEFR9H0Tpt8G+4hhUe+ogRKHY
 g8D9cUxSW4dUDBvJMHTsLJJJrAsbryl6Q2pJsm6JhwRMzHrNAZkSTTrEzaRBweQixtQBOIhYL5M
 Z841faFVRwBOkB/nEW9vH5Ybxs0sFpV96gqlLWmW7NMU4sNC13tKbfso3f97wMNPON9p4l8wvCl
 3fZ7PH68VFzNhbmLPhTFiavpX/u8UcqN7lBbFVPKhhUJFevRZ37v7+qS7hHQhYLsOsjX5WSGBJq
 MCl14DfQXJ0wzY/kNmsHrK5F16cPy8VTOWI0Qb2vq6MVBmvlSwkuOO3fongTePzdqlVrLUAag2A
 jrnz0BR1a9GjugxApP0ZxiQGhGb0g
X-Received: by 2002:a05:620a:248e:b0:7c5:3cf6:7838 with SMTP id
 af79cd13be357-7c774e4a03amr2423586285a.49.1744038666363; 
 Mon, 07 Apr 2025 08:11:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaG9hk4ftjaorAgQ/sNiXD77uVKuHzcnv87RLk+fL00AZq4boIwdlRJCSjXKSXcbSck+lxeQ==
X-Received: by 2002:a05:620a:248e:b0:7c5:3cf6:7838 with SMTP id
 af79cd13be357-7c774e4a03amr2423582085a.49.1744038665941; 
 Mon, 07 Apr 2025 08:11:05 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54c1e635becsm1312572e87.127.2025.04.07.08.11.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 08:11:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 07 Apr 2025 18:10:59 +0300
Subject: [PATCH v5 02/11] drm/bridge: allow limiting I2S formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-drm-hdmi-connector-cec-v5-2-04809b10d206@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4874;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jWdmXnk5KQZ7QqiqS4ntkIepKln6k4Qq9yyz2/39Hbs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn8+sDgL9+FzBgNDstWAD0wnkAjUwbcRkIdXmG+
 EE/lELJAaKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/PrAwAKCRCLPIo+Aiko
 1Z4hB/wIreM6AGD73pyKCqLVHHRbeqyQ1cQj88+B0i2B3xOahvfEmcdGDuPWzoJdPfise95KJ5e
 MeVJbJ69pctJc1xnJTJRpJy61KfTX/7p33TgatNXObQkDijeHCh9KS46NBRi0QeLfT0E7bHgNN+
 FPNikJGbUAV4kD4tAQECm/SRtBBQNWjSIuI5v9hgi5R/46mmm8Ju4zNr/i348OU7XoprQaVx4IV
 aHClzqlWZcjEC0VTBJt9kNxyPj1QnvC96s8ED+grqbq+x1rFM5zzlqGOKW617l6/CuLxQqJhLm8
 bPgBesqADqv27Z6pGV32VJj+ktgxfwNxrlUZhrp/NKgnZJ3l
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: TcVFzlNMAR5wwcCkP1oPX5Ps2OgfwvPe
X-Authority-Analysis: v=2.4 cv=Q4vS452a c=1 sm=1 tr=0 ts=67f3eb0b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=JbrL1DnuwQtsaYKQthAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: TcVFzlNMAR5wwcCkP1oPX5Ps2OgfwvPe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_04,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070106
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

By default HDMI codec registers all formats supported on the I2S bus.
Allow bridges (and connectors) to limit the list of the PCM formats
supported by the HDMI codec.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c  | 1 +
 drivers/gpu/drm/display/drm_hdmi_audio_helper.c | 3 +++
 drivers/gpu/drm/vc4/vc4_hdmi.c                  | 2 +-
 include/drm/display/drm_hdmi_audio_helper.h     | 1 +
 include/drm/drm_bridge.h                        | 8 ++++++++
 5 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 7d2e499ea5dec2f710c1c67323bf9e6b177d3c9e..381a0f9d4259bf9f72d3a292b7dcc82e45c61bae 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -717,6 +717,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		ret = drm_connector_hdmi_audio_init(connector, dev,
 						    &drm_bridge_connector_hdmi_audio_funcs,
 						    bridge->hdmi_audio_max_i2s_playback_channels,
+						    bridge->hdmi_audio_i2s_formats,
 						    bridge->hdmi_audio_spdif_playback,
 						    bridge->hdmi_audio_dai_port);
 		if (ret)
diff --git a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
index 05afc9f0bdd6b6f00d74223a9d8875e6d16aea5f..21c93bdd8648cf70e691dbf0c92fae5823fd1828 100644
--- a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
@@ -142,6 +142,7 @@ static const struct hdmi_codec_ops drm_connector_hdmi_audio_ops = {
  * @hdmi_codec_dev: device to be used as a parent for the HDMI Codec
  * @funcs: callbacks for this HDMI Codec
  * @max_i2s_playback_channels: maximum number of playback I2S channels
+ * @i2s_formats: set of I2S formats (use 0 for a bus-specific set)
  * @spdif_playback: set if HDMI codec has S/PDIF playback port
  * @dai_port: sound DAI port, -1 if it is not enabled
  *
@@ -154,6 +155,7 @@ int drm_connector_hdmi_audio_init(struct drm_connector *connector,
 				  struct device *hdmi_codec_dev,
 				  const struct drm_connector_hdmi_audio_funcs *funcs,
 				  unsigned int max_i2s_playback_channels,
+				  u64 i2s_formats,
 				  bool spdif_playback,
 				  int dai_port)
 {
@@ -161,6 +163,7 @@ int drm_connector_hdmi_audio_init(struct drm_connector *connector,
 		.ops = &drm_connector_hdmi_audio_ops,
 		.max_i2s_channels = max_i2s_playback_channels,
 		.i2s = !!max_i2s_playback_channels,
+		.i2s_formats = i2s_formats,
 		.spdif = spdif_playback,
 		.no_i2s_capture = true,
 		.no_spdif_capture = true,
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index a29a6ef266f9a5952af53030a9a2d313e2ecdfce..4797ed1c21f47992fe4d497d904ee31c824cd449 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -562,7 +562,7 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
 
 	ret = drm_connector_hdmi_audio_init(connector, dev->dev,
 					    &vc4_hdmi_audio_funcs,
-					    8, false, -1);
+					    8, 0, false, -1);
 	if (ret)
 		return ret;
 
diff --git a/include/drm/display/drm_hdmi_audio_helper.h b/include/drm/display/drm_hdmi_audio_helper.h
index c9a6faef4109f20ba79b610a9d5e8d5980efe2d1..44d910bdc72dd2fdbbe7ada65b67080d4a41e88b 100644
--- a/include/drm/display/drm_hdmi_audio_helper.h
+++ b/include/drm/display/drm_hdmi_audio_helper.h
@@ -14,6 +14,7 @@ int drm_connector_hdmi_audio_init(struct drm_connector *connector,
 				  struct device *hdmi_codec_dev,
 				  const struct drm_connector_hdmi_audio_funcs *funcs,
 				  unsigned int max_i2s_playback_channels,
+				  u64 i2s_formats,
 				  bool spdif_playback,
 				  int sound_dai_port);
 void drm_connector_hdmi_audio_plugged_notify(struct drm_connector *connector,
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 286f6fb3fe2b80f237db85dc8459430dc82337e2..db0d374d863b0b1f774d395743f1e29bb84e8937 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1016,6 +1016,14 @@ struct drm_bridge {
 	 */
 	int hdmi_audio_max_i2s_playback_channels;
 
+	/**
+	 * @hdmi_audio_i2s_formats: supported I2S formats, optional. The
+	 * default is to allow all formats supported by the corresponding I2S
+	 * bus driver. This is only used for bridges setting
+	 * @DRM_BRIDGE_OP_HDMI_AUDIO or @DRM_BRIDGE_OP_DP_AUDIO.
+	 */
+	u64 hdmi_audio_i2s_formats;
+
 	/**
 	 * @hdmi_audio_spdif_playback: set if this bridge has S/PDIF playback
 	 * port for @DRM_BRIDGE_OP_HDMI_AUDIO or @DRM_BRIDGE_OP_DP_AUDIO.

-- 
2.39.5

