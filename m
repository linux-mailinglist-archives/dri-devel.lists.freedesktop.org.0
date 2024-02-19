Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 199AC85A494
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 14:25:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F20A10E093;
	Mon, 19 Feb 2024 13:25:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g3vgAefN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A170A10E376;
 Mon, 19 Feb 2024 13:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708349123; x=1739885123;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Kw/teR31itmMUP6Dyx+2Ja1T/q4iXnjamlVE9obsNFs=;
 b=g3vgAefNf1+DaVI5Ie+eFwDBNRJQMpLnQGDE9zAC7zeFT7pbDGKDovZu
 A1TJVC/Ii2EMgZ650Z45Y5TnirjRXQR1xtVw2oHbI+fN1JLluf8paFbk8
 ieJWFdqgWG1Jp5nQfAgHBIB0OxgJoshaLShGf2VHk4eRdYAT7HofRTJgQ
 xT0MHAMG91OyCPARcyRp8Lttqm/zbTND82Gom5+eQ/kl4oYWuSOmuzsOs
 S2RRhzGggbiscEih+hl94QYzA3wbUKEYDkDfzO58tebsb+72/ZS0Xm0S/
 W1N2lypjdmYBt4FrlI4UrNM9zUo/I/UWixk38dY5zyWrmaxJKv+hX0WI0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="2551237"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="2551237"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 05:25:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; d="scan'208";a="35517582"
Received: from coldacre-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.215.68])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 05:25:21 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Jose Souza <jose.souza@intel.com>
Subject: [PATCH] drm/i915: Add some boring kerneldoc
Date: Mon, 19 Feb 2024 13:25:17 +0000
Message-Id: <20240219132517.1868604-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.40.1
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

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Tooling appears very strict so lets pacify it by adding some comments,
even if fields are completely self-explanatory.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Fixes: b11236486749 ("drm/i915: Add GuC submission interface version query")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jose Souza <jose.souza@intel.com>
---
 include/uapi/drm/i915_drm.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index bd87386a8243..2ee338860b7e 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -3572,9 +3572,13 @@ struct drm_i915_query_memory_regions {
  * struct drm_i915_query_guc_submission_version - query GuC submission interface version
  */
 struct drm_i915_query_guc_submission_version {
+	/** @branch: Firmware branch version. */
 	__u32 branch;
+	/** @major: Firmware major version. */
 	__u32 major;
+	/** @minor: Firmware minor version. */
 	__u32 minor;
+	/** @patch: Firmware patch version. */
 	__u32 patch;
 };
 
-- 
2.40.1

