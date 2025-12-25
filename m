Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6B2CDDF4D
	for <lists+dri-devel@lfdr.de>; Thu, 25 Dec 2025 18:09:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15C3C11BAF9;
	Thu, 25 Dec 2025 17:09:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N0fOtslY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com
 [74.125.224.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 039C611B194
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Dec 2025 17:09:40 +0000 (UTC)
Received: by mail-yx1-f47.google.com with SMTP id
 956f58d0204a3-64467071f9fso5152348d50.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Dec 2025 09:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766682579; x=1767287379; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K4tmN2HYqytbG2z1YqUvyseyPfGFcRHLkpM5+ZItkRA=;
 b=N0fOtslYS9u/cqeYJksBvyaji310kNAz3T3cAKth/oY5aoofulqn71+zgc/cv6Xco3
 rxxLip7YDITmQ5zUqqM99pkQcocMayiQ6YWAi2OK2it47sTxDoji3cYocQ8ZFimH8I8/
 Tvmhpzo7AAF/GOjxkk44EzPAh9qNNWyRXsh7vjajEwoKUCs3GHRW1jcbX9A1VyahZoq5
 7M5/RPMi+BeaHFxeWTCmI6sFwf0z+x/w9V1pEsYcVUtX9AndjODH4+vQJqxk09Eg1jEu
 dqINSeQFr9iAU9oOMY27dXPHVV2XTdSSBof+0NUkIVxeTauljA/4lugW8ljjsbwiJsnl
 W89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766682579; x=1767287379;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=K4tmN2HYqytbG2z1YqUvyseyPfGFcRHLkpM5+ZItkRA=;
 b=Y7djt9Vzl4EEO7PaQNcZgdXNe7LttkmPzRZ5uoBjvpUF/TqAx6wM2lWomgVdXKCG6X
 Zx9cIt6JzNcudo8OKLpIq198k9qTTv8xEYTedibsEimUZbgX0yjpa5X9IjtB25/qa52S
 xX/LTcc5gyh4rXWFMacVgtBSQTmlh/botALVIafcBEbcNUpWBDrgMBVQyeqYEL71IRoH
 ygBX+X4bXVuGvWtR6o3wMX66fu9cznoukdz2+mPshMk5chVAvAr4VTTcGtaCm0AI7IWu
 bkCthex9O9HRslnBgWiUMvRiij6rHQmdo7CJLgwkBazwODlUBuGlyJghfV93E7cENgP0
 U8gQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVInAYAumEs1wX/aud73wiCrEKZSXpdCFDZy3seujbUNrCtpMLMmSBjqIu9EuHkHxi7KXqJbbi6rrg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybDXYwyK3mAZKxhS+NsC4sfZXuFmqfikweOxtLkWXEBybCik3j
 61CZ/LAgENaK1g8WFvxvSmeF8n0KeKz9f87BJvuLBcdMlLYUeg85mrwZ
X-Gm-Gg: AY/fxX4mzfoja1FVY5THChUy0SGSb6tJPc+01f0fFLTcIi78u9SwYk0E0EhIm4ka38o
 ieYcZkfBhZla/esyME/EnQJTcCsHB1IEt3ZMXaRhCJWCLL3UTyGa4GteBS4Rke10mDlHXR04fsl
 mZA0B8WUi3tynWAulM4yeIRFcKFZ+wCSUlgaYk1RyVwus9ozyHCkAXLY4y5BnTz5cBE/lV87pay
 dhjCS7prfkMdZ6S9f/qu2sv3CQglLxqmOccfxsoR2XfG1KvqxU861Dmi+6zHif+oyRm7NZnyMys
 zD11p6hTJz7YMDpOtbL/Lm4ov2BB5kFtO8oaDHd99yuQ6f98oYL1Wk0kRTXIVHGhtx4ElRj506L
 UXhLs7d7QhjZ6LiC2sVGMyl6fSw1huWEuMuQ+ps/YZciNDzmmdiH1ucjCRqTski8k4h3ApvuoRP
 28xxEeo2k=
X-Google-Smtp-Source: AGHT+IEHt241P7yMnFUw7MWZH25jfPi2EpOi6/Ex4aSS0XDog5eWv7lNbl6UcIDzztXWn4JBSQB6iQ==
X-Received: by 2002:a05:690e:214c:b0:644:60d9:7534 with SMTP id
 956f58d0204a3-6466a8e0f79mr12124129d50.90.1766682578862; 
 Thu, 25 Dec 2025 09:09:38 -0800 (PST)
Received: from localhost ([2601:346:0:79bd:5a70:118b:3656:4527])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-78fb44f0e3csm76211247b3.28.2025.12.25.09.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Dec 2025 09:09:38 -0800 (PST)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 David Laight <david.laight@runbox.com>, Petr Pavlu <petr.pavlu@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Daniel Gomez <da.gomez@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Subject: [PATCH v4 6/7] tracing: move tracing declarations from kernel.h to a
 dedicated header
Date: Thu, 25 Dec 2025 12:09:28 -0500
Message-ID: <20251225170930.1151781-7-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251225170930.1151781-1-yury.norov@gmail.com>
References: <20251225170930.1151781-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Tracing is a half of the kernel.h in terms of LOCs, although it's
a self-consistent part. It is intended for quick debugging purposes
and isn't used by the normal tracing utilities.

Move it to a separate header. If someone needs to just throw a
trace_printk() in their driver, they will not have to pull all
the heavy tracing machinery.

This is a pure move.

Acked-by: Steven Rostedt <rostedt@goodmis.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 include/linux/kernel.h       | 196 +--------------------------------
 include/linux/trace_printk.h | 204 +++++++++++++++++++++++++++++++++++
 2 files changed, 205 insertions(+), 195 deletions(-)
 create mode 100644 include/linux/trace_printk.h

diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index 4ee48fb10dec..a377335e01da 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -32,7 +32,7 @@
 #include <linux/build_bug.h>
 #include <linux/sprintf.h>
 #include <linux/static_call_types.h>
-#include <linux/instruction_pointer.h>
+#include <linux/trace_printk.h>
 #include <linux/util_macros.h>
 #include <linux/wordpart.h>
 
@@ -190,200 +190,6 @@ enum system_states {
 };
 extern enum system_states system_state;
 
-/*
- * General tracing related utility functions - trace_printk(),
- * tracing_on/tracing_off and tracing_start()/tracing_stop
- *
- * Use tracing_on/tracing_off when you want to quickly turn on or off
- * tracing. It simply enables or disables the recording of the trace events.
- * This also corresponds to the user space /sys/kernel/tracing/tracing_on
- * file, which gives a means for the kernel and userspace to interact.
- * Place a tracing_off() in the kernel where you want tracing to end.
- * From user space, examine the trace, and then echo 1 > tracing_on
- * to continue tracing.
- *
- * tracing_stop/tracing_start has slightly more overhead. It is used
- * by things like suspend to ram where disabling the recording of the
- * trace is not enough, but tracing must actually stop because things
- * like calling smp_processor_id() may crash the system.
- *
- * Most likely, you want to use tracing_on/tracing_off.
- */
-
-enum ftrace_dump_mode {
-	DUMP_NONE,
-	DUMP_ALL,
-	DUMP_ORIG,
-	DUMP_PARAM,
-};
-
-#ifdef CONFIG_TRACING
-void tracing_on(void);
-void tracing_off(void);
-int tracing_is_on(void);
-void tracing_snapshot(void);
-void tracing_snapshot_alloc(void);
-
-extern void tracing_start(void);
-extern void tracing_stop(void);
-
-static inline __printf(1, 2)
-void ____trace_printk_check_format(const char *fmt, ...)
-{
-}
-#define __trace_printk_check_format(fmt, args...)			\
-do {									\
-	if (0)								\
-		____trace_printk_check_format(fmt, ##args);		\
-} while (0)
-
-/**
- * trace_printk - printf formatting in the ftrace buffer
- * @fmt: the printf format for printing
- *
- * Note: __trace_printk is an internal function for trace_printk() and
- *       the @ip is passed in via the trace_printk() macro.
- *
- * This function allows a kernel developer to debug fast path sections
- * that printk is not appropriate for. By scattering in various
- * printk like tracing in the code, a developer can quickly see
- * where problems are occurring.
- *
- * This is intended as a debugging tool for the developer only.
- * Please refrain from leaving trace_printks scattered around in
- * your code. (Extra memory is used for special buffers that are
- * allocated when trace_printk() is used.)
- *
- * A little optimization trick is done here. If there's only one
- * argument, there's no need to scan the string for printf formats.
- * The trace_puts() will suffice. But how can we take advantage of
- * using trace_puts() when trace_printk() has only one argument?
- * By stringifying the args and checking the size we can tell
- * whether or not there are args. __stringify((__VA_ARGS__)) will
- * turn into "()\0" with a size of 3 when there are no args, anything
- * else will be bigger. All we need to do is define a string to this,
- * and then take its size and compare to 3. If it's bigger, use
- * do_trace_printk() otherwise, optimize it to trace_puts(). Then just
- * let gcc optimize the rest.
- */
-
-#define trace_printk(fmt, ...)				\
-do {							\
-	char _______STR[] = __stringify((__VA_ARGS__));	\
-	if (sizeof(_______STR) > 3)			\
-		do_trace_printk(fmt, ##__VA_ARGS__);	\
-	else						\
-		trace_puts(fmt);			\
-} while (0)
-
-#define do_trace_printk(fmt, args...)					\
-do {									\
-	static const char *trace_printk_fmt __used			\
-		__section("__trace_printk_fmt") =			\
-		__builtin_constant_p(fmt) ? fmt : NULL;			\
-									\
-	__trace_printk_check_format(fmt, ##args);			\
-									\
-	if (__builtin_constant_p(fmt))					\
-		__trace_bprintk(_THIS_IP_, trace_printk_fmt, ##args);	\
-	else								\
-		__trace_printk(_THIS_IP_, fmt, ##args);			\
-} while (0)
-
-extern __printf(2, 3)
-int __trace_bprintk(unsigned long ip, const char *fmt, ...);
-
-extern __printf(2, 3)
-int __trace_printk(unsigned long ip, const char *fmt, ...);
-
-/**
- * trace_puts - write a string into the ftrace buffer
- * @str: the string to record
- *
- * Note: __trace_bputs is an internal function for trace_puts and
- *       the @ip is passed in via the trace_puts macro.
- *
- * This is similar to trace_printk() but is made for those really fast
- * paths that a developer wants the least amount of "Heisenbug" effects,
- * where the processing of the print format is still too much.
- *
- * This function allows a kernel developer to debug fast path sections
- * that printk is not appropriate for. By scattering in various
- * printk like tracing in the code, a developer can quickly see
- * where problems are occurring.
- *
- * This is intended as a debugging tool for the developer only.
- * Please refrain from leaving trace_puts scattered around in
- * your code. (Extra memory is used for special buffers that are
- * allocated when trace_puts() is used.)
- *
- * Returns: 0 if nothing was written, positive # if string was.
- *  (1 when __trace_bputs is used, strlen(str) when __trace_puts is used)
- */
-
-#define trace_puts(str) ({						\
-	static const char *trace_printk_fmt __used			\
-		__section("__trace_printk_fmt") =			\
-		__builtin_constant_p(str) ? str : NULL;			\
-									\
-	if (__builtin_constant_p(str))					\
-		__trace_bputs(_THIS_IP_, trace_printk_fmt);		\
-	else								\
-		__trace_puts(_THIS_IP_, str);				\
-})
-extern int __trace_bputs(unsigned long ip, const char *str);
-extern int __trace_puts(unsigned long ip, const char *str);
-
-extern void trace_dump_stack(int skip);
-
-/*
- * The double __builtin_constant_p is because gcc will give us an error
- * if we try to allocate the static variable to fmt if it is not a
- * constant. Even with the outer if statement.
- */
-#define ftrace_vprintk(fmt, vargs)					\
-do {									\
-	if (__builtin_constant_p(fmt)) {				\
-		static const char *trace_printk_fmt __used		\
-		  __section("__trace_printk_fmt") =			\
-			__builtin_constant_p(fmt) ? fmt : NULL;		\
-									\
-		__ftrace_vbprintk(_THIS_IP_, trace_printk_fmt, vargs);	\
-	} else								\
-		__ftrace_vprintk(_THIS_IP_, fmt, vargs);		\
-} while (0)
-
-extern __printf(2, 0) int
-__ftrace_vbprintk(unsigned long ip, const char *fmt, va_list ap);
-
-extern __printf(2, 0) int
-__ftrace_vprintk(unsigned long ip, const char *fmt, va_list ap);
-
-extern void ftrace_dump(enum ftrace_dump_mode oops_dump_mode);
-#else
-static inline void tracing_start(void) { }
-static inline void tracing_stop(void) { }
-static inline void trace_dump_stack(int skip) { }
-
-static inline void tracing_on(void) { }
-static inline void tracing_off(void) { }
-static inline int tracing_is_on(void) { return 0; }
-static inline void tracing_snapshot(void) { }
-static inline void tracing_snapshot_alloc(void) { }
-
-static inline __printf(1, 2)
-int trace_printk(const char *fmt, ...)
-{
-	return 0;
-}
-static __printf(1, 0) inline int
-ftrace_vprintk(const char *fmt, va_list ap)
-{
-	return 0;
-}
-static inline void ftrace_dump(enum ftrace_dump_mode oops_dump_mode) { }
-#endif /* CONFIG_TRACING */
-
 /* Rebuild everything on CONFIG_DYNAMIC_FTRACE */
 #ifdef CONFIG_DYNAMIC_FTRACE
 # define REBUILD_DUE_TO_DYNAMIC_FTRACE
diff --git a/include/linux/trace_printk.h b/include/linux/trace_printk.h
new file mode 100644
index 000000000000..bb5874097f24
--- /dev/null
+++ b/include/linux/trace_printk.h
@@ -0,0 +1,204 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_TRACE_PRINTK_H
+#define _LINUX_TRACE_PRINTK_H
+
+#include <linux/compiler_attributes.h>
+#include <linux/instruction_pointer.h>
+#include <linux/stddef.h>
+#include <linux/stringify.h>
+
+/*
+ * General tracing related utility functions - trace_printk(),
+ * tracing_on/tracing_off and tracing_start()/tracing_stop
+ *
+ * Use tracing_on/tracing_off when you want to quickly turn on or off
+ * tracing. It simply enables or disables the recording of the trace events.
+ * This also corresponds to the user space /sys/kernel/tracing/tracing_on
+ * file, which gives a means for the kernel and userspace to interact.
+ * Place a tracing_off() in the kernel where you want tracing to end.
+ * From user space, examine the trace, and then echo 1 > tracing_on
+ * to continue tracing.
+ *
+ * tracing_stop/tracing_start has slightly more overhead. It is used
+ * by things like suspend to ram where disabling the recording of the
+ * trace is not enough, but tracing must actually stop because things
+ * like calling smp_processor_id() may crash the system.
+ *
+ * Most likely, you want to use tracing_on/tracing_off.
+ */
+
+enum ftrace_dump_mode {
+	DUMP_NONE,
+	DUMP_ALL,
+	DUMP_ORIG,
+	DUMP_PARAM,
+};
+
+#ifdef CONFIG_TRACING
+void tracing_on(void);
+void tracing_off(void);
+int tracing_is_on(void);
+void tracing_snapshot(void);
+void tracing_snapshot_alloc(void);
+
+extern void tracing_start(void);
+extern void tracing_stop(void);
+
+static inline __printf(1, 2)
+void ____trace_printk_check_format(const char *fmt, ...)
+{
+}
+#define __trace_printk_check_format(fmt, args...)			\
+do {									\
+	if (0)								\
+		____trace_printk_check_format(fmt, ##args);		\
+} while (0)
+
+/**
+ * trace_printk - printf formatting in the ftrace buffer
+ * @fmt: the printf format for printing
+ *
+ * Note: __trace_printk is an internal function for trace_printk() and
+ *       the @ip is passed in via the trace_printk() macro.
+ *
+ * This function allows a kernel developer to debug fast path sections
+ * that printk is not appropriate for. By scattering in various
+ * printk like tracing in the code, a developer can quickly see
+ * where problems are occurring.
+ *
+ * This is intended as a debugging tool for the developer only.
+ * Please refrain from leaving trace_printks scattered around in
+ * your code. (Extra memory is used for special buffers that are
+ * allocated when trace_printk() is used.)
+ *
+ * A little optimization trick is done here. If there's only one
+ * argument, there's no need to scan the string for printf formats.
+ * The trace_puts() will suffice. But how can we take advantage of
+ * using trace_puts() when trace_printk() has only one argument?
+ * By stringifying the args and checking the size we can tell
+ * whether or not there are args. __stringify((__VA_ARGS__)) will
+ * turn into "()\0" with a size of 3 when there are no args, anything
+ * else will be bigger. All we need to do is define a string to this,
+ * and then take its size and compare to 3. If it's bigger, use
+ * do_trace_printk() otherwise, optimize it to trace_puts(). Then just
+ * let gcc optimize the rest.
+ */
+
+#define trace_printk(fmt, ...)				\
+do {							\
+	char _______STR[] = __stringify((__VA_ARGS__));	\
+	if (sizeof(_______STR) > 3)			\
+		do_trace_printk(fmt, ##__VA_ARGS__);	\
+	else						\
+		trace_puts(fmt);			\
+} while (0)
+
+#define do_trace_printk(fmt, args...)					\
+do {									\
+	static const char *trace_printk_fmt __used			\
+		__section("__trace_printk_fmt") =			\
+		__builtin_constant_p(fmt) ? fmt : NULL;			\
+									\
+	__trace_printk_check_format(fmt, ##args);			\
+									\
+	if (__builtin_constant_p(fmt))					\
+		__trace_bprintk(_THIS_IP_, trace_printk_fmt, ##args);	\
+	else								\
+		__trace_printk(_THIS_IP_, fmt, ##args);			\
+} while (0)
+
+extern __printf(2, 3)
+int __trace_bprintk(unsigned long ip, const char *fmt, ...);
+
+extern __printf(2, 3)
+int __trace_printk(unsigned long ip, const char *fmt, ...);
+
+/**
+ * trace_puts - write a string into the ftrace buffer
+ * @str: the string to record
+ *
+ * Note: __trace_bputs is an internal function for trace_puts and
+ *       the @ip is passed in via the trace_puts macro.
+ *
+ * This is similar to trace_printk() but is made for those really fast
+ * paths that a developer wants the least amount of "Heisenbug" effects,
+ * where the processing of the print format is still too much.
+ *
+ * This function allows a kernel developer to debug fast path sections
+ * that printk is not appropriate for. By scattering in various
+ * printk like tracing in the code, a developer can quickly see
+ * where problems are occurring.
+ *
+ * This is intended as a debugging tool for the developer only.
+ * Please refrain from leaving trace_puts scattered around in
+ * your code. (Extra memory is used for special buffers that are
+ * allocated when trace_puts() is used.)
+ *
+ * Returns: 0 if nothing was written, positive # if string was.
+ *  (1 when __trace_bputs is used, strlen(str) when __trace_puts is used)
+ */
+
+#define trace_puts(str) ({						\
+	static const char *trace_printk_fmt __used			\
+		__section("__trace_printk_fmt") =			\
+		__builtin_constant_p(str) ? str : NULL;			\
+									\
+	if (__builtin_constant_p(str))					\
+		__trace_bputs(_THIS_IP_, trace_printk_fmt);		\
+	else								\
+		__trace_puts(_THIS_IP_, str);				\
+})
+extern int __trace_bputs(unsigned long ip, const char *str);
+extern int __trace_puts(unsigned long ip, const char *str);
+
+extern void trace_dump_stack(int skip);
+
+/*
+ * The double __builtin_constant_p is because gcc will give us an error
+ * if we try to allocate the static variable to fmt if it is not a
+ * constant. Even with the outer if statement.
+ */
+#define ftrace_vprintk(fmt, vargs)					\
+do {									\
+	if (__builtin_constant_p(fmt)) {				\
+		static const char *trace_printk_fmt __used		\
+		  __section("__trace_printk_fmt") =			\
+			__builtin_constant_p(fmt) ? fmt : NULL;		\
+									\
+		__ftrace_vbprintk(_THIS_IP_, trace_printk_fmt, vargs);	\
+	} else								\
+		__ftrace_vprintk(_THIS_IP_, fmt, vargs);		\
+} while (0)
+
+extern __printf(2, 0) int
+__ftrace_vbprintk(unsigned long ip, const char *fmt, va_list ap);
+
+extern __printf(2, 0) int
+__ftrace_vprintk(unsigned long ip, const char *fmt, va_list ap);
+
+extern void ftrace_dump(enum ftrace_dump_mode oops_dump_mode);
+#else
+static inline void tracing_start(void) { }
+static inline void tracing_stop(void) { }
+static inline void trace_dump_stack(int skip) { }
+
+static inline void tracing_on(void) { }
+static inline void tracing_off(void) { }
+static inline int tracing_is_on(void) { return 0; }
+static inline void tracing_snapshot(void) { }
+static inline void tracing_snapshot_alloc(void) { }
+
+static inline __printf(1, 2)
+int trace_printk(const char *fmt, ...)
+{
+	return 0;
+}
+static __printf(1, 0) inline int
+ftrace_vprintk(const char *fmt, va_list ap)
+{
+	return 0;
+}
+static inline void ftrace_dump(enum ftrace_dump_mode oops_dump_mode) { }
+#endif /* CONFIG_TRACING */
+
+#endif
-- 
2.43.0

