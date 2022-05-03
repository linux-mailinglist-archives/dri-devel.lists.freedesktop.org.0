Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DF151992C
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 10:04:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37CCB10F3CD;
	Wed,  4 May 2022 08:04:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA4D10F369
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 08:04:06 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="330683509"
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="330683509"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 01:04:06 -0700
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="599432560"
Received: from adobrowo-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.156.70])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 01:04:05 -0700
Resent-Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7,
 02160 Espoo
Resent-To: dri-devel@lists.freedesktop.org
Resent-From: Jani Nikula <jani.nikula@intel.com>
Resent-Date: Wed, 04 May 2022 11:04:02 +0300
Resent-Message-ID: <877d71ohal.fsf@intel.com>
X-Original-To: jani.nikula@linux.intel.com
Received: from linux.intel.com [10.54.29.200]
 by jnikula-mobl4.ger.corp.intel.com with IMAP (fetchmail-6.4.23)
 for <jani@localhost> (single-drop); Tue, 03 May 2022 12:25:38 +0300 (EEST)
Received: from fmsmga005.fm.intel.com (fmsmga005.fm.intel.com [10.253.24.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 2BC19580B9A;
 Tue,  3 May 2022 02:25:31 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="888355072"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="888355072"
Received: from orsmga103.jf.intel.com ([10.7.208.35])
 by fmsmga005-1.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03
 May 2022 02:25:29 -0700
IronPort-SDR: HE480X8i0yZDE7kTahqsxQaTKQJfL2P5Oc8dF6a9HqWtC+W1y6nYeTy31Pe2L7Zz/hWK2obq9T
 0nLNC7jDpbaw==
X-IPAS-Result: =?us-ascii?q?A0FAAQAj9HBimLHS/INaHgEBCxIMQIFEC4I9AYE8J1WEE?=
 =?us-ascii?q?j2JAIVmgj6cTIFAMRYBAQEBAQEBAQEJLBMBAgQBAQMEijQCJTQJDQEBAgQBA?=
 =?us-ascii?q?QEBAwIBAgEBAQEBAQMBAQECAgEBAQIBAQYCAQEBAQIQAQEBAQEBAQEJCwkHB?=
 =?us-ascii?q?gwFEA4FIoUvOQ2CNQUCAxgObkoJNQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEQAg1SRwEfAQIDAQEBCRcPAQ0BAQQKKQECAwECBgEBCBwCHgQEAgIDAVMZB?=
 =?us-ascii?q?YJ4gxgFkhabF3qBMYEBgggBAQaCXYMsgVwJgRAsiUOEIHonEIFVRHpOgzWBU?=
 =?us-ascii?q?4M/gwmCZZUXIIEOCIEpgVmSMZAZnXk0B4NOgTsGDJ41M6hVHZZEolGET4FhP?=
 =?us-ascii?q?IFaMxojgzlRGQ+OIAkDFhWDO4phcgI5AgYBCgEBAwmFRwEBhGGBbgEB?=
IronPort-PHdr: A9a23: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
 BAP276tdewu
IronPort-Data: A9a23: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
 lvtSg+/
IronPort-HdrOrdr: A9a23:6Ou+LK6imtjS2SOxzgPXwFXXdLJyesId70hD6qm+c20cTiX+rb
 HQoB17726ItN91Yh4dcL+7Sc69qBnnmKKd37NhdotKMDOW3VdAabsSlbcLLVXbalnDHsA079
 YXT0FVMqyDMbBC5fyKlzVR+b4bsZC6GdmT9JLjJhRWPHtXgt9bnmFE49agYzFLrVJ9dOkE/f
 Onj6Ity1rQG0j/LP7LfUXtcNKz7eEj/6iWHyLuaSRXjDVnTFuTmc/H+h6jsHZuMA+nuY1SiF
 QsHGTCl9WeWpyAoCPh6w==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="267313432"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="267313432"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from gabe.freedesktop.org ([131.252.210.177])
 by mtab.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2022
 02:25:28 -0700
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0666510F828;
 Tue,  3 May 2022 09:25:28 +0000 (UTC)
X-Original-To: intel-gfx@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C30D10F828
 for <intel-gfx@lists.freedesktop.org>; Tue,  3 May 2022 09:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651569926; x=1683105926;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=51/5DyNo1x7cu2mFU+Tyx78aoW6oV0UNNFYjxVMBsEw=;
 b=FHJWG5MtJPzTGpPedTnSlIjosAD3hCIDEKaQ+Jd/WNSUy2ydDvuyjHkB
 5MIsz2GDzBwJvzzT9TOcPDxbCT1gIC6qNMwc6pXHG+jT0vQvsbuhysxLT
 WOwX2RCLfQM3+Ak03xgs+ODPWEtdAvKqQ9/nnFASw6P3jIZkQzN7FxtRW
 VHJ/yOultrHI21Em8JLN9qavTw9Pf4q2gthr1Ulfdi3SSMbGQez3r67NV
 1nzIWviYwYiK56FKGcvgfSRwYQh9Ll0WpfUHqNPkO/JQdmvzzh3GK2/lA
 u32canlvF27VjYVJ2xbi1c7CPsUauG5yG49V2MuZ5d3q+CYThzbws0foV A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="247343744"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="247343744"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 02:25:25 -0700
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="620278427"
Received: from jasinski-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.133.126])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 02:25:24 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  3 May 2022 12:24:00 +0300
Message-Id: <a5b35ed0e711bd874f76ae87ee0b70150d0a77c4.1651569697.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1651569697.git.jani.nikula@intel.com>
References: <cover.1651569697.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 15/20] drm/edid: sunset the old unused cea
 data block iterators
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
X-BeenThere: dri-devel@lists.freedesktop.org
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: jani.nikula@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All CTA data block iteration has now been converted to the new cea db
iterators.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 45 --------------------------------------
 1 file changed, 45 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 77986895e501..208b1efb490d 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4349,48 +4349,6 @@ cea_revision(const u8 *cea)
 	return cea[1];
 }
 
-static int
-cea_db_offsets(const u8 *cea, int *start, int *end)
-{
-	/* DisplayID CTA extension blocks and top-level CEA EDID
-	 * block header definitions differ in the following bytes:
-	 *   1) Byte 2 of the header specifies length differently,
-	 *   2) Byte 3 is only present in the CEA top level block.
-	 *
-	 * The different definitions for byte 2 follow.
-	 *
-	 * DisplayID CTA extension block defines byte 2 as:
-	 *   Number of payload bytes
-	 *
-	 * CEA EDID block defines byte 2 as:
-	 *   Byte number (decimal) within this block where the 18-byte
-	 *   DTDs begin. If no non-DTD data is present in this extension
-	 *   block, the value should be set to 04h (the byte after next).
-	 *   If set to 00h, there are no DTDs present in this block and
-	 *   no non-DTD data.
-	 */
-	if (cea[0] == DATA_BLOCK_CTA) {
-		/*
-		 * for_each_displayid_db() has already verified
-		 * that these stay within expected bounds.
-		 */
-		*start = 3;
-		*end = *start + cea[2];
-	} else if (cea[0] == CEA_EXT) {
-		/* Data block offset in CEA extension block */
-		*start = 4;
-		*end = cea[2];
-		if (*end == 0)
-			*end = 127;
-		if (*end < 4 || *end > 127)
-			return -ERANGE;
-	} else {
-		return -EOPNOTSUPP;
-	}
-
-	return 0;
-}
-
 /*
  * CTA Data Block iterator.
  *
@@ -4643,9 +4601,6 @@ static bool cea_db_is_hdmi_hdr_metadata_block(const void *db)
 		cea_db_payload_len(db) >= 3;
 }
 
-#define for_each_cea_db(cea, i, start, end) \
-	for ((i) = (start); (i) < (end) && (i) + cea_db_payload_len(&(cea)[(i)]) < (end); (i) += cea_db_payload_len(&(cea)[(i)]) + 1)
-
 static void drm_parse_y420cmdb_bitmap(struct drm_connector *connector,
 				      const u8 *db)
 {
-- 
2.30.2

