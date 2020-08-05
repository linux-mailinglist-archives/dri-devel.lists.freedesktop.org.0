Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7364D23CAA7
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 14:42:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42ACE6E5AB;
	Wed,  5 Aug 2020 12:42:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 771BA6E5AB
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 12:42:29 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1k3IkV-0004vS-Cw; Wed, 05 Aug 2020 12:42:27 +0000
From: Colin King <colin.king@canonical.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/gma500: fix spelling mistake "pannel" -> "panel"
Date: Wed,  5 Aug 2020 13:42:27 +0100
Message-Id: <20200805124227.20005-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Colin Ian King <colin.king@canonical.com>

There a handful of spelling mistakes. fix them.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/gma500/mdfld_dsi_output.c | 4 ++--
 drivers/gpu/drm/gma500/psb_intel_sdvo.c   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/gma500/mdfld_dsi_output.c b/drivers/gpu/drm/gma500/mdfld_dsi_output.c
index f350ac1ead18..2f3486f32fed 100644
--- a/drivers/gpu/drm/gma500/mdfld_dsi_output.c
+++ b/drivers/gpu/drm/gma500/mdfld_dsi_output.c
@@ -366,7 +366,7 @@ static enum drm_mode_status mdfld_dsi_connector_mode_valid(struct drm_connector
 	/**
 	 * FIXME: current DC has no fitting unit, reject any mode setting
 	 * request
-	 * Will figure out a way to do up-scaling(pannel fitting) later.
+	 * Will figure out a way to do up-scaling(panel fitting) later.
 	 **/
 	if (fixed_mode) {
 		if (mode->hdisplay != fixed_mode->hdisplay)
@@ -531,7 +531,7 @@ void mdfld_dsi_output_init(struct drm_device *dev,
 	dsi_config->connector = dsi_connector;
 
 	if (!dsi_config->fixed_mode) {
-		DRM_ERROR("No pannel fixed mode was found\n");
+		DRM_ERROR("No panel fixed mode was found\n");
 		goto dsi_init_err0;
 	}
 
diff --git a/drivers/gpu/drm/gma500/psb_intel_sdvo.c b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
index 06e44f47e73e..907f966d6f22 100644
--- a/drivers/gpu/drm/gma500/psb_intel_sdvo.c
+++ b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
@@ -125,7 +125,7 @@ struct psb_intel_sdvo {
 	bool is_lvds;
 
 	/**
-	 * This is sdvo fixed pannel mode pointer
+	 * This is sdvo fixed panel mode pointer
 	 */
 	struct drm_display_mode *sdvo_lvds_fixed_mode;
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
