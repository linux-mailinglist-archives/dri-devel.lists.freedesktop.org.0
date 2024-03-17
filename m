Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F5E87DECF
	for <lists+dri-devel@lfdr.de>; Sun, 17 Mar 2024 17:36:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08FF810E32F;
	Sun, 17 Mar 2024 16:36:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QFn1Lz0H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E0410E32F
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Mar 2024 16:36:18 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-6e6ee9e3cffso2050402b3a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Mar 2024 09:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710693378; x=1711298178; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=OF79KXhVjtXexZ/GpI6MkY7a20tX+4xRmIvmqST+AnU=;
 b=QFn1Lz0HbcQGzJ005x35UB4PYTGukHwtZ/m0nEjDe+VBDy2rYZZm4Wd30t0fgjnqpr
 HsJ4NiYzpyAFUmar44ZVMSwPzDwnGg05TLyZH5Cm78KzBu0204zVuGgS+OUAEZeiUK1L
 AGLwSaZLMxuuV0GA+rk6pHIg14gU/kOSmxaWb9hKMvskGG0fFOewW07bC9/7UhdV7ZjA
 AK5ujJpUrd6kiGs/wwC+5ITwYn33utlZOf9pAUQS7482tdvt3uSA2a8QI/SOA+nWUvUF
 6XiTYyMizLXzvK1hkmijgIm9AwnJVoiBlKlhdEGEHNAWxowqK6BeKavKas6o7aosjnp1
 cgGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710693378; x=1711298178;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OF79KXhVjtXexZ/GpI6MkY7a20tX+4xRmIvmqST+AnU=;
 b=tdyPGJcJcQc954669YSdYXUv2GYxt+MLQ17NZGjAqUHJ/b1pbKJshoV1/aYU9LI3F0
 RuYlZ4SugOy00UW9ewL7GQ1LdFDWSLQSnry1f38lONQcmIHNz0I0GxAYxp+k3CyaoFM6
 +kBsgtzRRl5JC0KhOte84mqkGV904LlyCyjYy4/JawSq90dDih2VD1thJ9x85Gz29kgG
 stT+JQzF24MPT/ZgtZvrdMTG8Anh8rX3Qdu3JpIbQJxqt9/1+JUsB69c6udkMycz1xeM
 i8Yt4fbd2xYca+GKLTR4uhsMOHEBGdvIcaCUXc3rQkZqf9Gf4dYCLTnI6tqZN7EhOkzn
 HE1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVphD1Sp9P+0+4nT5/E8PLi4gtUCEoKNhk2aCfbB53iT35+FikTI041jjjaELErzJ4LYO4+vFao2e8xKkLKSioSQ6BL06ZuxIJPB9HqKISz
X-Gm-Message-State: AOJu0YzTG0wP08qxHrLEn/YP8MR6N09ggtBaZRVkz35LHZgaKfnBf7b0
 tuCCRR1XEjuf5a7HjuZXfFAzwP2JRdu2TsxMZpH/RPirjWsqQ2zd
X-Google-Smtp-Source: AGHT+IGa2J0FGsz6KPc52ig70pMekzfNXoYYgf9jnNcxMqsM/th4nXVjaLrcgxRudeFE0v35xphm8A==
X-Received: by 2002:a05:6a20:e123:b0:1a3:4ff4:219b with SMTP id
 kr35-20020a056a20e12300b001a34ff4219bmr9172546pzb.12.1710693378049; 
 Sun, 17 Mar 2024 09:36:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 p24-20020aa78618000000b006e4f311f61bsm6373725pfn.103.2024.03.17.09.36.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Mar 2024 09:36:17 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] drm/sun4i: Drop COMPILE_TEST
Date: Sun, 17 Mar 2024 09:36:15 -0700
Message-Id: <20240317163615.563428-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
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

Attempts to build the sun4i drm code on various architectures using gcc 11.x
or older fails with

ERROR: modpost: "__udivdi3" [drivers/gpu/drm/sun4i/sun4i-drm-hdmi.ko] undefined!

This is due to commit 358e76fd613a ("drm/sun4i: hdmi: Consolidate
atomic_check and mode_valid") which introduces a constant 64-bit divide
operation. Some compilers / compiler versions fail to translate this
operation into fixed code.

Manual exclusion lists such as "Only build test this code on this subset of
architectures" or "Do not test this code on this set of architectures"
do not scale. Remove COMPILE_TEST support for the suni4 drm driver instead
to ensure that test builds are only performed on supported architectures.

Fixes: 358e76fd613a ("drm/sun4i: hdmi: Consolidate atomic_check and mode_valid")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/gpu/drm/sun4i/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/Kconfig b/drivers/gpu/drm/sun4i/Kconfig
index 4741d9f6544c..015539bfda2a 100644
--- a/drivers/gpu/drm/sun4i/Kconfig
+++ b/drivers/gpu/drm/sun4i/Kconfig
@@ -2,7 +2,7 @@
 config DRM_SUN4I
 	tristate "DRM Support for Allwinner A10 Display Engine"
 	depends on DRM && COMMON_CLK
-	depends on ARCH_SUNXI || COMPILE_TEST
+	depends on ARCH_SUNXI
 	select DRM_GEM_DMA_HELPER
 	select DRM_KMS_HELPER
 	select DRM_PANEL
-- 
2.39.2

