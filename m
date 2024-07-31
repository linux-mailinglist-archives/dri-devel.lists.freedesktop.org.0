Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 965979438BD
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 00:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3CF810E0E0;
	Wed, 31 Jul 2024 22:22:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XiGAD2u0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A047110E052;
 Wed, 31 Jul 2024 22:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722464530; x=1754000530;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GaJKGddLcyfTDF0AxakhBrGP2dzwwcbQ1LKVOmpK5dI=;
 b=XiGAD2u0ceQYI/hpsKEVaUIwmdm2vzEm6c/04k1Myp0X4eo9jxd2DOYu
 11GZx7HNbOiu2WfIXq7YcZZ0Rjw5XxAVkMMk/GWnR8YSLNBa6TRkrWV/b
 in453i2MUC5licBkfmXM3AlNd85zdwSmovJLjnI5fSryj78ESRBJhCHaz
 4op6lSGI6xQjV/CP2YwZVFQNXfIMqGrLWduwPt/6tAFWHjMsbYt01BbAx
 9fUulAxak7TxRIF63n+fclzSfoBh26FoGcZhlkvI5BTKwPDliV+hKSJcY
 n6zWPoCprdx7QW39DKNaTqaENFnh+E3MLtdcX0KEPoK3s8fAFWopiWeKB Q==;
X-CSE-ConnectionGUID: SdIT6G63RemiuSxKDCXjkQ==
X-CSE-MsgGUID: t0e4B7+9SjCiSscdGynKCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="31767143"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="31767143"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 15:22:09 -0700
X-CSE-ConnectionGUID: BF3qqdQDRie9W7PSZ494Qg==
X-CSE-MsgGUID: 5JwTrVZRS/eGN+Gg7Qr4kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="54485688"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jul 2024 15:22:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 15:22:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 31 Jul 2024 15:22:08 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 31 Jul 2024 15:22:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rYqCFrlKvndNCGRdmB75KsYw3S164PLFxcmfGFt/0WK0a795BaO/uUU/RDSMG+g/5k1TDZ2ppTnyr2ouYJLGt8x7aO4n2cR43HjKeJAPNFaWZ5kNNk3B5YhU8HqLGLq9cnqukHCSNqmuR40OsbwrXLzL8Pqcz3a12by6bq/AsjG1Fe8/gU8lmwscBRm4Y+TUI2PJCztcvk5knQDJA6MobmIEMm8Z+riNXqp6KQ13TXVz+4HhDPaWO40D9AGcZUVe5G+fOySYpDU8mry1sVT7QIA4k2KOnxpDWdTJGOXHvo9nBW04O12JaXbePWz/SxeHS78SmBlkEpaqosLsrtJmhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZVGXUt/3z+8MwlKJ8FAwM5gQiUZE6KcKsd7gCsAaRTo=;
 b=ytOyKCI6FTnG8dF10KCd/J1YKVLFNMMQxIpuoLdFKG0kSA2EsJb7X28BOeXmmtLJGJbJ2YUvCQLn4OrbBgdtXMTWKWWeyhYoz6BURFXs6Pxxdm7lnjicoJC/fDFkY4XdKdxajkYVdtYCIQ43wEzond/0w5fXEWSD4kM+ST69kt7gY8otL840YgBwYs6UHyaBV6KdHfXnKw3W0Mx3MBXKtaiYTCjVOUJdhk7/wXjgoOPanlqBw2TjrkxdIz9dcwaPI/0TyT2gnQr4WC5YVBJXnSeJoaoMiOfSzxAdf6f2XSPcit01QInxsdtFhwT7FRcV4CmNOb/WMg361CoflysQzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH8PR11MB7117.namprd11.prod.outlook.com (2603:10b6:510:217::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Wed, 31 Jul
 2024 22:22:04 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7828.021; Wed, 31 Jul 2024
 22:22:04 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v4 2/3] drm/printer: Allow NULL data in devcoredump printer
Thread-Topic: [PATCH v4 2/3] drm/printer: Allow NULL data in devcoredump
 printer
Thread-Index: AQHa45EhF36izAgqe0C6OeukODdQmbIRZ+xA
Date: Wed, 31 Jul 2024 22:22:03 +0000
Message-ID: <CH0PR11MB5444E19C7B2423D654F3B2AEE5B12@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240731213221.2523989-1-matthew.brost@intel.com>
 <20240731213221.2523989-3-matthew.brost@intel.com>
In-Reply-To: <20240731213221.2523989-3-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH8PR11MB7117:EE_
x-ms-office365-filtering-correlation-id: 54591a32-6fe6-42f3-0182-08dcb1af349a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Eo594mxdvd4ggAE3E9qfEOU1/xD0x0fivwQbpyf8d5ME11KGBVbrapl+923U?=
 =?us-ascii?Q?CFiidmfsC0YSxVZSu7g9VGB7YxL1fzD/cHPqfANLOQA8qiNSeDYj3P/Y2EMz?=
 =?us-ascii?Q?Z+ZxKN15NnH126N8chwCa5paYYhF6cbBIwJqxDuIAKFNAio4Oq/NlXYrjVhR?=
 =?us-ascii?Q?GudP2xlYS9W2GIuflyTskgj6hElICsCGBM+9Lbrs4KpkkVhojXz19yg/h7KK?=
 =?us-ascii?Q?xgA2z3yLvr3PuerwdsYcyQSyzeRxLYeJQKoGM7HXPPI25UWqgbhzkTvInd5W?=
 =?us-ascii?Q?q1oCim6fdAk4E+KsTjq7qdfDfgibIUU5tkJGVNkKWumLOTzrnURUhY2pt/j6?=
 =?us-ascii?Q?eIaOzynb1RWLgMrb56I1iUcphaSWOmaM6F6zNSQpG/l9Yrx/77osSu6ZuzW0?=
 =?us-ascii?Q?6WHDG7Fqk7g3noErnuxvIgc08aH/+E+7DgbRiC3kdSQLCWgrgGftueEn/PDY?=
 =?us-ascii?Q?iC+NqYipY9IvB+iarmKN558m25p9COgvMbia7Dwzy4IXl7aMQ2mQTxy9XbxY?=
 =?us-ascii?Q?/rFrdv9SuMu2EsMNDotK/lzpuUXTVNik4LEyOc4oZ5w/cKOfAMKap3BW27wK?=
 =?us-ascii?Q?W4pyzcQ3WnOyhWeXs5FeB2DG14HR32BQkkcZP2R46BJr/ti+vKmAydhLG050?=
 =?us-ascii?Q?MoJCfNvK9oxvrFAPK+72oe5ZFJS8nHbCWFDQlH+736NuyRuztkjQJs3rrrop?=
 =?us-ascii?Q?YaPfHIAVQQWap4bt01efJv6frP2odXmN16K9zXAq39AOMHDDyZ/a0IHXjl4M?=
 =?us-ascii?Q?38nh3bY4D+yWb2dhLXWbmcqXm/SxfXVSKpbVnNaaCjP7N8uGriZdvnSawXTv?=
 =?us-ascii?Q?kfbpaSjMeNjZe41YDPiUdyIXD0xW0j+xlMvmH18uf2KOvpOZKPXFbp9aJvQy?=
 =?us-ascii?Q?Dm8ceqj83CG8ORDOanI/cysGZkEkqWWxiWcl+nO2X+FggVilOJbsAnCfnVJu?=
 =?us-ascii?Q?/W0/ExQ+cRp9128el7Ymx0aqTBkOle4tVbfpw1GdocWJ7RCX5qonu4o07IEj?=
 =?us-ascii?Q?Z96bH3I/Xf8DiJCjJWDjUA1HjD6oZ1ZoHisev3/NJbUuvzHXmcHyOQvZo8uE?=
 =?us-ascii?Q?dLi1VHqFJruZGz0ZKKxtpugZOWw6vieQec10SrYRpGkaPuXqDpi5LrrcTUb+?=
 =?us-ascii?Q?OTar1G6+LwTQjXeSVjlIxc/tcytLSu6Ua7NXq15d1FNQ4+lCUT0hP3zXjWf+?=
 =?us-ascii?Q?beEq552IEEuceoyBAD48+17lIQpDj9HRmtd686eMrkDEE0Z3uh2Y515dyWxB?=
 =?us-ascii?Q?dXfDCFsJ/V2lu7WB2DLPQIJhNgdsZYyW9hzDGBp+x6EXXTsV4kI/7k2M/oSM?=
 =?us-ascii?Q?Js2bSeB2UFrAoaEp/ZftgX1l47c2cqyQiMhVQuIiai6fXYBH8SjngHltb8gQ?=
 =?us-ascii?Q?zkqYy/5O5VbOuud9Sz/dYKoOcBxCcimVOc2J1Jq2BV3r6VcnpQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rSEPSHu0Oft+u2YWYCwrunBMUdIS+KKBE9W5Ua2PAL3GnL/kx5ZM5bTFlHuJ?=
 =?us-ascii?Q?7bY4/v9qfRJ6c//fWwo5FSN8WpDnBgBaMRbnrsJlMxvKt8TSXvN/tH/ZFaxH?=
 =?us-ascii?Q?kCma9923Q0z15UvWMgJ0Xc3w8at+UymqcnojexP+Qz6/Eum4t/PsnMklCFb4?=
 =?us-ascii?Q?kVQfnleYa+i+fiuD3AksCtgXWXaer/WURZnGmLg3QXkflkRHk8L/yqUgMJSA?=
 =?us-ascii?Q?dx/+uIbw+8kpZgnwETRDbc+nt4PCRAo4QtfTd7Zoa4N++UHPqjNtdzPB71fY?=
 =?us-ascii?Q?GjkbA4o0jhNudRFvPhOdoGPP7QcY4jbqvtmDY/BuigcLl+Gvd9xMR1Pnv3Mm?=
 =?us-ascii?Q?8lEklKrzPCDmTUpQBEbQxBbvA0ZER8u5fg0UYYhiZRFQVm7aee/BmzSCTysD?=
 =?us-ascii?Q?XljpBtFVh0GOAS1IooFaynaE6VS7dqj2Qc6VC5sVXTWqDOgjrHjPVNQfpqPI?=
 =?us-ascii?Q?4zAH/alcm77mSu7K4iSY8FOxk9GCjpzCoSSSAqWSLy9QL4UgR0QSiQhpM2r2?=
 =?us-ascii?Q?a+MuVjOHyEymdJ+BCCsbvQs3GjyVwTivOUtJaF6BFO8CAWFHmRKUzCldEA7C?=
 =?us-ascii?Q?yrWchfG+eQIS4TJkP52cP+vhsD1tB9lumPu0O6nDlXO2TnAZ28YAeglbV5QY?=
 =?us-ascii?Q?SrLmYWtaHZwmQA9KCMfDVx9+dBHAJKHikxdjP9cioRHO3uctnrZIpnUXCuf8?=
 =?us-ascii?Q?ygdDWg+InaGBuEsfoRziwXYyEsHQJJB6jgUbmdgK5uVW67EvAHd3879OJOFU?=
 =?us-ascii?Q?pIRZXDsHk1/L1/OU0VEYFDWyBIHfmXqT2HB12XI+NSO0VfJSQrTMJIYZp+NV?=
 =?us-ascii?Q?cLh8AiKAp+l3B+A502Oes59lTR9IR9eNx0qeIJWBdTr/EE1ndMU4g0X06gtK?=
 =?us-ascii?Q?8DFT84K1+GcRRcHtO9uGqVr+wM8M+dry9T1T/6ziJ46ezRua00wexPPDGwur?=
 =?us-ascii?Q?VXFucn6SuS/v3aCESdmwuge9B+GySmkHLkw4DZhToFZc+KV4FbOEDpjKBZ9N?=
 =?us-ascii?Q?zeorH3cKBJ/tRS/j8iTZRzgw0gucW0Stkpwr1yDaBknDeLsVkJ8byV8eZM88?=
 =?us-ascii?Q?ukRUv2+wmZeQJfEiR6AyPbjucmdJcqyeUoa7172/dllXPdF8qy5bm2kDc3a9?=
 =?us-ascii?Q?uH52/KhJGxRvGo0n4jzp0K/ONGJjb9apJfkw86R2lRlGcsUn0pyKVC5p/XBl?=
 =?us-ascii?Q?Z7OQwVR7gr76gUG0QkobZo4rN+wxAarDcOlwYPWdLA3527xa/oakZQ40Pp4t?=
 =?us-ascii?Q?PS+dCd6XOE651A7n8QI7kpKiPJrPeNRw8o6e3OyBJKWPZRBlWuCMYrJGcMNn?=
 =?us-ascii?Q?AzbVfRl4oqGxGLriqEBTPBtq9FFHZPM2A4XcaeQI0Ehpc3yHmnW3U11mivYD?=
 =?us-ascii?Q?UKgWKHXJI/6AJ3OMvxmwLqmjQ38JtLITihQ4SVpujV514ysnfCLH/v41U7bl?=
 =?us-ascii?Q?b9sSM3Ie8/wwnNaE2jINlHKrglRNJn806kp4DVHBfZiIYjFf3AL1HNsNJEMc?=
 =?us-ascii?Q?Cez5DMsYOVHpfcKwriyKBywtz96b8FNX4QMwo1w1c/KTzBpwPXWbsj9eZTW1?=
 =?us-ascii?Q?zpmeDn0Ie+KSqU2/fY8RmxPD8qeR8ZexMX5/abof?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54591a32-6fe6-42f3-0182-08dcb1af349a
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2024 22:22:03.9116 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X09bDYP9ep+sI1Y3tExfQq2oyiv0JXVQZ2E0mPXUn6Zrc6XtVRArwzTwqye8OeJXvHzfhgqcLJh24DPgPOUFf4luLiMUhDS3NYhIfaih264=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7117
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthe=
w Brost
Sent: Wednesday, July 31, 2024 2:32 PM
To: intel-xe@lists.freedesktop.org; dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com; Vivi, Rodrigo <rodrigo.vivi@intel.co=
m>
Subject: [PATCH v4 2/3] drm/printer: Allow NULL data in devcoredump printer
>=20
> Useful to determine size of devcoreump before writing it out.
>=20
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

It seems this patch prevents us from copying strings into the data field if=
 the data
field hasn't been initialized.  I'm not certain if it could ever be uniniti=
alized at this
point, but I recognize it as good practice to check just in case regardless=
.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/drm_print.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
> index cf24dfdeb6b2..a1a4de9f9c44 100644
> --- a/drivers/gpu/drm/drm_print.c
> +++ b/drivers/gpu/drm/drm_print.c
> @@ -100,8 +100,9 @@ void __drm_puts_coredump(struct drm_printer *p, const=
 char *str)
>  			copy =3D iterator->remain;
> =20
>  		/* Copy out the bit of the string that we need */
> -		memcpy(iterator->data,
> -			str + (iterator->start - iterator->offset), copy);
> +		if (iterator->data)
> +			memcpy(iterator->data,
> +				str + (iterator->start - iterator->offset), copy);
> =20
>  		iterator->offset =3D iterator->start + copy;
>  		iterator->remain -=3D copy;
> @@ -110,7 +111,8 @@ void __drm_puts_coredump(struct drm_printer *p, const=
 char *str)
> =20
>  		len =3D min_t(ssize_t, strlen(str), iterator->remain);
> =20
> -		memcpy(iterator->data + pos, str, len);
> +		if (iterator->data)
> +			memcpy(iterator->data + pos, str, len);
> =20
>  		iterator->offset +=3D len;
>  		iterator->remain -=3D len;
> @@ -140,8 +142,9 @@ void __drm_printfn_coredump(struct drm_printer *p, st=
ruct va_format *vaf)
>  	if ((iterator->offset >=3D iterator->start) && (len < iterator->remain)=
) {
>  		ssize_t pos =3D iterator->offset - iterator->start;
> =20
> -		snprintf(((char *) iterator->data) + pos,
> -			iterator->remain, "%pV", vaf);
> +		if (iterator->data)
> +			snprintf(((char *) iterator->data) + pos,
> +				iterator->remain, "%pV", vaf);
> =20
>  		iterator->offset +=3D len;
>  		iterator->remain -=3D len;
> --=20
> 2.34.1
>=20
>=20
