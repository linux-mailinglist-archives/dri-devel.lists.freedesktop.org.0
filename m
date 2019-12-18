Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 931FA12415D
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 09:14:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53AAA6E27A;
	Wed, 18 Dec 2019 08:13:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B41296E21E
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 02:53:48 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id r27so488752otc.8
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 18:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=napGSWjNbtalCcb/TGth7a+gCE4XiYyJESJ2KzfJmU8=;
 b=hs0MAylM1x9OeqPMSPUXXG4f/LQFGdgUZ+x09WQNrJ6Is+O9oD5Yz4jKugxFxQzh7n
 S9bw9s50RChQY5ZGMz76zzUpS1LFrrARuogPumZpCpxuAEhE+QB5MxGeJaKNzvwOuOiQ
 YPgor9D+jr0x3K0qnhzgruo6r0y9XBCLMhokJiNc2AI26q3ckHXNU4pF3tRcS+cRtkId
 qM4t1XRlWudrz2fDAxMCfN4HpXkPgE+W34bSz+J5Ycf7GvNuRcSBzMyIIt59UkKxQBHd
 OujXN65VcqHiTytgficx6Bq6nF6nRNhz1l/+Ak3lmmG/dxdjfjGkOs52tT0ehE30R7fZ
 bGNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=napGSWjNbtalCcb/TGth7a+gCE4XiYyJESJ2KzfJmU8=;
 b=GbRR8zaU3aOdOoTWcwBmSwsNDwaqDkaouAqgWcpkNZcmF0Ej7/0cG0hKM6odLai57A
 uCTm1tVkZiQuIuIcd/m9G0mpmEOZXtSfonZblwJXwF7BgP6enNK4pirEgzRH9DzMli2P
 ucjfbZq8AzCAkEL0L3EM7cFNZBTPRzNg3TPDWvqim6DHvLYpKooF13nDSSFfKXyNwozn
 B/qZ9zXeN+sAdRBxoodgXgG2i9lRvskF3H82SMVosYMCcBgdd8fJZeXwuLNExPvT+v/V
 5/fUPE7y41jP0pC36uATTyLxZNduTjAkAoMHWWalsyNsClqk/2PWO8JZe484iE9VUU9n
 ANrQ==
X-Gm-Message-State: APjAAAWFJu07Bq2IJrTfYq4uixhm8/UWl+3U8t4UOVOmK1Idscfv7uTO
 zhuQDdP5rJxA95ARokT+foc=
X-Google-Smtp-Source: APXvYqweUnGyc7Bkuy40mtuJwRPbvb6R4a3nrdaFBq7qRzNeSOHozOIJBbv5SpCrYTFmG64y7nKIEg==
X-Received: by 2002:a05:6830:2361:: with SMTP id r1mr51151oth.88.1576637627813; 
 Tue, 17 Dec 2019 18:53:47 -0800 (PST)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id q16sm279817otl.74.2019.12.17.18.53.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 18:53:47 -0800 (PST)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] fbcon: Adjust indentation in set_con2fb_map
Date: Tue, 17 Dec 2019 19:53:37 -0700
Message-Id: <20191218025337.35044-1-natechancellor@gmail.com>
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

../drivers/video/fbdev/core/fbcon.c:915:3: warning: misleading
indentation; statement is not part of the previous 'if'
[-Wmisleading-indentation]
        return err;
        ^
../drivers/video/fbdev/core/fbcon.c:912:2: note: previous statement is
here
        if (!search_fb_in_map(info_idx))
        ^
1 warning generated.

This warning occurs because there is a space before the tab on this
line. This happens on several lines in this function; normalize them
so that the indentation is consistent with the Linux kernel coding
style and clang no longer warns.

This warning was introduced before the beginning of git history so no
fixes tab.

Link: https://github.com/ClangBuiltLinux/linux/issues/824
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 drivers/video/fbdev/core/fbcon.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index c9235a2f42f8..9d2c43e345a4 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -866,7 +866,7 @@ static int set_con2fb_map(int unit, int newidx, int user)
 	int oldidx = con2fb_map[unit];
 	struct fb_info *info = registered_fb[newidx];
 	struct fb_info *oldinfo = NULL;
- 	int found, err = 0;
+	int found, err = 0;
 
 	WARN_CONSOLE_UNLOCKED();
 
@@ -888,31 +888,30 @@ static int set_con2fb_map(int unit, int newidx, int user)
 
 	con2fb_map[unit] = newidx;
 	if (!err && !found)
- 		err = con2fb_acquire_newinfo(vc, info, unit, oldidx);
-
+		err = con2fb_acquire_newinfo(vc, info, unit, oldidx);
 
 	/*
 	 * If old fb is not mapped to any of the consoles,
 	 * fbcon should release it.
 	 */
- 	if (!err && oldinfo && !search_fb_in_map(oldidx))
- 		err = con2fb_release_oldinfo(vc, oldinfo, info, unit, oldidx,
- 					     found);
+	if (!err && oldinfo && !search_fb_in_map(oldidx))
+		err = con2fb_release_oldinfo(vc, oldinfo, info, unit, oldidx,
+					     found);
 
- 	if (!err) {
- 		int show_logo = (fg_console == 0 && !user &&
- 				 logo_shown != FBCON_LOGO_DONTSHOW);
+	if (!err) {
+		int show_logo = (fg_console == 0 && !user &&
+				 logo_shown != FBCON_LOGO_DONTSHOW);
 
- 		if (!found)
- 			fbcon_add_cursor_timer(info);
- 		con2fb_map_boot[unit] = newidx;
- 		con2fb_init_display(vc, info, unit, show_logo);
+		if (!found)
+			fbcon_add_cursor_timer(info);
+		con2fb_map_boot[unit] = newidx;
+		con2fb_init_display(vc, info, unit, show_logo);
 	}
 
 	if (!search_fb_in_map(info_idx))
 		info_idx = newidx;
 
- 	return err;
+	return err;
 }
 
 /*
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
