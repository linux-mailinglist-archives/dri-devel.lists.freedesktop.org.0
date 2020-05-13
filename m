Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D2D1D4642
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 08:53:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 491F96EBE5;
	Fri, 15 May 2020 06:53:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E016E271;
 Wed, 13 May 2020 18:24:07 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id a68so157850otb.10;
 Wed, 13 May 2020 11:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vKnnhjZf+Lvy/wEev/k/9Sd4WlZuSJaabLD4NBhl2lM=;
 b=j+7yt7La5zsrEjfpHCvrP/ii3zadlAPT++pfcnw31AUeUts/ObTRNG08y8zSxofJBe
 pVVO55p13vEaNWPs5gLdOOzL0nQKk0/rPlUlz7TKQTGzwAFAkdm/ZY00uArTWWnUC7ck
 MFu4jLFk6jdol1Zy5OvW3CDjv/cPIa5Jik6nn75o64zxg6Hwfs+qBShjwtE1KBVHt+cz
 J86GjUgaqiud+3su5GJEaGYCP5zbs2BoGNKlUWlpeH46WUWqv8n2ZD3050b1skcUYO0P
 SHV9+mH5zngcyRFtjokUvYQWlActYtxSPwn5RLO2f+2jRXIBH1lgRAGKiEgR8RlWSCHb
 GZpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vKnnhjZf+Lvy/wEev/k/9Sd4WlZuSJaabLD4NBhl2lM=;
 b=aj052YJ/95mhpGi1npzcjLrHvydI5EmjsZkOpqe0ShZvk8RrlRkYs5W2m3ZzY/FH7f
 hOVuBtCd7X2rDdnbx7QgNg1EjRO81q9JzHkfycg9zYrXSwkyAMAnO/hh7IEUscstmrLm
 c17QcQZqs48WJShi/Rx66TSm8Quv/cShqCikeBBIfEzLft/0Z6ITC4adMLsZl1lx5mem
 zUGe3bwgq7wp8rDpmwLlsX5+TW1OfU1cgSnHDGp8IRCcrM/dauskvyryqoqg+89P5RIe
 +YSpMSQc6IkeRU6l1WIUBKqQeRzmqIkC444rEtkEC/KQmSIaMpMu4eRjEdwO5Qq0tqv4
 pY5A==
X-Gm-Message-State: AOAM5312HnsKhOD231aJh3BqSqhDxoNfIDh5wqffL78ailE5ciY052eo
 w66HWVLu800kYamkS8yHs84=
X-Google-Smtp-Source: ABdhPJzf1C10OPrTxY5CS+RUjyAPs0sTKtzwWp3zNtBoJB2+oOwSBnw6zYJ4lL5mA9H32k8Vgaq+7A==
X-Received: by 2002:a9d:2dc1:: with SMTP id g59mr604409otb.288.1589394246442; 
 Wed, 13 May 2020 11:24:06 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id b63sm125772otc.23.2020.05.13.11.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 11:24:05 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/i915: Remove duplicate inline specifier on write_pte
Date: Wed, 13 May 2020 11:23:40 -0700
Message-Id: <20200513182340.3968668-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Mailman-Approved-At: Fri, 15 May 2020 06:52:55 +0000
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
Cc: kbuild test robot <lkp@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When building with clang:

 drivers/gpu/drm/i915/gt/gen8_ppgtt.c:392:24: warning: duplicate
 'inline' declaration specifier [-Wduplicate-decl-specifier]
 declaration specifier [-Wduplicate-decl-specifier]
 static __always_inline inline void
                        ^
 include/linux/compiler_types.h:138:16: note: expanded from macro
 'inline'
 #define inline inline __gnu_inline __inline_maybe_unused notrace
                ^
 1 warning generated.

__always_inline is defined as 'inline __attribute__((__always_inline))'
so we do not need to specify it twice.

Fixes: 84eac0c65940 ("drm/i915/gt: Force pte cacheline to main memory")
Link: https://github.com/ClangBuiltLinux/linux/issues/1024
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
index 2dc88e76ebec..699125928272 100644
--- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
@@ -389,7 +389,7 @@ static int gen8_ppgtt_alloc(struct i915_address_space *vm,
 	return err;
 }
 
-static __always_inline inline void
+static __always_inline void
 write_pte(gen8_pte_t *pte, const gen8_pte_t val)
 {
 	/* Magic delays? Or can we refine these to flush all in one pass? */

base-commit: e098d7762d602be640c53565ceca342f81e55ad2
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
