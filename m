Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 494EC569DF9
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 10:49:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FC8210E5C5;
	Thu,  7 Jul 2022 08:49:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A5D10E5C5;
 Thu,  7 Jul 2022 08:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657183776; x=1688719776;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Lh7y5qwArx6kewvw5JDix3U0v75feNENs4ZH8RkRKrg=;
 b=FePs5TjeqNwFCXLeVEtxHEpUX2K3TVChFaImn0oVR46Jy4pgjkobqBkJ
 3o1Z0ZkoOorGLb59m0j5vxXzZ9UY1DisrA2Ver42fSSDaY1ifkNktMJUV
 gpJFr2b8xRKYNrSxaWJAU7Dvw2PI7+5pDjMhIpsiMMatsIOSzE/9RLPUg
 vhJVl5bnu8l7xNFGY2kccjXGFM0d8gvCmuEi5M7Oz4XGeDyvG0qPGChHW
 4KqRIf6HJ4I7FyeE1nH/IGP4CpOtSYszJnAFQH9/tN9m4u6WRBo2qcevu
 c/TamRXCGCz0FDoblR9aFtNdutE4mO9W/wwUTdwdxKDoHOr6gXrmJu+Jj g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="347955256"
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="347955256"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 01:49:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="626239415"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 07 Jul 2022 01:49:35 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 7 Jul 2022 01:49:35 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 7 Jul 2022 01:49:34 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 7 Jul 2022 01:49:34 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 7 Jul 2022 01:49:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DdY4okweWzkrXsE6vxgy2i5ITdyLsHuAZc5Vtw+1GH5Ryjb0lUMRnFpD8lFVllYQCecRVUk1jgE+6EEh2BlQS+lZkW4QoqXGcRmqYnF+xHp54GmmPfT7J/fk7laf7ylFfIVvWmI5CmbIhsOa1Uvgm197B82ilvr3vS+vV2TpWkAaurXQWVidAgOJlktbbfecsxKiIGY02dRFS5r4h56iR6OzT023R94MxhOatolYjqDOsVGm6R6MFlB3p61spL+PucsOVHV5m2DjDrf4RjZVm9dMVdxqU4MWHiXuin/hiNUnG05xCNED5MT/j6xhLvpkXmCR5vkfNfkdQ+AsYkv7QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lh7y5qwArx6kewvw5JDix3U0v75feNENs4ZH8RkRKrg=;
 b=PRFtos2GNpUvPdp6fsXVuY4HfNgk7K58EjktsUMQ9zTm1WgQGXoss9R7K6y56giAw0Ow6RIv+HS89O89qrNyI13uwjBPXHAvRA7ISH6GYdVumTTDfYJUdbV6ArMHdsrfzR+e8AEAD8dV0+H7YT8YqjqObg03yl7q3NrxKE2y9LSPeIbcFaYD2HSoZtmv3a/nH16EFxWN+xDJAdOs3tDphesxsVPvge9mXayKGhf5JGpoBBmEb44ScpJDSMwJ6MBdI8wp/RbeFzNaufukx2eUDhHNwUx9moFbahxw27aBMfGIocMB7J+ePr92q3ZYQ/cbAwWyQvhUkpkJxIpflHs1ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by MN0PR11MB6136.namprd11.prod.outlook.com (2603:10b6:208:3c8::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Thu, 7 Jul
 2022 08:49:28 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c%2]) with mapi id 15.20.5395.021; Thu, 7 Jul 2022
 08:49:28 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>, "kwankhede@nvidia.com"
 <kwankhede@nvidia.com>, "corbet@lwn.net" <corbet@lwn.net>,
 "hca@linux.ibm.com" <hca@linux.ibm.com>, "gor@linux.ibm.com"
 <gor@linux.ibm.com>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>,
 "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
 "svens@linux.ibm.com" <svens@linux.ibm.com>, "zhenyuw@linux.intel.com"
 <zhenyuw@linux.intel.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "tvrtko.ursulin@linux.intel.com"
 <tvrtko.ursulin@linux.intel.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "farman@linux.ibm.com"
 <farman@linux.ibm.com>, "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>, "vneethv@linux.ibm.com"
 <vneethv@linux.ibm.com>, "oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
 "freude@linux.ibm.com" <freude@linux.ibm.com>, "akrowiak@linux.ibm.com"
 <akrowiak@linux.ibm.com>, "jjherne@linux.ibm.com" <jjherne@linux.ibm.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "hch@infradead.org" <hch@infradead.org>
Subject: RE: [RFT][PATCH v2 9/9] vfio: Replace phys_pfn with pages for
 vfio_pin_pages()
Thread-Topic: [RFT][PATCH v2 9/9] vfio: Replace phys_pfn with pages for
 vfio_pin_pages()
Thread-Index: AQHYkQGmAGM5gjOpg0eOZ3/nNXMTNK1ymoeg
Date: Thu, 7 Jul 2022 08:49:28 +0000
Message-ID: <BN9PR11MB5276AD70E90F20A3439883A58C839@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220706062759.24946-1-nicolinc@nvidia.com>
 <20220706062759.24946-10-nicolinc@nvidia.com>
In-Reply-To: <20220706062759.24946-10-nicolinc@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9b8fd76e-760d-483e-4718-08da5ff59a20
x-ms-traffictypediagnostic: MN0PR11MB6136:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YRBeqIkXe3/waRttCG0mK1Er9L3/YlTIQ7eDSVTy+DKX+nF48V2f40IDqPfjXWtAOtv6KwknXpksVupN5RiW2sH235AB8EX72HUUJlwPcMMflvO0glAhToNjNTSBnaudQ4T7j27ooxxOeuynfGKoI7sNFAj78NyTeBg8x35Indo0UlERpQtf0Z/G2rgNLTsR/KYQc6h2O+E100B7ijEbmjJntCyIGE8jrAEcRy+x8kYuHoeLDm/ZlKILHbC+DbQC5+QwNy5bdmVVg55UreO4oHYZ3mq94Ef3BpC85Z6h1BzAoarB7H/ua71d5UgPWH1u1rg2Tw/J86jElAt3cQpBeHf4QWj8ZmZxsI1vAKugpdDty+RDW1bYVSzSF51AqrYBFE3kIl1QMEL4YLjvk0ykfcHieH0rCjbqSuUZ+N5pmcJLWh3+Gj9hDDtErU39twbd3+/UVnMt4ycwoTaVpusaYi/WX0tBKUmaDsYsue3Zt9wvYzMMEuJLjhKjRI5NanCwW6dKR6ANSFjY9bbsxdbbPIc/isLpMFEyMRj9juRIfBdwy4MBzJXtjGk8gcywxdqsaabYvZ6xU9865WBLdNIuKjifDPQdMpf94bgQEBdWayCQNN5lup4f0i+tGMXpH6+IjvRL3sGk8eJ5SzKsM7ZCpW9JEHrtH0KYYIzue/IZkDgKYIkgM6MrmUOUs3Sybw1phL15mIfeMyi94mxFbgyOwTdoeEYFQ/+NKc5TcYGEEhpXXa/+J4hxdiyCnphtkxi4qn6qaiRYjeeFqBufBf/r/kkFpzM/2hy2W+Q86969ae2LyqIFzOutO3Wxn2SqbTaJUEKbnZgQCdVF41vrAZhUQQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(366004)(136003)(396003)(346002)(376002)(186003)(38070700005)(110136005)(64756008)(54906003)(83380400001)(4326008)(66946007)(71200400001)(8676002)(38100700002)(55016003)(122000001)(66556008)(66446008)(76116006)(66476007)(316002)(478600001)(33656002)(8936002)(5660300002)(6506007)(7416002)(86362001)(52536014)(7406005)(4744005)(7696005)(921005)(82960400001)(9686003)(26005)(2906002)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Z69qGXvYDJ0Laa8D8eSSyF07fq2ZUSFae33CXh2JgMZpsaX1v1VkmHsUIZEF?=
 =?us-ascii?Q?Z42WD9AQtlETKoJPO+97YUYFIqX7WxOmA84H7j3FCo7KeIAILJXb+C7xKOXS?=
 =?us-ascii?Q?UFEj/uHnlRmxh1ufLqbU+vDaPjnjmmCsTXidvZq9SpZHq/XAVfL67ox1ZuQO?=
 =?us-ascii?Q?jvkVggw8+IKlTD7f1Un1cgt4rV/k/y4V7AzdPBdc/3PbWPBwyI6Z+Akblv0e?=
 =?us-ascii?Q?vu+1wiyzMSipl8fp+EPWgnCTgmMDbbPtBFLqPVVE/vaJjwVwt1JkTRgzGBuy?=
 =?us-ascii?Q?33nS5yFXsM6G2MEeQ6uHREZKI4ppqNmIdfov/7hv02VVLnowuFXSN5Wwx35w?=
 =?us-ascii?Q?eSxLazbfOTr2ppi3GDIe7ot2Y1A5MKiQriOgUtFNRZ3rI5eEW9TjPPncOdw9?=
 =?us-ascii?Q?0ZuOgk/+6Cd3ENAZaqyDUJvTsvKX4uXuE145cXJneqGG2X92QG733Ul1vU+y?=
 =?us-ascii?Q?JFFgmZdEW8r7E66nLklee1QMgKjkCyisQU/LsoA2+7kaH8IrXNKFab54zw8c?=
 =?us-ascii?Q?hHmG4QfYMCmiZAuWS92Siml9FavywVcqozxNVYSBB0gzWPknHdIEGoH9lxzL?=
 =?us-ascii?Q?wwckdjuT/pxiLtTNaaIe9otJJ6i8C3pNPgQV8IdoYNgIBAkg4q7yek5wIljM?=
 =?us-ascii?Q?HIhXsd9vSjqpS1UxtorQW7GYGKTPTRNqx6rLJ6spnZI2U2YMwg9Nhf5yPaHx?=
 =?us-ascii?Q?beuYOgX+h8K7ClBhD4G1Zkz3UgGllNwvlVPmLtWFD4yjJbdPxaD52nnqYM+V?=
 =?us-ascii?Q?7pWbhoPVZMS+HW0W4+vDOJnLOaxVQebVT8WnKSjjsMessFZfdXkU9Dx6hzFe?=
 =?us-ascii?Q?RKHB6JvJMYFl+5nMjTGWA2py5tY7FcQ0x006Cp6Q2VeKfY5XwCAnPx8MaeTI?=
 =?us-ascii?Q?LoMnGVGfrXFeFOSMUJL9CRQlNDswPh2+QUGGZ2zE/FkRnt3spU3pSW/JjbvA?=
 =?us-ascii?Q?Up0V8C197HhfFxliU0xCt8zV1Xes722JAJ/O1bmEAfNorSUgS2CCMeYLrbYm?=
 =?us-ascii?Q?Y9KDcylwNnKLk0UlLGBnLf5iWtj5GkXcc9MTZQdCcYr5H8dSDNEaYEtYoCD8?=
 =?us-ascii?Q?JBqu/Ls5SyoGcfwbk6Xs7vio0sF0BM/GsZTnQ4KTBxrnpZg2b7lEFXzhzyj6?=
 =?us-ascii?Q?rO1TB9oZZK/Crmb9Lzzh6Tt5p/nc92zbD/xazKZrZ97BhWLrNabT/rD3Gfv9?=
 =?us-ascii?Q?DG+8xn44SF3mRvs4XDlIdBCkbZwjGcSeBKh+P9/zOvCwQcZK4ydKVbJF/ABr?=
 =?us-ascii?Q?tOobXYvfoHiCCcOsmVnv8fK0cUyGjizrokZszk3uDHnvBOr44iO19Jo8JN8F?=
 =?us-ascii?Q?Gx4sI2YhSYjiG6DfWnjBBV2dVdIpghxzUHbnUkm16Th/ohGO7faAtKaexKf0?=
 =?us-ascii?Q?9klN1X8Tcma6gIPdzXfghAKQ3YSyQb0hqfk2oC5l55VNrX7uVU+wiO+otOFu?=
 =?us-ascii?Q?MKIUOZt1DVipzHdoxlZub8AUEi6P1Bcj/UC6JAbS1aAdZIymUjAZGiryWt0h?=
 =?us-ascii?Q?siReIoyK/6c/foUHHcujWgBbKfMBHVcDOw9cB09zHn1+HmD/PCR1OcN6Fbqf?=
 =?us-ascii?Q?A1IhaT0ty/2r5o6KPvxUtYkpifCQLXFAtvzf+bEa?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b8fd76e-760d-483e-4718-08da5ff59a20
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2022 08:49:28.3466 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3ImSRtW9OwIDRWulDE0Y8NTfOBCIxsO4rdD+0v1xMtfBFldNvHCxFmznh1kl7V9iBt+Zm6bNcotpu2oGWI8l7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6136
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "jchrist@linux.ibm.com" <jchrist@linux.ibm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Nicolin Chen <nicolinc@nvidia.com>
> Sent: Wednesday, July 6, 2022 2:28 PM
>=20
> Most of the callers of vfio_pin_pages() want "struct page *" and the
> low-level mm code to pin pages returns a list of "struct page *" too.
> So there's no gain in converting "struct page *" to PFN in between.
>=20
> Replace the output parameter "phys_pfn" list with a "pages" list, to
> simplify callers. This also allows us to replace the vfio_iommu_type1
> implementation with a more efficient one.

worth mentioning that vfio pin is only for struct page * hence the
pfn_valid() check in gvt can be removed.

>=20
> For now, also update vfio_iommu_type1 to fit this new parameter too.
>=20
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
