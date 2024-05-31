Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD2A8D684D
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 19:43:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF2710E353;
	Fri, 31 May 2024 17:42:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ezI5Syhq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 631B710E353
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 17:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717177376; x=1748713376;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3KEhrfextvC5rwr5916NhC2mHXO/ytPVGMei+vC/RAg=;
 b=ezI5SyhqB26IuRxOqYfJ+DRbDGcYLyJU1cfz02MXDddGaTqQU08fsEZv
 DxYYrMkkF4kaxK6DcVsRYqg/7H4/JmOqjdOn2nrkv6EMoU/43devXlRh7
 rKq+/vbF0+9mhVFS4skC1eVCYprayyPVwsYc3X0A29QTI6pigOstsUM7r
 JEmNDekhE6OHjmUef28MlSKgZPBYg5AiM8JBtDvI+rK+Xj5No/iAvLZ04
 9Rhxn2isisZngli3C+SJXf35vm+H/s+YU7Cnov8IruQDtPQtle5btdkWD
 MVH3QeqA1jgkKhIhgWKUYOR/LYfMVYupVlkyI7U2dV4NJyQZjbJ23GOgM Q==;
X-CSE-ConnectionGUID: HM48yhGtRxaBELANrMEKJQ==
X-CSE-MsgGUID: fUOdaOAhTwy+85r5d1PLog==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="24307808"
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; d="scan'208";a="24307808"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 10:42:55 -0700
X-CSE-ConnectionGUID: 6CJF/SC+TdyRV/1op7y8+w==
X-CSE-MsgGUID: 1zmOFBwkRO6RzSK5//qJew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; d="scan'208";a="36247877"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 10:42:49 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sD6H8-0000000CXbb-0lgH; Fri, 31 May 2024 20:42:46 +0300
Date: Fri, 31 May 2024 20:42:45 +0300
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
Subject: Re: [PATCH v11 06/11] math.h: Add macros for rounding to closest value
Message-ID: <ZloMFfGKLry6EWNL@smile.fi.intel.com>
References: <20240531170229.1270828-1-devarsht@ti.com>
 <20240531171136.1293905-1-devarsht@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531171136.1293905-1-devarsht@ti.com>
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

On Fri, May 31, 2024 at 10:41:36PM +0530, Devarsh Thakkar wrote:
> Add below rounding related macros:
> 
> round_closest_up(x, y) : Rounds x to closest multiple of y where y is a
> power of 2, with a preference to round up in case two nearest values are
> possible.
> 
> round_closest_down(x, y) : Rounds x to closest multiple of y where y is a
> power of 2, with a preference to round down in case two nearest values are
> possible.
> 
> roundclosest(x, y) : Rounds x to closest multiple of y, this macro should
> generally be used only when y is not multiple of 2 as otherwise
> round_closest* macros should be used which are much faster.
> 
> Examples:
>  * round_closest_up(17, 4) = 16
>  * round_closest_up(15, 4) = 16
>  * round_closest_up(14, 4) = 16
>  * round_closest_down(17, 4) = 16
>  * round_closest_down(15, 4) = 16
>  * round_closest_down(14, 4) = 12
>  * roundclosest(21, 5) = 20
>  * roundclosest(19, 5) = 20
>  * roundclosest(17, 5) = 15

I don't know the estimation on how these will really useful or not, but I'm not
objecting if people think it's needed API.

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


