Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 751038C4193
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 15:14:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B3010E06D;
	Mon, 13 May 2024 13:14:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HTAifjR8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60D7010E06D
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 13:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715606055; x=1747142055;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fZPA2U0w/NaPd1XPXrH9KUPReWy8Mu/+vRwHo8Emv3A=;
 b=HTAifjR8rlutgfCDh22fQkiJbeyODvI8uAWfUVsVPT1OL4IsnP/Ncv33
 jObe8GTaCmwILV8mXsrasEPbd/ehHtXOfLqL1ZVTkPQ3kK8acRV8f22pt
 uaUyiJamNbRCBTaEapsY3spv0BwmzY0XTOUMY+AQGx7W5U3eo5K1Iq9pE
 4SbOQGPkq0Ej+SHVQYyVWqhiMPzeoH7Gg9Cr0OWSwWdj/8gAym9RCFTI1
 u6ti0+JSNIKKGjRPR29vYn5eomQbmqgb6/QL+5qjfLL8GDBgcgCW47u9l
 XpwUAn28xoulJKD0IPXI4nEN7kG7B8KJ5CSNyYs1FNZ/CEKh9wQMP7dWI Q==;
X-CSE-ConnectionGUID: DkGt/0FxSCK4kLdGLUZqow==
X-CSE-MsgGUID: ri29Zxs2RQS2zaUrY2AZVA==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11390407"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="11390407"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 06:14:14 -0700
X-CSE-ConnectionGUID: HrSYo+lVRL2UPrBM1JzUzw==
X-CSE-MsgGUID: AhNYnZ1gQ/y065zn5CRwig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="30456394"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 06:14:08 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1s6VVE-000000078wG-0cig; Mon, 13 May 2024 16:14:04 +0300
Date: Mon, 13 May 2024 16:14:03 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: Jani Nikula <jani.nikula@intel.com>, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, benjamin.gaignard@collabora.com,
 sebastian.fricke@collabora.com, akpm@linux-foundation.org,
 gregkh@linuxfoundation.org, adobriyan@gmail.com,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
 praneeth@ti.com, nm@ti.com, vigneshr@ti.com, a-bhatia1@ti.com,
 j-luthra@ti.com, b-brnich@ti.com, detheridge@ti.com,
 p-mantena@ti.com, vijayp@ti.com, andrzej.p@collabora.com,
 nicolas@ndufresne.ca
Subject: Re: [PATCH v7 6/8] math.h Add macros to round to closest specified
 power of 2
Message-ID: <ZkISG6p1tn9Do-xY@smile.fi.intel.com>
References: <20240509183952.4064331-1-devarsht@ti.com>
 <Zj42vTpyH71TWeTk@smile.fi.intel.com> <87fruphf55.fsf@intel.com>
 <5ebcf480-81c6-4c2d-96e8-727d44f21ca9@ti.com>
 <ZkHWbS4raU_BPlpm@smile.fi.intel.com>
 <6557050e-6b18-2628-cbab-1a811b2190ba@ti.com>
 <ZkIG0-01pz632l4R@smile.fi.intel.com>
 <d63ae19c-9316-3a4c-e9ed-1672ace068b6@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d63ae19c-9316-3a4c-e9ed-1672ace068b6@ti.com>
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

On Mon, May 13, 2024 at 06:34:19PM +0530, Devarsh Thakkar wrote:
> On 13/05/24 17:55, Andy Shevchenko wrote:
> > On Mon, May 13, 2024 at 04:55:58PM +0530, Devarsh Thakkar wrote:
> >> On 13/05/24 14:29, Andy Shevchenko wrote:
> >>> On Sat, May 11, 2024 at 11:11:14PM +0530, Devarsh Thakkar wrote:
> >>>> On 10/05/24 20:45, Jani Nikula wrote:

[...]

> > - align naming (with the existing round*() macros)
> 
> I think round_closest_up/round_closest_down align already and inspired by the
> existing naming convention used for round*() and DIV_ROUND_CLOSEST() macros in
> math.h as explained below (copied from my previous reply [1])
> 
> "Coming back to naming, this is as per existing convention used for naming
> round_up, round_down (notice the `_` being used for macros working with pow of
> 2) and DIV_ROUND_CLOSEST (notice the work `closest` used to specify the answer
>  to be nearest to specified value)"
> 
> But do let me know if you have any other suggestions for naming?

Just make sure that semantically the naming is aligned, that's it.
If you think it's already done that way, fine!

-- 
With Best Regards,
Andy Shevchenko


