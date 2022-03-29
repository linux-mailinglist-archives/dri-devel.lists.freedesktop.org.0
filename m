Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 083694EB38D
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 20:43:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 604C810E8A6;
	Tue, 29 Mar 2022 18:43:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F4F210E8A7;
 Tue, 29 Mar 2022 18:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648579383; x=1680115383;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j4w2x7VTlOWm3C85HcLw4Z4iMsKmMJNxi9NS2aMcyRo=;
 b=cHyBDWOwvg/KhTgocvpDMMzBAR0ZVqy3mCeqedyIWZf0+gKBlxsKy+PV
 ZqNMt2UOWyeMsOXOFy/Cfc3ItdGH1Lf3F9VSq5YC3d7gxnY0IUFpIO9dY
 FCbJnlCCojWoZr+zoTrNX0YOcOa5aJhTUvnSxz4shie1RnJlRH117AIsg
 VPikqHp/rsq3Qq6tosgdwKTpriYin7Q6bh+w4m3R440xNjhyeVg6t9hIE
 nqfl0NEHizU6AMxmve63BhNW3Ln4GNt4Rusr2mOUKK3FB9yhwAfXUuHaZ
 D9FThuFXKDGKF4S96tqdpokzgixiNwx5wTTQbUVVl5aLtuRxZ0RIYK93z Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="259521642"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="259521642"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 11:43:02 -0700
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="519128451"
Received: from dmendyk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.63.121])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 11:43:01 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 08/12] drm/edid: use a better variable name for EDID block
 read retries
Date: Tue, 29 Mar 2022 21:42:15 +0300
Message-Id: <5debef4cc1415504067e4fd69cd7be96f7077e06.1648578814.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1648578814.git.jani.nikula@intel.com>
References: <cover.1648578814.git.jani.nikula@intel.com>
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

Just i is a bit terse, clarify what it's about.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 04eb6949c9c8..235d3cde2e97 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1971,25 +1971,25 @@ static struct edid *drm_do_get_edid_base_block(struct drm_connector *connector,
 	int *null_edid_counter = connector ? &connector->null_edid_counter : NULL;
 	bool *edid_corrupt = connector ? &connector->edid_corrupt : NULL;
 	void *edid;
-	int i;
+	int try;
 
 	edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
 	if (edid == NULL)
 		return NULL;
 
 	/* base block fetch */
-	for (i = 0; i < 4; i++) {
+	for (try = 0; try < 4; try++) {
 		if (get_edid_block(data, edid, 0, EDID_LENGTH))
 			goto out;
 		if (drm_edid_block_valid(edid, 0, false, edid_corrupt))
 			break;
-		if (i == 0 && edid_is_zero(edid, EDID_LENGTH)) {
+		if (try == 0 && edid_is_zero(edid, EDID_LENGTH)) {
 			if (null_edid_counter)
 				(*null_edid_counter)++;
 			goto carp;
 		}
 	}
-	if (i == 4)
+	if (try == 4)
 		goto carp;
 
 	return edid;
@@ -2027,7 +2027,7 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 			      size_t len),
 	void *data)
 {
-	int i, j = 0, valid_extensions = 0;
+	int j, valid_extensions = 0;
 	struct edid *edid, *new, *override;
 
 	override = drm_get_override_edid(connector);
@@ -2050,20 +2050,22 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 
 	for (j = 1; j <= edid->extensions; j++) {
 		void *block = edid + j;
+		int try;
 
-		for (i = 0; i < 4; i++) {
+		for (try = 0; try < 4; try++) {
 			if (get_edid_block(data, block, j, EDID_LENGTH))
 				goto out;
 			if (drm_edid_block_valid(block, j, false, NULL))
 				break;
 		}
 
-		if (i == 4)
+		if (try == 4)
 			valid_extensions--;
 	}
 
 	if (valid_extensions != edid->extensions) {
 		struct edid *base;
+		int i;
 
 		connector_bad_edid(connector, (u8 *)edid, edid->extensions + 1);
 
-- 
2.30.2

