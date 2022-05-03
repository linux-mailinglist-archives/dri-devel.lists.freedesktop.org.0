Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47244519926
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 10:03:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA1E010EE11;
	Wed,  4 May 2022 08:03:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E67A810EE11
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 08:03:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="255159900"
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="255159900"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 01:03:33 -0700
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="584608732"
Received: from adobrowo-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.156.70])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 01:03:32 -0700
Resent-Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7,
 02160 Espoo
Resent-To: dri-devel@lists.freedesktop.org
Resent-From: Jani Nikula <jani.nikula@intel.com>
Resent-Date: Wed, 04 May 2022 11:03:29 +0300
Resent-Message-ID: <87o80dohbi.fsf@intel.com>
X-Original-To: jani.nikula@linux.intel.com
Received: from linux.intel.com [10.54.29.200]
 by jnikula-mobl4.ger.corp.intel.com with IMAP (fetchmail-6.4.23)
 for <jani@localhost> (single-drop); Tue, 03 May 2022 12:25:23 +0300 (EEST)
Received: from fmsmga001.fm.intel.com (fmsmga001.fm.intel.com [10.253.24.23])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id A0DF6580B9A;
 Tue,  3 May 2022 02:25:11 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="707970438"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="707970438"
Received: from orsmga104.jf.intel.com ([10.7.208.13])
 by fmsmga001-1.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03
 May 2022 02:25:10 -0700
IronPort-SDR: f43kZp+Xzfsh5rWASrCBuk2x0KTSWg2JsnZ9/4pByy3SroxeN8liGJ0RQkjlkKtNs5ObVOWFzw
 1/0AxCN1LAxg==
X-IPAS-Result: =?us-ascii?q?A0FYAQCx83BimLHS/INagQmBT4I9AYE8J1WEEj2JAIVmg?=
 =?us-ascii?q?j6WfIVQgUAwFwEBAQEBAQEBAQksEwECBAEBAwSDe4Y5AiU0CQ4BAgQBAQEBA?=
 =?us-ascii?q?wIBAgEBAQEBAQMBAQECAgEBAQIBAQYCAQEBAQIQAQEBAQEBAQEJCwkHBgwFE?=
 =?us-ascii?q?A4FIoUvOQ2CNQUCAxgObkoJNQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEQA?=
 =?us-ascii?q?g1SRwEfAQIDAQEBCRcPAQ0BAQQKKQECAwECBgEBCBwCHgQEAgIDAVMZBYJ4g?=
 =?us-ascii?q?xgFkhabF3qBMYEBgggBAQaCXYMsgVwJgRAsiUOEIHonEIFVRHpOgzWBU4M/g?=
 =?us-ascii?q?wmCZZUXIIEOlTs3j2KdeTQHg06BOwYMnjUzqFUtljSiUYRPgWE8gVozGiODO?=
 =?us-ascii?q?VEZD44sFhWDO4phcgI5AgYBCgEBAwmFRwEBhGGBbgEB?=
IronPort-PHdr: A9a23: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
 0hA+rj/N4lGbuXG
IronPort-Data: A9a23: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
IronPort-HdrOrdr: A9a23:2ly0Fq5DlYssDFU77wPXwNjXdLJyesId70hD6qkmc3Fomxej5q
 KTdZsgtCMc5Ax8ZJhCo6HiBEDjex3hHPdOiOEs1NyZNzUO1lHGEGkahrGD/9SaIUfDytI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="327978568"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="327978568"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from gabe.freedesktop.org ([131.252.210.177])
 by mtab.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2022
 02:25:09 -0700
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
 by gabe.freedesktop.org (Postfix) with ESMTP id AD04110F821;
 Tue,  3 May 2022 09:25:08 +0000 (UTC)
X-Original-To: intel-gfx@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EFF410F822
 for <intel-gfx@lists.freedesktop.org>; Tue,  3 May 2022 09:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651569907; x=1683105907;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vAz4hEvneVOC/eJPJl1JkMyCzrsy0rv4//Elp39fIyg=;
 b=dsiihRfC3D4YOhkAkwYIl07aenGVDRK4VJ4Wz7hdQf1X76fhCpZ8iKwa
 U6lH29PIYXnfqo3Km7ruSvgLPe9x4ASN+vtOqGGGyTvKymSiLViuvwdDs
 2FbAsMEJ88N36vLEXxDgBEByv4TKjJo6Tvm/Ir4UT/94vKKSqt8sKrg9k
 PGAyCwcxAy6oHMud/I5wcXYvrNbrAa12LId/5yOKaoFj76GybyWxc5dy6
 lLKN1rwyOxi5T9gSCM9v9D5CU04BP6Kb5MkPqT4ioSw3tESr2b0we7+6P
 kXN7elGbEMCX7by0CpFmwmrK6dZJq5y8i/Ju65Rl9LWTYVZUPoDJgqiwo g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="327978562"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="327978562"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 02:25:07 -0700
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="562142254"
Received: from jasinski-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.133.126])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 02:25:05 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  3 May 2022 12:23:56 +0300
Message-Id: <b867e7b628189d2f8fa7eac5b9aa701892724711.1651569697.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1651569697.git.jani.nikula@intel.com>
References: <cover.1651569697.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 11/20] drm/edid: convert
 drm_detect_hdmi_monitor() to use cea db iter
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

Iterate through all CTA data blocks, not just the first CTA extension.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 1ea27278652b..ca594d502941 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5131,27 +5131,24 @@ EXPORT_SYMBOL(drm_av_sync_delay);
  */
 bool drm_detect_hdmi_monitor(const struct edid *edid)
 {
-	const u8 *edid_ext;
-	int i;
-	int start_offset, end_offset;
-
-	edid_ext = drm_find_cea_extension(edid);
-	if (!edid_ext)
-		return false;
-
-	if (cea_db_offsets(edid_ext, &start_offset, &end_offset))
-		return false;
+	const struct cea_db *db;
+	struct cea_db_iter iter;
+	bool hdmi = false;
 
 	/*
 	 * Because HDMI identifier is in Vendor Specific Block,
 	 * search it from all data blocks of CEA extension.
 	 */
-	for_each_cea_db(edid_ext, i, start_offset, end_offset) {
-		if (cea_db_is_hdmi_vsdb(&edid_ext[i]))
-			return true;
+	cea_db_iter_edid_begin(edid, &iter);
+	cea_db_iter_for_each(db, &iter) {
+		if (cea_db_is_hdmi_vsdb(db)) {
+			hdmi = true;
+			break;
+		}
 	}
+	cea_db_iter_end(&iter);
 
-	return false;
+	return hdmi;
 }
 EXPORT_SYMBOL(drm_detect_hdmi_monitor);
 
-- 
2.30.2

