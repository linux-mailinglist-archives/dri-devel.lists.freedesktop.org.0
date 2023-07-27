Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B917648B4
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 09:34:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C83C10E4FB;
	Thu, 27 Jul 2023 07:34:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5D4710E4F8
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 07:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690443274; x=1721979274;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ig7AKjTcNeXvQlc1lZ9u1Y+hEGl/SHGY9kXaswR6q/I=;
 b=Q7j3kFhVms/IUTHKDDG1KXvi9xS0u5q5V0Ue95zeif3w31bEComETiFe
 FleRz5dr8JQ0Kq+Lq/vb7e67Huj+N9BtEIph45il516XfH4E6E0iaoEoS
 BXMeJUyV5GyoaUwph42XmO3dKGa3Zcb7CZoNcU2zq/Dm0p1cMB42JFKYH
 PBXxoLg1kFznsoyJ0Z3QJ5jqQlRvNR9Qnvs1Sdb0MmQovzvoi2SN6VVXS
 q6Ds2t86VEQSrdcjCjfgJIGwzpIaE3mmTU3MLfrhrC9UfC8hDbQaYi9c/
 hKKjgLmB6Hp+GBVBs6Pgxj/nLvt+1bxjLCa2RHTC//9cE3NzNdgnK6ztD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="368250606"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; d="scan'208";a="368250606"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 00:34:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="726837240"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; d="scan'208";a="726837240"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 27 Jul 2023 00:34:32 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 00:34:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 00:34:32 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 27 Jul 2023 00:34:32 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 27 Jul 2023 00:34:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l1H3ZPmrYNbQTGjJT7IXkxwYTiAMmwr+vorBMZSIsOYWCsMEQw9rNCkLnjlcHqcENW1NlRaJNN4tdoDehdCE380rSFDjm3zkWtvVSZ7KyR1wSpeC/QaugedGMNcc7xhOOLo8HvddTjh6cABTB3YRajAEpb8ax8MoNkHFptedkkX/onHuhexXJ520cQ+HC/59ivxzhKKiIQ4gFu2NYHvR29xcFvZ85LQ6L8/uNdWHzSqP24FL5gOy3m8euyoTb7ArACNtMwok4hXhCWTpi9tbpKHSj9Q5/aU6rL/6AMikxB4fMFlbZT92KPMLp4NgCJAtFYT1A7qHe4/Y6DG7jWVi0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CJCdtNU7UZqbdsPs0hQiV/kQ4ICJZsdI+lyYqVFDMtU=;
 b=B6gfjLJ3IyRuNfpTQzf+hK9DzrpxLCG+dX4DOueNCecTyRKobDyt8r36J0ELS0FDGEsLG0ojdptRY+bDJbn2EuhgXnXGDUiAM2Cs5o5d+1RxWbr6Le3rDcibos5rKMf3sBrvxbxUp2e0zZwbrR3PdOfgz9HKy+vi/GlRrE5moLe7ecEXKvwpgBvalZ4XyuR8iPoxpTYaUmPPXz6W+diB2eNLgvo9WdvGP3EyuHdfQPq3UOSk4MYcSrRRQSZ44BlSetQSUZiWBaQ86Y590HrTHJk6+uuvpLvMzx5MsRAzNzvmgyNRKgwwGZAX3As03tFXlbMfXF2cztT/rVpUoN23Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by MN0PR11MB6230.namprd11.prod.outlook.com (2603:10b6:208:3c5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 07:34:30 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::468a:4b39:392b:d9a9]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::468a:4b39:392b:d9a9%5]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 07:34:30 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: RE: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Thread-Topic: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Thread-Index: AQHZuVToVshy99YkkE2dGyNcPWpnjq/AWUSAgAGkBBCAAGFsAIAF9M/ggAChIwCAADi24IABSWKAgABl6ECAAEZHgIABcLAQ
Date: Thu, 27 Jul 2023 07:34:30 +0000
Message-ID: <IA0PR11MB71853E11B6C419DC0D043953F801A@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20230718082858.1570809-1-vivek.kasireddy@intel.com>
 <20230718082858.1570809-2-vivek.kasireddy@intel.com>
 <87jzuwlkae.fsf@nvdebian.thelocal>
 <IA0PR11MB718527A20068383829DFF6A3F83EA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <87pm4nj6s5.fsf@nvdebian.thelocal>
 <IA0PR11MB7185EA5ABD21EE7DA900B481F802A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZL5+CiZ6w4RdAt5u@nvidia.com>
 <IA0PR11MB7185D67DD07FEF0C92789D7AF802A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZL/B6yvO1bIkFRcF@nvidia.com>
 <CH3PR11MB7177FA18562FCED8A3171007F803A@CH3PR11MB7177.namprd11.prod.outlook.com>
 <ZMBSWxYnWLlzG3+6@nvidia.com>
In-Reply-To: <ZMBSWxYnWLlzG3+6@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|MN0PR11MB6230:EE_
x-ms-office365-filtering-correlation-id: 5fb70d86-a645-40e6-59be-08db8e73ea33
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZKNCRW/T/GUUsDS/NRhFpnAWJv5TCw5bgRCBCyvV47SbD9poL6AxPsktQVjlnfc3rGl4JDCIaysx/8UlRHMKx7mfaQe6/eI3MY7wp9De/IHNjB5g0GtOZxWe5/5C5fMeuusMSb+/DKX07SZqIkDjLtOp3xQdyQ0PRImAC6mwyX6HiTCMtJKX5SOKQYcXgic4I819/3MAxKclqdfcRYxh+7yjil0mQio8NLsNIaAMTMO9ZEKZa/NUD3J2K5OW5wUkHI4puvxN4aD+Uc1ceqH3WC0FulywYnCJyF/OwLGf04VpFzCTyx9BcJ3LLaZnI+T9x6feD2BeQbgDF40SZLcIpT/omWOLrzH3d1ZkFzF7for0bCCH223kPwbilRvBoeEJqloRUPq84Usz543wvKccoOK6Zrtcgtq/EqxLH2lOjCRJlSVlVpEqzisTeXx0O6SqFV17zXHeKOsiUXq6RqzMN3KjT8y3IItqx69qaqr9Xdcvy56MlwDvCsS2oviHYsu/XEfF5hfSwAuTcx6vYABzjs3zoB+Br1KCAuWAD2CSY4GFOT+2E5QYkcFiIq7INSX1RCidOUDJaopffIpoHpkOtDGPEqO/1S2Yui9e7y2lkP4X4cpNN+UJxnp9lfBtEp2H
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(346002)(39860400002)(366004)(376002)(451199021)(38070700005)(2906002)(15650500001)(83380400001)(7696005)(71200400001)(38100700002)(186003)(52536014)(5660300002)(86362001)(66899021)(55016003)(33656002)(316002)(26005)(6506007)(8676002)(8936002)(41300700001)(6916009)(4326008)(66476007)(64756008)(66946007)(76116006)(66556008)(66446008)(9686003)(478600001)(82960400001)(54906003)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?z0VMQ20zfTXHKcz2CLREdM/eCVJiNznsyJa2mveXPmnVp6+VAneDH9cDh69K?=
 =?us-ascii?Q?t//9HJxjQsuMXF8buV9nEs3KH5+RLfuYBAVTrABcYTzomEk+fgBShl/aSJ8l?=
 =?us-ascii?Q?MPumNy1UGS+1tLKUkWfNhBQFT+npnq95u+2dXxMZRCprLamXeGfr5y08ONlx?=
 =?us-ascii?Q?5SstPG0Nrxp4B4EeOpOcrmInpBvbPpay4n/yKwyj36nvlhFXSI1odapqd7N7?=
 =?us-ascii?Q?rjhbCxevV+rCwnPKVTbj2HU0wpXtiZfy7doIYFvRLVSLWqobalAI1HFBvESq?=
 =?us-ascii?Q?n712zXigDG0XLf72J26i10uNdXhf0HP0JNW92Mzb5xgFHWeyVCeL2xLN/fzI?=
 =?us-ascii?Q?AvgEt/CBOOUCrRLBAMLs9OOyWobkzC9skc/wRPih5oT37G7VKIvza3h8K/QU?=
 =?us-ascii?Q?XqMDKyw4pPCnmbw1Gw/czIYTTpCC256yRikK7d82Dl9fAWVoIvJBJ78UaHFt?=
 =?us-ascii?Q?qNHXA/E7ggRXze6c+uWJaVLSIUJy9PBbCes+HPM63FTs4G3O3CROEUkm0AK9?=
 =?us-ascii?Q?374IsBH8f8iFcb9fQvVwPZuXD+dPf8gAp1J6agq0JwMMkNNOOICH8Pty05xf?=
 =?us-ascii?Q?zD146RTA+lqOtl5TblQ/occ+O2SGe3oLY1YgnJ4n6/iYhkgt2xB1+FhjbpW4?=
 =?us-ascii?Q?OqefhCt/CLWT+Hn8UFlFckKLw6Zne5Myaf72rHW0h+W1dRR2Ga9hu4E83o+U?=
 =?us-ascii?Q?jnoilU6kqrxHXxV+X9t89j8mzaGqZOpstWBHlo1SHpR0ogGpUYhjWYxgryd/?=
 =?us-ascii?Q?U6QzlLhGtB+Z76noQOVXIqRlZkHpZ4ZGriEnmzGfZmF1oA2jmCbm4SUx7+l8?=
 =?us-ascii?Q?1TbCm6bsKbasmkEkVf6ZpXGRE5drx4oRt9kY0rQ6i6lrFgH+WdsYP/r30VpC?=
 =?us-ascii?Q?YXePTvvmK7HHdLVBkGwoQSQgnIVwuVtxecfnsmK2iJ+M5w1veNS5dOy0EkRO?=
 =?us-ascii?Q?n3d6edH7I7Bclq8cqYj1tuZYBpq/WrnxXHs9pvj4woqEiSO9mQU0y5KJHG3w?=
 =?us-ascii?Q?uP/FO7VY/Qlq1A+O32dFHymxGI/52AC5T6zkmjP/AbfElCLyKCcs9ceNlJyt?=
 =?us-ascii?Q?R4nSN9v6f/K6AghOJCu5r40LDem89xPWYgHBEo6zudZwqf2uOQIcoHKFutox?=
 =?us-ascii?Q?5+KxEW9alS4kJqA7dtc3OeLSN1WUQeYoVslbR44VgvX2HGLkac9nDsgdxx9a?=
 =?us-ascii?Q?TRg2SBvexKeU0UkvpbjBVmF2P0LSfYMZM3xR/9NBS+/eqHzuHDREnR9NkBf5?=
 =?us-ascii?Q?Ulf8lwGd9M4TlEopMUK1qaiuEGmQSUttOgKk+mzWihkG6yKAdtOVrEQ8RyWb?=
 =?us-ascii?Q?VP2RdsfJKlKWONLC5gudGtSTTgkCsTYJ5ZbAUUu/rNLmuP3sdvQ+omyVJUCP?=
 =?us-ascii?Q?QiW1SGBhdesMQzvcKjWv73yyG+ok3UKT8sHQqFuMY01oxy+n0CiKnGyNVlLa?=
 =?us-ascii?Q?WuclIrm13Ueq89QMSzbclhhYBg6tvVdGTyaU2Uba2yHtnEV7hZiVgALh7toH?=
 =?us-ascii?Q?peTRapAg2DFL0rag8Uk0px2Mu8tUnE+qAm/DnSpMVrJzghE5doWE5j3sdLoe?=
 =?us-ascii?Q?BEe0Jt8gr6fvSUS7KwfqDTttQ1yvw1YOz+z7XM/f?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fb70d86-a645-40e6-59be-08db8e73ea33
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2023 07:34:30.4298 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8Lp5yMaXmwjyW04pFVetkjJ+It0AiBksHrRrRf3gnxbUOk/37s9//ylhDm5/Qc33VDpWLmF3phjtrkR7tfTAVgJeZ+XKrZUgTIQdEUCyYqA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6230
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
> On Tue, Jul 25, 2023 at 10:44:09PM +0000, Kasireddy, Vivek wrote:
> > > If you still need the memory mapped then you re-call hmm_range_fault
> > > and re-obtain it. hmm_range_fault will resolve all the races and you
> > > get new pages.
>=20
> > IIUC, for my udmabuf use-case, it looks like calling hmm_range_fault
> > immediately after an invalidate (range notification) would preemptively
> fault in
> > new pages before a write. The problem with that is if a read occurs on
> those
> > new pages, then the data is incorrect as a write may not have
> > happened yet.
>=20
> It cannot be, if you use hmm_range_fault correctly you cannot get
> corruption no matter what is done to the mmap'd memfd. If there is
> otherwise it is a hmm_range_fault bug plain and simple.
>=20
> > Ideally, what I am looking for is for getting new pages at the time of =
or after
> > a write; until then, it is ok to use the old pages given my use-case.
>=20
> It is wrong, if you are synchronizing the vma then you must use the
> latest copy. If your use case can tolerate it then keep a 'not
> present' indication for the missing pages until you actually need
> them, but dmabuf doesn't really provide an API for that.
>=20
> > I think the difference comes down to whether we (udmabuf driver) want t=
o
> > grab the new pages after getting notified about a PTE update because
> > of a fault
>=20
> Why? You still haven't explained why you want this.
Ok, let me explain using one of the udmabuf selftests (added in patch #3)
to describe the problem (sorry, I'd have to use the terms memfd, hole, etc)
I am trying to solve:
        size =3D MEMFD_SIZE * page_size;
        memfd =3D create_memfd_with_seals(size, false);
        addr1 =3D mmap_fd(memfd, size);
        write_to_memfd(addr1, size, 'a');
        buf =3D create_udmabuf_list(devfd, memfd, size);
        addr2 =3D mmap_fd(buf, NUM_PAGES * NUM_ENTRIES * getpagesize());
        punch_hole(memfd, MEMFD_SIZE / 2);
   -> At this point, if I were to read addr1, it'd still have "a" in releva=
nt areas
        because a new write hasn't happened yet. And, since this results in=
 an
        invalidation (notification) of the associated VMA range, I could re=
gister
        a callback in udmabuf driver and get notified but I am not sure how=
 or
        why that would be useful.

        write_to_memfd(addr1, size, 'b');
   -> Here, the hole gets refilled as a result of the above writes which tr=
igger
        faults and the PTEs are updated to point to new pages. When this ha=
ppens,
        the udmabuf driver needs to be made aware of the new pages that wer=
e
        faulted in because of the new writes. Since there does not appear t=
o be
        a way to get notified when the hole is written to, the solution I c=
ame up
        with is to either add a new notifier or add calls to change_pte() w=
hen the
        PTEs do get updated. However, considering your suggestion to use
        hmm_range_fault(), it is not clear to me how it would help while th=
e hole
        is being written to as the writes occur outside of the udmabuf driv=
er. And,
        there is no way to get notified or track them either, AFAICS from i=
nside the
        udmabuf driver.

Thanks,
Vivek

>=20
> If you are writing to the pages then you have to do this
>=20
> If you are reading from the pages then hmm_range_fault should return
> the zero page for a hole until it is written too
>=20
> Jason
