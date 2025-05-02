Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0C0AA72C1
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 15:01:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E43F210E90E;
	Fri,  2 May 2025 13:01:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OJV/jHrz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4DDE10E90A;
 Fri,  2 May 2025 13:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746190875; x=1777726875;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aIRzyrVWbTYPlq5n5kILI+Nc8u93LdHob60GJg5WrYA=;
 b=OJV/jHrzjujfFiD5ZMUtnyj4tykY8QCLQ9sGZoJ3G0xHrUepogDyb5b5
 fngilsMvPcnCo9leMkCBIFf81xXfqqfb1KDrCZoKptvnooV9EoNNOPauB
 StPsPGKBeUpN/g+R34kVa73RCZp0hwPVatWYxe8hMp10c1j0N6tiMcyF+
 Ec7eDEy+EtclJeEkF3xQzPdCDV/mIZiGw9YryXAX/v62pVKaS+BWGI058
 lYkmI+f9Qcm/4XiK10qi1tPRXg17DQhF3xDYN8l9nRbsUkNCtocQVc1mS
 eSZ/iLWB7iDgSvdLDQOwsVFJUc6gKvlHFiR3Lped5IF8KwfV5IOw+uPqz g==;
X-CSE-ConnectionGUID: 6Tpe9lkbQ1yvkN1ollW1Fg==
X-CSE-MsgGUID: HAIP/emXQU+ZfIvgCrjZHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="58861407"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; d="scan'208";a="58861407"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 06:01:15 -0700
X-CSE-ConnectionGUID: 03dQIiBRTTqfWggM10dX8A==
X-CSE-MsgGUID: 35mwxMUeSVS5hnNu8tzf+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; d="scan'208";a="139776208"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.151])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 06:01:12 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: Fix ttm_backup kerneldoc
Date: Fri,  2 May 2025 15:01:01 +0200
Message-ID: <20250502130101.3185-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The docs were not properly updated from an earlier version of the code.

Fixes: e7b5d23e5d47 ("drm/ttm: Provide a shmem backup implementation")
Cc: Christian König <christian.koenig@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_backup.c | 2 +-
 include/drm/ttm/ttm_backup.h     | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_backup.c b/drivers/gpu/drm/ttm/ttm_backup.c
index 9b3b5624c3eb..9e2d72c447ee 100644
--- a/drivers/gpu/drm/ttm/ttm_backup.c
+++ b/drivers/gpu/drm/ttm/ttm_backup.c
@@ -41,7 +41,7 @@ void ttm_backup_drop(struct file *backup, pgoff_t handle)
  * @backup: The struct backup pointer used to back up the page.
  * @dst: The struct page to copy into.
  * @handle: The handle returned when the page was backed up.
- * @intr: Try to perform waits interruptable or at least killable.
+ * @intr: Try to perform waits interruptible or at least killable.
  *
  * Return: 0 on success, Negative error code on failure, notably
  * -EINTR if @intr was set to true and a signal is pending.
diff --git a/include/drm/ttm/ttm_backup.h b/include/drm/ttm/ttm_backup.h
index 4da7c825088f..c33cba111171 100644
--- a/include/drm/ttm/ttm_backup.h
+++ b/include/drm/ttm/ttm_backup.h
@@ -14,7 +14,7 @@
  * @handle: The handle to convert.
  *
  * Converts an opaque handle received from the
- * struct ttm_backoup_ops::backup_page() function to an (invalid)
+ * ttm_backup_backup_page() function to an (invalid)
  * struct page pointer suitable for a struct page array.
  *
  * Return: An (invalid) struct page pointer.
@@ -43,8 +43,8 @@ static inline bool ttm_backup_page_ptr_is_handle(const struct page *page)
  *
  * Return: The handle that was previously used in
  * ttm_backup_handle_to_page_ptr() to obtain a struct page pointer, suitable
- * for use as argument in the struct ttm_backup_ops drop() or
- * copy_backed_up_page() functions.
+ * for use as argument in the struct ttm_backup_drop() or
+ * ttm_backup_copy_page() functions.
  */
 static inline unsigned long
 ttm_backup_page_ptr_to_handle(const struct page *page)
-- 
2.49.0

