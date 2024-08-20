Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B649E958D9C
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 19:47:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 194CE10E4A3;
	Tue, 20 Aug 2024 17:47:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gfmcx1Ik";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8D3010E816;
 Tue, 20 Aug 2024 17:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724176073; x=1755712073;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=iL8/P52TH8jt8Ud/p/kQTblB/IVJSwgHODFrdDM27NQ=;
 b=gfmcx1IkIckpWmFQIame1+gf6mHxBZwmeRfRRddNLMD42TCzqjhODEP5
 lWd+n09F/AOKP1TcxXz70SphGKcB815nhH72iLgOJf83s7CtuZ/VufzmX
 40ra0DEgQaQYBX5+BE1aKPOZZbATOJolWbfUcoZKnMBEqmVenNxvSeI2R
 XmXZNfIlx50CNr07eedWDP9nNxncFtjQOCNFGcktyjQDu1DrxfhItD51z
 JlDTZWsWI0mg3ictku/6OflNl+ieJf262Vryftr7m7+8mbPRY7su38Gef
 kfXByOixv6lPk+1/NGNCm9ygzS/qum/Nd50+YZdO+JbFKw4g6YcE5FPIh g==;
X-CSE-ConnectionGUID: gs+OjW8BSSmlN9pWkp2v8A==
X-CSE-MsgGUID: 51UcatyYSeyTgPeFSG5tDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22647712"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="22647712"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 10:47:52 -0700
X-CSE-ConnectionGUID: uS5RVfWqTK6iKZ0dvPBJ9w==
X-CSE-MsgGUID: lEf8LkH9SJ6iJcFnUbHiWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="91527327"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Aug 2024 10:47:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 10:47:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 10:47:52 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 10:47:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EQWziymHPQbIpmFYSIab/nonbNcsWF0GULLd9gbMCdqCuN6JlkOzQqKHZSaXzoGbV0dpoSFpHXBYWhfm7DlPenOtFP6WjmkLzJGhmO2Ur6su9vnSrSS1YaPJe8hcsu8Blv10iwonW4YEY059xerUspIQ4tEqlvdaO2R+QfMPaSt8Dt0UTjKbXcr0d8Orh+m80qa9DOxuSF5Nixf/jn5hPjaBhCaema6QweWTx+8YQpgCbvLY46ognQTGXPxyrfPKG9ErhF9kbNDJKFq1MWLZvPuD7H0swGtc1InGbPI+tAs1b0ORm2MIS6+FTCFrjwoeQC3IVpv9V8Yb5pPXzuZ4bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KsjLq+INng5O/xiIbvmhzkXcXrXqZPxO2p+PykF7n/g=;
 b=rRRMDG8u975BHdwHkKQXvt/oAwm9L1Jd/cxHGeWXyvx7Vff7a9XltiloyigRbAPuVDSM37tQ4be/QDT/ABlV1hWUCuSkM4tixVwaLd47+8CD894N3tYzunG0FhD5lj6LttnOfRLC66ry3iCnUzX8MTGdnGW7kiqXnOHLe7xR4Xq0QJjs0zsuxKuF9i4U1NNb4oOEjvuWjEvdc+Z9ICkMgMRMVx55++9ytXKfpyaVXAQqxWqmkIbjfHUbj1PDgYkqsmUa+/eM/D8bSJjV+Viua1TxUCVX0piKclps4KwNOWu+HU9PX8/q6x0khQhaYfNQqSlbBot/hrwFfVodE+53SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB7005.namprd11.prod.outlook.com (2603:10b6:303:22e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 17:47:44 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Tue, 20 Aug 2024
 17:47:44 +0000
Date: Tue, 20 Aug 2024 17:46:25 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, <dri-devel@lists.freedesktop.org>, "Paulo
 Zanoni" <paulo.r.zanoni@intel.com>
Subject: Re: [PATCH v8 2/6] drm/ttm/pool: Provide a helper to shrink pages
Message-ID: <ZsTWce6eoIV4VBrG@DUT025-TGLU.fm.intel.com>
References: <20240816133717.3102-1-thomas.hellstrom@linux.intel.com>
 <20240816133717.3102-3-thomas.hellstrom@linux.intel.com>
 <Zr9d1Fw0a7S7TywD@DUT025-TGLU.fm.intel.com>
 <fd1853a134a96b1981c6ec7d3f8d804cd1e52ae9.camel@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fd1853a134a96b1981c6ec7d3f8d804cd1e52ae9.camel@linux.intel.com>
X-ClientProxiedBy: BY3PR04CA0007.namprd04.prod.outlook.com
 (2603:10b6:a03:217::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB7005:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e404b82-e671-4972-bd2e-08dcc140324a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S1JpZ1hId0dkVXJpMkF4TFNIcTY2dUVFeElFaE5DRmxmbUZMY29VVDk0dmlG?=
 =?utf-8?B?OGppT3BFOFUvSEdzV05pTVJBM3puMnpsdU9iRzlMZXNRRkJPZnFyNHIrUXMx?=
 =?utf-8?B?dXMxcU5CSGtXZEVEYjlMbVQvdzV3RnB0N1M0OEJlbFM3aUtYLytoMFlweGJL?=
 =?utf-8?B?bzd5VFZGVld0Tkt0R2ZiVW5uaG51bWJDc1RsY1RMeWo2WFpxb0o4MnFtYTc2?=
 =?utf-8?B?STZGUm1rZUwwZ0ZyZ1F0bURVVkIxM21lM2psM0FoNW13c0FyRkllZGdlQ1dC?=
 =?utf-8?B?UWJ5T3gvTVdBc3JKbFpLYkVjZWJYWEIwYkZMSUVBNEUxN2tROTB4Yys1YTZ1?=
 =?utf-8?B?ZlFvRndsK2NaRTY1ZEZId0RvcUpFSnRKVllwSHFENVBVU1VVZnI5THU2cDVh?=
 =?utf-8?B?OWc0YUxSMkpHSVhjbDFGOUdicWt3ZWZrMTVLSmhDYkJSSTNuZlExWXFkQVc1?=
 =?utf-8?B?aHZBbURLNXNwNmxqLzE3ZHhGVkFyRUtHc0xuS1VDajVYYXN1VG05YW5PYTVO?=
 =?utf-8?B?OFh0dU4zU29tT2N6OUVZakZGOUdwbU1mQVpYYlY3VWtSSWVsVmtreTZPb05M?=
 =?utf-8?B?RFdyVVVScmN2S1JFRjBmV09ObEFiNDF5UFJacng4WVRKTU1rcm5RMlNWaXla?=
 =?utf-8?B?Mk9rNFVLMkM4bjFKNWtsWGpueE5VYWEzell2ZEJBZnVvc1l2Z1BlSDF4cnZn?=
 =?utf-8?B?T1g0LzdhaUZ5QVdHR2dxbmQyK3ZydmdUQnFKRmJzU3NaRG5YVU1IN1lFeWhH?=
 =?utf-8?B?R1lHUmFPbnpFVDBwZU5jZk9uMUg5WnFhZ09nYjQrQnVKSCthcEs0aEhVQkZn?=
 =?utf-8?B?UFE0dDNRMzBhb1d4SUhNakxaREJXT0JIN24rZGdnbHpxY241bXZGbjNJeHoz?=
 =?utf-8?B?V1lrQUdKRTJXV21wTXNUL1lwSTdXY3Bub0l0RHZVSkVFSFlwa2VGN09oS1BT?=
 =?utf-8?B?b3RWcXlHVHN5RmVHUGNlOVFYbzZMSC9XejJNMitxSU5TZ3VGeC9XTmlKa0FE?=
 =?utf-8?B?dWJqdVYzRFA5bWdqcWRvMHBwRXpObHVSblZiK3pIcmtibGh1WGlvTm9jRG45?=
 =?utf-8?B?bGFVYkVGMklkYkFDOC80WEp1RU5jNEQrcUNUV0c2allXaDMxZWxjbUltNElk?=
 =?utf-8?B?VUxMcmFHcjkxbURLTHp3OFNSQTcyUWdZMStvZHNZc000ZWVhYTFuSXJUcGM5?=
 =?utf-8?B?QWdNTDNaY2pITGoyZXNXMlRmK0RpZmdvNm9wL2diZUc5NWtrVkgyT0JDVnhm?=
 =?utf-8?B?Y04rTDdzMGtiZnlhaFFNbGRHeGNPS0Z3QVVkMkhkOVpPOFNhckZvQWpHcVhN?=
 =?utf-8?B?aW8vU00wWm0yYTcrVFJoNVRkR3hmUFBIb1VzZEN1UXpxWUVWTS9zc1JmZnZK?=
 =?utf-8?B?M3pYajI1R0lmSS84V2xEL3ppRU8vOW9iT0ViK1YrbWhXTnFBSmdoZUJqQ1do?=
 =?utf-8?B?b1RjNUZyVStUWDRXcmZvdkVXekhOQW9JR1pNbDFKRi9VWE1pRm5kWUpaVmQy?=
 =?utf-8?B?aC9pWEZGaHlDMjhYeUMwb0E5VGNmTXk4Qzg3M0hSMk9haVBjZ05TOGJrNks1?=
 =?utf-8?B?SnlvdWFIcUdqeUhLdWJHbURrcGdCSkM4VTdzWTMwK05hRUZoYUxBVnFidzdl?=
 =?utf-8?B?U0xmVVFVWVNaL1J2VE5KTTIwUkhGQXV1Y0M3U2tKZ01FckM5Y2hMY3ppSS9B?=
 =?utf-8?B?RXdZcnRQYThaWGVxZVZ0c0FOaVdlRnhYRU1VVHlZTFovbG14aVhqalk4aTRR?=
 =?utf-8?Q?0rQJiWJf8Qx5p42kXg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUQ4VlhURjBLNExZUmJ1RHoyeVhzVDY3TFJFOEY3bDN5N29HTzBzMSt3MzN4?=
 =?utf-8?B?MmlXK3JBM2dRejZLWTJzSWxDNDlPcWd3MmZDOFljNExDL3BQTG5CdG8rOG95?=
 =?utf-8?B?OWJxNStEVjRTWmpqbGFZTldYRnpHU0gwWW9vT2RLeWwvRm1hQVl0aWZzTnF5?=
 =?utf-8?B?b0J3Q2RpZldoN0kzUkI2U2pSZlZPSmpwRWN5eGRLNVk4QVlmQXdPNTFaK0Nm?=
 =?utf-8?B?S2JJQkNYT0xvL1IyZCtteFhveXQ0ZktVS1JPNkVsSlM0WlA1bmh5NGdkMHpB?=
 =?utf-8?B?OWRBaHh5WkZmTDlwZXI2SnN3MVk3TkRWcmZZRVZmNGl4eUo0SWVRaFIvUDho?=
 =?utf-8?B?R0QzR2VacWU3WEd5WTRIejhXWE80UWRpN1VrRVYzNXEvRTNGQUY1ZUVoWUFB?=
 =?utf-8?B?dnBZci9VUitCUnhYVytKSmhoZEo0SkdrSEtHdURaL3MydFRXS0twK1c1Rmpy?=
 =?utf-8?B?V3RJWlNoQlFnMHM5aklhWFBneC9UVnkzZHdycm95OGcyQlJ4Y0N0MlFsbmFr?=
 =?utf-8?B?VmNtZStsaCtFODFlenVlaXRCTlpXZldEU3ZvRjRRS2lkeWZNaHFsOHQrK29D?=
 =?utf-8?B?bTYxY2tTblZubDlLemFkRXphRVhrYVk4YmxHdURmcytrSUVzN1RWbFVpSFhh?=
 =?utf-8?B?SzNXenRaWExoWUY5TzczS1JGSkJ0YU1Za1FRd3dqeDdBTkFKakRmd3lHQ0g5?=
 =?utf-8?B?OG1UL2JrdFhmOFVNRk14ZEdsTTVMV2EwT0lWSjU5ampWbzRrZ2FpRVd0T243?=
 =?utf-8?B?NE80anlGckVBNzBWQnF3OEViUjk4dnd3R3FBMEdmd2Fma2dMVjkwM2RCRDJB?=
 =?utf-8?B?M283VXJBZjFHVW5LMkhlMy9vMGRjZkJUZVladEVwcTFaSWhqVkM4L1ZBOEZS?=
 =?utf-8?B?YWJLYnBDMDByNHh3ZnlLVDhFUEFIYlV1a0tDbjdFclRyU0Zqek1LRDNDZEhl?=
 =?utf-8?B?KzdJcGJVdnJCMkxvQ0duTC9tcE14YllKTk1IWjRsQ1BHN3hTdWFMaENURjdI?=
 =?utf-8?B?NnRDSDlNZnB3aVRiN2NtMlpwems2N0NEdGtIWG85eTdTS3oxbGR1L3R1K05j?=
 =?utf-8?B?c0pxbW0wQTRjUXZFbVVPUTJIMjVBRW5seS96VFRlQmpiVFhLbkhsdnF6UUhh?=
 =?utf-8?B?bXBMbFhYOWVDd1B0NFlTL01NcHhWamY1L3NPS3BaMkFjMi9KVGtvMUF2RnBE?=
 =?utf-8?B?YjFvQWFsWHJwalVVdlN5ankzNGlzZWFzZy9ibVRuN3ZENnpiaWlIQlFxZGN3?=
 =?utf-8?B?NnJ3U3JIOTJhNWRjd3lZR01uYlJLbmF2NXpCdVVITU80MW1IL3paU3EySTdk?=
 =?utf-8?B?bUJwRXRxb01SM2hGVkxVUHlraDhlQWNBWHZUMEUxdmNjbUIwUGhqYnZ2eVlp?=
 =?utf-8?B?blZWcVRoTVNGWnhZb0J6VkJKazJMUjZlSnkxSTYrY0pKZzZLdDBkeDErcEth?=
 =?utf-8?B?eG1uZVJTZGhSaUdoWk53UzM2NTB1emlINFE4RnpweFZCVUJTUUhRb1NXSVhF?=
 =?utf-8?B?WFQ2YVdpNjA3WDFmbkEzTHlKcVhWeUdyQ3ZLZGw5Nng2ckJMeHBHclc0QXVF?=
 =?utf-8?B?WndhSzZ5YytBOTVBN09zdVlHQ0NDRlJmTElGbVROaGt4SGhCaUdUVXlJNGdp?=
 =?utf-8?B?VmZQWXduVkFMQitpN0l5dHE0NXJzZ0YyeVZoWkRaQlBhMWZSb2RxdWZmcDda?=
 =?utf-8?B?elB5bjdWamkrYllCUnV5Skt3M05URkxjRDJ2bGJiejZuYXVMRS9sY1hkTkRM?=
 =?utf-8?B?MlEwS2drQld1emxFZndCSHBPT1JzcHlHbHE5ekQ0Z3cwbHl6alFnbG92cjBP?=
 =?utf-8?B?S2lpa00xUHM3UHBCQi90d1Z1TTZ4bVlpS2hjSTR6WTUwaHFmSWozV3VsNWFQ?=
 =?utf-8?B?dGVmSmNldmYzSnpySnZOZXVEcEE0M0lPOFdkYkVqaEhZanY4M0xUTmJYeWVG?=
 =?utf-8?B?SHhpejgzSGVNNkxSd0YrZ01iWFlkMk1Lb2JPQ0xJK0MrdlBiTHRzQThWYnRw?=
 =?utf-8?B?Q0wzc0tQN0l5NFZ1aUZSczlpUndteHpkZFBuK0JadVpKRlJOOTNaYkkrWVA4?=
 =?utf-8?B?S2RlRHo3a25XMjdpZmkwcSt0UFBIdnQxU2lUV2ZXUnRtcHFraTVHTmJBS0Rj?=
 =?utf-8?B?LzNsblhQK2lpN2htaVA3Z0hSQzIvMGcySFVlVldYMmVJRVRqT1R3YTZQYTJP?=
 =?utf-8?B?bGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e404b82-e671-4972-bd2e-08dcc140324a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 17:47:44.7240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FQfhuWhpE4Dmi97IdTKmB3fVm7HMI26b6oCK6Tp2Y7uRy/mlzrjmX3em0mxx3ImGxpM2/nbzCVRUUybVocdXrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7005
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

On Mon, Aug 19, 2024 at 10:07:16AM +0200, Thomas Hellström wrote:
> Hi, Matt.
> 
> On Fri, 2024-08-16 at 14:10 +0000, Matthew Brost wrote:
> > On Fri, Aug 16, 2024 at 03:37:13PM +0200, Thomas Hellström wrote:
> > > Provide a helper to shrink ttm_tt page-vectors on a per-page
> > > basis. A ttm_backup backend could then in theory get away with
> > > allocating a single temporary page for each struct ttm_tt.
> > > 
> > > This is accomplished by splitting larger pages before trying to
> > > back them up.
> > > 
> > > In the future we could allow ttm_backup to handle backing up
> > > large pages as well, but currently there's no benefit in
> > > doing that, since the shmem backup backend would have to
> > > split those anyway to avoid allocating too much temporary
> > > memory, and if the backend instead inserts pages into the
> > > swap-cache, those are split on reclaim by the core.
> > > 
> > > Due to potential backup- and recover errors, allow partially
> > > swapped
> > > out struct ttm_tt's, although mark them as swapped out stopping
> > > them
> > > from being swapped out a second time. More details in the
> > > ttm_pool.c
> > > DOC section.
> > > 
> > > v2:
> > > - A couple of cleanups and error fixes in ttm_pool_back_up_tt.
> > > - s/back_up/backup/
> > > - Add a writeback parameter to the exported interface.
> > > v8:
> > > - Use a struct for flags for readability (Matt Brost)
> > > - Address misc other review comments (Matt Brost)
> > > 
> > > Cc: Christian König <christian.koenig@amd.com>
> > > Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: <dri-devel@lists.freedesktop.org>
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > ---
> > >  drivers/gpu/drm/ttm/ttm_pool.c | 394
> > > +++++++++++++++++++++++++++++++--
> > >  drivers/gpu/drm/ttm/ttm_tt.c   |  37 ++++
> > >  include/drm/ttm/ttm_pool.h     |   6 +
> > >  include/drm/ttm/ttm_tt.h       |  29 +++
> > >  4 files changed, 453 insertions(+), 13 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/ttm/ttm_pool.c
> > > b/drivers/gpu/drm/ttm/ttm_pool.c
> > > index 8504dbe19c1a..0d224cd9f8eb 100644
> > > --- a/drivers/gpu/drm/ttm/ttm_pool.c
> > > +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> > > @@ -41,6 +41,7 @@
> > >  #include <asm/set_memory.h>
> > >  #endif
> > >  
> > > +#include <drm/ttm/ttm_backup.h>
> > >  #include <drm/ttm/ttm_pool.h>
> > >  #include <drm/ttm/ttm_tt.h>
> > >  #include <drm/ttm/ttm_bo.h>
> > > @@ -58,6 +59,32 @@ struct ttm_pool_dma {
> > >  	unsigned long vaddr;
> > >  };
> > >  
> > > +/**
> > > + * struct ttm_pool_tt_restore - State representing restore from
> > > backup
> > > + * @alloced_pages: Total number of already allocated pages for the
> > > ttm_tt.
> > > + * @restored_pages: Number of (sub) pages restored from swap for
> > > this
> > > + *		     chunk of 1 << @order pages.
> > > + * @first_page: The ttm page ptr representing for @old_pages[0].
> > > + * @caching_divide: Page pointer where subsequent pages are
> > > cached.
> > > + * @old_pages: Backup copy of page pointers that were replaced by
> > > the new
> > > + *	       page allocation.
> > > + * @pool: The pool used for page allocation while restoring.
> > > + * @order: The order of the last page allocated while restoring.
> > > + *
> > > + * Recovery from backup might fail when we've recovered less than
> > > the
> > > + * full ttm_tt. In order not to loose any data (yet), keep
> > > information
> > > + * around that allows us to restart a failed ttm backup recovery.
> > > + */
> > > +struct ttm_pool_tt_restore {
> > > +	pgoff_t alloced_pages;
> > > +	pgoff_t restored_pages;
> > > +	struct page **first_page;
> > > +	struct page **caching_divide;
> > > +	struct ttm_pool *pool;
> > > +	unsigned int order;
> > > +	struct page *old_pages[];
> > > +};
> > > +
> > >  static unsigned long page_pool_size;
> > >  
> > >  MODULE_PARM_DESC(page_pool_size, "Number of pages in the WC/UC/DMA
> > > pool");
> > > @@ -354,11 +381,102 @@ static unsigned int
> > > ttm_pool_page_order(struct ttm_pool *pool, struct page *p)
> > >  	return p->private;
> > >  }
> > >  
> > > +/*
> > > + * To be able to insert single pages into backup directly,
> > > + * we need to split multi-order page allocations and make them
> > > look
> > > + * like single-page allocations.
> > > + */
> > > +static void ttm_pool_split_for_swap(struct ttm_pool *pool, struct
> > > page *p)
> > > +{
> > > +	unsigned int order = ttm_pool_page_order(pool, p);
> > > +	pgoff_t nr;
> > > +
> > > +	if (!order)
> > > +		return;
> > > +
> > > +	split_page(p, order);
> > > +	nr = 1UL << order;
> > > +	while (nr--)
> > > +		(p++)->private = 0;
> > > +}
> > > +
> > > +/**
> > > + * DOC: Partial backup and restoration of a struct ttm_tt.
> > > + *
> > > + * Swapout using ttm_backup::ops::backup_page() and swapin using
> > > + * ttm_backup::ops::copy_backed_up_page() may fail.
> > > + * The former most likely due to lack of swap-space or memory, the
> > > latter due
> > > + * to lack of memory or because of signal interruption during
> > > waits.
> > > + *
> > > + * Backupfailure is easily handled by using a ttm_tt pages vector
> > > that holds
> > > + * both swap entries and page pointers. This has to be taken into
> > > account when
> > > + * restoring such a ttm_tt from backup, and when freeing it while
> > > backed up.
> > > + * When restoring, for simplicity, new pages are actually
> > > allocated from the
> > > + * pool and the contents of any old pages are copied in and then
> > > the old pages
> > > + * are released.
> > > + *
> > > + * For restoration failures, the struct ttm_pool_tt_restore holds
> > > sufficient state
> > > + * to be able to resume an interrupted restore, and that structure
> > > is freed once
> > > + * the restoration is complete. If the struct ttm_tt is destroyed
> > > while there
> > > + * is a valid struct ttm_pool_tt_restore attached, that is also
> > > properly taken
> > > + * care of.
> > > + */
> > > +
> > > +static bool ttm_pool_restore_valid(const struct
> > > ttm_pool_tt_restore *restore)
> > > +{
> > > +	return restore && restore->restored_pages < (1 << restore-
> > > >order);
> > > +}
> > > +
> > > +static int ttm_pool_restore_tt(struct ttm_pool_tt_restore
> > > *restore,
> > > +			       struct ttm_backup *backup,
> > > +			       struct ttm_operation_ctx *ctx)
> > > +{
> > > +	unsigned int i, nr = 1 << restore->order;
> > > +	int ret = 0;
> > > +
> > > +	if (!ttm_pool_restore_valid(restore))
> > > +		return 0;
> > > +
> > > +	for (i = restore->restored_pages; i < nr; ++i) {
> > > +		struct page *p = restore->old_pages[i];
> > > +
> > > +		if (ttm_backup_page_ptr_is_handle(p)) {
> > > +			unsigned long handle =
> > > ttm_backup_page_ptr_to_handle(p);
> > > +
> > > +			if (handle == 0)
> > > +				continue;
> > > +
> > > +			ret = backup->ops->copy_backed_up_page
> > > +				(backup, restore->first_page[i],
> > > +				 handle, ctx->interruptible);
> > > +			if (ret)
> > > +				break;
> > > +
> > > +			backup->ops->drop(backup, handle);
> > > +		} else if (p) {
> > > +			/*
> > > +			 * We could probably avoid splitting the
> > > old page
> > > +			 * using clever logic, but ATM we don't
> > > care.
> > > +			 */
> > > +			ttm_pool_split_for_swap(restore->pool, p);
> > > +			copy_highpage(restore->first_page[i], p);
> > > +			__free_pages(p, 0);
> > > +		}
> > > +
> > > +		restore->restored_pages++;
> > > +		restore->old_pages[i] = NULL;
> > > +		cond_resched();
> > > +	}
> > > +
> > > +	return ret;
> > > +}
> > > +
> > >  /* Called when we got a page, either from a pool or newly
> > > allocated */
> > >  static int ttm_pool_page_allocated(struct ttm_pool *pool, unsigned
> > > int order,
> > >  				   struct page *p, dma_addr_t
> > > **dma_addr,
> > >  				   unsigned long *num_pages,
> > > -				   struct page ***pages)
> > > +				   struct page ***pages,
> > > +				   struct ttm_pool_tt_restore
> > > *restore)
> > >  {
> > >  	unsigned int i;
> > >  	int r;
> > > @@ -369,6 +487,16 @@ static int ttm_pool_page_allocated(struct
> > > ttm_pool *pool, unsigned int order,
> > >  			return r;
> > >  	}
> > >  
> > > +	if (restore) {
> > > +		memcpy(restore->old_pages, *pages,
> > > +		       (1 << order) * sizeof(*restore-
> > > >old_pages));
> > > +		memset(*pages, 0, (1 << order) * sizeof(**pages));
> > > +		restore->order = order;
> > > +		restore->restored_pages = 0;
> > > +		restore->first_page = *pages;
> > > +		restore->alloced_pages += 1UL << order;
> > > +	}
> > > +
> > >  	*num_pages -= 1 << order;
> > >  	for (i = 1 << order; i; --i, ++(*pages), ++p)
> > >  		**pages = p;
> > > @@ -394,22 +522,39 @@ static void ttm_pool_free_range(struct
> > > ttm_pool *pool, struct ttm_tt *tt,
> > >  				pgoff_t start_page, pgoff_t
> > > end_page)
> > >  {
> > >  	struct page **pages = &tt->pages[start_page];
> > > +	struct ttm_backup *backup = tt->backup;
> > >  	unsigned int order;
> > >  	pgoff_t i, nr;
> > >  
> > >  	for (i = start_page; i < end_page; i += nr, pages += nr) {
> > >  		struct ttm_pool_type *pt = NULL;
> > > +		struct page *p = *pages;
> > > +
> > > +		if (ttm_backup_page_ptr_is_handle(p)) {
> > > +			unsigned long handle =
> > > ttm_backup_page_ptr_to_handle(p);
> > > +
> > > +			nr = 1;
> > > +			if (handle != 0)
> > > +				backup->ops->drop(backup, handle);
> > > +			continue;
> > > +		}
> > > +
> > > +		if (pool) {
> > > +			order = ttm_pool_page_order(pool, p);
> > > +			nr = (1UL << order);
> > > +			if (tt->dma_address)
> > > +				ttm_pool_unmap(pool, tt-
> > > >dma_address[i], nr);
> > >  
> > > -		order = ttm_pool_page_order(pool, *pages);
> > > -		nr = (1UL << order);
> > > -		if (tt->dma_address)
> > > -			ttm_pool_unmap(pool, tt->dma_address[i],
> > > nr);
> > > +			pt = ttm_pool_select_type(pool, caching,
> > > order);
> > > +		} else {
> > > +			order = p->private;
> > > +			nr = (1UL << order);
> > > +		}
> > >  
> > > -		pt = ttm_pool_select_type(pool, caching, order);
> > >  		if (pt)
> > > -			ttm_pool_type_give(pt, *pages);
> > > +			ttm_pool_type_give(pt, p);
> > >  		else
> > > -			ttm_pool_free_page(pool, caching, order,
> > > *pages);
> > > +			ttm_pool_free_page(pool, caching, order,
> > > p);
> > >  	}
> > >  }
> > >  
> > > @@ -453,9 +598,36 @@ int ttm_pool_alloc(struct ttm_pool *pool,
> > > struct ttm_tt *tt,
> > >  	else
> > >  		gfp_flags |= GFP_HIGHUSER;
> > >  
> > > -	for (order = min_t(unsigned int, MAX_PAGE_ORDER,
> > > __fls(num_pages));
> > > -	     num_pages;
> > > -	     order = min_t(unsigned int, order, __fls(num_pages)))
> > > {
> > > +	order = min_t(unsigned int, MAX_PAGE_ORDER,
> > > __fls(num_pages));
> > > +
> > > +	if (tt->page_flags & TTM_TT_FLAG_PRIV_BACKED_UP) {
> > > +		if (!tt->restore) {
> > > +			gfp_t gfp = GFP_KERNEL | __GFP_NOWARN;
> > > +
> > > +			if (ctx->gfp_retry_mayfail)
> > > +				gfp |= __GFP_RETRY_MAYFAIL;
> > > +
> > > +			tt->restore =
> > > +				kvzalloc(struct_size(tt->restore,
> > > old_pages,
> > > +						     (size_t)1 <<
> > > order), gfp);
> > > +			if (!tt->restore)
> > > +				return -ENOMEM;
> > > +		} else if (ttm_pool_restore_valid(tt->restore)) {
> > > +			struct ttm_pool_tt_restore *restore = tt-
> > > >restore;
> > > +
> > > +			num_pages -= restore->alloced_pages;
> > > +			order = min_t(unsigned int, order,
> > > __fls(num_pages));
> > > +			pages += restore->alloced_pages;
> > > +			r = ttm_pool_restore_tt(restore, tt-
> > > >backup, ctx);
> > > +			if (r)
> > > +				return r;
> > > +			caching = restore->caching_divide;
> > > +		}
> > > +
> > > +		tt->restore->pool = pool;
> > > +	}
> > > +
> > > +	for (; num_pages; order = min_t(unsigned int, order,
> > > __fls(num_pages))) {
> > >  		struct ttm_pool_type *pt;
> > >  
> > >  		page_caching = tt->caching;
> > > @@ -472,11 +644,19 @@ int ttm_pool_alloc(struct ttm_pool *pool,
> > > struct ttm_tt *tt,
> > >  				r = ttm_pool_page_allocated(pool,
> > > order, p,
> > >  							   
> > > &dma_addr,
> > >  							   
> > > &num_pages,
> > > -							   
> > > &pages);
> > > +							   
> > > &pages,
> > > +							    tt-
> > > >restore);
> > >  				if (r)
> > >  					goto error_free_page;
> > >  
> > >  				caching = pages;
> > > +				if (ttm_pool_restore_valid(tt-
> > > >restore)) {
> > > +					r =
> > > ttm_pool_restore_tt(tt->restore, tt->backup,
> > > +								ct
> > > x);
> > > +					if (r)
> > > +						goto
> > > error_free_all;
> > > +				}
> > > +
> > >  				if (num_pages < (1 << order))
> > >  					break;
> > >  
> > > @@ -496,9 +676,17 @@ int ttm_pool_alloc(struct ttm_pool *pool,
> > > struct ttm_tt *tt,
> > >  				caching = pages;
> > >  			}
> > >  			r = ttm_pool_page_allocated(pool, order,
> > > p, &dma_addr,
> > > -						    &num_pages,
> > > &pages);
> > > +						    &num_pages,
> > > &pages,
> > > +						    tt->restore);
> > >  			if (r)
> > >  				goto error_free_page;
> > > +
> > > +			if (ttm_pool_restore_valid(tt->restore)) {
> > > +				r = ttm_pool_restore_tt(tt-
> > > >restore, tt->backup, ctx);
> > > +				if (r)
> > > +					goto error_free_all;
> > > +			}
> > > +
> > >  			if (PageHighMem(p))
> > >  				caching = pages;
> > >  		}
> > > @@ -517,12 +705,26 @@ int ttm_pool_alloc(struct ttm_pool *pool,
> > > struct ttm_tt *tt,
> > >  	if (r)
> > >  		goto error_free_all;
> > >  
> > > +	if (tt->restore) {
> > > +		kvfree(tt->restore);
> > > +		tt->restore = NULL;
> > > +	}
> > > +
> > > +	if (tt->page_flags & TTM_TT_FLAG_PRIV_BACKED_UP)
> > > +		tt->page_flags &= ~(TTM_TT_FLAG_PRIV_BACKED_UP |
> > > +				    TTM_TT_FLAG_SWAPPED);
> > > +
> > >  	return 0;
> > >  
> > >  error_free_page:
> > >  	ttm_pool_free_page(pool, page_caching, order, p);
> > >  
> > >  error_free_all:
> > > +	if (tt->page_flags & TTM_TT_FLAG_PRIV_BACKED_UP) {
> > > +		tt->restore->caching_divide = caching;
> > > +		return r;
> > > +	}
> > > +
> > >  	num_pages = tt->num_pages - num_pages;
> > >  	caching_divide = caching - tt->pages;
> > >  	ttm_pool_free_range(pool, tt, tt->caching, 0,
> > > caching_divide);
> > > @@ -549,6 +751,172 @@ void ttm_pool_free(struct ttm_pool *pool,
> > > struct ttm_tt *tt)
> > >  }
> > >  EXPORT_SYMBOL(ttm_pool_free);
> > >  
> > > +/**
> > > + * ttm_pool_release_backed_up() - Release content of a swapped-out
> > > struct ttm_tt
> > > + * @tt: The struct ttm_tt.
> > > + *
> > > + * Release handles with associated content or any remaining pages
> > > of
> > > + * a backed-up struct ttm_tt.
> > > + */
> > > +void ttm_pool_release_backed_up(struct ttm_tt *tt)
> > > +{
> > > +	struct ttm_backup *backup = tt->backup;
> > > +	struct ttm_pool_tt_restore *restore;
> > > +	pgoff_t i, start_page = 0;
> > > +	unsigned long handle;
> > > +
> > > +	if (!(tt->page_flags & TTM_TT_FLAG_PRIV_BACKED_UP))
> > > +		return;
> > > +
> > > +	restore = tt->restore;
> > > +
> > > +	if (ttm_pool_restore_valid(restore)) {
> > > +		pgoff_t nr = 1UL << restore->order;
> > > +
> > > +		for (i = restore->restored_pages; i < nr; ++i) {
> > > +			struct page *p = restore->old_pages[i];
> > > +
> > > +			if (ttm_backup_page_ptr_is_handle(p)) {
> > > +				handle =
> > > ttm_backup_page_ptr_to_handle(p);
> > > +				if (handle == 0)
> > > +					continue;
> > > +
> > > +				backup->ops->drop(backup, handle);
> > > +			} else if (p) {
> > > +				ttm_pool_split_for_swap(restore-
> > > >pool, p);
> > > +				__free_pages(p, 0);
> > > +			}
> > > +		}
> > > +	}
> > > +
> > > +	if (restore) {
> > > +		pgoff_t mid = restore->caching_divide - tt->pages;
> > > +
> > > +		start_page = restore->alloced_pages;
> > > +		/* Pages that might be dma-mapped and non-cached
> > > */
> > > +		ttm_pool_free_range(restore->pool, tt, tt-
> > > >caching,
> > > +				    0, mid);
> > > +		/* Pages that might be dma-mapped but cached */
> > > +		ttm_pool_free_range(restore->pool, tt, ttm_cached,
> > > +				    mid, restore->alloced_pages);
> > > +	}
> > > +
> > > +	/* Shrunken pages. Cached and not dma-mapped. */
> > > +	ttm_pool_free_range(NULL, tt, ttm_cached, start_page, tt-
> > > >num_pages);
> > > +
> > > +	if (restore) {
> > > +		kvfree(restore);
> > > +		tt->restore = NULL;
> > > +	}
> > > +
> > > +	tt->page_flags &= ~(TTM_TT_FLAG_PRIV_BACKED_UP |
> > > TTM_TT_FLAG_SWAPPED);
> > > +}
> > > +
> > > +/**
> > > + * ttm_pool_backup_tt() - Back up or purge a struct ttm_tt
> > > + * @pool: The pool used when allocating the struct ttm_tt.
> > > + * @ttm: The struct ttm_tt.
> > > + * @flags: Flags to govern the backup behaviour.
> > > + *
> > > + * Back up or purge a struct ttm_tt. If @purge is true, then
> > > + * all pages will be freed directly to the system rather than to
> > > the pool
> > > + * they were allocated from, making the function behave similarly
> > > to
> > > + * ttm_pool_free(). If @purge is false the pages will be backed up
> > > instead,
> > > + * exchanged for handles.
> > > + * A subsequent call to ttm_pool_alloc() will then read back the
> > > content and
> > > + * a subsequent call to ttm_pool_release_shrunken() will drop it.
> > > + * If backup of a page fails for whatever reason, @ttm will still
> > > be
> > > + * partially backed up, retaining those pages for which backup
> > > fails.
> > > + *
> > > + * Return: Number of pages actually backed up or freed, or
> > > negative
> > > + * error code on error.
> > > + */
> > > +long ttm_pool_backup_tt(struct ttm_pool *pool, struct ttm_tt *ttm,
> > > +			const struct ttm_backup_flags *flags)
> > > +{
> > > +	struct ttm_backup *backup = ttm->backup;
> > > +	struct page *page;
> > > +	unsigned long handle;
> > > +	gfp_t alloc_gfp;
> > > +	gfp_t gfp;
> > > +	int ret = 0;
> > > +	pgoff_t shrunken = 0;
> > > +	pgoff_t i, num_pages;
> > > +
> > > +	if ((!get_nr_swap_pages() && !flags->purge) ||
> > > +	    pool->use_dma_alloc ||
> > > +	    (ttm->page_flags & TTM_TT_FLAG_PRIV_BACKED_UP))
> > > +		return -EBUSY;
> > > +
> > > +#ifdef CONFIG_X86
> > > +	/* Anything returned to the system needs to be cached. */
> > > +	if (ttm->caching != ttm_cached)
> > > +		set_pages_array_wb(ttm->pages, ttm->num_pages);
> > > +#endif
> > > +
> > > +	if (ttm->dma_address || flags->purge) {
> > > +		for (i = 0; i < ttm->num_pages; i += num_pages) {
> > > +			unsigned int order;
> > > +
> > > +			page = ttm->pages[i];
> > > +			if (unlikely(!page)) {
> > > +				num_pages = 1;
> > > +				continue;
> > > +			}
> > > +
> > > +			order = ttm_pool_page_order(pool, page);
> > > +			num_pages = 1UL << order;
> > > +			if (ttm->dma_address)
> > > +				ttm_pool_unmap(pool, ttm-
> > > >dma_address[i],
> > > +					       num_pages);
> > > +			if (flags->purge) {
> > > +				shrunken += num_pages;
> > > +				page->private = 0;
> > > +				__free_pages(page, order);
> > > +				memset(ttm->pages + i, 0,
> > > +				       num_pages * sizeof(*ttm-
> > > >pages));
> > > +			}
> > > +		}
> > > +	}
> > > +
> > > +	if (flags->purge)
> > > +		return shrunken;
> > > +
> > > +	if (pool->use_dma32)
> > > +		gfp = GFP_DMA32;
> > > +	else
> > > +		gfp = GFP_HIGHUSER;
> > > +
> > > +	alloc_gfp = GFP_KERNEL | __GFP_HIGH | __GFP_NOWARN |
> > > __GFP_RETRY_MAYFAIL;
> > > +
> > > +	for (i = 0; i < ttm->num_pages; ++i) {
> > > +		page = ttm->pages[i];
> > > +		if (unlikely(!page))
> > > +			continue;
> > > +
> > > +		ttm_pool_split_for_swap(pool, page);
> > > +
> > > +		handle = backup->ops->backup_page(backup, page,
> > > flags->writeback, i,
> > > +						  gfp, alloc_gfp);
> > > +		if (handle) {
> > > +			ttm->pages[i] =
> > > ttm_backup_handle_to_page_ptr(handle);
> > > +			put_page(page);
> > > +			shrunken++;
> > > +		} else {
> > > +			/* We allow partially shrunken tts */
> > > +			ret = -ENOMEM;
> > > +			break;
> > > +		}
> > > +		cond_resched();
> > > +	}
> > > +
> > > +	if (shrunken)
> > > +		ttm->page_flags |= (TTM_TT_FLAG_PRIV_BACKED_UP |
> > > +				    TTM_TT_FLAG_SWAPPED);
> > > +
> > > +	return shrunken ? shrunken : ret;
> > > +}
> > > +
> > >  /**
> > >   * ttm_pool_init - Initialize a pool
> > >   *
> > > diff --git a/drivers/gpu/drm/ttm/ttm_tt.c
> > > b/drivers/gpu/drm/ttm/ttm_tt.c
> > > index 4b51b9023126..f520b8c93f03 100644
> > > --- a/drivers/gpu/drm/ttm/ttm_tt.c
> > > +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> > > @@ -40,6 +40,7 @@
> > >  #include <drm/drm_cache.h>
> > >  #include <drm/drm_device.h>
> > >  #include <drm/drm_util.h>
> > > +#include <drm/ttm/ttm_backup.h>
> > >  #include <drm/ttm/ttm_bo.h>
> > >  #include <drm/ttm/ttm_tt.h>
> > >  
> > > @@ -158,6 +159,8 @@ static void ttm_tt_init_fields(struct ttm_tt
> > > *ttm,
> > >  	ttm->swap_storage = NULL;
> > >  	ttm->sg = bo->sg;
> > >  	ttm->caching = caching;
> > > +	ttm->restore = NULL;
> > > +	ttm->backup = NULL;
> > >  }
> > >  
> > >  int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
> > > @@ -182,6 +185,12 @@ void ttm_tt_fini(struct ttm_tt *ttm)
> > >  		fput(ttm->swap_storage);
> > >  	ttm->swap_storage = NULL;
> > >  
> > > +	ttm_pool_release_backed_up(ttm);
> > > +	if (ttm->backup) {
> > 
> > Sorry for the conflicting comments in the last rev, but my last one
> > here
> > [1] regardind making this fully driver-owned didn’t receive a
> > response.
> > I’ll state it again: Do you think the backup fini should be owned by
> > the
> > driver? This would allow the driver to use a global backup for all TT
> > if
> > it wanted to. It would also make it consistent in the sense that the
> > driver would own both the allocation and fini of the backup.
> > 
> > Matt
> > 
> > [1]
> > https://patchwork.freedesktop.org/patch/602165/?series=131815&rev=6#comment_1104556
> 
> Sorry, I typed a lengthy reply to that comment but it somehow got lost.
> 
> Anyway, a single backup structure is, I think, possible with the
> current implementation as well. In fact I use to have one of those
> around for the direct-to-swap-cache implementation; basically the
> backup_fini was a NOP IIRC.
> 
> One could also imagine the driver registering a large NVME file to use
> for backup, In this each subclassed backup struct would probably want
> to carry a refcount to the underlying file and each page position in
> the file would be allocated using a struct ida or similar..
> 
> So for making it driver owned, I'm not completely following what you
> mean. I noted in the docs that the driver needs to assign this value,
> but thinking of it that should probably be done using the ttm_tt_init()
> helper. Although that will require changing the ttm_tt_init() interface
> for all drivers.
> 
> But if I missed the point, please get back. Meanwhile, I'm sending out
> v9 with a couple of compilation fixes.
> 

I think this makes sense, just want to make sure the design was flexible
enough for all possible use cases. I think you have convienced me it is.

Matt

> Thanks,
> Thomas
> 
> 
> > 
> > > +		ttm->backup->ops->fini(ttm->backup);
> > > +		ttm->backup = NULL;
> > > +	}
> > > +
> > >  	if (ttm->pages)
> > >  		kvfree(ttm->pages);
> > >  	else
> > > @@ -253,6 +262,34 @@ int ttm_tt_swapin(struct ttm_tt *ttm)
> > >  }
> > >  EXPORT_SYMBOL_FOR_TESTS_ONLY(ttm_tt_swapin);
> > >  
> > > +/**
> > > + * ttm_tt_backup() - Helper to back up a struct ttm_tt.
> > > + * @bdev: The TTM device.
> > > + * @tt: The struct ttm_tt.
> > > + * @flags: Flags that govern the backup behaviour.
> > > + *
> > > + * Update the page accounting and call ttm_pool_shrink_tt to free
> > > pages
> > > + * or back them up.
> > > + *
> > > + * Return: Number of pages freed or swapped out, or negative error
> > > code on
> > > + * error.
> > > + */
> > > +long ttm_tt_backup(struct ttm_device *bdev, struct ttm_tt *tt,
> > > +		   const struct ttm_backup_flags flags)
> > > +{
> > > +	long ret;
> > > +
> > > +	if (WARN_ON(IS_ERR_OR_NULL(tt->backup)))
> > > +		return 0;
> > > +
> > > +	ret = ttm_pool_backup_tt(&bdev->pool, tt, &flags);
> > > +
> > > +	if (ret > 0)
> > > +		tt->page_flags &= ~TTM_TT_FLAG_PRIV_POPULATED;
> > > +
> > > +	return ret;
> > > +}
> > > +
> > >  /**
> > >   * ttm_tt_swapout - swap out tt object
> > >   *
> > > diff --git a/include/drm/ttm/ttm_pool.h
> > > b/include/drm/ttm/ttm_pool.h
> > > index 160d954a261e..3112a4be835c 100644
> > > --- a/include/drm/ttm/ttm_pool.h
> > > +++ b/include/drm/ttm/ttm_pool.h
> > > @@ -33,6 +33,7 @@
> > >  
> > >  struct device;
> > >  struct seq_file;
> > > +struct ttm_backup_flags;
> > >  struct ttm_operation_ctx;
> > >  struct ttm_pool;
> > >  struct ttm_tt;
> > > @@ -89,6 +90,11 @@ void ttm_pool_fini(struct ttm_pool *pool);
> > >  
> > >  int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m);
> > >  
> > > +void ttm_pool_release_backed_up(struct ttm_tt *tt);
> > > +
> > > +long ttm_pool_backup_tt(struct ttm_pool *pool, struct ttm_tt *ttm,
> > > +			const struct ttm_backup_flags *flags);
> > > +
> > >  int ttm_pool_mgr_init(unsigned long num_pages);
> > >  void ttm_pool_mgr_fini(void);
> > >  
> > > diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> > > index 2b9d856ff388..e42a75cff502 100644
> > > --- a/include/drm/ttm/ttm_tt.h
> > > +++ b/include/drm/ttm/ttm_tt.h
> > > @@ -32,11 +32,13 @@
> > >  #include <drm/ttm/ttm_caching.h>
> > >  #include <drm/ttm/ttm_kmap_iter.h>
> > >  
> > > +struct ttm_backup;
> > >  struct ttm_device;
> > >  struct ttm_tt;
> > >  struct ttm_resource;
> > >  struct ttm_buffer_object;
> > >  struct ttm_operation_ctx;
> > > +struct ttm_pool_tt_restore;
> > >  
> > >  /**
> > >   * struct ttm_tt - This is a structure holding the pages, caching-
> > > and aperture
> > > @@ -85,6 +87,9 @@ struct ttm_tt {
> > >  	 * fault handling abuses the DMA api a bit and
> > > dma_map_attrs can't be
> > >  	 * used to assure pgprot always matches.
> > >  	 *
> > > +	 * TTM_TT_FLAG_PRIV_BACKED_UP: TTM internal only. This is
> > > set if the
> > > +	 * struct ttm_tt has been (possibly partially) backed up.
> > > +	 *
> > >  	 * TTM_TT_FLAG_PRIV_POPULATED: TTM internal only. DO NOT
> > > USE. This is
> > >  	 * set by TTM after ttm_tt_populate() has successfully
> > > returned, and is
> > >  	 * then unset when TTM calls ttm_tt_unpopulate().
> > > @@ -96,6 +101,7 @@ struct ttm_tt {
> > >  #define TTM_TT_FLAG_DECRYPTED		BIT(4)
> > >  
> > >  #define TTM_TT_FLAG_PRIV_POPULATED	BIT(5)
> > > +#define TTM_TT_FLAG_PRIV_BACKED_UP	BIT(6)
> > >  	uint32_t page_flags;
> > >  	/** @num_pages: Number of pages in the page array. */
> > >  	uint32_t num_pages;
> > > @@ -105,11 +111,19 @@ struct ttm_tt {
> > >  	dma_addr_t *dma_address;
> > >  	/** @swap_storage: Pointer to shmem struct file for swap
> > > storage. */
> > >  	struct file *swap_storage;
> > > +	/**
> > > +	 * @backup: Pointer to backup struct for backed up tts.
> > > +	 * Could be unified with @swap_storage. Meanwhile, this is
> > > +	 * a driver-owned field.
> > > +	 */
> > > +	struct ttm_backup *backup;
> > >  	/**
> > >  	 * @caching: The current caching state of the pages, see
> > > enum
> > >  	 * ttm_caching.
> > >  	 */
> > >  	enum ttm_caching caching;
> > > +	/** @restore: Partial restoration from backup state. TTM
> > > private */
> > > +	struct ttm_pool_tt_restore *restore;
> > >  };
> > >  
> > >  /**
> > > @@ -230,6 +244,21 @@ void ttm_tt_mgr_init(unsigned long num_pages,
> > > unsigned long num_dma32_pages);
> > >  struct ttm_kmap_iter *ttm_kmap_iter_tt_init(struct
> > > ttm_kmap_iter_tt *iter_tt,
> > >  					    struct ttm_tt *tt);
> > >  unsigned long ttm_tt_pages_limit(void);
> > > +
> > > +/**
> > > + * struct ttm_backup_flags - Flags to govern backup behaviour.
> > > + * @purge: Free pages without backing up. Bypass pools.
> > > + * @writeback: Attempt to copy contents directly to swap space,
> > > even
> > > + * if that means blocking on writes to external memory.
> > > + */
> > > +struct ttm_backup_flags {
> > > +	u32 purge : 1;
> > > +	u32 writeback : 1;
> > > +};
> > > +
> > > +long ttm_tt_backup(struct ttm_device *bdev, struct ttm_tt *tt,
> > > +		   const struct ttm_backup_flags flags);
> > > +
> > >  #if IS_ENABLED(CONFIG_AGP)
> > >  #include <linux/agp_backend.h>
> > >  
> > > -- 
> > > 2.44.0
> > > 
> 
