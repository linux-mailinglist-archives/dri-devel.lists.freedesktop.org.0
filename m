Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BE9BBDBB2
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 12:40:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0281B10E3FA;
	Mon,  6 Oct 2025 10:40:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yAPjTCl0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66DFC10E3FE;
 Mon,  6 Oct 2025 10:40:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3C1AC402FD;
 Mon,  6 Oct 2025 10:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F50AC4CEF5;
 Mon,  6 Oct 2025 10:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1759747232;
 bh=hRUwo/egmKtYizinN+lZPyk5o+wDa0XBzri8/EfCHC0=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=yAPjTCl0sfEgwVZ3258/XsA75XTw/uTKdLn5Y2Gs00jqdpEuxNxfsOoN0aSZp6y4s
 SMs3jjwnt9yWAV1ddqcczQWwVYbVwrg8FQyX8vDyXWt2BQE2DB6VwBHMbzeRTWpB1u
 edk5Q2OhZ2XzlZeKoVwieYNZNYiLcnP+jqh+7AVo=
Subject: Patch "minmax.h: use BUILD_BUG_ON_MSG() for the lo < hi test in
 clamp()" has been added to the 6.1-stable tree
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
Date: Mon, 06 Oct 2025 12:39:12 +0200
In-Reply-To: <20251003121520.8176-9-farbere@amazon.com>
Message-ID: <2025100612-party-nineteen-6995@gregkh>
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

    minmax.h: use BUILD_BUG_ON_MSG() for the lo < hi test in clamp()

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     minmax.h-use-build_bug_on_msg-for-the-lo-hi-test-in-clamp.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-183179-greg=kroah.com@vger.kernel.org Fri Oct  3 14:27:07 2025
From: Eliav Farber <farbere@amazon.com>
Date: Fri, 3 Oct 2025 12:15:17 +0000
Subject: minmax.h: use BUILD_BUG_ON_MSG() for the lo < hi test in clamp()
To: <gregkh@linuxfoundation.org>, <kenneth.feng@amd.com>, <alexander.deucher@amd.com>, <christian.koenig@amd.com>, <airlied@gmail.com>, <simona@ffwll.ch>, <linus.walleij@linaro.org>, <dmitry.torokhov@gmail.com>, <tglx@linutronix.de>, <wens@csie.org>, <jernej.skrabec@gmail.com>, <samuel@sholland.org>, <agk@redhat.com>, <snitzer@kernel.org>, <mpatocka@redhat.com>, <clm@fb.com>, <dsterba@suse.com>, <luc.vanoostenryck@gmail.com>, <pmladek@suse.com>, <rostedt@goodmis.org>, <andriy.shevchenko@linux.intel.com>, <linux@rasmusvillemoes.dk>, <senozhatsky@chromium.org>, <akpm@linux-foundation.org>, <lijo.lazar@amd.com>, <asad.kamal@amd.com>, <kevinyang.wang@amd.com>, <David.Laight@ACULAB.COM>, <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>, <dm-devel@lists.linux.dev>, <linux-btrfs@vger.kernel.org>, <linux-sparse@vger.kernel.org>, <stable@vger.
 kernel.org>, <farbere@amazon.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Christoph Hellwig <hch@infradead.org>, Dan Carpenter <dan.carpenter@linaro.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Jens Axboe <axboe@kernel.dk>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Mateusz Guzik <mjguzik@gmail.com>, "Matthew Wilcox" <willy@infradead.org>, Pedro Falcato <pedro.falcato@gmail.com>
Message-ID: <20251003121520.8176-9-farbere@amazon.com>

From: David Laight <David.Laight@ACULAB.COM>

[ Upstream commit a5743f32baec4728711bbc01d6ac2b33d4c67040 ]

Use BUILD_BUG_ON_MSG(statically_true(ulo > uhi), ...) for the sanity check
of the bounds in clamp().  Gives better error coverage and one less
expansion of the arguments.

Link: https://lkml.kernel.org/r/34d53778977747f19cce2abb287bb3e6@AcuMS.aculab.com
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
 include/linux/minmax.h |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

--- a/include/linux/minmax.h
+++ b/include/linux/minmax.h
@@ -106,8 +106,7 @@
 	__auto_type uval = (val);						\
 	__auto_type ulo = (lo);							\
 	__auto_type uhi = (hi);							\
-	static_assert(__builtin_choose_expr(__is_constexpr((lo) > (hi)), 	\
-			(lo) <= (hi), true),					\
+	BUILD_BUG_ON_MSG(statically_true(ulo > uhi),				\
 		"clamp() low limit " #lo " greater than high limit " #hi);	\
 	BUILD_BUG_ON_MSG(!__types_ok3(uval, ulo, uhi),				\
 		"clamp("#val", "#lo", "#hi") signedness error");		\


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
