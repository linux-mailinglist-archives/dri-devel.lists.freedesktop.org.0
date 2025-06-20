Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 582E9AE1297
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 06:47:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC9CC10EAAF;
	Fri, 20 Jun 2025 04:46:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ld1HwGfl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA92210EAAF;
 Fri, 20 Jun 2025 04:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750394816; x=1781930816;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=m4WQCRhz+lHvfteQE/S9AwB6tbgBouyIcfdGeu8o+yQ=;
 b=Ld1HwGflIJQnkw5y6q+ssAfYwWdwjywSbDxZFwVlQuAb1diulelkEi+K
 pi8cJG3BOk/64T7gGeNV8Z1pBgiOubc4URSOv4jqAbeAAW+IkXaVSzlbP
 VwfM42mwxvh5bErkTcJFn+fjbsCYOHAsjvAtsc+oxPbdIPnoNjw+xxqQi
 lUz8ioFlrw/Bsc0zgZu6Q5T/h6D9gn+aCspo8fXgLofT6pDCOkVr+hpcA
 rTzQK4Cmes8hqpnz8/hcNYGhGEAwpYeagfRjhECzwd9LH/Y0ObBDT7Kkg
 adI2enGRetAOscPTv0cnt3e59RRV6NGDSJ2koazjuKAZEgx1GEfaYw8Yl Q==;
X-CSE-ConnectionGUID: DypXjplARsm+yKlx/Olkqg==
X-CSE-MsgGUID: neFnIYx9R9KKwglmQMWFSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52798819"
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="52798819"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 21:46:47 -0700
X-CSE-ConnectionGUID: kE0vSxp2Q4ywLoV2ux4tcQ==
X-CSE-MsgGUID: m/O8K9GHTjGi4OWvKGIL+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="155084617"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 21:46:46 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 21:46:45 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 19 Jun 2025 21:46:45 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.77)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 21:46:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RmitnCAX5sdJxz1bdyGzEVDQftTNCyDBOipy0R0HWpqn5Rbcy2Xa6j/oGc5BrRxUYsltBt4tZaXGJs0jqUQyHm7DJysix6hDyGhdGpCQFNQ76rWAS4y170dGM+Tai2pjXVrk34KM02M0vX/3vaEiaIJUtCscr+KVcrUUkQq6hSD5d2pCkXaMEkGTe246E806aF3tbimc5Sh9UE8XUJIxoTv7micqbQp6iBkoEgiJwC4u3HxuYSDVGVFT45wOJ1PN6ifHJIrh8JTCSnyljhPZCz/p2+J6I66fm0t/WbjXBQf5iQ5LLKCTHPIMoZSmGc7Ughg5bH91ZRxzMu94BBRgfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VY8h6aWMFtQLC3w9NW6KxUha2hEFgNNABtpnp/YrwZ8=;
 b=o62EpUjhRnOyHBdx+c6+7oDyQr0OUao2Emv3UujzmnDESrw37XJpQpRQJIKcK2JuBiQrysFTkkAUQCCOflwBRiip+pBMvs04z6NmfAaIDhzGQFn0M+KAwMjm+uWIBPuNbSC8guK7dfJwEDsOEJAC9h87WItwle42W9vYaASJf0RUQ/XnSlKNQxNqUajJaTjGc8L3NL6QK7R6kVTiia6dEne+0Y9QB430FB9ic/bZUqovh8REB5wlEgR3H0lyNDXiaNFuWfu1Qm4ayEpEvROgsRGSn/dIFMQJzy6uBb/BT/a+fICVZK1WFSYkEfuJdbd4LO+wlcTkt3ltPpfAOIrgVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by BL1PR11MB5239.namprd11.prod.outlook.com (2603:10b6:208:31a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Fri, 20 Jun
 2025 04:46:42 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%3]) with mapi id 15.20.8857.019; Fri, 20 Jun 2025
 04:46:42 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH 10/13] drm/dp: Enable backlight control using luminance
Thread-Topic: [PATCH 10/13] drm/dp: Enable backlight control using luminance
Thread-Index: AQHbrPQsb0MNKLgTfkSBqlLbvJf4S7QL4IRA
Date: Fri, 20 Jun 2025 04:46:42 +0000
Message-ID: <IA0PR11MB7307A074AEC006084B87C350BA7CA@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250414041637.128039-1-suraj.kandpal@intel.com>
 <20250414041637.128039-11-suraj.kandpal@intel.com>
In-Reply-To: <20250414041637.128039-11-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|BL1PR11MB5239:EE_
x-ms-office365-filtering-correlation-id: 7410b32e-c134-491e-393b-08ddafb573af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|10070799003|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?14+T0fd3dDNxeKqH1nszwkhCURepOLybpHftAKqitDcOCRqImB0MbTC4GbvO?=
 =?us-ascii?Q?HgcMuP+HXGHCPstNUFAym0bx0q0fb0D6VJUH1q/Ezq8kiXbmWr4/JMaZlBct?=
 =?us-ascii?Q?93JqD1KDZ7aUItgMQQ/lE36nwJRk9jE7bKU9J71ep3elf2RKmEdR5yxj5LsR?=
 =?us-ascii?Q?+o3zmVpDCYWijtUhdrCRCR7vFYp+zO/I18/A40SOnaSuPNZvxzA+F6WRRyO8?=
 =?us-ascii?Q?2OAPkS0a0EgC+0vIlphupEX3CtqG5svEX0Ll9ao1zH6ZYXOeZ5dsze9P+wOr?=
 =?us-ascii?Q?wXUs0WxRVE2kVHm+OdPttEl2/p7d4L+VHxtPyRgsaTRYlJWJ9Nc72864EaPa?=
 =?us-ascii?Q?EBckYPRSuYoKT+nuyiCxCxXlmNV5cAk4TScHqLJF+ba4XO/JhGIp32AuXxW/?=
 =?us-ascii?Q?zyzPFSlRQzedbAxc7aSmXlcAkiaJxBldFQEVYxnNyCL1CsRBwz7o7+KPELYM?=
 =?us-ascii?Q?mKfM28INkWd70uvzep0QtoWQMR16WD2AzRHlCv+S1YI9p1r0m2WizCT7ApX8?=
 =?us-ascii?Q?q8/tUp7xQYbU5cHjnm5TOP5fLDrey87bwatYKAx10ou6Zo9uj6thqlkVrOMd?=
 =?us-ascii?Q?G/pLJSbeVPX5x8N2EHsn5q1HGhWgZBt3KFnfT3hvRr7UJ61zJBrlMIGysgkf?=
 =?us-ascii?Q?PlW85xvOLN/tzW/UUeIv8SjQJYSa8vio9dTYjyH4x6g6X67zpalpabpnJZ9m?=
 =?us-ascii?Q?dHZi+kwmCYRsbvzrFXyJ8vnd8F7OeUZn4wqyz+IrBbTqu6WkSrs3/jnSD8HZ?=
 =?us-ascii?Q?o3TEXqjaKyieXkA8bUeV+StisCHQiIJmZYpEbunfaSvPA/akvX+icP8JYuRe?=
 =?us-ascii?Q?k1bSV0IM8kWpghmzl+pwMI4NmAPN6/DaVld29UvONPsJ+cQMkW67UirWGzJC?=
 =?us-ascii?Q?Pqk8qKtQnIFDO0nXerNa5UeDVxzrs7KUoPmMVFlrEJGwclufV9+cjNl8/BJV?=
 =?us-ascii?Q?BWLxyYqkP1ImBiD5Wnx91pRCX+LzL8QIEUqmzEG5wvGMem09yQryVnC98Lgs?=
 =?us-ascii?Q?A3NNkKRra1wO4Knf3GgH2xb4sAXQbpARXcqVpEjZVmbCMABOrEwOCAtBE9/7?=
 =?us-ascii?Q?zqTIr86E7AXwYroJVilQyha/vXJuYiaPAEQSCuPLNsaWoJkYe2xPaOGJgXqs?=
 =?us-ascii?Q?VK+Cp632VcnPLrOzkpsEVu6BBfyugAK/D5TdXzpIPXwKpakeeoH8ckpMVWHp?=
 =?us-ascii?Q?5OKe7hGzp4QzbkitNT1i8dEv3LH7th7NjUQWOGAbv/gei0dRaGntZJ2E0Mi0?=
 =?us-ascii?Q?sAcEECiquQ1tlB3CXD7zHfhSC9E8KhgOtjoY47RRjO4w/QKHW6CIerzH+qZF?=
 =?us-ascii?Q?jgP/D+r+is79YCa0XLrALWE64xgd5Mlzv+pAQUCkGGiNWv2vli6usbsAIZX8?=
 =?us-ascii?Q?Cu9VcNoaUOF82yk8W1RBdZ4hTftf2GouksC9pPryQbd1kzEggLmRhpJtlxcU?=
 =?us-ascii?Q?3Dasxl8sgvRSGSEyySHn4piaUNGP7yGA+T/e8xnofJUqHfzoNzQX7Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?K/rVoTOurvbTes3WF1iFm/EoPAKZtmCOqBKbqAtviI6rtzRzBdZJ0nSBTjVr?=
 =?us-ascii?Q?6d6fv/35lDoXQSgkCKLrIG2hp4fYRqAeZyU9iJhqoPvgptkZ+oj17r2EqC5x?=
 =?us-ascii?Q?Zl/T+xj0Fb3crt2EJgq0yQopzdQSHce5RCCy/p48laSLqUGRyvhc34nVkqn0?=
 =?us-ascii?Q?zNpAC7TT+86H9sFzpQHB2z2p+Pz+yL+KiqJs/x6Q+iPbPMb4k+dBo9WctV1W?=
 =?us-ascii?Q?wS6cGdAEuJ0lyY3x1izb4YxA7Pzf3oPBtTGHJHXgH88ezCp3Wvo/jliqqcZd?=
 =?us-ascii?Q?AtnFaIXgS2hdQLo5cEZ4Cn4JyHS21Oh9BBVjn7Oo4+e6smaoCIa+l9L9OF9l?=
 =?us-ascii?Q?/WDjcEit0E/+7hDLnlXYdXOXnrvUT7GaxC1e4E4F7XoQAMAenBJTIIoEnLiR?=
 =?us-ascii?Q?9SpKV0YkH8QfQSTkVe2OFqvj8WX2I4wdCDxfXoKwre88cwsLhZs2OwTGogEM?=
 =?us-ascii?Q?wQeMDKzv2300xwxwYDItWIRUOT3B5dryXgIx2t4zNyq+yv6H3KSZuhn/hurL?=
 =?us-ascii?Q?P2IhH2dz/fJkjMjx/qClxvTVauncGUYYOIyi2wAsanpTpdK5jLn3O7EEh4rK?=
 =?us-ascii?Q?8G+DR1wgTk7ODNTdxh8C2CPN++7EoXsj9NyWhM7m4V2TRd3i65Numpv/qfdW?=
 =?us-ascii?Q?5Wb8aSH7H6VMxPL9McmduFrFz+iKfq4kaP2QLXlY8n2/PunM/ivIcpr7KByq?=
 =?us-ascii?Q?G9ZVdNeBgWBzbjkfiK9vUpFX+Rtrp3bq50TVbYTlyUUv03oz7P6JpT8UcLGy?=
 =?us-ascii?Q?i5isyo30NfLRkeoOGXhqJw6nvBPQ+yzMP8pAXm36V7dZkEGDuBUuKnUI/usK?=
 =?us-ascii?Q?cqaa5u0JbhZyyfydDKwzMGYzi4VI1Gtm/pGX4efIl3cO2yOWZuSNxi90rzyw?=
 =?us-ascii?Q?bcrv6mDfG12j71v02eMF2oHkA9y0uOj90AT44rpV9srkV5onWvcu7f7qzGt3?=
 =?us-ascii?Q?MT9QWgZMXSJke9RPC4Vs9+sQNs03hlJi4P8+7BDQzo/YEcU7A157LLk8DPh0?=
 =?us-ascii?Q?qgNv+YwrbZXOLdthq/dw2PGWP9ixRrGTfJPqtj8PIR56WLjxMiFvTO3tsdBf?=
 =?us-ascii?Q?+a7DPQzMV+ZHtayfzMSm95vxt4Wi57Qv16AEiKNHSBe0nosit1bqL7EaeNGI?=
 =?us-ascii?Q?kixgHLDecswoFmysHPaK7kmdfa1XobIMUWS7rFXks8sjgzeBWnKGv02ergYR?=
 =?us-ascii?Q?IuVA2DsLsTivnQHrEKrUmGl8xlF+m0IV11xTbSksWvVolFV6nHMiw3KOECuJ?=
 =?us-ascii?Q?p508i1Z3t0E1L7AIYGXVBFuPKxjmB/hyQljSxOY6usbH47qog8rvMLq9NLeO?=
 =?us-ascii?Q?Jyi6Nizkxu9720epeuEJEYBIiAO/oni0rXh4iXvQ/1NQ0s9aLldbGESxH574?=
 =?us-ascii?Q?FI+u22vjLPuCNkA5xY0ScBSHubPd/nk8X4ILijt/MA2nEh8bBsrJF+VsEb9H?=
 =?us-ascii?Q?0yHRv4HBKUv9+S51InEFlV/5FzT9taBfMTmXrOOF9wqRRauGvoMPCopyaroQ?=
 =?us-ascii?Q?HrXyuWbEdN6eswGLkc1/NIcV4THalhu2zbiERcJnfC+c2n/mesMGIjNZ81X7?=
 =?us-ascii?Q?oXNsq4t+bxwC0WyyeB4g8zDI8DABmmg3jxyptLqK7puHdsDk8XoZ5O34ySrC?=
 =?us-ascii?Q?wjdzTX9aT442N1cLccHROa4TeJaIHXIbEbpMxMXksqrn?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7410b32e-c134-491e-393b-08ddafb573af
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2025 04:46:42.0765 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t0bDuHDuVbc/mO1388d9Y8E4tQCpR/cqLPCormcXsKcxn8vkLrxb2FS3PC/3SxmGT918Je2Rd8zPjVQoGanZXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5239
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
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: Monday, April 14, 2025 9:47 AM
> To: nouveau@lists.freedesktop.org; dri-devel@lists.freedesktop.org; intel=
-
> xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> Subject: [PATCH 10/13] drm/dp: Enable backlight control using luminance
>=20
> Add flag to enable brightness control via luminance value when enabling e=
dp
> backlight.
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c
> b/drivers/gpu/drm/display/drm_dp_helper.c
> index 0421b2ed9bd4..4e2caba8311a 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -4030,6 +4030,9 @@ int drm_edp_backlight_enable(struct drm_dp_aux
> *aux, const struct drm_edp_backli
>  	else
>  		dpcd_buf =3D DP_EDP_BACKLIGHT_CONTROL_MODE_PWM;
>=20
> +	if (bl->luminance_set)
> +		dpcd_buf |=3D DP_EDP_PANEL_LUMINANCE_CONTROL_ENABLE;
Can the backlight control by luminance be used along with PWM or AUX ctl?

Thanks and Regards,
Arun R Murthy
-------------------
> +
>  	if (bl->pwmgen_bit_count) {
>  		ret =3D drm_dp_dpcd_write_byte(aux,
> DP_EDP_PWMGEN_BIT_COUNT, bl->pwmgen_bit_count);
>  		if (ret < 0)
> --
> 2.34.1

