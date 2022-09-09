Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FEE5B2CB4
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 05:10:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 122BB10EBCA;
	Fri,  9 Sep 2022 03:10:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B828910EA33;
 Fri,  9 Sep 2022 03:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662692996; x=1694228996;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4Awb1YAvF6t9fnp8xF6cV/7/oDz4aQFbr6PUW4OCQ/I=;
 b=Kdba3wL+BxkQauB1gwvDdGUlJgxBJRATCcDJCcg/5SqrBFZNODNlbMFV
 8RCTXcOpr9sh2wqfMlnPWZGYVyLfpEwxAbo2x9DDLg2+mOP0+85zAxxlT
 22+pMFK/eGeqR7vtEeywFX8DFR4BNNKeFTlCRcD69rZQQ5bQDF2Sw0bat
 la4jIg/NEFvmZeDfnfAZeGfkP7BYparAW7P1am1zRXczuyVrCE+UN4Es1
 3iNAGvvNSeCFW8uGOPLSezXCs9jeyzX3llXjS4NGt2c333mfBhJlvIohG
 IOr1dQat9wa6XuV2lNVmrm+mIulfx7mPkcMNEcgNLKVQWWOtVRx9knk7f A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="383678383"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="383678383"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 20:09:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="740910287"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 08 Sep 2022 20:09:55 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 20:09:55 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 20:09:52 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 8 Sep 2022 20:09:52 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 8 Sep 2022 20:09:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K+2bgWVCR95Zw5GNevVIiK3s9BDVE+b+XwB/9kMOm2RJsBoOQKVTOs8vHfSXxK6HYNxkmjKW/0ZqxnbRqvoczV4KPKuQgVqFUem6LtEXKj+RTtl+gGPor7BVMOG6m3kHZLgoTk8sOtPcYkxmaGum0hy6pGYqWfTS5TD/haqi4OUJ22Mjrovkw8+xwctogtRulEXxxO9TI1gTDIGHgtLc4XYcFiTqdz/7FImKQM77MCq9hSOkMH/WSoRAbMvPYKxzgRkHW+ivOoTRxJ0QV6xKLO578tSsE3wF2jgbbtufKN9E0brCGIvn30vI7kZwz9VDpVWuyP549Z58nfU6sTDgfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Awb1YAvF6t9fnp8xF6cV/7/oDz4aQFbr6PUW4OCQ/I=;
 b=Go0RGd1Nw01dQC8Bo8NmX6qHfCMTT9OP5ra6PcEM7Ktf/ZdXBamfznrlLfYaR3i/kEn8PMEEMR+GI/xOI1hb5+/16O1wYNj/SSDbUsmyBMC/PNz8rIMKUFim0ocEk1Bg/e8G2qMsIzfDgSO7tTShBI8DkuX4Ilnfg62PMNktEian1x5jJ9hphM3u02TzaP5DsFytYz4r8K7gZDozZB9gEpCBA1eZGSz9QlHyDr9oeYh4hA6HPRCEZhajaNQzbqjmHuaFbmPz9heDxKUoXG5LciVXK+6OUupl3J9oD6lkO80QgyW8EpBHJjs2BPZtz6VVZyvzozzzj5yoPU2VeRvJJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by MN0PR11MB6181.namprd11.prod.outlook.com (2603:10b6:208:3c7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Fri, 9 Sep
 2022 03:09:48 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::a435:3eff:aa83:73d7]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::a435:3eff:aa83:73d7%5]) with mapi id 15.20.5612.014; Fri, 9 Sep 2022
 03:09:48 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, Eric Auger <eric.auger@redhat.com>
Subject: RE: [PATCH v2 15/15] vfio: Add struct device to vfio_device
Thread-Topic: [PATCH v2 15/15] vfio: Add struct device to vfio_device
Thread-Index: AQHYvdNJtymT/Xe4J0W2tfymtujF8K3VSQ2AgAAC0ICAAAYqgIAAMbyAgADzG4A=
Date: Fri, 9 Sep 2022 03:09:48 +0000
Message-ID: <BN9PR11MB5276FD68BBACD97741BAA1BB8C439@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220901143747.32858-1-kevin.tian@intel.com>
 <20220901143747.32858-16-kevin.tian@intel.com>
 <50d82b01-86a3-e6a3-06f7-7f98e60131eb@redhat.com>
 <546463b8-54fa-2071-6a9a-e4087eb8bb2c@intel.com>
 <4c9350cd-c2ce-dc84-9a29-210907d2a2a2@redhat.com> <Yxnh87ZIS2JwvN7D@ziepe.ca>
In-Reply-To: <Yxnh87ZIS2JwvN7D@ziepe.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|MN0PR11MB6181:EE_
x-ms-office365-filtering-correlation-id: 28d81a11-2c50-4c02-4236-08da9210c0fd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SV3J0vW4tka1DHd3c3AX819jEOVuHpLqFX4NM4ZeGSmtjMvdsFApM9f6z6zD2hnoJB0JockrDZRUAS9lmAG475vpJh6Qs6vO8EZ+5AfaY1VmDPDhz+ZT9vzTwXiPAehqZANW+TdjknjdevH4+aJaz+RYm6tjtxCtF8WxX6kURpu7bYa9lBnjSKVz5yjkj3dQINgVhFxYG1KF7lqp+ZTGO+8w3409ssUdH6WDJt/UzEfBurmv8ucHD/LKMI8Zfm8olx20RBNgd4nOABiz2VYoBVg5cEpA04UTKYPSokZ5tziaoJ8xnGb6FLcqYp9ctiqWRSxaX4YONjs8Ueaz0hfatx6e6f5ETKFNOkuGyoo07hc7UwAN5ZVN/tWhBB1EtUJ8Lfwzy0DSBsldEiZBfQdGePOCozelnWunhO/jvF7krxqi4UmNkHF+Fwb7VmhiiK2DyrVJ546AT6LB1za3kzO+E3wck+qsErbqfG58YHL//9HIG+8RSIABWxdT41Gnp4p/RpCUqWFe/xYXid84QQaJhG6eVMHWB+/dACNGgNsrArawgghYSznaP6Sij9n6FEocgnjyTy2DXC9wGpI/U+kekzbmA5U4IfBGwHsHb53MVqJ8TPrbJF8V0d5BxXoSuApDt5nfi03Nu2JC27enlp1kP5c3jJJMkKFvU2ZzCgWNIBGiOvgW3LMhSKp8svMDduxfzagAlNeBE/nUfpq8qWNcC+9wUFipxlHndThz/t+tZ23xE7guYfVk+WB8ES+qKeuaKn41rqa9B9p8rFWyOzRaOA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(366004)(346002)(376002)(39860400002)(136003)(66476007)(122000001)(55016003)(38070700005)(82960400001)(86362001)(38100700002)(66446008)(64756008)(4326008)(66946007)(76116006)(5660300002)(8676002)(7416002)(7406005)(66556008)(41300700001)(8936002)(52536014)(71200400001)(54906003)(478600001)(316002)(83380400001)(110136005)(186003)(33656002)(9686003)(26005)(2906002)(7696005)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?L5tOBBiJFVqP9RMyh5L8zQdFFFLDy/sPYNUkzQzFkEQNCU487SoX04c71JKm?=
 =?us-ascii?Q?EoVphOQufOR08aLiIwp9wMd3xixESFMuZhiF+ssN1SwqKFBnHqLIqsq676Py?=
 =?us-ascii?Q?LzusEI8OZD77UcDUG99BSIwk/I04Qny/4HjoeaFsIxGKSqYaxwJf5FwCE4Cp?=
 =?us-ascii?Q?Q7u5goKROC7Dz0U5IzRMptTJPlfVx9h6u6iifU3HYhEAiQENcPiBtVd27ug7?=
 =?us-ascii?Q?ODCcQJBeLajxOT0elDeXNV2J13jR2k2Ooq/ZI7PyOg84tYzS8j/OsuDbLd5R?=
 =?us-ascii?Q?RfpNT3RG36iN+2kWKSaboWsKIyyKxCRylE2TE+WutzdHyCT/yQyLXnxGpM3W?=
 =?us-ascii?Q?q72fPZZeWQGCGPIOc5aS1f15YU3mIQge3Ia/+srhHsWUYY12d02jWzLEeITB?=
 =?us-ascii?Q?DLqEXB+1Bd3Go+pEeG13an992jLdfDz612FA3qPWIBJ6CO6D3nSEDWLtccDs?=
 =?us-ascii?Q?8oIt8VviYFnKt4fM9LblMzQQtVTEae1SeCC1EyJmBia6llupRdFn2lyMjKEV?=
 =?us-ascii?Q?hCHfES15IiBI3nvMGf9izOH/GyG8Wo4norsyMOAgYbohs78zpH0t+gV+Oq7j?=
 =?us-ascii?Q?KRIN2DFlt+etO6Zfe7Rj3H56EQzbHN+CwKphn8167H8UnNAkfhAae9j/rh5Y?=
 =?us-ascii?Q?h3OWZsIq/UtWIzEAo+sbe1adF0s+MdI5CanCrLZhl3XAMUEUghxSZLHbFCm7?=
 =?us-ascii?Q?kS2ggg4J7tiOYnj1zO72ayA9v7pvHYlz7Xl4VfJfm5BSSlH2jeIhwQwZEjSj?=
 =?us-ascii?Q?Zwrnz5+2JkmiiCGS9kq8hmD/rbzwglnfpSChp9oJz8o1lq3fv6VdRbflXuYv?=
 =?us-ascii?Q?mOF7oHJWXKzX6pnsgjZBZ7+yXhKv2Bx/ZI79yvUvf1Pu1tKjpw8WluqFgDUK?=
 =?us-ascii?Q?4Zp6DGIPbf9KuJcgLt9x/JcS/3Txv80odHUqI2FmpRPpYN3J8hmILJAeauA4?=
 =?us-ascii?Q?KJS+iSo3Tc3UXBJ66qcHEDsOicHLPkVlsWc46SlhMuHKPHJJrO5QbORCQ9JZ?=
 =?us-ascii?Q?/DrileiUCvKoQPez2rJTrNtsFLRx4L7pxi/KVjt/K2wkAcA5q4v+1mLN6bKj?=
 =?us-ascii?Q?CIMoQbwOZD8Xs3T7YLr4z5Ylqoan3CayeL3XRTc9EymBPiO2kFr3YsGQheH/?=
 =?us-ascii?Q?5BzEIz7r21GhIwcym8BwJgx71kIn5ackdIqmWSvNgLBYbWvu+9xAjJWza9mH?=
 =?us-ascii?Q?k3dOOLLEBBqjg+roLI2Zp2bFMVkr05fO4ece8VY7je+Utak6gPfrOZ6DlAQp?=
 =?us-ascii?Q?OILR+RCi1t1G+bXoF4mjKIAQDG5Zp+b0PKtOWB2+ZjPcwj1mlzxY78RYY0CM?=
 =?us-ascii?Q?/z4Nvndyn4M0x/iTjOA36uDeInFBU0wtyYGIEtEmGBLd4zMTqV5iFFVkHOWh?=
 =?us-ascii?Q?+dssBjnRJRBAFFNMmCQay9fZzDBWJdS92ptqTXf1R1452qOvIZv7EGzsi+GJ?=
 =?us-ascii?Q?3m1m0sK6hcic+3VrFsZZKAlbeOKTFbuazWe9ok1vB9oucjwdbyGAZTASy7mR?=
 =?us-ascii?Q?/1z7ary5Cd2pzZIyX9u6wOS4KQKKHybIKuTAkDmzeVz2kykd72OqpCbAogZf?=
 =?us-ascii?Q?vQ7RS2EVFWNtTVrwNZpTFj5E3pyYRi6kDDaYoTBw?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28d81a11-2c50-4c02-4236-08da9210c0fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2022 03:09:48.0989 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Co8Xw052x/UdDhrHTDw+p2Qjs6yugZ3t2NmtJrLH/9Ketln1y9wJ205QHmwLshYcUNPmA3CRnnsC1q/mgE0N/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6181
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Longfang Liu <liulongfang@huawei.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Leon Romanovsky <leon@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Abhishek Sahu <abhsahu@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Jason Gunthorpe
> Sent: Thursday, September 8, 2022 8:37 PM
>=20
> On Thu, Sep 08, 2022 at 11:39:07AM +0200, Eric Auger wrote:
>=20
> > >> I am not totally clear about remaining 'struct device *dev;' in
> > >> vfio_device struct. I see it used in some places. Is it supposed to
> > >> disappear at some point?
> > >
> > > no, Eric. *dev will not disappear, it stores the dev pointet passed i=
n by
> > > caller of vfio_init_device().
> >
> > yeah I see but you have device->device.parent =3D device->dev;
>=20
> IIRC we have a number of these redundancies now, often the drivers
> store another copy of the dev too.
>=20
> A significant use of dev is for printing things, what should be done
> here is to create a subsystem wide vfio_warn/etc that takes in the
> vfio_device, and then print properly from there. Now that we have a
> struct device all the prints should also include the VFIO struct
> device name, and then the PCI device perhaps in brackets.
>=20

Let me handle it in a separate patch (after this series).
