Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DED7B9BAAEE
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 03:39:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54FD210E354;
	Mon,  4 Nov 2024 02:39:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="BGaLrfY0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A2710E354;
 Mon,  4 Nov 2024 02:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=3jtBSxLBpq7pRA5g9b4AJqrlzG/lidgNqYnYB9WczNc=; b=BGaLrfY06h7wTiz7
 S1sFE5t2SRndpYJ3pYJCFM8Dz3xeWA87qFAoycSfTvCGMHwzngyOnBc1vePv8WKTaLQNnTeP4muv3
 QkWizytk5e9R9/zcOs9hlphdkVfHBNfD4tjQ5nQZ3DfqQfE5OUZ3a4Vy1wS7VWW2T1wH47azzPnpr
 b7GmcIDYYPljQ1c+EMXfgst4g9TVh+moBJQYgn+Pzc78j2lhfmR8/gP/pyazVwvp1TwYAvJgveTNv
 uAJp4YndHHRcAjt/2Rm128rV1Cfw6XNeqhE8Ai/71FZOIfYiIWHAH6jzROjlbgdXEjw8BAkYWcBwo
 nz+5h73AIGO1zEfMYw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1t7mzx-00FECw-2F;
 Mon, 04 Nov 2024 02:39:21 +0000
From: linux@treblig.org
To: alexander.deucher@amd.com, harry.wentland@amd.com, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 chaitanya.dhere@amd.com, jun.lei@amd.com
Cc: airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 4/5] drm/amd/display: Remove unused mmhubbub_warmup field
Date: Mon,  4 Nov 2024 02:38:51 +0000
Message-ID: <20241104023852.492497-5-linux@treblig.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241104023852.492497-1-linux@treblig.org>
References: <20241104023852.492497-1-linux@treblig.org>
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

mmhubbub_warmup is a field that was only read by the just removed
dc_stream_warmup_writeback() function.

Remove the field and it's initialisers.

It was only ever initialised to a single function value
(dcn30_mmhubbub_warmup) which is called explicitly elsewhere.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_init.c   | 1 -
 drivers/gpu/drm/amd/display/dc/hwss/dcn301/dcn301_init.c | 1 -
 drivers/gpu/drm/amd/display/dc/hwss/dcn31/dcn31_init.c   | 1 -
 drivers/gpu/drm/amd/display/dc/hwss/dcn314/dcn314_init.c | 1 -
 drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_init.c   | 1 -
 drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c   | 1 -
 drivers/gpu/drm/amd/display/dc/hwss/dcn351/dcn351_init.c | 1 -
 drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_init.c | 1 -
 drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h       | 4 ----
 9 files changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_init.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_init.c
index 2a8dc40d2847..41c30478439a 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_init.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_init.c
@@ -86,7 +86,6 @@ static const struct hw_sequencer_funcs dcn30_funcs = {
 	.enable_writeback = dcn30_enable_writeback,
 	.disable_writeback = dcn30_disable_writeback,
 	.update_writeback = dcn30_update_writeback,
-	.mmhubbub_warmup = dcn30_mmhubbub_warmup,
 	.dmdata_status_done = dcn20_dmdata_status_done,
 	.program_dmdata_engine = dcn30_program_dmdata_engine,
 	.set_dmdata_attributes = dcn20_set_dmdata_attributes,
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn301/dcn301_init.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn301/dcn301_init.c
index 93e49d87a67c..99870fbbb424 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn301/dcn301_init.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn301/dcn301_init.c
@@ -86,7 +86,6 @@ static const struct hw_sequencer_funcs dcn301_funcs = {
 	.enable_writeback = dcn30_enable_writeback,
 	.disable_writeback = dcn30_disable_writeback,
 	.update_writeback = dcn30_update_writeback,
-	.mmhubbub_warmup = dcn30_mmhubbub_warmup,
 	.dmdata_status_done = dcn20_dmdata_status_done,
 	.program_dmdata_engine = dcn30_program_dmdata_engine,
 	.set_dmdata_attributes = dcn20_set_dmdata_attributes,
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn31/dcn31_init.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn31/dcn31_init.c
index 56f3c70d4b55..fb2ffb637931 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn31/dcn31_init.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn31/dcn31_init.c
@@ -89,7 +89,6 @@ static const struct hw_sequencer_funcs dcn31_funcs = {
 	.enable_writeback = dcn30_enable_writeback,
 	.disable_writeback = dcn30_disable_writeback,
 	.update_writeback = dcn30_update_writeback,
-	.mmhubbub_warmup = dcn30_mmhubbub_warmup,
 	.dmdata_status_done = dcn20_dmdata_status_done,
 	.program_dmdata_engine = dcn30_program_dmdata_engine,
 	.set_dmdata_attributes = dcn20_set_dmdata_attributes,
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn314/dcn314_init.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn314/dcn314_init.c
index 68e6de6b5758..21ef03a76229 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn314/dcn314_init.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn314/dcn314_init.c
@@ -91,7 +91,6 @@ static const struct hw_sequencer_funcs dcn314_funcs = {
 	.enable_writeback = dcn30_enable_writeback,
 	.disable_writeback = dcn30_disable_writeback,
 	.update_writeback = dcn30_update_writeback,
-	.mmhubbub_warmup = dcn30_mmhubbub_warmup,
 	.dmdata_status_done = dcn20_dmdata_status_done,
 	.program_dmdata_engine = dcn30_program_dmdata_engine,
 	.set_dmdata_attributes = dcn20_set_dmdata_attributes,
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_init.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_init.c
index 3422b564ae98..bcaaf98cade7 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_init.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_init.c
@@ -87,7 +87,6 @@ static const struct hw_sequencer_funcs dcn32_funcs = {
 	.enable_writeback = dcn30_enable_writeback,
 	.disable_writeback = dcn30_disable_writeback,
 	.update_writeback = dcn30_update_writeback,
-	.mmhubbub_warmup = dcn30_mmhubbub_warmup,
 	.dmdata_status_done = dcn20_dmdata_status_done,
 	.program_dmdata_engine = dcn30_program_dmdata_engine,
 	.set_dmdata_attributes = dcn20_set_dmdata_attributes,
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c
index 2bbf1fef94fd..ab20c47e6d6e 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c
@@ -92,7 +92,6 @@ static const struct hw_sequencer_funcs dcn35_funcs = {
 	.enable_writeback = dcn30_enable_writeback,
 	.disable_writeback = dcn30_disable_writeback,
 	.update_writeback = dcn30_update_writeback,
-	.mmhubbub_warmup = dcn30_mmhubbub_warmup,
 	.dmdata_status_done = dcn20_dmdata_status_done,
 	.program_dmdata_engine = dcn30_program_dmdata_engine,
 	.set_dmdata_attributes = dcn20_set_dmdata_attributes,
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn351/dcn351_init.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn351/dcn351_init.c
index d00822e8daa5..ba7ff8f97d49 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn351/dcn351_init.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn351/dcn351_init.c
@@ -91,7 +91,6 @@ static const struct hw_sequencer_funcs dcn351_funcs = {
 	.enable_writeback = dcn30_enable_writeback,
 	.disable_writeback = dcn30_disable_writeback,
 	.update_writeback = dcn30_update_writeback,
-	.mmhubbub_warmup = dcn30_mmhubbub_warmup,
 	.dmdata_status_done = dcn20_dmdata_status_done,
 	.program_dmdata_engine = dcn30_program_dmdata_engine,
 	.set_dmdata_attributes = dcn20_set_dmdata_attributes,
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_init.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_init.c
index a2ca07235c83..d6dabcb8f4fe 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_init.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_init.c
@@ -66,7 +66,6 @@ static const struct hw_sequencer_funcs dcn401_funcs = {
 	.enable_writeback = dcn30_enable_writeback,
 	.disable_writeback = dcn30_disable_writeback,
 	.update_writeback = dcn30_update_writeback,
-	.mmhubbub_warmup = dcn30_mmhubbub_warmup,
 	.dmdata_status_done = dcn20_dmdata_status_done,
 	.program_dmdata_engine = dcn30_program_dmdata_engine,
 	.set_dmdata_attributes = dcn20_set_dmdata_attributes,
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h b/drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h
index ac9205625623..5d1a83769136 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h
+++ b/drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h
@@ -331,10 +331,6 @@ struct hw_sequencer_funcs {
 	void (*disable_writeback)(struct dc *dc,
 			unsigned int dwb_pipe_inst);
 
-	bool (*mmhubbub_warmup)(struct dc *dc,
-			unsigned int num_dwb,
-			struct dc_writeback_info *wb_info);
-
 	/* Clock Related */
 	enum dc_status (*set_clock)(struct dc *dc,
 			enum dc_clock_type clock_type,
-- 
2.47.0

