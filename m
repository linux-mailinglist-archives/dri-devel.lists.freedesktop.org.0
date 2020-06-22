Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EF4204115
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 22:08:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C560D6E8FF;
	Mon, 22 Jun 2020 20:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 140826E8FD
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 20:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592856494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n4eNCjfCT6yrsed7zHdqkyOBAJ8j5ATJjFmL/mob74o=;
 b=CbIdreCRys2nqEegIfoSQN/AFAYtyu4hB0G9VRQnzHixoogEmkVL7ffl7eOvAySrx4roul
 K/vYS/Nao7rIbAi61T9wJSpzb41nKa2pLfW27rUA1xwH2eCthnqzVA6ViHKm0SGmFjITx+
 mf3ln0FrWW7ssmfgKWNStKkZBnNl3mI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-2Fspj1JAOaqcZWQd4TnykQ-1; Mon, 22 Jun 2020 16:08:11 -0400
X-MC-Unique: 2Fspj1JAOaqcZWQd4TnykQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 525641B18BE1;
 Mon, 22 Jun 2020 20:08:10 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-117-166.rdu2.redhat.com
 [10.10.117.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 152942CD69;
 Mon, 22 Jun 2020 20:08:08 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [RFC v5 06/10] drm/nouveau/kms/nv50-: s/harm/armh/g
Date: Mon, 22 Jun 2020 16:07:26 -0400
Message-Id: <20200622200730.120716-7-lyude@redhat.com>
In-Reply-To: <20200622200730.120716-1-lyude@redhat.com>
References: <20200622200730.120716-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 James Jones <jajones@nvidia.com>, open list <linux-kernel@vger.kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We refer to the armed hardware assembly as armh elsewhere in nouveau, so
fix the naming here to make it consistent.

This patch contains no functional changes.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/wndw.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 99b9b681736da..cfee61f14aa49 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -408,7 +408,7 @@ nv50_wndw_atomic_check(struct drm_plane *plane, struct drm_plane_state *state)
 	struct nv50_wndw *wndw = nv50_wndw(plane);
 	struct nv50_wndw_atom *armw = nv50_wndw_atom(wndw->plane.state);
 	struct nv50_wndw_atom *asyw = nv50_wndw_atom(state);
-	struct nv50_head_atom *harm = NULL, *asyh = NULL;
+	struct nv50_head_atom *armh = NULL, *asyh = NULL;
 	bool modeset = false;
 	int ret;
 
@@ -429,9 +429,9 @@ nv50_wndw_atomic_check(struct drm_plane *plane, struct drm_plane_state *state)
 
 	/* Fetch assembly state for the head the window used to belong to. */
 	if (armw->state.crtc) {
-		harm = nv50_head_atom_get(asyw->state.state, armw->state.crtc);
-		if (IS_ERR(harm))
-			return PTR_ERR(harm);
+		armh = nv50_head_atom_get(asyw->state.state, armw->state.crtc);
+		if (IS_ERR(armh))
+			return PTR_ERR(armh);
 	}
 
 	/* LUT configuration can potentially cause the window to be disabled. */
@@ -455,8 +455,8 @@ nv50_wndw_atomic_check(struct drm_plane *plane, struct drm_plane_state *state)
 		asyh->wndw.mask |= BIT(wndw->id);
 	} else
 	if (armw->visible) {
-		nv50_wndw_atomic_check_release(wndw, asyw, harm);
-		harm->wndw.mask &= ~BIT(wndw->id);
+		nv50_wndw_atomic_check_release(wndw, asyw, armh);
+		armh->wndw.mask &= ~BIT(wndw->id);
 	} else {
 		return 0;
 	}
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
