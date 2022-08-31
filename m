Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B46C5A7660
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 08:14:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 065DC10E1E7;
	Wed, 31 Aug 2022 06:14:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AED810E1E4;
 Wed, 31 Aug 2022 06:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661926482; x=1693462482;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1Z+yC9mPjjTZljBZdJGvVDgbqRVX/Am7mh/VstUkQzI=;
 b=OdFnKCRFGzCX7iL9PTRo4UFzMj9EjjG3kg6cqAxlROKK/GMuAu+5A8hv
 wDdd8xJe4zIG1daH+QYCXVGEZ8biQ3Nre6cXD7EEhLRUTppNjbyN2rMJ4
 iw+fk+p69yrTMMKJyBnqrWdumDiWJ9ktvFhEGruvjV6UZYpRbF41EjjdI
 tJi1y+rBJwxHO3aePNHEzEd25Q0bF3XrsTkbTawIVICh4wSn+SBYzD3I9
 BTHZHrA+RuXzyP7bRUCSV4/jUoowTi22RY1gcJEPAoByEZDGMzqNUVUAP
 wyY0RRlYlMGiO70++RZtLvPiGtyoiImIinDeRqOMWeiraRyz2mrV/MkJy w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="282354518"
X-IronPort-AV: E=Sophos;i="5.93,277,1654585200"; d="scan'208";a="282354518"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2022 23:14:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,277,1654585200"; d="scan'208";a="588921405"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 30 Aug 2022 23:14:41 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 30 Aug 2022 23:14:40 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 30 Aug 2022 23:14:39 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 30 Aug 2022 23:14:39 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 30 Aug 2022 23:14:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WDfJnqW7hOK0Pi38bnKialy5d/Bximocqw6+mU+I6Fqfdb1nQnczdofBG8r6ZViI7WIzlII9bGk/esi2b7djX5q8EcPUHm8uVANCOyeKUe09wkgDuzsoZ1cegmiHd+HVBoUb07pt1f37W16bqsHx7pCaSH6Yy0k4K8hTLZWrwYujNvZP934A7kKA3J1HvUAvWxEHUfxPWsvOR99pvTJrYOp2YI4uug/QYnFfDLIgiVd2xGKxJcYgsWMX4oZP9dTjYhHQq7TQdxV88B8Ukc19ZHzmC9vvVpnVvP2Bses1JdYHZDHx+qBaDmnjxE/sgZM0KPr4TUYZcIjOswtEBng6zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mpSLWMN16ARYchz3xYjiRWKltTE8aRtlorxqsbhWTaI=;
 b=ZJqieT7ZLPKhDqlEscTiEx4x81pq27TzPRgzC/ZXZDJghDYvVt0W9ImhlIb/3udM3LyFn8R4DilKABWSDrM6EWv5WNKlyMog7b2JBWp5wcbEj7eJqG10lo+D3+MCIZ4AKJR7e7vCilvacY8wv6toSLX5bhnV4MreYuwXG3bZpV917EWAYjBrHy+B1W+k/e5denirSjqweT/Pf4+LUHjLEWRHQLx2SoWONvp2nroYCD7rzGN3SUUPOzeTdTyYkSi6BU+/Z7lFa0sGvHPGaKFsbc+UE7WXtkrQxcTfwNCP18keZm/0OT59hDO27uryaeIceuUtEYz54/4xGY9R73ijQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM5PR1101MB2233.namprd11.prod.outlook.com (2603:10b6:4:4f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.19; Wed, 31 Aug
 2022 06:14:37 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::a435:3eff:aa83:73d7]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::a435:3eff:aa83:73d7%5]) with mapi id 15.20.5588.010; Wed, 31 Aug 2022
 06:14:37 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: RE: [PATCH 15/15] vfio: Add struct device to vfio_device
Thread-Topic: [PATCH 15/15] vfio: Add struct device to vfio_device
Thread-Index: AQHYufqqXjqbWwGvv0ujITvL457lEa3ILkoAgABfkKA=
Date: Wed, 31 Aug 2022 06:14:37 +0000
Message-ID: <BN9PR11MB52769058CD32020313A76C368C789@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220827171037.30297-1-kevin.tian@intel.com>
 <20220827171037.30297-16-kevin.tian@intel.com> <Yw6sEghuAm6OAXWE@ziepe.ca>
In-Reply-To: <Yw6sEghuAm6OAXWE@ziepe.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3ce41f1d-fed5-4cc7-31ff-08da8b181522
x-ms-traffictypediagnostic: DM5PR1101MB2233:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8bEGJMHCA9u92E4FbielOFEjBN4k1BuCvmAl97/CjGtL+leePaKv6BYhK51Qlj4XWDuBeiqLbYnFhgGtsfhLlLrf0n7mwNSLO1GkVrp9uajeIhYy2o835XE45ifBOyvkwmvp87iyPDDW5QlVPVIPxyAPUt1wD+94OsPvD3vh69iDff093rDysFJCrMLUH9/MsJLMPyKkoDSbeolHZlvNnIx65yY1RW0ygD92rY2zYAG4qOR59i1oHkAYL3NEjjA/yhhr94dVcybZi4LCCNv1Jk/FHsAQpO4gk10Seo0aQlKJvPFI+Km4Ls2cfcZgsWsUnKu0EO5YYr7w985W883ZIi13ZTBkfif39ykBYsb6zMc5SVRHLG482QfFrzaNcFBxCziF2wviEGvj0/lgGFBR60l6MWw/4AB7NZikvp2h5lzNnanVRKdZceZfP3Kom2QMheQwQABlbEHMiiS4QJCqm2FvU9OyTfvmUUBNagbTaWmucKGlnjcvn7KmOehUq54zRplwA5gML+q6hGQ/BewYiADlG+fagp4COuB+c7W5V6/NrJ8bdznpj9LbvmPkKYTAd3aJ2UHsKSBWd9dPgq7eL4Cs+dMinf+xJ+T+yPmmq+7kqpOB2MDrZa14sb88DUlcvFdIQbw08zuizR0W/ObeFvKek4KTZeHvJCmYRYmMc25PSJfNXKUdmuNmZH3C/zsVzMGNq+rGnoFzbzzu3r/JpD5JWQpCWRtQxACLXFp82orSLd6IsjaFxmbVF2XNR0l/hvfL/5KHr+Gz69BEhFn1hg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(376002)(396003)(346002)(136003)(39860400002)(38070700005)(4326008)(26005)(7696005)(9686003)(41300700001)(86362001)(478600001)(71200400001)(122000001)(6506007)(83380400001)(54906003)(66446008)(82960400001)(186003)(38100700002)(66946007)(5660300002)(7406005)(2906002)(7416002)(76116006)(52536014)(66556008)(8936002)(33656002)(55016003)(6916009)(64756008)(316002)(8676002)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/Kg15rFGBmtf32vVkvU2fQvPRMQ7Db7mhzISSe26wPPPu/Lt+z7n3EcoQfU4?=
 =?us-ascii?Q?foJvwvpczD9CgEIqiIgRZ/1igz2lgL/iOZTw/xdZeTxSB/YsX2eVCgxtVT5P?=
 =?us-ascii?Q?yAWa/sy0tGkl7JwW/S5Tkk9KwEYmKqjC1iQjvC6cOAA60k/Sx37DPE1fBeX2?=
 =?us-ascii?Q?OTG4LhV2cmOHMjsSv6RYSwu6ccZZXZ4EtHRhdHkNI4npxYDraceMhYQz8fCT?=
 =?us-ascii?Q?ztcqggRg/3MDkHbSP1+8djSvhs+wYzHJqnGZcHWG9UBoRikvGXoAO80Yo5uZ?=
 =?us-ascii?Q?bBTgSOrcX1Az3xyP9fph1EeW8E4vOmNMrMUcHoqEAi0H69UJx3hTnFU7Ob/E?=
 =?us-ascii?Q?GI4OBPOLznLWCoZUil+ordw+kdjc4Rb+KwW9/w9NME/KgXvy6nkNS+0RlXIH?=
 =?us-ascii?Q?9EBo86T5K+M+R6QzS9Ch0I1+bc7rjJiPS+uHOXdB+ePyqdhZ84r82RVx2zwY?=
 =?us-ascii?Q?DFjA55hj4Vqoo8DY42kwR0copqv+Hhs6Uh79qgfEWMDHTo0p32QUnGDWrr/r?=
 =?us-ascii?Q?VJaPPfqyiO6V/830eswcxYdaPowNPBY8YJLlFD6bfraEvegzpGr6OkDTsCp3?=
 =?us-ascii?Q?sdogWIL9/vhG5Lm+eo4dvjKcZivvQp5z7GIAZv3cKWkpUeYpXcd6JZvwucAA?=
 =?us-ascii?Q?UbPaLKm7flcdA6OwztindNTKtmJ7h5W+jOHFcHin/r7GF4gebj3ksWm0mu1r?=
 =?us-ascii?Q?87TLAnhkWGPv1Xv24tEGF1wzU5ZkY9niIl3LFU+0dQF797QMZhktjbnxKMtZ?=
 =?us-ascii?Q?JxBBsSa7P655nsrgbKy+BRF1zNj8NxVYTOFyw2kA9BkAJC6LQtOl/JCE6yVw?=
 =?us-ascii?Q?9Nrf7xvqNacWMQilWuYjUpyrVECliZZXyC4cI5M9T6XzqTribYXfet7R/fV0?=
 =?us-ascii?Q?bsW+mV9hqVIIKEyzbfRmo8RdTGt/npGjlLgA16brFBssFcbHzH8J8rcoOecz?=
 =?us-ascii?Q?Rl7hrdIsDTG2N7Br9GUVE4BEi1mbpzuoj/SxLCLvtKwaMzBQONg5H2PAX9iB?=
 =?us-ascii?Q?rKlUC1FXosmRhebnSsR8uKae+W8JzgdhFXrm0FrXFcZfe/uQ3X4/GXKwzCEk?=
 =?us-ascii?Q?x79yI1uD0BMkm+gF7qM71rl8rAESRhKdnYCYesXcYi1EER/3d5s75egwTxLi?=
 =?us-ascii?Q?eOPrnqM1eBLodhgIDKwkozBhHw4BTUKrp1K7iGpOWr5u0eCxJkz5hdPPcELN?=
 =?us-ascii?Q?WtW8SmfR91Cosag76WihA+UaEmfZbFEuoVlweXSktabnt6qSuh0X3ms9Hn62?=
 =?us-ascii?Q?Wm9q5MuEGJNXv9M3AyZklSQfgmHUiXsERb8yhDhT/nEyfe0zVxXAgbQ3s+RR?=
 =?us-ascii?Q?Wyhz5ZGdrFv/jYw5aZYdlSp9nK7F7vzgYGNmNLz2Gcw6Vf131AXG8sjO9NMT?=
 =?us-ascii?Q?qYt/CcEkU2wip/PtK1JUmfg2P3W9aauYT4KD6qWBWb7YiAReDsLH1/SVHatD?=
 =?us-ascii?Q?PIYTSD/WgGLm83ZTS65/jH2/pAzm80lqZB3gyEIt1aa9xJJn5gEIZpcdK8ys?=
 =?us-ascii?Q?Dc2swDCFqZYrXqO8NuzVHDj6IaWGd0bU1fXgXwwlgkilDYjnyqs7pkuIhUYm?=
 =?us-ascii?Q?o0cxX5APlK9IuMRi+tbexIpmZCGOZ4eM010BlxJH?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ce41f1d-fed5-4cc7-31ff-08da8b181522
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2022 06:14:37.5916 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FjPs3sLf2u7iPXeQd6zC6ZDtVZTgCorW5bZnUMTaXtflq2/rRwycJbbLVqZnB89Hudc0XvQPCvQYuLdmLY0ceg==
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

> From: Jason Gunthorpe <jgg@ziepe.ca>
> Sent: Wednesday, August 31, 2022 8:32 AM
>=20
> On Sun, Aug 28, 2022 at 01:10:37AM +0800, Kevin Tian wrote:
> > From: Yi Liu <yi.l.liu@intel.com>
> >
> > and replace kref. With it a 'vfio-dev/vfioX' node is created under the
> > sysfs path of the parent, indicating the device is bound to a vfio
> > driver, e.g.:
> >
> > /sys/devices/pci0000\:6f/0000\:6f\:01.0/vfio-dev/vfio0
> >
> > It is also a preparatory step toward adding cdev for supporting future
> > device-oriented uAPI.
> >
> > Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> > Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> > Signed-off-by: Kevin Tian <kevin.tian@intel.com>
> > ---
> >  drivers/vfio/vfio_main.c | 70 +++++++++++++++++++++++++++++++++-------
> >  include/linux/vfio.h     |  6 ++--
> >  2 files changed, 61 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> > index 0c5d120aeced..9ad0cbb83f1c 100644
> > --- a/drivers/vfio/vfio_main.c
> > +++ b/drivers/vfio/vfio_main.c
> > @@ -46,6 +46,8 @@ static struct vfio {
> >  	struct mutex			group_lock; /* locks group_list */
> >  	struct ida			group_ida;
> >  	dev_t				group_devt;
> > +	struct class			*device_class;
> > +	struct ida			device_ida;
> >  } vfio;
> >
> >  struct vfio_iommu_driver {
> > @@ -524,11 +526,19 @@ EXPORT_SYMBOL_GPL(_vfio_alloc_device);
> >   *
> >   * Only vfio-ccw driver should call this interface.
> >   */
> > +static void vfio_device_release(struct device *dev);
>=20
> Since you added this new function in patch 1, it would be nice to
> place it in a way that avoids this forward reference in this patch
>=20
> >  	ret =3D alloc_chrdev_region(&vfio.group_devt, 0, MINORMASK + 1,
> "vfio");
>=20
> I think we should change this "vfio" string at this point, it is
> really the group fd, so "vfio_group" ?
>=20
> It only shows in procfs.
>=20

All make sense and fixed.
