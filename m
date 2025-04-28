Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4677DA9E96C
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 09:35:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BF5810E3B5;
	Mon, 28 Apr 2025 07:35:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J9rOlgI6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E0910E3B5;
 Mon, 28 Apr 2025 07:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745825724; x=1777361724;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mxdki93guRrPUqMnNg4vPPRG6mXLaz09PPXd+0S8V6E=;
 b=J9rOlgI6AciWCmXxtToIPSIfqRu3ooOY/Hwk29E4XwJclfYg/7WUV/Ke
 1jXMLIuIwbF2v/S+Mi1cl3C7TMxRVnFN++NXjEuuy9jzmWi9bAoyLBxex
 aHWwhIMbGoPCTd62jG1Pd1N4gh1YVie/5WlSWAZbuRGp0U/yh6OISSxQ9
 6ws5sJP2HVUsYHxVRjDFycG6OBsuWHXenM0SeOpo4kVYcb4upEQ6HUx7x
 8+Hk6rk0WC49yTOsjjqU0plhKaju8DWEG98Z0yQM5VsgcwLOQW8d4a2Uq
 jjT0ClbkWgh0B86ODo9pnGy4Sb3ivEaNbxSpk7irNNwDUhnn7OY3czjv3 A==;
X-CSE-ConnectionGUID: gvhibaVmRviDYsnhjkzaIg==
X-CSE-MsgGUID: 5xvsPDvmTDaiBaLc0xCtZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="50058868"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="50058868"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 00:35:24 -0700
X-CSE-ConnectionGUID: tFG6ORSjTd2nkwZlwgLrJA==
X-CSE-MsgGUID: vdPhjXp7RgOB/g6AJCI/RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="137491544"
Received: from smile.fi.intel.com ([10.237.72.55])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 00:35:19 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1u9J1I-000000011Cw-0lnE; Mon, 28 Apr 2025 10:35:16 +0300
Date: Mon, 28 Apr 2025 10:35:15 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Akira Yokosawa <akiyks@gmail.com>, airlied@gmail.com, corbet@lwn.net,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 masahiroy@kernel.org, mripard@kernel.org, nathan@kernel.org,
 nicolas.schier@linux.dev, rodrigo.vivi@intel.com, simona@ffwll.ch,
 tursulin@ursulin.net, tzimmermann@suse.de
Subject: Re: [PATCH v4 0/4] Don't create Python bytecode when building the
 kernel
Message-ID: <aA8vs8gw75aAfwYb@smile.fi.intel.com>
References: <cover.1745453655.git.mchehab+huawei@kernel.org>
 <22d7bca2-cdfb-4e06-acb2-41363ba13333@gmail.com>
 <20250426205708.4f90a83d@sal.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250426205708.4f90a83d@sal.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Sat, Apr 26, 2025 at 08:57:08PM +0800, Mauro Carvalho Chehab wrote:
> Em Sat, 26 Apr 2025 11:39:05 +0900
> Akira Yokosawa <akiyks@gmail.com> escreveu:
> 
> > Bothering with might-become-incompatilbe-in-the-future python environment
> > variables in kernel Makefiles looks over-engineering to me.
> > Also, as Mauro says in 3/4, it is incomplete in that it does not cover
> > the cases where those scripts are invoked outside of kernel build.
> > And it will interfere with existing developers who want the benefit of
> > bytecode caching.
> > 
> > I'm not precluding the possibility of incoherent bytecode cache; for example
> > by using a shared kernel source tree among several developers, and only
> > one of them (owner) has a write permission of it.  In that case, said
> > owner might update the tree without running relevant python scripts.
> > 
> > I don't know if python can notice outdated cache and disregard it.
> > 
> > In such a situation, setting PYTHONPYCACHEPREFIX as an environment
> > variable should help, for sure, but only in such special cases.
> > 
> > Andy, what do you say if I ask reverts of 1/4, 2/4/, and 3/4?
> 
> Patches 1 and 2 are, IMO, needed anyway, as they fix a problem:
> KERNELDOC environment is not used consistently.
> 
> Now, patch 3 is the one that may require more thinking.
> 
> I agree with Andy that, when O=<dir> is used, nothing shall be
> written to source dir.
> 
> There are a couple of reasons for that:
> 
> 1. source dir may be read only;
> 2. one may want to do cross compilation and use multiple output
>    directories, one for each version;
> 3. the source dir could be mapped via NFS to multiple machines
>    with different architectures.
> 
> For (3), it could mean that multiple machines may have different
> Python versions, so, sharing the Python bytecode from source dir doesn't
> sound a good idea. Also, I'm not sure if the pyc from different archs
> would be identical.
> 
> With that, there are two options:
> 
> a. disable cache;
> b. set PYTHONCACHEPREFIX.

Thanks, Mauro, for replying. I'm with you on all of it.

> We're currently doing (a). I guess everybody agrees that this is
> is not ideal.

Yes, I also prefer to have cache working if it's possible. The only BUT here is
that users should not suffer from it.

> So, ideally, we should move to (b). For Spinx, the easiest solution
> is just to place it under Documentation/output, but this is not
> generic enough: ideally, we should revert patch 3 and set
> PYTHONCACHEPREFIX when O is used. Eventually, we can apply my
> patch for Documentation/output, while we craft such logic.

-- 
With Best Regards,
Andy Shevchenko


