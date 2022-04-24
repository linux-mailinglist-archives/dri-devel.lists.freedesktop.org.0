Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB49E50CFEB
	for <lists+dri-devel@lfdr.de>; Sun, 24 Apr 2022 07:52:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF25A10E474;
	Sun, 24 Apr 2022 05:52:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C59B10E474;
 Sun, 24 Apr 2022 05:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650779536; x=1682315536;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YEvOrzeNhhNCYG9+//CzgouHjHvb5HpbodXFjrshB0Y=;
 b=QSKjFak+CxsVVjsEfYzpeQZLJ3pJxLPZbHhTP1uaaEeEfg9R+pUrN9za
 UUemjt+raw3+Zcp+tw6Ut8rMeOLAlAIxcR+z2HMJKjcCnw0LGg1yJYCKe
 Mls33p871fjsd9agYu2jYwEFnjrQRlfJJlbkDJ2fDhVMgq3y4D10qx7gH
 Fdb6uXg+EZymaTGEooJTlyA9xv1pG55/X8StKRfIwwcYMtBhFlfrYbWAM
 g1fOo9fw8ndeTQfReVsF8XIWXStGX2gldseqKfg7vfqOqvueVvh0EaBxt
 c5ZKiAafojXVucySpkP5tMUGF+lRRmY89KtQXSeKe7FOjOBNZZO2UhkDz w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10326"; a="246914025"
X-IronPort-AV: E=Sophos;i="5.90,285,1643702400"; d="scan'208";a="246914025"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2022 22:52:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,285,1643702400"; d="scan'208";a="729168014"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 23 Apr 2022 22:52:14 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sat, 23 Apr 2022 22:52:14 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Sat, 23 Apr 2022 22:52:14 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Sat, 23 Apr 2022 22:52:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ki5XemHDzxtW+WtiovXFcEtBod2JanKcdUmF0hUGaRR/Z8QYaOxP+PiAvJ4wSvXbUxByWgp8PuaIYGfK+UQb32Nsh3hVlVoqPx2o7xFD31XCpniNMgzQ9oGR16xBOQECnGeXJpWuopfWVxAqnuAcfL0IupLkShVQE0bRo+6Rgt5iFMacW7Y0nmHTVGqdtyrMdscwhhk0tt/S8ibiVLGuWC8a5uzlLoHsbr1NAhg+Dp8H3adA7BaFqTzvl4HQtvTvcISEXqUXRuy9iOdCRH258gcFQWRi8L5TlVOA5U38v0nDXdZxcnhwDjEYtoRqeR+ioIF8LK/1+Po/37Pn21VJJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YEvOrzeNhhNCYG9+//CzgouHjHvb5HpbodXFjrshB0Y=;
 b=NGu9BfvckeizeC63NEk2qr3dXimjSoooXecGPnMqKR9nmWEoyAtv3Jj/8giWMxf7kBie/aR34pJSeAANGP0yMaXY77NT+yJUowMQst04c6ml0s2vOdDIMKrP2/22zBD89rjMT15DSnv/GVEVSKuc51Dv6dlHTk608L7NTxWVFTjBGxFRtHNZ2qy5RHCXOaQIx0jjetP1YmEQWWwQQBirS9PCX9uNkLT9kvYQtwt9Tk4JvMWUDeWZ1aUk/+WZQmGFHJhXoBU2YmueAfSpH7Fwf2t1XFfBAJiq2tkgmc1uqY8b0ZkyNXPstsI7OuK/TxQAI7ppcE20HY1R7BrLB59hUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM8PR11MB5637.namprd11.prod.outlook.com (2603:10b6:8:33::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14; Sun, 24 Apr 2022 05:52:12 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::24dd:37c2:3778:1adb]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::24dd:37c2:3778:1adb%2]) with mapi id 15.20.5186.020; Sun, 24 Apr 2022
 05:52:12 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: RE: [PATCH v2 4/7] vfio/mdev: Pass in a struct vfio_device * to
 vfio_dma_rw()
Thread-Topic: [PATCH v2 4/7] vfio/mdev: Pass in a struct vfio_device * to
 vfio_dma_rw()
Thread-Index: AQHYVZzyHQpBjUiEn0CJxn5jCdiAraz7Kf2QgAEQPoCAAllT4A==
Date: Sun, 24 Apr 2022 05:52:11 +0000
Message-ID: <BN9PR11MB52762D80C4AD67005F2C55678CF99@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
 <4-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
 <BN9PR11MB52764597BDC02C88E855EA808CF79@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20220422175937.GD1951132@nvidia.com>
In-Reply-To: <20220422175937.GD1951132@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 228b6ffd-2bed-49fd-5c9e-08da25b693c4
x-ms-traffictypediagnostic: DM8PR11MB5637:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM8PR11MB5637A0A54A3B91D9A351D7DB8CF99@DM8PR11MB5637.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9kVkoCidYwPiPIryEGojGt4lTCTudVjw7JBkNG5+X7u4euIiXQTDR2G70yrX5W2Zw4jApOIx4MsgX1JbbM+wkz2ejrc5jjmUaYmV7PK1KjCvW+KnjMSzwWznOvGl01hgrwoj9ubjxcgr8May1ZW0rCsjfu9Yh4NuwYlr1EDTvl5uU9a1OI/NmMhjvhHvzV5l2Qh8PC1Ss0EftzE2m1eVoNK/2451I/CkUx+uNh0pRf2k3dgn2Dsfzl4Kd/tU+7odyvNz+kZQ4xy8y4+tv5OqxzaaQnbtodh9fFdyIJ05RuxC409vU/CS+fdkEUgmNojiSU7c1fwBpWAZ3NOlP+HPEaJkxNTiBs16K/Sw9pWN8v4mtgrv8cY70F5AMaD+pEjiw2P56TIWKP4ju1YN2cyL4O1Qosn9R3cGbZvJFylVmzyqx1k+H4RzgIg5rpaEK+2wzwUd1rDie7kVxZKcl/wGHbQBBit3oZSBQ8StW58VA39xPNthUUI/1kLT7pKfI/XXmdBaGi3sfPyXcpYUnHfUc3T/RXu32gpbK8WNig8I9WRpoZ+UZjhMM9xPklq22a80/niK7HaVIPWTqV9wxapBAItbBdTzvQYUxBc//HzqdYRl2YSRyVycw+D/HPmTw5JKXLFngAu8r7nal1p43zKRTwhkam3e57yPOaHiU2vWOER/PdKoXsDckRuvb28aK3MuNWFTOGjBx5lmvnYKkVkebQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66556008)(66446008)(82960400001)(122000001)(64756008)(8676002)(316002)(76116006)(66476007)(66946007)(4326008)(26005)(9686003)(186003)(6506007)(33656002)(7416002)(55016003)(2906002)(38100700002)(38070700005)(7406005)(5660300002)(7696005)(6916009)(54906003)(508600001)(71200400001)(8936002)(86362001)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9N9zWlo6KqeLbcHp56742HtErMNskr7f2n40O8zWL69hGE6dY733GV+VxETu?=
 =?us-ascii?Q?L2f8V5qoVvjbzfi486PSyXh7z/1XGbmXH+vC3WVDnEMzFVzDT2WHz5kAaAHt?=
 =?us-ascii?Q?KLDEXrvgQgOe3bPL4Z/CC8CtiVcUz1/dGTksRrmU2/GMAQPhdYse2Sld1JWJ?=
 =?us-ascii?Q?tumb8jeRJEPn05fgH2O5BDff9g7ueMOCWjEF49PUaxZCa70hbGRZ6c6JE1t2?=
 =?us-ascii?Q?1VibrAwElAzAM8AGRv+T2/ZLUdL8iXf6S0CWKfFX0M1IfCwTNNWxhqMaXk/x?=
 =?us-ascii?Q?tzbmWoRIj01SHpY9/AUfNzqzrV4BSLs8FLKm2CCYPsmUdDelc3bEC5svrXG9?=
 =?us-ascii?Q?RB2AHORP+opDXT47bD2k6sV01UKyGvgBHAtlQeApLhgFt0qdF19Eo0WxW/rK?=
 =?us-ascii?Q?jVCGy1OemGzVV+c8wmJBU/t8yLpuHKWHyL5vmRY1+ucoBkNPJUis2hbWuv1h?=
 =?us-ascii?Q?Qq+W6Avob93mozXaYXrUpZ6dbql2uC4eFz0swToSZ7v4aht7rHgZqdFMWgrt?=
 =?us-ascii?Q?ItWVObPameUC/UvZCgfcFMnAR8a6JFNA6CNn6vBI3J6NdBJG9Fd9wpMi+a9O?=
 =?us-ascii?Q?NBG6K6mmGlXVBmgZn7NHPo3ifDF77KcKal5HUULlvwHZHA0mae5oYoipW4EA?=
 =?us-ascii?Q?BY0L2QTZQ85KDrqGQUj4Hag6oYRty+dVYGA6w2ag4my7KxwHagSvMouCk+WK?=
 =?us-ascii?Q?m9VbKOUDziaCeujEYqbFhfu/bYlLKxjZTnMZsr7kAmU/ob7RgD5zMh+se+h8?=
 =?us-ascii?Q?QIHdYJ9s80M5oaM7B7RsI7CYh/BVSPaZ6J2L1ISUEOPTb6/8UrDjGv36EuSX?=
 =?us-ascii?Q?l+46U6pi9M35R9gZX2E7RXdG63vjOymdVlFw7BwqO74rHTDhD5x6/k+9WAwy?=
 =?us-ascii?Q?RXhsl7JxpuH5mSZHH4RN9URm05JoBd7hNT2wJSiCcf1sBAvfWjXpicZb0pfl?=
 =?us-ascii?Q?nYGq2GsLt/K0XSGd51KSfGLQ08rqn2pV7Rrf5TupwvRKfzCqLd/QYc90/R26?=
 =?us-ascii?Q?6j6T4JOWb4cxzgWpUZvGKQeonym8XIZLGuiPm6wZezj+F6Qn2uZB9Ia4SaZe?=
 =?us-ascii?Q?NMnsXjd4Lulj3WJMaM3h2zfNsKhoZRejz/dDrljLUIRQ2q/jHlOEXY7+91Xv?=
 =?us-ascii?Q?uS5V2De6yX14D+uko8mueK64+3jMqSfXCYWstuI+pMW4u0ssXABja/JYq95T?=
 =?us-ascii?Q?009Ti9vFrWpupgWZgnbeWY4wUJKgCk/w78Qr/Lfd5hLcg13seG6Tbc1dTlwN?=
 =?us-ascii?Q?3MuqmNM9a6QPDNRsvbqd/E34Zdwd/U3N38mTLMdrBRnS0l5RuKQExaPaPAtz?=
 =?us-ascii?Q?sT/EhKGMQjr7ZqqOgTc5wfF5SzrRk9/lS25CCEBzhpXAfxSPmk4dL1rgWy1x?=
 =?us-ascii?Q?GAGSvWF3YOzlJONlj2NExZtGmSIR6JvDgd52n67P5ODZa+Mu/25cL2vvsxxF?=
 =?us-ascii?Q?2p+zJkF2c3LN4MKlTbR7k1mGDe456cvB01vXbAMjPsmvrwJ1YYjA/i0SAiqT?=
 =?us-ascii?Q?trI8C79hM3LHlEnROmG4RYrJrkQuubiXv86GmODhOZosTtqZh+O1DPMPL9hL?=
 =?us-ascii?Q?EsyZJluDWq44gK3peOIaiWvC0v8VKU8pCgiNLNk9ULdBwenQcXzm8BFi5Qr/?=
 =?us-ascii?Q?KzrmWtnJqxHV53ZYKk7fmGIW7C3aYjm/xXtIapsJ/ZaU461rEMNtHcgcj9lM?=
 =?us-ascii?Q?PTk5fI2wuvSKVFjS7RVqncBVFcpFUQxiTGAPOu05L/kdpcwKxcI2+za2hkPQ?=
 =?us-ascii?Q?KgI0hZhrrw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 228b6ffd-2bed-49fd-5c9e-08da25b693c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2022 05:52:11.9475 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gJQ1XH6Wj/ilefq5QrBiCN5BBaHdqCwt8KoZQzM5GwAgb0QmEjRp/H88leZRqV3uWVSe9XAg4xyLaI5YQkQfHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5637
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Kirti Wankhede <kwankhede@nvidia.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christoph Hellwig <hch@lst.de>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Jonathan
 Corbet <corbet@lwn.net>, Halil Pasic <pasic@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>, Jason Herne <jjherne@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Jason Gunthorpe
> Sent: Saturday, April 23, 2022 2:00 AM
>=20
> On Fri, Apr 22, 2022 at 01:50:00AM +0000, Tian, Kevin wrote:
> > > From: Jason Gunthorpe <jgg@nvidia.com>
> > > Sent: Friday, April 22, 2022 12:29 AM
> > >
> > > Every caller has a readily available vfio_device pointer, use that in=
stead
> > > of passing in a generic struct device. The struct vfio_device already
> > > contains the group we need so this avoids complexity, extra refcounti=
ngs,
> > > and a confusing lifecycle model.
> >
> > Using the same description as last patch leaves the impression that
> > the two patches do the exactly same type of change. But this
> > patch actually includes one more change to grab a reference on the
> > container. This is worth an explanation.
>=20
> How about this:
>=20
> Every caller has a readily available vfio_device pointer, use that instea=
d
> of passing in a generic struct device. Change vfio_dma_rw() to take in th=
e
> struct vfio_device and move the container users that would have been held
> by vfio_group_get_external_user_from_dev() to vfio_dma_rw() directly, lik=
e
> vfio_pin/unpin_pages().
>=20

Yes, this is clearer.
