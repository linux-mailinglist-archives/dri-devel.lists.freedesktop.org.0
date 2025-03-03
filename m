Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7691FA4BB08
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 10:44:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 568FA10E3AB;
	Mon,  3 Mar 2025 09:44:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VMM5U53P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C31F10E3AB
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 09:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740995065; x=1772531065;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kmhsLwMr92wvj2tVECupC4kokl7bd6tIGb3uxMKfJE8=;
 b=VMM5U53PGgU1mK4TIncwmAlqkAo8P2voFeFoYNWMAYZjsb5pwBPtqcYd
 FnFZootROl7CpiC0Tkp80BNAKYSHggGfSWMsMgfIzHDnuqgmxHBTEEL6S
 wmpcy4k06tvphB4fJSDbaN6TYlSxZqI/+yG+JJHPSqDVxdukw+p24m0I2
 2L79DyiF/+r6SFjJaQTWSVh1kFSwi+MpR2YNKM09xL6J2NAaIwV3Qn4rq
 6ZUar4jLcPlIRTafG8cU9DYFNK2eCVpAGfP4Dmf3oCu6LvIG4VOHqPfzx
 kJZIwi5kEKwIr3A5jsCGK8L5664u2r4dCtvYvVcbWmYGguDQAAfk5878S A==;
X-CSE-ConnectionGUID: 722eRrhySeCty/5u14Z9sQ==
X-CSE-MsgGUID: hJHmfWRiT5qr7vb4EO4AVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="42053474"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; d="scan'208";a="42053474"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 01:44:24 -0800
X-CSE-ConnectionGUID: ROUhzQPRTdCNvSTFl2lcFA==
X-CSE-MsgGUID: VPLDbsH0QDCXq7V8Ys0EwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; d="scan'208";a="117754741"
Received: from smile.fi.intel.com ([10.237.72.58])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 01:44:22 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tp2LU-0000000Glpd-08fZ; Mon, 03 Mar 2025 11:44:20 +0200
Date: Mon, 3 Mar 2025 11:44:19 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Raag Jadav <raag.jadav@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Cleanup io.h
Message-ID: <Z8V587DSa1VE_BO3@smile.fi.intel.com>
References: <Z8CD33_OWK2LB6IZ@smile.fi.intel.com>
 <0011035a-5816-48c4-9fe4-c0b9db3c8e72@app.fastmail.com>
 <Z8H1Y2_RlFnXeNEa@black.fi.intel.com>
 <Z8IDXD2bkO1t71yB@smile.fi.intel.com>
 <Z8IDgmrLx5DQADxJ@smile.fi.intel.com>
 <Z8IERmwHXUuJoD4S@black.fi.intel.com>
 <Z8IGA821OAgYN-K1@smile.fi.intel.com>
 <Z8IJn7dp4gypnoyz@black.fi.intel.com>
 <Z8Ve1CQQQAz2le0a@smile.fi.intel.com>
 <fa3b2ef5-e2f8-473f-9e9c-c855d70230cf@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa3b2ef5-e2f8-473f-9e9c-c855d70230cf@app.fastmail.com>
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

On Mon, Mar 03, 2025 at 09:31:06AM +0100, Arnd Bergmann wrote:
> On Mon, Mar 3, 2025, at 08:48, Andy Shevchenko wrote:
> > On Fri, Feb 28, 2025 at 09:08:15PM +0200, Raag Jadav wrote:
> >> > > > Ah, you mean devres related?
> >> > > 
> >> > > Yeah, couldn't find it on Arnd's tree and I'm not sure if this series
> >> > > works without it.
> >> > 
> >> > But err.h is included in the io.h, no? Or did I misunderstand the point?
> >> 
> >> First patch on the immutable tag moves IOMEM_ERR_PTR() to err.h and here
> >> we're dropping err.h from io.h. So without the tag this series will probably
> >> break IOMEM_ERR_PTR().
> >
> > I see, I think it might be due to some other includes that make this happen.
> > Whatever, I assume that Arnd heavily tested this anyway, so it's good to go
> > independently on the immutable tag..
> 
> I see that err.h gets included through at least linux/string.h,
> linux/logic_pio.h and (depending on the architecture architectures)
> asm/page.h, so there is no huge risk of something breaking here ;-)
> 
> Ideally all of the above should be removed here, but to do
> it right, the linux/pgtable.h dependency needs to also be replaced
> with a smaller pgprot_t specific one, which takes a bit of
> cross-platform work as the definition is not in a consistent
> place at the moment.
> 
> The change below still builds fine, and that likely indicates
> that the same headers are still included from either asm/io.h
> or asm/pgtable.h on the architectures I'm testing.

Sounds even better. Can you submit a formal patch that other CIs will have
a chance to go through this?

-- 
With Best Regards,
Andy Shevchenko


