Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 152872300DF
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 06:51:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9860C6E165;
	Tue, 28 Jul 2020 04:51:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE7F6E165
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 04:51:39 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-Yki3-71tPLuKl5JVR46Bvg-1; Tue, 28 Jul 2020 00:51:33 -0400
X-MC-Unique: Yki3-71tPLuKl5JVR46Bvg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2B51101C8A9;
 Tue, 28 Jul 2020 04:51:31 +0000 (UTC)
Received: from dreadlord-bne-redhat-com.bne.redhat.com (unknown [10.64.32.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B1C579251;
 Tue, 28 Jul 2020 04:51:30 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: drop unusued function declaration
Date: Tue, 28 Jul 2020 14:51:29 +1000
Message-Id: <20200728045129.21065-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

This was removed in
f5a9a9383f279de9da63296cb623a6418a66196b drm/ttm: remove TTM_MEMTYPE_FLAG_CMA

but the the declaration was left dangling.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 include/drm/ttm/ttm_bo_driver.h | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index 71b195e78c7c..5a37f1cc057e 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -525,17 +525,6 @@ ttm_flag_masked(uint32_t *old, uint32_t new, uint32_t mask)
  * ttm_bo.c
  */
 
-/**
- * ttm_mem_reg_is_pci
- *
- * @bdev: Pointer to a struct ttm_bo_device.
- * @mem: A valid struct ttm_mem_reg.
- *
- * Returns true if the memory described by @mem is PCI memory,
- * false otherwise.
- */
-bool ttm_mem_reg_is_pci(struct ttm_bo_device *bdev, struct ttm_mem_reg *mem);
-
 /**
  * ttm_bo_mem_space
  *
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
