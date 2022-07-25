Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E336F57FD51
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 12:21:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2112D112712;
	Mon, 25 Jul 2022 10:20:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8BC714AF0B;
 Mon, 25 Jul 2022 10:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658744449; x=1690280449;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=o9miXTJtC5ozLUoB3GI6DEb1VDi/tiDcHVHmLwR2oSk=;
 b=mjJ4X4WhvJvHzwPMEakRl+JR+Q6SWEALInQcqybK6LxISc5o/BOXEzF/
 nx8fNxVE0Wh0Fp8RVrhmxHZo1pn8awKYUUJbav/8+FsCD5oKGKetdFT2A
 UlFTjtdV3T7rhw2tR7HRPKZgRCz0ECxaZYt7z77z9ARmWgBS6oXofTlrs
 wmKFWrhUbDgh9x9HP8MxT/AEVIFXTa4PJymiIsqPlcqvzivyF8EyVTVDp
 H5qQXpJLfjM35mLR4/UJMPSo4DbO7z91XjLaRqmXm2poUi91EQpd2w/f1
 tbVJCVm/R2HNpd0cnbeYh9r0Mm1Law5R5xuJm6P++9rrVIHhyNuLQGmEb A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10418"; a="288422552"
X-IronPort-AV: E=Sophos;i="5.93,192,1654585200"; d="scan'208";a="288422552"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 03:20:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,192,1654585200"; d="scan'208";a="627397764"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga008.jf.intel.com with ESMTP; 25 Jul 2022 03:20:45 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 25 Jul 2022 03:20:45 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 25 Jul 2022 03:20:44 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Mon, 25 Jul 2022 03:20:44 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 25 Jul 2022 03:20:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l6eNeUnuGpraIJjOjY7R0pDvZaLj6qxA0ZHjTu7R11XeHdczteKkgnL/a4T4ohv3tL9sMqlB2nJgjhZNmTFArnXpLb+xHv6yA3G+1LUJc52R/7qXN+MRk5chWQMulx5VwOYgYdHL+nhwlVnAu0qk8msS2SnJJuwHmuaZQFgecW9Ox2U152iFKLpVNOO/pExhWw3jM7bWYQepDmd0LOTPAPpHLAC/UbvwK0Vpn85eLAt9Axv7bUir33Sa8gKTkG/4nU3foiV7KJChQkLLgSVZU5Nr3CPpd5R246uxrweJtS3m1BSo+Cx47YYO4rt/4LzjwWXGcOyMx8hy8Bkh0gNKIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zwhK+ECG5pI7xdKUcVToEIzNy7TNokdwAi2UBKnUuQ0=;
 b=RJzLYN2inkkPBhsAJONMyohTyQP0huYpsr0POPZHKWVX1Kqx+qmTLEF4DG31MuGjBD03XsEOIK+1/zc7MUnDFQWuUAxh4ywYd7esL6kh78HUbw+ZfXZKSKMbTIvroXQdfcuu+i7fkKdwBxmNhbIif6Pmst9/TXIkvYnn/N27KQmscfy2pKEpLXbZW5N78wRcIs80xkzf2beUlmzvme1m++PBSNGViZyh0gaLdVtViUD7r50T3kLcxFOR52A/HwRCH/KJH6QelF64B8PvmpmSsn5qjqW84EbyjGVDE19+9X58da4fr9csF76UY5WGMtCs4CFBkbK/NwDxs+lsdFXHiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB5873.namprd11.prod.outlook.com (2603:10b6:806:228::11)
 by DM6PR11MB3465.namprd11.prod.outlook.com (2603:10b6:5:b::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.19; Mon, 25 Jul 2022 10:20:42 +0000
Received: from SA1PR11MB5873.namprd11.prod.outlook.com
 ([fe80::8d27:311c:225e:ff57]) by SA1PR11MB5873.namprd11.prod.outlook.com
 ([fe80::8d27:311c:225e:ff57%4]) with mapi id 15.20.5458.024; Mon, 25 Jul 2022
 10:20:42 +0000
From: "Xu, Terrence" <terrence.xu@intel.com>
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
 "Tian, Kevin" <kevin.tian@intel.com>, "hch@infradead.org" <hch@infradead.org>
Subject: RE: [PATCH v4 00/10] cover-letter: Update vfio_pin/unpin_pages API
Thread-Topic: [PATCH v4 00/10] cover-letter: Update vfio_pin/unpin_pages API
Thread-Index: AQHYnjiH4GVWQdYkokqjavOdPoRut62O4eUA
Date: Mon, 25 Jul 2022 10:20:42 +0000
Message-ID: <SA1PR11MB5873AA479883576C9B591D3BF0959@SA1PR11MB5873.namprd11.prod.outlook.com>
References: <20220723020256.30081-1-nicolinc@nvidia.com>
In-Reply-To: <20220723020256.30081-1-nicolinc@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.500.17
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e0e87462-6edf-48da-538c-08da6e27545f
x-ms-traffictypediagnostic: DM6PR11MB3465:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 41ZeUfg8BnzxjHz68fGc/GK7C2se0uTwesf1gZkEUX+mUSp0GjIP4UcCq3PkgS0EapmHcUi2a3RLEo+28MrP1CMPTTQ2FGP83otqGug8IF3ZmnK6L3v0zP3pjzugFZsyP6wlUDeufrO2E574TNjX6GWxAXUEbJgw3BPeTrhrqILXWS+hLMqP9ImP8Le8G3yIiQLpVDKVBOIa4XmyI7r96O3DH8XJf1dHmSFBEDFd+J8G/bql30uFDtsc/B4fJXv2J59mgR0w1IHNbKGqEvzzlY0BanRKXyfQMYODkf+LmaHPmcN6PbAy4W0ANml0H4FF8i3J/NnCSQHPoy/Lmh2lmsiUAl0wQl0JPVgZlXgOO1SMz8A/1J+PkMDjZVGs6pIH98DHQlj7ZV667/IPNagFZwWu5yA/rHUWuMMdBN96ekbNBn/II8E1/ecVnxpyyIVyFj0lubpzXmTLt2bCA8GsSq5k8pCNbmnTbmrNckhk+FU+ChUg25Hrwg38q9S6CRyk6eI2/LKCpl0aAYZtzTOG35StxW9mGyDp0FzWA7RBuQspI+BvlZHKvwN7RvVxNhMTbDs2y77Bt2FkEKC1JyU4pHY9vK2wY1qhC/YlHm8VELZno2Omuljes5OXvdcLmJrDLdQe35htlMTzcjvpWNxwi+wB2wfYDQProlUzteHidaJG65O/quO4V6JkIZExNRWfPeZuCeNay1+gw/hg5KUrJFc+oC5W1muksxoVWKejIZkeOJ3nMf7Z8ZkzA7IykWt1rCT4wo0aN4pPg3aK8nHUh+ipdDcWLN48UELk7TxPKaztUzzkRnIx0puUYhgM/qBBBntBIMUrh6pFQS4b/BOmtCFobZQwMCPnIYVNG8WNVjKKtcUWl+bhcHX3XHHqJV8ofanHagRZxNenSMBHr5Vjbw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB5873.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(136003)(396003)(346002)(366004)(376002)(122000001)(7416002)(52536014)(38100700002)(110136005)(66446008)(7406005)(8936002)(82960400001)(2906002)(5660300002)(478600001)(966005)(66556008)(8676002)(26005)(41300700001)(54906003)(86362001)(7696005)(6506007)(83380400001)(66946007)(76116006)(4326008)(64756008)(66476007)(15650500001)(921005)(316002)(186003)(38070700005)(55016003)(33656002)(9686003)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?J1eENoZkDTrIdHgsSHSq89pOxZVfrzW7mgCnHIMPEjeAh/lXbHye6tvOq538?=
 =?us-ascii?Q?h7WKeQIYtfGwY+vlE/L9QBmCE8zhvRT9btXzLQPoB1S+1oVxWy6iuRz6hKH3?=
 =?us-ascii?Q?wVBWy3YzAYZXiZb5myYCLz57VABp3Wawj9eaO17Sqq51R+UqAHup4fseXE28?=
 =?us-ascii?Q?/fU1iHGBbFK2lPn4GS9vuztO7mzR+WRT2TMRvV7lU7gJ5oYcDATVzxbkwWbH?=
 =?us-ascii?Q?FIHfDSXddcXZnQV5omxkV5+oL7XkAgInSQBWXxrJZelcpH9GfEL0bV3C+aSD?=
 =?us-ascii?Q?/PRbiRrhmodxD/kT+AfK0H9Et3h6l/podLspwQF0zX1IL8wf3RdLejZ1qa92?=
 =?us-ascii?Q?61gY+zPqtr6D4WUYpxliLsTZ0c7G7VPH+fZPrq7fZSDFJFf4aFbhjerXqwK6?=
 =?us-ascii?Q?MNj9r1PbVsm/Tydmo9kmRQCqtOwLpKlnB8jHqImPHI0zSNN01JlZBKcHGRs+?=
 =?us-ascii?Q?kVP31sR+ARp7/U+fvmeXnsCFTe4QlqwnRQrTJ7vhfWplLm10MeH8ysSITd2T?=
 =?us-ascii?Q?8VhV55ApummrsRfIc/Xo8tikKtBPeDi/jtdGRVvWWiDEfZab9iJaGmLktkH1?=
 =?us-ascii?Q?IVO/p72GOO2q8x2uVpTHbPRLOe44CgnHlCGPBQMHq0+9/WW3BxEfJDthsfH+?=
 =?us-ascii?Q?54nrzYnbV9afml1Vx/2AaLbIPv+w5mH+r69WsyZCzZMsy7u3CbFQPuV0tCWB?=
 =?us-ascii?Q?RX1zKzn4Pb/+csjcxMd3puKUX0eDZQh0dYIv8BqxDLMNV+XGn+85nMKOupav?=
 =?us-ascii?Q?SsyYS6JxB1+wuuPnJ0Pv/olH+6+IIW9ejFJR/YG7ShlqENPYQ4zUM4RErlwz?=
 =?us-ascii?Q?c4r0ob/3PRGYTfF9AvjAHodTTcwZR/c15YcoIuWToYy4GCs8MbJmLhoCFIE5?=
 =?us-ascii?Q?erGxcZhhGjIB6TavfBpFgPD4ewjY5ItXVWVAvJd3f8qfR+Q5OXrHejjzSdhM?=
 =?us-ascii?Q?Ebo0HEaMIw1W7tv2nh8gbffXYSzbjpEHP69ninv/tS+1v3Ju/wP0WRxeM3yW?=
 =?us-ascii?Q?l5t61fHIjnFCCPm4NebXCoC1UaVXN/tWeAD6kKyhYW0V2hZ+LAkxu2ClsVkF?=
 =?us-ascii?Q?Zp+EdaERKduFyZEpv+4qv+qS3a9buJpBnSV3ik6Bb+HJ6cJoRVHHmnwnYnBS?=
 =?us-ascii?Q?mPjnKJ66NWPE0xUhMYjfDB16xptOvh/c9sd1/4uk58vQMQjjITlTRbmN2XG4?=
 =?us-ascii?Q?gntAD/SPFMOeDGC+cXc2UeHnxPs42+vkmnB2AjcOPNyWtXP37B6RTc12krf6?=
 =?us-ascii?Q?bjlv8sT7Lug2qu6neaea1liFL3t2APOV/10GjiYaUAS4cVEuZjIK0Ch+cJWE?=
 =?us-ascii?Q?QQULkDKyr6M+XSO6AXg++vai0zr/eeXGwMV86v247wY5hTFzNnvoUKfLe0fL?=
 =?us-ascii?Q?8mnz/HDd6wQLgd99tq5pGvzBvveBM09ZmfIoLtowWsZtAiaDlvOiKp6BM+G7?=
 =?us-ascii?Q?BK0osd8jPC1uJwGsIh3PXCa+KO4kXcWlHQ6ySAgGWw3dRT3SI1HypXTQG/3U?=
 =?us-ascii?Q?BBmCnyaON7lkSNCV7UmOVPEYkbefv+lEJ+eCnYE+GGiDJDe6erEEo81EMWdW?=
 =?us-ascii?Q?YRlJ0NjuOounqw+z4Ebsq86p/cIXakFY9PF+UrcK?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5873.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0e87462-6edf-48da-538c-08da6e27545f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2022 10:20:42.4503 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IOM92nn9ZDgQnvgaB7qf8rc+XZmmuzr2slRkkiLSlROjK5V7cf3zC2KgbS4JoeCaq6I224LDk8TbiR/dfbbTrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3465
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

> -----Original Message-----
> From: intel-gvt-dev <intel-gvt-dev-bounces@lists.freedesktop.org> On
> Behalf Of Nicolin Chen
>=20
> This is a preparatory series for IOMMUFD v2 patches. It prepares for
> replacing vfio_iommu_type1 implementations of vfio_pin/unpin_pages()
> with IOMMUFD version.
>=20
> There's a gap between these two versions: the vfio_iommu_type1 version
> inputs a non-contiguous PFN list and outputs another PFN list for the
> pinned physical page list, while the IOMMUFD version only supports a
> contiguous address input by accepting the starting IO virtual address of =
a
> set of pages to pin and by outputting to a physical page list.
>=20
> The nature of existing callers mostly aligns with the IOMMUFD version,
> except s390's vfio_ccw_cp code where some additional change is needed
> along with this series. Overall, updating to "iova" and "phys_page"
> does improve the caller side to some extent.
>=20
> Also fix a misuse of physical address and virtual address in the s390's c=
rypto
> code. And update the input naming at the adjacent vfio_dma_rw().
>=20
> This is on github:
> https://github.com/nicolinc/iommufd/commits/vfio_pin_pages-v4
>=20
> Terrence has tested this series on i915; Eric has tested on s390.
>=20
> Thanks!
>=20
> Changelog
> v4:
>  * Dropped double-shifting at two gvt_unpin_guest_page calls, fixing
>    a bug that's discovered by Alex
>  * Added Reviewed-by from Anthony Krowiak
>  * Rebased on top of linux-vfio's next
> v3: https://lore.kernel.org/kvm/20220708224427.1245-1-
> nicolinc@nvidia.com/
>  * Added a patch to replace roundup with DIV_ROUND_UP in i915 gvt
>  * Dropped the "driver->ops->unpin_pages" and NULL checks in PATCH-1
>  * Changed to use WARN_ON and separate into lines in PATCH-1
>  * Replaced "guest" words with "user" and fix typo in PATCH-5
>  * Updated commit log of PATCH-1, PATCH-6, and PATCH-10
>  * Added Reviewed/Acked-by from Christoph, Jason, Kirti, Kevin and Eric
>  * Added Tested-by from Terrence (i915) and Eric (s390)
> v2: https://lore.kernel.org/kvm/20220706062759.24946-1-
> nicolinc@nvidia.com/
>  * Added a patch to make vfio_unpin_pages return void
>  * Added two patches to remove PFN list from two s390 callers
>  * Renamed "phys_page" parameter to "pages" for vfio_pin_pages
>  * Updated commit log of kmap_local_page() patch
>  * Added Harald's "Reviewed-by" to pa_ind patch
>  * Rebased on top of Alex's extern removal path
> v1: https://lore.kernel.org/kvm/20220616235212.15185-1-
> nicolinc@nvidia.com/
>=20
> Nicolin Chen (10):
>   vfio: Make vfio_unpin_pages() return void
>   drm/i915/gvt: Replace roundup with DIV_ROUND_UP
>   vfio/ap: Pass in physical address of ind to ap_aqic()
>   vfio/ccw: Only pass in contiguous pages
>   vfio: Pass in starting IOVA to vfio_pin/unpin_pages API
>   vfio/ap: Change saved_pfn to saved_iova
>   vfio/ccw: Change pa_pfn list to pa_iova list
>   vfio: Rename user_iova of vfio_dma_rw()
>   vfio/ccw: Add kmap_local_page() for memcpy
>   vfio: Replace phys_pfn with pages for vfio_pin_pages()
>=20
>  .../driver-api/vfio-mediated-device.rst       |   6 +-
>  arch/s390/include/asm/ap.h                    |   6 +-
>  drivers/gpu/drm/i915/gvt/kvmgt.c              |  45 ++--
>  drivers/s390/cio/vfio_ccw_cp.c                | 195 +++++++++++-------
>  drivers/s390/crypto/ap_queue.c                |   2 +-
>  drivers/s390/crypto/vfio_ap_ops.c             |  54 +++--
>  drivers/s390/crypto/vfio_ap_private.h         |   4 +-
>  drivers/vfio/vfio.c                           |  54 ++---
>  drivers/vfio/vfio.h                           |   8 +-
>  drivers/vfio/vfio_iommu_type1.c               |  45 ++--
>  include/linux/vfio.h                          |   9 +-
>  11 files changed, 213 insertions(+), 215 deletions(-)

Verified the Intel KVMGT feature, no regression be introduced by v4 patch s=
eries, the previous Call Trace issue already gone.
Tested-by: Terrence Xu <terrence.xu@intel.com>
> --
> 2.17.1

