Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDCA158A5A
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 08:26:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE0C06EDC2;
	Tue, 11 Feb 2020 07:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A1556E2B2;
 Tue, 11 Feb 2020 05:08:35 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id b18so8909306otp.0;
 Mon, 10 Feb 2020 21:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PzVeAyFZDO+woAn09FRMNrkoa0zSne0dLCKhCXRtKF4=;
 b=q19RtMc0tzaSrg/nVN9T+kDTIgE8GoGHNomGjMNGenUlgmowB17Sqh3zey54f8gwwm
 BR4NEdvdNkRA2Bt8im+h0tZV4M0sHqG14O8zHW8GXGcY92EGJPUwcoRKNQT+o8GOviIq
 vSQXanqPppwaTlPZXXu5SEGn0NtNXBd8lw6KA9PnfTiDeQbt/jgLtEfkoQJjF8NWBhUi
 qhW6ZBmXY3R4d2N2H+odyUXA49/16Rp7mZZVYqyMLKBYZaORunQcif9aVgEHiihUbOYV
 co150RBv41MIHzSY/ynkVRopA+Dxyr5mWI/fMf+GbykRcpD+ZWO2oE5EIWQKAq927rNS
 fWiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PzVeAyFZDO+woAn09FRMNrkoa0zSne0dLCKhCXRtKF4=;
 b=fam5O6P0aX0Z5afjqHnkleEUkGSAc7nV79mwhp6L5Xn3gqXzcNFZIX+5jjeLhm0Ms5
 vLFNdZcY5/kjbPlVfCMYc4Psfb5GrG2ZjDxUifplQQfyoOKJMGrfk+hhnxbCMKmMBx1N
 MnFATIPfoijTnKYyIZ8etlXiLfkPHRUqel6Qp3bCwN9saM/8obbmtUF7x6M2xfWn5+lg
 TOMnWNdIfHVha+D2TLJFpIAklF8I7uxJ5RFDMuUnQmY2OmeHccdiaQnzmWlfJcw7OTK4
 qW6UKgP7/f6Dcf3qXokkZsxpj5cApeoSJQiw029X+6mkGJRVFliO6qc4acDf09QMhbUJ
 HecA==
X-Gm-Message-State: APjAAAXnwertwLHvyyGKbdGcUZmLBxeeeLntmmsiJlfu7I4PazPYaM5n
 h39s1vF/eARzatvKrMXBJVA=
X-Google-Smtp-Source: APXvYqxlNclpViNWlqwt0+vIhDKhok/SwQafMKa1noHdmqFLH9wDIUn22rZ/pJ6WKGHUhsnqLaXwGg==
X-Received: by 2002:a05:6830:1e37:: with SMTP id
 t23mr3936686otr.16.1581397714034; 
 Mon, 10 Feb 2020 21:08:34 -0800 (PST)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id d11sm862015otl.31.2020.02.10.21.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2020 21:08:33 -0800 (PST)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/i915: Disable -Wtautological-constant-out-of-range-compare
Date: Mon, 10 Feb 2020 22:08:08 -0700
Message-Id: <20200211050808.29463-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.25.0
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
 drivers/gpu/drm/i915/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 38df01c23176..55dbcca179c7 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -21,6 +21,7 @@ subdir-ccflags-y += $(call cc-disable-warning, unused-but-set-variable)
 subdir-ccflags-y += $(call cc-disable-warning, sign-compare)
 subdir-ccflags-y += $(call cc-disable-warning, sometimes-uninitialized)
 subdir-ccflags-y += $(call cc-disable-warning, initializer-overrides)
+subdir-ccflags-y += $(call cc-disable-warning, tautological-constant-out-of-range-compare)
 subdir-ccflags-$(CONFIG_DRM_I915_WERROR) += -Werror
 
 # Fine grained warnings disable
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
