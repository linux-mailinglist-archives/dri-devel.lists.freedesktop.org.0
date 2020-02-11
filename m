Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C79B158A58
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 08:26:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1CFC6EDBF;
	Tue, 11 Feb 2020 07:26:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E7089CF9;
 Tue, 11 Feb 2020 06:15:04 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id i6so8972469otr.7;
 Mon, 10 Feb 2020 22:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ovFJATVDu6V+ADjunhZvdZKdFIc/4GBOO/Os9uePfYE=;
 b=PbyDuRd+bCjjDsWIYXPfjGpOMhwlwj1boUYk7oUx4sd8wMvaphOrmwfdxQF+t2SrPS
 qZ1WtNsYHmLo0wpgRifBvJ4YNgGVS2WlYzS2dBNY9YfInjY1GoiJQwuakKh6CsbGARaW
 FzyM1oyOo8xjSuNRRJ6QVZXLxIE+dfAXYwatcaN0L5frjxHxlZmPB0tg4OjpvIqFS3WH
 46I5Ynu3GB7c2B1op2PivbxJRXVA2nzfnMBKBLZEKn4agAEKx9NvaQiBqmA5CXUvMYNN
 tewRS4Za5sOIXp9YOWFcIlkM/Yhgjs492lT3pDRPyOVUySM0lQqyNsyPbeiC6M2Bq0ml
 wzTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ovFJATVDu6V+ADjunhZvdZKdFIc/4GBOO/Os9uePfYE=;
 b=X/PxbGUwE+jV0UJfZCyYVq7M8t1q1d5qHM2fCHz1snoZft2pu4J9paixYarahsOaMq
 XKcp1u+2nUAnR/hgfDepSvHDmiJ1nSJk3ktbhl53ZQodMUfffz6NYGBHQhNxzLeBdAYe
 z0p7d+0P/ekCOrQZxrkazWcXnHhCeHczM+3gAETbSd0fpi6wlt+HkcN5aui8sGOCv3WL
 Xi3Okw2KjI/54CG647HkXHJrFiMDtRyUsNnYvS0oq/oDv05R+lPFG0/G01zxKlhu36eh
 SEddUfq3EhK9st7DaotO9BW3CxpJffAPZeb4lQIvRzaWR7OAojWBdGbal3XEv0jmYjED
 e2TQ==
X-Gm-Message-State: APjAAAUC2gwMRNbV9HUEnwBVZ5rTO0+gdu4nOuA51AaelAqVf/BRTO3w
 24z9PJGnzp9QsZ1Q2VyqoYw=
X-Google-Smtp-Source: APXvYqw6tIh0QT0u93GUbrmFqsmB/GO9LEZw1RYgpBEfmSVnsb6DSCeHR24r8sic5wRHHarUPoTgFQ==
X-Received: by 2002:a05:6830:1042:: with SMTP id
 b2mr4001160otp.306.1581401703244; 
 Mon, 10 Feb 2020 22:15:03 -0800 (PST)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id v23sm898122otj.61.2020.02.10.22.15.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2020 22:15:02 -0800 (PST)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2] drm/i915: Disable
 -Wtautological-constant-out-of-range-compare
Date: Mon, 10 Feb 2020 23:13:39 -0700
Message-Id: <20200211061338.23666-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200211050808.29463-1-natechancellor@gmail.com>
References: <20200211050808.29463-1-natechancellor@gmail.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Mailman-Approved-At: Tue, 11 Feb 2020 07:26:04 +0000
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
Cc: Nathan Chancellor <natechancellor@gmail.com>,
 clang-built-linux@googlegroups.com, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A recent commit in clang added -Wtautological-compare to -Wall, which is
enabled for i915 so we see the following warning:

../drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:1485:22: warning:
result of comparison of constant 576460752303423487 with expression of
type 'unsigned int' is always false
[-Wtautological-constant-out-of-range-compare]
        if (unlikely(remain > N_RELOC(ULONG_MAX)))
            ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~

This warning only happens on x86_64 but that check is relevant for
32-bit x86 so we cannot remove it. -Wtautological-compare on a whole has
good warnings but this one is not really relevant for the kernel because
of all of the different configurations that are used to build the
kernel. When -Wtautological-compare is enabled for the kernel, this
option will remain disabled so do that for i915 now.

Link: https://github.com/ClangBuiltLinux/linux/issues/778
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

v1 -> v2: https://lore.kernel.org/lkml/20200211050808.29463-1-natechancellor@gmail.com/

* Fix patch application due to basing on a local tree that had
  -Wuninitialized turned on. Can confirm that patch applies on
  latest -next now.

 drivers/gpu/drm/i915/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index b8c5f8934dbd..159355eb43a9 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -22,6 +22,7 @@ subdir-ccflags-y += $(call cc-disable-warning, sign-compare)
 subdir-ccflags-y += $(call cc-disable-warning, sometimes-uninitialized)
 subdir-ccflags-y += $(call cc-disable-warning, initializer-overrides)
 subdir-ccflags-y += $(call cc-disable-warning, uninitialized)
+subdir-ccflags-y += $(call cc-disable-warning, tautological-constant-out-of-range-compare)
 subdir-ccflags-$(CONFIG_DRM_I915_WERROR) += -Werror
 
 # Fine grained warnings disable
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
