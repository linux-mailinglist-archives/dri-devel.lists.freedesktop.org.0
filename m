Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6A2191355
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 15:36:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1EF36E338;
	Tue, 24 Mar 2020 14:36:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C22B6E338;
 Tue, 24 Mar 2020 14:36:17 +0000 (UTC)
IronPort-SDR: C6OJAw/+I1LvS4vnUtmNM32yDxFor6XN1AXBq0wkK5XJd6oHbTioJE7VGStDawQD3ORUaqR3BF
 idiJD/kZ4uBw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2020 07:36:16 -0700
IronPort-SDR: tsE8973mQoTgQ2DVjTbsSqpPV3e76xfF8e13WOcjcKNgVaDvLNMPCmju09fEGsG0OBfq49L5gL
 MbZS1f8EgfkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,300,1580803200"; d="scan'208";a="325925820"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga001.jf.intel.com with ESMTP; 24 Mar 2020 07:36:16 -0700
Received: from fmsmsx111.amr.corp.intel.com (10.18.116.5) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 24 Mar 2020 07:36:15 -0700
Received: from bgsmsx109.gar.corp.intel.com (10.223.4.211) by
 fmsmsx111.amr.corp.intel.com (10.18.116.5) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 24 Mar 2020 07:36:15 -0700
Received: from BGSMSX107.gar.corp.intel.com ([169.254.9.15]) by
 BGSMSX109.gar.corp.intel.com ([169.254.10.57]) with mapi id 14.03.0439.000;
 Tue, 24 Mar 2020 20:06:11 +0530
From: "Laxminarayan Bharadiya, Pankaj"
 <pankaj.laxminarayan.bharadiya@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: RE: [PATCH v2 3/5] drm/i915: Introduce scaling filter related
 registers and bit fields.
Thread-Topic: [PATCH v2 3/5] drm/i915: Introduce scaling filter related
 registers and bit fields.
Thread-Index: AQHV/dl9GC6WTVPSaEy5zxZrsUuzDKhV6coAgAHpxOA=
Date: Tue, 24 Mar 2020 14:36:10 +0000
Message-ID: <E92BA18FDE0A5B43B7B3DA7FCA031286057CDBC4@BGSMSX107.gar.corp.intel.com>
References: <20200319102103.28895-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20200319102103.28895-4-pankaj.laxminarayan.bharadiya@intel.com>
 <20200323143924.GT13686@intel.com>
In-Reply-To: <20200323143924.GT13686@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.223.10.10]
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
Cc: "Lattannavar, Sameer" <sameer.lattannavar@intel.com>,
 "daniels@collabora.com" <daniels@collabora.com>,
 David Airlie <airlied@linux.ie>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Sent: 23 March 2020 20:09
> To: Laxminarayan Bharadiya, Pankaj
> <pankaj.laxminarayan.bharadiya@intel.com>
> Cc: Lattannavar, Sameer <sameer.lattannavar@intel.com>;
> jani.nikula@linux.intel.com; daniel@ffwll.ch; intel-gfx@lists.freedesktop=
.org;
> dri-devel@lists.freedesktop.org; daniels@collabora.com; Joonas Lahtinen
> <joonas.lahtinen@linux.intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
> David Airlie <airlied@linux.ie>
> Subject: Re: [PATCH v2 3/5] drm/i915: Introduce scaling filter related re=
gisters
> and bit fields.
> =

> On Thu, Mar 19, 2020 at 03:51:01PM +0530, Pankaj Bharadiya wrote:
> > Introduce scaler registers and bit fields needed to configure the
> > scaling filter in prgrammed mode and configure scaling filter
> > coefficients.
> >
> > changes since v1:
> > * None
> > changes since RFC:
> > * Parametrize scaler coeffient macros by 'set' (Ville)
> >
> > Signed-off-by: Shashank Sharma <shashank.sharma@intel.com>
> > Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> > Signed-off-by: Pankaj Bharadiya
> > <pankaj.laxminarayan.bharadiya@intel.com>
> > ---
> >  drivers/gpu/drm/i915/i915_reg.h | 48
> > +++++++++++++++++++++++++++++++++
> >  1 file changed, 48 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/i915_reg.h
> > b/drivers/gpu/drm/i915/i915_reg.h index 9c53fe918be6..d40f12d2a6b5
> > 100644
> > --- a/drivers/gpu/drm/i915/i915_reg.h
> > +++ b/drivers/gpu/drm/i915/i915_reg.h
> > @@ -7205,6 +7205,7 @@ enum {
> >  #define PS_PLANE_SEL(plane) (((plane) + 1) << 25)
> >  #define PS_FILTER_MASK         (3 << 23)
> >  #define PS_FILTER_MEDIUM       (0 << 23)
> > +#define PS_FILTER_PROGRAMMED   (1 << 23)
> >  #define PS_FILTER_EDGE_ENHANCE (2 << 23)
> >  #define PS_FILTER_BILINEAR     (3 << 23)
> >  #define PS_VERT3TAP            (1 << 21)
> > @@ -7219,6 +7220,10 @@ enum {
> >  #define PS_VADAPT_MODE_MOST_ADAPT  (3 << 5)  #define
> > PS_PLANE_Y_SEL_MASK  (7 << 5)  #define PS_PLANE_Y_SEL(plane) (((plane)
> > + 1) << 5)
> > +#define PS_Y_VERT_FILTER_SELECT(set)   ((set) << 4)
> > +#define PS_Y_HORZ_FILTER_SELECT(set)   ((set) << 3)
> > +#define PS_UV_VERT_FILTER_SELECT(set)  ((set) << 2) #define
> > +PS_UV_HORZ_FILTER_SELECT(set)  ((set) << 1)
> >
> >  #define _PS_PWR_GATE_1A     0x68160
> >  #define _PS_PWR_GATE_2A     0x68260
> > @@ -7281,6 +7286,25 @@ enum {
> >  #define _PS_ECC_STAT_2B     0x68AD0
> >  #define _PS_ECC_STAT_1C     0x691D0
> >
> > +#define _PS_COEF_SET0_INDEX_1A	   0x68198
> > +#define _PS_COEF_SET0_INDEX_2A	   0x68298
> > +#define _PS_COEF_SET0_INDEX_1B	   0x68998
> > +#define _PS_COEF_SET0_INDEX_2B	   0x68A98
> > +#define _PS_COEF_SET1_INDEX_1A	   0x681A0
> > +#define _PS_COEF_SET1_INDEX_2A	   0x682A0
> > +#define _PS_COEF_SET1_INDEX_1B	   0x689A0
> > +#define _PS_COEF_SET1_INDEX_2B	   0x68AA0
> > +#define PS_COEE_INDEX_AUTO_INC	   (1 << 10)
> > +
> > +#define _PS_COEF_SET0_DATA_1A	   0x6819C
> > +#define _PS_COEF_SET0_DATA_2A	   0x6829C
> > +#define _PS_COEF_SET0_DATA_1B	   0x6899C
> > +#define _PS_COEF_SET0_DATA_2B	   0x68A9C
> > +#define _PS_COEF_SET1_DATA_1A	   0x681A4
> > +#define _PS_COEF_SET1_DATA_2A	   0x682A4
> > +#define _PS_COEF_SET1_DATA_1B	   0x689A4
> > +#define _PS_COEF_SET1_DATA_2B	   0x68AA4
> > +
> >  #define _ID(id, a, b) _PICK_EVEN(id, a, b)
> >  #define SKL_PS_CTRL(pipe, id) _MMIO_PIPE(pipe,        \
> >  			_ID(id, _PS_1A_CTRL, _PS_2A_CTRL),       \
> > @@ -7310,6 +7334,30 @@ enum {
> >  			_ID(id, _PS_ECC_STAT_1A, _PS_ECC_STAT_2A),   \
> >  			_ID(id, _PS_ECC_STAT_1B, _PS_ECC_STAT_2B))
> >
> > +#define _SKL_PS_COEF_INDEX_SET0(pipe, id)  _ID(pipe,    \
> > +			_ID(id, _PS_COEF_SET0_INDEX_1A,
> _PS_COEF_SET0_INDEX_2A), \
> > +			_ID(id, _PS_COEF_SET0_INDEX_1B,
> _PS_COEF_SET0_INDEX_2B))
> > +
> > +#define _SKL_PS_COEF_INDEX_SET1(pipe, id)  _ID(pipe,    \
> > +			_ID(id, _PS_COEF_SET1_INDEX_1A,
> _PS_COEF_SET1_INDEX_2A), \
> > +			_ID(id, _PS_COEF_SET1_INDEX_1B,
> _PS_COEF_SET1_INDEX_2B))
> > +
> > +#define _SKL_PS_COEF_DATA_SET0(pipe, id)  _ID(pipe,     \
> > +			_ID(id, _PS_COEF_SET0_DATA_1A,
> _PS_COEF_SET0_DATA_2A), \
> > +			_ID(id, _PS_COEF_SET0_DATA_1B,
> _PS_COEF_SET0_DATA_2B))
> > +
> > +#define _SKL_PS_COEF_DATA_SET1(pipe, id)  _ID(pipe,     \
> > +			_ID(id, _PS_COEF_SET1_DATA_1A,
> _PS_COEF_SET1_DATA_2A), \
> > +			_ID(id, _PS_COEF_SET1_DATA_1B,
> _PS_COEF_SET1_DATA_2B))
> > +
> > +#define SKL_PS_COEF_INDEX_SET(pipe, id, set) \
> > +			_MMIO_PIPE(set, _SKL_PS_COEF_INDEX_SET0(pipe, id),
> \
> > +			    _SKL_PS_COEF_INDEX_SET1(pipe, id))
> > +
> > +#define SKL_PS_COEF_DATA_SET(pipe, id, set) \
> > +			_MMIO_PIPE(set, _SKL_PS_COEF_DATA_SET0(pipe, id),
> \
> > +			    _SKL_PS_COEF_DATA_SET1(pipe, id))
> =

> I'd name those CNL_PS_COEF_{DATA,INDEX}(). Or maybe eeven GLK_ since it
> already has this despite not being officially supported.

All other existing scaler macros start will  SKL_PS_*,  adding new CNL_PS_*=
 may
lead to confusion IMO since we will end up in using mixed SKL_PS_* and CNL_=
PS_* name
to configure  scaler. =


> =

> Also I'd probably just have used +(set)*8 instead of adding another trip =
through
> _PICK_EVEN(). It's getting a bit hard to read this.

OK.
How does this sound like?  -

+#define SKL_PS_COEF_INDEX_SET(pipe, id, set)  _MMIO_PIPE(pipe,    \
+                       _ID(id, _PS_COEF_SET0_INDEX_1A, _PS_COEF_SET0_INDEX=
_2A) + (set) * 8, \
+                       _ID(id, _PS_COEF_SET0_INDEX_1B, _PS_COEF_SET0_INDEX=
_2B) + (set) * 8)

+#define SKL_PS_COEF_DATA_SET(pipe, id, set)  _MMIO_PIPE(pipe,     \
+                       _ID(id, _PS_COEF_SET0_DATA_1A, _PS_COEF_SET0_DATA_2=
A) + (set) * 8, \
+                       _ID(id, _PS_COEF_SET0_DATA_1B, _PS_COEF_SET0_DATA_2=
B) + (set) * 8)

Thanks,
Pankaj
> =

> > +
> >  /* legacy palette */
> >  #define _LGC_PALETTE_A           0x4a000
> >  #define _LGC_PALETTE_B           0x4a800
> > --
> > 2.23.0
> =

> --
> Ville Syrj=E4l=E4
> Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
