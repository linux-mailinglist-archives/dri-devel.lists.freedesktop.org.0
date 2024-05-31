Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAED8D6803
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 19:17:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A36AD10E77B;
	Fri, 31 May 2024 17:17:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OODXxsxA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF74010E6F4
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 17:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717175833; x=1748711833;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pV7oAwTBKTVDmPHen2NjZDaq5YMb1OZC6KpxCLdG8wc=;
 b=OODXxsxALXI6j3rpPlVpJEYoI8v1q5K/jQ22egarfGqTzBE/FrmbtmEc
 1JInwZdc8FzeNen1T097LUSiufvLP2SvYMnqNefvsgqBOUtpo5gq3x/jd
 A6HdHGi1V+Qi9u/n0nP7W31i1Fg/ZW7hHvpxT0b2NTwyXSKuqZ3c0mISB
 G0tZ+aHUQHuIgqAyah09h3CKOZ1ewnNheTdobP8A+Ut22Rx6m4buUUutF
 jUSq5ie/CRJzB2AqkA5bAPaIMu7l4IJL3NTgOrQv/KbVzS6E6Kf+KcnXf
 LDsBnayZD+mW1dwvKwuNKvXTiZOHYyu4Ep/6g7nqLEzVIZ2wiRQAHJ2MZ w==;
X-CSE-ConnectionGUID: I/dgdXHnRKC19xoAZKUo/Q==
X-CSE-MsgGUID: HL8HR651T7+xzVhSB5lpMA==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="13852807"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="13852807"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 10:17:12 -0700
X-CSE-ConnectionGUID: W8KdS40vTBaV8suge3taNw==
X-CSE-MsgGUID: 71sElCbDTB+wsvrIVyTAvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; d="scan'208";a="36306260"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 10:17:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sD5sH-0000000CX16-2DQP; Fri, 31 May 2024 20:17:05 +0300
Date: Fri, 31 May 2024 20:17:05 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lee Jones <lee@kernel.org>
Cc: johan@kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-leds@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Pavel Machek <pavel@ucw.cz>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Johan Hovold <jhovold@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 0/4] lm3533: Remove the outdated drivers
Message-ID: <ZloGEY7qa3lPs_HH@smile.fi.intel.com>
References: <20240531170844.1595468-1-andriy.shevchenko@linux.intel.com>
 <20240531171425.GE1204315@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531171425.GE1204315@google.com>
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

On Fri, May 31, 2024 at 06:14:25PM +0100, Lee Jones wrote:
> Making sure Johan is aware of this with his new address.

Right, in any case this is not the final version (a couple of leftovers).
I have mentioned this series in the original thread.

-- 
With Best Regards,
Andy Shevchenko


