Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A33A8FD7A6
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 22:38:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB26710E0A4;
	Wed,  5 Jun 2024 20:38:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YHRjOEXG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B235C10E0A4
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 20:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717619917; x=1749155917;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UtFaq9d1kpJ8DQqUoLOFUwRaQIOdIk9HC5ouR+pDKUo=;
 b=YHRjOEXGgRw3aG/15PtgE9VG+MOEHEIb1xqdFOgwpxI2JUK84oLwSkid
 O5Ov5ZmyvO26xbcQb2P2DJtXVf9vCIp2UD5nUh8IUo0fsdjRVUmg7N6X4
 VkIutPab10BGOijl3qNAMMMj8foiCQvYYAU448N+FPadOJiJtiDkDL8qb
 6vVlne6zI/gjZBF+QEwylvb3P1XWwxmiqcG/SvQ4zteceWuT4rtvb7/C1
 xs055LwPl3EBwn1QCUoDrIdiPFbM+XPgiBJF4AydR6aAPWsKBLhZ7EM/a
 lsSzG/ELTC6mFov4rAPg8Go3ZNenZpVs7ZF7tBgdIpgq5wwY9aLxLXR/P A==;
X-CSE-ConnectionGUID: qL1r3MRDRwqDbJZUqBq8PQ==
X-CSE-MsgGUID: JDkdfDfeQE23Vv4118M3vw==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="17191680"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="17191680"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 13:38:36 -0700
X-CSE-ConnectionGUID: SNwQ1MAKQz6KzDWJh5pykg==
X-CSE-MsgGUID: mavzrJMCSJOZJ+DgELSarA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="37638936"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 13:38:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sExOx-0000000DxfH-0qnG; Wed, 05 Jun 2024 23:38:31 +0300
Date: Wed, 5 Jun 2024 23:38:30 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v1 1/1] drm/mipi-dbi: Add missing MODULE_DESCRIPTION()
Message-ID: <ZmDMxtDz5aq0xom6@smile.fi.intel.com>
References: <20240425125627.2275559-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240425125627.2275559-1-andriy.shevchenko@linux.intel.com>
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

On Thu, Apr 25, 2024 at 03:56:26PM +0300, Andy Shevchenko wrote:
> The modpost script is not happy
> 
>   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/drm_mipi_dbi.o
> 
> because there is a missing module description.
> 
> Add it to the module.

Any comments on this?

-- 
With Best Regards,
Andy Shevchenko


