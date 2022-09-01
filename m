Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6C25A9090
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 09:41:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E66DF10E616;
	Thu,  1 Sep 2022 07:40:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B09810E616;
 Thu,  1 Sep 2022 07:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662018046; x=1693554046;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WbrpeKJoBFogFhhdAbhr0E4sPShhAi9zDx8qKKIFzos=;
 b=A+WYtmZwPPIGCGKNRnvTUjt3gVTe1kvi1PxiH5k9OptenJ7ebk7OAcbu
 g8kHGL+sHp1Hftv0BfZJ8u7KgX3L4b8efyReCls+NiM9FEZ9mkaiLcI+Q
 sc9ekmkZ02WLa3c4xPUtExazPbGxgbh/nJUjiB3+wO6cIcUwxvy16hHRk
 LkI2DZhlL4CYbXlICKRirriZr5AR4Zp4K/Z/4PTkPFsT4TpnE2GbqSTJ1
 GKFKydt92O9Fv9Ju7y+poXQcXUV6B/Pn7cXCexQhp8mLi444JMdWtAwU8
 guJLCf2Nla3q9cpaukdWPuVdOjtK0gqS8zxCVukqp0wFJIsWjov8PLBTo Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="276045563"
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="276045563"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 00:40:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="754717963"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 01 Sep 2022 00:40:37 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 1 Sep 2022 00:40:37 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 1 Sep 2022 00:40:37 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 1 Sep 2022 00:40:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jqjtCj/I6pGjJsd7VR/F3rSeDGz8WL/wJlQbqZsSfCOjznUf5y01vgZT/ms824S9HugNWzt05cK3oDs4BSOK8Rpi8F/Eh5LNR+k3YSk6gHCuEo41IDzesv4ltn5gMW26jdNQ5gn0eJDZKZX84CFAVBnoHzfF2hCl+iMcJSL/kYZL1FdC8MP13BnYhb2bc6aQvRSM8Bgtz7ST8RVA6PL6aerCTGJ/eodaThah+e+fgVdHw8syCYRry5TVFodbhOacFcr8za3N1nBfnIGh2d2TdPeg4UZVxbrC21hVX+lxMbjUWtzxSrJf4jXLInKaZULdnylrcSzD0bCthYfJYl/v0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d/HMpEBjfVU5gETlAQakGZs0sn3VZlxEgRuV6umEREw=;
 b=jsRvsSqNhq1O9fIpXb3TlaeO8UE93d5D395ckKZqe+RYFRq91FKoXsN/TCpkM4LIXAnsvTYhKtF8+IDEzI8fTNB+K8AHz8qWM186CC1TjUc2ZvUAmCkNTxuwd2FAZIQ5WJQUnxJH2qP77Z6GQ3ECuqMoWf1WHrCIvRhHuEK4wnkSBmkivWR+z+GSFOcWclTvAwHYXnQ95pAZtoatvd2pEQPG6vBMafB0Emr2Lvrj90DzclNT8Bj2nAIO2jS9GHp+hW7GGg6+WDs51yEr+beMHVz5zBjj2TRrifePJFzVi6dRRoKsTeh2OXq9vRRQCWqpnK0YmH7k5W3tqaH7yi2CXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BL1PR11MB5256.namprd11.prod.outlook.com (2603:10b6:208:30a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 1 Sep
 2022 07:40:35 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::a435:3eff:aa83:73d7]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::a435:3eff:aa83:73d7%5]) with mapi id 15.20.5588.010; Thu, 1 Sep 2022
 07:40:35 +0000
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
 Wankhede" <kwankhede@nvidia.com>, Leon Romanovsky <leon@kernel.org>, Abhishek
 Sahu <abhsahu@nvidia.com>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-s390@vger.kernel.org"
 <linux-s390@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Subject: RE: [PATCH v2 15/15] vfio: Add struct device to vfio_device
Thread-Topic: [PATCH v2 15/15] vfio: Add struct device to vfio_device
Thread-Index: AQHYvdNJtymT/Xe4J0W2tfymtujF8K3KL5+Q
Date: Thu, 1 Sep 2022 07:40:35 +0000
Message-ID: <BN9PR11MB5276B59903BC7F580EC667B48C7B9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220901143747.32858-1-kevin.tian@intel.com>
 <20220901143747.32858-16-kevin.tian@intel.com>
In-Reply-To: <20220901143747.32858-16-kevin.tian@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e45fa0fa-3f44-4d44-6d97-08da8bed41da
x-ms-traffictypediagnostic: BL1PR11MB5256:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ax5/E9lAFiAlJN6nzX2O3Q3O7eknzJ+70ZBVj2P1x88LLidXvqIGwEL8wpPZ6fC4pwet30yAYextsfzoWVcLjTxdILRlkvieEP9rjFt1UZD72mxvBaBna26ccAkisQlpPgjLeplLr7H6H54sVpwHimKmgahAtorqRmjFTckSzi2x0Mt+a4pDaw8pmNk2G9/M6EwybK4IbCQesj72CHh/snpwXoqeGgpV/wOyCWiHxdc18nmo/90UjHCoS8zRBdeVRphkjdxbCEsTybmzWJLPamc5olUD7dVtO5n5cW5LI6eikq9fpF+zZQ6Grwd4qSvK0nyIpRejOodHoo5We/wHgWs0pV0e1jk65ge0FnfBiw+QkafDy2LKC5H0+i78fvs61McrrLmPr2oZ9+WJK9AlnOVtsWGFhikR3R2JoNfqRuKo/KHpn3RjvWa6P34Yv6b55f8e60tjzVbV32WReNDafTspTDSGHj7nWPIh6bqhTvaZIJM5lIpo2zF6O4y9VCEFq4qwBscZ0u2kRKwh32n05YPjRU3BUnwjnMOG1vg+gjz4VYezt1Xp7xYkKJ6yJJp51J6DilPyzNF7kk4EfNsuvLkpfBMR4a0ccPmm5FULB4R1PftyqutTYSmxOUtTC/ppH9jpZ6GLjRCPNLPgiYsNjR0aL9vg0bZ6wYRmqr6K3OeggiCU5U5aIqLUyF72L/qTZzdWLMpAytg/0v7Eq5PV8Lw67vPIMP0VU0N+gQ6ojg/EQ/8eES9dAlKTqUUjiBGcepq4qYNElW8KWA45XSLfUvLk+6inWfD5tmD6AFTCcKs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(346002)(39860400002)(136003)(366004)(396003)(71200400001)(33656002)(82960400001)(186003)(38070700005)(921005)(2906002)(86362001)(7696005)(52536014)(26005)(41300700001)(6506007)(9686003)(8936002)(7406005)(7416002)(5660300002)(478600001)(122000001)(38100700002)(55016003)(66946007)(316002)(110136005)(66476007)(83380400001)(66446008)(4326008)(66556008)(64756008)(76116006)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?p2dgPao625wIUkO6Vx12JuiW8Za1i0PzKaziFuxhLsRJpA1e9syuLOrjChOZ?=
 =?us-ascii?Q?EEAhj3nizrn6y791ZRiw0thqnooHbXCz1/rhfdJOwRZLCKUTAEdJbojMiFlI?=
 =?us-ascii?Q?F1o4b08Z1DKbR5ssdOoMpqcRp8chEFoieSr98euSgE+3E8fpwZ2/NnxrJ/70?=
 =?us-ascii?Q?+HGRRpoj/F8eiKoObDkT0o3uQIxcO4TwBzGI40dnEOYWnUOG4bATM92n87Zv?=
 =?us-ascii?Q?aMFTWtm5pOnNV8jKQJ3WF9z/QEveqJh6lMMJf4r4e9oquXO/YMRkHKnXCVlL?=
 =?us-ascii?Q?UXQZ27Pq5cU8eMiGaI3rPtsJX1O80LpffRezhgEA34Xn3zpbOWnncAw2iV1N?=
 =?us-ascii?Q?8Q8Ky3Cpr4CQfK5R2k5wIw5GYcbz3zGhP6T7ou/rnS78t2QCwYzCxQffz0Pc?=
 =?us-ascii?Q?f8Ru39KQP0cPWvRioVgnRJ/HQNcSgNyAme9XBqgaWSeismVwvnvhl7tknmmt?=
 =?us-ascii?Q?Ya0rji6bwrtQgOHxBafp+dqwmP3x2AKHGgYjvXhPVt7Ljpc3f7Ptuy+Ng2t8?=
 =?us-ascii?Q?wuy6mmX51eo98WPdoF6F354eE9bQt9knimCqpQ430e5RPXmP5CqPkAWvXbC/?=
 =?us-ascii?Q?S9/r63R68LlgAdrjWatCYgquKBSgXvyM2WulLghrN7y1/LfxiQrvQQqu83yH?=
 =?us-ascii?Q?hiYYoXthCEc1/wPk2oZjy8KEZtcowiQgmAgiAA4/RAPJhAP31CrptS4nlajT?=
 =?us-ascii?Q?uwDX3ekQH8+sLVPrm7I/O9bPDgUPQ/NxkbCSZcNJKIBNK662MDy2T1XUkXZe?=
 =?us-ascii?Q?XzOcCxbHhaKv3UF5Uq5KKSfqJY2E++xhNic1dMRk8E05W2Sf5FgsmbY2eqUO?=
 =?us-ascii?Q?TMQx/xT5u9t5aJ/y0q/HjjPt0mj45ttEvjmpUHV4mtoIY8CMU7hDhH0yGmBF?=
 =?us-ascii?Q?aWiWfHOtZJlmAjRYpsfTT25JZjtJpzRtfw5/ZfvhTx9ad7sYS0yPUByYq8pa?=
 =?us-ascii?Q?AmBp5L4iQymbluV/xD9SzvWmIm4KjJhKmm1xMjupKpp/DoaAGXFevTSc5+HX?=
 =?us-ascii?Q?V9AROXBMbw0V6540gHoCSrujABm80W/oNPhINU3sm0oqwfMOM3s4uBRSb6wl?=
 =?us-ascii?Q?WFtDHHLdzbmC8QFuwd+PpDcK4n5N8KXGtungCRYXHweMfsPF1FtRQI9JAvG5?=
 =?us-ascii?Q?oJCaph1z0UWsZq3t18VcPL9qX+1sZkTs728TOc7PA3pTJYDGehvoEs9v83ha?=
 =?us-ascii?Q?myPROyGPsb5bvjrON1Tpe40tq4AmVA1835hdAkFDJr8O/2mD2YA/lhHTLg2K?=
 =?us-ascii?Q?nvvNlsp+tSckkMtyn5pgQarcJzTXCpEiErG/d3DhMO5Ocu30iGujQgrJ7kcL?=
 =?us-ascii?Q?koJ+hDEGONI7ITrd81oQnu4AwqIb3GSfkSZQmzh7jSGY//aZ5cwedra5ogVp?=
 =?us-ascii?Q?Opn4pf/m2X14bg65YeIFY0BRl/SZTmEB8xl62Ile/plX5n04V5XsMcXV3PO5?=
 =?us-ascii?Q?9OATI2OCPB2MYLatIEvOyahyWul9m+MsSWXzm5/ObNSdW8laSXf+zGTUPbJY?=
 =?us-ascii?Q?zOCwuWik3WJgBubDXsT/SIoAuEVWeJ78TQsRpaQaqSsj2vHWD4kD2fb9Zs9j?=
 =?us-ascii?Q?4CAc2fV4rd8Tp1yz34eo0HPLD39ds5SN3x9x8S8/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e45fa0fa-3f44-4d44-6d97-08da8bed41da
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2022 07:40:35.4222 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lR2iQdEdHQdmaOpROhsLiyv6ZkMavPTZwDddolR/Gm70B1Uc7A3Qe6Hq5q70UmSOFZ/tmjJV1G/Gfg4HRgW6cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5256
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

> From: Tian, Kevin <kevin.tian@intel.com>
> Sent: Thursday, September 1, 2022 10:38 PM
>=20
> diff --git a/Documentation/ABI/testing/sysfs-devices-vfio-dev
> b/Documentation/ABI/testing/sysfs-devices-vfio-dev
> new file mode 100644
> index 000000000000..e21424fd9666
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-devices-vfio-dev
> @@ -0,0 +1,8 @@
> +What:		 /sys/.../<device>/vfio-dev/vfioX/
> +Date:		 September 2022
> +Contact:	 Yi Liu <yi.l.liu@intel.com>
> +Description:
> +		 This directory is created when the device is bound to a
> +		 vfio driver. The layout under this directory matches what
> +		 exists for a standard 'struct device'. 'X' is a unique
> +		 index marking this device in vfio.

This missed an update to MAINTAINER file:

diff --git a/MAINTAINERS b/MAINTAINERS
index 589517372408..3fc8c599f4f2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21310,6 +21310,7 @@ R:      Cornelia Huck <cohuck@redhat.com>
 L:	kvm@vger.kernel.org
 S:	Maintained
 T:	git git://github.com/awilliam/linux-vfio.git
+F:	Documentation/ABI/testing/sysfs-devices-vfio-dev
 F:	Documentation/driver-api/vfio.rst
 F:	drivers/vfio/
 F:	include/linux/vfio.h

Alex, I sent a wrong version w/o fixing two checkpatch warnings (this
and the one in patch12). Please let me know whether you want me to
resend.

Thanks
Kevin
