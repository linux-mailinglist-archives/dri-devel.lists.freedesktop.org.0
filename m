Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E7381899E
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 15:19:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA76710E195;
	Tue, 19 Dec 2023 14:19:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8052310E195;
 Tue, 19 Dec 2023 14:19:33 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40c38de1ee4so46077135e9.0; 
 Tue, 19 Dec 2023 06:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702995572; x=1703600372; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Pejp2iczdWxF7uQVAlzk9w8bQVEry9Ccx9GLBVSdAiw=;
 b=VvGnAe607WqS+RxBOmHxZSAZW6Mp7VRwtYWffTHYw5eUyCkL/ab8MpY04fJ2h9MEot
 pHUJjxcxx70swKG5KbsKTjNfgl3gRJ4KPia2nsni4RrXgEvdhuP5Ku2kikLBvoykCkPz
 ipgZtDOW7oiuDE0gBADOrgIJtDvuHweI2sCcW+GR+yrwhrNtoTUhngebPrqsAb4U334H
 neL2S1pfwTCbi1wTWmzCvjCeaKwRk6Ll2qqRuHEwXdFIhMTgxIeH1ajUVzblgSv9mUeV
 X5kNF2xz/Iz7pkkazfPvWE5X0AnasRtziYsMvpfrZKqR1YNtYCpfzHuuFh+Qq7ySqQtS
 CYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702995572; x=1703600372;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Pejp2iczdWxF7uQVAlzk9w8bQVEry9Ccx9GLBVSdAiw=;
 b=IGwhu6apRiQ0u+9QPiOCvGia4rZrMP0B8Yry2V6Jk+dM0OQO+rDD1WCqkz6j45xe00
 wbpcJQZWzx5RTo7GIwWlKZq3rkEEjSXSJHRwWUDdUbGgpJ+CzG2o0qKBCViLxKPiVS4+
 vtF1zyF4QlYbPbZPlf4DHAGqaPDRXIVIZTPm0UhCUWX7XNXMsusX1rZSlm8ftqYHUV3d
 fbrGTf4hITLx9/CgykdyFiZCq7FqGZcG7X98VLukLh/4LE3e0OzWSXL0hVhAkyxge+MD
 WGby6T0c1SbQOU2g/8SKJSIxSL4P2LtoOrGbvRHz2FG8eI3WTRkHEvw1qTSnAA5gGP24
 JmPg==
X-Gm-Message-State: AOJu0YzHkcDeQHvGlzpPcygMhn6eYVV0ah3ApwW1QMieglHIV4af2X2a
 329cmkq0VUpX95Gp9W5yGg0=
X-Google-Smtp-Source: AGHT+IF1aG81n3QckfqzCx5kXe1hHH5po9wN30gDtf7kGI9NGXY6aka+rEQuePN7k7d7rWgIRVEHuA==
X-Received: by 2002:a05:600c:2043:b0:40c:6204:d597 with SMTP id
 p3-20020a05600c204300b0040c6204d597mr4952779wmg.65.1702995571614; 
 Tue, 19 Dec 2023 06:19:31 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 d1-20020adfe841000000b00333404e9935sm8390805wrn.54.2023.12.19.06.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 06:19:31 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui.Pan@amd.com, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amd/display: remove redundant initialization of variable
 remainder
Date: Tue, 19 Dec 2023 14:19:30 +0000
Message-Id: <20231219141930.367426-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Variable remainder is being initialized with a value that is never read,
the assignment is redundant and can be removed. Also add a newline
after the declaration to clean up the coding style.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/basics/conversion.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/basics/conversion.c b/drivers/gpu/drm/amd/display/dc/basics/conversion.c
index e295a839ab47..1090d235086a 100644
--- a/drivers/gpu/drm/amd/display/dc/basics/conversion.c
+++ b/drivers/gpu/drm/amd/display/dc/basics/conversion.c
@@ -103,7 +103,8 @@ void convert_float_matrix(
 
 static uint32_t find_gcd(uint32_t a, uint32_t b)
 {
-	uint32_t remainder = 0;
+	uint32_t remainder;
+
 	while (b != 0) {
 		remainder = a % b;
 		a = b;
-- 
2.39.2

