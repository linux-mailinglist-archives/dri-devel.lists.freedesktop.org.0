Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C458B1021
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 18:45:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF2C3112F5A;
	Wed, 24 Apr 2024 16:45:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lydYpDxM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 649FE112F5A
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 16:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713977121; x=1745513121;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=eghjSdHfDXmpKj6KcfaxUt06aiUtkhlI0/hSTgy5dp8=;
 b=lydYpDxMrfgmYFZDTuQnvs0dx0twIksc7V3fRqryp92FJFn6LRSuYSmx
 mivJ6L00QorrOWL94W/LOyvMSLupeMyq+2EFzJPaiZ7WGJCYLteG47cWC
 BhRKfSnlfyLhG+ugkDuRizGy9KIF1tKFl6ob5Q/1fROX83lJaluyHemCy
 JE040Pj725Zur5DR4LCcJh+KI8y+0xDfC/d6e+bp6WqpQ8fHhXk4X5HSp
 VPQMC5JLjJW1BVRwDMhw382VVe/rqMBXfVcSarGkn7+OMRHO8Vdsc0hV8
 7sMoSw2HOPZLlnj5U3tvD2ALmGcR9n7OlzOz5F0EtvmfqN/bFCxqaP84G A==;
X-CSE-ConnectionGUID: eDDEYciATjSD5TO6pSBfCg==
X-CSE-MsgGUID: lVnlvmIzR7SMV56ZTc7Osg==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9787503"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="9787503"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 09:45:04 -0700
X-CSE-ConnectionGUID: XVrT5SFuTemAEufu8IGP8A==
X-CSE-MsgGUID: 9S4Pniz5RdS1kWMPMW6MNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="24725565"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 09:44:54 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1rzfjm-00000000ia8-3AYP; Wed, 24 Apr 2024 19:44:50 +0300
Date: Wed, 24 Apr 2024 19:44:50 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sui Jingfeng <sui.jingfeng@linux.dev>, dri-devel@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v2] software node: Implement device_get_match_data fwnode
 callback
Message-ID: <Zik3AjiWkytSVn-1@smile.fi.intel.com>
References: <20240422164658.217037-1-sui.jingfeng@linux.dev>
 <Zie3ebHOEpWHj1qV@smile.fi.intel.com>
 <d5bc1e73-a553-451e-ab74-f5f0ca259c6b@linux.dev>
 <hcltp2bbxxg2t7ibmzgiib7mgbwgmvzwnnq6mochdh7c4h76r3@bxj6yk5zq64e>
 <ZikE4qOVO7rgIs9a@smile.fi.intel.com>
 <CAA8EJpr1FSjizAh6Dp5Bmux3NrGYh=BfHFL4D1fa87Og4ymY0w@mail.gmail.com>
 <Zikck2FJb4-PgXX0@smile.fi.intel.com>
 <kucey3jsydjye3ndflns3cqolcpizhnxgzz3fkmcatlnpbnwrk@22ulsqfh2vf6>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <kucey3jsydjye3ndflns3cqolcpizhnxgzz3fkmcatlnpbnwrk@22ulsqfh2vf6>
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

On Wed, Apr 24, 2024 at 07:34:54PM +0300, Dmitry Baryshkov wrote:
> On Wed, Apr 24, 2024 at 05:52:03PM +0300, Andy Shevchenko wrote:
> > On Wed, Apr 24, 2024 at 04:34:39PM +0300, Dmitry Baryshkov wrote:
> > > On Wed, 24 Apr 2024 at 16:11, Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Wed, Apr 24, 2024 at 12:37:16AM +0300, Dmitry Baryshkov wrote:
> > > > > On Wed, Apr 24, 2024 at 12:49:18AM +0800, Sui Jingfeng wrote:
> > > > > > On 2024/4/23 21:28, Andy Shevchenko wrote:
> > > > > > > On Tue, Apr 23, 2024 at 12:46:58AM +0800, Sui Jingfeng wrote:

...

> > > > > But let me throw an argument why this patch (or something similar) looks
> > > > > to be necessary.
> > > > >
> > > > > Both on DT and non-DT systems the kernel allows using the non-OF based
> > > > > matching. For the platform devices there is platform_device_id-based
> > > > > matching.
> > > > >
> > > > > Currently handling the data coming from such device_ids requires using
> > > > > special bits of code, e.g. platform_get_device_id(pdev)->driver_data to
> > > > > get the data from the platform_device_id. Having such codepaths goes
> > > > > against the goal of unifying DT and non-DT paths via generic property /
> > > > > fwnode code.
> > > > >
> > > > > As such, I support Sui's idea of being able to use device_get_match_data
> > > > > for non-DT, non-ACPI platform devices.
> > > >
> > > > I'm not sure I buy this. We have a special helpers based on the bus type to
> > > > combine device_get_match_data() with the respective ID table crawling, see
> > > > the SPI and I²C cases as the examples.
> > > 
> > > I was thinking that we might be able to deprecate these helpers and
> > > always use device_get_match_data().
> > 
> > True, but that is orthogonal to swnode match_data support, right?
> > There even was (still is?) a patch series to do something like a new
> > member to struct device_driver (? don't remember) to achieve that.
> 
> Maybe the scenario was not properly described in the commit message, or
> maybe I missed something. The usecase that I understood from the commit
> message was to use instatiated i2c / spi devices, which means
> i2c_device_id / spi_device_id. The commit message should describe why
> the usecase requires using 'compatible' property and swnode. Ideally it
> should describe how these devices are instantiated at the first place.

Yep. I also do not clearly understand the use case and why we need to have
a board file, because the swnodes all are about board files that we must not
use for the new platforms.

-- 
With Best Regards,
Andy Shevchenko


