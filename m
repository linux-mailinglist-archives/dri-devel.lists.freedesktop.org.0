Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3265C614598
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 09:21:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E88910E1B8;
	Tue,  1 Nov 2022 08:21:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6AC210E191;
 Tue,  1 Nov 2022 08:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667290889; x=1698826889;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AQBqJ72ZpdNYK35jbtInKDYAakKeGxKzYqsQjFkfFcA=;
 b=A5jwtKcybMY+JQy22KRwIoQavmi8ZtVRRd3U3xscMtXuzQqiCCS2jOpV
 DYtZSB7N8oE3voguq1oL0MVMUEMXog/LzI7fq4WEbR3OoAjFnDC/i+Uu3
 1gzp0TGogUxoNdJv6yl2eMARaRH6zPZKR6v8Dgl3KEJPEyNNlHIssMfVX
 5unb6VwH0l/vqhaPRLOadQ4zYzMnzZqHiE90CsYFnpOA7oaTS5FYpz/L1
 yOQE/SFPXrIkUBAjK2r481zymTo35xXxwUjG8ndFAl4l/eaKGEKAF5t/o
 gtkEKhOUHkXFIuY3RmOUIx9cmw/f64QUGOCX5zMFgs78oLMcHLYOEJBun Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="335755878"
X-IronPort-AV: E=Sophos;i="5.95,230,1661842800"; d="scan'208";a="335755878"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2022 01:21:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="963061943"
X-IronPort-AV: E=Sophos;i="5.95,230,1661842800"; d="scan'208";a="963061943"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 01 Nov 2022 01:21:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 1 Nov 2022 01:21:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 1 Nov 2022 01:21:23 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 1 Nov 2022 01:21:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eNLdFloeTJClzOVaBhw+370riCWrfEbk8NmaBbOLxlYWPC06jcI5RYWjyC56Ek+Fpf8012oN8YbxOSSqFMOKqKP6dDhEYjiCqCUXlWX4Hvp2NiTnbBhCpZZmHrwHSjf0OE12ZW9WtJY/rD/MvRMHLXcFi3pSs43j14W+IwK3NTgEi0CXvAR+vRyuKFiTa+jPr2XE35ber+iooxFEQyst6igUSem59eEhFOdsEKWb9IfBAogFHj7BddNS3X6KZMtOUTjHFn9UFmQMfmh4ryDv9NC6CuwnGS/gRwn8ql1G/o2+ev/Kb4B2NZ5qEA8xN9zDklaSUp8DF7QaQ3PszG3KVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8FfI94Hhnx0NW0CWUUwXjgIHCg/ULXPjCJhpqcgbP/c=;
 b=lxOiwAKsaO1uf81qhQ72XqT+sFy/c1dYMP2NMHVwCPlcabnJH7bLNkZy6hBc1Cc9n/ZvIjYthEoFs1YwIvVa2ztAWBdICN1yamLB6ZVErcUiopttGN1TcymW2r0wdes/SPSnVUoewfheYT1hLc/TzZywmxlBHQkNAVAzP02w00j1WDIuG1iJ9Fcl6cRcDwaoX37sIqbmYtTjUCWD2imIoX/Px8ocxj9HLzxcRW0Yui1CwTxkuqk0hKBEkrOEUi4OcpI61EKz2e/1CyJ0mbLTO1bpEo+a0gxi7h+GdVl7f6x6jnsLoKXjgMwiNa0rwVnWUcvSpRo0qEfmfzT9UxNdew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DS0PR11MB6400.namprd11.prod.outlook.com (2603:10b6:8:c7::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.19; Tue, 1 Nov 2022 08:21:21 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7%5]) with mapi id 15.20.5769.021; Tue, 1 Nov 2022
 08:21:21 +0000
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
Subject: RE: [PATCH 07/10] vfio-iommufd: Support iommufd for physical VFIO
 devices
Thread-Topic: [PATCH 07/10] vfio-iommufd: Support iommufd for physical VFIO
 devices
Thread-Index: AQHY6KK7C43Vyk7+UkyVJ2iUT3Ipqa4pwW3A
Date: Tue, 1 Nov 2022 08:21:20 +0000
Message-ID: <BN9PR11MB52765B9F0F2E56A973F58AC28C369@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <7-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
In-Reply-To: <7-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|DS0PR11MB6400:EE_
x-ms-office365-filtering-correlation-id: f8a173e9-2116-4137-6344-08dabbe20e9a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A0jWPdwZrdhAOyHB8lCo7KmI/ArG5FDmIXrHnBP/6skgxmn17WQDveWLCZluQk/vSEl0LWoDNjogfUV2OzQknZjcBValrX2U6RsEZu6jCwliAxrH/Z19ontFo4YOcKT3wzNlRzz3vDPt2gWYxqijqtsHYfBDChYUz8Anu0F3rCbaXju/yANuOJmko9E7miPu1PfEHBV66MuMU6IxJuomY3edmqSizoyAf4asojuCBOHQFctAcKm4mUFz0e+huZbIrOawAnVjC0fa75zCm3yIt4UoSfEbUWkqD7WhoY7TTEEqe3KCYdxvAyiUxA92NGhW20lpUPJYhClHjC6nvXx3ouiCFk9UHVYIAllYTTU2V9AUWmsnipZvyrcn4jV5SCEBDXD67Sxnl6tzqPCJAh8zzjX4yVxP2hXAIZnbOAyxIt2gSqjWTQEjvxMO3vwjK6IwPDomtsYu9J3CdKUAHIHgxjbdWu44M+ZRrmBnRee1qZaJ8KIO1lgrfh1SsPm6OMTEMAmzzlYpbTThyald0H6tdUMHUh9zCKdGSLMHmGvoco7LliK0F6KgdQYd1LSC3DFp9ITG+HB2AgvGQFF5Po4BEVjJQylex/KdUTSvWzpqesexr9+nvkQViZs0Wme4ooC4rX5FcvzJAzdDiPJv1ylT2qAsPTZknT58GoQmEqB/E3ogDgKjC8H0AEqKPAT167WXa6A8q5D7ma4raiSnIdQjlTUtg6oYuAnh+paKi9AWdcgKFbWhdPISQBXZIdh1K1l63vIlrRCDKn/0JRX+SLp6pg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(39860400002)(376002)(366004)(346002)(396003)(451199015)(38100700002)(26005)(38070700005)(9686003)(41300700001)(52536014)(2906002)(4744005)(8936002)(83380400001)(7406005)(5660300002)(7416002)(921005)(122000001)(82960400001)(186003)(66476007)(55016003)(71200400001)(66556008)(110136005)(66946007)(4326008)(478600001)(7696005)(6506007)(8676002)(33656002)(66446008)(64756008)(76116006)(86362001)(6636002)(316002)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oA8WP2yU+zgoPeR2vBlg1hHjp9wSMA7GtBp6E7i7/YvxDWc2KamAQpBhMzGR?=
 =?us-ascii?Q?ArTskBsVETzfTk6fw6ExQ+PQ7TDDHLIGppKvISnQwuG9B+VDb1/u3IgeQ/mz?=
 =?us-ascii?Q?IUNNFhsDBh2CAGIhmIp+3P1IOdMHOzv/0ehbqfkNQmdkEwl1uGh3lT8J5JjP?=
 =?us-ascii?Q?5w8c6SQSHBhKj7lL6azG1wNocKOYxgjSDFKG81kjHUSN+9ROPYGaepZFdLVu?=
 =?us-ascii?Q?bO3NewbY9mUD+jD/+AB97MkkI9jPxpHrNnbB8m6W4U88A8i7xtAcsuR8S6lZ?=
 =?us-ascii?Q?S2XOprIWqJu+HxZD6GtfL09v/MlBRO9MaNRwNPJTnVqR/7hioKgaitF8GX+a?=
 =?us-ascii?Q?KrgFErLkWvDI7XFIwOEcYbknCfN3W9S5DJde189+WCUTvQbwyIJP2WGTJ8XJ?=
 =?us-ascii?Q?9PwCF6KMEMjvlJCoViJcKel5fAKA2S9BuLJi9fet+AM1ZyScA2Z4vzGOWGpM?=
 =?us-ascii?Q?mbocCasqilPIiphbJ61t759gL89pm8CBYazyAa8QymZvGGLojVuzbxCGnQWc?=
 =?us-ascii?Q?98wiu2fhRDlglxewiec0hoHoES6i4DdAQ3BLQIfm0+Ua6FyphT/AphQeBBQ+?=
 =?us-ascii?Q?dXMzmMzteYZ9QhDEspj2ABE2Vua/eETeetRyuN1Zz5EMqkKJCDneMRrMxjz4?=
 =?us-ascii?Q?ZNi9abxs70+N0Xh/rXM+ZquRiEUI4viEkjLbHCVbCmz0wLfkfJlcMFFsPxdP?=
 =?us-ascii?Q?zEEYmQw21M1AhjrhmNlAyubUiCWwRk4Qxps6/AZ73WP8qFlQJeL5s70qipVo?=
 =?us-ascii?Q?cjZMJqcU9nOFdWkg0h8brWqcO19fXPGlMDnpSBp0tjfRc6rvNwfBNR9iQGTp?=
 =?us-ascii?Q?oFe3dvULacELQARA8khevBBXK7J/UB68bqrM9VuMgZJZL0PAbF1mSlCjYRbr?=
 =?us-ascii?Q?3/uU4u8QGYuQ5hEe/FUQeCBquk7dbNAt0iZ+X+mFVnflJVHbTsnzjKNISH/j?=
 =?us-ascii?Q?ZuYw9PaXB+mmBbGZwv3r+PryrhG3VpTOHSCC5nG8KNg9yXpfylBBIl3ThW5P?=
 =?us-ascii?Q?a72hmE5xuP/zwCaT9TL4CxSUwZ/c35jdBmX78w3ssrBe7FWBCo8yhl1fL0yU?=
 =?us-ascii?Q?PCe5rh+yPWpJjWGRbWazFNkIZ3rgqxYKivHtwwyOrlYK/zUdgZpmi6DPdw4b?=
 =?us-ascii?Q?ulIofuLU3G8jl0eP8yu6YtUzMajV7M59ZXirNT4emTSMmf353By0BlSYR1e/?=
 =?us-ascii?Q?FR1CD30kpQz4xSXS2vnxCYs6qQcsxMtXX4S/L0SaYC9bg11+7TVsolhEq3GC?=
 =?us-ascii?Q?P5YT2y0QSJiqTHi85au89Vab7/GMp/tvM+RDSCq0pwoXrJQleeei9fWxMaBd?=
 =?us-ascii?Q?idICcH8hue2dFRO3JJK437Q5BBOSDqhZN8CiRzCmRCRLm36mGxduwWNTEpxD?=
 =?us-ascii?Q?39bxq8IWy443k/d+JyUkvVdnROT/5ntLS2rbLDqtc+o0G/MUSQ3RilJi8bau?=
 =?us-ascii?Q?Sn0qaEUCLHj8xLAtx/zLVXh+OU08HytgY09txi1NzlMQUFKOy3Pp5HRc5r2P?=
 =?us-ascii?Q?vY1pXOSLTQk/5AdJFEtuefWXNGTwfNow6rW6sgHz9xEwAYxUssasP7rGhT4p?=
 =?us-ascii?Q?583ZHSilK45Kkcr1PoURqRUf4ZTwnJzKcBJd1eTd?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8a173e9-2116-4137-6344-08dabbe20e9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2022 08:21:20.7724 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BtMvonrgUlX+5OMinnh33G/JEJjpVqWiTFiIRhsuK86CUUy827YVfF4qcbdQIQA7KqulCnrch4nRtzr9SHQNFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6400
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
> +int vfio_iommufd_bind(struct vfio_device *vdev, struct iommufd_ctx *ictx=
)
> +{
> +	u32 ioas_id;
> +	u32 device_id;
> +	int ret;
> +
> +	lockdep_assert_held(&vdev->dev_set->lock);
> +
> +	/*
> +	 * If the driver doesn't provide this op then it means the device does
> +	 * not do DMA at all. So nothing to do.
> +	 */
> +	if (!vdev->ops->bind_iommufd)
> +		return 0;

Nothing to do or return -EOPNOTSUPP?

> +
> +	ret =3D vdev->ops->bind_iommufd(vdev, ictx, &device_id);
> +	if (ret)
> +		return ret;
> +
> +	if (vdev->ops->attach_ioas) {

__vfio_register_dev() already verifies that all three callbacks must
co-exist. Then no need to check it again here and later.

> +void vfio_iommufd_unbind(struct vfio_device *vdev)
> +{
> +	lockdep_assert_held(&vdev->dev_set->lock);
> +
> +	if (!vdev->iommufd_device)
> +		return;

there is no iommufd_device in the emulated path...
