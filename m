Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7598575ECDF
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 09:55:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 978EF10E27F;
	Mon, 24 Jul 2023 07:55:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3719B10E071
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 07:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690185313; x=1721721313;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=K3FOcD33gchFNEScTNWh/DUDsSv4RZ9DfGvwfJywgNk=;
 b=d57l11CdlV9zWgfXAANEziR3veg5dZS38l4j9PbvyUs8ZvMnmInS8pY1
 HBKc+3AaagltxXxAU/fcJuDW2Wp5DDjE5LxtYn6N952AHfbaoMFk87oSJ
 a90FafWaQPzwnv03qtnpJVpkClGnpjFNXN/X3eyo0VPjsa8iKNYIWR6+1
 bXrVlHMRu8C6ZuRZRM4iyE8zR785QF6UcINcKjvXApPrIV3gd0Z4Tj/IE
 1YZ+v/3Ut79sJmdLo9dFQNZMLFhWDQM/SPDpx97tBlT6FsKhatMeJJV+W
 rBRzSw/G1ClsplHgeRSjKvbBWydh5F081Qws0wwm/+R9CbNxftxibByEe g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="366267279"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="366267279"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 00:54:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="899422876"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="899422876"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 24 Jul 2023 00:54:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 00:54:40 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 24 Jul 2023 00:54:40 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 24 Jul 2023 00:54:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NOOw+4Z6YmDS8+PCqhaKreTHzqRftyXZrr9QSDutAeo7D0TqRUYaV1C7pCEqhaPrtJIz1zLsPmN247n7vg8Gj2PK4juIxIE1M1r4t6lsMLBVbaHGlfriyuJxWCQBaWOMNEcRgKdet5O6/5XnaUBtQS+RTKITGSgNvBXTO9VkeCfJYJC9y3OxEMol7MlHjOHKAQYgsimq/uzFciWdJuSqrO1Lu1Lvqvp7F8DNm4cb3NML1EJIGRWpJQPxVGS1bclY2pkibedzOg1K/fbxb3LBI9x6jX6gMVNWNCrXnqHD4uD80iqs3OeE3RkP1q/FjULwcbz84RUuqM4mfFf9Ml+M6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rYFLioKFWBgbvNLGD88GHxUOdbqKqSGOTYtmWe7iF9Y=;
 b=bvGX6nN9754HoUliEgUYNERNNZjg4TJtDTgLHu4hAcI9xJ481VWOSQY3I0QnBxCCqKlyTqIEYF8QHm9zhh9lvqYlIVIhOOJV90+bW6tsi3YiYUaetK5I/pYleFAltrQEiSXBS6KAECESWuBY0AeSrxR1mKk2XvmYOzD2XbWE0I3Y10Ijo2pd0Y93HQIZOeQuWKWhXkODVIWU7Ha9t8p6eHohzsfUJadHrcGOdyPo4PKqQw4BQ2+jeb4QI+NnD7ang0iqq5HYhj/l72H1IWUfpAnXz+o0rXSlUR6e/bAZbAwjUVG1ct98Ha2TIDnWWCIkfk90iCskvUqFWXyRkoETOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by DM4PR11MB6237.namprd11.prod.outlook.com (2603:10b6:8:a9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Mon, 24 Jul
 2023 07:54:38 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::468a:4b39:392b:d9a9]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::468a:4b39:392b:d9a9%5]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 07:54:38 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: RE: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Thread-Topic: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Thread-Index: AQHZuVToVshy99YkkE2dGyNcPWpnjq/AWUSAgAGkBBCAAGFsAIAF9M/g
Date: Mon, 24 Jul 2023 07:54:38 +0000
Message-ID: <IA0PR11MB7185EA5ABD21EE7DA900B481F802A@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20230718082858.1570809-1-vivek.kasireddy@intel.com>
 <20230718082858.1570809-2-vivek.kasireddy@intel.com>
 <87jzuwlkae.fsf@nvdebian.thelocal>
 <IA0PR11MB718527A20068383829DFF6A3F83EA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <87pm4nj6s5.fsf@nvdebian.thelocal>
In-Reply-To: <87pm4nj6s5.fsf@nvdebian.thelocal>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|DM4PR11MB6237:EE_
x-ms-office365-filtering-correlation-id: 9a32c72c-a746-4e4b-b710-08db8c1b3ad0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uHPjh51IcLJcclSdH89zYh0FghOI7V6HiNmVxbwgEvV2SLdTtH7BRS5qG9kuKUDHtfEhRc6Pe36hY7kpjQ1+7pyPjTL6BAINpnxBRijQTEdY8dtv8KfXAgwgQ08jHFKqE12hjO0hmUL8DWNs1xKTFbVLbNRqlkJwr9SHbO523qx7cVruBSX37oA06pzlc2OxEQ0GM9HQqxXfedpYEcytzRRulv0uQGM0xkttDClejM/NAY1MAnI9FIcRv3x+kPc0qwStHVcJVRMOngDcrARhYOb9HpYkYtrFfhrdlcwov3hPgQuxeVEUks/KWxbIk7BU4RI4SHedSCTAj11GT7m2lEA0l0gm+JjbQiBqedFDyIuGNBgcbkO6Ler7khf3nmAOwqAiEeYIwraTzOlaVI4Uxw/n4yuUph1o6kN6knNeyZWA5Kfhw9/pZKYrjp8jfcNlT9pXnieRcOZUgCaWbLHWFWxbmhYSBdqQFPnU0GWKoe0K0v6ZDJPUN8Vx4InQIpo0A8WUCQWXwhoiKRSC1NeWYLg6t0dngTRjqm5ikt/nPr6pmEM7432fIswH9F972JhSHfx0AKAB3fvr9iVu/iowY0ku2Mx20JrsRlF0Nvz2POKsB1+lgUr8wmqAiRCO4IPk
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(136003)(346002)(376002)(39860400002)(451199021)(38100700002)(15650500001)(52536014)(5660300002)(186003)(33656002)(122000001)(82960400001)(83380400001)(2906002)(55016003)(64756008)(6916009)(66446008)(66476007)(66556008)(66946007)(4326008)(316002)(9686003)(76116006)(7696005)(41300700001)(38070700005)(86362001)(478600001)(71200400001)(54906003)(8936002)(8676002)(6506007)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZpmlNZkCLSL9/xFWCoLSD33gsxJwv3ydDhNqD5r78LO2lwPY7dW2//FnnFS6?=
 =?us-ascii?Q?6dT74BGNfoJdFrrI2J3ym0V+cUDHRckX4Tj6CUr+uTzXPUB7mhV8eNMvtuBz?=
 =?us-ascii?Q?eWSZsY4LnECLCsy74bNPMxmmvttWInFOooFB5FmT4aNRuoNallOmkIcys7i/?=
 =?us-ascii?Q?WXrEOBcLLAJ0aOMW0b3cHG3X+2Ur7yLul7v+Dmiz4JOuUNYGRcUf8WbkJDn9?=
 =?us-ascii?Q?5jwzWGNZ5dMKWSeFPF0AohO5wYmw3DHKonaqqTSnyHMUo2ZcJop5AtU5kB5s?=
 =?us-ascii?Q?CFd6n6/TPnY+daf1FDGGpdXNjcQuXhj8rN2v33nEEsrvdFNodu+FYL9ifpeZ?=
 =?us-ascii?Q?d82PLZECwCzUZcvwm433ufA4sHj3C57pQn/HPSx6VxD/2Q2hkk6gG6cq5O6U?=
 =?us-ascii?Q?+LGwtwQpbLjP8IFeWq+IU214Y7RDPc6U3fwVyboVZ0lE5Oagfqq/6XuhyQLW?=
 =?us-ascii?Q?mAv/h2Owg1PVVWSQez2j2c2PHWPl0EOHvf3CSN5lTmYfjZBVblwgOVVGtPRB?=
 =?us-ascii?Q?dYeDW0kD6x9OQZVG/DtD7y1yFWLVEYivUp9x6u30oOIXgFF10HpYpk9C4idM?=
 =?us-ascii?Q?DBQzM61ECkAMfRj0o/qmf2L1AhNxN+zzHmtJGzB0qM4VYACTIthg2gYSzY4s?=
 =?us-ascii?Q?S507FjACiA9mYenkm0nuvGmuldNr2r2CCdfQP60HBq36kbeRDsvLxPVqcuPM?=
 =?us-ascii?Q?Mfy/HZFm6hWuZNU7uyboLzc42MjKebjTdy6u22cZfmyDxcL8uZIjnt+q6kR+?=
 =?us-ascii?Q?UEz3wceXs9gLmuN3ZEPWwkByNkbM/ztaW58WxQDMz24CjLVUPvkrTz6LnxTP?=
 =?us-ascii?Q?5387O2l//QRWJ8o36OhYM7ZO1K3bgPNc0I/p6plkwZlpWfWYna+96Siqs27M?=
 =?us-ascii?Q?R81pUu4TpJ9jrF4l0iKkHuONq8LnGTbnL39ksdrwJLPlB2Tw7AHcHZlo6GQT?=
 =?us-ascii?Q?CxOM+4GfJFPfxNdfzAHtFiI4hUqvD9IuUtNhTgpLr2GN/jzd5jR6Zqy9LO7M?=
 =?us-ascii?Q?r5f9qUq8BcsSvuBeqQ/XLspvEobGF0hNv0MJnXTO/YXjTqEpH75R8n5TBV3y?=
 =?us-ascii?Q?zk7WbVCjkl2rlbHJFOsZmiyLayfJhuHcG41/oHmdS2Xd9FJIUI6u0ReZs4HI?=
 =?us-ascii?Q?8XSI+gIT33PCq6XlQNimtjp5tfSmMWXLN1mPr+c8hHdsjjX5MB/tuYKrjzyh?=
 =?us-ascii?Q?ZsQkeCN3c7q11j33/h7t4GWYftvGYp3FjsD72q1i3n/AdR+G1pm7SuziexEp?=
 =?us-ascii?Q?j6KPp5/WAPaRiF+IJ6S3tlQLJ3U8HXOdiTyV2lqyc3tuBCi1go2Dn2XVdll6?=
 =?us-ascii?Q?ZbAZbtueum5kuF8pqSreyGk/69BPei/uxXLXpN+x6okAfZhSpw5MHckSIQ62?=
 =?us-ascii?Q?aCGnrsvLs1mymN6MsBbQJNR00Y9fSaGmsjx6SzyWasLsRNyDH5T4iPt/Wuzy?=
 =?us-ascii?Q?TMiS0w/gyAVGYW/L1ja81ePHIi4uR0Yd6Mq7U9MkP/xudJ07nEwE3H9sbYBL?=
 =?us-ascii?Q?DdM/UeNCesevMDGVr2PX/SnVVBHi1c9de+oRz2rlr8zCA0zgRlf6BXwdDX6O?=
 =?us-ascii?Q?YT2ELttC/nyTrMFDam3oorVAUCRlD0Qpu7F/PuW/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a32c72c-a746-4e4b-b710-08db8c1b3ad0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2023 07:54:38.1252 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PN7660hFChEMCKkQFEnO8low+KV8gX5YnrN6QdxdD/NOYitVt3bFaLRb66Y4ByLp7J1YTwdJInI9cNJ2uQLq7eqDsZQaePNzxT36ve2ZUDg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6237
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
 Hugh Dickins <hughd@google.com>, Peter Xu <peterx@redhat.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alistair,

>=20
>=20
> "Kasireddy, Vivek" <vivek.kasireddy@intel.com> writes:
>=20
> > Hi Alistair,
> >
> >>
> >> > diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> >> > index 64a3239b6407..1f2f0209101a 100644
> >> > --- a/mm/hugetlb.c
> >> > +++ b/mm/hugetlb.c
> >> > @@ -6096,8 +6096,12 @@ vm_fault_t hugetlb_fault(struct mm_struct
> >> *mm, struct vm_area_struct *vma,
> >> >  		 * hugetlb_no_page will drop vma lock and hugetlb fault
> >> >  		 * mutex internally, which make us return immediately.
> >> >  		 */
> >> > -		return hugetlb_no_page(mm, vma, mapping, idx, address,
> >> ptep,
> >> > +		ret =3D hugetlb_no_page(mm, vma, mapping, idx, address,
> >> ptep,
> >> >  				      entry, flags);
> >> > +		if (!ret)
> >> > +			mmu_notifier_update_mapping(vma->vm_mm,
> >> address,
> >> > +						    pte_pfn(*ptep));
> >>
> >> The next patch ends up calling pfn_to_page() on the result of
> >> pte_pfn(*ptep). I don't think that's safe because couldn't the PTE hav=
e
> >> already changed and/or the new page have been freed?
> > Yeah, that might be possible; I believe the right thing to do would be:
> > -               return hugetlb_no_page(mm, vma, mapping, idx, address, =
ptep,
> > +               ret =3D hugetlb_no_page(mm, vma, mapping, idx, address,=
 ptep,
> >                                       entry, flags);
> > +               if (!ret) {
> > +                       ptl =3D huge_pte_lock(h, mm, ptep);
> > +                       mmu_notifier_update_mapping(vma->vm_mm, address=
,
> > +                                                    pte_pfn(*ptep));
> > +                       spin_unlock(ptl);
> > +               }
>=20
> Yes, although obviously as I think you point out below you wouldn't be
> able to take any sleeping locks in mmu_notifier_update_mapping().
Yes, I understand that, but I am not sure how we can prevent any potential
notifier callback from taking sleeping locks other than adding clear commen=
ts.

>=20
> > In which case I'd need to make a similar change in the shmem path as we=
ll.
> > And, also redo (or eliminate) the locking in udmabuf (patch) which seem=
s a
> > bit excessive on a second look given our use-case (where reads and writ=
es
> do
> > not happen simultaneously due to fence synchronization in the guest
> driver).
>=20
> I'm not at all familiar with the udmabuf use case but that sounds
> brittle and effectively makes this notifier udmabuf specific right?
Oh, Qemu uses the udmabuf driver to provide Host Graphics components
(such as Spice, Gstreamer, UI, etc) zero-copy access to Guest created
buffers. In other words, from a core mm standpoint, udmabuf just
collects a bunch of pages (associated with buffers) scattered inside
the memfd (Guest ram backed by shmem or hugetlbfs) and wraps
them in a dmabuf fd. And, since we provide zero-copy access, we
use DMA fences to ensure that the components on the Host and
Guest do not access the buffer simultaneously.

>=20
> The name gives the impression it is more general though. I have
I'd like to make it suitable for general usage.

> contemplated adding a notifier for PTE updates for drivers using
> hmm_range_fault() as it would save some expensive device faults and it
> this could be useful for that.
>=20
> So if we're adding a notifier for PTE updates I think it would be good
> if it covered all cases and was robust enough to allow mirroring of the
> correct PTE value (ie. by being called under PTL or via some other
> synchronisation like hmm_range_fault()).
Ok; in order to make it clear that the notifier is associated with PTE upda=
tes,
I think it needs to have a more suitable name such as mmu_notifier_update_p=
te()
or mmu_notifier_new_pte(). But we already have mmu_notifier_change_pte,
which IIUC is used mainly for PTE updates triggered by KSM. So, I am inclin=
ing
towards dropping this new notifier and instead adding a new flag to change_=
pte
to distinguish between KSM triggered notifications and others. Something al=
ong
the lines of:
diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
index 218ddc3b4bc7..6afce2287143 100644
--- a/include/linux/mmu_notifier.h
+++ b/include/linux/mmu_notifier.h
@@ -129,7 +129,8 @@ struct mmu_notifier_ops {
        void (*change_pte)(struct mmu_notifier *subscription,
                           struct mm_struct *mm,
                           unsigned long address,
-                          pte_t pte);
+                          pte_t pte,
+                          bool ksm_update);
@@ -658,7 +659,7 @@ static inline void mmu_notifier_range_init_owner(
        unsigned long ___address =3D __address;                           \
        pte_t ___pte =3D __pte;                                           \
                                                                        \
-       mmu_notifier_change_pte(___mm, ___address, ___pte);             \
+       mmu_notifier_change_pte(___mm, ___address, ___pte, true);       \

And replace mmu_notifier_update_mapping(vma->vm_mm, address, pte_pfn(*ptep)=
)
in the current patch with
mmu_notifier_change_pte(vma->vm_mm, address, ptep, false));

Would that work for your HMM use-case -- assuming we call change_pte after
taking PTL?

Thanks,
Vivek

>=20
> Thanks.
>=20
> > Thanks,
> > Vivek
> >
> >>
> >> > +		return ret;
> >> >
> >> >  	ret =3D 0;
> >> >
> >> > @@ -6223,6 +6227,9 @@ vm_fault_t hugetlb_fault(struct mm_struct
> *mm,
> >> struct vm_area_struct *vma,
> >> >  	 */
> >> >  	if (need_wait_lock)
> >> >  		folio_wait_locked(folio);
> >> > +	if (!ret)
> >> > +		mmu_notifier_update_mapping(vma->vm_mm, address,
> >> > +					    pte_pfn(*ptep));
> >> >  	return ret;
> >> >  }
> >> >
> >> > diff --git a/mm/mmu_notifier.c b/mm/mmu_notifier.c
> >> > index 50c0dde1354f..6421405334b9 100644
> >> > --- a/mm/mmu_notifier.c
> >> > +++ b/mm/mmu_notifier.c
> >> > @@ -441,6 +441,23 @@ void __mmu_notifier_change_pte(struct
> >> mm_struct *mm, unsigned long address,
> >> >  	srcu_read_unlock(&srcu, id);
> >> >  }
> >> >
> >> > +void __mmu_notifier_update_mapping(struct mm_struct *mm,
> unsigned
> >> long address,
> >> > +				   unsigned long pfn)
> >> > +{
> >> > +	struct mmu_notifier *subscription;
> >> > +	int id;
> >> > +
> >> > +	id =3D srcu_read_lock(&srcu);
> >> > +	hlist_for_each_entry_rcu(subscription,
> >> > +				 &mm->notifier_subscriptions->list, hlist,
> >> > +				 srcu_read_lock_held(&srcu)) {
> >> > +		if (subscription->ops->update_mapping)
> >> > +			subscription->ops->update_mapping(subscription,
> >> mm,
> >> > +							  address, pfn);
> >> > +	}
> >> > +	srcu_read_unlock(&srcu, id);
> >> > +}
> >> > +
> >> >  static int mn_itree_invalidate(struct mmu_notifier_subscriptions
> >> *subscriptions,
> >> >  			       const struct mmu_notifier_range *range)
> >> >  {
> >> > diff --git a/mm/shmem.c b/mm/shmem.c
> >> > index 2f2e0e618072..e59eb5fafadb 100644
> >> > --- a/mm/shmem.c
> >> > +++ b/mm/shmem.c
> >> > @@ -77,6 +77,7 @@ static struct vfsmount *shm_mnt;
> >> >  #include <linux/fcntl.h>
> >> >  #include <uapi/linux/memfd.h>
> >> >  #include <linux/rmap.h>
> >> > +#include <linux/mmu_notifier.h>
> >> >  #include <linux/uuid.h>
> >> >
> >> >  #include <linux/uaccess.h>
> >> > @@ -2164,8 +2165,12 @@ static vm_fault_t shmem_fault(struct
> vm_fault
> >> *vmf)
> >> >  				  gfp, vma, vmf, &ret);
> >> >  	if (err)
> >> >  		return vmf_error(err);
> >> > -	if (folio)
> >> > +	if (folio) {
> >> >  		vmf->page =3D folio_file_page(folio, vmf->pgoff);
> >> > +		if (ret =3D=3D VM_FAULT_LOCKED)
> >> > +			mmu_notifier_update_mapping(vma->vm_mm, vmf-
> >> >address,
> >> > +						    page_to_pfn(vmf->page));
> >> > +	}
> >> >  	return ret;
> >> >  }

