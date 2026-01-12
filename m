Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DB7D11B03
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 11:02:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81FDB10E094;
	Mon, 12 Jan 2026 10:02:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I9zkIGIM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C713410E08D;
 Mon, 12 Jan 2026 10:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768212127; x=1799748127;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sVWVfgBIynE4TGF6oGHVNnynLpGW5kHWmxUa5cShgrU=;
 b=I9zkIGIMzKy6SoyYC1uzrPWXrKevVkB5GUR+AxPgpbu200UFOkdotXYq
 pHX0jPof3wsk3oMolPQ6kmQGvXdGC8bQkD3QRHbS7EFrua7iCPtPn4GZx
 rtbyZvtCgyTCttFIEa3K2essAajs6dTH9bPVsaC8OhIxL3fJIlXopjRF7
 ZWy1T7rzlkFcgq6TM0z1lcUBpJg+pOhnTZE6gESs6PXJ61MQl1ZyZVhBG
 ObGr7ryQUUeC6f5Z90sOowTR7xpSTV1kozQZGc5ARCgH0fDp/DN1zYWgr
 KaZXuigKACxOGflAtMWLsp1ftvM2DQY0faz/38JkiT+hGbLQmBi6gpg0o w==;
X-CSE-ConnectionGUID: KncIgp5hSSe5/MIKZWjMfA==
X-CSE-MsgGUID: 9pN5QskmSzCl7fa0zySG1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="92150119"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="92150119"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 02:02:06 -0800
X-CSE-ConnectionGUID: +xATSLPfTr2vKQbvSkMGCQ==
X-CSE-MsgGUID: s7Jg6rexS2GEEigjs0znWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="204334170"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 02:02:03 -0800
Date: Mon, 12 Jan 2026 11:02:00 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 simona.vetter@ffwll.ch, airlied@gmail.com, pratik.bari@intel.com,
 joshua.santosh.ranjan@intel.com, ashwin.kumar.kulkarni@intel.com,
 shubham.kumar@intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v3 3/4] drm/xe/xe_hw_error: Add support for GT hardware
 errors
Message-ID: <aWTGmL3761UiS7lz@black.igk.intel.com>
References: <20251205083934.3602030-6-riana.tauro@intel.com>
 <20251205083934.3602030-9-riana.tauro@intel.com>
 <aTm5W6ibEn3XPZ3o@black.igk.intel.com>
 <1f77c982-6b83-4a0b-8844-e1ab2137fcff@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f77c982-6b83-4a0b-8844-e1ab2137fcff@intel.com>
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

On Mon, Jan 12, 2026 at 09:11:05AM +0530, Riana Tauro wrote:
> On 12/10/2025 11:48 PM, Raag Jadav wrote:
> > On Fri, Dec 05, 2025 at 02:09:35PM +0530, Riana Tauro wrote:
> > > PVC supports GT error reporting via vector registers along with
> > > error status register. Add support to report these errors and
> > > update respective counters. Incase of Subslice error reported
> > > by vector register, process the error status register
> > > for applicable bits.
> > > 
> > > Incorporate the counter inside the driver itself and start
> > > using the drm_ras generic netlink to report them.

...

> > > +		vector = xe_mmio_read32(mmio, ERR_STAT_GT_VECTOR_REG(severity, i));
> > > +		if (!vector)
> > > +			continue;
> > > +
> > > +		switch (i) {
> > > +		case ERR_STAT_GT_VECTOR0:
> > > +		case ERR_STAT_GT_VECTOR1:
> > > +			u32 errbit;
> > > +
> > > +			val = hweight32(vector);
> > > +			atomic64_add(val, &info[error_id].counter);
> > > +			log_gt_err(tile, "Subslice", i, vector, severity);
> > > +
> > > +			if (err_stat)
> > > +				break;
> > 
> > So we won't ever be getting past this point, is that right?
> 
> err stat will be read only once. The first time we will not hit this.

Right, so let's explain it with a small comment.

...

> > > @@ -96,11 +240,39 @@ static void hw_error_source_handler(struct xe_tile *tile, enum drm_xe_ras_error_
> > >   		goto unlock;
> > >   	}
> > > -	if (err_src & XE_CSC_ERROR)
> > > +	if (err_src & XE_CSC_ERROR) {
> > 
> > Shouldn't this be inside the loop below?
> 
> We do not have a separate type for CSC. And once we get a CSC error, the
> driver will be wedged and only way to recover is firmware flash.
> 
> So there is no point of keeping count or checking other bits.

Ditto for a small comment.

Raag
