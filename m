Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6ECFB1B74F
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 17:19:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EA2010E6AE;
	Tue,  5 Aug 2025 15:19:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="kXDBY74/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A03E10E6AE
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 15:19:18 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id
 6a1803df08f44-7074710a809so42687546d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Aug 2025 08:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1754407157; x=1755011957;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=il9Pck9IsIM62v468p0OkwRij0VejED4nE+yuVLG5G4=;
 b=kXDBY74/dI6PEEBOippzq78q//KAkyfUWFPxwZPpRCXrlwIaSp9/sUXGQKKyl+KBq9
 q9iB4BthYlmvVS/lTfoscK36rqCCcR8efLTgMEkerNlJizkpHjropxpAVLuJDQAWplun
 sNaI/QK73O0XPqOmiZJq2g85usyzTsAPFKUb8OiFZ2Z0YixOCLqfM/2pLCS5VW8xOv1F
 DfDRIHrnRx3h5zWLPxJzzU9uLe5ajkW5Ni9wC1gQn34AtIxYpS2tLcToRVN45ccbfq40
 z9D4ex2vqxwDfgk+ca9YPRSonN6Zi71++ch2STzgyrqDDdJXxABhAe2KA9adGqGlmVs9
 0cuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754407157; x=1755011957;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=il9Pck9IsIM62v468p0OkwRij0VejED4nE+yuVLG5G4=;
 b=HlbZyw62gUO7vRaYu9WUBfvkv52HJd1eT/rHNoHsOt7k24VDXOG2rTBAGXnuTpRTnA
 0AiCQgavwDBzF3Q8607UABIEB3C3ZqYQN630AnmjFyCApV+vvDMIacbXcKKegW6IEsb7
 Ww//9IM6eNoU23daHGuG5WY1igfnX8S0VylDNvGacve0gYPH4MatGZ47+CSXMzTzeuDa
 BmL8nWydQlUTaPN1x8BtAgb2phRiuVwFZXND+NiA66M1wrI6AnXgU0lO/0eAQtgz9mSc
 ICxjsCSVHAuAM6mL3rvpPBUbDkXVFl6M7AAKDmIITDQhVx+apAi+tWVEhHduI0/XJf1R
 qepQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZwxmtSDKgbLnxxSfN6EQpmPoKUYxLTVwbI7Vq+8XDR2uoz3/r0r6s3aOLJq/3S/fQY+SUJYywk1o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywt+J1ASqhXwzq+7ZPvVyw3ZRTm8bm5KUOecvtTswHCS87rOtFJ
 AfmA3ZM+CGgDm/mYmX2QD3J56N5EjscqDiVKcuO8dt4ukPFIQgs6KJV1d0Ivy+hh187QJnNG+/7
 PXzHY4Rg4BKfqXW9GOdh18LTHjam0c2MGXt//aTqh
X-Gm-Gg: ASbGncuv2czmGu/NAeHr52yVIJJlIskkCrVF1oB1QUiTtv50R3RGrEW4Zk1r7olkPHU
 gAhPSdiz3Swp5u6buHCqp1o7rcvHhHHHcjMhgtBqcjrLfJsJ58SKzLyW0SaBBFTcwFomS8BWkJy
 5XDCJGMt4QiCykpPV/GvB7KBx7GWU9hGsvt6uWFZHwZhVKPfQCzRG6WTDZfNL/If8l9ZY+a25+B
 dCjcqjqspRte8DOz3H53gKOeotMxjPz7Qo+7K5+Sw==
X-Google-Smtp-Source: AGHT+IHsPHBMzQ2/T8+siD5ic8hE3vwnW0tBzW28yvMlPYYQ19knnUB0dJX3KDeJvl8+vhnMuDUx4SWEm9004kjEUZI=
X-Received: by 2002:ad4:5b8f:0:b0:6fa:c81a:6231 with SMTP id
 6a1803df08f44-70935f3f099mr182696396d6.8.1754407156788; Tue, 05 Aug 2025
 08:19:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250729193647.3410634-1-marievic@google.com>
 <20250729193647.3410634-8-marievic@google.com>
In-Reply-To: <20250729193647.3410634-8-marievic@google.com>
From: Rae Moar <rmoar@google.com>
Date: Tue, 5 Aug 2025 11:19:05 -0400
X-Gm-Features: Ac12FXwIYISejq5E32R90mOlfU2aOU_svsUKJMC2HWJWPZDH6qlcqSczsSA0db4
Message-ID: <CA+GJov5gBEKDpB=fLwiP5VBjoMJLkDeEcPhfn=SEr+tLoYWHFA@mail.gmail.com>
Subject: Re: [PATCH 7/9] kunit: Add example parameterized test with shared
 resources and direct static parameter array setup
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
> Add `example_params_test_with_init` to illustrate how to manage
> shared resources across parameterized KUnit tests. This example
> showcases the use of the new `param_init` function and its registration
> to a test using the `KUNIT_CASE_PARAM_WITH_INIT` macro.
>
> Additionally, the test demonstrates:
> - How to directly assign a static parameter array to a test via
>   `kunit_register_params_array`.
> - Leveraging the Resource API for test resource management.
>
> Signed-off-by: Marie Zhussupova <marievic@google.com>

Hello!

I am always happy to see a new example test. I have a few tiny
nitpicky comments below. I would be happy for this to go in as-is or
just include the next test in the series as David suggested.

Reviewed-by: Rae Moar <rmoar@google.com>

Thanks!
-Rae

> ---
>  lib/kunit/kunit-example-test.c | 112 +++++++++++++++++++++++++++++++++
>  1 file changed, 112 insertions(+)
>
> diff --git a/lib/kunit/kunit-example-test.c b/lib/kunit/kunit-example-tes=
t.c
> index 3056d6bc705d..5bf559e243f6 100644
> --- a/lib/kunit/kunit-example-test.c
> +++ b/lib/kunit/kunit-example-test.c
> @@ -277,6 +277,116 @@ static void example_slow_test(struct kunit *test)
>         KUNIT_EXPECT_EQ(test, 1 + 1, 2);
>  }
>
> +/*
> + * This custom function allocates memory for the kunit_resource data fie=
ld.
> + * The function is passed to kunit_alloc_resource() and executed once
> + * by the internal helper __kunit_add_resource().
> + */

I don't think it is necessary to include that this function is
executed by an internal function: __kunit_add_resource(). Especially
since we have other example tests for the resource API.

> +static int example_resource_init(struct kunit_resource *res, void *conte=
xt)
> +{
> +       int *info =3D kmalloc(sizeof(*info), GFP_KERNEL);
> +
> +       if (!info)
> +               return -ENOMEM;
> +       *info =3D *(int *)context;
> +       res->data =3D info;
> +       return 0;
> +}
> +
> +/*
> + * This function deallocates memory for the 'kunit_resource' data field.
> + * The function is passed to kunit_alloc_resource() and automatically
> + * executes within kunit_release_resource() when the resource's referenc=
e
> + * count, via kunit_put_resource(), drops to zero. KUnit uses reference
> + * counting to ensure that resources are not freed prematurely.
> + */

Similarly, I think this is a bit too much information since we have
other tests for the resource API. I would maybe shorten this by
removing the references to kunit_release_resource() and
kunit_put_resource().

> +static void example_resource_free(struct kunit_resource *res)
> +{
> +       kfree(res->data);
> +}
> +
> +/*
> + * This match function is invoked by kunit_find_resource() to locate
> + * a test resource based on defined criteria. The current example
> + * uniquely identifies the resource by its free function; however,
> + * alternative custom criteria can be implemented. Refer to
> + * lib/kunit/platform.c and lib/kunit/static_stub.c for further examples=
.
> + */

Again I would consider shortening this description.



> +static bool example_resource_alloc_match(struct kunit *test,
> +                                        struct kunit_resource *res,
> +                                        void *match_data)
> +{
> +       return res->data && res->free =3D=3D example_resource_free;
> +}
> +
> +/*
> + * This is an example of a function that provides a description for each=
 of the
> + * parameters.
> + */
> +static void example_param_array_get_desc(const void *p, char *desc)
> +{
> +       const struct example_param *param =3D p;
> +
> +       snprintf(desc, KUNIT_PARAM_DESC_SIZE,
> +                "example check if %d is less than or equal to 3", param-=
>value);
> +}
> +
> +/*
> + * Initializes the parent kunit struct for parameterized KUnit tests.
> + * This function enables sharing resources across all parameterized
> + * tests by adding them to the `parent` kunit test struct. It also suppo=
rts
> + * registering either static or dynamic arrays of test parameters.
> + */
> +static int example_param_init(struct kunit *test)
> +{
> +       int ctx =3D 3; /* Data to be stored. */
> +       int arr_size =3D ARRAY_SIZE(example_params_array);
> +
> +       /*
> +        * This allocates a struct kunit_resource, sets its data field to
> +        * ctx, and adds it to the kunit struct's resources list. Note th=
at
> +        * this is test managed so we don't need to have a custom exit fu=
nction
> +        * to free it.
> +        */
> +       void *data =3D kunit_alloc_resource(test, example_resource_init, =
example_resource_free,
> +                                         GFP_KERNEL, &ctx);
> +
> +       if (!data)
> +               return -ENOMEM;
> +       /* Pass the static param array information to the parent struct k=
unit. */
> +       kunit_register_params_array(test, example_params_array, arr_size,
> +                                   example_param_array_get_desc);
> +       return 0;
> +}
> +
> +/*
> + * This is an example of a parameterized test that uses shared resources
> + * available from the struct kunit parent field of the kunit struct.
> + */
> +static void example_params_test_with_init(struct kunit *test)
> +{
> +       int threshold;
> +       struct kunit_resource *res;
> +       const struct example_param *param =3D test->param_value;
> +
> +       /* By design, param pointer will not be NULL. */
> +       KUNIT_ASSERT_NOT_NULL(test, param);
> +
> +       /* Here we access the parent pointer of the test to find the shar=
ed resource. */
> +       res =3D kunit_find_resource(test->parent, example_resource_alloc_=
match, NULL);
> +
> +       KUNIT_ASSERT_NOT_NULL(test, res);
> +
> +       /* Since the data field in kunit_resource is a void pointer we ne=
ed to typecast it. */
> +       threshold =3D *((int *)res->data);
> +
> +       /* Assert that the parameter is less than or equal to a certain t=
hreshold. */
> +       KUNIT_ASSERT_LE(test, param->value, threshold);
> +
> +       /* This decreases the reference count after calling kunit_find_re=
source(). */
> +       kunit_put_resource(res);
> +}
> +
>  /*
>   * Here we make a list of all the test cases we want to add to the test =
suite
>   * below.
> @@ -296,6 +406,8 @@ static struct kunit_case example_test_cases[] =3D {
>         KUNIT_CASE(example_static_stub_using_fn_ptr_test),
>         KUNIT_CASE(example_priv_test),
>         KUNIT_CASE_PARAM(example_params_test, example_gen_params),
> +       KUNIT_CASE_PARAM_WITH_INIT(example_params_test_with_init, NULL,
> +                                  example_param_init, NULL),
>         KUNIT_CASE_SLOW(example_slow_test),
>         {}
>  };
> --
> 2.50.1.552.g942d659e1b-goog
>
