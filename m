Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C73F520FC54
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 20:56:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF5CC6E11B;
	Tue, 30 Jun 2020 18:56:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D0F6E11B
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 18:56:44 +0000 (UTC)
IronPort-SDR: LXalWFEIbvcGxS/c0tE2uWlg2xk71FfvBTS3KZFcJsPDnfpuB2RcfHjus38BhGEVyesxjgs8rx
 k7JJGZC0VGkw==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="207871739"
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="207871739"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 11:56:43 -0700
IronPort-SDR: Ennvm8pfBxilM9+h7h/n+KE1hxGJErR0BVhsuh+dRGWcZIebyuYgP+UqJb7HDNR9TfLxP+YGgL
 ANoTA3nmboXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="321012397"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by FMSMGA003.fm.intel.com with ESMTP; 30 Jun 2020 11:56:42 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 30 Jun 2020 11:56:42 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 30 Jun 2020 11:56:42 -0700
Received: from ORSEDG001.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 30 Jun 2020 11:56:42 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 30 Jun 2020 11:56:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mp05suGxyjoQ/R14UqTOU+2HVPu/uJCYsyPTtV5b+BYwxGuq6BDh83hvyUjrZtiqJzXQALKMOxmLkRLDotvUow0I4ll2UXYyTADitX/ua1z2jT8acsZ8V3KiczR0tz+2VPgx3yjmRMgZYVj9VN84o2cRb/UmLDIM8kJCjYPX4j3uJ70/zzNqZU/HUo2BERblZAMfNGlFh26LMR/xPCoaUNUYmiF1pXAWL9+Zk51/YkrZ8WiEQfuovEbO/MjXcpHI5hjaGwqqeOj3nT3lPiRSfigLVvrHDAeaPl0yTMxFd9bx4XcMb4EURGCAFM18J2buDGLlyHRp5n8rnMWg9khhTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QGJhVOrEjLdc1KlLhB1uvVN891VfvGk7+02jWpEKozQ=;
 b=ehtZsdDzfJXnoxzt3vrd6G17cm4BlNBgMNfT+9wyYBzlxFDbBdR/uf/tGxsmbSTLSk2yJjt2WVVi2oehl8JdLVTym7mGKATTUIaIUndo9u5oIQy+1d5SbcNegmNcPt6FUXXUaquFNKQf4QtXsYQTIUtRTvBURdk+F2rTzT4pnq/D5JOQWWVAUVmofuMo7EDhVVujvWCi25+xa2QcnhATuyDSwqYf9llgCIMdcAfOp1bsQtst14QkEdRVhu6pndNpVnQQh1OViizr1/s2FE6Y7T6D9GjTO22S7F+79J5zrttEOy2VAEQgT81qDvTSpIiGL0EaVBib6/Lx4e2f2XoJ3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QGJhVOrEjLdc1KlLhB1uvVN891VfvGk7+02jWpEKozQ=;
 b=Ry4M6z6bqOMS8RGTjCLwfin/eQypw+aSNq5jRP2KhAUZzJ5Fg5Ajg5u4pgmu9lvizhv/mySL+ingYI/WhJdx6EHq532te0+tFgVK8IRZrbJ/+BuwGKZmcoKPNqbA2xm3wS+INnBKeWPMzgKcJmyo2yKC1RRNVpU16wE34+SIeWA=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by MWHPR11MB1855.namprd11.prod.outlook.com (2603:10b6:300:10e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.25; Tue, 30 Jun
 2020 18:56:39 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::ed68:a00b:2bb0:21cf]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::ed68:a00b:2bb0:21cf%8]) with mapi id 15.20.3131.027; Tue, 30 Jun 2020
 18:56:39 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
Subject: RE: [RFC PATCH v2 0/3] RDMA: add dma-buf support
Thread-Topic: [RFC PATCH v2 0/3] RDMA: add dma-buf support
Thread-Index: AQHWTjmKZPnzyjUH+EiOzVuDukOX/KjxgzKg
Date: Tue, 30 Jun 2020 18:56:39 +0000
Message-ID: <MW3PR11MB45552725859E074AF24E132DE56F0@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1593451903-30959-1-git-send-email-jianxin.xiong@intel.com>
In-Reply-To: <1593451903-30959-1-git-send-email-jianxin.xiong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [134.134.136.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 62923e40-914a-4008-82ee-08d81d27525c
x-ms-traffictypediagnostic: MWHPR11MB1855:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB18553F698BF28B7BC4321FE4E56F0@MWHPR11MB1855.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 0450A714CB
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j5AUKKhPuxc/u7H3irzHDZ/MLmqRNrUO6O4yP55UzlVpQZfekQxEgVVBhNz2/7CyCk7itM92wggaCsStn2S8GiUfCyhx80IC9kSHMynr8tbEyIXk1cTyW2NsMrOVm/Ced4rXpx8B7ioRQMLiXTdMN+luaIBHgyhWW6NXigfOsWx6mRiefSlCPozNykUgb2kDT9zajvFlEk68I6PoCRpv83tPgk6DKUGa5Z74Uk+p6qOW8bDSk56Mq+MwX3bT4hjJlZF/HM+yFC4oo2HRhnUQ7hifh6EULvgx2SL6JUBOGPGBlQdYt3qpCYlXO8ICTZdX
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(396003)(366004)(39860400002)(376002)(346002)(2906002)(8936002)(4326008)(9686003)(66556008)(66946007)(5660300002)(64756008)(66476007)(76116006)(66446008)(52536014)(478600001)(33656002)(186003)(55016002)(26005)(6506007)(53546011)(71200400001)(7696005)(86362001)(83380400001)(54906003)(316002)(8676002)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: fRbAunZdaOF/P6HVSN03NoXGHoFZSeDaou00sFf6WI4XVQiK9BjLLySxeX7xb/PsjLTkKPyxhbFiA4oZ2/BLuDWsB1R1bDveHUHbq8Wp4bSYZnAOdeSJA4kOds7lC+L4K5GXwPVenruW0WTkinfR5FDDzRg3bcaZzUmD2AN8VgIsf3bLseukZ7wCl0ssAruJmSp2JG3LjJ2HvQCoH4D+imgsC+6VOSCsyMQ6aBusiOe1FiUdiuvlVvIItKO+t0o8kgHM7Uwv3j1eKQqEqeo+aypOsuWUGIfE70Fs/IHZulJDqsLB3tVgBIGDIjKhizrW4J0g8eR0CdnDelu4BKabxQLYjMA2kaehElrfAJmkFGFrJynbIlgPsUnFEC1Sh3Aex8l+KywYZqKm+1dMqBW4QjAsHNSV5c7kU2aN3+uGWQAidlR2jMTHyG8H7JpaeMjt3XCS5pAyZN4WEFb7sXPszk7IyTibt2W3WZINMMJVDiGat/Y+tdlDfKFzQ1eeYQhW
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62923e40-914a-4008-82ee-08d81d27525c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2020 18:56:39.5171 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZXYiNUTLkhatW7Xmlm9op7KmU5pacNLwZqO7A/FmV44RSLvXapcbt5OpXShpQzT83nX0QKdaP4/MeveHq93TMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1855
X-OriginatorOrg: intel.com
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
Cc: Leon Romanovsky <leon@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>, "Vetter,
 Daniel" <daniel.vetter@intel.com>, Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Added to cc-list:
Christian Koenig <christian.koenig@amd.com>
dri-devel@lists.freedesktop.org

> -----Original Message-----
> From: Xiong, Jianxin <jianxin.xiong@intel.com>
> Sent: Monday, June 29, 2020 10:32 AM
> To: linux-rdma@vger.kernel.org
> Cc: Xiong, Jianxin <jianxin.xiong@intel.com>; Doug Ledford <dledford@redhat.com>; Jason Gunthorpe <jgg@ziepe.ca>; Sumit Semwal
> <sumit.semwal@linaro.org>; Leon Romanovsky <leon@kernel.org>; Vetter, Daniel <daniel.vetter@intel.com>
> Subject: [RFC PATCH v2 0/3] RDMA: add dma-buf support
> 
> When enabled, an RDMA capable NIC can perform peer-to-peer transactions
> over PCIe to access the local memory located on another device. This can
> often lead to better performance than using a system memory buffer for
> RDMA and copying data between the buffer and device memory.
> 
> Current kernel RDMA stack uses get_user_pages() to pin the physical
> pages backing the user buffer and uses dma_map_sg_attrs() to get the
> dma addresses for memory access. This usually doesn't work for peer
> device memory due to the lack of associated page structures.
> 
> Several mechanisms exist today to facilitate device memory access.
> 
> ZONE_DEVICE is a new zone for device memory in the memory management
> subsystem. It allows pages from device memory being described with
> specialized page structures. As the result, calls like get_user_pages()
> can succeed, but what can be done with these page structures may be
> different from system memory. It is further specialized into multiple
> memory types, such as one type for PCI p2pmem/p2pdma and one type for
> HMM.
> 
> PCI p2pmem/p2pdma uses ZONE_DEVICE to represent device memory residing
> in a PCI BAR and provides a set of calls to publish, discover, allocate,
> and map such memory for peer-to-peer transactions. One feature of the
> API is that the buffer is allocated by the side that does the DMA
> transfer. This works well with the storage usage case, but is awkward
> with GPU-NIC communication, where typically the buffer is allocated by
> the GPU driver rather than the NIC driver.
> 
> Heterogeneous Memory Management (HMM) utilizes mmu_interval_notifier
> and ZONE_DEVICE to support shared virtual address space and page
> migration between system memory and device memory. HMM doesn't support
> pinning device memory because pages located on device must be able to
> migrate to system memory when accessed by CPU. Peer-to-peer access
> is possible if the peer can handle page fault. For RDMA, that means
> the NIC must support on-demand paging.
> 
> Dma-buf is a standard mechanism for sharing buffers among different
> device drivers. The buffer to be shared is exported by the owning
> driver and imported by the driver that wants to use it. The exporter
> provides a set of ops that the importer can call to pin and map the
> buffer. In addition, a file descriptor can be associated with a dma-
> buf object as the handle that can be passed to user space.
> 
> This patch series adds dma-buf importer role to the RDMA driver in
> attempt to support RDMA using device memory such as GPU VRAM. Dma-buf is
> chosen for a few reasons: first, the API is relatively simple and allows
> a lot of flexibility in implementing the buffer manipulation ops.
> Second, it doesn't require page structure. Third, dma-buf is already
> supported in many GPU drivers. However, we are aware that existing GPU
> drivers don't allow pinning device memory via the dma-buf interface.
> Pinning and mapping a dma-buf would cause the backing storage to migrate
> to system RAM. This is due to the lack of knowledge about whether the
> importer can perform peer-to-peer access and the lack of resource limit
> control measure for GPU. For the first part, the latest dma-buf driver
> has a peer-to-peer flag for the importer, but the flag is currently tied
> to dynamic mapping support, which requires on-demand paging support from
> the NIC to work. There are a few possible ways to address these issues,
> such as decoupling peer-to-peer flag from dynamic mapping, allowing more
> leeway for individual drivers to make the pinning decision and adding
> GPU resource limit control via cgroup. We would like to get comments on
> this patch series with the assumption that device memory pinning via
> dma-buf is supported by some GPU drivers, and at the same time welcome
> open discussions on how to address the aforementioned issues as well as
> GPU-NIC peer-to-peer access solutions in general.
> 
> This is the second version of the patch series. Here are the changes
> from the previous version:
> * The Kconfig option is removed. There is no dependence issue since
> dma-buf driver is always enabled.
> * The declaration of new data structure and functions is reorganized to
> minimize the visibility of the changes.
> * The new uverbs command now goes through ioctl() instead of write().
> * The rereg functionality is removed.
> * Instead of adding new device method for dma-buf specific registration,
> existing method is extended to accept an extra parameter.
> * The correct function is now used for address range checking.
> 
> This series is organized as follows. The first patch adds the common
> code for importing dma-buf from a file descriptor and pinning and
> mapping the dma-buf pages. Patch 2 extends the reg_user_mr() method
> of the ib_device structure to accept dma-buf file descriptor as an extra
> parameter. Vendor drivers are updated with the change. Patch 3 adds a
> new uverbs command for registering dma-buf based memory region.
> 
> Related user space RDMA library changes will be provided as a separate
> patch series.
> 
> Jianxin Xiong (3):
>   RDMA/umem: Support importing dma-buf as user memory region
>   RDMA/core: Expand the driver method 'reg_user_mr' to support dma-buf
>   RDMA/uverbs: Add uverbs command for dma-buf based MR registration
> 
>  drivers/infiniband/core/Makefile                |   2 +-
>  drivers/infiniband/core/umem.c                  |   4 +
>  drivers/infiniband/core/umem_dmabuf.c           | 105 ++++++++++++++++++++++
>  drivers/infiniband/core/umem_dmabuf.h           |  11 +++
>  drivers/infiniband/core/uverbs_cmd.c            |   2 +-
>  drivers/infiniband/core/uverbs_std_types_mr.c   | 112 ++++++++++++++++++++++++
>  drivers/infiniband/core/verbs.c                 |   2 +-
>  drivers/infiniband/hw/bnxt_re/ib_verbs.c        |   7 +-
>  drivers/infiniband/hw/bnxt_re/ib_verbs.h        |   2 +-
>  drivers/infiniband/hw/cxgb4/iw_cxgb4.h          |   3 +-
>  drivers/infiniband/hw/cxgb4/mem.c               |   8 +-
>  drivers/infiniband/hw/efa/efa.h                 |   2 +-
>  drivers/infiniband/hw/efa/efa_verbs.c           |   7 +-
>  drivers/infiniband/hw/hns/hns_roce_device.h     |   2 +-
>  drivers/infiniband/hw/hns/hns_roce_mr.c         |   7 +-
>  drivers/infiniband/hw/i40iw/i40iw_verbs.c       |   6 ++
>  drivers/infiniband/hw/mlx4/mlx4_ib.h            |   2 +-
>  drivers/infiniband/hw/mlx4/mr.c                 |   7 +-
>  drivers/infiniband/hw/mlx5/mlx5_ib.h            |   2 +-
>  drivers/infiniband/hw/mlx5/mr.c                 |  45 +++++++++-
>  drivers/infiniband/hw/mthca/mthca_provider.c    |   8 +-
>  drivers/infiniband/hw/ocrdma/ocrdma_verbs.c     |   9 +-
>  drivers/infiniband/hw/ocrdma/ocrdma_verbs.h     |   3 +-
>  drivers/infiniband/hw/qedr/verbs.c              |   8 +-
>  drivers/infiniband/hw/qedr/verbs.h              |   3 +-
>  drivers/infiniband/hw/usnic/usnic_ib_verbs.c    |   8 +-
>  drivers/infiniband/hw/usnic/usnic_ib_verbs.h    |   2 +-
>  drivers/infiniband/hw/vmw_pvrdma/pvrdma_mr.c    |   6 +-
>  drivers/infiniband/hw/vmw_pvrdma/pvrdma_verbs.h |   2 +-
>  drivers/infiniband/sw/rdmavt/mr.c               |   6 +-
>  drivers/infiniband/sw/rdmavt/mr.h               |   2 +-
>  drivers/infiniband/sw/rxe/rxe_verbs.c           |   6 ++
>  drivers/infiniband/sw/siw/siw_verbs.c           |   8 +-
>  drivers/infiniband/sw/siw/siw_verbs.h           |   3 +-
>  include/rdma/ib_umem.h                          |  14 ++-
>  include/rdma/ib_verbs.h                         |   4 +-
>  include/uapi/rdma/ib_user_ioctl_cmds.h          |  14 +++
>  37 files changed, 410 insertions(+), 34 deletions(-)
>  create mode 100644 drivers/infiniband/core/umem_dmabuf.c
>  create mode 100644 drivers/infiniband/core/umem_dmabuf.h
> 
> --
> 1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
