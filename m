Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA724ABA7A5
	for <lists+dri-devel@lfdr.de>; Sat, 17 May 2025 03:59:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 360D310E25A;
	Sat, 17 May 2025 01:59:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TuFIqPjc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F30E810E0A0
 for <dri-devel@lists.freedesktop.org>; Sat, 17 May 2025 01:59:46 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GCAwR4020821
 for <dri-devel@lists.freedesktop.org>; Sat, 17 May 2025 01:59:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lCTTLYELgEB4afW0sXqvdFWgp95Hv4OasYO1O5ZEWH8=; b=TuFIqPjcX4Q2PPBl
 Nt7HeKo9SbMS05n6J094icrkr9OIdKylJkGweZWgjbMnkVdIQG8BGSXj7arkSUVa
 3LUfQDBpey7IVSzxcNwwCUD1QE2XYtPbdn6lNotoJxGePLIYMDCkpDwl+ZCxPxPa
 S+PmQPVVvJIbP75tNtlpfhHN0KZFWxNsVc4cZA6yTClZsNt9n+D2K3aPD2oUKMN2
 jdy/jMZVrDQtriNbmPCZBJJuYh+uqoch68pEV/OCpIEka7Z34yFhqJAG6PRBsJrZ
 m4YTlngrSdaga34DnDM0lP8t2aJ8kV51dKsyUBcM2y1393vrelooUVIIkST25fuA
 I7QcDg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbewbd4c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 17 May 2025 01:59:45 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6f8c2ad9cf2so9295576d6.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 18:59:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747447185; x=1748051985;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lCTTLYELgEB4afW0sXqvdFWgp95Hv4OasYO1O5ZEWH8=;
 b=Cz82HFH6CyGBi6iRNWg1jFYhCkOmimHdGbbos0fXy09L1XvS5BtJmFmUlEPL/Epg2a
 E1WzxIzihx2V1d8nFrq2pK/dUMZHdn89wPziLOvchCv9qXQVRM6pP4hExRUX3tj4UfZ8
 c6pO5BSFKOS1TFWa1OqlTHyeGgOgB7za+VVXKL2ioyRcxS26HvEOigQ7GsspkWYop6bQ
 XDol3kARJKBtK1pirskQ/9m4/7EvHvFRg91Aqp00/AivKyeTEQnNixnmoKlyz4uzZLaO
 NCtFHlcXnRjl23yZss2xpTSWSWwPM9/Wm6vlYK5EWPdq0ifgKo3ElfwB8FWQry3nJlAT
 6Chg==
X-Gm-Message-State: AOJu0YzbVRUjCPpOjccX82zh2TKDEMOZBHy8/Zqhq2q1byRhHDX7Qzj+
 4RBsR3o5Iv8bOc6RVQRTftWQYFw25eGquU0FbO/Dl/J2JIIODus70TQnlhcd6LFhVEbRgRfy3pU
 C95ctlNAYSzC8rAzoUG6c7R2VAmCiVxzIQHXc4MishS+YOFEl6lON8zj4VdMCLPGnJ65L+gQ=
X-Gm-Gg: ASbGnct9pjf/bbOmffC4XEyJvoOAT/duERfvOCE/orTu/q05n/JDgcZMGGlEPmVLYdl
 hw4GBVmKpwePkFeWPgFZyRQ93AedU55ByHR2K+PWrYsflQh1hdZioifnqCEovi17CBoYckx82YC
 m+4BNoAedbQJWvUP5XAijaSP8/aO3Y74E5UmXTKkKGx6lv2VdC+jyjHP+UuTGJnf/xzWOyNL6nS
 uOUj0wznaBpR6yHlVbepb6FB/B0+GhY9nrcPJt+//cpMseHDyrlbDKiWzmifX8nsdfav8jG6Ovm
 Xn1UGBtC0L4rR7yasWyyd4JAci5KYqEQECz7s2+GXSLfu3GLaiiRlsEwyKOs+s+mtdphP94inPg
 LOPvT8wcLXEilOcU6UajvpewO
X-Received: by 2002:a0c:f201:0:b0:6f8:997d:fc84 with SMTP id
 6a1803df08f44-6f8b2d25cb4mr82308696d6.19.1747447185017; 
 Fri, 16 May 2025 18:59:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IER24l9ssX5tG+gzt1zYw9jxyNNdfOV+z02DDPB4ediOmkiKiWW6N5WRy4tgk5BqCl2M9Tsxg==
X-Received: by 2002:a0c:f201:0:b0:6f8:997d:fc84 with SMTP id
 6a1803df08f44-6f8b2d25cb4mr82308506d6.19.1747447184675; 
 Fri, 16 May 2025 18:59:44 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e70180f7sm672167e87.128.2025.05.16.18.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 18:59:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 17 May 2025 04:59:38 +0300
Subject: [PATCH v6 02/10] drm/bridge: allow limiting I2S formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250517-drm-hdmi-connector-cec-v6-2-35651db6f19b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4874;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jWdmXnk5KQZ7QqiqS4ntkIepKln6k4Qq9yyz2/39Hbs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoJ+2KTLrlUyK6fPsI+fq3sq1JV3VTt+CHqQl9A
 YE0O/RhDReJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCftigAKCRCLPIo+Aiko
 1aL/CACD+SUjErGb1xcct84taQhDl6pWcON3nZ0HNbODXAKAXmpsr4tW0dvyFzlXjjA4LzkAqs7
 DfOaHGYEM3CJI9XKk01A6GKJL3ZyzF/uX/tUxeVCOkTvKuOfATi7kSUlrIhgOi5p5pK9gGh8oHu
 C2hBt7/2FVW75rchiSsQH0I689t+j1UEo8Jyy5lYZVrfW0j2YgfezdKMrkGJ6izpLpbrxEUA2vp
 s3y8OLWyT0XEP6fEdU3gbsEJrtqu9aJlFl7NQyxziPMaB13BocC9Q99d4sk11gVxxn5LvvFE1We
 x4uEw8KtjOQKfSxty1MEo5TXCyOFVqWiPNm1Ng1W3mL3OCur
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: MQqiPkJt-vSXf_GYnfl80FJNMVKCT94u
X-Proofpoint-ORIG-GUID: MQqiPkJt-vSXf_GYnfl80FJNMVKCT94u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE3MDAxNyBTYWx0ZWRfX9ZDUoHj79ce3
 oMQIPqr5MWzD1fu0F+VEHhESx3Q+8+CDsfn8J0GfNGVVNryz0r05cmVjXMawQmkuZlCo1TQAKmP
 BbdzzEVvbDjThfr+IH3qwGDNVnQh4+1MJD8zTwWr3EUxk0mOOQ8VrgAGgRGyxjDi/b1qRtCRgze
 /gNwo9WTLFxgDslksEUA1EwPJvDf3K+20/icrEK5mwQhVmZfCXPS1qVLzA9J3danVgCFIF+HRCv
 wIs5RNu+3FMJLPjotdnefTNW5Q69WZUy5FkMbp8useRjhySZea+jA4fsB98Z8bl5MWVc9BpGMvT
 1aJtyMfseF8wFqznVddA93iZKh/FoXMkhCcJlt0Vc3aJh8RZeWT6uO5aDPqeA+IEVJng4OUk0Zv
 qgiBw/+QSoOyJXyc/gxkvCymHvB7AHKIUZp+rHpoY4cll+aH86ASdBeboxHRRMj5un0Xz5yZ
X-Authority-Analysis: v=2.4 cv=LOFmQIW9 c=1 sm=1 tr=0 ts=6827ed91 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=JbrL1DnuwQtsaYKQthAA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-17_01,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

