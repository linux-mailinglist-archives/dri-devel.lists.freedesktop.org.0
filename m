Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B321B182C9
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 15:51:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7419910E871;
	Fri,  1 Aug 2025 13:51:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VjJ+wtta";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17EF610E859
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 13:51:28 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5718mdLH001318
 for <dri-devel@lists.freedesktop.org>; Fri, 1 Aug 2025 13:51:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 W2UCi+malvB0ar8bb6DW9kSFC86prf8rvHe8q8tIWaw=; b=VjJ+wttaMaAyvo/w
 Jp5kH6NjJ4kszVYIFnbCxOw0/E9yoW10FgZrcO5RLvi/Kbfr/mAtYEMhvVQumaXH
 nQTyvuYeFYE+0nKGN5x35T1Nb4xPytiW8wf3Lu2PeYUrv4HItVqM69zKgjh33L9F
 EhpSEqU6KVVLjpnCG1hPIWwE+uLMC/ZsecUYpYeCqOz+c1bwDjU/xJbFsFllXdIG
 0ejkdZE7GPXkgWopZyMVGb9SKvOBA/zITP2odOuNECJ2nzvXfnCQBP9Cw4yUMUDx
 C0VDjmMMHajjU7xu4hcazhSMOkazuUh/7L5TVGL52BG3mKjFngQ1sLrW2ff2r1GL
 cTNtEg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484nyucg5n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 13:51:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ab844acca0so15500491cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 06:51:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754056286; x=1754661086;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W2UCi+malvB0ar8bb6DW9kSFC86prf8rvHe8q8tIWaw=;
 b=qshr4flaAsIrA+CGvqnOe0O8Wc+ozNIYupG9DY724LlOSxcoehiauVLeqttEh4wO0g
 dMFQti0VFT6SjWogCldTJ60Tt3XruR5dHVpDeAvtBQbXpusemfCtd8xnhG1RcMGcKBRT
 M2Sdjrhhz1QyktALL8t4ekGeHq+fBXFYGMhYwGsizJ35QBMlWT+PGEy4KxWB9GC7kK1z
 UDzBMTDTOysFt2JtcQ0oRE2RRRqJ9kLjMUd+qyR5ONjyNZLFv06HQRzwoX6ADPcrz1T0
 L8jBbcBzFPk1eso2p8CpqQAdkR4BUxDOpsCgpARhcQV5XzvOS7QMU8ywxQKmuGcsbcs9
 +1Cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwxQppT9fsH3hCYUGdoiGO5Npvd3Cc+L9dvmacBFna51VsekwiCMUbuyhlg0u9HITP7gXAddQg6As=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzcWX0GL0qoaJj+KcsYLg2Db4jYwG6D2GaMjH72P0dcIerRdEOc
 QBiBsYZ9rBBtc0Lcg8k4M43Jx/zGoVy6ScBhgaheRNpFkPVA+Te6AXXVyhlXD+JkWnu3NeLo4Jx
 xP8gTmSRY/Hgjq+KIitxiE1oKM+L6fjlGNkPalE0C4ozXPl5KHhnHgyolLB1T2Bj6KF3CT2E=
X-Gm-Gg: ASbGnctffLb2tlXlUrRY5y9hjm9YtX04Vo8G5uxc/DArc4r9HyDGuUaTVmrT4O+u2fE
 avIZK3K0qnD667TGMZ4AfxIH5KvHyvNGbBEFpBMQ1Ftbc6w4Q3CGJTj8mtYE6xvjKueMmUfV914
 TBIpzFfOAd/GLwUHx/QAiFuA4KBVk67Ts3dw0FBbbamyHXeZ7OHnVHaXZ04dH1a2+czWADRIfe9
 HIKZV+dqxtxTnbnQf/XGi4RdBwyi0Q/q609QhwY5sW6sgwPcdSTMRM4QeSQZE0TRSR8slDWrM8M
 g6epFR3BypXlA0x+VDt36usMtWrbczTyW17l196WwcC3q4eeb5gECcbTrsWWZ++hgpF0tatD6QH
 bddLrTgJYytLEFhHmJWhXwohgoctiOImy5EzYgAKMjtNDo+2qfVBV
X-Received: by 2002:a05:622a:4fcd:b0:4ae:f1c4:98fe with SMTP id
 d75a77b69052e-4aef1c49b02mr76647921cf.34.1754056285929; 
 Fri, 01 Aug 2025 06:51:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAwqWqcrYsHbU0F2gj2xmMxu0CXmwPTRpB2ryFYEdGwGRHG1UFGg9MBUQvZBikakoqd/cRgw==
X-Received: by 2002:a05:622a:4fcd:b0:4ae:f1c4:98fe with SMTP id
 d75a77b69052e-4aef1c49b02mr76647531cf.34.1754056285484; 
 Fri, 01 Aug 2025 06:51:25 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-33238273006sm5917801fa.9.2025.08.01.06.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 06:51:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 01 Aug 2025 16:51:13 +0300
Subject: [PATCH 5/8] drm/msm/dpu: use drmm_writeback_connector_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-wb-drop-encoder-v1-5-824646042f7d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2200;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=p1vIn/pLBbJ5zOAwN/G9XdaGKb83FPkfI1f2HSftzDk=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ0bPsWCx0yvsNgYcls5I+plW1j3Fjjm+X0px0rzqd0vs0
 k3EioQ7GY1ZGBi5GGTFFFl8ClqmxmxKDvuwY2o9zCBWJpApDFycAjCRty0cDE2u3dqvkrq7bmfF
 GxbJfBK+ZLJFuKaj26z4TYAFw/fJBZ2aYT3Gdf9/PWAxvbefn01Pz+WJmX4Nh7rCawmJhRy1706
 af0ncqHWyLqckPz6+/8blWQf0tQ+x+89a5TX7S45x/TNzlh3qyeFRl37Ezzy08rXZJ8bL6ooyoV
 EfHX5Ebo1krQ1gmbFK0crxnYXlZhXrdSGia/STswu9wpY82y07y9lQNGfJ8xOBFYyxVkrZOx+qb
 Vw16+qNB63ze6WmWzmfX/E88/ZurZg1MdG+O4LnBeR9/WLr+eX0wq2SAr+u6EnEO5o6eYV8PfnA
 vv3RupYU979rBV5UGpx5cvFAoH1d+/sSiX/KJit4UycDAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: LxaVPwggGryVW6svnjtLxwC6ncPFBt4U
X-Proofpoint-ORIG-GUID: LxaVPwggGryVW6svnjtLxwC6ncPFBt4U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEwNSBTYWx0ZWRfX0vSp+VD/SlIV
 cS/nYuIFaHBW68Jz95Lh3Yfh73Zk8KemXrIztRp6YYwf9cXvuAKZPYVKvfCk9M/cyMzlZ9kBTKZ
 Rz3hxaKOEmnbv+6yI5R+8+PW+mUyAXUVta8chBef3dU40ZNQJXw3q5n4Mz1BxWjbbpneyjzR3CZ
 l2JtsBvvsSLvpZYKASkyJKWzzH4u810S12ZE3OzEtnC4CymTdb46ncnOiP0Q/cK9OeC4VEB/2y/
 3HmtlwK0MQEC5io5u7ATP6EF9yxoOnA6njjn8Pc1p6Be/8Img9ntQSvTkJP8y54UrOHH2qshby+
 C3jkkw12Y2qmwfr4xQS9IzMIh2l05xGR0YzhkZW8mA4PZYKytW+3dx8EzyBqGwi8GikjGEBCblk
 9v+nhSeINDXvvLisMzxFmOhH9Ud5dMjPIx6vS7HSswNVWBHGHRXsNZMqmVZw/yJZGQLMUV6Q
X-Authority-Analysis: v=2.4 cv=CLoqXQrD c=1 sm=1 tr=0 ts=688cc65f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=mhD89yN676IZukTL2GQA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_04,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010105
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
 .../gpu/drm/renesas/rcar-du/rcar_du_writeback.c    | 23 +++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
index 8cd37d7b8ae281cbc1fd8cbb243c621174517e23..9986a10e8114680e9da48986f4ca3ce6ec66b8cb 100644
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
+	encoder->possible_crtcs = 1 << drm_crtc_index(&rcrtc->crtc);
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
2.39.5

