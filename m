Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B38DC170B32
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 23:07:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 778046E153;
	Wed, 26 Feb 2020 22:07:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1961C88A9C;
 Wed, 26 Feb 2020 22:07:22 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id t7so708620edr.4;
 Wed, 26 Feb 2020 14:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=smlCNyZtkUS5wtodeApayWhfct5DN5V19mI08hkP2Xo=;
 b=ghjQ5U1NmSHaFr6tU8IENHZwipVNP5jyCzhU6nV7h62ZPW7X/96FvJA4rm+8dx9NLp
 Lzd5H3l47KL7iTnNZY7zVeqQ/HnDHNpQuZP7ARkYx2TTibZvYng1c2fUWKKEjHGkzxtW
 j1PlGGs0/1wf50f7E3QadDLs3ZBZRg9/DvGaOqo/8AvBqVzwQBjqD1DQuwqCnO3lK2bT
 rwoIV172jr0CeKH9b1pAVwxqkMxt0yqC4ZUhM2SxcG9cd9GwMlXDtdBrZARBHOHdwr41
 VUFjM18z3YNswbBL+eHJYJPQ3udUr/0Hk8gGHg5rhle/X6/ZmXBw1ZALYJwNCy1zxr7l
 3ZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=smlCNyZtkUS5wtodeApayWhfct5DN5V19mI08hkP2Xo=;
 b=KCas3jbZhbHpiRDwf7HYK/dp0osNTGCjj/MHsxCAEYAQlhRzj1Q/4IM02/DBWfQbiP
 QHYSWofVyB799NnuZZNdzI3PWJ6u9CeRejna0DWq3RWYrgvt8tfsswTocpy6w41z8yDd
 x/rFAklMQ00uac1/mV8VeeSbS2HbD+MxZ1gq7O78BE5QMIj4aSnkRp1I8NGFJ5v8LaS9
 LjzbKzZfCAw4Hppqp0TuUhp9Gz5GvF2LiGpFoDlemBEFxWVJn8ZWXY2ozrNOZiEnQ0Pw
 lscry3BwKNfAUkwqFiyTY7YAjdLdDP90CtKvshvcf4UKD+eutGxJctNUmJvlzGHaQyKQ
 KlaA==
X-Gm-Message-State: APjAAAV01xFOuSsgvXo4av7CYbbegEkakxj5s62Xwidr08h7t936FIC+
 SII/cdAG7djI+Pbc/H6e9Fk=
X-Google-Smtp-Source: APXvYqydPKo4Tg7/Ss78gnfFNnIqgFyswXLCr8T6+nOwPFGDOTqqAMzZ17XdJSY95CGjyb3Ru2edmw==
X-Received: by 2002:aa7:ca10:: with SMTP id y16mr489172eds.217.1582754840773; 
 Wed, 26 Feb 2020 14:07:20 -0800 (PST)
Received: from smtp.gmail.com ([2001:818:e238:a000:51c6:2c09:a768:9c37])
 by smtp.gmail.com with ESMTPSA id dd20sm167771ejb.59.2020.02.26.14.07.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 14:07:20 -0800 (PST)
Date: Wed, 26 Feb 2020 19:07:12 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Konig <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Subject: [PATCH 1/2] drm/amd/display: dc_link: code clean up on
 enable_link_dp function
Message-ID: <990112183d2bc344bd921bb55eee2f8cc2cd8bd5.1582752490.git.melissa.srw@gmail.com>
References: <cover.1582752490.git.melissa.srw@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1582752490.git.melissa.srw@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Coding style clean up on enable_link_dp function as suggested by
checkpatch.pl:

CHECK: Lines should not end with a '('
WARNING: line over 80 characters
WARNING: suspect code indent for conditional statements (8, 24)
CHECK: braces {} should be used on all arms of this statement
ERROR: else should follow close brace '}'
CHECK: Comparison to NULL could be written
       "link->preferred_training_settings.fec_enable"

Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link.c | 32 +++++++++----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
index a09119c10d7c..0f28b5694144 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
@@ -1480,9 +1480,8 @@ static void enable_stream_features(struct pipe_ctx *pipe_ctx)
 	}
 }
 
-static enum dc_status enable_link_dp(
-		struct dc_state *state,
-		struct pipe_ctx *pipe_ctx)
+static enum dc_status enable_link_dp(struct dc_state *state,
+				     struct pipe_ctx *pipe_ctx)
 {
 	struct dc_stream_state *stream = pipe_ctx->stream;
 	enum dc_status status;
@@ -1512,27 +1511,28 @@ static enum dc_status enable_link_dp(
 
 	pipe_ctx->stream_res.pix_clk_params.requested_sym_clk =
 			link_settings.link_rate * LINK_RATE_REF_FREQ_IN_KHZ;
-	if (state->clk_mgr && !apply_seamless_boot_optimization)
-		state->clk_mgr->funcs->update_clocks(state->clk_mgr, state, false);
+	if (state->clk_mgr && !apply_seamless_boot_optimization) {
+		state->clk_mgr->funcs->update_clocks(state->clk_mgr,
+						     state, false);
+	}
 
 	skip_video_pattern = true;
 
 	if (link_settings.link_rate == LINK_RATE_LOW)
-			skip_video_pattern = false;
-
-	if (perform_link_training_with_retries(
-			&link_settings,
-			skip_video_pattern,
-			LINK_TRAINING_ATTEMPTS,
-			pipe_ctx,
-			pipe_ctx->stream->signal)) {
+		skip_video_pattern = false;
+
+	if (perform_link_training_with_retries(&link_settings,
+					       skip_video_pattern,
+					       LINK_TRAINING_ATTEMPTS,
+					       pipe_ctx,
+					       pipe_ctx->stream->signal)) {
 		link->cur_link_settings = link_settings;
 		status = DC_OK;
-	}
-	else
+	} else {
 		status = DC_FAIL_DP_LINK_TRAINING;
+	}
 
-	if (link->preferred_training_settings.fec_enable != NULL)
+	if (link->preferred_training_settings.fec_enable)
 		fec_enable = *link->preferred_training_settings.fec_enable;
 	else
 		fec_enable = true;
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
