Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0356FCCCFFF
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 18:42:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6631E10E427;
	Thu, 18 Dec 2025 17:41:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com
 [216.40.44.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 407BA10E427;
 Thu, 18 Dec 2025 17:41:56 +0000 (UTC)
Received: from omf20.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay06.hostedemail.com (Postfix) with ESMTP id 034CC1358D7;
 Thu, 18 Dec 2025 17:41:52 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by
 omf20.hostedemail.com (Postfix) with ESMTPA id 023D820027; 
 Thu, 18 Dec 2025 17:41:47 +0000 (UTC)
Date: Thu, 18 Dec 2025 12:43:26 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Yury Norov <yury.norov@gmail.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Andrew Morton
 <akpm@linux-foundation.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Christophe Leroy <chleroy@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, David Laight
 <david.laight@runbox.com>, Petr Pavlu <petr.pavlu@suse.com>, Andi Shyti
 <andi.shyti@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko
 Ursulin <tursulin@ursulin.net>, Daniel Gomez <da.gomez@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>
Subject: Re: [PATCH v3 4/4] tracing: move tracing declarations from kernel.h
 to a dedicated header
Message-ID: <20251218124326.22334325@gandalf.local.home>
In-Reply-To: <20251218123349.35339242@gandalf.local.home>
References: <20251205175237.242022-1-yury.norov@gmail.com>
 <20251205175237.242022-5-yury.norov@gmail.com>
 <20251216161316.45b3f19ff0ad482018137189@linux-foundation.org>
 <55ceb7bf-0fe9-4edc-81c2-d51366847eec@infradead.org>
 <aUN8Hm377C5A0ILX@yury>
 <20251218123349.35339242@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 023D820027
X-Stat-Signature: o45fb7y4yczxrp6ryyc4bjh177djf3bh
X-Spam-Status: No, score=1.40
X-Rspamd-Server: rspamout08
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+gcUhXo6im9KxxnMPkzbEPK1jjIb73cJg=
X-HE-Tag: 1766079707-102559
X-HE-Meta: U2FsdGVkX1+FLaJcIEU86Yt8MEehfwVAisIxolYkzum3jsTsXtF/7d/COMCPvGimbkdCJDem8K4HreWeMJLYHvtpjFnvf3EsAgzop9i+1Qo75r6aRfau/Ye5CoT9oXH1h3WmzTn3Si1MuoMi+JVjVnvoaGdxDzYO/QwzORGyITGf+Xm/6rLqeb+FioS46ubI74HEXEowehIuZFosZJp+80qxOPGSXFaTarSa/MK47R0qIkOXeTnw9MGLdhS+zu6yQE80iPETG2eTIFNXnVWQWLq0jX/LndYRrn5J1xlOesaiULBiDx8MMtxGYXJWQ38xh4H0k3U+2AO+kFVcbDtrC1aErQ30++hwTAGk9FPoZMNtKSgcmEERjL1asAgBob4jxvppT+cS8Ff6SW8amtswUw==
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

On Thu, 18 Dec 2025 12:33:49 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Wed, 17 Dec 2025 22:59:33 -0500
> Yury Norov <yury.norov@gmail.com> wrote:
> 
> > I deem to drop trace_printk.h from kernel.h - it is more aligned with
> > the idea of unloading the header. The original motivation to keep
> > trace_printk.h in kernel.h was just because a similar printk.h is living
> > there. But after all, this is a purely debugging header, so no need for
> > almost every C file to bear debugging stuff.  
> 
> It is a big deal for debugging stuff. A lot of developers debug their code
> with trace_printk(), and do the "shotgun approach", where they cut and
> paste trace_printk()s all over their code in several files. Having to now add:
> 
>   #include <linux/trace_printk.h>
> 
> whenever a trace_printk() is added is going to be a big PITA and slow down
> all debugging efforts.
>

I don't actually remember why I had __trace_puts() pass in the size. I
could change it to:

diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index 5b46924fdff5..d5a939b8c391 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -331,10 +331,10 @@ int __trace_printk(unsigned long ip, const char *fmt, ...);
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
index e575956ef9b5..686741edb803 100644
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



Which removes the strlen() altogether.

-- Steve
