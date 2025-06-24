Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FE3AE5BA8
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 06:53:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC53910E4C6;
	Tue, 24 Jun 2025 04:53:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gH5HXzzT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22E1F10E4C4;
 Tue, 24 Jun 2025 04:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750740811; x=1782276811;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=l4timxVUNjWSv7ldrPpyjW2qgkjIRTUzjndDpPQDdAw=;
 b=gH5HXzzTusVhI4nkErAeb2OUizwF6jC85nbdjT/xUrndy2GEmsMmhDom
 Pjgqmd9fmtU1kuRh4WbYNdImYwDCXYnDVGrPv3QzTYx5Ishl5T47cdKcE
 EWe5+1heT+eaie9lkWuH6TwChB0/OMSR2nI9b2wcszu3RSYeHF/CzKOVR
 h2kcRVDkkJ0xABzmIkg3ol7JCkMt75NdEBcB6ku5yPHoMuz1tN22ZKKg3
 kuqfXnkPw6I3qPVGjR3gioKKFQsf2AtkAfF1FLETqSccSMdrSi77eLyc4
 /Uiq1MPNd7o0HzJKqkbVlX2sFB9YzK5X8ugN1/oQ9ndDN9IcVNdzSer2q A==;
X-CSE-ConnectionGUID: fi7Ow7igTZubCwqKi1a42w==
X-CSE-MsgGUID: xWRuj0jhQxOu2lSeafEajA==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="70533182"
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; d="scan'208";a="70533182"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 21:53:30 -0700
X-CSE-ConnectionGUID: Go6mYYpZRmmksUlac1K7oA==
X-CSE-MsgGUID: +KNN9ylMStKhADpSUIpuAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; d="scan'208";a="151972601"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 21:53:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 21:53:29 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 21:53:29 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.51)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 21:53:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cIqNKYNMYhiY54WDZVSKfyT1s54GxX17mE121qh36BxQ4NYpIUTBVRjmWiuMYVByrOu3yzz79PlAM/qAk+3Ie81KwSRmkkoKhHPpabS84YFmRD4hdQ8YK4ze8ukSgRCRS1tyRZp04lN7WxcU4IksN1G1y9hYh5jr9Gxs58gAeyjn74aNlh9T1kb10ooyhqa2CjpjkacRIfZpb6a63ZzVD47QTpTaSaEAtcA4TzZ+83zC25ykgL0PvjpXmwKIhnQwhPMw75d2/dwQ52ZWcdJlivIvvhr8D+KAE65vU3kz54+broAf2+HloSHg03An8TZsMmptxR6BIyGdDWi//bAgHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tAInt0XlMiFsfIRDu+RBIkVysve6A2A3QKw70vsBU3A=;
 b=h97fAj/yjc5P9wsRosclsFyEfl0OI84gQpcoMN2eOhpbDdYFaCxFBFv/qbKdMk9aiEsR6YHpbvF7yXPqXouec0eXtIAIZlWLivqKUyvbl8v+sZpLu8pEBRz6zssxNOn5MlsZRzOwjF/gm9mHM5qeW98ndytmnT4BOByUyBG6u3zDc3pta01oELJKgwZQjhAKis++SHUmmsSdWelU1d8TXG4YnlLnXrvPXe01OhuWuuZKyWXMSc4WD6Yw14v81RPYmbmwJEOQEMzRLqnMpFB3C3MukeJ5l1Lip0mddlMxLXiX1AgM+Y3byK8hhf5qPOdk+ua2kmqumNu0qqhk7MMRiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by LV3PR11MB8458.namprd11.prod.outlook.com
 (2603:10b6:408:1bb::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 24 Jun
 2025 04:52:58 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::9c2a:ba60:c5fe:6a64]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::9c2a:ba60:c5fe:6a64%5]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 04:52:58 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Subject: RE: [PATCH v3 11/13] drm/i915/backlight: Use drm helper to initialize
 edp backlight
Thread-Topic: [PATCH v3 11/13] drm/i915/backlight: Use drm helper to
 initialize edp backlight
Thread-Index: AQHb4a2VslIhNy7FZk+I2ydD2jRb1bQRwteAgAABONA=
Date: Tue, 24 Jun 2025 04:52:58 +0000
Message-ID: <DM3PPF208195D8DC0A3BFD202B0AB765727E378A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250620063445.3603086-1-suraj.kandpal@intel.com>
 <20250620063445.3603086-12-suraj.kandpal@intel.com>
 <IA0PR11MB7307746E548211C22AEE96A6BA78A@IA0PR11MB7307.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB7307746E548211C22AEE96A6BA78A@IA0PR11MB7307.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|LV3PR11MB8458:EE_
x-ms-office365-filtering-correlation-id: 16bcf13c-0442-4e43-c113-08ddb2dafdb9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?nBnQsbB+kVAnMFS0Ps6gxuGRPn85d7qjyipi5tb9Y9shYhhfQox5cKrMdriW?=
 =?us-ascii?Q?4lU8SDpvfSOxCrexrG6R3bITwB0hfagpyeoL5yn3FpSNb3nmhDe9pX1yk3kg?=
 =?us-ascii?Q?DKval+wf7DHnQImw8Q5yDLlabgpn8rvo742/qzTncyBgZBlUl6f0H7g3gA+P?=
 =?us-ascii?Q?xIVnofetbjuyM41jO8UnqmnjG/Cisa4xSf6r97WhPQhzDj62A7tkggLGuTqZ?=
 =?us-ascii?Q?IJq+F+XZM8aL+szaFlpHVil2eZe5HbasRLvbo58LfNx6wTrKHjtWBKRpttNV?=
 =?us-ascii?Q?7oCJNc4EjQnM+syAsdVtI414XeACph8WhiFLFX+lkhrLRWH7jEOXLN1rxgYV?=
 =?us-ascii?Q?UmPc+Qrxn+U0U2xgEPx3hhbolnH3XeSLcpuGfkj96TYtQZyCWJCG9Wjx3ZR8?=
 =?us-ascii?Q?st3mW9cS9Cead9Zf5SnAS6L7dmm19OVSWiAt9yt6/4G7hIWGG1oMU/cZcxAS?=
 =?us-ascii?Q?amS2i96GB/wNNvLto7tBDuk/wN/spJNJx45VmftK8qwxZ47uQwH8rje80Xs9?=
 =?us-ascii?Q?Aygv+oKake8UEdW8EsE8SFrBKH7UcRIaDzNug0ZhGVeH6kJ1JGTjkrgv/AUE?=
 =?us-ascii?Q?f/6av/6ndDtnSnUQtbKp3OQY6pVomtcBJNTD54BPEZSx/v8w1tHurIhgIWmT?=
 =?us-ascii?Q?UtlxMRdhUuXKTmZQ1w3ZRkgjr6vJfXxGqVVcKzsDOSd380RNTKOX5MmTZ7nm?=
 =?us-ascii?Q?BUTZr6SgnHLSKxyjbNOPfzurY3q0Qp3b5QyDAXeHPcmnBJUCRGBjn4lVbTek?=
 =?us-ascii?Q?uVQMgIaM7lM3k2JDB4o8r0dRMO/WxNL/bc/sOdarZpl0P4Kx4vSXVZUOGIc9?=
 =?us-ascii?Q?PIOMVA8nkOwYYZhVpRcKfkTGu3ZUdPwS2bn+jnh/cd+LL2VapAH66a2XA2Zm?=
 =?us-ascii?Q?ASJl+ZCunekas4EarP7TNA+A++JWfX9bLC7to8IaSwQkaVsoazNK8XEKm/ho?=
 =?us-ascii?Q?dLkh9d3T1rErJ7idZ/hwm2mxeHLMK4XC03IUpN2MRmD6/ub0IgFK/cZde/6t?=
 =?us-ascii?Q?KlFBN64oGOL0oqkUQP2mutBPp5lrkP89ARPOw3eV8PumOpKthT815olIUJP6?=
 =?us-ascii?Q?5LAlljDEnlCBQDn3Tux0Hxgy9m38zdUk8bbiz9blXlO8Q4j4Gy7cnx1iqxfn?=
 =?us-ascii?Q?t6NtnwIIH5BJH2LZjg6c2jlYhbspvQFRbWPPp81cotp/VISGh85HzzgSXndE?=
 =?us-ascii?Q?esgpzTULGl8km3/YnBaYGR5Mln8A1gkVVdlGJ4CTtx3AIIxyyZzINSWzn1QK?=
 =?us-ascii?Q?dhkXcQRpy5k0CNi/cYChUioM5GegNG3ny8QgIyK9cp3VR2H8idmQ0UOoBAPv?=
 =?us-ascii?Q?E36ekRh9b0ZA+StxG/UbTPu5liiAXCoFWQij8nPE5LqPCr2PCTPOvLbBE3Uh?=
 =?us-ascii?Q?ZOi5YmFg4v+Xn7xL0NyB71wvOKYuNjy4WQCeKJOQkMTG5Ob/I84et//LbeCT?=
 =?us-ascii?Q?BVuRsjKslJK4zNc4DylIZeDqwigu/F4/lemJlY5UQMWV7Py9YZp7WnXE1Ssp?=
 =?us-ascii?Q?QiVKD9HOj2Snc8E=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+TCkF57c8mJy9lz9i12tLas0ROuua4cZ75mhr+xXwzR7nfvDryfzU+mv0Leb?=
 =?us-ascii?Q?El1qQmQFuCtKd7ktzMHBCC+pynbt0Jh944sMxHilwmHUYnokXjcjSf3Ouf/K?=
 =?us-ascii?Q?wd5CK/N27E18Wk7N3ZeZaYOE6gUhRALG+ATOALrTOpV9CmV/Bfv1fnH/SsXU?=
 =?us-ascii?Q?KXbPJcWduCvr4bCLcgrjdJzC8uLLzo9+Vuct40kx4c3IGD4DFmJW5vGbtC5X?=
 =?us-ascii?Q?KStVH439vEfgAglg6s2FnaMHIREpHVF6Vdj0zRll4Ru26nl3REs7ET+wLJiL?=
 =?us-ascii?Q?0Szesh5Q5OUqzQkqv2LcxZL7U2y2s76RLcEc3X7KXBRZOp/fV2QNBm09kgk5?=
 =?us-ascii?Q?SuMwpqFEAmnFDpl38vEzTVuw5lk7bnDdzuQXZS845Y9LjtrpbE1MKXPbFKe4?=
 =?us-ascii?Q?/1qX3fVaZPfwRZd+UajemMGXkiw4iEJjNYSHTPAWKJ4uNvBEFkcaHnW6pLYb?=
 =?us-ascii?Q?J8FYgFKdcBXIwxJwpiuieNLFIAVJ5Z3zwui2ONFPUMMR0D2DLM2uso2A3vSf?=
 =?us-ascii?Q?yFCarm+rPXXCZxF/g3A6SwTBwRFyxa3FSl8HelN2ui7GFqbvEvZs0nWXtnBd?=
 =?us-ascii?Q?FE1NjEN8MiCO81JZBirngXTOUpFmg4djgOWjx+yO2J1F61grYGEVW3pffZz8?=
 =?us-ascii?Q?zyOmYUg3U/gGKyO92PE7HGUZ77DEDmiQPwVGdpBgVX2FXAt/lQREnh7ObWKL?=
 =?us-ascii?Q?IgJg0l+LmdCmMIGK8k9gxbxa2zS8/gbjmYZkZ3KWTm2xyw4bwaXIQqkdCTV3?=
 =?us-ascii?Q?OO1262zW3Me3MZRwoJ8Ucpi8JYeMcNzyxrOf2CzvBRgotHLCeQOUHFvdFeZj?=
 =?us-ascii?Q?HglbZmTQNTSHQ/zHe+CbW/lwXnNKQSFbUyUAqvQWSdgCpOnfnNuX8JYW6FRx?=
 =?us-ascii?Q?TOd2gPmkhuMp2DYf8p8VdIyxsaCDlkZPmgw2DZ9NCP1rHtjC9rK4zNb7e4b0?=
 =?us-ascii?Q?2jH1BCfw6sQWAnjkZb4K96M4QQ1QpSP8RdsJmWU6aMFOl2Eusvaq6il5SRLe?=
 =?us-ascii?Q?VIKPdttKR4NV3g6vGKm+/NJzNNDev7zCQTiBh9OSrDP/bwlF8305lBT7fP6K?=
 =?us-ascii?Q?frRkgtA41YjylwkgF4kS57OIo/AY+CQp3FP9wABJhHYEBRIhs8xonAz0L5XH?=
 =?us-ascii?Q?NI5yqR5OEy3DZ4iUxNuY78QrJRrkY6DEb4CH9rjprEfk/eISSZtccuoXtIse?=
 =?us-ascii?Q?LbmmXxW3NTNfObiZeq12inJ6IDzeY2Y9e2IEHfyumskFUdteWOyfKGq6St96?=
 =?us-ascii?Q?aXN3QQnzXUxhBfCFDSesbaz2Fp92PwGiC5SreGHgB2Gssc7w/GHi2gNljH45?=
 =?us-ascii?Q?CQGgZIznFC04crmLS0SeVsCTbYTITZ64XMfOk+96YxT1aI2RTJTHQePK9Lql?=
 =?us-ascii?Q?D3mJFahKuDzzhAXVIDnLZMmONSYYKEFbnUVVbV8Z95StdHGNBesj2KoFc+t/?=
 =?us-ascii?Q?3gpMsErcjSUYNjXdbGixM/53yGhI5iR6KMsGaJvk1c1/nUeuq7YxiaVVb1FZ?=
 =?us-ascii?Q?ECn9p8NcxJttpp81gMPUIK+LB1Fj6PG/G3HU2S3o8Re9SfHMXxzTx/YTv0Dq?=
 =?us-ascii?Q?6WkAPcY3zBHhW4exqKj1QmwyweqO1qNdcPE8QZQA?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16bcf13c-0442-4e43-c113-08ddb2dafdb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 04:52:58.5771 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zFnwcAei5DEkLK2r79iH5k7f4qqjchggIWJ34rZ4vZoU7wGmyh0cx5i9pBSiEFOAWRzbKcXcOMMq5b37GcCfnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8458
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



> -----Original Message-----
> From: Murthy, Arun R <arun.r.murthy@intel.com>
> Sent: Tuesday, June 24, 2025 10:18 AM
> To: Kandpal, Suraj <suraj.kandpal@intel.com>; intel-xe@lists.freedesktop.=
org;
> intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org;
> nouveau@lists.freedesktop.org
> Subject: RE: [PATCH v3 11/13] drm/i915/backlight: Use drm helper to initi=
alize
> edp backlight
>=20
> > -----Original Message-----
> > From: Kandpal, Suraj <suraj.kandpal@intel.com>
> > Sent: Friday, June 20, 2025 12:05 PM
> > To: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org;
> > dri- devel@lists.freedesktop.org; nouveau@lists.freedesktop.org
> > Cc: Murthy, Arun R <arun.r.murthy@intel.com>; Kandpal, Suraj
> > <suraj.kandpal@intel.com>
> > Subject: [PATCH v3 11/13] drm/i915/backlight: Use drm helper to
> > initialize edp backlight
> >
> > Now that drm_edp_backlight init has been modified to take into account
> > the setup of lumininace based brightness manipulation we can just use
> that.
> >
> > --v2
> > -Fix commit message [Arun]
> >
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > ---
> >  .../drm/i915/display/intel_dp_aux_backlight.c | 98
> > +++++++++----------
> >  1 file changed, 48 insertions(+), 50 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > index 800d07c7f041..117c762fa2fe 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > @@ -584,9 +584,37 @@ static int
> > intel_dp_aux_vesa_setup_backlight(struct
> > intel_connector *connector,
> >  	u8 current_mode;
> >  	int ret;
> >
> > -	if (panel->backlight.edp.vesa.luminance_control_support) {
> > +	ret =3D drm_edp_backlight_init(&intel_dp->aux, &panel-
> > >backlight.edp.vesa.info,
> > +				     luminance_range->max_luminance,
> > +				     panel->vbt.backlight.pwm_freq_hz,
> > +				     intel_dp->edp_dpcd, &current_level,
> > &current_mode,
> > +				     false);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	drm_dbg_kms(display->drm,
> > +		    "[CONNECTOR:%d:%s] AUX VESA backlight enable is
> > controlled through %s\n",
> > +		    connector->base.base.id, connector->base.name,
> > +		    dpcd_vs_pwm_str(panel-
> > >backlight.edp.vesa.info.aux_enable));
> > +	drm_dbg_kms(display->drm,
> > +		    "[CONNECTOR:%d:%s] AUX VESA backlight level is
> controlled
> > through %s\n",
> > +		    connector->base.base.id, connector->base.name,
> > +		    dpcd_vs_pwm_str(panel-
> >backlight.edp.vesa.info.aux_set));
> > +
> Can these both debug prints be combined?
>=20

One talks about backlight enable and other about backlight level do you sti=
ll
Want to combine them ?

Regards,
Suraj Kandpal

> With the above change
> Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
>=20
> Thanks and Regards,
> Arun R Murthy
> -------------------
> > +	if (!panel->backlight.edp.vesa.info.aux_set ||
> > +	    !panel->backlight.edp.vesa.info.aux_enable) {
> > +		ret =3D panel->backlight.pwm_funcs->setup(connector, pipe);
> > +		if (ret < 0) {
> > +			drm_err(display->drm,
> > +				"[CONNECTOR:%d:%s] Failed to setup PWM
> > backlight controls for eDP backlight: %d\n",
> > +				connector->base.base.id, connector-
> > >base.name, ret);
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	if (panel->backlight.edp.vesa.info.luminance_set) {
> >  		if (luminance_range->max_luminance) {
> > -			panel->backlight.max =3D luminance_range-
> > >max_luminance;
> > +			panel->backlight.max =3D panel-
> > >backlight.edp.vesa.info.max;
> >  			panel->backlight.min =3D luminance_range-
> > >min_luminance;
> >  		} else {
> >  			panel->backlight.max =3D 512;
> > @@ -597,56 +625,26 @@ static int
> > intel_dp_aux_vesa_setup_backlight(struct
> > intel_connector *connector,
> >  		drm_dbg_kms(display->drm,
> >  			    "[CONNECTOR:%d:%s] AUX VESA Nits backlight level
> is controlled
> > through DPCD\n",
> >  			    connector->base.base.id, connector->base.name);
> > -	} else {
> > -		ret =3D drm_edp_backlight_init(&intel_dp->aux, &panel-
> > >backlight.edp.vesa.info,
> > -					     luminance_range-
> >max_luminance,
> > -					     panel->vbt.backlight.pwm_freq_hz,
> > -					     intel_dp->edp_dpcd,
> > &current_level, &current_mode,
> > -					     false);
> > -		if (ret < 0)
> > -			return ret;
> > -
> > -		drm_dbg_kms(display->drm,
> > -			    "[CONNECTOR:%d:%s] AUX VESA backlight enable is
> > controlled through %s\n",
> > -			    connector->base.base.id, connector->base.name,
> > -			    dpcd_vs_pwm_str(panel-
> > >backlight.edp.vesa.info.aux_enable));
> > -		drm_dbg_kms(display->drm,
> > -			    "[CONNECTOR:%d:%s] AUX VESA backlight level is
> > controlled through %s\n",
> > -			    connector->base.base.id, connector->base.name,
> > -			    dpcd_vs_pwm_str(panel-
> > >backlight.edp.vesa.info.aux_set));
> > -
> > -		if (!panel->backlight.edp.vesa.info.aux_set ||
> > -		    !panel->backlight.edp.vesa.info.aux_enable) {
> > -			ret =3D panel->backlight.pwm_funcs->setup(connector,
> > pipe);
> > -			if (ret < 0) {
> > -				drm_err(display->drm,
> > -					"[CONNECTOR:%d:%s] Failed to setup
> > PWM backlight controls for eDP backlight: %d\n",
> > -					connector->base.base.id, connector-
> > >base.name, ret);
> > -				return ret;
> > -			}
> > +	} else if (panel->backlight.edp.vesa.info.aux_set) {
> > +		panel->backlight.max =3D panel->backlight.edp.vesa.info.max;
> > +		panel->backlight.min =3D 0;
> > +		if (current_mode =3D=3D
> > DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD) {
> > +			panel->backlight.level =3D current_level;
> > +			panel->backlight.enabled =3D panel->backlight.level !=3D
> 0;
> > +		} else {
> > +			panel->backlight.level =3D panel->backlight.max;
> > +			panel->backlight.enabled =3D false;
> >  		}
> > -
> > -		if (panel->backlight.edp.vesa.info.aux_set) {
> > -			panel->backlight.max =3D panel-
> > >backlight.edp.vesa.info.max;
> > -			panel->backlight.min =3D 0;
> > -			if (current_mode =3D=3D
> > DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD) {
> > -				panel->backlight.level =3D current_level;
> > -				panel->backlight.enabled =3D panel-
> > >backlight.level !=3D 0;
> > -			} else {
> > -				panel->backlight.level =3D panel->backlight.max;
> > -				panel->backlight.enabled =3D false;
> > -			}
> > +	} else {
> > +		panel->backlight.max =3D panel->backlight.pwm_level_max;
> > +		panel->backlight.min =3D panel->backlight.pwm_level_min;
> > +		if (current_mode =3D=3D
> > DP_EDP_BACKLIGHT_CONTROL_MODE_PWM) {
> > +			panel->backlight.level =3D
> > +				panel->backlight.pwm_funcs->get(connector,
> > pipe);
> > +			panel->backlight.enabled =3D panel-
> > >backlight.pwm_enabled;
> >  		} else {
> > -			panel->backlight.max =3D panel-
> > >backlight.pwm_level_max;
> > -			panel->backlight.min =3D panel-
> > >backlight.pwm_level_min;
> > -			if (current_mode =3D=3D
> > DP_EDP_BACKLIGHT_CONTROL_MODE_PWM) {
> > -				panel->backlight.level =3D
> > -					panel->backlight.pwm_funcs-
> > >get(connector, pipe);
> > -				panel->backlight.enabled =3D panel-
> > >backlight.pwm_enabled;
> > -			} else {
> > -				panel->backlight.level =3D panel->backlight.max;
> > -				panel->backlight.enabled =3D false;
> > -			}
> > +			panel->backlight.level =3D panel->backlight.max;
> > +			panel->backlight.enabled =3D false;
> >  		}
> >  	}
> >
> > --
> > 2.34.1

