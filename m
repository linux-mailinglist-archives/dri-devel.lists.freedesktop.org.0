Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 014C451991C
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 10:02:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 011D310F27D;
	Wed,  4 May 2022 08:02:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F31810F21E
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 08:02:29 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="354132994"
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="354132994"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 01:02:28 -0700
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="653621435"
Received: from adobrowo-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.156.70])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 01:02:27 -0700
Resent-Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7,
 02160 Espoo
Resent-To: dri-devel@lists.freedesktop.org
Resent-From: Jani Nikula <jani.nikula@intel.com>
Resent-Date: Wed, 04 May 2022 11:02:25 +0300
Resent-Message-ID: <87mtfxpvxq.fsf@intel.com>
X-Original-To: jani.nikula@linux.intel.com
Received: from linux.intel.com [10.54.29.200]
 by jnikula-mobl4.ger.corp.intel.com with IMAP (fetchmail-6.4.23)
 for <jani@localhost> (single-drop); Tue, 03 May 2022 12:24:42 +0300 (EEST)
Received: from fmsmga004.fm.intel.com (fmsmga004.fm.intel.com [10.253.24.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 61E67580B9A;
 Tue,  3 May 2022 02:24:31 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="631442705"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="631442705"
Received: from fmsmga105.fm.intel.com ([10.1.193.10])
 by fmsmga004-1.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03
 May 2022 02:24:30 -0700
IronPort-SDR: jH7KHsP+WCmqIRdhLZAWt/W5V7Iy/vfR4XIavHkojFx+NQwL4Ka0hZp5Fu1gUQlz6BpSewzLyl
 w8CQIrnD8tuA==
X-IPAS-Result: =?us-ascii?q?A0GmAQA483BimLHS/INagQmBT4I9AYE8J1WEEj2JAIVmg?=
 =?us-ascii?q?iUZnEyBQDMUAQEBAQEBAQEBCSwTAQIEAQEDBIo0AiU2Bw4BAgQBAQEBAwIBA?=
 =?us-ascii?q?gEBAQEBAQMBAQECAgEBAQIBAQYCAQEBAQIQAQEBAQEBAQEJCwkHBgwFEA4FI?=
 =?us-ascii?q?oUvOQ2CNQUCAxgObkoJNQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEQAg1SR?=
 =?us-ascii?q?wEfAQIDAQEBCRcECwENAQEECikBAgMBAgYBAQgcAh4EBAICAwFTGQWCeIMYB?=
 =?us-ascii?q?ZIUmxd6fzKBAYIIAQEGgl2DLIFcCYEQLIlDhCB6JxCBVUR6GzODNYFThkiCZ?=
 =?us-ascii?q?ZUXGQcBUjuCaZJSkBmdeTQHg06BOwYMnjUzqFWWYaJRhE+BaA0ogVozGiODO?=
 =?us-ascii?q?VEZD44sFoNQimFyAjkCBgEKAQEDCYVHAQGEYYFuAQE?=
IronPort-PHdr: A9a23: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
 gcFlOurZb8YMZf2jhQKVw==
IronPort-Data: A9a23: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
IronPort-HdrOrdr: A9a23:ce9UmqkVgR5nEF7rtPb1BL4TIgvpDfKx3DAbv31ZSRFFG/FwWf
 re1MjzsiWE9wr5OUtQ5OxoXZPufZqyz+8T3WB6B9qftTfdySCVxe1ZnO7fKnjbalXDHgA079
 YVT0BRYOeAe2SSp/yKkjVRKr4bsa66GErBv5aW854Vd3AeV0gC1XYCNu/kKDwReOCXP+tEKH
 PG3Ls1m9PIQx1+Bajadxs4tqr41qb2fb3dEFQ77nUcmXezZF2TmdrH+9nx5GZub9pI+9lCgA
 v4enTCl9yeW37S8G6t64a/1f5rpOc=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="353877179"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="353877179"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from gabe.freedesktop.org ([131.252.210.177])
 by mtab.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2022
 02:24:30 -0700
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
 by gabe.freedesktop.org (Postfix) with ESMTP id 487B510F80E;
 Tue,  3 May 2022 09:24:29 +0000 (UTC)
X-Original-To: intel-gfx@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0555510F801
 for <intel-gfx@lists.freedesktop.org>; Tue,  3 May 2022 09:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651569868; x=1683105868;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lvUw1Hh2vQ6dsMjuG+wQ2IAdw7a+lYY1OgOVzIHZ51g=;
 b=NQ1afjPeJNbOw134bEjVOlZdkwgOwWxGxYuPeNT+999VIlRw6AzxxYxH
 OagrnI6swIQy9iDsRTaD9nqfzx0Ix6Ti4fUeymWc4+7RFOdLwNbaXuddy
 wHPzV0rQl7YbOsEuwR+/fFFFCUOx38Is5xd6donaWdkxP06TP/2G6R1wP
 XPMQqJxM+Q8mrJslTxFoGpcdMzC/bwIFAe0JGWeyQWXpZegThhWkrkaaQ
 73uOODIva1qtS53r7jURWk3z2QgYCwUK9jfye4Yvt+S0IfBhf7RLyPbdu
 6Oe3xBkbpr6pr1O+Dz3NR3XrBYKmbvJGwYViJfkwVwqDlCl9KbdyuQvNE Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="249415504"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="249415504"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 02:24:27 -0700
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="733842835"
Received: from jasinski-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.133.126])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 02:24:25 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  3 May 2022 12:23:48 +0300
Message-Id: <f8230e1893400e9a9c5829041a8ab36349182a54.1651569697.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1651569697.git.jani.nikula@intel.com>
References: <cover.1651569697.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 03/20] drm/edid: rename HDMI Forum VSDB to SCDS
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

The HDMI spec talks about SCDS, Sink Capability Data Structure, exposed
via HF-VSDB or HF-SCDB. Rename VSDB to SCDS.

Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 41 +++++++++++++++++++-------------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index fe527a0c50bc..18d05cbb2124 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5132,17 +5132,18 @@ static void drm_parse_ycbcr420_deep_color_info(struct drm_connector *connector,
 	hdmi->y420_dc_modes = dc_mask;
 }
 
-static void drm_parse_hdmi_forum_vsdb(struct drm_connector *connector,
-				 const u8 *hf_vsdb)
+/* Sink Capability Data Structure */
+static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
+				      const u8 *hf_scds)
 {
 	struct drm_display_info *display = &connector->display_info;
 	struct drm_hdmi_info *hdmi = &display->hdmi;
 
 	display->has_hdmi_infoframe = true;
 
-	if (hf_vsdb[6] & 0x80) {
+	if (hf_scds[6] & 0x80) {
 		hdmi->scdc.supported = true;
-		if (hf_vsdb[6] & 0x40)
+		if (hf_scds[6] & 0x40)
 			hdmi->scdc.read_request = true;
 	}
 
@@ -5155,9 +5156,9 @@ static void drm_parse_hdmi_forum_vsdb(struct drm_connector *connector,
 	 * Lets check it out.
 	 */
 
-	if (hf_vsdb[5]) {
+	if (hf_scds[5]) {
 		/* max clock is 5000 KHz times block value */
-		u32 max_tmds_clock = hf_vsdb[5] * 5000;
+		u32 max_tmds_clock = hf_scds[5] * 5000;
 		struct drm_scdc *scdc = &hdmi->scdc;
 
 		if (max_tmds_clock > 340000) {
@@ -5170,42 +5171,42 @@ static void drm_parse_hdmi_forum_vsdb(struct drm_connector *connector,
 			scdc->scrambling.supported = true;
 
 			/* Few sinks support scrambling for clocks < 340M */
-			if ((hf_vsdb[6] & 0x8))
+			if ((hf_scds[6] & 0x8))
 				scdc->scrambling.low_rates = true;
 		}
 	}
 
-	if (hf_vsdb[7]) {
+	if (hf_scds[7]) {
 		u8 max_frl_rate;
 		u8 dsc_max_frl_rate;
 		u8 dsc_max_slices;
 		struct drm_hdmi_dsc_cap *hdmi_dsc = &hdmi->dsc_cap;
 
 		DRM_DEBUG_KMS("hdmi_21 sink detected. parsing edid\n");
-		max_frl_rate = (hf_vsdb[7] & DRM_EDID_MAX_FRL_RATE_MASK) >> 4;
+		max_frl_rate = (hf_scds[7] & DRM_EDID_MAX_FRL_RATE_MASK) >> 4;
 		drm_get_max_frl_rate(max_frl_rate, &hdmi->max_lanes,
 				     &hdmi->max_frl_rate_per_lane);
-		hdmi_dsc->v_1p2 = hf_vsdb[11] & DRM_EDID_DSC_1P2;
+		hdmi_dsc->v_1p2 = hf_scds[11] & DRM_EDID_DSC_1P2;
 
 		if (hdmi_dsc->v_1p2) {
-			hdmi_dsc->native_420 = hf_vsdb[11] & DRM_EDID_DSC_NATIVE_420;
-			hdmi_dsc->all_bpp = hf_vsdb[11] & DRM_EDID_DSC_ALL_BPP;
+			hdmi_dsc->native_420 = hf_scds[11] & DRM_EDID_DSC_NATIVE_420;
+			hdmi_dsc->all_bpp = hf_scds[11] & DRM_EDID_DSC_ALL_BPP;
 
-			if (hf_vsdb[11] & DRM_EDID_DSC_16BPC)
+			if (hf_scds[11] & DRM_EDID_DSC_16BPC)
 				hdmi_dsc->bpc_supported = 16;
-			else if (hf_vsdb[11] & DRM_EDID_DSC_12BPC)
+			else if (hf_scds[11] & DRM_EDID_DSC_12BPC)
 				hdmi_dsc->bpc_supported = 12;
-			else if (hf_vsdb[11] & DRM_EDID_DSC_10BPC)
+			else if (hf_scds[11] & DRM_EDID_DSC_10BPC)
 				hdmi_dsc->bpc_supported = 10;
 			else
 				hdmi_dsc->bpc_supported = 0;
 
-			dsc_max_frl_rate = (hf_vsdb[12] & DRM_EDID_DSC_MAX_FRL_RATE_MASK) >> 4;
+			dsc_max_frl_rate = (hf_scds[12] & DRM_EDID_DSC_MAX_FRL_RATE_MASK) >> 4;
 			drm_get_max_frl_rate(dsc_max_frl_rate, &hdmi_dsc->max_lanes,
 					     &hdmi_dsc->max_frl_rate_per_lane);
-			hdmi_dsc->total_chunk_kbytes = hf_vsdb[13] & DRM_EDID_DSC_TOTAL_CHUNK_KBYTES;
+			hdmi_dsc->total_chunk_kbytes = hf_scds[13] & DRM_EDID_DSC_TOTAL_CHUNK_KBYTES;
 
-			dsc_max_slices = hf_vsdb[12] & DRM_EDID_DSC_MAX_SLICES;
+			dsc_max_slices = hf_scds[12] & DRM_EDID_DSC_MAX_SLICES;
 			switch (dsc_max_slices) {
 			case 1:
 				hdmi_dsc->max_slices = 1;
@@ -5243,7 +5244,7 @@ static void drm_parse_hdmi_forum_vsdb(struct drm_connector *connector,
 		}
 	}
 
-	drm_parse_ycbcr420_deep_color_info(connector, hf_vsdb);
+	drm_parse_ycbcr420_deep_color_info(connector, hf_scds);
 }
 
 static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
@@ -5380,7 +5381,7 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 			drm_parse_hdmi_vsdb_video(connector, db);
 		if (cea_db_is_hdmi_forum_vsdb(db) ||
 		    cea_db_is_hdmi_forum_scdb(db))
-			drm_parse_hdmi_forum_vsdb(connector, db);
+			drm_parse_hdmi_forum_scds(connector, db);
 		if (cea_db_is_microsoft_vsdb(db))
 			drm_parse_microsoft_vsdb(connector, db);
 		if (cea_db_is_y420cmdb(db))
-- 
2.30.2

