Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F04AD519923
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 10:03:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2FD710F2CC;
	Wed,  4 May 2022 08:03:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E168610F2CC
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 08:03:01 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="265283607"
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="265283607"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 01:03:01 -0700
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="620707044"
Received: from adobrowo-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.156.70])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 01:03:00 -0700
Resent-Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7,
 02160 Espoo
Resent-To: dri-devel@lists.freedesktop.org
Resent-From: Jani Nikula <jani.nikula@intel.com>
Resent-Date: Wed, 04 May 2022 11:02:57 +0300
Resent-Message-ID: <875ymlpvwu.fsf@intel.com>
X-Original-To: jani.nikula@linux.intel.com
Received: from linux.intel.com [10.54.29.200]
 by jnikula-mobl4.ger.corp.intel.com with IMAP (fetchmail-6.4.23)
 for <jani@localhost> (single-drop); Tue, 03 May 2022 12:25:02 +0300 (EEST)
Received: from orsmga004.jf.intel.com (orsmga004.jf.intel.com [10.7.209.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 55EE7580808;
 Tue,  3 May 2022 02:24:51 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="691750567"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="691750567"
Received: from orsmga106.jf.intel.com ([10.7.208.65])
 by orsmga004-1.jf.intel.com with ESMTP; 03 May 2022 02:24:51 -0700
IronPort-SDR: PmhTuAFXEdS46FqxLab23UiZjxPG72d3yYMg0UG8VPsY3OYQvs//NHHdgy2vWGQmR7DeNEFVSd
 qdMBQyDDOsIg==
X-IPAS-Result: =?us-ascii?q?A0FAAQCx83BimLHS/INagQmBT4I9AYE8J1WEEj2JAIVmg?=
 =?us-ascii?q?j6cTIFAMxQBAQEBAQEBAQEJLBMBAgQBAQMEijQCJTQJDgECBAEBAQEDAgECA?=
 =?us-ascii?q?QEBAQEBAwEBAQICAQEBAgEBBgIBAQEBAhABAQEBAQEBAQkLCQcGDAUQDgUih?=
 =?us-ascii?q?S85DYI1BQIDGA5uSgk1AQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBARACDVJHA?=
 =?us-ascii?q?R8BAgMBAQEJFwQLAQ0BAQQKKQECAwECBgEBCBwCHgQEAgIDAVMZBYJ4gxgFk?=
 =?us-ascii?q?habF3p/MoEBgggBAQaCXYMsgVwJgRAsiUOEIHonEIFVRHpOgzWBU4ZIgmWVN?=
 =?us-ascii?q?4EOgikXkns3j2KdeTQHg06BOwYMnjUzqFUtljSiUYRPgWE8gVozGiODOVEZD?=
 =?us-ascii?q?44sFoNQimFyAjkCBgEKAQEDCYVHAQGEYYFuAQE?=
IronPort-PHdr: A9a23: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
 FMzyrTiINFLXrA=
IronPort-Data: A9a23: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
IronPort-HdrOrdr: A9a23:4PL6qqE6lMRmPl1ppLqEdceALOsnbusQ8zAXPo5KOFRom6uj5r
 +TdZUgpGLJYVMqN03I9urwX5VoK0mwyXdK2/hbAV7PZniChILsFvAb0WMNqweQbxEX2IZmpN
 FdmoJFea/N5WETt7eM3OFTe+xQieVviZrY8Ns2rE0dNz2CFZsQiTuR2jzrbnGeHzM2dqbRfa
 D0jqEqx0vDRZ1UVLXBOpArZZmImzShruOZXfdpPW9C1OFO5QnYmYISFSL3v2Z8b9o2+8ZazY
 BL+zaJlplL3svQ9iPh
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="249415562"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="249415562"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from gabe.freedesktop.org ([131.252.210.177])
 by mtab.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2022
 02:24:49 -0700
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
 by gabe.freedesktop.org (Postfix) with ESMTP id 72B5310F815;
 Tue,  3 May 2022 09:24:49 +0000 (UTC)
X-Original-To: intel-gfx@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A27D310F815
 for <intel-gfx@lists.freedesktop.org>; Tue,  3 May 2022 09:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651569887; x=1683105887;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W9Stb1x21l6rIMaIxkCLG+Cdm7/ynHN1MCB/1yxWsMU=;
 b=YSgJJ4Cn2+wSSSIyWADVEZw5dmnyWEO1EDm1CDv+nWtL+4USu+st3/lU
 2HjTaqGZ1JUU9+zUFqytpnEB+uenw9qGvFikE7GLcjecf1/picaAtcrdq
 T8gKotk+XPfjQuhj4dCf9LU0yZ+Viq+21DSBYP63303Z3LHoeiTu9mYMD
 QEHL4yrHrwUCUishJifGD4gGTItWHqUzvPiDIjc6aVgmp6jwjKc4cBO6Y
 N3v6u+rv5lJUn6aQXrxl4cj9IuFlV5/hDjar5Tj9b16+R5B/L6Pnp3DO5
 VHL9lS61dqUCMrg0IaJUl38nSqQ0Dxo8WRT706LQQN6b3BdMMDxW22Udy g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="327978526"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="327978526"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 02:24:47 -0700
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="547306385"
Received: from jasinski-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.133.126])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 02:24:45 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  3 May 2022 12:23:52 +0300
Message-Id: <b6bb813afc35c763e744c6cdb4a787da3adf910b.1651569697.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1651569697.git.jani.nikula@intel.com>
References: <cover.1651569697.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 07/20] drm/edid: clean up cea_db_is_*()
 functions
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

Abstract helpers for matching vendor data blocks and extended tags, and
use them to simplify all the cea_db_is_*() functions.

Take void pointer as parameter to allow transitional use for both u8 *
and struct cea_db *.

v2: Remove superfluous parens (Ville)

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c | 127 ++++++++++++-------------------------
 1 file changed, 40 insertions(+), 87 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index da8f455b725e..b272671cf86c 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4336,12 +4336,6 @@ do_hdmi_vsdb_modes(struct drm_connector *connector, const u8 *db, u8 len,
 	return modes;
 }
 
-static int
-cea_db_extended_tag(const u8 *db)
-{
-	return db[1];
-}
-
 static int
 cea_revision(const u8 *cea)
 {
@@ -4453,6 +4447,22 @@ static const void *cea_db_data(const struct cea_db *db)
 	return db->data;
 }
 
+static bool cea_db_is_extended_tag(const struct cea_db *db, int tag)
+{
+	return cea_db_tag(db) == CTA_DB_EXTENDED_TAG &&
+		cea_db_payload_len(db) >= 1 &&
+		db->data[0] == tag;
+}
+
+static bool cea_db_is_vendor(const struct cea_db *db, int vendor_oui)
+{
+	const u8 *data = cea_db_data(db);
+
+	return cea_db_tag(db) == CTA_DB_VENDOR &&
+		cea_db_payload_len(db) >= 3 &&
+		oui(data[2], data[1], data[0]) == vendor_oui;
+}
+
 static void cea_db_iter_edid_begin(const struct edid *edid, struct cea_db_iter *iter)
 {
 	memset(iter, 0, sizeof(*iter));
@@ -4587,93 +4597,50 @@ static void cea_db_iter_end(struct cea_db_iter *iter)
 	memset(iter, 0, sizeof(*iter));
 }
 
-static bool cea_db_is_hdmi_vsdb(const u8 *db)
+static bool cea_db_is_hdmi_vsdb(const void *db)
 {
-	if (cea_db_tag(db) != CTA_DB_VENDOR)
-		return false;
-
-	if (cea_db_payload_len(db) < 5)
-		return false;
-
-	return oui(db[3], db[2], db[1]) == HDMI_IEEE_OUI;
+	return cea_db_is_vendor(db, HDMI_IEEE_OUI) &&
+		cea_db_payload_len(db) >= 5;
 }
 
-static bool cea_db_is_hdmi_forum_vsdb(const u8 *db)
+static bool cea_db_is_hdmi_forum_vsdb(const void *db)
 {
-	if (cea_db_tag(db) != CTA_DB_VENDOR)
-		return false;
-
-	if (cea_db_payload_len(db) < 7)
-		return false;
-
-	return oui(db[3], db[2], db[1]) == HDMI_FORUM_IEEE_OUI;
+	return cea_db_is_vendor(db, HDMI_FORUM_IEEE_OUI) &&
+		cea_db_payload_len(db) >= 7;
 }
 
-static bool cea_db_is_microsoft_vsdb(const u8 *db)
+static bool cea_db_is_microsoft_vsdb(const void *db)
 {
-	if (cea_db_tag(db) != CTA_DB_VENDOR)
-		return false;
-
-	if (cea_db_payload_len(db) != 21)
-		return false;
-
-	return oui(db[3], db[2], db[1]) == MICROSOFT_IEEE_OUI;
+	return cea_db_is_vendor(db, MICROSOFT_IEEE_OUI) &&
+		cea_db_payload_len(db) == 21;
 }
 
-static bool cea_db_is_vcdb(const u8 *db)
+static bool cea_db_is_vcdb(const void *db)
 {
-	if (cea_db_tag(db) != CTA_DB_EXTENDED_TAG)
-		return false;
-
-	if (cea_db_payload_len(db) != 2)
-		return false;
-
-	if (cea_db_extended_tag(db) != CTA_EXT_DB_VIDEO_CAP)
-		return false;
-
-	return true;
+	return cea_db_is_extended_tag(db, CTA_EXT_DB_VIDEO_CAP) &&
+		cea_db_payload_len(db) == 2;
 }
 
-static bool cea_db_is_hdmi_forum_scdb(const u8 *db)
+static bool cea_db_is_hdmi_forum_scdb(const void *db)
 {
-	if (cea_db_tag(db) != CTA_DB_EXTENDED_TAG)
-		return false;
-
-	if (cea_db_payload_len(db) < 7)
-		return false;
-
-	if (cea_db_extended_tag(db) != CTA_EXT_DB_HF_SCDB)
-		return false;
-
-	return true;
+	return cea_db_is_extended_tag(db, CTA_EXT_DB_HF_SCDB) &&
+		cea_db_payload_len(db) >= 7;
 }
 
-static bool cea_db_is_y420cmdb(const u8 *db)
+static bool cea_db_is_y420cmdb(const void *db)
 {
-	if (cea_db_tag(db) != CTA_DB_EXTENDED_TAG)
-		return false;
-
-	if (!cea_db_payload_len(db))
-		return false;
-
-	if (cea_db_extended_tag(db) != CTA_EXT_DB_420_VIDEO_CAP_MAP)
-		return false;
-
-	return true;
+	return cea_db_is_extended_tag(db, CTA_EXT_DB_420_VIDEO_CAP_MAP);
 }
 
-static bool cea_db_is_y420vdb(const u8 *db)
+static bool cea_db_is_y420vdb(const void *db)
 {
-	if (cea_db_tag(db) != CTA_DB_EXTENDED_TAG)
-		return false;
-
-	if (!cea_db_payload_len(db))
-		return false;
-
-	if (cea_db_extended_tag(db) != CTA_EXT_DB_420_VIDEO_DATA)
-		return false;
+	return cea_db_is_extended_tag(db, CTA_EXT_DB_420_VIDEO_DATA);
+}
 
-	return true;
+static bool cea_db_is_hdmi_hdr_metadata_block(const void *db)
+{
+	return cea_db_is_extended_tag(db, CTA_EXT_DB_HDR_STATIC_METADATA) &&
+		cea_db_payload_len(db) >= 3;
 }
 
 #define for_each_cea_db(cea, i, start, end) \
@@ -4809,20 +4776,6 @@ static void fixup_detailed_cea_mode_clock(struct drm_display_mode *mode)
 	mode->clock = clock;
 }
 
-static bool cea_db_is_hdmi_hdr_metadata_block(const u8 *db)
-{
-	if (cea_db_tag(db) != CTA_DB_EXTENDED_TAG)
-		return false;
-
-	if (db[1] != CTA_EXT_DB_HDR_STATIC_METADATA)
-		return false;
-
-	if (cea_db_payload_len(db) < 3)
-		return false;
-
-	return true;
-}
-
 static uint8_t eotf_supported(const u8 *edid_ext)
 {
 	return edid_ext[2] &
-- 
2.30.2

