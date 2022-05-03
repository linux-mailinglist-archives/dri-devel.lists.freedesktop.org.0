Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C9A51992B
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 10:04:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D79C710F369;
	Wed,  4 May 2022 08:04:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D4410F3B6
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 08:04:06 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="267293333"
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="267293333"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 01:03:50 -0700
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="548446126"
Received: from adobrowo-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.156.70])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 01:03:48 -0700
Resent-Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7,
 02160 Espoo
Resent-To: dri-devel@lists.freedesktop.org
Resent-From: Jani Nikula <jani.nikula@intel.com>
Resent-Date: Wed, 04 May 2022 11:03:46 +0300
Resent-Message-ID: <87fslpohb1.fsf@intel.com>
X-Original-To: jani.nikula@linux.intel.com
Received: from linux.intel.com [10.54.29.200]
 by jnikula-mobl4.ger.corp.intel.com with IMAP (fetchmail-6.4.23)
 for <jani@localhost> (single-drop); Tue, 03 May 2022 12:25:28 +0300 (EEST)
Received: from fmsmga006.fm.intel.com (fmsmga006.fm.intel.com [10.253.24.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 601CC580808;
 Tue,  3 May 2022 02:25:21 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="810597531"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="810597531"
Received: from orsmga101.jf.intel.com ([10.7.208.22])
 by fmsmga006-1.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03
 May 2022 02:25:20 -0700
IronPort-SDR: iG2qpOqEzggxiCAItqOkHQ2T5XbHztofc67GjFyrJ1zjutyC1nz6f8StqaxMvtv8vGjLtXPe1U
 sXgCBdyYFKrA==
X-IPAS-Result: =?us-ascii?q?A0GIAQCx83BimLHS/INagQmBT4I9AYE8J1WEEj2JAIVmg?=
 =?us-ascii?q?j6WfIVQgUAxFgEBAQEBAQEBAQksEwECBAEBAwSKNAIlNQgOAQIEAQEBAQMCA?=
 =?us-ascii?q?QIBAQEBAQEDAQEBAgIBAQECAQEGAgEBAQECEAEBAQEBAQEBCQsJBwYMBRAOB?=
 =?us-ascii?q?SKFLzkNgjUFAgMYDm5KCTUBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBEAINU?=
 =?us-ascii?q?kcBHwECAwEBAQkXBAsBDQEBBAopAQIDAQIGAQEIHAIeBAQCAgMBUxkFgniDG?=
 =?us-ascii?q?AWSFpsXen8ygQGCCAEBBoJdgyyBXAmBECyJQ4QgeicQgVVEek6DNYFTgz+DC?=
 =?us-ascii?q?YJllTeBDpU7kBmdeTQHg06BOwYMnjUzqFUtljSiUYRPgWIBOoFaMxojgzlRG?=
 =?us-ascii?q?Q+OLBYVgzuKYXICOQIGAQoBAQMJhUcBAYRhgW4BAQ?=
IronPort-PHdr: A9a23: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
 yADxqn1eNx7Cw==
IronPort-Data: A9a23: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
 w==
IronPort-HdrOrdr: A9a23:09aegq0GGZ3e//vzPKtlcQqjBIokLtp133Aq2lEZdPUCSL3/qy
 ncppUmPH7P5wr5N0tNpTntAsO9qDbnhP1ICOoqVotKPjOHhILAFugL0WKh+UyDJ8SUzJ876U
 4USdkbNDSGNykesS+V2mSF+59L+re6zJw=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="254898705"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="254898705"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from gabe.freedesktop.org ([131.252.210.177])
 by mtab.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2022
 02:25:19 -0700
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
 by gabe.freedesktop.org (Postfix) with ESMTP id AEEAB10F820;
 Tue,  3 May 2022 09:25:18 +0000 (UTC)
X-Original-To: intel-gfx@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F3C910F820
 for <intel-gfx@lists.freedesktop.org>; Tue,  3 May 2022 09:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651569917; x=1683105917;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7NUj/EFOgniRQU4cZisQxidvpGg/TJt1HfG+9cEHmcs=;
 b=NJINbJUyiRNhBiVEiptorKMOmKDVsvsSdhoj/aRLy7gnuyLvhZy2+G98
 M3fG9aIb5H/z/VWkLM0CFuPkLnIlcDUZXzqipRL/U9JdAlTMXYFPF8W+6
 cIFaWNKryW/pvp9dO1zUzhKGD1u2Lbdths9YirGhRmfIRpyRV4LbmoXzv
 8LtEIVtSD1jXTAt2HmnK+BDtyb+Aqo1bXOzO0ThQciKwC+viLR/it+HXb
 OOhwube/A2SaK8KkEBcS4sQuQrfnhq5MJ3VaOR9wr0r1nN1SPQKXSkQeZ
 LCaAzp8JkzeZ9A+HhUnS1uhc27svpLMP+kZWepYrSwMBvxTMu3A3yde36 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="247343731"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="247343731"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 02:25:16 -0700
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="653195272"
Received: from jasinski-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.133.126])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 02:25:15 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  3 May 2022 12:23:58 +0300
Message-Id: <7400792525c13f58652f288b891d6057637ed4c8.1651569697.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1651569697.git.jani.nikula@intel.com>
References: <cover.1651569697.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 13/20] drm/edid: convert drm_parse_cea_ext()
 to use cea db iter
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

Iterate through all CTA data blocks across all CTA Extensions and
DisplayID data blocks.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 3433d9fa4799..98b2e6164468 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5497,8 +5497,9 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 			      const struct edid *edid)
 {
 	struct drm_display_info *info = &connector->display_info;
+	const struct cea_db *db;
+	struct cea_db_iter iter;
 	const u8 *edid_ext;
-	int i, start, end;
 
 	edid_ext = drm_find_cea_extension(edid);
 	if (!edid_ext)
@@ -5517,26 +5518,26 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 			info->color_formats |= DRM_COLOR_FORMAT_YCBCR422;
 	}
 
-	if (cea_db_offsets(edid_ext, &start, &end))
-		return;
-
-	for_each_cea_db(edid_ext, i, start, end) {
-		const u8 *db = &edid_ext[i];
+	cea_db_iter_edid_begin(edid, &iter);
+	cea_db_iter_for_each(db, &iter) {
+		/* FIXME: convert parsers to use struct cea_db */
+		const u8 *data = (const u8 *)db;
 
 		if (cea_db_is_hdmi_vsdb(db))
-			drm_parse_hdmi_vsdb_video(connector, db);
+			drm_parse_hdmi_vsdb_video(connector, data);
 		if (cea_db_is_hdmi_forum_vsdb(db) ||
 		    cea_db_is_hdmi_forum_scdb(db))
-			drm_parse_hdmi_forum_scds(connector, db);
+			drm_parse_hdmi_forum_scds(connector, data);
 		if (cea_db_is_microsoft_vsdb(db))
-			drm_parse_microsoft_vsdb(connector, db);
+			drm_parse_microsoft_vsdb(connector, data);
 		if (cea_db_is_y420cmdb(db))
-			drm_parse_y420cmdb_bitmap(connector, db);
+			drm_parse_y420cmdb_bitmap(connector, data);
 		if (cea_db_is_vcdb(db))
-			drm_parse_vcdb(connector, db);
+			drm_parse_vcdb(connector, data);
 		if (cea_db_is_hdmi_hdr_metadata_block(db))
-			drm_parse_hdr_metadata_block(connector, db);
+			drm_parse_hdr_metadata_block(connector, data);
 	}
+	cea_db_iter_end(&iter);
 }
 
 static
-- 
2.30.2

