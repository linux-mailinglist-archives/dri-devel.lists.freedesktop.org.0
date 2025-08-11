Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D086EB21811
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 00:17:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CEA010E567;
	Mon, 11 Aug 2025 22:17:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="pSjk9L+G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f202.google.com (mail-qk1-f202.google.com
 [209.85.222.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FFA110E567
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 22:17:44 +0000 (UTC)
Received: by mail-qk1-f202.google.com with SMTP id
 af79cd13be357-7e826e0d7abso1003302985a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 15:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1754950663; x=1755555463;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=tsTpiVRLtnpCIisNiGgEETpcDrFcJWiGEHWB60H2Tzc=;
 b=pSjk9L+GFrpJtGiigC+O7HjTHV5AO2uFMZETZLI1N5FPsWo4642aMaWQGnOFjzc+Qa
 SHrg/c3JpfbyhKqwegdTEDeVXjSp5rwJppKD7NmNetCKHOt9i/cVepOYKVyu+PyFtUW5
 PGw7I0cbgjFcql1GDgqP6lVL/fa/CO/GQvANgP0j+f3feQtZ+v5blPopkn8MSKfFEwWN
 5PgOw0yYChO0HFxEMIin5YXBipEL/fCQKH/v3DvvL8dX+tWkeQYLfkTlnfPIGCgipKIS
 SLGwQ40rTe6gafdxJ9pF4P1y0TQt/0mVrp0yWxkyCZNek/dHctOx+/Or31N2NuukVblX
 OdNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754950663; x=1755555463;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tsTpiVRLtnpCIisNiGgEETpcDrFcJWiGEHWB60H2Tzc=;
 b=nzosf01m4UfGCY66nP/dE8s01tVtaHZJ2yb7RfiUSz0MgY/Kc7fQ7FQ4iqfErqSOE4
 lxVdRuWUQFPbjHDKgd5umNrWiJ12M2/0ejwqzHIAWLqKgoGNQ+xKbgO4CT3pua2dfSSC
 ETIXmJFEO+0OeAKilNWn5ekQlyFo15K+jyYjOH5QVkCsfwRbEfOq6Fc78Hkyr7o3hh3R
 Wpl/07/+VZf7TkIOpVt+wcMgpNHgHE20JdyAfoozvYrCSe+yrdlSc5sfKhQlw7GmXLud
 OmYiSmFHOOUcBkMx5H9Z7j2yHm38gvQwq/KoRpAibKg5g7rpbTuJDg+d6XK4R42kvX3I
 sLAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0uTEwoMVU6pwV2jMroYu7vaHxzwW7UhWj6M2jbYwl+xdqTyTASD/p8pWlrAXHjtFJCi6yxhyjoGw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yykv3pdms1/zRHpNmsY87lcRFujmLphvVUGaa3mEh68uc9yIYPi
 gbFormg2/0lA7onCZypCma4g1D+sFGAAPtPghR3mTvwEFXu7l2GuVBABrni/Gxj2NwEBqSfO45w
 P9wLixoFCx1CPlw==
X-Google-Smtp-Source: AGHT+IGLY1363SKVs1UR+Wi4x98jSfDfthClu1+vmuO4PXrMkif+fZojShhrhTTkXKzMJXFQxdtGp6zu02KtrQ==
X-Received: from qknwd46.prod.google.com
 ([2002:a05:620a:72ae:b0:7e6:36d3:ccf2])
 (user=marievic job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:620a:612a:b0:7e3:35e3:3412 with SMTP id
 af79cd13be357-7e858897035mr146693485a.34.1754950663342; 
 Mon, 11 Aug 2025 15:17:43 -0700 (PDT)
Date: Mon, 11 Aug 2025 22:17:32 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.rc0.205.g4a044479a3-goog
Message-ID: <20250811221739.2694336-1-marievic@google.com>
Subject: [PATCH v2 0/7] kunit: Refactor and extend KUnit's parameterized
 testing framework
From: Marie Zhussupova <marievic@google.com>
To: rmoar@google.com, davidgow@google.com, shuah@kernel.org, 
 brendan.higgins@linux.dev
Cc: mark.rutland@arm.com, elver@google.com, dvyukov@google.com, 
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com, 
 rodrigo.vivi@intel.com, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, kasan-dev@googlegroups.com, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Marie Zhussupova <marievic@google.com>
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
run multiple times with different inputs. However, the current
implementation uses the same `struct kunit` for each parameter run.
After each run, the test context gets cleaned up, which creates
the following limitations:

a. There is no way to store resources that are accessible across
   the individual parameter runs.
b. It's not possible to pass additional context, besides the previous
   parameter (and potentially anything else that is stored in the current
   test context), to the parameter generator function.
c. Test users are restricted to using pre-defined static arrays
   of parameter objects or generate_params() to define their
   parameters. There is no flexibility to make a custom dynamic
   array without using generate_params(), which can be complex if
   generating the next parameter depends on more than just the single
   previous parameter.

This patch series resolves these limitations by:

1. [P 1] Giving each parameterized run its own `struct kunit`. It will
   remove the need to manage state, such as resetting the `test->priv`
   field or the `test->status_comment` after every parameter run.

2. [P 1] Introducing parameterized test context available to all
   parameter runs through the parent pointer of type `struct kunit`.
   This context won't be used to execute any test logic, but will
   instead be used for storing shared resources. Each parameter run
   context will have a reference to that parent instance and thus,
   have access to those resources.

3. [P 2] Introducing param_init() and param_exit() functions that can
   initialize and exit the parameterized test context. They will run once
   before and after the parameterized test. param_init() can be used to add
   resources to share between parameter runs, pass parameter arrays, and
   any other setup logic. While param_exit() can be used to clean up
   resources that were not managed by the parameterized test, and
   any other teardown logic.

4. [P 3] Passing the parameterized test context as an additional argument
   to generate_params(). This provides generate_params() with more context,
   making parameter generation much more flexible. The generate_params()
   implementations in the KCSAN and drm/xe tests have been adapted to match
   the new function pointer signature.

5. [P 4] Introducing a `params_array` field in `struct kunit`.
   This will allow the parameterized test context to have direct
   storage of the parameter array, enabling features like using
   dynamic parameter arrays or using context beyond just the
   previous parameter. This will also enable outputting the KTAP
   test plan for a parameterized test when the parameter count is
   available.

Patches 5 and 6 add examples tests to lib/kunit/kunit-example-test.c to
showcase the new features and patch 7 updates the KUnit documentation
to reflect all the framework changes.

Thank you!
-Marie

---

Changes in v2:

Link to v1 of this patch series:
https://lore.kernel.org/all/20250729193647.3410634-1-marievic@google.com/

- Establish parameterized testing terminology:
   - "parameterized test" will refer to the group of all runs of a single test
     function with different parameters.
   - "parameter run" will refer to the execution of the test case function with
     a single parameter.
   - "parameterized test context" is the `struct kunit` that holds the context
     for the entire parameterized test.
   - "parameter run context" is the `struct kunit` that holds the context of the
     individual parameter run.
   - A test is defined to be a parameterized tests if it was registered with a
     generator function.
- Make comment edits to reflect the established terminology.
- Require users to manually pass kunit_array_gen_params() to
  KUNIT_CASE_PARAM_WITH_INIT() as the generator function, unless they want to
  provide their own generator function, if the parameter array was registered
  in param_init(). This is to be consistent with the definition of a
  parameterized test, i.e. generate_params() is never NULL if it's
  a parameterized test.
- Change name of kunit_get_next_param_and_desc() to
  kunit_array_gen_params().
- Other minor function name changes such as removing the "__" prefix in front
  of internal functions.
- Change signature of get_description() in `struct params_array` to accept
  the parameterized test context, as well.
- Output the KTAP test plan for a parameterized test when the parameter count
  is available.
- Cover letter was made more concise.
- Edits to the example tests.
- Fix bug of parameterized test init/exit logic being done outside of the
  parameterized test check.
- Fix bugs identified by the kernel test robot.

---

Marie Zhussupova (7):
  kunit: Add parent kunit for parameterized test context
  kunit: Introduce param_init/exit for parameterized test context
    management
  kunit: Pass parameterized test context to generate_params()
  kunit: Enable direct registration of parameter arrays to a KUnit test
  kunit: Add example parameterized test with shared resource management
    using the Resource API
  kunit: Add example parameterized test with direct dynamic parameter
    array setup
  Documentation: kunit: Document new parameterized test features

 Documentation/dev-tools/kunit/usage.rst | 342 +++++++++++++++++++++++-
 drivers/gpu/drm/xe/tests/xe_pci.c       |   2 +-
 include/kunit/test.h                    |  95 ++++++-
 kernel/kcsan/kcsan_test.c               |   2 +-
 lib/kunit/kunit-example-test.c          | 222 +++++++++++++++
 lib/kunit/test.c                        |  87 ++++--
 rust/kernel/kunit.rs                    |   4 +
 7 files changed, 726 insertions(+), 28 deletions(-)

-- 
2.51.0.rc0.205.g4a044479a3-goog

