Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC8C731D3A
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 17:59:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51C3410E516;
	Thu, 15 Jun 2023 15:59:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C06CE10E0A4;
 Thu, 15 Jun 2023 15:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686844739; x=1718380739;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LZa6EpnGegWMGroiF8gOVmJKRW3LU37iwvOPShYDQxM=;
 b=aKddHE/YMNhF6a60+vvHh62SIskrhPmgDeRdmgblX88K6ACGJtqIhR85
 skV/gvngNnSWBZ0FweAa9YwB2LDWShgFKiG65eXUUxQCiUHecmBqGRNRF
 VqY//J0byS+n5FE3YFWrRV/CXLhpppQyX+ZL/dSWjHHr9mhgtEaRYoBe7
 +iIaX4jL3TBtjgk5U12OrwI/mVlBu8TjICi10HsE2a85+ghaIFMVHOnuR
 zUJEZ03k56STFyaK/dF1PQLf0Lxpitp7qCt5fMZjAi2ENikEeqW1251sT
 QwxBrhJpqkgAVamc6lEpDtwcMy8amgOwCD70Q895CqN+3p0Dv6G9/VwJ+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="356450352"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; d="scan'208";a="356450352"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 08:58:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="715680016"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; d="scan'208";a="715680016"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga007.fm.intel.com with ESMTP; 15 Jun 2023 08:58:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1q9pMo-003yji-0e; Thu, 15 Jun 2023 18:58:34 +0300
Date: Thu, 15 Jun 2023 18:58:33 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 2/3] linux/bits.h: Add fixed-width GENMASK and BIT macros
Message-ID: <ZIs1KQOeunnBeha2@smile.fi.intel.com>
References: <20230509051403.2748545-1-lucas.demarchi@intel.com>
 <20230509051403.2748545-3-lucas.demarchi@intel.com>
 <ZF4fi5B7PPlgZBOI@smile.fi.intel.com>
 <5wfbihhliddinlvsh23dejbuffiz45ecs3wb37qcwyqd3hjfcm@wyhqnobiiu22>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5wfbihhliddinlvsh23dejbuffiz45ecs3wb37qcwyqd3hjfcm@wyhqnobiiu22>
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
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 intel-gfx@lists.freedesktop.org, Kevin Brodsky <kevin.brodsky@arm.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>, Masahiro Yamada <masahiroy@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 12, 2023 at 09:29:23AM -0700, Lucas De Marchi wrote:
> On Fri, May 12, 2023 at 02:14:19PM +0300, Andy Shevchenko wrote:
> > On Mon, May 08, 2023 at 10:14:02PM -0700, Lucas De Marchi wrote:
> > > Add GENMASK_U32(), GENMASK_U16() and GENMASK_U8()  macros to create
> > > masks for fixed-width types and also the corresponding BIT_U32(),
> > > BIT_U16() and BIT_U8().
> > 
> > Why?
> 
> to create the masks/values for device registers that are
> of a certain width, preventing mistakes like:
> 
> 	#define REG1		0x10
> 	#define REG1_ENABLE	BIT(17)
> 	#define REG1_FOO	GENMASK(16, 15);
> 
> 	register_write(REG1_ENABLE, REG1);
> 
> 
> ... if REG1 is a 16bit register for example. There were mistakes in the
> past in the i915 source leading to the creation of the REG_* variants on
> top of normal GENMASK/BIT (see last patch and commit 09b434d4f6d2
> ("drm/i915: introduce REG_BIT() and REG_GENMASK() to define register
> contents")

Doesn't it look like something for bitfield.h candidate?
If your definition doesn't fit the given mask, bail out.

-- 
With Best Regards,
Andy Shevchenko


