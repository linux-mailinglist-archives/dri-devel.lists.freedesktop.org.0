Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FF8783B06
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 09:36:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE51110E1B2;
	Tue, 22 Aug 2023 07:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9212C10E068;
 Tue, 22 Aug 2023 07:36:24 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4ff8a1746e0so6326867e87.0; 
 Tue, 22 Aug 2023 00:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692689783; x=1693294583;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=m9JeEI9pOPqa5N1VgvwdS9ACilzFYTp6dHc4PCAx9Qc=;
 b=UMiILeRWTNCJkBAHo8GseVLLu5rTf5L9fCSimEejkf12w0W6VxE6HE+wdx8YcAiJOk
 vWB7BMzwA4tB3/RDiIi482h+hDHN67Ja6YECjSb2GO88dKy6Ip7HvmKI2xKYMYozDTrT
 BhQpU7sGNg0dn5re3b/uT2qSSvE/ezigFO1zGKTDjCDQWaqmrUropLh1BM8579LxOEB5
 lFuAjbGtt2tX9ui4ct3gkXBHEhSV4AunBQB77JbfrYl7LJYYPe/MmFHeY0TjSnVB+vOm
 wB8FK2EinGMUiCXy8VA/EHeaUBXAsa5JID/HuwlzlhE01fSAJZRg9OQ1JbNLOBLpLxSJ
 1kKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692689783; x=1693294583;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m9JeEI9pOPqa5N1VgvwdS9ACilzFYTp6dHc4PCAx9Qc=;
 b=dBGvGdneWIsZzolhWHGza8mOmZOTCHOLXEXGJu/LyAxqlLrRc5YN1eOqkuA0O/9/Nj
 Dkyn8nKTx3UvlUK8k+Ygh+aGcdW6njx7FQ8hlx9PWsj7LL5CZZvEXqoOlpjeGC/qz13L
 6UlIBZ0wZVlmSCuRNS0EUpWtfwPPkuYJbyhIhwfPp7pMJ8qJ02W/ytMJYiX3z7+Ba4wf
 7l8P9isZ8exeQQ61KUMBS+Y8pQ87C6WDdYZkjQGQDKIXdeA6QBY8oBvvlk7YnQSgL9fY
 9h12bA/AQ+ERyrjLfipwTkdowCeDsrEAc4M5ZJHOoqCTGM3KiE//ggIZ9J/jX4r/WxG/
 O1Pw==
X-Gm-Message-State: AOJu0Yxg34lZSZUbROqgRmW7ACjw+hXqugPrK9DvkT37NoU3q5Vz0cLn
 P/rK1HRkV5hprCSK2prmdvw=
X-Google-Smtp-Source: AGHT+IEpQ081i3Xmv5BSGFbBOCsDUkDBF6QAJ9kaLTyxTXqF8yU44YUSsUgdGZUhv57gdHuQVXG1ow==
X-Received: by 2002:a2e:991a:0:b0:2bb:75d1:b77e with SMTP id
 v26-20020a2e991a000000b002bb75d1b77emr7251155lji.42.1692689782330; 
 Tue, 22 Aug 2023 00:36:22 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 w5-20020a2e3005000000b002b736576a10sm2612239ljw.137.2023.08.22.00.36.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Aug 2023 00:36:22 -0700 (PDT)
Date: Tue, 22 Aug 2023 10:36:11 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH RFC v5 02/10] drm: Introduce solid fill DRM plane property
Message-ID: <20230822103611.4ec51594@eldfell>
In-Reply-To: <CAA8EJpqigb8OJ-u7W9VeZtXp5rhXyU30_5wALeUDsf+rhe-kEA@mail.gmail.com>
References: <20230728-solid-fill-v5-0-053dbefa909c@quicinc.com>
 <20230728-solid-fill-v5-2-053dbefa909c@quicinc.com>
 <CAA8EJpq=pbDoYc9wqKKrX+RahXp8zWTPFqVqA=S-0TkWXXJUjQ@mail.gmail.com>
 <CA+hFU4y38MTTUsbri1jy=n4Vyp7xx2CosD9Nmk97z_au6NHCdQ@mail.gmail.com>
 <CAA8EJpoFpUcQL_7pb0toDoLFsK=9GdBLQH+h_MMffrp9k7eCyw@mail.gmail.com>
 <20230818135133.3fdeddba@eldfell>
 <c4b7e9eb-fb5d-4b2f-8358-f41598d7d983@linaro.org>
 <20230818165500.50360195@eldfell>
 <CAA8EJpqigb8OJ-u7W9VeZtXp5rhXyU30_5wALeUDsf+rhe-kEA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VCSstBMwRfc91OS4YUbYmwc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Sebastian Wick <sebastian.wick@redhat.com>, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 wayland-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/VCSstBMwRfc91OS4YUbYmwc
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 21 Aug 2023 17:30:21 +0300
Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:

> On Fri, 18 Aug 2023 at 16:55, Pekka Paalanen <ppaalanen@gmail.com> wrote:
> >
> > On Fri, 18 Aug 2023 14:03:14 +0300
> > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> > =20
> > > On 18/08/2023 13:51, Pekka Paalanen wrote: =20
> > > > On Fri, 4 Aug 2023 16:59:00 +0300
> > > > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> > > > =20
> > > >> On Fri, 4 Aug 2023 at 16:44, Sebastian Wick <sebastian.wick@redhat=
.com> wrote: =20
> > > >>>
> > > >>> On Fri, Aug 4, 2023 at 3:27=E2=80=AFPM Dmitry Baryshkov
> > > >>> <dmitry.baryshkov@linaro.org> wrote: =20
> > > >>>>
> > > >>>> On Fri, 28 Jul 2023 at 20:03, Jessica Zhang <quic_jesszhan@quici=
nc.com> wrote: =20
> > > >>>>>
> > > >>>>> Document and add support for solid_fill property to drm_plane. =
In
> > > >>>>> addition, add support for setting and getting the values for so=
lid_fill.
> > > >>>>>
> > > >>>>> To enable solid fill planes, userspace must assign a property b=
lob to
> > > >>>>> the "solid_fill" plane property containing the following inform=
ation:
> > > >>>>>
> > > >>>>> struct drm_mode_solid_fill {
> > > >>>>>          u32 version;
> > > >>>>>          u32 r, g, b;
> > > >>>>> };
> > > >>>>>
> > > >>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > >>>>> ---
> > > >>>>>   drivers/gpu/drm/drm_atomic_state_helper.c |  9 +++++
> > > >>>>>   drivers/gpu/drm/drm_atomic_uapi.c         | 55 ++++++++++++++=
+++++++++++++++++
> > > >>>>>   drivers/gpu/drm/drm_blend.c               | 30 ++++++++++++++=
+++
> > > >>>>>   include/drm/drm_blend.h                   |  1 +
> > > >>>>>   include/drm/drm_plane.h                   | 35 ++++++++++++++=
++++++
> > > >>>>>   include/uapi/drm/drm_mode.h               | 24 ++++++++++++++
> > > >>>>>   6 files changed, 154 insertions(+)
> > > >>>>> =20
> > > >>>>
> > > >>>> [skipped most of the patch] =20
> >
> > ...
> > =20
> > > >>> Maybe another COLOR_FILL enum value
> > > >>> with alpha might be better? Maybe just doing the alpha via the al=
pha
> > > >>> property is good enough. =20
> > > >>
> > > >> One of our customers has a use case for setting the opaque solid f=
ill,
> > > >> while keeping the plane's alpha intact. =20
> > > >
> > > > Could you explain more about why they must keep plane alpha intact
> > > > instead of reprogramming everything with atomic? Is there some
> > > > combination that just cannot reach the same end result via userspace
> > > > manipulation of the solid fill values with plane alpha?
> > > >
> > > > Or is it a matter of userspace architecture where you have independ=
ent
> > > > components responsible for different KMS property values? =20
> > =20
> > > The latter one. The goal is to be able to switch between pixel sources
> > > without touching any additional properties (including plane's alpha v=
alue). =20
> >
> > Sorry, but that does not seem like a good justification for KMS UAPI
> > design.
> >
> > It is even in conflict with how atomic KMS UAPI was designed to work:
> > collect all your changes into a single commit, and push it at once.
> > Here we are talking about separate components changing the different
> > properties of the same KMS plane even. If you want to change both plane
> > opacity and contents, does it mean you need two refresh cycles, one at
> > a time? Could the two components be even racing with each other,
> > stalling each other randomly? =20
>=20
> Most likely I was not verbose enough.
>=20
> We want to setup the blending scene, including the FB and the solid
> fill properties for the plane. FB is set up in the RGBA format, each
> pixel having its own alpha value in addition to the plane's alpha
> value. Then under certain circumstances, the plane gets hidden by the
> solid fill (think of a curtain). We do not want to touch the global
> scene setup (including plane alpha value), just switch the curtain on
> and off.
> I think this plays good enough with the defined plane blending rules,
> where one can use pre-multiplied blending mode or use coverage
> blending mode.

Right, that's what I understood. But this does complicate the KMS UAPI
for something that is well possible and feasible without the added
complication as well.

Is there a hardware or driver reason to avoid touching the global scene
setup? Does something in the hardware or driver work more optimally
that way?

Personally I'd favour simpler UAPI with more complex userspace for
maintainability and testing reasons. I'd also favour UAPI that exposes
common hardware features instead of design driven by userspace
process-internal architecture. There does not seem to be any
functionality or performance reasons to justify adding alpha channel to
the solid fill color.

OTOH, do we know of hardware that does not have separate alpha for the
fill color?

Do we know of hardware that can only do opaque solid fills, meaning no
alpha in the fill color nor for the plane?

What about hardware that has no plane alpha, but does have fill color
alpha?

If the plane has an alpha property, then drivers could implement fill
color alpha by combining the two alpha values before programming the
hardware. If there is no plane alpha, but there is fill color alpha, it
would be really awkward to expose a fake plane alpha because it would
only work with fill color.

Assuming that all those combinations exist in hardware, then separate
fill colors without and with alpha make sense, advertised independently.


Thanks,
pq

--Sig_/VCSstBMwRfc91OS4YUbYmwc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmTkZWwACgkQI1/ltBGq
qqfCVhAAsAwplE2EE2aUfSuv5n8N5nGIQZvyhd6oXh/oUZFhSRlns456VGSkOFBR
aFxeJiLOuojYJVL8rQFIYBjk2qzCb4Oonyul23slNkT+c5MtUk2REuey2NJZ401p
tfHvDGviiGtbKW/ieEuLT9AJkQRCA7DRgaQLdWfvKNgQlyd1xugRKgn1vzHlEx9T
rYsRhduImIyxRlhJjdOfYuGA3OGteP+WIySKZzI1dNe3clDQYCq+C2WFh2Oul71Y
hFNaWRKRuNVUf0xzEuvAsXWmhQ1eT3KizaAXkzkz0S6myYEpSJ4CY4oqvRRKNJit
oSCb0JN05h1icNkbXimq90Fn1PtRtcScbJNH7fa1WWoKEfkD0jcfU7mQVfidACwC
8esNNTUSUwuTUSUVyaXYpc4Cg9jCGgCOn1ICSJdiHuxwx6zhJj3BLjI2SofubIj6
u3F5S7G7AA63STn7dkXvFjH4yTmZYzKl2loJVYYgB04uTjDtcsB5FSQx+HbPSIMg
D5Nil/AEakxvrS5P0BMe3EVvAeYjWZtgiHY3/nAr+BSrzGJ6l2b6+9DmXeXILcBj
nHss51EAdA0LzSiTRk3qCKnCHXANvKVgeU+Pjv8G5HD94E+4bS7cOj/LquybuXxJ
DI6RKCetZ0HixpSpRg4Nr9zZCeZ9tm7PURDGfh/271ZzMRKe1Vw=
=Lf23
-----END PGP SIGNATURE-----

--Sig_/VCSstBMwRfc91OS4YUbYmwc--
