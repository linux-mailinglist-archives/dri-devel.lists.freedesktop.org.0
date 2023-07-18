Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 518AF7587E4
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 00:01:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB0D010E3C0;
	Tue, 18 Jul 2023 22:01:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CC1310E3C0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 22:01:05 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1b8ad9eede0so50051535ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 15:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689717664; x=1692309664;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=/DBv5NGK1dmc+CZMq0/WXS3utH3EmBQl9zIKDmjQ1i4=;
 b=cathwXRCdEL7wvuiZ7bcMAHF2YkxTm1Pa99hNgy2x+3oEKy8vP5p1pu9MijkOsOxyc
 jVjO8T1YTkH454Bng4g8CC+ThLmAff8Zub0Wh44Fl8hmA3B+pz1cCE8AhFvDJSoUkJID
 NS7KV1XDtpxLbe2HWUcgGi+EM6yjEGw6Sq2n/Qnwk0U558oV9/CsEMgkI+jF8M4J14Bl
 j/CISxZtgmOZEeF8ngbj99zwzx/DpIifrqP3yzGJWnNbKrjb9QyRTvPr1aPJ88+oJ9jy
 batIZ/8swsAtixDHJfvcm05Qd0arLM9+ER1NC94CBHpMmwXt1e8Hdw90O3brBFBThqFk
 WTSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689717664; x=1692309664;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/DBv5NGK1dmc+CZMq0/WXS3utH3EmBQl9zIKDmjQ1i4=;
 b=D2viw4bE8GCBi+45u0GP6z68eh/Yxl+bQW3u45K+P1rqw1bH3+ubQ4Qv/kAirqaEaL
 r4EpPsKambkb3ougfyXbCAYK62Svej11a26814R6+AxtU/gDrcUfSLTEHfVxz0JQg9bI
 ihwhtyssnU9Inft5wg5Dg8ETrbr3EinXw40gCU5TebknZaUeAsA2eURlZ4QzhBfMDlTH
 fw0Lt+bx40fT/ED5YqWNJB8ghctPzUYQGgrXuuvJEpEUjn+jDBiPLe6MA+y1Moi6/tT8
 TiSYEgs4hEQBydyhCcnoM54anMN/FfjCz3hY6HUEFC+50LLf4d2XbxfK795YY0xF1GIf
 o1aw==
X-Gm-Message-State: ABy/qLYn7Detja9S7ud08czxU9eTBM6dIscMgvMY7nNHlLEYfgrBKUAu
 cZoO3wq38cvHIIlIzOu9uTM=
X-Google-Smtp-Source: APBJJlEKmijXIQPxNbeLXXqgtsMDd/YUFQr0MtJ3gF/quDqVxbtlCH7F50lGttR5T6rSx/zqeT1Vfg==
X-Received: by 2002:a17:902:768c:b0:1ba:ff05:d8b1 with SMTP id
 m12-20020a170902768c00b001baff05d8b1mr982129pll.19.1689717664188; 
 Tue, 18 Jul 2023 15:01:04 -0700 (PDT)
Received: from localhost ([2620:10d:c090:400::5:fbd8])
 by smtp.gmail.com with ESMTPSA id
 g15-20020a1709029f8f00b001b8b2a6c4a4sm2354458plq.172.2023.07.18.15.01.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jul 2023 15:01:03 -0700 (PDT)
Date: Tue, 18 Jul 2023 12:01:02 -1000
From: Tejun Heo <tj@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Consider switching to WQ_UNBOUND messages (was: Re: [PATCH v2
 6/7] workqueue: Report work funcs that trigger automatic CPU_INTENSIVE
 mechanism)
Message-ID: <ZLcLnoAoJmQ9WTuM@slm.duckdns.org>
References: <20230511181931.869812-1-tj@kernel.org>
 <20230511181931.869812-7-tj@kernel.org>
 <ZF6WsSVGX3O1d0pL@slm.duckdns.org>
 <CAMuHMdVCQmh6V182q4g---jvsWiTOP2hBPZKvma6oUN6535LEg@mail.gmail.com>
 <CAMuHMdW1kxZ1RHKTRVRqDNAbj1Df2=v0fPn5KYK3kfX_kiXR6A@mail.gmail.com>
 <ZK3MBfPS-3-tJgjO@slm.duckdns.org>
 <ZK30CR196rs-OWLq@slm.duckdns.org>
 <CAMuHMdUCXPi+aS-7bR3qRetKF9T3W9jk_HKjvaXmfHv5SEeuFg@mail.gmail.com>
 <ZLXIvXBvhsnL-ik_@slm.duckdns.org>
 <CAMuHMdU8CGhsU-1PZNdWH1xjbWcWSg2s2RFAegXi+vs=d-0t8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdU8CGhsU-1PZNdWH1xjbWcWSg2s2RFAegXi+vs=d-0t8Q@mail.gmail.com>
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
Cc: linux-rtc@vger.kernel.org,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, netdev <netdev@vger.kernel.org>,
 kernel-team@meta.com, Lai Jiangshan <jiangshanlai@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "open list:LIBATA SUBSYSTEM \(Serial and Parallel ATA drivers\)"
 <linux-ide@vger.kernel.org>, Linux MMC List <linux-mmc@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Tue, Jul 18, 2023 at 11:54:58AM +0200, Geert Uytterhoeven wrote:
> I gave it a try on a system with an 800 MHz Cortex A9, only to discover
> it makes no difference, as that machine has 1600 BogoMIPS:

Oops.

> workqueue: blk_mq_run_work_fn hogged CPU for >10000us 4 times,
> consider switching to WQ_UNBOUND

It could be that we actually want to switch to UNBOUND for some reports but
the above triggering most likely indicates that the threshold is too
aggressive.

> Artificially low BogoMIPS numbers only happen on systems that have
> the related timers (Cortex A7/A15 and later, Cortex A9 MPCore,
> and arm64).

Ah, I see. Thanks for the explanation.

> I will test on more systems, but that will probably not happen until
> next week...

Thanks, really appreciate it. Can you try the following instead when you
have time? I just pushed up the lower boundary to 4000 MIPS. The scaling is
still capped at 1s.

From 8555cbd4b22e5f85eb2bdcb84fd1d1f519a0a0d3 Mon Sep 17 00:00:00 2001
From: Tejun Heo <tj@kernel.org>
Date: Mon, 17 Jul 2023 12:50:02 -1000
Subject: [PATCH] workqueue: Scale up wq_cpu_intensive_thresh_us if BogoMIPS is
 below 4000

wq_cpu_intensive_thresh_us is used to detect CPU-hogging per-cpu work items.
Once detected, they're excluded from concurrency management to prevent them
from blocking other per-cpu work items. If CONFIG_WQ_CPU_INTENSIVE_REPORT is
enabled, repeat offenders are also reported so that the code can be updated.

The default threshold is 10ms which is long enough to do fair bit of work on
modern CPUs while short enough to be usually not noticeable. This
unfortunately leads to a lot of, arguable spurious, detections on very slow
CPUs. Using the same threshold across CPUs whose performance levels may be
apart by multiple levels of magnitude doesn't make whole lot of sense.

This patch scales up wq_cpu_intensive_thresh_us upto 1 second when BogoMIPS
is below 4000. This is obviously very inaccurate but it doesn't have to be
accurate to be useful. The mechanism is still useful when the threshold is
fully scaled up and the benefits of reports are usually shared with everyone
regardless of who's reporting, so as long as there are sufficient number of
fast machines reporting, we don't lose much.

Some (or is it all?) ARM CPUs systemtically report significantly lower
BogoMIPS. While this doesn't break anything, given how widespread ARM CPUs
are, it's at least a missed opportunity and it probably would be a good idea
to teach workqueue about it.

Signed-off-by: Tejun Heo <tj@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
---
 kernel/workqueue.c | 43 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 02a8f402eeb5..0d7a3d29762f 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -52,6 +52,7 @@
 #include <linux/sched/debug.h>
 #include <linux/nmi.h>
 #include <linux/kvm_para.h>
+#include <linux/delay.h>
 
 #include "workqueue_internal.h"
 
@@ -338,8 +339,10 @@ static cpumask_var_t *wq_numa_possible_cpumask;
  * Per-cpu work items which run for longer than the following threshold are
  * automatically considered CPU intensive and excluded from concurrency
  * management to prevent them from noticeably delaying other per-cpu work items.
+ * ULONG_MAX indicates that the user hasn't overridden it with a boot parameter.
+ * The actual value is initialized in wq_cpu_intensive_thresh_init().
  */
-static unsigned long wq_cpu_intensive_thresh_us = 10000;
+static unsigned long wq_cpu_intensive_thresh_us = ULONG_MAX;
 module_param_named(cpu_intensive_thresh_us, wq_cpu_intensive_thresh_us, ulong, 0644);
 
 static bool wq_disable_numa;
@@ -6513,6 +6516,42 @@ void __init workqueue_init_early(void)
 	       !system_freezable_power_efficient_wq);
 }
 
+static void __init wq_cpu_intensive_thresh_init(void)
+{
+	unsigned long thresh;
+	unsigned long mips;
+
+	/* if the user set it to a specific value, keep it */
+	if (wq_cpu_intensive_thresh_us != ULONG_MAX)
+		return;
+
+	/*
+	 * The default of 10ms is derived from the fact that most modern (as of
+	 * 2023) processors can do a lot in 10ms and that it's just below what
+	 * most consider human-perceivable. However, the kernel also runs on a
+	 * lot slower CPUs including microcontrollers where the threshold is way
+	 * too low.
+	 *
+	 * Let's scale up the threshold upto 1 second if BogoMips is below 4000.
+	 * This is by no means accurate but it doesn't have to be. The mechanism
+	 * is still useful even when the threshold is fully scaled up. Also, as
+	 * the reports would usually be applicable to everyone, some machines
+	 * operating on longer thresholds won't significantly diminish their
+	 * usefulness.
+	 */
+	thresh = 10 * USEC_PER_MSEC;
+
+	/* see init/calibrate.c for lpj -> BogoMIPS calculation */
+	mips = max_t(unsigned long, loops_per_jiffy / 500000 * HZ, 1);
+	if (mips < 4000)
+		thresh = min_t(unsigned long, thresh * 4000 / mips, USEC_PER_SEC);
+
+	pr_debug("wq_cpu_intensive_thresh: lpj=%lu mips=%lu thresh_us=%lu\n",
+		 loops_per_jiffy, mips, thresh);
+
+	wq_cpu_intensive_thresh_us = thresh;
+}
+
 /**
  * workqueue_init - bring workqueue subsystem fully online
  *
@@ -6528,6 +6567,8 @@ void __init workqueue_init(void)
 	struct worker_pool *pool;
 	int cpu, bkt;
 
+	wq_cpu_intensive_thresh_init();
+
 	/*
 	 * It'd be simpler to initialize NUMA in workqueue_init_early() but
 	 * CPU to node mapping may not be available that early on some
-- 
2.41.0

