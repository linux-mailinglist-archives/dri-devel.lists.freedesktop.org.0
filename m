Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E340D5420D7
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 05:38:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7CC01120C5;
	Wed,  8 Jun 2022 03:38:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD5D11206C;
 Wed,  8 Jun 2022 03:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654659483; x=1686195483;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QnlVviZV9Gat7xuBZ/5NkukA4Zn1vc4RDyEVLyQne8k=;
 b=bzX0DI4T4r2rYDWeC8IWrvzvO5A9yglqa0Bh+wnpYmtpFh0E+gWkfILI
 BxS7DxuKGS6/HMmq54LCNtKJmr/oFPYcgFbA8LkFhMkcQnhkO+k/jGtXO
 01XGhkqDwoyQ69oxbZpqdQ07FzX2ELsygqH16RDegAafEl4P27z5yPEew
 ekS20AmxDvX4fCmxutZgXQj5kN/3HU8kDYhu0N9m3BbvUoD3A/ANC4yLQ
 dHnV/ht2+BOedBKzVJCxqe4Xvve9KZFc6X8/WGUEr28TxOoND9CoROoTU
 DmRIZYZ4qaxKuB2emzqCjw3FT5bUlzjLClf/9z+etgYyhRMHVoVBhiRNe Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="265524088"
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; d="scan'208";a="265524088"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2022 20:38:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; d="scan'208";a="826709943"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 07 Jun 2022 20:38:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 7 Jun 2022 20:38:02 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 7 Jun 2022 20:38:01 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 7 Jun 2022 20:38:01 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 7 Jun 2022 20:38:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QVfWJRLa7SXhKZxUY09otMB+RCMTTWSdQHFWYjo5P/9+VJGipVjRRWRJn+vxgCecUslEtFrLFzRWwzNJH35MxOgPKwZpLt0f/Mge1SWY8mBjI64EzGi4hLkHwo0T5sCYmh++WoT7aY/V/b5W8VmOIy4ImxuMCuACtmLbIBUHOpiPaYsdkYpN6ZB6A4gmkis96kgza3Da+5QSebYUyC0WWOIANSyUE6ZnRAPt+rUehQies4VKMLl3ubnDY1ZCVGKE0uE6fSrQmFbCppSAz1l6vzpPXO7R0V7fOo+HWnuUTSWw8W/U1JZsqEz+EozQgCb0rM/N+tkP92qJMvDr27Zw5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lNajbDZDyu/jqP5TJRytp7q+Wxyoap1OU2jswV+r0W0=;
 b=LClq+q+gt22zgtWcCqkbdZv4Cfeyx64wMDJVZ6uPqupznexLfHEYdIITfYXBE4eghDI4bJjeOIQc/1YIfPMCEr+2kzxkAfBX1SM74GuJwI+htTwwLf3PkVccOQruFgWxT9fk1MS3weGnXhMmaO8xbiplMMIBoItfJXHYzRXw9aOANiqHTRXfSNr3zoq18YEo0EV5Fnq8+04tzP3t/eeeLC7tfI0Ci50lzzQydd1Z4nyYDoJhG05fTLg/uDbFbGmgZ2YS7LPrbJtbszOXR20vuVisTV44mmBfoWzHNl8IDz3RG5Q8O47q7LgmyYDP4P5Uq7QIGea3vDrKSjpJ7Khiug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BY5PR11MB4339.namprd11.prod.outlook.com (2603:10b6:a03:1be::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Wed, 8 Jun
 2022 03:37:59 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::a1cb:c445:9900:65c8]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::a1cb:c445:9900:65c8%7]) with mapi id 15.20.5314.019; Wed, 8 Jun 2022
 03:37:59 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, David Airlie <airlied@linux.ie>, Tony Krowiak
 <akrowiak@linux.ibm.com>, Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Cornelia Huck
 <cohuck@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Eric
 Farman" <farman@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, Jason Herne
 <jjherne@linux.ibm.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-s390@vger.kernel.org"
 <linux-s390@vger.kernel.org>, Matthew Rosato <mjrosato@linux.ibm.com>, "Peter
 Oberparleiter" <oberpar@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Sven Schnelle
 <svens@linux.ibm.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Zhenyu Wang
 <zhenyuw@linux.intel.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>
Subject: RE: [PATCH v2 1/2] vfio: Replace the DMA unmapping notifier with a
 callback
Thread-Topic: [PATCH v2 1/2] vfio: Replace the DMA unmapping notifier with a
 callback
Thread-Index: AQHYesLAJUYfAp21yku1uotd5dxlh61E3Frw
Date: Wed, 8 Jun 2022 03:37:59 +0000
Message-ID: <BN9PR11MB52764957F9364B48412E9BD58CA49@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v2-80aa110d03ce+24b-vfio_unmap_notif_jgg@nvidia.com>
 <1-v2-80aa110d03ce+24b-vfio_unmap_notif_jgg@nvidia.com>
In-Reply-To: <1-v2-80aa110d03ce+24b-vfio_unmap_notif_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8dcfb14c-6860-4701-765e-08da490048b2
x-ms-traffictypediagnostic: BY5PR11MB4339:EE_
x-microsoft-antispam-prvs: <BY5PR11MB4339FA489B235A2EBA27AE088CA49@BY5PR11MB4339.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x9a6oSL/Q0SoDjUrKSuTIeKLqoX6vIACWC9S8bbDpaMe/kf+Ny0YIVzu8qrNKmzoffeTcWzbPnnTVk4d9opwOJGNVJvgLnNWvmTtASodqWQqx+zU1aqfEzJZjhOFDC4XTfVQqmltfQLL5sSZh0oNqnshA1B/WUuVFcyOn6B7bq5NhaldsKQ3Cjd5NlVfVgqIO50d/GOrvkv/1h6k7nDktMKJVUYbjJLdKJ+EkAk/1tnTLf4Ba9Bandb4OnJIJLS/SN9IjTvQUgOfEldRp1xCLUOFVF0wAzuW3yZB2pr7daIiXo6r3QcKM2uabvj5MHJ9t4R5rXzw0fOnFdX4m/TxdOPohYqKibzsa5Ot8L878SxtISKKC7L7gCKBf32DKPqsiblK73uNVDX1Xvgm6hhVWAwLliKzm/HOlNJ3AZK9CwBGGrRE+c48X6CmFJ5lmFXYuKuii1ottX+DN94pYnompu/BXn9fFOE1pKuWnFcFeWu+E/uRjyNab9lHqYZ1GJxk0c+3w33UhcIAzIbn7bx39L1oiuivjjwLLI7FVuIL88rWFUMV1JcEATGVsTzJFjk3DEbv13YkAar++iUF0U/renAB4OWGbBzXEenTw/CymPTodCZK6pJlimbx3pTEhVNYFxNq7VJL+OxaDPuifxn4psnczkzbL9CBLVfGEySK0uXhPCfZrQG3imMJY6nwYvFur5G4aU7OlpncbkU0cM50sI7I8/qlABM76rIToVhcyvw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6636002)(316002)(33656002)(52536014)(8936002)(55016003)(26005)(83380400001)(9686003)(86362001)(110136005)(6506007)(7696005)(8676002)(7416002)(64756008)(66556008)(66476007)(38100700002)(66446008)(186003)(4326008)(508600001)(122000001)(5660300002)(921005)(30864003)(38070700005)(82960400001)(2906002)(76116006)(66946007)(71200400001)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3M8cxOkX69lpvN7xdQOYbsw/x8mm163fYnOpDTMmaM5vfP/qHEkn78KIJClN?=
 =?us-ascii?Q?nnYJX2XiC3oZJaI+h1ReryD/IO3AwPYNqNFgsedd78O4EPAIBji3zTe1xGQ1?=
 =?us-ascii?Q?ySuijVwX15bsnmzI5TOa4oaxLNdJ15MRZmBjkJE/uxuLUnxqGHDZsKMUQuhE?=
 =?us-ascii?Q?NyxMAMYtyPllbkdLg7ya7jujSqTUOkHKz27CGNMO4Ta+qqpDCo6ZfxJOsqz1?=
 =?us-ascii?Q?TFP6P92/iKB69a9tS1zy5uVjArFOTe16yksQwsFFhd6DLGI7aX6os6ZB/Cd+?=
 =?us-ascii?Q?myDGp5P+FqbzSM0MN0baw+zPP4jezS4GB5QLOyNs1mAhmEU8eprJ1daExci5?=
 =?us-ascii?Q?oUqXoOedHq6q4fbqopM0/1QKlytGsHNfc0xUpeoTCXGnYhR3mXZTnsv4DRTp?=
 =?us-ascii?Q?IMBe4KLRf1nqBvtNdVxxcZzuHtFFYz/gI8gJn3wy2kdzUri0msp0brl4vMpb?=
 =?us-ascii?Q?2K1pH1IJuRhXymwQWS1Jv1DQGzMwwyc4ud8NZZx+BW0FkbMGQNzhywhvDq2z?=
 =?us-ascii?Q?1weeUxWffG6CbqhghytjMB8fjxYcpmGgUxFFtXQIErQ5CYWI/N0r0Nw4zGGr?=
 =?us-ascii?Q?RAG+IIilUiYJstlG/Y0O9ZPBr+DL4U+2MSSBFM3zw+Eb4az+GdWPZeEMDSVv?=
 =?us-ascii?Q?sVCbYi154wiR7527k6crNb+r+KybzXSsbjd/wFvSA6azCv3brz1LPTxV1yup?=
 =?us-ascii?Q?yk2pCMAlFR0yxGhp5jwMViZu210HzCNxH3kZOm2Z0m7oVlVcP2GNgBTUwP3R?=
 =?us-ascii?Q?MzUdvrMmg9Vo7XnDmCgQMKzKiKMDyKYoX0ApOCKxfGsyUCcJltrhnlfLc6W8?=
 =?us-ascii?Q?xjDaNxF5MVM630z7ykHPyZeAcmbMbDeiNdpy21maI4UnXyUqD9RDIGLDuBoP?=
 =?us-ascii?Q?IpszD2Ye5AWJal/0AB2WJ2g6JsV3T4+Vf2rrDa3/14quVyHUNrmb+cAfT549?=
 =?us-ascii?Q?BXY22RLzdaU5Yiac+yelB+jK/NsPdQaXoibeE2R/qRthTfzOsjBShXKRSCWI?=
 =?us-ascii?Q?ssArFKsJSW/At3FNSXnhMPQuhpKiXxMbn1vA+PXFmfJ4f7pYC6/g7QH+EDm3?=
 =?us-ascii?Q?Q/OUZ2BKTkzlnuFeuxU64a2a04XZDU8bWl8Ae2Vh1fiVla4lyHla8/3d7kJ9?=
 =?us-ascii?Q?YoFPOxOAjPoYSREAi/Sq3n6W92qg4yzIMBKXqatN1k2cxdghCDS5/+JPquIV?=
 =?us-ascii?Q?0d52aprKCCsU6+vSeLtqaEZVPInJSwRsgBZ9QdDWBeFdBdOaQB4LsX5jfqmc?=
 =?us-ascii?Q?Z3P6G2LkRQDDYW0D1JizOmu5qSVjelsJj+TH1hsUlJnEuOtXZb2IZZpvynCC?=
 =?us-ascii?Q?ApHdjGxXzoFV+ZmfJ3pkCFwq+XMkMZQL+spouTY3yxiere3fEU2wivKYxIQr?=
 =?us-ascii?Q?D7SbZD3wOEtxiuJT7RnQjaCAdnMY40hIPxoAdvl0mei3337JNlPU+L4qojfw?=
 =?us-ascii?Q?BLOYgHJzUWyR/PkT/VzYmQu5FSd3nyr9ndY7YMy4y0nS2eIDRdsbhlUkhqx9?=
 =?us-ascii?Q?fX+h40skirP/zZyODQY2e1Gou5/U6V1dVMLghYGPChB6/eKYuxLqCCo+s2n8?=
 =?us-ascii?Q?pYeWWI4D6D5U9Mod6Kv+Z6NL920W9wQ3pj6Z6MGrrvgVFOTawDRcf2Gex3v3?=
 =?us-ascii?Q?q/UerrG/cN0by7Fi9eBq3GIqtn2GX9bmotnQHMz0TAe5R8Lik3sgOlFXGjZR?=
 =?us-ascii?Q?IbDPqkush5sckQcf6Hi6kajJg0y+VtKrJgMBAl0L/USzOfz+aYXrZ55uF7+0?=
 =?us-ascii?Q?QrBu+AnSSA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dcfb14c-6860-4701-765e-08da490048b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2022 03:37:59.4673 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OIxLmn3RBlBQL3sHSS6mGatsL8c5w0le6Za7iMXYK+LgecefywMhp4Hs07jKlzyGvCpW8yYcNgAWuJOvNAbRcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4339
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
Cc: Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Jason Gunthorpe
> Sent: Wednesday, June 8, 2022 7:02 AM
>=20
> Instead of having drivers register the notifier with explicit code just
> have them provide a dma_unmap callback op in their driver ops and rely on
> the core code to wire it up.
>=20
> Suggested-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

> ---
>  drivers/gpu/drm/i915/gvt/gvt.h        |   1 -
>  drivers/gpu/drm/i915/gvt/kvmgt.c      |  75 ++++-----------
>  drivers/s390/cio/vfio_ccw_ops.c       |  41 ++-------
>  drivers/s390/cio/vfio_ccw_private.h   |   1 -
>  drivers/s390/crypto/vfio_ap_ops.c     |  53 ++---------
>  drivers/s390/crypto/vfio_ap_private.h |   3 -
>  drivers/vfio/vfio.c                   | 126 +++++++++-----------------
>  drivers/vfio/vfio.h                   |   5 +
>  include/linux/vfio.h                  |  21 +----
>  9 files changed, 87 insertions(+), 239 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gv=
t.h
> index aee1a45da74bcb..705689e6401197 100644
> --- a/drivers/gpu/drm/i915/gvt/gvt.h
> +++ b/drivers/gpu/drm/i915/gvt/gvt.h
> @@ -226,7 +226,6 @@ struct intel_vgpu {
>  	unsigned long nr_cache_entries;
>  	struct mutex cache_lock;
>=20
> -	struct notifier_block iommu_notifier;
>  	atomic_t released;
>=20
>  	struct kvm_page_track_notifier_node track_node;
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c
> b/drivers/gpu/drm/i915/gvt/kvmgt.c
> index e2f6c56ab3420c..ecd5bb37b63a2a 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -729,34 +729,25 @@ int intel_gvt_set_edid(struct intel_vgpu *vgpu, int
> port_num)
>  	return ret;
>  }
>=20
> -static int intel_vgpu_iommu_notifier(struct notifier_block *nb,
> -				     unsigned long action, void *data)
> +static void intel_vgpu_dma_unmap(struct vfio_device *vfio_dev, u64 iova,
> +				 u64 length)
>  {
> -	struct intel_vgpu *vgpu =3D
> -		container_of(nb, struct intel_vgpu, iommu_notifier);
> -
> -	if (action =3D=3D VFIO_IOMMU_NOTIFY_DMA_UNMAP) {
> -		struct vfio_iommu_type1_dma_unmap *unmap =3D data;
> -		struct gvt_dma *entry;
> -		unsigned long iov_pfn, end_iov_pfn;
> +	struct intel_vgpu *vgpu =3D vfio_dev_to_vgpu(vfio_dev);
> +	struct gvt_dma *entry;
> +	u64 iov_pfn =3D iova >> PAGE_SHIFT;
> +	u64 end_iov_pfn =3D iov_pfn + length / PAGE_SIZE;
>=20
> -		iov_pfn =3D unmap->iova >> PAGE_SHIFT;
> -		end_iov_pfn =3D iov_pfn + unmap->size / PAGE_SIZE;
> +	mutex_lock(&vgpu->cache_lock);
> +	for (; iov_pfn < end_iov_pfn; iov_pfn++) {
> +		entry =3D __gvt_cache_find_gfn(vgpu, iov_pfn);
> +		if (!entry)
> +			continue;
>=20
> -		mutex_lock(&vgpu->cache_lock);
> -		for (; iov_pfn < end_iov_pfn; iov_pfn++) {
> -			entry =3D __gvt_cache_find_gfn(vgpu, iov_pfn);
> -			if (!entry)
> -				continue;
> -
> -			gvt_dma_unmap_page(vgpu, entry->gfn, entry-
> >dma_addr,
> -					   entry->size);
> -			__gvt_cache_remove_entry(vgpu, entry);
> -		}
> -		mutex_unlock(&vgpu->cache_lock);
> +		gvt_dma_unmap_page(vgpu, entry->gfn, entry->dma_addr,
> +				   entry->size);
> +		__gvt_cache_remove_entry(vgpu, entry);
>  	}
> -
> -	return NOTIFY_OK;
> +	mutex_unlock(&vgpu->cache_lock);
>  }
>=20
>  static bool __kvmgt_vgpu_exist(struct intel_vgpu *vgpu)
> @@ -783,36 +774,20 @@ static bool __kvmgt_vgpu_exist(struct intel_vgpu
> *vgpu)
>  static int intel_vgpu_open_device(struct vfio_device *vfio_dev)
>  {
>  	struct intel_vgpu *vgpu =3D vfio_dev_to_vgpu(vfio_dev);
> -	unsigned long events;
> -	int ret;
> -
> -	vgpu->iommu_notifier.notifier_call =3D intel_vgpu_iommu_notifier;
>=20
> -	events =3D VFIO_IOMMU_NOTIFY_DMA_UNMAP;
> -	ret =3D vfio_register_notifier(vfio_dev, VFIO_IOMMU_NOTIFY, &events,
> -				     &vgpu->iommu_notifier);
> -	if (ret !=3D 0) {
> -		gvt_vgpu_err("vfio_register_notifier for iommu failed: %d\n",
> -			ret);
> -		goto out;
> -	}
> -
> -	ret =3D -EEXIST;
>  	if (vgpu->attached)
> -		goto undo_iommu;
> +		return -EEXIST;
>=20
> -	ret =3D -ESRCH;
>  	if (!vgpu->vfio_device.kvm ||
>  	    vgpu->vfio_device.kvm->mm !=3D current->mm) {
>  		gvt_vgpu_err("KVM is required to use Intel vGPU\n");
> -		goto undo_iommu;
> +		return -ESRCH;
>  	}
>=20
>  	kvm_get_kvm(vgpu->vfio_device.kvm);
>=20
> -	ret =3D -EEXIST;
>  	if (__kvmgt_vgpu_exist(vgpu))
> -		goto undo_iommu;
> +		return -EEXIST;
>=20
>  	vgpu->attached =3D true;
>=20
> @@ -831,12 +806,6 @@ static int intel_vgpu_open_device(struct vfio_device
> *vfio_dev)
>=20
>  	atomic_set(&vgpu->released, 0);
>  	return 0;
> -
> -undo_iommu:
> -	vfio_unregister_notifier(vfio_dev, VFIO_IOMMU_NOTIFY,
> -				 &vgpu->iommu_notifier);
> -out:
> -	return ret;
>  }
>=20
>  static void intel_vgpu_release_msi_eventfd_ctx(struct intel_vgpu *vgpu)
> @@ -853,8 +822,6 @@ static void
> intel_vgpu_release_msi_eventfd_ctx(struct intel_vgpu *vgpu)
>  static void intel_vgpu_close_device(struct vfio_device *vfio_dev)
>  {
>  	struct intel_vgpu *vgpu =3D vfio_dev_to_vgpu(vfio_dev);
> -	struct drm_i915_private *i915 =3D vgpu->gvt->gt->i915;
> -	int ret;
>=20
>  	if (!vgpu->attached)
>  		return;
> @@ -864,11 +831,6 @@ static void intel_vgpu_close_device(struct
> vfio_device *vfio_dev)
>=20
>  	intel_gvt_release_vgpu(vgpu);
>=20
> -	ret =3D vfio_unregister_notifier(&vgpu->vfio_device,
> VFIO_IOMMU_NOTIFY,
> -				       &vgpu->iommu_notifier);
> -	drm_WARN(&i915->drm, ret,
> -		 "vfio_unregister_notifier for iommu failed: %d\n", ret);
> -
>  	debugfs_remove(debugfs_lookup(KVMGT_DEBUGFS_FILENAME,
> vgpu->debugfs));
>=20
>  	kvm_page_track_unregister_notifier(vgpu->vfio_device.kvm,
> @@ -1610,6 +1572,7 @@ static const struct vfio_device_ops
> intel_vgpu_dev_ops =3D {
>  	.write		=3D intel_vgpu_write,
>  	.mmap		=3D intel_vgpu_mmap,
>  	.ioctl		=3D intel_vgpu_ioctl,
> +	.dma_unmap	=3D intel_vgpu_dma_unmap,
>  };
>=20
>  static int intel_vgpu_probe(struct mdev_device *mdev)
> diff --git a/drivers/s390/cio/vfio_ccw_ops.c
> b/drivers/s390/cio/vfio_ccw_ops.c
> index b49e2e9db2dc6f..09e0ce7b72324c 100644
> --- a/drivers/s390/cio/vfio_ccw_ops.c
> +++ b/drivers/s390/cio/vfio_ccw_ops.c
> @@ -44,31 +44,19 @@ static int vfio_ccw_mdev_reset(struct
> vfio_ccw_private *private)
>  	return ret;
>  }
>=20
> -static int vfio_ccw_mdev_notifier(struct notifier_block *nb,
> -				  unsigned long action,
> -				  void *data)
> +static void vfio_ccw_dma_unmap(struct vfio_device *vdev, u64 iova, u64
> length)
>  {
>  	struct vfio_ccw_private *private =3D
> -		container_of(nb, struct vfio_ccw_private, nb);
> -
> -	/*
> -	 * Vendor drivers MUST unpin pages in response to an
> -	 * invalidation.
> -	 */
> -	if (action =3D=3D VFIO_IOMMU_NOTIFY_DMA_UNMAP) {
> -		struct vfio_iommu_type1_dma_unmap *unmap =3D data;
> -
> -		if (!cp_iova_pinned(&private->cp, unmap->iova))
> -			return NOTIFY_OK;
> +		container_of(vdev, struct vfio_ccw_private, vdev);
>=20
> -		if (vfio_ccw_mdev_reset(private))
> -			return NOTIFY_BAD;
> +	/* Drivers MUST unpin pages in response to an invalidation. */
> +	if (!cp_iova_pinned(&private->cp, iova))
> +		return;
>=20
> -		cp_free(&private->cp);
> -		return NOTIFY_OK;
> -	}
> +	if (vfio_ccw_mdev_reset(private))
> +		return;
>=20
> -	return NOTIFY_DONE;
> +	cp_free(&private->cp);
>  }
>=20
>  static ssize_t name_show(struct mdev_type *mtype,
> @@ -178,19 +166,11 @@ static int vfio_ccw_mdev_open_device(struct
> vfio_device *vdev)
>  {
>  	struct vfio_ccw_private *private =3D
>  		container_of(vdev, struct vfio_ccw_private, vdev);
> -	unsigned long events =3D VFIO_IOMMU_NOTIFY_DMA_UNMAP;
>  	int ret;
>=20
> -	private->nb.notifier_call =3D vfio_ccw_mdev_notifier;
> -
> -	ret =3D vfio_register_notifier(vdev, VFIO_IOMMU_NOTIFY,
> -				     &events, &private->nb);
> -	if (ret)
> -		return ret;
> -
>  	ret =3D vfio_ccw_register_async_dev_regions(private);
>  	if (ret)
> -		goto out_unregister;
> +		return ret;
>=20
>  	ret =3D vfio_ccw_register_schib_dev_regions(private);
>  	if (ret)
> @@ -204,7 +184,6 @@ static int vfio_ccw_mdev_open_device(struct
> vfio_device *vdev)
>=20
>  out_unregister:
>  	vfio_ccw_unregister_dev_regions(private);
> -	vfio_unregister_notifier(vdev, VFIO_IOMMU_NOTIFY, &private->nb);
>  	return ret;
>  }
>=20
> @@ -222,7 +201,6 @@ static void vfio_ccw_mdev_close_device(struct
> vfio_device *vdev)
>=20
>  	cp_free(&private->cp);
>  	vfio_ccw_unregister_dev_regions(private);
> -	vfio_unregister_notifier(vdev, VFIO_IOMMU_NOTIFY, &private->nb);
>  }
>=20
>  static ssize_t vfio_ccw_mdev_read_io_region(struct vfio_ccw_private
> *private,
> @@ -645,6 +623,7 @@ static const struct vfio_device_ops vfio_ccw_dev_ops
> =3D {
>  	.write =3D vfio_ccw_mdev_write,
>  	.ioctl =3D vfio_ccw_mdev_ioctl,
>  	.request =3D vfio_ccw_mdev_request,
> +	.dma_unmap =3D vfio_ccw_dma_unmap,
>  };
>=20
>  struct mdev_driver vfio_ccw_mdev_driver =3D {
> diff --git a/drivers/s390/cio/vfio_ccw_private.h
> b/drivers/s390/cio/vfio_ccw_private.h
> index 7272eb78861244..2627791c9006d4 100644
> --- a/drivers/s390/cio/vfio_ccw_private.h
> +++ b/drivers/s390/cio/vfio_ccw_private.h
> @@ -98,7 +98,6 @@ struct vfio_ccw_private {
>  	struct completion	*completion;
>  	atomic_t		avail;
>  	struct mdev_device	*mdev;
> -	struct notifier_block	nb;
>  	struct ccw_io_region	*io_region;
>  	struct mutex		io_mutex;
>  	struct vfio_ccw_region *region;
> diff --git a/drivers/s390/crypto/vfio_ap_ops.c
> b/drivers/s390/crypto/vfio_ap_ops.c
> index a7d2a95796d360..bb1a1677c5c230 100644
> --- a/drivers/s390/crypto/vfio_ap_ops.c
> +++ b/drivers/s390/crypto/vfio_ap_ops.c
> @@ -1226,34 +1226,14 @@ static int vfio_ap_mdev_set_kvm(struct
> ap_matrix_mdev *matrix_mdev,
>  	return 0;
>  }
>=20
> -/**
> - * vfio_ap_mdev_iommu_notifier - IOMMU notifier callback
> - *
> - * @nb: The notifier block
> - * @action: Action to be taken
> - * @data: data associated with the request
> - *
> - * For an UNMAP request, unpin the guest IOVA (the NIB guest address we
> - * pinned before). Other requests are ignored.
> - *
> - * Return: for an UNMAP request, NOFITY_OK; otherwise NOTIFY_DONE.
> - */
> -static int vfio_ap_mdev_iommu_notifier(struct notifier_block *nb,
> -				       unsigned long action, void *data)
> +static void vfio_ap_mdev_dma_unmap(struct vfio_device *vdev, u64 iova,
> +				   u64 length)
>  {
> -	struct ap_matrix_mdev *matrix_mdev;
> -
> -	matrix_mdev =3D container_of(nb, struct ap_matrix_mdev,
> iommu_notifier);
> -
> -	if (action =3D=3D VFIO_IOMMU_NOTIFY_DMA_UNMAP) {
> -		struct vfio_iommu_type1_dma_unmap *unmap =3D data;
> -		unsigned long g_pfn =3D unmap->iova >> PAGE_SHIFT;
> -
> -		vfio_unpin_pages(&matrix_mdev->vdev, &g_pfn, 1);
> -		return NOTIFY_OK;
> -	}
> +	struct ap_matrix_mdev *matrix_mdev =3D
> +		container_of(vdev, struct ap_matrix_mdev, vdev);
> +	unsigned long g_pfn =3D iova >> PAGE_SHIFT;
>=20
> -	return NOTIFY_DONE;
> +	vfio_unpin_pages(&matrix_mdev->vdev, &g_pfn, 1);
>  }
>=20
>  /**
> @@ -1380,27 +1360,11 @@ static int vfio_ap_mdev_open_device(struct
> vfio_device *vdev)
>  {
>  	struct ap_matrix_mdev *matrix_mdev =3D
>  		container_of(vdev, struct ap_matrix_mdev, vdev);
> -	unsigned long events;
> -	int ret;
>=20
>  	if (!vdev->kvm)
>  		return -EINVAL;
>=20
> -	ret =3D vfio_ap_mdev_set_kvm(matrix_mdev, vdev->kvm);
> -	if (ret)
> -		return ret;
> -
> -	matrix_mdev->iommu_notifier.notifier_call =3D
> vfio_ap_mdev_iommu_notifier;
> -	events =3D VFIO_IOMMU_NOTIFY_DMA_UNMAP;
> -	ret =3D vfio_register_notifier(vdev, VFIO_IOMMU_NOTIFY, &events,
> -				     &matrix_mdev->iommu_notifier);
> -	if (ret)
> -		goto err_kvm;
> -	return 0;
> -
> -err_kvm:
> -	vfio_ap_mdev_unset_kvm(matrix_mdev);
> -	return ret;
> +	return vfio_ap_mdev_set_kvm(matrix_mdev, vdev->kvm);
>  }
>=20
>  static void vfio_ap_mdev_close_device(struct vfio_device *vdev)
> @@ -1408,8 +1372,6 @@ static void vfio_ap_mdev_close_device(struct
> vfio_device *vdev)
>  	struct ap_matrix_mdev *matrix_mdev =3D
>  		container_of(vdev, struct ap_matrix_mdev, vdev);
>=20
> -	vfio_unregister_notifier(vdev, VFIO_IOMMU_NOTIFY,
> -				 &matrix_mdev->iommu_notifier);
>  	vfio_ap_mdev_unset_kvm(matrix_mdev);
>  }
>=20
> @@ -1461,6 +1423,7 @@ static const struct vfio_device_ops
> vfio_ap_matrix_dev_ops =3D {
>  	.open_device =3D vfio_ap_mdev_open_device,
>  	.close_device =3D vfio_ap_mdev_close_device,
>  	.ioctl =3D vfio_ap_mdev_ioctl,
> +	.dma_unmap =3D vfio_ap_mdev_dma_unmap,
>  };
>=20
>  static struct mdev_driver vfio_ap_matrix_driver =3D {
> diff --git a/drivers/s390/crypto/vfio_ap_private.h
> b/drivers/s390/crypto/vfio_ap_private.h
> index a26efd804d0df3..abb59d59f81b20 100644
> --- a/drivers/s390/crypto/vfio_ap_private.h
> +++ b/drivers/s390/crypto/vfio_ap_private.h
> @@ -81,8 +81,6 @@ struct ap_matrix {
>   * @node:	allows the ap_matrix_mdev struct to be added to a list
>   * @matrix:	the adapters, usage domains and control domains assigned
> to the
>   *		mediated matrix device.
> - * @iommu_notifier: notifier block used for specifying callback function=
 for
> - *		    handling the VFIO_IOMMU_NOTIFY_DMA_UNMAP even
>   * @kvm:	the struct holding guest's state
>   * @pqap_hook:	the function pointer to the interception handler for
> the
>   *		PQAP(AQIC) instruction.
> @@ -92,7 +90,6 @@ struct ap_matrix_mdev {
>  	struct vfio_device vdev;
>  	struct list_head node;
>  	struct ap_matrix matrix;
> -	struct notifier_block iommu_notifier;
>  	struct kvm *kvm;
>  	crypto_hook pqap_hook;
>  	struct mdev_device *mdev;
> diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
> index 61e71c1154be67..f005b644ab9e69 100644
> --- a/drivers/vfio/vfio.c
> +++ b/drivers/vfio/vfio.c
> @@ -1077,8 +1077,20 @@ static void vfio_device_unassign_container(struct
> vfio_device *device)
>  	up_write(&device->group->group_rwsem);
>  }
>=20
> +static int vfio_iommu_notifier(struct notifier_block *nb, unsigned long
> action,
> +			       void *data)
> +{
> +	struct vfio_device *vfio_device =3D
> +		container_of(nb, struct vfio_device, iommu_nb);
> +	struct vfio_iommu_type1_dma_unmap *unmap =3D data;
> +
> +	vfio_device->ops->dma_unmap(vfio_device, unmap->iova, unmap-
> >size);
> +	return NOTIFY_OK;
> +}
> +
>  static struct file *vfio_device_open(struct vfio_device *device)
>  {
> +	struct vfio_iommu_driver *iommu_driver;
>  	struct file *filep;
>  	int ret;
>=20
> @@ -1109,6 +1121,18 @@ static struct file *vfio_device_open(struct
> vfio_device *device)
>  			if (ret)
>  				goto err_undo_count;
>  		}
> +
> +		iommu_driver =3D device->group->container->iommu_driver;
> +		if (device->ops->dma_unmap && iommu_driver &&
> +		    iommu_driver->ops->register_notifier) {
> +			unsigned long events =3D
> VFIO_IOMMU_NOTIFY_DMA_UNMAP;
> +
> +			device->iommu_nb.notifier_call =3D
> vfio_iommu_notifier;
> +			iommu_driver->ops->register_notifier(
> +				device->group->container->iommu_data,
> &events,
> +				&device->iommu_nb);
> +		}
> +
>  		up_read(&device->group->group_rwsem);
>  	}
>  	mutex_unlock(&device->dev_set->lock);
> @@ -1143,8 +1167,16 @@ static struct file *vfio_device_open(struct
> vfio_device *device)
>  err_close_device:
>  	mutex_lock(&device->dev_set->lock);
>  	down_read(&device->group->group_rwsem);
> -	if (device->open_count =3D=3D 1 && device->ops->close_device)
> +	if (device->open_count =3D=3D 1 && device->ops->close_device) {
>  		device->ops->close_device(device);
> +
> +		iommu_driver =3D device->group->container->iommu_driver;
> +		if (device->ops->dma_unmap && iommu_driver &&
> +		    iommu_driver->ops->register_notifier)
> +			iommu_driver->ops->unregister_notifier(
> +				device->group->container->iommu_data,
> +				&device->iommu_nb);
> +	}
>  err_undo_count:
>  	device->open_count--;
>  	if (device->open_count =3D=3D 0 && device->kvm)
> @@ -1339,12 +1371,20 @@ static const struct file_operations
> vfio_group_fops =3D {
>  static int vfio_device_fops_release(struct inode *inode, struct file *fi=
lep)
>  {
>  	struct vfio_device *device =3D filep->private_data;
> +	struct vfio_iommu_driver *iommu_driver;
>=20
>  	mutex_lock(&device->dev_set->lock);
>  	vfio_assert_device_open(device);
>  	down_read(&device->group->group_rwsem);
>  	if (device->open_count =3D=3D 1 && device->ops->close_device)
>  		device->ops->close_device(device);
> +
> +	iommu_driver =3D device->group->container->iommu_driver;
> +	if (device->ops->dma_unmap && iommu_driver &&
> +	    iommu_driver->ops->register_notifier)
> +		iommu_driver->ops->unregister_notifier(
> +			device->group->container->iommu_data,
> +			&device->iommu_nb);
>  	up_read(&device->group->group_rwsem);
>  	device->open_count--;
>  	if (device->open_count =3D=3D 0)
> @@ -2027,90 +2067,6 @@ int vfio_dma_rw(struct vfio_device *device,
> dma_addr_t user_iova, void *data,
>  }
>  EXPORT_SYMBOL(vfio_dma_rw);
>=20
> -static int vfio_register_iommu_notifier(struct vfio_group *group,
> -					unsigned long *events,
> -					struct notifier_block *nb)
> -{
> -	struct vfio_container *container;
> -	struct vfio_iommu_driver *driver;
> -	int ret;
> -
> -	lockdep_assert_held_read(&group->group_rwsem);
> -
> -	container =3D group->container;
> -	driver =3D container->iommu_driver;
> -	if (likely(driver && driver->ops->register_notifier))
> -		ret =3D driver->ops->register_notifier(container->iommu_data,
> -						     events, nb);
> -	else
> -		ret =3D -ENOTTY;
> -
> -	return ret;
> -}
> -
> -static int vfio_unregister_iommu_notifier(struct vfio_group *group,
> -					  struct notifier_block *nb)
> -{
> -	struct vfio_container *container;
> -	struct vfio_iommu_driver *driver;
> -	int ret;
> -
> -	lockdep_assert_held_read(&group->group_rwsem);
> -
> -	container =3D group->container;
> -	driver =3D container->iommu_driver;
> -	if (likely(driver && driver->ops->unregister_notifier))
> -		ret =3D driver->ops->unregister_notifier(container-
> >iommu_data,
> -						       nb);
> -	else
> -		ret =3D -ENOTTY;
> -
> -	return ret;
> -}
> -
> -int vfio_register_notifier(struct vfio_device *device,
> -			   enum vfio_notify_type type, unsigned long *events,
> -			   struct notifier_block *nb)
> -{
> -	struct vfio_group *group =3D device->group;
> -	int ret;
> -
> -	if (!nb || !events || (*events =3D=3D 0) ||
> -	    !vfio_assert_device_open(device))
> -		return -EINVAL;
> -
> -	switch (type) {
> -	case VFIO_IOMMU_NOTIFY:
> -		ret =3D vfio_register_iommu_notifier(group, events, nb);
> -		break;
> -	default:
> -		ret =3D -EINVAL;
> -	}
> -	return ret;
> -}
> -EXPORT_SYMBOL(vfio_register_notifier);
> -
> -int vfio_unregister_notifier(struct vfio_device *device,
> -			     enum vfio_notify_type type,
> -			     struct notifier_block *nb)
> -{
> -	struct vfio_group *group =3D device->group;
> -	int ret;
> -
> -	if (!nb || !vfio_assert_device_open(device))
> -		return -EINVAL;
> -
> -	switch (type) {
> -	case VFIO_IOMMU_NOTIFY:
> -		ret =3D vfio_unregister_iommu_notifier(group, nb);
> -		break;
> -	default:
> -		ret =3D -EINVAL;
> -	}
> -	return ret;
> -}
> -EXPORT_SYMBOL(vfio_unregister_notifier);
> -
>  /*
>   * Module/class support
>   */
> diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
> index a6713022115155..cb2e4e9baa8fe8 100644
> --- a/drivers/vfio/vfio.h
> +++ b/drivers/vfio/vfio.h
> @@ -33,6 +33,11 @@ enum vfio_iommu_notify_type {
>  	VFIO_IOMMU_CONTAINER_CLOSE =3D 0,
>  };
>=20
> +/* events for register_notifier() */
> +enum {
> +	VFIO_IOMMU_NOTIFY_DMA_UNMAP =3D 1,
> +};
> +
>  /**
>   * struct vfio_iommu_driver_ops - VFIO IOMMU driver callbacks
>   */
> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> index aa888cc517578e..b76623e3b92fca 100644
> --- a/include/linux/vfio.h
> +++ b/include/linux/vfio.h
> @@ -44,6 +44,7 @@ struct vfio_device {
>  	unsigned int open_count;
>  	struct completion comp;
>  	struct list_head group_next;
> +	struct notifier_block iommu_nb;
>  };
>=20
>  /**
> @@ -60,6 +61,8 @@ struct vfio_device {
>   * @match: Optional device name match callback (return: 0 for no-match, =
>0
> for
>   *         match, -errno for abort (ex. match with insufficient or incor=
rect
>   *         additional args)
> + * @dma_unmap: Called when userspace unmaps IOVA from the container
> + *             this device is attached to.
>   * @device_feature: Optional, fill in the VFIO_DEVICE_FEATURE ioctl
>   * @migration_set_state: Optional callback to change the migration state=
 for
>   *         devices that support migration. It's mandatory for
> @@ -85,6 +88,7 @@ struct vfio_device_ops {
>  	int	(*mmap)(struct vfio_device *vdev, struct vm_area_struct
> *vma);
>  	void	(*request)(struct vfio_device *vdev, unsigned int count);
>  	int	(*match)(struct vfio_device *vdev, char *buf);
> +	void	(*dma_unmap)(struct vfio_device *vdev, u64 iova, u64
> length);
>  	int	(*device_feature)(struct vfio_device *device, u32 flags,
>  				  void __user *arg, size_t argsz);
>  	struct file *(*migration_set_state)(
> @@ -154,23 +158,6 @@ extern int vfio_unpin_pages(struct vfio_device
> *device, unsigned long *user_pfn,
>  extern int vfio_dma_rw(struct vfio_device *device, dma_addr_t user_iova,
>  		       void *data, size_t len, bool write);
>=20
> -/* each type has independent events */
> -enum vfio_notify_type {
> -	VFIO_IOMMU_NOTIFY =3D 0,
> -};
> -
> -/* events for VFIO_IOMMU_NOTIFY */
> -#define VFIO_IOMMU_NOTIFY_DMA_UNMAP	BIT(0)
> -
> -extern int vfio_register_notifier(struct vfio_device *device,
> -				  enum vfio_notify_type type,
> -				  unsigned long *required_events,
> -				  struct notifier_block *nb);
> -extern int vfio_unregister_notifier(struct vfio_device *device,
> -				    enum vfio_notify_type type,
> -				    struct notifier_block *nb);
> -
> -
>  /*
>   * Sub-module helpers
>   */
> --
> 2.36.1

