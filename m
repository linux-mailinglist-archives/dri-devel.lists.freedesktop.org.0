Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 026FCB2C693
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 16:08:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 465A010E60B;
	Tue, 19 Aug 2025 14:08:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lTCMzdne";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F7B010E60B;
 Tue, 19 Aug 2025 14:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755612529; x=1787148529;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Bc1SA/oYsgvelkzMH8+BIwKboBv8KOSM1l84+IQ+0CA=;
 b=lTCMzdne7cp4+/6o+7iGiBFDwHcNjEC5EZu4LYH+riIWK05eWzr9JFlE
 8EDPejoHsMRjWTXoiPJWKGMvsukkaDKMadISUaGBRnXlMfQiMROqYDH5p
 ob4zZYJ+2gYl2Pu9bOPFhjKEKqh/UZ+VyZ56WbKrXgGdym/FRhc6Yqb1+
 mZ0Ny73ei7/8UKc8wxPAGZtQY0T0R3ScWZTc7u12LgGfellXCHThw9rv2
 pY70V5fBFTXGjGTW0rsZZvIH+lzWkMHgjMiXzeQTkvfelcS/09Jt0sP6u
 08bOSTTsulJLrmU9lJWnGa8k1zeKUXky4hmWU4NRKOVc/L2yExPN1WZB9 w==;
X-CSE-ConnectionGUID: ZdPmIWpURs2YZ9yLx8/Mxw==
X-CSE-MsgGUID: BbiyTOeLTcOpuHgQ2Ao9EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="61489624"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="61489624"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 07:08:48 -0700
X-CSE-ConnectionGUID: sqB2Y3BfQy+47I4BzwoAhg==
X-CSE-MsgGUID: KozMDovDQRauPW6SWvzdkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="167361184"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.127])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 07:08:47 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/gpusvm: some kernel-doc fixes
Date: Tue, 19 Aug 2025 15:08:37 +0100
Message-ID: <20250819140836.121366-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
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

This should be enough to get scripts/kernel-doc passing for
drm_gpusvm.[ch], so we can then add them to our CI build infra.

Link: https://gitlab.freedesktop.org/drm/xe/ci/-/merge_requests/86
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 661306da6b2d..27eadbcef7b4 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -345,7 +345,7 @@ notifier_iter_first(struct rb_root_cached *root, unsigned long start,
 /**
  * drm_gpusvm_for_each_notifier() - Iterate over GPU SVM notifiers in a gpusvm
  * @notifier__: Iterator variable for the notifiers
- * @notifier__: Pointer to the GPU SVM notifier
+ * @gpusvm__: Pointer to the GPU SVM structure
  * @start__: Start address of the notifier
  * @end__: End address of the notifier
  *
@@ -360,7 +360,7 @@ notifier_iter_first(struct rb_root_cached *root, unsigned long start,
  * drm_gpusvm_for_each_notifier_safe() - Safely iterate over GPU SVM notifiers in a gpusvm
  * @notifier__: Iterator variable for the notifiers
  * @next__: Iterator variable for the notifiers temporay storage
- * @notifier__: Pointer to the GPU SVM notifier
+ * @gpusvm__: Pointer to the GPU SVM structure
  * @start__: Start address of the notifier
  * @end__: End address of the notifier
  *
-- 
2.50.1

