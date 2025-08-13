Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34443B24529
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 11:18:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD9710E6B9;
	Wed, 13 Aug 2025 09:18:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="dmwAD28b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8486D10E6AA
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 09:18:19 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-707365f4d47so7261316d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 02:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1755076698; x=1755681498;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rSEoFGd2nYol5KbybLtGinv5LqA/81xt4ihwZ4duCJ4=;
 b=dmwAD28b+ZXXr/XkCuUmz36JHwWYB/gLZu6kX1LQGopizxxg3CEXr+MtNA9uY/RTm8
 EnnScE6l+gkNZ68zXvMG+oc/WqB5MMDLYjyQG+skZwiDZa32CO5OUngBNXUGtNFB1+7G
 cXF/m+FUS0n4dRlmEpVos98cB+0ZnsOCeou8qhuPmaS6f6EmD925iPX7Ams318vy/4M3
 V7fe1jDdB5ydtJL7yxaHPmV5TufUV7x5zhCxqRsB+TmTrgxSCG+Yna9SRI1WnRTefV2O
 s8mVM25lyIZT824LEqZmYqlzLMiNQG/D0eFuPk7tiSt71yi1Z3Mw82SD1PEysw3hIYHX
 k//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755076698; x=1755681498;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rSEoFGd2nYol5KbybLtGinv5LqA/81xt4ihwZ4duCJ4=;
 b=Db0RccJD21dhI4BIom4VT19ZpWczo81gH/TfCLUHmdNpQ+79ht83xU14oJDqkyK/Bp
 7sFxVB0POsONdEcg/WLWlZ57GGgeRju8SuUDOAzEj4i7sM833X1PtXQcToSXsJLNTIc+
 RGpxX3orRgMUqFdqHfSQIyqKJk+qwvX5/s+5LJ+hoNuKsV8mYXUna5J/tJgDA7DJBpZV
 +LPVFKjJyqgHsa0zaJUOOVISwikK8He6BOnWosW5UAvfkbXb5/r8Ea74XRxnKrjvwO8y
 OOSVKPmH0/SK2/yo70tBqKiiEd/FQ23Zcq8Fq93mwzJVSc5q48LP4tSm3wj+ZyDCjRJJ
 W6yA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5o3zkc2hH261zdS0cuoClQYprPciTzQ7jTZjrQDwAFJfP9uibceTH83XYWVs2t1lrKVbrSSklheg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhsD5mq7BNcKlkPx64Y1pu2CBGpn0LqTW8jwvIADXs7dUvh6rw
 jGZs7Y5ruJlYqSsVTCyBMMFXsITP+fv5zMpHaMUxf0kQ5aCDsS+7ADq0pbfjhpYH03HFW6NAaCF
 uq0gZm88vn8bT9aj2er3CRatxroXYynyF4gPFfyN7
X-Gm-Gg: ASbGnct1ueKYLTkYKgX0LP6Z76kqRE4mUeKP/GIPgwLTeQRf0NbCUs+vQpnbQnBmwaZ
 n26zxf200yMGD+OGYUsj3FcLrVhMYbtxNKKQiEWpBR/+rvzRFfS2yhx5u91bDIpEloymd2frce3
 pF0j6O6Qt36lYDPb40A2HFzO7xRZsjXth4F/eObqPCwBy2M5TP495r3VDugkH4pxA1Zmq0Ny0rm
 6hhedz2kJdwapeolHQ=
X-Google-Smtp-Source: AGHT+IEeQI7ZIlE7SEWX0NAMXpfanLONqzQqwrs9p3GUvXz8wiNg/kZW+kWWAtqd7AXRH6wkw0CBeGZ4I+WDtpPS5vk=
X-Received: by 2002:a05:6214:d09:b0:709:ddc9:92d8 with SMTP id
 6a1803df08f44-709eb17338amr18931076d6.13.1755076697842; Wed, 13 Aug 2025
 02:18:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250811221739.2694336-1-marievic@google.com>
 <20250811221739.2694336-8-marievic@google.com>
In-Reply-To: <20250811221739.2694336-8-marievic@google.com>
From: David Gow <davidgow@google.com>
Date: Wed, 13 Aug 2025 17:18:05 +0800
X-Gm-Features: Ac12FXxvvJlx1eZOuftdGE8PhRFlmkDzmfXES8PCzqHh5ow__SKbFgSym6RCG1Y
Message-ID: <CABVgOSnueVgb1zmJwTThduizPLvtqXGdgyNX7FCEe6LetxqANA@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] Documentation: kunit: Document new parameterized
 test features
To: Marie Zhussupova <marievic@google.com>
Cc: rmoar@google.com, shuah@kernel.org, brendan.higgins@linux.dev, 
 mark.rutland@arm.com, elver@google.com, dvyukov@google.com, 
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com, 
 rodrigo.vivi@intel.com, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, kasan-dev@googlegroups.com, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="0000000000003170fd063c3ba327"
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

--0000000000003170fd063c3ba327
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Aug 2025 at 06:18, Marie Zhussupova <marievic@google.com> wrote:
>
> This patch updates the KUnit docs to show how to use the new
> parameterized test context to share resources
> between parameter runs. It documents and show examples
> of different ways the test user can pass parameter
> arrays to a parameterized test. Finally, it specifies the
> parameterized testing terminology.
>
> Signed-off-by: Marie Zhussupova <marievic@google.com>
> ---

Thanks very much: I think this is a definite improvement.

I've added some notes below, but I won't be offended if you don't like
my suggestions.

Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David

>
> Changes in v2:
>
> - The documentation was updated to establish the parameterized
>   testing terminology and reflect all the patch series changes.
> - The references to other parts of the KUnit Documentation were
>   not changed from being "Documentation/dev-tools/kunit/api/test.rst"
>   to ":ref:`kunit-resource`" links as originally planned. This is
>   because the existing way shows up as a link to a webpage and it
>   would be hard for people reading the documentation as an .rst
>   file to find the referred section without having the file path.
> - The code examples were made more concise.
> - Minor edits to titles and formatting.
>
> ---
>  Documentation/dev-tools/kunit/usage.rst | 342 +++++++++++++++++++++++-
>  1 file changed, 336 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/dev-tools/kunit/usage.rst b/Documentation/dev-tools/kunit/usage.rst
> index 066ecda1dd98..b236bb07aaca 100644
> --- a/Documentation/dev-tools/kunit/usage.rst
> +++ b/Documentation/dev-tools/kunit/usage.rst
> @@ -542,11 +542,29 @@ There is more boilerplate code involved, but it can:
>  Parameterized Testing
>  ~~~~~~~~~~~~~~~~~~~~~
>
> -The table-driven testing pattern is common enough that KUnit has special
> -support for it.
> -
> -By reusing the same ``cases`` array from above, we can write the test as a
> -"parameterized test" with the following.
> +To run a test case against multiple inputs, KUnit provides a parameterized
> +testing framework. This feature formalizes and extends the concept of
> +table-driven tests discussed previously. A KUnit test is determined to be
> +parameterized if a parameter generator function is provided when registering
> +the test case.

I'd possibly split the last sentence out into its own paragraph (and
maybe expand it a little to mention that this can be either
user-written, or a standard KUnit one can be used instead). And maybe
mention that it lives in kunit_case->generate_params, and can be set
by one of the macros mentioned below.


> +
> +To establish the terminology, "parameterized test" refers to the group of all
> +runs of a single test function with different parameters. "Parameter run" refers
> +to the execution of the test case function with a single parameter.
> +"Parameterized test context" is the ``struct kunit`` that holds the
> +context for the entire parameterized test. Finally, "parameter run context" is
> +the ``struct kunit`` that holds the context of the individual parameter run.

I think this bit is a little clunky: we could probably simplify it by
just saying something like "a 'parameterized test' is a test which is
run multple times (once per 'parameter' or 'parameter run'). Each
parameter run has both its own independent struct kunit (the
"parameter run context") and access to a shared parent struct kunit
(the "parameterized test context")."

But it's not wrong as-is, so if you'd rather not change it, that's fine by me.

> +
> +Passing Parameters to a Test
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Annoyingly, this level of heading is pretty indistinguishable from
body text in the current kernel theme. Still, it's definitely
registered as a heading (and has the anchor link, et al), so it's
fine. Maybe something to think about for future theme changes, though.

> +There are three ways to provide the parameters to a test:
> +
> +Array Parameter Macros:
> +
> +   KUnit provides special support for the common table-driven testing pattern.
> +   By applying either ``KUNIT_ARRAY_PARAM`` or ``KUNIT_ARRAY_PARAM_DESC`` to the
> +   ``cases`` array from the previous section, we can create a parameterized test
> +   as shown below:
>
>  .. code-block:: c
>
> @@ -555,7 +573,7 @@ By reusing the same ``cases`` array from above, we can write the test as a
>                 const char *str;
>                 const char *sha1;
>         };
> -       const struct sha1_test_case cases[] = {
> +       static const struct sha1_test_case cases[] = {
>                 {
>                         .str = "hello world",
>                         .sha1 = "2aae6c35c94fcfb415dbe95f408b9ce91ee846ed",
> @@ -590,6 +608,318 @@ By reusing the same ``cases`` array from above, we can write the test as a
>                 {}
>         };
>
> +Custom Parameter Generator Function:
> +
> +   The generator function is responsible for generating parameters one-by-one
> +   and has the following signature:
> +   ``const void* (*)(struct kunit *test, const void *prev, char *desc)``.
> +   You can pass the generator function to the ``KUNIT_CASE_PARAM``
> +   or ``KUNIT_CASE_PARAM_WITH_INIT`` macros.
> +
> +   The function receives the previously generated parameter as the ``prev`` argument
> +   (which is ``NULL`` on the first call) and can also access the parameterized
> +   test context passed as the ``test`` argument. KUnit calls this function
> +   repeatedly until it returns ``NULL``, which signifies that a parameterized
> +   test ended.
> +
> +   Below is an example of how it works:
> +
> +.. code-block:: c
> +
> +       #define MAX_TEST_BUFFER_SIZE 8
> +
> +       // Example generator function. It produces a sequence of buffer sizes that
> +       // are powers of two, starting at 1 (e.g., 1, 2, 4, 8).
> +       static const void *buffer_size_gen_params(struct kunit *test, const void *prev, char *desc)
> +       {
> +               long prev_buffer_size = (long)prev;
> +               long next_buffer_size = 1; // Start with an initial size of 1.
> +
> +               // Stop generating parameters if the limit is reached or exceeded.
> +               if (prev_buffer_size >= MAX_TEST_BUFFER_SIZE)
> +                       return NULL;
> +
> +               // For subsequent calls, calculate the next size by doubling the previous one.
> +               if (prev)
> +                       next_buffer_size = prev_buffer_size << 1;
> +
> +               return (void *)next_buffer_size;
> +       }
> +
> +       // Simple test to validate that kunit_kzalloc provides zeroed memory.
> +       static void buffer_zero_test(struct kunit *test)
> +       {
> +               long buffer_size = (long)test->param_value;
> +               // Use kunit_kzalloc to allocate a zero-initialized buffer. This makes the
> +               // memory "parameter run managed," meaning it's automatically cleaned up at
> +               // the end of each parameter run.
> +               int *buf = kunit_kzalloc(test, buffer_size * sizeof(int), GFP_KERNEL);
> +
> +               // Ensure the allocation was successful.
> +               KUNIT_ASSERT_NOT_NULL(test, buf);
> +
> +               // Loop through the buffer and confirm every element is zero.
> +               for (int i = 0; i < buffer_size; i++)
> +                       KUNIT_EXPECT_EQ(test, buf[i], 0);
> +       }
> +
> +       static struct kunit_case buffer_test_cases[] = {
> +               KUNIT_CASE_PARAM(buffer_zero_test, buffer_size_gen_params),
> +               {}
> +       };
> +
> +Runtime Parameter Array Registration in the Init Function:
> +
> +   For more complex scenarios, you can directly register a parameter array
> +   to the parameterized test context.

Do we need to describe what these "more complex scenarios" are.
Additionally, the generator function can also be used for some complex
scenarios.

> +
> +   To do this, you must pass the parameterized test context, the array itself,
> +   the array size, and a ``get_description()`` function to the
> +   ``kunit_register_params_array()`` macro. This macro populates
> +   ``struct kunit_params`` within the parameterized test context, effectively
> +   storing a parameter array object. The ``get_description()`` function will
> +   be used for populating parameter descriptions and has the following signature:
> +   ``void (*)(struct kunit *test, const void *param, char *desc)``. Note that it
> +   also has access to the parameterized test context.
> +
> +      .. important::
> +         When using this way to register a parameter array, you will need to
> +         manually pass ``kunit_array_gen_params()`` as the generator function to
> +         ``KUNIT_CASE_PARAM_WITH_INIT``. ``kunit_array_gen_params()`` is a KUnit
> +         helper that will use the registered array to generate the parameters.
> +
> +        If needed, instead of passing the KUnit helper, you can also pass your
> +        own custom generator function that utilizes the parameter array. To
> +        access the parameter array from within the parameter generator
> +        function use ``test->params_array.params``.
> +
> +   The ``kunit_register_params_array()`` macro should be called within a
> +   ``param_init()`` function that initializes the parameterized test and has
> +   the following signature ``int (*)(struct kunit *test)``. For a detailed
> +   explanation of this mechanism please refer to the "Adding Shared Resources"
> +   section that is after this one. This method supports registering both
> +   dynamically built and static parameter arrays.
> +
> +   The code snippet below shows the ``example_param_init_dynamic_arr`` test that
> +   utilizes ``make_fibonacci_params()`` to create a dynamic array, which is then
> +   registered using ``kunit_register_params_array()``. To see the full code
> +   please refer to lib/kunit/kunit-example-test.c starting at line 396.

You should avoid putting a line number here, as it will quickly get
out of date. Maybe just mention
"A more complete example lives in lib/kunit/kunit-example-test.c",
possibly with the test name instead
("example_params_test_with_init_dynamic_arr").


> +
> +.. code-block:: c
> +
> +       /*
> +       * Example of a parameterized test param_init() function that registers a dynamic
> +       * array of parameters.
> +       */
> +       static int example_param_init_dynamic_arr(struct kunit *test)
> +       {
> +               size_t seq_size;
> +               int *fibonacci_params;
> +
> +               kunit_info(test, "initializing parameterized test\n");
> +
> +               seq_size = 6;
> +               fibonacci_params = make_fibonacci_params(test, seq_size);
> +               if (!fibonacci_params)
> +                       return -ENOMEM;
> +               /*
> +               * Passes the dynamic parameter array information to the parameterized test
> +               * context struct kunit. The array and its metadata will be stored in
> +               * test->parent->params_array. The array itself will be located in
> +               * params_data.params.
> +               */
> +               kunit_register_params_array(test, fibonacci_params, seq_size,
> +                                       example_param_dynamic_arr_get_desc);
> +               return 0;
> +       }
> +
> +       static struct kunit_case example_test_cases[] = {
> +               /*
> +                * Note how we pass kunit_array_gen_params() to use the array we
> +                * registered in example_param_init_dynamic_arr() to generate
> +                * parameters.
> +                */
> +               KUNIT_CASE_PARAM_WITH_INIT(example_params_test_with_init_dynamic_arr,
> +                                          kunit_array_gen_params,
> +                                          example_param_init_dynamic_arr,
> +                                          example_param_exit_dynamic_arr),
> +               {}
> +       };
> +
> +Adding Shared Resources
> +^^^^^^^^^^^^^^^^^^^^^^^
> +All parameter runs in this framework hold a reference to the parameterized test
> +context, which can be accessed using the parent ``struct kunit`` pointer. The
> +parameterized test context is not used to execute any test logic itself; instead,
> +it serves as a container for shared resources.
> +
> +It's possible to add resources to share between parameter runs within a
> +parameterized test by using ``KUNIT_CASE_PARAM_WITH_INIT``, to which you pass
> +custom ``param_init()`` and ``param_exit()`` functions. These functions run once
> +before and once after the parameterized test, respectively.
> +
> +The ``param_init()`` function, with the signature ``int (*)(struct kunit *test)``,
> +can be used for adding resources to the ``resources`` or ``priv`` fields of
> +the parameterized test context, registering the parameter array, and any other
> +initialization logic.
> +
> +The ``param_exit()`` function, with the signature ``void (*)(struct kunit *test)``,
> +can be used to release any resources that were not parameterized test managed (i.e.
> +not automatically cleaned up after the parameterized test ends) and for any other
> +exit logic.
> +
> +Both ``param_init()`` and ``param_exit()`` are passed the parameterized test
> +context behind the scenes. However, the test case function receives the parameter
> +run context. Therefore, to manage and access shared resources from within a test
> +case function, you must use ``test->parent``.
> +
> +For instance, finding a shared resource allocated by the Resource API requires
> +passing ``test->parent`` to ``kunit_find_resource()``. This principle extends to
> +all other APIs that might be used in the test case function, including
> +``kunit_kzalloc()``, ``kunit_kmalloc_array()``, and others (see
> +Documentation/dev-tools/kunit/api/test.rst and the
> +Documentation/dev-tools/kunit/api/resource.rst).
> +
> +.. note::
> +   The ``suite->init()`` function, which executes before each parameter run,
> +   receives the parameter run context. Therefore, any resources set up in
> +   ``suite->init()`` are cleaned up after each parameter run.
> +
> +The code below shows how you can add the shared resources. Note that this code
> +utilizes the Resource API, which you can read more about here:
> +Documentation/dev-tools/kunit/api/resource.rst. To see the full version of this
> +code please refer to lib/kunit/kunit-example-test.c starting at line 280.
> +
> +.. code-block:: c
> +
> +       static int example_resource_init(struct kunit_resource *res, void *context)
> +       {
> +               ... /* Code that allocates memory and stores context in res->data. */
> +       }
> +
> +       /* This function deallocates memory for the kunit_resource->data field. */
> +       static void example_resource_free(struct kunit_resource *res)
> +       {
> +               kfree(res->data);
> +       }
> +
> +       /* This match function locates a test resource based on defined criteria. */
> +       static bool example_resource_alloc_match(struct kunit *test, struct kunit_resource *res,
> +                                                void *match_data)
> +       {
> +               return res->data && res->free == example_resource_free;
> +       }
> +
> +       /* Function to initialize the parameterized test. */
> +       static int example_param_init(struct kunit *test)
> +       {
> +               int ctx = 3; /* Data to be stored. */
> +               void *data = kunit_alloc_resource(test, example_resource_init,
> +                                                 example_resource_free,
> +                                                 GFP_KERNEL, &ctx);
> +               if (!data)
> +                       return -ENOMEM;
> +               kunit_register_params_array(test, example_params_array,
> +                                           ARRAY_SIZE(example_params_array));
> +               return 0;
> +       }
> +
> +       /* Example test that uses shared resources in test->resources. */
> +       static void example_params_test_with_init(struct kunit *test)
> +       {
> +               int threshold;
> +               const struct example_param *param = test->param_value;
> +               /*  Here we pass test->parent to access the parameterized test context. */
> +               struct kunit_resource *res = kunit_find_resource(test->parent,
> +                                                                example_resource_alloc_match,
> +                                                                NULL);
> +
> +               threshold = *((int *)res->data);
> +               KUNIT_ASSERT_LE(test, param->value, threshold);
> +               kunit_put_resource(res);
> +       }
> +
> +       static struct kunit_case example_test_cases[] = {
> +               KUNIT_CASE_PARAM_WITH_INIT(example_params_test_with_init, kunit_array_gen_params,
> +                                          example_param_init, NULL),
> +               {}
> +       };
> +
> +As an alternative to using the KUnit Resource API for sharing resources, you can
> +place them in ``test->parent->priv``. This serves as a more lightweight method
> +for resource storage, best for scenarios where complex resource management is
> +not required.
> +
> +As stated previously ``param_init()`` and ``param_exit()`` get the parameterized
> +test context. So, you can directly use ``test->priv`` within ``param_init/exit``
> +to manage shared resources. However, from within the test case function, you must
> +navigate up to the parent ``struct kunit`` i.e. the parameterized test context.
> +Therefore, you need to use ``test->parent->priv`` to access those same
> +resources.
> +
> +The resources placed in ``test->parent->priv`` will need to be allocated in
> +memory to persist across the parameter runs. If memory is allocated using the
> +KUnit memory allocation APIs (described more in the "Allocating Memory" section
> +below), you won't need to worry about deallocation. The APIs will make the memory
> +parameterized test 'managed', ensuring that it will automatically get cleaned up
> +after the parameterized test concludes.
> +
> +The code below demonstrates example usage of the ``priv`` field for shared
> +resources:
> +
> +.. code-block:: c
> +
> +       static const struct example_param {
> +               int value;
> +       } example_params_array[] = {
> +               { .value = 3, },
> +               { .value = 2, },
> +               { .value = 1, },
> +               { .value = 0, },
> +       };
> +
> +       /* Initialize the parameterized test context. */
> +       static int example_param_init_priv(struct kunit *test)
> +       {
> +               int ctx = 3; /* Data to be stored. */
> +               int arr_size = ARRAY_SIZE(example_params_array);
> +
> +               /*
> +                * Allocate memory using kunit_kzalloc(). Since the `param_init`
> +                * function receives the parameterized test context, this memory
> +                * allocation will be scoped to the lifetime of the parameterized test.
> +                */
> +               test->priv = kunit_kzalloc(test, sizeof(int), GFP_KERNEL);
> +
> +               /* Assign the context value to test->priv.*/
> +               *((int *)test->priv) = ctx;
> +
> +               /* Register the parameter array. */
> +               kunit_register_params_array(test, example_params_array, arr_size, NULL);
> +               return 0;
> +       }
> +
> +       static void example_params_test_with_init_priv(struct kunit *test)
> +       {
> +               int threshold;
> +               const struct example_param *param = test->param_value;
> +
> +               /* By design, test->parent will not be NULL. */
> +               KUNIT_ASSERT_NOT_NULL(test, test->parent);
> +
> +               /* Here we use test->parent->priv to access the shared resource. */
> +               threshold = *(int *)test->parent->priv;
> +
> +               KUNIT_ASSERT_LE(test, param->value, threshold);
> +       }
> +
> +       static struct kunit_case example_tests[] = {
> +               KUNIT_CASE_PARAM_WITH_INIT(example_params_test_with_init_priv,
> +                                          kunit_array_gen_params,
> +                                          example_param_init_priv, NULL),
> +               {}
> +       };
> +
>  Allocating Memory
>  -----------------
>
> --
> 2.51.0.rc0.205.g4a044479a3-goog
>

--0000000000003170fd063c3ba327
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIUnQYJKoZIhvcNAQcCoIIUjjCCFIoCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ghIEMIIGkTCCBHmgAwIBAgIQfofDAVIq0iZG5Ok+mZCT2TANBgkqhkiG9w0BAQwFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSNjETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMzA0MTkwMzUzNDdaFw0zMjA0MTkwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFI2IFNNSU1FIENBIDIwMjMwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDYydcdmKyg
4IBqVjT4XMf6SR2Ix+1ChW2efX6LpapgGIl63csmTdJQw8EcbwU9C691spkltzTASK2Ayi4aeosB
mk63SPrdVjJNNTkSbTowej3xVVGnYwAjZ6/qcrIgRUNtd/mbtG7j9W80JoP6o2Szu6/mdjb/yxRM
KaCDlloE9vID2jSNB5qOGkKKvN0x6I5e/B1Y6tidYDHemkW4Qv9mfE3xtDAoe5ygUvKA4KHQTOIy
VQEFpd/ZAu1yvrEeA/egkcmdJs6o47sxfo9p/fGNsLm/TOOZg5aj5RHJbZlc0zQ3yZt1wh+NEe3x
ewU5ZoFnETCjjTKz16eJ5RE21EmnCtLb3kU1s+t/L0RUU3XUAzMeBVYBEsEmNnbo1UiiuwUZBWiJ
vMBxd9LeIodDzz3ULIN5Q84oYBOeWGI2ILvplRe9Fx/WBjHhl9rJgAXs2h9dAMVeEYIYkvW+9mpt
BIU9cXUiO0bky1lumSRRg11fOgRzIJQsphStaOq5OPTb3pBiNpwWvYpvv5kCG2X58GfdR8SWA+fm
OLXHcb5lRljrS4rT9MROG/QkZgNtoFLBo/r7qANrtlyAwPx5zPsQSwG9r8SFdgMTHnA2eWCZPOmN
1Tt4xU4v9mQIHNqQBuNJLjlxvalUOdTRgw21OJAFt6Ncx5j/20Qw9FECnP+B3EPVmQIDAQABo4IB
ZTCCAWEwDgYDVR0PAQH/BAQDAgGGMDMGA1UdJQQsMCoGCCsGAQUFBwMCBggrBgEFBQcDBAYJKwYB
BAGCNxUGBgkrBgEEAYI3FQUwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHQ4EFgQUM7q+o9Q5TSoZ
18hmkmiB/cHGycYwHwYDVR0jBBgwFoAUrmwFo5MT4qLn4tcc1sfwf8hnU6AwewYIKwYBBQUHAQEE
bzBtMC4GCCsGAQUFBzABhiJodHRwOi8vb2NzcDIuZ2xvYmFsc2lnbi5jb20vcm9vdHI2MDsGCCsG
AQUFBzAChi9odHRwOi8vc2VjdXJlLmdsb2JhbHNpZ24uY29tL2NhY2VydC9yb290LXI2LmNydDA2
BgNVHR8ELzAtMCugKaAnhiVodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL3Jvb3QtcjYuY3JsMBEG
A1UdIAQKMAgwBgYEVR0gADANBgkqhkiG9w0BAQwFAAOCAgEAVc4mpSLg9A6QpSq1JNO6tURZ4rBI
MkwhqdLrEsKs8z40RyxMURo+B2ZljZmFLcEVxyNt7zwpZ2IDfk4URESmfDTiy95jf856Hcwzdxfy
jdwx0k7n4/0WK9ElybN4J95sgeGRcqd4pji6171bREVt0UlHrIRkftIMFK1bzU0dgpgLMu+ykJSE
0Bog41D9T6Swl2RTuKYYO4UAl9nSjWN6CVP8rZQotJv8Kl2llpe83n6ULzNfe2QT67IB5sJdsrNk
jIxSwaWjOUNddWvCk/b5qsVUROOuctPyYnAFTU5KY5qhyuiFTvvVlOMArFkStNlVKIufop5EQh6p
jqDGT6rp4ANDoEWbHKd4mwrMtvrh51/8UzaJrLzj3GjdkJ/sPWkDbn+AIt6lrO8hbYSD8L7RQDqK
C28FheVr4ynpkrWkT7Rl6npWhyumaCbjR+8bo9gs7rto9SPDhWhgPSR9R1//WF3mdHt8SKERhvtd
NFkE3zf36V9Vnu0EO1ay2n5imrOfLkOVF3vtAjleJnesM/R7v5tMS0tWoIr39KaQNURwI//WVuR+
zjqIQVx5s7Ta1GgEL56z0C5GJoNE1LvGXnQDyvDO6QeJVThFNgwkossyvmMAaPOJYnYCrYXiXXle
A6TpL63Gu8foNftUO0T83JbV/e6J8iCOnGZwZDrubOtYn1QwggWDMIIDa6ADAgECAg5F5rsDgzPD
hWVI5v9FUTANBgkqhkiG9w0BAQwFADBMMSAwHgYDVQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBS
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
jmkLAgMBAAGjggHgMIIB3DAeBgNVHREEFzAVgRNkYXZpZGdvd0Bnb29nbGUuY29tMA4GA1UdDwEB
/wQEAwIFoDAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIwHQYDVR0OBBYEFBp5bTxrTm/d
WMmRETO8lNkA4c7fMFgGA1UdIARRME8wCQYHZ4EMAQUBAjBCBgorBgEEAaAyCgMDMDQwMgYIKwYB
BQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAwGA1UdEwEB/wQC
MAAwgZoGCCsGAQUFBwEBBIGNMIGKMD4GCCsGAQUFBzABhjJodHRwOi8vb2NzcC5nbG9iYWxzaWdu
LmNvbS9jYS9nc2F0bGFzcjZzbWltZWNhMjAyMzBIBggrBgEFBQcwAoY8aHR0cDovL3NlY3VyZS5n
bG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3J0MB8GA1UdIwQYMBaA
FDO6vqPUOU0qGdfIZpJogf3BxsnGMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vY2EvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3JsMA0GCSqGSIb3DQEBCwUAA4ICAQBF
tO3/N2l9hTaij/K0xCpLwIlrqpNo0nMAvvG5LPQQjSeHnTh06tWTgsPCOJ65GX+bqWRDwGTu8WTq
c5ihCNOikBs25j82yeLkfdbeN/tzRGUb2RD+8n9I3CnyMSG49U2s0ZdncsrIVFh47KW2TpHTF7R8
N1dri01wPg8hw4u0+XoczR2TiBrBOISKmAlkAi+P9ivT31gSHdbopoL4x0V2Ow9IOp0chrQQUZtP
KBytLhzUzd9wIsE0QMNDbw6jeG8+a4sd17zpXSbBywIGw7sEvPtnBjMaf5ib3kznlOne6tuDVx4y
QFExTCSrP3OTMUkNbpIdgzg2CHQ2aB8i8YsTZ8Q8Q8ztPJ+xDNsqBUeYxILLjTjxQQovToqipB3f
6IMyk+lWCdDS+iCLYZULV1BTHSdwp1NM3t4jZ8TMlV+JzAyRqz4lzSl8ptkFhKBJ7w2tDrZ3BEXB
8ASUByRxeh+pC1Z5/HhqfiWMVPjaWmlRRJVlRk+ObKIv2CblwxMYlo2Mn8rrbEDyfum1RTMW55Z6
Vumvw5QTHe29TYxSiusovM6OD5y0I+4zaIaYDx/AtF0mMOFXb1MDyynf1CDxhtkgnrBUseHSOU2e
MYs7IqzRap5xsgpJS+t7cp/P8fdlCNvsXss9zZa279tKwaxR0U2IzGxRGsWKGxDysn1HT6pqMDGC
Al0wggJZAgEBMGgwVDELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExKjAo
BgNVBAMTIUdsb2JhbFNpZ24gQXRsYXMgUjYgU01JTUUgQ0EgMjAyMwIQAUXA7LnOuRz2DvkWTeMc
0TANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQgBeGKAWKVfJoGMcQuL70z5n3fSQC2
T1dv0ifP4JpIaBUwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjUw
ODEzMDkxODE4WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJ
YIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcN
AQEBBQAEggEAQ5ao9aPzmHlZT/QOl9PgvKvrWvsjxHRsifFo1xRmp5PnfftXqBV7CV/BXyl37XTq
b7HPs13VCOsNhFprdu1cewZm8SVgbIJmHD+2kEduuKZm9GHCWY+Z/XeSvCDO1Q0YSel35xWT4EHu
0HbugrR9P2jUZyy5pu+U/mYIhDrpypQMe07mtu4W4X7K9ZrzDk4XAUuZ6WhiZXfNhfFu4XeZE6Fm
KMogbMlYdpmrnVFdnFrcCA66+za8l1qg/1XvuazaPQa9megYNuPmIgAsT32v+VKyPr4g3O51lGks
JAvdPYe1hhWw3AfWNQHNk1zigbl+cA5pGU6RAR8VkK8MZI6r8g==
--0000000000003170fd063c3ba327--
