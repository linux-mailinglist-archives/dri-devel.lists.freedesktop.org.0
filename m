Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B60E65E5A94
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 07:18:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8902710E061;
	Thu, 22 Sep 2022 05:18:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C9E110E061;
 Thu, 22 Sep 2022 05:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663823918; x=1695359918;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6bzUv1ohjixZI3/O+9rkkyN3hUgzljtfwmBugvgQmI8=;
 b=cD80h90VG29GAWHcI2m0rsZU9l8BvlNY6oHxLQMmpw/26tO9fnuxMfmQ
 uFQdOOZewnEggBZo05VqDqMnpof/ewBMyDQ6D9+uKm2+qgfvwEdSf8TIE
 8KrR5IuK86Z7MnbauZ2SqVdIw92PydxWTN3OAdbcFnWMlBkz1IfKDgFCA
 4/ef6ZG0xg2n7ClOSTcXtPQApN7OHPQEsswrHK6XDDeBVowkeRrtIb2gL
 mfokMF4BUqgzaAYfjTIE7sYLxzmRAsYsy0F0cPOtjIa46BuyFkyweF0bu
 bOhCVTsUuAJGaIfsuAIhlnE5jlK/5WD8yVg261m2oVJfWrs/TsEl8AHOR Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="301606429"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="301606429"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2022 22:18:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="682066016"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 21 Sep 2022 22:18:36 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 21 Sep 2022 22:18:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 21 Sep 2022 22:18:36 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 21 Sep 2022 22:18:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z+sfDWMZSmqCvGGjnPjz/ChO5guJOVWrd77BfQJJf8M1VTUYYbhoJIZ9Ruq+hD5Gwwsw2X2+nBhEX81XI4iWkm9KVyRtYVuyZfXmNjt5LkQGsP9Sc9qtYC4CfAxcp64ag4TunvETnGGvrF5Zepb+Nizz3EDjzLSb+ZztMU5ll4A4W5wYPPA4iAcNP0zCYmWej16Mm+COB/7Tj4u01wXvqzd5DuOAzXUe5xhxSeo1+ScrNWe958rh/33POEqH4k7TFP6Jgmt0w0ByxIiCFlV3xfNX8+5yZ0EZmCKz6qBmuj8z8RWioMDO9YbIcHW3ZNeye3dWr6TADn9CGUtRP2iCCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8Y9cH2F24v2GMjyCqj6ZceWd47WaqknHR/Ln/mfoiY=;
 b=DF4emeGZCctG1eJgKOPmW0lxdMZHU5ZfVxzlk4aXVeRTNl9meSbMCqyFbxDdlH0fJo7GS/+WqE1CP4zLGhF2clagm0zH3r9z6SK5/U3jAfhZWqafYkIbuMe+OLSYrducVyJoHUVYHAzrkSQdS2yOmWm7yabqq3hZ+qL4aOVwDXvDIlK9ntfiTMpbuBJu3zS+BFgmCcEg/O1qd37JIBH5cfw1Yxlqf7YcuS8gWnV8T9dXSVwRSpQnw9jMPG4SlDKaYIth36E+uq44U9SX4NmARNYUK+gZQdHqUc+HqfHL+6yQaNpKFNA8lU39j/suTROnV97YmdaTVsKSnWTj7eL8mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SA1PR11MB7088.namprd11.prod.outlook.com (2603:10b6:806:2b7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Thu, 22 Sep
 2022 05:18:34 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::a435:3eff:aa83:73d7]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::a435:3eff:aa83:73d7%6]) with mapi id 15.20.5654.016; Thu, 22 Sep 2022
 05:18:34 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: RE: [PATCH v3 15/15] vfio: Add struct device to vfio_device
Thread-Topic: [PATCH v3 15/15] vfio: Add struct device to vfio_device
Thread-Index: AQHYw/kWx/ZcHkFOHU+t8x4U9WUM+a3o1qGAgAAo6+CAASHXgIAA2nvQ
Date: Thu, 22 Sep 2022 05:18:34 +0000
Message-ID: <BN9PR11MB527652CF1116B185E4311FDF8C4E9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220909102247.67324-1-kevin.tian@intel.com>
 <20220909102247.67324-16-kevin.tian@intel.com>
 <20220920142639.29b1bdc2.alex.williamson@redhat.com>
 <BN9PR11MB5276484952784F5E336814BD8C4C9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <Yys3dZS5ZUByiXin@ziepe.ca>
In-Reply-To: <Yys3dZS5ZUByiXin@ziepe.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SA1PR11MB7088:EE_
x-ms-office365-filtering-correlation-id: f566ff25-801f-4475-ed00-08da9c59e589
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XHKUY8InvkMxB/A5H4i1gWmCePpSRzBc9GOJeGoPlxt4MRpep/xuDlM+bnLhhbvZ0qYq0UyHahXlJBtNHTkQvyvs86wj5Xs77oG36KuDczlD2N55sK2LdxqkzS2e+RYwplDEzJNTp865TrTz8jqSFhQw6thouykCiNGmYns8Yn7UTu1VqqFfTMJvaJPk9CaPo46pWI611KHlRDUL5w4IwbbRqfau9NEbcz32Zh6hb/fAHO8P/HBU2aQu9ijHA7YwaNePnYZTJ4Tuahsr2xafR5SUgKTdOPwWG9VwHu4GS9A6rzO8jyHOK0xs+Irk8VPz6us0Pj40utsf1B5zBlgMwuEAWqsgivv93Jd1+gxxBZcxcVwEbFMsqu+zlwWUgBNJApN77SgyBKAFS4Tgx/PL3crcPxB5QZNgLrfJguRO/Z4OeoNGpInBiGOfD+4Ec0rB2s4Mo6NYZWXhQILgokeBtjSRC6Mu7PWWSGpFx08trtRs86cGHcHWmTSMZb0s3n8TgvgFI/RSQGRF2Z0iumaAGmjg5QW3rIHlsLLWuSoEUcZJ420kfEg0pJFWAK7LQxb5Cb5paALTcow2am7vsPEROq9oQF8teHBXnuK9H304g/eHDV0c3SG4vonO5/J05/nqV3UN6sV2BTtMl90iGY+IguMjU5EGjM4RgqqaRPikDyoZw8ZEolkZmSXLndD6wUgFOjS0XHf8U8pBxiOFFqKnfYaRL1rUQHbwH5j7l/DDJ22iOx5wn4Ro6w+BqXGFrZtFrmohVphumrsXsZZQUEB5bw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(346002)(366004)(39860400002)(136003)(396003)(451199015)(2906002)(55016003)(316002)(82960400001)(33656002)(38100700002)(66446008)(66946007)(52536014)(66476007)(8676002)(8936002)(7416002)(5660300002)(6916009)(64756008)(7406005)(76116006)(86362001)(4326008)(66556008)(186003)(38070700005)(478600001)(9686003)(122000001)(26005)(54906003)(83380400001)(71200400001)(7696005)(41300700001)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pfLEVQ7Asmksu/BPuqyqMwJ6jx6suUm77UJCed6Pl9alwqiCAFhWrjVJ1LQQ?=
 =?us-ascii?Q?aDcGJInqAl5mkeHbKC8VMzbEGxnvhvsxzHwXRFwpQjBambTK1/zTfADrHdjm?=
 =?us-ascii?Q?TaRju662U2ALsElj+ZkCe0VXLOL2PHx0mOSwp7y4qHRYRW+XcBa6zQ0mOp6d?=
 =?us-ascii?Q?/uniVYDK7BN848TauJPgFwWjZ5R7zaCtNdasBkBb0OpGC09xxscQJ02LaxDl?=
 =?us-ascii?Q?7Nw1a120bEs6sEYoxRCjk9Ias1eKNYHkUQ1Xu/dIadEE/CCKJulxeUtdK61O?=
 =?us-ascii?Q?9kDxUJbSFxQcJGFCotmgvDlqjihTorzp3UABIjRXKteSePn+AD07zbtzj8hl?=
 =?us-ascii?Q?tdHHeU+YF8e0ErQt6KA7wLtjxHABFAqok55UQDWzREffsgtmYH/I4a1foovE?=
 =?us-ascii?Q?gi0KRmW+qWGZpL/Pry50Rk2HyyVrLc/YrSWxFDzw76KxhKxqYuQPBzbP3UYB?=
 =?us-ascii?Q?TwfhaYcrDkENMAEX6K2jf5TJfBLyB+QDfMZlSqJMFYprdbGKa0RJaiQLNS/N?=
 =?us-ascii?Q?a1KkJUD3gggwJNigtOz7og2rcvd6+eZAJPwQfm1xKSjI/yyiLS12zz3GC/jU?=
 =?us-ascii?Q?CPYRn+S6pO4N5vYQu3cMVK/1Wyuow7ubR7nMdWhrmLTYuc4X03zoIfsI3Xm5?=
 =?us-ascii?Q?Y2iXBad0EdjqgUXW4whYCJTSH/91Kn048clKX28o6z8uQYq9nMXqzq15YrKg?=
 =?us-ascii?Q?zuXblZcR72xmoT7ePPrQhrCbtW119iZUUfuC3t8tGHLKuXjzlkydfJNJcYey?=
 =?us-ascii?Q?VY3XfiF4l+fATMzbknbVRuBK0hnAoNQrC8MVOqdojPaLGLInLcAGnBK6T+JW?=
 =?us-ascii?Q?KFz6HQnER+vxSxULjGlsDoFVsh/fNqf5mMlpPstCPEI6owXECfdOcfRaBghr?=
 =?us-ascii?Q?dP7s3oNvTOvXBfhZ2GS05XyASbB3sTYWHpo+rEqra3kRYbatVZ299YjBO49W?=
 =?us-ascii?Q?hkhc5Z4wFY/QJhMxQPHYYFlziUrlc5e3H0wbyczs+u5kcq+xxZ+wD0y1dzLd?=
 =?us-ascii?Q?dIwqcUxWvlI0f5ca5aErNZ6D/ioQXxP9stoZsbGa/hvdveDCRbFeXCX8OxTq?=
 =?us-ascii?Q?O95lARbbFU7Uq8qQTTCrfwEV6s4bOCEJToy8AcbPb0ybfRAken1gHlg1YFDz?=
 =?us-ascii?Q?EU5W8MYCKqDb2rBFGOLcSUZwUouBdwcrAtIKcfJXBT6UMb/2oG8HNupqUCK2?=
 =?us-ascii?Q?LgLW2CDf88VhJqSYNzUT2N8yJHIfNksSYmvdg62o3O25FX5DSpeoUxWBn1z5?=
 =?us-ascii?Q?D/I5IoF+MAaVaBlisbdSla/YRZC9oQwj2j6qZu+3SeIUUZEwiNZHzLrQtV/P?=
 =?us-ascii?Q?9rzPXv6s7FTkW6Dv/57x9d3a+/N+uYFTg0HPrHsPsi8ZdUSNO5t9jUvNvzgz?=
 =?us-ascii?Q?KRkO2zAZeYFj8QMDMyyP0DYXtY78PN5ICIU4U0WpioPHSK8w3ufnP26MXWQE?=
 =?us-ascii?Q?WWYzw2nbiHfiQDReYg4S5O1VZhZY0YN2TpOY31BvpSfzAApjGaCPfKDi/2SQ?=
 =?us-ascii?Q?eqS49Qdv0HyDjTs+OP9vMe0UhWdHO8KyAmoWLcVARlo0M5TsyeIf08Gr8nFZ?=
 =?us-ascii?Q?/rCM60IA0rUZjukmjQzA7vZ4l5wB3zmivw8wS+/F?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f566ff25-801f-4475-ed00-08da9c59e589
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2022 05:18:34.2921 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wUoB4gXmFHggZ1bXabSeKme7tU99XOA3MWT5w7MbZCxem5YeT2HCNZecHTMyhTGGrBLnSaRKkc7HjeatuA6vCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7088
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
 Alex Williamson <alex.williamson@redhat.com>,
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

> From: Jason Gunthorpe <jgg@ziepe.ca>
> Sent: Thursday, September 22, 2022 12:10 AM
>=20
> On Tue, Sep 20, 2022 at 10:55:40PM +0000, Tian, Kevin wrote:
> > > From: Alex Williamson <alex.williamson@redhat.com>
> > > Sent: Wednesday, September 21, 2022 4:27 AM
> > >
> > > On Fri,  9 Sep 2022 18:22:47 +0800
> > > Kevin Tian <kevin.tian@intel.com> wrote:
> > >
> > > > From: Yi Liu <yi.l.liu@intel.com>
> > > >
> > > > and replace kref. With it a 'vfio-dev/vfioX' node is created under =
the
> > > > sysfs path of the parent, indicating the device is bound to a vfio
> > > > driver, e.g.:
> > > >
> > > > /sys/devices/pci0000\:6f/0000\:6f\:01.0/vfio-dev/vfio0
> > > >
> > > > It is also a preparatory step toward adding cdev for supporting fut=
ure
> > > > device-oriented uAPI.
> > > >
> > > > Add Documentation/ABI/testing/sysfs-devices-vfio-dev.
> > > >
> > > > Also take this chance to rename chardev 'vfio' to 'vfio-group' in
> > > > /proc/devices.
> > >
> > > What's the risk/reward here, is this just more aesthetically pleasing
> > > symmetry vs 'vfio-dev'?  The char major number to name association in
> > > /proc/devices seems pretty obscure, but what due diligence have we
> done
> > > to make sure this doesn't break anyone?  Thanks,
> >
> > I'm not sure whether the content of /proc/devices is considered as ABI.
> >
> > @Jason?
>=20
> Ah, I've forgotten why we got here - didn't we have a naming conflict
> with the new stuff that is being introduced?

No, we don't have. There is no new char dev introduced in this series.

Later when device cdev is added a new device major will be allocated for
'vfio-dev'. It's at that time renaming existing 'vfio' to 'vfio-group' is p=
robably
clearer, which is what I understood from your earlier suggestion.

>=20
> ABI wise it is not a problem unless there is a real user, I'm not
> aware of anything scanning /proc, that has been obsoleted by sysfs a
> long time ago.
>=20

This is a good news.
