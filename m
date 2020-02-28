Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4E9173D39
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 17:41:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA9616E0CC;
	Fri, 28 Feb 2020 16:41:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58D0C6E091;
 Fri, 28 Feb 2020 16:41:55 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id dc19so4041429edb.10;
 Fri, 28 Feb 2020 08:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ldf8hYsODju3QfMuQceixPCm/gYiMPapiNP2c55hvY8=;
 b=olqIOHkF6nsW9UYb36nMIzd9lU3s+uRqS8wOR3h+TWG0ta18aKezAaCKixv6gGPxUK
 c73TR/s6tYA9rZOfOJF4Ady5JMGtZY+hzChGh6zLbscqlrLWUMVqi/C2YcYch6GUV1/g
 s61HJHjR2efaala0vgj64Lj9PlShUwxgCshyR7y28f2vS5WpYFIwPBXT9+u/kxW+OLnP
 plrBWmysnZ2K4ReVWEZxPeP3v1vACgn5hyiCXW4cBmJBdIa6dW6PiKy9mLvM/X5uC8WL
 vYi/06mnmp2hD3XGRHYvd/YAg2Dg3ZZTT4jzHlE56A3+6daLQZSTkB+TwlUNHpdT7jq2
 mkrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ldf8hYsODju3QfMuQceixPCm/gYiMPapiNP2c55hvY8=;
 b=nZTbApt9poOdztJESExZNkqXT33c2k9RK/7rwtjSppdX9AOGyaNJwVhrcdji3akjPm
 h9A2QIhbyDBDA3lm6GmiL5+Q6UiDaewcxPRlSZCP+mCE7iyi5UpbLmEnddUqVe9lFajs
 OQU60LSKcXT0C/LYRsHdMZzKD2CeU2gxmOJCwZZU/CdkAjilK/n1Vv6af5h7bKVVrVV4
 SML287781Wyk1C7LmzReXxpD2ycgie9VkpSyn1gP0RgGepsFAm+tw9Wci7nc30ypogU3
 yX4NJo/bCrUYm5LBc9GFER6RELSmWUABhG+P8GwFFH4nlB9yJu9ieakgYxA+uToKNmuq
 Hb3Q==
X-Gm-Message-State: APjAAAWbJNzbjT5kTGDEyboanOat4CJ7CW46UgcEuesnTg/lIR0f3Oi+
 krnAwawye3BniAoZUo72+PBi/2RyDjHrAA==
X-Google-Smtp-Source: APXvYqyBIXoVMdxp+IBNcq5UuXpt1k3/I3znDe1yS0Q/R9hOHsI1A7Z2npgvGIC0J9uYyTHKpa9bxg==
X-Received: by 2002:a05:6402:c08:: with SMTP id
 co8mr5180686edb.197.1582908113875; 
 Fri, 28 Feb 2020 08:41:53 -0800 (PST)
Received: from smtp.gmail.com (1.77.115.89.rev.vodafone.pt. [89.115.77.1])
 by smtp.gmail.com with ESMTPSA id b14sm579365edx.64.2020.02.28.08.41.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 08:41:52 -0800 (PST)
Date: Fri, 28 Feb 2020 13:41:45 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Konig <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Subject: [PATCH v2 1/2] drm/amd/display: dc_link: code clean up on
 enable_link_dp function
Message-ID: <922a2d0df348e72588405dedd4f9a296448f51c3.1582907436.git.melissa.srw@gmail.com>
References: <cover.1582907436.git.melissa.srw@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1582907436.git.melissa.srw@gmail.com>
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
 drivers/gpu/drm/amd/display/dc/core/dc_link.c | 29 +++++++++----------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
index 02e1ad318203..eb9894e416ed 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
@@ -1498,9 +1498,8 @@ static void enable_stream_features(struct pipe_ctx *pipe_ctx)
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
@@ -1532,7 +1531,8 @@ static enum dc_status enable_link_dp(
 	pipe_ctx->stream_res.pix_clk_params.requested_sym_clk =
 			link_settings.link_rate * LINK_RATE_REF_FREQ_IN_KHZ;
 	if (state->clk_mgr && !apply_seamless_boot_optimization)
-		state->clk_mgr->funcs->update_clocks(state->clk_mgr, state, false);
+		state->clk_mgr->funcs->update_clocks(state->clk_mgr,
+						     state, false);
 
 	// during mode switch we do DP_SET_POWER off then on, and OUI is lost
 	dpcd_set_source_specific_data(link);
@@ -1540,21 +1540,20 @@ static enum dc_status enable_link_dp(
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
