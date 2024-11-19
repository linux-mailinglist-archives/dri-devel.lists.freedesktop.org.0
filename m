Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5048E9D2859
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 15:40:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8499910E2B2;
	Tue, 19 Nov 2024 14:39:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hk3X3BlU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD60210E2A1;
 Tue, 19 Nov 2024 14:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732027199; x=1763563199;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PHcKVeCDM7Ly//7cdZlZ0hRuS7nkej8vQs+JYXxmkNo=;
 b=hk3X3BlU5ksgObJnTWQuaYWFFmWFp29GhlZGK3UvELIldlaHasrQGd+b
 yqONvuwKdtlEPqF9Nuc9f62SUwbboxlcTCQGXC7rovUJOS8qoOmNhfHEx
 7+0+XQaRwNtCPYfpeOwE3O2yCD69NMX0AAekUJEswEhjfj+kav51iUBf7
 4B6P9dwzF10/rWX1Mf12aVZ3RcL3oRghDcoeKc9/0ibm9W+Jxz/n9mcrs
 qpmGwnNapHSlBfFlOk4IY30F6AsV6t7RlszXz6BWKMg1mT3pLsBt4yxfY
 CcUAE5SskZynEkLXFOc5cyqToAH6cAabzs0y1k8gU0iE+CZVuwrypvdLl w==;
X-CSE-ConnectionGUID: 6DtAHKCISz2opu8CabmknA==
X-CSE-MsgGUID: 3dIXK4b5RCWTkmyYbDw3Yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="35701563"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="35701563"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 06:39:59 -0800
X-CSE-ConnectionGUID: o3RuUXAISBiu0OOARvZl/A==
X-CSE-MsgGUID: h2/TNRWKRTmBny7D0HS+IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="127103637"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Nov 2024 06:39:58 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 19 Nov 2024 06:39:57 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 19 Nov 2024 06:39:57 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 19 Nov 2024 06:39:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jmWg0BS2RKPiH7LU84ppiuswbNEsT1rJ8zNdK6utgXXEnoDKNCyLZZpNevn4ySsQFdyyu8akFf+N3Ux/NclX58LYJFnau02bmoqMKfl9A8Mr36uk8Tigjw5X91AhAJhnx9Pg/79/Mzyb8+cQd92FRAg9jcsBmJtNuaUmoogeu+/XVWOzU0FkUhGMS//hCqRilZRPpL6b7dmi+TTFY6DcTpP1DHTvLobYd/Cwi7DPGY74MB0Nhbat/33uReDwGGrSRyFzf8QmJ8x7/4htvTs16vTKyyzkGyDNGlvuUneNOGAz42cyiJKmyxpC1v7cMUusDFYKeOoYigfv+YGdZyJSMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PHcKVeCDM7Ly//7cdZlZ0hRuS7nkej8vQs+JYXxmkNo=;
 b=HgW/0EPyYJppjpsSbFV8yDKtM19ZTWjTeL0ZhdwbE0m/s4XB1n8fJxovN1DB9Aj6OIAfdfElNE7lK/mzshluQNMtrNsDfPnd7P5Lv946Pmg2sXcittgK3Qrheehy3/YvtTmmqIN0BKRyAFgIvCBS4qcLYIu0RkTnb0XyaxsSKV8awRoeA6x/4UzKGzhJVG66aJVIXl3qbxpVBQ0E2ytK8CEm4r0arQTgS5KiMhHi21sxCkC3FBQyWq55Zjank+cDEob5NxGKi3PFVdUyW05QL7wSJFEFq2PHwNDSxBLqrNJMY2OH7GprZX7KULNjTD76ldECJwvuh7SL3eJJeqqgIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SA0PR11MB4558.namprd11.prod.outlook.com (2603:10b6:806:9e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Tue, 19 Nov
 2024 14:39:54 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%4]) with mapi id 15.20.8093.027; Tue, 19 Nov 2024
 14:39:54 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: Daniel Stone <daniel@fooishbar.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCHv5 0/8] Display Global Histogram
Thread-Topic: [PATCHv5 0/8] Display Global Histogram
Thread-Index: AQHbOnGAHAVfmwzDTk+W/3BXAZUFOrK+izmAgAAhNHA=
Date: Tue, 19 Nov 2024 14:39:54 +0000
Message-ID: <IA0PR11MB7307C3B8CB76E54C122A5AF3BA202@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20241119104521.575377-1-arun.r.murthy@intel.com>
 <CAPj87rOO58Q1jBO3QdygzuSZpPeabNdBMeXXd7RhNWVOUFisTw@mail.gmail.com>
In-Reply-To: <CAPj87rOO58Q1jBO3QdygzuSZpPeabNdBMeXXd7RhNWVOUFisTw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|SA0PR11MB4558:EE_
x-ms-office365-filtering-correlation-id: 525b2591-d927-48eb-5a6a-08dd08a80871
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?V05VWmxxa1lxWUJqTG1FWnRuVWV5ZWl4cytpSm9WbzZYbGJDLzNiYnQ4TFZ5?=
 =?utf-8?B?d1VUVGRzTG1aRDJWZ2s1M2VCUmxQZDUxc3VMNzFHSzhUK29LV0Z3OGMzOEd0?=
 =?utf-8?B?YzM0YmRjc1RSTzg4Y096U0VaT3VXMG5oL1pFYStpTXdENXMxRkc5RjYzSzMr?=
 =?utf-8?B?WWlQTjRPTjRHa2d4dVN4WUdGSkpFNGViSkM4TWg5Nk1CRy9WTmFRc3M4dXI1?=
 =?utf-8?B?QXhyRjBYdFNwbnBWMTJhbTNkL0hNc25WYWdpYVcrQlVJa0Y2QWFZVjM3a0JO?=
 =?utf-8?B?aUg5anVpNVQ4azVDYTNFd3luZFVKTURoM0o2czBYekZmQTZuQVZpazF2a1FG?=
 =?utf-8?B?U1VxNStuR0ZzWjdFajFUa2diMXJFSHFtYmZyaGw0ZitKTFhZQ2wxRUdEenBm?=
 =?utf-8?B?TUFISFNYNnU0c0Q2RmREMG93NmV4Q2lNeUFJdDZYMDJQR09aaFN2VFVhMDJa?=
 =?utf-8?B?UXRCUnVyR2tMNFVCckltMnp5aXpIMHNwK2dQeTQ0azFKYlAyUU5YVXhaU0xY?=
 =?utf-8?B?cVlCcTN2UjMzRUpyRUd3dnpkMTRrTWErNHBpbnVBYmpTY0tMUlUzSEowb1Vx?=
 =?utf-8?B?NVN4eis1aGl2RVlSbndiN0c3L3BYNnp2M0trdlc3UzVUaXo3VW5ZUmRBTThC?=
 =?utf-8?B?YjdvOTg1SHVFYVM5UkI0YUVicEFuZmlMV3g0ZEo5UEpabENNZk1YN254Nmpo?=
 =?utf-8?B?cTMzRWo2OGNaOEJiejNXdFBPTm1keU1Ba05lZk4yRnh2b1lLSlhwNUh0c3Ur?=
 =?utf-8?B?ME5FWmFmYmM4ZTFpYU5hc1hqOXdtN0pGVWZUeUJjMFZ3QWpVVm0yMlBFNWow?=
 =?utf-8?B?YjFzWGgyanRGanRnYzg3RDJRWEFMeGt1QzF6bGU2TnJWbU5UVDltNmxwY3N1?=
 =?utf-8?B?Mysya3BwM1RhY0g1QkhGeEg1bEF0K1ZtMEQ5MFd2WDhocFFPSEVONGpPa0x4?=
 =?utf-8?B?OFZKa2NIanRCcjgxKzFadFFFeTFSbURQOWxER1NQR3c1dzZwcEQyanh2dW0y?=
 =?utf-8?B?OU5LZk1MZjRPMWVGQitFcXNXVm9kOVljOG5nb2hxYkY3cTdwVVEvWGdLeDZN?=
 =?utf-8?B?bTFDUnF5LzdpQjNhc3Y0NjR3dDNPSHhiSDkrN3BQdGxQakFHSm5vSzN0YmNM?=
 =?utf-8?B?YkRMU3FZbGJTMk9rSGxZY21TUy9CVUdRbGluZ1BHWWJYc21JaUxRUHVjQWVr?=
 =?utf-8?B?dzhjQUlsM1RPQTJYcXN3UzkxakJCbGVrNG8yS2pYNEF1OGllZnE0YXFxUy82?=
 =?utf-8?B?TnRVbWJJbUtEVmQ2cUFEWXZUcksxc0I0bXhjMTh5dmtMT3RidlU2a2NmS2Ry?=
 =?utf-8?B?eVJRM1RZSVF5cG1CUXFGMVUyaUhTOUJOeTlhbFBpV0IzTmRHMTlncGJuWEVu?=
 =?utf-8?B?bDF3QUtoYVJaMmhod0VnckZaQjUrNlhSaEZTSlBsSm1lc0tYVkRncEdlWlF6?=
 =?utf-8?B?VWZ3SkI5MzVLNWtKU0tLdVBKUGlmVGZ6UG90OUlDeEl6cW9lTFhiZHcvN2Ju?=
 =?utf-8?B?K09leXh2NEhZVUluSDk1MnVDMEtXNWdud2lmb2h1a3RFb1VoR3lqa0ZqTDlt?=
 =?utf-8?B?UzdnaENhZk1DT3FEQVU2dENUeVAvN1IzNGM4OG4vQ1lRc2lkd3hPT1VMeVdt?=
 =?utf-8?B?YkVocUdwaUdZbWxGOXRwaVo5S1htazRPcmVyM3ZsRUs3MkdlY1B4WHkxWnJu?=
 =?utf-8?B?MFpWN0xKMUxXRElZRERpUGxtNk11M0VoOFpPZEN4SGtJdU9sWHAwTS9IbnJO?=
 =?utf-8?B?VWM4RkdTQTRhajFDVzlUbm1kUjdNbFduSjhGcnBTSjZoWXY5MCtuZ0RFKzQ4?=
 =?utf-8?B?cVhjL25BN2ZVL2w1ODdvV1dVQzlocXZjT211cHJ2U3U2ejd3K242TkhOYkxv?=
 =?utf-8?Q?AyY62lA/d1Uqr?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bTUxdGdpSmI3T0J5d1JiQXhTWUVhb2ZVbEd0S3FPQ3BRbncyZURYMjlLeTc2?=
 =?utf-8?B?anI4SDRMMzhvK3VLUTZPcWhnbFNrdGozWUttL3hlN0pabTUzWFFQU2NkU3N0?=
 =?utf-8?B?RXJzd3c3c3ZYQUNFRXpJKzA1YXJnSzdISkZIcUdrV0UvbnRUbWhjY2FQK2ln?=
 =?utf-8?B?ZnJuL3ltbURCdWdLSGJ4N1dCQTRaVXdIWmw2cWgyb01PTHVTNnBWV1QraFJw?=
 =?utf-8?B?RkhJUG10WXB2OTh0SHQ3TTR2QldKTWJja1dGRC9JM2ZieU5vdUlvTXR3OW8y?=
 =?utf-8?B?dEVwdUlhcThlcjVhTW8yZFlWb3hCL20rMTlkZzBpOWNmZXp6YlRYS29EU0ox?=
 =?utf-8?B?K3lOSFppR0RkY1RRK1pKam9PT0tTbDZWWi8ybEt6ZU5WbVhBV0owRkxUQzlU?=
 =?utf-8?B?Slhycmd3RmVVT21HWE4wQUcwMC84c1FKbDdkcnhSOFpObkNyUWxHMnY1Sll0?=
 =?utf-8?B?TklJL0hmOFlTbEpKaXYwaWRSOWJuTGRFM2s1bGJMZSt5Y0F4K05KVjgvWDRH?=
 =?utf-8?B?QUlGc2NGNVZIWDdJU0hnQ09jU3E3VEJSaXhTYVdBTU9jbkJRblpEL0NWeU00?=
 =?utf-8?B?UjFEREthK2xVT3dvL2RrVWdKRURDQytLNzk3WnVjSUU2ZlJMQStjQXdDMGEv?=
 =?utf-8?B?b3ZHcElhRVZCQ0Fyd2NKaXQ1amdvQ0RWR1drQjN3RU9IcDhNVXQ0RkhQZm5u?=
 =?utf-8?B?S202bkVPcmFaQjdyTlFscy9Kc3VMaGcvNlQ2ZkI3ZVpkWnpSUWxMQmQwbU9Q?=
 =?utf-8?B?V1g4Vzd2RklibmY0WUppNzAvaW92Vyt6RHRUMjVyWXEyOUlsWW5sUWJUU2k1?=
 =?utf-8?B?cWJRVzMwakRSTVg5MTdCc1hFd2Y4RWNycWh1SVpIQTJBdVdsK3V5VWd4UXpN?=
 =?utf-8?B?QkI2NTlrM0NlZGZGTGE4V1gyckQzbkVrSXFZdkRwYUpOSXV5cElRVTJ4djFQ?=
 =?utf-8?B?bFFJcGZZb2pSU0JJNGk1WGhTTndyYXBkdG5FQlF0NUVGNjlTMFgrb1FWaFBr?=
 =?utf-8?B?aXBDR2p6ZC9DS1o5OWhsTTd4ZWFhTDk3aTJGcXhWSEVISGdjaVdZOGNuV1BI?=
 =?utf-8?B?bE1UT2RmdDlmTUdUSW1NampxalFFTytoVEVFTnNqdW9RYzNpQjZFbm1FbmF2?=
 =?utf-8?B?SWgrbThRd0ZYSktsY09tNWZ6RkpLZmRhU09Ta2U2Z0RKRXBURnpPWjhRWC9H?=
 =?utf-8?B?YXB5SHIvcHRoc0kzSURaWGt2SlVRTkgzMXpqRmhObUMyUmR3ZVFMMnAzT1hD?=
 =?utf-8?B?eGN4TmRnNVgrNklxSXJ5eFBsQTBqV2sxRDcwTEcwRWI3ZTJWMXR5Nk1qTWNk?=
 =?utf-8?B?N1JlbnlqWkEzSHZsNUJONU1jVVZFM21Kc0pOaWd3ZU85WnRjUjI5MnV1emNG?=
 =?utf-8?B?eFJZZHhBYmZ4eHJabTFMSGFpbHlpYVlmaEFwMFhhaWRuaGFJM3JRT2lrM3h0?=
 =?utf-8?B?MmdycmJuaTdEb2pyUmRBYXBjY2RncUR5RHRQK01oNnVBSTdlM1ErMElEcUlK?=
 =?utf-8?B?Z00yQ3dKd3FuRno4K2Q4MlNhSG5WOExRVnhtWlRxUlUvakIxdkJWMUVQejhr?=
 =?utf-8?B?b3MvMS9XaDBvV1hva1RGNFltNlJhRlJrU0FQWU9yMjdqbG5KZEVXMzBQNnln?=
 =?utf-8?B?V1hDSnlJQkR4cUlHandMYmpnNlBZUjhMSnlrbEk5NUg0eitPeG5KRTQ3MHlB?=
 =?utf-8?B?aWxCcTN2d09PWERHMzFzNW9NeWhYRzVmaWxhMTA0Mk4rc3IwbmlvVytrNVBL?=
 =?utf-8?B?cjE0UlV6MXVzdE5USHREVVVQUFF4UWJHa0FYQ2l4dmVyOFZGcTE2WlZRdncv?=
 =?utf-8?B?eGwrNG9ubVVLMkVvNklIdkpJazdQS1orWVpIa1dXTzhqaG5JbVN0OUcrTkF1?=
 =?utf-8?B?TW5hbGhaNnBIUHA1VnJuSmtCdm1iRS9aK2lxdXlSbWtzeEwrRmcyUHBTcjBU?=
 =?utf-8?B?YVJoYVV1ck8zdjNTZnozRWdEZkZpVG1hSHExSlBxQnh3T2t5eXdLK3FLbVNZ?=
 =?utf-8?B?N3VKOUViVTMrb1lyUmxVY05wcHI4eFE2TzZweGk3RnNBSkdWRm9GV1ZxMVlt?=
 =?utf-8?B?Z2JZaEY3cWFaNm8rd1ZkZEZOQlpHb0UveE9vdEZSWC9Tb2Jiem1oVkIvQzZQ?=
 =?utf-8?Q?SEZ+003l8QIwlIFr6176QMH9A?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 525b2591-d927-48eb-5a6a-08dd08a80871
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2024 14:39:54.5125 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D+i+2/4fFcM+09yHPJtRm9btWSl1hD5XvfWiDXvvCCbrVpB6qOfYWSi57aARJWzFhhdiJGIuvxTJDPH1GbUEIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4558
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

PiBPbiBUdWUsIDE5IE5vdiAyMDI0IGF0IDEwOjU1LCBBcnVuIFIgTXVydGh5IDxhcnVuLnIubXVy
dGh5QGludGVsLmNvbT4NCj4gd3JvdGU6DQo+ID4gVGhlIGNvcnJlc3BvbmRpbmcgbXV0dGVyIGNo
YW5nZXMgdG8gZW5hYmxlL2Rpc2FibGUgaGlzdG9ncmFtLCByZWFkIHRoZQ0KPiA+IGhpc3RvZ3Jh
bSBkYXRhLCBjb21tdW5pY2F0ZSB3aXRoIHRoZSBsaWJyYXJ5IGFuZCB3cml0ZSB0aGUgZW5oYW5j
ZWQNCj4gPiBkYXRhIGJhY2sgdG8gdGhlIEtNRCBpcyBhbHNvIHB1c2hlZCBmb3IgcmV2aWV3IGF0
DQo+ID4gaHR0cHM6Ly9naXRsYWIuZ25vbWUub3JnL0dOT01FL211dHRlci8tL21lcmdlX3JlcXVl
c3RzLzM4NzMNCj4gDQo+IFRoZSBNdXR0ZXIgTVIgeW91IGxpbmtlZCBkb2VzIG5vdCBhY3R1YWxs
eSB3cml0ZSBhbnl0aGluZyBiYWNrIHRvIEtNUy4NCj4gDQoNClllcywgd3JpdGluZyB0aGUgSUVU
IExVVCBkYXRhIGJhY2sgdG8gS01EIHVzaW5nIGEgY3J0YyBibG9iIHByb3BlcnR5IGlzIHBlbmRp
bmcgaW4gbXV0dGVyIGFuZCBpcyBjb21tZW50ZWQgaW4gdGhlIG11dHRlciBNUi4NCg0KVGhhbmtz
IGFuZCBSZWdhcmRzLA0KQXJ1biBSIE11cnRoeQ0KLS0tLS0tLS0tLS0tLS0tLS0tLS0NCg==
