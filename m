Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0E9B1E8D6
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 15:01:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D37A010E92D;
	Fri,  8 Aug 2025 13:01:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="H76z+Tm5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6115110E92B
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 13:01:26 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-6154c7b3ee7so11316a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Aug 2025 06:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1754658085; x=1755262885;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=el10QOQEfFkF9p6pSruNEIfZL6m4W9xzMCWGyL33LoI=;
 b=H76z+Tm5MbzNhcxDuna1QGx4WRx/uzYsLNwCwBH637HdTQkFHVCNhLfgP/Ib20ar68
 c8eInMrKzK27hpgLKKazHzENFcTfOkOt81UUenpx1V+ScCoidmOTCqVSv9+34H32jQh4
 8vn2+ee2r+SEBDRarjkbzzF8hw8hIv2blvVepC8YvMy6aUg/P1XvZ2nRX5l3KyERBui2
 6VLUfhqNpmzDRoJ3HqgvY+4sAxtk8EDCzKJBO5zRv6c/1+AbpuX8LUoyWQzZoAH4E0sw
 VLw76ViRLLGsnPYMGXHBlLZfghdshJRr6rn7mNmBucvatC87o13HYkd3o4MP3mjeZsGu
 VAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754658085; x=1755262885;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=el10QOQEfFkF9p6pSruNEIfZL6m4W9xzMCWGyL33LoI=;
 b=guQDvAQkaf5HH5NmWx+0c5GbtQVyB7bqEW7u2lqrlEWpqTDer2f4Wk+3kP/eI7mmod
 l58mWeFNyZOVemDpl1e6i3kpnMt0PpBB5gf+GqEm74JsPYZmPIk1aYdRK8lvOKrabHzj
 THzj0og5LN9a84LK5FEvWwmLQ7z4XozIv53HA6lAmVK5BTS2hJrrZImIy3sGP/lwT/Km
 3Qq6KO17mJ8cG6kQ2ZrDDcVL54PucmZx5stlGn2B40kVAmPCfz4tXwuPFCu+e+MBK/hC
 CJ9lObvNyecynEFRt/VuJYB8sdKkKVdUjJUU7vHvoEM3l4Aq9aN6TN+gkLeFZH9hLWb2
 nu8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUywHVZ41S1Tnen4Pg8nZrYms/gsMDLHRvd/VOi4NXnq6hJpuiV9PNJedHJ5Cv4QXZgQKlNG98kdis=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8zVX3B+WuuRmbDwX2GcpGrkYV/4C7fgPdJ2VDlN2qgB++vOfI
 tgDFFkNyc2Z0NlzvjirleUuWNnhEQ4MvsPELolyt43YkLl9uOOOssVEnQQXIaKTZDn3ADthQmCa
 PJzQidP+Rl7GC6MxEjROcOMEx4CPTLDHM3KEwVgwr
X-Gm-Gg: ASbGnctCuN9RpUfzLfijt9O9SJTv+QJer1qLn3d+lH0lpQlEQXf8hoK398GdWP20esj
 osc4Jyw875DYSm9rOUophTD2W8+1tCb1yzciWv6z1f8NrS4xOwyPVKIpC9CMm1ep9qWpeWaByKX
 QU6iOkvRbQOszrcjpMmez5cOY2rIb96nLHI8Su7hwPtMDhqRln3dqbAWQNigZ3CwE3IHHDQWC5E
 fdtbCoY
X-Google-Smtp-Source: AGHT+IHtuiN9mDRQxccaUEGnFq3haaKpvRXvsbPz32ZppWzDXTwGOn/a0aI41FhPm9sgUkEKck1hcKgb1YiS54Za1Lw=
X-Received: by 2002:a05:6402:292f:b0:615:63af:84c7 with SMTP id
 4fb4d7f45d1cf-617e0c2fea6mr72212a12.0.1754658084244; Fri, 08 Aug 2025
 06:01:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250729193647.3410634-1-marievic@google.com>
 <20250729193647.3410634-3-marievic@google.com>
 <CA+GJov5R2GnBfxXR=28vS3F4b1E-=WLDXpgdJo0SpKAXb1dpsw@mail.gmail.com>
In-Reply-To: <CA+GJov5R2GnBfxXR=28vS3F4b1E-=WLDXpgdJo0SpKAXb1dpsw@mail.gmail.com>
From: Marie Zhussupova <marievic@google.com>
Date: Fri, 8 Aug 2025 09:01:11 -0400
X-Gm-Features: Ac12FXyqcN3QWXqYkDaIcNwJHxUBYobG5GbAMtvuIIACGkmsNKYyn--VKTTbYU0
Message-ID: <CAAkQn5JXHFRXRRfUCWZDi+d0mDvGsgKW0poWgj5XCJGz_YTw8w@mail.gmail.com>
Subject: Re: [PATCH 2/9] kunit: Introduce param_init/exit for parameterized
 test shared context management
To: Rae Moar <rmoar@google.com>
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

On Tue, Aug 5, 2025 at 11:18=E2=80=AFAM Rae Moar <rmoar@google.com> wrote:
>
> On Tue, Jul 29, 2025 at 3:37=E2=80=AFPM Marie Zhussupova <marievic@google=
.com> wrote:
> >
> > Add `param_init` and `param_exit` function pointers to
> > `struct kunit_case`. Users will be able to set them
> > via the new `KUNIT_CASE_PARAM_WITH_INIT` macro.
>
> Hello!
>
> Very intrigued by this idea to add an init and exit function for
> parameterized tests. In a way, this allows parameterized test series
> to act more like suites. Either way I am happy to see more flexibility
> being brought to the parameterized test framework.
>
> I have a few comments below that I would like to discuss before a
> final review. But this patch is looking good.
>
> Thanks!
> -Rae
>
> >
> > These functions are invoked by kunit_run_tests() once before
> > and once after the entire parameterized test series, respectively.
>
> This is a philosophical question but should we refer to a group of
> parameterized tests as a parameterized test series or a parameterized
> test suite? In the KTAP, the appearance is identical to a suite but in
> the running of the tests it acts distinct to a test case or suite.
> Curious on David's opinion here.
>

Thank you for bringing this up! Using the wording of the patch that
introduced the parameterized tests:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/l=
ib/kunit?id=3Dfadb08e7c7501ed42949e646c6865ba4ec5dd948,
"parameterized test" will refer to a group of parameterized tests and
"parameter run" will refer to a single parameter execution. I will also
specify this terminology in the docs for v2.

> > They will receive the parent kunit test instance, allowing users
> > to register and manage shared resources. Resources added to this
> > parent kunit test will be accessible to all individual parameterized
> > tests, facilitating init and exit for shared state.
> >
> > Signed-off-by: Marie Zhussupova <marievic@google.com>
> > ---
> >  include/kunit/test.h | 33 ++++++++++++++++++++++++++++++++-
> >  lib/kunit/test.c     | 23 ++++++++++++++++++++++-
> >  2 files changed, 54 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/kunit/test.h b/include/kunit/test.h
> > index a42d0c8cb985..d8dac7efd745 100644
> > --- a/include/kunit/test.h
> > +++ b/include/kunit/test.h
> > @@ -92,6 +92,8 @@ struct kunit_attributes {
> >   * @name:     the name of the test case.
> >   * @generate_params: the generator function for parameterized tests.
> >   * @attr:     the attributes associated with the test
> > + * @param_init: The init function to run before parameterized tests.
> > + * @param_exit: The exit function to run after parameterized tests.
>
> If we decide on a terminology for the parameterized test group, it
> might be clearer to label these "The init function to run before
> parameterized test [suite/series]." and same for the exit function.
>

Will update this in v2.

> >   *
> >   * A test case is a function with the signature,
> >   * ``void (*)(struct kunit *)``
> > @@ -129,6 +131,13 @@ struct kunit_case {
> >         const void* (*generate_params)(const void *prev, char *desc);
> >         struct kunit_attributes attr;
> >
> > +       /*
> > +        * Optional user-defined functions: one to register shared reso=
urces once
> > +        * before the parameterized test series, and another to release=
 them after.
> > +        */
> > +       int (*param_init)(struct kunit *test);
> > +       void (*param_exit)(struct kunit *test);
> > +
> >         /* private: internal use only. */
> >         enum kunit_status status;
> >         char *module_name;
> > @@ -218,6 +227,27 @@ static inline char *kunit_status_to_ok_not_ok(enum=
 kunit_status status)
> >                   .generate_params =3D gen_params,                     =
           \
> >                   .attr =3D attributes, .module_name =3D KBUILD_MODNAME=
}
> >
> > +/**
> > + * KUNIT_CASE_PARAM_WITH_INIT() - Define a parameterized KUnit test ca=
se with custom
> > + * init and exit functions.
> > + * @test_name: The function implementing the test case.
> > + * @gen_params: The function to generate parameters for the test case.
> > + * @init: The init function to run before parameterized tests.
> > + * @exit: The exit function to run after parameterized tests.
>
> If we do change the description above of param_init/param_exit, it
> might be nice to change it here too.
>

Will update this, as well.

> > + *
> > + * Provides the option to register init and exit functions that take i=
n the
> > + * parent of the parameterized tests and run once before and once afte=
r the
> > + * parameterized test series. The init function can be used to add any=
 resources
> > + * to share between the parameterized tests or to pass parameter array=
s. The
> > + * exit function can be used to clean up any resources that are not ma=
naged by
> > + * the test.
> > + */
> > +#define KUNIT_CASE_PARAM_WITH_INIT(test_name, gen_params, init, exit) =
         \
> > +               { .run_case =3D test_name, .name =3D #test_name,       =
             \
> > +                 .generate_params =3D gen_params,                     =
           \
> > +                 .param_init =3D init, .param_exit =3D exit,          =
             \
> > +                 .module_name =3D KBUILD_MODNAME}
> > +
> >  /**
> >   * struct kunit_suite - describes a related collection of &struct kuni=
t_case
> >   *
> > @@ -269,7 +299,8 @@ struct kunit_suite_set {
> >   * @priv: for user to store arbitrary data. Commonly used to pass data
> >   *       created in the init function (see &struct kunit_suite).
> >   * @parent: for user to store data that they want to shared across
> > - *         parameterized tests.
> > + *         parameterized tests. Typically, the data is provided in
> > + *         the param_init function (see &struct kunit_case).
> >   *
> >   * Used to store information about the current context under which the=
 test
> >   * is running. Most of this data is private and should only be accesse=
d
> > diff --git a/lib/kunit/test.c b/lib/kunit/test.c
> > index 4d6a39eb2c80..d80b5990d85d 100644
> > --- a/lib/kunit/test.c
> > +++ b/lib/kunit/test.c
> > @@ -641,6 +641,19 @@ static void kunit_accumulate_stats(struct kunit_re=
sult_stats *total,
> >         total->total +=3D add.total;
> >  }
> >
> > +static void __kunit_init_parent_test(struct kunit_case *test_case, str=
uct kunit *test)
>
> It would be nice to include "param" in this function name. Currently
> it sounds more like you are initializing the @parent field of struct
> kunit *test.

That is a great suggestion, I will incorporate it in v2.

>
> > +{
> > +       if (test_case->param_init) {
> > +               int err =3D test_case->param_init(test);
> > +
> > +               if (err) {
> > +                       kunit_err(test_case, KUNIT_SUBTEST_INDENT KUNIT=
_SUBTEST_INDENT
> > +                               "# failed to initialize parent paramete=
r test.");
> > +                       test_case->status =3D KUNIT_FAILURE;
> > +               }
> > +       }
> > +}
> > +
> >  int kunit_run_tests(struct kunit_suite *suite)
> >  {
> >         char param_desc[KUNIT_PARAM_DESC_SIZE];
> > @@ -668,6 +681,8 @@ int kunit_run_tests(struct kunit_suite *suite)
> >                 struct kunit_result_stats param_stats =3D { 0 };
> >
> >                 kunit_init_test(&test, test_case->name, test_case->log)=
;
> > +               __kunit_init_parent_test(test_case, &test);
> > +
>
> Is it possible to move this so this function is only called when it is
> a parameterized test? I see the check for KUNIT_FAILURE is useful but
> I think I would still prefer this within the section for parameterized
> tests.

Yes, I will do that, unless we decide to go with the route
to set generate_params to point to kunit_get_next_param_and_desc
in the __kunit_init_parent_test function.

>
> >                 if (test_case->status =3D=3D KUNIT_SKIPPED) {
> >                         /* Test marked as skip */
> >                         test.status =3D KUNIT_SKIPPED;
> > @@ -677,7 +692,7 @@ int kunit_run_tests(struct kunit_suite *suite)
> >                         test_case->status =3D KUNIT_SKIPPED;
> >                         kunit_run_case_catch_errors(suite, test_case, &=
test);
> >                         kunit_update_stats(&param_stats, test.status);
> > -               } else {
> > +               } else if (test_case->status !=3D KUNIT_FAILURE) {
> >                         /* Get initial param. */
> >                         param_desc[0] =3D '\0';
> >                         /* TODO: Make generate_params try-catch */
> > @@ -727,6 +742,12 @@ int kunit_run_tests(struct kunit_suite *suite)
> >
> >                 kunit_update_stats(&suite_stats, test_case->status);
> >                 kunit_accumulate_stats(&total_stats, param_stats);
> > +               /*
> > +                * TODO: Put into a try catch. Since we don't need suit=
e->exit
> > +                * for it we can't reuse kunit_try_run_cleanup for this=
 yet.
> > +                */
> > +               if (test_case->param_exit)
> > +                       test_case->param_exit(&test);
>
> Also here I am not sure why this is done outside of the check for if
> the test is parameterized? Either way this should definitely be done
> before the test stats and ok/not ok line are printed because if there
> is any log output during the param_exit function it is necessary to
> print that before the status line to identify that that log
> corresponds with that test.

Thank you for catching this! Yes, it should be inside the check for if
the test is parameterized.

>
> Also just curious why you chose to implement a function to perform the
> param_init but not the param_exit?

To be consistent with the existing style of "exit" functions in KUnit,
test->param_exit returns void. Therefore, similar to how it's done for
suite->suite_exit
(https://elixir.bootlin.com/linux/v6.16/source/lib/kunit/test.c#L685),
I didn't do extra error handling as the function itself doesn't
indicate an error and
therefore, didn't put it in a separate function. To do error handling
for it, it would
need to be in a try catch, then we could check if the cleanup timed out or
if there was an internal error.

>
>
>
> >                 /* TODO: Put this kunit_cleanup into a try-catch. */
> >                 kunit_cleanup(&test);
> >         }
> > --
> > 2.50.1.552.g942d659e1b-goog
> >
