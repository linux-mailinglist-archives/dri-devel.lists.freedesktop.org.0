Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3718BF09F
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 01:09:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5486F112FD7;
	Tue,  7 May 2024 23:09:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="d/IQbY8l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5091F112FE8;
 Tue,  7 May 2024 23:09:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B9BDF61A15;
 Tue,  7 May 2024 23:09:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CD76C3277B;
 Tue,  7 May 2024 23:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715123358;
 bh=p44Y+LH/bsiflr+JnfeoUYJ7VALrebZAbNd75cLgEZs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d/IQbY8lEUhKKIg224EDCKPwTTtdWte28PseVzEFSPMBTzBR/isgaH2z81THa0i2O
 X/I/TSik6b0ae+kwPWidulFyrYINl1Jc+3FsdzeuHrSbJurQUK0NFetdiRJS4I3YAQ
 NfC0aK96A6s6uPRGviXTxicqOu/zBZhg+BtZ8TAy2kv59isoFEABklYuPjlkLOjVRx
 uDJ+FpjZ+iXfvEYXG38oxNLDKOtmiD2DoU6ZePkymOACvK3hbFCxcU/9NgsZ1W/yVG
 pHh1QzhHw42UH9dImYzRAAXVXu3+X7Yddz/4M5Kir+6Jz9YnRzDDQp/zFyi77dz+G2
 JkpngDO2DGjVg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 wenjing.liu@amd.com, hamza.mahfooz@amd.com, jun.lei@amd.com,
 moadhuri@amd.com, trix@redhat.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.8 36/52] drm/amd/display: Ensure that dmcub support
 flag is set for DCN20
Date: Tue,  7 May 2024 19:07:02 -0400
Message-ID: <20240507230800.392128-36-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507230800.392128-1-sashal@kernel.org>
References: <20240507230800.392128-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.9
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

From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

[ Upstream commit be53bd4f00aa4c7db9f41116224c027b4cfce8e3 ]

In the DCN20 resource initialization, ensure that DMCUB support starts
configured as true.

Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Acked-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/resource/dcn20/dcn20_resource.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn20/dcn20_resource.c
index f9c5bc624be30..f81f6110913d3 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn20/dcn20_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn20/dcn20_resource.c
@@ -2451,6 +2451,7 @@ static bool dcn20_resource_construct(
 	dc->caps.post_blend_color_processing = true;
 	dc->caps.force_dp_tps4_for_cp2520 = true;
 	dc->caps.extended_aux_timeout_support = true;
+	dc->caps.dmcub_support = true;
 
 	/* Color pipeline capabilities */
 	dc->caps.color.dpp.dcn_arch = 1;
-- 
2.43.0

