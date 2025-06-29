Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CD8AECD25
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 16:07:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC11810E2B4;
	Sun, 29 Jun 2025 14:07:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MfE7YHL6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA64210E208
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:35 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TAEeH6024207
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=ffNCZ5XDzp7
 SJXui2zRh3gHkvyLV2Hk4elpuiMMFAxg=; b=MfE7YHL6LDzHrK275gfSJfwhins
 r1WnnLYu7XrWPaFbV+SFdbTm5TPtoGmCjLKKpJPj37CT0c6S++A+MkkKr9Nmun27
 ItusTW90LAzaNmGf5HWZG0qHwKe68nEoYYHTimeSVKXaep7oDaQowANyFkj+K5Sk
 kHvz7RhRb1ESU7WGH2BsVkeFwWx3bMS+HhizXJ+QwQIM+ROwoAsBp0JxZyWfvOzI
 GCYORBJLqlXkoZmIlh2ZXy3A6+AZz1pCVcKdSf9FLDtz8Sba7ZRcsIizut0fmuNw
 LFxC20+ffa2M60AN7bDMX3J2EI5JujBubBSoqLDTP/Y8rO7qna6NomUrkAQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j801t7qa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:34 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-7489d1f5e9fso5473181b3a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 07:07:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751206053; x=1751810853;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ffNCZ5XDzp7SJXui2zRh3gHkvyLV2Hk4elpuiMMFAxg=;
 b=U4nEtabRNn9M/juv2IOXXGuuGAlU1dPsRxz915wEnMuU8ucv8N6G24UiDAYOamVu75
 dJVJxnNvmL2y3TrmKQDnmpSqzncdaN7hFGCtE5UGEtYJsy4GclIGQS4Qg+OEJk+mOIQR
 BYvfDsXb0SueZmWt0wWN1cTowFZesvXLPEOHRwcC+7uq3ut1K/X2guGLH4uPkwCTmvoa
 HHZHxUBzQaAfni1TmMaGQUsbAKUm0o4h1UWXgFRH5YC2HPyXN77dVjJgxL8Q+ObaaViL
 FW5C7uWysXbLeN874V++YIn1yoNA9+ywR32So2ePgXGV8q5K0iIHkRlaF93B/fJ5XBq4
 GYyA==
X-Gm-Message-State: AOJu0YwbCYLvMRhv9+QEE8exbxIuTaXEDyYcfDoXo7U5UzuNW2aFgQKR
 TYOG1qRqeNJCKLDEwMRo/9W8OUbYFd5i7F4hiZGoim6ShucmKy5Nfw3OJiDPjRcpLrrfm1gK81/
 OSM5rig4kORHXlT2Nk4TuMf1CTJdqBDzIW4SrlaPaGfDVbTmQtrKeCcpJHMnN9/Z36uEor/vGcH
 t2I3c=
X-Gm-Gg: ASbGncupJ3Zgtwb2I6wMAJgoXxkRAv3BvwWulKXMXJqPyRK7omzxyCsz/a0p2/3oP7e
 JJ8cDmPT76Scy38e6kkycigj3tS7e/ilRCbcVgv1pdyPv4vkT0haC4enRhf/uHQQYIsBqBTd3pu
 r4wmygKOr2LoAEQjzo1hrcrXKpRVQOxGwakRDtuAqK9uVnU8OKmEXpMlqavHsCsWpeQDXlzLEqc
 0SMEYccL+7VpnvZX0X81vB3oie3Io/yQrkH4ZUdm4i8gc5v7nU8rtVn8W2HA9F0y+wzax6p5zzi
 32cWq/KF3vevU7G51sQtTHtFy6ncR0WC
X-Received: by 2002:a05:6a00:2394:b0:748:34a4:ab13 with SMTP id
 d2e1a72fcca58-74af6e84446mr13409273b3a.6.1751206052877; 
 Sun, 29 Jun 2025 07:07:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHN7/oAX1bKEZkUB9J9E/WCSm3m6XndJknPbgZIAkf0AL3r85pHbTnXOpyzeMzvorKiXxPxw==
X-Received: by 2002:a05:6a00:2394:b0:748:34a4:ab13 with SMTP id
 d2e1a72fcca58-74af6e84446mr13409225b3a.6.1751206052319; 
 Sun, 29 Jun 2025 07:07:32 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af541bec8sm6594388b3a.39.2025.06.29.07.07.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 07:07:31 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jun Nie <jun.nie@linaro.org>, linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 11/42] drm/msm: Stop passing vm to msm_framebuffer
Date: Sun, 29 Jun 2025 07:03:14 -0700
Message-ID: <20250629140537.30850-12-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Nxwj-2k-RarepUgYfGlPAP5XLbFRQzYh
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=686148a6 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=HL1_eh3RQQ0Sznupcm4A:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: Nxwj-2k-RarepUgYfGlPAP5XLbFRQzYh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX10bOqw/gySmu
 TR6T26jO+24x6/4It816qAp+/xQJKThzEUDen72ZjuftKPCbCORrbGKqhekhrJt8LnA+jLBQZgU
 BzH+okGDlUECP8KlSn2i7vZUxJAbtT96RZtOK60iHJIUnoS1iGU5PezcrEKhttTDok1yHjBsATR
 w2Ds0NTGs3pUlbhFjJQ9ZltblL4etxEJdqle997v/J7oPBFnM2pVLvG6IFiED8KeVQvlyxPg/FY
 btUxK6NIkpH9UMjba/IPkWhp9wWXawlONtnfbc7SZoPVcuVhfdM04wPJi5DxAcejtcLEssAyV9Q
 oDeVbvDQxmt1ETf5FKFQmnciqzzpOiDiVtWtoJGGQBeJJ9IoQKgmzzfuh45oGOC5x3mx5bRbKds
 ndd6169MI+G6DqE9Ah7qRetN2ooKeuE2eQ/GsNqdTeaf0Wrfm1iCQlmduCGJ3yl5JU60pfgo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290119
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

The fb only deals with kms->vm, so make that explicit.  This will start
letting us refcount the # of times the fb is pinned, so we can only
unpin the vma after last user of the fb is done.  Having a single
reference count really only works if there is only a single vm.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 11 +++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   | 18 +++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h   |  3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 20 ++++++-------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h     |  2 --
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c    | 18 ++++++-----------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c    | 18 ++++++-----------
 drivers/gpu/drm/msm/msm_drv.h                 |  9 +++------
 drivers/gpu/drm/msm/msm_fb.c                  | 15 +++++++-------
 9 files changed, 39 insertions(+), 75 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 32e208ee946d..9a54da1c9e3c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -566,7 +566,6 @@ static void dpu_encoder_phys_wb_prepare_wb_job(struct dpu_encoder_phys *phys_enc
 		struct drm_writeback_job *job)
 {
 	const struct msm_format *format;
-	struct msm_gem_vm *vm;
 	struct dpu_hw_wb_cfg *wb_cfg;
 	int ret;
 	struct dpu_encoder_phys_wb *wb_enc = to_dpu_encoder_phys_wb(phys_enc);
@@ -576,13 +575,12 @@ static void dpu_encoder_phys_wb_prepare_wb_job(struct dpu_encoder_phys *phys_enc
 
 	wb_enc->wb_job = job;
 	wb_enc->wb_conn = job->connector;
-	vm = phys_enc->dpu_kms->base.vm;
 
 	wb_cfg = &wb_enc->wb_cfg;
 
 	memset(wb_cfg, 0, sizeof(struct dpu_hw_wb_cfg));
 
-	ret = msm_framebuffer_prepare(job->fb, vm, false);
+	ret = msm_framebuffer_prepare(job->fb, false);
 	if (ret) {
 		DPU_ERROR("prep fb failed, %d\n", ret);
 		return;
@@ -596,7 +594,7 @@ static void dpu_encoder_phys_wb_prepare_wb_job(struct dpu_encoder_phys *phys_enc
 		return;
 	}
 
-	dpu_format_populate_addrs(vm, job->fb, &wb_cfg->dest);
+	dpu_format_populate_addrs(job->fb, &wb_cfg->dest);
 
 	wb_cfg->dest.width = job->fb->width;
 	wb_cfg->dest.height = job->fb->height;
@@ -619,14 +617,11 @@ static void dpu_encoder_phys_wb_cleanup_wb_job(struct dpu_encoder_phys *phys_enc
 		struct drm_writeback_job *job)
 {
 	struct dpu_encoder_phys_wb *wb_enc = to_dpu_encoder_phys_wb(phys_enc);
-	struct msm_gem_vm *vm;
 
 	if (!job->fb)
 		return;
 
-	vm = phys_enc->dpu_kms->base.vm;
-
-	msm_framebuffer_cleanup(job->fb, vm, false);
+	msm_framebuffer_cleanup(job->fb, false);
 	wb_enc->wb_job = NULL;
 	wb_enc->wb_conn = NULL;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index d115b79af771..b0d585c5315c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -274,15 +274,14 @@ int dpu_format_populate_plane_sizes(
 	return _dpu_format_populate_plane_sizes_linear(fmt, fb, layout);
 }
 
-static void _dpu_format_populate_addrs_ubwc(struct msm_gem_vm *vm,
-					    struct drm_framebuffer *fb,
+static void _dpu_format_populate_addrs_ubwc(struct drm_framebuffer *fb,
 					    struct dpu_hw_fmt_layout *layout)
 {
 	const struct msm_format *fmt;
 	uint32_t base_addr = 0;
 	bool meta;
 
-	base_addr = msm_framebuffer_iova(fb, vm, 0);
+	base_addr = msm_framebuffer_iova(fb, 0);
 
 	fmt = msm_framebuffer_format(fb);
 	meta = MSM_FORMAT_IS_UBWC(fmt);
@@ -355,26 +354,23 @@ static void _dpu_format_populate_addrs_ubwc(struct msm_gem_vm *vm,
 	}
 }
 
-static void _dpu_format_populate_addrs_linear(struct msm_gem_vm *vm,
-					      struct drm_framebuffer *fb,
+static void _dpu_format_populate_addrs_linear(struct drm_framebuffer *fb,
 					      struct dpu_hw_fmt_layout *layout)
 {
 	unsigned int i;
 
 	/* Populate addresses for simple formats here */
 	for (i = 0; i < layout->num_planes; ++i)
-		layout->plane_addr[i] = msm_framebuffer_iova(fb, vm, i);
+		layout->plane_addr[i] = msm_framebuffer_iova(fb, i);
 	}
 
 /**
  * dpu_format_populate_addrs - populate buffer addresses based on
  *                     mmu, fb, and format found in the fb
- * @vm:                address space pointer
  * @fb:                framebuffer pointer
  * @layout:            format layout structure to populate
  */
-void dpu_format_populate_addrs(struct msm_gem_vm *vm,
-			       struct drm_framebuffer *fb,
+void dpu_format_populate_addrs(struct drm_framebuffer *fb,
 			       struct dpu_hw_fmt_layout *layout)
 {
 	const struct msm_format *fmt;
@@ -384,7 +380,7 @@ void dpu_format_populate_addrs(struct msm_gem_vm *vm,
 	/* Populate the addresses given the fb */
 	if (MSM_FORMAT_IS_UBWC(fmt) ||
 			MSM_FORMAT_IS_TILE(fmt))
-		_dpu_format_populate_addrs_ubwc(vm, fb, layout);
+		_dpu_format_populate_addrs_ubwc(fb, layout);
 	else
-		_dpu_format_populate_addrs_linear(vm, fb, layout);
+		_dpu_format_populate_addrs_linear(fb, layout);
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
index 989f3e13c497..dc03f522e616 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
@@ -31,8 +31,7 @@ static inline bool dpu_find_format(u32 format, const u32 *supported_formats,
 	return false;
 }
 
-void dpu_format_populate_addrs(struct msm_gem_vm *vm,
-			       struct drm_framebuffer *fb,
+void dpu_format_populate_addrs(struct drm_framebuffer *fb,
 			       struct dpu_hw_fmt_layout *layout);
 
 int dpu_format_populate_plane_sizes(
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 6d47f43f52f7..07f0461223c3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -646,7 +646,6 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 	struct drm_framebuffer *fb = new_state->fb;
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_state);
-	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	int ret;
 
 	if (!new_state->fb)
@@ -654,9 +653,6 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 
 	DPU_DEBUG_PLANE(pdpu, "FB[%u]\n", fb->base.id);
 
-	/* cache vm */
-	pstate->vm = kms->base.vm;
-
 	/*
 	 * TODO: Need to sort out the msm_framebuffer_prepare() call below so
 	 *       we can use msm_atomic_prepare_fb() instead of doing the
@@ -664,13 +660,10 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 	 */
 	drm_gem_plane_helper_prepare_fb(plane, new_state);
 
-	if (pstate->vm) {
-		ret = msm_framebuffer_prepare(new_state->fb,
-				pstate->vm, pstate->needs_dirtyfb);
-		if (ret) {
-			DPU_ERROR("failed to prepare framebuffer\n");
-			return ret;
-		}
+	ret = msm_framebuffer_prepare(new_state->fb, pstate->needs_dirtyfb);
+	if (ret) {
+		DPU_ERROR("failed to prepare framebuffer\n");
+		return ret;
 	}
 
 	return 0;
@@ -689,8 +682,7 @@ static void dpu_plane_cleanup_fb(struct drm_plane *plane,
 
 	DPU_DEBUG_PLANE(pdpu, "FB[%u]\n", old_state->fb->base.id);
 
-	msm_framebuffer_cleanup(old_state->fb, old_pstate->vm,
-				old_pstate->needs_dirtyfb);
+	msm_framebuffer_cleanup(old_state->fb, old_pstate->needs_dirtyfb);
 }
 
 static int dpu_plane_check_inline_rotation(struct dpu_plane *pdpu,
@@ -1457,7 +1449,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane,
 	pstate->needs_qos_remap |= (is_rt_pipe != pdpu->is_rt_pipe);
 	pdpu->is_rt_pipe = is_rt_pipe;
 
-	dpu_format_populate_addrs(pstate->vm, new_state->fb, &pstate->layout);
+	dpu_format_populate_addrs(new_state->fb, &pstate->layout);
 
 	DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " DRM_RECT_FMT
 			", %p4cc ubwc %d\n", fb->base.id, DRM_RECT_FP_ARG(&state->src),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index 3578f52048a5..a3a6e9028333 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -17,7 +17,6 @@
 /**
  * struct dpu_plane_state: Define dpu extension of drm plane state object
  * @base:	base drm plane state object
- * @vm:	pointer to address space for input/output buffers
  * @pipe:	software pipe description
  * @r_pipe:	software pipe description of the second pipe
  * @pipe_cfg:	software pipe configuration
@@ -34,7 +33,6 @@
  */
 struct dpu_plane_state {
 	struct drm_plane_state base;
-	struct msm_gem_vm *vm;
 	struct dpu_sw_pipe pipe;
 	struct dpu_sw_pipe r_pipe;
 	struct dpu_sw_pipe_cfg pipe_cfg;
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
index 7743be6167f8..098c3b5ff2b2 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
@@ -79,30 +79,25 @@ static const struct drm_plane_funcs mdp4_plane_funcs = {
 static int mdp4_plane_prepare_fb(struct drm_plane *plane,
 				 struct drm_plane_state *new_state)
 {
-	struct msm_drm_private *priv = plane->dev->dev_private;
-	struct msm_kms *kms = priv->kms;
-
 	if (!new_state->fb)
 		return 0;
 
 	drm_gem_plane_helper_prepare_fb(plane, new_state);
 
-	return msm_framebuffer_prepare(new_state->fb, kms->vm, false);
+	return msm_framebuffer_prepare(new_state->fb, false);
 }
 
 static void mdp4_plane_cleanup_fb(struct drm_plane *plane,
 				  struct drm_plane_state *old_state)
 {
 	struct mdp4_plane *mdp4_plane = to_mdp4_plane(plane);
-	struct mdp4_kms *mdp4_kms = get_kms(plane);
-	struct msm_kms *kms = &mdp4_kms->base.base;
 	struct drm_framebuffer *fb = old_state->fb;
 
 	if (!fb)
 		return;
 
 	DBG("%s: cleanup: FB[%u]", mdp4_plane->name, fb->base.id);
-	msm_framebuffer_cleanup(fb, kms->vm, false);
+	msm_framebuffer_cleanup(fb, false);
 }
 
 
@@ -141,7 +136,6 @@ static void mdp4_plane_set_scanout(struct drm_plane *plane,
 {
 	struct mdp4_plane *mdp4_plane = to_mdp4_plane(plane);
 	struct mdp4_kms *mdp4_kms = get_kms(plane);
-	struct msm_kms *kms = &mdp4_kms->base.base;
 	enum mdp4_pipe pipe = mdp4_plane->pipe;
 
 	mdp4_write(mdp4_kms, REG_MDP4_PIPE_SRC_STRIDE_A(pipe),
@@ -153,13 +147,13 @@ static void mdp4_plane_set_scanout(struct drm_plane *plane,
 			MDP4_PIPE_SRC_STRIDE_B_P3(fb->pitches[3]));
 
 	mdp4_write(mdp4_kms, REG_MDP4_PIPE_SRCP0_BASE(pipe),
-			msm_framebuffer_iova(fb, kms->vm, 0));
+			msm_framebuffer_iova(fb, 0));
 	mdp4_write(mdp4_kms, REG_MDP4_PIPE_SRCP1_BASE(pipe),
-			msm_framebuffer_iova(fb, kms->vm, 1));
+			msm_framebuffer_iova(fb, 1));
 	mdp4_write(mdp4_kms, REG_MDP4_PIPE_SRCP2_BASE(pipe),
-			msm_framebuffer_iova(fb, kms->vm, 2));
+			msm_framebuffer_iova(fb, 2));
 	mdp4_write(mdp4_kms, REG_MDP4_PIPE_SRCP3_BASE(pipe),
-			msm_framebuffer_iova(fb, kms->vm, 3));
+			msm_framebuffer_iova(fb, 3));
 }
 
 static void mdp4_write_csc_config(struct mdp4_kms *mdp4_kms,
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index 9f68a4747203..7c790406d533 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -135,8 +135,6 @@ static const struct drm_plane_funcs mdp5_plane_funcs = {
 static int mdp5_plane_prepare_fb(struct drm_plane *plane,
 				 struct drm_plane_state *new_state)
 {
-	struct msm_drm_private *priv = plane->dev->dev_private;
-	struct msm_kms *kms = priv->kms;
 	bool needs_dirtyfb = to_mdp5_plane_state(new_state)->needs_dirtyfb;
 
 	if (!new_state->fb)
@@ -144,14 +142,12 @@ static int mdp5_plane_prepare_fb(struct drm_plane *plane,
 
 	drm_gem_plane_helper_prepare_fb(plane, new_state);
 
-	return msm_framebuffer_prepare(new_state->fb, kms->vm, needs_dirtyfb);
+	return msm_framebuffer_prepare(new_state->fb, needs_dirtyfb);
 }
 
 static void mdp5_plane_cleanup_fb(struct drm_plane *plane,
 				  struct drm_plane_state *old_state)
 {
-	struct mdp5_kms *mdp5_kms = get_kms(plane);
-	struct msm_kms *kms = &mdp5_kms->base.base;
 	struct drm_framebuffer *fb = old_state->fb;
 	bool needed_dirtyfb = to_mdp5_plane_state(old_state)->needs_dirtyfb;
 
@@ -159,7 +155,7 @@ static void mdp5_plane_cleanup_fb(struct drm_plane *plane,
 		return;
 
 	DBG("%s: cleanup: FB[%u]", plane->name, fb->base.id);
-	msm_framebuffer_cleanup(fb, kms->vm, needed_dirtyfb);
+	msm_framebuffer_cleanup(fb, needed_dirtyfb);
 }
 
 static int mdp5_plane_atomic_check_with_state(struct drm_crtc_state *crtc_state,
@@ -467,8 +463,6 @@ static void set_scanout_locked(struct mdp5_kms *mdp5_kms,
 			       enum mdp5_pipe pipe,
 			       struct drm_framebuffer *fb)
 {
-	struct msm_kms *kms = &mdp5_kms->base.base;
-
 	mdp5_write(mdp5_kms, REG_MDP5_PIPE_SRC_STRIDE_A(pipe),
 			MDP5_PIPE_SRC_STRIDE_A_P0(fb->pitches[0]) |
 			MDP5_PIPE_SRC_STRIDE_A_P1(fb->pitches[1]));
@@ -478,13 +472,13 @@ static void set_scanout_locked(struct mdp5_kms *mdp5_kms,
 			MDP5_PIPE_SRC_STRIDE_B_P3(fb->pitches[3]));
 
 	mdp5_write(mdp5_kms, REG_MDP5_PIPE_SRC0_ADDR(pipe),
-			msm_framebuffer_iova(fb, kms->vm, 0));
+			msm_framebuffer_iova(fb, 0));
 	mdp5_write(mdp5_kms, REG_MDP5_PIPE_SRC1_ADDR(pipe),
-			msm_framebuffer_iova(fb, kms->vm, 1));
+			msm_framebuffer_iova(fb, 1));
 	mdp5_write(mdp5_kms, REG_MDP5_PIPE_SRC2_ADDR(pipe),
-			msm_framebuffer_iova(fb, kms->vm, 2));
+			msm_framebuffer_iova(fb, 2));
 	mdp5_write(mdp5_kms, REG_MDP5_PIPE_SRC3_ADDR(pipe),
-			msm_framebuffer_iova(fb, kms->vm, 3));
+			msm_framebuffer_iova(fb, 3));
 }
 
 /* Note: mdp5_plane->pipe_lock must be locked */
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 761e7e221ad9..eb009bd193e3 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -274,12 +274,9 @@ struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
 int msm_gem_prime_pin(struct drm_gem_object *obj);
 void msm_gem_prime_unpin(struct drm_gem_object *obj);
 
-int msm_framebuffer_prepare(struct drm_framebuffer *fb,
-		struct msm_gem_vm *vm, bool needs_dirtyfb);
-void msm_framebuffer_cleanup(struct drm_framebuffer *fb,
-		struct msm_gem_vm *vm, bool needed_dirtyfb);
-uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb,
-		struct msm_gem_vm *vm, int plane);
+int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb);
+void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb);
+uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb, int plane);
 struct drm_gem_object *msm_framebuffer_bo(struct drm_framebuffer *fb, int plane);
 const struct msm_format *msm_framebuffer_format(struct drm_framebuffer *fb);
 struct drm_framebuffer *msm_framebuffer_create(struct drm_device *dev,
diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 6df318b73534..8a3b88130f4d 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -75,10 +75,10 @@ void msm_framebuffer_describe(struct drm_framebuffer *fb, struct seq_file *m)
 
 /* prepare/pin all the fb's bo's for scanout.
  */
-int msm_framebuffer_prepare(struct drm_framebuffer *fb,
-		struct msm_gem_vm *vm,
-		bool needs_dirtyfb)
+int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb)
 {
+	struct msm_drm_private *priv = fb->dev->dev_private;
+	struct msm_gem_vm *vm = priv->kms->vm;
 	struct msm_framebuffer *msm_fb = to_msm_framebuffer(fb);
 	int ret, i, n = fb->format->num_planes;
 
@@ -98,10 +98,10 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb,
 	return 0;
 }
 
-void msm_framebuffer_cleanup(struct drm_framebuffer *fb,
-		struct msm_gem_vm *vm,
-		bool needed_dirtyfb)
+void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb)
 {
+	struct msm_drm_private *priv = fb->dev->dev_private;
+	struct msm_gem_vm *vm = priv->kms->vm;
 	struct msm_framebuffer *msm_fb = to_msm_framebuffer(fb);
 	int i, n = fb->format->num_planes;
 
@@ -115,8 +115,7 @@ void msm_framebuffer_cleanup(struct drm_framebuffer *fb,
 		memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
 }
 
-uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb,
-		struct msm_gem_vm *vm, int plane)
+uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb, int plane)
 {
 	struct msm_framebuffer *msm_fb = to_msm_framebuffer(fb);
 	return msm_fb->iova[plane] + fb->offsets[plane];
-- 
2.50.0

