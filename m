Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 898AD8726C6
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 19:40:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7617112C30;
	Tue,  5 Mar 2024 18:40:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d8Aotpx9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33369112C30
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 18:40:51 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-6e622b46f45so2080224b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 10:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709664051; x=1710268851; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X0gUmPSeCCdcwdwoiei/E0Jjh2VpvFQYRxx27Vw8kHc=;
 b=d8Aotpx90gFEHqRmIimuBxUT3T5862N1IDUjqhLMMmzy9ABECVbL/1qt/53BwpyyLp
 XANfk/XFmiOmt6IOLOzSiP/NLUvX1KrU+FsKyMY1Gm2YFoteHH6DkMjm54IsDpARC5Jk
 qlf6RmijkaKIRM/uNGVMz5y4cGXkKN3qvS4MevqILi3LNDyNRd+mpO1X67OYh1Dwsvnj
 tJzQT1ZgD1L6LDCkWVXv4Pcn9OYguNnRgxhzc8GEVNpaC98mmJO9O/FHnpdEKwH/dCF/
 nDZGKHxh+EJgF3EM7z6yDXpwSa3ImACy++38fC15EfelVDuWNfsLkJL+M3+Tw6NxioSx
 cRmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709664051; x=1710268851;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=X0gUmPSeCCdcwdwoiei/E0Jjh2VpvFQYRxx27Vw8kHc=;
 b=tFZpBfU7Fhba0vlR7MijUswPheklaBnbHwUUPwWELEk0KlKPSiERlo9wizalH3sDc1
 wSU4wP8R30BZzbKtZNwOWU6uYvHzLhaZU4x8WPdLp+RyiZCuYwOLRLxm3aYuIGXQM9mv
 pkpyKelMpWngiR0uC1pQmxwxRb0sl5sfsQM3IwRTEoNg+w1KnrZYlBAYua3vKQRDzDgQ
 7bPve7e2hpVu7aHPHBt5bqqMv5Q91hV7hFU4ZN/Oxn5DQ3Sp/4sV4JoASJh6tc+asP9j
 eTUB/b3Y1DGTDYRXoOIlrlikVKy4n6NRDKsV1002zxXB60RZQcNhOSsmb6UdhUzJDx7A
 JsSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW39GTOJta5tBSEcxqNRQeq3T8GoIbi8J+f7IKAj+hf4WRjzfGr1ZEdIHWw/tbj+LsH0tShH/kTY/6bTPGdgAtbq5CNQ7vVs6DpIEQyqvGD
X-Gm-Message-State: AOJu0YzExgYE4SCzQcPoMNT/PpNxfzCLbvYAQC8fZiA5s2NlhyDBl3Qc
 H2US1rWh6UfmMw6xvaZWUA1mPJ8dEoqSRSK/MnfElvM3SCoOt4bR
X-Google-Smtp-Source: AGHT+IEh5cNC1e3ALin9EYEqP1JMKTTzvFIxop5uA7PitJpNaz0+Cvy9gmZD//Z/el6YtUoATah/OA==
X-Received: by 2002:a05:6a21:3403:b0:1a0:e089:e25e with SMTP id
 yn3-20020a056a21340300b001a0e089e25emr2819250pzb.46.1709664050630; 
 Tue, 05 Mar 2024 10:40:50 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 p2-20020aa78602000000b006e24991dd5bsm9538237pfn.98.2024.03.05.10.40.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 10:40:49 -0800 (PST)
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 kunit-dev@googlegroups.com, linux-arch@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>
Subject: [RFC PATCH 5/5] loongarch: Add support for suppressing warning
 tracebacks
Date: Tue,  5 Mar 2024 10:40:33 -0800
Message-Id: <20240305184033.425294-6-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240305184033.425294-1-linux@roeck-us.net>
References: <20240305184033.425294-1-linux@roeck-us.net>
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

Add support for selectively suppressing WARNING tracebacks to loongarch.
This requires adding the function triggering tracebacks to the __bug_table
object section.

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

