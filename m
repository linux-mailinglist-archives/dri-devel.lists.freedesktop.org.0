Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC15A1C8FF
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 15:55:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F66210E3D7;
	Sun, 26 Jan 2025 14:55:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZngCTLa3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB5C110E3D5
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 14:54:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EB0F7A40564;
 Sun, 26 Jan 2025 14:53:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6962AC4CEE3;
 Sun, 26 Jan 2025 14:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737903297;
 bh=RsBfB9XUELwfxmqC+WNzDubIQj4UpFq3UOCVQC2ocao=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZngCTLa3tI+QKL0+0OiK7cWVc70hOZ6VINhHhh7TaIyVVSW1/Ob+cTDJNrpZTqPQj
 X88++CvzeYrG8lbK2wX7K5prRoV1Eu7SNfbg7L/qzWWmNZlfmnJehuPsjNNcCCPKLL
 60C2eECMnWxckKU5NEq67gTeHbtJVzWOlBg+Ts63ffPsh3BPd3B/uFrPYzaQ8Ht5US
 YmZ2jC0ooHPyM8SQQLOE59mU2kPJeyxqa5kM0/FIXDxcVYo5zTtGK/DMC2lKQcayPv
 PjbYPJHGEswUtF4w6k8S7r80Wft5ThsrGlTGN6wqIB4XWWGfBB7SizJaDeFqRApP7z
 gM+xQ7hUJExvQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: "Dustin L. Howett" <dustin@howett.net>,
 =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Sasha Levin <sashal@kernel.org>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 04/31] drm: panel-backlight-quirks: Add Framework
 13 glossy and 2.8k panels
Date: Sun, 26 Jan 2025 09:54:20 -0500
Message-Id: <20250126145448.930220-4-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126145448.930220-1-sashal@kernel.org>
References: <20250126145448.930220-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.11
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

