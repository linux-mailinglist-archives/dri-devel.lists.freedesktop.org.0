Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DD1A4FA61
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 10:40:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED27110E26A;
	Wed,  5 Mar 2025 09:40:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iDn06RqO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43FE610E26A
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 09:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741167619; x=1772703619;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ltIe6+sX2XLfMhxGQRcdRDD02h9C6oTeIcIfHmw2Kmg=;
 b=iDn06RqO1b6LMEjiwxoNw7N5SRqCqkxBDXqRNk26BOthsJfNCzJMfegC
 tvfn7PB2NJCkDNbJqa92P7s7mOPsrVpe452uCi8mBhy0EREQGRVK8hVLR
 fT66iF8Azp2LOnGaVi5jWBM6Pwup8cM2bZ+0dPaWOy5ir0ZJdp8zsq8mN
 lBbOO9G1EKmggOMcXg+pS3HETqwgyABNRVHCEh29d/yZgqQrQ13wucMCI
 2VQ8qB97IUFDoCSFkfKa8tjaZZHwAC8rEnRzA53BFSVtxibLpiCFV6wAG
 r9oa7rmH7hw3kq78Ev1kxpM2zJytrCb0HU4xzc2u4/0DTWgJSCCrtFoat Q==;
X-CSE-ConnectionGUID: 5DgRh6wdQ3i87FuM0Gm2OQ==
X-CSE-MsgGUID: idIP1I/eR6m2TYDIRAN2ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="29704415"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; d="scan'208";a="29704415"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 01:40:18 -0800
X-CSE-ConnectionGUID: C6OGLUocTKCwmkM/rtbLmA==
X-CSE-MsgGUID: Lsq9q/FbQ5qX8ptOUc2Urw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="149600868"
Received: from smile.fi.intel.com ([10.237.72.58])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 01:40:17 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tplEc-0000000HN5y-1kGx; Wed, 05 Mar 2025 11:40:14 +0200
Date: Wed, 5 Mar 2025 11:40:14 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Avizrat, Yaron" <yaron.avizrat@intel.com>,
 "Elbaz, Koby" <koby.elbaz@intel.com>,
 "Sinyuk, Konstantin" <konstantin.sinyuk@intel.com>
Subject: Re: [PATCH v2 1/1] accel/habanalabs: Switch to use %ptTs
Message-ID: <Z8gb_kzQ7COAUqnB@smile.fi.intel.com>
References: <20250206192109.1133364-2-andriy.shevchenko@linux.intel.com>
 <87jz94y5zs.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jz94y5zs.fsf@intel.com>
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

On Tue, Mar 04, 2025 at 09:01:59PM +0200, Jani Nikula wrote:
> On Thu, 06 Feb 2025, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > Use %ptTs instead of open-coded variant to print contents of time64_t type
> > in human readable form.

...

> > -	char pq_time_str[64] = "N/A", eq_time_str[64] = "N/A";
> 
> The "N/A" gets replaced with, I presume, "1970-01-01 00:00:00" for 0
> timestamps, which is not the same thing.

It's used only in dev_err() below which is why it's fine to update.
Should I mention this in the commit message?

> But I honestly don't know anything about the driver.

-- 
With Best Regards,
Andy Shevchenko


