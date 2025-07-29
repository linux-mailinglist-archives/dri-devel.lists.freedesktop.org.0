Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA76B15439
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 22:15:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97C4210E2BA;
	Tue, 29 Jul 2025 20:14:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="hnZSOcOf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B266310E2BA
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 20:14:58 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id
 6a1803df08f44-6fafdd322d3so59639586d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 13:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1753820097; x=1754424897;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OSnWvLIZJHusV5qXMM/Z1MPamN78DUoFkI8w/hNGO08=;
 b=hnZSOcOf1wptWE8uyAEe0fcGtbD2gCQNRfrGP5RiX7DuH6SOMStneKIJrmE0L4JhQg
 jyIbW6ku8J8yJUNDptR894gMoBc3A9pjDVUoWjnQtPfvLfPr0BrWrLnK0PDkZTDndBoD
 qTrD/z495Gh6uOBaIIBen0r9NS9Nuz5raUoJkahE5lW69VcZa7IK7V8JZlG7ilcubv/8
 M4Zst1pXDYoY+nyVrkGusZbR9VrVZUJY9BnJIEg72+t5LA/cdABXDWFGsLK8cvpayvPv
 q27mNHbch0Gliu3LVuAoRCVSwyaCtZtyN+L8GFTOpI0bW9OTCzY1Wr0KHOqpxBz3hKu3
 AEyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753820097; x=1754424897;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OSnWvLIZJHusV5qXMM/Z1MPamN78DUoFkI8w/hNGO08=;
 b=m+GhuQG+HolHj+XeXn3nKgjeSGHq4ZCWzxANPn4wu7YKcZFDqqAIXa182fJ4FBoCii
 y99DflFiDpLsjC2y+SZhZFwElllqAQUXYmILmoPmnIXDp6v/2OzeEBVMeXfwIQQT7Ph7
 0mOcwe0XKMv6U5eq25x7jk0tNWf81CK8ijb1fugBfaPDMvtQix+1eoQo40VxxjMF11fE
 og+Ny8uOr8Sem9s9zJojEuDdfF3ME1bfPtqcVTye+/D0RUK3Jf0K0h4S0AWZfUzzH+Vk
 WMPc4g7fpS8KffwH0H6aLwSw1Mxr7scucZzOvDRRmU79GDIa/p0XT4zY+QC47w37rFeN
 5A2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUk5JtvuFmWXwPWIOnTqZDDR7xdiT9qBItZ6iT2wDOQqzQvbvdyBSCnUO9LtdgMQfoQq2cj+aOLJk0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJLrtLpuM6Ui9i4UbO9wpMXIp2A72km5k6pTp+uwPrWggEDvMU
 hq0Mr7pH7cz06oY5PVXQL1/8/S+gFQ9rmTeM5wi2AiGLdhDYI+LlpHucMge2NdOYcY+kaL4wW2J
 lNYYikRkEx/CfUYNbtCO16BDzFKbswZYpnZS6zdWK
X-Gm-Gg: ASbGncu4gugzo6viwjcGi9tqv5GmCD3Sx1sbCKTC5LI47X+LmHL+8UWJgwyQWuD40bs
 XvteeXv3tGNaM4D5c8tdgk/AoZY3+JwMbMQm4KjNTYS+wEYGYxncN+oG1d8bR09xwrtHADbzgAC
 FQx89w8EZHUpufnc4QohZwiAt5ofKsgidR87DebYQPjgDc9o3hEzG9s8bqtCX0Z35eTlrPMykvE
 YbwCxqMY+9kbL3l5gkE2EzbeF3CJpSi/X+qaQ==
X-Google-Smtp-Source: AGHT+IFTlRxz8bhRH2+InlNKd90cbjwgmPzaVOKC+5lulLM0m6ZDEzL9t/t78Kn6O8P4iaKSdoYYr3M0esdfZabftc8=
X-Received: by 2002:ad4:5cae:0:b0:705:11dc:546c with SMTP id
 6a1803df08f44-707674da9c4mr12811666d6.37.1753820097172; Tue, 29 Jul 2025
 13:14:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250729193647.3410634-1-marievic@google.com>
 <20250729193647.3410634-7-marievic@google.com>
In-Reply-To: <20250729193647.3410634-7-marievic@google.com>
From: Rae Moar <rmoar@google.com>
Date: Tue, 29 Jul 2025 16:14:46 -0400
X-Gm-Features: Ac12FXxmZ42K4shP8Mq6epf9R75hJmaK1TQ-k_VZv48ddvB09KJQMcLmT_EDWjs
Message-ID: <CA+GJov7gQMughx7wR5J_BGqo7FaPhEPF-OHaCg3OuuL17X5vpA@mail.gmail.com>
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

Hello!

Thanks for sending out this series! I will do a full review of it. For
now, I noticed that I get an error when I try to run KUnit tests as
modules. I get the following error: "ERROR: modpost:
"kunit_get_next_param_and_desc" [lib/kunit/kunit-example-test.ko]
undefined!". As a possible fix, I suggest moving the function
definition into the header file and making it a static inline
function.

Thanks!
-Rae

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
>                         /* Non-parameterised test. */
>                         test_case->status =3D KUNIT_SKIPPED;
>                         kunit_run_case_catch_errors(suite, test_case, &te=
st);
> --
> 2.50.1.552.g942d659e1b-goog
>
