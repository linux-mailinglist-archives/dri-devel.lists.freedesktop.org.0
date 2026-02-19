Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4G7oHZ93l2nVywIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 21:50:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8948162745
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 21:50:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9BA210E74D;
	Thu, 19 Feb 2026 20:50:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R6zB8ijl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7379510E332;
 Thu, 19 Feb 2026 20:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771534234; x=1803070234;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3HAtS4OL4OwsgIfFhlW/s5kThNhN/PLfoPtumyP/520=;
 b=R6zB8ijl35l6W/lkP52BPyPfgPeOBB4bV9Ec0CUX5OI9haOXAaEjGeqf
 cq22h0n0bcvDBW4IF7wWsqUms7QcMRsfo4pWtkdCSIPRHxtzafoDFHXgd
 EosVi27Kli0kNBZXMaoYjF5AMfplRvruiv2vu1vG2Sm37R5zr4essOZF+
 TFelHiNvuejyk5moIXeEZaa6IZRSQwJbZmzpqfrqEb7EUq2liD62Y0kFN
 5F8sr/Lv7e57kwxwzCu56zwKDPMsvYyFKVK9nhqQ06U3X0qPwwvkefVaC
 2k20kiegW/k+54oiUuDHeeHt5WNKDD/3lx46wloeaOLXT8Ygx/D2k4P5w A==;
X-CSE-ConnectionGUID: U5uDyVeHSjitz6ILgAUVbg==
X-CSE-MsgGUID: Gacvn1cjQUC694m5khxqog==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="83255805"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="83255805"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 12:50:34 -0800
X-CSE-ConnectionGUID: KaJ++UEbT+yseLHsrDb7Ig==
X-CSE-MsgGUID: 9m5K/RJhQTef1dajPzudzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="218796489"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 12:50:34 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: matthew.auld@intel.com
Subject: [PATCH] drm/gpusvm: Fix drm_gpusvm_pages_valid_unlocked() kernel-doc
Date: Thu, 19 Feb 2026 12:50:29 -0800
Message-Id: <20260219205029.1011336-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: C8948162745
X-Rspamd-Action: no action

The kernel-doc for drm_gpusvm_pages_valid_unlocked() was stale and still
referenced old range-based arguments and naming. Update the documentation
to match the current function arguments and signature.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 81626b00b755..2e229bc944f0 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -1338,14 +1338,14 @@ bool drm_gpusvm_range_pages_valid(struct drm_gpusvm *gpusvm,
 EXPORT_SYMBOL_GPL(drm_gpusvm_range_pages_valid);
 
 /**
- * drm_gpusvm_range_pages_valid_unlocked() - GPU SVM range pages valid unlocked
+ * drm_gpusvm_pages_valid_unlocked() - GPU SVM pages valid unlocked
  * @gpusvm: Pointer to the GPU SVM structure
- * @range: Pointer to the GPU SVM range structure
+ * @svm_pages: Pointer to the GPU SVM pages structure
  *
- * This function determines if a GPU SVM range pages are valid. Expected be
- * called without holding gpusvm->notifier_lock.
+ * This function determines if a GPU SVM pages are valid. Expected be called
+ * without holding gpusvm->notifier_lock.
  *
- * Return: True if GPU SVM range has valid pages, False otherwise
+ * Return: True if GPU SVM pages are valid, False otherwise
  */
 static bool drm_gpusvm_pages_valid_unlocked(struct drm_gpusvm *gpusvm,
 					    struct drm_gpusvm_pages *svm_pages)
-- 
2.34.1

