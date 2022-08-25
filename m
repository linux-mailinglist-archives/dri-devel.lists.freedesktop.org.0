Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 664C75A05F6
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 03:36:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9959D0A55;
	Thu, 25 Aug 2022 01:36:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4765D0996;
 Thu, 25 Aug 2022 01:35:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A510361AC0;
 Thu, 25 Aug 2022 01:35:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0B3DC433D7;
 Thu, 25 Aug 2022 01:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661391351;
 bh=XC0NY0L9hKEaSRA9m9ucx64KeCvrmjDC6f1GpPfHChc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CXPkDdX/kTa0qh1kKaRAB6Vp0JYjp9b2RRJ6Ej+7DTnWHB+J5++mOmk0ykHtyOskk
 uxvsyLgpDBfCFa0dltheri1qW+gIrpaBjDI9px1yPF7ICNzea11keusvQ/X7MtGxwr
 MECfZeVdDPINVCZSzqdhRbwpuopPwBn6pFx4MCDpZ2r88cqBghDzbpL/jjOKMVd3Yj
 8fTZqZ3eFX67pJ4R5maowOhH3+og0pt8XisgG4pYlc+v/Y8BVYeN8ZseVEg2EbAn3m
 ntpqxleuCOqrnbfsY4slmsX+lwIlNXBMkRMgUiYcOLwUXQaDXrJa4mEqjhL1xPPYIB
 gUKTZNucFpH7A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 21/38] drm/amdgpu: disable 3DCGCG/CGLS
 temporarily due to stability issue
Date: Wed, 24 Aug 2022 21:33:44 -0400
Message-Id: <20220825013401.22096-21-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220825013401.22096-1-sashal@kernel.org>
References: <20220825013401.22096-1-sashal@kernel.org>
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
 airlied@linux.ie, leo.liu@amd.com, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, sonny.jiang@amd.com, Stanley.Yang@amd.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Likun.Gao@amd.com, Evan Quan <evan.quan@amd.com>, kenneth.feng@amd.com,
 christian.koenig@amd.com, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Evan Quan <evan.quan@amd.com>

[ Upstream commit 1b586595df6d04c27088ef348b8202204ce26d45 ]

Some stability issues were reported with these features.

Signed-off-by: Evan Quan <evan.quan@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/soc21.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/soc21.c b/drivers/gpu/drm/amd/amdgpu/soc21.c
index 9e18a2b22607..8d5c452a9100 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc21.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc21.c
@@ -530,8 +530,10 @@ static int soc21_common_early_init(void *handle)
 	case IP_VERSION(11, 0, 0):
 		adev->cg_flags = AMD_CG_SUPPORT_GFX_CGCG |
 			AMD_CG_SUPPORT_GFX_CGLS |
+#if 0
 			AMD_CG_SUPPORT_GFX_3D_CGCG |
 			AMD_CG_SUPPORT_GFX_3D_CGLS |
+#endif
 			AMD_CG_SUPPORT_GFX_MGCG |
 			AMD_CG_SUPPORT_REPEATER_FGCG |
 			AMD_CG_SUPPORT_GFX_FGCG |
-- 
2.35.1

