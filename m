Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7CEA4A271
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 20:08:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFCE010ED2B;
	Fri, 28 Feb 2025 19:08:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YQ+C1HQm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 721A110ED2A
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 19:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740769716; x=1772305716;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7iBUy5XRdqi0Lt6+biyiEgUZswAs5L9wj02kyKQRgKQ=;
 b=YQ+C1HQmL8JCssIMFCAuWNt7iwdphxDNSXhFYoMNAjU4SASCngp+AHJd
 txVgqyeSHTr4gjcoVAGrLyyyz6fcwJB+yrU+xhN2yZry+/1eHp2lGXFvI
 hGnEv/RELHYvL1vWqZbvpJ/fOg+SB9jCiyzi14dUzb0QmtzqpUUsX4/OP
 05g4E84fvCfcWIpqCN1DRKKVsKsq9XxQ/rI80XAsK10NHgEDHOpbRiTKN
 +IAdqBbj8MH00c/M9IsJLYeB2cCkL3OQYe2OQxqY+RzJO081NHQ74JSmV
 0aQUGGcIiHR4Q4tXz0D9R00fXGFt1TTDI9TqEMie7PkVS0DWHjQfH7g/f g==;
X-CSE-ConnectionGUID: 1rK16glARTeA01bwgOWueQ==
X-CSE-MsgGUID: L0zXUk6BT1Wk0ya9uQPOUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="52343224"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; d="scan'208";a="52343224"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 11:08:19 -0800
X-CSE-ConnectionGUID: kQPz+B6eR+CVGIaFucMWUw==
X-CSE-MsgGUID: RtjfC60kQUOO2c8NreyKPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121544074"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 11:08:18 -0800
Date: Fri, 28 Feb 2025 21:08:15 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Cleanup io.h
Message-ID: <Z8IJn7dp4gypnoyz@black.fi.intel.com>
References: <20250227070747.3105451-1-raag.jadav@intel.com>
 <Z8CD33_OWK2LB6IZ@smile.fi.intel.com>
 <0011035a-5816-48c4-9fe4-c0b9db3c8e72@app.fastmail.com>
 <Z8H1Y2_RlFnXeNEa@black.fi.intel.com>
 <Z8IDXD2bkO1t71yB@smile.fi.intel.com>
 <Z8IDgmrLx5DQADxJ@smile.fi.intel.com>
 <Z8IERmwHXUuJoD4S@black.fi.intel.com>
 <Z8IGA821OAgYN-K1@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8IGA821OAgYN-K1@smile.fi.intel.com>
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

On Fri, Feb 28, 2025 at 08:52:51PM +0200, Andy Shevchenko wrote:
> On Fri, Feb 28, 2025 at 08:45:26PM +0200, Raag Jadav wrote:
> > On Fri, Feb 28, 2025 at 08:42:10PM +0200, Andy Shevchenko wrote:
> > > On Fri, Feb 28, 2025 at 08:41:33PM +0200, Andy Shevchenko wrote:
> > > > On Fri, Feb 28, 2025 at 07:41:55PM +0200, Raag Jadav wrote:
> > > > > On Fri, Feb 28, 2025 at 06:11:16PM +0100, Arnd Bergmann wrote:
> > > > > > On Thu, Feb 27, 2025, at 16:25, Andy Shevchenko wrote:
> > > > > > > On Thu, Feb 27, 2025 at 12:37:45PM +0530, Raag Jadav wrote:
> > > > > > >> This series attempts to cleanup io.h with "include what you use" approach.
> > > > > > >> This depends on changes available on immutable tag[1].
> > > > > > >> 
> > > > > > >> Although this series is too trivial in the grand scheme of things, it is
> > > > > > >> still a tiny step towards untangling core headers. I have success results
> > > > > > >> from LKP for this series but there can still be corner cases. So perhaps
> > > > > > >> we can queue this on a temporary branch which we can use to submit fixes
> > > > > > >> in case of fallout.
> > > > > > >> 
> > > > > > >> Future plan is to use the excellent analysis[2][3] by Arnd to cleanup other
> > > > > > >> headers.
> > > > > > >> 
> > > > > > >> [1] https://lore.kernel.org/r/Z7xGpz3Q4Zj6YHx7@black.fi.intel.com
> > > > > > >> [2] https://lore.kernel.org/r/2342b516-2c6e-42e5-b4f4-579b280823ba@app.fastmail.com
> > > > > > >> [3] https://lore.kernel.org/r/f6eb011b-40fb-409a-b2b2-a09d0e770bbd@app.fastmail.com
> > > > > > >
> > > > > > > I believe Arnd can take it through his tree for headers as DRM part is 
> > > > > > > Acked already.
> > > > > > 
> > > > > > I've applied it yesterday and not seen any regression reports so far.
> > > > > 
> > > > > Probably because the immutable tag is already in -next?
> > > > 
> > > > Is there any?
> > > 
> > > Ah, you mean devres related?
> > 
> > Yeah, couldn't find it on Arnd's tree and I'm not sure if this series
> > works without it.
> 
> But err.h is included in the io.h, no? Or did I misunderstand the point?

First patch on the immutable tag moves IOMEM_ERR_PTR() to err.h and here
we're dropping err.h from io.h. So without the tag this series will probably
break IOMEM_ERR_PTR().

Raag
