Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B4B4B6FBB
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 16:28:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B36B010E588;
	Tue, 15 Feb 2022 15:28:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF5610E588;
 Tue, 15 Feb 2022 15:28:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BB990615E6;
 Tue, 15 Feb 2022 15:28:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9D61C340EB;
 Tue, 15 Feb 2022 15:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644938883;
 bh=GN4rx9+/uSWbncndIG5kZ/xPlZ2HAEnyxXgODofDk6w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=m6m4lrGOW+0esOm9S7e2wU04IW+fm74AWmfd2XpnXnwSEBujj/+P1/U6ikf+I82Mt
 QorO8HfCWjWPvClGsGayWD4qVreJUNousXRPNEU1Zvc2BKTlp7Mx0rt2LoMFp9hRLJ
 WQyOs/Yz8Kzy4dTc8D3Rh6SLBstWSSamQWDGaYpqmD27/MuPKKygl+e7UqfuoJjL7n
 4W7LNAph6fnupfbpxw3pMeWPUNtZ5fiSNyuDAHoXZMhHsTxz8QSRCCKTbldxXOD9nW
 1Jeho8MUglVLfw5VyUBHhhi7eBFVtDDSf3bZa2F9Cy1TjoLkEOqshcmpidbngVqAv6
 /a3gL615vSK/w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 29/34] drm/amdgpu: add utcl2_harvest to gc 10.3.1
Date: Tue, 15 Feb 2022 10:26:52 -0500
Message-Id: <20220215152657.580200-29-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215152657.580200-1-sashal@kernel.org>
References: <20220215152657.580200-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Xiaomeng.Hou@amd.com, airlied@linux.ie,
 Oak.Zeng@amd.com, Xinhui.Pan@amd.com, Aaron Liu <aaron.liu@amd.com>,
 amd-gfx@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Aaron Liu <aaron.liu@amd.com>

[ Upstream commit a072312f43c33ea02ad88bff3375f650684a6f24 ]

Confirmed with hardware team, there is harvesting for gc 10.3.1.

Signed-off-by: Aaron Liu <aaron.liu@amd.com>
Reviewed-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c b/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c
index b4eddf6e98a6a..ff738e9725ee8 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c
@@ -543,7 +543,9 @@ static void gfxhub_v2_1_utcl2_harvest(struct amdgpu_device *adev)
 		adev->gfx.config.max_sh_per_se *
 		adev->gfx.config.max_shader_engines);
 
-	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 3, 3)) {
+	switch (adev->ip_versions[GC_HWIP][0]) {
+	case IP_VERSION(10, 3, 1):
+	case IP_VERSION(10, 3, 3):
 		/* Get SA disabled bitmap from eFuse setting */
 		efuse_setting = RREG32_SOC15(GC, 0, mmCC_GC_SA_UNIT_DISABLE);
 		efuse_setting &= CC_GC_SA_UNIT_DISABLE__SA_DISABLE_MASK;
@@ -566,6 +568,9 @@ static void gfxhub_v2_1_utcl2_harvest(struct amdgpu_device *adev)
 		disabled_sa = tmp;
 
 		WREG32_SOC15(GC, 0, mmGCUTCL2_HARVEST_BYPASS_GROUPS_YELLOW_CARP, disabled_sa);
+		break;
+	default:
+		break;
 	}
 }
 
-- 
2.34.1

