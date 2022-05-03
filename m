Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4A851991F
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 10:02:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D880D10F2A1;
	Wed,  4 May 2022 08:02:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A9F10F295
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 08:02:54 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="267575554"
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="267575554"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 01:02:53 -0700
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="562607578"
Received: from adobrowo-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.156.70])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 01:02:52 -0700
Resent-Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7,
 02160 Espoo
Resent-To: dri-devel@lists.freedesktop.org
Resent-From: Jani Nikula <jani.nikula@intel.com>
Resent-Date: Wed, 04 May 2022 11:02:49 +0300
Resent-Message-ID: <87a6bxpvx2.fsf@intel.com>
X-Original-To: jani.nikula@linux.intel.com
Received: from linux.intel.com [10.54.29.200]
 by jnikula-mobl4.ger.corp.intel.com with IMAP (fetchmail-6.4.23)
 for <jani@localhost> (single-drop); Tue, 03 May 2022 12:24:57 +0300 (EEST)
Received: from fmsmga001.fm.intel.com (fmsmga001.fm.intel.com [10.253.24.23])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id C1A89580808;
 Tue,  3 May 2022 02:24:47 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="707970352"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="707970352"
Received: from orsmga101.jf.intel.com ([10.7.208.22])
 by fmsmga001-1.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03
 May 2022 02:24:46 -0700
IronPort-SDR: 4uaWYbhX7oeT50adSi33OgtaUQv6LyNQilv9JamNyZdKWlEB0qPnOb2KZvzwNYPe4kthU5AVAG
 YpwDS7IhaxSQ==
X-IPAS-Result: =?us-ascii?q?A0GIAQCx83BimLHS/INagQmBT4I9AYE8J1WEEj2JAIVmg?=
 =?us-ascii?q?iUZnEyBQDMUAQEBAQEBAQEBCSwTAQIEAQEDBIo0AiU1CA4BAgQBAQEBAwIBA?=
 =?us-ascii?q?gEBAQEBAQMBAQECAgEBAQIBAQYCAQEBAQIQAQEBAQEBAQEJCwkHBgwFEA4FI?=
 =?us-ascii?q?oUvOQ2CNQUCAxgObkoJNQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEQAg1SR?=
 =?us-ascii?q?wEfAQIDAQEBCRcECwENAQEECikBAgMBAgYBAQgcAh4EBAICAwFTGQWCeIMYB?=
 =?us-ascii?q?ZIWmxd6fzKBAYIIAQEGgl2DLIFcCYEQLIlDhCB6JxCBVUR6GzODNYFThkiCZ?=
 =?us-ascii?q?ZUXIC0QUYIXUhEQki2QHZ15NAeDToE7BgyeNTODdaRgHZZEgkqgB4RPgWMBO?=
 =?us-ascii?q?YFaMxojgzlRGQ+OLBaDUIphcgI5AgYBCgEBAwmFRwEBhGGBbgEB?=
IronPort-PHdr: A9a23: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
 BAP276tdewu
IronPort-Data: A9a23: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
IronPort-HdrOrdr: A9a23:ObhnO6GPFwn05INipLqEdceALOsnbusQ8zAXPo5KOFRom6uj5r
 +TdZUgpGLJYVMqN03I9urwX5VoK0mwyXdK2/hbAV7PZniChILsFvAb0WMNqweQbxEX2IZmpN
 FdmoJFea/N5WETt7eM3OFTe+xQieVviZrY8Ns2rE0dNz2CFZsQiTuR2jzrbnGeHzM2dqbRfa
 D0jqEqx0vDRZ1UVLXBOpArZZmImzShruOZXfdpPW9C1OFO5QnYmYISFSL3v2Z8b9o2+8ZazY
 BL+zaJlplL3svQ9iPh
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="254898641"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="254898641"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from gabe.freedesktop.org ([131.252.210.177])
 by mtab.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2022
 02:24:45 -0700
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
 by gabe.freedesktop.org (Postfix) with ESMTP id D168910F819;
 Tue,  3 May 2022 09:24:44 +0000 (UTC)
X-Original-To: intel-gfx@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A2510F819
 for <intel-gfx@lists.freedesktop.org>; Tue,  3 May 2022 09:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651569882; x=1683105882;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+BpBKqVxU0tny5Slhj9Sh+VW8cF/WrxT453OlYKfwTw=;
 b=hiXxTttI6NlWIUwUm5AWvk94Y9yn+uEoZwKPX6halYlMryMEZQN0Ri5w
 zbMoGgEBk7Jsx2J8Xcr9XHZhcBu36k8zz3j5U8gvGUXvJn6gAdL5QS6oz
 3nEPd9wTvrRU7qlklasICk7COSvzSDfY7ygwlzqI5SgpjaxUxMPvivahW
 rgRG/eD0TES3Z8WDut5aobHIahoWmxiExbHPXqLFrX0x0w2WUAlsDwWef
 6MhzXad1UV3YwTpzoHtQnzh0u0KneYqDzzXiMtV802tpLgiTbCTLXKCIi
 5rRpN33P1zkzzYZwdYKhjsyZznD6otgUudqQHCwxDMWytFE/6hjtWWC/C g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="247343682"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="247343682"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 02:24:42 -0700
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="516490278"
Received: from jasinski-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.133.126])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 02:24:40 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  3 May 2022 12:23:51 +0300
Message-Id: <37fdd2d9eabc73aaa9f95c56246dc47aea0e8e4e.1651569697.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1651569697.git.jani.nikula@intel.com>
References: <cover.1651569697.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 06/20] drm/edid: add iterator for CTA data
 blocks
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

Add an iterator for CTA Data Blocks across EDID CTA Extensions and
DisplayID CTA Data Blocks.

v2: Update references, note why we can trust displayid ranges (Ville)

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 202 ++++++++++++++++++++++++++++++++++---
 1 file changed, 190 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 6d71b2b77639..da8f455b725e 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4336,24 +4336,12 @@ do_hdmi_vsdb_modes(struct drm_connector *connector, const u8 *db, u8 len,
 	return modes;
 }
 
-static int
-cea_db_payload_len(const u8 *db)
-{
-	return db[0] & 0x1f;
-}
-
 static int
 cea_db_extended_tag(const u8 *db)
 {
 	return db[1];
 }
 
-static int
-cea_db_tag(const u8 *db)
-{
-	return db[0] >> 5;
-}
-
 static int
 cea_revision(const u8 *cea)
 {
@@ -4409,6 +4397,196 @@ cea_db_offsets(const u8 *cea, int *start, int *end)
 	return 0;
 }
 
+/*
+ * CTA Data Block iterator.
+ *
+ * Iterate through all CTA Data Blocks in both EDID CTA Extensions and DisplayID
+ * CTA Data Blocks.
+ *
+ * struct cea_db *db:
+ * struct cea_db_iter iter;
+ *
+ * cea_db_iter_edid_begin(edid, &iter);
+ * cea_db_iter_for_each(db, &iter) {
+ *         // do stuff with db
+ * }
+ * cea_db_iter_end(&iter);
+ */
+struct cea_db_iter {
+	struct drm_edid_iter edid_iter;
+	struct displayid_iter displayid_iter;
+
+	/* Current Data Block Collection. */
+	const u8 *collection;
+
+	/* Current Data Block index in current collection. */
+	int index;
+
+	/* End index in current collection. */
+	int end;
+};
+
+/* CTA-861-H section 7.4 CTA Data BLock Collection */
+struct cea_db {
+	u8 tag_length;
+	u8 data[];
+} __packed;
+
+static int cea_db_tag(const void *_db)
+{
+	/* FIXME: Transition to passing struct cea_db * everywhere. */
+	const struct cea_db *db = _db;
+
+	return db->tag_length >> 5;
+}
+
+static int cea_db_payload_len(const void *_db)
+{
+	/* FIXME: Transition to passing struct cea_db * everywhere. */
+	const struct cea_db *db = _db;
+
+	return db->tag_length & 0x1f;
+}
+
+static const void *cea_db_data(const struct cea_db *db)
+{
+	return db->data;
+}
+
+static void cea_db_iter_edid_begin(const struct edid *edid, struct cea_db_iter *iter)
+{
+	memset(iter, 0, sizeof(*iter));
+
+	drm_edid_iter_begin(edid, &iter->edid_iter);
+	displayid_iter_edid_begin(edid, &iter->displayid_iter);
+}
+
+static const struct cea_db *
+__cea_db_iter_current_block(const struct cea_db_iter *iter)
+{
+	const struct cea_db *db;
+
+	if (!iter->collection)
+		return NULL;
+
+	db = (const struct cea_db *)&iter->collection[iter->index];
+
+	if (iter->index + sizeof(*db) <= iter->end &&
+	    iter->index + sizeof(*db) + cea_db_payload_len(db) <= iter->end)
+		return db;
+
+	return NULL;
+}
+
+/*
+ * References:
+ * - VESA E-EDID v1.4
+ * - CTA-861-H section 7.3.3 CTA Extension Version 3
+ */
+static const void *__cea_db_iter_edid_next(struct cea_db_iter *iter)
+{
+	const u8 *ext;
+
+	drm_edid_iter_for_each(ext, &iter->edid_iter) {
+		/* Only support CTA Extension revision 3+ */
+		if (ext[0] != CEA_EXT || cea_revision(ext) < 3)
+			continue;
+
+		iter->index = 4;
+		iter->end = ext[2];
+		if (iter->end == 0)
+			iter->end = 127;
+		if (iter->end < 4 || iter->end > 127)
+			continue;
+
+		return ext;
+	}
+
+	return NULL;
+}
+
+/*
+ * References:
+ * - DisplayID v1.3 Appendix C: CEA Data Block within a DisplayID Data Block
+ * - DisplayID v2.0 section 4.10 CTA DisplayID Data Block
+ *
+ * Note that the above do not specify any connection between DisplayID Data
+ * Block revision and CTA Extension versions.
+ */
+static const void *__cea_db_iter_displayid_next(struct cea_db_iter *iter)
+{
+	const struct displayid_block *block;
+
+	displayid_iter_for_each(block, &iter->displayid_iter) {
+		if (block->tag != DATA_BLOCK_CTA)
+			continue;
+
+		/*
+		 * The displayid iterator has already verified the block bounds
+		 * in displayid_iter_block().
+		 */
+		iter->index = sizeof(*block);
+		iter->end = iter->index + block->num_bytes;
+
+		return block;
+	}
+
+	return NULL;
+}
+
+static const struct cea_db *__cea_db_iter_next(struct cea_db_iter *iter)
+{
+	const struct cea_db *db;
+
+	if (iter->collection) {
+		/* Current collection should always be valid. */
+		db = __cea_db_iter_current_block(iter);
+		if (WARN_ON(!db)) {
+			iter->collection = NULL;
+			return NULL;
+		}
+
+		/* Next block in CTA Data Block Collection */
+		iter->index += sizeof(*db) + cea_db_payload_len(db);
+
+		db = __cea_db_iter_current_block(iter);
+		if (db)
+			return db;
+	}
+
+	for (;;) {
+		/*
+		 * Find the next CTA Data Block Collection. First iterate all
+		 * the EDID CTA Extensions, then all the DisplayID CTA blocks.
+		 *
+		 * Per DisplayID v1.3 Appendix B: DisplayID as an EDID
+		 * Extension, it's recommended that DisplayID extensions are
+		 * exposed after all of the CTA Extensions.
+		 */
+		iter->collection = __cea_db_iter_edid_next(iter);
+		if (!iter->collection)
+			iter->collection = __cea_db_iter_displayid_next(iter);
+
+		if (!iter->collection)
+			return NULL;
+
+		db = __cea_db_iter_current_block(iter);
+		if (db)
+			return db;
+	}
+}
+
+#define cea_db_iter_for_each(__db, __iter) \
+	while (((__db) = __cea_db_iter_next(__iter)))
+
+static void cea_db_iter_end(struct cea_db_iter *iter)
+{
+	displayid_iter_end(&iter->displayid_iter);
+	drm_edid_iter_end(&iter->edid_iter);
+
+	memset(iter, 0, sizeof(*iter));
+}
+
 static bool cea_db_is_hdmi_vsdb(const u8 *db)
 {
 	if (cea_db_tag(db) != CTA_DB_VENDOR)
-- 
2.30.2

