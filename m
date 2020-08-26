Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C802526FC
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 08:35:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C37D6E9FE;
	Wed, 26 Aug 2020 06:35:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 659526E9FB
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 06:35:31 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200826063527euoutp022072defafd0563c3b9843ddb96cb2f76~uvelj8tUC1443214432euoutp02h
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 06:35:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200826063527euoutp022072defafd0563c3b9843ddb96cb2f76~uvelj8tUC1443214432euoutp02h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598423727;
 bh=1MCZ7qD0YSw+vW7M0Jq5j+OMEgFramV5TYV3kLcqQiY=;
 h=From:To:Cc:Subject:Date:References:From;
 b=TWzs77UpSL1wRnCAzaRN0Pc0jImfOLDayZsDFd0s8xn3JJv72uQHk0w5xlJEP868P
 8OhnnuHmbcN+sqhy5kdfne9NLzLpTUcigpFXhTgGFbgrnAuI9qEnLbswFLchGYWin1
 1+BrzMUzUrfJ4uvd5eyNNucLB/VuFa377uFlPhyg=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200826063527eucas1p1f30db8c822b5927863374ca5651ef3f9~uvelWdDhi1803218032eucas1p17;
 Wed, 26 Aug 2020 06:35:27 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id DD.9D.05997.FA2064F5; Wed, 26
 Aug 2020 07:35:27 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200826063527eucas1p21ab50cf46bad1d9ea5d7f202dd6ec722~uvek5DN4k0398703987eucas1p2V;
 Wed, 26 Aug 2020 06:35:27 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200826063527eusmtrp2c8fccba275d728e009c6969efa91e824~uvek4W8Dk0396003960eusmtrp2e;
 Wed, 26 Aug 2020 06:35:27 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-b1-5f4602af2adb
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 98.43.06017.FA2064F5; Wed, 26
 Aug 2020 07:35:27 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200826063526eusmtip2dce0f6c4b1bb55b1c8a6d6afb3338e26~uvekYGt020092300923eusmtip2O;
 Wed, 26 Aug 2020 06:35:26 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 00/32] DRM: fix struct sg_table nents vs. orig_nents misuse
Date: Wed, 26 Aug 2020 08:32:44 +0200
Message-Id: <20200826063316.23486-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNKsWRmVeSWpSXmKPExsWy7djP87rrmdziDd4vVLDoPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFytVHmSwW7Le2+HLlIZPFpsfXWC0u75rDZrH2yF12i4MfnrA6cHusmbeG
 0WPvtwUsHtu/PWD1uN99nMlj85J6j9v/HjN7TL6xnNFj980GNo++LasYPT5vkgvgiuKySUnN
 ySxLLdK3S+DKeLN7M1vBat+KWVd3sTcwvrftYuTkkBAwkdh3bgpbFyMXh5DACkaJoyd+MEM4
 XxglXk7byQrhfGaUaOndwwjTMmPnTEaIxHJGiat9d1ngWq4dXQRWxSZgKNH1tosNxBYRaGWU
 ONHLA2IzC8xgkjj6uhTEFhYIkJh0bilYPYuAqsTsN0eZQGxeAVuJuZ3v2CC2yUus3nAA7CYJ
 gcnsElO+b4dKuEi0npvHDmELS7w6vgXKlpH4v3M+E0RDM6PEw3Nr2SGcHkaJy00zoJ6wlrhz
 7hfQJA6gkzQl1u/Shwg7SkzYMAMsLCHAJ3HjrSDE0XwSk7ZNZ4YI80p0tAlBVKtJzDq+Dm7t
 wQuXmCFsD4mvTzaBnSkkECtxqKGXeQKj3CyEXQsYGVcxiqeWFuempxYb5aWW6xUn5haX5qXr
 JefnbmIEJpnT/45/2cG460/SIUYBDkYlHt4FbK7xQqyJZcWVuYcYJTiYlUR4nc6ejhPiTUms
 rEotyo8vKs1JLT7EKM3BoiTOa7zoZayQQHpiSWp2ampBahFMlomDU6qBUahFbM7jfYZvgiWY
 IpzXvfvlaiPgvcG4xfHFRBGF9YriBdcPr7EX+vFj96Pye/rZh5rt1r0QWblq5zPTlwFcHgkC
 0b9WbH2W5c9++bVW/EYVhl77/9+m/5u9MT+krf0c01cPRZvsQhXVec5SIbvFP0XcD17+/8Da
 /JYZoZxMS6tNl773LdQPUGIpzkg01GIuKk4EAJBInTguAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrELMWRmVeSWpSXmKPExsVy+t/xe7rrmdziDU4/ZrHoPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFytVHmSwW7Le2+HLlIZPFpsfXWC0u75rDZrH2yF12i4MfnrA6cHusmbeG
 0WPvtwUsHtu/PWD1uN99nMlj85J6j9v/HjN7TL6xnNFj980GNo++LasYPT5vkgvgitKzKcov
 LUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rezSUnNySxLLdK3S9DLeLN7M1vBat+K
 WVd3sTcwvrftYuTkkBAwkZixcyZjFyMXh5DAUkaJ2Z8usEIkZCROTmuAsoUl/lzrYoMo+sQo
 ce32YTaQBJuAoUTXW4iEiEAno8S07o/sIA6zwDwmiUUPD7GDVAkL+Ek0Pe0EG8UioCox+81R
 JhCbV8BWYm7nOzaIFfISqzccYJ7AyLOAkWEVo0hqaXFuem6xkV5xYm5xaV66XnJ+7iZGYHhv
 O/Zzyw7GrnfBhxgFOBiVeHgXsLnGC7EmlhVX5h5ilOBgVhLhdTp7Ok6INyWxsiq1KD++qDQn
 tfgQoynQ8onMUqLJ+cDYyyuJNzQ1NLewNDQ3Njc2s1AS5+0QOBgjJJCeWJKanZpakFoE08fE
 wSnVwNjvnBxbdnF/VSabg1Dm25k7d4dt05hT+ueTvR+H3PRrGQpth+znMfAsCFjxu7B9pe+z
 XGetSTx+lf7B87WXRe8Ws7i5xtY78fNFudaKhjt9MY5Xjx7Y+TDkZY3x6+83befe/+8upb7S
 4/Ks4sVpoRNmFNzPFk7LdLggVRMXzf9D/NJZ/uXRlUosxRmJhlrMRcWJAI/aOqmFAgAA
X-CMS-MailID: 20200826063527eucas1p21ab50cf46bad1d9ea5d7f202dd6ec722
X-Msg-Generator: CA
X-RootMTR: 20200826063527eucas1p21ab50cf46bad1d9ea5d7f202dd6ec722
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200826063527eucas1p21ab50cf46bad1d9ea5d7f202dd6ec722
References: <CGME20200826063527eucas1p21ab50cf46bad1d9ea5d7f202dd6ec722@eucas1p2.samsung.com>
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
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear All,

During the Exynos DRM GEM rework and fixing the issues in the.
drm_prime_sg_to_page_addr_arrays() function [1] I've noticed that most
drivers in DRM framework incorrectly use nents and orig_nents entries of
the struct sg_table.

In case of the most DMA-mapping implementations exchanging those two
entries or using nents for all loops on the scatterlist is harmless,
because they both have the same value. There exists however a DMA-mapping
implementations, for which such incorrect usage breaks things. The nents
returned by dma_map_sg() might be lower than the nents passed as its
parameter and this is perfectly fine. DMA framework or IOMMU is allowed
to join consecutive chunks while mapping if such operation is supported
by the underlying HW (bus, bridge, IOMMU, etc). Example of the case
where dma_map_sg() might return 1 'DMA' chunk for the 4 'physical' pages
is described here [2]

The DMA-mapping framework documentation [3] states that dma_map_sg()
returns the numer of the created entries in the DMA address space.
However the subsequent calls to dma_sync_sg_for_{device,cpu} and
dma_unmap_sg must be called with the original number of entries passed to
dma_map_sg. The common pattern in DRM drivers were to assign the
dma_map_sg() return value to sg_table->nents and use that value for
the subsequent calls to dma_sync_sg_* or dma_unmap_sg functions. Also
the code iterated over nents times to access the pages stored in the
processed scatterlist, while it should use orig_nents as the numer of
the page entries.

I've tried to identify all such incorrect usage of sg_table->nents and
this is a result of my research. It looks that the incorrect pattern has
been copied over the many drivers mainly in the DRM subsystem. Too bad in
most cases it even worked correctly if the system used a simple, linear
DMA-mapping implementation, for which swapping nents and orig_nents
doesn't make any difference. To avoid similar issues in the future, I've
introduced a common wrappers for DMA-mapping calls, which operate directly
on the sg_table objects. I've also added wrappers for iterating over the
scatterlists stored in the sg_table objects and applied them where
possible. This, together with some common DRM prime helpers, allowed me
to almost get rid of all nents/orig_nents usage in the drivers. I hope
that such change makes the code robust, easier to follow and copy/paste
safe.

The biggest TODO is DRM/i915 driver and I don't feel brave enough to fix
it fully. The driver creatively uses sg_table->orig_nents to store the
size of the allocate scatterlist and ignores the number of the entries
returned by dma_map_sg function. In this patchset I only fixed the
sg_table objects exported by dmabuf related functions. I hope that I
didn't break anything there.

Patches are based on top of Linux next-20200825. The required changes to
DMA-mapping framework has been already merged to v5.8-rc1.

I would like ask for merging of the 1-27 patches via DRM misc tree.

Best regards,
Marek Szyprowski


References:

[1] https://lkml.org/lkml/2020/3/27/555
[2] https://lkml.org/lkml/2020/3/29/65
[3] Documentation/DMA-API-HOWTO.txt
[4] https://lore.kernel.org/linux-iommu/20200512121931.GD20393@lst.de/T/#ma18c958a48c3b241d5409517fa7d192eef87459b

Changelog:

v9:
- rebased onto Linux next-20200825, which is based on v5.9-rc2; fixed conflicts
- dropped merged patches

v8:
- rapidio: fixed issues pointed by kbuilt test robot (use of uninitialized
    variable
- vb2: rebased after recent changes in the code

v7: https://lore.kernel.org/linux-iommu/20200619103636.11974-1-m.szyprowski@samsung.com/T/
- changed DMA page interators to standard DMA SG iterators in drm/prime and
  videobuf2-dma-contig as suggested by Robin Murphy
- fixed build issues

v6: https://lore.kernel.org/linux-iommu/20200618153956.29558-1-m.szyprowski@samsung.com/T/
- rebased onto Linux next-20200618, which is based on v5.8-rc1; fixed conflicts

v5: https://lore.kernel.org/linux-iommu/20200513132114.6046-1-m.szyprowski@samsung.com/T/
- fixed some minor style issues and typos
- fixed lack of the attrs argument in ion, dmabuf, rapidio, fastrpc and
  vfio patches

v4: https://lore.kernel.org/linux-iommu/20200512121931.GD20393@lst.de/T/
- added for_each_sgtable_* wrappers and applied where possible
- added drm_prime_get_contiguous_size() and applied where possible
- applied drm_prime_sg_to_page_addr_arrays() where possible to remove page
  extraction from sg_table objects
- added documentation for the introduced wrappers
- improved patches description a bit

v3: https://lore.kernel.org/dri-devel/20200505083926.28503-1-m.szyprowski@samsung.com/
- introduce dma_*_sgtable_* wrappers and use them in all patches

v2: https://lore.kernel.org/linux-iommu/c01c9766-9778-fd1f-f36e-2dc7bd376ba4@arm.com/T/
- dropped most of the changes to drm/i915
- added fixes for rcar-du, xen, media and ion
- fixed a few issues pointed by kbuild test robot
- added wide cc: list for each patch

v1: https://lore.kernel.org/linux-iommu/c01c9766-9778-fd1f-f36e-2dc7bd376ba4@arm.com/T/
- initial version


Patch summary:

Marek Szyprowski (32):
  drm: prime: add common helper to check scatterlist contiguity
  drm: prime: use sgtable iterators in
    drm_prime_sg_to_page_addr_arrays()
  drm: core: fix common struct sg_table related issues
  drm: armada: fix common struct sg_table related issues
  drm: etnaviv: fix common struct sg_table related issues
  drm: exynos: use common helper for a scatterlist contiguity check
  drm: exynos: fix common struct sg_table related issues
  drm: i915: fix common struct sg_table related issues
  drm: lima: fix common struct sg_table related issues
  drm: mediatek: use common helper for a scatterlist contiguity check
  drm: mediatek: use common helper for extracting pages array
  drm: msm: fix common struct sg_table related issues
  drm: omapdrm: use common helper for extracting pages array
  drm: omapdrm: fix common struct sg_table related issues
  drm: panfrost: fix common struct sg_table related issues
  drm: rockchip: use common helper for a scatterlist contiguity check
  drm: rockchip: fix common struct sg_table related issues
  drm: tegra: fix common struct sg_table related issues
  drm: v3d: fix common struct sg_table related issues
  drm: virtio: fix common struct sg_table related issues
  drm: vmwgfx: fix common struct sg_table related issues
  drm: xen: fix common struct sg_table related issues
  xen: gntdev: fix common struct sg_table related issues
  drm: host1x: fix common struct sg_table related issues
  drm: rcar-du: fix common struct sg_table related issues
  dmabuf: fix common struct sg_table related issues
  staging: tegra-vde: fix common struct sg_table related issues
  misc: fastrpc: fix common struct sg_table related issues
  rapidio: fix common struct sg_table related issues
  samples: vfio-mdev/mbochs: fix common struct sg_table related issues
  media: pci: fix common ALSA DMA-mapping related codes
  videobuf2: use sgtable-based scatterlist wrappers

 drivers/dma-buf/heaps/heap-helpers.c          | 13 ++-
 drivers/dma-buf/udmabuf.c                     |  7 +-
 drivers/gpu/drm/armada/armada_gem.c           | 12 +--
 drivers/gpu/drm/drm_cache.c                   |  2 +-
 drivers/gpu/drm/drm_gem_cma_helper.c          | 23 +----
 drivers/gpu/drm/drm_gem_shmem_helper.c        | 14 ++-
 drivers/gpu/drm/drm_prime.c                   | 91 +++++++++++--------
 drivers/gpu/drm/etnaviv/etnaviv_gem.c         | 12 +--
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c         | 13 +--
 drivers/gpu/drm/exynos/exynos_drm_g2d.c       | 10 +-
 drivers/gpu/drm/exynos/exynos_drm_gem.c       | 23 +----
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    | 11 +--
 .../gpu/drm/i915/gem/selftests/mock_dmabuf.c  |  7 +-
 drivers/gpu/drm/lima/lima_gem.c               | 11 ++-
 drivers/gpu/drm/lima/lima_vm.c                |  5 +-
 drivers/gpu/drm/mediatek/mtk_drm_gem.c        | 37 ++------
 drivers/gpu/drm/msm/msm_gem.c                 | 13 +--
 drivers/gpu/drm/msm/msm_gpummu.c              | 14 ++-
 drivers/gpu/drm/msm/msm_iommu.c               |  2 +-
 drivers/gpu/drm/omapdrm/omap_gem.c            | 20 ++--
 drivers/gpu/drm/panfrost/panfrost_gem.c       |  4 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c       |  7 +-
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c         |  3 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c   | 42 +++------
 drivers/gpu/drm/tegra/gem.c                   | 27 ++----
 drivers/gpu/drm/tegra/plane.c                 | 15 +--
 drivers/gpu/drm/v3d/v3d_mmu.c                 | 13 ++-
 drivers/gpu/drm/virtio/virtgpu_object.c       | 36 +++++---
 drivers/gpu/drm/virtio/virtgpu_vq.c           | 12 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c    | 17 +---
 drivers/gpu/drm/xen/xen_drm_front_gem.c       |  2 +-
 drivers/gpu/host1x/job.c                      | 22 ++---
 .../common/videobuf2/videobuf2-dma-contig.c   | 34 +++----
 .../media/common/videobuf2/videobuf2-dma-sg.c | 32 +++----
 .../common/videobuf2/videobuf2-vmalloc.c      | 12 +--
 drivers/media/pci/cx23885/cx23885-alsa.c      |  2 +-
 drivers/media/pci/cx25821/cx25821-alsa.c      |  2 +-
 drivers/media/pci/cx88/cx88-alsa.c            |  2 +-
 drivers/media/pci/saa7134/saa7134-alsa.c      |  2 +-
 drivers/media/platform/vsp1/vsp1_drm.c        |  8 +-
 drivers/misc/fastrpc.c                        |  4 +-
 drivers/rapidio/devices/rio_mport_cdev.c      | 11 +--
 drivers/staging/media/tegra-vde/iommu.c       |  4 +-
 drivers/xen/gntdev-dmabuf.c                   | 13 ++-
 include/drm/drm_prime.h                       |  2 +
 samples/vfio-mdev/mbochs.c                    |  3 +-
 46 files changed, 273 insertions(+), 398 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
