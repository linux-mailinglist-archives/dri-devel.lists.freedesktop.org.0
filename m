Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E222EADFCC9
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 07:17:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 616F710E995;
	Thu, 19 Jun 2025 05:17:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fl41RZab";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 734F410E16F;
 Thu, 19 Jun 2025 05:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750310244; x=1781846244;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NzgVW7O3sY1KSAme044gSrwcwQBm+eoEH7IzY2X0c7w=;
 b=Fl41RZabSGAr62EeX8jwI233VxRb38GHhX8Nr0RSg+maKL7GQ0BogXfW
 9tZkMQRrADWkTcCt+u+kYjkiuyK/meAoMWg5AFcjsmTEwoFK4rC6BvFQB
 kioTnuAXXhIWL18y7iMnVTRfq6u4fEQ/nVNf962pRXAyXW53vevUo8mme
 MuIbgkzLy5MH5i08FV+Kn30YYh/FotL08EitV/VoQizINoZze32LuI+76
 wDA01q2aedyvBTNFot3vgETZjb/FIqlY7O4soG77cmK4FFM5L1GnSkVYO
 5nW/xR5tvBWE+1hR1SUP+4m5yd8X44y9cSBaXHxQ66FNYYlm90SVNyRKY A==;
X-CSE-ConnectionGUID: 6Qdxk1+GSVexS2Hyvq1RrA==
X-CSE-MsgGUID: qcm+NBMYQCOoySUv4sb8MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="70118535"
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; d="scan'208";a="70118535"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 22:17:24 -0700
X-CSE-ConnectionGUID: /rllNMvpRFm/XfTSNuBrug==
X-CSE-MsgGUID: leha8qcKTMCjBriZOwFsWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; d="scan'208";a="150799166"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 22:17:24 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 22:17:24 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 18 Jun 2025 22:17:24 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.74) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 22:17:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U/AnsEnUPy3JxB+B9AnJeVa6hM3jyz/OO2R6xpitjhrRIn1XnfUff8ob8ItXnBQ4h+qFEw8uUrS2OheG/WzEejY0PzPJT6hhNpl5Io9xEqqIJ5dNyX+AhEw7/qryOSxGpdpO/RZdZywJUxNLZMmg6zQs78hkiJfV8DSrG4bzWN4QmGRLClplZHX8nlwqtQ8/Ldjrd3kYVkEuB4xixTcs9RCdzOWPRMIK9NEvAp7gHfvHmqs4drWbyZRoScsXpGj+TEymMCz741Ml8cgbX2+r5WVz9aTNLckz4w+mhuhK9vRcTtATCOKjM1hL/YBcSql7nWNbvNgif8BJcKla2P/L9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TYefoZ0QLcFBgJBNGhUhNjf51pM1VxeKeBeM1kbAlH0=;
 b=uV13QTIMgukQWXtqb5+5PmhB2P8laHliTUItKB79WNTbG/ubXvLQ0XSrc2BUGeVlZcHFHAlNFfWUYQB4UOYEPajup62YgcdHllWYxduZZHf8JlOs9em321rtgmTX/t89PnhsVJEVfS6h1cxz5HtfJCU2csJeqkX+gzcn4q5YoTOtymzlInkPHQTzUETHk4NfZGTl/avnUd1OjWQtjmnfKkfi9ZK/QkoKOhlhRmnBI+JVH1FGrtVyyvEj2hRVJpWSFwoZlO+umWM7u6wW8quYdlXV8HgHDzcKaKN8wjY/0amxsik5PzuvQitR6mqP6LIkYdZl8s9aRWq9aNy5ItMLQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SJ2PR11MB7501.namprd11.prod.outlook.com (2603:10b6:a03:4d2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 19 Jun
 2025 05:17:21 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%3]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 05:17:20 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH 03/13] drm/dp: Add argument for luminance range info in
 drm_edp_backlight_init
Thread-Topic: [PATCH 03/13] drm/dp: Add argument for luminance range info in
 drm_edp_backlight_init
Thread-Index: AQHbrPQjxmDvPxxadkOJV/gto6LZRrP/W3kggABU6wCAAAreoIAACGiAgAqU2rA=
Date: Thu, 19 Jun 2025 05:17:20 +0000
Message-ID: <IA0PR11MB730719B23CABD77E02CB6220BA7DA@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250414041637.128039-1-suraj.kandpal@intel.com>
 <20250414041637.128039-4-suraj.kandpal@intel.com>
 <IA0PR11MB73072A82012F059738260626BA74A@IA0PR11MB7307.namprd11.prod.outlook.com>
 <DM3PPF208195D8D82C92D58A8780E866EE6E374A@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <IA0PR11MB7307ED398EE421D9A54A686CBA74A@IA0PR11MB7307.namprd11.prod.outlook.com>
 <DM3PPF208195D8DD3B3CBE1B3B00821BC02E374A@DM3PPF208195D8D.namprd11.prod.outlook.com>
In-Reply-To: <DM3PPF208195D8DD3B3CBE1B3B00821BC02E374A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|SJ2PR11MB7501:EE_
x-ms-office365-filtering-correlation-id: 0c7c3c31-6af5-4cb7-7b39-08ddaef09105
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?KiQL9jKSiTPqqyHZ4T5POjiFPTdohGqQG9W5Pi1gEr7pI2UZTsKN/VO63kIh?=
 =?us-ascii?Q?qwtuzDftcjfVwBc5Dm8nrM+5rIROLlwMWUEd5z46PKYnslZ7ydZ0ovobohM/?=
 =?us-ascii?Q?lnLI2kOC6YhF5OhY+Z3lAU2VNz4jmaAwAdoBHk/0rr8mXy/YbblSs3kp54vA?=
 =?us-ascii?Q?ytrt4wCeU5/oMz078f0SVnLqD+5vO3t/KUF8PvGh+l2EXsT+bnVoyZBi7vaG?=
 =?us-ascii?Q?a9MGye54HUbBjN5Co1KRK+sMtmjJv0vPRY/4/HyZK2dK6jedc8LIlZYACGZk?=
 =?us-ascii?Q?WdJpk1B7SlqgWBlTyiZ6PkDazJN8UvQ+vJTmuP7z9pF4dW4SAeXTrKXzFBhF?=
 =?us-ascii?Q?ttswHGgObVVswtcdcISl4v6Y+w3FKU32tJTP7aC0xBlnrwvSVogR4UIkdevZ?=
 =?us-ascii?Q?rKYETzRljfP8+FSxyLA6rTFjJqfwBZt7gOmz1c0+b+CDt0gu9fvq1OODxdpY?=
 =?us-ascii?Q?a2V8ynJKUaxPjdgKlbi3/jXJPqXUqmBM8sdlGIPTggjkajBxzHJaOd5uGNpp?=
 =?us-ascii?Q?PTNWFwg60TvU5hp7D/WdKcoonM+fKb1QeobmZQtNzRKFmQRPRTu0eZIyTxmt?=
 =?us-ascii?Q?tT0g1Rm9d/kRWFnNBw32O+8WY6iLDS8G95OIHTHRSM/o2krV8smkZkZeh8Jk?=
 =?us-ascii?Q?+YCqJ2QOl6UfvLwNRprRP3GpmdMquAJynJvQlaL7odsbakHua46s82FeoI+l?=
 =?us-ascii?Q?2amCpcGin/qA05qQ/98p+Spqw/Lj+dxFdva5ltqJuxWB84tUHktkLt+WBBPW?=
 =?us-ascii?Q?MzgaSwxUTuTXmCYzUHOiVrsCpY3s/UETvT7vFr1axVF7AsWQDs2VwdJeernV?=
 =?us-ascii?Q?+cdLUrOkSOCaNvoeuk4o3CZONqQ1FvkQyEwP7kHDSKNF5ov5l1UfVXwx9H0L?=
 =?us-ascii?Q?IR96UAzBnT1NatV4NTcGDCqJzFh3t2FBmYHHKo/g/+wdwKlDclcZfUW0Oear?=
 =?us-ascii?Q?xJAqRrriF5NPQsWGCjyCQX0QzoOyu2qEKV7AoAvSHyb/cv9MDy6vWV8w38my?=
 =?us-ascii?Q?G80E4N8R5KHLo8Xaq72opQBWWUG14B4voTy5JXtk/Z+DDb5omrMmeUiGSpKx?=
 =?us-ascii?Q?KNfHSLVEqZHQnXq3PwJ8tVG1N9ZprwrH+zP4RMyDl2GtZOos/az0gJ1ydLl7?=
 =?us-ascii?Q?ts45pzOaZHJ6Nt5RsbXoZ8k3KITrchEcTUFcIoTBm4APvvoLmco9ayCvrCbC?=
 =?us-ascii?Q?oXF2SuCUwusEpJioIJYOJwXIWSH2Grp25n71r0hvyv0IHKPBwHCS8GXq8Uz8?=
 =?us-ascii?Q?m0rVm0/heiCBHTaWjuFcXwps3DuM1BifDyDcFvCBuBLcc6dXHN6/uuRl6zfs?=
 =?us-ascii?Q?pzdMNmZ8mHMHLn1a6kmqjcFqJ+/matu48i4cPGIXTynN4deKEUTnDwtpkNef?=
 =?us-ascii?Q?yJXgHEfU4ykueeyalqkOpD9wfdOFupGl8g72iURmAunLFdDYUvGK5ksr2rAj?=
 =?us-ascii?Q?RMVahYqndTQ/2FkBlEZATAB0jd240bwUCVLNH7eZb2ltVAvmNu+7SDC2Zpau?=
 =?us-ascii?Q?EFHLa94hRtGy0h0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4eDbzENZL8qOilFGo2xuqXOJN5Q92DkoVxRZUlFnsgcGF5kWJm2tY1HIw+R9?=
 =?us-ascii?Q?qKjyulYWPsIH/u+6/nUhUFVuBjP3mF4KrAnxu+YEdYF6KHSC+H3tanw2FyGz?=
 =?us-ascii?Q?LmFe+Cx5WeS//4whoNvf6t++OUqUuYdyvJnoXORt6H0uIjduCeU/Gk1KsqoR?=
 =?us-ascii?Q?LNdUpk3NPIJzV0g3sJ19sOkbfUawk1fA3M8IPBR3I01TR0/zvKJy9N22ng9d?=
 =?us-ascii?Q?A9YatEkUloFsSWio63BE98hogbn5MFkqO8x4CNhKo7x7lhZBkbyDUV4vJyBY?=
 =?us-ascii?Q?jKtfWP9DiCpBAHC1NocqkkAm9Nv4+UbnE7yUXNN/7VNtIlDNirzq8Vse8Fmi?=
 =?us-ascii?Q?aN70maP0RMGnnvSb6ZB6A/EytZH2ERK+l5iIQKy5ZIbWk9fmefKpyHnCec58?=
 =?us-ascii?Q?zEPT8txOAZvqcuEoHSg+T3uiUEySEXLVnaiKtOKQGJ1ZQ8E1JvtrNcTSnDBI?=
 =?us-ascii?Q?G+U8HOBpqQ06nD/j0CBLVW7DjL6T7AuJ2poep07fxDzIsTjgnYsUiFzLgjq3?=
 =?us-ascii?Q?sXsDnX7i7SQ5ScsgMFQKdJAieHNvG17HEaJvz7eq432EJFMuD/98saE+uapQ?=
 =?us-ascii?Q?xeGJCS6qXlkANfgQyEA7U7VKfuPEgFEM2B3a4tarO/i8+kDz/fRKJ62PU7kW?=
 =?us-ascii?Q?Tix4uZuX6SasFL2ceIk4554gii16KEbkS31sgq+iLIeI8YkfI5eje+Tz4kkT?=
 =?us-ascii?Q?8UDrnplFBWIUtEt5AC6l1JzgYxaBIeu6VxNueNcpRwiWcLpmZttk9s1cN6HA?=
 =?us-ascii?Q?eMBWBdZxrgSxGPRO/msg6ntwXm9GXP4kKgwloxZuogduACcxEZcxwd3ASX7i?=
 =?us-ascii?Q?0idM45Rn5BcUmA3nx4hgxxOwfqy/wpM6IF+RSo/6jSgirBAPF51MA5klcV5d?=
 =?us-ascii?Q?ImzVQAV13ZRjSKmvbyyNrXG9dBcNI+Ug0y7WCYZKHIBRIktgyfFOKdS7gKnb?=
 =?us-ascii?Q?d4vclz0+/U4Qvm70Hyjp9m+XoeHkJwqSxK/G6WwsH8BF0iVki5HQ5ArFl8bL?=
 =?us-ascii?Q?Y2TpZasbv1DQ65yoE9qr/6EoW1IsbioxP2+M5Ut8HWiJUOeC69cZZJncucYR?=
 =?us-ascii?Q?kDendU4QzXADm5H0Hde0oyLS9tjr8PzmaHEEW9WjtiX6pg1qe/GYAAi4LOsz?=
 =?us-ascii?Q?WUsg9PXzN5lHYGSdZeEYRGCrrhYeteQfwaPLUv760QWZBlHQQvRIeyeZu2CK?=
 =?us-ascii?Q?TpiqHeIVmdOm5TRMFT8Z6cC+CvHcrLuTeW1VmqnZ/oip8dGZkuXhbR4i2qnp?=
 =?us-ascii?Q?nEaRrbQNhQoGWpSGmX3JXKkarZO+kbugohzc3yHdLRLmd4qflqgOYmY88EuP?=
 =?us-ascii?Q?as/T9uuTi/ztBSHj2yeW9sZZV08bsUzjY3bcvkmcaqugVozz8Vv12lRpsGXl?=
 =?us-ascii?Q?Z2nQz/JSsXHhDBpcMoWdBVQZo4su5jV8mZ4tAybCSdCo3FxoEUKZJlaRjBbq?=
 =?us-ascii?Q?2KuRKBqb/qjHCL/DYh/4VVdTKP+KL/q0G4S2tECUW6YWjozqaT3utsrZHV44?=
 =?us-ascii?Q?SDytmrGISGPutZsRYCtm+XKyjyLmfauNVQhzsMkx3InLnHESrTD/g6jHM7Iu?=
 =?us-ascii?Q?rc9NBjJL6tcpDCnGTHOtUrXnmkuW+zygZZeBjspj?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c7c3c31-6af5-4cb7-7b39-08ddaef09105
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2025 05:17:20.4603 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8j+Yhn2Tqk3WQwjVYlhcFr8E4CSBFuOnRFkKr98XSUgc2zw1TPjwYyep4pLqz0kDBaFpCdSllECLm1QRng1zHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7501
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

> > -----Original Message-----
> > From: Murthy, Arun R <arun.r.murthy@intel.com>
> > Sent: Thursday, June 12, 2025 4:43 PM
> > To: Kandpal, Suraj <suraj.kandpal@intel.com>;
> > nouveau@lists.freedesktop.org; dri-devel@lists.freedesktop.org; intel-
> > xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> > Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>
> > Subject: RE: [PATCH 03/13] drm/dp: Add argument for luminance range
> > info in drm_edp_backlight_init
> >
> > > > > -----Original Message-----
> > > > > From: Kandpal, Suraj <suraj.kandpal@intel.com>
> > > > > Sent: Monday, April 14, 2025 9:46 AM
> > > > > To: nouveau@lists.freedesktop.org;
> > > > > dri-devel@lists.freedesktop.org;
> > > > > intel- xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> > > > > Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Murthy, Arun
> > > > > R <arun.r.murthy@intel.com>; Kandpal, Suraj
> > > > > <suraj.kandpal@intel.com>
> > > > > Subject: [PATCH 03/13] drm/dp: Add argument for luminance range
> > > > > info in drm_edp_backlight_init
> > > > >
> > > > > Add new argument to drm_edp_backlight_init which gives the
> > > > > drm_luminance_range_info struct which will be needed to set the
> > > > > min and max values for backlight.
> > > > >
> > > > > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/display/drm_dp_helper.c               | 5 ++++-
> > > > >  drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 5 +++--
> > > > >  drivers/gpu/drm/nouveau/nouveau_backlight.c           | 5 ++++-
> > > > >  include/drm/display/drm_dp_helper.h                   | 1 +
> > > > >  4 files changed, 12 insertions(+), 4 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c
> > > > > b/drivers/gpu/drm/display/drm_dp_helper.c
> > > > > index 99b27e5e3365..3b309ac5190b 100644
> > > > > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > > > > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > > > > @@ -4227,6 +4227,8 @@ drm_edp_backlight_probe_state(struct
> > > > drm_dp_aux
> > > > > *aux, struct drm_edp_backlight_i
> > > > >   * interface.
> > > > >   * @aux: The DP aux device to use for probing
> > > > >   * @bl: The &drm_edp_backlight_info struct to fill out with
> > > > > information on the backlight
> > > > > + * @lr: The &drm_luminance_range_info struct which is used to
> > > > > + get the min max when using *luminance override
> > > > >   * @driver_pwm_freq_hz: Optional PWM frequency from the driver
> > > > > in
> > hz
> > > > >   * @edp_dpcd: A cached copy of the eDP DPCD
> > > > >   * @current_level: Where to store the probed brightness level,
> > > > > if any @@ -
> > > > > 4243,6 +4245,7 @@ drm_edp_backlight_probe_state(struct
> > drm_dp_aux
> > > > > *aux, struct drm_edp_backlight_i
> > > > >   */
> > > > >  int
> > > > >  drm_edp_backlight_init(struct drm_dp_aux *aux, struct
> > > > > drm_edp_backlight_info *bl,
> > > > > +		       struct drm_luminance_range_info *lr,
> > > > Would it be better to have this drm_luminance_range_info inside
> > > > the drm_edp_backlight_info?
> > >
> > > The thing is we fill drm_edp_backlight_info struct in
> > > drm_edp_backlight_init Which means we would have to pass it anyways.
> > > So having a reference of this in drm_edp_backlight_info didn't make s=
ense.
> > >
> > The main intention for this ask is two xx_info struct passed as argumen=
t.
> > Moreover luminance is part of backlight and this new element is _info
> > and there already exists backlight_info. So wondering is luminance can
> > be put inside backlight_info. The caller of this function can fill the
> > luminance part and then make a call.
> >
>=20
> I see you point but the thing is luminance range is not something we will=
 be
> using later and is only used the set the max level of brightness that can=
 be set.
> That being said I do get your point on sending two xx_info struct here, I=
 was
> thinking we send only the
> U32 max luminance here since that's the only one we actually use. Drivers=
 can
> send the max luminance they like.
> What do you think?
>=20
That should be better! 4th patch can be squashed with this one.

Thanks and Regards,
Arun R Murthy
--------------------
> Regards,
> Suraj Kandpal
>=20
> > Thanks and Regards,
> > Arun R Murthy
> > --------------------
