Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9C9C432E0
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 19:05:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBA9E10E147;
	Sat,  8 Nov 2025 18:05:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="X4S+y831";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92F5C10E1F1
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Nov 2025 17:41:05 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-297d4a56f97so10483005ad.1
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Nov 2025 09:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762623665; x=1763228465; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KjRGzSVrFGVIo2LvU9W8/+cuvbxA+DYtLbsyShtQ9uA=;
 b=X4S+y831LmQvbuFLMeRjzJ67opMbib5XzJeBTK2/JB+B4U0FlTEstj/BKY7Xr3grJ8
 SC7t5IsVutulrGioJ9u7/k5D8M84PL0ZvDbbvm/r8xvB5UhiZJHR5eXPl0mqkWXpyHpj
 J1Xz8NExfOdtxpLVPr7lUqMjtiZ8SZe9AY3n9oR9UIKYP3GZlUobbHYfd2g1dJrMQEWg
 lJjARS2DQ+AaoCODqK201PDB+KQONi4BOSi4exvQoMPlyADQhg+/EVWHdsjYRannQh2E
 32W6HTHwJ3AS4ga+x7X3sF+7mQZ0EcAHyFq7vh8fx+zIhpmNMY8bY8RkIG2z6rTAdd6D
 QWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762623665; x=1763228465;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KjRGzSVrFGVIo2LvU9W8/+cuvbxA+DYtLbsyShtQ9uA=;
 b=Rl8+IUq+P/5YS+uifgNt0YUQCKcq2pZkHyRjWfhnVk26iRnfRC63oFh9Xt4J0My9n5
 b3oCt0IVqLqef+eU6ZwOrG0112F4LilDAmbeALHdJDWruwbhacZnpHxIluusx3by4bZN
 EBUIHCHmW6rSsGr3owXcia8/0b+FUP8t/MuIV4tcTiiyaXwh8zqPH2EUcmrYC61tV2+G
 0BgTUaWs5yUOIM5hMcL3KLA9D76kN313pro+LAFuE3KfG6tJjOkFtxk0PiAc22/VFoxp
 4w4wWvGpSwPTNcBl8dcq4VIxpJJ8o/uvOnan4fpFNy8Sznte+RVLLj7Mu8X05LgxISje
 X0xw==
X-Gm-Message-State: AOJu0YzyNfWjBQcJXZcX4hFy622Ll27GK8tN3jgQZteyMuQdumKNzRsH
 QW6P5Nqz7LjFuYYAOF9qQYxu/JiHyZ3dTpKLAZ4aBmPoKTOowsQRH1SwX5iUVw==
X-Gm-Gg: ASbGnctUfyiTMku9I5K60poQzfNLLsY5IOkww3LveJJZPYznannrhGO+kmKyoEONuvd
 pHLFrrTIna5hJ4c4VHOo31gTtedUfbVe3vv5jy6NBp1NGISUdHMOnuYxuCwZf4YxS04u9rHCJ+J
 u6RLLvd7lQxJ8D+NXSedJKWmfPfvLlfi2WmSioVvjGVbctrQc2GF+UZUoNnJmK6zV4drJeNy/bN
 R4V6KD/cl2zitvPqMKMc63dSAVVXn993Etd6QQ4hat+8ZX/JSIxC1L+4ijKVi9aWcUOIaq81fTA
 GuiAl6sKYpLiHQlaCTt9g55Ou0Rolr262PJcHH71Ym6pNSqbfEMY5jnye7hCtRoHAjYh+aGJz8i
 24pORNUf8C/P/D0xwGRfhUXT0e0++DeWxYU0TyKi6twWW4fA=
X-Google-Smtp-Source: AGHT+IGHulV1SjTVkaEnfmlUppgot/eDXD6crirZT1rmC/ueBEuHwHH/akpWt3ntSVv9RzINXXUgwA==
X-Received: by 2002:a17:902:f54d:b0:295:7423:4be2 with SMTP id
 d9443c01a7336-297e540d866mr38620785ad.3.1762623664852; 
 Sat, 08 Nov 2025 09:41:04 -0800 (PST)
Received: from ryzen ([2601:644:8000:8e26::ea0])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29651c740a9sm94585115ad.53.2025.11.08.09.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Nov 2025 09:41:04 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org (open list:AMD DISPLAY CORE),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm: amd: display: shrink struct members
Date: Sat,  8 Nov 2025 09:40:47 -0800
Message-ID: <20251108174047.7029-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 08 Nov 2025 18:05:27 +0000
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

On a 32-bit ARM system, the audio_decoder struct ends up being too large
for dp_retrain_link_dp_test.

link_dp_cts.c:157:1: error: the frame size of 1328 bytes is larger than
1280 bytes [-Werror=frame-larger-than=]

This is mitigated by shrinking the members of the struct and avoids
having to deal with dynamic allocation.

feed_back_divider is assigned but otherwise unused. Remove both.

pixel_repetition looks like it should be a bool since it's only ever
assigned to 1. But there are checks for 2 and 4. Reduce to uint8_t.

Remove ss_percentage_divider. Unused.

Shrink refresh_rate as it gets assigned to at most a 3 digit integer
value.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c    |  3 ---
 drivers/gpu/drm/amd/display/include/audio_types.h    | 12 +++++-------
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
index 3005115c8505..852c117fe5b6 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
@@ -1480,9 +1480,6 @@ void build_audio_output(
 						state->clk_mgr);
 	}
 
-	audio_output->pll_info.feed_back_divider =
-			pipe_ctx->pll_settings.feedback_divider;
-
 	audio_output->pll_info.dto_source =
 		translate_to_dto_source(
 			pipe_ctx->stream_res.tg->inst + 1);
diff --git a/drivers/gpu/drm/amd/display/include/audio_types.h b/drivers/gpu/drm/amd/display/include/audio_types.h
index e4a26143f14c..6699ad4fa825 100644
--- a/drivers/gpu/drm/amd/display/include/audio_types.h
+++ b/drivers/gpu/drm/amd/display/include/audio_types.h
@@ -47,15 +47,15 @@ struct audio_crtc_info {
 	uint32_t h_total;
 	uint32_t h_active;
 	uint32_t v_active;
-	uint32_t pixel_repetition;
 	uint32_t requested_pixel_clock_100Hz; /* in 100Hz */
 	uint32_t calculated_pixel_clock_100Hz; /* in 100Hz */
-	uint32_t refresh_rate;
+	uint32_t dsc_bits_per_pixel;
+	uint32_t dsc_num_slices;
 	enum dc_color_depth color_depth;
 	enum dc_pixel_encoding pixel_encoding;
+	uint16_t refresh_rate;
+	uint8_t pixel_repetition;
 	bool interlaced;
-	uint32_t dsc_bits_per_pixel;
-	uint32_t dsc_num_slices;
 };
 struct azalia_clock_info {
 	uint32_t pixel_clock_in_10khz;
@@ -78,11 +78,9 @@ enum audio_dto_source {
 
 struct audio_pll_info {
 	uint32_t audio_dto_source_clock_in_khz;
-	uint32_t feed_back_divider;
+	uint32_t ss_percentage;
 	enum audio_dto_source dto_source;
 	bool ss_enabled;
-	uint32_t ss_percentage;
-	uint32_t ss_percentage_divider;
 };
 
 struct audio_channel_associate_info {
-- 
2.51.2

