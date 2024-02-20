Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F5685B8A5
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 11:11:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABF5910E0D0;
	Tue, 20 Feb 2024 10:11:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CNFNESr7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCDB410E0D0;
 Tue, 20 Feb 2024 10:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708423891; x=1739959891;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=J+RrAvgAZ/dBGAykNGTMqVRFNALZHRz2/TPDIvHsrzk=;
 b=CNFNESr76ZpkcQn+G3P+fAhVisB1j71/JiOMgz0zAfCyyHjWOEy0TTvS
 Q1I+mOZUVFvhM6OqtnN6GDiaXiOqVrDl/Brd4geIM3vUaFts1/hJHgeYQ
 YY9Bgt7cSe1QykyOSEeTxRnH6IeIMDoumL83j9hKUJgTOTNDaGAbJ5Yc3
 vhQfXMOPS12Er0I3gYk63Eyu29u6RAP2HGjWBNasDjxFNssMpBcpQ23EC
 OMYuh+poSbnZmY2Mhhv/txJvQb+39AE9crPayLJU8HZZSBFrE7jmIy6cx
 HW0cJiVY2j14pRVR7HNqQ8TrjM1S858UEmhEeAqAIrM5X3bSUiKdq9CUF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2392150"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="2392150"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 02:11:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="913048490"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; d="scan'208";a="913048490"
Received: from alichtma-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.246.34.74])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 02:11:27 -0800
Date: Tue, 20 Feb 2024 11:11:25 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, stable@vger.kernel.org,
 Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH 2/2] drm/i915/gt: Set default CCS mode '1'
Message-ID: <ZdR6zeDlKXqR1mvZ@ashyti-mobl2.lan>
References: <20240215135924.51705-1-andi.shyti@linux.intel.com>
 <20240215135924.51705-3-andi.shyti@linux.intel.com>
 <d61391f6-ff1d-4241-bd9e-2a3bee53c860@linux.intel.com>
 <c63a2d0e-fc57-4252-ad3d-2aa7615e062d@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c63a2d0e-fc57-4252-ad3d-2aa7615e062d@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,

On Mon, Feb 19, 2024 at 12:51:44PM +0000, Tvrtko Ursulin wrote:
> On 19/02/2024 11:16, Tvrtko Ursulin wrote:
> > On 15/02/2024 13:59, Andi Shyti wrote:

...

> > > +/*
> > > + * Exclude unavailable engines.
> > > + *
> > > + * Only the first CCS engine is utilized due to the disabling of
> > > CCS auto load
> > > + * balancing. As a result, all CCS engines operate collectively,
> > > functioning
> > > + * essentially as a single CCS engine, hence the count of active
> > > CCS engines is
> > > + * considered '1'.
> > > + * Currently, this applies to platforms with more than one CCS engine,
> > > + * specifically DG2.
> > > + */
> > > +#define for_each_available_uabi_engine(engine__, i915__) \
> > > +    for_each_uabi_engine(engine__, i915__) \
> > > +        if ((IS_DG2(i915__)) && \
> > > +            ((engine__)->uabi_class == I915_ENGINE_CLASS_COMPUTE) && \
> > > +            ((engine__)->uabi_instance)) { } \
> > > +        else
> > > +
> > 
> > If you don't want userspace to see some engines, just don't add them to
> > the uabi list in intel_engines_driver_register or thereabouts?

It will be dynamic. In next series I am preparing the user will
be able to increase the number of CCS engines he wants to use.

> > Similar as we do for gsc which uses I915_NO_UABI_CLASS, although for ccs
> > you can choose a different approach, whatever is more elegant.
> > 
> > That is also needed for i915->engine_uabi_class_count to be right, so
> > userspace stats which rely on it are correct.

Oh yes. Will update it.

> I later realized it is more than that - everything that uses
> intel_engine_lookup_user to look up class instance passed in from userspace
> relies on the engine not being on the user list otherwise userspace could
> bypass the fact engine query does not list it. Like PMU, Perf/POA, context
> engine map and SSEU context query.

Correct, will look into that, thank you!

Andi
