Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E66F45A3A45
	for <lists+dri-devel@lfdr.de>; Sun, 28 Aug 2022 00:42:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7582D10ED8B;
	Sat, 27 Aug 2022 22:41:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D8510E5C1;
 Sat, 27 Aug 2022 22:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661640103; x=1693176103;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sqSX6AXxZCc+rAWObnHd/1r+DqB/z6eGc+AWTO4LLQ0=;
 b=Ns6VRHxL0rr2e3fNOAqHlwPxRG9EydA9JI7tTA+FLw75YBTa0ZcMEnBG
 6lYm2DylJnbcsDZJY34XglmlDPoqqTr7vPiQ/whx1aoXRM9Diwwxsw884
 N5iJyO8F6jvrp6t64fU2t3XXIioMgyauyuBjQ3OL04/5R28MF4pHal/Ps
 73It7uRcwWNSL0s4lkh1/WmhLJOJzax4KtaVDaspsYHTBT2b2wqyUDIGR
 KBabbP+aalPzBsshygrqlrj/5Ap76SXQKAZGkfm0YCkWFaUBP9M/tpVnc
 M+D8gCDzCer5nD54Y9+bHEc6yKIcq2g9kFJrV2SLY1sAXOhuu1hOC90Qi g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10452"; a="295470450"
X-IronPort-AV: E=Sophos;i="5.93,269,1654585200"; d="scan'208";a="295470450"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2022 15:41:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,269,1654585200"; d="scan'208";a="679229971"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP; 27 Aug 2022 15:41:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 27 Aug 2022 15:41:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 27 Aug 2022 15:41:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Sat, 27 Aug 2022 15:41:39 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Sat, 27 Aug 2022 15:41:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nyXJ2AF7HCCcDK7x0W+Q/Uhhqfc3UPv+MDxxkJ1hvxoZXHYNOG3ICQYQDELCNEcMudYgi69GJJNMbvK4HtdnT3tioJJJLHxX+G3UfH7f1Xf7c82LrZajAMjQeDwFXkT5NjdDS+2xeQ2BZ4lOMbFLywXJwX1agMR7FsNLJY6hYu74Ks7Z3hsZyGFg+fiL2zY3hY8bDyGm2lJlltP3BXFt4Dz8JU2Ww4wZ7LM5JPKKbXK2GuLG7rKEX3IqiBVnUYbzKnCAj6LtrapoO00ye1qJCTeB+oh784vDCfo0h7le4H1ccvbejbpXn6AiMVYHqUvBus1O32Khu/jR04VyAeociw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUHLxZUFgvZsdHwKV+YSW5zef4vpVyQBd1rTEWcSV0s=;
 b=KSl15bM1RvXt+LWP8YQlvpCIo9d0TsVEWna4rYm3bkk3P8eO3gkErH8uMuiwCAcLED0uiLHPCd9zPik5iSh7lR/VXoCIqgCcKAR+MCGQ9IxFdrtVu5FxCQ/Io8m5hvNSWZdctZmjvJ297jgitb4IbCJErqj+MKT8hvB28nIt5JWK2WpbA5kk+zIiaiu90Ptt0aGprkPy0QRVr5Ra0n5gkq+UN0FUwFSmwqd5kvVKPgvxyElRVl8J2vDIVPeDjxz3CNbeRvn9enhGUKL9ucbSi73EqQ00cMmSCedIzncr/iykiuAxDsmOID+mlfrNmcgpN/x8OtlEcccAbzrsikTV8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BYAPR11MB2566.namprd11.prod.outlook.com (2603:10b6:a02:be::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.19; Sat, 27 Aug
 2022 22:41:35 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::3432:5d61:f039:aae6]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::3432:5d61:f039:aae6%4]) with mapi id 15.20.5566.019; Sat, 27 Aug 2022
 22:41:35 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, "Wang, Zhi A"
 <zhi.a.wang@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Eric Farman
 <farman@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic
 <pasic@linux.ibm.com>, Vineeth Vijayan <vneethv@linux.ibm.com>, "Peter
 Oberparleiter" <oberpar@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>, Harald Freudenberger
 <freude@linux.ibm.com>, Diana Craciun <diana.craciun@oss.nxp.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Longfang Liu <liulongfang@huawei.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yishai Hadas <yishaih@nvidia.com>, Eric Auger <eric.auger@redhat.com>, "Kirti
 Wankhede" <kwankhede@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 "Abhishek Sahu" <abhsahu@nvidia.com>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-s390@vger.kernel.org"
 <linux-s390@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Subject: RE: [PATCH 00/15] Tidy up vfio_device life cycle
Thread-Topic: [PATCH 00/15] Tidy up vfio_device life cycle
Thread-Index: AQHYufpaEERp1jw5Hk6i2eOqrykz5a3DVopg
Date: Sat, 27 Aug 2022 22:41:35 +0000
Message-ID: <BN9PR11MB5276B696C6446952D3E670BE8C749@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220827171037.30297-1-kevin.tian@intel.com>
In-Reply-To: <20220827171037.30297-1-kevin.tian@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d4971ad3-b789-409a-7130-08da887d4bee
x-ms-traffictypediagnostic: BYAPR11MB2566:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 001C1Rr33E5N0LjICljKxxhKZvTbU9ceMXbJ0Bg8CybwkQaCNw86vocbeOaYnLrMBr4VuA3NvcjgipaIojEnGoOFxsyny1BM2C30zW8UQnXAOCoGgUet50s8kKNokzsr0da1UWbXz4113qsBYrLLdbRo+68LrjuioeBQW3bKb7h04f0JyyaEnPHsYudXyYW9BSljMoLe1bsyaP/cdNs1bcoC/uxbw4oG3WBXHci6k5pAhYmr8AFY4cR55Fv7u7cnegc+wZEfTrwCLSmwfkr//XO3F3KxaVaE8LepOedMyRJA+hTMA1BNUCwCB8SXSvszTyBhSvKkS1B6Tmpapp6ZI8pp87LYEaDVecTjG+P/cHt+/nzzb42TMhJR1IZsCky2AfN/eAZZx7e7Q8dTIegv0EuBAySabtntssHEWMn3YXzd+Pq3sA9MmDpjU24ArW18WtirofzMpymuxsFDCFaY36v0cdS1MyNDp9R5ycu32RbfwMUsfvMeXN3dQQLPa1GGW8RYTnxXrxU8fUSlPTuuFmycKahFDRKet0+ANVIWfTW57nEDZYUZRI4y8vtuGHkQZdOPQ9wTQQ/jmYTnLgE80mQtT5nrGZiMmBlTPsyFdcOBuCZ1kdNWDikzSRiJ95dKrJ/nS4+xxeuYHMyZ/hr/jTXS5sTEXB9xeDHvPinRReBrFE+BH8k+GeU6ciUznQgVWgtMey3lr/zH91G96bDvoJT2RmjE0v7MQkaw0NRjGFDrbF5bLOQcpZ2v1pscmJ1HziAiDGCdWp0ge3MLwiesnMF4r3CCGojRatW5RSiZKyVxfAHUVrQRa1IcgkcGESzv/jVUDV7DDgMfyyQSZt7Tg3ErVcDGYVBKZwPrq3Yqc/8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(136003)(346002)(39860400002)(366004)(396003)(86362001)(83380400001)(82960400001)(33656002)(122000001)(38100700002)(7406005)(8936002)(921005)(38070700005)(7416002)(9686003)(7696005)(6506007)(26005)(52536014)(55016003)(478600001)(41300700001)(71200400001)(966005)(186003)(2906002)(110136005)(316002)(5660300002)(76116006)(8676002)(64756008)(4326008)(66556008)(66946007)(66446008)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AR7/0cs7uVav4cz89zzqC4H8Nnn8zzEaH3Jckockg1LXqSAi/fCpgsC7erxq?=
 =?us-ascii?Q?2wC7PzXAkRsZ7AO2iN0LQdzAgKBucpwnJvDB3H5BCzqRFRG+wiO+DZrkdpy3?=
 =?us-ascii?Q?VztKW1S7oSIUkzI2NS6FCKEHsaO7h2ZhBemJau19+xEKtC2oAOjm3JSo1nIL?=
 =?us-ascii?Q?0ucuxYJCsAbESzirObM8NUeBn345xSgBRXm01yo7jq+fP0KjzRXmvyLuoZlp?=
 =?us-ascii?Q?wiG3ebQwTdCMpbMBpt2ySj1nry+INvEbrCdSR3UUpoWW43MyIeYHFWSOMZqk?=
 =?us-ascii?Q?y+UWVEuRsK8g6Aa24fGNkArHjDfNj0KousiYGaSAfKUHwlq0D5Ye3lvNroMF?=
 =?us-ascii?Q?O7hUnwq1pkdADajOEJDDqQ9c6GcpJXdDs2H8uHdVIMdYssEREnWYFy0q5XXL?=
 =?us-ascii?Q?IzjIH0cVBsZ/7L2OUiTZmnSurs1UPztsCUbY91Ic8xijvNI9v7ZfNwduxURW?=
 =?us-ascii?Q?UEDdAjsKt8WYXzK/NjtT0WXH/9BAfqSl5cBKQ8ak3oQABmGjrqBd2xEkDqXD?=
 =?us-ascii?Q?3u2HSUjE67P/t8NeCuuakeOTCdbEsaK3ypLZ+yPUlC3F1NSwrDEugjf01oya?=
 =?us-ascii?Q?T4sovIl3Z29s0KK9C/ngEB0gUqYJ6e6OjrDRlIe+pdIWiWuYwJ63mhXlQVox?=
 =?us-ascii?Q?bRI/27G3l723THtXxk5S/X+NaYcYXeO7OMw9/0DZXgv+BfYWitMxb97mxyUv?=
 =?us-ascii?Q?SMX2NUXQs3y9kw+910hLLNwcetVdFZ99HtCKloapz12tVvjwmyoPPxlERMF1?=
 =?us-ascii?Q?DasA666i+9c7XIrLVg9I1UK+xTeYqqLmpXiL1ckomHFS3cWIEdQkSYyw/kV8?=
 =?us-ascii?Q?+8fM0MXndKGkEnYav5DDZzG3N6b/8sH/NXDh/StidEklx4fJJBcz3C9a/cwA?=
 =?us-ascii?Q?EpCXZcwcvpFPaciyoHHY6CA4qGvHJ/EtBxA8RcJ1fkXAWmrTYltQ6WDT9Ul1?=
 =?us-ascii?Q?9pwq5Aes9/rblW+b3ZNJF4vRtUVlk018tZBEHJj7JwSf4i6xO0iVLiZ2hDnm?=
 =?us-ascii?Q?56TIinOhGulADp1qe9EpTabqACBKrbZZr70cm/sEyjDA1g0XSN4lkVIRcHQi?=
 =?us-ascii?Q?W4BRDN+Q9gD/6u9zhlYv/g2rrgpu59mRhMZuxiT/aGYQze/BpIqrF3NzZic+?=
 =?us-ascii?Q?U47BzA+kzbWwnbG2yU9KScNEQRye12AiwtBmugsIrrx59GAgQ58aLYTNVLXN?=
 =?us-ascii?Q?jB3DjU++5Frj351ECYlSdcmyyB7YMmr0bFZpZnuvu9vB/uYev+RPwX9OqurB?=
 =?us-ascii?Q?3wjjF4xShxlPFA/zXndvQ8+cg3mK0nElHbTgI9ski0je1vo/b/aJNFzb37GD?=
 =?us-ascii?Q?7TXiOVoL9l4J+tAPWq1hQfXOvcZLdzSW4Vs0kipE4zB1wma7J9QOFQu/qPZH?=
 =?us-ascii?Q?/I/hjRbXiesMr+m/QYqk6LYb6kHd/sLHQ4wuA72P5SYJfu0nQ88Le12HV0y/?=
 =?us-ascii?Q?BuY83xZMaGK2msww973G3qhjTLbFdtMsXeWO7Ht7O7+7Wp3ZI1sG1Gy5lLEq?=
 =?us-ascii?Q?ZdaGoTErRmNJjbAJNowB/zCgH3yNPN3Rk3RSUFOZOnTMT3NE4fbLaisJCNvO?=
 =?us-ascii?Q?o4kn3L7Mxs2WaInMEHV6aRZHhkqII0Gs4KHN8M6s?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4971ad3-b789-409a-7130-08da887d4bee
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2022 22:41:35.1915 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dYSFL2M5cmaNNagGotu/68+VRMD2PkRuKTdyyHujXL/OdLoSY61lT2mUvkmAC/OmMTFQOGUJ5n5cdO3cwGYBog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2566
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
Cc: "Liu, Yi L" <yi.l.liu@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

lkp reported some warnings below. I'll got them fixed in the next
version. Not sure why they are not captured in my builds though
I did turn on treating warnings as error.

drivers/vfio/fsl-mc/vfio_fsl_mc.c:570:6: warning: no previous prototype for=
 'vfio_fsl_mc_release_dev' [-Wmissing-prototypes]
drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c:1216:5: warning: no previous=
 prototype for 'hisi_acc_vfio_pci_migrn_init_dev' [-Wmissing-prototypes]
drivers/vfio/platform/vfio_amba.c:110:37: warning: unused variable 'vfio_pl=
atform_ops' [-Wunused-const-variable]
drivers/vfio/platform/vfio_platform_common.c:608:37: warning: unused variab=
le 'vfio_platform_ops' [-Wunused-const-variable]


> From: Tian, Kevin <kevin.tian@intel.com>
> Sent: Sunday, August 28, 2022 1:10 AM
>=20
> The idea is to let vfio core manage the vfio_device life cycle instead
> of duplicating the logic cross drivers. Besides cleaner code in driver
> side this also allows adding struct device to vfio_device as the first
> step toward adding cdev uAPI in the future. Another benefit is that
> user can now look at sysfs to decide whether a device is bound to
> vfio [1], e.g.:
>=20
> 	/sys/devices/pci0000\:6f/0000\:6f\:01.0/vfio-dev/vfio0
>=20
> Though most drivers can fit the new model naturally:
>=20
>  - vfio_alloc_device() to allocate and initialize vfio_device
>  - vfio_put_device() to release vfio_device
>  - dev_ops->init() for driver private initialization
>  - dev_ops->release() for driver private cleanup
>=20
> vfio-ccw is the only exception due to a life cycle mess that its private
> structure mixes both parent and mdev info hence must be alloc/free'ed
> outside of the life cycle of vfio device.
>=20
> Per prior discussions this won't be fixed in short term by IBM folks [2].
>=20
> Instead of waiting this series introduces a few tricks to move forward:
>=20
>  - vfio_init_device() to initialize a pre-allocated device structure;
>=20
>  - require *EVERY* driver to implement @release and free vfio_device
>    inside. Then vfio-ccw can use a completion mechanism to delay the
>    free to css driver;
>=20
> The second trick is not a real burden to other drivers because they
> all require a @release for private cleanup anyay. Later once the ccw
> mess is fixed a simple cleanup can be done by moving free from @release
> to vfio core.
>=20
> Thanks
> Kevin
>=20
> [1] https://listman.redhat.com/archives/libvir-list/2022-August/233482.ht=
ml
> [2]
> https://lore.kernel.org/all/0ee29bd6583f17f0ee4ec0769fa50e8ea6703623.ca
> mel@linux.ibm.com/
>=20
> Kevin Tian (6):
>   vfio: Add helpers for unifying vfio_device life cycle
>   drm/i915/gvt: Use the new device life cycle helpers
>   vfio/platform: Use the new device life cycle helpers
>   vfio/amba: Use the new device life cycle helpers
>   vfio/ccw: Use the new device life cycle helpers
>   vfio: Rename vfio_device_put() and vfio_device_try_get()
>=20
> Yi Liu (9):
>   vfio/pci: Use the new device life cycle helpers
>   vfio/mlx5: Use the new device life cycle helpers
>   vfio/hisi_acc: Use the new device life cycle helpers
>   vfio/mdpy: Use the new device life cycle helpers
>   vfio/mtty: Use the new device life cycle helpers
>   vfio/mbochs: Use the new device life cycle helpers
>   vfio/ap: Use the new device life cycle helpers
>   vfio/fsl-mc: Use the new device life cycle helpers
>   vfio: Add struct device to vfio_device
>=20
>  drivers/gpu/drm/i915/gvt/gvt.h                |   5 +-
>  drivers/gpu/drm/i915/gvt/kvmgt.c              |  52 ++++--
>  drivers/gpu/drm/i915/gvt/vgpu.c               |  31 ++--
>  drivers/s390/cio/vfio_ccw_ops.c               |  52 +++++-
>  drivers/s390/cio/vfio_ccw_private.h           |   3 +
>  drivers/s390/crypto/vfio_ap_ops.c             |  50 +++---
>  drivers/vfio/fsl-mc/vfio_fsl_mc.c             |  87 +++++----
>  .../vfio/pci/hisilicon/hisi_acc_vfio_pci.c    |  80 ++++-----
>  drivers/vfio/pci/mlx5/main.c                  |  49 ++++--
>  drivers/vfio/pci/vfio_pci.c                   |  20 +--
>  drivers/vfio/pci/vfio_pci_core.c              |  23 ++-
>  drivers/vfio/platform/vfio_amba.c             |  72 ++++++--
>  drivers/vfio/platform/vfio_platform.c         |  66 +++++--
>  drivers/vfio/platform/vfio_platform_common.c  |  61 +++----
>  drivers/vfio/platform/vfio_platform_private.h |  18 +-
>  drivers/vfio/vfio_main.c                      | 165 +++++++++++++++---
>  include/linux/vfio.h                          |  29 ++-
>  include/linux/vfio_pci_core.h                 |   6 +-
>  samples/vfio-mdev/mbochs.c                    |  73 +++++---
>  samples/vfio-mdev/mdpy.c                      |  81 +++++----
>  samples/vfio-mdev/mtty.c                      |  67 ++++---
>  21 files changed, 724 insertions(+), 366 deletions(-)
>=20
>=20
> base-commit: 1c23f9e627a7b412978b4e852793c5e3c3efc555
> --
> 2.21.3

