Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F0EB336F5
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 08:56:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 779F110E3C3;
	Mon, 25 Aug 2025 06:56:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="M4uEDc1k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B96D510E236
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 02:30:31 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2460757107bso34695155ad.2
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Aug 2025 19:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756089031; x=1756693831; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=D22H5WgHrRDr6Rs9uj/QpBbAQMcw3KfQsKqL222d6ec=;
 b=M4uEDc1kiZE1N/Q3XjQ0e2IfMTSwOtsHCfFGbnKyKD7nmo39ilgqLFNma773wmL61F
 bvmoqemp3YL6Iycmdkn2sn5vU04Nlr0sRWw7dsScvNk2zWr3gg2xTJPyoN7MdL37DstS
 g948obOVFHvJxkJmJQ83NmCvKP9YZIESBExysLbf5UGSmgJ6EEk8BfkcHCp346BThIdA
 s0W8c2j2WNzOtEtyzUrCFNnSkPmCUrzmX5OoTjm0WrSPagj8lqrIMzMYPo5lM8Lz2bvg
 9Ak4HXQS7oWpxrtWMuIg85QHpWMBGQSGDCQStNfOFpCVaUfwjqQd9OoHZmGV5xO67/UM
 e1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756089031; x=1756693831;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D22H5WgHrRDr6Rs9uj/QpBbAQMcw3KfQsKqL222d6ec=;
 b=AbBi5hE53oNRIBuYwIRkfjehClXFwMvDiM3FVWjEk6kU+lFgHSVYue42xTAUeV6AUm
 fDwH1F7kOAJiPjLcwDYtaTBt+JOqziVUHMTe57LEz51/YQ0H/tgOdrcnEK9YX7FgBGKb
 jw1TBF4eaLVl32HUxxuGmjWnn+uTItGZl1uN+HB1h78rUH+t3luxTcR3ksGrXvNbk7RL
 2bogv4MiUoE0j/yuURVg23xqduSrLaOtnTxo5/9U7xkcXIcfr1wPKccXbLf39yIrSnoX
 2gS8EuziMweMObKCWHZ0osAdommhiuNrUVTtNhoSl62lUNDXnsndWJJExm/LQBQI3ca4
 43Eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVleRQgCO/Bd6Bqq+5PNDAGiwXbhTaJhbgwIGEzjjgcYNbEAA02EMuJ2+0d+wfEHtJgZKlyrMNh5ZM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgUpXNL1HFQN+dUF+aTSBt5fAZNSBurHlG92Mktu85yWqInYYX
 Lp1yVbTx/sO4/r7Ni90pNH1F8/nSgsvYx4h7/p7MI33c2NlS1m6+kOdp
X-Gm-Gg: ASbGncu2sEFXTXwzXM1gAk5nIrFkJxkk2+ngRFUW1HiIS71Fxw7McodvHxtFs4mTjC5
 ud8aUpuklLLmvuQz7hyF8PLxekyseCO4preKer35ikWWsfLi4RQ13c+whWDsBKQfJAIHUSoI+EV
 EZewl53RqKrECJRceYFAhDUAi76zYc9TZ7eAmioYRzn6qm+tyVZq4+BMJ6mnlBWy/+2sFiz3FSd
 LQpccu1p11G69q87T2mOGLcYOJZXqGwJmz6Z2AYWlQ0iqlBdxqOhDsvr/eLyfTiH6Kc8HkYVf+I
 siWddQWFET3IEGFcPjm8vl+TODL/8zXazTjeVmaC1hTB7CurGuwhVOu6dT4RkO8AtJA8uNWBcoy
 TXTZJFFhrK+9RUiZ98phPUL5FVEreSiDi0q6pUWkYhxK+AqruaHGKZKs2SazbLp82OkJQX2FEPY
 w=
X-Google-Smtp-Source: AGHT+IHvUbvFr57GAj/hQE8xfxiDlLg1TWgL+5HGU9dNUcnxRdGMO81pVBBt5RpnalyVwaK4Xtg7ig==
X-Received: by 2002:a17:903:1a2c:b0:234:a139:11f0 with SMTP id
 d9443c01a7336-2462edab80amr150747455ad.7.1756089031108; 
 Sun, 24 Aug 2025 19:30:31 -0700 (PDT)
Received: from localhost.localdomain ([114.242.33.243])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-246687af234sm53905175ad.48.2025.08.24.19.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Aug 2025 19:30:30 -0700 (PDT)
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
Subject: [PATCH v2 1/9] panic: Introduce helper functions for panic state
Date: Mon, 25 Aug 2025 10:29:29 +0800
Message-ID: <20250825022947.1596226-2-wangjinchao600@gmail.com>
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

This patch introduces four new helper functions to abstract the
management of the panic_cpu variable. These functions will be used in
subsequent patches to refactor existing code.

The direct use of panic_cpu can be error-prone and ambiguous, as it
requires manual checks to determine which CPU is handling the panic.
The new helpers clarify intent:

panic_try_start():
Atomically sets the current CPU as the panicking CPU.

panic_reset():
Reset panic_cpu to PANIC_CPU_INVALID.

panic_in_progress():
Checks if a panic has been triggered.

panic_on_this_cpu():
Returns true if the current CPU is the panic originator.

panic_on_other_cpu():
Returns true if a panic is on another CPU.

This change lays the groundwork for improved code readability
and robustness in the panic handling subsystem.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 include/linux/panic.h  |  6 +++++
 kernel/panic.c         | 53 ++++++++++++++++++++++++++++++++++++++++++
 kernel/printk/printk.c |  5 ----
 3 files changed, 59 insertions(+), 5 deletions(-)

diff --git a/include/linux/panic.h b/include/linux/panic.h
index 7be742628c25..6f972a66c13e 100644
--- a/include/linux/panic.h
+++ b/include/linux/panic.h
@@ -43,6 +43,12 @@ void abort(void);
 extern atomic_t panic_cpu;
 #define PANIC_CPU_INVALID	-1
 
+bool panic_try_start(void);
+void panic_reset(void);
+bool panic_in_progress(void);
+bool panic_on_this_cpu(void);
+bool panic_on_other_cpu(void);
+
 /*
  * Only to be used by arch init code. If the user over-wrote the default
  * CONFIG_PANIC_TIMEOUT, honor it.
diff --git a/kernel/panic.c b/kernel/panic.c
index 72fcbb5a071b..eacb0c972110 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -294,6 +294,59 @@ void __weak crash_smp_send_stop(void)
 
 atomic_t panic_cpu = ATOMIC_INIT(PANIC_CPU_INVALID);
 
+bool panic_try_start(void)
+{
+	int old_cpu, this_cpu;
+
+	/*
+	 * Only one CPU is allowed to execute the crash_kexec() code as with
+	 * panic().  Otherwise parallel calls of panic() and crash_kexec()
+	 * may stop each other.  To exclude them, we use panic_cpu here too.
+	 */
+	old_cpu = PANIC_CPU_INVALID;
+	this_cpu = raw_smp_processor_id();
+
+	return atomic_try_cmpxchg(&panic_cpu, &old_cpu, this_cpu);
+}
+EXPORT_SYMBOL(panic_try_start);
+
+void panic_reset(void)
+{
+	atomic_set(&panic_cpu, PANIC_CPU_INVALID);
+}
+EXPORT_SYMBOL(panic_reset);
+
+bool panic_in_progress(void)
+{
+	return unlikely(atomic_read(&panic_cpu) != PANIC_CPU_INVALID);
+}
+EXPORT_SYMBOL(panic_in_progress);
+
+/* Return true if a panic is in progress on the current CPU. */
+bool panic_on_this_cpu(void)
+{
+	/*
+	 * We can use raw_smp_processor_id() here because it is impossible for
+	 * the task to be migrated to the panic_cpu, or away from it. If
+	 * panic_cpu has already been set, and we're not currently executing on
+	 * that CPU, then we never will be.
+	 */
+	return unlikely(atomic_read(&panic_cpu) == raw_smp_processor_id());
+}
+EXPORT_SYMBOL(panic_on_this_cpu);
+
+/*
+ * Return true if a panic is in progress on a remote CPU.
+ *
+ * On true, the local CPU should immediately release any printing resources
+ * that may be needed by the panic CPU.
+ */
+bool panic_on_other_cpu(void)
+{
+	return (panic_in_progress() && !this_cpu_in_panic());
+}
+EXPORT_SYMBOL(panic_on_other_cpu);
+
 /*
  * A variant of panic() called from NMI context. We return if we've already
  * panicked on this CPU. If another CPU already panicked, loop in
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 0efbcdda9aab..5fe35f377b79 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -345,11 +345,6 @@ static void __up_console_sem(unsigned long ip)
 }
 #define up_console_sem() __up_console_sem(_RET_IP_)
 
-static bool panic_in_progress(void)
-{
-	return unlikely(atomic_read(&panic_cpu) != PANIC_CPU_INVALID);
-}
-
 /* Return true if a panic is in progress on the current CPU. */
 bool this_cpu_in_panic(void)
 {
-- 
2.43.0

