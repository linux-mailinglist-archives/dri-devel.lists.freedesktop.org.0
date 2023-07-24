Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4132676009D
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 22:42:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B36F310E355;
	Mon, 24 Jul 2023 20:42:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D30AE10E355
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 20:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690231365; x=1721767365;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+ZzemwxZfuLge56W2uKiO3ExqSIRXVUp5Ap4fnD+nOA=;
 b=lheowuIgaGkx+NVTtD4CfTJIZ1G9MvIphdv25INYPfil2z9hTUlOdXlV
 1iAsIOICoxiiWjGkHew93Kh+Hr98CNo0iW8mVq7ORi0d/MPAW8JmtVxgX
 wEqW/vuSNDQxDJGrXVaLke0aEtO0Mp40LpJLtvXfGFxhHLqxImbbru1Nz
 zx6dqXZpgRrCWf4vtyO9aA2qo7ilJmR3E/+n+VHXGclgJb/Fy0RUUzN9c
 0Qt1xKXFA3OEe1pzNL6qtmWfeamrXlrLsoymVWIe0uqC5qhJxsWpFBlUA
 Gw94uIYQBkmPv0TUm+/SQkOZm6V7cUzm3Wtkvc2yom0Z8xt+1zjhsCN/T g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="347154270"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="347154270"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 13:42:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="1056550983"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="1056550983"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 24 Jul 2023 13:42:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 13:42:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 24 Jul 2023 13:42:43 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 24 Jul 2023 13:42:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RbAf6b22gosfi191D8jMv52KVP7LT7HB62GICHMB3Y0wC2FyMDIrceKSkfq4HCw4hNGYsKBe3phvGKuTZVSvMxdgzt35jP9xF/FU60IA06HrgshkNd5ib/shQwRv4LxOKwhobJvM0jm2YtSfIksg33IRZgw1JrI7Y4AKFXyDKDXk1A+OttVf9nGYFF4emiwEUdoFaX3mIiisaNRXhK0G1xde+xLj9ZY4bOuxa/6fuTfVy/BOPetKCoPl/qKZ6ojJ38aoJLz24BQACz+CYQOWSA9Rfgx/f0pQ3gPa46qG6+oBrmwVfip6n2vscp7doNKW70E8x/voyLYy8ejgEKweaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7XAwPxA3WLQDjg9/t6ts8Q1/zxwOWIUBRnCxZAnwI7U=;
 b=XLwSXk2Wur+wWh1JAzDpyot8VGAi1BVqZKj+B2hkm9DuhUAB3Da9fN7X97d7x7cLkbJ/8hmSziq8Q+TZGNunyWpZA8aDjhmHhYcZ0eX1oylUrkZWNuCNGEctCq+Kf5WSxS1YTRnirXf8V87zsqZ39g/RXpuNe2Tn++q+YSQW5DYAmdvNcxoLj04IPTioY3KzK3XlNXIZ+DWqe2CvLB1gg50cO9KuUoHNnYdJYJgKq2K12TdH94bQUrd6RfOF2p3OJZIOTxlfgu4r6fG82khb5RwoWUXaZscsDUfdpIUmB9+dCdZPoMBbRcUdzJOnF5Z35MfIQxNk9SevnXYbMEQNFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by LV3PR11MB8696.namprd11.prod.outlook.com (2603:10b6:408:216::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Mon, 24 Jul
 2023 20:42:41 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::468a:4b39:392b:d9a9]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::468a:4b39:392b:d9a9%5]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 20:42:41 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: RE: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Thread-Topic: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Thread-Index: AQHZuVToVshy99YkkE2dGyNcPWpnjq/AWUSAgAGkBBCAAGFsAIAF9M/ggAChnICAAD+SMA==
Date: Mon, 24 Jul 2023 20:42:40 +0000
Message-ID: <IA0PR11MB71855B4A7D0F428C9E8771D9F802A@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20230718082858.1570809-1-vivek.kasireddy@intel.com>
 <20230718082858.1570809-2-vivek.kasireddy@intel.com>
 <87jzuwlkae.fsf@nvdebian.thelocal>
 <IA0PR11MB718527A20068383829DFF6A3F83EA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <87pm4nj6s5.fsf@nvdebian.thelocal>
 <IA0PR11MB7185EA5ABD21EE7DA900B481F802A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <87zg3lzbd1.fsf@nvdebian.thelocal>
In-Reply-To: <87zg3lzbd1.fsf@nvdebian.thelocal>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|LV3PR11MB8696:EE_
x-ms-office365-filtering-correlation-id: 65261775-96d7-4560-2b7d-08db8c868650
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZROT0Mfj+iOXoT4LXtHQlP5fck7cOk8P4nw20fbvIooCbOPhzUAgu5Ds6PO8OILwAOWQO5yaRqYHnoNU4Ch3Bzsm0J7q19H0WXgFXI2F2Ta0xotJonqb8EGOkoYqnDQp8MtwWLXlLtVuAVXuuLU0yM1xEhIkDf8MpetRnjSC3I1Rg5EKLfcoxXcrNlKsDWx+wsp+T/5Wk4aRi7TNJayzqCl1cckwAQN0LN8iXYQJ8jzifHhRmkS7t4UQ+7LZSMPwkj+xSgwQnZBTwL+PQkrCXV832Tso8l8XfQXxwJ6AicRk1hT3YtHNWqw3s4lJpCofagDuQW/nnzzcQw4/AvXkUMOzOe8rY8qpAtIEFDJPsEBy1zf8BEK0NvPEMKV9NVz+Dg/FOzp78+s4eHccgMlcNtpcpDvngMzekB66JR21qiboaiP688wGYxjIB46PwmKgbXsM54EXjWK2JNn6OClFvARwp1Wtt4uAtJEQa+p4RVJSvoFt2WUwwmjpkLjfvTZw5f1tv4V+Nv+YfpxQ1zZBuNe5acSnO/pdLBQNDENfuzX77IaW3NmkquMMeku7TjwxgVZfIYD+Yh8OcjxGxXbrh/LrGAg0+8DaGfKaY2x/T//0j8y6ydYOnxrc7YDw7JlK
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(346002)(376002)(136003)(396003)(451199021)(122000001)(54906003)(82960400001)(478600001)(26005)(6506007)(186003)(71200400001)(7696005)(55016003)(33656002)(9686003)(76116006)(5660300002)(4326008)(6916009)(66476007)(64756008)(66446008)(66556008)(83380400001)(66946007)(2906002)(15650500001)(316002)(41300700001)(52536014)(38070700005)(38100700002)(86362001)(8936002)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ThJEJgFqq38EcfP7a/6lMa4QugWQMtlQCHnCqEfmS6rJJGP3pMhfiHzSDetw?=
 =?us-ascii?Q?ZXW9J9u5jErP1E7mfqXIGbO9pkyvxNVjTMMgGRPqHSyYZeaq42NLceXFm4mh?=
 =?us-ascii?Q?1oBLZJpzrk19hUyH9QKS1JqF1LZcDaZ++P+w+UGJiYHVkwCOhsPJtRToMv9n?=
 =?us-ascii?Q?8C+J4CyIH9EwPN2yk3n+6uxWVYIjq8EkXrmvHHoEztYMg72v2LP/J3I3fkEg?=
 =?us-ascii?Q?sNBta0OQXtQinWIauronRnNEnu4S7bP01NmtrC9Eh9QElaMi/NpN4BP4LN6c?=
 =?us-ascii?Q?p18PQYrrJuU1/5gaT88j1FHgh816GOrV37dYVvlhlizAo4yunGTboG8c+Ii5?=
 =?us-ascii?Q?arWZYa67vQNfP8Or85YDDf4slkhFfsXe3VOUOWK+rcO5TTaHJPKwChc1neAE?=
 =?us-ascii?Q?dtIK5vi1kGhiaW8FIN71hKczcY5UxZ4rHHJdmAV4AUAVuLfDJnCz7I6lE8a9?=
 =?us-ascii?Q?jtg0SxTAJHqeLiU+u1G151pEvWe9lkjvFPl9yuB+sdNtrpuc+f4QV+5B/Aip?=
 =?us-ascii?Q?zt4TN9029RG7GifSNhkFbRhy5PAIuUAXNxdtSIgJjzj3laNOfnCAmU2rmYVT?=
 =?us-ascii?Q?TG6/3/zvha0Na+wvUus6vv+hb76uyaX/jUs/lXAkaxQ+hRl8d6EBNoVZdWWZ?=
 =?us-ascii?Q?bbbhF0tNxvxY+LaUgNVcqIzQxRjqcLyzDTFV5lcD84z/OrTyI7u3QjjWXruu?=
 =?us-ascii?Q?mX3FSEjh0WZ36U1ezhNGv0OC/2D4GrMr9uyHKfG9IUV2R7sQUktVK2zDvV6o?=
 =?us-ascii?Q?UkltCNA9r01WWQIcDj2PMDMCukJGFTByUYH8wW/izKloXRpuExoO3dWbUZcR?=
 =?us-ascii?Q?p8jYlojAX1z9EJI39RS8cg5WPmS8qJCAV2e4X22CdCTNW9pglEkuNmvwfcP4?=
 =?us-ascii?Q?ZkkX7bnC2g+1YVG+Yx2vZNVd9Cy21lk0Rtw6IAxg2y6bsmqRzPdD1/HgFlFp?=
 =?us-ascii?Q?9uDec6R+yb6FawV7cdtjdRJR7x8RCWfT8uu1bWtdwIGtCuKsnM1AgRpEO4w+?=
 =?us-ascii?Q?o7csokkfy/nPOPlSkFaOFvIY9UnYGCK/MD/+ejAJv3/D6F/7mGl6AJGPho67?=
 =?us-ascii?Q?NbeGgErhj+f76Oq/M4X14UnGAVD3AFF4e2RnRsqO0fTZMp7KDwkWf/lgTcSA?=
 =?us-ascii?Q?+1AebGI/DVyKj2429fjepNgwtKRHfJdXK30eSi6nkLDZefh7k8dKCZIhQEax?=
 =?us-ascii?Q?fYcbMmmOMqOsM2g99ZQnyeiu5ZYAwLauHhwOrV/d2mZ04ARpRH1tE8s+viay?=
 =?us-ascii?Q?L0F0xXsPugMXFAIaY4hfCXUCi6uwjzk8qzWUV2pPSso6nwIH+jyLtpnEGNNl?=
 =?us-ascii?Q?DLSXbV0QI7Ma+Y3ujdtaO5SZEpoC1kp/EYxzTsdcfisgBl8rhAyQLC/lIXfh?=
 =?us-ascii?Q?zn0D3r61EehCtu3GNFE3gI/7m20Pz78wWzK7k4SzyUCjFW4fZCOWtKe+3Oot?=
 =?us-ascii?Q?1FkMNGB7GphHoseofebuXSIVoO0f4wtyiAOvW0piXvsb6fQvNnuA1k+eJQTI?=
 =?us-ascii?Q?xnomPvd6iH97OxHrov0rYY7L2lReCZ8NwMBHYEegVnA6nZBMpEjHdI7YDDuF?=
 =?us-ascii?Q?HQfIuN90LBiwYieD8jYJWGQRRYz75Oth6FSzNo9E?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65261775-96d7-4560-2b7d-08db8c868650
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2023 20:42:40.9860 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PMlWRteqE/fueyUs95xiMWupW1VXGCChtRaa4F0CWSu3o8+7kQUjdXTuBc2DhcgNjEdWSuk3gwbtJH8nOPuiKShvQwSXYSqDFdMRdGH7Vz0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8696
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

> >>
> >> Yes, although obviously as I think you point out below you wouldn't be
> >> able to take any sleeping locks in mmu_notifier_update_mapping().
> > Yes, I understand that, but I am not sure how we can prevent any potent=
ial
> > notifier callback from taking sleeping locks other than adding clear
> comments.
>=20
> Oh of course not, but is such a restriction on not taking sleeping locks
> acceptable for your implementation of the notifier callback? I notice in
> patch 2 update_udmabuf() takes a mutex so I assumed not being able to
> sleep in the callback would be an issue.
I plan to drop the mutex in v2 which is not really needed as I described in
my previous reply because we ensure Guest and Host synchronization via
other means.=20

>=20
> >>
> >> > In which case I'd need to make a similar change in the shmem path as
> well.
> >> > And, also redo (or eliminate) the locking in udmabuf (patch) which
> seems a
> >> > bit excessive on a second look given our use-case (where reads and
> writes
> >> do
> >> > not happen simultaneously due to fence synchronization in the guest
> >> driver).
> >>
> >> I'm not at all familiar with the udmabuf use case but that sounds
> >> brittle and effectively makes this notifier udmabuf specific right?
> > Oh, Qemu uses the udmabuf driver to provide Host Graphics components
> > (such as Spice, Gstreamer, UI, etc) zero-copy access to Guest created
> > buffers. In other words, from a core mm standpoint, udmabuf just
> > collects a bunch of pages (associated with buffers) scattered inside
> > the memfd (Guest ram backed by shmem or hugetlbfs) and wraps
> > them in a dmabuf fd. And, since we provide zero-copy access, we
> > use DMA fences to ensure that the components on the Host and
> > Guest do not access the buffer simultaneously.
>=20
> Thanks for the background!
>=20
> >> contemplated adding a notifier for PTE updates for drivers using
> >> hmm_range_fault() as it would save some expensive device faults and it
> >> this could be useful for that.
> >>
> >> So if we're adding a notifier for PTE updates I think it would be good
> >> if it covered all cases and was robust enough to allow mirroring of th=
e
> >> correct PTE value (ie. by being called under PTL or via some other
> >> synchronisation like hmm_range_fault()).
> > Ok; in order to make it clear that the notifier is associated with PTE
> updates,
> > I think it needs to have a more suitable name such as
> mmu_notifier_update_pte()
> > or mmu_notifier_new_pte(). But we already have
> mmu_notifier_change_pte,
> > which IIUC is used mainly for PTE updates triggered by KSM. So, I am
> inclining
> > towards dropping this new notifier and instead adding a new flag to
> change_pte
> > to distinguish between KSM triggered notifications and others. Somethin=
g
> along
> > the lines of:
> > diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.=
h
> > index 218ddc3b4bc7..6afce2287143 100644
> > --- a/include/linux/mmu_notifier.h
> > +++ b/include/linux/mmu_notifier.h
> > @@ -129,7 +129,8 @@ struct mmu_notifier_ops {
> >         void (*change_pte)(struct mmu_notifier *subscription,
> >                            struct mm_struct *mm,
> >                            unsigned long address,
> > -                          pte_t pte);
> > +                          pte_t pte,
> > +                          bool ksm_update);
> > @@ -658,7 +659,7 @@ static inline void mmu_notifier_range_init_owner(
> >         unsigned long ___address =3D __address;                        =
   \
> >         pte_t ___pte =3D __pte;                                        =
   \
> >                                                                        =
 \
> > -       mmu_notifier_change_pte(___mm, ___address, ___pte);            =
 \
> > +       mmu_notifier_change_pte(___mm, ___address, ___pte, true);      =
 \
> >
> > And replace mmu_notifier_update_mapping(vma->vm_mm, address,
> pte_pfn(*ptep))
> > in the current patch with
> > mmu_notifier_change_pte(vma->vm_mm, address, ptep, false));
>=20
> I wonder if we actually need the flag? IIUC it is already used for more
> than just KSM. For example it can be called as part of fault handling by
> set_pte_at_notify() in in wp_page_copy().
Yes, I noticed that but what I really meant is I'd put all these prior inst=
ances
of change_pte in one category using the flag. Without the flag, KVM, the on=
ly
user that currently has a callback for change_pte would get notified which
may not be appropriate. Note that the change_pte callback for KVM was
added (based on Git log) for KSM updates and it is not clear to me if that
is still the case.

>=20
> > Would that work for your HMM use-case -- assuming we call change_pte
> after
> > taking PTL?
>=20
> I suspect being called under the PTL could be an issue. For HMM we use a
> combination of sequence numbers and a mutex to synchronise PTEs. To
> avoid calling the notifier while holding PTL we might be able to record
> the sequence number (subscriptions->invalidate_seq) while holding PTL,
> release the PTL and provide that sequence number to the notifier
> callback along with the PTE.
>=20
> Some form of mmu_interval_read_retry() could then be used to detect if
> the PTE has changed between dropping the PTL and calling the
> update_pte()/change_pte() notifier.
>=20
> Of course if your design can handle being called while holding the PTL
> then the above is probably unnecessarily complex for your use-case.
Yes, I believe we can handle it while holding the PTL.=20

>=20
> My primary issue with this patch is the notifier is called without the
> PTL while providing a PTE value. Without some form of synchronisation it
> isn't safe to use the result of eg. pte_page(pte) or pte_write(pte) in
> the notifier callback. Based on your comments it seems udmabuf might
> have some other synchronisation that makes it safe, but being external
> to the notifier calls make it's hard to reason about.
I intend to fix the PTL issue in v2 but I am still not sure what is the bes=
t
thing to do as far as the notifier is concerned given the following options=
:
- Keep this patch (and notifier name) but ensure that it is called under PT=
L
- Drop this patch and expand the use of change_pte but add the flag to
  distinguish between prior usage and new usage
- Keep this patch but don't include the PTE or the pfn of the new page as
  part of the notifier. In other words, just have this:
mmu_notifier_update_mapping(struct mm_struct *mm, unsigned long address)
This way, in udmabuf driver, we could get the new page from the page cache
as soon as we get notified:
	mapoff =3D linear_page_index(vma, address);
	new_page =3D find_get_page(vma->vm_file->f_mapping, mapoff);
This last option would probably limit the new notifier to the udmabuf
use-case but I do not intend to pursue it as you suggested that you are
also interested in a new notifier associated with PTE updates.

Thanks,
Vivek

>=20
>  - Alistair
>=20
> > Thanks,
> > Vivek
> >
> >>
> >> Thanks.
> >>
> >> > Thanks,
> >> > Vivek
> >> >
> >> >>
> >> >> > +		return ret;
> >> >> >
> >> >> >  	ret =3D 0;
> >> >> >
> >> >> > @@ -6223,6 +6227,9 @@ vm_fault_t hugetlb_fault(struct mm_struct
> >> *mm,
> >> >> struct vm_area_struct *vma,
> >> >> >  	 */
> >> >> >  	if (need_wait_lock)
> >> >> >  		folio_wait_locked(folio);
> >> >> > +	if (!ret)
> >> >> > +		mmu_notifier_update_mapping(vma->vm_mm,
> address,
> >> >> > +					    pte_pfn(*ptep));
> >> >> >  	return ret;
> >> >> >  }
> >> >> >
> >> >> > diff --git a/mm/mmu_notifier.c b/mm/mmu_notifier.c
> >> >> > index 50c0dde1354f..6421405334b9 100644
> >> >> > --- a/mm/mmu_notifier.c
> >> >> > +++ b/mm/mmu_notifier.c
> >> >> > @@ -441,6 +441,23 @@ void __mmu_notifier_change_pte(struct
> >> >> mm_struct *mm, unsigned long address,
> >> >> >  	srcu_read_unlock(&srcu, id);
> >> >> >  }
> >> >> >
> >> >> > +void __mmu_notifier_update_mapping(struct mm_struct *mm,
> >> unsigned
> >> >> long address,
> >> >> > +				   unsigned long pfn)
> >> >> > +{
> >> >> > +	struct mmu_notifier *subscription;
> >> >> > +	int id;
> >> >> > +
> >> >> > +	id =3D srcu_read_lock(&srcu);
> >> >> > +	hlist_for_each_entry_rcu(subscription,
> >> >> > +				 &mm->notifier_subscriptions->list,
> hlist,
> >> >> > +				 srcu_read_lock_held(&srcu)) {
> >> >> > +		if (subscription->ops->update_mapping)
> >> >> > +			subscription->ops-
> >update_mapping(subscription,
> >> >> mm,
> >> >> > +							  address,
> pfn);
> >> >> > +	}
> >> >> > +	srcu_read_unlock(&srcu, id);
> >> >> > +}
> >> >> > +
> >> >> >  static int mn_itree_invalidate(struct mmu_notifier_subscriptions
> >> >> *subscriptions,
> >> >> >  			       const struct mmu_notifier_range *range)
> >> >> >  {
> >> >> > diff --git a/mm/shmem.c b/mm/shmem.c
> >> >> > index 2f2e0e618072..e59eb5fafadb 100644
> >> >> > --- a/mm/shmem.c
> >> >> > +++ b/mm/shmem.c
> >> >> > @@ -77,6 +77,7 @@ static struct vfsmount *shm_mnt;
> >> >> >  #include <linux/fcntl.h>
> >> >> >  #include <uapi/linux/memfd.h>
> >> >> >  #include <linux/rmap.h>
> >> >> > +#include <linux/mmu_notifier.h>
> >> >> >  #include <linux/uuid.h>
> >> >> >
> >> >> >  #include <linux/uaccess.h>
> >> >> > @@ -2164,8 +2165,12 @@ static vm_fault_t shmem_fault(struct
> >> vm_fault
> >> >> *vmf)
> >> >> >  				  gfp, vma, vmf, &ret);
> >> >> >  	if (err)
> >> >> >  		return vmf_error(err);
> >> >> > -	if (folio)
> >> >> > +	if (folio) {
> >> >> >  		vmf->page =3D folio_file_page(folio, vmf->pgoff);
> >> >> > +		if (ret =3D=3D VM_FAULT_LOCKED)
> >> >> > +			mmu_notifier_update_mapping(vma-
> >vm_mm, vmf-
> >> >> >address,
> >> >> > +						    page_to_pfn(vmf-
> >page));
> >> >> > +	}
> >> >> >  	return ret;
> >> >> >  }

