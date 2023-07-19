Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9915E758DA7
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 08:19:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7142610E118;
	Wed, 19 Jul 2023 06:19:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A0E10E118
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 06:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689747544; x=1721283544;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0hIYvNhCw4gzuIEvTMAUgltL8tgRT2CD66ONT2t0HA4=;
 b=SCa+cEzeTpRa4vMxff7UpFesj22wxRhYiaP/fUuv9pgjnSLsW8qeekHC
 1bvEvyNu4ahpcDYDgNpfupCMa6I/1IPXMs1FpLDT2bFJ70Yij//X8MPav
 Ak1Cz22lvsLGq2S+rGKB5bmKnig5+b98lZIaX4ExitS7e93o4+vriUdpn
 hEf/QjWRmRHa3OiIbNPiAE7ykcWz5DKc/a9k+uc9JeNG1Q721gqbZUFGl
 8uMO0hrOYwXIeSUOYuj8emQZBcuAVrC2EtFr6ruJCL8zYacn5VJyVAkXI
 4uHw8TA4G3AUuDgv9BQbgOcRednswyVbLH1af92X5VbPaATi5VK/oc+I1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="432565045"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="432565045"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 23:19:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="970500525"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="970500525"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP; 18 Jul 2023 23:19:03 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 18 Jul 2023 23:19:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 18 Jul 2023 23:19:02 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 18 Jul 2023 23:19:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OKgoVYB9nvu7z4xQB2gBj10uzz959XrDvCEtwYu+B7HdvByNfXXE4gdO5FUCscJvUHm0GDS5pGga4uqTL1gmWeNyXSfxULi58EzscmimZ02snWIVZDKCWjoDngT4MTtIrtOI8mkRwR9W70tx8Je0xCC3WQddh+4USZDJQtKyYVaxjkdeWXaBJuhqSflQu2OnTbMieimXOcX+XUcguGMvjMo58UpIwaZkCo/jG+CQtdLbSpcLhJ6QjJE2XR0jfC9zP3feYmM8PH+tH2WOtDr10URZrGZo5z57xestlK4pxcYR0C/sZSzuS1DOj7gnX3ea7bbjnhuqOFu+9JcRFR0vTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=osxWMjMMMxzdOsYfiHkA9kJZD1Xq4y5UNzHXbetN8AM=;
 b=HXuD0Vq6sQ/Ay5I8Hoy7LubCugYm2MwsnyM6yA/hvFda/juVZEgtQ2UMTp4Hfkxq6xvcw3JKBG62QKPiSj81f/FWUDjKdchMGB/b7AAbsDOTasVvhVM1LHPhHaSLF3tx7EiWngFM7M0ngfw+BwKqbIJxkKqhUbcL30dAntGdoUzciGlOGrltGPoOYLe5R3KuCTH/yctUvLmi1wBLl9LsmNdTZCLtoBezyO83UPYtPi7XmShIk3OABFIpzu3fAcoBPx/KZhTAFJMlYRX7iQta2+wZ17RUELV1pWb+hS3ncAVlEVl9zEy1oWGXJI+01a3vLJyq6+X2UULZ/Bq70kym/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by PH8PR11MB8014.namprd11.prod.outlook.com (2603:10b6:510:23a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Wed, 19 Jul
 2023 06:19:00 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::468a:4b39:392b:d9a9]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::468a:4b39:392b:d9a9%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 06:19:00 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: RE: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Thread-Topic: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Thread-Index: AQHZuVToVshy99YkkE2dGyNcPWpnjq+/qJQAgABz7eCAAB+gAIAAE8+Q
Date: Wed, 19 Jul 2023 06:19:00 +0000
Message-ID: <IA0PR11MB718518A28F8896AC6CFE27BAF839A@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20230718082858.1570809-1-vivek.kasireddy@intel.com>
 <20230718082858.1570809-2-vivek.kasireddy@intel.com>
 <ZLaxfmrVo7sygM3d@nvidia.com>
 <IA0PR11MB71852354956EA85210AE5350F839A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZLctRBcOySnJh3rs@nvidia.com>
In-Reply-To: <ZLctRBcOySnJh3rs@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|PH8PR11MB8014:EE_
x-ms-office365-filtering-correlation-id: f9d5b7a0-6b03-4a02-6003-08db88200aff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ve1hwRVHXG9CdTJZU+MUXphHgxpxTONbcsAEQTCprz1TBnUGYtsmK4OdLBgT2kV6iwKWzW8r8Ss8fViW88aA7YFiPEimN8leb1ajY8K5m1VVOLLzLZcyvd4wdTwWlABVFhVywoawpB/xfhE8/AXkxyWXbZounE/50ZST844xIMNQwSiRivx4hKM5BLT3fSgxtsaq/1j/3hVrmmtUn1b+mQ5T1EfvDfWJfHZG7qWR0t981h5nH/Lu5jdBCaK2XBfDseB+ids5AAX7sjPujxm3yGHSYTE9cW+dO6JVBemJGQoCYkD6Zs97NQvCmF1PLoGYqhcjvj+9kWPnHnDPq7ZgK6PIlE3H35UX9UUh7RGhOLJ7vGFuhEwRfe8QSGfKeLrSY+RrEoazA7tgX88snUy6vyaETbFs6HJsvZqWFNoUestW8Ioz2cbf+JXshX9R6Wyfct2x5gCdSV6UKiRvFIYXlEjW6tKYVrMeru95AXxtkpVglS1SFVcPXboxsACNMr/ZlhzMRZQv7qrCM6asjESnk/ZRcso9+woqGSasfsUg+U4HA/x2/bFT6W+j+gyOnV85FHAg+BE41XisZI2EBv1cSuYQSO6ruabRh3ZQWBQcgHSmanB8VLs/YW3/Ssqf3ah3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(366004)(376002)(39860400002)(136003)(451199021)(316002)(41300700001)(66476007)(66556008)(64756008)(4326008)(66946007)(6916009)(66446008)(5660300002)(8936002)(8676002)(33656002)(83380400001)(38070700005)(86362001)(55016003)(38100700002)(82960400001)(122000001)(186003)(76116006)(26005)(9686003)(7696005)(6506007)(107886003)(54906003)(478600001)(71200400001)(52536014)(15650500001)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wmkUg/8Xa24buCRqz4Ntv2/cbwFN9VhE0O+Osuiq6YhrAyijUbBj4/Ql0LKD?=
 =?us-ascii?Q?PqfbbpuxwEO7Y8dmGjLR1l3NNEFb6IumqXTO9Tg8s4QjYXz1lric9SfzhBJ0?=
 =?us-ascii?Q?/6KTdHLhsbf6f8jX4thACfmKNTTqVmbCpFuMX+kZ4XcLvt8EdqH+sZm1cHFb?=
 =?us-ascii?Q?PqhZuYDdhFuYSzQ4kO16UvPS+ierbALCdH314jiHorifzP4wc+4ULddxDQJl?=
 =?us-ascii?Q?QXby5lVPH6HU2YPy3dcENnbOL372ZgPcieqdvFSxhR07kMTno6DSLLhqXURs?=
 =?us-ascii?Q?LZud85yZE/sYGGqqPsfIaykqw42nAqdVBbnzf03IVxaqxAclnDQ4Dhp4ubnd?=
 =?us-ascii?Q?iNgRkl3tRQI2k1q9kN+eWGXi7PHdraMyCOwk5JuLtIJzlgMFWRiXp0cfKUkY?=
 =?us-ascii?Q?yE2n7Mwvm1wWKlP1i4YMKKa73FXmozgWt3yDY10TK7doJE0ovGpcB0n73Dfg?=
 =?us-ascii?Q?Wd66RV3vFeWuJ1xGuWkTBpyno2xym9A+wTyfL6kVdOfmKbAwKLkEEoCrmd5g?=
 =?us-ascii?Q?O60XlSCtC1GPgvKFn4HS2+Dyp1lHb/T8sduG2IRHGwLjZqqHKl6NWy84by+Q?=
 =?us-ascii?Q?T+slSMC1j50V5Qtde/ETBmIWz5eujd9nYx3IcpZIS8J/PXTDBXxNMKaCv/ly?=
 =?us-ascii?Q?FC/qhNvDjJJD6tD9LRziidbJvbE5ebPvdBY+sjupGLHWxh82LR0OuIkXsqD1?=
 =?us-ascii?Q?2gmUOYE+k9021f5t+eaY99GOEslljdfQvrzQtLPArToTVp7AYgnrx9S7cs1M?=
 =?us-ascii?Q?EbZaeM8MltmvYL+0i6QwHGBHl0EjPRfjjqKUO14R4O2P9h6EHXYezawARhyn?=
 =?us-ascii?Q?2m849jmxGabvtxLu3kINXjt3fAOX2bmKO+MRYscmHxlwTEaCR4Q4xQ6N70d3?=
 =?us-ascii?Q?YA0w8G1kpLkLqNhshn15Q2WF8MTBVgeUfJyDhkea21W+zebt1n9amPh4UYlv?=
 =?us-ascii?Q?WosVteHCnjUqe+kEK7HxO/PEJTjWmuGYPa0TgLnUv6r840H8NsvRMqvxONPg?=
 =?us-ascii?Q?yvx3eNierQAV5U4mHIlI+AKbjaw1/xYLnQ1RwIifixFGkCbKuMeCROXWdzLs?=
 =?us-ascii?Q?LKyHOX/Js3kuRar2yGSo7SFWkkzqEsdv9zDTgQMkcEY4UxyComvN9ooJJ7wV?=
 =?us-ascii?Q?dA2qsyHcHZeunfyKivMbpb7tFiX+EEj0j1qN8OB0Pni3HYdZz4x0WbfvobhT?=
 =?us-ascii?Q?aaS4CjcBAuCV+rw93W6Px78xhMmGVpvMbCjpx86aHhrp098te97Xv7wz/xdy?=
 =?us-ascii?Q?gIv1r5fvems8rlAbrGuLVvHRubVQq7gsPkYkU7YeLmuzf5Yl7mJKLdAqgIuF?=
 =?us-ascii?Q?BGHwsJgvO4iF/Ut0UusrI1VqLWQyCMhooxUmThk9+mcnI1sBerWv/snCMIie?=
 =?us-ascii?Q?Cogf5Cznw2881So6jRdu3F4y+AQtEGk93S0Y+EiFDkKj/u0N7/lZTQp1Li1n?=
 =?us-ascii?Q?F44uzb/XuHBdaxhXqhRQemiUWQlS6qyj7QpB7Ms1vI3FE1+ZwMsuWPmr4D3D?=
 =?us-ascii?Q?OYl/d2GRsfiu6Toz1RCQTL8oqK5GpzwWBNwrP4UanqTCfSd4qv67jSBau/a2?=
 =?us-ascii?Q?USbV3cvPCcai10VQpsYoA6V2mBIHIH2ccFIMnqWh?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9d5b7a0-6b03-4a02-6003-08db88200aff
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2023 06:19:00.7436 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jv7As6FpnA+GVCKW4GM1wCVAmD//aAHF51eG/fw22Faya7QlSXe225jMq0N07hK7U2Gt5co9gJDSCr7uhCXd0Gj5/VZAipvRQZ90HahY8n0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8014
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
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jason,

>=20
> On Wed, Jul 19, 2023 at 12:05:29AM +0000, Kasireddy, Vivek wrote:
>=20
> > > If there is no change to the PTEs then it is hard to see why this
> > > would be part of a mmu_notifier.
> > IIUC, the PTEs do get changed but only when a new page is faulted in.
> > For shmem, it looks like the PTEs are updated in handle_pte_fault()
> > after shmem_fault() gets called and for hugetlbfs, this seems to
> > happen in hugetlb_fault().
>=20
> That sounds about right
>=20
> > Instead of introducing a new notifier, I did think about reusing
> > (or overloading) .change_pte() but I did not fully understand the impac=
t
> > it would have on KVM, the only user of .change_pte().
>=20
> Yes, change_pte will be called, I think, but under various locks.=20
AFAICT, change_pte does not seem to get called in my use-case either
during invalidate or when a new page is faulted in.

>Why would you need to change it?
What I meant to say is instead of adding a new notifier for mapping updates=
,
I initially considered just calling change_pte() when a new page is faulted=
 in
but I was concerned that doing so might adversely impact existing users (of
change_pte) such as KVM.

>=20
> What you are doing here doesn't make any sense within the design of
> mmu_notifiers, eg:
>=20
> > @ -2164,8 +2165,12 @@ static vm_fault_t shmem_fault(struct vm_fault
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
>=20
> Hasn't even updated the PTEs yet, but it is invoking a callback??
I was counting on the fragile assumption that once we have a valid page,
the PTE would be eventually updated after shmem_fault(), which doesn't
make sense in retrospect. Instead, would something like below be OK?
@@ -5234,6 +5237,14 @@ vm_fault_t handle_mm_fault(struct vm_area_struct *vm=
a, unsigned long address,

        lru_gen_exit_fault();

+       if (vma_is_shmem(vma) || is_vm_hugetlb_page(vma)) {
+               if (!follow_pte(vma->vm_mm, address, &ptep, &ptl)) {
+                       pfn =3D pte_pfn(ptep_get(ptep));
+                       pte_unmap_unlock(ptep, ptl);
+                       mmu_notifier_update_mapping(vma->vm_mm, address, pf=
n);
+               }
+       }


Thanks,
Vivek

>=20
> Jason
