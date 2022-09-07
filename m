Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 726D95AFC09
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 07:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5787810E307;
	Wed,  7 Sep 2022 05:55:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 306 seconds by postgrey-1.36 at gabe;
 Wed, 07 Sep 2022 03:35:09 UTC
Received: from mail.nfschina.com (mail.nfschina.com [124.16.136.209])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4D3A310E0CE
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 03:35:09 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mail.nfschina.com (Postfix) with ESMTP id B553F1E80D59;
 Wed,  7 Sep 2022 11:28:48 +0800 (CST)
X-Virus-Scanned: amavisd-new at test.com
Received: from mail.nfschina.com ([127.0.0.1])
 by localhost (mail.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ngmRjKLa8Til; Wed,  7 Sep 2022 11:28:46 +0800 (CST)
Received: from localhost.localdomain (unknown [219.141.250.2])
 (Authenticated sender: zeming@nfschina.com)
 by mail.nfschina.com (Postfix) with ESMTPA id EA2EB1E80D57;
 Wed,  7 Sep 2022 11:28:45 +0800 (CST)
From: Li zeming <zeming@nfschina.com>
To: christian.koenig@amd.com, ray.huang@amd.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] drm/ttm: Remove unnecessary '0' values from ret
Date: Wed,  7 Sep 2022 11:29:34 +0800
Message-Id: <20220907032934.4490-1-zeming@nfschina.com>
X-Mailer: git-send-email 2.18.2
X-Mailman-Approved-At: Wed, 07 Sep 2022 05:55:23 +0000
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
Cc: Li zeming <zeming@nfschina.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The variable ret is assigned in the judgment branch statement, he does
not need to initialize the assignment.

Signed-off-by: Li zeming <zeming@nfschina.com>
---
 include/drm/ttm/ttm_bo_driver.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index 897b88f0bd59..1afa891f488a 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -106,7 +106,7 @@ static inline int ttm_bo_reserve(struct ttm_buffer_object *bo,
 				 bool interruptible, bool no_wait,
 				 struct ww_acquire_ctx *ticket)
 {
-	int ret = 0;
+	int ret;
 
 	if (no_wait) {
 		bool success;
-- 
2.18.2

