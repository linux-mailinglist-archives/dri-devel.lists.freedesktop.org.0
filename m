Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD817939EB3
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 12:24:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD95010E54B;
	Tue, 23 Jul 2024 10:24:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dMM1Vx6A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D90910E54B;
 Tue, 23 Jul 2024 10:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721730242; x=1753266242;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/hzkEzetuaVWssIQ7u4fcT5r0NBI94nuXz7SeN/OzsM=;
 b=dMM1Vx6AYQc0gCIc9a6TzhDBEfZvAjVkPGYxqUUsGJ5Q/of3s9lb45X8
 FkL9TVlRoBnVDMGeUqPV+zOPpiKGseDuZ7kaxaLm1UrRWpLKysN3qK8Dq
 yNCBkJcueVp+egwnFgvT6AxD5IlsILpkyP/mv2v1TIYExScjRThGrTQGG
 nlTltGeI1u5UJIQWor3Ln46FO1c+Zr0l1pZMn+zTTn+KwS6z4AcDvSdgu
 qynHpaHuWDzbA6WW1PC03NFuvSLTDBkTIiY9+kgDS+KmwaoA1X5FtS747
 LJ5e2B12Ms51qKwU1iTT6zB0GXr5r8AA7Szd487WkPjKU4ZihIDkNWXwy A==;
X-CSE-ConnectionGUID: RHSbzuMfRaSzW1uUW+qtfQ==
X-CSE-MsgGUID: FXNbMNZVT36UW+rLHIMxqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="19309814"
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="19309814"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 03:24:01 -0700
X-CSE-ConnectionGUID: l7vwrzDpT3q06tPTIIGmZw==
X-CSE-MsgGUID: Jre7woTvTbi1Mcx9vBkuKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="52205179"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 03:24:00 -0700
Date: Tue, 23 Jul 2024 13:23:56 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 anshuman.gupta@intel.com, badal.nilawar@intel.com,
 ashutosh.dixit@intel.com, karthik.poosa@intel.com,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v1] drm/i915/hwmon: expose fan speed
Message-ID: <Zp-EvHsiKbqmhgMy@black.fi.intel.com>
References: <20240712122356.360613-1-raag.jadav@intel.com>
 <8b7a3b03-1c09-4b1c-8816-4779176e7903@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b7a3b03-1c09-4b1c-8816-4779176e7903@intel.com>
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

On Mon, Jul 22, 2024 at 04:20:51PM +0530, Riana Tauro wrote:
> Hi Raag
> 
> On 7/12/2024 5:53 PM, Raag Jadav wrote:
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
> > 
> Add fixes tag with the bug link

We still need temperature information to mark it as a fix.

> > @@ -771,6 +834,14 @@ hwm_get_preregistration_info(struct drm_i915_private *i915)
> >   		for_each_gt(gt, i915, i)
> >   			hwm_energy(&hwmon->ddat_gt[i], &energy);
> >   	}
> > +
> > +	if (i915_mmio_reg_valid(hwmon->rg.fan_speed)) {
> > +		/* Take initial readings and use it while calculating actual fan speed. */
> > +		with_intel_runtime_pm(uncore->rpm, wakeref)
> > +			ddat->fi.reg_val_prev = intel_uncore_read(ddat->uncore,
> > +								  hwmon->rg.fan_speed);
> > +		ddat->fi.time_prev = jiffies_to_msecs(jiffies);
> > +	}
> 
> Move this under with_intel_runtime_pm condition used above.

We don't need to fiddle with runtime_pm if it is INVALID_MMIO_REG.
Doesn't this make more sense? Or am I missing something? 

Raag
