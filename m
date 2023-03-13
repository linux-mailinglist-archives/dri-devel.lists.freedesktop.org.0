Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EB56B7BAC
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 16:16:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B134C10E0E6;
	Mon, 13 Mar 2023 15:16:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9112F10E56F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 15:16:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 29EEF1FE0F;
 Mon, 13 Mar 2023 15:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678720572; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jBLyiAr8hgvNP6vmWHzoYWURyUsHjp1kRkQnbUG0jgc=;
 b=PH6XGggHN5y81wpD0kU9qiyEhJKuAyhb00JFK8WWW76G29TB7gcoMZ7IfgF2aRBGkztXKC
 60UxGtUpFwqFHHyrtInL7SW/1aOMgC1gZ+CC4o1aW6rwjJv0h+Q25IyMe5/GJjkSxG00h8
 WFm99Z0za5jJUVAUdw/5bA87GIjM9k0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678720572;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jBLyiAr8hgvNP6vmWHzoYWURyUsHjp1kRkQnbUG0jgc=;
 b=y7YSIVcpuxR5eVXsl7flZsxdhclHIuVGBkqEn7x4Spf/BuZ0pWpE1vXXsCumQxqalc64/P
 0gCXf3kr3AX9/2Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0DA8E139F9;
 Mon, 13 Mar 2023 15:16:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sNuUAjw+D2Q5ZgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 13 Mar 2023 15:16:12 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH v2 3/7] drm/gma500: Remove fbdev vma open and close callbacks
Date: Mon, 13 Mar 2023 16:16:06 +0100
Message-Id: <20230313151610.14367-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313151610.14367-1-tzimmermann@suse.de>
References: <20230313151610.14367-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove fbdev emulations' open and close implementaitons for the VM. The
functions are empty. Also update the naming of the VMA code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/gma500/fbdev.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/gma500/fbdev.c b/drivers/gpu/drm/gma500/fbdev.c
index 5235646334d9..8d181cb26440 100644
--- a/drivers/gpu/drm/gma500/fbdev.c
+++ b/drivers/gpu/drm/gma500/fbdev.c
@@ -18,7 +18,7 @@
  * VM area struct
  */
 
-static vm_fault_t psbfb_vm_fault(struct vm_fault *vmf)
+static vm_fault_t psb_fbdev_vm_fault(struct vm_fault *vmf)
 {
 	struct vm_area_struct *vma = vmf->vma;
 	struct drm_framebuffer *fb = vma->vm_private_data;
@@ -49,16 +49,8 @@ static vm_fault_t psbfb_vm_fault(struct vm_fault *vmf)
 	return ret;
 }
 
-static void psbfb_vm_open(struct vm_area_struct *vma)
-{ }
-
-static void psbfb_vm_close(struct vm_area_struct *vma)
-{ }
-
-static const struct vm_operations_struct psbfb_vm_ops = {
-	.fault	= psbfb_vm_fault,
-	.open	= psbfb_vm_open,
-	.close	= psbfb_vm_close
+static const struct vm_operations_struct psb_fbdev_vm_ops = {
+	.fault	= psb_fbdev_vm_fault,
 };
 
 /*
@@ -122,7 +114,7 @@ static int psbfb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 	 * kernel remapping of the object. FIXME: Review if this is
 	 * suitable for our mmap work
 	 */
-	vma->vm_ops = &psbfb_vm_ops;
+	vma->vm_ops = &psb_fbdev_vm_ops;
 	vma->vm_private_data = (void *)fb;
 	vm_flags_set(vma, VM_IO | VM_MIXEDMAP | VM_DONTEXPAND | VM_DONTDUMP);
 
-- 
2.39.2

