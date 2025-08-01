Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC219B182BF
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 15:51:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDFB610E866;
	Fri,  1 Aug 2025 13:51:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="A1K+SC7z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3000D10E860
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 13:51:23 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5719gB3M007014
 for <dri-devel@lists.freedesktop.org>; Fri, 1 Aug 2025 13:51:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oABhVeMhuZm6PTbnI/8btR4aN+7HYVmKHbDE5K4ACek=; b=A1K+SC7zD6GligY/
 GPqmET/omO6fzaL/xEUI482+gFAiZJThvM9z5pH9qdUiTFXjW5Rs4k3pjBcuyHLu
 N6CzocO6EDUiGpSlSdxWNTDbxPOo8AjShY6chKLTa5bfHzhCW7mgID5CgaX6KCCT
 VuYAUC23I706bpUbkvAexLDnKaFwsA6xbDLOo8eOK0U9H7yUAY4k0cexzk/1rcdc
 idAA8UDogPmeEEHbYVgnE0njWXQi4DbjNXxrzpyPrOPazxYrweuMlI0PJuFiwtL3
 +LA+xfwJkBx/aLuYLww/sTwK2LCTX6gc6fljBzA0V/t1xzv9EbbfSA17DEv7S2id
 w1CFdw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 488u650pkj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 13:51:22 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6fb5f71b363so19414946d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 06:51:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754056281; x=1754661081;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oABhVeMhuZm6PTbnI/8btR4aN+7HYVmKHbDE5K4ACek=;
 b=gKRrCRwvcCOu2MBfD1yqPW5wvw42yofOYGzeaT08CSG34YN6pdxWVfLKlsDfC9f08T
 DQDb91Z0Bgq+d7cmlG/CIiPA9mPkApVp2p3koDaWfoh26S/qBKYYH2gmIWn2AfuIFmbq
 JuRSxivOVEPVRM1/F3Qp64TDrgzXVtw3fS1cR8HPu6c0okBuyBlD1UZ6otzBTHCRStJI
 bQS5nPMr0eAE4o7E9GLVRP9UtxuPa2QfZ1adcbt4miJs+0wGbUOeDnDGle8i/CvkLqCm
 43MKp9B7CRuh90t4L/r8wMlHk/Kwxo5G0GiZUwozfInKoc/ylBU6wH7rAWXtuIxh3GkB
 NfRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8WuxA7VMCXp3qG3B9Dqvt/wa2gP1Zw6AOUc6yu6aZZCevcNqFy/YpZccCH+/w59FM05oWqHGXy2Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzARSq6lZF99TAMWyARRiXRJblBpwaQpubu51BXK4YIjzi/D2nL
 8k3bDXuh+O/oSaAiuV93oD/kPEUWmOf/kzg0IXosE+x+5lWZ0UGpflKL7CbvzJhECsgQY197Usy
 /WCJVoXSqK2KoOkhGUnt2sAigSHZ9AkCHHohE+lJFzT+DQ2lgohdNoCNlJUZyVFbPnXFJqvE=
X-Gm-Gg: ASbGncvyPchkRfVMPX5hTIPHlCjN4hnUuqmk/gOHGi6ijVua6LtIVgMT5RElE7YjWEb
 9Lwqm5hZG++YEWgAb8EE1/DEmCXrSO9PAeNV/UFjVMMsMChAArNAP+B+5LIuDjgRLbUFiIEeBXI
 t6DtvHxPkVrIQ5JsFQ9PB9fwHAFOlgSaVk8jSwQNGsiC6zRLF0uL4WrKmwb94CFy/K5JKmQsNwf
 D9hGJitjkOcIGFbSJQ7jxT6O72TKvCJ3HPQuwDahU2h8GRbsy/XAJG3QcR83ZhvGxbD60y0MYje
 Vvun56/N0zh4oUzW/xRuxdNRi16sJYJ+wDxXhk1mk9qrzcOWBnOEBEDgmW8oXVvfZnd/pbJPDcD
 arg/8QjIvlnWEABf3AfH3UUEIVFs6vfOGq1VehGzRO9ksluOb3Z9v
X-Received: by 2002:a05:622a:6090:b0:4af:a3d:9f94 with SMTP id
 d75a77b69052e-4af0a3da105mr12354521cf.50.1754056281382; 
 Fri, 01 Aug 2025 06:51:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG52DSwGwk7HNvgjkCq+ht7oyq6LU2s445ag3X2y//8N4s5HAyIOUu28Pz6VZOfWywVilLC9Q==
X-Received: by 2002:a05:622a:6090:b0:4af:a3d:9f94 with SMTP id
 d75a77b69052e-4af0a3da105mr12353661cf.50.1754056280680; 
 Fri, 01 Aug 2025 06:51:20 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-33238273006sm5917801fa.9.2025.08.01.06.51.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 06:51:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 01 Aug 2025 16:51:10 +0300
Subject: [PATCH 2/8] drm/komeda: use drmm_writeback_connector_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-wb-drop-encoder-v1-2-824646042f7d@oss.qualcomm.com>
References: <20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com>
In-Reply-To: <20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com>
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
 freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2909;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=goFFEhtD/Im3N1nsgGMsKddMGY0uKGtsCO6KqUCkWNY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBojMZS1/Pfoit12OsSUjCvlkC+n29kedgBSwC22
 eCp4uNngN6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaIzGUgAKCRCLPIo+Aiko
 1VxsB/4+wGaVMLsVmpV+09A3+p8+foUBQSgFcdvA/I4/t5sBLeSCn+vn1JqBTR0JDVzGYK1vbkk
 BTWUu6ath0wbCVud8VRfTvlyySY1vUcez+mErbsBg45cP+wX3u5TLNpED0RVfbzxupTDV73iK0H
 seidFyUwfyX/E/LVPD6/ADYUNls6a9V+LUE8vk3HZ4mj77kQTZC6po3gv39kemSn2tFATpftS4e
 m0UN5xQ6ot7oxvZK6X6c4Zg1bwX7jnrbXPWb1OBC+2+Nd5Y5psNhY49pZgmW2815O6Zz5gB0iHI
 7WHR3RawPjs3QOkKKEt3YoK99Z3wcIgiSjmAGenNpj8/MdDB
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 7I-qiIgGIZ6iNq4Oswc6vBGHMFpAjPjj
X-Proofpoint-GUID: 7I-qiIgGIZ6iNq4Oswc6vBGHMFpAjPjj
X-Authority-Analysis: v=2.4 cv=f+RIBPyM c=1 sm=1 tr=0 ts=688cc65a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=EE5oNXVUeA2ILyHCr4wA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEwMyBTYWx0ZWRfXxJ6scHzm+HW5
 UiwALbbLcJrFkioO2RyJIVq7tWpllj5YC7G+acrr62yiG7i+H8JEkskB3/nj49q6mRfQKT/zEwD
 53lNWiKbLOZN6Xt/RvNjY3MSUBIgNRQ1CEz+Eu6iRva+M+i6wNihIyfXWcNkVR64seBVznRexGs
 d7b0UzEVAYkdXoPTrBvZikfs8+CxMeaMl0haRl+oF/D33HfY7ByfFGouCHnDZ1pRH0RXVVr4cQ/
 dV+0BsxHrtkDIbPT/dTlkmsKzq+nf7z58urTXCitFdzWMbvw5f/b+PpMEse+CwCGxdTfl7sZQkg
 X2UgDJ1/A1Qs0jG7wqAjdmRc1iYluG14r1OSmevioryK8a46/INnSKPSLTiZ4wMH3noik2mG2ri
 vVxky+7OiUTNpQXYpzDYD7t8bTlVR2bUXF4+gwf8HxP3BMHFltXXDUTs+rUBQCF1/slBYN/7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_04,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 mlxlogscore=924 mlxscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010103
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../drm/arm/display/komeda/komeda_wb_connector.c   | 30 ++++++++++++----------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
index 875cdbff18c9dc97e736049feaa8a1fe1bcc82ff..210841b4453abfe60cecc1cfc79a84298be3e684 100644
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
+	encoder->possible_crtcs = BIT(drm_crtc_index(&kcrtc->base));
+
+	err = drmm_writeback_connector_init(&kms->base, wb_conn,
+					    &komeda_wb_connector_funcs,
+					    encoder,
+					    formats, n_formats);
 	komeda_put_fourcc_list(formats);
 	if (err) {
 		kfree(kwb_conn);

-- 
2.39.5

