Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A85A750AD70
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 03:52:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F22FA10F49A;
	Fri, 22 Apr 2022 01:52:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF95310F49A;
 Fri, 22 Apr 2022 01:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650592351; x=1682128351;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BveQQgbxbshzPPIgMB9mepIh0/PiURp0U0kdYU8Tkl4=;
 b=NSLvRQ7DL9H4Xpvz167Uj61SqpRvbgKDz9Mm49VVrVkRgUFu0rEeKID+
 dZ9NwkbaJUYDjK+BjZaBByMay63FWStD4voXXF6WPSCdxCjnAxOhrjooX
 D3rwQUy/YGkmYuujTW85nngZWdUhoaWOfUjhpS6SAexyT9dZlYWWDWg9K
 4EJXpPvv2S3ZZ7QKbEyLc3wvdXqFBMqB1ioCSNR7wjdmmZD9lPkVPKjH8
 9rjD3hm/jVab9OovNEXg0Pw27GOGAIGygQ8TbsCKSOAyaJjQ4w9I0/UnL
 FSWIDrbQVUS4Ks3tLoUhRhGV0atBbRRSPsHaMReEsL+n8klKAOntO6PMD w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="289656518"
X-IronPort-AV: E=Sophos;i="5.90,280,1643702400"; d="scan'208";a="289656518"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 18:52:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,280,1643702400"; d="scan'208";a="658787759"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga002.fm.intel.com with ESMTP; 21 Apr 2022 18:52:30 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 21 Apr 2022 18:52:30 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 21 Apr 2022 18:52:29 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 21 Apr 2022 18:52:29 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 21 Apr 2022 18:52:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GjkMLFO+/CZD5wfbevwTyUx1vwUVRl+77zLmNEgli0vMU+f4BoPr/IwmLm/3VfTRdSbGIF03UqsfIOft7l2PxzgquODvpdhJqpj0ZmTLDXlj+1gruSYEoHaBzKSwFTA2UFhUMWLBOpeX6nE2cslRR7jrSMpkpqq0Z5WkwZ3pj1OfKJoNhNqsVzP+YAhpQTKH4/fyhz62M/WacZ2h8gAKjhl17CwvI5RGHJY0IWJJcArr1MJFkQlZHx3HFC1gOTHk23gXyirTm+JQSx/9+uO9bpmEnSbQk599xomPaZ1/pEslrELfOT5TqdZhSYuTvfxB79UQ7MmPy+3+7uqezn7LIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jqf475DFLymnJss8/mqEwtLkFNBlohTERP/nEFMIrtU=;
 b=ZcGTYuWZDJf3aDQLop+uqMhBKWwCfJ66voYRCq1HA/MKCwpvjJ2cM98ZPpWpy8RktvMmg5Uf3JdmrcaoIS8cs2WkVvZDEVp/S26ahivzuOo3sDywIc98QkBKDNaperPNPCl9PYjTjNTds8d/Xol9CG46AP1ahmM67HkcnYtcB/rSFVQL+9gSR6MKRv1ThgE4qGmmUX4ncyPB/CEm2ULME3YICfLGMPsV0QsWdO5U/75lv4SMtXx9i+Z0AX6hBWAeiTsYE6uRuICG8Mrvon7ltJ+CskcwmXfRIcD4Qky9m1KimDNh0YunqDJyIJEGWTBXm5UjgLdxWm+Th/+1LB2kSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BN7PR11MB2548.namprd11.prod.outlook.com (2603:10b6:406:b3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Fri, 22 Apr
 2022 01:52:26 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::24dd:37c2:3778:1adb]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::24dd:37c2:3778:1adb%2]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 01:52:26 +0000
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
Subject: RE: [PATCH v2 6/7] vfio: Remove dead code
Thread-Topic: [PATCH v2 6/7] vfio: Remove dead code
Thread-Index: AQHYVZzrgxj4mjqhm0uSSdjJDCELnKz7K+OA
Date: Fri, 22 Apr 2022 01:52:26 +0000
Message-ID: <BN9PR11MB52765E9DD81E7E8C46212CF08CF79@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
 <6-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
In-Reply-To: <6-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cb2f941f-5a4f-48b1-cc77-08da2402c084
x-ms-traffictypediagnostic: BN7PR11MB2548:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN7PR11MB25484E76F1E7EBD1A66A38C68CF79@BN7PR11MB2548.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4O4OYS0BrJFwwUZGZrlc97dLF0/U+DUUyn+9qZbMrlkLhihHesjyivOm0CSg+mobpRX94VmMFhHeY+RwhV/kt0wXmGS4Ns0aKVMnjmYVXRcZpbhhsMx4Vl7gIBh6guRIQFQ6X0SjCEShYv7eM5Y/jmmshVhRMm/USpwSoweuKNdqXwAgmoqxALa0i5bvqMIcFVUm5eOFlsGfAFYHcdlVogqe7hDcM/flkuP6NPISkvTkrMnjKUAR4HKLk6R/7ydlcwPFyMk2J2TvxjIVc6ABnU00ZN58L87RQcTKTz67xZ0edxYBbSHX5nwQ2TRig90+SS58I9RoSBfukxqsn79gf/dWSgPmohycgSKhZWUPx6fi0b1VzsOdq221eAPkxUFAN2Yjct5CHmUiEDffICyM5tH2uUGJL/xSVTkMGkzG2SKg3HLaih9nIV/Yrbr18IvghW+3n96AvQlyXJqu411+4jKDWuFaodlBViLAAzibis0n2mbKCO4GTEcsdieLhpK+LQDlgl4nvfeJiYF065EYsEhfPDE3Eps7QNoJzVwCgxl09zMVP60ev47Ep2fxvd879DnnDLNqV7htzkddJz15nOZEt3csV8V5+m3JfFUi+p8dlrPjXf9c2I2seuaF7Bi5sO0KnDIFF5Z38txdZva2Y+Lj2YDZL+Uazaqmg+B+yDbsdX1FyC+VcMGbDtKHga9LQ5ns0nfxZsv0O+Q7MSC/qU6Bkt/kSZlEWGJMWr//RE0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(7696005)(9686003)(110136005)(26005)(186003)(71200400001)(6506007)(54906003)(6636002)(55016003)(33656002)(508600001)(316002)(38100700002)(66946007)(7406005)(7416002)(5660300002)(52536014)(86362001)(2906002)(64756008)(82960400001)(38070700005)(921005)(66446008)(83380400001)(122000001)(4326008)(66476007)(8936002)(76116006)(66556008)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DYYtNXoBsIL3NwHTy2HKQUqJXN9YcEP2KgL3pMhqzhAfp1FHjgiEL8SVn3ft?=
 =?us-ascii?Q?vujwLwQzH0fTn7QR/EnSN7wkIT2wCoGokSC0IyNtk+2eY96AnzcYYhIzYln0?=
 =?us-ascii?Q?FH59xsn+7mznAAfVEELo6lGaKFlXwcT+Co+4yXF5ugvSOf6sWnTZRzccuSxP?=
 =?us-ascii?Q?iFnGKx1aAt8bu0NcKVSS+xkiROyYyZPB9pFZ+f2tDJUR9OwY9b2V/hoSC7W+?=
 =?us-ascii?Q?3XhPWIayaTvg5cE/qurUEmjpdgPugpkaZoRJjxvdz2W2jZOvBFg6edsPf/ZC?=
 =?us-ascii?Q?Bdr9qDvd0RqIJXSktaP/W0CnTELunzB/nzd7J1I+ZXGx8zcgZ1I1PIhvRwX+?=
 =?us-ascii?Q?yJKFwlkmZPWa0TDhW/fhqh9uAFFOUN4onLFUzm/lUY/8/P0HsrD9zRn5E/Et?=
 =?us-ascii?Q?I85gvmE9y+LuKxQuOhm4aFsCxIoONuxghOBQVSNIsbd9tR8d7osUfRXvzRmH?=
 =?us-ascii?Q?0cJinMy4yvh7AI5PrNL0ovReNOwQb9rz6oZk+I9STWF+da5lUCNTgS/CZXb0?=
 =?us-ascii?Q?5PRTSKhaTk9CHBXixQTm1eue8yeHcEEsE76MWUjgzI5Rui4xTyFsRgDoR5a0?=
 =?us-ascii?Q?g0ljT+h80DCgrvIhMlSf55tc2rIY7uXEx/oITywDPo+PQ1ie7Ra0c5hdEHnH?=
 =?us-ascii?Q?GnC8GegI4NA61CS7uFS/G4f6dW8qVHGlGMjqmoxoeEJFLENhK3Yp4m8g5ll9?=
 =?us-ascii?Q?IANkBAO02lbRrnwLTvQum0PrUmz8Nk8ghdGa6R7fTxQgFMyRgwNjamgavNsy?=
 =?us-ascii?Q?F4PiQfG0Gj+ySpUI1df6eCVDhW0UL8ltUDp2XzJTP98AiK0HRPCp5UtoNag1?=
 =?us-ascii?Q?8fA6mUm8FcKhTDoyOLwXx25Ee146rinzEK7ZuupboWisjHGDmye7S0Dw7VcL?=
 =?us-ascii?Q?eZfIv+Y2wqqqfpMejs/Lc0krtcjUNditKqZeetUY1pKAvvvII4QVtPvofpjj?=
 =?us-ascii?Q?wumU4KkUmP7ruB/Q+HewR/d86Vco72WTIc90zV91l8mFQ7a9JkpGHfGVGXaf?=
 =?us-ascii?Q?kW2DRjUOGL3I01tbLnQTubVUueEJwVUl6KGBhUVlwt//wq1Fq9EhbsCkqVOj?=
 =?us-ascii?Q?wNTl3Fbb2xlUWIXuY0LLV1xh+hXXcVz4x+NbokxGhTXijXfDMRKsuinhpLLl?=
 =?us-ascii?Q?0y72NoQqX/ONbbIG9X867pwEE3ht5L+oickARKMrX0UHAOOFCNTj/FV2FxGZ?=
 =?us-ascii?Q?C01aACDWwdce2sy4OGFhDDDnZKsih2T1aUzMAqMMHqU+al/b4lo2LUmK4dfr?=
 =?us-ascii?Q?mQpYywC4jXh7zoBNCDz1XuSNUAhLCHbAp44kR7SGA18+OPQ0VD68xq1AGCW5?=
 =?us-ascii?Q?vNIqywAFkWVmoY49NXPL/XsRoTv6fMiQRFbpOCBa9trUMcMBLa6QJDNfDjWd?=
 =?us-ascii?Q?WRR4Md/yhiBcqBWKX8fWZMnzM8i9AKPeanYrmBNSDhGDc5wm7BTOz2fNmdVD?=
 =?us-ascii?Q?EjBVgvOalsS/VbJgCxZely58+VmQpXiiYTPdauAi++4YV6++vszecTc0aRC8?=
 =?us-ascii?Q?LlbiYRJSKzUQkykO62WtGK+tvkqyK2h0uwcKnaSGT97Vn6dM6Xrli7mKN/+X?=
 =?us-ascii?Q?GrHn0LjN6ISAp36WzSt6kAKwuAlQdrLpoGtdb/HojBYNVwLDed3CA2UPQtkM?=
 =?us-ascii?Q?uquRXpPxCAKKBpe1br0H6/oB9K1ZP7WEWwgv5Hl0nnYOC0kUHL99blE3P07H?=
 =?us-ascii?Q?ljbCXOIhlf9Fm8V/kfg7v+45PfCb4vc0yVPegMHrcxZsdfRou/h0mAvrsbz4?=
 =?us-ascii?Q?YKohpZXQWA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb2f941f-5a4f-48b1-cc77-08da2402c084
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2022 01:52:26.4653 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KxfHnNeGLusT98QZQHq6PMi1IG72/Qy2sgcBfacljfAC/pta5KPZ2QhbkWPU6bM4jJslvffjrE9hOnRfWngf4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2548
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
> Now that callers have been updated to use the vfio_device APIs the driver
> facing group interface is no longer used, delete it:
>=20
> - vfio_group_get_external_user_from_dev()
> - vfio_group_pin_pages()
> - vfio_group_unpin_pages()
> - vfio_group_iommu_domain()
>=20
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

> ---
>  drivers/vfio/vfio.c  | 151 -------------------------------------------
>  include/linux/vfio.h |  11 ----
>  2 files changed, 162 deletions(-)
>=20
> vfio_group_put_external_user() is removable too when combined with the
> KVM series
>=20
> diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
> index d10d20d393b706..ba6fae95555ec7 100644
> --- a/drivers/vfio/vfio.c
> +++ b/drivers/vfio/vfio.c
> @@ -1947,44 +1947,6 @@ struct vfio_group
> *vfio_group_get_external_user(struct file *filep)
>  }
>  EXPORT_SYMBOL_GPL(vfio_group_get_external_user);
>=20
> -/*
> - * External user API, exported by symbols to be linked dynamically.
> - * The external user passes in a device pointer
> - * to verify that:
> - *	- A VFIO group is assiciated with the device;
> - *	- IOMMU is set for the group.
> - * If both checks passed, vfio_group_get_external_user_from_dev()
> - * increments the container user counter to prevent the VFIO group
> - * from disposal before external user exits and returns the pointer
> - * to the VFIO group.
> - *
> - * When the external user finishes using the VFIO group, it calls
> - * vfio_group_put_external_user() to release the VFIO group and
> - * decrement the container user counter.
> - *
> - * @dev [in]	: device
> - * Return error PTR or pointer to VFIO group.
> - */
> -
> -struct vfio_group *vfio_group_get_external_user_from_dev(struct device
> *dev)
> -{
> -	struct vfio_group *group;
> -	int ret;
> -
> -	group =3D vfio_group_get_from_dev(dev);
> -	if (!group)
> -		return ERR_PTR(-ENODEV);
> -
> -	ret =3D vfio_group_add_container_user(group);
> -	if (ret) {
> -		vfio_group_put(group);
> -		return ERR_PTR(ret);
> -	}
> -
> -	return group;
> -}
> -EXPORT_SYMBOL_GPL(vfio_group_get_external_user_from_dev);
> -
>  void vfio_group_put_external_user(struct vfio_group *group)
>  {
>  	vfio_group_try_dissolve_container(group);
> @@ -2218,101 +2180,6 @@ int vfio_unpin_pages(struct vfio_device *vdev,
> unsigned long *user_pfn,
>  }
>  EXPORT_SYMBOL(vfio_unpin_pages);
>=20
> -/*
> - * Pin a set of guest IOVA PFNs and return their associated host PFNs fo=
r a
> - * VFIO group.
> - *
> - * The caller needs to call vfio_group_get_external_user() or
> - * vfio_group_get_external_user_from_dev() prior to calling this interfa=
ce,
> - * so as to prevent the VFIO group from disposal in the middle of the ca=
ll.
> - * But it can keep the reference to the VFIO group for several calls int=
o
> - * this interface.
> - * After finishing using of the VFIO group, the caller needs to release =
the
> - * VFIO group by calling vfio_group_put_external_user().
> - *
> - * @group [in]		: VFIO group
> - * @user_iova_pfn [in]	: array of user/guest IOVA PFNs to be pinned.
> - * @npage [in]		: count of elements in user_iova_pfn array.
> - *			  This count should not be greater
> - *			  VFIO_PIN_PAGES_MAX_ENTRIES.
> - * @prot [in]		: protection flags
> - * @phys_pfn [out]	: array of host PFNs
> - * Return error or number of pages pinned.
> - */
> -int vfio_group_pin_pages(struct vfio_group *group,
> -			 unsigned long *user_iova_pfn, int npage,
> -			 int prot, unsigned long *phys_pfn)
> -{
> -	struct vfio_container *container;
> -	struct vfio_iommu_driver *driver;
> -	int ret;
> -
> -	if (!group || !user_iova_pfn || !phys_pfn || !npage)
> -		return -EINVAL;
> -
> -	if (group->dev_counter > 1)
> -		return -EINVAL;
> -
> -	if (npage > VFIO_PIN_PAGES_MAX_ENTRIES)
> -		return -E2BIG;
> -
> -	container =3D group->container;
> -	driver =3D container->iommu_driver;
> -	if (likely(driver && driver->ops->pin_pages))
> -		ret =3D driver->ops->pin_pages(container->iommu_data,
> -					     group->iommu_group,
> user_iova_pfn,
> -					     npage, prot, phys_pfn);
> -	else
> -		ret =3D -ENOTTY;
> -
> -	return ret;
> -}
> -EXPORT_SYMBOL(vfio_group_pin_pages);
> -
> -/*
> - * Unpin a set of guest IOVA PFNs for a VFIO group.
> - *
> - * The caller needs to call vfio_group_get_external_user() or
> - * vfio_group_get_external_user_from_dev() prior to calling this interfa=
ce,
> - * so as to prevent the VFIO group from disposal in the middle of the ca=
ll.
> - * But it can keep the reference to the VFIO group for several calls int=
o
> - * this interface.
> - * After finishing using of the VFIO group, the caller needs to release =
the
> - * VFIO group by calling vfio_group_put_external_user().
> - *
> - * @group [in]		: vfio group
> - * @user_iova_pfn [in]	: array of user/guest IOVA PFNs to be
> unpinned.
> - * @npage [in]		: count of elements in user_iova_pfn array.
> - *			  This count should not be greater than
> - *			  VFIO_PIN_PAGES_MAX_ENTRIES.
> - * Return error or number of pages unpinned.
> - */
> -int vfio_group_unpin_pages(struct vfio_group *group,
> -			   unsigned long *user_iova_pfn, int npage)
> -{
> -	struct vfio_container *container;
> -	struct vfio_iommu_driver *driver;
> -	int ret;
> -
> -	if (!group || !user_iova_pfn || !npage)
> -		return -EINVAL;
> -
> -	if (npage > VFIO_PIN_PAGES_MAX_ENTRIES)
> -		return -E2BIG;
> -
> -	container =3D group->container;
> -	driver =3D container->iommu_driver;
> -	if (likely(driver && driver->ops->unpin_pages))
> -		ret =3D driver->ops->unpin_pages(container->iommu_data,
> -					       user_iova_pfn, npage);
> -	else
> -		ret =3D -ENOTTY;
> -
> -	return ret;
> -}
> -EXPORT_SYMBOL(vfio_group_unpin_pages);
> -
> -
>  /*
>   * This interface allows the CPUs to perform some sort of virtual DMA on
>   * behalf of the device.
> @@ -2515,24 +2382,6 @@ int vfio_unregister_notifier(struct vfio_device
> *dev,
>  }
>  EXPORT_SYMBOL(vfio_unregister_notifier);
>=20
> -struct iommu_domain *vfio_group_iommu_domain(struct vfio_group
> *group)
> -{
> -	struct vfio_container *container;
> -	struct vfio_iommu_driver *driver;
> -
> -	if (!group)
> -		return ERR_PTR(-EINVAL);
> -
> -	container =3D group->container;
> -	driver =3D container->iommu_driver;
> -	if (likely(driver && driver->ops->group_iommu_domain))
> -		return driver->ops->group_iommu_domain(container-
> >iommu_data,
> -						       group->iommu_group);
> -
> -	return ERR_PTR(-ENOTTY);
> -}
> -EXPORT_SYMBOL_GPL(vfio_group_iommu_domain);
> -
>  /*
>   * Module/class support
>   */
> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> index 91d46e532ca104..9a9981c2622896 100644
> --- a/include/linux/vfio.h
> +++ b/include/linux/vfio.h
> @@ -140,8 +140,6 @@ int vfio_mig_get_next_state(struct vfio_device
> *device,
>   */
>  extern struct vfio_group *vfio_group_get_external_user(struct file *file=
p);
>  extern void vfio_group_put_external_user(struct vfio_group *group);
> -extern struct vfio_group *vfio_group_get_external_user_from_dev(struct
> device
> -								*dev);
>  extern bool vfio_external_group_match_file(struct vfio_group *group,
>  					   struct file *filep);
>  extern int vfio_external_user_iommu_id(struct vfio_group *group);
> @@ -154,18 +152,9 @@ extern int vfio_pin_pages(struct vfio_device *vdev,
> unsigned long *user_pfn,
>  			  int npage, int prot, unsigned long *phys_pfn);
>  extern int vfio_unpin_pages(struct vfio_device *vdev, unsigned long
> *user_pfn,
>  			    int npage);
> -
> -extern int vfio_group_pin_pages(struct vfio_group *group,
> -				unsigned long *user_iova_pfn, int npage,
> -				int prot, unsigned long *phys_pfn);
> -extern int vfio_group_unpin_pages(struct vfio_group *group,
> -				  unsigned long *user_iova_pfn, int npage);
> -
>  extern int vfio_dma_rw(struct vfio_device *vdev, dma_addr_t user_iova,
>  		       void *data, size_t len, bool write);
>=20
> -extern struct iommu_domain *vfio_group_iommu_domain(struct
> vfio_group *group);
> -
>  /* each type has independent events */
>  enum vfio_notify_type {
>  	VFIO_IOMMU_NOTIFY =3D 0,
> --
> 2.36.0

