Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17ED8623A35
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 04:11:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E228F10E64B;
	Thu, 10 Nov 2022 03:11:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB8A510E64B;
 Thu, 10 Nov 2022 03:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668049882; x=1699585882;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=t/ex6ixnemJWJyL8qoTUfT73LzbG+f6ygem60CVlNMg=;
 b=UbErhJRZPKfPL1FB9bnhOVjgEFzBXFG7d8zzDUBLxCzyKqIsaHLpyESg
 Vkv9JGu3ZJxld2DogELJn1hheX0e1DbLX1WvyE28Wwzx23nMeoM+XWxF0
 aNYnnq9vCec7EZldI8qbd+nZNNrTjNYAw4vNdbTrU5+H3FuHshFNprjAk
 R2dE3GQl3Qrka43a+SFueDPn/zsliLKkGdlWr9Fdika8L/TospLpRO/Qg
 6MRHTiyFK5EVLBawNkLX98UwC9DGxtCKrinDv6CwFd/vzRqTt85B7LtlF
 4Xd0A0IH8skAngoYwUWdtU3DC9WiFmT2C57Qmv4mE6ymSyFgtuXVmBUHJ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="312964072"
X-IronPort-AV: E=Sophos;i="5.96,152,1665471600"; d="scan'208";a="312964072"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2022 19:11:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="726226563"
X-IronPort-AV: E=Sophos;i="5.96,152,1665471600"; d="scan'208";a="726226563"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 09 Nov 2022 19:11:19 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 9 Nov 2022 19:11:19 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 9 Nov 2022 19:11:19 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 9 Nov 2022 19:11:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JdP0zemE777sLbvB5kabHjtNhDIo8CXkIigGlq7djHvVWR1B5K6QgJpdfzA4ZkBkcFZ1xRheiDv6+91as9P2BHKlj1zh9sgFMfwKud+ECPKvSPtLHyDQI0fNuNe3PFpUrqwnhD2rBDAD5YZEG9RFsTfga02eRfZoux36Znf1NC5EnV6/VKg0Q+LjHVcxA64VscC0v8oV0erz73VRMo1m/hiS+4RoLK3UjkfRMPA+ifTuv0uOFDyc6K+ONUbNxpnCP/r5NG5ra/X3XTVO8G8yMaTPtVNi+uQy56+EnFMhuX/2RaTcTi4rhypTbpsWSyNbkX2SCuoytbflH01fmhNZdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NbjLw7H4oPsaJz9dSE6f2SZWyhgfdJlafvjpro34IEg=;
 b=csCAX8HC/ooXgCVxE0Fm1JRxXpLNHVYGuHJChqkshIvtvVw2gtxlJEJm7Qct2QnkofdWRx/Y8cGqCq8vzlhQOSF/BioOo13/sj4h8rnXEG80p6h+p/To7xwRo9cU6hNMGdr2ovvS4Bz4ok/dsu67O4wcKia+juD5l1QZxLx/J+yYDfnAS/AQ3Sx0l7lM42zZOqVU1XtEhf+WZMm47qAKLYVVZvIZ0hk7EpmSbtcglbpt3y2uKh7H8l9UW0VKb+ktVrmo9+AICbdlwNSU9K+kKlLaFbPxfh2KL9XYdwJu+Czzodvhe1AAA2pyVOWKL5WDeo3HuDi1g93p/ldzUPUeyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by CO1PR11MB5170.namprd11.prod.outlook.com (2603:10b6:303:91::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.28; Thu, 10 Nov
 2022 03:11:16 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7%6]) with mapi id 15.20.5813.012; Thu, 10 Nov 2022
 03:11:16 +0000
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
Subject: RE: [PATCH v2 07/11] vfio-iommufd: Support iommufd for physical VFIO
 devices
Thread-Topic: [PATCH v2 07/11] vfio-iommufd: Support iommufd for physical VFIO
 devices
Thread-Index: AQHY8wx4zHuY1VxYskGoQhcyiXm8Ka43ee6Q
Date: Thu, 10 Nov 2022 03:11:16 +0000
Message-ID: <BN9PR11MB52766AA1ABD4EEDA30B696C98C019@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
 <7-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
In-Reply-To: <7-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|CO1PR11MB5170:EE_
x-ms-office365-filtering-correlation-id: a09e9c13-c18a-4966-444e-08dac2c93b5d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2gtZxIHUbjzgE2l45Uzlng2zCtTi7dhV5fnR7tBaM8t29CmkKXZxNcHO/gYd3gVOEZ2K8dXgZ1QJKSXw6ROwVYZ5WaByDOpdzsmMUMT++PmV1W5NrTGoC0rR9QwwE5aCNLckltKuZUyqPVNpYaSxF7OwqGa9WKH5MIPbwp0L9rKo8vWJ/w7b1f6X7xADE34ZdUlF/ButaLBB7LlSkRn2Zbv+mmkY+vOZJUR79tAbfWJj0JxgrlbnpLkFX0cQVYAt6K5EAM/WZ8uFzVMIsvqZzYWB1SttyeH1vOYJGJ4ZG6vZ9JZDPV72MktvIZEHkt4vsbXPlXcq7iteqC1oiDL6E+9hIF1508lF053/QZmDa6VKGQw7wApVXBnyZVTkECz/SqSuFS6eJFX2kvUnIot4fCqAMirTIy90t33OjygTRyOm207KL636en7uLSx2b3/cooU6Fc7B3CO3rOKNwk2mlnD3C6O1Vz8qf5gOHuJX3z53AQuKl3uZRJt0Q4ccQzFhSWPfwFE3WNGjqe5zMdZoVzwWLNcdSKaXs5fQckv8ZMREJTV/rRkw0JGkQlbXTUIZ9CmUeU7uAqimPdLgeD/5tBOy+AjxSK/gb7dj9a3ffvJydbZDoIQ4yHjG8WiqZ4ODkIF6QE6MPgJbmHF2bwxDoYa22xVPjEcornroehdXwZ8ZvGG1dmAWem4yWSnNZVOwn9iiiouAy1aCYK7LMDDUKyIuTFBeSjMhHzwsXWRgtgralSYl0JSUm2Eo7rizqsc7FCu+s53mInp1DFBiJ7nwFQJT9QSnfFE0FX4FvjYBMQ+3UgG0wbvaRoelpwMMBTzw
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(366004)(396003)(39860400002)(376002)(346002)(451199015)(5660300002)(7406005)(7416002)(33656002)(26005)(9686003)(2906002)(6506007)(41300700001)(7696005)(52536014)(8936002)(478600001)(66946007)(76116006)(66556008)(66446008)(64756008)(66476007)(4326008)(8676002)(921005)(38070700005)(82960400001)(38100700002)(122000001)(86362001)(186003)(55016003)(83380400001)(6636002)(71200400001)(110136005)(54906003)(316002)(966005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?I6uQC3S8hbeLtxcESzZkfGxCNPkFJ/uH02rIAuHk2VhKYMPVX7pULAnTUhxF?=
 =?us-ascii?Q?d+CYeF4xLzK8XXX+9NOVAsg5gCzb23Nua1mvyD0AolPmmu9t1qcm6rpRbIJC?=
 =?us-ascii?Q?vGKy97KIE+pvrr4dUauI1MiDXG/FQ9nPKe9k5jKBbte1uirWjN11rOR88tG7?=
 =?us-ascii?Q?qGnDOtel8LoJaQP6jWhuhwPWEJVgmet/vRvksgHJ09q3TVtaT+RjcLzE8hC+?=
 =?us-ascii?Q?D3LkhJ4RtDqmFLhCmERj6gvoCNlYzIw0v9DrwyY/o3tZfIsGmscpagMxsDU0?=
 =?us-ascii?Q?+Bg8zfSzQmq1FH52n8HFuyAWsa1IE0O2XA7Bi6jUDzAQu1dIEvYdWsaq+Ji4?=
 =?us-ascii?Q?v5fsXUnSGsHAJMUKjYeG//TU0jC8X+MScVrCMExuXZMlBOiSaFOPB7SLAvFZ?=
 =?us-ascii?Q?C0ZEYP79o4G6phd9xOzZQU4+0khHzGB8e05moLNSul/pAyKjlLytFlmm7wWH?=
 =?us-ascii?Q?2no9uOdDan14XdHfknHoCJb7G85cucbuSm5Lr1wSPkia8xaKkUC3s3+z9BBR?=
 =?us-ascii?Q?K8d1WAdIcf4IC52b+YiohLhzALkvPtNmUdxCaNUKcXIMNnaXkl18Tv1nr+Um?=
 =?us-ascii?Q?OPRI2jn2b5Wa0vf70lOIDKfQ2f2jyai8d9dq9KicmbMY43sKfqD1SYeG1y0D?=
 =?us-ascii?Q?ZgKZBCV0H3ewxMxKcmRVv5sDo07Xt/IXprFEVWhx5HJb6tSOUeWg515N+lfa?=
 =?us-ascii?Q?0rEBttg49FQBhILELRAjMkzJMZkINOBxjIt6nwv/1LZD6AAxC0BB175t5eda?=
 =?us-ascii?Q?xmaBYGFWyOZdoTx6+TfWd/KV8YXkmu2wx6J34fqJJNqflgrrYFxYfE9MB0L7?=
 =?us-ascii?Q?Mz61R50aP/iFGnFzk51pRyzpsA68uXgbv+dc9PNr5NcI090+ywM6NmJQHf4D?=
 =?us-ascii?Q?PE5e6S1Pva84p6DdqNr3Zab4WVauS4n/vhpvvQk6KpjovxAlh6L2clW/tqvY?=
 =?us-ascii?Q?NMQCnx2QDqdc00AfkfdT40uykUSLLGQOXbDkgrAEvOC0G+oyTPrG9bCd8a6h?=
 =?us-ascii?Q?2dbScn06PhRMfZSU/94hIed4PcRH/UQ24nxDThVhL5ufTYQ5c2EHHaqqRImv?=
 =?us-ascii?Q?76eQOFQh6g7S5LRAiZAmZD8FpI8NvhbujiRIM/yGVa9Q2lPWhJqowJUfTT4u?=
 =?us-ascii?Q?FAxc/5yQNFvFeuuBVNFAdu4PL3rleT+1FmlbCKNaS+eHNqJr10kE1XsdpqdA?=
 =?us-ascii?Q?1ER9KQ3/D1MCmJrAojqU88IYZQ0PQDUVJ/Pae8mkIRfi84VnCXPJvz9TiFcq?=
 =?us-ascii?Q?1vBDi3mVj8ESskOpBGz4tdz6ddp/gSWFmiOwxKBMSAU+WNvXsiHurvNDGMVJ?=
 =?us-ascii?Q?FxBfK0sfIkZSS/4Brivt8TMxflaPCkNm+9Z1BFgGS+DkQeDGc87n8CxlnGGV?=
 =?us-ascii?Q?qCXIBu9n2fTe34FuG4NzcrvRk79RRc4H/hyrAVI6RB8znIS8RH7uRvqgUTQW?=
 =?us-ascii?Q?07TXE5hH9d8f3DTwvKhX48ezV9t93qrrYq2ghiSaVdxtK9K/xfEGmRmUY5c+?=
 =?us-ascii?Q?d0lJrx9nS5ozph6bK2jo+GZxSUw0VITslVHimV4KUizxtNf7QdNbgdSzFlgD?=
 =?us-ascii?Q?b3nfuA1Ql3jNF9eRsznk5T1Mcl87UT1EsuWaZ8YT?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a09e9c13-c18a-4966-444e-08dac2c93b5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2022 03:11:16.5904 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IOjebdznpu2XklrLvqrwRfBSkaYcn5dwVeIYOiNyHMGFO4xEVnbZm7pNt7ZaNEus4Novt6PzNuJvHUTOwH6p7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5170
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
> +
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
> +
> +	ret =3D vdev->ops->bind_iommufd(vdev, ictx, &device_id);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D iommufd_vfio_compat_ioas_id(ictx, &ioas_id);
> +	if (ret)
> +		goto err_unbind;
> +	ret =3D vdev->ops->attach_ioas(vdev, &ioas_id);
> +	if (ret)
> +		goto err_unbind;

with our discussion in v1:

https://lore.kernel.org/all/Y2mgJqz8fvm54C+f@nvidia.com/

I got the rationale on iommufd part which doesn't have the concept
of container hence not necessarily to impose restriction on when
an user can change a compat ioas.

But from vfio side I wonder whether we should cache the compat
ioas id when it's attached by the first device and then use it all the
way for other device attachments coming after. implying IOAS_SET
only affects containers which haven't been attached.

In concept a container should be only aliased to one compat ioas
in its lifetime.=20
