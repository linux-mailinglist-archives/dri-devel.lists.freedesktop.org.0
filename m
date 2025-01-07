Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB73BA03EF5
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 13:21:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56C0410E6CC;
	Tue,  7 Jan 2025 12:21:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FA6uVVRK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E9A710E6CC;
 Tue,  7 Jan 2025 12:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736252461; x=1767788461;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=N/Um+ZofajZcPF++CHSHtEuGhQKn2zPKDDiTJaR5WbM=;
 b=FA6uVVRKIW2NRHbJRbscfb587J7jyav32FUmB2IMBDCsItLS0WcARgqw
 gYkglnviO+eJrU19FYui1Uhigzb9yT1UtjQLTdQ8jKxxQqPMooKla2bnA
 hU+NlvXnh2iTxNBGmL9q1GB2Tpbmf2cySFsGysowFAj41v8Y2r5fN3hYB
 X822LrJvtOXyIw6x3ha/KnfBuy/8V1HkmmLBovgDL9CPldyFYnlAVdp8n
 kyjkQdKlfRI4T+Zj8NI654NMcCBvqnM5/yJXO2qNOFntO/EFLCgf7mlUO
 2LEe2gWAQ2GeLCKgB1oWseIB/MmB8SABUAjfJz90fD+uwdqItwn+2HCxi A==;
X-CSE-ConnectionGUID: NpwuHRGGRfygkpQF/ddSLw==
X-CSE-MsgGUID: p5jIktCWQ4iHawlO8oJtTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36589652"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; d="scan'208";a="36589652"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 04:21:00 -0800
X-CSE-ConnectionGUID: bDoJMn3xRcu1wQh6+aOi4A==
X-CSE-MsgGUID: t6bfYakARWSuHjGhbKLEFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; d="scan'208";a="102654206"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jan 2025 04:21:00 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 7 Jan 2025 04:20:28 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 7 Jan 2025 04:20:28 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 7 Jan 2025 04:20:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YugO4g8gFiEmmgSqYHQA1Xt8XCWffAtZ20ZHwpgPI4EnFmMuEQrSruOaEp2Ev2GSrzT5yZlwm/1Lpl7Jf1ShQRvnVln6iKetHhEs4e0JCt05zkCjrvPdNETsVz+CTJmLhTKLznNmWs8n3kzainn0T/TQ0FBTkeppsEh3cElWafoiybheVO3OSbX7WK1PbH5ws1rbbClxL5DV3+K6r9Yy0P3QjwoU+bHGVMWb0lT+017QN/BAH45TA2Gsuw6Koi8EwXd1xx1hT/A2d32h5Had1R+PY1nAuMK3kcSuIGasKOmIpRiJJ0+k+3255envy3DtYWzr3fg8usiy7fdOLPFXlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vwlYQEDttiU4N5ouVcesCQhuNlEt4fmZOkyATpLRZFs=;
 b=BQYc496F2jxBqNSXpW4tuPFQadOiMEQ6w+FyWaTPkqlPRCnGU0cKNndQtco6IaA59D7lJRoaXQvwtq8bir8bBlqJQ73NS792RzaB5XFGZL9xha8G1Orgwti+FT11MAqJE0pg5uFh5QQcWPZtmVYcoa8Hn3o4cYOOH5tadP4inwJPBd8cM+Ubri4L6nMD8+16jcjaICYaDpFyc/MgjJhZnQsPJJuagsMNjl4gNC9CeLdh9q/2mDehctMEkrpJg1nOQ10DZnyJajY75WfzglBbZA5+mna3f/dlG3JvVYPEy3ekxumhuQTR0V6mXecGc2FKsnRh8g0njsXXAiHl1QeKOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7904.namprd11.prod.outlook.com (2603:10b6:8:f8::8) by
 IA0PR11MB8397.namprd11.prod.outlook.com (2603:10b6:208:48b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 12:20:21 +0000
Received: from DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739]) by DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739%4]) with mapi id 15.20.8314.015; Tue, 7 Jan 2025
 12:20:21 +0000
Message-ID: <1c737521-70d9-4779-a044-90a6fb223a5e@intel.com>
Date: Tue, 7 Jan 2025 14:19:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/30] Introduce GPU SVM and Xe SVM implementation
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: <apopple@nvidia.com>, <airlied@gmail.com>, <christian.koenig@amd.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
References: <20241217233348.3519726-1-matthew.brost@intel.com>
Content-Language: en-US
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20241217233348.3519726-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P190CA0051.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::10) To DS0PR11MB7904.namprd11.prod.outlook.com
 (2603:10b6:8:f8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7904:EE_|IA0PR11MB8397:EE_
X-MS-Office365-Filtering-Correlation-Id: b5084fa3-a409-4d51-44c9-08dd2f15a7d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SnJjUnp3WE8xOVJ3NlRzSVBQUloyeGsvc01UakNtUmZpMGtENWlJTkpzTXNo?=
 =?utf-8?B?U2dha2wwSHk3WHBHVnVHSVJyUmlUQlNHU09NZlEyNWx1VGd2ZlpKNThPMm5y?=
 =?utf-8?B?Szg1T0ExR294aFJkTmhaRm1xQ0VSUUNVYjJMV0l4czh1YXEwVExoZ2s1bHhH?=
 =?utf-8?B?ZExUbEprNk1kRGgzcVpVcVE0OWljTDlIOHRSSXRqblB6dEZwZXRQYU1lbHdK?=
 =?utf-8?B?ekJRVm5uYTVHbDQvUGFGRDNxTEdPM01iL2VzaFMzTktKQWxNZ3pzWXJvRzhD?=
 =?utf-8?B?QTFTNHdFaHM3dTc1cnc2YktIWk51bHBobDdYZDllTkc2YkJWWnRsZVRiTU1l?=
 =?utf-8?B?TjlLNVJndktjenVqRHBDVWxucnA0S2ROOUtiRmRqSzg5MmJ0dGhudytHVWJQ?=
 =?utf-8?B?VGFMenIwRjFjZ0xvNkJoN2hMQ1FYZHVzZW4vcWFWa205SHN2bTJ6QlhlNVg4?=
 =?utf-8?B?eHVmejc0VEJGSEdCd2RkOEFTNGI1M1hQUWNmeWRpQnhYUktUQms2MEh6cWlj?=
 =?utf-8?B?TUx0UzBETkVaNjkrVnNjOERBbktyRXg1SnJOV3pvOTUxc1F3V2NPOFVZbzR3?=
 =?utf-8?B?N3FrZWdqeVViK0tsTFRUV25DckF5WEg2UnRCQnJJaGlJMnhvQ0ZGdU1aNGZ3?=
 =?utf-8?B?V3IvOWpLVTZ4TU5ZR2lJTENyamxjMklkcGVBRGM2YzhkUDF6bVZUYmFTK1g2?=
 =?utf-8?B?bzMvMUh0RTRzRkpiRm1rMEhSdHRXMW9lYkJNZ3ptUUZ5bDN5MEtVT1BNbnlQ?=
 =?utf-8?B?WW90NGF6QzdSZEE1RFNQcFhud2xmUG1KTGR3Slg5YlM2WGVFNHY2Y1RyTDg4?=
 =?utf-8?B?Tk9WS3dsTWVGVGpmYUtRVnBKVTN1OXVsVHVnWGJSbUk4dGlEcW1QcjlYeUNp?=
 =?utf-8?B?SzN2SThaUFNKUWpOY29YYXpoSEN3Mk42WFBpTU1iRnpndXkrNGhqVkZoUXBU?=
 =?utf-8?B?M29kQm5yVmJTUmtYcXhId2E3ZDh1UmVsajdieFJFNUJzamNBTEg4WEowbnE5?=
 =?utf-8?B?NkJhd09DVHJVVFQ2SkpZNXB4N2RkZytZTjJ0TkV1N3BsSWY1QnVpbGRSZTFm?=
 =?utf-8?B?NEVYVzU3c1FYQkZ1TWppL0d4Wk1lNE1sY08xTU92eEYxUC83d3dxU0pyaHNU?=
 =?utf-8?B?UGU4WkJoUEdUa2llMzE2Q0doMml1ZU5RRkpVOUFVUHNLWE9seWk2cTBMMFI0?=
 =?utf-8?B?UnNRVzlYR0lYbkY0QmwzamJlcCt4ZWZvR1hIMnlYL3k4NURJaGJXM3NqT0Zh?=
 =?utf-8?B?by9NNEY5cE9ySW1zZ2lLaHhRYTB1WUUxWllRR1U4UDUxWmxCb3B2REM3Rmhi?=
 =?utf-8?B?azhiUUh4NFR4ejR5QWpFSHV2VnlNOFZKT1VDOGF2dDE0K2h4K0x3dlZhamx3?=
 =?utf-8?B?djBWWCtCektRWWoxenpEdTRNK0gvVnQzSjBSL3lMK3hGdjRJS0lEMUp3dGVD?=
 =?utf-8?B?UlYrRUVKbHpuUDNIckt5NnE4dTJFMmxHZmNSVFJDOGRFVVpWaGp2b1NwMEdm?=
 =?utf-8?B?ajZDeCtTc2pFL2xxUitib2dlbkY4cjMrN3RQR29oZUtUWVlha3ozYzcyWitG?=
 =?utf-8?B?cDFNUmp6dXA0TnZ0b1hMUERxWGJuT2VSQ3E4VWN1Rnd4eFY2ZmxjNUpyU0cw?=
 =?utf-8?B?dkNuaGs3dHNWZ1N5OWpsanhud202YUtLMXo0elZ1ZU9IMWNMa1VSWjFNK3Ni?=
 =?utf-8?B?b0FnSktWVnZ6U1ZyTklhdThxdzFJRzlBTW9GUnVEa0F4dzhiamVYU1pJSDdO?=
 =?utf-8?Q?uaeR78hq9JYHQgOnjNaRKzz0J5a0R/qiepLmjR4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7904.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFJDQzdaTlpWb3N5UDVIZHJwby91R3JtNGk3b1QyVEdOaGpicTFhSXlSVmZv?=
 =?utf-8?B?aDBmVkFlZkNwUjlJK0NTbEpNYzJwdEFFbW1ETDBmVGRnRTI0dlUzbEJ3cGYw?=
 =?utf-8?B?S2xQMTJtQkZtSTIzTkpTWENmdzFJL1luRWlrczBHRjI0QVlWZEMrbmxyWlJy?=
 =?utf-8?B?R29XcFNUOEFaQndDWGxHS1Z3VWU0WGpxaDJhZmhMUUEyVFBPYXZZaXVvVkF3?=
 =?utf-8?B?SjlEZ3ZMZVdwZ3FwRmJPbFBlNFY1bmRqTlc5TjR1TndzN3V3TGZsMXYvbXF1?=
 =?utf-8?B?Q3ljSm1xQVRITUkyY08wU05JRVdWR2JlcHNjT3dXSjVjS1Jsc2J2RXdxNDE4?=
 =?utf-8?B?RmJpODdQY1FKeHIyN1dscXVxK3hiNXNkV2JGQ2dTaXFNdVdrN2NybmxncFdC?=
 =?utf-8?B?bEJYRTlTQkpDTjNXMkE2aVA5WjdDOVdpeldYRGxOOXRkSnFrKy91WllZUDBC?=
 =?utf-8?B?eHI5M0ZnNEU3N3laYkRjbzBIbVdvMnhkSGJlRmh3SDRsRUc4emNWUzFkUVNt?=
 =?utf-8?B?Q0hmM0NKNW54bEJqR2JEQkN1NFVRb2w0U1VHOUJaVTNGQmRLVTlBOVVsQkJx?=
 =?utf-8?B?ODh2VlduSEx3YUxBQ2JVVWQrU1k1MGJrNXZxVmtLY243Q3BNZXhpQVcrME9x?=
 =?utf-8?B?NnlXc1dCbWpiQzgyUUFPK3lnU055RWd4T3NldnUyQzVxMWFrT1FiT04zRkNY?=
 =?utf-8?B?NHlpR0lxMEpSOHpvMEpGcnJxTzJ2ZGxjNjdNNEdUbnN4c3U2dHVWV3pGZEQ3?=
 =?utf-8?B?LzlLRGYxVFFZZjc3SGpQV2dVVTRRaGMzYlJkTnZ1bTJUS1lBanBoclMvbDVI?=
 =?utf-8?B?WDdPNEtSZ01vWWJMUDZGNE5GdFoxL1B5cjNPelh0STFNMHhrWVVsZnVyeVRk?=
 =?utf-8?B?WkpxWnppS1lIS2MrOTlrbG9xYWppbmtJUE5NYm5iTVBDWkt1RGlOQzdhVENl?=
 =?utf-8?B?aUZYcmFZNksrMlJTZDhIeisvRE96MVh2Qkl5bGZIQndtKzF2SW1RTisvZEtE?=
 =?utf-8?B?eWhzcHloNEY2Sm1MOEZ4SUNTNDFkU3lkTDI0RFFMVG8yZnYxZk5VdGNCdjU4?=
 =?utf-8?B?VElQVVJNL01qVGdhdWc0QVpIWS9LNVlpK2M0WExkblVQQkJGdDV4dkxJZ1hD?=
 =?utf-8?B?bTlWQTI4YmtvV1ZNN210ZG9Sb0xYRFlTQ3BZbzBLZkVZNXoyVmtnT0dmdlhE?=
 =?utf-8?B?MHV5RUIwWkNpTVNnc3MxbXFnLzZSdUJNaURTbXhUb1FDSEFvTHRTMXI4T0E5?=
 =?utf-8?B?TXFtZWtUY2pHN2lMdEorKzd0Qi9mZ2RYQ21tMDdGNEROWXB2OFYvejBzQXM1?=
 =?utf-8?B?NTJHZkZDSTkwaWQrTk1ydUJQZm4xcG5TSVNuUTB4cm9tUU9QL240TjRDNGQ1?=
 =?utf-8?B?Ti9jYWtVcVNHT1V6MXM4eEdnQ25Pa09RZkJoVzRLTS9LeGRjcFRJM3B0THNl?=
 =?utf-8?B?ZkZHWk56bGhTSi9mcGt3eFp3SFgwMCtML2I5SnNwOEp1N29CbHN5SDhOeFZ0?=
 =?utf-8?B?dzQwZFdYRVNWNDMvNlMwakFhdGEzRDFYN1dVOEVaa0l5a1JJUCtKZGtiQTZH?=
 =?utf-8?B?dy9QYkZ1eFdhWWdQNmVKUVp0THRvWVpsRytVY3lOQStIMWxmZTlhaTZsejVa?=
 =?utf-8?B?dWhPMnNNc0laRTJEYVNuMmZicWZGWjhncSs0LzdVWVlJS1RWRnNBUlFvbm9B?=
 =?utf-8?B?dUNhbTBjcU1yblc0WWdXd1N6UDNNLzQzL1U4OUU4ZWdYZDFJZUd5MFcxdGtG?=
 =?utf-8?B?cm9jK0x6bWZRM3d3QjBMREt2SE05aUk5b3hhRHJyWmJ0VkJTWnpiSkl4MHcr?=
 =?utf-8?B?SUczajgwYmNpYU5McXBFblROWStVa3hLSFh5eTBSZkoxdFJYbWZZRVRHUDNh?=
 =?utf-8?B?SmlYN3pJNnUzWTZYcXBnM3dTbktvNHZkYXVYaU95cG1VSGZKYVQrdm5qZVNl?=
 =?utf-8?B?Zlp0UytRaUJXVm5udy9kNGNFL0dBQ0FDT1ZUYzk0ajNJczBLbkhMdUR1ZERP?=
 =?utf-8?B?NnFzZXJNMUJDZ01qUkJBeWh5Q00vQkU4Z3c5WlU0dlErUG05TkVhSDd1NkQ1?=
 =?utf-8?B?VjhETUw4MHFSc1Iyd1BzZnIzUEdIZWpCZEt5NytjaFo2MSt6VFdCZzJpRUV0?=
 =?utf-8?B?aGZibXd1Q2pRaUFReFJySnNQOElZS0EvLzBaMFJTM1JmT1kwU1dpT081UGgr?=
 =?utf-8?B?bHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b5084fa3-a409-4d51-44c9-08dd2f15a7d6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7904.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 12:20:21.4515 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4mHN/J8rDTa208UdCertnHj81qe4L2UlGa8zJzufL2n1O6mnj1Ke49+8fobdfM+I81/wBg4htv0g6S4mj7EUZfdNK5X/WuELKPDw18pyZ6k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8397
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

Hi Matthew Brost,

After applying this patch series and the following to the latest 
drm-tip, while testing[1] with the mentioned IGT, I faced a kernel oops[3].
It makes prevent progressing of the mentioned igt tests.
Could you please check the following oops log?

(1) apply comments of "[v3,05/30] drm/gpusvm: Add support for GPU Shared 
Virtual Memory"
(2) apply comments of "[v3,15/30] drm/xe: Add unbind to SVM garbage 
collector"
(3) drop "[v3,27/30] drm/xe: Basic SVM BO eviction" patch

The kernel config used, the entire dmesg, and detailed information can 
be found in [2].

br,

G.G.

[1] used igt command: xe_exec_system_allocator --run-subtest once-malloc
[2] https://gitlab.freedesktop.org/elongbug/drm-tip/-/snippets/7823

[3] kernel oops dmesg
[   51.365230] Console: switching to colour VGA+ 80x25
[   51.367772] [IGT] xe_exec_system_allocator: executing
[   51.383611] [IGT] xe_exec_system_allocator: starting subtest once-malloc
[   51.386066] xe 0000:00:04.0: [drm:vm_bind_ioctl_ops_create [xe]] 
op=0, addr=0x0000000000000000, range=0x0001000000000000, 
bo_offset_or_userptr=0x0000000000000000
[   51.386171] xe 0000:00:04.0: [drm:vm_bind_ioctl_ops_create [xe]] MAP: 
addr=0x0000000000000000, range=0x0001000000000000
[   51.389429] xe 0000:00:04.0: [drm:xe_svm_handle_pagefault [xe]] PAGE 
FAULT: asid=1, gpusvm=0xffff8881775e9188, vram=0,0, 
seqno=9223372036854775807, start=0x005584e8400000, end=0x005584e8410000, 
size=65536
[   51.389529] xe 0000:00:04.0: [drm:xe_svm_handle_pagefault [xe]] 
ALLOCATE VRAM: asid=1, gpusvm=0xffff8881775e9188, vram=0,0, 
seqno=9223372036854775807, start=0x005584e8400000, end=0x005584e8410000, 
size=65536
[   51.389935] xe 0000:00:04.0: [drm:xe_svm_handle_pagefault [xe]] ALLOC 
VRAM: asid=1, gpusvm=0xffff8881775e9188, pfn=3126960, npages=16
[   51.390048] xe 0000:00:04.0: [drm:xe_svm_invalidate [xe]] INVALIDATE: 
asid=1, gpusvm=0xffff8881775e9188, seqno=3, start=0x00005584e8400000, 
end=0x00005584e8410000, event=6
[   51.390440] xe 0000:00:04.0: [drm:xe_svm_invalidate [xe]] NOTIFIER: 
asid=1, gpusvm=0xffff8881775e9188, vram=0,0, seqno=9223372036854775807, 
start=0x005584e8400000, end=0x005584e8410000, size=65536
[   51.390948] Oops: general protection fault, probably for 
non-canonical address 0x3fff88842fc80000: 0000 [#1] PREEMPT SMP NOPTI
[   51.391624] CPU: 1 UID: 0 PID: 76 Comm: kworker/u17:0 Not tainted 
6.13.0-rc4-drm-tip-test+ #48
[   51.392088] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), 
BIOS 1.15.0-1 04/01/2014
[   51.392527] Workqueue: xe_gt_page_fault_work_queue pf_queue_work_func 
[xe]
[   51.392947] RIP: 0010:zone_device_page_init+0x5d/0x240
[   51.393228] Code: 04 dd ff e8 d5 d2 a1 00 5a 85 c0 0f 85 ba 00 00 00 
e8 d7 bb df ff 85 c0 0f 84 9d 01 00 00 48 8b 45 38 a8 03 0f 85 ec 00 00 
00 <65> 48 ff 00 e8 aa d2 a1 00 85 c0 0f 85 0d 01 00 00 48 c7 c7 20 cb
[   51.394247] RSP: 0018:ffffc9000039fb48 EFLAGS: 00010246
[   51.394570] RAX: 4000000000000000 RBX: ffffea000bedac00 RCX: 
0000000000000000
[   51.394950] RDX: 0000000000000046 RSI: ffffffff824c67b4 RDI: 
ffffffff824e58f5
[   51.395328] RBP: ffffea000bedac08 R08: 0000000000000015 R09: 
0000000000000004
[   51.395709] R10: 0000000000000001 R11: 0000000000000004 R12: 
0000000000000001
[   51.396093] R13: ffff888170fd8d40 R14: ffff88817f922640 R15: 
ffffea000bedac00
[   51.396472] FS:  0000000000000000(0000) GS:ffff88842fc80000(0000) 
knlGS:0000000000000000
[   51.396925] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   51.397237] CR2: 0000563d1f7ecbe4 CR3: 000000017c212000 CR4: 
0000000000750ef0
[   51.397618] PKRU: 55555554
[   51.397768] Call Trace:
[   51.397904]  <TASK>
[   51.398024]  ? __die_body.cold+0x19/0x26
[   51.398238]  ? die_addr+0x38/0x60
[   51.398420]  ? exc_general_protection+0x19e/0x450
[   51.398678]  ? asm_exc_general_protection+0x22/0x30
[   51.398942]  ? zone_device_page_init+0x5d/0x240
[   51.399188]  ? zone_device_page_init+0x49/0x240
[   51.399433]  drm_gpusvm_migrate_to_devmem+0x379/0x9e0 [drm_gpusvm]
[   51.399768]  xe_svm_handle_pagefault+0x62c/0xa60 [xe]
[   51.400110]  ? xe_vm_find_overlapping_vma+0xa4/0x1d0 [xe]
[   51.400475]  pf_queue_work_func+0x1ba/0x450 [xe]
[   51.400777]  process_one_work+0x1fe/0x580
[   51.400996]  worker_thread+0x1d1/0x3b0
[   51.401201]  ? __pfx_worker_thread+0x10/0x10
[   51.401433]  kthread+0xeb/0x120
[   51.401609]  ? __pfx_kthread+0x10/0x10
[   51.401813]  ret_from_fork+0x2d/0x50
[   51.402008]  ? __pfx_kthread+0x10/0x10
[   51.402211]  ret_from_fork_asm+0x1a/0x30
[   51.402427]  </TASK>
[   51.402551] Modules linked in: xe drm_ttm_helper gpu_sched 
drm_suballoc_helper drm_gpuvm drm_exec drm_gpusvm i2c_algo_bit drm_buddy 
video wmi ttm drm_display_helper drm_kms_helper crct10dif_pclmul 
crc32_pclmul e1000 ghash_clmulni_intel i2c_piix4 i2c_smbus fuse
[   51.403779] ---[ end trace 0000000000000000 ]---
[   51.404106] RIP: 0010:zone_device_page_init+0x5d/0x240
[   51.404393] Code: 04 dd ff e8 d5 d2 a1 00 5a 85 c0 0f 85 ba 00 00 00 
e8 d7 bb df ff 85 c0 0f 84 9d 01 00 00 48 8b 45 38 a8 03 0f 85 ec 00 00 
00 <65> 48 ff 00 e8 aa d2 a1 00 85 c0 0f 85 0d 01 00 00 48 c7 c7 20 cb
[   51.405408] RSP: 0018:ffffc9000039fb48 EFLAGS: 00010246
[   51.405725] RAX: 4000000000000000 RBX: ffffea000bedac00 RCX: 
0000000000000000
[   51.406110] RDX: 0000000000000046 RSI: ffffffff824c67b4 RDI: 
ffffffff824e58f5
[   51.406518] RBP: ffffea000bedac08 R08: 0000000000000015 R09: 
0000000000000004
[   51.406905] R10: 0000000000000001 R11: 0000000000000004 R12: 
0000000000000001
[   51.407312] R13: ffff888170fd8d40 R14: ffff88817f922640 R15: 
ffffea000bedac00
[   51.407691] FS:  0000000000000000(0000) GS:ffff88842fc80000(0000) 
knlGS:0000000000000000
[   51.408135] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   51.408484] CR2: 0000563d1f7ecbe4 CR3: 000000017c212000 CR4: 
0000000000750ef0
[   51.408877] PKRU: 55555554
[   51.409047] BUG: sleeping function called from invalid context at 
./include/linux/percpu-rwsem.h:49
[   51.409528] in_atomic(): 0, irqs_disabled(): 0, non_block: 0, pid: 
76, name: kworker/u17:0
[   51.409976] preempt_count: 0, expected: 0
[   51.410212] RCU nest depth: 1, expected: 0
[   51.410435] INFO: lockdep is turned off.
[   51.410648] CPU: 1 UID: 0 PID: 76 Comm: kworker/u17:0 Tainted: G 
D            6.13.0-rc4-drm-tip-test+ #48
[   51.411180] Tainted: [D]=DIE
[   51.411338] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), 
BIOS 1.15.0-1 04/01/2014
[   51.411859] Workqueue: xe_gt_page_fault_work_queue pf_queue_work_func 
[xe]
[   51.412269] Call Trace:
[   51.412404]  <TASK>
[   51.412525]  dump_stack_lvl+0x69/0xa0
[   51.412724]  __might_resched.cold+0xe5/0x120
[   51.412956]  exit_signals+0x1a/0x360
[   51.413150]  do_exit+0x122/0xbd0
[   51.413328]  ? __pfx_worker_thread+0x10/0x10
[   51.413562]  make_task_dead+0x88/0x90
[   51.413783]  rewind_stack_and_make_dead+0x16/0x20
[   51.414045] RIP: 0000:0x0
[   51.414191] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
[   51.414595] RSP: 0000:0000000000000000 EFLAGS: 00000000 ORIG_RAX: 
0000000000000000
[   51.414993] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 
0000000000000000
[   51.415369] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 
0000000000000000
[   51.415746] RBP: 0000000000000000 R08: 0000000000000000 R09: 
0000000000000000
[   51.416123] R10: 0000000000000000 R11: 0000000000000000 R12: 
0000000000000000
[   51.416501] R13: 0000000000000000 R14: 0000000000000000 R15: 
0000000000000000
[   51.416899]  </TASK>


On 12/18/24 1:33 AM, Matthew Brost wrote:
> Version 3 of GPU SVM has been promoted to the proper series from an RFC.
> Thanks to everyone (especially Sima and Thomas) for their numerous
> reviews on revision 1, 2 and for helping to address many design issues.
> 
> This version has been tested with IGT [1] on PVC, BMG, and LNL. Also
> tested with level0 (UMD) PR [2].
> 
> Major changes in v2:
> - Dropped mmap write abuse
> - core MM locking and retry loops instead of driver locking to avoid races
> - Removed physical to virtual references
> - Embedded structure/ops for drm_gpusvm_devmem
> - Fixed mremap and fork issues
> - Added DRM pagemap
> - Included RFC documentation in the kernel doc
> 
> Major changes in v3:
> - Move GPU SVM and DRM pagemap to DRM level
> - Mostly addresses Thomas's feedback, lots of small changes documented
>    in each individual patch change log
> 
> Known issues in v3:
> - Check pages still exists, changed to threshold in this version which
>    is better but still need to root cause cross process page finding on
>    small user allocations.
> - Dropped documentation patch, fairly large rewrite and will send out
>    independently once finished.
> 
> Matt
> 
> [1] https://patchwork.freedesktop.org/series/137545/#rev3
> [2] https://github.com/intel/compute-runtime/pull/782
> 
> Matthew Brost (27):
>    drm/xe: Retry BO allocation
>    mm/migrate: Add migrate_device_pfns
>    mm/migrate: Trylock device page in do_swap_page
>    drm/gpusvm: Add support for GPU Shared Virtual Memory
>    drm/xe: Select DRM_GPUSVM Kconfig
>    drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR flag
>    drm/xe: Add SVM init / close / fini to faulting VMs
>    drm/xe: Nuke VM's mapping upon close
>    drm/xe: Add SVM range invalidation and page fault handler
>    drm/gpuvm: Add DRM_GPUVA_OP_DRIVER
>    drm/xe: Add (re)bind to SVM page fault handler
>    drm/xe: Add SVM garbage collector
>    drm/xe: Add unbind to SVM garbage collector
>    drm/xe: Do not allow CPU address mirror VMA unbind if the GPU has
>      bindings
>    drm/xe: Enable CPU address mirror uAPI
>    drm/xe: Add migrate layer functions for SVM support
>    drm/xe: Add SVM device memory mirroring
>    drm/xe: Add drm_gpusvm_devmem to xe_bo
>    drm/xe: Add GPUSVM device memory copy vfunc functions
>    drm/xe: Add Xe SVM populate_devmem_pfn GPU SVM vfunc
>    drm/xe: Add Xe SVM devmem_release GPU SVM vfunc
>    drm/xe: Add BO flags required for SVM
>    drm/xe: Add SVM VRAM migration
>    drm/xe: Basic SVM BO eviction
>    drm/xe: Add SVM debug
>    drm/xe: Add modparam for SVM notifier size
>    drm/xe: Add always_migrate_to_vram modparam
> 
> Thomas Hellström (3):
>    drm/pagemap: Add DRM pagemap
>    drm/xe: Add dma_addr res cursor
>    drm/xe: Add drm_pagemap ops to SVM
> 
>   drivers/gpu/drm/Kconfig                     |    8 +
>   drivers/gpu/drm/Makefile                    |    1 +
>   drivers/gpu/drm/drm_gpusvm.c                | 2220 +++++++++++++++++++
>   drivers/gpu/drm/xe/Kconfig                  |   10 +
>   drivers/gpu/drm/xe/Makefile                 |    1 +
>   drivers/gpu/drm/xe/xe_bo.c                  |   20 +-
>   drivers/gpu/drm/xe/xe_bo.h                  |    1 +
>   drivers/gpu/drm/xe/xe_bo_types.h            |    4 +
>   drivers/gpu/drm/xe/xe_device_types.h        |   15 +
>   drivers/gpu/drm/xe/xe_gt_pagefault.c        |   17 +-
>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |   24 +
>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |    2 +
>   drivers/gpu/drm/xe/xe_migrate.c             |  175 ++
>   drivers/gpu/drm/xe/xe_migrate.h             |   10 +
>   drivers/gpu/drm/xe/xe_module.c              |    7 +
>   drivers/gpu/drm/xe/xe_module.h              |    2 +
>   drivers/gpu/drm/xe/xe_pt.c                  |  393 +++-
>   drivers/gpu/drm/xe/xe_pt.h                  |    5 +
>   drivers/gpu/drm/xe/xe_pt_types.h            |    2 +
>   drivers/gpu/drm/xe/xe_res_cursor.h          |  116 +-
>   drivers/gpu/drm/xe/xe_svm.c                 |  948 ++++++++
>   drivers/gpu/drm/xe/xe_svm.h                 |   83 +
>   drivers/gpu/drm/xe/xe_tile.c                |    5 +
>   drivers/gpu/drm/xe/xe_vm.c                  |  375 +++-
>   drivers/gpu/drm/xe/xe_vm.h                  |   15 +-
>   drivers/gpu/drm/xe/xe_vm_types.h            |   57 +
>   include/drm/drm_gpusvm.h                    |  445 ++++
>   include/drm/drm_gpuvm.h                     |    5 +
>   include/drm/drm_pagemap.h                   |  103 +
>   include/linux/migrate.h                     |    1 +
>   include/uapi/drm/xe_drm.h                   |   19 +-
>   mm/memory.c                                 |   13 +-
>   mm/migrate_device.c                         |  116 +-
>   33 files changed, 5061 insertions(+), 157 deletions(-)
>   create mode 100644 drivers/gpu/drm/drm_gpusvm.c
>   create mode 100644 drivers/gpu/drm/xe/xe_svm.c
>   create mode 100644 drivers/gpu/drm/xe/xe_svm.h
>   create mode 100644 include/drm/drm_gpusvm.h
>   create mode 100644 include/drm/drm_pagemap.h
> 

