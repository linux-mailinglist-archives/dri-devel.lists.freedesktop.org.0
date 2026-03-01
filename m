Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNh1BLCao2kwIAUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 02:47:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDEE1CBB9E
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 02:47:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EBE810E1CB;
	Sun,  1 Mar 2026 01:47:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Nr4QZRMd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE31910E1CB;
 Sun,  1 Mar 2026 01:47:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AE1594174A;
 Sun,  1 Mar 2026 01:47:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1005C19421;
 Sun,  1 Mar 2026 01:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772329643;
 bh=Gd1iSAD1LFn69X27JV7KZo1cUatpgAKiBzZKShU5dlE=;
 h=From:To:Cc:Subject:Date:From;
 b=Nr4QZRMdIyaVm12ngoD+obSThbrFG3LJQbEeM2lsedHrxFVOIYEPTYsD/VRa9mkSO
 H26aVb19xIQX3fN32ycuDw28te0sI9h1HbHQ49MolQa8x+VIOeDx/ZQWNkFsn3Ba9m
 PBWoAHyItbcHnS/Mxudb2ZHnJEcHRm+V9YRuUCkoAcHHTHG3bdMoi9cvLDmGZoZOj4
 ErPIQdf/polraIN0COh4ROxUKATO7VbRiqw+H+EaFwYPpwzdxGSWBcf9VisJUYHrHG
 i2PEOpNu30yJD2Z2omgXVD0L1XcZydPp0tvnT6R7GjwHhLiMsMRvo7TvXUBSluhhKc
 MCFKEKvL6aWCw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	sunpeng.li@amd.com
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: FAILED: Patch "drm/amd/display: Increase DCN35 SR enter/exit latency"
 failed to apply to 6.1-stable tree
Date: Sat, 28 Feb 2026 20:47:21 -0500
Message-ID: <20260301014721.1711299-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: 6FDEE1CBB9E
X-Rspamd-Action: no action

The patch below does not apply to the 6.1-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 318917e1d8ecc89f820f4fabf79935f4fed718cd Mon Sep 17 00:00:00 2001
From: Leo Li <sunpeng.li@amd.com>
Date: Mon, 3 Nov 2025 11:14:59 -0500
Subject: [PATCH] drm/amd/display: Increase DCN35 SR enter/exit latency

[Why & How]

On Framework laptops with DDR5 modules, underflow can be observed.
It's unclear why it only occurs on specific desktop contents. However,
increasing enter/exit latencies by 3us seems to resolve it.

Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4463
Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Signed-off-by: Leo Li <sunpeng.li@amd.com>
Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Cc: stable@vger.kernel.org
---
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c | 16 ++++++++--------
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c |  4 ++--
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c
index 7abe6811e4dfa..6fc5247526132 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c
@@ -766,32 +766,32 @@ static struct wm_table ddr5_wm_table = {
 			.wm_inst = WM_A,
 			.wm_type = WM_TYPE_PSTATE_CHG,
 			.pstate_latency_us = 11.72,
-			.sr_exit_time_us = 28.0,
-			.sr_enter_plus_exit_time_us = 30.0,
+			.sr_exit_time_us = 31.0,
+			.sr_enter_plus_exit_time_us = 33.0,
 			.valid = true,
 		},
 		{
 			.wm_inst = WM_B,
 			.wm_type = WM_TYPE_PSTATE_CHG,
 			.pstate_latency_us = 11.72,
-			.sr_exit_time_us = 28.0,
-			.sr_enter_plus_exit_time_us = 30.0,
+			.sr_exit_time_us = 31.0,
+			.sr_enter_plus_exit_time_us = 33.0,
 			.valid = true,
 		},
 		{
 			.wm_inst = WM_C,
 			.wm_type = WM_TYPE_PSTATE_CHG,
 			.pstate_latency_us = 11.72,
-			.sr_exit_time_us = 28.0,
-			.sr_enter_plus_exit_time_us = 30.0,
+			.sr_exit_time_us = 31.0,
+			.sr_enter_plus_exit_time_us = 33.0,
 			.valid = true,
 		},
 		{
 			.wm_inst = WM_D,
 			.wm_type = WM_TYPE_PSTATE_CHG,
 			.pstate_latency_us = 11.72,
-			.sr_exit_time_us = 28.0,
-			.sr_enter_plus_exit_time_us = 30.0,
+			.sr_exit_time_us = 31.0,
+			.sr_enter_plus_exit_time_us = 33.0,
 			.valid = true,
 		},
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c
index 817a370e80a77..8a177d5ae213e 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c
@@ -164,8 +164,8 @@ struct _vcs_dpi_soc_bounding_box_st dcn3_5_soc = {
 		},
 	},
 	.num_states = 5,
-	.sr_exit_time_us = 28.0,
-	.sr_enter_plus_exit_time_us = 30.0,
+	.sr_exit_time_us = 31.0,
+	.sr_enter_plus_exit_time_us = 33.0,
 	.sr_exit_z8_time_us = 250.0,
 	.sr_enter_plus_exit_z8_time_us = 350.0,
 	.fclk_change_latency_us = 24.0,
-- 
2.51.0




