Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBD5A7AAC8
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 21:16:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7162110EAB7;
	Thu,  3 Apr 2025 19:15:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aabU8eKX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 532D310EAB8
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 19:15:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B4817A45A52;
 Thu,  3 Apr 2025 19:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E1B9C4CEE3;
 Thu,  3 Apr 2025 19:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743707756;
 bh=RsSQvyW3QrtSAJP9FCcNN6N/x+TyIyFZQExTiaNbHWM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aabU8eKXa4/EKYkYOBXlQP1pqE86+RQXx3U+ec8Xujoj1A2/0/B7kEmkO7eagjvZf
 1IrptqutgJqtzH8HpGzPlmZr0QgHWcCLkZ4nN+JE6/hUTxsZ/Jhg9t/9HK9tEugCmY
 YHWLgSTvEsfKa4kitl81dibDsZE28Xe21mS2URUOrQ0qYdQbnCOEiznMzB7uJ/ieOR
 DH4+FNwAyZWAXS40okIHgN4WotkKDXBSMRD9Rz2U0wACXcx43yYfHEiUebZ5t0aqXL
 rSvHL+P1qMLN+uXYjAIC/4om+nkKzNdXaAuQh6xG2q+9L5qbBG9q1oiIeWHmTfHVjI
 FuxjdT6zc81Dg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Sasha Levin <sashal@kernel.org>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.13 13/37] drm/debugfs: fix printk format for bridge
 index
Date: Thu,  3 Apr 2025 15:14:49 -0400
Message-Id: <20250403191513.2680235-13-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403191513.2680235-1-sashal@kernel.org>
References: <20250403191513.2680235-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13.9
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

From: Luca Ceresoli <luca.ceresoli@bootlin.com>

[ Upstream commit 72443c730b7a7b5670a921ea928e17b9b99bd934 ]

idx is an unsigned int, use %u for printk-style strings.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Robert Foss <rfoss@kernel.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20250214-drm-assorted-cleanups-v7-1-88ca5827d7af@bootlin.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 536409a35df40..6b2178864c7ee 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -748,7 +748,7 @@ static int bridges_show(struct seq_file *m, void *data)
 	unsigned int idx = 0;
 
 	drm_for_each_bridge_in_chain(encoder, bridge) {
-		drm_printf(&p, "bridge[%d]: %ps\n", idx++, bridge->funcs);
+		drm_printf(&p, "bridge[%u]: %ps\n", idx++, bridge->funcs);
 		drm_printf(&p, "\ttype: [%d] %s\n",
 			   bridge->type,
 			   drm_get_connector_type_name(bridge->type));
-- 
2.39.5

