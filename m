Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E5CB336E5
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 08:55:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF0B10E239;
	Mon, 25 Aug 2025 06:55:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PRCNpo3V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B59410E236
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 02:31:53 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-2445806e03cso45350185ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Aug 2025 19:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756089112; x=1756693912; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hEDXk3YI1ppq8XrZvysREbE40c1EqMSzH1Ycau0V0x0=;
 b=PRCNpo3VMRIYd3racGfX3C+J7V1fs2lVh5nYwCQsUXA//1WKy9nuOgEQ186SSvP9uB
 50k2oLAjL3wPv+j1Tsl1g2X4YSvSVg0qYYV9qNUxcXuNGBwwz3Q+c4wIJzeI5wHZjeLV
 J+TLwYyfJHnuZK9eZwNBeWXfWpsyjzS1XiiPiCNWX7qcQpjOKZjPsR7il5qgKTTq4bfg
 cnL47lT612SqVhXy5qHvg/lz1EqcpPPB9/jJLExEHPfMzJFIixUSb0dH+hHRFcqTh4nA
 niyUIlwPwxYPalAVmAP6wYSUjeWTXgvy00sotS6ZbiRePVSlYR0NvuO7rfImB2VO6TNW
 eiRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756089112; x=1756693912;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hEDXk3YI1ppq8XrZvysREbE40c1EqMSzH1Ycau0V0x0=;
 b=YiihV34drcpjOJDABgI7aNenTuOao3GCClNaNzUovqhYp6+u1pNwd/HHH0RukCgLO+
 eQ1DE+h9O/QXDoF4SaO5B39Xc1GUZkF4/aBs5qStsYRU7+exHcyiNZwn0pZxvOa1vC4m
 Z+ei6mb4uy+xhQPJeZ/X47YyyDYLHCs+arP7uDOBXgptuXYhY8/RrDMvugh9695R/uht
 bgExLKJauY76D9dgcsv/EWbP2QgpKj3ggGhN5G+3UwhnVcD0kuWs9Uv8OrDqGuizB/2G
 ZAyfxq4QZK7Qf0ikjXrmmY29E4802voGU1TWMxoyO5x9cjB2j90tJp5QGHBYnRURU6O7
 NaTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUE1wfJ391L7Z5vzhYJgLuH7d4U87V0WX7bVrlId+mG31WTzGdOpSND4Df9+b+6SLzG4yWaPNHBqLs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxwcx0bKDqba1n1gt1iBtdYje098eNv/5pglVew2RhwNJv6INNC
 fgQqyGJZrtdV4jCK6FwSuCRS4fYc/L8bfe/+q0c4mWgIpIXY+CgYfjP8
X-Gm-Gg: ASbGncucgx67j4QAHySxbsuF5uqSLuOZAOTPokbKNuhtSDIfSzf8aBeW/t/Bwu3qAYw
 QwWHFj/8UQchlYxLfzv11CZ39DYi0Ic213rk3EhGBlOD/XnH/LIgqW76ICYAL2WYoyQeqt2gFMc
 7swJM2GqutrojwgSMyyHIat4/6qsROsnmE9feuNLJyswwvsb7TEa0R45tm4kTSSVFst8YwuOVyF
 VoFgvDqw+DfJYLelO5VcZHebeIrPssrVgtua7hKIM2F6wOrEkT06GIlxujOn1S6ErkJwpZoTJkG
 LrwbiBgTtAoFBvT/JpevUAZkl42woMA369RTi/EFnbErnpInMQg2M8Oakvk/exhvmrQcIG76SKd
 aUX5AfMe7x1xlwTodd91bhRWgPjGnTEMaSRRL8yCxIV+UUzO4ua+6G4sWqT/Cjbvg3Ke6VJa0I4
 4=
X-Google-Smtp-Source: AGHT+IGvyPlqdqig4mXFsHmtjBV9YF8gxzZSDkAdZlQGY1e3N0SakBpd1QLytsyfS5huP+/UcwJ3nw==
X-Received: by 2002:a17:903:238e:b0:240:50ef:2f00 with SMTP id
 d9443c01a7336-2462eea80fbmr165661135ad.26.1756089112460; 
 Sun, 24 Aug 2025 19:31:52 -0700 (PDT)
Received: from localhost.localdomain ([114.242.33.243])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-246687af234sm53905175ad.48.2025.08.24.19.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Aug 2025 19:31:51 -0700 (PDT)
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>,
 Yury Norov <yury.norov@gmail.com>, Qianqiang Liu <qianqiang.liu@163.com>,
 Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Shixiong Ou <oushixiong@kylinos.cn>,
 Jinchao Wang <wangjinchao600@gmail.com>, Zsolt Kajtar <soci@c64.rulez.org>,
 Ingo Molnar <mingo@kernel.org>, Nam Cao <namcao@linutronix.de>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Joel Granados <joel.granados@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Sohil Mehta <sohil.mehta@intel.com>,
 Feng Tang <feng.tang@linux.alibaba.com>,
 Sravan Kumar Gundu <sravankumarlpu@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Anna Schumaker <anna.schumaker@oracle.com>,
 "Darrick J. Wong" <djwong@kernel.org>,
 Max Kellermann <max.kellermann@ionos.com>,
 Yunhui Cui <cuiyunhui@bytedance.com>, Tejun Heo <tj@kernel.org>,
 Luo Gengkun <luogengkun@huaweicloud.com>, Li Huafei <lihuafei1@huawei.com>,
 Thorsten Blum <thorsten.blum@linux.dev>,
 Yicong Yang <yangyicong@hisilicon.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kexec@lists.infradead.org,
 linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 8/9] panic/printk: replace other_cpu_in_panic() with
 panic_on_other_cpu()
Date: Mon, 25 Aug 2025 10:29:36 +0800
Message-ID: <20250825022947.1596226-9-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250825022947.1596226-1-wangjinchao600@gmail.com>
References: <20250825022947.1596226-1-wangjinchao600@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 25 Aug 2025 06:55:43 +0000
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

The helper other_cpu_in_panic() duplicated logic already provided by
panic_on_other_cpu().

Remove other_cpu_in_panic() and update all users to call
panic_on_other_cpu() instead.

This removes redundant code and makes panic handling consistent.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 kernel/printk/internal.h |  1 -
 kernel/printk/nbcon.c    |  8 ++++----
 kernel/printk/printk.c   | 19 ++++---------------
 3 files changed, 8 insertions(+), 20 deletions(-)

diff --git a/kernel/printk/internal.h b/kernel/printk/internal.h
index ef282001f200..f72bbfa266d6 100644
--- a/kernel/printk/internal.h
+++ b/kernel/printk/internal.h
@@ -332,7 +332,6 @@ struct printk_message {
 	unsigned long		dropped;
 };
 
-bool other_cpu_in_panic(void);
 bool printk_get_next_message(struct printk_message *pmsg, u64 seq,
 			     bool is_extended, bool may_supress);
 
diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
index c6d1a4a747e9..171480135830 100644
--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -255,7 +255,7 @@ static int nbcon_context_try_acquire_direct(struct nbcon_context *ctxt,
 		 * opportunity to perform any necessary cleanup if they were
 		 * interrupted by the panic CPU while printing.
 		 */
-		if (other_cpu_in_panic() &&
+		if (panic_on_other_cpu() &&
 		    (!is_reacquire || cur->unsafe_takeover)) {
 			return -EPERM;
 		}
@@ -310,7 +310,7 @@ static bool nbcon_waiter_matches(struct nbcon_state *cur, int expected_prio)
 	 * Event #2 implies the new context is PANIC.
 	 * Event #3 occurs when panic() has flushed the console.
 	 * Event #4 occurs when a non-panic CPU reacquires.
-	 * Event #5 is not possible due to the other_cpu_in_panic() check
+	 * Event #5 is not possible due to the panic_on_other_cpu() check
 	 *          in nbcon_context_try_acquire_handover().
 	 */
 
@@ -349,7 +349,7 @@ static int nbcon_context_try_acquire_requested(struct nbcon_context *ctxt,
 	struct nbcon_state new;
 
 	/* Note that the caller must still remove the request! */
-	if (other_cpu_in_panic())
+	if (panic_on_other_cpu())
 		return -EPERM;
 
 	/*
@@ -447,7 +447,7 @@ static int nbcon_context_try_acquire_handover(struct nbcon_context *ctxt,
 	 * nbcon_waiter_matches(). In particular, the assumption that
 	 * lower priorities are ignored during panic.
 	 */
-	if (other_cpu_in_panic())
+	if (panic_on_other_cpu())
 		return -EPERM;
 
 	/* Handover is not possible on the same CPU. */
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index faa8b1f0585b..236f03937107 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -346,17 +346,6 @@ static void __up_console_sem(unsigned long ip)
 }
 #define up_console_sem() __up_console_sem(_RET_IP_)
 
-/*
- * Return true if a panic is in progress on a remote CPU.
- *
- * On true, the local CPU should immediately release any printing resources
- * that may be needed by the panic CPU.
- */
-bool other_cpu_in_panic(void)
-{
-	return (panic_in_progress() && !panic_on_this_cpu());
-}
-
 /*
  * This is used for debugging the mess that is the VT code by
  * keeping track if we have the console semaphore held. It's
@@ -2391,7 +2380,7 @@ asmlinkage int vprintk_emit(int facility, int level,
 	 * non-panic CPUs are generating any messages, they will be
 	 * silently dropped.
 	 */
-	if (other_cpu_in_panic() &&
+	if (panic_on_other_cpu() &&
 	    !debug_non_panic_cpus &&
 	    !panic_triggering_all_cpu_backtrace)
 		return 0;
@@ -2827,7 +2816,7 @@ void console_lock(void)
 	might_sleep();
 
 	/* On panic, the console_lock must be left to the panic cpu. */
-	while (other_cpu_in_panic())
+	while (panic_on_other_cpu())
 		msleep(1000);
 
 	down_console_sem();
@@ -2847,7 +2836,7 @@ EXPORT_SYMBOL(console_lock);
 int console_trylock(void)
 {
 	/* On panic, the console_lock must be left to the panic cpu. */
-	if (other_cpu_in_panic())
+	if (panic_on_other_cpu())
 		return 0;
 	if (down_trylock_console_sem())
 		return 0;
@@ -3227,7 +3216,7 @@ static bool console_flush_all(bool do_cond_resched, u64 *next_seq, bool *handove
 			any_progress = true;
 
 			/* Allow panic_cpu to take over the consoles safely. */
-			if (other_cpu_in_panic())
+			if (panic_on_other_cpu())
 				goto abandon;
 
 			if (do_cond_resched)
-- 
2.43.0

