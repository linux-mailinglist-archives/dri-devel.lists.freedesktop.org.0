Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B826390E8C3
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 12:56:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED81510EC32;
	Wed, 19 Jun 2024 10:56:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kXQvhwRz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1F9A10EC32;
 Wed, 19 Jun 2024 10:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718794578; x=1750330578;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SOATV0iVN/kO8wlhTiD8o6+GdiMBRYtreqdWI5OEuKo=;
 b=kXQvhwRzAbkM7QUCwcAFiyyhSzGmEyd3UyxC1I69KVI1D4Tk5KRsIRfr
 1Va4pDO80/LiiYuysmb75iMxYmouzwiwNcj+DT/cYX0gUqez5H53VjHk1
 rpD/M6A447ClnCbmrlmCAMidwPxAtR6lm7uuGmGuHk8LCCTWOf+bocE/C
 6a/RVthszNeMcJtup+eeKNBiSwoyyhrc0BHucCRrNy89rIMtxcYStQjHQ
 NqSYWtK7WGYFP3F/9SAXe8WKM86veCqdoT/Fx55qPgFLitX4WM2hQ4Nxc
 +PLeCuQakabdCDxh743C4TBkx3KDEK5eCYfniCAXZ1XNEIkQ1RLM0PBbp Q==;
X-CSE-ConnectionGUID: V81aXsuJT82Pp7W3je4oHA==
X-CSE-MsgGUID: J233Ab3qSX6Yn8HL4KaUAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="33272166"
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; d="scan'208";a="33272166"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 03:56:17 -0700
X-CSE-ConnectionGUID: XJLb7SIARey2e03afCOZtg==
X-CSE-MsgGUID: /S64jC8BRP+mFjcoxxvdyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; d="scan'208";a="46821448"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.22])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 03:56:15 -0700
Date: Wed, 19 Jun 2024 12:56:12 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 0/2] Sparse errors on the i915_gem_stolen
Message-ID: <ZnK5TNXBs6nwYRSm@ashyti-mobl2.lan>
References: <20240617184243.330231-1-andi.shyti@linux.intel.com>
 <CH0PR11MB544406358146035F905D6862E5CE2@CH0PR11MB5444.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CH0PR11MB544406358146035F905D6862E5CE2@CH0PR11MB5444.namprd11.prod.outlook.com>
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

Hi,

On Tue, Jun 18, 2024 at 07:34:22PM +0000, Cavitt, Jonathan wrote:
> > Commit 05da7d9f717b ("drm/i915/gem: Downgrade stolen lmem setup
> > warning") produces two sparse warnings. The first one being a bit
> > more sever as it might cause a segmentation fault.
> > 
> > The difference between v1 and v2 is that the patch should return
> > a NULL, which won't cause any issues.
> > 
> > Andi
> 
> Sure.  Apply to all:
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

Thanks, if no other comments, I'm going to merge this soon,

Thanks,
Andi
