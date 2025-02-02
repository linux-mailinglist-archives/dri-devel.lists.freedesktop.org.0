Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C53A2A25026
	for <lists+dri-devel@lfdr.de>; Sun,  2 Feb 2025 22:59:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75EE610E294;
	Sun,  2 Feb 2025 21:59:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="Qgc2sU6O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B15AC10E2B0;
 Sun,  2 Feb 2025 21:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=0wnGofrGCJWqPYkWdZEZOB5+zOxrDqvG6IEsWkcHyLk=; b=Qgc2sU6OnOFo7+rq
 ubGsiT9nGrC2tFZOXMiCrsxp3B7jOeY/TR+2Vx+kGzvovwU23nAkeYe9gNEdUa2ka5tuEw/dA2c3G
 E2VpWhjgSk/9PjHYXs5OCphFfSHwlRnOZg8qQpXk2IFc8E4l4HIPN5a2sehBr3LE7O6+H9a0WYIva
 CVwjP6DYpLryyWUTP+NLekDp8+kk0mfRYknqUz9IylS8k9aZ5M0bBzP2YzzxXCXRvU8UQabzOYadK
 ZDbr6DFSD+AgeE725rPaZD6fLzHB+5+10dyJ11Hi72gaGFeQehGE6tALcQ0hi0sQyzjEVfqzjAIgx
 1Ysk19B/Uxpjk116uQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1tehzY-00D9GV-2q;
 Sun, 02 Feb 2025 21:59:00 +0000
From: linux@treblig.org
To: patrik.r.jakobsson@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, alexander.deucher@amd.com, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 5/7] drm/amd/display: Remove unused
 hubbub1_toggle_watermark_change_req
Date: Sun,  2 Feb 2025 21:58:54 +0000
Message-ID: <20250202215856.252439-6-linux@treblig.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250202215856.252439-1-linux@treblig.org>
References: <20250202215856.252439-1-linux@treblig.org>
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

hubbub1_toggle_watermark_change_req() last use was removed in 2017 by
commit b8fce2c9d773 ("drm/amd/display: Optimize programming front end")

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 .../amd/display/dc/hubbub/dcn10/dcn10_hubbub.c | 18 ------------------
 .../amd/display/dc/hubbub/dcn10/dcn10_hubbub.h |  3 ---
 2 files changed, 21 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/hubbub/dcn10/dcn10_hubbub.c b/drivers/gpu/drm/amd/display/dc/hubbub/dcn10/dcn10_hubbub.c
index d738a36f2132..7847c1c4927b 100644
--- a/drivers/gpu/drm/amd/display/dc/hubbub/dcn10/dcn10_hubbub.c
+++ b/drivers/gpu/drm/amd/display/dc/hubbub/dcn10/dcn10_hubbub.c
@@ -679,24 +679,6 @@ void hubbub1_update_dchub(
 	dh_data->dchub_info_valid = false;
 }
 
-void hubbub1_toggle_watermark_change_req(struct hubbub *hubbub)
-{
-	struct dcn10_hubbub *hubbub1 = TO_DCN10_HUBBUB(hubbub);
-
-	uint32_t watermark_change_req;
-
-	REG_GET(DCHUBBUB_ARB_WATERMARK_CHANGE_CNTL,
-			DCHUBBUB_ARB_WATERMARK_CHANGE_REQUEST, &watermark_change_req);
-
-	if (watermark_change_req)
-		watermark_change_req = 0;
-	else
-		watermark_change_req = 1;
-
-	REG_UPDATE(DCHUBBUB_ARB_WATERMARK_CHANGE_CNTL,
-			DCHUBBUB_ARB_WATERMARK_CHANGE_REQUEST, watermark_change_req);
-}
-
 void hubbub1_soft_reset(struct hubbub *hubbub, bool reset)
 {
 	struct dcn10_hubbub *hubbub1 = TO_DCN10_HUBBUB(hubbub);
diff --git a/drivers/gpu/drm/amd/display/dc/hubbub/dcn10/dcn10_hubbub.h b/drivers/gpu/drm/amd/display/dc/hubbub/dcn10/dcn10_hubbub.h
index 9fbd45c7dfef..fa5c4c18ed59 100644
--- a/drivers/gpu/drm/amd/display/dc/hubbub/dcn10/dcn10_hubbub.h
+++ b/drivers/gpu/drm/amd/display/dc/hubbub/dcn10/dcn10_hubbub.h
@@ -489,9 +489,6 @@ void hubbub1_allow_self_refresh_control(struct hubbub *hubbub, bool allow);
 
 bool hubbub1_is_allow_self_refresh_enabled(struct hubbub *hubub);
 
-void hubbub1_toggle_watermark_change_req(
-		struct hubbub *hubbub);
-
 void hubbub1_wm_read_state(struct hubbub *hubbub,
 		struct dcn_hubbub_wm *wm);
 
-- 
2.48.1

