Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1C2898F9D
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 22:33:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AB4A1134E0;
	Thu,  4 Apr 2024 20:33:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RvJcguVt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 458511134DE;
 Thu,  4 Apr 2024 20:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712262826; x=1743798826;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/i/eAOye4vulCbhDSj4FGDeDbZz6eFx5tjohX3y+bzY=;
 b=RvJcguVtfkWur9IWnWgFxuDEIxvsUIxs3rW2+E4Foxd555Drz8JqHdH1
 psaiFltfuSwiMCqSWS4FZYqLGfOVGzjfwVnd5nrpFTq22GBSPPdMmEU1i
 Znxp+W9xPgTKWfbQMyHNTe9Dd7aYrgEy6fD7f9Rx2AJwG2p9eOKDM9TF1
 kzNL6yzNFM/9T25WRND+rQAYYbEgwD3bdN2mEWVj9Tn/fRe0LFPZeDw7m
 iOcE4HbqbhY9LEH/SIatS7/OJBltD+MOtUMN9d66EnXhM790SUH+mHh78
 Im6Wx12r9aon7BhRFolSWQ4gFDOT6F1SokqduPaRYLohG0/WyhRqyDpU8 Q==;
X-CSE-ConnectionGUID: 2hnI3UtHQO69iPx/K1K3QA==
X-CSE-MsgGUID: 7E1oKA3gQICR2bbfQUEdkw==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="25019727"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="25019727"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 13:33:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="827790579"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="827790579"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 04 Apr 2024 13:33:43 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 04 Apr 2024 23:33:43 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: [PATCH 02/12] drm/client:
 s/drm_connector_has_preferred_mode/drm_connector_preferred_mode/
Date: Thu,  4 Apr 2024 23:33:26 +0300
Message-ID: <20240404203336.10454-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240404203336.10454-1-ville.syrjala@linux.intel.com>
References: <20240404203336.10454-1-ville.syrjala@linux.intel.com>
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

Drop the "has" from drm_connector_has_preferred_mode() to better
describe what it does.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_client_modeset.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index 0683a129b362..1c3aeb2dfa57 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -145,7 +145,7 @@ drm_connector_fallback_non_tiled_mode(struct drm_connector *connector)
 }
 
 static struct drm_display_mode *
-drm_connector_has_preferred_mode(struct drm_connector *connector, int width, int height)
+drm_connector_preferred_mode(struct drm_connector *connector, int width, int height)
 {
 	struct drm_display_mode *mode;
 
@@ -434,7 +434,7 @@ static bool drm_client_target_preferred(struct drm_connector **connectors,
 		if (!modes[i]) {
 			DRM_DEBUG_KMS("looking for preferred mode on connector %d %d\n",
 				      connector->base.id, connector->tile_group ? connector->tile_group->id : 0);
-			modes[i] = drm_connector_has_preferred_mode(connector, width, height);
+			modes[i] = drm_connector_preferred_mode(connector, width, height);
 		}
 		/* No preferred modes, pick one off the list */
 		if (!modes[i] && !list_empty(&connector->modes)) {
@@ -522,7 +522,7 @@ static int drm_client_pick_crtcs(struct drm_client_dev *client,
 		my_score++;
 	if (connector->cmdline_mode.specified)
 		my_score++;
-	if (drm_connector_has_preferred_mode(connector, width, height))
+	if (drm_connector_preferred_mode(connector, width, height))
 		my_score++;
 
 	/*
@@ -675,7 +675,7 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 		if (!modes[i]) {
 			DRM_DEBUG_KMS("looking for preferred mode on connector %s %d\n",
 				      connector->name, connector->has_tile);
-			modes[i] = drm_connector_has_preferred_mode(connector, width, height);
+			modes[i] = drm_connector_preferred_mode(connector, width, height);
 		}
 
 		/* No preferred mode marked by the EDID? Are there any modes? */
-- 
2.43.2

