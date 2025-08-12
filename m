Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC52B23BBF
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 00:22:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4577C10E498;
	Tue, 12 Aug 2025 22:22:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="UDtBxyUH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 697F210E498
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 22:22:33 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-7075ccb168bso49020776d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 15:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1755037352; x=1755642152;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=opcJeE+7tPfMMHi8foMn39Eit1OmyT4Dsk8XguKPJ60=;
 b=UDtBxyUH+n7UqZL1o9R7ZKNvmLmwoa8o5f3h01x9ja357TlZSGV9tCwjeGxYde9ia5
 m77jvh0cwZXr/nxHeParjVPnRb7/Rb4bUP0BiY7aF0L01/b9V1yK+jgXmbrBYpSzDV5k
 Mv1hdf4bwaiDTf94mIN/p72knPKvXJ4e+Zn1hJhHwFw2UbAqEaK7F9E6MOWIv2VKVvf4
 slkZ/2+3ZxGFU8HLWD4ly6b2ZL28PEvqSAe96zxMnoVtoqtOVgICquaiKCE9msSrAFmm
 TenuwgdxEkHbmE9rCztcXqaKlrCe8jLtKqLgq80Z2R5WSZt6wZG/FLiMasCCightFZVJ
 JB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755037352; x=1755642152;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=opcJeE+7tPfMMHi8foMn39Eit1OmyT4Dsk8XguKPJ60=;
 b=ZPvtI6BQ6oc58N4g0QvdkqpLqYZ21QebbNKlHFwNVHHJ1nKg3wQBfH/4uKvUAeGdEA
 fTtB6DHSibseff05qavmk/CqGQ9Qnd8OF6E+NLYSjHjnoRZK/tonicw6559FUS297BJb
 k88qWeB0oaCe8Q4uvTkIe+zCR3KaOwVgw414OQArz6uj/q6Lae1ZYiEiRfmXooPn23Y1
 UJfABUht8fSdoelmBS++N4vr2aodgrqKAVsBbKFc0C2GkS+Zte6bhQxFJTtV2uJlmER4
 GVU5NwQ/TapYvjpU3cv9kNzC13UEGpGyOk3h0FWBER/XAHG3kPkC8sr5ROMPnyrBQV5u
 Gtmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxBtDo4tc3iOE0N/aJVfvwdLGnNOnwKvdKmT3rQDMcwNZTfs3rE6ofRGXSkDImT7QZcUdlfBNdMts=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTO+zxQNThfqTAVTHSswgbE077EDVV0ZLL+pTMk6NNjhXZg/QX
 xV9qiXIF6I/8+mCxa9sR8VslX6sWxfCGN3e+1M6Bc64mCrZRzgIYm1jjRRnHR/zdwk2b1z90CsM
 dWNYBBgabyakOYiXSbdBJymuoYCdSQMlxbSWlp+Lf
X-Gm-Gg: ASbGncvpjQRWZm2Llt8XcR85lO1Hg0ub0DgBvKv4tQ1qaQhT25WU2IQqaAcn3xuGiQt
 jY8zNWNzrYpud2eovzb0HgZP3Qqmw+XaRzK6g+Uj+7fAJCSWDFN2gWAzvJcnfsmIs8bH2yBzVEx
 4/laXX7Yo7Y8FOGhtACZvcoXi35MLU7iVytmEP6o7tMBG6Qqf2AI59q03zLpR6q+BapzxvNCJww
 4p1KA==
X-Google-Smtp-Source: AGHT+IF10u+V+6ugaROze/dqCwMn9zJ3gAi07zy1b/fQ85QR35AUmm0vCptr5zWftPCDsCOQ7K1lmJXcG2tjBJlFL8Y=
X-Received: by 2002:ad4:4ee4:0:b0:709:995d:d4a8 with SMTP id
 6a1803df08f44-709e89fbe74mr11993096d6.45.1755037352008; Tue, 12 Aug 2025
 15:22:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250811221739.2694336-1-marievic@google.com>
 <20250811221739.2694336-3-marievic@google.com>
In-Reply-To: <20250811221739.2694336-3-marievic@google.com>
From: Rae Moar <rmoar@google.com>
Date: Tue, 12 Aug 2025 18:22:20 -0400
X-Gm-Features: Ac12FXwV9IiY0435kgKra-rYAqebBZvna6EsVJ_KwFDNUaF3nei7y9HV2jQMX64
Message-ID: <CA+GJov6zSuMrPU3PLsdZofDw4Gegrqnp=gCxY5AOwZHtqB2cSw@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] kunit: Introduce param_init/exit for parameterized
 test context management
To: Marie Zhussupova <marievic@google.com>
Cc: davidgow@google.com, shuah@kernel.org, brendan.higgins@linux.dev, 
 mark.rutland@arm.com, elver@google.com, dvyukov@google.com, 
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com, 
 rodrigo.vivi@intel.com, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, kasan-dev@googlegroups.com, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Aug 11, 2025 at 6:17=E2=80=AFPM Marie Zhussupova <marievic@google.c=
om> wrote:
>
> Add (*param_init) and (*param_exit) function pointers to
> `struct kunit_case`. Users will be able to set them
> via the new KUNIT_CASE_PARAM_WITH_INIT() macro.
>
> param_init/exit will be invoked by kunit_run_tests() once before
> and once after the parameterized test, respectively.
> They will receive the `struct kunit` that holds the parameterized
> test context; facilitating init and exit for shared state.
>
> This patch also sets param_init/exit to None in
> rust/kernel/kunit.rs.
>
> Signed-off-by: Marie Zhussupova <marievic@google.com>
> ---
>
> Changes in v2:
>
> - param init/exit were set to None
>   in rust/kernel/kunit.rs to fix the Rust breakage.
> - The name of __kunit_init_parent_test was
>   changed to kunit_init_parent_param_test and
>   its call was changed to happen only if the
>   test is parameterized.
> - The param_exit call was also moved inside
>   the check for if the test is parameterized.
> - KUNIT_CASE_PARAM_WITH_INIT() macro logic was changed
>   to not automatically set generate_params() to KUnit's
>   built-in generator function. Instead, the test user
>   will be asked to provide it themselves.
> - The comments and the commit message were changed to
>   reflect the parameterized testing terminology. See
>   the patch series cover letter change log for the
>   definitions.

Hello!

This patch looks good to me. Thank you for fixing the Rust breakage! I
also appreciate the terminology changes here as well.

Reviewed-by: Rae Moar <rmoar@google.com>

Thanks!

-Rae

>
> ---
>  include/kunit/test.h | 25 +++++++++++++++++++++++++
>  lib/kunit/test.c     | 20 ++++++++++++++++++++
>  rust/kernel/kunit.rs |  4 ++++
>  3 files changed, 49 insertions(+)
>
> diff --git a/include/kunit/test.h b/include/kunit/test.h
> index b47b9a3102f3..d2e1b986b161 100644
> --- a/include/kunit/test.h
> +++ b/include/kunit/test.h
> @@ -92,6 +92,8 @@ struct kunit_attributes {
>   * @name:     the name of the test case.
>   * @generate_params: the generator function for parameterized tests.
>   * @attr:     the attributes associated with the test
> + * @param_init: The init function to run before a parameterized test.
> + * @param_exit: The exit function to run after a parameterized test.
>   *
>   * A test case is a function with the signature,
>   * ``void (*)(struct kunit *)``
> @@ -128,6 +130,8 @@ struct kunit_case {
>         const char *name;
>         const void* (*generate_params)(const void *prev, char *desc);
>         struct kunit_attributes attr;
> +       int (*param_init)(struct kunit *test);
> +       void (*param_exit)(struct kunit *test);
>
>         /* private: internal use only. */
>         enum kunit_status status;
> @@ -218,6 +222,27 @@ static inline char *kunit_status_to_ok_not_ok(enum k=
unit_status status)
>                   .generate_params =3D gen_params,                       =
         \
>                   .attr =3D attributes, .module_name =3D KBUILD_MODNAME}
>
> +/**
> + * KUNIT_CASE_PARAM_WITH_INIT - Define a parameterized KUnit test case w=
ith custom
> + * param_init() and param_exit() functions.
> + * @test_name: The function implementing the test case.
> + * @gen_params: The function to generate parameters for the test case.
> + * @init: A reference to the param_init() function to run before a param=
eterized test.
> + * @exit: A reference to the param_exit() function to run after a parame=
terized test.
> + *
> + * Provides the option to register param_init() and param_exit() functio=
ns.
> + * param_init/exit will be passed the parameterized test context and run=
 once
> + * before and once after the parameterized test. The init function can b=
e used
> + * to add resources to share between parameter runs, and any other setup=
 logic.
> + * The exit function can be used to clean up resources that were not man=
aged by
> + * the parameterized test, and any other teardown logic.
> + */
> +#define KUNIT_CASE_PARAM_WITH_INIT(test_name, gen_params, init, exit)   =
       \
> +               { .run_case =3D test_name, .name =3D #test_name,         =
           \
> +                 .generate_params =3D gen_params,                       =
         \
> +                 .param_init =3D init, .param_exit =3D exit,            =
           \
> +                 .module_name =3D KBUILD_MODNAME}
> +
>  /**
>   * struct kunit_suite - describes a related collection of &struct kunit_=
case
>   *
> diff --git a/lib/kunit/test.c b/lib/kunit/test.c
> index 14a8bd846939..49a5e6c30c86 100644
> --- a/lib/kunit/test.c
> +++ b/lib/kunit/test.c
> @@ -641,6 +641,19 @@ static void kunit_accumulate_stats(struct kunit_resu=
lt_stats *total,
>         total->total +=3D add.total;
>  }
>
> +static void kunit_init_parent_param_test(struct kunit_case *test_case, s=
truct kunit *test)
> +{
> +       if (test_case->param_init) {
> +               int err =3D test_case->param_init(test);
> +
> +               if (err) {
> +                       kunit_err(test_case, KUNIT_SUBTEST_INDENT KUNIT_S=
UBTEST_INDENT
> +                               "# failed to initialize parent parameter =
test.");
> +                       test_case->status =3D KUNIT_FAILURE;
> +               }
> +       }
> +}
> +
>  int kunit_run_tests(struct kunit_suite *suite)
>  {
>         char param_desc[KUNIT_PARAM_DESC_SIZE];
> @@ -678,6 +691,7 @@ int kunit_run_tests(struct kunit_suite *suite)
>                         kunit_run_case_catch_errors(suite, test_case, &te=
st);
>                         kunit_update_stats(&param_stats, test.status);
>                 } else {
> +                       kunit_init_parent_param_test(test_case, &test);
>                         /* Get initial param. */
>                         param_desc[0] =3D '\0';
>                         /* TODO: Make generate_params try-catch */
> @@ -714,6 +728,12 @@ int kunit_run_tests(struct kunit_suite *suite)
>                                 param_desc[0] =3D '\0';
>                                 curr_param =3D test_case->generate_params=
(curr_param, param_desc);
>                         }
> +                       /*
> +                        * TODO: Put into a try catch. Since we don't nee=
d suite->exit
> +                        * for it we can't reuse kunit_try_run_cleanup fo=
r this yet.
> +                        */
> +                       if (test_case->param_exit)
> +                               test_case->param_exit(&test);
>                         /* TODO: Put this kunit_cleanup into a try-catch.=
 */
>                         kunit_cleanup(&test);
>                 }
> diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
> index 4b8cdcb21e77..cda64574b44d 100644
> --- a/rust/kernel/kunit.rs
> +++ b/rust/kernel/kunit.rs
> @@ -207,6 +207,8 @@ pub const fn kunit_case(
>          status: kernel::bindings::kunit_status_KUNIT_SUCCESS,
>          module_name: core::ptr::null_mut(),
>          log: core::ptr::null_mut(),
> +        param_init: None,
> +        param_exit: None,
>      }
>  }
>
> @@ -226,6 +228,8 @@ pub const fn kunit_case_null() -> kernel::bindings::k=
unit_case {
>          status: kernel::bindings::kunit_status_KUNIT_SUCCESS,
>          module_name: core::ptr::null_mut(),
>          log: core::ptr::null_mut(),
> +        param_init: None,
> +        param_exit: None,
>      }
>  }
>
> --
> 2.51.0.rc0.205.g4a044479a3-goog
>
