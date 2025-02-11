Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5EDA3002B
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 02:32:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D635910E628;
	Tue, 11 Feb 2025 01:31:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NJlhwGW7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2EAA10E627;
 Tue, 11 Feb 2025 01:31:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9E5DC5C5FE1;
 Tue, 11 Feb 2025 01:31:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 460C9C4CEE5;
 Tue, 11 Feb 2025 01:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739237516;
 bh=9xbyoiiCrVaAK6nAs5sT0F6NPRxlRa3Hr5Y2YELtFug=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NJlhwGW7KXwjdG4rLkI6mgYGMOWoHKfULV+MTwgRjQuVprQQXo20VoV8taLGT/F6H
 0TLJbGSrfQUavLLRrt1J/UYg1DAtrDPitSG3AEkW4E1w9AgghbfihrEYGZuyMyfj0H
 4qHGjVTT9OxybqOt5Q9Cgxl5xfDC1sLbwxwsiFhtQFctBwTdWY7JCIgZhgYSPYSBxI
 9bfqjM6dqBKhmniSVWMEAULgeS7bziLhAwH1dTyMMg38ymRIYvELLGG4KgbC8LyYaT
 jfP/oB37xBB3mlSKd+KEDfJMTVQ0Jon7IGFW0wsJyGM4CZtyIPbsTiWUCW7ZesJ2sa
 xGoDJEf3CM4dA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Tom Chung <chiahsuan.chung@amd.com>, Wayne Lin <wayne.lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch, martin.tsai@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 11/15] Revert "drm/amd/display: Use HW lock mgr
 for PSR1"
Date: Mon, 10 Feb 2025 20:31:31 -0500
Message-Id: <20250211013136.4098219-11-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250211013136.4098219-1-sashal@kernel.org>
References: <20250211013136.4098219-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.76
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

From: Tom Chung <chiahsuan.chung@amd.com>

[ Upstream commit f245b400a223a71d6d5f4c72a2cb9b573a7fc2b6 ]

This reverts commit
a2b5a9956269 ("drm/amd/display: Use HW lock mgr for PSR1")

Because it may cause system hang while connect with two edp panel.

Acked-by: Wayne Lin <wayne.lin@amd.com>
Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c
index f11b071a896f5..2aa0e01a6891b 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c
@@ -63,8 +63,7 @@ void dmub_hw_lock_mgr_inbox0_cmd(struct dc_dmub_srv *dmub_srv,
 
 bool should_use_dmub_lock(struct dc_link *link)
 {
-	if (link->psr_settings.psr_version == DC_PSR_VERSION_SU_1 ||
-	    link->psr_settings.psr_version == DC_PSR_VERSION_1)
+	if (link->psr_settings.psr_version == DC_PSR_VERSION_SU_1)
 		return true;
 	return false;
 }
-- 
2.39.5

