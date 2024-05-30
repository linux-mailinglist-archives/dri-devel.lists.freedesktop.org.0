Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D562F8D4BD0
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 14:44:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7725210EA92;
	Thu, 30 May 2024 12:44:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aBI+s05e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4BA310E150;
 Thu, 30 May 2024 12:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717073048; x=1748609048;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oSFrcw/blbAxtAY66PjEngPK56PHbtDHEmLHakanA10=;
 b=aBI+s05exvC8hZHIYydpxQZn/Fv2M6Txg24XShR1Php2I2PmeG2QaV+u
 y9VWJxe5aEJDkPBmgFNeP9fS7wS3P3Ym9WvsiYIR72t3C+j+OaPTF2Syw
 /sK451BXJDajmUTaB/PwWzCjDDRSs4a5na4K68dgs/DCrAqK4VU944Gh3
 PQty5iFnmc5LKugmfMvuJQkrSvWsLuPwb5XwaU7jo5Sb07wTu31vMwjIo
 jvVyy+qX4HQ2zTS/n9zbxdsmX3Avs+oaaI8uFl/+rignlrjwBViSkTx8U
 YVDKx2QQltdsT+tu3DjHGU0YlKjDy8Z9jlQ+BzPzuzar3GdxgBBTWVHnW A==;
X-CSE-ConnectionGUID: ALAC0oMPSQO+Iw8ZojgHHg==
X-CSE-MsgGUID: CNOvrOxWTiqCf7hZg+6Hwg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13424997"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="13424997"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 05:44:05 -0700
X-CSE-ConnectionGUID: grihFRu+Siit+8M7aK4B+g==
X-CSE-MsgGUID: TbgCTbWtQ8ucEt0Gj+aCiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="36379772"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 05:44:02 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>, intel-gvt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/edid: make drm_edid_block_valid() static
Date: Thu, 30 May 2024 15:43:52 +0300
Message-Id: <20240530124352.362736-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240530124352.362736-1-jani.nikula@intel.com>
References: <20240530124352.362736-1-jani.nikula@intel.com>
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

