Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FF8A9A388
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 09:25:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3DF910E747;
	Thu, 24 Apr 2025 07:25:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dJ71Iexv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 951D210E215;
 Wed, 23 Apr 2025 15:30:20 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2260c91576aso57297085ad.3; 
 Wed, 23 Apr 2025 08:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745422220; x=1746027020; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xw9g/u+PTutmpr92tmdCCF0EI8aDcB/IZ4deCZgUTAY=;
 b=dJ71Iexv0Yweu5RENCl4mecwW7mcI7R0uTbrOPFdyCOf6D1OVfcWVYiSR74fhrZfpb
 WgdNgZuTSMhpBpwEW79megmvcF95IkJZQfJz6gYypeAy3VPp+VO/fJQy7yb0rJFHhL+3
 F9sPAawldOD49AYR1ouSagmFYHeXfYfGDpK6QRzDFob1OLtXckXoxfU8Or3GeMH9xMZ2
 PtrgjrdQYhHoEW+p8Yp40nBNV8aEE9UoIXvegRGK530K9TnzI5tdOZcxxHaJUBoAFI2t
 P+0JlLtzTswmTeRTi7pjjZqJAGLKKOcCGjyRbpu+PEPWWilcrKrTA628T5J32YVVwkWs
 AIKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745422220; x=1746027020;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xw9g/u+PTutmpr92tmdCCF0EI8aDcB/IZ4deCZgUTAY=;
 b=MjgrBww71Fs/O6gHyLGweUfvaJA0mFLHBL/CPplbTKhPSLD3YLBFrPrH2PI91A/ozT
 eFpAudDsBGI0ditW9UfdSWz5UktUxMqRk4Fp+ayXBZwMXWmy87yraPk7j+zbxJxhh+T7
 HzoMufaDb3StNioOfF+l8F/gAtbUl6jJ5g8yxo0H3iB41Prrypn/6/Uo0x096dI8BNyw
 ms+3+PymJdtMIUgpIiYsut7cWsImDiN+4Re82JA1L3jM76e3Q1TR8jnVFeEzhWm/Ar7a
 SeqiYOfawx6poOl9STlbvivNY2BtnceVXAJ3e14kprTV0QBiG0VS388/0OCaxXUiQAmP
 8UdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxugwsZ+3xm3stuRRbcG0x3szvOs5Wkl7bZMUtG+wD9sca/PASqwK562yK0/rsLAtFoSjApWrYaESn@lists.freedesktop.org,
 AJvYcCX/+5z5WqUnBvITk4lhSluQ3p3SvMBedsDbMurjpQHM53orUvc9bJm5UrquDpYqJqexXvfyFBpg@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzAMCKKiw/VulM+Q0NalJvL8LlVodNGkg8hXqKhS9KSzpQG0bC+
 79N8SnH0s5RTSV0fjfb7qg2wh2vUDD4MLJOBAHYDUDqLRGSVR36G
X-Gm-Gg: ASbGncs1p0vtWviIUr5KiEE6hgMtaSI8MwQAwPw4X7Nsd7BDmqMKID3oqMVXuNKiaaw
 S/YvJJ0o8MVXG61VzeTf+tv/Dnwuenet19bO/YxVZD0MTOhjTlDhd42wLGSn+iQjnjeL8+OlFRq
 uGOZwwjywZXIMDRYIgThQiIfBjMy5w9weDhYHcapfgdj9L2JSBPQM81VWkkoSQCEX6YmD7K4Q6q
 kc9zNVnBuvPAyd/haUKh2aWvoEUobbQ5o/CvMxmOO/0uGLHh5Vifjy1vws6hbbBUFzlverRh+hZ
 7tjJr9XYVFmHy1VtpcTe6tk5xUfmdy6KzaS0khZgEcikOQasCZS2h/9pzpuCAM6BXmnP4GYgMnI
 =
X-Google-Smtp-Source: AGHT+IEgzescCHeHDWaMlfq3nBVEJmi/RrlnV3iRbLYs4Zah/upROHEPM5uf5oZcTDJs4Sqo1XOncg==
X-Received: by 2002:a17:902:e88a:b0:223:f9a4:3fa8 with SMTP id
 d9443c01a7336-22c5359e645mr291266235ad.19.1745422219874; 
 Wed, 23 Apr 2025 08:30:19 -0700 (PDT)
Received: from xodo-linux.tailb46509.ts.net
 ([2804:1b1:f981:da76:6d68:714d:9e9f:1b31])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22c50eb4839sm105921335ad.127.2025.04.23.08.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 08:30:19 -0700 (PDT)
From: Leonardo Gomes <leonardodasigomes@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: derick.william.moraes@gmail.com,
 Leonardo da Silva Gomes <leonardodasigomes@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amd/display: Adjust prefix of dcn31_apg construct
 function name
Date: Wed, 23 Apr 2025 12:30:07 -0300
Message-ID: <20250423153010.20019-1-leonardodasigomes@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 24 Apr 2025 07:25:56 +0000
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

From: Leonardo da Silva Gomes <leonardodasigomes@gmail.com>

Adjust the dcn31_apg construct function name from
'apg31_construct' to 'dcn31_apg_construct'.
This helps the ftrace to detect the file by the function name.

Signed-off-by: Leonardo da Silva Gomes <leonardodasigomes@gmail.com>
Co-developed-by: Derick Frias <derick.william.moraes@gmail.com>
Signed-off-by: Derick Frias <derick.william.moraes@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.c                | 2 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.h                | 2 +-
 drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c  | 2 +-
 .../gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c    | 2 +-
 .../gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c    | 2 +-
 .../gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c    | 2 +-
 drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c  | 2 +-
 .../gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c    | 2 +-
 drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c  | 2 +-
 .../gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c    | 2 +-
 drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c  | 2 +-
 .../gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c    | 2 +-
 12 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.c
index 05aac3e444b4..d1ccc9a34b2e 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.c
@@ -101,7 +101,7 @@ static struct apg_funcs dcn31_apg_funcs = {
 	.disable_apg			= apg31_disable,
 };
 
-void apg31_construct(struct dcn31_apg *apg31,
+void dcn31_apg_construct(struct dcn31_apg *apg31,
 	struct dc_context *ctx,
 	uint32_t inst,
 	const struct dcn31_apg_registers *apg_regs,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.h b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.h
index 1b81f6773c53..54c6b62195c2 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.h
@@ -100,7 +100,7 @@ struct dcn31_apg {
 	const struct dcn31_apg_mask *apg_mask;
 };
 
-void apg31_construct(struct dcn31_apg *apg3,
+void dcn31_apg_construct(struct dcn31_apg *apg3,
 	struct dc_context *ctx,
 	uint32_t inst,
 	const struct dcn31_apg_registers *apg_regs,
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c
index dddddbfef85f..b3553ae26d7c 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c
@@ -1207,7 +1207,7 @@ static struct apg *dcn31_apg_create(
 	if (!apg31)
 		return NULL;
 
-	apg31_construct(apg31, ctx, inst,
+	dcn31_apg_construct(apg31, ctx, inst,
 			&apg_regs[inst],
 			&apg_shift,
 			&apg_mask);
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c
index 26becc4cb804..be55a3c36a78 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c
@@ -1263,7 +1263,7 @@ static struct apg *dcn31_apg_create(
 	if (!apg31)
 		return NULL;
 
-	apg31_construct(apg31, ctx, inst,
+	dcn31_apg_construct(apg31, ctx, inst,
 			&apg_regs[inst],
 			&apg_shift,
 			&apg_mask);
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c
index 6c2bb3f63be1..b9847b4bb0f3 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c
@@ -1205,7 +1205,7 @@ static struct apg *dcn31_apg_create(
 	if (!apg31)
 		return NULL;
 
-	apg31_construct(apg31, ctx, inst,
+	dcn31_apg_construct(apg31, ctx, inst,
 			&apg_regs[inst],
 			&apg_shift,
 			&apg_mask);
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c
index 568094827212..b6cf2a296ab4 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c
@@ -1200,7 +1200,7 @@ static struct apg *dcn31_apg_create(
 	if (!apg31)
 		return NULL;
 
-	apg31_construct(apg31, ctx, inst,
+	dcn31_apg_construct(apg31, ctx, inst,
 			&apg_regs[inst],
 			&apg_shift,
 			&apg_mask);
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
index 2a59cc61ed8c..66fef6f6000e 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
@@ -1187,7 +1187,7 @@ static struct apg *dcn31_apg_create(
 	apg_regs_init(2),
 	apg_regs_init(3);
 
-	apg31_construct(apg31, ctx, inst,
+	dcn31_apg_construct(apg31, ctx, inst,
 			&apg_regs[inst],
 			&apg_shift,
 			&apg_mask);
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
index 38d76434683e..9be23da216d0 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
@@ -1170,7 +1170,7 @@ static struct apg *dcn321_apg_create(
 	apg_regs_init(2),
 	apg_regs_init(3);
 
-	apg31_construct(apg31, ctx, inst,
+	dcn31_apg_construct(apg31, ctx, inst,
 			&apg_regs[inst],
 			&apg_shift,
 			&apg_mask);
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
index ffd2b816cd02..27affafb14f1 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
@@ -1252,7 +1252,7 @@ static struct apg *dcn31_apg_create(
 	apg_regs_init(2),
 	apg_regs_init(3);
 
-	apg31_construct(apg31, ctx, inst,
+	dcn31_apg_construct(apg31, ctx, inst,
 			&apg_regs[inst],
 			&apg_shift,
 			&apg_mask);
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
index 98f5bc1b929e..d5341b0d59f3 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
@@ -1232,7 +1232,7 @@ static struct apg *dcn31_apg_create(
 	apg_regs_init(2),
 	apg_regs_init(3);
 
-	apg31_construct(apg31, ctx, inst,
+	dcn31_apg_construct(apg31, ctx, inst,
 			&apg_regs[inst],
 			&apg_shift,
 			&apg_mask);
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c
index b6468573dc33..6fb2261c554d 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c
@@ -1233,7 +1233,7 @@ static struct apg *dcn31_apg_create(
 	apg_regs_init(2),
 	apg_regs_init(3);
 
-	apg31_construct(apg31, ctx, inst,
+	dcn31_apg_construct(apg31, ctx, inst,
 			&apg_regs[inst],
 			&apg_shift,
 			&apg_mask);
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
index 7436dfbdf927..ef4d758bfb5a 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
@@ -1162,7 +1162,7 @@ static struct apg *dcn401_apg_create(
 	apg_regs_init(2),
 	apg_regs_init(3);
 
-	apg31_construct(apg31, ctx, inst,
+	dcn31_apg_construct(apg31, ctx, inst,
 			&apg_regs[inst],
 			&apg_shift,
 			&apg_mask);
-- 
2.43.0

