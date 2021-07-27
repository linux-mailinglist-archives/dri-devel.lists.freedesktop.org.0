Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB773D7FED
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 22:59:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DB6C6E98B;
	Tue, 27 Jul 2021 20:59:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36DC06E7D0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 20:59:13 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id j1so1781241pjv.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 13:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VM7uWZbkUfYnHDd5ZNIAVnDbZvywZy43PN6h2gF7C7c=;
 b=oBkhd6x8PpRaO8QoO+UEqARpklYQ85EbQwaaqZSpUTzsIkrs1pGiuH526VcUurLUkS
 +gkvSbxFz3vGB1BF1YQeauyWi9ev8hnzhng3t5uiTcBEZberDOU2lSJPBM+aa6yDkfTe
 HmjxMNfk6GT/foIn5FNaX7+ENNmF5UhcQ22mM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VM7uWZbkUfYnHDd5ZNIAVnDbZvywZy43PN6h2gF7C7c=;
 b=fEDwCKYdi28slY33YOcmzQcuN4YCcCNkjhPnltEnvyQimzJJ684yDlIKo1Vk9xdxU6
 1QilrM4/hZRcogHqp2GSfeC3H6FoSlMk0z9ZZTdvHryFebY7ZQzPf8jGT/XZUH3xUJvZ
 YLgi9flqt38cERmMhvP0Vskw/eiqM/ZVNjhtEBUFWnPWl0OdTVOVMZaMELdBC1QKWhki
 ApW1uoPv+FNajd65j24f0WPAOi7TnEkSwraeYzZ/jaxFjmpj+314Gs+9gDuJa1xI157Y
 HqMlIjgkV+ZDWwcq3G3QwtrOCQM+3FrY4kH0bR4PFNHrRunWgPoJns3RjGEdmljv8PxE
 jWlw==
X-Gm-Message-State: AOAM532UkPCKmwQ2Xo55Wb7BQ9k74ECJB5A6KHyssFR56Ej/QKX5KnJi
 p+cNLeyj3+urKYrdg2uYI4Sm6g==
X-Google-Smtp-Source: ABdhPJzvwIujwX2h82eYkbdvoMbJ+ZJVnzoCXczVsCM4H67j0yiuDjVnUU+OKLLA11yr/7OVmcSq6g==
X-Received: by 2002:a63:b4d:: with SMTP id a13mr22272005pgl.404.1627419552873; 
 Tue, 27 Jul 2021 13:59:12 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id e23sm3796816pjt.8.2021.07.27.13.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 13:59:09 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-hardening@vger.kernel.org
Subject: [PATCH 28/64] compiler_types.h: Remove __compiletime_object_size()
Date: Tue, 27 Jul 2021 13:58:19 -0700
Message-Id: <20210727205855.411487-29-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727205855.411487-1-keescook@chromium.org>
References: <20210727205855.411487-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2278; h=from:subject;
 bh=26+UkQF9u4QR73rE2ugmnkAtGgRJVqdRH0gVQ+miGJI=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhAHOGx79zwuZNTkBGJbxUTLtc6LvVjffViSXdghqh
 ZCh8w1mJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYQBzhgAKCRCJcvTf3G3AJoOuD/
 9QhIBj8Ac1dYCQqsKDnl8+GV1Fmwz5NE+vrrmgysyx4iAIh5Hi9gSJVcciJHuWfxsYbsfjbgYy0kX1
 fb3zQvUIkMQIB2igKikLexaw/u/aMZvCk9Z5omDCckYav5xDMDxop57SAnRwDmI5ma37g307rYAPXK
 3MKhIW4uQWUEg9VD//gprsbS2OpIiwxkghySrauZU6lUWDXOFDxi3e7AnfeRnLBMm5P9R7uYb1c63i
 CCLVixc36sEWt5n1A3nVhugbXoR7XhzcCKsn6dHqVUwhOr0WC1NiDHg09PcpuJ/iyIKZftDHqUPqg6
 5qiwdJ4fNBuagx0+hD1UYhVyC4D8uCcU5JbpSaMhqA5ruisKG07SgLC2mW64QD5KC1l5vxwssi27Ef
 7z6+Z9XE9eAIUfHNMPoPePEDUngERmhsvmWGVOt9xejvTsuIr7a0dLku55mNRDgPOr3kKzwatg+19w
 b9l9CzMUNItXijvnyBQc/Vqy1SAb0lYpmUGz8MBzs95DcaaAGbaZmpWiUWaHQ5s823F8qG3r/1SSM/
 zjI2/ycPgCzFufboCXRAyrLfLL7g8dxi7bDg8lAiPKcigIIGX0UbyaLeH8fulCViw1XPIwojOh5Gqh
 6Oqz9uM0LoNmL8ecwuaSepH7hTO/bHW05UdooSY1mofMkUQTUBDoMmiCWncw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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
Cc: linux-wireless@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 linux-kbuild@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 clang-built-linux@googlegroups.com, Keith Packard <keithpac@amazon.com>,
 netdev@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since all compilers support __builtin_object_size(), and there is only
one user of __compiletime_object_size, remove it to avoid the needless
indirection. This lets Clang reason about check_copy_size() correctly.

Link: https://github.com/ClangBuiltLinux/linux/issues/1179
Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/compiler-gcc.h   | 2 --
 include/linux/compiler_types.h | 4 ----
 include/linux/thread_info.h    | 2 +-
 3 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/include/linux/compiler-gcc.h b/include/linux/compiler-gcc.h
index cb9217fc60af..01985821944b 100644
--- a/include/linux/compiler-gcc.h
+++ b/include/linux/compiler-gcc.h
@@ -41,8 +41,6 @@
 
 #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
 
-#define __compiletime_object_size(obj) __builtin_object_size(obj, 0)
-
 #define __compiletime_warning(message) __attribute__((__warning__(message)))
 #define __compiletime_error(message) __attribute__((__error__(message)))
 
diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index e4ea86fc584d..c43308b0a9a9 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -290,10 +290,6 @@ struct ftrace_likely_data {
 	(sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
 	 sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
 
-/* Compile time object size, -1 for unknown */
-#ifndef __compiletime_object_size
-# define __compiletime_object_size(obj) -1
-#endif
 #ifndef __compiletime_warning
 # define __compiletime_warning(message)
 #endif
diff --git a/include/linux/thread_info.h b/include/linux/thread_info.h
index 0999f6317978..ad0c4e041030 100644
--- a/include/linux/thread_info.h
+++ b/include/linux/thread_info.h
@@ -203,7 +203,7 @@ static inline void copy_overflow(int size, unsigned long count)
 static __always_inline __must_check bool
 check_copy_size(const void *addr, size_t bytes, bool is_source)
 {
-	int sz = __compiletime_object_size(addr);
+	int sz = __builtin_object_size(addr, 0);
 	if (unlikely(sz >= 0 && sz < bytes)) {
 		if (!__builtin_constant_p(bytes))
 			copy_overflow(sz, bytes);
-- 
2.30.2

