Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D02A9A3242E
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 12:02:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4040A10E850;
	Wed, 12 Feb 2025 11:02:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gf+XzD4E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C5A10E854
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 11:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739358171; x=1770894171;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=z16+7ZEO5MVrgvOcxr9QCLuQ0Xfo1ReUAEntw8k1gTQ=;
 b=Gf+XzD4E9lzz75TiAVTwmcFcmAQuaSlosz9fF8NBRgR+rszCb61aNv7s
 1Fz0qT1UuCHTJunjw74DAXyArPurjyCaD9LFopA3Z4s65IRsWyP1HnmMC
 UedQnHADkYwoMMiEVH32S0BEIhVbWtZxDmGJOLGXZdtoU18bLrd155xk1
 p0jI5k8PeBdV1RgjWKDW7s0HLBTk2/q5Lnf/6Om62ZuonqVCoBmgiwwNO
 v6G+yPxeqkz2mOohIRJwUQ1oftOk3U1+DtPpluxPunJ9y1txoG17TWWWl
 RVxXgMWrKgq4+KLzfpVpHqOcT/61/n/QGMduKsE4m6aHisO6rIeQ0rgJa A==;
X-CSE-ConnectionGUID: YF3Nwo+tRi2UE303+UrSrw==
X-CSE-MsgGUID: gfWUvbwBRUu3/KVwyV+m8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51440572"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="51440572"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 03:02:50 -0800
X-CSE-ConnectionGUID: Iw9B5/mHTA+bafJ9LL2sLw==
X-CSE-MsgGUID: D6MTUzZTQOe7UHDcpwl/+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112644578"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 03:02:43 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tiAVt-0000000AoPx-3ob7; Wed, 12 Feb 2025 13:02:41 +0200
Date: Wed, 12 Feb 2025 13:02:41 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Pavel Machek <pavel@ucw.cz>,
 Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-leds@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v1 0/2] mfd: lm3533: convert to use OF
Message-ID: <Z6x_0Q_FOF6Hz5I3@smile.fi.intel.com>
References: <20250212075845.11338-1-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212075845.11338-1-clamor95@gmail.com>
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

On Wed, Feb 12, 2025 at 09:58:40AM +0200, Svyatoslav Ryhel wrote:
> Add schema and add support for lm3533 mfd to use device
> tree bindings.

Thank you! I'm going to review the series this week, I definitely have
the comments. Stay tuned.

-- 
With Best Regards,
Andy Shevchenko


