Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1FE5A7664
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 08:15:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FB1B10E1E4;
	Wed, 31 Aug 2022 06:15:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C54710E1E0;
 Wed, 31 Aug 2022 06:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661926504; x=1693462504;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/a8NfaXgmgPaEzJAB0o2mVog14TDaPPcLAKcCJVgmOI=;
 b=HHTpl5G87QGn3xgFy96rc47N0YSqosWE8x/CzWuCVG+smLbUSEPlgx/J
 8nlYi15xevJmNaUCFJpIqMFGLZmCznoNGh0say0laZS6I5xYbzl/sIA0d
 JyM6qTJYdgbhk+ewf3GCcSxf3eEYr7+Q74mwtXb0EmxW8voLC0mlE75p7
 rNyduQKeS7mqyYiQ9RbMU8yX7O1ZKU5Fylgg34m7bfctiZHxnbw0Mr68A
 Pb1PEidC34KeLGJLnXJ4g2fW4rsjYGpZW25pmAQ27C3EfRp/F3aVRMy9H
 nJu+F5v15gxKgPXQNdYljUGUrcJVPGKlGFqqhEt38Kq7wd2hQVHbwRwHw Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="275129597"
X-IronPort-AV: E=Sophos;i="5.93,277,1654585200"; d="scan'208";a="275129597"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2022 23:15:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,277,1654585200"; d="scan'208";a="562931733"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 30 Aug 2022 23:15:00 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 30 Aug 2022 23:14:59 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 30 Aug 2022 23:14:59 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 30 Aug 2022 23:14:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RIzHjeszVj/sBzI8ZB9eWKU9I6CZOQtqtWezzs1BKyO0csXQl5C4Rsk//7XsmQVJX8UUGj2QkFOXg8U/J25gAcBdI85tIA1W1/pLq8NWTWQLD3OeiQPxAHKStPQ2C0TS0MFgEVmj0KnTRR9OSCvHn5aLtSGkanS2MvSmrr36JogMWcSxEiS0gaMlDLnI68DrWduQP6+aV/WpVXdyAZV8gmHyKhMGo0XOTlSp3up6SyKl0/olmjbZpco52guJYX69q5Th/2Hk9HLmvCgY7YK6TDTga/z5n8Iid9sOGlseRZuEKZIIY89V6Q2KWXx/SM10w9YaH7UMgPMYAR4Pd0jEjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJ26j8Rv0tJv8NYmy9yTq1k3uvxIMMJyomu/D68P3vE=;
 b=YnE3on5I2DRACET/2CFtUF2N2IoicMf1AvzcIXD3kg6OpnR7i2GAaMaD3HhgciQgDdRF5mnkD9WhO2zEmtKZpaJinHXbMVBOE+X+gn0PjtJVMN4ArVw7jFE5mK10f9LlSRA1GELyagizE1X4V4hKGVVuybxqZgotD79CvYH7dcZT/vzlhsaXUpjBvW8ofmb19kDBZ04KxI82kEkX0yCYqV3H9LaOq1UIHymkDpAfZ40KfhDuM7OzTKG1o2WqyWeD1Xma0Y9kj73olx2JcohEAXX4TtSc8NiYEkrFq9Y5uzszf9ebGBgUCXXyMgT7Y39McCyPrj9xRAF9YeyimREK9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM5PR1101MB2233.namprd11.prod.outlook.com (2603:10b6:4:4f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.19; Wed, 31 Aug
 2022 06:14:57 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::a435:3eff:aa83:73d7]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::a435:3eff:aa83:73d7%5]) with mapi id 15.20.5588.010; Wed, 31 Aug 2022
 06:14:57 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: RE: [PATCH 00/15] Tidy up vfio_device life cycle
Thread-Topic: [PATCH 00/15] Tidy up vfio_device life cycle
Thread-Index: AQHYufpaEERp1jw5Hk6i2eOqrykz5a3ILwAAgABe8kA=
Date: Wed, 31 Aug 2022 06:14:57 +0000
Message-ID: <BN9PR11MB5276E554A15E589D364D37268C789@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220827171037.30297-1-kevin.tian@intel.com>
 <Yw6sqidAP7puXApd@ziepe.ca>
In-Reply-To: <Yw6sqidAP7puXApd@ziepe.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5f804c1e-fb9c-4613-c6f7-08da8b18211c
x-ms-traffictypediagnostic: DM5PR1101MB2233:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1IokXJhRSEig/VVcLQhsAFT0oWos4it92/8JLjdkx+B27COI2HSqE7CIhaTnRhG0ZNCB3dqtbcISLRsHC7Uw5bpyJP6BsGOPEvbNxy0DUcYcFdr9Lqc+fLMhZ/jHvjow1kwkjEZkPe91yUjlhUoLeJwFZURhToBf+D7xTQ3epNPPON91DZayPjFkv10cOTSDHVjfTvEm1CMxdE52S5nR0FU81jKKrv0so/2MITLxty1vqH+XlNuFdKVwTbvxAfgxUeCJkbcgfa+tcDQrL5COncPI/Uy1BaN2vdU8ncYgT0nf7tWoVfYVrJ2XmMbefty5VXPvIuSqg5ug7eN4PXVRPUMA+G8Cd5D8Y7508U8AWI5KD4v5iiePZdqJJqPoMhq1DqOKS5dMqc4iKWKy1nMQyT0UGmjPBbjCC2+RfFOnuRCSfbOg/DWgAtIlrTZDj86RRE14xM3w6mIk9UiuLUXZWguONyVkRUa5FZTHtW+Il0jKMH8MDgf6ogMthMo58AfBqkjJPlZiSb6kuTfrDHsAKdnh+AtI9WovSo5eBZLpzq3X2FcZ1wHIDRAhRjaJNh873JXOQ6u9DH2cRaylYL/dQalVV0fYVOwLxsqkaUyU6jAdue0Yx+WpNesQz6UByMnzlu5JGksNZvFUM7JJlaKGzgksye9U0Wsx5glJ5ZjNUOzrFIOstaGYGcQOiG3TndASElBDtcQd6j1TZdEWJSAVRmfu/pkTYVSkuvCtHJAYAIJfP0N97JO1dIsknHfyiz1NDBxHa/q0MKdG1ccvWkzRMw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(376002)(396003)(346002)(136003)(39860400002)(38070700005)(4326008)(26005)(7696005)(9686003)(41300700001)(86362001)(478600001)(71200400001)(122000001)(6506007)(54906003)(66446008)(82960400001)(186003)(38100700002)(66946007)(5660300002)(7406005)(2906002)(7416002)(76116006)(52536014)(66556008)(8936002)(33656002)(55016003)(6916009)(64756008)(316002)(8676002)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pEWIRCEgrhHsr4f2NZuRo0gMg4T13tPxAns8xUGxieV9T7RkeMHVgq7HOB7x?=
 =?us-ascii?Q?Ko1Dp3d4Ryp95B1FrjBEJ8bb6SfTOkGYE/boHHdpARzs/eM8K1YAFsPK/1bc?=
 =?us-ascii?Q?JYPiQksT7CshKDcNsqxubJW1zIQMc+e+LnAkBtcfO+idyR6IoFDMiClv3bXF?=
 =?us-ascii?Q?Won4UK4mplNqydI2w0DklY5rpREjasgkVY3ryDmr3lLABfZ5R2OhneNiX8UA?=
 =?us-ascii?Q?TelhSvpNPQXVWCwotYA1U7beiFQxRloynCN/9a+uNawsyg67JW7gFOFmU0mS?=
 =?us-ascii?Q?lVtZdbvxmhCwE2Xon1lA3FlTSRCVROeBlcCZYgHI8dYOtPoO+cK/GEFhKpmu?=
 =?us-ascii?Q?ZdSbKmsEkHgED+wAvsJprRe2dog29mmaWj3o0RCo2XB5xun9goROTKnCLFyg?=
 =?us-ascii?Q?GFgYYR6gkJTCDyLt+EkrOkpYB4lz5IjdxjOakbfcWY9ZjLIAHFnrzj7QRYkW?=
 =?us-ascii?Q?oHavoB5dvneERYPJEI72OFh4RA1e/1N+HlzveV8tX96AYNMhx22lpWLZ4r+8?=
 =?us-ascii?Q?I7gODI4AuHTexhRe+ewwo0ltl4L3RXol90yOJWbOVIH9M5K5TcCe8kiDeRU3?=
 =?us-ascii?Q?m0GYDI0hGVe1u0yPlbS6h21JF8fa0lNl5cKZPwo87/L2ZljBnap70o0qz/29?=
 =?us-ascii?Q?dI0a5UyuT7y0WHkmCyEGKWJL5gG8+s+QIOm/EvBRaxgzdBdz4YFBbnOIEPv6?=
 =?us-ascii?Q?Hito8jRlulUH2O4jgXl10ep//Z7MNr716Kehff6iy6DcH2KoSLHgRjhQTSug?=
 =?us-ascii?Q?tF6ydxlTAa9/uzp2kHqPuokmrqe2Vi6EW/jxtQcJTkGKEo+xwddEPN3c3eWy?=
 =?us-ascii?Q?1eskiiVVsTTsomTa3ensWVOCq/pZuWbFh64S0tbTQYeQK4vj3PhcmeDp6wMV?=
 =?us-ascii?Q?GUk673az+W1zE/QlKmlJtRC/lg1Z+xtLF/+riIFk8RaC5mo1gmhpL1EpVpzK?=
 =?us-ascii?Q?p+gth+iLAZxInOpYZ1LnKpu+IIWyJw3lWS/nQJSzhfGzUbC3+rzHcHyVXZdR?=
 =?us-ascii?Q?vAdmVVuSwBpwPAxHg3Hvcg3pC5LghtJjiK3WAyscu2Y/Fwh1E7cJLcHW/Wrr?=
 =?us-ascii?Q?MGB4tzCjj1GcdXEhZMUC62HUHsGTNmZRKMxtnRz0cH7pbrgYC+ecDPka3tp9?=
 =?us-ascii?Q?FYbLadyuF10+YLUHbltC4RD92TEecWSAiHiIkQ85T3TRzZDgAxp7JDk8nNOP?=
 =?us-ascii?Q?POIWEUXZGGntKHVcaYJCKeNckW91OkeeOYB7rir2ZQqo4PUuxhVwm/8OM0AZ?=
 =?us-ascii?Q?O7lkqfq8FZRVqIPrRiC6ZZbRgu8qmE3X3zQ/QSm8B+9exxrzPJF7MaEaUodB?=
 =?us-ascii?Q?3zZoZ4M5uep22Jj+r+SwQQtOaFNThjSsTWPpcAMKiIR2pjLMIL9J3hkSmlzZ?=
 =?us-ascii?Q?a7Mk/T15oOEQJppicZeItMnNZHliy0UCQf4uMdBQez6NdNFtQjVCSOUsy7Je?=
 =?us-ascii?Q?qb0ZK8MFNLvDWGMFA8Bv6w13zpZJ/pNSrvhSeMMmiDxqpM7PAmZRnHUrn3AC?=
 =?us-ascii?Q?BWC2D6CEGtcVHdMe4mM9XhnAJsY1XI4I8hhCdAEbp4if3flOX2b4DSReRN+5?=
 =?us-ascii?Q?O85r92YlcT1wIQkVp29M/MLumIPlbzME+DlDgZDO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f804c1e-fb9c-4613-c6f7-08da8b18211c
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2022 06:14:57.7201 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uTrvbfCwhxck7fWLwFET4dMc7FS5aCowdTiVppqyrPcGygv1WoUsGXd3Iive2URt+h5w3ppk0NfEzljW01fh5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2233
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
 Zhi A" <zhi.a.wang@intel.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Eric Auger <eric.auger@redhat.com>, Alex
 Williamson <alex.williamson@redhat.com>,
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

> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Wednesday, August 31, 2022 8:35 AM
>=20
> On Sun, Aug 28, 2022 at 01:10:22AM +0800, Kevin Tian wrote:
>=20
> > Kevin Tian (6):
> >   vfio: Add helpers for unifying vfio_device life cycle
> >   drm/i915/gvt: Use the new device life cycle helpers
> >   vfio/platform: Use the new device life cycle helpers
> >   vfio/amba: Use the new device life cycle helpers
> >   vfio/ccw: Use the new device life cycle helpers
> >   vfio: Rename vfio_device_put() and vfio_device_try_get()
> >
> > Yi Liu (9):
> >   vfio/pci: Use the new device life cycle helpers
> >   vfio/mlx5: Use the new device life cycle helpers
> >   vfio/hisi_acc: Use the new device life cycle helpers
> >   vfio/mdpy: Use the new device life cycle helpers
> >   vfio/mtty: Use the new device life cycle helpers
> >   vfio/mbochs: Use the new device life cycle helpers
> >   vfio/ap: Use the new device life cycle helpers
> >   vfio/fsl-mc: Use the new device life cycle helpers
> >   vfio: Add struct device to vfio_device
>=20
> Other than my small remarks this all looked good to me - for every patch:
>=20
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
>=20

Thanks for the review!
