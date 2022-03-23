Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FEA4E5BFA
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 00:40:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1CE910E1E3;
	Wed, 23 Mar 2022 23:40:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA20A10E1E3;
 Wed, 23 Mar 2022 23:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648078841; x=1679614841;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fywA70Vqr2kxnHmlRzHy2xr8P2pLwM3ZwCoVtrDndZ4=;
 b=V41nGhGZ6Z4Xi9UFgyfD5h4voQhW/WY/pFg5dyMHblxpVZ2nnIZLZLqG
 mrO63dO0WDQdvn/6K7ggg2TvnhGZl8gMguIyXRO1xIjUEdNzigDcrEG0K
 fgkggCjx3iPbig2PvAqLtJHZZsocYYNv68/ZK6Ni2YxCyzcptPl5NJRHj
 eWqrML+Fa2UjHC77qf7+XJ7Tjui3Wch4qcxGIpn7EuxyvBzr5dAEOP9zJ
 nkmfEhYOMZqIB35Dfj8LYKPx+FCirq1xmYfmIfpGc6fr4G55A0yMO72hw
 DYkr1yELlQHn7hnxyrnzc1JGcObfIdXS9z4SHvuN3akWHGSkS9wCLe83U g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="240409575"
X-IronPort-AV: E=Sophos;i="5.90,205,1643702400"; d="scan'208";a="240409575"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 16:40:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,205,1643702400"; d="scan'208";a="583881629"
Received: from irsmsx602.ger.corp.intel.com ([163.33.146.8])
 by orsmga001.jf.intel.com with ESMTP; 23 Mar 2022 16:40:40 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 irsmsx602.ger.corp.intel.com (163.33.146.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 23 Mar 2022 23:40:38 +0000
Received: from fmsmsx611.amr.corp.intel.com ([10.18.126.91]) by
 fmsmsx611.amr.corp.intel.com ([10.18.126.91]) with mapi id 15.01.2308.021;
 Wed, 23 Mar 2022 16:40:37 -0700
From: "Chery, Nanley G" <nanley.g.chery@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>
Subject: RE: [Intel-gfx] [PATCH v5 15/19] drm/i915/dg2: Add DG2 unified
 compression
Thread-Topic: [Intel-gfx] [PATCH v5 15/19] drm/i915/dg2: Add DG2 unified
 compression
Thread-Index: AQHYH650V/S35d50d0uBjmgxaJpA86yVPncA//98gXCAMVlRgIAHxbRQ
Date: Wed, 23 Mar 2022 23:40:37 +0000
Message-ID: <75a48ad279d449c399693b73ee50bb97@intel.com>
References: <20220201104132.3050-1-ramalingam.c@intel.com>
 <20220201104132.3050-16-ramalingam.c@intel.com>
 <CAJDL4uKokNLKhx1Yd_gnxyqto+bcg+=efLZFLVxqp-D7aQW0oQ@mail.gmail.com>
 <326a4099-f7d9-8adf-f371-d8ab0532256e@gmail.com>
 <fd88996f283648f8b4eca3f3844d6e8d@intel.com>
 <20220318173943.GA2622954@ideak-desk.fi.intel.com>
In-Reply-To: <20220318173943.GA2622954@ideak-desk.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.401.20
x-originating-ip: [10.22.254.132]
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
Cc: Nanley Chery <nanleychery@gmail.com>,
 "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Auld,
 Matthew" <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Deak, Imre <imre.deak@intel.com>
> Sent: Friday, March 18, 2022 10:40 AM
> To: Chery, Nanley G <nanley.g.chery@intel.com>
> Cc: juhapekka.heikkila@gmail.com; Nanley Chery <nanleychery@gmail.com>; C=
, Ramalingam <ramalingam.c@intel.com>; intel-gfx <intel-
> gfx@lists.freedesktop.org>; Auld, Matthew <matthew.auld@intel.com>; dri-d=
evel <dri-devel@lists.freedesktop.org>
> Subject: Re: [Intel-gfx] [PATCH v5 15/19] drm/i915/dg2: Add DG2 unified c=
ompression
>=20
> On Thu, Feb 17, 2022 at 05:15:15PM +0000, Chery, Nanley G wrote:
> > > >> [...]
> > > >> --- a/include/uapi/drm/drm_fourcc.h
> > > >> +++ b/include/uapi/drm/drm_fourcc.h
> > > >> @@ -583,6 +583,28 @@ extern "C" {
> > > >>    */
> > > >>   #define I915_FORMAT_MOD_4_TILED         fourcc_mod_code(INTEL, 9=
)
> > > >>
> > > >> +/*
> > > >> + * Intel color control surfaces (CCS) for DG2 render compression.
> > > >> + *
> > > >> + * DG2 uses a new compression format for render compression. The =
general
> > > >> + * layout is the same as I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS,
> > > >> + * but a new hashing/compression algorithm is used, so a fresh mo=
difier must
> > > >> + * be associated with buffers of this type. Render compression us=
es 128 byte
> > > >> + * compression blocks.
> > > >
> > > > I think I've seen a way to configure the compression block size on =
TGL
> > > > at least. I can't find the spec text for that at the moment though.=
..
> > > > Could we omit these mentions?
> > >
> > > Not sure why general possibility of changing compression block size i=
s relevant?
> > > All hw features can be changed but this defines how this modifier is =
being
> > > implemented.
> >
> > I was concerned about compatibility between the different modes, but I'=
ve
> > looked into the restrictions here and don't see any problems with this.
> >
> > > Say you take I915_FORMAT_MOD_4_TILED_DG2_RC_CCS framebuffer including
> > > control surface and copy it out, then come back and restore framebuff=
er with
> > > same information. It is expected to be valid?
> >
> > > /Juha-Pekka
> > >
> > > >> + */
> > > >> +#define I915_FORMAT_MOD_4_TILED_DG2_RC_CCS fourcc_mod_code(INTEL,=
 10)
> > > >> +
> > > >
> > > > How about something like:
> > > >
> > > > The main surface is Tile 4 and at plane index 0. The CCS plane is
> > > > hidden from userspace. The main surface pitch is required to be a
> > > > multiple of four Tile 4 widths. The CCS is configured with the rend=
er
> > > > compression format associated with the main surface format.
> >
> > Actually, let's omit the last sentence. CCS has always been affected
> > by the main surface format, so I don't think there's a need to mention =
it
> > specifically for the DG2 modifier.
> >
> > We do need to mention the 4-tile-wide pitch requirement though.
>=20
> Agreed, the DG2 layout of planes and the tile format used - both
> different wrt. the GEN12_RC_CCS format - should be described here.
>=20
> > -Nanley
> >
> > > > ....I think the CCS is technically accessible via the blitter engin=
e,
> > > > so the part about the plane being "hidden" may need some tweaking.
>=20
> Maybe outside of the GEM object? Capturing all the above would you be ok
> with the following?:
>=20
> Intel color control surfaces (CCS) for DG2 render compression.
>=20
> The main surface is Tile 4 and at plane index 0. The CCS data is stored
> outside of the GEM object in a reserved memory area dedicated for the
> storage of the CCS data from all GEM objects. The main surface pitch is
> required to be a multiple of four Tile 4 widths.
>=20
>=20
> Intel color control surfaces (CCS) for DG2 media compression.
>=20
> The main surface is Tile 4 and at plane index 0. For semi-planar formats
> like NV12, the UV plane is Tile 4 at plane index 1. The CCS data both for
> the main and semi-planar UV planes are stored outside of the GEM object

This kind of implies that the Y plane is the main surface, but it's not mor=
e
"main" than the UV plane right? Seems like we should specifically call out =
the
Y plane for clarity. Maybe something like:

For semi-planar formats like NV12, the Y and UV planes are Tile 4 and are=20
located at plane indices 0 and 1, respectively. The CCS for all planes are =
stored=20
outside of the GEM object

> in a reserved memory area dedicated for the storage of the CCS data from
> all GEM objects. The main surface pitch is required to be a multiple of
> four Tile 4 widths.
>=20

Looks good to me. Main suggestion I have here is to substitute=20
"from all GEM objects" with "for all compressible GEM objects".
Happy to look at further revisions, but with that change at least,
Acked-by: Nanley Chery <nanley.g.chery@intel.com>

> > > > -Nanley
> > > >
> > > >> +/*
> > > >> + * Intel color control surfaces (CCS) for DG2 media compression.
> > > >> + *
> > > >> + * DG2 uses a new compression format for media compression. The
> > > >> +general
> > > >> + * layout is the same as I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS,
> > > >> + * but a new hashing/compression algorithm is used, so a fresh
> > > >> +modifier must
> > > >> + * be associated with buffers of this type. Media compression use=
s
> > > >> +256 byte
> > > >> + * compression blocks.
> > > >> + */
> > > >> +#define I915_FORMAT_MOD_4_TILED_DG2_MC_CCS
> > > fourcc_mod_code(INTEL,
> > > >> +11)
> > > >> +
> > > >>   /*
> > > >>    * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized mac=
roblocks
> > > >>    *
> > > >> --
> > > >> 2.20.1
> > > >>
> >
