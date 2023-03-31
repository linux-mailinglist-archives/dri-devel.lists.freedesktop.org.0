Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1196D1C2D
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 11:27:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6723410F190;
	Fri, 31 Mar 2023 09:27:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D531B10F188;
 Fri, 31 Mar 2023 09:26:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4246662660;
 Fri, 31 Mar 2023 09:26:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3188C433EF;
 Fri, 31 Mar 2023 09:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680254812;
 bh=Br+vno0fyLfK0vDswtuXDu7r0uipb+c1SKUt2eq3Kbw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SkUG3+i1jOY+ZEq6u8LzdDURgEfUOlF4Z7UiHPMkVapNIeNGaMOyzsrIzdkCEmx0W
 3nA24C0K7BqYIC9ZqtAHfsTRVFi3iTF0HKxSJOEMgVmy7ca6Tiax8sX13sQoOqwyy2
 I1zhwSuIKil8isuOeF4SrJDxDZvyXBVUfXSvamyNZyyO1UhbcKgCJlhnvivt1buAKL
 /zTPC6+rLWaRpQWPLTtxTW+fYTH6o1x4fbuWuE77rKyweF1tf3fx000sHfczmMBI3s
 KZNAiwpypQvIa5QkLy+df8VMnGfvHHiA1yd96VZwgVvQPTJ0CEVoYgiZKY+KTK4orD
 xXg0CZqn+Ko/w==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Subject: [PATCH 13/19] drm/i915/gem/i915_gem_object: Demote non-kerneldoc
 header with no param descriptions
Date: Fri, 31 Mar 2023 10:26:01 +0100
Message-Id: <20230331092607.700644-14-lee@kernel.org>
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
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-media@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/i915/gem/i915_gem_object.c:887: warning: Function parameter or member 'obj' not described in 'i915_gem_object_has_unknown_state'

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index e6d4efde4fc51..4666bb82f312c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -875,7 +875,7 @@ int i915_gem_object_wait_moving_fence(struct drm_i915_gem_object *obj,
 	return ret < 0 ? ret : 0;
 }
 
-/**
+/*
  * i915_gem_object_has_unknown_state - Return true if the object backing pages are
  * in an unknown_state. This means that userspace must NEVER be allowed to touch
  * the pages, with either the GPU or CPU.
-- 
2.40.0.348.gf938b09366-goog

