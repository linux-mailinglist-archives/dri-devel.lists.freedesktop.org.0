Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DC78D1FD3
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 17:11:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C55D10FADD;
	Tue, 28 May 2024 15:11:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pb+pVNlp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4663010FADD
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 15:11:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 901C761CE2;
 Tue, 28 May 2024 15:11:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11148C4AF0C;
 Tue, 28 May 2024 15:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716909060;
 bh=10mBhbGP5wI6FGotMQGbvTjAThkAnYP2/Z6/ijDpFWg=;
 h=From:To:Cc:Subject:Date:From;
 b=pb+pVNlpjuAw7xP9X1DnxFbpS4/38Uekk2/EujLgAdmw2fsYbeQr/sMcz2NBrLVVC
 29gTZ1NY5FVcpjV5OBsRQ41JmjvGeU+txU5/hjyi/VpbziivgLBzyJMnnP1ZWPg+V5
 eprR1QGIuheAl7bKTVr2oaJfrEW14vzTk/clm/8VEtzfP+BoOKhUUFQyBfFKMFMEm4
 F372tXhQAc8MK/J3a88rWFp4Nc9aalSzULmcgRvpUM3iohsxs7OlSmaTDneQXE+OeW
 WXSTgkUB1lj2lm46ksilN4KCUtmJAvZqhRhJSJvrv6qDMnOu1KogjMugDpZSiW/ma0
 Uu4/phKt87OMg==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/sun4i: Fix compilation error
Date: Tue, 28 May 2024 17:10:56 +0200
Message-ID: <20240528151056.2104153-1-mripard@kernel.org>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
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

Commit ea64761a54a2 ("drm/sun4i: hdmi: Switch to HDMI connector")
introduced a dependency that got renamed in a previous version, but
wasn't properly updated in that driver. Fix the name of the function.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202405282205.EU7NUoeQ-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202405282248.U2lhPvCK-lkp@intel.com/
Fixes: ea64761a54a2 ("drm/sun4i: hdmi: Switch to HDMI connector")
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index 0e652dd480c9..b3649449de30 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -207,13 +207,12 @@ static int sun4i_hdmi_connector_atomic_check(struct drm_connector *connector,
 
 static enum drm_mode_status
 sun4i_hdmi_connector_mode_valid(struct drm_connector *connector,
 				struct drm_display_mode *mode)
 {
-	unsigned long long rate =
-		drm_connector_hdmi_compute_mode_clock(mode, 8,
-						      HDMI_COLORSPACE_RGB);
+	unsigned long long rate = drm_hdmi_compute_mode_clock(mode, 8,
+							      HDMI_COLORSPACE_RGB);
 
 	return sun4i_hdmi_connector_clock_valid(connector, mode, rate);
 }
 
 static int sun4i_hdmi_get_modes(struct drm_connector *connector)
-- 
2.45.0

