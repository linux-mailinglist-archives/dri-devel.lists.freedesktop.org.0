Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00836B2CDE8
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 22:33:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 423D610E671;
	Tue, 19 Aug 2025 20:33:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IiUQr4VV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0129810E671
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 20:33:07 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JHUggD001317
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 20:33:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ovJO1XSWvs0KNakJASmsJP5sNHD1z0QwbqY++5/N+xM=; b=IiUQr4VV5TbyzTFC
 CN1iQjZqVwVVM/orFQS3P0PoGA1Pl93VgXACCmF+oOSbcxExjnyZ7dJ3BwVfTH5v
 vrol8L4OUtyeylkdzVy6WUHuRUHtXyDqIfl0NsIUzsrltwZ4xUEONym14TGAFzRS
 2Z5hXD+tfeEoZgOnAzsYYBYskF/9xEjZ+D073I0sE5Jl5QktSeP9/CXkALhB7/Zd
 b1JTJ28dkpcjZbHKQAnz6L2UDY2CtfpuEgn/u7P/15NZHnIVXUkA5sCc0IQe1i6r
 q78OjlfhywLdgYVAydE6CDO6dF4LMC40FcD9NfdjFLtBPF1D1ZJjtNKyRezZ8qpT
 jdN3rg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jh079vfx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 20:33:06 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-70a88dd04faso203217086d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 13:33:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755635586; x=1756240386;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ovJO1XSWvs0KNakJASmsJP5sNHD1z0QwbqY++5/N+xM=;
 b=b6njx3afoussYp96peb9KrJgVKhIE5L/y7FVzVU5qBMt/N9WdEJpzzcQExyKLx2Kcd
 7y2wFLb3Lx7VHz7G637lBBKO1j9k1Mv+QNBISvwgwhIM82Laz+z+9sxCB02wYxLT+PUW
 hEQ0FEjgxNM/7SAimJuhYB3kSmgptx8bcpr17mDlKl01QlCoTa5Vl6trYfDuY5hRQmAq
 VCCXj7e8PPuHNgWmbrObS6uiBxExRkKOr6Nmy3EGock3eDcshDO2mPhxxMSNVc9G6nGv
 SRuQ6/raZyQHlnFDrnNxzZJ0Qd/0Fm8whIz5xbG7hFDxNC3IdS7w0rsEYyBHoIO2ston
 hF7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfjmogSemwKiJW/BK+xUOrYWWtEVbtTety8oRKQ1PkGWDoAFIWDo8grPXTucOv7c4d866AXEUtiXk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxLgFlN8xm1/8VGp10pB2jS535FMBAdviX6L82JZZv5Mg4Wujk
 CZnRNu9Fqm853rqWyeRIG4iOTrUrP1pihXm8wbOMQm6lDzxTUnmkIhpQiknNW4a5226/waSZWqp
 nuo+fqxZE5xBPYwQDOqICT5bkEnnhBsYNpHfSRNZ6Ftu2Qqw0t2gQietot1ORjaEcawZ9wog=
X-Gm-Gg: ASbGnctP7QhPR6uTGKpkrMcOWtMAEP3yVEUvgywgEYuyf4A+qZTHMPSyYqZHsH0j8K7
 a8xzxb/ncFIilQP8L1ejmSe/d7pF8cp/tWP9OrHfg40sXCh9xxfagB1cJk5DGzPLRldQQjtGTWC
 T/TRvjJHwJAftscNl6dT9qaPH2RFGp58zi2kXnwdEfLKCa7H6WgamigF6OsKOoZBUFvV2rU4POI
 XlU/WC3LULJEaDWdyRDmGylaI2pWStgiLdQiJK37AXCK+UdGDsak59F0Hb1hHMXVNN/52IW6d/q
 VISlCnmiA5NgFVvxX2To2vNPNdVkCuP1YwWxal9kZzTkYMtB2U6UGLzAV+/yMqPIrdMJn/ptj3n
 w7PAG4IUDiBkA7rArOkJzpI5Rlqi0bfPtAVRXrcfrjSEXppGuVrXg
X-Received: by 2002:ad4:4eea:0:b0:704:95c6:f5f1 with SMTP id
 6a1803df08f44-70d7709978fmr4710376d6.34.1755635585956; 
 Tue, 19 Aug 2025 13:33:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExtlapPhC4VdvxehLvtICbE+wf4VkX5gXmldiks/+ryTub2wDdZG116DcdFZUySCphNajoXQ==
X-Received: by 2002:ad4:4eea:0:b0:704:95c6:f5f1 with SMTP id
 6a1803df08f44-70d7709978fmr4709826d6.34.1755635585259; 
 Tue, 19 Aug 2025 13:33:05 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef351806sm2212969e87.13.2025.08.19.13.33.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 13:33:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 23:32:55 +0300
Subject: [PATCH v3 1/8] drm/amd/display: use
 drmm_writeback_connector_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-wb-drop-encoder-v3-1-b48a6af7903b@oss.qualcomm.com>
References: <20250819-wb-drop-encoder-v3-0-b48a6af7903b@oss.qualcomm.com>
In-Reply-To: <20250819-wb-drop-encoder-v3-0-b48a6af7903b@oss.qualcomm.com>
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
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ8aS+zVx+7sDXTal/otbFF9xSvEB653da1pVu5wcjWZwb
 P9p8uJUJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmUqvC/t+J/b2vPYfQ9w8Z
 7fcdbLozXYrsLgarn7RWWJkyI+udhmF3TqT3PPkPXdKqr98e2FnOcfmUBZvjJ+OHMwzU1X+XzH4
 8c7+pkaBR0rXaRzuc8vSXn3diK2C38P76+qyPl7q9wOZFYfahPLmCqbfOMi/xPHvDW2eKlkVy8Y
 +g9f5/Wd5z/c26m3dp6yIb0RI+2eclWryLDPW7Mwu3sSZsFb+3U9X47reNOv5+gmX68zVeCnmUG
 Z3dzGW37vy7Mu6zvYK/753+cDXLcG25q4HNr4XPLrptYufLDu1/981izUrO9Q3xVyIvLYif9lZf
 LCz2it/0pWd+3vugZlfn92Vhc7tUC5Noamr9xabCb2XnAQ==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: LdP1MtM-Y7LZTqCn1s1tZVXwbNZfVG_C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfXy5VySrbaPXjQ
 96XGISWO/sTbUpFVXGIeBtWRpbJgETiX8lWF7y0Qb4otQx1IYjlVQ0Sq2SRbf7JYa7doLL8wQDu
 7nj+eaQxhH5Vd4lJejarbjjsL2bjq4Obj+PN6ciFI8eEc/vLalCC9+41yNbsqvCn6x+jPCI7v0w
 zkeAnhG9SUW6KzsCXSbekfkmyLK5pmUbsotDpkvqsqo75t7h30pABU4c4Dkd/gsAik/jOLEl5WO
 aDH2v5uBl5gDD/4uQ1q23G+njBwK2Nlmf4CP5x1JkpnRuVtvAojJhoJY5gdquuzYg9iqnUo/AVF
 xA7nZ9ST1MuV5oPb1l7jUu25dnEPk003JzZ3Ee820BSWMBBkhjZBLS0y3Sy6Ttk4RCmiWOSWmCE
 FXeiB5qt
X-Authority-Analysis: v=2.4 cv=a+Mw9VSF c=1 sm=1 tr=0 ts=68a4df82 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=P-IC7800AAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=M-qvw7r3wQx8XY5Jx90A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: LdP1MtM-Y7LZTqCn1s1tZVXwbNZfVG_C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_03,2025-08-14_01,2025-03-28_01
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

