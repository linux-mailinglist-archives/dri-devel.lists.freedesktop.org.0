Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A724A83869
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 07:31:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44EA310E2A5;
	Thu, 10 Apr 2025 05:31:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VQHJZ8ez";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10FB310E0E3;
 Thu, 10 Apr 2025 05:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744263097; x=1775799097;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ew9+17eTIOCl+Dd2f7mVZhYAFDzkj9AEi3QT0AvkVA0=;
 b=VQHJZ8ezN2TvVJBsZPatGnS7GcEDlBjU3VHXBC59Jw66xZkAVS1duqL5
 8fKTu5VNoBnGSQF9CTJxS1olQeIoXRo3qqhpsgt9eRsCPl216ttL3Ikzl
 +uHoPCGjDLbBqxRPsiKuZQaGRFApjoMGBsOi+7xxa9tMjwmmGquC3NaH0
 bjdFJ2mh+MgHvxvvmMnEWsqO7XdNqqyC0h/cWKRZ4abmrkC6xeTkZAHgh
 gDnInHRaqRwzQAF862eCpNxsNZPlljz7eveRwFCfeiN75DURU5lWNWMU6
 wLoYr9AQtnk+tgNqrXdHhfiOWFhzHCeTRnL/a/lljP7DZQA59tjsmyGO6 w==;
X-CSE-ConnectionGUID: YnfZfgIWQ9SRmu/lMbmXow==
X-CSE-MsgGUID: eEV9zGYnSsyU7XSGAj2XxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="45652396"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="45652396"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 22:31:37 -0700
X-CSE-ConnectionGUID: CPX+G12uTXSeCGQXEWSf9Q==
X-CSE-MsgGUID: Elfbjon4T5KEaXMjwB6IBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="132926841"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 22:31:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 9 Apr 2025 22:31:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 9 Apr 2025 22:31:36 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 9 Apr 2025 22:31:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aDcmAOf7uzOyMYBbSsAtmeO9KKGyew9v4asZ2wZqDea7S03WQD0nPoDTDcrQYPZDkLhKWAoeVJaVZQvb38PgIpP6s93VkC6SLZocjnamVFmLL/LDqgaOQ5lvMR19U1W3Wv9905RWSqZVZTziuma08qhSLdRH7iaPXyrRuD1VStAIN2J9gQJdU7Cf1gA+/RdDr8PQ0GKnlmQfn1FSQq9ev68LWofLNyOiT2T6fe0PCmSJ3InG4fTPGxKvmOerizyD8DOgoVdxd1ey0TBT2+aoj1hXgcvMDkm42KQYYAo4pGKw2qMgBUIJS+pgS2hH0U1R4b2lp1pKLihM3om2VQALCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hO7DR/L85eb6rmPrQoHfKC8alTw0qWRIGsGwvwAruw4=;
 b=R/Qdj+RW4/c7NmvACwOgEhwDudJcFLxpKJFkZkmGoZxQF5uyDyFbOl0ge0QxYZ/Ur364SqFsNlVCoXQZQeKVrl8ogzJfL03Ss/xnikcbdl2wkcjGxMNgXpL1E5Vp6cNpY3rE/Wx3ETfak17JQOb1hqC0rCjD2sIMikmnoiftkcFJzwQ+7cPrWWfNAMWmhRK7XIuHsPldshuTVIYbo2Lo+JFm6J6N3gvZrz1Rqog1odJo4ePvD9ewDZFtuFwz//rmdcw6Htdola3RxBkrf4D263GXL47FDOfmp+1S/GaUtZdEds8CNEq4x+BvPws8eTreGKPV1/TTERw7x8K+NZgh+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by DS0PR11MB7902.namprd11.prod.outlook.com (2603:10b6:8:f6::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.33; Thu, 10 Apr 2025 05:31:07 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%5]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 05:31:07 +0000
Message-ID: <235edcca-5322-4257-909a-c09e0e908366@intel.com>
Date: Thu, 10 Apr 2025 11:01:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/dp: Add smooth brightness register bit definition
To: Suraj Kandpal <suraj.kandpal@intel.com>,
 <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
CC: <arun.r.murthy@intel.com>
References: <20250408050138.2382452-1-suraj.kandpal@intel.com>
 <20250408050138.2382452-2-suraj.kandpal@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250408050138.2382452-2-suraj.kandpal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0180.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::18) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|DS0PR11MB7902:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ce4e843-0d37-4db7-f0a0-08dd77f0e499
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UzVQWFdJUXR3RVNFSFN4cFlhSVFjckRWbkpkaGNOSE1zd1NoSXcrRjJrOVdT?=
 =?utf-8?B?Z29IUW5BaGZUMURLTi9hL21aWlpPaVZmamZpalRwemZ4Rk94dE5GL09rYlRx?=
 =?utf-8?B?a1JWQnRCZ0JKcjBSRFZuQTNtVUNUL0NTTlk4Nm5Ham1Id2hWWmFxVVg4V3FK?=
 =?utf-8?B?dk1RNWhpaStDS1JFRkFDSE85cE9CV1JHZUQyclZYQldBdUFoNTEyc3BFQ3RN?=
 =?utf-8?B?OWNCNzBBM2hTWjM3NW5QUkI4cFV6UG8rYkZQbldidnp0MDFkNFlhWDJvc2cw?=
 =?utf-8?B?N0RqN1Z5S0VNLy96Y1V0b3JnK0d5MDZ6Q0pKUXZlWFUxcnNWckJtWU1ZcmhU?=
 =?utf-8?B?K2JTaXZHazBLRXZZZ2g2UFo0YStpQlJpQkE0Rk44bjB6S3ZiZ1FsRTAydTk0?=
 =?utf-8?B?YmNOSlJ2bTBIajF3NTZFV1NFaGlCT2Nhekh4djBrTi9nTDdra0NKdDNBSkNZ?=
 =?utf-8?B?YXJkK3dDd0Fib2Q5VjVqeVhVSTJqNHNKMUxZZjl1Y1JXK1RRY2pmeGdMZkNl?=
 =?utf-8?B?MWJWRzFzUHh1ZkMreXZrTTFjcHkyYmlJNW03MlNtdllDbEJkaEM2L0QwOUZ6?=
 =?utf-8?B?TlJRODFTUnNJR0RqY29USk9KcmtvMmgzdG4yeW13aDA4anY4eHVmMjN2OWhR?=
 =?utf-8?B?V3pnZHhoV0JHMkZ4anZvQWszSFBaMldON3lQTFBTNVk4ajhjSEsyWHkxYWpn?=
 =?utf-8?B?MXF6VEM5TkZKa3pwWWRsT0ZTNnJzSkwralhBWWp2RWo1aUwzdk5oSUFUOHA0?=
 =?utf-8?B?RFM5M0N0UFB1U1I2VFVxYy9sWjdnL2UveDNuM3I4d3dRd3BHSVN1c2pzOEVw?=
 =?utf-8?B?eWo0UytSZngyNDdaSTYzTzlucGthRWk3dTV3TWlOa29aUWZnbjA2OE1qNXYx?=
 =?utf-8?B?ZUFwdUhBa3FOZzlDaHV3OGdQbmFxTGZ3eVBHWWFEckVTdnZQNzJvMnorbFVP?=
 =?utf-8?B?Qm9QWU9xRWNMbHZoUC93eVovWmc3cFpyNU0zNmE4eDU0UURLRmJMN011TUdS?=
 =?utf-8?B?Ym5McExrRFFNSHdXK3pERTJ5NHBRS2lwV09LR2RPalM5MEtwb3pmUHVSbTMy?=
 =?utf-8?B?bWJ2MUhGRWJxZnFSb09zU0VFcXlEZng3OWVHRzh2eEdMMGt3SW8xd3o4bWl6?=
 =?utf-8?B?TU1zU1FhS3hJbGZZZHoxY3BKMUcyYU9MK2lDV1NHOHY4YXhka2UzT0RmaHlQ?=
 =?utf-8?B?UmN3cGZSaU5ScXQxciszVWNlaG54eDY3MysyNDFleFZDQzVNZGJqaVBMMVZI?=
 =?utf-8?B?YnowUlJhVlRkNTdrTEpZQzY3Rlhad01BTENQL2NybjgvMjQ1V1NFYkhJRGor?=
 =?utf-8?B?ZG9ETmNyRlMwNEpBbEVDUktRaHAydW1neGJnZnJrRXJKMFJlWmxYR3VEajNO?=
 =?utf-8?B?cnpsNWs0UENnUUx6cFVYcDNwTmtPRjQ3d21jekFRLzVmZGlQUWdMTVBKb2VQ?=
 =?utf-8?B?SjFBcndubEVHVDVNL1ZreVRpYkxGaUZCL3l5RjUwQWp0eTkwZGx6UVBhc256?=
 =?utf-8?B?Umkza2QzK1lKOG03SzQrUVpjSVdzOGw2akRhdGp4UjcvL216aWV6bTRZU0x3?=
 =?utf-8?B?UzNzQWh0SlZaTWdaS1BjMnp2NUxYclVFazlhL2NUeDYrMXp6NWZ4R3RxdWZ0?=
 =?utf-8?B?TmJqVmx1UDRZblc3d3F0d0d4bkVNdXpjM25mVnVRQ3ZSYzhXNmRNTTZXemlh?=
 =?utf-8?B?OWFlL2xQUmdOR2tBRmlibC83NkhZOUY3WW5pVzU5NldOQ1N0amlTQk1rMzFH?=
 =?utf-8?B?SEVNd1FsY1Vkc3E0RW4xY3NIL0ZOSzJ6eFJnMmw1OFQ1eVBiM0VGT0JSZ0dG?=
 =?utf-8?B?OFQyRjYvTFFQbzlPWWUxbmp0Mnp0RUYwVEZNd0twb1c3T01MM0JKN1JMdmlR?=
 =?utf-8?Q?3zxDKoljxm9+3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGNTbWx2d2M5dlczMG1hMmt1ODI3VWlXWWdqcm1Wd3JhdXRqdDZOUG5vYm1p?=
 =?utf-8?B?WlNvallsTGZJSXpRdXBXVnUxSTl1VURHalpKck5QU1N4Uy8vN1lJekVOMEl5?=
 =?utf-8?B?Rzhsa2RqaHdpV2QvZmJQK1lCalRIU2IvZVl1R0RwOXBTK0gyeHBzSlNKSkx6?=
 =?utf-8?B?YllvbStDVXYxZ2NjcG5LckRTaUlVaUZYS0hhUVFBbjl1REdaaHV4UVpMYnZu?=
 =?utf-8?B?SXRYeE0yaVQwMnBISXYyZGNCRjlCQXRJaFREb3ZNMEQ3Q0d6cVFIQW84bGd4?=
 =?utf-8?B?UU1FVHJWUEhUV0I2NmxWZTIrY1hGL3VNM1JoOU9tQitYL2VFcFBmMWpHeHJY?=
 =?utf-8?B?WERlV0dteHN1NDBIOUJUbVZhdUoycVdPYWpWMzdRdmNnV1NXcFpuMzdzMDJU?=
 =?utf-8?B?a0lkN0lCUHJ3M2k2Ukc4V1M0Y2hqMitNb1duTzEwdjduTnpKaU91cDBPRjBS?=
 =?utf-8?B?UFZ4WEpCZmErMVMwU3ZWaDYvMDU4TEk3cHFHRHVBSXMzWXJoMW5RaFVWZU1o?=
 =?utf-8?B?QTlkTS85eHdER1FYeSsyS1lSV3c5VzEwazB2N0FLYWNNalQ0dXdJVmhkTnZN?=
 =?utf-8?B?NDc0Z2paSFNhOUQ0OXZXYnI5REVnTHNyYmk1MmdBSElKKzUwN3BFNElVdXdL?=
 =?utf-8?B?VDloWU81a00xcGVTMC9xUlF2ZUVNRis1VXlibTIwVE83djJFcHBsaGFJdkpK?=
 =?utf-8?B?bncrcVpRY2N5UHZZbzVyK1liYm5RT25EMzllTWhodUdqaDhyZlQ0ZmU0VVpw?=
 =?utf-8?B?UlVHNENveVJUNGwzT2IwS3VGQmw4TjZjeVdXWno1RVhLTjRZQ0gzWElLVWl4?=
 =?utf-8?B?dVNnNnJQU01HbmFySWtpbjFCV093ZTNQN003aGZXdHo2cEszU05QL0toU09P?=
 =?utf-8?B?cDkzb0UwMVYwcWxxNGRiMHVtYzltMEdXSURid0JZNEdQMzVNTGszUEkvaEoz?=
 =?utf-8?B?OVozcVFNQnRvbFRtVzV4WFdINTd6Ry9vNHI2bUdrbDJ0RGhHNEh3dnpFOHRY?=
 =?utf-8?B?WWltckFmZlNtLzFwZGFaSlhVbEFML3k3VGpjWmdSeTlQeU9nSEViQUh0T3lR?=
 =?utf-8?B?WnFpZDRYeW5qRFJNOVJKeWE4TEVaOWVOQi9NaVFDcDVHM1JSZnZWNmdudjc5?=
 =?utf-8?B?bkVEOGQzTnFBQjJ1TUVLV3gyK1Y1a3dYN3V5c0dycnRVb2JSU0tQSTFDOGJL?=
 =?utf-8?B?UkVNbEl2eXk4cWRXaEUxN2tlL0J6am5FRHRFQ2JSZWV6T2J5N1ZPcE4rdytM?=
 =?utf-8?B?ZzErbVYwS2VMSHJwTlFRYzFhZk90VzZ3NDhQWVNMSzdjSWFLL1RQMWZTR3lP?=
 =?utf-8?B?cEIzVVRaRzFHbndhRHExcUlob2lDODlVN09odUJuWm1IQW9CWWpJajVXYjdS?=
 =?utf-8?B?N3NIMmNtQzJBZFEramhzZURIdGlVbW9sZjUyVHVOc0tJQmovTjNIZ2l2SUl3?=
 =?utf-8?B?Q0MvamRXb3JSTXZvQ01CbjJJTHFWTndSSlljM3I3MVZyMUFaYWtFS0NieXBq?=
 =?utf-8?B?ZmtRMEJPUG10L1Rtd1QwczVudzlTWkhXU3JXNGFNVk9VNU5oLzRia1NUNG9Z?=
 =?utf-8?B?RnZReWRhK0M1d0M4RlhRRmVwaFFPVXRzZmI1ak0zWWJGV2dPdHpwY2ROdndx?=
 =?utf-8?B?ZkpoOUlPR3pFUGVBVUd2OU0vV3d5ZTB2S2xKWjR1eFhZcWE5dTlTa0ZnWFlF?=
 =?utf-8?B?ZmNGUG41Yms3S1UxbXNiM2U5ODJUUmRsNGVCNWZLSUUxVTNaRDV6UXI2ODBs?=
 =?utf-8?B?YmJHNERRdjF3d1RvNnhpMGs1SVhkUmg0YlNJMUN3aWNSOW91Y3JwNnljN0dX?=
 =?utf-8?B?WHhoN2l3SDRGWHV3OHpNYXZSVnBYM0NyOFpiSGtlZHJKa2Z4UmtCUFI1UWY5?=
 =?utf-8?B?bkdxR0d3VXh1TlR5aHlYRVlCeVlmSU9Sa2c2OVUrYXQwRFQ1S2FVSEdhL0Uw?=
 =?utf-8?B?d3FwS2dLQlNjVnFWZVVkbDdDSEZoNTdQYzhNOE1NK21WSTRvenFqbW1wVkhW?=
 =?utf-8?B?Z1NvRlJPb0VTRGgvQ3hNdDVrYnhsYklTa0FuMGNnTjltcTBqaXBtbUVXSVZZ?=
 =?utf-8?B?RjdiRVFIV3JlYzhyYkQzRHUvQVFqWk9ZTTV5NEU2VjlsYmQxeGlFWkRwYXI1?=
 =?utf-8?B?UUJDR1VUWjhpRU1pa1ZvUExVbVlOZlVjZUQrNEZTb1VKUW5SQ3lkOTRhT1o3?=
 =?utf-8?B?N3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ce4e843-0d37-4db7-f0a0-08dd77f0e499
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 05:31:07.1789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +RYQtSc2EHTj9pboir4DAKp7VRddWVorOcXA0K83xwxl3N89TzvJCY5zmoBGs01vrGhp/Qghb7JXWZ4ZmHZe7q/PNfoy5E6GiZvEqF/E28E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7902
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


On 4/8/2025 10:31 AM, Suraj Kandpal wrote:
> Add DP_EDP_SMOOTH_BRIGHTNESS register bit definition for
> EDP_GENERAL_CAPABILITY 2 register.
>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>   include/drm/display/drm_dp.h | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index c413ef68f9a3..ecf8b8d7b1f5 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -1025,6 +1025,7 @@
>   #define DP_EDP_GENERAL_CAP_2		    0x703
>   # define DP_EDP_OVERDRIVE_ENGINE_ENABLED		(1 << 0)
>   # define DP_EDP_PANEL_LUMINANCE_CONTROL_CAPABLE		(1 << 4)
> +# define DP_EDP_SMOOTH_BRIGHTNESS_CAPABLE		(1 << 6)

Perhaps add eDP 2.0 in comments, as this Bit seems to be added in eDP2.0.

Regards,

Ankit

>   
>   #define DP_EDP_GENERAL_CAP_3		    0x704    /* eDP 1.4 */
>   # define DP_EDP_X_REGION_CAP_MASK			(0xf << 0)
