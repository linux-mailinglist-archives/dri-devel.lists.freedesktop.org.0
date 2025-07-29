Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B217B15452
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 22:26:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 595E410E66C;
	Tue, 29 Jul 2025 20:26:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="SkaySFKI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C81C10E66E
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 20:26:35 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id
 6a1803df08f44-6faf66905adso34810886d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 13:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1753820794; x=1754425594;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lUba6K8jqFTo7PyTbrkud2zkkQZs/3cD7l8HjP/HFnw=;
 b=SkaySFKIq6QbmM0FbLW8S+p6OYS3d/dZcBrTlWM5VYiKnAT4GOfOVRMBe7a/TTqFXh
 2Se8Mlme3tjLHJSZSkvfatwuyvG8Rgr6R+wT8ugWr38HGRPlsQLggx4epY41M40O4ky3
 a+1gk0xTlno8J6lwFfYvNY6yaexu166wHNCRJzLvSJwoL75Y5GWPFUIDEl6KICrLshkj
 ryjiCisp3wrNY+tTGtoc5b57X/E14fMOxXVgOsBsHRoA46XDw2ClLGSePgs0V0l8Wu0T
 Bl+0RrLbOAB8bSqlFwZETjCFTVK3fj/RBf/2cz6ZeedxKtEkNmmYz5MNCSMyAkL8ja37
 c3gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753820794; x=1754425594;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lUba6K8jqFTo7PyTbrkud2zkkQZs/3cD7l8HjP/HFnw=;
 b=HrkAdbf8X52lXOL+yNgjCePyRJZ5WKX4gfG6cNQeL9o7FfVX0NbuPB4ibNG4ms306F
 62EIKOkj8YM8luIArGBKEFhcZDCjgkY74M7KlAxRWheTOM0sRiwn5hYeAyvjh5V3cA9C
 SVrVBWxLzsaMdW353lctbojeny1PkBgECPih1aThoZHiYXmaXjUKQQsHXo9JafFdOqkl
 heBtvclG8pK59jNAVkw8iZLcRejINX/c6S0pHQDPGNLHOfy2xx+WH4OjDXaEDunEwngs
 5PiGPVwS9mwI0jqCVCrjwyUXYnMf6P9SDQbYAnOREUWjIiL9FJzKXiJmt7f905EDZbBk
 eSaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIFONhcwMPYxrgtc67vuygsrXB0qqeVd8VvlKKW5m8WJ3nEi+aTEU7B2KNDaQERonyXpm4LXE1hJg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjxBSbQsbfxl6JRuaEqoepAvrMkIxvTFvzLnoO42KeHUuEpC95
 oslU93eWpUjRslVXJeoEu9bNi7r6ic7pqa6aArZ4y0ciXsvaTVXG6E30/8uau663gVqq4I6kY1p
 c4AECPI8OS86AeeIKIlTZmrPEUg5OLXWziT4Wf7bv
X-Gm-Gg: ASbGnctnp22gBSam06LCHp0n+XPjqvlrMDZAPNXmEMv3sdaTPQnr33O3oikjyko+87X
 5+ukgTRXHygJyPrS6sYllMIDqmFM8YFsgOJqU80apxw8nKLpKCxTet9WVsEw2P96mmxyE6t3ZOu
 nl93USXaSvNATrLyf6RmGykW/Pw5b8Ywo9vhFYNIK+fBxxrYMb5lgWEVESATtZgv5IPilcoLSTI
 DRJajO825lRelrRcvhAmMQ60zAF82Q+9Aj+FVn7X90RaGTl
X-Google-Smtp-Source: AGHT+IHoSfElkKizKaXlQQgKR9Fdix12qjTHreY1H8nuY0EMlwcbbT54Mr8lFpVSBewenvXBiMSWypGRxD5hgW6FI5k=
X-Received: by 2002:ad4:5c8d:0:b0:702:d655:f4e9 with SMTP id
 6a1803df08f44-70766e3f302mr12378566d6.18.1753820793697; Tue, 29 Jul 2025
 13:26:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250729193647.3410634-1-marievic@google.com>
 <20250729193647.3410634-7-marievic@google.com>
 <CA+GJov7gQMughx7wR5J_BGqo7FaPhEPF-OHaCg3OuuL17X5vpA@mail.gmail.com>
In-Reply-To: <CA+GJov7gQMughx7wR5J_BGqo7FaPhEPF-OHaCg3OuuL17X5vpA@mail.gmail.com>
From: Rae Moar <rmoar@google.com>
Date: Tue, 29 Jul 2025 16:26:22 -0400
X-Gm-Features: Ac12FXwMXtoJETJwjrpeWEppK8R5hxomMaIXf4G-i3r5Ati6QR7pZQsQ7V97C04
Message-ID: <CA+GJov4SneU9XeKLiACAcO-q5EVe=jo-AfYH4cs87o92MpQ00g@mail.gmail.com>
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

On Tue, Jul 29, 2025 at 4:14=E2=80=AFPM Rae Moar <rmoar@google.com> wrote:
>
> On Tue, Jul 29, 2025 at 3:37=E2=80=AFPM Marie Zhussupova <marievic@google=
.com> wrote:
> >
> > KUnit parameterized tests currently support two
> > primary methods for getting parameters:
> > 1.  Defining custom logic within a `generate_params`
> >     function.
> > 2.  Using the KUNIT_ARRAY_PARAM and KUNIT_ARRAY_PARAM_DESC
> >     macros with pre-defined static arrays.
> >
> > These methods present limitations when dealing with
> > dynamically generated parameter arrays, or in scenarios
> > where populating parameters sequentially via
> > `generate_params` is inefficient or overly complex.
> >
> > This patch addresses these limitations by adding a new
> > `params_data` field to `struct kunit`, of the type
> > `kunit_params`. The struct `kunit_params` is designed to
> > store the parameter array itself, along with essential metadata
> > including the parameter count, parameter size, and a
> > `get_description` function for providing custom descriptions
> > for individual parameters.
> >
> > The `params_data` field can be populated by calling the new
> > `kunit_register_params_array` macro from within a
> > `param_init` function. By attaching the parameter array
> > directly to the parent kunit test instance, these parameters
> > can be iterated over in kunit_run_tests() behind the scenes.
> >
> > This modification provides greater flexibility to the
> > KUnit framework, allowing testers to easily register and
> > utilize both dynamic and static parameter arrays.
> >
> > Signed-off-by: Marie Zhussupova <marievic@google.com>
> > ---
> >  include/kunit/test.h | 54 ++++++++++++++++++++++++++++++++++++++++----
> >  lib/kunit/test.c     | 26 ++++++++++++++++++++-
> >  2 files changed, 75 insertions(+), 5 deletions(-)
> >
> > diff --git a/include/kunit/test.h b/include/kunit/test.h
> > index 4ba65dc35710..9143f0e22323 100644
> > --- a/include/kunit/test.h
> > +++ b/include/kunit/test.h
> > @@ -245,7 +245,8 @@ static inline char *kunit_status_to_ok_not_ok(enum =
kunit_status status)
> >   */
> >  #define KUNIT_CASE_PARAM_WITH_INIT(test_name, gen_params, init, exit) =
         \
> >                 { .run_case =3D test_name, .name =3D #test_name,       =
             \
> > -                 .generate_params =3D gen_params,                     =
           \
> > +                 .generate_params =3D (gen_params)                    =
           \
> > +                  ?: kunit_get_next_param_and_desc,                   =
         \
> >                   .param_init =3D init, .param_exit =3D exit,          =
             \
> >                   .module_name =3D KBUILD_MODNAME}
> >
> > @@ -294,6 +295,21 @@ struct kunit_suite_set {
> >         struct kunit_suite * const *end;
> >  };
> >
> > +/* Stores the pointer to the parameter array and its metadata. */
> > +struct kunit_params {
> > +       /*
> > +        * Reference to the parameter array for the parameterized tests=
. This
> > +        * is NULL if a parameter array wasn't directly passed to the
> > +        * parent kunit struct via the kunit_register_params_array macr=
o.
> > +        */
> > +       const void *params;
> > +       /* Reference to a function that gets the description of a param=
eter. */
> > +       void (*get_description)(const void *param, char *desc);
> > +
> > +       int num_params;
> > +       size_t elem_size;
> > +};
> > +
> >  /**
> >   * struct kunit - represents a running instance of a test.
> >   *
> > @@ -302,12 +318,14 @@ struct kunit_suite_set {
> >   * @parent: for user to store data that they want to shared across
> >   *         parameterized tests. Typically, the data is provided in
> >   *         the param_init function (see &struct kunit_case).
> > + * @params_data: for users to directly store the parameter array.
> >   *
> >   * Used to store information about the current context under which the=
 test
> >   * is running. Most of this data is private and should only be accesse=
d
> > - * indirectly via public functions; the two exceptions are @priv and @=
parent
> > - * which can be used by the test writer to store arbitrary data or dat=
a that is
> > - * available to all parameter test executions, respectively.
> > + * indirectly via public functions. There are three exceptions to this=
: @priv,
> > + * @parent, and @params_data. These members can be used by the test wr=
iter to
> > + * store arbitrary data, data available to all parameter test executio=
ns, and
> > + * the parameter array, respectively.
> >   */
> >  struct kunit {
> >         void *priv;
> > @@ -316,6 +334,8 @@ struct kunit {
> >          * during parameterized testing.
> >          */
> >         struct kunit *parent;
> > +       /* Stores the params array and all data related to it. */
> > +       struct kunit_params params_data;
> >
> >         /* private: internal use only. */
> >         const char *name; /* Read only after initialization! */
> > @@ -386,6 +406,8 @@ void kunit_exec_list_tests(struct kunit_suite_set *=
suite_set, bool include_attr)
> >  struct kunit_suite_set kunit_merge_suite_sets(struct kunit_suite_set i=
nit_suite_set,
> >                 struct kunit_suite_set suite_set);
> >
> > +const void *kunit_get_next_param_and_desc(struct kunit *test, const vo=
id *prev, char *desc);
>
> Hello!
>
> Thanks for sending out this series! I will do a full review of it. For
> now, I noticed that I get an error when I try to run KUnit tests as
> modules. I get the following error: "ERROR: modpost:
> "kunit_get_next_param_and_desc" [lib/kunit/kunit-example-test.ko]
> undefined!". As a possible fix, I suggest moving the function
> definition into the header file and making it a static inline
> function.
>
> Thanks!
> -Rae
>

Hello! Feel free to also use EXPORT_SYMBOL_GPL(). Either solution
should work here. Thanks!
