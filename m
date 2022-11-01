Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF86614516
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 08:34:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 331AA10E02D;
	Tue,  1 Nov 2022 07:33:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F23B10E02D;
 Tue,  1 Nov 2022 07:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667288030; x=1698824030;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4nz0UXvGCT7tCzEl2umJyUiaJ+DiiasTVBRNzaP3PJ0=;
 b=mFILeM3FMfEmrllVR6BzKxDifeiVT7VQBhrs8aZ88Z6aODXxQD83jPyJ
 93ELxbyKKTWTvnpgsWd5WGR3FMvQMMKylBE9h+RX1g/RD7+dCr7wboCth
 tl1Qn2JSLLiMo01Tgg0OwphlQWJbgL1MjvBWmgzHEJ32fwJlkeLQ23bcI
 2/FNzsHFSlIeg/Ibq42YV6GY73amWJYDNthXQzGku7zNIMv+ICYe8V2p/
 oQLrvlSwfz0/Ks/T7Y9cj9hWqSg76Sa3+MBt0hgTf4wV+d56AyZxs5V5c
 YfuhUQAh3wJYZ+j7BdOE+1MaHCLC1pbIhivv+/mZLlFzigtrA8iWgARoi A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="309083926"
X-IronPort-AV: E=Sophos;i="5.95,230,1661842800"; d="scan'208";a="309083926"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2022 00:33:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="611772211"
X-IronPort-AV: E=Sophos;i="5.95,230,1661842800"; d="scan'208";a="611772211"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 01 Nov 2022 00:33:48 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 1 Nov 2022 00:33:48 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 1 Nov 2022 00:33:48 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 1 Nov 2022 00:33:48 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 1 Nov 2022 00:33:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nnkcSDH7Yvc/eb+vZN74W5qDIpQS8kBgnCE0XAF4euMlB4vv0r9sQhifwactHWiVlUvNBX0H1H+afBeIcUVsnvBFqH/s2oltsLEOoUg+K4Htnrfhwf02IBBeWj4tujFpsNVekGXQ8MQJX5fvRH+Bvnm4bkgvwrdHEZxIYvpVzwxDsl/d9R3Wqe0ErkBod84nXHxoMKrtGJ/y9ES/2oeUHx/BKRNO/QM5/2izuq/QMAD53IA5+YySFjQViVF1aCM3ziWBqxmpnD0Z294i39efMIx7pvjua98KMzxChQE4O+AY8hx4FpHXcMe7dEei7c6OYhMrzXQlRWLFU6nRa2wQXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BfPps1blCh4gjLM8DeAhCOpfBrLmBnSxhWK451Gd9BM=;
 b=TdQeybdXNd5G7XIdj+HrAy9mT7TxuB0/oQo8z+HEhKW8VeLnks0jsA2EW11V7tPcc6uu4h0d7w/JyEUdySxZqOv01zCDCpLSxVlaqDFusDEOvbKavF9vkSTyNKWds7O+PIeGSO5OCDj3GgKEA97O6VRDzMCd1mFtHvb7KAujcUCIQLL+hAoxnUkgAx+L9RMSfiScBR+eiI8vamJ5QpkZ+ehBpH5EyZeYbMUmaR742Fe5pJfh1xkW0EDdP85lX+6eXgmTMpQMWYOhYiRX5lIv+7Mnr+fhwgSJSG4+sV3AqmgoBW8TNXkc4k1ntSNcD/1KpFo7BmffCXzxysmFw91z4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by PH8PR11MB6854.namprd11.prod.outlook.com (2603:10b6:510:22d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.18; Tue, 1 Nov
 2022 07:33:32 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7%5]) with mapi id 15.20.5769.021; Tue, 1 Nov 2022
 07:33:30 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, David Airlie <airlied@gmail.com>, Tony Krowiak
 <akrowiak@linux.ibm.com>, Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Cornelia Huck
 <cohuck@redhat.com>, Daniel Vetter <daniel@ffwll.ch>, Diana Craciun
 <diana.craciun@oss.nxp.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Eric Auger <eric.auger@redhat.com>, "Eric
 Farman" <farman@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>, Jani Nikula
 <jani.nikula@linux.intel.com>, Jason Herne <jjherne@linux.ibm.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-s390@vger.kernel.org"
 <linux-s390@vger.kernel.org>, Longfang Liu <liulongfang@huawei.com>, "Matthew
 Rosato" <mjrosato@linux.ibm.com>, Peter Oberparleiter
 <oberpar@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, Robin Murphy
 <robin.murphy@arm.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Shameer
 Kolothum" <shameerali.kolothum.thodi@huawei.com>, Sven Schnelle
 <svens@linux.ibm.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Will Deacon <will@kernel.org>,
 Yishai Hadas <yishaih@nvidia.com>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>
Subject: RE: [PATCH 01/10] vfio: Move vfio_device driver open/close code to a
 function
Thread-Topic: [PATCH 01/10] vfio: Move vfio_device driver open/close code to a
 function
Thread-Index: AQHY6J4OabECb6RpyECNO5mkEfScrK4ptmxw
Date: Tue, 1 Nov 2022 07:33:30 +0000
Message-ID: <BN9PR11MB5276DAC741E77BFCFAADB35B8C369@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <1-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
In-Reply-To: <1-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|PH8PR11MB6854:EE_
x-ms-office365-filtering-correlation-id: 749aa536-1caa-4d4d-6762-08dabbdb5ff5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xZtrP9f/SpBZ/FPL/h448KWYWGJDUvfmNn/IuQ74SbXycEFeAFTlFn9T1XeD+AFg+RGLAQQ3AkU85S9ZE2fhEftRElB846Ie1q7hmz9iwcKnTdUZH7Y6M2NN/OaULf2HKu6ps4Zwn+x3LodRJUI4OMfTCjFTeR7D12JhiFQ+h9hx/ikzZRui57+lUaV1l/xo2pmDUh/pRiQeAWyFoAOJoVTURT+Xjrd2eQZE57FixaOkXrlNAOSJ1Su+GbYfhgprxYP41OndxTwEfJ8Y8gzXh94vmpT3XLx1SV9P6sT7l0I6WT3cYYlLhNBkGIvx0SQXvPxzCkSs9dz8fp/PDtejlStT68U4GmPVzYRfu4lVll/ssFE8roLqD8J9N8MtnH0pqmRPFGBqvKc41wMQ7dzAjuV26wchesx5KzWdgGQJId6ulRZtbAd9FvRC3UMZQjmNUa8JiK2Iw87FD6usdKgifJKLhx8dV93YDMvVHRAibvOFnnxwE4krg+KCQQ9ARDXP6xfM4moTufTq+QqIItjXwk61wpS92R7BlBKjStzbk6/6dRobKT3eX0VBwh0maePWmEWVDmYPv8OHNDA8+Fxse1n9AF9yz9XTWVZItuUmq2hkqDryj+GigdPp9YMyXV8B9xdIrry363TjNxv6yBXrhSvGAz809g3Zxz+opAw7uKwbNR3CKGlpW+t82FD4ALzX3LmJHMkYBEPiLKl1iXjGk7bVwL88BRhxLrPUWsiFVF90x93PfrPSIM3yTZHvsmcK6lm519E5EVb+oFmc+ZhRs3L1eaWt4X7gYlJ5BCBsv4k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(136003)(366004)(396003)(346002)(376002)(451199015)(38070700005)(921005)(122000001)(86362001)(186003)(82960400001)(33656002)(55016003)(2906002)(71200400001)(4744005)(7416002)(6506007)(66556008)(66946007)(7406005)(7696005)(478600001)(41300700001)(4326008)(54906003)(66446008)(52536014)(8676002)(76116006)(66476007)(6636002)(5660300002)(8936002)(110136005)(64756008)(316002)(9686003)(26005)(38100700002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZU58MuLMHX6Glxd66k7hWxcxjZ2fhdJiNt+Z1YM3khhxdqvXFAjDyaBWpslR?=
 =?us-ascii?Q?yzZ2sSfmxI02cbVTnSEcle6kXQ1t5Wezc04+8aQqcZFg89Xcfvp6kzLx+xd7?=
 =?us-ascii?Q?w9FecEHTxuh+ZD2Ug5K519ceB21ekL9BolvAYe0MKLnuxX4vloRRckUndQcm?=
 =?us-ascii?Q?2Cl19I4sVSDum6o2wHIdlgiJsx0jHzy/u00aKY/Me1EalmZPa4CwVNGTzz0t?=
 =?us-ascii?Q?GZ5tohYWV8nMXPTgQ7WpAAfxGx/zSgSqLLfDUp0QXPLUiQ4l4ykBDnQdIpYd?=
 =?us-ascii?Q?DoDW6HRCLqSOs0CiTpjRNDX4QZZ+amZP9maCKYLi/Xp06rS8NMxHk2o8vRGy?=
 =?us-ascii?Q?F0utldhMUYw9dm6lLWc4GKNdoOfEHZIEpqSG1ra9DHtixpraKi32slrbu5Hw?=
 =?us-ascii?Q?ft8vuXVoCVtg8gSp7y9tI3yBdGhYI4lMYqEMBnNzPw2cNGnjS3JhkWfY3Llt?=
 =?us-ascii?Q?F8d/frCycjYo+KxbJuM6aAxT07LanNHuep4QheXczcbs+rW8HdJygoiyUt7B?=
 =?us-ascii?Q?kcPsKeqG/VFqW4NY44PTxwN30n2NYeNsbNYPAshGYTgJZdZ8B3rlTpxwEzMC?=
 =?us-ascii?Q?GDItQnd3gJPSideOJQNZOWvHK87bw7pYaYQdNYnhiFWqAW6+QzOn3ff7Ypiw?=
 =?us-ascii?Q?G0FNmhBTBUFc0y+pDMhVjYxHZ6M9W9jGShSmWBajKqJ9Q3/Srd4nN0NM6/Rk?=
 =?us-ascii?Q?X0Njj7OhHm8Z4cK3ejoNoxqiwyX4S8RN1rqEc/OsfLjOw8R3iXeIUYA3mF2i?=
 =?us-ascii?Q?HtBbSf18DnM8xpjwuTdxIdw2zJoyiuNucF53HQbsd9phytGgdmD5ioupbdxW?=
 =?us-ascii?Q?FLohqdUMUzT7RfpL3hRXQ7RcpsvTWvw2toKSNRFE3H33VSEeExjhRXz6gxpe?=
 =?us-ascii?Q?Qz5FL6UZfGCYJCRrgB7UnQsuGoboRplJG+Kx/NJFFHkruHSdahrDvx3WM9mt?=
 =?us-ascii?Q?y8jAtQpz+vSzw5JYPv96CDq+F9qiZ1kIcWp/0QsfpeSLhc3JRagKQuYarlTH?=
 =?us-ascii?Q?ePEUztXlepCz6dyOJW8OjSe4JhvYu0Aeh6g3z5i+7iq7pM45N7LBLKqECdso?=
 =?us-ascii?Q?fRk2UJVg1y819+UcizB/fbXvWEQo6fNG7dqvCM1/gbusfm4WhzXMDS2RTY/i?=
 =?us-ascii?Q?vwR+AM/DYn6R4JW+In4yaic6TetlL9j9xxIJCKe8tjuRT9ho/GYmp2BXqLYC?=
 =?us-ascii?Q?b5EOpnWYdtGsWqz3EqMdPw9YT21RppWlvhskgidcgQg/h66hweAjAS3g0zxB?=
 =?us-ascii?Q?ym07NwuML9NF6XTgpigzHZvZHsFcfG8ZXvzd2HZQYzp2lLg5uaBtLT7BytbK?=
 =?us-ascii?Q?BdOFAZHppTdrfR37mvz270i7FsBNJx8l+ihln6OUsvse+bMLEatfe7UZhCkM?=
 =?us-ascii?Q?BhHPA9khgqI/1+IaHbv4l5WCy01DC+AIVZAxP94F/wY78/F9VM8KxGDiNox+?=
 =?us-ascii?Q?q+T1F+OzbMKtFSX/VdOIntastHFIfGe2pn3INeTEwLctacPMB60kNxXYllN7?=
 =?us-ascii?Q?Z8nepXn5N6a5NAHKUXQI6dIiWBX9o6cAUp6kVx3NQPyOzN8SG7p7OR3C7kPJ?=
 =?us-ascii?Q?zg1MFoShl43bQ9cu6/HL9momCmKt0Ih9uN1IeJhQ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 749aa536-1caa-4d4d-6762-08dabbdb5ff5
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2022 07:33:30.7871 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tsJcjnQOyXSdY5TRpSm3rsE9hCwzL8kXUjz6qgLRYpQA8B+/fTlDAEmsl/vs+tXJKEui394yCsF84eIxKoWX6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6854
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
Cc: "Liu, Yi L" <yi.l.liu@intel.com>, Nicolin Chen <nicolinc@nvidia.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Wednesday, October 26, 2022 2:17 AM
>=20
> This error unwind is getting complicated. Move all the code into two
> pair'd function. The functions should be called when the open_count =3D=
=3D 1
> after incrementing/before decrementing.
>=20
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>, with a nit

> +	/*
> +	 * Here we pass the KVM pointer with the group under the read lock.

Now the read lock is replaced by mutex. Let's correct it when moving this
piece of code.
