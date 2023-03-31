Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA7F6D1C43
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 11:28:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72BB910F18F;
	Fri, 31 Mar 2023 09:28:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF78E10F189;
 Fri, 31 Mar 2023 09:27:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5C6A5B82DAE;
 Fri, 31 Mar 2023 09:27:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49991C433D2;
 Fri, 31 Mar 2023 09:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680254821;
 bh=jDg9+LbHBtf4EjDGettNNrjuuWGpis85RdG5aiSWD5I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GXZqS0n3DzEGbnhm/VuFgz81qhHhbB8LYxa+QNGAK8aCAKZfMDsCONopQkz8C59WJ
 g+wiN/k7a9am8lJiu10gLlcLLq0pkMCDKLjQUF9kQV0/UzS6ZgKXtvMjql8GREQSDj
 JLo/9iiWbrsgQvqctkGbq4tBXdPctKCLSWoKS7w3/uO3PUHxqYSQvycxPNZIa4dQhe
 ETiYPunbpUdXC1m0XmEaMVB4f1zGu8ws65dTCpINbY9ntnfw+Kmw5iIWHAZGE0U+Rh
 /HgCOd+PyR8UBGJPb2K5PUtZV95W4tDsGUbWREGq14UCvHYGepF2JwZpMrlSLkVwu6
 P1tN1uJeoFwmA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Subject: [PATCH 16/19] drm/i915/i915_vma: Provide one missing param and demote
 another non-kerneldoc header
Date: Fri, 31 Mar 2023 10:26:04 +0100
Message-Id: <20230331092607.700644-17-lee@kernel.org>
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/i915/i915_vma.c:756: warning: Function parameter or member 'ww' not described in 'i915_vma_insert'
 drivers/gpu/drm/i915/i915_vma.c:1744: warning: Function parameter or member 'vma' not described in 'i915_vma_destroy_locked'

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/gpu/drm/i915/i915_vma.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index f51fd9fd4c89c..20a44788999e5 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -739,6 +739,7 @@ bool i915_gem_valid_gtt_space(struct i915_vma *vma, unsigned long color)
 /**
  * i915_vma_insert - finds a slot for the vma in its address space
  * @vma: the vma
+ * @ww: An optional struct i915_gem_ww_ctx
  * @size: requested size in bytes (can be larger than the VMA)
  * @alignment: required alignment
  * @flags: mask of PIN_* flags to use
@@ -1714,7 +1715,7 @@ static void release_references(struct i915_vma *vma, struct intel_gt *gt,
 	i915_vma_free(vma);
 }
 
-/**
+/*
  * i915_vma_destroy_locked - Remove all weak reference to the vma and put
  * the initial reference.
  *
-- 
2.40.0.348.gf938b09366-goog

