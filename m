Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CB27716D2
	for <lists+dri-devel@lfdr.de>; Sun,  6 Aug 2023 23:44:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E26210E126;
	Sun,  6 Aug 2023 21:43:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36B8010E6E5
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 11:32:43 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1bc411e9d17so11503925ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 04:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691148763; x=1691753563;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VfvBijsO2sMlDrlMC7AyPHbFWwb0ahNV79UVj+FEisM=;
 b=U70dWupWM2FxVvKo+UYn/YBIE4+3RwWguzMzX9YZgY3H5HcliIY1JdK6NyTrSCMCtl
 7uR5IN+PMCPAtQVuYB11ypayUnXrLZ2/RUJj4Ml1i34TkQWrcahCY5axBckLdhuyuDtJ
 sy/KqPOssCahHDs7pdlwmffWMDxq2ivladpzNutqTNuUzcuVzc+r8BhX0KsdUKYmC73i
 K2vedwwlHSCOCWT3CKXRAnSUqu1RJkkUYaDhs6kP08BxWCXXFhZexd3srflWOoEiuZfb
 1UEc4KS9p32fF6SEyJNM8Xtdv37f0t99VQ0GgJWaZ1Q9Tnf1JoYaqAUxCRHt+W6OvuDM
 15jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691148763; x=1691753563;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VfvBijsO2sMlDrlMC7AyPHbFWwb0ahNV79UVj+FEisM=;
 b=AbWVhzG9+T/UWcOazUqexrY0hN3fHrvFrYs3by+mjDWhSlf3J28B1rGFNjRSWCBOpt
 amB9/Libhecvopy4c8u4+hqva0QVoy/kC01GJGu5RXis6UamD9F0xNA1+C91VDx9Xvx+
 TW5xnQGXYlXwPXsC7WwDOw0DWedr1TStbx7U7kcmqVeuA9c57meJ/qZiiexryEGIJrTV
 5KQVWB7Rutwy0E1KqsLjlAlJPfDg3yyZWk1r0P47uWL/4BkSLCp5YQ2gnzjm/y97P7bk
 Zq9u8ZXasqM/Nlh3oUJ3QIb9l/iduJIdPQy+G4puG36DcbVEbWas8hu534W0TBs3H2bS
 gz1A==
X-Gm-Message-State: AOJu0YyPZV76ADHOlVxyJns7OcisDhx11HNklrB4NWaYUlTAR3ClizH/
 hN61qUATZD4SkGxQhcNzaJI=
X-Google-Smtp-Source: AGHT+IG9dvCYmEptOFC9VjllrZMWd5c+brV4DTFKrmiuaeUagZRje6Mdh2k+6LaXQABWjnvTuQ3P7g==
X-Received: by 2002:a17:902:f94e:b0:1b3:f5c3:7682 with SMTP id
 kx14-20020a170902f94e00b001b3f5c37682mr1049005plb.68.1691148762695; 
 Fri, 04 Aug 2023 04:32:42 -0700 (PDT)
Received: from ubuntu777.domain.name (36-228-73-13.dynamic-ip.hinet.net.
 [36.228.73.13]) by smtp.gmail.com with ESMTPSA id
 iw3-20020a170903044300b001b857352285sm1536501plb.247.2023.08.04.04.32.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 04:32:42 -0700 (PDT)
From: Min-Hua Chen <minhuadotchen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>,
	Helge Deller <deller@gmx.de>
Subject: [PATCH v2] fbcon: mark fbcon_registered_fb static
Date: Fri,  4 Aug 2023 19:32:35 +0800
Message-Id: <20230804113237.51653-1-minhuadotchen@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 06 Aug 2023 21:43:48 +0000
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

Mark fbcon_registered_fb, and fbcon_num_registered_fb static
to fix the following sparse warnings:

drivers/video/fbdev/core/fbcon.c:105:16: sparse: warning: symbol 'fbcon_registered_fb' was not declared. Should it be static?
drivers/video/fbdev/core/fbcon.c:106:5: sparse: warning: symbol 'fbcon_num_registered_fb' was not declared. Should it be static?

No functional change intended.

Cc: Helge Deller <deller@gmx.de>
Signed-off-by: Min-Hua Chen <minhuadotchen@gmail.com>

---

change since v1:
1. registered_fb and num_registered_fb are still used in drivers/staging/olpc_dcon,
so do keep them as-is.
2. change the subject to fbcon: mark fbcon_registered_fb static
---
 drivers/video/fbdev/core/fbcon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 887fad44e7ec..976900d6893c 100644
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
-- 
2.34.1

