Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7928A907EDB
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 00:29:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC0FF10EBDE;
	Thu, 13 Jun 2024 22:29:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZKMUhRVX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 251A010EBDD;
 Thu, 13 Jun 2024 22:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718317769; x=1749853769;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gV5t4h6DdTVeFRJm1DHjRxcbA8d05SKdD/yDybc/8Kc=;
 b=ZKMUhRVX6JjcZw5GmI/QlEOpHAAVzmWO6u4vZWN5pYNdgD571B3ybuWY
 J2k1U/33bMHEkqimXjSMoymTQVWsRaxbGaapmfuyU9akMJhd4HavJzbr2
 KBzHAtw6Lh5NI2qnakdExzm4JWz2+WxBq01xBq5tDZwv0IrYYs8Vfbiat
 +He6dLcXiEV6WOs+gg2H2DJ9xCBPrRtrsGUp1N+oelMoVGG+JvdTas5d0
 i2FhKvrb/Qzd+fUapfxnfhSFQ7c1P3JaUdLS8UxDQgKcyFMrj4Q9nMx+9
 74MDNgwjDjTf7OkNrIwzjX2MYza/s4JRPy6WlRueVCAFzdoOQV30GBM09 A==;
X-CSE-ConnectionGUID: lxNHFZbRTpyTpUI/d5g5xg==
X-CSE-MsgGUID: yntK5vveTuShCRHUobYi7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="18107479"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="18107479"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 15:29:24 -0700
X-CSE-ConnectionGUID: vzvGRmhcRsGljlvavM9S8g==
X-CSE-MsgGUID: CmqylpEJSMi3GfzvR07DQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="77764390"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.176])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 15:28:59 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH] drm/i915/gt/uc: Fix typo in comment
Date: Fri, 14 Jun 2024 00:28:37 +0200
Message-ID: <20240613222837.552277-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.1
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

Replace "dynmically" with "dynamically".

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
index 14797e80bc92..263c9c3f6a03 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
@@ -295,7 +295,7 @@ struct guc_update_scheduling_policy_header {
 } __packed;
 
 /*
- * Can't dynmically allocate memory for the scheduling policy KLV because
+ * Can't dynamically allocate memory for the scheduling policy KLV because
  * it will be sent from within the reset path. Need a fixed size lump on
  * the stack instead :(.
  *
-- 
2.45.1

