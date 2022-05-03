Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BC6519921
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 10:03:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B22110F2B8;
	Wed,  4 May 2022 08:02:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 044D010F2B8
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 08:02:56 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="266539555"
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="266539555"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 01:02:45 -0700
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="584608542"
Received: from adobrowo-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.156.70])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 01:02:44 -0700
Resent-Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7,
 02160 Espoo
Resent-To: dri-devel@lists.freedesktop.org
Resent-From: Jani Nikula <jani.nikula@intel.com>
Resent-Date: Wed, 04 May 2022 11:02:41 +0300
Resent-Message-ID: <87ee19pvxa.fsf@intel.com>
X-Original-To: jani.nikula@linux.intel.com
Received: from linux.intel.com [10.54.29.200]
 by jnikula-mobl4.ger.corp.intel.com with IMAP (fetchmail-6.4.23)
 for <jani@localhost> (single-drop); Tue, 03 May 2022 12:24:52 +0300 (EEST)
Received: from orsmga006.jf.intel.com (orsmga006.jf.intel.com [10.7.209.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 6EB92580B9A;
 Tue,  3 May 2022 02:24:41 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="536271152"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="536271152"
Received: from orsmga106.jf.intel.com ([10.7.208.65])
 by orsmga006-1.jf.intel.com with ESMTP; 03 May 2022 02:24:41 -0700
IronPort-SDR: kc5HACpfwsbwvbyWYPy7fplwM7zMnRF6dj7lE3MM/fLm20cYYQUuitym9V57NrX/wmGE0zxE+U
 AJFVOtBxExyg==
X-IPAS-Result: =?us-ascii?q?A0FAAQCx83BimLHS/INagQmBT4I9AYE8J1WEEj2JAIVmg?=
 =?us-ascii?q?j6cTIFALhkBAQEBAQEBAQEJLBMBAgQBAQMEijQCJTQJDgECBAEBAQEDAgECA?=
 =?us-ascii?q?QEBAQEBAwEBAQICAQEBAgEBBgIBAQEBAhABAQEBAQEBAQkLCQcGDAUQDgUih?=
 =?us-ascii?q?S85DYI1BQIDGA5uSgk1AQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBARACDVJHA?=
 =?us-ascii?q?R8BAgMBAQEJFwQLAQ0BAQQKKQECAwECBgEBCBwCHgQEAgIDAVMZBYJ4gxgFk?=
 =?us-ascii?q?habF3p/MoEBgggBAQaCXYMsgVwJgRAsiUOEIHonEIFVRHobM4EJgiyBU4M/g?=
 =?us-ascii?q?wmCZZUXID1RpVSdeTQHg06BOwYMnjUzqFWWYaJRhE+BYTyBWjMaI4M5URkPj?=
 =?us-ascii?q?iwWFYM7imFyAjkCBgEKAQEDCYVHAQGEYYFuAQE?=
IronPort-PHdr: A9a23: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
 xIUzOagfswoPYrh1hk6AmQ=
IronPort-Data: A9a23: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
IronPort-HdrOrdr: A9a23:oH+B5q3IwU/MQcnyYG4IjQqjBC8kLtp133Aq2lEZdPWaSL3Rqy
 nIpoVl6faUskdtZJhEo7+90ca7MBThHPROjLX5A43SFzUO1FHYSb2KqLGSuwEJ9UXFh5pgPY
 kJSdkJNDTbNykJsS7CiDPIZOrJKrG8gemVbJ7lvgJQpGJRGttdBnlCe2Cm+51NNXV77MECZe
 mhD6N8zlLKFRRnDPhTREN1JNQriOe73q4OCiR2eSLPhjP+6Q9BKdbBYmmlNxElPVI/oovKiV
 K16jAQac2YwoGGI3LnvVPu0w==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="249415546"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="249415546"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from gabe.freedesktop.org ([131.252.210.177])
 by mtab.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2022
 02:24:40 -0700
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8480F10F793;
 Tue,  3 May 2022 09:24:39 +0000 (UTC)
X-Original-To: intel-gfx@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B1BC10F815
 for <intel-gfx@lists.freedesktop.org>; Tue,  3 May 2022 09:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651569878; x=1683105878;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ar+O5rhv2gY5D9A5mJHKArfxJvwbHk9PAplDpwDNtCY=;
 b=JkwtA5Bt/a6SQdrhQJiJ+ozGkCG174c+FtxonHB0iRdOZKFiH28Kxzr/
 qRtdTbbHItrfdnI+VmHiaV5H0Z+p7BaMj6x9i7G3uGEHM/L0O/rHFzwAx
 LXz8savrmggAIZGsb/ScLXBDmNrRY5oDnce3VVJgSVSoSZQIwwciQeUBs
 oJZrgosBG1up9fMIW/tWawu/MyT1E79yNxTYX3PG1NP5zehhVDNEyl4aX
 1Evnm4vAguLHHcrjLCMccVfnGF3+5lqU9Ktb1FXppcTnRUJDpZ2KuF3SH
 ytJWB278AhNgPb5W8yAD6M7fX2iWJ3ZOnMy+9Gn1H184JehinbIGlR7NA w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="267028617"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="267028617"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 02:24:37 -0700
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="691750228"
Received: from jasinski-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.133.126])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 02:24:35 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  3 May 2022 12:23:50 +0300
Message-Id: <ce02778b353b906c928268de9d7569d493a9be5d.1651569697.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1651569697.git.jani.nikula@intel.com>
References: <cover.1651569697.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 05/20] drm/edid: add iterator for EDID base
 and extension blocks
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

Add an iterator abstraction for going through all the EDID blocks.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 48 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 67eaa01f1d7c..6d71b2b77639 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1599,6 +1599,54 @@ static const void *edid_extension_block_data(const struct edid *edid, int index)
 	return edid_block_data(edid, index + 1);
 }
 
+/*
+ * EDID base and extension block iterator.
+ *
+ * struct drm_edid_iter iter;
+ * const u8 *block;
+ *
+ * drm_edid_iter_begin(edid, &iter);
+ * drm_edid_iter_for_each(block, &iter) {
+ *         // do stuff with block
+ * }
+ * drm_edid_iter_end(&iter);
+ */
+struct drm_edid_iter {
+	const struct edid *edid;
+
+	/* Current block index. */
+	int index;
+};
+
+static void drm_edid_iter_begin(const struct edid *edid,
+				struct drm_edid_iter *iter)
+{
+	memset(iter, 0, sizeof(*iter));
+
+	iter->edid = edid;
+}
+
+static const void *__drm_edid_iter_next(struct drm_edid_iter *iter)
+{
+	const void *block = NULL;
+
+	if (!iter->edid)
+		return NULL;
+
+	if (iter->index < edid_block_count(iter->edid))
+		block = edid_block_data(iter->edid, iter->index++);
+
+	return block;
+}
+
+#define drm_edid_iter_for_each(__block, __iter)			\
+	while (((__block) = __drm_edid_iter_next(__iter)))
+
+static void drm_edid_iter_end(struct drm_edid_iter *iter)
+{
+	memset(iter, 0, sizeof(*iter));
+}
+
 static const u8 edid_header[] = {
 	0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00
 };
-- 
2.30.2

