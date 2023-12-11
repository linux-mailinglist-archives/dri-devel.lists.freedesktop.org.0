Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 761B980CBAC
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 14:53:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A09C210E3F8;
	Mon, 11 Dec 2023 13:53:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE6C10E0FC;
 Mon, 11 Dec 2023 13:53:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 98477CE11FD;
 Mon, 11 Dec 2023 13:53:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63448C433C7;
 Mon, 11 Dec 2023 13:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702302820;
 bh=E3HvMWrzxH7i22ZqpKfLSV8bBoSMTUJVt3sCZ2TVNJM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O2PL0dBut2fzPOgbpOTfEs6o0D/tbaqSAcl9piB+ItcTASzeoEc9k+j5+M7cuvs6w
 4jVRJHEv3D+QezKn64Q0Q2jzGl6wv2/9j5l22t+bpV4MwhtOtDg0s1byp8PX7W1yUk
 amly+WgNHYr7M/lbLLUzv2mWuMJPCzjiGvTeT08evlCj5QRLgM20nrC4DgOtnHh6cS
 kYzQBp/xThy8sjwXbvF4I7sHN3On3w2dxWLb3fYOaCOLBVMT9iYKgbNQ2pXXFSKIuk
 gxW6qZ5TQTe/4NoLbBMKZustWyuC2vYv4zkNnwUWXRCVYxbJd8MZspNKAYrj9Iq07/
 5rtQp6K5dRqkg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 38/47] drm/amd/display: Use channel_width = 2 for
 vram table 3.0
Date: Mon, 11 Dec 2023 08:50:39 -0500
Message-ID: <20231211135147.380223-38-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231211135147.380223-1-sashal@kernel.org>
References: <20231211135147.380223-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.5
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
Cc: Sasha Levin <sashal@kernel.org>, felipe.clark@amd.com,
 amd-gfx@lists.freedesktop.org, sunran001@208suo.com,
 dri-devel@lists.freedesktop.org, sunpeng.li@amd.com, ruanjinjie@huawei.com,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, Samson Tam <samson.tam@amd.com>,
 tony.tascioglu@amd.com, drv@mailo.com, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alvin Lee <alvin.lee2@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, mario.limonciello@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alvin Lee <alvin.lee2@amd.com>

[ Upstream commit fec05adc40c25a028c9dfa9d540f800a2d433f80 ]

VBIOS has suggested to use channel_width=2 for any ASIC that uses vram
info 3.0. This is because channel_width in the vram table no longer
represents the memory width

Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Reviewed-by: Samson Tam <samson.tam@amd.com>
Acked-by: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Signed-off-by: Alvin Lee <alvin.lee2@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
index 484d62bcf2c2e..c523561471484 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
@@ -2398,7 +2398,13 @@ static enum bp_result get_vram_info_v30(
 		return BP_RESULT_BADBIOSTABLE;
 
 	info->num_chans = info_v30->channel_num;
-	info->dram_channel_width_bytes = (1 << info_v30->channel_width) / 8;
+	/* As suggested by VBIOS we should always use
+	 * dram_channel_width_bytes = 2 when using VRAM
+	 * table version 3.0. This is because the channel_width
+	 * param in the VRAM info table is changed in 7000 series and
+	 * no longer represents the memory channel width.
+	 */
+	info->dram_channel_width_bytes = 2;
 
 	return result;
 }
-- 
2.42.0

