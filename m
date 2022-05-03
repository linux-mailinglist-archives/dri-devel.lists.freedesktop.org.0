Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BE851992F
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 10:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D13EC10F424;
	Wed,  4 May 2022 08:04:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC5C10F424
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 08:04:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="354133479"
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="354133479"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 01:04:22 -0700
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="653621927"
Received: from adobrowo-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.156.70])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 01:04:21 -0700
Resent-Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7,
 02160 Espoo
Resent-To: dri-devel@lists.freedesktop.org
Resent-From: Jani Nikula <jani.nikula@intel.com>
Resent-Date: Wed, 04 May 2022 11:04:19 +0300
Resent-Message-ID: <87y1zhn2po.fsf@intel.com>
X-Original-To: jani.nikula@linux.intel.com
Received: from linux.intel.com [10.54.29.200]
 by jnikula-mobl4.ger.corp.intel.com with IMAP (fetchmail-6.4.23)
 for <jani@localhost> (single-drop); Tue, 03 May 2022 12:25:59 +0300 (EEST)
Received: from fmsmga001.fm.intel.com (fmsmga001.fm.intel.com [10.253.24.23])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id EF7F0580808;
 Tue,  3 May 2022 02:25:51 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="707970511"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="707970511"
Received: from fmsmga105.fm.intel.com ([10.1.193.10])
 by fmsmga001-1.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03
 May 2022 02:25:51 -0700
IronPort-SDR: H56maOB/UMlNqiOSsC+hj6teC9pH3Bw1RvkYkFFMHZnpxYe8pkDVfvB2g0F4TucDWK4J71o39O
 1RGKJvN07bAQ==
X-IPAS-Result: =?us-ascii?q?A0E/AQA483BimLHS/INagQmBT4I9AYE8J1WEEj2JAIVmg?=
 =?us-ascii?q?j6cTIFAMBcBAQEBAQEBAQEJLBMBAgQBAQMEijQCJTQJDgECBAEBAQEDAgECA?=
 =?us-ascii?q?QEBAQEBAwEBAQICAQEBAgEBBgIBAQEBAhABAQEBAQEBAQkLCQcGDAUQDgUih?=
 =?us-ascii?q?S85DYI1BQIDGA5uSgk1AQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBARACDVJHA?=
 =?us-ascii?q?R8BAgMBAQEJFw8BDQEBBAopAQIDAQIGAQEIHAIeBAQCAgMBUxkFgniDGAWSF?=
 =?us-ascii?q?JsXeoExgQGCCAEBBoJdgyyBXAmBECyJQ4QgeicQgVVEehszgzWBU4M/gwmCZ?=
 =?us-ascii?q?ZUXIIEOgmmia515NAeDToE7BgyeNTOoVZZholGET4FhPIFaMxojgzlRGQ+OL?=
 =?us-ascii?q?BaDUIphcgI5AgYBCgEBAwmFRwEBhGGBbgEB?=
IronPort-PHdr: A9a23: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
 AcB3b6tdddbDYb8wUE3MjFH
IronPort-Data: A9a23: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
IronPort-HdrOrdr: A9a23:dRge3qv6KnNvmei2uzRx6lPH7skD69V00zEX/kB9WHVpmwKj5o
 iTdZMgpGDJYVcqKQwdcLW7V5VoLkmskqKdi7N9AV6dZnishILFFvAG0WKm+UyZJ8URntQtoZ
 uJXcBFeavN5HJB/LTHCDDRKadW/DFsmJrYzNs2tk0dOD2CCJsQlTuRdDzrdHGelDM2eabRT6
 DslfavzgDIER96DrXYOpBGZZm5mzTlruOtXfdsPW9Y1ODht0LN1FY6eyLoryv2VQkgoMZAzY
 G8qX2B2k0t28vLuiM0ulW406hr
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="353877339"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="353877339"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from gabe.freedesktop.org ([131.252.210.177])
 by mtab.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2022
 02:25:38 -0700
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
 by gabe.freedesktop.org (Postfix) with ESMTP id DC7A510F851;
 Tue,  3 May 2022 09:25:37 +0000 (UTC)
X-Original-To: intel-gfx@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F200410F849
 for <intel-gfx@lists.freedesktop.org>; Tue,  3 May 2022 09:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651569936; x=1683105936;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LgFw0QWX//FJl3OgAFF4kb/JrIZXSY24i33vd7BW9pA=;
 b=Kp4LO8Z4iEJsKx2qqHzhzcJUrsHMkXDZA0ypid6uYes8/g/tOmBfKHn3
 BUmBA30mxCYOMVLlvZgF3k58Oya4T8w7pfWxx03skdjaagvrJgxwonyUO
 2ALkMNX0m+ZOcst4aQ8WeTtaoAFOygsiIv+mppH70+kwKTP3yMt/sYIgU
 AZDAXg3O6fA2jHKqgmKRKU0tDHT1pEEBW0ua1zSvfszNy0Do/acmEn3f3
 VKj/KoVQei3hyuI5NFgec416dOX4NEZrMISqzw1S6gzuLz9OZTwKAhaOK
 ZtB8QT+t/cUR39/G2Q81bTPCN79McK6CnNYc90zsELaUhcYXayvvYvWXa Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="267313449"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="267313449"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 02:25:35 -0700
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="733843641"
Received: from jasinski-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.133.126])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 02:25:33 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  3 May 2022 12:24:02 +0300
Message-Id: <59481d0397de4b91b3e6ea665882334e92538f40.1651569697.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1651569697.git.jani.nikula@intel.com>
References: <cover.1651569697.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 17/20] drm/edid: detect basic audio in all
 CEA extensions
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

Convert drm_find_cea_extension() to EDID block iterator in basic audio
detection. Detect basic audio in all CEA extensions.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index bc12ede8694c..3b18a6e501df 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5112,17 +5112,21 @@ EXPORT_SYMBOL(drm_detect_hdmi_monitor);
  */
 bool drm_detect_monitor_audio(const struct edid *edid)
 {
+	struct drm_edid_iter edid_iter;
 	const struct cea_db *db;
 	struct cea_db_iter iter;
 	const u8 *edid_ext;
 	bool has_audio = false;
 
-	edid_ext = drm_find_cea_extension(edid);
-	if (!edid_ext)
-		goto end;
-
-	has_audio = (edid_ext[0] == CEA_EXT &&
-		    (edid_ext[3] & EDID_BASIC_AUDIO) != 0);
+	drm_edid_iter_begin(edid, &edid_iter);
+	drm_edid_iter_for_each(edid_ext, &edid_iter) {
+		if (edid_ext[0] == CEA_EXT) {
+			has_audio = edid_ext[3] & EDID_BASIC_AUDIO;
+			if (has_audio)
+				break;
+		}
+	}
+	drm_edid_iter_end(&edid_iter);
 
 	if (has_audio) {
 		DRM_DEBUG_KMS("Monitor has basic audio support\n");
-- 
2.30.2

