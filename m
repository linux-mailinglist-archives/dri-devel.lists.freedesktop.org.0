Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E15854489
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 10:04:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4742E10E41F;
	Wed, 14 Feb 2024 09:04:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="fllSPZxA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 839E210E41F;
 Wed, 14 Feb 2024 09:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UypCRKYR1lxWXCiQVwTKw0V7iqeRFCfB3PHUsGDAa+4=; b=fllSPZxAQHd2GOqwel0j/EtPHW
 s3xQhbxQ5Y+M8yK8in5pMTLZrZuvfYPnhk8X1sYPD922xCPLzBY8YY05h/qB/BejcRXtTqV+mkxIO
 fiyUQys/tGcDF6yJbqm3+pw/C9ppocEklF2pjVUsvoGBbzCghFecxggQM4VrKEMTHHPN5cJygKRxp
 QijTlEv2smNpGdXLHAr/i1cCygtjiLApB2hk+A2lr6wi9TUJUbxVGBTSI9sH09B81t74OWsYp1RfY
 Di0igX0kI9oVTKNnThYJacWaZaupbwsyTOqgyphHuSD2W9o8/1ncjIT2IOKttKSUvHSnhZ2qqerqV
 ZReVuvnw==;
Received: from [194.136.85.206] (port=50172 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <pekka.paalanen@haloniitty.fi>) id 1raBBI-0004mS-2v;
 Wed, 14 Feb 2024 11:03:52 +0200
Date: Wed, 14 Feb 2024 11:03:40 +0200
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: "Shankar, Uma" <uma.shankar@intel.com>
Cc: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "contact@emersion.fr" <contact@emersion.fr>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "mwen@igalia.com" <mwen@igalia.com>,
 "jadahl@redhat.com" <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>, "shashank.sharma@amd.com"
 <shashank.sharma@amd.com>, "agoins@nvidia.com" <agoins@nvidia.com>,
 "joshua@froggi.es" <joshua@froggi.es>, "mdaenzer@redhat.com"
 <mdaenzer@redhat.com>, "aleixpol@kde.org" <aleixpol@kde.org>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>, "victoria@system76.com"
 <victoria@system76.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "quic_naseer@quicinc.com" <quic_naseer@quicinc.com>,
 "quic_cbraga@quicinc.com" <quic_cbraga@quicinc.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>,
 "arthurgrillo@riseup.net" <arthurgrillo@riseup.net>, "marcan@marcan.st"
 <marcan@marcan.st>, "Liviu.Dudau@arm.com" <Liviu.Dudau@arm.com>,
 "sashamcintosh@google.com" <sashamcintosh@google.com>, "sean@poorly.run"
 <sean@poorly.run>
Subject: Re: [PATCH 17/28] drm/i915: Define segmented Lut and add
 capabilities to colorop
Message-ID: <20240214110340.477e9df3@eldfell>
In-Reply-To: <DM4PR11MB636037556D1EF1ACC2A70629F44E2@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20240213064835.139464-1-uma.shankar@intel.com>
 <20240213064835.139464-18-uma.shankar@intel.com>
 <20240213113727.22f9c8e5@eldfell>
 <DM4PR11MB636037556D1EF1ACC2A70629F44E2@DM4PR11MB6360.namprd11.prod.outlook.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2o/cM10kVjboRV1FW3+7Xxc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - whm50.louhi.net
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - haloniitty.fi
X-Get-Message-Sender-Via: whm50.louhi.net: authenticated_id:
 pekka.paalanen@haloniitty.fi
X-Authenticated-Sender: whm50.louhi.net: pekka.paalanen@haloniitty.fi
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/2o/cM10kVjboRV1FW3+7Xxc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 14 Feb 2024 07:28:37 +0000
"Shankar, Uma" <uma.shankar@intel.com> wrote:

> > -----Original Message-----
> > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of =
Pekka
> > Paalanen
> > Sent: Tuesday, February 13, 2024 3:07 PM
> > To: Shankar, Uma <uma.shankar@intel.com>
> > Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org;
> > ville.syrjala@linux.intel.com; contact@emersion.fr; harry.wentland@amd.=
com;
> > mwen@igalia.com; jadahl@redhat.com; sebastian.wick@redhat.com;
> > shashank.sharma@amd.com; agoins@nvidia.com; joshua@froggi.es;
> > mdaenzer@redhat.com; aleixpol@kde.org; xaver.hugl@gmail.com;
> > victoria@system76.com; daniel@ffwll.ch; quic_naseer@quicinc.com;
> > quic_cbraga@quicinc.com; quic_abhinavk@quicinc.com; arthurgrillo@riseup=
.net;
> > marcan@marcan.st; Liviu.Dudau@arm.com; sashamcintosh@google.com;
> > sean@poorly.run
> > Subject: Re: [PATCH 17/28] drm/i915: Define segmented Lut and add capab=
ilities
> > to colorop
> >=20
> > On Tue, 13 Feb 2024 12:18:24 +0530
> > Uma Shankar <uma.shankar@intel.com> wrote:
> >  =20
> > > This defines the lut segments and create the color pipeline
> > >
> > > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > > Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/display/intel_color.c | 109
> > > +++++++++++++++++++++
> > >  1 file changed, 109 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/i915/display/intel_color.c
> > > b/drivers/gpu/drm/i915/display/intel_color.c
> > > index e223edbe4c13..223cd1ff7291 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_color.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_color.c
> > > @@ -3811,6 +3811,105 @@ static const struct intel_color_funcs =20
> > ilk_color_funcs =3D { =20
> > >  	.get_config =3D ilk_get_config,
> > >  };
> > >
> > > +static const struct drm_color_lut_range xelpd_degamma_hdr[] =3D {
> > > +	/* segment 1 */
> > > +	{
> > > +		.flags =3D (DRM_MODE_LUT_REFLECT_NEGATIVE |
> > > +				DRM_MODE_LUT_INTERPOLATE |
> > > +				DRM_MODE_LUT_NON_DECREASING), =20
> >=20
> > Hi Uma,
> >=20
> > is it a good idea to have these flags per-segment?
> >=20
> > I would find it very strange, unusable really, if REFLECT_NEGATIVE appl=
ied on
> > some but not all segments, for example. Is such flexibility really nece=
ssary in the
> > hardware description? =20
>=20
> Hi Pekka,
> Idea to have these flags is to just have some option in case there are so=
me differences
> across segments. Most cases this should not be the case, just helps to fu=
ture proof
> the implementation.
>=20
> Based on how the community feels on the usability of it, we can take a ca=
ll on the flags
> and the expected interpretation for the same. We are open for suggestions=
 on the same.
>=20
> >  =20
> > > +		.count =3D 128,
> > > +		.input_bpc =3D 24, .output_bpc =3D 16, =20
> >=20
> > The same question about input_bpc and output_bpc. =20
>=20
> Same for these as well, userspace can just ignore these if no usage. Howe=
ver, for some clients
> it may help in Lut computations.
> The original idea for the structure came from Ville (missed to mention th=
at in cover letter, will get that
> updated in next version).
>=20
> @ville.syrjala@linux.intel.com Please share your inputs on the usability =
of these attributes.

Userspace will always need to evaluate whether each segment is good
enough individually, so maybe it's not that big deal.

Ignoring these is not an option for userspace, because that would mean
userspace does not know what it is getting. If UAPI contains a
parameter, then the onus is on userspace to ensure the value is
acceptable.

> > > +		.start =3D 0, .end =3D (1 << 24) - 1,
> > > +		.min =3D 0, .max =3D (1 << 24) - 1,
> > > +	},
> > > +	/* segment 2 */
> > > +	{
> > > +		.flags =3D (DRM_MODE_LUT_REFLECT_NEGATIVE |
> > > +				DRM_MODE_LUT_INTERPOLATE |
> > > +				DRM_MODE_LUT_REUSE_LAST |
> > > +				DRM_MODE_LUT_NON_DECREASING),
> > > +		.count =3D 1,
> > > +		.input_bpc =3D 24, .output_bpc =3D 16,
> > > +		.start =3D (1 << 24) - 1, .end =3D 1 << 24, =20
> >=20
> > What if there is a gap or overlap between the previous segment .end and=
 the next
> > segment .start? Is it forbidden? Will the kernel common code verify tha=
t drivers
> > don't make mistakes? Or IGT? =20
>=20
> This is just to help give some reference to userspace.  As of now, driver=
 trusts the values
> coming from userspace if it sends wrong values its on him and driver can'=
t help much.
> However, we surely can have some sanity check like non decreasing luts et=
c. to driver.

But what will guarantee that the driver provided values are consistent?
That they actually describe a template of a well-formed sampled
curve? If they are not consistent, userspace cannot use the colorop.
Whose responsibility is it to ensure the consistency?

We have a few examples of drivers getting descriptive values like
these simply wrong until DRM common code started sanity-checking them,
the bitmasks of possible_clones and possible_crtcs for example.

There should also be DRM common code to verify that userspace provided
data matches the segmented LUT description rather than drivers just
trusting it. If it doesn't match, the atomic commit must fail rather
than silently malfunction. The same with programming hardware: if
hardware does not produce the intended result from a given segmented
LUT configuration, the atomic commit must fail instead of malfunction.

>=20
> Ideally LUT values should not overlap, but we can indicate this explicitl=
y with flag to
> hint the userspace (for overlap or otherwise) and also get a check in dri=
ver for the same.

Sorry? How could overlapping segments ever work? Or segments with a gap
between them?

If segments overlap, what's the rule for choosing which segment to use
for an input value hitting both? The segments can disagree on the
result.

If there are gaps, what is the rule how to handle an input value
hitting a gap?


Thanks,
pq

>=20
> Regards,
> Uma Shankar
>=20
> >=20
> > Thanks,
> > pq
> >  =20
> > > +		.min =3D 0, .max =3D (1 << 27) - 1,
> > > +	},
> > > +	/* Segment 3 */
> > > +	{
> > > +		.flags =3D (DRM_MODE_LUT_REFLECT_NEGATIVE |
> > > +				DRM_MODE_LUT_INTERPOLATE |
> > > +				DRM_MODE_LUT_REUSE_LAST |
> > > +				DRM_MODE_LUT_NON_DECREASING),
> > > +		.count =3D 1,
> > > +		.input_bpc =3D 24, .output_bpc =3D 16,
> > > +		.start =3D 1 << 24, .end =3D 3 << 24,
> > > +		.min =3D 0, .max =3D (1 << 27) - 1,
> > > +	},
> > > +	/* Segment 4 */
> > > +	{
> > > +		.flags =3D (DRM_MODE_LUT_REFLECT_NEGATIVE |
> > > +				DRM_MODE_LUT_INTERPOLATE |
> > > +				DRM_MODE_LUT_REUSE_LAST |
> > > +				DRM_MODE_LUT_NON_DECREASING),
> > > +		.count =3D 1,
> > > +		.input_bpc =3D 24, .output_bpc =3D 16,
> > > +		.start =3D 3 << 24, .end =3D 7 << 24,
> > > +		.min =3D 0, .max =3D (1 << 27) - 1,
> > > +	}
> > > +};
> > > +
> > > +/* FIXME input bpc? */
> > > +static const struct drm_color_lut_range xelpd_gamma_hdr[] =3D {
> > > +	/*
> > > +	 * ToDo: Add Segment 1
> > > +	 * There is an optional fine segment added with 9 lut values
> > > +	 * Will be added later
> > > +	 */
> > > +
> > > +	/* segment 2 */
> > > +	{
> > > +		.flags =3D (DRM_MODE_LUT_REFLECT_NEGATIVE |
> > > +				DRM_MODE_LUT_INTERPOLATE |
> > > +				DRM_MODE_LUT_NON_DECREASING),
> > > +		.count =3D 32,
> > > +		.input_bpc =3D 24, .output_bpc =3D 16,
> > > +		.start =3D 0, .end =3D (1 << 24) - 1,
> > > +		.min =3D 0, .max =3D (1 << 24) - 1,
> > > +	},
> > > +	/* segment 3 */
> > > +	{
> > > +		.flags =3D (DRM_MODE_LUT_REFLECT_NEGATIVE |
> > > +				DRM_MODE_LUT_INTERPOLATE |
> > > +				DRM_MODE_LUT_REUSE_LAST |
> > > +				DRM_MODE_LUT_NON_DECREASING),
> > > +		.count =3D 1,
> > > +		.input_bpc =3D 24, .output_bpc =3D 16,
> > > +		.start =3D (1 << 24) - 1, .end =3D 1 << 24,
> > > +		.min =3D 0, .max =3D 1 << 24,
> > > +	},
> > > +	/* Segment 4 */
> > > +	{
> > > +		.flags =3D (DRM_MODE_LUT_REFLECT_NEGATIVE |
> > > +				DRM_MODE_LUT_INTERPOLATE |
> > > +				DRM_MODE_LUT_REUSE_LAST |
> > > +				DRM_MODE_LUT_NON_DECREASING),
> > > +		.count =3D 1,
> > > +		.input_bpc =3D 24, .output_bpc =3D 16,
> > > +		.start =3D 1 << 24, .end =3D 3 << 24,
> > > +		.min =3D 0, .max =3D (3 << 24),
> > > +	},
> > > +	/* Segment 5 */
> > > +	{
> > > +		.flags =3D (DRM_MODE_LUT_REFLECT_NEGATIVE |
> > > +				DRM_MODE_LUT_INTERPOLATE |
> > > +				DRM_MODE_LUT_REUSE_LAST |
> > > +				DRM_MODE_LUT_NON_DECREASING),
> > > +		.count =3D 1,
> > > +		.input_bpc =3D 24, .output_bpc =3D 16,
> > > +		.start =3D 3 << 24, .end =3D 7 << 24,
> > > +		.min =3D 0, .max =3D (7 << 24),
> > > +	},
> > > +};
> > > +
> > >  /* TODO: Move to another file */
> > >  struct intel_plane_colorop *intel_colorop_alloc(void)  { @@ -3865,6
> > > +3964,11 @@ int intel_plane_tf_pipeline_init(struct drm_plane *plane,=
 struct =20
> > drm_prop_enum_l =20
> > >  	if (ret)
> > >  		return ret;
> > >
> > > +	if (icl_is_hdr_plane(i915, to_intel_plane(plane)->id)) {
> > > +		drm_colorop_lutcaps_init(&colorop->base, plane, =20
> > xelpd_degamma_hdr, =20
> > > +					 sizeof(xelpd_degamma_hdr));
> > > +	}
> > > +
> > >  	list->type =3D colorop->base.base.id;
> > >  	list->name =3D kasprintf(GFP_KERNEL, "Color Pipeline %d",
> > > colorop->base.base.id);
> > >
> > > @@ -3886,6 +3990,11 @@ int intel_plane_tf_pipeline_init(struct drm_pl=
ane =20
> > *plane, struct drm_prop_enum_l =20
> > >  	if (ret)
> > >  		return ret;
> > >
> > > +	if (icl_is_hdr_plane(i915, to_intel_plane(plane)->id)) {
> > > +		drm_colorop_lutcaps_init(&colorop->base, plane, =20
> > xelpd_gamma_hdr, =20
> > > +					 sizeof(xelpd_gamma_hdr));
> > > +	}
> > > +
> > >  	drm_colorop_set_next_property(prev_op, &colorop->base);
> > >
> > >  	return 0; =20
>=20


--Sig_/2o/cM10kVjboRV1FW3+7Xxc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXMgewACgkQI1/ltBGq
qqctmhAAjI3rllMznnsJGPJM+ujBYUjr4K13jbD1mlIEalAPRZIHWl3mLeenjpUv
WIdDwZSp7jqb5sMFiCthXA8uejBc6ZlwAEAVpL4Bd14uajsRvvixY7MedlGbsHeG
cgWFVPKtEdlR5gVHZnQ5LUmJQYhLPnBjky4mtKTIheWgABXYeHJJb/C96y+pGtzH
YndJFs9/dwdn7JU3H3LPameiXTQN3G711L2dxvZihzyHMi45vcXW+nIK6gGK4Tva
N68Zpy+mtNnbu8owwKiRoAwyA+SogNQSKstza/v4RhkuttEWEoWT8lxubFXwrqDx
ebz8T7XyA2SpFvf/893DuQ5aYl/yLc64A22EZDieCNW5E1llswxwGlwQBFFoU6+l
4AA6JxLljxksP/qeqKG+T1PNh6zfIsaJKEKENcGwblOVT1aFA4KcwnCeVJQp6jLX
bNqnaTBYN2MBGCKcoA4xeLRFpCJR6IouW3PZTKQX7dDLxR3jHikJUP/mtBA3dZTs
sJgI7lvjHv9p6QYlNgQaRNNzs6Ath0d1Cpwxk9j0qsEWmUw24QycnGDUPz/y1Nve
Vx0xLI6ksyIYpb8dPQV6WBE4TWanm6xiAFM+Iz8l0LtEPp92z3o3/vKefADAcAvI
OK+bbT7I9VLdwQsD+kXXm7YfoHrAXczu15SK+2f3Cl2VmLeRh7w=
=aF3V
-----END PGP SIGNATURE-----

--Sig_/2o/cM10kVjboRV1FW3+7Xxc--
