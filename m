Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE428A4F64
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 14:45:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51EBC11252B;
	Mon, 15 Apr 2024 12:45:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rXyd0/bS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31500112527
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 12:45:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 401DCCE0B69;
 Mon, 15 Apr 2024 12:44:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EEB3C2BD10;
 Mon, 15 Apr 2024 12:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1713185098;
 bh=ANZGpoG9rPHtbxJ4rQ26UT33BXp3BbloctA7wC9g6YU=;
 h=Subject:To:Cc:From:Date:From;
 b=rXyd0/bSNSgR+zRMZ/FSG6LLrz3YQsRnc0bm3rGCMSYMcH7F5uDWS511NgADOvw31
 HBxJ2SF8elGsuqdS4Lws6Rcbv4hXGIc6O3cKtml8yRlSfviQnX7/AMMCTDAqBt/NKZ
 ofCgDMB/3a11aStFObm49v5j+6Eu9Sc+ozYjd+lI=
Subject: Patch "drm/vmwgfx: Enable DMA mappings with SEV" has been added to
 the 6.8-stable tree
To: bcm-kernel-feedback-list@broadcom.com, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, martin.krastev@broadcom.com, ye.li@broadcom.com,
 zack.rusin@broadcom.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 15 Apr 2024 14:43:52 +0200
Message-ID: <2024041552-city-unstopped-6918@gregkh>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    drm/vmwgfx: Enable DMA mappings with SEV

to the 6.8-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-vmwgfx-enable-dma-mappings-with-sev.patch
and it can be found in the queue-6.8 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 4c08f01934ab67d1d283d5cbaa52b923abcfe4cd Mon Sep 17 00:00:00 2001
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Sun, 7 Apr 2024 22:28:02 -0400
Subject: drm/vmwgfx: Enable DMA mappings with SEV

From: Zack Rusin <zack.rusin@broadcom.com>

commit 4c08f01934ab67d1d283d5cbaa52b923abcfe4cd upstream.

Enable DMA mappings in vmwgfx after TTM has been fixed in commit
3bf3710e3718 ("drm/ttm: Add a generic TTM memcpy move for page-based iomem")

This enables full guest-backed memory support and in particular allows
usage of screen targets as the presentation mechanism.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Reported-by: Ye Li <ye.li@broadcom.com>
Tested-by: Ye Li <ye.li@broadcom.com>
Fixes: 3b0d6458c705 ("drm/vmwgfx: Refuse DMA operation when SEV encryption is active")
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.6+
Reviewed-by: Martin Krastev <martin.krastev@broadcom.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240408022802.358641-1-zack.rusin@broadcom.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c |   11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -666,11 +666,12 @@ static int vmw_dma_select_mode(struct vm
 		[vmw_dma_map_populate] = "Caching DMA mappings.",
 		[vmw_dma_map_bind] = "Giving up DMA mappings early."};
 
-	/* TTM currently doesn't fully support SEV encryption. */
-	if (cc_platform_has(CC_ATTR_MEM_ENCRYPT))
-		return -EINVAL;
-
-	if (vmw_force_coherent)
+	/*
+	 * When running with SEV we always want dma mappings, because
+	 * otherwise ttm tt pool pages will bounce through swiotlb running
+	 * out of available space.
+	 */
+	if (vmw_force_coherent || cc_platform_has(CC_ATTR_MEM_ENCRYPT))
 		dev_priv->map_mode = vmw_dma_alloc_coherent;
 	else if (vmw_restrict_iommu)
 		dev_priv->map_mode = vmw_dma_map_bind;


Patches currently in stable-queue which might be from zack.rusin@broadcom.com are

queue-6.8/drm-vmwgfx-enable-dma-mappings-with-sev.patch
