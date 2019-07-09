Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 657C4642AC
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 09:25:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E77089BFE;
	Wed, 10 Jul 2019 07:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00044.outbound.protection.outlook.com [40.107.0.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84CA7893E8;
 Tue,  9 Jul 2019 19:24:25 +0000 (UTC)
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB5726.eurprd05.prod.outlook.com (20.178.121.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Tue, 9 Jul 2019 19:24:21 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e%5]) with mapi id 15.20.2052.020; Tue, 9 Jul 2019
 19:24:21 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton
 <akpm@linux-foundation.org>
Subject: [GIT PULL] Please pull hmm changes
Thread-Topic: [GIT PULL] Please pull hmm changes
Thread-Index: AQHVNovpxflbYd9hmkamArkmGtqk+w==
Date: Tue, 9 Jul 2019 19:24:21 +0000
Message-ID: <20190709192418.GA13677@ziepe.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-clientproxiedby: BL0PR1501CA0012.namprd15.prod.outlook.com
 (2603:10b6:207:17::25) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6a6868cf-7c72-47d3-d3d4-08d704a30b6a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(49563074)(7193020);
 SRVR:VI1PR05MB5726; 
x-ms-traffictypediagnostic: VI1PR05MB5726:
x-microsoft-antispam-prvs: <VI1PR05MB572692B955595A93552FEB23CFF10@VI1PR05MB5726.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(346002)(396003)(366004)(136003)(199004)(189003)(99286004)(14454004)(25786009)(81166006)(476003)(6116002)(99936001)(6486002)(8676002)(71190400001)(71200400001)(305945005)(68736007)(1076003)(81156014)(7416002)(66066001)(6512007)(4326008)(66446008)(33656002)(8936002)(7736002)(478600001)(9686003)(486006)(102836004)(186003)(256004)(386003)(2906002)(14444005)(110136005)(54906003)(6506007)(53936002)(26005)(52116002)(66556008)(316002)(3846002)(66616009)(66476007)(5660300002)(86362001)(66946007)(73956011)(64756008)(6436002)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB5726;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KhcwCfE8EYVrR/Al4pmt5Hy6PnqsnaiBmRmQ9Iv0hTZXTEolsd+8BWn2FH5IiSuU73hTYtUVtRTba6nQUL1YGOnUKa8W6Ukve8ebY0Uz1NoTSKTU45hpjWyJ7nrLhKD7mC5xFvBI4gSs/00a3t0mpbG0g1pnzo0dotLzQONug/piO/Q2lx0/ipdQaQzlg3GrYpn7h4J9B9INvV1BDw5d10i+f3AqhSK2N5P/Fhz3R606y1YkE9lfGT3LaL1ovSDjcUPfgdwaEhfE9IxeTiphJvJQRjOSS9XKuwvhonWd2SzBxQeNgIZAyVXBC5xwRJDEHkdpdcPUp50o/gVd9q414rhOu3YBLNe/hiHoQmj6SxWf2eu/PXJckMkwUNa4dWl2gfWYHvM7p+Q4Qb2DYHcaSy7J+iFn22AEjt71l7uog4w=
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a6868cf-7c72-47d3-d3d4-08d704a30b6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 19:24:21.7663 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5726
X-Mailman-Approved-At: Wed, 10 Jul 2019 07:25:20 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8N1RGbhtxccRLAM+e1yYRZZ7sbHuJjL6vtWQfvJIyws=;
 b=p1fkc0jJ3NSp1mxWgafKMgf/gqt2SVH+qUSd1SrnfzwTBLqrDJKx8rSF3x20wn/BM0rXTdaWUAqf+rT/VtOfCnzHnL8kvSaV3FbOmXrpUAYRrGGpOgjKaAJr2UvB1n1FRXf8jzulLVY/kOGKCqIXJ5dY1mmU/IG3mDONiNI96hI=
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
Cc: David Airlie <airlied@linux.ie>, "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Dan Williams <dan.j.williams@intel.com>, Christoph Hellwig <hch@lst.de>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============1781057267=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1781057267==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"

--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

As was discussed some time ago here are the mostly -mm patches related
to hmm functions. In agreement with Andrew we split this out from
quilt into a git topic branch so it can be shared between the DRM and
RDMA git trees. However, this cycle did not see dependencies with work
in DRM or RDMA that required a topic merge. I expect that work will
start to get ready next cycle and we will see a need for a cross-tree
topic merge then.

I'm sending it early as it is now a dependency for several patches in
mm's quilt.

This has been an exciting topic branch for conflicts, you'll need the
below simple resolution in the merge commit to make it compile
(lockdep_assert_held_exclusive() was renamed to
lockdep_assert_held_write())

Otherwise, for reference to all parties, here is how the conflicts were
handled:

- Several small patches from -mm quilt were moved to this tree to simplify
  conflict management, only Ira's 'fix release_pages()' patch was not hmm
  related.

- DRM introduced a new users of the hmm_range_register() API. We worked
  with AMDGPU to ensure that their new user could use the revised API via
  the below trivial merge fixup with DRM:

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -783,7 +783,7 @@ int amdgpu_ttm_tt_get_user_pages(struct ttm_tt *ttm, struct page **pages)
                                0 : range->flags[HMM_PFN_WRITE];
        range->pfn_flags_mask = 0;
        range->pfns = pfns;
 -     hmm_range_register(range, mm, start,
 +     hmm_range_register(range, mirror, start,
                           start + ttm->num_pages * PAGE_SIZE, PAGE_SHIFT);

   retry:

- ARM64 has a patch series going through -mm with a trivial
  conflict ("Devmap cleanups + arm64 support"), Andrew has re-applied this
  in quilt onto linux-next and will send it

- The memreap sub-section changes in -mm has 5 hunk conflict with the
  memremap changes here. Andrew reapplied Dan's series ontop of
  Christoph's series in linux-next and will send it.

The tag for-linus-hmm-merged with my merge resolution to your tree is
also available to pull.

Thanks,
Jason

diff --cc mm/hmm.c
index d48b9283725a90,f702a3895d05d8..e1eedef129cf5c
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@@ -42,16 -54,11 +42,16 @@@ static const struct mmu_notifier_ops hm
   */
  static struct hmm *hmm_get_or_create(struct mm_struct *mm)
  {
 -	struct hmm *hmm = mm_get_hmm(mm);
 -	bool cleanup = false;
 +	struct hmm *hmm;

- 	lockdep_assert_held_exclusive(&mm->mmap_sem);
 -	if (hmm)
 -		return hmm;
++	lockdep_assert_held_write(&mm->mmap_sem);
 +
 +	/* Abuse the page_table_lock to also protect mm->hmm. */
 +	spin_lock(&mm->page_table_lock);
 +	hmm = mm->hmm;
 +	if (mm->hmm && kref_get_unless_zero(&mm->hmm->kref))
 +		goto out_unlock;
 +	spin_unlock(&mm->page_table_lock);

  	hmm = kmalloc(sizeof(*hmm), GFP_KERNEL);
  	if (!hmm)
@@@ -245,8 -277,8 +245,8 @@@ static const struct mmu_notifier_ops hm
   */
  int hmm_mirror_register(struct hmm_mirror *mirror, struct mm_struct *mm)
  {
- 	lockdep_assert_held_exclusive(&mm->mmap_sem);
++	lockdep_assert_held_write(&mm->mmap_sem);
 +
  	/* Sanity check */
  	if (!mm || !mirror || !mirror->ops)
  		return -EINVAL;

The following changes since commit 6fbc7275c7a9ba97877050335f290341a1fd8dbf:

  Linux 5.2-rc7 (2019-06-30 11:25:36 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git tags/for-linus-hmm

for you to fetch changes up to cc5dfd59e375f4d0f2b64643723d16b38b2f2d78:

  Merge branch 'hmm-devmem-cleanup.4' into rdma.git hmm (2019-07-02 15:10:45 -0300)

----------------------------------------------------------------
HMM patches for 5.3

Improvements and bug fixes for the hmm interface in the kernel:

- Improve clarity, locking and APIs related to the 'hmm mirror' feature
  merged last cycle. In linux-next we now see AMDGPU and nouveau to be
  using this API.

- Remove old or transitional hmm APIs. These are hold overs from the past
  with no users, or APIs that existed only to manage cross tree conflicts.
  There are still a few more of these cleanups that didn't make the merge
  window cut off.

- Improve some core mm APIs:
  * export alloc_pages_vma() for driver use
  * refactor into devm_request_free_mem_region() to manage
    DEVICE_PRIVATE resource reservations
  * refactor duplicative driver code into the core dev_pagemap
    struct

- Remove hmm wrappers of improved core mm APIs, instead have drivers use
  the simplified API directly

- Remove DEVICE_PUBLIC

- Simplify the kconfig flow for the hmm users and core code

----------------------------------------------------------------
Christoph Hellwig (24):
      mm: remove the unused ARCH_HAS_HMM_DEVICE Kconfig option
      mm: remove the struct hmm_device infrastructure
      mm: remove MEMORY_DEVICE_PUBLIC support
      mm: don't clear ->mapping in hmm_devmem_free
      mm: export alloc_pages_vma
      mm: factor out a devm_request_free_mem_region helper
      memremap: validate the pagemap type passed to devm_memremap_pages
      memremap: move dev_pagemap callbacks into a separate structure
      memremap: pass a struct dev_pagemap to ->kill and ->cleanup
      memremap: lift the devmap_enable manipulation into devm_memremap_pages
      memremap: add a migrate_to_ram method to struct dev_pagemap_ops
      memremap: remove the data field in struct dev_pagemap
      memremap: replace the altmap_valid field with a PGMAP_ALTMAP_VALID flag
      memremap: provide an optional internal refcount in struct dev_pagemap
      device-dax: use the dev_pagemap internal refcount
      PCI/P2PDMA: use the dev_pagemap internal refcount
      nouveau: use alloc_page_vma directly
      nouveau: use devm_memremap_pages directly
      mm: remove hmm_vma_alloc_locked_page
      mm: remove hmm_devmem_add
      mm: simplify ZONE_DEVICE page private data
      mm: sort out the DEVICE_PRIVATE Kconfig mess
      mm: remove the HMM config option
      mm: don't select MIGRATE_VMA_HELPER from HMM_MIRROR

Ira Weiny (1):
      mm/swap: fix release_pages() when releasing devmap pages

Jason Gunthorpe (15):
      mm/hmm.c: suppress compilation warnings when CONFIG_HUGETLB_PAGE is not set
      mm/hmm: fix use after free with struct hmm in the mmu notifiers
      mm/hmm: Use hmm_mirror not mm as an argument for hmm_range_register
      mm/hmm: Hold a mmgrab from hmm to mm
      mm/hmm: Simplify hmm_get_or_create and make it reliable
      mm/hmm: Remove duplicate condition test before wait_event_timeout
      mm/hmm: Do not use list*_rcu() for hmm->ranges
      mm/hmm: Hold on to the mmget for the lifetime of the range
      mm/hmm: Use lockdep instead of comments
      mm/hmm: Remove racy protection against double-unregistration
      mm/hmm: Poison hmm_range during unregister
      mm/hmm: Remove confusing comment and logic from hmm_release
      mm/hmm: Fix error flows in hmm_invalidate_range_start
      Merge tag 'v5.2-rc7' into rdma.git hmm
      Merge branch 'hmm-devmem-cleanup.4' into rdma.git hmm

Kuehling, Felix (1):
      mm/hmm: Only set FAULT_FLAG_ALLOW_RETRY for non-blocking

Philip Yang (1):
      mm/hmm: support automatic NUMA balancing

Ralph Campbell (2):
      mm/hmm: update HMM documentation
      mm/hmm: clean up some coding style and comments

 Documentation/vm/hmm.rst               | 166 ++++------
 arch/powerpc/mm/mem.c                  |  10 +-
 arch/x86/mm/init_64.c                  |   8 +-
 drivers/dax/dax-private.h              |   4 -
 drivers/dax/device.c                   |  41 +--
 drivers/dax/pmem/core.c                |   2 +-
 drivers/gpu/drm/nouveau/Kconfig        |   6 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 103 +++---
 drivers/gpu/drm/nouveau/nouveau_svm.c  |   2 +-
 drivers/nvdimm/pfn_devs.c              |   3 +-
 drivers/nvdimm/pmem.c                  |  51 ++-
 drivers/pci/p2pdma.c                   |  52 +--
 fs/proc/task_mmu.c                     |   2 +-
 include/linux/hmm.h                    | 302 ++---------------
 include/linux/ioport.h                 |   3 +-
 include/linux/memremap.h               |  75 +++--
 include/linux/mm.h                     |  28 +-
 include/linux/mm_types.h               |   4 +-
 include/linux/swapops.h                |  15 -
 kernel/fork.c                          |   1 -
 kernel/memremap.c                      | 194 ++++++-----
 kernel/resource.c                      |  39 +++
 mm/Kconfig                             |  50 +--
 mm/Makefile                            |   2 +-
 mm/gup.c                               |   7 -
 mm/hmm.c                               | 587 ++++++++-------------------------
 mm/madvise.c                           |   2 +-
 mm/memcontrol.c                        |  13 +-
 mm/memory-failure.c                    |   6 +-
 mm/memory.c                            |  49 +--
 mm/memory_hotplug.c                    |   6 +-
 mm/mempolicy.c                         |   1 +
 mm/migrate.c                           |  28 +-
 mm/page_alloc.c                        |  13 +-
 mm/swap.c                              |  13 +-
 tools/testing/nvdimm/test/iomap.c      |  57 +++-
 36 files changed, 619 insertions(+), 1326 deletions(-)
(diffstat from tag for-linus-hmm-merged)

--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEfB7FMLh+8QxL+6i3OG33FX4gmxoFAl0k6d0ACgkQOG33FX4g
mxq20Q/8DrfL9SYcFLlYTVetA9I3X6v8TP1MrW6YiswZlosJUP5m4PXf8Xo74YVG
HvqUrn2zYJn1LV9Fm/vabkJRv9edOXCsaMrahYumaRzn4GOMSa5bYe4cOcqnOB6U
d0aHEb67Y2aq3QKiwmT5m69jEc7T4217pM79t/zWpAm5/QPlCfqYNsMbOF9ocqDi
mw9IZBTNEe4blIPzupS4o3TZBT+8zCGSJ+mduzZZ34r+lAOSFaCrjihzAxalN1+3
tMuh4D8m8JAmB/EaozXeihvpRj2RN45ySsDT3njf9Qcgx7zbVpw1CPHgFC13gQau
nPHv1IpIMTD9WyzsB7m5s7Tx/rT0U3Ux7/6CALYh0WNE3aSBu6kscPqiSf1tj8C1
sN7iaGsQow2ZQnuszmPFhJPzo0aV8x1TD59AaoA9ezBy2OQf9RDbabv9ho/SD8Sy
G0mh//KIcWkdiPJhnZq9OOEH8k6b6IRuQM0XCjWq821TFGx+aRtVwaw5qwanFmY8
wQOlFyLxv13CZkN6YMfiuZ7DMVHnfcDJfyR6UMHUkPkOXRbCccZyPuA2pP0AB6nO
Gzsc8032R5NuceC87tGY4ViktvV0s4W6ofTrxxAutYtSv2/Imbe6PWvzaTI8UJC3
33Gqnn26RFr5wTbehg3TMFqmfy1zCpyY01WG56fBeASfvqKaR9w=
=njDZ
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--

--===============1781057267==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1781057267==--
