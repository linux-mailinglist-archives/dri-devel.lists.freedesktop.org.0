Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EB77C9AF8
	for <lists+dri-devel@lfdr.de>; Sun, 15 Oct 2023 21:18:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7890C10E103;
	Sun, 15 Oct 2023 19:18:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA3310E103
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Oct 2023 19:18:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CC97B60C08;
 Sun, 15 Oct 2023 19:18:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EE0AC433C7;
 Sun, 15 Oct 2023 19:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1697397490;
 bh=lu9+q9Wh73VMy5TMLiwLQRUNcrNcjAeVbHZlthfxaT0=;
 h=Subject:To:Cc:From:Date:From;
 b=2o5zUYKV5qZ297VqZg2IL8lRPW0w6g7b6e2rOo06iEu2hXJvGC95BR5cZzNdhvQKK
 1DiG665bBkJzmimr826Zin5nRBCWM4EO4Y3qpnCy2er4uy/4kTiE36J25qK3Z/JaJZ
 TOsV8dTctgmdTzFAmkU/1UeFc/NrNT0Ew20CjJmo=
Subject: Patch "drm/tiny: correctly print `struct resource *` on error" has
 been added to the 6.5-stable tree
To: dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 javierm@redhat.com, joey.gouly@arm.com, treding@nvidia.com,
 tzimmermann@suse.de
From: <gregkh@linuxfoundation.org>
Date: Sun, 15 Oct 2023 21:05:15 +0200
Message-ID: <2023101515-unsaved-silenced-5e55@gregkh>
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

    drm/tiny: correctly print `struct resource *` on error

to the 6.5-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-tiny-correctly-print-struct-resource-on-error.patch
and it can be found in the queue-6.5 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From c1165df2be2fffe3adeeaa68f4ee4325108c5e4e Mon Sep 17 00:00:00 2001
From: Joey Gouly <joey.gouly@arm.com>
Date: Tue, 10 Oct 2023 18:46:52 +0100
Subject: drm/tiny: correctly print `struct resource *` on error

From: Joey Gouly <joey.gouly@arm.com>

commit c1165df2be2fffe3adeeaa68f4ee4325108c5e4e upstream.

The `res` variable is already a `struct resource *`, don't take the address of it.

Fixes incorrect output:

	simple-framebuffer 9e20dc000.framebuffer: [drm] *ERROR* could not acquire memory range [??? 0xffff4be88a387d00-0xfffffefffde0a240 flags 0x0]: -16

To be correct:

	simple-framebuffer 9e20dc000.framebuffer: [drm] *ERROR* could not acquire memory range [mem 0x9e20dc000-0x9e307bfff flags 0x200]: -16

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Fixes: 9a10c7e6519b ("drm/simpledrm: Add support for system memory framebuffers")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Thierry Reding <treding@nvidia.com>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.3+
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://patchwork.freedesktop.org/patch/msgid/20231010174652.2439513-1-joey.gouly@arm.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/tiny/simpledrm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index ff86ba1ae1b8..8ea120eb8674 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -745,7 +745,7 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 
 		ret = devm_aperture_acquire_from_firmware(dev, res->start, resource_size(res));
 		if (ret) {
-			drm_err(dev, "could not acquire memory range %pr: %d\n", &res, ret);
+			drm_err(dev, "could not acquire memory range %pr: %d\n", res, ret);
 			return ERR_PTR(ret);
 		}
 
-- 
2.42.0



Patches currently in stable-queue which might be from joey.gouly@arm.com are

queue-6.5/drm-tiny-correctly-print-struct-resource-on-error.patch
