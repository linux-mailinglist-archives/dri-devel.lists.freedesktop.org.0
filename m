Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6EC9587A4
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 15:12:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A5D10E3DF;
	Tue, 20 Aug 2024 13:12:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z8HeDDUH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECCFD10E31C;
 Tue, 20 Aug 2024 13:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724159574; x=1755695574;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aPgexG4oE2c88za6mvKecAfXWDlnS7gQxWVON+Mpz8I=;
 b=Z8HeDDUHc3sH9es4dGBtGeqj9jknk9mpIFHIo+uO8zhK7wXGYuhD6//q
 3n53HqYZFoEuwZSu8bDbU11h4hd9joh2Q34iphmFM7A2B2SwunyyytTOO
 KuPLtEfC92+OWZN8Sxtkfqc6bz2uNKn5pIgML5G14EncS3vRGM2TmxbpY
 tPBTKOVSiF4xRvyatDaTYVBdiOJYI/KLLPbzcHdFTijGGN1zfdsp8lwHY
 Xun46FZk9SwRokfgrEvZnFLfERmItGHAYVtb5ZVB3/uzEx2nM0iovXhkx
 K3pkYWFaXrpoOB8QBU1FCrZqd6cmRUZNHECYs4uOZXBfEgtkxIOK43RMm g==;
X-CSE-ConnectionGUID: rKbqx2efRPSFgSlEI9VV7A==
X-CSE-MsgGUID: QBiBdTMwRsOU4I66nxROng==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22427100"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="22427100"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 06:12:54 -0700
X-CSE-ConnectionGUID: uwoDjRNUQfiy6bUNw6a57Q==
X-CSE-MsgGUID: zqAYfGooTSqxBHkn9UdOog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="60411979"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 06:12:50 -0700
Date: Tue, 20 Aug 2024 16:12:46 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com,
 daniel@ffwll.ch, linux@roeck-us.net, andi.shyti@linux.intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 anshuman.gupta@intel.com, badal.nilawar@intel.com,
 riana.tauro@intel.com, ashutosh.dixit@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v6] drm/i915/hwmon: expose fan speed
Message-ID: <ZsSWTtew8nCYWrxF@black.fi.intel.com>
References: <20240820062010.2000873-1-raag.jadav@intel.com>
 <ZsRup8uKiqUvADFl@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZsRup8uKiqUvADFl@smile.fi.intel.com>
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

On Tue, Aug 20, 2024 at 01:23:35PM +0300, Andy Shevchenko wrote:
> On Tue, Aug 20, 2024 at 11:50:10AM +0530, Raag Jadav wrote:
> > Add hwmon support for fan1_input attribute, which will expose fan speed
> > in RPM. With this in place we can monitor fan speed using lm-sensors tool.
> > 
> > $ sensors
> > i915-pci-0300
> > Adapter: PCI adapter
> > in0:         653.00 mV
> > fan1:        3833 RPM
> > power1:           N/A  (max =  43.00 W)
> > energy1:      32.02 kJ
> 
> > v2: Handle overflow, add mutex protection and ABI documentation
> >     Aesthetic adjustments (Riana)
> > v3: Change rotations data type, ABI date and version
> > v4: Fix wakeref leak
> >     Drop switch case and simplify hwm_fan_xx() (Andi)
> > v5: Rework time calculation, aesthetic adjustments (Andy)
> > v6: Drop overflow logic (Andy)
> >     Aesthetic adjustments (Badal)
> 
> But it still has an issue with 64-bit division on 32-bit platforms, right?
> 
> ...
> 
> > +	/*
> > +	 * Calculate fan speed in RPM by time averaging two subsequent
> > +	 * readings in minutes.
> > +	 * RPM = number of rotations * msecs per minute / time in msecs
> > +	 */
> > +	*val = DIV_ROUND_UP(rotations * (MSEC_PER_SEC * 60), time);
> 
> ...somewhere here?

Use div64_u64() instead? Or is there a better alternative?

Raag
