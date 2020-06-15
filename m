Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A12F1F8E7D
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 08:50:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F2989F6B;
	Mon, 15 Jun 2020 06:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2BCA89F31
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 06:50:32 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de
 [95.90.213.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AFEB2212CC;
 Mon, 15 Jun 2020 06:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592203832;
 bh=kmMjy+w5RUzmyvsPQqO7Q52eLX6bKSLAj2uvYVPQ0hI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gc7Mk2zJyDF2jVFSAcgsTkzFqdLy9t+9l4gRMf+s92JbmUIhXJ6uTzHUtTi2uWM+h
 eG/LupWaw/RLlXxpzqVRNX3t+bd+6IK8BnYc2up1vgRJuLI+RNxEGo48C2FQ5JwvZo
 D7ZvjjR5edwgcZ0EpAEEziQeS+Mfn7nIZYCQtBVc=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
 (envelope-from <mchehab@kernel.org>)
 id 1jkiww-009o6s-Mq; Mon, 15 Jun 2020 08:50:30 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH 19/22] docs: move other kAPI documents to core-api
Date: Mon, 15 Jun 2020 08:50:24 +0200
Message-Id: <633998e4e7c3c3bb340f69d4a02f0ee9e7f9306f.1592203650.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1592203650.git.mchehab+huawei@kernel.org>
References: <cover.1592203650.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are a number of random documents that seem to be
describing some aspects of the core-api. Move them to such
directory, adding them at the core-api/index.rst file.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/sysctl/vm.rst                     | 2 +-
 Documentation/core-api/index.rst                            | 6 ++++++
 Documentation/{mailbox.txt => core-api/mailbox.rst}         | 0
 Documentation/{nommu-mmap.txt => core-api/nommu-mmap.rst}   | 0
 .../{this_cpu_ops.txt => core-api/this_cpu_ops.rst}         | 0
 .../{process => core-api}/unaligned-memory-access.rst       | 0
 Documentation/gpu/drm-mm.rst                                | 2 +-
 arch/Kconfig                                                | 2 +-
 init/Kconfig                                                | 2 +-
 mm/Kconfig                                                  | 2 +-
 mm/nommu.c                                                  | 2 +-
 11 files changed, 12 insertions(+), 6 deletions(-)
 rename Documentation/{mailbox.txt => core-api/mailbox.rst} (100%)
 rename Documentation/{nommu-mmap.txt => core-api/nommu-mmap.rst} (100%)
 rename Documentation/{this_cpu_ops.txt => core-api/this_cpu_ops.rst} (100%)
 rename Documentation/{process => core-api}/unaligned-memory-access.rst (100%)

diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
index d46d5b7013c6..9f7fa2d37fa7 100644
--- a/Documentation/admin-guide/sysctl/vm.rst
+++ b/Documentation/admin-guide/sysctl/vm.rst
@@ -583,7 +583,7 @@ trimming of allocations is initiated.
 
 The default value is 1.
 
-See Documentation/nommu-mmap.txt for more information.
+See Documentation/core-api/nommu-mmap.rst for more information.
 
 
 numa_zonelist_order
diff --git a/Documentation/core-api/index.rst b/Documentation/core-api/index.rst
index 721e40a8c65b..2a364dd533de 100644
--- a/Documentation/core-api/index.rst
+++ b/Documentation/core-api/index.rst
@@ -38,11 +38,15 @@ Library functionality that is used throughout the kernel.
    circular-buffers
    rbtree
    generic-radix-tree
+   mailbox
    packing
+   rbtree
+   this_cpu_ops
    timekeeping
    watch_queue
    errseq
 
+
 Concurrency primitives
 ======================
 
@@ -83,11 +87,13 @@ more memory-management documentation in :doc:`/vm/index`.
    :maxdepth: 1
 
    memory-allocation
+   unaligned-memory-access
    dma-api
    dma-api-howto
    dma-attributes
    dma-isa-lpc
    bus-virt-phys-mapping
+   nommu-mmap
    mm-api
    genalloc
    pin_user_pages
diff --git a/Documentation/mailbox.txt b/Documentation/core-api/mailbox.rst
similarity index 100%
rename from Documentation/mailbox.txt
rename to Documentation/core-api/mailbox.rst
diff --git a/Documentation/nommu-mmap.txt b/Documentation/core-api/nommu-mmap.rst
similarity index 100%
rename from Documentation/nommu-mmap.txt
rename to Documentation/core-api/nommu-mmap.rst
diff --git a/Documentation/this_cpu_ops.txt b/Documentation/core-api/this_cpu_ops.rst
similarity index 100%
rename from Documentation/this_cpu_ops.txt
rename to Documentation/core-api/this_cpu_ops.rst
diff --git a/Documentation/process/unaligned-memory-access.rst b/Documentation/core-api/unaligned-memory-access.rst
similarity index 100%
rename from Documentation/process/unaligned-memory-access.rst
rename to Documentation/core-api/unaligned-memory-access.rst
diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index 1839762044be..e0bbcbb6f512 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -314,7 +314,7 @@ To use drm_gem_cma_get_unmapped_area(), drivers must fill the struct
 a pointer on drm_gem_cma_get_unmapped_area().
 
 More detailed information about get_unmapped_area can be found in
-Documentation/nommu-mmap.txt
+Documentation/core-api/nommu-mmap.rst
 
 Memory Coherency
 ----------------
diff --git a/arch/Kconfig b/arch/Kconfig
index 8cc35dc556c7..2a439fb8069e 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -147,7 +147,7 @@ config HAVE_EFFICIENT_UNALIGNED_ACCESS
 	  problems with received packets if doing so would not help
 	  much.
 
-	  See Documentation/unaligned-memory-access.txt for more
+	  See Documentation/core-api/unaligned-memory-access.rst for more
 	  information on the topic of unaligned memory accesses.
 
 config ARCH_USE_BUILTIN_BSWAP
diff --git a/init/Kconfig b/init/Kconfig
index 3327f0eca1a3..4218a60f5f79 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1957,7 +1957,7 @@ config MMAP_ALLOW_UNINITIALIZED
 	  userspace.  Since that isn't generally a problem on no-MMU systems,
 	  it is normally safe to say Y here.
 
-	  See Documentation/nommu-mmap.txt for more information.
+	  See Documentation/core-api/nommu-mmap.rst for more information.
 
 config SYSTEM_DATA_VERIFICATION
 	def_bool n
diff --git a/mm/Kconfig b/mm/Kconfig
index f2104cc0d35c..6c6189724b75 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -387,7 +387,7 @@ config NOMMU_INITIAL_TRIM_EXCESS
 	  This option specifies the initial value of this option.  The default
 	  of 1 says that all excess pages should be trimmed.
 
-	  See Documentation/nommu-mmap.txt for more information.
+	  See Documentation/core-api/nommu-mmap.rst for more information.
 
 config TRANSPARENT_HUGEPAGE
 	bool "Transparent Hugepage Support"
diff --git a/mm/nommu.c b/mm/nommu.c
index cdcad5d61dd1..8f2e502ad8a3 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -5,7 +5,7 @@
  *  Replacement code for mm functions to support CPU's that don't
  *  have any form of memory management unit (thus no virtual memory).
  *
- *  See Documentation/nommu-mmap.txt
+ *  See Documentation/core-api/nommu-mmap.rst
  *
  *  Copyright (c) 2004-2008 David Howells <dhowells@redhat.com>
  *  Copyright (c) 2000-2003 David McCullough <davidm@snapgear.com>
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
