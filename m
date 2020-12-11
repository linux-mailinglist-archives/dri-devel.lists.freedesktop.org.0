Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 021832D7083
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 08:04:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89E446EC5B;
	Fri, 11 Dec 2020 07:04:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E776EC5A;
 Fri, 11 Dec 2020 07:04:04 +0000 (UTC)
IronPort-SDR: B4NblOUizxeNO8wq+RFUgOMZv3OuJWW/ywMunGgpQMK4qf/WzE4jK2HohICa42fwVzlObGJQYo
 yYXkVVpFfzeA==
X-IronPort-AV: E=McAfee;i="6000,8403,9831"; a="238491736"
X-IronPort-AV: E=Sophos;i="5.78,410,1599548400"; d="scan'208";a="238491736"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2020 23:04:04 -0800
IronPort-SDR: JSD6S42YD6Xw12Vp0JmZmMGwe+JcPMuxwWfy+hGTFrXFO27tQb3fAB+4oJXY04wqwIU/Kn1tqB
 s/b0rQKPJTAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,410,1599548400"; d="scan'208";a="322002936"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga007.fm.intel.com with ESMTP; 10 Dec 2020 23:04:04 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 10 Dec 2020 23:04:03 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 10 Dec 2020 23:04:03 -0800
Received: from fmsmsx611.amr.corp.intel.com ([10.18.126.91]) by
 fmsmsx611.amr.corp.intel.com ([10.18.126.91]) with mapi id 15.01.1713.004;
 Thu, 10 Dec 2020 23:04:03 -0800
From: "Chery, Nanley G" <nanley.g.chery@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>, Chris Wilson
 <chris@chris-wilson.co.uk>, =?iso-8859-1?Q?Ville_Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>
Subject: RE: [Intel-gfx] [PATCH 1/2] drm/framebuffer: Format modifier for
 Intel Gen 12 render compression with Clear Color
Thread-Topic: [Intel-gfx] [PATCH 1/2] drm/framebuffer: Format modifier for
 Intel Gen 12 render compression with Clear Color
Thread-Index: AQHWwcYtZb75ND2biUmoOqzlC5CxF6nclmoAgAANgQCAAC6VAIAEj3BwgAFU/gCADmTBsA==
Date: Fri, 11 Dec 2020 07:04:02 +0000
Message-ID: <ac393a9d1b774766a35c299915f0cca5@intel.com>
References: <20201123182631.1740781-1-imre.deak@intel.com>
 <20201127143100.GB2144692@ideak-desk.fi.intel.com>
 <20201127151920.GI401619@phenom.ffwll.local>
 <20201127180604.GA2169344@ideak-desk.fi.intel.com>
 <0048c10f7b8047b18934e730ae57386c@intel.com>
 <20201201120456.GC2849269@ideak-desk.fi.intel.com>
In-Reply-To: <20201201120456.GC2849269@ideak-desk.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.22.254.132]
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Pandiyan,
 Dhinakaran" <dhinakaran.pandiyan@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Imre Deak <imre.deak@intel.com>
> Sent: Tuesday, December 1, 2020 4:05 AM
> To: Chery, Nanley G <nanley.g.chery@intel.com>; Chris Wilson <chris@chris-
> wilson.co.uk>; Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>; intel-gfx@lists.freedesktop.org; Nik=
ula,
> Jani <jani.nikula@intel.com>; Daniel Vetter <daniel.vetter@ffwll.ch>;
> Kondapally, Kalyan <kalyan.kondapally@intel.com>; Pandiyan, Dhinakaran
> <dhinakaran.pandiyan@intel.com>; dri-devel@lists.freedesktop.org
> Subject: Re: [Intel-gfx] [PATCH 1/2] drm/framebuffer: Format modifier for
> Intel Gen 12 render compression with Clear Color
> =

> Hi Nanley,
> =

> thanks for the review.
> =

> +Ville, Chris.
> =

> On Tue, Dec 01, 2020 at 02:18:26AM +0200, Chery, Nanley G wrote:
> > Hi Imre,
> >
> > I have a question and a couple comments:
> >
> > Is the map of the clear color address creating a new synchronization
> > point between the GPU and CPU? If so, I wonder how this will impact
> > performance.
> =

> The kmap to read the clear value is not adding any sync overhead if
> that's what you mean. But the clear value must be in place before we
> read it out and that should be guaranteed by the flush we do anyway to wa=
it
> for the render result (even considering the explicit L3/RT flush, depth
> stall the spec requires for fast clears).
> =

> However now that you mention: atm the kmap/readout happens after the
> explicit but before the implicit fence-wait. I think it should happen
> after the implicit fence-wait.
> =

> Ville, Chris, could you confirm the above and also that the above flush
> is enough to ensure the CPU read is coherent?
> =

> > There was some talk of asynchronously updating the clear color
> > register a while back.
> =

> Couldn't find anything with a quick search, do you have a pointer? Just
> before the flip we must wait for the render results anyway, as we do
> now, so not sure how it could be optimized.
> =

 =

There were some offline discussions, so I don't have a reference unfortunat=
ely.
Though, given what you shared above it seems like it's actually not an issu=
e.

> > We probably don't have to update the header, but we noticed in our
> > testing that the clear color prefers an alignment greater than 64B.
> > Unfortunately, I can't find any bspec note about this. As long as the
> > buffer creators are aware though, I think we should be fine. I don't
> > know if this is the best forum to bring it up, but I thought I'd
> > share.
> =

> Yes, would be good to clarify this and get it also to the spec. Then the
> driver should also check the alignment of the 3rd FB plane.
> =


I plan to run some more tests and file a bug in the spec.

I see that the IGT test only clears the fb once. Just to confirm, is the =

clear color offset read from on every frame? Userspace would like to be =

able to pass different clear colors for an fb. =


-Nanley

> > Seems like the upper converted clear color is untested due to the lack
> > of RGBX16 support. I suppose that if there are any issues there, they
> > can be fixed later...
> =

> Yes, a 64bpp RC-CC subtest in IGT is missing, should be easy to add
> that.
> =

> --Imre
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
