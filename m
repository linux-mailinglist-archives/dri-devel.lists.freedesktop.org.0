Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F716D1C21
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 11:26:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC61F10F187;
	Fri, 31 Mar 2023 09:26:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F7B10F187;
 Fri, 31 Mar 2023 09:26:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 3BAFECE2E19;
 Fri, 31 Mar 2023 09:26:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78591C4339B;
 Fri, 31 Mar 2023 09:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680254801;
 bh=qE4hn7zYZUo3qbgZnQ+ZnfMoG9qxdOCoGyG59h+a2iI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HMOUvqSFkkL8phRrpkrGaaVnaZAeEib8Rpcx16VtW/ll+GjB/7y0qvIF/0Fl9Rbf8
 cTlRDGAnWRHRBH4CUYdoEl6e7QHLTHKAHO2spvPQiqKCXKy/FF5hvYFH1m8jzKf8sp
 12ZEpJgY5wIo5FggwySBJ55M7yENduSFgEnM//E2b1+/A2WXyhUvRIpDt3puvtM5MF
 MYU77ZRNuRAGcKUBf8P7HIjKZR5e4EaSYlxb1xboeDJUGyrgzKEpeXJSp8XsY5nmoc
 fGhN8pUw5KbyJtHmSqJSM2lGUnOzh5u+Iug9o3onO+LQVpMxD43AvO2ilS1Yx948ym
 W7AHFjMZRaODA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Subject: [PATCH 10/19] drm/i915/gem/i915_gem_ttm: Demote half-filled kerneldoc
Date: Fri, 31 Mar 2023 10:25:58 +0100
Message-Id: <20230331092607.700644-11-lee@kernel.org>
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hopefully someone knowledgable will follow-up to complete it.

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/i915/gem/i915_gem_ttm.c:1292: warning: Function parameter or member 'offset' not described in '__i915_gem_ttm_object_init'
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c:1292: warning: Function parameter or member 'page_size' not described in '__i915_gem_ttm_object_init'

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 341b94672abcb..9227f8146a583 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -1274,7 +1274,7 @@ void i915_ttm_bo_destroy(struct ttm_buffer_object *bo)
 	}
 }
 
-/**
+/*
  * __i915_gem_ttm_object_init - Initialize a ttm-backed i915 gem object
  * @mem: The initial memory region for the object.
  * @obj: The gem object.
-- 
2.40.0.348.gf938b09366-goog

