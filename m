Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B6E6D1C1E
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 11:26:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C7D410F15A;
	Fri, 31 Mar 2023 09:26:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52D1E10F14C;
 Fri, 31 Mar 2023 09:26:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CFD1762654;
 Fri, 31 Mar 2023 09:26:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1833FC4339E;
 Fri, 31 Mar 2023 09:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680254779;
 bh=JNGe4Stkfx4U8PEelqzPaQWET75d/oi6wGG9GBuzGjg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nxD+CR5W+M4FMA4u7Hve2K2JQHHfpYrFTxcrzo1+D3s9MFvxrft5XY2qstmWV0U9b
 Dcihw64MldAHjYk5Nu4uAVf1bD0M+vHq8MjU9fFglHhvT3juY9hxLJP6J1mNK+Lpiq
 bRYgOkTu73CBFuOtEJKjmVsZTQfaJuaap1FntnI8LO14tvm9hxT/e4r9YDeBmRGSb+
 tdXfN3XV/IZVyIYAXTp4UEVQgqHuRrP9KOFV8uEbsgKZ8zeoKRZ0f7Knn7Sgyr+6a/
 tIyR7WqeSSP+Asl/BYPWoGv60k9WGCg/Aeak+jN7+o5Mer9rfEVJLgX/HOAs4Ck4o+
 Re9zsLs21/OgQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Subject: [PATCH 02/19] drm/i915/intel_region_ttm: Provide missing description
 for 'offset' param
Date: Fri, 31 Mar 2023 10:25:50 +0100
Message-Id: <20230331092607.700644-3-lee@kernel.org>
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
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/i915/intel_region_ttm.c:201: warning: Function parameter or member 'offset' not described in 'intel_region_ttm_resource_alloc'

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/gpu/drm/i915/intel_region_ttm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i915/intel_region_ttm.c
index b7fbd5abb42a5..bf6097e7433d5 100644
--- a/drivers/gpu/drm/i915/intel_region_ttm.c
+++ b/drivers/gpu/drm/i915/intel_region_ttm.c
@@ -181,6 +181,7 @@ intel_region_ttm_resource_to_rsgt(struct intel_memory_region *mem,
 /**
  * intel_region_ttm_resource_alloc - Allocate memory resources from a region
  * @mem: The memory region,
+ * @offset: BO offset
  * @size: The requested size in bytes
  * @flags: Allocation flags
  *
-- 
2.40.0.348.gf938b09366-goog

