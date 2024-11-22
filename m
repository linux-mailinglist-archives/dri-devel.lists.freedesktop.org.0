Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09ECD9D5AA2
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 09:06:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB6910EAE4;
	Fri, 22 Nov 2024 08:06:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="njF4J0IA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC8B10EAE4;
 Fri, 22 Nov 2024 08:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732262787; x=1763798787;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Dxn98fIZiuGIhT/JzZFhlDrEP1aeRehODx2UdevU81w=;
 b=njF4J0IAId6k3OzMmwa6F5z2XfJw8mY5EGd1ZAk2SLXaqRnqQVVgRB6M
 FIPJRIUI5cwce03U6lxTQykp1mNC6L61ezaQ7mC4dJo2+vMjyMUx1vZnV
 SQeHwHR3WHCiBriXVAXbO+cy7WJNbIav+xipnCf9ndXaQQwGJ/u9G4rRn
 ZKWmh0EBrllEDgBHJ9w3qg1V2PoEyfSEPR9iUcU7v5RgAO0yKfa3YIIXH
 5FdNqjowAPjuFhB1S+yJ9JBeCXsjeRTeehiy7tVOHh1qzoe4CfAqUocsH
 MZri+VKu0nOLFZTSOiIcg3pOGQWZHvBAQ5N/AdFPMUJnyHPvPDFjfbQkz Q==;
X-CSE-ConnectionGUID: BqZPjGHARfGrGY5CW3Fzkw==
X-CSE-MsgGUID: Y3+vleVzQySIsWFiyNEM0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="49928089"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="49928089"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 00:06:26 -0800
X-CSE-ConnectionGUID: oCFU8u5NQL2j4BN9dzXs5g==
X-CSE-MsgGUID: CurwgtAMQsOM3o43ZXxHvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="90919092"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Nov 2024 00:06:26 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 22 Nov 2024 00:06:26 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 22 Nov 2024 00:06:26 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 22 Nov 2024 00:06:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R7F82im88+HP/EgIM2XvkHoMGVohJuX6KHXdvzzKJ7pmNHlHowtz443TxrebXx9S1TLIM2bj7osrcsdvwlKqYMMlW9o86M822X7awuOXekp/FSOkSm4iyAQDouq9K2GgIlU1ijp0sWFe6SGugYw1f4TeJc9TY7BKi8pxiKjyf2l9jrR80Gm9110l2/ucj1haRlZvQQWRop9hZcZsaLlMoFC5Hi3e+3BrBb71fw8Cv+uAoQ9Pw3RyWH6lWGHtuwlm/0zyRUjOSZTiVzhXFjkqV27hVKKHamrfgnFs+Gx2ATF64PRf6hepz9Fgepv9n7kiwegfGA1fGgm2z3ZZSrh33g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=546WImfYDhp4faVNOLfN/rimgeEpW0yA5buFNLrvQy0=;
 b=B36h/KPRmujA4mKJVV2mwT2rfcR4M1hmBV1A+Qh9YIbGKiLuaySq2YE4Cnaun5ocnubs0IMwFOh39+ORhLEExN5N49Ktv/t83HWxgbBJPYQzMYDOLaJHxdliZ4ojgXJ40HUHd85J3A7r5Kiw41qNeC2kdskK5DOjdhxkkERdLEEjf605nCc3zE9U4OX5UFaEk29tyt1kElThDKr8BZu9Rt9T7drDN7gJSeOnKFdlTa4TJ2hGE/Ru7x28rNkSExc7cTD9Zelso+0Q9IsaCgj7Pltoy8o9xKfNjxMlRCRbU9lGn0WzO7TCUngxL/gaYqk1fY0tJU/4RwCARKX1cBiUsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by BN9PR11MB5291.namprd11.prod.outlook.com (2603:10b6:408:118::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Fri, 22 Nov
 2024 08:06:21 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%3]) with mapi id 15.20.8158.021; Fri, 22 Nov 2024
 08:06:21 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCHv6 7/8] drm/i915/histogram: Histogram changes for Display
 20+
Thread-Topic: [PATCHv6 7/8] drm/i915/histogram: Histogram changes for Display
 20+
Thread-Index: AQHbPBIhX471FQ1A6EuIfBvfg3i2B7LBw8/AgAAKeYCAASQa8A==
Date: Fri, 22 Nov 2024 08:06:21 +0000
Message-ID: <SN7PR11MB67507FDB16D98414E2175E75E3232@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20241121122603.736267-1-arun.r.murthy@intel.com>
 <20241121122603.736267-8-arun.r.murthy@intel.com>
 <SN7PR11MB6750748F22B5F4C6B1949A88E3222@SN7PR11MB6750.namprd11.prod.outlook.com>
 <IA0PR11MB7307C889E2B558CFE2632588BA222@IA0PR11MB7307.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB7307C889E2B558CFE2632588BA222@IA0PR11MB7307.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|BN9PR11MB5291:EE_
x-ms-office365-filtering-correlation-id: 4af7d038-b0e2-4eca-9096-08dd0acc8d62
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?6VD4F3sCEsH4ZdHBDQgIHFDmprdjCYZA/YyQoCrRePSATsM3oR1q17uD2mA1?=
 =?us-ascii?Q?929RqWCvfV9b6xYyVrX78F9x5kvORuZm7Esn12/vIDj6lzk5+EkYXH+qX/tB?=
 =?us-ascii?Q?/5GBLPjA/7nutY7dHzp5RI/TLK2OYF1smYtp64SFtSErXbjzG3cr6U3rZC/2?=
 =?us-ascii?Q?oy2/jiT8hzlE661zsvBD3TgnKzsV18wBwlCUbd9fWg/nUvCKnaLwI/BKMa0p?=
 =?us-ascii?Q?sw1jdTIQ5yAFXvtFgsFiklwoPAmQ1hYzHgO7cj8fFzdZlUa2PDmypd1xWO9e?=
 =?us-ascii?Q?vdoy2YbmSUSCQdmKeHGCHUg6t6OigE0GSjRuLR1h/dhfNLdk7iSQizckK3Jh?=
 =?us-ascii?Q?B7MpQrLDQc0A2zlzBTTv0rTEg19O9v4pgvI5DDRtLGB3j7MgekYKC6T0/03n?=
 =?us-ascii?Q?DcCFsViXBMcxp1CAF0yHU3E3K9BY3uYSwq61sN7/YKgWsacF+lL8rkZ7lq8M?=
 =?us-ascii?Q?Zol7cQky+Sd2kZ4KW4c0oY3g9r1IJujtzqRRjQPigY5Ti5NZ1v40nROQzU4+?=
 =?us-ascii?Q?pv0bKmN2ASyDFMv+BMwwJMm/Dtn+9udIF1/8dV7/l+34tYjGcq7dxm9iNU1g?=
 =?us-ascii?Q?CFfOK7R4OfCoWYjzRivAFjhtRicF/jAUy/V6zAzh6ULsUlWmYBJvghoo6nr1?=
 =?us-ascii?Q?/+R6U/q20M1YAuVHWEsySePGInmWKOudhuNuiQknp2vkfZ3EqQVm6E80nTqg?=
 =?us-ascii?Q?Xy0IKwCvEUKgnMOHe1z3I9RXiWn3KAs24XQETHdO7ghpfgDqPXR0gv/WUWUq?=
 =?us-ascii?Q?Jaw/C1IIevwgoRH9870l7HENBH/vAQz+hxlJKHXUQD9rEpFE0uO3TdgcP05+?=
 =?us-ascii?Q?WmZXswFh5es8oJoNiEB/jU3x31Th4NftaHRVzE7/Qsw0k83Nhp59tIrA7/qF?=
 =?us-ascii?Q?q07pxR84PXO5xa7SDGfS8qd0iNKv1fwyZ0tk9ynzlPsii/d7WiY4GPkFn92z?=
 =?us-ascii?Q?8ASbY5NOavJK/TPJbhLk3brf4q7E6PyKDbpR+8ApTaSrRPWUihVRf104yZ80?=
 =?us-ascii?Q?shn19JpBM2cyLVfDoLHQLXdvO99qIFbt+RG5vp2Hy2EIt1ikYcQE1nyJ0UL8?=
 =?us-ascii?Q?sbh3xzrLYL5NIftwthyAKQb3wGR63INwNQgLLxD4PPUmvBxEzpJaj8zI0h0E?=
 =?us-ascii?Q?1WyGFHi0r0ONwwQjiOBYAOvW06BpnCgFZyhGWI1fEZAPI98GpvVxBWKAXTob?=
 =?us-ascii?Q?+pqnSh331vBzBaJ8qKulXScNfEocbQB1Iq/Vm3vRkl9ig6nmvYYUgIYe7/dW?=
 =?us-ascii?Q?5dEW2BPsGO8OluWkrkBedfY+SB64UQCkD6mzHI2ye6STtdrSRnqDOQiCZsfa?=
 =?us-ascii?Q?ZIABDXsW+z1FFhjK+mZrpJlWIhRX+tVZQWey0E1Ju07PUUnXn3CVHd+NFXdC?=
 =?us-ascii?Q?JU4AbLiedyNZytPwE891A9FFGQoY0vdONVgUl55L95vF+59p4Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?q+lOEpwYtZRWFn5DD8DS5sSqrp6Ku1B6PPjOZCjjRynyorMrsqdpJ1dgMVOV?=
 =?us-ascii?Q?bXHDjdAaHkcG774bJ0tb/Ltd9W2ANOIN3YhffuzCyrMiUJjsYTXrphxl/Crw?=
 =?us-ascii?Q?hcPEnR3YZRfScnC9I4GpfXeDgtWxRmzeMiDs+yNdxoSEj98D962aCkvNB38E?=
 =?us-ascii?Q?00t0CEWZzjrJsonOUI9JsNaoUmSkfWMcyk83dkN84mJr8zbOP+WXuZDibEeW?=
 =?us-ascii?Q?ru0lCvk01lgM4czWj8OPcmUFG0p181/JV2JRVOILcU8TICsMfeQxqHYuncqM?=
 =?us-ascii?Q?mczP12+LY8YExaINFoOcYB+FoA/sAGKzp6U44hXWCxxm/Iqo4q3mcR/vUuJp?=
 =?us-ascii?Q?Rg5b9sR3iB7wFT4fCHVoMRAiY51kj/RmP6hDlpvuL67i9/a1ZOgPVjFuDF2D?=
 =?us-ascii?Q?pXBg6PE4VEhvwEaxqE5iv7L3aGP510BkRE6ycb5VZG/6C7FP5GiD9up3Znt3?=
 =?us-ascii?Q?7mK4Ep0tLKStBLNW4soP4Vx5Ro8nwvxy6lzL22f9u2ycXUEYA979F6xBbyyM?=
 =?us-ascii?Q?Oy6+dOu+eWoVtR5ddHME+3saEabI2edG7UO9kZZFzVCec0uvMibT5feeEruo?=
 =?us-ascii?Q?0jPGJ/4uNJXWCFdxZOi9/p1vilXelzlIAuonUftDxVyGpR51tJxV40DMdNUd?=
 =?us-ascii?Q?CCN261tBE4c81xQX95SHfduH0Iyw36PVUtmX5MiSGIyrj8YY1yY23RSS4YZD?=
 =?us-ascii?Q?SCRai6OHecBzG+yva8QHE71nZRuto7NceA1GCuitiSd8dE6C1jjaQpoF6AyD?=
 =?us-ascii?Q?X3PZXRjvXwIuYV4CoXkPQ6I5vwDf1zHxx0Q86Dku6BqKy5VS1iCZznc+cEZo?=
 =?us-ascii?Q?dPQzKq4byNUOBBHMtcRFqdnlc9dDW6TQ3Tn2d24I6WPciQVjexaEEv8IalDT?=
 =?us-ascii?Q?pZg8EOldF7Q4RKyWPMVgkjvV1v5059LE0dkjOCi2WI+l7sjAd0Gyho2z/b3v?=
 =?us-ascii?Q?AiSdIcivPkSUkqPkgVPnuKhH3B9cExD+4LH6Dq/85fJukd7rdicb4HC+ptrS?=
 =?us-ascii?Q?VQgC8Tj8otQcrg+nW/2AzC8qrJSsNTWkVqDc0TbWNM2BpNSHjzhEkM6Z0+Xs?=
 =?us-ascii?Q?laUj5xfsOiL0WS5ZYqa/wsyJRXMybXH2esE1hqACCQNa8YrrBJZyEy8QJp1I?=
 =?us-ascii?Q?g42j4ZZchSx9E2oSCJUEe5s/r4cojmpTVYemVCT8dCfGSAkeh6kdX97kEDI5?=
 =?us-ascii?Q?lWSCNUOoY3QgBg9E7gXYCwNixekjuN2DdGEVLbOQsI0ehb0L61u0xigCIIWV?=
 =?us-ascii?Q?I2Mf2UeetZauhnJz9w2cHI7PnH2kNljc9n0A/jS/auUoprqz7MH7Io8cBRLZ?=
 =?us-ascii?Q?xuOdaea6jYCaDTrFDPllYe0RMMdwmucd/s04iREoox9rmZxcLLwZ0jO9IxsP?=
 =?us-ascii?Q?q43MFpRxByFF48ESiRsygz8LJY/7MBWSYTwlzkA4jgXy1KbjBLbXFLUzDcAw?=
 =?us-ascii?Q?Vuyl+DSx4HL2VOQnePYH9aR5I0hfkYm2wumXxKMtsJ8Bby92SrcsAVPfOy5X?=
 =?us-ascii?Q?VSpPX70iC5PWj5DYcubaMghc6YPTzqfPn+rzWw767zbnoNWHPbuqzBsDbKR8?=
 =?us-ascii?Q?u6q/23QVPkiUwkfeTDjfWjIXXIfsAfj951ttXPLO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4af7d038-b0e2-4eca-9096-08dd0acc8d62
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2024 08:06:21.7700 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EzTtHL/ZGBGQptz73qH+Ia5i0jsG3IIrfdY5Ni/mLWU5DbViasMyzO0FH9jma2Hxed+Oq/sQY1233rxQgeVagg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5291
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
> Sent: Thursday, November 21, 2024 8:10 PM
> To: Kandpal, Suraj <suraj.kandpal@intel.com>; intel-xe@lists.freedesktop.=
org;
> intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Subject: RE: [PATCHv6 7/8] drm/i915/histogram: Histogram changes for
> Display 20+
>=20
> > > -----Original Message-----
> > > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf
> > > Of Arun R Murthy
> > > Sent: Thursday, November 21, 2024 5:56 PM
> > > To: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org;
> > > dri- devel@lists.freedesktop.org
> > > Cc: Murthy, Arun R <arun.r.murthy@intel.com>
> > > Subject: [PATCHv6 7/8] drm/i915/histogram: Histogram changes for
> > > Display
> > > 20+
> > >
> > > In Display 20+, new registers are added for setting index, reading
> > > histogram and writing the IET.
> > >
> > > v2: Removed duplicate code (Jani)
> > > v3: Moved histogram core changes to earlier patches (Jani/Suraj)
> > > v4: Rebased after addressing comments on patch 1
> > > v5: Added the retry logic from patch3 and rebased the patch series
> > > v6: optimize wite_iet() (Suraj)
> >
> > I think you missed some comments from previous revision Add the bspec
> > reference for registers added
> >
> Added
>=20
> > >
> > > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > > ---
> > >  .../gpu/drm/i915/display/intel_histogram.c    | 105 +++++++++++++---=
--
> > >  .../drm/i915/display/intel_histogram_regs.h   |  25 +++++
> > >  2 files changed, 103 insertions(+), 27 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/display/intel_histogram.c
> > > b/drivers/gpu/drm/i915/display/intel_histogram.c
> > > index a64e778fface..db4bc60be557 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_histogram.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_histogram.c
> > > @@ -29,6 +29,37 @@ struct intel_histogram {
> > >  	u32 bin_data[HISTOGRAM_BIN_COUNT];  };
> > >
> > > +static void set_bin_index_0(struct intel_display *display, enum
> > > +pipe
> > > +pipe) {
> > > +	if (DISPLAY_VER(display) >=3D 20)
> > > +		intel_de_rmw(display, DPST_IE_INDEX(pipe),
> > > +			     DPST_IE_BIN_INDEX_MASK,
> > > DPST_IE_BIN_INDEX(0));
> > > +	else
> > > +		intel_de_rmw(display, DPST_CTL(pipe),
> > > +			     DPST_CTL_BIN_REG_MASK,
> > > +			     DPST_CTL_BIN_REG_CLEAR);
> > > +}
> > > +
> > > +static void write_iet(struct intel_display *display, enum pipe pipe,
> > > +			      u32 *data)
> > > +{
> > > +	int i;
> > > +
> > > +	for (i =3D 0; i < HISTOGRAM_IET_LENGTH; i++) {
> > > +		if (DISPLAY_VER(display) >=3D 20)
> > > +			intel_de_rmw(display, DPST_IE_BIN(pipe),
> > > +				     DPST_IE_BIN_DATA_MASK,
> > > +				     DPST_IE_BIN_DATA(data[i]));
> > > +		else
> > > +			intel_de_rmw(display, DPST_BIN(pipe),
> > > +				     DPST_BIN_DATA_MASK,
> > > +				     DPST_BIN_DATA(data[i]));
> > > +
> > > +		drm_dbg_atomic(display->drm, "iet_lut[%d]=3D%x\n",
> > > +			       i, data[i]);
> > > +	}
> >
> > This looks more clean according to me
> > if (DISPLAY_VER(display) >=3D 20) {
> >     register_base =3D DPST_IE_BIN(pipe);
> >     data_mask =3D DPST_IE_BIN_DATA_MASK;
> >     data_temp =3D DPST_IE_BIN_DATA(data[i]); } else {
> >     register_base =3D DPST_BIN(pipe);
> >     data_mask =3D DPST_BIN_DATA_MASK;
> >     data_temp =3D DPST_BIN_DATA(data[i]); }  intel_de_rmw(display,
> > register_base, data_mask, data_temp);
> >   drm_dbg_atomic(display->drm, "iet_lut[%d]=3D%x\n", i, data[i]);
> >
>=20
> With the above code snippet data_temp will have to be in the for loop so =
as
> to get the bit mapped value of data[i]
>=20

Yes the  whole code snippet will be inside the loop itself

Regards,
Suraj Kandpal

> Thanks and Regards,
> Arun R Murthy
> --------------------
