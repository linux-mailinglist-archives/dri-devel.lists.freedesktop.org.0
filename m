Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9A5A2502C
	for <lists+dri-devel@lfdr.de>; Sun,  2 Feb 2025 22:59:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50FE910E2DA;
	Sun,  2 Feb 2025 21:59:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="LWuRQReN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C73CC10E32B;
 Sun,  2 Feb 2025 21:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=9VUI0A8kIxcq0iFYz3iAEwKzXwQz0sXnUaNYUsIpnFg=; b=LWuRQReNSVobiflE
 vU9eB582mmc/dTtnK1DPBTDXtF/2ZEwzBf0ArfvLjIt4Xbd7IunLSPZidmOaJaz7cQhMhZKgHqVYO
 MmZZAnkJJZNLlRecuuR4rjWx2X1wF5TRc8awU6FGk5BP5WXTQh7HEXJDrqQvBdUQSVypXEoOkJKCa
 LMYCKU27Cj01gxt37Vvh/aDebDokgIx6kFyfCdj9edV65GnjE3ugo9VSyDfB26IygbkpWJg1OQ/Cs
 rKR23GXPEs7QUYCgJpflt8jBlqVSfGXtC/lpzieYXnHeWUD+3vfHKWNXp76lkY+qCXe+FJEWDp9tP
 H18iyaVlaNzo/4k4KQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1tehzW-00D9GV-0c;
 Sun, 02 Feb 2025 21:58:58 +0000
From: linux@treblig.org
To: patrik.r.jakobsson@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, alexander.deucher@amd.com, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 1/7] drm/amd/display: Remove unused mpc1_is_mpcc_idle
Date: Sun,  2 Feb 2025 21:58:50 +0000
Message-ID: <20250202215856.252439-2-linux@treblig.org>
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

mpc1_is_mpcc_idle() was added in 2017 by
commit feb4a3cd8eb0 ("drm/amd/display: Integrating MPC pseudocode")
but never used.

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 .../gpu/drm/amd/display/dc/mpc/dcn10/dcn10_mpc.c | 16 ----------------
 .../gpu/drm/amd/display/dc/mpc/dcn10/dcn10_mpc.h |  4 ----
 2 files changed, 20 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/mpc/dcn10/dcn10_mpc.c b/drivers/gpu/drm/amd/display/dc/mpc/dcn10/dcn10_mpc.c
index f2f55565e98a..b23c64004dd5 100644
--- a/drivers/gpu/drm/amd/display/dc/mpc/dcn10/dcn10_mpc.c
+++ b/drivers/gpu/drm/amd/display/dc/mpc/dcn10/dcn10_mpc.c
@@ -142,22 +142,6 @@ struct mpcc *mpc1_get_mpcc_for_dpp(struct mpc_tree *tree, int dpp_id)
 	return NULL;
 }
 
-bool mpc1_is_mpcc_idle(struct mpc *mpc, int mpcc_id)
-{
-	struct dcn10_mpc *mpc10 = TO_DCN10_MPC(mpc);
-	unsigned int top_sel;
-	unsigned int opp_id;
-	unsigned int idle;
-
-	REG_GET(MPCC_TOP_SEL[mpcc_id], MPCC_TOP_SEL, &top_sel);
-	REG_GET(MPCC_OPP_ID[mpcc_id],  MPCC_OPP_ID, &opp_id);
-	REG_GET(MPCC_STATUS[mpcc_id],  MPCC_IDLE,   &idle);
-	if (top_sel == 0xf && opp_id == 0xf && idle)
-		return true;
-	else
-		return false;
-}
-
 void mpc1_assert_mpcc_idle_before_connect(struct mpc *mpc, int mpcc_id)
 {
 	struct dcn10_mpc *mpc10 = TO_DCN10_MPC(mpc);
diff --git a/drivers/gpu/drm/amd/display/dc/mpc/dcn10/dcn10_mpc.h b/drivers/gpu/drm/amd/display/dc/mpc/dcn10/dcn10_mpc.h
index dbfffc6383dc..874e36e39e1b 100644
--- a/drivers/gpu/drm/amd/display/dc/mpc/dcn10/dcn10_mpc.h
+++ b/drivers/gpu/drm/amd/display/dc/mpc/dcn10/dcn10_mpc.h
@@ -173,10 +173,6 @@ void mpc1_update_stereo_mix(
 	struct mpcc_sm_cfg *sm_cfg,
 	int mpcc_id);
 
-bool mpc1_is_mpcc_idle(
-	struct mpc *mpc,
-	int mpcc_id);
-
 void mpc1_assert_mpcc_idle_before_connect(
 	struct mpc *mpc,
 	int mpcc_id);
-- 
2.48.1

