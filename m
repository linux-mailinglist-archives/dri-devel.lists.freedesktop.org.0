Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D039AED97C
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 12:12:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F75110E3F0;
	Mon, 30 Jun 2025 10:12:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NllBLgy3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E95410E3F3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 10:12:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B7DC65C5A57;
 Mon, 30 Jun 2025 10:12:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8A34C4CEEB;
 Mon, 30 Jun 2025 10:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1751278322;
 bh=Km+ZFYQ+usjsFUI+W+AXfF3+xfFxu675bv5XF5OoDDs=;
 h=Subject:To:Cc:From:Date:From;
 b=NllBLgy32kbiAgURc/10ClWXxO6cEA5O+pChddC7zArrU3UacQr/mfZANAxAayB7X
 MvKJpmTCpK0C+dip3fy1d23jFRn0qxFylQGCOUZKTNY8F8liw+P0Xit8wfXcitrMt4
 bQ7sNvb0OKw2qV1RI7UrXsviXoLpiD61N0TmFGFg=
Subject: Patch "drm/ast: Fix comment on modeset lock" has been added to the
 6.12-stable tree
To: airlied@redhat.com, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, jfalempe@redhat.com, tzimmermann@suse.de
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 30 Jun 2025 12:09:07 +0200
Message-ID: <2025063007-gusty-stunned-6a3a@gregkh>
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

    drm/ast: Fix comment on modeset lock

to the 6.12-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-ast-fix-comment-on-modeset-lock.patch
and it can be found in the queue-6.12 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 7cce65f3789e04c0f7668a66563e680d81d54493 Mon Sep 17 00:00:00 2001
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Mon, 24 Mar 2025 10:44:09 +0100
Subject: drm/ast: Fix comment on modeset lock

From: Thomas Zimmermann <tzimmermann@suse.de>

commit 7cce65f3789e04c0f7668a66563e680d81d54493 upstream.

The ast driver protects the commit tail against concurrent reads
of the display modes by acquiring a lock. The comment is misleading
as the lock is not released in atomic_flush, but at the end of the
commit-tail helper. Rewrite the comment.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 1fe182154984 ("drm/ast: Acquire I/O-register lock in atomic_commit_tail function")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.2+
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Link: https://lore.kernel.org/r/20250324094520.192974-2-tzimmermann@suse.de
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/ast/ast_mode.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1319,9 +1319,9 @@ static void ast_mode_config_helper_atomi
 
 	/*
 	 * Concurrent operations could possibly trigger a call to
-	 * drm_connector_helper_funcs.get_modes by trying to read the
-	 * display modes. Protect access to I/O registers by acquiring
-	 * the I/O-register lock. Released in atomic_flush().
+	 * drm_connector_helper_funcs.get_modes by reading the display
+	 * modes. Protect access to registers by acquiring the modeset
+	 * lock.
 	 */
 	mutex_lock(&ast->modeset_lock);
 	drm_atomic_helper_commit_tail(state);


Patches currently in stable-queue which might be from tzimmermann@suse.de are

queue-6.12/drm-cirrus-qemu-fix-pitch-programming.patch
queue-6.12/drm-ast-fix-comment-on-modeset-lock.patch
queue-6.12/drm-udl-unregister-device-before-cleaning-up-on-disconnect.patch
