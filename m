Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59895B28EEF
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 17:19:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8450D10E39B;
	Sat, 16 Aug 2025 15:19:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="X5Gt1UWk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2315E10E39A
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 15:19:51 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57GBfS1Y028170
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 15:19:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qV+1O4itHxYPrihyEQKWirrQ3uqLooPtU+1YJ1+NTiI=; b=X5Gt1UWkBtIMJCFm
 C8L7MumhPmhoSG0JDTascQfKTI9hjhrhWUT6gbrN7YuPvnXR3pQr58i47YtlolQN
 M9404pODYFr7CzBpOICBjFPwepXwNswGlCBnmColodWNtAyZq4hzs+pl3ogNfW1B
 Io/VFH5qHPn8Udg6EQBqcsDBuFvhSkQ7tDwwZO4Rkx3N10j592iQjdPdOJdo4mJi
 JbwZTzPi0guL22dBHpQqI9VBC5u/2JMpBrd9evWVZ4EkZats8p970cEjfmK6BnTz
 zHr5v/oy9oNz1LO9J1K5KBBzMAnmEk8OU00Cj/P8XIbEGtcxNzGBH8cx2XShyKbj
 O1rWgw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jh070w58-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 15:19:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b109ab2cbaso78257921cf.1
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 08:19:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755357589; x=1755962389;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qV+1O4itHxYPrihyEQKWirrQ3uqLooPtU+1YJ1+NTiI=;
 b=v5m/bGYURTrgAWEdHNd8kGAWxjQQTct4mAE7VpJ/5UklBv/55U4vV5Cv6yyBuTjPIS
 SZLscBNfcJphog4FJ+t5+6NL5479U+c758eKJjBN8D/0wqocWl6tE/mVH8EXtEGLgstM
 WZ95OPxOy1eg6fVe98sRMFSQencpfzkN8ZFNviRrArAX4C+5jZowGQ0QKiumYsanDl04
 OCe8X5S+bo0HX8BDCSkCvIj2kRV/FALXeZeJKs3eoMj8nL2q1MN6UR3Z1jvVUD9kY/Qt
 ljze/ruCzufGOXUVS5q7d+ki6YE0SHsVJKqL1+zP5ThBcc6jTOi/RX9f8LcD/17tFoyq
 P/hQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0RMUlTneENVoF0gAiyVmeoQNOEehOtmpt1MriY/RTJOaIh2ISTkbKiwHLNdakrgeFv8bdOraX0K4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYjSW0Ii5x6M3rSNKw7C5pymoRwflqTSOQBXmg16PUz5yl/dN2
 RON2Kgv7aTr00I4NcteHla46LzVWf/LtK+L6gWfdxjRbBLrETbLaXccpZCrLx2FDUhrCy3k0uIh
 MyBeKWp45c092+qZ/wVvs3HtrjmcO86+tjxCtSTrB3EmqgbAEp3Prt/liKXOr/E2Ehd4mx5o=
X-Gm-Gg: ASbGnct3fyoYFfsJbWC8MuHSYCmvj3POrkeh3z94ZP3itGhM1es9IQ8gvPw50+I+9zg
 EdOILYIWmXgqUtYefLoQwXLvKl8epO0m3y+KbAVoX1iEaJ7rGF0dN/Lu3uXx8lwwBUnAVyr862P
 TKyiNcu3fFRM44mYO1cPh6DdFibeUTXvipXoBZ7WmJBX0RdP1WNJ+INUsddcjpX4LB8j4Ngm6rK
 yTvG6cYV+TfwWwNNxpAxzFrOZMLJgweLcLmgGvTZaATlSUQuPCyVwmZ0mixSjt4Biy+POsU4G6/
 FaFQiBgPotvFVKmSpHJuXnwC5ceuMc4PK+5Ngyjkhg838rQq2iKwaiQ503Kw7/pPLTRYTnJALNN
 I1EaQurOK5JizRiruTx73J8Dyao1VOFYVvWixQFAXGwzOYUZgwBK1
X-Received: by 2002:a05:622a:1803:b0:4b0:69ff:eb71 with SMTP id
 d75a77b69052e-4b11e05f86cmr89079211cf.1.1755357589288; 
 Sat, 16 Aug 2025 08:19:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4j2k4YAYzpQ0pMCPbpzOT1o6CdrG9QkvoXk17IoZ7zfFypPLXZJtxqIY6aSy3p+i62FJnEA==
X-Received: by 2002:a05:622a:1803:b0:4b0:69ff:eb71 with SMTP id
 d75a77b69052e-4b11e05f86cmr89078721cf.1.1755357588831; 
 Sat, 16 Aug 2025 08:19:48 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef35965fsm907579e87.37.2025.08.16.08.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Aug 2025 08:19:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 16 Aug 2025 18:19:39 +0300
Subject: [PATCH v2 5/8] drm/msm/dpu: use drmm_writeback_connector_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250816-wb-drop-encoder-v2-5-f951de04f4f9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2304;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/fLUas0t6+pmOh4Lpow6ATkHgTqazIs0UqCL1npG8PE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBooKGJrX/EOza+6SHDDyhh3b0F4k58JM15op7JC
 zsrf9qs2FKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKChiQAKCRCLPIo+Aiko
 1RPCB/9KsE7LBH2gz3/CuiP3n3VWw21nUSaR2KEoT3QNbRnJ3kkvF8BVfxyPCfMPXyL8GP8+X+W
 1eo7ACU/9lwfSLQKW1Gnv3ZPNYawwta+UR+hdHck6Lfeu+kPxKKOyqfVp+p+zVXa0SQ93cL/NEf
 JS8K/7gj1Mb0FMolDe1qPEfHsG8P8LPEiTcY1SzvEDp94WNhqZe/hngjRryF042P4d0Bj7worm4
 akTK/ST6rN9abWTt+MI51ZZc9SW1GkAGBQM6+yP9YItM403Q2JqK6zELkFGY5AXyQ8ICXLx+5Rb
 2lSOj6fPeztw3nIfRul5Iclrps8maUSX1XJImBsAqhNG89N4
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: CH9RdqNgl_yp549F8hgYhdEzQJ9hwjpq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX+vijcZhq5Zd4
 ygQq+zLOBxtaq1MdaBg3dz/xkasbn7LWi0qurAOgoSLAszaq4Mzb7ER3cO1Nyr/frtGPF++/aTI
 8mSH8MmUQSzwWQxnN7/GW61IEU+VmGxe6BwwYt9m/tEi/1uI1iCZbNHS3EvcxQY1WMg8vOIQZL1
 swkCaoXcpGYGGEQtRVjuCOrq/lZz1LUPvgpZ/EKjOASO7RzgYjKpNUDb/FHSW0CXcuFdnEKvZPv
 HEiW1Wi57tcDTMwNpiBFg/fv9fY5tkypfi4qUcd7T6nSEyZx3Y1VJZRkTyA1sniFzZ8C6WY9B+8
 xPEcQJN3MJJfZiX4JIXKbTj5AKqPlYQkJdbumfpEuz0ssbmg3Bdhco/4c64Uk4lpWb1Okh0eEfc
 G4WBG0a7
X-Authority-Analysis: v=2.4 cv=a+Mw9VSF c=1 sm=1 tr=0 ts=68a0a196 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=QyXUC8HyAAAA:8 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=mhD89yN676IZukTL2GQA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: CH9RdqNgl_yp549F8hgYhdEzQJ9hwjpq
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
 .../gpu/drm/renesas/rcar-du/rcar_du_writeback.c    | 23 +++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
index 8cd37d7b8ae281cbc1fd8cbb243c621174517e23..64cea20d00b38861e22fc53375ab41ae988ceb59 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
@@ -134,7 +134,6 @@ static void rcar_du_wb_conn_reset(struct drm_connector *connector)
 static const struct drm_connector_funcs rcar_du_wb_conn_funcs = {
 	.reset = rcar_du_wb_conn_reset,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
 	.atomic_duplicate_state = rcar_du_wb_conn_duplicate_state,
 	.atomic_destroy_state = rcar_du_wb_conn_destroy_state,
 };
@@ -202,15 +201,25 @@ int rcar_du_writeback_init(struct rcar_du_device *rcdu,
 {
 	struct drm_writeback_connector *wb_conn = &rcrtc->writeback;
 
+	struct drm_encoder *encoder;
+
+	encoder = drmm_plain_encoder_alloc(&rcdu->ddev, NULL,
+					   DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (IS_ERR(encoder))
+		return PTR_ERR(encoder);
+
+	drm_encoder_helper_add(encoder, &rcar_du_wb_enc_helper_funcs);
+
+	encoder->possible_crtcs = drm_crtc_mask(&rcrtc->crtc);
+
 	drm_connector_helper_add(&wb_conn->base,
 				 &rcar_du_wb_conn_helper_funcs);
 
-	return drm_writeback_connector_init(&rcdu->ddev, wb_conn,
-					    &rcar_du_wb_conn_funcs,
-					    &rcar_du_wb_enc_helper_funcs,
-					    writeback_formats,
-					    ARRAY_SIZE(writeback_formats),
-					    1 << drm_crtc_index(&rcrtc->crtc));
+	return drmm_writeback_connector_init(&rcdu->ddev, wb_conn,
+					     &rcar_du_wb_conn_funcs,
+					     encoder,
+					     writeback_formats,
+					     ARRAY_SIZE(writeback_formats));
 }
 
 void rcar_du_writeback_setup(struct rcar_du_crtc *rcrtc,

-- 
2.47.2

