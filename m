Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BD576008D
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 22:32:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFD9F10E11F;
	Mon, 24 Jul 2023 20:32:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 372FE10E11F
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 20:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690230769; x=1721766769;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pk1fW0gL/6FN21OSG7tsS8DDIE8P45IAIYvmjsIwz80=;
 b=eKmZrpwb/yFALYbJRVBWiDUoIYlN2Ut78FrXACipk4RJ0+bC4U1jvx6m
 RUvZAOai2B27B530Qgilgc2Uy3Ks5uZm1jawu+oeq3GjOaa9r3R7Y+TZf
 MBueTvQKAQquAACWWATeaZWf6hAoWvm6UlBZSYeQoxo/nhl4JDavXsOtx
 rMwNsy6TrRcGC57xpacUS+cGlYQB0bkwwT0S1HAiS0IRE4/oxGg2S8PWg
 nPSjmeM+uNlGk+C+zWu9oyB9wbOyCFdC4dPP6YEVTxhg4jNKMoFnz2xhS
 HedR01n8E5gvyINw7Wmvh5V8G5IWIjRDoKy5Leb4sAFRqqNyoJUr2Njhm g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="347152195"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="347152195"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 13:32:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="1056548392"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="1056548392"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP; 24 Jul 2023 13:32:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 13:32:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 13:32:47 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 24 Jul 2023 13:32:47 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 24 Jul 2023 13:32:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=feqg/XRWwb/N4EyphhZsCx73ox/d/g+31GhK0+3NbCJcTHgGITO4keYyPfxd2RTlwF9bmb2URiDxhQ0XZhQVkHs4gQ6Ca5mfuIfPkVVAnu4X8+Abu4QmL1Qau8GQEg6tO8G3loP24eu/+Kp0IRsN85J8Nbq+f/7j2uV8p9QDKN3sJUtfxPi+hRUBgLqQI4tPpO1rJGrl59TQqo/rPN1UxGCsxg1JqFSlaPpcl/A8SMfjH5cUvTe3J4lP12f4hKI71pdtRO5GA5jrFnz8oz25sJ8OLJubFqgFVD9cvVczsY9u2AJOBAEAy4H5qCMi9ZY7hnIxW2D5eELzqcOM1zZaqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pk1fW0gL/6FN21OSG7tsS8DDIE8P45IAIYvmjsIwz80=;
 b=YMVrXlEHOOoKCRT3349JKrtiOK3y+NawCtd32CylxJqPm6i6+vDiQIO/qozFT1LP13lnPhO6DOcJKFWfAgdC9KFiu/xjFvUsdjzdHDCnIYC0pXilbJH9hMWJ1WImDtXZBsbm2Ws8lkjpb7yvQLM5qXchgyTI8SfkBeMUGe13mY2IyBVOq4IEVuT/FYAB9/80uo11kUdqVGuZIQISan70ar6fAVAcgetIYq9U9LBIGQfRN12KIDnEIzj2baH6zF409WA96Xo4iPEwEgqaDM3TdjvWM38c5kLskqx8ovuHrYNuAeZ4GmF3wckioBOO5n5morM55fhMGQfUKLpHrOF7WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by PH7PR11MB7098.namprd11.prod.outlook.com (2603:10b6:510:20d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Mon, 24 Jul
 2023 20:32:45 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::468a:4b39:392b:d9a9]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::468a:4b39:392b:d9a9%5]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 20:32:45 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: RE: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Thread-Topic: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Thread-Index: AQHZuVToVshy99YkkE2dGyNcPWpnjq/AWUSAgAGkBBCAAGFsAIAF9M/ggAChIwCAADi24A==
Date: Mon, 24 Jul 2023 20:32:45 +0000
Message-ID: <IA0PR11MB7185D67DD07FEF0C92789D7AF802A@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20230718082858.1570809-1-vivek.kasireddy@intel.com>
 <20230718082858.1570809-2-vivek.kasireddy@intel.com>
 <87jzuwlkae.fsf@nvdebian.thelocal>
 <IA0PR11MB718527A20068383829DFF6A3F83EA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <87pm4nj6s5.fsf@nvdebian.thelocal>
 <IA0PR11MB7185EA5ABD21EE7DA900B481F802A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZL5+CiZ6w4RdAt5u@nvidia.com>
In-Reply-To: <ZL5+CiZ6w4RdAt5u@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|PH7PR11MB7098:EE_
x-ms-office365-filtering-correlation-id: b97fe2b6-a128-4485-e77f-08db8c85235c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XDSl8V1yoA7WII/VTvhVL9RM4QbiwWlnTrISlcnfHah9UUyMyk3956ah7FSllO12e9hV0pW7EpoiBTlxAjdnUojTZB6ycCMHjCs7L4IM3y5uYQjOzcEhZcckvQT4rCQkq6JGho52bGuPwhabALh8avLOrnSYwMZKpjDiegpGvJVlLRC1Gv14OCxmGgqoZJTHCaFIW6ajhqcbewBWoQDkGn1BNR/J19Q1u82Tx3D8JAwBh2WciE04M0ff/Tj+XPc9pUKrq5mEMq9qwpsKBt2Icjyss9f/d7qGB+Z4XluM1sE4Z6jyFO9emxRSCbgSEXKR5iiJTL+Tb45XOtHz2dwRAe5FOPkwSVlbiEue5FaJYBUmXxj/xIuMwiT0PCG9gpCuk2hjz+aMRSMiXapGfs9iE6jonNORXytRl4aW0eXsXxDD3ap5HYD8/2nKf8tQNfS29HQA7mcHltDO0IcA5997drBJdPo8kwZkEmutGQ+zaSdO1MaMl1kJ7gQHyPS0vKCFYlTthuhW8IfETFXTWljpfHb8FqDC6AqZIzcby29evMJ+g8mR7gl7UlMgZjdaY0wrmpwBFOW4bEwxxDWry6tl4J+pzsQ+8SnH32SMNYcy72VifUp/xi4+l0+MkPcgRPMQ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(376002)(366004)(346002)(136003)(451199021)(41300700001)(6506007)(33656002)(186003)(83380400001)(478600001)(26005)(71200400001)(38070700005)(55016003)(9686003)(2906002)(7696005)(86362001)(5660300002)(52536014)(66556008)(64756008)(66476007)(66946007)(76116006)(122000001)(4326008)(6916009)(66446008)(8936002)(8676002)(316002)(82960400001)(38100700002)(15650500001)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?za4BVGwM0C+y4U6NOV1AimSWcc3ZkB/dZjmCKmqzE2AlSXL8LEHlb8cSRDvR?=
 =?us-ascii?Q?UzAc8HyeUHik1DtbQs+WL0n4re5bfYlysx8cPckB+wDMa31jwBOj04oWTAV+?=
 =?us-ascii?Q?gT71e32YVKkkG2cV5pKPia3r84IHamkDV1N9bvovAUUNiS4X6ZeLaUgHBjDQ?=
 =?us-ascii?Q?mJVaT7+JTEPUoQ8NzKD25O9Yn7BU5oBe6IjLsOEi8RaC09w3eB+jLHuf9qQK?=
 =?us-ascii?Q?NqKsOx0MvxgP8OJg/xIXVUXEGahO0T1EY/Ew/EzsFLj5zgk5WiQiLoIKhiYk?=
 =?us-ascii?Q?D/EFx9A+ZsEXYCTacMa6CzsJQE7P2gOFvRHvsivRYMS87ocnhtQT1da8Rd/u?=
 =?us-ascii?Q?CTv7VJdB6/ZBOY/VaRedm95uH8v9yts2jl48muLdvL/LWL6USl6wpCnWc9go?=
 =?us-ascii?Q?k+zeKP8jsv2PvvMoQrmt2qLmQbUDqeuMe8Q4fKJsJtw5g4tDiCQAMTWHbWe+?=
 =?us-ascii?Q?iMoqy+ERJs4s0InH0jXDYGsh14xf7V2C77Gqzi73FNt2TOJurUDdVPtL2V5l?=
 =?us-ascii?Q?/sx8RQji3S6jYPeint8q1sfusaue7jatkdwT4Fmx36p7bLGTIFmTF4qpQro0?=
 =?us-ascii?Q?aMHjU96+AQdX5NIWxtkU0J7HCk4t2h2b5NQIAPMk34/PU8l3dO79BisGrWCL?=
 =?us-ascii?Q?5zEjPYhsXL268nJVXvT2qjYrHsArUnlgD03KO1HGRG3KLPuVKbDIFQeC8qC1?=
 =?us-ascii?Q?jc3RY7MJ/unNl1Z8obglz2xweNjGpicFCtFT4+z5MiT7XTjSJYTfkFFRoYWg?=
 =?us-ascii?Q?fQmG0LyRpOvB6V8jgYPK+Q6XE9UFjPqlak3e1YP9QbA2YPVVxB2wRGpvnYn7?=
 =?us-ascii?Q?K1tHDGowAtef2pATmzAEcKCu26NqBCEttMfkta0KMZzuDcr/rfjRtgA+28d0?=
 =?us-ascii?Q?Y2MYBLw3dyyZtv2xW7ZuL3YhOLIg9MXUslqp8IA76FLaO8w9er0agz3UIaTf?=
 =?us-ascii?Q?FmEyOF7NrR7EXfjYGXAOWEQguqZwTW8ow7FQGXWqmh4qsM2P+PqTjnpLUlim?=
 =?us-ascii?Q?5BUSx1Cyab4Cobo1YdCIhMMg2qLwShkgwriGduNV+Sr2GSk/9a5oclcOnRmt?=
 =?us-ascii?Q?0AJTMWg9BDImPT/XGVE4sIct6yoRzcviLXPTJh8pK/usIPXbZQwf4A9njkdL?=
 =?us-ascii?Q?QyJsWU1X9iPyndUbV7sl9uN+gAR8aq0ql8oUYqNntZ1HESyPzs9wc+QSEkPj?=
 =?us-ascii?Q?YJ7cqp1WKX2/34rRZHtFTwa0LE0UyV57rw3V4l99H9kVopx12uQurDLK6M+S?=
 =?us-ascii?Q?HAv86cIplCq6z8vJhpHYo5DAAOCb91lEJ7mdTeA6WL8f8PUkbvzN4Bm03rHO?=
 =?us-ascii?Q?QmZqONzVj3qsHCeECTcpT8WU3vFq2aMZgTuWT8efVl+w6VycQbNfuAzUYsx1?=
 =?us-ascii?Q?vQaCvOSRfVaY7UDtkzyv2vifNmdXOnu6NtBoqo708fgoASXQwOJLxqirraA0?=
 =?us-ascii?Q?lkC4bS7I08arKunc4xbwmZAU+aEg3c4MgkQ4PttA34BflTQILLihOadJp5wd?=
 =?us-ascii?Q?JebrfjlX6Trx76Qo54iAfQY3p7GwgraVRxGIEBmc3Q/T+naK/wsCypQNrdBR?=
 =?us-ascii?Q?opJt3RP/U6l3zNcubbayseETxP1iXNIL9GuQt8E+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b97fe2b6-a128-4485-e77f-08db8c85235c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2023 20:32:45.4661 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bvD4eBcgyf5EW53dg78YjoEHO3M5sXRO0GemLRWdzj4ABZIpz8CwoLQ7C/5PEVkCy2XNREsOi0q8PQbt3HYM6wmQfjihEHOH1iXzY3EjViI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7098
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
Cc: "Kim, Dongwon" <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, "Chang,
 Junxiao" <junxiao.chang@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>,
 Peter Xu <peterx@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jason,

>=20
> On Mon, Jul 24, 2023 at 07:54:38AM +0000, Kasireddy, Vivek wrote:
>=20
> > > I'm not at all familiar with the udmabuf use case but that sounds
> > > brittle and effectively makes this notifier udmabuf specific right?
> > Oh, Qemu uses the udmabuf driver to provide Host Graphics components
> > (such as Spice, Gstreamer, UI, etc) zero-copy access to Guest created
> > buffers. In other words, from a core mm standpoint, udmabuf just
> > collects a bunch of pages (associated with buffers) scattered inside
> > the memfd (Guest ram backed by shmem or hugetlbfs) and wraps
> > them in a dmabuf fd. And, since we provide zero-copy access, we
> > use DMA fences to ensure that the components on the Host and
> > Guest do not access the buffer simultaneously.
>=20
> So why do you need to track updates proactively like this?
As David noted in the earlier series, if Qemu punches a hole in its memfd
that goes through pages that are registered against a udmabuf fd, then
udmabuf needs to update its list with new pages when the hole gets
filled after (guest) writes. Otherwise, we'd run into the coherency=20
problem (between udmabuf and memfd) as demonstrated in the selftest
(patch #3 in this series).

>=20
> Trigger a move when the backing memory changes and re-acquire it with
AFAICS, without this patch or adding new change_pte calls, there is no way =
to
get notified when a new page is mapped into the backing memory of a memfd
(backed by shmem or hugetlbfs) which happens after a hole punch followed
by writes. We can definitely get notified when a hole is punched via the
invalidate notifiers though, but as I described earlier this is not very he=
lpful
for the udmabuf use-case.

> hmm_range_fault like everything else does.
>=20
> > And replace mmu_notifier_update_mapping(vma->vm_mm, address,
> pte_pfn(*ptep))
> > in the current patch with
> > mmu_notifier_change_pte(vma->vm_mm, address, ptep, false));
>=20
> It isn't very useful because nothing can do anything meaningful under
> the PTLs. Can't allocate memory for instance. Which makes me wonder
> what it is udmabuf plans to actually do here.
It is useful for udmabuf because it helps ensure coherency with the memfd.
If you look at patch #2 in this series particularly the notifier callback (=
update_udmabuf),
it just updates its list of pages and does not allocate any memory or do an=
ything
that would cause it to go to sleep other than taking a mutex which I plan t=
o drop
in v2 as it is not really needed. With that removed, I think it seems ok to=
 call the
notifier callback under the PTL.

Thanks,
Vivek

>=20
> JAson
