Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7973CCF69F
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 11:39:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB9E10EF1B;
	Fri, 19 Dec 2025 10:39:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YfO7yHca";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N/5TEpFM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECD1F10EF18
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 10:39:24 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BJ4cXPa3700967
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 10:39:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VVlnWUp/w4USs5e7cXU6pqhnQwBXjqF4j7dJKWoQwZ0=; b=YfO7yHcaTUf6xUoC
 o2pNkJSSi1wyvHqS0u7m4SXXRhZaubF9KCdON5/BCXNlX+s2TVzuP2L6bIMG0jDY
 0o5WckxEMkQ1Mfr9zGoGp1J72R9s7sIPZJHSHUV1Vv2+8zCEKemFRZeC0RwBtIOV
 Xo9AcfoplddS9UhAuFNWZ0waOm6AQYrHTc8yC+wQKEae8t0lQffQuvbaCmELuAxx
 PMopIhinmdCoe3jErvhmGvXnr7/5lb6U/onB6wNtTUne6y1SuKRlpHj7OlYbzR32
 PMHrh3POuWzy0r+DNKPFCeVbh/mKqHL+Q0A9jlmgFZNsuBvbPr0mQEhsg6oD5cWV
 hjBZAw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2ej9vn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 10:39:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4f1d2aa793fso36112221cf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 02:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766140763; x=1766745563;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VVlnWUp/w4USs5e7cXU6pqhnQwBXjqF4j7dJKWoQwZ0=;
 b=N/5TEpFMjZuJBVg/cqE8ad7aV+tdERekvkKtQgjdXe1V5GwEmSlftiWkukotBi9J1C
 Mmyf/p14orNLUwmXBZI7EIsDdyUiDdZgJiIqwb0jpwdkTG2s7CtR3ScBWOI3xUUy8jJP
 pT8THxzm7YBNn3tp2ZcQaDO/8xEpZ02dbzMnG7Y6EvWm6Quo+xrlrh7kenDB/Sy0QlHI
 K+berJat1oXK1xNTSGkxAO+b4KBPG7Y60BYmxl89UZOvyrURxRSKlKciV/HjGa7gA3tu
 fjDGvBzrKRDwv0bhnTGJjcJ/Q0Ma6k906RiBfqkrbquB6gj3Ml8ni6PmiqS/PtTU0UL3
 Y57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766140763; x=1766745563;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=VVlnWUp/w4USs5e7cXU6pqhnQwBXjqF4j7dJKWoQwZ0=;
 b=QfgJ9TIkMcIqHw1FRQxN0OivqLgb8ryMyvi3W0gHInEKIUHAJUfDm72MUrlA9hsZ8Q
 9mycua+ra3wK6urpVCJO0bXTjRqBUnI0wb3aXTYvtbcpIFob0Gqe3j980JZyAPFRPKJ/
 Eti3lXZM2c40WkBm9ibO1Ph6+toDhanGcjll7WonzeFKGqAI0zXub5ehWoXtilAVWcV8
 wlwQkplKD/jxBBoDYlmLTUyUEgy7yviDc6s1NJTrM8rXyDpoPUWP8SEFXxWO0w5AokfZ
 1aUSJRVX065WI0eBR9eiGMLIwaCy+JLdFx0gasHvx7D+5JyUQt4T8vb0G4EJxrn1SWaH
 F3gA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXStwes0JLZeSW3XCEmlJXKcagocNS5E0G3qfiYVe0usg0igsNo8VcCDEEV5r/Lz3Mh33vizie9tPY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPl3zQcZuLx61bzbOIfp1RgBUR8AUnjNLEBMMKmKQdXvDqnpkx
 4vj+uW/9JKfMt9JfUYAuPyh/atQOtJzah0xGC134sa1myKRaRT4LtJXXmrvNIflfTgUl0S+j7Hj
 DKr3F4tLBkykHsRNdqKj9LCfWmNjF+4y7R5szaXpI05O3E12jiiTh8N73qvNb+c8cFVYJj0Y=
X-Gm-Gg: AY/fxX5u/Xq/AlXfOsGV7YV5T24WHQ2xJrEsPvSzbP4WlEnJIR8mGRBaLj1Mk6QJhKl
 Q1MGQHPgW8cgbqLPEvKoNY6RS74Q4CNS0halKfBNrkL65TJtEOMEeP5vrZ6pL+DYL1H86SYqp0m
 N6OsUcYIgknDRg+mOa+l+as+npb1J9DUdWk/qeE+FOi5DE9f6nuLGZVXHQa3CjDlcQZMXvqXjHU
 ifOHsbijnvLVJJtsytPct3HefIGIgVqS1YYC3PvJtkm3v4m9mDUQNhT8oe+7hUk4/1PuyyJf5fc
 w0OXfUEJRvoFsBoPA8+6/yOXAeuq/A7z9s/dAfZDj1Goi1KaR9DAFE8GqfqA4IHN3pb13I/l7JN
 bt5t7JydBFowVPBI=
X-Received: by 2002:a05:622a:1991:b0:4f1:ccdd:ffde with SMTP id
 d75a77b69052e-4f4abcf1055mr32817571cf.21.1766140763078; 
 Fri, 19 Dec 2025 02:39:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYl99OZQKs8AtrtbfkNPE8W0xYzxNA5YLSWYIo4XjVNxmPz4iliXF1DDLRwLnrCWoR8UukLg==
X-Received: by 2002:a05:622a:1991:b0:4f1:ccdd:ffde with SMTP id
 d75a77b69052e-4f4abcf1055mr32817251cf.21.1766140762510; 
 Fri, 19 Dec 2025 02:39:22 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037ad8577sm198142066b.24.2025.12.19.02.39.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Dec 2025 02:39:21 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 12:39:01 +0200
Subject: [PATCH 1/2] Revert "drm/msm/dpu: support plane splitting in
 quad-pipe case"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-1-654b46505f84@oss.qualcomm.com>
References: <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-0-654b46505f84@oss.qualcomm.com>
In-Reply-To: <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-0-654b46505f84@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Jun Nie <jun.nie@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=9496;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=wi1kWeqVtCbWuNJMTQVYzt1uY9+WlvJ3lb5IAUH9c3k=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpRStUOq76iHmqLPdmQr0S1+R8z5u08yLvJKN0Q
 VHa8kQIsluJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaUUrVAAKCRAbX0TJAJUV
 Vs8AEACiTCATHLFheaEYCFwIbHZvGn2vHLdIFCyOdtzrGispO2wzN6Gmqb/J8ImT7Ezft/H3y1G
 KSR6MOf2q4QP2cxr129uNV0CS4i0H3pVgzoNlymGPvOIwAkWfT5G2fdOfpNi64yUJQCMqNcFsmy
 cU9SiD91Yrh8Gyf6LuOKhzMfyWK4avWFbrWS0yIzSLOaFo2L0a4B325gdn64Z20E5P8FEynj0fb
 EMS4KhnhM1AugH1GP3+777GmF+U0F8XassrBbZ6Ore7Ud+GZul/9l0fuL7OSPpzV3VMI2Y6JGH5
 qmYId4mU6RJ5uo7jqGMTeCpDf7NOC5/OnakAJVkGkG+8MAzsVtNG10XrfK9YbItsKGPgBnPZp7t
 f/e/T6gunhpOSzZbrBjqfod8G+b+qIKVa1xkIhm2vZBsmRuOVrkoLhN9SHSXciHYOK/7I3q9sv6
 b0CfeALyB5rgiDuIdP4lZY2gER2Vup7lAgTib/Ws9BjWHxOTA2Rg9ZePqcgHfDTCVAKOInSDE8a
 BVZXw4nh8tmgCblvOMjVZmzW7HIKqyy0TB/YJWT87HAjmoj+3Y5XDdZ1/jvbZlALe0GhpGc7A3k
 QAJAghbwN4QIuj/ehb4pmsjo/SdZdItwFISGYoTDKiXfdVK5xa7OKVEIwc049tstGrPfooyGWXU
 BiPHpi6Qh7lipDA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: Nn7uyhsXGSsXIXJTfi5AJzVU8soqVfyh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4NyBTYWx0ZWRfX5YBN6w1fvaI/
 vLE9clumIFjehvaFpNM+R3xjko3Xx3WmLg49ay3NL5UqiKYnpuoHsXBP+NOOcaSE1p9LGWF0ef4
 pF+zFYMxs3eM4wf88fltYUMIwebfIH0vVbsqgdyNnakxoLD50WqBMZm4E5iFUW7BvXq89EbvNVG
 HzPjnxx2QIyDTCnRU3qiejIsHjyJPFQUGmsaQ4ze/El/Eql3Ozlw1t7JfWsiPtIvwyQb1hsc4QL
 7aG/TUO6NMj16HHnjUFICxnznFA5CDy2Y3i6LzgQ7oL7TQId6ygqJ34Ce34xhdEsHqVVNKXZqjd
 tPnhvqRXorjYZPvtvQ6hKZVXkLDmF2l6nJpvEwZFEEBLJB4H9uE3AQ7/LHS6kbRZjFxA2k2fwLh
 T0kyxgAbmnbQABQ56tpZK+3pPdX4y2Nf0Y+pzdCAV42zWiVhqI6CKGkqp3rZbUnOiBzVYAvfAmR
 Fock3Uq0lPahDiwiM3g==
X-Proofpoint-ORIG-GUID: Nn7uyhsXGSsXIXJTfi5AJzVU8soqVfyh
X-Authority-Analysis: v=2.4 cv=EabFgfmC c=1 sm=1 tr=0 ts=69452b5c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=sWKEhP36mHoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=_o1CLn_ACWsE2PuA_oEA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190087
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

This reverts commit 5978864e34b66bdae4d7613834c03dd5d0a0c891.

At least on Hamoa based devices, there are IOMMU faults:

arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x00000000, fsynr=0x3d0023, cbfrsynra=0x1c00, cb=13
arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x1c00
arm-smmu 15000000.iommu: FSYNR0 = 003d0023 [S1CBNDX=61 PNU PLVL=3]

While on some of these devices, there are also all sorts of artifacts on eDP.

Reverting this fixes these issues.

Closes: https://lore.kernel.org/r/z75wnahrp7lrl5yhfdysr3np3qrs6xti2i4otkng4ex3blfgrx@xyiucge3xykb/
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  11 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |   2 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 137 +++++++++---------------------
 3 files changed, 40 insertions(+), 110 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index c39f1908ea65..011946bbf5a2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1620,17 +1620,6 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, bool en)
 	return 0;
 }
 
-/**
- * dpu_crtc_get_num_lm - Get mixer number in this CRTC pipeline
- * @state: Pointer to drm crtc state object
- */
-unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state)
-{
-	struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);
-
-	return cstate->num_mixers;
-}
-
 #ifdef CONFIG_DEBUG_FS
 static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
 {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index 455073c7025b..2c83f1578fc3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -267,6 +267,4 @@ static inline enum dpu_crtc_client_type dpu_crtc_get_client_type(
 
 void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
 
-unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state);
-
 #endif /* _DPU_CRTC_H_ */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index d07a6ab6e7ee..9b7a8b46bfa9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -826,12 +826,8 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
 	struct dpu_sw_pipe_cfg *pipe_cfg;
 	struct dpu_sw_pipe_cfg *r_pipe_cfg;
-	struct dpu_sw_pipe_cfg init_pipe_cfg;
 	struct drm_rect fb_rect = { 0 };
-	const struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	uint32_t max_linewidth;
-	u32 num_lm;
-	int stage_id, num_stages;
 
 	min_scale = FRAC_16_16(1, MAX_UPSCALE_RATIO);
 	max_scale = MAX_DOWNSCALE_RATIO << 16;
@@ -854,10 +850,13 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
-	num_lm = dpu_crtc_get_num_lm(crtc_state);
-
+	/* move the assignment here, to ease handling to another pairs later */
+	pipe_cfg = &pstate->pipe_cfg[0];
+	r_pipe_cfg = &pstate->pipe_cfg[1];
 	/* state->src is 16.16, src_rect is not */
-	drm_rect_fp_to_int(&init_pipe_cfg.src_rect, &new_plane_state->src);
+	drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
+
+	pipe_cfg->dst_rect = new_plane_state->dst;
 
 	fb_rect.x2 = new_plane_state->fb->width;
 	fb_rect.y2 = new_plane_state->fb->height;
@@ -882,94 +881,35 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
 
 	max_linewidth = pdpu->catalog->caps->max_linewidth;
 
-	drm_rect_rotate(&init_pipe_cfg.src_rect,
+	drm_rect_rotate(&pipe_cfg->src_rect,
 			new_plane_state->fb->width, new_plane_state->fb->height,
 			new_plane_state->rotation);
 
-	/*
-	 * We have 1 mixer pair cfg for 1:1:1 and 2:2:1 topology, 2 mixer pair
-	 * configs for left and right half screen in case of 4:4:2 topology.
-	 * But we may have 2 rect to split wide plane that exceeds limit with 1
-	 * config for 2:2:1. So need to handle both wide plane splitting, and
-	 * two halves of screen splitting for quad-pipe case. Check dest
-	 * rectangle left/right clipping first, then check wide rectangle
-	 * splitting in every half next.
-	 */
-	num_stages = (num_lm + 1) / 2;
-	/* iterate mixer configs for this plane, to separate left/right with the id */
-	for (stage_id = 0; stage_id < num_stages; stage_id++) {
-		struct drm_rect mixer_rect = {
-			.x1 = stage_id * mode->hdisplay / num_stages,
-			.y1 = 0,
-			.x2 = (stage_id + 1) * mode->hdisplay / num_stages,
-			.y2 = mode->vdisplay
-			};
-		int cfg_idx = stage_id * PIPES_PER_STAGE;
-
-		pipe_cfg = &pstate->pipe_cfg[cfg_idx];
-		r_pipe_cfg = &pstate->pipe_cfg[cfg_idx + 1];
-
-		drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
-		pipe_cfg->dst_rect = new_plane_state->dst;
-
-		DPU_DEBUG_PLANE(pdpu, "checking src " DRM_RECT_FMT
-				" vs clip window " DRM_RECT_FMT "\n",
-				DRM_RECT_ARG(&pipe_cfg->src_rect),
-				DRM_RECT_ARG(&mixer_rect));
-
-		/*
-		 * If this plane does not fall into mixer rect, check next
-		 * mixer rect.
-		 */
-		if (!drm_rect_clip_scaled(&pipe_cfg->src_rect,
-					  &pipe_cfg->dst_rect,
-					  &mixer_rect)) {
-			memset(pipe_cfg, 0, 2 * sizeof(struct dpu_sw_pipe_cfg));
-
-			continue;
+	if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
+	     _dpu_plane_calc_clk(&crtc_state->adjusted_mode, pipe_cfg) > max_mdp_clk_rate) {
+		if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
+			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
+					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
+			return -E2BIG;
 		}
 
-		pipe_cfg->dst_rect.x1 -= mixer_rect.x1;
-		pipe_cfg->dst_rect.x2 -= mixer_rect.x1;
-
-		DPU_DEBUG_PLANE(pdpu, "Got clip src:" DRM_RECT_FMT " dst: " DRM_RECT_FMT "\n",
-				DRM_RECT_ARG(&pipe_cfg->src_rect), DRM_RECT_ARG(&pipe_cfg->dst_rect));
-
-		/* Split wide rect into 2 rect */
-		if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
-		     _dpu_plane_calc_clk(mode, pipe_cfg) > max_mdp_clk_rate) {
-
-			if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
-				DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
-						DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
-				return -E2BIG;
-			}
-
-			memcpy(r_pipe_cfg, pipe_cfg, sizeof(struct dpu_sw_pipe_cfg));
-			pipe_cfg->src_rect.x2 = (pipe_cfg->src_rect.x1 + pipe_cfg->src_rect.x2) >> 1;
-			pipe_cfg->dst_rect.x2 = (pipe_cfg->dst_rect.x1 + pipe_cfg->dst_rect.x2) >> 1;
-			r_pipe_cfg->src_rect.x1 = pipe_cfg->src_rect.x2;
-			r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
-			DPU_DEBUG_PLANE(pdpu, "Split wide plane into:"
-					DRM_RECT_FMT " and " DRM_RECT_FMT "\n",
-					DRM_RECT_ARG(&pipe_cfg->src_rect),
-					DRM_RECT_ARG(&r_pipe_cfg->src_rect));
-		} else {
-			memset(r_pipe_cfg, 0, sizeof(struct dpu_sw_pipe_cfg));
-		}
+		*r_pipe_cfg = *pipe_cfg;
+		pipe_cfg->src_rect.x2 = (pipe_cfg->src_rect.x1 + pipe_cfg->src_rect.x2) >> 1;
+		pipe_cfg->dst_rect.x2 = (pipe_cfg->dst_rect.x1 + pipe_cfg->dst_rect.x2) >> 1;
+		r_pipe_cfg->src_rect.x1 = pipe_cfg->src_rect.x2;
+		r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
+	} else {
+		memset(r_pipe_cfg, 0, sizeof(*r_pipe_cfg));
+	}
 
-		drm_rect_rotate_inv(&pipe_cfg->src_rect,
-				    new_plane_state->fb->width,
-				    new_plane_state->fb->height,
+	drm_rect_rotate_inv(&pipe_cfg->src_rect,
+			    new_plane_state->fb->width, new_plane_state->fb->height,
+			    new_plane_state->rotation);
+	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0)
+		drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
+				    new_plane_state->fb->width, new_plane_state->fb->height,
 				    new_plane_state->rotation);
 
-		if (drm_rect_width(&r_pipe_cfg->src_rect) != 0)
-			drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
-					    new_plane_state->fb->width,
-					    new_plane_state->fb->height,
-					    new_plane_state->rotation);
-	}
-
 	pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
 
 	return 0;
@@ -1045,17 +985,20 @@ static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
 		drm_atomic_get_new_plane_state(state, plane);
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
-	struct dpu_sw_pipe *pipe;
-	struct dpu_sw_pipe_cfg *pipe_cfg;
-	int ret = 0, i;
+	struct dpu_sw_pipe *pipe = &pstate->pipe[0];
+	struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
+	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
+	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->pipe_cfg[1];
+	int ret = 0;
 
-	for (i = 0; i < PIPES_PER_PLANE; i++) {
-		pipe = &pstate->pipe[i];
-		pipe_cfg = &pstate->pipe_cfg[i];
-		if (!drm_rect_width(&pipe_cfg->src_rect))
-			continue;
-		DPU_DEBUG_PLANE(pdpu, "pipe %d is in use, validate it\n", i);
-		ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg,
+	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg,
+					  &crtc_state->adjusted_mode,
+					  new_plane_state);
+	if (ret)
+		return ret;
+
+	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
+		ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg,
 						  &crtc_state->adjusted_mode,
 						  new_plane_state);
 		if (ret)

-- 
2.48.1

