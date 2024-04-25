Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 256458B24B4
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 17:09:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC38C11A51F;
	Thu, 25 Apr 2024 15:09:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C0LqFtEI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 122C211A51F
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 15:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714057741; x=1745593741;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Lurgw0dvlqu/AllUXoRvG5F3HtkgrU7tdy2p3P/MLYw=;
 b=C0LqFtEI4w9mxOiM3aPzGg3IHTYxNlhIE3z14KeAVxXoCixeQ41bJXRW
 BVlhIVEzJF7jqlP+oA+wkrLlBmnHOpfT3ksWYqmWYJEABf/NkUm6UrdIy
 GEBfQN5a+tCFQ6PJfx/7rtwG91L1arSjIkP3gvhXvs1UzRdYFWbP9Nwau
 LIcyZqMqrHKPJhX3c5/uicljYTcNEhKjIzTGBRZZCRcEjfzgH7Q032l7Q
 lTWnwtoxWawQmPg2tGmXrU6GFABBT7M2JWraHPXGDWGiuidSymSShzT7m
 xpCKrOFU9o2kXHc8m6a4IW+E5IDFFzCM0JzAvbIydKZycZe4FGOnJ8C+4 w==;
X-CSE-ConnectionGUID: m7YhA597TK6zTflEahktXQ==
X-CSE-MsgGUID: vi+pmjqySXGYmkervkWQrw==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="21170743"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="21170743"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 08:09:00 -0700
X-CSE-ConnectionGUID: pnD+ssClQbWbdCTbrEurqQ==
X-CSE-MsgGUID: tr4IzscMRR66iXtWy7wr4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="56041847"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 08:08:58 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1s00iU-000000012EX-0Q6K; Thu, 25 Apr 2024 18:08:54 +0300
Date: Thu, 25 Apr 2024 18:08:53 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v1 0/3] drm/panel: ili9341: Obvious fixes
Message-ID: <ZipyBTyP6bDmu943@smile.fi.intel.com>
References: <20240425142706.2440113-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240425142706.2440113-1-andriy.shevchenko@linux.intel.com>
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

On Thu, Apr 25, 2024 at 05:26:16PM +0300, Andy Shevchenko wrote:
> A few obvious fixes to the driver.

Note, despite the desire of removal Adafruit support from this driver,
the older (read: stable) kernels will need this.

-- 
With Best Regards,
Andy Shevchenko


