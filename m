Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BAE4B6FB9
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 16:28:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3748D10E567;
	Tue, 15 Feb 2022 15:28:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 290DE10E583;
 Tue, 15 Feb 2022 15:28:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EE9B661532;
 Tue, 15 Feb 2022 15:27:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93EECC340EB;
 Tue, 15 Feb 2022 15:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644938879;
 bh=v3MER1/Z/1nChzKsMsoSuaIlZ25Q0/0JMr6nMx6ik68=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ad8AncYL9+zafwoho6ck2pCGhZVQpgpqNkDcjwetYd93vVf1D8XL/9ZaQGVK+yVPJ
 HynL0P5f07/5u7upKMAhZJnBhxGf1bXLs0O6Pm6KessJcfLW7OZXxGqd5pnNOIqZiu
 ffjxiuAzTi6yYOS9I6y4LH8O15CJ1qYYzv2nr+hyXueaAFUo2zAOMegQpR7tLbyRwB
 Wgk6rWt8nAJa9j+awKpyB26ocnyX3Xku14yscvERFCzrrG6zPm3C5niLjvtIUQcAv0
 eCgHKInml4yGj4G9oH5XVYp3R2NQT81hLRsqIJxjHLoCOrG2vooVMP8ZeF4wXAr65P
 zAr7f3CH3hDig==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 28/34] display/amd: decrease message verbosity
 about watermarks table failure
Date: Tue, 15 Feb 2022 10:26:51 -0500
Message-Id: <20220215152657.580200-28-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, sunpeng.li@amd.com,
 dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 aaron.liu@amd.com, amd-gfx@lists.freedesktop.org, nicholas.kazlauskas@amd.com,
 airlied@linux.ie, Xiaomeng.Hou@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, isabbasso@riseup.net,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mario Limonciello <mario.limonciello@amd.com>

[ Upstream commit 03ad3093c7c069d6ab4403730009ebafeea9ee37 ]

A number of BIOS versions have a problem with the watermarks table not
being configured properly.  This manifests as a very scary looking warning
during resume from s0i3.  This should be harmless in most cases and is well
understood, so decrease the assertion to a clearer warning about the problem.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.c
index 162ae71861247..21d2cbc3cbb20 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.c
@@ -120,7 +120,11 @@ int dcn31_smu_send_msg_with_param(
 	result = dcn31_smu_wait_for_response(clk_mgr, 10, 200000);
 
 	if (result == VBIOSSMC_Result_Failed) {
-		ASSERT(0);
+		if (msg_id == VBIOSSMC_MSG_TransferTableDram2Smu &&
+		    param == TABLE_WATERMARKS)
+			DC_LOG_WARNING("Watermarks table not configured properly by SMU");
+		else
+			ASSERT(0);
 		REG_WRITE(MP1_SMN_C2PMSG_91, VBIOSSMC_Result_OK);
 		return -1;
 	}
-- 
2.34.1

