Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09825272804
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 16:40:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D9A6E39E;
	Mon, 21 Sep 2020 14:40:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0795A6E38A;
 Mon, 21 Sep 2020 14:40:46 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0EAA423600;
 Mon, 21 Sep 2020 14:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600699245;
 bh=f3aX4MYAfIoQ64soJl850blFbIAJIx72ZTd4aLXAsUs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XYU4jWTzPTPNsSvtKS550TDxg4aWtnYR1yJgBhh0EekYikv01rqbOyB94Zabn1q+b
 EXfHGH6P1STINByIhaBy8uvMqm3smYGEZYUAIJj6SCMe/7ucjwxDZGUMM1MUKCQNto
 nXYU3JwZ9ISWTxKP9R7ecbX53rWWc8oSufgV13qQ=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.8 14/20] drm/amd/display: update nv1x stutter
 latencies
Date: Mon, 21 Sep 2020 10:40:21 -0400
Message-Id: <20200921144027.2135390-14-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200921144027.2135390-1-sashal@kernel.org>
References: <20200921144027.2135390-1-sashal@kernel.org>
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
 Aurabindo Pillai <aurabindo.pillai@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Jun Lei <jun.lei@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jun Lei <jun.lei@amd.com>

[ Upstream commit c4790a8894232f39c25c7c546c06efe074e63384 ]

[why]
Recent characterization shows increased stutter latencies on some SKUs,
leading to underflow.

[how]
Update SOC params to account for this worst case latency.

Signed-off-by: Jun Lei <jun.lei@amd.com>
Acked-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
index 2d9055eb3ce92..20bdabebbc434 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
@@ -409,8 +409,8 @@ struct _vcs_dpi_soc_bounding_box_st dcn2_0_nv14_soc = {
 			},
 		},
 	.num_states = 5,
-	.sr_exit_time_us = 8.6,
-	.sr_enter_plus_exit_time_us = 10.9,
+	.sr_exit_time_us = 11.6,
+	.sr_enter_plus_exit_time_us = 13.9,
 	.urgent_latency_us = 4.0,
 	.urgent_latency_pixel_data_only_us = 4.0,
 	.urgent_latency_pixel_mixed_with_vm_data_us = 4.0,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
