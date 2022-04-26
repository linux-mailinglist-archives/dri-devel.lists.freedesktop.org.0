Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF93550F70B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 11:19:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB6510E2CA;
	Tue, 26 Apr 2022 09:19:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF5B10E59C;
 Tue, 26 Apr 2022 09:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650964762; x=1682500762;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EN3AsHMC2At+4BjGe1eJcaWnGbBgpXtKkIPBb14HGlY=;
 b=ZHOJ1ertNj9N4wXx8RUj48af9S5IQjQILeYom7q8HeqW0wA+ucoBIPcH
 3eeg/Yzl5hMLotFlJBvhQceu/63hPscemF8xHO7h5NVotQhA40eCT/4oM
 NFZi5KlfWboeKrOkbGQjiuFI+prRN9l9w/8CkvY8/i2KwQoCpNVwJVGtX
 UF8RHE7p6fJ4uxAgcRsNu3+E4uVW+oehJ+Vj0/jwCpdEStAGJDbMKMJme
 EZQ2vpzU8raAY+PaR/sLCfvqVGLA65pPoi1gj3zXXrToylA6b3vig2Zrr
 K8/STpUTqZJXN/dk6g3L1c7qJhd+agwlDa8MweY51tUJgT5nspajmmeXq Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="290654534"
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; d="scan'208";a="290654534"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 02:19:21 -0700
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; d="scan'208";a="579787845"
Received: from vhlushch-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.132.136])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 02:19:19 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/edid: fix kernel-doc parameter name mismatches
Date: Tue, 26 Apr 2022 12:19:12 +0300
Message-Id: <20220426091913.1339941-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
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
Cc: jani.nikula@intel.com, Stephen Rothwell <sfr@canb.auug.org.au>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the below drm/edid kernel-doc warnings:

drivers/gpu/drm/drm_edid.c:1589: warning: Function parameter or member '_edid' not described in 'drm_edid_header_is_valid'
drivers/gpu/drm/drm_edid.c:1589: warning: Excess function parameter 'raw_edid' description in 'drm_edid_header_is_valid'
drivers/gpu/drm/drm_edid.c:1737: warning: Function parameter or member '_block' not described in 'drm_edid_block_valid'
drivers/gpu/drm/drm_edid.c:1737: warning: Excess function parameter 'raw_edid' description in 'drm_edid_block_valid'
drivers/gpu/drm/drm_edid.c:2136: warning: Function parameter or member 'read_block' not described in 'drm_do_get_edid'
drivers/gpu/drm/drm_edid.c:2136: warning: Function parameter or member 'context' not described in 'drm_do_get_edid'
drivers/gpu/drm/drm_edid.c:2136: warning: Excess function parameter 'get_edid_block' description in 'drm_do_get_edid'
drivers/gpu/drm/drm_edid.c:2136: warning: Excess function parameter 'data' description in 'drm_do_get_edid'

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
References: https://lore.kernel.org/r/20220406154431.567414c3@canb.auug.org.au
References: https://lore.kernel.org/r/20220420162431.2b28ddea@canb.auug.org.au
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 7a8482b75071..6446f5d3944b 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1610,7 +1610,7 @@ static void edid_header_fix(void *edid)
 
 /**
  * drm_edid_header_is_valid - sanity check the header of the base EDID block
- * @raw_edid: pointer to raw base EDID block
+ * @_edid: pointer to raw base EDID block
  *
  * Sanity check the header of the base EDID block.
  *
@@ -1827,7 +1827,7 @@ static void edid_block_dump(const char *level, const void *block, int block_num)
 
 /**
  * drm_edid_block_valid - Sanity check the EDID block (base or extension)
- * @raw_edid: pointer to raw EDID block
+ * @_block: pointer to raw EDID block
  * @block_num: type of block to validate (0 for base, extension otherwise)
  * @print_bad_edid: if true, dump bad EDID blocks to the console
  * @edid_corrupt: if true, the header or checksum is invalid
@@ -2112,8 +2112,8 @@ static enum edid_block_status edid_block_read(void *block, unsigned int block_nu
 /**
  * drm_do_get_edid - get EDID data using a custom EDID block read function
  * @connector: connector we're probing
- * @get_edid_block: EDID block read function
- * @data: private data passed to the block read function
+ * @read_block: EDID block read function
+ * @context: private data passed to the block read function
  *
  * When the I2C adapter connected to the DDC bus is hidden behind a device that
  * exposes a different interface to read EDID blocks this function can be used
-- 
2.30.2

