Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90512A6E5A8
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 22:25:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5F8410E4C8;
	Mon, 24 Mar 2025 21:25:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I86lYH9Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2920B10E419;
 Mon, 24 Mar 2025 21:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742851555; x=1774387555;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yjhB+rVSzzbzVNiZ7SWxaEPpUuDhlUxtmSOFhIj4+gc=;
 b=I86lYH9ZPSGLtKiWvcq2xrCz/DCVHvskxeC0NENB2KxOLlIC0yyum36A
 nYarlr+1hjxXGeaP/onshbQ8nGZ3TF7gxhtgTsJMKV2DVlM16P2UJu3jA
 35TpZMh2m+dyyOktlYni9SK5bHfjYePCEwLeYAO5PRYpuM5nhJqeiDcDH
 rR7QtohJKjfVU83awWk3ijV74hSzdmg38UcUBEOzzkiANt/8d9BNQ+uEJ
 zUjEwMvyky/qsWSwW2lF/6jPzJhvXwfkmR5pu+MoTa5dAXzyj0ZWxmXac
 /QT3tdC4ajKJZv7QnHttZ0f8MvhX3fFuwvW4ODRpxcdYn3US0DOOH+UnG w==;
X-CSE-ConnectionGUID: m2myyvVuTaGU6IdQthgSpw==
X-CSE-MsgGUID: Xz9BZyiRRFCHylAVD8p8uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="47736043"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="47736043"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 14:25:55 -0700
X-CSE-ConnectionGUID: MUjQmz5WQgWJPzAZXGUy3Q==
X-CSE-MsgGUID: xFOJZ+JhRlSRA1XKaiI2rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="124705703"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 14:25:52 -0700
Date: Mon, 24 Mar 2025 23:25:49 +0200
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
Subject: Re: [PATCH v10 5/5] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Message-ID: <Z-HN3Yvci8x7JwWc@black.fi.intel.com>
References: <20250320152616.74587-1-jonathan.cavitt@intel.com>
 <20250320152616.74587-6-jonathan.cavitt@intel.com>
 <Z934F9fz_-d1oGiC@black.fi.intel.com>
 <CH0PR11MB5444C9D9B706616AFC314810E5A42@CH0PR11MB5444.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CH0PR11MB5444C9D9B706616AFC314810E5A42@CH0PR11MB5444.namprd11.prod.outlook.com>
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

On Mon, Mar 24, 2025 at 10:27:08PM +0530, Cavitt, Jonathan wrote:
> From: Jadav, Raag <raag.jadav@intel.com> 
> > On Thu, Mar 20, 2025 at 03:26:15PM +0000, Jonathan Cavitt wrote:
> > > Add support for userspace to request a list of observed faults
> > > from a specified VM.
> > 
> > ...
> > 
> > > +static int xe_vm_get_property_size(struct xe_vm *vm, u32 property)
> > > +{
> > > +	int size = -EINVAL;
> > 
> > Mixing size and error codes is usually received with mixed feelings.
> > 
> > > +
> > > +	switch (property) {
> > > +	case DRM_XE_VM_GET_PROPERTY_FAULTS:
> > > +		spin_lock(&vm->faults.lock);
> > > +		size = vm->faults.len * sizeof(struct xe_vm_fault);
> > 
> > size_mul() and,
> > [1] perhaps fill it up into the pointer passed by the caller here?
> 
> "The pointer passed by the caller".  You mean the args pointer?
> 
> We'd still need to check that the args->size value is empty here before overwriting
> it, and we'd also still need to return the size to the ioctl so we can verify it's
> acceptable later in xe_vm_get_property_verify_size.
> 
> Unless you want to merge those two processes together into here?

The semantics are a bit fuzzy to me. Why do we have a single ioctl for
two different processes? Shouldn't they be handled separately?

Raag
