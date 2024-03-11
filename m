Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BF4878206
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 15:49:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D671D10F67A;
	Mon, 11 Mar 2024 14:49:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JC4Voeks";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1ECF10F138
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 14:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710168578; x=1741704578;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=TT1fFUKNFv0KH/fXWbRwVQwGaPBA0T/N20h0i5lLVyc=;
 b=JC4VoekspQcyO4j3FH/lzyzojjxGJ7cnG0HJTfrdnPfU8PLBUSq6neb0
 DFUBfbc0Pr3vlazRehmF2ic/BzNSOXC+bQiwd5Qq3P7Xtms87Mt4X/rNe
 C2ynHdZx79+Eqk1d15F25hWdbk7g90vpayMHMj11NjHeSKr98zSMn0lkz
 lLEwXV3PK4rqSnPEqK+LY3poW2Bwjg6qygtv/LKMuoT7KmYQCbxFxWW83
 Ehd67Z0h67CsoYwkAL7wJiyx6+fPyB5m1P1gZFlG8xlcmIefuIvfT/fzv
 FN0vHXNmWmBJv1V9CxbCZIdVqPqPc5pjvt0gTR8jVzYVQIsrt9vI0rTWf A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="8648002"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="8648002"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 07:49:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="11264639"
Received: from tbeaumon-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.34.24])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 07:49:33 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] Revert "drm/panthor: Fix undefined
 panthor_device_suspend/resume symbol issue"
In-Reply-To: <Ze8YJhmZgruRfNBo@e110455-lin.cambridge.arm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240311111619.249776-1-jani.nikula@intel.com>
 <20240311124826.44cc69ba@collabora.com> <87cys1t299.fsf@intel.com>
 <20240311125445.4bab1712@collabora.com> <87a5n5t0mt.fsf@intel.com>
 <Ze8YJhmZgruRfNBo@e110455-lin.cambridge.arm.com>
Date: Mon, 11 Mar 2024 16:49:30 +0200
Message-ID: <871q8gu8lh.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 11 Mar 2024, Liviu Dudau <liviu.dudau@arm.com> wrote:
> On Mon, Mar 11, 2024 at 02:26:50PM +0200, Jani Nikula wrote:
>> On Mon, 11 Mar 2024, Boris Brezillon <boris.brezillon@collabora.com> wrote:
>> > On Mon, 11 Mar 2024 13:51:46 +0200
>> > Jani Nikula <jani.nikula@intel.com> wrote:
>> >
>> >> On Mon, 11 Mar 2024, Boris Brezillon <boris.brezillon@collabora.com> wrote:
>> >> > On Mon, 11 Mar 2024 13:16:19 +0200
>> >> > Jani Nikula <jani.nikula@intel.com> wrote:
>> >> >  
>> >> >> This reverts commit 674dc7f61aefea81901c21402946074927e63f1a.
>> >> >> 
>> >> >> The commit causes a recursive dependency in kconfig:
>> >> >> 
>> >> >> drivers/iommu/Kconfig:14:error: recursive dependency detected!
>> >> >> drivers/iommu/Kconfig:14:	symbol IOMMU_SUPPORT is selected by DRM_PANTHOR
>> >> >> drivers/gpu/drm/panthor/Kconfig:3:	symbol DRM_PANTHOR depends on PM
>> >> >> kernel/power/Kconfig:183:	symbol PM is selected by PM_SLEEP
>> >> >> kernel/power/Kconfig:117:	symbol PM_SLEEP depends on HIBERNATE_CALLBACKS
>> >> >> kernel/power/Kconfig:35:	symbol HIBERNATE_CALLBACKS is selected by XEN_SAVE_RESTORE
>> >> >> arch/x86/xen/Kconfig:67:	symbol XEN_SAVE_RESTORE depends on XEN
>> >> >> arch/x86/xen/Kconfig:6:	symbol XEN depends on PARAVIRT
>> >> >> arch/x86/Kconfig:781:	symbol PARAVIRT is selected by HYPERV
>> >> >> drivers/hv/Kconfig:5:	symbol HYPERV depends on X86_LOCAL_APIC
>> >> >> arch/x86/Kconfig:1106:	symbol X86_LOCAL_APIC depends on X86_UP_APIC
>> >> >> arch/x86/Kconfig:1081:	symbol X86_UP_APIC prompt is visible depending on PCI_MSI
>> >> >> drivers/pci/Kconfig:39:	symbol PCI_MSI is selected by AMD_IOMMU
>> >> >> drivers/iommu/amd/Kconfig:3:	symbol AMD_IOMMU depends on IOMMU_SUPPORT
>> >> >> For a resolution refer to Documentation/kbuild/kconfig-language.rst
>> >> >> subsection "Kconfig recursive dependency limitations"
>> >> >> 
>> >> >> Fixes: 674dc7f61aef ("drm/panthor: Fix undefined panthor_device_suspend/resume symbol issue")
>> >> >> Cc: Boris Brezillon <boris.brezillon@collabora.com>
>> >> >> Cc: Liviu Dudau <liviu.dudau@arm.com>
>> >> >> Cc: Steven Price <steven.price@arm.com>
>> >> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>  
>> >> >
>> >> > Acked-by: Boris Brezillon <boris.brezillon@collabora.com>  
>> >> 
>> >> Your suggestion select -> depends on IOMMU_SUPPORT seems to also work,
>> >> at least for me. Want to send a patch for that instead of me merging the
>> >> revert?
>> >
>> > I replied on the other thread :-). I think we're better off reverting
>> > the faulty commit, so we can discuss how to fix the original issue
>> > properly without blocking the build.
>> 
>> Thanks, pushed to drm-misc-next.
>
> So with this revert we're OK with an undefined symbol if !CONFIG_PM, but we're not happy
> with a recursive dependency that is only triggered for COMPILE_TEST? I would've thought
> IOMMU_SUPPORT options is a better one.

It's a real config.

# CONFIG_COMPILE_TEST is not set

BR,
Jani.

>
> Best regards,
> Liviu
>
>> 
>> BR,
>> Jani.
>> 
>> 
>> -- 
>> Jani Nikula, Intel

-- 
Jani Nikula, Intel
