Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB916623B50
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 06:34:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B40310E662;
	Thu, 10 Nov 2022 05:34:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AE8510E09E;
 Thu, 10 Nov 2022 05:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668058443; x=1699594443;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6Ql5lYuvy8Bj27wqlCoeH4CuRDS3+snw7xjE5rp1FDY=;
 b=AUeRQ/ipUVak5CLC6drsS/99o/hSvkbw1VUgKkIF8DjA1O7O6AtW3ZJj
 Or38Pu8Wh3sDjE+yDcdQn+cdH17cQHxFYC04n9jMkTOAYlXc4cbQgjXzZ
 SMS9wTd4SOaBg2VJp4itR4fqVsknieDMQrQAIqNI7rqdCE4GtRS3o1lU/
 a6cBlRH+uC/JV2/FOMJ2fcdySMpxJFL9ERPjRv4i68kW7jZesPBcTj4/P
 N1CktQAbrpUb7faXxv5IGc4PRuNNWikKu+b/hyDQ2y6Bl/yYhhxR4ppSB
 odSt7fvfS8DiyIPCiDA9Myzyauu28/9y3yENOS4u8DkzUvrLjhkSy0O38 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="308840984"
X-IronPort-AV: E=Sophos;i="5.96,152,1665471600"; d="scan'208";a="308840984"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2022 21:34:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="779637047"
X-IronPort-AV: E=Sophos;i="5.96,152,1665471600"; d="scan'208";a="779637047"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 09 Nov 2022 21:34:02 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 9 Nov 2022 21:34:01 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 9 Nov 2022 21:34:01 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 9 Nov 2022 21:34:01 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 9 Nov 2022 21:34:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NZ2hK1s97nFDRT7FsTjK7WJpRC36hpDuqxXx1lxwMWKhZqGia6KLHO3KNqNXnozAmsvcriVk2SaFhGxtgi42ZPvW4b+a/dtBqe5zcT+TO0L02XgYTJ8ncYdeOCNu2Gf34uK8sGL827DbBiR1fnqbX104nX3z2VF+qkifW063dn2E6hwQtXX7OGKDs1Z5RmQ5wXemEXH44hdvzRv2b4HvJ9F/lTbYxQMP+WfEJQftprVvtXoTvIJNfXbZOhnE5W/cm1D1v6DpcMqmlDf6s1JV8e8wYGpo1w1D1I0XiNo6Iy18V/tt3XAY7HOvvxaDvi8oHuYdBIxeB1NUFn5wLq/6Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Ql5lYuvy8Bj27wqlCoeH4CuRDS3+snw7xjE5rp1FDY=;
 b=W7ziRUqEIdfle0xqsAou0sJlALTJwsEkJLV4rRt7mKyKTajEKswHdrO3O7jQYBTp8jN1cx+mWnJ0lB2BBrDXoHgapnh+N2oI6qe6wvpg2fn/q8wIjCFY8tT01+kB0Bo9raW1v3y+DpOc0E+jmQD6i0dpQkdpc7OL8DTwBi9rNt62Y2KCeGuZfoqCxC1UAjt1r1Y6Nzosf0q1wLs/TB9eJ+DzarJ2FCgOPNFmm3Q2zXpGWN84bLk1JIEXCYwkNYDbUjrmnPTDJbh5aa3f19Vt5w9XVHdj6j1KTykDmaFl5gpYtgVt0D4huCO1f/EDr7z7yvrFDPFjdVbivPPqKK5qcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by LV2PR11MB6046.namprd11.prod.outlook.com (2603:10b6:408:17a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Thu, 10 Nov
 2022 05:33:54 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7%6]) with mapi id 15.20.5813.012; Thu, 10 Nov 2022
 05:33:54 +0000
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
Subject: RE: [PATCH v2 08/11] vfio-iommufd: Support iommufd for emulated VFIO
 devices
Thread-Topic: [PATCH v2 08/11] vfio-iommufd: Support iommufd for emulated VFIO
 devices
Thread-Index: AQHY8wx6rIsjRsa7HkeXFSvgQ3pBSa43pYbw
Date: Thu, 10 Nov 2022 05:33:54 +0000
Message-ID: <BN9PR11MB5276592240B7916E23E94DDD8C019@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
 <8-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
In-Reply-To: <8-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|LV2PR11MB6046:EE_
x-ms-office365-filtering-correlation-id: 1fd67505-30e9-4c53-e210-08dac2dd2821
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gD9OgEPrMQ6lLmH6xgkUc6iR1YqqPGx986Er3uEGYbDlDTMFyTs7bbjMH4rWkQbTixMhXCUVvzI0Saqr99XDnJiTadAqcU0YutZTbC79iG8fWEcbdWIY63olIxn60EOEviVKzwnfWb5WmnQEbUq91AqNUzt30p6cRleLU4kjsHXk09dpr5cnSt/PQw9oBHTf7uiaSbzjvbbddSSpXQplvnxUpSjMYDXBge6ZWOfprvOkSSV/i+QAS2rDlnH2PanvspouPnDveZYGvDUxbJpYrYLhUIVdhX2jwgc+DLuW6AKzqfwBMX4lVV/UPjI9HPXL1iWX/sHneHim+iRQy5ZzPxvdNr8UzvwNC2tjt3nlswBx1cnFRxpW0g+F54HJ268lMYbn3X59GuTraYH4GdAoDDjX2sdNhDQHbU62asaLqI8LZezoeNoxUutf6fpO8X8T8k0hdGQchYgo5rJOceYe1LOO7lrTqYVXhQY/Gh8rA1EaTwuUcnjCLGXLu/Eussclk4URhbJEX08+eZYbNJRD3jWuqrPpcwgRQTAOUry2mFNaCqsB65IHVlOJWLfZAUlxPsFgXoJyW8pdspNBcDJ5nnSOzpWMVcyIGNeaz/JHq3TpZe5h1vBQ38GRoAhxVF3CAxDIWqLQCiY0Y2AA1PTJ+KqGBcYSfgIeDOpv9h1BlHbRmjTEFAGD0232DmZQZ3/wS1G1hA+IIxCrCYzgwIjs5+0RZvLv2QtM6eNKHXMr46r13IJj79VsCN+aB1OeFgP3RpIvKzTBZNWkRFjwRhPFKuIzS+h950jNZ0hFDw/my18=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(346002)(136003)(366004)(39860400002)(376002)(451199015)(478600001)(4744005)(8936002)(52536014)(5660300002)(38070700005)(6636002)(41300700001)(83380400001)(38100700002)(86362001)(7406005)(7416002)(55016003)(7696005)(9686003)(26005)(6506007)(82960400001)(71200400001)(122000001)(54906003)(66946007)(64756008)(66446008)(66476007)(921005)(66556008)(186003)(4326008)(76116006)(110136005)(8676002)(316002)(2906002)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4ITizG2B1h6t035FMSXokeo+2LD2ykQ0gCmMc8vaNV/k6h1zkppuGvbeJI7B?=
 =?us-ascii?Q?BlUHr8Or3Echh+LIAPj2rphS998jsbTlsYJUJcZzmRG2ApgdqlSbzdAUtShU?=
 =?us-ascii?Q?PPApC5gYxtNFuA12KvcJpP/13WMar46QfZmWCH4OUOuSqQrTQKGr6X4Io7gZ?=
 =?us-ascii?Q?tKsacMcOAhKvFnYbAEBJIbXhiRLWA2J5ORlOKdaA0YKtbMXUAKg1y9n2aHHW?=
 =?us-ascii?Q?/e7Q7A9U39sWXxfF37Kc5gKinF2EPaQun1LAAXu3z+57WGyoDFHVWP7zoUiG?=
 =?us-ascii?Q?rbFXQ5KhO72tSUCnU/Np5CUqJIm6DpvcCkcJXrL6l73bc2L75eiJAQHA/vYz?=
 =?us-ascii?Q?6aIQH1ma3ps97iq1h+4wfh7EygM7wGOuW+P5QKZr9syOCMl1wmd2mUHqCcrJ?=
 =?us-ascii?Q?l4LiH2twXqhwegF4lAecml1rPEcIra+tG2aJQNjkr8Lm+BdpWL5+hPc3DrUz?=
 =?us-ascii?Q?TybUJUD0ACbaglZB44OqBSCYtr+jVmSBLi74m3LM6juwIkqja3u/gwK3JRE/?=
 =?us-ascii?Q?d5oq2fP5QhxOduRfvS5EJ1zvqwlivnTW/qW0hn7XD7KHxteoseRmwB+YLWnO?=
 =?us-ascii?Q?+PpCBWrgPnB8j+Pcx5pd4DuYyWQeeIBpozqn4j4+a8pav2r20jdXKUBud3Re?=
 =?us-ascii?Q?n13bNQWsHLrqkjxVM+MW5JxQFTjWZsxIBYIDA89m09uRmULJPDC0QPJIhq9J?=
 =?us-ascii?Q?tPyWsxTzx/ZEoLcZ4yZsEjODDWwIXPXSVMJhTvjwZnpfAVVWIK8Z4Tm5Ssn+?=
 =?us-ascii?Q?sIgk42C/0CkpoZSNKFGm2Utc7SDLt4JuQXM1McuPxPcNfXnSnhXhdoOw/ELZ?=
 =?us-ascii?Q?iiao9Dl28Xf2higLN+fo2wef0vwmA93pMV4FYZzFekOw5yBqbMVOky066e3+?=
 =?us-ascii?Q?UtZ4KlyeAm8oUeY6xyP2cNHNYZb1EEYNnqIcB9HhG/pkSWRn0zG++Bq8jdc+?=
 =?us-ascii?Q?KKZr1GNCIWDSihBiQvGcSQHLn0ZZp358JMsiQHNIteJ780Ym1BabxxkUyv7v?=
 =?us-ascii?Q?yZtvg9L8h/PrUc5a2ELY7/rnKlFx9xH5tFNqEWMZqB68I9Wzsh+CY+Pmj5hp?=
 =?us-ascii?Q?U0iMbTtBZ/kdbysX9y9Yn+zRKYt3ObXEXoLNl+/rrip+bjpf1UKaw/KMHTCY?=
 =?us-ascii?Q?6sro6xvVhRMkvh61fmhokEx2Vbn9sfV/OOxaLtEJSV3gO8O46hrh9doR9ACN?=
 =?us-ascii?Q?lGughhVjUqsfV33kejpq83BBdcIsFnVJyx/P4xxBG3P9/uPTmHtQBoGih8vU?=
 =?us-ascii?Q?aFVJ9Ap3YGhzePYjlX7z4JcRVhOg7LiNf/LlEPxHtIKmxtLuUKbqY1Lo6fCr?=
 =?us-ascii?Q?oOoyaYRoNjDusIRvOwBA4VyAv3zN/jh35ug3MeHz1jOb6kASdlfbDtxI67Js?=
 =?us-ascii?Q?bIiYmbF5L+btoDH7g50p0YgfgmsQrX5gclh4Chm/4wzi5FdtcTfBoKgVscfZ?=
 =?us-ascii?Q?npyx4yHbKYQiTyvPpj12JKjlUAvu8JUjPIwI6UJmhw4Mur+74DnyU9QlFG6H?=
 =?us-ascii?Q?bt7B2l2uj8Mib2iG5DQ9JErAmsE6U2EWQEKVnjXQUWue6UP6h1DxjA71jzDB?=
 =?us-ascii?Q?MmhQHtMZXDAIxm+51p5dv4v3U8TRtQbpUR4xzmjj?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fd67505-30e9-4c53-e210-08dac2dd2821
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2022 05:33:54.2591 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nCSOacdwrCBEFOIF66qko3ZsOirLMbtk1qGummJYytWDsHnkVhUNIgaZTtUHetM3G3CeoxV/BP85rqQJC8iksQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6046
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
> Emulated VFIO devices are calling vfio_register_emulated_iommu_dev() and
> consist of all the mdev drivers.
>=20
> Like the physical drivers, support for iommufd is provided by the driver
> supplying the correct standard ops. Provide ops from the core that
> duplicate what vfio_register_emulated_iommu_dev() does.
>=20
> Emulated drivers are where it is more likely to see variation in the
> iommfd support ops. For instance IDXD will probably need to setup both a
> iommfd_device context linked to a PASID and an iommufd_access context to
> support all their mdev operations.
>=20
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

this looks good to me overall. but I'll wait for next version to ack
after the change for s390 is settled down and incorporated.
