Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 348245F0286
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 04:03:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B57C10E069;
	Fri, 30 Sep 2022 02:03:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D2C10E069;
 Fri, 30 Sep 2022 02:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664503423; x=1696039423;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lVIl/NVZEeuIpx+8GigdA5BBv9jC0bKZCStc63POn5g=;
 b=JQu3RpINdFNcWA+g1vv+zGuXZxN9TZNzSomGNUA3j/jdCbUs2cybrsIl
 qkLLLAAGQ1uHGfWHAHHexZHok3iD85D+mTEkKo09+B+Og4L8lDhvyd7i1
 YExV/0VaZoQu4k05eg7UKYEMp2t3IOFJnBg9DAus+CPsfNSDASjxzCH91
 N35kuP57QK74orUL9O5bpj+f27z880VaD2pUyIeYpJJGG+TwHZWL2uhvq
 CNpEgqVueR7Hzh/fjHZw4f+1aUVjrZ8pZO2n92qoht5xaBV+K2yXU3C1H
 N0QzcX+ba3qwVPoLEP0XIlgu8TtWO+2VZYfWcpukHE2dRkds877V+FQNC Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="363922680"
X-IronPort-AV: E=Sophos;i="5.93,357,1654585200"; d="scan'208";a="363922680"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2022 19:03:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="624813882"
X-IronPort-AV: E=Sophos;i="5.93,357,1654585200"; d="scan'208";a="624813882"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 29 Sep 2022 19:03:35 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 29 Sep 2022 19:03:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 29 Sep 2022 19:03:34 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 29 Sep 2022 19:03:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lZ0Cpg1MpWLfSFPq5BIhl4pGhxeGk2wRmZV5OJDPRtnTsoqynVpeYHB2PQQfLXnggZ4OIpKx5nmq0P7AJqIj1M5VwnRqi2YZJ+FZLa6bHdspHbSRkxqh1fw4qAksREkilLoZi8dKaUFA3sxO18JHhqYIeq9v97Nu4YZWTSb2MTVLErPafU3t0xcTiOeZbhz4EbbP4wYjsvROC786ECdwg+FzxdNtEHmIBb/xBze0Lepx8EtLt+wGMHimp408vjmoEFw0XO0gj4IHTtw4gB9LVkrqtCCzlYA8+krwa+3TbMX9E9qWlJTaR1t9jkSeMrByh+/UVer2caPpdx3GFfH3nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3tjyHhhBugI3wif2vZyor2hAHJKe525t7z+aYx6vwBc=;
 b=ZTAAkOr83oT75RNSCrySY198C5AequR4o+GUgsW2AEQ1lf6N9FmDAaLFMjweCQcCJYFpxaYAhFOXtY4gKLbXoFrMIJnos6c30Y+VM0aBxv7vQRMcCByNN5pwXEWHIlCQnu7YdVpkzjUsykM2H+NfE+ZqvTkm9gBdXDT2nKRt9FMfCNyjFJjxg/jGvEHQIIZMd0rc22GpyESJ0wiP/su9aepAvq/B8BX2NRAvLYdHIFLPEVvYwMeUjtSY26ole44RrE4pyScxAAQ8VUruiuf0nvhi+hjh9QBLUUUIzD1ar3ndx5MrDTlU2Y16j4oblU5vFpNcnCaCQAG7CrckaBE4/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM8PR11MB5589.namprd11.prod.outlook.com (2603:10b6:8:26::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.23; Fri, 30 Sep 2022 02:03:33 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::ff76:db8b:f7e9:ac80]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::ff76:db8b:f7e9:ac80%5]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 02:03:33 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>, Jason Gunthorpe
 <jgg@ziepe.ca>
Subject: RE: [PATCH v4 15/15] vfio: Add struct device to vfio_device
Thread-Topic: [PATCH v4 15/15] vfio: Add struct device to vfio_device
Thread-Index: AQHYzWo5EpAZOiHe7UOcycI41xZJfK32ra6AgAAPQwCAAAmkgIAAgA6A
Date: Fri, 30 Sep 2022 02:03:33 +0000
Message-ID: <BN9PR11MB5276C87ACB4624A27F2C918A8C569@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220921104401.38898-1-kevin.tian@intel.com>
 <20220921104401.38898-16-kevin.tian@intel.com>
 <20220929105519.5c9ae1d8.alex.williamson@redhat.com>
 <YzXaxPpkc+90Xx+T@ziepe.ca>
 <20220929122427.3a3bca9a.alex.williamson@redhat.com>
In-Reply-To: <20220929122427.3a3bca9a.alex.williamson@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|DM8PR11MB5589:EE_
x-ms-office365-filtering-correlation-id: f5ed8afe-8ebc-46f0-1f86-08daa287fa6c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: diCmTE/YAFJhPbfmWi5zlI2uQW0Vh0AluMa1lWPtopyoHwybxk45U5RoQ/a6bPpEvlCQjK97jjgUYbiYaHMskRZb8KJHEdK7Mgz/NbKw44t+Rzgw5U30s1zI8hqUtjGwsTFPyAfiqp0f1pGzkwbkF0hYQOw3sjj9AJb+zf0j/G8lE58ZnP9kFKmeTdZ8PneIfgXj/PMpuvNJtVLLIrhKI7Ne1tNuEWbAjBQBJEkq5qxlgwTD+vm2O+iMJpnw0k3NwtSBQkUOm7AgghIS9e90e2NUjhNoXDkhx6s3cyu1Kg0CL6QVKGjOr8Jk8KsM5f39+y4YAHqNfV5jyUZFIy99rmE5Qnnu7MonrfjR5jMaw5lIqDp9dUE7K2Q/EULsotOutq049OsbYqB/MUcDIXTckPGlCCCZ05y5snZZUMknlcsTnq01WXMeKdG/l3IyPMxRFaCm1QKw7P3/bKQ6h3dbL6d4H17IJeb5D0wu2VOqIIcVWO0COW3tf5AEm+aKaTJqCIVv2XNyWyoUJB8ZgP0znIM8zJkaIU8EuKKKWtR4GeAir+H4gTF12kQYllejA1UgxBBMKBjYrIOq/FQ4qHtKrKou5plnj9F4eiy4bJGiFwKt98kFrpSSoR4BOGFH/qAAxNIVawTzqHrjM5vyR25YOdZou3JHFOH1pvp7myrw12YSOEyWS2jBGIcVg0rany3HVgc7YFHa+/TWq+k/C9c24Ivt8SkwV+yq4Z8AKHBuH0qQJ9yQ6VcUprJBhNGmn/hLE64Ktft4unIb9K3u1a6NPo0Ro28pFLKabEw7eZyAdRTGRU8+dg4GYZ/dCS14n8a+YT8TE8CQNULaRI3/nEuldQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(376002)(346002)(39860400002)(136003)(366004)(451199015)(55016003)(38070700005)(33656002)(82960400001)(41300700001)(478600001)(8676002)(26005)(2906002)(9686003)(186003)(4326008)(66556008)(66476007)(66446008)(64756008)(76116006)(966005)(4744005)(8936002)(38100700002)(122000001)(86362001)(66946007)(316002)(54906003)(71200400001)(110136005)(52536014)(5660300002)(7416002)(7406005)(7696005)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kVR5Cbx6RpJmbtd8PRI8tKcDee0LFE03pbog9kDN/qp4ZufBlSvuCv0qa4Nx?=
 =?us-ascii?Q?NyiB8Cc1R4X3UKF7hEmZQrtCQtV8rZn6wlYkLtqFwIlvm0JPUuRjT5M/b9y9?=
 =?us-ascii?Q?4HAZMWFdRk4KDXVegnrQetjdFXQU1AOSlDTVHC7gGxLjytUjKIUWCRRowoR5?=
 =?us-ascii?Q?pRjS0VNkyr2EkWJLKvsw31hrQCbhtIrbDe8iW2B1ijDYjP5i1MzMC80Jd/Ai?=
 =?us-ascii?Q?PMETX7lX+DHohYzzDPJZZpQ0rd5vwIlOs6jG5WT0u1wBsSlMtdNFMSdp25TP?=
 =?us-ascii?Q?D4F5tYYDU6R5+9bDuBuMi+7VrS2609GMaXsyLDK5dkkr1JP+f8xsMiPThmwm?=
 =?us-ascii?Q?QXglmc0aWxEsY19gm8MnaTyGn7Ce+1Sqbb7ytObx2/F9JB7R5AvMtUb1xP3J?=
 =?us-ascii?Q?7/JrsNgizLaj+/CTO/oJgejuOVOArRb05j5c7tso3ASH/ssiDqLtPgCGsa+v?=
 =?us-ascii?Q?Yeb7EVHzLrQvY96k78WIzRRvL86XIEsn7eV9JsNlAgzF+8Bgaaw6/dqgPexo?=
 =?us-ascii?Q?6Zyj2hRDb3SwkA/U1JFYM7zjUxOLaYWKEc1XKLJ8FWeOoMmlg8aStp0XHvTp?=
 =?us-ascii?Q?rKBSEj+CEOIWKLglW4OxGmTBNw+Vg2wiNsvcA8VbyI23p/fjrKGKFFjFfSkM?=
 =?us-ascii?Q?eaRKBdrcW/ruGWHoyCo2t8+ruslSLZTp3GKDXK1mmf+71diQ5K1VdDvs6o+f?=
 =?us-ascii?Q?elfseIZ7mZUQf9tqdDrpGQfwjTsC7nS28P026lOyM2iylHxNVgkajvd5X0im?=
 =?us-ascii?Q?jWyKtHPvARlipPSFiTT04qAPqunugtzhlL1KXJdYSm/kMWIRBnmyKZ/A7+hd?=
 =?us-ascii?Q?zypL1HYhEOhBldzBOs/lBga+Ew2HxG35tEykEQ3ahvHEp9NWUsD6T8/ot+AU?=
 =?us-ascii?Q?Da8h4RnCJG3wFh1OeErtDO88GCni7kwIgWMsRHaDYCm419Ob0SMFnCPZdRlI?=
 =?us-ascii?Q?wdetQ9lmeOdQWAiLYKeKpk3+QkUUI8myOwHzgtSiBa7DU+I8atgNnU95SJiJ?=
 =?us-ascii?Q?hcuRT++ZvDINbYZGnm+xWJsM3edHIWcw5UKUqLxFBNRfAU0D94RMoODHZDHu?=
 =?us-ascii?Q?1KZSk5acaJv/xZV8lvtXYcAvTtejeorMtvIIzXRPtC5dAboegBRVfRvjw6gx?=
 =?us-ascii?Q?OqTWBsm9gtRir5DYO4McvRVN2xJ/aUgRCGjHyU6MrZxVsLOsR+qestd6zwld?=
 =?us-ascii?Q?mLMuy6KDG3Ljj+1lJlQAWsNhCOw3kiH0TaWpPH4+ey5LtMNJEkTDyU9nwQ1v?=
 =?us-ascii?Q?laiKUGw+uDywsmBcMyUXj5bSgERJ5KFpzNBIpE9QupSMp+5nBRrfb6zX3BBN?=
 =?us-ascii?Q?QCIvKlfTkHQzJuoeApqXW6rIB1pE1FjHF48J9Ip7Y7V/7mctvqAeIJX2PQ6D?=
 =?us-ascii?Q?rOxlE6f9hLlEIMd694b9pphVeYH35HRBqrESz0hm3rqKMco00znb3tzFIuS+?=
 =?us-ascii?Q?+9kUGzObTyuHMWwWl5OqrDjrbNYcj230HjX1lSkhIqAXP6bdrKiMcMNiN9cM?=
 =?us-ascii?Q?OHxDmHfImnn3Dfl5zaovE3XB+R5gl5lk1Vuwu/x1eTWCgpU2eps6z9qLA6C5?=
 =?us-ascii?Q?ilHAb5qdzM4Hl5W/wkUZ8FzzSZdwET4Ifxb/1kXt?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5ed8afe-8ebc-46f0-1f86-08daa287fa6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2022 02:03:33.1864 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H7QRNh2iUql8QNqAhuAEHolS/OxiW6V6jXY4l0zxTH5HDKC8a0satB50hWcKN3IViSNJTdXfdRPb0THM+S3ZGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5589
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
 Longfang Liu <liulongfang@huawei.com>, Christoph Hellwig <hch@infradead.org>,
 "Liu, Yi L" <yi.l.liu@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Leon Romanovsky <leon@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, Eric Auger <eric.auger@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Jason Herne <jjherne@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>, Peter
 Oberparleiter <oberpar@linux.ibm.com>, Shameer
 Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Abhishek Sahu <abhsahu@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Alex Williamson <alex.williamson@redhat.com>
> Sent: Friday, September 30, 2022 2:24 AM
>=20
> On Thu, 29 Sep 2022 14:49:56 -0300
> Jason Gunthorpe <jgg@ziepe.ca> wrote:
>=20
> > On Thu, Sep 29, 2022 at 10:55:19AM -0600, Alex Williamson wrote:
> > > Hi Kevin,
> > >
> > > This introduced the regression discovered here:
> > >
> > >
> https://lore.kernel.org/all/20220928125650.0a2ea297.alex.williamson@redh
> at.com/
> > >
> > > Seems we're not releasing the resources when removing an mdev.  This =
is
> > > a regression, so it needs to be fixed or reverted before the merge
> > > window.  Thanks,
> >
> > My guess at the fix for this:
> >
> > https://lore.kernel.org/r/0-v1-013609965fe8+9d-
> vfio_gvt_unregister_jgg@nvidia.com
>=20
> Indeed this seems to work  I'll look for acks and further reviews from
> Intel folks. Thanks!
>=20

Thanks Jason for baking a quick fix! I've acked it.
