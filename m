Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C59995A85F3
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 20:44:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 970CE10E424;
	Wed, 31 Aug 2022 18:44:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A6710E4E9
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Aug 2022 18:44:20 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id
 v8-20020a258488000000b00695847496a4so2772553ybk.19
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Aug 2022 11:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc;
 bh=jeIDU7bkvi8qrUeCQKjSgf4R1NQDEDk5WzvSWsZHRgY=;
 b=hx1WadVFGfM2WHW+QMiqbRpB+tGtox/ZvfK2iSj6s7TWGpw2+YfDNLd71aeLJikF5A
 ut7591nG+1XtZZnWDLGHqvw7JJwxJ0XUqThW+DOuVmXx5U3HEA3SXJbmTWIaXpZ2woGZ
 RTEaI3LgVK8uilz+J1vZWsPlPY0651QNaHnpsTlpgvFMVxMQjssruP9r+aB90KHTVpR/
 SrpgK6Xxyza7FDY2erOi2mdc5Qq7aDYAg+yKZnkJsavJ/Dfs+V/FjohIVlEbMIrrrnc8
 VTZr1169mV2GmgrWFZhOXY+DTyvlyMMDWkpUhba503fcTfGVw+anr6JRNo1wjKRsiWNd
 VysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc;
 bh=jeIDU7bkvi8qrUeCQKjSgf4R1NQDEDk5WzvSWsZHRgY=;
 b=AA/yq7Z+B1BlaFJovIopOa/hq7APa+vSb+S4DZtqlA3O/bAZe+DkXv3HqbOEWLZljd
 w/9yEw8m0a2dJMtTyBuf+G9Igr+E1Avlb2+oAPtNvqmqiVXKVy9ogNMmVTG2elz9LyQv
 GAUBnw0+fOOd9oJpLMSGvhLQ8L+gOHMqa2MKYtE0f55uWLS54zHm/DnJ4fzO13DIn/13
 6rx/e40yC+oaW1lu371uE/AW/3F/kNPSy1JXqteX6xg50f5v2EvH1WMXP08xgifkNswh
 IlbPZ3EORWvirmK6xMSb0UpYeX/g72H9AQ0pm49uuw2KGMuXl2bd+srdgWnsa7QXgpTM
 VuJQ==
X-Gm-Message-State: ACgBeo3613BBHxozELBGCenyhvr6q/jIR1RSeseRuuYtKmRln7SQVIjZ
 Q6TmZ6f51EmOVupxFeNR2WvK0JzqtD9qR4j8UC0=
X-Google-Smtp-Source: AA6agR7Ag1fKKG3WlrfE60Hng53gw5R2d8mq+Pf+nJEkCn34r/4b9t9bbknLWL4Dz5mBS6VyDJJaVwKf1/TD3gZm/D4=
X-Received: from ndesaulniers1.mtv.corp.google.com
 ([2620:0:100e:712:5f5d:95d5:9a3:d41])
 (user=ndesaulniers job=sendgmr) by 2002:a25:7608:0:b0:694:220b:8bf6 with SMTP
 id r8-20020a257608000000b00694220b8bf6mr16732077ybc.210.1661971460048; Wed,
 31 Aug 2022 11:44:20 -0700 (PDT)
Date: Wed, 31 Aug 2022 11:44:06 -0700
In-Reply-To: <20220831184408.2778264-1-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20220831184408.2778264-1-ndesaulniers@google.com>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519;
 pk=lvO/pmg+aaCb6dPhyGC1GyOCvPueDrrc8Zeso5CaGKE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1661971448; l=6313;
 i=ndesaulniers@google.com; s=20211004; h=from:subject;
 bh=4nrhFDfzIr6P2uEi5X9UGCfe5n7Png+PEC4jrJ9T2hY=; 
 b=Asevhm76deGOJCh2wzvhWYmHcNqfB9w30KRQRslJFMSwOMNo1qdlvq1fib/n0CQt0uFs4EHOV7W4
 zd9FYCZZAcwt9VhTRml2m/KTX3mSvtSLn8veXUGEL29ZkuqxycP8
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220831184408.2778264-4-ndesaulniers@google.com>
Subject: [PATCH v2 3/5] Makefile.compiler: replace cc-ifversion with
 compiler-specific macros
From: Nick Desaulniers <ndesaulniers@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: dri-devel@lists.freedesktop.org, x86@kernel.org,
 Michal Marek <michal.lkml@markovi.net>, linux-doc@vger.kernel.org,
 Fangrui Song <maskray@google.com>, linux-kbuild@vger.kernel.org,
 Tom Rix <trix@redhat.com>, Dmitrii Bundin <dmitrii.bundin.a@gmail.com>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>,
 Greg Thelen <gthelen@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Alexey Alexandrov <aalexand@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

cc-ifversion is GCC specific. Replace it with compiler specific
variants. Update the users of cc-ifversion to use these new macros.
Provide a helper for checking compiler versions for GCC and Clang
simultaneously, that will be used in a follow up patch.

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Link: https://github.com/ClangBuiltLinux/linux/issues/350
Link: https://lore.kernel.org/llvm/CAGG=3QWSAUakO42kubrCap8fp-gm1ERJJAYXTnP1iHk_wrH=BQ@mail.gmail.com/
Suggested-by: Bill Wendling <morbo@google.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes v1 -> v2:
* New patch.

 Documentation/kbuild/makefiles.rst          | 44 +++++++++++++++------
 Makefile                                    |  4 +-
 drivers/gpu/drm/amd/display/dc/dml/Makefile | 12 ++----
 scripts/Makefile.compiler                   | 15 +++++--
 4 files changed, 49 insertions(+), 26 deletions(-)

diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index 11a296e52d68..e46f5b45c422 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -682,22 +682,42 @@ more details, with real examples.
 	In the above example, -Wno-unused-but-set-variable will be added to
 	KBUILD_CFLAGS only if gcc really accepts it.
 
-    cc-ifversion
-	cc-ifversion tests the version of $(CC) and equals the fourth parameter
-	if version expression is true, or the fifth (if given) if the version
-	expression is false.
+    gcc-min-version
+	gcc-min-version tests if the value of $(CONFIG_GCC_VERSION) is greater than
+	or equal to the provided value and evaluates to y if so.
 
 	Example::
 
-		#fs/reiserfs/Makefile
-		ccflags-y := $(call cc-ifversion, -lt, 0402, -O1)
+		cflags-$(call gcc-min-version, 70100) := -foo
 
-	In this example, ccflags-y will be assigned the value -O1 if the
-	$(CC) version is less than 4.2.
-	cc-ifversion takes all the shell operators:
-	-eq, -ne, -lt, -le, -gt, and -ge
-	The third parameter may be a text as in this example, but it may also
-	be an expanded variable or a macro.
+	In this example, cflags-y will be assigned the value -foo if $(CC) is gcc and
+	$(CONFIG_GCC_VERSION) is >= 7.1.
+
+    clang-min-version
+	clang-min-version tests if the value of $(CONFIG_CLANG_VERSION) is greater
+	than or equal to the provided value and evaluates to y if so.
+
+	Example::
+
+		cflags-$(call clang-min-version, 110000) := -foo
+
+	In this example, cflags-y will be assigned the value -foo if $(CC) is clang
+	and $(CONFIG_CLANG_VERSION) is >= 11.0.0.
+
+    cc-min-version
+	cc-min-version tests if the value of $(CONFIG_GCC_VERSION) is greater
+	than or equal to the first value provided, or if the value of
+	$(CONFIG_CLANG_VERSION) is greater than or equal to the second value
+	provided, and evaluates
+	to y if so.
+
+	Example::
+
+		cflags-$(call cc-min-version, 70100, 110000) := -foo
+
+	In this example, cflags-y will be assigned the value -foo if $(CC) is gcc and
+	$(CONFIG_GCC_VERSION) is >= 7.1, or if $(CC) is clang and
+	$(CONFIG_CLANG_VERSION) is >= 11.0.0.
 
     cc-cross-prefix
 	cc-cross-prefix is used to check if there exists a $(CC) in path with
diff --git a/Makefile b/Makefile
index 952d354069a4..caa39ecb1136 100644
--- a/Makefile
+++ b/Makefile
@@ -972,7 +972,7 @@ ifdef CONFIG_CC_IS_GCC
 KBUILD_CFLAGS += -Wno-maybe-uninitialized
 endif
 
-ifdef CONFIG_CC_IS_GCC
+ifeq ($(call gcc-min-version, 90100),y)
 # The allocators already balk at large sizes, so silence the compiler
 # warnings for bounds checks involving those possible values. While
 # -Wno-alloc-size-larger-than would normally be used here, earlier versions
@@ -984,7 +984,7 @@ ifdef CONFIG_CC_IS_GCC
 # ignored, continuing to default to PTRDIFF_MAX. So, left with no other
 # choice, we must perform a versioned check to disable this warning.
 # https://lore.kernel.org/lkml/20210824115859.187f272f@canb.auug.org.au
-KBUILD_CFLAGS += $(call cc-ifversion, -ge, 0901, -Wno-alloc-size-larger-than)
+KBUILD_CFLAGS += -Wno-alloc-size-larger-than
 endif
 
 # disable invalid "can't wrap" optimizations for signed / pointers
diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
index 86a3b5bfd699..d8ee4743b2e3 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
@@ -33,20 +33,14 @@ ifdef CONFIG_PPC64
 dml_ccflags := -mhard-float -maltivec
 endif
 
-ifdef CONFIG_CC_IS_GCC
-ifeq ($(call cc-ifversion, -lt, 0701, y), y)
-IS_OLD_GCC = 1
-endif
-endif
-
 ifdef CONFIG_X86
-ifdef IS_OLD_GCC
+ifeq ($(call gcc-min-version, 70100),y)
+dml_ccflags += -msse2
+else
 # Stack alignment mismatch, proceed with caution.
 # GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-boundary=3
 # (8B stack alignment).
 dml_ccflags += -mpreferred-stack-boundary=4
-else
-dml_ccflags += -msse2
 endif
 endif
 
diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
index d1739f0d3ce3..13dade724fa3 100644
--- a/scripts/Makefile.compiler
+++ b/scripts/Makefile.compiler
@@ -61,9 +61,18 @@ cc-option-yn = $(call try-run,\
 cc-disable-warning = $(call try-run,\
 	$(CC) -Werror $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) -W$(strip $(1)) -c -x c /dev/null -o "$$TMP",-Wno-$(strip $(1)))
 
-# cc-ifversion
-# Usage:  EXTRA_CFLAGS += $(call cc-ifversion, -lt, 0402, -O1)
-cc-ifversion = $(shell [ $(CONFIG_GCC_VERSION)0 $(1) $(2)000 ] && echo $(3) || echo $(4))
+# gcc-min-version
+# Usage: cflags-$(call gcc-min-version, 70100) += -foo
+gcc-min-version = $(shell [ $(CONFIG_GCC_VERSION) -ge $(1) ] && echo y)
+
+# clang-min-version
+# Usage: cflags-$(call clang-min-version, 110000) += -foo
+clang-min-version = $(shell [ $(CONFIG_CLANG_VERSION) -ge $(1) ] && echo y)
+
+# cc-min-version
+# Usage: cflags-$(call cc-min-version, 701000, 110000)
+#                                      ^ GCC   ^ Clang
+cc-min-version = $(filter y, $(call gcc-min-version, $(1)), $(call clang-min-version, $(2)))
 
 # ld-option
 # Usage: KBUILD_LDFLAGS += $(call ld-option, -X, -Y)
-- 
2.37.2.672.g94769d06f0-goog

