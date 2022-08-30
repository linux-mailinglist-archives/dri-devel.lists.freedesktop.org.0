Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5975A6A1D
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 19:26:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7DB710E2A3;
	Tue, 30 Aug 2022 17:26:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF9A10E29C;
 Tue, 30 Aug 2022 17:25:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A8618B81D24;
 Tue, 30 Aug 2022 17:25:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAE22C433C1;
 Tue, 30 Aug 2022 17:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661880340;
 bh=LhMRPfK7UasEqG4OE4oQclpIUn/hzO8YS1HbMLVxpfs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=L49kWHNIqkjlnMawdOM09vuN0KEKZ3Yk4HkM+QCw/WNEj4/oxAWYE8x5VsA7R5v0z
 EdmMWZQ2bXpag7d+st0PtSD2nfjgKKPlj4xM6sJ0t778q1gKpq4iwqDqEgiBWBiVK7
 670JAAEEJoc+kD5CNjc1/a7vAKP3KoaQQ6muO9HojNhTmgEwJES9BcMPbHk7sxizry
 Em3vAqrT1it5xIwLHlxQGjrbREjJJukukFj879rmW1NKI9GlchO+UqD+T/nhWQjtpv
 MI5pzfuG6Fvc9XXa+KhUCxGifdvlJBfrTEM9zofn8GvL8emb4ZPqf9Mf1HKRB1Wauu
 sFzEEX+DcZ1fA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 12/12] drm/amdgpu: mmVM_L2_CNTL3 register not
 initialized correctly
Date: Tue, 30 Aug 2022 13:24:43 -0400
Message-Id: <20220830172444.581654-12-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220830172444.581654-1-sashal@kernel.org>
References: <20220830172444.581654-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 guchun.chen@amd.com, airlied@linux.ie, Qu Huang <jinsdb@126.com>,
 Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org, YiPeng.Chai@amd.com,
 mario.limonciello@amd.com, Alex Deucher <alexander.deucher@amd.com>,
 evan.quan@amd.com, christian.koenig@amd.com, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Qu Huang <jinsdb@126.com>

[ Upstream commit b8983d42524f10ac6bf35bbce6a7cc8e45f61e04 ]

The mmVM_L2_CNTL3 register is not assigned an initial value

Signed-off-by: Qu Huang <jinsdb@126.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c
index 641f1258f08dc..e60157fe7a7bf 100644
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c
@@ -182,6 +182,7 @@ static void mmhub_v1_0_init_cache_regs(struct amdgpu_device *adev)
 	tmp = REG_SET_FIELD(tmp, VM_L2_CNTL2, INVALIDATE_L2_CACHE, 1);
 	WREG32_SOC15(MMHUB, 0, mmVM_L2_CNTL2, tmp);
 
+	tmp = mmVM_L2_CNTL3_DEFAULT;
 	if (adev->gmc.translate_further) {
 		tmp = REG_SET_FIELD(tmp, VM_L2_CNTL3, BANK_SELECT, 12);
 		tmp = REG_SET_FIELD(tmp, VM_L2_CNTL3,
-- 
2.35.1

