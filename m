Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EB5570B91
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 22:26:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3F2990DF0;
	Mon, 11 Jul 2022 20:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 320D98B4AC;
 Mon, 11 Jul 2022 20:25:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B6B856165A;
 Mon, 11 Jul 2022 20:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE72EC341ED;
 Mon, 11 Jul 2022 20:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657571123;
 bh=Fo89D3DwUo2r9d3JU5/iQMjVQfwJrqQdTu5vKaQ+2BU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LEYH1A936lTmyZNiyj0MT0WiP10O4qEgvudZoJdBYqRU6NF/sL3LiCVKN2cGE+M9H
 zfsWTBxN8D469E8xGm+kLNGWRb4ibpIhJkqWwq9l5YzGayp+LMczoexjgAhC5+5Njt
 BNgeU3eL66hmGE+r2hHW3z14WmVa2zHD1pwsbQCbgYx/EvAGjbCiXLTrtkQHw5XCPM
 KJ3H7hZxNg4Q4BM6rL8JNAAx5jR0Cq7gXxZ2CZo+S6vQ3oDLoxNe9wSiq2JnzxBhqk
 u/ScZpHQDgRp3GLf6SB+0pjhLuGfVN2P63s6yonHV8wWosGI43hgPhQ7utyHkMk4z4
 XKPvE8He+A/1g==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oAzy3-004e9O-Vt;
 Mon, 11 Jul 2022 21:25:19 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH 32/32] docs: gpu: i915.rst: add the remaining kernel-doc
 markup files
Date: Mon, 11 Jul 2022 21:25:17 +0100
Message-Id: <3936b74484d0125147158f137edb8c4f162a462d.1657565224.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1657565224.git.mchehab@kernel.org>
References: <cover.1657565224.git.mchehab@kernel.org>
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
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are other files with kernel-doc markups:

	$ git grep -l "/\*\*" $(git ls-files|grep drivers/gpu/drm/i915/) >kernel-doc-files
	$ for i in $(cat kernel-doc-files); do if [ "$(git grep $i Documentation/)" == "" ]; then echo "$i"; fi; done >aaa

Add them to i915.rst as well.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/32] at: https://lore.kernel.org/all/cover.1657565224.git.mchehab@kernel.org/

 Documentation/gpu/i915.rst | 87 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
index 974754586be8..6bb50edc6d79 100644
--- a/Documentation/gpu/i915.rst
+++ b/Documentation/gpu/i915.rst
@@ -13,6 +13,11 @@ Core Driver Infrastructure
 This section covers core driver infrastructure used by both the display
 and the GEM parts of the driver.
 
+Core driver
+-----------
+
+.. kernel-doc:: drivers/gpu/drm/i915/i915_driver.c
+
 Runtime Power Management
 ------------------------
 
@@ -29,6 +34,10 @@ Runtime Power Management
 
 .. kernel-doc:: drivers/gpu/drm/i915/intel_pm.c
 
+.. kernel-doc:: drivers/gpu/drm/i915/intel_wakeref.h
+
+.. kernel-doc:: drivers/gpu/drm/i915/i915_active.h
+
 Interrupt Handling
 ------------------
 
@@ -44,6 +53,28 @@ Interrupt Handling
 .. kernel-doc:: drivers/gpu/drm/i915/i915_irq.c
    :functions: intel_runtime_pm_enable_interrupts
 
+Error handling
+--------------
+
+.. kernel-doc:: drivers/gpu/drm/i915/i915_gpu_error.c
+
+Memory Handling
+---------------
+
+.. kernel-doc:: drivers/gpu/drm/i915/i915_vma_resource.h
+
+.. kernel-doc:: drivers/gpu/drm/i915/i915_vma_resource.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/i915_vma.h
+
+.. kernel-doc:: drivers/gpu/drm/i915/i915_vma.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/i915_mm.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/intel_memory_region.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/i915_memcpy.c
+
 Intel GVT-g Guest Support(vGPU)
 -------------------------------
 
@@ -109,6 +140,54 @@ Workarounds
 .. kernel-doc:: drivers/gpu/drm/i915/gt/intel_workarounds.c
    :doc: Hardware workarounds
 
+32-bits compatible ioctl Logic
+------------------------------
+
+.. kernel-doc:: drivers/gpu/drm/i915/i915_ioc32.c
+
+Scatterlist handling
+--------------------
+
+.. kernel-doc:: drivers/gpu/drm/i915/i915_scatterlist.h
+
+.. kernel-doc:: drivers/gpu/drm/i915/i915_scatterlist.c
+
+i915 request
+------------
+
+.. kernel-doc:: drivers/gpu/drm/i915/i915_request.h
+
+.. kernel-doc:: drivers/gpu/drm/i915/i915_request.c
+
+Ancillary routines
+------------------
+
+.. kernel-doc:: drivers/gpu/drm/i915/i915_deps.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/i915_deps.h
+
+.. kernel-doc:: drivers/gpu/drm/i915/intel_device_info.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/i915_params.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/i915_sw_fence_work.h
+
+.. kernel-doc:: drivers/gpu/drm/i915/i915_syncmap.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/intel_pcode.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/i915_reg_defs.h
+
+.. kernel-doc:: drivers/gpu/drm/i915/intel_wopcm.h
+
+
+PXP
+---
+
+.. kernel-doc:: drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
+
 Display Hardware Handling
 =========================
 
@@ -618,6 +697,12 @@ Protected Objects
 Table Manager (TTM)
 -------------------
 
+.. kernel-doc:: drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
+
+.. kernel-doc:: drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/intel_region_ttm.c
+
 .. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_ttm.c
 
 .. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_ttm.h
@@ -627,6 +712,8 @@ Table Manager (TTM)
 Graphics Execution Manager (GEM)
 --------------------------------
 
+.. kernel-doc:: drivers/gpu/drm/i915/i915_gem.c
+
 .. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_create.c
 
 .. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_domain.c
-- 
2.36.1

