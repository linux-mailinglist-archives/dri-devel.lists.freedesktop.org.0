Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B046B8799B2
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 18:03:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1FB0112F3A;
	Tue, 12 Mar 2024 17:03:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HoscBxAy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64926112F34
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 17:03:39 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-1d944e8f367so1243205ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 10:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710263019; x=1710867819; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UNfBGF7ZRB5gRY5ju3ZTnVyluuI6d4pIMWMvwwDFCuc=;
 b=HoscBxAyHP8c9DhCVQ4As0XgTHSnz3ERQcZWewCzvuDHdbmDYd4b2uGhYpWm98kTcS
 4Icdziocofc6NltlS3xzVdMIbWwyq+RZ2h2ltMbhAkrsyHjrbgFP42Mdl0v6AMDrgTUL
 eCELLZaun0nya/ZsDKR77rwv+nkQsg7DfLRXA6AZioMNkxhFWr2d1flreiOKTfZ+RDd/
 HcgnxDzKcJTKghL4Zd9AWrYrBTic0Bpyxd8NBPm3fH1ztwbWNHNbbBZhgrigv0t9u+7J
 D6FydchurkC+H6HyFuea0I+AKS9SaxNcg5F9Dhn24zd7FM+AYPmLHh7OGlPh1I699ANb
 sQ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710263019; x=1710867819;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UNfBGF7ZRB5gRY5ju3ZTnVyluuI6d4pIMWMvwwDFCuc=;
 b=bCo+N+fbkYodJxISVkAEQiIi5tfKwDSyQMQDXp1IxfXiGGmt1sWtasYmw9iBt8Qnig
 dxWDcrdQagRhljBVRzZnQaGw6FtM71/HzH/1tcBbVaKrG3JzK2pZvtFX6+Q7vMjtBmH5
 p7JjPdNFedJiNZuxoRE/RlncVEGzl1Vg5xKZ6XHSc4nkmAa7HiuW07CxN6QK7QpfX1dx
 xgou2xFa2YK5+NfX23gzXGuMXtLAd+iTNzAN8NESelVb/m+qq83Fzyu8gUp1eJP//+7O
 uDOKNZedoayH2pNeW1XvhiBEZk32BoO22J0XTvR5MBKJYK1udUSCttm1oC1QJYRZh5PY
 jmsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUT1cePGwXe9Am+yBQ4g2ockA1UkYv8WgJgZEGjpLZ/wkPJecelbZ0di+32j4dPHwjKh/AXY/XeZ9BFoxy1fBVu4TxCbtbJCCWyduT/dH7J
X-Gm-Message-State: AOJu0Yz5vr4sdejQ9ckvTdWEIUfQEfJjyKFW0s3ui8WCl+HGQAq320ms
 P3uxjkdh+qOYhJQa8U5MLOBlmKCJXJJLMXKZBfsjkkA1BqbPzwkR
X-Google-Smtp-Source: AGHT+IGjcPO5G+GnCGVDj4Jcw0R4zzS4LNLUn52exaX20Pa+MrIRq7GoxtzdXir/jkag847FtE7VIQ==
X-Received: by 2002:a17:902:cec8:b0:1dd:7d6a:de4f with SMTP id
 d8-20020a170902cec800b001dd7d6ade4fmr939106plg.2.1710263018703; 
 Tue, 12 Mar 2024 10:03:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 k17-20020a170902c41100b001d9edac54b1sm6398555plk.171.2024.03.12.10.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Mar 2024 10:03:38 -0700 (PDT)
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
Subject: [PATCH 11/14] s390: Add support for suppressing warning backtraces
Date: Tue, 12 Mar 2024 10:03:06 -0700
Message-Id: <20240312170309.2546362-12-linux@roeck-us.net>
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
 arch/s390/include/asm/bug.h | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/arch/s390/include/asm/bug.h b/arch/s390/include/asm/bug.h
index aebe1e22c7be..01e2aa4069d7 100644
--- a/arch/s390/include/asm/bug.h
+++ b/arch/s390/include/asm/bug.h
@@ -8,19 +8,30 @@
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 
+#if IS_ENABLED(CONFIG_KUNIT)
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	"	.long	%0-.\n"
+# define __BUG_FUNC	__func__
+#else
+# define __BUG_FUNC_PTR
+# define __BUG_FUNC	NULL
+#endif /* IS_ENABLED(CONFIG_KUNIT) */
+
 #define __EMIT_BUG(x) do {					\
 	asm_inline volatile(					\
 		"0:	mc	0,0\n"				\
 		".section .rodata.str,\"aMS\",@progbits,1\n"	\
 		"1:	.asciz	\""__FILE__"\"\n"		\
 		".previous\n"					\
-		".section __bug_table,\"awM\",@progbits,%2\n"	\
+		".section __bug_table,\"awM\",@progbits,%3\n"	\
 		"2:	.long	0b-.\n"				\
 		"	.long	1b-.\n"				\
-		"	.short	%0,%1\n"			\
-		"	.org	2b+%2\n"			\
+		__BUG_FUNC_PTR					\
+		"	.short	%1,%2\n"			\
+		"	.org	2b+%3\n"			\
 		".previous\n"					\
-		: : "i" (__LINE__),				\
+		: : "i" (__BUG_FUNC),				\
+		    "i" (__LINE__),				\
 		    "i" (x),					\
 		    "i" (sizeof(struct bug_entry)));		\
 } while (0)
-- 
2.39.2

