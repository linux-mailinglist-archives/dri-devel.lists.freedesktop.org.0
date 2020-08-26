Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C71B25251F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 03:45:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FABE6E9DF;
	Wed, 26 Aug 2020 01:45:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF666E9E2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 01:45:08 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-LPmok6dBMKCDqDM55wndpA-1; Tue, 25 Aug 2020 21:45:03 -0400
X-MC-Unique: LPmok6dBMKCDqDM55wndpA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1A8A189E605;
 Wed, 26 Aug 2020 01:45:02 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-53.bne.redhat.com
 [10.64.54.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 243ED61100;
 Wed, 26 Aug 2020 01:45:00 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 12/23] drm/ttm/agp: drop back end bindings from agp
Date: Wed, 26 Aug 2020 11:44:17 +1000
Message-Id: <20200826014428.828392-13-airlied@gmail.com>
In-Reply-To: <20200826014428.828392-1-airlied@gmail.com>
References: <20200826014428.828392-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: gmail.com
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
Cc: kraxel@redhat.com, sroland@vmware.com, bskeggs@redhat.com,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

These aren't used anymore.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_agp_backend.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_agp_backend.c b/drivers/gpu/drm/ttm/ttm_agp_backend.c
index fbf98cd1a3e5..8072fb7c5bc8 100644
--- a/drivers/gpu/drm/ttm/ttm_agp_backend.c
+++ b/drivers/gpu/drm/ttm/ttm_agp_backend.c
@@ -112,12 +112,6 @@ void ttm_agp_destroy(struct ttm_bo_device *bdev,
 }
 EXPORT_SYMBOL(ttm_agp_destroy);
 
-static struct ttm_backend_func ttm_agp_func = {
-	.bind = ttm_agp_bind,
-	.unbind = ttm_agp_unbind,
-	.destroy = ttm_agp_destroy,
-};
-
 struct ttm_tt *ttm_agp_tt_create(struct ttm_buffer_object *bo,
 				 struct agp_bridge_data *bridge,
 				 uint32_t page_flags)
@@ -130,7 +124,6 @@ struct ttm_tt *ttm_agp_tt_create(struct ttm_buffer_object *bo,
 
 	agp_be->mem = NULL;
 	agp_be->bridge = bridge;
-	agp_be->ttm.func = &ttm_agp_func;
 
 	if (ttm_tt_init(&agp_be->ttm, bo, page_flags)) {
 		kfree(agp_be);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
