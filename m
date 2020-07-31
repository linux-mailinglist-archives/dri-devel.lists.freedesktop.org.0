Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47214233E0D
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 06:07:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31ECE6E9C0;
	Fri, 31 Jul 2020 04:07:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9714D6E9BD
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 04:07:11 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-G5p97TIaPP2TQ9COQ1L_iw-1; Fri, 31 Jul 2020 00:07:07 -0400
X-MC-Unique: G5p97TIaPP2TQ9COQ1L_iw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52C08800461;
 Fri, 31 Jul 2020 04:07:06 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DBCCC100238C;
 Fri, 31 Jul 2020 04:07:01 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 44/49] drm/ttm: drop priv pointer in memory manager
Date: Fri, 31 Jul 2020 14:05:15 +1000
Message-Id: <20200731040520.3701599-45-airlied@gmail.com>
In-Reply-To: <20200731040520.3701599-1-airlied@gmail.com>
References: <20200731040520.3701599-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
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
Cc: christian.koenig@amd.com, sroland@vmware.com, bskeggs@redhat.com,
 kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

This isn't needed anymore by any drivers.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 include/drm/ttm/ttm_bo_driver.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index 6319d85d7270..a38704fe0737 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -123,7 +123,6 @@ struct ttm_mem_type_manager_func {
  * @default_caching: The default caching policy used for a buffer object
  * placed in this memory type if the user doesn't provide one.
  * @func: structure pointer implementing the range manager. See above
- * @priv: Driver private closure for @func.
  * @io_reserve_mutex: Mutex optionally protecting shared io_reserve structures
  * @use_io_reserve_lru: Use an lru list to try to unreserve io_mem_regions
  * reserved by the TTM vm system.
@@ -152,7 +151,6 @@ struct ttm_mem_type_manager {
 	uint32_t available_caching;
 	uint32_t default_caching;
 	const struct ttm_mem_type_manager_func *func;
-	void *priv;
 	struct mutex io_reserve_mutex;
 	bool use_io_reserve_lru;
 	spinlock_t move_lock;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
