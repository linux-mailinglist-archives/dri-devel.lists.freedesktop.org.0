Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC52AE8347
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 14:54:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 852C710E219;
	Wed, 25 Jun 2025 12:53:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="MqvdsWfu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47BE810E219
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 12:53:52 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250625125350euoutp0129bac0d776acf9d1e2a6f709a8b3c392~MSkiPlCY62064720647euoutp01S
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 12:53:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250625125350euoutp0129bac0d776acf9d1e2a6f709a8b3c392~MSkiPlCY62064720647euoutp01S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1750856030;
 bh=aHXPUrYiaWgQA8BN5Zf+BoDPK1tGYC0F+73wV5XjTXY=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=MqvdsWfuDOMUFFdpZ++uCNDRxIxCYkqgAv84879K/bIrv/0/5F8bSGtujVlCGo0Mi
 2TWRc/cy9lNQA6MawjAhJV+EChId0q2Qo+ybYx2viknaXnZ5ZFh++pV8cpExALdK+e
 AnqE2vKquHMcYIQjfNAMwsCUKOQJY7GIO+5WumIA=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250625125350eucas1p1dad14e84a8cc44516174ecc9053727b1~MSkhvbtf41252112521eucas1p14;
 Wed, 25 Jun 2025 12:53:50 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250625125349eusmtip10a4e23d9061b04dad7c3aa6ff3064088~MSkgtbupw0720807208eusmtip1C;
 Wed, 25 Jun 2025 12:53:48 +0000 (GMT)
Message-ID: <0b3d2deb-7f27-4390-b43e-353d4ba17bd7@samsung.com>
Date: Wed, 25 Jun 2025 14:53:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 8/8] drm/imagination: Enable PowerVR driver for RISC-V
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>, Frank
 Binns <Frank.Binns@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>, Marek
 Szyprowski <m.szyprowski@samsung.com>, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-pm@vger.kernel.org"
 <linux-pm@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <ff96ee1f-23ad-4e7f-9ac1-11f410e459e3@imgtec.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250625125350eucas1p1dad14e84a8cc44516174ecc9053727b1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250623114439eucas1p17e4405b95a5693a972bf40a3b3ecdc11
X-EPHeader: CA
X-CMS-RootMailID: 20250623114439eucas1p17e4405b95a5693a972bf40a3b3ecdc11
References: <20250623-apr_14_for_sending-v6-0-6583ce0f6c25@samsung.com>
 <CGME20250623114439eucas1p17e4405b95a5693a972bf40a3b3ecdc11@eucas1p1.samsung.com>
 <20250623-apr_14_for_sending-v6-8-6583ce0f6c25@samsung.com>
 <ff96ee1f-23ad-4e7f-9ac1-11f410e459e3@imgtec.com>
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



On 6/24/25 15:54, Matt Coster wrote:
> On 23/06/2025 12:42, Michal Wilczynski wrote:
>> Several RISC-V boards feature Imagination GPUs that are compatible with
>> the PowerVR driver. An example is the IMG BXM-4-64 GPU on the Lichee Pi
>> 4A board. This commit adjusts the driver's Kconfig dependencies to allow
>> the PowerVR driver to be compiled on the RISC-V architecture.
>>
>> By enabling compilation on RISC-V, we expand support for these GPUs,
>> providing graphics acceleration capabilities and enhancing hardware
>> compatibility on RISC-V platforms.
>>
>> Add a dependency on MMU to fix a build warning on RISC-V configurations
>> without an MMU.
>>
>> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>> ---
>>  drivers/gpu/drm/imagination/Kconfig | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/imagination/Kconfig b/drivers/gpu/drm/imagination/Kconfig
>> index 5f9fff43d6baadc42ebf48d91729bfbf27e06caa..a7da858a5b301e8f088e3e22f5641feb2e078681 100644
>> --- a/drivers/gpu/drm/imagination/Kconfig
>> +++ b/drivers/gpu/drm/imagination/Kconfig
>> @@ -3,9 +3,10 @@
>>  
>>  config DRM_POWERVR
>>  	tristate "Imagination Technologies PowerVR (Series 6 and later) & IMG Graphics"
>> -	depends on ARM64
>> +	depends on (ARM64 || RISCV)
> 
> There were two issues you encountered when enabling COMPILE_TEST in v5,
> both of which are somewhat simple to workaround but expose underlying
> assumptions we made during early development.
> 
> The first [1] is due to us assuming a 64-bit platform, which was never a
> problem with the ARM64 dependency, but may actually be a problem with
> RISCV given this allows for 32-bit as well. You should probably make
> this (RISCV && 64BIT) until the implicit 64-bit dependency can be worked
> out.

Yeah will incude that in next revision.

> 
> Somewhat related, we also assume a little-endian host. Technically ARM64
> can also be big-endian, you just don't encounter that in the wild too
> often so it's never been a "real" issue. I do wonder if swapping out
> (ARM64 || RISCV) for (64BIT && CPU_LITTLE_ENDIAN) entirely would be a
> reasonable change, perhaps for another day though...
> 
> The other [2] is slightly more subtle. To keep things straightforward,
> we currently map CPU pages to GPU pages 1:1, meaning we use the CPU page
> size to define the GPU page size. That GPU page size is configurable,
> but does not support every possible size the CPU could support on any
> architecture. The failing test there was sparc64 with an 8K page size
> causing no GPU page size to be defined. See the #if/#elif ladder at the
> top of pvr_mmu.c for the supported sizes and the doc comment above
> PVR_DEVICE_PAGE_SIZE in pvr_mmu.h for the acknowledgement of the page
> size restrictions.
> 
> The "proper" fix here would be for us to make these two sizes
> independent, but that's not a trivial change. The "quick" fix I suppose
> would be to depend on one of the supported page sizes, so maybe
> (PAGE_SIZE_4KB || PAGE_SIZE_16KB || PAGE_SIZE_64KB || PAGE_SIZE_256KB)
> since the larger page sizes appear unsupported (probably for good
> reason).

Thanks for a great explanation !

> 
>>  	depends on DRM
>>  	depends on PM
>> +	depends on MMU
> 
> Nit: can you keep this alphabetical?
> 
> Cheers,
> Matt
> 
> [1]: https://lore.kernel.org/r/202506191323.zD1fszQb-lkp@intel.com/
> [2]: https://lore.kernel.org/r/202506201103.GX6DA9Gx-lkp@intel.com/
> 
>>  	select DRM_EXEC
>>  	select DRM_GEM_SHMEM_HELPER
>>  	select DRM_SCHED
>>
> 
> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>
