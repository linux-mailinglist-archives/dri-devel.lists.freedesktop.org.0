Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BE14BB405
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 09:20:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C769910ED69;
	Fri, 18 Feb 2022 08:20:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80ABD10ED69;
 Fri, 18 Feb 2022 08:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645172420; x=1676708420;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AJbKvng7hV2tgOeyvqFasoui1jkJgeMmty9uLRiz/Xo=;
 b=UOCvMMY4lIOE2L4scWEhGxfwSINR8RuKUpPp5OWCmbfYL+K7uY9y0RjK
 RvkZxhiitNNZWuuOSbYVOTEPh8rgaYGnVG223yC/OMHy42/p1eCIaZFLf
 5jWT/mkWJCXWaPd7DWoSpvDb57NF0FpORqLle+GDpFMkMViA7DZKnygbO
 1JXjOtaMMn7JnoM+ZQ97ZJb95dFEOgXRX3N9I/1q6tAx13flVtapWw2gP
 9K7ZQsCqKo676rgxD+FZVapu8U5RdRPDvEcTkI8M9d4E+HtIRPC2M1BJ8
 9nTMeYj8sAqvQprgoJDqqjrYEDG2s6sUQA4eXSvNjcexepm0Uw904XAFF A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="234610476"
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="234610476"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 00:20:19 -0800
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="777936202"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.203.144.108])
 by fmsmga005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2022 00:20:15 -0800
Date: Fri, 18 Feb 2022 13:50:31 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [Intel-gfx] [PATCH v5 09/19] Doc/gpu/rfc/i915: i915 DG2 64k
 pagesize uAPI
Message-ID: <20220218082031.GA3646@intel.com>
References: <20220201104132.3050-1-ramalingam.c@intel.com>
 <20220201104132.3050-10-ramalingam.c@intel.com>
 <20220218053916.risswlri3cjyjvhd@ldmartin-desk2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220218053916.risswlri3cjyjvhd@ldmartin-desk2>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Kenneth Graunke <kenneth@whitecape.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Slawomir Milczarek <slawomir.milczarek@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, mesa-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-02-17 at 21:39:16 -0800, Lucas De Marchi wrote:
> On Tue, Feb 01, 2022 at 04:11:22PM +0530, Ramalingam C wrote:
> > Details of the 64k pagesize support added as part of DG2 enabling and its
> > implicit impact on the uAPI.
> > 
> > v2: improvised the Flat-CCS documentation [Danvet & CQ]
> > v3: made only for 64k pagesize support
> > 
> > Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> > cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > cc: Matthew Auld <matthew.auld@intel.com>
> > cc: Simon Ser <contact@emersion.fr>
> > cc: Pekka Paalanen <ppaalanen@gmail.com>
> > Cc: Jordan Justen <jordan.l.justen@intel.com>
> > Cc: Kenneth Graunke <kenneth@whitecape.org>
> > Cc: mesa-dev@lists.freedesktop.org
> > Cc: Tony Ye <tony.ye@intel.com>
> > Cc: Slawomir Milczarek <slawomir.milczarek@intel.com>
> > ---
> > Documentation/gpu/rfc/i915_dg2.rst | 25 +++++++++++++++++++++++++
> > Documentation/gpu/rfc/index.rst    |  3 +++
> > 2 files changed, 28 insertions(+)
> > create mode 100644 Documentation/gpu/rfc/i915_dg2.rst
> > 
> > diff --git a/Documentation/gpu/rfc/i915_dg2.rst b/Documentation/gpu/rfc/i915_dg2.rst
> > new file mode 100644
> > index 000000000000..f4eb5a219897
> > --- /dev/null
> > +++ b/Documentation/gpu/rfc/i915_dg2.rst
> > @@ -0,0 +1,25 @@
> > +====================
> > +I915 DG2 RFC Section
> > +====================
> > +
> > +Upstream plan
> > +=============
> > +Plan to upstream the DG2 enabling is:
> > +
> > +* Merge basic HW enabling for DG2 (Still without pciid)
> > +* Merge the 64k support for lmem
> > +* Merge the flat CCS enabling patches
> > +* Add the pciid for DG2 and enable the DG2 in CI
> 
> does this make sense after the fact? Earlier version of this patch
> Daniel Vetter asked this to be moved to the be the first patch. I see
> you added it in the cover letter, but keeping this in
> gpu/rfc/i915_dg2.rst doesn't make much sense IMO. Maybe just drop this
> patch?

Yes. I couldn't move this to the start of the series as the kdoc
referenced here are from later patches of the series.

But now considering we have the Kdoc for uapi at the respective patches
itself we could drop this patch.

Daniel, Hope you agree on that?

Ram.
> 
> Lucas De Marchi
> 
> > +
> > +
> > +64K page support for lmem
> > +=========================
> > +On DG2 hw, local-memory supports minimum GTT page size of 64k only. 4k is not
> > +supported anymore.
> > +
> > +DG2 hw doesn't support the 64k (lmem) and 4k (smem) pages in the same ppgtt
> > +Page table. Refer the struct drm_i915_gem_create_ext for the implication of
> > +handling the 64k page size.
> > +
> > +.. kernel-doc:: include/uapi/drm/i915_drm.h
> > +        :functions: drm_i915_gem_create_ext
> > diff --git a/Documentation/gpu/rfc/index.rst b/Documentation/gpu/rfc/index.rst
> > index 91e93a705230..afb320ed4028 100644
> > --- a/Documentation/gpu/rfc/index.rst
> > +++ b/Documentation/gpu/rfc/index.rst
> > @@ -20,6 +20,9 @@ host such documentation:
> > 
> >     i915_gem_lmem.rst
> > 
> > +.. toctree::
> > +    i915_dg2.rst
> > +
> > .. toctree::
> > 
> >     i915_scheduler.rst
> > -- 
> > 2.20.1
> > 
