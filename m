Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B68F2C6B3F
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 19:06:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BFCB6EE78;
	Fri, 27 Nov 2020 18:06:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C416EE43;
 Fri, 27 Nov 2020 18:06:10 +0000 (UTC)
IronPort-SDR: hX0vRk+cGOHvN9b1cWJbQJu4AoJqkzCOJF3wfFIz7IpEVdC+GawHF9MyvotmpGr6/9yKNN5Q3c
 KdmuzfEYiaWA==
X-IronPort-AV: E=McAfee;i="6000,8403,9818"; a="169859470"
X-IronPort-AV: E=Sophos;i="5.78,375,1599548400"; d="scan'208";a="169859470"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 10:06:10 -0800
IronPort-SDR: aCj5rC3btGWJlsxfTEhoo2s93/Lot1+Ts8+/HVNLiXOcWvz+MykYx+6e3KXRGxDtmqsKtzMTbl
 H2X+InfL1uug==
X-IronPort-AV: E=Sophos;i="5.78,375,1599548400"; d="scan'208";a="363233991"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 10:06:08 -0800
Date: Fri, 27 Nov 2020 20:06:04 +0200
From: Imre Deak <imre.deak@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>,
	Nanley Chery <nanley.g.chery@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/framebuffer: Format modifier for
 Intel Gen 12 render compression with Clear Color
Message-ID: <20201127180604.GA2169344@ideak-desk.fi.intel.com>
References: <20201123182631.1740781-1-imre.deak@intel.com>
 <20201127143100.GB2144692@ideak-desk.fi.intel.com>
 <20201127151920.GI401619@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201127151920.GI401619@phenom.ffwll.local>
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
Reply-To: imre.deak@intel.com
Cc: Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rafael Antognolli <rafael.antognolli@intel.com>,
 Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>,
 Kalyan Kondapally <kalyan.kondapally@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 27, 2020 at 04:19:20PM +0100, Daniel Vetter wrote:
> On Fri, Nov 27, 2020 at 04:31:00PM +0200, Imre Deak wrote:
> > Hi Daniel, Jani,
> > 
> > is it ok to merge this patch along with 2/2 via the i915 tree?
> 
> Ack from mesa (userspace in general, but mesa is kinda mandatory) is
> missing I think. With that
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Thanks.

Nanley, could you ACK the patchset if they look ok from Mesa's POV? It
works as expected at least with the igt/kms_ccs RC-CC subtest.

--Imre

> > On Mon, Nov 23, 2020 at 08:26:30PM +0200, Imre Deak wrote:
> > > From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> > > 
> > > Gen12 display can decompress surfaces compressed by render engine with
> > > Clear Color, add a new modifier as the driver needs to know the surface
> > > was compressed by render engine.
> > > 
> > > V2: Description changes as suggested by Rafael.
> > > V3: Mention the Clear Color size of 64 bits in the comments(DK)
> > > v4: Fix trailing whitespaces
> > > v5: Explain Clear Color in the documentation.
> > > v6: Documentation Nitpicks(Nanley)
> > > 
> > > Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> > > Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
> > > Cc: Kalyan Kondapally <kalyan.kondapally@intel.com>
> > > Cc: Rafael Antognolli <rafael.antognolli@intel.com>
> > > Cc: Nanley Chery <nanley.g.chery@intel.com>
> > > Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> > > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > > ---
> > >  include/uapi/drm/drm_fourcc.h | 19 +++++++++++++++++++
> > >  1 file changed, 19 insertions(+)
> > > 
> > > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> > > index ca48ed0e6bc1..0a1b2c4c4bee 100644
> > > --- a/include/uapi/drm/drm_fourcc.h
> > > +++ b/include/uapi/drm/drm_fourcc.h
> > > @@ -527,6 +527,25 @@ extern "C" {
> > >   */
> > >  #define I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS fourcc_mod_code(INTEL, 7)
> > >  
> > > +/*
> > > + * Intel Color Control Surface with Clear Color (CCS) for Gen-12 render
> > > + * compression.
> > > + *
> > > + * The main surface is Y-tiled and is at plane index 0 whereas CCS is linear
> > > + * and at index 1. The clear color is stored at index 2, and the pitch should
> > > + * be ignored. The clear color structure is 256 bits. The first 128 bits
> > > + * represents Raw Clear Color Red, Green, Blue and Alpha color each represented
> > > + * by 32 bits. The raw clear color is consumed by the 3d engine and generates
> > > + * the converted clear color of size 64 bits. The first 32 bits store the Lower
> > > + * Converted Clear Color value and the next 32 bits store the Higher Converted
> > > + * Clear Color value when applicable. The Converted Clear Color values are
> > > + * consumed by the DE. The last 64 bits are used to store Color Discard Enable
> > > + * and Depth Clear Value Valid which are ignored by the DE. A CCS cache line
> > > + * corresponds to an area of 4x1 tiles in the main surface. The main surface
> > > + * pitch is required to be a multiple of 4 tile widths.
> > > + */
> > > +#define I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC fourcc_mod_code(INTEL, 8)
> > > +
> > >  /*
> > >   * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
> > >   *
> > > -- 
> > > 2.25.1
> > > 
> > > _______________________________________________
> > > Intel-gfx mailing list
> > > Intel-gfx@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
