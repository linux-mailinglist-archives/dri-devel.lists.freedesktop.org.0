Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1014399D06
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 10:47:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1641A6F452;
	Thu,  3 Jun 2021 08:47:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 689B36F452;
 Thu,  3 Jun 2021 08:47:35 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id m3so6096303lji.12;
 Thu, 03 Jun 2021 01:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=ZuJyLGUZ9eETZYtATcExeQniLwSvNr4HyouP2yx3loE=;
 b=pVpzI7+VrnY6w9Hl82HDojwpJkVboEbyj2H0+7t3OrGdo+nh6bd5b8A1UlGv7oCDSz
 LU4Xgftem40pIgAQqKo8IeMMProC6mIzYoYYktJ8uD6UO0f0SyqR3j/0UxzLrTzqItlj
 frvfxMFiT1jCyWf+Hba5yusPx7ir3wH6aa0hb45PxtBsdQ79+Xnf8SH268mE9gt9UisV
 SP9zozBU6I4Dc+xU9ufsiEAyidsuJ7Egg23g/9D0YlapWp/i7rIIUp/DabNJhEOen+OT
 1JClNodx31OiStv53+BgDQEyksq7Icl4LoYmZOOkR7Env1Vm2ACV7o5SsltWHzJEJgjw
 M9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=ZuJyLGUZ9eETZYtATcExeQniLwSvNr4HyouP2yx3loE=;
 b=SyAMbgM1BOWr1jep6FCZQsLuPSvGfcAiJRVunVxR0uPLxDfW380suyHS92l0CUeb/a
 3gFippbtKgliFrQIh05ZEgJfrF6epgNgJBQv6uWftQU6SOYCWf8Vreve5XP+pKLDQ0Uj
 MWaB+bKmmQCldFc39P/UJ1NrsbrCEiJ2ew78yewOqWt611ZSkPwVaE4d5fiqbxG1g/CF
 kp7boZShz1OIDJLv97BhddV2nX2jotKmK7JxQEH7LR1+Arurql9Dbl0QT1PMmLRlHqLv
 YHBF7oRwhTKWrIQ4419SXYXTIEPlt9bG+0UP/NhPbVFcqIcBMk4lkPV9SS7G/n4aEbrj
 Gi5Q==
X-Gm-Message-State: AOAM531YyqKXITHB6IO4+NtbiypOwwSoRFJuUk810t8HKtJQKQG8Ap20
 Gx+4n6CGM6rUXwm0Oicj8KA=
X-Google-Smtp-Source: ABdhPJzRpsgnq2qzFdwsbGhVCl1W6zMQyWZNnsilx9MPyc3MNTqveM6V7R9f7sCfj864z9FSKEUP0w==
X-Received: by 2002:a2e:9798:: with SMTP id y24mr28505987lji.480.1622710053839; 
 Thu, 03 Jun 2021 01:47:33 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id n130sm272470lfa.10.2021.06.03.01.47.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 01:47:33 -0700 (PDT)
Date: Thu, 3 Jun 2021 11:47:30 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH 00/21] Add Support for Plane Color Lut and CSC features
Message-ID: <20210603114730.08e66ad0@eldfell>
In-Reply-To: <95e6a3e9-70d2-42d3-1289-a7de33f266c4@amd.com>
References: <20210601105218.29185-1-uma.shankar@intel.com>
 <20210602122850.29412a29@eldfell>
 <5a9a8c3ee8d54c3ca2ccaca4aa5ad1d9@intel.com>
 <95e6a3e9-70d2-42d3-1289-a7de33f266c4@amd.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/NEziXo06/iEZ.MZCNPjoeGi"; protocol="application/pgp-signature"
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Sebastian Wick <sebastian@sebastianwick.net>, "Shankar,
 Uma" <uma.shankar@intel.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>, "Modem,
 Bhanuprakash" <bhanuprakash.modem@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/NEziXo06/iEZ.MZCNPjoeGi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 2 Jun 2021 19:42:19 -0400
Harry Wentland <harry.wentland@amd.com> wrote:

> On 2021-06-02 4:22 p.m., Shankar, Uma wrote:
> >=20
> >  =20
> >> -----Original Message-----
> >> From: Pekka Paalanen <ppaalanen@gmail.com>
> >> Sent: Wednesday, June 2, 2021 2:59 PM
> >> To: Shankar, Uma <uma.shankar@intel.com>
> >> Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; =
Modem,
> >> Bhanuprakash <bhanuprakash.modem@intel.com>; Harry Wentland
> >> <harry.wentland@amd.com>
> >> Subject: Re: [PATCH 00/21] Add Support for Plane Color Lut and CSC fea=
tures
> >>
> >> On Tue,  1 Jun 2021 16:21:57 +0530
> >> Uma Shankar <uma.shankar@intel.com> wrote:
> >> =20
> >>> This is how a typical display color hardware pipeline looks like:

...

> >>> This patch series adds properties for plane color features. It adds
> >>> properties for degamma used to linearize data and CSC used for gamut
> >>> conversion. It also includes Gamma support used to again non-linearize
> >>> data as per panel supported color space. These can be utilize by user
> >>> space to convert planes from one format to another, one color space to
> >>> another etc. =20
> >>
> >> This is very much welcome!
> >>
> >> There is also the thread:
> >> https://lists.freedesktop.org/archives/dri-devel/2021-May/306726.html>=
>>
> >> Everything mentioned will interact with each other by changing what th=
e abstract
> >> KMS pixel pipeline does. I think you and Harry should probably look at=
 each others'
> >> suggestions and see how to fit them all into a single abstract KMS pip=
eline.
> >>
> >> People are adding new pieces into KMS left and right, and I fear we lo=
se sight of how
> >> everything will actually work together when all KMS properties are sup=
posed to be
> >> generic and potentially present simultaneously. This is why I would ve=
ry much like to
> >> have that *whole* abstract KMS pipeline documented with *everything*. =
Otherwise
> >> it is coming really hard fast to figure out how generic userspace shou=
ld use all these
> >> KMS properties together.
> >>
> >> Or if there cannot be a single abstract KMS pipeline, then sure, have =
multiple, as long
> >> as they are documented and how userspace will know which pipeline it i=
s dealing
> >> with, and what things are mutually exclusive so we can avoid writing u=
serspace code
> >> for combinations that will never exist. =20
> >=20
> > This is a good suggestion to have the whole pipeline and properties doc=
umented along with
> > the exact usages. We may end with 2 properties almost doing similar wor=
k but needed due to
> > underlying hardware, but we can get that properly documented and define=
d.=20
> >=20
> > I will discuss with Harry and Ville as well to define this.
> >  =20
>=20
> Just wanted to let you know that I've seen and read through both of Shank=
ar's patchsets
> and had some thoughts but haven't found the time to respond. I will respo=
nd soon.

Hi Harry,

awesome!

> I very much agree with Pekka. We need to make sure this all plays well to=
gether and is
> well documented. Maybe a library to deal with DRM KMS color management/HD=
R would even
> be helpful. Not sure yet how I feel about that.

That is an excellent question. While I am working on Weston CM&HDR, I
already have issues with how to represent the color related
transformations. These new hardware features exposed here are nothing I
have prepared for, and would probably need changes to accommodate.

The main Weston roadmap is drafted in
https://gitlab.freedesktop.org/wayland/weston/-/issues/467

The MR that introduces the concept of a color transformation, and also
the whole beginnings of color management, is
https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/582

In that MR, there is a patch introducing struct weston_color_transform:
https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/582/diffs?co=
mmit_id=3Dcffbf7c6b2faf7391b73ff9202774f660343bd34#ba0b86259533d5000d81c9c8=
8109c9010eb0f641_0_77

The design idea there is that libweston shall have what I call "color
manager" module. That module handles all the policy decisions about
color, it uses a CMM (Little CMS 2 in this case) for all the color
profile computations, and based on all information it has available
from display EDID, ICC profile files, Wayland clients via the CM&HDR
protocol extension and more, it will ultimately produce
weston_color_transform objects.

weston_color_transform is a complete description of how to map a pixel
in one color model/space/encoding into another, maybe with user
preferred tuning/tone-mapping. E.g. from client content to the output's
blending space (output space but light-linear), or from output's
blending space to output's framebuffer space or maybe even monitor wire
space.

The mapping described by weston_color_transform shall be implemented by
libweston's GL-renderer or by the DRM-backend using KMS properties,
whatever works for each case. So the description cannot be opaque, it
has to map to GLSL shaders (easy) and KMS properties (???).

Now the problem is, what should weston_color_transform look like?

The current design has two steps in a color transform:
- Transfer function: identity, the traditional set of three 1D LUTs, or
  something else.
- Color mapping: identity, a 3D LUT, or something else.

"Something else" is a placeholder for whatever we want to have, but the
problem in adding new types of transfer function or color mapping
representations (e.g. the fancy new GAMMA_MODEs) is how will the color
manager create the parameters for those?

If we have ICC profiles as the original data, then we are probably
limited to what LCMS2 can produce. The issue with ICC profiles is that
they may contain 3D LUTs themselves, so not what I would call a
parametric model. OTOH, if we have, say, enumerated operations defined
by various HDR standards, we have to code those ourselves and then
producing whatever fancy representation is less of a problem.

Maybe that is how it has to be. If the color transformations are
defined by ICC profiles, we might be stuck with old-school KMS color
properties, but HDR stuff that doesn't rely on ICC can use the fancier
KMS properties. I'm sure interesting questions will arise when e.g. you
have the monitor in HDR mode, described with standard HDR terms, and
then you have application content described with an ICC profile (maybe
SDR, maybe not).

We can always get a 3D LUT out of LCMS2, so theoretically it would be
possible to get a huge LUT and then optimise whatever parameterised
model you have to that data set. But I worry that might be too costly
to do in-flight, at least in a way that blocks the compositor. Maybe do
what I hear shader compilers do: produce an unoptimal model fast, then
compute an optimised model asynchronously and replace when ready. And
disk cache(?).

A library probably makes sense in the long run, but for now, I would
have no idea at all what it should look like.


Thanks,
pq

--Sig_/NEziXo06/iEZ.MZCNPjoeGi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmC4lyIACgkQI1/ltBGq
qqdrLBAAsm0YTJLIvAMQBkDDs8QPnia5uRsReIR2+7MFkNNXqwL/jOCbyrTpVKUd
z2y0N2fhVW9J/MfCtfir5osq4aqss84MaQOqaLYbpJKhKpkeuVuYA10EraUjMbNw
YyKuiTEjo+uJilbQLrlggkGeCxG84GRHPsWDlOvIsxAqTs6xJBqJ/5kZvzvMZ39G
QF5aZbhRbGb/dJdHv1prL5Zpj00KLwiHIJjAtQFuv+wgfPPRpbrgEn9GSjXANTPu
bv059kV2cSBD+KoAQ/ioYUGo0/P54iiDqfXY1q4zXO2ORumC4yXMFROYkcz+9ycd
LISWqaPAIuGANoxCzkopAtPQEFKADKr1CPfx+xoU1NMAuC9sfxuNeb5zHZqo34kr
1JTp06rwBJQOA76vz5J7jQWVzete4cSgCaE0ecWU2HcKVr+yvFNIUg6JRJdN0Kew
kw3wI+UY02V+jEyW9EhZ+47yYAczIqwbmKKQBkEoLGcDzf+vqGDqRRZ51ZdWPeN8
+NE1ai0L5MxaHPzqE5WnKV3y/p+lXoaYCqdAKpfzUM+PREpGi1todNWP7pyJOU5H
AY3iAOILXTX5VytjYiW3muwhQTSWOLc8sxdkccvCrOMIowSgNP/Om2Cvu7ZV6mZj
ZAyBQ9x0A2KglNk41Y1uZmO4xSo43W10xIvUfqE9mXG+ZCdOogw=
=nYdW
-----END PGP SIGNATURE-----

--Sig_/NEziXo06/iEZ.MZCNPjoeGi--
