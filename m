Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE34DA9C44C
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 11:52:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B94A10E921;
	Fri, 25 Apr 2025 09:52:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VCi70c+n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5C1910E91F
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 09:52:10 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8THak012251
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 09:52:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wO/TmcnQd+YBb2X8W0YMXAIl84/SqXkMF39BD3auU0Y=; b=VCi70c+nd9Dqa+RB
 IUwZGnxNppTOD0MeF/eKA79FkKmn3xWhjVj6wwVm3THaoAeXMtbxkytgM7ABpssb
 cply1gxpp71+rKviWOxgNB1PuaQ7zndxQVIvSLTm6N5QRVBEsoPLHS8eDjQc7R+D
 RFWMI+0kB7O9q1KayA1LJ0jhLjNayef3XtdRLLK+N+5/ibny3pWGL8qrUSLCDVw2
 MTsETADP30EuVrT61mRzqYYwyI2sDJ6xIin18LBZV5JZRixVyHRIDv4XOpQ5ipnh
 oaMr8BZc5FxZ3oDsd8wH4b2gI5CdFf16ETqvmH4YKDZhbBUOtHvEiSUN6zngzlpc
 7uClXg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh18exc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 09:52:09 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6e8ffb630ffso32851686d6.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 02:52:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745574727; x=1746179527;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wO/TmcnQd+YBb2X8W0YMXAIl84/SqXkMF39BD3auU0Y=;
 b=bkICQdsEDNTtpuO25ukslhAnW+ocQY9PSwWVaI3iyX5/jeB89rm+8/3FTTXAE8q51D
 TZXITr+8q/douS96cAM26vQeP+hXHtUkpCfBPfhN58A4Xcdbpe6xOS7UW7Jl3VrnP1/P
 g0aHMUu6c6KYMN720TzCuN5732XMGk+KsJmGLVJ/J908L6boIm+mOUiOMikF1Dn6bXb3
 QC3V1DBLvKAkFijwN9yr2euxOtEevJ7KLu7iewnnu26PhWNfiyaawNFVi0aMzsx9NTnY
 Jl7scZHUUv2BB6wv1M1McexWBeESPcGdW7CSE/ryiOcUQkwJV1kscXhXUaypzk7JyUPR
 J3TQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQ4mUnKNcKr6JGJepg4FPL0O7YA+02pYLOnh5QwYd4WHnz/lMVCK5gFq08K4fog55cSiYcBbceZaM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSZr+33UJa2sSp7RXY/pXm3EKiLsWm/EiSInomLgxnkpuKOdBz
 KhyvdftV/gyzpC2kUROtEvR4HhPi6NjY+fBnhhrG4UM40yPzyQr7zDtNSgEUz+UWfkbA6wWcOH9
 lQ1X0ZrSCemFmpHmCIWCi3Q7MYHoGQGUXuhUj/C0oTrOgyOjJ/3ZBDHodJhrItBohj54=
X-Gm-Gg: ASbGncvOShVfvNTXGUJHrgK6xA70XxXvvffEj0utQD63AN1dkhyg9ifLEJtkuLGJGY3
 V65Gz0Zb7KYUpGYw87eQ4OYOZrdEQJbLWjx8UaNzfAGI0bRG3z43PtmOj4yIrFTNODDhS4Vhq8k
 w9o+CYvmMn+nBWe0qt7tef+rcUnlswQSv7bqtDkEkyZhyDnJ/5BQX7c2DmMATSDNlm2eYRvmJf6
 2LzllkSrYh8Ujk36JITCtDqC41OJN4m6g+nxrEfG2ii/Noti67H+9xAW4nmmiBVaNz78GbUOFd9
 /CKxrhODmLAyXUmnrh4jGLGIGDttpq/EwI+b85Gl17jSHrfR6ZRsA3NNBNTBSt4rIPgsjLMyvfM
 UQ6bC/C+WgkNeXuCw2nQ3kCG8
X-Received: by 2002:a05:6214:268d:b0:6ea:d629:f48b with SMTP id
 6a1803df08f44-6f4cb9ed9a0mr30004736d6.19.1745574727454; 
 Fri, 25 Apr 2025 02:52:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6aGbfdyHq+EQQf+N4Ajh6G1MWGQeKTj0SfwTH/XJktJCOH77u6efYIs0QzEDB8BOkstnzYA==
X-Received: by 2002:a05:6214:268d:b0:6ea:d629:f48b with SMTP id
 6a1803df08f44-6f4cb9ed9a0mr30004396d6.19.1745574726997; 
 Fri, 25 Apr 2025 02:52:06 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7ccb7c99sm539164e87.218.2025.04.25.02.52.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 02:52:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 12:51:56 +0300
Subject: [PATCH v4 6/7] drm/msm/mdp4: switch LVDS to use drm_bridge/_connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fd-mdp4-lvds-v4-6-6b212160b44c@oss.qualcomm.com>
References: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
In-Reply-To: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10669;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=E1BBsIIQymozlYNkeECHB8spXLY+ZOYj5r2uebvZgDA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC1s6kX/49af49ontjbSa5smcZpA36az8IOH2h
 fK/wi2dRU2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAtbOgAKCRCLPIo+Aiko
 1SIoB/0SGBIeejLoEcS5t/PUXRa08DYlZod20hKMAL1sJUtFmFJYwMXmKW3oZnlPeSOnQFGfjvy
 SrbQXURsKMq+OJz33Zz2+EkavazsBFaTePlO8Q9RfKcruGuoMYSTsnoAgC32gbAOvBKl2VOcLvq
 nwZaSmaUDd8iIsjTOAkiuQ44Zm/W0MLn7mkX+aTK55TFu/wuPkE5WH77ggnG3ahDm5C9SJR03aV
 DpVxApE3fsK/Q8YkUsa3jvsF/exBD2MMJr1/M7up2sOBVrb9l/VbsCFv7H8to8s2tKZ9f0rjSkd
 3YMXuCThVA0u9B1Y+Ra0jlncLwxfdLx8ojSMsm73xCAABI5x
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: HDZwQeZNFXfRrxyzNWHacSI94SFOP4G-
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=680b5b49 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=7oS1v-cyAAAA:8
 a=P9PoVruIDXn46qgs0YwA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22 a=PcM2qe9_4d1tJnOwuzRa:22
X-Proofpoint-ORIG-GUID: HDZwQeZNFXfRrxyzNWHacSI94SFOP4G-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA3MSBTYWx0ZWRfXxc//cXKgLZxa
 PF0HrKj8QWFS6462/UmH9+oGaQ9m+wA1NX/K5nlqEuCzYDwvWrp6xn35Q/yvZ7xDaci+/MAzLUq
 GbpbHftod5VUDXgUChm/29MulbKgujtYIyxlyHGOU2EGbaf6N2/KM36RBhGcJ9WH6YwHitc+sRK
 1FB/zOKe2j7qdT+i2Zslvu4d7HoYqkZq11fe3mA+nTUMqc9cVk/+ACjnJx4+vG62njmKUKEpxlB
 ZJxyJ7uKvZ1mB3zT3nmi8VKMVJv/8puURaOibvDgQdeJMLI4eNkHpuYZc57CacnXqvw8owCGbFW
 RavSw0u9nIIRZ5hO9rwtp/s3b+X9VmzBGLRa2ghJ/7s31t4wgYG5CyG0PjTUSZN6Bm1clztSbyu
 vuAJpGFlLgU6f/oEZWLqpaJ4laWWyiBMDeA+2jr3Tx2Ra5N5B3Vk6sQcUvlPMThmA83ZLaXV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250071
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

LVDS support in MDP4 driver makes use of drm_connector directly. However
LCDC encoder and LVDS connector are wrappers around drm_panel. Switch
them to use drm_panel_bridge/drm_bridge_connector. This allows using
standard interface for the drm_panel and also inserting additional
bridges between encoder and panel.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Makefile                       |   1 -
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |  34 +++++--
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h           |   6 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c  |  20 +----
 .../gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c    | 100 ---------------------
 5 files changed, 28 insertions(+), 133 deletions(-)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 5df20cbeafb8bf07c825a1fd72719d5a56c38613..7a2ada6e2d74a902879e4f12a78ed475e5209ec2 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -48,7 +48,6 @@ msm-display-$(CONFIG_DRM_MSM_MDP4) += \
 	disp/mdp4/mdp4_dsi_encoder.o \
 	disp/mdp4/mdp4_dtv_encoder.o \
 	disp/mdp4/mdp4_lcdc_encoder.o \
-	disp/mdp4/mdp4_lvds_connector.o \
 	disp/mdp4/mdp4_lvds_pll.o \
 	disp/mdp4/mdp4_irq.o \
 	disp/mdp4/mdp4_kms.o \
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 689e210660a5218ed1e2d116073723215af5a187..93c9411eb422bc67b7fedb5ffce4c330310b520f 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -6,6 +6,8 @@
 
 #include <linux/delay.h>
 
+#include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_vblank.h>
 
 #include "msm_drv.h"
@@ -189,7 +191,7 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
 	struct msm_drm_private *priv = dev->dev_private;
 	struct drm_encoder *encoder;
 	struct drm_connector *connector;
-	struct device_node *panel_node;
+	struct drm_bridge *next_bridge;
 	int dsi_id;
 	int ret;
 
@@ -199,27 +201,43 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
 		 * bail out early if there is no panel node (no need to
 		 * initialize LCDC encoder and LVDS connector)
 		 */
-		panel_node = of_graph_get_remote_node(dev->dev->of_node, 0, 0);
-		if (!panel_node)
-			return 0;
+		next_bridge = devm_drm_of_get_bridge(dev->dev, dev->dev->of_node, 0, 0);
+		if (IS_ERR(next_bridge)) {
+			ret = PTR_ERR(next_bridge);
+			if (ret == -ENODEV)
+				return 0;
+			return ret;
+		}
 
-		encoder = mdp4_lcdc_encoder_init(dev, panel_node);
+		encoder = mdp4_lcdc_encoder_init(dev);
 		if (IS_ERR(encoder)) {
 			DRM_DEV_ERROR(dev->dev, "failed to construct LCDC encoder\n");
-			of_node_put(panel_node);
 			return PTR_ERR(encoder);
 		}
 
 		/* LCDC can be hooked to DMA_P (TODO: Add DMA_S later?) */
 		encoder->possible_crtcs = 1 << DMA_P;
 
-		connector = mdp4_lvds_connector_init(dev, panel_node, encoder);
+		ret = drm_bridge_attach(encoder, next_bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+		if (ret) {
+			DRM_DEV_ERROR(dev->dev, "failed to attach LVDS panel/bridge: %d\n", ret);
+
+			return ret;
+		}
+
+		connector = drm_bridge_connector_init(dev, encoder);
 		if (IS_ERR(connector)) {
 			DRM_DEV_ERROR(dev->dev, "failed to initialize LVDS connector\n");
-			of_node_put(panel_node);
 			return PTR_ERR(connector);
 		}
 
+		ret = drm_connector_attach_encoder(connector, encoder);
+		if (ret) {
+			DRM_DEV_ERROR(dev->dev, "failed to attach LVDS connector: %d\n", ret);
+
+			return ret;
+		}
+
 		break;
 	case DRM_MODE_ENCODER_TMDS:
 		encoder = mdp4_dtv_encoder_init(dev);
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
index 66f5009fdf8aebcc543b5539d1c2d03075171001..f9d988076337cb6fb63af8e76be59b2eb34ab327 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
@@ -191,11 +191,7 @@ struct drm_crtc *mdp4_crtc_init(struct drm_device *dev,
 long mdp4_dtv_round_pixclk(struct drm_encoder *encoder, unsigned long rate);
 struct drm_encoder *mdp4_dtv_encoder_init(struct drm_device *dev);
 
-struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev,
-		struct device_node *panel_node);
-
-struct drm_connector *mdp4_lvds_connector_init(struct drm_device *dev,
-		struct device_node *panel_node, struct drm_encoder *encoder);
+struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev);
 
 #ifdef CONFIG_DRM_MSM_DSI
 struct drm_encoder *mdp4_dsi_encoder_init(struct drm_device *dev);
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
index 7f4e8005bc4ae0bc82ec5b87a1fea0530301b427..06a307c1272d10e678501062a63559c5672ce999 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
@@ -14,7 +14,6 @@
 
 struct mdp4_lcdc_encoder {
 	struct drm_encoder base;
-	struct device_node *panel_node;
 	struct drm_panel *panel;
 	struct clk *lcdc_clk;
 	unsigned long int pixclock;
@@ -262,19 +261,12 @@ static void mdp4_lcdc_encoder_disable(struct drm_encoder *encoder)
 	struct mdp4_lcdc_encoder *mdp4_lcdc_encoder =
 			to_mdp4_lcdc_encoder(encoder);
 	struct mdp4_kms *mdp4_kms = get_kms(encoder);
-	struct drm_panel *panel;
 
 	if (WARN_ON(!mdp4_lcdc_encoder->enabled))
 		return;
 
 	mdp4_write(mdp4_kms, REG_MDP4_LCDC_ENABLE, 0);
 
-	panel = of_drm_find_panel(mdp4_lcdc_encoder->panel_node);
-	if (!IS_ERR(panel)) {
-		drm_panel_disable(panel);
-		drm_panel_unprepare(panel);
-	}
-
 	/*
 	 * Wait for a vsync so we know the ENABLE=0 latched before
 	 * the (connector) source of the vsync's gets disabled,
@@ -300,7 +292,6 @@ static void mdp4_lcdc_encoder_enable(struct drm_encoder *encoder)
 			to_mdp4_lcdc_encoder(encoder);
 	unsigned long pc = mdp4_lcdc_encoder->pixclock;
 	struct mdp4_kms *mdp4_kms = get_kms(encoder);
-	struct drm_panel *panel;
 	uint32_t config;
 	int ret;
 
@@ -335,12 +326,6 @@ static void mdp4_lcdc_encoder_enable(struct drm_encoder *encoder)
 	if (ret)
 		DRM_DEV_ERROR(dev->dev, "failed to enable lcdc_clk: %d\n", ret);
 
-	panel = of_drm_find_panel(mdp4_lcdc_encoder->panel_node);
-	if (!IS_ERR(panel)) {
-		drm_panel_prepare(panel);
-		drm_panel_enable(panel);
-	}
-
 	setup_phy(encoder);
 
 	mdp4_write(mdp4_kms, REG_MDP4_LCDC_ENABLE, 1);
@@ -375,8 +360,7 @@ static const struct drm_encoder_helper_funcs mdp4_lcdc_encoder_helper_funcs = {
 };
 
 /* initialize encoder */
-struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev,
-		struct device_node *panel_node)
+struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev)
 {
 	struct drm_encoder *encoder;
 	struct mdp4_lcdc_encoder *mdp4_lcdc_encoder;
@@ -387,8 +371,6 @@ struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev,
 	if (IS_ERR(mdp4_lcdc_encoder))
 		return ERR_CAST(mdp4_lcdc_encoder);
 
-	mdp4_lcdc_encoder->panel_node = panel_node;
-
 	encoder = &mdp4_lcdc_encoder->base;
 
 	drm_encoder_helper_add(encoder, &mdp4_lcdc_encoder_helper_funcs);
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
deleted file mode 100644
index 4755eb13ef79f313d2be088145c8cd2e615226fe..0000000000000000000000000000000000000000
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
+++ /dev/null
@@ -1,100 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2014 Red Hat
- * Author: Rob Clark <robdclark@gmail.com>
- * Author: Vinay Simha <vinaysimha@inforcecomputing.com>
- */
-
-#include "mdp4_kms.h"
-
-struct mdp4_lvds_connector {
-	struct drm_connector base;
-	struct drm_encoder *encoder;
-	struct device_node *panel_node;
-	struct drm_panel *panel;
-};
-#define to_mdp4_lvds_connector(x) container_of(x, struct mdp4_lvds_connector, base)
-
-static enum drm_connector_status mdp4_lvds_connector_detect(
-		struct drm_connector *connector, bool force)
-{
-	struct mdp4_lvds_connector *mdp4_lvds_connector =
-			to_mdp4_lvds_connector(connector);
-
-	if (!mdp4_lvds_connector->panel) {
-		mdp4_lvds_connector->panel =
-			of_drm_find_panel(mdp4_lvds_connector->panel_node);
-		if (IS_ERR(mdp4_lvds_connector->panel))
-			mdp4_lvds_connector->panel = NULL;
-	}
-
-	return mdp4_lvds_connector->panel ?
-			connector_status_connected :
-			connector_status_disconnected;
-}
-
-static void mdp4_lvds_connector_destroy(struct drm_connector *connector)
-{
-	struct mdp4_lvds_connector *mdp4_lvds_connector =
-			to_mdp4_lvds_connector(connector);
-
-	drm_connector_cleanup(connector);
-
-	kfree(mdp4_lvds_connector);
-}
-
-static int mdp4_lvds_connector_get_modes(struct drm_connector *connector)
-{
-	struct mdp4_lvds_connector *mdp4_lvds_connector =
-			to_mdp4_lvds_connector(connector);
-	struct drm_panel *panel = mdp4_lvds_connector->panel;
-	int ret = 0;
-
-	if (panel)
-		ret = drm_panel_get_modes(panel, connector);
-
-	return ret;
-}
-
-static const struct drm_connector_funcs mdp4_lvds_connector_funcs = {
-	.detect = mdp4_lvds_connector_detect,
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = mdp4_lvds_connector_destroy,
-	.reset = drm_atomic_helper_connector_reset,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-};
-
-static const struct drm_connector_helper_funcs mdp4_lvds_connector_helper_funcs = {
-	.get_modes = mdp4_lvds_connector_get_modes,
-};
-
-/* initialize connector */
-struct drm_connector *mdp4_lvds_connector_init(struct drm_device *dev,
-		struct device_node *panel_node, struct drm_encoder *encoder)
-{
-	struct drm_connector *connector = NULL;
-	struct mdp4_lvds_connector *mdp4_lvds_connector;
-
-	mdp4_lvds_connector = kzalloc(sizeof(*mdp4_lvds_connector), GFP_KERNEL);
-	if (!mdp4_lvds_connector)
-		return ERR_PTR(-ENOMEM);
-
-	mdp4_lvds_connector->encoder = encoder;
-	mdp4_lvds_connector->panel_node = panel_node;
-
-	connector = &mdp4_lvds_connector->base;
-
-	drm_connector_init(dev, connector, &mdp4_lvds_connector_funcs,
-			DRM_MODE_CONNECTOR_LVDS);
-	drm_connector_helper_add(connector, &mdp4_lvds_connector_helper_funcs);
-
-	connector->polled = 0;
-
-	connector->interlace_allowed = 0;
-	connector->doublescan_allowed = 0;
-
-	drm_connector_attach_encoder(connector, encoder);
-
-	return connector;
-}

-- 
2.39.5

