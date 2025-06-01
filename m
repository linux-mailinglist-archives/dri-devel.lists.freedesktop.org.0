Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71871ACA20B
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 01:33:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F4010E404;
	Sun,  1 Jun 2025 23:33:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FZJP8CPl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E47810E400
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Jun 2025 23:33:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 55B694A64C;
 Sun,  1 Jun 2025 23:33:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA750C4CEEE;
 Sun,  1 Jun 2025 23:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748820784;
 bh=2nRHleqRzl2LUYPthqvJkUKGeYt0sWo8+rtDYATE/kk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FZJP8CPlR9kRTDtaGycCnteXdhoAabdleGn+4yRK3gzzfyTCEcWhPOouubxGnXajM
 LMGqZKvaX7YBerWmYVwno8szCe7F/6HNO/W6joi+622iReq3yBqszAGH1EVFE1pyNu
 6vWlbypYS1qpJmGA9QLU2tGZec5CrWOtrVlaiDMfJ1v4/RxMv+yWZAmwV7uO0/v8kC
 FJQs6N+w4Py2Wu0iL8u0iSgk/q6GzHHWuVuTUo/4/8igmRAX5vaMvP3yLdMICmR/tL
 w/HNKJ0haAzBKyUinJLwgBrjtXxsp+BMmdlNRACyI5fIWO9Z8udaZL45vc37tmi2yo
 Ew/t+0GQ3NaDg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Antonin Godard <antonin.godard@bootlin.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Louis Chauvet <louis.chauvet@bootlin.com>, Sasha Levin <sashal@kernel.org>,
 neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 073/102] drm/panel: simple: Add POWERTIP
 PH128800T004-ZZA01 panel entry
Date: Sun,  1 Jun 2025 19:29:05 -0400
Message-Id: <20250601232937.3510379-73-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601232937.3510379-1-sashal@kernel.org>
References: <20250601232937.3510379-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.9
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

From: Antonin Godard <antonin.godard@bootlin.com>

[ Upstream commit 6374a1005f20c1c2f7bbcc1bc735c2be4910a685 ]

Add support for the POWERTIP PH128800T004-ZZA01 10.1" (1280x800)
LCD-TFT panel. Its panel description is very much like the POWERTIP
PH128800T006-ZHC01 configured below this one, only its timings are
different.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Reviewed-by: Dmitry Baryshkov <lumag@kernel.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20250311-add-powertip-ph128800t004-v1-2-7f95e6984cea@bootlin.com
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

NO This commit should NOT be backported to stable kernel trees based on
the following analysis: **Commit Classification**: This is a new
hardware support addition, not a bug fix. **Analysis of the commit**: 1.
**Nature of Change**: The commit adds support for a brand new panel
variant (POWERTIP PH128800T004-ZZA01) to the panel-simple driver. This
is purely additive functionality for new hardware. 2. **Code Changes
Review**: - Adds a new `powertip_ph128800t004_zza01_mode` structure with
display timing parameters - Adds a new `powertip_ph128800t004_zza01`
panel descriptor - Adds a new device tree compatible string entry in the
`platform_of_match` table - The changes are isolated and only add new
entries without modifying existing functionality 3. **Reference to
Similar Commits**: All the provided historical examples of panel
additions (Similar Commits #1, #2, #5) were marked as "Backport Status:
NO", indicating that new panel support commits are typically not
backported. 4. **Stable Tree Criteria Violation**: - This is new feature
addition, not a bug fix - It doesn't address any existing user-affecting
issues - It enables support for hardware that previously wasn't
supported at all - No indication of fixing broken functionality 5.
**Exception Analysis**: The only similar commit marked "YES" (Similar
Commit #4) was specifically fixing missing display mode flags for an
existing panel, which was a clear bug fix with a "Fixes:" tag. This
current commit has no such characteristics. 6. **Risk Assessment**:
While the change is low-risk and isolated, it doesn't meet the
fundamental criteria for stable backporting as it's new hardware
enablement rather than fixing existing functionality. The stable tree
policy specifically excludes new hardware support unless it fixes
existing broken functionality, which this commit does not do.

 drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index cf9ab2d1f1d2a..8fdc0aba82081 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -3739,6 +3739,32 @@ static const struct panel_desc pda_91_00156_a0  = {
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
 };
 
+static const struct drm_display_mode powertip_ph128800t004_zza01_mode = {
+	.clock = 71150,
+	.hdisplay = 1280,
+	.hsync_start = 1280 + 48,
+	.hsync_end = 1280 + 48 + 32,
+	.htotal = 1280 + 48 + 32 + 80,
+	.vdisplay = 800,
+	.vsync_start = 800 + 9,
+	.vsync_end = 800 + 9 + 8,
+	.vtotal = 800 + 9 + 8 + 6,
+	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
+};
+
+static const struct panel_desc powertip_ph128800t004_zza01 = {
+	.modes = &powertip_ph128800t004_zza01_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 216,
+		.height = 135,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct drm_display_mode powertip_ph128800t006_zhc01_mode = {
 	.clock = 66500,
 	.hdisplay = 1280,
@@ -5090,6 +5116,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "pda,91-00156-a0",
 		.data = &pda_91_00156_a0,
+	}, {
+		.compatible = "powertip,ph128800t004-zza01",
+		.data = &powertip_ph128800t004_zza01,
 	}, {
 		.compatible = "powertip,ph128800t006-zhc01",
 		.data = &powertip_ph128800t006_zhc01,
-- 
2.39.5

