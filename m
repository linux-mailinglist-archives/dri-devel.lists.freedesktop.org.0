Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A1F82A978
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:51:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB73F10E83E;
	Thu, 11 Jan 2024 08:50:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 365 seconds by postgrey-1.36 at gabe;
 Thu, 11 Jan 2024 07:44:45 UTC
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0234910E7F2;
 Thu, 11 Jan 2024 07:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=57+782vKmtQVIMhocg
 zTgERrVfKoYz+T2Ea2sdZaNjA=; b=hbImOb544Rm+1F2maG9xh08RwkxpTo9U55
 YrV21SRg05smP6fW8HNGcDoKMdGwHL4mUhY1lclrGVtT0sFYNL6ztqCjExdSoQsH
 LQTCyCSvmmlMkyEgiXfigKAuYTudnx+j1MUegV7fJuFwtr8D4MJEhAFmTVQygBP1
 cPwrwvKcM=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-2 (Coremail) with SMTP id _____wDnr5NfnJ9lIN+SAA--.21184S2;
 Thu, 11 Jan 2024 15:44:32 +0800 (CST)
From: GuoHua Chen <chenguohua_716@163.com>
To: daniel@ffwll.ch, Xinhui.Pan@amd.com, airlied@gmail.com,
 christian.koenig@amd.com, alexander.deucher@amd.com
Subject: [PATCH] drm/radeon/dpm: Clean up errors in sumo_dpm.c
Date: Thu, 11 Jan 2024 07:44:30 +0000
Message-Id: <20240111074430.10835-1-chenguohua_716@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wDnr5NfnJ9lIN+SAA--.21184S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXFWUXr18WF4fGFyDKr4rKrg_yoW5Xw15pr
 W0yFsYya4Fq340yrWSyFn8JFyUt34UtFW0krWDKFs7ua1DAr1DZF9Yyw45Wry0yFW0gF9x
 XryIgrW0vry3A37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UFdgAUUUUU=
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: xfkh0w5xrk3tbbxrlqqrwthudrp/xtbBEhli1mVOBk6xsAABsc
X-Mailman-Approved-At: Thu, 11 Jan 2024 08:50:44 +0000
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, GuoHua Chen <chenguohua_716@163.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: that open brace { should be on the previous line
ERROR: space prohibited before that close parenthesis ')'
ERROR: spaces required around that '?' (ctx:VxW)

Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
---
 drivers/gpu/drm/radeon/sumo_dpm.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/radeon/sumo_dpm.c b/drivers/gpu/drm/radeon/sumo_dpm.c
index d49c145db437..21d27e6235f3 100644
--- a/drivers/gpu/drm/radeon/sumo_dpm.c
+++ b/drivers/gpu/drm/radeon/sumo_dpm.c
@@ -33,8 +33,7 @@
 #define SUMO_MINIMUM_ENGINE_CLOCK 800
 #define BOOST_DPM_LEVEL 7
 
-static const u32 sumo_utc[SUMO_PM_NUMBER_OF_TC] =
-{
+static const u32 sumo_utc[SUMO_PM_NUMBER_OF_TC] = {
 	SUMO_UTC_DFLT_00,
 	SUMO_UTC_DFLT_01,
 	SUMO_UTC_DFLT_02,
@@ -52,8 +51,7 @@ static const u32 sumo_utc[SUMO_PM_NUMBER_OF_TC] =
 	SUMO_UTC_DFLT_14,
 };
 
-static const u32 sumo_dtc[SUMO_PM_NUMBER_OF_TC] =
-{
+static const u32 sumo_dtc[SUMO_PM_NUMBER_OF_TC] = {
 	SUMO_DTC_DFLT_00,
 	SUMO_DTC_DFLT_01,
 	SUMO_DTC_DFLT_02,
@@ -109,11 +107,11 @@ static void sumo_mg_clockgating_enable(struct radeon_device *rdev, bool enable)
 	local1 = RREG32(CG_CGTT_LOCAL_1);
 
 	if (enable) {
-		WREG32(CG_CGTT_LOCAL_0, (0 & CGCG_CGTT_LOCAL0_MASK) | (local0 & ~CGCG_CGTT_LOCAL0_MASK) );
-		WREG32(CG_CGTT_LOCAL_1, (0 & CGCG_CGTT_LOCAL1_MASK) | (local1 & ~CGCG_CGTT_LOCAL1_MASK) );
+		WREG32(CG_CGTT_LOCAL_0, (0 & CGCG_CGTT_LOCAL0_MASK) | (local0 & ~CGCG_CGTT_LOCAL0_MASK));
+		WREG32(CG_CGTT_LOCAL_1, (0 & CGCG_CGTT_LOCAL1_MASK) | (local1 & ~CGCG_CGTT_LOCAL1_MASK));
 	} else {
-		WREG32(CG_CGTT_LOCAL_0, (0xFFFFFFFF & CGCG_CGTT_LOCAL0_MASK) | (local0 & ~CGCG_CGTT_LOCAL0_MASK) );
-		WREG32(CG_CGTT_LOCAL_1, (0xFFFFCFFF & CGCG_CGTT_LOCAL1_MASK) | (local1 & ~CGCG_CGTT_LOCAL1_MASK) );
+		WREG32(CG_CGTT_LOCAL_0, (0xFFFFFFFF & CGCG_CGTT_LOCAL0_MASK) | (local0 & ~CGCG_CGTT_LOCAL0_MASK));
+		WREG32(CG_CGTT_LOCAL_1, (0xFFFFCFFF & CGCG_CGTT_LOCAL1_MASK) | (local1 & ~CGCG_CGTT_LOCAL1_MASK));
 	}
 }
 
@@ -702,9 +700,9 @@ static void sumo_post_notify_alt_vddnb_change(struct radeon_device *rdev,
 	u32 nbps1_new = 0;
 
 	if (old_ps != NULL)
-		nbps1_old = (old_ps->flags & SUMO_POWERSTATE_FLAGS_FORCE_NBPS1_STATE)? 1 : 0;
+		nbps1_old = (old_ps->flags & SUMO_POWERSTATE_FLAGS_FORCE_NBPS1_STATE) ? 1 : 0;
 
-	nbps1_new = (new_ps->flags & SUMO_POWERSTATE_FLAGS_FORCE_NBPS1_STATE)? 1 : 0;
+	nbps1_new = (new_ps->flags & SUMO_POWERSTATE_FLAGS_FORCE_NBPS1_STATE) ? 1 : 0;
 
 	if (nbps1_old == 0 && nbps1_new == 1)
 		sumo_smu_notify_alt_vddnb_change(rdev, 1, 1);
-- 
2.17.1

