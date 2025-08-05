Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC57B1B748
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 17:18:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9226510E6AF;
	Tue,  5 Aug 2025 15:18:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="0d22eYns";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EAA310E6B2
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 15:18:55 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id
 6a1803df08f44-7094f298dc3so20392006d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Aug 2025 08:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1754407134; x=1755011934;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7HJX1dAULQPf05eofh/qdij5Fv1pcs+BHpuoBOdIhSk=;
 b=0d22eYnsXASkK9peMihdiMLDuh94htVh7l0sGFEjZvHOqeeq8pu780Oic+4aKPJXFo
 lspmQS8Qp+jbw3yCwy5gvVnk1EiNYRHFfFMjRDn0eTq7v+NvMI5gt4LVlcLF+6VkGZvx
 j1PfNFKqg6XxlrJ0s3dgoHZIBKGS3/Ogm7xmKwBQWvS4FMcB5UuXZ0pGJSIA2Ckafl26
 hsh974LiQxA3HuAb3W1R2MaK0gRXBXP7138DOi/3Mbrgh7szk6SBER/PrbFHN0yYKoLe
 comMTb4aXweMf4p0W5t18Fe9WeX8PyHxInTE6IpAM3qyXroKes7fhlS7kkfkcl/NeBJ0
 pQ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754407134; x=1755011934;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7HJX1dAULQPf05eofh/qdij5Fv1pcs+BHpuoBOdIhSk=;
 b=bg/B47nuDwTOjXgWHTNTv0IV/9b5qR84qm6v5rkWqPr4Xrm+Yn7kDbjsZe6Q3ogbXM
 mUKz71WVPKlqyvgJ08RQR3RB5IaJuMQnCELYvoC8gjOtQLclWYsntNyCMKp0hD0E52sD
 +81DbYDeun/t+om7fAcVaOmy7rTYAMlRGcVvC5yGfcoGWcWjgcZoMT1fnF23IxCQuuXj
 19VuFRzOIu9e1VX5tajdbt3DmcSBlOtcytK7zeRTV9iNLeZEvwZXxrEj/F2F3Xxj7S8M
 s6QulCG9q7oUc/RQ0FCA3sdrrgzj3nl6ffSwc3mbTvkL2hT8obOsRLxrV0EtHiVNJc1O
 mYmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdLRy6uNv2ZChukvGNClo7p3yhec8hzpYONl+UQJI7387UFXLxdOtCg/pSHQCkhOufhwkZJZFUA1c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyu8TPPXkkgQQ/6xkVt5p95kPh8JTnOlNZ3DYde5ctHwMlP1Tj8
 eVMFNJ2GscJ1rzvK+aSkWPSzYIfSuH0ZZYee4E2yR5B2raFku3ol3oLxWoYdOb3cSLIfBDEw/Iq
 iBUDlHuY34dQPLa+yYkChBNvEFhddmG1Ny3pCbACV
X-Gm-Gg: ASbGncuIjzRnQumqprUU1rXR8mENTuA0j6WSqscyclbXzEalEI08IiOHz4VHW+Jtas/
 /w1779QGLB/3eyrLtf9iaRTILLPLD/s3mKd56ZDpLcQ3ZOMA2JvFml66KoxCFxqUARVdLn41j8C
 DRiF4npm2ZpUZZlcmAvABqWbfTMCyLQAN9pCZ0OlsKtEVWLOoUyWBob/NnRE4q2iX1W+Kc8Beqn
 7pavzg0LxPktNBC6wafCZRvaWYLEG1BjxpCVS1amFkeyaurcTuD
X-Google-Smtp-Source: AGHT+IGHJ5ef3IdUmvMY9Fai1WqvGC6EwXd/7iqbQ3HePEHnMcL7VbSWYRyb7kh7CFv5QoeLBBHPdXjnPeiP55uJDC8=
X-Received: by 2002:a05:6214:262b:b0:707:4539:5183 with SMTP id
 6a1803df08f44-70935ea93cfmr185305046d6.5.1754407133193; Tue, 05 Aug 2025
 08:18:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250729193647.3410634-1-marievic@google.com>
 <20250729193647.3410634-7-marievic@google.com>
In-Reply-To: <20250729193647.3410634-7-marievic@google.com>
From: Rae Moar <rmoar@google.com>
Date: Tue, 5 Aug 2025 11:18:42 -0400
X-Gm-Features: Ac12FXxnJBB1YWr-XbyGzOFY7Eh7XZaJzVBa5N68AZZyN0_GMOzIt18D0BHtBBQ
Message-ID: <CA+GJov7AH5Qyiaua7LKZjVNRoUd==DiSXvd1UP7TcSzvn5JZtQ@mail.gmail.com>
Subject: Re: [PATCH 6/9] kunit: Enable direct registration of parameter arrays
 to a KUnit test
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
> KUnit parameterized tests currently support two
> primary methods for getting parameters:
> 1.  Defining custom logic within a `generate_params`
>     function.
> 2.  Using the KUNIT_ARRAY_PARAM and KUNIT_ARRAY_PARAM_DESC
>     macros with pre-defined static arrays.
>
> These methods present limitations when dealing with
> dynamically generated parameter arrays, or in scenarios
> where populating parameters sequentially via
> `generate_params` is inefficient or overly complex.
>
> This patch addresses these limitations by adding a new
> `params_data` field to `struct kunit`, of the type
> `kunit_params`. The struct `kunit_params` is designed to
> store the parameter array itself, along with essential metadata
> including the parameter count, parameter size, and a
> `get_description` function for providing custom descriptions
> for individual parameters.
>
> The `params_data` field can be populated by calling the new
> `kunit_register_params_array` macro from within a
> `param_init` function. By attaching the parameter array
> directly to the parent kunit test instance, these parameters
> can be iterated over in kunit_run_tests() behind the scenes.
>
> This modification provides greater flexibility to the
> KUnit framework, allowing testers to easily register and
> utilize both dynamic and static parameter arrays.
>
> Signed-off-by: Marie Zhussupova <marievic@google.com>

Hello!

Very excited by the prospect of setting up an array dynamically
instead of statically for parameterized tests. In general, I am happy
to see this framework is becoming more flexible and therefore more
tailored to our test author's needs.

I already commented on the modpost error but I have a few more
comments and ideas below. Let me know what you think.

Thanks!
-Rae

> ---
>  include/kunit/test.h | 54 ++++++++++++++++++++++++++++++++++++++++----
>  lib/kunit/test.c     | 26 ++++++++++++++++++++-
>  2 files changed, 75 insertions(+), 5 deletions(-)
>
> diff --git a/include/kunit/test.h b/include/kunit/test.h
> index 4ba65dc35710..9143f0e22323 100644
> --- a/include/kunit/test.h
> +++ b/include/kunit/test.h
> @@ -245,7 +245,8 @@ static inline char *kunit_status_to_ok_not_ok(enum ku=
nit_status status)
>   */
>  #define KUNIT_CASE_PARAM_WITH_INIT(test_name, gen_params, init, exit)   =
       \
>                 { .run_case =3D test_name, .name =3D #test_name,         =
           \
> -                 .generate_params =3D gen_params,                       =
         \
> +                 .generate_params =3D (gen_params)                      =
         \
> +                  ?: kunit_get_next_param_and_desc,                     =
       \
>                   .param_init =3D init, .param_exit =3D exit,            =
           \
>                   .module_name =3D KBUILD_MODNAME}
>
> @@ -294,6 +295,21 @@ struct kunit_suite_set {
>         struct kunit_suite * const *end;
>  };
>
> +/* Stores the pointer to the parameter array and its metadata. */
> +struct kunit_params {
> +       /*
> +        * Reference to the parameter array for the parameterized tests. =
This
> +        * is NULL if a parameter array wasn't directly passed to the
> +        * parent kunit struct via the kunit_register_params_array macro.
> +        */
> +       const void *params;
> +       /* Reference to a function that gets the description of a paramet=
er. */
> +       void (*get_description)(const void *param, char *desc);
> +
> +       int num_params;

Since in some cases we know the number of params within a series/suite
of the parameterized tests, is it possible for us to print a test plan
line in KTAP when this number is known? This would be helpful for
reading test results but also the parser could verify the number of
subtests is the number expected.

> +       size_t elem_size;
> +};
> +
>  /**
>   * struct kunit - represents a running instance of a test.
>   *
> @@ -302,12 +318,14 @@ struct kunit_suite_set {
>   * @parent: for user to store data that they want to shared across
>   *         parameterized tests. Typically, the data is provided in
>   *         the param_init function (see &struct kunit_case).
> + * @params_data: for users to directly store the parameter array.
>   *
>   * Used to store information about the current context under which the t=
est
>   * is running. Most of this data is private and should only be accessed
> - * indirectly via public functions; the two exceptions are @priv and @pa=
rent
> - * which can be used by the test writer to store arbitrary data or data =
that is
> - * available to all parameter test executions, respectively.
> + * indirectly via public functions. There are three exceptions to this: =
@priv,
> + * @parent, and @params_data. These members can be used by the test writ=
er to
> + * store arbitrary data, data available to all parameter test executions=
, and
> + * the parameter array, respectively.
>   */
>  struct kunit {
>         void *priv;
> @@ -316,6 +334,8 @@ struct kunit {
>          * during parameterized testing.
>          */
>         struct kunit *parent;
> +       /* Stores the params array and all data related to it. */
> +       struct kunit_params params_data;

I might slightly prefer the term params_array rather than params_data.
Up to what you prefer.

>
>         /* private: internal use only. */
>         const char *name; /* Read only after initialization! */
> @@ -386,6 +406,8 @@ void kunit_exec_list_tests(struct kunit_suite_set *su=
ite_set, bool include_attr)
>  struct kunit_suite_set kunit_merge_suite_sets(struct kunit_suite_set ini=
t_suite_set,
>                 struct kunit_suite_set suite_set);
>
> +const void *kunit_get_next_param_and_desc(struct kunit *test, const void=
 *prev, char *desc);
> +
>  #if IS_BUILTIN(CONFIG_KUNIT)
>  int kunit_run_all_tests(void);
>  #else
> @@ -1735,6 +1757,30 @@ do {                                              =
                              \
>                 return NULL;                                             =
                       \
>         }
>
> +/**
> + * kunit_register_params_array() - Register parameters for a KUnit test.
> + * @test: The KUnit test structure to which parameters will be added.
> + * @params_arr: An array of test parameters.
> + * @param_cnt: Number of parameters.
> + * @get_desc: A pointer to a function that generates a string descriptio=
n for
> + * a given parameter element.
> + *
> + * This macro initializes the @test's parameter array data, storing info=
rmation
> + * including the parameter array, its count, the element size, and the p=
arameter
> + * description function within `test->params_data`. KUnit's built-in
> + * `kunit_get_next_param_and_desc` function will automatically read this
> + * data when a custom `generate_params` function isn't provided.
> + */
> +#define kunit_register_params_array(test, params_arr, param_cnt, get_des=
c)                     \

I also might slightly prefer params_array and param_count here instead
of params_arr and param_cnt. Again this is definitely a nitpick so up
to you.

> +       do {                                                             =
                       \
> +               struct kunit *_test =3D (test);                          =
                 \
> +               const typeof((params_arr)[0]) * _params_ptr =3D &(params_=
arr)[0];                 \
> +               _test->params_data.params =3D _params_ptr;               =
                         \
> +               _test->params_data.num_params =3D (param_cnt);           =
                         \
> +               _test->params_data.elem_size =3D sizeof(*_params_ptr);   =
                         \
> +               _test->params_data.get_description =3D (get_desc);       =
                         \
> +       } while (0)
> +
>  // TODO(dlatypov@google.com): consider eventually migrating users to exp=
licitly
>  // include resource.h themselves if they need it.
>  #include <kunit/resource.h>
> diff --git a/lib/kunit/test.c b/lib/kunit/test.c
> index f50ef82179c4..2f4b7087db3f 100644
> --- a/lib/kunit/test.c
> +++ b/lib/kunit/test.c
> @@ -337,6 +337,13 @@ void __kunit_do_failed_assertion(struct kunit *test,
>  }
>  EXPORT_SYMBOL_GPL(__kunit_do_failed_assertion);
>
> +static void __kunit_init_params(struct kunit *test)
> +{
> +       test->params_data.params =3D NULL;
> +       test->params_data.num_params =3D 0;
> +       test->params_data.elem_size =3D 0;
> +}
> +
>  void kunit_init_test(struct kunit *test, const char *name, struct string=
_stream *log)
>  {
>         spin_lock_init(&test->lock);
> @@ -347,6 +354,7 @@ void kunit_init_test(struct kunit *test, const char *=
name, struct string_stream
>                 string_stream_clear(log);
>         test->status =3D KUNIT_SUCCESS;
>         test->status_comment[0] =3D '\0';
> +       __kunit_init_params(test);
>  }
>  EXPORT_SYMBOL_GPL(kunit_init_test);
>
> @@ -641,6 +649,22 @@ static void kunit_accumulate_stats(struct kunit_resu=
lt_stats *total,
>         total->total +=3D add.total;
>  }
>
> +const void *kunit_get_next_param_and_desc(struct kunit *test, const void=
 *prev, char *desc)
> +{
> +       struct kunit_params *params_arr =3D &test->params_data;
> +       const void *param;
> +
> +       if (test->param_index < params_arr->num_params) {
> +               param =3D (char *)params_arr->params
> +                       + test->param_index * params_arr->elem_size;
> +
> +               if (params_arr->get_description)
> +                       params_arr->get_description(param, desc);
> +               return param;
> +       }
> +       return NULL;
> +}

I also agree with David that it should definitely be considered: 1 -
whether to utilize struct kunit_params for the case of using
KUNIT_ARRAY_PARAM and 2 - whether the user should actively input this
function instead of setting generate_params to NULL.

Another idea that just popped into my head is if we have access to
struct kunit* test now in all of the generate_params functions,
instead of setting a "desc" could we just set the test->name field?

> +
>  static void __kunit_init_parent_test(struct kunit_case *test_case, struc=
t kunit *test)
>  {
>         if (test_case->param_init) {
> @@ -687,7 +711,7 @@ int kunit_run_tests(struct kunit_suite *suite)
>                         /* Test marked as skip */
>                         test.status =3D KUNIT_SKIPPED;
>                         kunit_update_stats(&param_stats, test.status);
> -               } else if (!test_case->generate_params) {
> +               } else if (!test_case->generate_params && !test.params_da=
ta.params) {

I agree with David that it is helpful to have one check for whether a
test is a parameterized test rather than two. My instinct is that if
test_case->generate_params is NULL it should be safe to assume the
test isn't a parameterized test.

However, as an alternative or even as a helpful addition, I like the
idea of a simple kunit_test_is_param function that can pass in the
test and it will return a bool whether the test is parameterized or
not.




>                         /* Non-parameterised test. */
>                         test_case->status =3D KUNIT_SKIPPED;
>                         kunit_run_case_catch_errors(suite, test_case, &te=
st);
> --
> 2.50.1.552.g942d659e1b-goog
>
