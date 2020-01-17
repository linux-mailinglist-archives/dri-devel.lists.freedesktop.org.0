Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5224D141447
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 23:48:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA396F955;
	Fri, 17 Jan 2020 22:48:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E2916F955
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 22:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579301280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=hEreOJSuBCTx2oP66raYQVfUU+2kOiqBdBJ+OggsyuA=;
 b=jOxaEJbj0fjeqNrJ6aT99+jpDgj5xZjD9hvntDYCZNN4rOeCY3+Gl+cK4xgB3GQBStAnQR
 pArJ62HaTNjbxZbLc3aHnBRQdWBxgamJTKWzGF1Obn2i0xRbZFAadqGHoENScQw6uwx8hy
 1Su5tl0D8j2qnA0spRa6MGFtB11EYiA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-7wTFAP3gPre9UXcLsWG6bQ-1; Fri, 17 Jan 2020 17:47:59 -0500
X-MC-Unique: 7wTFAP3gPre9UXcLsWG6bQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A5FEDB64;
 Fri, 17 Jan 2020 22:47:57 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-90.bss.redhat.com
 [10.20.1.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AED005DA32;
 Fri, 17 Jan 2020 22:47:53 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/dp_mst: Fix indenting in
 drm_dp_mst_topology_mgr_set_mst()
Date: Fri, 17 Jan 2020 17:47:48 -0500
Message-Id: <20200117224749.128994-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This has always bugged me but somehow I've never remembered to actually
fix it. So let's do that.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 8fd85a33ed1b..89c2a7505cbd 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -3521,7 +3521,9 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool ms
 		drm_dp_mst_topology_get_mstb(mgr->mst_primary);
 
 		ret = drm_dp_dpcd_writeb(mgr->aux, DP_MSTM_CTRL,
-							 DP_MST_EN | DP_UP_REQ_EN | DP_UPSTREAM_IS_SRC);
+					 DP_MST_EN |
+					 DP_UP_REQ_EN |
+					 DP_UPSTREAM_IS_SRC);
 		if (ret < 0)
 			goto out_unlock;
 
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
