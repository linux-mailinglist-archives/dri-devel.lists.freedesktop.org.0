Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED54164C4B
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 18:43:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8DFA6E83F;
	Wed, 19 Feb 2020 17:43:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 132606E842
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 17:43:10 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id p8so21278805iln.12
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 09:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8VamPOzOFp0h6bF9coMhzVUXDhZEhY+KJ39znRhBSOQ=;
 b=S0BybC/LcwM+sMXNhjhATGff7wWVLyrPSQrUSaCM5vM2OcxdjgEZnxw+EsfMo7Tlbx
 4629wCbGvAbknrmn7sFJSA8n3p/qLh69icwvTKlbfJk3ku4Uws/koWFDUyJkeuCuh88r
 HZXS5ScmU41sVch/O2LCdfnkeqI81iLkm1LNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8VamPOzOFp0h6bF9coMhzVUXDhZEhY+KJ39znRhBSOQ=;
 b=Sk7vsQtxgvCqS5487UAoKPx2Xov4CGNxjn7bmT6UQ9w1MDLvfuIQa9l6ZMY/ZTyGGk
 Xt3k39dnt7YeIx+KSyQF2Nz7QPQJnn/hWgT/FC0Dr3UJIvAUB+tC4s/zHtXmoc1fpLB3
 2X/nWcBo9ZRF+lEtG12eba9KcY5HKPRmaky956Aecq4+3NZLFhZK9ANhBKkdIkKN7LRT
 BIJd6pjigxHwatoCrBD4jDNpYw4p+KZK0dCqj/XlMcRgnkaPHlz38L8k9InbtW9O7YzU
 oJFvPCoFhpkN/FrkuyL8OXX5RFOZnLb0Nj77pbEU6JCLhwqaamjBV7gH3nFMgJLi3GbA
 5qYA==
X-Gm-Message-State: APjAAAV1J5ydv9+mkVbF9XiGe75uE3X6M5GquVGwKZJBAnqJDEuQQKkY
 fX/H58hJupQJ+A7wMQ+co8avT0cheGM=
X-Google-Smtp-Source: APXvYqwevqK6J8wLASlbM0W/NAsY85ngNqbvK6WaR5nDhBNGalMr/6g1gnP6s1SYxdqDux5vi2L1OA==
X-Received: by 2002:a92:3989:: with SMTP id h9mr23430181ilf.156.1582134189162; 
 Wed, 19 Feb 2020 09:43:09 -0800 (PST)
Received: from ddavenport4.bld.corp.google.com
 ([2620:15c:183:0:92f:a80a:519d:f777])
 by smtp.gmail.com with ESMTPSA id a21sm60355ioh.29.2020.02.19.09.43.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 19 Feb 2020 09:43:08 -0800 (PST)
From: Drew Davenport <ddavenport@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] drm/msm/dpu: Remove unused function arguments
Date: Wed, 19 Feb 2020 10:42:24 -0700
Message-Id: <20200219104148.1.I0183a464f2788d41e6902f3535941f69c594b4c1@changeid>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Alexios Zavras <alexios.zavras@intel.com>,
 linux-arm-msm@vger.kernel.org, Drew Davenport <ddavenport@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Several functions arguments in the resource manager are unused, so
remove them.

Signed-off-by: Drew Davenport <ddavenport@chromium.org>
---

 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 37 ++++++++++----------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 23f5b1433b357..dea1dba441fe7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -144,8 +144,7 @@ static int _dpu_rm_hw_blk_create(
 		const struct dpu_mdss_cfg *cat,
 		void __iomem *mmio,
 		enum dpu_hw_blk_type type,
-		uint32_t id,
-		const void *hw_catalog_info)
+		uint32_t id)
 {
 	struct dpu_rm_hw_blk *blk;
 	void *hw;
@@ -223,7 +222,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 		}
 
 		rc = _dpu_rm_hw_blk_create(rm, cat, mmio, DPU_HW_BLK_LM,
-				cat->mixer[i].id, &cat->mixer[i]);
+				cat->mixer[i].id);
 		if (rc) {
 			DPU_ERROR("failed: lm hw not available\n");
 			goto fail;
@@ -244,7 +243,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 
 	for (i = 0; i < cat->pingpong_count; i++) {
 		rc = _dpu_rm_hw_blk_create(rm, cat, mmio, DPU_HW_BLK_PINGPONG,
-				cat->pingpong[i].id, &cat->pingpong[i]);
+				cat->pingpong[i].id);
 		if (rc) {
 			DPU_ERROR("failed: pp hw not available\n");
 			goto fail;
@@ -258,7 +257,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 		}
 
 		rc = _dpu_rm_hw_blk_create(rm, cat, mmio, DPU_HW_BLK_INTF,
-				cat->intf[i].id, &cat->intf[i]);
+				cat->intf[i].id);
 		if (rc) {
 			DPU_ERROR("failed: intf hw not available\n");
 			goto fail;
@@ -267,7 +266,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 
 	for (i = 0; i < cat->ctl_count; i++) {
 		rc = _dpu_rm_hw_blk_create(rm, cat, mmio, DPU_HW_BLK_CTL,
-				cat->ctl[i].id, &cat->ctl[i]);
+				cat->ctl[i].id);
 		if (rc) {
 			DPU_ERROR("failed: ctl hw not available\n");
 			goto fail;
@@ -293,7 +292,6 @@ static bool _dpu_rm_needs_split_display(const struct msm_display_topology *top)
  *	pingpong
  * @rm: dpu resource manager handle
  * @enc_id: encoder id requesting for allocation
- * @reqs: proposed use case requirements
  * @lm: proposed layer mixer, function checks if lm, and all other hardwired
  *      blocks connected to the lm (pp) is available and appropriate
  * @pp: output parameter, pingpong block attached to the layer mixer.
@@ -305,7 +303,6 @@ static bool _dpu_rm_needs_split_display(const struct msm_display_topology *top)
 static bool _dpu_rm_check_lm_and_get_connected_blks(
 		struct dpu_rm *rm,
 		uint32_t enc_id,
-		struct dpu_rm_requirements *reqs,
 		struct dpu_rm_hw_blk *lm,
 		struct dpu_rm_hw_blk **pp,
 		struct dpu_rm_hw_blk *primary_lm)
@@ -384,7 +381,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm, uint32_t enc_id,
 		lm[lm_count] = iter_i.blk;
 
 		if (!_dpu_rm_check_lm_and_get_connected_blks(
-				rm, enc_id, reqs, lm[lm_count],
+				rm, enc_id, lm[lm_count],
 				&pp[lm_count], NULL))
 			continue;
 
@@ -399,7 +396,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm, uint32_t enc_id,
 				continue;
 
 			if (!_dpu_rm_check_lm_and_get_connected_blks(
-					rm, enc_id, reqs, iter_j.blk,
+					rm, enc_id, iter_j.blk,
 					&pp[lm_count], iter_i.blk))
 				continue;
 
@@ -480,20 +477,19 @@ static int _dpu_rm_reserve_ctls(
 static int _dpu_rm_reserve_intf(
 		struct dpu_rm *rm,
 		uint32_t enc_id,
-		uint32_t id,
-		enum dpu_hw_blk_type type)
+		uint32_t id)
 {
 	struct dpu_rm_hw_iter iter;
 	int ret = 0;
 
 	/* Find the block entry in the rm, and note the reservation */
-	dpu_rm_init_hw_iter(&iter, 0, type);
+	dpu_rm_init_hw_iter(&iter, 0, DPU_HW_BLK_INTF);
 	while (_dpu_rm_get_hw_locked(rm, &iter)) {
 		if (iter.blk->id != id)
 			continue;
 
 		if (RESERVED_BY_OTHER(iter.blk, enc_id)) {
-			DPU_ERROR("type %d id %d already reserved\n", type, id);
+			DPU_ERROR("intf id %d already reserved\n", id);
 			return -ENAVAIL;
 		}
 
@@ -504,7 +500,7 @@ static int _dpu_rm_reserve_intf(
 
 	/* Shouldn't happen since intfs are fixed at probe */
 	if (!iter.hw) {
-		DPU_ERROR("couldn't find type %d id %d\n", type, id);
+		DPU_ERROR("couldn't find intf id %d\n", id);
 		return -EINVAL;
 	}
 
@@ -523,8 +519,7 @@ static int _dpu_rm_reserve_intf_related_hw(
 		if (hw_res->intfs[i] == INTF_MODE_NONE)
 			continue;
 		id = i + INTF_0;
-		ret = _dpu_rm_reserve_intf(rm, enc_id, id,
-				DPU_HW_BLK_INTF);
+		ret = _dpu_rm_reserve_intf(rm, enc_id, id);
 		if (ret)
 			return ret;
 	}
@@ -535,7 +530,6 @@ static int _dpu_rm_reserve_intf_related_hw(
 static int _dpu_rm_make_reservation(
 		struct dpu_rm *rm,
 		struct drm_encoder *enc,
-		struct drm_crtc_state *crtc_state,
 		struct dpu_rm_requirements *reqs)
 {
 	int ret;
@@ -560,9 +554,7 @@ static int _dpu_rm_make_reservation(
 }
 
 static int _dpu_rm_populate_requirements(
-		struct dpu_rm *rm,
 		struct drm_encoder *enc,
-		struct drm_crtc_state *crtc_state,
 		struct dpu_rm_requirements *reqs,
 		struct msm_display_topology req_topology)
 {
@@ -621,14 +613,13 @@ int dpu_rm_reserve(
 
 	mutex_lock(&rm->rm_lock);
 
-	ret = _dpu_rm_populate_requirements(rm, enc, crtc_state, &reqs,
-					    topology);
+	ret = _dpu_rm_populate_requirements(enc, &reqs, topology);
 	if (ret) {
 		DPU_ERROR("failed to populate hw requirements\n");
 		goto end;
 	}
 
-	ret = _dpu_rm_make_reservation(rm, enc, crtc_state, &reqs);
+	ret = _dpu_rm_make_reservation(rm, enc, &reqs);
 	if (ret) {
 		DPU_ERROR("failed to reserve hw resources: %d\n", ret);
 		_dpu_rm_release_reservation(rm, enc->base.id);
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
