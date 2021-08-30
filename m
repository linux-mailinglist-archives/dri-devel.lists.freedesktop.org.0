Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B394B3FB765
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 15:57:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB4889DE5;
	Mon, 30 Aug 2021 13:57:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062.outbound.protection.outlook.com [40.107.220.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE5B899DB;
 Mon, 30 Aug 2021 13:42:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I5Q6P1tFlCzPDbTUir3pYjza9rrbZLKAuGB86lqVkyfO/zpe3AiEA/Zl+7w6rY+IU/iMlIZ4ka1YfLktrU0XBpWN/LtqvGQRNIIeZqbmJcR2sAJ+Z+vMyHHgHfLHY99F2hLu/8w/kpmJ04BrdWvmamh+hTTc2RgHzYumB8wDgDaeUssbZcokddyt+U+FrbPQeNrAzKCRQen5yhF5ZPMFElyD27teIwv/hd+xwVoWfbV37ogHTPzxKxmMJ7hhmlfy+zVCG6d+irl8BD1+GqXlgrIjsYqfK3tirnyq+HdNd+MBOpSEkp59QNbFS5aDSSgZ5w+0EwJp5ciBo+LJjNvzOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/uI2iglYo9hfiFsukV5OEHNcECJN1a+C92jrYW2CRI=;
 b=PiRTd/+EkpqcyYpvBCocwdrD2PZ/8WC4CZD5L4uI5DYviZEy/r5U94zdRE37k1nIwZkNa1+BKhtoF9gNjtqkTUPD+TVOddbU+zRP5HFkbcOc3v0T1gmPYjE8G0vUbgp8/o0AaLAXvs3RJOYqB5TAXSAdnZFx70rMiOyfxP/zAhkm5JGBWVwhLx4mHc+J8cwdfRUW2Ttw+VF/bamM0YplvEq2ERJBntyuh+W3EjR13xMRbwYL1Z96bJaFpiXAY31ZkAVOb7rXcZlGLFaCEZyGuUHBvebFhfs7TRysp6xs0U4QtP35MKKycctiqxNZMfi4oBP7s443GOEDY64X6JPlIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=linux.ie smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/uI2iglYo9hfiFsukV5OEHNcECJN1a+C92jrYW2CRI=;
 b=Pnp9Gtz6Y23y1dizrRX/rLlnZiHWquA/4GXt29ebk2wdQta3zOE0FH/iBop7a7V0NB8GNDloDu8V4atjKVfHOKiE6CcLOgoIjE4tQRUsO6dQZZg0agfWNdaow+eJuJ9UQLtrUOgzfyfz9C46WfjEXNQaqEoK9LrEz7XOXqp7gNbIqBpmPdBTLrpKZYNnH+ANnqz1nqrRM+MYIg2S331qmoKhLOPOOup/bXk9gvGY6oFfmZU1bv96DsDghlHiXXsyt41M5FBMwti9SI82CyPv1VeLXImXcr2eEp+PgUzCvoGGNceyCyqcmchulku0e2VGwBvcGs7a7YBzxv1MtewScQ==
Received: from BN0PR04CA0139.namprd04.prod.outlook.com (2603:10b6:408:ed::24)
 by DM4PR12MB5374.namprd12.prod.outlook.com (2603:10b6:5:39a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.24; Mon, 30 Aug
 2021 13:42:53 +0000
Received: from BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ed:cafe::cc) by BN0PR04CA0139.outlook.office365.com
 (2603:10b6:408:ed::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18 via Frontend
 Transport; Mon, 30 Aug 2021 13:42:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT032.mail.protection.outlook.com (10.13.177.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4457.17 via Frontend Transport; Mon, 30 Aug 2021 13:42:52 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 30 Aug
 2021 13:42:52 +0000
Received: from localhost (172.20.187.6) by DRHQMAIL107.nvidia.com (10.27.9.16)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 30 Aug 2021 13:42:50 +0000
Date: Mon, 30 Aug 2021 16:42:39 +0300
From: Leon Romanovsky <leonro@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: Maor Gottlieb <maorg@nvidia.com>, <dledford@redhat.com>,
 <hch@infradead.org>, <aelior@marvell.com>, <daniel@ffwll.ch>,
 <airlied@linux.ie>, <dennis.dalessandro@cornelisnetworks.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <linux-kernel@vger.kernel.org>, <linux-rdma@vger.kernel.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <mkalderon@marvell.com>, <mike.marciniszyn@cornelisnetworks.com>,
 <mustafa.ismail@intel.com>, <rodrigo.vivi@intel.com>, <sroland@vmware.com>,
 <shiraz.saleem@intel.com>, <tzimmermann@suse.de>,
 <linux-graphics-maintainer@vmware.com>, <liweihang@huawei.com>,
 <liangwenpeng@huawei.com>, <yishaih@nvidia.com>, <zackr@vmware.com>,
 <zyjzyj2000@gmail.com>
Subject: Re: [PATCH rdma-next v4 0/3] SG fix together with update to RDMA umem
Message-ID: <YSzgT6qTYRIkcMgD@unreal>
References: <20210824142531.3877007-1-maorg@nvidia.com>
 <YSyU7JLIlonJzRhe@unreal> <20210830133128.GY1721383@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210830133128.GY1721383@nvidia.com>
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92929b1b-3014-4e24-d8aa-08d96bbc10b7
X-MS-TrafficTypeDiagnostic: DM4PR12MB5374:
X-Microsoft-Antispam-PRVS: <DM4PR12MB537471DDE3EE851935434EECBDCB9@DM4PR12MB5374.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vEsU716/hDruTgXfM4Z+m3qcptGaDF7neRG6R/RbMmifbUIs6fzw9wiFqeBWgeJBVSl5lQEwn9scI4ekV97GYmBAxMZW4U0GSvMoCdeJhxgs04ZHyWLPupOeroB3SZ34Bk+nwEHYC/NRnD8gGCiD1a4qKHlKjo2dK6MrnG/0nfMghNobfNlLSjhR10NENKpVt/I4VO6455+Y54pEhsStdK5SlXp5DYJ3qx3PxkyMB5pIYGSdL6xtcE+ow0MDZTHkheWHw0bSa5Oj3LVRCeIGp37yks/6CBaNTQJOF59m9wLs1EJk60+EnbcpGhU3N1ofdBKyoNtaIMOc36fIdtXNr3xba0WnIvIdvN7A5XZJoIgToGgg0DpVhgPt00K6Xor/ZsSgZVfsQM3VmmE6pcmsTORA+DhN31jKP/rlqeQcPe0XHNsNWKtLJN4lJWnK1zW9ui544RKufV26N3r8K8xsVWquehdgEXxXnoJ1xxYlhi40zwBW0swkGNORoAcyGfN9C4/qLcyzqINtcQPn7Lu4r1yTpasMqP3UlBFNkXH8sOX3qS+g1QpBB9mDVyK2tyb+z0iZNQQ0l4as06uVgs+aePFtiTZ4F7ucl5bELVrmPR6HaVinPRY+RYZoPdxhjj3DMnEWRGr77KVf8xTvgl/fvNU+JbhBEUF04gpIeH2+HLSEloRQVuW8g83l3bZMku9c1UtKAVj6BBA8l1DJ+YiFi0nIqvRZasircOlmfXqqANJPzFjDW2MV7O6mPJHO5FySL5/F7YWlOoS03lfs+hrMcR0aOq62hGoIOnGIQSgSPhrKl22Zrcrg7J0Ldp4en5bzWmmjIN3vxbLO9NEmUlubMg==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(7916004)(4636009)(39860400002)(396003)(376002)(346002)(136003)(36840700001)(46966006)(70206006)(70586007)(36860700001)(9686003)(966005)(47076005)(6666004)(5660300002)(426003)(356005)(36906005)(8676002)(8936002)(316002)(54906003)(83380400001)(33716001)(7636003)(7416002)(82310400003)(86362001)(82740400003)(2906002)(15650500001)(6636002)(478600001)(336012)(6862004)(4326008)(26005)(186003)(16526019);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 13:42:52.6574 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92929b1b-3014-4e24-d8aa-08d96bbc10b7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5374
X-Mailman-Approved-At: Mon, 30 Aug 2021 13:57:05 +0000
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

On Mon, Aug 30, 2021 at 10:31:28AM -0300, Jason Gunthorpe wrote:
> On Mon, Aug 30, 2021 at 11:21:00AM +0300, Leon Romanovsky wrote:
> > On Tue, Aug 24, 2021 at 05:25:28PM +0300, Maor Gottlieb wrote:
> > > From: Maor Gottlieb <maorg@nvidia.com>
> > > 
> > > Changelog:
> > > v4:
> > >  * Unify sg_free_table_entries with __sg_free_table
> > > v3: https://lore.kernel.org/lkml/cover.1627551226.git.leonro@nvidia.com/
> > >  * Rewrote to new API suggestion
> > >  * Split for more patches
> > > v2: https://lore.kernel.org/lkml/cover.1626605893.git.leonro@nvidia.com
> > >  * Changed implementation of first patch, based on our discussion with
> > >  * Christoph.
> > >    https://lore.kernel.org/lkml/YNwaVTT0qmQdxaZz@infradead.org/
> > > v1: https://lore.kernel.org/lkml/cover.1624955710.git.leonro@nvidia.com/
> > >  * Fixed sg_page with a _dma_ API in the umem.c
> > > v0: https://lore.kernel.org/lkml/cover.1624361199.git.leonro@nvidia.com
> > > 
> > > Maor Gottlieb (3):
> > >   lib/scatterlist: Provide a dedicated function to support table append
> > >   lib/scatterlist: Fix wrong update of orig_nents
> > >   RDMA: Use the sg_table directly and remove the opencoded version from
> > >     umem
> > > 
> > >  drivers/gpu/drm/drm_prime.c                 |  13 +-
> > >  drivers/gpu/drm/i915/gem/i915_gem_userptr.c |  11 +-
> > >  drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c  |  14 +-
> > >  drivers/infiniband/core/umem.c              |  56 ++++---
> > >  drivers/infiniband/core/umem_dmabuf.c       |   5 +-
> > >  drivers/infiniband/hw/hns/hns_roce_db.c     |   4 +-
> > >  drivers/infiniband/hw/irdma/verbs.c         |   2 +-
> > >  drivers/infiniband/hw/mlx4/doorbell.c       |   3 +-
> > >  drivers/infiniband/hw/mlx4/mr.c             |   4 +-
> > >  drivers/infiniband/hw/mlx5/doorbell.c       |   3 +-
> > >  drivers/infiniband/hw/mlx5/mr.c             |   3 +-
> > >  drivers/infiniband/hw/qedr/verbs.c          |   2 +-
> > >  drivers/infiniband/sw/rdmavt/mr.c           |   2 +-
> > >  drivers/infiniband/sw/rxe/rxe_mr.c          |   2 +-
> > >  include/linux/scatterlist.h                 |  56 +++++--
> > >  include/rdma/ib_umem.h                      |  11 +-
> > >  include/rdma/ib_verbs.h                     |  28 ++++
> > >  lib/scatterlist.c                           | 155 ++++++++++++--------
> > >  lib/sg_pool.c                               |   3 +-
> > >  tools/testing/scatterlist/main.c            |  38 +++--
> > >  20 files changed, 258 insertions(+), 157 deletions(-)
> > 
> > Jason,
> > 
> > Did you add these patches to the -next? I can't find them.
> 
> They sat in linux-next for awhile outside the rdma-next tree
> 
> All synced up now

Thanks

> 
> Jason
