Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FF178F8F6
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 09:12:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B487910E122;
	Fri,  1 Sep 2023 07:12:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F87510E122
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 07:11:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1F34DB824C1;
 Fri,  1 Sep 2023 07:11:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4967BC433C8;
 Fri,  1 Sep 2023 07:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693552315;
 bh=jL6V71q+JQ0fwfAxJn/3YfPCITb3l3CFMd1wVZr+rM8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=coSjDrXd6jydcj9Jlh2XcO5LIBYCqbYjPXCkn2TnfOQVh+6sfAm19T81nDvflziH3
 +XikcbhcgxooF3aXODlQyUQR0J/FSzBXLYi/kcQ+rsCJgOxKE/X3D5fba/ZqWK+veX
 xR6qxYlfuSnURekKEvW4WZibxvijlErCNh8Q/i6HqrAtE/ippCllnPPSmaPmKxCSVk
 5RKn7ip2tc+mSGkzbMU5tTfmXj4B2gcKzxn1JdDMCKEbRpK1qAW+wNUNa6CRHINNce
 bDtRIfv+99lehWcty5cGBJhKiOAxm3E4v8g8NOzlGwX3TdKyv8YvyoOvdXPbigfbFV
 3TKMVel82XD8Q==
Date: Fri, 1 Sep 2023 09:11:46 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Rae Moar <rmoar@google.com>
Subject: Re: [PATCH RFC 2/2] drm: add documentation for drm_buddy_test kUnit
 test
Message-ID: <20230901091146.749cfdfa@sal.lan>
In-Reply-To: <CA+GJov6VPggogod2=pYAxKRnP_hnqO7DMmpTzT4AAU_fiPQOfw@mail.gmail.com>
References: <cover.1689171160.git.mchehab@kernel.org>
 <0e5f68ab045965292fee1748254bf9b91db9039a.1689171160.git.mchehab@kernel.org>
 <CA+GJov6VPggogod2=pYAxKRnP_hnqO7DMmpTzT4AAU_fiPQOfw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-kselftest@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Kees Cook <keescook@chromium.org>, Nikolai Kondrashov <spbnick@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, "Darrick J. Wong" <djwong@kernel.org>,
 linux-doc@vger.kernel.org, Brendan Higgins <brendanhiggins@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 =?UTF-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>, mauro.chehab@intel.com,
 David Gow <davidgow@google.com>, Shuah Khan <skhan@linuxfoundation.org>,
 Arthur Grillo <arthurgrillo@riseup.net>, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rae,

Em Thu, 13 Jul 2023 17:31:19 -0400
Rae Moar <rmoar@google.com> escreveu:

> On Wed, Jul 12, 2023 at 10:29 AM Mauro Carvalho Chehab <mchehab@kernel.or=
g>
> wrote:
>=20
> > As an example for the new documentation tool, add a documentation
> > for drm_buddy_test.
> >
> > I opted to place this on a completely different directory, in order
> > to make easier to test the feature with:
> >
> >         $ make SPHINXDIRS=3D"tests" htmldocs
> >
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > ---
> >
> > To avoid mailbombing on a large number of people, only mailing lists we=
re
> > C/C on the cover.
> > See [PATCH RFC 0/2] at:
> > https://lore.kernel.org/all/cover.1689171160.git.mchehab@kernel.org/
> >
> >  Documentation/index.rst                |  2 +-
> >  Documentation/tests/index.rst          |  6 ++++++
> >  Documentation/tests/kunit.rst          |  5 +++++
> >  drivers/gpu/drm/tests/drm_buddy_test.c | 12 ++++++++++++
> >  4 files changed, 24 insertions(+), 1 deletion(-)
> >  create mode 100644 Documentation/tests/index.rst
> >  create mode 100644 Documentation/tests/kunit.rst
> >
> > diff --git a/Documentation/index.rst b/Documentation/index.rst
> > index 9dfdc826618c..80a6ce14a61a 100644
> > --- a/Documentation/index.rst
> > +++ b/Documentation/index.rst
> > @@ -60,7 +60,7 @@ Various other manuals with useful information for all
> > kernel developers.
> >     fault-injection/index
> >     livepatch/index
> >     rust/index
> > -
> > +   test/index
> >
> >  User-oriented documentation
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> > diff --git a/Documentation/tests/index.rst b/Documentation/tests/index.=
rst
> > new file mode 100644
> > index 000000000000..bfc39eb5c0aa
> > --- /dev/null
> > +++ b/Documentation/tests/index.rst
> > @@ -0,0 +1,6 @@
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > +Kunit documentation test
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > +
> > +.. toctree::
> > +   kunit
> > diff --git a/Documentation/tests/kunit.rst b/Documentation/tests/kunit.=
rst
> > new file mode 100644
> > index 000000000000..6ffc151988a0
> > --- /dev/null
> > +++ b/Documentation/tests/kunit.rst
> > @@ -0,0 +1,5 @@
> > +Kunit tests
> > +-----------
> > +
> > +.. include-test:: drivers/gpu/drm/tests/drm_buddy_test.c
> > +
> > diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c
> > b/drivers/gpu/drm/tests/drm_buddy_test.c
> > index 09ee6f6af896..dd6c5afd6cd6 100644
> > --- a/drivers/gpu/drm/tests/drm_buddy_test.c
> > +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
> > @@ -737,6 +737,18 @@ static int drm_buddy_suite_init(struct kunit_suite
> > *suite)
> >         return 0;
> >  }
> >
> > +/**
> > + * KTEST_SUITE: set of tests for drm buddy alloc
> > + * Scope: drm subsystem
> > + * Mega feature: drm
> > + * Feature: buddy_alloc
> > + *
> > + * KTEST_TEST: drm_test_buddy_alloc_%s
> > + * Description: Run DRM buddy allocation %arg[1] test
> > + *
> > + * arg[1].values: limit, range, optimistic, smoke, pathological
> > + */ =20
>=20
>=20
> Hi!
>=20
> This is such a cool patch series. I just have a few comments related to t=
he
> output.

Thank you for your comments! Sorry for not answering earlier. I took some
vacations and this series ended sleeping over other tasks on my
todo list.

Also, before sending another version, I wanted to have the test_list.py
changes to make it generic enough to be merged on IGT, to avoid having
a fork of it. Those got merged today.

> In the html output the tests are listed as:
> ktest@drm_buddy_test@=E2=80=A6
>=20
> I wonder if instead of using the file name of =E2=80=9Cdrm_buddy_test=E2=
=80=9D this could
> possibly be the suite name, =E2=80=9Cdrm_buddy=E2=80=9D, as this is what =
users will call
> when using kunit.py to run the tests. Although "drm_buddy_test" is also t=
he
> module name so I don't mind it too much. But in the future the file name
> and module name are not guaranteed to be the same for other tests.
>=20
> Most preferably, there would be a reference to the kunit suite name, file
> name, and the module name.

I guess it shouldn't be hard to do such change in a way that it won't
affect its usage on IGT. We need to define what would be the best
pattern. As this can be used for both kunit and selftests, I would
place kunit at the beginning.

Currently, we're using:

	kunit@<base file name without .c>@<test_name>

Some possible patterns would be:

	kunit@<base file name without .c>@<suite name>@<test_name>
	kunit@<subsystem>@<base file name without .c>@<suite name>@<test_name>
	kunit@<subsystem>@<suite name>@<test_name>

Would do you think it would work best?

> This may be difficult to implement as these can all differ. I am currently
> working on the KUnit Attribute framework which saves the module name and I
> am thinking about also saving the file path as a future attribute. This
> could be a helpful framework for the KUnit tests specifically.
>=20
> I am not sure how easy it would be to access c objects/functions using th=
is
> system.

I would prefer not. C language allows lots of flexibility with macros,
making it hard to write a parser to read those C objects from the source.
We have this at kernel-doc. As one of the people that did some work there,
I can say that that several tricks are needed to keep this working.

On the other hand, it should be easy to use the TestList class from
test_list.py at kunit.py.

So, kunit.py could use the data that came from the documentation
directly.

> Finally, I was wondering if it is the intention to put a list of all kunit
> tests that use this new feature into tests/kunit.rst or would this be
> broken up in some way

IMO, it makes sense to break this per subsystem, and have an auto-generated
index.rst pointing to the entire set of documents.

We're already storing the subsystem at the documentation macros, so, IMO,
it should shouldn't be hard to implement it.

Regards,
Mauro

