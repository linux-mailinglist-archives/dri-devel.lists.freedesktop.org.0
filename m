Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC01500410
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 04:16:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A6210FBA7;
	Thu, 14 Apr 2022 02:16:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C61D10FBA7;
 Thu, 14 Apr 2022 02:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649902561; x=1681438561;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=B4cvPWGIg7Uqx//RIdpw6EcEEFoQ7BatD+We88wYPfE=;
 b=YicUs6hrGITVZodCJUbbOmkXtDZZrC2aH45P2CpgC5DTCRqG+U75TnNA
 p1YqrTBdiDIq10gc+hCHFgkR7zRlvSYuANhKiZf/VHCKbc6i6Iy/KFAJy
 fSbRqF2lxyhCskNEgv/1XII3dJoRy3jXAu9ypn3VA8lOS66brSGixXmDS
 8os5F2wvxtldH3aBivqXLAh6M4afcLs3mLFF9wPFNVQ0aGuYZyKdctTK5
 nu3SOiw0ADWFmBj7MQJ3Ik1M0U4/b6fbN8v1iEX8cBsZBdE+QnmeYU1x+
 Q+wDDe4sRL9tZ+jRTrRW8D8XRy6Bpicws3QiqUrgPsAiAuZjYhTbHLNML w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="323268627"
X-IronPort-AV: E=Sophos;i="5.90,258,1643702400"; d="scan'208";a="323268627"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 19:15:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,258,1643702400"; d="scan'208";a="552455894"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 13 Apr 2022 19:15:58 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 13 Apr 2022 19:15:58 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 13 Apr 2022 19:15:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 13 Apr 2022 19:15:57 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 13 Apr 2022 19:15:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OAY422v3P4F3LtfpL/WLBsXt8TUwVTmOCmfCktTkr4bfiOxPd5e2pCNcbCGN/7PUgobS7dFQv7+3eKS0MQ/Mm2iXJrs7ycdCEUnGlVVZ+S71OJsNSkhD+d5cfGfc/qAZ1czlUBmKxteAWITqvFd8XOD8HEp33/9/N2sfh5cq2KEYjmjlqZVLoKA804o6p/IV3O1ffNk43TjcKGi3fMQ88nKEkPGM88G1/lkUHPTGHjDf4lO3NhCsCVKUIXA1bmho65RZ+xlHdqtw7hnkGycmHDVmYXk0/tdmNvAck2UOHnjVb6wKLYn80Fq7qSlX0gDVIoKYIKU9AEG1cZeqgFGTWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B4cvPWGIg7Uqx//RIdpw6EcEEFoQ7BatD+We88wYPfE=;
 b=Zc9i+HM8yQOPWY7GqZ9Tuft+VAzTk1zUFDs8ONco5wPC5Y+VHyyspu++GqjmdxBKF12A32E1gXHM/JxbuSCydrgPQolQZvhJoy4xLCT0BcUmhNKmu6RA//m7lbmTEPsJKs49fnstFB4cBFIxSFNvUaqqfcODSoSDVNDejfy5Z7f8yIJggNETlVECkNPcimje9LqNSX44aKtDO5ESf42Ka41wBfnjBTRrU9nJ5VMApH3MquBkm7EVsk71mDD3ZEcpChbXQetd0hVxVQVBAod4JdsvdJcB1jKDSl5R/bZZI4Po9QXaA93E8L391rRw8rtUWL1xc/gMbT58XIe/f2/44A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BN8PR11MB3777.namprd11.prod.outlook.com (2603:10b6:408:8e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Thu, 14 Apr
 2022 02:15:50 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c4ea:a404:b70b:e54e]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c4ea:a404:b70b:e54e%8]) with mapi id 15.20.5164.018; Thu, 14 Apr 2022
 02:15:50 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Wang, Zhi A" <zhi.a.wang@intel.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: RE: [PATCH 1/9] vfio: Make vfio_(un)register_notifier accept a
 vfio_device
Thread-Topic: [PATCH 1/9] vfio: Make vfio_(un)register_notifier accept a
 vfio_device
Thread-Index: AQHYToWBFlgA1ZPpLEu2nNEUaY3qF6ztWRcAgABgPgCAAEpdgIAAA2kAgAADOQCAABLpgIAAHA8AgAAM+QCAABH8AIAAVEiw
Date: Thu, 14 Apr 2022 02:15:50 +0000
Message-ID: <BN9PR11MB5276ACEE269D5178B92BC8F48CEF9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
 <1-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
 <20220413055524.GB32092@lst.de> <20220413113952.GN2120790@nvidia.com>
 <20220413160601.GA29631@lst.de> <20220413161814.GS2120790@nvidia.com>
 <20220413162946.GB31053@lst.de> <20220413173727.GU2120790@nvidia.com>
 <661447fd-b041-c08d-cedc-341b31c405f8@intel.com>
 <20220413200418.GX2120790@nvidia.com>
 <bc3f32ee-0dd5-d525-0536-dc18ade338a6@intel.com>
In-Reply-To: <bc3f32ee-0dd5-d525-0536-dc18ade338a6@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 07d73ddf-a611-4728-4120-08da1dbcb258
x-ms-traffictypediagnostic: BN8PR11MB3777:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN8PR11MB3777598274FACBF3CBA85AED8CEF9@BN8PR11MB3777.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2roS544d1YD6AJUvub76RI6Aq1dHpPyHqjpZcGYwEs1vlLd5KqoNXZmX+f6WgXZwRgkGvpDdqYf3cC+d9Xli91RnzlZ/2FyOsKYxw69wH7Q7PuXBw2Glt52neAbpckI79cRJ+r2FOK2a9sUvEhyymRelGU7XsRn5MoLsqxF29tK3IfmqUphkjGjUQMsoLtEBJ1REMPpe14j/JMro1U27IA4+FwB/LmLlRmtb+7952AJiuDNDMFfrBecl8+C/s4FSOvhlobPGuuZj9CRee7DaBgDBOnsJix7GnyksGvAgDZpRoVoOYDw1aL+8WcIrT8UXlwM3+TyY57TJA8sHF+S1gWT4Euqd0vrl5TCkLCBB/JvM8yRJWNfkdPyM9NDVd328MXty3D00P12mnX/UgG2B/P/4Zhx6NT3Q3CeenIwBftUrvLQWg8G9YAgzVeittCtCUPtnpZ3VdxcDG6rkpxhG2dfkh5j6DF2vGBgsxmRyNCXjLSk/ATJyy+OYDOkqOT9CDDe/JLVvogrRZCgZtNyqbJWssvRFTK9LRYydJ0n8rO8/cPUKlklfKL+Kj6nXR9w/l0EXPNhQaxqzCG/4WBN7CCdc/Rfg85v69pdJ4eDQPbiaCnp1dHtdif49p2yBfDNPvDohrno6vF36PpTVJmhLizh2CL8HCgrG5v6VpI/xDYDju4MDiONiMbqkMqvLBlNnisU0bPPoGI7PsyRfxyviJA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(82960400001)(64756008)(4326008)(38070700005)(66476007)(66446008)(66946007)(71200400001)(110136005)(4744005)(54906003)(9686003)(2906002)(6506007)(83380400001)(7696005)(66556008)(76116006)(8676002)(33656002)(38100700002)(186003)(316002)(8936002)(86362001)(5660300002)(7406005)(55016003)(7416002)(52536014)(508600001)(122000001)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pLW9tbxAjsXkyw+p4anm18NQxJN4ZxUx0SHekyJEcpOmNuC0l8OlyPI+9H9i?=
 =?us-ascii?Q?aoIshTmxbRERZt2KYwaNXqnOX1+34S1tcpgHHeATBLpsANTmyPTdWCplxWjg?=
 =?us-ascii?Q?SnYwxNXdpkQaKU9gg8Ib/wel+9dL00RLybskEM9Q2gBLdulmY8a5MrybEAB2?=
 =?us-ascii?Q?E/A2uxksvw0e429JNM4AGHvHprATg+i9jbKMWPyVNcnM3KJWFum5ahp2pUfo?=
 =?us-ascii?Q?dqiYlM7EAW0+4t0+TqTs8NerOIQs6bnVIW8A4lM+slg6Ehtv8SzTsFGEbtvA?=
 =?us-ascii?Q?FOiBt2WoL56RXzIIu48lZS8pbDYdN2WGQ0tfXh6YAtqhu4g48qhXyodqPmLS?=
 =?us-ascii?Q?RosmXOUgCckKgP0xAErKXMAwDHsKiAtH1j8tFSEzzDgzSABIUKI2EQCIZY5q?=
 =?us-ascii?Q?PjSqIFGndBCK5gst9ThRSiCGVvCMPj57PRtZ/pyrPkPo+GZzCXiuyDK7htOK?=
 =?us-ascii?Q?iJPlpfOoy3kseVD8zKrzfCfSCHbMUH9YVnh/5ef4SLTRMTVINaGn71KdaHlm?=
 =?us-ascii?Q?DaXu5ICFvsnZv5UzF+DgmVotDiW3eOylZq2V92zC2nL2UUMWB15XSfXsPwx6?=
 =?us-ascii?Q?7s6l0qIg1FPL40XSB4Qj6QW6RYyToK9ocWArmA53kzGYI1PpBIb4mEdAWRIv?=
 =?us-ascii?Q?LQWR7hXWPvegmuJeVGf4TD8wzRbx9V8vNdgGRArPdZRNyNpFX/jRF0PjXeaL?=
 =?us-ascii?Q?Slew+3n9Rbwcnn0oQl44oRVzdSCYd7bSdvWaM4Mnhf6j1QBIzxwAOzNdb32B?=
 =?us-ascii?Q?dPrbi7uxrscU9jVFX4VMgWw0ZrQvcFtlCBFmGpIwvQ4cZi3S+K+ywhs1fhfR?=
 =?us-ascii?Q?UKMRExLSuKkZZgdNpQ7ibmRG0yaR243cPKqaHhbM5qtvlP8M25lqf51nseHl?=
 =?us-ascii?Q?6iQbjZ3TCg7hXIo1Y9LDKFSGDmB89j+XSke+fWoSUR3eFKoEKAfhj5DhxNmr?=
 =?us-ascii?Q?p02X9N1LFUjokdy+j0fLwSze0JWjqDpJP9BvvxjaAGqDi+thOAofFLYOnFYu?=
 =?us-ascii?Q?lHpVTCcp0JjcSc8P2sqdiEdrClqmgB1BrnpKw18gW6SSH+KmNQUVnU/7jVjc?=
 =?us-ascii?Q?Qe+AX/hTmFB8n/3Yqq4CiRGVqRck1Xrbuo2ZPUS2EullpinKtzW0gWL7+4Qj?=
 =?us-ascii?Q?7J/tbmBF0VkUkUjm9lSCjAYS5n6l9UnmFDiNbaTLnu2uaY7BODDMH/163LhR?=
 =?us-ascii?Q?Bi0IqAU2DHG8sQ7dQewY7tN0A9uTlneb2W9NBC6YFa3+M2aVAaaKjBvfyW1p?=
 =?us-ascii?Q?Uhp5enjHk1byvLIuaTI5RkffTh0JrZ/RK1EzWHT5fRVs/FqY3dsHDyRpB2wx?=
 =?us-ascii?Q?i/a4gDES7K39eWZ37avF0vancj3/Fc3/7jD7amJKVXn6loDsChImBGF0GbG6?=
 =?us-ascii?Q?IYH+mesoIRb/7SQy1rdENJALuTQJa48UZ/cJfEzey50Cs1RpvYTuiGWHyJ33?=
 =?us-ascii?Q?xBsmnDwx9oS7uTcbX0gUmsBU07KgMyFTFlkY7UpQqOGSwCAs3NRS4EpINkgg?=
 =?us-ascii?Q?ZERXRI1b8YuFLgpnTYkv0AdM6M3/Az5YWNv8f3Su0zPB1UbQdIlpYHcuyK8m?=
 =?us-ascii?Q?CmLEuY6K79CrYPfnP94RmEHkz6IjgrUFeFFqUwl64VtGEkxYsZJQqC9h16EI?=
 =?us-ascii?Q?ehUj3Rfhqw0xq2K+A95vZZu7ZeRtQEZWqUnzOXh5ApGRbZRWtyRI5DJtSy7O?=
 =?us-ascii?Q?Qnj6R7nKP70pz044fVmOe7PQIgKt0qMPWRGUYVif9zpQlHHTRfOBzRn8OUDq?=
 =?us-ascii?Q?X6IjfXKX7g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07d73ddf-a611-4728-4120-08da1dbcb258
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2022 02:15:50.7424 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3UH4PSBgEjmysxXOvDl1OQKui5F8sKuJ1xFeEvTa77pb2ZW3MpTtkYGyKPxKJqo0KfD+s1di6MN1Ul5ZikZfbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3777
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

> From: Wang, Zhi A <zhi.a.wang@intel.com>
> Sent: Thursday, April 14, 2022 5:09 AM
>=20
> > Or is it that only the page table levels themselves are GFNs and the
> > actual DMA's are IOVA? The unclear mixing of GFN as IOVA in the code
> > makes it inscrutible.
> >
>=20
> No. Even the HW is capable of controlling the level of translation, but
> it's not used like this in the existing driver. It's definitely an
> architecture open.
>=20

There is no open on this. Any guest memory that vGPU accesses must
be IOVA including page table levels. There is only one address space
per vRID.
