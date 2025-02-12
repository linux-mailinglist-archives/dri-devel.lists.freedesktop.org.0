Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDB5A3295E
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 15:59:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC1410E8D4;
	Wed, 12 Feb 2025 14:59:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ki8+Werp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA37110E8D4;
 Wed, 12 Feb 2025 14:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739372371; x=1770908371;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=6ycZSjF8PUIYGKkYNzu78+54P/qJt2NWUvnn5uWNrM0=;
 b=Ki8+WerpmmWjJCa3zPLc8ycNqQBTiUoEjkKlJIgbapQ+6kXcSUvZNk47
 IHxPojozPWSeTiN4R1hgIW+lt18ZtmnJUuf9xW/X2WF4RPYy3WMIMGPNm
 rkXs6jNovC/0wdanNV6fC3aGtAcZhUkzNkH8ordfEizbVE+rs8Zq8IERx
 wbP2Pktl+aXhzR7IN3dHghjNGGkuTRufkLSS40wzuRsYTZAHviHJ/P1YF
 Pty5sp4w2QA7zD75T+VQ364FPlvrZD+ffry38hw0+SxHX/LmGbtByHALj
 kNaPZjcA/MqsUh/Nh01UTpcJEw57/IGW8nPBXBqQoy9DjK+WP8R70+8VS Q==;
X-CSE-ConnectionGUID: a/Pdo5xjRwujIIdiRogXHw==
X-CSE-MsgGUID: Jp87s/CRQJuX/UT2w0Clog==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="50677097"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208,217";a="50677097"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 06:59:30 -0800
X-CSE-ConnectionGUID: MDD0aZUzTrC+UXtE/DV0cw==
X-CSE-MsgGUID: 9nItqEcyTMKa0tXhC5gxzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
 d="scan'208,217";a="112690222"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Feb 2025 06:59:30 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Feb 2025 06:59:29 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 12 Feb 2025 06:59:29 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Feb 2025 06:59:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qwMTjIhhTpY+f4N4qICCXs3O2Mup/5TgMRYqxnHP3dEzkPTX4wJmq+rb8nN/M+mU7pWt0w9v6j8rt+5YuaccnRsD1winlu9tWLccqn0j2hYJsOWvnOkVH8XcU0ZYRE7W6APXPZuPtTalw+nH3tdHSSaXv5uGRB8DnJ7sOpt6wY0GMQ1GYWUmIKQ67SE+poPaksn+INM/aJzSoTnlS3VBvIgNMHmNG5ys/LA9r9MOY01F6HKyAz8J38HNtwWzBgbiYvBXN00vStvs7Ix49CTG+QWhyFYCNhvgvmkFTPiBG+z1maKcluZCjEX1+YOUz8E/BLynBcAxnfr68dA4b6SsAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iqvLHT0m5doj18ZcSk68pH5DkJhkADTn64Q9RVN9JQ8=;
 b=cEn77FkiN8qphxwnEQRC7hbpVQIaTQ0yETU7ru8//oDQR9tFoRO5s/4P1c8VplVEWaeaMGkBQDDBGd2ScMr7wWm2V4uXn9Q8MBK4SYvzTBWdNXCeMFsXqY+WsDuSgfI4NqHBxi9LYQEEynGw0sXZodXcFwsabgL1qZmCxATMdkfAUPBAJcyHytkD6sbzj6Exw/D9qMHdDCBrv48iciR2MQh7pawl/KvPBmcfaYQTb5rb3O50BrW5TI//Hwm7me1/AB6+5aAkDUwW8PqR7puG/0qrKPqTHuM/8Xp5zRsCFpNez8ncwNVBh0bQNVnSb6olBIblZAHel8sFm4JreGAobQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by DM4PR11MB5231.namprd11.prod.outlook.com (2603:10b6:5:38a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Wed, 12 Feb
 2025 14:59:11 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%5]) with mapi id 15.20.8445.013; Wed, 12 Feb 2025
 14:59:11 +0000
Content-Type: multipart/alternative;
 boundary="------------xocyPuZb2mHF3UXOFSz3r5Yk"
Message-ID: <4e4aefb6-829d-4cc4-ac35-dc796941b0b7@intel.com>
Date: Wed, 12 Feb 2025 20:29:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] drm/i915/display: Add i915 hook for
 format_mod_supported_async
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Syrjala, Ville" <ville.syrjala@intel.com>
References: <20250205-asyn-v4-0-9a5b018e359b@intel.com>
 <20250205-asyn-v4-3-9a5b018e359b@intel.com>
 <SJ1PR11MB6129BE6565855F8756C9AF8CB9FC2@SJ1PR11MB6129.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <SJ1PR11MB6129BE6565855F8756C9AF8CB9FC2@SJ1PR11MB6129.namprd11.prod.outlook.com>
X-ClientProxiedBy: MA0PR01CA0094.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::20) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|DM4PR11MB5231:EE_
X-MS-Office365-Filtering-Correlation-Id: 4649a835-7c07-4884-5dda-08dd4b75cea6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|8096899003|7053199007|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NUViWmRTeURNUFVWUDZjekUyVVV2WUl4Tnp5ZGRkUGtLV1JWdnIydFZxRTJj?=
 =?utf-8?B?R0wzODBFaXI3MGh4emt2QXNIOVFRZnRJM0FxdVlIWitpc1NsV3lhbThrY3cz?=
 =?utf-8?B?UFp3R3U3b294TkZtNkNaVGNNaUhQUmEzRCtCWjk1SWVnOGFhOUp1aHdDVnp6?=
 =?utf-8?B?VnNpOGhicW4weEFVV2NMZXBlR0w0SStKcFFrMHNaYTRpU3pBdVlENDdSclpy?=
 =?utf-8?B?clFHc2ptNlZ1eThQeU5ITTBPc1hoYlNublhWSUR5Ny9sYmxJM3dVazdrbm1M?=
 =?utf-8?B?VEh1U3JKaGMxdHczWkVzWHVVWEdwaWlFK1UxeEhtaTZyRUkydG1RV0duMnpF?=
 =?utf-8?B?d0dHQW4vekRYNUFlVy81T0FkUkFuS0tVVVQxd052RFRDTVU5cHBXTmdwcWQw?=
 =?utf-8?B?aEI5VG9oWnN2b20wUWJxUkFQKytHT1RKT1BQMnh5K1VvQUpVNzlPL3d0eHVx?=
 =?utf-8?B?RHhIY3pDTlczRGxMSUh6djh0a2o1SUEvK2hTK1RSdXBBMEEwRlhwaWdVYmFt?=
 =?utf-8?B?cWlROUZKR0tuaEl2YWlBeTBoVWJjM3FIOG0weExWTENxTjRDc2VRY3dld0U4?=
 =?utf-8?B?Q2tjOFo1ZUVFRkYwcExBVzJhR2NLRDVVQkFCdDdrUjFXbVAzb3NQZVJxd2l3?=
 =?utf-8?B?MlBEVDJaWEI0Y2xsYjdRTGp5UUdMVFQ4M0tydWRyVHdLWjU1RnRUSU0wV2Vj?=
 =?utf-8?B?ZDZXelRhdVJPUlo0WUZzeTRaeHJKbm9Ra1hnRDg3ZWRWamRVcnY4MGtyR01t?=
 =?utf-8?B?WnNiZ0Q0SE1hN2JScUJwUiszSEFQQVlGdmRMMGZCci9Vc0UyUU5wS3V1dlpz?=
 =?utf-8?B?aDJYa210RG1pN1JiSmlpSWcvdjUzRkxGQ2hYVStlRnM2eWxlWnRvUDBya0FP?=
 =?utf-8?B?UzdYTFQ5cHJvN0hlSUpTaDFNKzRZcjN4ZTFZdEF3Sy90R3JyYU1VUFo0UHpW?=
 =?utf-8?B?V0RJRXEzc1ZzU2haL1RFUnJiQUhVOVNNSGxPU0NlNU84TWUxbGRUSS9sa2hR?=
 =?utf-8?B?bytkYjZHZ01DYTk5WWZPT3ptSE9EOWc1Y2ZYREJ0Q3dqWEpUbTZLYi9aZ3Bn?=
 =?utf-8?B?Q1gvQzdYK3NUcVNKNFJhODcwVjM5eXNlQVhaMnErUzFVbU0wSmJXV1U0SVcx?=
 =?utf-8?B?WUhSMkxOcnRmTU9XcktiTXZkOTgzL0lTTVBZUnViazdkTHhaMGRXaGg5dk9T?=
 =?utf-8?B?V0toV2JHMEVGL1BiN0hvQS9EZytCeDBCRVZYN2lZNGtQY3RsZnFKR085UGR6?=
 =?utf-8?B?YlhYNkpBMGJOWkdCSHIrVDBkOStINzBHaEpMdUFnZXBYN1RBRWVWaFpNazEx?=
 =?utf-8?B?UEdqUURHTjhya2w5ajFEUU9DYjdlbU9MSEtzaStML0FFdkt3eHdoRkdGWTdD?=
 =?utf-8?B?clA5Qlh2cDErWG10Wjk5N3YvVXY1dkZJenYwUkRUSHo5K2gwNmpFV21qOHVj?=
 =?utf-8?B?V2pIYzJ5K2JqbUEyUTl3cEEza2daNlhUeXQyMGU0QmhXcStDWEg1VFJqKzVh?=
 =?utf-8?B?ektVTWl3aGFaZll6MlEyRXB2VXhKWnFjbmVUZEJtY1IxZ0hMWnEvTTZPamhw?=
 =?utf-8?B?TlVNRXF2UWQwWkFjdDZyaDNuUUl5VC8xZ1Biend1K0xQWmxVaUttTUdYb2dz?=
 =?utf-8?B?WDQyNWhaUDdid3kxTkdqK0RqM0lQUW9kVTYzL0lsQkNxSGFYUmF1VVBYS2xq?=
 =?utf-8?B?RjlFUGhGMVhUZkxMSnZzaEM0d3NBS1BGSlRaVUxXQno2N0U1cXNDZEljdWpI?=
 =?utf-8?B?OThBeHpoRnZuYlYzUjREWnBoTnc3aHMzNjFxc01aRlFWRDg1YXdIOExoUzlh?=
 =?utf-8?B?WnJnamliWDBYYU1uYmNzUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003)(7053199007)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3RRNEoxcFV1d0VBaGo3d29lYzNsY08xcmp5cW5iZFFEYVNpaDZUQ2w4VFNX?=
 =?utf-8?B?a0czQjdlalo1eHJhZ1U5ZlBzemRDNmVmeks1aFlqNEE1elQ3VFNITldscHRK?=
 =?utf-8?B?ZG5qdXlWeHRJTTF4Rnp2L2k5T1pKQ1pVZFJWa3h4ZmRJSUxJYjY4UnVZeG1X?=
 =?utf-8?B?SG9vNlRDNlRzZklDU0dJWVp3SUI0RkZINTFFcDRhVjRKYjFCYk9qdXNZZFMr?=
 =?utf-8?B?Q051Z1djTHdvaXNVcW1YV0haMTZqK3dKSW9NYm5VbEdpeGFOWHR6STU1V1px?=
 =?utf-8?B?SDJKNUJ0U1V3a3F0bGw2SmF2bUFnMmxobkN6eHlXdXRRUUdUcWNFeXRRQ3Rs?=
 =?utf-8?B?ak1PTm9kN1BSaU1aUjBaQWtvWE5LSzMrT1d1Rm94eFl4Z3FVU1JHbnRGY0Qx?=
 =?utf-8?B?dm9DM016ZzQ3VHlnSWJiaHRLQnJIUStQR2RJSUcyanAxc2t2K2JhckUrOWRG?=
 =?utf-8?B?R0hldTV0b2hJNzBTWExRb1c0TjBoTktQd0VUaVNONDBxdWpzbFArT1FyRk1J?=
 =?utf-8?B?RFZFM1dHUFhBUEsrNStFcjB0WGJ0Vkw5RnVCZnJLMGZDL1A3QkN1UWE1ak4x?=
 =?utf-8?B?SDJ0aXNlSjBxS2UvQXBQSkhnaTVpVGZCQlI3ajVadDl5MzdTaUFZalhHUU1Y?=
 =?utf-8?B?aForSG1xRDNGQ3NYa09QRGc1N3pvWitoUGxkZnRBM1d2blpETFMyRUJZbndR?=
 =?utf-8?B?dmgveHlWOHRvRUhueEpmVk5HdXJndzBkdE9CT1VNNEpJVElBU0h4bm9EemNB?=
 =?utf-8?B?R1JhTVFHc0FFRm1WV05pVUNvQklNZElOdGlmZzdtdi9jQkkrV09RNVFsSWdh?=
 =?utf-8?B?YXA1RXl0TkowTVVqZGs3eW43RUdEaVJYVm8wbHkvRytOeHpwaE4yTTFIWldh?=
 =?utf-8?B?elBOWGhFbURYL2hDdlhDWkwxNnZuMHUrcTBGbVYvSEsycGJZeTNyZEdueFM3?=
 =?utf-8?B?ZUVQZ01nWElnRkZDSmZBU0pKakRBejJsWXZ0WWJLd3pKMDVFb1ovYko0Qjhr?=
 =?utf-8?B?OVNFWVNCZTBUaXRDVHo3VkZMZC9KT3cvVGlrVnYrWTROQkU2QkliaFBDSWx3?=
 =?utf-8?B?Uk1aZXJOdGVIZEhDRmJMNjdaQTNhalFmOWFIYzlkZ2FSckpZemtDMTZJZTcy?=
 =?utf-8?B?c0I3NEYybXRLQ0h5RUxHMk50NkpVK2ZOWDNZV1ZRaDltMWQyNFBaS3dpS1Fz?=
 =?utf-8?B?NFVsRlY0YzRLSjRCSGdyOFo4dzIvRURVejR6MmF3Zm1TeGlkMS90anNNRytC?=
 =?utf-8?B?T2FzYmJ2VUV3WjZWcHl3MGsya3JuaHJPL2FQS3BCYmdvMDZieUU5Z3IrWFRy?=
 =?utf-8?B?cUlEejhmN29EeDVCYWY4M0tIY1ZPeWJuN1kwNlBRVjdLTEE2ZEdmUTFPazBl?=
 =?utf-8?B?UnVFaXBOWjBMc2JtSG1oM1VzN2RoNk5taVEzVzllaTNKOUd3QTl4SWxuNm85?=
 =?utf-8?B?d0w3dDJkSGJ3RHRGQW1SQmx1eXRNaVZWZXArUlJPOHdSTDZrMk5UZUFVMlVM?=
 =?utf-8?B?SUp2MG1YeEdVMkprVzNmeCs1ckZqQmhveUdYRzFhU1Jnb3NrZVR6TDJMUnUv?=
 =?utf-8?B?Q2ltaWpXL2lreFhTTDNNUjlqUVhXaDB0bGdscTUwMnNUK3B4RndkSUR4YUhU?=
 =?utf-8?B?bUdJc01WRWxJNGVqK2lwRXE2T0FEbVFlZVRIRVNFQ1EvVjR2cmsvY3Y0RVV6?=
 =?utf-8?B?eFZ1MnZCNVlvTXdGNnBKUEVIMVpsNFRiNk5XTXRmelgvb2N2RWZXaExvQjE2?=
 =?utf-8?B?dGp0QmphNDJUNzBNd3hsYVBTd0J6SVJSdWtWSkxBSUY3RVc3Sjk2YjlRa3ho?=
 =?utf-8?B?VkhCOGl2Z2h4Q05tbEtKZ0R3TngvdEYyN0hWZmFiK0NxZ2Q3YlU1TTRHNERX?=
 =?utf-8?B?cVcvSlM5OWRrSmZZSDB5SEJmaHRMM25VUGkvVFN5TWNkc0MyRmdDMFVORXZw?=
 =?utf-8?B?U3UvZ3dxVXFWSWlSRHNvejNJQ2hJa29XcmdIaEdDU0sydXQ1MFQ1R3ZLQ1dk?=
 =?utf-8?B?WTdtdFZ2R2VWbCtJQjlUSG5hL3c5VlhBcUxRWjgrTkdJV0thL0xWMUNFeUVz?=
 =?utf-8?B?QmF5Ym9Ic0tJS1FDbnlPdWplR1JVUXI4eEJGK0VJR0F3L0JPNHkvdEN0N2hU?=
 =?utf-8?B?RHBrMjB3MzI2U3RNU3BPa084ekY3elJPQ3ZuN1BzYTNDUW9TUXVjTlFlcXJP?=
 =?utf-8?B?L3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4649a835-7c07-4884-5dda-08dd4b75cea6
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 14:59:11.0564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N4809ZDUoMMd9B3OrhLroZYHKqEX+Nx2TcfmsQM8Amuh0RyY6d4tfj9iyhgjHqaySQHeXEH/Qa+FOlDo05IZcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5231
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

--------------xocyPuZb2mHF3UXOFSz3r5Yk
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-02-2025 13:02, Borah, Chaitanya Kumar wrote:
>> -----Original Message-----
>> From: Murthy, Arun R<arun.r.murthy@intel.com>
>> Sent: Wednesday, February 5, 2025 3:57 PM
>> To:dri-devel@lists.freedesktop.org;intel-gfx@lists.freedesktop.org; intel-
>> xe@lists.freedesktop.org
>> Cc: Borah, Chaitanya Kumar<chaitanya.kumar.borah@intel.com>; Syrjala,
>> Ville<ville.syrjala@intel.com>; Murthy, Arun R<arun.r.murthy@intel.com>
>> Subject: [PATCH v4 3/3] drm/i915/display: Add i915 hook for
>> format_mod_supported_async
>>
>> Hook up the newly added plane function pointer
>> format_mod_supported_async to populate the modifiers/formats supported
>> by asynchronous flips.
>>
>> Signed-off-by: Arun R Murthy<arun.r.murthy@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/skl_universal_plane.c | 56 ++++++++++++++++-
>> -----
>>   1 file changed, 41 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c
>> b/drivers/gpu/drm/i915/display/skl_universal_plane.c
>> index
>> ba5db553c374259f8f3246c1408b55d32c8794e5..96d53b22715cf397483acbdb
>> 23b4dd60d6cbb604 100644
>> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
>> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
>> @@ -511,6 +511,33 @@ skl_plane_max_stride(struct intel_plane *plane,
>>   				modifier, rotation,
>>   				max_pixels, max_bytes);
>>   }
>> +static bool intel_plane_async_formats(struct intel_plane *plane,
>> +uint32_t format) {
>> +	switch (format) {
>> +	case DRM_FORMAT_RGB565:
>> +	case DRM_FORMAT_XRGB8888:
>> +	case DRM_FORMAT_XBGR8888:
>> +	case DRM_FORMAT_ARGB8888:
>> +	case DRM_FORMAT_ABGR8888:
>> +	case DRM_FORMAT_XRGB2101010:
>> +	case DRM_FORMAT_XBGR2101010:
>> +	case DRM_FORMAT_XRGB16161616F:
>> +	case DRM_FORMAT_XBGR16161616F:
>> +		return true;
>> +	default:
>> +		return false;
>> +	}
>> +}
>> +
>> +static bool intel_plane_format_mod_supported_async(struct drm_plane
>> *plane,
>> +						   uint32_t format,
>> +						   uint64_t modifier)
>> +{
>> +	if (intel_plane_can_async_flip(to_intel_plane(plane), modifier))
>> +		return false;
> This should be
>
> if (!intel_plane_can_async_flip(to_intel_plane(plane), modifier))
Typo from my side, corrected!
> I think we should eventually move to a switch case ladder that actually checks for compatibility among format-modifier pair
> rather than checking them individually. Though we don't have a good use of it today, we might end up having scenarios where some formats
> are supported only for certain modifiers and vice versa. But it can be taken up later.
I am fine! I can switch back to my previous patchset from which 
achieving this switch case latter is much easier.
> I see some comments made on rev 2 [1] regarding re-using the format_mod_sync() hook for this.
> I have not yet formed a strong opinion about it and with the above suggested change, it at least seems to work.

The comment from rev 2 [1] is

> > intel_plane_format_mod_supported_async()
> > {
> > 	// some generic checks here (eg. reject planar formats)
> > 
> > 	return plane->format_mod_supported() &&
> > 		plane->can_async_flip();
> > }

Here some generic checks to reject plannar formats is being done from 
intel_plane_async_formats() After this we have the result as to if the 
format is supported for not and with plane->can_async_flip we have a 
result of modifier being supported or not. That itself should be 
sufficient. If you still prefer to make use of the call 
plane->format_mod_supported() with some hacks can be done. Let me know!

> [1]https://patchwork.freedesktop.org/patch/631264/?series=140935&rev=2
>
>> +
>> +	return intel_plane_async_formats(to_intel_plane(plane), format); }
>>
>>   static bool tgl_plane_can_async_flip(u64 modifier)  { @@ -2559,30 +2586,29
>> @@ static bool tgl_plane_format_mod_supported(struct drm_plane *_plane,
>>   	}
>>   }
>>
>> +#define INTEL_PLANE_FUNCS \
>> +	.update_plane = drm_atomic_helper_update_plane, \
>> +	.disable_plane = drm_atomic_helper_disable_plane, \
>> +	.destroy = intel_plane_destroy, \
>> +	.atomic_duplicate_state = intel_plane_duplicate_state, \
>> +	.atomic_destroy_state = intel_plane_destroy_state, \
>> +	.format_mod_supported_async =
>> intel_plane_format_mod_supported_async
>> +
>>   static const struct drm_plane_funcs skl_plane_funcs = {
>> -	.update_plane = drm_atomic_helper_update_plane,
>> -	.disable_plane = drm_atomic_helper_disable_plane,
>> -	.destroy = intel_plane_destroy,
>> -	.atomic_duplicate_state = intel_plane_duplicate_state,
>> -	.atomic_destroy_state = intel_plane_destroy_state,
>> +	INTEL_PLANE_FUNCS,
>> +
>>   	.format_mod_supported = skl_plane_format_mod_supported,  };
>>
>>   static const struct drm_plane_funcs icl_plane_funcs = {
>> -	.update_plane = drm_atomic_helper_update_plane,
>> -	.disable_plane = drm_atomic_helper_disable_plane,
>> -	.destroy = intel_plane_destroy,
>> -	.atomic_duplicate_state = intel_plane_duplicate_state,
>> -	.atomic_destroy_state = intel_plane_destroy_state,
>> +	INTEL_PLANE_FUNCS,
>> +
>>   	.format_mod_supported = icl_plane_format_mod_supported,  };
>>
>>   static const struct drm_plane_funcs tgl_plane_funcs = {
>> -	.update_plane = drm_atomic_helper_update_plane,
>> -	.disable_plane = drm_atomic_helper_disable_plane,
>> -	.destroy = intel_plane_destroy,
>> -	.atomic_duplicate_state = intel_plane_duplicate_state,
>> -	.atomic_destroy_state = intel_plane_destroy_state,
>> +	INTEL_PLANE_FUNCS,
>> +
>>   	.format_mod_supported = tgl_plane_format_mod_supported,  };
>>
> This leads to exposing the property even on planes that do not support async flip.
> Functionally it should not be a problem as can_async is exposed only for primary plane.

Yes property will be created for all the planes but data will be 
populated only for primary plane.

Thanks and Regards,
Arun R Murthy
-------------------

>
> May be we can live with it for now. Ville any thoughts?
>
> Regards
>
> Chaitanya
>
>> --
>> 2.25.1
--------------xocyPuZb2mHF3UXOFSz3r5Yk
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 12-02-2025 13:02, Borah, Chaitanya
      Kumar wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:SJ1PR11MB6129BE6565855F8756C9AF8CB9FC2@SJ1PR11MB6129.namprd11.prod.outlook.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">-----Original Message-----
From: Murthy, Arun R <a class="moz-txt-link-rfc2396E" href="mailto:arun.r.murthy@intel.com">&lt;arun.r.murthy@intel.com&gt;</a>
Sent: Wednesday, February 5, 2025 3:57 PM
To: <a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>; <a class="moz-txt-link-abbreviated" href="mailto:intel-gfx@lists.freedesktop.org">intel-gfx@lists.freedesktop.org</a>; intel-
<a class="moz-txt-link-abbreviated" href="mailto:xe@lists.freedesktop.org">xe@lists.freedesktop.org</a>
Cc: Borah, Chaitanya Kumar <a class="moz-txt-link-rfc2396E" href="mailto:chaitanya.kumar.borah@intel.com">&lt;chaitanya.kumar.borah@intel.com&gt;</a>; Syrjala,
Ville <a class="moz-txt-link-rfc2396E" href="mailto:ville.syrjala@intel.com">&lt;ville.syrjala@intel.com&gt;</a>; Murthy, Arun R <a class="moz-txt-link-rfc2396E" href="mailto:arun.r.murthy@intel.com">&lt;arun.r.murthy@intel.com&gt;</a>
Subject: [PATCH v4 3/3] drm/i915/display: Add i915 hook for
format_mod_supported_async

Hook up the newly added plane function pointer
format_mod_supported_async to populate the modifiers/formats supported
by asynchronous flips.

Signed-off-by: Arun R Murthy <a class="moz-txt-link-rfc2396E" href="mailto:arun.r.murthy@intel.com">&lt;arun.r.murthy@intel.com&gt;</a>
---
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 56 ++++++++++++++++-
-----
 1 file changed, 41 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c
b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index
ba5db553c374259f8f3246c1408b55d32c8794e5..96d53b22715cf397483acbdb
23b4dd60d6cbb604 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -511,6 +511,33 @@ skl_plane_max_stride(struct intel_plane *plane,
 				modifier, rotation,
 				max_pixels, max_bytes);
 }
+static bool intel_plane_async_formats(struct intel_plane *plane,
+uint32_t format) {
+	switch (format) {
+	case DRM_FORMAT_RGB565:
+	case DRM_FORMAT_XRGB8888:
+	case DRM_FORMAT_XBGR8888:
+	case DRM_FORMAT_ARGB8888:
+	case DRM_FORMAT_ABGR8888:
+	case DRM_FORMAT_XRGB2101010:
+	case DRM_FORMAT_XBGR2101010:
+	case DRM_FORMAT_XRGB16161616F:
+	case DRM_FORMAT_XBGR16161616F:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool intel_plane_format_mod_supported_async(struct drm_plane
*plane,
+						   uint32_t format,
+						   uint64_t modifier)
+{
+	if (intel_plane_can_async_flip(to_intel_plane(plane), modifier))
+		return false;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This should be

if (!intel_plane_can_async_flip(to_intel_plane(plane), modifier))</pre>
    </blockquote>
    Typo from my side, corrected!<br>
    <blockquote type="cite" cite="mid:SJ1PR11MB6129BE6565855F8756C9AF8CB9FC2@SJ1PR11MB6129.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">I think we should eventually move to a switch case ladder that actually checks for compatibility among format-modifier pair
rather than checking them individually. Though we don't have a good use of it today, we might end up having scenarios where some formats
are supported only for certain modifiers and vice versa. But it can be taken up later.</pre>
    </blockquote>
    I am fine! I can switch back to my previous patchset from which
    achieving this switch case latter is much easier.<br>
    <blockquote type="cite" cite="mid:SJ1PR11MB6129BE6565855F8756C9AF8CB9FC2@SJ1PR11MB6129.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">I see some comments made on rev 2 [1] regarding re-using the format_mod_sync() hook for this.
I have not yet formed a strong opinion about it and with the above suggested change, it at least seems to work.
</pre>
    </blockquote>
    <p>The comment from rev 2 [1] is</p>
    <pre class="content" style="box-sizing: border-box; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; display: block; padding: 9.5px; margin: 0px 0px 10px; line-height: 14.3px; color: rgb(51, 51, 51); word-break: break-all; overflow-wrap: break-word; background-color: white; border: 0px; border-radius: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><span class="quote" style="box-sizing: border-box; color: rgb(0, 127, 0);">&gt; &gt; intel_plane_format_mod_supported_async()</span>
<span class="quote" style="box-sizing: border-box; color: rgb(0, 127, 0);">&gt; &gt; {</span>
<span class="quote" style="box-sizing: border-box; color: rgb(0, 127, 0);">&gt; &gt; 	// some generic checks here (eg. reject planar formats)</span>
<span class="quote" style="box-sizing: border-box; color: rgb(0, 127, 0);">&gt; &gt; </span>
<span class="quote" style="box-sizing: border-box; color: rgb(0, 127, 0);">&gt; &gt; 	return plane-&gt;format_mod_supported() &amp;&amp;</span>
<span class="quote" style="box-sizing: border-box; color: rgb(0, 127, 0);">&gt; &gt; 		plane-&gt;can_async_flip();</span>
<span class="quote" style="box-sizing: border-box; color: rgb(0, 127, 0);">&gt; &gt; }

</span></pre>
    <p><span style="white-space: pre-wrap">Here some generic checks to reject plannar formats is being done from intel_plane_async_formats()
After this we have the result as to if the format is supported for not and with plane-&gt;can_async_flip we have a result of modifier being supported or not.
That itself should be sufficient. If you still prefer to make use of the call plane-&gt;format_mod_supported() with some hacks can be done. Let me know!

</span></p>
    <blockquote type="cite" cite="mid:SJ1PR11MB6129BE6565855F8756C9AF8CB9FC2@SJ1PR11MB6129.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">
[1] <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/patch/631264/?series=140935&amp;rev=2">https://patchwork.freedesktop.org/patch/631264/?series=140935&amp;rev=2</a>

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+	return intel_plane_async_formats(to_intel_plane(plane), format); }

 static bool tgl_plane_can_async_flip(u64 modifier)  { @@ -2559,30 +2586,29
@@ static bool tgl_plane_format_mod_supported(struct drm_plane *_plane,
 	}
 }

+#define INTEL_PLANE_FUNCS \
+	.update_plane = drm_atomic_helper_update_plane, \
+	.disable_plane = drm_atomic_helper_disable_plane, \
+	.destroy = intel_plane_destroy, \
+	.atomic_duplicate_state = intel_plane_duplicate_state, \
+	.atomic_destroy_state = intel_plane_destroy_state, \
+	.format_mod_supported_async =
intel_plane_format_mod_supported_async
+
 static const struct drm_plane_funcs skl_plane_funcs = {
-	.update_plane = drm_atomic_helper_update_plane,
-	.disable_plane = drm_atomic_helper_disable_plane,
-	.destroy = intel_plane_destroy,
-	.atomic_duplicate_state = intel_plane_duplicate_state,
-	.atomic_destroy_state = intel_plane_destroy_state,
+	INTEL_PLANE_FUNCS,
+
 	.format_mod_supported = skl_plane_format_mod_supported,  };

 static const struct drm_plane_funcs icl_plane_funcs = {
-	.update_plane = drm_atomic_helper_update_plane,
-	.disable_plane = drm_atomic_helper_disable_plane,
-	.destroy = intel_plane_destroy,
-	.atomic_duplicate_state = intel_plane_duplicate_state,
-	.atomic_destroy_state = intel_plane_destroy_state,
+	INTEL_PLANE_FUNCS,
+
 	.format_mod_supported = icl_plane_format_mod_supported,  };

 static const struct drm_plane_funcs tgl_plane_funcs = {
-	.update_plane = drm_atomic_helper_update_plane,
-	.disable_plane = drm_atomic_helper_disable_plane,
-	.destroy = intel_plane_destroy,
-	.atomic_duplicate_state = intel_plane_duplicate_state,
-	.atomic_destroy_state = intel_plane_destroy_state,
+	INTEL_PLANE_FUNCS,
+
 	.format_mod_supported = tgl_plane_format_mod_supported,  };

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This leads to exposing the property even on planes that do not support async flip.
Functionally it should not be a problem as can_async is exposed only for primary plane.</pre>
    </blockquote>
    <p>Yes property will be created for all the planes but data will be
      populated only for primary plane.</p>
    <p>Thanks and Regards,<br>
      Arun R Murthy<br>
      -------------------<br>
    </p>
    <blockquote type="cite" cite="mid:SJ1PR11MB6129BE6565855F8756C9AF8CB9FC2@SJ1PR11MB6129.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">

May be we can live with it for now. Ville any thoughts?

Regards

Chaitanya

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
--
2.25.1
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------xocyPuZb2mHF3UXOFSz3r5Yk--
