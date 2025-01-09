Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA87BA07FDF
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 19:37:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4685710EF05;
	Thu,  9 Jan 2025 18:37:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mkUNGTU/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B305710EF00;
 Thu,  9 Jan 2025 18:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736447819; x=1767983819;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uS6rbZuZc6KSA0g5aX5aLPxP5FpQZRw/yA7wEtNOa+k=;
 b=mkUNGTU/ZUT4lnZSokT0XVt2XNChhZuJWE9aEteXdu2XuoriZ+P+ZRzY
 LN8dE7ag3/dGdhONMtFlU045MNb0R5G543jkzGbcdyv5UdJv90OZKDkxi
 +T8S5arNIjFBrdROLcPUdo34pOeob8+rve8IOl1lK7djIo45i8/goGbrS
 /IKcjtVojm0P4klrZahGTLFQxSE/ZOI3R6y0qSaL9HHJO2Hogp3HZZTpz
 nuUFXIVKfeloRuuUuqMlERHp6cZztiHqoi/4P9YexoUIht2KCA6ZaZzBM
 z/VBdWSQvzsCfvxG5UC+sQOUu5xGm/ekgq097faoExCDZ2ptM1qjaMM/U Q==;
X-CSE-ConnectionGUID: VZldXpQrQmW+T6O+dW2QGQ==
X-CSE-MsgGUID: PkDeTrLzROysfdBDMNgfew==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="39549458"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="39549458"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 10:36:58 -0800
X-CSE-ConnectionGUID: Ae4QEQDATFy4j5HImlP2RQ==
X-CSE-MsgGUID: 6OxhUFaOQ4WNd0R09F0W5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="103293060"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2025 10:36:58 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 9 Jan 2025 10:36:57 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 9 Jan 2025 10:36:57 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 9 Jan 2025 10:36:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QP/0a9ne+dB49Ww7PMNuv16yvapeuC8XleAARAldCUgN9SfDyzJtpY7dOSRktz73ReiRLr8vnjqO0tzRMEBkhmJfJu0pdrzzgBkVsnGLomcnBvNjLND5L6yowYqzE1FpE/jKvdJ7Hm1XMOljU3d+2tIJjQfTIrs7pxPmEerSGb6cPazVCM8YGehDQfCUQLxNZ8p2SJfy6Yv9d6SMGU/NSdPfe1ykQVJlsYEt3dpWBvR2hbspClWqgX6Gsp3G2FhYVZqToILDlG+mmmPoSPBCA4CNFmqiVXAhS0T/xdO0whZbxiBgHrtdOrjipYnVzzrXPEFSzpLTkE8MzSzQZC7fjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GpoWh/nLRTksSa7EBmvSumUBiqLTkoLzUks6osknt5g=;
 b=hnRphlZVjNxA+jbkzBkunbZufrtBhBv58/5Cwc2vCkazi/21omLZoe4Bgi17w7EQlZaUpx/2C43XyYSn+XL4h2pRulBorMIrTrHur6sJO2zwtTGRRIjYviIgXicxshS/ZR54SeJx75Xyi8I1B7f1AQJ5zDYN0ARNgIdnNE3wYTxi87e59HPeOIiMDQBtr2w1i+rQ5P+bVsZHCmPk09BgiJCAt0IpRa5sn0IDvtplX212qsmB9ecsLmgm5XOW5AZzEHGIJ2HThpwcQMmnJ0eAd4t3lgyioatcFX3a0uni1FKgizb5CJPXqhBWqyQtNtMgdMhXwIhPzLtpRm5uDgMljQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by CH3PR11MB7203.namprd11.prod.outlook.com (2603:10b6:610:148::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Thu, 9 Jan
 2025 18:36:54 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%4]) with mapi id 15.20.8335.011; Thu, 9 Jan 2025
 18:36:54 +0000
Message-ID: <8d216107-9130-4485-987c-eb634f96a4fd@intel.com>
Date: Thu, 9 Jan 2025 10:36:52 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH V2] drm/xe/guc: Use exec queue hints for GT frequency
To: "Souza, Jose" <jose.souza@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Upadhyay, Tejas"
 <tejas.upadhyay@intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Nilawar, Badal" <badal.nilawar@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Mrozek, Michal" <michal.mrozek@intel.com>,
 "Morek, Szymon" <szymon.morek@intel.com>
References: <20250109120705.3021126-1-tejas.upadhyay@intel.com>
 <41039dc4f84500cbd4a784ffd5a96b1fd6ffa7a2.camel@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <41039dc4f84500cbd4a784ffd5a96b1fd6ffa7a2.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0203.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::28) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|CH3PR11MB7203:EE_
X-MS-Office365-Filtering-Correlation-Id: 63049e7a-4c0d-4f1f-7b52-08dd30dc9737
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SCtTS0o5YmJwR0hYOHBnTzc1MTI3K3B6eTNpMUVGajlVcjFwdVVMdWlQS2hF?=
 =?utf-8?B?RkI5S1JzTlBJa1ZTOXVDZHIySm1ZYU1lRkRwblN1RDFPZll1V3ZZKzg0cDRU?=
 =?utf-8?B?aXhyRHZ4WGlhaGJWak9ob1dXOEo1dnFQOENpREFNaEdNS1JlTms4eUFnRWJQ?=
 =?utf-8?B?MG12Skd6YVV1VFVZYjN1MDlWeW53Sy9KSU8wOFdEb04xU2NLUVNxc2dpazgx?=
 =?utf-8?B?VGhZSTFPVjdFcEw5ZzJ2KzU4cXdKb0ZoWnorTkVlZDVtVnEvL1poMjN0V3VC?=
 =?utf-8?B?Tlp4UDliWmh4dE5FR2pwc2NEVjNqSlIrNEE4M3hFQi9nL28weFFTT2FUL2ZI?=
 =?utf-8?B?MGlBZld4T2xiRk9iOFRCOFYwcEpXTjl6NkFQdkN0ekZhZFZHcXo1NGViS0FF?=
 =?utf-8?B?cWRORGxzdGtsZVlsWG9LeGdZVWoweHFGNG8xdGdxSkVVT0c3c0pZdUxoM0Vl?=
 =?utf-8?B?TGlNdkxqVmptVWN2N2E1RW5pVHdZZ2RFZlVVNTNpNmZQbWN6WjFtTlNuSWhr?=
 =?utf-8?B?aGVzbzJDZFFLUEhGV2xuN1BZbzgweWoxYnRvTlpGUEZBZHVwMTRsR0MyN3c5?=
 =?utf-8?B?TWU5NTNDa3FxRDg4RHBIU21CTjFiYlFTNVpyUkxob0V3YlFRZDJROXptT3RL?=
 =?utf-8?B?VkFZekJycFZ0L25yQ042c2lIMytrUmZXbURSaFQ2dmdoZkpKdjlMWlFuL3Ar?=
 =?utf-8?B?STFmU2ZGcHhuK1o2eEtoa0pmVk9VM3J3NDVheFhORjRPWGlUTEdFRDFBZjUz?=
 =?utf-8?B?U2NkbzF2L0xxMCs0Sm5TZDZ4dEtWcFRUTmdHT2J2Y3JWbis1RVV1NHo0aGV1?=
 =?utf-8?B?L3RuTU9Hd05IYmVxbzQzRm9yVnVLby93dFJqV1FOa3JBNWF5SnZVdnB6L0pD?=
 =?utf-8?B?bkFzWUY2Z0orR2xKSXdrS0pla2JGcTFNbkhnL0pVd3VvS3dsWWVLdW1tQzM4?=
 =?utf-8?B?UGVQQjhsbHJwYjNBVnFWQjFJcnlhakM1VFk3MkxWOERwY1hSaWk3dFJDZ3Rt?=
 =?utf-8?B?ZTBvUnVZRUUzZTA4WHY1a0NMTXJidk9LcWlJaXZtT3JVRGUzTEhvdjJac1cy?=
 =?utf-8?B?ZzZmVnNiWXNCUkh5dXJJeFR1SzAvQysxVGRlUkc3Rnh6bWUxa3J6MC9zSWtt?=
 =?utf-8?B?YkFMRlA2TnBHQTBKRFhxUGkyNmllSHgwZVpjWnJMcUpBc0JZbDV0ZW9VYk5l?=
 =?utf-8?B?WGhYOSsrQzF4YVFTcHlyN2xzMHUybDVxMG1mUUxncllqQTQvTVo3Q0RpOUYy?=
 =?utf-8?B?WWRNQWVJcnc1cVByTDBqNC8wNzZEQTJQR1VvNnVYZGhEVWhGK0VzM1ZVbDdl?=
 =?utf-8?B?VFBoWmNPazNHNmhPcDRuMU1EbXdYZnEyTVhXdjRvdmdCNWlaL01rcVNNUDVP?=
 =?utf-8?B?RG84YmhHazFkNm9HUittSVc1Zmc2VnlzSCszVjVQMUV2QVBWMG5hTjcySlR4?=
 =?utf-8?B?eTRvbUU3T1RLdmhlMEIzM2pzaHNwUWc4VURrblZKMFRnbmcyaGRzblFpcXBS?=
 =?utf-8?B?VEtmVmVNQVIxS3dpU2k5LzAxdHpDNXprNTB0QlpTSGVQM2xkZjh5Q1hpN3lj?=
 =?utf-8?B?U2dPMGNGUWZuOUFWbDY1SCtlSFRUVEZtNm5lay8xLzNKV0dZVllJdXErbzh4?=
 =?utf-8?B?N0xqZjdjWm5peVA3MTVDdjMxQUZ3QTJjdGtUeVVyaHF3ODRYaG5uS0hvV0xW?=
 =?utf-8?B?L1pRUm1jMTNnTzVHbk5CTS90YzNQVlMrdUZ1dGVKQU9vRUV0Vy9ZYnZrZFRF?=
 =?utf-8?Q?Z96usmYZzQQft+sHfRMiXEYtV9Iiy07uoX0+BMJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ME84TklXMTJEVHVxRWFjSzZQVjZIb1hod3FPTU9qUExRQkZmd202NENaUGtI?=
 =?utf-8?B?V2IvRVJ6ckxjaERuaTVHSkY0TkFQQVFzVXE1STNhdjJPNU02eVRTanBHSFVD?=
 =?utf-8?B?TXJuOXVCS0swcXdxZFBRNXVhcUNRQy9TblFVV3Y0UlNkYmdhdEs1NWIxaHlq?=
 =?utf-8?B?ay9yUFpYVDNkWnlTTkdrNmhSS21mNnBjdHVmcDlhcndBakx4VHdGMEc2WTli?=
 =?utf-8?B?ays1WE10R1UvVHFrczFOUFd5Wmc0YUROUk5TRThWcGU5S093dDVTSmduS3o2?=
 =?utf-8?B?VUpTc1AzQUZib3NySnlSMWVObVd2YXhZaUlReUZ4UWVqUGI4TDlhY2pHZUVa?=
 =?utf-8?B?YTFLRG4veVNGVjQxUDVsVEcxNzgzbzhoMkpGYk91QU03VlppcTQ1RVhFemww?=
 =?utf-8?B?ZEVCUEgvZkVTTFZCVzVGdThtaFdtbE9SVWNnRktWZGtQTkpMMnhVZmFENmVw?=
 =?utf-8?B?TTN6MzdWbEJNZHBEa1d5TkFjRk1Xd0gzMC9nOXJKdVhzU3RhTzhTNXAwUC9m?=
 =?utf-8?B?YzhoN0VFc3M0bVFnV1R5b0d4WDBRWjlzRjdFSngvTU9lMzVlbUJxQ3pnUGFp?=
 =?utf-8?B?TVBETkdzVUlFNnZSSVlYZURBNG1vYlVzWUNkelQweitPTnBpejdpZ2diR1NU?=
 =?utf-8?B?YlcxL1RGNkFIZVB6UnU0TzcvQStUbDYyR1FKc2hSSDNsb3RDYlpUUG8xMEZj?=
 =?utf-8?B?UGsrZFBSNUtsYkJ6VzhZMCtJYWF3TUcwS2ZHa3dGUUNybUdZd20xZ1hPMnZR?=
 =?utf-8?B?Z0YxNmoyeTlUQzdlK0VnbHp0a2theXdaV0IxZGlLWDJya1lQQkUwSzdOUEUv?=
 =?utf-8?B?cmIxa2xvZWxuNkx1cGwyd3BKZnNYQm1TNmpxcTlwSk80aFBvaFdKdFk2Um03?=
 =?utf-8?B?U1lwM3kzTC9xRVZ6a0NBZGNobWw4Z1BJWUo5MTB3VFV4ajhNdkh4K240V09k?=
 =?utf-8?B?QWgrMjd2azRFWGg0cFBza2JNU1FxbFE5R0lUcXJ6dHBybm5nWnFHclkxUmFL?=
 =?utf-8?B?VXpTajQ0RURzc2w0VFBPTHdrOFBEbWlKNVZ2eEdrVFAvUHluWTIybmk4ZzNh?=
 =?utf-8?B?cHlMOUhqam9ZbEVsRzJmMWxzdkdEbkY1a2xNT3J1ellaMU5HcTZTMVFWbnBE?=
 =?utf-8?B?clplN3ZtRDlrdVlFZUFmTlJOcGNGMEkrK1ZFQTRjbnU3S0xIVXp6WjRBeGFU?=
 =?utf-8?B?NEZZbHFkRHpRa2VxYSt5L2NOeEVKUUlLUWZqT3N6WlFkTUVVenBIb2JZYjZh?=
 =?utf-8?B?Qkx3cDREZG5BcGFMeUZlSDNqV3hCZjkzQ0tCV3VsK1p1VXIrTFRuY0RyUHlD?=
 =?utf-8?B?eE4wNGYzL2J4WnNGUXh3eVhTbGdlZndJdkM1bi83TjIwY0pTZ3Z2bDhyZkhW?=
 =?utf-8?B?MUJYakVrOUtudzhxdnl0WG04Q25LSFlrZHVMNktpc3d1dE5zRndLeE9mbHBP?=
 =?utf-8?B?YmtRd05haFhzc0NMMnJvR0hWUyt5bjQvS0UxYWRVU2Z1dUZnaklHdVlOU1cy?=
 =?utf-8?B?M0p6dGJYOVhFaVRKcFdKRzNsVTR6TzZQb1pDKzBIK0NrNXdsVGc1V29JenU5?=
 =?utf-8?B?TmFVa2FFN25ObmEwNHNXY2UydFpVZ3JVUzM2TE1nZnppM09DSG0xTlhabTl5?=
 =?utf-8?B?bDNlWHdnaSszUlpPTnJ4TThEVEdYbW9HUWc1VENlNitLUlRKRUxTYWNnVkl1?=
 =?utf-8?B?OHk4RXZzVFY1QVZSOUEvYm9NTm5JcXNqRUhtbGhDcERBa3I1ZE4wcXcvL0M1?=
 =?utf-8?B?ZTdFSzhZQUhYZkQwd3gvbFhxN1k3L1p5Y055bytxK2JNNjN1cmVqZkJsMzF3?=
 =?utf-8?B?endueFNzQ3BKb1NMREZ4Y1poZHVDZE1aMk01Y01uQ0VBNVNsdFFLSm0wM1Nj?=
 =?utf-8?B?cm5uREhUUFdmejNLOGZHTndPd2VpM1F4eittb01xWThsTnlLbEVxZmxSRHcw?=
 =?utf-8?B?RlhQYU5jdmZaV21lSDlKK3JUblR5bEwvYzA4MlpkbTl4WDRYcmdYNkJ4ZlNj?=
 =?utf-8?B?S2NXUmJWK2dPNkFoVmkzQ0JSOEIycnR1MGIrTEJ3V1dFL1A4clpOdzR1em1N?=
 =?utf-8?B?WjRFZGN1dnBwNEdYN0lUV21XM3RFL09CSVVEZ0xMMVNSbnlZaHg5M0huT3Vj?=
 =?utf-8?B?V0VvVG1lUnV3c0NuOGxCMW13RGNOQ2ErRms3YVJ3ZjIydmhGK0oyS0FuYStv?=
 =?utf-8?B?RFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63049e7a-4c0d-4f1f-7b52-08dd30dc9737
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 18:36:54.6092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MWTB7MSmWJ94Au4k/FvQmI4AE8Ib/QCP/iG/LRyIDLPpSF9+LWi/24a3DspfE30RVyNQTwa8eLvQcPMPXYAmDCtuEaquQxB/ck316UQVdYc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7203
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


On 1/9/2025 6:36 AM, Souza, Jose wrote:
> On Thu, 2025-01-09 at 17:37 +0530, Tejas Upadhyay wrote:
>> Allow user to provide a low latency hint per exec queue. When set,
>> KMD sends a hint to GuC which results in special handling for this
>> exec queue. SLPC will ramp the GT frequency aggressively every time
>> it switches to this exec queue.
Clearer to say context instead of exec queue.
>>
>> We need to enable the use of SLPC Compute strategy during init, but
>> it will apply only to exec queues that set this bit during exec queue
>> creation.
>>
>> Improvement with this approach as below:
>>
>> Before,
>>
>> :~$ NEOReadDebugKeys=1 EnableDirectSubmission=0 clpeak --kernel-latency
>> Platform: Intel(R) OpenCL Graphics
>>    Device: Intel(R) Graphics [0xe20b]
>>      Driver version  : 24.52.0 (Linux x64)
>>      Compute units   : 160
>>      Clock frequency : 2850 MHz
>>      Kernel launch latency : 283.16 us
>>
>> After,
>>
>> :~$ NEOReadDebugKeys=1 EnableDirectSubmission=0 clpeak --kernel-latency
>> Platform: Intel(R) OpenCL Graphics
>>    Device: Intel(R) Graphics [0xe20b]
>>      Driver version  : 24.52.0 (Linux x64)
>>      Compute units   : 160
>>      Clock frequency : 2850 MHz
>>
>>      Kernel launch latency : 63.38 us
>>
>> UMD will indicate low latency hint with flag as mentioned below,
>>
>> *     struct drm_xe_exec_queue_create exec_queue_create = {
>> *          .flags = DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT or 0
>> *          .extensions = 0,
>> *          .vm_id = vm,
>> *          .num_bb_per_exec = 1,
>> *          .num_eng_per_bb = 1,
>> *          .instances = to_user_pointer(&instance),
>> *     };
>> *     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);
>>
>> Link to UMD PR : https://github.com/intel/compute-runtime/pull/794
>>
>> Note: There is outstanding issue on guc side to be not able to switch to max
>> frequency as per strategy indicated by KMD, so for experminet/test result
>> hardcoding apporch was taken and passed to guc as policy. Effort on debugging
>> from guc side is going on in parallel.
I verified this works fine. Seems like there was some issue with an 
older GuC version.
>>
>> V2:
>>    - DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT 1 is already planned for other hint(Szymon)
>>    - Add motivation to description (Lucas)
>>
>> Cc:dri-devel@lists.freedesktop.org
>> Cc:vinay.belgaumkar@intel.com
>> Cc:Michal Mrozek <michal.mrozek@intel.com>
>> Cc:Szymon Morek <szymon.morek@intel.com>
>> Cc:José Roberto de Souza <jose.souza@intel.com>
>> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h |  3 +++
>>   drivers/gpu/drm/xe/xe_exec_queue.c            |  7 ++++---
>>   drivers/gpu/drm/xe/xe_guc_pc.c                | 16 ++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_submit.c            |  7 +++++++
>>   include/uapi/drm/xe_drm.h                     |  3 ++-
>>   5 files changed, 32 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
>> index 85abe4f09ae2..c50075b8270f 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
>> @@ -174,6 +174,9 @@ struct slpc_task_state_data {
>>   	};
>>   } __packed;
>>   
>> +#define SLPC_EXEC_QUEUE_FREQ_REQ_IS_COMPUTE	REG_BIT(28)
>> +#define SLPC_OPTIMIZED_STRATEGY_COMPUTE		REG_BIT(0)
>> +
>>   struct slpc_shared_data_header {
>>   	/* Total size in bytes of this shared buffer. */
>>   	u32 size;
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index 8948f50ee58f..7747ba6c4bb8 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -553,7 +553,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>>   	u32 len;
>>   	int err;
>>   
>> -	if (XE_IOCTL_DBG(xe, args->flags) ||
>> +	if (XE_IOCTL_DBG(xe, args->flags &&
>> +			 !(args->flags & DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT)) ||
As mentioned in the comments, we need flags separate for external API 
and internally. i915 implementation has this - 
https://patchwork.freedesktop.org/series/130698/.
>>   	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>>   		return -EINVAL;
>>   
>> @@ -578,7 +579,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>>   
>>   		for_each_tile(tile, xe, id) {
>>   			struct xe_exec_queue *new;
>> -			u32 flags = EXEC_QUEUE_FLAG_VM;
>> +			u32 flags = args->flags | EXEC_QUEUE_FLAG_VM;
>>   
>>   			if (id)
>>   				flags |= EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD;
>> @@ -626,7 +627,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>>   		}
>>   
>>   		q = xe_exec_queue_create(xe, vm, logical_mask,
>> -					 args->width, hwe, 0,
>> +					 args->width, hwe, args->flags,
>>   					 args->extensions);
>>   		up_read(&vm->lock);
>>   		xe_vm_put(vm);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index df7f130fb663..ff0b98ccf1a7 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -992,6 +992,19 @@ static int pc_init_freqs(struct xe_guc_pc *pc)
>>   	return ret;
>>   }
>>   
>> +static int xe_guc_pc_set_strategy(struct xe_guc_pc *pc, u32 val)
>> +{
>> +	int ret = 0;
>> +
>> +	xe_pm_runtime_get(pc_to_xe(pc));
We are already holding fwake from caller, no need to get runtime ref. 
Maybe just assert if we don't have it?
>> +	ret = pc_action_set_param(pc,
>> +				  SLPC_PARAM_STRATEGIES,
>> +				  val);
>> +	xe_pm_runtime_put(pc_to_xe(pc));
>> +
>> +	return ret;
>> +}
>> +
>>   /**
>>    * xe_guc_pc_start - Start GuC's Power Conservation component
>>    * @pc: Xe_GuC_PC instance
>> @@ -1052,6 +1065,9 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>>   
>>   	ret = pc_action_setup_gucrc(pc, GUCRC_FIRMWARE_CONTROL);
>>   
>> +	/* Enable SLPC Optimized Strategy for compute */
>> +	xe_guc_pc_set_strategy(pc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
better to check the ret here.
>> +
>>   out:
>>   	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   	return ret;
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 9c36329fe857..88a1987ac360 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -15,6 +15,7 @@
>>   #include <drm/drm_managed.h>
>>   
>>   #include "abi/guc_actions_abi.h"
>> +#include "abi/guc_actions_slpc_abi.h"
>>   #include "abi/guc_klvs_abi.h"
>>   #include "regs/xe_lrc_layout.h"
>>   #include "xe_assert.h"
>> @@ -400,6 +401,7 @@ static void __guc_exec_queue_policy_add_##func(struct exec_queue_policy *policy,
>>   MAKE_EXEC_QUEUE_POLICY_ADD(execution_quantum, EXECUTION_QUANTUM)
>>   MAKE_EXEC_QUEUE_POLICY_ADD(preemption_timeout, PREEMPTION_TIMEOUT)
>>   MAKE_EXEC_QUEUE_POLICY_ADD(priority, SCHEDULING_PRIORITY)
>> +MAKE_EXEC_QUEUE_POLICY_ADD(slpc_ctx_freq_req, SLPM_GT_FREQUENCY)
>>   #undef MAKE_EXEC_QUEUE_POLICY_ADD
>>   
>>   static const int xe_exec_queue_prio_to_guc[] = {
>> @@ -414,14 +416,19 @@ static void init_policies(struct xe_guc *guc, struct xe_exec_queue *q)
>>   	struct exec_queue_policy policy;
>>   	enum xe_exec_queue_priority prio = q->sched_props.priority;
>>   	u32 timeslice_us = q->sched_props.timeslice_us;
>> +	u32 slpc_ctx_freq_req = 0;
>>   	u32 preempt_timeout_us = q->sched_props.preempt_timeout_us;
>>   
>>   	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
>>   
>> +	if (q->flags & DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT)
>> +		slpc_ctx_freq_req |= SLPC_EXEC_QUEUE_FREQ_REQ_IS_COMPUTE;
>> +
>>   	__guc_exec_queue_policy_start_klv(&policy, q->guc->id);
>>   	__guc_exec_queue_policy_add_priority(&policy, xe_exec_queue_prio_to_guc[prio]);
>>   	__guc_exec_queue_policy_add_execution_quantum(&policy, timeslice_us);
>>   	__guc_exec_queue_policy_add_preemption_timeout(&policy, preempt_timeout_us);
>> +	__guc_exec_queue_policy_add_slpc_ctx_freq_req(&policy, slpc_ctx_freq_req);
>>   
>>   	xe_guc_ct_send(&guc->ct, (u32 *)&policy.h2g,
>>   		       __guc_exec_queue_policy_action_size(&policy), 0, 0);
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index f62689ca861a..bd0150d2200c 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -1097,6 +1097,7 @@ struct drm_xe_vm_bind {
>>    *         .engine_class = DRM_XE_ENGINE_CLASS_RENDER,
>>    *     };
>>    *     struct drm_xe_exec_queue_create exec_queue_create = {
>> + *          .flags = DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT or 0
>>    *          .extensions = 0,
>>    *          .vm_id = vm,
>>    *          .num_bb_per_exec = 1,
>> @@ -1110,7 +1111,6 @@ struct drm_xe_exec_queue_create {
>>   #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
>>   #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
>>   #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
>> -
>>   	/** @extensions: Pointer to the first extension struct, if any */
>>   	__u64 extensions;
>>   
>> @@ -1123,6 +1123,7 @@ struct drm_xe_exec_queue_create {
>>   	/** @vm_id: VM to use for this exec queue */
>>   	__u32 vm_id;
>>   
>> +#define DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT	(0x1 << 1)
> we need a way to know if the KMD version running supports it or not.
> I think a bit on drm_xe_query_config would do the job.

Yes, the i915 implementation has this - 
https://patchwork.freedesktop.org/series/130698/. We need something 
similar here.

Thanks,

Vinay.

>
>>   	/** @flags: MBZ */
>>   	__u32 flags;
>>   
