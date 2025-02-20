Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE8CA3D749
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 11:50:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 908C910E937;
	Thu, 20 Feb 2025 10:50:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AV8sTec7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E9110E937
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 10:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740048616; x=1771584616;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=JrXvaKc6Bnx56gvw8eb36idNEUvy+bpXXghDkAcYqmc=;
 b=AV8sTec7FHDFwLpYkrrqGeJCSgkROO76Tuht9M+D2/CJMfjoj2IlfzKx
 jS4PliEKqm9FxSrNkfFyfh0JrFnv6YH6u+fW9sPUFlA9LnmdrZM65vT12
 R7vw6TBcgYvFgzbrnfjdAVqleSlgRerrvitLBPEN/pU5aE35wU7XoOQ4d
 v4qgmlMz5cynM0JA6n/dZVe44ResdP7ifnq9nfFODcdiFAIUtEMBUshPt
 vX24C+vJw7je+une1KVVkpqVvsE/thSGo09TKcOnv9gVmxupY9hav2AZr
 oUaKCAZ33tYTR5LUKSSlXfbPnfiENn11beJ1xTZEiZMN0Fwx1/1Ejn4m6 w==;
X-CSE-ConnectionGUID: ff7MugDGSzCqm2VU5/y7bw==
X-CSE-MsgGUID: mi+nqv4zT2qrUQ6hvLWqgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="43652145"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="43652145"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 02:50:15 -0800
X-CSE-ConnectionGUID: qS1MUiUeQu+3SzgnVzmg7Q==
X-CSE-MsgGUID: Rwh4WLHoSICjTf9yx+rVcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="115672247"
Received: from srgreatl-mobl.ger.corp.intel.com (HELO [10.245.112.164])
 ([10.245.112.164])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 02:50:13 -0800
Message-ID: <50869fd0-00df-40ab-8dfa-844670e6e850@linux.intel.com>
Date: Thu, 20 Feb 2025 11:50:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: firmware requirements
To: Dave Airlie <airlied@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Min Ma <min.ma@amd.com>, Lizhi Hou <lizhi.hou@amd.com>
References: <CAPM=9tw_a+3qLjUn0=SqjVL=N6ExRbw0u9TamwGwigWwDwc23Q@mail.gmail.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <CAPM=9tw_a+3qLjUn0=SqjVL=N6ExRbw0u9TamwGwigWwDwc23Q@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2/19/2025 10:01 PM, Dave Airlie wrote:
> I'd just like to remind everyone of the firmware requirements for
> vendors that control their firmware and the driver upstreams:
> 
> https://docs.kernel.org/driver-api/firmware/firmware-usage-guidelines.html
> 
> Intel VPU it seems like you are not currently shipping upstream
> firmware, and might have tied your fw and userspace together.

Yep, this is correct :/

> I'm cc'ing the AMD XDNA driver as it recently landed and I'd like them
> to confirm they are following the above requirements.
> 
> The main reason we don't allow userspace/fw direct linkage is if a
> user deploys two containers with two different userspace drivers in
> them on the same hardware, what is the kernel driver supposed to do?

This makes sense, but I didn't see anything in the firmware usage guidelines about needing user-space and firmware to be compatible.
It is focused on making sure the kernel driver works well with the firmware.
Our intel_vpu driver sticks to the basics with the firmware ABI, so we've got backward and forward compatibility covered from the initial release.

Now, when it comes to user space and firmware, that's a whole other story. We've made some headway, but there's still a lot to do.
Our firmware is pretty massive (like 10 times bigger than your average GPU firmware) which makes things trickier than what other drivers deal with.
That's why we didn't put the firmware in linux-firmware right away, but we'll get the next release in there.

We will continue working on separating user space from the firmware more to make things smoother.

> Firmware should be abstracted in the kernel if it is not possible to
> build proper fw APIs for userspace to use directly, by proper I mean
> forward and backwards compatible.

This dependents on a project. In our case only user space should provide this compatibility.
We don't even parse command buffers at the moment in kernel space.

For your reference, we release updates for both the user space and firmware every couple of weeks here: https://github.com/intel/linux-npu-driver/releases

Jacek
