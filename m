Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BCA7DCA93
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 11:17:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35AE210E45F;
	Tue, 31 Oct 2023 10:17:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1789310E45B;
 Tue, 31 Oct 2023 10:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698747439; x=1730283439;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DxQWsF5+3/Ph3jHBGJzEzJKA/tcQh1mVHes7E6mHer0=;
 b=ICvORmXu1TJm1WCYMLmd00CUzs78E0cM5Gj2a0vRsGE5jf0nsHTLbuX2
 kvU6LhEcAZ5GvYIEMhN7kjAthD1krUrR8D9r18Hfs+fYUgw3nUP8XKwm4
 9qoyQI+cSspVgwZkU5Nd6njw9u+EVUhez1O4T2MzQ8RWsqJy9iliSmoph
 s0FiquMQMJ2fFvyjzxlLnHvL5iVbtKYsnMfXIJm7IRXVTk/huAZeqBbaz
 ePpjuAMwhFu+1T1uT2cDpfU83vQ5+DM44lplT4KHxnl/VBz0BYAdwwOti
 skYICVl/Ggh1z1z/2go8X+8ACjjiQiETqg+7LwvzSfalmBnZXtQXrYJrG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="454724820"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; d="scan'208";a="454724820"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 03:17:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="789747783"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; d="scan'208";a="789747783"
Received: from moelschl-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.51.45])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 03:17:00 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/6] drm/eld: replace uint8_t with u8
Date: Tue, 31 Oct 2023 12:16:39 +0200
Message-Id: <6e048fc4c8a3ebec638ce27b0b8b969a3d2fa8bc.1698747331.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1698747331.git.jani.nikula@intel.com>
References: <cover.1698747331.git.jani.nikula@intel.com>
MIME-Version: 1.0
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Unify on kernel types.

Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Reviewed-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/drm_eld.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/drm/drm_eld.h b/include/drm/drm_eld.h
index 9bde89bd96ea..7b674256b9aa 100644
--- a/include/drm/drm_eld.h
+++ b/include/drm/drm_eld.h
@@ -70,7 +70,7 @@
  * drm_eld_mnl - Get ELD monitor name length in bytes.
  * @eld: pointer to an eld memory structure with mnl set
  */
-static inline int drm_eld_mnl(const uint8_t *eld)
+static inline int drm_eld_mnl(const u8 *eld)
 {
 	return (eld[DRM_ELD_CEA_EDID_VER_MNL] & DRM_ELD_MNL_MASK) >> DRM_ELD_MNL_SHIFT;
 }
@@ -79,7 +79,7 @@ static inline int drm_eld_mnl(const uint8_t *eld)
  * drm_eld_sad - Get ELD SAD structures.
  * @eld: pointer to an eld memory structure with sad_count set
  */
-static inline const uint8_t *drm_eld_sad(const uint8_t *eld)
+static inline const u8 *drm_eld_sad(const u8 *eld)
 {
 	unsigned int ver, mnl;
 
@@ -98,7 +98,7 @@ static inline const uint8_t *drm_eld_sad(const uint8_t *eld)
  * drm_eld_sad_count - Get ELD SAD count.
  * @eld: pointer to an eld memory structure with sad_count set
  */
-static inline int drm_eld_sad_count(const uint8_t *eld)
+static inline int drm_eld_sad_count(const u8 *eld)
 {
 	return (eld[DRM_ELD_SAD_COUNT_CONN_TYPE] & DRM_ELD_SAD_COUNT_MASK) >>
 		DRM_ELD_SAD_COUNT_SHIFT;
@@ -111,7 +111,7 @@ static inline int drm_eld_sad_count(const uint8_t *eld)
  * This is a helper for determining the payload size of the baseline block, in
  * bytes, for e.g. setting the Baseline_ELD_Len field in the ELD header block.
  */
-static inline int drm_eld_calc_baseline_block_size(const uint8_t *eld)
+static inline int drm_eld_calc_baseline_block_size(const u8 *eld)
 {
 	return DRM_ELD_MONITOR_NAME_STRING - DRM_ELD_HEADER_BLOCK_SIZE +
 		drm_eld_mnl(eld) + drm_eld_sad_count(eld) * 3;
@@ -127,7 +127,7 @@ static inline int drm_eld_calc_baseline_block_size(const uint8_t *eld)
  *
  * The returned value is guaranteed to be a multiple of 4.
  */
-static inline int drm_eld_size(const uint8_t *eld)
+static inline int drm_eld_size(const u8 *eld)
 {
 	return DRM_ELD_HEADER_BLOCK_SIZE + eld[DRM_ELD_BASELINE_ELD_LEN] * 4;
 }
@@ -139,7 +139,7 @@ static inline int drm_eld_size(const uint8_t *eld)
  * The returned value is the speakers mask. User has to use %DRM_ELD_SPEAKER
  * field definitions to identify speakers.
  */
-static inline u8 drm_eld_get_spk_alloc(const uint8_t *eld)
+static inline u8 drm_eld_get_spk_alloc(const u8 *eld)
 {
 	return eld[DRM_ELD_SPEAKER] & DRM_ELD_SPEAKER_MASK;
 }
@@ -151,7 +151,7 @@ static inline u8 drm_eld_get_spk_alloc(const uint8_t *eld)
  * The caller need to use %DRM_ELD_CONN_TYPE_HDMI or %DRM_ELD_CONN_TYPE_DP to
  * identify the display type connected.
  */
-static inline u8 drm_eld_get_conn_type(const uint8_t *eld)
+static inline u8 drm_eld_get_conn_type(const u8 *eld)
 {
 	return eld[DRM_ELD_SAD_COUNT_CONN_TYPE] & DRM_ELD_CONN_TYPE_MASK;
 }
-- 
2.39.2

