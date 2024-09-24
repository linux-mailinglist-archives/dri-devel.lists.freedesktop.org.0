Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 173D6984BEC
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 22:10:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A989110E739;
	Tue, 24 Sep 2024 20:10:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="WgHBKzw/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 6984 seconds by postgrey-1.36 at gabe;
 Tue, 24 Sep 2024 20:10:03 UTC
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 721A010E739
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 20:10:03 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 48OIDJS4022889;
 Tue, 24 Sep 2024 13:13:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1727201599;
 bh=yz+d9tmE3ccgdNyIA3FDM5CKOiXSktFesbMAzPEmn6c=;
 h=Date:From:Subject:To:CC:References:In-Reply-To;
 b=WgHBKzw/NDf+z54iyGZH64D2eGWufidtHZkNh8zBpYoMfbThnyfjdm+O+iTjj+bcd
 rkaMQftk3+f1qDShwR2cAfLvceGX8j/zr9tgkFufj2TV4o0H8etKqu9pfQLjk7ueB8
 HWT4hNo2qGpgUxpxKx3KGQo3KhZSMyv2QM4hOGJs=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 48OIDJps042351;
 Tue, 24 Sep 2024 13:13:19 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 24
 Sep 2024 13:13:18 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 24 Sep 2024 13:13:19 -0500
Received: from [10.249.42.149] ([10.249.42.149])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 48OIDIOv057570;
 Tue, 24 Sep 2024 13:13:18 -0500
Message-ID: <d8e0cb78-7cfb-42bf-b3a5-f765592e8dd4@ti.com>
Date: Tue, 24 Sep 2024 13:13:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Davis <afd@ti.com>
Subject: Re: [RFC PATCH 0/4] Linaro restricted heap
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jens Wiklander
 <jens.wiklander@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <op-tee@lists.trustedfirmware.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 Olivier Masse <olivier.masse@nxp.com>, Thierry Reding
 <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, Sumit Garg
 <sumit.garg@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
 <dhxvyshwi4qmcmwceokhqey2ww4azjcs6qrpnkgivdj7tv5cke@r36srvvbof6q>
Content-Language: en-US
In-Reply-To: <dhxvyshwi4qmcmwceokhqey2ww4azjcs6qrpnkgivdj7tv5cke@r36srvvbof6q>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

On 9/23/24 1:33 AM, Dmitry Baryshkov wrote:
> Hi,
> 
> On Fri, Aug 30, 2024 at 09:03:47AM GMT, Jens Wiklander wrote:
>> Hi,
>>
>> This patch set is based on top of Yong Wu's restricted heap patch set [1].
>> It's also a continuation on Olivier's Add dma-buf secure-heap patch set [2].
>>
>> The Linaro restricted heap uses genalloc in the kernel to manage the heap
>> carvout. This is a difference from the Mediatek restricted heap which
>> relies on the secure world to manage the carveout.
>>
>> I've tried to adress the comments on [2], but [1] introduces changes so I'm
>> afraid I've had to skip some comments.
> 
> I know I have raised the same question during LPC (in connection to
> Qualcomm's dma-heap implementation). Is there any reason why we are
> using generic heaps instead of allocating the dma-bufs on the device
> side?
> 
> In your case you already have TEE device, you can use it to allocate and
> export dma-bufs, which then get imported by the V4L and DRM drivers.
> 

This goes to the heart of why we have dma-heaps in the first place.
We don't want to burden userspace with having to figure out the right
place to get a dma-buf for a given use-case on a given hardware.
That would be very non-portable, and fail at the core purpose of
a kernel: to abstract hardware specifics away.

Worse, the actual interface for dma-buf exporting changes from
framework to framework (getting a dma-buf from DRM is different
than V4L, and there would be yet another API for TEE, etc..)

Most subsystem don't need an allocator, they work just fine
simply being only dma-bufs importers. Recent example being the
IIO subsystem[0], for which some early posting included an
allocator, but in the end, all that was needed was to consume
buffers.

For devices that don't actually contain memory there is no
reason to be an exporter. What most want is just to consume
normal system memory. Or system memory with some constraints
(e.g. contiguous, coherent, restricted, etc..).

> I have a feeling (I might be completely wrong here) that by using
> generic dma-buf heaps we can easily end up in a situation when the
> userspace depends heavily on the actual platform being used (to map the
> platform to heap names). I think we should instead depend on the
> existing devices (e.g. if there is a TEE device, use an IOCTL to
> allocate secured DMA BUF from it, otherwise check for QTEE device,
> otherwise check for some other vendor device).
> 
> The mental experiment to check if the API is correct is really simple:
> Can you use exactly the same rootfs on several devices without
> any additional tuning (e.g. your QEMU, HiKey, a Mediatek board, Qualcomm
> laptop, etc)?
> 

This is a great north star to follow. And exactly the reason we should
*not* be exposing device specific constraints to userspace. The constrains
change based on the platform. So a userspace would have to also pick
a different set of constraints based on each platform.

Userspace knows which subsystems it will attach a buffer, and the
kernel knows what constraints those devices have on a given platform.
Ideal case is then allocate from the one exporter, attach to various
devices, and have the constraints solved at map time by the exporter
based on the set of attached devices.

For example, on one platform the display needs contiguous buffers,
but on a different platform the display can scatter-gather. So
what heap should our generic application allocate from when it
wants a buffer consumable by the display, CMA or System?
Answer *should* be always use the generic exporter, and that
exporter then picks the right backing type based on the platform.

Userspace shouldn't be dealing with any of these constraints
(looking back, adding the CMA heap was probably incorrect,
and the System heap should have been the only one. Idea back
then was a userspace helper would show up to do the constraint
solving and pick the right heap. That has yet to materialize and
folks are still just hardcoding which heap to use..).

Same for this restricted heap, I'd like to explore if we can
enhance the System heap such that when attached to the TEE framework,
the backing memory is either made restricted by fire-walling,
or allocating from a TEE carveout (based on platform).

This will mean more inter-subsystem coordination, but we can
iterate on these in kernel interfaces. We cannot iterate on
userspace interfaces, those have to be correct the first time.

Andrew

[0] https://www.kernel.org/doc/html/next/iio/iio_dmabuf_api.html

>>
>> This can be tested on QEMU with the following steps:
>> repo init -u https://github.com/jenswi-linaro/manifest.git -m qemu_v8.xml \
>>          -b prototype/sdp-v1
>> repo sync -j8
>> cd build
>> make toolchains -j4
>> make all -j$(nproc)
>> make run-only
>> # login and at the prompt:
>> xtest --sdp-basic
>>
>> https://optee.readthedocs.io/en/latest/building/prerequisites.html
>> list dependencies needed to build the above.
>>
>> The tests are pretty basic, mostly checking that a Trusted Application in
>> the secure world can access and manipulate the memory.
> 
> - Can we test that the system doesn't crash badly if user provides
>    non-secured memory to the users which expect a secure buffer?
> 
> - At the same time corresponding entities shouldn't decode data to the
>    buffers accessible to the rest of the sytem.
> 
>>
>> Cheers,
>> Jens
>>
>> [1] https://lore.kernel.org/dri-devel/20240515112308.10171-1-yong.wu@mediatek.com/
>> [2] https://lore.kernel.org/lkml/20220805135330.970-1-olivier.masse@nxp.com/
>>
>> Changes since Olivier's post [2]:
>> * Based on Yong Wu's post [1] where much of dma-buf handling is done in
>>    the generic restricted heap
>> * Simplifications and cleanup
>> * New commit message for "dma-buf: heaps: add Linaro restricted dmabuf heap
>>    support"
>> * Replaced the word "secure" with "restricted" where applicable
>>
>> Etienne Carriere (1):
>>    tee: new ioctl to a register tee_shm from a dmabuf file descriptor
>>
>> Jens Wiklander (2):
>>    dma-buf: heaps: restricted_heap: add no_map attribute
>>    dma-buf: heaps: add Linaro restricted dmabuf heap support
>>
>> Olivier Masse (1):
>>    dt-bindings: reserved-memory: add linaro,restricted-heap
>>
>>   .../linaro,restricted-heap.yaml               |  56 ++++++
>>   drivers/dma-buf/heaps/Kconfig                 |  10 ++
>>   drivers/dma-buf/heaps/Makefile                |   1 +
>>   drivers/dma-buf/heaps/restricted_heap.c       |  17 +-
>>   drivers/dma-buf/heaps/restricted_heap.h       |   2 +
>>   .../dma-buf/heaps/restricted_heap_linaro.c    | 165 ++++++++++++++++++
>>   drivers/tee/tee_core.c                        |  38 ++++
>>   drivers/tee/tee_shm.c                         | 104 ++++++++++-
>>   include/linux/tee_drv.h                       |  11 ++
>>   include/uapi/linux/tee.h                      |  29 +++
>>   10 files changed, 426 insertions(+), 7 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/reserved-memory/linaro,restricted-heap.yaml
>>   create mode 100644 drivers/dma-buf/heaps/restricted_heap_linaro.c
>>
>> -- 
>> 2.34.1
>>
> 
