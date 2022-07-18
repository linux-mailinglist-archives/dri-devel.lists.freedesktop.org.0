Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8E2577BA6
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 08:41:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4687A9DA0;
	Mon, 18 Jul 2022 06:39:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3898FA9D68;
 Mon, 18 Jul 2022 06:39:16 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id w9so2043957ilg.1;
 Sun, 17 Jul 2022 23:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PreM9K4Lz+lhKCwMgValwSazrZm7+amowtHkQkgFWDk=;
 b=LFxBRJ7a/Nv5NzUkMEuCYRqXl19E+Q3GMjURKrBmj9VsSYq0zzZtxZ5vOZZFUdZ1ot
 d5oKxrHW8R5HjVP3wdFMEQKiNwM6pj8ufRlMeJEthzecASXQ60ORWtiQrIrfOlT+3AIn
 91kSChuQ4dhLcXqe37bRSv5DCXv714w325kaYurGWVUohr1Krhn+Xnq8ytPUH497upce
 1hHKcQ/Y5Qx4N49nqwtKoTF2Av4FwfzxBf+OXTb0aCEw4Kl5LEQGrQyVre4EeHw5o6QC
 XTQxMJJU/XhbLs199R4BrieqnZ3yKUjagsc8tQdfQMCkAgQzCN1Vm7HU7Es+XesZW8PK
 Ko1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PreM9K4Lz+lhKCwMgValwSazrZm7+amowtHkQkgFWDk=;
 b=zLs1nJLYJcYk9MilTsGQS2BRbvKALnOAANOkgrbVVSdsKfccKNqA0Yk6swjKvGLykM
 vafotD2DZcjY+C82jSfU7MA+U31TiuHJOtdz31ZBDSf8Dy8ZTDbXgtWll9WxsG1ABacH
 gJ0wlwz2Qt8cxNzaBwKbnqZBNejKHIb37yg8LMaqPkgolAU6q7gbxQsfBHPnp39G0W81
 WPnM4oVv1Eu47bTzXhxaECu16r9q7q7t60keB3Q0S5RSPj8YlfWmFw4I1NXM+UOwE3PN
 8RhUj/wwhTLtegxNZ3rroim5X1MDLdReCA1euW3B4i7RREGK0G0iB3/0rx3fmGJWL7Wq
 r9eA==
X-Gm-Message-State: AJIora+R9UvhjCjN5/Yri4ZwN0ry1QAScFEUUtpXFzFTtpAfgvwrAbwa
 U5uCeittJFX40piQJf95yME=
X-Google-Smtp-Source: AGRyM1sT2V+PvwqpgnT8APZI75F+1wceYHGWkpHLCM/URQjL1FoRpq7OQun67gmg7iSn+Ul7bsfvnw==
X-Received: by 2002:a92:cda1:0:b0:2dc:7c5c:ddb7 with SMTP id
 g1-20020a92cda1000000b002dc7c5cddb7mr13213850ild.161.1658126355868; 
 Sun, 17 Jul 2022 23:39:15 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o12-20020a92a80c000000b002dcd35bb030sm2342604ilh.74.2022.07.17.23.39.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 23:39:15 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Subject: [PATCH v3 34/41] dyndbg: add 2 trace-events: drm_{,dev}debug
Date: Mon, 18 Jul 2022 00:36:29 -0600
Message-Id: <20220718063641.9179-46-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718063641.9179-1-jim.cromie@gmail.com>
References: <20220718063641.9179-1-jim.cromie@gmail.com>
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add include/trace/events/drm.h, with 2 new events: drm_debug() &
drm_devdbg(), and call them from drm_dbg() & drm_dev_dbg().  This is
easy, cuz the callers already build the vaf that the callee wants.

This allows the 3-5k drm.debug/on-dyndbg callsites to independently
(re-)direct messages to tracefs, not just syslog.  ISTM this is good;
debug traffic can be sent (just) to the tool where it can be best
used.  Over time, I'd expect to see less traffic to syslog.

NOTE: The message formats for the 2 events are both sub-optimal.
(both have event-name too)

drm_devdbg: TP_printk("cat:%d, %s %s", __entry->drm_debug_category,

  "cat:%d" should be "%s", but the classnames arent really in-scope
  here.  Maybe the events-decl-header should be under drm somewhere,
  so that class-names are available.

  It would also be nice to replace the event-name with the classname,
  as the names are highly client centric.

drm_dbg: TP_printk("%s", __get_str(msg))

  same as above.

NB:

The existing category param in this callchain is partially redundant;
when descriptor is available, it has the callsite's class_id.  If
later, CONFIG_DRM_USE_DYNAMIC_DEBUG:=y (hardwired), then category can
be dropped here, since the descriptor will always be available.

Also, if combined with header-move (or maybe its expanding inclusion
by lib/dynamic_debug), we could add the optional flags prefix, by
exposing dynamic_emit_prefix.  And perhaps this could be done only in
TP_printk, to save work while writing to the ring-buffer.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_print.c | 25 ++++++++++++-----
 include/trace/events/drm.h  | 54 +++++++++++++++++++++++++++++++++++++
 2 files changed, 72 insertions(+), 7 deletions(-)
 create mode 100644 include/trace/events/drm.h

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 92f3f45e410c..9fb0b8e40dca 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -35,6 +35,9 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_print.h>
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/drm.h>
+
 /*
  * __drm_debug: Enable debug output.
  * Bitmask of DRM_UT_x. See include/drm/drm_print.h for details.
@@ -293,13 +296,19 @@ void __drm_dev_dbg(struct _ddebug *desc, const struct device *dev,
 	vaf.fmt = format;
 	vaf.va = &args;
 
-	if (dev)
-		dev_printk(KERN_DEBUG, dev, "[" DRM_NAME ":%ps] %pV",
-			   __builtin_return_address(0), &vaf);
-	else
-		printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
-		       __builtin_return_address(0), &vaf);
-
+	if (dev) {
+		if (desc->flags & _DPRINTK_FLAGS_PRINTK)
+			dev_printk(KERN_DEBUG, dev, "[" DRM_NAME ":%ps] %pV",
+				   __builtin_return_address(0), &vaf);
+		if (desc->flags & _DPRINTK_FLAGS_TRACE)
+			trace_drm_devdbg(dev, category, &vaf);
+	} else {
+		if (desc->flags & _DPRINTK_FLAGS_PRINTK)
+			printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
+			       __builtin_return_address(0), &vaf);
+		if (desc->flags & _DPRINTK_FLAGS_TRACE)
+			trace_drm_debug(category, &vaf);
+	}
 	va_end(args);
 }
 EXPORT_SYMBOL(__drm_dev_dbg);
@@ -319,6 +328,8 @@ void ___drm_dbg(struct _ddebug *desc, enum drm_debug_category category, const ch
 	printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
 	       __builtin_return_address(0), &vaf);
 
+	trace_drm_debug(category, &vaf);
+
 	va_end(args);
 }
 EXPORT_SYMBOL(___drm_dbg);
diff --git a/include/trace/events/drm.h b/include/trace/events/drm.h
new file mode 100644
index 000000000000..589fa1e1f2c2
--- /dev/null
+++ b/include/trace/events/drm.h
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM drm
+
+#if !defined(_TRACE_DRM_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_DRM_H
+
+#include <linux/tracepoint.h>
+
+/* drm_debug() was called, pass its args */
+TRACE_EVENT(drm_debug,
+	    TP_PROTO(int drm_debug_category, struct va_format *vaf),
+
+	    TP_ARGS(drm_debug_category, vaf),
+
+	    TP_STRUCT__entry(
+		    __field(int, drm_debug_category)
+		    __vstring(msg, vaf->fmt, vaf->va)
+		    ),
+
+	    TP_fast_assign(
+		    __entry->drm_debug_category = drm_debug_category;
+		    __assign_vstr(msg, vaf->fmt, vaf->va);
+		    ),
+
+	    TP_printk("%s", __get_str(msg))
+);
+
+/* drm_devdbg() was called, pass its args, preserving order */
+TRACE_EVENT(drm_devdbg,
+	    TP_PROTO(const struct device *dev, int drm_debug_category, struct va_format *vaf),
+
+	    TP_ARGS(dev, drm_debug_category, vaf),
+
+	    TP_STRUCT__entry(
+		    __field(const struct device*, dev)
+		    __field(int, drm_debug_category)
+		    __vstring(msg, vaf->fmt, vaf->va)
+		    ),
+
+	    TP_fast_assign(
+		    __entry->drm_debug_category = drm_debug_category;
+		    __entry->dev = dev;
+		    __assign_vstr(msg, vaf->fmt, vaf->va);
+		    ),
+
+	    TP_printk("cat:%d, %s %s", __entry->drm_debug_category,
+		      dev_name(__entry->dev), __get_str(msg))
+);
+
+#endif /* _TRACE_DRM_H */
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>
-- 
2.36.1

