Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD966CB3E1D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 20:43:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4361910E767;
	Wed, 10 Dec 2025 19:43:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lTRSnU1i";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aLM4S4Xe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C517710E767
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 19:43:04 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BAIR8Lp3358571
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 19:43:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CJryTvBlX1l57AzfpPj3XJrxYhHGAfPLn56090dAH44=; b=lTRSnU1i0vaTfyq4
 3AYYl1nR2GHA0sXeRvnwjbSE8SKEqcdQC0HlsWjN14/H36AUiIEqMQN4UIeZU0iS
 3foSkMk9wXr1gT9rfP7N/1hPM+XfkNX48vZ2FC6kBklbEFjWFyyrdHhEK/PYqClu
 c20UnZyhK2mo6qnl+3RJ/u2pLWS6YXXPruaXYweXDjYfRASMLeDZ8J1VhQ9CvN3O
 UUVVCSWbFSDks2bZIdFTIkpp6qZeI8bNaAdiCIC4iOF1xegW+vfdWMu2af9q6jzR
 CVjo80IbOjodSAcuc057xJaXEUNwDdUX0X0HiMdBp8v0GB38B6oIzaYRYlTvnbFB
 uPEW7g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay7pp1qt0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 19:43:04 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-880501dcc67so6836656d6.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 11:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765395783; x=1766000583;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CJryTvBlX1l57AzfpPj3XJrxYhHGAfPLn56090dAH44=;
 b=aLM4S4XejD+ht6oFBkV5T+IcQnY/unOiowproqfemc8qz2igNPMM+dOR2NhlvYZwNU
 rNiW7vtad2CTWtY8HgCO/qnDsa4hyIgOcRgCYinZyozIlui7YP29Q1jHMuea1TbpC5Kn
 dvTFqQpj3NO76OfLk5tkCZ5ZKOw6QGLTxYo4xARLBEAwwvt5W8mH/slSNWpgjNk3kcIF
 dnmloM+6OdkH9rcBsiAkpB1W5EjtP20AlyJGxz6UhKJeFagaj13zVHRlNzRFEuozN6Z/
 Va0nc0rV9QGl3Di2eoPxx8vcEZRrFaQ+Dou28XBLJmHVKac0Q0zo3dHNXhDLk1RScm6U
 b4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765395783; x=1766000583;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=CJryTvBlX1l57AzfpPj3XJrxYhHGAfPLn56090dAH44=;
 b=A1S7EM5w4pvNKGtv+umct67TkyfzclAHUpaDgftrLaUsfrPSYLKDBvfr5ar87DpinL
 /4ZN3mFnsS2HNcTWm0YjK0Go0nrMHLc5BWhL1wJ9Bo17ie03LghewCgiPrMo1TFV5IJ5
 0f6Bskgwsnn7/CGlVj8KBMw3xkakzL7Rxsq33eUfwoV/mG04E/72Gb8qJ9aVPG2tuik0
 6gUTA7vMqbM1n/vfiNRkGz+EQtNyOHl8szXfF6BMR4vP2HuOvYGwrHA9a/rBd5mCtm5g
 Zrad8zx7vm44UG/5LSg0UYXpKw0TM3MY5B1g3pqV/xLt+6xocrBq2RrqSHnUXK1rVSuS
 GQ+w==
X-Gm-Message-State: AOJu0YyNVqBr+srf8wsSToH3jNP/20rmWSFhksOOEHaYq4pDqnl7mxEM
 mPFDUGfq+GEGolSt1yIN4g3sdpR+VNYaiyqytYywZPjbuJTKE2xYpyPHwjH/ewGi9CFDKrVvjQZ
 q54IqxZvE5P31Kel7djxkJM8hulsn0ELGdsLthX2BUiBW4bkrimJ35ob2kXGVIygkgWm6yCA=
X-Gm-Gg: ASbGncsTPtFIr5XHyXtPakkVdn/YAPc4rifOodLgdFClXAk12H84z/P5QPJZ9MIncd3
 ZKlYFoo9xHSgUzso0MIpOfYzTqRJsaPGMIPAIyz5icwleLz2pNtuV4FbUzL4lcHuUa3DJm9hAI+
 yhx03h8Z7LM4DQ3+BqwHmsf6tiFrasw1/FAW9h1I3oQomwGd9bi+hDPHCW1OFdpDyNtQXQHRQ2L
 RszwF12htQiyzdO7ftXRzWMRIwh225BldUwLH8l5vmmZlm6nNpp84Zsn2bj4FyNFgFy5Ha33CqD
 dfiNYlJ8P/3BbJusbaaz7sw4TrV1aLgkCkuHI7vOLVwL5VNmRBD/uA+tLkwjU3ZAqYelk7MRZ4a
 7yI7iUB0HcZpJFXswE47mwoqRYDS9gt5NyM37G2xr8q3F61cq//rAYVJGUkQjCwr/0hy2gBrLSf
 nFR++t7926E4hkl5kvXoMsJQc=
X-Received: by 2002:ac8:7d55:0:b0:4ee:4214:31ff with SMTP id
 d75a77b69052e-4f1b19b8b5fmr49320641cf.13.1765395783143; 
 Wed, 10 Dec 2025 11:43:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQ66cvFY+gHoHakPOhKpYFUXPMD6XwUSTwI51XcWdr5cXocJ30W0NicrfCRBTS4xmf43T1uA==
X-Received: by 2002:ac8:7d55:0:b0:4ee:4214:31ff with SMTP id
 d75a77b69052e-4f1b19b8b5fmr49320261cf.13.1765395782720; 
 Wed, 10 Dec 2025 11:43:02 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-598f3199e93sm104845e87.96.2025.12.10.11.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Dec 2025 11:43:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 10 Dec 2025 21:42:58 +0200
Subject: [PATCH RESEND 2/3] drm/atomic: add max_size check to
 drm_property_replace_blob_from_id()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251210-drm-fix-lut-checks-v1-2-10ae38519f43@oss.qualcomm.com>
References: <20251210-drm-fix-lut-checks-v1-0-10ae38519f43@oss.qualcomm.com>
In-Reply-To: <20251210-drm-fix-lut-checks-v1-0-10ae38519f43@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6121;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=zXvnGnGuLkJqi0K2ojfpmFIykU/bxtYPAL0lpdGu0vw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpOc1CmLYcBrr3riLWAvi2Gop6rn00DEG4zQih2
 Oc56Y4tzmuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaTnNQgAKCRCLPIo+Aiko
 1XvACACa655mfgnTtUZoUiPqQNxFW6hpO7DVJlW8zUp5qJ0u71eRqIL2M4IUKYoRRuyiBQK4T33
 qdS2qMrK9YAuKO4HD9SdrHg/yw8xqt5FgouNRN3IR0+QCk4agYDEmVPyfLHalKHyoM61dwqQ0rN
 AGwKIz+fNF7ygJnt5ofSDXZlncubwfMUsiZf90wQgFus5onXi/uORPIRPgbFBVyWJe/1uV565vn
 IUUybaXJgD1+BpX6Fp1pDXAPu8jkgn8aRfiNHu8AmPF7hshFM2fR1dvG+A72JINpVbfv1xt4rNp
 buRLFAlK+CN7eAxd5yiQkW949nPGHl58puTrqSTcynqNedHn
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: wPNRXgSrAEP95Xtt1Uv6SN1RJLdi5OB2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDE2MSBTYWx0ZWRfX7jwyh0bv6uZq
 UnA84GRzz3Y//V1Idw3oypv9NGjKg8rXKs1ingL5PxmFWg9gvVWwbxn5Ki1HHc2sR+vYLemI7OM
 U2+giQJbfVlt1mxVCoDONp/GCaaDmy6g701uaGxBs7Di1Qte+f39wY4xmSds8Gu5+0gsYIGLu8Z
 uyzlv8rrE8Xknkak4PqLH7lsLTGU4IL1JGWA6CWjMy32kKDd/hZeIknsBe3tTUPwlAnyOhx7gi9
 dR4Tp3yoAsA3w2AlR/6Z0hj4Id6+LSjgGsOINwIfYsJThIp5I47eS7jQPvZMWjqjz4ArMwIhtpR
 QCvQDcrEedVPZVGS2li2bntaB3H2rO/vZuZLWJuVYMI3DEjnixYp39ipCRr1FKRI138Wsrt+xxF
 2ZWwEaLQxx055TM6mcSQUQeTY/foDw==
X-Proofpoint-ORIG-GUID: wPNRXgSrAEP95Xtt1Uv6SN1RJLdi5OB2
X-Authority-Analysis: v=2.4 cv=WaMBqkhX c=1 sm=1 tr=0 ts=6939cd48 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=L8DPiWb6BhtAijwQbtEA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_02,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512100161
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
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c |  5 +++++
 drivers/gpu/drm/drm_atomic_uapi.c                       |  7 +++++--
 drivers/gpu/drm/drm_property.c                          | 11 +++++++++++
 include/drm/drm_property.h                              |  1 +
 4 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index e027798ece03..d19631b5d9e1 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1677,6 +1677,7 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
 							&dm_plane_state->degamma_lut,
 							val, -1,
 							sizeof(struct drm_color_lut),
+							0,
 							&replaced);
 		dm_plane_state->base.color_mgmt_changed |= replaced;
 		return ret;
@@ -1695,6 +1696,7 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
 							&dm_plane_state->ctm,
 							val,
 							sizeof(struct drm_color_ctm_3x4), -1,
+							0,
 							&replaced);
 		dm_plane_state->base.color_mgmt_changed |= replaced;
 		return ret;
@@ -1703,6 +1705,7 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
 							&dm_plane_state->shaper_lut,
 							val, -1,
 							sizeof(struct drm_color_lut),
+							0,
 							&replaced);
 		dm_plane_state->base.color_mgmt_changed |= replaced;
 		return ret;
@@ -1716,6 +1719,7 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
 							&dm_plane_state->lut3d,
 							val, -1,
 							sizeof(struct drm_color_lut),
+							0,
 							&replaced);
 		dm_plane_state->base.color_mgmt_changed |= replaced;
 		return ret;
@@ -1724,6 +1728,7 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
 							&dm_plane_state->blend_lut,
 							val, -1,
 							sizeof(struct drm_color_lut),
+							0,
 							&replaced);
 		dm_plane_state->base.color_mgmt_changed |= replaced;
 		return ret;
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 85dbdaa4a2e2..7d2076f1006e 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -388,6 +388,7 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
 					&state->degamma_lut,
 					val,
 					-1, sizeof(struct drm_color_lut),
+					0,
 					&replaced);
 		state->color_mgmt_changed |= replaced;
 		return ret;
@@ -395,7 +396,7 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
 		ret = drm_property_replace_blob_from_id(dev,
 					&state->ctm,
 					val,
-					sizeof(struct drm_color_ctm), -1,
+					sizeof(struct drm_color_ctm), -1, 0,
 					&replaced);
 		state->color_mgmt_changed |= replaced;
 		return ret;
@@ -404,6 +405,7 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
 					&state->gamma_lut,
 					val,
 					-1, sizeof(struct drm_color_lut),
+					0,
 					&replaced);
 		state->color_mgmt_changed |= replaced;
 		return ret;
@@ -546,6 +548,7 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 					val,
 					-1,
 					sizeof(struct drm_mode_rect),
+					0,
 					&replaced);
 		return ret;
 	} else if (property == plane->scaling_filter_property) {
@@ -741,7 +744,7 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
 		ret = drm_property_replace_blob_from_id(dev,
 				&state->hdr_output_metadata,
 				val,
-				sizeof(struct hdr_output_metadata), -1,
+				sizeof(struct hdr_output_metadata), -1, 0,
 				&replaced);
 		return ret;
 	} else if (property == config->aspect_ratio_property) {
diff --git a/drivers/gpu/drm/drm_property.c b/drivers/gpu/drm/drm_property.c
index 596272149a35..5befe443135d 100644
--- a/drivers/gpu/drm/drm_property.c
+++ b/drivers/gpu/drm/drm_property.c
@@ -759,6 +759,7 @@ EXPORT_SYMBOL(drm_property_replace_blob);
  * @blob_id: the id of the new blob to replace with
  * @expected_size: expected size of the blob property
  * @expected_elem_size: expected size of an element in the blob property
+ * @max_size: the maximum size of the blob property for variable-size blobs
  * @replaced: if the blob was in fact replaced
  *
  * Look up the new blob from id, take its reference, check expected sizes of
@@ -773,6 +774,7 @@ int drm_property_replace_blob_from_id(struct drm_device *dev,
 					 uint64_t blob_id,
 					 ssize_t expected_size,
 					 ssize_t expected_elem_size,
+					 ssize_t max_size,
 					 bool *replaced)
 {
 	struct drm_property_blob *new_blob = NULL;
@@ -801,6 +803,15 @@ int drm_property_replace_blob_from_id(struct drm_device *dev,
 			drm_property_blob_put(new_blob);
 			return -EINVAL;
 		}
+
+		if (max_size > 0 &&
+		    new_blob->length > max_size) {
+			drm_dbg_atomic(dev,
+				       "[BLOB:%d] length %zu greater than max %zu\n",
+				       new_blob->base.id, new_blob->length, max_size);
+			drm_property_blob_put(new_blob);
+			return -EINVAL;
+		}
 	}
 
 	*replaced |= drm_property_replace_blob(blob, new_blob);
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

