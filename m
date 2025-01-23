Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E12A19D24
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 04:08:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1892610E3CA;
	Thu, 23 Jan 2025 03:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="grMbnyaw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85B6610E26D;
 Thu, 23 Jan 2025 03:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737601632; x=1769137632;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rer8o2cmlpXIx254M+AfWPuyQwrqECaon7Q/0gu68Ow=;
 b=grMbnyawOyaHo0O+It/UGOFAUAhasQqKekbnh3YakZDIplox+ETHuoAL
 wcbQKYIL6ow/rSqIWXUsd51pkkCsPjEI5Nsu3q8CCeokpk1SPZ0U5A+A1
 vLkxGzjwmbvWUAyU+j1nG2xS2CnZBw+1+ILB6lsYfnqLDAwCMU1LaQ2im
 BkFpu6LDs/syVcX/IO77ophJzS9JfnMoDWRkzum8Sv8JLxzmtW8MkTXzF
 xo3pqK94Zbm4pJXPXZUI3vRVElZ4UZqjG2Om/vuGBRnMINJfWS3oLuUJD
 lSIspdailOCcut8wogzB1ToV19VOLmCYK6Bi16VXZ5kmyEPSF3BfCewQ2 A==;
X-CSE-ConnectionGUID: bhcDTDIeRg6gYawzp1cr5A==
X-CSE-MsgGUID: XE1ddlMBRvKpaVMnYUQAxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="41845060"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; d="scan'208";a="41845060"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 19:07:10 -0800
X-CSE-ConnectionGUID: vrpsAapyQhW1jEqYked4uA==
X-CSE-MsgGUID: Rc9pZ/ikSz6qRMi6vpRJyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111975735"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2025 19:06:47 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 22 Jan 2025 19:06:46 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 22 Jan 2025 19:06:46 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 22 Jan 2025 19:06:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b1nFvV2E8JeaIQ5N7laK+JQJy5GYdO42M86255/MtOjE4DsONvZWXwlumN3F74VUzEUXJIIWRDc1o7UntKpkDoMG6nrVjvK0BH9uNDfC8Pc7fgIhUiEvrf+YbaUKWdCxAL1jMBmiZDgWBt3J0rJW1/uV1CZcEZlY+BgwAau5WCL1UAlNBzL+S4uGi7zZavd53rJxjrUp8Y7EVeVogn9Yt+AjTxsUCytw/srckxvo6l95j4v+/IMf8luQ5msr7WTTCXwRIDgyOFUxlH6ps1xvzCN9LoCO7xd9SHRdzIIpjqqZQBmLqxVDXc5/m4hZmM1aviKSxtb7Po/ZRoK9eo9wfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rer8o2cmlpXIx254M+AfWPuyQwrqECaon7Q/0gu68Ow=;
 b=jOi7y4HBbaJtYV1RhKwnGiAtcHQd6ceEtilSNPXBOgWhSGzPbhNY/vXyB6vRc5baJTKole6C3uurqsiezGu8JBFpaleRAIEcUPOJvntUCCW9oE8MkybwST+5/8LITHxQmOuNGdALtrwHFqiVd1yW2bRw3xEWtlLGN9xxV83gYKBo4YvGYCL7b/9ynZ2f/6Ty2JBlISBdE+fIJK4ZRy1tUUw4ul/W8jU82LlCUK+i1G6jymvr/5GVFtmIJsUuIYW2PkDHfpLj4W8ZrL6WzwCZEu1vqdKoiXTmYT16HiWphJYRSZNM9ibeyPwuDbM73AwT6dv0SU9fYXAxSLfl9yIe2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by SA3PR11MB7463.namprd11.prod.outlook.com (2603:10b6:806:304::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Thu, 23 Jan
 2025 03:06:44 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::625b:17f6:495f:7ad]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::625b:17f6:495f:7ad%6]) with mapi id 15.20.8356.020; Thu, 23 Jan 2025
 03:06:44 +0000
From: "Srinivas, Vidya" <vidya.srinivas@intel.com>
To: Brian Geffon <bgeffon@google.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "Wilson, Chris P" <chris.p.wilson@intel.com>, "Saarinen, Jani"
 <jani.saarinen@intel.com>, "Mistat, Tomasz" <tomasz.mistat@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>, Tomasz Figa <tfiga@google.com>
Subject: RE: [PATCH v2] drm/i915: Fix page cleanup on DMA remap failure
Thread-Topic: [PATCH v2] drm/i915: Fix page cleanup on DMA remap failure
Thread-Index: AQHbaC7neG8peSCTkESx6yyEUtSfT7MjtxRw
Date: Thu, 23 Jan 2025 03:06:44 +0000
Message-ID: <PH7PR11MB8252B7BF1D1B6ADE94839F8F89E02@PH7PR11MB8252.namprd11.prod.outlook.com>
References: <20250116155340.533180-1-bgeffon@google.com>
In-Reply-To: <20250116155340.533180-1-bgeffon@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB8252:EE_|SA3PR11MB7463:EE_
x-ms-office365-filtering-correlation-id: c1f6b96d-5dd2-427d-c106-08dd3b5af7a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?c2FRVENPR091a0JRdEdwYjZzWGEydmJFN0c4bVcrTnhLbkNmampKWHNZQVln?=
 =?utf-8?B?SU1TZGp6RmJqMFQ2NW8zWmJ3U2VsWHZMRDhIbFF1UnlvWkF3Vld1MjlSdnly?=
 =?utf-8?B?RUUyMGk5WGJ6S0hnejJnRFVPV2ZkemdyWVJmOXE2d3lNWFA4R200b0FWc2N0?=
 =?utf-8?B?MEJSaFh2YmY2WHJNLzFJVmQzOEJ6dmdWKzdldGlJNFRYVEt1RGVnaE9wTHVQ?=
 =?utf-8?B?aGFWcTI3NEFLQjBReEFSV3JDV2VuV1dsRzlaWGgvSzF1V25vM1NsdGQ5U1pJ?=
 =?utf-8?B?Q0ZRd1JnQjZUWE55c0Vlbld3Qi83NkRmUTJtdCtMUUNkbnozWElabU8vR3gx?=
 =?utf-8?B?K2l1RGNLZFJCbWxCUWFzelk1UFBkYzB3SkRKeXlyQnNXK25JempWdUlCZWtD?=
 =?utf-8?B?RCtwOVMrVVZFZjY2WDRoNVpmWVhBOU5oN1RMZnFqL0xueGxTRkorK2VFZmFt?=
 =?utf-8?B?VFNpaHlOOWM5d29sVnhhb1VPUHBJdnhiZDFhZnh6STdUWVhPeDhmYXRvWGhC?=
 =?utf-8?B?OXNOb0I1d2w3RHJNOHJiUlE3M3FSVmF5ZjZiaFVKS2s0UHJNZlViOHplYVRX?=
 =?utf-8?B?NnNVcndDYkJxdTBoMENEQTBBYlpLa0M0eFZqMmt4dmRockcxSGpFb0RoVHZq?=
 =?utf-8?B?bDNCKzhqa1VpM0FzUEJ5TzlBcmQxdHVuWXJCbW9lZTdQUWROQklGbUJSWkxO?=
 =?utf-8?B?dVBTcVR5RytDU3B4WUcvQzg1ajRzZ244RHpRZXNiZitIcGk4ZTBYdWtqaDJL?=
 =?utf-8?B?N3VCb0pxZVgzeko5eXFtaDF6aG5Wa0VWOHJIWi9FSUVMY2syVmQxYm54Nnln?=
 =?utf-8?B?cnJYc1J6TnNWOUJVRE9Sbnd6cEZ4RjdZWklqaklkY1NZbHA1QkozR1loUWVi?=
 =?utf-8?B?MHlldDJ1QmJXbjNYZWdNWFB3NFFKL0E1TnZUQ2FWQ0Urcll1YWh1Mk42U0Zt?=
 =?utf-8?B?OURxQmpXRXdJK3VEZEg2a25COCtzWUhOay9NOTRNWUVZejZRUlgyeFN1YWI3?=
 =?utf-8?B?VFV4cll6bG45TXk3dDg5MTlTK21nK2ZBOHVrTFcxNVgyM3FTQ0hzaUlNM0Iz?=
 =?utf-8?B?WjFUd3pFN1VlVjVNNFFJblV4MDZpbW9XN0NLdFRMRmhGU0FJSHhvQXBjZFFu?=
 =?utf-8?B?VjIrQSs3NzJBQWgrQzRvTUFkMnpXTDhxVXZVenQ1eXM2VEJQM2hKSE8xWXVw?=
 =?utf-8?B?Y2NUZENjMzlPUjMxNGg5L1ZUZlg5K2hRMkQ2U2hxekxHL1RTK1FFTWJRY1Q3?=
 =?utf-8?B?Wis3YkhYSURDZXNmR3ZPbXh0UURCdEsvUVp0cC9rNXZsaXJNbHBCeWdaWDM4?=
 =?utf-8?B?Z0hlYVBDc1g5cW5lMHF0d2dmN1BYSnVuanErOXJCRU1UMlE3dFR4bUhvNEls?=
 =?utf-8?B?bjBoS04rUGZtTDVlSHdONm5ybUptVmlOUnZ4NHJNdi9QL09XZXZjVjZ2bm1n?=
 =?utf-8?B?REdhbWNpT1JEUUlvNGptOTJnUzhoYVMwSWlST29GVVovT29Sb2dWTjdlVzZn?=
 =?utf-8?B?V3NrZDU2djJxbHU0MDN0dnE5dUFSUG1WWkJVYjN2NTZWbWY4OFdSclNUM0JZ?=
 =?utf-8?B?Z2toYWtENWJBYm5WRUlOMjgwWmlBU1BGamlZaElFN29hdXVvNCs0WFNySDJl?=
 =?utf-8?B?SyswMnhGSXhKOS9GRmh1UnhJclkwMjNYTHBJQUVLV09uZEI1Y3RET2h3K3ov?=
 =?utf-8?B?WVNzaDBJOE9OMzhQTkVBMnhOdDRFK3hHUHFDVjBEMEY2S0VWVzBuZkdTdURR?=
 =?utf-8?B?N1pHQ04xNEd1VUlacTZaNHV3VVFVZXYxNGlsMDN2QVhYaGEra0RWSXI4UTZY?=
 =?utf-8?B?TUJMWnZla3dVMU81ejFxQ2h2ZWlQaDdFSmQ0YzdCYUIrcWdndldIYVVhWVoy?=
 =?utf-8?Q?4Os/QV19AX11Y?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ODUxb2NKdFNLdjlwMll2ekRGYlJIWkRDWTZXY3dodC9rSkVTZnJtNkR3QjIx?=
 =?utf-8?B?N2llbE1LdWZiOFZWKzYzd21WYXhocmVoR3hMRlF0L2ZTSTVrYndiN244WE83?=
 =?utf-8?B?U1RXL1NSbjU5VmZyWFZncmFZY1JHQkVIa0o2bUFUWjVBVTJRRjZDNm8rK3NR?=
 =?utf-8?B?TlVRWG9ITlVUaU5SR3lqbGZyN0ozWmxrNWxaQWFKemNJNzdXRWZiamNHUE1h?=
 =?utf-8?B?aUxIcnNpRktiMUxLQkh0Zk8xR1BLRzd4K1Y3b3JtUm5aN3hzdXFWRDBJZ00x?=
 =?utf-8?B?WWlBZng4akNqb2kwTVh0RnZPZTNvc2ZKRklUaG5rSTk5enMzVk80T3QydWpV?=
 =?utf-8?B?dXliUEphcUgwSmdYVTRiRzlrcitqaEdOMisySDJPTGRHcFFtWUN5OTBmbkEz?=
 =?utf-8?B?bVY4UnpCSHN0RXpKSWgvdEdUOHViejdnMWpMU3h3d1BDcngybHpxNis0OHpx?=
 =?utf-8?B?WDJRUG43aG9ua3V2TVZ2ZGJSaitNbGd3QVpWODlFaFNIT0RiYVoyK0IweWJn?=
 =?utf-8?B?Q3JoNzBjNktDWmdmR2F4Z0x3TVNaRGtLZjZCMmY2a29SOXZWWEZ2a0IrTllI?=
 =?utf-8?B?ZGpxd05XU3BxN1FkYS9LeDBxVkgzdFNjdjdoSFFHN3psVWlXVHVEWU9wcURI?=
 =?utf-8?B?VGgwUjl1UDQ2TG5wakxyeHBDeDJaZ2ppQXQzOXpVcis5aTJwaG9BbWRSMUNn?=
 =?utf-8?B?ZlU3WTUydThCRnJLblA1dXU1UjBxdzdWRTZFZG5aakd1NFVXc0tGUTFjRWNi?=
 =?utf-8?B?ZUpjU044d0l4WlNJUEJTN3BUVzQ3Rjg5QitOaTRtblVsWXNTV0dOckM1NVQ5?=
 =?utf-8?B?eENzTlRNMkZoVTk0MzhiRDN6dUgxaldHWjZ1OWhpRUkxbE1vQS9jVExJZlN3?=
 =?utf-8?B?ZEJSd0Z4WXJFRjlFT21PWDMxdHBzbS8yK0ZiSGQ1anNmRVR5TW9oRjhzdHJa?=
 =?utf-8?B?V05DTlZGTm9CN3RZWDFEYzN1NzlxSG5qVWxmTTBXcU1zZGp3QmJHSUQrc0Rk?=
 =?utf-8?B?bU1QZjZZQkpIdHlQS3oxN3VKbEZUaytiNTlmT1FidE5RSnhuSVhCTEZoM01N?=
 =?utf-8?B?NmZFaHBwUzlQVkREblo5eDBOdDRQTlFvd0poQThOUTFLZHl0MUJ5NkhUc0I1?=
 =?utf-8?B?TlFCYklySFFTelk2dGpyL1ZuU2hNTGlYZEFPK2JRcU14L0ZSa1owT0IrME9E?=
 =?utf-8?B?ZENBL09aZzRzNlVLaFB0VDZ5UGQ4OU1VYW1SM1NIblg1RXFHT20yaTI2VEZ6?=
 =?utf-8?B?aFB4N1B2YURCQ3BwcHpRaC9QRnduUzVhZmozYW1TT2JMLzk3bFVBVElxK1pL?=
 =?utf-8?B?V21SNWx0My9TaTYxL01wV3BraFEzQkJnYUtqNnNuY3d3aTdhN2ZEcmp1K0t3?=
 =?utf-8?B?NWEyMkdHbjg2a2lWQXFHMmdzbk9OUEF5WmdLUkYwOFJwTzIxVGc2MWVoZUdl?=
 =?utf-8?B?QjdVTTZnOUpUbDNBcmRiU095SEdwZ3F1ZGxPYkFJbEhSU0N1VTBEeUdIZU1J?=
 =?utf-8?B?R01tb2pjOTF2a2t4ZUF0L3d6TjV1TDkwU28rR2gvZXFHUDVZNDJZMFJTOGx6?=
 =?utf-8?B?K3NGdDJrM2ZXc1UzWW4xWDY1YjkwSE1GNWZHeDFqKzdPRW90QzF0VmcvWlI3?=
 =?utf-8?B?RWZabU5sdE00b1VkWjdGa0wxVWlLMmVaa1dkTDkyR3hmOEh4U2NNMGR2VUxl?=
 =?utf-8?B?QkNOb1p0WGU5OUFLTlNldk00QXVkQWtYYzV5dE10S21vQ0R5Q1NYMnZZeW5x?=
 =?utf-8?B?UHNXQU5WdWpVa29sYjBKQ2FheitNYmFlYURic2JNYnhMeWFKME1FbUluL295?=
 =?utf-8?B?WWhEbW5ST2I1OTFsR0FpWUxZSFhQWkNTQVRveWNPdWlYSUNGcWpJTFZ3eUJN?=
 =?utf-8?B?MEpnajVhVE9HUGdWQXFpLzUweksveTZaUzR2QkpuQVNlSis0YksvKzh0ZnZi?=
 =?utf-8?B?MTFQdVAvdk56S2RkK1o1aWVmczNSTXFFUGNKWVlzbmx5T0R2enZZU1JkUlIy?=
 =?utf-8?B?Vk83c29Pdk5kaWxaVVJST2lmcnc4Y3ZYZnJOeUc1THMzV1JOYm41V2xFMGRI?=
 =?utf-8?B?VXNqb0VVa1U0SVEzdDU2bG43RDJ2Nys4cjJLdEZWWXNSRUgvL2RJSXZNV1dm?=
 =?utf-8?Q?6yFZ9bJ23GTm0Yr5D9VzU68xq?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1f6b96d-5dd2-427d-c106-08dd3b5af7a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2025 03:06:44.4011 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qvP8VQ733AYzGJh/s8E/HnYgsoNpwAxXib8p7hMTnQ1OPc0xZW5e4g1KZgwglRmti4q/UoREVizv6vzToRFx21eP2b4NxOMIKeSlvMH/djA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7463
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

SGVsbG8gQnJpYW4sIE1hbnkgdGhhbmtzIGZvciB0aGUgZml4LiBJIGFtIGFkZGluZyBteSB0ZXN0
ZWQtYnkuDQpUZXN0ZWQtYnk6IFZpZHlhIFNyaW5pdmFzIDx2aWR5YS5zcmluaXZhc0BpbnRlbC5j
b20+DQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCcmlhbiBHZWZm
b24gPGJnZWZmb25AZ29vZ2xlLmNvbT4NCj4gU2VudDogMTYgSmFudWFyeSAyMDI1IDIxOjI0DQo+
IFRvOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBXaWxzb24sIENocmlz
IFAgPGNocmlzLnAud2lsc29uQGludGVsLmNvbT47IFNhYXJpbmVuLCBKYW5pDQo+IDxqYW5pLnNh
YXJpbmVuQGludGVsLmNvbT47IE1pc3RhdCwgVG9tYXN6IDx0b21hc3oubWlzdGF0QGludGVsLmNv
bT47DQo+IFNyaW5pdmFzLCBWaWR5YSA8dmlkeWEuc3Jpbml2YXNAaW50ZWwuY29tPjsgdmlsbGUu
c3lyamFsYUBsaW51eC5pbnRlbC5jb207DQo+IGphbmkubmlrdWxhQGxpbnV4LmludGVsLmNvbTsg
bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgZHJpLQ0KPiBkZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmc7IEpvb25hcyBMYWh0aW5lbg0KPiA8am9vbmFzLmxhaHRpbmVuQGxpbnV4LmludGVs
LmNvbT47IEJyaWFuIEdlZmZvbiA8YmdlZmZvbkBnb29nbGUuY29tPjsNCj4gc3RhYmxlQHZnZXIu
a2VybmVsLm9yZzsgVG9tYXN6IEZpZ2EgPHRmaWdhQGdvb2dsZS5jb20+DQo+IFN1YmplY3Q6IFtQ
QVRDSCB2Ml0gZHJtL2k5MTU6IEZpeCBwYWdlIGNsZWFudXAgb24gRE1BIHJlbWFwIGZhaWx1cmUN
Cj4gDQo+IFdoZW4gY29udmVydGluZyB0byBmb2xpb3MgdGhlIGNsZWFudXAgcGF0aCBvZiBzaG1l
bV9nZXRfcGFnZXMoKSB3YXMNCj4gbWlzc2VkLiBXaGVuIGEgRE1BIHJlbWFwIGZhaWxzIGFuZCB0
aGUgbWF4IHNlZ21lbnQgc2l6ZSBpcyBncmVhdGVyIHRoYW4NCj4gUEFHRV9TSVpFIGl0IHdpbGwg
YXR0ZW1wdCB0byByZXRyeSB0aGUgcmVtYXAgd2l0aCBhIFBBR0VfU0laRWQgc2VnbWVudCBzaXpl
Lg0KPiBUaGUgY2xlYW51cCBjb2RlIGlzbid0IHByb3Blcmx5IHVzaW5nIHRoZSBmb2xpbyBhcGlz
IGFuZCBhcyBhIHJlc3VsdCBpc24ndA0KPiBoYW5kbGluZyBjb21wb3VuZCBwYWdlcyBjb3JyZWN0
bHkuDQo+IA0KPiB2MSAtPiB2MjoNCj4gICAoVmlsbGUpIEZpeGVkIGxvY2F0aW9ucyB3aGVyZSB3
ZSB3ZXJlIG5vdCBjbGVhcmluZyBtYXBwaW5nIHVuZXZpY3RhYmxlLg0KPiANCj4gQ2M6IHN0YWJs
ZUB2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IFZpbGxlIFN5cmphbGEgPHZpbGxlLnN5cmphbGFAbGlu
dXguaW50ZWwuY29tPg0KPiBDYzogVmlkeWEgU3Jpbml2YXMgPHZpZHlhLnNyaW5pdmFzQGludGVs
LmNvbT4NCj4gTGluazogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pOTE1L2tl
cm5lbC8tL2lzc3Vlcy8xMzQ4Nw0KPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21s
LzIwMjUwMTE2MTM1NjM2LjQxMDE2NC0xLQ0KPiBiZ2VmZm9uQGdvb2dsZS5jb20vDQo+IEZpeGVz
OiAwYjYyYWYyOGYyNDkgKCJpOTE1OiBjb252ZXJ0IHNobWVtX3NnX2ZyZWVfdGFibGUoKSB0byB1
c2UgYQ0KPiBmb2xpb19iYXRjaCIpDQo+IFNpZ25lZC1vZmYtYnk6IEJyaWFuIEdlZmZvbiA8Ymdl
ZmZvbkBnb29nbGUuY29tPg0KPiBTdWdnZXN0ZWQtYnk6IFRvbWFzeiBGaWdhIDx0ZmlnYUBnb29n
bGUuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9vYmpl
Y3QuaCB8ICAzICstLQ0KPiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fc2htZW0u
YyAgfCAyMyArKysrKysrKystLS0tLS0tLS0tLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9n
ZW0vaTkxNV9nZW1fdHRtLmMgICAgfCAgNyArKysrLS0tDQo+ICAzIGZpbGVzIGNoYW5nZWQsIDE0
IGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9vYmplY3QuaA0KPiBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2dlbS9pOTE1X2dlbV9vYmplY3QuaA0KPiBpbmRleCAzZGM2MWNiZDJlMTEuLjBmMTIy
YTEyZDRhNSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2Vt
X29iamVjdC5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9vYmpl
Y3QuaA0KPiBAQCAtODQzLDggKzg0Myw3IEBAIGludCBzaG1lbV9zZ19hbGxvY190YWJsZShzdHJ1
Y3QgZHJtX2k5MTVfcHJpdmF0ZQ0KPiAqaTkxNSwgc3RydWN0IHNnX3RhYmxlICpzdCwNCj4gIAkJ
CSBzaXplX3Qgc2l6ZSwgc3RydWN0IGludGVsX21lbW9yeV9yZWdpb24gKm1yLA0KPiAgCQkJIHN0
cnVjdCBhZGRyZXNzX3NwYWNlICptYXBwaW5nLA0KPiAgCQkJIHVuc2lnbmVkIGludCBtYXhfc2Vn
bWVudCk7DQo+IC12b2lkIHNobWVtX3NnX2ZyZWVfdGFibGUoc3RydWN0IHNnX3RhYmxlICpzdCwg
c3RydWN0IGFkZHJlc3Nfc3BhY2UNCj4gKm1hcHBpbmcsDQo+IC0JCQkgYm9vbCBkaXJ0eSwgYm9v
bCBiYWNrdXApOw0KPiArdm9pZCBzaG1lbV9zZ19mcmVlX3RhYmxlKHN0cnVjdCBzZ190YWJsZSAq
c3QsIGJvb2wgZGlydHksIGJvb2wgYmFja3VwKTsNCj4gIHZvaWQgX19zaG1lbV93cml0ZWJhY2so
c2l6ZV90IHNpemUsIHN0cnVjdCBhZGRyZXNzX3NwYWNlICptYXBwaW5nKTsNCj4gDQo+ICAjaWZk
ZWYgQ09ORklHX01NVV9OT1RJRklFUg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ2VtL2k5MTVfZ2VtX3NobWVtLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkx
NV9nZW1fc2htZW0uYw0KPiBpbmRleCBmZTY5ZjJjODUyN2QuLmIzMjBkOWRmZDZkMyAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3NobWVtLmMNCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3NobWVtLmMNCj4gQEAgLTI5LDE2
ICsyOSwxMyBAQCBzdGF0aWMgdm9pZCBjaGVja19yZWxlYXNlX2ZvbGlvX2JhdGNoKHN0cnVjdA0K
PiBmb2xpb19iYXRjaCAqZmJhdGNoKQ0KPiAgCWNvbmRfcmVzY2hlZCgpOw0KPiAgfQ0KPiANCj4g
LXZvaWQgc2htZW1fc2dfZnJlZV90YWJsZShzdHJ1Y3Qgc2dfdGFibGUgKnN0LCBzdHJ1Y3QgYWRk
cmVzc19zcGFjZQ0KPiAqbWFwcGluZywNCj4gLQkJCSBib29sIGRpcnR5LCBib29sIGJhY2t1cCkN
Cj4gK3ZvaWQgc2htZW1fc2dfZnJlZV90YWJsZShzdHJ1Y3Qgc2dfdGFibGUgKnN0LCBib29sIGRp
cnR5LCBib29sIGJhY2t1cCkNCj4gIHsNCj4gIAlzdHJ1Y3Qgc2d0X2l0ZXIgc2d0X2l0ZXI7DQo+
ICAJc3RydWN0IGZvbGlvX2JhdGNoIGZiYXRjaDsNCj4gIAlzdHJ1Y3QgZm9saW8gKmxhc3QgPSBO
VUxMOw0KPiAgCXN0cnVjdCBwYWdlICpwYWdlOw0KPiANCj4gLQltYXBwaW5nX2NsZWFyX3VuZXZp
Y3RhYmxlKG1hcHBpbmcpOw0KPiAtDQo+ICAJZm9saW9fYmF0Y2hfaW5pdCgmZmJhdGNoKTsNCj4g
IAlmb3JfZWFjaF9zZ3RfcGFnZShwYWdlLCBzZ3RfaXRlciwgc3QpIHsNCj4gIAkJc3RydWN0IGZv
bGlvICpmb2xpbyA9IHBhZ2VfZm9saW8ocGFnZSk7IEBAIC0xODAsMTAgKzE3NywxMA0KPiBAQCBp
bnQgc2htZW1fc2dfYWxsb2NfdGFibGUoc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmk5MTUsIHN0
cnVjdCBzZ190YWJsZQ0KPiAqc3QsDQo+ICAJcmV0dXJuIDA7DQo+ICBlcnJfc2c6DQo+ICAJc2df
bWFya19lbmQoc2cpOw0KPiArCW1hcHBpbmdfY2xlYXJfdW5ldmljdGFibGUobWFwcGluZyk7DQo+
ICAJaWYgKHNnICE9IHN0LT5zZ2wpIHsNCj4gLQkJc2htZW1fc2dfZnJlZV90YWJsZShzdCwgbWFw
cGluZywgZmFsc2UsIGZhbHNlKTsNCj4gKwkJc2htZW1fc2dfZnJlZV90YWJsZShzdCwgZmFsc2Us
IGZhbHNlKTsNCj4gIAl9IGVsc2Ugew0KPiAtCQltYXBwaW5nX2NsZWFyX3VuZXZpY3RhYmxlKG1h
cHBpbmcpOw0KPiAgCQlzZ19mcmVlX3RhYmxlKHN0KTsNCj4gIAl9DQo+IA0KPiBAQCAtMjA5LDgg
KzIwNiw2IEBAIHN0YXRpYyBpbnQgc2htZW1fZ2V0X3BhZ2VzKHN0cnVjdA0KPiBkcm1faTkxNV9n
ZW1fb2JqZWN0ICpvYmopDQo+ICAJc3RydWN0IGFkZHJlc3Nfc3BhY2UgKm1hcHBpbmcgPSBvYmot
PmJhc2UuZmlscC0+Zl9tYXBwaW5nOw0KPiAgCXVuc2lnbmVkIGludCBtYXhfc2VnbWVudCA9IGk5
MTVfc2dfc2VnbWVudF9zaXplKGk5MTUtPmRybS5kZXYpOw0KPiAgCXN0cnVjdCBzZ190YWJsZSAq
c3Q7DQo+IC0Jc3RydWN0IHNndF9pdGVyIHNndF9pdGVyOw0KPiAtCXN0cnVjdCBwYWdlICpwYWdl
Ow0KPiAgCWludCByZXQ7DQo+IA0KPiAgCS8qDQo+IEBAIC0yMzksOSArMjM0LDggQEAgc3RhdGlj
IGludCBzaG1lbV9nZXRfcGFnZXMoc3RydWN0DQo+IGRybV9pOTE1X2dlbV9vYmplY3QgKm9iaikN
Cj4gIAkJICogZm9yIFBBR0VfU0laRSBjaHVua3MgaW5zdGVhZCBtYXkgYmUgaGVscGZ1bC4NCj4g
IAkJICovDQo+ICAJCWlmIChtYXhfc2VnbWVudCA+IFBBR0VfU0laRSkgew0KPiAtCQkJZm9yX2Vh
Y2hfc2d0X3BhZ2UocGFnZSwgc2d0X2l0ZXIsIHN0KQ0KPiAtCQkJCXB1dF9wYWdlKHBhZ2UpOw0K
PiAtCQkJc2dfZnJlZV90YWJsZShzdCk7DQo+ICsJCQkvKiBMZWF2ZSB0aGUgbWFwcGluZyB1bmV2
aWN0YWJsZSB3aGlsZSB3ZSByZXRyeSAqLw0KPiArCQkJc2htZW1fc2dfZnJlZV90YWJsZShzdCwg
ZmFsc2UsIGZhbHNlKTsNCj4gIAkJCWtmcmVlKHN0KTsNCj4gDQo+ICAJCQltYXhfc2VnbWVudCA9
IFBBR0VfU0laRTsNCj4gQEAgLTI2NSw3ICsyNTksOCBAQCBzdGF0aWMgaW50IHNobWVtX2dldF9w
YWdlcyhzdHJ1Y3QNCj4gZHJtX2k5MTVfZ2VtX29iamVjdCAqb2JqKQ0KPiAgCXJldHVybiAwOw0K
PiANCj4gIGVycl9wYWdlczoNCj4gLQlzaG1lbV9zZ19mcmVlX3RhYmxlKHN0LCBtYXBwaW5nLCBm
YWxzZSwgZmFsc2UpOw0KPiArCW1hcHBpbmdfY2xlYXJfdW5ldmljdGFibGUobWFwcGluZyk7DQo+
ICsJc2htZW1fc2dfZnJlZV90YWJsZShzdCwgZmFsc2UsIGZhbHNlKTsNCj4gIAkvKg0KPiAgCSAq
IHNobWVtZnMgZmlyc3QgY2hlY2tzIGlmIHRoZXJlIGlzIGVub3VnaCBtZW1vcnkgdG8gYWxsb2Nh
dGUgdGhlDQo+IHBhZ2UNCj4gIAkgKiBhbmQgcmVwb3J0cyBFTk9TUEMgc2hvdWxkIHRoZXJlIGJl
IGluc3VmZmljaWVudCwgYWxvbmcgd2l0aCB0aGUNCj4gdXN1YWwgQEAgLTQwMiw4ICszOTcsOCBA
QCB2b2lkDQo+IGk5MTVfZ2VtX29iamVjdF9wdXRfcGFnZXNfc2htZW0oc3RydWN0IGRybV9pOTE1
X2dlbV9vYmplY3QgKm9iaiwNCj4gc3RydWN0IHNnXw0KPiAgCWlmIChpOTE1X2dlbV9vYmplY3Rf
bmVlZHNfYml0MTdfc3dpenpsZShvYmopKQ0KPiAgCQlpOTE1X2dlbV9vYmplY3Rfc2F2ZV9iaXRf
MTdfc3dpenpsZShvYmosIHBhZ2VzKTsNCj4gDQo+IC0Jc2htZW1fc2dfZnJlZV90YWJsZShwYWdl
cywgZmlsZV9pbm9kZShvYmotPmJhc2UuZmlscCktPmlfbWFwcGluZywNCj4gLQkJCSAgICBvYmot
Pm1tLmRpcnR5LCBvYmotPm1tLm1hZHYgPT0NCj4gSTkxNV9NQURWX1dJTExORUVEKTsNCj4gKwlt
YXBwaW5nX2NsZWFyX3VuZXZpY3RhYmxlKGZpbGVfaW5vZGUob2JqLT5iYXNlLmZpbHApLT5pX21h
cHBpbmcpOw0KPiArCXNobWVtX3NnX2ZyZWVfdGFibGUocGFnZXMsIG9iai0+bW0uZGlydHksIG9i
ai0+bW0ubWFkdiA9PQ0KPiArSTkxNV9NQURWX1dJTExORUVEKTsNCj4gIAlrZnJlZShwYWdlcyk7
DQo+ICAJb2JqLT5tbS5kaXJ0eSA9IGZhbHNlOw0KPiAgfQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3R0bS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ2VtL2k5MTVfZ2VtX3R0bS5jDQo+IGluZGV4IDEwZDg2NzM2NDFmNy4uMzdmNTFhMDRiODM4
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fdHRtLmMN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3R0bS5jDQo+IEBAIC0y
MzIsNyArMjMyLDggQEAgc3RhdGljIGludCBpOTE1X3R0bV90dF9zaG1lbV9wb3B1bGF0ZShzdHJ1
Y3QNCj4gdHRtX2RldmljZSAqYmRldiwNCj4gIAlyZXR1cm4gMDsNCj4gDQo+ICBlcnJfZnJlZV9z
dDoNCj4gLQlzaG1lbV9zZ19mcmVlX3RhYmxlKHN0LCBmaWxwLT5mX21hcHBpbmcsIGZhbHNlLCBm
YWxzZSk7DQo+ICsJbWFwcGluZ19jbGVhcl91bmV2aWN0YWJsZShmaWxwLT5mX21hcHBpbmcpOw0K
PiArCXNobWVtX3NnX2ZyZWVfdGFibGUoc3QsIGZhbHNlLCBmYWxzZSk7DQo+IA0KPiAgCXJldHVy
biBlcnI7DQo+ICB9DQo+IEBAIC0yNDMsOCArMjQ0LDggQEAgc3RhdGljIHZvaWQgaTkxNV90dG1f
dHRfc2htZW1fdW5wb3B1bGF0ZShzdHJ1Y3QNCj4gdHRtX3R0ICp0dG0pDQo+ICAJYm9vbCBiYWNr
dXAgPSB0dG0tPnBhZ2VfZmxhZ3MgJiBUVE1fVFRfRkxBR19TV0FQUEVEOw0KPiAgCXN0cnVjdCBz
Z190YWJsZSAqc3QgPSAmaTkxNV90dC0+Y2FjaGVkX3JzZ3QudGFibGU7DQo+IA0KPiAtCXNobWVt
X3NnX2ZyZWVfdGFibGUoc3QsIGZpbGVfaW5vZGUoaTkxNV90dC0+ZmlscCktPmlfbWFwcGluZywN
Cj4gLQkJCSAgICBiYWNrdXAsIGJhY2t1cCk7DQo+ICsJbWFwcGluZ19jbGVhcl91bmV2aWN0YWJs
ZShmaWxlX2lub2RlKGk5MTVfdHQtPmZpbHApLT5pX21hcHBpbmcpOw0KPiArCXNobWVtX3NnX2Zy
ZWVfdGFibGUoc3QsIGJhY2t1cCwgYmFja3VwKTsNCj4gIH0NCj4gDQo+ICBzdGF0aWMgdm9pZCBp
OTE1X3R0bV90dF9yZWxlYXNlKHN0cnVjdCBrcmVmICpyZWYpDQo+IC0tDQo+IDIuNDguMC5yYzIu
Mjc5LmcxZGU0MGVkYWRlLWdvb2cNCg0K
