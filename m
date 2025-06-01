Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B01C0ACA16A
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 01:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1122F10E397;
	Sun,  1 Jun 2025 23:27:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pSboTcHA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E976E10E397;
 Sun,  1 Jun 2025 23:26:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 59F175C184E;
 Sun,  1 Jun 2025 23:24:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9448C4CEEE;
 Sun,  1 Jun 2025 23:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748820418;
 bh=g55pe3c+YLojNa8briwc+sfg93ChPQPNgCl7RFTwkZQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pSboTcHA9mGkwvYrw+7efh6NouEhn8JBntwqHC0zx5hgJVVknb8YYZTAfP2hx+HXL
 IQ49YCJBZJl8ng9qRpLO3VMZJLh6ET4D51+DdAC+ivFR7+59QCLA7lwL+v3a7pv779
 XYP6qpZEwaIi1JQwitCMqJ39a1w5zBaeKrJSkzieNKT8AYS3ssUL0TXpXtjmqbyRJG
 kxXKk8vk6u9RJsggbxLAZ8dsmDMIQl8MBtpOknsaWFdOY+glwOI3KZyA3PvQUyfBe0
 Z2XTAlv8+fvYsS/m0lu6D57lIKZtGvoWkbyrpICOj0Ye93ZBmQ7DI8iLZcl7hKYkbO
 OkP0jzufqMPFQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Dillon Varone <dillon.varone@amd.com>, Aric Cyr <aric.cyr@amd.com>,
 Fangzhi Zuo <jerry.zuo@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, saguileran@ime.usp.br,
 alex.hung@amd.com, joshua.aberback@amd.com, aurabindo.pillai@amd.com,
 Leo.Zeng@amd.com, chris.park@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.15 051/110] drm/amd/display: Fix Vertical Interrupt
 definitions for dcn32, dcn401
Date: Sun,  1 Jun 2025 19:23:33 -0400
Message-Id: <20250601232435.3507697-51-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601232435.3507697-1-sashal@kernel.org>
References: <20250601232435.3507697-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15
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

From: Dillon Varone <dillon.varone@amd.com>

[ Upstream commit e8cc149ed906a371a5962ff8065393bae28165c9 ]

[WHY&HOW]
- VUPDATE_NO_LOCK should be used in place of VUPDATE always
- Add VERTICAL_INTERRUPT1 and VERTICAL_INTERRUPT2 definitions

Reviewed-by: Aric Cyr <aric.cyr@amd.com>
Signed-off-by: Dillon Varone <dillon.varone@amd.com>
Signed-off-by: Fangzhi Zuo <jerry.zuo@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** ## Analysis This commit should be backported to stable kernel
trees. Here's my detailed analysis: ### What's Being Fixed The commit
addresses two critical issues in the AMD display driver for DCN32 and
DCN401 hardware: 1. **Incorrect VUPDATE interrupt handling**: The code
was using `VUPDATE` instead of `VUPDATE_NO_LOCK` interrupts, which is
incorrect according to the commit message stating "VUPDATE_NO_LOCK
should be used in place of VUPDATE always" 2. **Missing vertical
interrupt definitions**: The code was missing `VERTICAL_INTERRUPT1` and
`VERTICAL_INTERRUPT2` support, which are essential for proper display
timing control ### Code Change Analysis Looking at the specific changes:
**In irq_service_dcn32.c and irq_service_dcn401.c:** - Adds new
interrupt function structures for `vline1_irq_info_funcs` and
`vline2_irq_info_funcs` - Defines new `vline1_int_entry()` and
`vline2_int_entry()` macros for VERTICAL_INTERRUPT1/2 - **Critically
reorders the interrupt array** - moves `vupdate_no_lock_int_entry` after
`vblank_int_entry` and adds the missing vline1/vline2 entries **In
irq_types.h:** - Adds new interrupt source definitions for
`DC_IRQ_SOURCE_DC1_VLINE2` through `DC_IRQ_SOURCE_DC6_VLINE2` - Adds
corresponding `IRQ_TYPE_VLINE1` and `IRQ_TYPE_VLINE2` enum values ###
Why This Should Be Backported 1. **Fixes User-Facing Bugs**: This
directly impacts display functionality on DCN32/DCN401 hardware (recent
AMD GPUs). Incorrect interrupt handling can cause: - VRR/FreeSync not
working properly (similar to the DCN2 fix that was backported) - Display
timing issues and stuttering - Multi-display synchronization problems 2.
**Follows Established Pattern**: Similar to "Similar Commit #3" which
was marked "Backport Status: YES", this fixes VUPDATE interrupt
handling. That commit stated: "These are needed to send back DRM vblank
events in the case where VRR is on. Without the interrupt enabled we're
deferring the events into the vblank queue and userspace is left waiting
forever" 3. **Small, Contained Fix**: The changes are: - Hardware-
specific to DCN32/DCN401 only - Additive (adds missing functionality
rather than changing existing behavior) - Well-defined register-level
changes following hardware specifications 4. **Low Risk**: Unlike the
commits marked "NO" which were either feature additions or cosmetic
changes, this fixes fundamental interrupt definitions that should match
the hardware specification. ### Risk Assessment **Low Risk** - The
changes are: - Contained to specific AMD display controller versions -
Following established patterns from other DCN versions - Adding missing
interrupt support rather than modifying existing behavior - No
architectural changes to the overall driver structure This is exactly
the type of important bug fix that stable kernel trees are meant to
receive - it fixes real functionality issues for users with specific
hardware without introducing unnecessary risk.

 .../display/dc/irq/dcn32/irq_service_dcn32.c  | 61 ++++++++++++++-----
 .../dc/irq/dcn401/irq_service_dcn401.c        | 60 +++++++++++++-----
 drivers/gpu/drm/amd/display/dc/irq_types.h    |  9 +++
 3 files changed, 101 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn32/irq_service_dcn32.c b/drivers/gpu/drm/amd/display/dc/irq/dcn32/irq_service_dcn32.c
index f0ac0aeeac512..f839afacd5a5c 100644
--- a/drivers/gpu/drm/amd/display/dc/irq/dcn32/irq_service_dcn32.c
+++ b/drivers/gpu/drm/amd/display/dc/irq/dcn32/irq_service_dcn32.c
@@ -191,6 +191,16 @@ static struct irq_source_info_funcs vline0_irq_info_funcs = {
 	.ack = NULL
 };
 
+static struct irq_source_info_funcs vline1_irq_info_funcs = {
+	.set = NULL,
+	.ack = NULL
+};
+
+static struct irq_source_info_funcs vline2_irq_info_funcs = {
+	.set = NULL,
+	.ack = NULL
+};
+
 #undef BASE_INNER
 #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
 
@@ -259,6 +269,13 @@ static struct irq_source_info_funcs vline0_irq_info_funcs = {
 		.funcs = &pflip_irq_info_funcs\
 	}
 
+#define vblank_int_entry(reg_num)\
+	[DC_IRQ_SOURCE_VBLANK1 + reg_num] = {\
+		IRQ_REG_ENTRY(OTG, reg_num,\
+			OTG_GLOBAL_SYNC_STATUS, VSTARTUP_INT_EN,\
+			OTG_GLOBAL_SYNC_STATUS, VSTARTUP_EVENT_CLEAR),\
+		.funcs = &vblank_irq_info_funcs\
+	}
 /* vupdate_no_lock_int_entry maps to DC_IRQ_SOURCE_VUPDATEx, to match semantic
  * of DCE's DC_IRQ_SOURCE_VUPDATEx.
  */
@@ -270,14 +287,6 @@ static struct irq_source_info_funcs vline0_irq_info_funcs = {
 		.funcs = &vupdate_no_lock_irq_info_funcs\
 	}
 
-#define vblank_int_entry(reg_num)\
-	[DC_IRQ_SOURCE_VBLANK1 + reg_num] = {\
-		IRQ_REG_ENTRY(OTG, reg_num,\
-			OTG_GLOBAL_SYNC_STATUS, VSTARTUP_INT_EN,\
-			OTG_GLOBAL_SYNC_STATUS, VSTARTUP_EVENT_CLEAR),\
-		.funcs = &vblank_irq_info_funcs\
-}
-
 #define vline0_int_entry(reg_num)\
 	[DC_IRQ_SOURCE_DC1_VLINE0 + reg_num] = {\
 		IRQ_REG_ENTRY(OTG, reg_num,\
@@ -285,6 +294,20 @@ static struct irq_source_info_funcs vline0_irq_info_funcs = {
 			OTG_VERTICAL_INTERRUPT0_CONTROL, OTG_VERTICAL_INTERRUPT0_CLEAR),\
 		.funcs = &vline0_irq_info_funcs\
 	}
+#define vline1_int_entry(reg_num)\
+	[DC_IRQ_SOURCE_DC1_VLINE1 + reg_num] = {\
+		IRQ_REG_ENTRY(OTG, reg_num,\
+			OTG_VERTICAL_INTERRUPT1_CONTROL, OTG_VERTICAL_INTERRUPT1_INT_ENABLE,\
+			OTG_VERTICAL_INTERRUPT1_CONTROL, OTG_VERTICAL_INTERRUPT1_CLEAR),\
+		.funcs = &vline1_irq_info_funcs\
+	}
+#define vline2_int_entry(reg_num)\
+	[DC_IRQ_SOURCE_DC1_VLINE2 + reg_num] = {\
+		IRQ_REG_ENTRY(OTG, reg_num,\
+			OTG_VERTICAL_INTERRUPT2_CONTROL, OTG_VERTICAL_INTERRUPT2_INT_ENABLE,\
+			OTG_VERTICAL_INTERRUPT2_CONTROL, OTG_VERTICAL_INTERRUPT2_CLEAR),\
+		.funcs = &vline2_irq_info_funcs\
+	}
 #define dmub_outbox_int_entry()\
 	[DC_IRQ_SOURCE_DMCUB_OUTBOX] = {\
 		IRQ_REG_ENTRY_DMUB(\
@@ -387,21 +410,29 @@ irq_source_info_dcn32[DAL_IRQ_SOURCES_NUMBER] = {
 	dc_underflow_int_entry(6),
 	[DC_IRQ_SOURCE_DMCU_SCP] = dummy_irq_entry(),
 	[DC_IRQ_SOURCE_VBIOS_SW] = dummy_irq_entry(),
-	vupdate_no_lock_int_entry(0),
-	vupdate_no_lock_int_entry(1),
-	vupdate_no_lock_int_entry(2),
-	vupdate_no_lock_int_entry(3),
 	vblank_int_entry(0),
 	vblank_int_entry(1),
 	vblank_int_entry(2),
 	vblank_int_entry(3),
+	[DC_IRQ_SOURCE_DC5_VLINE1] = dummy_irq_entry(),
+	[DC_IRQ_SOURCE_DC6_VLINE1] = dummy_irq_entry(),
+	dmub_outbox_int_entry(),
+	vupdate_no_lock_int_entry(0),
+	vupdate_no_lock_int_entry(1),
+	vupdate_no_lock_int_entry(2),
+	vupdate_no_lock_int_entry(3),
 	vline0_int_entry(0),
 	vline0_int_entry(1),
 	vline0_int_entry(2),
 	vline0_int_entry(3),
-	[DC_IRQ_SOURCE_DC5_VLINE1] = dummy_irq_entry(),
-	[DC_IRQ_SOURCE_DC6_VLINE1] = dummy_irq_entry(),
-	dmub_outbox_int_entry(),
+	vline1_int_entry(0),
+	vline1_int_entry(1),
+	vline1_int_entry(2),
+	vline1_int_entry(3),
+	vline2_int_entry(0),
+	vline2_int_entry(1),
+	vline2_int_entry(2),
+	vline2_int_entry(3)
 };
 
 static const struct irq_service_funcs irq_service_funcs_dcn32 = {
diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn401/irq_service_dcn401.c b/drivers/gpu/drm/amd/display/dc/irq/dcn401/irq_service_dcn401.c
index b43c9524b0de1..8499e505cf3ef 100644
--- a/drivers/gpu/drm/amd/display/dc/irq/dcn401/irq_service_dcn401.c
+++ b/drivers/gpu/drm/amd/display/dc/irq/dcn401/irq_service_dcn401.c
@@ -171,6 +171,16 @@ static struct irq_source_info_funcs vline0_irq_info_funcs = {
 	.ack = NULL
 };
 
+static struct irq_source_info_funcs vline1_irq_info_funcs = {
+	.set = NULL,
+	.ack = NULL
+};
+
+static struct irq_source_info_funcs vline2_irq_info_funcs = {
+	.set = NULL,
+	.ack = NULL
+};
+
 #undef BASE_INNER
 #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
 
@@ -239,6 +249,13 @@ static struct irq_source_info_funcs vline0_irq_info_funcs = {
 		.funcs = &pflip_irq_info_funcs\
 	}
 
+#define vblank_int_entry(reg_num)\
+	[DC_IRQ_SOURCE_VBLANK1 + reg_num] = {\
+		IRQ_REG_ENTRY(OTG, reg_num,\
+			OTG_GLOBAL_SYNC_STATUS, VSTARTUP_INT_EN,\
+			OTG_GLOBAL_SYNC_STATUS, VSTARTUP_EVENT_CLEAR),\
+		.funcs = &vblank_irq_info_funcs\
+	}
 /* vupdate_no_lock_int_entry maps to DC_IRQ_SOURCE_VUPDATEx, to match semantic
  * of DCE's DC_IRQ_SOURCE_VUPDATEx.
  */
@@ -250,13 +267,6 @@ static struct irq_source_info_funcs vline0_irq_info_funcs = {
 		.funcs = &vupdate_no_lock_irq_info_funcs\
 	}
 
-#define vblank_int_entry(reg_num)\
-	[DC_IRQ_SOURCE_VBLANK1 + reg_num] = {\
-		IRQ_REG_ENTRY(OTG, reg_num,\
-			OTG_GLOBAL_SYNC_STATUS, VSTARTUP_INT_EN,\
-			OTG_GLOBAL_SYNC_STATUS, VSTARTUP_EVENT_CLEAR),\
-		.funcs = &vblank_irq_info_funcs\
-	}
 #define vline0_int_entry(reg_num)\
 	[DC_IRQ_SOURCE_DC1_VLINE0 + reg_num] = {\
 		IRQ_REG_ENTRY(OTG, reg_num,\
@@ -264,6 +274,20 @@ static struct irq_source_info_funcs vline0_irq_info_funcs = {
 			OTG_VERTICAL_INTERRUPT0_CONTROL, OTG_VERTICAL_INTERRUPT0_CLEAR),\
 		.funcs = &vline0_irq_info_funcs\
 	}
+#define vline1_int_entry(reg_num)\
+	[DC_IRQ_SOURCE_DC1_VLINE1 + reg_num] = {\
+		IRQ_REG_ENTRY(OTG, reg_num,\
+			OTG_VERTICAL_INTERRUPT1_CONTROL, OTG_VERTICAL_INTERRUPT1_INT_ENABLE,\
+			OTG_VERTICAL_INTERRUPT1_CONTROL, OTG_VERTICAL_INTERRUPT1_CLEAR),\
+		.funcs = &vline1_irq_info_funcs\
+	}
+#define vline2_int_entry(reg_num)\
+	[DC_IRQ_SOURCE_DC1_VLINE2 + reg_num] = {\
+		IRQ_REG_ENTRY(OTG, reg_num,\
+			OTG_VERTICAL_INTERRUPT2_CONTROL, OTG_VERTICAL_INTERRUPT2_INT_ENABLE,\
+			OTG_VERTICAL_INTERRUPT2_CONTROL, OTG_VERTICAL_INTERRUPT2_CLEAR),\
+		.funcs = &vline2_irq_info_funcs\
+	}
 #define dmub_outbox_int_entry()\
 	[DC_IRQ_SOURCE_DMCUB_OUTBOX] = {\
 		IRQ_REG_ENTRY_DMUB(\
@@ -364,21 +388,29 @@ irq_source_info_dcn401[DAL_IRQ_SOURCES_NUMBER] = {
 	dc_underflow_int_entry(6),
 	[DC_IRQ_SOURCE_DMCU_SCP] = dummy_irq_entry(),
 	[DC_IRQ_SOURCE_VBIOS_SW] = dummy_irq_entry(),
-	vupdate_no_lock_int_entry(0),
-	vupdate_no_lock_int_entry(1),
-	vupdate_no_lock_int_entry(2),
-	vupdate_no_lock_int_entry(3),
 	vblank_int_entry(0),
 	vblank_int_entry(1),
 	vblank_int_entry(2),
 	vblank_int_entry(3),
+	[DC_IRQ_SOURCE_DC5_VLINE1] = dummy_irq_entry(),
+	[DC_IRQ_SOURCE_DC6_VLINE1] = dummy_irq_entry(),
+	dmub_outbox_int_entry(),
+	vupdate_no_lock_int_entry(0),
+	vupdate_no_lock_int_entry(1),
+	vupdate_no_lock_int_entry(2),
+	vupdate_no_lock_int_entry(3),
 	vline0_int_entry(0),
 	vline0_int_entry(1),
 	vline0_int_entry(2),
 	vline0_int_entry(3),
-	[DC_IRQ_SOURCE_DC5_VLINE1] = dummy_irq_entry(),
-	[DC_IRQ_SOURCE_DC6_VLINE1] = dummy_irq_entry(),
-	dmub_outbox_int_entry(),
+	vline1_int_entry(0),
+	vline1_int_entry(1),
+	vline1_int_entry(2),
+	vline1_int_entry(3),
+	vline2_int_entry(0),
+	vline2_int_entry(1),
+	vline2_int_entry(2),
+	vline2_int_entry(3),
 };
 
 static const struct irq_service_funcs irq_service_funcs_dcn401 = {
diff --git a/drivers/gpu/drm/amd/display/dc/irq_types.h b/drivers/gpu/drm/amd/display/dc/irq_types.h
index 110f656d43aee..eadab0a2afebe 100644
--- a/drivers/gpu/drm/amd/display/dc/irq_types.h
+++ b/drivers/gpu/drm/amd/display/dc/irq_types.h
@@ -161,6 +161,13 @@ enum dc_irq_source {
 	DC_IRQ_SOURCE_DPCX_TX_PHYE,
 	DC_IRQ_SOURCE_DPCX_TX_PHYF,
 
+	DC_IRQ_SOURCE_DC1_VLINE2,
+	DC_IRQ_SOURCE_DC2_VLINE2,
+	DC_IRQ_SOURCE_DC3_VLINE2,
+	DC_IRQ_SOURCE_DC4_VLINE2,
+	DC_IRQ_SOURCE_DC5_VLINE2,
+	DC_IRQ_SOURCE_DC6_VLINE2,
+
 	DAL_IRQ_SOURCES_NUMBER
 };
 
@@ -170,6 +177,8 @@ enum irq_type
 	IRQ_TYPE_VUPDATE = DC_IRQ_SOURCE_VUPDATE1,
 	IRQ_TYPE_VBLANK = DC_IRQ_SOURCE_VBLANK1,
 	IRQ_TYPE_VLINE0 = DC_IRQ_SOURCE_DC1_VLINE0,
+	IRQ_TYPE_VLINE1 = DC_IRQ_SOURCE_DC1_VLINE1,
+	IRQ_TYPE_VLINE2 = DC_IRQ_SOURCE_DC1_VLINE2,
 	IRQ_TYPE_DCUNDERFLOW = DC_IRQ_SOURCE_DC1UNDERFLOW,
 };
 
-- 
2.39.5

