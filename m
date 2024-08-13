Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABCF950387
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 13:23:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD1DC10E2E1;
	Tue, 13 Aug 2024 11:23:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IjkQFRO0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BE6510E2E1;
 Tue, 13 Aug 2024 11:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723548202; x=1755084202;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/UJoSeNq4Z69OVheBJmypYp4ovP53kxbHryvRHxEXXE=;
 b=IjkQFRO0diQCPxoWmz+sJYH4GHlYusbB24YP7DhtI9TaQVZ3LJkOiAJ9
 +ZmUhDFIv5pJO8osUc2yv1JOwvkJrpYF2jDDgjm8yxh0bTkT1CvWDkuiO
 JafihfoyZC2gPUp6WLodDSNqdmLlrnsujVA3J32lNKalAaUmL2BqiBFcx
 FUZNGo6yBf/9/WpvuYRSH0FGNmyEhm2R9FvAW8TXqJNYRZLQG7r6s/VnF
 OA8Hm5gpfXe5Qbh61MF7kT0ymoEn4mT7fy/CIIq/TEIh0hstogzzpaMG4
 InjHJCb2jxriMCCZHp18pMZutC6fN8UjLcEywMsugQGlo8IMVmoiG+gij w==;
X-CSE-ConnectionGUID: LsPeCrwPToSe0Jt2d8qP1g==
X-CSE-MsgGUID: v+14tcBNTWuKp1X8qLJsxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21872582"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="21872582"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 04:23:21 -0700
X-CSE-ConnectionGUID: jEhCf8CZR9OXK4P7V66CjQ==
X-CSE-MsgGUID: 6Ewi4twyQ42M8kTCgOLFYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="63496347"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 04:23:17 -0700
Date: Tue, 13 Aug 2024 14:23:13 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com,
 daniel@ffwll.ch, linux@roeck-us.net, andi.shyti@linux.intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 anshuman.gupta@intel.com, badal.nilawar@intel.com,
 riana.tauro@intel.com, ashutosh.dixit@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v4] drm/i915/hwmon: expose fan speed
Message-ID: <ZrtCIU8On4ZKILmh@black.fi.intel.com>
References: <20240809061525.1368153-1-raag.jadav@intel.com>
 <ZrYB-GI9L2RSc2bt@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZrYB-GI9L2RSc2bt@smile.fi.intel.com>
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

On Fri, Aug 09, 2024 at 02:48:08PM +0300, Andy Shevchenko wrote:
> On Fri, Aug 09, 2024 at 11:45:25AM +0530, Raag Jadav wrote:
> 
> > +	/*
> > +	 * HW register value is accumulated count of pulses from
> > +	 * PWM fan with the scale of 2 pulses per rotation.
> > +	 */
> > +	rotations = pulses >> 1;
> 
> In accordance with the comment the
> 
> 	rotations = pulses / 2;
> 
> looks better.

This change seems to cause a build error in v5.
Something to do with __udivdi3 on i386.

Should we revert back to shift?

Found something similar here,
drivers/target/target_core_xcopy.c +697

Raag
