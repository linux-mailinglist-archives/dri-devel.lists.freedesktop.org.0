Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 877AF5003FA
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 04:05:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCAD910F210;
	Thu, 14 Apr 2022 02:05:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0348510F20C;
 Thu, 14 Apr 2022 02:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649901907; x=1681437907;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nIcri2FxFkSOSeG5IwE3mHtvaVsiEQhogUZHpjwkqjU=;
 b=LOkK7dZO7EE/XjXyzgNa5n5eRSKZdBlZwi1wA7flOYBcGGCHbpVVpITw
 k6V+02k7lzrst/1o5XT1qnXbrmBSRyGT0p/Vme7RffxkzqcIYJ8tYLESe
 OtM858/Jrs/hBpb20T3OfIdexCu7jFXVcu72QyHZRyO5OlgBA2gc0nsQt
 W1CX72d3pfQq1XghccYDJztpT7hf/QEELWp0m1yIpT8f77pS1LLCpPE9w
 5W4PU0c0z6yly/AjSAZiu13QxV3552XgKSuO5iwSzZF7pkbAsMhsYLd52
 u8DrGa8/CdNd3odaRf8B4Z2NdGaSG+Az7YfcXkWkT1x4snQooVJrGuP7I w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="250113151"
X-IronPort-AV: E=Sophos;i="5.90,258,1643702400"; d="scan'208";a="250113151"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 19:05:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,258,1643702400"; d="scan'208";a="527191720"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 13 Apr 2022 19:05:05 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 13 Apr 2022 19:05:04 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 13 Apr 2022 19:05:04 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 13 Apr 2022 19:05:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T7oSSnEYoYM6YJc5NGURovlqth4ijNRFVnUPDS4GTsPbUsEbXZOZ3b/sMPYLEFWTlxkX1RQgsDSO9sahxxXUfkk6SXVQxRIa/TMeOc7Z6Ec2NGTT2hc6I0KkbbLOydqhsFpBYU09162B2kiN9z9dSe/NHjsI+aaa5MxeEY3BfcOuPDFLgshwK16FHY87Nv/RadxFlMtnSzr4gah3bhufv9NwKxVG0WPWhRhySS6QoNvkXUMkTwkngNbikKMAIhLvNcRmoHGFZZVjVGaO8bErEpWKP/DP1MvnWzYWtysSgVt5+LuOUFyXKUxPi4iGvOxlO3OYDxf3WSV/n095+8W3MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=94WtJTu0EW/9crdAa0Sa4dDylcp7DTTV7YtvPYXzNz0=;
 b=Pf/wlC83lgzQ46i64Af4Cw5L6udPKNjSIxG0ASbw3qcuvlapzwGUTtzCO1p/1g2PfpdzPYwHcGH4D4moWbtEJ/1yUxTC6qvSMfjLZ2/7GcioYwezpw1uOeLgUGxTLiywZS8/tik0eyfUCW9vwpMiOCuBR6DfVsT7vR38YxlzXlNZkkIV8PU3gMPNPueVCkTqiH71A28GzPu5OEk4sL2+p/TZA68AyQhJx3nrLZOMUK0hDWgefDwgBX+aiT2RQyRrNScslwLcOkIIKe8AM9j1mg6z/44fh8GSLWvrXXEVQeDTWgEEav+kB2DW04gYRNtlyjx81m6OegyW2Xo9DvNTOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BN7PR11MB2643.namprd11.prod.outlook.com (2603:10b6:406:b2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Thu, 14 Apr
 2022 02:04:57 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c4ea:a404:b70b:e54e]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c4ea:a404:b70b:e54e%8]) with mapi id 15.20.5164.018; Thu, 14 Apr 2022
 02:04:57 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>
Subject: RE: [PATCH 1/9] vfio: Make vfio_(un)register_notifier accept a
 vfio_device
Thread-Topic: [PATCH 1/9] vfio: Make vfio_(un)register_notifier accept a
 vfio_device
Thread-Index: AQHYToWBFlgA1ZPpLEu2nNEUaY3qF6ztWRcAgABgPgCAAEpdgIAAA2kAgAADOQCAABLpgIAAHA8AgAAM+QCAABH8AIAAIoeAgAAn7sA=
Date: Thu, 14 Apr 2022 02:04:57 +0000
Message-ID: <BN9PR11MB5276F5451828B752378F24408CEF9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <1-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
 <20220413055524.GB32092@lst.de> <20220413113952.GN2120790@nvidia.com>
 <20220413160601.GA29631@lst.de> <20220413161814.GS2120790@nvidia.com>
 <20220413162946.GB31053@lst.de> <20220413173727.GU2120790@nvidia.com>
 <661447fd-b041-c08d-cedc-341b31c405f8@intel.com>
 <20220413200418.GX2120790@nvidia.com>
 <bc3f32ee-0dd5-d525-0536-dc18ade338a6@intel.com>
 <20220413231215.GY2120790@nvidia.com>
In-Reply-To: <20220413231215.GY2120790@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 142b0495-9aeb-498a-be31-08da1dbb2cc3
x-ms-traffictypediagnostic: BN7PR11MB2643:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN7PR11MB2643CA3DCEB692903963DE348CEF9@BN7PR11MB2643.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Nb1M0sTyCvEEj4CSblDpMq+56XPUv2qXKh+ipSRUTAxBN8VuagsNm6OE64nQZqtJ/DoYX4OF0TxVHMzX+mGXJHlsC8Or22hyT1+bL3ok5Sq5JcLQdp90Mz51lXadcs5nzIy0dleknciIJDuStLHQuI2NPld3XMxI4v6xw7+lHj4vnkxeAwMUPGqJ/CLGljWB37cP38oYzTzn4OOUcH9idTOsXVFz5gs5oP6Ltb5CvKibdoGnOLl6NzcU88AnIKhXyqyuIRyRPX4w/tniFIDhvJl3avljPsVWmsEJww49Fb2DfVXy3fSVOFGw0N2o36rH++WyVeqf6YFxBvQo0h670Qm0M0raJNC5ReF3zRBKuE+x5VRZd0SInUvCtLIcYNhE5hbTPavtOAbUwAndwiyiJ2kcY9r8OH/m0VmJk/6ZyPphYdSZJ5ClXWGB8f3Q2h5W52+TteAq0EwPw8D/aIPNGRA1Y/FpwVBRMPy+MJMmFCVljswmiLCyMmhUEAJt1jaoOTcEIPTSls8kBfSA6zkFi8qrzJva5jR5otmkZwZrjL2s4odedMM8R0u7/pjNgjXpPA0CjWISPbEwT0YR1ylELOX4coxeBKWU4G/e+7Ad6yu/tc6VQsJjmkoT58I68g/iw3/kZ1/JaOBSGAro2c7k49R8Va29KZIIr5pGvIWzS0opm7nZO1HgayMJmZ0Dum5ryQYx931pxHl3sYVyG+ukEw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(64756008)(4326008)(66946007)(66556008)(86362001)(8676002)(7406005)(122000001)(54906003)(6636002)(110136005)(76116006)(5660300002)(7416002)(66446008)(8936002)(2906002)(38100700002)(33656002)(316002)(83380400001)(52536014)(82960400001)(38070700005)(66476007)(186003)(71200400001)(6506007)(26005)(55016003)(53546011)(7696005)(9686003)(508600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/kUT74yItOf2pfQ/42CrmnzeBwPjNMKzOhQwz1g9y4G1xZ7zKk2t0wZw2GcI?=
 =?us-ascii?Q?ZPQw8rxkT0c5BE8k8p6ucQtyv9NvAvwTo82BokOeHfWHB7lDS+M6k7MjGa1j?=
 =?us-ascii?Q?ReOK9YuFCIefWuhmmVBiKlnSancjzE/oYUfBEWdb2jfVTMVdRRKZohq7Qkme?=
 =?us-ascii?Q?H+hwC+q0tJuvVbIaR4hZLmfAVi54QSnBZq77Kc5Ry/MEsHa2w0mZUzzNL+hz?=
 =?us-ascii?Q?VX7TAy6JqJpCvMNWd8S+Dj1uKk9n7JSydp218+AgJDXiqZqsRZhTifyXFnmq?=
 =?us-ascii?Q?K5al46Y7ABKkV1g69mNuMeaX1nKbcb9GlGUOPs6989jQTQXojAFX0f1vkYce?=
 =?us-ascii?Q?Vw2G1a8mUvl4zdC9sQwbbQoCVyRVTLqJVvd74oaymi4Ij/B/NaOXf9UOnBKa?=
 =?us-ascii?Q?l3HMhBGakJNO6grVuC8IBG609sAaL9wi/A2VeTROBjQ6F/re7UVk2L1qcKGR?=
 =?us-ascii?Q?g7p90a6jqjZszQwM4GA5sGiCMvbZ174avze67HlyVW4QW07rGhlc5Orrltud?=
 =?us-ascii?Q?hVqmuG8i9pCM0hT7jhhF6a8xBXXhx/NsiWv+nl+koh0MLiTrHf9+Yfyl3HKd?=
 =?us-ascii?Q?K6tKpY4oGoiFLsn1a77bbVUl3AR63EnhtkJA6fWPMo7hQ5qBZjNOlw2iEFes?=
 =?us-ascii?Q?p6WDXvHpxWjta/WvSUGyhvLR/xUvNL+0eMt1N8DERorD/hVEgez9XGhM54od?=
 =?us-ascii?Q?4kCX1Ji9wWVGSaegAG26wygudp286HWilAx5A74m+t9nS//XzFFMFk2VXffD?=
 =?us-ascii?Q?9fsps/a23SS1aLpA7x5p8HHi+6r6k9Tey9VkW5vxKPLehVwUZo7Btxcv9/Ux?=
 =?us-ascii?Q?2YAXdTvYpMzjTvyI1mwdFq1LyuzwcH7dmrGMX4vh6EsJSIv4lIlN9rJPnyEF?=
 =?us-ascii?Q?s6Vtj5KLI8kLeszhyFzniWN6PiaBjoT1/Yr4EzB1DycxQp1EHn7Od3IrEP+P?=
 =?us-ascii?Q?H6mgtZ1HssQGCf1/PGCBgIRFUg7ftPfHkk6R/4fJZLI/1YXD03kz7C4qNDRy?=
 =?us-ascii?Q?JiXB8ceRfDgRHfMaq8Hnxad+PaOkdQUdoMGQhiru//qFTpn3tkwkDwUySbpD?=
 =?us-ascii?Q?revhQpRcmgHMx4hfbSceX+WYFUFP6byzbzl+fNDUjamwe/NS5KfRehc6zv+B?=
 =?us-ascii?Q?InxfXLyZndvw9qBDqAq3sdAmB6saSPF0A1f8SoIDB+GTjV3EVmuUzX6DFLZI?=
 =?us-ascii?Q?C/d6Yrw8r6NQrXS2PWqaA1d/2ooV6XEJbH5RYt5GVNxJhzdmnMrWsEs21h40?=
 =?us-ascii?Q?6jJlDQYSl9Im45VvSMCmTFVIBto9/yOCu6NSjigPx1NGdLD6PnxgOYSOLvyN?=
 =?us-ascii?Q?2i/Q2J99Ys96M0VRSnGbwQ+Bp8cFKiRsrA0YpkRMd2kwTj1lJV1p99dtMiFb?=
 =?us-ascii?Q?Np2K7XHgzm0xchhAFyS/XG8SDNJ3vWv91u/klnH/niIeFPdJKJIjTCBcY3Yi?=
 =?us-ascii?Q?vAB2JJRtYVfKYlLM5z2QbcnaeF2EdxIL92X9qae+isocSlhEuTL35L3IAnxD?=
 =?us-ascii?Q?B2keC4IV/gAH+2h9yhbpz1q/1/o5NK2Zk2bMkMdmAthI8ri8z5RvsF9TmMnB?=
 =?us-ascii?Q?HwtFhpCUZb6Do8916UindXrkzUyi6n08vzfJAGqzCWMX4bZruBwQYkI7KT0y?=
 =?us-ascii?Q?qld8XjmhPgVsFm0T5kLTSjYjvvXs4BL8PhuTKWLhOZ1Kz8P+nO3BrMsGDM0J?=
 =?us-ascii?Q?YWhHZbdZnMPfC4QbcpW8ZhQAHqog3TRZf5pJdPWZE2n80RU3/Lsn9vuH0FQu?=
 =?us-ascii?Q?GrgxgD86mA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 142b0495-9aeb-498a-be31-08da1dbb2cc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2022 02:04:57.1274 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CitOCL09RbwwOD1C0qX7NNpvyYI0xBUIC2zjOQfAnugX1ZK+EXcwiey+C6E9qTcbGZ5TE9kIstH4yiSI4ShieQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2643
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
 Borntraeger <borntraeger@linux.ibm.com>, Heiko
 Carstens <hca@linux.ibm.com>, Tony Krowiak <akrowiak@linux.ibm.com>, Eric
 Farman <farman@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Jason Herne <jjherne@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Thursday, April 14, 2022 7:12 AM
>=20
> On Wed, Apr 13, 2022 at 09:08:40PM +0000, Wang, Zhi A wrote:
> > On 4/13/22 8:04 PM, Jason Gunthorpe wrote:
> > > On Wed, Apr 13, 2022 at 07:17:52PM +0000, Wang, Zhi A wrote:
> > >> On 4/13/22 5:37 PM, Jason Gunthorpe wrote:
> > >>> On Wed, Apr 13, 2022 at 06:29:46PM +0200, Christoph Hellwig wrote:
> > >>>> On Wed, Apr 13, 2022 at 01:18:14PM -0300, Jason Gunthorpe wrote:
> > >>>>> Yeah, I was thinking about that too, but on the other hand I thin=
k it
> > >>>>> is completely wrong that gvt requires kvm at all. A vfio_device i=
s not
> > >>>>> supposed to be tightly linked to KVM - the only exception possibl=
y
> > >>>>> being s390..
> > >>>>
> > >>>> So i915/gvt uses it for:
> > >>>>
> > >>>>  - poking into the KVM GFN translations

The only user of this is is_2MB_gtt_possible() which I suppose should
go through vfio instead of kvm as it actually means IOVA here.

> > >>>>  - using the KVM page track notifier

This is the real reason which causes the mess as write-protecting
CPU access to certain guest memory has to go through KVM.

> > >>>>
> > >>>> No idea how these could be solved in a more generic way.
> > >>>
> > >>> TBH I'm not sure how any of this works fully correctly..
> > >>>
> > >>> I see this code getting something it calls a GFN and then passing
> > >>> them to vfio - which makes no sense. Either a value is a GFN - the
> > >>> physical memory address of the VM, or it is an IOVA. VFIO only take=
s
> > >>> in IOVA and kvm only takes in GFN. So these are probably IOVAs real=
ly..
> > >>>
> > >> Can you let me know the place? So that I can take a look.
> > >
> > > Well, for instance:
> > >
> > > static int gvt_pin_guest_page(struct intel_vgpu *vgpu, unsigned long =
gfn,
> > > 		unsigned long size, struct page **page)
> > >
> > > There is no way that is a GFN, it is an IOVA.
> > >
> > I see. The name is vague. There is an promised 1:1 mapping between gues=
t
> GFN
> > and host IOVA when a PCI device is passed to a VM, I guess mdev is just
> > leveraging it as they are sharing the same code path in QEMU.
>=20
> That has never been true. It happens to be the case in some common
> scenarios.
>=20
> > > So if the page table in the guest has IOVA addreses then why can you
> > > use them as GFNs?
> >
> > That's another problem. We don't support a guess enabling the guest
> IOMMU
> > (aka virtual IOMMU). The guest/virtual IOMMU is implemented in QEMU,
> so
> > does the translation between guest IOVA and GFN. For a mdev model
> > implemented in the kernel, there isn't any mechanism so far to reach th=
ere.
>=20
> And this is the uncommon scenario, there is no way for the mdev driver
> to know if viommu is turned on, and AFAIK, no way to block it from VFIO.
>=20
> > People were discussing it before. But none agreement was achieved. Is i=
t
> > possible to implement it in the kernel? Would like to discuss more abou=
t it
> > if there is any good idea.
>=20
> I don't know of anything, VFIO and kvm are not intended to be tightly
> linked like this, they don't have the same view of the world.
>=20

Yes this is the main problem. VFIO only cares about IOVA and KVM
only cares about GPA. GVT as a mdev driver should follow VFIO
in concept but due to the requirement of gpu page table shadowing
it needs call into KVM for write-protecting CPU access to GPA.

What about extending KVM page tracking interface to accept HVA?
This is probably the only common denominator between VFIO and
KVM to allow dissolve this conceptual disconnection...

Thanks
Kevin

