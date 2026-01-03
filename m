Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA16CEFFF3
	for <lists+dri-devel@lfdr.de>; Sat, 03 Jan 2026 14:16:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5146810E352;
	Sat,  3 Jan 2026 13:16:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tn54qzrn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1AFD10E355
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Jan 2026 13:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767446158; x=1798982158;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=T1meHIE3kNQ1z03ZzqxoD5qsWYeE0kujZCxSwuYVgbA=;
 b=Tn54qzrnO6CcAJYO87CNQGjVT39w5hgJr5yPxKuWDb7OaPxgJE5NcZnP
 +fuSuScLc9NmjEZrb2Z/3E6IDe/bGuFors0ye3q4wW403IWGgaWkfZ8Fy
 7JO3m/XMGgL8g2v/8NNWaoNNCSmpHO7qjLfEVCM4utGZS6m+LFvep6jGW
 5CRnliSqDB0yORcXqBhCP9fG5E3OR2gIxC0vose6Myr3m8GepJP3cZoCA
 BdeQFqZdawh6nNUt7733JRIyl0kqPxwHS05IS6AU0Q7m5tI8RDT9H/3IX
 b1/LFSMbeIpFGq2XeM8VQrbtJmrcJYZF5ByYxm1zyWXOLK07YGNfkUtMp w==;
X-CSE-ConnectionGUID: 1l6/lt3pR7ypFIOda2fNxA==
X-CSE-MsgGUID: 4aoCOXbGTkODnmDAC4/0cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="79618392"
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; d="scan'208";a="79618392"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2026 05:15:58 -0800
X-CSE-ConnectionGUID: SXduwwDzS2ymGuu/a19Lsw==
X-CSE-MsgGUID: tTYV2PBmQGGnZKJ37j/26A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; d="scan'208";a="201636735"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.75])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2026 05:15:56 -0800
Date: Sat, 3 Jan 2026 15:15:54 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Helge Deller <deller@gmx.de>
Cc: Chintan Patel <chintanlike@gmail.com>, Helge Deller <deller@kernel.org>,
 andy <andy@kernel.org>, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 4/4] fbdev: sh_mobile_lcdc: Make FB_DEVICE dependency
 optional
Message-ID: <aVkWigAQWC1dZBAv@smile.fi.intel.com>
References: <20251230052827.4676-1-chintanlike@gmail.com>
 <20251230052827.4676-5-chintanlike@gmail.com>
 <aVOJovo-k6-0KnVg@carbonx1>
 <aa2b08f8-e6c3-4768-bce9-e36ad9d1e74b@gmail.com>
 <73007a0a-dd96-43eb-be2e-ccbf8b19cd79@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <73007a0a-dd96-43eb-be2e-ccbf8b19cd79@gmx.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
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

On Sat, Jan 03, 2026 at 10:59:44AM +0100, Helge Deller wrote:
> On 12/30/25 19:25, Chintan Patel wrote:
> > On 12/30/25 00:13, Helge Deller wrote:

...

> > > > -ATTRIBUTE_GROUPS(overlay_sysfs);
> > > 
> > > Instead of replacing the ^ ATTRIBUTE_GROUPS() by the code below,
> > > isn't it possible to just mark the overlay_sysfs_attrs[] array
> > > _maybe_unused, and just do:
> > > + #ifdef CONFIG_FB_DEVICE
> > > + ATTRIBUTE_GROUPS(overlay_sysfs);
> > > + #endif
> > > 
> > > ?
> > 
> > Yes, the __maybe_unused + #ifdef ATTRIBUTE_GROUPS() approach would work.
> > 
> > I went with the PTR_IF(IS_ENABLED()) pattern because Andy suggested
> > using PTR_IF() to conditionally include overlay_sysfs_group in
> > overlay_sysfs_groups, and to keep .dev_groups always populated while
> > letting the device core skip NULL groups. This avoids conditional
> > wiring via #ifdef and keeps the code type-checked without
> > CONFIG_FB_DEVICE.
> > If you still prefer the simpler #ifdef ATTRIBUTE_GROUPS() approach
> > for this driver, I can switch to that, but I wanted to follow Andy’s
> > guidance here.
> 
> I assume Andy will agree to my suggested approach, as it's cleaner
> and avoids code bloat/duplication. Maybe you send out a v4 with my
> suggested approach, then it's easier to judge... ?

I'm also fine with original code. But a suggested approach would work as well
(at least like it sounds from the above description). Ideally would be nice to
get rid of ifdeffery completely (that's why we have PTR_IF() for), although
it might be not so readable. TL;DR: the most readable solution is the winner.

-- 
With Best Regards,
Andy Shevchenko


