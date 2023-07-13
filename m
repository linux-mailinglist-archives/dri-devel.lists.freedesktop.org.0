Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED986752D34
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 00:49:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6803410E79C;
	Thu, 13 Jul 2023 22:49:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BF3910E79C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 22:49:19 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-516500163b2so2435a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 15:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1689288556; x=1691880556;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MzcnyZs6D3jZP1/90Em2wdIP94ZrD+KbkxYDRuLwWJE=;
 b=YbSBSKEGuVEqFb+8L1xB90bbx9PAx1IFGTDlwilLvm19IfKutZMrVwaN1yOaCXRzw5
 MZUQjJpEWVZM0DR2m5AxleVdTk2ymAh4HpgWCiWdwfTjEVXF/OpyyFu9SpllQ9lrpzdT
 xyz9Ijr8jA8PvvDfPo4oQpv5DJikjRnpxtuIZp0ll1yB/cHvfRQFiMg+OlFSVqnBDCy6
 XZDThvtyAqCF75ID6U6JTpxG0+cS19CczfMsQ91gOY/M4t0H+rGN+4TvSNyxeinNxePx
 0VjKQaZWz00m4npcN3skY9OJrbHcetRubpJbVaAiBp269Hce49FsIai61vXQji+qF6jZ
 yGAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689288556; x=1691880556;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MzcnyZs6D3jZP1/90Em2wdIP94ZrD+KbkxYDRuLwWJE=;
 b=GsT5pnA85FpUrTE5Icl4TkBEEUi8rn/zu0Rb0h465MHuJ03ONXUt2fKE/xKOV8fFSn
 cCWX8ELKaJQCT8FU4dW3pmJHLZBtQt+gb9HPVNUkx8g9C86eNzliCTcVMFxvmdQETCob
 iiCsktXRgs1oti7wR5oxz5r56iCqjkT3AQ6EVBNbxlMxy8flHCVCdD4aerO1pwe0s8Dx
 f/zvdao+LbaUeBG3VQCCwpgX6mvdolI/zaBf2RiIJGxT25Qr4OKmjKT3juoykm5MDaNJ
 XZGIEmR9DWnEy5D1l70ZBVRXcSHmkNKpQoj1hI15260buECnoZCOusCP3VWug6U7810O
 ToFw==
X-Gm-Message-State: ABy/qLbPUizTnr7EHvK9ctz/BnSw8PLCagTmUGzHMpwMeBO4qsSMa5nW
 nOETVWhH3Jnt38YBN2T0GNUmQljcu6UrLvPDzPV0UQ==
X-Google-Smtp-Source: APBJJlGqtqJFAuAxh5MPiLeVS1ew+4dt62Lqbmv37bwCVq092aGdah1wT/JBThvQYfrLGxPjsNzHlRJYNInGjgUPRpw=
X-Received: by 2002:a50:9ea7:0:b0:514:92e4:ab9f with SMTP id
 a36-20020a509ea7000000b0051492e4ab9fmr297828edf.7.1689288555839; Thu, 13 Jul
 2023 15:49:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1689171160.git.mchehab@kernel.org>
 <0e5f68ab045965292fee1748254bf9b91db9039a.1689171160.git.mchehab@kernel.org>
In-Reply-To: <0e5f68ab045965292fee1748254bf9b91db9039a.1689171160.git.mchehab@kernel.org>
From: Rae Moar <rmoar@google.com>
Date: Thu, 13 Jul 2023 18:49:02 -0400
Message-ID: <CA+GJov7ejGbgXPJYWKpve8Cz5M5z8G2vHJ0x+LZeK19OGmuX3A@mail.gmail.com>
Subject: Re: [PATCH RFC 2/2] drm: add documentation for drm_buddy_test kUnit
 test
To: Mauro Carvalho Chehab <mchehab@kernel.org>
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
Cc: linux-kselftest@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Kees Cook <keescook@chromium.org>, Nikolai Kondrashov <spbnick@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, "Darrick J. Wong" <djwong@kernel.org>,
 linux-doc@vger.kernel.org, Brendan Higgins <brendanhiggins@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Arthur Grillo <arthurgrillo@riseup.net>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>, mauro.chehab@intel.com,
 David Gow <davidgow@google.com>, Shuah Khan <skhan@linuxfoundation.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 12, 2023 at 10:29=E2=80=AFAM Mauro Carvalho Chehab
<mchehab@kernel.org> wrote:
>
> As an example for the new documentation tool, add a documentation
> for drm_buddy_test.
>
> I opted to place this on a completely different directory, in order
> to make easier to test the feature with:
>
>         $ make SPHINXDIRS=3D"tests" htmldocs
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>
> To avoid mailbombing on a large number of people, only mailing lists were=
 C/C on the cover.
> See [PATCH RFC 0/2] at: https://lore.kernel.org/all/cover.1689171160.git.=
mchehab@kernel.org/
>
>  Documentation/index.rst                |  2 +-
>  Documentation/tests/index.rst          |  6 ++++++
>  Documentation/tests/kunit.rst          |  5 +++++
>  drivers/gpu/drm/tests/drm_buddy_test.c | 12 ++++++++++++
>  4 files changed, 24 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/tests/index.rst
>  create mode 100644 Documentation/tests/kunit.rst
>
> diff --git a/Documentation/index.rst b/Documentation/index.rst
> index 9dfdc826618c..80a6ce14a61a 100644
> --- a/Documentation/index.rst
> +++ b/Documentation/index.rst
> @@ -60,7 +60,7 @@ Various other manuals with useful information for all k=
ernel developers.
>     fault-injection/index
>     livepatch/index
>     rust/index
> -
> +   test/index
>
>  User-oriented documentation
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> diff --git a/Documentation/tests/index.rst b/Documentation/tests/index.rs=
t
> new file mode 100644
> index 000000000000..bfc39eb5c0aa
> --- /dev/null
> +++ b/Documentation/tests/index.rst
> @@ -0,0 +1,6 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Kunit documentation test
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +.. toctree::
> +   kunit
> diff --git a/Documentation/tests/kunit.rst b/Documentation/tests/kunit.rs=
t
> new file mode 100644
> index 000000000000..6ffc151988a0
> --- /dev/null
> +++ b/Documentation/tests/kunit.rst
> @@ -0,0 +1,5 @@
> +Kunit tests
> +-----------
> +
> +.. include-test:: drivers/gpu/drm/tests/drm_buddy_test.c
> +
> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tes=
ts/drm_buddy_test.c
> index 09ee6f6af896..dd6c5afd6cd6 100644
> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
> @@ -737,6 +737,18 @@ static int drm_buddy_suite_init(struct kunit_suite *=
suite)
>         return 0;
>  }
>
> +/**
> + * KTEST_SUITE: set of tests for drm buddy alloc
> + * Scope: drm subsystem
> + * Mega feature: drm
> + * Feature: buddy_alloc
> + *
> + * KTEST_TEST: drm_test_buddy_alloc_%s
> + * Description: Run DRM buddy allocation %arg[1] test
> + *
> + * arg[1].values: limit, range, optimistic, smoke, pathological
> + */
> +

I apologize that the last email included a HTML attachment of the message.

Just in case anyone was unable to receive the last email here is a
copy of the message:

Hi!

This is such a cool patch series. I just have a few comments related
to the output.

In the html output the tests are listed as:
ktest@drm_buddy_test@...

I wonder if instead of using the file name of "drm_buddy_test" this
could possibly be the suite name, "drm_buddy", as this is what users
will call when using kunit.py to run the tests. Although
"drm_buddy_test" is also the module name so I don't mind it too much.
But in the future the file name and module name are not guaranteed to
be the same for other tests.

Most preferably, there would be a reference to the kunit suite name,
file name, and the module name.

This may be difficult to implement as these can all differ. I am
currently working on the KUnit Attribute framework which saves the
module name and I am thinking about also saving the file path as a
future attribute. This could be a helpful framework for the KUnit
tests specifically.

I am not sure how easy it would be to access c objects/functions using
this system.

Finally, I was wondering if it is the intention to put a list of all
KUnit tests that use this new feature into tests/kunit.rst or would
this be broken up in some way.

Thanks!
-Rae

>  static struct kunit_case drm_buddy_tests[] =3D {
>         KUNIT_CASE(drm_test_buddy_alloc_limit),
>         KUNIT_CASE(drm_test_buddy_alloc_range),
> --
> 2.40.1
>
