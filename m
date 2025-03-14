Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C67CFA60E8F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 11:16:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D7B510E13E;
	Fri, 14 Mar 2025 10:16:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oe7Mlhtp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D686610E13E
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 10:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741947413; x=1773483413;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=iJZLoqwgJ3R/nnDkaUdLn9imVFTiXoQcyygVH87gxl0=;
 b=Oe7MlhtpgG6xqhiPhIPfb70fpR0oArhYfj9+IHbrePLWJlo7AkwZiyhA
 TFLGQrIZWJpUEAI67x35/YBPgrxKQFpmpRPM57VpuFkpgavRX8mATYRVA
 cvSmLKfJC8hsX8aLEOEeRRWuCBUDYk75ZmFkG61G0yCra2Eya/TxhcdLX
 tQchbPAxl8QiXN6ikaMtFtxgEsfLqz1PEK1j+lUVLgGGhtXeiOLtjMWT2
 gs0eGmc3Vxpr6+jyiMSSZ9gFk6cF7GYt33xmEEJJyS/OaqPoAKTdW2ryK
 TlI6CTlMO2eSvOmo6QkvKbI/KycIPpI95uPZZo9IXlQf1Va9nMFlDmQbS A==;
X-CSE-ConnectionGUID: YGx1eHj4RWSbc+pGCr60PQ==
X-CSE-MsgGUID: 9uVyzIJ1TG2UJn+PvFM3vA==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="46992445"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="46992445"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 03:16:52 -0700
X-CSE-ConnectionGUID: jLwUWRBNS5+umSXPtCE4cw==
X-CSE-MsgGUID: 1ktmi3PQQLmMkIZF50+68g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="126429872"
Received: from avijaya-mobl2.gar.corp.intel.com (HELO [10.245.115.15])
 ([10.245.115.15])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 03:16:50 -0700
Message-ID: <bf25d370-7658-4ad6-b568-03621d3708a8@linux.intel.com>
Date: Fri, 14 Mar 2025 11:16:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: firmware requirements
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Dave Airlie <airlied@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Min Ma <min.ma@amd.com>, Lizhi Hou <lizhi.hou@amd.com>
References: <CAPM=9tw_a+3qLjUn0=SqjVL=N6ExRbw0u9TamwGwigWwDwc23Q@mail.gmail.com>
 <50869fd0-00df-40ab-8dfa-844670e6e850@linux.intel.com>
 <Z8czJa7QsCBGfQRd@phenom.ffwll.local>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <Z8czJa7QsCBGfQRd@phenom.ffwll.local>
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

On 3/4/2025 6:06 PM, Simona Vetter wrote:
> Hi Jacek!
> 
> Bit late reply, was sick last week and still recovering from missed mails.
> 
> On Thu, Feb 20, 2025 at 11:50:10AM +0100, Jacek Lawrynowicz wrote:
>> On 2/19/2025 10:01 PM, Dave Airlie wrote:
>>> I'd just like to remind everyone of the firmware requirements for
>>> vendors that control their firmware and the driver upstreams:
>>>
>>> https://docs.kernel.org/driver-api/firmware/firmware-usage-guidelines.html
>>>
>>> Intel VPU it seems like you are not currently shipping upstream
>>> firmware, and might have tied your fw and userspace together.
>>
>> Yep, this is correct :/
>>
>>> I'm cc'ing the AMD XDNA driver as it recently landed and I'd like them
>>> to confirm they are following the above requirements.
>>>
>>> The main reason we don't allow userspace/fw direct linkage is if a
>>> user deploys two containers with two different userspace drivers in
>>> them on the same hardware, what is the kernel driver supposed to do?
>>
>> This makes sense, but I didn't see anything in the firmware usage
> 
> Well, when Dave wrote that documentation section and I reviewed it we
> figured that's clear from the rules we have. There's two rules:
> 
> - firmware is not allowed to break the kernel. This is not limited to
>   "does the kernel driver keep loading", but fully extends to anything the
>   kernel driver does or needs to fullfill its job.
> - the kernel is not allowed to break userspace. This is not limited to the
>   uapi structures, but anything they point at or implicitly reference, any
>   implementation details userspace relies on, any other hidden semantics
>   that aren't entirely transparent. Everything really that can result in a
>   bug report from users.
> 
> If the firmware upgrade still works with the kernel, but changes the
> how the overall uapi works, then the firmware broke the kernel.
> 
> I think the two individiual steps above are very clear already, but I
> guess that both together mean that firmware isn't allowed to break
> userspace isn't clear. Can you please send a patch to add that as another
> very explicit bullet to the existing list in the fw guidelines?

Sure, I've sent the patch.

>> guidelines about needing user-space and firmware to be compatible.
>> It is focused on making sure the kernel driver works well with the
>> firmware.
>> Our intel_vpu driver sticks to the basics with the firmware ABI, so
>> we've got backward and forward compatibility covered from the initial
>> release.
>>
>> Now, when it comes to user space and firmware, that's a whole other
>> story. We've made some headway, but there's still a lot to do.
>> Our firmware is pretty massive (like 10 times bigger than your average
>> GPU firmware) which makes things trickier than what other drivers deal
>> with.
>> That's why we didn't put the firmware in linux-firmware right away, but
>> we'll get the next release in there.
>>
>> We will continue working on separating user space from the firmware more
>> to make things smoother.
>>
>>> Firmware should be abstracted in the kernel if it is not possible to
>>> build proper fw APIs for userspace to use directly, by proper I mean
>>> forward and backwards compatible.
>>
>> This dependents on a project. In our case only user space should provide
>> this compatibility.
>> We don't even parse command buffers at the moment in kernel space.
>>
>> For your reference, we release updates for both the user space and
>> firmware every couple of weeks here:
>> https://github.com/intel/linux-npu-driver/releases
> 
> Yeah you need to fix this. With containers and other packages runtimes
> there's really no connection between the base os image, and the userspace
> you're running. Which means you really cannot assume that on any given
> system there's only one abi version across the firmware and userspace
> libraries. So even without upstreams "no breaking uapi" guarantee this
> does not work in production.

We should be able to provide backward compatibility, so new FW will work with all past userspace versions.
The base OS just has to use up-to-date FW. This should satisfy FW requirements, right?

Regards,
Jacek

