Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5633F95843D
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 12:23:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E2C210E6CB;
	Tue, 20 Aug 2024 10:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OLWVkPJB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E123910E6CA;
 Tue, 20 Aug 2024 10:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724149423; x=1755685423;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Mh4/fpGN5ZPUpaPzZDGUGUsQfXLGPzN6NmUqzUNDJwk=;
 b=OLWVkPJB16nlj2bYQ3x+Z+2HFIwyLidbC/YabvlZpTvfGuMxFsMSWn1z
 YSAbxXWHP+P/lgr0wf9TIKrdP04mGwXd3AUJ2plOUWBziwEOwqa3kpAvy
 bsB7YXq9P+DHEkNupVx9682n18YciUIAwC3oYCMHOJrjleajhj9DDvUiy
 4sC8r4b2QFe2o2Q4jX60ib9DrN2kJDjZUfvcvMYXTNQUeyjIFbx7W3Tlz
 kZ2TdTB8YWz9hcl7QbuJX3qeDBZ8G97JmOKijtjavlulABIxkUIRnpXFP
 1DaAe3/b+zFncdOLD5MWUlIfXyHWqAF1TcUYYdrO+4scTBl3jTxs8LHGG w==;
X-CSE-ConnectionGUID: weau7bZqRXaorUfcRkR++A==
X-CSE-MsgGUID: MVpk1XYqR8uAogE/Pr+jPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="33010724"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="33010724"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 03:23:43 -0700
X-CSE-ConnectionGUID: c3zLvXOXTCq7yKaRKRxwWg==
X-CSE-MsgGUID: K+l7Nfd8RU2adZ/vrTeYEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="65642325"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 03:23:39 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sgM1X-0000000HGJy-1vnR; Tue, 20 Aug 2024 13:23:35 +0300
Date: Tue, 20 Aug 2024 13:23:35 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com,
 daniel@ffwll.ch, linux@roeck-us.net, andi.shyti@linux.intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 anshuman.gupta@intel.com, badal.nilawar@intel.com,
 riana.tauro@intel.com, ashutosh.dixit@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v6] drm/i915/hwmon: expose fan speed
Message-ID: <ZsRup8uKiqUvADFl@smile.fi.intel.com>
References: <20240820062010.2000873-1-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820062010.2000873-1-raag.jadav@intel.com>
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

On Tue, Aug 20, 2024 at 11:50:10AM +0530, Raag Jadav wrote:
> Add hwmon support for fan1_input attribute, which will expose fan speed
> in RPM. With this in place we can monitor fan speed using lm-sensors tool.
> 
> $ sensors
> i915-pci-0300
> Adapter: PCI adapter
> in0:         653.00 mV
> fan1:        3833 RPM
> power1:           N/A  (max =  43.00 W)
> energy1:      32.02 kJ

> v2: Handle overflow, add mutex protection and ABI documentation
>     Aesthetic adjustments (Riana)
> v3: Change rotations data type, ABI date and version
> v4: Fix wakeref leak
>     Drop switch case and simplify hwm_fan_xx() (Andi)
> v5: Rework time calculation, aesthetic adjustments (Andy)
> v6: Drop overflow logic (Andy)
>     Aesthetic adjustments (Badal)

But it still has an issue with 64-bit division on 32-bit platforms, right?

...

> +	/*
> +	 * Calculate fan speed in RPM by time averaging two subsequent
> +	 * readings in minutes.
> +	 * RPM = number of rotations * msecs per minute / time in msecs
> +	 */
> +	*val = DIV_ROUND_UP(rotations * (MSEC_PER_SEC * 60), time);

...somewhere here?

-- 
With Best Regards,
Andy Shevchenko


