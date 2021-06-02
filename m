Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B16DC399483
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 22:27:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F9166EE67;
	Wed,  2 Jun 2021 20:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F8206EE62;
 Wed,  2 Jun 2021 20:27:00 +0000 (UTC)
IronPort-SDR: 4uf3KnO790y3doGSZVMODxoGke/VKupf2Bi92NDWpCDkkRNa/GlrW98uJvLWUFMOuiOXP5Fp7M
 1FNLo/o9H63w==
X-IronPort-AV: E=McAfee;i="6200,9189,10003"; a="200874429"
X-IronPort-AV: E=Sophos;i="5.83,242,1616482800"; d="scan'208";a="200874429"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 13:26:57 -0700
IronPort-SDR: 2Ja3vKRnDdUcxldPu4ViM+5edwnfX0wuJ7ji70ap8SIXm7U2FtHfp0HFpdEQUhYs4iqsmGF9SJ
 4IUJFGU5F+5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,242,1616482800"; d="scan'208";a="411751915"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga007.fm.intel.com with ESMTP; 02 Jun 2021 13:26:57 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 2 Jun 2021 13:26:56 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX604.gar.corp.intel.com (10.67.234.6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 3 Jun 2021 01:56:53 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.2242.008;
 Thu, 3 Jun 2021 01:56:53 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: RE: [PATCH 01/21] drm: Add Enhanced Gamma and color lut range
 attributes
Thread-Topic: [PATCH 01/21] drm: Add Enhanced Gamma and color lut range
 attributes
Thread-Index: AQHXVs8hSnwv/9woJ0GcfBgiln/9M6sAGuaAgAERibA=
Date: Wed, 2 Jun 2021 20:26:53 +0000
Message-ID: <2015b90626a04860808eb02fa5f8a117@intel.com>
References: <20210601105218.29185-1-uma.shankar@intel.com>
 <20210601105218.29185-2-uma.shankar@intel.com>
 <20210602123335.29045e06@eldfell>
In-Reply-To: <20210602123335.29045e06@eldfell>
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
> Sent: Wednesday, June 2, 2021 3:04 PM
> To: Shankar, Uma <uma.shankar@intel.com>
> Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Mod=
em,
> Bhanuprakash <bhanuprakash.modem@intel.com>
> Subject: Re: [PATCH 01/21] drm: Add Enhanced Gamma and color lut range
> attributes
>=20
> On Tue,  1 Jun 2021 16:21:58 +0530
> Uma Shankar <uma.shankar@intel.com> wrote:
>=20
> > Existing LUT precision structure is having only 16 bit precision. This
> > is not enough for upcoming enhanced hardwares and advance usecases
> > like HDR processing. Hence added a new structure with 32 bit precision
> > values.
> >
> > This also defines a new structure to define color lut ranges, along
> > with related macro definitions and enums. This will help describe
> > multi segmented lut ranges in the hardware.
> >
> > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > ---
> >  include/uapi/drm/drm_mode.h | 58
> > +++++++++++++++++++++++++++++++++++++
> >  1 file changed, 58 insertions(+)
> >
> > diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> > index 9b6722d45f36..d0ce48d2e732 100644
> > --- a/include/uapi/drm/drm_mode.h
> > +++ b/include/uapi/drm/drm_mode.h
> > @@ -819,6 +819,64 @@ struct hdr_output_metadata {
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
>=20
> Unprefixed type name in UAPI headers is probably not a good idea.

Ok, will rename these.

> > +	LUT_TYPE_DEGAMMA =3D 0,
> > +	LUT_TYPE_GAMMA =3D 1,
> > +};
>=20
> All the above stuff seems to be the same in your other patch series'
> patch "[PATCH 1/9] drm: Add gamma mode property". Is this series replacin=
g the
> series "[PATCH 0/9] Enhance pipe color support for multi segmented luts" =
or what
> does this mean?

The concept and idea is similar and the range definition is also common. Bu=
t this series
focuses on plane color management while the other one is for pipe/crtc colo=
r features.
Hence separated and floated them as unique series for review.

Regards,
Uma Shankar
>=20
> Thanks,
> pq
>=20
> > +
> > +/*
> > + * Creating 64 bit palette entries for better data
> > + * precision. This will be required for HDR and
> > + * similar color processing usecases.
> > + */
> > +struct drm_color_lut_ext {
> > +	/*
> > +	 * Data is U32.32 fixed point format.
> > +	 */
> > +	__u64 red;
> > +	__u64 green;
> > +	__u64 blue;
> > +	__u64 reserved;
> > +};
> > +
> >  #define DRM_MODE_PAGE_FLIP_EVENT 0x01  #define
> > DRM_MODE_PAGE_FLIP_ASYNC 0x02  #define
> > DRM_MODE_PAGE_FLIP_TARGET_ABSOLUTE 0x4

