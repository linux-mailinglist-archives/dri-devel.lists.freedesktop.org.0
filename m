Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AB0898FA8
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 22:34:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C2221134EC;
	Thu,  4 Apr 2024 20:34:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AsmnIwXO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E1961134E9;
 Thu,  4 Apr 2024 20:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712262835; x=1743798835;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eh5gytxsPmMSEELSgCCllBnUyaXZOTX3An9naQL/F1s=;
 b=AsmnIwXO0h+7sNlOZQ6wIyg/Jz9uCtfV6ZqO7/Lzc18DdSx6mJFSohKk
 Y+yQD40JwPA1v+LP4OJurKpbxHiYyoraYspiQWQKdcpe2UD5zalLw0C8U
 btQD1oamwntLOH0jBjwq4HInIOdCFfY4DWTNRwRjaRSUFeViPs1wqmnxM
 2+UEr0PudAmTCWpFX3nD4pgtZkrE1A10tFWAzNvgM0Svq9b3ssEsZO8RG
 V3nQ5eLAMUNgzSTKrUzQodguGl91MtqcJO+4XB3KPr2PkCjY3qPZ0uPDG
 9H2+ibUSWaNx93y24gnz09nfC2I7cSfeCpYeCM281lcAsCc7V6adMHm2O A==;
X-CSE-ConnectionGUID: epIgKzqcRZijaLIbxt4KeA==
X-CSE-MsgGUID: El2f1Gs8QWqKTZwDmwXcgw==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="25019734"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="25019734"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 13:33:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="827790582"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="827790582"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 04 Apr 2024 13:33:53 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 04 Apr 2024 23:33:52 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: [PATCH 05/12] drm/client: Nuke outdated fastboot comment
Date: Thu,  4 Apr 2024 23:33:29 +0300
Message-ID: <20240404203336.10454-6-ville.syrjala@linux.intel.com>
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

Remove the tall tale about fastboot vs. user mode vs.
adjusted mode. crtc->mode == crtc->state->mode, so none
of this makes any sense. I suppose it may have been true
long ago in the past.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_client_modeset.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index 8ef03608b424..cf1de06f99aa 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -690,16 +690,6 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 		/* last resort: use current mode */
 		if (!modes[i]) {
 			/*
-			 * IMPORTANT: We want to use the adjusted mode (i.e.
-			 * after the panel fitter upscaling) as the initial
-			 * config, not the input mode, which is what crtc->mode
-			 * usually contains. But since our current
-			 * code puts a mode derived from the post-pfit timings
-			 * into crtc->mode this works out correctly.
-			 *
-			 * This is crtc->mode and not crtc->state->mode for the
-			 * fastboot check to work correctly.
-			 *
 			 * FIXME using legacy crtc->mode with atomic drivers
 			 * is dodgy. Switch to crtc->state->mode, after taking
 			 * care of the resulting locking/lifetime issues.
-- 
2.43.2

