Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EC098A2A8
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 14:37:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB8B10E021;
	Mon, 30 Sep 2024 12:37:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="T2UCYPZJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E997F10E43C;
 Mon, 30 Sep 2024 12:37:14 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-42cb5b3c57eso39444395e9.2; 
 Mon, 30 Sep 2024 05:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727699833; x=1728304633; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RWdhzc84IUX3iZRvSVXhcMocJl1l3V+3RFdCYOgUVyI=;
 b=T2UCYPZJ/mqQInYdnAGQVPgGT4Z8kolMPYjDBbuwoOxXxwGizdW/cDO4RbTl9s1Ek3
 1dRCXTsxya9kECusUDG/KtGKM9cWcQjACZ7dYobrjtno30kDcJ4Gics/mKOcPuFSDjuP
 ojM0v7MPiPzleAS4XZPAM7hUEyXcmvtYKB2uPe77J8QIyAD58CK8XxNwveadIRoSll5W
 Rf9Lozcp3idZHoqyYabLEjMy7hkwEyBPUiFGdKiefBFs0kjDa/dfZs9dFtpc3mwmK7BD
 tc0rw+xymcYrF0lAndPxVgy8Izb2Dsd9WBNy8FL86BUdJaqWpsRDL/OJBNyzNhTBnsNt
 Kceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727699833; x=1728304633;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RWdhzc84IUX3iZRvSVXhcMocJl1l3V+3RFdCYOgUVyI=;
 b=AxJBmWQO6uvxo6IHL6+2lS/ANkKOgLrBNLf7tqlF2oHLDNTb7Tcyq4QGF6VNbH+mu9
 d0adic60AuQtZyhqCTwYsyuoq2yGbbCTxibrcYikwjfQ0wZH2gpOGSXcbTjzzvDMUpnx
 iQpIz1+ah4UPX8Ya5Vg3xRjAEImMO+Ooj3HBdIpRsGrR8Kqd1ZKcFOUGUZpvk9g/iXiY
 Ou1rb3KGfPbZqychdz4L4FfT66AL7BNcusiI8NV26bEcP7Be6zOJh8XZEIrQqkdIXi7D
 H7ZX0xwr4isbOL7/S+9ShpUdWl/15CLKMTDnEn5AGJ2RyWE7/khXhUG+RW4qcW7RsyTk
 a1qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYzhMC/7XWgQDKYDLevb2yaW9N4Xh5eEXgEwdMNTzzZXWtSY4Y0HAUleSi7hztklccSkwZEhomfJo=@lists.freedesktop.org,
 AJvYcCWCPGPuUGy4TuEg9UnN6sTl2P2ln6UJou1dXdfZJWgvPAUnj3k31ZLxJmQthhi7b8GZkkZ6V0VhQhlt@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5BKhFx9rAa9aSDZEfl8mR3R/s386JBtmvZ2wkM5AOqk1m3Yrx
 5Q3HElJTiBYz3QVeAt4VwuKu+N+02gPwAtqoTIXj3nhjR9vJDwz6
X-Google-Smtp-Source: AGHT+IFcXQiYgy1UCejNT8Qld3tDPg5srqzSDnRCPSydZyRhIwizEVC4oe/1cX76nhckBGiahi+2eg==
X-Received: by 2002:a05:600c:c5:b0:426:5269:1a50 with SMTP id
 5b1f17b1804b1-42f6944174dmr24736915e9.11.1727699832942; 
 Mon, 30 Sep 2024 05:37:12 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e96a52308sm149011355e9.43.2024.09.30.05.37.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 05:37:12 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 03/19] drm/i915/selftests: Include <linux/prandom.h>
 instead of <linux/random.h>
Date: Mon, 30 Sep 2024 14:33:14 +0200
Message-ID: <20240930123702.803617-4-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240930123702.803617-1-ubizjak@gmail.com>
References: <20240930123702.803617-1-ubizjak@gmail.com>
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

Substitute the inclusion of <linux/random.h> header with
<linux/prandom.h> to allow the removal of legacy inclusion
of <linux/prandom.h> from <linux/random.h>.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Acked-by: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
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
2.46.2

