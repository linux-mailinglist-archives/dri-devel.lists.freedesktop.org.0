Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCA31EFAA0
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 16:20:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E83D6E90C;
	Fri,  5 Jun 2020 14:19:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 779346E90B
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 14:19:55 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id 185so5170239pgb.10
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jun 2020 07:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=I/KKVhuE8TSr5CEPiD/eAOjx+oGBg92j9fEZOcTd8zg=;
 b=jarSB6Qs7gLwZLwAII57y/JKWmy3ExqgUg4+qPkwLvqLeaEWf1Kixa0LjlOiCp5DkE
 iCWhitxnz+om4kZ6TOMl20AvHbhxvPjnM3uoi2UXR9fkMS25nSr4jQnu8W7AZGeI6Rdr
 TdVp/eUHb7jMMzX2WNXMl1/zWXVpFdErX2PJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=I/KKVhuE8TSr5CEPiD/eAOjx+oGBg92j9fEZOcTd8zg=;
 b=TJPSqf/vCh7+OOxtRLliqPKyqGMX8I9A1wVayacfUf2yM2TjByEuANe6SWyjN0pswC
 XTHMH3XYVwr+5MymRNhNphUo58HwgT8jYHrkpNnOab7MMvFXR7X53VX9wizlZ1McY/AN
 OLNylcq0E5bGuv5EnTlfQckKYyaAMXGBvh6prNQHYO2bOnc6jNe337gGxQLHPjPM1GdF
 qrLOPJKbsH4sYZr5le4Lat9rCeCHXgt3JiE+QZyJ1xSRwvgUjL2+YKC5K4eGHHrVZa+s
 FClKtRKpBOK/PAn8cTKQCTs3l1YvgnoAccpKp0A4Co6VcSZh/THpHqm8bofOteJ9jA3i
 LNLg==
X-Gm-Message-State: AOAM530GiUys7FcFGpYI1TWPzCVMkxfMLB+AqhSLApYkOoG37XvdOcjH
 2MrNmUWjA9CtSdGRC50VsYMYmw==
X-Google-Smtp-Source: ABdhPJz7HFAhlb37GBve0BZLBLu80nmLbK9xyenwxebfEX6BJX1qGBnd3RV1CVMHJdneQ+1UKXbDhw==
X-Received: by 2002:a63:f854:: with SMTP id v20mr10018864pgj.0.1591366794973; 
 Fri, 05 Jun 2020 07:19:54 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id x11sm7568429pfm.196.2020.06.05.07.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2020 07:19:54 -0700 (PDT)
Date: Fri, 5 Jun 2020 07:19:53 -0700
From: Kees Cook <keescook@chromium.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/i915: Fix comments mentioning typo in IS_ENABLED()
Message-ID: <202006050718.9D4FCFC2E@keescook>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This has no code changes, but the typo is clearly getting copy/pasted,
so better to avoid this now and fix the typo. IS_ENABLED() takes full
names, and must have the "CONFIG_" prefix.

Reported-by: Joe Perches <joe@perches.com>
Link: https://lore.kernel.org/lkml/b08611018fdb6d88757c6008a5c02fa0e07b32fb.camel@perches.com
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/dma-buf/selftests.h                          | 2 +-
 drivers/gpu/drm/i915/selftests/i915_live_selftests.h | 2 +-
 drivers/gpu/drm/i915/selftests/i915_mock_selftests.h | 2 +-
 drivers/gpu/drm/i915/selftests/i915_perf_selftests.h | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/selftests.h b/drivers/dma-buf/selftests.h
index 55918ef9adab..bc8cea67bf1e 100644
--- a/drivers/dma-buf/selftests.h
+++ b/drivers/dma-buf/selftests.h
@@ -5,7 +5,7 @@
  * a module parameter. It must be unique and legal for a C identifier.
  *
  * The function should be of type int function(void). It may be conditionally
- * compiled using #if IS_ENABLED(DRM_I915_SELFTEST).
+ * compiled using #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST).
  *
  * Tests are executed in order by igt/dmabuf_selftest
  */
diff --git a/drivers/gpu/drm/i915/selftests/i915_live_selftests.h b/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
index 5dd5d81646c4..e42ea9c6703b 100644
--- a/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
+++ b/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
@@ -11,7 +11,7 @@
  * a module parameter. It must be unique and legal for a C identifier.
  *
  * The function should be of type int function(void). It may be conditionally
- * compiled using #if IS_ENABLED(DRM_I915_SELFTEST).
+ * compiled using #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST).
  *
  * Tests are executed in order by igt/drv_selftest
  */
diff --git a/drivers/gpu/drm/i915/selftests/i915_mock_selftests.h b/drivers/gpu/drm/i915/selftests/i915_mock_selftests.h
index 6a2be7d0dd95..4be044198af9 100644
--- a/drivers/gpu/drm/i915/selftests/i915_mock_selftests.h
+++ b/drivers/gpu/drm/i915/selftests/i915_mock_selftests.h
@@ -11,7 +11,7 @@
  * a module parameter. It must be unique and legal for a C identifier.
  *
  * The function should be of type int function(void). It may be conditionally
- * compiled using #if IS_ENABLED(DRM_I915_SELFTEST).
+ * compiled using #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST).
  *
  * Tests are executed in order by igt/drv_selftest
  */
diff --git a/drivers/gpu/drm/i915/selftests/i915_perf_selftests.h b/drivers/gpu/drm/i915/selftests/i915_perf_selftests.h
index d8da142985eb..c2389f8a257d 100644
--- a/drivers/gpu/drm/i915/selftests/i915_perf_selftests.h
+++ b/drivers/gpu/drm/i915/selftests/i915_perf_selftests.h
@@ -11,7 +11,7 @@
  * a module parameter. It must be unique and legal for a C identifier.
  *
  * The function should be of type int function(void). It may be conditionally
- * compiled using #if IS_ENABLED(DRM_I915_SELFTEST).
+ * compiled using #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST).
  *
  * Tests are executed in order by igt/i915_selftest
  */
-- 
2.25.1


-- 
Kees Cook
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
