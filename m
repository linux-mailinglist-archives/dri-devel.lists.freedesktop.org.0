Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 298F4124134
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 09:13:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A7F16E22D;
	Wed, 18 Dec 2019 08:13:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A9946E21E
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 03:00:31 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id a15so542122otf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 19:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kwTUvw7XaRz2SlqwuKp+LVG2T88wKaGXcyDmN7449mo=;
 b=M/qv0ZCZkJmxKvIbZ4PXNPWC/fhpd48XEONEmvva4ejd2BHXSxvrlhZ7SCIYEmuoFv
 Ik5Xu3mWH63/5iHKxKWWHrTFKDsSQESLrupFeEt0xZb8NwQOwIGFJav3ttaH0m6GNW51
 XHYXeh1pHCczyCjIBveXYhH4SNvpZfTuggOrRzKdUnSpnpuAn9NDAbupV8pQE8C6v/Eo
 yMIEMVS+FeOGTWwjy801kTD5c/BB8fQJHqdlGXk/oqCu4max09GZAxwLb7LzQLLemhcP
 oBdSSOspGKJk6mKm7uFQ6W0wt16uOedOnliZPdJ67Iv1R6PGlT18n48Pe7xj7+Ppm5sf
 GwLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kwTUvw7XaRz2SlqwuKp+LVG2T88wKaGXcyDmN7449mo=;
 b=EQUuJzKk8XwY9lUS6VvuQq9tY5jp1eyurlo9NGtxp31uYVzMHQxierYcPfc9Ji0MOR
 1F5Oj/sn40ndYZvpt1aeaw2YLlaKbybIlxXtwBNqs2UB0Y5ynJTqfUOT6fGJBHvN3eSi
 oERtzoi9MKqqg4Izi8782Fz04VMg/qQjIHYs+03Dnoy0ckUNcy4YXrwVZ3jXeS97O9qz
 F9pyPq/35mUcZK5Z6IZHTYUZxBKj2RU2yNIkWtx2lYk9+ybkOENdDhzIhxE50kdUSswJ
 BtG0wd7m0A894YGo2Va3kdSaaDXZEHMlCr9ztksFK5ykCDrZZAV2E4oRnCs0G2bqV2Xq
 Ir9Q==
X-Gm-Message-State: APjAAAV/kwR0yz6ChJp8EqaVdWm9qoPzGGRa80Z0fcne3lve/ursM9sE
 CuT6TqO+Fp8apDEUbZqudlU=
X-Google-Smtp-Source: APXvYqwi52DW7BTH/Joy63L2i6a/L8NgInTxr1fjqelbSr7NB6xlsFO0WENr+MWp3f3/50zFaX0Qbg==
X-Received: by 2002:a05:6830:1442:: with SMTP id
 w2mr29328otp.143.1576638030607; 
 Tue, 17 Dec 2019 19:00:30 -0800 (PST)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id b3sm327530oie.25.2019.12.17.19.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 19:00:30 -0800 (PST)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] fbmem: Adjust indentation in fb_prepare_logo and fb_blank
Date: Tue, 17 Dec 2019 20:00:25 -0700
Message-Id: <20191218030025.10064-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Mailman-Approved-At: Wed, 18 Dec 2019 08:13:02 +0000
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
Cc: Nathan Chancellor <natechancellor@gmail.com>,
 clang-built-linux@googlegroups.com, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Clang warns:

../drivers/video/fbdev/core/fbmem.c:665:3: warning: misleading
indentation; statement is not part of the previous 'else'
[-Wmisleading-indentation]
        if (fb_logo.depth > 4 && depth > 4) {
        ^
../drivers/video/fbdev/core/fbmem.c:661:2: note: previous statement is
here
        else
        ^
../drivers/video/fbdev/core/fbmem.c:1075:3: warning: misleading
indentation; statement is not part of the previous 'if'
[-Wmisleading-indentation]
        return ret;
        ^
../drivers/video/fbdev/core/fbmem.c:1072:2: note: previous statement is
here
        if (!ret)
        ^
2 warnings generated.

This warning occurs because there are spaces before the tabs on these
lines. Normalize the indentation in these functions so that it is
consistent with the Linux kernel coding style and clang no longer warns.

Fixes: 1692b37c99d5 ("fbdev: Fix logo if logo depth is less than framebuffer depth")
Link: https://github.com/ClangBuiltLinux/linux/issues/825
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 drivers/video/fbdev/core/fbmem.c | 36 ++++++++++++++++----------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 0662b61fdb50..bf63cc0e6b65 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -662,20 +662,20 @@ int fb_prepare_logo(struct fb_info *info, int rotate)
 		fb_logo.depth = 1;
 
 
- 	if (fb_logo.depth > 4 && depth > 4) {
- 		switch (info->fix.visual) {
- 		case FB_VISUAL_TRUECOLOR:
- 			fb_logo.needs_truepalette = 1;
- 			break;
- 		case FB_VISUAL_DIRECTCOLOR:
- 			fb_logo.needs_directpalette = 1;
- 			fb_logo.needs_cmapreset = 1;
- 			break;
- 		case FB_VISUAL_PSEUDOCOLOR:
- 			fb_logo.needs_cmapreset = 1;
- 			break;
- 		}
- 	}
+	if (fb_logo.depth > 4 && depth > 4) {
+		switch (info->fix.visual) {
+		case FB_VISUAL_TRUECOLOR:
+			fb_logo.needs_truepalette = 1;
+			break;
+		case FB_VISUAL_DIRECTCOLOR:
+			fb_logo.needs_directpalette = 1;
+			fb_logo.needs_cmapreset = 1;
+			break;
+		case FB_VISUAL_PSEUDOCOLOR:
+			fb_logo.needs_cmapreset = 1;
+			break;
+		}
+	}
 
 	height = fb_logo.logo->height;
 	if (fb_center_logo)
@@ -1060,19 +1060,19 @@ fb_blank(struct fb_info *info, int blank)
 	struct fb_event event;
 	int ret = -EINVAL;
 
- 	if (blank > FB_BLANK_POWERDOWN)
- 		blank = FB_BLANK_POWERDOWN;
+	if (blank > FB_BLANK_POWERDOWN)
+		blank = FB_BLANK_POWERDOWN;
 
 	event.info = info;
 	event.data = &blank;
 
 	if (info->fbops->fb_blank)
- 		ret = info->fbops->fb_blank(blank, info);
+		ret = info->fbops->fb_blank(blank, info);
 
 	if (!ret)
 		fb_notifier_call_chain(FB_EVENT_BLANK, &event);
 
- 	return ret;
+	return ret;
 }
 EXPORT_SYMBOL(fb_blank);
 
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
