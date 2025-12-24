Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD29CDB071
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 02:04:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA7B10E300;
	Wed, 24 Dec 2025 01:03:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="T7PlQaF1";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="THup/xOK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECD1510E2FB
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 01:03:53 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BNKXg9l1206453
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 01:03:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 h5H/J2/L1Alqc9sN3kBM8iI2ejxx+Xn5EAV6Vj/TX7M=; b=T7PlQaF18eLaTIhS
 W3SesQgRyt8Qn1dvta9ZXYuKDqe2e1AQdlRRHFagzO86q3EGB1Ei74d0l6g5GhK8
 jbgBCXCizJUhPnOvxTnfpJbP9ys4XusJImAiIv+QL1LKVXRtnjS+XkxaHf8KTUG2
 +Ii7q1pWMgKXwiomVKw2rrwn9Z/mdyYR0r/Vy/N4cg/lKyT8HviffpQfyApJBetm
 gyu9R+qIJ2s7wGdR9nYB2AQ2OEAPG8remN+9x+MEr1UpSCJ3jbsDFzJhHfhDSbU1
 a192kXejJ9Bl62E07bz5pAttoy7sPGyqnsvD7PalSYToE1ZvwprBZWUXV6Vaygtd
 lZfbrQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b827r0gqy-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 01:03:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ee0c1c57bcso184913791cf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 17:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766538232; x=1767143032;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=h5H/J2/L1Alqc9sN3kBM8iI2ejxx+Xn5EAV6Vj/TX7M=;
 b=THup/xOKA3AnVbRQ8amkO0tBEEB9775JJtrGaWNvsKicDbc0PwAvuziAltUiNQu6zX
 V/QrkyDPk9bp0l253V3i0M3B9LsBA8lAVHZLPWtdaVDyFqjzZeEJ/MWI1wH4hOfe8ypY
 iRlwrrDuwvJuoSu3ZB5JnldMB0OQpEPmgmO0EfwHP7eMfwU86pFZeJibw0Gh3GaclXHf
 C14RbWyRkEOUBI8RaXeTWl/joLsFCXQ0uDGTE144xi7EbGEenAHfcF6PO17Z6OQoroqC
 IWCRRURlK5oxv41EE18jVuee/plaGvuHPfVp51RiRY8bTmqP7QDYwDPpfeUTrYqhTH3F
 6tZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766538232; x=1767143032;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=h5H/J2/L1Alqc9sN3kBM8iI2ejxx+Xn5EAV6Vj/TX7M=;
 b=UIRFY8qU34DWNf1dL/GbXwy0iWayCcqBFtAUhPHMHX2y22jquxhxVAF+GiG64QeJ9e
 Jg3vv4mtqM0Id4O5oNro87APDRRB2WgVFyu+tJRKfPLmZ1Dw0fdw4fIzDJGtqAF6qCpX
 ZzLENS42rl8gmbQjdxOb9+1n+6rWTayqDesj0DSon7XBFXp26hKjzLZTP+bSjV4aqiAx
 niMvPDgzTZyP2qwo0Y7lWSdxaQAj9b1wwvPLGD7PzG6oKQgmBPLNUiDdRI1HZxFlCpor
 uXtnzRvWBUqU1MvPOstQuUDiHPhmh7yVFGWp4Mg4aLzrIQiJeSQYGirStNERxjY0i10Z
 MVDg==
X-Gm-Message-State: AOJu0YxCgTFAD14kKHJVP9uTYwqVORVyfku8btcY+pxL1sUbZ6jyNve5
 csEgeTQiuxi5ZqPupu9RO5g+YgDWgm1WbHphF5hkNy9/dlCmGUGkXvDBhgQY31UZp7oz16v5YSW
 G+vZNh9ybwxTzgbiBFsV4ZZEGpMACpmtOTmtzCehkKFW54FmSGgkKI+TiP/ihxbNYIvKbJnY=
X-Gm-Gg: AY/fxX4lf0a7oKgPIAfvZHVyL2tpIIkhAhlngoxP6kTRGQnnK0aPQiBlOH0nIah7Ewq
 OddOV6IXt3KVbKZg+6/kEBkwTMVR+79HlgDEFmOB2zbaW8DmMKdI52Haf8BngnhKQ/u9M0Uezl3
 3FQNpZqAsb4XLbqt9VoIpuU/F7UKGOU4RD7kuAtwYEE8iRp+QQHd9tQnBMYCgeRlCzxp7vmMrhW
 vIYPHcN06sfzz05ELzCHHNmluoCAEsN5Upv74AV1HWtzFs1X8dbbgo3Jk7u03EqKAww8QLUrgdP
 zmZsLFUkK7t2t2YaAwt5ncr3Yfj2dD9isuOyKxrSLrB3Xt3Fx+5kTzrSgy931BAmHPucrsloOPZ
 PX9GueK+VB9S0PfldzIV4faOXIF13az4SEaSKexAv1MjhFfZ7mtkVc80TUvS1dh4dExvdFyMWBu
 s48dqsX6Dr3Tn7jPWZAH7FAak=
X-Received: by 2002:a05:622a:1889:b0:4f1:ac9c:9388 with SMTP id
 d75a77b69052e-4f4abbc6fabmr256846741cf.0.1766538231996; 
 Tue, 23 Dec 2025 17:03:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEChtLZDL3+cZho1A2Xkr0OH3eZZEfhDRLTcC5yNx32/7wwSUAWSE0QdcayVceg3AkXaGX/ig==
X-Received: by 2002:a05:622a:1889:b0:4f1:ac9c:9388 with SMTP id
 d75a77b69052e-4f4abbc6fabmr256846081cf.0.1766538231402; 
 Tue, 23 Dec 2025 17:03:51 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a18628284sm4545268e87.93.2025.12.23.17.03.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 17:03:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 03:02:55 +0200
Subject: [PATCH v3 06/10] drm/display: hdmi_state_helper: split InfoFrame
 functions per type
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-limit-infoframes-2-v3-6-7fd3cacfefed@oss.qualcomm.com>
References: <20251224-limit-infoframes-2-v3-0-7fd3cacfefed@oss.qualcomm.com>
In-Reply-To: <20251224-limit-infoframes-2-v3-0-7fd3cacfefed@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sandy Huang <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=37993;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=e/gQf9q5+V+aZ5QL0NOVTe19dHH1IQ2nuBhXDgw+pv4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpSzvZxJMqVHiuVcE1k5S7VGLj2tNZ9k7z3lazs
 +XKfigYcgyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaUs72QAKCRCLPIo+Aiko
 1dAdB/9pY+38ipzKpn8nn6vzLd9m9Vhc+U9v6zonnsIgr1Dhrc5M7QEJw1CM1ITTkEcjuU0J/KN
 cjWeQ648lzVPRK//ZqxBjfGVT0ib2GF2i/kZ/gf+ha4cjuOccXa+Uaucm24OdHePJbPC5aR5OmK
 bZWlAGv8vrMgRGfyO74tbVnuq/Gh3DCsr4MGO7BbDbTPQA8P+bG1P8xmY4EfnssMW4mfcj7VsDU
 5GnC2oQMfqTRHpPF8F0TTV1k3ejt9q7S3HINqkUQP0aecst7yVABO3SL4nNKTKf7ldTfbFNYQyO
 JztLz/wMZ/tIgLMSP/QKARD4bV06k5+wUrK/tFzHvaFhml5r
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: tjYUOng0sD12P_88dqszKHBoC-JbiFvp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAwNyBTYWx0ZWRfX6/h+cRFKFg44
 ejR+ow/kbepmZjXFRfPJf79sKirTSxg9iAUIf0KoCHjs9YXvkw9Y4wYznDru9UA+kV402kzJMqn
 O4akTG0nITaWdttuvDCsSagKU+luWl8Y6BueRteGHzDAR6Yvc6TmT9SxfNqcnvdl9Uv3K5c7ZpE
 nwNYDpaRrtmRKGkfGqYijw0oHnyI7MwJEk6iDRpcsFu1nxWdYJZCeHOePX79sW0YlduwSSZXi0g
 d9JJEQsxGBOKccRgzEUVCxQPbP1q8Ul3TnRIu9Z4vgaAp+963g0L+hhOA/Byxrin+k5B+nf29eW
 u1uX/SDYFjYluZ4byX/bPzHIHFUCD6UWL4zHuWLEfYq+Q+4ODYbFJFu+BnHwhzABV0CFZ7LRZaf
 RBbD7EAGFvU5U3R+WvYw8rMay056PM2Yqee6txmX+NPMPbwdkgeDW6jFMHIZZriSezLt3kfu8jd
 KlgL0ITgl7cPRMpZjrg==
X-Proofpoint-GUID: tjYUOng0sD12P_88dqszKHBoC-JbiFvp
X-Authority-Analysis: v=2.4 cv=RbSdyltv c=1 sm=1 tr=0 ts=694b3bf9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=e4yJ5TXQa4jp-2S-TdcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240007
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

Havign a single set of InfoFrame callbacks doesn't provide enough
information to the DRM framework about the InfoFrame types that are
actually supported. Also it's not really future-proof: it provides a way
to program only a single Vendor-Specific frame, however we might need to
support multiple VSIs at the same time (e.g. HDMI vs HDMI Forum
VSIs).

Provide separate sets of callbacks, one per the InfoFrame type.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c     | 206 ++++++++++++++++-----
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  86 ++++-----
 drivers/gpu/drm/drm_connector.c                    |   6 +-
 drivers/gpu/drm/rockchip/inno_hdmi.c               |  47 +++--
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |  39 ++--
 drivers/gpu/drm/tests/drm_connector_test.c         |  14 +-
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 102 +++++-----
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  82 +++++++-
 include/drm/drm_connector.h                        | 105 ++++++++---
 9 files changed, 482 insertions(+), 205 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 8fd7722fe9a3..c8858d48199c 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -401,8 +401,7 @@ drm_bridge_connector_tmds_char_rate_valid(const struct drm_connector *connector,
 		return MODE_OK;
 }
 
-static int drm_bridge_connector_clear_infoframe(struct drm_connector *connector,
-						enum hdmi_infoframe_type type)
+static int drm_bridge_connector_clear_avi_infoframe(struct drm_connector *connector)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
@@ -412,35 +411,70 @@ static int drm_bridge_connector_clear_infoframe(struct drm_connector *connector,
 	if (!bridge)
 		return -EINVAL;
 
-	switch (type) {
-	case HDMI_INFOFRAME_TYPE_AVI:
-		/* required */
-		return bridge->funcs->hdmi_clear_avi_infoframe(bridge);
-	case HDMI_INFOFRAME_TYPE_VENDOR:
-		/* required */
-		return bridge->funcs->hdmi_clear_hdmi_infoframe(bridge);
-	case HDMI_INFOFRAME_TYPE_AUDIO:
-		if (bridge->ops & DRM_BRIDGE_OP_HDMI_AUDIO)
-			return bridge->funcs->hdmi_clear_audio_infoframe(bridge);
-		break;
-	case HDMI_INFOFRAME_TYPE_DRM:
-		if (bridge->ops & DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME)
-			return bridge->funcs->hdmi_clear_hdr_drm_infoframe(bridge);
-		break;
-	case HDMI_INFOFRAME_TYPE_SPD:
-		if (bridge->ops & DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME)
-			return bridge->funcs->hdmi_clear_spd_infoframe(bridge);
-		break;
-	}
+	return bridge->funcs->hdmi_clear_avi_infoframe(bridge);
+}
+
+static int drm_bridge_connector_write_avi_infoframe(struct drm_connector *connector,
+						    const u8 *buffer, size_t len)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (!bridge)
+		return -EINVAL;
+
+	return bridge->funcs->hdmi_write_avi_infoframe(bridge, buffer, len);
+}
 
-	drm_dbg_driver(connector->dev, "Unsupported HDMI InfoFrame %x\n", type);
+static int drm_bridge_connector_clear_hdmi_infoframe(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (!bridge)
+		return -EINVAL;
+
+	return bridge->funcs->hdmi_clear_hdmi_infoframe(bridge);
+}
+
+static int drm_bridge_connector_write_hdmi_infoframe(struct drm_connector *connector,
+						     const u8 *buffer, size_t len)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (!bridge)
+		return -EINVAL;
+
+	return bridge->funcs->hdmi_write_hdmi_infoframe(bridge, buffer, len);
+}
+
+static int drm_bridge_connector_clear_audio_infoframe(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (!bridge)
+		return -EINVAL;
+
+	if (bridge->ops & DRM_BRIDGE_OP_HDMI_AUDIO)
+		return bridge->funcs->hdmi_clear_audio_infoframe(bridge);
+
+	drm_dbg_driver(connector->dev, "Unsupported HDMI Audio InfoFrame\n");
 
 	return 0;
 }
 
-static int drm_bridge_connector_write_infoframe(struct drm_connector *connector,
-						enum hdmi_infoframe_type type,
-						const u8 *buffer, size_t len)
+static int drm_bridge_connector_write_audio_infoframe(struct drm_connector *connector,
+						      const u8 *buffer, size_t len)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
@@ -450,28 +484,84 @@ static int drm_bridge_connector_write_infoframe(struct drm_connector *connector,
 	if (!bridge)
 		return -EINVAL;
 
-	switch (type) {
-	case HDMI_INFOFRAME_TYPE_AVI:
-		/* required */
-		return bridge->funcs->hdmi_write_avi_infoframe(bridge, buffer, len);
-	case HDMI_INFOFRAME_TYPE_VENDOR:
-		/* required */
-		return bridge->funcs->hdmi_write_hdmi_infoframe(bridge, buffer, len);
-	case HDMI_INFOFRAME_TYPE_AUDIO:
-		if (bridge->ops & DRM_BRIDGE_OP_HDMI_AUDIO)
-			return bridge->funcs->hdmi_write_audio_infoframe(bridge, buffer, len);
-		break;
-	case HDMI_INFOFRAME_TYPE_DRM:
-		if (bridge->ops & DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME)
-			return bridge->funcs->hdmi_write_hdr_drm_infoframe(bridge, buffer, len);
-		break;
-	case HDMI_INFOFRAME_TYPE_SPD:
-		if (bridge->ops & DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME)
-			return bridge->funcs->hdmi_write_spd_infoframe(bridge, buffer, len);
-		break;
-	}
+	if (bridge->ops & DRM_BRIDGE_OP_HDMI_AUDIO)
+		return bridge->funcs->hdmi_write_audio_infoframe(bridge, buffer, len);
+
+	drm_dbg_driver(connector->dev, "Unsupported HDMI Audio InfoFrame\n");
+
+	return 0;
+}
+
+static int drm_bridge_connector_clear_hdr_drm_infoframe(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (!bridge)
+		return -EINVAL;
+
+	if (bridge->ops & DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME)
+		return bridge->funcs->hdmi_clear_hdr_drm_infoframe(bridge);
+
+	drm_dbg_driver(connector->dev, "Unsupported HDMI HDR DRM InfoFrame\n");
+
+	return 0;
+}
+
+static int drm_bridge_connector_write_hdr_drm_infoframe(struct drm_connector *connector,
+							const u8 *buffer, size_t len)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (!bridge)
+		return -EINVAL;
+
+	if (bridge->ops & DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME)
+		return bridge->funcs->hdmi_write_hdr_drm_infoframe(bridge, buffer, len);
+
+	drm_dbg_driver(connector->dev, "Unsupported HDMI HDR DRM InfoFrame\n");
+
+	return 0;
+}
+
+static int drm_bridge_connector_clear_spd_infoframe(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (!bridge)
+		return -EINVAL;
+
+	if (bridge->ops & DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME)
+		return bridge->funcs->hdmi_clear_spd_infoframe(bridge);
+
+	drm_dbg_driver(connector->dev, "Unsupported HDMI SPD InfoFrame\n");
+
+	return 0;
+}
+
+static int drm_bridge_connector_write_spd_infoframe(struct drm_connector *connector,
+						    const u8 *buffer, size_t len)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (!bridge)
+		return -EINVAL;
+
+	if (bridge->ops & DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME)
+		return bridge->funcs->hdmi_write_spd_infoframe(bridge, buffer, len);
 
-	drm_dbg_driver(connector->dev, "Unsupported HDMI InfoFrame %x\n", type);
+	drm_dbg_driver(connector->dev, "Unsupported HDMI SPD InfoFrame\n");
 
 	return 0;
 }
@@ -492,9 +582,27 @@ drm_bridge_connector_read_edid(struct drm_connector *connector)
 
 static const struct drm_connector_hdmi_funcs drm_bridge_connector_hdmi_funcs = {
 	.tmds_char_rate_valid = drm_bridge_connector_tmds_char_rate_valid,
-	.clear_infoframe = drm_bridge_connector_clear_infoframe,
-	.write_infoframe = drm_bridge_connector_write_infoframe,
 	.read_edid = drm_bridge_connector_read_edid,
+	.avi = {
+		.clear_infoframe = drm_bridge_connector_clear_avi_infoframe,
+		.write_infoframe = drm_bridge_connector_write_avi_infoframe,
+	},
+	.hdmi = {
+		.clear_infoframe = drm_bridge_connector_clear_hdmi_infoframe,
+		.write_infoframe = drm_bridge_connector_write_hdmi_infoframe,
+	},
+	.audio = {
+		.clear_infoframe = drm_bridge_connector_clear_audio_infoframe,
+		.write_infoframe = drm_bridge_connector_write_audio_infoframe,
+	},
+	.hdr_drm = {
+		.clear_infoframe = drm_bridge_connector_clear_hdr_drm_infoframe,
+		.write_infoframe = drm_bridge_connector_write_hdr_drm_infoframe,
+	},
+	.spd = {
+		.clear_infoframe = drm_bridge_connector_clear_spd_infoframe,
+		.write_infoframe = drm_bridge_connector_write_spd_infoframe,
+	},
 };
 
 static int drm_bridge_connector_audio_startup(struct drm_connector *connector)
diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index a561f124be99..5a3817271d91 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -891,21 +891,21 @@ drm_hdmi_connector_mode_valid(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_hdmi_connector_mode_valid);
 
-static int clear_device_infoframe(struct drm_connector *connector,
-				  enum hdmi_infoframe_type type)
+static int clear_infoframe(struct drm_connector *connector,
+			   const struct drm_connector_infoframe_funcs *funcs,
+			   const char *type)
 {
-	const struct drm_connector_hdmi_funcs *funcs = connector->hdmi.funcs;
 	struct drm_device *dev = connector->dev;
 	int ret;
 
-	drm_dbg_kms(dev, "Clearing infoframe type 0x%x\n", type);
+	drm_dbg_kms(dev, "Clearing %s InfoFrame\n", type);
 
-	if (!funcs || !funcs->clear_infoframe) {
+	if (!funcs->clear_infoframe) {
 		drm_dbg_kms(dev, "Function not implemented, bailing.\n");
 		return 0;
 	}
 
-	ret = funcs->clear_infoframe(connector, type);
+	ret = funcs->clear_infoframe(connector);
 	if (ret) {
 		drm_dbg_kms(dev, "Call failed: %d\n", ret);
 		return ret;
@@ -914,39 +914,28 @@ static int clear_device_infoframe(struct drm_connector *connector,
 	return 0;
 }
 
-static int clear_infoframe(struct drm_connector *connector,
-			   struct drm_connector_hdmi_infoframe *old_frame)
-{
-	int ret;
-
-	ret = clear_device_infoframe(connector, old_frame->data.any.type);
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-static int write_device_infoframe(struct drm_connector *connector,
-				  union hdmi_infoframe *frame)
+static int write_infoframe(struct drm_connector *connector,
+			   const struct drm_connector_infoframe_funcs *funcs,
+			   const char *type,
+			   struct drm_connector_hdmi_infoframe *new_frame)
 {
-	const struct drm_connector_hdmi_funcs *funcs = connector->hdmi.funcs;
 	struct drm_device *dev = connector->dev;
 	u8 buffer[HDMI_INFOFRAME_SIZE(MAX)];
 	int ret;
 	int len;
 
-	drm_dbg_kms(dev, "Writing infoframe type %x\n", frame->any.type);
+	drm_dbg_kms(dev, "Writing %s InfoFrame\n", type);
 
-	if (!funcs || !funcs->write_infoframe) {
+	if (!funcs->write_infoframe) {
 		drm_dbg_kms(dev, "Function not implemented, bailing.\n");
-		return -EINVAL;
+		return 0; /* XXX: temporal until we stop generating unsupported frames */
 	}
 
-	len = hdmi_infoframe_pack(frame, buffer, sizeof(buffer));
+	len = hdmi_infoframe_pack(&new_frame->data, buffer, sizeof(buffer));
 	if (len < 0)
 		return len;
 
-	ret = funcs->write_infoframe(connector, frame->any.type, buffer, len);
+	ret = funcs->write_infoframe(connector, buffer, len);
 	if (ret) {
 		drm_dbg_kms(dev, "Call failed: %d\n", ret);
 		return ret;
@@ -955,27 +944,17 @@ static int write_device_infoframe(struct drm_connector *connector,
 	return 0;
 }
 
-static int write_infoframe(struct drm_connector *connector,
-			   struct drm_connector_hdmi_infoframe *new_frame)
-{
-	int ret;
-
-	ret = write_device_infoframe(connector, &new_frame->data);
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
 static int write_or_clear_infoframe(struct drm_connector *connector,
+				    const struct drm_connector_infoframe_funcs *funcs,
+				    const char *type,
 				    struct drm_connector_hdmi_infoframe *old_frame,
 				    struct drm_connector_hdmi_infoframe *new_frame)
 {
 	if (new_frame->set)
-		return write_infoframe(connector, new_frame);
+		return write_infoframe(connector, funcs, type, new_frame);
 
 	if (old_frame->set && !new_frame->set)
-		return clear_infoframe(connector, old_frame);
+		return clear_infoframe(connector, funcs, type);
 
 	return 0;
 }
@@ -995,6 +974,7 @@ static int write_or_clear_infoframe(struct drm_connector *connector,
 int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *connector,
 						       struct drm_atomic_state *state)
 {
+	const struct drm_connector_hdmi_funcs *funcs = connector->hdmi.funcs;
 	struct drm_connector_state *old_conn_state =
 		drm_atomic_get_old_connector_state(state, connector);
 	struct drm_connector_state *new_conn_state =
@@ -1005,9 +985,15 @@ int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *con
 	if (!info->is_hdmi)
 		return 0;
 
+	if (!funcs) {
+		drm_dbg_kms(connector->dev, "Function not implemented, bailing.\n");
+		return -EINVAL;
+	}
+
 	mutex_lock(&connector->hdmi.infoframes.lock);
 
 	ret = write_or_clear_infoframe(connector,
+				       &funcs->avi, "AVI",
 				       &old_conn_state->hdmi.infoframes.avi,
 				       &new_conn_state->hdmi.infoframes.avi);
 	if (ret)
@@ -1015,18 +1001,21 @@ int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *con
 
 	if (connector->hdmi.infoframes.audio.set) {
 		ret = write_infoframe(connector,
+				      &funcs->audio, "Audio",
 				      &connector->hdmi.infoframes.audio);
 		if (ret)
 			goto out;
 	}
 
 	ret = write_or_clear_infoframe(connector,
+				       &funcs->hdr_drm, "HDR DRM",
 				       &old_conn_state->hdmi.infoframes.hdr_drm,
 				       &new_conn_state->hdmi.infoframes.hdr_drm);
 	if (ret)
 		goto out;
 
 	ret = write_or_clear_infoframe(connector,
+				       &funcs->spd, "SPD",
 				       &old_conn_state->hdmi.infoframes.spd,
 				       &new_conn_state->hdmi.infoframes.spd);
 	if (ret)
@@ -1034,6 +1023,7 @@ int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *con
 
 	if (info->has_hdmi_infoframe) {
 		ret = write_or_clear_infoframe(connector,
+					       &funcs->hdmi, "HDMI-VS",
 					       &old_conn_state->hdmi.infoframes.hdmi,
 					       &new_conn_state->hdmi.infoframes.hdmi);
 		if (ret)
@@ -1062,6 +1052,7 @@ int
 drm_atomic_helper_connector_hdmi_update_audio_infoframe(struct drm_connector *connector,
 							struct hdmi_audio_infoframe *frame)
 {
+	const struct drm_connector_hdmi_funcs *funcs = connector->hdmi.funcs;
 	struct drm_connector_hdmi_infoframe *infoframe =
 		&connector->hdmi.infoframes.audio;
 	struct drm_display_info *info = &connector->display_info;
@@ -1070,12 +1061,17 @@ drm_atomic_helper_connector_hdmi_update_audio_infoframe(struct drm_connector *co
 	if (!info->is_hdmi)
 		return 0;
 
+	if (!funcs) {
+		drm_dbg_kms(connector->dev, "Function not implemented, bailing.\n");
+		return -EINVAL;
+	}
+
 	mutex_lock(&connector->hdmi.infoframes.lock);
 
 	memcpy(&infoframe->data, frame, sizeof(infoframe->data));
 	infoframe->set = true;
 
-	ret = write_infoframe(connector, infoframe);
+	ret = write_infoframe(connector, &funcs->audio, "Audio", infoframe);
 
 	mutex_unlock(&connector->hdmi.infoframes.lock);
 
@@ -1097,6 +1093,7 @@ EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_update_audio_infoframe);
 int
 drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *connector)
 {
+	const struct drm_connector_hdmi_funcs *funcs = connector->hdmi.funcs;
 	struct drm_connector_hdmi_infoframe *infoframe =
 		&connector->hdmi.infoframes.audio;
 	struct drm_display_info *info = &connector->display_info;
@@ -1105,11 +1102,16 @@ drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *con
 	if (!info->is_hdmi)
 		return 0;
 
+	if (!funcs) {
+		drm_dbg_kms(connector->dev, "Function not implemented, bailing.\n");
+		return -EINVAL;
+	}
+
 	mutex_lock(&connector->hdmi.infoframes.lock);
 
 	infoframe->set = false;
 
-	ret = clear_infoframe(connector, infoframe);
+	ret = clear_infoframe(connector, &funcs->audio, "Audio");
 
 	memset(&infoframe->data, 0, sizeof(infoframe->data));
 
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 40e025712c9b..4f5b27fab475 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -600,8 +600,10 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	if (!(max_bpc == 8 || max_bpc == 10 || max_bpc == 12))
 		return -EINVAL;
 
-	if (!hdmi_funcs->clear_infoframe ||
-	    !hdmi_funcs->write_infoframe)
+	if (!hdmi_funcs->avi.clear_infoframe ||
+	    !hdmi_funcs->avi.write_infoframe ||
+	    !hdmi_funcs->hdmi.clear_infoframe ||
+	    !hdmi_funcs->hdmi.write_infoframe)
 		return -EINVAL;
 
 	ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 9f7a8cf0ab44..1575f05bb4af 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -637,36 +637,22 @@ static void inno_hdmi_init_hw(struct inno_hdmi *hdmi)
 	hdmi_modb(hdmi, HDMI_STATUS, m_MASK_INT_HOTPLUG, v_MASK_INT_HOTPLUG(1));
 }
 
-static int inno_hdmi_disable_frame(struct drm_connector *connector,
-				   enum hdmi_infoframe_type type)
+static int inno_hdmi_clear_avi_infoframe(struct drm_connector *connector)
 {
 	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
 
-	if (type != HDMI_INFOFRAME_TYPE_AVI) {
-		drm_err(connector->dev,
-			"Unsupported infoframe type: %u\n", type);
-		return 0;
-	}
-
 	hdmi_writeb(hdmi, HDMI_CONTROL_PACKET_BUF_INDEX, INFOFRAME_AVI);
 
 	return 0;
 }
 
-static int inno_hdmi_upload_frame(struct drm_connector *connector,
-				  enum hdmi_infoframe_type type,
-				  const u8 *buffer, size_t len)
+static int inno_hdmi_write_avi_infoframe(struct drm_connector *connector,
+					 const u8 *buffer, size_t len)
 {
 	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
 	ssize_t i;
 
-	if (type != HDMI_INFOFRAME_TYPE_AVI) {
-		drm_err(connector->dev,
-			"Unsupported infoframe type: %u\n", type);
-		return 0;
-	}
-
-	inno_hdmi_disable_frame(connector, type);
+	inno_hdmi_clear_avi_infoframe(connector);
 
 	for (i = 0; i < len; i++)
 		hdmi_writeb(hdmi, HDMI_CONTROL_PACKET_ADDR + i, buffer[i]);
@@ -674,9 +660,30 @@ static int inno_hdmi_upload_frame(struct drm_connector *connector,
 	return 0;
 }
 
+static int inno_hdmi_clear_hdmi_infoframe(struct drm_connector *connector)
+{
+	drm_warn_once(connector->dev, "HDMI VSI not implemented\n");
+
+	return 0;
+}
+
+static int inno_hdmi_write_hdmi_infoframe(struct drm_connector *connector,
+					  const u8 *buffer, size_t len)
+{
+	drm_warn_once(connector->dev, "HDMI VSI not implemented\n");
+
+	return 0;
+}
+
 static const struct drm_connector_hdmi_funcs inno_hdmi_hdmi_connector_funcs = {
-	.clear_infoframe	= inno_hdmi_disable_frame,
-	.write_infoframe	= inno_hdmi_upload_frame,
+	.avi = {
+		.clear_infoframe	= inno_hdmi_clear_avi_infoframe,
+		.write_infoframe	= inno_hdmi_write_avi_infoframe,
+	},
+	.hdmi = {
+		.clear_infoframe	= inno_hdmi_clear_hdmi_infoframe,
+		.write_infoframe	= inno_hdmi_write_hdmi_infoframe,
+	},
 };
 
 static int inno_hdmi_config_video_csc(struct inno_hdmi *hdmi)
diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index 6263ee15880a..a50f260c73e4 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -40,27 +40,19 @@
 #define drm_connector_to_sun4i_hdmi(c)		\
 	container_of_const(c, struct sun4i_hdmi, connector)
 
-static int sun4i_hdmi_clear_infoframe(struct drm_connector *connector,
-				      enum hdmi_infoframe_type type)
+static int sun4i_hdmi_clear_avi_infoframe(struct drm_connector *connector)
 {
 	drm_warn_once(connector->dev, "clearing of AVI infoframe is not implemented\n");
 
 	return 0;
 }
 
-static int sun4i_hdmi_write_infoframe(struct drm_connector *connector,
-				      enum hdmi_infoframe_type type,
-				      const u8 *buffer, size_t len)
+static int sun4i_hdmi_write_avi_infoframe(struct drm_connector *connector,
+					  const u8 *buffer, size_t len)
 {
 	struct sun4i_hdmi *hdmi = drm_connector_to_sun4i_hdmi(connector);
 	int i;
 
-	if (type != HDMI_INFOFRAME_TYPE_AVI) {
-		drm_err(connector->dev,
-			"Unsupported infoframe type: %u\n", type);
-		return 0;
-	}
-
 	for (i = 0; i < len; i++)
 		writeb(buffer[i], hdmi->base + SUN4I_HDMI_AVI_INFOFRAME_REG(i));
 
@@ -68,6 +60,21 @@ static int sun4i_hdmi_write_infoframe(struct drm_connector *connector,
 
 }
 
+static int sun4i_hdmi_clear_hdmi_infoframe(struct drm_connector *connector)
+{
+	drm_warn_once(connector->dev, "HDMI VSI not implemented\n");
+
+	return 0;
+}
+
+static int sun4i_hdmi_write_hdmi_infoframe(struct drm_connector *connector,
+					   const u8 *buffer, size_t len)
+{
+	drm_warn_once(connector->dev, "HDMI VSI not implemented\n");
+
+	return 0;
+}
+
 static void sun4i_hdmi_disable(struct drm_encoder *encoder,
 			       struct drm_atomic_state *state)
 {
@@ -244,8 +251,14 @@ static struct i2c_adapter *sun4i_hdmi_get_ddc(struct device *dev)
 
 static const struct drm_connector_hdmi_funcs sun4i_hdmi_hdmi_connector_funcs = {
 	.tmds_char_rate_valid	= sun4i_hdmi_connector_clock_valid,
-	.clear_infoframe	= sun4i_hdmi_clear_infoframe,
-	.write_infoframe	= sun4i_hdmi_write_infoframe,
+	.avi = {
+		.clear_infoframe	= sun4i_hdmi_clear_avi_infoframe,
+		.write_infoframe	= sun4i_hdmi_write_avi_infoframe,
+	},
+	.hdmi = {
+		.clear_infoframe	= sun4i_hdmi_clear_hdmi_infoframe,
+		.write_infoframe	= sun4i_hdmi_write_hdmi_infoframe,
+	},
 };
 
 static const struct drm_connector_helper_funcs sun4i_hdmi_connector_helper_funcs = {
diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index f356ea695ae7..86860ad0861c 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -25,22 +25,26 @@ struct drm_connector_init_priv {
 	struct i2c_adapter ddc;
 };
 
-static int accept_infoframe_clear_infoframe(struct drm_connector *connector,
-					    enum hdmi_infoframe_type type)
+static int accept_infoframe_clear_infoframe(struct drm_connector *connector)
 {
 	return 0;
 }
 
 static int accept_infoframe_write_infoframe(struct drm_connector *connector,
-					    enum hdmi_infoframe_type type,
 					    const u8 *buffer, size_t len)
 {
 	return 0;
 }
 
 static const struct drm_connector_hdmi_funcs dummy_hdmi_funcs = {
-	.clear_infoframe = accept_infoframe_clear_infoframe,
-	.write_infoframe = accept_infoframe_write_infoframe,
+	.avi = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = accept_infoframe_write_infoframe,
+	},
+	.hdmi = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = accept_infoframe_write_infoframe,
+	},
 };
 
 static const struct drm_connector_funcs dummy_funcs = {
diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 915dcd106703..7e4e986bdfd6 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -76,22 +76,26 @@ static int set_connector_edid(struct kunit *test, struct drm_connector *connecto
 	return ret;
 }
 
-static int accept_infoframe_clear_infoframe(struct drm_connector *connector,
-					    enum hdmi_infoframe_type type)
+static int accept_infoframe_clear_infoframe(struct drm_connector *connector)
 {
 	return 0;
 }
 
 static int accept_infoframe_write_infoframe(struct drm_connector *connector,
-					    enum hdmi_infoframe_type type,
 					    const u8 *buffer, size_t len)
 {
 	return 0;
 }
 
 static const struct drm_connector_hdmi_funcs dummy_connector_hdmi_funcs = {
-	.clear_infoframe = accept_infoframe_clear_infoframe,
-	.write_infoframe = accept_infoframe_write_infoframe,
+	.avi = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = accept_infoframe_write_infoframe,
+	},
+	.hdmi = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = accept_infoframe_write_infoframe,
+	},
 };
 
 static enum drm_mode_status
@@ -104,8 +108,14 @@ reject_connector_tmds_char_rate_valid(const struct drm_connector *connector,
 
 static const struct drm_connector_hdmi_funcs reject_connector_hdmi_funcs = {
 	.tmds_char_rate_valid	= reject_connector_tmds_char_rate_valid,
-	.clear_infoframe = accept_infoframe_clear_infoframe,
-	.write_infoframe = accept_infoframe_write_infoframe,
+	.avi = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = accept_infoframe_write_infoframe,
+	},
+	.hdmi = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = accept_infoframe_write_infoframe,
+	},
 };
 
 static enum drm_mode_status
@@ -118,8 +128,14 @@ reject_100mhz_connector_tmds_char_rate_valid(const struct drm_connector *connect
 
 static const struct drm_connector_hdmi_funcs reject_100mhz_connector_hdmi_funcs = {
 	.tmds_char_rate_valid	= reject_100mhz_connector_tmds_char_rate_valid,
-	.clear_infoframe = accept_infoframe_clear_infoframe,
-	.write_infoframe = accept_infoframe_write_infoframe,
+	.avi = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = accept_infoframe_write_infoframe,
+	},
+	.hdmi = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = accept_infoframe_write_infoframe,
+	},
 };
 
 static int dummy_connector_get_modes(struct drm_connector *connector)
@@ -2427,19 +2443,21 @@ static void drm_test_check_infoframes(struct kunit *test)
 	drm_modeset_acquire_fini(&ctx);
 }
 
-static int reject_avi_infoframe_write_infoframe(struct drm_connector *connector,
-						enum hdmi_infoframe_type type,
-						const u8 *buffer, size_t len)
+static int reject_infoframe_write_infoframe(struct drm_connector *connector,
+					    const u8 *buffer, size_t len)
 {
-	if (type == HDMI_INFOFRAME_TYPE_AVI)
-		return -EOPNOTSUPP;
-
-	return 0;
+	return -EOPNOTSUPP;
 }
 
 static const struct drm_connector_hdmi_funcs reject_avi_infoframe_hdmi_funcs = {
-	.clear_infoframe = accept_infoframe_clear_infoframe,
-	.write_infoframe = reject_avi_infoframe_write_infoframe,
+	.avi = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = reject_infoframe_write_infoframe,
+	},
+	.hdmi = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = accept_infoframe_write_infoframe,
+	},
 };
 
 /*
@@ -2509,19 +2527,19 @@ static void drm_test_check_reject_avi_infoframe(struct kunit *test)
 	drm_modeset_acquire_fini(&ctx);
 }
 
-static int reject_hdr_infoframe_write_infoframe(struct drm_connector *connector,
-						enum hdmi_infoframe_type type,
-						const u8 *buffer, size_t len)
-{
-	if (type == HDMI_INFOFRAME_TYPE_DRM)
-		return -EOPNOTSUPP;
-
-	return 0;
-}
-
 static const struct drm_connector_hdmi_funcs reject_hdr_infoframe_hdmi_funcs = {
-	.clear_infoframe = accept_infoframe_clear_infoframe,
-	.write_infoframe = reject_hdr_infoframe_write_infoframe,
+	.avi = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = accept_infoframe_write_infoframe,
+	},
+	.hdmi = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = accept_infoframe_write_infoframe,
+	},
+	.hdr_drm = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = reject_infoframe_write_infoframe,
+	},
 };
 
 /*
@@ -2695,19 +2713,19 @@ static void drm_test_check_reject_hdr_infoframe_bpc_10(struct kunit *test)
 	drm_modeset_acquire_fini(&ctx);
 }
 
-static int reject_audio_infoframe_write_infoframe(struct drm_connector *connector,
-						  enum hdmi_infoframe_type type,
-						  const u8 *buffer, size_t len)
-{
-	if (type == HDMI_INFOFRAME_TYPE_AUDIO)
-		return -EOPNOTSUPP;
-
-	return 0;
-}
-
 static const struct drm_connector_hdmi_funcs reject_audio_infoframe_hdmi_funcs = {
-	.clear_infoframe = accept_infoframe_clear_infoframe,
-	.write_infoframe = reject_audio_infoframe_write_infoframe,
+	.avi = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = accept_infoframe_write_infoframe,
+	},
+	.hdmi = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = accept_infoframe_write_infoframe,
+	},
+	.audio = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = reject_infoframe_write_infoframe,
+	},
 };
 
 /*
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 4cfb7ebc0c81..9fe605a42df7 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -727,6 +727,66 @@ static int vc4_hdmi_write_infoframe(struct drm_connector *connector,
 	return ret;
 }
 
+static int vc4_hdmi_clear_avi_infoframe(struct drm_connector *connector)
+{
+	return vc4_hdmi_clear_infoframe(connector, HDMI_INFOFRAME_TYPE_AVI);
+}
+
+static int vc4_hdmi_clear_hdmi_infoframe(struct drm_connector *connector)
+{
+	return vc4_hdmi_clear_infoframe(connector, HDMI_INFOFRAME_TYPE_VENDOR);
+}
+
+static int vc4_hdmi_clear_audio_infoframe(struct drm_connector *connector)
+{
+	return vc4_hdmi_clear_infoframe(connector, HDMI_INFOFRAME_TYPE_AUDIO);
+}
+
+static int vc4_hdmi_clear_hdr_drm_infoframe(struct drm_connector *connector)
+{
+	return vc4_hdmi_clear_infoframe(connector, HDMI_INFOFRAME_TYPE_DRM);
+}
+
+static int vc4_hdmi_clear_spd_infoframe(struct drm_connector *connector)
+{
+	return vc4_hdmi_clear_infoframe(connector, HDMI_INFOFRAME_TYPE_SPD);
+}
+
+static int vc4_hdmi_write_avi_infoframe(struct drm_connector *connector,
+					const u8 *buffer, size_t len)
+{
+	return vc4_hdmi_write_infoframe(connector, HDMI_INFOFRAME_TYPE_AVI,
+					buffer, len);
+}
+
+static int vc4_hdmi_write_hdmi_infoframe(struct drm_connector *connector,
+					 const u8 *buffer, size_t len)
+{
+	return vc4_hdmi_write_infoframe(connector, HDMI_INFOFRAME_TYPE_VENDOR,
+					buffer, len);
+}
+
+static int vc4_hdmi_write_audio_infoframe(struct drm_connector *connector,
+					  const u8 *buffer, size_t len)
+{
+	return vc4_hdmi_write_infoframe(connector, HDMI_INFOFRAME_TYPE_AUDIO,
+					buffer, len);
+}
+
+static int vc4_hdmi_write_hdr_drm_infoframe(struct drm_connector *connector,
+					    const u8 *buffer, size_t len)
+{
+	return vc4_hdmi_write_infoframe(connector, HDMI_INFOFRAME_TYPE_DRM,
+					buffer, len);
+}
+
+static int vc4_hdmi_write_spd_infoframe(struct drm_connector *connector,
+					const u8 *buffer, size_t len)
+{
+	return vc4_hdmi_write_infoframe(connector, HDMI_INFOFRAME_TYPE_SPD,
+					buffer, len);
+}
+
 #define SCRAMBLING_POLLING_DELAY_MS	1000
 
 static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
@@ -1684,8 +1744,26 @@ vc4_hdmi_connector_clock_valid(const struct drm_connector *connector,
 
 static const struct drm_connector_hdmi_funcs vc4_hdmi_hdmi_connector_funcs = {
 	.tmds_char_rate_valid	= vc4_hdmi_connector_clock_valid,
-	.clear_infoframe	= vc4_hdmi_clear_infoframe,
-	.write_infoframe	= vc4_hdmi_write_infoframe,
+	.avi = {
+		.clear_infoframe = vc4_hdmi_clear_avi_infoframe,
+		.write_infoframe = vc4_hdmi_write_avi_infoframe,
+	},
+	.hdmi = {
+		.clear_infoframe = vc4_hdmi_clear_hdmi_infoframe,
+		.write_infoframe = vc4_hdmi_write_hdmi_infoframe,
+	},
+	.audio = {
+		.clear_infoframe = vc4_hdmi_clear_audio_infoframe,
+		.write_infoframe = vc4_hdmi_write_audio_infoframe,
+	},
+	.hdr_drm = {
+		.clear_infoframe = vc4_hdmi_clear_hdr_drm_infoframe,
+		.write_infoframe = vc4_hdmi_write_hdr_drm_infoframe,
+	},
+	.spd = {
+		.clear_infoframe = vc4_hdmi_clear_spd_infoframe,
+		.write_infoframe = vc4_hdmi_write_spd_infoframe,
+	},
 };
 
 #define WIFI_2_4GHz_CH1_MIN_FREQ	2400000000ULL
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 4543833acdec..7eaec37ae1c7 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1222,44 +1222,24 @@ struct drm_connector_cec_funcs {
 };
 
 /**
- * struct drm_connector_hdmi_funcs - drm_hdmi_connector control functions
+ * struct drm_connector_infoframe_funcs - InfoFrame-related functions
  */
-struct drm_connector_hdmi_funcs {
-	/**
-	 * @tmds_char_rate_valid:
-	 *
-	 * This callback is invoked at atomic_check time to figure out
-	 * whether a particular TMDS character rate is supported by the
-	 * driver.
-	 *
-	 * The @tmds_char_rate_valid callback is optional.
-	 *
-	 * Returns:
-	 *
-	 * Either &drm_mode_status.MODE_OK or one of the failure reasons
-	 * in &enum drm_mode_status.
-	 */
-	enum drm_mode_status
-	(*tmds_char_rate_valid)(const struct drm_connector *connector,
-				const struct drm_display_mode *mode,
-				unsigned long long tmds_rate);
-
+struct drm_connector_infoframe_funcs {
 	/**
 	 * @clear_infoframe:
 	 *
 	 * This callback is invoked through
 	 * @drm_atomic_helper_connector_hdmi_update_infoframes during a
 	 * commit to clear the infoframes into the hardware. It will be
-	 * called multiple times, once for every disabled infoframe
-	 * type.
+	 * called once for each frame type to be disabled.
 	 *
-	 * The @clear_infoframe callback is mandatory.
+	 * The @clear_infoframe callback is mandatory for AVI and HDMI-VS
+	 * InfoFrame types.
 	 *
 	 * Returns:
 	 * 0 on success, a negative error code otherwise
 	 */
-	int (*clear_infoframe)(struct drm_connector *connector,
-			       enum hdmi_infoframe_type type);
+	int (*clear_infoframe)(struct drm_connector *connector);
 
 	/**
 	 * @write_infoframe:
@@ -1267,18 +1247,42 @@ struct drm_connector_hdmi_funcs {
 	 * This callback is invoked through
 	 * @drm_atomic_helper_connector_hdmi_update_infoframes during a
 	 * commit to program the infoframes into the hardware. It will
-	 * be called multiple times, once for every updated infoframe
-	 * type.
+	 * be called for every updated infoframe type.
 	 *
-	 * The @write_infoframe callback is mandatory.
+	 * The @write_infoframe callback is mandatory for AVI and HDMI-VS
+	 * InfoFrame types.
 	 *
 	 * Returns:
 	 * 0 on success, a negative error code otherwise
 	 */
 	int (*write_infoframe)(struct drm_connector *connector,
-			       enum hdmi_infoframe_type type,
 			       const u8 *buffer, size_t len);
 
+};
+
+/**
+ * struct drm_connector_hdmi_funcs - drm_hdmi_connector control functions
+ */
+struct drm_connector_hdmi_funcs {
+	/**
+	 * @tmds_char_rate_valid:
+	 *
+	 * This callback is invoked at atomic_check time to figure out
+	 * whether a particular TMDS character rate is supported by the
+	 * driver.
+	 *
+	 * The @tmds_char_rate_valid callback is optional.
+	 *
+	 * Returns:
+	 *
+	 * Either &drm_mode_status.MODE_OK or one of the failure reasons
+	 * in &enum drm_mode_status.
+	 */
+	enum drm_mode_status
+	(*tmds_char_rate_valid)(const struct drm_connector *connector,
+				const struct drm_display_mode *mode,
+				unsigned long long tmds_rate);
+
 	/**
 	 * @read_edid:
 	 *
@@ -1293,6 +1297,47 @@ struct drm_connector_hdmi_funcs {
 	 * Valid EDID on success, NULL in case of failure.
 	 */
 	const struct drm_edid *(*read_edid)(struct drm_connector *connector);
+
+	/**
+	 * @avi:
+	 *
+	 * Set of callbacks for handling the AVI InfoFrame. These callbacks are
+	 * mandatory.
+	 */
+	struct drm_connector_infoframe_funcs avi;
+
+	/**
+	 * @hdmi:
+	 *
+	 * Set of callbacks for handling the HDMI Vendor-Specific InfoFrame.
+	 * These callbacks are mandatory.
+	 */
+	struct drm_connector_infoframe_funcs hdmi;
+
+	/**
+	 * @audio:
+	 *
+	 * Set of callbacks for handling the Audio InfoFrame. These callbacks
+	 * are optional, but they are required for drivers which use
+	 * drm_atomic_helper_connector_hdmi_update_audio_infoframe().
+	 */
+	struct drm_connector_infoframe_funcs audio;
+
+	/**
+	 * @hdr_drm:
+	 *
+	 * Set of callbacks for handling the HDR DRM InfoFrame. These callbacks
+	 * are mandatory if HDR output is to be supported.
+	 */
+	struct drm_connector_infoframe_funcs hdr_drm;
+
+	/**
+	 * @spd:
+	 *
+	 * Set of callbacks for handling the SPD InfoFrame. These callbacks are
+	 * optional.
+	 */
+	struct drm_connector_infoframe_funcs spd;
 };
 
 /**

-- 
2.47.3

