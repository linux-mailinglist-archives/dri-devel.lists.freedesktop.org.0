Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28192A7AAF9
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 21:17:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2145510EADE;
	Thu,  3 Apr 2025 19:17:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hDynNGmi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 159F110EADE
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 19:17:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7D73A614BA;
 Thu,  3 Apr 2025 19:17:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0F95C4CEE3;
 Thu,  3 Apr 2025 19:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743707845;
 bh=XmkNPLT5Lhcti9jG+lBjspxrlWMRLk3OLBBVrU8VG0c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hDynNGmipv/2sl7VniVGbuVTL4VaA2qv+TltrW6KQ6/QGfBnLFaFNgoNikzorq+TL
 lgNGvvSp1fyGRCpdHnaYb+Xjip9ILhhzDSfyamrYLFvP12Gtz4K+Zg+I1Lnsbt8vzm
 IjgkVJ/tievmgDV28j1WJGDAKTgZ7YNGuKmTlhlKkVoVxh84RUk1lCxn4TLXwv5m4a
 tHv7bwP5aYGSV0+JzrnbrSpA0CDLyebgCOL1/7offKL04k5r1crmpS1S+MKUVfy3Iq
 poyAInJCRHwPOPxPqg2gPns96z/Us9+d/ABg7R0lryHFUa3TVMBVM4FSijHnpxVaGu
 4ZK/3sMBplKow==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Andrew Wyatt <fewtarius@steamfork.org>, John Edwards <uejji@uejji.net>,
 Paco Avelar <pacoavelar@hotmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Hans de Goede <hdegoede@redhat.com>, Sasha Levin <sashal@kernel.org>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 07/33] drm: panel-orientation-quirks: Add quirks
 for AYA NEO Flip DS and KB
Date: Thu,  3 Apr 2025 15:16:30 -0400
Message-Id: <20250403191656.2680995-7-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403191656.2680995-1-sashal@kernel.org>
References: <20250403191656.2680995-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.21
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

From: Andrew Wyatt <fewtarius@steamfork.org>

[ Upstream commit 529741c331da1fbf54f86c6ec3a4558b9b0b16dc ]

The AYA NEO Flip DS and KB both use a 1080x1920 portrait LCD panel.  The
Flip DS additionally uses a 640x960 portrait LCD panel as a second display.

Add DMI matches to correctly rotate these panels.

Signed-off-by: Andrew Wyatt <fewtarius@steamfork.org>
Co-developed-by: John Edwards <uejji@uejji.net>
Signed-off-by: John Edwards <uejji@uejji.net>
Tested-by: Paco Avelar <pacoavelar@hotmail.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://patchwork.freedesktop.org/patch/msgid/20250213222455.93533-3-uejji@uejji.net
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index f9c975338fc9e..b5f6ae0459459 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -93,6 +93,12 @@ static const struct drm_dmi_panel_orientation_data onegx1_pro = {
 	.orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
 };
 
+static const struct drm_dmi_panel_orientation_data lcd640x960_leftside_up = {
+	.width = 640,
+	.height = 960,
+	.orientation = DRM_MODE_PANEL_ORIENTATION_LEFT_UP,
+};
+
 static const struct drm_dmi_panel_orientation_data lcd720x1280_rightside_up = {
 	.width = 720,
 	.height = 1280,
@@ -202,6 +208,18 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_MATCH(DMI_PRODUCT_NAME, "AIR"),
 		},
 		.driver_data = (void *)&lcd1080x1920_leftside_up,
+	}, {    /* AYA NEO Flip DS Bottom Screen */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYANEO"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "FLIP DS"),
+		},
+		.driver_data = (void *)&lcd640x960_leftside_up,
+	}, {    /* AYA NEO Flip KB/DS Top Screen */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYANEO"),
+		  DMI_MATCH(DMI_PRODUCT_NAME, "FLIP"),
+		},
+		.driver_data = (void *)&lcd1080x1920_leftside_up,
 	}, {	/* AYA NEO Founder */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYA NEO"),
-- 
2.39.5

