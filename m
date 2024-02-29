Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE22D86C74B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 11:50:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 147AC10E3FF;
	Thu, 29 Feb 2024 10:50:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N6Pv2Zeq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA41710E33B;
 Thu, 29 Feb 2024 10:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709203805; x=1740739805;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0Ghs1427kpjULFuDpCFdojY0v88USn8crvkTL9I/BSk=;
 b=N6Pv2Zeq3cWfFKggCRbj1IAic3YB+s2daIHsXIjPMj7JQ8b419s8+XX7
 Uj+bDExNjhqg+7mdARsSU8uHmGJEeRT7HheLe3OD7TizapdzsUS9O9YAj
 CgZS7fJdiJb4yfQFSNRl+c0sRVCbM4KPgz67j/nwr+AfyNvQF+fCO6q8X
 MrkGsKHRsExPv0v2t62xQURPWDhX/gjSRuh9n5Qmldu4ivbjE5kqop5MH
 4MhFCPuw5ITcEFqYDcKUr3p6UcTdEGnp6sNF2fyuDI27HEYkDAJHd4YGC
 mueG+EC/bhsx60AoyU4frKrrAIzrKe8v/xud8GhgY5WZtOhYwKEjVHVsC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="21121861"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="21121861"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 02:50:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="913978834"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="913978834"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 02:50:01 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1rfdzC-00000008e4b-0MBF; Thu, 29 Feb 2024 12:49:58 +0200
Date: Thu, 29 Feb 2024 12:49:57 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Yury Norov <yury.norov@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v3 1/3] bits: introduce fixed-type genmasks
Message-ID: <ZeBhVb__VNQCgTQk@smile.fi.intel.com>
References: <20240208074521.577076-1-lucas.demarchi@intel.com>
 <20240208074521.577076-2-lucas.demarchi@intel.com>
 <CAA8EJpprfrtOjNzT6TFhV1n6MXzLdTahanfxcRW4uVjeHaBduA@mail.gmail.com>
 <ZdZlVn9BI-0q1Xdn@smile.fi.intel.com>
 <btssirjumey2kcp5dyhe6m3embdwd5bswjz3c6swrhxfijfhld@lztxaptkegw6>
 <ZddfF7kb54o2c/QR@yury-ThinkPad>
 <3o3nvkg76sofrhgcuogo3wuhitnz3bgus6qzle7pejng3v4s62@frdbuj46uiu7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3o3nvkg76sofrhgcuogo3wuhitnz3bgus6qzle7pejng3v4s62@frdbuj46uiu7>
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

On Wed, Feb 28, 2024 at 05:39:21PM -0600, Lucas De Marchi wrote:
> On Thu, Feb 22, 2024 at 06:49:59AM -0800, Yury Norov wrote:
> > On Wed, Feb 21, 2024 at 03:59:06PM -0600, Lucas De Marchi wrote:
> > > On Wed, Feb 21, 2024 at 11:04:22PM +0200, Andy Shevchenko wrote:
> > > > On Wed, Feb 21, 2024 at 10:30:02PM +0200, Dmitry Baryshkov wrote:
> > > > > On Thu, 8 Feb 2024 at 09:45, Lucas De Marchi <lucas.demarchi@intel.com> wrote:

...

> I build-tested this in x86-64, x86-32 and arm64. I didn't like much the
> need to fork the __GENMASK() implementation on the 2 sides of the ifdef
> since I think the GENMASK_INPUT_CHECK() should be the one covering the
> input checks. However to make it common we'd need to solve 2 problems:
> the casts and the sizeof. The sizeof can be passed as arg to
> __GENMASK(), however the casts I think would need a __CAST_U8(x)
> or the like and sprinkle it everywhere, which would hurt readability.
> Not pretty. Or go back to the original submission and make it less
> horrible :-/

I'm wondering if we can use _Generic() approach here.

...

> > #define GENMASK_INPUT_CHECK(h, l) 0
> > +#define __GENMASK(t, h, l) \
> > +	((~0 - (1 << (l)) + 1) & (~0 >> (BITS_PER_LONG - 1 - (h))))
> 
> humn... this builds, but does it work if GENMASK_ULL() is used in
> assembly? That BITS_PER_LONG does not match the type width.

UL()/ULL() macros are not just for fun.

-- 
With Best Regards,
Andy Shevchenko


