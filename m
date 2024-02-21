Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F39E285D372
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 10:28:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A73F10E675;
	Wed, 21 Feb 2024 09:28:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="fTwg1XM1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com
 [209.85.128.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1E5C10E67D
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 09:28:01 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id
 00721157ae682-608852fc324so4950107b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 01:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1708507680; x=1709112480;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=eT/uH0qZq3eqCfd94wgAJ0+lZ7IXzMci6RxxltQCKcU=;
 b=fTwg1XM1k09NNKe1u9i1iuQmQOnuWCUQZ8m1o+3quV7q2KMRO+wtaUKF9MuXs5zsn3
 CxBCSqx4KjiiJpDURa8tbLUG66lJ/1GXjK6+Fp/rIxZOms2uRpKdPF6A6klN1F3ejnCf
 rfpOSyMSm8zA+vnukEzPEb09sfPWSsp6xZ1tzAbZjJ4sJ2YUm24PnXt74CZLF7uS0m5m
 KydUJeSP1NenIrUoyvh2G0CzO0OQulCaPoGOcuJST/QKbbZXta1fQOr0lOxB/+8BYZsN
 CtRTPH7DlvfbwRzowb6kiTgVpUf4ZfX2izrRe4DcwFZJsYjPkJPqktLwAnG5+6IX9DZE
 vaTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708507680; x=1709112480;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eT/uH0qZq3eqCfd94wgAJ0+lZ7IXzMci6RxxltQCKcU=;
 b=Zs0w1XIeao4SkXHjS0Pyil1atoiabDjRxnjRts+lvduwXmJ7UPSW5+Eefo92oOcP7z
 5S0NNh3ChWYSe3HjeT5ezHDK3rknc1CtY03uzaNwZE2SzKoMtCHHKMCHQd9Rp+LhLwT2
 5z6IohV6Q9wPHgzwY5V8uubjgAQRtliKOzU3IECfl9ly8bwvEOzYGkiMgbmGYqoFoBE0
 TN5Rcf8qaktKx3nr9oILB7IiYo2XEkFy96Cb5fAGwPrxpZo3Wa90qg78s1AtBHI4+DLb
 IfiqWbhMwXXv79Vvg9ACmSy2WHzYulPmxxbNPDEw7/BrWLqWgrEUX4qpxx1nx+arFHfx
 aNYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEDsVVMqWd45MUR7U5LvbKjVRclzyZJVYNWD0bYJYd8SJ/bIgIrcBgGDDrT5WoeMgwqI6gheUplQCLD05Bdoo9I7oV90AipNJ8Dcnwxkp5
X-Gm-Message-State: AOJu0Yz4UOBjApDOV7JXm3UE6xjURtwrmAEHE8/xCNcy0GuphKf+tYvf
 xLwAzYplUgI9zJ8B8bfhtuPTUsciyn2n7IgssZttbtv2W7ntFY6jnCS2+gpqVGaUI7GfuSttHCi
 qthU/Z3wcWA==
X-Google-Smtp-Source: AGHT+IGgpxMwkWEuztRpScY6gpG7tiyfC6FQuhNT36WOurGMxJcdy1PSlvVZEYKt9//gZI89E5vnji5S6AEFRQ==
X-Received: from slicestar.c.googlers.com
 ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a05:6902:188f:b0:dc6:dfc6:4207 with SMTP
 id cj15-20020a056902188f00b00dc6dfc64207mr4738387ybb.10.1708507680618; Wed,
 21 Feb 2024 01:28:00 -0800 (PST)
Date: Wed, 21 Feb 2024 17:27:13 +0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240221092728.1281499-1-davidgow@google.com>
Subject: [PATCH 0/9] kunit: Fix printf format specifier issues in KUnit
 assertions
From: David Gow <davidgow@google.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Shuah Khan <skhan@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rae Moar <rmoar@google.com>, 
 Matthew Auld <matthew.auld@intel.com>, 
 Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>, 
 "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>,
 Kees Cook <keescook@chromium.org>, 
 "=?UTF-8?q?Ma=C3=ADra=20Canal?=" <mcanal@igalia.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, Willem de Bruijn <willemb@google.com>,
 Florian Westphal <fw@strlen.de>, Cassio Neri <cassio.neri@gmail.com>, 
 Javier Martinez Canillas <javierm@redhat.com>,
 Arthur Grillo <arthur.grillo@usp.br>
Cc: David Gow <davidgow@google.com>,
 Brendan Higgins <brendan.higgins@linux.dev>, 
 Daniel Latypov <dlatypov@google.com>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 intel-xe@lists.freedesktop.org, linux-rtc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-hardening@vger.kernel.org, netdev@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KUnit has several macros which accept a log message, which can contain
printf format specifiers. Some of these (the explicit log macros)
already use the __printf() gcc attribute to ensure the format specifiers
are valid, but those which could fail the test, and hence used
__kunit_do_failed_assertion() behind the scenes, did not.

These include:
- KUNIT_EXPECT_*_MSG()
- KUNIT_ASSERT_*_MSG()
- KUNIT_FAIL()

This series adds the __printf() attribute, and fixes all of the issues
uncovered. (Or, at least, all of those I could find with an x86_64
allyesconfig, and the default KUnit config on a number of other
architectures. Please test!)

The issues in question basically take the following forms:
- int / long / long long confusion: typically a type being updated, but
  the format string not.
- Use of integer format specifiers (%d/%u/%li/etc) for types like size_t
  or pointer differences (technically ptrdiff_t), which would only work
  on some architectures.
- Use of integer format specifiers in combination with PTR_ERR(), where
  %pe would make more sense.
- Use of empty messages which, whilst technically not incorrect, are not
  useful and trigger a gcc warning.

We'd like to get these (or equivalent) in for 6.9 if possible, so please
do take a look if possible.

Thanks,
-- David

Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
Closes: https://lore.kernel.org/linux-kselftest/CAHk-=wgJMOquDO5f8ShH1f4rzZwzApNVCw643m5-Yj+BfsFstA@mail.gmail.com/

David Gow (9):
  kunit: test: Log the correct filter string in executor_test
  lib/cmdline: Fix an invalid format specifier in an assertion msg
  lib: memcpy_kunit: Fix an invalid format specifier in an assertion msg
  time: test: Fix incorrect format specifier
  rtc: test: Fix invalid format specifier.
  net: test: Fix printf format specifier in skb_segment kunit test
  drm: tests: Fix invalid printf format specifiers in KUnit tests
  drm/xe/tests: Fix printf format specifiers in xe_migrate test
  kunit: Annotate _MSG assertion variants with gnu printf specifiers

 drivers/gpu/drm/tests/drm_buddy_test.c | 14 +++++++-------
 drivers/gpu/drm/tests/drm_mm_test.c    |  6 +++---
 drivers/gpu/drm/xe/tests/xe_migrate.c  |  8 ++++----
 drivers/rtc/lib_test.c                 |  2 +-
 include/kunit/test.h                   | 12 ++++++------
 kernel/time/time_test.c                |  2 +-
 lib/cmdline_kunit.c                    |  2 +-
 lib/kunit/executor_test.c              |  2 +-
 lib/memcpy_kunit.c                     |  4 ++--
 net/core/gso_test.c                    |  2 +-
 10 files changed, 27 insertions(+), 27 deletions(-)

-- 
2.44.0.rc0.258.g7320e95886-goog

