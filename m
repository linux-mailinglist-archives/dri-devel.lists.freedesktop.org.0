Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 566EB23D947
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 12:33:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE4416E8B1;
	Thu,  6 Aug 2020 10:33:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F24A6E8B1
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Aug 2020 10:33:42 +0000 (UTC)
Date: Thu, 06 Aug 2020 10:33:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1596710019;
 bh=o4Zb1VZ2sw2lYR5bygGKp2DLxPwzVMAbxThnhe72Y6w=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=HO/nnMem6tJu98spB1tF5iZWg4OK+UiqmiZU62n/A73k8gq8UtE9EVrvEer/rNbJE
 Zxj0yVrOtIirjivatvWLetq6FdvhAvq/CQ/quf9kkVs5zaNkrhOmLZBq+or9D6AI1X
 ZtZVTwo8LHF3HiOncvBQdqBWk++OaD1mGmdBUt+aekKJP8oof350k1jvhoXnJ3jQGT
 ftQTTEBuWQzGYjIHi/zJQqaCxezbGyuNj34gErFb6oojji7Mhw1GN/tqT/7oWVazgN
 UcxxUoDq9z5TfljMrUamQU7JQGDi1TMtQRnDQpPt8lLpM7rUu4gtJUX5vOMHz7Tmex
 v75d+JuuTrCxQ==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm: drivers may provide multiple primary planes per CRTC
Message-ID: <TJAyvL7GM0cZ61sbzYMZ7IbVow2d32QQntnAB5_zpBOdcKVIAy8qhZg4En6C8Ka-mUXV-goV21ExVsA8Q3N_lJV4jf6g6llQBQSDs602jgs=@emersion.fr>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
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

Some drivers may expose primary planes compatible with multiple CRTCs.
Make this clear in the docs: the current wording may be misunderstood as
"exactly one primary plane per CRTC".

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_plane.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index b7b90b3a2e38..108a922e8c23 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -49,8 +49,8 @@
  * &struct drm_plane (possibly as part of a larger structure) and registers it
  * with a call to drm_universal_plane_init().
  *
- * Cursor and overlay planes are optional. All drivers should provide one
- * primary plane per CRTC to avoid surprising userspace too much. See enum
+ * Cursor and overlay planes are optional. All drivers should provide at least
+ * one primary plane per CRTC to avoid surprising userspace too much. See enum
  * drm_plane_type for a more in-depth discussion of these special uapi-relevant
  * plane types. Special planes are associated with their CRTC by calling
  * drm_crtc_init_with_planes().
-- 
2.28.0


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
