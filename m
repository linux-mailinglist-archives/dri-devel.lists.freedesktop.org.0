Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BA69DB203
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 04:59:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A63C10E1E6;
	Thu, 28 Nov 2024 03:59:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="3S0nIS5x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2206810E1E6;
 Thu, 28 Nov 2024 03:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=l19eVKsY53JL2VQByhBNrJ9l0f6j+JQvqDa2L42Z2s0=; b=3S0nIS5xt0KG9YqSq+lGL6/5Nq
 ZkGnr2iZmxTK4qK3A8yZxaNWrnLY8mq+HA0528nCHYON14ZDHKoaQjT1Jz0XCLPloIJ1xm/z0v7V/
 jSmcIzyxb/vI6sjVaOiwZSUm4gQAte253+kaVpu8CFFG236J0dH7HrVuYRb1pxXMD+PRyyu05QL2Q
 cv0vrGQl+ShCEjybwdn+rBUo9t4kdkrqrOd+gjBqTOfzLEfD35Q7elwOCrTo1FE1Tcmvw4TROZO/5
 t7vH8d0IbGoKeDCjKx59+Q2Nv/EijZfhlnJA3PilFjSIdmqn9Uabef1h7pjyV2wJIftToH38rai9W
 1MKqHdpg==;
Received: from [50.53.2.24] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1tGVgE-0000000EeTB-1gzE; Thu, 28 Nov 2024 03:59:02 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/xe/vm_doc: fix more doc typos
Date: Wed, 27 Nov 2024 19:58:59 -0800
Message-ID: <20241128035901.375399-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.47.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix all typos in xe_vm_doc.h as reported by codespell.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/xe/xe_vm_doc.h |   22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

--- linux-next-20241125.orig/drivers/gpu/drm/xe/xe_vm_doc.h
+++ linux-next-20241125/drivers/gpu/drm/xe/xe_vm_doc.h
@@ -64,8 +64,8 @@
  *	update page level 2 PDE[1] to page level 3b phys address (GPU)
  *
  *	bind BO2 0x1ff000-0x201000
- *	update page level 3a PTE[511] to BO2 phys addres (GPU)
- *	update page level 3b PTE[0] to BO2 phys addres + 0x1000 (GPU)
+ *	update page level 3a PTE[511] to BO2 phys address (GPU)
+ *	update page level 3b PTE[0] to BO2 phys address + 0x1000 (GPU)
  *
  * GPU bypass
  * ~~~~~~~~~~
@@ -192,7 +192,7 @@
  *
  * If a VM is in fault mode (TODO: link to fault mode), new bind operations that
  * create mappings are by default deferred to the page fault handler (first
- * use). This behavior can be overriden by setting the flag
+ * use). This behavior can be overridden by setting the flag
  * DRM_XE_VM_BIND_FLAG_IMMEDIATE which indicates to creating the mapping
  * immediately.
  *
@@ -209,7 +209,7 @@
  *
  * Since this a core kernel managed memory the kernel can move this memory
  * whenever it wants. We register an invalidation MMU notifier to alert XE when
- * a user poiter is about to move. The invalidation notifier needs to block
+ * a user pointer is about to move. The invalidation notifier needs to block
  * until all pending users (jobs or compute mode engines) of the userptr are
  * idle to ensure no faults. This done by waiting on all of VM's dma-resv slots.
  *
@@ -252,7 +252,7 @@
  * Rebind worker
  * -------------
  *
- * The rebind worker is very similar to an exec. It is resposible for rebinding
+ * The rebind worker is very similar to an exec. It is responsible for rebinding
  * evicted BOs or userptrs, waiting on those operations, installing new preempt
  * fences, and finally resuming executing of engines in the VM.
  *
@@ -317,11 +317,11 @@
  * are not allowed, only long running workloads and ULLS are enabled on a faulting
  * VM.
  *
- * Defered VM binds
+ * Deferred VM binds
  * ----------------
  *
  * By default, on a faulting VM binds just allocate the VMA and the actual
- * updating of the page tables is defered to the page fault handler. This
+ * updating of the page tables is deferred to the page fault handler. This
  * behavior can be overridden by setting the flag DRM_XE_VM_BIND_FLAG_IMMEDIATE in
  * the VM bind which will then do the bind immediately.
  *
@@ -500,18 +500,18 @@
  * Slot waiting
  * ------------
  *
- * 1. The exection of all jobs from kernel ops shall wait on all slots
+ * 1. The execution of all jobs from kernel ops shall wait on all slots
  * (DMA_RESV_USAGE_PREEMPT_FENCE) of either an external BO or VM (depends on if
  * kernel op is operating on external or private BO)
  *
- * 2. In non-compute mode, the exection of all jobs from rebinds in execs shall
+ * 2. In non-compute mode, the execution of all jobs from rebinds in execs shall
  * wait on the DMA_RESV_USAGE_KERNEL slot of either an external BO or VM
  * (depends on if the rebind is operatiing on an external or private BO)
  *
- * 3. In non-compute mode, the exection of all jobs from execs shall wait on the
+ * 3. In non-compute mode, the execution of all jobs from execs shall wait on the
  * last rebind job
  *
- * 4. In compute mode, the exection of all jobs from rebinds in the rebind
+ * 4. In compute mode, the execution of all jobs from rebinds in the rebind
  * worker shall wait on the DMA_RESV_USAGE_KERNEL slot of either an external BO
  * or VM (depends on if rebind is operating on external or private BO)
  *
