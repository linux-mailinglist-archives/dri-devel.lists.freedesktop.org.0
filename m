Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA5A4E5C00
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 00:42:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 327CF10E1E9;
	Wed, 23 Mar 2022 23:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD72B10E1E9;
 Wed, 23 Mar 2022 23:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648078957; x=1679614957;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1ZvH3O7jlYsV/OWsE1AUStHyTXVc2NZKMGEJlxZ8Ggg=;
 b=W1khKYJM363k3wWOhSJLEjI87lTJiV7utJlffhp+5XjRJVB0s/YklpyY
 ojborq7PDvzEpmppiROwzQhf9BTPo0pF5ON4+ATNLx7Kmd2KVW3ypLV5o
 D/HZLrZc6JrJ3Dnc6JDr/JWNk1JVtWFS72zDEkY61jr2KGwvfD81p2ZNO
 +T1FrtfTKI7CIsigH7z2jvSjUPiTM6aeW7gNGQSJ9VkhZfJNOb2G0to9l
 gcwUGS7w1KL8HxigEGuARUryqAXRkWI6CnmFVxNJyB11TKo1OEKldwM9R
 8PAz74LVtC5yVODpVEdbz1nS1BNw5xIDh7c5GqXqHfkcW7v39aWsbrPo1 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="238192148"
X-IronPort-AV: E=Sophos;i="5.90,205,1643702400"; d="scan'208";a="238192148"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 16:42:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,205,1643702400"; d="scan'208";a="583881931"
Received: from irsmsx602.ger.corp.intel.com ([163.33.146.8])
 by orsmga001.jf.intel.com with ESMTP; 23 Mar 2022 16:42:36 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 irsmsx602.ger.corp.intel.com (163.33.146.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 23 Mar 2022 23:42:34 +0000
Received: from fmsmsx611.amr.corp.intel.com ([10.18.126.91]) by
 fmsmsx611.amr.corp.intel.com ([10.18.126.91]) with mapi id 15.01.2308.021;
 Wed, 23 Mar 2022 16:42:33 -0700
From: "Chery, Nanley G" <nanley.g.chery@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>
Subject: RE: [Intel-gfx] [PATCH v5 16/19] uapi/drm/dg2: Introduce format
 modifier for DG2 clear color
Thread-Topic: [Intel-gfx] [PATCH v5 16/19] uapi/drm/dg2: Introduce format
 modifier for DG2 clear color
Thread-Index: AQHYH663IhAmnebor0aDTKWpiG9p6qyVPvUA//96bNCAAJvFgP//fGmAgACZCAD//3tQwAAU3QcABp6+UIAAVluA4A==
Date: Wed, 23 Mar 2022 23:42:33 +0000
Message-ID: <24c2d65725c54df7aa90e97934f34cda@intel.com>
References: <20220201104132.3050-1-ramalingam.c@intel.com>
 <20220201104132.3050-17-ramalingam.c@intel.com>
 <CAJDL4u+hX2Dbu7q5P48t44XLSOr7vA9mf_jiC607oA1Y6+2k6Q@mail.gmail.com>
 <a95a1168-5419-0688-0700-c9e81e50727b@gmail.com>
 <dc66535e7a5d4a9dae25a9548f333385@intel.com>
 <3e514431-ab0d-a455-871d-b7c9b183a98b@gmail.com>
 <3ff28a866f494a7ebec5b09eddd894c4@intel.com>
 <07650a50-6de5-7508-5602-4eaeba9d6cbb@gmail.com>
 <0d24d1ba37644f0fbd587dda983e5e00@intel.com>
 <1c7ebd63-aef0-accf-16ce-857b8352c3ba@gmail.com>
 <20220321132009.GB5666@ideak-desk.fi.intel.com>
In-Reply-To: <20220321132009.GB5666@ideak-desk.fi.intel.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>, Nanley Chery <nanleychery@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Deak, Imre <imre.deak@intel.com>
> Sent: Monday, March 21, 2022 6:20 AM
> To: Chery, Nanley G <nanley.g.chery@intel.com>; Juha-Pekka Heikkila <juha=
pekka.heikkila@gmail.com>
> Cc: Nanley Chery <nanleychery@gmail.com>; C, Ramalingam <ramalingam.c@int=
el.com>; intel-gfx <intel-gfx@lists.freedesktop.org>;
> Auld, Matthew <matthew.auld@intel.com>; dri-devel <dri-devel@lists.freede=
sktop.org>
> Subject: Re: [Intel-gfx] [PATCH v5 16/19] uapi/drm/dg2: Introduce format =
modifier for DG2 clear color
>=20
> Hi Nanley, JP,
>=20
> On Tue, Feb 15, 2022 at 09:34:22PM +0200, Juha-Pekka Heikkila wrote:
> > [...]
> > > > > > > > > > diff --git a/include/uapi/drm/drm_fourcc.h
> > > > > > > > > > b/include/uapi/drm/drm_fourcc.h index b8fb7b44c03c..697=
614ea4b84 100644
> > > > > > > > > > --- a/include/uapi/drm/drm_fourcc.h
> > > > > > > > > > +++ b/include/uapi/drm/drm_fourcc.h
> > > > > > > > > > @@ -605,6 +605,16 @@ extern "C" {
> > > > > > > > > >       */
> > > > > > > > > >      #define I915_FORMAT_MOD_4_TILED_DG2_MC_CCS fourcc_=
mod_code(INTEL, 11)
> > > > > > > > > >
> > > > > > > > > > +/*
> > > > > > > > > > + * Intel color control surfaces (CCS) for DG2 clear co=
lor render compression.
> > > > > > > > > > + *
> > > > > > > > > > + * DG2 uses a unified compression format for clear col=
or render compression.
> > > > > > > > >
> > > > > > > > > What's unified about DG2's compression format? If this do=
esn't
> > > > > > > > > affect the layout, maybe we should drop this sentence.
>=20
> Unified here probably refers to the fact the DG2 render engine is
> capable of generating both a render and a media compressed surface as
> opposed to earlier platforms. The display engine still needs to know
> which compression format the FB uses, hence we need both an RC and MC
> modifier. Based on this I also think we can drop the mention of unified
> compression.
>=20
> > > > > > > > > > + * The general layout is a tiled layout using 4Kb tile=
s i.e. Tile4 layout.
> > > > > > > > > > + *
> > > > > > > > >
> > > > > > > > > This also needs a pitch aligned to four tiles, right? I t=
hink we
> > > > > > > > > can save some effort by referencing the DG2_RC_CCS modifi=
er here.
> > > > > > > > >
> > > > > > > > > > + * Fast clear color value expected by HW is located in=
 fb at offset 0 of plane#1
> > > > > > > > >
> > > > > > > > > Why is the expected offset hardcoded to 0 instead of rely=
ing on
> > > > > > > > > the offset provided by the modifier API? This looks like =
a bug.
> > > > > > > >
> > > > > > > > Hi Nanley,
> > > > > > > >
> > > > > > > > can you elaborate a bit, which offset from modifier API tha=
t
> > > > > > > > applies to cc surface?
> > > > > > >
> > > > > > > Hi Juha-Pekka,
> > > > > > >
> > > > > > > On the kernel-side of things, I'm thinking of drm_mode_fb_cmd=
2::offsets[1].
> > > > > >
> > > > > > Hi Nanley,
> > > > > >
> > > > > > this offset is coming from userspace on creation of framebuffer=
, at
> > > > > > that moment from userspace caller can point to offset of desire=
.
> > > > > > Normally offset[0] is set at 0 and then offset[n] at plane n st=
art
> > > > > > which is not stated to have to be exactly after plane n-1 end. =
Or did I
> > > > > > misunderstand what you meant?
> > > > >
> > > > > Perhaps, at least, I'm not sure what you're meaning to say. This
> > > > > modifier description seems to say that the drm_mode_fb_cmd2::offs=
ets
> > > > > value for the clear color plane must be zero. Are you saying that=
 it's
> > > > > correct? This doesn't match the GEN12_RC_CCS_CC behavior and does=
n't
> > > > > match mesa's expectations.
> > > >
> > > > It doesn't say "drm_mode_fb_cmd2::offsets value for the clear color=
 plane must
> > > > be zero", it says "Fast clear color value expected by HW is located=
 in fb at offset 0
> > > > of plane#1".
> > >
> > > Yes, it doesn't say that exactly, but that's what it seems to say. Wi=
th every other
> > > modifier, it's implied that the data for the plane begins at the offs=
et specified
> > > through the modifier API. So, explicitly mentioning it here (and with=
 that wording)
> > > conveys a new requirement.
> >
> > I don't have objections on changing this description but for reference =
gen12
> > version of the same says "The main surface is Y-tiled and is at plane i=
ndex
> > 0 whereas CCS is linear and at index 1. The clear color is stored at in=
dex
> > 2, and the pitch should be ignored.", only plane indexes are mentioned.=
 I
> > anyway wrote neither of these descriptions.
> >
> > > > Plane#1 location is pointed by drm_mode_fb_cmd2::offsets[1] and the=
re's
> > > > nothing stated about that offset.
> > >
> > > Technically, plane #1's location is specified to be the combination o=
f ::handles[1]
> > > and ::offsets[1]. In practice though, I can imagine that there are ar=
eas of the stack
> > > that are implicitly requiring that all ::handles[] entries match.
>=20
> The FB modifier API requires all ::handles[] to match, that is all
> planes must be contained in one GEM object.
>=20

This is a requirement for i915, or for all drm drivers? I couldn't find any=
thing in the
generic DRM headers or docs requiring this. Feel free to ping me about this=
 offline.

> > I didn't think we needed to go deeper as you started to just talk about=
 how
> > drm_mode_fb_cmd2::offsets[1] not being used. Let's not waste time.
> >
> > > > These offsets are just offsets to bo which contain the framebuffer =
information
> > > > hence drm_mode_fb_cmd2::offsets[1] can be changed as one wish and c=
c
> > > > information is found starting at drm_mode_fb_cmd2::offsets[1][0]
> > >
> > > If the clear color handling is the same as GEN12_RC_CCS_CC (apart for=
 the plane
> > > index), I propose that we drop this sentence due to avoid any confusi=
on.
> >
> > But it need to defined as part of the modifier. It's the modifier featu=
res
> > which are being described here.
> >
> > > This offset discussion raises another question. The description says =
that the value
> > > expected by HW is at offset 0. I'm assuming "HW" is referring to the =
render engine?
> > > The kernel is still giving the display engine the packed values at ::=
offsets[1] + 16B right?
> >
> > Generally answer is yes but these parts you can see in patch "[PATCH v5
> > 17/19] drm/i915/dg2: Flat CCS Support" and should be discussed there. H=
ere
> > "HW" should probably be changed something meaningful though.
>=20
> The 256 bit clear color format starting at plane index 1 matches the one
> described at I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC . So yes, "HW" refer=
s
> to the render engine and display consumes the 64 bit data at
> ::offset[1] + 16 bytes (and DE ignores the 64 bit data starting at
> ::offset[1] + 24 bytes.
>=20
> The following captures all the above, would it be ok?:
>=20
> Intel Color Control Surface with Clear Color (CCS) for DG2 render compres=
sion.
>=20
> The main surface is Tile 4 and at plane index 0. The CCS data is stored
> outside of the GEM object in a reserved memory area dedicated for the
> storage of the CCS data from all GEM objects. The main surface pitch is
                                                      ^
		                "for all compressible" ? (since SMEM objects don't have t=
his)=20

> required to be a multiple of four Tile 4 widths. The clear color is store=
d
> at plane index 1 and the pitch should be ignored. The format of the 256
> bits clear color data matches the one used for the
   ^
"256 bits of"?

> I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC modifier, see its description
> for details.
>=20

Looks good to me. With the above minor changes,
Acked-by: Nanley Chery <nanley.g.chery@intel.com>

> --Imre
