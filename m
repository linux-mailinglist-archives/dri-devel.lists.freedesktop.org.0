Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 224C988DE0C
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 13:13:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B66DF10FB31;
	Wed, 27 Mar 2024 12:13:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iB6akFEn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9583910FB24;
 Wed, 27 Mar 2024 12:13:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E69D2CE178E;
 Wed, 27 Mar 2024 12:13:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3ACEC433F1;
 Wed, 27 Mar 2024 12:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711541594;
 bh=3k9Wr46MD3uT08kscaqdDHwaAGEf0STDD/lddHPSoys=;
 h=From:To:Cc:Subject:Date:From;
 b=iB6akFEnUtBFcRT9fPVzQsQd2SgMKkZyZNOOIyQ8g9dTD9fvCzDnWiKuKJzcvPkIq
 yll+Pqyo23cJofpH6ViOzfbx9Mt+wKXXuMEa/AM6Vj5OooUx4uaA7+oZUY8/1C+vAF
 Y9QUCjHe4u4KFQ3lYB4Uph/HEAyU+8VVAWMrgN+dbu1utmMI3O7h6jx/r5S6GAAHsz
 laDgeMGsMhCtz1L5RnD0L5iKeCNqJQJa+SD/sZrv0TitxAen8h0mthmv6PNeyftNmO
 cZaFbDOVKhyZ0HLZ8VkAFx86sQ5QVgWVK5RPTQmmmC/IofdOs/J0bjFu8oaGzEdro0
 UHtAO0B/1e8OA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	allen.pan@amd.com
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Charlene Liu <charlene.liu@amd.com>, Alex Hung <alex.hung@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: FAILED: Patch "drm/amd/display: Add a dc_state NULL check in
 dc_state_release" failed to apply to 6.1-stable tree
Date: Wed, 27 Mar 2024 08:13:11 -0400
Message-ID: <20240327121312.2830127-1-sashal@kernel.org>
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

The patch below does not apply to the 6.1-stable tree.
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




