Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43685AC0D0C
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 15:41:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF72F10EE4D;
	Thu, 22 May 2025 13:41:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Uh4HHdfE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7D2010EE2F;
 Thu, 22 May 2025 13:41:25 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-ad5574b59c0so947282666b.2; 
 Thu, 22 May 2025 06:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747921284; x=1748526084; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jvE9U9E6MeXW5TTRoVzsCHYAU8ZDHBiQxkta48vTfNM=;
 b=Uh4HHdfEZVRA140jXCbBrrAePzVghYC49sR+rmyPl2xqV4sZBrH6BvGsLVsaGgkwrl
 qwj2oSlExiauyuxs+ewx4uUcfbdHbTanwSXs6Xw9djRiF1R/EVkh843c6iMwRK2ULimt
 t5vqwErLqVX1WrlPqw5Wpfrr5tmyezRS0ado4RmffFsBvrHJCl6+LD/sYcg05TcKKRuk
 Vx+KwNBvfppz05D3sIBX2mYsxPcujuDCAJpZjGL9Gdcvk8TERlMpHGjBn3Ra51pgpDlF
 bkyHFgzk/uONsfMjU0Mbnxh9ljSqV0aLGFXd/D5m3xOexxbzZos+arluajWCA6mB+efA
 +QPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747921284; x=1748526084;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jvE9U9E6MeXW5TTRoVzsCHYAU8ZDHBiQxkta48vTfNM=;
 b=OaShjGHTEIIBH40R8zUiRq2UzAHko6pK0vsPZ0JXfyc1DGqphBLwUmE9nKDljM/JxK
 ofUOYu2Sn/34KZmXRsV96Rp8wRNbgxTFZbICAp0f87p52KmuOA+rm+azzGcFFk/03Ht0
 bzA0kKYPsG0GdJiU4DhXwAlEpiCrjP0CRsEXRE577rPQQFcRnFSg6thWkUYunEndNndq
 Rtyen9q/mgsUeUtFGxbitFWmswU8v/M50vYp44TW9SfVgPNDOZf1aQvlaIwKJhiv3lZT
 flqZSnXwUWvpzoGVIBVaKSOlNZUthQld7zdaNa+HH9fDKGkwWnU1C4Irb8I9t3hyD5Kn
 Z3mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaBSaRGd6YU4gd2bcaViv62KxJcxkqqusnEsnE0jnaxBdEDNcn+NK6QBtxyMQASO/mZHrPGNrJ@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxk9USG3Fsjgzu/MqS/DhjKwd3OCrtaS8dqzD5EjI3ydLBXV88m
 T3iHr4YHfi/NzhRuc8fZ/7CFG1NNWDPmC1yIk9vdN6SCCfIgkOqa8yZOKf/DTw==
X-Gm-Gg: ASbGncsplAvyOiNfh03T4gPfeqQdubPMZECyW2JgfuOCBCgY4GJ3pWmZ2Mv+gFHyU7D
 BbY18y3tnk7EuSIp1WiLvK4/kdOkLx9sGgagQrUj1Vvdl6KRHDvVnPZxE6DKI7ApJhJrlVqk006
 mRLmEaNzMlBT9fZmmvt09WWsi35KzVppooQ4q75DHjcGBims5vL+OXHUQWOaUxcI4+lFsP8Dx4D
 zvxOE8FQA5kqL7zWBSToiiKEUa3PCSZRwX3Xb3s55s9gDv90OlvTI6Z/18BVnz/Aq0P2HfevRZd
 B4X+dGmQJ9S5ytFPJhPB1ZXHK4dzgiiELOOJHzzTGuMnQfSlsHHqMCT5DPubYEQ=
X-Google-Smtp-Source: AGHT+IG6Jec/hsDbA/RqC+Vu2Hcodw6TV0W4bCgZkq/JgIq7Vy7MUdx6Qx/wUTJa0Eset27d01pknQ==
X-Received: by 2002:a17:906:48c8:b0:ad5:4a43:5ae8 with SMTP id
 a640c23a62f3a-ad54a435b2cmr1555052066b.12.1747921284100; 
 Thu, 22 May 2025 06:41:24 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1533:800:9db1:9b52:19ec:8c5a])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d04af40sm1082487566b.34.2025.05.22.06.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 06:41:23 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, phasta@mailbox.org, dakr@kernel.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 4/4] drm/amdgpu: fix gang submission error handling
Date: Thu, 22 May 2025 15:41:17 +0200
Message-Id: <20250522134117.7561-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250522134117.7561-1-christian.koenig@amd.com>
References: <20250522134117.7561-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For the unlikely case that we ran into an ENOMEM while fixing up the gang
submission dependencies we can't clean up any more since the gang
members are already armed.

Fix this by using pre-allocated dependency slots and re-ordering the
code, also fix a double unref since the fence reference is also dropped
on error.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 53 ++++++++++++++------------
 1 file changed, 29 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 82df06a72ee0..4728de07315b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1289,36 +1289,21 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 	uint64_t seq;
 	int r;
 
-	for (i = 0; i < p->gang_size; ++i)
-		drm_sched_job_arm(&p->jobs[i]->base);
-
-	for (i = 0; i < p->gang_size; ++i) {
-		struct dma_fence *fence;
-
-		if (p->jobs[i] == leader)
-			continue;
-
-		fence = &p->jobs[i]->base.s_fence->scheduled;
-		dma_fence_get(fence);
-		r = drm_sched_job_add_dependency(&leader->base, fence);
-		if (r) {
-			dma_fence_put(fence);
-			return r;
-		}
-	}
-
-	if (p->gang_size > 1) {
-		for (i = 0; i < p->gang_size; ++i)
-			amdgpu_job_set_gang_leader(p->jobs[i], leader);
-	}
+	/* Preallocate the memory for the gang dependencies */
+	r = drm_sched_job_prealloc_dependency_slots(&leader->base,
+						    p->gang_size -1);
+	if (r)
+		return r;
 
-	/* No memory allocation is allowed while holding the notifier lock.
+	/*
+	 * No memory allocation is allowed while holding the notifier lock.
 	 * The lock is held until amdgpu_cs_submit is finished and fence is
 	 * added to BOs.
 	 */
 	mutex_lock(&p->adev->notifier_lock);
 
-	/* If userptr are invalidated after amdgpu_cs_parser_bos(), return
+	/*
+	 * If userptr are invalidated after amdgpu_cs_parser_bos(), return
 	 * -EAGAIN, drmIoctl in libdrm will restart the amdgpu_cs_ioctl.
 	 */
 	r = 0;
@@ -1333,6 +1318,26 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 		return r;
 	}
 
+	for (i = 0; i < p->gang_size; ++i)
+		drm_sched_job_arm(&p->jobs[i]->base);
+
+	for (i = 0; i < p->gang_size; ++i) {
+		struct dma_fence *fence;
+
+		if (p->jobs[i] == leader)
+			continue;
+
+		fence = dma_fence_get(&p->jobs[i]->base.s_fence->scheduled);
+		r = drm_sched_job_add_dependency(&leader->base, fence);
+		/* We have preallocated a slot, so this should never fail */
+		WARN_ON(r);
+	}
+
+	if (p->gang_size > 1) {
+		for (i = 0; i < p->gang_size; ++i)
+			amdgpu_job_set_gang_leader(p->jobs[i], leader);
+	}
+
 	p->fence = dma_fence_get(&leader->base.s_fence->finished);
 	drm_exec_for_each_locked_object(&p->exec, index, gobj) {
 
-- 
2.34.1

