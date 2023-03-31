Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC876D1C28
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 11:27:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D76A10F188;
	Fri, 31 Mar 2023 09:27:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECFB310F185;
 Fri, 31 Mar 2023 09:26:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 94AF4B82DAD;
 Fri, 31 Mar 2023 09:26:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56981C433D2;
 Fri, 31 Mar 2023 09:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680254808;
 bh=r5fKy7MNhH7WvIHl7tsH50Rr1NXN1GtPNTehilUeT48=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vDS8Yn2pSVeuQBmaB8f1DwbAVhzhZF9HxT+M3EzlgbyrEoPsPn4xDEpKOO/s9FYu8
 b7QndHG5T6MTXL2VI1lL2uvOUiQfx7Vpt/hvVpfXK3XoKnJT2O+kfYj/pbeq/WO2+q
 ozxEsrOgsxmdxXZjEatn5QXbtkAh9aQxCnZ2PmsbYo8x7Eij9i1brW5omIQZlU+2nC
 26lu12CzGPnEY7zfz9xs20xUDXYAhEsOhT66IsbYnsciyZyS57vwOnp37JfreRCNwV
 /vOoCDLTCO3S8mWs47FhhrH9WbfnzV9Lr/PCvLAiSMk0yxdgltPtn1RNov73Hsv2Rr
 zl4p1and8/Jjg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Subject: [PATCH 12/19] drm/i915/gem/i915_gem_wait: Provide function name to
 validate the kerneldoc header
Date: Fri, 31 Mar 2023 10:26:00 +0100
Message-Id: <20230331092607.700644-13-lee@kernel.org>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
In-Reply-To: <20230331092607.700644-1-lee@kernel.org>
References: <20230331092607.700644-1-lee@kernel.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/i915/gem/i915_gem_wait.c:164: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/gpu/drm/i915/gem/i915_gem_wait.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
index e6e01c2a74a65..4a33ad2d122bd 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
@@ -161,7 +161,7 @@ i915_gem_object_wait_priority(struct drm_i915_gem_object *obj,
 }
 
 /**
- * Waits for rendering to the object to be completed
+ * i915_gem_object_wait - Waits for rendering to the object to be completed
  * @obj: i915 gem object
  * @flags: how to wait (under a lock, for all rendering or just for writes etc)
  * @timeout: how long to wait
-- 
2.40.0.348.gf938b09366-goog

