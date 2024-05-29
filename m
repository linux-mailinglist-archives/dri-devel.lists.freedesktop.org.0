Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6DF8D3971
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 16:35:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03ACA10EAB4;
	Wed, 29 May 2024 14:35:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XZrqbekS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC8DB10EAB4
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 14:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716993326; x=1748529326;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DGQ2MiJt8VADMRRzcCTAtGDh88V5+BK2CV2kjEWYnw8=;
 b=XZrqbekSjv0EsSZOdOAfqeEmRgvESTXXLae+Imtnicqpat5FKPNxdV+t
 /bd5y/0jbt+HEzX2gCfjtpTEpi1jedzJuKEI8SXYmTjgSGIZC52JAPqme
 wHXeH3kgh6auKJ7Zxr+oJoSrhy3yLv8QuwQ+9To9tJ4A28QqecPVgr8pF
 wn4REE2vmzFWXmnyCrf76ArweDu9rnrVWAp82BCg82IHMjsvd9Yo5mi0M
 Q2bUJRwpnkGAj8K1w4i7EArRR8qcakHw/+k3VKrlQdEjd9/gGtFrUNUhz
 upu5pfphF33LWgurhcqnU/wzv+TQmzfTjfEyPgj79q0Vab889IHSU6XSr A==;
X-CSE-ConnectionGUID: 72xW+uRbToOg/FIV9U2p/Q==
X-CSE-MsgGUID: CyMjAZS1TvmHiSt00YDxRg==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="17231217"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="17231217"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 07:35:26 -0700
X-CSE-ConnectionGUID: UYPNIogpT1S/XknKS3BvmQ==
X-CSE-MsgGUID: gXaxtfI4QfaIkMCJdaDf4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="35540351"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 07:35:20 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sCKOZ-0000000BpWl-3Oav; Wed, 29 May 2024 17:35:15 +0300
Date: Wed, 29 May 2024 17:35:15 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.gaignard@collabora.com, sebastian.fricke@collabora.com,
 akpm@linux-foundation.org, gregkh@linuxfoundation.org,
 adobriyan@gmail.com, jani.nikula@intel.com, p.zabel@pengutronix.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com, praneeth@ti.com, nm@ti.com,
 vigneshr@ti.com, a-bhatia1@ti.com, j-luthra@ti.com, b-brnich@ti.com,
 detheridge@ti.com, p-mantena@ti.com, vijayp@ti.com,
 andrzej.p@collabora.com, nicolas@ndufresne.ca, davidgow@google.com,
 dlatypov@google.com
Subject: Re: [PATCH v9 07/10] lib: add basic KUnit test for lib/math
Message-ID: <Zlc9I4H2u0TQC95X@smile.fi.intel.com>
References: <20240526175655.1093707-1-devarsht@ti.com>
 <20240526180933.1126116-1-devarsht@ti.com>
 <ZlTu_9orsuosNiGk@smile.fi.intel.com>
 <ZlTvLS8oTPcvZKQN@smile.fi.intel.com>
 <9c88bc47-35f0-86ed-2df7-dd83640d9997@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c88bc47-35f0-86ed-2df7-dd83640d9997@ti.com>
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

On Tue, May 28, 2024 at 05:01:31PM +0530, Devarsh Thakkar wrote:
> On 28/05/24 02:08, Andy Shevchenko wrote:
> > On Mon, May 27, 2024 at 11:37:20PM +0300, Andy Shevchenko wrote:
> >> On Sun, May 26, 2024 at 11:39:33PM +0530, Devarsh Thakkar wrote:

...

> >>> +MODULE_LICENSE("GPL");
> >>
> >> modpost validator won't be happy about this, i.e. missing MODULE_DESCRIPTION().
> > 
> > And obviously + module.h in the inclusion block.
> 
> The module.h is already included under include/kunit/test.h and that's the
> reason compiler did not give any error. But I can still include it under
> math.h for better readability as you suggested as anyway compiler will not
> re-include if already included by another header file.

Please do as it will be in line with IWYU principle.

> Also I see we were missing a dependency between math_kunit and kunit modules,
> so adding a dependency there too.

Thank you.

-- 
With Best Regards,
Andy Shevchenko


