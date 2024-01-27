Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1534583F111
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jan 2024 23:55:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64B3610F06C;
	Sat, 27 Jan 2024 22:55:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 195A210F067
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jan 2024 22:55:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8FCA4613B3;
 Sat, 27 Jan 2024 22:55:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F50AC433C7;
 Sat, 27 Jan 2024 22:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1706396105;
 bh=qlC+HI+Xqb4kwyUJWk157slQ/0aih97uCBvcmT1DwQw=;
 h=Subject:To:Cc:From:Date:From;
 b=CDSyHzy2nmRebEjUtt9Czip/EO5f3zTKEfsbXD4Lf2c+MnYHmxIPMOUBbF1SILnRn
 T7KEQjxEBpj6DaxQRxLo9lRnVb/Wdmu5+bNe3AeATf6G8TsEcxoUAv4kk0D8i896GE
 yjdmeE5HGoUEJvHVagmFPJPyLB73WKrqzlmf5DzI=
Subject: Patch "drm: Fix TODO list mentioning non-KMS drivers" has been added
 to the 6.6-stable tree
To: airlied@gmail.com, airlied@redhat.com, alexander.deucher@amd.com,
 cai.huoqing@linux.dev, corbet@lwn.net, daniel.vetter@ffwll.ch, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
From: <gregkh@linuxfoundation.org>
Date: Sat, 27 Jan 2024 14:54:59 -0800
Message-ID: <2024012759-velocity-yeah-6c05@gregkh>
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

    drm: Fix TODO list mentioning non-KMS drivers

to the 6.6-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-fix-todo-list-mentioning-non-kms-drivers.patch
and it can be found in the queue-6.6 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 9cf5ca1f485cae406968947a92bf304603999fa1 Mon Sep 17 00:00:00 2001
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Wed, 22 Nov 2023 13:09:31 +0100
Subject: drm: Fix TODO list mentioning non-KMS drivers

From: Thomas Zimmermann <tzimmermann@suse.de>

commit 9cf5ca1f485cae406968947a92bf304603999fa1 upstream.

Non-KMS drivers have been removed from DRM. Update the TODO list
accordingly.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: a276afc19eec ("drm: Remove some obsolete drm pciids(tdfx, mga, i810, savage, r128, sis, via)")
Cc: Cai Huoqing <cai.huoqing@linux.dev>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.3+
Cc: linux-doc@vger.kernel.org
Reviewed-by: David Airlie <airlied@gmail.com>
Reviewed-by: Daniel Vetter <daniel@ffwll.ch>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231122122449.11588-3-tzimmermann@suse.de
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 Documentation/gpu/todo.rst | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 503d57c75215..41a264bf84ce 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -337,8 +337,8 @@ connector register/unregister fixes
 
 Level: Intermediate
 
-Remove load/unload callbacks from all non-DRIVER_LEGACY drivers
----------------------------------------------------------------
+Remove load/unload callbacks
+----------------------------
 
 The load/unload callbacks in struct &drm_driver are very much midlayers, plus
 for historical reasons they get the ordering wrong (and we can't fix that)
@@ -347,8 +347,7 @@ between setting up the &drm_driver structure and calling drm_dev_register().
 - Rework drivers to no longer use the load/unload callbacks, directly coding the
   load/unload sequence into the driver's probe function.
 
-- Once all non-DRIVER_LEGACY drivers are converted, disallow the load/unload
-  callbacks for all modern drivers.
+- Once all drivers are converted, remove the load/unload callbacks.
 
 Contact: Daniel Vetter
 
-- 
2.43.0



Patches currently in stable-queue which might be from tzimmermann@suse.de are

queue-6.6/sh-ecovec24-rename-missed-backlight-field-from-fbdev.patch
queue-6.6/drm-disable-the-cursor-plane-on-atomic-contexts-with-virtualized-drivers.patch
queue-6.6/drm-fix-todo-list-mentioning-non-kms-drivers.patch
queue-6.6/revert-drivers-firmware-move-sysfb_init-from-device_initcall-to-subsys_initcall_sync.patch
queue-6.6/drm-allow-drivers-to-indicate-the-damage-helpers-to-ignore-damage-clips.patch
queue-6.6/drm-virtio-disable-damage-clipping-if-fb-changed-since-last-page-flip.patch
