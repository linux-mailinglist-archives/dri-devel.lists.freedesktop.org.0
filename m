Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBE17532C3
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 09:15:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 229C210E7D0;
	Fri, 14 Jul 2023 07:14:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD2A10E0B8
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 00:37:53 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-666e3b15370so1009485b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 17:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689295073; x=1691887073;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CctAjUFV1xpereksxrBg0+mczOOOQo8Ume+knSAyNSA=;
 b=lYJpcJRJb9SNL3nkgSZJixYh9SFl72yF1riPiYiU8ciraE3COWM1XxqEcRv2LXBGi4
 wQx9jFsqpPNRfK1lPzrOVs3ut0a5jR8GlT/JvhNyeHGIewXMcfMxxWBFmDMyH1JjL8lU
 lntJP6Y3pGlDGZo8MrpLf+8844EE+0JJdNCG3gGFfKMcuzrOqN39yFFpm3H7BWPQvkLG
 FtWgm+EsPtlACRVy2WfZOPx/FzVJd4bazCeZjywlak2gDsY4yR+3FoIzmISFHqRYuv97
 20/M90KLBiKKvcVVLCN7PbMnGsw6/NJwo211cglp84au5+sOuJd0izOZnPxTgQOHTl2w
 AxkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689295073; x=1691887073;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CctAjUFV1xpereksxrBg0+mczOOOQo8Ume+knSAyNSA=;
 b=NzKoaSDpIa3gI9oPSg3NKZ87wkjAE7nZXn07TdafiBZ1TJgxv7TRs/dWnEZpA2EyYE
 9cl9xDjCqR/rSq7D4fV+sIItjd7FvyXNmG9cjl9oMpXcA07F13TiBlo112SIYkG7eN9v
 8phuL9pc7NSOL1sNSm8txW8j6x3P21/6j0eFJo7DQfTSihnZ7OkHkXcQjrde1q7ZlE2k
 RE44h/2E87qEC4vytNo/UzhhXZ5fVBhxHPmiVQU6rLt+5W8L2nReCdSq78n3D9nW5/lF
 21TtsiR+NXeGRKjjl46fGkGuMq5vYB2GIY7P8M5PYJMLRFikkznAsQJaREKhML69oLYa
 idiA==
X-Gm-Message-State: ABy/qLaFaMI6YoDiVHt5wLbd32xXu2GeLlYEgFoCcEK7tZrlJV/goBmc
 4aYZNPS/NfO8RR78bcF5uhE=
X-Google-Smtp-Source: APBJJlEiHiaptAXuvtXrlZ6sVYZbgFP0Qaahhb0xY+3xGXgYFbidFVi2AxUIRJJ595Diplb5DXLQVA==
X-Received: by 2002:a05:6a00:2492:b0:64d:5b4b:8429 with SMTP id
 c18-20020a056a00249200b0064d5b4b8429mr3305331pfv.18.1689295072299; 
 Thu, 13 Jul 2023 17:37:52 -0700 (PDT)
Received: from ubuntu777.domain.name (36-228-70-13.dynamic-ip.hinet.net.
 [36.228.70.13]) by smtp.gmail.com with ESMTPSA id
 s11-20020a62e70b000000b006825003a276sm5970384pfh.42.2023.07.13.17.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 17:37:51 -0700 (PDT)
From: Min-Hua Chen <minhuadotchen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>,
	Helge Deller <deller@gmx.de>
Subject: [PATCH] fbdev: fbmem: mark registered_fb static
Date: Fri, 14 Jul 2023 08:37:46 +0800
Message-Id: <20230714003748.91129-1-minhuadotchen@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 14 Jul 2023 07:14:54 +0000
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Min-Hua Chen <minhuadotchen@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Mark registered_fb, num_registered_fb, fbcon_registered_fb, and
fbcon_num_registered_fb static to fix the following sparse
warnings:

drivers/video/fbdev/core/fbmem.c:51:16: sparse: warning: symbol 'registered_fb' was not declared. Should it be static?
drivers/video/fbdev/core/fbmem.c:52:5: sparse: warning: symbol 'num_registered_fb' was not declared. Should it be static?
drivers/video/fbdev/core/fbcon.c:105:16: sparse: warning: symbol 'fbcon_registered_fb' was not declared. Should it be static?
drivers/video/fbdev/core/fbcon.c:106:5: sparse: warning: symbol 'fbcon_num_registered_fb' was not declared. Should it be static?

No functional change intended.

Signed-off-by: Min-Hua Chen <minhuadotchen@gmail.com>
---
 drivers/video/fbdev/core/fbcon.c | 4 ++--
 drivers/video/fbdev/core/fbmem.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index c6c9d040bdec..4336c7d64ed0 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -102,8 +102,8 @@ enum {
 
 static struct fbcon_display fb_display[MAX_NR_CONSOLES];
 
-struct fb_info *fbcon_registered_fb[FB_MAX];
-int fbcon_num_registered_fb;
+static struct fb_info *fbcon_registered_fb[FB_MAX];
+static int fbcon_num_registered_fb;
 
 #define fbcon_for_each_registered_fb(i)		\
 	for (i = 0; WARN_CONSOLE_UNLOCKED(), i < FB_MAX; i++)		\
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 329d16e49a90..18355655959a 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -48,8 +48,8 @@
 
 static DEFINE_MUTEX(registration_lock);
 
-struct fb_info *registered_fb[FB_MAX] __read_mostly;
-int num_registered_fb __read_mostly;
+static struct fb_info *registered_fb[FB_MAX] __read_mostly;
+static int num_registered_fb __read_mostly;
 #define for_each_registered_fb(i)		\
 	for (i = 0; i < FB_MAX; i++)		\
 		if (!registered_fb[i]) {} else
-- 
2.34.1

