Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 204F3AF9731
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 17:42:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2859710E2B9;
	Fri,  4 Jul 2025 15:42:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA5F110E2B9
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 15:42:32 +0000 (UTC)
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
 by leonov.paulk.fr (Postfix) with ESMTPS id D42631F00036
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 15:42:30 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
 id 609DCACA64E; Fri,  4 Jul 2025 15:42:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on spamassassin
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=RDNS_NONE autolearn=no
 autolearn_force=no version=4.0.0
Received: from localhost.localdomain (unknown [192.168.1.64])
 by laika.paulk.fr (Postfix) with ESMTP id C45BFACA648;
 Fri,  4 Jul 2025 15:41:50 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Samuel Holland <samuel@sholland.org>,
 Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH] drm/sun4i: Cleanup v3s mixer config fields ordering and
 indentation
Date: Fri,  4 Jul 2025 17:41:49 +0200
Message-ID: <20250704154149.3464461-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
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

The v3s mixer config definition is a bit messy. Tidy it up.
No function change is intended.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 8b41d33baa30..674b55f218fc 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -670,12 +670,12 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer1_cfg = {
 };
 
 static const struct sun8i_mixer_cfg sun8i_v3s_mixer_cfg = {
-	.vi_num = 2,
-	.ui_num = 1,
-	.scaler_mask = 0x3,
-	.scanline_yuv = 2048,
-	.ccsc = CCSC_MIXER0_LAYOUT,
-	.mod_rate = 150000000,
+	.ccsc		= CCSC_MIXER0_LAYOUT,
+	.mod_rate	= 150000000,
+	.scaler_mask	= 0x3,
+	.scanline_yuv	= 2048,
+	.ui_num		= 1,
+	.vi_num		= 2,
 };
 
 static const struct sun8i_mixer_cfg sun20i_d1_mixer0_cfg = {
-- 
2.49.0

