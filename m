Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02710CDE0D5
	for <lists+dri-devel@lfdr.de>; Thu, 25 Dec 2025 20:08:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E42F310E1E7;
	Thu, 25 Dec 2025 19:08:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kBEE50GI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64D9110E1E7
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Dec 2025 19:08:33 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-4edb6e678ddso99178241cf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Dec 2025 11:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766689712; x=1767294512; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hauBx7stO8fgVv7cwKU+lRmpmOfl414DpJwGxBenCpM=;
 b=kBEE50GISABGPoAMorcu1j8VeFhOQQ+tyBZbnECbBbcS4XKoLWxb9j3bXb8sNoF8zv
 dukCkaXfXkF9WsZs+eLrw64xWXlA5Z6i5f6+moMI+qdEUvj1IeA7SxgVsRpTcwcxufNk
 26wS5RsAnYU/t3whsp0j49etGvbTLacpPaLFQqnCbYDuyk+t+sJwMMT5v7P8Ax4hIK7A
 gBrV/wS8fR+lPhn2IB9l6Mju9Ca3zHPJ0heeSCC/xVtYh9hiXMYfptB8Je+QeTzBMDIb
 jIoNGoeUQ7aoSzc9qwZQWBZSq5WbvPui0FMetiMEe/x4LhbQSk8QsGt49WwdpP0FIRG1
 06vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766689712; x=1767294512;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hauBx7stO8fgVv7cwKU+lRmpmOfl414DpJwGxBenCpM=;
 b=WS4eRIVywtVmkV9hXIlfiJsfbHbwhMQct8tfJ6uY9hp0XUAU7RMK6zuQVrOpU0IfH3
 oc8ifEgFEooaHUghfyX6do+n2AUF78obigDvB1bVGageb0HeuiILxfIa4esb9JwzG0j7
 ABffZfdv8Bb5BGFlMwbK4/NJrTo2UFp1QfZe5/mWmC2A0wG628v/oW79caCodQSrZQK+
 Np4ZdW186x8jPt+azlEjzxj22wza6oA2g94qkznV0DpLyNy2aU64M9b+RjmK4p0qcYMp
 MpUWvuuh9boIFSZG+3aCbnH4beOnX9vmQYGUFAQQEsSBK/ElumNxi1+Reb3PSKVZuMc5
 Ervg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU11xkq64I0U5ZkPhGNUCVsDdCCaKXdG9t0I3sMQIrAhkAUNJdHU3DkRki1SyoSZ3kwjZyeL8YUTFE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyU1ObRzop034UmID3u5LMwz1/9gnI5YaqsiPST7fyV/keGavWS
 nsqUB+bLZxki882KPnWfTizGnMapTSIqJFm1Qedsi3kHo0umFsdsA12B
X-Gm-Gg: AY/fxX7cWAYZs5M45/5maLaJhvKbhcY3+L6Qmj0oqdqMr697WztiYbmran06+Bk2v6p
 xJ2DgK0TOZ8F4ApWXmZcW64QUCTUBgCpHrljpsyPUfy3D2RABWY4nAOOSBx2+55cQpmv16KMl1W
 NAsvL0VQvM3SWU77m9vv8+htyEzTHvoTj5e7vUuLmMTbxaD7tXlWb5XNz/GVh1ZYHA/hSDz+mD+
 t6Pa8QAAQkQHfSaiZZtLnEj7j9cebVUmE1RMY2+/IgLMvZxR4WnM4wu6F6D7PKICCbiEdxi//wy
 pHc/QWrDFIjngiQ/WWMbdfnjrZYAys/OnEwiJeoSCmI9u9LvjOEKbYANOjyssbBldqG0CcLx0ge
 gS2LvgCd2nTEMiIKAKStAU7z09JtlJsb58vbddNLBho6GrqWNngdZZOMSezGjqiKrrsWVBkJSzb
 3ug69GhZA+k7AEPzajYQ==
X-Google-Smtp-Source: AGHT+IFOC5KnXE7Y/86OXEfn0VfROKTdlo6cIy7sSNHG4HuRQ93qgtI5LmuQjuxLc/KbIiLosqGOQg==
X-Received: by 2002:a53:8592:0:b0:63f:ad6d:cbd5 with SMTP id
 956f58d0204a3-6466a900e02mr12636421d50.60.1766682577930; 
 Thu, 25 Dec 2025 09:09:37 -0800 (PST)
Received: from localhost ([2601:346:0:79bd:5a70:118b:3656:4527])
 by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-6466a8bd6ffsm9803141d50.9.2025.12.25.09.09.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Dec 2025 09:09:37 -0800 (PST)
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
Subject: [PATCH v4 5/7] tracing: Remove size parameter in __trace_puts()
Date: Thu, 25 Dec 2025 12:09:27 -0500
Message-ID: <20251225170930.1151781-6-yury.norov@gmail.com>
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

From: Steven Rostedt <rostedt@goodmis.org>

The __trace_puts() function takes a string pointer and the size of the
string itself. All users currently simply pass in the strlen() of the
string it is also passing in. There's no reason to pass in the size.
Instead have the __trace_puts() function do the strlen() within the
function itself.

This fixes a header recursion issue where using strlen() in the macro
calling __trace_puts() requires adding #include <linux/string.h> in order
to use strlen(). Removing the use of strlen() from the header fixes the
recursion issue.

Link: https://lore.kernel.org/all/aUN8Hm377C5A0ILX@yury/

Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 include/linux/kernel.h | 4 ++--
 kernel/trace/trace.c   | 7 +++----
 kernel/trace/trace.h   | 2 +-
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index 5b879bfea948..4ee48fb10dec 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -329,10 +329,10 @@ int __trace_printk(unsigned long ip, const char *fmt, ...);
 	if (__builtin_constant_p(str))					\
 		__trace_bputs(_THIS_IP_, trace_printk_fmt);		\
 	else								\
-		__trace_puts(_THIS_IP_, str, strlen(str));		\
+		__trace_puts(_THIS_IP_, str);				\
 })
 extern int __trace_bputs(unsigned long ip, const char *str);
-extern int __trace_puts(unsigned long ip, const char *str, int size);
+extern int __trace_puts(unsigned long ip, const char *str);
 
 extern void trace_dump_stack(int skip);
 
diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 6f2148df14d9..57f24e2cd19c 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -1178,11 +1178,10 @@ EXPORT_SYMBOL_GPL(__trace_array_puts);
  * __trace_puts - write a constant string into the trace buffer.
  * @ip:	   The address of the caller
  * @str:   The constant string to write
- * @size:  The size of the string.
  */
-int __trace_puts(unsigned long ip, const char *str, int size)
+int __trace_puts(unsigned long ip, const char *str)
 {
-	return __trace_array_puts(printk_trace, ip, str, size);
+	return __trace_array_puts(printk_trace, ip, str, strlen(str));
 }
 EXPORT_SYMBOL_GPL(__trace_puts);
 
@@ -1201,7 +1200,7 @@ int __trace_bputs(unsigned long ip, const char *str)
 	int size = sizeof(struct bputs_entry);
 
 	if (!printk_binsafe(tr))
-		return __trace_puts(ip, str, strlen(str));
+		return __trace_puts(ip, str);
 
 	if (!(tr->trace_flags & TRACE_ITER(PRINTK)))
 		return 0;
diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
index b6d42fe06115..de4e6713b84e 100644
--- a/kernel/trace/trace.h
+++ b/kernel/trace/trace.h
@@ -2116,7 +2116,7 @@ extern void tracing_log_err(struct trace_array *tr,
  * about performance). The internal_trace_puts() is for such
  * a purpose.
  */
-#define internal_trace_puts(str) __trace_puts(_THIS_IP_, str, strlen(str))
+#define internal_trace_puts(str) __trace_puts(_THIS_IP_, str)
 
 #undef FTRACE_ENTRY
 #define FTRACE_ENTRY(call, struct_name, id, tstruct, print)	\
-- 
2.43.0

