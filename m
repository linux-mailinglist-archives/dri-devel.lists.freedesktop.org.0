Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C15CAB35855
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 11:13:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A85B510E2EC;
	Tue, 26 Aug 2025 09:13:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ME6ZV1kb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com
 [209.85.210.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42FE58992E
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 09:13:45 +0000 (UTC)
Received: by mail-pf1-f201.google.com with SMTP id
 d2e1a72fcca58-77057266cd8so2095648b3a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 02:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1756199625; x=1756804425;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=znqW7t629WY1D1c5x2OGn1PouDI+EiyaNYCniW4dbvs=;
 b=ME6ZV1kbm1gfEYU4TXHTMHy6ZJhsIe19LNJgDxm3NQQigk3WwqLdh9pe7Aj7YrGLiL
 YdUJAnv03BU5ppTJAq5EGzXey8248kH2PXd36voywe197PEhqP6COk9L7kBxcI64nEBU
 nnbjZ7z6DTy2v8UsH1mkH4tktMBWoJ9e+E3JBArEQvrgamyNZ747fnrOaW6gtR2u8Bpo
 aIiCf83lGg9OId/nAu6kRhgmQzctJ9GipFYK9aEEk5PWFLVunbrfuawjar06y2n09srC
 t/dTJAUo/toissqJbl8xwwVxPl6bDdESVGp+nZct/YP0QPJPcN9cmm3weAU5ECdl0K40
 ak8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756199625; x=1756804425;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=znqW7t629WY1D1c5x2OGn1PouDI+EiyaNYCniW4dbvs=;
 b=MbrhEaHbQJftk4OeRsMAHk8VQtPK/dPGKPFdzgK+U/u78oo1vdY9MWAzzzKzCDI+uq
 NO7R7R022lXn+V9RVW1iYq0vM3Vcaz5gf7hYrQ9K/pCAQzNouOa/7kkMuB/hMFt6nHJz
 /b76qoa0vd5VUVPuGGne74Aroh/EAkUHo7Q7eJcSdyGda60mmSr1UOBMJDr/0FW9tLbK
 7V1mZ6TNr1+6SYuQrhrlkmFfjFop1waWKjGuPLYO97y61MCt2v+52asoXKS4tHyA71A7
 ufOlL7ch/77JAL0VERY6rViw0da9OcNEHVLcWcEPutRjoDgjEbOJ6ZtlWfltEWg2k637
 zmGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrf2GSSINjrOselk+QEoAwhOPEF8BwKjIHGVIC41GrfIFomAG1hna9PBfBmORfx/Wy52SQ9RHKLrw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUmSFTXht+cEcRV2bCdI7t1jUwnd4avBpYfsobaOSSQE+H5k1z
 oPXz66pqJQX36x0XGQ2XzBl2r0YAsGBZGFdr51ooTY9teGzowL1ED6vMmSNXhBtKENoY70JoJ+y
 18bJ8d1W/RR1Lww==
X-Google-Smtp-Source: AGHT+IEJeR1/GR+N43ubU0gh/gMey5vMfKh200YEtstzt6LIdxaZvucfphjchQJ/CmOBUoz6yCADrHdUEbL35g==
X-Received: from pfva1.prod.google.com ([2002:a05:6a00:c81:b0:771:3e92:f3aa])
 (user=davidgow job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:a2a:b0:736:8c0f:7758 with SMTP id
 d2e1a72fcca58-7702fa4f732mr16572148b3a.10.1756199624679; 
 Tue, 26 Aug 2025 02:13:44 -0700 (PDT)
Date: Tue, 26 Aug 2025 17:13:30 +0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Message-ID: <20250826091341.1427123-1-davidgow@google.com>
Subject: [PATCH v4 0/7] kunit: Refactor and extend KUnit's parameterized
 testing framework
From: David Gow <davidgow@google.com>
To: Marie Zhussupova <marievic@google.com>, marievictoria875@gmail.com,
 rmoar@google.com, shuah@kernel.org, brendan.higgins@linux.dev
Cc: David Gow <davidgow@google.com>, mark.rutland@arm.com, elver@google.com, 
 dvyukov@google.com, lucas.demarchi@intel.com, 
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 kasan-dev@googlegroups.com, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Stephen Rothwell <sfr@canb.auug.org.au>
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

Hi all,

This is a new version of Marie's patch series, with a couple of extra
fixes squashed in, notably:
- drm/xe/tests: Fix some additional gen_params signatures
https://lore.kernel.org/linux-kselftest/20250821135447.1618942-1-davidgow@google.com/
- kunit: Only output a test plan if we're using kunit_array_gen_params
https://lore.kernel.org/linux-kselftest/20250821135447.1618942-2-davidgow@google.com/

These should fix the issues found in linux-next here:
https://lore.kernel.org/linux-next/20250818120846.347d64b1@canb.auug.org.au/

These changes only affect patches 3 and 4 of the series, the others are
unchanged from v3.

Thanks, everyone, and sorry for the inconvenience!

Cheers,
-- David

---

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

5. [P 4] Introducing a `params_array` field in `struct kunit`. This will
   allow the parameterized test context to have direct storage of the
   parameter array, enabling features like using dynamic parameter arrays
   or using context beyond just the previous parameter. This will also
   enable outputting the KTAP test plan for a parameterized test when the
   parameter count is available.

Patches 5 and 6 add examples tests to lib/kunit/kunit-example-test.c to
showcase the new features and patch 7 updates the KUnit documentation
to reflect all the framework changes.

Thank you!
-Marie

---

Changes in v4:

Link to v3 of this patch series:
https://lore.kernel.org/linux-kselftest/20250815103604.3857930-1-marievic@google.com/

- Fixup the signatures of some more gen_params functions in the drm/xe
  driver.
- Only print a KTAP test plan if a parameterised test is using the
  built-in kunit_array_gen_params generating function, fixing the issues
  with generator functions which skip array elements.

Changes in v3:

Link to v2 of this patch series:
https://lore.kernel.org/all/20250811221739.2694336-1-marievic@google.com/

- Added logic for skipping the parameter runs and updating the test statistics
  when parameterized test initialization fails.
- Minor changes to the documentation.
- Commit message formatting.

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
 drivers/gpu/drm/xe/tests/xe_pci.c       |  14 +-
 drivers/gpu/drm/xe/tests/xe_pci_test.h  |   9 +-
 include/kunit/test.h                    |  95 ++++++-
 kernel/kcsan/kcsan_test.c               |   2 +-
 lib/kunit/kunit-example-test.c          | 217 +++++++++++++++
 lib/kunit/test.c                        |  94 +++++--
 rust/kernel/kunit.rs                    |   4 +
 8 files changed, 740 insertions(+), 37 deletions(-)

-- 
2.51.0.261.g7ce5a0a67e-goog

