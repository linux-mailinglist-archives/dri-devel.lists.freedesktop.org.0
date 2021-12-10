Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E1F46FE7D
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 11:09:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 979C410E294;
	Fri, 10 Dec 2021 10:09:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50CD510E294;
 Fri, 10 Dec 2021 10:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639130982; x=1670666982;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=r/sr4p6KVhudsUPlxpfIdMiTVMi/O8LJeu7Hyy3nhm8=;
 b=RXYU4c6ED/nheqMB4TmtgSGO2BE9xALE2NMVdh1o6KUYGzDCXAt+MVL0
 FQgtn+dExGIwt5r648kSdGqeYBAPB98vssHtVcj9SYS7DIEirk8GIitl3
 whv/9CXOWtLqbT7bt69Eh4m+a2/4I4AtjdeLzUfYsOIjCI9OfNLvt6MBY
 JME4tKpqCqp9TPuLLc3kQyprxmfLRlrzh7Do0dMONVn9ufB2bfe0ojX+l
 QnlNbV9mkSmEDIrWoHMYizAzjCEmcXBC2+iJJAhjPFqbLQTauXvrhBayO
 HWhXRnIXnMrmGFCuhmhRKXx1tmR/80yFZ0jVsNHs/r0mUUkdZZuAueSQ0 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="238264002"
X-IronPort-AV: E=Sophos;i="5.88,195,1635231600"; d="scan'208";a="238264002"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 02:09:41 -0800
X-IronPort-AV: E=Sophos;i="5.88,195,1635231600"; d="scan'208";a="680697974"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 02:09:39 -0800
Date: Fri, 10 Dec 2021 12:09:35 +0200
From: Imre Deak <imre.deak@intel.com>
To: "Chery, Nanley G" <nanley.g.chery@intel.com>
Subject: Re: [PATCH 1/2] drm/i915: Introduce new Tile 4 format
Message-ID: <20211210100935.GA1142804@ideak-desk.fi.intel.com>
References: <20211209104711.14790-1-stanislav.lisovskiy@intel.com>
 <b4302b4804784f2c9379be244ed4f279@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4302b4804784f2c9379be244ed4f279@intel.com>
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>, "Saarinen,
 Jani" <jani.saarinen@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 09, 2021 at 05:14:56PM +0200, Chery, Nanley G wrote:
> 
> 
> > -----Original Message-----
> > From: Lisovskiy, Stanislav <stanislav.lisovskiy@intel.com>
> > Sent: Thursday, December 9, 2021 5:47 AM
> > To: intel-gfx@lists.freedesktop.org
> > Cc: dri-devel@lists.freedesktop.org; Lisovskiy, Stanislav
> > <stanislav.lisovskiy@intel.com>; Saarinen, Jani <jani.saarinen@intel.com>; C,
> > Ramalingam <ramalingam.c@intel.com>; ville.syrjala@linux.intel.com; Deak,
> > Imre <imre.deak@intel.com>; Chery, Nanley G <nanley.g.chery@intel.com>
> > Subject: [PATCH 1/2] drm/i915: Introduce new Tile 4 format
> > 
> 
> We want this patch to be 2/2, right? That way, we expose public kernel
> support for the format after the kernel gains internal support for it.

Previously modifiers have been added in a separate patch CC'd to
dri-devel (and that patch needs to be before the one starting to use
it) and then merged via the i915 tree only after getting an ACK for this
from Jani or Danvet.

The modifier will be exposed to userspace only after the second
one, so I don't see a problem with that approach.

Either way the patchset looks ok to me:
Reviewed-by: Imre Deak <imre.deak@intel.com>

> With that fixed, this patch is:
> 
> Acked-by: Nanley Chery <nanley.g.chery@intel.com>
> 
> Alternatively, you could apply the ack to the prior combined patch if you'd like.
> 
> -Nanley
> 
> 
> 
> > This tiling layout uses 4KB tiles in a row-major layout. It has the same shape as
> > Tile Y at two granularities: 4KB (128B x 32) and 64B (16B x 4). It only differs from
> > Tile Y at the 256B granularity in between. At this granularity, Tile Y has a shape
> > of 16B x 32 rows, but this tiling has a shape of 64B x 8 rows.
> > 
> > Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> > ---
> >  include/uapi/drm/drm_fourcc.h | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> > index 7f652c96845b..a146c6df1066 100644
> > --- a/include/uapi/drm/drm_fourcc.h
> > +++ b/include/uapi/drm/drm_fourcc.h
> > @@ -565,6 +565,17 @@ extern "C" {
> >   */
> >  #define I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC
> > fourcc_mod_code(INTEL, 8)
> > 
> > +/*
> > + * Intel Tile 4 layout
> > + *
> > + * This is a tiled layout using 4KB tiles in a row-major layout. It has
> > +the same
> > + * shape as Tile Y at two granularities: 4KB (128B x 32) and 64B (16B x
> > +4). It
> > + * only differs from Tile Y at the 256B granularity in between. At this
> > + * granularity, Tile Y has a shape of 16B x 32 rows, but this tiling
> > +has a shape
> > + * of 64B x 8 rows.
> > + */
> > +#define I915_FORMAT_MOD_4_TILED         fourcc_mod_code(INTEL, 9)
> > +
> >  /*
> >   * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
> >   *
> > --
> > 2.24.1.485.gad05a3d8e5
> 
