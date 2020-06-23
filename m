Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7185E204E78
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 11:53:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EBA389CD7;
	Tue, 23 Jun 2020 09:53:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 168E089CE0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 09:53:07 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de
 [95.90.213.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6A6EE20774;
 Tue, 23 Jun 2020 09:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592905986;
 bh=tN9aRL4pHrBCYhyfhZTcndNej+VastPj+Z3hzYU/sxE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Hmvhem34kR4SDYsHVYdzVSMS+ZibrwlHYGM06odDNqeQKjcvTh533M42MmIV549l/
 B2JG8EWO/OolVWqy3AFTxJNAJZ2DVJuixuO3y587oRX70rGuTnRYEuueJIDSHlyswA
 0nrGmXKEFTENkKoudJAZfd0yGPHxj2u/GAWMbd78=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
 (envelope-from <mchehab@kernel.org>)
 id 1jnfc0-004C3R-BQ; Tue, 23 Jun 2020 11:53:04 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH v2 5/9] docs: move nommu-mmap.txt to admin-guide and rename to
 ReST
Date: Tue, 23 Jun 2020 11:52:58 +0200
Message-Id: <a8f4a5a8ba117bc15785901423f46f5725fd68b0.1592905407.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1592905407.git.mchehab+huawei@kernel.org>
References: <cover.1592905407.git.mchehab+huawei@kernel.org>
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
 linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
 linux-mm@kvack.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The nommu-mmap.txt file provides description of user visible
behaviuour. So, move it to the admin-guide.

As it is already at the ReST, also rename it.

Suggested-by: Mike Rapoport <rppt@linux.ibm.com>
Suggested-by: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/mm/index.rst                          | 1 +
 Documentation/{nommu-mmap.txt => admin-guide/mm/nommu-mmap.rst} | 0
 Documentation/admin-guide/sysctl/vm.rst                         | 2 +-
 Documentation/gpu/drm-mm.rst                                    | 2 +-
 init/Kconfig                                                    | 2 +-
 mm/Kconfig                                                      | 2 +-
 mm/nommu.c                                                      | 2 +-
 7 files changed, 6 insertions(+), 5 deletions(-)
 rename Documentation/{nommu-mmap.txt => admin-guide/mm/nommu-mmap.rst} (100%)

diff --git a/Documentation/admin-guide/mm/index.rst b/Documentation/admin-guide/mm/index.rst
index 11db46448354..774dad6d3d29 100644
--- a/Documentation/admin-guide/mm/index.rst
+++ b/Documentation/admin-guide/mm/index.rst
@@ -31,6 +31,7 @@ the Linux memory management.
    idle_page_tracking
    ksm
    memory-hotplug
+   nommu-map
    numa_memory_policy
    numaperf
    pagemap
diff --git a/Documentation/nommu-mmap.txt b/Documentation/admin-guide/mm/nommu-mmap.rst
similarity index 100%
rename from Documentation/nommu-mmap.txt
rename to Documentation/admin-guide/mm/nommu-mmap.rst
diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
index 4b7c496199ca..4b9d2e8e9142 100644
--- a/Documentation/admin-guide/sysctl/vm.rst
+++ b/Documentation/admin-guide/sysctl/vm.rst
@@ -598,7 +598,7 @@ trimming of allocations is initiated.
 
 The default value is 1.
 
-See Documentation/nommu-mmap.txt for more information.
+See Documentation/admin-guide/mm/nommu-mmap.rst for more information.
 
 
 numa_zonelist_order
diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index 8d10e6b38918..9abee1589c1e 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -311,7 +311,7 @@ To use drm_gem_cma_get_unmapped_area(), drivers must fill the struct
 a pointer on drm_gem_cma_get_unmapped_area().
 
 More detailed information about get_unmapped_area can be found in
-Documentation/nommu-mmap.txt
+Documentation/admin-guide/mm/nommu-mmap.rst
 
 Memory Coherency
 ----------------
diff --git a/init/Kconfig b/init/Kconfig
index a46aa8f3174d..2dd5531dae98 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1957,7 +1957,7 @@ config MMAP_ALLOW_UNINITIALIZED
 	  userspace.  Since that isn't generally a problem on no-MMU systems,
 	  it is normally safe to say Y here.
 
-	  See Documentation/nommu-mmap.txt for more information.
+	  See Documentation/mm/nommu-mmap.rst for more information.
 
 config SYSTEM_DATA_VERIFICATION
 	def_bool n
diff --git a/mm/Kconfig b/mm/Kconfig
index f2104cc0d35c..d41f3fa7e923 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -387,7 +387,7 @@ config NOMMU_INITIAL_TRIM_EXCESS
 	  This option specifies the initial value of this option.  The default
 	  of 1 says that all excess pages should be trimmed.
 
-	  See Documentation/nommu-mmap.txt for more information.
+	  See Documentation/mm/nommu-mmap.rst for more information.
 
 config TRANSPARENT_HUGEPAGE
 	bool "Transparent Hugepage Support"
diff --git a/mm/nommu.c b/mm/nommu.c
index f32a69095d50..314174817b04 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -5,7 +5,7 @@
  *  Replacement code for mm functions to support CPU's that don't
  *  have any form of memory management unit (thus no virtual memory).
  *
- *  See Documentation/nommu-mmap.txt
+ *  See Documentation/mm/nommu-mmap.rst
  *
  *  Copyright (c) 2004-2008 David Howells <dhowells@redhat.com>
  *  Copyright (c) 2000-2003 David McCullough <davidm@snapgear.com>
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
