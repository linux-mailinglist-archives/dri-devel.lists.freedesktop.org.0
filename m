Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E177588DF66
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 13:23:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7C0510FC45;
	Wed, 27 Mar 2024 12:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ucysmjxn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BDED10FC3B;
 Wed, 27 Mar 2024 12:23:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E60AC6151B;
 Wed, 27 Mar 2024 12:23:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8618BC433F1;
 Wed, 27 Mar 2024 12:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711542210;
 bh=Jezw/xRBgYI8qHbWXaCispCdEv9Afz9Zy136j69XMzI=;
 h=From:To:Cc:Subject:Date:From;
 b=ucysmjxn69NCxRP5fufdNjW+vFFQQM0XEndvk2RLy+OgZZ8jLrH5TekuiJc9WR3fK
 y7Lc4GuWXxzfrelhAQyygyDBB7zH0NrfkYQ6oTuhPLwbMlyF7t6yfSedGu4QMewP6v
 LVEOaPXDhgP59ldYsqR0o0imklSaqAHRJV4Q6BlQ/nefMw0CPtgUrYK+gAfZy3FxrL
 CuokdZBXgNSi/jsVYx3DylT4s69SuTzs+kP+jdPieCD9/2MM5xSPb3RPt0im/4sVdk
 7E4179ToAhQtRzT1MbqryZAhtyw1IQCcxSld56uQX3LdOLD9hfdsjM+RMBHxKeckTj
 XiG4uxl/PhHsg==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	allen.pan@amd.com
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Charlene Liu <charlene.liu@amd.com>, Alex Hung <alex.hung@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: FAILED: Patch "drm/amd/display: Add a dc_state NULL check in
 dc_state_release" failed to apply to 5.4-stable tree
Date: Wed, 27 Mar 2024 08:23:28 -0400
Message-ID: <20240327122328.2838554-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
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

The patch below does not apply to the 5.4-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 334b56cea5d9df5989be6cf1a5898114fa70ad98 Mon Sep 17 00:00:00 2001
From: Allen Pan <allen.pan@amd.com>
Date: Fri, 23 Feb 2024 18:20:16 -0500
Subject: [PATCH] drm/amd/display: Add a dc_state NULL check in
 dc_state_release

[How]
Check wheather state is NULL before releasing it.

Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: stable@vger.kernel.org
Reviewed-by: Charlene Liu <charlene.liu@amd.com>
Acked-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Allen Pan <allen.pan@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_state.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_state.c b/drivers/gpu/drm/amd/display/dc/core/dc_state.c
index 180ac47868c22..5cc7f8da209c5 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_state.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_state.c
@@ -334,7 +334,8 @@ static void dc_state_free(struct kref *kref)
 
 void dc_state_release(struct dc_state *state)
 {
-	kref_put(&state->refcount, dc_state_free);
+	if (state != NULL)
+		kref_put(&state->refcount, dc_state_free);
 }
 /*
  * dc_state_add_stream() - Add a new dc_stream_state to a dc_state.
-- 
2.43.0




