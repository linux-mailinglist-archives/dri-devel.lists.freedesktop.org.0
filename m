Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 516AA7FBEB9
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 16:56:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F4A310E590;
	Tue, 28 Nov 2023 15:55:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D0D10E589
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 15:55:56 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-28580df78f7so3743519a91.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 07:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701186956; x=1701791756; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VvmPWRnAX1AYNu/4stgfTBT6O2QOn26xq2OF6ArBo38=;
 b=NvVfU7Cu4tqgjLuDJz5MShHkzXCEic9YMQSxZNt9LWSInafpDpPwIBmYrl9jUdYPrz
 Zsp7+IXvjN6znenp0gBbZPMWCfJpUvtDKRn4WumpvpLqZwDQ+poyNx6hx2L3JG5ZU9kt
 RftAzmehUSDPd0zF2etDaHHj0DWOrT/9Az9HgEbWCMxJYG/1eKmnLt9/79ZR6o1729ju
 emRdB4WD4y+1vJR0l9CaXaWtil7G/NcXjTI3LUiB0FjvHB4wP5AXqwBTvyMH5Y+saqyT
 3+130lMiwGFojIBa7RwW6Lu8BZpD4nU8fiXHKkAKXncqFJ7y8REqbukyhurNxGWzdDGl
 wXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701186956; x=1701791756;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VvmPWRnAX1AYNu/4stgfTBT6O2QOn26xq2OF6ArBo38=;
 b=JkSKA7e2K2Vp3AN23XHiqHIiLtDlGrE6EPpkS0oltLnK6Adi4pC49SqIbZh+nT6EIu
 WA37QkVOWHLMXmiJq1Bz74myl7+MyEtXd5+e+xL9X0kg6m2g6yEfCfqRmeFuKlJyS8Tk
 QqGckEuCxCM+6TedWrO9KXPlfkXALkPAXddNnI82ENmFFgD11quvLwgfrbrJK5fw2mTQ
 WBLrDyYszqmEfOnbVphgg3SQNYAB4w8zaktONhGH5d8WIacfk9Abr7gqomq/BPAR5EiR
 FFjrJrlSyOt1UlVblBKXWDYr+ugSnVrQzr36ZNcA2gJF8N0GsA+YQHyYwY/7vV0aa0B9
 twfQ==
X-Gm-Message-State: AOJu0YyKqc0vjafCONLuHpKsxe2iZMKk79CdV7igjU5xOEQ3r+acqFli
 5KwRaW1lqe/krrBzgaM8suoxb5W1ccQW8R+LEiY=
X-Google-Smtp-Source: AGHT+IH8qY8PrHOpUPdoPY90nreUtfS7VeKuFXrCKkOqlLL2Sk0nWqVgthswsQ2ca9bvfUy3k6kggnfLJ7m3ks3LpdI=
X-Received: by 2002:a17:90b:350f:b0:285:ad94:a7fd with SMTP id
 ls15-20020a17090b350f00b00285ad94a7fdmr9392137pjb.44.1701186955803; Tue, 28
 Nov 2023 07:55:55 -0800 (PST)
MIME-Version: 1.0
References: <20231110192452.734925-1-dipamt1729@gmail.com>
 <goxsh3zfoaacariu2dst5ww6ta7g2ubk24impowabvmfte5d4a@fxemdptwshzs>
In-Reply-To: <goxsh3zfoaacariu2dst5ww6ta7g2ubk24impowabvmfte5d4a@fxemdptwshzs>
From: Dipam Turkar <dipamt1729@gmail.com>
Date: Tue, 28 Nov 2023 21:25:44 +0530
Message-ID: <CALHmwsr7ULnRABW81aO2J0ZBCEw-_Zhaj24UJ4Gii5b4QyPV5w@mail.gmail.com>
Subject: Re: [PATCH v2] drm/tests: Add KUnit tests for
 drm_mode_create_dvi_i_properties()
To: Maxime Ripard <mripard@kernel.org>
Content-Type: multipart/alternative; boundary="0000000000003318ed060b387454"
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
Cc: tzimmermann@suse.de, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mairacanal@riseup.net, arthurgrillo@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000003318ed060b387454
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Will work on that.

Dipam Turkar

On Tue, Nov 28, 2023 at 8:39=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:

> Hi,
>
> On Sat, Nov 11, 2023 at 12:54:53AM +0530, Dipam Turkar wrote:
> > Introduce unit tests for the drm_mode_create_dvi_i_properties() functio=
n
> to ensure
> > the proper creation of DVI-I specific connector properties.
> >
> > Signed-off-by: Dipam Turkar <dipamt1729@gmail.com>
> > ---
> >  drivers/gpu/drm/tests/drm_connector_test.c | 38 ++++++++++++++++++++++
> >  1 file changed, 38 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/tests/drm_connector_test.c
> b/drivers/gpu/drm/tests/drm_connector_test.c
> > index c66aa2dc8d9d..9ac1fd32c579 100644
> > --- a/drivers/gpu/drm/tests/drm_connector_test.c
> > +++ b/drivers/gpu/drm/tests/drm_connector_test.c
> > @@ -4,6 +4,9 @@
> >   */
> >
> >  #include <drm/drm_connector.h>
> > +#include <drm/drm_device.h>
> > +#include <drm/drm_drv.h>
> > +#include <drm/drm_kunit_helpers.h>
> >
> >  #include <kunit/test.h>
> >
> > @@ -58,6 +61,30 @@ static void
> drm_test_get_tv_mode_from_name_truncated(struct kunit *test)
> >       KUNIT_EXPECT_LT(test, ret, 0);
> >  };
> >
> > +/*
> > + * Test that drm_mode_create_dvi_i_properties() succeeds and
> > + * DVI-I subconnector and select subconectors properties have
> > + * been created.
> > + */
> > +static void drm_test_mode_create_dvi_i_properties(struct kunit *test)
> > +{
> > +     struct drm_device *drm;
> > +     struct device *dev;
> > +
> > +     dev =3D drm_kunit_helper_alloc_device(test);
> > +     KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
> > +
> > +     drm =3D __drm_kunit_helper_alloc_drm_device(test, dev, sizeof(*dr=
m),
> 0, DRIVER_MODESET);
> > +     KUNIT_ASSERT_NOT_ERR_OR_NULL(test, drm);
> > +
> > +     KUNIT_EXPECT_EQ(test, drm_mode_create_dvi_i_properties(drm), 0);
> > +     KUNIT_EXPECT_NOT_ERR_OR_NULL(test,
> drm->mode_config.dvi_i_select_subconnector_property);
> > +     KUNIT_EXPECT_NOT_ERR_OR_NULL(test,
> drm->mode_config.dvi_i_subconnector_property);
> > +
> > +     // Expect the function to return 0 if called twice.
>
> This is not the proper comment format
>
> > +     KUNIT_EXPECT_EQ(test, drm_mode_create_dvi_i_properties(drm), 0);
>
> This should be in a separate test, with a separate description. We want
> to test two things: that the function works well, and that the function
> still works if we call it a second time.
>
> > +}
> > +
> >  static struct kunit_case drm_get_tv_mode_from_name_tests[] =3D {
> >       KUNIT_CASE_PARAM(drm_test_get_tv_mode_from_name_valid,
> >                        drm_get_tv_mode_from_name_valid_gen_params),
> > @@ -70,7 +97,18 @@ static struct kunit_suite
> drm_get_tv_mode_from_name_test_suite =3D {
> >       .test_cases =3D drm_get_tv_mode_from_name_tests,
> >  };
>
> The test should be next to the test suite definition
>
> > +static struct kunit_case drm_connector_tests[] =3D {
> > +     KUNIT_CASE(drm_test_mode_create_dvi_i_properties),
> > +     { }
> > +};
> > +
> > +static struct kunit_suite drm_connector_test_suite =3D {
> > +     .name =3D "drm_connector",
>
> That's too generic, the test suite is only about
> drm_mode_create_dvi_i_properties(), not drm_connector in general.
>
> > +     .test_cases =3D drm_connector_tests,
> > +};
> > +
> >  kunit_test_suite(drm_get_tv_mode_from_name_test_suite);
> > +kunit_test_suite(drm_connector_test_suite);
>
> kunit_test_suites
>
> Maxime
>

--0000000000003318ed060b387454
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Will work on that.</div><div><br></div><div>Dipam Tur=
kar<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Tue, Nov 28, 2023 at 8:39=E2=80=AFPM Maxime Ripard &lt;<a h=
ref=3D"mailto:mripard@kernel.org">mripard@kernel.org</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
On Sat, Nov 11, 2023 at 12:54:53AM +0530, Dipam Turkar wrote:<br>
&gt; Introduce unit tests for the drm_mode_create_dvi_i_properties() functi=
on to ensure<br>
&gt; the proper creation of DVI-I specific connector properties.<br>
&gt; <br>
&gt; Signed-off-by: Dipam Turkar &lt;<a href=3D"mailto:dipamt1729@gmail.com=
" target=3D"_blank">dipamt1729@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/tests/drm_connector_test.c | 38 ++++++++++++++++=
++++++<br>
&gt;=C2=A0 1 file changed, 38 insertions(+)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/=
drm/tests/drm_connector_test.c<br>
&gt; index c66aa2dc8d9d..9ac1fd32c579 100644<br>
&gt; --- a/drivers/gpu/drm/tests/drm_connector_test.c<br>
&gt; +++ b/drivers/gpu/drm/tests/drm_connector_test.c<br>
&gt; @@ -4,6 +4,9 @@<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #include &lt;drm/drm_connector.h&gt;<br>
&gt; +#include &lt;drm/drm_device.h&gt;<br>
&gt; +#include &lt;drm/drm_drv.h&gt;<br>
&gt; +#include &lt;drm/drm_kunit_helpers.h&gt;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #include &lt;kunit/test.h&gt;<br>
&gt;=C2=A0 <br>
&gt; @@ -58,6 +61,30 @@ static void drm_test_get_tv_mode_from_name_truncate=
d(struct kunit *test)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0KUNIT_EXPECT_LT(test, ret, 0);<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; +/*<br>
&gt; + * Test that drm_mode_create_dvi_i_properties() succeeds and<br>
&gt; + * DVI-I subconnector and select subconectors properties have<br>
&gt; + * been created.<br>
&gt; + */<br>
&gt; +static void drm_test_mode_create_dvi_i_properties(struct kunit *test)=
<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *drm;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device *dev;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev =3D drm_kunit_helper_alloc_device(test);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm =3D __drm_kunit_helper_alloc_drm_device(test,=
 dev, sizeof(*drm), 0, DRIVER_MODESET);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0KUNIT_ASSERT_NOT_ERR_OR_NULL(test, drm);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0KUNIT_EXPECT_EQ(test, drm_mode_create_dvi_i_prope=
rties(drm), 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0KUNIT_EXPECT_NOT_ERR_OR_NULL(test, drm-&gt;mode_c=
onfig.dvi_i_select_subconnector_property);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0KUNIT_EXPECT_NOT_ERR_OR_NULL(test, drm-&gt;mode_c=
onfig.dvi_i_subconnector_property);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0// Expect the function to return 0 if called twic=
e.<br>
<br>
This is not the proper comment format<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0KUNIT_EXPECT_EQ(test, drm_mode_create_dvi_i_prope=
rties(drm), 0);<br>
<br>
This should be in a separate test, with a separate description. We want<br>
to test two things: that the function works well, and that the function<br>
still works if we call it a second time.<br>
<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 static struct kunit_case drm_get_tv_mode_from_name_tests[] =3D {=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0KUNIT_CASE_PARAM(drm_test_get_tv_mode_from_n=
ame_valid,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 drm_get_tv_mode_from_name_valid_gen_params),<br>
&gt; @@ -70,7 +97,18 @@ static struct kunit_suite drm_get_tv_mode_from_name=
_test_suite =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.test_cases =3D drm_get_tv_mode_from_name_te=
sts,<br>
&gt;=C2=A0 };<br>
<br>
The test should be next to the test suite definition<br>
<br>
&gt; +static struct kunit_case drm_connector_tests[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0KUNIT_CASE(drm_test_mode_create_dvi_i_properties)=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ }<br>
&gt; +};<br>
&gt; +<br>
&gt; +static struct kunit_suite drm_connector_test_suite =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.name =3D &quot;drm_connector&quot;,<br>
<br>
That&#39;s too generic, the test suite is only about<br>
drm_mode_create_dvi_i_properties(), not drm_connector in general.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.test_cases =3D drm_connector_tests,<br>
&gt; +};<br>
&gt; +<br>
&gt;=C2=A0 kunit_test_suite(drm_get_tv_mode_from_name_test_suite);<br>
&gt; +kunit_test_suite(drm_connector_test_suite);<br>
<br>
kunit_test_suites<br>
<br>
Maxime<br>
</blockquote></div>

--0000000000003318ed060b387454--
