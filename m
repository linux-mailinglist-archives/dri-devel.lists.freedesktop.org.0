Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBAD1C39DA
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 14:50:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF053899C7;
	Mon,  4 May 2020 12:50:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D34899C7
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 12:50:35 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200504125033euoutp0204cd2bb5ec131ff2f966f81372c105b0~L1DicfIjG1557415574euoutp02M
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 12:50:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200504125033euoutp0204cd2bb5ec131ff2f966f81372c105b0~L1DicfIjG1557415574euoutp02M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1588596633;
 bh=BYw0V6405wsMBMqKcuK6hSRqU6kWGO3N0eABZGItQEo=;
 h=From:To:Cc:Subject:Date:References:From;
 b=I4mbFiiPoTbGwLgjQu4AOP0CKJTUP0fcfJqN6G3vh554wLfydxsKtZ2xxG/8XY055
 ySeWdhC/5c/7xje7kY5F+AfYpsTh+BUiqEvCOVh5NqqTMTL+7L13tNGnkzr5y9VfG4
 OJ834AXJj2ZvrYnpHCWPws2uenjIstCeC04pCfxU=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200504125032eucas1p2f869ea6e13c1d53d9644383d9b9ef681~L1DiC9RUA3188131881eucas1p2J;
 Mon,  4 May 2020 12:50:32 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 99.91.60698.89F00BE5; Mon,  4
 May 2020 13:50:32 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200504125032eucas1p2eeaf22690e6b557d69c834cc9dd75855~L1DhoqEBw3001030010eucas1p26;
 Mon,  4 May 2020 12:50:32 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200504125032eusmtrp122a224c54b29be971ebea714c2721184~L1Dhn-ZQh2250522505eusmtrp1s;
 Mon,  4 May 2020 12:50:32 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-ad-5eb00f98be0e
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id CB.E8.08375.89F00BE5; Mon,  4
 May 2020 13:50:32 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200504125031eusmtip26dc87b355a91609d3ac20c3f8113066a~L1DhDtQ_D3246732467eusmtip2P;
 Mon,  4 May 2020 12:50:31 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/21] DRM: fix struct sg_table nents vs. orig_nents misuse
Date: Mon,  4 May 2020 14:50:17 +0200
Message-Id: <20200504125017.5494-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNKsWRmVeSWpSXmKPExsWy7djP87oz+DfEGXRv1LHoPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFytVHmSwW7Le2+HLlIZPFpsfXWC0u75rDZrH2yF12i4MfnrA6cHusmbeG
 0WPvtwUsHtu/PWD1uN99nMlj85J6j9v/HjN7TL6xnNFj980GNo++LasYPT5vkgvgiuKySUnN
 ySxLLdK3S+DKmLX4K3vBM5OKe+/fMjcwLtDsYuTkkBAwkThy9ABbFyMXh5DACkaJhtfX2CGc
 L4wSTz6/YoFwPjNK7Njwgxmm5dut+0wQieWMEn8WbmeDa3nau5MFpIpNwFCi620XG4gtItDK
 KHGilwfEZhaYwSRx9HUpiC0sECDx7/kxRhCbRUBV4ujnf6wgNq+AjcSfqyegtslLrN5wgBki
 LihxcuYTFog58hLNW2czgyyWEDjFLtHd/I0JosFFYtfpfjYIW1ji1fEt7BC2jMTpyT0sEA3N
 jBIPz61lh3B6GCUuN81ghKiylrhz7hdQNwfQCk2J9bv0IcKOEkcfd7ODhCUE+CRuvBWEOIJP
 YtK26cwQYV6JjjYhiGo1iVnH18GtPXjhEtQvHhLXemaD2UICsRI3n3exTmBUmIXktVlIXpuF
 cMMCRuZVjOKppcW56anFxnmp5XrFibnFpXnpesn5uZsYgUns9L/jX3cw7vuTdIhRgINRiYc3
 4vP6OCHWxLLiytxDjBIczEoivDtagEK8KYmVValF+fFFpTmpxYcYpTlYlMR5jRe9jBUSSE8s
 Sc1OTS1ILYLJMnFwSjUwlibYicY3Kt+JkQoNVH69d1rQvJZEPt2eS40TzbeXdt3PiuZcO3GH
 a6xQJ6vaVLEzqhK9y+R2mGxaoTX14PzvnVK/bDTT5uydGPV3t9aXTRtTktUfFXWw2F5dqPgz
 i1ft7pm3JleWbJqXc+FL1lzOs9zVHhqxCdmPzgp/6XSt+5Is/zK/znGvEktxRqKhFnNRcSIA
 BmAJB14DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOIsWRmVeSWpSXmKPExsVy+t/xe7oz+DfEGew8LmDRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMlks2G9t8eXKQyaLTY+vsVpc3jWHzWLtkbvsFgc/PGF14PZYM28N
 o8febwtYPLZ/e8Dqcb/7OJPH5iX1Hrf/PWb2mHxjOaPH7psNbB59W1YxenzeJBfAFaVnU5Rf
 WpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9nk5Kak1mWWqRvl6CXMWvxV/aCZyYV
 996/ZW5gXKDZxcjJISFgIvHt1n2mLkYuDiGBpYwS7049ZoRIyEicnNbACmELS/y51sUGUfSJ
 UWLDhwnMIAk2AUOJrrcQCRGBTkaJad0f2UEcZoF5TBKLHh4Ccjg4hAX8JHZudgZpYBFQlTj6
 +R/YVF4BG4k/V08wQ2yQl1i94QAzRFxQ4uTMJywgrcwC6hLr5wmBhJmBSpq3zmaewMg/C0nV
 LISqWUiqFjAyr2IUSS0tzk3PLTbUK07MLS7NS9dLzs/dxAiMtG3Hfm7ewXhpY/AhRgEORiUe
 3ojP6+OEWBPLiitzDzFKcDArifDuaAEK8aYkVlalFuXHF5XmpBYfYjQFemEis5Rocj4wCeSV
 xBuaGppbWBqaG5sbm1koifN2CByMERJITyxJzU5NLUgtgulj4uCUamCcryC8IM8r5UCVntvJ
 UyZrYytki9083++u2XJdR3BRqs39o6luxosW/m3czh7949zToGdJt4/vTLw1NfTypcvNvMKs
 TreY3Fleiy5fFSLNM/mjXkT/tEPWTHLWcz1X/8lvOTl38jTToo+feYOZHSonMz+0rT394/fJ
 mTy/vpxjSYwr+OVdIP5BiaU4I9FQi7moOBEAxqERzMoCAAA=
X-CMS-MailID: 20200504125032eucas1p2eeaf22690e6b557d69c834cc9dd75855
X-Msg-Generator: CA
X-RootMTR: 20200504125032eucas1p2eeaf22690e6b557d69c834cc9dd75855
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200504125032eucas1p2eeaf22690e6b557d69c834cc9dd75855
References: <CGME20200504125032eucas1p2eeaf22690e6b557d69c834cc9dd75855@eucas1p2.samsung.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear All,

During the Exynos DRM GEM rework and fixing the issues in the 
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
most cases it even worked correctly if the system used simple,
linear DMA-mapping implementation, for which swapping nents and
orig_nents doesn't make any difference.

The biggest TODO is DRM/i915 driver and I don't feel brave enough to fix
it fully. The driver creatively uses sg_table->orig_nents to store the
size of the allocate scatterlist and ignores the number of the entries
returned by dma_map_sg function. In this patchset I only fixed the
sg_table objects exported by dmabuf related functions. I hope that I
didn't break anything there.

As a follow-up for this patchset I will prepare a common
dma_{map,sync,unmap}_sgtable() wrappers, which will use a proper sg_table
entries and call respective DMA-mapping functions. I hope this will help
to avoid issue like this in the future.

Patches are based on top of Linux next-20200504.

Best regards,
Marek Szyprowski


References:

[1] https://lkml.org/lkml/2020/3/27/555 
[2] https://lkml.org/lkml/2020/3/29/65
[3] Documentation/DMA-API-HOWTO.txt


Changelog:

v2:
- dropped most of the changes to drm/i915
- added fixes for rcar-du, xen, media and ion
- fixed a few issues pointed by kbuild test robot
- added wide cc: list for each patch

v1: https://lore.kernel.org/linux-iommu/c01c9766-9778-fd1f-f36e-2dc7bd376ba4@arm.com/T/#m879a727e4e46b5479ef8603994b1a006fb2aa337
- initial version


Patch summary:

Marek Szyprowski (21):
  drm: core: fix sg_table nents vs. orig_nents misuse
  drm: amdgpu: fix sg_table nents vs. orig_nents misuse
  drm: armada: fix sg_table nents vs. orig_nents misuse
  drm: etnaviv: fix sg_table nents vs. orig_nents misuse
  drm: exynos: fix sg_table nents vs. orig_nents misuse
  drm: i915: fix sg_table nents vs. orig_nents misuse for dmabuf objects
  drm: lima: fix sg_table nents vs. orig_nents misuse
  drm: msm: fix sg_table nents vs. orig_nents misuse
  drm: panfrost: fix sg_table nents vs. orig_nents misuse
  drm: radeon: fix sg_table nents vs. orig_nents misuse
  drm: rockchip: fix sg_table nents vs. orig_nents misuse
  drm: tegra: fix sg_table nents vs. orig_nents misuse
  drm: virtio: fix sg_table nents vs. orig_nents misuse
  drm: vmwgfx: fix sg_table nents vs. orig_nents misuse
  drm: xen: fix sg_table nents vs. orig_nents misuse
  drm: host1x: fix sg_table nents vs. orig_nents misuse
  drm: rcar-du: fix sg_table nents vs. orig_nents misuse
  xen: gntdev: fix sg_table nents vs. orig_nents misuse
  dmabuf: fix sg_table nents vs. orig_nents misuse
  media: pci: fix common ALSA DMA-mapping related code
  staging: ion: fix sg_table nents vs. orig_nents misuse

 drivers/dma-buf/heaps/heap-helpers.c             |  7 ++++---
 drivers/dma-buf/udmabuf.c                        |  5 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c      |  7 ++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c          |  8 ++++----
 drivers/gpu/drm/armada/armada_gem.c              | 14 ++++++++-----
 drivers/gpu/drm/drm_cache.c                      |  2 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c           |  7 ++++---
 drivers/gpu/drm/drm_prime.c                      |  9 +++++----
 drivers/gpu/drm/etnaviv/etnaviv_gem.c            | 10 ++++++----
 drivers/gpu/drm/exynos/exynos_drm_g2d.c          |  7 ++++---
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c       |  9 +++++----
 drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c |  5 +++--
 drivers/gpu/drm/lima/lima_gem.c                  |  4 ++--
 drivers/gpu/drm/msm/msm_gem.c                    |  8 ++++----
 drivers/gpu/drm/msm/msm_iommu.c                  |  3 ++-
 drivers/gpu/drm/panfrost/panfrost_gem.c          |  3 ++-
 drivers/gpu/drm/panfrost/panfrost_mmu.c          |  4 +++-
 drivers/gpu/drm/radeon/radeon_ttm.c              | 11 ++++++-----
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c      | 15 +++++++-------
 drivers/gpu/drm/tegra/gem.c                      | 25 ++++++++++++------------
 drivers/gpu/drm/tegra/plane.c                    | 13 ++++++------
 drivers/gpu/drm/virtio/virtgpu_object.c          | 11 ++++++-----
 drivers/gpu/drm/virtio/virtgpu_vq.c              |  8 ++++----
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c       |  6 +++---
 drivers/gpu/drm/xen/xen_drm_front_gem.c          |  2 +-
 drivers/gpu/host1x/job.c                         | 17 ++++++++--------
 drivers/media/pci/cx23885/cx23885-alsa.c         |  2 +-
 drivers/media/pci/cx25821/cx25821-alsa.c         |  2 +-
 drivers/media/pci/cx88/cx88-alsa.c               |  2 +-
 drivers/media/pci/saa7134/saa7134-alsa.c         |  2 +-
 drivers/media/platform/vsp1/vsp1_drm.c           |  7 ++++---
 drivers/staging/android/ion/ion.c                | 17 ++++++++--------
 drivers/staging/android/ion/ion_heap.c           |  6 +++---
 drivers/staging/android/ion/ion_system_heap.c    |  2 +-
 drivers/xen/gntdev-dmabuf.c                      | 10 ++++++----
 35 files changed, 149 insertions(+), 121 deletions(-)

-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
