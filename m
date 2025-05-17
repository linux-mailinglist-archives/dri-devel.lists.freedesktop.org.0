Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1B5ABA7AF
	for <lists+dri-devel@lfdr.de>; Sat, 17 May 2025 04:00:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23C5C10EBB4;
	Sat, 17 May 2025 02:00:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GNZLuUmk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85E4910EBB1
 for <dri-devel@lists.freedesktop.org>; Sat, 17 May 2025 02:00:05 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GCP7cY014932
 for <dri-devel@lists.freedesktop.org>; Sat, 17 May 2025 02:00:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 dy9LklN2fsMlgqudPGe5ryra0g5Z/dZpdk/cm/ehyI8=; b=GNZLuUmkeiUF3yuu
 WNmg+glfZHs4josfk0gYi5KAaXYo3GjsAyPOayuv4hz3xdpd8hr6uNbGck3ScCIf
 dSXXRozd/KWvbnB4mUfqKjN224uaio0zis4Vn8uefsAIuBc5hBBaiqvnnIcCgnh2
 j37lMgBmDezjov2LoM5/YA1lWP42DQokYEUQiZTfP9Qzpk8XWH2tU/liTLDMBaf5
 jsfS1eb3kNuOKTwpj6NVpGbJrmKnuYLcqdngEZAzgVKUOLriiXdQOs/0CxlhMIpc
 c5fgVesSBFotmfrxM2FCOJ/ru8iJ1nkw+n3IR97m50lkW6chEXCJF9BPgahv8PIQ
 vOxW3Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46nx9ju22q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 17 May 2025 02:00:04 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6f6e4ad4e9eso46139016d6.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 19:00:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747447201; x=1748052001;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dy9LklN2fsMlgqudPGe5ryra0g5Z/dZpdk/cm/ehyI8=;
 b=tbXJV3XparC/EkGkHsSedY+RAqptV/JSdt0rQ1cKISrUJi+57FiPxwwkrfd2/mEKw/
 xuRewb6edDjNgtI0r1hSgpaA2dzldNNPI4G3AHe7y/SkVRCmVCrf5DgS5S9S0Onu/wZo
 x0LvoIcRUewdA1CMwvnHo4RtWdhPnz0nJAn95R1Nm/lS/IwbGkNGZENM9gaev0XszzUh
 4YioA52Bh1soLptuW8kr1x1chEhR0dzWn/0i/TsOT59rnImxaIhu/ZT3T0bSLBfabuXx
 INKHnK51dhceOFzBZEL7SkhvFepOxlFdT1fe0axYVEeZ/1396UkMNJ9FB4uR6HTkQjYa
 ecvQ==
X-Gm-Message-State: AOJu0YwiF3QWi20fcynJaX08K4nfxyaiRqGfnCmuqtbmzXDgxhPvUFBW
 /lciswNSOipZUNW8FjpAnT+AYMAXXel5+0VKr6SN0Hs4UGJhAYC1ND1IZGKE0DLpLjyIwaU7dJP
 NLm4NC2ou1ZFrGFWmTVFZx+hHqWhtmLZC6g6A6LjvRe5XCHb8mAmPFshd/FbLdiYlKODKABU=
X-Gm-Gg: ASbGncuLThWjyRx8Y8BRBYmP3ulex1oiCMnAp5AkIcOF8J+cw4be2+KG3xETsiJmu7t
 ErH7jvQQgr26hM/nQpvgOmF2TnBaWYfOxja4Krospjr0976vh/7SwLKN53MLZSykrBe/txaZvQ2
 sfTtXKJk9byRBUr4Eg5L5ahQ6Jp/QJxZE1VWxo8GtsWxIpEJ+QJCFREqkF2kHmBnDv9iRtAM1Bv
 XNCEawqmL6dHx2zTLa+dAgX9luL/NQc/aHCV1st9IT/qBIInriaX5Mx+I1h0Nh7S0pivRE9W5AW
 SRoa1X4RURr2057SpsKT/yDZ2Lytp9G5kLYWO2M5m4fKt1tuc64Vz6XLAGNz6KGu3t8ykWngwa5
 CYRru7fYUanMILROxCfxVFe2p
X-Received: by 2002:ad4:5f8e:0:b0:6d8:e5f4:b977 with SMTP id
 6a1803df08f44-6f8b084b11amr92755426d6.5.1747447200619; 
 Fri, 16 May 2025 19:00:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJGBignWfm9id7iBq6ttXxZrffttYAN/zfS+h7Joc/k0311WHYs1T7oRnD4E6128xUndOf6g==
X-Received: by 2002:ad4:5f8e:0:b0:6d8:e5f4:b977 with SMTP id
 6a1803df08f44-6f8b084b11amr92755206d6.5.1747447200124; 
 Fri, 16 May 2025 19:00:00 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e70180f7sm672167e87.128.2025.05.16.18.59.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 18:59:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 17 May 2025 04:59:46 +0300
Subject: [PATCH v6 10/10] drm/bridge: adv7511: switch to the HDMI connector
 helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250517-drm-hdmi-connector-cec-v6-10-35651db6f19b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=34464;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BOyopBTpr+POzl7WvSYVI3Xm07zdAHUWrgMFn01FWoA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoJ+2Mk1kTK6vuHU9ArEEGtr2NrKH2yv/qkwH++
 Sd9plmwgr6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCftjAAKCRCLPIo+Aiko
 1TlvB/9HAa6KGThwD6/nGd6sl+yiK4AT8XdkJovK9c1bWuY0FAhxVx1FGjOmHBxD0thMODQ9IM8
 FqL9d99Yflf9MCBcnLny0XztpnaLlmFVWcJSVUwj8paEn/ntfvNhB62GJRAdfg/kgkUkZF9FuBs
 eg0j3RlRfU9RB1t77JopbEfTZ2Qm/ila20QetPMyWyx7VIHogA0OF/9L/Js6jsDMl67Z57+nBgP
 VGQ2iIBgX3HZgp4XCwc/F0iI6N93vQtAD9BAo01HzYwQOHbt755PWtuhEmWvgs06q+SK1UwNiIH
 lo7o4lB0gbbG4t4iMToIvApeobvajaq8jWHCwGeyyIXv2hFd
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: f8MLBb_a3zgB-AeS6qFpieipefALu44c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE3MDAxNyBTYWx0ZWRfX86OIoYEcroW0
 dF4wkULWi0L+7BGnR1CGj3yZLButfeqjXLXb9JOmoQlFGTxhiLrbfQStHF4c9U3Lkkew5kZVdK8
 2eJwhHfmmy8xvHkw68a4LUyqzkgAO+okk0gJwaUfcDOIKoLnJJ5Y68v7sUGG2J1aLzSzzRxxV2L
 UIwIo9jH6rir0uEJPKcTKLE7PoZnOpJDpZAHpWHpZJFuyAy1J26IGB/Wp5J7Mw17Sbul1ZIMiIh
 Y4gxD9ZkVrF3lXrCACwM4tgWLngDElYtfFNxiqSFANNVMBLkIPjnK1rU/lObmjMpUO+ybOPzxpS
 dj7e5y38ICpqDqVK5vAq+xrLhEp6X/ifhJ0AhqNUNPjyscTivnNTNsTNYPfTK+hi3ufLlMm/sjb
 0Mr6stl75vmPIc9BLV5gyacU4CBGfzobN256i9Dbk/u/Fh915Nrv+Pe5D1ZvE9w12DpFj7+l
X-Authority-Analysis: v=2.4 cv=CIIqXQrD c=1 sm=1 tr=0 ts=6827eda4 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Cr31Tnr6-c0FpRDxqzMA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: f8MLBb_a3zgB-AeS6qFpieipefALu44c
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

Rewrite the ADV7511 driver to use implementation provided by the DRM
HDMI connector framework, including the Audio and CEC bits. Drop the
in-bridge connector support and use drm_bridge_connector if the host
requires the connector to be provided by the bridge.

Note: currently only AVI InfoFrames are supported. Existing driver
doesn't support programming any other InfoFrames directly and Audio
InfoFrame seems to be programmed using individual bits and pieces rather
than programming it directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/adv7511/Kconfig         |   5 +-
 drivers/gpu/drm/bridge/adv7511/adv7511.h       |  52 ++--
 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c |  77 +-----
 drivers/gpu/drm/bridge/adv7511/adv7511_cec.c   |  57 ++--
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c   | 345 +++++++++++--------------
 drivers/gpu/drm/bridge/adv7511/adv7533.c       |   4 -
 6 files changed, 212 insertions(+), 328 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/Kconfig b/drivers/gpu/drm/bridge/adv7511/Kconfig
index f46a5e26b5dd640670afa21802f9019d5c7439fb..59a5256ce8a6e16dfbf1848a7c85ac7d709a68ed 100644
--- a/drivers/gpu/drm/bridge/adv7511/Kconfig
+++ b/drivers/gpu/drm/bridge/adv7511/Kconfig
@@ -5,6 +5,9 @@ config DRM_I2C_ADV7511
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
 	select DRM_MIPI_DSI
+	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
+	select DRM_DISPLAY_HDMI_STATE_HELPER
 	help
 	  Support for the Analog Devices ADV7511(W)/13/33/35 HDMI encoders.
 
@@ -19,7 +22,7 @@ config DRM_I2C_ADV7511_AUDIO
 config DRM_I2C_ADV7511_CEC
 	bool "ADV7511/33/35 HDMI CEC driver"
 	depends on DRM_I2C_ADV7511
-	select CEC_CORE
+	select DRM_DISPLAY_HDMI_CEC_HELPER
 	default y
 	help
 	  When selected the HDMI transmitter will support the CEC feature.
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
index ec0b7f3d889c4eedeb1d80369fd2a160cd0e2968..90c9a3da2406d16c8988548a87053c122a332f31 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
@@ -313,16 +313,11 @@ enum adv7511_csc_scaling {
  * @csc_enable:			Whether to enable color space conversion
  * @csc_scaling_factor:		Color space conversion scaling factor
  * @csc_coefficents:		Color space conversion coefficents
- * @hdmi_mode:			Whether to use HDMI or DVI output mode
- * @avi_infoframe:		HDMI infoframe
  */
 struct adv7511_video_config {
 	bool csc_enable;
 	enum adv7511_csc_scaling csc_scaling_factor;
 	const uint16_t *csc_coefficents;
-
-	bool hdmi_mode;
-	struct hdmi_avi_infoframe avi_infoframe;
 };
 
 enum adv7511_type {
@@ -337,6 +332,7 @@ struct adv7511_chip_info {
 	enum adv7511_type type;
 	unsigned int max_mode_clock_khz;
 	unsigned int max_lane_freq_khz;
+	const char *name;
 	const char * const *supply_names;
 	unsigned int num_supplies;
 	unsigned int reg_cec_offset;
@@ -371,7 +367,7 @@ struct adv7511 {
 	struct work_struct hpd_work;
 
 	struct drm_bridge bridge;
-	struct drm_connector connector;
+	struct drm_connector *cec_connector;
 
 	bool embedded_sync;
 	enum adv7511_sync_polarity vsync_polarity;
@@ -389,9 +385,7 @@ struct adv7511 {
 	bool use_timing_gen;
 
 	const struct adv7511_chip_info *info;
-	struct platform_device *audio_pdev;
 
-	struct cec_adapter *cec_adap;
 	u8   cec_addr[ADV7511_MAX_ADDRS];
 	u8   cec_valid_addrs;
 	bool cec_enabled_adap;
@@ -399,16 +393,24 @@ struct adv7511 {
 	u32 cec_clk_freq;
 };
 
+static inline struct adv7511 *bridge_to_adv7511(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct adv7511, bridge);
+}
+
 #ifdef CONFIG_DRM_I2C_ADV7511_CEC
-int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511);
+int adv7511_cec_init(struct drm_connector *connector,
+		     struct drm_bridge *bridge);
+int adv7511_cec_enable(struct drm_bridge *bridge, bool enable);
+int adv7511_cec_log_addr(struct drm_bridge *bridge, u8 addr);
+int adv7511_cec_transmit(struct drm_bridge *bridge, u8 attempts,
+			      u32 signal_free_time, struct cec_msg *msg);
 int adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1);
 #else
-static inline int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
-{
-	regmap_write(adv7511->regmap, ADV7511_REG_CEC_CTRL,
-		     ADV7511_CEC_CTRL_POWER_DOWN);
-	return 0;
-}
+#define adv7511_cec_init NULL
+#define adv7511_cec_enable NULL
+#define adv7511_cec_log_addr NULL
+#define adv7511_cec_transmit NULL
 #endif
 
 void adv7533_dsi_power_on(struct adv7511 *adv);
@@ -421,16 +423,18 @@ int adv7533_attach_dsi(struct adv7511 *adv);
 int adv7533_parse_dt(struct device_node *np, struct adv7511 *adv);
 
 #ifdef CONFIG_DRM_I2C_ADV7511_AUDIO
-int adv7511_audio_init(struct device *dev, struct adv7511 *adv7511);
-void adv7511_audio_exit(struct adv7511 *adv7511);
+int adv7511_hdmi_audio_startup(struct drm_connector *connector,
+			       struct drm_bridge *bridge);
+void adv7511_hdmi_audio_shutdown(struct drm_connector *connector,
+				 struct drm_bridge *bridge);
+int adv7511_hdmi_audio_prepare(struct drm_connector *connector,
+			       struct drm_bridge *bridge,
+			       struct hdmi_codec_daifmt *fmt,
+			       struct hdmi_codec_params *hparms);
 #else /*CONFIG_DRM_I2C_ADV7511_AUDIO */
-static inline int adv7511_audio_init(struct device *dev, struct adv7511 *adv7511)
-{
-	return 0;
-}
-static inline void adv7511_audio_exit(struct adv7511 *adv7511)
-{
-}
+#define adv7511_hdmi_audio_startup NULL
+#define adv7511_hdmi_audio_shutdown NULL
+#define adv7511_hdmi_audio_prepare NULL
 #endif /* CONFIG_DRM_I2C_ADV7511_AUDIO */
 
 #endif /* __DRM_I2C_ADV7511_H__ */
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
index 1ff8c815ec798445ec771f549eca8a06a99ff64d..915c3b96721626c6af5d454c0bf7f53e37ff25af 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
@@ -55,11 +55,12 @@ static int adv7511_update_cts_n(struct adv7511 *adv7511)
 	return 0;
 }
 
-static int adv7511_hdmi_hw_params(struct device *dev, void *data,
-				  struct hdmi_codec_daifmt *fmt,
-				  struct hdmi_codec_params *hparms)
+int adv7511_hdmi_audio_prepare(struct drm_connector *connector,
+			       struct drm_bridge *bridge,
+			       struct hdmi_codec_daifmt *fmt,
+			       struct hdmi_codec_params *hparms)
 {
-	struct adv7511 *adv7511 = dev_get_drvdata(dev);
+	struct adv7511 *adv7511 = bridge_to_adv7511(bridge);
 	unsigned int audio_source, i2s_format = 0;
 	unsigned int invert_clock;
 	unsigned int rate;
@@ -167,9 +168,10 @@ static int adv7511_hdmi_hw_params(struct device *dev, void *data,
 	return 0;
 }
 
-static int audio_startup(struct device *dev, void *data)
+int adv7511_hdmi_audio_startup(struct drm_connector *connector,
+			       struct drm_bridge *bridge)
 {
-	struct adv7511 *adv7511 = dev_get_drvdata(dev);
+	struct adv7511 *adv7511 = bridge_to_adv7511(bridge);
 
 	regmap_update_bits(adv7511->regmap, ADV7511_REG_AUDIO_CONFIG,
 				BIT(7), 0);
@@ -204,69 +206,12 @@ static int audio_startup(struct device *dev, void *data)
 	return 0;
 }
 
-static void audio_shutdown(struct device *dev, void *data)
+void adv7511_hdmi_audio_shutdown(struct drm_connector *connector,
+				 struct drm_bridge *bridge)
 {
-	struct adv7511 *adv7511 = dev_get_drvdata(dev);
+	struct adv7511 *adv7511 = bridge_to_adv7511(bridge);
 
 	if (adv7511->audio_source == ADV7511_AUDIO_SOURCE_SPDIF)
 		regmap_update_bits(adv7511->regmap, ADV7511_REG_AUDIO_CONFIG,
 				   BIT(7), 0);
 }
-
-static int adv7511_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
-					struct device_node *endpoint,
-					void *data)
-{
-	struct of_endpoint of_ep;
-	int ret;
-
-	ret = of_graph_parse_endpoint(endpoint, &of_ep);
-	if (ret < 0)
-		return ret;
-
-	/*
-	 * HDMI sound should be located as reg = <2>
-	 * Then, it is sound port 0
-	 */
-	if (of_ep.port == 2)
-		return 0;
-
-	return -EINVAL;
-}
-
-static const struct hdmi_codec_ops adv7511_codec_ops = {
-	.hw_params	= adv7511_hdmi_hw_params,
-	.audio_shutdown = audio_shutdown,
-	.audio_startup	= audio_startup,
-	.get_dai_id	= adv7511_hdmi_i2s_get_dai_id,
-};
-
-static const struct hdmi_codec_pdata codec_data = {
-	.ops = &adv7511_codec_ops,
-	.i2s_formats = (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |
-			SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S24_LE |
-			SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE),
-	.max_i2s_channels = 2,
-	.i2s = 1,
-	.no_i2s_capture = 1,
-	.spdif = 1,
-	.no_spdif_capture = 1,
-};
-
-int adv7511_audio_init(struct device *dev, struct adv7511 *adv7511)
-{
-	adv7511->audio_pdev = platform_device_register_data(dev,
-					HDMI_CODEC_DRV_NAME,
-					PLATFORM_DEVID_AUTO,
-					&codec_data,
-					sizeof(codec_data));
-	return PTR_ERR_OR_ZERO(adv7511->audio_pdev);
-}
-
-void adv7511_audio_exit(struct adv7511 *adv7511)
-{
-	if (adv7511->audio_pdev) {
-		platform_device_unregister(adv7511->audio_pdev);
-		adv7511->audio_pdev = NULL;
-	}
-}
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
index 2e9c88a2b5ed44ef0cd417c553ea7873d00e4a14..822265426f58a6887941522e86cddac9d0151371 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
@@ -12,6 +12,8 @@
 
 #include <media/cec.h>
 
+#include <drm/display/drm_hdmi_cec_helper.h>
+
 #include "adv7511.h"
 
 static const u8 ADV7511_REG_CEC_RX_FRAME_HDR[] = {
@@ -44,8 +46,8 @@ static void adv_cec_tx_raw_status(struct adv7511 *adv7511, u8 tx_raw_status)
 		return;
 
 	if (tx_raw_status & ADV7511_INT1_CEC_TX_ARBIT_LOST) {
-		cec_transmit_attempt_done(adv7511->cec_adap,
-					  CEC_TX_STATUS_ARB_LOST);
+		drm_connector_hdmi_cec_transmit_attempt_done(adv7511->cec_connector,
+							     CEC_TX_STATUS_ARB_LOST);
 		return;
 	}
 	if (tx_raw_status & ADV7511_INT1_CEC_TX_RETRY_TIMEOUT) {
@@ -72,12 +74,14 @@ static void adv_cec_tx_raw_status(struct adv7511 *adv7511, u8 tx_raw_status)
 			if (low_drive_cnt)
 				status |= CEC_TX_STATUS_LOW_DRIVE;
 		}
-		cec_transmit_done(adv7511->cec_adap, status,
-				  0, nack_cnt, low_drive_cnt, err_cnt);
+		drm_connector_hdmi_cec_transmit_done(adv7511->cec_connector, status,
+						     0, nack_cnt, low_drive_cnt,
+						     err_cnt);
 		return;
 	}
 	if (tx_raw_status & ADV7511_INT1_CEC_TX_READY) {
-		cec_transmit_attempt_done(adv7511->cec_adap, CEC_TX_STATUS_OK);
+		drm_connector_hdmi_cec_transmit_attempt_done(adv7511->cec_connector,
+							     CEC_TX_STATUS_OK);
 		return;
 	}
 }
@@ -116,7 +120,7 @@ static void adv7511_cec_rx(struct adv7511 *adv7511, int rx_buf)
 	regmap_update_bits(adv7511->regmap_cec,
 			   ADV7511_REG_CEC_RX_BUFFERS + offset, BIT(rx_buf), 0);
 
-	cec_received_msg(adv7511->cec_adap, &msg);
+	drm_connector_hdmi_cec_received_msg(adv7511->cec_connector, &msg);
 }
 
 int adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1)
@@ -179,9 +183,9 @@ int adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1)
 	return IRQ_HANDLED;
 }
 
-static int adv7511_cec_adap_enable(struct cec_adapter *adap, bool enable)
+int adv7511_cec_enable(struct drm_bridge *bridge, bool enable)
 {
-	struct adv7511 *adv7511 = cec_get_drvdata(adap);
+	struct adv7511 *adv7511 = bridge_to_adv7511(bridge);
 	unsigned int offset = adv7511->info->reg_cec_offset;
 
 	if (adv7511->i2c_cec == NULL)
@@ -225,9 +229,9 @@ static int adv7511_cec_adap_enable(struct cec_adapter *adap, bool enable)
 	return 0;
 }
 
-static int adv7511_cec_adap_log_addr(struct cec_adapter *adap, u8 addr)
+int adv7511_cec_log_addr(struct drm_bridge *bridge, u8 addr)
 {
-	struct adv7511 *adv7511 = cec_get_drvdata(adap);
+	struct adv7511 *adv7511 = bridge_to_adv7511(bridge);
 	unsigned int offset = adv7511->info->reg_cec_offset;
 	unsigned int i, free_idx = ADV7511_MAX_ADDRS;
 
@@ -293,10 +297,10 @@ static int adv7511_cec_adap_log_addr(struct cec_adapter *adap, u8 addr)
 	return 0;
 }
 
-static int adv7511_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
-				     u32 signal_free_time, struct cec_msg *msg)
+int adv7511_cec_transmit(struct drm_bridge *bridge, u8 attempts,
+			 u32 signal_free_time, struct cec_msg *msg)
 {
-	struct adv7511 *adv7511 = cec_get_drvdata(adap);
+	struct adv7511 *adv7511 = bridge_to_adv7511(bridge);
 	unsigned int offset = adv7511->info->reg_cec_offset;
 	u8 len = msg->len;
 	unsigned int i;
@@ -328,12 +332,6 @@ static int adv7511_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
 	return 0;
 }
 
-static const struct cec_adap_ops adv7511_cec_adap_ops = {
-	.adap_enable = adv7511_cec_adap_enable,
-	.adap_log_addr = adv7511_cec_adap_log_addr,
-	.adap_transmit = adv7511_cec_adap_transmit,
-};
-
 static int adv7511_cec_parse_dt(struct device *dev, struct adv7511 *adv7511)
 {
 	adv7511->cec_clk = devm_clk_get(dev, "cec");
@@ -348,20 +346,18 @@ static int adv7511_cec_parse_dt(struct device *dev, struct adv7511 *adv7511)
 	return 0;
 }
 
-int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
+int adv7511_cec_init(struct drm_connector *connector,
+		     struct drm_bridge *bridge)
 {
+	struct adv7511 *adv7511 = bridge_to_adv7511(bridge);
+	struct device *dev = &adv7511->i2c_main->dev;
 	unsigned int offset = adv7511->info->reg_cec_offset;
 	int ret = adv7511_cec_parse_dt(dev, adv7511);
 
 	if (ret)
 		goto err_cec_parse_dt;
 
-	adv7511->cec_adap = cec_allocate_adapter(&adv7511_cec_adap_ops,
-		adv7511, dev_name(dev), CEC_CAP_DEFAULTS, ADV7511_MAX_ADDRS);
-	if (IS_ERR(adv7511->cec_adap)) {
-		ret = PTR_ERR(adv7511->cec_adap);
-		goto err_cec_alloc;
-	}
+	adv7511->cec_connector = connector;
 
 	regmap_write(adv7511->regmap, ADV7511_REG_CEC_CTRL, 0);
 	/* cec soft reset */
@@ -378,17 +374,8 @@ int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
 		     ADV7511_REG_CEC_CLK_DIV + offset,
 		     ((adv7511->cec_clk_freq / 750000) - 1) << 2);
 
-	ret = cec_register_adapter(adv7511->cec_adap, dev);
-	if (ret)
-		goto err_cec_register;
 	return 0;
 
-err_cec_register:
-	cec_delete_adapter(adv7511->cec_adap);
-	adv7511->cec_adap = NULL;
-err_cec_alloc:
-	dev_info(dev, "Initializing CEC failed with error %d, disabling CEC\n",
-		 ret);
 err_cec_parse_dt:
 	regmap_write(adv7511->regmap, ADV7511_REG_CEC_CTRL,
 		     ADV7511_CEC_CTRL_POWER_DOWN);
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 1257009e850c1b20184cfaea5b6a4440e75e10d7..8b7548448615f84db796467ffd70fe11554bb681 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -12,14 +12,17 @@
 #include <linux/of.h>
 #include <linux/slab.h>
 
-#include <media/cec.h>
+#include <sound/pcm.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/display/drm_hdmi_helper.h>
+#include <drm/display/drm_hdmi_state_helper.h>
 
 #include "adv7511.h"
 
@@ -203,62 +206,37 @@ static const uint16_t adv7511_csc_ycbcr_to_rgb[] = {
 
 static void adv7511_set_config_csc(struct adv7511 *adv7511,
 				   struct drm_connector *connector,
-				   bool rgb, bool hdmi_mode)
+				   bool rgb)
 {
 	struct adv7511_video_config config;
 	bool output_format_422, output_format_ycbcr;
 	unsigned int mode;
-	uint8_t infoframe[17];
-
-	config.hdmi_mode = hdmi_mode;
-
-	hdmi_avi_infoframe_init(&config.avi_infoframe);
-
-	config.avi_infoframe.scan_mode = HDMI_SCAN_MODE_UNDERSCAN;
 
 	if (rgb) {
 		config.csc_enable = false;
-		config.avi_infoframe.colorspace = HDMI_COLORSPACE_RGB;
+		output_format_422 = false;
+		output_format_ycbcr = false;
 	} else {
 		config.csc_scaling_factor = ADV7511_CSC_SCALING_4;
 		config.csc_coefficents = adv7511_csc_ycbcr_to_rgb;
 
 		if ((connector->display_info.color_formats &
 		     DRM_COLOR_FORMAT_YCBCR422) &&
-		    config.hdmi_mode) {
+		    connector->display_info.is_hdmi) {
 			config.csc_enable = false;
-			config.avi_infoframe.colorspace =
-				HDMI_COLORSPACE_YUV422;
-		} else {
-			config.csc_enable = true;
-			config.avi_infoframe.colorspace = HDMI_COLORSPACE_RGB;
-		}
-	}
-
-	if (config.hdmi_mode) {
-		mode = ADV7511_HDMI_CFG_MODE_HDMI;
-
-		switch (config.avi_infoframe.colorspace) {
-		case HDMI_COLORSPACE_YUV444:
-			output_format_422 = false;
-			output_format_ycbcr = true;
-			break;
-		case HDMI_COLORSPACE_YUV422:
 			output_format_422 = true;
 			output_format_ycbcr = true;
-			break;
-		default:
+		} else {
+			config.csc_enable = true;
 			output_format_422 = false;
 			output_format_ycbcr = false;
-			break;
 		}
-	} else {
-		mode = ADV7511_HDMI_CFG_MODE_DVI;
-		output_format_422 = false;
-		output_format_ycbcr = false;
 	}
 
-	adv7511_packet_disable(adv7511, ADV7511_PACKET_ENABLE_AVI_INFOFRAME);
+	if (connector->display_info.is_hdmi)
+		mode = ADV7511_HDMI_CFG_MODE_HDMI;
+	else
+		mode = ADV7511_HDMI_CFG_MODE_DVI;
 
 	adv7511_set_colormap(adv7511, config.csc_enable,
 			     config.csc_coefficents,
@@ -269,15 +247,6 @@ static void adv7511_set_config_csc(struct adv7511 *adv7511,
 
 	regmap_update_bits(adv7511->regmap, ADV7511_REG_HDCP_HDMI_CFG,
 			   ADV7511_HDMI_CFG_MODE_MASK, mode);
-
-	hdmi_avi_infoframe_pack(&config.avi_infoframe, infoframe,
-				sizeof(infoframe));
-
-	/* The AVI infoframe id is not configurable */
-	regmap_bulk_write(adv7511->regmap, ADV7511_REG_AVI_INFOFRAME_VERSION,
-			  infoframe + 1, sizeof(infoframe) - 1);
-
-	adv7511_packet_enable(adv7511, ADV7511_PACKET_ENABLE_AVI_INFOFRAME);
 }
 
 static void adv7511_set_link_config(struct adv7511 *adv7511,
@@ -446,22 +415,16 @@ static void adv7511_hpd_work(struct work_struct *work)
 	 * restore its state.
 	 */
 	if (status == connector_status_connected &&
-	    adv7511->connector.status == connector_status_disconnected &&
+	    adv7511->status == connector_status_disconnected &&
 	    adv7511->powered) {
 		regcache_mark_dirty(adv7511->regmap);
 		adv7511_power_on(adv7511);
 	}
 
-	if (adv7511->connector.status != status) {
-		adv7511->connector.status = status;
+	if (adv7511->status != status) {
+		adv7511->status = status;
 
-		if (adv7511->connector.dev) {
-			if (status == connector_status_disconnected)
-				cec_phys_addr_invalidate(adv7511->cec_adap);
-			drm_kms_helper_hotplug_event(adv7511->connector.dev);
-		} else {
-			drm_bridge_hpd_notify(&adv7511->bridge, status);
-		}
+		drm_bridge_hpd_notify(&adv7511->bridge, status);
 	}
 }
 
@@ -636,45 +599,11 @@ static const struct drm_edid *adv7511_edid_read(struct adv7511 *adv7511,
 	if (!adv7511->powered)
 		__adv7511_power_off(adv7511);
 
-	if (drm_edid) {
-		/*
-		 * FIXME: The CEC physical address should be set using
-		 * cec_s_phys_addr(adap,
-		 * connector->display_info.source_physical_address, false) from
-		 * a path that has read the EDID and called
-		 * drm_edid_connector_update().
-		 */
-		const struct edid *edid = drm_edid_raw(drm_edid);
-
-		adv7511_set_config_csc(adv7511, connector, adv7511->rgb,
-				       drm_detect_hdmi_monitor(edid));
-
-		cec_s_phys_addr_from_edid(adv7511->cec_adap, edid);
-	} else {
-		cec_s_phys_addr_from_edid(adv7511->cec_adap, NULL);
-	}
-
 	return drm_edid;
 }
 
-static int adv7511_get_modes(struct adv7511 *adv7511,
-			     struct drm_connector *connector)
-{
-	const struct drm_edid *drm_edid;
-	unsigned int count;
-
-	drm_edid = adv7511_edid_read(adv7511, connector);
-
-	drm_edid_connector_update(connector, drm_edid);
-	count = drm_edid_connector_add_modes(connector);
-
-	drm_edid_free(drm_edid);
-
-	return count;
-}
-
 static enum drm_connector_status
-adv7511_detect(struct adv7511 *adv7511, struct drm_connector *connector)
+adv7511_detect(struct adv7511 *adv7511)
 {
 	enum drm_connector_status status;
 	unsigned int val;
@@ -699,8 +628,6 @@ adv7511_detect(struct adv7511 *adv7511, struct drm_connector *connector)
 	if (status == connector_status_connected && hpd && adv7511->powered) {
 		regcache_mark_dirty(adv7511->regmap);
 		adv7511_power_on(adv7511);
-		if (connector)
-			adv7511_get_modes(adv7511, connector);
 		if (adv7511->status == connector_status_connected)
 			status = connector_status_disconnected;
 	} else {
@@ -719,17 +646,7 @@ adv7511_detect(struct adv7511 *adv7511, struct drm_connector *connector)
 	return status;
 }
 
-static enum drm_mode_status adv7511_mode_valid(struct adv7511 *adv7511,
-			      const struct drm_display_mode *mode)
-{
-	if (mode->clock > 165000)
-		return MODE_CLOCK_HIGH;
-
-	return MODE_OK;
-}
-
 static void adv7511_mode_set(struct adv7511 *adv7511,
-			     const struct drm_display_mode *mode,
 			     const struct drm_display_mode *adj_mode)
 {
 	unsigned int low_refresh_rate;
@@ -800,11 +717,11 @@ static void adv7511_mode_set(struct adv7511 *adv7511,
 			vsync_polarity = 1;
 	}
 
-	if (drm_mode_vrefresh(mode) <= 24)
+	if (drm_mode_vrefresh(adj_mode) <= 24)
 		low_refresh_rate = ADV7511_LOW_REFRESH_RATE_24HZ;
-	else if (drm_mode_vrefresh(mode) <= 25)
+	else if (drm_mode_vrefresh(adj_mode) <= 25)
 		low_refresh_rate = ADV7511_LOW_REFRESH_RATE_25HZ;
-	else if (drm_mode_vrefresh(mode) <= 30)
+	else if (drm_mode_vrefresh(adj_mode) <= 30)
 		low_refresh_rate = ADV7511_LOW_REFRESH_RATE_30HZ;
 	else
 		low_refresh_rate = ADV7511_LOW_REFRESH_RATE_NONE;
@@ -826,77 +743,21 @@ static void adv7511_mode_set(struct adv7511 *adv7511,
 	 * supposed to give better results.
 	 */
 
-	adv7511->f_tmds = mode->clock;
-}
-
-/* -----------------------------------------------------------------------------
- * DRM Connector Operations
- */
-
-static struct adv7511 *connector_to_adv7511(struct drm_connector *connector)
-{
-	return container_of(connector, struct adv7511, connector);
+	adv7511->f_tmds = adj_mode->clock;
 }
 
-static int adv7511_connector_get_modes(struct drm_connector *connector)
-{
-	struct adv7511 *adv = connector_to_adv7511(connector);
-
-	return adv7511_get_modes(adv, connector);
-}
-
-static enum drm_mode_status
-adv7511_connector_mode_valid(struct drm_connector *connector,
-			     const struct drm_display_mode *mode)
-{
-	struct adv7511 *adv = connector_to_adv7511(connector);
-
-	return adv7511_mode_valid(adv, mode);
-}
-
-static struct drm_connector_helper_funcs adv7511_connector_helper_funcs = {
-	.get_modes = adv7511_connector_get_modes,
-	.mode_valid = adv7511_connector_mode_valid,
-};
-
-static enum drm_connector_status
-adv7511_connector_detect(struct drm_connector *connector, bool force)
-{
-	struct adv7511 *adv = connector_to_adv7511(connector);
-
-	return adv7511_detect(adv, connector);
-}
-
-static const struct drm_connector_funcs adv7511_connector_funcs = {
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.detect = adv7511_connector_detect,
-	.destroy = drm_connector_cleanup,
-	.reset = drm_atomic_helper_connector_reset,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-};
-
 static int adv7511_connector_init(struct adv7511 *adv)
 {
 	struct drm_bridge *bridge = &adv->bridge;
-	int ret;
-
-	if (adv->i2c_main->irq)
-		adv->connector.polled = DRM_CONNECTOR_POLL_HPD;
-	else
-		adv->connector.polled = DRM_CONNECTOR_POLL_CONNECT |
-				DRM_CONNECTOR_POLL_DISCONNECT;
+	struct drm_connector *connector;
 
-	ret = drm_connector_init(bridge->dev, &adv->connector,
-				 &adv7511_connector_funcs,
-				 DRM_MODE_CONNECTOR_HDMIA);
-	if (ret < 0) {
+	connector = drm_bridge_connector_init(bridge->dev, bridge->encoder);
+	if (IS_ERR(connector)) {
 		DRM_ERROR("Failed to initialize connector with drm\n");
-		return ret;
+		return PTR_ERR(connector);
 	}
-	drm_connector_helper_add(&adv->connector,
-				 &adv7511_connector_helper_funcs);
-	drm_connector_attach_encoder(&adv->connector, bridge->encoder);
+
+	drm_connector_attach_encoder(connector, bridge->encoder);
 
 	return 0;
 }
@@ -905,7 +766,7 @@ static int adv7511_connector_init(struct adv7511 *adv)
  * DRM Bridge Operations
  */
 
-static struct adv7511 *bridge_to_adv7511(struct drm_bridge *bridge)
+static const struct adv7511 *bridge_to_adv7511_const(const struct drm_bridge *bridge)
 {
 	return container_of(bridge, struct adv7511, bridge);
 }
@@ -914,8 +775,29 @@ static void adv7511_bridge_atomic_enable(struct drm_bridge *bridge,
 					 struct drm_atomic_state *state)
 {
 	struct adv7511 *adv = bridge_to_adv7511(bridge);
+	struct drm_connector *connector;
+	struct drm_connector_state *conn_state;
+	struct drm_crtc_state *crtc_state;
 
 	adv7511_power_on(adv);
+
+	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
+	if (WARN_ON(!connector))
+		return;
+
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
+	if (WARN_ON(!conn_state))
+		return;
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
+	if (WARN_ON(!crtc_state))
+		return;
+
+	adv7511_set_config_csc(adv, connector, adv->rgb);
+
+	adv7511_mode_set(adv, &crtc_state->adjusted_mode);
+
+	drm_atomic_helper_connector_hdmi_update_infoframes(connector, state);
 }
 
 static void adv7511_bridge_atomic_disable(struct drm_bridge *bridge,
@@ -926,13 +808,17 @@ static void adv7511_bridge_atomic_disable(struct drm_bridge *bridge,
 	adv7511_power_off(adv);
 }
 
-static void adv7511_bridge_mode_set(struct drm_bridge *bridge,
-				    const struct drm_display_mode *mode,
-				    const struct drm_display_mode *adj_mode)
+static enum drm_mode_status
+adv7511_bridge_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge,
+					 const struct drm_display_mode *mode,
+					 unsigned long long tmds_rate)
 {
-	struct adv7511 *adv = bridge_to_adv7511(bridge);
+	const struct adv7511 *adv = bridge_to_adv7511_const(bridge);
 
-	adv7511_mode_set(adv, mode, adj_mode);
+	if (tmds_rate > 1000ULL * adv->info->max_mode_clock_khz)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
 }
 
 static enum drm_mode_status adv7511_bridge_mode_valid(struct drm_bridge *bridge,
@@ -941,10 +827,10 @@ static enum drm_mode_status adv7511_bridge_mode_valid(struct drm_bridge *bridge,
 {
 	struct adv7511 *adv = bridge_to_adv7511(bridge);
 
-	if (adv->info->has_dsi)
-		return adv7533_mode_valid(adv, mode);
-	else
-		return adv7511_mode_valid(adv, mode);
+	if (!adv->info->has_dsi)
+		return MODE_OK;
+
+	return adv7533_mode_valid(adv, mode);
 }
 
 static int adv7511_bridge_attach(struct drm_bridge *bridge,
@@ -978,7 +864,7 @@ static enum drm_connector_status adv7511_bridge_detect(struct drm_bridge *bridge
 {
 	struct adv7511 *adv = bridge_to_adv7511(bridge);
 
-	return adv7511_detect(adv, NULL);
+	return adv7511_detect(adv);
 }
 
 static const struct drm_edid *adv7511_bridge_edid_read(struct drm_bridge *bridge,
@@ -989,28 +875,71 @@ static const struct drm_edid *adv7511_bridge_edid_read(struct drm_bridge *bridge
 	return adv7511_edid_read(adv, connector);
 }
 
-static void adv7511_bridge_hpd_notify(struct drm_bridge *bridge,
-				      enum drm_connector_status status)
+static int adv7511_bridge_hdmi_clear_infoframe(struct drm_bridge *bridge,
+					       enum hdmi_infoframe_type type)
 {
-	struct adv7511 *adv = bridge_to_adv7511(bridge);
+	struct adv7511 *adv7511 = bridge_to_adv7511(bridge);
+
+	switch (type) {
+	case HDMI_INFOFRAME_TYPE_AVI:
+		adv7511_packet_disable(adv7511, ADV7511_PACKET_ENABLE_AVI_INFOFRAME);
+		break;
+	default:
+		drm_dbg_driver(adv7511->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
+		break;
+	}
+
+	return 0;
+}
+
+static int adv7511_bridge_hdmi_write_infoframe(struct drm_bridge *bridge,
+					       enum hdmi_infoframe_type type,
+					       const u8 *buffer, size_t len)
+{
+	struct adv7511 *adv7511 = bridge_to_adv7511(bridge);
+
+	adv7511_bridge_hdmi_clear_infoframe(bridge, type);
+
+	switch (type) {
+	case HDMI_INFOFRAME_TYPE_AVI:
+		/* The AVI infoframe id is not configurable */
+		regmap_bulk_write(adv7511->regmap, ADV7511_REG_AVI_INFOFRAME_VERSION,
+				  buffer + 1, len - 1);
 
-	if (status == connector_status_disconnected)
-		cec_phys_addr_invalidate(adv->cec_adap);
+		adv7511_packet_enable(adv7511, ADV7511_PACKET_ENABLE_AVI_INFOFRAME);
+		break;
+	default:
+		drm_dbg_driver(adv7511->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
+		break;
+	}
+
+	return 0;
 }
 
 static const struct drm_bridge_funcs adv7511_bridge_funcs = {
-	.mode_set = adv7511_bridge_mode_set,
 	.mode_valid = adv7511_bridge_mode_valid,
 	.attach = adv7511_bridge_attach,
 	.detect = adv7511_bridge_detect,
 	.edid_read = adv7511_bridge_edid_read,
-	.hpd_notify = adv7511_bridge_hpd_notify,
 
 	.atomic_enable = adv7511_bridge_atomic_enable,
 	.atomic_disable = adv7511_bridge_atomic_disable,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
+
+	.hdmi_tmds_char_rate_valid = adv7511_bridge_hdmi_tmds_char_rate_valid,
+	.hdmi_clear_infoframe = adv7511_bridge_hdmi_clear_infoframe,
+	.hdmi_write_infoframe = adv7511_bridge_hdmi_write_infoframe,
+
+	.hdmi_audio_startup = adv7511_hdmi_audio_startup,
+	.hdmi_audio_prepare = adv7511_hdmi_audio_prepare,
+	.hdmi_audio_shutdown = adv7511_hdmi_audio_shutdown,
+
+	.hdmi_cec_init = adv7511_cec_init,
+	.hdmi_cec_enable = adv7511_cec_enable,
+	.hdmi_cec_log_addr = adv7511_cec_log_addr,
+	.hdmi_cec_transmit = adv7511_cec_transmit,
 };
 
 /* -----------------------------------------------------------------------------
@@ -1323,22 +1252,44 @@ static int adv7511_probe(struct i2c_client *i2c)
 	if (adv7511->info->link_config)
 		adv7511_set_link_config(adv7511, &link_config);
 
-	ret = adv7511_cec_init(dev, adv7511);
-	if (ret)
-		goto err_unregister_cec;
+	regmap_write(adv7511->regmap, ADV7511_REG_CEC_CTRL,
+		     ADV7511_CEC_CTRL_POWER_DOWN);
 
 	adv7511->bridge.funcs = &adv7511_bridge_funcs;
-	adv7511->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID;
+	adv7511->bridge.ops = DRM_BRIDGE_OP_DETECT |
+		DRM_BRIDGE_OP_EDID |
+		DRM_BRIDGE_OP_HDMI |
+		DRM_BRIDGE_OP_HDMI_AUDIO |
+		DRM_BRIDGE_OP_HDMI_CEC_ADAPTER;
 	if (adv7511->i2c_main->irq)
 		adv7511->bridge.ops |= DRM_BRIDGE_OP_HPD;
 
+	adv7511->bridge.vendor = "Analog";
+	adv7511->bridge.product = adv7511->info->name;
+
+#ifdef CONFIG_DRM_I2C_ADV7511_AUDIO
+	adv7511->bridge.hdmi_audio_dev = dev;
+	adv7511->bridge.hdmi_audio_max_i2s_playback_channels = 2;
+	adv7511->bridge.hdmi_audio_i2s_formats = (SNDRV_PCM_FMTBIT_S16_LE |
+						  SNDRV_PCM_FMTBIT_S20_3LE |
+						  SNDRV_PCM_FMTBIT_S24_3LE |
+						  SNDRV_PCM_FMTBIT_S24_LE |
+						  SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE),
+	adv7511->bridge.hdmi_audio_spdif_playback = 1;
+	adv7511->bridge.hdmi_audio_dai_port = 2;
+#endif
+
+#ifdef CONFIG_DRM_I2C_ADV7511_CEC
+	adv7511->bridge.hdmi_cec_dev = dev;
+	adv7511->bridge.hdmi_cec_adapter_name = dev_name(dev);
+	adv7511->bridge.hdmi_cec_available_las = ADV7511_MAX_ADDRS;
+#endif
+
 	adv7511->bridge.of_node = dev->of_node;
 	adv7511->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 
 	drm_bridge_add(&adv7511->bridge);
 
-	adv7511_audio_init(dev, adv7511);
-
 	if (i2c->irq) {
 		init_waitqueue_head(&adv7511->wq);
 
@@ -1360,10 +1311,7 @@ static int adv7511_probe(struct i2c_client *i2c)
 	return 0;
 
 err_unregister_audio:
-	adv7511_audio_exit(adv7511);
 	drm_bridge_remove(&adv7511->bridge);
-err_unregister_cec:
-	cec_unregister_adapter(adv7511->cec_adap);
 	i2c_unregister_device(adv7511->i2c_cec);
 	clk_disable_unprepare(adv7511->cec_clk);
 err_i2c_unregister_packet:
@@ -1388,9 +1336,6 @@ static void adv7511_remove(struct i2c_client *i2c)
 
 	drm_bridge_remove(&adv7511->bridge);
 
-	adv7511_audio_exit(adv7511);
-
-	cec_unregister_adapter(adv7511->cec_adap);
 	i2c_unregister_device(adv7511->i2c_cec);
 	clk_disable_unprepare(adv7511->cec_clk);
 
@@ -1400,6 +1345,8 @@ static void adv7511_remove(struct i2c_client *i2c)
 
 static const struct adv7511_chip_info adv7511_chip_info = {
 	.type = ADV7511,
+	.name = "ADV7511",
+	.max_mode_clock_khz = 165000,
 	.supply_names = adv7511_supply_names,
 	.num_supplies = ARRAY_SIZE(adv7511_supply_names),
 	.link_config = true,
@@ -1407,6 +1354,7 @@ static const struct adv7511_chip_info adv7511_chip_info = {
 
 static const struct adv7511_chip_info adv7533_chip_info = {
 	.type = ADV7533,
+	.name = "ADV7533",
 	.max_mode_clock_khz = 80000,
 	.max_lane_freq_khz = 800000,
 	.supply_names = adv7533_supply_names,
@@ -1417,6 +1365,7 @@ static const struct adv7511_chip_info adv7533_chip_info = {
 
 static const struct adv7511_chip_info adv7535_chip_info = {
 	.type = ADV7535,
+	.name = "ADV7535",
 	.max_mode_clock_khz = 148500,
 	.max_lane_freq_khz = 891000,
 	.supply_names = adv7533_supply_names,
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
index 122ad91e8a3293de1839cad061cd858d8046b675..b12d422343fc139e8d9b59a2ded60ce08ce43dc8 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
@@ -106,10 +106,6 @@ enum drm_mode_status adv7533_mode_valid(struct adv7511 *adv,
 	struct mipi_dsi_device *dsi = adv->dsi;
 	u8 bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
 
-	/* Check max clock for either 7533 or 7535 */
-	if (mode->clock > adv->info->max_mode_clock_khz)
-		return MODE_CLOCK_HIGH;
-
 	/* Check max clock for each lane */
 	if (mode->clock * bpp > adv->info->max_lane_freq_khz * adv->num_dsi_lanes)
 		return MODE_CLOCK_HIGH;

-- 
2.39.5

