Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0815A9124CC
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 14:09:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36FE610F16F;
	Fri, 21 Jun 2024 12:09:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lzmPjPwr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DBB010F167;
 Fri, 21 Jun 2024 12:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718971741; x=1750507741;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=35R7SgH6IhRYn99ypBpd2rPe7FRPUQFwMD17LCsXpmU=;
 b=lzmPjPwrAPx+Byt12sIJ50WUBu0a5AbIza8kRL/VdUg/MNbR2wfrlUb1
 bUqKt9M0b3CAeORSH/nmbWY08gexPInc99rQtL8MN79uw+oki9J6LoOCe
 6V1eZ8J7tz8F15/povIqj0wuxIMugdmW38CXdXjyT5mB517ZEZSi3o256
 wdBKZgHd36oDZakGkycHf8MgEmtl4Yg00vhDU5Hno2F+pBtm29nZwCvRH
 zveHy3MLPFWw68x7H/gFVXLqSsFKs37ZZ5F5vUZWW/1H4u9Oc9X5vNdZi
 UufdAWh/xKi51njYc0tnsUUqabi1K1qT9iWCJENAwtUPTcD5qRn2dMOko A==;
X-CSE-ConnectionGUID: /jti9AchSRaMDfm5dUtVDQ==
X-CSE-MsgGUID: KaizViTdS26jzgUsG3KXeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="33544350"
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; d="scan'208";a="33544350"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 05:09:00 -0700
X-CSE-ConnectionGUID: Q+hW9xA8Q/ugT7BqSFIyYQ==
X-CSE-MsgGUID: UmogygXbSHau6Gl2Si8YLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; d="scan'208";a="47096125"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Jun 2024 05:09:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 21 Jun 2024 05:08:59 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 21 Jun 2024 05:08:59 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 21 Jun 2024 05:08:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ModF2pxs5jGDozRHkAU/4DdC4fRyp+3XbvLIglRZXUguEqvG+hiLfMjtnYh7JzCR7iOhzMln6y+/ZzjYFjlIegy7zlZUhwoHR4C8miIzckMODaZ3CDoyldOsBrIfmOpoFa+QgwfL8aygBSe59zLQgJMeKbB2ERq5vbE2jlrXcnZ7vzcamUWgsYsqirBSq3jF3eI7KbXaoT5TfnMAszRC2OYBSRj7/C4FErItayyB2nTdv4PDuceUKwmGFYQoM9DFTIjaah7vMVWTOzsVOurWlA82DVS/a7Y13S7gJzd7mW6Ckyw5Ef2/5ByrSCff+MC/T6RZ+TnBYcc8d32kFqU6tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KNtWkd9otOGLK6b0MxV0UmvFaTdwQ9ih3Nhc0xrcvks=;
 b=KgAP9WU+f5r5xO043IbJVnLJa6npb80btqNa0S3FtaFpf1VXWC5Vqd7e5tF+lO69UpfXmFM+gSGEQDEbgdd/6KSKgf5cQUbJXvB4DGQg1VJ+Ed3RN1MUhXT+kh0KJCqbCE4/chl2HxV3LbyUW6nqAFKedoogtt1K4o2zzks6BTBA+lOn6FIhBgj9tQLkWkYLvtN34jyKaakAsBKkoOYhzECft0sCMGDk0iWBvs1SRMQ5gQsosXoq9KFRHQXG38hvXxPzwQwcIlgFp6f47uDKbMxDMfYRlNb+KkoGWFISKZyQiekR3h09txmtY6Hk1FU+9XXY33JovmBPnT/lqJTcSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SJ0PR11MB6720.namprd11.prod.outlook.com (2603:10b6:a03:479::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Fri, 21 Jun
 2024 12:08:56 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%3]) with mapi id 15.20.7677.030; Fri, 21 Jun 2024
 12:08:56 +0000
Message-ID: <16c5e779-3ab6-4968-a13c-0afb3fb98b75@intel.com>
Date: Fri, 21 Jun 2024 17:38:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/lnl: Offload system clear page activity to GPU
To: Nirmoy Das <nirmoy.das@intel.com>, <dri-devel@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, Christian Koenig
 <christian.koenig@amd.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Matthew Auld <matthew.auld@intel.com>
References: <20240620134656.14380-1-nirmoy.das@intel.com>
 <20240620134656.14380-3-nirmoy.das@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240620134656.14380-3-nirmoy.das@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0172.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::16) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SJ0PR11MB6720:EE_
X-MS-Office365-Filtering-Correlation-Id: 6aacf6d4-9f57-449d-c77a-08dc91eaecb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UFRKNFNrbXFzL0N5MGlTUytwZGwrVi9xelRrY3NuREswRjYwdllSUEFzU0Ev?=
 =?utf-8?B?aVhPUHUyMFMyd0l1b0x4dTZzYmtqRW9Qa0hadnVhdkttR0h3eDFPWGtwU0lv?=
 =?utf-8?B?N3Boa3ZIM0lUYVhkVkRQSXF5SmUwSVVldXc5TTF6WUhudk40b0VaY3U2YnJV?=
 =?utf-8?B?VUpMYUEvcitiL0lieEppSzE0L08zQzhRSWx0K2duWCtaYklEVVlueHpiMHVZ?=
 =?utf-8?B?dW9VWk9DOCtqejhpQXQ5OUI5K2xDdXlnLzRUU2I1bjduU0k1enpRNXMvNURu?=
 =?utf-8?B?SS84VE84S0tsTDMzbW9Iek5lblJTQitBVGkvbGduK2JHVEZLSlZTMW13TGRl?=
 =?utf-8?B?dlZocUNGcWVldHZ3WS9palNhRnRIbTExZ0ZtTXl4MnBDZ2R1akdsS2F6eElr?=
 =?utf-8?B?VkR3MnUzNzRNWEcvc1doSm05cGh1dW9ScHQ3KzRQbzk3cHJJUWNWc2FhNmd3?=
 =?utf-8?B?ZGxsSW44OTZIaEFGdVBtK3lFby9JOTJYc0pmMUp3Tlh5cWNYWm9pZk1wcnhq?=
 =?utf-8?B?M1dsVU1hQ1VMU3A0ZGZ4ZlloUkh5TVhXM25uUzdkT0k3KzlCdExmMDA2MDdP?=
 =?utf-8?B?UkVxWVdLWnphcWxQQ0s3R2hpeDQ2SE9GQ2toWUxndnM5Wm5qeFVQYitnekdP?=
 =?utf-8?B?QjI2T3pzNXJZNHplYzZpSXNQSFhpL09STVBGOVBFUWhOYlpGV1ZaOWRaNnho?=
 =?utf-8?B?WnE4V2FLRjJLZ2E4RFhabzZhNDNCVWU0ZVVBVWFNUHZoWWFuR0xrclpPYlpU?=
 =?utf-8?B?QTJVZjdrOFBlYzc1V25YNiszZHFZb0lYV1VLVTNZalpvQUVlZlk5RU85aVBD?=
 =?utf-8?B?QWFaQlVkYlNWREJZMnVYT3lKMTM3NzIrUEkvZXllUGdKSkhockJVblZZVkVE?=
 =?utf-8?B?eTNIMFo2NkpIYWVUUXJNd2hJNXhvTXhscHlCcHFhSUJFVlhJS0E4SUlnSXN0?=
 =?utf-8?B?RTNVUjlrZTVndHB5NDkrdEtRWHBFWXJOeklNRFNtZGRCU2VtQjROd0orcEhz?=
 =?utf-8?B?ZXhWTFdZck5xM3ZxeGdUOUtKN1pOWWZOV1pkSkRoc0grQXptVUpyc0JkbERv?=
 =?utf-8?B?T2ZIcjk3NG50UW81ajFTV1dEemJKWjR2QjNxa3h3cjVEN3c0THFiUUdMY2Jh?=
 =?utf-8?B?MzhSMVlyMmE1eGtsSFY3YWdQNWlIZmswQS9NQ1F2MlNmNVVUeVVEblNMZjlj?=
 =?utf-8?B?TVJPbU1WWjU4dTVaWW9Xb2ZCNFYxNjgzM3JOM01JSTJMdWxubVhWZUlpK2w2?=
 =?utf-8?B?bURuUWF5VFVmZzdTaXVnNjA3YkdYWWk0OHg3S2wyKzYzYk9Zc0hKSFlwZHBn?=
 =?utf-8?B?cFJMTGVNd1VrSFVQdXE3cXVFS3IvTzJ0ODg0NjFtREVjR0RKUmdpVWc2b25I?=
 =?utf-8?B?a2tIMEZKeWFMMzJDaE15c2RyNEJielJtcHpoWkdzOTNhSHBjWUV5ZG5rcFdp?=
 =?utf-8?B?N1MzeEJUVi9paTRveitOVm9HbzBKd0VWV3REMDNkQm0yQ0ZtaVJWZ3BMdzNX?=
 =?utf-8?B?UzcxRkdYTU11OG1laVgvZ3h1SENNQUwyc0t0ZkdyeVc5UjdiWTN4U2Rpa0Zq?=
 =?utf-8?B?MlQrczRST0M2bExDNVNIV2s1cThRZ2ZES0pZdDJYeXFJdmZTcWVqY2hKcjhI?=
 =?utf-8?B?QlVpUDZTd1BvQkxqUXlsTUtBWHR2ejJrQW1ZTVBLOVI3Y0FFbzlhRldvWlRF?=
 =?utf-8?B?OXl5dWdDSXZMUjkrZW02YWtoUEx0ODJ5ODJqVXdWVjFRYWFBcm56Z1hTaWlG?=
 =?utf-8?Q?+TsNMVwnM7ttbV6eTjQSPf2EZ042/ayEanVj4Bq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anNQbzlBelZRdEN3ajFQajJCaDVodVpzQk5FOEIzNHBlcjBERWo0cnhDQUt1?=
 =?utf-8?B?UlplVlZyazJGSi9aM0oxNzAwdWVaWGF4bDF4WWJXNE04aURNeitVNElFVUtR?=
 =?utf-8?B?RWFFbGM1ZjYzZDRPTERBb0twUGdQaEFLVDRHTGdzdmJhV1lBUmpBV0RBdk9H?=
 =?utf-8?B?SUtXS1FreTZ2NVJ6cGl5cGVRVDdGTzBGUFpnS0FXN004OWcwVzRLdWdXdTFD?=
 =?utf-8?B?a1VhSGV6bnE4aE41eWg4VE45ZWNFTjRBSVgzWjkvZzN4RDhhK0k3Uytkais5?=
 =?utf-8?B?SVRMSkRvUDd0V0N0QmZldlM5dk01NUxFUFlUcjFhdy9FenN3T1NTQ0lCcmVU?=
 =?utf-8?B?ZCsyL1haTkZZMHFHRGNKUmY3S3ZIelRPOVVQV2dnamdRV3lkb0VrNjFzT2VV?=
 =?utf-8?B?OWVoOWdaUWpsRjF3cHdJSjJaZVAvVDloWFVBZlFIbno2WHlDNm80ZGVINk1U?=
 =?utf-8?B?Tmkzc3AyajVQT0NoaW4vKzJwcWIzdVkzdWN1bXRwZjAvWEp0STNNb3MwOGZp?=
 =?utf-8?B?cDZiVnJnRzVvcTVDOUZaWFhxMTB2NFBZRk0zaE5YbFcwZlJCUFRnTFBNeFlz?=
 =?utf-8?B?RkI4c05xYTdibXBnUHUwaWFRV3huRHBkSmRlQ0FBOHl4Y0hNenhaZTNkMVdh?=
 =?utf-8?B?U0gxL3hDY0RlRDhRNjBpblYyUGVzL1liQXF3ZWJQV01xN08rTllmYWlzN1B5?=
 =?utf-8?B?cHc2ZUlIdVJSczJERERJQVpsdEl4RDBRMnZ5c01XYnMzc05UanJ0d1FJRkxp?=
 =?utf-8?B?YXlXMjV3blpnNVZNcFNCVUk4WVU4Y3pWa0ZYOCtWTHdnOFdtZkFaVzRuNlNr?=
 =?utf-8?B?bzVEQTcvQ0wwTDRMZmpmN1hQRkpLcTFzbW14MXRya1BJREFSbDlRQktYN1lK?=
 =?utf-8?B?SDR3c0h5R09JRkwzdjNqdEliRmVoSWw5M3RJRndSU1d4SEVuQURFdzRCcUdZ?=
 =?utf-8?B?dmtPZzE1S1VsOXg3Tkt4OEk1VEJjMXdXK0EzNmZQVlhZSG1qbk1WcVROYXg2?=
 =?utf-8?B?SHlLYi9DNm13aUZ5Z1huV2JyL3h6WUFKaG80VGJMeW9MdVVkZWRYNW9zWExj?=
 =?utf-8?B?dzF0L0lmdEJiYUVYaDZHQlRFTDRqbGg1Q0xNNjZ2eDNIUlV2M3JpaEJ3aS9p?=
 =?utf-8?B?YnpQNzl3ZU1ld1hpQmdjTi9udkZweUx1RW9EVFF4RzR2RVBCbGVCczJWL3Ra?=
 =?utf-8?B?Z3hkK0dLYVdqVFhhTk5qWFk5WTJ4alFpQS8wUjlGRnhVSnZLeEpsTjNXdzl4?=
 =?utf-8?B?dkQ4enZreUs4ZDVSVWs3enB0cjA0RWFzaUlwM1NwMDZhMXdRdG4vdi8wRm9V?=
 =?utf-8?B?bUJta2lJMktTV0FhM3Fpb2Z5NVdPaE1Pem01aURCb24wSzQwRnlDQ21GRGpt?=
 =?utf-8?B?RGVhZ2Jadml4emQ0YWd5WWNZOGI4bUFtdnNYVjA0QnkwQ1M0dlVGMzNMVlU2?=
 =?utf-8?B?d3JyTVkzZDNDeWxQTW5KQjhXbXdLRXhWRTZlY1R0ckJwWVJuM0Jvd1RoTE1W?=
 =?utf-8?B?UFF6cHBzUmlrSDN6YUNrZ1o0L0R6b0dicXA5NGdQRFRVVG1uZlVJaHZuSHNO?=
 =?utf-8?B?UmxHV25SUGE3MDFxUnhLQ1BwTG95MjBVdUlsTEowREprMkpqajZLZ2RkcmlJ?=
 =?utf-8?B?Sm50UjJJSWlJVlhqUENOOFJxMlFMRVVPcXNCTjcyVDVYZGlwTmhPbFNwSE5x?=
 =?utf-8?B?clEvK0k5LzdMMGZXdzZvOHg5K0JZYnMyMzlZalNVblBWVUdPRzZNM05sb3ZH?=
 =?utf-8?B?ZnpwTXdGSlRwbjQvQks4MU5yZUN2V0xiZTE0K3hqcklZZWdLb1oxczhpcjY2?=
 =?utf-8?B?WCtYQ3Z6N3gxbTlrV01PS2ZVZW5EWEFvM0IwUmEweEJUa3d2NVNKbHYvZ0Fh?=
 =?utf-8?B?UVN6R1JaemN5ckdueW5xZ0MxZi85bitHWHhZZm84bjMyd3U2Skkxc04xZnVL?=
 =?utf-8?B?WWVIeXNrVi9yT3VveVR6cEpIbC9KOVhyQ3dQRVFNWXJjYUp3ekV6bFk3SnFh?=
 =?utf-8?B?N3BRYmFCMzFNRVhEZWgxM2liOE9ZckhWTEdaK2pFVHJkYU1PQkdBSEoxQ08v?=
 =?utf-8?B?V2NQOXg5Q1ZRTit2SmlIOXljTk9TRGZxY1k1b0F2SFhrSzRxOGNYcVI5Tkl2?=
 =?utf-8?B?VHZFR1FYeVZUdWxoRkNnekR1NVF5VlRJajJKSnphNWNGbmhtUE0wRTVDYjJE?=
 =?utf-8?B?cmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aacf6d4-9f57-449d-c77a-08dc91eaecb5
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 12:08:56.2691 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Q+p+0VM2238U0X4yfTwtIKfeAJFud3fVih92d9rh9OFpWw2pkGeL4v19uBgWR4A0mBBOg5ymr/0uKIrwhKZEUi6+y+Uv5sEcqJ/lWlCm68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6720
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



On 20-06-2024 19:16, Nirmoy Das wrote:
> On LNL because flat CCS, driver will create a migrate job to clear
> CCS meta data. Extend that to also clear pages using GPU with new
> ttm pool flag which allows offloading page clear activity to GP
> 
> This gives very nice improvement for large buffer:
> Without the patch:
>   ~/igt-gpu-tools/build/tests/xe_exec_store --run basic-store-benchmark
> IGT-Version: 1.28-g2ed908c0b (x86_64) (Linux: 6.9.0-xe+ x86_64)
> Using IGT_SRANDOM=1718889799 for randomisation
> Opened device: /dev/dri/card0
> Starting subtest: basic-store-benchmark
> Starting dynamic subtest: WC
> Dynamic subtest WC: SUCCESS (0.000s)
> Time taken for size SZ_4K: 4882 us
> Time taken for size SZ_2M: 3679 us
> Time taken for size SZ_64M: 13367 us
> Time taken for size SZ_128M: 21034 us
> Time taken for size SZ_256M: 32940 us
> Time taken for size SZ_1G: 116261 us
> Starting dynamic subtest: WB
> Dynamic subtest WB: SUCCESS (0.000s)
> Time taken for size SZ_4K: 5417 us
> Time taken for size SZ_2M: 5711 us
> Time taken for size SZ_64M: 15718 us
> Time taken for size SZ_128M: 26170 us
> Time taken for size SZ_256M: 50529 us
> Time taken for size SZ_1G: 177933 us
> Subtest basic-store-benchmark: SUCCESS (0.504s)
> 
> With the patch:
> sudo  ~/igt-gpu-tools/build/tests/xe_exec_store --run basic-store-benchmark
> IGT-Version: 1.28-g2ed908c0b (x86_64) (Linux: 6.9.0-xe+ x86_64)
> Using IGT_SRANDOM=1718889593 for randomisation
> Opened device: /dev/dri/card0
> Starting subtest: basic-store-benchmark
> Starting dynamic subtest: WC
> Dynamic subtest WC: SUCCESS (0.000s)
> Time taken for size SZ_4K: 4479 us
> Time taken for size SZ_2M: 3291 us
> Time taken for size SZ_64M: 6595 us
> Time taken for size SZ_128M: 9069 us
> Time taken for size SZ_256M: 12681 us
> Time taken for size SZ_1G: 41806 us
> Starting dynamic subtest: WB
> Dynamic subtest WB: SUCCESS (0.000s)
> Time taken for size SZ_4K: 3317 us
> Time taken for size SZ_2M: 6458 us
> Time taken for size SZ_64M: 12802 us
> Time taken for size SZ_128M: 19579 us
> Time taken for size SZ_256M: 38768 us
> Time taken for size SZ_1G: 143250 us
> Subtest basic-store-benchmark: SUCCESS (0.328s)
> 
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c           |  4 ++++
>   drivers/gpu/drm/xe/xe_device.c       | 36 +++++++++++++++++++++-------
>   drivers/gpu/drm/xe/xe_device_types.h |  2 ++
>   drivers/gpu/drm/xe/xe_migrate.c      |  6 ++---
>   4 files changed, 37 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 65c696966e96..10ec02412dc4 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -387,6 +387,10 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
>   		caching = ttm_uncached;
>   	}
>   
> +	/* Clear TTM_TT_FLAG_ZERO_ALLOC when GPU is set to clear pages */
> +	if (xe->mem.gpu_page_clear)
> +		page_flags &= ~TTM_TT_FLAG_ZERO_ALLOC;
> +
>   	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching, extra_pages);
>   	if (err) {
>   		kfree(tt);
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 75d4c8ae9234..8e8d54c59aae 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -240,8 +240,6 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
>   
>   	if (xe->unordered_wq)
>   		destroy_workqueue(xe->unordered_wq);
> -
> -	ttm_device_fini(&xe->ttm);
>   }
>   
>   struct xe_device *xe_device_create(struct pci_dev *pdev,
> @@ -260,12 +258,6 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>   	if (IS_ERR(xe))
>   		return xe;
>   
> -	err = ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
> -			      xe->drm.anon_inode->i_mapping,
> -			      xe->drm.vma_offset_manager, false, false);
> -	if (WARN_ON(err))
> -		goto err;
> -
>   	err = drmm_add_action_or_reset(&xe->drm, xe_device_destroy, NULL);
>   	if (err)
>   		goto err;
> @@ -543,6 +535,13 @@ static int xe_device_set_has_flat_ccs(struct  xe_device *xe)
>   	return xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>   }
>   
> +static void xe_device_destroy_ttm_device(struct drm_device *dev, void *dummy)
> +{
> +	struct xe_device *xe = to_xe_device(dev);
> +
> +	ttm_device_fini(&xe->ttm);
> +}
> +
>   int xe_device_probe(struct xe_device *xe)
>   {
>   	struct xe_tile *tile;
> @@ -550,6 +549,7 @@ int xe_device_probe(struct xe_device *xe)
>   	int err;
>   	u8 last_gt;
>   	u8 id;
> +	unsigned int ttm_pool_flags = 0;
>   
>   	xe_pat_init_early(xe);
>   
> @@ -572,6 +572,26 @@ int xe_device_probe(struct xe_device *xe)
>   
>   	xe_ttm_sys_mgr_init(xe);
>   
> +	/* On iGFX device with flat CCS we clear CCS metadata, let's extend that
> +	 * and use GPU to clear  pages as well.
> +	 */
> +	if (xe_device_has_flat_ccs(xe) && !IS_DGFX(xe)) {
> +		ttm_pool_flags = TTM_POOL_FLAG_SKIP_CLEAR_ON_FREE;
> +		xe->mem.gpu_page_clear = true;
> +	}
> +
> +	err = ttm_device_init_with_pool_flags(&xe->ttm, &xe_ttm_funcs,
> +					      xe->drm.dev,
> +					      xe->drm.anon_inode->i_mapping,
> +					      xe->drm.vma_offset_manager,
> +					      false, false, ttm_pool_flags);
> +	if (WARN_ON(err))
> +		return err;
> +
> +	err = drmm_add_action_or_reset(&xe->drm, xe_device_destroy_ttm_device, NULL);
> +	if (err)
> +		return err;
> +
>   	for_each_gt(gt, xe, id) {
>   		err = xe_gt_init_early(gt);
>   		if (err)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index c37be471d11c..ece68c6f3668 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -325,6 +325,8 @@ struct xe_device {
>   		struct xe_mem_region vram;
>   		/** @mem.sys_mgr: system TTM manager */
>   		struct ttm_resource_manager sys_mgr;
> +		/** @gpu_page_clear: clear pages offloaded to GPU */
> +		bool gpu_page_clear;
>   	} mem;
>   
>   	/** @sriov: device level virtualization data */
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 05f933787860..0023f32d147d 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1003,6 +1003,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>   	struct xe_gt *gt = m->tile->primary_gt;
>   	struct xe_device *xe = gt_to_xe(gt);
>   	bool clear_system_ccs = (xe_bo_needs_ccs_pages(bo) && !IS_DGFX(xe)) ? true : false;
> +	bool clear_on_create = xe->mem.gpu_page_clear;
>   	struct dma_fence *fence = NULL;
>   	u64 size = bo->size;
>   	struct xe_res_cursor src_it;
> @@ -1022,7 +1023,6 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>   		struct xe_sched_job *job;
>   		struct xe_bb *bb;
>   		u32 batch_size, update_idx;
> -
>   		bool usm = xe->info.has_usm;
>   		u32 avail_pts = max_mem_transfer_per_pass(xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE;
>   
> @@ -1032,7 +1032,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>   		batch_size = 2 +
>   			pte_update_size(m, clear_vram, src, &src_it,
>   					&clear_L0, &clear_L0_ofs, &clear_L0_pt,
> -					clear_system_ccs ? 0 : emit_clear_cmd_len(gt), 0,
> +					!clear_on_create ? 0 : emit_clear_cmd_len(gt), 0,
>   					avail_pts);
>   
>   		if (xe_device_has_flat_ccs(xe))
> @@ -1060,7 +1060,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>   		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>   		update_idx = bb->len;
>   
> -		if (!clear_system_ccs)
> +		if (clear_on_create)

will break on dgfx

>   			emit_clear(gt, bb, clear_L0_ofs, clear_L0, XE_PAGE_SIZE, clear_vram);
>   
>   		if (xe_device_has_flat_ccs(xe)) {
