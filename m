Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 129B2452C84
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 09:15:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A4806E92C;
	Tue, 16 Nov 2021 08:15:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14AB66E8B6;
 Tue, 16 Nov 2021 08:15:17 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id f18so51019869lfv.6;
 Tue, 16 Nov 2021 00:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=gGI9vBrtVlwKVGirQTh2+IVKELrHvVGVaSJiW5k7XdY=;
 b=ZgoYQ+/EEo92M087UvI76z8gJ15gBu3glVLs1RFhymtIOVT9hs4jMSmPizTc7ztzT7
 W8nWRexa9qDbGY7SRwJiPCTKhNp6sUsBly+Ap8CHHQW8N4V8yEmoIMArAespnTTZzk97
 RKhEq9JcJK+SWs2Bxk/2xEbULOK7r1Qaga6jNk7Z7SAVgxYmRG3FIkT8UC8sGGFmznzW
 HljDBoVzNEh0E85mA4ffPYZuz7mOl7qg2oPfoSNNAzmZ/nH6SaQN06R3Vwb0+a8e6GW7
 nycLbVZQdc0M0MiOPi0oCnJrBJNjefW4VBDBJYItWWh7nvZK3LrovEwpbFYJOOSIyfS6
 Z6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=gGI9vBrtVlwKVGirQTh2+IVKELrHvVGVaSJiW5k7XdY=;
 b=LV11KrYnHoePdhKHPtrpetmYY66uzMweDv5aw2gBoV8lIInF8GwKMtP0B3XcNVh8lc
 DGoZrB8c+PgdPX1UpIaCPPl6hghYUeHoMnjCwe9JZeNUfJMOJq0AN9efWLCkxou2UEpM
 /ytMOBjoIR1qPipyaqYlwytnPvkHlJuOu4lguDkb6qwERXvmXafu4NBoeGNtT4d1kfg/
 g6jcThRVhPGbNv2P6PFIPWTxqJV1eIDhXFeO+sKyAcXO7K5iizba7tNHzGKa0B+HzW4i
 YvN4k9l6CggdQiitnU5Q1t9ujBR9W+KTEb40on9ReaLdfHZ5BDroNyLkAbgwrG+v+jrd
 92LA==
X-Gm-Message-State: AOAM53119oju+k3sHpQ+hs7wFtNVSIOkEu4mlOlaOXdltY6ejJXoDfgx
 NWFKvOWl1seoxOxAY10lEbM=
X-Google-Smtp-Source: ABdhPJxzXwUPArY5aQvxy7Emp8GvdjrZr0OE0/IMJUD0aI+GQEJg1cAwZc0DsUN4CQPcLnmAVK4GaA==
X-Received: by 2002:a05:6512:114e:: with SMTP id
 m14mr4886439lfg.418.1637050515312; 
 Tue, 16 Nov 2021 00:15:15 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id m15sm1679349lfg.165.2021.11.16.00.15.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 00:15:14 -0800 (PST)
Date: Tue, 16 Nov 2021 10:15:05 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [RFC v2 05/22] drm/i915/xelpd: Define Degamma Lut range struct
 for HDR planes
Message-ID: <20211116101505.68d3b4f3@eldfell>
In-Reply-To: <YY6AK/sTiWooE+rQ@intel.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
 <20210906213904.27918-6-uma.shankar@intel.com>
 <52ce874c-64ae-d7a9-bc4e-255cfa49f410@amd.com>
 <YY1H//+XISVMFZNL@intel.com>
 <edc4b80279354ec7bcdb0a890dae7d79@intel.com>
 <4a26ada6-feaa-76df-3ffe-d694e367d809@amd.com>
 <YY6AK/sTiWooE+rQ@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6ffaBqCQ0SNGd4vmg7Rn3le";
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
Cc: "Shashank.Sharma@amd.com" <Shashank.Sharma@amd.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "sebastian@sebastianwick.net" <sebastian@sebastianwick.net>, "Shankar,
 Uma" <uma.shankar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/6ffaBqCQ0SNGd4vmg7Rn3le
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 12 Nov 2021 16:54:35 +0200
Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:

> On Thu, Nov 11, 2021 at 04:10:41PM -0500, Harry Wentland wrote:
> >=20
> >=20
> > On 2021-11-11 15:42, Shankar, Uma wrote: =20
> > >=20
> > >  =20
> > >> -----Original Message-----
> > >> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > >> Sent: Thursday, November 11, 2021 10:13 PM
> > >> To: Harry Wentland <harry.wentland@amd.com>
> > >> Cc: Shankar, Uma <uma.shankar@intel.com>; intel-gfx@lists.freedeskto=
p.org; dri-
> > >> devel@lists.freedesktop.org; ppaalanen@gmail.com; brian.starkey@arm.=
com;
> > >> sebastian@sebastianwick.net; Shashank.Sharma@amd.com
> > >> Subject: Re: [RFC v2 05/22] drm/i915/xelpd: Define Degamma Lut range=
 struct for
> > >> HDR planes
> > >>
> > >> On Thu, Nov 11, 2021 at 10:17:17AM -0500, Harry Wentland wrote: =20
> > >>>
> > >>>
> > >>> On 2021-09-06 17:38, Uma Shankar wrote: =20
> > >>>> Define the structure with XE_LPD degamma lut ranges. HDR and SDR
> > >>>> planes have different capabilities, implemented respective structu=
re
> > >>>> for the HDR planes.
> > >>>>
> > >>>> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > >>>> ---
> > >>>>  drivers/gpu/drm/i915/display/intel_color.c | 52
> > >>>> ++++++++++++++++++++++
> > >>>>  1 file changed, 52 insertions(+)
> > >>>>
> > >>>> diff --git a/drivers/gpu/drm/i915/display/intel_color.c
> > >>>> b/drivers/gpu/drm/i915/display/intel_color.c
> > >>>> index afcb4bf3826c..6403bd74324b 100644
> > >>>> --- a/drivers/gpu/drm/i915/display/intel_color.c
> > >>>> +++ b/drivers/gpu/drm/i915/display/intel_color.c
> > >>>> @@ -2092,6 +2092,58 @@ static void icl_read_luts(struct intel_crtc=
_state =20
> > >> *crtc_state) =20
> > >>>>  	}
> > >>>>  }
> > >>>>
> > >>>> + /* FIXME input bpc? */
> > >>>> +__maybe_unused
> > >>>> +static const struct drm_color_lut_range d13_degamma_hdr[] =3D {
> > >>>> +	/* segment 1 */
> > >>>> +	{
> > >>>> +		.flags =3D (DRM_MODE_LUT_GAMMA |
> > >>>> +			  DRM_MODE_LUT_REFLECT_NEGATIVE |
> > >>>> +			  DRM_MODE_LUT_INTERPOLATE |
> > >>>> +			  DRM_MODE_LUT_NON_DECREASING),
> > >>>> +		.count =3D 128,
> > >>>> +		.input_bpc =3D 24, .output_bpc =3D 16,
> > >>>> +		.start =3D 0, .end =3D (1 << 24) - 1,
> > >>>> +		.min =3D 0, .max =3D (1 << 24) - 1,
> > >>>> +	},
> > >>>> +	/* segment 2 */
> > >>>> +	{
> > >>>> +		.flags =3D (DRM_MODE_LUT_GAMMA |
> > >>>> +			  DRM_MODE_LUT_REFLECT_NEGATIVE |
> > >>>> +			  DRM_MODE_LUT_INTERPOLATE |
> > >>>> +			  DRM_MODE_LUT_REUSE_LAST |
> > >>>> +			  DRM_MODE_LUT_NON_DECREASING),
> > >>>> +		.count =3D 1,
> > >>>> +		.input_bpc =3D 24, .output_bpc =3D 16,
> > >>>> +		.start =3D (1 << 24) - 1, .end =3D 1 << 24,
> > >>>> +		.min =3D 0, .max =3D (1 << 27) - 1,
> > >>>> +	},
> > >>>> +	/* Segment 3 */
> > >>>> +	{
> > >>>> +		.flags =3D (DRM_MODE_LUT_GAMMA |
> > >>>> +			  DRM_MODE_LUT_REFLECT_NEGATIVE |
> > >>>> +			  DRM_MODE_LUT_INTERPOLATE |
> > >>>> +			  DRM_MODE_LUT_REUSE_LAST |
> > >>>> +			  DRM_MODE_LUT_NON_DECREASING),
> > >>>> +		.count =3D 1,
> > >>>> +		.input_bpc =3D 24, .output_bpc =3D 16,
> > >>>> +		.start =3D 1 << 24, .end =3D 3 << 24,
> > >>>> +		.min =3D 0, .max =3D (1 << 27) - 1,
> > >>>> +	},
> > >>>> +	/* Segment 4 */
> > >>>> +	{
> > >>>> +		.flags =3D (DRM_MODE_LUT_GAMMA |
> > >>>> +			  DRM_MODE_LUT_REFLECT_NEGATIVE |
> > >>>> +			  DRM_MODE_LUT_INTERPOLATE |
> > >>>> +			  DRM_MODE_LUT_REUSE_LAST |
> > >>>> +			  DRM_MODE_LUT_NON_DECREASING),
> > >>>> +		.count =3D 1,
> > >>>> +		.input_bpc =3D 24, .output_bpc =3D 16,
> > >>>> +		.start =3D 3 << 24, .end =3D 7 << 24,
> > >>>> +		.min =3D 0, .max =3D (1 << 27) - 1,
> > >>>> +	},
> > >>>> +}; =20
> > >>>
> > >>> If I understand this right, userspace would need this definition in
> > >>> order to populate the degamma blob. Should this sit in a UAPI heade=
r? =20
> > >=20
> > > Hi Harry, Pekka and Ville,
> > > Sorry for being a bit late on the replies, got side tracked with vari=
ous issues.
> > > I am back on this. Apologies for delay.
> > >  =20
> > >> My original idea (not sure it's fully realized in this series) is to=
 have a new
> > >> GAMMA_MODE/etc. enum property on each crtc (or plane) for which each=
 enum
> > >> value points to a kernel provided blob that contains one of these LU=
T descriptors.
> > >> Userspace can then query them dynamically and pick the best one for =
its current use
> > >> case. =20
> > >=20
> > > We have this as part of the series Ville. Patch 3 of this series crea=
tes a DEGAMMA_MODE
> > > property just for this. With that userspace can just query the blob_i=
d's and will get the
> > > various degamma mode possible and the respective segment and lut dist=
ributions.
> > >=20
> > > This will be generic, so for userspace it should just be able to quer=
y this and parse and get
> > > the lut distribution and segment ranges.
> > >  =20
> >=20
> > Thanks for the explanation.
> >=20
> > Uma, have you had a chance to sketch some of this out in IGT? I'm trying
> > to see how userspace would do this in practice and will try to sketch an
> > IGT test for this myself, but if you have it already we could share the
> > effort.
> >  =20
> > >> The algorithm for choosing the best one might be something like:
> > >> - prefer LUT with bpc >=3D FB bpc, but perhaps not needlessly high b=
pc
> > >> - prefer interpolated vs. direct lookup based on current needs (eg. X
> > >>   could prefer direct lookup to get directcolor visuals).
> > >> - prefer one with extended range values if needed
> > >> - for HDR prefer smaller step size in dark tones,
> > >>   for SDR perhaps prefer a more uniform step size
> > >>
> > >> Or maybe we should include some kind of usage hints as well? =20
> > >=20
> > > I think the segment range and distribution of lut should be enough fo=
r a userspace
> > > to pick the right ones, but we can add some examples in UAPI descript=
ions as hints.
> > >  =20
> >=20
> > The range might be enough, but we're already parsing hints like "GAMMA"
> > or "DEGAMMA". I wonder if it would make sense to add a flag for "HDR" or
> > "SDR" as well.
> >  =20
> > >> And I was thinking of even adding a new property type (eg.
> > >> ENUM_BLOB) just for this sort of usecase. That could let us have a b=
it more generic
> > >> code to do all the validation around the property values and whatnot.
> > >>
> > >> The one nagging concern I really have with GAMMA_MODE is how a mix o=
f old and
> > >> new userspace would work. Though that is more of a generic issue wit=
h any new
> > >> property really. =20
> > >=20
> > > For plane properties getting added newly, old userspace will not get =
it so I think this should be ok.
> > > Newer userspace will implement this and get the new functionality.
> > > Problem will be in extending this to crtc where we have a legacy bagg=
age, the client caps approach
> > > may help us there. Have it as part of separate series just to not mix=
 it with this new plane stuff, though
> > > the idea remains same based on your design. Series below for referenc=
e: =20
> > > https://patchwork.freedesktop.org/series/90821/>>  =20
> >=20
> > Could we just assume we do a uniform LUT if userspace doesn't
> > set a _MODE enum value for the respective gamma?
> >=20
> > Maybe the _MODE should have a default enum value that means
> > a uniform (legacy) LUT. =20
>=20
> Yeah, it definitely needs a default like that. But the problem arises
> when new userspace sets it to something else and then hands the reins
> over to some old userspace that doesn't know how to reset it back to
> default.

This very problem is the one where I have been suggesting that
userspace that supports temporarily handing DRM-master to something
else needs to be prepared to save and restore also unrecognized KMS
properties.

We've also had talk about a "reset" switch in KMS, but I forget the
conclusion.

Both ideas lack the people working on them. I don't think we can design
each new KMS property ad hoc to somehow magically be compatible with
old vs. new client interoperation. In fact, the problem exists already
with e.g. the old GAMMA etc. properties.

OTOH, when a userspace client is reported to misbehave because
something else left KMS in a funny state, it is just too easy to simply
patch the innocent but misbehaving client to understand whatever new
property the other one was using, particularly if it's just to reset it
to some hardcoded expected value. So it's unclear if this problem even
needs a solution.


Thanks,
pq

--Sig_/6ffaBqCQ0SNGd4vmg7Rn3le
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmGTaIkACgkQI1/ltBGq
qqfxIA/9HUaeZI5V0K1QfAvoUO67IYnLZBpUO2vEYMgRjKwYgOKQG9jy+8KCpgsr
bpxxzBUNTR4yGvs/wQ7lnzlh9fNX/hULBf/+iI+laFXIUtVic/wtvZiOJaRutZyG
2dDTj6QTS88vSIc8Rik761K2MwIftO6vR6ZPWJASqpDXof7W0AFViLugL1jOq9kJ
aaxl5JN1Qb4OGBh+RS7wPyyBQ0Pm4yjca25rRuFmaaGjMIubNvJ6Zvvjq8yE/t+4
wAe00GneLjHqWMV/uhyPRX/2gbJKBLxNjuYHGJgH6A5BZtYleDJVLZD1QGi1PiBW
8adI2/2xlV/ArvjLoLGSJuy6hO/RLEY6WBlD3UVc6ov/BjzqFQnT3X25lkWyM97Q
sGHRDdK7U1tkXH/9Lw+zUl2mJWtYEgKXmjYRqzSjPx1QoiOCA8tpZbUl2ioQ1PLB
x0F7dhbpwFNu0LcqRwohda+FeIxN0xtp1OG6voQSjJBp7usGnFPBMHsXcJUvEJik
zhsOEg9GKawdJOP+vGu91Kf3+9+LdTKpnjWX2RtVr6b7pmcSXzWBJcGIl96CJKev
sb9SHKO2kG6yfKy0OPELx/+Zu9311yQoS7000cgvMrrfNEClpbwnp40bKVHXEyMD
v5neiBWuritfSX4UNNwg0qJdP6AUYG5eS5r8ZYcV+Hx86z4338Q=
=5ThE
-----END PGP SIGNATURE-----

--Sig_/6ffaBqCQ0SNGd4vmg7Rn3le--
