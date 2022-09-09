Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E0D5B304E
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 09:38:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D340610EC4A;
	Fri,  9 Sep 2022 07:35:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACF9C10EBFD;
 Fri,  9 Sep 2022 07:34:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 02306B8238B;
 Fri,  9 Sep 2022 07:34:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75B39C4FF12;
 Fri,  9 Sep 2022 07:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662708895;
 bh=4VHxSufjm7xKjm4fLVM1k5XlVY9FOQF8GqPlLaxsR/k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IjK72AabMheDNyecrDNS+2qJ37gQx3g/XAwHXh7MZuVJHUUrZCXHkbqVDv8sKXCgI
 +LFBWaFuu+b3lfbV76KhgcMppf8ITiYS9aiX+KP1R4yHRf99EwQVlNn5qsKdB1oz4R
 jhRwJ14C67YZLzcAbpc/yMEK5cGpCACKu8r9oeWuK4js1ryimC2OyuncKA/fRi9CXu
 nUDmgaI/6lp57cyRd/1nH5ytlcns0d4pIBHGzSlp8y/fdsFSi+VSygj7Dw4Rs4i6z/
 sRv4vCn2v+jJckkhBim6vwXGXx+71DCVjwvDHJIYIzswklM5LoKpS/9/rPZ+O03ooj
 SXJw/7D8u+35g==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oWYXH-007FHf-FB;
 Fri, 09 Sep 2022 09:34:47 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH v3 32/37] docs: gpu: i915.rst: add the remaining kernel-doc
 markup files
Date: Fri,  9 Sep 2022 09:34:39 +0200
Message-Id: <7ed6d74b75061fb2800e5a59f5282b224bd0621a.1662708705.git.mchehab@kernel.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
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
See [PATCH v3 00/37] at: https://lore.kernel.org/all/cover.1662708705.git.mchehab@kernel.org/

 Documentation/gpu/i915.rst | 85 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 83 insertions(+), 2 deletions(-)

diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
index 545fe630557a..7f5cd01ed398 100644
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
 
@@ -29,6 +34,8 @@ Runtime Power Management
 
 .. kernel-doc:: drivers/gpu/drm/i915/intel_pm.c
 
+.. kernel-doc:: drivers/gpu/drm/i915/intel_wakeref.h
+
 Interrupt Handling
 ------------------
 
@@ -44,8 +51,25 @@ Interrupt Handling
 .. kernel-doc:: drivers/gpu/drm/i915/i915_irq.c
    :functions: intel_runtime_pm_enable_interrupts
 
-Intel GVT-g Guest Support(vGPU)
--------------------------------
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
+Intel GVT-g Guest Support (vGPU)
+--------------------------------
 
 .. kernel-doc:: drivers/gpu/drm/i915/i915_vgpu.c
    :doc: Intel GVT-g guest support
@@ -109,6 +133,55 @@ Workarounds
 .. kernel-doc:: drivers/gpu/drm/i915/gt/intel_workarounds.c
    :doc: Hardware workarounds
 
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
+Others
+------
+
+.. kernel-doc:: drivers/gpu/drm/i915/i915_ioc32.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/i915_gpu_error.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/i915_active.h
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
+Protected Xe Path (PXP)
+-----------------------
+
+.. kernel-doc:: drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
+
 Display Hardware Handling
 =========================
 
@@ -615,6 +688,12 @@ Protected Objects
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
@@ -624,6 +703,8 @@ Table Manager (TTM)
 Graphics Execution Manager (GEM)
 --------------------------------
 
+.. kernel-doc:: drivers/gpu/drm/i915/i915_gem.c
+
 .. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_create.c
 
 .. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_domain.c
-- 
2.37.3

