Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C27FA392D0
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 06:44:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11DF310E618;
	Tue, 18 Feb 2025 05:44:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lIVDh9RF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F8BB10E61B;
 Tue, 18 Feb 2025 05:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739857460; x=1771393460;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1wQpDfDKKwsQgOaBtJtNgfhe2CX7uc6OCfhODEy5Jns=;
 b=lIVDh9RFbBP3DZnk38LU+CmE/g/E94mLeCf0aPAjFuGW79iv9ThM0yrF
 is4ht2ta2Nv+eo4/jnh9mn3iNq2+9DENb+Oyi2kUnmjMSpYFjyjH4bSOn
 vWukuen+A7TlIfTcAMjrsPHeaNYA6biDCSuyHaaNZMhPwO8Nswo4gkNFr
 Bih3BDrk/pd9doQyouk1xl6lVqaqsfzYaSRvZKJbIAP8SQdMFMm6AxkBZ
 qTzVxnpmxUr+KtCiISRiH7ZnFAbG8iVJwAjCSq38I75A/ZrEm93AxcjRQ
 IF6yzQuilYyCpO8+ILzYBkMvZGuvT8SGQiv8yajhA6c8fTmfs1EW3WzmM g==;
X-CSE-ConnectionGUID: QmFCgjM2SUmgbco8XdOIxQ==
X-CSE-MsgGUID: EOV6rU14RLaXCcdLmdUgew==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="51945730"
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; d="scan'208";a="51945730"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 21:44:20 -0800
X-CSE-ConnectionGUID: KW89UdcISFiZ1rPHsAQBJA==
X-CSE-MsgGUID: NpALESlyTU6cfxlQNDmtuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="151488962"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 21:44:19 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Mon, 17 Feb 2025 21:44:18 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 17 Feb 2025 21:44:18 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 17 Feb 2025 21:44:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ujm12hb1UNldvVpBwHF3zpfP4B5OdfUbJqrKNZYgmYPqiFKoapq3PnP+A3gY3hwradfuhgMfEtxykfwgmQT4QKYYEwmayhgQpqFqTa+2acSdP0vguSPUoZJcW1US1k7JePtecznNvdNZ5DwxQtY7Be6vyL7DurXlbwgwolLWV5fZ57g8RBjH3LTQirDySLk2N1ITgT5zoQXk/ew8x4UamjovBBIia2Ws9J9IWgkl1oeOJx5NRBw8YrQZZGNpAngAoqh/q2hwSwivC7KWJWPfhmP2KIcUMRCBqPr8/iuIFdjUrYgn+gzVMfa9mb0DhNAr99gXh9+hPXC+2gG/eepYTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kAGu7aqws7VCmF7UcLGITXtiqyY5F/Gqb3gIybyU9so=;
 b=GG+yGZluBzsr3rCQ0FegB58L39v05sA6ViVh5sZl4v8xVYzRMfkgSL7klqlwzl4g8pEDmlJL7erx5CIXm7jwnEiFXE1wzrtreDoYXPCIk/z4uurYf8R/TqOTG+Pi1hV1N1snEWWR1g+J54ARN0/wPYrCnsn3U9271T9CunnBqwjGuMjuIGYHOuJeCl/tFH1Cz8o8WcTaIEN/UeBSqgjAoWQknqteVEmzMhEAR8w9ZIIRHHYdPvvuaekojWZ0925DI2Yvz/im75Atg3jv0y6IgR6pXXWqGUulskBNcjKWZ9X01lnfyZ43DnpJkOdio9OCIRbOAwnQBdNl/r6JMhiLLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SA2PR11MB4811.namprd11.prod.outlook.com (2603:10b6:806:11d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Tue, 18 Feb
 2025 05:43:49 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%5]) with mapi id 15.20.8466.013; Tue, 18 Feb 2025
 05:43:49 +0000
Message-ID: <c423efcb-5ab8-41c2-af0a-621007c6175d@intel.com>
Date: Tue, 18 Feb 2025 11:13:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/14] drm: Define histogram structures exposed to user
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
CC: <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <suraj.kandpal@intel.com>,
 <dmitry.baryshkov@linaro.org>
References: <20250128-dpst-v8-0-871b94d777f8@intel.com>
 <20250128-dpst-v8-1-871b94d777f8@intel.com> <20250217120808.708b9b4d@eldfell>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <20250217120808.708b9b4d@eldfell>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0026.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::14) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|SA2PR11MB4811:EE_
X-MS-Office365-Filtering-Correlation-Id: a1f6e7b7-db3a-41d2-79ff-08dd4fdf37e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SGJ2MndnVGsyV3BnSjNZV1hmQy9qcUN3eWVpRnRnOC9QSnpjYTU5VUgvaGhZ?=
 =?utf-8?B?UHRFRkZCT2I2YW1vd2RQSWNaemtDWkxOU2N0b0ZmN1UwVzBSdHpKeWFoN09H?=
 =?utf-8?B?NFpyQURyMklDanVIbkV3bU5ucHBnTzFPVDBqbEJUcmhvQmxmZjBGNHovNlZH?=
 =?utf-8?B?dnNoYm04dXF1S3JYa21ndVo0Uk9qTnZtY3VvYlZsK2RpQTNQYmMzSzFLZ0FN?=
 =?utf-8?B?LzVUSktKMTBBOGxIZEs3SVZqWEZxM2RhMWZnazVzdm1GQ2NCWjNOWGJMODdk?=
 =?utf-8?B?a241eVFwbkFrY3BBcEJuOEZIby9ONGNNUElFUWhTbmY3M3owVWJudHB1RmZv?=
 =?utf-8?B?ZHp1YnJ0cWpSNDBOamcwL1NpdDJCdjJxMGVmb3NWdzBDNlBUcnAvR3FrS0o0?=
 =?utf-8?B?TUYrZkFpVXJTdTVkTis5K3AyN0lLNHBkMlpEK3l0ZElVcVVZV0tRZGpEOGpw?=
 =?utf-8?B?UmxtTHg4K2dpSjMxMHJrYm4xbDl0Z204a293c0R6Ny9hZmx6czVPL3NJU1VZ?=
 =?utf-8?B?dDl2dHozM29jQldFR0hTRTZUUm1EaWVaT0NqZnVGOW1kVitXRUFhYVBDQXNL?=
 =?utf-8?B?R1o1c2N4K0Faa090VzYxbnE2NVhxbTBERFphZnduK3VTWjhmalR5RlRVcDkw?=
 =?utf-8?B?Um11VEdRdTlBOTJxOWhHY2QwdzJ0N28rTUFkY1ZTU1FiTkM1d3RxZXN2K0Ur?=
 =?utf-8?B?UEd1b3Y0blhJOFZOVVBCMDc0d3RTd0lDVkIyY1d3SUFNQUJhaW5wL1lSc3cz?=
 =?utf-8?B?N0lCUjl4NytlOXNkUk42YkxxRFBPK0NXa3dpYkFlZTNBdUQ3YXJwSVI2cmh6?=
 =?utf-8?B?QUJWOXpMZUxneFoyUWFqUWdaRXY1UjF5Vjd5Y3BYNzMxam9Fa0tJZ3JxYUU0?=
 =?utf-8?B?clZkanRqejJZSzB6bGZTVXBXNHowck04d0gwZjFyamJlNjFtTlJtaG1zeDJ2?=
 =?utf-8?B?ejJDZmVHSVptdnJlYXA3L2tjUElIcVgyY1JWUFRRNEFTMmZlT1FleUxIOWlk?=
 =?utf-8?B?K2p2Z1BhdVlvVTJIcUxyM1FGK3Ywb2ExWUlVV2tkQk9sVTZIRVVpYTRacXN3?=
 =?utf-8?B?TUhTTjBjcGprTm8zSytDM2RFYzY3eTZ4LytGaCtuVmNaN2hDL2VuZVB0a3M3?=
 =?utf-8?B?NXJ0dVNSNmdqUmh0SlpzWkZnZHZzdHdHWldCd2Y3c2c3VVFFaGdVbUhtMExu?=
 =?utf-8?B?U1FLd1QvU044ODF5KzBTYVYwU2NOVEJvZTB6QkwycVVKc3ZtbkRzSkpMSXFk?=
 =?utf-8?B?elRXR0NQdzZyVHExVTliUzRJV212dEdkNXR5V04wTVZ4ZHMxUHRqWDRVSi9l?=
 =?utf-8?B?alFXZkZ0YkpKSG9udDh4VGpPaS9Wc0xCbHk4Vi9OR2h6eGZqU2lLV3VVcC95?=
 =?utf-8?B?bnRrZ2QvNU42RUR0RS9ZMFJjM3BUZm1wNEt3eWZPYzIvYzU2Q1ZKMW9wNmJZ?=
 =?utf-8?B?RUIxRm5vMFZGTkRjaDdLc0t2ZFVWS2dwR25nWllQTDNZUE5LWVFLZlhjK0ZZ?=
 =?utf-8?B?YlBRYm5ML3FlN2FZWWZYUnM5bDc5L1h1UUJNTER3d05SeHNzekxpeFNBa3pJ?=
 =?utf-8?B?WFJieUpEbEpHT21UcEdiVTN1UDVuZlpBbHpJTjB4RFhIUUhJTDR4Uk1xdzla?=
 =?utf-8?B?QkdyTmRCbWVXSktqdUVMTjFGUlZuY0Ura0p5S2NoOUFad2NsdmNQbytxMXNu?=
 =?utf-8?B?ZTl4UWhkU1M4WkJvUWFrdTd6QU5hNnNrRlJweG1JdDlxbEdyZXBaTUFtb2ho?=
 =?utf-8?B?SjFCbnZzN09pZU5oMHVOZDlqMWVYTTkzZ1U0Mnh6ZVVpVWhqb3VESHR2bGh6?=
 =?utf-8?B?cDFUZjJPU0ZlZ3U2RjNpR0FmOXZuc3liaVhxckdrUHRDQVJvZURLd1NISEpq?=
 =?utf-8?Q?XOkGOUiZv4Dv4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ck5CUDUrZmVEZ1kvR1BSLzByaDI4cEdsazBlV0pXTnZVNC96RUhMc1lpRGFv?=
 =?utf-8?B?a0pWQnkyRWVCdjJtV0JYYzFOQldaTDRaSTdqZWorRlM4dGFFRkJ2WWNERVNP?=
 =?utf-8?B?NmEvdk5uQk1mZUdlSC9MRkdZRk9NaEsvSlJPdldJa3hreUpsaHB6dk8xWFNv?=
 =?utf-8?B?aEtRMVYxRmhvZmllRmtiNmNjZ1FPRjBaM2QvbU0xWm03ZDV5ZUZpQm1kek5F?=
 =?utf-8?B?ZXBOTzN2LzlFOS81U055WnRNZ0laekcvb3RLdXEzNmRJNTV1LzBJN0hhc2Fq?=
 =?utf-8?B?Ym5YclB0Q29EeVZuYnFUbUIzSDZXM1ZXU09JdlJNeE5Kc0UwVE1ZbXBNNGxx?=
 =?utf-8?B?Y09qWTEwM3RGWHBHZWRNUktIZGo1U1dxU1NreXVjd1NHWEJOV3ZvRXlhRUxK?=
 =?utf-8?B?UUcyTUNOT1BVcEdPRHpXLzU2QUxlM0d3ZGQ2RVh3c1dQczg5bU1XR1c4Q1NX?=
 =?utf-8?B?Nms3Zk1teHA0aG55dDRyQXArZmFFbmJnT2gwM1k3d2I1SEZmYzJhbzRHV3I5?=
 =?utf-8?B?UE9PRFQrc3R2Yk5ZVG16MkhSQTlrWjVqNzdvQlpuakRxczM3bWhpRVpieFg5?=
 =?utf-8?B?aVkzalRIdnl2ME12Z3p2bkYxQ3FIdERSempSc1lWZkdXN1hQcENieTNhMnVP?=
 =?utf-8?B?VWpmZFhRTFNvTDYxVG9KdThNeWZoK2EwcXNraEdSQ1BaV2dZK0JmUXJwOVpK?=
 =?utf-8?B?L3NTRzNIdWxGU0tqRGFMRzQ0NG54cko5eEJhK24wdnUrdHEvTjhGR2ZMNmJx?=
 =?utf-8?B?VGdXazQxNXhyV1B1UjBMYXR4NmdnNWljNTZ4T2VlWVY2dnA2QmJLQXozRkJo?=
 =?utf-8?B?eFV4blNhUTNhUDA0K0xQMG5RU1BIeUNYMWE4Z3N4emloMitVVG5GZ1pENXV6?=
 =?utf-8?B?Y29tbmVuZlNMc1NPR21iQlpXY1EzUTBqSHp3R05mNVZMdjJMYThBaXIyYytE?=
 =?utf-8?B?allaYlRWdnRJT3g3cEFYOHBzMXZQVUpmK0p0VDNteERpR2ovaHZmV2lsT0VX?=
 =?utf-8?B?TDU5c0VGVUo1amkxUkVwaEF2TTlCeSszUmJOUU00K2IwaUxGa0R0eFRVdFVZ?=
 =?utf-8?B?dk1ES21WY2thcjB3TklvbG1WMjdKV3ZKazlZUDROQ1RqWUQvM3p3djg0SnEz?=
 =?utf-8?B?T3F0Q2dMaC96V1NJZEZHdTMzT3VSbFNKeTFhY2U5eXlra1haRzZHTm9PWkYv?=
 =?utf-8?B?ZnRnZjE4UkdEay9EMms0NUFQbXpzNzZWQ1pKMHpPeTQwSUF2RlBzWG1SWVVi?=
 =?utf-8?B?RVhqOVNRYm5JdlE3UVVrdnZGQkNmMG4zM0RuZlpoczMwbkQxeWxvTG9zSGla?=
 =?utf-8?B?R1lwVndETGdncGswWHV0WElIbXN2SU5sOHNMNHJDc1R6Qm12cmV5U2JqcXJw?=
 =?utf-8?B?TC9hQ0tHSlpST3pQN093aE8zOGFhSW5XVHhzcEY3a1JtYXVReTZVZmtYZzgx?=
 =?utf-8?B?bVM1TC82TSsvKzhOQnoxNTBhWUdwVFdnbGl6QWEwMWIyQWNUVkI1NVJDQWVX?=
 =?utf-8?B?SE9iOGJZdGQ0VEs4K2FnWUU2Y21IeEdMeDBaWnhQMW16d0V3R2c0QVlvM2lM?=
 =?utf-8?B?REY5dE9qUzBicEdhOExsTnFFY3dENTIybFdBUWN3Wk54cXFST1hZUlRyUGRj?=
 =?utf-8?B?QkVENjA2anBxcytjQThYc0tWNUgxV3Vxa25INmJJeFh0YmdWcXROQUgzek8v?=
 =?utf-8?B?eUlSWFNoRTJkQy9qMjM4TkZZWFk3a01OWlJxeUVGUTVldFRoUHZ0S3Y4K0sx?=
 =?utf-8?B?MExQUlF5akF5SDRtdWxVdW9YNUQyQkpGNTVuWGREaXRGalQvYWgzL3c4QmRR?=
 =?utf-8?B?RVd3NFJpZ0JWTUpVYkdQY3htSVlOMTBuZHdIWjBiOXhlNUQrMWhqVDJZaGNX?=
 =?utf-8?B?TWhjNk02cVlLVHVySTZtVVcvaVVYeXFvUUNidTM3ZnoyZG5jQXA0ZVlIQXd3?=
 =?utf-8?B?NGV1dGV2SGovV0U0UllqRUtvSWdtZVowWjZyYjJjZ1FkOTg1cERsaTI3TlFV?=
 =?utf-8?B?a3pramRISE1LS2hwZyttd0JiUVlXN2JEM2ZYTDM5RjF5MHl1bTUxM0hTcmp6?=
 =?utf-8?B?c0hHdGNMejZyT2dWbFhKbUFNZXQ4V2dHTTAvMnJOQ3FBeUVQOU1NdWN6S29V?=
 =?utf-8?B?cE91SmFsMWx6S21HOHZ1elpOUExFRGtEOFoyQTRoTms4TCt3bnJqcVkzbUhu?=
 =?utf-8?B?NWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1f6e7b7-db3a-41d2-79ff-08dd4fdf37e5
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 05:43:49.1880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Eo3OY5jc9lI0Fqd0Ls8/yKSoGV9zACOh9Ht9cRzu/klYb/VANp3WJQxiDUyhpFB5gpSbekR43kYXLUJAvo9NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4811
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

On 17-02-2025 15:38, Pekka Paalanen wrote:
> Hi Arun,
>
> this whole series seems to be missing all the UAPI docs for the DRM
> ReST files, e.g. drm-kms.rst. The UAPI header doc comments are not a
> replacement for them, I would assume both are a requirement.
>
> Without the ReST docs it is really difficult to see how this new UAPI
> should be used.
Hi Pekka,
I also realized later on this. Will add this in my next patchset.
>
> On Tue, 28 Jan 2025 21:21:07 +0530
> Arun R Murthy <arun.r.murthy@intel.com> wrote:
>
>> Display Histogram is an array of bins and can be generated in many ways
>> referred to as modes.
>> Ex: HSV max(RGB), Wighted RGB etc.
>>
>> Understanding the histogram data format(Ex: HSV max(RGB))
>> Histogram is just the pixel count.
>> For a maximum resolution of 10k (10240 x 4320 = 44236800)
>> 25 bits should be sufficient to represent this along with a buffer of 7
>> bits(future use) u32 is being considered.
>> max(RGB) can be 255 i.e 0xFF 8 bit, considering the most significant 5
>> bits, hence 32 bins.
>> Below mentioned algorithm illustrates the histogram generation in
>> hardware.
>>
>> hist[32] = {0};
>> for (i = 0; i < resolution; i++) {
>> 	bin = max(RGB[i]);
>> 	bin = bin >> 3;	/* consider the most significant bits */
>> 	hist[bin]++;
>> }
>> If the entire image is Red color then max(255,0,0) is 255 so the pixel
>> count of each pixels will be placed in the last bin. Hence except
>> hist[31] all other bins will have a value zero.
>> Generated histogram in this case would be hist[32] = {0,0,....44236800}
>>
>> Description of the structures, properties defined are documented in the
>> header file include/uapi/drm/drm_mode.h
>>
>> v8: Added doc for HDR planes, removed reserved variables (Dmitry)
>>
>> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
>> ---
>>   include/uapi/drm/drm_mode.h | 65 +++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 65 insertions(+)
>>
>> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
>> index c082810c08a8b234ef2672ecf54fc8c05ddc2bd3..b8b7b18843ae7224263a9c61b20ac6cbf5df69e9 100644
>> --- a/include/uapi/drm/drm_mode.h
>> +++ b/include/uapi/drm/drm_mode.h
>> @@ -1355,6 +1355,71 @@ struct drm_mode_closefb {
>>   	__u32 pad;
>>   };
>>   
>> +/**
>> + * enum drm_mode_histogram
>> + *
>> + * @DRM_MODE_HISTOGRAM_HSV_MAX_RGB:
>> + * Maximum resolution at present 10k, 10240x4320 = 44236800
>> + * can be denoted in 25bits. With an additional 7 bits in buffer each bin
>> + * can be a u32 value.
>> + * For SDL, Maximum value of max(RGB) is 255, so max 255 bins.
> I assume s/SDL/SDR/.
Yes, sorry TYPO
>
> This assumption seems false. SDR can be also 10-bit and probably even
> more.
Yes but in practice majority of them being 8-bit. So have considered 
8-bit for illustration purpose only.
The design itself should accommodate 10-bit as well.
>> + * If the most significant 5 bits are considered, then bins = 2^5
>> + * will be 32 bins.
>> + * For HDR, maximum value of max(RGB) is 65535, so max 65535 bins.
> Does this mean that the histogram is computed on the pixel values
> emitted to the cable? What if the cable format is YUV?
Yes, again the illustration over here is max(RGB) used for histogram 
generation.
If YUV is used or weighted RGB is used for histogram generation then the 
mode will have to change and accordingly the data for that mode.
>> + * For illustration consider a full RED image of 10k resolution considering all
>> + * 8 bits histogram would look like hist[255] = {0,0,....44236800} with SDR
>> + * plane similarly with HDR the same would look like hist[65535] =
>> + * {0,0,0,....44236800}
> This SDR vs. HDR is a false dichotomy. I presume the meaningful
> difference is bits-per-channel, not the dynamic range.
>
> It would be good to have the pseudocode snippet here instead of the
> commit message. The commit message should not contain any UAPI notes
> that are not in the UAPI docs. OTOH, repeating UAPI docs in the commit
> message is probably not very useful, as the more interesting questions
> are why this exists and what it can be used for.
I have the pseudocode in the cover letter of this patchset.
>> + */
>> +enum drm_mode_histogram {
>> +	DRM_MODE_HISTOGRAM_HSV_MAX_RGB = 0x01,
> What does the HSV stand for?
>
> When talking about pixel values, my first impression is
> hue-saturation-value. But there are no hue-saturation-value
> computations at all?
The computation will have to be done by the user in the library.
>> +};
>> +
>> +/**
>> + * struct drm_histogram_caps
>> + *
>> + * @histogram_mode: histogram generation modes, defined in the
>> + *		    enum drm_mode_histogram
>> + * @bins_count: number of bins for a chosen histogram mode. For illustration
>> + *		refer the above defined histogram mode.
>> + */
>> +struct drm_histogram_caps {
>> +	__u32 histogram_mode;
>> +	__u32 bins_count;
>> +};
> Patch 3 says:
>
> + * Property HISTOGRAM_CAPS is a blob pointing to the struct drm_histogram_caps
> + * Description of the structure is in include/uapi/drm/drm_mode.h
>
> This is a read-only property, right?
>
> The blob contains one struct drm_histogram_caps. What if more than one
> mode is supported?
Multiple modes can be ORed. User will have to choose one of them 
depending on the algorithm that he is developing/using.
> If the bin count depends on the bits-per-channel of something which
> depends on set video mode or other things, how does updating work?
> What if userspace uses a stale count? How does userspace ensure it uses
> the current count?
The bin count depends on the hardware design. Hence this bin count will 
be share to the user via the histogram capability.
>> +
>> +/**
>> + * struct drm_histogram_config
>> + *
>> + * @hist_mode_data: address to the histogram mode specific data if any
> Do I understand correctly that the KMS blob will contain a userspace
> virtual memory address (a user pointer)? How does that work? What are
> the lifetime requirements for that memory?
>
> I do not remember any precedent of this, and I suspect it's not a good
> design. I believe all the data should be contained in the blobs, e.g.
> how IN_FORMATS does it. I'm not sure what would be the best UAPI here
> for returning histogram data to userspace, but at least all the data
> sent to the kernel should be contained in the blob itself since it
> seems to be quite small. Variable length is ok for blobs.
This point has actually opened up discussion on the design. Sima has 
infact commented the same with multiple options and which among them 
buits best. Lets take this discussion on that thread.
>> + * @nr_hist_mode_data: number of elements pointed by the address in
>> + *		       hist_mode_data
>> + * @hist_mode: histogram mode(HSV max(RGB), RGB, LUMA etc)
>> + * @enable: flag to enable/disable histogram
>> + */
>> +struct drm_histogram_config {
>> +	__u64 hist_mode_data;
>> +	__u32 nr_hist_mode_data;
>> +	enum drm_mode_histogram hist_mode;
>> +	bool enable;
> Don't enum and bool have non-fixed sizes? Hence inappropriate as UABI,
> if architecture, build options, or the contents of the enum change the
> ABI.
>
>> +};
>> +
>> +/**
>> + * struct drm_histogram
>> + *
>> + * @config: histogram configuration data pointed by struct drm_histogram_config
> s/pointed by/defined by/ I presume? That much is obvious from the field
> type. What does it mean? Why is struct drm_histogram_config a separate
> struct?
This is totally a separate property for enabling histogram. When 
enabling histogram if there are multiple modes of histogram generation 
supported by the hardware which among them will be used here and the 
data for that mode if required(For Ex: weights for the RGB in case of 
weighted RGB) would have to be sent from user and this struct 
drm_histogram_config holds those elements.
>> + * @data_ptr: pointer to the array of histogram.
>> + *	      Histogram is an array of bins. Data format for each bin depends
>> + *	      on the histogram mode. Refer to the above histogram modes for
>> + *	      more information.
> Another userspace virtual address stored in a KMS blob?
>
>> + * @nr_elements: number of bins in the histogram.
>> + */
>> +struct drm_histogram {
>> +	struct drm_histogram_config config;
>> +	__u64 data_ptr;
>> +	__u32 nr_elements;
>> +};
>> +
>>   #if defined(__cplusplus)
>>   }
>>   #endif
>>
> Thanks,
> pq

Thanks and Regards,
Arun R Murthy
-------------------

