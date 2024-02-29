Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 896A886D238
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 19:27:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C07AB10E1D8;
	Thu, 29 Feb 2024 18:27:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U3KnBvNi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD5810E013;
 Thu, 29 Feb 2024 18:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709231257; x=1740767257;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ovsg3EsGVNBuUxD8Aou40oEaBLO7MWU4ochzYJsB2Lg=;
 b=U3KnBvNi/vuxrkWs3XmG+KDBUQxdnUvLGkQuy1Q49m5oYLJRr/Bikl6A
 +7LYqUVtO2VEJzIWGqBH2Le8BBdBkgoKyncokiBt/hFPN6YpoQFJ6Hjcm
 ia2p0Fn9ceTK05UfrIQrxjM5hK/4FLAJTj74UeJeeRLZn+cljHty2NPPO
 07BrkCREAsUqC/8ifUPq+kAE/jknwA9m3Owbd2NcE+h0ih9TgUPP783yG
 UzdgntrKDsoVsqDZbH5d8oHf+jxM7C7uAiCGqBv3LWuq8gLhtnWcFHbQl
 Ufp3HflZgewo+D77pfYuI9AX+odHTq1k8WK9ZvMPPcCDKP65hBCMxFrtW A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3899202"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3899202"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 10:27:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="913988859"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="913988859"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 10:27:33 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1rfl7y-00000008kFY-1VIr; Thu, 29 Feb 2024 20:27:30 +0200
Date: Thu, 29 Feb 2024 20:27:30 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Yury Norov <yury.norov@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v3 1/3] bits: introduce fixed-type genmasks
Message-ID: <ZeDMkhJCvCa44lBM@smile.fi.intel.com>
References: <20240208074521.577076-1-lucas.demarchi@intel.com>
 <20240208074521.577076-2-lucas.demarchi@intel.com>
 <CAA8EJpprfrtOjNzT6TFhV1n6MXzLdTahanfxcRW4uVjeHaBduA@mail.gmail.com>
 <ZdZlVn9BI-0q1Xdn@smile.fi.intel.com>
 <btssirjumey2kcp5dyhe6m3embdwd5bswjz3c6swrhxfijfhld@lztxaptkegw6>
 <ZddfF7kb54o2c/QR@yury-ThinkPad>
 <3o3nvkg76sofrhgcuogo3wuhitnz3bgus6qzle7pejng3v4s62@frdbuj46uiu7>
 <ZeBhVb__VNQCgTQk@smile.fi.intel.com>
 <xrqqqiizufjx75k7z32ajchgepjkdww22hddddwxwsxljq5uhf@4etg6et52grj>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xrqqqiizufjx75k7z32ajchgepjkdww22hddddwxwsxljq5uhf@4etg6et52grj>
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

On Thu, Feb 29, 2024 at 12:21:34PM -0600, Lucas De Marchi wrote:
> On Thu, Feb 29, 2024 at 12:49:57PM +0200, Andy Shevchenko wrote:
> > On Wed, Feb 28, 2024 at 05:39:21PM -0600, Lucas De Marchi wrote:
> > > On Thu, Feb 22, 2024 at 06:49:59AM -0800, Yury Norov wrote:

...

> > > I build-tested this in x86-64, x86-32 and arm64. I didn't like much the
> > > need to fork the __GENMASK() implementation on the 2 sides of the ifdef
> > > since I think the GENMASK_INPUT_CHECK() should be the one covering the
> > > input checks. However to make it common we'd need to solve 2 problems:
> > > the casts and the sizeof. The sizeof can be passed as arg to
> > > __GENMASK(), however the casts I think would need a __CAST_U8(x)
> > > or the like and sprinkle it everywhere, which would hurt readability.
> > > Not pretty. Or go back to the original submission and make it less
> > > horrible :-/
> > 
> > I'm wondering if we can use _Generic() approach here.
> 
> in assembly?

Yes.

-- 
With Best Regards,
Andy Shevchenko


