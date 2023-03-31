Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 088046D1C2E
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 11:27:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02BDB10F194;
	Fri, 31 Mar 2023 09:27:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9960F10F184;
 Fri, 31 Mar 2023 09:26:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 532C5B82DB1;
 Fri, 31 Mar 2023 09:26:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82150C433A1;
 Fri, 31 Mar 2023 09:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680254798;
 bh=1cJ849/Y655d3Cb+y4U813eDvHxJLRQhrfBbI04u3JI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=u2FrI2GDCbfxdaThBYcHpadx5mw4ANv3v1h3AUQRzdIrV74965dYmT6+82pyQ6JLS
 54vJRFPcOfE2iZnLVXDPrBe9Z4ihfJnNlr/z1GbsWRPjJRZ9IYc1BDZrZqSAY5pYNL
 LKyLcGLPG9QzLnhiCAJCynbmztgaTRxq7ZNvtsJ6A1fyb3KZ8n3c4JkgW4NWaqkwpL
 Jld92PKIVOgd9tBx+6DZBLNBKLp6DU6THQtFKUPLwUY9d9dYEZbHOi/ZblaEIWNi1q
 fbg1mRNy17MCU4ttDSFZsM5hfdelZiJrpzH0cAWladERoHHjwKksW1SDnU5r7T4wx0
 7+u6H3r92/8Xg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Subject: [PATCH 09/19] drm/i915/gem/i915_gem_ttm_pm: Provide a couple of
 missing descriptions for 'flags' and remove some superfluous ones
Date: Fri, 31 Mar 2023 10:25:57 +0100
Message-Id: <20230331092607.700644-10-lee@kernel.org>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
In-Reply-To: <20230331092607.700644-1-lee@kernel.org>
References: <20230331092607.700644-1-lee@kernel.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c:156: warning: Function parameter or member 'flags' not described in 'i915_ttm_backup_region'
 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c:156: warning: Excess function parameter 'allow_gpu' description in 'i915_ttm_backup_region'
 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c:156: warning: Excess function parameter 'backup_pinned' description in 'i915_ttm_backup_region'
 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c:223: warning: Function parameter or member 'flags' not described in 'i915_ttm_restore_region'
 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c:223: warning: Excess function parameter 'allow_gpu' description in 'i915_ttm_restore_region'

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
index dfe39c8e74d8a..ad649523d5e0b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
@@ -144,8 +144,7 @@ void i915_ttm_recover_region(struct intel_memory_region *mr)
 /**
  * i915_ttm_backup_region - Back up all objects of a region to smem.
  * @mr: The memory region
- * @allow_gpu: Whether to allow the gpu blitter for this backup.
- * @backup_pinned: Backup also pinned objects.
+ * @flags: TTM backup flags
  *
  * Loops over all objects of a region and either evicts them if they are
  * evictable or backs them up using a backup object if they are pinned.
@@ -212,7 +211,7 @@ static int i915_ttm_restore(struct i915_gem_apply_to_region *apply,
 /**
  * i915_ttm_restore_region - Restore backed-up objects of a region from smem.
  * @mr: The memory region
- * @allow_gpu: Whether to allow the gpu blitter to recover.
+ * @flags: TTM backup flags
  *
  * Loops over all objects of a region and if they are backed-up, restores
  * them from smem.
-- 
2.40.0.348.gf938b09366-goog

