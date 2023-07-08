Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 335EB74BC64
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 08:40:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F4710E650;
	Sat,  8 Jul 2023 06:40:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C509F10E650;
 Sat,  8 Jul 2023 06:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688798399; x=1720334399;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=O+SNmx28q4In/9CQlAqK/y25QsEpB4jY3uHOZnziMuo=;
 b=W3OKgpZWG1fyE8x0QDN7bQlZIMXcAxiiHbMZBn30CjbHrGL42ZOuSn4P
 zeF0q/HEEsXFLiqo/k/bB8Ladbp+PF4PMmDIH9CfgdtnygKqxGEAM6auq
 VWS2PUeLxBaSLUjRPk5PutzOFsInh6ixNXDQMNYKwCv6msx9vATAE1SBv
 kEIia9PVKLB06xa+Ya6Cj0OOQnfnv1PSz7Mn+O8CpuArCN0YKG+6X1l9c
 cnKFCIoMIGCDPd4d0cogG9Y4FpSqLQCoBkThtRLsqeVj60wWkn48GWohh
 6nXfWw9BlS7a0mhoygl8xbLoKlKmzOl3nC4tpA+6kbW0x0ssGOYrjOM52 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="366619912"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; d="scan'208";a="366619912"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2023 23:39:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="810265098"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; d="scan'208";a="810265098"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP; 07 Jul 2023 23:39:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 7 Jul 2023 23:39:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 7 Jul 2023 23:39:56 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 7 Jul 2023 23:39:56 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 7 Jul 2023 23:39:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ewfVGB/Db4w6dKY5hAcf3ti9MQPxmbgCkcdT36R69uSFc9YCG2/BSjwzh7RvdQ7h5VoyHzPA4tar64tQuCt067+QXXQTCBLOrGsWf3bAbH2Zv86ga7CdyBJnLa+vRvYw0urWM2TyaVq4YskbVH4XDWUF7KknINH66sGOSw2jDXX24Cp95iKB0rI/qXmsGz2h8+QKt9oW09Am7wWLBsrkqATJpiN8mdiUh5b106LVtUgRk4UVms0YjbcXHjxXYSY0F7sHaINYNCGe9F4plTXE+YKppH15eKfTTatttym0YjBIyu2jeC26HLG6k9IUH2Z5BAwYGM0b2LwEmtjChWJ3Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ew4T/kWyrhIwx+rYamnmfq55vhloZlEX1yz1MhTrHGg=;
 b=eC48Rlk9gqo2sKnYvE0uYC1tVj3f7Et3eOU5YeBX0JCD1Y8rXiUio9sNS3uyUTWdD4oaxSmal5GRRCEtoqe3Z8S/PJHPVj8BemXFx8AuhSMgGWM7yGBUzKcIJ4DpRuOQeOWpV6+zGLsa0x4ddNpjoTW86sJNvUi2F8NSKbElc679eQKd3JZmir321defFt9S4M9Rdg8eUDUlOM+0FhmC7lR/Ri16myd3kAHp4Zors7p+k6w2IRdKrmy5r5sfNu0vuBsI+v9xtUDzs+9hXAsy0L9VU8DFhZnbbdMJmfLZvSN70dxKNVGTv+4beAIP6wdjMuOcsoyUSEA+PVWDwO29tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB5462.namprd11.prod.outlook.com (2603:10b6:208:31e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.26; Sat, 8 Jul
 2023 06:39:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5%4]) with mapi id 15.20.6565.026; Sat, 8 Jul 2023
 06:39:52 +0000
Date: Sat, 8 Jul 2023 06:39:14 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH drm-next v6 02/13] drm: manager to keep track of GPUs VA
 mappings
Message-ID: <ZKkEkoHSGwICKwHf@DUT025-TGLU.fm.intel.com>
References: <20230629222651.3196-1-dakr@redhat.com>
 <20230629222651.3196-3-dakr@redhat.com>
 <20230707130010.1bd5d41b@collabora.com>
 <e92219d7-77f7-a40a-39d9-ea7afc5f3687@redhat.com>
 <20230707145241.6ea73643@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230707145241.6ea73643@collabora.com>
X-ClientProxiedBy: SJ0PR03CA0222.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB5462:EE_
X-MS-Office365-Filtering-Correlation-Id: c4824476-6ef1-45cd-f14e-08db7f7e2251
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NH7nyKEbDygYYeQxIaXdpygY/ErwS2glzA43+SpBDxwJ3Ga37jKv6TLs4T2gMEx+a+4WvLA30CgDFvDHZim0zfBH1cYXP87+MPpbQraxursrjkJX/4mD5LugKHMXDLgelbxfd4h8okBcFX2G2HFpWL6IZTeeK15eVikgkOk0l+wD3l6k5pj0/N9NTpWk5nkI83CE5Uh8tDGb17XN5RVTz61c/NixTb0xsp2BQ1giz0RGcTTM7rSC7zpR/saH+yvIRLl35XilSxcb2pL42ctYkrPn6jUArFj9hOVWccrwlVJtzLy2DHUjw4CgitQE9SIPamkjK4ds2Dot6B6Cmq8vZ92Zc37QqabJ0kAE7fwRs37Y9idTlLbY+eWIDq7JojrsfOFmf26PcfYPm4454uxVbc6kDSoKJgLoxCXbiwKLbyIKXGRaVpwc+Fvf/OdDBKnPD81lYXBm/OJsAFxcBaNJqYpOrUmTkEUXFDekU6e8Nn4mSY1+dgla2dlqr39oIDEi5dU7HiiVvCd88Edixb3PI89fq/lw6uDSId6ACSoPITEzbPlbKRZYqKB4MdpMd0Y5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(346002)(136003)(396003)(39860400002)(451199021)(38100700002)(86362001)(54906003)(6666004)(478600001)(66946007)(6486002)(82960400001)(5660300002)(6506007)(6512007)(26005)(186003)(7416002)(316002)(8936002)(8676002)(66476007)(6916009)(66556008)(2906002)(44832011)(83380400001)(41300700001)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oPG22WoMd6QB5Xm3bOcKptEeZzDZhAiYvkkZ6mtMTea5hHx1z5yKPw1KiQ6+?=
 =?us-ascii?Q?awlcRNjZDpstM2kDWnFmFzaciuRVeNLL29NJN8BiuUEOjP+JkOd4YLyzW1PH?=
 =?us-ascii?Q?QjqrJs6EfM6VEwqcoUJJmafyYd4JxMEqB+0z6jtau4lqgPvmHSP/lQysjnzi?=
 =?us-ascii?Q?rB4QR3vTmpdsMcNNYjNXOuywr58Z5RM2rbajFxUCtm+tgRjVBVzHe2T9PjyB?=
 =?us-ascii?Q?VcygfwsMxM/ZmR7/rIJX215KiSPLUMVUGek5hogEb6ekEvmAcmFEji9N0VQs?=
 =?us-ascii?Q?qcIKui63iImoPzcwUcAVokfizortY1mEetq0xPGCMbnD7g2XYS11eQwFmnQu?=
 =?us-ascii?Q?iXiJDJxfXX4OjS2TtzTcDbKY1vKLisPzu/PxqGykkEBbwoTIbk8HpOzVUVft?=
 =?us-ascii?Q?mR1qwEHI3oOvFrBkSfjKGWGmE+E0vLxvy6qxZ8NPyCg4QyHc8R+FiHy4APSO?=
 =?us-ascii?Q?6pKvubd3u5cVOPesHyQNXBbGx0Zki5+fDWGbzpzD5cb7+GTzrjVLbonWBdk6?=
 =?us-ascii?Q?QkUHtjcKzpC5FyG4jf65VbWDente6vbElk/G1cvyUEhvlEidAftB43kBUC7Z?=
 =?us-ascii?Q?3pJL0VOdfB4btyr55U115S2xe68bpjQnacM4F7mcItU+Qjqo3JrZ5EE2ylFm?=
 =?us-ascii?Q?XZIzmFcLejoIu9KcknqX6hmwOQhOWbNwVUtCvotqUQ57CVXpk1QfuPhsnK1Y?=
 =?us-ascii?Q?Ao0Jt6CCvxQrz4bEEadYeDWskCtYe7Q26Tx4Nd/KUxDYlV1jxULONjh92W70?=
 =?us-ascii?Q?K1enNBYhVXHZffC2F847+IVSwZQLxsuNYpYe2mo/Ak7OxPpiXDvJxU/lgwmL?=
 =?us-ascii?Q?+86AyScwg68iP2q1GqZHiHjsvkrf39CIUdkfZlmXhiizFdDSDiE+jfFzT6wK?=
 =?us-ascii?Q?k51tWVK8lYqON2oGks1tum5NIAXovQ4gHXs34C45MUUdChV3uloSNw5/yMmc?=
 =?us-ascii?Q?SZA1wI3NhqUWcac4qsPdUExxBMY9eFuYaZFga7/8iehrdi3HWh4y6/I+7ep1?=
 =?us-ascii?Q?oima/Hflck4gXgHdGAJKnQTpj3uJOd2exHnpqv9ozCErNvY8A1Ys6+cM9hM8?=
 =?us-ascii?Q?beriX/nbs9FDYbWdKeVxBTOtBIGKZkQ6gQDiUXntPWyKFGiOW61Dn74H0TkS?=
 =?us-ascii?Q?Ru6FhEZiV8ap/FDmi/F47UL9I9GTpMmlt09IpVSmGOnTtjbKaDjCeJp47H/w?=
 =?us-ascii?Q?bfrWhU3wgQUJtgmIUPw456B05z/CUFQcDDEfDSYzgoOLUDzrPnq8Hhnq+uCc?=
 =?us-ascii?Q?qJ8vP2rcTb3QXsKLTuMHWeTBOMXcpN9LrT6sGnYB31EHf3AifL19r6/19H64?=
 =?us-ascii?Q?qyE6dMp6A4Vz8/6DyTu5wqMajnwNOZmmn06YhtzmoVqAS+aS7zcAyicL/pb2?=
 =?us-ascii?Q?cOKPRAOG9Yvc8N+sLSzY38v7YQx/sUhk/s1XuQlvA83R9TA0/nli8JxwZs5K?=
 =?us-ascii?Q?mJZD1hp9TonmtryxR0g8SY2bLvtITabog2MVVt+OtLomtXcsGiFw+tgkRmiu?=
 =?us-ascii?Q?2jmGNUwMmJ3/PYrI4eAs1E5AO43jKl3dopC7tPELLzSyaB20TXnxCCIR7kK4?=
 =?us-ascii?Q?KERBfxiC7lEUvrtm7WHPBZ+ygQc9Gsqbfe13T0IEVBN+GaqDRXfWZCbokGy8?=
 =?us-ascii?Q?Vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4824476-6ef1-45cd-f14e-08db7f7e2251
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2023 06:39:52.4223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vG/y4li/jpIYoI7V1QY/b6NV+juNJ9coyNbEvCWLFvqsr/AtiJliQuKw+N9iFIkJYWbArRLF2X/DgwbR+/RahA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5462
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
Cc: dri-devel@lists.freedesktop.org, willy@infradead.org, corbet@lwn.net,
 nouveau@lists.freedesktop.org, ogabbay@kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, mripard@kernel.org,
 Danilo Krummrich <dakr@redhat.com>, bskeggs@redhat.com, tzimmermann@suse.de,
 Liam.Howlett@oracle.com, Dave Airlie <airlied@redhat.com>,
 bagasdotme@gmail.com, christian.koenig@amd.com, jason@jlekstrand.net,
 Donald Robson <donald.robson@imgtec.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 07, 2023 at 02:52:41PM +0200, Boris Brezillon wrote:
> On Fri, 7 Jul 2023 14:41:23 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
> 
> > >> +	     va__ && (va__->va.addr < (end__)) && \
> > >> +	     !list_entry_is_head(va__, &(mgr__)->rb.list, rb.entry); \
> > >> +	     va__ = list_next_entry(va__, rb.entry))  
> > > 
> > > If you define:
> > > 
> > > static inline struct drm_gpuva *
> > > drm_gpuva_next(struct drm_gpuva *va)
> > > {
> > > 	if (va && !list_is_last(&va->rb.entry, &va->mgr->rb.list))
> > > 		return list_next_entry(va, rb.entry);
> > > 
> > > 	return NULL;
> > > } >
> > > the for loop becomes a bit more readable:  
> > 
> > Yes, it would. However, I don't want it to be confused with 
> > drm_gpuva_find_next(). Maybe I should rename the latter to something 
> > like drm_gpuva_find_next_neighbor() then.
> 
> If you want to keep drm_gpuva_find_next(), feel free to rename/prefix
> the drm_gpuva_next() function. I was just posting it as a reference.
> 
> > 
> > > 
> > > 	for (va__ = drm_gpuva_find_first((mgr__), (start__), (end__) - (start__)); \
> > > 	     va__ && (va__->va.addr < (end__)); \
> > > 	     va__ = drm_gpuva_next(va__))
> > >   
> > >> +
> > >> +/**
> > >> + * drm_gpuva_for_each_va_range_safe - iternator to safely walk over a range of
> > >> + * &drm_gpuvas
> > >> + * @va__: &drm_gpuva to assign to in each iteration step
> > >> + * @next__: another &drm_gpuva to use as temporary storage
> > >> + * @mgr__: &drm_gpuva_manager to walk over
> > >> + * @start__: starting offset, the first gpuva will overlap this
> > >> + * @end__: ending offset, the last gpuva will start before this (but may
> > >> + * overlap)
> > >> + *
> > >> + * This iterator walks over all &drm_gpuvas in the &drm_gpuva_manager that lie
> > >> + * between @start__ and @end__. It is implemented similarly to
> > >> + * list_for_each_safe(), but is using the &drm_gpuva_manager's internal interval
> > >> + * tree to accelerate the search for the starting &drm_gpuva, and hence is safe
> > >> + * against removal of elements. It assumes that @end__ is within (or is the
> > >> + * upper limit of) the &drm_gpuva_manager. This iterator does not skip over the
> > >> + * &drm_gpuva_manager's @kernel_alloc_node.
> > >> + */
> > >> +#define drm_gpuva_for_each_va_range_safe(va__, next__, mgr__, start__, end__) \
> > >> +	for (va__ = drm_gpuva_find_first((mgr__), (start__), (end__)), \
> > >> +	     next__ = va ? list_next_entry(va__, rb.entry) : NULL; \
> > >> +	     va__ && (va__->va.addr < (end__)) && \
> > >> +	     !list_entry_is_head(va__, &(mgr__)->rb.list, rb.entry); \
> > >> +	     va__ = next__, next__ = list_next_entry(va__, rb.entry))  
> > > 
> > > And this is the safe version using the drm_gpuva_next() helper:
> > > 
> > > 	for (va__ = drm_gpuva_find_first((mgr__), (start__), (end__) - (start__)), \
> > > 	     next__ = drm_gpuva_next(va__); \
> > > 	     va__ && (va__->va.addr < (end__)); \
> > > 	     va__ = next__, next__ = drm_gpuva_next(va__))
> > > 
> > > Those changes fixed an invalid pointer access I had in the sm_unmap()
> > > path.
> > >   
> > 
> > Sorry you did run into this bug.
> 
> No worries, that's what testing/debugging/reviewing is for. And I'm glad
> someone decided to work on this gpuva stuff so I don't have to code it
> myself, so that's the least I can do.

With Boris's changes this version works in Xe.

With that:

Acked-by: Matthew Brost <matthew.brost@intel.com>
Tested-by: Matthew Brost <matthew.brost@intel.com>
