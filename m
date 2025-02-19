Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E266A3C983
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 21:20:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A045B10E89F;
	Wed, 19 Feb 2025 20:20:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KF7v8j3M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD6D10E88A
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 20:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739996414; x=1771532414;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oUcnF6wLVy+xmj8OVpUmP+faVLotvjxceq1mY3aO/So=;
 b=KF7v8j3MrBe6z91HsCBVNHa9tXQ0MH18geaQwBsxUpBxVEL5iEuE0sRU
 /kJq0qHLyMmat5trrkfCyCWkZqF4DwBaWyavB4s+Pm3/1pJSWiomD/72B
 MwYpfmaUyHEK6y5hiji1fkHyEw3Fz76S0sDJyfhQgCyVcycZHKARbGyJl
 xHLMedSRbKbUN4ourjD3FUAHeg2JoOmCCGM5kzwh78ygzR/vmVjDG2PS5
 FagnbigGQgrMYiZ4SGy2uma5FNWQryCkPo7hDGjrVxKixW20aToTx20Rd
 TZIHSXwxPPwZ73+sEuhLpCh75qM0V3yCP88Yoj3aK+tKcUVYmFGLUFvZA w==;
X-CSE-ConnectionGUID: uNFBkooAT3yjNfdXGib+GA==
X-CSE-MsgGUID: gSJXuQTPS06KxTDsg7es3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="50966658"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="50966658"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 12:20:13 -0800
X-CSE-ConnectionGUID: pBlNVsujSvyr6QenP15SOg==
X-CSE-MsgGUID: Nq+u8uC3QQy+wHa6XfpUhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="115020364"
Received: from smile.fi.intel.com ([10.237.72.58])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 12:20:08 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tkqY8-0000000D7d9-2wZe; Wed, 19 Feb 2025 22:20:04 +0200
Date: Wed, 19 Feb 2025 22:20:04 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Pavel Machek <pavel@ucw.cz>,
 Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
 oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-leds@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mfd: lm3533: convert to use OF
Message-ID: <Z7Y89AI8me_MFsEV@smile.fi.intel.com>
References: <20250218132702.114669-3-clamor95@gmail.com>
 <202502192343.twEQ3SSs-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202502192343.twEQ3SSs-lkp@intel.com>
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

On Thu, Feb 20, 2025 at 12:02:51AM +0800, kernel test robot wrote:
> Hi Svyatoslav,
> 
> kernel test robot noticed the following build errors:

It a second time you send not even compiled code.

-- 
With Best Regards,
Andy Shevchenko


