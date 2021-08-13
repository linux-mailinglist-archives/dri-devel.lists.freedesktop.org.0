Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA053EB7AE
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 17:21:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E60C16E867;
	Fri, 13 Aug 2021 15:21:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16AB988E07;
 Fri, 13 Aug 2021 15:21:20 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id t13so229307ioj.7;
 Fri, 13 Aug 2021 08:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=exurjxhZnNMpJGUyDGyH6mJG8q3OTiV4CUPdinAeZAk=;
 b=GZqTShcC5/Iju7hI9/QB6MqoQO67KQPYYBeZ4z1TBDD9CSYA5WJaG1cHjJOekeN3Cu
 SUhwPj7hlQ/zT+jHXH6cfdd5D0L7Ki8VnCrQNjraLqRhVvfZLTP6gb0WeTOeJlgrkjRI
 iz6fUjcEYK4g0gaZ5eXnkYW3lFT/AmXQU60Qw6thhTYQ9eTKO4TZlUv6/pXfhCB837z9
 9GqZjevOZroOVFbieYFMFCAMV8RpvyIDETNVAGlQmXjFvNEGp1EI8viZOcX/2J4Oo9K5
 d6O9lrRZx1HEGWl89uwjbeKa/cRpfA/oNlhhXdpa/Ttk1f8fLZjsn9fpjNo/sq+K7kSb
 sQ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=exurjxhZnNMpJGUyDGyH6mJG8q3OTiV4CUPdinAeZAk=;
 b=iLjP/BcEgTGa+/75PkrKmuF9nRxLQcLUpHcvdzEnw3S2cIAyhciHKf3lrg1KZZ4WMq
 tgFQlEZl9oF+Xl7Ifwl3UHVmpnrpP9TnoN6LYTPwtOAJgGXpiOmgER3tcIDWpqkSH9sR
 aHZvP2FFoFpIbuP1M0fO48IYt0/VT6/Tcvik6Ytfj7nsHYAlP6rEwWgQlEDpw0IGlFY+
 wlBbtnCY62LvESQ1DC8DXpKpgEsEaPfDZxVkzaOURljNOiaOYSs/eS/DROEtet02tQsR
 reToPErnZZTUGThNRBIoykX1J8lr8k81pzzOgGAtoI2XWYqxf47PAt3UO9eSO6fTDc4y
 ZWwQ==
X-Gm-Message-State: AOAM532VRZz+miNZdMzY9+9S0jkpN3quuLG8Hzdb/e2+yky+dxRbV6f/
 xCsG5Eg684Tf9SwUMaGGQcA=
X-Google-Smtp-Source: ABdhPJwrD8LaBMoWQWQXxi+JScrGXll33ISRmsN1Og62PoLKWLEjEY3av7GQ8qZpx5NRyE8p/CxTqQ==
X-Received: by 2002:a05:6602:3359:: with SMTP id
 c25mr2398333ioz.181.1628868079205; 
 Fri, 13 Aug 2021 08:21:19 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id d4sm921145ilo.29.2021.08.13.08.21.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 08:21:18 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: gregkh@linuxfoundation.org, seanpaul@chromium.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jason Baron <jbaron@akamai.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Huang Rui <ray.huang@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Chengming Gui <Jack.Gui@amd.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Jim Cromie <jim.cromie@gmail.com>, John Clements <john.clements@amd.com>,
 Kevin Wang <kevin1.wang@amd.com>, Ashley Thomas <Ashley.Thomas2@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, Wyatt Wood <Wyatt.Wood@amd.com>,
 Jessica Yu <jeyu@kernel.org>, Johan Hovold <johan@kernel.org>,
 Nick Desaulniers <ndesaulniers@gooogle.com>, Joe Perches <joe@perches.com>,
 Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Thomas Gleixner <tglx@linutronix.de>,
 Vitor Massaru Iha <vitor@massaru.org>, Sedat Dilek <sedat.dilek@gmail.com>,
 Julian Braha <julianbraha@gmail.com>, Marco Elver <elver@google.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Oliver Glitta <glittao@gmail.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Albert van der Linde <alinde@google.com>,
 Arvind Sankar <nivedita@alum.mit.edu>,
 Patricia Alfonso <trishalfonso@google.com>, Arnd Bergmann <arnd@arndb.de>,
 Johannes Berg <johannes.berg@intel.com>, Jiri Olsa <jolsa@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 9/9] dyndbg: RFC add tracer facility RFC
Date: Fri, 13 Aug 2021 09:17:17 -0600
Message-Id: <20210813151734.1236324-10-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210813151734.1236324-1-jim.cromie@gmail.com>
References: <20210813151734.1236324-1-jim.cromie@gmail.com>
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

Sean Paul seanpaul@chromium.org proposed, in
https://patchwork.freedesktop.org/series/78133/
drm/trace: Mirror DRM debug logs to tracefs

That patchset's goal is to be able to duplicate the debug stream to a
tracing destination, by splitting drm_debug_enabled() into syslog &
trace flavors, and enabling them separately.  That clashes rather
deeply with this patchset's goal; to avoid drm_debug_enabled() using
dyndbg.

Instead, this puts the print-to-trace decision in dyndbg, after the
is-it-enabled test (which is a noop), so it has near zero additional
cost (other than memory increase); the print-to-trace test is only
done on enabled callsites.

The basic elements:

 - add a new struct _ddebug member: (*tracer)(char *format, ...)
 - add a new T flag to enable tracer
 - adjust the static-key-enable/disable condition for (p|T)
 - if (p) before printk, since T enables too.
 - if (T) call tracer if its true

 = int dynamic_debug_register_tracer(query, modname, tracer);
 = int dynamic_debug_unregister_tracer(query, modname, cookie);

This new interface lets clients set/unset a tracer function on each
callsite matching the query, for example: "drm:atomic:fail:".

Clients are expected to unregister the same callsites they register (a
cookie), allowing protection of each client's dyndbg-state setup
against overwrites by others.

Intended Behavior: (things are in flux, RFC)

- register sets empty slot, doesnt overwrite
  the query selects callsites, and sets +T (grammar requires +-action)

- register allows same-tracer over-set wo warn
  2nd register can then enable superset, subset, disjoint set

- unregister clears slot if it matches cookie/tracer
  query selects set, -T (as tested)
  tolerates over-clears

- dd-exec-queries(+/-T) can modify the enablements
  not sure its needed, but it falls out..

The code is currently in-line in ddebug_change(), to be moved to
separate fn, rc determines flow, may also veto/alter changes by
altering flag-settings - tbd.

TBD: Im not sure what happens when exec-queries(+T) hits a site wo a
tracer (silence I think. maybe not ideal).

internal call-chain gets a tracer param:
					New arg:
public: dynamic_debug_exec_queries
	ro-string copy moved ...
1	ddebug_exec_queries		tracer=NULL
	... to here
2	ddebug_exec_query		tracer=NULL

call-chain gets (re)used: with !NULL

public: dynamic_debug_register_tracer	tracer=client's
	w ro-string
1	ddebug_exec_queries		tracer
...

SELFTEST: test_dynamic_debug.ko:

Uses the tracer facility to do a selftest:

- A custom tracer counts the number of calls (of T-enabled pr_debugs),
- do_debugging(x) calls a set of categorized pr_debugs x times

- test registers the tracer on the function,
  then iteratively:
  manipulates dyndbg states via query-cmds
  runs do_debugging()
  counts enabled callsite executions
  reports mismatches

- modprobe test_dynamic_debug use_bad_tracer=1
  attaches a bad/recursive tracer
  Bad Things Happen.
  has thrown me interesting panics.

NOTES:

This needs more work. RFC.

ERRORS (or WARNINGS):

It should be an error to +T a callsite which has no aux_print set (ie
already registered with a query that selected that callsite).  This
tacitly enforces registration.

Then +T,-T can toggle those aux_print callsites (or subsets of them)
to tailor the debug-stream for the purpose.  Controlling flow is the
best work limiter.

---
v4+: (this patch sent after (on top of) v4)

. fix "too many arguments to function", and name the args:
  int (*aux_print)(const char *fmt, char *prefix, char *label, void *);
   prefix : is a slot for dynamic_emit_prefix, or for custom buffer insert
   label  : for builtin-caller used by drm-trace-print
   void*  : vaf, add type constraint later.

. fix printk (to syslog) needs if (+p), since +T also enables
. add prototypes for un/register_aux_print
. change iface names: s/aux_print/tracer/
. also s/trace_print/tracer/
. struct va_format *vaf - tighten further ?

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h |  32 ++++-
 lib/Kconfig.debug             |  10 ++
 lib/Makefile                  |   1 +
 lib/dynamic_debug.c           | 109 +++++++++++----
 lib/test_dynamic_debug.c      | 247 ++++++++++++++++++++++++++++++++++
 5 files changed, 372 insertions(+), 27 deletions(-)
 create mode 100644 lib/test_dynamic_debug.c

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 42cfb37d4870..cbcb1c94cec3 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -20,6 +20,7 @@ struct _ddebug {
 	const char *function;
 	const char *filename;
 	const char *format;
+	int (*tracer)(const char *fmt, char *prefix, char *label, struct va_format *vaf);
 	unsigned int lineno:18;
 	/*
 	 * The flags field controls the behaviour at the callsite.
@@ -27,7 +28,11 @@ struct _ddebug {
 	 * writes commands to <debugfs>/dynamic_debug/control
 	 */
 #define _DPRINTK_FLAGS_NONE	0
-#define _DPRINTK_FLAGS_PRINT	(1<<0) /* printk() a message using the format */
+#define _DPRINTK_FLAGS_PRINT		(1<<0) /* printk() a message */
+#define _DPRINTK_FLAGS_PRINT_TRACE	(1<<5) /* call (*tracer) */
+
+#define _DPRINTK_ENABLED (_DPRINTK_FLAGS_PRINT | _DPRINTK_FLAGS_PRINT_TRACE)
+
 #define _DPRINTK_FLAGS_INCL_MODNAME	(1<<1)
 #define _DPRINTK_FLAGS_INCL_FUNCNAME	(1<<2)
 #define _DPRINTK_FLAGS_INCL_LINENO	(1<<3)
@@ -279,4 +284,29 @@ extern const struct kernel_param_ops param_ops_dyndbg;
 #define _DD_cat_help_(pfx)
 #endif
 
+/**
+ * dynamic_debug_register_tracer - register a "printer" function
+ * @query: query-command string to select callsites getting the function
+ * @tracer: &vprintf-ish accepting 3 char* ptrs & a vaf
+ *
+ * Attach a printer function to callsites selected by query.
+ * If another printer is already attached, warn and skip, applying the
+ * rest of the query.  This protects existing setups, while allowing
+ * maximal coexistence of (mostly) non-competing listeners. RFC.
+ */
+int dynamic_debug_register_tracer(const char *query, const char *mod,
+	int (*tracer) (const char *fmt, char *prefix, char *label, struct va_format *vaf));
+/**
+ * dynamic_debug_unregister_tracer - unregister your "printer" function
+ * @query: query-command string to select callsites to reset
+ * @cookie: reserved to validate unregisters against pirates
+ *
+ * Detach this printer function (@cookie) from callsites selected by
+ * the query, when @cookie == callsite.  This protects existing
+ * setups, while allowing maximal coexistence of (mostly)
+ * non-competing listeners. RFC.
+ */
+int dynamic_debug_unregister_tracer(const char *query, const char *mod,
+	int (*cookie) (const char *fmt, char *prefix, char *label, struct va_format *vaf));
+
 #endif
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 5ddd575159fb..5038f81d3fc6 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2486,6 +2486,16 @@ config TEST_STATIC_KEYS
 
 	  If unsure, say N.
 
+config TEST_DYNAMIC_DEBUG
+	tristate "Test DYNAMIC_DEBUG"
+	depends on m
+	depends on DYNAMIC_DEBUG
+	help
+	  Test the print_aux registration with a counting fn,
+	  then test expected counts during the execution.
+
+	  If unsure, say N.
+
 config TEST_KMOD
 	tristate "kmod stress tester"
 	depends on m
diff --git a/lib/Makefile b/lib/Makefile
index 5efd1b435a37..01c3c76980ba 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -82,6 +82,7 @@ obj-$(CONFIG_TEST_SORT) += test_sort.o
 obj-$(CONFIG_TEST_USER_COPY) += test_user_copy.o
 obj-$(CONFIG_TEST_STATIC_KEYS) += test_static_keys.o
 obj-$(CONFIG_TEST_STATIC_KEYS) += test_static_key_base.o
+obj-$(CONFIG_TEST_DYNAMIC_DEBUG) += test_dynamic_debug.o
 obj-$(CONFIG_TEST_PRINTF) += test_printf.o
 obj-$(CONFIG_TEST_SCANF) += test_scanf.o
 obj-$(CONFIG_TEST_BITMAP) += test_bitmap.o
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 6bc645a663e7..9ba180976636 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -85,6 +85,7 @@ static inline const char *trim_prefix(const char *path)
 
 static struct { unsigned flag:8; char opt_char; } opt_array[] = {
 	{ _DPRINTK_FLAGS_PRINT, 'p' },
+	{ _DPRINTK_FLAGS_PRINT_TRACE, 'T' },
 	{ _DPRINTK_FLAGS_INCL_MODNAME, 'm' },
 	{ _DPRINTK_FLAGS_INCL_FUNCNAME, 'f' },
 	{ _DPRINTK_FLAGS_INCL_LINENO, 'l' },
@@ -146,7 +147,8 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
  * logs the changes.  Takes ddebug_lock.
  */
 static int ddebug_change(const struct ddebug_query *query,
-			 struct flag_settings *modifiers)
+			 struct flag_settings *modifiers,
+			 int (*tracer)(const char *, char *, char *, struct va_format *))
 {
 	int i;
 	struct ddebug_table *dt;
@@ -205,11 +207,43 @@ static int ddebug_change(const struct ddebug_query *query,
 			newflags = (dp->flags & modifiers->mask) | modifiers->flags;
 			if (newflags == dp->flags)
 				continue;
+
+			/* handle T flag */
+			if (newflags & _DPRINTK_FLAGS_PRINT_TRACE) {
+				if (!tracer)
+					v2pr_info("tracer enable\n");
+				else {
+					/* register attempt */
+					if (!dp->tracer) {
+						v2pr_info("register tracer\n");
+						dp->tracer = tracer;
+					}
+					else if (tracer == dp->tracer)
+						v2pr_info("tracer equal, ok\n");
+					else
+						pr_warn("tracer register error\n");
+				}
+			} else if (dp->flags & _DPRINTK_FLAGS_PRINT_TRACE) {
+				if (!tracer)
+					v2pr_info("ok: disabling\n");
+				else {
+					/* only unregister has a !!tracer */
+					if (!dp->tracer)
+						pr_warn("nok: tracer already unset\n");
+
+					else if (dp->tracer == tracer) {
+						v2pr_info("ok: cookie match, unregistering\n");
+						dp->tracer = NULL;
+					}
+					else
+						pr_warn("nok: tracer cookie match fail\n");
+				}
+			}
 #ifdef CONFIG_JUMP_LABEL
-			if (dp->flags & _DPRINTK_FLAGS_PRINT) {
-				if (!(modifiers->flags & _DPRINTK_FLAGS_PRINT))
+			if (dp->flags & _DPRINTK_ENABLED) {
+				if (!(modifiers->flags & _DPRINTK_ENABLED))
 					static_branch_disable(&dp->key.dd_key_true);
-			} else if (modifiers->flags & _DPRINTK_FLAGS_PRINT)
+			} else if (modifiers->flags & _DPRINTK_ENABLED)
 				static_branch_enable(&dp->key.dd_key_true);
 #endif
 			dp->flags = newflags;
@@ -482,7 +516,7 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 	return 0;
 }
 
-static int ddebug_exec_query(char *query_string, const char *modname)
+static int ddebug_exec_query(char *query_string, const char *modname, void *tracer)
 {
 	struct flag_settings modifiers = {};
 	struct ddebug_query query = {};
@@ -505,7 +539,7 @@ static int ddebug_exec_query(char *query_string, const char *modname)
 		return -EINVAL;
 	}
 	/* actually go and implement the change */
-	nfound = ddebug_change(&query, &modifiers);
+	nfound = ddebug_change(&query, &modifiers, tracer);
 	vpr_info_dq(&query, nfound ? "applied" : "no-match");
 
 	return nfound;
@@ -515,10 +549,19 @@ static int ddebug_exec_query(char *query_string, const char *modname)
    last error or number of matching callsites.  Module name is either
    in param (for boot arg) or perhaps in query string.
 */
-static int ddebug_exec_queries(char *query, const char *modname)
+static int ddebug_exec_queries(const char *query_in, const char *modname, void *tracer)
 {
 	char *split;
 	int i, errs = 0, exitcode = 0, rc, nfound = 0;
+	char *query; /* writable copy of query_in */
+
+	if (!query_in) {
+		pr_err("non-null query/command string expected\n");
+		return -EINVAL;
+	}
+	query = kstrndup(query_in, PAGE_SIZE, GFP_KERNEL);
+	if (!query)
+		return -ENOMEM;
 
 	for (i = 0; query; query = split) {
 		split = strpbrk(query, ";\n");
@@ -531,7 +574,7 @@ static int ddebug_exec_queries(char *query, const char *modname)
 
 		vpr_info("query %d: \"%s\" %s\n", i, query, (modname) ? modname : "");
 
-		rc = ddebug_exec_query(query, modname);
+		rc = ddebug_exec_query(query, modname, tracer);
 		if (rc < 0) {
 			errs++;
 			exitcode = rc;
@@ -540,6 +583,7 @@ static int ddebug_exec_queries(char *query, const char *modname)
 		}
 		i++;
 	}
+	kfree(query);
 	vpr_info("processed %d queries, with %d matches, %d errs\n",
 		 i, nfound, errs);
 
@@ -560,20 +604,7 @@ static int ddebug_exec_queries(char *query, const char *modname)
  */
 int dynamic_debug_exec_queries(const char *query, const char *modname)
 {
-	int rc;
-	char *qry; /* writable copy of query */
-
-	if (!query) {
-		pr_err("non-null query/command string expected\n");
-		return -EINVAL;
-	}
-	qry = kstrndup(query, PAGE_SIZE, GFP_KERNEL);
-	if (!qry)
-		return -ENOMEM;
-
-	rc = ddebug_exec_queries(qry, modname);
-	kfree(qry);
-	return rc;
+	return ddebug_exec_queries(query, modname, NULL);
 }
 EXPORT_SYMBOL_GPL(dynamic_debug_exec_queries);
 
@@ -637,8 +668,20 @@ void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...)
 	vaf.fmt = fmt;
 	vaf.va = &args;
 
-	printk(KERN_DEBUG "%s%pV", dynamic_emit_prefix(descriptor, buf), &vaf);
+	if (descriptor->flags & _DPRINTK_ENABLED)
+		dynamic_emit_prefix(descriptor, buf);
+
+	if (descriptor->flags & _DPRINTK_FLAGS_PRINT)
+		printk(KERN_DEBUG "%s%pV", buf, &vaf);
 
+	if (descriptor->flags & _DPRINTK_FLAGS_PRINT_TRACE) {
+
+		if (descriptor->tracer) {
+			(*descriptor->tracer)("%s:%ps %pV", buf,
+						 __builtin_return_address(0), &vaf);
+		}
+		/* else shouldnt matter, but maybe for consistency */
+	}
 	va_end(args);
 }
 EXPORT_SYMBOL(__dynamic_pr_debug);
@@ -783,7 +826,7 @@ static ssize_t ddebug_proc_write(struct file *file, const char __user *ubuf,
 		return PTR_ERR(tmpbuf);
 	vpr_info("read %d bytes from userspace\n", (int)len);
 
-	ret = ddebug_exec_queries(tmpbuf, NULL);
+	ret = ddebug_exec_queries(tmpbuf, NULL, NULL);
 	kfree(tmpbuf);
 	if (ret < 0)
 		return ret;
@@ -989,7 +1032,7 @@ static int ddebug_dyndbg_param_cb(char *param, char *val,
 	if (strcmp(param, "dyndbg"))
 		return on_err; /* determined by caller */
 
-	ddebug_exec_queries((val ? val : "+p"), modname);
+	ddebug_exec_queries((val ? val : "+p"), modname, NULL);
 
 	return 0; /* query failure shouldn't stop module load */
 }
@@ -1124,7 +1167,7 @@ static int __init dynamic_debug_init(void)
 	/* apply ddebug_query boot param, dont unload tables on err */
 	if (ddebug_setup_string[0] != '\0') {
 		pr_warn("ddebug_query param name is deprecated, change it to dyndbg\n");
-		ret = ddebug_exec_queries(ddebug_setup_string, NULL);
+		ret = ddebug_exec_queries(ddebug_setup_string, NULL, NULL);
 		if (ret < 0)
 			pr_warn("Invalid ddebug boot param %s\n",
 				ddebug_setup_string);
@@ -1214,3 +1257,17 @@ const struct kernel_param_ops param_ops_dyndbg = {
 };
 /* support DEFINE_DYNAMIC_DEBUG_CATEGORIES users */
 EXPORT_SYMBOL(param_ops_dyndbg);
+
+int dynamic_debug_register_tracer(const char *query, const char *mod,
+	int (*tracer) (const char *fmt, char *prefix, char *label, struct va_format *vaf))
+{
+	return ddebug_exec_queries(query, mod, tracer);
+}
+EXPORT_SYMBOL(dynamic_debug_register_tracer);
+
+int dynamic_debug_unregister_tracer(const char *query, const char *mod,
+	int (*tracer) (const char *fmt, char *prefix, char *label, struct va_format *vaf))
+{
+	return ddebug_exec_queries(query, mod, tracer);
+}
+EXPORT_SYMBOL(dynamic_debug_unregister_tracer);
diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
new file mode 100644
index 000000000000..e837398bd885
--- /dev/null
+++ b/lib/test_dynamic_debug.c
@@ -0,0 +1,247 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Kernel module for testing dynamic_debug
+ *
+ * Authors:
+ *      Jim Cromie	<jim.cromie@gmail.com>
+ */
+
+/*
+ * test-setup: use trace_print attachment interface as a test harness,
+ * define a custom trace_printer which counts invocations, and a
+ * pr_debug event generator function which calls a set of categorized
+ * pr_debugs.
+ * test-run: manipulate the pr_debug's enablement, run the event
+ * generator, and check for the expected side effects.
+ */
+
+#include <linux/module.h>
+
+static int __bad_tracer;
+
+static int trace_ct = 0;
+static int test_ct = 0;
+static int errors = 0;
+static int verbose = 0;
+
+
+module_param_named(use_bad_tracer, __bad_tracer, int, 0644);
+MODULE_PARM_DESC(use_bad_tracer,
+		 "use broken tracer, recursing with pr_debug\n"
+		 "\tonly works at modprobe time\n");
+
+static int (*my_tracer)(const char *decorator, char *prefix, char *label, struct va_format *vaf);
+
+static int good_tracer(const char *decorator, char *prefix, char *label, struct va_format *vaf)
+{
+	trace_ct++;
+	if (verbose)
+		pr_notice("my_tracer: %pV", vaf);
+	return 0;
+}
+
+static int bad_tracer(const char *decorator, char *prefix, char *label, struct va_format *vaf)
+{
+	/* dont try pr_debug, it recurses back here */
+	pr_debug("oops! recursion, crash?\n");
+	return 0;
+}
+
+static void pick_tracer(void)
+{
+	if (__bad_tracer)
+		my_tracer = bad_tracer;
+	else
+		my_tracer = good_tracer;
+}
+
+static int expect_count(int want, const char *story)
+{
+	test_ct++;
+	if (want != trace_ct) {
+		pr_err("expect_count: want %d, got %d: %s\n", want, trace_ct, story);
+		errors++;
+		trace_ct = 0;
+		return 1;
+	}
+	pr_info("pass %d, hits %d, on \"%s\"\n", test_ct, want, story);
+	trace_ct = 0;
+	return 0;
+}
+
+/* call pr_debug (4 * reps) + 2 times, for tracer side-effects */
+static void do_debugging(int reps)
+{
+	int i;
+
+	pr_debug("Entry:\n");
+	pr_info(" do_debugging %d time(s)\n", reps);
+	for (i = 0; i < reps; i++) {
+		pr_debug("hi: %d\n", i);
+		pr_debug("mid: %d\n", i);
+		pr_debug("low: %d\n", i);
+		pr_debug("low:lower: %d subcategory test\n", i);
+	}
+	pr_debug("Exit:\n");
+}
+
+static void expect_matches(int want, int got, const char *story)
+{
+	// todo: got <0 are errors, bubbled up
+	if (got != want)
+		pr_warn(" match_count wrong: want %d got %d on \"%s\"\n", want, got, story);
+	else
+		pr_info(" ok: %d matches by \"%s\"\n", want, story);
+
+	// ? count errs ? separately ?
+}
+
+static int report(char *who)
+{
+	if (errors)
+		pr_err("%s failed %d of %d tests\n", who, errors, test_ct);
+	else
+		pr_info("%s passed %d tests\n", who, test_ct);
+	return errors;
+}
+
+struct exec_test {
+	int matches;
+	int loops;
+	int hits;
+	const char *mod;
+	const char *qry;
+};
+
+static void do_exec_test(struct exec_test *tst)
+{
+	int match_count;
+
+	match_count = dynamic_debug_exec_queries(tst->qry, tst->mod);
+	expect_matches(tst->matches, match_count, tst->qry);
+	do_debugging(tst->loops);
+	expect_count(tst->hits, tst->qry);
+}
+
+static const char my_mod[] = "test_dynamic_debug";
+
+/* these tests rely on register stuff having been done ?? */
+struct exec_test exec_tests[] = {
+
+	/* standard use is my_mod, for `modprobe $module dyndbg=+p` */
+
+	/* no modification probe */
+	{ 6, 2, 0, my_mod, "func do_debugging +_" },
+
+	/* use original single string query style */
+	{ 6, 3, 0, NULL, "module test_dynamic_debug func do_debugging -T" },
+
+	/* this is mildly preferred */
+	{ 6, 3, 0, my_mod, "func do_debugging -T" },
+
+	/* enable all DUT */
+	{ 6, 4, 18, my_mod, "func do_debugging +T" },
+
+	/* disable 1 call */
+	{ 1, 4, 14, my_mod, "format '^hi:' -T" },
+
+	/* disable 1 call */
+	{ 1, 4, 10, my_mod, "format '^mid:' -T" },
+
+	/* repeat same disable */
+	{ 1, 4, 10, my_mod, "format '^mid:' -T" },
+
+	/* repeat same disable, diff run ct */
+	{ 1, 5, 12, my_mod, "format '^mid:' -T" },
+
+	/* include subclass */
+	{ 2, 4, 2, my_mod, "format '^low:' -T" },
+
+	/* re-disable, exclude subclass */
+	{ 1, 4, 2, my_mod, "format '^low: ' -T" },
+
+	/* enable, exclude subclass */
+	{ 1, 4, 6, my_mod, "format '^low: ' +T" },
+
+	/* enable the subclass */
+	{ 1, 4, 10, my_mod, "format '^low:lower:' +T" },
+
+	/* enable the subclass */
+	{ 1, 6, 14, my_mod, "format '^low:lower:' +T" },
+};
+
+struct register_test {
+	int matches;
+	int loops;
+	int hits;
+	const char *mod;
+	const char *qry;
+};
+
+static void do_register_test(struct register_test *tst)
+{
+	int match_count;
+
+	match_count = dynamic_debug_register_tracer(tst->qry, tst->mod, my_tracer);
+	expect_matches(tst->matches, match_count, tst->qry);
+	do_debugging(tst->loops);
+	expect_count(tst->hits, tst->qry);
+}
+
+struct register_test register_tests[] = {
+
+	{ 6, 3, 14, my_mod, "func do_debugging +T" },
+
+	{ 10, 3, 0, my_mod, "+_" }, //, my_tracer },
+	{ 11, 3, 0, my_mod, "+T" }, //, my_tracer },
+};
+
+static int __init test_dynamic_debug_init(void)
+{
+	int match_count; /* rc from ddebug_exec_queries. meh. */
+	int i;
+
+	pick_tracer();
+
+	pr_debug("Entry:\n");
+	do_debugging(3);
+	expect_count(0, "nothing unless dyndbg=+T at modprobe");
+
+	for (i = 0; i < ARRAY_SIZE(register_tests); i++)
+		do_register_test(&register_tests[i]);
+
+	do_debugging(2);
+	expect_count(10, "do_debugging 2 times after +T");
+
+	for (i = 0; i < ARRAY_SIZE(exec_tests); i++)
+		do_exec_test(&exec_tests[i]);
+
+	match_count = dynamic_debug_unregister_tracer(
+		"func do_debugging -T", "test_dynamic_debug", my_tracer);
+
+	expect_matches(6, match_count,
+		       "unregister do_debugging()s tracers");
+	do_debugging(4);
+	expect_count(0, "everything is off");
+
+	match_count = dynamic_debug_unregister_tracer(
+		"func do_debugging -T", "test_dynamic_debug", my_tracer);
+
+	expect_matches(6, match_count,
+		       "re-unregister, same count, not a change count");
+	report("init");
+	pr_debug("Exit:\n");
+	return 0;
+}
+
+static void __exit test_dynamic_debug_exit(void)
+{
+	report("exit");
+	pr_debug("Exit:");
+}
+
+module_init(test_dynamic_debug_init);
+module_exit(test_dynamic_debug_exit);
+
+MODULE_AUTHOR("Jim Cromie <jim.cromie@gmail.com>");
+MODULE_LICENSE("GPL");
-- 
2.31.1

