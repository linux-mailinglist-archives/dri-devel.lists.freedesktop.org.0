Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 836D6CFF59A
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 19:15:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A730A10E5F8;
	Wed,  7 Jan 2026 18:15:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZQwobCkp";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R0v8MsTX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC17210E5F8
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 18:15:14 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 607GM6A71979976
 for <dri-devel@lists.freedesktop.org>; Wed, 7 Jan 2026 18:15:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /G9oYIZxPHvtNlgDHuyoJcBPsfPtNnxLcd1dUJtcS+o=; b=ZQwobCkpTW2MdBiK
 cBSDmjNESFPC0lk+Ot4ZAVWIN/bSnuzmsbA4F2uN8J/GQsy8hcO9jNjNHs6g6zLG
 5gZ3dJBpP9n0UhuZajKT+SEyRoundu9vt/qUnjFcUSnolLqEq2y6K0Is0GA3/NLT
 tZyppf48BtIr600EFVphrKgfiWKAWG9zJs5MBuskH74x9pnxtHSmERdXjSUYGTLU
 ILP8qV+uM7amINTT0Pkcuo6r5naipuJnFftjcvKP9VuDv4E0See5HRp9QKTXKGDE
 4F+UBimIU7IV/TQZrx+6Wjb5KyBbh/RamvtahhRj/K5rz5HDyJjsnuAMHnBnOgyB
 QZ6OdA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhdavk63d-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 18:15:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c38129a433so604507085a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 10:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767809713; x=1768414513;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/G9oYIZxPHvtNlgDHuyoJcBPsfPtNnxLcd1dUJtcS+o=;
 b=R0v8MsTXreU9wmk0V8ePrBTwE6yhpNsDdrXdsQg6+/zeQMFLqTjzuI1V+pWFNPeEvr
 mFX1lYrUHYxGgEjPvapHR9Y8Ay03rJWnQrTye4EfLQevO0YZ1vFOlfThWOX8AsrGetBg
 oLfjRVtH/kVKVnxXN5B4LunyXk0gk18K5uAQHsoZJvKl+kUsw7kC53Mtd7eI5BNO6LDr
 ZOpHpHTwLn5dIS9k7T1zAxRsM5qJ0nkTe6j8Lo36KE2jelBc/D7ij2In1cLPssbrtP8F
 6kHqpibsCiAyiB7yYfklyK0n3MK5iBk5ZIdwS3CxaNRGfbHcQgIaJZ1mO52r7O8ZF/sd
 cP9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767809713; x=1768414513;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/G9oYIZxPHvtNlgDHuyoJcBPsfPtNnxLcd1dUJtcS+o=;
 b=hbzQDDcBXtu1JGK58ki68bMtmLgd0zV/1qYilocSk52TwupExAxAxteJXiDhkTYlQB
 5jG6j7fJFNtfOeF+mIBugh8OPd7Y5gB9hTEPDRHZR8TnoGBZUzlhnZYiry68OvHmgrMq
 C9YX5EPqSVHcSt/CJyzPQHdrG/4TwLXyFaBquHUklvBpaRVxAXeAyhATXEsHKD1VcCyU
 Bw9Q9Gm1CmaecVS28bcQczF8k8pXKFRxeGYB090ixw4KuQDUIiwy5Q4lUfkwN5ExnH92
 xFCHRkMNTOgUbEagSttQBGM/xbLu4CHsjuozVKQCtIsAQIaslLPza/ArkrIPeXtlAFSM
 C1ew==
X-Gm-Message-State: AOJu0YzE3TZnp9YSxNFNS6eOsuB+nUkQJlZ7JxxhEz4LcFToSOH92efn
 +p2ViAaeAoCLQMoUdD9jJ1B7COOsxjqikzcTFNJJH5BsCDwttnhQTTcHtvIKkgudoARABNOATU/
 3OdsCYRBUSbmanl3yp7o/kyn5gCfLibBk9RoqF79P+J6pOFP3b8mvHapV57xchFt2WG30RN8=
X-Gm-Gg: AY/fxX4pUXjVtq4H6dbWiQEQjlnGSY31y+dyVcXdf22pzdtQloSrDafvuVDh7f9Wtf4
 5QvpFwYi7GUwuM6CNlrrFX3jNX+g++/gYKOkqdaicGp/P2WSMMEJorpYZrotKW8i3tXND1McxKy
 8OcsYY77sUiySUTgoKtEernLvNxphynk3eBiuLPjF3EI8u2Gb5PUQueJZbxezlccLvNJphe/NVI
 SLju5QI09aZrfbzTRCq6F4cVHQp93bzA0QJXjgdqTQckmO7YKwDgid4+74ftzlL/bJ8tw3rxX5G
 dB2XdN3HVAPUKNffbDUjyT6cuxk5rBie4OZqH/h3ddYrzb8zIKUWD+44Q0FSFW373NuzVw76kbb
 DVvBG57eBn4fhMWSMNUYCWyvWR3WScDmck6knv39tjciBrIib1fulw6a8TF921mpoNrlNnXq2Qf
 0Bb+zMc9jas2+bz7CJOjaGEbQ=
X-Received: by 2002:a05:620a:40d4:b0:8c0:f13e:42ee with SMTP id
 af79cd13be357-8c389420351mr442724585a.88.1767809712399; 
 Wed, 07 Jan 2026 10:15:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHBRowqaOMG1FOaqGi9pLMNYxVafY2/thMkhgmNvOZZ083Yq6iefukoR+kl3+0wFUVHPYuSVg==
X-Received: by 2002:a05:620a:40d4:b0:8c0:f13e:42ee with SMTP id
 af79cd13be357-8c389420351mr442710385a.88.1767809711036; 
 Wed, 07 Jan 2026 10:15:11 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b65d6988asm1436884e87.80.2026.01.07.10.15.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 10:15:10 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 20:15:02 +0200
Subject: [PATCH v4 05/10] drm/bridge: refactor HDMI InfoFrame callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-limit-infoframes-2-v4-5-213d0d3bd490@oss.qualcomm.com>
References: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
In-Reply-To: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=59639;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=rrAYuYRkoLgiZDcEXYJBgQ4P9j2sq4poijx+pmGceSA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXqKkEZbNZ/Br4hx1XBX2GgPBWTb5SY6twy3gh
 XbZk6d6I9KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaV6ipAAKCRCLPIo+Aiko
 1VwMB/9sl/uLZB5vpOyqv9+DWDFFLjZoLVZME2yljS7sx0rinb4UEdksU9xR3QKb/D2OcsS9g5e
 GlH/bvxyFUj9cfGEtSJOW8udZAlgl9QU+pC6ZjeBmzlYrkvpFGYk2lSdt3ILbSY+Y2PPLLL5PTH
 cCsCKCumyB4sIoDVBdxubiGMo/Qh8n1AYm7RDS/8x4VL4TrYIcd5hhiVSzONg8egGqEWo0r0T/T
 usq8dVMwmN47s0YAP5yDVi+irL2PMe/PKZDwTNJrDuCl3FELqpNcVuzqvlY3GKTGcGyil1LfIJx
 3yW1Gz9Oktxu3vnScRM1iRcppsEpdL5xHbEThO42FyWn+Z3R
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE0NCBTYWx0ZWRfXwX8iot1SnriL
 RLse4AGBaUnDNqsL/42LyJMnlk8NWMB5erDfOgf7mOjTu46/GjBRD3O9dyqe+4VEsF19x/q68ET
 ba7bpMmnP3QTqP+O3iUz5uzVA/0eNptrvDLO5KG8BtoIyHcqtsk2dfyrWoOsIPQ2hJeWCul3+UN
 HqxK2oUw7ePDNzk2jwEHY5xzUYrf7w0Y1OU0ASP0//5wlJEmkek34AfEM6riJr4XLjM0WboEu76
 lcKmXHT2Oz02Xm7Ov76X2KkF5nAHcHJsIVpzpJxWuSfV1uqe32xI2CHF0Cm6blWkENJHKGAX0vo
 zN2nsBjxdoN2VuqrCs5q+55C20zuRIq2kBLP0hO0Vn6Wj2D7Ul0QeyOEVz6FcTnaFMzWmbPHfAm
 BuA73xXex4UKOTYIBKy84YoD7uPluJATgitog0D9XQHYvxHJQ6ms2pmhLycLAs67W17SD/Qli0f
 +cBZGrztCUXKocvQVGA==
X-Proofpoint-ORIG-GUID: JQAXSRFvWXYYgQMjVbtdwDhodt0JpoWA
X-Authority-Analysis: v=2.4 cv=comWUl4i c=1 sm=1 tr=0 ts=695ea2b1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GAiaypzmODBVVc3kIZ8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: JQAXSRFvWXYYgQMjVbtdwDhodt0JpoWA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070144
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

Having only a single set of callbacks, hdmi_clear_infoframe and
hdmi_write_infoframe, bridge drivers don't have an easy way to signal to
the DRM framework, which InfoFrames are actually supported by the
hardware and by the driver and which are not. Also, it makes it
extremely easy for HDMI bridge drivers to skip implementing the
seemingly required InfoFrames (e.g. HDMI VSI). Last, but not least,
those callbacks take a single 'type' parameter, which makes it
impossible to implement support for multiple VSIs (which will be
required once we start working on HDMI Forum VSI).

Split the callbacks into a per-InfoFrame-kind pairs, letting the bridge
drivers actually signal supported features. The implementation follows
the overall drm_bridge design, where the bridge has a single
drm_bridge_funcs implementation and signals, which functions are to be
called using the drm_bridge->ops flags.

The AVI and HDMI VSI are assumed to be required for a normal HDMI
operation (with the drivers getting a drm_warn_once() stub
implementation if one is missing). The Audio InfoFrame is handled by the
existing DRM_BRIDGE_OP_HDMI_AUDIO, while the SPD and HDR DRM InfoFrames
got new drm_bridge_ops values.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c   | 180 +++++++++++++----------
 drivers/gpu/drm/bridge/inno-hdmi.c             |  41 +++---
 drivers/gpu/drm/bridge/ite-it6263.c            |  95 ++++++------
 drivers/gpu/drm/bridge/lontium-lt9611.c        | 143 ++++++++++--------
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c   | 110 +++++++++-----
 drivers/gpu/drm/display/drm_bridge_connector.c |  70 ++++++++-
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c     |   8 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c         | 110 +++++++-------
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c         | 195 +++++++++++++------------
 drivers/gpu/drm/rockchip/rk3066_hdmi.c         |  47 +++---
 include/drm/drm_bridge.h                       | 127 ++++++++++++++--
 11 files changed, 705 insertions(+), 421 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index b9be86541307..1050bb62280b 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -887,88 +887,111 @@ static const struct drm_edid *adv7511_bridge_edid_read(struct drm_bridge *bridge
 	return adv7511_edid_read(adv, connector);
 }
 
-static int adv7511_bridge_hdmi_clear_infoframe(struct drm_bridge *bridge,
-					       enum hdmi_infoframe_type type)
+static int adv7511_bridge_hdmi_clear_audio_infoframe(struct drm_bridge *bridge)
 {
 	struct adv7511 *adv7511 = bridge_to_adv7511(bridge);
 
-	switch (type) {
-	case HDMI_INFOFRAME_TYPE_AUDIO:
-		adv7511_packet_disable(adv7511, ADV7511_PACKET_ENABLE_AUDIO_INFOFRAME);
-		break;
-	case HDMI_INFOFRAME_TYPE_AVI:
-		adv7511_packet_disable(adv7511, ADV7511_PACKET_ENABLE_AVI_INFOFRAME);
-		break;
-	case HDMI_INFOFRAME_TYPE_SPD:
-		adv7511_packet_disable(adv7511, ADV7511_PACKET_ENABLE_SPD);
-		break;
-	case HDMI_INFOFRAME_TYPE_VENDOR:
-		adv7511_packet_disable(adv7511, ADV7511_PACKET_ENABLE_SPARE1);
-		break;
-	default:
-		drm_dbg_driver(adv7511->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
-		break;
-	}
+	adv7511_packet_disable(adv7511, ADV7511_PACKET_ENABLE_AUDIO_INFOFRAME);
 
 	return 0;
 }
 
-static int adv7511_bridge_hdmi_write_infoframe(struct drm_bridge *bridge,
-					       enum hdmi_infoframe_type type,
-					       const u8 *buffer, size_t len)
+static int adv7511_bridge_hdmi_clear_avi_infoframe(struct drm_bridge *bridge)
 {
 	struct adv7511 *adv7511 = bridge_to_adv7511(bridge);
 
-	switch (type) {
-	case HDMI_INFOFRAME_TYPE_AUDIO:
-		/* send current Audio infoframe values while updating */
-		regmap_update_bits(adv7511->regmap, ADV7511_REG_INFOFRAME_UPDATE,
-				   BIT(5), BIT(5));
-
-		/* The Audio infoframe id is not configurable */
-		regmap_bulk_write(adv7511->regmap, ADV7511_REG_AUDIO_INFOFRAME_VERSION,
-				  buffer + 1, len - 1);
-
-		/* use Audio infoframe updated info */
-		regmap_update_bits(adv7511->regmap, ADV7511_REG_INFOFRAME_UPDATE,
-				   BIT(5), 0);
-
-		adv7511_packet_enable(adv7511, ADV7511_PACKET_ENABLE_AUDIO_INFOFRAME);
-		break;
-	case HDMI_INFOFRAME_TYPE_AVI:
-		/* send current AVI infoframe values while updating */
-		regmap_update_bits(adv7511->regmap, ADV7511_REG_INFOFRAME_UPDATE,
-				   BIT(6), BIT(6));
-
-		/* The AVI infoframe id is not configurable */
-		regmap_bulk_write(adv7511->regmap, ADV7511_REG_AVI_INFOFRAME_VERSION,
-				  buffer + 1, len - 1);
-
-		regmap_write(adv7511->regmap, ADV7511_REG_AUDIO_INFOFRAME_LENGTH, 0x2);
-		regmap_write(adv7511->regmap, ADV7511_REG_AUDIO_INFOFRAME(1), 0x1);
-
-		/* use AVI infoframe updated info */
-		regmap_update_bits(adv7511->regmap, ADV7511_REG_INFOFRAME_UPDATE,
-				   BIT(6), 0);
-
-		adv7511_packet_enable(adv7511, ADV7511_PACKET_ENABLE_AVI_INFOFRAME);
-		break;
-	case HDMI_INFOFRAME_TYPE_SPD:
-		adv7511_packet_disable(adv7511, ADV7511_PACKET_ENABLE_SPD);
-		regmap_bulk_write(adv7511->regmap_packet, ADV7511_PACKET_SPD(0),
-				  buffer, len);
-		adv7511_packet_enable(adv7511, ADV7511_PACKET_ENABLE_SPD);
-		break;
-	case HDMI_INFOFRAME_TYPE_VENDOR:
-		adv7511_packet_disable(adv7511, ADV7511_PACKET_ENABLE_SPARE1);
-		regmap_bulk_write(adv7511->regmap_packet, ADV7511_PACKET_SPARE1(0),
-				  buffer, len);
-		adv7511_packet_enable(adv7511, ADV7511_PACKET_ENABLE_SPARE1);
-		break;
-	default:
-		drm_dbg_driver(adv7511->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
-		break;
-	}
+	adv7511_packet_disable(adv7511, ADV7511_PACKET_ENABLE_AVI_INFOFRAME);
+
+	return 0;
+}
+
+static int adv7511_bridge_hdmi_clear_spd_infoframe(struct drm_bridge *bridge)
+{
+	struct adv7511 *adv7511 = bridge_to_adv7511(bridge);
+
+	adv7511_packet_disable(adv7511, ADV7511_PACKET_ENABLE_SPD);
+
+	return 0;
+}
+
+static int adv7511_bridge_hdmi_clear_hdmi_infoframe(struct drm_bridge *bridge)
+{
+	struct adv7511 *adv7511 = bridge_to_adv7511(bridge);
+
+	adv7511_packet_disable(adv7511, ADV7511_PACKET_ENABLE_SPARE1);
+
+	return 0;
+}
+
+static int adv7511_bridge_hdmi_write_audio_infoframe(struct drm_bridge *bridge,
+						     const u8 *buffer, size_t len)
+{
+	struct adv7511 *adv7511 = bridge_to_adv7511(bridge);
+
+	/* send current Audio infoframe values while updating */
+	regmap_update_bits(adv7511->regmap, ADV7511_REG_INFOFRAME_UPDATE,
+			   BIT(5), BIT(5));
+
+	/* The Audio infoframe id is not configurable */
+	regmap_bulk_write(adv7511->regmap, ADV7511_REG_AUDIO_INFOFRAME_VERSION,
+			  buffer + 1, len - 1);
+
+	/* use Audio infoframe updated info */
+	regmap_update_bits(adv7511->regmap, ADV7511_REG_INFOFRAME_UPDATE,
+			   BIT(5), 0);
+
+	adv7511_packet_enable(adv7511, ADV7511_PACKET_ENABLE_AUDIO_INFOFRAME);
+
+	return 0;
+}
+
+static int adv7511_bridge_hdmi_write_avi_infoframe(struct drm_bridge *bridge,
+						   const u8 *buffer, size_t len)
+{
+	struct adv7511 *adv7511 = bridge_to_adv7511(bridge);
+
+	/* send current AVI infoframe values while updating */
+	regmap_update_bits(adv7511->regmap, ADV7511_REG_INFOFRAME_UPDATE,
+			   BIT(6), BIT(6));
+
+	/* The AVI infoframe id is not configurable */
+	regmap_bulk_write(adv7511->regmap, ADV7511_REG_AVI_INFOFRAME_VERSION,
+			  buffer + 1, len - 1);
+
+	regmap_write(adv7511->regmap, ADV7511_REG_AUDIO_INFOFRAME_LENGTH, 0x2);
+	regmap_write(adv7511->regmap, ADV7511_REG_AUDIO_INFOFRAME(1), 0x1);
+
+	/* use AVI infoframe updated info */
+	regmap_update_bits(adv7511->regmap, ADV7511_REG_INFOFRAME_UPDATE,
+			   BIT(6), 0);
+
+	adv7511_packet_enable(adv7511, ADV7511_PACKET_ENABLE_AVI_INFOFRAME);
+
+	return 0;
+}
+
+static int adv7511_bridge_hdmi_write_spd_infoframe(struct drm_bridge *bridge,
+						   const u8 *buffer, size_t len)
+{
+	struct adv7511 *adv7511 = bridge_to_adv7511(bridge);
+
+	adv7511_packet_disable(adv7511, ADV7511_PACKET_ENABLE_SPD);
+	regmap_bulk_write(adv7511->regmap_packet, ADV7511_PACKET_SPD(0),
+			  buffer, len);
+	adv7511_packet_enable(adv7511, ADV7511_PACKET_ENABLE_SPD);
+
+	return 0;
+}
+
+static int adv7511_bridge_hdmi_write_hdmi_infoframe(struct drm_bridge *bridge,
+						    const u8 *buffer, size_t len)
+{
+	struct adv7511 *adv7511 = bridge_to_adv7511(bridge);
+
+	adv7511_packet_disable(adv7511, ADV7511_PACKET_ENABLE_SPARE1);
+	regmap_bulk_write(adv7511->regmap_packet, ADV7511_PACKET_SPARE1(0),
+			  buffer, len);
+	adv7511_packet_enable(adv7511, ADV7511_PACKET_ENABLE_SPARE1);
 
 	return 0;
 }
@@ -986,8 +1009,14 @@ static const struct drm_bridge_funcs adv7511_bridge_funcs = {
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 
 	.hdmi_tmds_char_rate_valid = adv7511_bridge_hdmi_tmds_char_rate_valid,
-	.hdmi_clear_infoframe = adv7511_bridge_hdmi_clear_infoframe,
-	.hdmi_write_infoframe = adv7511_bridge_hdmi_write_infoframe,
+	.hdmi_clear_audio_infoframe = adv7511_bridge_hdmi_clear_audio_infoframe,
+	.hdmi_write_audio_infoframe = adv7511_bridge_hdmi_write_audio_infoframe,
+	.hdmi_clear_avi_infoframe = adv7511_bridge_hdmi_clear_avi_infoframe,
+	.hdmi_write_avi_infoframe = adv7511_bridge_hdmi_write_avi_infoframe,
+	.hdmi_clear_spd_infoframe = adv7511_bridge_hdmi_clear_spd_infoframe,
+	.hdmi_write_spd_infoframe = adv7511_bridge_hdmi_write_spd_infoframe,
+	.hdmi_clear_hdmi_infoframe = adv7511_bridge_hdmi_clear_hdmi_infoframe,
+	.hdmi_write_hdmi_infoframe = adv7511_bridge_hdmi_write_hdmi_infoframe,
 
 	.hdmi_audio_startup = adv7511_hdmi_audio_startup,
 	.hdmi_audio_prepare = adv7511_hdmi_audio_prepare,
@@ -1322,7 +1351,8 @@ static int adv7511_probe(struct i2c_client *i2c)
 
 	adv7511->bridge.ops = DRM_BRIDGE_OP_DETECT |
 		DRM_BRIDGE_OP_EDID |
-		DRM_BRIDGE_OP_HDMI;
+		DRM_BRIDGE_OP_HDMI |
+		DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME;
 	if (adv7511->i2c_main->irq)
 		adv7511->bridge.ops |= DRM_BRIDGE_OP_HPD;
 
diff --git a/drivers/gpu/drm/bridge/inno-hdmi.c b/drivers/gpu/drm/bridge/inno-hdmi.c
index ab4572eb8395..a26b99b101c4 100644
--- a/drivers/gpu/drm/bridge/inno-hdmi.c
+++ b/drivers/gpu/drm/bridge/inno-hdmi.c
@@ -584,34 +584,22 @@ static void inno_hdmi_init_hw(struct inno_hdmi *hdmi)
 	hdmi_modb(hdmi, HDMI_STATUS, m_MASK_INT_HOTPLUG, v_MASK_INT_HOTPLUG(1));
 }
 
-static int inno_hdmi_bridge_clear_infoframe(struct drm_bridge *bridge,
-					    enum hdmi_infoframe_type type)
+static int inno_hdmi_bridge_clear_avi_infoframe(struct drm_bridge *bridge)
 {
 	struct inno_hdmi *hdmi = bridge_to_inno_hdmi(bridge);
 
-	if (type != HDMI_INFOFRAME_TYPE_AVI) {
-		drm_err(bridge->dev, "Unsupported infoframe type: %u\n", type);
-		return 0;
-	}
-
 	hdmi_writeb(hdmi, HDMI_CONTROL_PACKET_BUF_INDEX, INFOFRAME_AVI);
 
 	return 0;
 }
 
-static int inno_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
-					    enum hdmi_infoframe_type type,
-					    const u8 *buffer, size_t len)
+static int inno_hdmi_bridge_write_avi_infoframe(struct drm_bridge *bridge,
+						const u8 *buffer, size_t len)
 {
 	struct inno_hdmi *hdmi = bridge_to_inno_hdmi(bridge);
 	ssize_t i;
 
-	if (type != HDMI_INFOFRAME_TYPE_AVI) {
-		drm_err(bridge->dev, "Unsupported infoframe type: %u\n", type);
-		return 0;
-	}
-
-	inno_hdmi_bridge_clear_infoframe(bridge, type);
+	inno_hdmi_bridge_clear_avi_infoframe(bridge);
 
 	for (i = 0; i < len; i++)
 		hdmi_writeb(hdmi, HDMI_CONTROL_PACKET_ADDR + i, buffer[i]);
@@ -619,6 +607,21 @@ static int inno_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
 	return 0;
 }
 
+static int inno_hdmi_bridge_clear_hdmi_infoframe(struct drm_bridge *bridge)
+{
+	drm_warn_once(bridge->encoder->dev, "HDMI VSI not implemented\n");
+
+	return 0;
+}
+
+static int inno_hdmi_bridge_write_hdmi_infoframe(struct drm_bridge *bridge,
+						 const u8 *buffer, size_t len)
+{
+	drm_warn_once(bridge->encoder->dev, "HDMI VSI not implemented\n");
+
+	return 0;
+}
+
 static int inno_hdmi_config_video_csc(struct inno_hdmi *hdmi,
 				      struct drm_connector *connector,
 				      struct drm_display_mode *mode)
@@ -883,8 +886,10 @@ static const struct drm_bridge_funcs inno_hdmi_bridge_funcs = {
 	.atomic_disable = inno_hdmi_bridge_atomic_disable,
 	.detect = inno_hdmi_bridge_detect,
 	.edid_read = inno_hdmi_bridge_edid_read,
-	.hdmi_clear_infoframe = inno_hdmi_bridge_clear_infoframe,
-	.hdmi_write_infoframe = inno_hdmi_bridge_write_infoframe,
+	.hdmi_clear_avi_infoframe = inno_hdmi_bridge_clear_avi_infoframe,
+	.hdmi_write_avi_infoframe = inno_hdmi_bridge_write_avi_infoframe,
+	.hdmi_clear_hdmi_infoframe = inno_hdmi_bridge_clear_hdmi_infoframe,
+	.hdmi_write_hdmi_infoframe = inno_hdmi_bridge_write_hdmi_infoframe,
 	.mode_valid = inno_hdmi_bridge_mode_valid,
 };
 
diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
index 2eb8fba7016c..3991fb76143c 100644
--- a/drivers/gpu/drm/bridge/ite-it6263.c
+++ b/drivers/gpu/drm/bridge/ite-it6263.c
@@ -759,61 +759,62 @@ it6263_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge,
 	return MODE_OK;
 }
 
-static int it6263_hdmi_clear_infoframe(struct drm_bridge *bridge,
-				       enum hdmi_infoframe_type type)
+static int it6263_hdmi_clear_avi_infoframe(struct drm_bridge *bridge)
 {
 	struct it6263 *it = bridge_to_it6263(bridge);
 
-	switch (type) {
-	case HDMI_INFOFRAME_TYPE_AVI:
-		regmap_write(it->hdmi_regmap, HDMI_REG_AVI_INFOFRM_CTRL, 0);
-		break;
-	case HDMI_INFOFRAME_TYPE_VENDOR:
-		regmap_write(it->hdmi_regmap, HDMI_REG_PKT_NULL_CTRL, 0);
-		break;
-	default:
-		dev_dbg(it->dev, "unsupported HDMI infoframe 0x%x\n", type);
-	}
+	regmap_write(it->hdmi_regmap, HDMI_REG_AVI_INFOFRM_CTRL, 0);
+
+	return 0;
+}
+
+static int it6263_hdmi_clear_hdmi_infoframe(struct drm_bridge *bridge)
+{
+	struct it6263 *it = bridge_to_it6263(bridge);
+
+	regmap_write(it->hdmi_regmap, HDMI_REG_PKT_NULL_CTRL, 0);
 
 	return 0;
 }
 
-static int it6263_hdmi_write_infoframe(struct drm_bridge *bridge,
-				       enum hdmi_infoframe_type type,
-				       const u8 *buffer, size_t len)
+static int it6263_hdmi_write_avi_infoframe(struct drm_bridge *bridge,
+					   const u8 *buffer, size_t len)
 {
 	struct it6263 *it = bridge_to_it6263(bridge);
 	struct regmap *regmap = it->hdmi_regmap;
 
-	switch (type) {
-	case HDMI_INFOFRAME_TYPE_AVI:
-		/* write the first AVI infoframe data byte chunk(DB1-DB5) */
-		regmap_bulk_write(regmap, HDMI_REG_AVI_DB1,
-				  &buffer[HDMI_INFOFRAME_HEADER_SIZE],
-				  HDMI_AVI_DB_CHUNK1_SIZE);
-
-		/* write the second AVI infoframe data byte chunk(DB6-DB13) */
-		regmap_bulk_write(regmap, HDMI_REG_AVI_DB6,
-				  &buffer[HDMI_INFOFRAME_HEADER_SIZE +
-					  HDMI_AVI_DB_CHUNK1_SIZE],
-				  HDMI_AVI_DB_CHUNK2_SIZE);
-
-		/* write checksum */
-		regmap_write(regmap, HDMI_REG_AVI_CSUM, buffer[3]);
-
-		regmap_write(regmap, HDMI_REG_AVI_INFOFRM_CTRL,
-			     ENABLE_PKT | REPEAT_PKT);
-		break;
-	case HDMI_INFOFRAME_TYPE_VENDOR:
-		/* write header and payload */
-		regmap_bulk_write(regmap, HDMI_REG_PKT_HB(0), buffer, len);
-
-		regmap_write(regmap, HDMI_REG_PKT_NULL_CTRL,
-			     ENABLE_PKT | REPEAT_PKT);
-		break;
-	default:
-		dev_dbg(it->dev, "unsupported HDMI infoframe 0x%x\n", type);
-	}
+	/* write the first AVI infoframe data byte chunk(DB1-DB5) */
+	regmap_bulk_write(regmap, HDMI_REG_AVI_DB1,
+			  &buffer[HDMI_INFOFRAME_HEADER_SIZE],
+			  HDMI_AVI_DB_CHUNK1_SIZE);
+
+	/* write the second AVI infoframe data byte chunk(DB6-DB13) */
+	regmap_bulk_write(regmap, HDMI_REG_AVI_DB6,
+			  &buffer[HDMI_INFOFRAME_HEADER_SIZE +
+				  HDMI_AVI_DB_CHUNK1_SIZE],
+			  HDMI_AVI_DB_CHUNK2_SIZE);
+
+	/* write checksum */
+	regmap_write(regmap, HDMI_REG_AVI_CSUM, buffer[3]);
+
+	regmap_write(regmap, HDMI_REG_AVI_INFOFRM_CTRL,
+		     ENABLE_PKT | REPEAT_PKT);
+
+	return 0;
+}
+
+static int it6263_hdmi_write_hdmi_infoframe(struct drm_bridge *bridge,
+					    const u8 *buffer, size_t len)
+{
+	struct it6263 *it = bridge_to_it6263(bridge);
+	struct regmap *regmap = it->hdmi_regmap;
+
+	/* write header and payload */
+	regmap_bulk_write(regmap, HDMI_REG_PKT_HB(0), buffer, len);
+
+	regmap_write(regmap, HDMI_REG_PKT_NULL_CTRL,
+		     ENABLE_PKT | REPEAT_PKT);
+
 
 	return 0;
 }
@@ -830,8 +831,10 @@ static const struct drm_bridge_funcs it6263_bridge_funcs = {
 	.edid_read = it6263_bridge_edid_read,
 	.atomic_get_input_bus_fmts = it6263_bridge_atomic_get_input_bus_fmts,
 	.hdmi_tmds_char_rate_valid = it6263_hdmi_tmds_char_rate_valid,
-	.hdmi_clear_infoframe = it6263_hdmi_clear_infoframe,
-	.hdmi_write_infoframe = it6263_hdmi_write_infoframe,
+	.hdmi_clear_avi_infoframe = it6263_hdmi_clear_avi_infoframe,
+	.hdmi_write_avi_infoframe = it6263_hdmi_write_avi_infoframe,
+	.hdmi_clear_hdmi_infoframe = it6263_hdmi_clear_hdmi_infoframe,
+	.hdmi_write_hdmi_infoframe = it6263_hdmi_write_hdmi_infoframe,
 };
 
 static int it6263_probe(struct i2c_client *client)
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index a2d032ee4744..0628d8e737ab 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -843,84 +843,96 @@ lt9611_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 #define LT9611_INFOFRAME_AUDIO	0x02
 #define LT9611_INFOFRAME_AVI	0x08
 #define LT9611_INFOFRAME_SPD	0x10
-#define LT9611_INFOFRAME_VENDOR	0x20
+#define LT9611_INFOFRAME_HDMI	0x20
 
-static int lt9611_hdmi_clear_infoframe(struct drm_bridge *bridge,
-				       enum hdmi_infoframe_type type)
+static int lt9611_hdmi_clear_audio_infoframe(struct drm_bridge *bridge)
 {
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
-	unsigned int mask;
 
-	switch (type) {
-	case HDMI_INFOFRAME_TYPE_AUDIO:
-		mask = LT9611_INFOFRAME_AUDIO;
-		break;
+	regmap_update_bits(lt9611->regmap, 0x843d, LT9611_INFOFRAME_AUDIO, 0);
 
-	case HDMI_INFOFRAME_TYPE_AVI:
-		mask = LT9611_INFOFRAME_AVI;
-		break;
+	return 0;
+}
 
-	case HDMI_INFOFRAME_TYPE_SPD:
-		mask = LT9611_INFOFRAME_SPD;
-		break;
+static int lt9611_hdmi_clear_avi_infoframe(struct drm_bridge *bridge)
+{
+	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
 
-	case HDMI_INFOFRAME_TYPE_VENDOR:
-		mask = LT9611_INFOFRAME_VENDOR;
-		break;
+	regmap_update_bits(lt9611->regmap, 0x843d, LT9611_INFOFRAME_AVI, 0);
 
-	default:
-		drm_dbg_driver(lt9611->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
-		mask = 0;
-		break;
-	}
+	return 0;
+}
+
+static int lt9611_hdmi_clear_spd_infoframe(struct drm_bridge *bridge)
+{
+	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
 
-	if (mask)
-		regmap_update_bits(lt9611->regmap, 0x843d, mask, 0);
+	regmap_update_bits(lt9611->regmap, 0x843d, LT9611_INFOFRAME_SPD, 0);
 
 	return 0;
 }
 
-static int lt9611_hdmi_write_infoframe(struct drm_bridge *bridge,
-				       enum hdmi_infoframe_type type,
-				       const u8 *buffer, size_t len)
+static int lt9611_hdmi_clear_hdmi_infoframe(struct drm_bridge *bridge)
+{
+	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
+
+	regmap_update_bits(lt9611->regmap, 0x843d, LT9611_INFOFRAME_HDMI, 0);
+
+	return 0;
+}
+
+static int lt9611_hdmi_write_audio_infoframe(struct drm_bridge *bridge,
+					     const u8 *buffer, size_t len)
 {
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
-	unsigned int mask, addr;
 	int i;
 
-	switch (type) {
-	case HDMI_INFOFRAME_TYPE_AUDIO:
-		mask = LT9611_INFOFRAME_AUDIO;
-		addr = 0x84b2;
-		break;
-
-	case HDMI_INFOFRAME_TYPE_AVI:
-		mask = LT9611_INFOFRAME_AVI;
-		addr = 0x8440;
-		break;
-
-	case HDMI_INFOFRAME_TYPE_SPD:
-		mask = LT9611_INFOFRAME_SPD;
-		addr = 0x8493;
-		break;
-
-	case HDMI_INFOFRAME_TYPE_VENDOR:
-		mask = LT9611_INFOFRAME_VENDOR;
-		addr = 0x8474;
-		break;
-
-	default:
-		drm_dbg_driver(lt9611->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
-		mask = 0;
-		break;
-	}
+	for (i = 0; i < len; i++)
+		regmap_write(lt9611->regmap, 0x84b2 + i, buffer[i]);
 
-	if (mask) {
-		for (i = 0; i < len; i++)
-			regmap_write(lt9611->regmap, addr + i, buffer[i]);
+	regmap_update_bits(lt9611->regmap, 0x843d, LT9611_INFOFRAME_AUDIO, LT9611_INFOFRAME_AUDIO);
 
-		regmap_update_bits(lt9611->regmap, 0x843d, mask, mask);
-	}
+	return 0;
+}
+
+static int lt9611_hdmi_write_avi_infoframe(struct drm_bridge *bridge,
+					   const u8 *buffer, size_t len)
+{
+	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
+	int i;
+
+	for (i = 0; i < len; i++)
+		regmap_write(lt9611->regmap, 0x8440 + i, buffer[i]);
+
+	regmap_update_bits(lt9611->regmap, 0x843d, LT9611_INFOFRAME_AVI, LT9611_INFOFRAME_AVI);
+
+	return 0;
+}
+
+static int lt9611_hdmi_write_spd_infoframe(struct drm_bridge *bridge,
+					   const u8 *buffer, size_t len)
+{
+	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
+	int i;
+
+	for (i = 0; i < len; i++)
+		regmap_write(lt9611->regmap, 0x8493 + i, buffer[i]);
+
+	regmap_update_bits(lt9611->regmap, 0x843d, LT9611_INFOFRAME_SPD, LT9611_INFOFRAME_SPD);
+
+	return 0;
+}
+
+static int lt9611_hdmi_write_hdmi_infoframe(struct drm_bridge *bridge,
+					    const u8 *buffer, size_t len)
+{
+	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
+	int i;
+
+	for (i = 0; i < len; i++)
+		regmap_write(lt9611->regmap, 0x8474 + i, buffer[i]);
+
+	regmap_update_bits(lt9611->regmap, 0x843d, LT9611_INFOFRAME_HDMI, LT9611_INFOFRAME_HDMI);
 
 	return 0;
 }
@@ -1003,8 +1015,14 @@ static const struct drm_bridge_funcs lt9611_bridge_funcs = {
 	.atomic_get_input_bus_fmts = lt9611_atomic_get_input_bus_fmts,
 
 	.hdmi_tmds_char_rate_valid = lt9611_hdmi_tmds_char_rate_valid,
-	.hdmi_write_infoframe = lt9611_hdmi_write_infoframe,
-	.hdmi_clear_infoframe = lt9611_hdmi_clear_infoframe,
+	.hdmi_write_audio_infoframe = lt9611_hdmi_write_audio_infoframe,
+	.hdmi_clear_audio_infoframe = lt9611_hdmi_clear_audio_infoframe,
+	.hdmi_write_avi_infoframe = lt9611_hdmi_write_avi_infoframe,
+	.hdmi_clear_avi_infoframe = lt9611_hdmi_clear_avi_infoframe,
+	.hdmi_write_spd_infoframe = lt9611_hdmi_write_spd_infoframe,
+	.hdmi_clear_spd_infoframe = lt9611_hdmi_clear_spd_infoframe,
+	.hdmi_write_hdmi_infoframe = lt9611_hdmi_write_hdmi_infoframe,
+	.hdmi_clear_hdmi_infoframe = lt9611_hdmi_clear_hdmi_infoframe,
 
 	.hdmi_audio_startup = lt9611_hdmi_audio_startup,
 	.hdmi_audio_prepare = lt9611_hdmi_audio_prepare,
@@ -1132,7 +1150,8 @@ static int lt9611_probe(struct i2c_client *client)
 	lt9611->bridge.of_node = client->dev.of_node;
 	lt9611->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
 			     DRM_BRIDGE_OP_HPD | DRM_BRIDGE_OP_MODES |
-			     DRM_BRIDGE_OP_HDMI | DRM_BRIDGE_OP_HDMI_AUDIO;
+			     DRM_BRIDGE_OP_HDMI | DRM_BRIDGE_OP_HDMI_AUDIO |
+			     DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME;
 	lt9611->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	lt9611->bridge.vendor = "Lontium";
 	lt9611->bridge.product = "LT9611";
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index fe4c026280f0..f57307dd61c8 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -26,6 +26,7 @@
 #include <drm/drm_connector.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_modes.h>
+#include <drm/drm_print.h>
 
 #include <media/cec.h>
 
@@ -933,57 +934,85 @@ dw_hdmi_qp_bridge_tmds_char_rate_valid(const struct drm_bridge *bridge,
 	return MODE_OK;
 }
 
-static int dw_hdmi_qp_bridge_clear_infoframe(struct drm_bridge *bridge,
-					     enum hdmi_infoframe_type type)
+static int dw_hdmi_qp_bridge_clear_avi_infoframe(struct drm_bridge *bridge)
 {
 	struct dw_hdmi_qp *hdmi = bridge->driver_private;
 
-	switch (type) {
-	case HDMI_INFOFRAME_TYPE_AVI:
-		dw_hdmi_qp_mod(hdmi, 0, PKTSCHED_AVI_TX_EN | PKTSCHED_GCP_TX_EN,
-			       PKTSCHED_PKT_EN);
-		break;
+	dw_hdmi_qp_mod(hdmi, 0, PKTSCHED_AVI_TX_EN | PKTSCHED_GCP_TX_EN,
+		       PKTSCHED_PKT_EN);
 
-	case HDMI_INFOFRAME_TYPE_DRM:
-		dw_hdmi_qp_mod(hdmi, 0, PKTSCHED_DRMI_TX_EN, PKTSCHED_PKT_EN);
-		break;
+	return 0;
+}
 
-	case HDMI_INFOFRAME_TYPE_AUDIO:
-		dw_hdmi_qp_mod(hdmi, 0,
-			       PKTSCHED_ACR_TX_EN |
-			       PKTSCHED_AUDS_TX_EN |
-			       PKTSCHED_AUDI_TX_EN,
-			       PKTSCHED_PKT_EN);
-		break;
-	default:
-		dev_dbg(hdmi->dev, "Unsupported infoframe type %x\n", type);
-	}
+static int dw_hdmi_qp_bridge_clear_hdmi_infoframe(struct drm_bridge *bridge)
+{
+	/* FIXME: add support for this InfoFrame */
+
+	drm_warn_once(bridge->encoder->dev, "HDMI VSI not supported\n");
 
 	return 0;
 }
 
-static int dw_hdmi_qp_bridge_write_infoframe(struct drm_bridge *bridge,
-					     enum hdmi_infoframe_type type,
-					     const u8 *buffer, size_t len)
+static int dw_hdmi_qp_bridge_clear_hdr_drm_infoframe(struct drm_bridge *bridge)
 {
 	struct dw_hdmi_qp *hdmi = bridge->driver_private;
 
-	dw_hdmi_qp_bridge_clear_infoframe(bridge, type);
+	dw_hdmi_qp_mod(hdmi, 0, PKTSCHED_DRMI_TX_EN, PKTSCHED_PKT_EN);
 
-	switch (type) {
-	case HDMI_INFOFRAME_TYPE_AVI:
-		return dw_hdmi_qp_config_avi_infoframe(hdmi, buffer, len);
+	return 0;
+}
 
-	case HDMI_INFOFRAME_TYPE_DRM:
-		return dw_hdmi_qp_config_drm_infoframe(hdmi, buffer, len);
+static int dw_hdmi_qp_bridge_clear_audio_infoframe(struct drm_bridge *bridge)
+{
+	struct dw_hdmi_qp *hdmi = bridge->driver_private;
 
-	case HDMI_INFOFRAME_TYPE_AUDIO:
-		return dw_hdmi_qp_config_audio_infoframe(hdmi, buffer, len);
+	dw_hdmi_qp_mod(hdmi, 0,
+		       PKTSCHED_ACR_TX_EN |
+		       PKTSCHED_AUDS_TX_EN |
+		       PKTSCHED_AUDI_TX_EN,
+		       PKTSCHED_PKT_EN);
 
-	default:
-		dev_dbg(hdmi->dev, "Unsupported infoframe type %x\n", type);
-		return 0;
-	}
+	return 0;
+}
+
+static int dw_hdmi_qp_bridge_write_avi_infoframe(struct drm_bridge *bridge,
+						 const u8 *buffer, size_t len)
+{
+	struct dw_hdmi_qp *hdmi = bridge->driver_private;
+
+	dw_hdmi_qp_bridge_clear_avi_infoframe(bridge);
+
+	return dw_hdmi_qp_config_avi_infoframe(hdmi, buffer, len);
+}
+
+static int dw_hdmi_qp_bridge_write_hdmi_infoframe(struct drm_bridge *bridge,
+						  const u8 *buffer, size_t len)
+{
+	dw_hdmi_qp_bridge_clear_hdmi_infoframe(bridge);
+
+	/* FIXME: add support for the HDMI VSI */
+
+	return 0;
+}
+
+static int dw_hdmi_qp_bridge_write_hdr_drm_infoframe(struct drm_bridge *bridge,
+						     const u8 *buffer, size_t len)
+{
+	struct dw_hdmi_qp *hdmi = bridge->driver_private;
+
+	dw_hdmi_qp_bridge_clear_hdr_drm_infoframe(bridge);
+
+	return dw_hdmi_qp_config_drm_infoframe(hdmi, buffer, len);
+}
+
+static int dw_hdmi_qp_bridge_write_audio_infoframe(struct drm_bridge *bridge,
+						   const u8 *buffer, size_t len)
+{
+	struct dw_hdmi_qp *hdmi = bridge->driver_private;
+
+	dw_hdmi_qp_bridge_clear_audio_infoframe(bridge);
+
+	return dw_hdmi_qp_config_audio_infoframe(hdmi, buffer, len);
 }
 
 #ifdef CONFIG_DRM_DW_HDMI_QP_CEC
@@ -1168,8 +1197,14 @@ static const struct drm_bridge_funcs dw_hdmi_qp_bridge_funcs = {
 	.detect = dw_hdmi_qp_bridge_detect,
 	.edid_read = dw_hdmi_qp_bridge_edid_read,
 	.hdmi_tmds_char_rate_valid = dw_hdmi_qp_bridge_tmds_char_rate_valid,
-	.hdmi_clear_infoframe = dw_hdmi_qp_bridge_clear_infoframe,
-	.hdmi_write_infoframe = dw_hdmi_qp_bridge_write_infoframe,
+	.hdmi_clear_avi_infoframe = dw_hdmi_qp_bridge_clear_avi_infoframe,
+	.hdmi_write_avi_infoframe = dw_hdmi_qp_bridge_write_avi_infoframe,
+	.hdmi_clear_hdmi_infoframe = dw_hdmi_qp_bridge_clear_hdmi_infoframe,
+	.hdmi_write_hdmi_infoframe = dw_hdmi_qp_bridge_write_hdmi_infoframe,
+	.hdmi_clear_hdr_drm_infoframe = dw_hdmi_qp_bridge_clear_hdr_drm_infoframe,
+	.hdmi_write_hdr_drm_infoframe = dw_hdmi_qp_bridge_write_hdr_drm_infoframe,
+	.hdmi_clear_audio_infoframe = dw_hdmi_qp_bridge_clear_audio_infoframe,
+	.hdmi_write_audio_infoframe = dw_hdmi_qp_bridge_write_audio_infoframe,
 	.hdmi_audio_startup = dw_hdmi_qp_audio_enable,
 	.hdmi_audio_shutdown = dw_hdmi_qp_audio_disable,
 	.hdmi_audio_prepare = dw_hdmi_qp_audio_prepare,
@@ -1282,6 +1317,7 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
 			   DRM_BRIDGE_OP_EDID |
 			   DRM_BRIDGE_OP_HDMI |
 			   DRM_BRIDGE_OP_HDMI_AUDIO |
+			   DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME |
 			   DRM_BRIDGE_OP_HPD;
 	hdmi->bridge.of_node = pdev->dev.of_node;
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 57a0cceabd34..d38519e3923e 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -412,7 +412,30 @@ static int drm_bridge_connector_clear_infoframe(struct drm_connector *connector,
 	if (!bridge)
 		return -EINVAL;
 
-	return bridge->funcs->hdmi_clear_infoframe(bridge, type);
+	switch (type) {
+	case HDMI_INFOFRAME_TYPE_AVI:
+		/* required */
+		return bridge->funcs->hdmi_clear_avi_infoframe(bridge);
+	case HDMI_INFOFRAME_TYPE_VENDOR:
+		/* required */
+		return bridge->funcs->hdmi_clear_hdmi_infoframe(bridge);
+	case HDMI_INFOFRAME_TYPE_AUDIO:
+		if (bridge->ops & DRM_BRIDGE_OP_HDMI_AUDIO)
+			return bridge->funcs->hdmi_clear_audio_infoframe(bridge);
+		break;
+	case HDMI_INFOFRAME_TYPE_DRM:
+		if (bridge->ops & DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME)
+			return bridge->funcs->hdmi_clear_hdr_drm_infoframe(bridge);
+		break;
+	case HDMI_INFOFRAME_TYPE_SPD:
+		if (bridge->ops & DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME)
+			return bridge->funcs->hdmi_clear_spd_infoframe(bridge);
+		break;
+	}
+
+	drm_dbg_driver(connector->dev, "Unsupported HDMI InfoFrame %x\n", type);
+
+	return 0;
 }
 
 static int drm_bridge_connector_write_infoframe(struct drm_connector *connector,
@@ -427,7 +450,30 @@ static int drm_bridge_connector_write_infoframe(struct drm_connector *connector,
 	if (!bridge)
 		return -EINVAL;
 
-	return bridge->funcs->hdmi_write_infoframe(bridge, type, buffer, len);
+	switch (type) {
+	case HDMI_INFOFRAME_TYPE_AVI:
+		/* required */
+		return bridge->funcs->hdmi_write_avi_infoframe(bridge, buffer, len);
+	case HDMI_INFOFRAME_TYPE_VENDOR:
+		/* required */
+		return bridge->funcs->hdmi_write_hdmi_infoframe(bridge, buffer, len);
+	case HDMI_INFOFRAME_TYPE_AUDIO:
+		if (bridge->ops & DRM_BRIDGE_OP_HDMI_AUDIO)
+			return bridge->funcs->hdmi_write_audio_infoframe(bridge, buffer, len);
+		break;
+	case HDMI_INFOFRAME_TYPE_DRM:
+		if (bridge->ops & DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME)
+			return bridge->funcs->hdmi_write_hdr_drm_infoframe(bridge, buffer, len);
+		break;
+	case HDMI_INFOFRAME_TYPE_SPD:
+		if (bridge->ops & DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME)
+			return bridge->funcs->hdmi_write_spd_infoframe(bridge, buffer, len);
+		break;
+	}
+
+	drm_dbg_driver(connector->dev, "Unsupported HDMI InfoFrame %x\n", type);
+
+	return 0;
 }
 
 static const struct drm_edid *
@@ -709,8 +755,20 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		if (bridge->ops & DRM_BRIDGE_OP_HDMI) {
 			if (bridge_connector->bridge_hdmi)
 				return ERR_PTR(-EBUSY);
-			if (!bridge->funcs->hdmi_write_infoframe ||
-			    !bridge->funcs->hdmi_clear_infoframe)
+			if (!bridge->funcs->hdmi_write_avi_infoframe ||
+			    !bridge->funcs->hdmi_clear_avi_infoframe ||
+			    !bridge->funcs->hdmi_write_hdmi_infoframe ||
+			    !bridge->funcs->hdmi_clear_hdmi_infoframe)
+				return ERR_PTR(-EINVAL);
+
+			if (bridge->ops & DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME &&
+			    (!bridge->funcs->hdmi_write_hdr_drm_infoframe ||
+			     !bridge->funcs->hdmi_clear_hdr_drm_infoframe))
+				return ERR_PTR(-EINVAL);
+
+			if (bridge->ops & DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME &&
+			    (!bridge->funcs->hdmi_write_spd_infoframe ||
+			     !bridge->funcs->hdmi_clear_spd_infoframe))
 				return ERR_PTR(-EINVAL);
 
 			bridge_connector->bridge_hdmi = drm_bridge_get(bridge);
@@ -732,7 +790,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			    !bridge->hdmi_audio_spdif_playback)
 				return ERR_PTR(-EINVAL);
 
-			if (!bridge->funcs->hdmi_audio_prepare ||
+			if (!bridge->funcs->hdmi_write_audio_infoframe ||
+			    !bridge->funcs->hdmi_clear_audio_infoframe ||
+			    !bridge->funcs->hdmi_audio_prepare ||
 			    !bridge->funcs->hdmi_audio_shutdown)
 				return ERR_PTR(-EINVAL);
 
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
index e78eb0876f16..c599ba767093 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
@@ -433,9 +433,11 @@ struct mtk_hdmi *mtk_hdmi_common_probe(struct platform_device *pdev)
 	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
 			 | DRM_BRIDGE_OP_HPD;
 
-	if (ver_conf->bridge_funcs->hdmi_write_infoframe &&
-	    ver_conf->bridge_funcs->hdmi_clear_infoframe)
-		hdmi->bridge.ops |= DRM_BRIDGE_OP_HDMI;
+	/* Only v2 support OP_HDMI now and it we know that it also support SPD */
+	if (ver_conf->bridge_funcs->hdmi_write_avi_infoframe &&
+	    ver_conf->bridge_funcs->hdmi_clear_avi_infoframe)
+		hdmi->bridge.ops |= DRM_BRIDGE_OP_HDMI |
+				    DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME;
 
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	hdmi->bridge.ddc = hdmi->ddc_adpt;
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
index c272e1e74b7d..d0e4440b7491 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
@@ -145,8 +145,11 @@ static inline u32 mtk_hdmi_v2_format_hw_packet(const u8 *buffer, u8 len)
 	return val;
 }
 
-static void mtk_hdmi_v2_hw_write_audio_infoframe(struct mtk_hdmi *hdmi, const u8 *buffer)
+static int mtk_hdmi_v2_hdmi_write_audio_infoframe(struct drm_bridge *bridge,
+						  const u8 *buffer, size_t len)
 {
+	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
+
 	regmap_clear_bits(hdmi->regs, TOP_INFO_EN, AUD_EN | AUD_EN_WR);
 	regmap_clear_bits(hdmi->regs, TOP_INFO_RPT, AUD_RPT_EN);
 
@@ -158,10 +161,15 @@ static void mtk_hdmi_v2_hw_write_audio_infoframe(struct mtk_hdmi *hdmi, const u8
 
 	regmap_set_bits(hdmi->regs, TOP_INFO_RPT, AUD_RPT_EN);
 	regmap_set_bits(hdmi->regs, TOP_INFO_EN, AUD_EN | AUD_EN_WR);
+
+	return 0;
 }
 
-static void mtk_hdmi_v2_hw_write_avi_infoframe(struct mtk_hdmi *hdmi, const u8 *buffer)
+static int mtk_hdmi_v2_hdmi_write_avi_infoframe(struct drm_bridge *bridge,
+						const u8 *buffer, size_t len)
 {
+	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
+
 	regmap_clear_bits(hdmi->regs, TOP_INFO_EN, AVI_EN_WR | AVI_EN);
 	regmap_clear_bits(hdmi->regs, TOP_INFO_RPT, AVI_RPT_EN);
 
@@ -175,10 +183,15 @@ static void mtk_hdmi_v2_hw_write_avi_infoframe(struct mtk_hdmi *hdmi, const u8 *
 
 	regmap_set_bits(hdmi->regs, TOP_INFO_RPT, AVI_RPT_EN);
 	regmap_set_bits(hdmi->regs, TOP_INFO_EN, AVI_EN_WR | AVI_EN);
+
+	return 0;
 }
 
-static void mtk_hdmi_v2_hw_write_spd_infoframe(struct mtk_hdmi *hdmi, const u8 *buffer)
+static int mtk_hdmi_v2_hdmi_write_spd_infoframe(struct drm_bridge *bridge,
+						const u8 *buffer, size_t len)
 {
+	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
+
 	regmap_clear_bits(hdmi->regs, TOP_INFO_EN, SPD_EN_WR | SPD_EN);
 	regmap_clear_bits(hdmi->regs, TOP_INFO_RPT, SPD_RPT_EN);
 
@@ -194,10 +207,15 @@ static void mtk_hdmi_v2_hw_write_spd_infoframe(struct mtk_hdmi *hdmi, const u8 *
 
 	regmap_set_bits(hdmi->regs, TOP_INFO_EN, SPD_EN_WR | SPD_EN);
 	regmap_set_bits(hdmi->regs, TOP_INFO_RPT, SPD_RPT_EN);
+
+	return 0;
 }
 
-static void mtk_hdmi_v2_hw_write_vendor_infoframe(struct mtk_hdmi *hdmi, const u8 *buffer)
+static int mtk_hdmi_v2_hdmi_write_hdmi_infoframe(struct drm_bridge *bridge,
+						 const u8 *buffer, size_t len)
 {
+	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
+
 	regmap_clear_bits(hdmi->regs, TOP_INFO_EN, VSIF_EN_WR | VSIF_EN);
 	regmap_clear_bits(hdmi->regs, TOP_INFO_RPT, VSIF_RPT_EN);
 
@@ -213,6 +231,8 @@ static void mtk_hdmi_v2_hw_write_vendor_infoframe(struct mtk_hdmi *hdmi, const u
 
 	regmap_set_bits(hdmi->regs, TOP_INFO_EN, VSIF_EN_WR | VSIF_EN);
 	regmap_set_bits(hdmi->regs, TOP_INFO_RPT, VSIF_RPT_EN);
+
+	return 0;
 }
 
 static void mtk_hdmi_yuv420_downsampling(struct mtk_hdmi *hdmi, bool enable)
@@ -255,7 +275,7 @@ static int mtk_hdmi_v2_setup_audio_infoframe(struct mtk_hdmi *hdmi)
 	if (ret < 0)
 		return ret;
 
-	mtk_hdmi_v2_hw_write_audio_infoframe(hdmi, buffer);
+	mtk_hdmi_v2_hdmi_write_audio_infoframe(&hdmi->bridge, buffer, sizeof(buffer));
 
 	return 0;
 }
@@ -1132,60 +1152,42 @@ static int mtk_hdmi_v2_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge
 		return MODE_OK;
 }
 
-static int mtk_hdmi_v2_hdmi_clear_infoframe(struct drm_bridge *bridge,
-					    enum hdmi_infoframe_type type)
+static int mtk_hdmi_v2_hdmi_clear_audio_infoframe(struct drm_bridge *bridge)
 {
 	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
 
-	switch (type) {
-	case HDMI_INFOFRAME_TYPE_AUDIO:
-		regmap_clear_bits(hdmi->regs, TOP_INFO_EN, AUD_EN_WR | AUD_EN);
-		regmap_clear_bits(hdmi->regs, TOP_INFO_RPT, AUD_RPT_EN);
-		break;
-	case HDMI_INFOFRAME_TYPE_AVI:
-		regmap_clear_bits(hdmi->regs, TOP_INFO_EN, AVI_EN_WR | AVI_EN);
-		regmap_clear_bits(hdmi->regs, TOP_INFO_RPT, AVI_RPT_EN);
-		break;
-	case HDMI_INFOFRAME_TYPE_SPD:
-		regmap_clear_bits(hdmi->regs, TOP_INFO_EN, SPD_EN_WR | SPD_EN);
-		regmap_clear_bits(hdmi->regs, TOP_INFO_RPT, SPD_RPT_EN);
-		break;
-	case HDMI_INFOFRAME_TYPE_VENDOR:
-		regmap_clear_bits(hdmi->regs, TOP_INFO_EN, VSIF_EN_WR | VSIF_EN);
-		regmap_clear_bits(hdmi->regs, TOP_INFO_RPT, VSIF_RPT_EN);
-		break;
-	case HDMI_INFOFRAME_TYPE_DRM:
-	default:
-		break;
-	};
+	regmap_clear_bits(hdmi->regs, TOP_INFO_EN, AUD_EN_WR | AUD_EN);
+	regmap_clear_bits(hdmi->regs, TOP_INFO_RPT, AUD_RPT_EN);
 
 	return 0;
 }
 
-static int mtk_hdmi_v2_hdmi_write_infoframe(struct drm_bridge *bridge,
-					    enum hdmi_infoframe_type type,
-					    const u8 *buffer, size_t len)
+static int mtk_hdmi_v2_hdmi_clear_avi_infoframe(struct drm_bridge *bridge)
 {
 	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
 
-	switch (type) {
-	case HDMI_INFOFRAME_TYPE_AUDIO:
-		mtk_hdmi_v2_hw_write_audio_infoframe(hdmi, buffer);
-		break;
-	case HDMI_INFOFRAME_TYPE_AVI:
-		mtk_hdmi_v2_hw_write_avi_infoframe(hdmi, buffer);
-		break;
-	case HDMI_INFOFRAME_TYPE_SPD:
-		mtk_hdmi_v2_hw_write_spd_infoframe(hdmi, buffer);
-		break;
-	case HDMI_INFOFRAME_TYPE_VENDOR:
-		mtk_hdmi_v2_hw_write_vendor_infoframe(hdmi, buffer);
-		break;
-	case HDMI_INFOFRAME_TYPE_DRM:
-	default:
-		dev_err(hdmi->dev, "Unsupported HDMI infoframe type %u\n", type);
-		break;
-	};
+	regmap_clear_bits(hdmi->regs, TOP_INFO_EN, AVI_EN_WR | AVI_EN);
+	regmap_clear_bits(hdmi->regs, TOP_INFO_RPT, AVI_RPT_EN);
+
+	return 0;
+}
+
+static int mtk_hdmi_v2_hdmi_clear_spd_infoframe(struct drm_bridge *bridge)
+{
+	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
+
+	regmap_clear_bits(hdmi->regs, TOP_INFO_EN, SPD_EN_WR | SPD_EN);
+	regmap_clear_bits(hdmi->regs, TOP_INFO_RPT, SPD_RPT_EN);
+
+	return 0;
+}
+
+static int mtk_hdmi_v2_hdmi_clear_hdmi_infoframe(struct drm_bridge *bridge)
+{
+	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
+
+	regmap_clear_bits(hdmi->regs, TOP_INFO_EN, VSIF_EN_WR | VSIF_EN);
+	regmap_clear_bits(hdmi->regs, TOP_INFO_RPT, VSIF_RPT_EN);
 
 	return 0;
 }
@@ -1329,8 +1331,14 @@ static const struct drm_bridge_funcs mtk_v2_hdmi_bridge_funcs = {
 	.hpd_enable = mtk_hdmi_v2_hpd_enable,
 	.hpd_disable = mtk_hdmi_v2_hpd_disable,
 	.hdmi_tmds_char_rate_valid = mtk_hdmi_v2_hdmi_tmds_char_rate_valid,
-	.hdmi_clear_infoframe = mtk_hdmi_v2_hdmi_clear_infoframe,
-	.hdmi_write_infoframe = mtk_hdmi_v2_hdmi_write_infoframe,
+	.hdmi_clear_audio_infoframe = mtk_hdmi_v2_hdmi_clear_audio_infoframe,
+	.hdmi_write_audio_infoframe = mtk_hdmi_v2_hdmi_write_audio_infoframe,
+	.hdmi_clear_avi_infoframe = mtk_hdmi_v2_hdmi_clear_avi_infoframe,
+	.hdmi_write_avi_infoframe = mtk_hdmi_v2_hdmi_write_avi_infoframe,
+	.hdmi_clear_spd_infoframe = mtk_hdmi_v2_hdmi_clear_spd_infoframe,
+	.hdmi_write_spd_infoframe = mtk_hdmi_v2_hdmi_write_spd_infoframe,
+	.hdmi_clear_hdmi_infoframe = mtk_hdmi_v2_hdmi_clear_hdmi_infoframe,
+	.hdmi_write_hdmi_infoframe = mtk_hdmi_v2_hdmi_write_hdmi_infoframe,
 	.debugfs_init = mtk_hdmi_v2_debugfs_init,
 };
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 46fd58646d32..98cd490e7ab0 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -54,9 +54,80 @@ static void power_off(struct drm_bridge *bridge)
 #define SPD_IFRAME_LINE_NUMBER 1
 #define VENSPEC_IFRAME_LINE_NUMBER 3
 
-static int msm_hdmi_config_avi_infoframe(struct hdmi *hdmi,
-					 const u8 *buffer, size_t len)
+static int msm_hdmi_bridge_clear_avi_infoframe(struct drm_bridge *bridge)
 {
+	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
+	struct hdmi *hdmi = hdmi_bridge->hdmi;
+	u32 val;
+
+	val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL0);
+	val &= ~(HDMI_INFOFRAME_CTRL0_AVI_SEND |
+		 HDMI_INFOFRAME_CTRL0_AVI_CONT);
+	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL0, val);
+
+	val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL1);
+	val &= ~HDMI_INFOFRAME_CTRL1_AVI_INFO_LINE__MASK;
+	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
+
+	return 0;
+}
+
+static int msm_hdmi_bridge_clear_audio_infoframe(struct drm_bridge *bridge)
+{
+	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
+	struct hdmi *hdmi = hdmi_bridge->hdmi;
+	u32 val;
+
+	val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL0);
+	val &= ~(HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SEND |
+		 HDMI_INFOFRAME_CTRL0_AUDIO_INFO_CONT |
+		 HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SOURCE |
+		 HDMI_INFOFRAME_CTRL0_AUDIO_INFO_UPDATE);
+	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL0, val);
+
+	val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL1);
+	val &= ~HDMI_INFOFRAME_CTRL1_AUDIO_INFO_LINE__MASK;
+	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
+
+	return 0;
+}
+
+static int msm_hdmi_bridge_clear_spd_infoframe(struct drm_bridge *bridge)
+{
+	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
+	struct hdmi *hdmi = hdmi_bridge->hdmi;
+	u32 val;
+
+	val = hdmi_read(hdmi, REG_HDMI_GEN_PKT_CTRL);
+	val &= ~(HDMI_GEN_PKT_CTRL_GENERIC1_SEND |
+		 HDMI_GEN_PKT_CTRL_GENERIC1_CONT |
+		 HDMI_GEN_PKT_CTRL_GENERIC1_LINE__MASK);
+	hdmi_write(hdmi, REG_HDMI_GEN_PKT_CTRL, val);
+
+	return 0;
+}
+
+static int msm_hdmi_bridge_clear_hdmi_infoframe(struct drm_bridge *bridge)
+{
+	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
+	struct hdmi *hdmi = hdmi_bridge->hdmi;
+	u32 val;
+
+	val = hdmi_read(hdmi, REG_HDMI_GEN_PKT_CTRL);
+	val &= ~(HDMI_GEN_PKT_CTRL_GENERIC0_SEND |
+		 HDMI_GEN_PKT_CTRL_GENERIC0_CONT |
+		 HDMI_GEN_PKT_CTRL_GENERIC0_UPDATE |
+		 HDMI_GEN_PKT_CTRL_GENERIC0_LINE__MASK);
+	hdmi_write(hdmi, REG_HDMI_GEN_PKT_CTRL, val);
+
+	return 0;
+}
+
+static int msm_hdmi_bridge_write_avi_infoframe(struct drm_bridge *bridge,
+					       const u8 *buffer, size_t len)
+{
+	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
+	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	u32 buf[4] = {};
 	u32 val;
 	int i;
@@ -67,6 +138,8 @@ static int msm_hdmi_config_avi_infoframe(struct hdmi *hdmi,
 		return -EINVAL;
 	}
 
+	msm_hdmi_bridge_clear_avi_infoframe(bridge);
+
 	/*
 	 * the AVI_INFOx registers don't map exactly to how the AVI infoframes
 	 * are packed according to the spec. The checksum from the header is
@@ -93,9 +166,11 @@ static int msm_hdmi_config_avi_infoframe(struct hdmi *hdmi,
 	return 0;
 }
 
-static int msm_hdmi_config_audio_infoframe(struct hdmi *hdmi,
-					   const u8 *buffer, size_t len)
+static int msm_hdmi_bridge_write_audio_infoframe(struct drm_bridge *bridge,
+						 const u8 *buffer, size_t len)
 {
+	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
+	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	u32 val;
 
 	if (len != HDMI_INFOFRAME_SIZE(AUDIO)) {
@@ -104,6 +179,8 @@ static int msm_hdmi_config_audio_infoframe(struct hdmi *hdmi,
 		return -EINVAL;
 	}
 
+	msm_hdmi_bridge_clear_audio_infoframe(bridge);
+
 	hdmi_write(hdmi, REG_HDMI_AUDIO_INFO0,
 		   buffer[3] |
 		   buffer[4] << 8 |
@@ -126,9 +203,11 @@ static int msm_hdmi_config_audio_infoframe(struct hdmi *hdmi,
 	return 0;
 }
 
-static int msm_hdmi_config_spd_infoframe(struct hdmi *hdmi,
-					 const u8 *buffer, size_t len)
+static int msm_hdmi_bridge_write_spd_infoframe(struct drm_bridge *bridge,
+					       const u8 *buffer, size_t len)
 {
+	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
+	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	u32 buf[7] = {};
 	u32 val;
 	int i;
@@ -139,6 +218,8 @@ static int msm_hdmi_config_spd_infoframe(struct hdmi *hdmi,
 		return -EINVAL;
 	}
 
+	msm_hdmi_bridge_clear_spd_infoframe(bridge);
+
 	/* checksum gets written together with the body of the frame */
 	hdmi_write(hdmi, REG_HDMI_GENERIC1_HDR,
 		   buffer[0] |
@@ -159,9 +240,11 @@ static int msm_hdmi_config_spd_infoframe(struct hdmi *hdmi,
 	return 0;
 }
 
-static int msm_hdmi_config_hdmi_infoframe(struct hdmi *hdmi,
-					  const u8 *buffer, size_t len)
+static int msm_hdmi_bridge_write_hdmi_infoframe(struct drm_bridge *bridge,
+						const u8 *buffer, size_t len)
 {
+	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
+	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	u32 buf[7] = {};
 	u32 val;
 	int i;
@@ -173,6 +256,8 @@ static int msm_hdmi_config_hdmi_infoframe(struct hdmi *hdmi,
 		return -EINVAL;
 	}
 
+	msm_hdmi_bridge_clear_hdmi_infoframe(bridge);
+
 	/* checksum gets written together with the body of the frame */
 	hdmi_write(hdmi, REG_HDMI_GENERIC0_HDR,
 		   buffer[0] |
@@ -194,90 +279,6 @@ static int msm_hdmi_config_hdmi_infoframe(struct hdmi *hdmi,
 	return 0;
 }
 
-static int msm_hdmi_bridge_clear_infoframe(struct drm_bridge *bridge,
-					   enum hdmi_infoframe_type type)
-{
-	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
-	struct hdmi *hdmi = hdmi_bridge->hdmi;
-	u32 val;
-
-	switch (type) {
-	case HDMI_INFOFRAME_TYPE_AVI:
-		val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL0);
-		val &= ~(HDMI_INFOFRAME_CTRL0_AVI_SEND |
-			 HDMI_INFOFRAME_CTRL0_AVI_CONT);
-		hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL0, val);
-
-		val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL1);
-		val &= ~HDMI_INFOFRAME_CTRL1_AVI_INFO_LINE__MASK;
-		hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
-
-		break;
-
-	case HDMI_INFOFRAME_TYPE_AUDIO:
-		val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL0);
-		val &= ~(HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SEND |
-			 HDMI_INFOFRAME_CTRL0_AUDIO_INFO_CONT |
-			 HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SOURCE |
-			 HDMI_INFOFRAME_CTRL0_AUDIO_INFO_UPDATE);
-		hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL0, val);
-
-		val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL1);
-		val &= ~HDMI_INFOFRAME_CTRL1_AUDIO_INFO_LINE__MASK;
-		hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
-
-		break;
-
-	case HDMI_INFOFRAME_TYPE_SPD:
-		val = hdmi_read(hdmi, REG_HDMI_GEN_PKT_CTRL);
-		val &= ~(HDMI_GEN_PKT_CTRL_GENERIC1_SEND |
-			 HDMI_GEN_PKT_CTRL_GENERIC1_CONT |
-			 HDMI_GEN_PKT_CTRL_GENERIC1_LINE__MASK);
-		hdmi_write(hdmi, REG_HDMI_GEN_PKT_CTRL, val);
-
-		break;
-
-	case HDMI_INFOFRAME_TYPE_VENDOR:
-		val = hdmi_read(hdmi, REG_HDMI_GEN_PKT_CTRL);
-		val &= ~(HDMI_GEN_PKT_CTRL_GENERIC0_SEND |
-			 HDMI_GEN_PKT_CTRL_GENERIC0_CONT |
-			 HDMI_GEN_PKT_CTRL_GENERIC0_UPDATE |
-			 HDMI_GEN_PKT_CTRL_GENERIC0_LINE__MASK);
-		hdmi_write(hdmi, REG_HDMI_GEN_PKT_CTRL, val);
-
-		break;
-
-	default:
-		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
-	}
-
-	return 0;
-}
-
-static int msm_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
-					   enum hdmi_infoframe_type type,
-					   const u8 *buffer, size_t len)
-{
-	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
-	struct hdmi *hdmi = hdmi_bridge->hdmi;
-
-	msm_hdmi_bridge_clear_infoframe(bridge, type);
-
-	switch (type) {
-	case HDMI_INFOFRAME_TYPE_AVI:
-		return msm_hdmi_config_avi_infoframe(hdmi, buffer, len);
-	case HDMI_INFOFRAME_TYPE_AUDIO:
-		return msm_hdmi_config_audio_infoframe(hdmi, buffer, len);
-	case HDMI_INFOFRAME_TYPE_SPD:
-		return msm_hdmi_config_spd_infoframe(hdmi, buffer, len);
-	case HDMI_INFOFRAME_TYPE_VENDOR:
-		return msm_hdmi_config_hdmi_infoframe(hdmi, buffer, len);
-	default:
-		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
-		return 0;
-	}
-}
-
 static void msm_hdmi_set_timings(struct hdmi *hdmi,
 				 const struct drm_display_mode *mode);
 
@@ -462,8 +463,14 @@ static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
 	.hpd_enable = msm_hdmi_hpd_enable,
 	.hpd_disable = msm_hdmi_hpd_disable,
 	.hdmi_tmds_char_rate_valid = msm_hdmi_bridge_tmds_char_rate_valid,
-	.hdmi_clear_infoframe = msm_hdmi_bridge_clear_infoframe,
-	.hdmi_write_infoframe = msm_hdmi_bridge_write_infoframe,
+	.hdmi_clear_audio_infoframe = msm_hdmi_bridge_clear_audio_infoframe,
+	.hdmi_write_audio_infoframe = msm_hdmi_bridge_write_audio_infoframe,
+	.hdmi_clear_avi_infoframe = msm_hdmi_bridge_clear_avi_infoframe,
+	.hdmi_write_avi_infoframe = msm_hdmi_bridge_write_avi_infoframe,
+	.hdmi_clear_spd_infoframe = msm_hdmi_bridge_clear_spd_infoframe,
+	.hdmi_write_spd_infoframe = msm_hdmi_bridge_write_spd_infoframe,
+	.hdmi_clear_hdmi_infoframe = msm_hdmi_bridge_clear_hdmi_infoframe,
+	.hdmi_write_hdmi_infoframe = msm_hdmi_bridge_write_hdmi_infoframe,
 	.hdmi_audio_prepare = msm_hdmi_bridge_audio_prepare,
 	.hdmi_audio_shutdown = msm_hdmi_bridge_audio_shutdown,
 };
diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index 997429115068..9066ee2d1dff 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -158,35 +158,33 @@ static void rk3066_hdmi_set_power_mode(struct rk3066_hdmi *hdmi, int mode)
 		hdmi->tmdsclk = DEFAULT_PLLA_RATE;
 }
 
-static int rk3066_hdmi_bridge_clear_infoframe(struct drm_bridge *bridge,
-					      enum hdmi_infoframe_type type)
+static int rk3066_hdmi_bridge_clear_avi_infoframe(struct drm_bridge *bridge)
 {
 	struct rk3066_hdmi *hdmi = bridge_to_rk3066_hdmi(bridge);
 
-	if (type != HDMI_INFOFRAME_TYPE_AVI) {
-		drm_err(bridge->dev, "Unsupported infoframe type: %u\n", type);
-		return 0;
-	}
-
 	hdmi_writeb(hdmi, HDMI_CP_BUF_INDEX, HDMI_INFOFRAME_AVI);
 
 	return 0;
 }
 
 static int
-rk3066_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
-				   enum hdmi_infoframe_type type,
-				   const u8 *buffer, size_t len)
+rk3066_hdmi_bridge_clear_hdmi_infoframe(struct drm_bridge *bridge)
+{
+	/* FIXME: add support for this InfoFrame */
+
+	drm_warn_once(bridge->encoder->dev, "HDMI VSI not supported\n");
+
+	return 0;
+}
+
+static int
+rk3066_hdmi_bridge_write_avi_infoframe(struct drm_bridge *bridge,
+				       const u8 *buffer, size_t len)
 {
 	struct rk3066_hdmi *hdmi = bridge_to_rk3066_hdmi(bridge);
 	ssize_t i;
 
-	if (type != HDMI_INFOFRAME_TYPE_AVI) {
-		drm_err(bridge->dev, "Unsupported infoframe type: %u\n", type);
-		return 0;
-	}
-
-	rk3066_hdmi_bridge_clear_infoframe(bridge, type);
+	rk3066_hdmi_bridge_clear_avi_infoframe(bridge);
 
 	for (i = 0; i < len; i++)
 		hdmi_writeb(hdmi, HDMI_CP_BUF_ACC_HB0 + i * 4, buffer[i]);
@@ -194,6 +192,17 @@ rk3066_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
 	return 0;
 }
 
+static int
+rk3066_hdmi_bridge_write_hdmi_infoframe(struct drm_bridge *bridge,
+					const u8 *buffer, size_t len)
+{
+	rk3066_hdmi_bridge_clear_hdmi_infoframe(bridge);
+
+	/* FIXME: add support for this InfoFrame */
+
+	return 0;
+}
+
 static int rk3066_hdmi_config_video_timing(struct rk3066_hdmi *hdmi,
 					   struct drm_display_mode *mode)
 {
@@ -493,8 +502,10 @@ static const struct drm_bridge_funcs rk3066_hdmi_bridge_funcs = {
 	.atomic_disable = rk3066_hdmi_bridge_atomic_disable,
 	.detect = rk3066_hdmi_bridge_detect,
 	.edid_read = rk3066_hdmi_bridge_edid_read,
-	.hdmi_clear_infoframe = rk3066_hdmi_bridge_clear_infoframe,
-	.hdmi_write_infoframe = rk3066_hdmi_bridge_write_infoframe,
+	.hdmi_clear_avi_infoframe = rk3066_hdmi_bridge_clear_avi_infoframe,
+	.hdmi_write_avi_infoframe = rk3066_hdmi_bridge_write_avi_infoframe,
+	.hdmi_clear_hdmi_infoframe = rk3066_hdmi_bridge_clear_hdmi_infoframe,
+	.hdmi_write_hdmi_infoframe = rk3066_hdmi_bridge_write_hdmi_infoframe,
 	.mode_valid = rk3066_hdmi_bridge_mode_valid,
 };
 
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 3e6cbfa9dc44..73c23fece792 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -785,29 +785,113 @@ struct drm_bridge_funcs {
 				     unsigned long long tmds_rate);
 
 	/**
-	 * @hdmi_clear_infoframe:
+	 * @hdmi_clear_avi_infoframe:
 	 *
 	 * This callback clears the infoframes in the hardware during commit.
-	 * It will be called multiple times, once for every disabled infoframe
-	 * type.
 	 *
 	 * This callback is optional but it must be implemented by bridges that
 	 * set the DRM_BRIDGE_OP_HDMI flag in their &drm_bridge->ops.
 	 */
-	int (*hdmi_clear_infoframe)(struct drm_bridge *bridge,
-				    enum hdmi_infoframe_type type);
+	int (*hdmi_clear_avi_infoframe)(struct drm_bridge *bridge);
+
+	/**
+	 * @hdmi_write_avi_infoframe:
+	 *
+	 * Program the infoframe into the hardware.
+	 *
+	 * This callback is optional but it must be implemented by bridges that
+	 * set the DRM_BRIDGE_OP_HDMI flag in their &drm_bridge->ops.
+	 */
+	int (*hdmi_write_avi_infoframe)(struct drm_bridge *bridge,
+					const u8 *buffer, size_t len);
+
+	/**
+	 * @hdmi_clear_hdmi_infoframe:
+	 *
+	 * This callback clears the infoframes in the hardware during commit.
+	 *
+	 * This callback is optional but it must be implemented by bridges that
+	 * set the DRM_BRIDGE_OP_HDMI flag in their &drm_bridge->ops.
+	 */
+	int (*hdmi_clear_hdmi_infoframe)(struct drm_bridge *bridge);
+
 	/**
-	 * @hdmi_write_infoframe:
+	 * @hdmi_write_hdmi_infoframe:
 	 *
-	 * Program the infoframe into the hardware. It will be called multiple
-	 * times, once for every updated infoframe type.
+	 * Program the infoframe into the hardware.
 	 *
 	 * This callback is optional but it must be implemented by bridges that
 	 * set the DRM_BRIDGE_OP_HDMI flag in their &drm_bridge->ops.
 	 */
-	int (*hdmi_write_infoframe)(struct drm_bridge *bridge,
-				    enum hdmi_infoframe_type type,
-				    const u8 *buffer, size_t len);
+	int (*hdmi_write_hdmi_infoframe)(struct drm_bridge *bridge,
+					    const u8 *buffer, size_t len);
+
+	/**
+	 * @hdmi_clear_hdr_drm_infoframe:
+	 *
+	 * This callback clears the infoframes in the hardware during commit.
+	 *
+	 * This callback is optional but it must be implemented by bridges that
+	 * set the DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME flag in their
+	 * &drm_bridge->ops.
+	 */
+	int (*hdmi_clear_hdr_drm_infoframe)(struct drm_bridge *bridge);
+
+	/**
+	 * @hdmi_write_hdr_drm_infoframe:
+	 *
+	 * Program the infoframe into the hardware.
+	 *
+	 * This callback is optional but it must be implemented by bridges that
+	 * set the DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME flag in their
+	 * &drm_bridge->ops.
+	 */
+	int (*hdmi_write_hdr_drm_infoframe)(struct drm_bridge *bridge,
+					const u8 *buffer, size_t len);
+
+	/**
+	 * @hdmi_clear_spd_infoframe:
+	 *
+	 * This callback clears the infoframes in the hardware during commit.
+	 *
+	 * This callback is optional but it must be implemented by bridges that
+	 * set the DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME flag in their
+	 * &drm_bridge->ops.
+	 */
+	int (*hdmi_clear_spd_infoframe)(struct drm_bridge *bridge);
+
+	/**
+	 * @hdmi_write_spd_infoframe:
+	 *
+	 * Program the infoframe into the hardware.
+	 *
+	 * This callback is optional but it must be implemented by bridges that
+	 * set the DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME flag in their
+	 * &drm_bridge->ops.
+	 */
+	int (*hdmi_write_spd_infoframe)(struct drm_bridge *bridge,
+					const u8 *buffer, size_t len);
+
+	/**
+	 * @hdmi_clear_audio_infoframe:
+	 *
+	 * This callback clears the infoframes in the hardware during commit.
+	 *
+	 * This callback is optional but it must be implemented by bridges that
+	 * set the DRM_BRIDGE_OP_HDMI_AUDIO flag in their &drm_bridge->ops.
+	 */
+	int (*hdmi_clear_audio_infoframe)(struct drm_bridge *bridge);
+
+	/**
+	 * @hdmi_write_audio_infoframe:
+	 *
+	 * Program the infoframe into the hardware.
+	 *
+	 * This callback is optional but it must be implemented by bridges that
+	 * set the DRM_BRIDGE_OP_HDMI_AUDIO flag in their &drm_bridge->ops.
+	 */
+	int (*hdmi_write_audio_infoframe)(struct drm_bridge *bridge,
+					  const u8 *buffer, size_t len);
 
 	/**
 	 * @hdmi_audio_startup:
@@ -1063,7 +1147,11 @@ enum drm_bridge_ops {
 	/**
 	 * @DRM_BRIDGE_OP_HDMI: The bridge provides HDMI connector operations,
 	 * including infoframes support. Bridges that set this flag must
-	 * implement the &drm_bridge_funcs->write_infoframe callback.
+	 * provide HDMI-related information and implement the
+	 * &drm_bridge_funcs->clear_avi_infoframe,
+	 * &drm_bridge_funcs->write_avi_infoframe,
+	 * &drm_bridge_funcs->clear_hdmi_infoframe and
+	 * &drm_bridge_funcs->write_hdmi_infoframe callbacks.
 	 *
 	 * Note: currently there can be at most one bridge in a chain that sets
 	 * this bit. This is to simplify corresponding glue code in connector
@@ -1075,6 +1163,9 @@ enum drm_bridge_ops {
 	 * Bridges that set this flag must implement the
 	 * &drm_bridge_funcs->hdmi_audio_prepare and
 	 * &drm_bridge_funcs->hdmi_audio_shutdown callbacks.
+	 * If the bridge implements @DRM_BRIDGE_OP_HDMI, it also must implement
+	 * &drm_bridge_funcs->hdmi_write_audio_infoframe and
+	 * &drm_bridge_funcs->hdmi_cleaer_audio_infoframe callbacks.
 	 *
 	 * Note: currently there can be at most one bridge in a chain that sets
 	 * this bit. This is to simplify corresponding glue code in connector
@@ -1106,6 +1197,18 @@ enum drm_bridge_ops {
 	 * to be present.
 	 */
 	DRM_BRIDGE_OP_HDMI_CEC_ADAPTER = BIT(8),
+	/**
+	 * @DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME: The bridge supports
+	 * &drm_bridge_funcs->hdmi_write_hdr_drm_infoframe and
+	 * &drm_bridge_funcs->hdmi_clear_hdr_drm_infoframe callbacks.
+	 */
+	DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME = BIT(9),
+	/**
+	 * @DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME: The bridge supports
+	 * &drm_bridge_funcs->hdmi_write_spd_infoframe and
+	 * &drm_bridge_funcs->hdmi_clear_spd_infoframe callbacks.
+	 */
+	DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME = BIT(10),
 };
 
 /**

-- 
2.47.3

