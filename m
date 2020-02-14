Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2D615E047
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 17:13:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 633EA6FAA2;
	Fri, 14 Feb 2020 16:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 766626FA9C;
 Fri, 14 Feb 2020 16:13:13 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 58C9B24696;
 Fri, 14 Feb 2020 16:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581696793;
 bh=7lG+dWiKK0SAsQ/9MpxIx6tL6YFcunMBoZY+JdjCtaE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sLj5lC2bBEhx+yRPj+kyw2IblsZM/7reWF1u8OlMogSgZqiuUfHKHUqn24+NWbzae
 PwBmPIjdzylv1/e/JeJUBTmzO8S38QnNDIcrgXrLAFJuvBzRdkwFrHjZTMgA310gfx
 CYPTe439sl/6qKdczjokXYAM724GvtrpD/QIhroM=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 067/252] drm/amd/display: remove set but not used
 variable 'bp' in bios_parser2.c
Date: Fri, 14 Feb 2020 11:08:42 -0500
Message-Id: <20200214161147.15842-67-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214161147.15842-1-sashal@kernel.org>
References: <20200214161147.15842-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, amd-gfx@lists.freedesktop.org,
 zhengbin <zhengbin13@huawei.com>, Hulk Robot <hulkci@huawei.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: zhengbin <zhengbin13@huawei.com>

[ Upstream commit 589d8d282ebe1eab2dd8b1fba3e60322787a50e6 ]

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c: In function bios_get_board_layout_info:
drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c:1826:22: warning: variable bp set but not used [-Wunused-but-set-variable]

It is introduced by commit 1eeedbcc20d6 ("drm/amd/display:
get board layout for edid emulation"), but never used,
so remove it.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
index eab007e1793c2..9ee6814e80c7c 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
@@ -2029,7 +2029,6 @@ static enum bp_result bios_get_board_layout_info(
 	struct board_layout_info *board_layout_info)
 {
 	unsigned int i;
-	struct bios_parser *bp;
 	enum bp_result record_result;
 
 	const unsigned int slot_index_to_vbios_id[MAX_BOARD_SLOTS] = {
@@ -2038,7 +2037,6 @@ static enum bp_result bios_get_board_layout_info(
 		0, 0
 	};
 
-	bp = BP_FROM_DCB(dcb);
 	if (board_layout_info == NULL) {
 		DC_LOG_DETECTION_EDID_PARSER("Invalid board_layout_info\n");
 		return BP_RESULT_BADINPUT;
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
