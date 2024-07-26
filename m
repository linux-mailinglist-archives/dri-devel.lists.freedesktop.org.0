Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6CA93D063
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2024 11:26:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9787810E885;
	Fri, 26 Jul 2024 09:26:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AENbfCkK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE03E10E885;
 Fri, 26 Jul 2024 09:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721985986; x=1753521986;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BQ4GhWvDEGszw4lnTWN0qHPj27P6TA3C2h9AmB4XPcs=;
 b=AENbfCkKfolPbCI1Ww7HWKR1kzX5nzQhKuukwn2u6Qy4fuxkM7STeTL1
 1rLGLbHoSXesfc/oY7xo7diEIz7ajeYZELFa/jtjYGqNV0Fxa7k7BX11Y
 P2afI2IfP2cZSBhe5os2IWwdet5uhkdLH3nN8s/jZuNkwipIfoUaWRxkp
 6GUhGEpOUwNLPPbBM2h7wqX09EzaiOXd4ZSvdHCHGnDFAaHr40PLMsItR
 R2KF0pdSdg7EmtfKn0pgqDBy8u4mpsfPSX7StR9hKehZNr28sx9ebO43Y
 zsAJlKfxdBwo9AqcHA2xRTJGPkLudMErGmObx1f5eSn90kMIVJ2FV90Fb A==;
X-CSE-ConnectionGUID: itPK7EvwR7a9iXPKdOfLNA==
X-CSE-MsgGUID: yUw1xOJ9QTe+G6jtSbCKxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="30925144"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="30925144"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 02:26:26 -0700
X-CSE-ConnectionGUID: mbXn2+yjTcquWSfsPw4mXw==
X-CSE-MsgGUID: tCZ2w0N8QN+CD/6Nwp2akQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="53226183"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 02:26:22 -0700
Date: Fri, 26 Jul 2024 12:26:18 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com,
 daniel@ffwll.ch, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 anshuman.gupta@intel.com, riana.tauro@intel.com,
 ashutosh.dixit@intel.com, karthik.poosa@intel.com,
 andriy.shevchenko@linux.intel.com
Subject: Re: [PATCH v1] drm/i915/hwmon: expose fan speed
Message-ID: <ZqNruj3mCH_EYbUD@black.fi.intel.com>
References: <20240712122356.360613-1-raag.jadav@intel.com>
 <84061e47-3e6b-45c4-bc4b-db70da6b67f8@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84061e47-3e6b-45c4-bc4b-db70da6b67f8@intel.com>
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

On Wed, Jul 24, 2024 at 02:11:40PM +0530, Nilawar, Badal wrote:
> 
> 
> On 12-07-2024 17:53, Raag Jadav wrote:
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
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gt/intel_gt_regs.h |  2 +
> >   drivers/gpu/drm/i915/i915_hwmon.c       | 71 +++++++++++++++++++++++++
> >   2 files changed, 73 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > index e42b3a5d4e63..407d8152755a 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > @@ -1553,6 +1553,8 @@
> >   #define VLV_RENDER_C0_COUNT			_MMIO(0x138118)
> >   #define VLV_MEDIA_C0_COUNT			_MMIO(0x13811c)
> > +#define GEN12_PWM_FAN_SPEED			_MMIO(0x138140)
> > +
> >   #define GEN12_RPSTAT1				_MMIO(0x1381b4)
> >   #define   GEN12_VOLTAGE_MASK			REG_GENMASK(10, 0)
> >   #define   GEN12_CAGF_MASK			REG_GENMASK(19, 11)
> > diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> > index 49db3e09826c..f829c7837d83 100644
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
> > @@ -613,6 +621,55 @@ hwm_curr_write(struct hwm_drvdata *ddat, u32 attr, long val)
> >   	}
> >   }
> > +static umode_t
> > +hwm_fan_is_visible(const struct hwm_drvdata *ddat, u32 attr)
> > +{
> > +	struct i915_hwmon *hwmon = ddat->hwmon;
> > +
> > +	switch (attr) {
> > +	case hwmon_fan_input:
> > +		return i915_mmio_reg_valid(hwmon->rg.fan_speed) ? 0444 : 0;
> > +	default:
> > +		return 0;
> > +	}
> > +}
> > +
> > +static int
> > +hwm_fan_read(struct hwm_drvdata *ddat, u32 attr, long *val)
> > +{
> > +	struct i915_hwmon *hwmon = ddat->hwmon;
> > +	u32 reg_val, rotation, time, time_now;
> > +	intel_wakeref_t wakeref;
> > +
> > +	switch (attr) {
> > +	case hwmon_fan_input:
> > +		with_intel_runtime_pm(ddat->uncore->rpm, wakeref)
> Do we expect fan running when device is in D3? If not then we should use
> with_intel_runtime_pm_if_active here otherwise report fan speed 0.

Yes, it can be running depending on package temperature.
So better to rely on hardware value.

Raag
