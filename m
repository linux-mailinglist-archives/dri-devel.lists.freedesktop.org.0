Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHgVN3Nsd2nCfQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 14:30:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5F088D70
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 14:30:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 807C410E11B;
	Mon, 26 Jan 2026 13:30:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KmDi45Pl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D1F210E11B
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 13:30:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C3A2843E3C;
 Mon, 26 Jan 2026 13:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E3B5C116C6;
 Mon, 26 Jan 2026 13:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1769434222;
 bh=tFPN/HZWJM+duLC/+VHomdgpmmIuWdt01i1MV76oRs0=;
 h=Subject:To:Cc:From:Date:From;
 b=KmDi45Pl7DNUrUUwN9hnPgMolXgqry15OxXbbGv/62CV1ITsmhSyZ/w/1ZAP8Bw8O
 YIMxJNklg12ucJT3ELqX9o6upiy3npOzuOII0cGHbt6+ZiDknfxhSuotHXuehHOei8
 6G7mnaeEnoAV61jPr2fY26dG9QqKSZlpJXnI+Jl0=
Subject: Patch "drm,
 drm/xe: Fix xe userptr in the absence of CONFIG_DEVICE_PRIVATE" has
 been added to the 6.18-stable tree
To: dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 himal.prasad.ghimiray@intel.com, maarten.lankhorst@linux.intel.com,
 matthew.auld@intel.com, matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 26 Jan 2026 14:29:32 +0100
Message-ID: <2026012632-curing-citation-2805@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.99 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	R_DKIM_REJECT(1.00)[linuxfoundation.org:s=korg];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,dri-devel-bounces@lists.freedesktop.org];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,msgid.link:url,intel.com:email,lists.freedesktop.org:email]
X-Rspamd-Queue-Id: 2F5F088D70
X-Rspamd-Action: no action


This is a note to let you know that I've just added the patch titled

    drm, drm/xe: Fix xe userptr in the absence of CONFIG_DEVICE_PRIVATE

to the 6.18-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-drm-xe-fix-xe-userptr-in-the-absence-of-config_device_private.patch
and it can be found in the queue-6.18 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From bdcdf968be314b6fc8835b99fb4519e7619671e6 Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Wed, 21 Jan 2026 10:10:47 +0100
Subject: drm, drm/xe: Fix xe userptr in the absence of CONFIG_DEVICE_PRIVATE
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Thomas Hellström <thomas.hellstrom@linux.intel.com>

commit bdcdf968be314b6fc8835b99fb4519e7619671e6 upstream.

CONFIG_DEVICE_PRIVATE is not selected by default by some distros,
for example Fedora, and that leads to a regression in the xe driver
since userptr support gets compiled out.

It turns out that DRM_GPUSVM, which is needed for xe userptr support
compiles also without CONFIG_DEVICE_PRIVATE, but doesn't compile
without CONFIG_ZONE_DEVICE.
Exclude the drm_pagemap files from compilation with !CONFIG_ZONE_DEVICE,
and remove the CONFIG_DEVICE_PRIVATE dependency from CONFIG_DRM_GPUSVM and
the xe driver's selection of it, re-enabling xe userptr for those configs.

v2:
- Don't compile the drm_pagemap files unless CONFIG_ZONE_DEVICE is set.
- Adjust the drm_pagemap.h header accordingly.

Fixes: 9e9787414882 ("drm/xe/userptr: replace xe_hmm with gpusvm")
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.18+
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Link: https://patch.msgid.link/20260121091048.41371-2-thomas.hellstrom@linux.intel.com
(cherry picked from commit 1e372b246199ca7a35f930177fea91b557dac16e)
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/Kconfig    |    2 +-
 drivers/gpu/drm/Makefile   |    4 +++-
 drivers/gpu/drm/xe/Kconfig |    2 +-
 include/drm/drm_pagemap.h  |   19 +++++++++++++++++--
 4 files changed, 22 insertions(+), 5 deletions(-)

--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -210,7 +210,7 @@ config DRM_GPUVM
 
 config DRM_GPUSVM
 	tristate
-	depends on DRM && DEVICE_PRIVATE
+	depends on DRM
 	select HMM_MIRROR
 	select MMU_NOTIFIER
 	help
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -106,8 +106,10 @@ obj-$(CONFIG_DRM_EXEC) += drm_exec.o
 obj-$(CONFIG_DRM_GPUVM) += drm_gpuvm.o
 
 drm_gpusvm_helper-y := \
-	drm_gpusvm.o\
+	drm_gpusvm.o
+drm_gpusvm_helper-$(CONFIG_ZONE_DEVICE) += \
 	drm_pagemap.o
+
 obj-$(CONFIG_DRM_GPUSVM) += drm_gpusvm_helper.o
 
 obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -39,7 +39,7 @@ config DRM_XE
 	select DRM_TTM
 	select DRM_TTM_HELPER
 	select DRM_EXEC
-	select DRM_GPUSVM if !UML && DEVICE_PRIVATE
+	select DRM_GPUSVM if !UML
 	select DRM_GPUVM
 	select DRM_SCHED
 	select MMU_NOTIFIER
--- a/include/drm/drm_pagemap.h
+++ b/include/drm/drm_pagemap.h
@@ -209,6 +209,19 @@ struct drm_pagemap_devmem_ops {
 			   struct dma_fence *pre_migrate_fence);
 };
 
+#if IS_ENABLED(CONFIG_ZONE_DEVICE)
+
+struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page *page);
+
+#else
+
+static inline struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page *page)
+{
+	return NULL;
+}
+
+#endif /* IS_ENABLED(CONFIG_ZONE_DEVICE) */
+
 /**
  * struct drm_pagemap_devmem - Structure representing a GPU SVM device memory allocation
  *
@@ -233,6 +246,8 @@ struct drm_pagemap_devmem {
 	struct dma_fence *pre_migrate_fence;
 };
 
+#if IS_ENABLED(CONFIG_ZONE_DEVICE)
+
 int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 				  struct mm_struct *mm,
 				  unsigned long start, unsigned long end,
@@ -243,8 +258,6 @@ int drm_pagemap_evict_to_ram(struct drm_
 
 const struct dev_pagemap_ops *drm_pagemap_pagemap_ops_get(void);
 
-struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page *page);
-
 void drm_pagemap_devmem_init(struct drm_pagemap_devmem *devmem_allocation,
 			     struct device *dev, struct mm_struct *mm,
 			     const struct drm_pagemap_devmem_ops *ops,
@@ -256,4 +269,6 @@ int drm_pagemap_populate_mm(struct drm_p
 			    struct mm_struct *mm,
 			    unsigned long timeslice_ms);
 
+#endif /* IS_ENABLED(CONFIG_ZONE_DEVICE) */
+
 #endif


Patches currently in stable-queue which might be from thomas.hellstrom@linux.intel.com are

queue-6.18/drm-drm-xe-fix-xe-userptr-in-the-absence-of-config_device_private.patch
