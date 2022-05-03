Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA2151992E
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 10:04:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA92F10F3B6;
	Wed,  4 May 2022 08:04:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BC9210F3B6
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 08:04:15 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="328238077"
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="328238077"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 01:04:14 -0700
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="536722729"
Received: from adobrowo-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.156.70])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 01:04:13 -0700
Resent-Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7,
 02160 Espoo
Resent-To: dri-devel@lists.freedesktop.org
Resent-From: Jani Nikula <jani.nikula@intel.com>
Resent-Date: Wed, 04 May 2022 11:04:10 +0300
Resent-Message-ID: <8735hpohad.fsf@intel.com>
X-Original-To: jani.nikula@linux.intel.com
Received: from linux.intel.com [10.54.29.200]
 by jnikula-mobl4.ger.corp.intel.com with IMAP (fetchmail-6.4.23)
 for <jani@localhost> (single-drop); Tue, 03 May 2022 12:25:43 +0300 (EEST)
Received: from fmsmga005.fm.intel.com (fmsmga005.fm.intel.com [10.253.24.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 2956D580B9A;
 Tue,  3 May 2022 02:25:34 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="888355185"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="888355185"
Received: from fmsmga106.fm.intel.com ([10.1.193.131])
 by fmsmga005-1.fm.intel.com with ESMTP; 03 May 2022 02:25:33 -0700
IronPort-SDR: 3Svcmjg0uRLSVjfZSc86dzzcIWtsxEy6S1GcOKzTrnIZEEqOaYnnpqaG/+2nw77IKq61GVGMru
 aDgYqODaF1cw==
X-IPAS-Result: =?us-ascii?q?A0FAAQCx83BimLHS/INaHgEBCxIMQIFEC4I9AYE8J1WEE?=
 =?us-ascii?q?j2JAIVmgj6cTIFAMRYBAQEBAQEBAQEJLBMBAgQBAQMEijQCJTQJDQEBAgQBA?=
 =?us-ascii?q?QEBAwIBAgEBAQEBAQMBAQECAgEBAQIBAQYCAQEBAQIQAQEBAQEBAQEJCwkHB?=
 =?us-ascii?q?gwFEA4FIoUvOQ2CNQUCAxgObkoJNQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEQAg1SRwEfAQIDAQEBCRcECwENAQEECikBAgMBAgYBAQgcAh4EBAICAwFTG?=
 =?us-ascii?q?QWCeIMYBZIWmxd6fzKBAYIIAQEGgl2DLIFcCYEQLIlDhCB6JxCBVUR6ToM1g?=
 =?us-ascii?q?VODP4MJgmWVN4EOgjcVkm+QGZ15NAeDToE7BgyeNTOoVS2WNKJRhE+BYTyBW?=
 =?us-ascii?q?jMaI4M5URkPjiAMFhWDO4phcgI5AgYBCgEBAwmFRwEBhGGBbgEB?=
IronPort-PHdr: A9a23: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
 yAUyK/1eNxAfrbw3FZvPwESoQ==
IronPort-Data: A9a23:urKe6a3DEs/vOu/WcfbD5VR3kn2cJEfYwER7XKvMYLTBsI5bp2dWm
 GceDTjTPKqDYGv2LoxyaIu+oB4AvJHQxoRjSQA5qSg9HnlHgPSeOdnIdU2Y0wF+jyHgoOCLy
 +1HMoGowBUcFyeEzvuLGua99SEUOYagH+KnU7Os1hhZHFMiEGF44f5as7RRbrRA2LBVOCvQ/
 4KryyHjEAX9gWQsbzpPs/vrRC5H5ZwehhtJ5jTSWtgW5Dcyp1FNZH7IDfrpR5dQatA88t+SH
 44v/pnglo/q105F5ueer1rOWhZiroj6ZlHS1yUMC8BOtTAZzsA6+v5T2PPx8i67gR3R9zx64
 IwlWZBd0m7Fl0AD8QgQe0AwLs1wAUFJ0KbfKF2UlvOM8xDPNFGy4+RFAUZmHaRNr46bAUkWn
 RAZAD8EZB3Fifi7zb62UepwgdxlK9PkVG8dkig7lHeDUKxgG8mbBfyVure03x9o7ixKNffYe
 8cdLDVhfFHKZABJMVoMIJY/h/uzwHflfjBUpUmWua0vpW/Jw2Sd1ZC3bIWOJofVG509ckCwv
 Vr+wErVEwogP/+9wGrC9nGsreLspHauMG4VPOTkqa872TV/3Fc7AREfUB2+oOKrgVy3WPpbK
 koJ6mwvq7Q/8AqgSdyVdxS+rH/CpR4NR9t4F+w89RHLy6zI7gLfDW8BJhZDYdon8sk3RiEu3
 3eNntX0FXputqGYTTSW8bL8hTG7PzUOPykBfz0VVhkZ5Nfio6k3jxTSXpBiFrK4ipv+HjSY6
 zKNqy43nPMXhM4X1qO2+3jDgjSxtt7ISBI44kPcWWfNxgBwZci7aoyt4F7W695ELYCEXh+Au
 mQJn46V6+VmJZKEkS2JBuYKGrCk7OSDIRXYgFhyD98g8Sig/zioeoU4yDR3LV11P8BCfTbvY
 0/UoxhNzJtSOma6K65xf4+1Tc8tyMDIEN3uV/3WKMJHfpV1fx2W/wlqZEiNzybsllQhlec0P
 pLzWcOlF30bD+JtwSCwTvsazr4g1Ag6xGXOVdb6yQiq1fyVY3v9YbIEO1uHY+QO4r6spATT7
 sYZNs2WxhEZW+r7CgHS8I0aa1MXKmAjDJT/g8hWcPOTZAtgBGwlTfTWxNsJfY1/mqNE0OvB5
 Vm5W0lF2Bz+g2HKLUOBbXULQK/oWJ9kvzQ+PDcwNEqA33klfJbp7aEDep9xdr4inMR/0+RoT
 P5DZt+bH/BOTBzD+jIAfd/8qpBvcFKgggfmFzqkZikiedhkRhHh/t7iYxup9S8SAy7xvsw7y
 5Wy1g7dUIccbwBjCtvGLvOp0161+3ManYpaTUvJM8RafgPo7qBuKirsnrk2Jd0BLVPIwT7y6
 uqNKRgRr+SLrZU4/dXEnqOYqJ/vFPFxdqZHI4XFxa+uPAzx2VW8/dJJF8zWXSH2WWSk2Iz3M
 I250MrAGPEAmV9Lta91HLBq0b8y6rPTS1lyk1kM8JLjMgnDN19wHpWV9ZUS6v0Vmte1rSPzA
 xjVp4kLYN1lLeu8SDYsyBwZgvNvPB3+sgHV9+gxKUP2jMOc1OvYCx0MV/VgZco0EVeYGIwsy
 +pnttQb5gCykRk2Nc7AiTpbn4htEpDie/p23n35KNa14ubO9r2kScGBYsMRyMzSA+igymFwf
 lepaFPq3tywPHbqfXspDmTq1uFAn5kIsx0i5AZceg3UwISV3qNphEI5HdELouJ9k0gvPwVbZ
 zUDCqGJDf/mE8pA2pUeBD7E9/9pXUTEkqAO97f5vDSFEBj5DwQh3UUlPvyR+Ekf/ypHYjFH8
 fmFzmf7XCzxfd3gthbeqmY7w8EPuedZr1WY8Oj+RpztN8BjMVLN3/HyDUJV9UqPKZ5h1SXv+
 LgxlM4tOPKTHXBL+cUTVdLFvYn8vTjZfgSut9k7ovNQdYwdERnvsQWzx7eZJ50deqSWoRPpY
 yGsT+oWPymDOO+1hmhzLcYxz3VcxpbFOPJqlnjXyaLqfldRQveFcH4dy8QmuFIWfg==
IronPort-HdrOrdr: A9a23:mEALdqpECo9hXwZumZRbesgaV5q2eYIsimQD101hICG9vPbo3/
 xG+85rqiMc6QxhJU3I/OruBEDuewK6yXce2+Qs1ImZLULbUQeTXeRfBM7ZskXd88OXzJ8o6U
 9PG5IOfuEYJ2IK//oT2WGDYqEdKDPuytHguQ6m9QYZcegIUdAb0+4GMHf8LqSnfng7OXNjLu
 vu2iMvnVPJEhh2H6aG7zs+LpP+TvLw5djbiHU9dmAaAWe1/FeVAH+TKWno4v4ZaV0vsNQfGB
 D+4nXEDirKiYDK9vaw7QXu06g=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="247343760"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="247343760"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from gabe.freedesktop.org ([131.252.210.177])
 by mtab.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2022
 02:25:32 -0700
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
 by gabe.freedesktop.org (Postfix) with ESMTP id EA65910F835;
 Tue,  3 May 2022 09:25:31 +0000 (UTC)
X-Original-To: intel-gfx@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4523710F835
 for <intel-gfx@lists.freedesktop.org>; Tue,  3 May 2022 09:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651569931; x=1683105931;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4q3vp5NnV3n5JEE6snJzK8/gQfpbCwR/CiIV10BpcaM=;
 b=DbJPAL+CW2aiTc12mFkQKeDjoetYqOxSwoYVTcTqnIGFhq1jsdnRmPnd
 N+k8O4e8YoJpATtcpHRxiYkGZmeWbevqyZdT5M4ezWRJ9biSrWpAfPm3c
 JVduwt+2tenUJEbGOTejUZ/xgBcStxZEAlamVVhpU2lr89WkxIaOVjTUn
 ZKa37OCdpGv/ldwt2igTpYfR6DgqsWHd1f2F63gfXU+lcNxrGzBrCcVWV
 jolns0FFt9wcQoj3WC+JwvU8VIl1vDLVcoFdmPt6OTxEBJ1npsaUY7gDg
 lj1umj8d9cn9+5OGt4PbkKBd8tzIg1ouki4azSp+uFPcNBDnF3DhD9toc w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="249415629"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="249415629"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 02:25:30 -0700
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="567569363"
Received: from jasinski-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.133.126])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 02:25:28 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  3 May 2022 12:24:01 +0300
Message-Id: <c6ad496cdadea1bb598711a65ef536f4a43b74a7.1651569697.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1651569697.git.jani.nikula@intel.com>
References: <cover.1651569697.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 16/20] drm/edid: restore some type safety to
 cea_db_*() functions
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

During the transition, we accepted a void pointer for a poor C
programmer's version of polymorphism. Switch the functions to use struct
cea_db * to regain some more type safety.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 208b1efb490d..bc12ede8694c 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4384,11 +4384,8 @@ struct cea_db {
 	u8 data[];
 } __packed;
 
-static int cea_db_tag(const void *_db)
+static int cea_db_tag(const struct cea_db *db)
 {
-	/* FIXME: Transition to passing struct cea_db * everywhere. */
-	const struct cea_db *db = _db;
-
 	return db->tag_length >> 5;
 }
 
@@ -4555,47 +4552,47 @@ static void cea_db_iter_end(struct cea_db_iter *iter)
 	memset(iter, 0, sizeof(*iter));
 }
 
-static bool cea_db_is_hdmi_vsdb(const void *db)
+static bool cea_db_is_hdmi_vsdb(const struct cea_db *db)
 {
 	return cea_db_is_vendor(db, HDMI_IEEE_OUI) &&
 		cea_db_payload_len(db) >= 5;
 }
 
-static bool cea_db_is_hdmi_forum_vsdb(const void *db)
+static bool cea_db_is_hdmi_forum_vsdb(const struct cea_db *db)
 {
 	return cea_db_is_vendor(db, HDMI_FORUM_IEEE_OUI) &&
 		cea_db_payload_len(db) >= 7;
 }
 
-static bool cea_db_is_microsoft_vsdb(const void *db)
+static bool cea_db_is_microsoft_vsdb(const struct cea_db *db)
 {
 	return cea_db_is_vendor(db, MICROSOFT_IEEE_OUI) &&
 		cea_db_payload_len(db) == 21;
 }
 
-static bool cea_db_is_vcdb(const void *db)
+static bool cea_db_is_vcdb(const struct cea_db *db)
 {
 	return cea_db_is_extended_tag(db, CTA_EXT_DB_VIDEO_CAP) &&
 		cea_db_payload_len(db) == 2;
 }
 
-static bool cea_db_is_hdmi_forum_scdb(const void *db)
+static bool cea_db_is_hdmi_forum_scdb(const struct cea_db *db)
 {
 	return cea_db_is_extended_tag(db, CTA_EXT_DB_HF_SCDB) &&
 		cea_db_payload_len(db) >= 7;
 }
 
-static bool cea_db_is_y420cmdb(const void *db)
+static bool cea_db_is_y420cmdb(const struct cea_db *db)
 {
 	return cea_db_is_extended_tag(db, CTA_EXT_DB_420_VIDEO_CAP_MAP);
 }
 
-static bool cea_db_is_y420vdb(const void *db)
+static bool cea_db_is_y420vdb(const struct cea_db *db)
 {
 	return cea_db_is_extended_tag(db, CTA_EXT_DB_420_VIDEO_DATA);
 }
 
-static bool cea_db_is_hdmi_hdr_metadata_block(const void *db)
+static bool cea_db_is_hdmi_hdr_metadata_block(const struct cea_db *db)
 {
 	return cea_db_is_extended_tag(db, CTA_EXT_DB_HDR_STATIC_METADATA) &&
 		cea_db_payload_len(db) >= 3;
-- 
2.30.2

