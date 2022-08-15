Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7995935FA
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 21:01:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59210D25E5;
	Mon, 15 Aug 2022 19:00:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76B3D2535
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 18:59:51 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id y13so14995200ejp.13
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 11:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=QEEHOcVX9jcWEvEnHDVnuQFTANJGIJsGfJ2gHsBc/Ng=;
 b=FHccX+3OmIR1DOhFLZkXnpKKirdv+4dT3lU60vF1DjmXJ7g2NKlweUs5UlOOdA8IxV
 tyEOvHMrV4kayxtKLA3a7Rw6q2ehingKewdiU+qrBDOUuT3mW7NywRZUHq3rLevPvEma
 t+SrVtohctsmlyLJ4pQnVeOvbV54hdPpso7fsa96j2qO2mDkR9keLzu4cvhUeL+xIQqJ
 Yyi+SEo7zShji4kSKafcNgEKSqX+SYJ8GYoHIuHhXQOS5mTG/61fC5FoZuKu3v6iNiqx
 wqjZJVGA910KGivD/iRVZF0lY+yfbHM/S5mHaAAJfhKLt+fLNjxAow6uQtAlwTxgJurM
 txcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=QEEHOcVX9jcWEvEnHDVnuQFTANJGIJsGfJ2gHsBc/Ng=;
 b=EYEV5eAbULMNizQAh2kmnNXVjdZWwE/eYtQD4Zr7fAuwmuRKCk9MC5OCasFIXY/RKl
 yHmbxtKRRycJLdvcHAtf5BENoOFX7euXDyRkNo0a/u6UfAeiGvnvdZDrAKFoyMu6y87z
 mJY2Bn+NoEBrd/qmY/CyLiXMY2Qq1opI+3U2GlQn2MLyBLPiiHYr4dXOvhoJa1oMKpfE
 CLynjOYYeaKtkTHgHt9Pk/KucjYsaYgbc08k89Huc6/4T+MFKUaFnFH0Z3tavYsKdlFv
 unNRYK5bPv8gIKNP71xdTTx4ZBE+TO2ZoRT7aPr2gIHM7uSxrB4myKZRs8MRCdmsKkHL
 eVDA==
X-Gm-Message-State: ACgBeo2ynfMUvnf8S7iLssfa/stbt89H0X29YNA+Ay2h+Ri2FhvKcTId
 OD/Sdwt3E0gbmL7ts1DLJBhuCAE7Dh8=
X-Google-Smtp-Source: AA6agR4Qt1yFvTFYftOiZppBr0z9FrQKl8+LijUpfdAglnygyyZOpCtDJcj3x21TkE4K+PUSdIPJgA==
X-Received: by 2002:a17:907:2c78:b0:730:df57:1237 with SMTP id
 ib24-20020a1709072c7800b00730df571237mr10802097ejc.196.1660589989981; 
 Mon, 15 Aug 2022 11:59:49 -0700 (PDT)
Received: from able.fritz.box (p57b0bd9f.dip0.t-ipconnect.de. [87.176.189.159])
 by smtp.gmail.com with ESMTPSA id
 d10-20020a170906304a00b00731745a7e62sm3553805ejd.28.2022.08.15.11.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 11:59:49 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 07/10] drm/amdgpu: revert "fix limiting AV1 to the first
 instance on VCN3"
Date: Mon, 15 Aug 2022 20:59:37 +0200
Message-Id: <20220815185940.4744-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220815185940.4744-1-christian.koenig@amd.com>
References: <20220815185940.4744-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 250195ff744f260c169f5427422b6f39c58cb883.

The job should now be initialized when we reach the parser functions.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
index 39405f0db824..3cabceee5f57 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
@@ -1761,21 +1761,23 @@ static const struct amdgpu_ring_funcs vcn_v3_0_dec_sw_ring_vm_funcs = {
 	.emit_reg_write_reg_wait = amdgpu_ring_emit_reg_write_reg_wait_helper,
 };
 
-static int vcn_v3_0_limit_sched(struct amdgpu_cs_parser *p)
+static int vcn_v3_0_limit_sched(struct amdgpu_cs_parser *p,
+				struct amdgpu_job *job)
 {
 	struct drm_gpu_scheduler **scheds;
 
 	/* The create msg must be in the first IB submitted */
-	if (atomic_read(&p->entity->fence_seq))
+	if (atomic_read(&job->base.entity->fence_seq))
 		return -EINVAL;
 
 	scheds = p->adev->gpu_sched[AMDGPU_HW_IP_VCN_DEC]
 		[AMDGPU_RING_PRIO_DEFAULT].sched;
-	drm_sched_entity_modify_sched(p->entity, scheds, 1);
+	drm_sched_entity_modify_sched(job->base.entity, scheds, 1);
 	return 0;
 }
 
-static int vcn_v3_0_dec_msg(struct amdgpu_cs_parser *p, uint64_t addr)
+static int vcn_v3_0_dec_msg(struct amdgpu_cs_parser *p, struct amdgpu_job *job,
+			    uint64_t addr)
 {
 	struct ttm_operation_ctx ctx = { false, false };
 	struct amdgpu_bo_va_mapping *map;
@@ -1846,7 +1848,7 @@ static int vcn_v3_0_dec_msg(struct amdgpu_cs_parser *p, uint64_t addr)
 		if (create[0] == 0x7 || create[0] == 0x10 || create[0] == 0x11)
 			continue;
 
-		r = vcn_v3_0_limit_sched(p);
+		r = vcn_v3_0_limit_sched(p, job);
 		if (r)
 			goto out;
 	}
@@ -1860,7 +1862,7 @@ static int vcn_v3_0_ring_patch_cs_in_place(struct amdgpu_cs_parser *p,
 					   struct amdgpu_job *job,
 					   struct amdgpu_ib *ib)
 {
-	struct amdgpu_ring *ring = to_amdgpu_ring(p->entity->rq->sched);
+	struct amdgpu_ring *ring = to_amdgpu_ring(job->base.sched);
 	uint32_t msg_lo = 0, msg_hi = 0;
 	unsigned i;
 	int r;
@@ -1879,7 +1881,8 @@ static int vcn_v3_0_ring_patch_cs_in_place(struct amdgpu_cs_parser *p,
 			msg_hi = val;
 		} else if (reg == PACKET0(p->adev->vcn.internal.cmd, 0) &&
 			   val == 0) {
-			r = vcn_v3_0_dec_msg(p, ((u64)msg_hi) << 32 | msg_lo);
+			r = vcn_v3_0_dec_msg(p, job,
+					     ((u64)msg_hi) << 32 | msg_lo);
 			if (r)
 				return r;
 		}
-- 
2.25.1

