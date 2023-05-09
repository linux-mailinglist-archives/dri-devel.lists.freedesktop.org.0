Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A636FC87B
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 16:03:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A752410E296;
	Tue,  9 May 2023 14:03:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D3610E296
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 14:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683641028; x=1715177028;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ADTIfuE1W7gIG/i/Xxf1/R6RGZvnRJte9/MQHRmC7eY=;
 b=SvXuHa9ZDqQBRP5pmF1pNKfnh9uNBy5kYkI42KkHRAhJuV/6XB640Tuc
 WpWUi6Qd1MiQ6rsTQSwsR1pkO1fNvd+Phg7AXHXx4EIRvumilS2BgQ4to
 GswarqvmtCKlEgi+Kj3c3ywaBqPPEB8YYYAFKwVOj3mgj9q5P7BiyilTb
 tUlfUSoa21n9XhKrMFA6Y067DW7i4x6guNy+wBGrdO1u2Z0QEzMmb5b3P
 JZP+sed9ZZbhAG8dagR9841+W7Pn2jnqKfxqloLnxTGSiGp1crZpOJOGA
 n6vT/45s9ig41X/cnkSoyD4C5IJagrP9ymvMpZlf+9g9nNEZ1e53OrzPS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="349967391"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="349967391"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 07:03:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="701866340"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="701866340"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 07:03:46 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: Doc the unit of ttm_resource_manager.usage
Date: Tue,  9 May 2023 16:03:41 +0200
Message-Id: <20230509140341.10839-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document the unit of ttm_resource_manager.usage which was
missing before.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 include/drm/ttm/ttm_resource.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index 78a226eba953..32d6b9c91c40 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -145,6 +145,7 @@ struct ttm_resource_manager_func {
  * @move_lock: lock for move fence
  * @move: The fence of the last pipelined move operation.
  * @lru: The lru list for this memory type.
+ * @usage: How much of the resources are used, in bytes.
  *
  * This structure is used to identify and manage memory types for a device.
  */
@@ -170,8 +171,7 @@ struct ttm_resource_manager {
 	struct list_head lru[TTM_MAX_BO_PRIORITY];
 
 	/**
-	 * @usage: How much of the resources are used, protected by the
-	 * bdev->lru_lock.
+	 * Protected by the bdev->lru_lock.
 	 */
 	uint64_t usage;
 };
-- 
2.39.0

