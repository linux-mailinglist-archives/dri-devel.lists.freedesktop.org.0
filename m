Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 940B8952314
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 22:10:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5760410E0B7;
	Wed, 14 Aug 2024 20:09:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44B4610E0B7
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 20:09:58 +0000 (UTC)
X-CSE-ConnectionGUID: XNXFVnSWSwm34PJJVx+srQ==
X-CSE-MsgGUID: G74HnZcCQbeqoic7dgFPFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="21717738"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="21717738"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 13:09:57 -0700
X-CSE-ConnectionGUID: lehesZ2DRn6EGmfYQhm7uA==
X-CSE-MsgGUID: DKr/xl3zROi7zpSX0ECAtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="63284262"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 13:09:54 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andy@kernel.org>) id 1seKJb-0000000FKIv-43Lk;
 Wed, 14 Aug 2024 23:09:51 +0300
Date: Wed, 14 Aug 2024 23:09:51 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
 Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 0/3] ACPI/video / platform/x86: Add backlight=native
 quirk for Dell OptiPlex 7760 AIO
Message-ID: <Zr0PD5d2bqpikxf_@smile.fi.intel.com>
References: <20240814190159.15650-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814190159.15650-1-hdegoede@redhat.com>
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

On Wed, Aug 14, 2024 at 09:01:56PM +0200, Hans de Goede wrote:
> Hi Rafael,
> 
> 6.10 has a new backlight driver for UART attached backlight controller
> boards found in some Dell All in One models.
> 
> Now the first AIO has turned up which has not only the DSDT bits for this,
> but also an actual controller attached to the UART, yet it is not using
> this controller for backlight control (it needs GPU native control).
> 
> I did not tie the dell-uart-backlight into acpi_video_get_backlight_type()
> yet, so the first 2 patches in this series deal with that and the third
> patch adds a DMI quirk to select native backlight control on top.
> 
> Backlight control used to work on the Dell OptiPlex 7760 AIO with kernel
> 6.9 and older, so this is a regression and I would like to see this
> series merged as fixes for 6.11.
> 
> Rafael, the drivers/platform/x86/dell/dell-uart-backlight.c are small
> and isolated. So I believe it is best if you take the entire series,
> to avoid conflicts if any other drivers/apci/video_detect.c DMI quirks
> show up this cycle.

FWIW,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

I find this quite small and I agree this would be nice to have as fixes.

-- 
With Best Regards,
Andy Shevchenko


