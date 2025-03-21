Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E1CA6C675
	for <lists+dri-devel@lfdr.de>; Sat, 22 Mar 2025 00:37:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E3A010E045;
	Fri, 21 Mar 2025 23:37:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ui/bbB5x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E8D10E045;
 Fri, 21 Mar 2025 23:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742600222; x=1774136222;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AljkXwiVU9fSwVa3Fnc9Y61fCX8xBfpeUbntTEbOcJ8=;
 b=Ui/bbB5x9ybZYi4Odlzk3W0UCdzK33YIu8xerGSYRFgIatw6ZB6ievpx
 8pflgZTsWvFefnZqgOmyb+UqyCJEAzIjduCCd/ZuIWLAqf22/8RuyEh2m
 R7nvI3iEEEMU4X04O7EqLTe5ZWmH/WGu4OYuMPxkMsuwBt9sXU2Kkzz5R
 bYiZCTUeWzxA8yR5NKRwBr2zzGJM/6cbDSCgE32jh5MZL2c91FnAJ4Qun
 rwMbHporms8g9Gaa2MeqdKI1gRdRPzWihmPiPImpIT6svWDOUdIRLAnF1
 0psF9av8Qru+IdkzzOTCzLcWTmJFeb9cZFtuGTm1qYl/AJRkjrEoNHto6 Q==;
X-CSE-ConnectionGUID: OJVFvhGQQvOQJIZz4hVLgw==
X-CSE-MsgGUID: N2CFNrybTWKikM0jquXDIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="47535641"
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; d="scan'208";a="47535641"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 16:37:01 -0700
X-CSE-ConnectionGUID: UNTZxxzjRmKnqWAisrMHdA==
X-CSE-MsgGUID: /3tIRTlgRNqByn/iQK/xHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; d="scan'208";a="123695052"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 16:36:58 -0700
Date: Sat, 22 Mar 2025 01:36:55 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org, saurabhg.gupta@intel.com,
 alex.zuo@intel.com, joonas.lahtinen@linux.intel.com,
 matthew.brost@intel.com, jianxun.zhang@intel.com,
 shuicheng.lin@intel.com, dri-devel@lists.freedesktop.org,
 Michal.Wajdeczko@intel.com, michal.mrozek@intel.com
Subject: Re: [PATCH v10 5/5] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Message-ID: <Z934F9fz_-d1oGiC@black.fi.intel.com>
References: <20250320152616.74587-1-jonathan.cavitt@intel.com>
 <20250320152616.74587-6-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320152616.74587-6-jonathan.cavitt@intel.com>
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

On Thu, Mar 20, 2025 at 03:26:15PM +0000, Jonathan Cavitt wrote:
> Add support for userspace to request a list of observed faults
> from a specified VM.

...

> +static int xe_vm_get_property_size(struct xe_vm *vm, u32 property)
> +{
> +	int size = -EINVAL;

Mixing size and error codes is usually received with mixed feelings.

> +
> +	switch (property) {
> +	case DRM_XE_VM_GET_PROPERTY_FAULTS:
> +		spin_lock(&vm->faults.lock);
> +		size = vm->faults.len * sizeof(struct xe_vm_fault);

size_mul() and,
[1] perhaps fill it up into the pointer passed by the caller here?

> +		spin_unlock(&vm->faults.lock);
> +		break;
> +	default:
> +		break;

Do we need the default case?

> +	}
> +	return size;
> +}
> +
> +static int xe_vm_get_property_verify_size(struct xe_vm *vm, u32 property,
> +					  int expected, int actual)
> +{
> +	switch (property) {
> +	case DRM_XE_VM_GET_PROPERTY_FAULTS:

Unless we're expecting more cases (that we confidently know of), there's
not much point of single case switch.

> +		/*
> +		 * Number of faults may increase between calls to
> +		 * xe_vm_get_property_ioctl, so just report the
> +		 * number of faults the user requests if it's less
> +		 * than or equal to the number of faults in the VM
> +		 * fault array.
> +		 */
> +		if (actual < expected)
> +			return -EINVAL;
> +		break;
> +	default:
> +		if (actual != expected)
> +			return -EINVAL;
> +		break;
> +	}
> +	return 0;
> +}

...

> +static int xe_vm_get_property_fill_data(struct xe_vm *vm,
> +					struct drm_xe_vm_get_property *args)
> +{
> +	switch (args->property) {
> +	case DRM_XE_VM_GET_PROPERTY_FAULTS:
> +		return fill_faults(vm, args);
> +	default:
> +		break;

Same as above.

> +	}
> +	return -EINVAL;
> +}
> +
> +int xe_vm_get_property_ioctl(struct drm_device *drm, void *data,
> +			     struct drm_file *file)
> +{
> +	struct xe_device *xe = to_xe_device(drm);
> +	struct xe_file *xef = to_xe_file(file);
> +	struct drm_xe_vm_get_property *args = data;
> +	struct xe_vm *vm;
> +	int size, ret = 0;
> +
> +	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> +		return -EINVAL;
> +
> +	vm = xe_vm_lookup(xef, args->vm_id);
> +	if (XE_IOCTL_DBG(xe, !vm))
> +		return -ENOENT;
> +
> +	size = xe_vm_get_property_size(vm, args->property);
> +
> +	if (size < 0) {
> +		ret = size;
> +		goto put_vm;
> +	} else if (!args->size && size) {
> +		args->size = size;
> +		goto put_vm;
> +	}

With [1] in place, this gymnastics can be dropped

	ret = xe_vm_get_property_size(vm, args->property, &size);
	if (ret)
		goto put_vm;

> +
> +	ret = xe_vm_get_property_verify_size(vm, args->property,
> +					     args->size, size);
> +	if (XE_IOCTL_DBG(xe, ret))
> +		goto put_vm;
> +
> +	ret = xe_vm_get_property_fill_data(vm, args);
> +
> +put_vm:
> +	xe_vm_put(vm);
> +	return ret;
> +}

Raag
