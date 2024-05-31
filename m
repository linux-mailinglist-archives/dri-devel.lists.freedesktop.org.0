Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E94408D6854
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 19:44:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0566B10E3FD;
	Fri, 31 May 2024 17:44:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jnTil/6J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 790A510E3FD
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 17:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717177439; x=1748713439;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/Eq6jjMTe5hXojK4Xe9QdTwxwjf55ce8NuTAKC3uO8k=;
 b=jnTil/6JrhZzlASMqklClcMUKB84u2AYAcItXCRCj+lJzwUFE7I90n4L
 Dnie+E8Ujq2m7+NN7BiSWJHul+8jt5piFw+FIxJ9Md9cTBLfkyQ9W5gVe
 Bu6bNivLfzGXW8wN8b3GBQ9Mpry+p2g77CWzF46EVCloDt836hJthJPbF
 tw4i/UBEiFOzze8jOXSAAea9VMWKuSBKgJbNYgMZicU1JoxaZzURNypUD
 q8k4qaKD4ihtiX2hcmo/EzfP4QgcNIrAa54D1NpTFS3q/jmcdwE3rH7Gx
 CA5xFEMEasRmB0wQh8L+n2ctq7UfFT/1UIHtIs5E/NVarHx0Byz5chJ1s Q==;
X-CSE-ConnectionGUID: JVyDeYNHS0WCjT4FD2MDMA==
X-CSE-MsgGUID: GNuswJwFQzmQ14z5v30AHg==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="13855808"
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; d="scan'208";a="13855808"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 10:43:58 -0700
X-CSE-ConnectionGUID: lK8G+GTRTF+gVjFfnTGmJA==
X-CSE-MsgGUID: uim22wo1SxuBhmVGD/DkIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; d="scan'208";a="41307335"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 10:43:51 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sD6I7-0000000CXcT-340d; Fri, 31 May 2024 20:43:47 +0300
Date: Fri, 31 May 2024 20:43:47 +0300
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
Subject: Re: [PATCH v11 09/11] lib: math_kunit: Add tests for new macros
 related to rounding to nearest value
Message-ID: <ZloMU7U1ef1KG3QH@smile.fi.intel.com>
References: <20240531170229.1270828-1-devarsht@ti.com>
 <20240531171628.1306389-1-devarsht@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531171628.1306389-1-devarsht@ti.com>
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

On Fri, May 31, 2024 at 10:46:28PM +0530, Devarsh Thakkar wrote:
> Add tests for round_closest_up/down and roundclosest macros which round
> to nearest multiple of specified argument. These are tested with kunit
> tool as shared here [1].
> 
> [1]: https://gist.github.com/devarsht/3f9042825be3da4e133b8f4eda067876

Make it a tag...

> 

...here

Link: ... [1]

> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>

With the same caveat as per patch 1,
Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


