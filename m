Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D435A6EAB8
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 08:40:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08ACE10E38C;
	Tue, 25 Mar 2025 07:40:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ck//puo/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4842010E389;
 Tue, 25 Mar 2025 07:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742888405; x=1774424405;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=p1aSY1wMSbG6r4dmL9xk6LvnVHyvvrFlOQwQN+I8oxg=;
 b=ck//puo/1TbzUsjFbPDABsgQzJaFWTnPMtxZyKLqKdsaiRfLrxj4qyoN
 Gb4Ge3b+tIfpgrPKoLjtv8c4e3NKEt3345GlAeJmQD0uMQCxgWRN8zQa+
 kJFPP1GJG8Au82ZM5r0QSU2H1aLf8VOeyh9bofUlT7QYl26CP0coewn/k
 Fia7w90n6NGm/u9bWLkVGjmEbx865yyV5IV04Yah9f7AWEnukWvc8iDhF
 ib/Z5PEEpsmtCUNDCUGnYSHqZRYpiKW8X8vMss4W3mkRoPVdJyDAZXrVw
 cEeFDtuWHrA24CrWUmKq20JFdjmQFRNGM1lcievJ0pAVhSVfHZBbxIOmN A==;
X-CSE-ConnectionGUID: dqIX3HIsRIO3GoX7XSXKBQ==
X-CSE-MsgGUID: ef2LxT8nTcKrKMw+18h62Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="47904343"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="47904343"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 00:40:04 -0700
X-CSE-ConnectionGUID: zOJNXZTvQgaw80rYCQvqmQ==
X-CSE-MsgGUID: UGZIsaLWTYiuQkH0yPTRCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="128977720"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 00:40:01 -0700
Date: Tue, 25 Mar 2025 09:39:58 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org, saurabhg.gupta@intel.com,
 alex.zuo@intel.com, joonas.lahtinen@linux.intel.com,
 matthew.brost@intel.com, jianxun.zhang@intel.com,
 shuicheng.lin@intel.com, dri-devel@lists.freedesktop.org,
 Michal.Wajdeczko@intel.com, michal.mrozek@intel.com
Subject: Re: [PATCH v12 5/5] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Message-ID: <Z-JdzvwmkpK2vZj-@black.fi.intel.com>
References: <20250324230931.63840-1-jonathan.cavitt@intel.com>
 <20250324230931.63840-6-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324230931.63840-6-jonathan.cavitt@intel.com>
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

On Mon, Mar 24, 2025 at 11:09:28PM +0000, Jonathan Cavitt wrote:
> Add support for userspace to request a list of observed faults
> from a specified VM.

...

> v10:
> - Remove unnecessary switch case logic (Raag)

This is usually "changes present in version" and not "comments received
in version" but I guess this must be one of those drm things.

...

> +static int xe_vm_get_property_helper(struct xe_vm *vm,
> +				     struct drm_xe_vm_get_property *args)
> +{
> +	int size;
> +
> +	switch (args->property) {
> +	case DRM_XE_VM_GET_PROPERTY_FAULTS:
> +		spin_lock(&vm->faults.lock);
> +		size = size_mul(sizeof(struct xe_vm_fault), vm->faults.len);
> +		spin_unlock(&vm->faults.lock);
> +
> +		if (args->size)
> +			/*
> +			 * Number of faults may increase between calls to
> +			 * xe_vm_get_property_ioctl, so just report the
> +			 * number of faults the user requests if it's less
> +			 * than or equal to the number of faults in the VM
> +			 * fault array.
> +			 */
> +			return args->size <= size ? fill_faults(vm, args) : -EINVAL;

You're comparing an int with u32 and I'm not sure how this plays out.
The usual practice is to use size_t (even in the struct) but I'm not aware
of its userspace counterpart.

Raag
