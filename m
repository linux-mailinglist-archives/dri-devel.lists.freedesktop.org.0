Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA77738862
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 17:07:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E8F10E4A4;
	Wed, 21 Jun 2023 15:07:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6650989C5E;
 Wed, 21 Jun 2023 15:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jL1QYc7CYkSFsjBqnkl5XGMhYY+Hx3fWKo9ZfFjCEKw=; b=nq4VCxhBqPE45qfk0dW4eeUFPl
 Nz5dONCjhVCN9z38ew6WDGm5DkdhpYp6CRfApQ71lX70NLbbQeIPklvnzuLUs8gGSqX8Ky3LwrgiP
 F1Wvw4kKYEyCU3vsluTQSEKOotrhuY0LhY8/3Rcpkehudc3rQmDX1cK0B578a1nbqNRhqGGVpu+4t
 3UO6RieKMjnr8jaW9ZI5ZpqJEKLP+XHF4YJplwzXvhAznpTCegIJ2lbr0QQBJ2WC4l2yBH+qAaEeQ
 D8p8KD4er1qAgfiNr2WHHwXcd6HmH2uP9Eiwp927yihj236qahTlbUmhCgMhiVdjI6VoO/R9eMY27
 b6ET7rdQ==;
Received: from [179.113.218.86] (helo=[192.168.1.111])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1qBzQG-001Ld8-6E; Wed, 21 Jun 2023 17:07:04 +0200
Message-ID: <195dd084-a97b-ef08-a221-e39ffcd7cc09@igalia.com>
Date: Wed, 21 Jun 2023 12:06:58 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC PATCH v3 0/4] drm: Standardize device reset notification
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20230621005719.836857-1-andrealmeid@igalia.com>
 <caa69e8e-f330-d819-e8cd-7b06aa8eb855@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <caa69e8e-f330-d819-e8cd-7b06aa8eb855@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>,
 =?UTF-8?Q?Timur_Krist=c3=b3f?= <timur.kristof@gmail.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Em 21/06/2023 04:42, Christian König escreveu:
> Am 21.06.23 um 02:57 schrieb André Almeida:
>> Hi,
>>
>> This is a new version of the documentation for DRM device resets. As I 
>> dived
>> more in the subject, I started to believe that part of the problem was 
>> the lack
>> of a DRM API to get reset information from the driver. With an API, we 
>> can
>> better standardize reset queries, increase common code from both DRM 
>> and Mesa,
>> and make easier to write end-to-end tests.
>>
>> So this patchset, along with the documentation, comes with a new IOCTL 
>> and two
>> implementations of it for amdgpu and i915 (although just the former 
>> was really
>> tested). This IOCTL uses the "context id" to query reset information, 
>> but this
>> might be not generic enough to be included in a DRM API.
> 
> Well the basic problem with that is that we don't have a standard DRM 
> context defined.
> 
> If you want to do this you should probably start there first.

Any idea on how to start this? I tried to find previous work about that, 
but I didn't find.

> 
> Apart from that this looks like a really really good idea to me, 
> especially that we document the reset expectations.

I think I'll submit just the doc for the next version then, given that 
the IOCTL will need a lot of rework.

> 
> Regards,
> Christian.
> 
>>    At least for amdgpu,
>> this information is encapsulated by libdrm so one can't just call the 
>> ioctl
>> directly from the UMD as I was planning to, but a small refactor can 
>> be done to
>> expose the id. Anyway, I'm sharing it as it is to gather feedback if 
>> this seems
>> to work.
>>
>> The amdgpu and i915 implementations are provided as a mean of testing 
>> and as
>> exemplification, and not as reference code yet, as the goal is more 
>> about the
>> interface itself then the driver parts.
>>
>> For the documentation itself, after spending some time reading the 
>> reset path in
>> the kernel in Mesa, I decide to rewrite it to better reflect how it 
>> works, from
>> bottom to top.
>>
>> You can check the userspace side of the IOCLT here:
>>   Mesa: 
>> https://gitlab.freedesktop.org/andrealmeid/mesa/-/commit/cd687b22fb32c21b23596c607003e2a495f465
>>   libdrm: 
>> https://gitlab.freedesktop.org/andrealmeid/libdrm/-/commit/b31e5404893ee9a85d1aa67e81c2f58c1dac3c46
>>
>> For testing, I use this vulkan app that has an infinity loop in the 
>> shader:
>> https://github.com/andrealmeid/vulkan-triangle-v1
>>
>> Feedbacks are welcomed!
>>
>> Thanks,
>>         André
>>
>> v2: 
>> https://lore.kernel.org/all/20230227204000.56787-1-andrealmeid@igalia.com/
>> v1: 
>> https://lore.kernel.org/all/20230123202646.356592-1-andrealmeid@igalia.com/
>>
>> André Almeida (4):
>>    drm/doc: Document DRM device reset expectations
>>    drm: Create DRM_IOCTL_GET_RESET
>>    drm/amdgpu: Implement DRM_IOCTL_GET_RESET
>>    drm/i915: Implement DRM_IOCTL_GET_RESET
>>
>>   Documentation/gpu/drm-uapi.rst                | 51 ++++++++++++++++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |  4 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c       | 35 +++++++++++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h       |  5 ++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  1 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       | 12 +++-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.h       |  2 +
>>   drivers/gpu/drm/drm_debugfs.c                 |  2 +
>>   drivers/gpu/drm/drm_ioctl.c                   | 58 +++++++++++++++++++
>>   drivers/gpu/drm/i915/gem/i915_gem_context.c   | 18 ++++++
>>   drivers/gpu/drm/i915/gem/i915_gem_context.h   |  2 +
>>   .../gpu/drm/i915/gem/i915_gem_context_types.h |  2 +
>>   drivers/gpu/drm/i915/i915_driver.c            |  2 +
>>   include/drm/drm_device.h                      |  3 +
>>   include/drm/drm_drv.h                         |  3 +
>>   include/uapi/drm/drm.h                        | 21 +++++++
>>   include/uapi/drm/drm_mode.h                   | 15 +++++
>>   17 files changed, 233 insertions(+), 3 deletions(-)
>>
> 
