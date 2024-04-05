Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6E089960A
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 08:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7989910F2D2;
	Fri,  5 Apr 2024 06:58:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UsH/gmfw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FDE810E258;
 Fri,  5 Apr 2024 06:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712300298; x=1743836298;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5raj5C+ysIqUQ5UhYYvhR/JwBtOXhu9ThhurMWUw26k=;
 b=UsH/gmfwTLjoUsEwPFSWi4o9FHVEEXx9T7KFYxRgKmEa8dFMRPnc42rt
 wg1u6Ha+6O3XfCrxC97jYqnTBs64+xyvvDIuYZTCQjPcSXqH9vuJzMBLD
 rZQ3+mJP6PM2fc0urZD2hjpCzuS8M0QzqFV6D4RSP3IeYC/c0syMSMHn8
 H0fmF1vvRpi1Lxf/4OqnS2HqwxZzzKqv6SejDfktv14opZTr2ACp1iugL
 nuqycCXLR/RsNRjOKX25lFFse7tvZ3aLJ8LTlOpBsTMaoIbkS0j0biGv4
 kdyvTHIRDZsRg1aGYZnoXElBW+RFGbYBEV8Xlo6KgmyFM1+224wIzjFsu g==;
X-CSE-ConnectionGUID: PIxt4YMHSYi1KDDXNm6ZFg==
X-CSE-MsgGUID: IUfBavRlTGOSnZTBaSOYJg==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="8198822"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="8198822"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 23:58:18 -0700
X-CSE-ConnectionGUID: NVycHH/BTt2T7dfejkl8Bw==
X-CSE-MsgGUID: ZBCpg4tfSU6uK3teRBxF7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="19018215"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa009.jf.intel.com with ESMTP; 04 Apr 2024 23:58:16 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	jani.nikula@intel.com,
	sfr@canb.auug.org.au
Subject: [PATCH] drm/dp: correct struct member name in documentation
Date: Fri,  5 Apr 2024 12:21:59 +0530
Message-Id: <20240405065159.439145-1-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.25.1
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

Correct struct member name to 'mode' instead of 'operation mode'
in 'drm_dp_as_sdp' structure description.

Fixes: 0bbb8f594e33 ("drm/dp: Add Adaptive Sync SDP logging")
Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 include/drm/display/drm_dp_helper.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index baf9949ff96f..6799f57d635c 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -112,7 +112,7 @@ struct drm_dp_vsc_sdp {
  * @target_rr: Target Refresh
  * @duration_incr_ms: Successive frame duration increase
  * @duration_decr_ms: Successive frame duration decrease
- * @operation_mode: Adaptive Sync Operation Mode
+ * @mode: Adaptive Sync Operation Mode
  */
 struct drm_dp_as_sdp {
 	unsigned char sdp_type;
-- 
2.25.1

