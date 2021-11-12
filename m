Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9EF44E35A
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 09:37:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF5A26EB89;
	Fri, 12 Nov 2021 08:37:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB0116EB88;
 Fri, 12 Nov 2021 08:37:14 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id h11so17230625ljk.1;
 Fri, 12 Nov 2021 00:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=8fvwKOIq31BIN5WVsKUfV3onrT99fP+HsEKg0cR2LAQ=;
 b=bY0ZuzQWEmr5SRYj7XWsRs/XX5A39DKHkvGtM2JaS/uaVfFqAtmNi2ambEAwwtyAXY
 G+W3NlX/L77Gkhj/XsB9UiigmJMqhqBrDxQan21PIbrgbOhp3N3jgjSe0coCfate9McP
 EJGY3uqFjAODaA/ZhYKd3neP7aBOA7dGq2dxTFDRFZ7SYnl+Pa2OpYfC/eILPwnBdpZ+
 kyQapL5JcksJMQjCGk23fgFL2m9v4pBx4Xv8Iuo13uBvCNxDa0LHNYTU9hFnqiAExeo5
 kCivXK2AkEXCsm5m8V/36q261mbC2fEKfozS/gjjy6Le/DSjRdjWuiYhKNBoNt3y8MdG
 OC3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=8fvwKOIq31BIN5WVsKUfV3onrT99fP+HsEKg0cR2LAQ=;
 b=7QCWEeM7Oo8uCPmo4Du6hvysCvMflx3hjvwPZVN3l00RUzs1oo2VnG2gzRQ9ZXVKaC
 Ur9iD0RHwR2Cj/+wHmH0RXbE4ICdxxnZexmNVTlejo8W9ZsWBUgkipIxm+ZJcmK47HNF
 CQAMUF02jcGwEQlI1H5HbSVUfpsjWRa/+N7Ny58u0hepu7H/ky5w1+gDVVGrUttBdbe5
 pfKaEP4JBa51KoD2AsTsUQfRm2jII+7mDIhZbmNvfV2OSww17XfhPtcVH3WKT26kquhq
 MqRtCjCtwI8YX3vK6A6qPHE8vpspfUkXMU60wwqWuRTwYEI06EDLRST9VXEC6u9iQs3c
 NL/w==
X-Gm-Message-State: AOAM53106TYleCxwRaW7SFHC6J08vs8wQzf/To0ZM80TpYBfcAvkL3SL
 nECLjxWzRnE4QvPh532LjFg=
X-Google-Smtp-Source: ABdhPJw1duWEwG+zhtLdI9gUSitdT3/N/L9jbdo/+iYMRp1JQoauTi3cfy9UgO6mYYjNyXsBlmb9Uw==
X-Received: by 2002:a05:651c:a04:: with SMTP id
 k4mr13634345ljq.421.1636706232958; 
 Fri, 12 Nov 2021 00:37:12 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id w40sm503109lfu.48.2021.11.12.00.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 00:37:12 -0800 (PST)
Date: Fri, 12 Nov 2021 10:37:02 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, Harry Wentland
 <harry.wentland@amd.com>
Subject: Re: [RFC v2 05/22] drm/i915/xelpd: Define Degamma Lut range struct
 for HDR planes
Message-ID: <20211112103702.7139cec7@eldfell>
In-Reply-To: <965b42dd64844e7c8c1b0af7582a4306@intel.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
 <20210906213904.27918-6-uma.shankar@intel.com>
 <52ce874c-64ae-d7a9-bc4e-255cfa49f410@amd.com>
 <YY1H//+XISVMFZNL@intel.com>
 <edc4b80279354ec7bcdb0a890dae7d79@intel.com>
 <4a26ada6-feaa-76df-3ffe-d694e367d809@amd.com>
 <965b42dd64844e7c8c1b0af7582a4306@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ROi6wMXwy52xY60g+SrDU_P";
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
 "sebastian@sebastianwick.net" <sebastian@sebastianwick.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/ROi6wMXwy52xY60g+SrDU_P
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 11 Nov 2021 21:58:35 +0000
"Shankar, Uma" <uma.shankar@intel.com> wrote:

> > -----Original Message-----
> > From: Harry Wentland <harry.wentland@amd.com>
> > Sent: Friday, November 12, 2021 2:41 AM
> > To: Shankar, Uma <uma.shankar@intel.com>; Ville Syrj=C3=A4l=C3=A4
> > <ville.syrjala@linux.intel.com>
> > Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org;
> > ppaalanen@gmail.com; brian.starkey@arm.com; sebastian@sebastianwick.net;
> > Shashank.Sharma@amd.com
> > Subject: Re: [RFC v2 05/22] drm/i915/xelpd: Define Degamma Lut range st=
ruct for
> > HDR planes
> >=20
> >=20
> >=20
> > On 2021-11-11 15:42, Shankar, Uma wrote: =20
> > >
> > > =20
> > >> -----Original Message-----
> > >> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > >> Sent: Thursday, November 11, 2021 10:13 PM
> > >> To: Harry Wentland <harry.wentland@amd.com>
> > >> Cc: Shankar, Uma <uma.shankar@intel.com>;
> > >> intel-gfx@lists.freedesktop.org; dri- devel@lists.freedesktop.org;
> > >> ppaalanen@gmail.com; brian.starkey@arm.com;
> > >> sebastian@sebastianwick.net; Shashank.Sharma@amd.com
> > >> Subject: Re: [RFC v2 05/22] drm/i915/xelpd: Define Degamma Lut range
> > >> struct for HDR planes
> > >>
> > >> On Thu, Nov 11, 2021 at 10:17:17AM -0500, Harry Wentland wrote: =20
> > >>>
> > >>>
> > >>> On 2021-09-06 17:38, Uma Shankar wrote: =20
> > >>>> Define the structure with XE_LPD degamma lut ranges. HDR and SDR
> > >>>> planes have different capabilities, implemented respective
> > >>>> structure for the HDR planes.
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
> > >>>> @@ -2092,6 +2092,58 @@ static void icl_read_luts(struct
> > >>>> intel_crtc_state =20
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

Are you asking whether 'struct drm_color_lut_range` is defined in any
userspace visible header?

It seems to be in patch 2.

> > >
> > > Hi Harry, Pekka and Ville,
> > > Sorry for being a bit late on the replies, got side tracked with vari=
ous issues.
> > > I am back on this. Apologies for delay.
> > > =20
> > >> My original idea (not sure it's fully realized in this series) is to
> > >> have a new GAMMA_MODE/etc. enum property on each crtc (or plane) for
> > >> which each enum value points to a kernel provided blob that contains=
 one of =20
> > these LUT descriptors. =20
> > >> Userspace can then query them dynamically and pick the best one for
> > >> its current use case. =20
> > >
> > > We have this as part of the series Ville. Patch 3 of this series
> > > creates a DEGAMMA_MODE property just for this. With that userspace can
> > > just query the blob_id's and will get the various degamma mode possib=
le and the =20
> > respective segment and lut distributions. =20
> > >
> > > This will be generic, so for userspace it should just be able to query
> > > this and parse and get the lut distribution and segment ranges.
> > > =20
> >=20
> > Thanks for the explanation.
> >=20
> > Uma, have you had a chance to sketch some of this out in IGT? I'm tryin=
g to see how
> > userspace would do this in practice and will try to sketch an IGT test =
for this myself,
> > but if you have it already we could share the effort. =20
>=20
> Yes Harry, we do have some sample IGT's to test this. Will send those out=
 and will copy
> you and all the stakeholders.
>=20
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
> > >
> > > I think the segment range and distribution of lut should be enough for
> > > a userspace to pick the right ones, but we can add some examples in U=
API =20
> > descriptions as hints. =20
> > > =20
> >=20
> > The range might be enough, but we're already parsing hints like "GAMMA"
> > or "DEGAMMA". I wonder if it would make sense to add a flag for "HDR" o=
r "SDR" as
> > well. =20

What hints are GAMMA or DEGAMMA and who's parsing them? I thought they
are just arbitrary names to identify the element's position in the
abstract pipeline.

>=20
> On Intel hardware, we differentiate this with precision and have HDR plan=
es (they have extra
> Lut precision and samples) separately called out. We could add SDR/HDR FL=
AG as well.

What about wide color gamut SDR? That probably needs more precision
than "normal" SDR but is not HDR.

I can't think of how SDR/HDR flags would work or what they would mean.
Feels a bit too simple for practice. Maybe that concept should be
created by a hypothetical userspace helper library instead.


Thanks,
pq

--Sig_/ROi6wMXwy52xY60g+SrDU_P
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmGOJ64ACgkQI1/ltBGq
qqcl1w//S013E0/8y/i41PIFICkbESf9wbRnkHrPlLRD56GlKrw0g/7v8ptxqpxL
rpg+GKitDxKVUaY8UGZAW2F5mv4vVk1oYXDDeA79/qlRF+YgwGZfTmtenPVDEvnc
C8UbTmXuRgazdfiiLYB1lZbEiC1OMZwfxndNPIHzDUf5VWzhclYikbe8JrtZAfQ7
dmDkBbj8oRc51sMj0feFd9qL6Qr6+NHRrsNYs3yHiuprAuPf/GEUB9VpII386u3l
5ketzLkPJfpFRNQoVNXFksu21PiXTr3fpD+8dkur1+A2joWwTYyZCwMsa8kC9iva
CJsJCw5jdbUV0Wr7iapOqNwdPzlaFngU2DBk+HnqgjTnlyhZcijkEMsZw6U2+wHB
lH4LSHZUfzrKx36Cak8y7CYV4mU8GeONT+jETlpTS+uC0PGIN3vf5dYgRlTPM4hf
QOQ/qa25MMaDQRNZOzUNvKFIgj49V3f6/c/uLGSFhq4woZLP9wviHmyu7Xgj363c
36n0G69paesZSnX6UV5PR4hsxgLgpZT+76Qxm9XXbv+eC34QVXFg7WeRgBR3vcyl
BNkeaRny3CNWUcx9WLuWmOLLXYDmZyiUR1Ioa+dHfxjaf0seNPAHM3TqlGDBiUPD
WzrQdZUZ6PAQhNYq3Xh1SlI0RdoPj510yvhV/+C20q0YVkWrcXA=
=8WuI
-----END PGP SIGNATURE-----

--Sig_/ROi6wMXwy52xY60g+SrDU_P--
