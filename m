Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC48A9D4CB1
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 13:20:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD7810E3FB;
	Thu, 21 Nov 2024 12:20:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WPnhxy0i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFC2E10E3FB;
 Thu, 21 Nov 2024 12:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732191609; x=1763727609;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=XmFOb00zdRQr2NXwujp9Al4MX7V8HIl+WfAf9MqhHUM=;
 b=WPnhxy0iv7Blwp1j3HZHXsMarzKcojg322/jl27YBzSoRqEdP94KJY/O
 FWojYu8GD7n4aFlunAQDToVIOS7ejQrURP2VIfytnPQAbE1RCgk9Nrx2I
 ZhqzaQ3tfx35kmpZApf8Wx49sj64I7tb825PtutfSm6VV190YhMvFZ3Ar
 emekMxPffZTiSX53y5jJf+P24ghMjE05kNFyKIfP1y3o6XvJB9moB3+nx
 EvYrNDyZ4yJ10sVtLucXF1WIJ0+SYRPPybNStDa28Wroas+tWc9vrhBXX
 FpKL0EU8f35BNQgjC8r3QPCtZNkr4foY9crRPpm1LpyjKkQVpMHn62TID Q==;
X-CSE-ConnectionGUID: FVW4Rem1R6ipCWX5eLKNxA==
X-CSE-MsgGUID: n9yrGSI5R6ai7TTznIMlpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="43683790"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="43683790"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 04:20:09 -0800
X-CSE-ConnectionGUID: sx28edKWRK6LTFABPVRacg==
X-CSE-MsgGUID: CB1HLRkiQYOKxEwRJar1FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="90359997"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 04:20:09 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 04:20:08 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 04:20:08 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 04:20:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wH05265wOL3aRHSHzUM23jQ7mx7G/68av+46EUjykqfteEbypQcJLxg7w+dr6q123UscvLo7tYMO0Zv/R/rUx9I1+9F4mFOXwKCakLXpkyWTWvZY9pdAciA4ShSPnhicC95jEtnEPL8Aoy57ylh+VtmTk+2BK5zrKz4uh5QRPnfOEyC/Yo6HvJZWw48IAXzedeUNZNyyb4cDbb5+aP4Tmr2LEALDRl1CYevCVRRfI/jP8AKeng9JRp+J7HC7zTvneqKc1dRWqE9Tbx76Mm1FsEnjhaEfthqTilV6S2gPb9+m/CsW93Kf6dpp5yA463nZOiDOLPF+JrsbJL71oSWv4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AiKROchrsG+Cii9tTAaZQBNr1tSqDI5Nh5fO4sbxF7w=;
 b=bNmdP32PmSO5rsgcrVG/sA0G+WydTlYuyv6ZbuY6M96eEEjswW5eimf/A1m4BpYqQrjvfAboQ3JsTp9mFLN04kiuKn3K2F93k2Og9AxGfMD2jina7DAHHiPnZBKA/S4y/HCLeGv9KhklPY+0nwJO5oi9BcexhuFtjS3OtmWD38Sd55vWCsqNdhNwY+S8hpkrtPFq2rm+0v65rgtnHQF3Xevr8Wgn97gNEim22gl6lNpI5P0tKOAQNe1aTsPa9IANLcVoChIVJ0ukYTg2ZbjMDg4PPnpdcqqHINgwbhiNYSx31T/Iftl8p5cwZDYdubRGhOambi7rzxKW7sJJ4KeqFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SA0PR11MB4621.namprd11.prod.outlook.com (2603:10b6:806:72::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.17; Thu, 21 Nov
 2024 12:20:05 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%4]) with mapi id 15.20.8093.027; Thu, 21 Nov 2024
 12:20:04 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCHv4 7/8] drm/i915/histogram: Histogram changes for Display
 20+
Thread-Topic: [PATCHv4 7/8] drm/i915/histogram: Histogram changes for Display
 20+
Thread-Index: AQHbOnGH73yyPiXiqEuaFwYJfu6oT7K/+CYAgAGuFbA=
Date: Thu, 21 Nov 2024 12:20:04 +0000
Message-ID: <IA0PR11MB730756E0D56ADAD988E0309CBA222@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20241119104521.575377-1-arun.r.murthy@intel.com>
 <20241119104521.575377-8-arun.r.murthy@intel.com>
 <SN7PR11MB67501686D5E73E6311F4CC95E3212@SN7PR11MB6750.namprd11.prod.outlook.com>
In-Reply-To: <SN7PR11MB67501686D5E73E6311F4CC95E3212@SN7PR11MB6750.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|SA0PR11MB4621:EE_
x-ms-office365-filtering-correlation-id: 48962eed-4dd9-4391-84fb-08dd0a26d4a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|10070799003|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?MKMUjeOtExu09eURO3J31k/uZImaQ/8I2BZmDkqKo7tUeE5jRiX5jtRY2vka?=
 =?us-ascii?Q?mEio1hy+ReosJ+sx1ZvR0TUcJIEQBhWTZ3NTZchKNOnccGCGPjuNv+q5+4pd?=
 =?us-ascii?Q?K9EPHcWtjIm04/LxKuYJyWw3VqS7GvE2BbHqih4kMxsfcPNrnXaC4jn7qxpn?=
 =?us-ascii?Q?hGVNI/CluGcEnDCfXxLTW7rH7F0O/uEHCfLxEyw4H/BLg4P7vqyOqh3cVMZs?=
 =?us-ascii?Q?6fuDVPig3s1EW3vU+onbVxzzNs1p1BUOCDUp+eFK+Ov2aXPH+E6Eej70mKeW?=
 =?us-ascii?Q?9Lk/s4sMSnrg7XuOjjuCqtfw/8AX18xPO67KVSN9QRgvEBWEdssXcxrZv0Iz?=
 =?us-ascii?Q?THhy1jnvf5VTQfLZab+uHdqHXx+MPPJ6dCapcgTU4KBOPRtKt6eS1oeaK2Wd?=
 =?us-ascii?Q?1SDO6mHfVUlxFALd+tGq0ZdBzf8MTbFOkn1trfG8UYVm5/r0Ecr8LNwkj6Lv?=
 =?us-ascii?Q?soKd5i4YLGgJJxiK2L4aEkDduc9pY/JxbVyddyG/cuqXS7orrSnLxnF9IRL/?=
 =?us-ascii?Q?mtZLT9Pnz80vXgRTUEP9bxPQPuNJ4Ax7osEqmLDgztTmFfY59MgloJboZ3oi?=
 =?us-ascii?Q?a5g31TDCzwiQOe6fcTDqYsGedCweyAkwApC54pKq+l7Rigj/fjq1roIcRfLc?=
 =?us-ascii?Q?R3IDK444R6XCUXGe9PBVF9nr0tiIu4QT0zQcR1CbjdO2Xpuz1nAZDma35geB?=
 =?us-ascii?Q?/SsnPvzu+xCcB8miZDwKYK5Yh6DwnuNBksJWQ/jMAapKc6AV0N/LQeVQW8MH?=
 =?us-ascii?Q?se6Erf4Zt1wvxwmr2vb07Brvawa2vgWiedHqVrs3xaND2eIvXxi1NcY0EIzF?=
 =?us-ascii?Q?5hTNa5vLJRPrT9p99RgzjbU7VXESJsPXiYTFLzCX1+K18JjxOCbv3smhRYoc?=
 =?us-ascii?Q?AuqWxs29gjgKE9pM4bLQX0aM17f/JNzCEsxiG/99bVD/oAkcdiN1xU2ZpEBH?=
 =?us-ascii?Q?Iur0di4WYUw2TZ7YmxRHSbdVILxoyUF18sbrPOtRT3NiKZt3TPIXKtZxCBNG?=
 =?us-ascii?Q?+5U2jD4ykyoDNVyCKEnHV948Sy60phKoucCG7BXZo0lx0deQwbpzfRuAl1y5?=
 =?us-ascii?Q?sLBSf32mvLEW9BMq7OBVUG62eSqZr8wMZdFL9kzWjOSSy77XVxii0Cu5V6Dk?=
 =?us-ascii?Q?IYn3gY7jXPvJGB8RWOhoN1oMBZlc/mToby4cn466jBQyefGQ43/oRtZIQxwB?=
 =?us-ascii?Q?1q+ADFvZxTBV7e28DxN4+XdoQeDDPMuqKlIZuyCDqUIuIf87QlX/s2EHOEht?=
 =?us-ascii?Q?4v3cqoLkmR4HiAym7Pm4Cvni8iL6QyHTyI9ZNKn/oQeB0q0EZSGbvrIS4YMy?=
 =?us-ascii?Q?a/VSsoAAQxyKGhtOHcY33qd7pUGqATKj2pDMRBUDZPU73u8wEGCC3y+fk/Xq?=
 =?us-ascii?Q?B1pmL5c=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dIpA9k+PUJUKYuoaUYI1Ehc9whHp6sesU3Mht7F5qbCF8UsnRLpxL7NQaSa3?=
 =?us-ascii?Q?VjKP5va0bzwNU9+/38VtlR7vrwM2d7VwJlsTodRsizQ+ZzE+v5CgGlOiNgK9?=
 =?us-ascii?Q?QZJOt65Ec+SEjzZhbmeuBI+84Uy4aqB0nrcsekjqhEuDcqqlpfxsup7P12Il?=
 =?us-ascii?Q?SJHisimM8quHSmKBmC+Ndpqe1G9CzLvxsGRNMnc7cYWVwC4x8+vZ2zAxhWDs?=
 =?us-ascii?Q?0gAIfYUCJJXfRKfBCZ5JdtmIiv/4V9cqtDnnk2OseLsrTR10VoVPi9pQmC/w?=
 =?us-ascii?Q?SpYghzxwFtCGY2uaj2zRS8uxJ2FuT8uIlQ76KOZ7tMpHUZjQzJ/YSmzdgQ+C?=
 =?us-ascii?Q?xIqjtizrxtJvkqlx+qfAPpTXELn9kS7m7WK2FjJ6maq7Jwl6qr8R3DsE2Obb?=
 =?us-ascii?Q?udyrQyUIcgwI/iYhQ/+hgvpi688znN48lGG0OyvUM2mNJS0EnNOxS5Ub8ZJP?=
 =?us-ascii?Q?QtFT/xINltwr/uL3MR7+NAuGJWJuBHUvB1ToB/IkCUTvgftRlxPeT23QQqWP?=
 =?us-ascii?Q?Qxx41fy0c1U30sC+u2mmv0oNL7wJbe39Q4p6KX4bKRlTXKmnc/6gifYlESI8?=
 =?us-ascii?Q?ZgYzk3szl7aBj1Q+n157m8ZHn7FSfporXtdvv4dnBPB759qaadEFLZCJGqCJ?=
 =?us-ascii?Q?ANysHzQK204QJq88lLeqNSo/MLbOIQFl7w8fP/Foqg7JpnAsFQvmb+zeFOpY?=
 =?us-ascii?Q?54CtxFBtHNViFKoN/hVOmOIEpLd/NyNBXloHcBCD7N3szLlZZ6kXdXy1hlIj?=
 =?us-ascii?Q?nvKMSMex+5zSIBqCh2fAt4hsgzGFPZ6wHN1HL1UHJHimz9CcIu8VUgiJwDav?=
 =?us-ascii?Q?oxQcAjALbMs6+O2FG8C6D45M6/EkFcEKniBzD/C6yU8t0J+rJ2E5RFrZBoRT?=
 =?us-ascii?Q?HUXoSBqfTUyTIRdv6ojWayod7zeP77yFtTb4daAF7VJsL7l93zL9pOwfBZIN?=
 =?us-ascii?Q?NFADGmH8uq7V7V9btIKMYo+gNTwdMi74l4O0pRDhHIqab7kIs4OAWYoyLM6/?=
 =?us-ascii?Q?SFiapXE4iVhCO3vr4kkyZT08w32c611LdU98/bxsUnRL8rQY/Rb0DL6XNA/E?=
 =?us-ascii?Q?jcyrNflCFP51vWc0ZIkdlDDuXD0TX0GxVyfq1PNblR+TGISsOSVVmZSGiw75?=
 =?us-ascii?Q?JW2K9/Mt9EoiZo5ISI090x7PxxJg+rG5B3PwA7xMWgIsgZa5WY3tbL0dIAH+?=
 =?us-ascii?Q?6pktpe/wP+pCbCqZMavypi+aK2jO7WKsjtg4TKr/Selqs/wtlF3sdlWLVkfM?=
 =?us-ascii?Q?5U+/bNWRtg88lscP2K4oc6zGZwSSGGrQln52K3xrFZQy2ORndCGQ2i/z3uV8?=
 =?us-ascii?Q?zRjaSGnruYBBouKxBSoTTiTSO1eP1FpnQyO8Dmd6rGqQyJOPn8u5pzXzPKXU?=
 =?us-ascii?Q?dzERmM9K6EeSWm9WwLTYHi5wPGGEe3ia/lxKgTNHAa4V+5z6VtFXD3XOTJ/S?=
 =?us-ascii?Q?z0Pf/Ruj26dBT9opnM1oVmWf/rOXRfn7wToHviAedA+LgFslw+fbcEt/2+/g?=
 =?us-ascii?Q?GA+stk+1kj8NQdJrRaSyNQmm5e3HT9fV58XhI4SsQ6ftQUMu62/dtWU74OCj?=
 =?us-ascii?Q?P4ozkuekCjP0ByjxD1575FBoeKCnv2N/WXyVDu0dtCsbm7frXfjyPn0G/L2k?=
 =?us-ascii?Q?YKwzUJWgzYp2Aq7sAflloQmZUGOPBDEqWmGdF8oydEr6?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48962eed-4dd9-4391-84fb-08dd0a26d4a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2024 12:20:04.8650 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ny9Q0bQRW32nqj6qcnT9/rNEp2GYYsL/3ombisxc0E2UkOdOLZi8hLxzbahVxB/LRCSKg3083BCLUzbfrmaxHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4621
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
> Sent: Wednesday, November 20, 2024 3:55 PM
> To: Murthy, Arun R <arun.r.murthy@intel.com>; intel-xe@lists.freedesktop.=
org;
> intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: Murthy, Arun R <arun.r.murthy@intel.com>
> Subject: RE: [PATCHv4 7/8] drm/i915/histogram: Histogram changes for Disp=
lay
> 20+
>=20
>=20
>=20
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> > Arun R Murthy
> > Sent: Tuesday, November 19, 2024 4:15 PM
> > To: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org;
> > dri- devel@lists.freedesktop.org
> > Cc: Murthy, Arun R <arun.r.murthy@intel.com>
> > Subject: [PATCHv4 7/8] drm/i915/histogram: Histogram changes for
> > Display
> > 20+
> >
> > In Display 20+, new registers are added for setting index, reading
> > histogram and writing the IET.
>=20
> Bspec reference for new registers being added please
>=20
> >
> > v2: Removed duplicate code (Jani)
> > v3: Moved histogram core changes to earlier patches (Jani/Suraj)
> > v4: Rebased after addressing comments on patch 1
> >
> > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > ---
> >  .../gpu/drm/i915/display/intel_histogram.c    | 111 +++++++++++++-----
> >  .../drm/i915/display/intel_histogram_regs.h   |  25 ++++
> >  2 files changed, 105 insertions(+), 31 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_histogram.c
> > b/drivers/gpu/drm/i915/display/intel_histogram.c
> > index fdcc64677e96..beaad9256e01 100644
> > --- a/drivers/gpu/drm/i915/display/intel_histogram.c
> > +++ b/drivers/gpu/drm/i915/display/intel_histogram.c
> > @@ -29,6 +29,51 @@ struct intel_histogram {
> >  	u32 bin_data[HISTOGRAM_BIN_COUNT];
> >  };
> >
> > +static void set_bin_index_0(struct intel_display *display, enum pipe
> > +pipe) {
> > +	if (DISPLAY_VER(display) >=3D 20)
> > +		intel_de_rmw(display, DPST_IE_INDEX(pipe),
> > +			     DPST_IE_BIN_INDEX_MASK,
> > DPST_IE_BIN_INDEX(0));
> > +	else
> > +		intel_de_rmw(display, DPST_CTL(pipe),
> > +			     DPST_CTL_BIN_REG_FUNC_SEL |
> > DPST_CTL_BIN_REG_MASK,
> > +			     DPST_CTL_BIN_REG_FUNC_IE |
> > DPST_CTL_BIN_REG_CLEAR); }
> > +
> > +static void write_iet(struct intel_display *display, enum pipe pipe,
> > +			      u32 *data)
> > +{
> > +	int i;
> > +
> > +	if (DISPLAY_VER(display) >=3D 20) {
> > +		for (i =3D 0; i < HISTOGRAM_IET_LENGTH; i++) {
> > +			intel_de_rmw(display, DPST_IE_BIN(pipe),
> > +				     DPST_IE_BIN_DATA_MASK,
> > +				     DPST_IE_BIN_DATA(data[i]));
> > +			drm_dbg_atomic(display->drm, "iet_lut[%d]=3D%x\n",
> > +				       i, data[i]);
> > +		}
> > +	} else {
> > +		for (i =3D 0; i < HISTOGRAM_IET_LENGTH; i++) {
> > +			intel_de_rmw(display, DPST_BIN(pipe),
> > +				     DPST_BIN_DATA_MASK, data[i]);
> > +			drm_dbg_atomic(display->drm, "iet_lut[%d]=3D%x\n",
> > +				       i, data[i]);
> > +		}
> > +	}
> > +}
>=20
> The above code can be configured as shown below
>=20
> int i;
> int register_base, data_mask;
>=20
> if (DISPLAY_VER(display) >=3D 20) {
>     register_base =3D DPST_IE_BIN(pipe);
>     data_mask =3D DPST_IE_BIN_DATA_MASK;
> } else {
>     register_base =3D DPST_BIN(pipe);
>     data_mask =3D DPST_BIN_DATA_MASK;
> }
>=20
> for (i =3D 0; i < HISTOGRAM_IET_LENGTH; i++) {
>     intel_de_rmw(display, register_base, data_mask, data[i]);
>     drm_dbg_atomic(display->drm, "iet_lut[%d]=3D%x\n", i, data[i]); }
>=20

Writing the data[i] to be writing to the reg bit config also varies.
So rewriting this code within the for loop to optimize the code.

Thanks and Regards,
Arun R Murthy
-------------------
