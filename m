Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5237E15E229
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 17:22:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A2276FB1E;
	Fri, 14 Feb 2020 16:22:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 492106FB15;
 Fri, 14 Feb 2020 16:22:17 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 450582473C;
 Fri, 14 Feb 2020 16:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581697337;
 bh=9Et37cIllYVrbRLcETJX4azs8dFhX5iB0xAVVervu7w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=blYfuMWmBX0zgWuVBBwNNJXmI2rvRGlrCe3odFDW/HlGilg5yINUMtkgHjzh4jsyn
 poLC3kbCAZHItmw+XM+Q0sOFMxEkA9qaa01VvUOtzNoqNnIptudEUo0peun2kItR7e
 eGIrlJehqOZDbeFD9rolQS4GGNBEKAeKfk++vCKs=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 043/141] drm/radeon: remove set but not used
 variable 'backbias_response_time'
Date: Fri, 14 Feb 2020 11:19:43 -0500
Message-Id: <20200214162122.19794-43-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214162122.19794-1-sashal@kernel.org>
References: <20200214162122.19794-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
 zhengbin <zhengbin13@huawei.com>, Hulk Robot <hulkci@huawei.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: zhengbin <zhengbin13@huawei.com>

[ Upstream commit ac52caecbcf2c30ce95b2536c1caf2643c49b91c ]

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/radeon/si_dpm.c: In function si_program_response_times:
drivers/gpu/drm/radeon/si_dpm.c:3640:29: warning: variable backbias_response_time set but not used [-Wunused-but-set-variable]

It is introduced by commit a9e61410921b ("drm/radeon/kms:
add dpm support for SI (v7)"), but never used, so remove it.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/radeon/si_dpm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/si_dpm.c b/drivers/gpu/drm/radeon/si_dpm.c
index ac7ae206f2e71..06c7244a1f9c5 100644
--- a/drivers/gpu/drm/radeon/si_dpm.c
+++ b/drivers/gpu/drm/radeon/si_dpm.c
@@ -3695,14 +3695,13 @@ static int si_notify_smc_display_change(struct radeon_device *rdev,
 
 static void si_program_response_times(struct radeon_device *rdev)
 {
-	u32 voltage_response_time, backbias_response_time, acpi_delay_time, vbi_time_out;
+	u32 voltage_response_time, acpi_delay_time, vbi_time_out;
 	u32 vddc_dly, acpi_dly, vbi_dly;
 	u32 reference_clock;
 
 	si_write_smc_soft_register(rdev, SI_SMC_SOFT_REGISTER_mvdd_chg_time, 1);
 
 	voltage_response_time = (u32)rdev->pm.dpm.voltage_response_time;
-	backbias_response_time = (u32)rdev->pm.dpm.backbias_response_time;
 
 	if (voltage_response_time == 0)
 		voltage_response_time = 1000;
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
