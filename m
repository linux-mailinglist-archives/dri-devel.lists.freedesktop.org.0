Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF603AA9F68
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:23:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E5B10E45E;
	Mon,  5 May 2025 22:23:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QVOvBsAt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E6710E45F;
 Mon,  5 May 2025 22:23:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DB5C5A4CCF1;
 Mon,  5 May 2025 22:17:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC830C4CEEF;
 Mon,  5 May 2025 22:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746483792;
 bh=HBJx4tgknO3q8nVzeQsulOIFELLP0vgjGMS2diT3WdE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QVOvBsAt+aAdgVxkzlP8RQD4kgq4ANBF6B9PneC80f6TQT1KC9CRZXG9v1Pz+m+vb
 2w8yU/HiKBGZjs6ea5kCOeH00S2ftfXYNOagqh2yATvHkc0KG5ZpKlmRt2vzK0vGrF
 SuLNONJtgvERuX5B/51TVC/z2ESJwmRuO4rcx5Ce5FO5aFwzc900LfQ5h/qQJ5DIbE
 JJGiASrw4k0+KHLqltV6qr+ClYfHLiT8pXREd9JZ72w0IPaogx2Qkp/R2nF7LSz7Nr
 6PL6IcgjLtZ7bb54b1I0hCWHtR6oUTDGB6lyRlK4aDLhACgbtqb3OXskUTP1Z7rAxt
 YV6U8/Jedsfnw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alex Sierra <alex.sierra@amd.com>,
 Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>,
 Amber Lin <Amber.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Sasha Levin <sashal@kernel.org>, Felix.Kuehling@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 220/642] drm/amdkfd: clear F8_MODE for gfx950
Date: Mon,  5 May 2025 18:07:16 -0400
Message-Id: <20250505221419.2672473-220-sashal@kernel.org>
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

From: Alex Sierra <alex.sierra@amd.com>

[ Upstream commit 59228c6631f902fa826dc61321ab377ba8aadec5 ]

Default F8_MODE should be OCP format on gfx950.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Reviewed-by: Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>
Signed-off-by: Amber Lin <Amber.Lin@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v9.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v9.c
index c734eb9b505f8..3264509408bc8 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v9.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v9.c
@@ -98,8 +98,7 @@ static int update_qpd_v9(struct device_queue_manager *dqm,
 			qpd->sh_mem_config |= 1 << SH_MEM_CONFIG__RETRY_DISABLE__SHIFT;
 
 		if (KFD_GC_VERSION(dqm->dev->kfd) == IP_VERSION(9, 4, 3) ||
-		    KFD_GC_VERSION(dqm->dev->kfd) == IP_VERSION(9, 4, 4) ||
-		    KFD_GC_VERSION(dqm->dev->kfd) == IP_VERSION(9, 5, 0))
+		    KFD_GC_VERSION(dqm->dev->kfd) == IP_VERSION(9, 4, 4))
 			qpd->sh_mem_config |=
 				(1 << SH_MEM_CONFIG__F8_MODE__SHIFT);
 
-- 
2.39.5

