Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B299B1CB70
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 19:50:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A47110E2F9;
	Wed,  6 Aug 2025 17:50:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="WIysqVOC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E63E810E2FC
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 17:50:44 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-5f438523d6fso1115a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Aug 2025 10:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1754502643; x=1755107443;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O6ZQ/5BaV6mQdffgVaaglAdkdHfzgWg/eTO8QxYBPeU=;
 b=WIysqVOC2AkO4UbdOtDedpYLFlZxM0++MhCYXk/RNLHAHdXoG+D9nmNioEe9n1Mmae
 mYUGj+9tp44LBw+QKZZYsyicpNfII70+Qq34wJywF1fbDqRd0OGkg9Gk43OjBnqIBek9
 me2mlMnSh6CQbLZScLY4RlpFw0d6UE1DQfgLrmEks9MVy+7VWn3TZp89k+/1LR5G8p+J
 nX9FiwJxfdv3YGa69RvuGmMGd/wcx7iNhb8TdQb0kBcwc4fbLR2NcdeXODugmahdSCBJ
 bqhHE+fwbRdZ4KLP+Sd/j6jx53LY8gWPUgDSsMqND2llw0FtXRD9RGRnzqxu4YMNxTYa
 KPeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754502643; x=1755107443;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O6ZQ/5BaV6mQdffgVaaglAdkdHfzgWg/eTO8QxYBPeU=;
 b=BV86pzTYoeu0pTTr750/9fFpRlqIhSrrhDeaWXH0YhNjSCo4BSm6Qree5sFftHQfIH
 fX/q1IcqVS9yfzgAS/Ci6rkWP8K9+vn90bJifK2dH0sNCk6q+pxMfNk1dkIcrrEXBISs
 Kdz2lvFWK9W7kyRP7lQXVIM+DnZ5IX+UeXzYDos1HSUuP+HSyMKOwWlGjuvmtNkeHVzl
 MuAJS3moWJ4eE4pE6sR9BKO57+MpueK4ZbtcCp2fuLc0+R0T8NBH6r/L+dOqfmSlFvJU
 Hqt6EnM8RL0ZtnRztRWL8Br8gtX+M1qlTNKpPoQqpYUm/V/jF4PUVA2Y9BsskaanG/rv
 Euhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFZOoFoLkkWj4R0JgmUlIpvpGEaaWs/cgQGFTo34uYf7CZWRsQDC1JRn3Oy4FisCJeE/2JRPQJon0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjJJcOTtDR1VT1tjM9bzMYW3BqtHQufZjJ0ozeDDWOdyo6B/3W
 d8nCg9USoR05v8rrAXqiIbABQTVled1FEo1ZQPhCnwLbPkRcY5VylPY6dK1APrVA74wJ9vln02c
 cHqIAZY0NZ03RvPvI9Uyc4vviyOi8Cbi5yhArzJoX
X-Gm-Gg: ASbGnctrmT47WKqT2T8tRD6wu3CJ0gas9+pgZXY6PHp3ENRD/yB6yyJE7qtktOzjT4R
 IXO8Y10PI5170bMN8kNV2QFicL7Q5VFsaGstt5f6RbGoeBye0P5F0m9HtFpo32bz6lmQpHNMgHR
 Z9T2aYRNn2NRNO3x9oqcLpC5MpJ9i+OPJzVO0qryRXTQsmQtBuRbvcmhg2fIaEk/DrTx1J8ntjD
 yNKqPNd/QYktKcm8Kc=
X-Google-Smtp-Source: AGHT+IE+QDtUPARPU2wN4XerAfKdVLgsMbZ03V31aP2LxZYSJjBTKBDhaE0pgDwg/Hur4O5WYOACGm9GKfssEMe+4GQ=
X-Received: by 2002:a05:6402:4c1:b0:615:6167:4835 with SMTP id
 4fb4d7f45d1cf-61797ec0988mr91110a12.7.1754502642599; Wed, 06 Aug 2025
 10:50:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250729193647.3410634-1-marievic@google.com>
 <20250729193647.3410634-8-marievic@google.com>
 <CABVgOSmBssmMz3qQi+TdEoaGQJNXaSVBrsO8RSW0MjLUUHPakg@mail.gmail.com>
In-Reply-To: <CABVgOSmBssmMz3qQi+TdEoaGQJNXaSVBrsO8RSW0MjLUUHPakg@mail.gmail.com>
From: Marie Zhussupova <marievic@google.com>
Date: Wed, 6 Aug 2025 13:50:31 -0400
X-Gm-Features: Ac12FXxZ0gzQXyQ3JCYs61KiK41rHInNvNCX1ufle-31wpGuIXR7lV23iXdDrBU
Message-ID: <CAAkQn5KnBZ7O6TkHL8UR0UaJ-v0P51TjtEwoRu7VWaPYd8oeSg@mail.gmail.com>
Subject: Re: [PATCH 7/9] kunit: Add example parameterized test with shared
 resources and direct static parameter array setup
To: David Gow <davidgow@google.com>
Cc: rmoar@google.com, shuah@kernel.org, brendan.higgins@linux.dev, 
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

On Sat, Aug 2, 2025 at 5:45=E2=80=AFAM David Gow <davidgow@google.com> wrot=
e:
>
> On Wed, 30 Jul 2025 at 03:37, Marie Zhussupova <marievic@google.com> wrot=
e:
> >
> > Add `example_params_test_with_init` to illustrate how to manage
> > shared resources across parameterized KUnit tests. This example
> > showcases the use of the new `param_init` function and its registration
> > to a test using the `KUNIT_CASE_PARAM_WITH_INIT` macro.
> >
> > Additionally, the test demonstrates:
> > - How to directly assign a static parameter array to a test via
> >   `kunit_register_params_array`.
> > - Leveraging the Resource API for test resource management.
> >
> > Signed-off-by: Marie Zhussupova <marievic@google.com>
> > ---
>
> Thanks for writing some examples! This is great, and makes the rest of
> the series much easier to understand.
>
> (It also reminds me how much I hate the verbose parts of the resource
> API, but it's definitely out of scope to refactor that here. :-))
>
> It does seem like this is a lot of effort to go through for one shared
> integer, though. In the real world, I'd suggest using
> kunit->parent->priv here. As an example, though, it's fine (though
> maybe using a named resource or even kunit_kzalloc() or similar would
> give a better example of how convenient this could be.
>
> It's also not entirely clear why we're using
> kunit_register_params_array() for a static array, when
> KUNIT_ARRAY_PARAM() exists. (This is clearly because the latter
> doesn't support init functions; and I see why we don't necessarily
> want to make the number of macros explode through adding
> KUNIT_ARRAY_PARAM_WITH_INIT() et al, but maybe we should note that in
> the commit description, either here or before.)
>
> Actual test looks fine, though:
>
> Reviewed-by: David Gow <davidgow@google.com>
>
> Cheers,
> -- David
>

Hello David,

I agree that using the Resource API for a single integer is a bit extra.
My idea behind this test was to demonstrate that the Resource API
could be used for managing shared resources and to have the
style of the existing example tests that do simple things with integers.

Using kunit_kzalloc() would be a great simplification. As for a named
resource, we don't have a function to allocate named resources yet
as would be needed here, but that sounds like a great future patch.

We can actually use the KUNIT_ARRAY_PARAM() macro with
KUNIT_CASE_PARAM_WITH_INIT(). We would just pass that created
`*_gen_params` function to KUNIT_CASE_PARAM_WITH_INIT()
instead of NULL. The reason I used kunit_register_params_array() with
the static array was to show that test users can pass a static array
this way, as well, and also to avoid making the test too long with the
dynamic array
creation. But I do like the consistency of using KUNIT_ARRAY_PARAM()
for static arrays and kunit_register_params_array() only for
dynamic ones.

Thank you,
-Marie

>
> >  lib/kunit/kunit-example-test.c | 112 +++++++++++++++++++++++++++++++++
> >  1 file changed, 112 insertions(+)
> >
> > diff --git a/lib/kunit/kunit-example-test.c b/lib/kunit/kunit-example-t=
est.c
> > index 3056d6bc705d..5bf559e243f6 100644
> > --- a/lib/kunit/kunit-example-test.c
> > +++ b/lib/kunit/kunit-example-test.c
> > @@ -277,6 +277,116 @@ static void example_slow_test(struct kunit *test)
> >         KUNIT_EXPECT_EQ(test, 1 + 1, 2);
> >  }
> >
> > +/*
> > + * This custom function allocates memory for the kunit_resource data f=
ield.
> > + * The function is passed to kunit_alloc_resource() and executed once
> > + * by the internal helper __kunit_add_resource().
> > + */
> > +static int example_resource_init(struct kunit_resource *res, void *con=
text)
> > +{
> > +       int *info =3D kmalloc(sizeof(*info), GFP_KERNEL);
> > +
> > +       if (!info)
> > +               return -ENOMEM;
> > +       *info =3D *(int *)context;
> > +       res->data =3D info;
> > +       return 0;
> > +}
> > +
> > +/*
> > + * This function deallocates memory for the 'kunit_resource' data fiel=
d.
> > + * The function is passed to kunit_alloc_resource() and automatically
> > + * executes within kunit_release_resource() when the resource's refere=
nce
> > + * count, via kunit_put_resource(), drops to zero. KUnit uses referenc=
e
> > + * counting to ensure that resources are not freed prematurely.
> > + */
> > +static void example_resource_free(struct kunit_resource *res)
> > +{
> > +       kfree(res->data);
> > +}
> > +
> > +/*
> > + * This match function is invoked by kunit_find_resource() to locate
> > + * a test resource based on defined criteria. The current example
> > + * uniquely identifies the resource by its free function; however,
> > + * alternative custom criteria can be implemented. Refer to
> > + * lib/kunit/platform.c and lib/kunit/static_stub.c for further exampl=
es.
> > + */
> > +static bool example_resource_alloc_match(struct kunit *test,
> > +                                        struct kunit_resource *res,
> > +                                        void *match_data)
> > +{
> > +       return res->data && res->free =3D=3D example_resource_free;
> > +}
> > +
> > +/*
> > + * This is an example of a function that provides a description for ea=
ch of the
> > + * parameters.
> > + */
> > +static void example_param_array_get_desc(const void *p, char *desc)
> > +{
> > +       const struct example_param *param =3D p;
> > +
> > +       snprintf(desc, KUNIT_PARAM_DESC_SIZE,
> > +                "example check if %d is less than or equal to 3", para=
m->value);
> > +}
> > +
> > +/*
> > + * Initializes the parent kunit struct for parameterized KUnit tests.
> > + * This function enables sharing resources across all parameterized
> > + * tests by adding them to the `parent` kunit test struct. It also sup=
ports
> > + * registering either static or dynamic arrays of test parameters.
> > + */
> > +static int example_param_init(struct kunit *test)
> > +{
> > +       int ctx =3D 3; /* Data to be stored. */
> > +       int arr_size =3D ARRAY_SIZE(example_params_array);
> > +
> > +       /*
> > +        * This allocates a struct kunit_resource, sets its data field =
to
> > +        * ctx, and adds it to the kunit struct's resources list. Note =
that
> > +        * this is test managed so we don't need to have a custom exit =
function
> > +        * to free it.
> > +        */
> > +       void *data =3D kunit_alloc_resource(test, example_resource_init=
, example_resource_free,
> > +                                         GFP_KERNEL, &ctx);
> > +
> > +       if (!data)
> > +               return -ENOMEM;
> > +       /* Pass the static param array information to the parent struct=
 kunit. */
> > +       kunit_register_params_array(test, example_params_array, arr_siz=
e,
> > +                                   example_param_array_get_desc);
> > +       return 0;
> > +}
> > +
> > +/*
> > + * This is an example of a parameterized test that uses shared resourc=
es
> > + * available from the struct kunit parent field of the kunit struct.
> > + */
> > +static void example_params_test_with_init(struct kunit *test)
> > +{
> > +       int threshold;
> > +       struct kunit_resource *res;
> > +       const struct example_param *param =3D test->param_value;
> > +
> > +       /* By design, param pointer will not be NULL. */
> > +       KUNIT_ASSERT_NOT_NULL(test, param);
> > +
> > +       /* Here we access the parent pointer of the test to find the sh=
ared resource. */
> > +       res =3D kunit_find_resource(test->parent, example_resource_allo=
c_match, NULL);
> > +
> > +       KUNIT_ASSERT_NOT_NULL(test, res);
> > +
> > +       /* Since the data field in kunit_resource is a void pointer we =
need to typecast it. */
> > +       threshold =3D *((int *)res->data);
> > +
> > +       /* Assert that the parameter is less than or equal to a certain=
 threshold. */
> > +       KUNIT_ASSERT_LE(test, param->value, threshold);
> > +
> > +       /* This decreases the reference count after calling kunit_find_=
resource(). */
> > +       kunit_put_resource(res);
> > +}
> > +
> >  /*
> >   * Here we make a list of all the test cases we want to add to the tes=
t suite
> >   * below.
> > @@ -296,6 +406,8 @@ static struct kunit_case example_test_cases[] =3D {
> >         KUNIT_CASE(example_static_stub_using_fn_ptr_test),
> >         KUNIT_CASE(example_priv_test),
> >         KUNIT_CASE_PARAM(example_params_test, example_gen_params),
> > +       KUNIT_CASE_PARAM_WITH_INIT(example_params_test_with_init, NULL,
> > +                                  example_param_init, NULL),
> >         KUNIT_CASE_SLOW(example_slow_test),
> >         {}
> >  };
> > --
> > 2.50.1.552.g942d659e1b-goog
> >
