Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B27B23BD1
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 00:23:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8A1410E027;
	Tue, 12 Aug 2025 22:23:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="JEfkm/zt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1897F10E64D
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 22:23:57 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-70748a0e13dso43365406d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 15:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1755037436; x=1755642236;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rJnpYXsl8YxSyj1wYhStEbnRqv/Bs6CSw0kV2AlWC5o=;
 b=JEfkm/ztxkNkm7vNhN/AsBq3GIEk70AKDnaw0AGiztstFbuhwzTlnbC9zepqv8DqCp
 r6o9mql2sSzavRLh0STAZov2hp6OZMboQXx23q4HGwmClVekroKKWsX1uwFwCluAM6bJ
 mjxw/uRH3zCvt2Wr8cZDCJAxFrCqwzb9vjVxjKnNNd0hUs5P5Qqq74N5bOe2USBHuh19
 LQABv6JDYiY8ciWnBwHSt4A8dHvUmtZopKrye5GQaJf0qqra00GZLCAvRfhnw0KNEvvW
 GPm1P6HoXdneX6m4oAx261H9MLWvhaIr0ptQKwyeTm6biEJM5OMw3p9t7HNLa/l7fpzj
 hO4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755037436; x=1755642236;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rJnpYXsl8YxSyj1wYhStEbnRqv/Bs6CSw0kV2AlWC5o=;
 b=vTENKRKnUuFnLdsM15UoNwOog+qahVnX/rMjKwpLekzN0DkCsiwDcpbUH9sXH1nrQD
 AG38CRH9ParwR6AFIMg/gGqqEW8J1RDLDnhuy5nD02tbFz731/pU1tk43z8iPxwOH9NO
 lYGUp+PVUYob8lm/Ruxt6V6M3zWOVm9kJ5ikyKSRNtDKMhZK/EVBo3fqAagwOL6tMJk7
 XLyAd9oE4Y3D7PWNFbjxfcG+Lri1xWXsw0qa0f99vTwpmOsffmqVPAeD2svxnUz2msYK
 6lAE/GRMYBzZph5DqbNBPrvxJhbgdsxkG2qwHGisSZlDlWaua7Qa86yBrGk+2hRKga/V
 cxOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOotIWERfKY35Y3BFc29mNkCnw8AqpMiBTl9GSRmvnbtzk+M0TVjAjvUlMoPnKO8+pUFszQH5SMQ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx04+u8mMvBBfZdYGkQA07qNupswBpLmKX4i6X7jueU+rF3dYR2
 BbQ4SXOsD2+3s2YjfmtRfIxf7gY8/RY6dyumdLvH93Z14klxfjnTyA/VHYeyS3CQ/xklamYb2+t
 hOQjZj9EAazVcuroI52Qb8eragO9LzYGLQYJedKvn
X-Gm-Gg: ASbGnctHxn+S15HCsL9POjTwkR59EKLNpSvwlTWwrEbuiXDC40zG9jg9qXug8GMVJD9
 lHj51kZp6n+7awVO8UnK1fcOMGCAYFNaqsrn5yzgB9iMmUQwBfp4CWPfz81QcLyFBaPtzonx1KO
 ydbC01zdA5Q08uvHdWv3h0KC+wYGMerlTbRFLt7Warcq69MYXBtb3Bi8WD+6XAisUTe6oRgn8um
 GCyvqpD9jB31Gzn
X-Google-Smtp-Source: AGHT+IEwDSp+uAZx9i/O1h0v7kjf30A79uhDxEYqawlem4HdnxAi4uwKsQSOhZjOXxmJqsh0y9SqGZ4LhD+p2yZudVk=
X-Received: by 2002:ad4:5fc7:0:b0:707:616f:fff4 with SMTP id
 6a1803df08f44-709e87ed0c5mr12374106d6.10.1755037435662; Tue, 12 Aug 2025
 15:23:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250811221739.2694336-1-marievic@google.com>
 <20250811221739.2694336-7-marievic@google.com>
In-Reply-To: <20250811221739.2694336-7-marievic@google.com>
From: Rae Moar <rmoar@google.com>
Date: Tue, 12 Aug 2025 18:23:44 -0400
X-Gm-Features: Ac12FXxKNs5XUmU5widgmneS2GgZSAhi_XzG1wZdZRmg99Z9O_yPFEdmMws-MoU
Message-ID: <CA+GJov5uwE43RQwP96i617=dtZ0VAfVtrLu_DV863nhA2+4DmQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] kunit: Add example parameterized test with direct
 dynamic parameter array setup
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

On Mon, Aug 11, 2025 at 6:18=E2=80=AFPM Marie Zhussupova <marievic@google.c=
om> wrote:
>
> Introduce example_params_test_with_init_dynamic_arr(). This new
> KUnit test demonstrates directly assigning a dynamic parameter
> array, using the kunit_register_params_array() macro, to a
> parameterized test context.
>
> It highlights the use of param_init() and param_exit() for
> initialization and exit of a parameterized test, and their
> registration to the test case with KUNIT_CASE_PARAM_WITH_INIT().
>
> Signed-off-by: Marie Zhussupova <marievic@google.com>
> ---
>
> Changes in v2:
>
> - kunit_array_gen_params() is now explicitly passed to
>   KUNIT_CASE_PARAM_WITH_INIT() to be consistent with
>   the parameterized test being defined by the existence
>   of the generate_params() function.
> - param_init() was changed to output a log at the start
>   of a parameterized test.
> - The parameter array was changed to be allocated
>   using kunit_kmalloc_array(), a KUnit memory allocation
>   API, as that would be the preferred/easier method. To
>   still demonstrate a use of param_exit(), it now outputs
>   a log at the end of the parameterized test.
> - The comments and the commit message were changed to
>   reflect the parameterized testing terminology. See
>   the patch series cover letter change log for the
>   definitions.
>

Hi!

I am happy with these changes and I really like this test!

Happy to mark this as:
Reviewed-by: Rae Moar <rmoar@google.com>

Thanks!

-Rae

> ---
>  lib/kunit/kunit-example-test.c | 104 +++++++++++++++++++++++++++++++++
>  1 file changed, 104 insertions(+)
>
> diff --git a/lib/kunit/kunit-example-test.c b/lib/kunit/kunit-example-tes=
t.c
> index f2819ee58965..ff21511889a4 100644
> --- a/lib/kunit/kunit-example-test.c
> +++ b/lib/kunit/kunit-example-test.c
> @@ -393,6 +393,107 @@ static void example_params_test_with_init(struct ku=
nit *test)
>         kunit_put_resource(res);
>  }
>
> +/*
> + * Helper function to create a parameter array of Fibonacci numbers. Thi=
s example
> + * highlights a parameter generation scenario that is:
> + * 1. Not feasible to fully pre-generate at compile time.
> + * 2. Challenging to implement with a standard generate_params() functio=
n,
> + * as it only provides the previous parameter, while Fibonacci requires
> + * access to two preceding values for calculation.
> + */
> +static void *make_fibonacci_params(struct kunit *test, size_t seq_size)
> +{
> +       int *seq;
> +
> +       if (seq_size <=3D 0)
> +               return NULL;
> +       /*
> +        * Using kunit_kmalloc_array here ties the lifetime of the array =
to
> +        * the parameterized test i.e. it will get automatically cleaned =
up
> +        * by KUnit after the parameterized test finishes.
> +        */
> +       seq =3D kunit_kmalloc_array(test, seq_size, sizeof(int), GFP_KERN=
EL);
> +
> +       if (!seq)
> +               return NULL;
> +       if (seq_size >=3D 1)
> +               seq[0] =3D 0;
> +       if (seq_size >=3D 2)
> +               seq[1] =3D 1;
> +       for (int i =3D 2; i < seq_size; i++)
> +               seq[i] =3D seq[i - 1] + seq[i - 2];
> +       return seq;
> +}
> +
> +/*
> + * This is an example of a function that provides a description for each=
 of the
> + * parameters.
> + */
> +static void example_param_dynamic_arr_get_desc(struct kunit *test, const=
 void *p, char *desc)
> +{
> +       const int *fib_num =3D p;
> +
> +       snprintf(desc, KUNIT_PARAM_DESC_SIZE, "fibonacci param: %d", *fib=
_num);
> +}
> +
> +/*
> + * Example of a parameterized test param_init() function that registers =
a dynamic
> + * array of parameters.
> + */
> +static int example_param_init_dynamic_arr(struct kunit *test)
> +{
> +       size_t seq_size;
> +       int *fibonacci_params;
> +
> +       kunit_info(test, "initializing parameterized test\n");
> +
> +       seq_size =3D 6;
> +       fibonacci_params =3D make_fibonacci_params(test, seq_size);
> +
> +       if (!fibonacci_params)
> +               return -ENOMEM;
> +
> +       /*
> +        * Passes the dynamic parameter array information to the paramete=
rized test
> +        * context struct kunit. The array and its metadata will be store=
d in
> +        * test->parent->params_array. The array itself will be located i=
n
> +        * params_data.params.
> +        *
> +        * Note that you will need to pass kunit_array_gen_params() as th=
e
> +        * generator function to KUNIT_CASE_PARAM_WITH_INIT() when regist=
ering
> +        * a parameter array this route.
> +        */
> +       kunit_register_params_array(test, fibonacci_params, seq_size,
> +                                   example_param_dynamic_arr_get_desc);
> +       return 0;
> +}
> +
> +/*
> + * Example of a parameterized test param_exit() function that outputs a =
log
> + * at the end of the parameterized test. It could also be used for any o=
ther
> + * teardown logic.
> + */
> +static void example_param_exit_dynamic_arr(struct kunit *test)
> +{
> +       kunit_info(test, "exiting parameterized test\n");
> +}
> +
> +/*
> + * Example of test that uses the registered dynamic array to perform ass=
ertions
> + * and expectations.
> + */
> +static void example_params_test_with_init_dynamic_arr(struct kunit *test=
)
> +{
> +       const int *param =3D test->param_value;
> +       int param_val;
> +
> +       /* By design, param pointer will not be NULL. */
> +       KUNIT_ASSERT_NOT_NULL(test, param);
> +
> +       param_val =3D *param;
> +       KUNIT_EXPECT_EQ(test, param_val - param_val, 0);
> +}
> +
>  /*
>   * Here we make a list of all the test cases we want to add to the test =
suite
>   * below.
> @@ -414,6 +515,9 @@ static struct kunit_case example_test_cases[] =3D {
>         KUNIT_CASE_PARAM(example_params_test, example_gen_params),
>         KUNIT_CASE_PARAM_WITH_INIT(example_params_test_with_init, kunit_a=
rray_gen_params,
>                                    example_param_init, NULL),
> +       KUNIT_CASE_PARAM_WITH_INIT(example_params_test_with_init_dynamic_=
arr,
> +                                  kunit_array_gen_params, example_param_=
init_dynamic_arr,
> +                                  example_param_exit_dynamic_arr),
>         KUNIT_CASE_SLOW(example_slow_test),
>         {}
>  };
> --
> 2.51.0.rc0.205.g4a044479a3-goog
>
