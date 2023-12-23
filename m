Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D29B681D386
	for <lists+dri-devel@lfdr.de>; Sat, 23 Dec 2023 11:29:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5696D10E083;
	Sat, 23 Dec 2023 10:29:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6545E10E083
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Dec 2023 10:29:45 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-35fe994dab5so2951875ab.0
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Dec 2023 02:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703327384; x=1703932184; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3dv9ICazMeCDitMC91RhSbjCAjoQbY7c1ky5YJiQji0=;
 b=hjMQvtVcA3Ci3fWBHYITWrzqE3LDe6/nhZbejhvnvE4BSwUf9tS16t3/tITnmuI53Y
 GXqTjmGiorwfq593mcusjXRv5mdFCHVwz2pklwipIrPLeiNvAUyM6ttQSDy7v7Ero8E5
 tQOnLU2249vKQPQyf55m8mDRH9mgcy9XzL/CVDFtTwmzSqSzwWbcP7+GWbnLty4m7CJu
 D6ykTo639HizR7E4uDV9tt+f15TKVF3nGOz+xRzTmw+nUVl9A2B3xsvEK2RjnOJ2Xag4
 z7aKe9Ln12tYYjW9ORiqdLNMrJUR/xjOkpX34pBI+gAuY2yLql8nzLSI/ER+W07/zABc
 ePWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703327384; x=1703932184;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3dv9ICazMeCDitMC91RhSbjCAjoQbY7c1ky5YJiQji0=;
 b=K3s5Zh1fSWyAuh0i5bzbWq8o2KrH0BkMIPc5WPK3CK8eByOUente2yBwwCRu6PCbRU
 BZL/WR3FZuWwNia42gHakzMIUst+LKRo93G9xoFcAZB6csMweXqvcwSj4Vg87TVdpXoN
 i2uroU+RtGfloeuJSMmlM0jvAJGG3lkLmlht/SSoPA2EA9dz4/FWl/h3+1LRZo7CnA63
 Bycv1bdk4NxTzugWaEBByqlW9WXjMTBi7MSVGrlZDmD9e2nx0q6q2sFj/FAg0L/NLm6T
 i/LfvAVzu3XBGLseeQ+VivIBh+nCVJmhIfhIaNrxM/6/rOp3cQ/MjpxZAR2EQXud6vau
 3Omg==
X-Gm-Message-State: AOJu0Yz2CAO4xWPT5K7xo5MHyFSFAoYj76eAdJwM/NDyrNhbdtGwGFI6
 KMk3U2w5Jnuclo2oX6wBZsqxDT0+vFiHixVIJQg=
X-Google-Smtp-Source: AGHT+IHqOqsVt/Qj8vOvffF7QZgt1eonUU+tZfwiFrL4rVRHRKI3vg3q+UkfYJ5JvKFDObjuRpdEr9i90ShnbmPvJRY=
X-Received: by 2002:a05:6e02:184c:b0:35f:e9ac:6d9a with SMTP id
 b12-20020a056e02184c00b0035fe9ac6d9amr2417617ilv.30.1703327384600; Sat, 23
 Dec 2023 02:29:44 -0800 (PST)
MIME-Version: 1.0
References: <20231110192452.734925-1-dipamt1729@gmail.com>
 <goxsh3zfoaacariu2dst5ww6ta7g2ubk24impowabvmfte5d4a@fxemdptwshzs>
In-Reply-To: <goxsh3zfoaacariu2dst5ww6ta7g2ubk24impowabvmfte5d4a@fxemdptwshzs>
From: Dipam Turkar <dipamt1729@gmail.com>
Date: Sat, 23 Dec 2023 15:59:33 +0530
Message-ID: <CALHmwspWRT=pj+mPDhf8YTwSpTz6LiNjq18wbUk7wCW3ijKU4A@mail.gmail.com>
Subject: Re: [PATCH v2] drm/tests: Add KUnit tests for
 drm_mode_create_dvi_i_properties()
To: Maxime Ripard <mripard@kernel.org>
Content-Type: multipart/alternative; boundary="000000000000b20375060d2acf60"
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
 linux-kernel@vger.kernel.org, mairacanal@riseup.net, airlied@gmail.com,
 arthurgrillo@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000b20375060d2acf60
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I needed some help regarding introducing a separate test for testing if the
function still works if called a second time as suggested. Wouldn't we need
to call it on the same object we called in the first time. So, that will
bring redundancy in the two functions. Is this correct? Or am I
understanding this wrong?

Thanks and regards
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

--000000000000b20375060d2acf60
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I needed some help regarding introducing a separate t=
est for testing if the function still works if called a second time as sugg=
ested. Wouldn&#39;t we need to call it on the same object we called in the =
first time. So, that will bring redundancy in the two functions. Is this=C2=
=A0correct? Or am I understanding this wrong?</div><div><br></div><div>Than=
ks and regards</div><div>Dipam Turkar<br> </div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 28, 2023 at 8:3=
9=E2=80=AFPM Maxime Ripard &lt;<a href=3D"mailto:mripard@kernel.org">mripar=
d@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Hi,<br>
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

--000000000000b20375060d2acf60--
