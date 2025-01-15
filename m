Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8DAA122AB
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 12:37:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F2B10E3AD;
	Wed, 15 Jan 2025 11:36:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Qy8Fxbnb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D5B310E056;
 Wed, 15 Jan 2025 11:36:58 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4363dc916ceso4477595e9.0; 
 Wed, 15 Jan 2025 03:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736940957; x=1737545757; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zRvh6fMAdyPOi5lt24tLnCWVAigh759btngcaiFvNUw=;
 b=Qy8FxbnbRk+Fe795b1MinB+9vBWwAIHkpyqKiB0+lVRH5yKdV9A8Iz3V7QtyQb767Q
 oRStmHMg6Dd5hrR82wCZRHRuxLmBNN6mH1+tPyLNT3WBWvrlSquCElGO0HD6v3x58eok
 yw51X0a/aHtYjpYZOoP+IecEhq3bTQbohrz8U3beB0whXgE0i/y7ixQE5W4ti4o1g+zz
 /GoWUTngjDeMtP2mfRcXdWeWxiIx9N5ZOJPJK+X4YVB6S7IcYrUT6X84UmHvVKoWthlZ
 eTPfqO/DGNPglxIb5kjEn/ZvZ+pH5D7t4wDGwPLlVQcznZmuvluBkaoUNS71INbqK2BC
 WXRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736940957; x=1737545757;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zRvh6fMAdyPOi5lt24tLnCWVAigh759btngcaiFvNUw=;
 b=IOy897yPCZ7+1LnlwrX3thrgAx5sU0Q/CrgyJRZAuptUG8MWxX702EVE/UE2el98yE
 yBsJW0RLTk5PSW0AaGhBreh2Jc6VGxLgoMFSxayrqpAX7GsERyIaH1sLjB/KlZCYnqAo
 e+5r9TRaVPA/9cyeZzEg4WG70LPoZJv5aPBQXMYLv+5l8RABFfAMDp3f3HC2uSnIiF6m
 iMWBVrnbHktIse/lfz58yMS2tD2IYLnSn8FlySOzwLFh8KM7p68WBX8R+PvXphF0QANG
 ywSYVNv/5KGaNBv+PbOGHqOjed7cfwjcrhUd6HU+Z9iM43/2Iroxx+pyjQvuGCBQxoMJ
 KOhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiDVoniRqNlBhmglWio1PdgNNaLDfhqsEIGZm1TTwaL1Mn1hS0gePGPzU5BavWc4/qHUbLjxp+HUN/@lists.freedesktop.org,
 AJvYcCXKVMezoyz5a425aORx2EqRU12jfNiazw97uLGswPxVORLBjlFb14uGYlCAH/hW8X+/e4eMU9YU@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywy9feCHu3WuClJLmvwph5jLDS8sy55RDwTQB0VCVzGhPICZVCX
 xRHioBqqPw8h4idee7US8itfWc4ZeNjX80zHOvIIFMUuAWr2/B0X
X-Gm-Gg: ASbGnctYLjBqM7B5d8wXrNypz4B72cu9+gW3QvSRF7JZ2Ep2HlNNC5V+nZm+5mmc/qf
 V1f1O5pZMfWfolZz/bb9ZnDVZSmGV5wPuyprZGq9IYyXjnbsKCpIvAvVCw1Jgc4b1fDF4WEJrHX
 ABiC0LyXOrlT7Db0cr4RruVP22MMlD6Nt1foLo7XNZxr7ON34XNxgwqsEmqI4w5FPFh7g2Pxaxd
 /PFPZbP9GzP3R5kaTAMkZ5UMH27KtRMFdT1vs5Wj82xx4A2SBBZ1OmuqQ==
X-Google-Smtp-Source: AGHT+IFYFB9Ou4f27iNI8oZssCfOJqnX6hcFH/loMJvx+kQqlMotWMHRayuUpQMW8k1E+3lZnGIW2g==
X-Received: by 2002:a5d:5f91:0:b0:386:3afc:14a7 with SMTP id
 ffacd0b85a97d-38a8b0c7177mr20606160f8f.7.1736940956666; 
 Wed, 15 Jan 2025 03:35:56 -0800 (PST)
Received: from localhost ([194.120.133.72]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c74e6511sm20188625e9.38.2025.01.15.03.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 03:35:56 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Chaitanya Dhere <chaitanya.dhere@amd.com>, Jun Lei <jun.lei@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/amd/display: remove extraneous ; after statements
Date: Wed, 15 Jan 2025 11:35:52 +0000
Message-ID: <20250115113552.297307-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

There are a couple of statements with two following semicolons, replace
these with just one semicolon.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 .../dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
index c4dbf27abaf8..1a0a08823ed9 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
@@ -3894,8 +3894,8 @@ static void CalculateSwathAndDETConfiguration(struct dml2_core_internal_scratch
 			p->SwathHeightC[k] = MaximumSwathHeightC[k] / 2;
 			RoundedUpSwathSizeBytesY[k] = p->full_swath_bytes_l[k] / 2;
 			RoundedUpSwathSizeBytesC[k] = p->full_swath_bytes_c[k] / 2;
-			p->request_size_bytes_luma[k] = ((p->BytePerPixY[k] == 2) == dml_is_vertical_rotation(p->display_cfg->plane_descriptors[k].composition.rotation_angle)) ? 128 : 64;;
-			p->request_size_bytes_chroma[k] = ((p->BytePerPixC[k] == 2) == dml_is_vertical_rotation(p->display_cfg->plane_descriptors[k].composition.rotation_angle)) ? 128 : 64;;
+			p->request_size_bytes_luma[k] = ((p->BytePerPixY[k] == 2) == dml_is_vertical_rotation(p->display_cfg->plane_descriptors[k].composition.rotation_angle)) ? 128 : 64;
+			p->request_size_bytes_chroma[k] = ((p->BytePerPixC[k] == 2) == dml_is_vertical_rotation(p->display_cfg->plane_descriptors[k].composition.rotation_angle)) ? 128 : 64;
 		}
 
 		if (p->SwathHeightC[k] == 0)
-- 
2.47.1

