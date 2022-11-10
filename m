Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0CC623A3E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 04:12:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13F2810E64D;
	Thu, 10 Nov 2022 03:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B1010E64D;
 Thu, 10 Nov 2022 03:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668049948; x=1699585948;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ox8i5DmldKq5t+cBBSHah8VaG23nBhJw6PYS1J4oPdo=;
 b=M2zQ3rxjfcmizRl9JszZls1EM7Gk+mbcmm/WLoS5lr8LzwM8sBY3PrTE
 zUxgxK1DPO6ZYsk4szt5eS7Fc9pkIcZ8q53/dQbMzZ7O0i4WiBCoF/Pf4
 5RZox4Ju5rSDFyTUxXzoAWYqxNcCVxmsnURZFaofX+RoHfa0Tlhyi6tyI
 mH549iTYdne4E6vibGirDIYhPyUUySH52n8KEijbA0lc4EzWtsZXpFmAt
 3EKgGanTtNseYFZzeAC+9TLNNZbY5BTx1XHjT99N3LPpAyc01WTNGMm2p
 zeo95GYDjbGgvHbNsyjpX+Vo6a8x+4XIey7aEcwTFlz/7cZWg2NoxosAo Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="309909958"
X-IronPort-AV: E=Sophos;i="5.96,152,1665471600"; d="scan'208";a="309909958"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2022 19:12:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="670196142"
X-IronPort-AV: E=Sophos;i="5.96,152,1665471600"; d="scan'208";a="670196142"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 09 Nov 2022 19:12:27 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 9 Nov 2022 19:12:27 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 9 Nov 2022 19:12:27 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 9 Nov 2022 19:12:27 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 9 Nov 2022 19:12:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QxGu5cFj6iXNP2ECwp2aF3ABKW+i0GEAXm3notHvobSs6BomhbiAIUSD3LCKFLvZ96k6M/EAeUCljixY8tzIAQeHWDWzuoF4RYRD9T0wLlqydEtICXBS0zeBrqTu1ZyRpKZCfWYVz2qPRMKL0VbmFBPo5ZOvFwFgQ8Frcxc6stFdteJUyQ0vVIPp1YCPckbvYbL2i1rveqsrg4eE9AQpTRVlg0L45w9csE/m+ZYSLvPsJ7Uk2b+uF+kLWLzwLERRB9cVvMLRKTfKvAk3U+TNbrxGa+i0Mw8wcddch8vovpQV4xnruZN8O9R+vaiXIA9FHBVfM8JmXlS/pWIZFpiHng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E1oyNyWvrt+ukAp7xRnqqr+bwC1mcnyV4z6MCz2eowk=;
 b=mPxrOpgAHiRpiWTS2p+GqYuZ5xTxmkZPsm6aq1C9NamG5GWaRcGzGU9xWkLsqoMXP0eYIzP20X5/8bGSd8lbemGwQL/U/+uEbFeYPn/iV/OIZpsUgy6nEbilMgHh0esUh6oYX1RUT6aDIYof/LtFbB2yZJq5xB2+BNP0K9n7bFrgdJQsdvY7c+BvB7aMMUoaIFizxAYWp2w7VIlW1mDeM4t90Gb7PQZlcYG7zRlYjU6dO6ZCIjqKdy8BRWOeviFJhZEbmU+YmStaw3BsiW3Nt9bWbPvTaNC0dg17VpciZaUzftlJuHvolwIsOC3/Reuw3UfZwkPhgQdBRe8FVDDOQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SA2PR11MB5068.namprd11.prod.outlook.com (2603:10b6:806:116::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Thu, 10 Nov
 2022 03:12:24 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7%6]) with mapi id 15.20.5813.012; Thu, 10 Nov 2022
 03:12:24 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, "Liu, Yi L" <yi.l.liu@intel.com>
Subject: RE: [PATCH v2 07/11] vfio-iommufd: Support iommufd for physical VFIO
 devices
Thread-Topic: [PATCH v2 07/11] vfio-iommufd: Support iommufd for physical VFIO
 devices
Thread-Index: AQHY8wx4zHuY1VxYskGoQhcyiXm8Ka40i6SAgAAZRYCAAKqLgIACLtmA
Date: Thu, 10 Nov 2022 03:12:24 +0000
Message-ID: <BN9PR11MB52762B729A028EE1C95B21808C019@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
 <7-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
 <Y2ny84qOFQhtYVPF@Asurada-Nvidia>
 <78d1994d-f6ac-7d1e-7d00-4a98c309bc5b@intel.com>
 <Y2qXNcqXtAVkmXGN@nvidia.com>
In-Reply-To: <Y2qXNcqXtAVkmXGN@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SA2PR11MB5068:EE_
x-ms-office365-filtering-correlation-id: cf7b0a02-6638-4eec-1b13-08dac2c963db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4pGtEOmne9m3nLKDrSSdbtUYhTPe0jieM6ILmcWg49FGEireyASMhDEWTwMbCPOMj3rV3vVYNW1Ag+sdOCPkOT7JUPt3ocrGZX52ni7EYmiDK7a6AHoyRLYKhH7bXpoHPu7+5xuGkEKSWRD5eDJVtxyArxYyc9QUiqz5NFe1OIINMJQTHp7PoQy52/KBl5cvKuhTQ8P16B9T9t1hUCJMWN8/eQpcBAxkhcalXC6IqVZ/PqiUX1dhaBjK5K0VbRXs3ilr1OYOYcVfoOBvIPwWSlJB1wFMMr72Hb3RmirPX9UGn+mG8NNCuLobAsdoIParyYntT07+6SlDyu+ggbQP65u0WuftGHW1FjyTSqDe6Ei2kxfrkCly++B5t/3oEhb/ZkN4roPcvh6JbwftSz+ugBZKdmBu+PDkY1p4KCBY1yq53hHCIBUf2XytwViFWxBUphEOPKZKQiACEcm8LLvm/zFYjI6nZF80w6iQCsV4Pc+CQiRIHEEQ81coQsBLZj/b+be+vRRnkDB+u/WEBDLKmYMb0e2Q6Pf2ViMKfnk1IjYFqEJEsF7qHIXyk8YlYDslA7yYCL527sE3P2P1pP9XG9IURh0xmwla9tfA0iQ84nCYnoMhFB8HI1sLlM4D32n0tkuhxp9kAatrud97giGk4f6O5ib1p8rBL2Q/UcgK/+t0HuQlOlAKpC6p9vSEc//rN7K1uQFdUrwVOVUo3fzECmrpIqpjtAG+MjTkmcbcuYoMKBeKNwh2axMCNsTgABEi3zb1gpuf80WoNXSUFznfNA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39860400002)(346002)(376002)(396003)(136003)(451199015)(4326008)(38100700002)(66476007)(76116006)(66946007)(8676002)(53546011)(66556008)(82960400001)(316002)(6506007)(66446008)(64756008)(7696005)(26005)(55016003)(83380400001)(33656002)(7406005)(122000001)(9686003)(5660300002)(86362001)(186003)(52536014)(8936002)(7416002)(2906002)(41300700001)(71200400001)(478600001)(38070700005)(54906003)(110136005)(6636002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?J4ou6vKCG/aABBEfHmUntpTr0kyhZ3DnEvEws0BTOJULKxLgvUBSDYQOmEkj?=
 =?us-ascii?Q?7+Qk8ZK5ySBiVYDQOvhvRJtTeS1VWglHTlmK+y+eKYM35GD2/wVHMlcmj7wn?=
 =?us-ascii?Q?5o8990CIW+TKtsGlVj8mwpCmkvt3jSCgQOLwendN2tkldxtQYXzTYV47kaVD?=
 =?us-ascii?Q?N9UkHJeQ1iFivF3+uREgjsCXbGhw+Dx9WjrBYfWCVi1glwLuph7Zy5GZjjHN?=
 =?us-ascii?Q?pJwT18ZW9lH9lnk5W8LgZuJXeDreunLd3nIndZJMx1rYh7VD03zSwzx0IrhL?=
 =?us-ascii?Q?SdO5GADXYkUxtPOv4SHQ8dutqOyCEsL+QCsIlNTL1GvXRb7tgt38w69E5Omv?=
 =?us-ascii?Q?0fdh0UY3DQ6w7LVPUonZ3+SYQfHDLAQvItL+HUEVSXLTfZBbveH45sRb/IHw?=
 =?us-ascii?Q?IumGeDg2j/+lHDFZLlz1t3QbJ3Ny3P3Y8LrEZMqAaQNB8Cj9z2wQ+BHcFtGL?=
 =?us-ascii?Q?Ily802bIzZqbXpLxjejO9MhtpiCF4wf32SbNe6z4J7upvbERZnwkglBMAu3E?=
 =?us-ascii?Q?3qMzok/ZxLmR5LaCfhwEE7bfbD0Cz0bLmx1tTyClcqaGTmn6lGSeW1JFq58e?=
 =?us-ascii?Q?cR2f5QcGQvvV71z9Hp9phtK2tOeu1w1rxKHG2FU+cofmd3T/yEOSUBo2hPLr?=
 =?us-ascii?Q?1wpb1CkBRuPZzZ0qRrSxljaevljdJP8wFq7ELw3BUY9mYmPT7k47dU3YmCaB?=
 =?us-ascii?Q?u3WljJ4cQWMrx1mmWBM5k/4rFIIRJhVDMU8fSxbBjh3ooTroQgWqbWe6hg32?=
 =?us-ascii?Q?40OYAiwzA6+eYq7SkMat3QFqLIOQywBJMot9NSCgmL+yZxTUYFqHXP9R3Q5/?=
 =?us-ascii?Q?ETm3sbbWCPLZ43ng/Z3fW5HcP3Mj0KHSbxmRS2lfPDG11kFyl140/iB0LqlW?=
 =?us-ascii?Q?VK177O797yT5zN9+oS4zrMU3Z12uS7j9L+Lopw6sinG7trB19u4zs3uSJJdd?=
 =?us-ascii?Q?UNDdhgbe1UBbwXuM3xVewg+xVI8WLYhP/U5nc2q9u+7dmjD+b3TgLoKRvYN9?=
 =?us-ascii?Q?yp7lykmDaU7pqTKqwlL0f7jLerVFQ/koIZZcHaqr+x923Go39Pfu0xzpteFp?=
 =?us-ascii?Q?8+EYSlyg4gK8g6ZXR4E7J/3/606eE+Hb5UtRP8+zPYPmL7q0cygYdW1AH6Mh?=
 =?us-ascii?Q?6pbRKksjM47mFzV0hiH4yEk3TTF8ZOOTZ+ckI16ljSkkVkciv3NXZi7eI4oA?=
 =?us-ascii?Q?aPOU36tmMFr9C7Rq2DX+TG9+ysSDNMu4Dm/3hG9RssBV3QfxJtrpvTPwJb6F?=
 =?us-ascii?Q?yg6AuJ8hQtd04bARHd3NNah7a9qINnZF+UYfp+NK/AIC9vI+9eqpzymEBFF1?=
 =?us-ascii?Q?rXlCpX5vnyn43ee7Pm9RodqU7+s9Dcg3w5Izc5U3oAx2NEJWqCXS7O29zDCw?=
 =?us-ascii?Q?V6oiXGFB/hdiQ1LXRy/HLqaWYFxt+G8EI/BnfAN81AfuCiXQWzdjVLs9YXOu?=
 =?us-ascii?Q?QDcmYsZ1yyDdMsjl8r7uaStDA3QXQUq/gKgY/6ehH4NLz2FrPFd0i7kQCXu6?=
 =?us-ascii?Q?Pf3YKePY9XtDxnNE2Ox7agvgB13Ip4bVC0aDnYCN8OwhG+zqA9PiQc7ws/Sq?=
 =?us-ascii?Q?OzXECoIPvltsprPoEgK1az6P/IxbgPWX/m5eCb9+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf7b0a02-6638-4eec-1b13-08dac2c963db
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2022 03:12:24.5709 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iaSK4debSPl5UIeZn6xr+1YAjx/LyaT9kIgiTpGDQ+8Y7Nsh0U8PhEMyHSgQfLYqotWJmGFgyLSWKEDnzsiIFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5068
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Longfang Liu <liulongfang@huawei.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Matthew
 Rosato <mjrosato@linux.ibm.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Halil Pasic <pasic@linux.ibm.com>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 Nicolin Chen <nicolinc@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, Jason Herne <jjherne@linux.ibm.com>, Eric
 Farman <farman@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>, Shameer
 Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Wednesday, November 9, 2022 1:52 AM
>=20
> On Tue, Nov 08, 2022 at 03:41:25PM +0800, Yi Liu wrote:
> > On 2022/11/8 14:10, Nicolin Chen wrote:
> > > On Mon, Nov 07, 2022 at 08:52:51PM -0400, Jason Gunthorpe wrote:
> > >
> > > > @@ -795,6 +800,10 @@ static int vfio_device_first_open(struct
> vfio_device *device)
> > > >   		ret =3D vfio_group_use_container(device->group);
> > > >   		if (ret)
> > > >   			goto err_module_put;
> > > > +	} else if (device->group->iommufd) {
> > > > +		ret =3D vfio_iommufd_bind(device, device->group->iommufd);
> > >
> > > Here we check device->group->iommufd...
> > >
> > > > +		if (ret)
> > > > +			goto err_module_put;
> > > >   	}
> > > >   	device->kvm =3D device->group->kvm;
> > > > @@ -812,6 +821,7 @@ static int vfio_device_first_open(struct
> vfio_device *device)
> > > >   	device->kvm =3D NULL;
> > > >   	if (device->group->container)
> > > >   		vfio_group_unuse_container(device->group);
> > > > +	vfio_iommufd_unbind(device);
> > >
> > > ...yet, missing here, which could result in kernel oops.
> > >
> > > Should probably add something similar:
> > > +	if (device->group->iommufd)
> > > +		vfio_iommufd_unbind(device);
> > >
> > > Or should check !vdev->iommufd_device inside the ->unbind.
> >
> > this check was in prior version, but removed in this version. any
> > special reason? Jason?
>=20
> Oooh, this makes more sense - Kevin pointed out the check was wrong:
>=20
> > > +void vfio_iommufd_unbind(struct vfio_device *vdev)
> > > +{
> > > +	lockdep_assert_held(&vdev->dev_set->lock);
> > > +
> > > +	if (!vdev->iommufd_device)
> > > +		return;
>=20
> > there is no iommufd_device in the emulated path...
>=20
> And he is right, so I dropped it. But really the check was just
> misspelled, it was supposed to be "device->group->iommufd" because the
> caller assumed it.
>=20
> Still, I think the right way to fix it is to lift the check as we
> don't touch group->iommufd in iommufd.c
>=20

yes this is the right fix.
