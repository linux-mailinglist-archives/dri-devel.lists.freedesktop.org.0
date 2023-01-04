Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E37165D037
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 11:06:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F76A10E542;
	Wed,  4 Jan 2023 10:06:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8128C10E539;
 Wed,  4 Jan 2023 10:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672826770; x=1704362770;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2zNmRynlriCZ6WegIoH2TNtlX5hAdpoZQW77Z+3AC2o=;
 b=lOmGTypfgKE/NfMDRoZQRO9a1zamES039LbwsHcfhc19YoOyNX9Z3HxK
 XYI/xqSSmmuYmFk6Dx3pC8Ljd/tDqhCWpmgfV8E8SmrqBOxILXt5TDM8L
 pBxtp3HFq8lctvE4eWiU2MuW8A9WaDfvSAnM+Jxgay14bYHZL85YkB3x6
 7D5ul69fCKRy2ZGE0pC01G37LTdefWCg2roReTH4q2sZTWpCgyBnwvSVY
 H4TZFbroEPg6xpTYdeWImgGnpcTVUSWLvX0au+TWg28F/uB1lJzSBDgSa
 +amaqlWwG9Q9yC5ueZsqY7aBSdyK92dYR66xRt8CuCYGZk9XuHFpqyUQ2 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="301588729"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; d="scan'208";a="301588729"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 02:06:10 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="762627567"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; d="scan'208";a="762627567"
Received: from mkabdel-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.25.63])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 02:06:08 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 06/22] drm/edid: rename struct drm_display_info *display to
 *info
Date: Wed,  4 Jan 2023 12:05:21 +0200
Message-Id: <d35a50c714e21869afcabfafd5c5e590936b791a.1672826282.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1672826282.git.jani.nikula@intel.com>
References: <cover.1672826282.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rename the local variable to info for consistency.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 3dfcd6450f10..4e9108e9fc96 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6011,14 +6011,14 @@ static void drm_parse_dsc_info(struct drm_hdmi_dsc_cap *hdmi_dsc,
 static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
 				      const u8 *hf_scds)
 {
-	struct drm_display_info *display = &connector->display_info;
-	struct drm_hdmi_info *hdmi = &display->hdmi;
+	struct drm_display_info *info = &connector->display_info;
+	struct drm_hdmi_info *hdmi = &info->hdmi;
 	struct drm_hdmi_dsc_cap *hdmi_dsc = &hdmi->dsc_cap;
 	int max_tmds_clock = 0;
 	u8 max_frl_rate = 0;
 	bool dsc_support = false;
 
-	display->has_hdmi_infoframe = true;
+	info->has_hdmi_infoframe = true;
 
 	if (hf_scds[6] & 0x80) {
 		hdmi->scdc.supported = true;
@@ -6042,7 +6042,7 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
 		max_tmds_clock = hf_scds[5] * 5000;
 
 		if (max_tmds_clock > 340000) {
-			display->max_tmds_clock = max_tmds_clock;
+			info->max_tmds_clock = max_tmds_clock;
 		}
 
 		if (scdc->supported) {
-- 
2.34.1

