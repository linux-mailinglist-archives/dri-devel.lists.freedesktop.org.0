Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F815031EC
	for <lists+dri-devel@lfdr.de>; Sat, 16 Apr 2022 01:45:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7649910E54F;
	Fri, 15 Apr 2022 23:45:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E3B10E0D4;
 Fri, 15 Apr 2022 23:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650066318; x=1681602318;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Lvza6qB84Gm+/e3tSzNIrxnq4zKuQRxIz5xk/AZ9bB8=;
 b=DdXtZoj7qs8y6crnZg5dzyuaP1XHQR2bQfSSG37HqiO2of25ZybyXLyr
 FnB6s7N/KA5OXg4qWEYE/0gxQyGZzaR634O6btUbOPwU+3Z+jc1ngj9Ms
 9oF+aVlxa30kFN4IZNT2GU6MQnbSnoJPX5Q/JlXAxR5KhL9CuA3DO4ucg
 BWZgg6HariSGT8OgitorrjnSxwEFrpByIknKB6m6DBffHz3XvKrdN9Ser
 50h+ZUVfZIyOq4HJ1/iweRIA0FGfTeGo/T639/VvTMFfKU1iyokdSyga3
 I1X5vBHHuET/Sc9SXIRfl6rHIoCUZ328TS+pq1RyO+QdxsPAXoxZkm/Gf A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10318"; a="245135025"
X-IronPort-AV: E=Sophos;i="5.90,264,1643702400"; d="scan'208";a="245135025"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2022 16:45:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,264,1643702400"; d="scan'208";a="509110204"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga003.jf.intel.com with ESMTP; 15 Apr 2022 16:45:17 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 15 Apr 2022 16:45:16 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 15 Apr 2022 16:45:16 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 15 Apr 2022 16:45:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EQ3hCpVzUmY6AUctN6igpABaRFIimxq9uSrB12VCYxN6mCm1G44gwxE3fLaM88Sv1Zbom4UGG8QGfs/ZCEo5XTZgqvEJ2rP3Xd+lcmnv0LmSZxH1tAmJi/r9IVk6Lz8EsSAmS4pDlB6mTiUq6tfSm1h+PBL9Cu5rLbtuXV/duNzcmEH/S8DEycVbqc4DuTzduOTbEFxuoWX4A//RfFC2P4SgsyNOk+PAortAW4XvAWBHu4WdRfcGWs686XPQKAGkc+nuO887izbLLLbS57RK3zgyIVWsZC1HLx1TBj8jJ09zKLyC5FV+JPbJFfKZnviPPY8hrtFjI39fVTAD8NahrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lvza6qB84Gm+/e3tSzNIrxnq4zKuQRxIz5xk/AZ9bB8=;
 b=dXUsAWFLHajzjXk7u8qZ56LXmVEv2lCF2mWzdBRvpnem13tfPDrEYsq8dFUyo3n4Dk53VpUaN/dML72fCOiJcmV7mPZTR0c/dX/0TdjEg4remVJxGA6Ea0ZXwTdwMNLGhBBLXOtanCHvOJN8o26RC+G8pDvV+bImqnyyww6bTdXh1qFjuobncYQMxgNTQ1wNM785S11jSQmBuEC8zbY6q89YvbjYSf/TnesVfdYlWU/SuPNpu5/IYhiLzIEVoioa6JC7GW73NIU/JJqWiboQEYDf4bBJCVSibW4DCXmVewMpst5OdTcBM1Mu6F4BwmODvRue3BkMTx82MZ3kgxWNqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by CY4PR11MB0007.namprd11.prod.outlook.com (2603:10b6:910:79::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Fri, 15 Apr
 2022 23:45:14 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c4ea:a404:b70b:e54e]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c4ea:a404:b70b:e54e%8]) with mapi id 15.20.5164.020; Fri, 15 Apr 2022
 23:45:14 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: RE: [PATCH 9/9] vfio: Remove calls to vfio_group_add_container_user()
Thread-Topic: [PATCH 9/9] vfio: Remove calls to vfio_group_add_container_user()
Thread-Index: AQHYToWALOjmn4an1kSZ0RkA8dFDlKzvcIiAgAAIewCAAMWwEIAApwIAgADCL2A=
Date: Fri, 15 Apr 2022 23:45:14 +0000
Message-ID: <BN9PR11MB527668FA6B65E4B18D7AB7E28CEE9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <9-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
 <d6e2778a-01e4-6468-2c2b-3b718d924e65@linux.ibm.com>
 <20220414142210.GE2120790@nvidia.com>
 <BN9PR11MB527672B82DCFAD2C9B28E8CC8CEE9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20220415120728.GG2120790@nvidia.com>
In-Reply-To: <20220415120728.GG2120790@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ea8923c3-32b8-4fc1-179e-08da1f39fd37
x-ms-traffictypediagnostic: CY4PR11MB0007:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <CY4PR11MB00075B9F350960ACF2482DBC8CEE9@CY4PR11MB0007.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +sypawHZtNKNaa8c4SNS9zn5JazXH/LufCOIMEuZUyPBNQIjK09GzqfvpcQqDFf+O4RAX1TIZ+4VJA9CaoSOt63fVqI5Sj40ukKfqwV8/VMUj8K0cmQxVJ2j+7a3o9AbQADtavQ0qUA9k82S/CRIRaUxCkQULKknolLmXFHpJa7qMw2i9jZCOCd68SvlkzXBsdw3gqa11qCAN4WUjT/U9FOPmhWnSdWg7l7/PRCdeKqFDC5CRYOFxa/TBZlSQV7BYvCYDT7ZDWtGVPrh1DXoUeUHhaV1ElDi7ffCZwAwWYdm8vTs+wnyzbAUNhX+2arp82xq24+GwjaDiGlerOUYatw9qR9QPGkealZaxTB/lPsgPwVR3dGTokWsi0dFtF5ij/pa0BHDx57wiEPqswpQU0MDfp2HwknFhPh0UNN9F7VOIkWtvqAwkyEztnsdjkyjLMxWvnlJSxWkmuysQOnr22/Z1qqF6C0NKSQB9CkIkSy4CtoFMjIPr8ylvachHum1h3pOokt9YOFINRRpAYPZ/tdt5ynRsBS5azidbOf9qpEeVwnnTJzC4ZWKEUO+qvW9PIgnJUqV1edtOKNG85lX+HtX2dhD1kwFcAUrxaQk8MaB7h8MkxrmNBOfI3z2RS0VUIomEaoBOL0u1/548XyU9E+2aLuDQri+Yr5ALCW24qin+P7zjZRLLQYq73xrjw0eams4zZU1fkg4GdgtbUHu0Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66476007)(5660300002)(7416002)(66556008)(82960400001)(122000001)(83380400001)(38100700002)(38070700005)(66946007)(52536014)(4326008)(2906002)(8936002)(9686003)(86362001)(33656002)(76116006)(8676002)(55016003)(186003)(26005)(64756008)(7696005)(4744005)(7406005)(6916009)(54906003)(71200400001)(508600001)(316002)(6506007)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SpHMIAUqEmcztcsmsXaD0ZmHaPjFuEa95WzXvSNKPRrO3mgNnxXTd0yQmqUR?=
 =?us-ascii?Q?ZN3wh/n74jp7Y0WZNWSh1lKh8dRznk1HJCeN7t5kN+xPcaJnYTKpsSRHdon+?=
 =?us-ascii?Q?7aBsRs+Ydizd6Jx7icGcTxGs+vTnODU971Fa5uaAStQUhGPemPPmJIZ5KrtO?=
 =?us-ascii?Q?DYrdinQDy7Y3lW8OQDJ3y1chA8tTUsOZkwIYWHIVRzn8nusiCRGT/XKOqfLP?=
 =?us-ascii?Q?wisDVSRQAuCpsagypTVE/DHEK5leY9vuM9KeZ3tmtVbakVGRWY7ElfEXTgca?=
 =?us-ascii?Q?C6HGv0ca2a1M98uBBn0p8pGLs4Mrta1t6MgD/x+yYH7yFHmkp9TFmsrLj91j?=
 =?us-ascii?Q?qjVmf/o1rF1KqEwGYwqL6tvlN7a7EbWY7CHhNPq5EmLmDnpeOmnXg+fVd5eF?=
 =?us-ascii?Q?jwc5q16Lt92gqC/3vvbj05mlY/q4Kjl0+98ieO4yacsWWBDDzWpnMou7fBzM?=
 =?us-ascii?Q?NH6rA9y8yTrVFYA4Vdtl6K9dvv5QjrijmLI6iZ1m1oQuD/V7jPtUbQPg4BW0?=
 =?us-ascii?Q?Wak81GCKlVAPO2pNYVvObQt4wE1AVJQR23npnoSOs1Ybh3qtTiok1TKURaKI?=
 =?us-ascii?Q?5gYgXdgue3/cvjhDxBwzILavsPFa+MGCvp/KYYLBMt83ObDswp3tklV6xEKy?=
 =?us-ascii?Q?93tBKszAW9vVOBdlyBkYWiHCq5rjNjbDxsMuSBtMYjd9fvfF3suL3L6OTen3?=
 =?us-ascii?Q?0eQCL09Wh36o1+UCze36hQeLIrRpp3qUzzKwRbxrqFqOEIoVYHmrAU3qLs8J?=
 =?us-ascii?Q?QqvDE5Z1/Mxz/3JC0ith1linivEBN3Fz4UWiApG6NFVBg9t0ZUyKXz+zCO6+?=
 =?us-ascii?Q?f78FnJJRuGfEZCsgA1m5QPoCNGb5RXyWOw+zdknYIkcF7omM2NowKXyiHnFY?=
 =?us-ascii?Q?A3TH13b1tV7sRFjzvGFrHDHp7nxSRAvP6z1Sns/KDT8+VrMmG+30mRekmtj3?=
 =?us-ascii?Q?IMg3jw8esWKDflpb7418PPya7huJIOIPxIpvTzS3NVb8BhjsS2vQEe82lBjC?=
 =?us-ascii?Q?Uf02n/wbSm6VZfDm0rBYI1297o3W4cXJkLT6rAtxTTUBjV8LHCXQgxpfW5xT?=
 =?us-ascii?Q?nq2x5huA7PCmw6KKNWzq7cC7lJINxw/mTohw1VMysXsWl7J2BIaa2XCyxR86?=
 =?us-ascii?Q?Ptu5fl0WdtrCajUqQG4L1oFaXv69mIQOtOcxctGVW6HpTFLwTI3el59DQYxE?=
 =?us-ascii?Q?6zZQersyduc3nvuACdNgG/QBeOk0vvsOuAIx15bPgipyDo1wK874xUS/8Stk?=
 =?us-ascii?Q?UOfWu9guggDgx+pIvi4Bjoc8z0Zqo3NGAo/BmrI96n/xxFpOCn3E4Uw9tuBT?=
 =?us-ascii?Q?ipqWlhWsA/GkFSAPB/Ywfrc0ZhvqH/Nf5odzcBATcOhR/uoDirLjurPbdAJm?=
 =?us-ascii?Q?GKT40zPLnCoDKoSyv14Cg7Gvn+W6vy6kGjxqPMK5p5cZ99Z/abChlal+NfR6?=
 =?us-ascii?Q?7St+X0mqyAR+li/rU/lMnW+uBxn4uj27D//hvYIS9c5NVPKviyA5VPr5hlag?=
 =?us-ascii?Q?emEARH4UIMCPrMMfoTfuTb4uc8k2ObdZctTq/ejgX3BD7wSgZv0NuS3/Gcr+?=
 =?us-ascii?Q?FynRNIOWKRS8nZ4nJ7MxqWytwinXVHiGsgnvTSWrZ2A2i8D0ksCss8Y59sJ/?=
 =?us-ascii?Q?Aon0j4/k5HFD9L6OnGDNLFpdL+fYxqRWmpLAb3gDOo9b7gDC2gGWl+Nokxfd?=
 =?us-ascii?Q?dSJkVfvttFHRyPP3FcKUuQEdkX50uSWx6PX6bdthJrcgXLNAbp/g8eAA+aVY?=
 =?us-ascii?Q?OzDMoGxc+g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea8923c3-32b8-4fc1-179e-08da1f39fd37
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2022 23:45:14.6002 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E07bIQVu2TZzhfhkvF168d4Wzqscz785CfyWotfr50onYg5XjcPdty04NewnItEQ2liCEGAnLCsKkFW8fOLMPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB0007
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
 Jonathan Corbet <corbet@lwn.net>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, Jason Herne <jjherne@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>,
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

> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Friday, April 15, 2022 8:07 PM
>=20
> On Fri, Apr 15, 2022 at 02:32:08AM +0000, Tian, Kevin wrote:
>=20
> > While it's a welcomed fix is it actually related to this series? The po=
int
> > of this patch is that those functions are called when container_users
> > is non-zero. This is true even without this fix given container_users
> > is decremented after calling device->ops->close_device().
>=20
> It isn't, it is decremented before which causes it to be 0 when the
> assertions are called.
>=20

right, it's quite obvious when I read it the second time.=20
