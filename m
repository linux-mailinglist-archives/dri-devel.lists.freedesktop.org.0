Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B9E614580
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 09:10:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42C3010E1C1;
	Tue,  1 Nov 2022 08:10:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E9A10E191;
 Tue,  1 Nov 2022 08:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667290201; x=1698826201;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2rpAsQYGlVIM36kD6nVLkuTzhqqIuuwFTPPTKa2SMcM=;
 b=N2sBBAc5gN07ryePc8h2a6tzLM5RQ8fGROwrDkST4iQF4UzYyMWU0xaN
 qLSlpC5H4jVXXh888bVRAGkVF2YApYkOE2aqRCSKfVFV053i1AF67aooZ
 nxicA67PgpD+YYYEDEksubflMI0CZIRMtd58R8g36ZDXNC+S0STr5RP5k
 0e9aCcrBdMyfXWRwt4GJO9rUaGPigRAvmcgfW/mdVkz63DVx/5+Osdn6j
 1WGizGHXkV7+Ua5UAXx+UU0yW1QYNMfMco2dN4oTSGAZ0OsqsyoVfzFXs
 X2mq8hR/pWtZC7prLjQWgK8KAf9bJKY/MTV2AVHSBrxn314jy3+6OXMgs Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="296517488"
X-IronPort-AV: E=Sophos;i="5.95,230,1661842800"; d="scan'208";a="296517488"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2022 01:10:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="723091454"
X-IronPort-AV: E=Sophos;i="5.95,230,1661842800"; d="scan'208";a="723091454"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP; 01 Nov 2022 01:09:59 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 1 Nov 2022 01:09:59 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 1 Nov 2022 01:09:59 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 1 Nov 2022 01:09:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MBSZ2zo3ni4kU/yGI6yYuvByCReFkQxHDpZYpTtlC1qgs0YjuAWcvkPd0n5cHCOiBajaavvMQ3L+EBXWTBckplRwcmPozgvSMsJ+viVASAjh0RfE/zHsOzx2LRGUKZ6L4syzxzwDsf6aS2MgQZKfT2iuDx0DJIr9D8InLwRUdy4SPvIotcXCBXsP6+lQB1GZ20qcroJ+QehFrFW6QjvhG4ARf/zPIm9ePBpf5cpY3W/XT1h6mUH5oexgQG1TpQkv0eyThVM0P0Lp0HVostGBOs3fHRR3TgRNxjHUuQXK54LVcU6R1H1cEK3P1eJO7UQ3NEfef8nIlZdnmFS6gOf5Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X4ZSYEeNff3/4NW/Gtwms9hZgY0N/KdO0iDwp+Y0+8M=;
 b=NAApt16NfWOE5YCWxFEt5pzouZu+ZQvtug+4BxgYMAkSFZy/CKHYm4R9Q8EndJ+NodqRNRIki9AByNPe4uFc24n9lum8C8gKAhfPnzhzN2n6WXHFn6bDhNgwvmuUHMuSSP0n1qNO7BMmXrnqsSKviz51zLY0q8koGrmb9/zLWYpqv2bemvR7iMWXwYRbkKDKbIs5Netjofxz6GZFDB8QDfQbDqGHizg8p9CRmFAOG2T5u86Pfl6hDFBhlzlineuUF17ASdmOy1saVsMcCB22DB0FcWQx8HYtXEkM8pSCRRTB82GSxQqTl7/0m/ARpGYHwZWJyBskmSXIYg1kM38WZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM4PR11MB6453.namprd11.prod.outlook.com (2603:10b6:8:b6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Tue, 1 Nov
 2022 08:09:52 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7%5]) with mapi id 15.20.5769.021; Tue, 1 Nov 2022
 08:09:52 +0000
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
Subject: RE: [PATCH 06/10] vfio-iommufd: Allow iommufd to be used in place of
 a container fd
Thread-Topic: [PATCH 06/10] vfio-iommufd: Allow iommufd to be used in place of
 a container fd
Thread-Index: AQHY6KK6QfY2Z63NYEOqTFk+KqN9SK4pvJ8A
Date: Tue, 1 Nov 2022 08:09:52 +0000
Message-ID: <BN9PR11MB527655AB662598A9D5F9F1778C369@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <6-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
In-Reply-To: <6-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
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
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|DM4PR11MB6453:EE_
x-ms-office365-filtering-correlation-id: cb445901-c66c-426d-dd1c-08dabbe07414
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dltzNa5g2nG3TOCH/ED3ygMCjvyeNXlzrr3knOgh+ZEmqOd47WTbAPi9ygg9eHslQrMamLFeu56q4eTqhax8HaisPOmzG7A0uT04DEg5GPQJlLIHgNZ+tMaiOAzMl+eEBuKt08Mi3dp9L1MfTgSlBTG4cItQL1noMwRqDx9ojFXc7731G44mgQVl4qi3PjX3GC3/rbRYXpYdIE//JvgQuQcNE6zzjC9tUyK21vwUN8D/idjkyR+QBwXwkuyoxHzXYtBhDZFHzzKAg3l+YtaOHdCVZYDuUn+ylCAVJodw0v8uuH1QO0HaTQiQQfIxXRP6iuoVs0BiWi8CUnl6cOm4iJUTXJVGVTLhdNMouITuPBSfcv5Xo7cr5e0BFv/pVT6rgP6LA+ULDSRX42MW05mcMH05666RS/25AgWcuCYZjvV41n4z71v1Ns4LCM1DwgktP9qgBMUQiEInZSNNNkFHGf0tajRh/KHPUo5INyM8D63+m5EyUN+W8BrEWd1dBSd4FcHcwH1K0PGfrn5zqgbueSgua2aStalmXSdJBHwDUzthgW4/Yc1Bw5MfZWLWND+kn9B7Fn7m+h4mBOtYH08dpcjZHr0MDAl6MnBOk/wpHPF7ycBdM8Zqv9BJEu8qXqMU45ofPN469RKDyrFr+mO90CagCaHGMYSmYLD0t0qJWRsdp700Ot7rhsUdKk5gvTLNHy65/qwQsxpmu+Oi9U/SsdIko4wpiAUonn8XL4F4dCpQwR2rVrLBhVFBnoZRBa/7LrTPab4G6bCGRGXpwhJGgtmUdy6TkkyBBQe9HZ4Y1OE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(39860400002)(346002)(376002)(136003)(366004)(451199015)(83380400001)(71200400001)(55016003)(82960400001)(921005)(2906002)(7406005)(7416002)(5660300002)(38070700005)(38100700002)(33656002)(186003)(52536014)(122000001)(6506007)(9686003)(26005)(7696005)(54906003)(76116006)(64756008)(316002)(66446008)(8936002)(478600001)(6636002)(86362001)(8676002)(110136005)(66476007)(66556008)(4326008)(66946007)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?He605/60ShZqihdwsNGqzLk1dmAI2A+iFHCTUCpWqXghE4pG0n3V+c7jf/zd?=
 =?us-ascii?Q?dOp/biRO3C4VqfE9iao2Iru2Hac4tUQzS+ua8u9g7vDmIOgnS6O1T+7enOTV?=
 =?us-ascii?Q?Hp7dNJBcuWhlml50ht0JJHUVKvbUvgVzOpexTGk+miGyeWXobhpfSMz0HAcZ?=
 =?us-ascii?Q?aNgo+5x9LKnfOVG2LHvTfwyIvooQEQJ4qpbRF4OqT0B2hstIgEzbb/Rr3HN4?=
 =?us-ascii?Q?uM510m5WbfCzseEP5+Tj2o/I4dJcqqs6UdFiQAVsCckTNCMAEEkcPCKPhupk?=
 =?us-ascii?Q?eb6Wsa2KNOQf0jwvCERbUZCgZNPFEtximlMyitF/N5DKn4M5KrwebqfsOG5t?=
 =?us-ascii?Q?i2lCpxdWLKWFKqehnVw+w5GFbT6vbyabdGmgq9MTnpWmCSAJ+A2A0FJmtK38?=
 =?us-ascii?Q?7rarj0ZmjnngWthxMlaP+iwGwvkUtRVZBqXtLFmk7SRvq1vkGPlPG1FlSCrq?=
 =?us-ascii?Q?3cPv9XukLoElcYsXWQd6mChuQnOzAuOzOuldhWqVMk4UdP1ETGtdf7DCM8ow?=
 =?us-ascii?Q?I20ibtcsklQ1d7YTnJzOrXxqL4btcpZys++wp+uTPzuznsWJpCgyve3qQMvQ?=
 =?us-ascii?Q?vHGgaNd8DuNuCEv8t1pUFFQ6XuxrA9L+KZxQI+fyoApbNUsKXLyiHQ0HLca6?=
 =?us-ascii?Q?rcYeG+EOlSM6jjLILi5H26Ltc3PT+z6W9aanfPM2rfoi/i2zm9X5U1hFXUR2?=
 =?us-ascii?Q?x95K8IJLY8ws95wvHFofjNAYMAMHP3kxA9YVDBDbSGwjFL7aJ1TPdhRk683e?=
 =?us-ascii?Q?CfqrmTN1OIPG6uXuyuiIIc4bxkz0Q6wkgnaVIdZSxF1D9GVjc2nQoXB4b+/o?=
 =?us-ascii?Q?AwZ7LDL7CnSH1/M1O0GqotrBJQe1CakiIt46mbgI8Jr4UA7B5k/8KLAtsMIR?=
 =?us-ascii?Q?/YbAQGJqRWZbZlUMrgk5VULCuH28fSK9zyJxHMKmgdYJiwdDi4i96DtoTbGa?=
 =?us-ascii?Q?DsV1RNoNtmGd7YlccaMbIZi7RtN+xw6EHe7IKNywXHr3lVQzGuZenSV2s02O?=
 =?us-ascii?Q?MnnDpjTsvvVvC8VJsAfQsWxciXrJIutMRjjcqy4VkqOK5lw0q7q6DPM5TP5n?=
 =?us-ascii?Q?GgfoukPHEu8Jf/o5M3Gjk9bYBMeiLUa/TPO99HzB252c0FWNMK8XJH4TQ9fk?=
 =?us-ascii?Q?yDSOf8601stXyXh16wbauxAMWbS+pvGQwEz8WkO39uB5C4aT43IHOAh1lmBe?=
 =?us-ascii?Q?w1EwySe1sjzpKodLmZuBHC5bJD4wu35lhTvQqyTHBN8j9+GVbXcezqORmhtG?=
 =?us-ascii?Q?JMc+m+CQHVSHo9tpUxZN7jrNTVSQXhEfpLhmMhY0IQvwqP6L+Dj40WHzMcKd?=
 =?us-ascii?Q?8dgJIy4V230tZXcB1Fgd4Fd81YmjmvtSp9C38vuoJiNh0ZcjSwl70RWSpbuN?=
 =?us-ascii?Q?9I3WzT/i19G9nSo3LzvxrUXHwiSwkzSsvmI/x9bIWzMPvT7ll3wctzpbHuQL?=
 =?us-ascii?Q?7vxb8GPDc3HREv3OXGBVM/8ghsifNzGxV4hxtCOjgECOfIDhj6pO7L04fxV5?=
 =?us-ascii?Q?kRo1ZhO+8zPIbGRZIOQRGfZqUkQBhyvVSC1Rx+CKCBgH2J/dbfpYPf+rpnqB?=
 =?us-ascii?Q?et0LlovUnH2HmjL+j8SobtgwZ0vF6wjLEJQ0CkjS?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb445901-c66c-426d-dd1c-08dabbe07414
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2022 08:09:52.0781 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eqkWc8d0sfri+F7p/oo8NqIxeMiAyfxZYi5NQfAyF/pED9/KQII7REyoloBeGgw63dGUhtf/l0IAqLV4dXpgcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6453
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
>
>  menuconfig VFIO
>  	tristate "VFIO Non-Privileged userspace driver framework"
>  	select IOMMU_API
> +	depends on IOMMUFD || !IOMMUFD

Out of curiosity. What is the meaning of this dependency claim?

> @@ -717,12 +735,23 @@ static int vfio_group_ioctl_set_container(struct
> vfio_group *group,
>  	}
>=20
>  	container =3D vfio_container_from_file(f.file);
> -	ret =3D -EINVAL;

this changes the errno from -EINVAL to -EBADF for the original container
path. Is it desired?

>  	if (container) {
>  		ret =3D vfio_container_attach_group(container, group);
>  		goto out_unlock;
>  	}
>=20
> +	iommufd =3D iommufd_ctx_from_file(f.file);
> +	if (!IS_ERR(iommufd)) {

The only errno which iommufd_ctx_from_file() may return is -EBADFD
which duplicates with -EBADF assignment in following line.

What about having it return NULL pointer similar as the container
helper does?

> +		u32 ioas_id;
> +
> +		group->iommufd =3D iommufd;
> +		ret =3D iommufd_vfio_compat_ioas_id(iommufd, &ioas_id);

exchange the order of above two lines and only assign group->iommufd
when the compat call succeeds.

> @@ -900,7 +940,7 @@ static int vfio_group_ioctl_get_status(struct
> vfio_group *group,
>  		return -ENODEV;
>  	}
>=20
> -	if (group->container)
> +	if (group->container || group->iommufd)
>  		status.flags |=3D VFIO_GROUP_FLAGS_CONTAINER_SET |
>  				VFIO_GROUP_FLAGS_VIABLE;

Copy some explanation from commit msg to explain the subtle difference
between container and iommufd.

