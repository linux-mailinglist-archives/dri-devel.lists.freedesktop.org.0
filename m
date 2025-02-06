Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DEFA2A13F
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 07:46:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 022FC10E442;
	Thu,  6 Feb 2025 06:46:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DSyX7+1l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9B6E10E160;
 Thu,  6 Feb 2025 06:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738824252; x=1770360252;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uRdSiBJV/7hHQNB6v9DtnnBagbQWclQYmhEzVuJDFPU=;
 b=DSyX7+1lBo9c5PM1AYYlFiRTKa7gDjGjvcn1/cEBcE0SU9vlu0D1WrCt
 tmwi05D99t5jhgBILT7mbCF2dOOr35B1H/HgqKgpH2QnpG9efUES0smKL
 qhKOB/z4rVJYCeXxtUlHOchk+rzOMElXOzvLnmgCoL2Iv0LiBadLLaOam
 IC2LAI4YYWsq+ax3AiVFzZ86S/Ss+fz5PomnddMQYlp/GrEQyf9BCQxRj
 TU2FoiI76Yh+GAEWSKKz+X1jMqntn0P1tCwVDWXcz6Bm323aPnFYBvblB
 XmRkyXldO2nzq94YW96mZRn22b6DrJj4ZI9TyaZH7cIapfn06OmhfMYuF w==;
X-CSE-ConnectionGUID: drTULWO7STumN+R1+8yCqA==
X-CSE-MsgGUID: 5Hut1W+MTRSC2DfIOtD5aA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="27014875"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; d="scan'208";a="27014875"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 22:44:12 -0800
X-CSE-ConnectionGUID: JrmDjYYySvqkY4+P1Xzyww==
X-CSE-MsgGUID: ZPJDDoPGQQaghmQFP2gvnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="142004915"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Feb 2025 22:44:12 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Feb 2025 22:44:11 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 5 Feb 2025 22:44:11 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Feb 2025 22:44:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OvU9CQx7wABHOSJRQWINHqiMpxsqdkNuqVc8p4EsHq2zCaCPlzHXQH9M5lYiv7W4jvo7cbRwfrfT5WqkAKX7T1KJ/bXBH76VWeUdrqnc4Tqz/v/3hX4Dkkw+hIB5fNW/b4NT5pETQeBFaJnMYUa2Eu2KflyG7E0M9SugQ4ylpiYpkj11C4Ya0oL4azawk4bKv/ujWuWVPKJ/Tor0lm/RwW6qXoHXvkAUmuB5X56EknyFmJXM0sPgnhT8a7rNTHm+XGEVZY4hghE06qL/AFHwMmreoEksn5F+CPTSF9KdFm1b0wZPuoLVSLwTspSeStxGkulzONXgjvAr6d5+fA/Gpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Us6V2zRNbXnljv0656cNZ+X4Z+fDXKDPU0+EjC8+eV4=;
 b=hcklu3YSx2H6gyn1ki6CNZNLyfhyp+aXDkwq1h/dC1Y1JYsR0lhmvbKckog6A2ffWaL1cLU9LcNSedyVCQp5CQcZJzFTEfZ6dPNkzWKN8wD20iSqG+IY5Qknnq7KsA/RqW2B93lyur9S7ao9t3tNwTTWzEbadhttStM/J57XDRkBtb3lfRBHg4mdS3rMVSQXPbf662LqEdMvvV2bj1WHmT/JPBB1iacMX6iC7Ls8VhJMysrjrObXUtl4MHex5+njEiOC0OWKxt5HTYBb0CarEyVqT4OwXXE3ygHLj9mJkiD7WBRmleHpQ/gIMgP6S+D4hbZt1mU1kEGJks7ZdWZbhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by MW4PR11MB6716.namprd11.prod.outlook.com (2603:10b6:303:20d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Thu, 6 Feb
 2025 06:43:55 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%5]) with mapi id 15.20.8422.012; Thu, 6 Feb 2025
 06:43:55 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Shankar, Uma" <uma.shankar@intel.com>, "Kao, Ben" <ben.kao@intel.com>
Subject: RE: [PATCH 3/8] drm/i915/backlight: Use proper interface based on eDP
 version
Thread-Topic: [PATCH 3/8] drm/i915/backlight: Use proper interface based on
 eDP version
Thread-Index: AQHbeGEJioQ5Nfj2sEC2vFoo0hdpI7M51AbA
Date: Thu, 6 Feb 2025 06:43:55 +0000
Message-ID: <IA0PR11MB73073FA674A23145294AF53BBAF62@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250206063253.2827017-1-suraj.kandpal@intel.com>
 <20250206063253.2827017-4-suraj.kandpal@intel.com>
In-Reply-To: <20250206063253.2827017-4-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|MW4PR11MB6716:EE_
x-ms-office365-filtering-correlation-id: 2fab1610-98b3-4f95-600f-08dd4679a097
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?dLHGf4AENRbPDFI0xtb1TlJA1CGHi4wdes8x1CCZyhgaT/IXwAJguFWcFHCT?=
 =?us-ascii?Q?lTkNu4YAT6UV2bk0qhuHUu4eKFEs1E0Hg9p4BR/KflockemNHtIIQzLk6JKD?=
 =?us-ascii?Q?L7fU2KiHYCWCwQN97rspDki7KLGVH6DdaGdYEegIKyFoohoU/XRAtwydaJfo?=
 =?us-ascii?Q?W0JrjknxDr+ksR0K3XjiXi+xVyTuwbVXODTk8t6HVIndAWbC5I8jHBaxGAwN?=
 =?us-ascii?Q?dRpCDS9fciTy40ZsANPDmgPDDuACtwPvQ7HSoHajWJ2uitfi2DFdQoWPgB+4?=
 =?us-ascii?Q?Fw+q3pQ3Whikdyg9BkzddSVk4GzY0DeoKlWq9G71mTAXivFs3enpqEzPuiIX?=
 =?us-ascii?Q?62yNzmMbkxyt0fds3NFTG1Nilc4uZjE2QNDRccqJMB/73YUkS+9sFP2b5k9X?=
 =?us-ascii?Q?/QKE++E7029XxxGknIXmY4+gnaO+eVTXfH7+q0Ig0FHzF1XRhoyYZnQM4hQ3?=
 =?us-ascii?Q?5Zf2ePanDx79sUJqSUAJhDJioKPQrcOg0z46KLinyc4ZE+3JffxJI42sdlyV?=
 =?us-ascii?Q?YtFki+zuy53OxgEqh1/xqiCz9vNEUOuqUEgZUfMN9zemh6+gtp9hQNv7Hj0c?=
 =?us-ascii?Q?Kmww+xk7sPUbknfLLTverFXdQ+KCDfUqFM1C42o8dYuYJfVOhKBNw2ryn5dH?=
 =?us-ascii?Q?6TPPgKMx1NoKb9ZdSQ57vPEZA4MX8wWz5NTPZnPsdw67OspOfIPFnV3j+tIz?=
 =?us-ascii?Q?RGTTq5aPDPeQv5ItlomRqSZtMF1bkzKeWp7JM+ZXBqXwiBIJFw08bxzh8YDC?=
 =?us-ascii?Q?IYyYwOodgBBYAA8h9lVFB6iBBTLfISkHqkb8E80N7VXVRI9SQr48B1c9nyzG?=
 =?us-ascii?Q?zLaL6hf01K5+dWPaE77L6riEBNw15iHVCfdohpb90vFOGtE7dxBGqHjOyKVA?=
 =?us-ascii?Q?/yD7jizviJY40vD+EXWajaoaWe3/lTm9uXSG6Aw5kWY5pWFULhKEDC+8+aZQ?=
 =?us-ascii?Q?5knIFdP4BKj34VL5G86XVCrNFE1xOMP6paPZboec0JHA7WgcF7msn1ibJY9h?=
 =?us-ascii?Q?hYqo/WGG0cK+IdqaK9zEW0gVJe3BrJ01DUCalNQKVxV2DyP1/F5KfreTYyc9?=
 =?us-ascii?Q?6COWJX9lePvP0bYfa6Ei/UEIzmMHKkM311grcV6HX+xwu4M0T1YVbXqE2SuF?=
 =?us-ascii?Q?ouRSCnJHoS/K+9geMkChTkUXkwflZoFcIBdKkYz2A/7VYNpjwTONPhvcoMDI?=
 =?us-ascii?Q?ibgJdegfBO4yIAiXXdPmQL0G+9HTVDTwNI7RhDU6XovFnOjT7nZOrTOtBEfg?=
 =?us-ascii?Q?vvD3Y3XxXtaDmcP/YCXjdL8b0d+8BCvYepCCMgfhsfUAclbT7Uuiar8WqtjM?=
 =?us-ascii?Q?o2HiDcSnIaCkU7fmO9R5EYnA7m9c0Ce9N6TmBKmz2cN13jzD5EDa+nQYARTb?=
 =?us-ascii?Q?FQaBD1ZIbF3Q3CqmvQvhQBkTrmf6cJ1LUoKYUsfSaCXGG5FV/upXPRMjVoAE?=
 =?us-ascii?Q?cTajiv9cIxld+jp/Japav0hiUW+Mv7iC?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?c+D3utzVO+Of+idU/WftKDonToDU7nY4Jss/LO631A1UohgHwKu9EqOaXo5+?=
 =?us-ascii?Q?kvi3rcpYWfq6Err9QTbC73XUcvxlm642V3H/6g87BMREYkkk8VwMULFcZHXn?=
 =?us-ascii?Q?qdieIFFDDeK6lizqJbVqXm2X1CRDgIucYTFacqfhW9LGhGMlWn6gr8iBRmWx?=
 =?us-ascii?Q?XPeCxM1pXyNj4XrT/bvaxFjtZOXno6rbQS5hvTKHSdPbLpE6U6Tyb9nxc/9+?=
 =?us-ascii?Q?Fr9PF+VSA0SoKnV5TQbLHrBGg8Gn+sFqVAa3DLYCyepS2/vjgbtXPDOxoKzi?=
 =?us-ascii?Q?Usspr9iNHpzk9B+r4XEbl32a4taUtC8ep1cup8PHxzPHL+aCCsfsjnxEGjKg?=
 =?us-ascii?Q?Qiks78IHYKuPAoRhUFGkRcTFxfWz34r9anK7D3bMmhgyp2lzE4Z0R4VjGJdY?=
 =?us-ascii?Q?d04yvQ+bDciV6wsx3d/f51TMvGKq/wK1zcbbZPYew1Ia6G+ji2JzP2qEKghG?=
 =?us-ascii?Q?+7wMSei3wTPSXcAzpH8pGZ+ctx+FsxUmgHYpRLgMCQfWgodWoGsBXa7AgezM?=
 =?us-ascii?Q?UK4IifO1n7dUZuOLRaOMxM65VgYAFe20kpGEKhVS/WKTMlfZTTIMnSQ1h9C0?=
 =?us-ascii?Q?NLcfPRM6vcaCluPTJBmbKTfOGSqK/t9jtPrqVbfJqGgTtW5MIx8E47xh8NTc?=
 =?us-ascii?Q?Zqegy95/XUbPADBrLKoOo5JXVf0rUYQCTOFYH28wcc7VSGdA47GJJ0pBp8nt?=
 =?us-ascii?Q?/bnNeZGWZpgcu8XrcEvN8pIivz+et9BIiJ1VvamHuyTsTnuUEcTCp4BVpHhl?=
 =?us-ascii?Q?+ovKllkeJHOln0vuln/j6lzPGLGNACFdjYVcX5rTD5MHhXe2guiDn0WoSt4M?=
 =?us-ascii?Q?XZrOqsTeQ0fF3GPDGJcim1ad6+NFqm96CJZkitItinMfo1EO7PErLF663wxf?=
 =?us-ascii?Q?3wHDznmFOJneeCD5JmdV4tpoC3SNWjyzIJxyywv/g5qR2Bh5DeiHRkNqogcL?=
 =?us-ascii?Q?WNNO8alncJAq5BHQfCB8mpWQAM5meuC6LthFM2luGr3jdh1w9hfi3OVPijhD?=
 =?us-ascii?Q?9H2Huby4PB3yv9eZO51HKzJKEpZd+NPjkGqGRY6Aj5me/kje/ukTaIjPeIsa?=
 =?us-ascii?Q?MPO5QWuUuSMvYihdS9RS72usFFLtGEB2S1iwddVvZllIZLohWkxhxfpU0RlD?=
 =?us-ascii?Q?ARLc/NzzRypwSBzCe0yDl5QgfTjKOGh4LItl9lT8NAz/2NvZ7FUgDE3yXU0d?=
 =?us-ascii?Q?S5kIq2Mt0Se43geNdB6DrYbX0wvX+sIqRtQjjWcuOK5gyFsProqH557AZ/qu?=
 =?us-ascii?Q?VFjGO8/O8SEXum/QifHXRfcRUImfz45c2oXI/XXATpv6ekliprkplnLDWcqb?=
 =?us-ascii?Q?i0pxJze0lzSiAqrZcHuEb+M6ZzumvvF6CtzysOeeffgwgSyCulalTCfitPv9?=
 =?us-ascii?Q?rQQ1CWrBWy0vY3NWEBcXTbSN/Lo9mfqMpUN77slG6wxp3CAaQ3hBd/NT4BzO?=
 =?us-ascii?Q?RC4AVFJwFr8Pv4HKqY8iCBMupSHI5oyr4lgJjqBr0S24uIBrsRe8QV06sW9c?=
 =?us-ascii?Q?tRpM1H4RyFlxp6oEOJ+bRs6vY4v15WwyYGK5fJR6D9aWM+KuJkMweDw8ABeh?=
 =?us-ascii?Q?Im7TDMFkwYbv56BbtOi6BcNcXc6BxQffBYSDjJ2f?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fab1610-98b3-4f95-600f-08dd4679a097
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2025 06:43:55.5539 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +ZigIR9QLdZidUr5a1FbNHt9i5OVFy3mXqaLmSLi2FIQQplKVuvTsueNObc6p36wZhlJVwsiE48lWNnbw5eUHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6716
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> eDP is supposed to use VESA interface when using revision 1.5 and above, =
use
> Intel interface for backlight control otherwise. Add check to use correct
> interface.
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> Tested-by: Ben Kao <ben.kao@intel.com>
> ---
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>

Thanks and Regards,
Arun R Murthy
--------------------

>  drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index c846ef4acf5b..09e82f24d030 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -604,6 +604,7 @@ static const struct intel_panel_bl_funcs
> intel_dp_vesa_bl_funcs =3D {  int intel_dp_aux_init_backlight_funcs(struc=
t
> intel_connector *connector)  {
>  	struct intel_display *display =3D to_intel_display(connector);
> +	struct intel_dp *intel_dp =3D intel_attached_dp(connector);
>  	struct drm_device *dev =3D connector->base.dev;
>  	struct intel_panel *panel =3D &connector->panel;
>  	bool try_intel_interface =3D false, try_vesa_interface =3D false; @@ -6=
40,6
> +641,10 @@ int intel_dp_aux_init_backlight_funcs(struct intel_connector
> *connector)
>  		break;
>  	}
>=20
> +	/* For eDP 1.5 and above we are supposed to use VESA interface for
> brightness control */
> +	if (intel_dp->edp_dpcd[0] >=3D DP_EDP_15)
> +		try_vesa_interface =3D true;
> +
>  	/*
>  	 * Since Intel has their own backlight control interface, the majority =
of
> machines out there
>  	 * using DPCD backlight controls with Intel GPUs will be using this
> interface as opposed to @@ -653,7 +658,8 @@ int
> intel_dp_aux_init_backlight_funcs(struct intel_connector *connector)
>  	 * backlight interface at all. This means that the only sensible way fo=
r us
> to detect both
>  	 * interfaces is to probe for Intel's first, and VESA's second.
>  	 */
> -	if (try_intel_interface &&
> intel_dp_aux_supports_hdr_backlight(connector)) {
> +	if (try_intel_interface &&
> intel_dp_aux_supports_hdr_backlight(connector) &&
> +	    intel_dp->edp_dpcd[0] <=3D DP_EDP_14b) {
>  		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Using Intel
> proprietary eDP backlight controls\n",
>  			    connector->base.base.id, connector->base.name);
>  		panel->backlight.funcs =3D &intel_dp_hdr_bl_funcs;
> --
> 2.34.1

