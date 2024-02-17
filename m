Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 540AF8595F1
	for <lists+dri-devel@lfdr.de>; Sun, 18 Feb 2024 10:26:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90C6F10E0BB;
	Sun, 18 Feb 2024 09:26:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="L5XCdc0S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E95E310E0A2;
 Sat, 17 Feb 2024 20:27:09 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id
 e9e14a558f8ab-36524116e30so489985ab.0; 
 Sat, 17 Feb 2024 12:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708201629; x=1708806429; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0jU+JJenIXaa9bCS59dcZ028Hl4nXmKY23u7rsLZfHg=;
 b=L5XCdc0SzHL3dVcweP83d+JS7lI0zX/jrVavNmmkeIfXivZkb1Waa7k2GytsoaR+WZ
 gVfmXBzW0EKRaGfMg4ymIzOtVPEhisMqNZBZlj9LZ8kDdA7uMvCqSLq5yQkp3zxSSZet
 0MKm2TLnTiEWXS8OJJAJnlFOFfeqO+ul7NpZ9DjotbbQgpy8I5YuW5KK3nHfZZSYV0f/
 eL6srjJHaBuGa/VOr7mhxdHjp/PcolLhLAWc2ZItYELWaRPHnf9qv7wGfCsDbs2tEmx4
 zvF+Zl3wSSeDTKu0yPYlieugwiKlvsdpz/S+sOgq+Ym+3AVPDQC59XuZAa3ngcDlMVqr
 U+/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708201629; x=1708806429;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0jU+JJenIXaa9bCS59dcZ028Hl4nXmKY23u7rsLZfHg=;
 b=t9cAwM7AObpnNJeZL+7tTSeRmo9ERy9L18w3up17FkqNlEhGaZtwG1CNBBAqTBQFHl
 SXQbVjVY2BfEfnU+/pGoWz7lh/iuNSKN7tsbZcXsfs6HMf/Tf78FSZTSwI9UKYSY4//h
 v0wVs0eiZ9hFDXbGKgpWOnMDvGB49h9a37lb6vmerXHtBOwuf17Gznynoc6YjQwBtJ6G
 x0EjdriDJUq9KwC+PyPTuHrZ7p0ywLT+gi0oH1TnrEDmMYMTWp/pmPwkXOpLdtJOn4FP
 nb96prTQHg4xq9lEqQdeC4wMkNH1nXEz9u/IKPFMRemIqA8xxALjU/A3P4PJgqueKwxM
 QkMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCQ23+SEOlbECgZeDPEkA1eXyKgoS6LFw+5d2RP8CqJhEoTTao1poPgsS/zM8I10rLVtt7qQl99nKwOvtQPuEfXcJB6acwKJGQO6TNy8uvllRyKIEBLYg9jXRIauY6mAsikx+uNGFwv5UdBH3VVg==
X-Gm-Message-State: AOJu0YybnO64rZC3TJ4JKlogR3tIR+Iz16g5gpeSJyYIYajw9uyz7F5A
 UmpnYbS+iaahniYo19jdkPBfZVKwSRqHGPqVCeKYXVgtze7LYo5d
X-Google-Smtp-Source: AGHT+IE1oH9VXEm8Fs5qpor1HJboa85CM4WrYoLZ8He4jl6c8N7tNtouxyAkrXjQO8H55jJIDuMwuQ==
X-Received: by 2002:a92:dc06:0:b0:365:1dd9:ee6b with SMTP id
 t6-20020a92dc06000000b003651dd9ee6bmr2148928iln.25.1708201628830; 
 Sat, 17 Feb 2024 12:27:08 -0800 (PST)
Received: from pop-os.. ([2804:14c:30:24b4:6901:1644:7f56:fce2])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a170902eacc00b001dbb06b6133sm1785223pld.127.2024.02.17.12.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Feb 2024 12:27:08 -0800 (PST)
From: =?UTF-8?q?T=C3=BAlio=20Fernandes?= <tuliomf09@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: =?UTF-8?q?T=C3=BAlio=20Fernandes?= <tuliomf09@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amd/display: clean unnecessary braces
Date: Sat, 17 Feb 2024 17:20:15 -0300
Message-Id: <20240217202015.2034288-1-tuliomf09@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 18 Feb 2024 09:26:08 +0000
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

Clean unnecessary braces in dc/dcn32/dcn32_resource_helpers.c and dc/dcn32/dcn201_link_encoder.c

Signed-off-by: Túlio Fernandes <tuliomf09@gmail.com>
---
 .../display/dc/dcn32/dcn32_resource_helpers.c    | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
index 87760600e154..e179dea148e7 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
@@ -110,14 +110,12 @@ uint32_t dcn32_helper_calculate_num_ways_for_subvp(
 		struct dc_state *context)
 {
 	if (context->bw_ctx.bw.dcn.mall_subvp_size_bytes > 0) {
-		if (dc->debug.force_subvp_num_ways) {
+		if (dc->debug.force_subvp_num_ways)
 			return dc->debug.force_subvp_num_ways;
-		} else {
+		else
 			return dcn32_helper_mall_bytes_to_ways(dc, context->bw_ctx.bw.dcn.mall_subvp_size_bytes);
-		}
-	} else {
+	} else
 		return 0;
-	}
 }
 
 void dcn32_merge_pipes_for_subvp(struct dc *dc,
@@ -250,9 +248,9 @@ bool dcn32_is_psr_capable(struct pipe_ctx *pipe)
 {
 	bool psr_capable = false;
 
-	if (pipe->stream && pipe->stream->link->psr_settings.psr_version != DC_PSR_VERSION_UNSUPPORTED) {
+	if (pipe->stream && pipe->stream->link->psr_settings.psr_version != DC_PSR_VERSION_UNSUPPORTED)
 		psr_capable = true;
-	}
+
 	return psr_capable;
 }
 
@@ -278,9 +276,9 @@ static void override_det_for_subvp(struct dc *dc, struct dc_state *context, uint
 		if (pipe_ctx->stream && pipe_ctx->plane_state && dc_state_get_pipe_subvp_type(context, pipe_ctx) != SUBVP_PHANTOM) {
 			if (dcn32_allow_subvp_high_refresh_rate(dc, context, pipe_ctx)) {
 
-				if (pipe_ctx->stream->timing.v_addressable == 1080 && pipe_ctx->stream->timing.h_addressable == 1920) {
+				if (pipe_ctx->stream->timing.v_addressable == 1080 && pipe_ctx->stream->timing.h_addressable == 1920)
 					fhd_count++;
-				}
+
 				subvp_high_refresh_count++;
 			}
 		}
-- 
2.34.1

