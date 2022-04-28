Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DD7513927
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 17:56:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E61D10E6CE;
	Thu, 28 Apr 2022 15:56:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E703610E6CE
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 15:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NAVO6GO4V+BR9ZQy4hKCv3Ayu8fcDUtPDQrlXbpnU30=; b=nVX3OfNi4kwA5p+zj/iITV1MvQ
 n601hRkrAGw4XDX7cNUhiQdh6gSRIRbvMweM3MBDkXEI1AL3nOOQvYHahQNp6cymX4gK/UFmSGEp7
 SGc9K7YDDG+qzW2a8kq/1zxQ+ns6W8x4WKEHIX8yVSIpTqihFUsDFTFJwl29teCJ1OgpW4egxMTM9
 BH8nlwR/75GNzqXESRFrqDVujjytOt7ohbihDQx9Biawd0gGLTi7bh2YWTvhU7Y8ouD81XSAfAosh
 uZhEwtzmVGOszJ8HlyDrWj6xTxqnuiasjIU2gETISv2yBJnyN0WDVIjdCe6BJSeXJZN7VGq1vdrhA
 ovbt71Cg==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1nk6Ux-00015p-Vz; Thu, 28 Apr 2022 18:56:08 +0300
Message-ID: <beacfd71-ebd0-7fde-187f-34b7a42a47de@kapsi.fi>
Date: Thu, 28 Apr 2022 18:56:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v2 0/4] drm/nvdla: Add driver support for NVDLA
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>,
 Cai Huoqing <cai.huoqing@linux.dev>
References: <20220426060808.78225-1-cai.huoqing@linux.dev>
 <YmqgailZKIuY7zTZ@orome>
From: Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <YmqgailZKIuY7zTZ@orome>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/28/22 17:10, Thierry Reding wrote:
> On Tue, Apr 26, 2022 at 02:07:57PM +0800, Cai Huoqing wrote:
>> The NVIDIA Deep Learning Accelerator (NVDLA) is an open source IP
>> which is integrated into NVIDIA Jetson AGX Xavier,
>> so add driver support for this accelerator."
> 
> Hi,
> 
> nice to see this work going on. For subsequent revisions, can you please
> also Cc the Tegra mailing list (linux-tegra@vger.kernel.org) as well as
> the Tegra platform maintainers (that's Jon Hunter and myself). This will
> make sure that more people with an interest in this will see your work.
> Not everyone follows dri-devel, linaro-mm-sig or linux-media.
> 
> Thanks,
> Thierry

 From a quick glance it looks like this driver pokes DLA hardware 
directly which is not the intended programming model on Tegra hardware 
(there are Falcon microcontrollers that offload task scheduling and 
synchronization from the CPU). The hardware is also behind the Host1x 
bus so a simple platform device is not sufficient.

Was this driver developed against some platform with OpenDLA hardware 
(i.e. not Tegra)?

If so, we'd need to verify if the hardware matches the hardware in 
Tegra194. Also, this driver may not be ideal for Tegra platforms since 
we would lack the hardware scheduling and synchronization facilities. It 
is likely necessary to have separate drivers for OpenDLA and Tegra's DLA 
integration.

Thanks,
Mikko

> 
>>
>> v1->v2:
>> *Rename nvdla_drm.[ch] to nvdla_drv.[ch] and rename nvdla_ioctl.h to nvdla_drm.h,
>>   move it to uapi.
>>   comments link: https://lore.kernel.org/lkml/20bac605-97e6-e5cd-c4e4-83a8121645d8@amd.com/
>> *Remove the  onexistent filename  in Makefile
>>   comments link: https://lore.kernel.org/lkml/202204201512.pp20MXT5-lkp@intel.com/
>> *Sort file names alphabetically in Makefile.
>> *Rearrange the error messages, and use drm_err/_dbg() instead of pr_err/_dbg().
>> *Replace  "dla_" prefix with "nvdla_"
>> *Check the iosys_map by iosys_map_is_null(), and check "ret" directly.
>> *Using iosys_map_memcpy_to/_from() for iosys_map instead of memcpy()
>> *Fix parameter error "dma_buf_vunmap(buf, ptr)", use "&map" instead of "ptr"
>> *Use iosys_map instead of kvaddr and use "iosys_map_set_vaddr()" to initialize iosys_map
>> *Using "vma->vm_pgoff -= drm_vma_node_start(&obj->vma_node)" to update vm_pgoff is cleaner
>> *Remove the unused nvdla_drm_gem_mmap, register drm_gem_mmap to file_operations directly.
>> *Use DEFINE_DRM_GEM_FOPS() to define nvdla_drm_fops.
>> *Remove the unused nvdla_drm_gem_mmap_buf, register drm_gem_prime_mmap to drm_driver directly.
>>   comments link: https://lore.kernel.org/lkml/7fa19996-5830-af3d-ab24-08c76e1d5604@suse.de/
>> *Fix typo and some code style
>> *Remove unused function nvdla_get_time_us()
>>   comments link: https://lore.kernel.org/lkml/0fa9ab41-c18e-a569-e6fe-a0e9d965905e@stargateuniverse.net/
>>
>> Cai Huoqing (4):
>>    MAINTAINERS: Add the driver info of the NVDLA
>>    drm/nvdla: Add driver support for NVDLA
>>    drm/nvdla: Add register head file of NVDLA
>>    drm/nvdla/uapi: Add UAPI of NVDLA driver
>>
>>   MAINTAINERS                             |    7 +
>>   drivers/gpu/drm/Kconfig                 |    2 +
>>   drivers/gpu/drm/Makefile                |    1 +
>>   drivers/gpu/drm/nvdla/Kconfig           |    8 +
>>   drivers/gpu/drm/nvdla/Makefile          |   17 +
>>   drivers/gpu/drm/nvdla/nvdla_bdma.c      |  198 +
>>   drivers/gpu/drm/nvdla/nvdla_cache.c     |  202 +
>>   drivers/gpu/drm/nvdla/nvdla_cdp.c       |  299 ++
>>   drivers/gpu/drm/nvdla/nvdla_common.c    |  293 ++
>>   drivers/gpu/drm/nvdla/nvdla_common.h    |  835 +++
>>   drivers/gpu/drm/nvdla/nvdla_conv.c      |  684 +++
>>   drivers/gpu/drm/nvdla/nvdla_drv.c       |  694 +++
>>   drivers/gpu/drm/nvdla/nvdla_drv.h       |  129 +
>>   drivers/gpu/drm/nvdla/nvdla_engine.c    |  233 +
>>   drivers/gpu/drm/nvdla/nvdla_engine.h    |  272 +
>>   drivers/gpu/drm/nvdla/nvdla_gem.c       |  358 ++
>>   drivers/gpu/drm/nvdla/nvdla_pdp.c       |  448 ++
>>   drivers/gpu/drm/nvdla/nvdla_reg.h       | 6411 +++++++++++++++++++++++
>>   drivers/gpu/drm/nvdla/nvdla_rubik.c     |  214 +
>>   drivers/gpu/drm/nvdla/nvdla_sched.h     |   37 +
>>   drivers/gpu/drm/nvdla/nvdla_scheduler.c | 1012 ++++
>>   drivers/gpu/drm/nvdla/nvdla_sdp.c       |  723 +++
>>   include/uapi/drm/nvdla_drm.h            |   99 +
>>   23 files changed, 13176 insertions(+)
>>   create mode 100644 drivers/gpu/drm/nvdla/Kconfig
>>   create mode 100644 drivers/gpu/drm/nvdla/Makefile
>>   create mode 100644 drivers/gpu/drm/nvdla/nvdla_bdma.c
>>   create mode 100644 drivers/gpu/drm/nvdla/nvdla_cache.c
>>   create mode 100644 drivers/gpu/drm/nvdla/nvdla_cdp.c
>>   create mode 100644 drivers/gpu/drm/nvdla/nvdla_common.c
>>   create mode 100644 drivers/gpu/drm/nvdla/nvdla_common.h
>>   create mode 100644 drivers/gpu/drm/nvdla/nvdla_conv.c
>>   create mode 100644 drivers/gpu/drm/nvdla/nvdla_drv.c
>>   create mode 100644 drivers/gpu/drm/nvdla/nvdla_drv.h
>>   create mode 100644 drivers/gpu/drm/nvdla/nvdla_engine.c
>>   create mode 100644 drivers/gpu/drm/nvdla/nvdla_engine.h
>>   create mode 100644 drivers/gpu/drm/nvdla/nvdla_gem.c
>>   create mode 100644 drivers/gpu/drm/nvdla/nvdla_pdp.c
>>   create mode 100644 drivers/gpu/drm/nvdla/nvdla_reg.h
>>   create mode 100644 drivers/gpu/drm/nvdla/nvdla_rubik.c
>>   create mode 100644 drivers/gpu/drm/nvdla/nvdla_sched.h
>>   create mode 100644 drivers/gpu/drm/nvdla/nvdla_scheduler.c
>>   create mode 100644 drivers/gpu/drm/nvdla/nvdla_sdp.c
>>   create mode 100644 include/uapi/drm/nvdla_drm.h
>>
>> -- 
>> 2.25.1
>>

