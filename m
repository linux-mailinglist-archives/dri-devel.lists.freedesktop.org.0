Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F45075E6D1
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 03:23:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 642EC10E24B;
	Mon, 24 Jul 2023 01:23:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD74F10E249;
 Mon, 24 Jul 2023 01:23:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 354F260F1A;
 Mon, 24 Jul 2023 01:23:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40D9DC433C9;
 Mon, 24 Jul 2023 01:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690161794;
 bh=aBa8XIK8QmcxgKIoDSNoE0q7fWdWtpckKlTSqTTi0mc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ULGkR03y0Y/tGY8LVAowozzKOjxMEqyxMrrwJ4nP6tS4Bh3Fp/mPnCM+9fe1BSo2j
 xz3oHneloTYED13iPDeAUo/He0EYMpStQr5ZFKSW3BAYeWZP0+OZBRdTfaBlndHkne
 J4S+jkEABQc6969di8c6rbJadlJjehvE9HfiUwTWoeBC4HebiR3n9L5/xUDHARxOBi
 6B1eZZcVKNYl2nw35MOCA1+kVEEXVau1qs3Gi11KvWe2jdcd/Tw+BBAR+V6gFD/XQ6
 H5lujjU1iCDH+7PSq58/noV9c4lE5eqUwxUSc+igj+Q30YbJTfqKHsTC906oHMizY4
 D0rQt3ulIuohg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 32/41] drm/amd/display: Enable dcn314 DPP RCO
Date: Sun, 23 Jul 2023 21:21:05 -0400
Message-Id: <20230724012118.2316073-32-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724012118.2316073-1-sashal@kernel.org>
References: <20230724012118.2316073-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.40
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
Cc: Stylon Wang <stylon.wang@amd.com>, Daniel Miess <daniel.miess@amd.com>,
 Sasha Levin <sashal@kernel.org>, sunpeng.li@amd.com,
 amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 Daniel Wheeler <daniel.wheeler@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Jun Lei <jun.lei@amd.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daniel Miess <daniel.miess@amd.com>

[ Upstream commit 17fbdbda9cc87ff5a013898de506212d25323ed7 ]

[Why and How]
Add back debug bits enabling RCO for dcn314 as underflow
associated with this change has been resolved

Acked-by: Stylon Wang <stylon.wang@amd.com>
Signed-off-by: Daniel Miess <daniel.miess@amd.com>
Reviewed-by: Jun Lei <jun.lei@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../drm/amd/display/dc/dcn314/dcn314_resource.c  | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
index b7782433ce6ba..012f6369dae22 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
@@ -920,6 +920,22 @@ static const struct dc_debug_options debug_defaults_drv = {
 			.afmt = true,
 		}
 	},
+
+	.root_clock_optimization = {
+			.bits = {
+					.dpp = true,
+					.dsc = false,
+					.hdmistream = false,
+					.hdmichar = false,
+					.dpstream = false,
+					.symclk32_se = false,
+					.symclk32_le = false,
+					.symclk_fe = false,
+					.physymclk = false,
+					.dpiasymclk = false,
+			}
+	},
+
 	.seamless_boot_odm_combine = true
 };
 
-- 
2.39.2

