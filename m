Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B59A7AB48
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 21:19:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7589410EB18;
	Thu,  3 Apr 2025 19:19:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="I2b8bC29";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0342C10EB18
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 19:19:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 763AD5C66C7;
 Thu,  3 Apr 2025 19:17:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7769C4CEEA;
 Thu,  3 Apr 2025 19:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743707973;
 bh=/m5bVa6TpCzS6RGtpo9/JUJxy4QwEAhGF+KqMsUtHqQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I2b8bC29NSTiYuK4ZiGqphXkRhywPqOLnUwQfL/uNItan2iSkfsNH5UgXv8dYPQ2g
 2iXsjO2LqsgPODC45t+ndM39Y6lCGgCD1GosjeFVT6N3/0BnU23JbwrPfLXNRdIkeR
 UC45rsNHf4DAP7qQpt5rU4NnhIK2ZA34hwso3v3HmwpFid1VkwnxFpP+eg3HNF7iH4
 4rnyRQ27nNONkD6su5uCEpaESwOodjWvAo2a/tcWQxJQLGK9hxOQL6V7RiJ6aBXdrV
 U0vQlbAUsc9nmJKwaQu0JiUX8t+Kw8bIJc5iG8qmj3T/ucA0zt62vDyWvyw3uaGyAs
 Svw84G2STPN/Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Andrew Wyatt <fewtarius@steamfork.org>, John Edwards <uejji@uejji.net>,
 =?UTF-8?q?Jo=C3=A3o=20Pedro=20Kurtz?= <joexkurtz@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Hans de Goede <hdegoede@redhat.com>, Sasha Levin <sashal@kernel.org>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.1 07/20] drm: panel-orientation-quirks: Add quirk
 for OneXPlayer Mini (Intel)
Date: Thu,  3 Apr 2025 15:19:00 -0400
Message-Id: <20250403191913.2681831-7-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403191913.2681831-1-sashal@kernel.org>
References: <20250403191913.2681831-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.132
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

[ Upstream commit b24dcc183583fc360ae0f0899e286a68f46abbd0 ]

The Intel model of the OneXPlayer Mini uses a 1200x1920 portrait LCD panel.
The DMI strings are the same as the OneXPlayer, which already has a DMI
quirk, but the panel is different.

Add a DMI match to correctly rotate this panel.

Signed-off-by: Andrew Wyatt <fewtarius@steamfork.org>
Co-developed-by: John Edwards <uejji@uejji.net>
Signed-off-by: John Edwards <uejji@uejji.net>
Tested-by: João Pedro Kurtz <joexkurtz@gmail.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://patchwork.freedesktop.org/patch/msgid/20250213222455.93533-6-uejji@uejji.net
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 12d547f093bd2..036b095c98882 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -129,6 +129,12 @@ static const struct drm_dmi_panel_orientation_data lcd1080x1920_rightside_up = {
 	.orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
 };
 
+static const struct drm_dmi_panel_orientation_data lcd1200x1920_leftside_up = {
+	.width = 1200,
+	.height = 1920,
+	.orientation = DRM_MODE_PANEL_ORIENTATION_LEFT_UP,
+};
+
 static const struct drm_dmi_panel_orientation_data lcd1200x1920_rightside_up = {
 	.width = 1200,
 	.height = 1920,
@@ -473,6 +479,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONE XPLAYER"),
 		},
 		.driver_data = (void *)&lcd1600x2560_leftside_up,
+	}, {	/* OneXPlayer Mini (Intel) */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK TECHNOLOGY CO., LTD."),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONE XPLAYER"),
+		},
+		.driver_data = (void *)&lcd1200x1920_leftside_up,
 	}, {	/* OrangePi Neo */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "OrangePi"),
-- 
2.39.5

