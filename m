Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 708F24C7A9A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 21:38:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E382A10E8D6;
	Mon, 28 Feb 2022 20:37:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01BF110E8CE;
 Mon, 28 Feb 2022 20:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646080675; x=1677616675;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=qxkOGvt2l5BPJmd/uBkstQ4wSF6w24n+796l7M2hQAg=;
 b=iO6oSDXbh0iViRl9nsRcZAXdwwbPAt+68ks4mCfL9NjKJ7aHdz4fEns+
 1Cz0Bzy8sVYVotZ5AcIbessR/k0X7i9dZRe0L6Xwb5JY12wI9Rt4mD9ki
 7SBonHLS3rgZ8jGqILBifG7EBii30p3gp6GE/0MNTUD6j7rBt6eDiU3u6
 orlz2dp8JvyaFJXQOizxNkP9TrAl9m5/Yxmzi62AvMIjFN4Xf4d/lAWuF
 luhQbvkEXv/5ijOcgwg1aSURbG/Yw91kgewPijvw2HBN+g+RJb7CRzLDY
 xfuqBgqksHEPQ6LtZY2Hc+GzX4PnFcPo6t6NEOCKdEKC/p3RCjLYW5Msp Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="233601780"
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="233601780"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 12:37:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="593353469"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by fmsmga008.fm.intel.com with ESMTP; 28 Feb 2022 12:37:51 -0800
Received: from [10.249.130.171] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.130.171])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 21SKbn17022597; Mon, 28 Feb 2022 20:37:50 GMT
Message-ID: <28e2363a-38aa-9d68-ac59-b78c9168a814@intel.com>
Date: Mon, 28 Feb 2022 21:37:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [PATCH v5 7/7] drm/i915/gt: Adding new sysfs frequency attributes
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
References: <20220217144158.21555-1-andi.shyti@linux.intel.com>
 <20220217144158.21555-8-andi.shyti@linux.intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20220217144158.21555-8-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi@etezian.org>,
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 17.02.2022 15:41, Andi Shyti wrote:
> From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> 
> This patch adds the following new sysfs frequency attributes;
> 	- punit_req_freq_mhz
> 	- throttle_reason_status
> 	- throttle_reason_pl1
> 	- throttle_reason_pl2
> 	- throttle_reason_pl4
> 	- throttle_reason_thermal
> 	- throttle_reason_prochot
> 	- throttle_reason_ratl
> 	- throttle_reason_vr_thermalert
> 	- throttle_reason_vr_tdc
> 
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Dale B Stimson <dale.b.stimson@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c | 142 ++++++++++++++++++++
>  drivers/gpu/drm/i915/gt/intel_rps.c         |  83 ++++++++++++
>  drivers/gpu/drm/i915/gt/intel_rps.h         |  10 ++
>  drivers/gpu/drm/i915/i915_reg.h             |  11 ++
>  4 files changed, 246 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> index 8e86b8f675f1..8be676cd1607 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> @@ -463,6 +463,141 @@ static ssize_t rps_rp_mhz_show(struct device *dev,
>  static const struct attribute * const gen6_rps_attrs[] = GEN6_RPS_ATTR;
>  static const struct attribute * const gen6_gt_attrs[]  = GEN6_GT_ATTR;
>  
> +static ssize_t punit_req_freq_mhz_show(struct device *dev,
> +				       struct device_attribute *attr,
> +				       char *buff)
> +{
> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
> +	struct intel_rps *rps = &gt->rps;
> +	u32 preq = intel_rps_read_punit_req_frequency(rps);
> +
> +	return scnprintf(buff, PAGE_SIZE, "%d\n", preq);

%u since preq is u32

and use sysfs_emit (also in below show functions)

> +}
> +
> +static ssize_t throttle_reason_status_show(struct device *dev,
> +					   struct device_attribute *attr,
> +					   char *buff)
> +{
> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
> +	struct intel_rps *rps = &gt->rps;
> +	bool status = !!intel_rps_read_throttle_reason_status(rps);
> +
> +	return scnprintf(buff, PAGE_SIZE, "%u\n", status);
> +}
> +
> +static ssize_t throttle_reason_pl1_show(struct device *dev,
> +					struct device_attribute *attr,
> +					char *buff)
> +{
> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
> +	struct intel_rps *rps = &gt->rps;
> +	bool pl1 = !!intel_rps_read_throttle_reason_pl1(rps);
> +
> +	return scnprintf(buff, PAGE_SIZE, "%u\n", pl1);
> +}
> +
> +static ssize_t throttle_reason_pl2_show(struct device *dev,
> +					struct device_attribute *attr,
> +					char *buff)
> +{
> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
> +	struct intel_rps *rps = &gt->rps;
> +	bool pl2 = !!intel_rps_read_throttle_reason_pl2(rps);
> +
> +	return scnprintf(buff, PAGE_SIZE, "%u\n", pl2);
> +}
> +
> +static ssize_t throttle_reason_pl4_show(struct device *dev,
> +					struct device_attribute *attr,
> +					char *buff)
> +{
> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
> +	struct intel_rps *rps = &gt->rps;
> +	bool pl4 = !!intel_rps_read_throttle_reason_pl4(rps);
> +
> +	return scnprintf(buff, PAGE_SIZE, "%u\n", pl4);
> +}
> +
> +static ssize_t throttle_reason_thermal_show(struct device *dev,
> +					    struct device_attribute *attr,
> +					    char *buff)
> +{
> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
> +	struct intel_rps *rps = &gt->rps;
> +	bool thermal = !!intel_rps_read_throttle_reason_thermal(rps);
> +
> +	return scnprintf(buff, PAGE_SIZE, "%u\n", thermal);
> +}
> +
> +static ssize_t throttle_reason_prochot_show(struct device *dev,
> +					    struct device_attribute *attr,
> +					    char *buff)
> +{
> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
> +	struct intel_rps *rps = &gt->rps;
> +	bool prochot = !!intel_rps_read_throttle_reason_prochot(rps);
> +
> +	return scnprintf(buff, PAGE_SIZE, "%u\n", prochot);
> +}
> +
> +static ssize_t throttle_reason_ratl_show(struct device *dev,
> +					 struct device_attribute *attr,
> +					 char *buff)
> +{
> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
> +	struct intel_rps *rps = &gt->rps;
> +	bool ratl = !!intel_rps_read_throttle_reason_ratl(rps);
> +
> +	return scnprintf(buff, PAGE_SIZE, "%u\n", ratl);
> +}
> +
> +static ssize_t throttle_reason_vr_thermalert_show(struct device *dev,
> +						  struct device_attribute *attr,
> +						  char *buff)
> +{
> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
> +	struct intel_rps *rps = &gt->rps;
> +	bool thermalert = !!intel_rps_read_throttle_reason_vr_thermalert(rps);
> +
> +	return scnprintf(buff, PAGE_SIZE, "%u\n", thermalert);
> +}
> +
> +static ssize_t throttle_reason_vr_tdc_show(struct device *dev,
> +					   struct device_attribute *attr,
> +					   char *buff)
> +{
> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
> +	struct intel_rps *rps = &gt->rps;
> +	bool tdc = !!intel_rps_read_throttle_reason_vr_tdc(rps);
> +
> +	return scnprintf(buff, PAGE_SIZE, "%u\n", tdc);
> +}
> +
> +static DEVICE_ATTR_RO(punit_req_freq_mhz);
> +static DEVICE_ATTR_RO(throttle_reason_status);
> +static DEVICE_ATTR_RO(throttle_reason_pl1);
> +static DEVICE_ATTR_RO(throttle_reason_pl2);
> +static DEVICE_ATTR_RO(throttle_reason_pl4);
> +static DEVICE_ATTR_RO(throttle_reason_thermal);
> +static DEVICE_ATTR_RO(throttle_reason_prochot);
> +static DEVICE_ATTR_RO(throttle_reason_ratl);
> +static DEVICE_ATTR_RO(throttle_reason_vr_thermalert);
> +static DEVICE_ATTR_RO(throttle_reason_vr_tdc);
> +
> +static const struct attribute *freq_attrs[] = {
> +	&dev_attr_punit_req_freq_mhz.attr,
> +	&dev_attr_throttle_reason_status.attr,
> +	&dev_attr_throttle_reason_pl1.attr,
> +	&dev_attr_throttle_reason_pl2.attr,
> +	&dev_attr_throttle_reason_pl4.attr,
> +	&dev_attr_throttle_reason_thermal.attr,
> +	&dev_attr_throttle_reason_prochot.attr,
> +	&dev_attr_throttle_reason_ratl.attr,
> +	&dev_attr_throttle_reason_vr_thermalert.attr,
> +	&dev_attr_throttle_reason_vr_tdc.attr,
> +	NULL
> +};
> +
>  static int intel_sysfs_rps_init(struct intel_gt *gt, struct kobject *kobj,
>  				const struct attribute * const *attrs)
>  {
> @@ -493,4 +628,11 @@ void intel_gt_sysfs_pm_init(struct intel_gt *gt, struct kobject *kobj)
>  	if (ret)
>  		drm_warn(&gt->i915->drm,
>  			 "failed to create gt%u RPS sysfs files", gt->info.id);
> +
> +	ret = sysfs_create_files(kobj, freq_attrs);
> +	if (ret)
> +		drm_warn(&gt->i915->drm,
> +			 "failed to create gt%u throttle sysfs files",
> +			 gt->info.id);

nit: would be nice to see %pe why it failed

> +
>  }
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> index fd95449ed46d..94c78cfaf9c9 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> @@ -2286,6 +2286,89 @@ void intel_rps_lower_unslice(struct intel_rps *rps)
>  	mutex_unlock(&rps->lock);
>  }
>  
> +static u32 __rps_read_mmio(struct intel_gt *gt, i915_reg_t reg32)

this doesn't look like "rps" helper, rather like "gt" so it should have
different prefix and maybe even be exported by the gt or uncore ?

unless you wanted:

static u32 __rps_read_mmio(struct intel_rps *rps, i915_reg_t reg32)
{
	struct intel_gt *gt = rps_to_gt(rps);

> +{
> +	intel_wakeref_t wakeref;
> +	u32 val;
> +
> +	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
> +		val = intel_uncore_read(gt->uncore, reg32);
> +
> +	return val;
> +}
> +
> +u32 intel_rps_read_throttle_reason_status(struct intel_rps *rps)
> +{
> +	struct intel_gt *gt = rps_to_gt(rps);
> +	u32 status = __rps_read_mmio(gt, GT0_PERF_LIMIT_REASONS) & GT0_PERF_LIMIT_REASONS_MASK;
> +
> +	return status;
> +}
> +
> +u32 intel_rps_read_throttle_reason_pl1(struct intel_rps *rps)
> +{
> +	struct intel_gt *gt = rps_to_gt(rps);
> +	u32 pl1 = __rps_read_mmio(gt, GT0_PERF_LIMIT_REASONS) & POWER_LIMIT_1_MASK;
> +
> +	return pl1;
> +}
> +
> +u32 intel_rps_read_throttle_reason_pl2(struct intel_rps *rps)
> +{
> +	struct intel_gt *gt = rps_to_gt(rps);
> +	u32 pl2 = __rps_read_mmio(gt, GT0_PERF_LIMIT_REASONS) & POWER_LIMIT_2_MASK;
> +
> +	return pl2;
> +}
> +
> +u32 intel_rps_read_throttle_reason_pl4(struct intel_rps *rps)
> +{
> +	struct intel_gt *gt = rps_to_gt(rps);
> +	u32 pl4 = __rps_read_mmio(gt, GT0_PERF_LIMIT_REASONS) & POWER_LIMIT_4_MASK;
> +
> +	return pl4;
> +}
> +
> +u32 intel_rps_read_throttle_reason_thermal(struct intel_rps *rps)
> +{
> +	struct intel_gt *gt = rps_to_gt(rps);
> +	u32 thermal = __rps_read_mmio(gt, GT0_PERF_LIMIT_REASONS) & THERMAL_LIMIT_MASK;
> +
> +	return thermal;
> +}
> +
> +u32 intel_rps_read_throttle_reason_prochot(struct intel_rps *rps)
> +{
> +	struct intel_gt *gt = rps_to_gt(rps);
> +	u32 prochot = __rps_read_mmio(gt, GT0_PERF_LIMIT_REASONS) & PROCHOT_MASK;
> +
> +	return prochot;
> +}
> +
> +u32 intel_rps_read_throttle_reason_ratl(struct intel_rps *rps)
> +{
> +	struct intel_gt *gt = rps_to_gt(rps);
> +	u32 ratl = __rps_read_mmio(gt, GT0_PERF_LIMIT_REASONS) & RATL_MASK;
> +
> +	return ratl;
> +}
> +
> +u32 intel_rps_read_throttle_reason_vr_thermalert(struct intel_rps *rps)
> +{
> +	struct intel_gt *gt = rps_to_gt(rps);
> +	u32 thermalert = __rps_read_mmio(gt, GT0_PERF_LIMIT_REASONS) & VR_THERMALERT_MASK;
> +
> +	return thermalert;
> +}

shouldn't we return bool by all of these functions as used/expected in
show() counterparts ?

> +
> +u32 intel_rps_read_throttle_reason_vr_tdc(struct intel_rps *rps)
> +{
> +	struct intel_gt *gt = rps_to_gt(rps);
> +	u32 tdc = __rps_read_mmio(gt, GT0_PERF_LIMIT_REASONS) & VR_TDC_MASK;
> +
> +	return tdc;
> +}
> +
>  /* External interface for intel_ips.ko */
>  
>  static struct drm_i915_private __rcu *ips_mchdev;
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.h b/drivers/gpu/drm/i915/gt/intel_rps.h
> index c6d76a3d1331..b45ab983895c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.h
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.h
> @@ -47,6 +47,16 @@ u32 intel_rps_read_punit_req_frequency(struct intel_rps *rps);
>  u32 intel_rps_read_state_cap(struct intel_rps *rps);
>  void intel_rps_raise_unslice(struct intel_rps *rps);
>  void intel_rps_lower_unslice(struct intel_rps *rps);
> +u32 intel_rps_read_throttle_reason(struct intel_rps *rps);
> +u32 intel_rps_read_throttle_reason_status(struct intel_rps *rps);
> +u32 intel_rps_read_throttle_reason_pl1(struct intel_rps *rps);
> +u32 intel_rps_read_throttle_reason_pl2(struct intel_rps *rps);
> +u32 intel_rps_read_throttle_reason_pl4(struct intel_rps *rps);
> +u32 intel_rps_read_throttle_reason_thermal(struct intel_rps *rps);
> +u32 intel_rps_read_throttle_reason_prochot(struct intel_rps *rps);
> +u32 intel_rps_read_throttle_reason_ratl(struct intel_rps *rps);
> +u32 intel_rps_read_throttle_reason_vr_thermalert(struct intel_rps *rps);
> +u32 intel_rps_read_throttle_reason_vr_tdc(struct intel_rps *rps);
>  
>  void gen5_rps_irq_handler(struct intel_rps *rps);
>  void gen6_rps_irq_handler(struct intel_rps *rps, u32 pm_iir);
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 2243d9d1d941..c4f53e5404cd 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -1836,6 +1836,17 @@
>  #define GEN9_RP_STATE_LIMITS	_MMIO(0x138148)
>  #define XEHPSDV_RP_STATE_CAP	_MMIO(0x250014)
>  
> +#define GT0_PERF_LIMIT_REASONS		_MMIO(0x1381A8)
> +#define   GT0_PERF_LIMIT_REASONS_MASK	0x00000de3

this mask is different that other (FIELD_PREP/GET wont work) so maybe we
should name it in special way ?

> +#define   PROCHOT_MASK			BIT(1)
> +#define   THERMAL_LIMIT_MASK		BIT(2)
> +#define   RATL_MASK			BIT(6)
> +#define   VR_THERMALERT_MASK		BIT(7)
> +#define   VR_TDC_MASK			BIT(8)
> +#define   POWER_LIMIT_4_MASK		BIT(9)
> +#define   POWER_LIMIT_1_MASK		BIT(11)
> +#define   POWER_LIMIT_2_MASK		BIT(12)

REG_BIT ?

Michal

> +
>  #define CHV_CLK_CTL1			_MMIO(0x101100)
>  #define VLV_CLK_CTL2			_MMIO(0x101104)
>  #define   CLK_CTL2_CZCOUNT_30NS_SHIFT	28
