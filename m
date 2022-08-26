Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2C25A3116
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 23:35:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5DA010E6BF;
	Fri, 26 Aug 2022 21:35:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E127E10E67A;
 Fri, 26 Aug 2022 21:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661549712; x=1693085712;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vzjV6RnMuk1xiiGIvqKRgHvcl9T/Jk16mhcYH7c3r5Y=;
 b=lkt7dh/vqHV+f5Kxct1ZMZ9sb53lUEgGijY2Jb5N7zEjoQ/OIPmoO8ma
 JusoiZ7RJQzynuFOIJ+QCBBoY7rrd3ZVVWXRnVEhG12p4ywCwneXyhVvM
 qyMOLuaWRgapGz5i6ittyNZT0zNDxA/nLa2m8mPh2HvEe3ZqvAFXhpB1K
 nx3PBgjDblbMdEqayll4yZ7Q97/nldgS5+iIEe3+SxiYG9EOtXLigxxIi
 x5OmXxfLz3ics87rIk5NU57vTzlMqsSUhf/fF9xj5h7IdNmS5QHwLt+Rm
 5FuaJxAV8Gu8cKZ0uBlk+q4z4VECg2EM+Ot1Gm0qJ7lbV2igNlZASTchU Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10451"; a="274350256"
X-IronPort-AV: E=Sophos;i="5.93,266,1654585200"; d="scan'208";a="274350256"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2022 14:35:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,266,1654585200"; d="scan'208";a="606892807"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga007.jf.intel.com with SMTP; 26 Aug 2022 14:35:08 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Sat, 27 Aug 2022 00:35:07 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 02/11] drm/edid: Clarify why we only accept the "range limits
 only" descriptor
Date: Sat, 27 Aug 2022 00:34:52 +0300
Message-Id: <20220826213501.31490-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220826213501.31490-1-ville.syrjala@linux.intel.com>
References: <20220826213501.31490-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Leo Li <sunpeng.li@amd.com>, intel-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Manasi Navare <manasi.d.navare@intel.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The current comment fails to clarify why we only accept
the "range limits only" variant of the range descriptor.
Reword it to make some actual sense.

Cc: Manasi Navare <manasi.d.navare@intel.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 4005dab6147d..ac662495635c 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6033,10 +6033,13 @@ void get_monitor_range(const struct detailed_timing *timing, void *c)
 		return;
 
 	/*
-	 * Check for flag range limits only. If flag == 1 then
-	 * no additional timing information provided.
-	 * Default GTF, GTF Secondary curve and CVT are not
-	 * supported
+	 * These limits are used to determine the VRR refresh
+	 * rate range. Only the "range limits only" variant
+	 * of the range descriptor seems to guarantee that
+	 * any and all timings are accepted by the sink, as
+	 * opposed to just timings conforming to the indicated
+	 * formula (GTF/GTF2/CVT). Thus other variants of the
+	 * range descriptor are not accepted here.
 	 */
 	if (range->flags != DRM_EDID_RANGE_LIMITS_ONLY_FLAG)
 		return;
-- 
2.35.1

