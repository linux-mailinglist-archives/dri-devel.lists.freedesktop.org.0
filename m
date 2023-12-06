Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 486AB8073F3
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 16:47:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82F3110E631;
	Wed,  6 Dec 2023 15:47:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5C4C110E631
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 15:47:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C308143D;
 Wed,  6 Dec 2023 07:48:14 -0800 (PST)
Received: from [10.57.74.196] (unknown [10.57.74.196])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 194573F5A1;
 Wed,  6 Dec 2023 07:47:25 -0800 (PST)
Message-ID: <43a75119-b15d-4570-b272-1fe702784632@arm.com>
Date: Wed, 6 Dec 2023 15:47:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/14] drm: Add a driver for CSF-based Mali GPUs
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Stone <daniels@collabora.com>, kernel@collabora.com
References: <20231204173313.2098733-1-boris.brezillon@collabora.com>
 <20231205094847.221ab103@collabora.com>
Content-Language: en-GB
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20231205094847.221ab103@collabora.com>
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/12/2023 08:48, Boris Brezillon wrote:
> Hi Steve,
> 
> I forgot to mention that I intentionally dropped your R-b, because
> there was a gazillion of changes all over the place, and I thought it
> deserved a fresh review.

No problem, I'll re-review the patches. Thanks for getting the v3 out to
review.

<snip>

>> [3]https://gitlab.freedesktop.org/panfrost/linux/-/tree/panthor-v3
>> [4]https://gitlab.freedesktop.org/panfrost/linux/-/tree/panthor-v3+rk3588

AFAICT neither of these trees match (exactly) with what you've posted.
Not a big deal - I'll review the patches on the list, but it's a little
confusing having a 'v3' branch which doesn't match the actual v3 posted
;) I also note you have similarly named branches in
https://gitlab.freedesktop.org/bbrezillon/linux which are more
up-to-date but also not 'v3'.

Steve

>> [5]https://gitlab.com/firefly-linux/external/libmali/-/raw/firefly/firmware/g610/mali_csffw.bin
>> [6]https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/26358
>>
>> Boris Brezillon (13):
>>   drm/panthor: Add uAPI
>>   drm/panthor: Add GPU register definitions
>>   drm/panthor: Add the device logical block
>>   drm/panthor: Add the GPU logical block
>>   drm/panthor: Add GEM logical block
>>   drm/panthor: Add the devfreq logical block
>>   drm/panthor: Add the MMU/VM logical block
>>   drm/panthor: Add the FW logical block
>>   drm/panthor: Add the heap logical block
>>   drm/panthor: Add the scheduler logical block
>>   drm/panthor: Add the driver frontend block
>>   drm/panthor: Allow driver compilation
>>   drm/panthor: Add an entry to MAINTAINERS
> 
> 
> 
>>
>> Liviu Dudau (1):
>>   dt-bindings: gpu: mali-valhall-csf: Add support for Arm Mali CSF GPUs
>>
>>  .../bindings/gpu/arm,mali-valhall-csf.yaml    |  147 +
>>  Documentation/gpu/driver-uapi.rst             |    5 +
>>  MAINTAINERS                                   |   11 +
>>  drivers/gpu/drm/Kconfig                       |    2 +
>>  drivers/gpu/drm/Makefile                      |    1 +
>>  drivers/gpu/drm/panthor/Kconfig               |   23 +
>>  drivers/gpu/drm/panthor/Makefile              |   15 +
>>  drivers/gpu/drm/panthor/panthor_devfreq.c     |  283 ++
>>  drivers/gpu/drm/panthor/panthor_devfreq.h     |   25 +
>>  drivers/gpu/drm/panthor/panthor_device.c      |  497 +++
>>  drivers/gpu/drm/panthor/panthor_device.h      |  381 ++
>>  drivers/gpu/drm/panthor/panthor_drv.c         | 1454 +++++++
>>  drivers/gpu/drm/panthor/panthor_fw.c          | 1332 +++++++
>>  drivers/gpu/drm/panthor/panthor_fw.h          |  504 +++
>>  drivers/gpu/drm/panthor/panthor_gem.c         |  227 ++
>>  drivers/gpu/drm/panthor/panthor_gem.h         |  144 +
>>  drivers/gpu/drm/panthor/panthor_gpu.c         |  481 +++
>>  drivers/gpu/drm/panthor/panthor_gpu.h         |   52 +
>>  drivers/gpu/drm/panthor/panthor_heap.c        |  517 +++
>>  drivers/gpu/drm/panthor/panthor_heap.h        |   36 +
>>  drivers/gpu/drm/panthor/panthor_mmu.c         | 2653 +++++++++++++
>>  drivers/gpu/drm/panthor/panthor_mmu.h         |  101 +
>>  drivers/gpu/drm/panthor/panthor_regs.h        |  237 ++
>>  drivers/gpu/drm/panthor/panthor_sched.c       | 3410 +++++++++++++++++
>>  drivers/gpu/drm/panthor/panthor_sched.h       |   48 +
>>  include/uapi/drm/panthor_drm.h                |  892 +++++
>>  26 files changed, 13478 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
>>  create mode 100644 drivers/gpu/drm/panthor/Kconfig
>>  create mode 100644 drivers/gpu/drm/panthor/Makefile
>>  create mode 100644 drivers/gpu/drm/panthor/panthor_devfreq.c
>>  create mode 100644 drivers/gpu/drm/panthor/panthor_devfreq.h
>>  create mode 100644 drivers/gpu/drm/panthor/panthor_device.c
>>  create mode 100644 drivers/gpu/drm/panthor/panthor_device.h
>>  create mode 100644 drivers/gpu/drm/panthor/panthor_drv.c
>>  create mode 100644 drivers/gpu/drm/panthor/panthor_fw.c
>>  create mode 100644 drivers/gpu/drm/panthor/panthor_fw.h
>>  create mode 100644 drivers/gpu/drm/panthor/panthor_gem.c
>>  create mode 100644 drivers/gpu/drm/panthor/panthor_gem.h
>>  create mode 100644 drivers/gpu/drm/panthor/panthor_gpu.c
>>  create mode 100644 drivers/gpu/drm/panthor/panthor_gpu.h
>>  create mode 100644 drivers/gpu/drm/panthor/panthor_heap.c
>>  create mode 100644 drivers/gpu/drm/panthor/panthor_heap.h
>>  create mode 100644 drivers/gpu/drm/panthor/panthor_mmu.c
>>  create mode 100644 drivers/gpu/drm/panthor/panthor_mmu.h
>>  create mode 100644 drivers/gpu/drm/panthor/panthor_regs.h
>>  create mode 100644 drivers/gpu/drm/panthor/panthor_sched.c
>>  create mode 100644 drivers/gpu/drm/panthor/panthor_sched.h
>>  create mode 100644 include/uapi/drm/panthor_drm.h
>>
> 

