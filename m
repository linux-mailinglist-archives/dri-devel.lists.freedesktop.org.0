Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 812C650AD45
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 03:39:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D542710E9CA;
	Fri, 22 Apr 2022 01:39:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36BB410E516;
 Fri, 22 Apr 2022 01:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650591556; x=1682127556;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LlSeNJZw9K0gs+mSo7Cj6lJNYTXDNTi7/dqz/0pJyqM=;
 b=cw/2LS9BvCgw01tsjs1nSxbJhW9yNSBCoT93snWRTF1KoTOee9dPQ+5n
 2xTQZHcq+tCj1aHAsk0yYFuhYVgdC5vtHRo4X6NgwCGDnQiyZ0S1Mbf8I
 yJlBfYSPpbeu3e6Lb126CKdybcM134CCUMK3vowR+dXfBSw0jQMaOMaS8
 b74BHPPQHqkQ7/rhp0NicL4WqduyTyd5iv92tl0kA65rPBAwYUwpCrVqo
 GnxUsqA3Ap4trsIhRQ0jqmIqAwb4j0X1ki09J2G0OYAOIYxLeeuzobDdv
 yzjdtMPdlKVyLaSKy3jw/dPZGFv1bgQd02m9nq3Lwbdf7cmA+5GOhZj23 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="264703621"
X-IronPort-AV: E=Sophos;i="5.90,280,1643702400"; d="scan'208";a="264703621"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 18:39:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,280,1643702400"; d="scan'208";a="511356189"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 21 Apr 2022 18:39:14 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 21 Apr 2022 18:39:13 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 21 Apr 2022 18:39:13 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 21 Apr 2022 18:39:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nx0zEByFV3tlDTYZ1DslV3DKhCWV6MI/hR2DTU28xyxmEwZGoSCcePlJyclJ7LU5g7YTEViDCZyGA6GfaVD9ArEFWnLhJXF67tnFMYb+dcH0M5PV6TDV425V2cuMD/YQAHylacWvpaByFJv8U8JOJo2y9YsxRhlNwZimKZCqIzDJ29g10LM7Mq76QYTkmgtA+pic2ndjfJdQovu8B1uUR70q/QuALUzGFKFdM2VESN+sF9Y7CDjX7Z6x3Z8JdzrQcaakYfI2poor4Mf2+CxTZAW5EFHxcS1K3awse5NH+y1L153N1Ha6WkdC2HB8XH8icMAv0A+a4tsqbh0tsX/7ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kddw+Fu+YsDqf7Sb/ou1bxbSz4o19BA1/4PC7EVr14I=;
 b=QjHBaYp+IjdJ7/AP5Aatq8Sm6TuTn04K6Ekx9PoPEGrjwDjJS/DG6ljisDJth1jpCT4uce6A7p03Bsz62qGktx20nrPQk1cgWmlz8wYak49qW6E3gzNBhdwaIieD+eCeHn7k/5D+eBMr5p2gK5Sd4nWLhSwr5In05MmIKtj13q8+BGD3TFQ0kHn/ZdDXz+85Znwnpqgbxi3VWB7BqdoT5mvkwp/cCSx0Ndi+mEzjAFXaMnjmQHBvPZd4P/EjHPnuEA2aDMemYtEWMiCiSrTw5SL4qmvZLDWXOZTwG0kWOUhYpvltCG9PQNG/vY6tHIpE7o3BPe4Q9utQGLtQYWD5xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by PH0PR11MB5093.namprd11.prod.outlook.com (2603:10b6:510:3e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Fri, 22 Apr
 2022 01:39:10 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::24dd:37c2:3778:1adb]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::24dd:37c2:3778:1adb%2]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 01:39:10 +0000
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
Subject: RE: [PATCH v2 1/7] vfio: Make vfio_(un)register_notifier accept a
 vfio_device
Thread-Topic: [PATCH v2 1/7] vfio: Make vfio_(un)register_notifier accept a
 vfio_device
Thread-Index: AQHYVZz2Cke44OBD9UOI6FhokQW4CKz7J+BA
Date: Fri, 22 Apr 2022 01:39:09 +0000
Message-ID: <BN9PR11MB52761D81DA24CD00E0FFA7728CF79@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
 <1-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
In-Reply-To: <1-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8d853ae9-22c4-4d8f-c9ce-08da2400e5cd
x-ms-traffictypediagnostic: PH0PR11MB5093:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <PH0PR11MB5093086AF4D8ED18D90397A68CF79@PH0PR11MB5093.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: m/eJofcHIRn3h9ZLAO+8yCS+QEa2mWqWYNPp1fY1RiMQ28SrNPs8C/W+0g17HGOX5Hy+svJv21As6218Kcw5tzW854Sq+gNSmJ/g3F8cpe2gp8L9TiWF7bkANCa1cFbOdShjDL7ynFtFimpZV8M6ibrajfaV6gpPrUXwi/M4iATz7ZZS8/FLItS8LOUnUmvrqBqcDsTV7PZTayGobGG8IIVL8ZoH/Fucm5JjlTH5i2dB4iv/gxFYeqopyVfEd4HOzcZe5Gm8Qvz90xUrh3YBK0SZn/aohf1AE6FvK6VAYtwyXPjFHlZMQGQn/xNyU60erK4KkxXi2CbnYPXmvIYfN0+ABOrz36ZlNsrZoK2D00CQdsNw4tW6u/T0hOvuXDwGKwZZWLrZH8fXemU3/k/yvA/kx3D5doSj0rvxw8/A8vbjsIKw9uZjR3eqzr27kACvcRX/SaReqdnTEGxJrN6twHwX05aEpEB919m8QUzv1U07eVmrgH5QmCxtRWcJZP8EhOdaLYb2kG0ggyJ9wsiPzx1ta9G341E+zybdseDgzimxZHQ+aBLdhTBTXY/bQM5kI6bEvCRH/NDEtwtWv+xkYMkNhbnCnSSUo+LGM2PxNLqclyvNmvpK8eIgOGFS5hm6WrpBVZlJ4w5MeDVyzXdjkzyY6SfHqD7vALzbqxGYc2lvLeXQJK3HAXsLXm/7per+Ma9D9ki/SPBHLWO6PxW5u7V4uhUcLzn9TI2v2v13eng=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(86362001)(508600001)(66446008)(66476007)(66946007)(76116006)(6636002)(64756008)(66556008)(4326008)(8676002)(54906003)(110136005)(316002)(71200400001)(38070700005)(5660300002)(38100700002)(6506007)(7416002)(7406005)(52536014)(7696005)(8936002)(26005)(9686003)(83380400001)(55016003)(921005)(82960400001)(122000001)(33656002)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?W66AdAphoMzDy27Ku9L1isYvIIFqej/6eMU9hXu4b5yLqTdZnMHToGXdJSo5?=
 =?us-ascii?Q?40cCA9wydAIt7QOu+aUfs8mV9/3sPeO5Wn2sDyk3wKymGPpCyCdhVhDsl8NM?=
 =?us-ascii?Q?OVVkYJFjqqAIwv6i7uaoegCjbevzo3SyQQErgP4dBGZwxQoZK+diZ5Y0ntO1?=
 =?us-ascii?Q?1jvpgCc1PwPflMpaeFia/z5v/+wG3EGYnvPvYqrwrnYstasr51KRldSvksHB?=
 =?us-ascii?Q?9o7GjM/6w/bWVVkBid7awMVerxs6l7p6+16WV0bjEXk9cnR/tfIWdKtq7N2Q?=
 =?us-ascii?Q?zC0ZTMbZo8a+euYV24tufBiqWFrbLBgU/vRY6iR9LFnHqJ8QVtnCakUCIYaI?=
 =?us-ascii?Q?MK6tScO22MKcD9TW7kdFRIo5DHQ3nbFo1yD5ay6hV4GpHJn95O7Q04Jgdobr?=
 =?us-ascii?Q?gzOs25KN1ifC7HIGQl3JdU300KM+lhzJChQFcpwS/qSNCSOPQghUfZVvQPPP?=
 =?us-ascii?Q?NdBZcLcyKn/++88AWk9RFP2vqcc1xUuqs6Ofx1yCvSLei26evy5LzMi/8nm7?=
 =?us-ascii?Q?4WXM4086vFf/eyDRTDgISLeEY+D6VafEgjxTdAoEoepIcSxyq4CFgi3RMcZ/?=
 =?us-ascii?Q?ORfAYVVqnV1KpfJp3nGCwFZsZC3LAQolD4ZlNncLf9H0nzs/epntUwjw5Y80?=
 =?us-ascii?Q?IY83Kkpyxp8b65O5cbfn7/Ognk4wVB4U7sbl7dDoTcCtOjDlCyYeRZNs2vr7?=
 =?us-ascii?Q?E+VjgawIHVhsiha3gR0BB9Zz2mi+roFZevLqzyG0oIaSLKS6RjECJ7eYHB6B?=
 =?us-ascii?Q?83HjoPnttXuKuq1ed9E+bCfYCIm8S2ZyuqD/jDPSQfDWz5FR8fj+jlFosb37?=
 =?us-ascii?Q?WBXX0YofK8Oucga2x+IMCxPY3nFRNrxvDLk5QsS6kTBMb/JWeSQY96B5sVYN?=
 =?us-ascii?Q?4+vzJhdlEJIaylo6A7Rke+f179M6lgbc8IyihG0We2na46kHsjFvb/FCs08h?=
 =?us-ascii?Q?fOcUfJeuRi+tfobtWXr0+Rh6VNHEhgU5rNuvE9AcuEs6ke50tnAQbDJHms/U?=
 =?us-ascii?Q?Vkrexc5Yd+txvF7l6jJceh2r15+RThtkWrSRQQjzL8L1xMLiYsx45/wk5BKS?=
 =?us-ascii?Q?+nB7IT4BRHj7PmF3/LU/0CSMGll0ah55U7OnA5hp3Vwj7Uxc86LEKABwm9v0?=
 =?us-ascii?Q?XymaY1Pa38Skdwq08wuqoPEa0SL2oz3cRrEPH8CpkHIvCSbMQEdbnJLLqpzI?=
 =?us-ascii?Q?wuwZQddezgELeU96FB8t71i+j3tm2GZ3Ha4LDqcIKJEK7pb+E4/z5BGw55nd?=
 =?us-ascii?Q?4LNMXKFmf7caCXKNUyyREm3JeBeue/BV1xR5D6RWe26n07sALdYrb8SvG/c/?=
 =?us-ascii?Q?JwQfTths1gdsyYtAYvQmepaR24iPFdjG6gY2gOfMH2o8ixVaVL4BGb6FdAwi?=
 =?us-ascii?Q?0wVbdRhcxEjCqqgGGq6QYhpDJEC+Fdl3tm0u5SaSKczaczyyUtEK3bv8Ua20?=
 =?us-ascii?Q?tXuD8fs7ql4VCfeHRDZc3lixFybYMI0fqM7s8h/2tUcKPuPpGlUqVNpHOVwU?=
 =?us-ascii?Q?QC0ctK1caYvbbM5wU8mIrMBoW3ukyYkO/takca8X5xYiuCtEHVri93ACtofm?=
 =?us-ascii?Q?8zM843wWEB0dz8kSZM8afNxVwcFTgT6CIn5bfDbotQjc117FwDGUwEzmB2ox?=
 =?us-ascii?Q?NjH05wkikkPRJDFPbwgYEF9f9Q0Gsegp7825MRMeIjll2tBPYRhA0K1gVCVK?=
 =?us-ascii?Q?pXMLjVr/iTybETLcbLzyXmWNZNg43SZtQH62Zs06zHrYl4z14LE7Zs3FAerM?=
 =?us-ascii?Q?3+FFQ0Sv2g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d853ae9-22c4-4d8f-c9ce-08da2400e5cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2022 01:39:09.9946 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nMj66Julz1N+aGk4MAdind55RkbRKqXl+aNkKtD1xAp8IBEZEbMrc/sh/KyrbvNiCOJ5xY5Pj9z3gT1rPipz2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5093
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

> From: Jason Gunthorpe
> Sent: Friday, April 22, 2022 12:29 AM
>=20
> All callers have a struct vfio_device trivially available, pass it in
> directly and avoid calling the expensive vfio_group_get_from_dev().
>=20
> To support the unconverted kvmgt mdev driver add
> mdev_legacy_get_vfio_device() which will return the vfio_device pointer
> vfio_mdev.c puts in the drv_data.

stale comment

>=20
> Acked-by: Eric Farman <farman@linux.ibm.com>
> Reviewed-by: Jason J. Herne <jjherne@linux.ibm.com>
> Reviewed-by: Tony Krowiak <akrowiak@linux.ibm.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

> ---
>  drivers/gpu/drm/i915/gvt/kvmgt.c  | 24 ++++++++++++------------
>  drivers/s390/cio/vfio_ccw_ops.c   |  7 +++----
>  drivers/s390/crypto/vfio_ap_ops.c | 14 +++++++-------
>  drivers/vfio/vfio.c               | 25 +++++++------------------
>  include/linux/vfio.h              |  4 ++--
>  5 files changed, 31 insertions(+), 43 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c
> b/drivers/gpu/drm/i915/gvt/kvmgt.c
> index 0787ba5c301f5e..1cec4f1fdfaced 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -810,8 +810,8 @@ static int intel_vgpu_open_device(struct vfio_device
> *vfio_dev)
>  	vgpu->group_notifier.notifier_call =3D intel_vgpu_group_notifier;
>=20
>  	events =3D VFIO_IOMMU_NOTIFY_DMA_UNMAP;
> -	ret =3D vfio_register_notifier(vfio_dev->dev, VFIO_IOMMU_NOTIFY,
> &events,
> -				&vgpu->iommu_notifier);
> +	ret =3D vfio_register_notifier(vfio_dev, VFIO_IOMMU_NOTIFY, &events,
> +				     &vgpu->iommu_notifier);
>  	if (ret !=3D 0) {
>  		gvt_vgpu_err("vfio_register_notifier for iommu failed: %d\n",
>  			ret);
> @@ -819,8 +819,8 @@ static int intel_vgpu_open_device(struct vfio_device
> *vfio_dev)
>  	}
>=20
>  	events =3D VFIO_GROUP_NOTIFY_SET_KVM;
> -	ret =3D vfio_register_notifier(vfio_dev->dev, VFIO_GROUP_NOTIFY,
> &events,
> -				&vgpu->group_notifier);
> +	ret =3D vfio_register_notifier(vfio_dev, VFIO_GROUP_NOTIFY, &events,
> +				     &vgpu->group_notifier);
>  	if (ret !=3D 0) {
>  		gvt_vgpu_err("vfio_register_notifier for group failed: %d\n",
>  			ret);
> @@ -873,12 +873,12 @@ static int intel_vgpu_open_device(struct
> vfio_device *vfio_dev)
>  	vgpu->vfio_group =3D NULL;
>=20
>  undo_register:
> -	vfio_unregister_notifier(vfio_dev->dev, VFIO_GROUP_NOTIFY,
> -					&vgpu->group_notifier);
> +	vfio_unregister_notifier(vfio_dev, VFIO_GROUP_NOTIFY,
> +				 &vgpu->group_notifier);
>=20
>  undo_iommu:
> -	vfio_unregister_notifier(vfio_dev->dev, VFIO_IOMMU_NOTIFY,
> -					&vgpu->iommu_notifier);
> +	vfio_unregister_notifier(vfio_dev, VFIO_IOMMU_NOTIFY,
> +				 &vgpu->iommu_notifier);
>  out:
>  	return ret;
>  }
> @@ -907,13 +907,13 @@ static void __intel_vgpu_release(struct intel_vgpu
> *vgpu)
>=20
>  	intel_gvt_release_vgpu(vgpu);
>=20
> -	ret =3D vfio_unregister_notifier(vgpu->vfio_device.dev,
> VFIO_IOMMU_NOTIFY,
> -					&vgpu->iommu_notifier);
> +	ret =3D vfio_unregister_notifier(&vgpu->vfio_device,
> VFIO_IOMMU_NOTIFY,
> +				       &vgpu->iommu_notifier);
>  	drm_WARN(&i915->drm, ret,
>  		 "vfio_unregister_notifier for iommu failed: %d\n", ret);
>=20
> -	ret =3D vfio_unregister_notifier(vgpu->vfio_device.dev,
> VFIO_GROUP_NOTIFY,
> -					&vgpu->group_notifier);
> +	ret =3D vfio_unregister_notifier(&vgpu->vfio_device,
> VFIO_GROUP_NOTIFY,
> +				       &vgpu->group_notifier);
>  	drm_WARN(&i915->drm, ret,
>  		 "vfio_unregister_notifier for group failed: %d\n", ret);
>=20
> diff --git a/drivers/s390/cio/vfio_ccw_ops.c
> b/drivers/s390/cio/vfio_ccw_ops.c
> index c4d60cdbf247bf..b49e2e9db2dc6f 100644
> --- a/drivers/s390/cio/vfio_ccw_ops.c
> +++ b/drivers/s390/cio/vfio_ccw_ops.c
> @@ -183,7 +183,7 @@ static int vfio_ccw_mdev_open_device(struct
> vfio_device *vdev)
>=20
>  	private->nb.notifier_call =3D vfio_ccw_mdev_notifier;
>=20
> -	ret =3D vfio_register_notifier(vdev->dev, VFIO_IOMMU_NOTIFY,
> +	ret =3D vfio_register_notifier(vdev, VFIO_IOMMU_NOTIFY,
>  				     &events, &private->nb);
>  	if (ret)
>  		return ret;
> @@ -204,8 +204,7 @@ static int vfio_ccw_mdev_open_device(struct
> vfio_device *vdev)
>=20
>  out_unregister:
>  	vfio_ccw_unregister_dev_regions(private);
> -	vfio_unregister_notifier(vdev->dev, VFIO_IOMMU_NOTIFY,
> -				 &private->nb);
> +	vfio_unregister_notifier(vdev, VFIO_IOMMU_NOTIFY, &private->nb);
>  	return ret;
>  }
>=20
> @@ -223,7 +222,7 @@ static void vfio_ccw_mdev_close_device(struct
> vfio_device *vdev)
>=20
>  	cp_free(&private->cp);
>  	vfio_ccw_unregister_dev_regions(private);
> -	vfio_unregister_notifier(vdev->dev, VFIO_IOMMU_NOTIFY, &private-
> >nb);
> +	vfio_unregister_notifier(vdev, VFIO_IOMMU_NOTIFY, &private->nb);
>  }
>=20
>  static ssize_t vfio_ccw_mdev_read_io_region(struct vfio_ccw_private
> *private,
> diff --git a/drivers/s390/crypto/vfio_ap_ops.c
> b/drivers/s390/crypto/vfio_ap_ops.c
> index ee0a3bf8f476ca..bfa7ee6ef532d9 100644
> --- a/drivers/s390/crypto/vfio_ap_ops.c
> +++ b/drivers/s390/crypto/vfio_ap_ops.c
> @@ -1406,21 +1406,21 @@ static int vfio_ap_mdev_open_device(struct
> vfio_device *vdev)
>  	matrix_mdev->group_notifier.notifier_call =3D
> vfio_ap_mdev_group_notifier;
>  	events =3D VFIO_GROUP_NOTIFY_SET_KVM;
>=20
> -	ret =3D vfio_register_notifier(vdev->dev, VFIO_GROUP_NOTIFY,
> -				     &events, &matrix_mdev->group_notifier);
> +	ret =3D vfio_register_notifier(vdev, VFIO_GROUP_NOTIFY, &events,
> +				     &matrix_mdev->group_notifier);
>  	if (ret)
>  		return ret;
>=20
>  	matrix_mdev->iommu_notifier.notifier_call =3D
> vfio_ap_mdev_iommu_notifier;
>  	events =3D VFIO_IOMMU_NOTIFY_DMA_UNMAP;
> -	ret =3D vfio_register_notifier(vdev->dev, VFIO_IOMMU_NOTIFY,
> -				     &events, &matrix_mdev->iommu_notifier);
> +	ret =3D vfio_register_notifier(vdev, VFIO_IOMMU_NOTIFY, &events,
> +				     &matrix_mdev->iommu_notifier);
>  	if (ret)
>  		goto out_unregister_group;
>  	return 0;
>=20
>  out_unregister_group:
> -	vfio_unregister_notifier(vdev->dev, VFIO_GROUP_NOTIFY,
> +	vfio_unregister_notifier(vdev, VFIO_GROUP_NOTIFY,
>  				 &matrix_mdev->group_notifier);
>  	return ret;
>  }
> @@ -1430,9 +1430,9 @@ static void vfio_ap_mdev_close_device(struct
> vfio_device *vdev)
>  	struct ap_matrix_mdev *matrix_mdev =3D
>  		container_of(vdev, struct ap_matrix_mdev, vdev);
>=20
> -	vfio_unregister_notifier(vdev->dev, VFIO_IOMMU_NOTIFY,
> +	vfio_unregister_notifier(vdev, VFIO_IOMMU_NOTIFY,
>  				 &matrix_mdev->iommu_notifier);
> -	vfio_unregister_notifier(vdev->dev, VFIO_GROUP_NOTIFY,
> +	vfio_unregister_notifier(vdev, VFIO_GROUP_NOTIFY,
>  				 &matrix_mdev->group_notifier);
>  	vfio_ap_mdev_unset_kvm(matrix_mdev);
>  }
> diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
> index a4555014bd1e72..8a5c46aa2bef61 100644
> --- a/drivers/vfio/vfio.c
> +++ b/drivers/vfio/vfio.c
> @@ -2484,19 +2484,15 @@ static int vfio_unregister_group_notifier(struct
> vfio_group *group,
>  	return ret;
>  }
>=20
> -int vfio_register_notifier(struct device *dev, enum vfio_notify_type typ=
e,
> +int vfio_register_notifier(struct vfio_device *dev, enum vfio_notify_typ=
e
> type,
>  			   unsigned long *events, struct notifier_block *nb)
>  {
> -	struct vfio_group *group;
> +	struct vfio_group *group =3D dev->group;
>  	int ret;
>=20
> -	if (!dev || !nb || !events || (*events =3D=3D 0))
> +	if (!nb || !events || (*events =3D=3D 0))
>  		return -EINVAL;
>=20
> -	group =3D vfio_group_get_from_dev(dev);
> -	if (!group)
> -		return -ENODEV;
> -
>  	switch (type) {
>  	case VFIO_IOMMU_NOTIFY:
>  		ret =3D vfio_register_iommu_notifier(group, events, nb);
> @@ -2507,25 +2503,20 @@ int vfio_register_notifier(struct device *dev,
> enum vfio_notify_type type,
>  	default:
>  		ret =3D -EINVAL;
>  	}
> -
> -	vfio_group_put(group);
>  	return ret;
>  }
>  EXPORT_SYMBOL(vfio_register_notifier);
>=20
> -int vfio_unregister_notifier(struct device *dev, enum vfio_notify_type t=
ype,
> +int vfio_unregister_notifier(struct vfio_device *dev,
> +			     enum vfio_notify_type type,
>  			     struct notifier_block *nb)
>  {
> -	struct vfio_group *group;
> +	struct vfio_group *group =3D dev->group;
>  	int ret;
>=20
> -	if (!dev || !nb)
> +	if (!nb)
>  		return -EINVAL;
>=20
> -	group =3D vfio_group_get_from_dev(dev);
> -	if (!group)
> -		return -ENODEV;
> -
>  	switch (type) {
>  	case VFIO_IOMMU_NOTIFY:
>  		ret =3D vfio_unregister_iommu_notifier(group, nb);
> @@ -2536,8 +2527,6 @@ int vfio_unregister_notifier(struct device *dev,
> enum vfio_notify_type type,
>  	default:
>  		ret =3D -EINVAL;
>  	}
> -
> -	vfio_group_put(group);
>  	return ret;
>  }
>  EXPORT_SYMBOL(vfio_unregister_notifier);
> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> index 66dda06ec42d1b..748ec0e0293aea 100644
> --- a/include/linux/vfio.h
> +++ b/include/linux/vfio.h
> @@ -178,11 +178,11 @@ enum vfio_notify_type {
>  /* events for VFIO_GROUP_NOTIFY */
>  #define VFIO_GROUP_NOTIFY_SET_KVM	BIT(0)
>=20
> -extern int vfio_register_notifier(struct device *dev,
> +extern int vfio_register_notifier(struct vfio_device *dev,
>  				  enum vfio_notify_type type,
>  				  unsigned long *required_events,
>  				  struct notifier_block *nb);
> -extern int vfio_unregister_notifier(struct device *dev,
> +extern int vfio_unregister_notifier(struct vfio_device *dev,
>  				    enum vfio_notify_type type,
>  				    struct notifier_block *nb);
>=20
> --
> 2.36.0

