Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA14FCE53DF
	for <lists+dri-devel@lfdr.de>; Sun, 28 Dec 2025 18:21:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88C7B11AF91;
	Sun, 28 Dec 2025 17:21:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BEwij8f4";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PxG+ml9g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A39D11AF01
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 17:21:45 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BSGLklC3440636
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 17:21:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QwKCOLaLwEVYb/ydqismQTZCLmcdjRauyMNTqQmx16w=; b=BEwij8f468punwq6
 urKJB9CgqrOEhjKjBPwBBQXG2Ilhu1me2Y8M2L+iFIkvhgwNJybHYhrBCyDkvzOp
 jVx5gZ00XNtkC7J/J7VguH7FjCj78ZFy2j+LVOhNLFfRYXYTgJ62udHdIwgIo3sr
 3221YP2zI1V5Au/JthDmcXGCuik8AcGoq9kLIAP5RwhdRtLDvAsp2zc/T8vqth+1
 eZtJvqyr0V+idOdxnbYqL2mGH3JXZ4lAuNnt09lwMr06yJ0lIQB3RdC93fqswMGB
 xXPfIvwWnEvqC4V8o1z544t+W/lrFu15e9AQzQWVPOQhTxXnDdZ4JsqLkdRg3Z+3
 lEga1A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba7u5jexs-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 17:21:44 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-88a2d8b7ea5so107393496d6.0
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 09:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766942503; x=1767547303;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QwKCOLaLwEVYb/ydqismQTZCLmcdjRauyMNTqQmx16w=;
 b=PxG+ml9gYY9X6Fzqh4dhEzICqDHHx3vCw29BaAvykondt52GH87lIrFYYahINhhHCX
 eT2LeWAxjz1I3t0yfE3DHt4EsfmWY25JwXfXeR9c8j9V2PFpsM2B1Mkb9++kRE8VGp9h
 U/OZ5AIkCcHEv5XsuxmEHgB7PyjElk+6xyB5L/PHBhinl75vdj5C/tn01rNJNTr4tGF8
 bMRqLJpMr4lu75bj9ZY0ISdJcM0A3vxDrKPxBvsHaJqVoGKTIb5p1UjmipjGIwCcKd3z
 Y2UO+/EjBgHLRNlBuJucH+ExgjoRRhpXENjAl8fTuu3T6s5IjM3z2zTfCH3TtQOO5C6/
 CsjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766942503; x=1767547303;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=QwKCOLaLwEVYb/ydqismQTZCLmcdjRauyMNTqQmx16w=;
 b=TfRE7iF+P22/erxdzWdOZ62cN7sqLWvlb5dyMuwhUBiyfJsCk1M3HRbP30IGWPtYxs
 FKFiT1v5zXC68zC2UZVOwagziwNRC/Iu5I3WF6KE4y4SvR6+eOXL1WLAc5L6rMk+7t9y
 lgKIZhrm9neHL8o7z1jsJyhpJtWfQsho8n1tHDCvSK1oz7NGTGh5nU97kv85QT37qOEa
 jt5wNXarYAj3FZcBLECTUK/nS+1Bsw+RcfWm4KKRFzLeeuQg1LybPs2yc8h12dPrsKYz
 w8onHJhn2Mas0eVAvcKzkgbI5tH1EOf/5JC58mlVMQzShU6xsAKE0Fbua55yxcHoKqxj
 J26Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmovdw3Us4nTgF9rXdm+bG9b0491qnaHJ300LoXzCnzuuTv7/tcdevyP8nn5af0hlEDdathx6RxGc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywpu484AZFvq7LEmRq9Mtrx0OaNJ4yzLui1NRfzEpg/sJ68RyKi
 Wng3WP+7m7mTszfQHK/snOcsxfsMV0tykJvdI9dRXsmwMECtW58MwEnZJ9auiyKRFdtYrZ7Swpl
 RGR77B4+iGyMlJNqOzQjNIYKAKG9jU4nV+T6Qr3q2X6/JXfxr8enCklwLSpx5bbo5RQpR5iLLg6
 Ve6ac=
X-Gm-Gg: AY/fxX5PuTOP7ktOrF2TMnyrgd6rzMZWoX63rFYWhye/qzgtj5yiVgCiiUTpSl7us2x
 IvKYkPizzD6BuOkyH8LHA0cDVgI7b9072//m0IQnMechpIKyPpRiCnNHKvr7+KOnQjvirPaDAfU
 6Ls65g7r+bv/IlJwo+ilXgE4abVeykGx5iPeWTKws5rjNnzb0lCuHERwx+25yoDV1kgf7VVOwZ9
 7mtuKkJ1Q11bCGlK7+z+WkbZ6DfBaVuzhIUtWIrPcSK3soLYUhMy4chlBMQSoYgnnkR1H5gzBUu
 /cjaNE8fahZKz1AD7sLpmiLhrKn73XAov4p47zNB7BVjngkgbPMMS/0m1GJU8Qbk3mHQrisykXG
 5qtDw2oVWnZfvmbS0mFHzsuyvsmnGDgiOJ7vH0aDmsmzEjj2Q4BqDL3RHnmzExLTWO26W/Tbt2P
 O6ar2Gms6n1Wkupy5CcDMchYI=
X-Received: by 2002:a05:6214:14ac:b0:880:48bc:e08f with SMTP id
 6a1803df08f44-88d83793405mr311516426d6.40.1766942503351; 
 Sun, 28 Dec 2025 09:21:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE5EUG88eN7xWHCQu1kB/Om4DasLN+n2uCUeGVvVxm3AjAOh3j8JLRR73QWpq6YGG91jGc5zw==
X-Received: by 2002:a05:6214:14ac:b0:880:48bc:e08f with SMTP id
 6a1803df08f44-88d83793405mr311516016d6.40.1766942502851; 
 Sun, 28 Dec 2025 09:21:42 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3812251cfffsm76871031fa.19.2025.12.28.09.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 09:21:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 19:21:34 +0200
Subject: [PATCH v4 2/8] drm/amd/display: use
 drmm_writeback_connector_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-wb-drop-encoder-v4-2-58d28e668901@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2978;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AhjL5n0KqMn00LisHx2T5B6vTrBvTjUUJYkgUx2rS80=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpUWciqEro/DFsCfKaexLHG7KTjaJzdmaEO/86Q
 /tztctUKI2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVFnIgAKCRCLPIo+Aiko
 1ajxCACH793b0lsnrCbvP33cFhq6yL0q59eHuPMhmnMl4PbAf74U2q6vkmuhCLbqWCyjjympkm2
 F/QcVzF6/2fMsBgWaxsNYMVRtMEayNK7VupJM/1PgLNA0wAVIhFcD1nGQ9aAoIUL3hD0ssjtLSE
 9+AjggpuA2/LVew7AVfi28UvHarYVEjG/cdGTOH+shJS4pH7Uc7xY64PV2WAV7gcxdIF6LMqZF8
 zVkVffrU80TTqtUmnaNTLFzL5KTn2ydJbita7NEyIvP5RCWD2I94OLeJHb90rtbkm2B4OL7NFwl
 y1FdVeZNaoJYHJgm5XqKdUx1uN271EkIn8vhU3oofzZ79v+n
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: gHgWBMmyP9z-Qvxk6VCWpfPBo2l8-8WX
X-Proofpoint-ORIG-GUID: gHgWBMmyP9z-Qvxk6VCWpfPBo2l8-8WX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDE1OSBTYWx0ZWRfX+ul0QT45uoX9
 dEvHIn83cTVl13mb1F2zQfotVkRrw5R0A8mtmQR8bCJr1UGVSmfvGuCqlSYS4gyL4XC/GtmCXHQ
 hzXKHM5jeblBBzbSqtAI6F4UtjJFvrgcdhWBvBjRolI62NFYlxgAky0O0LWRs19iplPGIOBU60r
 zjaYuIDhLwOFTC1PEYgBR97w+2LwzAyd3I+QFSR6Dh6dBSUc5Gt1oFmUIFrmpVvSAuGt5KAAYB+
 QoJ8jvBF2r5rZQDyW7n503MJaQ2GQ1/ga8p0b6MMyNuSa8fO1IQvGiBdHKPYP/IfSTDz1QXO34b
 g2h1mQTXNs6w0ZfHorZaNNF7ij+awBX5OHEMYF6NG9n8ctgmUeHwiamT8wLlDq8sGMYZAgPLf+4
 KLJOaj0O00Xg4Lswz9xNtgHxZ8c/8youM7FEjQx8W1or0Q4PB6PKjvClmHtnua6VDP8SxKWaFle
 SruMSANRTTgWW3qRLIQ==
X-Authority-Analysis: v=2.4 cv=DptbOW/+ c=1 sm=1 tr=0 ts=69516728 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P-IC7800AAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=8cP71iSYcfV9S7Y4u-4A:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280159
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
index 740711ac1037..45b3c8f16b23 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -10570,7 +10570,7 @@ static void dm_set_writeback(struct amdgpu_display_manager *dm,
 		return;
 	}
 
-	acrtc = to_amdgpu_crtc(wb_conn->encoder.crtc);
+	acrtc = to_amdgpu_crtc(crtc_state->base.crtc);
 	if (!acrtc) {
 		drm_err(adev_to_drm(adev), "no amdgpu_crtc found\n");
 		kfree(wb_info);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
index d9527c05fc87..80c37487ca77 100644
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
2.47.3

