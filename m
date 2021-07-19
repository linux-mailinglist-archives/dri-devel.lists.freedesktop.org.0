Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9160F3CD575
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 15:06:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD9616E0EE;
	Mon, 19 Jul 2021 13:06:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7824D6E0EE
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 13:06:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D2CFA6113E;
 Mon, 19 Jul 2021 13:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1626700003;
 bh=nr8HGravfZjB+PXQCbfaSt2dUO4OUUO1FLT7v55nIeg=;
 h=Subject:To:Cc:From:Date:From;
 b=AK6evD49mKFYrC5iWhQD8ROVunuFWgoWlDWEkYoSHIgHoiMD07qWWezGFwEZXYKuS
 8F0w8h8ete/iBwHUoPbfB0SugkaQCwqCvaItiJlpnCAvH6gjtdTYa3zdofm0+ohyiO
 6qtnZzwmS4Eyj9ykXB4qMb/Kbglr2NbGGpBRDbCY=
Subject: Patch "Revert "drm/ast: Remove reference to struct drm_device.pdev""
 has been added to the 5.10-stable tree
To: airlied@redhat.com, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, kuohsiang_chou@aspeedtech.com, lkp@intel.com,
 michael.j.ruhl@intel.com, tzimmermann@suse.de, xtfeng@gmail.com
From: <gregkh@linuxfoundation.org>
Date: Mon, 19 Jul 2021 15:06:24 +0200
Message-ID: <16266999845452@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
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
Cc: stable-commits@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    Revert "drm/ast: Remove reference to struct drm_device.pdev"

to the 5.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     revert-drm-ast-remove-reference-to-struct-drm_device.pdev.patch
and it can be found in the queue-5.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From cb1b21b946f3fc0ac01547c1a4f04927ad0090bd Mon Sep 17 00:00:00 2001
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon, 19 Jul 2021 15:01:49 +0200
Subject: Revert "drm/ast: Remove reference to struct drm_device.pdev"

From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

This reverts commit fcb041ca5c7787b096aafc899e45f93583e66cbd which is
commit 0ecb51824e838372e01330752503ddf9c0430ef7 upstream.

Turns out this was incomplete, as it is missing a dependancy, so drop it
from the tree.

Link: https://lore.kernel.org/r/CAJn8CcHHKSo7GF29Z1ufXJJpMUzn6+fdvwiqe9=JvgpcfvnbHQ@mail.gmail.com
Reported-by: Xiaotian Feng <xtfeng@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
Cc: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
Cc: kernel test robot <lkp@intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Airlie <airlied@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/ast/ast_main.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -406,6 +406,7 @@ struct ast_private *ast_device_create(st
 		return ast;
 	dev = &ast->base;
 
+	dev->pdev = pdev;
 	pci_set_drvdata(pdev, dev);
 
 	ast->regs = pcim_iomap(pdev, 1, 0);
@@ -447,8 +448,8 @@ struct ast_private *ast_device_create(st
 
 	/* map reserved buffer */
 	ast->dp501_fw_buf = NULL;
-	if (dev->vram_mm->vram_size < pci_resource_len(pdev, 0)) {
-		ast->dp501_fw_buf = pci_iomap_range(pdev, 0, dev->vram_mm->vram_size, 0);
+	if (dev->vram_mm->vram_size < pci_resource_len(dev->pdev, 0)) {
+		ast->dp501_fw_buf = pci_iomap_range(dev->pdev, 0, dev->vram_mm->vram_size, 0);
 		if (!ast->dp501_fw_buf)
 			drm_info(dev, "failed to map reserved buffer!\n");
 	}


Patches currently in stable-queue which might be from gregkh@linuxfoundation.org are

queue-5.10/tracing-do-not-reference-char-as-a-string-in-histograms.patch
queue-5.10/scsi-zfcp-report-port-fc_security-as-unknown-early-during-remote-cable-pull.patch
queue-5.10/cifs-handle-reconnect-of-tcon-when-there-is-no-cached-dfs-referral.patch
queue-5.10/kvm-mmio-fix-use-after-free-read-in-kvm_vm_ioctl_unregister_coalesced_mmio.patch
queue-5.10/drm-dp_mst-add-missing-drm-parameters-to-recently-added-call-to-drm_dbg_kms.patch
queue-5.10/fbmem-do-not-delete-the-mode-that-is-still-in-use.patch
queue-5.10/drm-i915-gtt-drop-the-page-table-optimisation.patch
queue-5.10/drm-dp_mst-avoid-to-mess-up-payload-table-by-ports-in-stale-topology.patch
queue-5.10/kvm-x86-mmu-do-not-apply-hpa-memory-encryption-mask-to-gpas.patch
queue-5.10/revert-drm-ast-remove-reference-to-struct-drm_device.pdev.patch
queue-5.10/kvm-x86-disable-hardware-breakpoints-unconditionally-before-kvm_x86-run.patch
queue-5.10/drm-dp_mst-do-not-set-proposed-vcpi-directly.patch
queue-5.10/kvm-nsvm-check-the-value-written-to-msr_vm_hsave_pa.patch
queue-5.10/kvm-x86-use-guest-maxphyaddr-from-cpuid.0x8000_0008-iff-tdp-is-enabled.patch
queue-5.10/cgroup-verify-that-source-is-a-string.patch
queue-5.10/drm-i915-gt-fix-edeadlk-handling-regression.patch
queue-5.10/drm-ingenic-fix-non-osd-mode.patch
queue-5.10/drm-ingenic-switch-ipu-plane-to-type-overlay.patch
queue-5.10/scsi-core-fix-bad-pointer-dereference-when-ehandler-kthread-is-invalid.patch
