Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B3F1B984A
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 09:22:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2957289518;
	Mon, 27 Apr 2020 07:21:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA62E6E062
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Apr 2020 21:42:24 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id h129so9262026ybc.3
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Apr 2020 14:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=wP3YUSwt75lpebH/kLrQdqblssHhZZ89gAzPrZ9VKZs=;
 b=fG5gI4J7oDbK8qs78tZgGY0NlRU6gceYYgCJ0eoJqEZzSts21/GsCXHGIEajLEe8RM
 Z+9O8Tz6sDXSt8WAoEYiKxexdBnP6zHgKmOIhsm65DVRHBMZq2xg5l5+gLbjJq5LnBp8
 ZZbKoyPzNKR9uBYzWNh7SdQdLQXmoOIJOOBJcHdmQM3hzWSI9UF3UMl8222Dynxu5aNq
 BvDLcDhsmONYCp10xG0z3gUKrrmFyUEixlveJEeM24MVNrN70+khd1+xqoEjiCIyw66Q
 Ovywqm+KREClud//DTN73yY25tOlNOxGVcn0VF0tHbyvwXYm5MGwVmrGH9u63vE9sQuH
 vguw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=wP3YUSwt75lpebH/kLrQdqblssHhZZ89gAzPrZ9VKZs=;
 b=oIGSSJngigTdgjRzWRe47awNrGJ/TxntIWi/BOd+7xRWGRAvn6U21tFx2N0tWuFiH8
 9gVUmy6e1j5E0BoN5YRQIRal0R3u4tlMcn6aBIBwp7FwJAGnM1RJ8TJXbpMuua/sfuoE
 hvkrYWF5C2Lj9d6UAB6mE8nAihFc4VswFI8IubgyY0ywwQZhulNI03gXjdhEOKKEV02c
 B+PuriJiSDeS2Um40POk3v3qIebgZa5jLGE5Nri5VO4yqV19fEb95zL83gywMnwhABQA
 aj1IQCVRu0bm0XXuWuIOjvsNBAJI3iQUZzTXSoK93/FyGUusybghDqAiiG3pztxtbBVi
 AokQ==
X-Gm-Message-State: AGi0PubBPirj0u96lraJGre0D+ljCFkQXSHunHRRJK/Gv7lZQ4kNsa3v
 bt7KUF6LlVpektxg+Uy+kQ61xiyxhnRuNzvJ3rQ=
X-Google-Smtp-Source: APiQypKkUtSeaiUIVHxuzqmehWg/q5NMUry/6HHvoHkGlurMd144EQeQWrgree6KD13oOGVZbT0VX40GqJ1gqaig0cQ=
X-Received: by 2002:a25:bbd0:: with SMTP id c16mr31683706ybk.296.1587937343841; 
 Sun, 26 Apr 2020 14:42:23 -0700 (PDT)
Date: Sun, 26 Apr 2020 14:42:15 -0700
Message-Id: <20200426214215.139435-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
Subject: [PATCH] drm/i915: re-disable -Wframe-address
From: Nick Desaulniers <ndesaulniers@google.com>
To: jani.nikula@linux.intel.com, airlied@linux.ie, daniel@ffwll.ch
X-Mailman-Approved-At: Mon, 27 Apr 2020 07:21:44 +0000
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
Cc: intel-gfx@lists.freedesktop.org, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 clang-built-linux@googlegroups.com, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The top level Makefile disables this warning. When building an
i386_defconfig with Clang, this warning is triggered a whole bunch via
includes of headers from perf.

Link: https://github.com/ClangBuiltLinux/continuous-integration/pull/182
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 drivers/gpu/drm/i915/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 6f112d8f80ca..8c2257437471 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -22,6 +22,7 @@ subdir-ccflags-y += $(call cc-disable-warning, sign-compare)
 subdir-ccflags-y += $(call cc-disable-warning, sometimes-uninitialized)
 subdir-ccflags-y += $(call cc-disable-warning, initializer-overrides)
 subdir-ccflags-y += $(call cc-disable-warning, uninitialized)
+subdir-ccflags-y += $(call cc-disable-warning, frame-address)
 subdir-ccflags-$(CONFIG_DRM_I915_WERROR) += -Werror
 
 # Fine grained warnings disable
-- 
2.26.2.303.gf8c07b1a785-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
