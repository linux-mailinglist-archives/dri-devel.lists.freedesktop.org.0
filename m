Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B69623A10
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 03:52:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A062F10E06F;
	Thu, 10 Nov 2022 02:51:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6AC410E06F;
 Thu, 10 Nov 2022 02:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668048709; x=1699584709;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qeog/SmnOIekzb4moe9Ls//JvhyKzqLE0AI0VcCVRwo=;
 b=duxhm96k++awGDVD7L+uRqPt3TpBtHHBINw6hym0G6FhCZp6OfppIrkD
 8FJDWLzg32dP0NdmSwxuMWm/FzIkF3m3f3i05ScZIOwl5BddMQpmTC+Ux
 VWav+CkSxUTxr+SKQkNE+KoakD+y1u64Kc5D6Gy75U03j0Ul/W7wCYH1Y
 vFXMsTb4gkFl05LvuBaKwC6MDDPn99QBbQZBUYyFIbsjTGnSDTTpGM88b
 xgmIqpixwVpJJTRY54Net0gX7BJ/PfwFwMB51czb+BQqw73NTmnMlgWfI
 GOa4xDFxfB+kQBr/4EByJ4F09Jdsr0jD/4yCRQdj7wihhWNldcUN+4TxN g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="373305175"
X-IronPort-AV: E=Sophos;i="5.96,152,1665471600"; d="scan'208";a="373305175"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2022 18:51:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="705965560"
X-IronPort-AV: E=Sophos;i="5.96,152,1665471600"; d="scan'208";a="705965560"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP; 09 Nov 2022 18:51:47 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 9 Nov 2022 18:51:47 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 9 Nov 2022 18:51:47 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 9 Nov 2022 18:51:47 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 9 Nov 2022 18:51:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fek/ScTyqTHWyA5JjD1HtA4L2qulNU49XEtPglWvFeea+e/D9KnxXazf9TTN2qqMitK1YadRWPsQDeke5+lc+zROHKp36ubuPoDVTpZUUQ5beJiOd7DyWwLpt4icVIM6eCaY/2uRxP+BwSPXLJZuXYlgN+fz+LCjqAti1Y/vPIAnBW1PXakh3mDx2pdjUroBFvOWxIgXPwj7mcKWJ/Q5LqtlIOpRE+bYrHQEuTIevPvr/bTznuqCkxznBk1I7E0hsnJn6+xVUde2AFWnrrJp1Q2fnYMLoi4kR1R7gDnnVufYbqOnf1zALPw9eyZEMULH/NxJ7r7rljNEt82uxkt1qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qeog/SmnOIekzb4moe9Ls//JvhyKzqLE0AI0VcCVRwo=;
 b=beymk7FZ/FhlSGIeNDA6McIrPxTTg1IbeeI/BY8esyyOBF+8UXYYVw0ZRPbQYMi7EEd5kxkLKYzRPMFMVkifH8GbA30btS1+Gh/TrqOtI80vEttSfumOWmm8tdw+7nIftaaJv3RKgFtsIrYAk2hePiIpdWSbXxyDQ3FdGMqfYGuPJ+qx6fE2anGDI/0r/bBUXddQF9Wb2S7GOq9eQxKd8awdGa4FvmyK0SGY1q/Qa/JejqLIUwkocKeByvKh0PxiCMrtgKIWJfJzTnbjONYs2tJZ7tJwLj7Z27/W+wWHvKZ5Kz5k+MaBqh4kNyCtFvTp67HrKzNxdx2Z2VnVJg0pnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by CO1PR11MB4804.namprd11.prod.outlook.com (2603:10b6:303:6f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Thu, 10 Nov
 2022 02:51:44 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7%6]) with mapi id 15.20.5813.012; Thu, 10 Nov 2022
 02:51:44 +0000
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
Subject: RE: [PATCH v2 06/11] vfio-iommufd: Allow iommufd to be used in place
 of a container fd
Thread-Topic: [PATCH v2 06/11] vfio-iommufd: Allow iommufd to be used in place
 of a container fd
Thread-Index: AQHY8wx8K+epG92sLUueUyADGOn1UK43eIlw
Date: Thu, 10 Nov 2022 02:51:44 +0000
Message-ID: <BN9PR11MB52767309DD478729EF537CAA8C019@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
 <6-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
In-Reply-To: <6-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|CO1PR11MB4804:EE_
x-ms-office365-filtering-correlation-id: 638b2264-eb1f-486d-853d-08dac2c680bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WTfxpovLeYkd7OOsqc9Cb4K3L9AVezYiCOccB/CeUNTS69vTauL7+g7S0Af+QoGT3Mpo9cKjMgPhN/hfbdsFJov+hdKVlZKFHXyafHisOOAICQC5Hsh3k7iCnAB9Q9tuY6P9qbHOHO2vkd80gXa1HtFAAjf9ZMoDpnCgsBLsgKo25QLMRHDUMzcnRJWhVx41McU4BavzipfbL7ezygdNpeihWlYTRxIDI6bPgZ8FDFAcjzHdvToX8IfIOq7NCbhTM5CSj3aEcRkWgVYXmKOo1iswH+cH2Ir9BY+GquGgEybmdU2LRu3JgY5i5xy1iD/2VKcd0soo08C5vva4tEdVGFD93kvVv3K3yxpNkFNFh8ueSuTk9SajgEq/317fVr4m7yP+Z5qi3fJqp9TPdYUMD7xJQC9obNazvoWwUyQfveX31mH4NEnVLp+7Hrp1jqVo7o0U+OAwXpiHEI765JR8coSnCOM16hGYp2HapwCl9h/Alv4Fu1/2qr0av9k3uV87Nm7TJKH778QgXH9pd9eJp4IGLaHbZh9q8ilY1gQC85Zl8e1Tkf9Z/EadXdP8v49CGtJiC5C191DMlSzoV2ZXTa6Q2ZAc92dRqFODRxLx5v2kmndE0RdhTIoLtHJ8FXt/5eg67TXMjQTGKyv3M04RsWbPuEP8rssPzTVGvY6xjKYN53ZtWR/Ape6bJTrzOKSs/gFHI0ybiUybGzdJwgyZdvYob7k5weKN3qHAgnUC7Ti7nFAZRlrYsbubovSdTBw7Wbc6ZYKK9wyeXxEAgbn+0+cB3ttJnuhGPHI1BBirp0g=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(376002)(366004)(396003)(136003)(346002)(451199015)(186003)(7696005)(6506007)(9686003)(122000001)(38100700002)(7406005)(2906002)(7416002)(26005)(55016003)(6636002)(52536014)(110136005)(71200400001)(8676002)(478600001)(41300700001)(5660300002)(4326008)(8936002)(64756008)(76116006)(66446008)(66556008)(316002)(66476007)(66946007)(54906003)(921005)(33656002)(82960400001)(38070700005)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TmedhKTad4eYfP1JAuTDkHchylvwlDb0q3NlR8YvMbzP5ybifsKX29/f6f8f?=
 =?us-ascii?Q?5Nn4dLgX9jrSypKJ9LImFUHe7sLtne7v3wNYB2EKvhuIQjcSydnSP4qYVCc/?=
 =?us-ascii?Q?ldw4pybldZtGcFPQYwcqO9M+Mwcf6Rh5LLcdXa7CBUYm2OhmLyeuIh+t9zzD?=
 =?us-ascii?Q?6nO8yWha8xoBX1wlbrxdVnLsRuiDg1YqZzcYDMpQ8I+s2fVEr4JlI2nqluYJ?=
 =?us-ascii?Q?5lab0U8SqysE9oqUAMtPaeJYih/SJQyavsoeL8HqhCEtiLNBBqDu+F+2Yk/1?=
 =?us-ascii?Q?6E1gMP5WHD9+LZimLpH0hYOQAvhPR1CjPluSpfWSpR5b8iOOFun6mp9/MjgG?=
 =?us-ascii?Q?/0CWt5p8NzdUwk69vWz/lRaY0DcucuncnmLMr8QURBlt5UEj4OqJN8chlihs?=
 =?us-ascii?Q?nBupa0+QAqphDOZuMJ5Znyr5DvVbI+PzbDy/jXyzmQWmYea2ffFL1P1gaR66?=
 =?us-ascii?Q?nP3wMFRAALi2N0WIFxQ08F2xme1rtYiAok5KC+BfvxI/UuFlJhgcsSIpfhsU?=
 =?us-ascii?Q?CETfSiFus1VIpCPZHMJy5bT72Dj2/Z5R3Qh4zD564fuOrMqKEr5FL7E/ayo+?=
 =?us-ascii?Q?dgOfVqK4FODXdkcYNkHYIvpp3cqqNlZa46geM8a7/FjbMtm4sXkZQ1M2xxUJ?=
 =?us-ascii?Q?/Fdrs0LiEgKV4Kk4ytczrFiO6f0RbNIwhISVdCwBbMuTnUT/cneOFjHBE3i0?=
 =?us-ascii?Q?DtHGBVBsIjkhLIkPrvTegKs3+1bDFXqZG5gfNbXFm1aVGaEOmoDRV8M+j17S?=
 =?us-ascii?Q?5y0U4aWnuas9gNBF+QqYV/gSCOiBGepN6+9//OFHlfP9S0KOcwkQYyZ9cRTQ?=
 =?us-ascii?Q?xiujDnzkSIt+bEE29o6RCZelbLx8dagNtxOc439hlpJrjatZFe8ABvoeUF2D?=
 =?us-ascii?Q?U7ei4hcdvK30lY0+l3fC+M+lJbM/TlBJGJMKqYzqo5+hadCjWC6c5b2vJ3m9?=
 =?us-ascii?Q?PKQXhvztsbaKJBGpvESXAiQruMetzNoLbE2vFMu/wwhqN/LyJWR27e8gAC1L?=
 =?us-ascii?Q?aZELGFp2W88YBAJTLo8k9W42xbSwaHgaSYwuJMX/dAnqwA70wsWCLTeXQPbX?=
 =?us-ascii?Q?KSg1ARrg+JEsIskCQSqPagz30NjBi0FZIQwzMKxyIyU7Cg3cwi0/Jh293kR9?=
 =?us-ascii?Q?/+79pRcM+ROHiaPzhU2roqUdCXUgsMHsOjdCAEjU0k+nic/f31/450pizX0g?=
 =?us-ascii?Q?9TxYWsukaDk2XB5S5iOafQdKtRBcTInG0GByyJiShqpON4nZ6KpVIEBtYVoa?=
 =?us-ascii?Q?yuA+pVK8jUswYJoUqk04UyEP9HSTjaZDFsulBnmYjVIuyyJwGrfl84OWjEux?=
 =?us-ascii?Q?T0GDJJnCBio1vmzHHEK+dZYFHRi17ADHMz04QJyJVvfNm0bV7fDZZ6vuPmh8?=
 =?us-ascii?Q?zIGShVZwgBwa1attc3Owx+/BeQWelK8WLHLde9wS/sH5OC4+afJg4J24xVMJ?=
 =?us-ascii?Q?i6PZT4PCmbEPQ0mbMhlBoppTU36R3+7vLSzIYqg44T1D1i02bQb/J6axeAWn?=
 =?us-ascii?Q?PGd+JponBRtcHDsbv3yeevJnDUxo363bHyuDKoarrPXqzvFDJmRKsdl13a8C?=
 =?us-ascii?Q?oazH0EAUrrUGps8ZkMbcjDlXDP/Pl4Oj43GiN2J/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 638b2264-eb1f-486d-853d-08dac2c680bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2022 02:51:44.4964 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C6G3fS4ueYm6vkm7M9Lh2GpUzEPfYjLLP1y+r9iW1a03h3ipkwn/ggCA3xyHsI1pjlqxV4rhGyl/BSfHOFt45A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4804
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
> This makes VFIO_GROUP_SET_CONTAINER accept both a vfio container FD
> and an
> iommufd.
>=20
> In iommufd mode an IOAS will exist after the SET_CONTAINER, but it will
> not be attached to any groups.
>=20
> For VFIO this means that the VFIO_GROUP_GET_STATUS and
> VFIO_GROUP_FLAGS_VIABLE works subtly differently. With the container FD
> the iommu_group_claim_dma_owner() is done during SET_CONTAINER but
> for
> IOMMUFD this is done during VFIO_GROUP_GET_DEVICE_FD. Meaning that
> VFIO_GROUP_FLAGS_VIABLE could be set but GET_DEVICE_FD will fail due to
> viability.
>=20
> As GET_DEVICE_FD can fail for many reasons already this is not expected t=
o
> be a meaningful difference.
>=20
> Reorganize the tests for if the group has an assigned container or iommu
> into a vfio_group_has_iommu() function and consolidate all the duplicated
> WARN_ON's etc related to this.
>=20
> Call container functions only if a container is actually present on the
> group.
>=20
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
