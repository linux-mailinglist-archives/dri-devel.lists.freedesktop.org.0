Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92154CFE857
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 16:17:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0373F10E609;
	Wed,  7 Jan 2026 15:17:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i/l3QeYU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D22210E609
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 15:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767799022; x=1799335022;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=I2Zaa2iNkRHyunAJME9kRaq92t0pbT4Z0Uzi0j1sD6Q=;
 b=i/l3QeYUTg+FBUhHDNV0u/mCiFZov8w8IRwIJ+po9UBwb5nPt1jVo0j+
 T/t2rzaTNjWdN0WiFbLjKKcWbuVe6O3BLOZigpVPeSmrX9uIWjA/EANlD
 6O8wnTdZvKhEuX4ILlx4J8hHcLepX5rDrW4NvSI8/XNppMTKAuL0jY14U
 EZoAkH/TtItUxLqyWdCrMvC7aVQBBMrPLsssIbxCgCtCMzxr5xR4VTZch
 AfQuc0H9HE/LRleH2oIiV9Ou06OAnofukgXn5nFpzNxkR3MdSTo+XLv94
 235FndlqJ8Le8P+4EQYCl9ZUMOTVwk/aehQTJj6UPIN/oYqLlP4lSwkzO g==;
X-CSE-ConnectionGUID: VOu3JK9MT4iVcUNWo6zT7g==
X-CSE-MsgGUID: l7MM2sYdQHKrruTKGleOPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="69220240"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="69220240"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 07:17:01 -0800
X-CSE-ConnectionGUID: GvHOTgggQweSSjr8NaJn2Q==
X-CSE-MsgGUID: W3I1JoekQ0KpoF1sJeEycw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="234095069"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.168])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 07:16:58 -0800
Date: Wed, 7 Jan 2026 17:16:56 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Chintan Patel <chintanlike@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 andy@kernel.org, deller@gmx.de, gregkh@linuxfoundation.org
Subject: Re: [PATCH v4 2/4] staging: fbtft: Make FB_DEVICE dependency optional
Message-ID: <aV546KdXG8KotqKj@smile.fi.intel.com>
References: <20260107044258.528624-1-chintanlike@gmail.com>
 <20260107044258.528624-3-chintanlike@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107044258.528624-3-chintanlike@gmail.com>
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

On Tue, Jan 06, 2026 at 08:42:55PM -0800, Chintan Patel wrote:
> fbtft provides sysfs interfaces for debugging and gamma configuration,
> but these are not required for the core driver.
> 
> Drop the hard dependency on CONFIG_FB_DEVICE and make sysfs support
> optional by using dev_of_fbinfo() at runtime. When FB_DEVICE is disabled,
> sysfs operations are skipped while the code remains buildable and
> type-checked.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


