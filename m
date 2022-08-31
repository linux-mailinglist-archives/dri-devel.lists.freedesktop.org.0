Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA9E5A762A
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 08:04:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3194110E1D5;
	Wed, 31 Aug 2022 06:04:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1373D10E1C0;
 Wed, 31 Aug 2022 06:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661925839; x=1693461839;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=O0dd6MC0+L4iRE/KwWuGaNJ6S+7n5AURg8FMpmOwZlY=;
 b=QCHKMv1glPzaehvoogxrGxYL5Kh0ukbeta51Bb3sDoB/EnRuPRQrS509
 jv+INyOhLsZscUiZdgOhvVizpiSY1ajXw2BGTqACufLkNpVM4OIsbxTiu
 7lN7FApwATM8LpFLom+qKjUUwIk4izo6I5HSnUcmnuKBFGsbMqsDAR4me
 He+2kW3ef8rCM+Zyq4R7q5kbgauQZGmD4ETwbA7yYvIwuvwCjTJv9a/hk
 WEttKJC/J/HHrWjdJKRAitCcTQ09e6nz2ZeHup6FF7LT3yIV1pcqRgjuX
 KIs5mEzdoEAsusd2QUAzV7ZI3hFVy6M/3n4iarJm5DJg2lU9zVWSo8Arl w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="296164541"
X-IronPort-AV: E=Sophos;i="5.93,277,1654585200"; d="scan'208";a="296164541"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2022 23:03:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,277,1654585200"; d="scan'208";a="738007380"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 30 Aug 2022 23:03:57 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 30 Aug 2022 23:03:57 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 30 Aug 2022 23:03:56 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 30 Aug 2022 23:03:56 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 30 Aug 2022 23:03:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ddY8Uu8tl1tmO47gF0zqBm1lTgNr5zWLLsS7m4xL8HtJwbxj5jty4uyBLP/RtLieqZdGzXFvK1eTtcTAM6glElzdzVYtbPMSSou0UeBqtDKAlRTQUw3sCPcJMdf2JhAutuY/pL38qdxj8yxxbvmOFJVpDKQmAeHM76hkWNDdjC9IIgfXXDNgmk0/F0UTZKcZKKN8cCmILUZKJ42hsfOJPLAd/yqV9rboGJfbiK3HaylPjQOGRDD+iubI/tfN+aKPxoyyWlgw0Uhx+9px2fI73zcZYf6VYBojm7hXF7K5wOtS+dKmMFDRXfgC+7Bp0CYXq3ni+t7TKOE+6zNu24PLuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4sw7USuCOuP2MVZMu5jQE00cPViUqw8CNite/GF0hpk=;
 b=VM7/ST9veCdGbazxENNVrCAStEmwVQ8rpJtGg+iVeORDsUFfwHre7vnjjeRVqAIXlmSnpTkBSolZK+auCBooqvx8XvGInbGM0B6oHvDTTvKn6xPYHfmsyHBu0/zn5UnNkIFZsy2vKHrpn2wkHANW2HbZubN8XtSRP9VXJO0Njp/C1j4SkgyrUiHAxgBDOwiZhf3mEOHXqTAsOn9hcHsr0GEjH6tSrvUc6s5vQ5im6LMJXH1D/echzkgQqA5VKusZxoWB/9N58t7kGtVggvpcvexXcWeVt2xa4R2JwNvvlqGkyBYoYlSgz8HaKYfI7f84ZRxvjsdpi9k+bqlo3FQO9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BN0PR11MB5695.namprd11.prod.outlook.com (2603:10b6:408:163::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 31 Aug
 2022 06:03:54 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::a435:3eff:aa83:73d7]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::a435:3eff:aa83:73d7%5]) with mapi id 15.20.5588.010; Wed, 31 Aug 2022
 06:03:54 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, Anthony Krowiak <akrowiak@linux.ibm.com>
Subject: RE: [PATCH 01/15] vfio: Add helpers for unifying vfio_device life
 cycle
Thread-Topic: [PATCH 01/15] vfio: Add helpers for unifying vfio_device life
 cycle
Thread-Index: AQHYufpgD2KvzjTjxECQ8qBhswxZGK3HeMwAgAAYbgCAAPkekA==
Date: Wed, 31 Aug 2022 06:03:54 +0000
Message-ID: <BN9PR11MB527696C9C458E1DE6E60B3A98C789@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220827171037.30297-1-kevin.tian@intel.com>
 <20220827171037.30297-2-kevin.tian@intel.com>
 <907c54c6-7f5b-77f3-c284-45604c60c12e@linux.ibm.com>
 <Yw4oUL33TbJK6inc@ziepe.ca>
In-Reply-To: <Yw4oUL33TbJK6inc@ziepe.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 382780bd-ddac-4a6e-b3f3-08da8b1695bd
x-ms-traffictypediagnostic: BN0PR11MB5695:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rdBkXeZHpxHyKERYWc5/2MXmfbrkMqiqW5C8M8HdxsCLgwZXooiPLjzcLp9O56reQdGYIKjxEz1Mf4/rcug2p/6oKhS72T4Ccx0GTV3iW/kLGq8KQ7YCCOt8RiHdwzCX6Bw7L3+qb7NKOJyJzFno618vBNJ+aia/MYZd+cLH9uNukX1yiU9480eb+gLeUQ69n4PjFV6VhmZSiwcFNM5hudMTzY+f/drALi91tbCBnTFOu2hsbDA1Oc1PVNSJgoL7vobXja2F1eNrfFw4ctOQsi4r4o1137UpwWNcc+m0LZzaFvluHobjl50afF4SQB1Vj2B/Gj3bBLv3wlFlRA5ksaaEeqMm8gKfk1v20NQMDc+HTqosaGFuqm++pkjv4v0zhnp4mzyFksL922WE/AdpFiG+uqf3nvgGjymcuA7aikmNIa+zoiavSonrX/4VjDK9X60oPPogdiudGMtXiHxSu7lbQKHkr0tO7DV/Z1taY6VxZcDMnS8eGR6/Ld/InCmv9EPWwHGFbRj5wsNJoYent+P/mZ53Oal2C42u26P9WF6Z2q3Yu0bQnGKflEThaCeOvTKw6LY0rRQwoLc4xj18kKTPwlnGmSAPjfm2k98Orv1zGiNZuGC+Eoga62pTd2sImVMo7cBs4d8FYoIW9BubIuJu4NElIIUkjnjX6R8JkcvSrj49hZaJm0iedz5dZwMXD3xCM6nHiJ+yRnyh0wqqNQLxLPWmGRyKRvyucJ9CbksBbs8fm+Rxo/IBNEBsKDw+gqBf9IQmjQPwKQtwM8T1EQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(366004)(136003)(346002)(396003)(39860400002)(478600001)(4326008)(66446008)(66556008)(316002)(66946007)(66476007)(76116006)(110136005)(54906003)(71200400001)(55016003)(2906002)(8676002)(5660300002)(52536014)(8936002)(7416002)(7406005)(38070700005)(64756008)(82960400001)(122000001)(38100700002)(86362001)(33656002)(6506007)(9686003)(7696005)(26005)(186003)(41300700001)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mGMfSgAT9GYZhHkZc0w+sedZmAi4IvFxtqayCG5hRQWo6ZL+DSc1DEnYvghI?=
 =?us-ascii?Q?oLiwBkGHjEc6c5++VHnV4LL0qcRJuzDf6o/V0DBnJ85qerj42FGqECd+RNJf?=
 =?us-ascii?Q?mI3dw6wet4I3TuC5uy9tb/jxbx850cVFlTQztBn0I+lAC0NDfSqvFQsAOAZu?=
 =?us-ascii?Q?OCMxY2lQ4uZHCYoVZdKZO6cpASBDJ7azXaGtQTZFPuKtZsld6jVDSQVG0URf?=
 =?us-ascii?Q?JupZTuB2E8p3SejLlhMCOs+rXMstbvpMMy862EX9xj7aTAavJKKO0UNEuN3x?=
 =?us-ascii?Q?tv7KoxxK0sFrFeONBsCuX8JqOQuBJTlfpJ+1dhn9k1nzqSUyOtFxuGPXkK9o?=
 =?us-ascii?Q?6g29iE7KCT3QQrJt64mJzNOkLYkHx8i3UzTnIXTFzg6dyZxJS9jw/mz8Yeyx?=
 =?us-ascii?Q?TKSC1UsRj5xNXLrRu4D+v/D1NPvhEbWalqHc8HmxS4GNfM3ebvANoUVxBGgC?=
 =?us-ascii?Q?CnhQ1918Ekj/IWX50vzQoI01UMQMMZlhtb2P6aK4V0C06CK/YMx3An9LPUAH?=
 =?us-ascii?Q?8tIBcYr6vlI9DFUHFSvU8kSv0K8i+3iiaL3ltKRkQRZuZpS+HiKCUL4F67SH?=
 =?us-ascii?Q?PhrDJX8lANDSYQexUQSfQX/7EtQ2jPUzDl2LoqUkysGDmqVDvIdKBEQDNZ0r?=
 =?us-ascii?Q?nsW1uumrhbQA5YX+TdKlMKY1wDZ4/kxlEb2FdJMLUg2qmJe2qdUstb7Mb06k?=
 =?us-ascii?Q?eFA1AvYOU8cEoyFoGamNDNKBJVGTESNtBusrck6MbScedhFI1AYn43CQ90+k?=
 =?us-ascii?Q?S4vC1femWmNgYSnV2PmDMIWFmvupyd+8H4eQkujaqctjs+ZAomLDUSL1xm1N?=
 =?us-ascii?Q?O2w7Pn8leWEWSQe8yb1xneQx1s7IFJlQmd8OQOTi+XdAcQkbZZdyT+qKvw6j?=
 =?us-ascii?Q?1bpJwl4cSrWpuurfvRaOf+/P/9zDiS3k1wMuTkfb4D/vhTEdUJd8AkmDzZvz?=
 =?us-ascii?Q?J31ejgiF1fNwvzH2OkHUyhv0w8/qSCL8Wh2YEJ8DzSJONAM1BbhO0GfV8t8j?=
 =?us-ascii?Q?tgCG78hEG/EumGPkTPR8DVVRr4wQ4a7HCKMeKhSYE9pXw51AusrfFqZLZjOx?=
 =?us-ascii?Q?9ShzoHyKqpzOhLetO6AbdQ2IbV6MN0+w8qwNYWmABAnHsZh7LamUhfxV/lpT?=
 =?us-ascii?Q?TJPd9sYaE9iBh7oYi2ql7+xdjI1gvIFxT2VIMxQWqNeqEQ0MJ+32YQUxSQc/?=
 =?us-ascii?Q?0qZ8timPa98mhxYGD2SohCAvTLUF+VcUCBshAHKCfVjjV0PmEATL5WjKYR66?=
 =?us-ascii?Q?Ox/EjAJxtsZUQQsuNQAPifryX0qHh3c8nXILc4Jo/Zdv+MBISktXVgkOtdPX?=
 =?us-ascii?Q?21T8XwchxJ97RzQ7vR6TyusZUAPTjdlssqh1g6lcCJzFVHV0JKTAz+bQNVkk?=
 =?us-ascii?Q?+WW8+t6DjnjVAHkkXsvxF7i7CoDTDTJE21iiA3fZaiDX/qrbTIq8FI/lFPBS?=
 =?us-ascii?Q?kWAymkfK9MRVqrRGFefgTzo92EXfLC1Z32PH2m1NW85PSyptrAdYKpqzwo6m?=
 =?us-ascii?Q?zULimoKn7x+32SPjYKKY6Urf6+FNwdfYoBzjnZWcq8lIzpmv+6bRLNmJoYr5?=
 =?us-ascii?Q?pSS1Ik2vhS92RTcPKj5d8VpqFpNT7ekQy2b+vOOd?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 382780bd-ddac-4a6e-b3f3-08da8b1695bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2022 06:03:54.3500 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pnKxdQUPv13R4UoXG512sc7SQ5gyVsFPYRnXlCUC7TLSe3eDXVGLaAS6Hi955A0MC4Y8U3gcavcQ4aRn5tfodQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR11MB5695
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Kirti Wankhede <kwankhede@nvidia.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Longfang Liu <liulongfang@huawei.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Leon Romanovsky <leon@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Jason Herne <jjherne@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>, Peter
 Oberparleiter <oberpar@linux.ibm.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Abhishek Sahu <abhsahu@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Jason Gunthorpe <jgg@ziepe.ca>
> Sent: Tuesday, August 30, 2022 11:10 PM
>=20
> On Tue, Aug 30, 2022 at 09:42:42AM -0400, Anthony Krowiak wrote:
>=20
> > > +/*
> > > + * Alloc and initialize vfio_device so it can be registered to vfio
> > > + * core.
> > > + *
> > > + * Drivers should use the wrapper vfio_alloc_device() for allocation=
.
> > > + * @size is the size of the structure to be allocated, including any
> > > + * private data used by the driver.
> >
> >
> > It seems the purpose of the wrapper is to ensure that the object being
> > allocated has as its first field a struct vfio_device object and to ret=
urn
> > its container. Why not just make that a requirement for this function -
> > which I would rename vfio_alloc_device - and document it in the prologu=
e?
> > The caller can then cast the return pointer or use container_of.
>=20
> There are three fairly common patterns for this kind of thing
>=20
> 1) The caller open codes everything:
>=20
>    driver_struct =3D kzalloc()
>    core_init(&driver_struct->core)
>=20
> 2) Some 'get priv' / 'get data' is used instead of container_of():
>=20
>    core_struct =3D core_alloc(sizeof(*driver_struct))
>    driver_struct =3D core_get_priv(core_struct)
>=20
> 3) The allocations and initialization are consolidated in the core,
>    but we continue to use container_of()
>=20
>    driver_struct =3D core_alloc(typeof(*driver_struct))
>=20
> #1 has a general drawback that people routinely mess up the lifecycle
> model and get really confused about when to do kfree() vs put(),
> creating bugs.
>=20
> #2 has a general drawback of not using container_of() at all, and being
> a bit confusing in some cases
>=20
> #3 has the general drawback of being a bit magical, but solves 1 and
> 2's problems.
>=20
> I would not fix the struct layout without the BUILD_BUG_ON because
> someone will accidently change the order and that becomes a subtle
> runtime error - so at a minimum the wrapper macro has to exist to
> check that.

Agree. And gvt happened to hit this BUILD_BUG_ON when this series
was being worked on.

>=20
> If you want to allow a dynamic struct layout and avoid the pitfall of
> exposing the user to kalloc/kfree, then you still need the macro, and
> it does some more complicated offset stuff.
>=20
> Having the wrapper macro be entirely type safe is appealing and
> reduces code in the drivers, IMHO. Tell it what type you are initing
> and get back init'd memory for that type that you always, always free
> with a put operation.
>=20
> Jason
