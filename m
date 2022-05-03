Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D693D519927
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 10:03:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFC7810F2FD;
	Wed,  4 May 2022 08:03:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D4C10F2FD
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 08:03:47 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="249676831"
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="249676831"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 01:03:25 -0700
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="693515618"
Received: from adobrowo-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.156.70])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 01:03:24 -0700
Resent-Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7,
 02160 Espoo
Resent-To: dri-devel@lists.freedesktop.org
Resent-From: Jani Nikula <jani.nikula@intel.com>
Resent-Date: Wed, 04 May 2022 11:03:21 +0300
Resent-Message-ID: <87sfppohbq.fsf@intel.com>
X-Original-To: jani.nikula@linux.intel.com
Received: from linux.intel.com [10.54.29.200]
 by jnikula-mobl4.ger.corp.intel.com with IMAP (fetchmail-6.4.23)
 for <jani@localhost> (single-drop); Tue, 03 May 2022 12:25:18 +0300 (EEST)
Received: from FMSMGA003.fm.intel.com (fmsmga003.fm.intel.com [10.253.24.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 4A15C580808;
 Tue,  3 May 2022 02:25:07 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="653195235"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="653195235"
Received: from orsmga101.jf.intel.com ([10.7.208.22])
 by FMSMGA003-1.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03
 May 2022 02:25:06 -0700
IronPort-SDR: ZmsWAgLF1lQMyDFUoVpQ8ESoq9D6wTNwOBfVrV4Jut15FxIbT2DVm132iHqEQx0Ij8G2Sii3w8
 qGmCtHdQAmaQ==
X-IPAS-Result: =?us-ascii?q?A0FAAQCx83BimLHS/INaHgEBCxIMQIFEC4I9AYE8J1WEE?=
 =?us-ascii?q?j2JAIVmgj6cTIFAMRYBAQEBAQEBAQEJLBMBAgQBAQMEijQCJTQJDQEBAgQBA?=
 =?us-ascii?q?QEBAwIBAgEBAQEBAQMBAQECAgEBAQIBAQYCAQEBAQIQAQEBAQEBAQEJCwkHB?=
 =?us-ascii?q?gwFEA4FIoUvOQ2CNQUCAxgObkoJNQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEQAg1SRwEfAQIDAQEBCRcECwENAQEECikBAgMBAgYBAQgcAh4EBAICAwFTG?=
 =?us-ascii?q?QWCeIMYBZIWmxd6fzKBAYIIAQEGgl2DLIFcCYEQLIlDhCB6JxCBVUR6ToM1g?=
 =?us-ascii?q?VODP4MJgmWVFyCBDkOUeJAZnXk0B4NOgTsGDJ41M6hVLZY0olGET4FhPIFaM?=
 =?us-ascii?q?xojgzlRGQ+OIAwWFYM7imFyAjkCBgEKAQEDCYVHAQGEYYFuAQE?=
IronPort-PHdr: A9a23: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
 AcB3b6tdddbDYb8wUE3MjFH
IronPort-Data: A9a23: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
IronPort-HdrOrdr: A9a23:iWDUxqhHcZ5aX1eMqLv1a8h+EnBQXuIji2hC6mlwRA09TyXPrb
 HJoB1p737JYVcqN03I9urtBEDtexnhHNtOkOos1NSZNzUO2lHJEGgK1+KL/9SjIVydygc379
 YGT0EKMqyVMbEMt7ee3ODXKbsdKJDsys6Vuds=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="254898689"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="254898689"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from gabe.freedesktop.org ([131.252.210.177])
 by mtab.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2022
 02:25:04 -0700
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
 by gabe.freedesktop.org (Postfix) with ESMTP id 269C810F817;
 Tue,  3 May 2022 09:25:04 +0000 (UTC)
X-Original-To: intel-gfx@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A208C10F817
 for <intel-gfx@lists.freedesktop.org>; Tue,  3 May 2022 09:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651569902; x=1683105902;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WalV2kMUd5EgcZf+dNlX5uWV+XyKcBp7OcAV0Cml1b8=;
 b=M2rkgOG950W+ydhPGL7EUgmq2VwygJJNHzXQhHwdsLCzFEB/V9iDddYu
 iYcdY3ftmi3DRFY/xBMpTHwRtq4fpoa6n4J7DyXx5OAIAfoH/1BsTBC5A
 5t1ezHHDwhTpW1PoR+AOCtodEUqJSTY33viVLDOoNHHO6Xc44ZSnGbWqx
 dKCzE86F/4I/tDtloYFoTW/hpDSA8bEElgH9TXo4x9XkyVNvu/i2dPX3n
 R5bGgbWGAy8blDL/+q7sUdgwjFoDF6GqAUzLwbYL51YbDEW6XxoiLZ8LN
 QLSMUUPTEmtiOmTHHX34BlAuPGxzJB6NtA3crlPrZMre/JP6jEroM2YU+ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="254898685"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="254898685"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 02:25:02 -0700
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="691750807"
Received: from jasinski-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.133.126])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 02:25:00 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  3 May 2022 12:23:55 +0300
Message-Id: <237e4b1de1567903d37ce1d1bb830020b8fd6690.1651569697.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1651569697.git.jani.nikula@intel.com>
References: <cover.1651569697.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 10/20] drm/edid: convert drm_edid_to_sad() to
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

Use the cea db iterator for short audio descriptors. We'll still stop at
the first audio data block, but not at the first CTA Extension if that
doesn't have the info.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 34 +++++++++-------------------------
 1 file changed, 9 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 7d6bf0b2bd9e..1ea27278652b 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5007,40 +5007,21 @@ static void drm_edid_to_eld(struct drm_connector *connector,
  */
 int drm_edid_to_sad(const struct edid *edid, struct cea_sad **sads)
 {
+	const struct cea_db *db;
+	struct cea_db_iter iter;
 	int count = 0;
-	int i, start, end, dbl;
-	const u8 *cea;
-
-	cea = drm_find_cea_extension(edid);
-	if (!cea) {
-		DRM_DEBUG_KMS("SAD: no CEA Extension found\n");
-		return 0;
-	}
-
-	if (cea_revision(cea) < 3) {
-		DRM_DEBUG_KMS("SAD: wrong CEA revision\n");
-		return 0;
-	}
-
-	if (cea_db_offsets(cea, &start, &end)) {
-		DRM_DEBUG_KMS("SAD: invalid data block offsets\n");
-		return -EPROTO;
-	}
-
-	for_each_cea_db(cea, i, start, end) {
-		const u8 *db = &cea[i];
 
+	cea_db_iter_edid_begin(edid, &iter);
+	cea_db_iter_for_each(db, &iter) {
 		if (cea_db_tag(db) == CTA_DB_AUDIO) {
 			int j;
 
-			dbl = cea_db_payload_len(db);
-
-			count = dbl / 3; /* SAD is 3B */
+			count = cea_db_payload_len(db) / 3; /* SAD is 3B */
 			*sads = kcalloc(count, sizeof(**sads), GFP_KERNEL);
 			if (!*sads)
 				return -ENOMEM;
 			for (j = 0; j < count; j++) {
-				const u8 *sad = &db[1 + j * 3];
+				const u8 *sad = &db->data[j * 3];
 
 				(*sads)[j].format = (sad[0] & 0x78) >> 3;
 				(*sads)[j].channels = sad[0] & 0x7;
@@ -5050,6 +5031,9 @@ int drm_edid_to_sad(const struct edid *edid, struct cea_sad **sads)
 			break;
 		}
 	}
+	cea_db_iter_end(&iter);
+
+	DRM_DEBUG_KMS("Found %d Short Audio Descriptors\n", count);
 
 	return count;
 }
-- 
2.30.2

