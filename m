Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB602C93C7
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 01:18:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 560B789D9A;
	Tue,  1 Dec 2020 00:18:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9243089D8E;
 Tue,  1 Dec 2020 00:18:28 +0000 (UTC)
IronPort-SDR: NCdnfP1G9Y6bftbeJPZZX9J9RCIUE3015zC+HUGHsFfTJBrzCsj3jwirpfFzXCjRHX4ys5Sk3n
 fwS83JoB9VDQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="159788724"
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; d="scan'208";a="159788724"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 16:18:27 -0800
IronPort-SDR: C3Bi679nL2Emn87eR3qnGSPMfEkciVQyIi2iYOdR0Mpefys37EAEdy5HQjw828oNdKM3A5a1Yg
 8tWh1GNtcYxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; d="scan'208";a="315476958"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 30 Nov 2020 16:18:27 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 30 Nov 2020 16:18:27 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 30 Nov 2020 16:18:26 -0800
Received: from fmsmsx611.amr.corp.intel.com ([10.18.126.91]) by
 fmsmsx611.amr.corp.intel.com ([10.18.126.91]) with mapi id 15.01.1713.004;
 Mon, 30 Nov 2020 16:18:26 -0800
From: "Chery, Nanley G" <nanley.g.chery@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [Intel-gfx] [PATCH 1/2] drm/framebuffer: Format modifier for
 Intel Gen 12 render compression with Clear Color
Thread-Topic: [Intel-gfx] [PATCH 1/2] drm/framebuffer: Format modifier for
 Intel Gen 12 render compression with Clear Color
Thread-Index: AQHWwcYtZb75ND2biUmoOqzlC5CxF6nclmoAgAANgQCAAC6VAIAEj3Bw
Date: Tue, 1 Dec 2020 00:18:26 +0000
Message-ID: <0048c10f7b8047b18934e730ae57386c@intel.com>
References: <20201123182631.1740781-1-imre.deak@intel.com>
 <20201127143100.GB2144692@ideak-desk.fi.intel.com>
 <20201127151920.GI401619@phenom.ffwll.local>
 <20201127180604.GA2169344@ideak-desk.fi.intel.com>
In-Reply-To: <20201127180604.GA2169344@ideak-desk.fi.intel.com>
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
 Dhinakaran" <dhinakaran.pandiyan@intel.com>, "Kondapally,
 Kalyan" <kalyan.kondapally@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Imre Deak <imre.deak@intel.com>
> Sent: Friday, November 27, 2020 10:06 AM
> To: Daniel Vetter <daniel@ffwll.ch>; Chery, Nanley G
> <nanley.g.chery@intel.com>
> Cc: intel-gfx@lists.freedesktop.org; Nikula, Jani <jani.nikula@intel.com>; Daniel
> Vetter <daniel.vetter@ffwll.ch>; Rafael Antognolli
> <rafael.antognolli@intel.com>; Kondapally, Kalyan
> <kalyan.kondapally@intel.com>; Pandiyan, Dhinakaran
> <dhinakaran.pandiyan@intel.com>; dri-devel@lists.freedesktop.org
> Subject: Re: [Intel-gfx] [PATCH 1/2] drm/framebuffer: Format modifier for Intel
> Gen 12 render compression with Clear Color
> 
> On Fri, Nov 27, 2020 at 04:19:20PM +0100, Daniel Vetter wrote:
> > On Fri, Nov 27, 2020 at 04:31:00PM +0200, Imre Deak wrote:
> > > Hi Daniel, Jani,
> > >
> > > is it ok to merge this patch along with 2/2 via the i915 tree?
> >
> > Ack from mesa (userspace in general, but mesa is kinda mandatory) is
> > missing I think. With that
> > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> Thanks.
> 
> Nanley, could you ACK the patchset if they look ok from Mesa's POV? It
> works as expected at least with the igt/kms_ccs RC-CC subtest.
> 

Hi Imre,
 
I have a question and a couple comments:

Is the map of the clear color address creating a new synchronization point between the GPU and CPU? If so, I wonder how this will impact performance. There was some talk of asynchronously updating the clear color register a while back. 

We probably don't have to update the header, but we noticed in our testing that the clear color prefers an alignment greater than 64B. Unfortunately, I can't find any bspec note about this. As long as the buffer creators are aware though, I think we should be fine. I don't know if this is the best forum to bring it up, but I thought I'd share.

Seems like the upper converted clear color is untested due to the lack of RGBX16 support. I suppose that if there are any issues there, they can be fixed later...

-Nanley

> --Imre
> 
> > > On Mon, Nov 23, 2020 at 08:26:30PM +0200, Imre Deak wrote:
> > > > From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> > > >
> > > > Gen12 display can decompress surfaces compressed by render engine with
> > > > Clear Color, add a new modifier as the driver needs to know the surface
> > > > was compressed by render engine.
> > > >
> > > > V2: Description changes as suggested by Rafael.
> > > > V3: Mention the Clear Color size of 64 bits in the comments(DK)
> > > > v4: Fix trailing whitespaces
> > > > v5: Explain Clear Color in the documentation.
> > > > v6: Documentation Nitpicks(Nanley)
> > > >
> > > > Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> > > > Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
> > > > Cc: Kalyan Kondapally <kalyan.kondapally@intel.com>
> > > > Cc: Rafael Antognolli <rafael.antognolli@intel.com>
> > > > Cc: Nanley Chery <nanley.g.chery@intel.com>
> > > > Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> > > > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > > > ---
> > > >  include/uapi/drm/drm_fourcc.h | 19 +++++++++++++++++++
> > > >  1 file changed, 19 insertions(+)
> > > >
> > > > diff --git a/include/uapi/drm/drm_fourcc.h
> b/include/uapi/drm/drm_fourcc.h
> > > > index ca48ed0e6bc1..0a1b2c4c4bee 100644
> > > > --- a/include/uapi/drm/drm_fourcc.h
> > > > +++ b/include/uapi/drm/drm_fourcc.h
> > > > @@ -527,6 +527,25 @@ extern "C" {
> > > >   */
> > > >  #define I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS
> fourcc_mod_code(INTEL, 7)
> > > >
> > > > +/*
> > > > + * Intel Color Control Surface with Clear Color (CCS) for Gen-12 render
> > > > + * compression.
> > > > + *
> > > > + * The main surface is Y-tiled and is at plane index 0 whereas CCS is linear
> > > > + * and at index 1. The clear color is stored at index 2, and the pitch should
> > > > + * be ignored. The clear color structure is 256 bits. The first 128 bits
> > > > + * represents Raw Clear Color Red, Green, Blue and Alpha color each
> represented
> > > > + * by 32 bits. The raw clear color is consumed by the 3d engine and
> generates
> > > > + * the converted clear color of size 64 bits. The first 32 bits store the
> Lower
> > > > + * Converted Clear Color value and the next 32 bits store the Higher
> Converted
> > > > + * Clear Color value when applicable. The Converted Clear Color values
> are
> > > > + * consumed by the DE. The last 64 bits are used to store Color Discard
> Enable
> > > > + * and Depth Clear Value Valid which are ignored by the DE. A CCS cache
> line
> > > > + * corresponds to an area of 4x1 tiles in the main surface. The main
> surface
> > > > + * pitch is required to be a multiple of 4 tile widths.
> > > > + */
> > > > +#define I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC
> fourcc_mod_code(INTEL, 8)
> > > > +
> > > >  /*
> > > >   * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
> > > >   *
> > > > --
> > > > 2.25.1
> > > >
> > > > _______________________________________________
> > > > Intel-gfx mailing list
> > > > Intel-gfx@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
