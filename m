Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76827519928
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 10:03:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 560E910F364;
	Wed,  4 May 2022 08:03:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FFBC10F364
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 08:03:52 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="249676902"
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="249676902"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 01:03:41 -0700
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="516923088"
Received: from adobrowo-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.156.70])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 01:03:40 -0700
Resent-Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7,
 02160 Espoo
Resent-To: dri-devel@lists.freedesktop.org
Resent-From: Jani Nikula <jani.nikula@intel.com>
Resent-Date: Wed, 04 May 2022 11:03:37 +0300
Resent-Message-ID: <87k0b1ohba.fsf@intel.com>
X-Original-To: jani.nikula@linux.intel.com
Received: from linux.intel.com [10.54.29.200]
 by jnikula-mobl4.ger.corp.intel.com with IMAP (fetchmail-6.4.23)
 for <jani@localhost> (single-drop); Tue, 03 May 2022 12:25:49 +0300 (EEST)
Received: from orsmga005.jf.intel.com (orsmga005.jf.intel.com [10.7.209.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 60A0D580B9A;
 Tue,  3 May 2022 02:25:41 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="733843661"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="733843661"
Received: from fmsmga101.fm.intel.com ([10.1.193.65])
 by orsmga005-1.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03
 May 2022 02:25:40 -0700
IronPort-SDR: 2GYaNsSAWQTPK0M7XcBO67SbHhyMeNPQHNzjpojmlIjcgl+IXM4aUV1vGObh4wuoaHv7y1IP/v
 jUSAjx9WaaiQ==
X-IPAS-Result: =?us-ascii?q?A0FYAQDJ9HBimLHS/INagQmBT4I9AYE8J1WEEj2JAIVmg?=
 =?us-ascii?q?j6WfIVQgUAuGQEBAQEBAQEBAQksEwECBAEBAwSDe4Y5AiU0CQ4BAgQBAQEBA?=
 =?us-ascii?q?wIBAgEBAQEBAQMBAQECAgEBAQIBAQYCAQEBAQIQAQEBAQEBAQEJCwkHBgwFE?=
 =?us-ascii?q?A4FIoUvOQ2CNQUCAxgObkoJNQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEQA?=
 =?us-ascii?q?g1SRwEfAQIDAQEBCRcPAQ0BAQQKKQECAwECBgEBCBwCHgQEAgIDAVMZBYJ4g?=
 =?us-ascii?q?xgFkhabF3qBMYEBgggBAQaCXYMsgVwJgRAsiUOEIHonEIFVRHpOgzWBU4M/g?=
 =?us-ascii?q?wmCZZU3gQ6VO5AZnXk0B4NOgTsGDJ41M6hVLZY0olGET4FhPIFaMxojgzlRG?=
 =?us-ascii?q?Q+OLBYVgzuKYXICOQIGAQoBAQMJhUcBAYRhgW4BAQ?=
IronPort-PHdr: A9a23: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
 kNbiYjzKp4eY9WT5g==
IronPort-Data: A9a23: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
IronPort-HdrOrdr: A9a23:sR82Zqs5EPMt2a5TEAGFbpjV7skD69V00zEX/kB9WHVpmwKj5o
 iTdZMgpGDJYVcqKQwdcLW7V5VoLkmskqKdi7N9AV6dZnishILFFvAG0WKm+UyZJ8URntQtoZ
 uJXcBFeavN5HJB/LTHCDDRKadW/DFsmJrYzNs2tk0dOD2CCJsQlTuRdDzrdHGelDM2eabRT6
 DslfavzgDIER96DrXYOpBGZZm5mzTlruOtXfdsPW9Y1ODht0LN1FY6eyLoryv2VQkgoMZAzY
 G8qX2B2k0t28vLuiM0ulW406hr
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="292621705"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="292621705"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from gabe.freedesktop.org ([131.252.210.177])
 by mga01b.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May
 2022 02:25:14 -0700
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8B9BF10F7FA;
 Tue,  3 May 2022 09:25:13 +0000 (UTC)
X-Original-To: intel-gfx@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F4210F820
 for <intel-gfx@lists.freedesktop.org>; Tue,  3 May 2022 09:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651569912; x=1683105912;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SyIXttmWI6lzC8lV8yO/ncOZU/86VEDaJxLjtPHZckY=;
 b=ZN/FV/jMptf1sPMvPw1OP3s8uwJJjVivGMwtEqWvsm6iaroH/ZvrWmH1
 pStjtse7ldcztOo2D+HQ++RiGAsar1G701MG8UJrNbiyakbUctZLIhja7
 d0YKjNKM1sUDt73+0LNgtJHM4flE8+CHKQCyC9IusVF0H9Hvj1Y9MI+lj
 6wQC0qNxmqyKAOUkoiHY4hrFLAIBHeF1t9riHk7paHbj4f7bSiUatWOQe
 OHs76/ZMBwqYSG6QEokM2DEHHIHrEI0NggBh98yf+k+423rtU95dyjvuq
 8iqlrfesUY+5Ui/igHhCI0tJSAFkP7r/qoodqaRH13j3bS+0YoGvhyJw3 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="267028691"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="267028691"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 02:25:12 -0700
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="536271303"
Received: from jasinski-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.133.126])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 02:25:10 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  3 May 2022 12:23:57 +0300
Message-Id: <a7f0c380da9526f8dd6f758d7a748bca7b4da6ce.1651569697.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1651569697.git.jani.nikula@intel.com>
References: <cover.1651569697.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 12/20] drm/edid: convert
 drm_detect_monitor_audio() to use cea db iter
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

Iterate through all CEA data blocks.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index ca594d502941..3433d9fa4799 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5166,10 +5166,10 @@ EXPORT_SYMBOL(drm_detect_hdmi_monitor);
  */
 bool drm_detect_monitor_audio(const struct edid *edid)
 {
+	const struct cea_db *db;
+	struct cea_db_iter iter;
 	const u8 *edid_ext;
-	int i, j;
 	bool has_audio = false;
-	int start_offset, end_offset;
 
 	edid_ext = drm_find_cea_extension(edid);
 	if (!edid_ext)
@@ -5183,18 +5183,21 @@ bool drm_detect_monitor_audio(const struct edid *edid)
 		goto end;
 	}
 
-	if (cea_db_offsets(edid_ext, &start_offset, &end_offset))
-		goto end;
+	cea_db_iter_edid_begin(edid, &iter);
+	cea_db_iter_for_each(db, &iter) {
+		if (cea_db_tag(db) == CTA_DB_AUDIO) {
+			const u8 *data = cea_db_data(db);
+			int i;
 
-	for_each_cea_db(edid_ext, i, start_offset, end_offset) {
-		if (cea_db_tag(&edid_ext[i]) == CTA_DB_AUDIO) {
-			has_audio = true;
-			for (j = 1; j < cea_db_payload_len(&edid_ext[i]) + 1; j += 3)
+			for (i = 0; i < cea_db_payload_len(db); i += 3)
 				DRM_DEBUG_KMS("CEA audio format %d\n",
-					      (edid_ext[i + j] >> 3) & 0xf);
-			goto end;
+					      (data[i] >> 3) & 0xf);
+			has_audio = true;
+			break;
 		}
 	}
+	cea_db_iter_end(&iter);
+
 end:
 	return has_audio;
 }
-- 
2.30.2

