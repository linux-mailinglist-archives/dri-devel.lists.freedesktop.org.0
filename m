Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD43B15385
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 21:37:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4E7210E02E;
	Tue, 29 Jul 2025 19:37:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="NTQhzzkF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f202.google.com (mail-qk1-f202.google.com
 [209.85.222.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D34F10E02F
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 19:37:14 +0000 (UTC)
Received: by mail-qk1-f202.google.com with SMTP id
 af79cd13be357-7e33f7a58f6so944914985a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 12:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1753817833; x=1754422633;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=iY//lVxLTeQ/wpFhoCwsWTSD0JOlrDoBeeghyQ/Upjs=;
 b=NTQhzzkFxf66Duog+1s/ebnVSS4vEIsPkXn3B3T8a+YdLOZEW/kspSNA4zeNuO9UcM
 54K/f8rrSwDQcf2vWcFngkSUnh5xHC2c0VqkViGDqxq4EUXzRytd3sIvyLsNwzixEwKt
 99a+aeokOlJdAsXqOzKwdFf+/Bm56CaKlmxL786PwxO8dBosmHLrqK3rqe2qi4Hcp32B
 wYL4IdktavNEAMfU35r9OECYs9F3SKdCP7GK88U1qXOQNauthFUz4JoV+qc/MyB0rf84
 8DTsEdPBpMrOLe0VG0xnDOqO/7yfSy0ev2A+WzOU5SJxYmI0GQylb3UI/xjisIm/72tU
 08vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753817833; x=1754422633;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iY//lVxLTeQ/wpFhoCwsWTSD0JOlrDoBeeghyQ/Upjs=;
 b=lezYbKYqKfSOnO2BRRcAp1vzautuF1IifWdDQWgjqUj8+k/B4MpWMZEPFCmiJWzH3g
 f5wRlCx6BTeJ8qloSojZEvRif1M0pVJ3ofGiiHQJ/R+7ignzGif6DrTXE6imf+K4DFgv
 ST51ujXNQ8E7yvhf9mUx96EucInqC1xjP3CidZHH3fms2IA/TlnBK7I5R/ucsIvL8zmf
 nMiC+Zm8/3zCyCBRu/suHRTdUp8fILoKEzzWosAuplgtYfI0vD2u7t8a46Z0R4je4sb8
 ugQneS+K1N6d1lavcV2BGIkuvRZB3IJPGCejV9zCEdRyNhLk2rwUOPbZFuJbnbzCHX5l
 ypDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1MPSKRYQB/8IXNaxDL//fAMvadASDSJ9DCrryW2ypjnV0KW2kuAlv6VPO9doyvvJ5gqDnDHPuon4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3FFBj0eUoOhFcuaKB7pjlS4OK/FMjUGAov0R1YTbVIQNyiAbl
 UESdkTA9FpGn5kPSfgheScRNAMAep59/mph04nlGBgzVgszCGxojy/oFe5WPEQuo17EedthxcU1
 dQUn6f1o8WuxufQ==
X-Google-Smtp-Source: AGHT+IGn2AxD4SAxB/kWHZWeagJBNiPsMMNzOwk1sETIYxGHKzcBJDio12VD/zBRlWE/2YAZFEUedLapEWbiNA==
X-Received: from qtbfc18.prod.google.com
 ([2002:a05:622a:4892:b0:4ab:b55c:cea3])
 (user=marievic job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:620a:a10d:b0:7d4:4aa6:a509 with SMTP id
 af79cd13be357-7e66f39138amr112976185a.48.1753817833109; 
 Tue, 29 Jul 2025 12:37:13 -0700 (PDT)
Date: Tue, 29 Jul 2025 19:36:38 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250729193647.3410634-1-marievic@google.com>
Subject: [PATCH 0/9] kunit: Refactor and extend KUnit's
From: Marie Zhussupova <marievic@google.com>
To: rmoar@google.com, davidgow@google.com, shuah@kernel.org, 
 brendan.higgins@linux.dev
Cc: elver@google.com, dvyukov@google.com, lucas.demarchi@intel.com, 
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 kasan-dev@googlegroups.com, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Marie Zhussupova <marievic@google.com>
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

Hello!

KUnit offers a parameterized testing framework, where tests can be
run multiple times with different inputs.

Currently, the same `struct kunit` is used for each parameter
execution. After each run, the test instance gets cleaned up.
This creates the following limitations:

a. There is no way to store resources that are accessible across
   the individual parameter test executions.
b. It's not possible to pass additional context besides the
   previous parameter to `generate_params()` to get the next
   parameter.
c. Test users are restricted to using pre-defined static arrays
   of parameter objects or `generate_params()` to define their
   parameters. There is no flexibility to pass a custom dynamic
   array without using `generate_params()`, which can be complex
   if generating the next parameter depends on more than just
   the single previous parameter (e.g., two or more previous
   parameters).

This patch series resolves these limitations by:

1. [P 1] Giving each parameterized test execution its own
   `struct kunit`. This aligns more with the definition of a
   `struct kunit` as a running instance of a test. It will also
   remove the need to manage state, such as resetting the
   `test->priv` field or the `test->status_comment` after every
   parameter run.

2. [P 1] Introducing a parent pointer of type `struct kunit`.
   Behind the scenes, a parent instance for the parameterized
   tests will be created. It won't be used to execute any test
   logic, but will instead be used as a context for shared
   resources. Each individual running instance of a test will
   now have a reference to that parent instance and thus, have
   access to those resources.

3. [P 2] Introducing `param_init()` and `param_exit()` functions
   that can set up and clean up the parent instance of the
   parameterized tests. They will run once before and after the
   parameterized series and provide a way for the user to
   access the parent instance to add the parameter array or any
   other resources to it, including custom ones to the
   `test->parent->priv` field or to `test->parent->resources`
   via the Resource API (link below).

https://elixir.bootlin.com/linux/v6.16-rc7/source/include/kunit/resource.h

4. [P 3, 4 & 5] Passing the parent `struct kunit` as an additional
   parameter to `generate_params()`. This provides
   `generate_params()` with more available context, making
   parameter generation much more flexible. The
   `generate_params()` implementations in the KCSAN and drm/xe
   tests have been adapted to match the new function pointer
   signature.

5. [P 6] Introducing a `params_data` field in `struct kunit`.
   This will allow the parent instance of a test to have direct
   storage of the parameter array, enabling features like using
   dynamic parameter arrays or using context beyond just the
   previous parameter.

Thank you!
-Marie

Marie Zhussupova (9):
  kunit: Add parent kunit for parameterized test context
  kunit: Introduce param_init/exit for parameterized test shared context
    management
  kunit: Pass additional context to generate_params for parameterized
    testing
  kcsan: test: Update parameter generator to new signature
  drm/xe: Update parameter generator to new signature
  kunit: Enable direct registration of parameter arrays to a KUnit test
  kunit: Add example parameterized test with shared resources and direct
    static parameter array setup
  kunit: Add example parameterized test with direct dynamic parameter
    array setup
  Documentation: kunit: Document new parameterized test features

 Documentation/dev-tools/kunit/usage.rst | 455 +++++++++++++++++++++++-
 drivers/gpu/drm/xe/tests/xe_pci.c       |   2 +-
 include/kunit/test.h                    |  98 ++++-
 kernel/kcsan/kcsan_test.c               |   2 +-
 lib/kunit/kunit-example-test.c          | 207 +++++++++++
 lib/kunit/test.c                        |  82 ++++-
 6 files changed, 818 insertions(+), 28 deletions(-)

-- 
2.50.1.552.g942d659e1b-goog

