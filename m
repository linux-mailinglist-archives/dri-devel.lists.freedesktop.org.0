Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC6F826801
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 07:32:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A021B10E172;
	Mon,  8 Jan 2024 06:32:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42C0110E172
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 06:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704695545; x=1736231545;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=knIVwYUdH/U3EoUDFUOg4cooiZ3qNyc5t39UFY0WNHQ=;
 b=gg6IyFLVQxcB3ViKpX/1zuNvbm1+SXehBm/9PPA3i9F+JQXRasdQ+z1f
 ve9uooxEZcN58nMiYSLI8XBycWWzWUTglFnJ8VjvTBoNCPFWXx78J6wIt
 gauRe+Z1hS1wRaR1A7bPQtHaaRpZnkeDfq/wJYjDZZDT8mQsNu6GBfYdX
 40E11MgNOAhX3s8FOZlqs7kfEQJjuJ2nYApU3ruWUja7m7FbnfEvUU863
 fELg03OrFgaLYiFteyG/cx1CAyjuICWl+0uF3/ZQVIV/mZobvH2XItjCc
 KdVzzpPxTdkQqfT7mndFqliH5AcHONWwsJgjuNFjXkl80UsHBcrwPSnGO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="16403057"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; d="scan'208";a="16403057"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2024 22:32:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="900281426"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; d="scan'208";a="900281426"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jan 2024 22:32:24 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 7 Jan 2024 22:32:23 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 7 Jan 2024 22:32:23 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 7 Jan 2024 22:32:23 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 7 Jan 2024 22:32:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FjRi1z4TaVT1vIFUacFymPKEMTgt4jw/smCS1ogbee9nytsa8HhkBt5Nw8RvmH+W/rdp/mIWV3FdjEx2aFEmGKQD4wJyQQVji3H3N7c6kDhXOQloyVDPYAqwmvKQWNFZH0yzcOaGHXYDqfjXre7KKQo79wI46hhIxL/KHzx0KRfdH8u49nYUlKjtHRjZHhm0zlG+2lauLIZFBAAwuzukz6KZUV6D42NhU56qpLCQ7kPCXqgT3aXIcHnWTqLlUBMJy7gmVMrr5YN32dnDzjatkeUGQ1q9BYSNd+Gtibwcx7M3QlpP4oEN61VvGVbS4PM9igBE7Uxr8qGQkwkQZ0XvYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uggCuDlteYTBuOQMfFX9g5AY5oqzo5DL/3OjUDRCKdw=;
 b=hFd5pycsDS93+8yhkX4yWdz4WNPzRV6o+nkaEDGwZk2l/KHy3n4UCSocXfgXq4/7JK0cRBCqIwZuv6BPXNE/NMrbTg8tUlDHZHojtDOHkdzfEOYPFmibFXC7nmEbQ85KSvHu0xUWbdLFNwWECS4s7XwrtexBvrZ6nwlMnprFId0IjAd8CNELmiGSiTiVbO1xM8zQF407v+szQc4IHmLTQpbztMYL/T0hf38sG+5rWj6FqyTVZnb8JPihfViU+mXp4/rKI5S2t0dxT+X3/tHGBX9Wr5QVpmRdqeKw5R1cuv9HMQZHb7d5RbQs6kKp0laN5x9b/sDR+hEpNzAQpqq1HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) by
 PH0PR11MB5207.namprd11.prod.outlook.com (2603:10b6:510:32::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7159.21; Mon, 8 Jan 2024 06:32:21 +0000
Received: from DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::32a9:54b8:4253:31d4]) by DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::32a9:54b8:4253:31d4%4]) with mapi id 15.20.7159.020; Mon, 8 Jan 2024
 06:32:20 +0000
Date: Mon, 8 Jan 2024 14:02:57 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 0/4] KVM: Honor guest memory types for virtio GPU devices
Message-ID: <ZZuQEQAVX28v7p9Z@yzhao56-desk.sh.intel.com>
References: <20240105091237.24577-1-yan.y.zhao@intel.com>
 <20240105195551.GE50406@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240105195551.GE50406@nvidia.com>
X-ClientProxiedBy: SG2PR04CA0198.apcprd04.prod.outlook.com
 (2603:1096:4:14::36) To DS7PR11MB5966.namprd11.prod.outlook.com
 (2603:10b6:8:71::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5966:EE_|PH0PR11MB5207:EE_
X-MS-Office365-Filtering-Correlation-Id: 671385a7-fa70-4fd6-c9ba-08dc10139142
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aS5kg4431Tvl2oYtJIooEbJMQ/TqhrW9lhkzjc+fMQUieD3luoveviRZ9ZsQJ52adaZio5j4BGAW5TgsOg40w+z6CikfXVd8Lhz3oeDnJnOO9kbvuA6cT0bpptQPqi7vHwf6QEvEXfQOCY/UFXvdQumrkCldFzrCADzDkEuQwxbGCyERLV5B6S/iatPKepnRjqJ/MP+wjoOqX7Qa7MPyDJOkuir1g72lWBEYJxS5x924bFd0i9lyjiVDZcYqm80q4YOFIwPJN4JM/5YfyGd9iIcWK996KuZ0vQECP0dKtT3LhHPHzUX+unacazcdhqpQN2y2yX3jCZOujHPvTifLptXJ4KKAFehVT2HX8lrqqI3qnk+HHP+80H6n7SlMH6bRZKLbOTGOsK8NRrGjdwK1Uvd9Pm2Zk1mbKWGYty5uwVtz0vNv+/8tzGYXQB5TeUJ11I1+gzx57zx2vfEcOYIM8dhaOmbe4wFOElikhrU9PBZG102gQoybjqhW6mzteiWt41f4Vwn8TyDJl934GZlhzGrht0yFbrBY2JarAtQ64lL48lc1CKgV9SorxFdyfe+m
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5966.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(346002)(39860400002)(396003)(376002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(6486002)(26005)(478600001)(6506007)(6512007)(6666004)(83380400001)(5660300002)(2906002)(7416002)(41300700001)(66476007)(66556008)(66946007)(6916009)(316002)(54906003)(8936002)(8676002)(4326008)(3450700001)(38100700002)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p6jM7Na2Ia0Q850VhWTEgtg8tLR/cUAw95a/g+R8wa9d0RYrWK1ud2XNAdOS?=
 =?us-ascii?Q?stc5WBVmZcNHptxTEgwJPMoFGzOh9Baob6XNZr9ioHt7NgqDtY3ivksfE6VJ?=
 =?us-ascii?Q?G/RCmWwtey6n1F9zIMPGBjKBFClOskBMTBOr0RKQWYmajHk6oO8IOtPTA/tL?=
 =?us-ascii?Q?5HeCYfR5nItFwCsoer11QIm+Kfef9wWHDSzMTX/QGejnril6m3enQROX9AHX?=
 =?us-ascii?Q?nCFFaY5v1fyh+qcZqz+TZuYA7hbfhWOIv++BHAJZc/kCQF3dlpxWN6R5pjMc?=
 =?us-ascii?Q?cTGZwtuNyXs8O3mm0OpbgnPVmQ/Na3PZvbMC3kTdwLSmef25Zv2gt/luqz3k?=
 =?us-ascii?Q?G8rpZs1Vy+/V4c0lMu675SctwTUYxaI6Im9SZgAdNZpFxO3mOu6MDtrIm3We?=
 =?us-ascii?Q?K9IobQZHYf692xfRffF/PSpzuRpVZbo4QgEC9JY6n+rAfuo/pfuJvcwkFdT4?=
 =?us-ascii?Q?4gQ1bMZ/b7FxkuZ37qRUsmAGmbCqIxUv3xAsl08Sn5z1tuXKWZ7ZlylqY7xH?=
 =?us-ascii?Q?PBHj0IEAuykx+3FO8KFlOMND+rQU0ej+68prePrzUrx4aeTceh5rUaN0Y91A?=
 =?us-ascii?Q?LDahhlC3qdU3BLDgAhil8AvJMr1Rst3Q+M7LNW6TxHRhEu6JNmU4nqnbBext?=
 =?us-ascii?Q?MuxrPLsgvt7N9xgFVYhYlh1jUDIgHwn9sHmsagMv9sdfLvyUUacuLrt4B31V?=
 =?us-ascii?Q?CNg6gS8dSHxxOP2SBfqpHTqcoc3gNlJ6GTi5T/RGLvqJPgdxb151GQS4k1jV?=
 =?us-ascii?Q?M36PpAgrdVF0mxDjgnS5pHKtRgANoJWZObYtyOLR79fO7cUTL24Pmxogo/Tg?=
 =?us-ascii?Q?urt3xt07sfOomwmtvbWnPx36U93ItqPZX2QoO/tvYYGTcRfwSPHr2EPnvdcj?=
 =?us-ascii?Q?Oeo3pn+trlaDvLMd2HhdUe35vxSeFl2mMu+o8AvWkzeqNpQhsb0rpErPXsS2?=
 =?us-ascii?Q?+o3whNHMaLtNWFQvJMojEA6k96aIBe01snYG1ObH5Lzp4qI0iGzwObaYINVn?=
 =?us-ascii?Q?FkdamQ6+utGUwXuZ9NABRQJNEWif7vwFntoZPdL1zMpQDg/B/03ztKTRwwVu?=
 =?us-ascii?Q?NQcPBVWg4E9N927sh1ICsJBzd6zncZAxQe7P2hx1PFyddwAl/Xds8RGrzulY?=
 =?us-ascii?Q?mSA78UEB2pKhNIAOFWZdM6HNFAroV+J5taXnxkfbXvEpQubwmz9MDMHIjFR2?=
 =?us-ascii?Q?6DOs9ONDbO7BjdA1pjQB+/ac+cYtaSTZ3q7GgNip+XSupjN372voNybdkjc7?=
 =?us-ascii?Q?2vUg8lEAAuFf1rET0recWNxz96Jn/d3lOsnGWAWqVn+Wl2tpKfOl29zpOitT?=
 =?us-ascii?Q?6eE9AXFSPw6cKSBIKOCKiKFUrJ5SXTUzohVTUzQmEMS3GALDvFyIvkkbK9R4?=
 =?us-ascii?Q?XndIOct4DngzxGJiLaSaKAUR4QmiGUYHxtoO38P5l0TPqvNuG1J166E3fsUg?=
 =?us-ascii?Q?j+BiZ3s1ibI/cv5bBURlGpc0fqz33M7Y6Rw2L7KdoLjOz32AoPTrRLhTyKYm?=
 =?us-ascii?Q?Uu5/KPJf9WJUMrHvKhaQOXH0jmbw1hpdnkGoSTC97JzV4/Li9mO+8uXgGein?=
 =?us-ascii?Q?f9AZ9Ue5y91oXgSvrjIiKh2NDoktyEpaotRU4/Iy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 671385a7-fa70-4fd6-c9ba-08dc10139142
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5966.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2024 06:32:20.8793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NdgQyTOl8TrdsYL7+2eu5y0Zi/o1bWMS5V40k7b14jDLuLzhg89LWHT1AM88EY5RfJdt133LIr4bE9jL7TF29g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5207
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
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
Cc: wanpengli@tencent.com, kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kraxel@redhat.com, maz@kernel.org,
 joro@8bytes.org, zzyiwei@google.com, yuzenghui@huawei.com,
 kevin.tian@intel.com, suzuki.poulose@arm.com, alex.williamson@redhat.com,
 yongwei.ma@intel.com, zhiyuan.lv@intel.com, gurchetansingh@chromium.org,
 jmattson@google.com, zhenyu.z.wang@intel.com, seanjc@google.com,
 ankita@nvidia.com, oliver.upton@linux.dev, james.morse@arm.com,
 pbonzini@redhat.com, vkuznets@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 05, 2024 at 03:55:51PM -0400, Jason Gunthorpe wrote:
> On Fri, Jan 05, 2024 at 05:12:37PM +0800, Yan Zhao wrote:
> > This series allow user space to notify KVM of noncoherent DMA status so as
> > to let KVM honor guest memory types in specified memory slot ranges.
> > 
> > Motivation
> > ===
> > A virtio GPU device may want to configure GPU hardware to work in
> > noncoherent mode, i.e. some of its DMAs do not snoop CPU caches.
> 
> Does this mean some DMA reads do not snoop the caches or does it
> include DMA writes not synchronizing the caches too?
Both DMA reads and writes are not snooped.
The virtio host side will mmap the buffer to WC (pgprot_writecombine)
for CPU access and program the device to access the buffer in uncached
way.
Meanwhile, virtio host side will construct a memslot in KVM with the PTR
returned from the mmap, and notify virtio guest side to mmap the same buffer in
guest page table with PAT=WC, too.

> 
> > This is generally for performance consideration.
> > In certain platform, GFX performance can improve 20+% with DMAs going to
> > noncoherent path.
> > 
> > This noncoherent DMA mode works in below sequence:
> > 1. Host backend driver programs hardware not to snoop memory of target
> >    DMA buffer.
> > 2. Host backend driver indicates guest frontend driver to program guest PAT
> >    to WC for target DMA buffer.
> > 3. Guest frontend driver writes to the DMA buffer without clflush stuffs.
> > 4. Hardware does noncoherent DMA to the target buffer.
> > 
> > In this noncoherent DMA mode, both guest and hardware regard a DMA buffer
> > as not cached. So, if KVM forces the effective memory type of this DMA
> > buffer to be WB, hardware DMA may read incorrect data and cause misc
> > failures.
> 
> I don't know all the details, but a big concern would be that the
> caches remain fully coherent with the underlying memory at any point
> where kvm decides to revoke the page from the VM.
Ah, you mean, for page migration, the content of the page may not be copied
correctly, right?

Currently in x86, we have 2 ways to let KVM honor guest memory types:
1. through KVM memslot flag introduced in this series, for virtio GPUs, in
   memslot granularity.
2. through increasing noncoherent dma count, as what's done in VFIO, for
   Intel GPU passthrough, for all guest memory.

This page migration issue should not be the case for virtio GPU, as both host
and guest are synced to use the same memory type and actually the pages
are not anonymous pages.
For GPU pass-through, though host mmaps with WB, it's still fine for guest to
use WC because page migration on pages of VMs with pass-through device is not
allowed.

But I agree, this should be a case if user space sets the memslot flag to honor
guest memory type to memslots for guest system RAM where non-enlightened guest
components may cause guest and host to access with different memory types.
Or simply when the guest is a malicious one.

> If you allow an incoherence of cache != physical then it opens a
> security attack where the observed content of memory can change when
> it should not.

In this case, will this security attack impact other guests?

> 
> ARM64 has issues like this and due to that ARM has to have explict,
> expensive, cache flushing at certain points.
>



