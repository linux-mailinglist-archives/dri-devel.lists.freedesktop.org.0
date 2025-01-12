Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35168A0A77D
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2025 08:59:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30D4810E2D3;
	Sun, 12 Jan 2025 07:59:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F91Ixyre";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A49510E234;
 Sun, 12 Jan 2025 07:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736668767; x=1768204767;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7WBX7vWXp9wqjd4YsggjFGJrKKgLjYxgJkEqeIkSsmI=;
 b=F91Ixyre7XxBT0KHW9+fAFyj6LjLSpwd0pLgoOya2ftfydVVpLJE4Lwq
 SNLbMtQey8eZyFufktEIUOu/6iY/9mV+LaPDbGoy4qw0SBvg1vSwFKuTA
 ZL4Mm1SSWZRSsQBdSYtqsiauRdPBetL71HDiNd3wxBTtOCZMTKt53dggh
 eRHWwLwyz+j83GFHAGfRYCGZh+ac6EYNIkWCLlf9XkkEQLLROypw0/Yfv
 +riyLUqjrUkhBAEhhuBM+t8pqMnAw3ZXMiop+ZazFKvH+JjjQOj3mLzrX
 FY60HSwbqxrMHDJdbXez6qWfrg7NAKfNsd+bDP4US4AExVTo4gbBsPkzr g==;
X-CSE-ConnectionGUID: cucOBmI2SjKepjQV2b7Jmw==
X-CSE-MsgGUID: tw4sjpWZR2eDLRfGBpuhCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="40853351"
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; d="scan'208";a="40853351"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2025 23:59:26 -0800
X-CSE-ConnectionGUID: BSfQob/1Qlq5H2Mn136BaQ==
X-CSE-MsgGUID: R1XoXxxzTG6F4QKzT2ib2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; d="scan'208";a="104642429"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jan 2025 23:59:25 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sat, 11 Jan 2025 23:59:25 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sat, 11 Jan 2025 23:59:25 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sat, 11 Jan 2025 23:59:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OW5mwtVnnhu8wcxgu7Zh7od/5U2XpFgIg7iHY45ItR/kHWLUrjsJ1olfrdfQ8g3KWORW5laCaeCwjjjjQtb8ru9YKqrQTMUr156NGR9HTS/ND+Ko9owxKXK+9IFP/VlbmvrdH69l+e5IzSbO+XtpAkeCH6QbqWETJqbB1nQEIew/p8F6cvipWsfiTqLTEUBP0oAHp/Jdo0sGraKtbk7d4W3rUOzGmkuqNJMVWuWqHpFM755u4k8ZuMmhKw+XrTMMEkGUEVnJvaoWIrWeP1lHnr89Ir8xzNvhX9Xn5sQiBoVjcGcqt7SXVo9unRJYhNNPx1yVcldIS+GrnGqrd2zF5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7WBX7vWXp9wqjd4YsggjFGJrKKgLjYxgJkEqeIkSsmI=;
 b=kesCSUPBX2UaBWf9Z5w/84XpnCBStOg3CzscAEVXAq1dQpvEdw0We4bsniuZvxrZhGyeiCGfuLU0fczYRZ1s+WC80mNHw6BbWW0pxCxJVMD2hKvZ1vA6XUGkgOwTpqmLPDxQ02haYnZMEQlTCkiZGtcNSRETHd6PRfPNVZHxJ9xRhHHH21nF9hurNG6s4iZ1cihKdWxEzKsnhM2W98Ou4cHt3EN+8bkqKWOzlaLPeIzH2g993sLS50x0LW8NED9if7eH+6Z38JGlP2HBJIHzdgtI1k6hP5PzMPdGTa1FDZI8emBob7R1dK6yP5dKZD8Z2umJ0x7sXwnRYvTFTUk1wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by PH0PR11MB7521.namprd11.prod.outlook.com (2603:10b6:510:283::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Sun, 12 Jan
 2025 07:59:13 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%4]) with mapi id 15.20.8335.015; Sun, 12 Jan 2025
 07:59:13 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCH v3 1/5] drm/plane: Add new plane property IN_FORMATS_ASYNC
Thread-Topic: [PATCH v3 1/5] drm/plane: Add new plane property IN_FORMATS_ASYNC
Thread-Index: AQHbYZG0Oa3LolHGVUepAD+9hpgqx7MSkvAA
Date: Sun, 12 Jan 2025 07:59:13 +0000
Message-ID: <SJ1PR11MB61292EA1EF93BB7B78EAAD45B91E2@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250108-asyn-v3-0-f4399635eec9@intel.com>
 <20250108-asyn-v3-1-f4399635eec9@intel.com>
In-Reply-To: <20250108-asyn-v3-1-f4399635eec9@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|PH0PR11MB7521:EE_
x-ms-office365-filtering-correlation-id: 5bbb8f02-9c28-4088-0971-08dd32df0147
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Y0pvMEtQS0FGNTRWVWFkTHMxUTZmdXhJNXhqWk13dUEwMmREMklKdWV1SGRO?=
 =?utf-8?B?YitXMFdNMEcvTXpoSW44VitwS2NqZ3lMTmRLN3F3VlBkMEFRS0hHd1pVbWxq?=
 =?utf-8?B?bkpMN2dib0tqY2FtaUF1QVVpOXgwL2toZExKcDJTVkZObWVZdkl1b21wSWFT?=
 =?utf-8?B?ZW94NnpWZ3J6S1BRTUo2RE5kRWtHSER0TkFwN1F0bkpvUHFMeVRxblY1MUhS?=
 =?utf-8?B?aTlZWS9IUytJVm96TmJMR1EwRDhEQ1gxaUROc3lyb29BWjYyd084Vi96c0Yz?=
 =?utf-8?B?Q042NzM3MUhMbkRFdlF0QlRNMVBlVW1JNGZrN3ZySWp1VjVOVVBFMXRWWjFF?=
 =?utf-8?B?LzJkbGwwRjFrL3VobFNteWpMbW5oZWJUUXB4MkxIWWU2UnRYZHNtR1BibFVP?=
 =?utf-8?B?N0J0R1VxdUtyVFZUQ3Q4MTlla0lmSkdOM2hRR3JUS0hMQnRWSTdSaVgyVTI2?=
 =?utf-8?B?akdCZUpyZmlhV2Joa2YrTlBPS054cE1EM0tWUWdQcUJlSmlUdFcrNHl6djNw?=
 =?utf-8?B?NTloSzNkdW5LUjJJbWd1bmJBd2gzdWlkc1piS2pGcFRuamVENjJvSVdMbGMy?=
 =?utf-8?B?WllOTHRPZUN0V3RNRkFXNmQ5bnVtWm9YM0M0U29GR002NVBPWGtrVEJ5Q2dD?=
 =?utf-8?B?TUlSMFR2cWRFYitPd2htU002M3VJNkppbTdhU1BtNEZYTXJDWi9LaFNTZm9Q?=
 =?utf-8?B?S1RZelV6WW9FK1RPdFJ2YkRDemZNVzRBSGdYQzBpRFhHTStpS3Q2a1lzU1Nu?=
 =?utf-8?B?aGkzckt1L21oeXVkaHVYbnRNQUh3aTA4WUdhT0thZmtUNVJVRWk2ZXVSYllR?=
 =?utf-8?B?NUFWd1BtUDQwOHlyU2hjbG1veFE4QW1icXdnc24yMXNyM1A0SjhMTjRKYzNI?=
 =?utf-8?B?QmFVZjNoMHZZWkdRL00wamVuZ2VvVWRzMXhTYjg0aTBBRThhTlFOb1JuaWE4?=
 =?utf-8?B?Q2o4ajQ0YXc4WmdrdDNuNG9jMzRWa0hkdzNmSmRyUC8rRXQydEIrYkpPVmxp?=
 =?utf-8?B?bjJwcHFXQkRjeHRSbGpjVVRobmdrMnhLNE5BZ1k5a0UvcGdaQVhTS1EyQVdJ?=
 =?utf-8?B?UUVIblBlWHR0N3F0eExUb01lajJLTldMMUJCQThLVDUwLytrTWJQSzVXOWFp?=
 =?utf-8?B?NmRxV0NCeWlhYzd1TVJNcndQdUpaNk56bkh1SjlkblVxZUovWFFweWFuYXg1?=
 =?utf-8?B?VVVkTEFqWlhWM1lQMHRkQko4b0lwb1dZT09RMTBNUUhnN1d3bzFmenJzSTk2?=
 =?utf-8?B?ZEhhdEVQV2FISHhZdGY2c3dlQ0hTZDU4Tmt2LzhUd1gzWkc3Nmp4NkRWT1dB?=
 =?utf-8?B?R1FWZEtSZ211SGE3WDlNUXI0QVlPbk9xYUhWNE1SMGpSd3haOGZmMFc1OG02?=
 =?utf-8?B?TDJVNG9KejRxbWJzME81dzc1ZCtvV2wvRVlkanpOWnVGMlVyUG15RzMwQ3dR?=
 =?utf-8?B?c1J6Y0Y5RjhseFppaU5YaGRnY2Z0Y3lvRFVDQ1U2ak03SEFKZTR1N0lHUGJk?=
 =?utf-8?B?bHU5emt4NlFLMmpoUmg2SlJjSTJBdVU0cG53VHdzeHU3Vit4UFZpZGVNendO?=
 =?utf-8?B?ZEpBU2Y3UGZtVDBtNFRMcXBleTVKRnBVZmljSDhjL1BHaXFleGgxOHVieWZW?=
 =?utf-8?B?SVIzOTJRNHhFYmI3ejFnOXE5cFVYY1RjeTczZEZ1T3E4elpZSHJpSEhwbnZk?=
 =?utf-8?B?bjV2ZzgyaTNNZmRKV0dPYWpidk92RGRTeTFVWitaSWwyMEp2eTRBaitUUjdv?=
 =?utf-8?B?UjRGRDlKNkdSYUZiUlZHK3ZkaWU1QXBudlBlR2hZbTlibWxLRCtGdmIzNkVV?=
 =?utf-8?B?aytPczdJZ0J2bEFaZFlZS3RITFNmZzlWclZLOTM5cXRQdTB2ZWNUdWdYWE1i?=
 =?utf-8?B?L1FFVFRyTUx2RnUraS9rRFhBMlFGa0VJWGxSbmd1T0NDOG9Pb2Rjc1Rzc0g4?=
 =?utf-8?Q?HfQSygrYVfS6AcllOnJO2RwLAYxwWh6X?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RXdLclpVZyt4UHo2RVE3dlB5ZytPZUwyN2NkZkhPcXNqVWJXaGlGcVhOQzhz?=
 =?utf-8?B?d2pMVTUyY3lzOFM3akRMcElTNkJpODBEcHNSK3J0bHljMFpFMUVrQlVlYmpr?=
 =?utf-8?B?S2UrTEFOUUxvQ2dobnZsOHZoR1VwWkRsMWFKck9CQlNQZjRmRm9LSkwvMnVF?=
 =?utf-8?B?Yk1IamY1SG5ZSHZGKzdZYkRYeWhwYXVOMWtOM2lHNG5mdEVoaXlXSkFyd1R5?=
 =?utf-8?B?UVR1R2FlVDdFUEM2Q1U4Nml1RTNjL3J3U1BKKzJvcVZ1dmNsaWtFa1d0L1pu?=
 =?utf-8?B?RGdpT3ZzUzR4ZGx5NW01OWloNHprd3duWG53ZFMxcENjc2VPajdMT2ZGcXRF?=
 =?utf-8?B?VDlWT0FRTFg4eStYVzlhOW9iUE5qeXJaMHk3TFJKKy9obXkyKzMyUjdtTGdG?=
 =?utf-8?B?dUxtL2p1Y3pRdVAxT1c5N3Nwbk1BelhmT24vbVZVblhoOGRZNmVRRVNaYzRL?=
 =?utf-8?B?VzRGZ2x2RDV6N083QmhuNXAwVEEvK2hRR3ZabTgwd0ZZNFZSZk9taDdFRG9y?=
 =?utf-8?B?c1VQL1BHUHN2QmFRdkpVZnNtMGp5Y3htc3prdGxhbHA3MjAzV05VazNONHIx?=
 =?utf-8?B?UHp5b1NJK2JmcHNqTG12blJNdUt4bU53dzhUZjBvc1M1ZCt2NkJsd0FQb2xo?=
 =?utf-8?B?WENGOWJaOXpvWDlyQTA0NHJHU05xREJpMHA0TUN5Ukp6ZTNaNy9EcXJWWTBC?=
 =?utf-8?B?VG9mNnBkZkl1OTg1amhjQzE3MU5ub0o2UHM3QUNLWlBZVEZLVVFCVk5FbGxN?=
 =?utf-8?B?M1FBVnB5Vy9FZTBUYkN2ckloQmpRNWpucTd1bXFISExHSDdvYTk2aEhwaVRp?=
 =?utf-8?B?ZXlkM2liUGRUK3BCL0ZZVzlCNTh6Mys2VnVLcEt3SmVVbGVyQUxpdG5xeUJ1?=
 =?utf-8?B?dHBOck4wZjU3eDN2N0dQWm11V1ZXSzJTY0pIeDJSRXdydHZIeG03ZmtjOXoz?=
 =?utf-8?B?bUtCb2JBRHUwY1hDanBTTzRmY0U4WC9hdEExMndiRks5eHR4VEpUaVB6bzlw?=
 =?utf-8?B?U0xoSzJiQllOWnVoSCs2V3NubGlhaDVEY1NlVEwrQ1hnVldaU1JHcnR3WUZm?=
 =?utf-8?B?a1VuS21KZDZ0ODU3aTdaTVp1b3MrUk53cGpGekdGTmIzWVBYa3RYUUZQdS83?=
 =?utf-8?B?cCs4R3N3UkkxVlFVYjVZM0Jmbi9UdUlzUm93dzA5MjhvZXRqSXFaZFhIT3I5?=
 =?utf-8?B?cjUxbE1XK3ZmS05hL2VWSlNJWHpHVlNXRmk1VWo5LzBndDdNdy9pM1phUndE?=
 =?utf-8?B?US9lU2U0d3F0em0wUm85VmhHbWxHd2FIK1FGa1BkYjZ4WnhwZ1VSdjg4MFo4?=
 =?utf-8?B?a0dYdm1qRWFuK3Bxb3Z4N2VsM0V0ZUIxQXREZHNCREkvcTYrTUZXRFN0R0ZZ?=
 =?utf-8?B?ekdkSGxDSEdTS0U2Q0thUU02MlBvY1Q0S1AybGxHaUtZaGdobU5yVXp4aS9q?=
 =?utf-8?B?U0tpSUNXNmNzOHBZSjlTR00yUmI2RjNIUEhRbXgrWjhZSk1nYkc3WlhjODVk?=
 =?utf-8?B?T0ovVldzWnNjaDlPeURMNXhva0s4RDBVKzZQL1FFcEh5clF3STZZSStsdHI5?=
 =?utf-8?B?MDlsbWpYT2FCMUFTb2FXSWl1VXBjMmRGZnVXZDYycW5pOGZoeHBJc3ZUSG5T?=
 =?utf-8?B?OWM2Z3hZUnR5OGpGYmlTd3BNMzdGaDlsYy81d3hEaS9OUmlkRUtidGh5dFRE?=
 =?utf-8?B?TWRUeGdjUVY0RlJqWUNIdmc5NnFsWUFZYVJ1NGdtRStXMTNRK2tBbzJ1bFBU?=
 =?utf-8?B?NTlLVzZpOFNVd0JLQXdhbThRc3NnbTEvTzJvTUYvUDZuMWJ5MVl0dE5VWTU4?=
 =?utf-8?B?L081Mk16WkhkOHBRV2NrTUpQaGtYUk9xRjEvaU5UQnBOQmNFeHU0QkxoYTBN?=
 =?utf-8?B?TGNrelA4anRUQWRtMm1KWFZucGpKMkg3VjBpZFFiS2c3VzJCWEp6OHh5UTlo?=
 =?utf-8?B?T2lqUlJuNDFCTEtCdXZVRmFzekZhSTE0Q2xxcDZDeDFQU042cFU1L3lTRnhq?=
 =?utf-8?B?M0JsZDNiRHRHZERid3dMNDVUNlkrSWVZa1c2QWExM3cwZnpad1dIZEl0QXIz?=
 =?utf-8?B?N2kyMkJwanl0SjJNenB3L2FBc2tDUDdneUJWOXNEcXRXWDhUSHhhQmYvRVQ1?=
 =?utf-8?B?SGphcWMvY0xtbjNjS1paa2ttdHcwWENoMjIvOG1oVWU4b05zaDZ6YjJCODFm?=
 =?utf-8?B?TFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bbb8f02-9c28-4088-0971-08dd32df0147
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2025 07:59:13.6608 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F2oEmiIfGTh3LWENPoIFUC/EZ5wY7Z5Fw4DF9WuGYVMnQijxp9RObrZZLQy/cX/XGXaiZq3Me+KSsGqoS0FxiAyX8Cj9/GUt97RCpuiFBoo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7521
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogZHJpLWRldmVsIDxkcmkt
ZGV2ZWwtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPiBBcnVu
IFIgTXVydGh5DQo+IFNlbnQ6IFdlZG5lc2RheSwgSmFudWFyeSA4LCAyMDI1IDExOjA5IEFNDQo+
IFRvOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnOyBpbnRlbC0NCj4geGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBN
dXJ0aHksIEFydW4gUiA8YXJ1bi5yLm11cnRoeUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRD
SCB2MyAxLzVdIGRybS9wbGFuZTogQWRkIG5ldyBwbGFuZSBwcm9wZXJ0eQ0KPiBJTl9GT1JNQVRT
X0FTWU5DDQo+IA0KPiBUaGVyZSBleGlzdHMgYSBwcm9wZXJ0eSBJTl9GT1JNQVRTIHdoaWNoIGV4
cG9zZXMgdGhlIHBsYW5lIHN1cHBvcnRlZA0KPiBtb2RpZmllcnMvZm9ybWF0cyB0byB0aGUgdXNl
ci4gSW4gc29tZSBwbGF0Zm9ybXMgd2hlbiBhc3luY2hyb25vdXMgZmxpcHMgYXJlDQo+IHVzZWQg
YWxsIG9mIG1vZGlmaWVycy9mb3JtYXRzIG1lbnRpb25lZCBpbiBJTl9GT1JNQVRTIGFyZSBub3Qg
c3VwcG9ydGVkLg0KPiBUaGlzIHBhdGNoIGFkZHMgYSBuZXcgcGxhbmUgcHJvcGVydHkgSU5fRk9S
TUFUU19BU1lOQyB0byBleHBvc2UgdGhlDQo+IGFzeW5jIGZsaXBzIHN1cHBvcnRlZCBtb2RpZmll
cnMvZm9ybWF0cyBzbyB0aGF0IHVzZXIgY2FuIHVzZSB0aGlzIGluZm9ybWF0aW9uDQo+IGFoZWFk
IGFuZCBkb25lIGZsaXBzIHdpdGggdW5zdXBwb3J0ZWQgZm9ybWF0cy9tb2RpZmllcnMuIFRoaXMg
d2lsbCBzYXZlIGZsaXBzDQo+IGZhaWx1cmVzLg0KDQpzL2RvbmUvZG8NCnMvdW5zdXBwb3J0ZWQv
c3VwcG9ydGVkDQpzL2ZsaXBzL2ZsaXANCg0KPiBBZGQgYSBuZXcgZnVuY3Rpb24gcG9pbnRlciBz
aW1pbGFyIHRvIGZvcm1hdF9tb2Rfc3VwcG9ydGVkIHNwZWNpZmljYWxseSBmb3INCj4gYXN5bmNo
cm9ub3VzIGZsaXBzLg0KPiANCj4gdjI6IFJlbW92ZSBhc3luYyB2YXJpYWJsZSBmcm9tIGRybV9w
bGFuZSAoVmlsbGUpDQo+IHYzOiBBZGQgbmV3IGZ1bmN0aW9uIHBvaW50ZXIgZm9yIGFzeW5jIChW
aWxsZSkNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFydW4gUiBNdXJ0aHkgPGFydW4uci5tdXJ0aHlA
aW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZV9jb25maWcuYyB8
ICA3ICsrKysrKysNCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fcGxhbmUuYyAgICAgICB8ICA2ICsr
KysrKw0KPiAgaW5jbHVkZS9kcm0vZHJtX21vZGVfY29uZmlnLmggICAgIHwgIDYgKysrKysrDQo+
ICBpbmNsdWRlL2RybS9kcm1fcGxhbmUuaCAgICAgICAgICAgfCAyMCArKysrKysrKysrKysrKysr
KysrKw0KPiAgNCBmaWxlcyBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9tb2RlX2NvbmZpZy5jDQo+IGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9tb2RlX2NvbmZpZy5jDQo+IGluZGV4DQo+IDg2NDJhMmZiMjVhOTAxMTZkYWI5NzVh
YTBhYjZiNTFkZWFmYjRiOTYuLmRiYmVmMjA3NTNmODM0YTg1YWU5ZGVkDQo+IDc0OGNmZjJiM2Yw
ZTg1MDQzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVfY29uZmlnLmMN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9tb2RlX2NvbmZpZy5jDQo+IEBAIC0zODgsNiAr
Mzg4LDEzIEBAIHN0YXRpYyBpbnQNCj4gZHJtX21vZGVfY3JlYXRlX3N0YW5kYXJkX3Byb3BlcnRp
ZXMoc3RydWN0IGRybV9kZXZpY2UgKmRldikNCj4gIAkJcmV0dXJuIC1FTk9NRU07DQo+ICAJZGV2
LT5tb2RlX2NvbmZpZy5zaXplX2hpbnRzX3Byb3BlcnR5ID0gcHJvcDsNCj4gDQo+ICsJcHJvcCA9
IGRybV9wcm9wZXJ0eV9jcmVhdGUoZGV2LA0KPiArCQkJCSAgIERSTV9NT0RFX1BST1BfSU1NVVRB
QkxFIHwNCj4gRFJNX01PREVfUFJPUF9CTE9CLA0KPiArCQkJCSAgICJJTl9GT1JNQVRTX0FTWU5D
IiwgMCk7DQo+ICsJaWYgKCFwcm9wKQ0KPiArCQlyZXR1cm4gLUVOT01FTTsNCj4gKwlkZXYtPm1v
ZGVfY29uZmlnLmFzeW5jX21vZGlmaWVyc19wcm9wZXJ0eSA9IHByb3A7DQo+ICsNCj4gIAlyZXR1
cm4gMDsNCj4gIH0NCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5l
LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMNCj4gaW5kZXgNCj4gYTI4YjIyZmRkN2E0
MWFjYTgyZDA5N2Q0MjIzNzg1MWRhOWEwYTc5Yi4uNDE2ODE4ZTU0Y2NmZmNmM2QzYWFkYTI3DQo+
IDIzZTk2Y2U4Y2NmMWRkOTcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGxh
bmUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMNCj4gQEAgLTE0MSw2ICsx
NDEsMTIgQEANCj4gICAqICAgICB2YXJpb3VzIGJ1Z3MgaW4gdGhpcyBhcmVhIHdpdGggaW5jb25z
aXN0ZW5jaWVzIGJldHdlZW4gdGhlIGNhcGFiaWxpdHkNCj4gICAqICAgICBmbGFnIGFuZCBwZXIt
cGxhbmUgcHJvcGVydGllcy4NCj4gICAqDQo+ICsgKiBJTl9GT1JNQVRTX0FTWU5DOg0KPiArICog
ICAgIEJsb2IgcHJvcGVydHkgd2hpY2ggY29udGFpbnMgdGhlIHNldCBvZiBidWZmZXIgZm9ybWF0
IGFuZCBtb2RpZmllcg0KPiArICogICAgIHBhaXJzIHN1cHBvcnRlZCBieSB0aGlzIHBsYW5lIGZv
ciBhc3luY2hyb25vdXMgZmxpcHMuIFRoZSBibG9iIGlzIGEgc3RydWN0DQo+ICsgKiAgICAgZHJt
X2Zvcm1hdF9tb2RpZmllcl9ibG9iLiBXaXRob3V0IHRoaXMgcHJvcGVydHkgdGhlIHBsYW5lIGRv
ZXNuJ3QNCj4gKyAqICAgICBzdXBwb3J0IGJ1ZmZlcnMgd2l0aCBtb2RpZmllcnMuIFVzZXJzcGFj
ZSBjYW5ub3QgY2hhbmdlIHRoaXMgcHJvcGVydHkuDQo+ICsgKg0KDQpJIHRoaW5rIHdlIHNob3Vs
ZCBtZW50aW9uIGhlcmUgdGhhdCB0aGUgYWJzZW5jZSBvZiB0aGlzIHByb3BlcnR5IHdvdWxkIG1l
YW4gdGhhdCBhbGwgZm9ybWF0IG1vZGlmaWVyIHBhaXIgaW4gSU5fRk9STUFUUyBhcmUgYWxzbyBz
dXBwb3J0ZWQgZm9yIGFzeW5jIGZsaXBzLg0KVGhhdCB3YXkgdGhlIHVBUEkgcmVtYWlucyBiYWNr
d2FyZCBjb21wYXRpYmxlLg0KDQo+ICAgKiBTSVpFX0hJTlRTOg0KPiAgICogICAgIEJsb2IgcHJv
cGVydHkgd2hpY2ggY29udGFpbnMgdGhlIHNldCBvZiByZWNvbW1lbmRlZCBwbGFuZSBzaXplDQo+
ICAgKiAgICAgd2hpY2ggY2FuIHVzZWQgZm9yIHNpbXBsZSAiY3Vyc29yIGxpa2UiIHVzZSBjYXNl
cyAoZWcuIG5vIHNjYWxpbmcpLg0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX21vZGVf
Y29uZmlnLmgNCj4gYi9pbmNsdWRlL2RybS9kcm1fbW9kZV9jb25maWcuaCBpbmRleA0KPiAyNzE3
NjVlMmU5ZjJkYTYyYWFmMGQyNTg4MjhlZjQxOTZlMTQ4MjJlLi4wYzExNmQ2ZGZkMjc3MjYyYjFh
NGMwZjANCj4gOTdmY2UyZDcxOWY0Mzg0NCAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJt
X21vZGVfY29uZmlnLmgNCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX21vZGVfY29uZmlnLmgNCj4g
QEAgLTkzNiw2ICs5MzYsMTIgQEAgc3RydWN0IGRybV9tb2RlX2NvbmZpZyB7DQo+ICAJICovDQo+
ICAJc3RydWN0IGRybV9wcm9wZXJ0eSAqbW9kaWZpZXJzX3Byb3BlcnR5Ow0KPiANCj4gKwkvKioN
Cj4gKwkgKiBAYXN5bmNfbW9kaWZpZXJzX3Byb3BlcnR5OiBQbGFuZSBwcm9wZXJ0eSB0byBsaXN0
IHN1cHBvcnQNCj4gbW9kaWZpZXIvZm9ybWF0DQo+ICsJICogY29tYmluYXRpb24gZm9yIGFzeW5j
aHJvbm91cyBmbGlwcy4NCj4gKwkgKi8NCj4gKwlzdHJ1Y3QgZHJtX3Byb3BlcnR5ICphc3luY19t
b2RpZmllcnNfcHJvcGVydHk7DQo+ICsNCj4gIAkvKioNCj4gIAkgKiBAc2l6ZV9oaW50c19wcm9w
ZXJ0eTogUGxhbmUgU0laRV9ISU5UUyBwcm9wZXJ0eS4NCj4gIAkgKi8NCj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvZHJtL2RybV9wbGFuZS5oIGIvaW5jbHVkZS9kcm0vZHJtX3BsYW5lLmggaW5kZXgN
Cj4gZGQ3MThjNjJhYzMxYmYxNjYwNmYzZWU5ZjAyNWE1YjE3MWNkMWU2Ny4uZTg3NDllNmZjM2Jj
MGFjZmM3M2JiZDg0MA0KPiAxZjg1YzMxMjZlODY3NTkgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUv
ZHJtL2RybV9wbGFuZS5oDQo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9wbGFuZS5oDQo+IEBAIC01
NDksNiArNTQ5LDI2IEBAIHN0cnVjdCBkcm1fcGxhbmVfZnVuY3Mgew0KPiAgCSAqLw0KPiAgCWJv
b2wgKCpmb3JtYXRfbW9kX3N1cHBvcnRlZCkoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsIHVpbnQz
Ml90DQo+IGZvcm1hdCwNCj4gIAkJCQkgICAgIHVpbnQ2NF90IG1vZGlmaWVyKTsNCj4gKwkvKioN
Cj4gKwkgKiBAZm9ybWF0X21vZF9zdXBwb3J0ZWRfYXN5bmM6DQo+ICsJICoNCj4gKwkgKiBUaGlz
IG9wdGlvbmFsIGhvb2sgaXMgdXNlZCBmb3IgdGhlIERSTSB0byBkZXRlcm1pbmUgaWYgZm9yDQo+
ICsJICogYXN5Y2hyb25vdXMgZmxpcCB0aGUgZ2l2ZW4gZm9ybWF0L21vZGlmaWVyIGNvbWJpbmF0
aW9uIGlzIHZhbGlkIGZvcg0KPiArCSAqIHRoZSBwbGFuZS4gVGhpcyBhbGxvd3MgdGhlIERSTSB0
byBnZW5lcmF0ZSB0aGUgY29ycmVjdCBmb3JtYXQNCj4gKwkgKiBiaXRtYXNrICh3aGljaCBmb3Jt
YXRzIGFwcGx5IHRvIHdoaWNoIG1vZGlmaWVyKSwgYW5kIHRvIHZhbGlkYXRlDQo+ICsJICogbW9k
aWZpZXJzIGF0IGF0b21pY19jaGVjayB0aW1lLg0KPiArCSAqDQo+ICsJICogSWYgbm90IHByZXNl
bnQsIHRoZW4gYW55IG1vZGlmaWVyIGluIHRoZSBwbGFuZSdzIG1vZGlmaWVyDQo+ICsJICogbGlz
dCBpcyBhbGxvd2VkIHdpdGggYW55IG9mIHRoZSBwbGFuZSdzIGZvcm1hdHMuDQo+ICsJICoNCg0K
V2Ugc3RpbGwgaGF2ZSB0byBob25vciB0aGUgSU5fRk9STUFUUyBwcm9wZXJ0eSwgcmlnaHQ/DQoN
Cj4gKwkgKiBSZXR1cm5zOg0KPiArCSAqDQo+ICsJICogVHJ1ZSBpZiB0aGUgZ2l2ZW4gbW9kaWZp
ZXIgaXMgdmFsaWQgZm9yIHRoYXQgZm9ybWF0IG9uIHRoZSBwbGFuZS4NCj4gKwkgKiBGYWxzZSBv
dGhlcndpc2UuDQo+ICsJICovDQo+ICsJYm9vbCAoKmZvcm1hdF9tb2Rfc3VwcG9ydGVkX2FzeW5j
KShzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwNCj4gKwkJCQkJICAgdWludDMyX3QgZm9ybWF0LCB1
aW50NjRfdCBtb2RpZmllcik7DQo+ICsNCj4gIH07DQo+IA0KDQpTb21lIHRob3VnaHRzIGFmdGVy
IGdvaW5nIHRocm91Z2ggYWxsIHRoZSBwYXRjaGVzLiBUaGVyZSBpcyBhIGJpdCBvZiBhbWJpZ3Vp
dHkgaG93IGEgZHJpdmVyIGNhbiBoYW5kbGUgdGhlIElOX0ZPUk1BVFNfQVNZTkMgcHJvcGVydHkg
aW4gY2FzZXMgd2hlcmUgdGhlcmUgYXJlIG5vIHNwZWNpZmljIHJlc3RyaWN0aW9ucyBpbiBmb3Jt
YXQgbW9kaWZpZXIgcGFpcnMgZm9yIGFzeW5jLg0KDQpUd28gYXBwcm9hY2hlcyBoZXJlLg0KDQox
LiBUaGUgZHJpdmVyIHNob3VsZCBub3QgZXhwb3NlIHRoZSBwcm9wZXJ0eSBhdCBhbGwuDQoyLiBU
aGUgZHJpdmVyIHNob3VsZCBmaWxsIHVwIElOX0ZPUk1BVFNfQVNZTkMgYmxvYiB0aGF0IGluZGlj
YXRlcyB0aGF0IGFsbCBmb3JtYXQgbW9kaWZpZXIgcGFpciBzdXBwb3J0ZWQgZm9yIHN5bmMgYXJl
IGFsc28gc3VwcG9ydGVkIGZvciBhc3luYyBmbGlwcy4NCg0KQXBwcm9hY2ggMSBzZWVtcyB0byBi
ZSBiZXR0ZXIgZm9yIGJhY2t3YXJkIGNvbXBhdGliaWxpdHkuIElmIHdlIGZvbGxvdyBhcHByb2Fj
aCAyLCB3ZSBkbyBub3QgbmVlZCB0byBleHBvc2UgdGhlIGZ1bmN0aW9uIGNyZWF0ZV9pbl9mb3Jt
YXRzX2Jsb2IoKSBhbmQgaXQgY2FuIGJlIGhhbmRsZWQgdGhyb3VnaCB0aGUgZm9ybWF0X21vZF9z
dXBwb3J0ZWRfYXN5bmMoKSBmdW5jdGlvbiBpbnRlcm5hbGx5IGR1cmluZyBwbGFuZSBpbml0aWFs
aXphdGlvbi4NCg0KRWl0aGVyIHdheSB0aGUgZG9jdW1lbnRhdGlvbiBzaG91bGQgYmUgbWFkZSBj
bGVhciB3aGF0IHdlIGV4cGVjdCBmcm9tIHRoZSB1c2Vyc3BhY2UuDQoNClJlZ2FyZHMNCg0KQ2hh
aXRhbnlhDQoNCj4gIC8qKg0KPiANCj4gLS0NCj4gMi4yNS4xDQoNCg==
