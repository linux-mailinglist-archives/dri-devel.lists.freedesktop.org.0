Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 604E894CE57
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 12:11:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0C3010E89D;
	Fri,  9 Aug 2024 10:11:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J2oONqPb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 775D510E89A;
 Fri,  9 Aug 2024 10:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723198261; x=1754734261;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ElNa1R9fS3sL8rOFzmLcBLY5XkiZ9t0O2YMnQTQeJII=;
 b=J2oONqPbQCFgvI1ePdVtVnEvvihPibAGWqsD8TNyERK1jeVbspDZ/OvZ
 q0s8pTANq0vsrAsXGkXqdtN+clDbbNzGMFTyBw7kQ3Sdb64rJTaLLhEQh
 KqBqeYE9SBzvS2edfnru+FQ1S1PHX8l74ijdWJCgP+DJfn54K+XubBNWW
 6Z0z/HK2CuBdYh4CRwlzB/RNWjMhMpNZLiQYg2nMekVVNtZvA+yYtPbXn
 38qc1nxCeb+pVY+mwG1FIgcozfeUwHhRYbVAt/uOy6PzhiDDnoCJWTCHn
 QNZqKr04nzltpdOGCnTy/u364M+HnHWpOhxC7XKYtAunEZJUBM2DJ/cfN w==;
X-CSE-ConnectionGUID: Evtt7ZA5RhiD8xqPcnlPkw==
X-CSE-MsgGUID: a3Db7UalQAa4+ZRS7el4pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21490975"
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208";a="21490975"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 03:11:01 -0700
X-CSE-ConnectionGUID: sReZUgrISUmDXuHgRpgTzQ==
X-CSE-MsgGUID: KnRNh/vWSbyxp2GSVV7apg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208";a="57436779"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 03:10:56 -0700
Date: Fri, 9 Aug 2024 13:10:52 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com,
 daniel@ffwll.ch, linux@roeck-us.net, andi.shyti@linux.intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 anshuman.gupta@intel.com, riana.tauro@intel.com,
 ashutosh.dixit@intel.com, karthik.poosa@intel.com,
 andriy.shevchenko@linux.intel.com
Subject: Re: [PATCH v4] drm/i915/hwmon: expose fan speed
Message-ID: <ZrXrLPgN0tDutnGb@black.fi.intel.com>
References: <20240809061525.1368153-1-raag.jadav@intel.com>
 <23dc7824-50cd-4ba3-be5a-df141e8fe69a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23dc7824-50cd-4ba3-be5a-df141e8fe69a@intel.com>
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

On Fri, Aug 09, 2024 at 03:03:20PM +0530, Nilawar, Badal wrote:
> 
> 
> On 09-08-2024 11:45, Raag Jadav wrote:
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
> > v2:
> > - Add mutex protection
> > - Handle overflow
> > - Add ABI documentation
> > - Aesthetic adjustments (Riana)
> > 
> > v3:
> > - Declare rotations as "long" and drop redundant casting
> > - Change date and version in ABI documentation
> > - Add commenter name in changelog (Riana)
> > 
> > v4:
> > - Fix wakeref leak
> > - Drop switch case and simplify hwm_fan_xx() (Andi)
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> > ---
> >   .../ABI/testing/sysfs-driver-intel-i915-hwmon |  8 ++
> >   drivers/gpu/drm/i915/gt/intel_gt_regs.h       |  2 +
> >   drivers/gpu/drm/i915/i915_hwmon.c             | 81 +++++++++++++++++++
> >   3 files changed, 91 insertions(+)
> > 
> > diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> > index 92fe7c5c5ac1..be4141a7522f 100644
> > --- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> > +++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> > @@ -75,3 +75,11 @@ Description:	RO. Energy input of device or gt in microjoules.
> >   		for the gt.
> >   		Only supported for particular Intel i915 graphics platforms.
> > +
> > +What:		/sys/bus/pci/drivers/i915/.../hwmon/hwmon<i>/fan1_input
> > +Date:		November 2024
> Why November?

This is expected to land upstream in next cycle right?

> > +KernelVersion:	6.12
> > +Contact:	intel-gfx@lists.freedesktop.org
> > +Description:	RO. Fan speed of device in RPM.
> > +
> > +		Only supported for particular Intel i915 graphics platforms.
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > index e42b3a5d4e63..57a3c83d3655 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > @@ -1553,6 +1553,8 @@
> >   #define VLV_RENDER_C0_COUNT			_MMIO(0x138118)
> >   #define VLV_MEDIA_C0_COUNT			_MMIO(0x13811c)
> > +#define PCU_PWM_FAN_SPEED			_MMIO(0x138140)
> > +
> >   #define GEN12_RPSTAT1				_MMIO(0x1381b4)
> >   #define   GEN12_VOLTAGE_MASK			REG_GENMASK(10, 0)
> >   #define   GEN12_CAGF_MASK			REG_GENMASK(19, 11)
> > diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> > index 49db3e09826c..bafa5a11ed0f 100644
> > --- a/drivers/gpu/drm/i915/i915_hwmon.c
> > +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> > @@ -36,6 +36,7 @@ struct hwm_reg {
> >   	i915_reg_t pkg_rapl_limit;
> >   	i915_reg_t energy_status_all;
> >   	i915_reg_t energy_status_tile;
> > +	i915_reg_t fan_speed;
> >   };
> >   struct hwm_energy_info {
> > @@ -43,11 +44,17 @@ struct hwm_energy_info {
> >   	long accum_energy;			/* Accumulated energy for energy1_input */
> >   };
> > +struct hwm_fan_info {
> > +	u32 reg_val_prev;
> > +	u32 time_prev;
> > +};
> > +
> >   struct hwm_drvdata {
> >   	struct i915_hwmon *hwmon;
> >   	struct intel_uncore *uncore;
> >   	struct device *hwmon_dev;
> >   	struct hwm_energy_info ei;		/*  Energy info for energy1_input */
> > +	struct hwm_fan_info fi;			/*  Fan info for fan1_input */
> >   	char name[12];
> >   	int gt_n;
> >   	bool reset_in_progress;
> > @@ -276,6 +283,7 @@ static const struct hwmon_channel_info * const hwm_info[] = {
> >   	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
> >   	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT),
> >   	HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT),
> > +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
> >   	NULL
> >   };
> > @@ -613,6 +621,63 @@ hwm_curr_write(struct hwm_drvdata *ddat, u32 attr, long val)
> >   	}
> >   }
> > +static umode_t
> > +hwm_fan_is_visible(const struct hwm_drvdata *ddat, u32 attr)
> > +{
> > +	struct i915_hwmon *hwmon = ddat->hwmon;
> > +
> > +	return attr == hwmon_fan_input &&
> > +	       i915_mmio_reg_valid(hwmon->rg.fan_speed) ? 0444 : 0;
> > +}
> > +
> > +static int
> > +hwm_fan_read(struct hwm_drvdata *ddat, u32 attr, long *val)
> > +{
> > +	struct i915_hwmon *hwmon = ddat->hwmon;
> > +	struct hwm_fan_info *fi = &ddat->fi;
> > +	u32 reg_val, pulses, time, time_now;
> > +	intel_wakeref_t wakeref;
> > +	long rotations;
> > +	int ret = 0;
> > +
> > +	if (attr != hwmon_fan_input)
> > +		return -EOPNOTSUPP;
> Using a switch case in rev3 is more logical here. It will also simplify
> adding more fan attributes in the future. This is why switch cases are used
> in other parts of the file.

Current support is for DG1 and DG2, which do not include any other features
that can be supported by fan attributes.

Raag
