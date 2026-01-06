Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B85A1CF6906
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 04:10:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B4210E16C;
	Tue,  6 Jan 2026 03:10:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iqVmyjmv";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MEwxjz5W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BACB10E16C
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 03:10:05 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6060npDx1845097
 for <dri-devel@lists.freedesktop.org>; Tue, 6 Jan 2026 03:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 i/ZE9RtLemTsfDhGA7S/TMDUgGHbHWM5z3Ovm2RpDnU=; b=iqVmyjmvarYskCET
 XopyhP7TvNVn+OSDbG75jjQMwgINvVjmVIEzP8R0yFt8oespgYd4BxiLUIjfVRdX
 7N8QWATyHpn8Xct5g2HUw/gN3pLSEvg1PsbohufeiLNb4ZUjWlepY0ZMy6NGZHLp
 d0XXh7r1cYFKd1oK/2o27lnWm4jCfd3vtQTKMCYBEWKvAEjWsE1280BIFqLmlJf2
 0QneHyHIemY8FmNpixW6Ze0gTLOrCpM3UfYlmHpETmxqxGAoTzeQEn0tJi3pMoTX
 K4wp6fWf44KSu7E5HRKeQxWMo1qaRIZRwYyHoP/XFv8GbWG/pe7fqQWsCL39/gbn
 ni4LpQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg6uubewe-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jan 2026 03:10:04 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-88a2f8e7d8dso15962506d6.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jan 2026 19:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767669004; x=1768273804;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=i/ZE9RtLemTsfDhGA7S/TMDUgGHbHWM5z3Ovm2RpDnU=;
 b=MEwxjz5WF2jc6rvl1EuDJBx0uUZpF5GoKK/PpPBWtfDB7XcJTs7gxW1D0CNZR0tkwT
 OsOtM3moBbtgJD8/0Zu4ydcth2j7WgsN2AicpEEmIC8Hwy9sDLlgHX81yEscQkJxRnW5
 7BqFkJ29nWU6twe4qqb2GlsgzDJCxbnsjwYX/PMWCVf/Fk8BYzHsHR+TxcWO0JTWw4NZ
 6A0PVPKeDyzL2MWVjdkDP4pYSESBU9oDxTMdW2j7MmZFVRdtIWyfHTgLshZXl3GWJatW
 GDfqEbOO3dSIEquMhjo/ePSxhfrGpNt8cK6fQye0lEUr5iht63NTH+LVrtCDEJWXNJXV
 tYwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767669004; x=1768273804;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=i/ZE9RtLemTsfDhGA7S/TMDUgGHbHWM5z3Ovm2RpDnU=;
 b=XpsHkPHWVzUjgBc9iqTBDkYw/sg/x4Nzxj5VTc0XvGiPOgXi7KuMLWSZ9S+Ftdo7p8
 UqP5FbDnij9IoC0SByy4zi3RPgRQ1ZfpDz48RTGf9vXhAvtpD4tjGGJfeYEPlFg3OP6D
 IzVwVQUfvz24n18E+oSBrwMm3QBT71wcWaKAfq4PqKjrOKNNT9ChkppGl7Kco27dH80K
 bwgkixkAiI8rbZsOOX1rKrthTcMDEsz70aBFU9QcvXt7deUWY7jGiE4JUgeojgT2C2AC
 qcyrivM6JQ1UDHZjtneFQ8hMAHwXU8BEgRJLcfgbpNWJJ1YaW49AeUEGp7gQOLoK6+1I
 aVhA==
X-Gm-Message-State: AOJu0Yw0ab9ehO0z+P4tnHpQ6n6YYX+I5Adatxp2inQBl/2fpddNF4+L
 WatsEg7Ca6KUU2WjGr9Ku+gklF18/G5gkc5PnIsrMEljEe0cc0tGCeKLtYyAG/tgAMvDMN41PmR
 J8Evj2Abwq1C7bb9//adAH4N0jPgUrZ41GV8CMLEsVygfPivx58k5tt9vQwqc2l1p0it2dfc=
X-Gm-Gg: AY/fxX7OkWyqsUl37WawT8SLkLzD27lpWO81MYldJoj+0pQt7hpAK0MagjH1uJiElHC
 qCEF0hR9HmTFsgJcNoEVfJnuEip6cX5bwy7BXBJN+C49L3ulbOiQe7VwUPcyJWYCOnXh2iC/nvn
 de0SZASUNvvju3R8G1/wtWbA6DimFJQSbvwipmytslEpc9o8SxcI2w5EEOdP+DqNJIqbk8B4uXb
 1G+j4xoUV3tkZ6FTV5vCt2JvpoJvlLvqHNV3Q6xJedg2//y8gwsV1gh76NT5LRyhaP9Z17H/zVE
 X1Xkor0kj8S9BuuqxEi4SzBkIWBT41aIO6Vk4rUj7xAPSxycTk2U0iN8UgmVPJuNFxp8qICPPKv
 5TFW9LNen9dGAkZA8TkAbZO2Dhucth8D87kLC/u3F7ziJAmGjlgNQO3JRQ47v3O45//PWMhDcQp
 5D0Dv7H7cBb69ll6j2UrmGnMw=
X-Received: by 2002:a05:6214:cc1:b0:88a:2444:36e9 with SMTP id
 6a1803df08f44-89075edfd93mr23664556d6.67.1767669003675; 
 Mon, 05 Jan 2026 19:10:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEUbEw4dDpAlA+E/+QDVLYJVJTnPodAKfEcOQtXRN1eWx9cl9lcmjGvedKs7jPeUnxVSlp1Pw==
X-Received: by 2002:a05:6214:cc1:b0:88a:2444:36e9 with SMTP id
 6a1803df08f44-89075edfd93mr23664366d6.67.1767669003155; 
 Mon, 05 Jan 2026 19:10:03 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b65d0d22csm242869e87.37.2026.01.05.19.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jan 2026 19:10:01 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 05:09:56 +0200
Subject: [PATCH v3 2/3] drm/atomic: add max_size check to
 drm_property_replace_blob_from_id()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-drm-fix-lut-checks-v3-2-f7f979eb73c8@oss.qualcomm.com>
References: <20260106-drm-fix-lut-checks-v3-0-f7f979eb73c8@oss.qualcomm.com>
In-Reply-To: <20260106-drm-fix-lut-checks-v3-0-f7f979eb73c8@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7371;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=UkO7gGzz204YJlbpHl9qFMBJirNFYawZoOhKgADqEnM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXH0DDblUwoI2UVGbb37850iZL6ICDxF3WSFiv
 X6LDbNRXU6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVx9AwAKCRCLPIo+Aiko
 1dUSCACM5JnNkCjR7xv/Iuq1XrLGYxgx6TKOoOFudll5tDxgBqKKQbb4mlfGqVgBeUlvty1GBEJ
 KlkklAdBYvQwbJYewszXD4vGy66zGeW+Q+wLwyEcVd1LCJ/TGyS2JFikJpN05fyvGx6W276Lrzy
 iTzFiz5t5JsZ+Rj3N8J88N4qLN2MAle90PBMUYHKh++9hm64hfasrUn6u73XwnIjMyjkFg9dWIV
 6YpwNU7C7ypvOkgpjEDQN8CcZU5IqbVAcPwPj24N+Z8/0+5QbxdVM9r608Oreb6VgpwOfVy/uUG
 4NjwGCpUQGKAw6Q/w54N4SK2nT5JPprx60ZIVRbJ1cHSZoye
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAyNSBTYWx0ZWRfX5IZ8ecERTBdz
 AfN0gwYBvP3hmB3G9I+k5+va06O54iuWrQGILC5vMm4h8jswry/JvehoSUIn+v6zkRGyW1cnHHf
 plBDAWSgEjA6cWFhFXcKFI8lAOWRd3xFMEBRhSCD6XgiDroQFBxp7WR3ZXpTrP0fjWLNs4FeTQV
 uGMNmAnm3fwUK5J7mgJmQFRGZ/rl8coRjw8aTU/fT7/3nT7LYhcJTeOb3YOgiV6m1r21+IZdglW
 b/Jaq8cfuR95F5FRGtB3Yy0FLHc/6XyeoJXbKXFhfDKCN2uSGs8p20kj/64r3HW7jjUmBwSF0g8
 vE22CW+y59Pwkj/Z2ML/GKzIEYl/+2U3N7ZNz0Vbmc6z/PzSlOMPkbcLOrY0TiHf9kGN05GdIqn
 Bap6YZ0rZabAe23ATU/ntDf1mPyVUtqH7aPIQxyy3wAoRuRdvDKvRoGF7ztTOz6U9z3Sv/IQ1wA
 Sb4lnvIvB6RjOzLfr6w==
X-Authority-Analysis: v=2.4 cv=eZ8wvrEH c=1 sm=1 tr=0 ts=695c7d0c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ySEUILROmfWDjamXepEA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: f6_exgL3XGqbFUZikRt-ULqmf_0qH8Yl
X-Proofpoint-ORIG-GUID: f6_exgL3XGqbFUZikRt-ULqmf_0qH8Yl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060025
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

The function drm_property_replace_blob_from_id() allows checking whether
the blob size is equal to a predefined value. In case of variable-size
properties (like the gamma / degamma LUTs) we might want to check for
the blob size against the maximum, allowing properties of the size
lesser than the max supported by the hardware. Extend the function in
order to support such checks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    | 18 +++++++++---------
 drivers/gpu/drm/drm_atomic_uapi.c                      | 14 ++++++--------
 drivers/gpu/drm/drm_property.c                         | 11 +++++++++++
 include/drm/drm_property.h                             |  1 +
 4 files changed, 27 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 2e3ee78999d9..8c5912b59e19 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1676,8 +1676,8 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
 	if (property == adev->mode_info.plane_degamma_lut_property) {
 		ret = drm_property_replace_blob_from_id(plane->dev,
 							&dm_plane_state->degamma_lut,
-							val, -1,
-							sizeof(struct drm_color_lut),
+							val,
+							-1, -1, sizeof(struct drm_color_lut),
 							&replaced);
 		dm_plane_state->base.color_mgmt_changed |= replaced;
 		return ret;
@@ -1695,15 +1695,15 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
 		ret = drm_property_replace_blob_from_id(plane->dev,
 							&dm_plane_state->ctm,
 							val,
-							sizeof(struct drm_color_ctm_3x4), -1,
+							-1, sizeof(struct drm_color_ctm_3x4), -1,
 							&replaced);
 		dm_plane_state->base.color_mgmt_changed |= replaced;
 		return ret;
 	} else if (property == adev->mode_info.plane_shaper_lut_property) {
 		ret = drm_property_replace_blob_from_id(plane->dev,
 							&dm_plane_state->shaper_lut,
-							val, -1,
-							sizeof(struct drm_color_lut),
+							val,
+							-1, -1, sizeof(struct drm_color_lut),
 							&replaced);
 		dm_plane_state->base.color_mgmt_changed |= replaced;
 		return ret;
@@ -1715,16 +1715,16 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
 	} else if (property == adev->mode_info.plane_lut3d_property) {
 		ret = drm_property_replace_blob_from_id(plane->dev,
 							&dm_plane_state->lut3d,
-							val, -1,
-							sizeof(struct drm_color_lut),
+							val,
+							-1, -1, sizeof(struct drm_color_lut),
 							&replaced);
 		dm_plane_state->base.color_mgmt_changed |= replaced;
 		return ret;
 	} else if (property == adev->mode_info.plane_blend_lut_property) {
 		ret = drm_property_replace_blob_from_id(plane->dev,
 							&dm_plane_state->blend_lut,
-							val, -1,
-							sizeof(struct drm_color_lut),
+							val,
+							-1, -1, sizeof(struct drm_color_lut),
 							&replaced);
 		dm_plane_state->base.color_mgmt_changed |= replaced;
 		return ret;
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 7320db4b8489..dff1fdefcbeb 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -416,7 +416,7 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
 		ret = drm_property_replace_blob_from_id(dev,
 					&state->degamma_lut,
 					val,
-					-1, sizeof(struct drm_color_lut),
+					-1, -1, sizeof(struct drm_color_lut),
 					&replaced);
 		state->color_mgmt_changed |= replaced;
 		return ret;
@@ -424,7 +424,7 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
 		ret = drm_property_replace_blob_from_id(dev,
 					&state->ctm,
 					val,
-					sizeof(struct drm_color_ctm), -1,
+					-1, sizeof(struct drm_color_ctm), -1,
 					&replaced);
 		state->color_mgmt_changed |= replaced;
 		return ret;
@@ -432,7 +432,7 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
 		ret = drm_property_replace_blob_from_id(dev,
 					&state->gamma_lut,
 					val,
-					-1, sizeof(struct drm_color_lut),
+					-1, -1, sizeof(struct drm_color_lut),
 					&replaced);
 		state->color_mgmt_changed |= replaced;
 		return ret;
@@ -587,8 +587,7 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 		ret = drm_property_replace_blob_from_id(dev,
 					&state->fb_damage_clips,
 					val,
-					-1,
-					sizeof(struct drm_mode_rect),
+					-1, -1, sizeof(struct drm_mode_rect),
 					&replaced);
 		return ret;
 	} else if (property == plane->scaling_filter_property) {
@@ -717,8 +716,7 @@ static int drm_atomic_color_set_data_property(struct drm_colorop *colorop,
 	return drm_property_replace_blob_from_id(colorop->dev,
 						 &state->data,
 						 val,
-						 size,
-						 elem_size,
+						 -1, size, elem_size,
 						 &replaced);
 }
 
@@ -876,7 +874,7 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
 		ret = drm_property_replace_blob_from_id(dev,
 				&state->hdr_output_metadata,
 				val,
-				sizeof(struct hdr_output_metadata), -1,
+				-1, sizeof(struct hdr_output_metadata), -1,
 				&replaced);
 		return ret;
 	} else if (property == config->aspect_ratio_property) {
diff --git a/drivers/gpu/drm/drm_property.c b/drivers/gpu/drm/drm_property.c
index 596272149a35..955fa960843b 100644
--- a/drivers/gpu/drm/drm_property.c
+++ b/drivers/gpu/drm/drm_property.c
@@ -757,6 +757,7 @@ EXPORT_SYMBOL(drm_property_replace_blob);
  * @dev: DRM device
  * @blob: a pointer to the member blob to be replaced
  * @blob_id: the id of the new blob to replace with
+ * @max_size: the maximum size of the blob property for variable-size blobs
  * @expected_size: expected size of the blob property
  * @expected_elem_size: expected size of an element in the blob property
  * @replaced: if the blob was in fact replaced
@@ -771,6 +772,7 @@ EXPORT_SYMBOL(drm_property_replace_blob);
 int drm_property_replace_blob_from_id(struct drm_device *dev,
 					 struct drm_property_blob **blob,
 					 uint64_t blob_id,
+					 ssize_t max_size,
 					 ssize_t expected_size,
 					 ssize_t expected_elem_size,
 					 bool *replaced)
@@ -785,6 +787,15 @@ int drm_property_replace_blob_from_id(struct drm_device *dev,
 			return -EINVAL;
 		}
 
+		if (max_size > 0 &&
+		    new_blob->length > max_size) {
+			drm_dbg_atomic(dev,
+				       "[BLOB:%d] length %zu greater than max %zu\n",
+				       new_blob->base.id, new_blob->length, max_size);
+			drm_property_blob_put(new_blob);
+			return -EINVAL;
+		}
+
 		if (expected_size > 0 &&
 		    new_blob->length != expected_size) {
 			drm_dbg_atomic(dev,
diff --git a/include/drm/drm_property.h b/include/drm/drm_property.h
index 082f29156b3e..aa49b5a42bb5 100644
--- a/include/drm/drm_property.h
+++ b/include/drm/drm_property.h
@@ -284,6 +284,7 @@ int drm_property_replace_blob_from_id(struct drm_device *dev,
 				      uint64_t blob_id,
 				      ssize_t expected_size,
 				      ssize_t expected_elem_size,
+				      ssize_t max_size,
 				      bool *replaced);
 int drm_property_replace_global_blob(struct drm_device *dev,
 				     struct drm_property_blob **replace,

-- 
2.47.3

