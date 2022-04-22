Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE1550AD53
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 03:43:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3914410F338;
	Fri, 22 Apr 2022 01:43:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D4F210F334;
 Fri, 22 Apr 2022 01:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650591789; x=1682127789;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=h/2o27ezvarWzD70fNipNCFG29t6dXHGi9qIin9z9vA=;
 b=NpqPgJWJM9WFnidVYbTvHdp9Ma+srLcP0oEa2MhpuLkQiCTv0Nb08vzC
 aZDYmbshRbqUEiZKCrrWSVUDx1AaKtIMjfDxT0waXGwdfWH3sgQL+GX7V
 jYEblOM7fYYA/8xmFF3RacXlMT3YwL73mPWEiWtaK8FERaFLReQ8UkIcA
 R0REqxGlv4ZCCI+QHtLIq9zWUYE5P5BbGITcji8juS7MCzeACrHbNyXVE
 JfKXCnV1KrrVM4RH2kgblZe/pbEJxDEccvOY7iPSk9zeZK/cLtj5vgmt4
 Jwh3uWSVvU8ai8GGPBx7K0Uykuyk1DK76z9VNo394iKx+oQX1JqrkLm0J g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="263386281"
X-IronPort-AV: E=Sophos;i="5.90,280,1643702400"; d="scan'208";a="263386281"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 18:43:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,280,1643702400"; d="scan'208";a="533840043"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 21 Apr 2022 18:43:08 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 21 Apr 2022 18:43:07 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 21 Apr 2022 18:43:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 21 Apr 2022 18:43:07 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 21 Apr 2022 18:43:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DonZFfJ3CRMaPKJxMnClmFtVbjRorrSNCISIwIJpgRI4EOhvjOoKvWTAfuytsUilczdL3ZO9lN2G3aF2/f2SQgbHfXiSEvfWaQdmyLfg3twO2r0jBmutrl0naHv/OvjNEnKUSvr/ZXHj5lVB9YYXjIKkBjsG6MgGALmoiVPEOD74rhLtEa93v7AI+OxcAmvu3XaaywMhyCyJZjrf5Xe+PsPEYxEkg8sTlhJXm0VGM69dMrRfmv/6DiLJI9yqr1qwbz8atT/WXh5xSBo2VE3qezzZaAk5TUO7T7xePft8seD7Mmn/nOUtiU/vOPj5w7d9jm69db6egWKtDEjgbrRGzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9wGb82wqKFwZV3yO0Klq0a7n5UrOOAsSxM1OC9wJOLE=;
 b=Nle8ZuSP+iAK7M4tr4hMJ+McEZoWnzn5hkHuMpBHKwF15IIaWALjbN0hJXvPT/qtGHS1LXegnXtuQKwBHAZY5eN7zm9hsrdaNpAKiXx+974Lk9WWXHICO68D8qVpRipPpyFf1o4IS1IbcxX4Tf2bazRttDRAsPUutDrutxYrdV6lsT0caxtj8BNKwVmDoXqibC/b0JL0XVkjP63IyL1vJqUQd8BymnkIiDrNh/sZHeW7Mo19MwCJLGUIdtcU8+BFmTqgiEIaoDtWdmEr2Ww5N9KCWLvFlVrGS1t3r+Ars89klHlG6Z8ytwuWb15tO92lYnR97exrAkjo3gKx36K7wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM5PR11MB1482.namprd11.prod.outlook.com (2603:10b6:4:4::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.13; Fri, 22 Apr 2022 01:43:04 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::24dd:37c2:3778:1adb]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::24dd:37c2:3778:1adb%2]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 01:43:04 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, David Airlie <airlied@linux.ie>, Alex Williamson
 <alex.williamson@redhat.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>, "Jonathan
 Corbet" <corbet@lwn.net>, Daniel Vetter <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Harald
 Freudenberger" <freude@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Jason Herne <jjherne@linux.ibm.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>, Kirti Wankhede <kwankhede@nvidia.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Matthew Rosato
 <mjrosato@linux.ibm.com>, Peter Oberparleiter <oberpar@linux.ibm.com>, "Halil
 Pasic" <pasic@linux.ibm.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Sven
 Schnelle" <svens@linux.ibm.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>
Subject: RE: [PATCH v2 3/7] vfio/mdev: Pass in a struct vfio_device * to
 vfio_pin/unpin_pages()
Thread-Topic: [PATCH v2 3/7] vfio/mdev: Pass in a struct vfio_device * to
 vfio_pin/unpin_pages()
Thread-Index: AQHYVZzjce9EhLDBe0q+gIvo3y8HRKz7KUGw
Date: Fri, 22 Apr 2022 01:43:04 +0000
Message-ID: <BN9PR11MB5276BA6140C053F26223A3F68CF79@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
 <3-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
In-Reply-To: <3-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 85144b90-da6e-4ebd-d53b-08da24017193
x-ms-traffictypediagnostic: DM5PR11MB1482:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM5PR11MB1482D34BF9EBF1F5B28842BD8CF79@DM5PR11MB1482.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HDE3fapIjXvA500ISV0wtouMgyh1E6XZaX+dXVYPHlxXO77COsxqzcOKkn6nC7wt5CVa/2RkDkBs727Uu5qtNUIK8BIOWKoqxZJZPou+7q2AYTMA39iFayyOIKr2WXdjaDCWaZh9luRglkvFZBLaNhpPBtxmFunDZEbM6EZ4Am1Qc98VOyQWID80xXHJBSHyTTd7JaPFBa9kZp8f1TN73TXaW8rGKfDc1ouqNGuZzbgDUU5gn+8BevFdr71b28tlUtMotez5JFvsSYMzCKGzJ2ppbWLNeAsGpWq4zhOTE+veHLOV/7WjGj/1FEoFpkqeiTMEce4Iz+mcFN1X3S7OWBKag+sTu9xTMQoBi0JzKRf50cdNs8GBKcbzkw5hSbSZGi1Tf8KERzyHBUQ/GfRW78SzoF4KLBBcNiAm1lpBg1HbY9JfO+k/dAgdc559dQtKCbQx/eF8b5VPuo83AY3YVZyNHQaXlS9a49KWfRZ+L/1YWNTdSeYNB29Pv5Pqcnl2kh9pqAU01TYn/3YbDcASGKsYiywrpNP2dwzJBGnu/r9fyca48sQLH+0ROP2ihn4F0qBxYpqqqYs/2UcSrgT5k7SXdAuGH4aBX2JUocxipaFZDQyw5Zsf71uzKN3DW/ftf78OKuX62U7Fq8/yEfhBFNqg1MDxYV5nwgIT+HYp4BYs/0apbT5n1dzHNbCAdFE3+jZxwUpavAp9j5oBhmucV0D5FARKyyPP7pt7ze94nm0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(9686003)(71200400001)(6506007)(64756008)(508600001)(66446008)(110136005)(4326008)(33656002)(82960400001)(66556008)(26005)(316002)(76116006)(66946007)(6636002)(54906003)(66476007)(7696005)(86362001)(186003)(921005)(52536014)(7406005)(7416002)(38070700005)(2906002)(38100700002)(8936002)(83380400001)(8676002)(122000001)(5660300002)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PP6Mi2glMZNDu6+mq3jAT8Wxc+a7OolIjyKEMJTLUFkKHcGosmF/eIxXwL7m?=
 =?us-ascii?Q?xVTsP+2wKCd4xZo+R0xYwrqhIpCp+wiVqVN1C5j6akNUU1snDoGjsrcTxR2J?=
 =?us-ascii?Q?Z8cn+gLxCRLMA/blcSmY2gacuO8fcTVoAYRTkva7ipyzPb2WpOQKCsf9jH+l?=
 =?us-ascii?Q?XK7JEaqBvTrNcwZkgXIuvdz0qBf8RGHqXcZkCnHbpEu6JpHe21kaNHJibBkM?=
 =?us-ascii?Q?QDs9v9nACXrLsurGO7WWEl8zg2Fu/JTVAQxfl66CoaCn7G7HMYMXdMFysSW7?=
 =?us-ascii?Q?DZCOc6OZnlPUPtQ11ekMM17mDhPrRUwltKvUhb8bQ1lbJ1hLp0ZPMABpvhGn?=
 =?us-ascii?Q?XG0EEWKABwCIHeeOm9flzIcq9PpPSOPQRMS3p+UhCY5QVFLVo/oMgwlbqKpd?=
 =?us-ascii?Q?UY5zVPF/wJJQwyaEXhs7D5Q39wB66YYEqiqzZmG3fJQwuAM4KPqARsEAPHdN?=
 =?us-ascii?Q?nqEDSSLeGR+d/FOGRHKvtpNlsmnGUpHIK3OFpPKNrKDV0tvejAACBJfSCk4k?=
 =?us-ascii?Q?qNBLUwBYq/9G9LbokznJpq9xVTUQOKEZPOoIbDz8U56GgY0bCEglox3OSnhB?=
 =?us-ascii?Q?EaCf1WweF6LIU/vdVhSe9ctTS/kmkBo8KtB/xOJAzifFMhBcDql9ILPY4tjI?=
 =?us-ascii?Q?eqZNwWEGppv5Ta5q3oFqdGMJ8J5kZB8UKgOnUpRDCybYfrzZ62DS8aoHd3t0?=
 =?us-ascii?Q?HBjqu/s+o5x6vVlwzswraWD0YAQkKYjtKb3e/uGLsJsVXYjSVY4SAaJYGRZh?=
 =?us-ascii?Q?B5xwtmIoOsKArXlS6yYz2n53CAool6e0olufVHX8mCyArVoR4OqfLhB8XAjk?=
 =?us-ascii?Q?uFkI+K3EEQ+OEIdFhMXTK913fWZk2mnTqOp8p7Wp3B1+igzcGYat6G+iBY0+?=
 =?us-ascii?Q?bwn+RpiDAAZLlG4SAhiwSA1HQLlB68NjOfm3LTSgH2pLBRUqQkDLBWNwYc7+?=
 =?us-ascii?Q?W5Wl3n4LqryoISuNzn0EXcl10+tkP4jvlXGPpR0p3o6CiWD6/hq32VoP8fsE?=
 =?us-ascii?Q?D8oRA0C2wVei1+/XMRTfNDgjNUno8v2QI097qtGvRJ9uUj+N5UOMP6Vl+vwt?=
 =?us-ascii?Q?RU0adFjWtPwXuHgMGRf4lW1k9qpFIF/jklCmADwG0MQNlJN0tKj0WVjuoH9F?=
 =?us-ascii?Q?HH6Iop8Axuz5exF/FuRZI3Sj3QMqUpe2J0fCpaq25YU4ihbB2o6F1jMHpMmJ?=
 =?us-ascii?Q?0bTTDckTlefAsTLWfl+Bh9WqRzeX084zTs9pc2BdUtWAowdQ9xBwoQZ4qrzK?=
 =?us-ascii?Q?TXTLvXl3hkc9X/5J6IJPHB4pgAIElVqddh7ioKSRzv1pHYQmwFifjJ1MfiOt?=
 =?us-ascii?Q?f+ZycA1J1stdyxU3F8Hp/6/oKQg5t7Q4Pyr8YPEhv2m7uenbULwcTQqunaMy?=
 =?us-ascii?Q?m/uGqnbwlYT1+aIIarpSUnX7ZsGWOY/Di8EVWsPijH87hdJhYx/lwX2MW113?=
 =?us-ascii?Q?MtrVlboKtvkLBS8UVLb0Nrn3BnsTJMAZIyCMSad9uzGvYcs21LsH/gJLgCGx?=
 =?us-ascii?Q?BV8OW4KDVMiynIkr/99d7TO29XmX1mHDImEwK1DtHyEzYrknP4onBenngDwT?=
 =?us-ascii?Q?eIPEs6Vw3cMgcbH8Tfn4dwIOytDzAAvZcQvFvUgFB8qEgv9jKXReRORTzCOh?=
 =?us-ascii?Q?ylXMxiNsXKGyuHaCG18OmPqzaa0AKcHKe39/5tUVfqF+juBvoVI0N5wJANct?=
 =?us-ascii?Q?2QeRHr6SRhu2vaiQb+y9fkVyiiczPmeg3SyqUstqxAf4kuanXs4LqE2BFK0Y?=
 =?us-ascii?Q?OWCOGSWL/g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85144b90-da6e-4ebd-d53b-08da24017193
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2022 01:43:04.4958 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iF3kQlKM2Q5d6hBcXy4en8HoHC5NoH4RnqEz5hSBFRM8X/G5DZfapnAh4K8FsSbU2V9gr5TxNeVMJYlYeroZoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1482
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 "Liu, Yi L" <yi.l.liu@intel.com>, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Friday, April 22, 2022 12:29 AM
>=20
> Every caller has a readily available vfio_device pointer, use that instea=
d
> of passing in a generic struct device. The struct vfio_device already
> contains the group we need so this avoids complexity, extra refcountings,
> and a confusing lifecycle model.
>=20
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Eric Farman <farman@linux.ibm.com>
> Reviewed-by: Jason J. Herne <jjherne@linux.ibm.com>
> Reviewed-by: Tony Krowiak <akrowiak@linux.ibm.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

> ---
>  .../driver-api/vfio-mediated-device.rst       |  4 +-
>  drivers/s390/cio/vfio_ccw_cp.c                |  6 +--
>  drivers/s390/crypto/vfio_ap_ops.c             |  9 ++---
>  drivers/vfio/vfio.c                           | 40 ++++++-------------
>  include/linux/vfio.h                          |  4 +-
>  5 files changed, 24 insertions(+), 39 deletions(-)
>=20
> diff --git a/Documentation/driver-api/vfio-mediated-device.rst
> b/Documentation/driver-api/vfio-mediated-device.rst
> index 784bbeb22adcf5..2f9e6025eb2fe1 100644
> --- a/Documentation/driver-api/vfio-mediated-device.rst
> +++ b/Documentation/driver-api/vfio-mediated-device.rst
> @@ -262,10 +262,10 @@ Translation APIs for Mediated Devices
>  The following APIs are provided for translating user pfn to host pfn in =
a VFIO
>  driver::
>=20
> -	extern int vfio_pin_pages(struct device *dev, unsigned long
> *user_pfn,
> +	int vfio_pin_pages(struct vfio_device *vdev, unsigned long *user_pfn,
>  				  int npage, int prot, unsigned long
> *phys_pfn);
>=20
> -	extern int vfio_unpin_pages(struct device *dev, unsigned long
> *user_pfn,
> +	int vfio_unpin_pages(struct vfio_device *vdev, unsigned long
> *user_pfn,
>  				    int npage);
>=20
>  These functions call back into the back-end IOMMU module by using the
> pin_pages
> diff --git a/drivers/s390/cio/vfio_ccw_cp.c b/drivers/s390/cio/vfio_ccw_c=
p.c
> index 7a1cf3091cd647..0c2be9421ab78f 100644
> --- a/drivers/s390/cio/vfio_ccw_cp.c
> +++ b/drivers/s390/cio/vfio_ccw_cp.c
> @@ -103,13 +103,13 @@ static int pfn_array_pin(struct pfn_array *pa,
> struct vfio_device *vdev)
>  {
>  	int ret =3D 0;
>=20
> -	ret =3D vfio_pin_pages(vdev->dev, pa->pa_iova_pfn, pa->pa_nr,
> +	ret =3D vfio_pin_pages(vdev, pa->pa_iova_pfn, pa->pa_nr,
>  			     IOMMU_READ | IOMMU_WRITE, pa->pa_pfn);
>=20
>  	if (ret < 0) {
>  		goto err_out;
>  	} else if (ret > 0 && ret !=3D pa->pa_nr) {
> -		vfio_unpin_pages(vdev->dev, pa->pa_iova_pfn, ret);
> +		vfio_unpin_pages(vdev, pa->pa_iova_pfn, ret);
>  		ret =3D -EINVAL;
>  		goto err_out;
>  	}
> @@ -127,7 +127,7 @@ static void pfn_array_unpin_free(struct pfn_array
> *pa, struct vfio_device *vdev)
>  {
>  	/* Only unpin if any pages were pinned to begin with */
>  	if (pa->pa_nr)
> -		vfio_unpin_pages(vdev->dev, pa->pa_iova_pfn, pa->pa_nr);
> +		vfio_unpin_pages(vdev, pa->pa_iova_pfn, pa->pa_nr);
>  	pa->pa_nr =3D 0;
>  	kfree(pa->pa_iova_pfn);
>  }
> diff --git a/drivers/s390/crypto/vfio_ap_ops.c
> b/drivers/s390/crypto/vfio_ap_ops.c
> index bfa7ee6ef532d9..e8914024f5b1af 100644
> --- a/drivers/s390/crypto/vfio_ap_ops.c
> +++ b/drivers/s390/crypto/vfio_ap_ops.c
> @@ -124,8 +124,7 @@ static void vfio_ap_free_aqic_resources(struct
> vfio_ap_queue *q)
>  		q->saved_isc =3D VFIO_AP_ISC_INVALID;
>  	}
>  	if (q->saved_pfn && !WARN_ON(!q->matrix_mdev)) {
> -		vfio_unpin_pages(mdev_dev(q->matrix_mdev->mdev),
> -				 &q->saved_pfn, 1);
> +		vfio_unpin_pages(&q->matrix_mdev->vdev, &q->saved_pfn,
> 1);
>  		q->saved_pfn =3D 0;
>  	}
>  }
> @@ -258,7 +257,7 @@ static struct ap_queue_status
> vfio_ap_irq_enable(struct vfio_ap_queue *q,
>  		return status;
>  	}
>=20
> -	ret =3D vfio_pin_pages(mdev_dev(q->matrix_mdev->mdev), &g_pfn, 1,
> +	ret =3D vfio_pin_pages(&q->matrix_mdev->vdev, &g_pfn, 1,
>  			     IOMMU_READ | IOMMU_WRITE, &h_pfn);
>  	switch (ret) {
>  	case 1:
> @@ -301,7 +300,7 @@ static struct ap_queue_status
> vfio_ap_irq_enable(struct vfio_ap_queue *q,
>  		break;
>  	case AP_RESPONSE_OTHERWISE_CHANGED:
>  		/* We could not modify IRQ setings: clear new configuration
> */
> -		vfio_unpin_pages(mdev_dev(q->matrix_mdev->mdev),
> &g_pfn, 1);
> +		vfio_unpin_pages(&q->matrix_mdev->vdev, &g_pfn, 1);
>  		kvm_s390_gisc_unregister(kvm, isc);
>  		break;
>  	default:
> @@ -1250,7 +1249,7 @@ static int vfio_ap_mdev_iommu_notifier(struct
> notifier_block *nb,
>  		struct vfio_iommu_type1_dma_unmap *unmap =3D data;
>  		unsigned long g_pfn =3D unmap->iova >> PAGE_SHIFT;
>=20
> -		vfio_unpin_pages(mdev_dev(matrix_mdev->mdev), &g_pfn,
> 1);
> +		vfio_unpin_pages(&matrix_mdev->vdev, &g_pfn, 1);
>  		return NOTIFY_OK;
>  	}
>=20
> diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
> index 8a5c46aa2bef61..24b92a45cfc8f1 100644
> --- a/drivers/vfio/vfio.c
> +++ b/drivers/vfio/vfio.c
> @@ -2142,32 +2142,26 @@
> EXPORT_SYMBOL(vfio_set_irqs_validate_and_prepare);
>   * @phys_pfn[out]: array of host PFNs
>   * Return error or number of pages pinned.
>   */
> -int vfio_pin_pages(struct device *dev, unsigned long *user_pfn, int npag=
e,
> +int vfio_pin_pages(struct vfio_device *vdev, unsigned long *user_pfn, in=
t
> npage,
>  		   int prot, unsigned long *phys_pfn)
>  {
>  	struct vfio_container *container;
> -	struct vfio_group *group;
> +	struct vfio_group *group =3D vdev->group;
>  	struct vfio_iommu_driver *driver;
>  	int ret;
>=20
> -	if (!dev || !user_pfn || !phys_pfn || !npage)
> +	if (!user_pfn || !phys_pfn || !npage)
>  		return -EINVAL;
>=20
>  	if (npage > VFIO_PIN_PAGES_MAX_ENTRIES)
>  		return -E2BIG;
>=20
> -	group =3D vfio_group_get_from_dev(dev);
> -	if (!group)
> -		return -ENODEV;
> -
> -	if (group->dev_counter > 1) {
> -		ret =3D -EINVAL;
> -		goto err_pin_pages;
> -	}
> +	if (group->dev_counter > 1)
> +		return -EINVAL;
>=20
>  	ret =3D vfio_group_add_container_user(group);
>  	if (ret)
> -		goto err_pin_pages;
> +		return ret;
>=20
>  	container =3D group->container;
>  	driver =3D container->iommu_driver;
> @@ -2180,8 +2174,6 @@ int vfio_pin_pages(struct device *dev, unsigned
> long *user_pfn, int npage,
>=20
>  	vfio_group_try_dissolve_container(group);
>=20
> -err_pin_pages:
> -	vfio_group_put(group);
>  	return ret;
>  }
>  EXPORT_SYMBOL(vfio_pin_pages);
> @@ -2195,28 +2187,24 @@ EXPORT_SYMBOL(vfio_pin_pages);
>   *                 be greater than VFIO_PIN_PAGES_MAX_ENTRIES.
>   * Return error or number of pages unpinned.
>   */
> -int vfio_unpin_pages(struct device *dev, unsigned long *user_pfn, int np=
age)
> +int vfio_unpin_pages(struct vfio_device *vdev, unsigned long *user_pfn,
> +		     int npage)
>  {
>  	struct vfio_container *container;
> -	struct vfio_group *group;
>  	struct vfio_iommu_driver *driver;
>  	int ret;
>=20
> -	if (!dev || !user_pfn || !npage)
> +	if (!user_pfn || !npage)
>  		return -EINVAL;
>=20
>  	if (npage > VFIO_PIN_PAGES_MAX_ENTRIES)
>  		return -E2BIG;
>=20
> -	group =3D vfio_group_get_from_dev(dev);
> -	if (!group)
> -		return -ENODEV;
> -
> -	ret =3D vfio_group_add_container_user(group);
> +	ret =3D vfio_group_add_container_user(vdev->group);
>  	if (ret)
> -		goto err_unpin_pages;
> +		return ret;
>=20
> -	container =3D group->container;
> +	container =3D vdev->group->container;
>  	driver =3D container->iommu_driver;
>  	if (likely(driver && driver->ops->unpin_pages))
>  		ret =3D driver->ops->unpin_pages(container->iommu_data,
> user_pfn,
> @@ -2224,10 +2212,8 @@ int vfio_unpin_pages(struct device *dev,
> unsigned long *user_pfn, int npage)
>  	else
>  		ret =3D -ENOTTY;
>=20
> -	vfio_group_try_dissolve_container(group);
> +	vfio_group_try_dissolve_container(vdev->group);
>=20
> -err_unpin_pages:
> -	vfio_group_put(group);
>  	return ret;
>  }
>  EXPORT_SYMBOL(vfio_unpin_pages);
> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> index 748ec0e0293aea..8f2a09801a660b 100644
> --- a/include/linux/vfio.h
> +++ b/include/linux/vfio.h
> @@ -150,9 +150,9 @@ extern long vfio_external_check_extension(struct
> vfio_group *group,
>=20
>  #define VFIO_PIN_PAGES_MAX_ENTRIES	(PAGE_SIZE/sizeof(unsigned
> long))
>=20
> -extern int vfio_pin_pages(struct device *dev, unsigned long *user_pfn,
> +extern int vfio_pin_pages(struct vfio_device *vdev, unsigned long *user_=
pfn,
>  			  int npage, int prot, unsigned long *phys_pfn);
> -extern int vfio_unpin_pages(struct device *dev, unsigned long *user_pfn,
> +extern int vfio_unpin_pages(struct vfio_device *vdev, unsigned long
> *user_pfn,
>  			    int npage);
>=20
>  extern int vfio_group_pin_pages(struct vfio_group *group,
> --
> 2.36.0

