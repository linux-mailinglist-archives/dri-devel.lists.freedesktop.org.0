Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFA85A0666
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 03:41:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8740DD0E63;
	Thu, 25 Aug 2022 01:39:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D209D0F16;
 Thu, 25 Aug 2022 01:39:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2CB1B61A2D;
 Thu, 25 Aug 2022 01:39:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B76BAC433C1;
 Thu, 25 Aug 2022 01:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661391545;
 bh=E0TlQQG75AR1bWOlBrS/FsccmN36OcRqbdY69d/jkME=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=boZjYTFyLK5cT4Y07mtoDc9FpDz78g9hQk4zF9aYbUD5M0LDmeeYEIJrTfFSh2er7
 cXVoYczbzJrKOQAvgmgL2qzO0dljA48LSNcWUxdN3W7w+3OWbU+nJWgOMvDKBEXE/C
 v4aBTGLgA1NtG4EYQS4a7zKJ9dmSvQR7BZJaB7v/VSHyJFgllWvo7Ww3FBsk+QyQ8x
 1lJ6IJ+2ZEyDyENW3dg8046HExmsrTm99ftUOBPeWbvNjg/V4TaxRj/UB1mkZe8j5E
 WStVzoqbzTEg/9+FsrNtAVDIGFIYRMJ9n8m2Do/gMNnnS2fHui7WnFQuN42xzJpQ/h
 cSCVBxJVN0fcg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 06/11] drm/amd/pm: add missing ->fini_microcode
 interface for Sienna Cichlid
Date: Wed, 24 Aug 2022 21:38:27 -0400
Message-Id: <20220825013836.23205-6-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220825013836.23205-1-sashal@kernel.org>
References: <20220825013836.23205-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, sathishkumar.sundararaju@amd.com,
 lijo.lazar@amd.com, guchun.chen@amd.com, airlied@linux.ie,
 danijel.slivka@amd.com, Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org,
 luben.tuikov@amd.com, Mohammadzafar.ziya@amd.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Evan Quan <evan.quan@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Evan Quan <evan.quan@amd.com>

[ Upstream commit 0a2d922a5618377cdf8fa476351362733ef55342 ]

To avoid any potential memory leak.

Signed-off-by: Evan Quan <evan.quan@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
index 8556c229ff59..49d7fa1d0842 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
@@ -2759,6 +2759,7 @@ static const struct pptable_funcs sienna_cichlid_ppt_funcs = {
 	.dump_pptable = sienna_cichlid_dump_pptable,
 	.init_microcode = smu_v11_0_init_microcode,
 	.load_microcode = smu_v11_0_load_microcode,
+	.fini_microcode = smu_v11_0_fini_microcode,
 	.init_smc_tables = sienna_cichlid_init_smc_tables,
 	.fini_smc_tables = smu_v11_0_fini_smc_tables,
 	.init_power = smu_v11_0_init_power,
-- 
2.35.1

