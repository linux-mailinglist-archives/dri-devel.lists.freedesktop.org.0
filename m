Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C447253B1A8
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 04:13:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89ACA1128BA;
	Thu,  2 Jun 2022 02:13:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE4DC1128B1;
 Thu,  2 Jun 2022 02:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654136004; x=1685672004;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CpmZELRWS7737o4DgzPAYcvx4Qw6Ge33L5FuuNW0AN0=;
 b=lwx5jy+eTtZTtqJGEEYg95uyavs6QC/rc5GagGaKOtDBJLTpSDAdL3ZA
 jJqNIyjSzIm3skbpUUUwALx0WSdB/EQMyUuVR6HtrxWCu4hETJGSJjP4n
 /mDrLfC8FcG+ZUwHsXIlv/w1IC9RN6nlZ1SmjmYxK6Cd+tbKoQaKnjS2S
 oaFCXkVnAC/vg05Q4FfeEhApsy2aLVXsrAm1xYpQaxGbmFAjx5Ghosp2D
 1Y59J022iHwlqUoqzJRsPTf/+NNuCGUVXrtuRjlbrZGScKxcM+/5vVV08
 b6NVFN8AKPH8HxEYcU7UU5J+1CJ/bXMm6gszeoq4aEHS1pWtmx3qVVV3D A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="275867223"
X-IronPort-AV: E=Sophos;i="5.91,270,1647327600"; d="scan'208";a="275867223"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2022 19:13:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,270,1647327600"; d="scan'208";a="606590514"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga008.jf.intel.com with ESMTP; 01 Jun 2022 19:13:23 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 1 Jun 2022 19:13:23 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 1 Jun 2022 19:13:19 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 1 Jun 2022 19:13:19 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 1 Jun 2022 19:13:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ElnjnEcpiuRhCW7fSZX3psTAlvCct5m+cgsSFnzTFi3Iq6G86yH9f+0xN41ZSDJ76hmy4i18w5Zh4hZDFl/VLaZn/nCdZLMoa+YQ+gCIgLcEPAWO+jQuopaGjTSpJFcbZOw6z51260gsL9CoGZVsYwhrCgWx3yC/wH2iNtl566bIDVshawqQkMWvkNMHGq4VJPQ67W/lIDLKkJjSZ4L2LqWpbcTgxjuT+nFnIGwIx9TVOcqrrIhX/ZgX65C4e15wH2p9NnIw9sXz33+cLkviMm4kPiE/jOX3i12e5cODp+R4goA/EY2+xQdQDh28kss46R5PdXcf/3+lW5FQGP0fTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AlkNmoxDaxncqVEUnmYtQs+byrn/nJpTDTi7Q3el7AQ=;
 b=J5a0xq0d4L0Yi/Z75YCOamh/3rdFAHkLx/t6C+vwyDM6mGoIXLuk/HN3pp2zeURszqWYffiMpwzwA17E/pMwIdHj3m3TnWyUvskKWaQJ5DM7Qi0tq2JK7uY+2VPJZixdI3a8UzPoYfc2NDkiTDqq/CujCzxBMDjbR3lc60Uc43F90bx8OTmGMpQgIj+XwRopxddxckLKw/ORg9/NMXMx6HnRWhD2+kV78TJz//EfVTVcV3akG0Hf50vxtp5IqEJTe7evXB/Xfw+VxZH4xeojLc434lEivn7YAjiKe+TV6fvojY5OeGP0hXMh1bEdqmGRlTgPwy4NadjQSaV7oltH1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN6PR11MB1633.namprd11.prod.outlook.com (2603:10b6:405:e::22)
 by BY5PR11MB4481.namprd11.prod.outlook.com (2603:10b6:a03:1bf::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.17; Thu, 2 Jun
 2022 02:13:16 +0000
Received: from BN6PR11MB1633.namprd11.prod.outlook.com
 ([fe80::c069:1a0:f1d4:8033]) by BN6PR11MB1633.namprd11.prod.outlook.com
 ([fe80::c069:1a0:f1d4:8033%5]) with mapi id 15.20.5314.012; Thu, 2 Jun 2022
 02:13:16 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vetter, 
 Daniel" <daniel.vetter@intel.com>
Subject: RE: [RFC v3 1/3] drm/doc/rfc: VM_BIND feature design document
Thread-Topic: [RFC v3 1/3] drm/doc/rfc: VM_BIND feature design document
Thread-Index: AQHYahyHcBOgLgTuZ0CGbr/thXg7iK07dnEA
Date: Thu, 2 Jun 2022 02:13:16 +0000
Message-ID: <BN6PR11MB1633EE43D5B3711AC766974192DE9@BN6PR11MB1633.namprd11.prod.outlook.com>
References: <20220517183212.20274-1-niranjana.vishwanathapura@intel.com>
 <20220517183212.20274-2-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20220517183212.20274-2-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 74f64d4e-a9dd-48bd-5525-08da443d7452
x-ms-traffictypediagnostic: BY5PR11MB4481:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BY5PR11MB448186A0D11DF99FD920078192DE9@BY5PR11MB4481.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: b+Cxh2o+FpflJG96r4OnxeMCn/2zs7and285NbbPqnLqpNobGyokN8W7Z5eIAzeuemzCKjK56kcItsn0lqGPk25wKEDK2ANyhpTaP2ahf/GOD4MvQWVvJ+EikdSSr8dzKnPNcQB0Lio9HQaCXQjNZsnfaltnFLZS0PDr5/uBM6J2zlx/GY2F7Gl7ORh9HGhU+Jod3kkg8UGYtKvV3U+st43FwIeE495vtWiFbJ0z/0Ti3w3R+k41lkXUJe96wembImkfP4VtkAkKZZkDusoQ3/DaOlvxWep/Blm/6eiuFysSMB2F98VIAXhT0/Um9S3E7COefn4X/fpFnY48XTpQ/qxv0cq7mc5isdGlXzXUQy7t3s/uggdMtMi7sgPYUO0i+Qwe8wCY7Ai8cUAa8fnsPUmN3nez2W0QbV6QfWSPrymZAmx3lihGT20eizzXff6lWGlX1zNZWa7lWCDVUODihpHu9qCjaFxhqXb+jjitjKF/S1Chp7eJneD4ImLlHK99xTuXauN6NDKu5iz3BjrGQRf/Y1YdboArIpNI0Co8G0ARCftJVY1IQK9SYou9liYzLpTpCiGOM//l8+gFc49nxxq2zpe1C6pNn4BM3864ZgXM0P7r3a/AuW1ew0JXDv6fqnoj7pP0fUWuQxVq20Uos5cVfRxnNWQPMHbElxSj06EGv43MOH3FLxWgmKGOny0R+9eoxoqKAWG+zX2Bnk6G5MztXQfK3VgZEocrXEQK1g6ubN3mX6vZa74nKRyz8x32oS0FWt18UsHEpVPD4iwK34pH7FNkJKalYDxiG5HIRXM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB1633.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(122000001)(38070700005)(86362001)(83380400001)(54906003)(30864003)(6636002)(508600001)(82960400001)(110136005)(76116006)(64756008)(4326008)(316002)(66556008)(66476007)(66946007)(71200400001)(8676002)(66446008)(7696005)(6506007)(52536014)(5660300002)(53546011)(55016003)(38100700002)(8936002)(9686003)(33656002)(2906002)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OlgtvR1/1ykqh8kXg3LKaSs2nWrWXwnn8DyLyQvgdAeINT1CHoGeAEeVvlYu?=
 =?us-ascii?Q?KB9B5EtNXxbWp3QZTQdsSiDybVa0mBqNsJo6TII5G/wwRUGoV7B7AGhjvPd/?=
 =?us-ascii?Q?Ueloq7U5MnKKx1YNOjXEjaAovHiX9i902QRWZo1R6rGBuiIU78uFpkwDN+WH?=
 =?us-ascii?Q?jgXOkgwFkpLoq9l5wxxpkifJu4fpA8VBrCaOkOBY1jOkc2JDAPC7hAOR+FEj?=
 =?us-ascii?Q?0O07iTLHG49EiVqvn3EdCXbiOWRjaMfM4BD4CI9n4fuJ7IG4fIERwLsnVk09?=
 =?us-ascii?Q?Y+tbfjmcT/SK3sn2SrjXjoK3RSdN7m/jhdYJHs1LqBa831kEfTwx4upCffbb?=
 =?us-ascii?Q?p8eyS0VkVT3wmEz3+iDX1AbfiP5GBGF3CG8y8F4jODgyL14kOaU4x8Rhn5CI?=
 =?us-ascii?Q?ty0IUKs4MWZHCuhiC91rJdbASkAmVIfEZFw9vcaUczMMUO2JFEX+VO3Eocxn?=
 =?us-ascii?Q?yEddEpnybdmfjhktBeSrKmxnuiVS5ARC/56cbVzZyOWjSmew2CB7ON8d4MmE?=
 =?us-ascii?Q?dZKKJChz92iErwXkFTWfxK/5FZSvNvQBXAxqDXERuMdGvADsASNB7znDMi+b?=
 =?us-ascii?Q?tYn7A+cRjEEntrupi2LSex81KtWT8wXq5G77/PPW7ev2IO67ePAts6NBTI1n?=
 =?us-ascii?Q?aqspyPq10Pzv2+gG8I4tTVDRYt5tYYP2FJjCBuwPBdy1aiNUYiwDMjSZ4Rhj?=
 =?us-ascii?Q?Lp/uTbMYwuDuO03r3KJhU1llE5P8+xlIT9sgq/SPaayGR2wJ5YzBxFPxbJZz?=
 =?us-ascii?Q?zoBom0LXeeQ9fnEYrb2o4nRhh3xpqqSGGc0XWVpj/RJJrZ1vq308uSVCyW6B?=
 =?us-ascii?Q?uY/TUjCzdtXR+XV7glm49iM17xXV2EhVZ+Raog4MJ3JyREaa6n1cFTeqUnRm?=
 =?us-ascii?Q?OiOgEE8Zq5AcfZOXhIs3/UUwf2fAxXVT93Xn8tBnzTDt5YaaQfBt9MicR72x?=
 =?us-ascii?Q?Jyii6nOUOtZ2WJjqfFUZKLc7frAjKYtTTxE0TwQ7kzxldyDUbowZodql4z0z?=
 =?us-ascii?Q?Wz8F+TcugnSr1BYPqGtc0PGGYVrYMOQYSqBUagwU0LwplSWKaXQpNTlYBt2k?=
 =?us-ascii?Q?iDmxRVvz2MNL/eN0Dqm+nFy+oincfLl1zjavSLp9p/YYc0Oq9n9e353uy7WC?=
 =?us-ascii?Q?/Fefrs2c7XObWHqc8eYqcVUu5ShGX0kaOsyydDNymc5w+juSQ6nJ/RGLOWLN?=
 =?us-ascii?Q?UKbZPNKbbvu+fgDCVmUggmUYBhdbsiuubl3fw5Jgf/oSqLL8KLHIl9M3q5Dl?=
 =?us-ascii?Q?Q5C3/DxDePj6tLG8R5TADXs74lH7RshEKO+K2VD+EkgKVXRXEKaxg7ikF0bj?=
 =?us-ascii?Q?iOXkX+KTal3g7eBOad5pCvK9xYRQ7bJeon+rzXgxO8UfAogI95Oco908gagj?=
 =?us-ascii?Q?QaMlU8zSREP1CLZJOIYFVYMix64w5KVHhgYRlOE+Aq8ZYsZpCidNVsUYOIgP?=
 =?us-ascii?Q?gOPmEoraTIO+Vrz/I3ravf36T7DyjiBYVRxy+fVKYU//Rds923XRMlhwbiD/?=
 =?us-ascii?Q?+iKljQgNpEScQrnyDHojeiHgmpeWqgafrbhS60GGtse8RiIAxQYSGwRG2YUB?=
 =?us-ascii?Q?yOxmdx6rz8c32IeAVRPSU1qjqUtDhK0oWMJ8C2NfJD6T5b/imALUdbSAX/oN?=
 =?us-ascii?Q?DayljrjAAcB0T5re4C7i/kcgALhcsoKOVcCf0zAKjUkqwxq7zyZ+b0zvlfDV?=
 =?us-ascii?Q?ihxDcTDXpaYPFUzWWmuvikTs6MzExYrCLrmpKDChOKLrxqARmQZhxDR5vWI0?=
 =?us-ascii?Q?rB7n6+3mwzcRi9qbcnZi8ht9+pGK9n6Fj1qZN81WxWpH6lC/yrudf4K3eL4D?=
x-ms-exchange-antispam-messagedata-1: SwBrWi5nJuKdPw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1633.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74f64d4e-a9dd-48bd-5525-08da443d7452
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2022 02:13:16.1124 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Oz8B/Syk167V7KKtd6P0rEi5Kd60R8tE6yQ0tk9XkcrWn5rYkFvS0Old0h9XsYRR+lkcMyytheVvnLkwhIrRYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4481
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
Cc: "Brost, Matthew" <matthew.brost@intel.com>, "Hellstrom,
 Thomas" <thomas.hellstrom@intel.com>, "Wilson,
 Chris P" <chris.p.wilson@intel.com>,
 "jason@jlekstrand.net" <jason@jlekstrand.net>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Regards,
Oak

> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
> Niranjana Vishwanathapura
> Sent: May 17, 2022 2:32 PM
> To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Vet=
ter,
> Daniel <daniel.vetter@intel.com>
> Cc: Brost, Matthew <matthew.brost@intel.com>; Hellstrom, Thomas
> <thomas.hellstrom@intel.com>; jason@jlekstrand.net; Wilson, Chris P
> <chris.p.wilson@intel.com>; christian.koenig@amd.com
> Subject: [RFC v3 1/3] drm/doc/rfc: VM_BIND feature design document
>=20
> VM_BIND design document with description of intended use cases.
>=20
> v2: Add more documentation and format as per review comments
>     from Daniel.
>=20
> Signed-off-by: Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com>
> ---
>  Documentation/driver-api/dma-buf.rst   |   2 +
>  Documentation/gpu/rfc/i915_vm_bind.rst | 304
> +++++++++++++++++++++++++
>  Documentation/gpu/rfc/index.rst        |   4 +
>  3 files changed, 310 insertions(+)
>  create mode 100644 Documentation/gpu/rfc/i915_vm_bind.rst
>=20
> diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-
> api/dma-buf.rst
> index 36a76cbe9095..64cb924ec5bb 100644
> --- a/Documentation/driver-api/dma-buf.rst
> +++ b/Documentation/driver-api/dma-buf.rst
> @@ -200,6 +200,8 @@ DMA Fence uABI/Sync File
>  .. kernel-doc:: include/linux/sync_file.h
>     :internal:
>=20
> +.. _indefinite_dma_fences:
> +
>  Indefinite DMA Fences
>  ~~~~~~~~~~~~~~~~~~~~~
>=20
> diff --git a/Documentation/gpu/rfc/i915_vm_bind.rst
> b/Documentation/gpu/rfc/i915_vm_bind.rst
> new file mode 100644
> index 000000000000..f1be560d313c
> --- /dev/null
> +++ b/Documentation/gpu/rfc/i915_vm_bind.rst
> @@ -0,0 +1,304 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +I915 VM_BIND feature design and use cases
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +VM_BIND feature
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +DRM_I915_GEM_VM_BIND/UNBIND ioctls allows UMD to bind/unbind GEM
> buffer
> +objects (BOs) or sections of a BOs at specified GPU virtual addresses on=
 a
> +specified address space (VM). These mappings (also referred to as persis=
tent
> +mappings) will be persistent across multiple GPU submissions (execbuff c=
alls)
> +issued by the UMD, without user having to provide a list of all required
> +mappings during each submission (as required by older execbuff mode).
> +
> +VM_BIND/UNBIND ioctls will support 'in' and 'out' fences to allow userpa=
ce
> +to specify how the binding/unbinding should sync with other operations
> +like the GPU job submission. These fences will be timeline 'drm_syncobj'=
s
> +for non-Compute contexts (See struct
> drm_i915_vm_bind_ext_timeline_fences).
> +For Compute contexts, they will be user/memory fences (See struct
> +drm_i915_vm_bind_ext_user_fence).
> +
> +VM_BIND feature is advertised to user via I915_PARAM_HAS_VM_BIND.
> +User has to opt-in for VM_BIND mode of binding for an address space (VM)
> +during VM creation time via I915_VM_CREATE_FLAGS_USE_VM_BIND
> extension.
> +
> +VM_BIND/UNBIND ioctl will immediately start binding/unbinding the mappin=
g in
> an
> +async worker. The binding and unbinding will work like a special GPU eng=
ine.
> +The binding and unbinding operations are serialized and will wait on spe=
cified
> +input fences before the operation and will signal the output fences upon=
 the
> +completion of the operation. Due to serialization, completion of an oper=
ation
> +will also indicate that all previous operations are also complete.

Hi,

Is user required to wait for the out fence be signaled before submit a gpu =
job using the vm_bind address?
Or is user required to order the gpu job to make gpu job run after vm_bind =
out fence signaled?

I think there could be different behavior on a non-faultable platform and a=
 faultable platform, such as on a non-faultable
Platform, gpu job is required to be order after vm_bind out fence signaling=
; and on a faultable platform, there is no such
Restriction since vm bind can be finished in the fault handler?

Should we document such thing?

Regards,
Oak=20


> +
> +VM_BIND features include:
> +
> +* Multiple Virtual Address (VA) mappings can map to the same physical pa=
ges
> +  of an object (aliasing).
> +* VA mapping can map to a partial section of the BO (partial binding).
> +* Support capture of persistent mappings in the dump upon GPU error.
> +* TLB is flushed upon unbind completion. Batching of TLB flushes in some
> +  use cases will be helpful.
> +* Asynchronous vm_bind and vm_unbind support with 'in' and 'out' fences.
> +* Support for userptr gem objects (no special uapi is required for this)=
.
> +
> +Execbuff ioctl in VM_BIND mode
> +-------------------------------
> +The execbuff ioctl handling in VM_BIND mode differs significantly from t=
he
> +older method. A VM in VM_BIND mode will not support older execbuff mode =
of
> +binding. In VM_BIND mode, execbuff ioctl will not accept any execlist. H=
ence,
> +no support for implicit sync. It is expected that the below work will be=
 able
> +to support requirements of object dependency setting in all use cases:
> +
> +"dma-buf: Add an API for exporting sync files"
> +(https://lwn.net/Articles/859290/)
> +
> +This also means, we need an execbuff extension to pass in the batch
> +buffer addresses (See struct
> drm_i915_gem_execbuffer_ext_batch_addresses).
> +
> +If at all execlist support in execbuff ioctl is deemed necessary for
> +implicit sync in certain use cases, then support can be added later.
> +
> +In VM_BIND mode, VA allocation is completely managed by the user instead=
 of
> +the i915 driver. Hence all VA assignment, eviction are not applicable in
> +VM_BIND mode. Also, for determining object activeness, VM_BIND mode will
> not
> +be using the i915_vma active reference tracking. It will instead use dma=
-resv
> +object for that (See `VM_BIND dma_resv usage`_).
> +
> +So, a lot of existing code in the execbuff path like relocations, VA evi=
ctions,
> +vma lookup table, implicit sync, vma active reference tracking etc., are=
 not
> +applicable in VM_BIND mode. Hence, the execbuff path needs to be cleaned=
 up
> +by clearly separating out the functionalities where the VM_BIND mode dif=
fers
> +from older method and they should be moved to separate files.
> +
> +VM_PRIVATE objects
> +-------------------
> +By default, BOs can be mapped on multiple VMs and can also be dma-buf
> +exported. Hence these BOs are referred to as Shared BOs.
> +During each execbuff submission, the request fence must be added to the
> +dma-resv fence list of all shared BOs mapped on the VM.
> +
> +VM_BIND feature introduces an optimization where user can create BO whic=
h
> +is private to a specified VM via I915_GEM_CREATE_EXT_VM_PRIVATE flag
> during
> +BO creation. Unlike Shared BOs, these VM private BOs can only be mapped =
on
> +the VM they are private to and can't be dma-buf exported.
> +All private BOs of a VM share the dma-resv object. Hence during each exe=
cbuff
> +submission, they need only one dma-resv fence list updated. Thus, the fa=
st
> +path (where required mappings are already bound) submission latency is O=
(1)
> +w.r.t the number of VM private BOs.
> +
> +VM_BIND locking hirarchy
> +-------------------------
> +The locking design here supports the older (execlist based) execbuff mod=
e, the
> +newer VM_BIND mode, the VM_BIND mode with GPU page faults and possible
> future
> +system allocator support (See `Shared Virtual Memory (SVM) support`_).
> +The older execbuff mode and the newer VM_BIND mode without page faults
> manages
> +residency of backing storage using dma_fence. The VM_BIND mode with page
> faults
> +and the system allocator support do not use any dma_fence at all.
> +
> +VM_BIND locking order is as below.
> +
> +1) Lock-A: A vm_bind mutex will protect vm_bind lists. This lock is take=
n in
> +   vm_bind/vm_unbind ioctl calls, in the execbuff path and while releasi=
ng the
> +   mapping.
> +
> +   In future, when GPU page faults are supported, we can potentially use=
 a
> +   rwsem instead, so that multiple page fault handlers can take the read=
 side
> +   lock to lookup the mapping and hence can run in parallel.
> +   The older execbuff mode of binding do not need this lock.
> +
> +2) Lock-B: The object's dma-resv lock will protect i915_vma state and ne=
eds to
> +   be held while binding/unbinding a vma in the async worker and while u=
pdating
> +   dma-resv fence list of an object. Note that private BOs of a VM will =
all
> +   share a dma-resv object.
> +
> +   The future system allocator support will use the HMM prescribed locki=
ng
> +   instead.
> +
> +3) Lock-C: Spinlock/s to protect some of the VM's lists like the list of
> +   invalidated vmas (due to eviction and userptr invalidation) etc.
> +
> +When GPU page faults are supported, the execbuff path do not take any of
> these
> +locks. There we will simply smash the new batch buffer address into the =
ring
> and
> +then tell the scheduler run that. The lock taking only happens from the =
page
> +fault handler, where we take lock-A in read mode, whichever lock-B we ne=
ed to
> +find the backing storage (dma_resv lock for gem objects, and hmm/core mm=
 for
> +system allocator) and some additional locks (lock-D) for taking care of =
page
> +table races. Page fault mode should not need to ever manipulate the vm l=
ists,
> +so won't ever need lock-C.
> +
> +VM_BIND LRU handling
> +---------------------
> +We need to ensure VM_BIND mapped objects are properly LRU tagged to avoi=
d
> +performance degradation. We will also need support for bulk LRU movement=
 of
> +VM_BIND objects to avoid additional latencies in execbuff path.
> +
> +The page table pages are similar to VM_BIND mapped objects (See
> +`Evictable page table allocations`_) and are maintained per VM and needs=
 to
> +be pinned in memory when VM is made active (ie., upon an execbuff call w=
ith
> +that VM). So, bulk LRU movement of page table pages is also needed.
> +
> +The i915 shrinker LRU has stopped being an LRU. So, it should also be mo=
ved
> +over to the ttm LRU in some fashion to make sure we once again have a
> reasonable
> +and consistent memory aging and reclaim architecture.
> +
> +VM_BIND dma_resv usage
> +-----------------------
> +Fences needs to be added to all VM_BIND mapped objects. During each
> execbuff
> +submission, they are added with DMA_RESV_USAGE_BOOKKEEP usage to
> prevent
> +over sync (See enum dma_resv_usage). One can override it with either
> +DMA_RESV_USAGE_READ or DMA_RESV_USAGE_WRITE usage during object
> dependency
> +setting (either through explicit or implicit mechanism).
> +
> +When vm_bind is called for a non-private object while the VM is already
> +active, the fences need to be copied from VM's shared dma-resv object
> +(common to all private objects of the VM) to this non-private object.
> +If this results in performance degradation, then some optimization will
> +be needed here. This is not a problem for VM's private objects as they u=
se
> +shared dma-resv object which is always updated on each execbuff submissi=
on.
> +
> +Also, in VM_BIND mode, use dma-resv apis for determining object activene=
ss
> +(See dma_resv_test_signaled() and dma_resv_wait_timeout()) and do not us=
e
> the
> +older i915_vma active reference tracking which is deprecated. This shoul=
d be
> +easier to get it working with the current TTM backend. We can remove the
> +i915_vma active reference tracking fully while supporting TTM backend fo=
r igfx.
> +
> +Evictable page table allocations
> +---------------------------------
> +Make pagetable allocations evictable and manage them similar to VM_BIND
> +mapped objects. Page table pages are similar to persistent mappings of a
> +VM (difference here are that the page table pages will not have an i915_=
vma
> +structure and after swapping pages back in, parent page link needs to be
> +updated).
> +
> +Mesa use case
> +--------------
> +VM_BIND can potentially reduce the CPU overhead in Mesa (both Vulkan and
> Iris),
> +hence improving performance of CPU-bound applications. It also allows us=
 to
> +implement Vulkan's Sparse Resources. With increasing GPU hardware
> performance,
> +reducing CPU overhead becomes more impactful.
> +
> +
> +VM_BIND Compute support
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +User/Memory Fence
> +------------------
> +The idea is to take a user specified virtual address and install an inte=
rrupt
> +handler to wake up the current task when the memory location passes the =
user
> +supplied filter. User/Memory fence is a <address, value> pair. To signal=
 the
> +user fence, specified value will be written at the specified virtual add=
ress
> +and wakeup the waiting process. User can wait on a user fence with the
> +gem_wait_user_fence ioctl.
> +
> +It also allows the user to emit their own MI_FLUSH/PIPE_CONTROL notify
> +interrupt within their batches after updating the value to have sub-batc=
h
> +precision on the wakeup. Each batch can signal a user fence to indicate
> +the completion of next level batch. The completion of very first level b=
atch
> +needs to be signaled by the command streamer. The user must provide the
> +user/memory fence for this via the
> DRM_I915_GEM_EXECBUFFER_EXT_USER_FENCE
> +extension of execbuff ioctl, so that KMD can setup the command streamer =
to
> +signal it.
> +
> +User/Memory fence can also be supplied to the kernel driver to signal/wa=
ke up
> +the user process after completion of an asynchronous operation.
> +
> +When VM_BIND ioctl was provided with a user/memory fence via the
> +I915_VM_BIND_EXT_USER_FENCE extension, it will be signaled upon the
> completion
> +of binding of that mapping. All async binds/unbinds are serialized, henc=
e
> +signaling of user/memory fence also indicate the completion of all previ=
ous
> +binds/unbinds.
> +
> +This feature will be derived from the below original work:
> +https://patchwork.freedesktop.org/patch/349417/
> +
> +Long running Compute contexts
> +------------------------------
> +Usage of dma-fence expects that they complete in reasonable amount of ti=
me.
> +Compute on the other hand can be long running. Hence it is appropriate f=
or
> +compute to use user/memory fence and dma-fence usage will be limited to
> +in-kernel consumption only. This requires an execbuff uapi extension to =
pass
> +in user fence (See struct drm_i915_vm_bind_ext_user_fence). Compute must
> opt-in
> +for this mechanism with I915_CONTEXT_CREATE_FLAGS_LONG_RUNNING flag
> during
> +context creation. The dma-fence based user interfaces like gem_wait ioct=
l and
> +execbuff out fence are not allowed on long running contexts. Implicit sy=
nc is
> +not valid as well and is anyway not supported in VM_BIND mode.
> +
> +Where GPU page faults are not available, kernel driver upon buffer inval=
idation
> +will initiate a suspend (preemption) of long running context with a dma-=
fence
> +attached to it. And upon completion of that suspend fence, finish the
> +invalidation, revalidate the BO and then resume the compute context. Thi=
s is
> +done by having a per-context preempt fence (also called suspend fence)
> proxying
> +as i915_request fence. This suspend fence is enabled when someone tries =
to
> wait
> +on it, which then triggers the context preemption.
> +
> +As this support for context suspension using a preempt fence and the res=
ume
> work
> +for the compute mode contexts can get tricky to get it right, it is bett=
er to
> +add this support in drm scheduler so that multiple drivers can make use =
of it.
> +That means, it will have a dependency on i915 drm scheduler conversion w=
ith
> GuC
> +scheduler backend. This should be fine, as the plan is to support comput=
e mode
> +contexts only with GuC scheduler backend (at least initially). This is m=
uch
> +easier to support with VM_BIND mode compared to the current heavier
> execbuff
> +path resource attachment.
> +
> +Low Latency Submission
> +-----------------------
> +Allows compute UMD to directly submit GPU jobs instead of through execbu=
ff
> +ioctl. This is made possible by VM_BIND is not being synchronized agains=
t
> +execbuff. VM_BIND allows bind/unbind of mappings required for the direct=
ly
> +submitted jobs.
> +
> +Other VM_BIND use cases
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Debugger
> +---------
> +With debug event interface user space process (debugger) is able to keep=
 track
> +of and act upon resources created by another process (debugged) and atta=
ched
> +to GPU via vm_bind interface.
> +
> +GPU page faults
> +----------------
> +GPU page faults when supported (in future), will only be supported in th=
e
> +VM_BIND mode. While both the older execbuff mode and the newer VM_BIND
> mode of
> +binding will require using dma-fence to ensure residency, the GPU page f=
aults
> +mode when supported, will not use any dma-fence as residency is purely
> managed
> +by installing and removing/invalidating page table entries.
> +
> +Page level hints settings
> +--------------------------
> +VM_BIND allows any hints setting per mapping instead of per BO.
> +Possible hints include read-only mapping, placement and atomicity.
> +Sub-BO level placement hint will be even more relevant with
> +upcoming GPU on-demand page fault support.
> +
> +Page level Cache/CLOS settings
> +-------------------------------
> +VM_BIND allows cache/CLOS settings per mapping instead of per BO.
> +
> +Shared Virtual Memory (SVM) support
> +------------------------------------
> +VM_BIND interface can be used to map system memory directly (without gem
> BO
> +abstraction) using the HMM interface. SVM is only supported with GPU pag=
e
> +faults enabled.
> +
> +
> +Broder i915 cleanups
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Supporting this whole new vm_bind mode of binding which comes with its o=
wn
> +use cases to support and the locking requirements requires proper integr=
ation
> +with the existing i915 driver. This calls for some broader i915 driver
> +cleanups/simplifications for maintainability of the driver going forward=
.
> +Here are few things identified and are being looked into.
> +
> +- Remove vma lookup cache (eb->gem_context->handles_vma). VM_BIND
> feature
> +  do not use it and complexity it brings in is probably more than the
> +  performance advantage we get in legacy execbuff case.
> +- Remove vma->open_count counting
> +- Remove i915_vma active reference tracking. VM_BIND feature will not be
> using
> +  it. Instead use underlying BO's dma-resv fence list to determine if a =
i915_vma
> +  is active or not.
> +
> +
> +VM_BIND UAPI
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +.. kernel-doc:: Documentation/gpu/rfc/i915_vm_bind.h
> diff --git a/Documentation/gpu/rfc/index.rst b/Documentation/gpu/rfc/inde=
x.rst
> index 91e93a705230..7d10c36b268d 100644
> --- a/Documentation/gpu/rfc/index.rst
> +++ b/Documentation/gpu/rfc/index.rst
> @@ -23,3 +23,7 @@ host such documentation:
>  .. toctree::
>=20
>      i915_scheduler.rst
> +
> +.. toctree::
> +
> +    i915_vm_bind.rst
> --
> 2.21.0.rc0.32.g243a4c7e27

