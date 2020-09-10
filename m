Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4070263F47
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 10:05:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEFE26E2B1;
	Thu, 10 Sep 2020 08:05:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE606E2B1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 08:05:25 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200910080523euoutp0136353dc6d985928468a7f645eff7dd51~zXYY5XGS01947219472euoutp01W
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 08:05:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200910080523euoutp0136353dc6d985928468a7f645eff7dd51~zXYY5XGS01947219472euoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1599725123;
 bh=/bSxqPpVE8dy/KgKx0VCJuYIcJug38N6GFW/JKi4Wkk=;
 h=From:To:Cc:Subject:Date:References:From;
 b=smBEhb4UlIKbtebK8X5KJ/VDJzPmPY2DAM8Eb6EBw7zsS45Cp4wbrz03XyJq4V/xc
 XC8DO4TaZEgJH1v1q37eZ5yFTVXYbSN6ostBABUQNSd+Hu8PNa6/n28cYXorB1z3P6
 mxRv0g+KKdTXhH3//PV1uRiCVoSGRORyy8Un2leE=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200910080523eucas1p205843dc62f21ef575aa91942b28f645e~zXYYzbdKg1734317343eucas1p2E;
 Thu, 10 Sep 2020 08:05:23 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 3E.96.06456.34ED95F5; Thu, 10
 Sep 2020 09:05:23 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200910080523eucas1p20d33c029f7707f85ae5e48d309d8aea4~zXYYd0CjN2989529895eucas1p2j;
 Thu, 10 Sep 2020 08:05:23 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200910080523eusmtrp18041d31b2b8b9b716c21e4f3410a2f41~zXYYdKC7w0516605166eusmtrp1e;
 Thu, 10 Sep 2020 08:05:23 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-6c-5f59de434a44
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 42.B9.06017.34ED95F5; Thu, 10
 Sep 2020 09:05:23 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200910080522eusmtip16201446b19e8d990fef8d72b43fd7b08~zXYYKEwMR0498004980eusmtip1m;
 Thu, 10 Sep 2020 08:05:22 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] scatterlists related fixes
Date: Thu, 10 Sep 2020 10:05:05 +0200
Message-Id: <20200910080505.24456-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRmVeSWpSXmKPExsWy7djPc7rO9yLjDe5MVrI4cX0Rk8XCh3eZ
 LbZ3PGe0uPL1PZsDi8febwtYPHbOusvucb/7OFMAcxSXTUpqTmZZapG+XQJXxvFOn4KJqhXH
 e5cwNzAukO5i5OCQEDCRWPFUv4uRi0NIYAWjxLIbV1ggnC+MEm8//2PrYuQEcj4zSnRt9AGx
 QRoW/rzIChFfziixZWEBXMPL2xuYQBJsAoYSXW+7wJpFBLwlzl87yg5iMwu4SKz8uZcZZLOw
 gJbE10OiICaLgKrE3isWIBW8ArYSzY0fWCBWyUus3nCAGcLewCYxd7oWhO0i0X1pH1RcWOLV
 8S3sELaMxOnJPWD3Swg0M0o8PLeWHcLpYZS43DSDEaLKWuLOuV9sIIuZBTQl1u/Shwg7Skw8
 94sZEih8EjfeCkJczCcxadt0qDCvREebEES1msSs4+vg1h68cAnqHA+J9qlb2SGhEyuxsmkR
 ywRGuVkIuxYwMq5iFE8tLc5NTy02zEst1ytOzC0uzUvXS87P3cQIjOjT/45/2sH49VLSIUYB
 DkYlHt6OuxHxQqyJZcWVuYcYJTiYlUR4nc6ejhPiTUmsrEotyo8vKs1JLT7EKM3BoiTOa7zo
 ZayQQHpiSWp2ampBahFMlomDU6qBkffh09Ya7jC9+fZT/llETHRMKi1uYj/Ov/vXFraNkXNr
 JqZvzHE+ZxpW9ZL5g62O19Sr5X4X24IcOo5ZRldP2fp29c1gk39ey2a8UW6feWGrf91tcwv5
 3Rk2jdvzOq7OmMUnfNtIecrZlRqpm5J6GS0//0n/0z/l3DK/bTdcN2l9Mo3gCnPzVmIpzkg0
 1GIuKk4EAAMPqxLkAgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJLMWRmVeSWpSXmKPExsVy+t/xu7rO9yLjDd6f4LI4cX0Rk8XCh3eZ
 LbZ3PGe0uPL1PZsDi8febwtYPHbOusvucb/7OFMAc5SeTVF+aUmqQkZ+cYmtUrShhZGeoaWF
 npGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJexvFOn4KJqhXHe5cwNzAukO5i5OSQEDCRWPjz
 ImsXIxeHkMBSRolTy3eyQSRkJE5Oa2CFsIUl/lzrAosLCXxilJh9sBDEZhMwlOh6CxEXEfCV
 6Hl7AayeWcBNYtbRZyxdjBwcwgJaEl8PiYKYLAKqEnuvWIBU8ArYSjQ3fmCBmC4vsXrDAeYJ
 jDwLGBlWMYqklhbnpucWG+kVJ+YWl+al6yXn525iBAbTtmM/t+xg7HoXfIhRgINRiYe3425E
 vBBrYllxZe4hRgkOZiURXqezp+OEeFMSK6tSi/Lji0pzUosPMZoC7Z7ILCWanA8M9LySeENT
 Q3MLS0NzY3NjMwslcd4OgYMxQgLpiSWp2ampBalFMH1MHJxSDYy+MZfum9e6b3srXpniH7ea
 ccGu/b9djs6p23Di8ZvUVsf25AkTWvIL2/JzYmoWzOZ369pRohESWTGxRLTW9tGfAv38tSkL
 U99K9U25deGWoG1a1v+7FUdn2dRv3NPNkhjO35//I4frtqz7zQT3KYd1VJauqFyh27pQcFmy
 6uW1aoo31c6HxCixFGckGmoxFxUnAgCDO9PGPAIAAA==
X-CMS-MailID: 20200910080523eucas1p20d33c029f7707f85ae5e48d309d8aea4
X-Msg-Generator: CA
X-RootMTR: 20200910080523eucas1p20d33c029f7707f85ae5e48d309d8aea4
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200910080523eucas1p20d33c029f7707f85ae5e48d309d8aea4
References: <CGME20200910080523eucas1p20d33c029f7707f85ae5e48d309d8aea4@eucas1p2.samsung.com>
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Daniel,

Please pull a set of fixes for various DRM drivers that finally resolve
incorrect usage of the scatterlists (struct sg_table nents and orig_nents
entries), what causes issues when IOMMU is used.

Best regards
Marek Szyprowski, PhD
Samsung R&D Institute Poland


The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  https://github.com/mszyprow/linux.git for-5.10-drm-sg-fix

for you to fetch changes up to be0704beb229431f206fee3ddd65fa2c5eebdce3:

  samples: vfio-mdev/mbochs: fix common struct sg_table related issues (2020-09-10 08:19:46 +0200)

----------------------------------------------------------------
Marek Szyprowski (26):
      drm: prime: add common helper to check scatterlist contiguity
      drm: prime: use sgtable iterators in drm_prime_sg_to_page_addr_arrays()
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
      samples: vfio-mdev/mbochs: fix common struct sg_table related issues

 drivers/dma-buf/heaps/heap-helpers.c             | 13 ++--
 drivers/dma-buf/udmabuf.c                        |  7 +-
 drivers/gpu/drm/armada/armada_gem.c              | 24 +++----
 drivers/gpu/drm/drm_cache.c                      |  2 +-
 drivers/gpu/drm/drm_gem_cma_helper.c             | 23 +-----
 drivers/gpu/drm/drm_gem_shmem_helper.c           | 14 ++--
 drivers/gpu/drm/drm_prime.c                      | 91 ++++++++++++++----------
 drivers/gpu/drm/etnaviv/etnaviv_gem.c            | 12 ++--
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c            | 15 ++--
 drivers/gpu/drm/exynos/exynos_drm_g2d.c          | 10 +--
 drivers/gpu/drm/exynos/exynos_drm_gem.c          | 23 +-----
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c       | 11 +--
 drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c |  7 +-
 drivers/gpu/drm/lima/lima_gem.c                  | 11 ++-
 drivers/gpu/drm/lima/lima_vm.c                   |  5 +-
 drivers/gpu/drm/mediatek/mtk_drm_gem.c           | 37 +++-------
 drivers/gpu/drm/msm/msm_gem.c                    | 13 ++--
 drivers/gpu/drm/msm/msm_gpummu.c                 | 15 ++--
 drivers/gpu/drm/msm/msm_iommu.c                  |  2 +-
 drivers/gpu/drm/omapdrm/omap_gem.c               | 14 ++--
 drivers/gpu/drm/panfrost/panfrost_gem.c          |  4 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c          |  7 +-
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c            |  3 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c      | 42 +++--------
 drivers/gpu/drm/tegra/gem.c                      | 27 +++----
 drivers/gpu/drm/tegra/plane.c                    | 15 ++--
 drivers/gpu/drm/v3d/v3d_mmu.c                    | 13 ++--
 drivers/gpu/drm/virtio/virtgpu_object.c          | 36 ++++++----
 drivers/gpu/drm/virtio/virtgpu_vq.c              | 12 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c       | 17 ++---
 drivers/gpu/drm/xen/xen_drm_front_gem.c          |  2 +-
 drivers/gpu/host1x/job.c                         | 22 +++---
 drivers/media/platform/vsp1/vsp1_drm.c           |  8 +--
 drivers/xen/gntdev-dmabuf.c                      | 13 ++--
 include/drm/drm_prime.h                          |  2 +
 samples/vfio-mdev/mbochs.c                       |  3 +-
 36 files changed, 234 insertions(+), 341 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
