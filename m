Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF5130FCDB
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 20:34:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C9D6E48F;
	Thu,  4 Feb 2021 19:34:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D6456EE2E
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 18:29:39 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B601c3d110001>; Thu, 04 Feb 2021 10:29:37 -0800
Received: from HKMAIL103.nvidia.com (10.18.16.12) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Feb
 2021 18:29:37 +0000
Received: from HKMAIL103.nvidia.com (10.18.16.12) by HKMAIL103.nvidia.com
 (10.18.16.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Feb
 2021 18:29:28 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by HKMAIL103.nvidia.com (10.18.16.12) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Thu, 4 Feb 2021 18:29:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XIGIAgbSLfhIQRZTG1xJmx0Sa4L/INh8SxvojUDOTdy5VnDUm2YNwXsMqU0kqjTdHwczohcAWGmqizlWxbXxrVOsNM+uKrBJRqJU0vPHk1YPiyiUxx/ln2gizkAynptpq5ooUWcvc99jdc0sxs6klNK7VmFoH/vPkuiVicmSQ3XwjbOEzhp6Tp05ITD7FPYFkvLNaw20r+QjwFrTlaCt9LpefHkkAfdoCTkIl6kK3+jDfNudOEOqKdzsvNn0BmbNdkrWCyQAGQnhuDLvnwHVr1Wb4k4no9BgIE1+cHzMvF2g4n8dmGOdFqo4ysV+RwY77hPp/unxq+h9dxHpRKWLmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+cZcUkOrwkLnxcAP9Nz/ErpUe7Fr0zvEU0lngQWQMp4=;
 b=j4DtkByOSYGJXjCg/ny17EQAfzhA7AjxsOknQzeZXfMvg3kRmN1NHzOB1jox2TUQb/NbYEdWjYZOIr/L355cpHZxW5u6v1iRm35sivfXxjauQssGY3VEt46vjiqyTfV3hDRntSeVe6pW/c57l+TI7FBgFXSwVVZ5TSZ3Se3pNcWoZCURCTpVMcNC898RogvIBJFj+jGt+1fdHgL+wzm2b4ou7AKu0vpCcjXmhWYcK+WTvZ6tgQhB2A20827/Tcg5mT0Obh+YEwI73kv1JJckcHqnvya2zcvGuESqUmgg1gm+k1OQ8dNFw4Fw8P6iuvVBW9ifp2WueYy3kRVAH3fOzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB3402.namprd12.prod.outlook.com (2603:10b6:5:3b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17; Thu, 4 Feb
 2021 18:29:25 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::d6b:736:fa28:5e4]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::d6b:736:fa28:5e4%7]) with mapi id 15.20.3805.033; Thu, 4 Feb 2021
 18:29:25 +0000
Date: Thu, 4 Feb 2021 14:29:23 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH v16 0/4] RDMA: Add dma-buf support
Message-ID: <20210204182923.GL4247@nvidia.com>
References: <1608067636-98073-1-git-send-email-jianxin.xiong@intel.com>
 <5e4ac17d-1654-9abc-9a14-bda223d62866@nvidia.com>
 <CADnq5_M2YuOv16E2DG6sCPtL=z5SDDrN+y7iwD_pHVc7Omyrmw@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CADnq5_M2YuOv16E2DG6sCPtL=z5SDDrN+y7iwD_pHVc7Omyrmw@mail.gmail.com>
X-ClientProxiedBy: MN2PR18CA0029.namprd18.prod.outlook.com
 (2603:10b6:208:23c::34) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.115.133) by
 MN2PR18CA0029.namprd18.prod.outlook.com (2603:10b6:208:23c::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19 via Frontend
 Transport; Thu, 4 Feb 2021 18:29:24 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1l7jNb-003XfL-Jl; Thu, 04 Feb 2021 14:29:23 -0400
X-Header: ProcessedBy-CMR-outbound
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1612463377; bh=+cZcUkOrwkLnxcAP9Nz/ErpUe7Fr0zvEU0lngQWQMp4=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
 From:To:CC:Subject:Message-ID:References:Content-Type:
 Content-Disposition:In-Reply-To:X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType:X-Header;
 b=KI5m6Lz5QvaOQZaht8Nt8EjSccBoij3b1m5oJ3/jArsFx4r2bbns/hB3uggGvyrmP
 pWnjbmavcbwmfUn4qdiQ0WDRKENsr5zRHpGQ9T98HAxiizsvizGxWFLfiKc8vSMsoS
 f2fzsJqzNeupgejly/8eSmRXQGGgI+E/6NJm9Q5VkRQtZl8bWoIAjjvMCYU3Q2nKl8
 BCpjkC/1FAc09OSHw7bUSjmeoDxNhHd9rKvVJJ9HeDIUvAyhu+vHYV4r+peT9KJ7fH
 xQ+VcuyqRuf/dtfPizX7pEEYFC4WPNId3tl/u0MG9rdlRRmmJEPc/J/68di1LESndb
 7sPVUyjhV5p2Q==
X-Mailman-Approved-At: Thu, 04 Feb 2021 19:34:32 +0000
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
Cc: Leon Romanovsky <leon@kernel.org>, linux-rdma <linux-rdma@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, Maling
 list - DRI developers <dri-devel@lists.freedesktop.org>,
 Doug Ledford <dledford@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 04, 2021 at 08:50:38AM -0500, Alex Deucher wrote:
> On Thu, Feb 4, 2021 at 2:48 AM John Hubbard <jhubbard@nvidia.com> wrote:
> >
> > On 12/15/20 1:27 PM, Jianxin Xiong wrote:
> > > This patch series adds dma-buf importer role to the RDMA driver in
> > > attempt to support RDMA using device memory such as GPU VRAM. Dma-buf is
> > > chosen for a few reasons: first, the API is relatively simple and allows
> > > a lot of flexibility in implementing the buffer manipulation ops.
> > > Second, it doesn't require page structure. Third, dma-buf is already
> > > supported in many GPU drivers. However, we are aware that existing GPU
> > > drivers don't allow pinning device memory via the dma-buf interface.
> > > Pinning would simply cause the backing storage to migrate to system RAM.
> > > True peer-to-peer access is only possible using dynamic attach, which
> > > requires on-demand paging support from the NIC to work. For this reason,
> > > this series only works with ODP capable NICs.
> >
> > Hi,
> >
> > Looking ahead to after this patchset is merged...
> >
> > Are there design thoughts out there, about the future of pinning to vidmem,
> > for this? It would allow a huge group of older GPUs and NICs and such to
> > do p2p with this approach, and it seems like a natural next step, right?
> 
> The argument is that vram is a scarce resource, but I don't know if
> that is really the case these days.  At this point, we often have as
> much vram as system ram if not more.

I thought the main argument was that GPU memory could move at any time
between the GPU and CPU and the DMA buf would always track its current
location?

IMHO there is no reason not to have a special API to create small
amounts of GPU dedicated locked memory that cannot be moved off the
GPU.

For instance this paper:

http://www.ziti.uni-heidelberg.de/ziti/uploads/ce_group/2014-ASHESIPDPS.pdf

Considers using the GPU to directly drive the RDMA work
queues. Putting the queues themselves in GPU VRAM would make alot of
sense.

But that is impossible without fixed non-invalidating dma bufs.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
