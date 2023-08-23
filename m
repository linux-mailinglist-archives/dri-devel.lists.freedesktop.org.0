Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 842EF786363
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 00:29:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F2810E0F5;
	Wed, 23 Aug 2023 22:29:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5DD210E0F5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 22:29:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 195A862D9F;
 Wed, 23 Aug 2023 22:29:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6B5EC433C7;
 Wed, 23 Aug 2023 22:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692829752;
 bh=uLOPuIWlsiDZX5bvICa78hDz4FkeT8QL4rvQaB9rnQU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=X/C1PRmgAW2IqVmnhbMVWDcI/xoUisl98YSUnVy9I3bhVZA6SUfyqnEzIx5qEukn+
 slp56bLTt2q69HN0WOHcr9jqLFztX60ByUPhVVJqZXp12fofGbliMOeth5NOmMXD9D
 aUJf3d344v1dhVSgT0ZHrCktBTKYWCMmW9O1RmvUoqFhjqw2XyGfR6iWGYMazU3HKW
 MWJhyoheKcjVOMD9cQED5Wb0H/B24Srf55wuFCFnUyB6uBv4hid/Om7s9Dtb/oiinl
 P/n3j/zELzQqO23w/3KO9n6ou7jOufaNPdHCeOr1DqZjsFlJF4A9WlcwZSndhx3HtY
 CsV+ZzIHHiAdQ==
Date: Wed, 23 Aug 2023 17:29:10 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: Re: [PATCH v2 00/11] Fix typos, comments and copyright
Message-ID: <20230823222910.GA495298@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230808223412.1743176-1-sui.jingfeng@linux.dev>
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Helgaas <bhelgaas@google.com>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 09, 2023 at 06:34:01AM +0800, Sui Jingfeng wrote:
> From: Sui Jingfeng <suijingfeng@loongson.cn>
> 
> v1:
> 	* Various improve.
> v2:
> 	* More fixes, optimizations and improvements.
> 
> Sui Jingfeng (11):
>   PCI/VGA: Use unsigned type for the io_state variable

>   PCI: Add the pci_get_class_masked() helper
>   PCI/VGA: Deal with VGA class devices

I dropped these two patches, at least for now.  There's no other use
of pci_get_class_masked(), and the VGA use seems to be mostly
optimization and possibly some behavior change that isn't 100% clear
yet.  If it's important, we can look at it again later.

>   PCI/VGA: Drop the inline in the vga_update_device_decodes() function.
>   PCI/VGA: Move the new_state assignment out of the loop
>   PCI/VGA: Fix two typos in the comments of pci_notify()
>   PCI/VGA: vga_client_register() return -ENODEV on failure, not -1
>   PCI/VGA: Fix a typo to the comment of vga_default
>   PCI/VGA: Fix a typo to the comments in vga_str_to_iostate() function
>   PCI/VGA: Tidy up the code and comment format
>   PCI/VGA: Replace full MIT license text with SPDX identifier
> 
>  drivers/pci/search.c   |  30 ++++++
>  drivers/pci/vgaarb.c   | 233 +++++++++++++++++++++++++----------------
>  include/linux/pci.h    |   7 ++
>  include/linux/vgaarb.h |  27 +----
>  4 files changed, 185 insertions(+), 112 deletions(-)

I applied the rest of the patches on pci/vga for v6.5.

I updated the commit logs and tweaked some of the patches.

I squashed all the typo fixes together and added several more that I
had done previously but not posted.  The diff between your original v2
posting and the current pci/vga branch is attached.  Most of it is
additional typo fixes, but if you look closely you'll see:

  - The omission of the pci_get_class_masked() patches (in
    vga_arbiter_add_pci_device(), pci_notify(), vga_arb_device_init())

  - The tweaks I did to:

      vga_update_device_decodes()
      vga_client_register()
      vga_arbiter_notify_clients()

I dropped the Reviewed-bys from the typo fixes because I didn't want
to extend them to everything that got squashed together.  Happy to add
them back if anybody wants to look again.

The branch is at https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/log/?h=vga

Bjorn

diff --git a/drivers/pci/search.c b/drivers/pci/search.c
index f1c15aea868b..b4c138a6ec02 100644
--- a/drivers/pci/search.c
+++ b/drivers/pci/search.c
@@ -334,36 +334,6 @@ struct pci_dev *pci_get_device(unsigned int vendor, unsigned int device,
 }
 EXPORT_SYMBOL(pci_get_device);
 
-/**
- * pci_get_class_masked - begin or continue searching for a PCI device by class and mask
- * @class: search for a PCI device with this class designation
- * @from: Previous PCI device found in search, or %NULL for new search.
- *
- * Iterates through the list of known PCI devices.  If a PCI device is
- * found with a matching @class, the reference count to the device is
- * incremented and a pointer to its device structure is returned.
- * Otherwise, %NULL is returned.
- * A new search is initiated by passing %NULL as the @from argument.
- * Otherwise if @from is not %NULL, searches continue from next device
- * on the global list.  The reference count for @from is always decremented
- * if it is not %NULL.
- */
-struct pci_dev *pci_get_class_masked(unsigned int class, unsigned int mask,
-				     struct pci_dev *from)
-{
-	struct pci_device_id id = {
-		.vendor = PCI_ANY_ID,
-		.device = PCI_ANY_ID,
-		.subvendor = PCI_ANY_ID,
-		.subdevice = PCI_ANY_ID,
-		.class_mask = mask,
-		.class = class,
-	};
-
-	return pci_get_dev_by_id(&id, from);
-}
-EXPORT_SYMBOL(pci_get_class_masked);
-
 /**
  * pci_get_class - begin or continue searching for a PCI device by class
  * @class: search for a PCI device with this class designation
diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
index a2f6e0e6b634..5e6b1eb54c64 100644
--- a/drivers/pci/vgaarb.c
+++ b/drivers/pci/vgaarb.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: MIT
 /*
- * vgaarb.c: Implements the VGA arbitration. For details refer to
+ * vgaarb.c: Implements VGA arbitration. For details refer to
  * Documentation/gpu/vgaarbiter.rst
  *
  * (C) Copyright 2005 Benjamin Herrenschmidt <benh@kernel.crashing.org>
@@ -42,9 +42,9 @@ static void vga_arbiter_notify_clients(void);
 struct vga_device {
 	struct list_head list;
 	struct pci_dev *pdev;
-	unsigned int decodes;	/* what does it decodes */
-	unsigned int owns;	/* what does it owns */
-	unsigned int locks;	/* what does it locks */
+	unsigned int decodes;		/* what it decodes */
+	unsigned int owns;		/* what it owns */
+	unsigned int locks;		/* what it locks */
 	unsigned int io_lock_cnt;	/* legacy IO lock count */
 	unsigned int mem_lock_cnt;	/* legacy MEM lock count */
 	unsigned int io_norm_cnt;	/* normal IO count */
@@ -116,20 +116,18 @@ static struct vga_device *vgadev_find(struct pci_dev *pdev)
 /**
  * vga_default_device - return the default VGA device, for vgacon
  *
- * This can be defined by the platform. The default implementation
- * is rather dumb and will probably only work properly on single
- * vga card setups and/or x86 platforms.
+ * This can be defined by the platform. The default implementation is
+ * rather dumb and will probably only work properly on single VGA card
+ * setups and/or x86 platforms.
  *
- * If your VGA default device is not PCI, you'll have to return
- * NULL here. In this case, I assume it will not conflict with
- * any PCI card. If this is not true, I'll have to define two archs
- * hooks for enabling/disabling the VGA default device if that is
- * possible. This may be a problem with real _ISA_ VGA cards, in
- * addition to a PCI one. I don't know at this point how to deal
- * with that card. Can theirs IOs be disabled at all ? If not, then
- * I suppose it's a matter of having the proper arch hook telling
- * us about it, so we basically never allow anybody to succeed a
- * vga_get()...
+ * If your VGA default device is not PCI, you'll have to return NULL here.
+ * In this case, I assume it will not conflict with any PCI card. If this
+ * is not true, I'll have to define two arch hooks for enabling/disabling
+ * the VGA default device if that is possible. This may be a problem with
+ * real _ISA_ VGA cards, in addition to a PCI one. I don't know at this
+ * point how to deal with that card. Can their IOs be disabled at all? If
+ * not, then I suppose it's a matter of having the proper arch hook telling
+ * us about it, so we basically never allow anybody to succeed a vga_get().
  */
 struct pci_dev *vga_default_device(void)
 {
@@ -147,14 +145,13 @@ void vga_set_default_device(struct pci_dev *pdev)
 }
 
 /**
- * vga_remove_vgacon - deactivete vga console
+ * vga_remove_vgacon - deactivate VGA console
  *
- * Unbind and unregister vgacon in case pdev is the default vga
- * device.  Can be called by gpu drivers on initialization to make
- * sure vga register access done by vgacon will not disturb the
- * device.
+ * Unbind and unregister vgacon in case pdev is the default VGA device.
+ * Can be called by GPU drivers on initialization to make sure VGA register
+ * access done by vgacon will not disturb the device.
  *
- * @pdev: pci device.
+ * @pdev: PCI device.
  */
 #if !defined(CONFIG_VGA_CONSOLE)
 int vga_remove_vgacon(struct pci_dev *pdev)
@@ -194,14 +191,15 @@ int vga_remove_vgacon(struct pci_dev *pdev)
 EXPORT_SYMBOL(vga_remove_vgacon);
 
 /*
- * If we don't ever use vgaarb, we should avoid turning off anything anywhere.
- * Due to old X servers getting confused about the boot device not being VGA.
+ * If we don't ever use VGA arbitration, we should avoid turning off
+ * anything anywhere due to old X servers getting confused about the boot
+ * device not being VGA.
  */
 static void vga_check_first_use(void)
 {
 	/*
-	 * We should inform all GPUs in the system that
-	 * vgaarb has occurred and to try and disable resources if they can
+	 * Inform all GPUs in the system that VGA arbitration has occurred
+	 * so they can disable resources if possible.
 	 */
 	if (!vga_arbiter_used) {
 		vga_arbiter_used = true;
@@ -241,13 +239,13 @@ static struct vga_device *__vga_tryget(struct vga_device *vgadev,
 
 	/*
 	 * We don't need to request a legacy resource, we just enable
-	 * appropriate decoding and go
+	 * appropriate decoding and go.
 	 */
 	legacy_wants = wants & VGA_RSRC_LEGACY_MASK;
 	if (legacy_wants == 0)
 		goto enable_them;
 
-	/* Ok, we don't, let's find out how we need to kick off */
+	/* Ok, we don't, let's find out who we need to kick off */
 	list_for_each_entry(conflict, &vga_list, list) {
 		unsigned int lwants = legacy_wants;
 		unsigned int change_bridge = 0;
@@ -257,11 +255,11 @@ static struct vga_device *__vga_tryget(struct vga_device *vgadev,
 			continue;
 
 		/*
-		 * We have a possible conflict. before we go further, we must
+		 * We have a possible conflict. Before we go further, we must
 		 * check if we sit on the same bus as the conflicting device.
-		 * if we don't, then we must tie both IO and MEM resources
+		 * If we don't, then we must tie both IO and MEM resources
 		 * together since there is only a single bit controlling
-		 * VGA forwarding on P2P bridges
+		 * VGA forwarding on P2P bridges.
 		 */
 		if (vgadev->pdev->bus != conflict->pdev->bus) {
 			change_bridge = 1;
@@ -270,14 +268,14 @@ static struct vga_device *__vga_tryget(struct vga_device *vgadev,
 
 		/*
 		 * Check if the guy has a lock on the resource. If he does,
-		 * return the conflicting entry
+		 * return the conflicting entry.
 		 */
 		if (conflict->locks & lwants)
 			return conflict;
 
 		/*
 		 * Ok, now check if it owns the resource we want.  We can
-		 * lock resources that are not decoded, therefore a device
+		 * lock resources that are not decoded; therefore a device
 		 * can own resources it doesn't decode.
 		 */
 		match = lwants & conflict->owns;
@@ -285,8 +283,8 @@ static struct vga_device *__vga_tryget(struct vga_device *vgadev,
 			continue;
 
 		/*
-		 * Looks like he doesn't have a lock, we can steal
-		 * them from him
+		 * Looks like he doesn't have a lock, we can steal them
+		 * from him.
 		 */
 
 		flags = 0;
@@ -321,7 +319,7 @@ static struct vga_device *__vga_tryget(struct vga_device *vgadev,
 
 enable_them:
 	/*
-	 * Ok dude, we got it, everybody conflicting has been disabled, let's
+	 * Ok, we got it, everybody conflicting has been disabled, let's
 	 * enable us.  Mark any bits in "owns" regardless of whether we
 	 * decoded them.  We can lock resources we don't decode, therefore
 	 * we must track them via "owns".
@@ -364,8 +362,8 @@ static void __vga_put(struct vga_device *vgadev, unsigned int rsrc)
 	vgaarb_dbg(dev, "%s\n", __func__);
 
 	/*
-	 * Update our counters, and account for equivalent legacy resources
-	 * if we decode them
+	 * Update our counters and account for equivalent legacy resources
+	 * if we decode them.
 	 */
 	if ((rsrc & VGA_RSRC_NORMAL_IO) && vgadev->io_norm_cnt > 0) {
 		vgadev->io_norm_cnt--;
@@ -384,7 +382,7 @@ static void __vga_put(struct vga_device *vgadev, unsigned int rsrc)
 
 	/*
 	 * Just clear lock bits, we do lazy operations so we don't really
-	 * have to bother about anything else at this point
+	 * have to bother about anything else at this point.
 	 */
 	if (vgadev->io_lock_cnt == 0)
 		vgadev->locks &= ~VGA_RSRC_LEGACY_IO;
@@ -393,23 +391,23 @@ static void __vga_put(struct vga_device *vgadev, unsigned int rsrc)
 
 	/*
 	 * Kick the wait queue in case somebody was waiting if we actually
-	 * released something
+	 * released something.
 	 */
 	if (old_locks != vgadev->locks)
 		wake_up_all(&vga_wait_queue);
 }
 
 /**
- * vga_get - acquire & locks VGA resources
- * @pdev: pci device of the VGA card or NULL for the system default
+ * vga_get - acquire & lock VGA resources
+ * @pdev: PCI device of the VGA card or NULL for the system default
  * @rsrc: bit mask of resources to acquire and lock
  * @interruptible: blocking should be interruptible by signals ?
  *
- * This function acquires VGA resources for the given card and mark those
- * resources locked. If the resource requested are "normal" (and not legacy)
+ * Acquire VGA resources for the given card and mark those resources
+ * locked. If the resources requested are "normal" (and not legacy)
  * resources, the arbiter will first check whether the card is doing legacy
- * decoding for that type of resource. If yes, the lock is "converted" into a
- * legacy resource lock.
+ * decoding for that type of resource. If yes, the lock is "converted" into
+ * a legacy resource lock.
  *
  * The arbiter will first look for all VGA cards that might conflict and disable
  * their IOs and/or Memory access, including VGA forwarding on P2P bridges if
@@ -441,7 +439,7 @@ int vga_get(struct pci_dev *pdev, unsigned int rsrc, int interruptible)
 	int rc = 0;
 
 	vga_check_first_use();
-	/* The one who calls us should check for this, but lets be sure... */
+	/* The caller should check for this, but let's be sure */
 	if (pdev == NULL)
 		pdev = vga_default_device();
 	if (pdev == NULL)
@@ -461,11 +459,11 @@ int vga_get(struct pci_dev *pdev, unsigned int rsrc, int interruptible)
 			break;
 
 		/*
-		 * We have a conflict, we wait until somebody kicks the
+		 * We have a conflict; we wait until somebody kicks the
 		 * work queue. Currently we have one work queue that we
 		 * kick each time some resources are released, but it would
-		 * be fairly easy to have a per device one so that we only
-		 * need to attach to the conflicting device
+		 * be fairly easy to have a per-device one so that we only
+		 * need to attach to the conflicting device.
 		 */
 		init_waitqueue_entry(&wait, current);
 		add_wait_queue(&vga_wait_queue, &wait);
@@ -487,12 +485,12 @@ EXPORT_SYMBOL(vga_get);
 
 /**
  * vga_tryget - try to acquire & lock legacy VGA resources
- * @pdev: pci devivce of VGA card or NULL for system default
+ * @pdev: PCI device of VGA card or NULL for system default
  * @rsrc: bit mask of resources to acquire and lock
  *
- * This function performs the same operation as vga_get(), but will return an
- * error (-EBUSY) instead of blocking if the resources are already locked by
- * another card. It can be called in any context
+ * Perform the same operation as vga_get(), but return an error (-EBUSY)
+ * instead of blocking if the resources are already locked by another card.
+ * Can be called in any context.
  *
  * On success, release the VGA resource again with vga_put().
  *
@@ -508,7 +506,7 @@ static int vga_tryget(struct pci_dev *pdev, unsigned int rsrc)
 
 	vga_check_first_use();
 
-	/* The one who calls us should check for this, but lets be sure... */
+	/* The caller should check for this, but let's be sure */
 	if (pdev == NULL)
 		pdev = vga_default_device();
 	if (pdev == NULL)
@@ -528,20 +526,20 @@ static int vga_tryget(struct pci_dev *pdev, unsigned int rsrc)
 
 /**
  * vga_put - release lock on legacy VGA resources
- * @pdev: pci device of VGA card or NULL for system default
- * @rsrc: but mask of resource to release
+ * @pdev: PCI device of VGA card or NULL for system default
+ * @rsrc: bit mask of resource to release
  *
- * This fuction releases resources previously locked by vga_get() or
- * vga_tryget(). The resources aren't disabled right away, so that a subsequence
- * vga_get() on the same card will succeed immediately. Resources have a
- * counter, so locks are only released if the counter reaches 0.
+ * Release resources previously locked by vga_get() or vga_tryget().  The
+ * resources aren't disabled right away, so that a subsequent vga_get() on
+ * the same card will succeed immediately.  Resources have a counter, so
+ * locks are only released if the counter reaches 0.
  */
 void vga_put(struct pci_dev *pdev, unsigned int rsrc)
 {
 	struct vga_device *vgadev;
 	unsigned long flags;
 
-	/* The one who calls us should check for this, but lets be sure... */
+	/* The caller should check for this, but let's be sure */
 	if (pdev == NULL)
 		pdev = vga_default_device();
 	if (pdev == NULL)
@@ -709,20 +707,20 @@ static void vga_arbiter_check_bridge_sharing(struct vga_device *vgadev)
 		return;
 	}
 
-	/* okay iterate the new devices bridge hierarachy */
+	/* Iterate the new device's bridge hierarchy */
 	new_bus = vgadev->pdev->bus;
 	while (new_bus) {
 		new_bridge = new_bus->self;
 
-		/* go through list of devices already registered */
+		/* Go through list of devices already registered */
 		list_for_each_entry(same_bridge_vgadev, &vga_list, list) {
 			bus = same_bridge_vgadev->pdev->bus;
 			bridge = bus->self;
 
-			/* See if the share a bridge with this device */
+			/* See if it shares a bridge with this device */
 			if (new_bridge == bridge) {
 				/*
-				 * If their direct parent bridge is the same
+				 * If its direct parent bridge is the same
 				 * as any bridge of this device then it can't
 				 * be used for that device.
 				 */
@@ -730,10 +728,10 @@ static void vga_arbiter_check_bridge_sharing(struct vga_device *vgadev)
 			}
 
 			/*
-			 * Now iterate the previous devices bridge hierarchy.
-			 * If the new devices parent bridge is in the other
-			 * devices hierarchy then we can't use it to control
-			 * this device
+			 * Now iterate the previous device's bridge hierarchy.
+			 * If the new device's parent bridge is in the other
+			 * device's hierarchy, we can't use it to control this
+			 * device.
 			 */
 			while (bus) {
 				bridge = bus->self;
@@ -754,10 +752,9 @@ static void vga_arbiter_check_bridge_sharing(struct vga_device *vgadev)
 }
 
 /*
- * Currently, we assume that the "initial" setup of the system is
- * not sane, that is we come up with conflicting devices and let
- * the arbiter's client decides if devices decodes or not legacy
- * things.
+ * Currently, we assume that the "initial" setup of the system is not sane,
+ * that is, we come up with conflicting devices and let the arbiter's
+ * client decide if devices decodes legacy things or not.
  */
 static bool vga_arbiter_add_pci_device(struct pci_dev *pdev)
 {
@@ -767,12 +764,16 @@ static bool vga_arbiter_add_pci_device(struct pci_dev *pdev)
 	struct pci_dev *bridge;
 	u16 cmd;
 
+	/* Only deal with VGA class devices */
+	if ((pdev->class >> 8) != PCI_CLASS_DISPLAY_VGA)
+		return false;
+
 	/* Allocate structure */
 	vgadev = kzalloc(sizeof(struct vga_device), GFP_KERNEL);
 	if (vgadev == NULL) {
 		vgaarb_err(&pdev->dev, "failed to allocate VGA arbiter data\n");
 		/*
-		 * What to do on allocation failure ? For now, let's just do
+		 * What to do on allocation failure? For now, let's just do
 		 * nothing, I'm not sure there is anything saner to be done.
 		 */
 		return false;
@@ -792,9 +793,10 @@ static bool vga_arbiter_add_pci_device(struct pci_dev *pdev)
 
 	/* By default, mark it as decoding */
 	vga_decode_count++;
+
 	/*
 	 * Mark that we "own" resources based on our enables, we will
-	 * clear that below if the bridge isn't forwarding
+	 * clear that below if the bridge isn't forwarding.
 	 */
 	pci_read_config_word(pdev, PCI_COMMAND, &cmd);
 	if (cmd & PCI_COMMAND_IO)
@@ -874,7 +876,7 @@ static bool vga_arbiter_del_pci_device(struct pci_dev *pdev)
 	return ret;
 }
 
-/* This is called with the lock */
+/* Called with the lock */
 static void vga_update_device_decodes(struct vga_device *vgadev,
 				      unsigned int new_decodes)
 {
@@ -885,8 +887,7 @@ static void vga_update_device_decodes(struct vga_device *vgadev,
 
 	vgadev->decodes = new_decodes;
 
-	vgaarb_info(dev,
-		    "VGA decodes changed: olddecodes=%s,decodes=%s:owns=%s\n",
+	vgaarb_info(dev, "VGA decodes changed: olddecodes=%s,decodes=%s:owns=%s\n",
 		    vga_iostate_to_str(old_decodes),
 		    vga_iostate_to_str(vgadev->decodes),
 		    vga_iostate_to_str(vgadev->owns));
@@ -932,9 +933,9 @@ static void __vga_set_legacy_decoding(struct pci_dev *pdev,
 	vga_update_device_decodes(vgadev, decodes);
 
 	/*
-	 * XXX if somebody is going from "doesn't decode" to "decodes" state
-	 * here, additional care must be taken as we may have pending owner
-	 * ship of non-legacy region ...
+	 * XXX If somebody is going from "doesn't decode" to "decodes"
+	 * state here, additional care must be taken as we may have pending
+	 * ownership of non-legacy region.
 	 */
 bail:
 	spin_unlock_irqrestore(&vga_lock, flags);
@@ -942,10 +943,10 @@ static void __vga_set_legacy_decoding(struct pci_dev *pdev,
 
 /**
  * vga_set_legacy_decoding
- * @pdev: pci device of the VGA card
+ * @pdev: PCI device of the VGA card
  * @decodes: bit mask of what legacy regions the card decodes
  *
- * Indicates to the arbiter if the card decodes legacy VGA IOs, legacy VGA
+ * Indicate to the arbiter if the card decodes legacy VGA IOs, legacy VGA
  * Memory, both, or none. All cards default to both, the card driver (fbdev for
  * example) should tell the arbiter if it has disabled legacy decoding, so the
  * card can be left out of the arbitration process (and can be safe to take
@@ -959,44 +960,42 @@ EXPORT_SYMBOL(vga_set_legacy_decoding);
 
 /**
  * vga_client_register - register or unregister a VGA arbitration client
- * @pdev: pci device of the VGA client
- * @set_decode: vga decode change callback
+ * @pdev: PCI device of the VGA client
+ * @set_decode: VGA decode change callback
  *
  * Clients have two callback mechanisms they can use.
  *
  * @set_decode callback: If a client can disable its GPU VGA resource, it
  * will get a callback from this to set the encode/decode state.
  *
- * Rationale: we cannot disable VGA decode resources unconditionally, some
- * single GPU laptops seem to require ACPI or BIOS access to the VGA registers
- * to control things like backlights etc. Hopefully newer multi-GPU laptops do
- * something saner, and desktops won't have any special ACPI for this. The
- * driver will get a callback when VGA arbitration is first used by userspace
- * since some older X servers have issues.
+ * Rationale: we cannot disable VGA decode resources unconditionally
+ * because some single GPU laptops seem to require ACPI or BIOS access to
+ * the VGA registers to control things like backlights etc. Hopefully newer
+ * multi-GPU laptops do something saner, and desktops won't have any
+ * special ACPI for this. The driver will get a callback when VGA
+ * arbitration is first used by userspace since some older X servers have
+ * issues.
  *
- * This function does not check whether a client for @pdev has been registered
- * already.
+ * Does not check whether a client for @pdev has been registered already.
  *
- * To unregister just call vga_client_unregister().
+ * To unregister, call vga_client_unregister().
  *
  * Returns: 0 on success, -ENODEV on failure
  */
 int vga_client_register(struct pci_dev *pdev,
 		unsigned int (*set_decode)(struct pci_dev *pdev, bool decode))
 {
-	int ret = -ENODEV;
-	struct vga_device *vgadev;
 	unsigned long flags;
+	struct vga_device *vgadev;
 
 	spin_lock_irqsave(&vga_lock, flags);
 	vgadev = vgadev_find(pdev);
-	if (vgadev) {
+	if (vgadev)
 		vgadev->set_decode = set_decode;
-		ret = 0;
-	}
 	spin_unlock_irqrestore(&vga_lock, flags);
-
-	return ret;
+	if (!vgadev)
+		return -ENODEV;
+	return 0;
 }
 EXPORT_SYMBOL(vga_client_register);
 
@@ -1005,13 +1004,13 @@ EXPORT_SYMBOL(vga_client_register);
  *
  * Semantics is:
  *
- *  open       : open user instance of the arbitrer. by default, it's
+ *  open       : Open user instance of the arbiter. By default, it's
  *                attached to the default VGA device of the system.
  *
- *  close      : close user instance, release locks
+ *  close      : Close user instance, release locks
  *
- *  read       : return a string indicating the status of the target.
- *                an IO state string is of the form {io,mem,io+mem,none},
+ *  read       : Return a string indicating the status of the target.
+ *                An IO state string is of the form {io,mem,io+mem,none},
  *                mc and ic are respectively mem and io lock counts (for
  *                debugging/diagnostic only). "decodes" indicate what the
  *                card currently decodes, "owns" indicates what is currently
@@ -1025,7 +1024,7 @@ EXPORT_SYMBOL(vga_client_register);
  * write       : write a command to the arbiter. List of commands is:
  *
  *   target <card_ID>   : switch target to card <card_ID> (see below)
- *   lock <io_state>    : acquires locks on target ("none" is invalid io_state)
+ *   lock <io_state>    : acquire locks on target ("none" is invalid io_state)
  *   trylock <io_state> : non-blocking acquire locks on target
  *   unlock <io_state>  : release locks on target
  *   unlock all         : release all locks on target held by this user
@@ -1042,23 +1041,21 @@ EXPORT_SYMBOL(vga_client_register);
  * Note about locks:
  *
  * The driver keeps track of which user has what locks on which card. It
- * supports stacking, like the kernel one. This complexifies the implementation
+ * supports stacking, like the kernel one. This complicates the implementation
  * a bit, but makes the arbiter more tolerant to userspace problems and able
  * to properly cleanup in all cases when a process dies.
  * Currently, a max of 16 cards simultaneously can have locks issued from
  * userspace for a given user (file descriptor instance) of the arbiter.
  *
  * If the device is hot-unplugged, there is a hook inside the module to notify
- * they being added/removed in the system and automatically added/removed in
+ * it being added/removed in the system and automatically added/removed in
  * the arbiter.
  */
 
 #define MAX_USER_CARDS         CONFIG_VGA_ARB_MAX_GPUS
 #define PCI_INVALID_CARD       ((struct pci_dev *)-1UL)
 
-/*
- * Each user has an array of these, tracking which cards have locks
- */
+/* Each user has an array of these, tracking which cards have locks */
 struct vga_arb_user_card {
 	struct pci_dev *pdev;
 	unsigned int mem_cnt;
@@ -1077,9 +1074,8 @@ static DEFINE_SPINLOCK(vga_user_lock);
 
 
 /*
- * This function gets a string in the format: "PCI:domain:bus:dev.fn" and
- * returns the respective values. If the string is not in this format,
- * it returns 0.
+ * Take a string in the format: "PCI:domain:bus:dev.fn" and return the
+ * respective values. If the string is not in this format, return 0.
  */
 static int vga_pci_str_to_vars(char *buf, int count, unsigned int *domain,
 			       unsigned int *bus, unsigned int *devfn)
@@ -1111,7 +1107,7 @@ static ssize_t vga_arb_read(struct file *file, char __user *buf,
 	if (lbuf == NULL)
 		return -ENOMEM;
 
-	/* Protects vga_list */
+	/* Protect vga_list */
 	spin_lock_irqsave(&vga_lock, flags);
 
 	/* If we are targeting the default, use it */
@@ -1126,15 +1122,15 @@ static ssize_t vga_arb_read(struct file *file, char __user *buf,
 	vgadev = vgadev_find(pdev);
 	if (vgadev == NULL) {
 		/*
-		 * Wow, it's not in the list, that shouldn't happen,
-		 * let's fix us up and return invalid card
+		 * Wow, it's not in the list, that shouldn't happen, let's
+		 * fix us up and return invalid card.
 		 */
 		spin_unlock_irqrestore(&vga_lock, flags);
 		len = sprintf(lbuf, "invalid");
 		goto done;
 	}
 
-	/* Fill the buffer with infos */
+	/* Fill the buffer with info */
 	len = snprintf(lbuf, 1024,
 		       "count:%d,PCI:%s,decodes=%s,owns=%s,locks=%s(%u:%u)\n",
 		       vga_decode_count, pci_name(pdev),
@@ -1180,7 +1176,7 @@ static ssize_t vga_arb_write(struct file *file, const char __user *buf,
 	if (copy_from_user(kbuf, buf, count))
 		return -EFAULT;
 	curr_pos = kbuf;
-	kbuf[count] = '\0';	/* Just to make sure... */
+	kbuf[count] = '\0';
 
 	if (strncmp(curr_pos, "lock ", 5) == 0) {
 		curr_pos += 5;
@@ -1205,7 +1201,7 @@ static ssize_t vga_arb_write(struct file *file, const char __user *buf,
 
 		vga_get_uninterruptible(pdev, io_state);
 
-		/* Update the client's locks lists... */
+		/* Update the client's locks lists */
 		for (i = 0; i < MAX_USER_CARDS; i++) {
 			if (priv->cards[i].pdev == pdev) {
 				if (io_state & VGA_RSRC_LEGACY_IO)
@@ -1372,7 +1368,7 @@ static ssize_t vga_arb_write(struct file *file, const char __user *buf,
 			vgaarb_dbg(&pdev->dev, "maximum user cards (%d) number reached, ignoring this one!\n",
 				MAX_USER_CARDS);
 			pci_dev_put(pdev);
-			/* XXX: which value to return? */
+			/* XXX: Which value to return? */
 			ret_val =  -ENOMEM;
 			goto done;
 		}
@@ -1433,7 +1429,7 @@ static int vga_arb_open(struct inode *inode, struct file *file)
 	list_add(&priv->list, &vga_user_list);
 	spin_unlock_irqrestore(&vga_user_lock, flags);
 
-	/* Set the client' lists of locks */
+	/* Set the client's lists of locks */
 	priv->target = vga_default_device(); /* Maybe this is still null! */
 	priv->cards[0].pdev = priv->target;
 	priv->cards[0].io_cnt = 0;
@@ -1472,68 +1468,32 @@ static int vga_arb_release(struct inode *inode, struct file *file)
 }
 
 /*
- * Callback any registered clients to let them know we have a
- * change in VGA cards
+ * Callback any registered clients to let them know we have a change in VGA
+ * cards.
  */
 static void vga_arbiter_notify_clients(void)
 {
 	struct vga_device *vgadev;
 	unsigned long flags;
-	bool state;
+	unsigned int new_decodes;
+	bool new_state;
 
 	if (!vga_arbiter_used)
 		return;
 
-	state = (vga_count > 1) ? false : true;
+	new_state = (vga_count > 1) ? false : true;
 
 	spin_lock_irqsave(&vga_lock, flags);
 	list_for_each_entry(vgadev, &vga_list, list) {
 		if (vgadev->set_decode) {
-			unsigned int decodes;
-
-			decodes = vgadev->set_decode(vgadev->pdev, state);
-			vga_update_device_decodes(vgadev, decodes);
+			new_decodes = vgadev->set_decode(vgadev->pdev,
+							 new_state);
+			vga_update_device_decodes(vgadev, new_decodes);
 		}
 	}
 	spin_unlock_irqrestore(&vga_lock, flags);
 }
 
-/*
- * The PCI Class Code spec implies that only VGA devices with programming
- * interface 0x00 can depend on the legacy VGA address range. VGA devices
- * with programming interface 0x01 are 8514-compatible controllers. Since
- * VGA devices with programming interface 0x00 is VGA compatible, the 'vga'
- * suffix here should refer to the VGA-compatible devices after a strict
- * reading of that specification. But considering the fact that there
- * probably don't has a 8514-compatible controller that could be used with
- * upstream kernel anymore, we would like to just ignore the programming
- * interface byte.
- *
- * Besides, there do exist non VGA-compatible display controllers in the
- * world and hardware vendors may abandon the old VGA standard someday.
- * The meaning of 'vga' suffix here may change to evolve with time.
- *
- * A strict understanding of 'vga' certainly should be VGA-compatible, While
- * a relaxed understanding of 'vga' would be PCI devices that are able to
- * display. Currently, we just keep aligned to the previous behavior.
- * Deal with VGA class devices.
- */
-static bool pci_dev_is_vga(struct pci_dev *pdev)
-{
-	if ((pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA)
-		return true;
-
-	/*
-	 * The PCI_CLASS_NOT_DEFINED_VGA is defined to provide backward
-	 * compatibility for devices that were built before the class code
-	 * field was defined.
-	 */
-	if ((pdev->class >> 8) == PCI_CLASS_NOT_DEFINED_VGA)
-		return true;
-
-	return false;
-}
-
 static int pci_notify(struct notifier_block *nb, unsigned long action,
 		      void *data)
 {
@@ -1543,9 +1503,6 @@ static int pci_notify(struct notifier_block *nb, unsigned long action,
 
 	vgaarb_dbg(dev, "%s\n", __func__);
 
-	if (!pci_dev_is_vga(pdev))
-		return 0;
-
 	/*
 	 * For now, we're only interested in devices added and removed.
 	 * I didn't test this thing here, so someone needs to double check
@@ -1580,8 +1537,8 @@ static struct miscdevice vga_arb_device = {
 
 static int __init vga_arb_device_init(void)
 {
-	struct pci_dev *pdev = NULL;
 	int rc;
+	struct pci_dev *pdev;
 
 	rc = misc_register(&vga_arb_device);
 	if (rc < 0)
@@ -1589,22 +1546,12 @@ static int __init vga_arb_device_init(void)
 
 	bus_register_notifier(&pci_bus_type, &pci_notifier);
 
-	/*
-	 * We add all PCI devices satisfying VGA class in the arbiter
-	 * by default, but we ignore the programming interface byte
-	 * intentionally.
-	 */
-	do {
-		pdev = pci_get_class_masked(PCI_CLASS_DISPLAY_VGA << 8, 0xFFFF00, pdev);
-		if (pdev && pci_dev_is_vga(pdev))
-			vga_arbiter_add_pci_device(pdev);
-	} while (pdev);
-
-	do {
-		pdev = pci_get_class_masked(PCI_CLASS_NOT_DEFINED_VGA << 8, 0xFFFF00, pdev);
-		if (pdev && pci_dev_is_vga(pdev))
-			vga_arbiter_add_pci_device(pdev);
-	} while (pdev);
+	/* Add all VGA class PCI devices by default */
+	pdev = NULL;
+	while ((pdev =
+		pci_get_subsys(PCI_ANY_ID, PCI_ANY_ID, PCI_ANY_ID,
+			       PCI_ANY_ID, pdev)) != NULL)
+		vga_arbiter_add_pci_device(pdev);
 
 	pr_info("loaded\n");
 	return rc;
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 14dc5ab4a1d2..c69a2cc1f412 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1180,9 +1180,6 @@ struct pci_dev *pci_get_slot(struct pci_bus *bus, unsigned int devfn);
 struct pci_dev *pci_get_domain_bus_and_slot(int domain, unsigned int bus,
 					    unsigned int devfn);
 struct pci_dev *pci_get_class(unsigned int class, struct pci_dev *from);
-struct pci_dev *pci_get_class_masked(unsigned int class, unsigned int mask,
-				     struct pci_dev *from);
-
 int pci_dev_present(const struct pci_device_id *ids);
 
 int pci_bus_read_config_byte(struct pci_bus *bus, unsigned int devfn,
@@ -1898,10 +1895,6 @@ static inline struct pci_dev *pci_get_class(unsigned int class,
 					    struct pci_dev *from)
 { return NULL; }
 
-static inline struct pci_dev *pci_get_class_masked(unsigned int class,
-						   unsigned int mask,
-						   struct pci_dev *from)
-{ return NULL; }
 
 static inline int pci_dev_present(const struct pci_device_id *ids)
 { return 0; }
