Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A47269A4554
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 19:56:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAFE110E966;
	Fri, 18 Oct 2024 17:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="I2PEjuhp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AFA210E971;
 Fri, 18 Oct 2024 17:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XZD/gvB83PKnwisZBkWxHlR7LEJW6CWooeqfBXNDULM=; b=I2PEjuhpoqMDdK3A2fJbJkJSxi
 nMapIW9kP/hPgQAaLxoK9W0BAvFUKYwf8CiLz+zo/EPph3NsK0unht4tfHW3K2ZlFf6kMgia9+PYe
 0FSi2g0sNEZk03XucNtajfHsyYpc/xvJZiW7SNFDvP5xYJNmIKoE8NIEZ6wmhiQzBX6ylZsS7C0ga
 VETqV+EDJ4CG0UxtBGOPybNsBH/OHNS8JgDXQtAJ9C7F+8ol0Vmc23GDdGv/uyKxZz+rDFBEdgw5r
 AAOzA2CxHjMgbbzCXbaZeAjejhC7Ka2YkevkqxJDzdsgK/9NaHSykpyT6i/TZZzS9feXVpMrqyPus
 XvnT2jNQ==;
Received: from [179.118.186.49] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1t1rD8-00CB2m-As; Fri, 18 Oct 2024 19:56:26 +0200
Message-ID: <3fac9971-8d26-4d52-badb-2b14b3f84263@igalia.com>
Date: Fri, 18 Oct 2024 14:56:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] drm: Introduce device wedged event
To: Alex Deucher <alexdeucher@gmail.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>, intel-xe@lists.freedesktop.org,
 thomas.hellstrom@linux.intel.com, simona@ffwll.ch,
 intel-gfx@lists.freedesktop.org, joonas.lahtinen@linux.intel.com,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 lucas.demarchi@intel.com, tursulin@ursulin.net, francois.dugast@intel.com,
 jani.nikula@linux.intel.com, airlied@gmail.com,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 andi.shyti@linux.intel.com, matthew.d.roper@intel.com,
 andriy.shevchenko@linux.intel.com, lina@asahilina.net,
 kernel-dev@igalia.com, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20240930073845.347326-1-raag.jadav@intel.com>
 <20240930073845.347326-2-raag.jadav@intel.com>
 <ed8cb1e9-df05-44a7-9088-90b3ee8dce85@igalia.com>
 <ZxJ3DJWY9Lsc9Mn4@intel.com>
 <CADnq5_M62YZRvBT7sQwrZTiHrUsifaqqgrWOD_z+YY=EiBtEcA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <CADnq5_M62YZRvBT7sQwrZTiHrUsifaqqgrWOD_z+YY=EiBtEcA@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Em 18/10/2024 12:31, Alex Deucher escreveu:
> On Fri, Oct 18, 2024 at 11:23 AM Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>>
>> On Thu, Oct 17, 2024 at 04:16:09PM -0300, André Almeida wrote:
>>> Hi Raag,
>>>
>>> Em 30/09/2024 04:38, Raag Jadav escreveu:
>>>> Introduce device wedged event, which will notify userspace of wedged
>>>> (hanged/unusable) state of the DRM device through a uevent. This is
>>>> useful especially in cases where the device is no longer operating as
>>>> expected even after a hardware reset and has become unrecoverable from
>>>> driver context.
>>>>
>>>> Purpose of this implementation is to provide drivers a generic way to
>>>> recover with the help of userspace intervention. Different drivers may
>>>> have different ideas of a "wedged device" depending on their hardware
>>>> implementation, and hence the vendor agnostic nature of the event.
>>>> It is up to the drivers to decide when they see the need for recovery
>>>> and how they want to recover from the available methods.
>>>>
>>>> Current implementation defines three recovery methods, out of which,
>>>> drivers can choose to support any one or multiple of them. Preferred
>>>> recovery method will be sent in the uevent environment as WEDGED=<method>.
>>>> Userspace consumers (sysadmin) can define udev rules to parse this event
>>>> and take respective action to recover the device.
>>>>
>>>>       =============== ==================================
>>>>       Recovery method Consumer expectations
>>>>       =============== ==================================
>>>>       rebind          unbind + rebind driver
>>>>       bus-reset       unbind + reset bus device + rebind
>>>>       reboot          reboot system
>>>>       =============== ==================================
>>>>
>>>>
>>>
>>> I proposed something similar in the past: https://lore.kernel.org/dri-devel/20221125175203.52481-1-andrealmeid@igalia.com/
>>>
>>> The motivation was that amdgpu was getting stuck after every GPU reset, and
>>> there was just a black screen. The uevent would then trigger a daemon to
>>> reset the compositor and getting things back together. As you can see in my
>>> thread, the feature was blocked in favor of getting better overall GPU reset
>>> from the kernel side.
>>>
>>> Which kind of scenarios are making i915/xe the need to have userspace
>>> involvement? I tested a bunch of resets in i915 but never managed to get the
>>> driver stuck.
>>
>> 2 scenarios:
>>
>> 1. Multiple levels of reset has failed and device was declared wedged. This is
>> rare indeed as the resets improved a lot.
>> 2. Debug case. We can boot the driver with option to declare device wedged at
>> any timeout, so the device can be debugged.
>>
>>>
>>> For the bus-reset, amdgpu does that too, but it doesn't require userspace
>>> intervention.
>>
>> How do you trigger that?
> 
> What do you mean by bus reset?  I think Chrisitian is just referring
> to a full adapter reset (as opposed to a queue reset or something more
> fine grained).  Driver can reset the device via MMIO or firmware,
> depending on the device.  I think there are also PCI helpers for
> things like PCI FLR.
> 

I was referring to AMD_RESET_PCI:

"Does a full bus reset using core Linux subsystem PCI reset and does a 
secondary bus reset or FLR, depending on what the underlying hardware 
supports."

And that can be triggered by using `amdgpu_reset_method=5` as the module 
option.

