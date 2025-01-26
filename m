Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D62EBA1C8C2
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 15:53:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 444D710E38A;
	Sun, 26 Jan 2025 14:53:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RqlUgZEv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AADF10E38A
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 14:53:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A04375C5FCC;
 Sun, 26 Jan 2025 14:52:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A5BBC4CEE4;
 Sun, 26 Jan 2025 14:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737903206;
 bh=RsBfB9XUELwfxmqC+WNzDubIQj4UpFq3UOCVQC2ocao=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RqlUgZEvhf0f5p72WrmUorgEPVWDz/9aYnLiGhBVxRTD49mRVBnoTHs9cRDg9mJXf
 44Mr39MHRL0yFukPO/bHkEm3eHPjsSbjleHbDzX7RrZQN9txm15viMr9ZAgj4DSEnf
 1B1RcG4J1nCPMriqeZhLKSZlGxK2p6L9H0Kj5dnkQgo9bR3az1D1ZtHDTMiP2ptF2F
 PVaKoqSrElbGzI8tXOHH/eE9AzWWg/BTDWJiUHN+ZKXHs7mLqLawvh3VDj6gys7kHQ
 2hX4S7twVSx3SbKzxAcVI83c0GwOIgU6u5gsb+y0QJ8F7VAJr5mxy91QmCqoldoyU/
 Eg4yUmiRqS/5w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: "Dustin L. Howett" <dustin@howett.net>,
 =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Sasha Levin <sashal@kernel.org>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.13 05/34] drm: panel-backlight-quirks: Add Framework
 13 glossy and 2.8k panels
Date: Sun, 26 Jan 2025 09:52:41 -0500
Message-Id: <20250126145310.926311-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126145310.926311-1-sashal@kernel.org>
References: <20250126145310.926311-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13
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

From: "Dustin L. Howett" <dustin@howett.net>

[ Upstream commit d80b5c5b9be6b2e1cdeaaeaa8259523b63cae292 ]

I have tested these panels on the Framework Laptop 13 AMD with firmware
revision 3.05 (latest at time of submission).

Signed-off-by: Dustin L. Howett <dustin@howett.net>
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20241111-amdgpu-min-backlight-quirk-v7-4-f662851fda69@weissschuh.net
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_panel_backlight_quirks.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_backlight_quirks.c b/drivers/gpu/drm/drm_panel_backlight_quirks.c
index f2aefff618ddb..c477d98ade2b4 100644
--- a/drivers/gpu/drm/drm_panel_backlight_quirks.c
+++ b/drivers/gpu/drm/drm_panel_backlight_quirks.c
@@ -25,6 +25,22 @@ static const struct drm_panel_min_backlight_quirk drm_panel_min_backlight_quirks
 		.ident.name = "NE135FBM-N41",
 		.min_brightness = 0,
 	},
+	/* 13 inch glossy panel */
+	{
+		.dmi_match.field = DMI_BOARD_VENDOR,
+		.dmi_match.value = "Framework",
+		.ident.panel_id = drm_edid_encode_panel_id('B', 'O', 'E', 0x095f),
+		.ident.name = "NE135FBM-N41",
+		.min_brightness = 0,
+	},
+	/* 13 inch 2.8k panel */
+	{
+		.dmi_match.field = DMI_BOARD_VENDOR,
+		.dmi_match.value = "Framework",
+		.ident.panel_id = drm_edid_encode_panel_id('B', 'O', 'E', 0x0cb4),
+		.ident.name = "NE135A1M-NY1",
+		.min_brightness = 0,
+	},
 };
 
 static bool drm_panel_min_backlight_quirk_matches(const struct drm_panel_min_backlight_quirk *quirk,
-- 
2.39.5

