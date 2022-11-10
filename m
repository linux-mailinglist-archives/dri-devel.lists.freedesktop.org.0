Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E99D623B55
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 06:35:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12EE10E660;
	Thu, 10 Nov 2022 05:35:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D08510E660;
 Thu, 10 Nov 2022 05:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668058500; x=1699594500;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PmHh4/CI4RivUTuIhThtIxQKD0v7P10n32m1qmKDa+Y=;
 b=iLqsG/75xsLu180T/hOqloBecwpKRHj4PDY0P8HdRPLw/CzPR7xLCoOe
 /yT1zRElvGjJCBJjE8nIh3yGCdkYUOxqMt17J3JPZmwE0tplGYGwWKhkZ
 aMRxlhQehOF9SM20NN8EyUdMAbbifLicCvS23xjKvUp3PqoTvjYBgyWbg
 h7U+GEDEycxVFSUy3v8pT8dPOYg1Yl1b3uA8c3HL3ZZuSTJtvuS95958u
 N5FRC9M6pgNyO3iaWXyN3c3JL1gyF1mGrvg09wNhLtAkVxdITR1S9/zxm
 EvcRHEoS8pQA2awQouuO/XAFyw9WtD8dMlfFzhdRi00SZiLyR84kSCHCp w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="373333578"
X-IronPort-AV: E=Sophos;i="5.96,152,1665471600"; d="scan'208";a="373333578"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2022 21:34:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="588042164"
X-IronPort-AV: E=Sophos;i="5.96,152,1665471600"; d="scan'208";a="588042164"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP; 09 Nov 2022 21:34:58 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 9 Nov 2022 21:34:57 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 9 Nov 2022 21:34:57 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 9 Nov 2022 21:34:57 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 9 Nov 2022 21:34:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C8ZoQ8M0B67KaoCT2y3w7qnl9qhu7A33mQxweI0xacBlBSP/S8XdsEPnbW8Mnwz/IddV2ZqYE17PYReKf3bCa0/ncj7EqeE9w0MLJUP6cuP32exkVoyCQ5Pb1VQKvhoArWzvYmJXncF8KRNW2j2107vpP0vOxjYvcKrqk0O2MThNYWd7U+xlHYEVXBI437e/WWuHY4eq9HMP61596hP2PnAy3u12JPQR1+dVbrpmXlWrMM95qkldu668YwIoistcTrsyfEt0greUBt3j/Uh8mWzaiWhowVkVqmu7OWDFqU3E5cQ0+THNWL3tm1rP5jLZtRBjlvxYRtwEPh+lfn51kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PmHh4/CI4RivUTuIhThtIxQKD0v7P10n32m1qmKDa+Y=;
 b=GWNCRnsAYWLmNgqq422Zj6uiaXjpSaEqP0nn1d2g4z2NXBV0BWtKoWTk9czlMtyQI+dX9724yOCsCeiCaXNoC7n9Q41gMrTFbcxamjKMRQTyhMDDzYofxe25iIxRGx1l1LQDQls4ttsm09b1PxLTP7qEyYsXaBHPyvOnNySGx8DvoETQxhMXW+CojEMvS47NUP8A/LAU0VyOJWl61dzjgIABH9OmaNQWcnw7ZebwSLQJi9cbxPpoAvnJ8VoH9QVBMqxCKtBS96NYkTNkTUZuQTlAtk76xvyi5iqhQkzu3QeNeEEaWSKn2fwtkMQGk9t8wQpDvaxgNmiR/icIsT0IlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by LV2PR11MB6046.namprd11.prod.outlook.com (2603:10b6:408:17a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Thu, 10 Nov
 2022 05:34:55 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7%6]) with mapi id 15.20.5813.012; Thu, 10 Nov 2022
 05:34:55 +0000
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
Subject: RE: [PATCH v2 09/11] vfio: Move container related MODULE_ALIAS
 statements into container.c
Thread-Topic: [PATCH v2 09/11] vfio: Move container related MODULE_ALIAS
 statements into container.c
Thread-Index: AQHY8wx4cG7UmyFAlkWCdbTISATmoK43phkQ
Date: Thu, 10 Nov 2022 05:34:55 +0000
Message-ID: <BN9PR11MB52769BF8CD8DDD3758DEA52F8C019@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
 <9-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
In-Reply-To: <9-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|LV2PR11MB6046:EE_
x-ms-office365-filtering-correlation-id: f1a06444-71a6-4cdd-1837-08dac2dd4ca3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qGRqSkZZwP/2KRda93fPCibo+26rIe72s9MgxO2p/P/CVZUdyCgQoGacIuT6Nd2NqcjUeCFy7uBweM2+IF6q8WNQlgLkwzbMeALmkbzgSMCYRSY0yHFpcUxNgAxkX7hxtiQ4nWNYznusYIso746dp7FVDMnaBlnPUoNe3DhFkS6ypYmJGydktwsGLduiaHVcCoKolgsIMM/1wKEfah6Li1AT0eWhj5nDP5MGHVQXqDpc0HzwMAg93ZIyxiLUcT6vZz7XOZfiWRtE3rudwJXJYfdBb24EP7zwHLKAA+KxiLZ9KbFm64k7BVY1ZXdW5sJoG4d+2nwkOf3P0aXEswt1sa6fEdjCaYoFwqpe8WZodb37+14dPGdBA9AECot65UhP90Aru7mSvzLrDVDob2mHMPiRb7XBsuxHYeE2XBqtxudftdhkrzqS1nCUhMcbLDpzpdHwZb9dfosoCaMNJq6oCl9JQUpi85pGKnyUIvIoWgnQDhbERzOZpDfmTT8bQjtHWhiC2SBANSmC7HDiFbkdTQwO+1Rp555m475B6R3gKys4th3pS50/JR42yG0V7+GQNlDYPxlEH7GJy9+ve8/V6+6avz2+7LeGXYZJg5RuFW8GHxA7w+hKJ+Po+w2p2bd4exxlmuGYjDXmCchxvfYHNIS4ALkNR7nJ05Omj7wHJPAxSnJplZyKCe3WFCANX0Xd+tTU7Ojz2U07R6qV7KEXHuN0vURbczOLP6OgQVCZXqM49oN6VMqMWO80OeiKBiKYmh0UfyhA8Xn3cgP9CQzQYyoXvQ2i8JtCOF7MQ3HkhjY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(346002)(136003)(366004)(39860400002)(376002)(451199015)(478600001)(4744005)(8936002)(52536014)(5660300002)(38070700005)(6636002)(41300700001)(38100700002)(86362001)(7406005)(7416002)(55016003)(7696005)(9686003)(26005)(6506007)(82960400001)(71200400001)(122000001)(54906003)(66946007)(64756008)(66446008)(66476007)(921005)(66556008)(186003)(4326008)(76116006)(110136005)(8676002)(316002)(2906002)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rQf4NZhipFQCL0SqHzgLZntkJfvU51rjmS8HwnoTT8ln0Lwm+jqg5Bi+CKU7?=
 =?us-ascii?Q?9EfZkfcYkDx1qTLc+06fTkhL0ijbEtzaGAtQWyRxhekM1jAMwa6c+XcYNAfI?=
 =?us-ascii?Q?kIRIzcAOmx0MQnE4BOcEuTO4AopvkqUOCujoZ9UNoaqJvccYIzn7xzj8mAE6?=
 =?us-ascii?Q?PKhf7KGN1S3DeamVMvUN6Z9cSaIYkJzWLZ9LSoLRuhzi8kHmJSWJVuoD0Gvd?=
 =?us-ascii?Q?EqOtlGgf+qCNE7mh2yXUD8+Yf3l0i65GRhcG6ubIsUAwoMk3Pg6dkGForMRk?=
 =?us-ascii?Q?NXU1MqoI9pdOzdGsxtbQPT9Ab0sPsfcy/saD2ZJ9+kFmFCIlT99mr8ykS/ML?=
 =?us-ascii?Q?pv0Fn8UXA3pTch6HiHpaGAIETx9PJPxUWZK4DicVmx3oT6HgjsLIZ3QtRMiF?=
 =?us-ascii?Q?r12vltB3S9e/d/rt0OBDVBmtVihkXwzIosvmadH0Kw1FuO3BBL7dJbRVtSql?=
 =?us-ascii?Q?tU4GNPt8kLUVTBacMNq7KrYnQcA1tyvVDlRFWB07T9JnT6mU5gOe8yl7zaHM?=
 =?us-ascii?Q?QpaXfRWO4Kth0QoJQmlqugf55o0M2I1Mng5TbrPsgmP7mvz23wgWUSFyFV7s?=
 =?us-ascii?Q?icrMumMOgiRfqduHj2Qi3gdafW0VxRuXlYrFU8RC2B4xrxI3sVIi6WhIMi9q?=
 =?us-ascii?Q?EnqIJVgJbRx2tKHFefs38P/V54en5yJLdNZzLqH82C08neVnFdfb5s5xaoZk?=
 =?us-ascii?Q?G1H6VawiDXaa2R8/+IoYksyzZ3ddRYPYLn390Gz0n/UDljsbcVTAEqWRHluU?=
 =?us-ascii?Q?v0SEqHGHl5EmhmJc6ieQUz2vz3aHFKBmgMxwQo+C7Xxoj0tz9/0JHaNJIZrQ?=
 =?us-ascii?Q?S2S4EC9v4BxXXxfB6L1mRLOrPBfDbPq5vplk0Txl2b1ebniorOEur4T6Btxz?=
 =?us-ascii?Q?8YW7yXfunVTbZz2p2v//fS5NGIzsBUt2iG/Fgn7pX8jgDSTkPJBn8iL6U2E7?=
 =?us-ascii?Q?vKT999nn8x/Q/Q+wLnnOyd+15qrulXDdgrcebKUv/EUBKUvQT41uj5g3GhPf?=
 =?us-ascii?Q?h0NzUqpChLbMrygVpgD/dxwNHeazpeMprs5zKDFZLHqhwuShWBkfzUIcqBVV?=
 =?us-ascii?Q?J00sEYWg3vejNBt/7C7YsQcJhyL65OEFTbxzTv6PS6vt+Kg3C5Fvs2CtHSbK?=
 =?us-ascii?Q?wCSXjMafV3NC+tUhpfii7bItocR9dReppciNsM38zEQ3+GJMF8IDH1J9OkfL?=
 =?us-ascii?Q?pa54UXYvxv5CTyy/6kI2430tBLKOsiaIeH/0fwLTChhq95ZdpOT3S8sYWGCU?=
 =?us-ascii?Q?tHUtfHcfDdJBd8sh40J5fPQhurr4e+wNkZnRARtbL5ACAiaKul6tqQL0j0F6?=
 =?us-ascii?Q?b0sKggOdFHvyafKP3DYHTtonlmsw/h07spsHeiGS0pWha7pCm6dAVHhUZbD1?=
 =?us-ascii?Q?3fw6hfR6HNgYnQHV6HtTfbFexfBYP6Qbm1OuGgEHFUVU2mM2ZXHdbWII858V?=
 =?us-ascii?Q?t+RdqGcA+2FQBWD74c+vxPi0sxs+g3QM4PqliovH7+ftk/BjCWlOU+x53ozW?=
 =?us-ascii?Q?w13GKHm0EXtgn+yujdic4bJ5JetW+NDjRYS9+cSPjy7txrVd1gPRegr2vx+y?=
 =?us-ascii?Q?XCr4lWO6T1DkD6dnVJgJRQs3QchUG4J7L4GT/Q3P?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1a06444-71a6-4cdd-1837-08dac2dd4ca3
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2022 05:34:55.5039 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GZ+mE9nxPzwAP2pnbsYvyS0CRctSWT4sWNkbALxg6467Pi5d3zC57LnT8gTEQNzVBTz6h9CjMeYahRwgkgfnVg==
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
> The miscdev is in container.c, so should these related MODULE_ALIAS
> statements. This is necessary for the next patch to be able to fully
> disable /dev/vfio/vfio.
>=20
> Fixes: cdc71fe4ecbf ("vfio: Move container code into
> drivers/vfio/container.c")
> Reported-by: "Liu, Yi L" <yi.l.liu@intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
