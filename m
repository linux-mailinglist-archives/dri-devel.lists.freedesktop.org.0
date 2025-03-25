Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A01A70DC1
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 00:45:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E5B910E624;
	Tue, 25 Mar 2025 23:45:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hriGwo1L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F6910E624;
 Tue, 25 Mar 2025 23:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742946332; x=1774482332;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8kU2xDYHOh53LDa66FD39vxacLVp1TFeXScO7Z854K0=;
 b=hriGwo1LlpXXIDkoeUluF1AW+SFEPgHIkGt0IxTGUVrfYDNqiziOMlqP
 b5rL2GzBwJVTPklBe865VsydhrwDIOaLD0aFIuaYjZaqzK5eVPgFkLUWH
 SArNPGllueZ62DoCgdZUwlDtNufP0FCNcCF5bNT3I9ivQ/DFGIiPIYrfw
 JJFxm3q4e6/0wmj4XiTgvMYVJswhScXpiH8D7d3IPOaa/4M1GWY2ntjHS
 QKaVLPll/dEaG9fQrh0JkrhzFblwmOUrIzix9ad/aUYhbdwjyPRFZpWBJ
 v7o8IpLmg59tahlV5QxFH4ZOIuZ4JywQDCttKAf2ElvBcnEkz4V1eN/OH Q==;
X-CSE-ConnectionGUID: Q3RAfzjXQhicM6+27N1O6Q==
X-CSE-MsgGUID: aYurWa8cRSmBsNFAgibKVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="31817701"
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208";a="31817701"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 16:45:32 -0700
X-CSE-ConnectionGUID: 9aMYHpLqTRujanybAjxk7A==
X-CSE-MsgGUID: 4i1JdzCJQViedN3p1rIVVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208";a="124710728"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 16:45:29 -0700
Date: Wed, 26 Mar 2025 01:45:26 +0200
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
Message-ID: <Z-NAFqRhGK4Vjfv5@black.fi.intel.com>
References: <20250324230931.63840-1-jonathan.cavitt@intel.com>
 <20250324230931.63840-6-jonathan.cavitt@intel.com>
 <Z-JdzvwmkpK2vZj-@black.fi.intel.com>
 <CH0PR11MB5444B65CB663C9123B41F7CFE5A72@CH0PR11MB5444.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CH0PR11MB5444B65CB663C9123B41F7CFE5A72@CH0PR11MB5444.namprd11.prod.outlook.com>
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

On Tue, Mar 25, 2025 at 08:15:59PM +0530, Cavitt, Jonathan wrote:
> From: Jadav, Raag <raag.jadav@intel.com> 
> > On Mon, Mar 24, 2025 at 11:09:28PM +0000, Jonathan Cavitt wrote:
> > > Add support for userspace to request a list of observed faults
> > > from a specified VM.
> > 
> > ...
> > 
> > > v10:
> > > - Remove unnecessary switch case logic (Raag)
> > 
> > This is usually "changes present in version" and not "comments received
> > in version" but I guess this must be one of those drm things.
> 
> I'm fairly certain change logs are supposed to be written in the future tense.
> Or at the very least, I think I picked up the habit in college.  Is this not correct?

I meant it belongs to v11.

> > > +static int xe_vm_get_property_helper(struct xe_vm *vm,
> > > +				     struct drm_xe_vm_get_property *args)
> > > +{
> > > +	int size;
> > > +
> > > +	switch (args->property) {
> > > +	case DRM_XE_VM_GET_PROPERTY_FAULTS:
> > > +		spin_lock(&vm->faults.lock);
> > > +		size = size_mul(sizeof(struct xe_vm_fault), vm->faults.len);
> > > +		spin_unlock(&vm->faults.lock);
> > > +
> > > +		if (args->size)
> > > +			/*
> > > +			 * Number of faults may increase between calls to
> > > +			 * xe_vm_get_property_ioctl, so just report the
> > > +			 * number of faults the user requests if it's less
> > > +			 * than or equal to the number of faults in the VM
> > > +			 * fault array.
> > > +			 */
> > > +			return args->size <= size ? fill_faults(vm, args) : -EINVAL;
> > 
> > You're comparing an int with u32 and I'm not sure how this plays out.
> > The usual practice is to use size_t (even in the struct) 
> 
> Size is a u32 in struct drm_xe_device_query.

And what about the local one?

Raag
