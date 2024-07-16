Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD1D932861
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 16:26:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E5AB10E726;
	Tue, 16 Jul 2024 14:26:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fdWzXq5D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E3A10E726;
 Tue, 16 Jul 2024 14:26:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 69827CE12A5;
 Tue, 16 Jul 2024 14:26:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 033A5C4AF09;
 Tue, 16 Jul 2024 14:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721139980;
 bh=t7Wz9HROynNdxtMwYgCw79VXqZmMaUv6AhN+H0/OzYQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fdWzXq5DYYn4IaQl+xeXM3qnsRI6Uj5dqXhO1Ic9s1gxIRpqTXnYGF9obDPQFARmN
 7r3waqUxEJYIE05VM2YAwpSEPeeqCj5nF9fgPWwuKdSNREJV95/fPZ/RZyWySpaBPL
 WWLJMdJK/+tbTFH2IuuFkMogiUcYtlcUxwzsbIlDBiPWQSdHkRbu9IhDGFNi4MOssG
 IsV/EuypHCXkEUW6ODA0yw2dCYJpdMgLpbd+MpCbwodnNdndHbRGNESdZQFP2EgIy5
 YLfjDFdqtJrlojWoP2NBnMahnrAfLOYSz5BZVMKMzZQLvQ8nicSC9FLvhwrmG1cxyq
 uN7G81Ew1YD2Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>,
 Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, charlene.liu@amd.com, hamza.mahfooz@amd.com,
 nicholas.kazlauskas@amd.com, sungkim@amd.com, syed.hassan@amd.com,
 xi.liu@amd.com, Qingqing.Zhuo@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.9 15/22] drm/amd/display: Update efficiency
 bandwidth for dcn351
Date: Tue, 16 Jul 2024 10:24:22 -0400
Message-ID: <20240716142519.2712487-15-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240716142519.2712487-1-sashal@kernel.org>
References: <20240716142519.2712487-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.9.9
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

From: Fangzhi Zuo <Jerry.Zuo@amd.com>

[ Upstream commit 7ae37db29a8bc4d3d116a409308dd98fc3a0b1b3 ]

Fix 4k240 underflow on dcn351

Acked-by: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c
index a20f28a5d2e7b..3af759dca6ebf 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c
@@ -233,6 +233,7 @@ void dml2_init_socbb_params(struct dml2_context *dml2, const struct dc *in_dc, s
 		out->round_trip_ping_latency_dcfclk_cycles = 106;
 		out->smn_latency_us = 2;
 		out->dispclk_dppclk_vco_speed_mhz = 3600;
+		out->pct_ideal_dram_bw_after_urgent_pixel_only = 65.0;
 		break;
 
 	}
-- 
2.43.0

