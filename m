Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C67F56145CB
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 09:38:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E3110E241;
	Tue,  1 Nov 2022 08:37:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4755D89919;
 Tue,  1 Nov 2022 08:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667291864; x=1698827864;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KdsMqnFvJUQhe1naAvRQnxtRiT6d/xM4SRaqKf3kaAs=;
 b=jFYETgUFBE7NG6fgV/x5ZqAq4zj19JPh+FIgFE3O5VnH6zPoCD4hKJCW
 OwK6MZMcxs/nw2OS379i012gaxlCX5e/gVn0yUlmUVQ9FBoHxuccOa7iu
 t95qyYLga0zGcWPktzXS3cl1xHjKXSFVWqEeScTikqcq5L4AU4RWMdeNf
 KD8rMORmVgy86NcIF3HGf+//3PNVfOwtfo6I1bFjkJ6RyJuDXYHdpp5p7
 QXPvFZU0WYQRtSZnNqKesW2wmya6OkJfoRG1+QidQrD2bmXNYrPJJDUGG
 HX9Bh0bbGOLNmCT+dDbb4H9r/+Na7//Z6gwzoQc8GkvtpJuvUrJtjqC2A A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="310189554"
X-IronPort-AV: E=Sophos;i="5.95,230,1661842800"; d="scan'208";a="310189554"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2022 01:37:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="633811243"
X-IronPort-AV: E=Sophos;i="5.95,230,1661842800"; d="scan'208";a="633811243"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 01 Nov 2022 01:37:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 1 Nov 2022 01:37:41 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 1 Nov 2022 01:37:41 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 1 Nov 2022 01:37:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rk7LbfB5ulrLIRgvfNf9rqbZxqGddpedm9RVv69EL7UptfgGLie1cVdcNVbjHz44SC6gQ5uJHF3tfoe00qzeE/cKlA2I8kNmt+P71kc36Sm329mCuSYgdHi7Hbl+Y1KQlD9A2eREpYTUsXv9fZU9CzPq4KUhRY3hVsuQUFd9vjYmDhxcviqyfcM3TKZAOwWFbhgUp1znyfBTGi+EVepnfMswywFotAryb+R0LcM/IN9QIGNQfTAKQbw9CjAtDups4U5ry/dWEeraNc4H6tsPnAg10Q6sY9edujLqF8iSjuvayJlPIOwGoVWEtO3m6wceT+XlCLf9KAkRP+DEPO0BIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C2xxECMfZdiqmuMd1gUNQk+8xfQC23/aZuN+4NDryhk=;
 b=fZZ8MCb2AJGmgu5kT2HPYumErg7q9ksftVibNdhvKflc5l9jM6r4bUFYYlnNhYVTPyZjve/IY+yXzu+77bYAo2j2Aum2lawfoAoienxv7LDyrblhPcHL23lCQKKhVOMeD0VAvaDqQAU5FIcO49c29ldPj1p+5pdmB+1RNmWO/AUDdKPbQaMGP8xfHWqKwVDC8LL+ExW2xOWKWgyaavdieHruNwGrFtvYG0QyTvh8Me6cNmFbYgGnuBsSaBNw7aJ0I3Htos1/abhoKWU+9OtKdioYwWBe/K4QmQ6UDuaOPDlUDCrogdRDTarU+qyX4Ungisdd4DefFNZi3mF4WP5LHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Tue, 1 Nov
 2022 08:37:40 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7%5]) with mapi id 15.20.5769.021; Tue, 1 Nov 2022
 08:37:39 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, David Airlie <airlied@gmail.com>, Tony Krowiak
 <akrowiak@linux.ibm.com>, Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Cornelia Huck
 <cohuck@redhat.com>, Daniel Vetter <daniel@ffwll.ch>, Diana Craciun
 <diana.craciun@oss.nxp.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Eric Auger <eric.auger@redhat.com>, "Eric
 Farman" <farman@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>, Jani Nikula
 <jani.nikula@linux.intel.com>, Jason Herne <jjherne@linux.ibm.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-s390@vger.kernel.org"
 <linux-s390@vger.kernel.org>, Longfang Liu <liulongfang@huawei.com>, "Matthew
 Rosato" <mjrosato@linux.ibm.com>, Peter Oberparleiter
 <oberpar@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, Robin Murphy
 <robin.murphy@arm.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Shameer
 Kolothum" <shameerali.kolothum.thodi@huawei.com>, Sven Schnelle
 <svens@linux.ibm.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Will Deacon <will@kernel.org>,
 Yishai Hadas <yishaih@nvidia.com>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>
Subject: RE: [PATCH 08/10] vfio-iommufd: Support iommufd for emulated VFIO
 devices
Thread-Topic: [PATCH 08/10] vfio-iommufd: Support iommufd for emulated VFIO
 devices
Thread-Index: AQHY6KK36tKtoJuH5EW7rSfXhdk+0q4pxKMQ
Date: Tue, 1 Nov 2022 08:37:39 +0000
Message-ID: <BN9PR11MB5276B6ACAE7E511770887BF38C369@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <8-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
In-Reply-To: <8-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.500.17
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|PH7PR11MB6053:EE_
x-ms-office365-filtering-correlation-id: 19787ad1-27f9-4ae6-4be4-08dabbe45614
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KtxKOf5iJKrCc5hu8mW0sNeM5TnFfoPDtFPzsYFbWZ4KYVLZdRwr60LzekvAOvcweCMxKuRpaSHBNLoDEM/Fu9F+8uAogirVwIwOrnf7b7XA3AVmLLAOtDw0YHQ40CvneL0aANT6ehwihcIbCN3PlrdVZ0YUx2vEuJmtg1oE6XDmxq055OUSnpYagT/ZGJaKKnXBZAfOEHKn3OIWvgLYXWtnEeNq5AVVXno4zc0ooIdDgc0CXPdeG9ycDoCdOpKt6ySjv4YGI9C5xgePKy1aPsUREBu1l/fn67ZVBsvz5GMCiyGXVCbDrQyZtVZ53zStI+EnS+7XrvK/+8PtZT26fk1XGZNEzzJKQT0xfowT0Rx9KEHUPcwbc5fYfXYaa1IDnB+PO6EyxDAn2wJ6auno58xIkc6CF2+MvSTKxjpa3hZlJK0SvSSLzrlYCtz8QCWQvblQ3eDFzP+xU8ACPAgZsL19/b+DUyGFxcd/qKatyZb2AYsPO9udP7E8pnN3e5LkNE2v+kpvQ7stZ3Jw4tPFNKnwe4G1tMeOt2O+YWLjDUXh6sOTkydrWyWMgeJNYE3/s6UirlUFULoI5up5SPycFaHzCw4oJr+7U5rof5MPNgyBMzUiCzLbxXGqk90T0xT/yaZ1uZ7MrTffYaZvPHxnIi5tuyx/A8Al4f6mlNXHsv2P6NKvWPnMFTOr860N08/Qvc4ku03sOhKxoTKFR7N1lRnraRD7rJFbXC04hxF82SL6pJzuaLYaxMaUyx0CtPJfYqk//H6ULDSdvXafJfK3WXrjlT727oWWFTzIdld5WEo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(366004)(39860400002)(376002)(346002)(136003)(451199015)(6506007)(7696005)(9686003)(478600001)(26005)(54906003)(83380400001)(186003)(2906002)(55016003)(66556008)(316002)(66476007)(66946007)(110136005)(6636002)(7406005)(52536014)(7416002)(71200400001)(76116006)(8676002)(4326008)(64756008)(8936002)(5660300002)(41300700001)(86362001)(66446008)(33656002)(38100700002)(921005)(122000001)(38070700005)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kO5YflTdw+BDlTzJ19Y81oki5ZHycYL+vSpHRqftj7pcKJLsR87fBNdAGO2+?=
 =?us-ascii?Q?gVLmx02rEW93+LnTIukvIWmDghkj2ekfVyHFdktqqJY1pjMx9CgxdHCuM5Hr?=
 =?us-ascii?Q?Kkdsd49/o3D/jMNr82w6+7XSNfYGd27u7G0eZkYG6ORWJXS2FDYrbReD+zyk?=
 =?us-ascii?Q?C6Vc+K2ZU7hvC9aYNyYr56TvEnwX1Wp7CBXPtBpHPP292z0fVc5bMuA+6U5d?=
 =?us-ascii?Q?QvFlPb7iknLs8Ve7GhyHyu/FmZPYxnjiT98p3HfD5mYy3tdXjM8N0Y/ESnxR?=
 =?us-ascii?Q?2dbV8SDR/116h6W95ge/5SEu5+lwTA/olIyhVSkxNXaY/j0c2YO5UwjUR4tM?=
 =?us-ascii?Q?JGhhopGdFVoquq14FxGlZY/7P8QOBOrCM3cIYhzLjP/bvIykUDlXQbDK6CG6?=
 =?us-ascii?Q?W6MNy5X8rIVaZkNs6w5qoszXBEFA0yEGCXwk2wrWt6iHDmD3beDe1ZnCswPD?=
 =?us-ascii?Q?QDMGmxqMfWVR0ScMuna03te1Wz8w38FVu/ljjkiikSd4iedujx+izUHwdhC4?=
 =?us-ascii?Q?FGFkKQ5KhwgoBfR/hKTNd2ro9nu+c4XTvLpxSP3uwHEjALR5QNZhWsx5s2Vj?=
 =?us-ascii?Q?K13HAuv2OvPFYq36wQnM4escEvD5AStC+gf6CngBYbU3pKkXePuG6fKuguK2?=
 =?us-ascii?Q?w3ABRjYYZaTky+JLBA3OzpYffDoIWDIQPeYwI/i8AV1prjPlAxgGSejfF5f+?=
 =?us-ascii?Q?C5qY/PN1POdZATVPx08bfXGl/bqPCO9OM7u2lMQ214Z6Ycml0RhHT0ThJkRY?=
 =?us-ascii?Q?ERe9aUVy9oS/6sBslagbFeXQx+HjuLUszw4NR38MetxSG3BcvoaFNEWLojQT?=
 =?us-ascii?Q?aArz7rzAhUrC626vkKioE/WgItA/4DXHA511NhqJOUCj1YaU1d3bQINBB9/J?=
 =?us-ascii?Q?dexNsqZsteh6vAxZBhOHqUZtoASRI5V5ugMCjY0PisGEuNZsjT4QTC9ha81X?=
 =?us-ascii?Q?FSvbzGnV59IQoiYlECkps1doDmEXNjVwPC+f6VUr5V7Hf+cPwozaUpkef079?=
 =?us-ascii?Q?cWabSz9iXyBJKLr8T/JnafIbSoAAVdzYCgEnowkIN4EIi61ON8upfsJq/4E8?=
 =?us-ascii?Q?X6r72JupX4/5d2Q57+sAhrg666wDtHm/xc2wms2cMTzCzXt3zSZe7hjgfuek?=
 =?us-ascii?Q?l/ceCu3Zpbf1MrcJr8kN9A+SMpVHW0CHb0zxo3wzxF9o8uBpXdZIztzAuJt/?=
 =?us-ascii?Q?hHivfanr438UKuAENMpzJaLvJSt+xJe4xrIp06xMnF7NacNItw/EooynCRme?=
 =?us-ascii?Q?N4CaM0+lkSAly6rmO14IBkGh+IiclW5XCB9RkzrBzqOeeiaPUdGIeGF7HFE3?=
 =?us-ascii?Q?/sqv0iRYJRsIrBvPG35JIOsLiS5UYkAj9/StMxq2pLYglNh/we7jfpPa33b5?=
 =?us-ascii?Q?Axu9uImKZ8BlAIFu44RXSCjk/gWSSxOJ5LTGqcLLzRQ7GjUD86CW9kWvOaA2?=
 =?us-ascii?Q?3QlQA5g0NyxNJMsvG78KPbaO6rfyVCMGdfhu4yON/9liaw9LqcdY4aWUOA1S?=
 =?us-ascii?Q?XwyWwWiNOKjPAzufnk+sUbP8n+Fb+4Oh8LmxE9Gc8HomkDqM9x1qkssJfD7f?=
 =?us-ascii?Q?iJXwqzdTK9qQ3kFNy++xCL4Pc/G7WSYwv6Ij2FdL?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19787ad1-27f9-4ae6-4be4-08dabbe45614
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2022 08:37:39.7299 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xU2gTA4yISEKrtiLJr/rO2PqT34GW2oH6/DfdRxSEcWa/lNjcjWXjNNrL5gGvQ6FxFGcRM5b6V07FAiSZ9Evbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6053
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
Cc: "Liu, Yi L" <yi.l.liu@intel.com>, Nicolin Chen <nicolinc@nvidia.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Wednesday, October 26, 2022 2:51 AM
>=20
> Emulated VFIO devices are calling vfio_register_emulated_iommu_dev() and
> consist of all the mdev drivers.
>=20
> Like the physical drivers, support for iommufd is provided by the driver
> supplying the correct correct standard ops. Provide ops from the core tha=
t
> duplicate what vfio_register_emulated_iommu_dev() does.
>=20
> Emulated drivers are where it is more likely to see variation in the
> iommfd support ops. For instance IDXD will probably need to setup both a
> iommfd_device context linked to a PASID and an iommufd_access context to
> support all their mdev operations.
>=20
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/gpu/drm/i915/gvt/kvmgt.c  |   3 +
>  drivers/s390/cio/vfio_ccw_ops.c   |   3 +
>  drivers/s390/crypto/vfio_ap_ops.c |   3 +
>  drivers/vfio/container.c          | 108 ++++++-----------------------
>  drivers/vfio/iommufd.c            |  57 ++++++++++++++++
>  drivers/vfio/vfio.h               |  10 ++-
>  drivers/vfio/vfio_main.c          | 110 +++++++++++++++++++++++++++++-
>  include/linux/vfio.h              |  14 ++++
>  8 files changed, 217 insertions(+), 91 deletions(-)

mtty, mdpy and mbochs?

> diff --git a/drivers/vfio/container.c b/drivers/vfio/container.c
> index 8772dad6808539..0388f2e33447eb 100644
> --- a/drivers/vfio/container.c
> +++ b/drivers/vfio/container.c
> @@ -540,113 +540,45 @@ void vfio_group_unuse_container(struct
> vfio_group *group)
>  	fput(group->opened_file);
>  }
>=20
> -/*
> - * Pin contiguous user pages and return their associated host pages for =
local
> - * domain only.
> - * @device [in]  : device
> - * @iova [in]    : starting IOVA of user pages to be pinned.
> - * @npage [in]   : count of pages to be pinned.  This count should not
> - *		   be greater than VFIO_PIN_PAGES_MAX_ENTRIES.
> - * @prot [in]    : protection flags
> - * @pages[out]   : array of host pages
> - * Return error or number of pages pinned.
> - *
> - * A driver may only call this function if the vfio_device was created
> - * by vfio_register_emulated_iommu_dev().
> - */
> -int vfio_pin_pages(struct vfio_device *device, dma_addr_t iova,
> -		   int npage, int prot, struct page **pages)
> +int vfio_container_pin_pages(struct vfio_container *container,
> +			     struct iommu_group *iommu_group, dma_addr_t
> iova,
> +			     int npage, int prot, struct page **pages)
>  {
> -	struct vfio_container *container;
> -	struct vfio_group *group =3D device->group;
> -	struct vfio_iommu_driver *driver;
> -	int ret;
> -
> -	if (!pages || !npage || !vfio_assert_device_open(device))
> -		return -EINVAL;
> +	/* group->container cannot change while a vfio device is open */
> +	struct vfio_iommu_driver *driver =3D container->iommu_driver;
>=20
>  	if (npage > VFIO_PIN_PAGES_MAX_ENTRIES)
>  		return -E2BIG;
>=20
>  	/* group->container cannot change while a vfio device is open */
> -	container =3D group->container;
>  	driver =3D container->iommu_driver;

duplicated comment and assignment.

Actually, I'm not sure whether the comment should be put within this
container helper and other two. There is no group reference in these
helpers then it sounds like the comment makes more sense to be in the
caller side?

> +void vfio_unpin_pages(struct vfio_device *device, dma_addr_t iova, int
> npage)
> +{
> +	if (WARN_ON(!vfio_assert_device_open(device)))
> +		return;
> +
> +	if (device->group->container) {
> +		vfio_container_unpin_pages(device->group->container, iova,
> +					   npage);
> +	} else if (device->iommufd_access) {

be consistent with other two helpers i.e. if-if instead of if-else

> +		if (WARN_ON(iova > ULONG_MAX))
> +			return;

Is there a reason why this is a WARN_ON only in unpin but not in pin?

> +int vfio_dma_rw(struct vfio_device *device, dma_addr_t iova, void *data,
> +		size_t len, bool write)
> +{
> +	if (!data || len <=3D 0 || !vfio_assert_device_open(device))
> +		return -EINVAL;
> +
> +	if (device->group->container)
> +		return vfio_container_dma_rw(device->group->container,
> iova,
> +					     data, len, write);
> +
> +	if (device->iommufd_access) {
> +		unsigned int flags =3D 0;
> +
> +		if (iova > ULONG_MAX)
> +			return -EINVAL;
> +
> +		/* VFIO historically tries to auto-detect a kthread */
> +		if (!current->mm)
> +			flags |=3D IOMMUFD_ACCESS_RW_KTHREAD;

Can you elaborate why this cannot be put in iommufd as the default
policy similar to what vfio container does?

