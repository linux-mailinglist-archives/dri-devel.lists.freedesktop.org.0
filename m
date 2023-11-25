Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CA57F8DE9
	for <lists+dri-devel@lfdr.de>; Sat, 25 Nov 2023 20:23:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA9D10E038;
	Sat, 25 Nov 2023 19:23:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 540D410E038
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Nov 2023 19:23:06 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-77896da2118so169435585a.1
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Nov 2023 11:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700940185; x=1701544985; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Lb+54asHpI2xznDeoR9SqIe43L0n7p5u/l/dRCvBZE8=;
 b=aSuwJTJ3YOkNruqP0I6UF8UkQ2PMUvhzhEseOnzvbFc3k608RJ/XdsgDkwU3aOavqn
 25bwU0ZXwpF2x+nwZ+ToIBcWX37NbVyDcCu3UNZQE7pdq35Qo8SMrwSAlowbi+WiptX1
 cdCMCFe4ifVGMgqQIEZKPN9qj9tyoTZyoW+ZjQwSeqb5uo10wvkHqedzgfMhYW51fy3w
 45pTwU/6E50NdmoiYHtO4kB8aPKuQVI2TBVUl5BggDEGzCgw+E11lPN3BZg+PAoiEB81
 nRE5iS7yvi4huiFiJ2e995uL+jk17GXW9WK+8VhYeb5UeecIxJmTBTymhGN5+bftFQRE
 GqNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700940185; x=1701544985;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Lb+54asHpI2xznDeoR9SqIe43L0n7p5u/l/dRCvBZE8=;
 b=kTFoJ/9klYiAdVBqL8HUVaBUXvk5STIQ1fTGcxAjineWKFZgPez7Lqu5vSDLxnDM0+
 5mSKPjKsRaPm23Qlt5uAuA6R2LJGCLA8rcF/4PzXPoAcpKjYLNujDOGDB8CYzPXn05Uw
 pnWMSp6rR/ZreijX0gkSi5II4copem+ff81PeKnRC6o5veHXvfUZ9lXxXYpYIMIB6yW1
 q99EkwuMlruoq1B6ZgoxKPinkrHrQG5utWuX1qO8Y2X2++J7qZGzFhHS/LQ8btCoChBt
 10VpD1V8oXV1p8kuCA7pBjMPE3dCeJNCRLjX7XG2NwqcgjnA7YmORE3Neil1IU5R9Baj
 dzqw==
X-Gm-Message-State: AOJu0Yye72AVz3YGAMGiaeR4plB5kMRXs5xUJx5mPZTfsvZPu0vIP9Wp
 SnAyVNuzbqQ+bp+8sstrVR4WNKMZmFZc+A==
X-Google-Smtp-Source: AGHT+IF965vFeK4L2720NdhJFgHZITxOKxIL7H4Y4kD0GBlUHsq+Aj2Hx8q7vYJGWRpVuKKpBBi+PQ==
X-Received: by 2002:a05:622a:5da6:b0:423:a0e1:c58f with SMTP id
 fu38-20020a05622a5da600b00423a0e1c58fmr3290073qtb.59.1700940184605; 
 Sat, 25 Nov 2023 11:23:04 -0800 (PST)
Received: from localhost.localdomain ([76.65.20.140])
 by smtp.gmail.com with ESMTPSA id
 hj5-20020a05622a620500b00423a073b525sm1189898qtb.72.2023.11.25.11.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Nov 2023 11:23:04 -0800 (PST)
From: Luben Tuikov <ltuikov89@gmail.com>
To: Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/sched: Fix compilation issues with DRM priority rename
Date: Sat, 25 Nov 2023 14:22:47 -0500
Message-ID: <20231125192246.87268-2-ltuikov89@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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
Cc: kernel test robot <lkp@intel.com>, Luben Tuikov <ltuikov89@gmail.com>,
 Matt Coster <matt.coster@imgtec.com>, Danilo Krummrich <dakr@redhat.com>,
 Donald Robson <donald.robson@imgtec.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix compilation issues with DRM scheduler priority rename MIN to LOW.

Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202311252109.WgbJsSkG-lkp@intel.com/
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Frank Binns <frank.binns@imgtec.com>
Cc: Donald Robson <donald.robson@imgtec.com>
Cc: Matt Coster <matt.coster@imgtec.com>
Cc: Direct Rendering Infrastructure - Development <dri-devel@lists.freedesktop.org>
Fixes: fe375c74806dbd ("drm/sched: Rename priority MIN to LOW")
Fixes: 5f03a507b29e44 ("drm/nouveau: implement 1:1 scheduler - entity relationship")
---
 drivers/gpu/drm/imagination/pvr_queue.c | 2 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_queue.c b/drivers/gpu/drm/imagination/pvr_queue.c
index d65c3fbedf5ac4..5ed9c98fb599c8 100644
--- a/drivers/gpu/drm/imagination/pvr_queue.c
+++ b/drivers/gpu/drm/imagination/pvr_queue.c
@@ -1292,7 +1292,7 @@ struct pvr_queue *pvr_queue_create(struct pvr_context *ctx,
 		goto err_release_ufo;
 
 	err = drm_sched_entity_init(&queue->entity,
-				    DRM_SCHED_PRIORITY_MIN,
+				    DRM_SCHED_PRIORITY_KERNEL,
 				    &sched, 1, &ctx->faulty);
 	if (err)
 		goto err_sched_fini;
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index 3393647bd94423..dd98f6910f9cab 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -18,7 +18,7 @@
  * index to the run-queue array.
  */
 enum nouveau_sched_priority {
-	NOUVEAU_SCHED_PRIORITY_SINGLE = DRM_SCHED_PRIORITY_MIN,
+	NOUVEAU_SCHED_PRIORITY_SINGLE = DRM_SCHED_PRIORITY_KERNEL,
 	NOUVEAU_SCHED_PRIORITY_COUNT,
 };
 
@@ -423,7 +423,7 @@ nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
 	if (ret)
 		goto fail_wq;
 
-	/* Using DRM_SCHED_PRIORITY_MIN, since that's what we're required to use
+	/* Using DRM_SCHED_PRIORITY_KERNEL, since that's what we're required to use
 	 * when we want to have a single run-queue only.
 	 *
 	 * It's not documented, but one will find out when trying to use any
@@ -433,7 +433,7 @@ nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
 	 * Can't use NOUVEAU_SCHED_PRIORITY_SINGLE either, because it's not
 	 * matching the enum type used in drm_sched_entity_init().
 	 */
-	ret = drm_sched_entity_init(entity, DRM_SCHED_PRIORITY_MIN,
+	ret = drm_sched_entity_init(entity, DRM_SCHED_PRIORITY_KERNEL,
 				    &drm_sched, 1, NULL);
 	if (ret)
 		goto fail_sched;

base-commit: 38f922a563aac3148ac73e73689805917f034cb5
-- 
2.43.0

