Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 066CD604610
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 14:56:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0714A10EAD6;
	Wed, 19 Oct 2022 12:56:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B07AD10E998;
 Wed, 19 Oct 2022 12:56:20 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 bh7-20020a05600c3d0700b003c6fb3b2052so5357248wmb.2; 
 Wed, 19 Oct 2022 05:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0WaTBRcWI0PprR43j0Khvc0rTrt91bC3dvCC0GQdlaM=;
 b=Ab9BZHYrqQIgRzgpnZGm3kcbeBtAJGfkx25xpQZ9hoPoB7wjptcA+3ELYu/SDPeRC8
 MnFNkCgtDAIPvbg8/lSAyOpvLIM3GHLBGSE4ItebHTIVs0Sa2hL4uKEWxY7vyXghVXix
 iwohwsqOz3byWmVrO/gSKgl7d30XsRwLcjmac/mwgvmk9JGQxjxl8P/+CBgxwe2Mjq6H
 xrwWUPgKuefZmd5OwPEim4XrA1bornhIIur8QhsUF/HqBrB7cGgH2feEl68ZwU6botrV
 e/EKBeIljhuYkcqNoshuTkjlzmwq0NSiAl45J4lo2ZQ+DH9e0ombJY5ykVjyYsztNSD9
 uyaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0WaTBRcWI0PprR43j0Khvc0rTrt91bC3dvCC0GQdlaM=;
 b=SnbRNAHQv4TtB24lOVw7/jVTvEVy68yGvIxGcsZY7NzuInppAQjQzYjTdmQqKZiW24
 sgsSDmhQGNeXBcm6X3nV1RzPWxAWujeR/A3kWBHLQcHoFXMJP6+UvULkdH/KRNpmuDrn
 den0f/5Pvl1Oob4Bbyo9WoZS/0la19PZ+vYIFShuTUr1KWOlhXH502JqyrkpsUII6vKQ
 TQWxS+RpGdOV4jxC7molnnBOzi4p9EfhqyAO8qmYaOZMDO+Yz7rxVayGtOonx60wxILX
 ozqP78Wm/O3S7iyv6B56X8k4InuhjYwH44nuvD//orYfT1xma19pzjFExUlVgfD3/VFZ
 jHcA==
X-Gm-Message-State: ACrzQf1IbUF5uh6rcgUNWygUAya7VrmhQtepcef0npYwX14xo4NRM3AW
 IQrpFgutKDTKDbpluFbwi8L+v6m+h9AJMAYpOt4=
X-Google-Smtp-Source: AMsMyM5qcKw9UawwiWDLvtGEAHaXQSMo7ca/WKM1r58rASN4Z+z8LFJeCD+N0zr0cahOe88OFLBfTEumrdAIxVqPYEs=
X-Received: by 2002:a7b:c7c1:0:b0:3c7:103:f964 with SMTP id
 z1-20020a7bc7c1000000b003c70103f964mr4240871wmk.121.1666184178958; Wed, 19
 Oct 2022 05:56:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220912155919.39877-1-mairacanal@riseup.net>
 <20220912155919.39877-2-mairacanal@riseup.net>
 <3a285040-8541-59e3-a124-7bf16c38b180@amd.com>
In-Reply-To: <3a285040-8541-59e3-a124-7bf16c38b180@amd.com>
From: Magali Lemes <magalilemes00@gmail.com>
Date: Wed, 19 Oct 2022 09:56:07 -0300
Message-ID: <CADhVOGtiO4eT-aY5xfP5gQs7rXeDAfNM=6OOxYCXcVazesfgXA@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] drm/amd/display: Introduce KUnit tests for
 fixed31_32 library
To: Harry Wentland <hwentlan@amd.com>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Latypov <dlatypov@google.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>,
 Isabella Basso <isabbasso@riseup.net>, andrealmeid@riseup.net,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 kunit-dev@googlegroups.com, Leo Li <sunpeng.li@amd.com>, mwen@igalia.com,
 David Gow <davidgow@google.com>, tales.aparecida@gmail.com, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, Nicholas Choi <nicholas.choi@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Em sex., 30 de set. de 2022 =C3=A0s 11:14, Harry Wentland
<hwentlan@amd.com> escreveu:
>
>
>
> On 9/12/22 11:59, Ma=C3=ADra Canal wrote:
> > From: Tales Aparecida <tales.aparecida@gmail.com>
> >
> > The fixed31_32 library performs a lot of the mathematical operations
> > involving fixed-point arithmetic and the conversion of integers to
> > fixed-point representation.
> >
> > This unit tests intend to assure the proper functioning of the basic
> > mathematical operations of fixed-point arithmetic, such as
> > multiplication, conversion from fractional to fixed-point number,
> > and more. Use kunit_tool to run:
> >
> > $ ./tools/testing/kunit/kunit.py run --arch=3Dx86_64 \
> >       --kunitconfig=3Ddrivers/gpu/drm/amd/display/tests/
> >
> > Reviewed-by: David Gow <davidgow@google.com>
> > Signed-off-by: Tales Aparecida <tales.aparecida@gmail.com>
> > Signed-off-by: Ma=C3=ADra Canal <mairacanal@riseup.net>
> > ---
> >  drivers/gpu/drm/amd/display/Kconfig           |  13 +
> >  drivers/gpu/drm/amd/display/Makefile          |   2 +-
> >  .../gpu/drm/amd/display/tests/.kunitconfig    |   6 +
> >  drivers/gpu/drm/amd/display/tests/Makefile    |  12 +
> >  .../display/tests/dc/basics/fixpt31_32_test.c | 232 ++++++++++++++++++
> >  5 files changed, 264 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/gpu/drm/amd/display/tests/.kunitconfig
> >  create mode 100644 drivers/gpu/drm/amd/display/tests/Makefile
> >  create mode 100644 drivers/gpu/drm/amd/display/tests/dc/basics/fixpt31=
_32_test.c
> >
> > diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/=
display/Kconfig
> > index 96cbc87f7b6b..cc44cfe88607 100644
> > --- a/drivers/gpu/drm/amd/display/Kconfig
> > +++ b/drivers/gpu/drm/amd/display/Kconfig
> > @@ -55,4 +55,17 @@ config DRM_AMD_SECURE_DISPLAY
> >              Cooperate with specific DMCU FW.
> >
> >
> > +config AMD_DC_BASICS_KUNIT_TEST
>
> I would prefer if we kept the same prefix as for other
> configs in the file: "DRM_AMD_DC". Maybe name all the
> KUNIT configs here "DRM_AMD_DC_KUNIT_XYZ".
>
>
> > +     bool "Enable KUnit tests for the 'basics' sub-component of DAL" i=
f !KUNIT_ALL_TESTS
> > +     depends on DRM_AMD_DC && KUNIT
> > +     default KUNIT_ALL_TESTS
> > +     help
> > +             Enables unit tests for the Display Core. Only useful for =
kernel
> > +             devs running KUnit.
> > +
> > +             For more information on KUnit and unit tests in general p=
lease refer to
> > +             the KUnit documentation in Documentation/dev-tools/kunit/=
.
> > +
> > +             If unsure, say N.
> > +
> >  endmenu
> > diff --git a/drivers/gpu/drm/amd/display/Makefile b/drivers/gpu/drm/amd=
/display/Makefile
> > index 2633de77de5e..0f329aab13f0 100644
> > --- a/drivers/gpu/drm/amd/display/Makefile
> > +++ b/drivers/gpu/drm/amd/display/Makefile
> > @@ -43,7 +43,7 @@ endif
> >  #TODO: remove when Timing Sync feature is complete
> >  subdir-ccflags-y +=3D -DBUILD_FEATURE_TIMING_SYNC=3D0
> >
> > -DAL_LIBS =3D amdgpu_dm dc      modules/freesync modules/color modules/=
info_packet modules/power dmub/src
> > +DAL_LIBS =3D amdgpu_dm dc      modules/freesync modules/color modules/=
info_packet modules/power dmub/src tests
>
> Can we put these tests into a 'kunit' directory instead of 'tests'?
> We use the codebase on other platforms and 'tests' might be
> confusing to some AMD-internal developers, whereas 'kunit' is
> explicit and will ensure people understand where these are coming
> from and how to use them.
>
> Other than the CONFIG and directory naming these tests look really
> nice. Thanks for your contribution.
>
> Harry
>

Hi, Harry.
Thank you for your feedback and comments. We'll change the directory
and config entries' names in a new version.

Magali

> >
> >  ifdef CONFIG_DRM_AMD_DC_HDCP
> >  DAL_LIBS +=3D modules/hdcp
> > diff --git a/drivers/gpu/drm/amd/display/tests/.kunitconfig b/drivers/g=
pu/drm/amd/display/tests/.kunitconfig
> > new file mode 100644
> > index 000000000000..60f2ff8158f5
> > --- /dev/null
> > +++ b/drivers/gpu/drm/amd/display/tests/.kunitconfig
> > @@ -0,0 +1,6 @@
> > +CONFIG_KUNIT=3Dy
> > +CONFIG_PCI=3Dy
> > +CONFIG_DRM=3Dy
> > +CONFIG_DRM_AMDGPU=3Dy
> > +CONFIG_DRM_AMD_DC=3Dy
> > +CONFIG_AMD_DC_BASICS_KUNIT_TEST=3Dy
> > \ No newline at end of file
> > diff --git a/drivers/gpu/drm/amd/display/tests/Makefile b/drivers/gpu/d=
rm/amd/display/tests/Makefile
> > new file mode 100644
> > index 000000000000..ef16497318e8
> > --- /dev/null
> > +++ b/drivers/gpu/drm/amd/display/tests/Makefile
> > @@ -0,0 +1,12 @@
> > +# SPDX-License-Identifier: MIT
> > +#
> > +# Makefile for the KUnit Tests for DC
> > +#
> > +
> > +ifdef CONFIG_AMD_DC_BASICS_KUNIT_TEST
> > +     DC_TESTS +=3D dc/basics/fixpt31_32_test.o
> > +endif
> > +
> > +AMD_DAL_DC_TESTS =3D $(addprefix $(AMDDALPATH)/tests/,$(DC_TESTS))
> > +
> > +AMD_DISPLAY_FILES +=3D $(AMD_DAL_DC_TESTS)
> > diff --git a/drivers/gpu/drm/amd/display/tests/dc/basics/fixpt31_32_tes=
t.c b/drivers/gpu/drm/amd/display/tests/dc/basics/fixpt31_32_test.c
> > new file mode 100644
> > index 000000000000..2fc489203499
> > --- /dev/null
> > +++ b/drivers/gpu/drm/amd/display/tests/dc/basics/fixpt31_32_test.c
> > @@ -0,0 +1,232 @@
> > +// SPDX-License-Identifier: MIT
> > +/* Unit tests for display/include/fixed31_32.h and dc/basics/fixpt31_3=
2.c
> > + *
> > + * Copyright (C) 2022, Tales Aparecida <tales.aparecida@gmail.com>
> > + */
> > +
> > +#include <kunit/test.h>
> > +#include "os_types.h"
> > +#include "fixed31_32.h"
> > +
> > +static const struct fixed31_32 dc_fixpt_minus_one =3D { -0x100000000LL=
 };
> > +
> > +/**
> > + * dc_fixpt_from_int_test - KUnit test for dc_fixpt_from_int
> > + * @test: represents a running instance of a test.
> > + */
> > +static void dc_fixpt_from_int_test(struct kunit *test)
> > +{
> > +     struct fixed31_32 res;
> > +
> > +     res =3D dc_fixpt_from_int(0);
> > +     KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_zero.value);
> > +
> > +     res =3D dc_fixpt_from_int(1);
> > +     KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
> > +
> > +     res =3D dc_fixpt_from_int(-1);
> > +     KUNIT_EXPECT_EQ(test, res.value, -dc_fixpt_one.value);
> > +
> > +     res =3D dc_fixpt_from_int(INT_MAX);
> > +     KUNIT_EXPECT_EQ(test, res.value, 0x7FFFFFFF00000000LL);
> > +
> > +     res =3D dc_fixpt_from_int(INT_MIN);
> > +     KUNIT_EXPECT_EQ(test, res.value,
> > +                     0x8000000000000000LL); /* implicit negative signa=
l */
> > +}
> > +
> > +/**
> > + * dc_fixpt_from_fraction_test - KUnit test for dc_fixpt_from_fraction
> > + * @test: represents a running instance of a test.
> > + */
> > +static void dc_fixpt_from_fraction_test(struct kunit *test)
> > +{
> > +     struct fixed31_32 res;
> > +
> > +     /* Assert signal works as expected */
> > +     res =3D dc_fixpt_from_fraction(1LL, 1LL);
> > +     KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
> > +
> > +     res =3D dc_fixpt_from_fraction(-1LL, 1LL);
> > +     KUNIT_EXPECT_EQ(test, res.value, -dc_fixpt_one.value);
> > +
> > +     res =3D dc_fixpt_from_fraction(1LL, -1LL);
> > +     KUNIT_EXPECT_EQ(test, res.value, -dc_fixpt_one.value);
> > +
> > +     res =3D dc_fixpt_from_fraction(-1LL, -1LL);
> > +     KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
> > +
> > +     /* Assert that the greatest parameter values works as expected */
> > +     res =3D dc_fixpt_from_fraction(LLONG_MAX, LLONG_MAX);
> > +     KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
> > +
> > +     res =3D dc_fixpt_from_fraction(LLONG_MIN, LLONG_MIN);
> > +     KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
> > +
> > +     /* Edge case using the smallest fraction possible without LSB rou=
nding */
> > +     res =3D dc_fixpt_from_fraction(1, 1LL << (FIXED31_32_BITS_PER_FRA=
CTIONAL_PART));
> > +     KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_epsilon.value);
> > +
> > +     /* Edge case using the smallest fraction possible with LSB roundi=
ng */
> > +     res =3D dc_fixpt_from_fraction(1, 1LL << (FIXED31_32_BITS_PER_FRA=
CTIONAL_PART + 1));
> > +     KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_epsilon.value);
> > +
> > +     /* Assert an nil numerator is a valid input */
> > +     res =3D dc_fixpt_from_fraction(0LL, LLONG_MAX);
> > +     KUNIT_EXPECT_EQ(test, res.value, 0LL);
> > +
> > +     /* Edge case using every bit of the decimal part without rounding=
 */
> > +     res =3D dc_fixpt_from_fraction(8589934590LL, 8589934592LL);
> > +     KUNIT_EXPECT_EQ(test, res.value, 0x0FFFFFFFFLL);
> > +
> > +     res =3D dc_fixpt_from_fraction(-8589934590LL, 8589934592LL);
> > +     KUNIT_EXPECT_EQ(test, res.value, -0x0FFFFFFFFLL);
> > +
> > +     /* Edge case using every bit of the decimal part then rounding LS=
B */
> > +     res =3D dc_fixpt_from_fraction(8589934591LL, 8589934592LL);
> > +     KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
> > +
> > +     res =3D dc_fixpt_from_fraction(-8589934591LL, 8589934592LL);
> > +     KUNIT_EXPECT_EQ(test, res.value, -dc_fixpt_one.value);
> > +     /*  A repeating decimal in binary representation that doesn't rou=
nd up the LSB */
> > +     res =3D dc_fixpt_from_fraction(4, 3);
> > +     KUNIT_EXPECT_EQ(test, res.value, 0x0000000155555555LL);
> > +
> > +     res =3D dc_fixpt_from_fraction(-4, 3);
> > +     KUNIT_EXPECT_EQ(test, res.value, -0x0000000155555555LL);
> > +
> > +     /* A repeating decimal in binary representation that rounds up th=
e LSB */
> > +     res =3D dc_fixpt_from_fraction(5, 3);
> > +     KUNIT_EXPECT_EQ(test, res.value, 0x00000001AAAAAAABLL);
> > +
> > +     res =3D dc_fixpt_from_fraction(-5, 3);
> > +     KUNIT_EXPECT_EQ(test, res.value, -0x00000001AAAAAAABLL);
> > +}
> > +
> > +/**
> > + * dc_fixpt_mul_test - KUnit test for dc_fixpt_mul
> > + * @test: represents a running instance of a test.
> > + */
> > +static void dc_fixpt_mul_test(struct kunit *test)
> > +{
> > +     struct fixed31_32 res;
> > +     struct fixed31_32 arg;
> > +
> > +     /* Assert signal works as expected */
> > +     res =3D dc_fixpt_mul(dc_fixpt_one, dc_fixpt_one);
> > +     KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
> > +
> > +     res =3D dc_fixpt_mul(dc_fixpt_minus_one, dc_fixpt_one);
> > +     KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_minus_one.value);
> > +
> > +     res =3D dc_fixpt_mul(dc_fixpt_one, dc_fixpt_minus_one);
> > +     KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_minus_one.value);
> > +
> > +     res =3D dc_fixpt_mul(dc_fixpt_minus_one, dc_fixpt_minus_one);
> > +     KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
> > +
> > +     /* Assert that the greatest parameter values works as expected */
> > +     arg.value =3D LONG_MAX;
> > +     res =3D dc_fixpt_mul(arg, dc_fixpt_one);
> > +     KUNIT_EXPECT_EQ(test, res.value, arg.value);
> > +
> > +     arg.value =3D LONG_MIN;
> > +     res =3D dc_fixpt_mul(arg, dc_fixpt_one);
> > +     KUNIT_EXPECT_EQ(test, res.value, arg.value);
> > +
> > +     arg.value =3D LONG_MAX;
> > +     res =3D dc_fixpt_mul(dc_fixpt_one, arg);
> > +     KUNIT_EXPECT_EQ(test, res.value, arg.value);
> > +
> > +     arg.value =3D LONG_MIN;
> > +     res =3D dc_fixpt_mul(dc_fixpt_one, arg);
> > +     KUNIT_EXPECT_EQ(test, res.value, arg.value);
> > +
> > +     /* Assert it doesn't round LSB as expected */
> > +     arg.value =3D 0x7FFFFFFF7fffffffLL;
> > +     res =3D dc_fixpt_mul(arg, dc_fixpt_epsilon);
> > +     KUNIT_EXPECT_EQ(test, res.value, 0x000000007FFFFFFF);
> > +
> > +     /* Assert it rounds LSB as expected */
> > +     arg.value =3D 0x7FFFFFFF80000000LL;
> > +     res =3D dc_fixpt_mul(arg, dc_fixpt_epsilon);
> > +     KUNIT_EXPECT_EQ(test, res.value, 0x0000000080000000);
> > +}
> > +
> > +/**
> > + * dc_fixpt_sqr_test - KUnit test for dc_fixpt_sqr
> > + * @test: represents a running instance of a test.
> > + */
> > +static void dc_fixpt_sqr_test(struct kunit *test)
> > +{
> > +     struct fixed31_32 res;
> > +     struct fixed31_32 arg;
> > +
> > +     arg.value =3D dc_fixpt_one.value;
> > +     res =3D dc_fixpt_sqr(arg);
> > +     KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
> > +
> > +     arg.value =3D dc_fixpt_minus_one.value;
> > +     res =3D dc_fixpt_sqr(arg);
> > +     KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
> > +
> > +     arg.value =3D 0;
> > +     res =3D dc_fixpt_sqr(arg);
> > +     KUNIT_EXPECT_EQ(test, res.value, 0);
> > +
> > +     /* Test some recognizable values */
> > +     arg =3D dc_fixpt_from_int(100);
> > +     res =3D dc_fixpt_sqr(arg);
> > +     KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_from_int(10000).value);
> > +
> > +     arg =3D dc_fixpt_from_fraction(1, 100);
> > +     res =3D dc_fixpt_sqr(arg);
> > +     KUNIT_EXPECT_EQ(test, res.value,
> > +                     dc_fixpt_from_fraction(1, 10000).value);
> > +
> > +     /* LSB rounding */
> > +     arg =3D dc_fixpt_from_fraction(3, 2);
> > +     res =3D dc_fixpt_sqr(arg);
> > +     KUNIT_EXPECT_EQ(test, res.value,
> > +                     dc_fixpt_from_fraction(9, 4).value + 1LL);
> > +}
> > +
> > +/**
> > + * dc_fixpt_recip_test - KUnit test for dc_fixpt_recip
> > + * @test: represents a running instance of a test.
> > + */
> > +static void dc_fixpt_recip_test(struct kunit *test)
> > +{
> > +     struct fixed31_32 res;
> > +     struct fixed31_32 arg;
> > +
> > +     /* Assert 1/1 works as expected */
> > +     res =3D dc_fixpt_recip(dc_fixpt_one);
> > +     KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
> > +
> > +     /* Assert smallest parameters work as expected. */
> > +     arg.value =3D 3LL;
> > +     res =3D dc_fixpt_recip(arg);
> > +     KUNIT_EXPECT_EQ(test, res.value, 0x5555555555555555LL);
> > +
> > +     arg.value =3D -3LL;
> > +     res =3D dc_fixpt_recip(arg);
> > +     KUNIT_EXPECT_EQ(test, res.value, -0x5555555555555555LL);
> > +}
> > +
> > +static struct kunit_case dc_basics_fixpt31_32_test_cases[] =3D {
> > +     KUNIT_CASE(dc_fixpt_from_int_test),
> > +     KUNIT_CASE(dc_fixpt_from_fraction_test),
> > +     KUNIT_CASE(dc_fixpt_mul_test),
> > +     KUNIT_CASE(dc_fixpt_sqr_test),
> > +     KUNIT_CASE(dc_fixpt_recip_test),
> > +     {}
> > +};
> > +
> > +static struct kunit_suite dc_basics_fixpt31_32_test_suite =3D {
> > +     .name =3D "dc_basics_fixpt31_32",
> > +     .test_cases =3D dc_basics_fixpt31_32_test_cases,
> > +};
> > +
> > +kunit_test_suites(&dc_basics_fixpt31_32_test_suite);
> > +
