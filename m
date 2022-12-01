Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CF263E66B
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 01:23:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5539910E515;
	Thu,  1 Dec 2022 00:23:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 417AC10E515
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 00:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669854185; x=1701390185;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iEkOHEbr77fs4qG2JtmBDNq+1OcgYM6sCMIug0oY6Cs=;
 b=ch8+6Pan6NToqLhTtikdHItshhcdaU93XpZ8z8pQvSOms3KItbRWfJqv
 4F2DyjrXflnB7ZsB/9I5j+tEiNTSYd0LD7ujMcfTbpvP+oLsoGb9tBM4j
 DgXbyJtGmzwfVn0VuvO0pFGkw2rvTSgPEanfIELPito+BTNpG7RdYl1wE
 qKKh584A7K+dznby09x4PAX9N2qTOUByhNT3dsjPqD1Zz64mLQE7oLJcN
 VVEHu82Az5sKIMAFd+0darEU/5GE2nTSb46P6J3BJ+iadxOBukNArUGTe
 zNmU9EQ4D3etijPwYbMoOA8fN7wp9yp0yBBGTrEAJ9DlWxEQ+Kq47L+CG g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="315567261"
X-IronPort-AV: E=Sophos;i="5.96,207,1665471600"; d="scan'208";a="315567261"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2022 16:23:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="786674148"
X-IronPort-AV: E=Sophos;i="5.96,207,1665471600"; d="scan'208";a="786674148"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 30 Nov 2022 16:23:03 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 30 Nov 2022 16:23:03 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 30 Nov 2022 16:23:02 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 30 Nov 2022 16:23:02 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 30 Nov 2022 16:23:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hO+4bz5PSRLfI25+QVlUL5xD7QvFbegigcdEchHJ4XjbkW0hqzige2zbc4oYe5DM71Y00w3BRBrkjo/KS12PQDBUNmqkIqcSuHSxEE882Qsls5rHAArGUumJsidYxuxgcT8+By/natbr8ItLCbc3CEBBzhcNcmHQUeXKoX5sCAhNeiB0KjUBlq1QGLzCIfcWJGf+dKxvm6JVppWLNzw4G5jyMmqKfvbH8xV1AM7CqO5ebqU+6HCtvmIDl0yTp7PcHqdWs8v4bMk++6LkpqEBdKLk0hOYtjWTZjTZP45kq0nqPe900quQzUsYdhSJsXvaJrQFJtHNW/2TU04ro4F9aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U0CDZJFtp0zmLitOTvQO57oPdwfOIJ/miMDOKxlns9U=;
 b=CHCYOXMrAEF3jsftaqojlQU0gY4w5PwTMtZblJ9wlu97DAQNyGXapV9Lq9KRpoPi2PLIUpXIU6aWcf5hYhRQlld1hmnq6Bs2OR2FyOIpE+Nt4sxxSUhWy6NZhy3UU3hPea/4jmW3zUXAVCh7kqLYN94d9iwCRd6AhA//6tw7axmnZ1U2zyo7vIElnFvltmWA68mdN3sz9vqnw9lZgJ1c3BVQ2aDAHF9mXOqdkY51PNqUvC3093ndm6qRuh+G4VC5Y6MxhJisC/URPcvRzHQXOD0MidBgReDYZFQnTQ9TDeLlLyHECshJwTE132GMjDmhtOt7BZIHytxecaN+uyzPeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2126.namprd11.prod.outlook.com
 (2603:10b6:301:50::20) by MW5PR11MB5810.namprd11.prod.outlook.com
 (2603:10b6:303:192::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Thu, 1 Dec
 2022 00:22:56 +0000
Received: from MWHPR1101MB2126.namprd11.prod.outlook.com
 ([fe80::340d:cb77:604d:b0b]) by MWHPR1101MB2126.namprd11.prod.outlook.com
 ([fe80::340d:cb77:604d:b0b%9]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 00:22:55 +0000
Date: Wed, 30 Nov 2022 16:22:50 -0800
From: Dan Williams <dan.j.williams@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH] mm/memremap: Introduce pgmap_request_folio() using pgmap
 offsets
Message-ID: <6387f3dabd16e_c95729461@dwillia2-mobl3.amr.corp.intel.com.notmuch>
References: <166630293549.1017198.3833687373550679565.stgit@dwillia2-xfh.jf.intel.com>
 <Y1wgdp/uaoF70bmk@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y1wgdp/uaoF70bmk@nvidia.com>
X-ClientProxiedBy: BYAPR11CA0050.namprd11.prod.outlook.com
 (2603:10b6:a03:80::27) To MWHPR1101MB2126.namprd11.prod.outlook.com
 (2603:10b6:301:50::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2126:EE_|MW5PR11MB5810:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f18861f-f047-4bae-d79a-08dad332309e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 40lTHmGRURhLoMfQV/wnj4sWO/e0uqMrzDgTWTXjK8HHU8H/bCE86UZBCvmq9aHektDG5bOTnPwYk84/DJQoEV2/6+u3Esd41JUazCnjD90UDnsfSyiD0mKOmYuDFWhLqX8eishuTckAdmqu5OeZ3ZDAK13XW/UwO9GIh5pB3f7oRDEpxSQj3RNwp58qyxV+Y2LGJZfNvK+rRYBlOyMt9+r6ncfYOmnUFXOMfUE1Q5vFgEiyUFdtsgG35RXj1HOE8iGr03w3gXqPCM/0dd/WqbFLrABLOz3G6QwFfUvene/nbZM4SJcQEG+BEJe5U/sSWVKU/fg80HhnYbiz84vPzxjIdxwD5kRrhlWvYoAnZrxAJ3o1Spz/kTtb2Gl3L85VEByP5g23WGIRrHiQkKmixxPkarR6thgs5VF8YT+lW7zPA8g72bqA2SG5tiAHIhS5Ppa1MaIEZqIPXuEaAouKLA3vhx4UwX9uNVdP+yx8X9V9/31Ox3MQPLcGa6qfxwqyC2vyP2ICpmb2odUQHAhwOXYGYZ0IItpI3YqHWiBvj2tRhiZKUCHklvYEDuBhNUd+zdNxZ5AhT7eiv+Z/QHsVXlNcHkQ/LpMmKlXTdkJ4kYD4GAlQyZbAogYu518h9r+hVDSLPtUZWhzatSoiGiA0bQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2126.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(136003)(396003)(346002)(376002)(39860400002)(451199015)(6666004)(2906002)(86362001)(7416002)(6486002)(478600001)(66556008)(26005)(316002)(66946007)(5660300002)(66476007)(54906003)(110136005)(8936002)(6506007)(8676002)(4326008)(41300700001)(6512007)(38100700002)(186003)(82960400001)(83380400001)(9686003)(66899015);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JOPkkpjvpfJ7ztS58sAiFGtDctmdUroJumQOnmGsE/sSV2N6AG4oLWamQ6j9?=
 =?us-ascii?Q?d8ViAazdaY6mTC/bPeC5MGwRxEemwhcJIuMrxBFrIH1wEY51NuSo8WOcAdMw?=
 =?us-ascii?Q?hSqz9gTZcGQdMBxS8izhzrKzIllkhEICY91GHECS3T0CVNcxqFurY3g96Jrg?=
 =?us-ascii?Q?lYHwCAgbGm1WbClMKDXeQTS7kN566Olv/V2glCZRbYR1IKN/ytiuDoKH/4aB?=
 =?us-ascii?Q?+BBtLaiCdBpAagflyRQz/BkQdFKqi/QdikLbdm8VzBRAu2NLAiF0hQMg3WE+?=
 =?us-ascii?Q?joJz0hH8PHxyR2DRMAFnmdjRPrBZufXjUCiZVt1iGijySFWHhy8Z+zIBcW5b?=
 =?us-ascii?Q?1fXsyXwW2lFZ8l0fZITCh7T+0mR+bqE8eGbdliEbVD+tZRVAjMty49rzfb2V?=
 =?us-ascii?Q?kYhLJQ440/ASvsVBbqUmxcHuItxKXVRsnglr/f8ppvHubrFnGVs38RNhBzC8?=
 =?us-ascii?Q?/wqqUYEkO+gig7fFx0+vMx/XVKpV3S4JSSA0qeYRWF97Z4NZCCjMRBnCzpK+?=
 =?us-ascii?Q?AjYBaGcxwaEErJ1lQpXz5B8ubVC7PC0QeC4mrtsVK4KPNawXOI4KvOhzEbOV?=
 =?us-ascii?Q?em05E/4NnleAVtvUBYLSVXmDX82lldflanJyGmLC+CQ3pxZeJeZtg6r65Xs4?=
 =?us-ascii?Q?GA+8F77b5zRzLGxmym8yZyuDYhjj/d0T69hRLEQ/Exf+easBOPq/GgXzDaYq?=
 =?us-ascii?Q?qoJMP6R5Ddp6zru4gBsYs1iKNjmeODn4mB7zzJ5FSJDpjH/LRB1zEojdDgW1?=
 =?us-ascii?Q?W7Quq/3uVVSYmc9Ue/TWNJX3fGpnnFNVPCdzGbYML7J33Ngymw4ThpGpyGHq?=
 =?us-ascii?Q?EikXOe2YmfnH9NzfwIuCAuBRV+kpVHrW1VajCRlGAIlVPaVO9peEu9wIsJ3W?=
 =?us-ascii?Q?MgC3eTMZ62t0QAV4PkJjB0IsBBzT2e1DRq0U2DD1TSYAU4TKPX/nRvOmFAqO?=
 =?us-ascii?Q?W9sn/QpynVxNyP5J5z6j08QAxbXQcrRtMvE1jdCJH4LKtUjFlH+9jG3edn62?=
 =?us-ascii?Q?bdjvfJtQry6oAtg/tWe227CTnTIFjpI2FTH7ppwEwFRdCvbTuQVEp0ZFuDmI?=
 =?us-ascii?Q?6jCF8pHPKLtVwUQgx1HtR4G1rSulQqkG5JE8yRQJibiHolJJmTA1p9k+yF3f?=
 =?us-ascii?Q?K2m0gSIv+HtKhBOeyN2Wv6p9ffys2R/6eKqHJYyHnVXLksFdHWSsSJFaPuvK?=
 =?us-ascii?Q?+L3Es7jZdTkZg+Faew+xt+ay/kVhfmHiHCA9W1nxMurCFT7aZr6Slw4RK9wF?=
 =?us-ascii?Q?41WOzqjf9Z/Z1SpVHwYCvRBx/RRS0O6ee0SeM6+SxR1xd7KCISLENvBULZ4P?=
 =?us-ascii?Q?vpXqfQyljeyoCPbNiqGYRfWMWG9pzlzT1mQa7zaCfpmGuQwfMHpuMg4VfaTg?=
 =?us-ascii?Q?JNQUUmY7kn6AlRSOYsLKYt+epDUnCpiGnrOFzWwMCbTyRVzJUd0YL1tftPH0?=
 =?us-ascii?Q?DHv1S/jBKscS4/DoqXYtsLEpmv2Q7h90SGhZ1DprMfq3POMB164fJcQ0lmIB?=
 =?us-ascii?Q?SvtEpiOH4BDICAxS66ToFOdgJULNj2Nmv5bk+KZGe6SUYKnh6fBImMlQw+7G?=
 =?us-ascii?Q?x06XZDO0ujk5/tcnDlk7srdTUVEZdhEBzM9rCC5wc1bAEmuEw0a3tChrqG0R?=
 =?us-ascii?Q?+A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f18861f-f047-4bae-d79a-08dad332309e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2126.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2022 00:22:55.8574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 11RLEtL840jzVYCx85J+oL8HLTsOFpM8HFMcqAF+QDKtp0RPhdeNtMNNe0WLffD4SqRlsyEKytV2TU7SXi78PuVbBliKVewBChbJPIc8DzI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5810
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
Cc: nvdimm@lists.linux.dev, "Pan, Xinhui" <Xinhui.Pan@amd.com>, Jan
 Kara <jack@suse.cz>, dri-devel@lists.freedesktop.org,
 Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 "Darrick J. Wong" <djwong@kernel.org>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Alistair Popple <apopple@nvidia.com>, Matthew Wilcox <willy@infradead.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-mm@kvack.org, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, John Hubbard <jhubbard@nvidia.com>,
 Alex Deucher <alexander.deucher@amd.com>, akpm@linux-foundation.org, Christoph
 Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jason Gunthorpe wrote:
> On Thu, Oct 20, 2022 at 02:56:39PM -0700, Dan Williams wrote:
> > A 'struct dev_pagemap' (pgmap) represents a collection of ZONE_DEVICE
> > pages. The pgmap is a reference counted object that serves a similar
> > role as a 'struct request_queue'. Live references are obtained for each
> > in flight request / page, and once a page's reference count drops to
> > zero the associated pin of the pgmap is dropped as well. While a page is
> > idle nothing should be accessing it because that is effectively a
> > use-after-free situation. Unfortunately, all current ZONE_DEVICE
> > implementations deploy a layering violation to manage requests to
> > activate pages owned by a pgmap. Specifically, they take steps like walk
> > the pfns that were previously assigned at memremap_pages() time and use
> > pfn_to_page() to recall metadata like page->pgmap, or make use of other
> > data like page->zone_device_data.
> > 
> > The first step towards correcting that situation is to provide a
> > API to get access to a pgmap page that does not require the caller to
> > know the pfn, nor access any fields of an idle page. Ideally this API
> > would be able to support dynamic page creation instead of the current
> > status quo of pre-allocating and initializing pages.
> > 
> > On a prompt from Jason, introduce pgmap_request_folio() that operates on
> > an offset into a pgmap. It replaces the shortlived
> > pgmap_request_folios() that was continuing the layering violation of
> > assuming pages are available to be consulted before asking the pgmap to
> > make them available.
> > 
> > For now this only converts the callers to lookup the pgmap and generate
> > the pgmap offset, but it does not do the deeper cleanup of teaching
> > those call sites to generate those arguments without walking the page
> > metadata. For next steps it appears the DEVICE_PRIVATE implementations
> > could plumb the pgmap into the necessary callsites and switch to using
> > gen_pool_alloc() to track which offsets of a pgmap are allocated. For
> > DAX, dax_direct_access() could switch from returning pfns to returning
> > the associated @pgmap and @pgmap_offset. Those changes are saved for
> > follow-on work.
> 
> I like it, though it would be nice to see drivers converted away from
> pfn_to_pgmap_offset()..

I think since there is no urgent need for this series to move forward in
v6.2 I can take the time to kill the need for pfn_to_pgmap_offset() and
circle back for this in v6.3.

The urgency in my mind is not there because:

1/ Physical memory-device-hotplug is not common, that does not arrive
   until CXL 2.0 hosts are shipping in volume. Note that's distinct from
   ACPI hotplug that is platform firmware coordinated.

2/ Beyond the initial growing pains with Folios and DAX-pages there are
   no additional collisions on the v6.2 horizon.

3/ I have not seen any MEMORY_DEVICE_PRIVATE users attempt the
   pfn_to_pgmap_offset() conversion, so no patches are dependent on this
   moving forward in v6.2.

If someone sees an urgency reason I missed then let me know.

> >  /**
> > - * pgmap_request_folios - activate an contiguous span of folios in @pgmap
> > - * @pgmap: host page map for the folio array
> > - * @folio: start of the folio list, all subsequent folios have same folio_size()
> > + * pgmap_request_folio - activate a folio of a given order in @pgmap
> > + * @pgmap: host page map of the folio to activate
> > + * @pgmap_offset: page-offset into the pgmap to request
> > + * @order: expected folio_order() of the folio
> >   *
> >   * Caller is responsible for @pgmap remaining live for the duration of
> > - * this call. Caller is also responsible for not racing requests for the
> > - * same folios.
> > + * this call. The order (size) of the folios in the pgmap are assumed
> > + * stable before this call.
> >   */
> 
> I would probably add some discussion here that this enables
> refcounting on the folio and the pgmap_ops page free will be called
> once the folio is no longer being used.
> 
> And explain that the pgmap user is responsible for tracking which
> pgmap_offsets are requested and which have been returned by free. It
> would be nice to say that this can only be called on free'd folios.

Ok.

> 
> > -bool pgmap_request_folios(struct dev_pagemap *pgmap, struct folio *folio,
> > -			  int nr_folios)
> > +struct folio *pgmap_request_folio(struct dev_pagemap *pgmap,
> > +				  pgoff_t pgmap_offset, int order)
> 
> unsigned int order?

Sure.

> 
> >  {
> > -	struct folio *iter;
> > -	int i;
> > +	unsigned long pfn = pgmap_offset_to_pfn(pgmap, pgmap_offset);
> > +	struct page *page = pfn_to_page(pfn);
> > +	struct folio *folio;
> > +	int v;
> >  
> > -	/*
> > -	 * All of the WARNs below are for catching bugs in future
> > -	 * development that changes the assumptions of:
> > -	 * 1/ uniform folios in @pgmap
> > -	 * 2/ @pgmap death does not race this routine.
> > -	 */
> > -	VM_WARN_ON_ONCE(!folio_span_valid(pgmap, folio, nr_folios));
> > +	if (WARN_ON_ONCE(page->pgmap != pgmap))
> > +		return NULL;
> 
> Checking that pgmap_offset is not bigger than pgmap length is also a
> good assertion.. At that point if pgmap is not right then the struct
> page has been corrupted.

Ok.

> >  	if (WARN_ON_ONCE(percpu_ref_is_dying(&pgmap->ref)))
> > -		return false;
> > +		return NULL;
> >  
> > -	for (iter = folio_next(folio), i = 1; i < nr_folios;
> > -	     iter = folio_next(folio), i++)
> > -		if (WARN_ON_ONCE(folio_order(iter) != folio_order(folio)))
> > -			return false;
> > +	folio = page_folio(page);
> > +	if (WARN_ON_ONCE(folio_order(folio) != order))
> > +		return NULL;
> 
> Do you see a blocker to simply restructuring the pages into head/tail
> here? If the refcounts are all zero it should be safe?

I do not think all callers are good about avoiding a new request if they
are already holding a reference.

> 
> > +	v = folio_ref_inc_return(folio);
> > +	if (v > 1)
> > +		return folio;
> 
> IMHO, ideally, this should require the foilio to have a 0 refcount and
> this should set it to 1.

That would certainly be a nice property, let me take some time to see
how that could be made a requirement.

> > +	if (WARN_ON_ONCE(!percpu_ref_tryget(&pgmap->ref))) {
> 
> This should not be a warn on, there should be races where the dying
> check could miss but the refcounts all reached zero anyhow.

Ok, makes sense.
