Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 542EB5F37D5
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 23:33:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFF6D10E527;
	Mon,  3 Oct 2022 21:32:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B94610E4FA;
 Mon,  3 Oct 2022 21:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664832762; x=1696368762;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lJ0tv4WT6bI7MiIV/wb5pIb8EB4Cyi60hNxh4Y+AUeU=;
 b=jHFZSpxv0T6KvmrtGfMc4isK3DFRC3FqPtwJH+iAAmVisBvhuXrL3lK+
 sHcRA8bHDddRfrfmpy6txZNJ8XgeQs0wuDeX/HAa2QQbAJi+rfJoWhYYL
 vcoq0sr3/lnMqROo4BjB5da7k8dmG+LMKnYTmc/NOQBLtLWGCitTcHGBV
 irc3tgmCaTqiBAC03YfCtmYZlpJ0z2JPiFT/3vuCY4KvjdfoHc+zh2SoM
 SoxQMASxKcDmsK6qFB4a8dR8Vvtbt4CRFYIY/oSQRh1Wwv0sHcG0A7tZt
 eAjHi2BCgzIdPfaw7yS6T0XoNyKmblDut9j25qnl4ld/mJ5uFDf7zNtcf Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="300367051"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200"; d="scan'208";a="300367051"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2022 14:32:41 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="623707228"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200"; d="scan'208";a="623707228"
Received: from kbalinsk-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.213.7.91])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2022 14:32:39 -0700
Date: Mon, 3 Oct 2022 23:32:36 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [Intel-gfx] [PATCH 6/7] drm/i915/hwmon: Expose power1_max_interval
Message-ID: <YztU9MMjDnTx/kJw@ashyti-mobl2.lan>
References: <20220927055020.3499420-1-badal.nilawar@intel.com>
 <20220927055020.3499420-7-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220927055020.3499420-7-badal.nilawar@intel.com>
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
Cc: linux-hwmon@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Badal,

> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> index f9d6d3b08bba..19b9fe3ef237 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> @@ -26,6 +26,15 @@ Description:	RO. Card default power limit (default TDP setting).
>  
>  		Only supported for particular Intel i915 graphics platforms.
>  
> +What:		/sys/devices/.../hwmon/hwmon<i>/power1_max_interval
> +Date:		February 2023
> +KernelVersion:	6.2
> +Contact:	dri-devel@lists.freedesktop.org

same question here.

> +Description:	RW. Sustained power limit interval (Tau in PL1/Tau) in
> +		milliseconds over which sustained power is averaged.
> +
> +		Only supported for particular Intel i915 graphics platforms.
> +
>  What:		/sys/devices/.../hwmon/hwmon<i>/power1_crit
>  Date:		February 2023
>  KernelVersion:	6.2
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> index 2394fa789793..641143956c45 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.c
> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> @@ -20,11 +20,13 @@
>   * - power  - microwatts
>   * - curr   - milliamperes
>   * - energy - microjoules
> + * - time   - milliseconds
>   */
>  #define SF_VOLTAGE	1000
>  #define SF_POWER	1000000
>  #define SF_CURR		1000
>  #define SF_ENERGY	1000000
> +#define SF_TIME		1000
>  
>  struct hwm_reg {
>  	i915_reg_t gt_perf_status;
> @@ -53,6 +55,7 @@ struct i915_hwmon {
>  	struct hwm_reg rg;
>  	int scl_shift_power;
>  	int scl_shift_energy;
> +	int scl_shift_time;
>  };
>  
>  static void
> @@ -161,6 +164,115 @@ hwm_energy(struct hwm_drvdata *ddat, long *energy)
>  	return 0;
>  }
>  
> +static ssize_t
> +hwm_power1_max_interval_show(struct device *dev, struct device_attribute *attr,
> +			     char *buf)
> +{
> +	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +	intel_wakeref_t wakeref;
> +	u32 r, x, y, x_w = 2; /* 2 bits */
> +	u64 tau4, out;
> +
> +	with_intel_runtime_pm(ddat->uncore->rpm, wakeref)
> +		r = intel_uncore_read(ddat->uncore, hwmon->rg.pkg_rapl_limit);
> +
> +	x = REG_FIELD_GET(PKG_PWR_LIM_1_TIME_X, r);
> +	y = REG_FIELD_GET(PKG_PWR_LIM_1_TIME_Y, r);
> +	/*
> +	 * tau = 1.x * power(2,y), x = bits(23:22), y = bits(21:17)
> +	 *     = (4 | x) << (y - 2)
> +	 * where (y - 2) ensures a 1.x fixed point representation of 1.x
> +	 * However because y can be < 2, we compute
> +	 *     tau4 = (4 | x) << y
> +	 * but add 2 when doing the final right shift to account for units
> +	 */
> +	tau4 = ((1 << x_w) | x) << y;
> +	/* val in hwmon interface units (millisec) */
> +	out = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
> +
> +	return sysfs_emit(buf, "%llu\n", out);
> +}
> +
> +static ssize_t
> +hwm_power1_max_interval_store(struct device *dev,
> +			      struct device_attribute *attr,
> +			      const char *buf, size_t count)
> +{
> +	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +	long val, max_win, ret;

you have some type mismatch here:

 - val should be unsigned long
 - max_win should be u64
 - ret should be int 

> +	u32 x, y, rxy, x_w = 2; /* 2 bits */
> +	u64 tau4, r;
> +
> +#define PKG_MAX_WIN_DEFAULT 0x12ull

could you please add a comment here?

> +
> +	ret = kstrtoul(buf, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * val must be < max in hwmon interface units. The steps below are
> +	 * explained in i915_power1_max_interval_show()
> +	 */
> +	r = FIELD_PREP(PKG_MAX_WIN, PKG_MAX_WIN_DEFAULT);
> +
> +	x = REG_FIELD_GET(PKG_MAX_WIN_X, r);
> +	y = REG_FIELD_GET(PKG_MAX_WIN_Y, r);
> +	tau4 = ((1 << x_w) | x) << y;
> +	max_win = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
> +
> +	if (val > max_win)
> +		return -EINVAL;
> +
> +	/* val in hw units */
> +	val = DIV_ROUND_CLOSEST_ULL((u64)val << hwmon->scl_shift_time, SF_TIME);
> +	/* Convert to 1.x * power(2,y) */
> +	if (!val)
> +		return -EINVAL;
> +	y = ilog2(val);
> +	/* x = (val - (1 << y)) >> (y - 2); */

some leftover

> +	x = (val - (1ul << y)) << x_w >> y;
> +
> +	rxy = REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_X, x) | REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_Y, y);
> +
> +	hwm_locked_with_pm_intel_uncore_rmw(ddat, hwmon->rg.pkg_rapl_limit,
> +					    PKG_PWR_LIM_1_TIME, rxy);
> +	return count;
> +}
> +
> +static SENSOR_DEVICE_ATTR(power1_max_interval, 0664,
> +			  hwm_power1_max_interval_show,
> +			  hwm_power1_max_interval_store, 0);
> +
> +static struct attribute *hwm_attributes[] = {
> +	&sensor_dev_attr_power1_max_interval.dev_attr.attr,
> +	NULL
> +};
> +
> +static umode_t hwm_attributes_visible(struct kobject *kobj,
> +				      struct attribute *attr, int index)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +
> +	if (attr == &sensor_dev_attr_power1_max_interval.dev_attr.attr)
> +		return i915_mmio_reg_valid(hwmon->rg.pkg_rapl_limit) ? attr->mode : 0;
> +	else
> +		return 0;

please remove the else

Andi

> +}
> +
> +static const struct attribute_group hwm_attrgroup = {
> +	.attrs = hwm_attributes,
> +	.is_visible = hwm_attributes_visible,
> +};
> +
> +static const struct attribute_group *hwm_groups[] = {
> +	&hwm_attrgroup,
> +	NULL
> +};
> +
>  static const struct hwmon_channel_info *hwm_info[] = {
>  	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
>  	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
> @@ -472,6 +584,7 @@ hwm_get_preregistration_info(struct drm_i915_private *i915)
>  
>  	hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
>  	hwmon->scl_shift_energy = REG_FIELD_GET(PKG_ENERGY_UNIT, val_sku_unit);
> +	hwmon->scl_shift_time = REG_FIELD_GET(PKG_TIME_UNIT, val_sku_unit);
>  
>  	/*
>  	 * Initialize 'struct hwm_energy_info', i.e. set fields to the
> @@ -510,7 +623,7 @@ void i915_hwmon_register(struct drm_i915_private *i915)
>  	hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat->name,
>  							 ddat,
>  							 &hwm_chip_info,
> -							 NULL);
> +							 hwm_groups);
>  	if (IS_ERR(hwmon_dev)) {
>  		i915->hwmon = NULL;
>  		return;
> diff --git a/drivers/gpu/drm/i915/intel_mchbar_regs.h b/drivers/gpu/drm/i915/intel_mchbar_regs.h
> index bd42fb66e297..64aa1e9be463 100644
> --- a/drivers/gpu/drm/i915/intel_mchbar_regs.h
> +++ b/drivers/gpu/drm/i915/intel_mchbar_regs.h
> @@ -194,6 +194,9 @@
>   */
>  #define PCU_PACKAGE_POWER_SKU			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5930)
>  #define   PKG_PKG_TDP				GENMASK_ULL(14, 0)
> +#define   PKG_MAX_WIN				GENMASK_ULL(54, 48)
> +#define     PKG_MAX_WIN_X			GENMASK_ULL(54, 53)
> +#define     PKG_MAX_WIN_Y			GENMASK_ULL(52, 48)
>  
>  #define PCU_PACKAGE_POWER_SKU_UNIT		_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5938)
>  #define   PKG_PWR_UNIT				REG_GENMASK(3, 0)
> @@ -212,6 +215,10 @@
>  #define   RPE_MASK				REG_GENMASK(15, 8)
>  #define PCU_PACKAGE_RAPL_LIMIT			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
>  #define   PKG_PWR_LIM_1				REG_GENMASK(14, 0)
> +#define   PKG_PWR_LIM_1_EN			REG_BIT(15)
> +#define   PKG_PWR_LIM_1_TIME			REG_GENMASK(23, 17)
> +#define   PKG_PWR_LIM_1_TIME_X			REG_GENMASK(23, 22)
> +#define   PKG_PWR_LIM_1_TIME_Y			REG_GENMASK(21, 17)
>  
>  /* snb MCH registers for priority tuning */
>  #define MCH_SSKPD				_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5d10)
> -- 
> 2.25.1
