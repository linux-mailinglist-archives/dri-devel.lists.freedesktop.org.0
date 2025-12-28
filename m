Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C89D8CE53DA
	for <lists+dri-devel@lfdr.de>; Sun, 28 Dec 2025 18:21:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B6911AF90;
	Sun, 28 Dec 2025 17:21:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uf/tp21T";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kp7awoqH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2168A11AF3B
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 17:21:46 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BSGpWP02583476
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 17:21:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CGyPL6KHRYRMQ39eO9G7zyY0TeTIkBgeR3+nmWeanBE=; b=Uf/tp21TzmBWEvgP
 Ggk1niZyXxbf3GCIJK5GcXRvaAkv7i15eT7pfYRdqlr+bTqB4vqzeGeFWOsLhWqi
 5TWVSKDykWL7DoizFvJHUYoviNu7DsrrYV1ELCE8T/aiP2xhE2v3i24MxhDUvc61
 BoK4EoM+GkX+OyrS8tQg+geE1N9uzYEut/MxxrFuFJvfVys8oYCjRk5O9jfXB+om
 ZdKQKF7Autqrftsos78szIQt9s2xwHC0eeMn7PLgTZ7CbyCvNuZdnwzboCHZjGWI
 3VT2PqngpmzH5liozgleHWSiYMDgm0OeBDK/MtqJzEpK79/QThu/ObH/qINGTsQy
 2SKz5Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba4tntp9u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 17:21:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4f4a92bf359so193173771cf.2
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 09:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766942504; x=1767547304;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CGyPL6KHRYRMQ39eO9G7zyY0TeTIkBgeR3+nmWeanBE=;
 b=Kp7awoqHK0sTf7olXB5dIFN4RdDXxe/OvAyWBl4YdhOkqTJreSnPaEHuvPUNgEZTU+
 UneBV2vW4qkAlfxyFj/E+h4LQNG2WeqYZlqCGzqTpwPqWO1SvIv4oOkqL72lvuasfE+B
 VA9gcBFHva1dDxb4dSw7SDSGurpefRBeKAcgp9fi36INt+rh6XMMyPYg7lmRWO9AszJr
 bCyz7JcauE3iXIz064jfiIqvrbf+KeSGm9bj2uOa8/U2/Lg0X0zTp3XjxOttJPuczhV+
 dcTu7E2vCpeug/o9J0kKopwixpM8Ezx8U5heRV6RrfPQoxJkGk/uVj8Y+BOT58zhkCbt
 Q6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766942504; x=1767547304;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=CGyPL6KHRYRMQ39eO9G7zyY0TeTIkBgeR3+nmWeanBE=;
 b=bY2X6wiCLOuPzKNPWw60X7f6QGL3QAZVdigNxtiDpbjtGQl+yG9U0xAT1iZKePGZVF
 rDXOksgvyz3z32VHveEMCkI82iU4HvhhmLLhP4UzMGqKw8UKk2Y44+Bajn/qpadrIUFb
 wk9BqkOWRNE51H7B6N/HwvF7UjvuL1iQdXUDAhZvflG5UsTvAPchE+wbxo/62wQkjw6b
 v54FvnpFgcGf7xhx8bjaoIJm6pkQPb12EFr4bqSskz4xkNt5HF8XsLBdEvS6CqKBKfwR
 AZtCpesTh25jVJxA4s2Q4QMIltzRFsu33R1qzuMGw6JOzg/GSMRTFNauf9nH55sM5J5h
 iU8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXymTjPKt9XTjiyix798QNhd+hUQaQEr0D46OOWvG9Zh0uVPh/rbiIrdM7oJQT1ReKzilDTub8sX8M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwG36q2rpYFzGVEFe1ipiEXnyHPWo6MB8B9VC7RJrM0q9zuE5f8
 pEYuI5op9Zmbh7mL1t6LhPiY/Pez49tMDDw7PtKZLs/60JZS1T+JF707Ngma3rOAeIgYFACS0SP
 4pInB1alt6nawinq9e05L5O5w8Urc6GAKIPrBGtObmzZ/GD4fEteJuFEa0wfEg1r6lmw7OEc=
X-Gm-Gg: AY/fxX7+YDZ36FWkt6Z3vdIpbBzxRleH+V0cmRHcVruCRuMVfl04g0sgoaSVkEhwm0P
 GPvyxb+3gKVNOsxOl4TfWZ/ACow6BWx934GDpKExvyZe6QZYmqFL5YAwVEydTx6cPAcsLrFnaQp
 MzMtatm4etmw8PbMa3g+MGnSMiVkSiPHC4s/hJ0tG1C/P2cnG5BX4WIZIajqmzbR0d2j+ALaAfZ
 Kq0DQdQl6zJ3+d1kQgn2JowHFMuxKfjnAYpJBKPx/KlI8t3F1fJh1YCxvez+7lGNtdePhjWIQbs
 09gyZw6OpvkSMrGfM5jodMZoRs6iRLa7LsIS6JekHbfq8B9zKfqhXVKnXEFYLmjtkOg4XokB2zs
 BhX11Kz/xHZORAyUFNzuuVQeqPyCDjSgiD2rMLgEBr8bZSnujEWdAlokG5xGKCeKq4kQH2z3mbp
 Xac5zbcnyGMfkzUOg4fKyq+M8=
X-Received: by 2002:a05:622a:180b:b0:4f3:58e4:a35a with SMTP id
 d75a77b69052e-4f4abde3e12mr414052981cf.76.1766942504523; 
 Sun, 28 Dec 2025 09:21:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECq0Qmt0XAxFswq1cu73NAKtByntaPjKWodblDIcL0xgfkkSH03R1wkbkJ182GBH0vNXPH7g==
X-Received: by 2002:a05:622a:180b:b0:4f3:58e4:a35a with SMTP id
 d75a77b69052e-4f4abde3e12mr414052511cf.76.1766942504089; 
 Sun, 28 Dec 2025 09:21:44 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3812251cfffsm76871031fa.19.2025.12.28.09.21.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 09:21:43 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 19:21:35 +0200
Subject: [PATCH v4 3/8] drm/komeda: use drmm_writeback_connector_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-wb-drop-encoder-v4-3-58d28e668901@oss.qualcomm.com>
References: <20251228-wb-drop-encoder-v4-0-58d28e668901@oss.qualcomm.com>
In-Reply-To: <20251228-wb-drop-encoder-v4-0-58d28e668901@oss.qualcomm.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
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
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Suraj Kandpal <suraj.kandpal@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2957;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=eBzpPbb7DQH4mV13wWJlrn34m8m6zEyV2uFIH/bk69w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpUWciAKlQsujWkOpLqHFrKD2XVuk+2pZawHVG4
 1UF4s0FzrOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVFnIgAKCRCLPIo+Aiko
 1Un0B/9wVD3LDimX5fzl+PflgjNQGNawH3LkDsOTuXS6mmAMJoOmVBnrZPVZmArDidHcXXPDeRQ
 8L712inmPVorbB+TBGXSGmaOjgkijlxEn4yrVivkSySd64MuuYqFe9fCR/0h1pzO5Ah/fhgDG/H
 NhtHHzJ0PSJsRjGwjplpouC5WpwouFW8FP3+Ow29Cw0LfLlTjzohyH28PwIrOy8YKDF3wBpFmZa
 klWf9iaFvj1N9WY2IZoSXXmrXNcuce8p/EVkjV2hsRb82YJX9P9Y4iZNXVKGkwMcHtP3Gp2P+w1
 OpGRCWk9mpNvLaUoTirYlk2vfUZrrS/pK+A5WUQwDR+Rvf9Z
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=G+YR0tk5 c=1 sm=1 tr=0 ts=69516729 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QyXUC8HyAAAA:8 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=EE5oNXVUeA2ILyHCr4wA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: VknkctiMGwTHH8EoCq_wA_ofXWxDZrrV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDE1OSBTYWx0ZWRfX0k5+gXgXfxUS
 5JxmuZwiM/XdrWYLIEzxbTpsc7v1H9LT7IkKTY4md3Ph+wdQmCno0uVHZZgLrxOWPPfZS8DvldS
 hF/S+E+dBFG3eZDve4TPQ0bX8ev/Qy49jl4pUA+sDZkgDK4XA8PjLXZoAQnvYStqxojiIhTEh0g
 vZz00u9/l7BatgKffb4WYNL81qCbdmaQ4++o+fFcOc5W5EvdstUUMMIihu+d48WEJhGXVPYrrhu
 eraK+++0DUFAdVpYxLL/dLwhrEWRVJWJ2aKtp6ciWdhRU1byJsdiHQxfFxofj0eZFr4CnKZFiO5
 jMgBYSbfNOPgOfDCH22gdwG3t5lhEAAPPg5LFH0T1Jy4jw+X/AFj/eU5nLTjA61kzD+LHZYJEDL
 ZKjDgJpNWpxKNJ2tRVRroP7QPz+BKovqE4nqefbKKKqgO4MKBtktggkNMvO/XMBKttOLL7NKyiI
 xjAkXfHEdij53qTamEQ==
X-Proofpoint-ORIG-GUID: VknkctiMGwTHH8EoCq_wA_ofXWxDZrrV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512280159
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
index 875cdbff18c9..bcc53d4015f1 100644
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
2.47.3

