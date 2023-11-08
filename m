Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B59237E5331
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 11:16:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7FA610E4F3;
	Wed,  8 Nov 2023 10:16:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A78E10E066;
 Wed,  8 Nov 2023 10:16:16 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5094cb3a036so8542378e87.2; 
 Wed, 08 Nov 2023 02:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699438574; x=1700043374; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Mew7HLJV6bxxISerUbjxXiqgzi3Kwtc+0JQK/sXHoQQ=;
 b=bHUjtVDzB3vpv1MVR+zq9ptecBsw4Z7OvXnxuMVQ06RHDd5Tjvq4KOl6dRJGi9/waq
 THIXZoJguWTEAdEbtcHqz0Ef2JWY0hiXjEI/b5voVRDBKyOWR+flRg7PyUvfnYLhtoVM
 yPFT0fHr1L/RWjXHRJaXL6ah3+ePSXy7E+X8i7PiBxuEWmoP93x9xzVqW9y47oESthxj
 3XKmJWj7TADSjj7WmikXaC5CC+ThaiRaVO1NpBM5CWsEcWWQ9ea3MTrBr52g1rBbtuMa
 N4LP7t9io0rt2n0XDymQAX87f73zyb9bQLBX5opEFq2ZUcScTN5W69Fpg6+rELuiC2a3
 nxOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699438574; x=1700043374;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mew7HLJV6bxxISerUbjxXiqgzi3Kwtc+0JQK/sXHoQQ=;
 b=L77x+zAWH8mbcHTM3jJK+8aUJlsfzTR70ESomYvrZSCkMBkwdwl2gYNxCMVNAMUcsM
 Qx4K5eJ0IedRA42hKVeZe+BYcIP+sFST811yvMXYgb1iHmzj5+WT5fGR+REbiw6W6LqW
 ML+hwy+xkHBUH/dTmMqQQ+dX4Ly7kwzkBPYZaQZe2UWBt69Em+XRsCyz3IGmTUooyZa1
 Wd2xHeyV/3mQK67xBbKVV5cDvu6vhRstFvb9u0yEhLfwc1gtU57XBi/CLTjt5OERpwp/
 G5XDrfpKFT9tBANaZNgK39J+C0vfhnCTDdxsI4C12PMVm2l8k+I5rJ136qzmLDMa9wxb
 wwZg==
X-Gm-Message-State: AOJu0Yw3VFCEjdNf9AXGX+Fka+1aMmR5tiUXYAPoxbP7cvtNxf4zIxyk
 yLhtjLgZzz2gMifJ2E2cUSM=
X-Google-Smtp-Source: AGHT+IGy+JYLCBrI7or7HO8pxgQV/q3q+WFWHRlKgQcmGLzbYORCkTAZh+vwEPuigX2vFOg0Okei7Q==
X-Received: by 2002:a05:6512:3d8f:b0:507:96e5:2ff4 with SMTP id
 k15-20020a0565123d8f00b0050796e52ff4mr1121219lfv.52.1699438574020; 
 Wed, 08 Nov 2023 02:16:14 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 w17-20020a0565120b1100b00502e01d1383sm625747lfu.27.2023.11.08.02.16.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Nov 2023 02:16:13 -0800 (PST)
Date: Wed, 8 Nov 2023 12:16:01 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH 01/10] drm/doc/rfc: Describe why prescriptive color
 pipeline is needed
Message-ID: <20231108121601.163e58db@eldfell>
In-Reply-To: <f013a0b7-eed9-4b2b-a6d0-4678c46bef84@amd.com>
References: <20230908150235.75918-1-harry.wentland@amd.com>
 <20230908150235.75918-2-harry.wentland@amd.com>
 <20231010161322.topz6zfealkxtwjj@mail.igalia.com>
 <c80abc42-3197-4476-b33d-88c795b2e55c@amd.com>
 <20231020133658.4cff9f42@eldfell>
 <bc7aa628-4d9b-4141-a001-535e67d173dd@amd.com>
 <20231107115543.7fa6e5f2@eldfell>
 <f013a0b7-eed9-4b2b-a6d0-4678c46bef84@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lMEpIpIFUuShctifGdMPV2c";
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <shashank.sharma@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>, Jonas =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <mdaenzer@redhat.com>,
 Victoria Brekenfeld <victoria@system76.com>, Aleix Pol <aleixpol@kde.org>,
 Naseer Ahmed <quic_naseer@quicinc.com>,
 Christopher Braga <quic_cbraga@quicinc.com>, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/lMEpIpIFUuShctifGdMPV2c
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 7 Nov 2023 11:58:26 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> On 2023-11-07 04:55, Pekka Paalanen wrote:
> > On Mon, 6 Nov 2023 11:19:27 -0500
> > Harry Wentland <harry.wentland@amd.com> wrote:
> >  =20
> >> On 2023-10-20 06:36, Pekka Paalanen wrote: =20
> >>> On Thu, 19 Oct 2023 10:56:40 -0400
> >>> Harry Wentland <harry.wentland@amd.com> wrote:
> >>>    =20
> >>>> On 2023-10-10 12:13, Melissa Wen wrote:   =20
> >>>>> O 09/08, Harry Wentland wrote:     =20
> >>>>>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>   =20
> >>>
> >>> ...
> >>>    =20
> >>>>> Also, with this new plane API in place, I understand that we will
> >>>>> already need think on how to deal with the mixing between old drm c=
olor
> >>>>> properties (color encoding and color range) and these new way of se=
tting
> >>>>> plane color properties. IIUC, Pekka asked a related question about =
it
> >>>>> when talking about CRTC automatic RGB->YUV (?)=20
> >>>>>      =20
> >>>>
> >>>> We'll still need to confirm whether we'll want to deprecate these
> >>>> existing properties. If we do that we'd want a client prop. Things
> >>>> should still work without deprecating them, if drivers just pick up
> >>>> after the initial encoding and range CSC.
> >>>>
> >>>> But realistically it might be better to deprecate them and turn them
> >>>> into explicit colorops.   =20
> >>>
> >>> The existing properties would need to be explicitly reflected in the
> >>> new pipelines anyway, otherwise there would always be doubt at which
> >>> point of a pipeline the old properties apply, and they might even
> >>> need to change positions between pipelines.
> >>>
> >>> I think it is simply easier to just hide all old color related
> >>> properties when userspace sets the client-cap to enable pipelines. The
> >>> problem is to make sure to hide all old properties on all drivers that
> >>> support the client-cap.
> >>>
> >>> As a pipeline must be complete (describe everything that happens to
> >>> pixel values), it's going to be a flag day per driver.
> >>>
> >>> Btw. the plane FB YUV->RGB conversion needs a colorop in every pipeli=
ne
> >>> as well. Maybe it's purely informative and non-configurable, keyed by
> >>> FB pixel format, but still.
> >>>
> >>> We also need a colorop to represent sample filtering, e.g. bilinear,
> >>> like I think Sebastian may have mentioned in the past. Everything
> >>> before the sample filter happens "per tap" as Joshua Ashton put it, a=
nd
> >>> everything after it happens on the sample that was computed as a
> >>> weighted average of the filter tap inputs (texels).
> >>>
> >>> There could be colorops other than sample filtering that operate on
> >>> more than one sample at a time, like blur or sharpness. There could
> >>> even be colorops that change the image size like adding padding that
> >>> the following colorop hardware requires, and then yet another colorop
> >>> that clips that padding away. For an example, see
> >>> https://lists.freedesktop.org/archives/dri-devel/2023-October/427015.=
html
> >>>
> >>> If that padding and its color can affect the pipeline results of the
> >>> pixels near the padding (e.g. some convolution is applied with them,
> >>> which may be the reason why padding is necessary to begin with), then
> >>> it would be best to model it.
> >>>    =20
> >>
> >> I hear you but I'm also somewhat shying away from defining this at thi=
s point. =20
> >=20
> > Would you define them before the new UAPI is released though?
> >=20
> > I agree there is no need to have them in this patch series, but I think
> > we'd hit the below problems if the UAPI is released without them.
> >  =20
> >> There are already too many things that need to happen and I will focus=
 on the
> >> actual color blocks (LUTs, matrices) first. We'll always be able to ad=
d a new
> >> (read-only) colorop type to define scaling and tap behavior at any poi=
nt and
> >> a client is free to ignore a color pipeline if it doesn't find any tap=
/scale
> >> info in it. =20
> >=20
> > How would userspace know to look for tap/scale info, if there is no
> > upstream definition even on paper?
> >  =20
>=20
> So far OSes did not care about this. Whether that's good or bad is
> something everyone can answer for themselves.
>=20
> If you write a compositor and really need this you can just ignore
> color pipelines that don't have this, i.e., you'll probably want
> to wait with implementing color pipeline support until you have what
> you need from DRM/KMS.
>=20
> This is not to say I don't want to have support for Weston. But I'm
> wondering if we place too much importance on getting every little
> thing figured out whereas we could be making forward progress and
> address more aspects of a color pipeline in the future. There is a
> reason gamescope has made a huge difference in driving the color
> management work forward.
>=20
> > And the opposite case, if someone writes userspace without tap/scale
> > colorops, and then drivers add those, and there is no pipeline without
> > them, because they always exist. Would that userspace disregard all
> > those pipelines because it does not understand tap/scale colorops,
> > leaving no usable pipelines? Would that not be kernel regressing
> > userspace?
> >  =20
>=20
> The simple solution is to leave previously advertised pipelines
> untouched and add a new version that does include scaling information.
>=20
> > If the kernel keeps on exposing pipelines without the colorops, it
> > fails the basic promise of the whole design: that all pixel value
> > affecting operations are at least listed if not controllable.
> >=20
> > How will we avoid painting ourselves in a corner?
> >=20
> > Maybe we need a colorop for "here be dragons" documented as having
> > unknown and unreliable effects, until driver authors are sure that
> > everything has been modelled in the pipeline and there are no unknowns?
> > Or a flag on the pipelines, if we can have that. Then we can at least
> > tell when the pipeline does not fulfil the basic promise.
> >  =20
>=20
> The will always be dragons at some level.

Do I understand right that the goal of fully understood color pipelines
is a lost cause?

That every pipeline might always have something unknown and there is no
way for userspace to know if it does? Maybe because driver developers
don't know either?

By something unknown I refer to anything outside of basic precision
issues. Doing interpolation or mixing of inputs on the wrong side of a
known non-linear colorop, for example.

An incremental UAPI development approach is fine by me, meaning that
pipelines might not be complete at first, but I believe that requires
telling userspace whether the driver developers consider the pipeline
complete (no undescribed operations that would significantly change
results from the expected results given the UAPI exposed pipeline).

The prime example of what I would like to know is that if a FB
contains PQ-encoded image and I use a color pipeline to scale that
image up, will the interpolation happen before or after the non-linear
colorop that decodes PQ. That is a significant difference as pointed
out by Joshua.


Thanks,
pq

--Sig_/lMEpIpIFUuShctifGdMPV2c
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmVLX+EACgkQI1/ltBGq
qqcBtQ//R+q02drC1YblB4awwZYbA8xpJtyx0CI046qS8Fo7mQ5erJB2CR5HYrmW
Xq/p555sAgWu42UQzx9eKabPM456Ya4d/5wMTMuBDGw6/I+ctdSLeO1Dm9iwLGZd
50tJCOlPHMwyYvNj9xccLGyTKyE/N1dS6qm/TQBQGTzv1GcQKtTU1KM2wwkL149n
iMS1xlZhqaxoVQcodsPzPV77S3Np2aRh+DojSddo3xiXom0G2ERa0fr/3t91/0G+
npSxaY8G157mdLzm5GMipXz9Qn1up4vIg8eqZQZrf+N1wePRU/GSKf0gR653Utj2
3Sb7Vg2PFu5x2kbNKHF+ZlRiYBwt92lsRg7oc6VWxK89NnRv3htH8NqSIghjhJ9+
3yaZIgVyLzhuzFqltDBoEA2SFnEhgOk+FIeXTykFLs1o2nkWXk0vYXljqvFsO6S+
gSPS52VlYIySvCBFM3GazNWEI+vedS06zf+HnbksSPh9fK9huN1/8pdwSS0OBx0w
JxG6bZaXsZJJ2QhWz1mB3YKgmHOTkeTOWFzz9oUzx319M/+v4nNpJlAdeQpCBjZM
Qqv5lmoC+byDvhUnZAUr60msD0S1IgT7zGA1L3ZllCqaO+eCK2RHN8q5SYzeaBqf
vBgIHmSUp/21WumH+0Bi5f/A3QrW48uOSrGeBSKEfYmOEa+XFtw=
=ct/U
-----END PGP SIGNATURE-----

--Sig_/lMEpIpIFUuShctifGdMPV2c--
