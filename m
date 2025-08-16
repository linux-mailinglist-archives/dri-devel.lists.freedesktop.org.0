Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE79B28EE7
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 17:19:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 034BE10E38F;
	Sat, 16 Aug 2025 15:19:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="P3Qlr/sA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 283AB10E38B
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 15:19:45 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57GF8YDI005704
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 15:19:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3LiTGbp3yrZlb6BdgcZ8Qpq6CDIhRX/Qyb9HMEmTyzM=; b=P3Qlr/sAPTtXhNia
 iUQgs6sum8tN8E2pMz7a8TWihY4KgSewQaxH/ZJfgrXZ/PY5pEOd6sL0FyqPO2ao
 EzUb0Qr0R7ABXtB4JPF6KXf+02/u1iWYhU1ZiW0IzksMzTKQEWmWU6u7bYQiY1FP
 TUgzSv4L4ouPTCNd2LzYsZ3B2DLER/+5SadEdM/kMAOlYLhN/irGfubf19o4irlz
 m5NxVwNbLFM7Hg46WPSVzwhrfhZsZk+fNN8A2tUNdN/QhtJ26TI5JVza39u4mAbG
 +cHMw1zhe0173LPmx0Ejm9D9WORqMv8135jgO6eE4GFLFLrgYQYKZLCxSuyjsIIW
 mW1kMQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jh070w4f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 15:19:44 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70a88ddec70so27590676d6.0
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 08:19:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755357583; x=1755962383;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3LiTGbp3yrZlb6BdgcZ8Qpq6CDIhRX/Qyb9HMEmTyzM=;
 b=W8OrKD2Hke30P8W/74k+sH9pJfePeLONQRO0neOf81xI/3rYoyyFZLzveyVf3T4YEp
 C4ugvIYVIUmAX40rkZvKE3XptFWHrdLlbeRJ1wkuFtB2z/5h7naCL53/2iCVZAvePCyA
 szdKF2t+Z0yrjGYU7CoIxkUGibSYfH0z7uUUhC0sI9C0P8Ad91afipVF3HUglRbR1srg
 jfAzVQTnq7UmlXE/2X2ND0Hbzt3mjaLVuZ/IZU7FUKxlmx0+iT3p6BxyznnPN/raIbZh
 OD4xfJNd2w96JM6Nu2Y2+c//aIo5Mjho1zg7UKkSQpd4bNXWb2RskBKD+hjwRIDAGSnF
 l1sA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsHGHX/rJ8REZi9vLqG24nYOyD3acG/fpHueqG4Q4b7yn7ruFz8yuEYT9ywXamafoVDsbMOMSkZN4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYZjgeyFReJcJd33M911nlo6AIE4uNYX2Vs4BZa0U+dQhf2aCk
 OFzEWqD38O3Nmq2qNTCQiBwENKJSH3TpjztdFAx2W/tt1sgMLARReHePbg/wJnPdUQQ+M0o1urg
 TsEtPVqmJJCZm8Cu+MHDcA0bT31sulOfGH0NoLQ/uFdbDkrAlF5MdDVuu0bbzBttAgnKjNh8=
X-Gm-Gg: ASbGncvEn/AYpmOx74SoaHplJPtGjqM6KwtmrAT6IFUCLAKxas0wfws/k4GfrT4NYcT
 CaOqscjQbWbNUD9hZ9O/2dhYdfwt4LtSSgkQkByFHX1S32PiSs7XnLt7YvFzryYiyhrPpODNdUC
 7yuXUJp18Gz9WSW9UzCS+jWrZMIAxFB4tZ/xhPa5JyrZQytuKKbUsGvSYEGEkRGLW4LlW8HjS6t
 hs2JZ8SiNewdJSgyIa38a//ho3sU0uNrHYXj5QSBU5OosUsZ1trWSN7oYZyIyCY03U26Lonrkoc
 uJWu7o4givzja5X27cGSILd01MM0TMYoZ0mQ0czCCvwMPgmUnAtR2TdWftA3XUKRndT6RQX6h6o
 1OnG91myZPAYNLnQHsBUIgl1vr6wydpYJPj4z4O9Sfs6yIedQ8uxh
X-Received: by 2002:a05:6214:2aae:b0:70b:6e6d:20a with SMTP id
 6a1803df08f44-70ba788e6a4mr73534966d6.0.1755357583365; 
 Sat, 16 Aug 2025 08:19:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHX7AXYCBCRqrmrQsT1LQyM0jWdKsXIc3YtI6BivWlsRGdFHgTuLmmSZBXhNj3Yos1Vch68qQ==
X-Received: by 2002:a05:6214:2aae:b0:70b:6e6d:20a with SMTP id
 6a1803df08f44-70ba788e6a4mr73534476d6.0.1755357582786; 
 Sat, 16 Aug 2025 08:19:42 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef35965fsm907579e87.37.2025.08.16.08.19.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Aug 2025 08:19:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 16 Aug 2025 18:19:36 +0300
Subject: [PATCH v2 2/8] drm/komeda: use drmm_writeback_connector_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250816-wb-drop-encoder-v2-2-f951de04f4f9@oss.qualcomm.com>
References: <20250816-wb-drop-encoder-v2-0-f951de04f4f9@oss.qualcomm.com>
In-Reply-To: <20250816-wb-drop-encoder-v2-0-f951de04f4f9@oss.qualcomm.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3013;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=FAStH94G7STx9dmih1BwY2moi+ekwJevO6V7oZLap5U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBooKGIUlMQQLFiAtbFNdCE7iTeLG5NXVUIOYxXM
 6vF5Guen5SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKChiAAKCRCLPIo+Aiko
 1fS5B/9UEdB+BuXCj2ytlEfQ6Knryb/dViwFtPKUeb5r+e7VL1yRxxxT2kglrR7LNYMiS8Ecly9
 LHIp7j3MT33mN8RC2G81OBI4OYtosKhm7rokBbqmIN41yeqq2u1bJMK8qMo2JqOiK9qcSM9vZ8r
 SPIxl7ppjQ6vU1W5glfl4pxwjQeQvE8Be1Bo6s94TZCPzc7eqIe0BBd6re6aID8AvZkrbDyYVWv
 weP+MlXsuCXqWcP/RTxNkuwcueGDhFU/SuaVfTwJr1pI3asqMrn0GD83quiimxOrlD7Y/6SLA8b
 unH5GSZVhqtU7/2VAXZm3fwx4gf23rPpFp6ql62lXHM9YY54
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 5Olz-zfVzKkERUW3B6zWO7KLcOKr3gb6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfXzS86qn30/RWG
 jbQtSA7rTZAetR6il/5ldR9b3ABSUeO4sXNIBXM6bl2CR3qPyfv7JvcpwS4WGUxn7465rEvnfhO
 tC22pDr0hSzRbVNoNHSBxx/ja6fKEGTBagQtwzKevo7HVzOX3vm5ajqWopRJoM8PlcAOVJJaJ4m
 SsFS31Sm4FQrdtjTvse8WIDn1PjGLULmo8oDy+cElO9VdECYQ6nHUMR/6qW0ANiNzSXGI/lz6yR
 2MDi7BuYUFKl7gMcYDUbnoRBMq+O48Lp+Vk32gGfGVs7h0jA6vjSNAklT6LtC2CKQ0/nyrfixQB
 hbmBGOyFf1AgnQqv9hjX5slkJ7UAzYTjwS7jVDUTsPGAkzDJllupDve15uONtBE5bPGj5oD1I7Y
 VkfQ4QWz
X-Authority-Analysis: v=2.4 cv=a+Mw9VSF c=1 sm=1 tr=0 ts=68a0a190 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=QyXUC8HyAAAA:8 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=EE5oNXVUeA2ILyHCr4wA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: 5Olz-zfVzKkERUW3B6zWO7KLcOKr3gb6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160020
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

Use drmm_plain_encoder_alloc() to allocate simple encoder and
drmm_writeback_connector_init() in order to initialize writeback
connector instance.

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../drm/arm/display/komeda/komeda_wb_connector.c   | 30 ++++++++++++----------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
index 875cdbff18c9dc97e736049feaa8a1fe1bcc82ff..bcc53d4015f1f27181e977272cdcfa35e970fa62 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
@@ -5,6 +5,7 @@
  *
  */
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_managed.h>
 #include "komeda_dev.h"
 #include "komeda_kms.h"
 
@@ -121,17 +122,10 @@ komeda_wb_connector_fill_modes(struct drm_connector *connector,
 	return 0;
 }
 
-static void komeda_wb_connector_destroy(struct drm_connector *connector)
-{
-	drm_connector_cleanup(connector);
-	kfree(to_kconn(to_wb_conn(connector)));
-}
-
 static const struct drm_connector_funcs komeda_wb_connector_funcs = {
 	.reset			= drm_atomic_helper_connector_reset,
 	.detect			= komeda_wb_connector_detect,
 	.fill_modes		= komeda_wb_connector_fill_modes,
-	.destroy		= komeda_wb_connector_destroy,
 	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
 };
@@ -143,13 +137,15 @@ static int komeda_wb_connector_add(struct komeda_kms_dev *kms,
 	struct komeda_wb_connector *kwb_conn;
 	struct drm_writeback_connector *wb_conn;
 	struct drm_display_info *info;
+	struct drm_encoder *encoder;
+
 	u32 *formats, n_formats = 0;
 	int err;
 
 	if (!kcrtc->master->wb_layer)
 		return 0;
 
-	kwb_conn = kzalloc(sizeof(*kwb_conn), GFP_KERNEL);
+	kwb_conn = drmm_kzalloc(&kms->base, sizeof(*kwb_conn), GFP_KERNEL);
 	if (!kwb_conn)
 		return -ENOMEM;
 
@@ -165,11 +161,19 @@ static int komeda_wb_connector_add(struct komeda_kms_dev *kms,
 		return -ENOMEM;
 	}
 
-	err = drm_writeback_connector_init(&kms->base, wb_conn,
-					   &komeda_wb_connector_funcs,
-					   &komeda_wb_encoder_helper_funcs,
-					   formats, n_formats,
-					   BIT(drm_crtc_index(&kcrtc->base)));
+	encoder = drmm_plain_encoder_alloc(&kms->base, NULL,
+					   DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (IS_ERR(encoder))
+		return PTR_ERR(encoder);
+
+	drm_encoder_helper_add(encoder, &komeda_wb_encoder_helper_funcs);
+
+	encoder->possible_crtcs = drm_crtc_mask(&kcrtc->base);
+
+	err = drmm_writeback_connector_init(&kms->base, wb_conn,
+					    &komeda_wb_connector_funcs,
+					    encoder,
+					    formats, n_formats);
 	komeda_put_fourcc_list(formats);
 	if (err) {
 		kfree(kwb_conn);

-- 
2.47.2

