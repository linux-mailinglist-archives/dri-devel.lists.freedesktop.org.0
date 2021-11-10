Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C106544BD47
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 09:49:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D0F26F64B;
	Wed, 10 Nov 2021 08:49:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E216F64B;
 Wed, 10 Nov 2021 08:49:29 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id i63so3855938lji.3;
 Wed, 10 Nov 2021 00:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=ow4ZZRFSs+4Yg5QnuhQmrhT82v7aMajcm2dx6j1D/jM=;
 b=iC5kfDBNpocRutotmB0J4tbSP4/tN1BBFW9gl1iHilU/0tSXZ7qz/fFkrTk2Wzjs2w
 zzHa21jEQDWd9mvMKNbI9OMDEwvEZ3ZvlEiv3jrmi/pabp651nHjQfOpQ9TPxjDs9RxF
 iyZFca2XO1kyn+26z7dnvitrrrEryQkn7b8Sh/kuTInxBx5y68AlbBXP4PFeTjfSLfuv
 2UhWUY0mzcuwn/QX6NRKmKCo3YBMfP00oyQTiWItDDMIUHgdQ8S6vNugM7o7f6W9pjr2
 6t3chQg/6xcpzbdcX1QvjlTLyDx0gxfxeSvQo3NgX4eDhW1wZEsUXnfqc0C3XcuLmJiK
 +Olg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=ow4ZZRFSs+4Yg5QnuhQmrhT82v7aMajcm2dx6j1D/jM=;
 b=bJzRYkjEWnY7eCeMwU9CVTsg3KC00+dRSlYEZf0aH50/+lMgcnFu4p604mKkrFbRH5
 IzVOz8/QwBg4NrodAwSlaMVyyCgsv2OxlodtjAENZdAwycrPQcAA2u4+WOgBP8eSKVDx
 F6PXOkrqp2wslRerJdWSfeTxr0beWb5E1FWsq6hX92eBEZvTPfRsk5BSwVwBb1lmG0t0
 ry2mQEUWu6bRglHTSaJErwKrU5iwXC9KEQbhLS1dOEH9KOeW6oga6xPDltP4jCsQ/MPV
 2ErBf0jnKa3qvpHryJ8k4W2mXPjM+ONCnrQea4TpqGHijDjdPX59YWizIt3HB1b7Sakh
 K1uQ==
X-Gm-Message-State: AOAM533Uwjm6ITYqy8Ow/Md2l75qRtIAgOcBO7oqUw5UTNDjvagB2ukS
 qHkUv98YZ8uM2yHzmxSVyOg=
X-Google-Smtp-Source: ABdhPJzJJe/3D/Dv/kl8R/syAhD+/OtxN6pHGid6YU4X24mQsxXWK7JKeqnvKvJ0TKX+WSkq0gNNYA==
X-Received: by 2002:a2e:984b:: with SMTP id e11mr13732081ljj.204.1636534168266; 
 Wed, 10 Nov 2021 00:49:28 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id w40sm2401836lfu.48.2021.11.10.00.49.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 00:49:27 -0800 (PST)
Date: Wed, 10 Nov 2021 10:49:24 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [RFC v2 02/22] drm: Add Enhanced Gamma and color lut range
 attributes
Message-ID: <20211110104924.08c3b744@eldfell>
In-Reply-To: <YYrv6Mlp0K+9pZ+A@intel.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
 <20210906213904.27918-3-uma.shankar@intel.com>
 <d67a9761-91b4-3432-dd55-f85bb0657b68@amd.com>
 <20211104103827.2cf48bb7@eldfell>
 <5780b3b6-5b12-df66-03be-5f1918d28989@amd.com>
 <20211108115427.5c3f162e@eldfell>
 <8f189780-707d-0dda-778f-1a42b74ff4ae@amd.com>
 <YYrv6Mlp0K+9pZ+A@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DZSquYgoZ34kBtIEp_nSqBP";
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
Cc: Shashank.Sharma@amd.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, sebastian@sebastianwick.net,
 Uma Shankar <uma.shankar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/DZSquYgoZ34kBtIEp_nSqBP
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 10 Nov 2021 00:02:16 +0200
Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:

> On Tue, Nov 09, 2021 at 03:47:58PM -0500, Harry Wentland wrote:
> > On 2021-11-08 04:54, Pekka Paalanen wrote: =20
> > > On Thu, 4 Nov 2021 12:27:56 -0400
> > > Harry Wentland <harry.wentland@amd.com> wrote:
> > >  =20
> > >> On 2021-11-04 04:38, Pekka Paalanen wrote: =20
> > >>> On Wed, 3 Nov 2021 11:08:13 -0400
> > >>> Harry Wentland <harry.wentland@amd.com> wrote:
> > >>>    =20
> > >>>> On 2021-09-06 17:38, Uma Shankar wrote:   =20
> > >>>>> Existing LUT precision structure is having only 16 bit
> > >>>>> precision. This is not enough for upcoming enhanced hardwares
> > >>>>> and advance usecases like HDR processing. Hence added a new
> > >>>>> structure with 32 bit precision values.
> > >>>>>
> > >>>>> This also defines a new structure to define color lut ranges,
> > >>>>> along with related macro definitions and enums. This will help
> > >>>>> describe multi segmented lut ranges in the hardware.
> > >>>>>
> > >>>>> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > >>>>> ---
> > >>>>>  include/uapi/drm/drm_mode.h | 58 +++++++++++++++++++++++++++++++=
++++++
> > >>>>>  1 file changed, 58 insertions(+)

...

> > >> If the framebuffer is not in FP16 the question then becomes how
> > >> the integer pixel values relate to LUT addressing. =20
> > >=20
> > > Traditionally, and in any API I've seen (GL, Vulkan), a usual mapping
> > > is to match minimum unsigned integer value to 0.0, and unsigned maxim=
um
> > > integer value to 1.0. This is how things work on the cable too, right?
> > > (Also taking full vs. limited range video signal into account. And
> > > conversion to cable-YUV if that happens.)
> > >=20
> > > If you want integer format FB values to map to something else, then y=
ou
> > > have to tag the FB with that range information, somehow. New UAPI.
> > >  =20
> >=20
> > On the cable we send integer values, not floating point. AMD HW uses
> > floating point internally, though, and the PWL API defines floating
> > point entries, so on some level we need to be clear what the floating
> > point entries mean. Either we document that to be [0.0, 1.0] or we
> > have some UAPI to define it. I'm leaning toward the latter but have
> > to think about it some more. =20
>=20
> As for Intel hw if you have an integer pixel value of 0xff... (with
> however many bits you have with a specific pixel format) it will get
> extended to 0.fff... (to whatever precision the pipe has internally).
> So if we go by that a fixed point 1.0 value in the proposed
> drm_color_lut_range would be considered just outside the gamut. And
> pretty sure fp16 input of 1.0 should also result in a 0.fff... internal
> value as well [1]. I think that definition pretty much matches how GL
> UNORM<->float conversion works as well.

Does it work that way in GL though?

I've always thought that with GL_UNSIGNED_BYTE, 0xff maps to 1.0, not
255.0/256.0.

Taking a random spec: OpenGL ES 2.0.25

Section 2.1.2 Data Conversions says:

	Normalized unsigned integers represent numbers in the range
	[0, 1]. The conversion from a normalized unsigned integer c to
	the corresponding floating-point f is defined as
	f =3D c / (2^b - 1)

Note how the divisor has -1.


Thanks,
pq

> [1] though IIRC some our hw did get that a bit wrong and it
>     actually generates a 1.0 fixed point value for the pipe


--Sig_/DZSquYgoZ34kBtIEp_nSqBP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmGLh5QACgkQI1/ltBGq
qqcqCRAAh/yJtwzwyWBIuAzfh2OyHBZBYejgtDn1otLPKxrM01qXYLWOsdtOsYl6
7AnBrZHuXaSlMIDmI6H3PkwOe3T6iaDYeyVpcT3+d4zxB9y0rgLaG9f6p9Gn/QNh
2LnOZdN6XJUiIqHvjAO/NJNUwRPOlaSkHInCIh1dwT42iN6sJVAUmokYIt/lAvbl
sKS9+5VRrU2/ijZ7sUXyRMFC2vxF6FZiuqgSfkGRuHnHbztzSyWjzRxbj1KU82tr
NhkYhCkf3NBfbRFs1rW2cABcI5SIQqogu/t5cM/51elOrq9h4xgHWoYQBr7daA5n
pfBS6om0pD5wCH/FkItJDQLKDexvB2WYxDNoYYxPbsMDMF4lC834edDVODWq4Uw8
xJ6Vat9cRWpMURQ2qa0iDRjcfluVx5VdvH1mv4LSKfY0xLkn8Pq/RavtDhRJypWQ
VuKu3CWhqqpt9U+99//iRGAhEI1O9ADgjMFTuGmQx+xmQme3Kw7Kk3DkCI72ItTV
Gwo4JGebg1aCc4dXkdII9vwWBScvGzd79kwfNcuANrjTENvtgc+HaIny3F9oeyYC
JhDPLfPCrQReEFt5kUUJ1a/dnMhHJ/3pIk3AIb0Pei3E2RFZFxmy2OQm0wvxKVgZ
GMioVJmwNmedsGH3grXsPihuPwbkiZ/XTeD3o2Vs4QwnTSAGhyw=
=P3Z+
-----END PGP SIGNATURE-----

--Sig_/DZSquYgoZ34kBtIEp_nSqBP--
