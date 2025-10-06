Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7472FBBDB8B
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 12:40:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3ABB10E3F7;
	Mon,  6 Oct 2025 10:40:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sHWJaofK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FFEC10E3F4;
 Mon,  6 Oct 2025 10:40:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 19E7660443;
 Mon,  6 Oct 2025 10:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BA40C116C6;
 Mon,  6 Oct 2025 10:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1759747214;
 bh=VD4FksyOEEntg+E9uemdhHfPPNgyIxwuIYBNUdy8Cq8=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=sHWJaofKEoyQ8nW1zpj20/wx9FKufE8/bgTzCeGqzeyCSBRYuYi8W0VRLgfYp2mQS
 MnLwPB9rk/TAqG2TyUUZiF4bwxVS5U9B0L7Oo4+KjmD88elqNsleQOEpo68EERubx9
 PKCE3C5o51wwUN9HyP6EYLyISOlRvKg1+1vBjItc=
Subject: Patch "minmax.h: add whitespace around operators and after commas"
 has been added to the 6.1-stable tree
To: David.Laight@ACULAB.COM, Jason@zx2c4.com, agk@redhat.com, airlied@gmail.com,
 akpm@linux-foundation.org, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, andriy.shevchenko@linux.intel.com,
 arnd@kernel.org, asad.kamal@amd.com, axboe@kernel.dk, christian.koenig@amd.com,
 clm@fb.com, dan.carpenter@linaro.org, david.laight@aculab.com,
 dm-devel@lists.linux.dev, dmitry.torokhov@gmail.com,
 dri-devel@lists.freedesktop.org, dsterba@suse.com, farbere@amazon.com,
 gregkh@linuxfoundation.org, hch@infradead.org, jernej.skrabec@gmail.com,
 kenneth.feng@amd.com, kevinyang.wang@amd.com, lijo.lazar@amd.com,
 linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux@rasmusvillemoes.dk,
 lorenzo.stoakes@oracle.com, luc.vanoostenryck@gmail.com, mjguzik@gmail.com,
 mpatocka@redhat.com, pedro.falcato@gmail.com, pmladek@suse.com,
 rostedt@goodmis.org, samuel@sholland.org, senozhatsky@chromium.org,
 simona@ffwll.ch, snitzer@kernel.org, tglx@linutronix.de, wens@csie.org,
 willy@infradead.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 06 Oct 2025 12:39:10 +0200
In-Reply-To: <20251003121520.8176-6-farbere@amazon.com>
Message-ID: <2025100610-unskilled-worrisome-7d77@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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


This is a note to let you know that I've just added the patch titled

    minmax.h: add whitespace around operators and after commas

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     minmax.h-add-whitespace-around-operators-and-after-commas.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-183176-greg=kroah.com@vger.kernel.org Fri Oct  3 14:18:18 2025
From: Eliav Farber <farbere@amazon.com>
Date: Fri, 3 Oct 2025 12:15:14 +0000
Subject: minmax.h: add whitespace around operators and after commas
To: <gregkh@linuxfoundation.org>, <kenneth.feng@amd.com>, <alexander.deucher@amd.com>, <christian.koenig@amd.com>, <airlied@gmail.com>, <simona@ffwll.ch>, <linus.walleij@linaro.org>, <dmitry.torokhov@gmail.com>, <tglx@linutronix.de>, <wens@csie.org>, <jernej.skrabec@gmail.com>, <samuel@sholland.org>, <agk@redhat.com>, <snitzer@kernel.org>, <mpatocka@redhat.com>, <clm@fb.com>, <dsterba@suse.com>, <luc.vanoostenryck@gmail.com>, <pmladek@suse.com>, <rostedt@goodmis.org>, <andriy.shevchenko@linux.intel.com>, <linux@rasmusvillemoes.dk>, <senozhatsky@chromium.org>, <akpm@linux-foundation.org>, <lijo.lazar@amd.com>, <asad.kamal@amd.com>, <kevinyang.wang@amd.com>, <David.Laight@ACULAB.COM>, <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>, <dm-devel@lists.linux.dev>, <linux-btrfs@vger.kernel.org>, <linux-sparse@vger.kernel.org>, <stable@vger.
 kernel.org>, <farbere@amazon.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Christoph Hellwig <hch@infradead.org>, Dan Carpenter <dan.carpenter@linaro.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Jens Axboe <axboe@kernel.dk>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Mateusz Guzik <mjguzik@gmail.com>, "Matthew Wilcox" <willy@infradead.org>, Pedro Falcato <pedro.falcato@gmail.com>
Message-ID: <20251003121520.8176-6-farbere@amazon.com>

From: David Laight <David.Laight@ACULAB.COM>

[ Upstream commit 71ee9b16251ea4bf7c1fe222517c82bdb3220acc ]

Patch series "minmax.h: Cleanups and minor optimisations".

Some tidyups and minor changes to minmax.h.

This patch (of 7):

Link: https://lkml.kernel.org/r/c50365d214e04f9ba256d417c8bebbc0@AcuMS.aculab.com
Link: https://lkml.kernel.org/r/f04b2e1310244f62826267346fde0553@AcuMS.aculab.com
Signed-off-by: David Laight <david.laight@aculab.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Jason A. Donenfeld <Jason@zx2c4.com>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Mateusz Guzik <mjguzik@gmail.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Pedro Falcato <pedro.falcato@gmail.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Eliav Farber <farbere@amazon.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 include/linux/minmax.h |   34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

--- a/include/linux/minmax.h
+++ b/include/linux/minmax.h
@@ -51,10 +51,10 @@
  * only need to be careful to not cause warnings for
  * pointer use.
  */
-#define __signed_type_use(x,ux) (2+__is_nonneg(x,ux))
-#define __unsigned_type_use(x,ux) (1+2*(sizeof(ux)<4))
-#define __sign_use(x,ux) (is_signed_type(typeof(ux))? \
-	__signed_type_use(x,ux):__unsigned_type_use(x,ux))
+#define __signed_type_use(x, ux) (2 + __is_nonneg(x, ux))
+#define __unsigned_type_use(x, ux) (1 + 2 * (sizeof(ux) < 4))
+#define __sign_use(x, ux) (is_signed_type(typeof(ux)) ? \
+	__signed_type_use(x, ux) : __unsigned_type_use(x, ux))
 
 /*
  * To avoid warnings about casting pointers to integers
@@ -74,15 +74,15 @@
 #ifdef CONFIG_64BIT
   #define __signed_type(ux) long
 #else
-  #define __signed_type(ux) typeof(__builtin_choose_expr(sizeof(ux)>4,1LL,1L))
+  #define __signed_type(ux) typeof(__builtin_choose_expr(sizeof(ux) > 4, 1LL, 1L))
 #endif
-#define __is_nonneg(x,ux) statically_true((__signed_type(ux))(x)>=0)
+#define __is_nonneg(x, ux) statically_true((__signed_type(ux))(x) >= 0)
 
-#define __types_ok(x,y,ux,uy) \
-	(__sign_use(x,ux) & __sign_use(y,uy))
+#define __types_ok(x, y, ux, uy) \
+	(__sign_use(x, ux) & __sign_use(y, uy))
 
-#define __types_ok3(x,y,z,ux,uy,uz) \
-	(__sign_use(x,ux) & __sign_use(y,uy) & __sign_use(z,uz))
+#define __types_ok3(x, y, z, ux, uy, uz) \
+	(__sign_use(x, ux) & __sign_use(y, uy) & __sign_use(z, uz))
 
 #define __cmp_op_min <
 #define __cmp_op_max >
@@ -97,7 +97,7 @@
 
 #define __careful_cmp_once(op, x, y, ux, uy) ({		\
 	__auto_type ux = (x); __auto_type uy = (y);	\
-	BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),	\
+	BUILD_BUG_ON_MSG(!__types_ok(x, y, ux, uy),	\
 		#op"("#x", "#y") signedness error");	\
 	__cmp(op, ux, uy); })
 
@@ -114,7 +114,7 @@
 	static_assert(__builtin_choose_expr(__is_constexpr((lo) > (hi)), 	\
 			(lo) <= (hi), true),					\
 		"clamp() low limit " #lo " greater than high limit " #hi);	\
-	BUILD_BUG_ON_MSG(!__types_ok3(val,lo,hi,uval,ulo,uhi),			\
+	BUILD_BUG_ON_MSG(!__types_ok3(val, lo, hi, uval, ulo, uhi),		\
 		"clamp("#val", "#lo", "#hi") signedness error");		\
 	__clamp(uval, ulo, uhi); })
 
@@ -154,7 +154,7 @@
 
 #define __careful_op3(op, x, y, z, ux, uy, uz) ({			\
 	__auto_type ux = (x); __auto_type uy = (y);__auto_type uz = (z);\
-	BUILD_BUG_ON_MSG(!__types_ok3(x,y,z,ux,uy,uz),			\
+	BUILD_BUG_ON_MSG(!__types_ok3(x, y, z, ux, uy, uz),		\
 		#op"3("#x", "#y", "#z") signedness error");		\
 	__cmp(op, ux, __cmp(op, uy, uz)); })
 
@@ -326,9 +326,9 @@ static inline bool in_range32(u32 val, u
  * Use these carefully: no type checking, and uses the arguments
  * multiple times. Use for obvious constants only.
  */
-#define MIN(a,b) __cmp(min,a,b)
-#define MAX(a,b) __cmp(max,a,b)
-#define MIN_T(type,a,b) __cmp(min,(type)(a),(type)(b))
-#define MAX_T(type,a,b) __cmp(max,(type)(a),(type)(b))
+#define MIN(a, b) __cmp(min, a, b)
+#define MAX(a, b) __cmp(max, a, b)
+#define MIN_T(type, a, b) __cmp(min, (type)(a), (type)(b))
+#define MAX_T(type, a, b) __cmp(max, (type)(a), (type)(b))
 
 #endif	/* _LINUX_MINMAX_H */


Patches currently in stable-queue which might be from farbere@amazon.com are

queue-6.1/minmax-improve-macro-expansion-and-type-checking.patch
queue-6.1/minmax.h-simplify-the-variants-of-clamp.patch
queue-6.1/minmax.h-move-all-the-clamp-definitions-after-the-min-max-ones.patch
queue-6.1/minmax-don-t-use-max-in-situations-that-want-a-c-constant-expression.patch
queue-6.1/minmax.h-remove-some-defines-that-are-only-expanded-once.patch
queue-6.1/minmax.h-use-build_bug_on_msg-for-the-lo-hi-test-in-clamp.patch
queue-6.1/minmax-simplify-min-max-clamp-implementation.patch
queue-6.1/minmax.h-add-whitespace-around-operators-and-after-commas.patch
queue-6.1/minmax-fix-up-min3-and-max3-too.patch
queue-6.1/minmax.h-reduce-the-define-expansion-of-min-max-and-clamp.patch
queue-6.1/minmax.h-update-some-comments.patch
