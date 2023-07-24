Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCC475E689
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 03:20:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EC1D10E236;
	Mon, 24 Jul 2023 01:20:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 228BE10E234;
 Mon, 24 Jul 2023 01:20:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9DEDC60F0C;
 Mon, 24 Jul 2023 01:20:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2BE0C433C7;
 Mon, 24 Jul 2023 01:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690161645;
 bh=qYUq7ijCsMDRXqGWqo5AjKIgPej9hzzA6CgIHouIaT8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CXRHJRBcz4PupGG4KvDwi/BWehevhNRzdjvKz8UgYICuVzXYaIS5kNtZ6yPboS80D
 PjMKQx/CRyA1OpND5i51/Gy8QsCGYMqn6Cz4DOksQTNiVGJ9FUFy7NJD3RnBV3sIf+
 LwYgD2s898Lg6Ca5kGjPGGShUF7cNnxBgvCiu5WdoLSUzeibxJ0ywdVpuRrD6bNHTa
 f0KpKsl4rDS31Q25+MqdyFqH87xjS/j+N2KhJsO6Pli7G59TtTs4MlkBFsmx0XEaRb
 JiONlDsBrSYg9761ZBcKdf5EgfO3QOG/L5rjQdcXf1qru8Mc3uiUm9fVBD/2rfP3f0
 dxrjdhnDKS3SQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.4 49/58] drm/amd/display: Enable dcn314 DPP RCO
Date: Sun, 23 Jul 2023 21:13:17 -0400
Message-Id: <20230724011338.2298062-49-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724011338.2298062-1-sashal@kernel.org>
References: <20230724011338.2298062-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.5
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
 Sasha Levin <sashal@kernel.org>, sunpeng.li@amd.com, qingqing.zhuo@amd.com,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org,
 nicholas.kazlauskas@amd.com, ian.chen@amd.com,
 Daniel Wheeler <daniel.wheeler@amd.com>, dri-devel@lists.freedesktop.org,
 bernard@vivo.com, Alex Deucher <alexander.deucher@amd.com>,
 Jun Lei <jun.lei@amd.com>, christian.koenig@amd.com, nasir.osman@amd.com,
 sancchen@amd.com
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
index abeeede38fb39..049fafd3d908c 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
@@ -921,6 +921,22 @@ static const struct dc_debug_options debug_defaults_drv = {
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

