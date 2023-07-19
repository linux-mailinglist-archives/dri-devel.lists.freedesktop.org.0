Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BEC7589E2
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 02:05:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1835010E3D4;
	Wed, 19 Jul 2023 00:05:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80DD910E3D4
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 00:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689725135; x=1721261135;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fTz0iV0JSp6sTXxiGkazPHA4/WUWPi5ejBJEzhHv+P4=;
 b=Fn2tQQ6blaALtrmhtK4rvI9wCeeFfxRPzfW5tBK3mymGo/o7F/sB/wtV
 aQ7eTzisN9OR/HGEQXRgzzUFsXntvrWjstX2Ux4bcHXMqQqcriBSBfy/N
 QPK74LXtNDKOkLoeT06sP45Ba/+3n6RVoJ4QIdWNfDVCBkbaWWoS7enwt
 SPE8IWzj8png4gVgXxVdvQci1siwU82TcnI//LMhAwpTxnQ9IU//MsxUb
 uV9PiZQK77+6GUJM3SLqJlHaWSiDAaH3qJ+J/86xHPG4XEE89BdTNTzzH
 Qt8CvA6wV1WwmnqCrSbTpJ07PyhaiMilajSi7XLnL/1qRMRHR3t63FFCy g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="368984982"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; d="scan'208";a="368984982"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 17:05:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="717802412"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; d="scan'208";a="717802412"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP; 18 Jul 2023 17:05:33 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 18 Jul 2023 17:05:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 18 Jul 2023 17:05:32 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 18 Jul 2023 17:05:32 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 18 Jul 2023 17:05:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i5ougk41UVQPskv88AQGyGjsPi5pHDjlKXKl8ZCR0EwvLTolDm4kUMSumXLBg0dl3Ybk444gKJCB7Ww09sJxbpppJUuTSlbzvF9zRgV8Jg6sHmQ19/s9BQa0LMkyOf0YEZ1UYyu9P1erMJ8Zrz91cc9kwmG6t+USfdFcFzkwGV9qfF88OyZuycLIGAlQk9XKbMOOZeFTpSF9vJb/7NeSKtQL9iCyxmFj3AqUMiZT4bT//kRg/Kapzfu2ob5xnteqjjByS/JT15ztJkPim2U5p09le+V3Dksa44vfQRbq8/Rgje+ciEDBzytYvscx1r3Wb86pg+2noQ7WOK5M5Ztz9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fTz0iV0JSp6sTXxiGkazPHA4/WUWPi5ejBJEzhHv+P4=;
 b=RiDPsFGa1q2IWwfsO0DzR2v0cnGLHBbTq0Tjb3pQKQga6RjDpWr9dxiSHLpVBbvqdc2EVR1EAiMe70m8QYL95mLAHSTzQbuOgkeiOGz+txfI3+RyMbZparhzKxWpoMzE9muH8WB/bcA8Wy/KzeSgDVn8piGnzmKpY06WbYx7yUZoEplgW9q9/0+B3FlV7HYulhK33idoU++mDKv1a+O9aNj7FIAIljuEcAR+pQPAl5tJ/qcd46l8I8fjohkkSSupEwUGLMKrH6i6/YNm9KHg08nOaO6+Yl9+udsYR5q5z5eQwlNs/XrJOaQLNoIiFwHzoIg//34AKXcE895/39MW1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by PH7PR11MB7145.namprd11.prod.outlook.com (2603:10b6:510:1ec::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Wed, 19 Jul
 2023 00:05:30 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::468a:4b39:392b:d9a9]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::468a:4b39:392b:d9a9%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 00:05:29 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: RE: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Thread-Topic: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Thread-Index: AQHZuVToVshy99YkkE2dGyNcPWpnjq+/qJQAgABz7eA=
Date: Wed, 19 Jul 2023 00:05:29 +0000
Message-ID: <IA0PR11MB71852354956EA85210AE5350F839A@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20230718082858.1570809-1-vivek.kasireddy@intel.com>
 <20230718082858.1570809-2-vivek.kasireddy@intel.com>
 <ZLaxfmrVo7sygM3d@nvidia.com>
In-Reply-To: <ZLaxfmrVo7sygM3d@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|PH7PR11MB7145:EE_
x-ms-office365-filtering-correlation-id: f49df3ff-a831-41c2-4cb3-08db87ebdd0e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2kKfUiKe+xZTBgIctw0mZ+yTGwcto1Hd7RekKCjm3FKw8KJv71FuNLHJ5A99PtsDgFiRgp/LWIj0y+CRvdUktn8UiFetxOhNkuh7bMUPGt+bhrm8NRC2hAV6YPsTmUQD+yilc4cHVmka5IuKPeWvO7JOmmkKsZxoPh7WF16tP3m563vV5zAPuk3igBDilXeqe4jvNMrmQJmCbzYbUx1kZfX/B3BaEpmE+ZKZwX3KeYh4NBTvj2ilbwmh2uUMPU8vpUXe+DzLEc0icEFH7v1/ebHAxnterrQqqg94C0UkadVs83YEfpprsFHmR4ZCHuh0m91EZz7lz9I1fZTOvkXEBsx66nXoNUXhR+6c4VfqmdSrR9ttmam92w8dmC/tL9v/dCdIsqZXV0l0yR1bWvX24TQBmKekbzVf+ahet8VCx+a+tABwVizLDRM8fmQT5HZvJewf6REu6aZjfo6uuIwkTLxKtz8PJFItlGXXcfbgpGJgrZov8uNzF6r8+5Nr/ICxB8f62C5O6ovU0wrFyOH0cfr9Ff2ZHCf5HRCSLpYkBg7ESu2qJnUzPHHhiidumA0OMcmfa07cLV0+i+3JCcNl4xfhAhIR05YtUkL/J8KeSY1CDa5zPqEoh04U7kkcvmaC
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199021)(5660300002)(478600001)(66446008)(66556008)(66476007)(66946007)(54906003)(52536014)(64756008)(15650500001)(4326008)(316002)(6916009)(76116006)(8936002)(55016003)(2906002)(8676002)(41300700001)(71200400001)(26005)(9686003)(7696005)(107886003)(6506007)(38100700002)(33656002)(186003)(82960400001)(83380400001)(122000001)(38070700005)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ze2xOn2Yc3fQwLJuwCLJlZ+xLr53FmpU01oK/TmbygVYsnzIBxDin/sQBITg?=
 =?us-ascii?Q?62EKEDM8Ru1VDw4tW85mAH05u/sjzY8acN36K+T/9UzEPPOXI2jhugiV2eUN?=
 =?us-ascii?Q?uTQPhDme1p8/3PbGembI0bVFr2kWx1tVGhRHlqss6N4/xXyzO3H07am+0jh+?=
 =?us-ascii?Q?H2f4MeY/UCC3RzgVAvExFdbZYTQmSsvbmigHLaKpN7UkqbEI8WQIutRNEgzQ?=
 =?us-ascii?Q?lVudnhZdXRpfsFVDRHcztFwcVUM7SS148Uo4osexdz5/WWRttOs54LFJDmOu?=
 =?us-ascii?Q?xlzD8pH85nQ7UT+LvQSCGOj5FN6IYTXkhQnmvrYor9F7PMfBxi8WO01DiJ1V?=
 =?us-ascii?Q?KCCJlHKLkipd3YsgrdJrfmxhDaxhHsmYJYdip2bWhF7ecuXOfxDIizhgyqOw?=
 =?us-ascii?Q?2eDdrsl8X/i8bVWJ3iZEKxqjZENL9QrrJeS2U2n56BCWgURsgfVyEN4DbAu2?=
 =?us-ascii?Q?9AqNDDFDbclULA7zoDW7/ZiAQZkxhMH1p6nW//ymnHiPzo0ka/+Qw92nwACI?=
 =?us-ascii?Q?2wlqi5oevw/JCrBr0sqTxd0J7iORMwzqkFHIoVUlaOEZNtj4iWxuAaOPCVMF?=
 =?us-ascii?Q?bK35ycLVPb86zA8DT4jZACcUHqn/rhOVl+6fR4ZnLTE0YSVfta6UWPPZNF80?=
 =?us-ascii?Q?kQEQ8vWH0RwX8oIZdUYU3kzN07m9+uAHCIp6ggI+BLeC6ABoQrsvGa+LpOt7?=
 =?us-ascii?Q?e3MBJdjGO2pzXt3XRw0O+AAwb/FcM+Kl1qzEw28MaOP22tvKSnEolkoaAY1S?=
 =?us-ascii?Q?5lIL0Edqa8MmTn6+S/Dwe0huXSCl09H7ZXqBajC8zMvIhw1KtzNJFSMNXRzw?=
 =?us-ascii?Q?n1jm00aMteUq/1T1t+gY7unemH7cXdwYbpuL46wxQOlbdRClXcOX4ZVL6bk3?=
 =?us-ascii?Q?Q3Q948LAjnuLhhwIzOlWSUkDC8k+/GBMeNyhqxulsEKvpP2KuSUacb8UptmD?=
 =?us-ascii?Q?/QKxGVjwBqG2aHTk3djyCjJkmvIFFiHvRlafpMaX9tAwK0OkVa7ZQqsJTt3r?=
 =?us-ascii?Q?XVxzprzRiSpvUE8pNClAe1RtuCiWiNwkHlImmmmqmfXeQzbETQzAxLDU5vq7?=
 =?us-ascii?Q?Sc0Mh8KYx7PP1Q49euq6wl2l/xhAkpI/Jc90wmD5MHbWYMmSiph7Y2T6XStI?=
 =?us-ascii?Q?aWhYSDP6I3P7xad8C2SNGwzRJKyIaoPhlLnbzhyyWV5o2FNILblwl78WE2zw?=
 =?us-ascii?Q?yMq74H3ktvLSBikPwL7weDfrqMmJf8FQq3xyV5Yt4SbHec+hvECeTDxv+QnF?=
 =?us-ascii?Q?oplAl6EfY+jStYJsIE+MFPvEjXvVr/eHo3vDoH9ymM6C3ddKMl5/YVGclBXk?=
 =?us-ascii?Q?suxMtkb7MGdEAxu27Tx6ls6sY2cE/Se5jQWz+FfrfEotlzOwNSLeRVHMPgGl?=
 =?us-ascii?Q?WYkJPUSNnebKIZIFG+JgkmsZtLr/FMVolFLlyfm8+pdAgSwRACvK70drx3wj?=
 =?us-ascii?Q?7hEe/SqJTP7Mudypz/2qGBr59SPBjWo7F1ylwQ69snWlE5fRYdpMAm/aEvWn?=
 =?us-ascii?Q?CRRxNDykkwB07DEVQf0ndAmho5rVAp4otGsPKT0HSR8Dbj1zgc2uNnxbG7xt?=
 =?us-ascii?Q?EuS+b/jnUazE+VMgieJoZWYZqkuJ0r4oM/p4QXem?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f49df3ff-a831-41c2-4cb3-08db87ebdd0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2023 00:05:29.8304 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7m3PWHLgQRt332vB4iGoyhzZDR1JBf/4Fpt+pacGAjV9sFzHvUGZdbU1cxdopeLTkeNXMxj+NcESWB1RPmVYdpstJ/tFX+UbXikdKhX3aJA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7145
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
> On Tue, Jul 18, 2023 at 01:28:56AM -0700, Vivek Kasireddy wrote:
> > Currently, there does not appear to be any mechanism for letting
> > drivers or other kernel entities know about updates made in a
> > mapping particularly when a new page is faulted in. Providing
> > notifications for such situations is really useful when using
> > memfds backed by ram-based filesystems such as shmem or hugetlbfs
> > that also allow FALLOC_FL_PUNCH_HOLE.
>=20
> Huh? You get an invalidate when this happens and the address becomes
> non-present.
Yes, we do get an invalidate (range) but it is not going to help given my
use-case. This is because the invalidate only indicates that the old pages
are gone (and not about the availability of new pages). IIUC, after a hole
gets punched, it appears the new pages are faulted in only when there
are writes made to that region where the hole was punched. So, I think
what would really help is to get notified when a new page becomes part
of the mapping at a given offset.=20

>=20
> > More specifically, when a hole is punched in a memfd (that is
> > backed by shmem or hugetlbfs), a driver can register for
> > notifications associated with range invalidations. However, it
> > would also be useful to have notifications when new pages are
> > faulted in as a result of writes made to the mapping region that
> > overlaps with a previously punched hole.
>=20
> If there is no change to the PTEs then it is hard to see why this
> would be part of a mmu_notifier.
IIUC, the PTEs do get changed but only when a new page is faulted in.
For shmem, it looks like the PTEs are updated in handle_pte_fault()
after shmem_fault() gets called and for hugetlbfs, this seems to
happen in hugetlb_fault().

Instead of introducing a new notifier, I did think about reusing
(or overloading) .change_pte() but I did not fully understand the impact
it would have on KVM, the only user of .change_pte().=20

Thanks,
Vivek

>=20
> Jason
