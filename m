Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02620BECA64
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 10:39:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FEE310E38E;
	Sat, 18 Oct 2025 08:38:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GnSRlmd0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8111310EC3D;
 Fri, 17 Oct 2025 13:50:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C994F643A4;
 Fri, 17 Oct 2025 13:50:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 428C7C4CEF9;
 Fri, 17 Oct 2025 13:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1760709005;
 bh=dmLSOb2GYlnT9o1IkzmIVv/9ztWuUVzDp82QHtRSSS8=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=GnSRlmd0RtwXk/OVucv97XC2fxDtarMsik6x8upmP4o2u+cekk7MY6s05aPjBeFFp
 h/4X3h3X9WtLvRI9Scrx2awB4Y6i95XAs6CRIzzTr+coAWKcQM5/+HnmipPa1yqZxv
 YFKLIh7u92D3jKwiQ9EUaSnbdBWSj8l3R2t2eUwk=
Subject: Patch "overflow,
 tracing: Define the is_signed_type() macro once" has been added to
 the 5.10-stable tree
To: David.Laight@ACULAB.COM, Jason@zx2c4.com,
	adilger.kernel@dilger.ca, agk@redhat.com, airlied@linux.ie,
	akpm@linux-foundation.org, alexander.deucher@amd.com,
	alexandre.torgue@st.com, amd-gfx@lists.freedesktop.org,
	andriy.shevchenko@linux.intel.com, anton.ivanov@cambridgegreys.com,
	arnd@arndb.de, artur.paszkiewicz@intel.com, bp@alien8.de,
	brian.starkey@arm.com, bvanassche@acm.org, chao@kernel.org,
	christian.koenig@amd.com, clm@fb.com, coreteam@netfilter.org,
	dan.j.williams@intel.com, daniel@ffwll.ch,
	dave.hansen@linux.intel.com, davem@davemloft.net,
	dm-devel@redhat.com, dmitry.torokhov@gmail.com,
	dri-devel@lists.freedesktop.org, dsterba@suse.com, dushistov@mail.ru,
	edumazet@google.com, evan.quan@amd.com, farbere@amazon.com,
	fery@cypress.com, freedreno@lists.freedesktop.org, fw@strlen.de,
	gregkh@linuxfoundation.org, harry.wentland@amd.com,
	hdegoede@redhat.com, herve.codina@bootlin.com, hpa@zytor.com,
	intel-linux-scu@intel.com, isabbasso@riseup.net, jack@suse.com,
	james.morse@arm.com, james.qian.wang@arm.com, jdelvare@suse.com,
	j@freedesktop.org, dike@addtoit.com, jejb@linux.ibm.com,
	jmaloy@redhat.com, joabreu@synopsys.com, josef@toxicpanda.com,
	jpoimboe@kernel.org, kadlec@netfilter.org, kbusch@kernel.org,
	keescook@chromium.org, kuba@kernel.org, kuznet@ms2.inr.ac.ru,
	linux-arm-kernel@lists.infradead.org, linux-erofs@lists.ozlabs.org,
	linux-mm@kvack.org, linux-staging@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-um@lists.infradead.org, linux@armlinux.org.uk,
	linux@rasmusvillemoes.dk, linux@roeck-us.net, liviu.dudau@arm.com,
	luc.vanoostenryck@gmail.com, luto@kernel.org,
	maarten.lankhorst@linux.intel.com, malattia@linux.it,
	martin.petersen@oracle.com, mchehab@kernel.org,
	mcoquelin.stm32@gmail.com, mgross@linux.intel.com,
	mhiramat@kernel.org, mihail.atanassov@arm.com, minchan@kernel.org,
	mingo@redhat.com, mripard@kernel.org, nathan@kernel.org,
	ndesaulniers@google.com, ngupta@vflare.org, pablo@netfilter.org,
	peppe.cavallaro@st.com, peterz@infradead.org, pmladek@suse.com,
	qiuxu.zhuo@intel.com, rajur@chelsio.com, richard@nod.at,
	robdclark@gmail.com, rosted@freedesktop.org, t@goodmis.org,
	rric@kernel.org, ruanjinjie@huawei.com, sakari.ailus@linux.intel.com,
	sander@svanheule.net, sashal@kernel.org, sean@poorly.run,
	sergey.senozhatsky@gmail.com, snitzer@redhat.com, sunpeng.li@amd.com,
	tglx@linutronix.de, tipc-discussion@lists.sourceforge.net,
	tony.luck@intel.com, tytso@mit.edu, tzimmermann@suse.de,
	vbabka@suse.cz,
	whjH6p+qzwUdx5SOVVHjS3WvzJQr6mDUwhEyTf6pJWzaQ@mail.gmail.com,
	willy@infradead.org,
	wjQGnVfb4jehFR0XyZikdQvCZouE96xR_nnf5kqaM5qqQ@mail.gmail.com,
	x86@kernel.org, xiang@kernel.org, ying.xue@windriver.com,
	yoshfuji@linux-ipv6.org, yury.norov@gmail.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Fri, 17 Oct 2025 15:48:34 +0200
In-Reply-To: <20251017090519.46992-2-farbere@amazon.com>
Message-ID: <2025101734-uncertain-tragedy-c5de@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
X-Mailman-Approved-At: Sat, 18 Oct 2025 08:38:36 +0000
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

    overflow, tracing: Define the is_signed_type() macro once

to the 5.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     overflow-tracing-define-the-is_signed_type-macro-once.patch
and it can be found in the queue-5.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From linux-staging+bounces-34939-greg=kroah.com@lists.linux.dev Fri Oct 17 11:09:40 2025
From: Eliav Farber <farbere@amazon.com>
Date: Fri, 17 Oct 2025 09:04:53 +0000
Subject: overflow, tracing: Define the is_signed_type() macro once
To: <gregkh@linuxfoundation.org>, <stable@vger.kernel.org>, <linux@armlinux.org.uk>, <jdike@addtoit.com>, <richard@nod.at>, <anton.ivanov@cambridgegreys.com>, <dave.hansen@linux.intel.com>, <luto@kernel.org>, <peterz@infradead.org>, <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>, <x86@kernel.org>, <hpa@zytor.com>, <tony.luck@intel.com>, <qiuxu.zhuo@intel.com>, <mchehab@kernel.org>, <james.morse@arm.com>, <rric@kernel.org>, <harry.wentland@amd.com>, <sunpeng.li@amd.com>, <alexander.deucher@amd.com>, <christian.koenig@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>, <evan.quan@amd.com>, <james.qian.wang@arm.com>, <liviu.dudau@arm.com>, <mihail.atanassov@arm.com>, <brian.starkey@arm.com>, <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>, <tzimmermann@suse.de>, <robdclark@gmail.com>, <sean@poorly.run>, <jdelvare@suse.com>, <linux@roeck-us.net>, <fery@cypress.com>, <dmitry.torokhov@gmail.com>, <agk@redhat.com>, <snitzer@redhat.com>, <dm-devel@redhat.com>, <rajur@chelsio
 .com>, <davem@davemloft.net>, <kuba@kernel.org>, <peppe.cavallaro@st.com>, <alexandre.torgue@st.com>, <joabreu@synopsys.com>, <mcoquelin.stm32@gmail.com>, <malattia@linux.it>, <hdegoede@redhat.com>, <mgross@linux.intel.com>, <intel-linux-scu@intel.com>, <artur.paszkiewicz@intel.com>, <jejb@linux.ibm.com>, <martin.petersen@oracle.com>, <sakari.ailus@linux.intel.com>, <clm@fb.com>, <josef@toxicpanda.com>, <dsterba@suse.com>, <xiang@kernel.org>, <chao@kernel.org>, <jack@suse.com>, <tytso@mit.edu>, <adilger.kernel@dilger.ca>, <dushistov@mail.ru>, <luc.vanoostenryck@gmail.com>, <rostedt@goodmis.org>, <pmladek@suse.com>, <sergey.senozhatsky@gmail.com>, <andriy.shevchenko@linux.intel.com>, <linux@rasmusvillemoes.dk>, <minchan@kernel.org>, <ngupta@vflare.org>, <akpm@linux-foundation.org>, <kuznet@ms2.inr.ac.ru>, <yoshfuji@linux-ipv6.org>, <pablo@netfilter.org>, <kadlec@netfilter.org>, <fw@strlen.de>, <jmaloy@redhat.com>, <ying.xue@windriver.com>, <willy@infradead.org>, <farbere@amazon.com>,
  <sashal@kernel.org>, <ruanjinjie@huawei.com>, <David.Laight@ACULAB.COM>, <herve.codina@bootlin.com>, <Jason@zx2c4.com>, <keescook@chromium.org>, <kbusch@kernel.org>, <nathan@kernel.org>, <bvanassche@acm.org>, <ndesaulniers@google.com>, <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, <linux-um@lists.infradead.org>, <linux-edac@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>, <linux-hwmon@vger.kernel.org>, <linux-input@vger.kernel.org>, <linux-media@vger.kernel.org>, <netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>, <platform-driver-x86@vger.kernel.org>, <linux-scsi@vger.kernel.org>, <linux-staging@lists.linux.dev>, <linux-btrfs@vger.kernel.org>, <linux-erofs@lists.ozlabs.org>, <linux-ext4@vger.kernel.org>, <linux-sparse@vger.kernel.org>, <linux-mm@kvack.org>, <netfilter-devel@vger.kernel.org>, <coreteam@netfilter.org>, <tipc-discussion@
 lists.sourceforge.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Dan Williams <dan.j.williams@intel.com>, Eric Dumazet <edumazet@google.com>, Isabella Basso <isabbasso@riseup.net>, Josh Poimboeuf <jpoimboe@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Sander Vanheule <sander@svanheule.net>, Vlastimil Babka <vbabka@suse.cz>, Yury Norov <yury.norov@gmail.com>
Message-ID: <20251017090519.46992-2-farbere@amazon.com>

From: Bart Van Assche <bvanassche@acm.org>

[ Upstream commit 92d23c6e94157739b997cacce151586a0d07bb8a ]

There are two definitions of the is_signed_type() macro: one in
<linux/overflow.h> and a second definition in <linux/trace_events.h>.

As suggested by Linus Torvalds, move the definition of the
is_signed_type() macro into the <linux/compiler.h> header file. Change
the definition of the is_signed_type() macro to make sure that it does
not trigger any sparse warnings with future versions of sparse for
bitwise types. See also:
https://lore.kernel.org/all/CAHk-=whjH6p+qzwUdx5SOVVHjS3WvzJQr6mDUwhEyTf6pJWzaQ@mail.gmail.com/
https://lore.kernel.org/all/CAHk-=wjQGnVfb4jehFR0XyZikdQvCZouE96xR_nnf5kqaM5qqQ@mail.gmail.com/

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Isabella Basso <isabbasso@riseup.net>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Sander Vanheule <sander@svanheule.net>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Yury Norov <yury.norov@gmail.com>
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Kees Cook <keescook@chromium.org>
Link: https://lore.kernel.org/r/20220826162116.1050972-3-bvanassche@acm.org
Signed-off-by: Eliav Farber <farbere@amazon.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 include/linux/compiler.h     |    6 ++++++
 include/linux/overflow.h     |    1 -
 include/linux/trace_events.h |    2 --
 3 files changed, 6 insertions(+), 3 deletions(-)

--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -246,6 +246,12 @@ static inline void *offset_to_ptr(const
 #define __must_be_array(a)	BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
 
 /*
+ * Whether 'type' is a signed type or an unsigned type. Supports scalar types,
+ * bool and also pointer types.
+ */
+#define is_signed_type(type) (((type)(-1)) < (__force type)1)
+
+/*
  * This is needed in functions which generate the stack canary, see
  * arch/x86/kernel/smpboot.c::start_secondary() for an example.
  */
--- a/include/linux/overflow.h
+++ b/include/linux/overflow.h
@@ -29,7 +29,6 @@
  * https://mail-index.netbsd.org/tech-misc/2007/02/05/0000.html -
  * credit to Christian Biere.
  */
-#define is_signed_type(type)       (((type)(-1)) < (type)1)
 #define __type_half_max(type) ((type)1 << (8*sizeof(type) - 1 - is_signed_type(type)))
 #define type_max(T) ((T)((__type_half_max(T) - 1) + __type_half_max(T)))
 #define type_min(T) ((T)((T)-type_max(T)-(T)1))
--- a/include/linux/trace_events.h
+++ b/include/linux/trace_events.h
@@ -700,8 +700,6 @@ extern int trace_add_event_call(struct t
 extern int trace_remove_event_call(struct trace_event_call *call);
 extern int trace_event_get_offsets(struct trace_event_call *call);
 
-#define is_signed_type(type)	(((type)(-1)) < (type)1)
-
 int ftrace_set_clr_event(struct trace_array *tr, char *buf, int set);
 int trace_set_clr_event(const char *system, const char *event, int set);
 int trace_array_set_clr_event(struct trace_array *tr, const char *system,


Patches currently in stable-queue which might be from farbere@amazon.com are

queue-5.10/minmax-allow-comparisons-of-int-against-unsigned-char-short.patch
queue-5.10/minmax-add-a-few-more-min_t-max_t-users.patch
queue-5.10/minmax-improve-macro-expansion-and-type-checking.patch
queue-5.10/minmax-fix-indentation-of-__cmp_once-and-__clamp_once.patch
queue-5.10/minmax.h-simplify-the-variants-of-clamp.patch
queue-5.10/minmax-add-in_range-macro.patch
queue-5.10/minmax.h-move-all-the-clamp-definitions-after-the-min-max-ones.patch
queue-5.10/minmax-allow-min-max-clamp-if-the-arguments-have-the-same-signedness.patch
queue-5.10/minmax-don-t-use-max-in-situations-that-want-a-c-constant-expression.patch
queue-5.10/minmax.h-remove-some-defines-that-are-only-expanded-once.patch
queue-5.10/minmax.h-use-build_bug_on_msg-for-the-lo-hi-test-in-clamp.patch
queue-5.10/minmax-simplify-min-max-clamp-implementation.patch
queue-5.10/minmax-deduplicate-__unconst_integer_typeof.patch
queue-5.10/minmax-simplify-and-clarify-min_t-max_t-implementation.patch
queue-5.10/minmax.h-add-whitespace-around-operators-and-after-commas.patch
queue-5.10/minmax-sanity-check-constant-bounds-when-clamping.patch
queue-5.10/minmax-avoid-overly-complicated-constant-expressions-in-vm-code.patch
queue-5.10/minmax-make-generic-min-and-max-macros-available-everywhere.patch
queue-5.10/minmax-fix-up-min3-and-max3-too.patch
queue-5.10/minmax.h-reduce-the-define-expansion-of-min-max-and-clamp.patch
queue-5.10/minmax-fix-header-inclusions.patch
queue-5.10/minmax-introduce-min-max-_array.patch
queue-5.10/btrfs-remove-duplicated-in_range-macro.patch
queue-5.10/overflow-tracing-define-the-is_signed_type-macro-once.patch
queue-5.10/minmax-relax-check-to-allow-comparison-between-unsigned-arguments-and-signed-constants.patch
queue-5.10/minmax-clamp-more-efficiently-by-avoiding-extra-comparison.patch
queue-5.10/minmax.h-update-some-comments.patch
