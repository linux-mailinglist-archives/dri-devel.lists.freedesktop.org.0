Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 199ED75A80B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 09:43:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43B3910E571;
	Thu, 20 Jul 2023 07:43:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C63DB10E571
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 07:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689838999; x=1721374999;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NtZz4hWEaqY2p/RxDkk9sToT/gFhv6FiRTTW2Wlty1A=;
 b=bS5h4XKF5pABeUwhHLdvm0TOk/e8pHKVRC1Me0W2QTHQGlJ51Iduowsu
 0I75T5ZSzD8ngxKztPCCimBwTH/R4GVWSxek3q08Fs+6UOn8r5/FaF/a9
 Mt0JeJC4xsIxRLSYrn0aEfAXKKO9S+dBm3FY3mRnndf1mTTJkSRVXUxw5
 d95p5ejD9zbTcR33Swz9YKEhO7Ygv2PJQUMyRmtY/wweMvwD3OuCwJ/G9
 EFWCV+Z5F/OEICT95jksbjZ+fPsPdyZ2hCRFPCa7lEcIUw02xuAMaonfc
 fApzcKumWL2G2iVEKtFzQhLw543iHl+N329284QJoEvhvCGwU+Xsg4pVM A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="356625978"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; d="scan'208";a="356625978"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 00:43:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="759471217"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; d="scan'208";a="759471217"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP; 20 Jul 2023 00:43:18 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 00:43:18 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 20 Jul 2023 00:43:18 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 20 Jul 2023 00:43:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dYjIjS2i4fM0sxZF4NMWNAi4mYRxv25+0a0UesA1hi38Mq/thySfSmof//uv0TwGiVmyOiiClOtZYUswI5FUl7Efls+P2ORBVR5yOfY9QCofmmrAvhWBZYkGn9arPT7qo0Q386fucud9DV6pA+xAqMt9742AP3kZLJkgA0XI5C+MU3G6fgElg2vJwMxyoQqjXu+d9K1jmSxK9SGVbOaoCB5jyMn8Z6qWxNFVjENks0/N5dyL/VHcEUKXM5vmx8KOk/STIakQsJXjGAuSYoG3QVD7zIkDlWXwwkn+g9Qh/MVkbVEcZPOxp96WIAYnbAT2zJPZOIcyeGol9txyewRJEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9lAzUNPdPZ+p6aLKYlYH7aDAR40j0yYOEkV5bJVZKdQ=;
 b=HSDm06v56afg7O83BfR+Ki8HOlyaaPKAd2THyE19bYoBooZaq+tgxF2h/eyBT29yIr696gMg+69i8qshJji3NR0kIMMZDiTkpecPT9MMNelRdIw/CddcSUd+WOVqEhlsaLobkgsQ30awgXY4mJFx1O1FAETWJQbXHbV9F1te79b0SN1W8/6+jpZH6abJpDq7E5sipoYsi5dSDvTSPPZe+mif07RuzUNeTg3AR51GZ5jjJmJWykQ94lals67lixe4nhfidaEkAgSTistIJxd3Mi/R98b7vKaMvVUt+eQApmecg+H+bMqXsLI26REc1EQK2OkPlSkaoT5uknl4McFC4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by CH0PR11MB5268.namprd11.prod.outlook.com (2603:10b6:610:e3::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Thu, 20 Jul
 2023 07:43:11 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::468a:4b39:392b:d9a9]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::468a:4b39:392b:d9a9%5]) with mapi id 15.20.6588.031; Thu, 20 Jul 2023
 07:43:11 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: RE: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Thread-Topic: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Thread-Index: AQHZuVToVshy99YkkE2dGyNcPWpnjq/AWUSAgAGkBBA=
Date: Thu, 20 Jul 2023 07:43:11 +0000
Message-ID: <IA0PR11MB718527A20068383829DFF6A3F83EA@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20230718082858.1570809-1-vivek.kasireddy@intel.com>
 <20230718082858.1570809-2-vivek.kasireddy@intel.com>
 <87jzuwlkae.fsf@nvdebian.thelocal>
In-Reply-To: <87jzuwlkae.fsf@nvdebian.thelocal>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|CH0PR11MB5268:EE_
x-ms-office365-filtering-correlation-id: f7f4a012-77f8-4ae1-eb04-08db88f4f7dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /U0NpHqsWL99eoByvn0J2CNukceVxzexVAQ+yCMiIYdnNoN1DdmS1Djuh2mmSSiS8t4D/WCsnbtLL4WZTZotV6feQYx3ThnnzH+HHGiy/qQWy2Ri/Ld0nVdAFCxEkDu+rWmuTlTa4TPS+irx96SZ7lhzXrL0E6wiLsFR/N869Ce3AsCe+8oKvOSgPNvvuTjMPgk5nF+09b3Cdeh8C0FRcUvV5tgmOMqmrnxB8kfrokuaZ7VViDLFRSbDmtWYEoMaP8zDZx/kw8MEnn3sLUXFBq5ZvegL8L8mA3PR6GIjckRPRUuS1tgrvjo68gb8T8fJ0AxnAQViGLF3lVyMlJN1bSJwU4IzS8BAqvOH56j5pu4F0fO/Ch2Hc8XW1G8fXhslLiZ/x4eSpAb8dHaPCTU1/rb+tw+E1gFKne4I2Z+BiN2IsVxVFd+jtjc2vy9Ix1pbRVRzG6MDUs8XgYnIx0oRage5ZXnau+ZKwufsUmSghMs+tbZHe1bi9RZzgtiu3rGNhzbwiDm55Bory4ioG1lkKZqoKZsXEu4iJVlbIwR/JircuFqL5zqpIsuYAKbg4TK8cHSWVxVUwI/s1OTUOpSq6Zt1pkEpYEnlt52U8pL3yI+VDI8tvkrsvDpoAToXsf4W
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(136003)(396003)(376002)(366004)(451199021)(86362001)(478600001)(83380400001)(38100700002)(186003)(41300700001)(26005)(15650500001)(71200400001)(33656002)(54906003)(8936002)(8676002)(6916009)(316002)(2906002)(122000001)(4326008)(7696005)(66556008)(64756008)(9686003)(66946007)(52536014)(107886003)(66476007)(66446008)(6506007)(38070700005)(82960400001)(76116006)(55016003)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TAYG2xV7lK0p6bDv++OFOxN38VvPuUbw7VbmnHo1G6nBNbIsbKQI1fi7zTHC?=
 =?us-ascii?Q?Wf329z/NSmWzayATGQX1Ojv85vnGTcIvScid4pA6QcJ/vw4E/6kldSunVKn1?=
 =?us-ascii?Q?dNxA2xEGrOXhx/6SQ7olgqqbKNJ02ffUJ2t3lM4z/PqHvML1XqqJVgpOS0Q+?=
 =?us-ascii?Q?LCG15UHFLqCDONKQyEXAlar0iQK6yjCgzJb+N3l2yvpeIFM0ImOqUkw2SA/1?=
 =?us-ascii?Q?eDsIY3m4cjJ8V3c1dtvQYyfsAbD7OeHnWw/ZWEDSlbIWFb/p3PmUZYCEeQxB?=
 =?us-ascii?Q?sFbbJlFd3k911KgZoGynJsdnHaSraiU3aqfL+W6IxyuSHn5kY/WILtMdfIrS?=
 =?us-ascii?Q?HbCQ7jdE6h0qbXZU8VedNm3fGB+URkOG0cdRjEaSKxAf22grS899Z7z/pmpt?=
 =?us-ascii?Q?FWh6bVUJA/9cY+kR7XcceAQABi88dxYdk5ea+LqVUcODDsSPX9NMbmy21a3P?=
 =?us-ascii?Q?HAx6mcEUQXUM5YVaVqDpCjctLPqy7qa4kNxO9lXc1Q4HtEysMJA8nFPtSPoE?=
 =?us-ascii?Q?IBR3mhzu+JXq7IHhWnGAEMl2Ml1ET+jTpiFaX2cyC3Yb6Af3Fur3erI8cl9K?=
 =?us-ascii?Q?6pryElyjzDC4xUAjXS7TCkCGD2wlmKLIVN3ICIRhrXwh1mtGRbRVoYE+C/tm?=
 =?us-ascii?Q?o7m5Ubd0SiFezLU6u8EylXCrHHSY5LlkO3hPJdsXN7T+18zz9HwazLa43QPJ?=
 =?us-ascii?Q?tNIhMQre5UFvMsWlKjaRwUSg0r5wdNVQNq/dsbUYoIlFCBboByXyzh0u1PY+?=
 =?us-ascii?Q?qMgIH7ijQe4g792Z7C49gEB1OrOXD+ALI5qCqGzlQanyiFadErLb9y0GLuPP?=
 =?us-ascii?Q?26k5NrxY3ifujTTeBWTcMmOvaOXQqrVMlevmq6PftnjKmnHybrssY33cMpYR?=
 =?us-ascii?Q?JVjMJivvkGqn42++w30EtTjHQU2qW3iXBSOhk8l300D9ZbOcP7mntRNdg6o/?=
 =?us-ascii?Q?PZS8QYLpMaJEVGXRkGcCu1C6nP14lQsiyqcG/XvAlBmRwByrZRAX0l3AAxdg?=
 =?us-ascii?Q?TSvh4cqKUIKSsDoAQEFGpVmikYRkznFnNKCf83hk6yvM130FS9UsUR1e3yYp?=
 =?us-ascii?Q?uEvxc4Zzu945afsU2S2vH3PqD+CPhKVTTBXL1L1qm2+E0IvhdEz/hwRzPJ2g?=
 =?us-ascii?Q?dppScw19OSPNmzMbCQhDSJkvXzuqbI4+c+OZhsdOzgOnVFvkVamYMpGYXM0z?=
 =?us-ascii?Q?kjAKuSiXkA+RJePmMIJav7U+59GrGVFPl94ox+ZTPjBI7pBW8K0h9FyK3zwE?=
 =?us-ascii?Q?Bb3Mn2Hgdy0FJT9dslra+thpyXIuzk6KcJPj0UZ9XKQj/nDzRtgxoOc/wwWQ?=
 =?us-ascii?Q?6mND181GTtszXnnpZiQJH6O2he56GWP40QQc1ljG+Xu/QEFWCTxJo3azupl8?=
 =?us-ascii?Q?OuLWNL16yOvCLno4+QLO0zI4Fr3rb1/lsBHRUQzgEyC+Nag+YByCcfN8wruR?=
 =?us-ascii?Q?GUKIq51h12Z6WWMWAJhVUyOjk17PTGgDOyzcT50hleBJ3f+eviJTEH7v4GUJ?=
 =?us-ascii?Q?2csfDwvpRTywyL0dXliuuJhWTWhcQpb1fyHH0h26cbPWTKRt2rxe1jAhkq+M?=
 =?us-ascii?Q?gAxtQJfb12EQix2J0wKpvrNvcPksBDx7rPxn8/nE?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7f4a012-77f8-4ae1-eb04-08db88f4f7dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2023 07:43:11.4807 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JaonbGvWbvkZg3rjjOcYNAfbqiBgw0IPL5epPkyW4xJfhpjo4BuJsizzl2yTWyVsm7E1+JnRM6X/vsNLW7dAjwG3wybo3lfwrN0q1N8T0Ic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5268
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Kim, Dongwon" <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, "Chang,
 Junxiao" <junxiao.chang@intel.com>, Hugh Dickins <hughd@google.com>,
 Peter Xu <peterx@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alistair,

>=20
> > diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> > index 64a3239b6407..1f2f0209101a 100644
> > --- a/mm/hugetlb.c
> > +++ b/mm/hugetlb.c
> > @@ -6096,8 +6096,12 @@ vm_fault_t hugetlb_fault(struct mm_struct
> *mm, struct vm_area_struct *vma,
> >  		 * hugetlb_no_page will drop vma lock and hugetlb fault
> >  		 * mutex internally, which make us return immediately.
> >  		 */
> > -		return hugetlb_no_page(mm, vma, mapping, idx, address,
> ptep,
> > +		ret =3D hugetlb_no_page(mm, vma, mapping, idx, address,
> ptep,
> >  				      entry, flags);
> > +		if (!ret)
> > +			mmu_notifier_update_mapping(vma->vm_mm,
> address,
> > +						    pte_pfn(*ptep));
>=20
> The next patch ends up calling pfn_to_page() on the result of
> pte_pfn(*ptep). I don't think that's safe because couldn't the PTE have
> already changed and/or the new page have been freed?
Yeah, that might be possible; I believe the right thing to do would be:
-               return hugetlb_no_page(mm, vma, mapping, idx, address, ptep=
,
+               ret =3D hugetlb_no_page(mm, vma, mapping, idx, address, pte=
p,
                                      entry, flags);
+               if (!ret) {
+                       ptl =3D huge_pte_lock(h, mm, ptep);
+                       mmu_notifier_update_mapping(vma->vm_mm, address,
+                                                    pte_pfn(*ptep));
+                       spin_unlock(ptl);
+               }

In which case I'd need to make a similar change in the shmem path as well.
And, also redo (or eliminate) the locking in udmabuf (patch) which seems a
bit excessive on a second look given our use-case (where reads and writes d=
o
not happen simultaneously due to fence synchronization in the guest driver)=
.=20

Thanks,
Vivek

>=20
> > +		return ret;
> >
> >  	ret =3D 0;
> >
> > @@ -6223,6 +6227,9 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm,
> struct vm_area_struct *vma,
> >  	 */
> >  	if (need_wait_lock)
> >  		folio_wait_locked(folio);
> > +	if (!ret)
> > +		mmu_notifier_update_mapping(vma->vm_mm, address,
> > +					    pte_pfn(*ptep));
> >  	return ret;
> >  }
> >
> > diff --git a/mm/mmu_notifier.c b/mm/mmu_notifier.c
> > index 50c0dde1354f..6421405334b9 100644
> > --- a/mm/mmu_notifier.c
> > +++ b/mm/mmu_notifier.c
> > @@ -441,6 +441,23 @@ void __mmu_notifier_change_pte(struct
> mm_struct *mm, unsigned long address,
> >  	srcu_read_unlock(&srcu, id);
> >  }
> >
> > +void __mmu_notifier_update_mapping(struct mm_struct *mm, unsigned
> long address,
> > +				   unsigned long pfn)
> > +{
> > +	struct mmu_notifier *subscription;
> > +	int id;
> > +
> > +	id =3D srcu_read_lock(&srcu);
> > +	hlist_for_each_entry_rcu(subscription,
> > +				 &mm->notifier_subscriptions->list, hlist,
> > +				 srcu_read_lock_held(&srcu)) {
> > +		if (subscription->ops->update_mapping)
> > +			subscription->ops->update_mapping(subscription,
> mm,
> > +							  address, pfn);
> > +	}
> > +	srcu_read_unlock(&srcu, id);
> > +}
> > +
> >  static int mn_itree_invalidate(struct mmu_notifier_subscriptions
> *subscriptions,
> >  			       const struct mmu_notifier_range *range)
> >  {
> > diff --git a/mm/shmem.c b/mm/shmem.c
> > index 2f2e0e618072..e59eb5fafadb 100644
> > --- a/mm/shmem.c
> > +++ b/mm/shmem.c
> > @@ -77,6 +77,7 @@ static struct vfsmount *shm_mnt;
> >  #include <linux/fcntl.h>
> >  #include <uapi/linux/memfd.h>
> >  #include <linux/rmap.h>
> > +#include <linux/mmu_notifier.h>
> >  #include <linux/uuid.h>
> >
> >  #include <linux/uaccess.h>
> > @@ -2164,8 +2165,12 @@ static vm_fault_t shmem_fault(struct vm_fault
> *vmf)
> >  				  gfp, vma, vmf, &ret);
> >  	if (err)
> >  		return vmf_error(err);
> > -	if (folio)
> > +	if (folio) {
> >  		vmf->page =3D folio_file_page(folio, vmf->pgoff);
> > +		if (ret =3D=3D VM_FAULT_LOCKED)
> > +			mmu_notifier_update_mapping(vma->vm_mm, vmf-
> >address,
> > +						    page_to_pfn(vmf->page));
> > +	}
> >  	return ret;
> >  }

