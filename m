Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E40B88799AF
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 18:03:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 063EB112F2F;
	Tue, 12 Mar 2024 17:03:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LLDBCXEC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 984A2112F30
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 17:03:34 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-5e4b775e1d6so31031a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 10:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710263014; x=1710867814; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QaoPploMqkrEWkpIzUU4wfevhj/fOj8xGNuIym5RM4g=;
 b=LLDBCXECYtP/fn2n54kGMuv0lww4itjJt/Tan2IBuODFwnTrohOEE3GbH0ay18FJX6
 v1hXKxyVT7E40vVBZfSItX6JynooNgd06GvYMq4ICBvvjUbAHoOXo/HWiBJmdedF4/Hh
 TtSewOT0dPT+SaX+//7GgicO8MxdGexp645qGdWOunU3nddgNXcIMfzftLf7XbQ5un78
 gvG43U0KaijSY0UnZD5haFOoG31nv6Ln8sR8CtuJshEO8f/OyNx3oF/9DofAL4daB+1P
 PqfqbK8rQIUe5u8E4+y6WQZpTlcho2wb8Cfeu/6RwDlFzV2pgqYrYXzQVO6uiFoZfc+u
 tkpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710263014; x=1710867814;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QaoPploMqkrEWkpIzUU4wfevhj/fOj8xGNuIym5RM4g=;
 b=GstlK5uJmc+ONkzROlCkcf8+BQY0dd2Vw7bQrx6/ZFAx9I1QFDNU9INUh3mI0mexMH
 A5FLSx5eql0xJLjeuSf+FtBOEnArW7ym31fO1LKOPIEP6QLDOeju2kDU5Q/LnYoFzO/q
 PAoy9qsXOQKwB7YXTfKXqU7wc4kmKdTnT6JQVPvqaX5Hpoal++ELsGc6zunlfRC1JEOz
 CeCw5dfB3GiJ6iBg6BTBJpvsvOVdt+RRLJrOm7gD1IE9FqDkFUTCghAqC/iVIUxbqY21
 y4oO2SF4SPAR1cn/3FdYo8Nc0FMcMN3YxVocg2lObFSYqv/nbjy7+SN3AUyy58p3DUYG
 ikPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXC2os7VDJh+2hv4g2mmaRqgOiJU1Vw2cUkPSCy5ueayfSak31zRspWR2B/fU6/Gtk4fGCNyiKYnST78zS6Nw9qy0TzWtSqYsC6A/jY3qOy
X-Gm-Message-State: AOJu0YyZNT8Cik9rKLS23ltVQQWHEytrVlV0sTmgZWnXf1Hg0xOnrStn
 KIh4+KgWDO0Z6USwedN5qdH09K0XWJY/0Y3MEdG+687OWFLQHcvn
X-Google-Smtp-Source: AGHT+IGp1mJ0KTZ+LQYMSXPX4xCWLkAXoeTNJUTBRzyrNk3iCGaW03oMbFoz7IlCFWta+THFx92xXA==
X-Received: by 2002:a17:90a:e514:b0:29a:9dd1:d45b with SMTP id
 t20-20020a17090ae51400b0029a9dd1d45bmr194372pjy.3.1710263013769; 
 Tue, 12 Mar 2024 10:03:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a17090a77cb00b0029bf32b524esm4052208pjs.13.2024.03.12.10.03.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Mar 2024 10:03:32 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: linux-kselftest@vger.kernel.org
Cc: David Airlie <airlied@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Kees Cook <keescook@chromium.org>, Daniel Diaz <daniel.diaz@linaro.org>,
 David Gow <davidgow@google.com>, Arthur Grillo <arthurgrillo@riseup.net>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, loongarch@lists.linux.dev,
 netdev@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 09/14] loongarch: Add support for suppressing warning
 backtraces
Date: Tue, 12 Mar 2024 10:03:04 -0700
Message-Id: <20240312170309.2546362-10-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240312170309.2546362-1-linux@roeck-us.net>
References: <20240312170309.2546362-1-linux@roeck-us.net>
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

Add name of functions triggering warning backtraces to the __bug_table
object section to enable support for suppressing WARNING backtraces.

To limit image size impact, the pointer to the function name is only added
to the __bug_table section if both CONFIG_KUNIT and CONFIG_DEBUG_BUGVERBOSE
are enabled. Otherwise, the __func__ assembly parameter is replaced with a
(dummy) NULL parameter to avoid an image size increase due to unused
__func__ entries (this is necessary because __func__ is not a define but a
virtual variable).

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 arch/loongarch/include/asm/bug.h | 38 +++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 11 deletions(-)

diff --git a/arch/loongarch/include/asm/bug.h b/arch/loongarch/include/asm/bug.h
index d4ca3ba25418..25f2b5ae7702 100644
--- a/arch/loongarch/include/asm/bug.h
+++ b/arch/loongarch/include/asm/bug.h
@@ -3,47 +3,63 @@
 #define __ASM_BUG_H
 
 #include <asm/break.h>
+#include <kunit/bug.h>
 #include <linux/stringify.h>
 
 #ifndef CONFIG_DEBUG_BUGVERBOSE
-#define _BUGVERBOSE_LOCATION(file, line)
+#define _BUGVERBOSE_LOCATION(file, func, line)
 #else
-#define __BUGVERBOSE_LOCATION(file, line)			\
+#if IS_ENABLED(CONFIG_KUNIT)
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR(func)  .long func - .;
+#else
+# define __BUG_FUNC_PTR(func)
+#endif
+
+#define __BUGVERBOSE_LOCATION(file, func, line)			\
 		.pushsection .rodata.str, "aMS", @progbits, 1;	\
 	10002:	.string file;					\
 		.popsection;					\
 								\
 		.long 10002b - .;				\
+		__BUG_FUNC_PTR(func)				\
 		.short line;
-#define _BUGVERBOSE_LOCATION(file, line) __BUGVERBOSE_LOCATION(file, line)
+#define _BUGVERBOSE_LOCATION(file, func, line) __BUGVERBOSE_LOCATION(file, func, line)
 #endif
 
 #ifndef CONFIG_GENERIC_BUG
-#define __BUG_ENTRY(flags)
+#define __BUG_ENTRY(flags, func)
 #else
-#define __BUG_ENTRY(flags) 					\
+#define __BUG_ENTRY(flags, func)				\
 		.pushsection __bug_table, "aw";			\
 		.align 2;					\
 	10000:	.long 10001f - .;				\
-		_BUGVERBOSE_LOCATION(__FILE__, __LINE__)	\
+		_BUGVERBOSE_LOCATION(__FILE__, func, __LINE__)	\
 		.short flags; 					\
 		.popsection;					\
 	10001:
 #endif
 
-#define ASM_BUG_FLAGS(flags)					\
-	__BUG_ENTRY(flags)					\
+#define ASM_BUG_FLAGS(flags, func)				\
+	__BUG_ENTRY(flags, func)				\
 	break		BRK_BUG
 
-#define ASM_BUG()	ASM_BUG_FLAGS(0)
+#define ASM_BUG()	ASM_BUG_FLAGS(0, .)
+
+#ifdef HAVE_BUG_FUNCTION
+# define __BUG_FUNC    __func__
+#else
+# define __BUG_FUNC    NULL
+#endif
 
 #define __BUG_FLAGS(flags)					\
-	asm_inline volatile (__stringify(ASM_BUG_FLAGS(flags)));
+	asm_inline volatile (__stringify(ASM_BUG_FLAGS(flags, %0)) : : "i" (__BUG_FUNC));
 
 #define __WARN_FLAGS(flags)					\
 do {								\
 	instrumentation_begin();				\
-	__BUG_FLAGS(BUGFLAG_WARNING|(flags));			\
+	if (!IS_SUPPRESSED_WARNING(__func__))			\
+		__BUG_FLAGS(BUGFLAG_WARNING|(flags));		\
 	instrumentation_end();					\
 } while (0)
 
-- 
2.39.2

