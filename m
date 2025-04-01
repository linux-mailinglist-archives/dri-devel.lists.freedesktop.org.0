Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A670A77AB7
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 14:21:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A24810E587;
	Tue,  1 Apr 2025 12:21:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IsNCL6GO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 678DF10E587
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 12:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743510092; x=1775046092;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=rpGVIbmlvEKjUlcxFp84cW7gj9+lvPCnNInS+91z41k=;
 b=IsNCL6GOVMIMPYcDB2wxYoNrD0DhRQKu/osV579i7NVeqjMlvBhZUAjm
 lC5A1Itvm/IfwkeP29CESL3t1rouI8PBumhZ8I/RXAfQuAPkgE01JPXnH
 d3nIp1Z6IGPlRDeXMtdSTw//riH4ow/9gDhkpB6KpceY4ly7A2yZMMCZH
 LS1KoRb81o3OAPXmvZP9ZHg9+ucrvLH2pf1J+ljvC4wXtGQkIrJfRdwgE
 dE/EC7hwrp2zE876/cleEz+UYfNgfI4bODL14/y4mPQUpf67PVP5L9/s7
 Of4aoTSeMhux7pRfSLjHlDU5AzfKz8wHF+iQwC4Kycjv+BffWLbZnn8NN w==;
X-CSE-ConnectionGUID: GLYRYCfPTUCs7xf1CyChxA==
X-CSE-MsgGUID: +zy54xn+SyWLDZko85AzNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44541548"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="44541548"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 05:21:30 -0700
X-CSE-ConnectionGUID: jDLoMHsyTMe7cXXsmpjA3Q==
X-CSE-MsgGUID: +ca8RUnsTSaxu4Zh2Oav4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="131094794"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.7])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 05:21:27 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, Dave Airlie <airlied@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, LKML
 <linux-kernel@vger.kernel.org>
Subject: Re: [git pull] drm for 6.15-rc1
In-Reply-To: <20250331133137.GA263675@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CAPM=9tyx=edsZ3ajuAUAv4vjfa=WNEzobqAsYbBTjCfLbuEeFQ@mail.gmail.com>
 <CAHk-=wjcdfrDTjzm6J6T-3fxtVyBG7a_0BXc2=mgOuM6KPFnCg@mail.gmail.com>
 <87h6394i87.fsf@intel.com> <Z-p2ii-N2-dd_HJ6@phenom.ffwll.local>
 <20250331133137.GA263675@nvidia.com>
Date: Tue, 01 Apr 2025 15:21:24 +0300
Message-ID: <87tt782htn.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 31 Mar 2025, Jason Gunthorpe <jgg@nvidia.com> wrote:
> Please don't keep it fully isolated to DRM.. This new stuff did find
> an error in the fwctl UAPI headers around uuid_t that had gone unnoticed:
>
> https://lore.kernel.org/all/f6489337-67c7-48c8-b48a-58603ec15328@paulmck-laptop/raw
>
> I think that was a valuable report, you just need to find a way to
> make the tests it runs more acceptable..

The header checks have existed for uapi headers before, including the,
uh, turds, but apparently adding them in drm broke the camel's back.

> FWIW, there is a "trick" I like to use for C header files, just ensure
> that some C file someplace includes each header file first in the
> #include list. It automatically makes the compiler check it is self
> contained naturally. You can get pretty far by paying attention to
> this detail and it costs nothing at build time.

It's a fairly good solution for a lot of cases, but it falls a bit
short. I'd additionally like to ensure:

- Header guards are in place
- There are no kernel-doc warnings
- Headers not associated 1:1 with a .c file are also checked

Finally, the cost of having to keep checking the headers are in fact
included first, and nagging about it in reviews, is not without cost.

BR,
Jani.


-- 
Jani Nikula, Intel
