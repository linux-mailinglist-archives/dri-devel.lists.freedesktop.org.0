Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84214B28EE5
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 17:19:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB7C10E38D;
	Sat, 16 Aug 2025 15:19:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="R5IKICsx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6574110E387
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 15:19:43 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57G6CpUC010298
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 15:19:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ovJO1XSWvs0KNakJASmsJP5sNHD1z0QwbqY++5/N+xM=; b=R5IKICsxLv6COm9L
 PFZBk6sLP4uJR3A3VmpAMfp0N5eOTTrQoIkib5D+dYzFzDroTCmwNT6mTbwfFsaV
 X2jkvAKqoGclfm+vqCZlDyaZZ3futP8r88lBSkYl4SYqwzEGN9pqiEuSmJDnkrir
 7ltUcd+SwHraN5/tVW7PeCQj5tO2HGFn/JufUdzNJEpRzz6EiwiQaDCr1po3ah8h
 br8mCgAe4ipRPOkgnQK4hM+6YJ+VvbenEyGIH4sG7S3sd9+FZZoUGB4XVNM9k130
 toEuZ0l/whK3fJRWmEJ0pJJdoPbaAcWBHvI0oGZSZKD28mGs6f5stwEHkT4iI2wH
 5KDlfg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jjc7rsxq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 15:19:42 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70a88d99c1cso60966406d6.0
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 08:19:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755357581; x=1755962381;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ovJO1XSWvs0KNakJASmsJP5sNHD1z0QwbqY++5/N+xM=;
 b=seoR9K0UdBFCJ0pQDwGe7k0FLS3D88jZDdgdf3FpRqlqnnxG91lGl6UYnzh70qCyTo
 LDVqx0BHd2rF+qU6GOrHhWZ54Ux9KF71IemEf4cma/xjZxd4nO1bRZ6ArX1Mfokc2lLF
 piJ0Cjis4VDmMMRJGUIO2tl4aBbGLv6XVHSTZPapmuKlwfP5NE6FGTJ/922OAuwTT/ty
 vS4FAtjDmW/i8K3QWbjGXRMbLwGaSVP8V5FvP9TZnEvj3PLozrI4EUALEEflKRqrSSvy
 lCf3at1svOI2Th/6WY02fBYynOXizvrhI/3Rs7JoMwlOyeRH7knA9xzN1npvMWlr7Yaf
 rOBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqhNLY5qj3iUrs5FPHz99wJqVEwxSZ8CYdTWGLrFhcSVprwYVe5RgtGHjL4P1yIsoO1zOx7SptPr8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzD8auDc0PEHOK3LU2mc8VLcvqsxF6jNsTH32SLZlJl9c+hdjvx
 m37oCfqrVTDTW7t9vzVlpAtV2crSG/8g3o39UdE6ir+ocd3VlGAORlGv0uL1USEoREmOHR17DED
 BQvWfLx80ttnxXbq7pJogWBaHfFlSxF+LHI4O7MUmoqrfra0VSLVTCNA0DDEF8npNsDH58Sk=
X-Gm-Gg: ASbGncuWDXkaHjL8rIp+J/UIYeteIrf6sQPnY1DB3twpWTeGEAAtJKDWXEFLZCNA4g/
 ZZy+XvfQLUkfc+DNqe9Zwr4oolSwTdgXvelw/DhTGtMF5jzlxYXQKDmTB+Mq07jFUaASW41UX/C
 baIxdn49b7UXdB8y0npSprsA4uhJcghFa7M96k4CFKVAN1VzIyvCRJYsJZhgMQg6wDlAOZdI2Nk
 dMcQ31RsBHzniu0rHWsXadx/D+V0Aq7BX6edS+JDucp2tnREg57WMe36pxfpC61qHFAR5jD7lyB
 T3ljY26UM1foxoZomNK2ARkSeLy8faYsLIEMJaP2hFCDCFD1H4kRao5mtLYWN34QUgydzE4uMQP
 ghAHn/HMkvWnI6DsjRQsH20LgF5rR4j6d9Eol3XiPLrtcXFJn3Ed+
X-Received: by 2002:ad4:4ee9:0:b0:709:e3ae:d598 with SMTP id
 6a1803df08f44-70ba7aa107emr81267816d6.14.1755357581418; 
 Sat, 16 Aug 2025 08:19:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3L7Kg33TAOFsNeJ8twbLfA/y9ftS7KG9iciVNPJsGz5y06ZwF8dOFeuocvcqoStELWJ+qEw==
X-Received: by 2002:ad4:4ee9:0:b0:709:e3ae:d598 with SMTP id
 6a1803df08f44-70ba7aa107emr81267506d6.14.1755357580964; 
 Sat, 16 Aug 2025 08:19:40 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef35965fsm907579e87.37.2025.08.16.08.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Aug 2025 08:19:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 16 Aug 2025 18:19:35 +0300
Subject: [PATCH v2 1/8] drm/amd/display: use
 drmm_writeback_connector_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250816-wb-drop-encoder-v2-1-f951de04f4f9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3090;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pfarMdKTP3PKuK/rYN2PwD9JvqS3ROd0ZonPoWJ3yhg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBooKGIUvDNB5/Vq1AfaWJ5dhoQY3yskNwZSsVo+
 QLCjRWL1BWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKChiAAKCRCLPIo+Aiko
 1RTIB/4oPGhWfB4pdoc2YqsPw9ILKe6U6yn/zFh6rnIOtHWK7ys5g3xj+GRAcwBghHgjcQ6BzH1
 dehVbsEOedPhTFVaigfw2rPYmwG92pSk5kN5G2lc4oYNAsUF+DxFsfHK0loyjvrUkd2bFIT5jWh
 UtPLDKBtcuw/4M9zqa6ppMfgd1aVB1sibq2w7xnR7fuLjlHn6MugHO1j28LWmWWTpgTB0H5FYoE
 Olqr0/g4qa8uLRJbbDPzpY4QD0cdT0iKtnrU7KeeIMNItjD4P5bht0GvrFBxeS/39EluqjryGY8
 eMVdRGRldWpOy6kPBFf2IhPHsn6/CuNNAbV8yiIu6J63L7Wt
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMyBTYWx0ZWRfXysxrtcfz6IFi
 6Dd2ipgfqgxQOXAikkSKvqhwU27BDGdYVjS9VHleKKtTicTPHmpR01PVHLzbKv6zkpAgZ0ElbhS
 tJqdLJTk33bllpWN5qX1UsHej9mgEUP9sPl4w7XBm6fAU52zFxwT0Of3Kr/JZ1WAngEJJv3v9JZ
 Tgw9p8GNhvKRwOd0v5ThIhPl5BAOkyI3IT75sZVxrpi/sCwpPeUDd5ohfQVV6tTgVSozEAkJ3cD
 Av7p9ThX+l4P+lIXph+H+FaHhXx5jxffAiYR58xsSpqwYis2W7UssUZaKFI7x4DIiDW2DKY1HAJ
 rvQNOkfR/IhE7hhvUIl560xJIrEfn0K16T0eQG1eIdavukAO7WPKpbTA2YFrox93EqCsyuRFMqT
 L03P1H90
X-Authority-Analysis: v=2.4 cv=c4mrQQ9l c=1 sm=1 tr=0 ts=68a0a18e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=P-IC7800AAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=M-qvw7r3wQx8XY5Jx90A:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: 7ZQwq0g7RlD2doNqXUpPnzyIkFxRBEYO
X-Proofpoint-ORIG-GUID: 7ZQwq0g7RlD2doNqXUpPnzyIkFxRBEYO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160033
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

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    |  2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c | 18 +++++++++++++-----
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index cd0e2976e268da41f576624c50ef0c76ede67414..0c9d347b1efc804a28fb3095df94e543a19e4159 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -10006,7 +10006,7 @@ static void dm_set_writeback(struct amdgpu_display_manager *dm,
 		return;
 	}
 
-	acrtc = to_amdgpu_crtc(wb_conn->encoder.crtc);
+	acrtc = to_amdgpu_crtc(crtc_state->base.crtc);
 	if (!acrtc) {
 		drm_err(adev_to_drm(adev), "no amdgpu_crtc found\n");
 		kfree(wb_info);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
index d9527c05fc878ef6916782ff9fde847813938461..80c37487ca77c0494eaf769c5b9a3c53486aa52d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
@@ -171,7 +171,6 @@ static const struct drm_encoder_helper_funcs amdgpu_dm_wb_encoder_helper_funcs =
 
 static const struct drm_connector_funcs amdgpu_dm_wb_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
 	.reset = amdgpu_dm_connector_funcs_reset,
 	.atomic_duplicate_state = amdgpu_dm_connector_atomic_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -190,17 +189,26 @@ int amdgpu_dm_wb_connector_init(struct amdgpu_display_manager *dm,
 	struct dc *dc = dm->dc;
 	struct dc_link *link = dc_get_link_at_index(dc, link_index);
 	int res = 0;
+	struct drm_encoder *encoder;
+
+	encoder = drmm_plain_encoder_alloc(&dm->adev->ddev, NULL,
+					   DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (IS_ERR(encoder))
+		return PTR_ERR(encoder);
+
+	drm_encoder_helper_add(encoder, &amdgpu_dm_wb_encoder_helper_funcs);
+
+	encoder->possible_crtcs = amdgpu_dm_get_encoder_crtc_mask(dm->adev);
 
 	wbcon->link = link;
 
 	drm_connector_helper_add(&wbcon->base.base, &amdgpu_dm_wb_conn_helper_funcs);
 
-	res = drm_writeback_connector_init(&dm->adev->ddev, &wbcon->base,
+	res = drmm_writeback_connector_init(&dm->adev->ddev, &wbcon->base,
 					    &amdgpu_dm_wb_connector_funcs,
-					    &amdgpu_dm_wb_encoder_helper_funcs,
+					    encoder,
 					    amdgpu_dm_wb_formats,
-					    ARRAY_SIZE(amdgpu_dm_wb_formats),
-					    amdgpu_dm_get_encoder_crtc_mask(dm->adev));
+					    ARRAY_SIZE(amdgpu_dm_wb_formats));
 
 	if (res)
 		return res;

-- 
2.47.2

