Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 221556239FF
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 03:48:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D92410E653;
	Thu, 10 Nov 2022 02:48:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A75310E64B;
 Thu, 10 Nov 2022 02:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668048500; x=1699584500;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VQ9p1qFdZCj28um3Qupjvy1ks9d1XZn2c4Ctb0rb3aU=;
 b=GA4rZ8i//S8UFDzT38w+oHRTKt9jUSVZcfSR6HG/PJSlhSatKk3nFBhk
 IHfRijDar8ybIbIBNhDFLmDM8nTNOCvPBokjgG8oohEFWHSmn14AQWEAf
 ZvSnWcdPshrCBspZiSvUdudi2SHciX1wRKarSrcYw8Yf7Rcbut6tHfQmj
 Ka9Dc3QmBfNLMRgIWJLUcdgWGJetzn9Pta3xFHypMe+yvvY67vJPmEJjd
 xLRjwZlwj/B47/1ATSfy320K0carIhKcVJtMdExFOhCmhyXJRH+ytpuGm
 vT7IAt6c6c1vSvv8JopAodvo9y6lWoQLHpkqBcrUw3n3jgLNI6Wga0XMG g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="311190970"
X-IronPort-AV: E=Sophos;i="5.96,152,1665471600"; d="scan'208";a="311190970"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2022 18:48:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="588004867"
X-IronPort-AV: E=Sophos;i="5.96,152,1665471600"; d="scan'208";a="588004867"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 09 Nov 2022 18:48:19 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 9 Nov 2022 18:48:18 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 9 Nov 2022 18:48:18 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 9 Nov 2022 18:48:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OOI8ERePcg4pXPvt1LBMxRklbb0/7bLf2KnJshUEfpD36DXwsQXoXdNV/kXpEpFAnU36lY8VZFDJH7sxcSPE8+LlLT5tRllbrELabHUKHRqBfeRfrZjvNsNJD4dZTbYfr8/dxkK0nXFqhAbcaumJYnqxanE+/ZfYd5/YrSHy9gDxPHg3rBqNYfIR2dbX999+EW21YhLNuf7/UDsOcGJxriULorezi5vAT4zr3lmaQS+8tzpNRYH3QLedigqZ5me00wsEdaJ7zZ+kPO4Xgg0MHgCbQgsQ4yI9hI+MW9XX1UeJXLViI/0IaiH0WFFbB6p6j/HLJWwUhdW0Vmn98owHow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p8BlqHxyrHGaLAo6ZdGtha6uc4KjCbkowkFU1uUyO50=;
 b=bZmwJAIRVfZX7pAVkop8rH0z14oYFsYPone0EEaU7bIEJML49l0FYK0JNqG8w0KAz2zOh6LxvcEmeqdTV2JA2ScQA/g/Sycm7ua2Yky96FwMkqHXGkH2kCidF60OKvdoOOu/o7UUrzpxX4DcV8cEYJFeBAiP2RWqyx58LlMhXUKUn9s6a9X5QdwaHliSgTZ7IV0rdsVzvMVyctRjypRspSYu7MG1+ouplRPXnWkZRnFduT/9jBHGbhkTje6jqlRSNkFdLZjtlx3CH8pbFqnnC2a3qZkRzXLLnuyLz5Eal/GAyWz2pFOpyDqXXDcorVx6R0zVmQGFsW+4uBW4bVOTVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by PH0PR11MB4999.namprd11.prod.outlook.com (2603:10b6:510:37::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12; Thu, 10 Nov
 2022 02:48:16 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7%6]) with mapi id 15.20.5813.012; Thu, 10 Nov 2022
 02:48:16 +0000
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
Subject: RE: [PATCH v2 05/11] vfio: Use IOMMU_CAP_ENFORCE_CACHE_COHERENCY for
 vfio_file_enforced_coherent()
Thread-Topic: [PATCH v2 05/11] vfio: Use IOMMU_CAP_ENFORCE_CACHE_COHERENCY for
 vfio_file_enforced_coherent()
Thread-Index: AQHY8wx/4yUiNnfe/Uuc/NGC82paFq43d4Aw
Date: Thu, 10 Nov 2022 02:48:16 +0000
Message-ID: <BN9PR11MB527607506FBAA463ECB181658C019@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
 <5-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
In-Reply-To: <5-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|PH0PR11MB4999:EE_
x-ms-office365-filtering-correlation-id: 32b9012b-5b65-4bb9-5fc6-08dac2c604de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: odD8oyb1GudfsYkR6K0h4gMVwiWs7sqmh2+cKaiibkZssTTFqNyq6AF0vj5Nf2drOMHGppsq+HXX0zxlDCPx5pUTnO4DMQzJCinHgwOWJxBrDmgUZW/GcwqnFc7vdW4XImLWMfeUj8QqaVFjvxBX167mLOEeFLAuZhZQ7mXnhV6ap+g0G6vbhdHFInYAU15coo3Dz6TxbL/Elocn7Ji1pQVrhwKKCmZuimX1bT8YJfoZHD1XjwqCCr5gIrG971QxAr0s/8m35XtRqs5+v7frebyB2caGcf8rEFsxo7yuS9ox1cTt6VcOzSEwkPafusOvtak2eKrI7IChEWPpI3DVZRhPpdHUPixAN8vVK6WYzKiLuUXR9n3PXgXPb3ayCLl+kyXwKxdse+aFOWufYB1gJpqyo+fQER4Ig8G5lBqVdzc3O8zlapvSCuK/2HnqjmGXQ3fh0oUfGw+kFmhpVbQspf9a0LWrJK8Z7EMIxiND+dEHHjjwgJ1M/zD6i/ASvvjBZoytseCRUL2gNWWxeUTETdW69y1BHgM2cVzzcnwzuUMVy4OqIHMz7agLvX8P0jwulkP5dCXAg5vQNwhSchidxkwJLsqC6v4h45r79BmsXGI63NqZ3KDoWTQSFHS3jkjC8BsF0foFLGrXDCpXgfx33aHc4mq3b3iNeLUZNxwr3DMWnm7vJ0A7jcHpaxKXau5Dnq4YzN8Nu+0gWb+L+NclFOJswI9awcTr4kXAZgxNGyHUijenTMJbTpFfUeyJrhHgzq2reTiemh6LVtXhW4HwB8feidGG2W/V7lsNJMKyhg0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(366004)(346002)(396003)(39860400002)(376002)(451199015)(71200400001)(33656002)(82960400001)(7696005)(6506007)(478600001)(122000001)(55016003)(38070700005)(921005)(38100700002)(186003)(2906002)(5660300002)(8936002)(52536014)(7416002)(110136005)(6636002)(7406005)(54906003)(83380400001)(41300700001)(316002)(86362001)(66946007)(66556008)(64756008)(76116006)(9686003)(66476007)(66446008)(4326008)(8676002)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6HrE4SjfApx0897gpBNDIO8hAyBfU+4pFw+7dSCUP+CFIirt7norojP5tP6l?=
 =?us-ascii?Q?MuchFHTVg9YwC3DfkKs2diZG2ZSCF04a0+t4vNNn38Ap07OGgRLaH3FzuTlQ?=
 =?us-ascii?Q?gzkDLcHjiI9YPBVFYL1Kc/7/HRyN7IbWZ9a7WFQqImLlgErdB7ZFdRqzIsM3?=
 =?us-ascii?Q?JFKJ3obna/DzSxdwHBJmAWKFtWcwZ1IJsyc71qyzNYujbqRqDxBot0lTOKSz?=
 =?us-ascii?Q?4C9fcJJEpBSFGARJyQEYzzcrbaQogeZbZucJTF54+2Sr5TmxlBKAE+45wC8a?=
 =?us-ascii?Q?QCCrFGc7rxbB9C4x450663laQ9cYSyDKsuOzRO0XOSxwAuYa85VC7FufBmbn?=
 =?us-ascii?Q?cE5F2x8gzXpr469z/ZV9aVmkpzxUTFCHMrJbE4vv3kEc0eCtbUHSOGrZ39rz?=
 =?us-ascii?Q?vtWIgBwZfPJiYhFRql2j0X9C59uvqS8Xgiya1vTrAL7sCvGNULMfYV6323Nd?=
 =?us-ascii?Q?0RWHSKMAGIR7Z/6c/vI6w8Hx6zp+Dz3JBLP8+KzJka+5n9vgg5kVLBSAgm/v?=
 =?us-ascii?Q?T5XFlnE7+8fqM7nno9IKIR7+QmMsFGZ9LurWN1pkxqmLfDwboMDQHXvvH637?=
 =?us-ascii?Q?vhFC2mkcHxqCpLGoVOtBxF5xX4KuC/Gy43pgPqqZyXewBzcpndLyCM7YPGMl?=
 =?us-ascii?Q?T6YPb/Cfdvpd0pRGMF+XewVrJddaSlzP+QvZ/hQQW5sat0DtXIOOp+/ACL7l?=
 =?us-ascii?Q?Lb/4DAmz/AcuXt/lIYgmkkhFWrSsKs+kbHTXHVrUeI30W1Mp7R2fhqPv6eSp?=
 =?us-ascii?Q?QiVWAGWwh5uTqR+v3riBEzt0/kwIMDw0io6FUNtGdkQ1QfOPuGRgfDQM2dC9?=
 =?us-ascii?Q?BMenZY+d40i3MHhN3tOH1DjPi1atutgkG6NSmXcWJ6fb3e+rY5zvS8sTwXoh?=
 =?us-ascii?Q?gEK5Yogx9LRwYf8wPAQr14zb7+FNsJsVlGP5MhODct3YIHcfUF8rVns90mX3?=
 =?us-ascii?Q?Ya0xgV2Ynf6lYOmw9pCoxq2z+OElTfm1e6huNgwKkrSl8KD9pX+CxghX2KYT?=
 =?us-ascii?Q?8mL3Pc8D3CwA6eLktuGPmhXJFQfXs4K+GDHD9tzBftDyjzbkFCkbFB9+LANj?=
 =?us-ascii?Q?vfeIEaldxNtpA09HvUNQPVT2N+FUAp7+9j2e1tcK+VkN+ydnAjGwsY9PGqK7?=
 =?us-ascii?Q?KJk29NL24rLkGv6+J/D6KCoHDv4N0P0vnwU3/CO4A81Oku1+L83PWMKShvhC?=
 =?us-ascii?Q?R9DheO+9HWfwaIeALXdhTPRg9r1cmsbvGZSOo0geBmstZk3Lxq5Lmd0SYiHS?=
 =?us-ascii?Q?zhkiVLczCEwW8ubI0VAN5EhE59VMpsoImhGtj0og8ShWxWDIPmzvEeMha1V7?=
 =?us-ascii?Q?dpNSxNXD25rd9qcCADQJvOvQ9xlodMy9Lc1Za+DxIUHUf1kI0vzYLLJ9DhNw?=
 =?us-ascii?Q?f8FKAcJlDyYMsUMMXIXp1IOqRrznBY6KaCJS4psorU5lgjRTSskHSHZDr6AW?=
 =?us-ascii?Q?DKeUI5inQQPB1NWyM5CWmM9fjtPU5EfJweN6bTzKRcXj9PJ7I1buMMpjtnyF?=
 =?us-ascii?Q?R9gur2p/r6NpIYUCfWDpKt8L9T3D76Zh3IbcuN96y7qw/iwKrTHd5A2RDixR?=
 =?us-ascii?Q?LByXha9pogIVpxusCSO+BRehbEJIjJ3+WvLD1ntZ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32b9012b-5b65-4bb9-5fc6-08dac2c604de
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2022 02:48:16.7185 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ezsMua+7jZTnfiiDByrcYOm5NVuVvUcwiPmnED1lKPXrflzWbziGyMDJssURJ10VxMUKvysFDEiJR/OHKc4DhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4999
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
> Sent: Tuesday, November 8, 2022 8:53 AM
>=20
> iommufd doesn't establish the iommu_domains until after the device FD is
> opened, even if the container has been set. This design is part of moving
> away from the group centric iommu APIs.
>=20
> This is fine, except that the normal sequence of establishing the kvm
> wbinvd won't work:
>=20
>    group =3D open("/dev/vfio/XX")
>    ioctl(group, VFIO_GROUP_SET_CONTAINER)
>    ioctl(kvm, KVM_DEV_VFIO_GROUP_ADD)
>    ioctl(group, VFIO_GROUP_GET_DEVICE_FD)
>=20
> As the domains don't start existing until GET_DEVICE_FD. Further,
> GET_DEVICE_FD requires that KVM_DEV_VFIO_GROUP_ADD already be
> done as that
> is what sets the group->kvm and thus device->kvm for the driver to use
> during open.
>=20
> Now that we have device centric cap ops and the new
> IOMMU_CAP_ENFORCE_CACHE_COHERENCY we know what the
> iommu_domain will be
> capable of without having to create it. Use this to compute
> vfio_file_enforced_coherent() and resolve the ordering problems.
>=20
> VFIO always tries to upgrade domains to enforce cache coherency, it never
> attaches a device that supports enforce cache coherency to a less capable
> domain, so the cap test is a sufficient proxy for the ultimate
> outcome. iommufd also ensures that devices that set the cap will be
> connected to enforcing domains.
>=20
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
