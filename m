Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BC25B302B
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 09:37:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8200710EC1C;
	Fri,  9 Sep 2022 07:35:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0A9010EC17;
 Fri,  9 Sep 2022 07:35:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 3B836CE219C;
 Fri,  9 Sep 2022 07:34:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1544FC4314B;
 Fri,  9 Sep 2022 07:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662708894;
 bh=thjPSFNuiUfjV2+1KjjZL79wc6ddTsGOdo5Pa9Vne9c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Bf3FKZ+QWxrlZBeC5S1N8oBhEHw5hHwmBIpUk162XUPvH7J2FOFiroSGyXIW4gjL2
 fvIDjzpfagxuj0w7CI8kLKn7Z8Z7MgrZ2DDp74MuF9P3/yxYWMU9oYIZSTBfp/v2Pn
 bECD4H6utkQM8yJZ72OX0EBpyLpR3guIWEJdv1DNvOp/so3HxOaFELewK6yFtFYhlt
 Z3CGzQ3OL0CcyRAGcqHntTehewOPrHoX5FffolMGY/LKaf86Z021ez4UKlBBxztFTx
 3iboEQN6AghmMSb7CTh4y1XfXC+jQ4rMl58ECkRFoNrd0j0VHec4qi62vLlqRwzYpp
 0501SAq2cLURg==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oWYXG-007FGB-0v;
 Fri, 09 Sep 2022 09:34:46 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH v3 09/37] drm/i915: gem: add kernel-doc description for some
 function parameters
Date: Fri,  9 Sep 2022 09:34:16 +0200
Message-Id: <f1e033282194693e66ffa35320b85a3f0cde6caa.1662708705.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <cover.1662708705.git.mchehab@kernel.org>
References: <cover.1662708705.git.mchehab@kernel.org>
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
 intel-gfx@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Jasmine Newsome <jasmine.newsome@intel.com>, linux-kernel@vger.kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are some parameters missing at the kernel-doc markups on
some gem files. Some of those are trivial enough to be added.

Document them.

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v3 00/37] at: https://lore.kernel.org/all/cover.1662708705.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/gem/i915_gem_object.c   | 2 ++
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h      | 1 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c | 2 ++
 3 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 85482a04d158..35637e2f51f3 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -815,6 +815,8 @@ int i915_gem_object_wait_moving_fence(struct drm_i915_gem_object *obj,
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
2.37.3

