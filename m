Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A278157BA3A
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 17:35:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A500A8F581;
	Wed, 20 Jul 2022 15:33:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B70898F492;
 Wed, 20 Jul 2022 15:33:35 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id p81so14580874iod.2;
 Wed, 20 Jul 2022 08:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xVymCjFaAr/5yeRejIIRfFKQFL+urAeap4IneZPJK3A=;
 b=bujmKHM4YFLFOfEPx1nanttdCH7DKn21RH7Htn1byJCg9wmmAict6kwVuQQA2rKRYR
 qACR9eIssApoSjMqkWwjwEUm8vhdGTniCk41kW4jKCEz26zde1uXVVO0sCkrLwmJ2F8v
 sG3S6cW+sstGMMji8JnXkxaB6uSABSfHTTQZmTDEkfs8FsNC3UhbUoSZv/Xa/14C6D8G
 +oKVRmd/j8WuG465+RfXJkU82y88lb4l/9hb2kKtluT18nb537VLN2P3FIbqRcmHVhs6
 n512Dz3GHmMmo+rkS3OrliXSn/2UHowPvaME6skXf1BEp3l/yk82Wb1Ja48QsPFMiPyn
 DN7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xVymCjFaAr/5yeRejIIRfFKQFL+urAeap4IneZPJK3A=;
 b=wU+miQ7MoXT3kxhiF6EA04oCXQg/yoQqIaKhqrWbeHzoFy91IVtqYUP6+0fr4aet3n
 a/8jFDuGSryIxeCB8/jXI6RYvBheNGz0TJEdGGwfWXAawez8AZqiipJq3aD4s+nyRcUx
 c6+xe2KU/S6CFpUn4V2KPI7U+kNWPf5Gk18NKLGYFBZDdaJFZXdkBLDvPqasMzK0O+KE
 Mi+fVZqNzuD5tE5ltjEyVEPGXHIXmcraPgVA79BA+5Q/t/wNv2j/5/6NYyi0Z9HERK7f
 fVMbWoxThOCIesm6NGr9knEcCjWhHH1LOdbZmKdR85fkU9sdYjfSUy7rjLASEvYmKQk8
 mJEw==
X-Gm-Message-State: AJIora/mj4wQWQh9rti+hXezQB8QNqTf3Vq3dZAJsaGBb6h/GBih5Wk+
 QFMd+Su+36JvTmKpDXreMKrE3u/GXlFbbw==
X-Google-Smtp-Source: AGRyM1tVu+2tYUGDbC0hQhPJHDB0MFK0wwApP45hZ686mFsaVjy871mENzX/M653rYoj9JUJcEMj/w==
X-Received: by 2002:a05:6638:2203:b0:33e:b93f:5882 with SMTP id
 l3-20020a056638220300b0033eb93f5882mr20103428jas.66.1658331214624; 
 Wed, 20 Jul 2022 08:33:34 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 q1-20020a92d401000000b002dcdb4bbe87sm4579581ilm.22.2022.07.20.08.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:33:34 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, robdclark@gmail.com
Subject: [PATCH v4 35/41] dyndbg: add 2 more trace-events: pr_debug, dev_dbg
Date: Wed, 20 Jul 2022 09:32:27 -0600
Message-Id: <20220720153233.144129-36-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220720153233.144129-1-jim.cromie@gmail.com>
References: <20220720153233.144129-1-jim.cromie@gmail.com>
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
full disclosure.  The args:

 1- struct _ddebug *descriptor, giving tracefs all of dyndbg's info.
    this replaces flags, which is in desc
 2- struct device *dev, used by trace_devdbg(), if !!dev

The trace_*() calls need the descriptor arg, the prototypes of the
callchain above them are extended to provide it.

dev_dbg(desc, dev...), if dev is true, issues a trace_devdbg(),
otherwise trace_prdbg().  This way we don't consume buffer space
storing nulls.  Otherwise the events are equivalent.

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
index 66f12b9127c7..e000d037cb2e 100644
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
 
@@ -855,7 +857,9 @@ struct ddebug_trace_bufs {
 static DEFINE_PER_CPU(struct ddebug_trace_bufs, ddebug_trace_bufs);
 static DEFINE_PER_CPU(int, ddebug_trace_reserve);
 
-static void ddebug_trace(const char *fmt, va_list args)
+__printf(3, 0)
+static void ddebug_trace(struct _ddebug *desc, const struct device *dev,
+			 const char *fmt, va_list args)
 {
 	struct ddebug_trace_buf *buf;
 	int bufidx;
@@ -874,7 +878,11 @@ static void ddebug_trace(const char *fmt, va_list args)
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
@@ -884,9 +892,9 @@ static void ddebug_trace(const char *fmt, va_list args)
 }
 
 __printf(2, 3)
-static void ddebug_printk(unsigned int flags, const char *fmt, ...)
+static void ddebug_printk(struct _ddebug *desc, const char *fmt, ...)
 {
-	if (flags & _DPRINTK_FLAGS_TRACE) {
+	if (desc->flags & _DPRINTK_FLAGS_TRACE) {
 		va_list args;
 
 		va_start(args, fmt);
@@ -894,11 +902,11 @@ static void ddebug_printk(unsigned int flags, const char *fmt, ...)
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
@@ -908,19 +916,19 @@ static void ddebug_printk(unsigned int flags, const char *fmt, ...)
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
@@ -943,7 +951,7 @@ void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...)
 	vaf.fmt = fmt;
 	vaf.va = &args;
 
-	ddebug_printk(descriptor->flags, KERN_DEBUG "%s%pV",
+	ddebug_printk(descriptor, KERN_DEBUG "%s%pV",
 		      dynamic_emit_prefix(descriptor, buf), &vaf);
 
 	va_end(args);
@@ -954,7 +962,6 @@ void __dynamic_dev_dbg(struct _ddebug *descriptor,
 		       const struct device *dev, const char *fmt, ...)
 {
 	struct va_format vaf;
-	unsigned int flags;
 	va_list args;
 
 	BUG_ON(!descriptor);
@@ -964,15 +971,14 @@ void __dynamic_dev_dbg(struct _ddebug *descriptor,
 
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
@@ -988,7 +994,6 @@ void __dynamic_netdev_dbg(struct _ddebug *descriptor,
 			  const struct net_device *dev, const char *fmt, ...)
 {
 	struct va_format vaf;
-	unsigned int flags;
 	va_list args;
 
 	BUG_ON(!descriptor);
@@ -998,24 +1003,22 @@ void __dynamic_netdev_dbg(struct _ddebug *descriptor,
 
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
@@ -1031,18 +1034,16 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
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
@@ -1050,10 +1051,10 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
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
2.36.1

