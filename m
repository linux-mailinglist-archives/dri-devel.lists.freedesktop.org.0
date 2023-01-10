Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB71663AE7
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 09:23:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 806CD10E543;
	Tue, 10 Jan 2023 08:23:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76DF110E543
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 08:23:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 925E761511;
 Tue, 10 Jan 2023 08:23:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34357C433D2;
 Tue, 10 Jan 2023 08:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1673339004;
 bh=8K+FMUth+6TXnDzRVleW4bzKEScsR5G5Wj5Hia8vwTw=;
 h=Subject:To:Cc:From:Date:From;
 b=BbGdk7mLraX3ASqYI5x/ZOzpUPlpqMAvpjXtmCdexnKsWVq7UvkUkgpzanwaOgh/h
 3PKUbzHB4XllLa8o+d8W8VUam6h/6NNbbhfPB70hGmxH/LCQWojRWy0/qiT7Uftuhx
 G7Ht2yzX/cZrSwc5lCwc9no2IJA7mCOcc47jIVls=
Subject: Patch "drm/plane-helper: Add the missing declaration of
 drm_atomic_state" has been added to the 6.1-stable tree
To: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, javierm@redhat.com,
 maarten.lankhorst@linux.intel.com, majun@amd.com, mripard@kernel.org,
 tzimmermann@suse.de
From: <gregkh@linuxfoundation.org>
Date: Tue, 10 Jan 2023 09:22:53 +0100
Message-ID: <1673338973149145@kroah.com>
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

    drm/plane-helper: Add the missing declaration of drm_atomic_state

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-plane-helper-add-the-missing-declaration-of-drm_atomic_state.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 4e699e34f923188175986ad8a74ab99f7034075e Mon Sep 17 00:00:00 2001
From: Ma Jun <majun@amd.com>
Date: Fri, 16 Dec 2022 11:05:26 +0800
Subject: drm/plane-helper: Add the missing declaration of drm_atomic_state

From: Ma Jun <majun@amd.com>

commit 4e699e34f923188175986ad8a74ab99f7034075e upstream.

Add the missing declaration of struct drm_atomic_state to fix the
compile error below:

error: 'struct drm_atomic_state' declared inside parameter
list will not be visible outside of this definition or declaration [-Werror]

Signed-off-by: Ma Jun <majun@amd.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 8401bd361f59 ("drm/plane-helper: Add a drm_plane_helper_atomic_check() helper")
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.1+
Link: https://patchwork.freedesktop.org/patch/msgid/20221216030526.1335609-1-majun@amd.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 include/drm/drm_plane_helper.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm/drm_plane_helper.h b/include/drm/drm_plane_helper.h
index ff83d2621687..3a574e8cd22f 100644
--- a/include/drm/drm_plane_helper.h
+++ b/include/drm/drm_plane_helper.h
@@ -26,6 +26,7 @@
 
 #include <linux/types.h>
 
+struct drm_atomic_state;
 struct drm_crtc;
 struct drm_framebuffer;
 struct drm_modeset_acquire_ctx;
-- 
2.39.0



Patches currently in stable-queue which might be from majun@amd.com are

queue-6.1/drm-plane-helper-add-the-missing-declaration-of-drm_atomic_state.patch
