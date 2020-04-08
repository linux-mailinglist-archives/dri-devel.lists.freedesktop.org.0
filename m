Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B96A1A2BC7
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 00:14:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 263D36EB0C;
	Wed,  8 Apr 2020 22:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.sdf.org (mx.sdf.org [205.166.94.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42DE96EB0C
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 22:14:46 +0000 (UTC)
Received: from sdf.org (IDENT:coypu@sdf.lonestar.org [205.166.94.16])
 by mx.sdf.org (8.15.2/8.14.5) with ESMTPS id 038MEhr7010595
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits) verified NO);
 Wed, 8 Apr 2020 22:14:43 GMT
Received: (from coypu@localhost)
 by sdf.org (8.15.2/8.12.8/Submit) id 038MEhhK009779;
 Wed, 8 Apr 2020 22:14:43 GMT
Date: Wed, 8 Apr 2020 22:14:42 +0000
From: Maya Rashish <coypu@sdf.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: Remove reference to the mem_glob member
Message-ID: <20200408221442.GA16848@SDF.ORG>
MIME-Version: 1.0
Content-Disposition: inline
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It was removed in:

Author: Christian K=F6nig <christian.koenig@amd.com>
Date:   Wed Sep 25 11:38:50 2019 +0200

    drm/ttm: remove pointers to globals

Signed-off-by: Maya Rashish <coypu@sdf.org>
---
 include/drm/ttm/ttm_bo_driver.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_drive=
r.h
index c9e0fd09f4b2..54a527aa79cc 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -390,7 +390,6 @@ struct ttm_bo_driver {
 /**
  * struct ttm_bo_global - Buffer object driver global data.
  *
- * @mem_glob: Pointer to a struct ttm_mem_global object for accounting.
  * @dummy_read_page: Pointer to a dummy page used for mapping requests
  * of unpopulated pages.
  * @shrink: A shrink callback object used for buffer object swap.
-- =

2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
