Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E94C84A542F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 01:36:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2103C10E1E4;
	Tue,  1 Feb 2022 00:36:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9210E10E1E4;
 Tue,  1 Feb 2022 00:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643675809; x=1675211809;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=I4B8ENurVPlobb3Bb/NoyCwf/pRY8NKrqHRhZSpa2Io=;
 b=PTTVx/qMRKT9vc74llInPGyMnvXN/476n5+FstpN1C0robc9BdndKBOq
 YpSDWDBbiP9lqdx89subhQIQpCyldPLOiNV6UJPcuURHW54uVTP2dhgUT
 9HDuKvlakSf/3soXbxCbREkHS1rkzYL7u45NxHGi3xHqIfDlOM7V8yGHL
 dGjlWLnrUm6+2ODNIsXxGoWor15lxEadsO4UbtUm1pVk+DMBMcwK5EWSe
 YI0S+Q/Ua67EqbtYXKhWfjOOr9VFW3Kbl71bMddUzIToCH8t3wSPDQvqG
 k5vPBXOhR2QA0E1cQ9CXf3iVuPXOlZ9RUMoeFy+KOdO8rr7xGfKO8LCyE w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="272067214"
X-IronPort-AV: E=Sophos;i="5.88,332,1635231600"; d="scan'208";a="272067214"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2022 16:36:48 -0800
X-IronPort-AV: E=Sophos;i="5.88,332,1635231600"; d="scan'208";a="482004598"
Received: from cnierman-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.195.98])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2022 16:36:48 -0800
Date: Mon, 31 Jan 2022 16:36:47 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH 00/14] Rename dma-buf-map
Message-ID: <20220201003647.djakrmdebqigpz3j@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220128083626.3012259-1-lucas.demarchi@intel.com>
 <a45a8cef-f5e7-604c-64f1-e893ec9ba8af@amd.com>
 <20220128091213.qaq6v4vbeerzvd3f@ldmartin-desk2>
 <27870484-6d16-5bd4-aa06-0ec513111d99@amd.com>
 <20220128094018.m7pixeznedoa47gb@ldmartin-desk2>
 <36a08a90-3614-27b4-166b-9d113b644af3@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <36a08a90-3614-27b4-166b-9d113b644af3@amd.com>
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
Cc: airlied@linux.ie, daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, srinivas.kandagatla@linaro.org,
 tzimmermann@suse.de, gregkh@linuxfoundation.org, nouveau@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 28, 2022 at 10:48:42AM +0100, Christian König wrote:
>Am 28.01.22 um 10:40 schrieb Lucas De Marchi:
>>On Fri, Jan 28, 2022 at 10:22:00AM +0100, Christian König wrote:
>>>Am 28.01.22 um 10:12 schrieb Lucas De Marchi:
>>>>On Fri, Jan 28, 2022 at 09:41:14AM +0100, Christian König wrote:
>>>>>Rule #1 is to never ever break the build.
>>>>>
>>>>>Because of this all those patches needs to be squashed into a 
>>>>>single one as far as I can see.
>>>>
>>>>what config are you building on?
>>>
>>>Well I'm not building at all, I'm just looking at the patches as 
>>>an engineer with 25 years of experience with Linux patches.
>>>
>>>Just take a look at patch number 2:
>>>
>>>-static int fastrpc_vmap(struct dma_buf *dmabuf, struct 
>>>dma_buf_map *map)
>>>+static int fastrpc_vmap(struct dma_buf *dmabuf, struct iosys_map *map)
>>>
>>>You are changing the functions signature without changing any of 
>>>the callers.
>>>
>>>At bare minimum that causes a warning and on runtime this only 
>>>works by coincident now because the structure pointers just happen 
>>>to have the same layout. This is not something we usually do.
>>
>>you missed the magic/hack on patch 1:
>>
>>1) dma-buf-map.h includes iosys-map.h _at the end_
>>2) iosys-map.h includes dma-buf-map.h at the beginning
>>   and initially does a "define iosys_map dma_buf_map".
>>
>>So, it doesn't work by coincidence, It's because it was done to allow
>>converting it piecemeal.
>
>Oh, my. Please never do stuff like that again.

It's not uncommon approach to be required by other subsystems. Even
drm-intel already used similar approach for macro conversions crossing
drm-intel-next and drm-intel-gt-next branches recently.  As I said, I
don't mind one way or the other.

Before I go and respin this into a single mega patch, I'd like to gather
some feedback on the following topics:

1) Daniel Vetter and Thomas Zimmermann seemed to be ok with staying with
the current name, dma_buf_map, while you prefer it renamed. Or at
least not make the rename a pre-requisite for the API additions in
https://lore.kernel.org/all/20220126203702.1784589-1-lucas.demarchi@intel.com/

One thing I like about the rename is that it makes clear the separation
between this small shim and dma-buf. There are also some APIs
that are really dma-buf API (e.g. dma_buf_map_attachment()), but if you
don't look carefully you may think it's from dma_buf_map.

2) If renaming, would it still keep the same entry in
MAINTAINERS? Thomas suggested drivers core, but this all seem to be used
mainly on drm/, with just one exception.

3) If renaming, do we have another preferred name?


thanks
Lucas De Marchi

>
>>
>>But as I said, I don't really have a preference. When crossing
>>subsystems one thing that is hard is that different people have different
>>preferences on these things. At least squashing now is much easier than
>>if I had to split it
>>
>>Try to imagine how much complain I received on going the other way in
>>25985edcedea6396277003854657b5f3cb31a628 with
>>2463 files changed, 4252 insertions(+), 4252 deletions(-)
>
>Well exactly that is perfectly fine.
>
>What you do here is applying your personal hack which is absolutely 
>not welcomed.
>
>Regards,
>Christian.
>
>>:)
>>
>>
>>Lucas De Marchi
>>
>>>
>>>Regards,
>>>Christian.
>>>
>>>>I built this series, full config with
>>>>CONFIG_COMPILE_TEST and doing:
>>>>
>>>>    git rebase -i <base> -x "make -j$(nproc)"
>>>>
>>>>I split these patches in a way that wouldn't break the build on 
>>>>purpose.
>>>>There were a couple that I couldn't build without cross 
>>>>compiling: tegra
>>>>and rockchip. The others were ok.
>>>>
>>>>I'm not really against squashing everything in one to merge, though.
>>>>It will be hard on the conflicts later, but should get the job 
>>>>done much
>>>>quicker.
>>>>
>>>>Lucas De Marchi
>>>>
>>>>>
>>>>>Regards,
>>>>>Christian.
>>>>>
>>>>>Am 28.01.22 um 09:36 schrieb Lucas De Marchi:
>>>>>>Motivation for this started in
>>>>>>https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flkml%2F20220126203702.1784589-1-lucas.demarchi%40intel.com%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C635084a520994d35a16e08d9e2423319%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637789596221829397%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=ruHpD3DbyyqQuZIFEQU%2B2RH31OwsdFnn1v7N4z75U0Y%3D&amp;reserved=0
>>>>>>
>>>>>>
>>>>>>when trying to extend the dma-buf-map API to cover new use 
>>>>>>cases: help a
>>>>>>single driver with allocations and sharing code paths for IO 
>>>>>>and system
>>>>>>memory. I'm leaving the API additions aside and first renaming the
>>>>>>interface as requested.
>>>>>>
>>>>>>There are already some users in tree outside the context of dma-buf
>>>>>>importer/exporter. So before extending the API, let's 
>>>>>>dissociate it from
>>>>>>dma-buf.
>>>>>>
>>>>>>The iosys-map.h is introduced in the first patch in a way that allows
>>>>>>the conversion of each driver to happen separately. After all the
>>>>>>conversions are done we can remove the old one, which is the 
>>>>>>last patch.
>>>>>>Another possible way is to squash everything and merge together,
>>>>>>but I believe this would make much harder for review.
>>>>>>
>>>>>>The conversion was done with the following semantic patch:
>>>>>>
>>>>>>    @r1@
>>>>>>    @@
>>>>>>    - struct dma_buf_map
>>>>>>    + struct iosys_map
>>>>>>
>>>>>>    @r2@
>>>>>>    @@
>>>>>>    (
>>>>>>    - DMA_BUF_MAP_INIT_VADDR
>>>>>>    + IOSYS_MAP_INIT_VADDR
>>>>>>    |
>>>>>>    - dma_buf_map_set_vaddr
>>>>>>    + iosys_map_set_vaddr
>>>>>>    |
>>>>>>    - dma_buf_map_set_vaddr_iomem
>>>>>>    + iosys_map_set_vaddr_iomem
>>>>>>    |
>>>>>>    - dma_buf_map_is_equal
>>>>>>    + iosys_map_is_equal
>>>>>>    |
>>>>>>    - dma_buf_map_is_null
>>>>>>    + iosys_map_is_null
>>>>>>    |
>>>>>>    - dma_buf_map_is_set
>>>>>>    + iosys_map_is_set
>>>>>>    |
>>>>>>    - dma_buf_map_clear
>>>>>>    + iosys_map_clear
>>>>>>    |
>>>>>>    - dma_buf_map_memcpy_to
>>>>>>    + iosys_map_memcpy_to
>>>>>>    |
>>>>>>    - dma_buf_map_incr
>>>>>>    + iosys_map_incr
>>>>>>    )
>>>>>>
>>>>>>    @@
>>>>>>    @@
>>>>>>    - #include <linux/dma-buf-map.h>
>>>>>>    + #include <linux/iosys-map.h>
>>>>>>
>>>>>>and then some files had their includes adjusted so we can build
>>>>>>everything on each commit in this series. Also some comments 
>>>>>>were update
>>>>>>to remove mentions to dma-buf-map. Simply doing a sed to 
>>>>>>rename didn't
>>>>>>work as dma-buf has some APIs using the dma_buf_map prefix.
>>>>>>
>>>>>>Once finalized, I think most of this, if not all, could go 
>>>>>>through the
>>>>>>drm-misc-next branch. I split i915, msm, nouveau, and radeon in their
>>>>>>own patches in case it's preferred to take those through their own
>>>>>>trees.
>>>>>>
>>>>>>Lucas De Marchi
>>>>>>
>>>>>>Lucas De Marchi (14):
>>>>>>  iosys-map: Introduce renamed dma-buf-map
>>>>>>  misc: fastrpc: Replace dma-buf-map with iosys-map
>>>>>>  dma-buf: Replace dma-buf-map with iosys-map
>>>>>>  media: Replace dma-buf-map with iosys-map
>>>>>>  drm/ttm: Replace dma-buf-map with iosys-map
>>>>>>  drm: Replace dma-buf-map with iosys-map in drivers
>>>>>>  drm/i915: Replace dma-buf-map with iosys-map
>>>>>>  drm/msm: Replace dma-buf-map with iosys-map
>>>>>>  drm/nouveau: Replace dma-buf-map with iosys-map
>>>>>>  drm/tegra: Replace dma-buf-map with iosys-map
>>>>>>  drm/radeon: Replace dma-buf-map with iosys-map
>>>>>>  drm: Replace dma-buf-map with iosys-map in common code
>>>>>>  Documentation: Refer to iosys-map instead of dma-buf-map
>>>>>>  dma-buf-map: Remove API in favor of iosys-map
>>>>>>
>>>>>> Documentation/driver-api/dma-buf.rst          |   4 +-
>>>>>> Documentation/gpu/todo.rst                    |  20 +-
>>>>>> MAINTAINERS                                   |   2 +-
>>>>>> drivers/dma-buf/dma-buf.c                     |  22 +-
>>>>>> drivers/dma-buf/heaps/cma_heap.c              |  10 +-
>>>>>> drivers/dma-buf/heaps/system_heap.c           |  10 +-
>>>>>> drivers/gpu/drm/ast/ast_drv.h                 |   2 +-
>>>>>> drivers/gpu/drm/ast/ast_mode.c                |   8 +-
>>>>>> drivers/gpu/drm/drm_cache.c                   |  18 +-
>>>>>> drivers/gpu/drm/drm_client.c                  |   9 +-
>>>>>> drivers/gpu/drm/drm_fb_helper.c               |  12 +-
>>>>>> drivers/gpu/drm/drm_gem.c                     |  12 +-
>>>>>> drivers/gpu/drm/drm_gem_cma_helper.c          |   9 +-
>>>>>> drivers/gpu/drm/drm_gem_framebuffer_helper.c  |  16 +-
>>>>>> drivers/gpu/drm/drm_gem_shmem_helper.c        |  15 +-
>>>>>> drivers/gpu/drm/drm_gem_ttm_helper.c          |   4 +-
>>>>>> drivers/gpu/drm/drm_gem_vram_helper.c         |  25 +-
>>>>>> drivers/gpu/drm/drm_internal.h                |   6 +-
>>>>>> drivers/gpu/drm/drm_mipi_dbi.c                |   8 +-
>>>>>> drivers/gpu/drm/drm_prime.c                   |   4 +-
>>>>>> drivers/gpu/drm/etnaviv/etnaviv_drv.h         |   2 +-
>>>>>> drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c   |   8 +-
>>>>>> drivers/gpu/drm/gud/gud_pipe.c                |   4 +-
>>>>>> drivers/gpu/drm/hyperv/hyperv_drm_modeset.c   |   5 +-
>>>>>> drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |   8 +-
>>>>>> .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |   6 +-
>>>>>> .../gpu/drm/i915/gem/selftests/mock_dmabuf.c  |   6 +-
>>>>>> drivers/gpu/drm/lima/lima_gem.c               |   3 +-
>>>>>> drivers/gpu/drm/lima/lima_sched.c             |   4 +-
>>>>>> drivers/gpu/drm/mediatek/mtk_drm_gem.c        |   7 +-
>>>>>> drivers/gpu/drm/mediatek/mtk_drm_gem.h        |   5 +-
>>>>>> drivers/gpu/drm/mgag200/mgag200_mode.c        |   4 +-
>>>>>> drivers/gpu/drm/msm/msm_drv.h                 |   4 +-
>>>>>> drivers/gpu/drm/msm/msm_gem_prime.c           |   6 +-
>>>>>> drivers/gpu/drm/nouveau/nouveau_gem.c         |   2 +
>>>>>> drivers/gpu/drm/panfrost/panfrost_perfcnt.c   |  13 +-
>>>>>> drivers/gpu/drm/qxl/qxl_display.c             |   8 +-
>>>>>> drivers/gpu/drm/qxl/qxl_draw.c                |   6 +-
>>>>>> drivers/gpu/drm/qxl/qxl_drv.h                 |  10 +-
>>>>>> drivers/gpu/drm/qxl/qxl_object.c              |   8 +-
>>>>>> drivers/gpu/drm/qxl/qxl_object.h              |   4 +-
>>>>>> drivers/gpu/drm/qxl/qxl_prime.c               |   4 +-
>>>>>> drivers/gpu/drm/radeon/radeon_gem.c           |   1 +
>>>>>> drivers/gpu/drm/rockchip/rockchip_drm_gem.c   |   9 +-
>>>>>> drivers/gpu/drm/rockchip/rockchip_drm_gem.h   |   5 +-
>>>>>> drivers/gpu/drm/tegra/gem.c                   |  10 +-
>>>>>> drivers/gpu/drm/tiny/cirrus.c                 |   8 +-
>>>>>> drivers/gpu/drm/tiny/gm12u320.c               |   7 +-
>>>>>> drivers/gpu/drm/ttm/ttm_bo_util.c             |  16 +-
>>>>>> drivers/gpu/drm/ttm/ttm_resource.c            |  26 +-
>>>>>> drivers/gpu/drm/ttm/ttm_tt.c                  |   6 +-
>>>>>> drivers/gpu/drm/udl/udl_modeset.c             |   3 +-
>>>>>> drivers/gpu/drm/vboxvideo/vbox_mode.c         |   4 +-
>>>>>> drivers/gpu/drm/virtio/virtgpu_prime.c        |   1 +
>>>>>> drivers/gpu/drm/vkms/vkms_composer.c          |   4 +-
>>>>>> drivers/gpu/drm/vkms/vkms_drv.h               |   6 +-
>>>>>> drivers/gpu/drm/vkms/vkms_plane.c             |   2 +-
>>>>>> drivers/gpu/drm/vkms/vkms_writeback.c         |   2 +-
>>>>>> drivers/gpu/drm/xen/xen_drm_front_gem.c       |   7 +-
>>>>>> drivers/gpu/drm/xen/xen_drm_front_gem.h       |   6 +-
>>>>>> .../common/videobuf2/videobuf2-dma-contig.c   |   8 +-
>>>>>> .../media/common/videobuf2/videobuf2-dma-sg.c |   9 +-
>>>>>> .../common/videobuf2/videobuf2-vmalloc.c      |  11 +-
>>>>>> drivers/misc/fastrpc.c                        |   4 +-
>>>>>> include/drm/drm_cache.h                       |   6 +-
>>>>>> include/drm/drm_client.h                      |   7 +-
>>>>>> include/drm/drm_gem.h                         |   6 +-
>>>>>> include/drm/drm_gem_atomic_helper.h           |   6 +-
>>>>>> include/drm/drm_gem_cma_helper.h              |   6 +-
>>>>>> include/drm/drm_gem_framebuffer_helper.h      |   8 +-
>>>>>> include/drm/drm_gem_shmem_helper.h            |  12 +-
>>>>>> include/drm/drm_gem_ttm_helper.h              |   6 +-
>>>>>> include/drm/drm_gem_vram_helper.h             |   9 +-
>>>>>> include/drm/drm_prime.h                       |   6 +-
>>>>>> include/drm/ttm/ttm_bo_api.h                  |  10 +-
>>>>>> include/drm/ttm/ttm_kmap_iter.h               |  10 +-
>>>>>> include/drm/ttm/ttm_resource.h                |   6 +-
>>>>>> include/linux/dma-buf-map.h                   | 266 
>>>>>>------------------
>>>>>> include/linux/dma-buf.h                       |  12 +-
>>>>>> include/linux/iosys-map.h                     | 257 
>>>>>>+++++++++++++++++
>>>>>> 80 files changed, 579 insertions(+), 552 deletions(-)
>>>>>> delete mode 100644 include/linux/dma-buf-map.h
>>>>>> create mode 100644 include/linux/iosys-map.h
>>>>>>
>>>>>
>>>
>
