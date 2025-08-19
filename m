Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC5AB2CDEE
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 22:33:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3894E10E673;
	Tue, 19 Aug 2025 20:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AOw0gzB0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 329A610E677
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 20:33:11 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JHcMHn021904
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 20:33:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TRcyMGCl+30uALX35qrVjgv24YuvpY2moJlPtRkxYu0=; b=AOw0gzB094/vDr2i
 z2iu5TdlCo6XWCCXSc9Y0sx5QYAEBOj1Azj739aDVgO52hmdX14GEtx/lMzHirDa
 w1ezg4r0DxiL/qIciNJH3n5aTX3CoKP2nfgy8tk4eJqbugDVkykePpOIvQaoptGI
 2JEZXFIyPvo4sKDhJqO0WP6xr5NZMRc6A+lpA98BwggLLtDobFKxkFWDIQxkVUEp
 IBjWiR9zFKHh76Gc8LCRf50emHPMZYvDxkLMGt5nrky7vpmZ2Q3ceWRMHPg9ros4
 iOXelJWmZz5EWkLA5FJiVpzvf4jQ7fMquaDN/NI8Nv99ajmqB6dDZIpjqChu8qY5
 OnHvGw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48m71cmnxu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 20:33:10 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70a88de16c0so131157556d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 13:33:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755635589; x=1756240389;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TRcyMGCl+30uALX35qrVjgv24YuvpY2moJlPtRkxYu0=;
 b=nv4p6xgbRQbzMd2iercNFdOrxMrPiphcLweXkS0U+wqSHnFIxr6i0BPDxi1kRIOIBl
 g7SqsSB9wl5F/y8566mu2h1kwwTg+5mEvmbNvUBl2POdcWvdD3Fy9l8LX/VepuXuEyf1
 M35qjpUKIGMfNd2rRqttHjeVaQ6m2ZCWEq/NB6v7SWHE3cXyba/GjNSJiricykfivoYf
 nSh7Zfj4FP4qVp4zoumobvLDH9FQP4mCLo5F2EHX2s+aCJbcJPpazG8OafGZuV4OhKTI
 ZHbFCmE+QNR5QWpmUHtRS5m5uCdluOE3JjSv1VnEYsA2fp9wLRLJmGR4x5laPp3tQZPN
 +Cng==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVzTUFVWxvNoTyFFg65xVe1nxwoNt9Ew2rSukh+uJjjCH+BbHe1MzWP6bCUHD7s2d+T0kTFzNZtnw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyL2xtreDrQHH/mgTDevIxy/WxQVpG3FJDO+C2kocBWLei25qA/
 i17o/A8GjnHVlwFwphaC/pbaE+gDWwMTOAkYFI9LIln5ZZCAriljDesEoWpMnoWOIDC1Pj4fdoj
 h9KFgUMfvAnjNYTD1xfecqHrVHXWt7FZNMMbfssxnJCwlYlOchsrZ3+JIJa7rj3oC7gqp48Y=
X-Gm-Gg: ASbGncuTQEqG5/dU78Rv1n34auQ/TV6o/DMPGwqaKrSI/+v3q8thF530KRSjt1MHmXr
 FbOUdfabjqCvqMFYfcuyF5J8sWzvgJC7o9JwgLcwrukNeLZsxZfRWUCG8FoAAaLIPuovvpWeWvW
 +PXiDqGV4RilcHW/O2btFkPu+l134xJrR4chS2t/wx482VheadEYA+dfBiTeAcXyOL2qbXXbfVH
 Pi84VQjVtcygnZpEABmSa2htkKMd+/sla9XVS2EYq1xTpkB388YmcGdBJhU96BlbKw+Bku9mzfu
 R6n8jEKhEUQRMeOtiE5NVIFSjXqQX0ttqikpK2vqef5kkt8K0KTycrO2hPrmfqdqChum/8nZ94m
 2ZgVrTOrzCXYXXVtNt8/F63TP2O9Fx5FtBufLmVw59upfKs3TCUQW
X-Received: by 2002:a05:6214:1c05:b0:707:44d4:2962 with SMTP id
 6a1803df08f44-70d76f5c35dmr5036746d6.7.1755635589156; 
 Tue, 19 Aug 2025 13:33:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGNkRtmHZj2kwRc4y9joiW0/IdD954hX+cZa8EJqfg+DQk+Kuir2C5bEakrVSMmh74F9NL6w==
X-Received: by 2002:a05:6214:1c05:b0:707:44d4:2962 with SMTP id
 6a1803df08f44-70d76f5c35dmr5036196d6.7.1755635588384; 
 Tue, 19 Aug 2025 13:33:08 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef351806sm2212969e87.13.2025.08.19.13.33.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 13:33:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 23:32:57 +0300
Subject: [PATCH v3 3/8] drm/mali: use drmm_writeback_connector_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-wb-drop-encoder-v3-3-b48a6af7903b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2621;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=bSu7BtDX/FJ/CYhdTG49eD8oSIyWKKcC6qKfEjkvl9M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBopN98jRiShnU+tPqXA3NgCQCoCCCxsblmO85Nn
 1h8us24U1qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKTffAAKCRCLPIo+Aiko
 1c51B/sErwvDMVP76IuxwrizrFdDwWxd1TIobv+DiOASR+c4gjQ1luTuJnSzftykasC1wY/qv/I
 egdxs5YNWQ+6aqMuw6GyB/W1jqi3zuaSvJl9Jf5djSqI167jMOYFXvbT+RTwSJVcNVX1EccXB2G
 0u/wRJ7ySKBTSxN9gLAXZ6cE23vdGrPt0nYKZ2vSMkVtFFc4V1WVsVbd7Fhq1aVn6g58KMBSWZU
 I/9zSRkIaFzUE0OGTsMAFXrCVM8V9ipB+YFoC+9NWZbMjSQD8zOMmyM/Zaa847DFNIzpziBw0Nf
 Motkscyd5Lwe6ogpT2PUjhdWq74CwRV6cUefxzNnte9KyU+3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Ozla5Or64kbDp5oEkchCVxxOhbT5H8pm
X-Proofpoint-GUID: Ozla5Or64kbDp5oEkchCVxxOhbT5H8pm
X-Authority-Analysis: v=2.4 cv=IvQecK/g c=1 sm=1 tr=0 ts=68a4df86 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=QyXUC8HyAAAA:8 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=mhD89yN676IZukTL2GQA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDE0NyBTYWx0ZWRfX2c9vTKJ7KcL2
 s4OqP6hTNakBzGXYaI8OYilvtdnO/3luolk18YsgjVs9TYvq9b3wSmFGjVjyEq+KZaAMWGtWSsA
 oyj8VgpOVD1r+hzKQ9G+Jz5srCzn5/bgaHVhEsbzC68yPY7Spao09lmTVSjaZV9q93yoixME7M2
 /MMYrqZ+T4+qr4+DiucUoTENUKim6Kf9PE6g0on/eP1HCcXeMDJP9TZZSlMHIDU+xu1cNP6DKtP
 dIfYGG682s21ws79Uqk4DF0//yfdNlv3sBOy6tJRdcxCZbfMc8dC3utLq996WIZhG4n6rZuVPQS
 IVQweYRfTwb/MSk0weqCOUm4SOZKOUtZ3OwgYbn9QF7r6LOgTTDrPGXVj1FiQdce0jN+CFNTSsj
 Wj7W/FK8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508180147
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
 drivers/gpu/drm/arm/malidp_mw.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp_mw.c
index 600af5ad81b15d0c30f9f79588f40cca07437ed8..80f7f3474c4494554c6b6fb392e7f396b3b49c83 100644
--- a/drivers/gpu/drm/arm/malidp_mw.c
+++ b/drivers/gpu/drm/arm/malidp_mw.c
@@ -84,11 +84,6 @@ malidp_mw_connector_detect(struct drm_connector *connector, bool force)
 	return connector_status_connected;
 }
 
-static void malidp_mw_connector_destroy(struct drm_connector *connector)
-{
-	drm_connector_cleanup(connector);
-}
-
 static struct drm_connector_state *
 malidp_mw_connector_duplicate_state(struct drm_connector *connector)
 {
@@ -114,7 +109,6 @@ static const struct drm_connector_funcs malidp_mw_connector_funcs = {
 	.reset = malidp_mw_connector_reset,
 	.detect = malidp_mw_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = malidp_mw_connector_destroy,
 	.atomic_duplicate_state = malidp_mw_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
@@ -211,6 +205,7 @@ static u32 *get_writeback_formats(struct malidp_drm *malidp, int *n_formats)
 int malidp_mw_connector_init(struct drm_device *drm)
 {
 	struct malidp_drm *malidp = drm_to_malidp(drm);
+	struct drm_encoder *encoder;
 	u32 *formats;
 	int ret, n_formats;
 
@@ -224,11 +219,19 @@ int malidp_mw_connector_init(struct drm_device *drm)
 	if (!formats)
 		return -ENOMEM;
 
-	ret = drm_writeback_connector_init(drm, &malidp->mw_connector,
-					   &malidp_mw_connector_funcs,
-					   &malidp_mw_encoder_helper_funcs,
-					   formats, n_formats,
-					   1 << drm_crtc_index(&malidp->crtc));
+	encoder = drmm_plain_encoder_alloc(drm, NULL, DRM_MODE_ENCODER_VIRTUAL,
+					   NULL);
+	if (IS_ERR(encoder))
+		return PTR_ERR(encoder);
+
+	drm_encoder_helper_add(encoder, &malidp_mw_encoder_helper_funcs);
+
+	encoder->possible_crtcs = drm_crtc_mask(&malidp->crtc);
+
+	ret = drmm_writeback_connector_init(drm, &malidp->mw_connector,
+					    &malidp_mw_connector_funcs,
+					    encoder,
+					    formats, n_formats);
 	kfree(formats);
 	if (ret)
 		return ret;

-- 
2.47.2

