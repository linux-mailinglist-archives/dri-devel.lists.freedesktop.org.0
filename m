Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFAE7679F6
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jul 2023 02:47:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A528410E6DB;
	Sat, 29 Jul 2023 00:47:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E4D10E6B9
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 00:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690591628; x=1722127628;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9izxBFcfH2ck+AzJrLF2V7IqFyft59gkFsc71gccqK4=;
 b=Dk3esIGB0X8Wb7XFgvWy4CjU4fWkSb/IA/DA4/NfCNF8YABotRNhc39U
 7pE0lf9mdldPYN7Eu8C5PoYnbruqgFyQn1sQY3kWZOjv6Enh/urHuSejA
 37Vdt/DZbXOsd4lT/OpP6dGkWolbcVbNDVABoipbR5enUu8EYXtmX85Q6
 3WOIjhMqSAX3xdOp6tcUquIDEzE8F/yNJ6mrVz3dtzBNJ69T19AtNmuDo
 APo0TruFgcrmTcActKvYuR7Qo0Aq7yh1yOOhVM83R7NK5JV2ZR/l2khrL
 t36PTwvVR8gdWYVIKD5UZpsyWkQuGNKTWatC0cZ8jGULLPBMjf8QlLcMR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="366181856"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; d="scan'208";a="366181856"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 17:47:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="974257306"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; d="scan'208";a="974257306"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP; 28 Jul 2023 17:47:07 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 28 Jul 2023 17:47:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 28 Jul 2023 17:47:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 28 Jul 2023 17:47:06 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 28 Jul 2023 17:47:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KCvzrjbIykSXilIRUfMh6Baa2COy1N4D/JFA77Bnip1QdMMWCro6XASdsFnAxb7uWoTuXOC/kILa7W3PacBZBdPDT8kNw7yzmL9eqd0w84Wm9RTyLi1iRNUqePxlZzmMp7fThVhkWst2muVYKhMqWgu6x2cSoJHfh1Zdcuvn2CkRpaHGkIn91sBIdI1SfGOly7kUG+yPZ1k53uDI2cE4VH91ScHx6ekazNotCEWWAuTpojSU+bwgz53Y90Hz+Q4JCF52gXuoaegSqTAzvzGY02Fbf299ubOBFqXdXcta2hV7FGuzOELfKlQMaAOcIGjzmyEP7A3Zhl3oehTgeJnqcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9klvFuPAxNGejQJx1ZbRMxWf8q+9UTmSfOujCYHU4M=;
 b=J1Ai2c07bOsgM+JzHaomlo/NrFErXak19KGLDo9uMRTp6OltYKgZzWSSRtPlSEy5JhlPYsyHo7frYf95tYYfGHqL+kwVzk6JifvmN7n6i6OlAM7znsTp7bxrBMaoNSc87Dw9K3g8kjK/W1xZF5bvwHzaFjNiDprVZS1TY/UQFVPdb4KTV4lqPx0+UQKnyWkhfEK7LRzTKWtc1QCtpS7iL+BNninifmypn47yQJzB/le0FOrytf6Emo0IHbNhzLb9wEgSx/m8VDG47/V3CvkCNitJbPvlR7PCj1G0eBZ3u/6UP1MEqXXZVO+vGcyr7DXtCVfOPlKbfTnLNrIL25jghg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB7177.namprd11.prod.outlook.com (2603:10b6:610:153::8)
 by SA0PR11MB4559.namprd11.prod.outlook.com (2603:10b6:806:9a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Sat, 29 Jul
 2023 00:46:59 +0000
Received: from CH3PR11MB7177.namprd11.prod.outlook.com
 ([fe80::9cba:c1de:ea9f:fba7]) by CH3PR11MB7177.namprd11.prod.outlook.com
 ([fe80::9cba:c1de:ea9f:fba7%5]) with mapi id 15.20.6631.026; Sat, 29 Jul 2023
 00:46:59 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: RE: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Thread-Topic: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Thread-Index: AQHZuVToVshy99YkkE2dGyNcPWpnjq/AWUSAgAGkBBCAAGFsAIAF9M/ggAChIwCAADi24IABSWKAgABl6ECAAEZHgIABcLAQgAD86oCAAQfUEA==
Date: Sat, 29 Jul 2023 00:46:59 +0000
Message-ID: <CH3PR11MB71779C83F8A0EC6C2F3F4B0CF807A@CH3PR11MB7177.namprd11.prod.outlook.com>
References: <87jzuwlkae.fsf@nvdebian.thelocal>
 <IA0PR11MB718527A20068383829DFF6A3F83EA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <87pm4nj6s5.fsf@nvdebian.thelocal>
 <IA0PR11MB7185EA5ABD21EE7DA900B481F802A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZL5+CiZ6w4RdAt5u@nvidia.com>
 <IA0PR11MB7185D67DD07FEF0C92789D7AF802A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZL/B6yvO1bIkFRcF@nvidia.com>
 <CH3PR11MB7177FA18562FCED8A3171007F803A@CH3PR11MB7177.namprd11.prod.outlook.com>
 <ZMBSWxYnWLlzG3+6@nvidia.com>
 <IA0PR11MB71853E11B6C419DC0D043953F801A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMJbywGYN0QLh3vF@nvidia.com>
In-Reply-To: <ZMJbywGYN0QLh3vF@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB7177:EE_|SA0PR11MB4559:EE_
x-ms-office365-filtering-correlation-id: a236617a-9f3c-48e2-64ab-08db8fcd5127
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vRKAvAyt/etf1nhnvUCmWEwjCY6nsEdpwo/suMsq637VqfIHBlrD1zJE1ZqN/NLc/NYKi7GsYt8k5FOS1Akr6pzUJ/RSyN040bhFMACCRQ344oYvKPFJ1nUZnh4ulxM3jcwOFordfV/dR5plIY6JU0pjolYjk/g2+U2yRtxqLru3scb3gd4X3RbiqXFePbBe8zCB9wYIPo/EsMrYKPoRqQb0rMCWHMQgV60WAX6cTyvGMVXKevRA/QduBfEbRoxd9YwYaGE2ojYnf6q7R43c4Me3/Iwh4zF3o+k+t+asp61vrEy3MLJXPxapnD/s/yrVW9pVzn4/eAu1UqjZ3HFJvjjBWDtd4XWbQDGalxOoxKS1TsqZS5xs2gz98hVLbQwWK1efqg4pOKfAKa5P+N1xDw13jzS/0ttNCTVaWiWpsP1I9qIwf7aHX4iN/P24hHco4qaPVmh2jrP97wC4c/L0/d6LEMkl2gZEY5BWn5+do+/AIjw40kg9KTdwV7VwhJELYmE9m/R3U0y4fPHyIrKHOMI1VZjJacpa3ReCXnkdUWie1APbXNdCx9ik0Dve9ds5WqQOWKWCUnosvzRUH4U+hC02FM9LIRo4gkCf4UqtRWZ56RYoaNM/3KvOQySBiMtD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(376002)(346002)(39860400002)(366004)(451199021)(26005)(82960400001)(6506007)(9686003)(54906003)(186003)(71200400001)(478600001)(122000001)(7696005)(64756008)(66476007)(66446008)(4326008)(6916009)(83380400001)(38100700002)(66556008)(66946007)(76116006)(5660300002)(41300700001)(52536014)(33656002)(15650500001)(38070700005)(316002)(8936002)(2906002)(86362001)(8676002)(66899021)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?njiEnmAuCBUYdk/L4bde0VqCnO/kx8nqamXDbLgpjNL3FNAFtZwuBBE3Fm0h?=
 =?us-ascii?Q?p2YoNnAM7t5cjCou46r8rXiyM1G92jrQclBn0r1jch75INhVXGa0cdLQ38ql?=
 =?us-ascii?Q?DkIDumfL8TMOV23ocSpW3VusT3ZsnXF4l+PKHKYDvW7KUlIkZ3ULEZ8/iSmh?=
 =?us-ascii?Q?iZch1sE/hq7fU8mFxm5QRWFXUbRrcoxdibjYjlLl+X4u9T2Q+LOd3M48R5Xg?=
 =?us-ascii?Q?WIRftj5V7rCDhHyP9NSmerBPhWJ4CBWJ82U5O7zF61FhM55NZgZL25Pp2cud?=
 =?us-ascii?Q?bw5hvhG/gHCn90PO0XwxWWrCZWiKQ8oSvi/YgB3tZJVG0zhcHP4eLb+XTEXd?=
 =?us-ascii?Q?tlc42LHZYe2+EYDznnniTunxXeoNmMQQFLignY2jcfZ3rX5HgeFKV1EJFbKq?=
 =?us-ascii?Q?QJIiruMUAC2SeanbBrifuyleE4ahg8Hqs+naY55TDO6m2GkbAvT8i/gou3zY?=
 =?us-ascii?Q?CxwcYXBeY25oQGwLi6NP7aV/ml2ZaUi634eJ410IcfjKMEqZKZPv14cznHUU?=
 =?us-ascii?Q?0FrT6X1HAlA97qJ7H7PKRdvJ8sX1dk+d459+dYCTvlIYugLbfSUF1NEbTDDM?=
 =?us-ascii?Q?Yfc2aD7VOaYyd/xNFXURzWn1wTkPhFZ5HjumanwWthS+7168i0gxKs1QDd/F?=
 =?us-ascii?Q?JH9Nm2zzznKVu/eNp720uJycGM7wV3S8DcQtP8jyOGZCPOKWoMNXCk3KzNgG?=
 =?us-ascii?Q?+mLjwsQNjG7e5JfKo6OLU7nT+RmgJkYE1BKgnAMukPk9Z9TzieFPnK+bTILw?=
 =?us-ascii?Q?kOXpYrJCk1nvjbKolACIoBg62TrFopym4hCOFesR+VWzFyjilSzh2uEW8ybU?=
 =?us-ascii?Q?t6sC4aU+3bAij9OKYoVyDr42n0qKwuo9ACXguHJcQzA+U1TndrW7nXui5C1V?=
 =?us-ascii?Q?iMD4dEcYFIsDUHVj+aqkJiD9Op/ehMilS7T0D2JyLdAXDSltIcZGD0iAqRE8?=
 =?us-ascii?Q?KzWZ1JrB4m+BaxQSE9L2eVfVdU2YNvkHCr6QsSUp4sNtHRHO8Jt6ybzaAJ4f?=
 =?us-ascii?Q?KiOJq3HTWr4kKqyQ1iKWwpNBf4UgAY/tqEG5ZbVixA7ghhbt9N3EwxTKMRig?=
 =?us-ascii?Q?ZjnrvI+BaBfOLDMBIlNPZkwj1RIRaJlhWkdjCwuzthlh5xi/BrVs6wZ3U3q/?=
 =?us-ascii?Q?72VBo1KGjkwIP6YCwzG8u5ed60HU0Nk8BYXKBBmr7LSnIsJkTG3DqeE/z90s?=
 =?us-ascii?Q?cz+vxZB4hRheWsEwO4nsjdVDiL4Zj6rzMosmxUHx0uLxs5t1ZAyRG9nPvFUm?=
 =?us-ascii?Q?EG19oLSAO8Uw2H5ebx+wj5X7O4BLhLazmEq1krrQJu7mCRok52IRNK7TTQhV?=
 =?us-ascii?Q?aPmoZJaF8e5q+/ho2a/zIYgU2YOY4Vs3UVa2w7EuaozUGSuUcAMz5RP5YAtn?=
 =?us-ascii?Q?iFEgRIJbc0sRMTwBW+sSQuxKJ+yLo7AJlazEyCwEct/5f8ITJEISs2NgmOCL?=
 =?us-ascii?Q?heOnC9TiaAKvc5BwtdXffGff/YbVwnycP/Omsl4aliZ7ozyRkG2fEpn39W2g?=
 =?us-ascii?Q?9/nlj9oyWfDtFHpXKXgf8BiUNOAiimjTFUF9fqSW5k8rp+GvcmN+GBivcLfv?=
 =?us-ascii?Q?HTLqNHde5TukGAg9fzaRRTOG6zLuyI1Z82p4kQau?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a236617a-9f3c-48e2-64ab-08db8fcd5127
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2023 00:46:59.5461 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f67fVlF/WYzi5d3QkrX0wc6KM/dzl0f+Am6FPQdhaQwZZkQFy7kbKSFTfMkvDjEhR8gYUe/MJqlvROs2QyrjlOyfhXUsis1jroK/PmJ1lSc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4559
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

> > > > > If you still need the memory mapped then you re-call
> hmm_range_fault
> > > > > and re-obtain it. hmm_range_fault will resolve all the races and =
you
> > > > > get new pages.
> > >
> > > > IIUC, for my udmabuf use-case, it looks like calling hmm_range_faul=
t
> > > > immediately after an invalidate (range notification) would preempti=
vely
> > > fault in
> > > > new pages before a write. The problem with that is if a read occurs=
 on
> > > those
> > > > new pages, then the data is incorrect as a write may not have
> > > > happened yet.
> > >
> > > It cannot be, if you use hmm_range_fault correctly you cannot get
> > > corruption no matter what is done to the mmap'd memfd. If there is
> > > otherwise it is a hmm_range_fault bug plain and simple.
> > >
> > > > Ideally, what I am looking for is for getting new pages at the time=
 of or
> after
> > > > a write; until then, it is ok to use the old pages given my use-cas=
e.
> > >
> > > It is wrong, if you are synchronizing the vma then you must use the
> > > latest copy. If your use case can tolerate it then keep a 'not
> > > present' indication for the missing pages until you actually need
> > > them, but dmabuf doesn't really provide an API for that.
> > >
> > > > I think the difference comes down to whether we (udmabuf driver)
> want to
> > > > grab the new pages after getting notified about a PTE update becaus=
e
> > > > of a fault
> > >
> > > Why? You still haven't explained why you want this.
> > Ok, let me explain using one of the udmabuf selftests (added in patch #=
3)
> > to describe the problem (sorry, I'd have to use the terms memfd, hole, =
etc)
> > I am trying to solve:
> >         size =3D MEMFD_SIZE * page_size;
> >         memfd =3D create_memfd_with_seals(size, false);
> >         addr1 =3D mmap_fd(memfd, size);
> >         write_to_memfd(addr1, size, 'a');
> >         buf =3D create_udmabuf_list(devfd, memfd, size);
> >         addr2 =3D mmap_fd(buf, NUM_PAGES * NUM_ENTRIES * getpagesize())=
;
> >         punch_hole(memfd, MEMFD_SIZE / 2);
> >    -> At this point, if I were to read addr1, it'd still have "a" in re=
levant areas
> >         because a new write hasn't happened yet. And, since this result=
s in an
> >         invalidation (notification) of the associated VMA range, I coul=
d register
> >         a callback in udmabuf driver and get notified but I am not sure=
 how or
> >         why that would be useful.
>=20
> When you get an invalidation you trigger dmabuf move, which revokes
> the importes use of the dmabuf because the underlying memory has
> changed. This is exactly the same as a GPU driver migrating memory
> to/fro CPU memory.
>=20
> >
> >         write_to_memfd(addr1, size, 'b');
> >    -> Here, the hole gets refilled as a result of the above writes whic=
h trigger
> >         faults and the PTEs are updated to point to new pages. When thi=
s
> happens,
> >         the udmabuf driver needs to be made aware of the new pages that
> were
> >         faulted in because of the new writes.
>=20
> You only need this because you are not processing the invalidate.
>=20
> >         a way to get notified when the hole is written to, the solution=
 I came
> up
> >         with is to either add a new notifier or add calls to change_pte=
() when
> the
> >         PTEs do get updated. However, considering your suggestion to us=
e
> >         hmm_range_fault(), it is not clear to me how it would help whil=
e the
> hole
> >         is being written to as the writes occur outside of the
> >         udmabuf driver.
>=20
> You have the design backwards.
>=20
> When a dmabuf importer asks for the dmabuf to be present you call
> hmm_range_fault() and you get back whatever memory is appropriate. The
> importer can then use it.
>=20
> If the underlying memory changes then you get the invalidation and you
> trigger move. The importer stops using the memory and the underlying
> pages change.
>=20
> Later the importer decides it needs the memory again so it again asks
> for the dmabuf to be present, which does hmm_range_fault and gets
> whatever is appropriate at the time.
Unless I am missing something, I think just doing the above still won't sol=
ve
the problem. Consider this sequence:
     write_to_memfd(addr1, size, 'a');
     buf =3D create_udmabuf_list(devfd, memfd, size);
     addr2 =3D mmap_fd(buf, NUM_PAGES * NUM_ENTRIES * getpagesize());
     read(addr2);
     write_to_memfd(addr1, size, 'b');
     punch_hole(memfd, MEMFD_SIZE / 2);
-> Since we can process the invalidate at this point, as per your suggestio=
n,
     we can trigger dmabuf move to let the importers know that the dmabuf's
     backing memory has changed (or moved).

     read(addr2);
-> Because there is a hole, we can handle the read by either providing the
     old pages or zero pages (if using hmm_range_fault()) to the importers.
     Maybe it is against convention, but I think it makes sense to provide =
old
     pages (that were mapped before the hole punch) because the importers
     have not read the data in these pages ('b' above) yet. And, another re=
ason
     to provide old pages is because the data in these pages is shown in a =
window
     on the Host's screen so it doesn't make sense to show zero page data.

-> write_to_memfd(addr1, size, 'c');
     As the hole gets refilled (with new pages) after the above write, AFAI=
U, we
     have to tell the importers again that since the backing memory has cha=
nged,
     (new pages) they need to recreate their mappings. But herein lies the =
problem:
     from inside the udmabuf driver, we cannot know when this write occurs,=
 so we
     would not be able to notify the importers of the dmabuf move. Since Qe=
mu knows
     about this write, I was initially thinking of adding a new udmabuf IOC=
TL (something
     like UDMABUF_PREPARE) to have Qemu let udmabuf know after writes occur=
.
     This would provide an opportunity after an invalidate to notify the im=
porters of
     the (dmabuf) move. I think this would solve the problem with changes o=
nly to the
     udmabuf driver (including adding the new IOCTL + handling the invalida=
te) but I
     was hoping to solve it in a generic way by adding a new notifier or us=
ing change_pte()
     to get notified about PTE updates (when faults occur).

Thanks,
Vivek

> Jason

