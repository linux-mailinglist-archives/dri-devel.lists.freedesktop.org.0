Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEDBA19FD4
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 09:24:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9F7210E792;
	Thu, 23 Jan 2025 08:24:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jUI2ty2+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA06110E1DC;
 Thu, 23 Jan 2025 08:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737620656; x=1769156656;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=GGP2ai4GYm2zNzeIOLLH+0ZN/Orn8SGA6+VFokn/B2c=;
 b=jUI2ty2+fmba3RAghohY5Ps20bBXo04ilfhl9CQgo2xiVIfJ2kiNHkwd
 5fqr8H0rQuJHW/L6TH+JqCA8eb+qAREedMxxG7lxPa0x0Hct/YhdPPXUZ
 ibmBybhGY+c73LWvVMYlm1p3u5vkxqgrbQS2eJBT2XZ6r8rMIGwDr9n6U
 jq2ijX9PkegbQiAqJpXTT8VTUCyVyUy9vkSPpcmdQUM/3uJGu7uoL6WMF
 b4wKeu9kuF0JgT4YYQ/Q7MJSjAsWIYCE9WShXdF8B6te4ZW0wfLcZYFJY
 cYWlc6qodPQmSJyrwOd557ouqXIbivk7LkEnVRw2qccXBYnI1kCXJOoT1 g==;
X-CSE-ConnectionGUID: tYwoAg8UTXGBAcvm/z3qKg==
X-CSE-MsgGUID: ADOMwF0TTTy23K7c+QOkyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="48605978"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; d="scan'208";a="48605978"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 00:24:16 -0800
X-CSE-ConnectionGUID: XbGgefMOQ4m+sKxc946+Yw==
X-CSE-MsgGUID: fuiIE3ppQLWpHvLt7QwPbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; d="scan'208";a="107389461"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.98])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 00:24:12 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Dave Airlie <airlied@redhat.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Yafang Shao
 <laoar.shao@gmail.com>
Subject: Re: linux-next: manual merge of the drm-intel tree with the mm tree
In-Reply-To: <20250123103553.32f41759@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250106130348.73a5fae6@canb.auug.org.au>
 <20250108121650.09a8e828@canb.auug.org.au>
 <20250123103553.32f41759@canb.auug.org.au>
Date: Thu, 23 Jan 2025 10:24:09 +0200
Message-ID: <877c6mndjq.fsf@intel.com>
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

On Thu, 23 Jan 2025, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> On Wed, 8 Jan 2025 12:16:50 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> On Mon, 6 Jan 2025 13:03:48 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> >
>> > Today's linux-next merge of the drm-intel tree got a conflict in:
>> > 
>> >   drivers/gpu/drm/i915/display/intel_display_driver.c
>> > 
>> > between commit:
>> > 
>> >   4fc0cee83590 ("drivers: remove get_task_comm() and print task comm directly")
>> > 
>> > from the mm-nonmm-unstable branch of the mm tree and commit:
>> > 
>> >   f5d38d4fa884 ("drm/i915/display: convert intel_display_driver.[ch] to struct intel_display")
>> > 
>> > from the drm-intel tree.
>> > 
>> > I fixed it up (see below) and can carry the fix as necessary. This
>> > is now fixed as far as linux-next is concerned, but any non trivial
>> > conflicts should be mentioned to your upstream maintainer when your tree
>> > is submitted for merging.  You may also want to consider cooperating
>> > with the maintainer of the conflicting tree to minimise any particularly
>> > complex conflicts.
>> > 
>> > -- 
>> > Cheers,
>> > Stephen Rothwell
>> > 
>> > diff --cc drivers/gpu/drm/i915/display/intel_display_driver.c
>> > index 62596424a9aa,497b4a1f045f..000000000000
>> > --- a/drivers/gpu/drm/i915/display/intel_display_driver.c
>> > +++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
>> > @@@ -389,8 -397,9 +397,8 @@@ void intel_display_driver_resume_access
>> >    * Returns %true if the current thread has display HW access, %false
>> >    * otherwise.
>> >    */
>> > - bool intel_display_driver_check_access(struct drm_i915_private *i915)
>> > + bool intel_display_driver_check_access(struct intel_display *display)
>> >   {
>> >  -	char comm[TASK_COMM_LEN];
>> >   	char current_task[TASK_COMM_LEN + 16];
>> >   	char allowed_task[TASK_COMM_LEN + 16] = "none";
>> >   
>> > @@@ -399,14 -408,15 +407,14 @@@
>> >   		return true;
>> >   
>> >   	snprintf(current_task, sizeof(current_task), "%s[%d]",
>> >  -		 get_task_comm(comm, current),
>> >  -		 task_pid_vnr(current));
>> >  +		 current->comm, task_pid_vnr(current));
>> >   
>> > - 	if (i915->display.access.allowed_task)
>> > + 	if (display->access.allowed_task)
>> >   		snprintf(allowed_task, sizeof(allowed_task), "%s[%d]",
>> > - 			 i915->display.access.allowed_task->comm,
>> > - 			 task_pid_vnr(i915->display.access.allowed_task));
>> >  -			 get_task_comm(comm, display->access.allowed_task),
>> > ++			 display->access.allowed_task->comm,
>> > + 			 task_pid_vnr(display->access.allowed_task));
>> >   
>> > - 	drm_dbg_kms(&i915->drm,
>> > + 	drm_dbg_kms(display->drm,
>> >   		    "Reject display access from task %s (allowed to %s)\n",
>> >   		    current_task, allowed_task);
>> >     
>> 
>> This is now a conflict between the drm tree and the mm-nonmm-unstable
>> branch of the mm tree.
>
> And now a conflict between Linus' tree and the mm-nonmm-stable tree.

Will be taken care of with backmerges after -rc1.

BR,
Jani.

-- 
Jani Nikula, Intel
