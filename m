Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8665D4EE0EC
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 20:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5556210F46E;
	Thu, 31 Mar 2022 18:45:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A70A910F47A;
 Thu, 31 Mar 2022 18:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648752350; x=1680288350;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=isZl+MR3o3zWmhn2UYTRYJk2sRXlfqYc7qnVRKbzN1k=;
 b=kyZsU4hG427Mm40s5W+nlDNGwkDiGBKG5knB2bwWd/wRnQzgvXHqOs7/
 8Ueilt6qW6D9rC0AxN6SFPe4eszJVudhDMkb8rnAvhSZqCTDT+U3pz5YQ
 snTx++h91K/CmDdAY7Mdg75ZJAYjGnGEENrL0VUooOEZyVbQU3mitmSIY
 sWDiQfaZwYoVyIhyPDm9VxiLIZi8djjyxtMniK5KM1upflmLD6xgKTAGy
 buZU19cclz/7k/BbVttZwBgcbK23BRm6qeY5c2hBYV3BceEGaWfX2cAb0
 +iY9RTpEIjposiaDISdqP1eBrdP+dbt9XpsY2uIkil2kl1SzsFl8B4v3m Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="320615404"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="320615404"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 11:45:50 -0700
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="503865286"
Received: from gluca-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.48.194])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 11:45:48 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 08/12] drm/edid: use a better variable name for EDID block
 read retries
Date: Thu, 31 Mar 2022 21:45:05 +0300
Message-Id: <9c95c01445f5735332cbbd9eae6cd078e152050f.1648752228.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1648752228.git.jani.nikula@intel.com>
References: <cover.1648752228.git.jani.nikula@intel.com>
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
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 9e747145938b..a967e6e65ab5 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1973,25 +1973,25 @@ static struct edid *drm_do_get_edid_base_block(struct drm_connector *connector,
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
@@ -2029,7 +2029,7 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 			      size_t len),
 	void *data)
 {
-	int i, j = 0, valid_extensions = 0;
+	int j, valid_extensions = 0;
 	struct edid *edid, *new, *override;
 
 	override = drm_get_override_edid(connector);
@@ -2052,20 +2052,22 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 
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
 		struct edid *dest_block;
+		int i;
 
 		connector_bad_edid(connector, (u8 *)edid, edid->extensions + 1);
 
-- 
2.30.2

