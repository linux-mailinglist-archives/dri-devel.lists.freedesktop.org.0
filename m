Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 865F1519930
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 10:04:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4A8010F426;
	Wed,  4 May 2022 08:04:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B39B10F426
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 08:04:31 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="266539938"
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="266539938"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 01:04:30 -0700
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="734292970"
Received: from adobrowo-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.156.70])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 01:04:29 -0700
Resent-Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7,
 02160 Espoo
Resent-To: dri-devel@lists.freedesktop.org
Resent-From: Jani Nikula <jani.nikula@intel.com>
Resent-Date: Wed, 04 May 2022 11:04:26 +0300
Resent-Message-ID: <87tua5n2ph.fsf@intel.com>
X-Original-To: jani.nikula@linux.intel.com
Received: from linux.intel.com [10.54.29.200]
 by jnikula-mobl4.ger.corp.intel.com with IMAP (fetchmail-6.4.23)
 for <jani@localhost> (single-drop); Tue, 03 May 2022 12:25:53 +0300 (EEST)
Received: from fmsmga002.fm.intel.com (fmsmga002.fm.intel.com [10.253.24.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id D44C2580808;
 Tue,  3 May 2022 02:25:43 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="663910460"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="663910460"
Received: from fmsmga107.fm.intel.com ([10.1.193.145])
 by fmsmga002-1.fm.intel.com with ESMTP; 03 May 2022 02:25:43 -0700
IronPort-SDR: zJHSl4frYIKObiMeqkDRAeUAM40z13WZ7iOz2k2HbQnAjWqj2tuHq5FzPx67JaS+h4qWAXfMM3
 4e00c8enO4aA==
X-IPAS-Result: =?us-ascii?q?A0FAAQAj9HBimLHS/INagQmBT4I9AYE8J1WEEj2JAIVmg?=
 =?us-ascii?q?j6cTIFAMRYBAQEBAQEBAQEJLBMBAgQBAQMEijQCJTQJDgECBAEBAQEDAgECA?=
 =?us-ascii?q?QEBAQEBAwEBAQICAQEBAgEBBgIBAQEBAhABAQEBAQEBAQkLCQcGDAUQDgUih?=
 =?us-ascii?q?S85DYI1BQIDGA5uSgk1AQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBARACDVJHA?=
 =?us-ascii?q?R8BAgMBAQEJFwQLAQ0BAQQKKQECAwECBgEBCBwCHgQEAgIDAVMZBYJ4gxgFk?=
 =?us-ascii?q?habF3p/MoEBgggBAQaCXYMsgVwJgRAsiUOEIHonEIFVRHobM4M1gVODP4MJg?=
 =?us-ascii?q?mWVFyAtYYJpomudeTQHg06BOwYMnjUzqFWWYaJRhE+BYTyBWjMaI4M5URkPj?=
 =?us-ascii?q?iwWFYM7imFyAjkCBgEKAQEDCYVHAQGEYYFuAQE?=
IronPort-PHdr: A9a23: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
 xZdmeCwFo8ULICugyRf
IronPort-Data: A9a23:rNWDIqBk2400IhVW/67lw5YqxClBgxIJ4kV8jS/XYbTApDMrgzVTn
 zBNWDyCbPvcM2TxLtF0bt61oUsDu56AmtcxTANkpHpgZkwRlceUXt7xwmUcns+xwm8vaGo+t
 512hgzodZhsJpP6jknxauCJQV5UjPnTHeeU5NbsY3w3HUk9IMsYoUgLd9QR2+aEuvDkRVLU0
 T/Oi5eHYgX9hmYvajt8B5+r8XuDgtyj4Fv0gXRjPZinjHeG/5XCJMlHTU0ZByKQrrh8RoZWd
 c6apF2K1jqxEyMWNz+Quu2TnnsiGeeOYFfU2hK6bID56vRKjnRaPq/Wr5PwY28P49mCt4kZJ
 NmgLvVc4OrmV0HBsL11bvVWL81xFaN20uTjO1nmiujQ91DGYUL+4q1HDmhjaOX0+s4vaY1P3
 fMRIj1LYAqOiu6727GnTfEqgd4sRCXpFNpE4zc6kGufV69+B8mcHM0m5vcAtNs0rsFIAfvaI
 sUXeX9lawnGaBBUElMWE44l2umyi3TzfiZbtFWN460t7AA/ySQrjOe8YICKIoTiqcN9h37Eh
 Wjl/UTCWFIwN4e/9T6M/F+nmbqa9c/8cNtOS+zpr5aGmma7z2AaDVsTVECpquuwiWa6WtRCO
 woV/DYjqe4580nDZtD7Uxz+u36Voh80X9tWDv186QeRx66S6AGcbkAGRzhALtont9IyTBQu1
 1mUj5XoAyBitPueTnf13rWdqy6pK24WN30Tfj0YSgUE4PHnoYcunlTOSMpuFOi+ididMTP3x
 DaDt246jrUPjMgG0Y2//Fbak3StoITESkg+4QC/dmGs70VnaY6gboql73Df7PBdPMCYSEWMu
 D4PnM32xOMHCJCJ0i+KRuQAF6Ov9t6BMTvBkRhuGYUs83Km/HvLVYVZ6StiKUEvNs8Cej/ue
 lTPkQdQ4oJDenqscaJzJYm2DqwCyKHrFNnnEOjdctdKaYpgdyeD/SdzdQiR2XzglA4nlqRXE
 ZKSa82tCzAQBL5hxSaxWOYWw5cvxyYj1SXSQ4z2y1Ks1r/2THuUQrcMPV+5YP0R6KKCvRWT8
 tBDOs/MwBJaOMX7Yyret40OKkgSJHwyLZT3rdFHMO+FPgdiXmomDpf5x7I7fot02ahcjc/M/
 3egSglZzkbygTvMLgDiQmxkbbr0T9B6rGknNDAEOVeuxmhlYICz4aNZfJwyFZE76vZ/zvkyU
 uMeZsGBBNxLSzLa63Ica4XwqMppcxHDrRKPOTu4Zn47foNIQw3P58+ifw3z+S1IBS2y3eMso
 7Cmxx7EaZ4CQRlySsfQdP+riVi2uBA1iuJzTlbBJJ9XZm3o8Y53O2rwiOM6J4cHLhCr+9eB/
 wmfCxpeq/PAroM469rVgrjCqJ2mewdjIqZEN2frx+2SLwiDxU7g+ZJAQt+aXGj0Vkqhrc1Oe
 t5p5/37NfQGmnNDvIx9D6tnwMoCCz3H+uIyIuNMQSijUri7Nl9zCiXbgZkX6sWh0pcc4FHsB
 xLeo7G2LJ3QYKvY/EgtyB3Jhwhp/ckTgCXW5PI5SKkRzH4opuLZOam+0v/ltcCwBLR8Oo5jz
 /0stcIb8A+jjQJsNcyJ5sy1y4huBiNRO0nEnshEaGMOtubN4gwfCXA7InKriKxjk/0WbiEXz
 sa83cIufYh0yEvYaGYUHnPQx+dbjplmkEkUkQZffQrZwoab3qBfMPhtHdIfE1k9IvJvjr8bB
 4SXHxcdyVimoWo135Yrs56EQlgcbPFmxqAB4wJVyzyIFiFEp0TVK3chPe+L8AgC72tAc3BG+
 rCGxXz+UCr7FPwdLQNsMXOJX8fLFIQrniWbwZjPN53cT/ESPGS56ofzOztgg0a3UKsZ2Rycz
 cE3rbkYQfOgb0Y4/fZkY7R2IJxNEnho0kQYH6E4lE7IdEmBEAyPNc+mdh7hJ5sRd6CbmaJ6Y
 uQ3Tv9yu92F/H7mhlgm6WQkedeYQNZBCBE+ln8H6ILIX3ZzbtakjX4IyhXDuQ==
IronPort-HdrOrdr: A9a23:kk3UxK8EJKLWc8YfkY9uk+BFI+orL9Y04lQ7vn2ZhyYlOvBw8P
 re48jztCWE9Qr5PUtOpTnuAtjmfZq3z/NICLcqTPyftWXdyQ6VxcRZnPPfK9OJIVyLygZyvZ
 0QBZSWIueAf2STtK7BkX6F+zxJ+qjPzEnQv5aq854Pd3ARV0gf1XYeNu9KKDwLeOAcP+tLKH
 P03KMuzFbBCBYqh4aAdwI4tsf41pf2ffndEGA77nAcmW2zZfLB0s+KL/Gf5Hl+IlByKM8ZgB
 H4e4OQ3NTSjxjX8HXh61M=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="247982700"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="247982700"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from gabe.freedesktop.org ([131.252.210.177])
 by mtab.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2022
 02:25:42 -0700
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1AF7410E646;
 Tue,  3 May 2022 09:25:42 +0000 (UTC)
X-Original-To: intel-gfx@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0659910F815
 for <intel-gfx@lists.freedesktop.org>; Tue,  3 May 2022 09:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651569940; x=1683105940;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zRtYlRE5XoW4bXz6wmP7m/ikHY7IadCaUrUMqBoF3dE=;
 b=A//cl6f+1xz2CnkfXmqfXapid5LZyyDuCcD8y5xB29oo92jBr2/i8P7o
 Bbcgl9kWZ/7zDQnfBt33UUIok6zsPv3Jp7HDrskp9cSsYhZTWlRPO4LUM
 L5PIIHffV9YLouUYJIs9hZ1ycfxcsKaL0LimBKgJMtKLr+JCJYuOC4BKp
 K92wb2weHx+5OIARkp7TZ6tWfh1dbzdCfEv57MtjOqijpJ9dxp8Ff5RS3
 nC6MF/iLw1AYmqm6A+r0uGQPcdMN1x9aXvsnzr4AUX3RbcnKjcLAXmNCt
 v7aQCT/2FnZSCyqgnBWmZjyOW7/YfofhC4yCH4hb2rmbLCoyFx7/r7PXU Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="265027120"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="265027120"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 02:25:40 -0700
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="584128766"
Received: from jasinski-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.133.126])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 02:25:38 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  3 May 2022 12:24:03 +0300
Message-Id: <a137d2e272ad1eac5b286784008a4baf91bc2799.1651569697.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1651569697.git.jani.nikula@intel.com>
References: <cover.1651569697.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 18/20] drm/edid: detect color formats and CTA
 revision in all CTA extensions
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

Convert drm_find_cea_extension() to EDID block iterator in color format
and CTA revision detection. Detect them in all CTA extensions.

Also parse CTA Data Blocks in DisplayID even if there's no CTA EDID
extension.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 3b18a6e501df..41f24f4c2d23 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5447,32 +5447,40 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 			      const struct edid *edid)
 {
 	struct drm_display_info *info = &connector->display_info;
+	struct drm_edid_iter edid_iter;
 	const struct cea_db *db;
 	struct cea_db_iter iter;
 	const u8 *edid_ext;
 
-	edid_ext = drm_find_cea_extension(edid);
-	if (!edid_ext)
-		return;
+	drm_edid_iter_begin(edid, &edid_iter);
+	drm_edid_iter_for_each(edid_ext, &edid_iter) {
+		if (edid_ext[0] != CEA_EXT)
+			continue;
 
-	info->cea_rev = edid_ext[1];
+		if (!info->cea_rev)
+			info->cea_rev = edid_ext[1];
 
-	/* The existence of a CEA block should imply RGB support */
-	info->color_formats = DRM_COLOR_FORMAT_RGB444;
+		if (info->cea_rev != edid_ext[1])
+			DRM_DEBUG_KMS("CEA extension version mismatch %u != %u\n",
+				      info->cea_rev, edid_ext[1]);
 
-	/* CTA DisplayID Data Block does not have byte #3 */
-	if (edid_ext[0] == CEA_EXT) {
+		/* The existence of a CTA extension should imply RGB support */
+		info->color_formats = DRM_COLOR_FORMAT_RGB444;
 		if (edid_ext[3] & EDID_CEA_YCRCB444)
 			info->color_formats |= DRM_COLOR_FORMAT_YCBCR444;
 		if (edid_ext[3] & EDID_CEA_YCRCB422)
 			info->color_formats |= DRM_COLOR_FORMAT_YCBCR422;
 	}
+	drm_edid_iter_end(&edid_iter);
 
 	cea_db_iter_edid_begin(edid, &iter);
 	cea_db_iter_for_each(db, &iter) {
 		/* FIXME: convert parsers to use struct cea_db */
 		const u8 *data = (const u8 *)db;
 
+		/* The existence of a CTA block should imply RGB support */
+		info->color_formats = DRM_COLOR_FORMAT_RGB444;
+
 		if (cea_db_is_hdmi_vsdb(db))
 			drm_parse_hdmi_vsdb_video(connector, data);
 		if (cea_db_is_hdmi_forum_vsdb(db) ||
-- 
2.30.2

