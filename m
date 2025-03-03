Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91633A4E654
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 17:40:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4D6310E79F;
	Tue,  4 Mar 2025 16:40:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VMM5U53P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from beeline1.cc.itu.edu.tr (beeline1.cc.itu.edu.tr [160.75.25.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C980F10E79F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 16:40:54 +0000 (UTC)
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr
 [10.146.128.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by beeline1.cc.itu.edu.tr (Postfix) with ESMTPS id 5C0A240D974C
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 19:40:53 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Authentication-Results: lesvatest1.cc.itu.edu.tr; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VMM5U53P
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
 by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6hGK0wPmzG3hK
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 19:39:05 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
 id A7D3B42759; Tue,  4 Mar 2025 19:38:54 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b=VMM5U53P
X-Envelope-From: <linux-kernel+bounces-541296-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b=VMM5U53P
Received: from fgw1.itu.edu.tr (fgw1.itu.edu.tr [160.75.25.103])
 by le2 (Postfix) with ESMTP id E53DE4208D
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 12:45:44 +0300 (+03)
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
 by fgw1.itu.edu.tr (Postfix) with SMTP id BD2563064C0C
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 12:45:44 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by am.mirrors.kernel.org (Postfix) with ESMTPS id A7F751893A3A
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 09:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by smtp.subspace.kernel.org (Postfix) with ESMTP id 55CB91F0E5C;
 Mon,  3 Mar 2025 09:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="VMM5U53P"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0511F12F4
 for <linux-kernel@vger.kernel.org>; Mon,  3 Mar 2025 09:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
 arc=none smtp.client-ip=198.175.65.18
ARC-Seal: i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
 t=1740995067; cv=none;
 b=eQJcQBChOmRb49iHNMj967d12MzCZBu0i884+FYbrN0TL5eKskzJzcSFiHWRlbC2jSxUfaN+Gmhr79Gl+YYBg5S+KEIm8y3+3wAODCuAh0ZrdXE3L7+BB330HZOj9/Hh3/m3ehZ17Jo9ZyNOp4mnAdJSf5TRoa0mZttLmzd31dk=
ARC-Message-Signature: i=1; a=rsa-sha256; d=subspace.kernel.org;
 s=arc-20240116; t=1740995067; c=relaxed/simple;
 bh=kmhsLwMr92wvj2tVECupC4kokl7bd6tIGb3uxMKfJE8=;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
 Content-Type:Content-Disposition:In-Reply-To;
 b=P0Hio/YvVKD/APMnKlsmoYbi2ha2gCqIpotUQxMz+O0sVrwsn6U2u5ropQRvEvJjlWKUrOJG5mT9qWLvHoElLsxvb5oo+2WkmUYBSpdVYq0SmacYkvOrbZhS3y8k1hyzbEc7j1RdjoAcTUqxzZYpVNib1s8STEn9PX0ts9qlQNc=
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org;
 dmarc=pass (p=none dis=none)
 header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b=VMM5U53P; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none)
 header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
 spf=none smtp.mailfrom=linux.intel.com
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
X-CSE-ConnectionGUID: 7F2zp2KzSEOJ387DyS4tkg==
X-CSE-MsgGUID: ATVYbiKSQxmsVsA6wdBJNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="42053471"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; d="scan'208";a="42053471"
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
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa3b2ef5-e2f8-473f-9e9c-c855d70230cf@app.fastmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for
 more information
X-ITU-Libra-ESVA-ID: 4Z6hGK0wPmzG3hK
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741711205.35637@IkpRkOFHKszrJtpJEkIy0A
X-ITU-MailScanner-SpamCheck: not spam
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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



