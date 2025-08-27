Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41806B383B3
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 15:29:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABBFC10E7FE;
	Wed, 27 Aug 2025 13:29:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iOdBboId";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F0C410E7FE
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 13:29:11 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57R6kIqE018296
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 13:29:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=QMARdnbf/m1vPWuYlwAdvY
 /4QCes6Go5/sFkW0Dm1Gc=; b=iOdBboId2v7Pyejv1Kk5zld1mm3jeJNx8GGaNK
 5v7q0G7wfuf/tm/kwueBEs7LwQb0wStxtalhsG7jF171ks3J8PWqSv1BogMaP+nO
 6uaGe2Gleei3IosYbhHSlzR3my3QhbM2aVOkz4jE7KKpGL5TyTMCCUfeiqMkRY3H
 BwZoN/tC+9PQEOAtitnfQZMKoRQgtXoUv1ERZclVaK1Y7P4MRHeOP9burV6ROXeE
 BUPIGM4dKv1H6rNo3gWAgWzSNwQtHv5b8uMm795SryNoBNKhWa+4GdRvcrwiAMrG
 mUWmTLc0O5WuYGR7FRRDpAtnUyvvHkDJqcag8AXSir6585Og==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xfmqjx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 13:29:10 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-70d93f57a7bso124150276d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 06:29:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756301349; x=1756906149;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QMARdnbf/m1vPWuYlwAdvY/4QCes6Go5/sFkW0Dm1Gc=;
 b=GZmDf24nJ4yD3ttH4u3X9Wk9kKrJSuIkZosGCQB9ynNdvKmsh8hrfW+OvnKusoqIxn
 uD0wjdymlETlr9IHbbC8BgdZjvzklZoQQmPzC5+q36k0hllNF7y39HbxaY4K6ZenYxPL
 0ZMhyw87oM28006atxHHGxNRQDnEYSMkdV/hUHaPxySmCjyjnZynKOqtE+3bhcDsxIuO
 iagh5cmBPhczKpncUhZHSVpLGGvjfM+c9DVylzEcF1/MV0lRX1D5zfYXNe+mriP240Hc
 cQ08JjIOdyb6pobHRiTEw1PmuYRpNjMF+h7ZgXswvfuMI63/yV5WxgFazcYxTQxaZGt1
 yH6A==
X-Gm-Message-State: AOJu0YykYYyNuDKUzP/rN/JmpZApRiumxG45GSmZV5bbT5mdtUH3B/Zs
 mDhB/lQD4gzUkgCx0WG/HY+CdYUnBFKAzTEaEpbZPcpHns5YhQfRC1HhuqH9Xq4gWH4lynjfTSS
 MLzD1J8OQnJ6YEjRjInmJ/qfN3HIU4KEEBG0Gapo6E74oC0FAJP8nvy4opaRIXRQirl37Jxo=
X-Gm-Gg: ASbGnctyCngouwetGaTWyXhu95k5mkhdVOD9aLS179+zteOSdbNbio6eJ+CT333hLpy
 rxdtyzaPVvfVkYaqU8WV19kVBgX82rIH6VmLhcRr2P+V0aZxaDBST3hBxEhugpbKgO4MihoRf/z
 v87VW0BgFCpZHAdImovB4mBrxLiNPrdd9uha8eUyIaKboD09RW+jHlzvMUWDNWQ5UUwzEPV4doc
 pYW4iQQO6smoaNlfhWUFPmhA+/qhxUNdgC0XYk8IV1nFvC4jUiZ6f4i2RQpoDwIIcbGx3mH2hGo
 KzRLoYitAOtBc+VFB0I1Fev6nAiN84GQUx5ZSuFHfVpiSieuwsKV1f1Ed/CQA/D3t3rEWVZ40pK
 X5xpka8/mdL05julJ7YDqVk5yTO3ygZb8eVxmrhasDki8u8aSdom/
X-Received: by 2002:ad4:5def:0:b0:70d:e20f:3cc1 with SMTP id
 6a1803df08f44-70de20f4026mr21008546d6.43.1756301349287; 
 Wed, 27 Aug 2025 06:29:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGNtCiUpBogI42bMmazm0nL5K5eaGuDsl79iw5ybOi93gMwRE6Vo0pUkZVzfVzXJWyc01ALw==
X-Received: by 2002:ad4:5def:0:b0:70d:e20f:3cc1 with SMTP id
 6a1803df08f44-70de20f4026mr21008216d6.43.1756301348700; 
 Wed, 27 Aug 2025 06:29:08 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35ca63fbsm2770607e87.135.2025.08.27.06.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Aug 2025 06:29:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 27 Aug 2025 16:29:04 +0300
Subject: [PATCH] drm/bridge: adv7511: provide SPD and HDMI infoframes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-adv7511-infoframes-v1-1-f89b9690f89c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAB8Ir2gC/zWMQQrDIBBFryKz7tCoSNJcpWRhdWxnoWnVhEDI3
 SsN3f334b0dCmWmAqPYIdPKhefUQF4EuJdNT0L2jUF1ynSD6tH6tTdSIqcwh2wjFdS3zjgV5KC
 1hSa+MwXeftH7dHKmz9La9TzhYQuhm2PkOgqfI0Yu7vofmGirMB3HF3xW7xCeAAAA
X-Change-ID: 20250827-adv7511-infoframes-3905c2f1833a
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4333;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=L+16z/9+oiYAilhzNPcMYpqpr4XjK4jSA5wBtqy39UE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBorwgjPZglKl9IoTIVYrS8AGSxhA9OUCbDkTZSx
 q2QA91EvmKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaK8IIwAKCRCLPIo+Aiko
 1XwcB/4sZbL5yCKFdZPsrhhWpAvgLYuHW3uD5MKjcG9UE5vle/cwhGaFJ3/n383lkdLTThP0WPL
 DqQ0fi1+TjAe5/zf4ofu/gXz7LGq3cXV9HJq+b6EaW6kLk6O0HEuqEXm7pmiMz2PhSNp2Am/y5u
 llZVBwDVZ1KDYnP+z9MxdM7FYdoXawS6KwqRlx+eDbFr15ukBDpfVFYpR+s27sAyhqGHmDQksqr
 krfckR7h0GKo+S1nrAJxuXcWF2YLIK5q+ctkZCbDwW3hULTiyqCaOfpxJjuk1izqyzyM6Cp9Yre
 IDnxfFS0pqsn25iiVRbVi9tSNDulCS5/AJZveB76kpbUomE3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX2TYIHbkD3tYy
 RicZIK+hVxunOZLm/4bcnaR0iKho0k30Fc2rnFne4FcRPN+7ZmNDQtpSFGewCGf+6O24T0+2D7O
 nKVmTh/HjRGVSiwBCpmz5vXO0Ehc/17nNSgwhZPzFqEdz67WJYKP82Bmm06/oCCJbFn3d8F1jzU
 5sy0/qgKVuzygvBsDfP6FKWXhOPsGNf6hjV6TKlhcU35qgXtcO5AiF4JWh7cPZKI+TbLoPx1ZYw
 cFI8fgg87DHf7SFVsfULnn2WFWioTfv6H1jfTX5mLOhtvP0TLu7LqMI7DRZ4Izchp6UssIKJQno
 33GQ+ScaLmIQ1tKuq1doZO2CnfuQyLu1eA2CgHVFy9W27DkXU5NpK83/EvFMuEGMEKE/SwoMULf
 dtWxjLBj
X-Proofpoint-GUID: SBnnjNFpjyemtZUmQTdoKlw04wGkKyAV
X-Authority-Analysis: v=2.4 cv=MutS63ae c=1 sm=1 tr=0 ts=68af0826 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=hFmop0gb2dWuklt7bEIA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: SBnnjNFpjyemtZUmQTdoKlw04wGkKyAV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_03,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
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

ADV75xx hardware supports sending SPD InfoFrame over the HDMI link. Also
it provides support for two generic (Spare) InfoFrames. Use those
capabilities to be able to send SPD and HDMI Vendor-Specific Infoframes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511.h     |  6 ++++--
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 30 ++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
index 85ebead9809cfe4142fb0e2586f8904227acb096..8be7266fd4f49fbc4ccf9ee12c302b3a6d74a6e0 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
@@ -195,13 +195,14 @@
 #define ADV7511_I2S_IEC958_DIRECT		3
 
 #define ADV7511_PACKET(p, x)	    ((p) * 0x20 + (x))
-#define ADV7511_PACKET_SDP(x)	    ADV7511_PACKET(0, x)
+#define ADV7511_PACKET_SPD(x)	    ADV7511_PACKET(0, x)
 #define ADV7511_PACKET_MPEG(x)	    ADV7511_PACKET(1, x)
 #define ADV7511_PACKET_ACP(x)	    ADV7511_PACKET(2, x)
 #define ADV7511_PACKET_ISRC1(x)	    ADV7511_PACKET(3, x)
 #define ADV7511_PACKET_ISRC2(x)	    ADV7511_PACKET(4, x)
 #define ADV7511_PACKET_GM(x)	    ADV7511_PACKET(5, x)
-#define ADV7511_PACKET_SPARE(x)	    ADV7511_PACKET(6, x)
+#define ADV7511_PACKET_SPARE1(x)    ADV7511_PACKET(6, x)
+#define ADV7511_PACKET_SPARE2(x)    ADV7511_PACKET(7, x)
 
 #define ADV7511_REG_CEC_TX_FRAME_HDR	0x00
 #define ADV7511_REG_CEC_TX_FRAME_DATA0	0x01
@@ -348,6 +349,7 @@ struct adv7511 {
 	struct i2c_client *i2c_cec;
 
 	struct regmap *regmap;
+	struct regmap *regmap_packet;
 	struct regmap *regmap_cec;
 	enum drm_connector_status status;
 	bool powered;
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 00d6417c177b430cb1a81118800588b90c692018..26f8ef4824235a9a85b57a9a3a816fe26a59e45c 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -132,6 +132,13 @@ static const struct regmap_config adv7511_regmap_config = {
 	.volatile_reg = adv7511_register_volatile,
 };
 
+static const struct regmap_config adv7511_packet_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+
+	.max_register = 0xff,
+};
+
 /* -----------------------------------------------------------------------------
  * Hardware configuration
  */
@@ -889,6 +896,12 @@ static int adv7511_bridge_hdmi_clear_infoframe(struct drm_bridge *bridge,
 	case HDMI_INFOFRAME_TYPE_AVI:
 		adv7511_packet_disable(adv7511, ADV7511_PACKET_ENABLE_AVI_INFOFRAME);
 		break;
+	case HDMI_INFOFRAME_TYPE_SPD:
+		adv7511_packet_disable(adv7511, ADV7511_PACKET_ENABLE_SPD);
+		break;
+	case HDMI_INFOFRAME_TYPE_VENDOR:
+		adv7511_packet_disable(adv7511, ADV7511_PACKET_ENABLE_SPARE1);
+		break;
 	default:
 		drm_dbg_driver(adv7511->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
 		break;
@@ -913,6 +926,16 @@ static int adv7511_bridge_hdmi_write_infoframe(struct drm_bridge *bridge,
 
 		adv7511_packet_enable(adv7511, ADV7511_PACKET_ENABLE_AVI_INFOFRAME);
 		break;
+	case HDMI_INFOFRAME_TYPE_SPD:
+		regmap_bulk_write(adv7511->regmap_packet, ADV7511_PACKET_SPD(0),
+				  buffer, len);
+		adv7511_packet_enable(adv7511, ADV7511_PACKET_ENABLE_SPD);
+		break;
+	case HDMI_INFOFRAME_TYPE_VENDOR:
+		regmap_bulk_write(adv7511->regmap_packet, ADV7511_PACKET_SPARE1(0),
+				  buffer, len);
+		adv7511_packet_enable(adv7511, ADV7511_PACKET_ENABLE_SPARE1);
+		break;
 	default:
 		drm_dbg_driver(adv7511->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
 		break;
@@ -1242,6 +1265,13 @@ static int adv7511_probe(struct i2c_client *i2c)
 		goto err_i2c_unregister_edid;
 	}
 
+	adv7511->regmap_packet = devm_regmap_init_i2c(adv7511->i2c_packet,
+						      &adv7511_packet_config);
+	if (IS_ERR(adv7511->regmap_packet)) {
+		ret = PTR_ERR(adv7511->regmap_packet);
+		goto err_i2c_unregister_packet;
+	}
+
 	regmap_write(adv7511->regmap, ADV7511_REG_PACKET_I2C_ADDR,
 		     adv7511->i2c_packet->addr << 1);
 

---
base-commit: 6380b1ceba7783ccd2c7fb2e003412c1b8bb4235
change-id: 20250827-adv7511-infoframes-3905c2f1833a

Best regards,
-- 
With best wishes
Dmitry

