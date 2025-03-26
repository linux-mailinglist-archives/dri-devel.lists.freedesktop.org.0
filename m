Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A56A71A4F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 16:30:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCCA910E6FC;
	Wed, 26 Mar 2025 15:30:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N232tluo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81ECE10E6FC;
 Wed, 26 Mar 2025 15:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743003033; x=1774539033;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ovgR8ermFrxswkPAyaoIGQT7pjvlo43vk8MEcITTfeY=;
 b=N232tluoTIebpqKAWC3icyUOwy1im127/xHXQk/Ca148MJOvimaGOysz
 avaIKD9DUmXhem4e6amQvKK1Z3xC0df80v/9yWUxmXrRxwij/oM2HOsma
 SoMM6t7dmXIagEZBPeWD2y5eL2n2tmYuAkgwEr9tOEOthLcis6CxxfvtZ
 bLnXQs/fb1DqOhyiYzG4Ys4BbJlkWb4LC0G5aItDD4bB7yU20m0isvWC0
 KmkVWbEy2ITnS0HFnPiAci6OPRra/GkWDhcDtOXu+LOSdCBLwxHojS/pG
 Ox4kAt3cingfyGukB+QF3NC1dy7AQXI3D1bLzsHFvJLpkJte9Yu+tO7Qh A==;
X-CSE-ConnectionGUID: NMYx8FTCTYOOPJXUAHD9Bg==
X-CSE-MsgGUID: x4mHBvMKSuexXqE8gVKeRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="31904854"
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="31904854"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 08:30:33 -0700
X-CSE-ConnectionGUID: hSczxg9zTkmHOIQ1CGZkyQ==
X-CSE-MsgGUID: QZnH4CcrT3eXGbZMy+rqpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="124609499"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 08:30:30 -0700
Date: Wed, 26 Mar 2025 17:30:27 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Gupta, saurabhg" <saurabhg.gupta@intel.com>,
 "Zuo, Alex" <alex.zuo@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 "Zhang, Jianxun" <jianxun.zhang@intel.com>,
 "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "Mrozek, Michal" <michal.mrozek@intel.com>
Subject: Re: [PATCH v12 5/5] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Message-ID: <Z-QdkywOX5ldFj09@black.fi.intel.com>
References: <20250324230931.63840-1-jonathan.cavitt@intel.com>
 <20250324230931.63840-6-jonathan.cavitt@intel.com>
 <Z-JdzvwmkpK2vZj-@black.fi.intel.com>
 <CH0PR11MB5444B65CB663C9123B41F7CFE5A72@CH0PR11MB5444.namprd11.prod.outlook.com>
 <Z-NAFqRhGK4Vjfv5@black.fi.intel.com>
 <CH0PR11MB54449EE925D5291EAC8D90F0E5A62@CH0PR11MB5444.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CH0PR11MB54449EE925D5291EAC8D90F0E5A62@CH0PR11MB5444.namprd11.prod.outlook.com>
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

On Wed, Mar 26, 2025 at 07:51:15PM +0530, Cavitt, Jonathan wrote:
> > From: Jadav, Raag <raag.jadav@intel.com> 
> > On Tue, Mar 25, 2025 at 08:15:59PM +0530, Cavitt, Jonathan wrote:
> > > From: Jadav, Raag <raag.jadav@intel.com> 
> > > > On Mon, Mar 24, 2025 at 11:09:28PM +0000, Jonathan Cavitt wrote:
> > > > > Add support for userspace to request a list of observed faults
> > > > > from a specified VM.
> > > > 
> > > > ...
> > > > 
> > > > > v10:
> > > > > - Remove unnecessary switch case logic (Raag)
> > > > 
> > > > This is usually "changes present in version" and not "comments received
> > > > in version" but I guess this must be one of those drm things.
> > > 
> > > I'm fairly certain change logs are supposed to be written in the future tense.
> > > Or at the very least, I think I picked up the habit in college.  Is this not correct?
> > 
> > I meant it belongs to v11.
> 
> Apologies for the confusion.  Not every patch is modified each revision cycle, so
> removing unnecessary switch case logic was the 10th actual revision of the patch,
> whereas the series as a whole had been modified 11 times at that point.

Yeah, that's one of the drm things which adds on to the confusion instead
of making things easier.

The usual practice (atleast in other subsystems) is to not differentiate
between patch and series version, which is quite easier to follow.

https://kernelnewbies.org/FirstKernelPatch -> "Versioning patchsets"

> The change is correctly labeled as a part of revision 11 in the cover letter.
> 
> > 
> > > > > +static int xe_vm_get_property_helper(struct xe_vm *vm,
> > > > > +				     struct drm_xe_vm_get_property *args)
> > > > > +{
> > > > > +	int size;
> > > > > +
> > > > > +	switch (args->property) {
> > > > > +	case DRM_XE_VM_GET_PROPERTY_FAULTS:
> > > > > +		spin_lock(&vm->faults.lock);
> > > > > +		size = size_mul(sizeof(struct xe_vm_fault), vm->faults.len);
> > > > > +		spin_unlock(&vm->faults.lock);
> > > > > +
> > > > > +		if (args->size)
> > > > > +			/*
> > > > > +			 * Number of faults may increase between calls to
> > > > > +			 * xe_vm_get_property_ioctl, so just report the
> > > > > +			 * number of faults the user requests if it's less
> > > > > +			 * than or equal to the number of faults in the VM
> > > > > +			 * fault array.
> > > > > +			 */
> > > > > +			return args->size <= size ? fill_faults(vm, args) : -EINVAL;
> > > > 
> > > > You're comparing an int with u32 and I'm not sure how this plays out.
> > > > The usual practice is to use size_t (even in the struct) 
> > > 
> > > Size is a u32 in struct drm_xe_device_query.
> > 
> > And what about the local one?
> 
> Do you mean the size variable used in xe_query functions?  Because that's
> size_t.  Though the initial question was about the size variables in the structs,
> AFAICT.

Yeah, mixing/matching types usual leads to bugs (atleast overtime), but
if you're trying to mimic xe_query then I think you should stick to it.

Raag
