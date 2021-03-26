Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C9F34A79C
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 13:55:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE206E1F4;
	Fri, 26 Mar 2021 12:55:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F2BC6E1F4
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 12:55:39 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id l1so860510plg.12
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 05:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=bD7BmJLsMFKPJi26Vt4AcHwe8h+Gi9tyJ2So5fUgWQg=;
 b=PBEzo7+X1jjaDjoT3sILVgIkuqHSGdjHybEj7ugJj1stn7nVD9ZjNdIzhw27oj9PKj
 Fl8f1ZyIlCxaAWvLdbnyU2OUClBKnKnSdpWVPrZaDIPsFL+BFXGgBX1e8Aiu7GR1COka
 gm7zDpYF0Wbv7eAvf65i3fUpKVY0ldy/5N7arDvwH9gZMjw8Oh3nQiI0x8/QbqNSZHrB
 1TLs+10jsNDzoBkowEJIDeZKosA2d2f0zSnC5FcujIoEX8KVpWz+MBB/J4jr883ziy/0
 L8nvqiSsgYK/3Cn6DBu5DAhalefbp60+jyL2hBEp8b5a3dKozwPqCgv34JEDFdNMIrNH
 XG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=bD7BmJLsMFKPJi26Vt4AcHwe8h+Gi9tyJ2So5fUgWQg=;
 b=dqHgzA8Wi75yjym5Gp0yWjG6tXfXtR8JVo8JMzXLeVtrNc7aItQGgj/HLEa0lxwQ2e
 lKtWb7N/wJ55Phnr155kdM75PapRWjezLz/uEbdXS5zDh3prLEAzi34aN6T6nFMeNiVb
 f0kizAIuBzKq8agiLddIrxHJDppIRQz3em71aIbGF8YVy6GACgKDWe02X2itftmCz42H
 Jnlg2T38Ais13qNV9KXh1+pR+QQDdD/rmvIyUMjPmpi6fMVQq7i+chu8DM9itwOSBnqN
 tPFBtOwN4gdmoO/x7kbTZVxgDtLOSfI3u6zgpwAATV8VVpKK87Ia57ZObYlcGLEe79xc
 zquA==
X-Gm-Message-State: AOAM5329U7U7bDCzanWh1lDEpi88M5NJANx+65cKtU44ON9vZG78RWxx
 /TLt5AHRS+FEfps+2FcKbKc=
X-Google-Smtp-Source: ABdhPJyBJT+jB/6VmowdbHzWRJITwo+Vt9TueqySl4LbJbSV6+tKmwR9e21rR/tQvLODSxDkupaGow==
X-Received: by 2002:a17:90a:8a8b:: with SMTP id
 x11mr13657566pjn.151.1616763338813; 
 Fri, 26 Mar 2021 05:55:38 -0700 (PDT)
Received: from bf-rmsz-10.ccdomain.com ([103.220.76.197])
 by smtp.gmail.com with ESMTPSA id l190sm9164110pfl.73.2021.03.26.05.55.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Mar 2021 05:55:38 -0700 (PDT)
From: Carlis <zhangxuezhi3@gmail.com>
To: gregkh@linuxfoundation.org,
	zhangxuezhi1@yulong.com
Subject: [PATCH v2] staging: fbtft: fix a typo
Date: Fri, 26 Mar 2021 20:55:51 +0800
Message-Id: <1616763351-7433-1-git-send-email-zhangxuezhi3@gmail.com>
X-Mailer: git-send-email 1.9.1
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xuezhi Zhang <zhangxuezhi1@yulong.com>

Change 'tft' to 'TFT'

Signed-off-by: Xuezhi Zhang <zhangxuezhi1@yulong.com>
---
v2: use full name.
 drivers/staging/fbtft/fbtft-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 4f362da..44e7acb 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -775,7 +775,7 @@ void fbtft_framebuffer_release(struct fb_info *info)
 EXPORT_SYMBOL(fbtft_framebuffer_release);
 
 /**
- *	fbtft_register_framebuffer - registers a tft frame buffer device
+ *	fbtft_register_framebuffer - registers a TFT frame buffer device
  *	@fb_info: frame buffer info structure
  *
  *  Sets SPI driverdata if needed
@@ -873,7 +873,7 @@ int fbtft_register_framebuffer(struct fb_info *fb_info)
 EXPORT_SYMBOL(fbtft_register_framebuffer);
 
 /**
- *	fbtft_unregister_framebuffer - releases a tft frame buffer device
+ *	fbtft_unregister_framebuffer - releases a TFT frame buffer device
  *	@fb_info: frame buffer info structure
  *
  *  Frees SPI driverdata if needed
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
