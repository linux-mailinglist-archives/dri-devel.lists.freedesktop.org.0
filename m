Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC9C519925
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 10:03:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB80010EA82;
	Wed,  4 May 2022 08:03:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8191310EE11
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 08:03:30 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="267293136"
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="267293136"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 01:03:09 -0700
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="536722362"
Received: from adobrowo-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.156.70])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 01:03:08 -0700
Resent-Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7,
 02160 Espoo
Resent-To: dri-devel@lists.freedesktop.org
Resent-From: Jani Nikula <jani.nikula@intel.com>
Resent-Date: Wed, 04 May 2022 11:03:05 +0300
Resent-Message-ID: <871qx9pvwm.fsf@intel.com>
X-Original-To: jani.nikula@linux.intel.com
Received: from linux.intel.com [10.54.29.200]
 by jnikula-mobl4.ger.corp.intel.com with IMAP (fetchmail-6.4.23)
 for <jani@localhost> (single-drop); Tue, 03 May 2022 12:25:08 +0300 (EEST)
Received: from FMSMGA003.fm.intel.com (fmsmga003.fm.intel.com [10.253.24.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 1EA2B580BE2;
 Tue,  3 May 2022 02:24:57 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="653195186"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="653195186"
Received: from orsmga103.jf.intel.com ([10.7.208.35])
 by FMSMGA003-1.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03
 May 2022 02:24:56 -0700
IronPort-SDR: v1+1ArbpzoUIZobxhjIpzmakl3oyzAp/OWjIco+d3ltSPWVOy0xLP1m3Vl0jwjSrjMVntlv0LD
 X5sjNfenWtjg==
X-IPAS-Result: =?us-ascii?q?A0E/AQAj9HBimLHS/INagQmBT4I9AYE8J1WEEj2JAIVmg?=
 =?us-ascii?q?j6cTIFAMRYBAQEBAQEBAQEJLBMBAgQBAQMEijQCJTQJDgECBAEBAQEDAgECA?=
 =?us-ascii?q?QEBAQEBAwEBAQICAQEBAgEBBgIBAQEBAhABAQEBAQEBAQkLCQcGDAUQDgUih?=
 =?us-ascii?q?S85DYI1BQIDGA5uSgk1AQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBARACDVJHA?=
 =?us-ascii?q?R8BAgMBAQEJFw8BDQEBBAopAQIDAQIGAQEIHAIeBAQCAgMBUxkFgniDGAWSF?=
 =?us-ascii?q?psXeoExgQGCCAEBBoJdgyyBXAmBECyJQ4QgeicQgVVEehszgzWBU4M/gwmCZ?=
 =?us-ascii?q?ZU3gQ6VO5AZnXk0B4NOgTsGDJ41M6hVLZY0olGET4FhPIFaMxojgzlRGQ+OL?=
 =?us-ascii?q?BYVgzuKYXICOQIGAQoBAQMJhUcBAYRhgW4BAQ?=
IronPort-PHdr: A9a23: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
 yADxqn1eNx7Cw==
IronPort-Data: A9a23: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
IronPort-HdrOrdr: A9a23:QRJEXazF6o2/AQwRIXh+KrPwsb1zdoMgy1knxilNoNJuA4Slfq
 eV7YsmPH7P+UsssRQb9uxoV5PwJk80n6QZ3WAuB8boYOCLghrMEGgm1/qb/9UPcxeOgtK0+8
 9bAt5D4ffLfCpHZf+T2njOLz7LqOP3uZxA/N2uukuFLjsaEZ2IkT0JbDpzwncGODWuXqBJZ6
 Z0j/Avz1HNGQV0Ui34PAh/YwHtnayAqHuMW295O/dI0njrsdtogISKYiRw2C1xMkIt/V5byx
 m9r+R3jp/Tw81TpyW361Pu
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="267313348"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="267313348"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from gabe.freedesktop.org ([131.252.210.177])
 by mtab.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2022
 02:24:54 -0700
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
 by gabe.freedesktop.org (Postfix) with ESMTP id A7FDE10F81F;
 Tue,  3 May 2022 09:24:53 +0000 (UTC)
X-Original-To: intel-gfx@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A8B10F81F
 for <intel-gfx@lists.freedesktop.org>; Tue,  3 May 2022 09:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651569892; x=1683105892;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bdbWR3RierMW/GIEpeUgICt5nB+oePfrEH0tpeU+tEU=;
 b=ldGJ+XkbxQ15bg8hsXiiFBF/gBt8+Ueg0ArREWEBF1hnNlvC7u8TYXkb
 Qeoen1NXvzTOdegiJvvPmsVAbTwx8Dm3RsLszBhG+MEQlSF7XZ1g6ZJv/
 +y5OxLdVd2wQxisFS91/sBtGsISS8dwNGesZS22tWfWqstd7jpMA9p8gp
 VlFagB9HKQQUgROFHzCCjaWUvh7mOm21o7xq7wzJIJpGTtdq9GDduvNsx
 iwPPLXdDaWOGFtS2j8sHuMduU8BwLW5AjMyKOm+TF8OTjqkGOdUp+SCIs
 M2F9UrO9CP4MTBubCCowU82nlhbIOqy4VISy7JM1cxVXrFqnHuZgP6oCm Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="254898661"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="254898661"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 02:24:52 -0700
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="733843085"
Received: from jasinski-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.133.126])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 02:24:50 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  3 May 2022 12:23:53 +0300
Message-Id: <dfa2d79db61d5eea543bef7aca7d80da3e71f99d.1651569697.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1651569697.git.jani.nikula@intel.com>
References: <cover.1651569697.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 08/20] drm/edid: convert add_cea_modes() to
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

Iterate through all CTA EDID extension blocks and DisplayID CTA data
blocks to add CEA modes.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 67 ++++++++++++++++++--------------------
 1 file changed, 31 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index b272671cf86c..5c3e2ed53012 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4689,46 +4689,41 @@ static void drm_parse_y420cmdb_bitmap(struct drm_connector *connector,
 static int
 add_cea_modes(struct drm_connector *connector, const struct edid *edid)
 {
-	const u8 *cea = drm_find_cea_extension(edid);
-	const u8 *db, *hdmi = NULL, *video = NULL;
-	u8 dbl, hdmi_len, video_len = 0;
+	const struct cea_db *db;
+	struct cea_db_iter iter;
 	int modes = 0;
 
-	if (cea && cea_revision(cea) >= 3) {
-		int i, start, end;
-
-		if (cea_db_offsets(cea, &start, &end))
-			return 0;
-
-		for_each_cea_db(cea, i, start, end) {
-			db = &cea[i];
-			dbl = cea_db_payload_len(db);
-
-			if (cea_db_tag(db) == CTA_DB_VIDEO) {
-				video = db + 1;
-				video_len = dbl;
-				modes += do_cea_modes(connector, video, dbl);
-			} else if (cea_db_is_hdmi_vsdb(db)) {
-				hdmi = db;
-				hdmi_len = dbl;
-			} else if (cea_db_is_y420vdb(db)) {
-				const u8 *vdb420 = &db[2];
-
-				/* Add 4:2:0(only) modes present in EDID */
-				modes += do_y420vdb_modes(connector,
-							  vdb420,
-							  dbl - 1);
-			}
+	cea_db_iter_edid_begin(edid, &iter);
+	cea_db_iter_for_each(db, &iter) {
+		const u8 *hdmi = NULL, *video = NULL;
+		u8 hdmi_len = 0, video_len = 0;
+
+		if (cea_db_tag(db) == CTA_DB_VIDEO) {
+			video = cea_db_data(db);
+			video_len = cea_db_payload_len(db);
+			modes += do_cea_modes(connector, video, video_len);
+		} else if (cea_db_is_hdmi_vsdb(db)) {
+			/* FIXME: Switch to use cea_db_data() */
+			hdmi = (const u8 *)db;
+			hdmi_len = cea_db_payload_len(db);
+		} else if (cea_db_is_y420vdb(db)) {
+			const u8 *vdb420 = cea_db_data(db) + 1;
+
+			/* Add 4:2:0(only) modes present in EDID */
+			modes += do_y420vdb_modes(connector, vdb420,
+						  cea_db_payload_len(db) - 1);
 		}
-	}
 
-	/*
-	 * We parse the HDMI VSDB after having added the cea modes as we will
-	 * be patching their flags when the sink supports stereo 3D.
-	 */
-	if (hdmi)
-		modes += do_hdmi_vsdb_modes(connector, hdmi, hdmi_len, video,
-					    video_len);
+		/*
+		 * We parse the HDMI VSDB after having added the cea modes as we
+		 * will be patching their flags when the sink supports stereo
+		 * 3D.
+		 */
+		if (hdmi)
+			modes += do_hdmi_vsdb_modes(connector, hdmi, hdmi_len,
+						    video, video_len);
+	}
+	cea_db_iter_end(&iter);
 
 	return modes;
 }
-- 
2.30.2

