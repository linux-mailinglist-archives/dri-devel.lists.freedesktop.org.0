Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 920C18B9687
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 10:33:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDCB610F132;
	Thu,  2 May 2024 08:33:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hEZkC2rp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A655C10F132
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 08:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714638835; x=1746174835;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5tAqrkXFR/y7Phpht4DK8jfnwEPW8WWwj8wA/rkJ4ZM=;
 b=hEZkC2rpyfRr53CXJ9v+M+MeTCdjt8/T1ZpdymGcnGMm4sKMnRVLORnn
 LLqWBDfd17r/gUOKC+a0LTnNRNTwNcBazDVT1oVwu/FwuDtZ1y9J48w9J
 Kj6m2Byf5Eklapi4tpzS0nbNd+wK2Askl/JZNqUrbv86qfTnuoHKVelYk
 rbWnpMnZKmdxp8sPJvcQCMODIzdlFZ3LR+duPLsYPLMo9gnRRp5VxQRmx
 WBa5aXBcYWpZdaUddf28RvnX2JnHgtNUsApdUv06Fn/cxtAxxHlx5vpee
 cxD+XS0+5IpXeuk1BKebJsNJFeo9lb3wR8VdqJDTY41sQXAhcN62eTy+K g==;
X-CSE-ConnectionGUID: Hvqe7H21TqGCUomnSfvRCg==
X-CSE-MsgGUID: anmhN5cbQbGml5yMnC+koQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="10613759"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="10613759"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 01:33:54 -0700
X-CSE-ConnectionGUID: FYJzk8iUSbma7C5vWUjPag==
X-CSE-MsgGUID: er1gI6ykQVeTDYsaZUkwzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="64491261"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 01:33:51 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1s2Rsx-00000003FHv-1uWq; Thu, 02 May 2024 11:33:47 +0300
Date: Thu, 2 May 2024 11:33:47 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v1 0/3] drm/panel: ili9341: Obvious fixes
Message-ID: <ZjNP6xESIuUUDP5d@smile.fi.intel.com>
References: <20240425142706.2440113-1-andriy.shevchenko@linux.intel.com>
 <171463582219.3069182.3806050898196009292.b4-ty@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171463582219.3069182.3806050898196009292.b4-ty@linaro.org>
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

On Thu, May 02, 2024 at 09:43:42AM +0200, Neil Armstrong wrote:
> Hi,
> 
> On Thu, 25 Apr 2024 17:26:16 +0300, Andy Shevchenko wrote:
> > A few obvious fixes to the driver.
> > 
> > Andy Shevchenko (3):
> >   drm/panel: ili9341: Correct use of device property APIs
> >   drm/panel: ili9341: Respect deferred probe
> >   drm/panel: ili9341: Use predefined error codes
> > 
> > [...]
> 
> Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)
> 
> [1/3] drm/panel: ili9341: Correct use of device property APIs
>       https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d43cd48ef1791801c61a54fade4a88d294dedf77
> [2/3] drm/panel: ili9341: Respect deferred probe
>       https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/740fc1e0509be3f7e2207e89125b06119ed62943
> [3/3] drm/panel: ili9341: Use predefined error codes
>       https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/da85f0aaa9f21999753b01d45c0343f885a8f905

Thank you, Neil, appreciated!

-- 
With Best Regards,
Andy Shevchenko


