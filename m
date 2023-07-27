Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EF7765FE0
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 00:47:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3482D10E62C;
	Thu, 27 Jul 2023 22:47:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [IPv6:2607:f8b0:4864:20::114a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B393A10E62C
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 22:47:14 +0000 (UTC)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-5847479b559so7483807b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 15:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1690498034; x=1691102834;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=h8M17W+SY6LNnIrBQCPmXoDqQ4N8XZNCU3T7YHTRw88=;
 b=qKt37uGq/wscmlYr8MsZg//pXb6RySyaO4y6NJeuPda08KKiBjtJBS67P14T6qV1M0
 LL9mjLjQYaJiLnSUF4EWtgT2q06OnX5y+YpaxLHO6f+6a3EIbFNrTc+7RB4U+ZiuyvVa
 wVuGmAuWeRbHjs/5JgVP2QOlnsY5lyobE6B9bss/BiV7uNJCKRAb8KCsQodxtcNumAeV
 tfOwogzv3MOn84SrebCIma7DNohFZJb5l213YxgBfudwFCoGEAXHH/L6snpDUdyijney
 6+Vc/w4tJvqI9+iRC6+Sw/3tZ8W5zMhUWDBE49fQTskT0ezoLHQgsg5p62+Ls2Lm9eBP
 fV9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690498034; x=1691102834;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=h8M17W+SY6LNnIrBQCPmXoDqQ4N8XZNCU3T7YHTRw88=;
 b=Oq4NfbKarVVOEkwnu27YjLyiWrpwy7DOtvuYImOSlqjBPZkfPJXvOUMDJfuWzIbwNk
 U5suV18uYyb7aei5fE3MeqaTMFeVaxTLZyxScW1XOaU/bg3qkJvcUWVDYMMLhlo5irx3
 ef97QgWLymKrW4EepLSpJTuvVHxSDeeL5vFHNYADoJQg5Idgc6dVMBNDoiKPm4VauDOX
 SlvqzQzXA+GQnQEKnqbLr7OLb+ano0Hlzb5heo4jweL4ouhmZeA0jxsaUZ1BxKPlqPq8
 iZzuZhU58TxcyCBj9lkDcZxxxFeH8fpMMzj8aG5XC3hVzaEdca5fo4RKkuotEs879X3E
 ifMg==
X-Gm-Message-State: ABy/qLZ5QJvFYPUbHJpglkDqXNY/Ah8tL51+hsh1lM0LmkSp3CDgI0fp
 KWUFXhYKnyOecy3ECL0MA9h//5auLy9dX45CGkM=
X-Google-Smtp-Source: APBJJlFGnVWRLJUkrTVrUmig5mpkfOptKBJYmMCfyEC709K8nbUaHxXMj+WKdKG5zBlRCFhHoXkA4S2rhsmnF/EMJIQ=
X-Received: from ndesaulniers-desktop.svl.corp.google.com
 ([2620:15c:2d1:203:659f:4728:cfbb:8cc3])
 (user=ndesaulniers job=sendgmr) by 2002:a05:690c:721:b0:573:8316:8d04 with
 SMTP id bt1-20020a05690c072100b0057383168d04mr212ywb.4.1690498033839; Thu, 27
 Jul 2023 15:47:13 -0700 (PDT)
Date: Thu, 27 Jul 2023 15:47:09 -0700
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOzzwmQC/x2MQQqAIBAAvxJ7TjAlwr4SHdS2XCgLpQjEv7d0n
 GGYAhkTYYaxKZDwoUxnZOjaBnywcUNBCzMoqbQc1CDssWzXLYz2Enstlek74NjZjMIlG33gPN7
 7zvJKuNL736e51g9FP1hgbQAAAA==
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519;
 pk=UIrHvErwpgNbhCkRZAYSX0CFd/XFEwqX3D0xqtqjNug=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690498032; l=3429;
 i=ndesaulniers@google.com; s=20220923; h=from:subject:message-id;
 bh=h5xjymXwHB0lf01RIpHtYLR4vTj4v+sUfx87gYKkB7Y=;
 b=N2uJPCF50jFFN4PLKe1RA7MLTy5RlIkmUWI7lMBscLyrcTCLI3tbqj7jsQDczYGb8rXqmc7m4
 fVVfKltnA+lByM/BerwonDXLZydewq7ck6QpVuol9QtpGTy2Znh+q3q
X-Mailer: b4 0.12.2
Message-ID: <20230727-amdgpu-v1-1-a95690e75388@google.com>
Subject: [PATCH] drm: fix indirect goto into statement expression UB
From: ndesaulniers@google.com
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>
Content-Type: text/plain; charset="utf-8"
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
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A new diagnostic in clang-17 now produces the following build error:

drivers/gpu/drm/tests/drm_exec_test.c:41:3: error: cannot jump from this
indirect goto statement to one of its possible targets
   41 |                 drm_exec_retry_on_contention(&exec);
      |                 ^
include/drm/drm_exec.h:96:4: note: expanded from macro
'drm_exec_retry_on_contention'
   96 |                         goto *__drm_exec_retry_ptr;
      |                         ^
drivers/gpu/drm/tests/drm_exec_test.c:39:2: note: possible target of
indirect goto statement
   39 |         drm_exec_until_all_locked(&exec) {
      |         ^
include/drm/drm_exec.h:79:33: note: expanded from macro
'drm_exec_until_all_locked'
   79 |                 __label__ __drm_exec_retry;
drivers/gpu/drm/tests/drm_exec_test.c:39:2: note: jump enters a
statement expression

The GCC manually currently states that:
>> Jumping into a statement expression with a computed goto (see Labels
>> as Values) has undefined behavior.

So the diagnostic appears correct, even if codegen happened to produce
working code.

Looking closer at this code, while the original combination of statement
expression, local label, and computed/indirect goto GNU C expressions
were clever, a simple while loop and continue block might have sufficed.

This approach might not work as expected if drm_exec_until_all_locked
"loops" can be nested, but that doesn't appear to be an existing use
case in the codebase.

Fixes: commit 09593216bff1 ("drm: execution context for GEM buffers v7")
Link: https://gcc.gnu.org/onlinedocs/gcc/Statement-Exprs.html
Link: https://github.com/ClangBuiltLinux/linux/issues/1890
Link: https://github.com/llvm/llvm-project/commit/20219106060208f0c2f5d096eb3aed7b712f5067
Reported-by: Nathan Chancellor <nathan@kernel.org>
Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 include/drm/drm_exec.h | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
index 73205afec162..393ac022ed3a 100644
--- a/include/drm/drm_exec.h
+++ b/include/drm/drm_exec.h
@@ -70,18 +70,9 @@ struct drm_exec {
  * Core functionality of the drm_exec object. Loops until all GEM objects are
  * locked and no more contention exists. At the beginning of the loop it is
  * guaranteed that no GEM object is locked.
- *
- * Since labels can't be defined local to the loops body we use a jump pointer
- * to make sure that the retry is only used from within the loops body.
  */
 #define drm_exec_until_all_locked(exec)				\
-	for (void *__drm_exec_retry_ptr; ({			\
-		__label__ __drm_exec_retry;			\
-__drm_exec_retry:						\
-		__drm_exec_retry_ptr = &&__drm_exec_retry;	\
-		(void)__drm_exec_retry_ptr;			\
-		drm_exec_cleanup(exec);				\
-	});)
+	while(drm_exec_cleanup(exec))
 
 /**
  * drm_exec_retry_on_contention - restart the loop to grap all locks
@@ -93,7 +84,7 @@ __drm_exec_retry:						\
 #define drm_exec_retry_on_contention(exec)			\
 	do {							\
 		if (unlikely(drm_exec_is_contended(exec)))	\
-			goto *__drm_exec_retry_ptr;		\
+			continue;				\
 	} while (0)
 
 /**

---
base-commit: 451cc82bd11eb6a374f4dbcfc1cf007eafea91ab
change-id: 20230727-amdgpu-93c0e5302951

Best regards,
-- 
Nick Desaulniers <ndesaulniers@google.com>

