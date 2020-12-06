Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D1B2D05B3
	for <lists+dri-devel@lfdr.de>; Sun,  6 Dec 2020 16:32:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 313866E462;
	Sun,  6 Dec 2020 15:31:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch
 [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 658C36E462
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Dec 2020 15:31:58 +0000 (UTC)
Date: Sun, 06 Dec 2020 15:31:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1607268716;
 bh=lmyo6CTuaxZMZo1LSL/DYM6y4Mdc6nWeIUQxKISBiQ8=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=bNly6WHal7u3ggWsm3PpIoecM9QWCg5+v5/zIAPqiphMUz/gSg99a9eZTcx5JdsKm
 XHOQnZK7u1QGCVwu28thYRY5AAte6kpkOL6TKX+GkpMIkgZgUzjs9kRIwPXniqM7Ij
 gF/2ldhz3veFg4rzVcD7zaeB7bPuEEr1OYz8dbZTW8THja9ZMN1PkBPwERbu6z49MF
 H3daPoHeRfmElg6lPPU8Vkl71wfKOLL5lffuVdNDtH6bBtLtmYnfD4ZtFbDzlSkT/F
 ms5wNKMgpYEcb1DEOKbrzJW3L2rBq0/J8Q33iIsQTRsHQvpy6vzKqLJOWS/w+x7EHh
 Nhzx1pE96AK4g==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm: fix typos in plane and CRTC overviews
Message-ID: <3gESG7rm6lCex6qBZnl3YXTfefKZODEvJ4DX4RoI1cY@cp4-web-040.plabs.ch>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix one missing letter, and one duplicate struct field reference.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_crtc.c  | 2 +-
 drivers/gpu/drm/drm_plane.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index f927976eca50..8ece63e25f5a 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -67,7 +67,7 @@
  * &drm_crtc_funcs.page_flip and &drm_crtc_funcs.cursor_set2, and other legacy
  * operations like &drm_crtc_funcs.gamma_set. For atomic drivers all these
  * features are controlled through &drm_property and
- * &drm_mode_config_funcs.atomic_check and &drm_mode_config_funcs.atomic_check.
+ * &drm_mode_config_funcs.atomic_check.
  */
 
 /**
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index e6231947f987..385801dd21f9 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -40,7 +40,7 @@
  * A plane represents an image source that can be blended with or overlayed on
  * top of a CRTC during the scanout process. Planes take their input data from a
  * &drm_framebuffer object. The plane itself specifies the cropping and scaling
- * of that image, and where it is placed on the visible are of a display
+ * of that image, and where it is placed on the visible area of a display
  * pipeline, represented by &drm_crtc. A plane can also have additional
  * properties that specify how the pixels are positioned and blended, like
  * rotation or Z-position. All these properties are stored in &drm_plane_state.
-- 
2.29.2


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
