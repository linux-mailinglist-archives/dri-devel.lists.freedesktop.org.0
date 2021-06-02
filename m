Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A2F39946E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 22:18:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B32356E560;
	Wed,  2 Jun 2021 20:18:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 986606E0BC;
 Wed,  2 Jun 2021 20:18:23 +0000 (UTC)
IronPort-SDR: EWWeK1S5eohPKGrT/s0vgwtaWz+zSSEvurEIE8EG8O/LsovjQDkmqPqjGal7MxwjhKbJJZpVzB
 eREs5ayCGiQw==
X-IronPort-AV: E=McAfee;i="6200,9189,10003"; a="184254782"
X-IronPort-AV: E=Sophos;i="5.83,242,1616482800"; d="scan'208";a="184254782"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 13:18:23 -0700
IronPort-SDR: okeZrkX4hjj594c4pI0cjL4oR+n+1zhx82+H4U8aPBnhdjm0hLlmdTjz57TCD7CgiUBJC/U9GN
 xfWCXPM1AipQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,242,1616482800"; d="scan'208";a="467598067"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga004.fm.intel.com with ESMTP; 02 Jun 2021 13:18:22 -0700
Received: from bgsmsx606.gar.corp.intel.com (10.67.234.8) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 2 Jun 2021 13:18:21 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX606.gar.corp.intel.com (10.67.234.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 3 Jun 2021 01:48:19 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.2242.008;
 Thu, 3 Jun 2021 01:48:19 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: RE: [PATCH 1/9] drm: Add gamma mode property
Thread-Topic: [PATCH 1/9] drm: Add gamma mode property
Thread-Index: AQHXVs2xP7kkkP+9QkG4ZOdTKxo47qsAFE6AgAEUTUA=
Date: Wed, 2 Jun 2021 20:18:19 +0000
Message-ID: <33e9b79a413346309519f2a2499de367@intel.com>
References: <20210601104135.29020-1-uma.shankar@intel.com>
 <20210601104135.29020-2-uma.shankar@intel.com>
 <20210602120957.7a154640@eldfell>
In-Reply-To: <20210602120957.7a154640@eldfell>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.223.10.1]
Content-Type: text/plain; charset="us-ascii"
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Modem, 
 Bhanuprakash" <bhanuprakash.modem@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Pekka Paalanen <ppaalanen@gmail.com>
> Sent: Wednesday, June 2, 2021 2:40 PM
> To: Shankar, Uma <uma.shankar@intel.com>
> Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Mod=
em,
> Bhanuprakash <bhanuprakash.modem@intel.com>
> Subject: Re: [PATCH 1/9] drm: Add gamma mode property
>=20
> On Tue,  1 Jun 2021 16:11:27 +0530
> Uma Shankar <uma.shankar@intel.com> wrote:
>=20
> > Add a gamma mode property to enable various kind of gamma modes
> > supported by platforms like: Interpolated, Split, Multi Segmented,
> > Logarithmic etc. Userspace can get this property and should be able to
> > get the platform capabilities wrt various gamma modes possible and the
> > possible ranges.
> >
> > It can select one of the modes exposed as blob_id as an enum and set
> > the respective mode.
> >
> > It can then create the LUT and send it to driver using already
> > available GAMMA_LUT property as blob.
> >
> > Note: This is based on design by Ville and is being carried forward
> > based on his original idea.
> >
> > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > ---
> >  drivers/gpu/drm/drm_atomic_uapi.c |  5 +++
> > drivers/gpu/drm/drm_color_mgmt.c  | 75 +++++++++++++++++++++++++++++++
> >  include/drm/drm_color_mgmt.h      |  8 ++++
> >  include/drm/drm_crtc.h            | 14 ++++++
> >  include/uapi/drm/drm_mode.h       | 43 ++++++++++++++++++
> >  5 files changed, 145 insertions(+)
> >
>=20
> ...
>=20
> > diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h index
> > 13eeba2a750a..b1eead03ebe8 100644
> > --- a/include/drm/drm_crtc.h
> > +++ b/include/drm/drm_crtc.h
> > @@ -262,6 +262,13 @@ struct drm_crtc_state {
> >  	 */
> >  	struct drm_property_blob *mode_blob;
> >
> > +	/**
> > +	 * @gamma_mode: This is a blob_id and exposes the platform capabiliti=
es
> > +	 * wrt to various gamma modes and the respective lut ranges. This als=
o
> > +	 * helps user select a gamma mode amongst the supported ones.
> > +	 */
> > +	u32 gamma_mode;
> > +
> >  	/**
> >  	 * @degamma_lut:
> >  	 *
> > @@ -1096,6 +1103,13 @@ struct drm_crtc {
> >  	 */
> >  	struct drm_property *scaling_filter_property;
> >
> > +	/**
> > +	 * @gamma_mode_property: Optional CRTC property to enumerate and
> > +	 * select the mode of the crtc gamma/degmama LUTs. This also exposes
> > +	 * the lut ranges of the various supported gamma modes to userspace.
> > +	 */
> > +	struct drm_property *gamma_mode_property;
> > +
> >  	/**
> >  	 * @state:
> >  	 *
> > diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> > index 9b6722d45f36..d7758d351936 100644
> > --- a/include/uapi/drm/drm_mode.h
> > +++ b/include/uapi/drm/drm_mode.h
> > @@ -819,6 +819,49 @@ struct hdr_output_metadata {
> >  	};
> >  };
> >
> > +/*
> > + * DRM_MODE_LUT_GAMMA|DRM_MODE_LUT_DEGAMMA is legal and means
> the LUT
> > + * can be used for either purpose, but not simultaneously. To expose
> > + * modes that support gamma and degamma simultaneously the gamma mode
> > + * must declare distinct DRM_MODE_LUT_GAMMA and
> DRM_MODE_LUT_DEGAMMA
> > + * ranges.
> > + */
> > +/* LUT is for gamma (after CTM) */
> > +#define DRM_MODE_LUT_GAMMA BIT(0)
> > +/* LUT is for degamma (before CTM) */ #define DRM_MODE_LUT_DEGAMMA
> > +BIT(1)
> > +/* linearly interpolate between the points */ #define
> > +DRM_MODE_LUT_INTERPOLATE BIT(2)
> > +/*
> > + * the last value of the previous range is the
> > + * first value of the current range.
> > + */
> > +#define DRM_MODE_LUT_REUSE_LAST BIT(3)
> > +/* the curve must be non-decreasing */ #define
> > +DRM_MODE_LUT_NON_DECREASING BIT(4)
> > +/* the curve is reflected across origin for negative inputs */
> > +#define DRM_MODE_LUT_REFLECT_NEGATIVE BIT(5)
> > +/* the same curve (red) is used for blue and green channels as well
> > +*/ #define DRM_MODE_LUT_SINGLE_CHANNEL BIT(6)
> > +
> > +struct drm_color_lut_range {
> > +	/* DRM_MODE_LUT_* */
> > +	__u32 flags;
> > +	/* number of points on the curve */
> > +	__u16 count;
> > +	/* input/output bits per component */
> > +	__u8 input_bpc, output_bpc;
> > +	/* input start/end values */
> > +	__s32 start, end;
> > +	/* output min/max values */
> > +	__s32 min, max;
> > +};
> > +
> > +enum lut_type {
> > +	LUT_TYPE_DEGAMMA =3D 0,
> > +	LUT_TYPE_GAMMA =3D 1,
> > +};
> > +
> >  #define DRM_MODE_PAGE_FLIP_EVENT 0x01  #define
> > DRM_MODE_PAGE_FLIP_ASYNC 0x02  #define
> > DRM_MODE_PAGE_FLIP_TARGET_ABSOLUTE 0x4
>=20
> Hi,
>=20
> where is the UAPI documentation for this new GAMMA_MODE?
> As a userspace dev, I have no idea what to do with the above based on wha=
t's
> written here.

Got that, I will add more details on the UAPI usage to make things a bit cl=
earer.

> Also, reading the description of DRM_CLIENT_CAP_ADVANCE_GAMMA_MODES in
> patch 5/9, what difference does it make whether userspace sets or does no=
t set that
> cap? I don't understand the implications from the description.

The reason we have this Client caps is to have it co-exist with legacy crtc=
 color properties.
The idea is that driver will describe the h/w luts to userspace through GAM=
MA_MODE UAPI,
but the actual lut samples will still be sent through the legacy GAMMA_LUT =
UAPI. This client
cap will help distinguish between legacy and this new implementation.

I will add more details in the UAPI description to avoid ambiguity and expl=
ain the rationale and
usage of this UAPI.

Thanks Pekka for the looking into the series and the initial feedback.

Regards,
Uma Shankar

>=20
> Thanks,
> pq
