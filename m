Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BF6189338
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 01:42:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 181526E83B;
	Wed, 18 Mar 2020 00:42:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ED966E834
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 00:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584492164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xxjWKp4eSSSGnZvC4kR091RQqoE0RigqfNFBzIWnlyI=;
 b=DTN1V/ITvsJAak8mG++z/d5K8Q1RmX3yGW/enyND8tMVJ7urU9b57N8Jrl3hFc4XG604YK
 Jydp0DkXwou62iHTC2Hsq5g7DviGIfc1A3KE/KSOVVQbnx/NBJF9NmDdMjDDnryhAfOEpY
 0vTxNU3gsZeEXG2ne1XpVLwB4pu1BRk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-xMaJolXOPpaxC3Ja2791Jw-1; Tue, 17 Mar 2020 20:42:42 -0400
X-MC-Unique: xMaJolXOPpaxC3Ja2791Jw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CAA2A8014CD;
 Wed, 18 Mar 2020 00:42:40 +0000 (UTC)
Received: from whitewolf.redhat.com (ovpn-113-173.rdu2.redhat.com
 [10.10.113.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A11D660BE0;
 Wed, 18 Mar 2020 00:42:39 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 5/9] drm/nouveau/kms/nv50-: s/harm/armh/g
Date: Tue, 17 Mar 2020 20:41:02 -0400
Message-Id: <20200318004159.235623-6-lyude@redhat.com>
In-Reply-To: <20200318004159.235623-1-lyude@redhat.com>
References: <20200318004159.235623-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
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
index bb737f9281e6..39cca8eaa066 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -397,7 +397,7 @@ nv50_wndw_atomic_check(struct drm_plane *plane, struct drm_plane_state *state)
 	struct nv50_wndw *wndw = nv50_wndw(plane);
 	struct nv50_wndw_atom *armw = nv50_wndw_atom(wndw->plane.state);
 	struct nv50_wndw_atom *asyw = nv50_wndw_atom(state);
-	struct nv50_head_atom *harm = NULL, *asyh = NULL;
+	struct nv50_head_atom *armh = NULL, *asyh = NULL;
 	bool modeset = false;
 	int ret;
 
@@ -418,9 +418,9 @@ nv50_wndw_atomic_check(struct drm_plane *plane, struct drm_plane_state *state)
 
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
@@ -444,8 +444,8 @@ nv50_wndw_atomic_check(struct drm_plane *plane, struct drm_plane_state *state)
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
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
