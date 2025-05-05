Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFE3AAA0A8
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:38:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2226E10E4EC;
	Mon,  5 May 2025 22:38:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cmNhzzf0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A1C410E4EE;
 Mon,  5 May 2025 22:38:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4D863450C3;
 Mon,  5 May 2025 22:37:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA3F0C4CEE4;
 Mon,  5 May 2025 22:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746484681;
 bh=sFy+V0bk4z2DlSuJsUd5HnI9H7emle+TTChKsuH8Nsk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cmNhzzf0LHoWRUshjY3HlX0PRieb8n7OOHZZ50Y9ZzXQGjbgXYO7ZC7n7s1xCMA6C
 rKiYYwrudtuVucefQoGZaIGwiT7mbv2vdtNEES63Pt7YCTHdJyP0IVFV5L6sTYAyOb
 jmi1IbQAAZD7+qxa38sSCIgNukXugO3Mq0Eusj2BIcd527eIHVaSZJhE2K6I4WeSo2
 mJ/gvMGK6xiyaLoJpd008IItGgHkeXEPcw2UIcI65tfZEI9Erq4vC2UNELPrucd0Vt
 0suJ4vZXDqGRKrZ+E8FJu0V0FqZTU0YbyEZx1pt1zUgE2RuyK8pqQQxVln1GOLApWa
 FxA6mmy/CgyqQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Zhi Wang <zhiw@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Sasha Levin <sashal@kernel.org>, lyude@redhat.com, airlied@gmail.com,
 simona@ffwll.ch, ttabi@nvidia.com, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 603/642] drm/nouveau: fix the broken marco
 GSP_MSG_MAX_SIZE
Date: Mon,  5 May 2025 18:13:39 -0400
Message-Id: <20250505221419.2672473-603-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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

From: Zhi Wang <zhiw@nvidia.com>

[ Upstream commit bbae6680cfe38b033250b483722e60ccd865976f ]

The macro GSP_MSG_MAX_SIZE refers to another macro that doesn't exist.
It represents the max GSP message element size.

Fix the broken marco so it can be used to replace some magic numbers in
the code.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20250124182958.2040494-8-zhiw@nvidia.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 58502102926b6..bb86b6d4ca49e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -61,7 +61,7 @@
 extern struct dentry *nouveau_debugfs_root;
 
 #define GSP_MSG_MIN_SIZE GSP_PAGE_SIZE
-#define GSP_MSG_MAX_SIZE GSP_PAGE_MIN_SIZE * 16
+#define GSP_MSG_MAX_SIZE (GSP_MSG_MIN_SIZE * 16)
 
 struct r535_gsp_msg {
 	u8 auth_tag_buffer[16];
-- 
2.39.5

