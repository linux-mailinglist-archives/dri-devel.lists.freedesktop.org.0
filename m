Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E143A29F79
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 04:51:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AC9610E41D;
	Thu,  6 Feb 2025 03:51:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XPn+ls3y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF1B610E2D7;
 Thu,  6 Feb 2025 03:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738813767; x=1770349767;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2+leZHNXFUng+wV3K4/w8ffitkGgTfOxzaVxEO2Z6CY=;
 b=XPn+ls3yyMoZcZ9aUICRkgD4XA+Jh6jgYr6oxPZkWRYU5pJ/jR9MYvT2
 nQpj9Rp9AvSLMnW5deOwDVABpGoE4ABNsajUwCrxAi1sfhgvMCguicZ8V
 obqIlS8gad31v53MzGSqAJNjlI33r+14BbDWVGLl2IAZq8HHbesc9AmZb
 Hn/pjpofHHUdABPY+xsfdGa1/lRVY6puM7o7/HzybAgi1lzj5HeZvySnn
 Lj/83q3meEb59WEnLgYQKhPFBRD04F0lwNrScx5qXj74VbO1j77PMQDtZ
 1BkeKQzoE0tE1QCOif0G69kvHW5ga62/7XxKJLBkUC8UEb/bx9eKZQsW6 w==;
X-CSE-ConnectionGUID: a2YpYZyJQuOom8KPF8qP3Q==
X-CSE-MsgGUID: aVRhOyH3RgaN2xo7AroeZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39673929"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; d="scan'208";a="39673929"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 19:49:26 -0800
X-CSE-ConnectionGUID: QFtO3EQ1QlGQdsk8gp70rg==
X-CSE-MsgGUID: lrBlhLq3QpOsgZhdVt1BqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111985676"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Feb 2025 19:49:25 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Feb 2025 19:49:24 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 5 Feb 2025 19:49:24 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Feb 2025 19:49:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nX5iKfW5ZmdFhrEoMmibhBw9Zv8ULWmX8rJKQDHVlaxi/7mKI+TZASGAK6gX4YavHe8fBV93wmuAQQXSLb3voB+6M3iNjHNiUYTR31xDKg+pKcPzS5ERFMIke8RTaG9V0WEd7Jcmd9W/uTRrpN9sCuHXcPGSk0A/dGXhMLbeqdGnoLGudQ9WN1JUnkmS5t+IMptQoS/VAXfeBGtAHQ4Ejsl9pdrnANROkvymfAffFlYkC4/uIbo8vPG7/aJ46tTMBiAacZqhfIL9ooLbDTmkYeSAlIJPIjP0kl3Bi76MhTByE8DK5NDtd0FgIqGO0TFQHycODPv/u+rXjprI7OjIBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cZGbHWX2Krj8VBQ19lxnJI5jV1PEzD8O9MCqYN5anM4=;
 b=UTYt8whcNGeYYwKcw1NFLXCfRU1O9s8T1sxhCljT9eFZzUw0wRvSu3BxyNCtor2z/uRuJKvQblKKsjskvfD4ZUJpBo3YLCca7IGyrgoLMgESkMRfRCH2FuH4Ypf2q0lEIdfk/xbepbCR5kTauEWpeAicwmglvBNBi7YpVkOZtvKZVVa/AMupEGhb2q0w8LJAjnHm7dmZm4jWiBBHZfnEhfoAK0Dd0YALq1Ar0MfjTy01/nTlKMhipZq4aASTSNuT1ckoiy6fTz5XmH24NWRWW4295LeRWjelncHpr91k1EML0hhIuUIEzMyGoiB69guXRTnvFMQU5Nios4bxRQYk9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by SA0PR11MB4749.namprd11.prod.outlook.com (2603:10b6:806:9a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 6 Feb
 2025 03:49:23 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%3]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 03:49:23 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Shankar, Uma" <uma.shankar@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>, "Kao, Ben" <ben.kao@intel.com>
Subject: RE: [PATCH 4/7] drm/i915/backlight: Modify function to get VESA
 brightness in Nits
Thread-Topic: [PATCH 4/7] drm/i915/backlight: Modify function to get VESA
 brightness in Nits
Thread-Index: AQHbdwNpGjyEGGStWE2MxW2trzqfc7M44uUAgADC0jA=
Date: Thu, 6 Feb 2025 03:49:23 +0000
Message-ID: <SN7PR11MB6750EFA928A982F4AFE94DD4E3F62@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20250204125009.2609726-1-suraj.kandpal@intel.com>
 <20250204125009.2609726-5-suraj.kandpal@intel.com>
 <IA0PR11MB730743EF97A0FDAE5F1AD11EBAF72@IA0PR11MB7307.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB730743EF97A0FDAE5F1AD11EBAF72@IA0PR11MB7307.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|SA0PR11MB4749:EE_
x-ms-office365-filtering-correlation-id: 5312dbe9-b2d4-484a-d1dc-08dd46613ea0
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?UgqjN+kr2cdG8e1OKPDsK/hoadZsUOwodcdZsLftgir0QJdduJRfd38nMRVO?=
 =?us-ascii?Q?7U3udNSvXUlMwCOWkurov/BVG1LQepgHQ1/IiulfOro3lbJbLekkCFcp0YmU?=
 =?us-ascii?Q?rAeTqeN4MHpd0mWft59V76awEN2fniACaVPh33GetS5GP2eOVctoIgIHATvz?=
 =?us-ascii?Q?rwY8A8h9jUhzytA7iINgMvGNr82Jh6UC4H+plDbeFW4BPmVHhKLh5RoD+61s?=
 =?us-ascii?Q?vH37T+ueKZP/7Uvr33L+KeKlGUAEwt6ZUxNobur0oQhS+txzFQIvGts43lAZ?=
 =?us-ascii?Q?HzBh+kM4EL6/CT8doBY1rRcoYWuq5yeIVk/E8pWxabNYwJ43HCYppb3ejKn6?=
 =?us-ascii?Q?JGbvuBHNGso/gbbfwz6MYWIqFQY8fe9rHMIdEUguBquf16rODulO0KqT5gr/?=
 =?us-ascii?Q?KghX6bR8yLyPwfCsiB4mkDLroIH4fdvf4SWZh5LvAedRJ9ZlcIxWHx5s4yFI?=
 =?us-ascii?Q?EeeZvw7Wul3GGMTG+uwpMpy0DBYlKP30IHJYJgaQTHH7bhF0V+Vfz7skxEoN?=
 =?us-ascii?Q?m8PKGu/a3+zrydMXHeNlvRDuyMkj9UdIDex/rUAGWvV82i8c4nPmhvBBE9pU?=
 =?us-ascii?Q?t8bph9eAC8tWt9k4XKSGSBmBVsw64KzbpFWnNMOLzBiP8H0sVrHlEDKtR+Oq?=
 =?us-ascii?Q?1o34iQhKbA9z2GQ/WUXnvaN7J0SpWn7/vns8ZidlxVtnRD4KIudQAJ3a6lJP?=
 =?us-ascii?Q?MCxDI1NoAlhiHDbTXZCMjz314xqidHIhPWVjvz+ch5kmM2UlakDTJANaiar0?=
 =?us-ascii?Q?D/ykrPVP8IhwiMKIbBOtHaCwYQBtN9UsMI/gCiE6f8a5J6lHHzc2QKtWfLXs?=
 =?us-ascii?Q?V4nfWJBik91zQ+ujn1/fgmkIygS/P1zpyxgLjMuC4qlPYdOtwcp3OUjen4yr?=
 =?us-ascii?Q?yZ89KRSsuTs31LaCycFjeYqjJew+pFwryV532vXtnz6a/rvWRrluhTj2Q1CS?=
 =?us-ascii?Q?SV7WWnjNGAiAorodagjJIpE9Jw+c496UI9eAFGk1iVE2qsNX+kuhh3KLSk95?=
 =?us-ascii?Q?NsDvapnLl8XDsTDEQSikkhVnsn31XemQm9msvYTF5n2S3caXSNsPMJcQojGa?=
 =?us-ascii?Q?6LASDS+tToojOtCMJRAqhw/0OLwUjwB8dmNKbKFPpKc0/GL139aa/pyI4qTM?=
 =?us-ascii?Q?XeTd1adU/ndbJAcQ4N70HEcoaVRO/rayTLpgMckT0B86TV1qoxSMWREu1N2p?=
 =?us-ascii?Q?9fMfTezHYnkN1H331Egln0WjmOHTfzHVR+S84AeG1XIW7zDwZ7dgvLqbCGDL?=
 =?us-ascii?Q?u0mOdhZE8xCvEfRIbKNdVsbZ5pMy9hPY7FIQ0KLFxVE7JTJJJrflo/Pu4XHe?=
 =?us-ascii?Q?JcQS5rV9F7wAY9D2rr3lQlGt617BISa9EFU52Ar5mnTmdMIRRKvLqqidXVju?=
 =?us-ascii?Q?bGUQXM0pJhtwrJUMzS9H4I2Bxxg7JiE11Uvq0d96Kvn8lR7xwU6UavEOtyzu?=
 =?us-ascii?Q?b7Mu6hT6BuRdLaOzr97P0bKH8qHpKJl2?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+12dxzKQmWPR1lTBWct9awhyQIbuCzZASRnZLgxy35LsuZzf+Ch3bJ+Wha8F?=
 =?us-ascii?Q?k11if6agbjTDGthmZvIr+gDq62vgEHZghIzd6WOKUULfhyOj1qpO4MS1F7T1?=
 =?us-ascii?Q?bzHAPDQAC7DXY8s7tVKTj9LCuRqqbmo9MCR4SbM+5uAxKuZEeySPeUN1DQE5?=
 =?us-ascii?Q?Z1NqzTwSy4gH+L0tBoZbQ5/IElXtKS/zgF0Of7o8dgRNWbJsH3kQk76b+OG0?=
 =?us-ascii?Q?s3gOyTXnaPDzhEK2g16xvpDnUMuRJXq1Ln+gDvqQzp2DN7kMX3U4HLltFqm0?=
 =?us-ascii?Q?MkCiV9svVLOoS8PSbuvooH+/0JgG8s2hDSaVGcN4kbVtYmeh9NCg048lL41t?=
 =?us-ascii?Q?WLRinLurZCqjAhbgx4hqA5s47lEy2Azbk84bXkOoqEZQRRKeCjUcNTGCtI73?=
 =?us-ascii?Q?Rc/npwugIz/FaxbaWSR2wEhTtRGfai4ttpQUHDMd2Q05J0y5IGoD+r1hy8nM?=
 =?us-ascii?Q?P9LKSjBuKQIpiIoQCWUVkRr2E7KNLybLhQTl/c3jCnMB0XlA4YWOgPeYuWoY?=
 =?us-ascii?Q?TyR2NdWinlXkD+yMCBUJJNBgmP6+315dlQmMMek57hwQWZxJFE4gjaMGycb+?=
 =?us-ascii?Q?pl4D0XSZuA7B+xcdzjJOMvA+/x9V8ilAV6mebZ8IVS3C+OzwWt1m5WppUpdn?=
 =?us-ascii?Q?wgEb7mwyODeifMn949n8+AfuvuwdCzPFyZj2YUm5ws77Z9EryhzsamHGL9iQ?=
 =?us-ascii?Q?xoDCczbGRZP42BnMVZz0S9TuLbQSfA/ucAYx+EYFl96Z4HBbD3V2ZcWR6RlM?=
 =?us-ascii?Q?wzMI9VKpYIEctvVT+hi/bV/FiKxkRGbtiqM8uNqhTRZSmqBqc386NoZorq6x?=
 =?us-ascii?Q?MOUIV5s5Jxk9KG5T9Q1FUzcLcd+GKaTrXlt9SsGzx4Jbvev0FjOBNqBtiIba?=
 =?us-ascii?Q?2oZvmVJXAWcnVmqGj8xtxpVjT6Gvub4vcczacHoGJKZRSa5mV0P7mv8isny2?=
 =?us-ascii?Q?nhc+gwBmVo5asmzqzzoHR1MKlWZmPReC4+ryH0ZwBXawerA0BB+dj/V83zaE?=
 =?us-ascii?Q?B7QHyzGeoBmNUA4P5j9INA8Ro2oAj4F7z5YLlCgWxfbFEKB+YPOt369wEcQN?=
 =?us-ascii?Q?B5+xEx7+maWCl8pfzX3gdCzDnkDHZsZOotuNbGN4Xxhvf272uma2iXNBepAE?=
 =?us-ascii?Q?FzrrYStoAgEe0lVBlpWP37SSMkrZmWfD/NG3FXSh/TvWaS2hq53I4M4DBLJW?=
 =?us-ascii?Q?79VRjlkBMFVfqgVvnnl+AAURlLhZmyuEIgvMAxSdcULbZdgx1tj5GdsJX5F+?=
 =?us-ascii?Q?lB4wy5gkuFf8U/9T9UyUe0nkUXhHiW2CgdNVq3kjvkiLF9h3VhNqZVjS+5jl?=
 =?us-ascii?Q?wCV9zRagC+XslRT2JcbrVGP2JqxZ9yUB0Byi/8pFMIiJPn+Kv6uJZUPzsEuP?=
 =?us-ascii?Q?hL/zRDf9WRI3xEtsEQkKEtoTRyVOWhsmi4kOxYEkDeEIKpvyjO6KsfC8kobx?=
 =?us-ascii?Q?HI2tBnO9ZOcJKGov+mwxi3HaQoiZpLuytejlwBXkN4hQv4OsDET+Nuhkp5WO?=
 =?us-ascii?Q?jOR9cGINg1QT0aqFFEhtj1dSZ0BcVkeY9TrRkqrpCGUABRwYoEd7XRD+ceKE?=
 =?us-ascii?Q?nYSKononcs5SO2XGEXXgP1bH72RYLeMsjpc6EKPT?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5312dbe9-b2d4-484a-d1dc-08dd46613ea0
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2025 03:49:23.2381 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EHX5V61h5n2fcFb6Ukq6xunHHMAOmkWKvTTSHscw18IxOJ0aqI+eCzqOFH1+VP+N0E61XnPu8KITz8IqwbWVUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4749
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
> Sent: Wednesday, February 5, 2025 9:40 PM
> To: Kandpal, Suraj <suraj.kandpal@intel.com>; intel-xe@lists.freedesktop.=
org;
> intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: Shankar, Uma <uma.shankar@intel.com>; Nikula, Jani
> <jani.nikula@intel.com>; Kao, Ben <ben.kao@intel.com>
> Subject: RE: [PATCH 4/7] drm/i915/backlight: Modify function to get VESA
> brightness in Nits
>=20
> > Modify vesa_get_brightness function to take into account
> > luminance_control_support and based on that read the appropriate
> > register and return the value.
> >
> > --v2
> > -Changes since we now use luminance instead of nits
> >
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > Tested-by: Ben Kao <ben.kao@intel.com>
> > ---
> >  .../drm/i915/display/intel_dp_aux_backlight.c | 20
> > +++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > index 84126e7d1716..a733b5623563 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > @@ -451,6 +451,26 @@ intel_dp_aux_hdr_setup_backlight(struct
> > intel_connector *connector, enum pipe pi
> >  /* VESA backlight callbacks */
> >  static u32 intel_dp_aux_vesa_get_backlight(struct intel_connector
> > *connector, enum pipe unused)  {
> > +	struct intel_dp *intel_dp =3D enc_to_intel_dp(connector->encoder);
> > +	struct intel_panel *panel =3D &connector->panel;
> > +	u8 buf[3];
> > +	u32 val =3D 0;
> > +	int ret;
> > +
> > +	if (panel->backlight.edp.vesa.luminance_control_support) {
> > +		ret =3D drm_dp_dpcd_read(&intel_dp->aux,
> > DP_EDP_PANEL_TARGET_LUMINANCE_VALUE, buf,
> > +				       sizeof(buf));
> > +		if (ret < 0) {
> > +			drm_err(intel_dp->aux.drm_dev,
> > +				"[CONNECTOR:%d:%s] Failed to read
> > Luminance from DPCD\n",
> > +				connector->base.base.id, connector-
> > >base.name);
> > +			return 0;
> > +		}
> > +
> > +		val |=3D buf[0] | buf[1] << 8 | buf[2] << 16;
> |=3D doesn't add any value
> Also better to add braces (buf[1] << 8)
>=20
> > +		return val / 1000;
> Fractional value will be lost.
> If its expected then with the above said changes

Yes this is expected since the granularity of this reg is .001 basically ta=
king milli nits value.
We get our level in nits hence multiply by 1000 when we write into the regi=
ster and divide by 1000 when we send
The read value back.

Regards,
Suraj Kandpal

> Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
>=20
> Thanks and Regards,
> Arun R Murthy
> --------------------
>=20
> > +	}
> > +
> >  	return connector->panel.backlight.level;  }
> >
> > --
> > 2.34.1

