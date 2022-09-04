Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 800795AC782
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 23:47:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46B9910E2DE;
	Sun,  4 Sep 2022 21:43:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C84910E1DA;
 Sun,  4 Sep 2022 21:42:47 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id b17so3907019ilh.0;
 Sun, 04 Sep 2022 14:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=MkO54h6RbL6AorJv6VQNVgmDkIVAXQk+J2K+rcA8Q74=;
 b=T3ioRoJuy8MAjM1fBChZi1K/OJxDzDdQQqCdKzjffCvU/X3SlWWIpnYLeQ03GsbxIu
 5yy9VpNkonyO/kzNDY+IHHlpvMoDhr7TUxSwbaOTSQBjRTpMXELmW2qMxlS7zOBqTtAk
 LSywTJwn2v8eW8UIn/wC7G6bCUzFxHHA19DEPZ8Tb2eK8Ygwpx3NOvYhqhDhsSTuNblU
 uwascp+YyeS1UKoece2GHDMTMny2l3Gzr8HP/GirCcvXoswIOyRKsLSKaPSnP7DDTIOQ
 S5fNQreonTFjeF77CvhSPd4peuR9kXy9/Fs/m/E3iM7Ab+itlCiZck+Wtnigj5rqVSw+
 Eh/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=MkO54h6RbL6AorJv6VQNVgmDkIVAXQk+J2K+rcA8Q74=;
 b=mLSlgP/W56hHIm5heaeAwoO8T0/dPJZEz29zdERrSrni/KR1XoUOuv4cOXVT8VkYzl
 6HpRyDewAn/kg9DCe4G+U8bC66++/lE19S5gnkoz3NVKnLF3ju6X836Pmpc2f9Gic3Zp
 vQVjFBFP7iGIMqzFAz5Havhf0ogn11QNDk6jmuN/VM0hKsZdD2K2nLjms1t8MjZleumO
 6qa78TPhQoJTpjiwu2wZoD4PhP9W4EnjXONIXZEFKekI7icI0jJkUWZ5kA9Jiu4YIYhv
 iyHKvkROWpbsEFFQiWJuda0OItNr75OVeXpI3L2mmMUcVj2v3sWJrcpqSwsp2lOLk9gw
 gagA==
X-Gm-Message-State: ACgBeo3GyqE/cZPQttEDOWWNpNncFlNtxyEynY6xKwwI9Rnwdw0bh0Ay
 hN3E0ThUtCEiDMRQv2Ta/tc=
X-Google-Smtp-Source: AA6agR6NnQrYXo22ArhDnzgxL+0DpouWFgKRVUKYMPOBl25l0DqdASsseYFz8k/hKpmJXQxvRG2mmg==
X-Received: by 2002:a92:6903:0:b0:2e5:8f47:22e0 with SMTP id
 e3-20020a926903000000b002e58f4722e0mr24549638ilc.97.1662327766575; 
 Sun, 04 Sep 2022 14:42:46 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b006889ea7be7bsm3727688iov.29.2022.09.04.14.42.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 14:42:46 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 38/57] dyndbg: add 2 more trace-events: pr_debug, dev_dbg
Date: Sun,  4 Sep 2022 15:41:15 -0600
Message-Id: <20220904214134.408619-39-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220904214134.408619-1-jim.cromie@gmail.com>
References: <20220904214134.408619-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk, seanpaul@chromium.org,
 joe@perches.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ddebug_trace() currently issues a single printk:console event.
Replace that, adding include/trace/events/dyndbg.h, which defines 2
new events:

- dyndbg:prdbg  - from trace_prdbg()  - if !dev
- dyndbg:devdbg - from trace_devdbg() - if !!dev

This links the legacy pr_debug API to tracefs, via dyndbg, allowing
pr_debug()s etc to add just a little more user-context to the
trace-logs, and then at users option, less syslog.

The 2 new trace_*() calls accept their caller's args respectively,
keeping the available info w/o alteration; we can't improve on
transparency.  The args:

 1- struct _ddebug *descriptor, giving tracefs all of dyndbg's info.
 2- struct device *dev, used by trace_devdbg(), if !!dev

The trace_*() calls need the descriptor arg, the callchain prototypes
above them are extended to provide it.

The existing category param in this callchain is partially redundant;
when descriptor is available, it has the class_id.

dev_dbg(desc, dev...), if dev is true, issues a trace_devdbg(),
otherwise trace_prdbg().  This way we dont consume buffer space
storing nulls.  Otherwise the events are equivalent.

Also add include/trace/events/drm.h, to create 2 events for use in
drm_dbg() and drm_devdbg(), and call them.  This recapitulates the
changes described above, connecting 3-10K drm.debug callsites to
tracefs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/trace/events/dyndbg.h | 74 +++++++++++++++++++++++++++++++++++
 lib/dynamic_debug.c           | 73 +++++++++++++++++-----------------
 2 files changed, 111 insertions(+), 36 deletions(-)
 create mode 100644 include/trace/events/dyndbg.h

diff --git a/include/trace/events/dyndbg.h b/include/trace/events/dyndbg.h
new file mode 100644
index 000000000000..e19fcb56566c
--- /dev/null
+++ b/include/trace/events/dyndbg.h
@@ -0,0 +1,74 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM dyndbg
+
+#if !defined(_TRACE_DYNDBG_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_DYNDBG_H
+
+#include <linux/tracepoint.h>
+
+/* capture pr_debug() callsite descriptor and message */
+TRACE_EVENT(prdbg,
+	    TP_PROTO(const struct _ddebug *desc, const char *text, size_t len),
+
+	    TP_ARGS(desc, text, len),
+
+	    TP_STRUCT__entry(
+		    __field(const struct _ddebug *, desc)
+		    __dynamic_array(char, msg, len + 1)
+		    ),
+
+	    TP_fast_assign(
+		    __entry->desc = desc;
+		    /*
+		     * Each trace entry is printed in a new line.
+		     * If the msg finishes with '\n', cut it off
+		     * to avoid blank lines in the trace.
+		     */
+		    if (len > 0 && (text[len - 1] == '\n'))
+			    len -= 1;
+
+		    memcpy(__get_str(msg), text, len);
+		    __get_str(msg)[len] = 0;
+		    ),
+
+	    TP_printk("%s.%s %s", __entry->desc->modname,
+		      __entry->desc->function, __get_str(msg))
+);
+
+/* capture dev_dbg() callsite descriptor, device, and message */
+TRACE_EVENT(devdbg,
+	    TP_PROTO(const struct _ddebug *desc, const struct device *dev,
+		     const char *text, size_t len),
+
+	    TP_ARGS(desc, dev, text, len),
+
+	    TP_STRUCT__entry(
+		    __field(const struct _ddebug *, desc)
+		    __field(const struct device *, dev)
+		    __dynamic_array(char, msg, len + 1)
+		    ),
+
+	    TP_fast_assign(
+		    __entry->desc = desc;
+		    __entry->dev = (struct device *) dev;
+		    /*
+		     * Each trace entry is printed in a new line.
+		     * If the msg finishes with '\n', cut it off
+		     * to avoid blank lines in the trace.
+		     */
+		    if (len > 0 && (text[len - 1] == '\n'))
+			    len -= 1;
+
+		    memcpy(__get_str(msg), text, len);
+		    __get_str(msg)[len] = 0;
+		    ),
+
+	    TP_printk("%s.%s %s", __entry->desc->modname,
+		      __entry->desc->function, __get_str(msg))
+);
+
+#endif /* _TRACE_DYNDBG_H */
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 3c6c18f13889..0870e939f255 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -36,7 +36,9 @@
 #include <linux/sched.h>
 #include <linux/device.h>
 #include <linux/netdevice.h>
-#include <trace/events/printk.h>
+
+#define CREATE_TRACE_POINTS
+#include <trace/events/dyndbg.h>
 
 #include <rdma/ib_verbs.h>
 
@@ -874,7 +876,9 @@ struct ddebug_trace_bufs {
 static DEFINE_PER_CPU(struct ddebug_trace_bufs, ddebug_trace_bufs);
 static DEFINE_PER_CPU(int, ddebug_trace_reserve);
 
-static void ddebug_trace(const char *fmt, va_list args)
+__printf(3, 0)
+static void ddebug_trace(struct _ddebug *desc, const struct device *dev,
+			 const char *fmt, va_list args)
 {
 	struct ddebug_trace_buf *buf;
 	int bufidx;
@@ -893,7 +897,11 @@ static void ddebug_trace(const char *fmt, va_list args)
 	buf = this_cpu_ptr(ddebug_trace_bufs.bufs) + bufidx;
 
 	len = vscnprintf(buf->buf, sizeof(buf->buf), fmt, args);
-	trace_console(buf->buf, len);
+
+	if (!dev)
+		trace_prdbg(desc, buf->buf, len);
+	else
+		trace_devdbg(desc, dev, buf->buf, len);
 
 out:
 	/* As above. */
@@ -903,9 +911,9 @@ static void ddebug_trace(const char *fmt, va_list args)
 }
 
 __printf(2, 3)
-static void ddebug_printk(unsigned int flags, const char *fmt, ...)
+static void ddebug_printk(struct _ddebug *desc, const char *fmt, ...)
 {
-	if (flags & _DPRINTK_FLAGS_TRACE) {
+	if (desc->flags & _DPRINTK_FLAGS_TRACE) {
 		va_list args;
 
 		va_start(args, fmt);
@@ -913,11 +921,11 @@ static void ddebug_printk(unsigned int flags, const char *fmt, ...)
 		 * All callers include the KERN_DEBUG prefix to keep the
 		 * vprintk case simple; strip it out for tracing.
 		 */
-		ddebug_trace(fmt + strlen(KERN_DEBUG), args);
+		ddebug_trace(desc, NULL, fmt + strlen(KERN_DEBUG), args);
 		va_end(args);
 	}
 
-	if (flags & _DPRINTK_FLAGS_PRINTK) {
+	if (desc->flags & _DPRINTK_FLAGS_PRINTK) {
 		va_list args;
 
 		va_start(args, fmt);
@@ -927,19 +935,19 @@ static void ddebug_printk(unsigned int flags, const char *fmt, ...)
 }
 
 __printf(3, 4)
-static void ddebug_dev_printk(unsigned int flags, const struct device *dev,
+static void ddebug_dev_printk(struct _ddebug *desc, const struct device *dev,
 			      const char *fmt, ...)
 {
 
-	if (flags & _DPRINTK_FLAGS_TRACE) {
+	if (desc->flags & _DPRINTK_FLAGS_TRACE) {
 		va_list args;
 
 		va_start(args, fmt);
-		ddebug_trace(fmt, args);
+		ddebug_trace(desc, dev, fmt, args);
 		va_end(args);
 	}
 
-	if (flags & _DPRINTK_FLAGS_PRINTK) {
+	if (desc->flags & _DPRINTK_FLAGS_PRINTK) {
 		va_list args;
 
 		va_start(args, fmt);
@@ -962,7 +970,7 @@ void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...)
 	vaf.fmt = fmt;
 	vaf.va = &args;
 
-	ddebug_printk(descriptor->flags, KERN_DEBUG "%s%pV",
+	ddebug_printk(descriptor, KERN_DEBUG "%s%pV",
 		      dynamic_emit_prefix(descriptor, buf), &vaf);
 
 	va_end(args);
@@ -973,7 +981,6 @@ void __dynamic_dev_dbg(struct _ddebug *descriptor,
 		       const struct device *dev, const char *fmt, ...)
 {
 	struct va_format vaf;
-	unsigned int flags;
 	va_list args;
 
 	BUG_ON(!descriptor);
@@ -983,15 +990,14 @@ void __dynamic_dev_dbg(struct _ddebug *descriptor,
 
 	vaf.fmt = fmt;
 	vaf.va = &args;
-	flags = descriptor->flags;
 
 	if (!dev) {
-		ddebug_printk(flags, KERN_DEBUG "(NULL device *): %pV",
-			      &vaf);
+		ddebug_printk(descriptor, KERN_DEBUG "(NULL device *): %pV",
+			       &vaf);
 	} else {
 		char buf[PREFIX_SIZE] = "";
 
-		ddebug_dev_printk(flags, dev, "%s%s %s: %pV",
+		ddebug_dev_printk(descriptor, dev, "%s%s %s: %pV",
 				  dynamic_emit_prefix(descriptor, buf),
 				  dev_driver_string(dev), dev_name(dev),
 				  &vaf);
@@ -1007,7 +1013,6 @@ void __dynamic_netdev_dbg(struct _ddebug *descriptor,
 			  const struct net_device *dev, const char *fmt, ...)
 {
 	struct va_format vaf;
-	unsigned int flags;
 	va_list args;
 
 	BUG_ON(!descriptor);
@@ -1017,24 +1022,22 @@ void __dynamic_netdev_dbg(struct _ddebug *descriptor,
 
 	vaf.fmt = fmt;
 	vaf.va = &args;
-	flags = descriptor->flags;
 
 	if (dev && dev->dev.parent) {
 		char buf[PREFIX_SIZE] = "";
 
-		ddebug_dev_printk(flags, dev->dev.parent,
-				   "%s%s %s %s%s: %pV",
-				   dynamic_emit_prefix(descriptor, buf),
-				   dev_driver_string(dev->dev.parent),
-				   dev_name(dev->dev.parent),
-				   netdev_name(dev), netdev_reg_state(dev),
-				   &vaf);
+		ddebug_dev_printk(descriptor, dev->dev.parent,
+				  "%s%s %s %s%s: %pV",
+				  dynamic_emit_prefix(descriptor, buf),
+				  dev_driver_string(dev->dev.parent),
+				  dev_name(dev->dev.parent),
+				  netdev_name(dev), netdev_reg_state(dev),
+				  &vaf);
 	} else if (dev) {
-		ddebug_printk(flags, KERN_DEBUG "%s%s: %pV",
-			       netdev_name(dev), netdev_reg_state(dev), &vaf);
+		ddebug_dev_printk(descriptor, &dev->dev, KERN_DEBUG "%s%s: %pV",
+				  netdev_name(dev), netdev_reg_state(dev), &vaf);
 	} else {
-		ddebug_printk(flags, KERN_DEBUG "(NULL net_device): %pV",
-			       &vaf);
+		ddebug_printk(descriptor, KERN_DEBUG "(NULL net_device): %pV", &vaf);
 	}
 
 	va_end(args);
@@ -1050,18 +1053,16 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 {
 	struct va_format vaf;
 	va_list args;
-	unsigned int flags;
 
 	va_start(args, fmt);
 
 	vaf.fmt = fmt;
 	vaf.va = &args;
-	flags = descriptor->flags;
 
 	if (ibdev && ibdev->dev.parent) {
 		char buf[PREFIX_SIZE] = "";
 
-		ddebug_dev_printk(flags, ibdev->dev.parent,
+		ddebug_dev_printk(descriptor, ibdev->dev.parent,
 				  "%s%s %s %s: %pV",
 				  dynamic_emit_prefix(descriptor, buf),
 				  dev_driver_string(ibdev->dev.parent),
@@ -1069,10 +1070,10 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 				  dev_name(&ibdev->dev),
 				  &vaf);
 	} else if (ibdev) {
-		ddebug_printk(flags, KERN_DEBUG "%s: %pV",
-			      dev_name(&ibdev->dev), &vaf);
+		ddebug_dev_printk(descriptor, &ibdev->dev, KERN_DEBUG "%s: %pV",
+				  dev_name(&ibdev->dev), &vaf);
 	} else {
-		ddebug_printk(flags, KERN_DEBUG "(NULL ip_device): %pV", &vaf);
+		ddebug_printk(descriptor, KERN_DEBUG "(NULL ip_device): %pV", &vaf);
 	}
 
 	va_end(args);
-- 
2.37.2

