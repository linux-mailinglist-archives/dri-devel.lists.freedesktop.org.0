Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD7A40C764
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 16:23:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14DD96E158;
	Wed, 15 Sep 2021 14:23:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC136E158
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 14:23:18 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="209422536"
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="209422536"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 07:23:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="610196078"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga001.fm.intel.com with SMTP; 15 Sep 2021 07:23:01 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 15 Sep 2021 17:23:00 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: Fix scaling_mode docs
Date: Wed, 15 Sep 2021 17:23:00 +0300
Message-Id: <20210915142300.15631-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.32.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Fix the bad copy-pasta in the scaling_mode docs.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_connector.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index e0a30e0ee86a..3bc782b630b9 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1620,7 +1620,7 @@ EXPORT_SYMBOL(drm_mode_create_tv_properties);
  * connectors.
  *
  * Atomic drivers should use drm_connector_attach_scaling_mode_property()
- * instead to correctly assign &drm_connector_state.picture_aspect_ratio
+ * instead to correctly assign &drm_connector_state.scaling_mode
  * in the atomic state.
  */
 int drm_mode_create_scaling_mode_property(struct drm_device *dev)
@@ -1740,7 +1740,7 @@ EXPORT_SYMBOL(drm_connector_attach_vrr_capable_property);
  * @scaling_mode_mask: or'ed mask of BIT(%DRM_MODE_SCALE_\*).
  *
  * This is used to add support for scaling mode to atomic drivers.
- * The scaling mode will be set to &drm_connector_state.picture_aspect_ratio
+ * The scaling mode will be set to &drm_connector_state.scaling_mode
  * and can be used from &drm_connector_helper_funcs->atomic_check for validation.
  *
  * This is the atomic version of drm_mode_create_scaling_mode_property().
-- 
2.32.0

