Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EEA53BCFC
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 19:08:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD63112328;
	Thu,  2 Jun 2022 17:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65641112A64
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 17:08:09 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id z17so2889087wmf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 10:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5bhrsVbOt2m6AZ0xVRCzidiDFV620CkfVfQEKPk5euQ=;
 b=GJyBuTsVd74HWVHwaPxWWXx24QFGP0g30a3CVD6NI1PguzZ0ZFv3Ofr8YV+JE7GOin
 GLr84vVIJZxX3KTnUf7JsE2m7R+uHXFbJxBAe/1qs/aSRVwgplSb04tI2ekuXt/X/Cpl
 XABtcP0oqp3vmgo3TivEdvltUiC0y6UO+JIEO7Yw4NcTNE6W6Ma38uTZoMwztxgS1591
 2NAZQsTVCFJ3niSvdIziaxGCqeN7M2HZEQuTA3uKFRX61uC3s0ojzd1QAVbFOKwEpqpL
 eIzbOCIVSzFSleXYXbYcJqPixqK3hEe1+dpC8NjocG8+5YyiIRo+ZoV3x2qTaEFFnvIT
 rqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5bhrsVbOt2m6AZ0xVRCzidiDFV620CkfVfQEKPk5euQ=;
 b=sr5RfdDFsfyzsX6u6Yy9WTGo/J8XarlZbWNbXMnbH8hYht0hmt2Y6n2jqlqpwTBlKY
 flhTJ575tyzS6iHPYYVUUOaVGIqePc/7zqhkVeozeyzECnaRCO3d0WjYmwV8DJafc8lE
 TT1jQmG0HkJxAiTkqQ+egYpdE1T3p6ITA3GpxscbZs/qjs5j1tKu3pncOAbeWDC2Xeke
 3JtUZ17XKNe64C8fek1mL2l5mufT9X+2QWJY/RQztTYLtKQVN5Lf3IkuolgAp1t9Ya3s
 WLTbRG1stFVsIPhE8EdcU8bE+kNHgkec8kxawbNiZdhMtpxQIidXRp6UoCMkAiAtEU7X
 bfMQ==
X-Gm-Message-State: AOAM533hIx4K0YUEsndcT5NToV0AqoBpdZgkTEo6wY3chJpZVR9se2N+
 OgfjfFk1lAy9PoKHUf3io7fvwyMe15kpL+QBkkSMUA==
X-Google-Smtp-Source: ABdhPJy8OFeEeTjkcQ6jIqvN4oFH76Sq84U0Qb5USu4LJ5GCXCEFRG8rGYYiO6/MRDzgeghXrhQqR/5GHdDrKNGcmIw=
X-Received: by 2002:a05:600c:3549:b0:397:8f09:1abe with SMTP id
 i9-20020a05600c354900b003978f091abemr4855227wmq.107.1654189687735; Thu, 02
 Jun 2022 10:08:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220530102017.471865-1-jose.exposito89@gmail.com>
 <20220530102017.471865-2-jose.exposito89@gmail.com>
 <e26de140-afb7-7b1b-4826-6ac4f3a4fe02@redhat.com>
In-Reply-To: <e26de140-afb7-7b1b-4826-6ac4f3a4fe02@redhat.com>
From: David Gow <davidgow@google.com>
Date: Thu, 2 Jun 2022 10:07:56 -0700
Message-ID: <CABVgOSkCxu2xBnxwc6mO2AQaqzTbDf53PJzT2QvZNyLeumt5hg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] drm/format-helper: Add KUnit tests for
 drm_fb_xrgb8888_to_rgb332()
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: tzimmermann@suse.de, David Airlie <airlied@linux.ie>,
 Daniel Latypov <dlatypov@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 KUnit Development <kunit-dev@googlegroups.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 2, 2022 at 9:27 AM Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> Hello Jos=C3=A9,
>
> On 5/30/22 12:20, Jos=C3=A9 Exp=C3=B3sito wrote:
> > Test the conversion from XRGB8888 to RGB332.
> >
> > What is tested?
> >
> >  - Different values for the X in XRGB8888 to make sure it is ignored
> >  - Different clip values: Single pixel and full and partial buffer
> >  - Well know colors: White, black, red, green, blue, magenta, yellow
> >    and cyan
> >  - Other colors: Randomly picked
> >  - Destination pitch
> >
> > Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
> > Signed-off-by: Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmail.com>
> > ---
>
> Thanks a lot for working on this! It's very cool to see the first KUnit
> tests added to DRM :)
>
> >  drivers/gpu/drm/Kconfig                  |  12 ++
> >  drivers/gpu/drm/Makefile                 |   3 +
> >  drivers/gpu/drm/drm_format_helper_test.c | 166 +++++++++++++++++++++++
> >  3 files changed, 181 insertions(+)
> >  create mode 100644 drivers/gpu/drm/drm_format_helper_test.c
> >
> > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > index e88c497fa010..d92be6faef15 100644
> > --- a/drivers/gpu/drm/Kconfig
> > +++ b/drivers/gpu/drm/Kconfig
> > @@ -76,6 +76,18 @@ config DRM_KMS_HELPER
> >       help
> >         CRTC helpers for KMS drivers.
> >
> > +config DRM_FORMAR_HELPER_TEST
>
> I wonder if we want this level of detail for the test Kconfig symbols.
> Maybe we could just have a DRM_KUNIT_TEST symbol that will enable all
> the KUnit test suites for DRM ?
>
> > +     bool "drm_format_helper tests" if !KUNIT_ALL_TESTS
> > +     depends on DRM && KUNIT=3Dy
> > +     select DRM_KMS_HELPER
>
> Daniel didn't like this `select DRM_KMS_HELPER` and I think that we can a=
void
> it if instead drm_format_helper_test.c is included in drm_format_helper.c=
, i.e:
>
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_fo=
rmat_helper.c
> index a3ccd8bc966f..d63e02da528f 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -692,3 +692,7 @@ void drm_fb_xrgb8888_to_mono(void *dst, unsigned int =
dst_pitch, const void *vadd
>         kfree(src32);
>  }
>  EXPORT_SYMBOL(drm_fb_xrgb8888_to_mono);
> +
> +#ifdef DRM_KUNIT_TEST
> +#include "drm_format_helper_test.c"
> +#endif
>
> This also has the advantage that will allow to have KUnit tests for the s=
tatic
> functions that are only available in the drm_format_helper.c compilation =
unit.
>
> >  obj-$(CONFIG_DRM_DEBUG_SELFTEST) +=3D selftests/
> > +obj-$(CONFIG_DRM_FORMAR_HELPER_TEST) +=3D drm_kms_helper.o \
> > +             drm_format_helper_test.o
>
> And doing that will also allow you to get rid of this, since just selecti=
ng
> CONFIG_DRM_KUNIT_TEST=3Dy would be enough for the tests built and run by =
KUnit.
>

This is definitely something other KUnit tests (apparmor, elf, etc)
are doing, and it's generally fine. You do lose the ability to build
the tests as a separate module, though. (This is not usually a big
problem, but there are some cases where it's useful.)

That being said, I don't think 'select' is enough of a problem that
you should feel the need to refactor in this way just to avoid it.
Given most of the other DRM drivers (as well as DRM_DEBUG_SELFTEST)
are select-ing DRM_KMS_HELPER, it seems like a sensible enough thing
to continue doing for the KUnit test. As Daniel pointed out, as a
hidden option it was clearly always meant to be select-ed anyway.

Cheers,
-- David
