Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 897E61D9418
	for <lists+dri-devel@lfdr.de>; Tue, 19 May 2020 12:13:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 638136E526;
	Tue, 19 May 2020 10:13:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C4496E526
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 10:13:32 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id z72so2839788wmc.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 03:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X6K+Z1CSvGtqQsqD8CriMcqf56uYOKJc39Ks8CDjqTM=;
 b=iopwi7CtVMI5ilc5zJkrxjVUGyGQTPVNcF1NkiHM449g8v0Z3Y+63YpONo83q9JRLL
 al8jxtbCSnVmlGX0rHOJ+fde1+BzGFgtu9CzuFu1rUi3I7pAlwxkTmfxDQeWo0BonxAU
 UYmuuR/1in26LevtxEOKLCIxPj05ZwEEeXCpS1n/UA+SOJDX9g26dSJN4nMMLDcrkKfc
 oo/M1VJgdWnrWPEVpO4BT8pEABRHkoamvELIH3CwDE0fvRuIA0oQX7xBYBbzRFpVH7Wu
 zDBrI5uqQ3H2JZTiB8SmeuDQu3WpXFiBWpLKd8g+x6Yz6A4aOg3pQ7OJd5SjibHcH2jr
 i3qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X6K+Z1CSvGtqQsqD8CriMcqf56uYOKJc39Ks8CDjqTM=;
 b=QGka0YyQprhqFLz82GAcucz97MLrZDMoQ0mj721m4t5Tu2y9+zvo1Kt1SwuimjCRqR
 IhG3G7C9ouqc8tRbGD0yVW3R+Pb1K+DTECWZVK8Yyy/XUuzN4RRchLbW2jRKRmQgnCdP
 mKqhGC2vmpFG+iW5E/9mHmCSv2pkd7ycNUfQe63jebwVIL0F4IWdUoM74lI+u6BgR6QX
 IRa5Iu4lEK2r7hWTqkPwm7X6DMBTr3+JkdbvNETYATuVk+n8JUkwh1uVFdXJyNDV/rDK
 dMraFg8PIV+RgiPqzq3QJhhNHwx6X4J7ipFfp0qwYBCcwesxXWpynNQrGmYmQZXGOPJI
 INxA==
X-Gm-Message-State: AOAM532ypYFxQKHw/sMdm3Ur8DmRKG7Qfj3HX15Oos1uDXSsnpxJRB33
 WykOVrNUrD79jb6fYCVhN5XYAJZH
X-Google-Smtp-Source: ABdhPJxJZzBMGYT1evxpLrM3NICH3JOpg0hGlRJvCdXKUsRsJ0MrmxCDY86Mj+n2Rri0BschUhh4uA==
X-Received: by 2002:a7b:c41a:: with SMTP id k26mr4702169wmi.85.1589883210597; 
 Tue, 19 May 2020 03:13:30 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id 81sm3555065wme.16.2020.05.19.03.13.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 03:13:30 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] linux/bits.h: adjust GENMASK_INPUT_CHECK() check
Date: Tue, 19 May 2020 11:13:20 +0100
Message-Id: <20200519101320.33495-1-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>, emil.l.velikov@gmail.com,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Recently the GENMASK_INPUT_CHECK() was added, aiming to catch cases
where there GENMASK arguments are flipped.

Although it seems to be triggering -Wtype-limits in the following cases:

   unsigned foo = (10 + x);
   unsigned bar = GENMASK(foo, 0);

   const unsigned foo = (10 + x);
   unsigned bar = GENMASK(foo, 0);

Here are the warnings, from my GCC 9.2 box.

warning: comparison of unsigned expression < 0 is always false [-Wtype-limits]
   __builtin_constant_p((l) > (h)), (l) > (h), 0)))
                            ^
warning: comparison of unsigned expression < 0 is always false [-Wtype-limits]
   __builtin_constant_p((l) > (h)), (l) > (h), 0)))
                                        ^

This results in people disabling the warning all together or promoting
foo to signed. Either of which being a sub par option IMHO.

Add a trivial "+ 1" to each h and l in the constant expression.

Fixes: 295bcca84916 ("linux/bits.h: add compile time sanity check of
GENMASK inputs")
Cc: Rikard Falkeborn <rikard.falkeborn@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
From some quick testing, this works as expected although I could be
wrong.

-Emil
---
 include/linux/bits.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/bits.h b/include/linux/bits.h
index 4671fbf28842..5e3ca57adc20 100644
--- a/include/linux/bits.h
+++ b/include/linux/bits.h
@@ -22,8 +22,8 @@
 	(!defined(CONFIG_CC_IS_GCC) || CONFIG_GCC_VERSION >= 49000)
 #include <linux/build_bug.h>
 #define GENMASK_INPUT_CHECK(h, l) \
-	(BUILD_BUG_ON_ZERO(__builtin_choose_expr( \
-		__builtin_constant_p((l) > (h)), (l) > (h), 0)))
+	(BUILD_BUG_ON_ZERO(!__builtin_choose_expr( \
+		__builtin_constant_p((l + 1) > (h + 1)), (l + 1) > (h + 1), 0)))
 #else
 /*
  * BUILD_BUG_ON_ZERO is not available in h files included from asm files,
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
