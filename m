Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A15A485BA4B
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 12:22:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14BDA10E14F;
	Tue, 20 Feb 2024 11:21:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hckMj7mp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9350B10E03E;
 Tue, 20 Feb 2024 11:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708428118; x=1739964118;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=t+iADnVDhVJYx2pC41LWdZL2wjAkD6oDaluEgktlvb0=;
 b=hckMj7mp/pPfsAXyAfkyDf5m8GzqFKJSC6RjQRcI/aH+a+B14jaUvQxo
 PQmrrjiR0R8Cq8WGuyLicRCETae80jIyGZmn58OnSMTeybDAEgtBEZF05
 2OCR+gi+TK6u/qej2nlhw/h14THSEzbt1OjreF6ChHCylIkDpeK6uY5Rf
 HBo3euhi4topC2n6XvOe4452T5d3ynPxP8k5CkcxgHu+4St7jvFrtFv9o
 NM1SN+X1FZuTpnJIfQkas2zckkgc43fTy/XDNqyZSpZAThAxxwuqXhjgW
 jXR6L/LoreiS6c8E9F9/7Qyw3W/z3f3UFxe4uTvTak02DJGmowSn4+qKV A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="13232964"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; d="scan'208";a="13232964"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 03:21:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="4715832"
Received: from alichtma-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.246.34.74])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 03:21:54 -0800
Date: Tue, 20 Feb 2024 12:21:51 +0100
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
Message-ID: <ZdSLT_IsU6x4OMRZ@ashyti-mobl2.lan>
References: <20240215135924.51705-1-andi.shyti@linux.intel.com>
 <20240215135924.51705-3-andi.shyti@linux.intel.com>
 <d61391f6-ff1d-4241-bd9e-2a3bee53c860@linux.intel.com>
 <c63a2d0e-fc57-4252-ad3d-2aa7615e062d@linux.intel.com>
 <ZdR6zeDlKXqR1mvZ@ashyti-mobl2.lan>
 <97b11121-4c48-4dd9-b966-4c42eda3f6a3@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <97b11121-4c48-4dd9-b966-4c42eda3f6a3@linux.intel.com>
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

On Tue, Feb 20, 2024 at 11:15:05AM +0000, Tvrtko Ursulin wrote:
> On 20/02/2024 10:11, Andi Shyti wrote:
> > On Mon, Feb 19, 2024 at 12:51:44PM +0000, Tvrtko Ursulin wrote:
> > > On 19/02/2024 11:16, Tvrtko Ursulin wrote:
> > > > On 15/02/2024 13:59, Andi Shyti wrote:
> > 
> > ...
> > 
> > > > > +/*
> > > > > + * Exclude unavailable engines.
> > > > > + *
> > > > > + * Only the first CCS engine is utilized due to the disabling of
> > > > > CCS auto load
> > > > > + * balancing. As a result, all CCS engines operate collectively,
> > > > > functioning
> > > > > + * essentially as a single CCS engine, hence the count of active
> > > > > CCS engines is
> > > > > + * considered '1'.
> > > > > + * Currently, this applies to platforms with more than one CCS engine,
> > > > > + * specifically DG2.
> > > > > + */
> > > > > +#define for_each_available_uabi_engine(engine__, i915__) \
> > > > > +    for_each_uabi_engine(engine__, i915__) \
> > > > > +        if ((IS_DG2(i915__)) && \
> > > > > +            ((engine__)->uabi_class == I915_ENGINE_CLASS_COMPUTE) && \
> > > > > +            ((engine__)->uabi_instance)) { } \
> > > > > +        else
> > > > > +
> > > > 
> > > > If you don't want userspace to see some engines, just don't add them to
> > > > the uabi list in intel_engines_driver_register or thereabouts?
> > 
> > It will be dynamic. In next series I am preparing the user will
> > be able to increase the number of CCS engines he wants to use.
> 
> Oh tricky and new. Does it need to be at runtime or could be boot time?

At boot time the CCS mode has to be set to '1', i.e. only one CCS
will be visible to the user. Then, during the normal execution of
the driver, the user can decide to change the mode and therefore
we would need to expose more than one CCS engine.

> If you are aiming to make the static single CCS only into the 6.9 release,
> and you feel running out of time, you could always do a simple solution for
> now. The one I mentioned of simply not registering on the uabi list. Then
> you can refine more leisurely for the next release.

Thanks. I started working on a dynamic rebuilt of the
uabi_engines, but in this series it wouldn't fit.

I will add the limitation during the list creation.

Thanks a lot,
Andi
