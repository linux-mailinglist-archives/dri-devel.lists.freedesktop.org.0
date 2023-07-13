Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1646752C1E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 23:31:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91F8410E0BA;
	Thu, 13 Jul 2023 21:31:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A397310E0BA
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 21:31:35 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-51e55517de3so1525a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 14:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1689283893; x=1691875893;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7JPizioZ64e7vZaH+qUrnLYGj7wl6G9yqwErK/ROzZQ=;
 b=3sINAwftmhpohmjRbCRfhdJMVt5H46DNpb5/F+qMWFU3JEp8UAahm6uTeYK3OoHfpn
 25TXAh/gFAeYUANiGo9sLZiTWC0y5qUs9+nDlADM96DReXtrLljj7KQ3nQUy2wRd+5EA
 2e9tqhUOOwUQWvuMXh4pKrHnaMp5r3tXXp/cKKLe4zTogfI7lFrkCxn05p76BCxYcf2I
 himNcKeGM+e3+o1CIu4O5B+K8GYv4/EOjhFknlbXpqOb+PsIiXwekdUW5sudcWNAMO5J
 0H0Z6LvJuBQRtg06M10kK34Q5SPV9A9H/XA5nAprRKw5gUvTv6r69MOOMw/+ru3Jzum0
 YGaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689283893; x=1691875893;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7JPizioZ64e7vZaH+qUrnLYGj7wl6G9yqwErK/ROzZQ=;
 b=d9u0xDX1inU3Gx2L8mMVw4BMzWlJG1GcpZbvABCgQ4fNpsmB3n2jWmMbYW2yZNziUb
 1FBy4ZAqqhCcOKRtVAqRJg8WLNXnEYOrn8tzxkiPDX8sEy4TY4vvPTVu406SHlBdAPDc
 WFo0Lx+CqH5TcIw25EHYiOQnvUbXD2k41C/dQXOwEwNyqOqrwxTMQreydtO43a3WXO2o
 uEbSVsO9EYXahDzVvdq7iaOrSHdKCfR88YcIPxKNj0FvBe36yuvs6kyIhC1FLD/zcbBh
 wmu9P74D4tb4nh/Zky3jz6BdsPApTRlmph+CWScGbwBrEPSdp958/KOzFbf/BNXve/EE
 9L5A==
X-Gm-Message-State: ABy/qLaDptM8FjifAacKwYL+yFb6Ep/2PunHxuXIpqfYcvcT2trvgthX
 D4i64DoZAjreckwbppk25zHQ7XrTlTtelDTZNkcH6g==
X-Google-Smtp-Source: APBJJlEsDW8/FUiULQK0fufULwkjmCKjJAHnWHPbKVSpJ7HlyWYfNXZcrZSXkQ+9Ba2APoMMPYnktAIhGIwNxj1BkUM=
X-Received: by 2002:a50:f69e:0:b0:51d:ebed:93a6 with SMTP id
 d30-20020a50f69e000000b0051debed93a6mr299519edn.5.1689283891814; Thu, 13 Jul
 2023 14:31:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1689171160.git.mchehab@kernel.org>
 <0e5f68ab045965292fee1748254bf9b91db9039a.1689171160.git.mchehab@kernel.org>
In-Reply-To: <0e5f68ab045965292fee1748254bf9b91db9039a.1689171160.git.mchehab@kernel.org>
From: Rae Moar <rmoar@google.com>
Date: Thu, 13 Jul 2023 17:31:19 -0400
Message-ID: <CA+GJov6VPggogod2=pYAxKRnP_hnqO7DMmpTzT4AAU_fiPQOfw@mail.gmail.com>
Subject: Re: [PATCH RFC 2/2] drm: add documentation for drm_buddy_test kUnit
 test
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: multipart/alternative; boundary="0000000000004c7ab10600650e8b"
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
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>, mauro.chehab@intel.com,
 David Gow <davidgow@google.com>, Shuah Khan <skhan@linuxfoundation.org>,
 Arthur Grillo <arthurgrillo@riseup.net>, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000004c7ab10600650e8b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 12, 2023 at 10:29 AM Mauro Carvalho Chehab <mchehab@kernel.org>
wrote:

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
> To avoid mailbombing on a large number of people, only mailing lists were
> C/C on the cover.
> See [PATCH RFC 0/2] at:
> https://lore.kernel.org/all/cover.1689171160.git.mchehab@kernel.org/
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
> @@ -60,7 +60,7 @@ Various other manuals with useful information for all
> kernel developers.
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
> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c
> b/drivers/gpu/drm/tests/drm_buddy_test.c
> index 09ee6f6af896..dd6c5afd6cd6 100644
> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
> @@ -737,6 +737,18 @@ static int drm_buddy_suite_init(struct kunit_suite
> *suite)
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


Hi!

This is such a cool patch series. I just have a few comments related to the
output.

In the html output the tests are listed as:
ktest@drm_buddy_test@=E2=80=A6

I wonder if instead of using the file name of =E2=80=9Cdrm_buddy_test=E2=80=
=9D this could
possibly be the suite name, =E2=80=9Cdrm_buddy=E2=80=9D, as this is what us=
ers will call
when using kunit.py to run the tests. Although "drm_buddy_test" is also the
module name so I don't mind it too much. But in the future the file name
and module name are not guaranteed to be the same for other tests.

Most preferably, there would be a reference to the kunit suite name, file
name, and the module name.

This may be difficult to implement as these can all differ. I am currently
working on the KUnit Attribute framework which saves the module name and I
am thinking about also saving the file path as a future attribute. This
could be a helpful framework for the KUnit tests specifically.

I am not sure how easy it would be to access c objects/functions using this
system.

Finally, I was wondering if it is the intention to put a list of all kunit
tests that use this new feature into tests/kunit.rst or would this be
broken up in some way

Thanks!
-Rae



> +
>  static struct kunit_case drm_buddy_tests[] =3D {
>         KUNIT_CASE(drm_test_buddy_alloc_limit),
>         KUNIT_CASE(drm_test_buddy_alloc_range),
> --
> 2.40.1
>
>

--0000000000004c7ab10600650e8b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Wed, Jul 12, 2023 at 10:29 AM Mauro Carva=
lho Chehab &lt;<a href=3D"mailto:mchehab@kernel.org" target=3D"_blank">mche=
hab@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">As an=
 example for the new documentation tool, add a documentation<br>
for drm_buddy_test.<br>
<br>
I opted to place this on a completely different directory, in order<br>
to make easier to test the feature with:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $ make SPHINXDIRS=3D&quot;tests&quot; htmldocs<=
br>
<br>
Signed-off-by: Mauro Carvalho Chehab &lt;<a href=3D"mailto:mchehab@kernel.o=
rg" target=3D"_blank">mchehab@kernel.org</a>&gt;<br>
---<br>
<br>
To avoid mailbombing on a large number of people, only mailing lists were C=
/C on the cover.<br>
See [PATCH RFC 0/2] at: <a href=3D"https://lore.kernel.org/all/cover.168917=
1160.git.mchehab@kernel.org/" rel=3D"noreferrer" target=3D"_blank">https://=
lore.kernel.org/all/cover.1689171160.git.mchehab@kernel.org/</a><br>
<br>
=C2=A0Documentation/index.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0Documentation/tests/index.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 6 ++++++<br>
=C2=A0Documentation/tests/kunit.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 5 +++++<br>
=C2=A0drivers/gpu/drm/tests/drm_buddy_test.c | 12 ++++++++++++<br>
=C2=A04 files changed, 24 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 Documentation/tests/index.rst<br>
=C2=A0create mode 100644 Documentation/tests/kunit.rst<br>
<br>
diff --git a/Documentation/index.rst b/Documentation/index.rst<br>
index 9dfdc826618c..80a6ce14a61a 100644<br>
--- a/Documentation/index.rst<br>
+++ b/Documentation/index.rst<br>
@@ -60,7 +60,7 @@ Various other manuals with useful information for all ker=
nel developers.<br>
=C2=A0 =C2=A0 fault-injection/index<br>
=C2=A0 =C2=A0 livepatch/index<br>
=C2=A0 =C2=A0 rust/index<br>
-<br>
+=C2=A0 =C2=A0test/index<br>
<br>
=C2=A0User-oriented documentation<br>
=C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D<br>
diff --git a/Documentation/tests/index.rst b/Documentation/tests/index.rst<=
br>
new file mode 100644<br>
index 000000000000..bfc39eb5c0aa<br>
--- /dev/null<br>
+++ b/Documentation/tests/index.rst<br>
@@ -0,0 +1,6 @@<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<b=
r>
+Kunit documentation test<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<b=
r>
+<br>
+.. toctree::<br>
+=C2=A0 =C2=A0kunit<br>
diff --git a/Documentation/tests/kunit.rst b/Documentation/tests/kunit.rst<=
br>
new file mode 100644<br>
index 000000000000..6ffc151988a0<br>
--- /dev/null<br>
+++ b/Documentation/tests/kunit.rst<br>
@@ -0,0 +1,5 @@<br>
+Kunit tests<br>
+-----------<br>
+<br>
+.. include-test:: drivers/gpu/drm/tests/drm_buddy_test.c<br>
+<br>
diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests=
/drm_buddy_test.c<br>
index 09ee6f6af896..dd6c5afd6cd6 100644<br>
--- a/drivers/gpu/drm/tests/drm_buddy_test.c<br>
+++ b/drivers/gpu/drm/tests/drm_buddy_test.c<br>
@@ -737,6 +737,18 @@ static int drm_buddy_suite_init(struct kunit_suite *su=
ite)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
=C2=A0}<br>
<br>
+/**<br>
+ * KTEST_SUITE: set of tests for drm buddy alloc<br>
+ * Scope: drm subsystem<br>
+ * Mega feature: drm<br>
+ * Feature: buddy_alloc<br>
+ *<br>
+ * KTEST_TEST: drm_test_buddy_alloc_%s<br>
+ * Description: Run DRM buddy allocation %arg[1] test<br>
+ *<br>
+ * arg[1].values: limit, range, optimistic, smoke, pathological<br>
+ */</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Hi!</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">This is such a cool patch series=
. I just have a few comments related to the output.</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">In the html output the tests are listed as:</di=
v><div dir=3D"auto">ktest@drm_buddy_test@=E2=80=A6</div><div dir=3D"auto"><=
br></div><div dir=3D"auto">I wonder if instead of using the file name of =
=E2=80=9Cdrm_buddy_test=E2=80=9D this could possibly be the suite name, =E2=
=80=9Cdrm_buddy=E2=80=9D, as this is what users will call when using kunit.=
py to run the tests. Although &quot;drm_buddy_test&quot; is also the module=
 name so I don&#39;t mind it too much. But in the future the file name and =
module name are not guaranteed to be the same for other=C2=A0tests.=C2=A0</=
div><div dir=3D"auto"><br></div><div dir=3D"auto">Most preferably, there wo=
uld be a reference to the kunit suite name, file name, and the module name.=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">This may be difficult t=
o implement as these can all differ. I am currently working on the KUnit At=
tribute framework which saves the module name and I am thinking about also =
saving the file path as a future attribute. This could be a helpful framewo=
rk for the KUnit tests specifically.</div><div dir=3D"auto"><br></div><div>=
I am not sure how easy it would be to access c objects/functions using this=
 system.</div><div><br></div><div>Finally, I was wondering if it is the int=
ention to put a list of all kunit tests that use this new feature into test=
s/kunit.rst=C2=A0or would this be broken up in some way</div><div dir=3D"au=
to"><br></div><div>Thanks!</div><div>-Rae</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br=
>
+<br>
=C2=A0static struct kunit_case drm_buddy_tests[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 KUNIT_CASE(drm_test_buddy_alloc_limit),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 KUNIT_CASE(drm_test_buddy_alloc_range),<br>
-- <br>
2.40.1<br>
<br>
</blockquote></div></div>
</div>

--0000000000004c7ab10600650e8b--
