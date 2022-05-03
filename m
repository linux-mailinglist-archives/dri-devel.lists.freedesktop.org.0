Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C5C51992A
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 10:04:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 798FB10F367;
	Wed,  4 May 2022 08:04:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1876E10F367
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 08:04:00 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="354133338"
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="354133338"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 01:03:59 -0700
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="562607896"
Received: from adobrowo-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.156.70])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 01:03:58 -0700
Resent-Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7,
 02160 Espoo
Resent-To: dri-devel@lists.freedesktop.org
Resent-From: Jani Nikula <jani.nikula@intel.com>
Resent-Date: Wed, 04 May 2022 11:03:55 +0300
Resent-Message-ID: <87bkwdohas.fsf@intel.com>
X-Original-To: jani.nikula@linux.intel.com
Received: from linux.intel.com [10.54.29.200]
 by jnikula-mobl4.ger.corp.intel.com with IMAP (fetchmail-6.4.23)
 for <jani@localhost> (single-drop); Tue, 03 May 2022 12:25:33 +0300 (EEST)
Received: from fmsmga006.fm.intel.com (fmsmga006.fm.intel.com [10.253.24.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id E0F3C580808;
 Tue,  3 May 2022 02:25:24 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="810597540"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="810597540"
Received: from fmsmga105.fm.intel.com ([10.1.193.10])
 by fmsmga006-1.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03
 May 2022 02:25:24 -0700
IronPort-SDR: TLXmxPSpAmJr1xHM5ILFAxp3OuVIidQLDX7zksbbC7Gf8m30zqwwSpDH/vX74Pml26fvh5N8O/
 bhflBfptXMRA==
X-IPAS-Result: =?us-ascii?q?A0GlAQA483BimLHS/INagQmBT4I9AYE8J1WEEj2JAIVmg?=
 =?us-ascii?q?j6cTIFAMRYBAQEBAQEBAQEJLBMBAgQBAQMEijQCJTYHDgECBAEBAQEDAgECA?=
 =?us-ascii?q?QEBAQEBAwEBAQICAQEBAgEBBgIBAQEBAhABAQEBAQEBAQkLCQcGDAUQDgUih?=
 =?us-ascii?q?S85DYI1BQIDGA5uSgk1AQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBARACDVJHA?=
 =?us-ascii?q?R8BAgMBAQEJFwQLAQ0BAQQKKQECAwECBgEBCBwCHgQEAgIDAVMZBYJ4gxgFk?=
 =?us-ascii?q?hSbF3p/MoEBgggBAQaCXYMsgVwJgRAsiUOEIHonEIFVRHpOgzWBU4M/gwmCZ?=
 =?us-ascii?q?ZUXGQeBDpU7N49inXk0B4NOgTsGDJ41M6hVLZY0olGET4FoBi+BWjMaI4M5U?=
 =?us-ascii?q?RkPjiwWFYM7imFyAjkCBgEKAQEDCYVHAQGEYYFuAQE?=
IronPort-PHdr: A9a23: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
 yADxqn1eNx7Cw==
IronPort-Data: A9a23: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
 r7sSg==
IronPort-HdrOrdr: A9a23:KFdcbap92XRQHvNGp4dWnfIaV5oueYIsimQD101hICG9Ffbo8P
 xG/c5rsyMc7Qx7ZJhOo7690cW7MBDhHOBOkO0s1MaZPTUO0VHARO1fBO3Zsljd8gLFmdK1vp
 0BT0ERMqyTMbAz5fyR3OHze+xM/OW6
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="353877317"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="353877317"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from gabe.freedesktop.org ([131.252.210.177])
 by mtab.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2022
 02:25:23 -0700
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
 by gabe.freedesktop.org (Postfix) with ESMTP id 563C410F82A;
 Tue,  3 May 2022 09:25:23 +0000 (UTC)
X-Original-To: intel-gfx@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E527C10F828
 for <intel-gfx@lists.freedesktop.org>; Tue,  3 May 2022 09:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651569921; x=1683105921;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1ndoblvABtX2flSnn+z+rturOBC16nuc65pQXCzascs=;
 b=DcAF5d3tuaykGl98PdNrfze0oNB5BqGYwUiOYevPjGdfXAMTNOiViWWE
 yxrp903bRP5Jk7HsCMWLjHXtmFpLf3l5ZgRASISPYGAf3PpurQq0SQOS5
 BuIeRfKK1CJD05YpK2O2c2pmuxm7ShMRVMwEgyDg18JpaF3332zj/Cj65
 l27ZDrYzlv7hiyU/FN/D83kbvjlP/vD1ms4tV3ocSTkU5gPLii7reRfrB
 7SneKjrnx4LYnRqWfCuzD+H3e3uduSyeQ2Ky4kbL6sr6pL+zxiRhH5apC
 uU3fGatmrckTd7a/LYMVVdPT/YtJCf+Jmr3kiAV/ul0SMRnTHoU/2UHY6 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="267028704"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="267028704"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 02:25:21 -0700
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="663910306"
Received: from jasinski-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.133.126])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 02:25:19 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  3 May 2022 12:23:59 +0300
Message-Id: <8bdc67aa731857111eddd08a9c192d41d40b5f5a.1651569697.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1651569697.git.jani.nikula@intel.com>
References: <cover.1651569697.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 14/20] drm/edid: convert drm_edid_to_eld() to
 use cea db iter
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

Iterate through all CTA data blocks across all CTA extensions and
DisplayID data blocks. This may gather more data than before, and if
there's duplicated data, some is overwritten by whichever comes last.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 64 +++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 98b2e6164468..77986895e501 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4911,12 +4911,12 @@ static void clear_eld(struct drm_connector *connector)
 static void drm_edid_to_eld(struct drm_connector *connector,
 			    const struct edid *edid)
 {
+	const struct cea_db *db;
+	struct cea_db_iter iter;
 	uint8_t *eld = connector->eld;
 	const u8 *cea;
-	const u8 *db;
 	int total_sad_count = 0;
 	int mnl;
-	int dbl;
 
 	clear_eld(connector);
 
@@ -4942,43 +4942,37 @@ static void drm_edid_to_eld(struct drm_connector *connector,
 	eld[DRM_ELD_PRODUCT_CODE0] = edid->prod_code[0];
 	eld[DRM_ELD_PRODUCT_CODE1] = edid->prod_code[1];
 
-	if (cea_revision(cea) >= 3) {
-		int i, start, end;
+	cea_db_iter_edid_begin(edid, &iter);
+	cea_db_iter_for_each(db, &iter) {
+		const u8 *data = cea_db_data(db);
+		int len = cea_db_payload_len(db);
 		int sad_count;
 
-		if (cea_db_offsets(cea, &start, &end)) {
-			start = 0;
-			end = 0;
-		}
-
-		for_each_cea_db(cea, i, start, end) {
-			db = &cea[i];
-			dbl = cea_db_payload_len(db);
-
-			switch (cea_db_tag(db)) {
-			case CTA_DB_AUDIO:
-				/* Audio Data Block, contains SADs */
-				sad_count = min(dbl / 3, 15 - total_sad_count);
-				if (sad_count >= 1)
-					memcpy(&eld[DRM_ELD_CEA_SAD(mnl, total_sad_count)],
-					       &db[1], sad_count * 3);
-				total_sad_count += sad_count;
-				break;
-			case CTA_DB_SPEAKER:
-				/* Speaker Allocation Data Block */
-				if (dbl >= 1)
-					eld[DRM_ELD_SPEAKER] = db[1];
-				break;
-			case CTA_DB_VENDOR:
-				/* HDMI Vendor-Specific Data Block */
-				if (cea_db_is_hdmi_vsdb(db))
-					drm_parse_hdmi_vsdb_audio(connector, db);
-				break;
-			default:
-				break;
-			}
+		switch (cea_db_tag(db)) {
+		case CTA_DB_AUDIO:
+			/* Audio Data Block, contains SADs */
+			sad_count = min(len / 3, 15 - total_sad_count);
+			if (sad_count >= 1)
+				memcpy(&eld[DRM_ELD_CEA_SAD(mnl, total_sad_count)],
+				       data, sad_count * 3);
+			total_sad_count += sad_count;
+			break;
+		case CTA_DB_SPEAKER:
+			/* Speaker Allocation Data Block */
+			if (len >= 1)
+				eld[DRM_ELD_SPEAKER] = data[0];
+			break;
+		case CTA_DB_VENDOR:
+			/* HDMI Vendor-Specific Data Block */
+			if (cea_db_is_hdmi_vsdb(db))
+				drm_parse_hdmi_vsdb_audio(connector, (const u8 *)db);
+			break;
+		default:
+			break;
 		}
 	}
+	cea_db_iter_end(&iter);
+
 	eld[DRM_ELD_SAD_COUNT_CONN_TYPE] |= total_sad_count << DRM_ELD_SAD_COUNT_SHIFT;
 
 	if (connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort ||
-- 
2.30.2

