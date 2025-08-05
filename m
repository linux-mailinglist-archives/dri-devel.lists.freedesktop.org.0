Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEB2B1B73B
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 17:17:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0EE310E27E;
	Tue,  5 Aug 2025 15:17:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="toJwPNFO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0903A10E27E
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 15:17:45 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-7074a74248dso50867826d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Aug 2025 08:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1754407065; x=1755011865;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7IXs2Kr/JIndnkNpfZSfduZvVHbFnK3EtPg4aqdOsRc=;
 b=toJwPNFOv/sklE63k5JvzGlh395OWdHcX75+5JHc7kjoHovcGknF/YNHa9LjejJcQv
 nSvGfoDp7HiM5htbSD3KP/PjOZWLlaoQfhPXmrYsDwWcKeGvx/sp01YZSsVzeBPkhKAy
 FMtJz0DuxSUilsqhsQMTz5/3IxTOUj4gPG5u5Jpm246WRppB2p7J6uFSyv1WFuH1QoOW
 QmAJh0GPf4XDj7S2JRnEX51fnQgMOLJCADPfU+963P8W2qv+1XtPGM3/V6jjIdMCsk9e
 jWh81S3p8YYifuMp+1wjqTvjqyCHYC/oUDFeYDMwPzeeOboZjff5TUnUeRL7LN4pxq92
 QKCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754407065; x=1755011865;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7IXs2Kr/JIndnkNpfZSfduZvVHbFnK3EtPg4aqdOsRc=;
 b=C1JPozlN75D7Uy/hhlzW97b4ZQFe6YYnUbM03jGTQCEelMfk0IWeRYRTSpsrdRbY49
 IFgyA+NHuGltJI+yStCjIiOGJ9rjM+MRhzc62vNeMon9m+iyaSUNlU5cbvHrAVoyxPz9
 V8+G2f+kyNHorlrqq0frHj48fsvvvWtqErZwfUCbGDS87N9GjKRMzywX2s2rNurrT/aN
 cf9tvZ99XWOmePzX3ykXck8f//NDdjtC5/X9uugrzYx2mRCKwx34mmVaI5eyu4IvyMxU
 EMrtNXMMRBC75DkyehKJ4Qeg+Wi4HNMNMtgdyVGQzVB/OYP9Zpy4NGzNszLVahCqHb8k
 RsvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXulRAaxg8YcQoBbQychsr2RnhjAdnNicjY2LxroPAcqVk2y1lSWyiYM6s6jX3WqpAmErEHZX1dKu8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAGWMdV+HRWs+8NqrdK6XR8zO6DpzoqqpXbG85GFSBF+YkskQa
 QqCf+RM+GAWd5P6v5p7ky8/DOl0bgZoRDaHofyTSnQgSiEZy8ieKZ0o/AWaO+chl14R08qgUDpo
 rh5Te7j0RV1Ne9if+SMSqoTU3dgX+wfnTFvpnTmJr
X-Gm-Gg: ASbGnctSIqFehrFId7rXDkQllH1NlDFOwDTMkhrl87HogjGA1hibaJHDdj4gKj9unxb
 xGpFG9VjLLXpiPUpYzWnDH0+GgPczv/0w9Nc4n4nwHdT2DUljYpW5JzPZNfNOIRllrT42xPG3lT
 vxOhbvNZ+Rg3qv0kT2xPyudZZOBWE4e2HliNiLFU9UPWZecpmDikw3oqRK2G+NKPuhB/+ojmJH2
 kC2z56FnQqxKQIW7quJPw/+f180j/dATkSpCcF+sA==
X-Google-Smtp-Source: AGHT+IHa9Nch2FIZBNvQFdt72fBtGdTNiWpLK+36OZqHE3rAqtd4pqYuQh8Gb7ugOeLVkjRMznl5Qph/PIQV3EAFD/c=
X-Received: by 2002:ad4:5765:0:b0:706:f753:6b1f with SMTP id
 6a1803df08f44-70935fb3038mr189139186d6.21.1754407064119; Tue, 05 Aug 2025
 08:17:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250729193647.3410634-1-marievic@google.com>
 <20250729193647.3410634-2-marievic@google.com>
In-Reply-To: <20250729193647.3410634-2-marievic@google.com>
From: Rae Moar <rmoar@google.com>
Date: Tue, 5 Aug 2025 11:17:33 -0400
X-Gm-Features: Ac12FXze3TaZ1ItJhvvsVg6J8U-v3wToEcNYmNz4bKxujCA6Thw0S4iJb4SdDqU
Message-ID: <CA+GJov4BQ1mRa-JaHoML+gF7rk=XY=hCRL+Shag6Aj6VbUgUeg@mail.gmail.com>
Subject: Re: [PATCH 1/9] kunit: Add parent kunit for parameterized test context
To: Marie Zhussupova <marievic@google.com>
Cc: davidgow@google.com, shuah@kernel.org, brendan.higgins@linux.dev, 
 elver@google.com, dvyukov@google.com, lucas.demarchi@intel.com, 
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 kasan-dev@googlegroups.com, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Tue, Jul 29, 2025 at 3:37=E2=80=AFPM Marie Zhussupova <marievic@google.c=
om> wrote:
>
> Currently, KUnit parameterized tests lack a mechanism
> to share resources across individual test invocations
> because the same `struct kunit` instance is reused for
> each test.
>
> This patch refactors kunit_run_tests() to provide each
> parameterized test with its own `struct kunit` instance.
> A new parent pointer is added to `struct kunit`, allowing
> individual parameterized tests to reference a shared
> parent kunit instance. Resources added to this parent
> will then be accessible to all individual parameter
> test executions.
>
> Signed-off-by: Marie Zhussupova <marievic@google.com>

Hello!

Thank you so much for sending out this series. I have wanted to see an
update of our parameterized test framework for a while. I have a few
comments below for this patch. But otherwise it is looking good.

Reviewed-by: Rae Moar <rmoar@google.com>

Thanks!
-Rae

> ---
>  include/kunit/test.h | 12 ++++++++++--
>  lib/kunit/test.c     | 32 +++++++++++++++++++-------------
>  2 files changed, 29 insertions(+), 15 deletions(-)
>
> diff --git a/include/kunit/test.h b/include/kunit/test.h
> index 39c768f87dc9..a42d0c8cb985 100644
> --- a/include/kunit/test.h
> +++ b/include/kunit/test.h
> @@ -268,14 +268,22 @@ struct kunit_suite_set {
>   *
>   * @priv: for user to store arbitrary data. Commonly used to pass data
>   *       created in the init function (see &struct kunit_suite).
> + * @parent: for user to store data that they want to shared across
> + *         parameterized tests.
>   *

As David mentioned, I would also prefer that this provides a more
general description of the @parent field here. Although this is
currently only used for parameterized tests, it could have other use
cases in the future.

>   * Used to store information about the current context under which the t=
est
>   * is running. Most of this data is private and should only be accessed
> - * indirectly via public functions; the one exception is @priv which can=
 be
> - * used by the test writer to store arbitrary data.
> + * indirectly via public functions; the two exceptions are @priv and @pa=
rent
> + * which can be used by the test writer to store arbitrary data or data =
that is
> + * available to all parameter test executions, respectively.

In addition, I would prefer that the call out to @parent here is also
changed to a more general description of the @parent field. However,
feel free to also include the description of the use case for the
parameterized tests.

>   */
>  struct kunit {
>         void *priv;
> +       /*
> +        * Reference to the parent struct kunit for storing shared resour=
ces
> +        * during parameterized testing.
> +        */

I am more 50/50 on changing this description. Could change it just to:
"Reference to the parent struct kunit for storing shared resources."

> +       struct kunit *parent;
>
>         /* private: internal use only. */
>         const char *name; /* Read only after initialization! */
> diff --git a/lib/kunit/test.c b/lib/kunit/test.c
> index f3c6b11f12b8..4d6a39eb2c80 100644
> --- a/lib/kunit/test.c
> +++ b/lib/kunit/test.c
> @@ -647,6 +647,7 @@ int kunit_run_tests(struct kunit_suite *suite)
>         struct kunit_case *test_case;
>         struct kunit_result_stats suite_stats =3D { 0 };
>         struct kunit_result_stats total_stats =3D { 0 };
> +       const void *curr_param;
>
>         /* Taint the kernel so we know we've run tests. */
>         add_taint(TAINT_TEST, LOCKDEP_STILL_OK);
> @@ -679,36 +680,39 @@ int kunit_run_tests(struct kunit_suite *suite)
>                 } else {
>                         /* Get initial param. */
>                         param_desc[0] =3D '\0';
> -                       test.param_value =3D test_case->generate_params(N=
ULL, param_desc);
> +                       /* TODO: Make generate_params try-catch */
> +                       curr_param =3D test_case->generate_params(NULL, p=
aram_desc);
>                         test_case->status =3D KUNIT_SKIPPED;
>                         kunit_log(KERN_INFO, &test, KUNIT_SUBTEST_INDENT =
KUNIT_SUBTEST_INDENT
>                                   "KTAP version 1\n");
>                         kunit_log(KERN_INFO, &test, KUNIT_SUBTEST_INDENT =
KUNIT_SUBTEST_INDENT
>                                   "# Subtest: %s", test_case->name);
>
> -                       while (test.param_value) {
> -                               kunit_run_case_catch_errors(suite, test_c=
ase, &test);
> +                       while (curr_param) {
> +                               struct kunit param_test =3D {
> +                                       .param_value =3D curr_param,
> +                                       .param_index =3D ++test.param_ind=
ex,
> +                                       .parent =3D &test,
> +                               };
> +                               kunit_init_test(&param_test, test_case->n=
ame, test_case->log);
> +                               kunit_run_case_catch_errors(suite, test_c=
ase, &param_test);
>
>                                 if (param_desc[0] =3D=3D '\0') {
>                                         snprintf(param_desc, sizeof(param=
_desc),
>                                                  "param-%d", test.param_i=
ndex);

This probably doesn't matter too much either way but should this be
param_test.param_index instead? This would cover the case where the
param_index is changed during the test run even though it shouldn't.

>                                 }
>
> -                               kunit_print_ok_not_ok(&test, KUNIT_LEVEL_=
CASE_PARAM,
> -                                                     test.status,
> -                                                     test.param_index + =
1,
> +                               kunit_print_ok_not_ok(&param_test, KUNIT_=
LEVEL_CASE_PARAM,
> +                                                     param_test.status,
> +                                                     param_test.param_in=
dex,
>                                                       param_desc,
> -                                                     test.status_comment=
);
> +                                                     param_test.status_c=
omment);
>
> -                               kunit_update_stats(&param_stats, test.sta=
tus);
> +                               kunit_update_stats(&param_stats, param_te=
st.status);
>
>                                 /* Get next param. */
>                                 param_desc[0] =3D '\0';
> -                               test.param_value =3D test_case->generate_=
params(test.param_value, param_desc);
> -                               test.param_index++;
> -                               test.status =3D KUNIT_SUCCESS;
> -                               test.status_comment[0] =3D '\0';
> -                               test.priv =3D NULL;
> +                               curr_param =3D test_case->generate_params=
(curr_param, param_desc);
>                         }
>                 }
>
> @@ -723,6 +727,8 @@ int kunit_run_tests(struct kunit_suite *suite)
>
>                 kunit_update_stats(&suite_stats, test_case->status);
>                 kunit_accumulate_stats(&total_stats, param_stats);
> +               /* TODO: Put this kunit_cleanup into a try-catch. */
> +               kunit_cleanup(&test);

I might be missing something here but why not do this cleanup before
the printing stage and only if the test was a parent param test?



>         }
>
>         if (suite->suite_exit)
> --
> 2.50.1.552.g942d659e1b-goog
>
