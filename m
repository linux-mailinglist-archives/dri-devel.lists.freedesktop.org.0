Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A82AAA22E
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:56:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CCB210E590;
	Mon,  5 May 2025 22:56:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="f5hel6QX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D28010E592;
 Mon,  5 May 2025 22:56:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B4A935C5AD2;
 Mon,  5 May 2025 22:53:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68A19C4CEED;
 Mon,  5 May 2025 22:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746485771;
 bh=SlTQksXt8m44xfjDoWZQpuTcycqa3I09Ut1LCHhtKF4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=f5hel6QXgPE4a6ftDa1Viv4LdBr3QC6pSL0OI12bIQLqosgB9XX7nG1nY5Iwp32Rk
 x98+H602RMGwbh/AH3zAwb4JnNnCI4SZ1JOxM4dkleZtkk3LPPAuniJyk0UTccmuFi
 3+XcrG7eD5T5yyoA2ysfIHf+2qqy+IBNJ0KeegBUn4vk9n15AVqbC5kxnamXCN27v/
 R+xkI9oueag6RnIx6iZo0HSuI1BdxCjwcVhiUXhHILl+wePSntO1QMyvLGcFIS96vM
 nmvWCpEdpl50gGO1/IjAqjggM8Bz99Z/r0QeJbZtzYB2O2hwP1UcIw37DNWA0Oz4ep
 IsksP2t0e9Y5g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Zhi Wang <zhiw@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Sasha Levin <sashal@kernel.org>, lyude@redhat.com, airlied@gmail.com,
 simona@ffwll.ch, ttabi@nvidia.com, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 475/486] drm/nouveau: fix the broken marco
 GSP_MSG_MAX_SIZE
Date: Mon,  5 May 2025 18:39:11 -0400
Message-Id: <20250505223922.2682012-475-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
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
index 9c83bab0a5309..fc84ca214f247 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -58,7 +58,7 @@
 #include <linux/parser.h>
 
 #define GSP_MSG_MIN_SIZE GSP_PAGE_SIZE
-#define GSP_MSG_MAX_SIZE GSP_PAGE_MIN_SIZE * 16
+#define GSP_MSG_MAX_SIZE (GSP_MSG_MIN_SIZE * 16)
 
 struct r535_gsp_msg {
 	u8 auth_tag_buffer[16];
-- 
2.39.5

