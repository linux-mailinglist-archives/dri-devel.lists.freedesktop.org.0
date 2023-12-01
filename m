Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA26801012
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 17:26:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7401910E10C;
	Fri,  1 Dec 2023 16:26:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF50310E10C;
 Fri,  1 Dec 2023 16:26:27 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="378549819"
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; d="scan'208";a="378549819"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 08:26:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="746062462"
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; d="scan'208";a="746062462"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 08:26:24 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andy@kernel.org>) id 1r96LO-000000012MT-0Y76;
 Fri, 01 Dec 2023 18:26:22 +0200
Date: Fri, 1 Dec 2023 18:26:21 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] drm/i915/dsi: Use devm_gpiod_get() for all GPIOs
Message-ID: <ZWoJLSw2Up_jcuRz@smile.fi.intel.com>
References: <20231201161130.23976-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201161130.23976-1-hdegoede@redhat.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 01, 2023 at 05:11:30PM +0100, Hans de Goede wrote:
> soc_gpio_set_value() already uses devm_gpiod_get(), lets be consistent
> and use devm_gpiod_get() for all GPIOs.
> 
> This allows removing the intel_dsi_vbt_gpio_cleanup() function,
> which only function was to put the GPIO-descriptors.

Fine by me, but I'm not to judge if it is a right approach or not.
In my series I have reused existing call... Anyway, FWIW,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

-- 
With Best Regards,
Andy Shevchenko


