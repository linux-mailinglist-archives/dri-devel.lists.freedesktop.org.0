Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9483C96D831
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 14:20:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3472610E881;
	Thu,  5 Sep 2024 12:20:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SowfaliC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D38710E877;
 Thu,  5 Sep 2024 12:20:30 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-42c94e59b93so10324675e9.1; 
 Thu, 05 Sep 2024 05:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725538829; x=1726143629; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iD7NTe7bgmL4j+ZOUWe6Vz/irb7OPA4CTAynHWYcSvE=;
 b=SowfaliC2MfMuxp0NkhOE+F6aP+TKwSFcbyGFEDDZHm3IWu8SqgoXU+HXnYGOjI6p0
 yOiYi3MOnUDidmZuo9tVGNT0KHP+JkzxKtNetanlJnM9QWAxjRLMcnd0ZBhpJ1+f0vCu
 HWHyU3pqNVEfLHETOxjXHDLN+ZMgmcBZfQVuGIIfd5dtkdjjLDxNkSPUKY8TKToowzVo
 UnJEwfJpx65v2ilMGgBmc78N8lkrJocc3GTtBEktVZQYUZhCaqTWVpdCmWLBfdhkqGCY
 98xyy542uzQUZziR1Yd95tUxfbshNLdu7I7jMXDoZygCBT36EetLzBoq7qmaaJbMjtos
 0Elw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725538829; x=1726143629;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iD7NTe7bgmL4j+ZOUWe6Vz/irb7OPA4CTAynHWYcSvE=;
 b=D2UixaVsXezn79iTuvyt9rPlit7+0bi+5xp0QqDrfJbQzrxlfD3XihK8BcMrvckr7e
 17m+J0HlontXBfWH1BrrgzpiU/6WB0XRozj9dg1t55q/dLvFSPYb6sB+vBL3CB9U0e/7
 nR9qv2ctvfNrq0NAAirsqCbWrClY+CMDcXIqetqdZHRzceKFerqULQh9g0RbCRKho/2/
 Ij0+Q9RVkPKkxFzguVgOC9yPkwHgkdnfibZeHQrQfg6wUut048VGSgSFL5szpibWiRqi
 a7OlXUp6jSGcmC6KCWOOVXD35+HBNZXpAgJzFKO7YxL8r8nghIDOr8eOzGu0z8FPw0xN
 LJzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSSzhXSasoJyyYkrjjJjPPw7UEVwdFBRcmBZ786Idq6jPB05xO4GABzYbTKvzgGHNlFlSQbqSjWy99@lists.freedesktop.org,
 AJvYcCXkS1D2ltNFK00Qh620a/FZNzE/LsBDhGrVN53LcjQsne52reCCB8WPeGzQXYMNTWuJI0tdnlT/atM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzpf9sGxR3TK+NO+8na0hB7/WbO8Y41lIH0tGbNzKGi02egYq52
 eQyknTdm57l9O64KiazVopyQb53AzgYOxKDTnuoHLSPeXAe+40+i
X-Google-Smtp-Source: AGHT+IHa0fVf6EKsDAw+gxmmQXJ6NX7kn1nNvzKP1vs+nY3qqO/a3JqoKC8nQD5litjqwafLqGt1BQ==
X-Received: by 2002:a5d:464a:0:b0:374:bf6b:1021 with SMTP id
 ffacd0b85a97d-3779bd1864fmr3502807f8f.27.1725538828407; 
 Thu, 05 Sep 2024 05:20:28 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6e27364sm230390515e9.34.2024.09.05.05.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 05:20:27 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 02/18] drm/i915/selftests: Include <linux/prandom.h> instead
 of <linux/random.h>
Date: Thu,  5 Sep 2024 14:17:10 +0200
Message-ID: <20240905122020.872466-3-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240905122020.872466-1-ubizjak@gmail.com>
References: <20240905122020.872466-1-ubizjak@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Usage of pseudo-random functions requires inclusion of
<linux/prandom.h> header instead of <linux/random.h>.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/i915/selftests/i915_gem.c    | 2 +-
 drivers/gpu/drm/i915/selftests/i915_random.h | 2 +-
 drivers/gpu/drm/i915/selftests/scatterlist.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_gem.c b/drivers/gpu/drm/i915/selftests/i915_gem.c
index 61da4ed9d521..0727492576be 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem.c
@@ -4,7 +4,7 @@
  * Copyright © 2018 Intel Corporation
  */
 
-#include <linux/random.h>
+#include <linux/prandom.h>
 
 #include "gem/i915_gem_internal.h"
 #include "gem/i915_gem_pm.h"
diff --git a/drivers/gpu/drm/i915/selftests/i915_random.h b/drivers/gpu/drm/i915/selftests/i915_random.h
index 05364eca20f7..70330a2e80f2 100644
--- a/drivers/gpu/drm/i915/selftests/i915_random.h
+++ b/drivers/gpu/drm/i915/selftests/i915_random.h
@@ -26,7 +26,7 @@
 #define __I915_SELFTESTS_RANDOM_H__
 
 #include <linux/math64.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
 
 #include "../i915_selftest.h"
 
diff --git a/drivers/gpu/drm/i915/selftests/scatterlist.c b/drivers/gpu/drm/i915/selftests/scatterlist.c
index 805c4bfb85fe..7e59591bbed6 100644
--- a/drivers/gpu/drm/i915/selftests/scatterlist.c
+++ b/drivers/gpu/drm/i915/selftests/scatterlist.c
@@ -22,7 +22,7 @@
  */
 
 #include <linux/prime_numbers.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
 
 #include "i915_selftest.h"
 #include "i915_utils.h"
-- 
2.46.0

