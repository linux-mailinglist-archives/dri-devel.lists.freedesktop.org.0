Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 157461099FB
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 09:14:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BD2189A5D;
	Tue, 26 Nov 2019 08:14:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B43AE89292;
 Mon, 25 Nov 2019 20:42:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ILkyMCajd2MfD+aKDK1LXf6ZoZbJUXnbg1c8VQ/lb/WUvdPvFSA3X362y4tkWszrWWv+Eomy7xtBGNzclScmQGhg+dCzfh7f3NkwEdCO9aoxnJzRKaenEBf1soxSskJsDV9Z+y9MEu02lqTqM7cIxpItxQBvAfh9rExzPZK+hVUo8UWSBY5d7PBIjWcuqxMm6hU1E9Aqx/ageRwknn3eJs/w6tmruZAbJMpMB70QzJysr2/TT6Iu1n9zCGsWbrqGg0ZBmiE1VUjQifq/l+AdpxPUfIbOpkznIxaN1rAZ/ojWu3/97ufGRRZYsGi+3SXdypkBhl85VzuNeZWUHbtpEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y6bIlO9oaZ6ZTiIOf1I5ti10Jwuo5pKl0SThESxl3jA=;
 b=c43kB+rz3+lQzsUYTn9N9O8WqV/PPbP+plOw7dOrLasg+VYNS3UWBRID7bo1UxRcf5WJCjpznUC+0w6sonNoythDCaqbpLM6KvazmsDyjJp6ywlJFOWCXc65/7GEcuC/jdhgUKqibF2LeqPcBrFWcAllLwf9jYMNZBbtR4nswQs0BGWXGw3OqKRk3nnk98gNhZK/AVU5DyCLQV9HxZFgAUjE6VG3lSsabI0ZUIfOLXFKHcfoSjP+OgLYlMeQ7sLFb7dvGXFYDgiTu/ywbsgIKQDBgHf70smD07vwx9t5AGGxNsGloMJ67/TuJadWmtlCYA1A0DFLav/hs4OCT5opUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB3166.eurprd05.prod.outlook.com (10.170.237.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Mon, 25 Nov 2019 20:42:52 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d%5]) with mapi id 15.20.2474.023; Mon, 25 Nov 2019
 20:42:52 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull hmm changes
Thread-Topic: [GIT PULL] Please pull hmm changes
Thread-Index: AQHVo9Dog/MtwM8aJU6I/7345tJKuA==
Date: Mon, 25 Nov 2019 20:42:52 +0000
Message-ID: <20191125204248.GA2485@ziepe.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-clientproxiedby: BL0PR02CA0064.namprd02.prod.outlook.com
 (2603:10b6:207:3d::41) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.162.113.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 049f7868-2195-499d-00ef-08d771e80a9c
x-ms-traffictypediagnostic: VI1PR05MB3166:
x-microsoft-antispam-prvs: <VI1PR05MB31663CAD38A4F81169EA160ACF4A0@VI1PR05MB3166.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:341;
x-forefront-prvs: 0232B30BBC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(39860400002)(136003)(366004)(189003)(199004)(66556008)(71190400001)(54906003)(64756008)(33656002)(6506007)(6916009)(256004)(8676002)(26005)(478600001)(25786009)(9686003)(186003)(6512007)(52116002)(102836004)(305945005)(7736002)(4326008)(4001150100001)(66476007)(7416002)(386003)(66446008)(2906002)(5660300002)(8936002)(66616009)(66946007)(81156014)(81166006)(86362001)(6436002)(1076003)(99286004)(36756003)(6486002)(14444005)(14454004)(66066001)(316002)(3846002)(6116002)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB3166;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: =?us-ascii?Q?YBQBbcZgnSrcyjFYNjBBi2CFsV3TODEknMzFzu5lbIPRByF089vXUilDaPrZ?=
 =?us-ascii?Q?/42FntexzkVe/kjm8gleFdPBFxY0n9nZrLt4usoQVZdqJ0hr5TcIgWCMECGl?=
 =?us-ascii?Q?NLzSZ7nrGTjqoNC5hN+NWG1OgcNy96HFgcinRz40qebRLiA4CoFMIW5+iWfE?=
 =?us-ascii?Q?+tRZOEJ/KdnyUTKfQw0h4+5ixjeiqeKBGtLH7EDI3f3AUDcazcAwZOgS9774?=
 =?us-ascii?Q?5odbDryVWqlWA1E05nsKdoYgd9PpazLIRjgg6Q9BJRVjhxaDcWrH2J8ESQlR?=
 =?us-ascii?Q?Y3jIDEnkSYd7GC0WdRYzb/axUQNuOi2xbyj0GivvxSlIBrp5yoGXEhFJ2BkK?=
 =?us-ascii?Q?keIKKx/IW88pcQtEd2G2M0jJ6qax6HcYTFBBYMo/cA5u+RlOeOO5hZJbtJXX?=
 =?us-ascii?Q?eOzIZOLZiJsif3UbhYx/0nw8Lf/WzbZBVcQVHFRoDLxudjNuSwrS7QzvHN64?=
 =?us-ascii?Q?l6cuEgVij/7Q9Gum1TeA+uW0A2rUpOtYqNjDAokmLt6BdLmVM4QDIqa1tyoj?=
 =?us-ascii?Q?BulVwkQRBuGhROElo3qd18GB3eTcsWZt4eEjytKRVZM/QeyGtllzg8jIaywK?=
 =?us-ascii?Q?7JUoHGxXg7KSrSn9zVjNpKEwe6Pm5rANRdjxMMvCnFM1feBrOO8yE48Y6UMr?=
 =?us-ascii?Q?zCnSUyMe1jsPalLZY/0Cd1M/ZKsBae7N4m8C5mFuwWegV4dSZB4ePwUn0aOJ?=
 =?us-ascii?Q?fwDNtSCmUOtQKz6AHxOVbB7Sp/mcJqg3wTxXNqSLanrcOysdZCc55OeAI9Qf?=
 =?us-ascii?Q?+72G6IHzH9pia+0+PiIXF9DTDYL2nC5EPP7pRhMkzkehNJG8wW8COgLtkADq?=
 =?us-ascii?Q?OnkXcxXd1svXPAsbvRi3AxITPl1yfgsQWnz1an/XNB0JmOdcNpYzhvAXM77J?=
 =?us-ascii?Q?aMrr5kmMf74Mj4IyjicFxR7bvb4LSNypPdWXpEHjP91dk0MEXN0mnMh2AoOI?=
 =?us-ascii?Q?M553IxhAHnHElC7fUbYIiqIiAdvPPrWpxKM07Kw7zeaAc05FHweDCMWqRdKE?=
 =?us-ascii?Q?H9JsKXBKe0wS/JeVPK7eISNdpxvWMxQf/Yw0ncswEaNtE/KdiBm65cuyhMgk?=
 =?us-ascii?Q?9dsJVxJdFsciuZdqK0+bvETDZ8ZknBqmdTQre+qfUc2Qp7wWx2bpSwLnrn5h?=
 =?us-ascii?Q?ODw/Ps0Fwi3yhL837dGZFQHfR/Ik/hGmLQez5RFvNvEog5Qpofzov9W26U57?=
 =?us-ascii?Q?9d3JCWWnqvod4eK7qLm2QG6AKl9EpZCx8WMIq7h3ohYt9Ti2x6k8Zn4s9EtN?=
 =?us-ascii?Q?T11Th9b9dBq44B67Ni9nUTsHt30AE8Yz/o0KMKjp1qqiyPkJLUZ0Jve6NtFg?=
 =?us-ascii?Q?KCTgSZZFupG72y48mv+Twyd7PXouyhVKqQYyKMip1FelnFkw75L9/g4x/8Ml?=
 =?us-ascii?Q?D50oFSmBtb0+hhs4yvJDKBVC8R4qc4rrotaO9mAwfJ+edyI5aQu//aTEU5X6?=
 =?us-ascii?Q?8ws+uGskIzkzJ94nRdkXBJr6/nQzVLiO6/Omi7DJz5JmgOJA3c0InVhtoU8v?=
 =?us-ascii?Q?oJXe7ZSiXeEM/OvazV1U2alujkFVAq/a7rE8XRPgsMOTCa+COLoE+Ik7TQie?=
 =?us-ascii?Q?s/LJrPUHsEf0OYZO2V16bIdxsYjyw1fy+zDI86bcYgccig9n6GvGcuTmo4rx?=
 =?us-ascii?Q?NI7mWOECNkvMHBS4cINIQwnaOzdJpsFGOF92h1L0Zwo5ygKM6yX2If/h6CfB?=
 =?us-ascii?Q?U955ohHfnf0FxmgImBYq9tZOAis=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 049f7868-2195-499d-00ef-08d771e80a9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2019 20:42:52.4789 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NeZdd2YN4mfhX0/mL5MaHT06CsE6ukZyg9YqqTt9hGfatCyoYrxNBRX5Jc2rVrHSZS22jURC6UC97Er6tFsa2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB3166
X-Mailman-Approved-At: Tue, 26 Nov 2019 08:14:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y6bIlO9oaZ6ZTiIOf1I5ti10Jwuo5pKl0SThESxl3jA=;
 b=lVzKMq/N71gRvMa6zk0GfPg9z6YhAFf778fqnFNiorLa13UOdh6Wl7CCIsYxsZtlHVkjtU1Cf4glAGtwA6BEXg4oLs9ID/LJ/pXx+WR2GA0zDnWFstQPGehSRX+cfWFV7X6cJB+sR8hi/S0ZWTrPh6VAPQ8KG2Fa1bE10zQshuM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, David Airlie <airlied@linux.ie>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0483575208=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0483575208==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mYCpIKhGyMATD0i+"

--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Here is this batch of hmm updates, I think we are nearing the end of this
project for now, although I suspect there will be some more patches related to
hmm_range_fault() in the next cycle.

You will probably be most interested in the patch "mm/mmu_notifier: add an
interval tree notifier". The approach here largely pre-exists in the various
drivers, but is honestly kind of complex/ugly. No better idea was found, I'm
hoping putting it all in one place will help improve this over the long
term. At least many bugs were squashed and lines of code eliminated while
consolidating.

Already i915 GPU has posted a series for the next window that also needs this
same approach.

There are two small conflicts I know of, the first is RDMA related with -rc,
the second is a one liner updating a deleted comment in GPU. Both can be
solved by using the hmm.git side of the conflict.

All the big driver changes have been acked and/or tested by their respective
maintainers.

Regards,
Jason

The following changes since commit d6d5df1db6e9d7f8f76d2911707f7d5877251b02:

  Linux 5.4-rc5 (2019-10-27 13:19:19 -0400)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git tags/for-linus-hmm

for you to fetch changes up to 93f4e735b6d98ee4b7a1252d81e815a983e359f2:

  mm/hmm: remove hmm_range_dma_map and hmm_range_dma_unmap (2019-11-23 19:56:45 -0400)

----------------------------------------------------------------
hmm related patches for 5.5

This is another round of bug fixing and cleanup. This time the focus is on
the driver pattern to use mmu notifiers to monitor a VA range. This code
is lifted out of many drivers and hmm_mirror directly into the
mmu_notifier core and written using the best ideas from all the driver
implementations.

This removes many bugs from the drivers and has a very pleasing
diffstat. More drivers can still be converted, but that is for another
cycle.

- A shared branch with RDMA reworking the RDMA ODP implementation

- New mmu_interval_notifier API. This is focused on the use case of
  monitoring a VA and simplifies the process for drivers

- A common seq-count locking scheme built into the mmu_interval_notifier
  API usable by drivers that call get_user_pages() or hmm_range_fault()
  with the VA range

- Conversion of mlx5 ODP, hfi1, radeon, nouveau, AMD GPU, and Xen GntDev
  drivers to the new API. This deletes a lot of wonky driver code.

- Two improvements for hmm_range_fault(), from testing done by Ralph

----------------------------------------------------------------
Christoph Hellwig (1):
      mm/hmm: remove hmm_range_dma_map and hmm_range_dma_unmap

Jason Gunthorpe (30):
      RDMA/mlx5: Use SRCU properly in ODP prefetch
      RDMA/mlx5: Split sig_err MR data into its own xarray
      RDMA/mlx5: Use a dedicated mkey xarray for ODP
      RDMA/mlx5: Delete struct mlx5_priv->mkey_table
      RDMA/mlx5: Rework implicit_mr_get_data
      RDMA/mlx5: Lift implicit_mr_alloc() into the two routines that call it
      RDMA/mlx5: Set the HW IOVA of the child MRs to their place in the tree
      RDMA/mlx5: Split implicit handling from pagefault_mr
      RDMA/mlx5: Use an xarray for the children of an implicit ODP
      RDMA/mlx5: Reduce locking in implicit_mr_get_data()
      RDMA/mlx5: Avoid double lookups on the pagefault path
      RDMA/mlx5: Rework implicit ODP destroy
      RDMA/mlx5: Do not store implicit children in the odp_mkeys xarray
      RDMA/mlx5: Do not race with mlx5_ib_invalidate_range during create and destroy
      RDMA/odp: Remove broken debugging call to invalidate_range
      Merge branch 'odp_rework' into hmm.git
      mm/mmu_notifier: define the header pre-processor parts even if disabled
      mm/mmu_notifier: add an interval tree notifier
      mm/hmm: allow hmm_range to be used with a mmu_interval_notifier or hmm_mirror
      mm/hmm: define the pre-processor related parts of hmm.h even if disabled
      RDMA/odp: Use mmu_interval_notifier_insert()
      RDMA/hfi1: Use mmu_interval_notifier_insert for user_exp_rcv
      drm/radeon: use mmu_interval_notifier_insert
      nouveau: use mmu_notifier directly for invalidate_range_start
      nouveau: use mmu_interval_notifier instead of hmm_mirror
      drm/amdgpu: Call find_vma under mmap_sem
      drm/amdgpu: Use mmu_interval_insert instead of hmm_mirror
      drm/amdgpu: Use mmu_interval_notifier instead of hmm_mirror
      mm/hmm: remove hmm_mirror and related
      xen/gntdev: use mmu_interval_notifier_insert

Ralph Campbell (2):
      mm/hmm: allow snapshot of the special zero page
      mm/hmm: make full use of walk_page_range()

 Documentation/vm/hmm.rst                         |  105 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu.h              |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c |    9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c           |   14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c       |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c           |  443 ++--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h           |   53 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h       |   13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c          |  145 ++--
 drivers/gpu/drm/nouveau/nouveau_svm.c            |  230 +++--
 drivers/gpu/drm/radeon/radeon.h                  |    9 +-
 drivers/gpu/drm/radeon/radeon_mn.c               |  218 +----
 drivers/infiniband/core/device.c                 |    1 -
 drivers/infiniband/core/umem_odp.c               |  341 ++------
 drivers/infiniband/hw/hfi1/file_ops.c            |    2 +-
 drivers/infiniband/hw/hfi1/hfi.h                 |    2 +-
 drivers/infiniband/hw/hfi1/user_exp_rcv.c        |  146 ++--
 drivers/infiniband/hw/hfi1/user_exp_rcv.h        |    3 +-
 drivers/infiniband/hw/mlx5/cq.c                  |   33 +-
 drivers/infiniband/hw/mlx5/devx.c                |    8 +-
 drivers/infiniband/hw/mlx5/main.c                |   17 +-
 drivers/infiniband/hw/mlx5/mlx5_ib.h             |   29 +-
 drivers/infiniband/hw/mlx5/mr.c                  |  142 ++-
 drivers/infiniband/hw/mlx5/odp.c                 | 1004 +++++++++++-----------
 drivers/net/ethernet/mellanox/mlx5/core/main.c   |    4 -
 drivers/net/ethernet/mellanox/mlx5/core/mr.c     |   28 +-
 drivers/xen/gntdev-common.h                      |    8 +-
 drivers/xen/gntdev.c                             |  179 ++--
 include/linux/hmm.h                              |  190 +---
 include/linux/mlx5/driver.h                      |    4 -
 include/linux/mmu_notifier.h                     |  147 +++-
 include/rdma/ib_umem_odp.h                       |   86 +-
 include/rdma/ib_verbs.h                          |    2 -
 kernel/fork.c                                    |    1 -
 mm/Kconfig                                       |    2 +-
 mm/hmm.c                                         |  523 ++---------
 mm/mmu_notifier.c                                |  557 +++++++++++-
 37 files changed, 1912 insertions(+), 2789 deletions(-)

--mYCpIKhGyMATD0i+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEfB7FMLh+8QxL+6i3OG33FX4gmxoFAl3cPMYACgkQOG33FX4g
mxqg1Q//QiNnGK2QzlMsyvot0OS7QJ9YGLB9MrJ5pLt6iM7TCVwX5XdxSNNSnqYs
PPrax5JI6HYGvoBrABaGAEzax9o6FXk9r+5OnavY9xUoNG1C9t0lk+9mFfC19fOx
+yNBpP9u3wWSbbQyfoa7fPY/2eR+0d04fcaksnHKdLYtmU90sNAGJXaSRFOs+EW3
lpTHZTzGXiiCYgY15wHKKVQ5P0Bc7sVk8cyFkheNgY/TKa0fXhjNmYEIKjr6Cl/g
KHW/uGeLukWe8qmARwE9CbBEeDY4WS25/qadcstGJvfRJxDlQiRtSnDeATFYUK4L
ZfZ7OvBrau/uKW6ZQyeCUhJJAd4pOnHW+SbXN3ZI3cB427mFL0XMFenGG/ajANoR
fkhq+Ppqx+879B+wZmk1Exr7/7V0SDzQVgXYZQ267RE833V4R3O9VmagZhFz6L5R
dGirANtcrhyhI3a/BZlMwMFLdEND45lxPNIHmHzEr1Qy0wVOoIsilxesb1jxSdyR
8zDmqXP1I38dii0sB5t7HG+go4EuPcYU4CBpx69whpndhxELkd8BKRD6ScQDiWr4
eKx7/rW/6wvfX6sgYaqV6Id/e8Y19RqfL7DYTdfhXEbxXg6YG9MDglKiWR2Bytyr
h9PJ/K8asp+LDdZsSikIMJer+ZBtCbjH7wo1eMonmAUU5sRk09g=
=XrsZ
-----END PGP SIGNATURE-----

--mYCpIKhGyMATD0i+--

--===============0483575208==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0483575208==--
