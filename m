Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BA93C9BEC
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 11:34:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D28DE6E44A;
	Thu, 15 Jul 2021 09:34:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 499CC6E44A
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 09:34:37 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id u25so7803510ljj.11
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 02:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=C3CkEFd9UOYi1Rf2FF7o7V/WgdPMoWDYSczwchx7NFo=;
 b=QYw0EWmsbXuKcbjoi4L+X5jwaFfIc2NBam033odRe68AbNM+13vDQ4lyglPHludr14
 RB6cQaM22rWvE9HLUZdvWY3Z9aZyAPqIm4hSaB3QjsE8IEjH58em30KFUf2AiCqSP3qa
 kVzpiL3RZrt/eAmTWU/UzbQVmYrYD8u/igeyF9OAeO+bB1lmQiuD2kch4h2U7LexZXXH
 1xQtBzEM9+YMbKecVb0mnJswA943GYEq0m8Z6tJ1Ez5OGnFqNqp5phXc08cDkJinC8OG
 ss9nIdmrWPmJrXFPqDnCoMNZbFKFFl5ZSvJs5/CPsyNJkn9vv0PVkG4JQ2EOm1G2uhkJ
 4m+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=C3CkEFd9UOYi1Rf2FF7o7V/WgdPMoWDYSczwchx7NFo=;
 b=qYtsa3CXB3bYMsqhfobk0qn9eUPakjj8n4rIyBItt9QO3vxn9hwR/tXW5JiIujg5Ie
 EdPwQUrOCEo52+s/KRWa73TeKwwwDSIPECczqm+a6crCZCO03vu4j2RaHc3RyYFDmqKg
 BBwCfqG8dlV5FXm1i4BFyTzPRccnHbk46kI0tWy0UlnbbJya2O/MJq19Z2dMZwm9rhC2
 0jRkN1c8FqB706gU33laBzBIeBOdUBBH06suQltj9VvOI9Z3OfgWdh35VBPwbV5Kcdnr
 J9fYJIpkV48xqK+VOcC5ZlBzVt76Xxng72WqmCDNvUk1cN1nHJMCNyauynSFlhH5wtT7
 96mw==
X-Gm-Message-State: AOAM532J7v43iEeYZVA/6Ke0E70jevUJ0A+NKWdxTCgXg0iKB9Nrt2NQ
 RrCCS2c1oJXjTBy7J8xxgPA=
X-Google-Smtp-Source: ABdhPJxj8hN6a1UU8K3nF+iRc4+DuZMPW5GVBlINqE+CDbym2ksXvh2ZoSE36yCkGkUd+/TNaJFiPQ==
X-Received: by 2002:a2e:9f17:: with SMTP id u23mr3231356ljk.489.1626341675617; 
 Thu, 15 Jul 2021 02:34:35 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id m10sm4496lfr.72.2021.07.15.02.34.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jul 2021 02:34:35 -0700 (PDT)
Date: Thu, 15 Jul 2021 12:34:31 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH 1/2] drm: add crtc background color property
Message-ID: <20210715123431.48770751@eldfell>
In-Reply-To: <7682e4c6-a040-a2b6-915d-b99ad3ddd53e@amd.com>
References: <20210707084557.22443-1-raphael.gallais-pou@foss.st.com>
 <20210707084557.22443-2-raphael.gallais-pou@foss.st.com>
 <20210709110459.79ca406a@eldfell>
 <3c8331cf-fded-b6e6-3e25-666634f4b87a@foss.st.com>
 <20210712110310.540df27d@eldfell>
 <f8e7db99-a4e4-c4d7-5d6a-67950184701c@amd.com>
 <20210713105214.5730c959@eldfell>
 <70c8467c-560d-517d-63a0-97763803b06d@amd.com>
 <20210714103518.578e70aa@eldfell>
 <7682e4c6-a040-a2b6-915d-b99ad3ddd53e@amd.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hcNQydbxYJzXYEbluMtbPQw";
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
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Raphael GALLAIS-POU <raphael.gallais-pou@st.com>,
 David Airlie <airlied@linux.ie>,
 Yannick FERTRE - foss <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yannick FERTRE <yannick.fertre@st.com>,
 Sebastian Wick <sebastian@sebastianwick.net>,
 Philippe CORNU - foss <philippe.cornu@foss.st.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Philippe CORNU <philippe.cornu@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/hcNQydbxYJzXYEbluMtbPQw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 14 Jul 2021 12:13:58 -0400
Harry Wentland <harry.wentland@amd.com> wrote:

> On 2021-07-14 3:35 a.m., Pekka Paalanen wrote:
> > On Tue, 13 Jul 2021 09:54:35 -0400
> > Harry Wentland <harry.wentland@amd.com> wrote:
> >  =20
> >> On 2021-07-13 3:52 a.m., Pekka Paalanen wrote: =20
> >>> On Mon, 12 Jul 2021 12:15:59 -0400
> >>> Harry Wentland <harry.wentland@amd.com> wrote:
> >>>    =20
> >>>> On 2021-07-12 4:03 a.m., Pekka Paalanen wrote:   =20
> >>>>> On Fri, 9 Jul 2021 18:23:26 +0200
> >>>>> Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com> wrote:
> >>>>>      =20
> >>>>>> On 7/9/21 10:04 AM, Pekka Paalanen wrote:     =20
> >>>>>>> On Wed, 7 Jul 2021 08:48:47 +0000
> >>>>>>> Raphael GALLAIS-POU - foss <raphael.gallais-pou@foss.st.com> wrot=
e:
> >>>>>>>       =20
> >>>>>>>> Some display controllers can be programmed to present non-black =
colors
> >>>>>>>> for pixels not covered by any plane (or pixels covered by the
> >>>>>>>> transparent regions of higher planes).  Compositors that want a =
UI with
> >>>>>>>> a solid color background can potentially save memory bandwidth by
> >>>>>>>> setting the CRTC background property and using smaller planes to=
 display
> >>>>>>>> the rest of the content.
> >>>>>>>>
> >>>>>>>> To avoid confusion between different ways of encoding RGB data, =
we
> >>>>>>>> define a standard 64-bit format that should be used for this pro=
perty's
> >>>>>>>> value.  Helper functions and macros are provided to generate and=
 dissect
> >>>>>>>> values in this standard format with varying component precision =
values.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.=
com>
> >>>>>>>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> >>>>>>>> ---
> >>>>>>>>   drivers/gpu/drm/drm_atomic_state_helper.c |  1 +
> >>>>>>>>   drivers/gpu/drm/drm_atomic_uapi.c         |  4 +++
> >>>>>>>>   drivers/gpu/drm/drm_blend.c               | 34 +++++++++++++++=
++++++--
> >>>>>>>>   drivers/gpu/drm/drm_mode_config.c         |  6 ++++
> >>>>>>>>   include/drm/drm_blend.h                   |  1 +
> >>>>>>>>   include/drm/drm_crtc.h                    | 12 ++++++++
> >>>>>>>>   include/drm/drm_mode_config.h             |  5 ++++
> >>>>>>>>   include/uapi/drm/drm_mode.h               | 28 +++++++++++++++=
++++
> >>>>>>>>   8 files changed, 89 insertions(+), 2 deletions(-)   =20
> >>>
> >>> ...
> >>>    =20
> >>>>>>> The question about full vs. limited range seems unnecessary to me=
, as
> >>>>>>> the background color will be used as-is in the blending stage, so
> >>>>>>> userspace can just program the correct value that fits the pipeli=
ne it
> >>>>>>> is setting up.
> >>>>>>>
> >>>>>>> One more question is, as HDR exists, could we need background col=
ors
> >>>>>>> with component values greater than 1.0?       =20
> >>>>>>
> >>>>>> AR4H color format should cover that case, isn't it ?     =20
> >>>>>
> >>>>> Yes, but with the inconvenience I mentioned.
> >>>>>
> >>>>> This is a genuine question though, would anyone actually need
> >>>>> background color values > 1.0. I don't know of any case yet where it
> >>>>> would be required. It would imply that plane blending happens in a
> >>>>> color space where >1.0 values are meaningful. I'm not even sure if =
any
> >>>>> hardware supporting that exists.
> >>>>>
> >>>>> Maybe it would be best to assume that only [0.0, 1.0] pixel value r=
ange
> >>>>> is useful, and mention in the commit message that if someone really
> >>>>> needs values outside of that, they should create another background
> >>>>> color property. Then, you can pick a simple unsigned integer pixel
> >>>>> format, too. (I didn't see any 16 bit-per-channel formats like that=
 in
> >>>>> drm_fourcc.h though.)
> >>>>>      =20
> >>>>
> >>>> I don't think we should artificially limit this to [0.0, 1.0]. As you
> >>>> mentioned above when talking about full vs limited, the userspace
> >>>> understands what's the correct value that fits the pipeline. If that
> >>>> pipeline is FP16 with > 1.0 values then it would make sense that the
> >>>> background color can be > 1.0.   =20
> >>>
> >>> Ok. The standard FP32 format then for ease of use and guaranteed enou=
gh
> >>> range and precision for far into the future?
> >>>    =20
> >>
> >> I don't have a strong preference for FP16 vs FP32. My understanding is
> >> that FP16 is enough to represent linearly encoded data in a way that
> >> looks smooth to humans.
> >>
> >> scRGB uses FP16 with linear encoding in a range of [-0.5, 7.4999].
> >> =20
> >>> Or do you want to keep it in 64 bits total, so the UABI can pack
> >>> everything into a u64 instead of needing to create a blob?
> >>>
> >>> I don't mind as long as it's clearly documented what it is and how it
> >>> works, and it carries enough precision.
> >>>
> >>> But FP16 with its 10 bits of precision might be too little for integer
> >>> 12-16 bpc pipelines and sinks? =20
> >=20
> > The 10 bits worries me still.
> >=20
> > If you have a pipeline that works in [0.0, 1.0] range only, then FP16
> > limits precision to 10 bits (in the upper half of the range?).
> >  =20
> >>>
> >>> If the values can go beyond [0.0, 1.0] range, then does the blending
> >>> hardware and the degamma/ctm/gamma coming afterwards cope with them, =
or
> >>> do they get clamped anyway?
> >>>    =20
> >>
> >> That probably depends on the HW and how it's configured. AMD HW can ha=
ndle
> >> values above and below [0.0, 1.0]. =20
> >=20
> > Right, so how would userspace know what will happen?
> >=20
> > Or do we need to specify that while values outside that unit range are
> > expressable, it is hardware-specific on how they will behave, so
> > generic userspace should not attempt to use values outside of the unit
> > range?
> >=20
> > I guess this caveat should be documented for everything, not just for
> > background color? LUT inputs and outputs, CTM input and output ranges,
> > FB formats...
> >  =20
>=20
> I'm not sure we should artificially limit the interface at this point, or
> document hypotheticals. At this point I don't even know whether going bey=
ond
> [0.0, 1.0] would be a challenge for any HW that supports floating point
> formats.

Exactly, we don't know. Yet we have to document how background color
works. If background color can express values outside of [0.0, 1.0],
the documentation must say something about it.

If there is no way to know, then documentation must say you don't know
(or that it is hardware-specific, which to generic userspace is the
same thing).

If userspace does not know what happens, then obviously it will avoid
using values it does not know what happens with.

For example, let's say that blending can produce values outside of
[0.0, 1.0]. The next step in the pipeline is DEGAMMA, which is a 1D
LUT. How do you sample a 1D LUT with input values beyond [0.0, 1.0]? Do
you clamp them to the unit range? Does the clamping still happen even
when the LUT is in pass-through mode?

And in general, how big or how negative values will actually go through
the pipeline?

Of course the background color property should not document everything
above, but it must say something, like "The handling of values outside
of [0.0, 1.0] depends on the capabilities of the hardware blending
engine." That makes the handling unknown to generic userspace, but
userspace drivers could make use of it.

The important bit is to understand that the background color values may
sometimes (when?) not reach the sink unmodified even if userspace has
configured the KMS pipeline to not modify them.

I would expect that values in [0.0, 1.0] have no problem passing
through the KMS pipeline unharmed, and there are obvious expectations
about how a LUT or a CTM processes them. But as soon as values outside
of that range are possible, a whole slew of questions arises. The
documentation must not be silent, it must set expectations like "it's
hardware specific" if that's what it is.


Thanks,
pq

--Sig_/hcNQydbxYJzXYEbluMtbPQw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDwAScACgkQI1/ltBGq
qqcUkg//ZIGZ2dUK9K+97Vl05q58NQTTcYRzkH9IGM/HbMdKmoiANV2CiGkHVBhy
sYe0B4an9g4Qg1mPOoYCvUOFOrWdX2wNuUGch5ghzf5gwIXfFWsLOUw8NjHh/6Nv
lljaeROHi8SgkxVFajmC3jsHqerZ7c4aYPC7JSorKV+mjh/1LdUVTjCGry2Q8PPr
FsYZ4ATm2nsGRLodnKILvmpG6KWOIgU7K0o30DaAvI0mDIxWjlv2uoex9rfLWW7s
FTDLfkmAQ7kY/L/91kAqn/YOTxCuAQ3ZZHKiiYk6o5HP1kwcbeC2V7cwbXSr+Yjk
g76u4cjqCNlwfnhfOXZ9/McoELUfIbUHTsJctRtA+9Dw4cdlve7z7XJSwj8aEP4t
R0qleEVqIERVnpSn/GiHDGdjyXmR6EiKyu2MtZgH5evpYRI7g0p7HsFmOsU2Y2RD
QMTrsAAmD0sVEHBkTVVulG/lqTmG0YRGMFfomSloxWShQ7nRkOlxwc7pR+hBdICd
SRsgpKc3w4wB1mH+dffUwpnjDW0yVIClJY8AXP1AxRE/mNrQJqTLlom6j823wmkK
SZRMQxQky7j6owAiZuV12TTDVl0ZXcQJpo2vzrZslVHpyMinHiEnq6kDKXlur0K6
MH4ZnqgczuMOh4nY2ORgZHUxZjBVPVHHVTJq9nGvRZqyXUIZnGI=
=16uJ
-----END PGP SIGNATURE-----

--Sig_/hcNQydbxYJzXYEbluMtbPQw--
