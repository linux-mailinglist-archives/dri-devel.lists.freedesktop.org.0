Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9E144DC96
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 21:42:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B3E76E176;
	Thu, 11 Nov 2021 20:42:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86F5A6E0E7;
 Thu, 11 Nov 2021 20:42:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10165"; a="219900873"
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; d="scan'208";a="219900873"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2021 12:42:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; d="scan'208";a="590127001"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga002.fm.intel.com with ESMTP; 11 Nov 2021 12:42:32 -0800
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 11 Nov 2021 12:42:31 -0800
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX604.gar.corp.intel.com (10.67.234.6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 12 Nov 2021 02:12:29 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.2242.012;
 Fri, 12 Nov 2021 02:12:29 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, "Harry
 Wentland" <harry.wentland@amd.com>
Subject: RE: [RFC v2 05/22] drm/i915/xelpd: Define Degamma Lut range struct
 for HDR planes
Thread-Topic: [RFC v2 05/22] drm/i915/xelpd: Define Degamma Lut range struct
 for HDR planes
Thread-Index: AQHXo2JRAHlJ3agYdUaywR8buXbaL6v+e3SAgAAX2oCAAJuYgA==
Date: Thu, 11 Nov 2021 20:42:29 +0000
Message-ID: <edc4b80279354ec7bcdb0a890dae7d79@intel.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
 <20210906213904.27918-6-uma.shankar@intel.com>
 <52ce874c-64ae-d7a9-bc4e-255cfa49f410@amd.com> <YY1H//+XISVMFZNL@intel.com>
In-Reply-To: <YY1H//+XISVMFZNL@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.200.16
x-originating-ip: [10.223.10.1]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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



> -----Original Message-----
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Sent: Thursday, November 11, 2021 10:13 PM
> To: Harry Wentland <harry.wentland@amd.com>
> Cc: Shankar, Uma <uma.shankar@intel.com>; intel-gfx@lists.freedesktop.org=
; dri-
> devel@lists.freedesktop.org; ppaalanen@gmail.com; brian.starkey@arm.com;
> sebastian@sebastianwick.net; Shashank.Sharma@amd.com
> Subject: Re: [RFC v2 05/22] drm/i915/xelpd: Define Degamma Lut range stru=
ct for
> HDR planes
>=20
> On Thu, Nov 11, 2021 at 10:17:17AM -0500, Harry Wentland wrote:
> >
> >
> > On 2021-09-06 17:38, Uma Shankar wrote:
> > > Define the structure with XE_LPD degamma lut ranges. HDR and SDR
> > > planes have different capabilities, implemented respective structure
> > > for the HDR planes.
> > >
> > > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/display/intel_color.c | 52
> > > ++++++++++++++++++++++
> > >  1 file changed, 52 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/i915/display/intel_color.c
> > > b/drivers/gpu/drm/i915/display/intel_color.c
> > > index afcb4bf3826c..6403bd74324b 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_color.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_color.c
> > > @@ -2092,6 +2092,58 @@ static void icl_read_luts(struct intel_crtc_st=
ate
> *crtc_state)
> > >  	}
> > >  }
> > >
> > > + /* FIXME input bpc? */
> > > +__maybe_unused
> > > +static const struct drm_color_lut_range d13_degamma_hdr[] =3D {
> > > +	/* segment 1 */
> > > +	{
> > > +		.flags =3D (DRM_MODE_LUT_GAMMA |
> > > +			  DRM_MODE_LUT_REFLECT_NEGATIVE |
> > > +			  DRM_MODE_LUT_INTERPOLATE |
> > > +			  DRM_MODE_LUT_NON_DECREASING),
> > > +		.count =3D 128,
> > > +		.input_bpc =3D 24, .output_bpc =3D 16,
> > > +		.start =3D 0, .end =3D (1 << 24) - 1,
> > > +		.min =3D 0, .max =3D (1 << 24) - 1,
> > > +	},
> > > +	/* segment 2 */
> > > +	{
> > > +		.flags =3D (DRM_MODE_LUT_GAMMA |
> > > +			  DRM_MODE_LUT_REFLECT_NEGATIVE |
> > > +			  DRM_MODE_LUT_INTERPOLATE |
> > > +			  DRM_MODE_LUT_REUSE_LAST |
> > > +			  DRM_MODE_LUT_NON_DECREASING),
> > > +		.count =3D 1,
> > > +		.input_bpc =3D 24, .output_bpc =3D 16,
> > > +		.start =3D (1 << 24) - 1, .end =3D 1 << 24,
> > > +		.min =3D 0, .max =3D (1 << 27) - 1,
> > > +	},
> > > +	/* Segment 3 */
> > > +	{
> > > +		.flags =3D (DRM_MODE_LUT_GAMMA |
> > > +			  DRM_MODE_LUT_REFLECT_NEGATIVE |
> > > +			  DRM_MODE_LUT_INTERPOLATE |
> > > +			  DRM_MODE_LUT_REUSE_LAST |
> > > +			  DRM_MODE_LUT_NON_DECREASING),
> > > +		.count =3D 1,
> > > +		.input_bpc =3D 24, .output_bpc =3D 16,
> > > +		.start =3D 1 << 24, .end =3D 3 << 24,
> > > +		.min =3D 0, .max =3D (1 << 27) - 1,
> > > +	},
> > > +	/* Segment 4 */
> > > +	{
> > > +		.flags =3D (DRM_MODE_LUT_GAMMA |
> > > +			  DRM_MODE_LUT_REFLECT_NEGATIVE |
> > > +			  DRM_MODE_LUT_INTERPOLATE |
> > > +			  DRM_MODE_LUT_REUSE_LAST |
> > > +			  DRM_MODE_LUT_NON_DECREASING),
> > > +		.count =3D 1,
> > > +		.input_bpc =3D 24, .output_bpc =3D 16,
> > > +		.start =3D 3 << 24, .end =3D 7 << 24,
> > > +		.min =3D 0, .max =3D (1 << 27) - 1,
> > > +	},
> > > +};
> >
> > If I understand this right, userspace would need this definition in
> > order to populate the degamma blob. Should this sit in a UAPI header?

Hi Harry, Pekka and Ville,
Sorry for being a bit late on the replies, got side tracked with various is=
sues.
I am back on this. Apologies for delay.

> My original idea (not sure it's fully realized in this series) is to have=
 a new
> GAMMA_MODE/etc. enum property on each crtc (or plane) for which each enum
> value points to a kernel provided blob that contains one of these LUT des=
criptors.
> Userspace can then query them dynamically and pick the best one for its c=
urrent use
> case.

We have this as part of the series Ville. Patch 3 of this series creates a =
DEGAMMA_MODE
property just for this. With that userspace can just query the blob_id's an=
d will get the
various degamma mode possible and the respective segment and lut distributi=
ons.

This will be generic, so for userspace it should just be able to query this=
 and parse and get
the lut distribution and segment ranges.

> The algorithm for choosing the best one might be something like:
> - prefer LUT with bpc >=3D FB bpc, but perhaps not needlessly high bpc
> - prefer interpolated vs. direct lookup based on current needs (eg. X
>   could prefer direct lookup to get directcolor visuals).
> - prefer one with extended range values if needed
> - for HDR prefer smaller step size in dark tones,
>   for SDR perhaps prefer a more uniform step size
>=20
> Or maybe we should include some kind of usage hints as well?

I think the segment range and distribution of lut should be enough for a us=
erspace
to pick the right ones, but we can add some examples in UAPI descriptions a=
s hints.

> And I was thinking of even adding a new property type (eg.
> ENUM_BLOB) just for this sort of usecase. That could let us have a bit mo=
re generic
> code to do all the validation around the property values and whatnot.
>=20
> The one nagging concern I really have with GAMMA_MODE is how a mix of old=
 and
> new userspace would work. Though that is more of a generic issue with any=
 new
> property really.

For plane properties getting added newly, old userspace will not get it so =
I think this should be ok.
Newer userspace will implement this and get the new functionality.
Problem will be in extending this to crtc where we have a legacy baggage, t=
he client caps approach
may help us there. Have it as part of separate series just to not mix it wi=
th this new plane stuff, though
the idea remains same based on your design. Series below for reference:
https://patchwork.freedesktop.org/series/90821/

Regards,
Uma Shankar

> --
> Ville Syrj=E4l=E4
> Intel
