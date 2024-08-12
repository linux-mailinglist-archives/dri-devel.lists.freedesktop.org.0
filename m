Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0E494EF85
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 16:29:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0751C10E23C;
	Mon, 12 Aug 2024 14:29:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d9eSkzLc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF67510E23C;
 Mon, 12 Aug 2024 14:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723472943; x=1755008943;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y728XvXikp30baUm01d5yHTX2jl0xR3CZrTyitzfg5w=;
 b=d9eSkzLcDug5EJXJDzhl/Px4Mafn1fJa/vIDCuVmkb1T8CDv7CPFBMeH
 QIWADHWtPwuSIudc9KL9PL2PkuXN8mmB+oCJn7jpnZnPLAjWDYRVolkU+
 miFxvQp4NVsDW6Me/nowKbNGI/PbAbJlgH3jgGU2JStcdaOtDmPDA/9Hm
 fEFmiXvqwo04VQgqqC1e00J5Pmd9yt4wygzP0vS9I+mcRDEZSrNsgCvXT
 +itYnEdeUZAve/tsgfJDfZuN0/HalY08JAffL6G4Kz9VC4TsxJ+z3+xux
 6OdUFsJe2B4jZNbtlUWln43cVEaqNGOFkxRs4QoM0UuaqAKvlHd3NgDYs g==;
X-CSE-ConnectionGUID: 1LecVzQ+RDiMFWkdFYyReA==
X-CSE-MsgGUID: kC9cVArzR0ywKCClD3/X/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="32737607"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; d="scan'208";a="32737607"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 07:29:03 -0700
X-CSE-ConnectionGUID: OlHsWXMaQnWsK6SnUMfXiQ==
X-CSE-MsgGUID: 5oEe5puyTK+02iyHRRmptw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; d="scan'208";a="81521727"
Received: from iklimasz-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.117])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 07:28:59 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 Zhi Wang <zhiwang@kernel.rog>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>, intel-gvt-dev@lists.freedesktop.org
Subject: [RESEND 2/2] drm/edid: make drm_edid_block_valid() static
Date: Mon, 12 Aug 2024 17:28:49 +0300
Message-Id: <20240812142849.1588006-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240812142849.1588006-1-jani.nikula@intel.com>
References: <20240812142849.1588006-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

drm_edid_block_valid() is no longer used outside of drm_edid.c. Make it
static.

Acked-by: Zhi Wang <zhiwang@kernel.rog>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Zhi Wang <zhi.wang.linux@gmail.com>
Cc: intel-gvt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/drm_edid.c | 17 ++++-------------
 include/drm/drm_edid.h     |  2 --
 2 files changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index f68a41eeb1fa..13b3fd351b16 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1966,22 +1966,14 @@ static void edid_block_dump(const char *level, const void *block, int block_num)
 		       block, EDID_LENGTH, false);
 }
 
-/**
- * drm_edid_block_valid - Sanity check the EDID block (base or extension)
- * @_block: pointer to raw EDID block
- * @block_num: type of block to validate (0 for base, extension otherwise)
- * @print_bad_edid: if true, dump bad EDID blocks to the console
- * @edid_corrupt: if true, the header or checksum is invalid
- *
+/*
  * Validate a base or extension EDID block and optionally dump bad blocks to
  * the console.
- *
- * Return: True if the block is valid, false otherwise.
  */
-bool drm_edid_block_valid(u8 *_block, int block_num, bool print_bad_edid,
-			  bool *edid_corrupt)
+static bool drm_edid_block_valid(void *_block, int block_num, bool print_bad_edid,
+				 bool *edid_corrupt)
 {
-	struct edid *block = (struct edid *)_block;
+	struct edid *block = _block;
 	enum edid_block_status status;
 	bool is_base_block = block_num == 0;
 	bool valid;
@@ -2024,7 +2016,6 @@ bool drm_edid_block_valid(u8 *_block, int block_num, bool print_bad_edid,
 
 	return valid;
 }
-EXPORT_SYMBOL(drm_edid_block_valid);
 
 /**
  * drm_edid_is_valid - sanity check EDID data
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 6bdfa254a1c1..eaac5e665892 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -440,8 +440,6 @@ int drm_add_modes_noedid(struct drm_connector *connector,
 			 int hdisplay, int vdisplay);
 
 int drm_edid_header_is_valid(const void *edid);
-bool drm_edid_block_valid(u8 *raw_edid, int block, bool print_bad_edid,
-			  bool *edid_corrupt);
 bool drm_edid_is_valid(struct edid *edid);
 void drm_edid_get_monitor_name(const struct edid *edid, char *name,
 			       int buflen);
-- 
2.39.2

