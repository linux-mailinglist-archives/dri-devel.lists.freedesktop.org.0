Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 186CB940E2F
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 11:45:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C8EE10E27A;
	Tue, 30 Jul 2024 09:45:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="meXB/yLt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26FF310E27A
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 09:45:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 307DB61D5F;
 Tue, 30 Jul 2024 09:45:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 638CBC32782;
 Tue, 30 Jul 2024 09:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1722332727;
 bh=M0ltyQrMsRlYvsiIutR3cGvd6LZCDQg5mHaQM1fEBgU=;
 h=Subject:To:Cc:From:Date:From;
 b=meXB/yLtr16S7tsxXKcgrRnepSog7fLqTziUnBrZse8iTIF8nVlOcm4i4SyfiWlDd
 TBdN3xAxmJEZ9UqC4UVwyoapL05CO9n3ef+z7IsHL8EcyPeBRk/x4x6Zx/KVlOhN9c
 epFf/m8PXvNZJscpy3M6hTmsJ/8D6r89tAPPERCc=
Subject: Patch "drm/udl: Remove DRM_CONNECTOR_POLL_HPD" has been added to the
 6.1-stable tree
To: airlied@redhat.com, alexander.deucher@amd.com,
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 jani.nikula@intel.com, sean@poorly.run, tutankhamen@chromium.org,
 tzimmermann@suse.de
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 30 Jul 2024 11:45:01 +0200
Message-ID: <2024073059-unused-tiptoeing-c7dc@gregkh>
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

    drm/udl: Remove DRM_CONNECTOR_POLL_HPD

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-udl-remove-drm_connector_poll_hpd.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 5aed213c7c6c4f5dcb1a3ef146f493f18fe703dc Mon Sep 17 00:00:00 2001
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Fri, 10 May 2024 17:47:08 +0200
Subject: drm/udl: Remove DRM_CONNECTOR_POLL_HPD

From: Thomas Zimmermann <tzimmermann@suse.de>

commit 5aed213c7c6c4f5dcb1a3ef146f493f18fe703dc upstream.

DisplayLink devices do not generate hotplug events. Remove the poll
flag DRM_CONNECTOR_POLL_HPD, as it may not be specified together with
DRM_CONNECTOR_POLL_CONNECT or DRM_CONNECTOR_POLL_DISCONNECT.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: afdfc4c6f55f ("drm/udl: Fixed problem with UDL adpater reconnection")
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Cc: Robert Tarasov <tutankhamen@chromium.org>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v4.15+
Link: https://patchwork.freedesktop.org/patch/msgid/20240510154841.11370-2-tzimmermann@suse.de
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/udl/udl_modeset.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -527,8 +527,7 @@ struct drm_connector *udl_connector_init
 
 	drm_connector_helper_add(connector, &udl_connector_helper_funcs);
 
-	connector->polled = DRM_CONNECTOR_POLL_HPD |
-			    DRM_CONNECTOR_POLL_CONNECT |
+	connector->polled = DRM_CONNECTOR_POLL_CONNECT |
 			    DRM_CONNECTOR_POLL_DISCONNECT;
 
 	return connector;


Patches currently in stable-queue which might be from tzimmermann@suse.de are

