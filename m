Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 240FC51991E
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 10:02:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E23B010F21E;
	Wed,  4 May 2022 08:02:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E73510F21E
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 08:02:37 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="265283540"
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="265283540"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 01:02:36 -0700
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="664372066"
Received: from adobrowo-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.156.70])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 01:02:35 -0700
Resent-Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7,
 02160 Espoo
Resent-To: dri-devel@lists.freedesktop.org
Resent-From: Jani Nikula <jani.nikula@intel.com>
Resent-Date: Wed, 04 May 2022 11:02:32 +0300
Resent-Message-ID: <87ilqlpvxj.fsf@intel.com>
X-Original-To: jani.nikula@linux.intel.com
Received: from linux.intel.com [10.54.29.200]
 by jnikula-mobl4.ger.corp.intel.com with IMAP (fetchmail-6.4.23)
 for <jani@localhost> (single-drop); Tue, 03 May 2022 12:24:47 +0300 (EEST)
Received: from fmsmga001.fm.intel.com (fmsmga001.fm.intel.com [10.253.24.23])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 3061A580B9A;
 Tue,  3 May 2022 02:24:36 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="707970321"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="707970321"
Received: from fmsmga107.fm.intel.com ([10.1.193.145])
 by fmsmga001-1.fm.intel.com with ESMTP; 03 May 2022 02:24:35 -0700
IronPort-SDR: 8z1gxQTqYxy+k24AAeSvsDxFMxy/kL7s5JRkh/d1XgudYgGKZMkQ3pq+tbQx0st3comKlXXyUC
 G3gwnkdAkUug==
X-IPAS-Result: =?us-ascii?q?A0HFAQAj9HBimLHS/INagQmBT4I9AYE8J1WEEj2JAIVmg?=
 =?us-ascii?q?j6eDDMUAQEBAQEBAQEBCSwTAQIEAQEDBIo0AiU3Bg4BAgQBAQEBAwIBAgEBA?=
 =?us-ascii?q?QEBAQMBAQECAgEBAQIBAQYCAQEBAQIQAQEBAQEBAQEJCwkHBgwFEA4FIoUvO?=
 =?us-ascii?q?Q2CNQUCAxgObkoJNQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEQAg1SRwEfA?=
 =?us-ascii?q?QIDAQEBCRcPAQ0BAQQKKQECAwECBgEBCBwCHgQEAgIDAVMZBYJ4gxgFkhabF?=
 =?us-ascii?q?3qBMYEBgggBAQaCXYMsgVwJgRAsiUOEIHonEIFVRHpOgzWBU4ZIgmWVFxkHD?=
 =?us-ascii?q?3+CQJJ3BDePYp15NAeDToE7BgyeNTOoVR2WRKJRhE+BdyaBWjMaI4M5URkPj?=
 =?us-ascii?q?iwWg1CKYXICOQIGAQoBAQMJhUcBAYRhgW4BAQ?=
IronPort-PHdr: A9a23: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
 xIUzOagfswoPYrh1hk6AmQ=
IronPort-Data: A9a23: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
IronPort-HdrOrdr: A9a23:EWm9fq1dT26DGEPcU5NqjQqjBC8kLtp133Aq2lEZdPWaSL3Rqy
 nIpoVl6faUskdtZJhEo7+90ca7MBThHPROjLX5A43SFzUO1FHYSb2KqLGSuwEJ9UXFh5pgPY
 kJSdkJNDTbNykJsS7CiDPIZOrJKrG8gemVbJ7lvgJQpGJRGttdBnlCe2Cm+51NNXV77MECZe
 mhD6N8zlLKFRRnDPhTREN1JNQriOe73q4OCiR2eSLPhjP+6Q9BKdbBYmmlNxElPVI/oovKiV
 K16jAQac2YwoGGI3LnvVPu0w==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="247982599"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="247982599"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from gabe.freedesktop.org ([131.252.210.177])
 by mtab.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2022
 02:24:34 -0700
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2A75810F812;
 Tue,  3 May 2022 09:24:34 +0000 (UTC)
X-Original-To: intel-gfx@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A9410F812
 for <intel-gfx@lists.freedesktop.org>; Tue,  3 May 2022 09:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651569873; x=1683105873;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jrTTGgUOtX+gGjLNCCeISafMu5mfA6LKSGnnCFTP5Pg=;
 b=RjQlLOVDwaz/usmE2d0pBJVvCxt1flpC5r0kckXegjR4S05Is1ZTrUUx
 krjdHuzbRLMHWnkZDih5SrMDZElkaBztkmj7W9rIhZo8j3pICu1PP7AFZ
 +N1Yx2FV85MpdxogzNxEEWk8OzT0f++35bnRtKIsDb/HQUfx0ynzqOeuG
 f9NEqrpkAr05ZJRpbvub1K/CIq52/NrEZjWBUj5JunhJp3d3JVBS3LIT+
 /pAPkgxqI1zWFEBdnyI1k5ap33tyHgDR+K9S1jvQ2NTVftGuf/HAgo7sL
 uErGqFnF8WzNDOoY0BurkNB2qCEtje8/PMTv1lEZ65zsO9ZGqGb7Tjh1E g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="247343661"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="247343661"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 02:24:32 -0700
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="536271101"
Received: from jasinski-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.133.126])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 02:24:30 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  3 May 2022 12:23:49 +0300
Message-Id: <c66cc3adeb375f5e60d1a8f91b41580d8ab67442.1651569697.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1651569697.git.jani.nikula@intel.com>
References: <cover.1651569697.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 04/20] drm/edid: clean up CTA data block tag
 definitions
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

Add prefixed names, group, sort, add references.

v2:
- Updated references to CTA-861-H
- s/CEA/CTA/ in data block macros

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c | 65 ++++++++++++++++++++------------------
 1 file changed, 35 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 18d05cbb2124..67eaa01f1d7c 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3462,16 +3462,21 @@ add_detailed_modes(struct drm_connector *connector, const struct edid *edid,
 	return closure.modes;
 }
 
-#define AUDIO_BLOCK	0x01
-#define VIDEO_BLOCK     0x02
-#define VENDOR_BLOCK    0x03
-#define SPEAKER_BLOCK	0x04
-#define HDR_STATIC_METADATA_BLOCK	0x6
-#define USE_EXTENDED_TAG 0x07
-#define EXT_VIDEO_CAPABILITY_BLOCK 0x00
-#define EXT_VIDEO_DATA_BLOCK_420	0x0E
-#define EXT_VIDEO_CAP_BLOCK_Y420CMDB 0x0F
-#define EXT_VIDEO_HF_SCDB_DATA_BLOCK	0x79
+/* CTA-861-H Table 60 - CTA Tag Codes */
+#define CTA_DB_AUDIO			1
+#define CTA_DB_VIDEO			2
+#define CTA_DB_VENDOR			3
+#define CTA_DB_SPEAKER			4
+#define CTA_DB_EXTENDED_TAG		7
+
+/* CTA-861-H Table 62 - CTA Extended Tag Codes */
+#define CTA_EXT_DB_VIDEO_CAP		0
+#define CTA_EXT_DB_VENDOR		1
+#define CTA_EXT_DB_HDR_STATIC_METADATA	6
+#define CTA_EXT_DB_420_VIDEO_DATA	14
+#define CTA_EXT_DB_420_VIDEO_CAP_MAP	15
+#define CTA_EXT_DB_HF_SCDB		0x79
+
 #define EDID_BASIC_AUDIO	(1 << 6)
 #define EDID_CEA_YCRCB444	(1 << 5)
 #define EDID_CEA_YCRCB422	(1 << 4)
@@ -4358,7 +4363,7 @@ cea_db_offsets(const u8 *cea, int *start, int *end)
 
 static bool cea_db_is_hdmi_vsdb(const u8 *db)
 {
-	if (cea_db_tag(db) != VENDOR_BLOCK)
+	if (cea_db_tag(db) != CTA_DB_VENDOR)
 		return false;
 
 	if (cea_db_payload_len(db) < 5)
@@ -4369,7 +4374,7 @@ static bool cea_db_is_hdmi_vsdb(const u8 *db)
 
 static bool cea_db_is_hdmi_forum_vsdb(const u8 *db)
 {
-	if (cea_db_tag(db) != VENDOR_BLOCK)
+	if (cea_db_tag(db) != CTA_DB_VENDOR)
 		return false;
 
 	if (cea_db_payload_len(db) < 7)
@@ -4380,7 +4385,7 @@ static bool cea_db_is_hdmi_forum_vsdb(const u8 *db)
 
 static bool cea_db_is_microsoft_vsdb(const u8 *db)
 {
-	if (cea_db_tag(db) != VENDOR_BLOCK)
+	if (cea_db_tag(db) != CTA_DB_VENDOR)
 		return false;
 
 	if (cea_db_payload_len(db) != 21)
@@ -4391,13 +4396,13 @@ static bool cea_db_is_microsoft_vsdb(const u8 *db)
 
 static bool cea_db_is_vcdb(const u8 *db)
 {
-	if (cea_db_tag(db) != USE_EXTENDED_TAG)
+	if (cea_db_tag(db) != CTA_DB_EXTENDED_TAG)
 		return false;
 
 	if (cea_db_payload_len(db) != 2)
 		return false;
 
-	if (cea_db_extended_tag(db) != EXT_VIDEO_CAPABILITY_BLOCK)
+	if (cea_db_extended_tag(db) != CTA_EXT_DB_VIDEO_CAP)
 		return false;
 
 	return true;
@@ -4405,13 +4410,13 @@ static bool cea_db_is_vcdb(const u8 *db)
 
 static bool cea_db_is_hdmi_forum_scdb(const u8 *db)
 {
-	if (cea_db_tag(db) != USE_EXTENDED_TAG)
+	if (cea_db_tag(db) != CTA_DB_EXTENDED_TAG)
 		return false;
 
 	if (cea_db_payload_len(db) < 7)
 		return false;
 
-	if (cea_db_extended_tag(db) != EXT_VIDEO_HF_SCDB_DATA_BLOCK)
+	if (cea_db_extended_tag(db) != CTA_EXT_DB_HF_SCDB)
 		return false;
 
 	return true;
@@ -4419,13 +4424,13 @@ static bool cea_db_is_hdmi_forum_scdb(const u8 *db)
 
 static bool cea_db_is_y420cmdb(const u8 *db)
 {
-	if (cea_db_tag(db) != USE_EXTENDED_TAG)
+	if (cea_db_tag(db) != CTA_DB_EXTENDED_TAG)
 		return false;
 
 	if (!cea_db_payload_len(db))
 		return false;
 
-	if (cea_db_extended_tag(db) != EXT_VIDEO_CAP_BLOCK_Y420CMDB)
+	if (cea_db_extended_tag(db) != CTA_EXT_DB_420_VIDEO_CAP_MAP)
 		return false;
 
 	return true;
@@ -4433,13 +4438,13 @@ static bool cea_db_is_y420cmdb(const u8 *db)
 
 static bool cea_db_is_y420vdb(const u8 *db)
 {
-	if (cea_db_tag(db) != USE_EXTENDED_TAG)
+	if (cea_db_tag(db) != CTA_DB_EXTENDED_TAG)
 		return false;
 
 	if (!cea_db_payload_len(db))
 		return false;
 
-	if (cea_db_extended_tag(db) != EXT_VIDEO_DATA_BLOCK_420)
+	if (cea_db_extended_tag(db) != CTA_EXT_DB_420_VIDEO_DATA)
 		return false;
 
 	return true;
@@ -4506,7 +4511,7 @@ add_cea_modes(struct drm_connector *connector, const struct edid *edid)
 			db = &cea[i];
 			dbl = cea_db_payload_len(db);
 
-			if (cea_db_tag(db) == VIDEO_BLOCK) {
+			if (cea_db_tag(db) == CTA_DB_VIDEO) {
 				video = db + 1;
 				video_len = dbl;
 				modes += do_cea_modes(connector, video, dbl);
@@ -4580,10 +4585,10 @@ static void fixup_detailed_cea_mode_clock(struct drm_display_mode *mode)
 
 static bool cea_db_is_hdmi_hdr_metadata_block(const u8 *db)
 {
-	if (cea_db_tag(db) != USE_EXTENDED_TAG)
+	if (cea_db_tag(db) != CTA_DB_EXTENDED_TAG)
 		return false;
 
-	if (db[1] != HDR_STATIC_METADATA_BLOCK)
+	if (db[1] != CTA_EXT_DB_HDR_STATIC_METADATA)
 		return false;
 
 	if (cea_db_payload_len(db) < 3)
@@ -4777,7 +4782,7 @@ static void drm_edid_to_eld(struct drm_connector *connector,
 			dbl = cea_db_payload_len(db);
 
 			switch (cea_db_tag(db)) {
-			case AUDIO_BLOCK:
+			case CTA_DB_AUDIO:
 				/* Audio Data Block, contains SADs */
 				sad_count = min(dbl / 3, 15 - total_sad_count);
 				if (sad_count >= 1)
@@ -4785,12 +4790,12 @@ static void drm_edid_to_eld(struct drm_connector *connector,
 					       &db[1], sad_count * 3);
 				total_sad_count += sad_count;
 				break;
-			case SPEAKER_BLOCK:
+			case CTA_DB_SPEAKER:
 				/* Speaker Allocation Data Block */
 				if (dbl >= 1)
 					eld[DRM_ELD_SPEAKER] = db[1];
 				break;
-			case VENDOR_BLOCK:
+			case CTA_DB_VENDOR:
 				/* HDMI Vendor-Specific Data Block */
 				if (cea_db_is_hdmi_vsdb(db))
 					drm_parse_hdmi_vsdb_audio(connector, db);
@@ -4851,7 +4856,7 @@ int drm_edid_to_sad(const struct edid *edid, struct cea_sad **sads)
 	for_each_cea_db(cea, i, start, end) {
 		const u8 *db = &cea[i];
 
-		if (cea_db_tag(db) == AUDIO_BLOCK) {
+		if (cea_db_tag(db) == CTA_DB_AUDIO) {
 			int j;
 
 			dbl = cea_db_payload_len(db);
@@ -4913,7 +4918,7 @@ int drm_edid_to_speaker_allocation(const struct edid *edid, u8 **sadb)
 	for_each_cea_db(cea, i, start, end) {
 		const u8 *db = &cea[i];
 
-		if (cea_db_tag(db) == SPEAKER_BLOCK) {
+		if (cea_db_tag(db) == CTA_DB_SPEAKER) {
 			dbl = cea_db_payload_len(db);
 
 			/* Speaker Allocation Data Block */
@@ -5044,7 +5049,7 @@ bool drm_detect_monitor_audio(const struct edid *edid)
 		goto end;
 
 	for_each_cea_db(edid_ext, i, start_offset, end_offset) {
-		if (cea_db_tag(&edid_ext[i]) == AUDIO_BLOCK) {
+		if (cea_db_tag(&edid_ext[i]) == CTA_DB_AUDIO) {
 			has_audio = true;
 			for (j = 1; j < cea_db_payload_len(&edid_ext[i]) + 1; j += 3)
 				DRM_DEBUG_KMS("CEA audio format %d\n",
-- 
2.30.2

