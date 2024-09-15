Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE29979711
	for <lists+dri-devel@lfdr.de>; Sun, 15 Sep 2024 16:19:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE07310E2EC;
	Sun, 15 Sep 2024 14:19:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="VIf2ikBA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1070 seconds by postgrey-1.36 at gabe;
 Sun, 15 Sep 2024 14:19:39 UTC
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D5B10E2EC;
 Sun, 15 Sep 2024 14:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=i4QciZ0qftqS2o625zh2ldn6URyWZ5o9xpxLHJHHoNQ=; b=VIf2ikBAhNcb2Tyk
 RWHpaEdkeaZMmZilE1zSXRMN803+iTI13vK6xJXXogb+DaJO6Zwcwc7vIg/QEisf+GmqBfEmuwjIA
 o1zMtbn+vTDQyLfZbOJJn0ckRVbbA9c0vAIzxUSG2W395GOmV3f/Ndfy+jSdaosL5SpkYjlDixM1j
 vvNqjV1+0YxnWJdbg/tMEkxhO26ioCZ8u44+qsB8bFkWYqpmujkNdmyDfhnGgP//aeEZElhn9XZ/U
 LRZxCQK3eZcLK5KGcwIuFtIJBZNsQG00YBoqMPb+QWGxkMRW8KHp7sSUzhKsdmRtSE2l57iVp/Ots
 9X/nV4Or4v5J3b5oSQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1sppow-005pnU-1Z;
 Sun, 15 Sep 2024 14:01:46 +0000
From: linux@treblig.org
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] drm/amd/display: Remove unused function
 bios_get_vga_enabled_displays
Date: Sun, 15 Sep 2024 15:01:44 +0100
Message-ID: <20240915140144.36988-1-linux@treblig.org>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

bios_get_vga_enabled_displays has been unused since
  commit 5a8132b9f606 ("drm/amd/display: remove dead dc vbios code")

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/amd/display/dc/bios/bios_parser_helper.c | 7 -------
 drivers/gpu/drm/amd/display/dc/bios/bios_parser_helper.h | 1 -
 2 files changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser_helper.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser_helper.c
index adc710fe4a45..8d2cf95ae739 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser_helper.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser_helper.c
@@ -78,10 +78,3 @@ void bios_set_scratch_critical_state(
 	uint32_t critial_state = state ? 1 : 0;
 	REG_UPDATE(BIOS_SCRATCH_6, S6_CRITICAL_STATE, critial_state);
 }
-
-uint32_t bios_get_vga_enabled_displays(
-	struct dc_bios *bios)
-{
-	return REG_READ(BIOS_SCRATCH_3) & 0XFFFF;
-}
-
diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser_helper.h b/drivers/gpu/drm/amd/display/dc/bios/bios_parser_helper.h
index e1b4a40a353d..ab162f2fe577 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser_helper.h
+++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser_helper.h
@@ -34,7 +34,6 @@ uint8_t *bios_get_image(struct dc_bios *bp, uint32_t offset,
 bool bios_is_accelerated_mode(struct dc_bios *bios);
 void bios_set_scratch_acc_mode_change(struct dc_bios *bios, uint32_t state);
 void bios_set_scratch_critical_state(struct dc_bios *bios, bool state);
-uint32_t bios_get_vga_enabled_displays(struct dc_bios *bios);
 
 #define GET_IMAGE(type, offset) ((type *) bios_get_image(&bp->base, offset, sizeof(type)))
 
-- 
2.46.0

