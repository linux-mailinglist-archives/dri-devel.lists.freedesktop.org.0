Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91142690677
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 12:17:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF8AD10E9AA;
	Thu,  9 Feb 2023 11:17:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC60E10E9A9;
 Thu,  9 Feb 2023 11:17:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6A776619E8;
 Thu,  9 Feb 2023 11:17:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 068DDC4339C;
 Thu,  9 Feb 2023 11:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675941438;
 bh=R3HKuJABYKwoQftJOBb4X6UcJr6mq7bO3rodLXAVxCs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Az5LBkCMyX+jLOXAZYoFi0zkgcIkA/VhOscoai1zL7uFClaFrRGO/n+vCp9DIO8rM
 oBIfODh1eKlnr8y0L3kI7zUsl0lElwDbtLYhdhyn5XxGPd8WsZVqbhLoKySMFGJqqW
 GzS4EI5N5b8osSBGv9sMPiayrNT/tSCQepMckswIKl6pe/KdcRfE0xwasWmKgRJfTT
 X7FiNFquVCuUA1r6kMoYurRIQMtiQkH7XjLcurxmiYTeMFdo4KRg5x2sxfW0IyDzTh
 cbE5fY9RO7ECK8WkjpWvi+P8YMLZJdG4aLKdDz6Rw2xZpAmgKKitmu/Uj+93xd1evh
 EETOKomhjWIwg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 33/38] drm/amdgpu: enable HDP SD for gfx 11.0.3
Date: Thu,  9 Feb 2023 06:14:52 -0500
Message-Id: <20230209111459.1891941-33-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230209111459.1891941-1-sashal@kernel.org>
References: <20230209111459.1891941-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, tim.huang@amd.com, James.Zhu@amd.com,
 yiqing.yao@amd.com, Feifei Xu <Feifei.Xu@amd.com>, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, sonny.jiang@amd.com, Stanley.Yang@amd.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 kenneth.feng@amd.com, Likun.Gao@amd.com, Evan Quan <evan.quan@amd.com>,
 christian.koenig@amd.com, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Evan Quan <evan.quan@amd.com>

[ Upstream commit bb25849c0fa550b26cecc9c476c519a927c66898 ]

Enable HDP clock gating control for gfx 11.0.3.

Signed-off-by: Evan Quan <evan.quan@amd.com>
Reviewed-by: Feifei Xu <Feifei.Xu@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/soc21.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/soc21.c b/drivers/gpu/drm/amd/amdgpu/soc21.c
index 9bc9852b9cda9..230e15fed755c 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc21.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc21.c
@@ -643,7 +643,8 @@ static int soc21_common_early_init(void *handle)
 			AMD_CG_SUPPORT_GFX_CGCG |
 			AMD_CG_SUPPORT_GFX_CGLS |
 			AMD_CG_SUPPORT_REPEATER_FGCG |
-			AMD_CG_SUPPORT_GFX_MGCG;
+			AMD_CG_SUPPORT_GFX_MGCG |
+			AMD_CG_SUPPORT_HDP_SD;
 		adev->pg_flags = AMD_PG_SUPPORT_VCN |
 			AMD_PG_SUPPORT_VCN_DPG |
 			AMD_PG_SUPPORT_JPEG;
-- 
2.39.0

