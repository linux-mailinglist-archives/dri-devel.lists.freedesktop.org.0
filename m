Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE900573051
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 10:13:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E6F9555E;
	Wed, 13 Jul 2022 08:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83EF095238;
 Wed, 13 Jul 2022 08:12:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 99C3D61A38;
 Wed, 13 Jul 2022 08:12:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D7ADC341D9;
 Wed, 13 Jul 2022 08:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657699952;
 bh=cM9G0MOjjhx8LPxbc5xrR5jmZnKudFExd+QGPJMHw58=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=utTlqGPlohgL+89pHzreF7oDyf1++cFRoyWGyyvhoW80OuY6DmdIx44Uo41/m5Lqm
 45d9BqsYTnYqnDC5dWRp5H7oN7KKXY6FMu1OZwpknZuyT+5PpeMka6ny/jPsUf9ScH
 bzIjPXW1p+5QMOS/ZVMlzrR4RYOQ460robxut9tBkilCcbqv6tVmKgdpwjmU/DvpS3
 oTFsinoAhqa2dlkSD30GwyzuewlEfcDcz4IgMurMfNTmUT44PuRu/Yz3HFLOkFlvfd
 orXoyXTMwSClhIet7rootxGIhz0Cb6PihyH1CluhKpks8PlhzbEboQNG0cxmQVNQtG
 b1XAZmBMZuMrg==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oBXTx-004zt5-I3;
 Wed, 13 Jul 2022 09:12:29 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH v2 12/39] drm/i915: gem: add kernel-doc description for some
 function parameters
Date: Wed, 13 Jul 2022 09:12:00 +0100
Message-Id: <7940f1767c5c6f70196ae599448b87d75ba46834.1657699522.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1657699522.git.mchehab@kernel.org>
References: <cover.1657699522.git.mchehab@kernel.org>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>, intel-gfx@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are some parameters missing at the kernel-doc markups on
some gem files. Some of those are trivial enough to be added.

Document them.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/gem/i915_gem_object.c   | 2 ++
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h      | 1 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c | 2 ++
 3 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index ccec4055fde3..b5dd43405355 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -820,6 +820,8 @@ int i915_gem_object_wait_moving_fence(struct drm_i915_gem_object *obj,
  * in an unknown_state. This means that userspace must NEVER be allowed to touch
  * the pages, with either the GPU or CPU.
  *
+ * @obj: The object to check its state.
+ *
  * ONLY valid to be called after ensuring that all kernel fences have signalled
  * (in particular the fence for moving/clearing the object).
  */
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.h b/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
index e4842b4296fc..64151f40098f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
@@ -30,6 +30,7 @@ void i915_ttm_bo_destroy(struct ttm_buffer_object *bo);
 /**
  * i915_ttm_to_gem - Convert a struct ttm_buffer_object to an embedding
  * struct drm_i915_gem_object.
+ * @bo: The ttm buffer object.
  *
  * Return: Pointer to the embedding struct ttm_buffer_object, or NULL
  * if the object was not an i915 ttm object.
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
index 9a7e50534b84..56217d324a9b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
@@ -237,6 +237,7 @@ static struct dma_fence *i915_ttm_accel_move(struct ttm_buffer_object *bo,
  * @_src_iter: Storage space for the source kmap iterator.
  * @dst_iter: Pointer to the destination kmap iterator.
  * @src_iter: Pointer to the source kmap iterator.
+ * @num_pages: Number of pages to copy or to be cleared.
  * @clear: Whether to clear instead of copy.
  * @src_rsgt: Refcounted scatter-gather list of source memory.
  * @dst_rsgt: Refcounted scatter-gather list of destination memory.
@@ -541,6 +542,7 @@ __i915_ttm_move(struct ttm_buffer_object *bo,
  * i915_ttm_move - The TTM move callback used by i915.
  * @bo: The buffer object.
  * @evict: Whether this is an eviction.
+ * @ctx: Pointer to a struct ttm_operation_ctx
  * @dst_mem: The destination ttm resource.
  * @hop: If we need multihop, what temporary memory type to move to.
  *
-- 
2.36.1

