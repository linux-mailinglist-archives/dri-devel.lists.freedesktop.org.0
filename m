Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD3325D9C1
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 15:35:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0FD66E2A0;
	Fri,  4 Sep 2020 13:34:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41EEB6E2A3
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 13:34:56 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200904133454euoutp01462d733d3fd1eaf806c324fdfc386df1~xmAYQtkWx0722007220euoutp01R
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 13:34:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200904133454euoutp01462d733d3fd1eaf806c324fdfc386df1~xmAYQtkWx0722007220euoutp01R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1599226494;
 bh=KCi/GbphBLSraprwOjyfcB36mqU8mZ8VDc8Ut3h1H4g=;
 h=From:To:Cc:Subject:Date:References:From;
 b=TrFotY08g1iven9X00Yk6aJKLNFGgqN7xq8rwaMH+/0pbscWed6IA1SNxeohL9HGB
 Bc3yetyOy5b9DqXM14OdRrrvNYr2n4Xlv7VBjjoIif3C/9rol3lVuxl2LeezcUjlAo
 4RI9GLWgDx+ocBcc1qUR9r4YqzcLZVBtYjJFlt4U=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200904133454eucas1p2bbcf9ad6cb1fb5ed267dbf9b681ae4e4~xmAXyySov1447014470eucas1p2e;
 Fri,  4 Sep 2020 13:34:54 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 1C.29.06318.D72425F5; Fri,  4
 Sep 2020 14:34:53 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200904133453eucas1p16a41f7340d48b2675ea6527bba165962~xmAXLZRl80115901159eucas1p1m;
 Fri,  4 Sep 2020 13:34:53 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200904133453eusmtrp249cb8216c81bd04f89cfaea5a13a06b1~xmAXKtGmu0905709057eusmtrp2V;
 Fri,  4 Sep 2020 13:34:53 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-80-5f52427dc913
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 59.90.06017.D72425F5; Fri,  4
 Sep 2020 14:34:53 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200904133452eusmtip1d1fda55d701ecddb4d628b063e08f524~xmAWotL3r1926319263eusmtip1Z;
 Fri,  4 Sep 2020 13:34:52 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 00/30] DRM: fix struct sg_table nents vs. orig_nents misuse
Date: Fri,  4 Sep 2020 15:16:41 +0200
Message-Id: <20200904131711.12950-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNKsWRmVeSWpSXmKPExsWy7djP87q1TkHxBos2mlv0njvJZLFxxnpW
 i//bJjJbXPn6ns1i5eqjTBYL9ltbfLnykMli0+NrrBaXd81hs1h75C67xcEPT1gduD3WzFvD
 6LH32wIWj+3fHrB63O8+zuSxeUm9x+1/j5k9Jt9Yzuix+2YDm0ffllWMHp83yQVwRXHZpKTm
 ZJalFunbJXBlLDh9hK1gUkDF0anzWBoY9zh0MXJySAiYSDSeX8TSxcjFISSwglHi3fIDrBDO
 F0aJR9++QDmfGSV+LW1gh2npnreTDSKxnFFi3txWZriW0xO+M4NUsQkYSnS97WIDsUUEWhkl
 TvTygNjMAjOYJI6+LgWxhQUCJdbuWgVWwyKgKrH+6zYmEJtXwFai61g/C8Q2eYnVGw6ALZAQ
 mMwu8WDiNVaIhIvEh0P9zBC2sMSr41ugzpOR+L9zPhNEQzOjxMNza9khnB5GictNMxghqqwl
 7pz7BbSaA+gkTYn1u/Qhwo4SGx/+ZgQJSwjwSdx4KwhxNJ/EpG3TmSHCvBIdbUIQ1WoSs46v
 g1t78MIlqHM8JN4sOgIWFxKIlXjcuZl1AqPcLIRdCxgZVzGKp5YW56anFhvnpZbrFSfmFpfm
 pesl5+duYgQmmdP/jn/dwbjvT9IhRgEORiUeXgb7oHgh1sSy4srcQ4wSHMxKIrxOZ0/HCfGm
 JFZWpRblxxeV5qQWH2KU5mBREuc1XvQyVkggPbEkNTs1tSC1CCbLxMEp1cA4ycdF+1KTxbSY
 JuZLN+XklFkezGg/6BN3ufJDzPRFy+IXfbt77cL2n26vPT4Z2i4oiJr1vK7Ha55RTWxj1H7O
 k+W9xr/lW8S4AwXnRU22yzm11WeB/mb2ul67lfz2kh4vE88lfP0wX611UW/lfpYIPtXsyrsv
 nvXHrunySDQ+Nfm98QvhMlklluKMREMt5qLiRAD26KhYLgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrELMWRmVeSWpSXmKPExsVy+t/xu7q1TkHxBldf8Vv0njvJZLFxxnpW
 i//bJjJbXPn6ns1i5eqjTBYL9ltbfLnykMli0+NrrBaXd81hs1h75C67xcEPT1gduD3WzFvD
 6LH32wIWj+3fHrB63O8+zuSxeUm9x+1/j5k9Jt9Yzuix+2YDm0ffllWMHp83yQVwRenZFOWX
 lqQqZOQXl9gqRRtaGOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJalFunbJehlLDh9hK1gUkDF
 0anzWBoY9zh0MXJySAiYSHTP28nWxcjFISSwlFHiybpWFoiEjMTJaQ2sELawxJ9rXVBFnxgl
 NuyezAaSYBMwlOh6C5EQEehklJjW/ZEdxGEWmMcksejhIXaQKmEBf4lXc1eDdbAIqEqs/7qN
 CcTmFbCV6DrWD7VOXmL1hgPMExh5FjAyrGIUSS0tzk3PLTbSK07MLS7NS9dLzs/dxAgM723H
 fm7Zwdj1LvgQowAHoxIPL4N9ULwQa2JZcWXuIUYJDmYlEV6ns6fjhHhTEiurUovy44tKc1KL
 DzGaAi2fyCwlmpwPjL28knhDU0NzC0tDc2NzYzMLJXHeDoGDMUIC6YklqdmpqQWpRTB9TByc
 Ug2Mlse8e5smLrrt8iJWUeNswuLg65xtiYdCSxdcfch1/82EgKlN9Uyd8rLzfv10Lg0+PG8P
 Q3Ddco9HgqYtK+c6SB9oX6L+535V5a0E+UCjZQ1PN69w8HNi7VHZK3Tx6CKDiKu/hRxWpSs/
 9/nfo7X+jwNLXA7jyxiW9UslK3ifOq/m2rh6kZW2EktxRqKhFnNRcSIA9w9gw4UCAAA=
X-CMS-MailID: 20200904133453eucas1p16a41f7340d48b2675ea6527bba165962
X-Msg-Generator: CA
X-RootMTR: 20200904133453eucas1p16a41f7340d48b2675ea6527bba165962
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200904133453eucas1p16a41f7340d48b2675ea6527bba165962
References: <CGME20200904133453eucas1p16a41f7340d48b2675ea6527bba165962@eucas1p1.samsung.com>
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

Patches are based on top of Linux next-20200903. The required changes to
DMA-mapping framework has been already merged to v5.9-rc3.

If possible I would like ask for merging most of the patches via DRM
tree.

Best regards,
Marek Szyprowski


References:

[1] https://lkml.org/lkml/2020/3/27/555
[2] https://lkml.org/lkml/2020/3/29/65
[3] Documentation/DMA-API-HOWTO.txt
[4] https://lore.kernel.org/linux-iommu/20200512121931.GD20393@lst.de/T/#ma18c958a48c3b241d5409517fa7d192eef87459b

Changelog:

v10:
- addressed more issues pointed by Robin Murphy in his review:
 * prime: restored WARN_ON() in drm_prime_sg_to_page_addr_arrays()
 * armada: simplified cleanup path
 * msm: fixed arm64 build
 * omapdrm: removed WARN_ON(), which is now in drm_prime_sg_to_page_addr_arrays()
 * omapdrm: dropped the incorrect nents/orig_nents patch
 * media: pci: also update to use modern DMA_FROM_DEVICE definitions
- dropped merged patches

v9: https://lore.kernel.org/linux-iommu/20200826063316.23486-1-m.szyprowski@samsung.com/T/
- rebased onto Linux next-20200825, which is based on v5.9-rc2; fixed conflicts
- dropped merged patches

v8:
- rapidio: fixed issues pointed by kbuilt test robot (use of uninitialized
    variable
- vb2: rebased after recent changes in the code

v7: https://lore.kernel.org/linux-iommu/20200619103636.11974-1-m.szyprowski@samsung.com/
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

Marek Szyprowski (30):
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
  rapidio: fix common struct sg_table related issues
  samples: vfio-mdev/mbochs: fix common struct sg_table related issues
  media: pci: fix common ALSA DMA-mapping related codes
  videobuf2: use sgtable-based scatterlist wrappers

 drivers/dma-buf/heaps/heap-helpers.c          | 13 ++-
 drivers/dma-buf/udmabuf.c                     |  7 +-
 drivers/gpu/drm/armada/armada_gem.c           | 24 +++--
 drivers/gpu/drm/drm_cache.c                   |  2 +-
 drivers/gpu/drm/drm_gem_cma_helper.c          | 23 +----
 drivers/gpu/drm/drm_gem_shmem_helper.c        | 14 ++-
 drivers/gpu/drm/drm_prime.c                   | 91 +++++++++++--------
 drivers/gpu/drm/etnaviv/etnaviv_gem.c         | 12 +--
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c         | 15 +--
 drivers/gpu/drm/exynos/exynos_drm_g2d.c       | 10 +-
 drivers/gpu/drm/exynos/exynos_drm_gem.c       | 23 +----
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    | 11 +--
 .../gpu/drm/i915/gem/selftests/mock_dmabuf.c  |  7 +-
 drivers/gpu/drm/lima/lima_gem.c               | 11 ++-
 drivers/gpu/drm/lima/lima_vm.c                |  5 +-
 drivers/gpu/drm/mediatek/mtk_drm_gem.c        | 37 ++------
 drivers/gpu/drm/msm/msm_gem.c                 | 13 +--
 drivers/gpu/drm/msm/msm_gpummu.c              | 15 ++-
 drivers/gpu/drm/msm/msm_iommu.c               |  2 +-
 drivers/gpu/drm/omapdrm/omap_gem.c            | 14 +--
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
 drivers/media/pci/cx23885/cx23885-alsa.c      |  4 +-
 drivers/media/pci/cx25821/cx25821-alsa.c      |  4 +-
 drivers/media/pci/cx88/cx88-alsa.c            |  6 +-
 drivers/media/pci/saa7134/saa7134-alsa.c      |  4 +-
 drivers/media/platform/vsp1/vsp1_drm.c        |  8 +-
 drivers/rapidio/devices/rio_mport_cdev.c      | 11 +--
 drivers/staging/media/tegra-vde/iommu.c       |  4 +-
 drivers/xen/gntdev-dmabuf.c                   | 13 ++-
 include/drm/drm_prime.h                       |  2 +
 samples/vfio-mdev/mbochs.c                    |  3 +-
 45 files changed, 280 insertions(+), 406 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
