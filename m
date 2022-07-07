Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD7C569A3D
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 08:08:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C67113E40;
	Thu,  7 Jul 2022 06:08:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD35E113E40;
 Thu,  7 Jul 2022 06:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657174128; x=1688710128;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ye10hM3rzbbBjZ0ETRxS9cm+vzm82pbFIhW2byhgvQc=;
 b=EgBpEK+9ZnRAZB1H0WPsSoYxrPaTc4flE40KebVLHmRrOhrHE4EEJFKc
 STQAMRazMbn3e6PHjkQvX7p3UtVPlUbsSBgq4WK/r2P2pgeI6qHnfFH02
 HG4BUhRqqwCRxLNPo+rh/aFPASIFdfwYDk4TL+s8KGDSiYym7e5N3LyMa
 YYvhBxUIz6eE+txG8pGK8UpxpfAaE9dC0v//2AS01Vzc2SkBKVkGHkYvz
 e+kldPLb/VHlSPVx1+ykPQzBjTB6GV9TX/tWAdt6+7ZLSy8wKWlss7H6F
 SCGxHWQFyBACOYJP/wrINs9hQkt70061iw3uFOfv+I4p0BozzZAZSYC53 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="347924826"
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="347924826"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 23:08:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="650995051"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 06 Jul 2022 23:08:47 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 6 Jul 2022 23:08:47 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 6 Jul 2022 23:08:47 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 6 Jul 2022 23:08:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NbGzA4JIzWMiMwYs3sBqsinnbqa/CUPbAE7QwreyetN15AMU1bBH9+olB8qGrNPqj2p34qya0bj4tAMv1LVs8ffbjkNDzF+0v29NoP8SMx/CDD7YwF3zFPPywtefRMi+/x7GSlFiwME7PKddRKGZqCqICdAWR5rgrZ8/uT0zy175VH96GYStlFe31Wvqtk1rlWiIlKODYjBeyqZq+Hpdp5d8ua0PNCl0Xstof5br3ZpFA5H25zQK7lEwYzLCTrUmDQyCX61zvwFjcQU94fKlB4XsrQDH7TDT5D9yWRgudGBNMJxUUD7+rDTf/5P+Oltm40a0TjeGXZfVFsGbUgPT0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ye10hM3rzbbBjZ0ETRxS9cm+vzm82pbFIhW2byhgvQc=;
 b=USDEV2Jj0zI7WFtmk1wwnxPDK+ozhbGE1IqOGO9WLWtJkaSWogrM7dQjyX/+MYmtzLKvM9Vv8IX6Ka04wmZ6degh5OBOXqRzWCMNIU7LIhRekrCS2dBlZPeig2r0P7BVjoqUU7XCtbOl8eSfxbYQ8YxgzKVlwMwaCdsJruTfRQJI+oBPPQvoMsOKANskpDcsK4caMu+WWLeLUXjK0egmFofkn/NvQm1xMQbTbRsMVYCBE/aac7Dh8bqeBnejufdbLofsXMMGGmHQwlo9jyby+w0E4xP7kP33SPe3ymCRKjBWl5wglsAcZF9+bIkdnqzAQ6BA62qUn5OdfYC9bpva2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SN6PR11MB3293.namprd11.prod.outlook.com (2603:10b6:805:be::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17; Thu, 7 Jul
 2022 06:08:45 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c%2]) with mapi id 15.20.5395.021; Thu, 7 Jul 2022
 06:08:45 +0000
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
Subject: RE: [RFT][PATCH v2 0/9] Update vfio_pin/unpin_pages API
Thread-Topic: [RFT][PATCH v2 0/9] Update vfio_pin/unpin_pages API
Thread-Index: AQHYkQGYmzwXVwAIR0+upNM3ZOmxoq1ybcTA
Date: Thu, 7 Jul 2022 06:08:45 +0000
Message-ID: <BN9PR11MB52768822A11C158214C6A6A48C839@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220706062759.24946-1-nicolinc@nvidia.com>
In-Reply-To: <20220706062759.24946-1-nicolinc@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: edb57e31-3fac-4124-1ced-08da5fdf2675
x-ms-traffictypediagnostic: SN6PR11MB3293:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rN1dbzqg1C4BHL5DB5c/ZPMktGVsaJj6rUIJ7BpksUDa0aqcQRpiWxAvwSRcZ+V045292dTSY4hCkKkLxRF98vXNPeAeoSY9m8kBbpfVsDEH2LsqcK4VJi0FW6iGxPTrpf6JKrSewkW6Hr6ULM+5lFx1fNSQ4/niY1/uCqL2mWutGHb6QgfDko4ujuY0jDdSFXF/+zXdobZLRr0oqrNkfVWfJEiZ8opMxfx2NnJEp1p7H2IfuzwOKF4/lJ0GsvORloAu+IeNstcCHMyaFtzEAEXlAu6n0lQLpB5jvsjbTcBoLJhzXzJaVriCBmSMTIHJEOHAFVqJVcTEmdgO1QlHOpK5gf7+dVda1f06K39gC8HM3KJNuokQAum3fRNL5VkCC5l7Kx1rzQSRNJkLDGAZPgGdEuBC6+qhkzGuqamXLdoWD6nXDhJlUx9pa38+VfMFdxWa/Yoe95PhozYxsoPQvRUtoxdNe6lVypkrAWhhmKaJ6lMdxyFktXVyD4ZKpv7IRGR/8mwXDBO3Xu8IPh3dH/MNkp6r4f7hChOidvFiRYxAnNJJMOk7WcB/L76zbTJ0UYHP++UIYt9TLpVpahBAht6+U5fhXe+ozfgpECogplwFqoVLoEw1aVeCXZ1H58HTZwvG0c3n4OlV2i+ucUC5eA6EldyvVXlBrRCchF88A9ghXA3GDAXfk+OKje9LXRIORB8YdXmkrxYrYPB0zGLNJYmFiyWtsGVMj9JBva1lAoKzG7aSGJ5ug8yh5TgtPAk10gwfoL/AcT464mr4iR4vIE4Ymxll85f54KuXbiLc+4iZG+Esg/Xc8NOQ2bUkaLOQ6B50Pz+AjFpE7AfSM4z2mDMaU5oRyFfqayw0pF0e9Fo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(376002)(396003)(366004)(39860400002)(346002)(9686003)(478600001)(54906003)(110136005)(38070700005)(966005)(38100700002)(186003)(316002)(8676002)(41300700001)(4326008)(15650500001)(76116006)(86362001)(66946007)(71200400001)(122000001)(5660300002)(66446008)(26005)(64756008)(8936002)(83380400001)(7416002)(55016003)(52536014)(33656002)(6506007)(7406005)(7696005)(2906002)(66556008)(82960400001)(921005)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sYLKAky3pV803I2SXnwgoWNV6MGPz70A/cBCnQ6WUcB7MQN5OeUZ0+RRDqlZ?=
 =?us-ascii?Q?1i+oBGlTnJmq4VCnAAwOlfC5GdjM/OzROXV07Yt1h/nOD4srN39zwzB+PVAp?=
 =?us-ascii?Q?TBacnhUoL9K9a9Epa56F9n+OdWYUogpBjRuLG+WyF/riLWKe5In5oBTA6Zy5?=
 =?us-ascii?Q?JJ3NqLbTHG2NrzUh0LQ+6YpyTIUyCgxr6e5GD5eJoIcRqdbDdHMRIDbyjkm1?=
 =?us-ascii?Q?upwzvB1p2ODCL2oEI6+GmxHjjoSBIwqt13NyQOKXfaggIpGNy23NDZeK9yEz?=
 =?us-ascii?Q?94M+emo7VPq8lQ6b302hilRNIVi7gljYwvtM9vXg0si1Mjlq4JotFqA0leav?=
 =?us-ascii?Q?w+Ioj/Aw1C9DbRMETq9P8RVFpGRcW0MOhsdUhZbcWXfssSKe6DpThM9HEW13?=
 =?us-ascii?Q?z+ByU6qbxmmR4odWq/4k8+C9JBwHJthAU7Y+6gO2kNzuvgqIiQccufMLpWkm?=
 =?us-ascii?Q?1shD70+qq7DheJrXsjkD6uuhH/jIiKoTlEVktHxZdJodvkhGnJADyNr9w6l6?=
 =?us-ascii?Q?7pIeR3cXORK41xaxoiPDy9HAiEgbhNJEna3tFvDSVfruHzNhUcQqk0RyP+wv?=
 =?us-ascii?Q?WVFJFOu1kClX+Qvi/FBm24Xj5D5RBCL9DLM62uWAAeyLfe4nXmpX7Fc2y0yd?=
 =?us-ascii?Q?xRdFabKThzrmRocEFf1duutgc1w+0XOoIbMDRlc+2SsBjoHQcXqlXEUufLYB?=
 =?us-ascii?Q?d6xC29JT/o165ohZJT4ubYCUD7dtzCJfrwPPPtPhgLTTZyICJ5Jix05n2YpQ?=
 =?us-ascii?Q?1DgHnTOJ1NvePGBBy99DNPDWoDn3QX8VOfc8YKvX86OdOKVhisX962IYo6U+?=
 =?us-ascii?Q?f1g2XondREBrLF5NMXVbZ8tObd4IlryZQTy1fQafsb8PMcf7tPd3Yhb3nFdh?=
 =?us-ascii?Q?61Lz2AX1qArbw6mcN+gQY1+p0sc84qrt/6rjDghFYmAEdweOnnyhsLxbdFz3?=
 =?us-ascii?Q?2fVo2MJasgBjXMmB7wpJ913wTtyO35BG6KBfEGbWSDzaya1PO7Dx6gnjU1B1?=
 =?us-ascii?Q?Asxb+xY9jGfHUcLWM5zD7BCE/jId9gMn6TBOAO00KFqCs4Uov1KIIp7DEny5?=
 =?us-ascii?Q?gdIzdg+xbQh3EdClhxgY4tmiu3KpXtNwCG/dukoShaEZBj2rpgYSaQk+n1I9?=
 =?us-ascii?Q?BQG+GB9bx3Ak1WzYJoX73jcXDzM0fJqi+83EtueMKCwd0xdbLXHHyqp8am6W?=
 =?us-ascii?Q?wF8o2sPA0/JBY4AaP0h4nXoqgav/4P/GCeBNZjbgal0SKy+RfGEhmGN+dUVI?=
 =?us-ascii?Q?ZNux30sJvcULCXXNSTrU5PTLdvfbaPoIofrPB/VSxIdEtEyxZqIVNTnL5pkF?=
 =?us-ascii?Q?viV17YbnrkyGhhzWO5THPNhF2eYDWMU705tdVj4nUkEWKXu0ep4UZ53PNDXG?=
 =?us-ascii?Q?EvCGFIfGS2NWPVrzF/+UvYxyWJX+kb3h51aDYK7KaLhP9AJgW/SdwiL4LCRz?=
 =?us-ascii?Q?RBwK8JxlJzIpHPNxIBkoNjSiQA8Q2oZ2S7OC8IFVXCQfyFExfjBGcPn0y26T?=
 =?us-ascii?Q?1gR497XjLV7T2NN7po8U6kvxyYt3vAmLVvUpy36/Bwbho+PCgXbCSTjhrvIo?=
 =?us-ascii?Q?lEpEu0F9/lF/0Hett1ckVut3fPpPnx90hB9cGLYo?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edb57e31-3fac-4124-1ced-08da5fdf2675
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2022 06:08:45.3589 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XOlCJE0sx2F6s57xOMtfdTNhw/KfzBI49vzPY0G36PyVK5n9kQwW8S982M9j+ByvTJ3cKAim2B/+tW40yatm8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3293
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

> From: Nicolin Chen
> Sent: Wednesday, July 6, 2022 2:28 PM
>=20
> This is a preparatory series for IOMMUFD v2 patches. It prepares for
> replacing vfio_iommu_type1 implementations of vfio_pin/unpin_pages()
> with IOMMUFD version.
>=20
> There's a gap between these two versions: the vfio_iommu_type1 version
> inputs a non-contiguous PFN list and outputs another PFN list for the
> pinned physical page list, while the IOMMUFD version only supports a
> contiguous address input by accepting the starting IO virtual address
> of a set of pages to pin and by outputting to a physical page list.
>=20
> The nature of existing callers mostly aligns with the IOMMUFD version,
> except s390's vfio_ccw_cp code where some additional change is needed
> along with this series. Overall, updating to "iova" and "phys_page"
> does improve the caller side to some extent.
>=20
> Also fix a misuse of physical address and virtual address in the s390's
> crypto code. And update the input naming at the adjacent vfio_dma_rw().
>=20
> This is on github:
> https://github.com/nicolinc/iommufd/commits/vfio_pin_pages
>=20
> Request for testing: I only did build for s390 and i915 code, so it'd
> be nice to have people who have environment to run sanity accordingly.
>=20

+Terrence who is testing it for i915 now...
