Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 234DC606C01
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 01:18:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9FCB10E353;
	Thu, 20 Oct 2022 23:17:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0407110E353
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 23:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666307864; x=1697843864;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Fi8i6LqIyFyNQyC2fQ+YqsEf+cJOiFjRXK7I0ggyjuw=;
 b=K+DbwQYec8DOiexh2uQ4h0mPp5hGtv0sDUt7gnr2rQVGLmoBPxhAgjFm
 n/CEjvsqj5osMDlviE/HMhCyhn7x6ju1AX9XQMHnujG7GSrwW3FIZ+ok4
 mUb8YpnRtbaSm0rHjfZPyGvuhZ/Y3oAY6sV0gzv4P7mZr+Q4o5cOc1iQg
 vzaEOONVfDPJRKeT/zZrADZjPLlYx+lQXNRFsWoJiDCbVwGu93LEanvf7
 +fso5hpEAGh3ivAC3paXNHe+VgMgoyN0P+ePgSztqHKO6y0t5SkbV7SWi
 gfPDaMidGytGcE0iVV4aexZjShKn0jpdKFTpqOTrIOoRP+MoipwKryraR Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="286578901"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; d="scan'208";a="286578901"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 16:17:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="632553051"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; d="scan'208";a="632553051"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 20 Oct 2022 16:17:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 20 Oct 2022 16:17:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 20 Oct 2022 16:17:42 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 20 Oct 2022 16:17:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ntH5O7TgIoBJGoJPjan2tp/yqUtpOPeOGLPWPodwa89t8ohHSWgKY76rsUlbOrYkBo/rqo9Glg5obMFx20GXHoKZxs4Hbl/hBBX7mMtHCwiVYl6vf8ieJUml/nWZXAnC57GQKI9V7o2UYGq9YHPH9SEW6Vw19YN1SSQDgX0+pEiVpNNxqnYTrUxo3oRadrzZJ96ADVT3yMVJgOxq+MeEjhC87kNV9OQCvzmEa6pQbbjd3vAfsi/cg+vFmRIlIl7Uxbc5ieNbW97fJv2uYS/h4mwjc+oN3LRz0y5kxG+mIy+mDHtz7qF9NuqD3B2gRM2DMiYkb8TuYCgHZbW3OMD9Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bcVil+tAtDLXDOxwcaH9BhQ/iBhpnxwmo4JUvpTtSLg=;
 b=g/HqNV09Zgq/t4b6N1n+7VpsxDSYqsvsJZkqiXrd0tmNnDXEdLzaCb38Pv01+41LG8gC+H4JAxqbJ9FRs6JETZo4dY5CCB9LdX8pwRmN+UyBE8Wz2I5L3YsB3NfyyLwgNJF3U4OEPIC4M/1mKWXhVJc3InU45SQry1j98miBtFWfsNqWYUVNeTHSrVh7U+FlWGXIUxzToar9zKkvyed5vrkzfYOJrlWwW9bKgD7//+AbssLYymiUhBVBuDtcC2ZhtZUXBKgZpRSmWCIOSXIMItO9j7KPBrpJv4MFk3m3Eus8f65rLk/jurbLZxEle84giSdz97T2KMy6AFFaOHnkTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2126.namprd11.prod.outlook.com
 (2603:10b6:301:50::20) by DS0PR11MB6517.namprd11.prod.outlook.com
 (2603:10b6:8:d3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Thu, 20 Oct
 2022 23:17:39 +0000
Received: from MWHPR1101MB2126.namprd11.prod.outlook.com
 ([fe80::7d5a:684d:99f7:4e83]) by MWHPR1101MB2126.namprd11.prod.outlook.com
 ([fe80::7d5a:684d:99f7:4e83%12]) with mapi id 15.20.5723.034; Thu, 20 Oct
 2022 23:17:39 +0000
Date: Thu, 20 Oct 2022 16:17:36 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Felix Kuehling <felix.kuehling@amd.com>, Dan Williams
 <dan.j.williams@intel.com>, <akpm@linux-foundation.org>
Subject: Re: [PATCH] mm/memremap: Introduce pgmap_request_folio() using pgmap
 offsets
Message-ID: <6351d7105fe92_4da329467@dwillia2-xfh.jf.intel.com.notmuch>
References: <166630293549.1017198.3833687373550679565.stgit@dwillia2-xfh.jf.intel.com>
 <cbc23eba-990f-688e-d22b-0c0d103172cb@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cbc23eba-990f-688e-d22b-0c0d103172cb@amd.com>
X-ClientProxiedBy: BY5PR17CA0058.namprd17.prod.outlook.com
 (2603:10b6:a03:167::35) To MWHPR1101MB2126.namprd11.prod.outlook.com
 (2603:10b6:301:50::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2126:EE_|DS0PR11MB6517:EE_
X-MS-Office365-Filtering-Correlation-Id: 01a5cb41-7f07-4220-56fd-08dab2f147dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Iltc4CZkl5i65alM7MiVjohv/EqZ1CWyFx0pg6l2xbZnXhPpyiuzb9d8hqFxPVo64eOYGh6ksfu+AZxREiugnUvz3LKHPoQAVCNrujvuRAg7AdiM4q6KXOfcDrAc+VySxYiHNDwrExykzY46S2AOe+rSEN2ZC00TGVj1oDcpE4bRwfotlL/x8ToOPQN39PoUPyJiQOcz+zdr0X569EIToLwvtdHr84bRJyf1gAHb1Pa2DTgM1th9u0EoOi1iMJa49i5QvTEVqJcJnkvvZGDZm+gL6dIp1JzJkXD6twEodHFgwaBUB9hv1rK+9v7HNNAJ2qV2TuQMULHIzIVcV4rNgFGw9HUHdGXkFsWqgtMpKzXasOJFtT4wdSvOHTPaiO3N6VQCfnt9SSRhewfADOYK6n8y5GQw9SAKHMvgr2aCJl13qzP8V2k4ovj2AxOEikaXpNIHBA2l9Mr8CWaPSB9CNSlAQW664UxWGrV11j4ARDScE0N7i9KsuDt8uSDCf6Fn58PnJRKJzIWPatAbhioxkDV2I68UZa7s++IzW2HAdP02bTgjGSUJx0OVerCm1cOooh8AHsSNpAYV/CPeQF2sJIAdslQqnRvvVF0JXq5l/qw6BBgylkTuDbrDCjKlb0tN0BhzfMkdXUnaOY5vo98yDTQbkQyKZv0dxwls4d1LfirDLyB1cMFsaPAWa4TTcTKDejWqXLGfTHLpA3ImxAD3Ow==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2126.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(376002)(39860400002)(136003)(396003)(346002)(451199015)(186003)(38100700002)(83380400001)(8936002)(7416002)(54906003)(2906002)(82960400001)(6486002)(5660300002)(4326008)(8676002)(86362001)(41300700001)(9686003)(316002)(26005)(6506007)(66476007)(6512007)(66946007)(478600001)(66556008)(6666004)(110136005)(66899015)(4001150100001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nP9j7GLX++wSUr7EDFZpJPv4WPmHx9j0LmlrInMLAJinK346KvCoi5pStFg2?=
 =?us-ascii?Q?tU5sV/Ve8jIYpczU1esgBbko6ikErazwJZ0HcBVQBvP6JAw/IdbUmHbiW6+a?=
 =?us-ascii?Q?dpgL3tH4H4J2xmQQSHMSfptNSV1dxywY9bAYWFfVWXc9fxQsxeKGAHZw625G?=
 =?us-ascii?Q?PalMVKUQCrCfWwHCJi5ffA8isMPdbCR81NhXY+86eZl0bbOV+hRnAB49GNyj?=
 =?us-ascii?Q?b+9Cn1d4ChEFi164+6PO6B6FPfjFRazLCfmh9KBeLsW75xFKjq8uH4RQpDzE?=
 =?us-ascii?Q?z1eaWj4Cs0gITZeOIm5LrDSoiOD8TJYVCTAUmJfQHMAzwdCEgRTlBIyuS8H2?=
 =?us-ascii?Q?LScIz4/Fwd2B/Tw/xbmKXtmEhVZ5JVn0R6EwZ17/ebCCyTYAdY40v+ab9Osv?=
 =?us-ascii?Q?o+yT+tHd20+x2jTmxoTOXOlOzBOQgBPH/lAPJ6mJ4KXskgcLYgnspEgpReTb?=
 =?us-ascii?Q?+B4urLQV5/fStU8MQ64M9MKNX5Qe3lm7k4s79lTvJFuBTXLOt3QiseWyl52J?=
 =?us-ascii?Q?k9odAxqmkXStqhn1cFYjhib84rhbYND9pMq3MNiPzfvccFg5xTbXoxZ+qLHP?=
 =?us-ascii?Q?IajKs9tHP5AtSWr6BQTqYvV7sQtwPNdsfx9M+Ke5SaO3PUtb+UY7Kdga/TET?=
 =?us-ascii?Q?E7klk+tr7NIhsB6Q7Sk0aBfEG6gZdCjjEq3D+Jjp/SgZdof8hrTI87/NUZRK?=
 =?us-ascii?Q?C02iyAxVRwjLpG2i5rKWqkSoCD3Nfjaiux02iUWAyQ/Kf/b66L2dGxOEeWSo?=
 =?us-ascii?Q?dYg5rOUdY0gnPO0BM3rw2RcA3S5e95l//O6IYxy3MtPOmEAfGxHd2Xa5rEeg?=
 =?us-ascii?Q?iBmthSdhBWGCbX8d33piixUWBnHk0MiJJ0QtTpOclHtgf6xp0r2LH6d02QOj?=
 =?us-ascii?Q?4caNyheykFzMgV1Mqqg4Pbyk3dderFlpHqQjGQTtQO7RJBP2h8LNue97CleW?=
 =?us-ascii?Q?nF+qA/Wok8WkhRLjJ6fD6XsTk2s/0XbLdaUCWu9T/qbNgl8cLqvXHXfOb2Tb?=
 =?us-ascii?Q?D2/0cJ0G2KkS20IyfmjxeLGoG/W6BMJeh6mKXL6sBQ60VZRaTqwTHWdnP33z?=
 =?us-ascii?Q?yxlU8LCq0aIN2q1eczeXOgbOVWIrHEzDcDLNKDWxBdRY9HX61MHsDo1wCocu?=
 =?us-ascii?Q?OKni1WibDngJkEdeAnOyuFRUyIiKOXZ+zKkP1QeWvU5QFvHabgtyvZMvD8nA?=
 =?us-ascii?Q?sHLgKodzWemuO+Ew9l6jm4Qnrh89+SGJr+CEBIEVNLn+2F7fhih3cYyOl6+l?=
 =?us-ascii?Q?b07V3AnQYMCqM4VOno34fZCyMIIFOREmCD95SLIK0zEB2rf6ow4ZTuboy2ri?=
 =?us-ascii?Q?otNbIrLq8HwaNlka0k0noMNlERDPvtIQRktrZ1ZkhbIJ0SUgQAucAdNg58ZP?=
 =?us-ascii?Q?mhrFdHknIyB8GKBTJJN4cXhbav8LPYFFuvVinTltvzhPBnAgUozDvL2PP9pN?=
 =?us-ascii?Q?sBuowjbeIQGVtRtMZodFd7p53B3Wr0YmXgWWS+xk25zo2cKpyB8aeM/Rl1Jb?=
 =?us-ascii?Q?FoKqiC3WdKWZjazdxogGoJlNsR74/8Zs/wIt3Lz9uFGMzEEDlVsAbEoyGEQP?=
 =?us-ascii?Q?ij0mkLeQiScbTSSICn9xV17iJoPTbB/4WBBa287DN1AS8aJ4Kvjcy7DLhzoM?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01a5cb41-7f07-4220-56fd-08dab2f147dd
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2126.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 23:17:39.1396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Ck1cDRWomRSWV9gaq8Wmj5SMrsB8/bXRNrDQ936MpKCIwt/X33K45H3uen9UY2NXO48A3HeghAUOYvMivLkqICQbJGoZGu0HxJluwu3GWs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6517
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
Cc: nvdimm@lists.linux.dev, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Jan Kara <jack@suse.cz>, Jason Gunthorpe <jgg@nvidia.com>,
 Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 "Darrick J. Wong" <djwong@kernel.org>, dri-devel@lists.freedesktop.org,
 Alistair Popple <apopple@nvidia.com>, Matthew Wilcox <willy@infradead.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-mm@kvack.org, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, John Hubbard <jhubbard@nvidia.com>,
 Alex Deucher <alexander.deucher@amd.com>, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Felix Kuehling wrote:
> Am 2022-10-20 um 17:56 schrieb Dan Williams:
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
> 
> If I understand it correctly, the current code works because the struct 
> pages are pre-allocated. Is the end-goal here to make the struct page 
> allocation for ZONE_DEVICE pages dynamic.

Some DEVICE_PRIVATE users have already open-coded their own coarse
grained dynamic ZONE_DEVICE pages by waiting to allocate chunks on
demand.

The users that would benefit from a general dynamic ZONE_DEVICE facility
are cases like VMs backed by device-dax instances. Unless the VM calls
for bare metal services there is no need to map pages for the device-dax
instance in the hypervisor.

So, the end goal here is to just add some sanity to ZONE_DEVICE page
reference counting to allow for requiring an arbitration for page access
rather than just pfn_to_page() and assuming the page is already there.
Dynamic ZONE_DEVICE becomes something that is possible once that sanity
is in place.

> > On a prompt from Jason, introduce pgmap_request_folio() that operates on
> > an offset into a pgmap.
> 
> This looks like it would make it fairly easy to request larger (higher 
> order) folios for physically contiguous device memory allocations in the 
> future.
> 
> 
> >   It replaces the shortlived
> > pgmap_request_folios() that was continuing the layering violation of
> > assuming pages are available to be consulted before asking the pgmap to
> > make them available.
> >
> > For now this only converts the callers to lookup the pgmap and generate
> > the pgmap offset, but it does not do the deeper cleanup of teaching
> > those call sites to generate those arguments without walking the page
> > metadata. For next steps it appears the DEVICE_PRIVATE implementations
> > could plumb the pgmap into the necessary callsites and switch to using
> > gen_pool_alloc() to track which offsets of a pgmap are allocated.
> 
> Wouldn't that duplicate whatever device memory allocator we already have 
> in our driver? Couldn't I just take the memory allocation from our TTM 
> allocator and make necessary pgmap_request_folio calls to allocate the 
> corresponding pages from the pgmap?

I think you could, as long as the output from that allocator is a
pgmap_offset rather than a pfn.

> Or does the pgmap allocation need a finer granularity than the device
> memory allocation?

I would say the pgmap *allocation* happens at memremap_pages() time.
pgmap_request_folio() is a request to put a pgmap page into service.

So, yes, I think you can bring your own allocator for what offsets are
in/out of service in pgmap space.
