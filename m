Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B0BC16825
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 19:38:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26BC410E649;
	Tue, 28 Oct 2025 18:38:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gAbIL0q7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B88A310E647;
 Tue, 28 Oct 2025 18:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761676693; x=1793212693;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ZL/s5YS0GwkM2gOjOY/7XLerCH72rSNzjbVOpBG2m08=;
 b=gAbIL0q7v0mWg9ArwyH4nfAs+NPZ8YZXrseXh53Dg9YYDy8v0GBd4Iez
 hx/izKuREobTc8alnjDifhNy+yaeZQEhQ6gcdg89PwlM4pmMNHZ1JIVVl
 DXoV2uwo2qJAaKBgH6HXNNOUkTf4uunbLDeZPdBhFsA5YUXmCavCFhR/o
 l5vXMDzB9/OJfXeb8b05sYTDQ8IukHYqkydKOmVx+AS0Ip7Aghnu5XwY6
 GcH/HmxR/1jzFnnYQ8VggNAeVAvRxtiwLtWaMMC+l5djaHtHlUGtgHxzh
 TDvwWucLBA1NS+RxlaehKgRCcquqKh/XFdoFBkk78R6hb43FH1NJStSr3 A==;
X-CSE-ConnectionGUID: eblOlayYS1uq8NS6ONWdsA==
X-CSE-MsgGUID: E34W7lh3QUunukb0TiqcPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67651679"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="67651679"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 11:38:12 -0700
X-CSE-ConnectionGUID: wlEyGjhFQx20oC8sxWI2Mg==
X-CSE-MsgGUID: FIXjamC2SSydcewnbXKfng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="189477277"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 11:38:11 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 11:38:11 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 11:38:11 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.52) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 11:38:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AjWDqmI04OUrRQQy8bf24udOs241IEKBoeWFZrdqvZmel25FfhGRxQEtH7ub8RV3ur27Z4By54boqOxuwj6AIKjmTY/zUIDdDacDw2bszIK/ZEFmeL6HeRLyQBxsL7no1R0omDwXVkpHTOVJ7JbeBKREV3eTiQOrjYEOusCmYB/xv0iAoAjGOVg6Bw20OfcMLBAUhziNZt7urG4hAG6hYCT0DTrncR9k/N/MVW/GEOtj0scboDcUnkK+BAk1vQnixHGnEc43NR3DJ6OCozhPWwCQH5GBcSXpmDI3jtzBf2Oa2S5kuBUt3Z85G/BETSXRTwUycogjG1LwsRejcEd/yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wO0rkFrrMsa5pnGgF8V6cPt7cyRsx7ZSEo5yv2mVOaI=;
 b=SCwo5Zuo555nQ3JGsywumShsIRCNRQ0ffgjU/CMc+IKh+pClmqU3DQd3kK9MhTB8e7usMra9fp4BG2nyi8sMfVpOgGjOosA45IeOBNNBFjpoyxMyMC6Lo2BhGLCZhzvv/ZqIiEWVB4EH2rIA91tufbKEAuYSMcrDcPvLndc94yycdk0m28cKYPb29j6a7QHKWs9Ntl3f7QB9cojmnP0VksImBHVsiTV74YkO97ib2nhw62yQ4ksu0NhbWQbQL5qMPqB6sQB2mpbFI9gDxudjQX369TyLG/dYeK58rMcd0YhLdQRJSKb//8U4VAFZarZqFimG5aS/M4HLuL5SBgvyvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB8106.namprd11.prod.outlook.com (2603:10b6:510:255::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 18:38:07 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 18:38:07 +0000
Date: Tue, 28 Oct 2025 11:38:04 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH 04/15] drm/pagemap: Add a drm_pagemap cache and shrinker
Message-ID: <aQENjKTiEDFDpC+f@lstrano-desk.jf.intel.com>
References: <20251025120412.12262-1-thomas.hellstrom@linux.intel.com>
 <20251025120412.12262-5-thomas.hellstrom@linux.intel.com>
 <aQAbGiYv/u/0wnto@lstrano-desk.jf.intel.com>
 <17d29da26bf86172510133c28e18a99e90772c7d.camel@linux.intel.com>
 <58f21e3a1132665fcffda65cfbe09b081abce092.camel@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <58f21e3a1132665fcffda65cfbe09b081abce092.camel@linux.intel.com>
X-ClientProxiedBy: SJ0P220CA0006.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB8106:EE_
X-MS-Office365-Filtering-Correlation-Id: ffdd83ae-2640-44fe-de17-08de16512345
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N3NjWlNmQXVsZkR4bnUwd1BNM3NrMXMwWGVvRnczY3ZMZ3VSMnhXcXFhOXNh?=
 =?utf-8?B?Wkx3elJCd2pmcVc2SEVWUUkweWVZdy95NGpRLzdUYllWTFRzL2hvSCsvaUpW?=
 =?utf-8?B?OHozNWFRVVo0VjIxa3pCUEpjeVhYaFFlMUtaWmFmSFRHVXBJdzhpTlJ4UWUx?=
 =?utf-8?B?N0krS1M0YWg4Vk5UQnQ4TnRucDV4cUJXSVJXWW9pL3RPblRWVnZnYnRLZmF6?=
 =?utf-8?B?M3l3WVlFUkZOZVRJQzdNV0NHdUI2c3BraTYyV2h1TWFybHZ4bHkyZy9yNE9K?=
 =?utf-8?B?SGdhVldLSnZqdk5tZEhHWHV0a0dqR052UE5DUkVWSkU0NjQ5ZTIrUENiT21a?=
 =?utf-8?B?dlNsSkJVbjVwUGJhcmhmQllnY1dLYzYranowclh3OTVmeFJDVFhiSzRzZ3JT?=
 =?utf-8?B?SElTcGRtZmNEV21mdkhicVVLRE8rMVhFQ1pXMTJJU1g5NXlHMitkNVZlWVRR?=
 =?utf-8?B?YmI4QlcvTkFETjBVT1o2aFdwRU5QN3pSVzdXWTdhVTduWmdkV3ZwL2hoSHNO?=
 =?utf-8?B?MUpPSFRnSVB5Vng5Z3hYVHBGTnBGbG8yM1plb3U0MjZzWVBWSXl3UFhzNlJ6?=
 =?utf-8?B?YklmUlRlbTZnTXdSbFRNWW5TYUxwaUd4dHBlSVpTUFRKbXJsL2hVRktMeUp5?=
 =?utf-8?B?VEN0WTVvNDVEbzZIckxUeGhkcGFSdHoyY21BdE5jUzJZWUJOMURvUUQrNkRJ?=
 =?utf-8?B?NzVsaEFyc0Z2d3lHSVc4bjZXR21IUTg0VHVwOEJTOEJaTUgxcHEzSXVrOE8x?=
 =?utf-8?B?akQ5LzA1ZytyTXhVQUpVWmZOSS8yd2NXcUN2dHlWREJaQzF0Z0tQTlJCK01X?=
 =?utf-8?B?MG9lSXZCdHRQbTZ1N2Rqa01GQ3cySUl0SGJhVTI2cnFnTHpCZ2J0aVk0M2gr?=
 =?utf-8?B?eUJCbjFRRWZKSFBJOC9qYkNOTnNzY25Da1BVdVhqOUNDNFdFbW5iQVZNcmFi?=
 =?utf-8?B?b0VnenJIOVcwVlJUOTZXdEdxc1VybklhSkZPMWJxRVFFTkxRS1VPZEQwMmpz?=
 =?utf-8?B?SzJmUkhBUGJRb1B3K0dJb0lwMzdRTEZTZ1FMdmRUTHBPamRjMkZETVdkVUxX?=
 =?utf-8?B?NGxJMWc4REFSdXNWczZJK2psV1JRT29ncWErMVJJQlFaRXpUK0NUaEd6RkJP?=
 =?utf-8?B?LzFDcW02MTVFZklpTWlQNENqSmJQN09VZDhJVGJxaTR4T3VnUmxYRnNaOXJr?=
 =?utf-8?B?ZXF1Tm5CdlVjSjNUYmxBSVVpL3pNUHVhWitvdk0xTkMxRlVMczBvaGZZbGxi?=
 =?utf-8?B?OU5BYUMyeVkybXZQck1JOVgydnQwZ3dseXE2WTNOL3VGaTlKTDlXQkdjZUFv?=
 =?utf-8?B?UnZHbjlXc2lTY1ZUdldad1ZBc016ZDdkMWR5b3pzZ1hNMUcxL01GVUV1b29y?=
 =?utf-8?B?bkc1QXJqQVNVTjhxaGx3QXV5Qy91QzBUOVprT1JzeVhIclRMeVBJY0ZMRDBh?=
 =?utf-8?B?WmhaZ3VhTE1jaTFjckYwM0ViMm9uY1k0UVYrbTBjTDRmNFI0UXFiS3RxOVV6?=
 =?utf-8?B?Y3pRbk9NVFdqcEczYnlHcWNvdTZoQWd4V3RYbVFiZm9PMEFJbTJKZmJmQmY2?=
 =?utf-8?B?b2V0ZXBuUngzdWJONlpJY05LSE5YYmNJbFJzSFJTZ2Zwb2kxQXBYejJUeG9V?=
 =?utf-8?B?Mk0xRFlmMUFpamZFcGRqbi9WczBzWUxvTmxJclozamYyVzJvcHRLclk1QWhN?=
 =?utf-8?B?NDI0MUpSMjYvU0N1aVVCSWRHSXpkRG8zNzA1YlJZQ3dmQkNDNGVqdGx2Zlcy?=
 =?utf-8?B?b0RBUUJKUHRuN2V4cVo4dWRrWms4UC8rdlRMVHNrVDFYanU2aVIyOXJjWksw?=
 =?utf-8?B?Z21lemlYSmowOXNjdlZ0d3pMaGt5eWFQMTcyendPNkNsRE5wdnU1UTRQeVZR?=
 =?utf-8?B?UWVsU3Z1czRBUXlBZTY1d0JrNDB3RWllRHJPSFBqUExvWEE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTQ5V0ozK1pIb1NXTDIycWdwZExxN3RiUXBKdWJNRUZzMGs3R2NhWFhSNjQz?=
 =?utf-8?B?VkNzRnNhcC94SXltMUpPMGdWV0F1bXdZaGZOdmJzbCtXWkJrZ0I5bFJwWnVh?=
 =?utf-8?B?SENlbUZqZ05CNTBHV1pUWXpDcjY5aDZ5U1pMWC9xRlAwVzB5aEtVMzJRRDB4?=
 =?utf-8?B?ZG5SMmRDd1RHRmZpbkRIZTYzSDJGRWluTWV2WWdlTXgyQzRDRnBLNEI2OGxh?=
 =?utf-8?B?WE8wQzkvUzh0NUhTTzd3OUcwdmxFZmRHdWtmRllYcVVMWXJJWUI1Sng1T2hp?=
 =?utf-8?B?NEJUNHNUdVJsTW9EV1M2UTdjSlYrSUJ1KzR1MVpwdWFXR1N4aEFxeVQxTitj?=
 =?utf-8?B?NEZsVmlLMk9SQVU0YjhTWTM4WE9kTWlnUllQa1BXRmcwZ1JNQk9JM2pOMUNv?=
 =?utf-8?B?ZWxSRFRUOXMzeW1iV2dmajRYQTFjcmJoVlQyRG9iMUU4UWVNb1NyZWZ3OENq?=
 =?utf-8?B?SVRpZ1ZOTGFRdWxRbWs2cUZKZGF4dU5QTXA2ZjYzLzV1Nmc2RDM4aW9IN24y?=
 =?utf-8?B?d0pQak1pRHVTUCtjM1VNbXowdS9oWlVYbk0waFRhQmZLbFBOYWY2N1pQMWh4?=
 =?utf-8?B?TC8rQituZ2taK0JKM1plTVJpallReUkyd3pucXhVRUFZR3hJSXhiMGhRcU5I?=
 =?utf-8?B?ZWcvcHpmY0ZrYjVEbk1ld3BVdnNTVTJOZTcweDlEZEtLeUVVNUV3RHdUMThQ?=
 =?utf-8?B?V0pmd2VZTzZESGs4aTBIOG1mYWdvTDNEQXdMUmk0YlNBLzd1V2lIRG1kUGxv?=
 =?utf-8?B?R2JreVRvckpZdHFIKzJYV0FVeEFyeGlUVXZhbmN2SDMzRm53dktYdkkxb0to?=
 =?utf-8?B?YWxwMjZ6R2h2dkcvVlFkaTM0THJybVo2VTlQT05pNlFVRjBFZzJSdjd2Q0d3?=
 =?utf-8?B?SWdRNWtwTTMxdThXYXIzd2JnMzhUK1FLdTYxblVGaFUxUzljQklOeWZJVXNR?=
 =?utf-8?B?NjlzWE5Qa3lvc1MxWm93dXNYRE5hVDRUS1RJNXdtS01uY1F5SHhsd0UxVFRP?=
 =?utf-8?B?Q2w4SjZHYzdpU1U2VUUvYkRiYzVHRnhiYzV4YklVc2FoeGcxRmU2MGgxSjJY?=
 =?utf-8?B?dVJjd0FTalBDaFBheHdBaTlvdDFSOXZuTyt1ZSs0andpR0RKTlpIMDdOY09n?=
 =?utf-8?B?UEtKUEZERkM4ZDBKNHJyR2VIbzZDSVd4NmZnRElBaEI2YThyN0ljUE5xbnBj?=
 =?utf-8?B?bnpMSTVPNmVTMmZ4Um12cVp5c0tWS2N0Nys0UVI3MjNXL3F1WnR0ZUNwVHd1?=
 =?utf-8?B?K21YbjlRREZiZXFDcFpYQU1SOWpCZFB5ck9OUzY2NkxGLzA2UitaVXJrdzVs?=
 =?utf-8?B?VUppc0ljamNONlNnWWRCc3ZPMWdXZCt5eVVCSVhwRW9RbWI3d29pL05WUXdG?=
 =?utf-8?B?MjY1SGtWbTdkVldjOHM2b1IyQUI0QmcycHlnQkNlWHJ2d2lVNHFGVXl0N2Z0?=
 =?utf-8?B?ZzZadDlFQ0E1elpqcGhoOXRMODFNUHRGTDI1SUdCLzhnajE2V2RuNERtZFJM?=
 =?utf-8?B?Z1FkbnB6U3czNVlsSWRxYXNlLzgzaFFWdE5ybWZCQmx2Sm1kbTFJdXJWMGRx?=
 =?utf-8?B?R3FVRnBWek9xeXNaMnE3SDRWQWQ0dkwxVVRPeHBLZzVHYXE1UllPV0VyZXcz?=
 =?utf-8?B?dlhOSUdrbERLc1hMU3FTMTEyZVNzN252V0xxVmppVXdVMkUwS3RDZ25iaDZi?=
 =?utf-8?B?R0pHZDdSVlB2MDZldWlJRENqVFlLdVNiVWluQzdabkZzM1pjTHpZNnlEa3kv?=
 =?utf-8?B?RUlPKzYxcXZ4bGZNdVFPcm4wamVoYktzNitLdWhSYzJJZzAzQlIrR0tNN1o2?=
 =?utf-8?B?SmgvV2x5ZE1lVWl0bWM5eUUyQmJMNFg1aXd3eEpZa2E3MVdjU3BiNlM3QXpD?=
 =?utf-8?B?OVNTV1BBdVVnY2drL1cxR2pYUnVQUXlabnBJUzFId3NvTWZiTzE3WnVHQk9I?=
 =?utf-8?B?cGZ6ZU1MbFRxZklSUkdrVHRaNG41UnJjMzdGanhZRSs5YmJxZndZZDJZN0NK?=
 =?utf-8?B?Sk9sbVFOUUVzVEw5bS9jQjBNbjdWWkprL0JzOE85b3NaQlp3RmVJaysrYktp?=
 =?utf-8?B?ZXJ1ckRScVJPaElqSHFZQjRKNXF2SllaUWdoRVJodWp6dG1GS3hPdXFRUTBn?=
 =?utf-8?B?OUF5YkZLZVkrRVVoVENZdTRhOE51cS9lNXJhaTN6ZGZDT0RvcWYwK0NEK1Vt?=
 =?utf-8?B?bFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ffdd83ae-2640-44fe-de17-08de16512345
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 18:38:07.6671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SScCfexdYDOW7UxInEZCBWNm7KOCAxq0w12WhAQ/wjH7FqQoWQ8zDKujn4tJU2ltjd3uNB/071baLvImtymELg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8106
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

On Tue, Oct 28, 2025 at 11:29:19AM +0100, Thomas Hellström wrote:
> On Tue, 2025-10-28 at 10:46 +0100, Thomas Hellström wrote:
> > On Mon, 2025-10-27 at 18:23 -0700, Matthew Brost wrote:
> > > On Sat, Oct 25, 2025 at 02:04:01PM +0200, Thomas Hellström wrote:
> > > > Pagemaps are costly to set up and tear down, and they consume a
> > > > lot
> > > > of system memory for the struct pages. Ideally they should be
> > > > created only when needed.
> > > > 
> > > > Add a caching mechanism to allow doing just that: Create the
> > > > drm_pagemaps
> > > > when needed for migration. Keep them around to avoid destruction
> > > > and
> > > > re-creation latencies and destroy inactive/unused drm_pagemaps on
> > > > memory
> > > > pressure using a shrinker.
> > > > 
> > > > Only add the helper functions. They will be hooked up to the xe
> > > > driver
> > > > in the upcoming patch.
> > > > 
> > > > Signed-off-by: Thomas Hellström
> > > > <thomas.hellstrom@linux.intel.com>
> > > > ---
> > > >  drivers/gpu/drm/Makefile           |   3 +-
> > > >  drivers/gpu/drm/drm_pagemap.c      |  79 +++++-
> > > >  drivers/gpu/drm/drm_pagemap_util.c | 426
> > > > +++++++++++++++++++++++++++++
> > > >  include/drm/drm_pagemap.h          |  53 +++-
> > > >  include/drm/drm_pagemap_util.h     |  25 ++
> > > >  5 files changed, 569 insertions(+), 17 deletions(-)
> > > >  create mode 100644 drivers/gpu/drm/drm_pagemap_util.c
> > > >  create mode 100644 include/drm/drm_pagemap_util.h
> > > > 
> > > > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > > > index c2672f369aed..cdca68fd9f23 100644
> > > > --- a/drivers/gpu/drm/Makefile
> > > > +++ b/drivers/gpu/drm/Makefile
> > > > @@ -107,7 +107,8 @@ obj-$(CONFIG_DRM_GPUVM) += drm_gpuvm.o
> > > >  
> > > >  drm_gpusvm_helper-y := \
> > > >  	drm_gpusvm.o\
> > > > -	drm_pagemap.o
> > > > +	drm_pagemap.o\
> > > > +	drm_pagemap_util.o
> > > >  obj-$(CONFIG_DRM_GPUSVM) += drm_gpusvm_helper.o
> > > >  
> > > >  obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
> > > > diff --git a/drivers/gpu/drm/drm_pagemap.c
> > > > b/drivers/gpu/drm/drm_pagemap.c
> > > > index fb18a80d6a1c..5ca5b2b53bc1 100644
> > > > --- a/drivers/gpu/drm/drm_pagemap.c
> > > > +++ b/drivers/gpu/drm/drm_pagemap.c
> > > > @@ -8,6 +8,7 @@
> > > >  #include <linux/pagemap.h>
> > > >  #include <drm/drm_drv.h>
> > > >  #include <drm/drm_pagemap.h>
> > > > +#include <drm/drm_pagemap_util.h>
> > > >  #include <drm/drm_print.h>
> > > >  
> > > >  /**
> > > > @@ -578,7 +579,7 @@ static void drm_pagemap_release(struct kref
> > > > *ref)
> > > >  	 * pagemap provider drm_device and its module.
> > > >  	 */
> > > >  	dpagemap->dev_hold = NULL;
> > > > -	kfree(dpagemap);
> > > > +	drm_pagemap_shrinker_add(dpagemap);
> > > >  	llist_add(&dev_hold->link, &drm_pagemap_unhold_list);
> > > >  	schedule_work(&drm_pagemap_work);
> > > >  	/*
> > > > @@ -628,6 +629,58 @@ drm_pagemap_dev_hold(struct drm_pagemap
> > > > *dpagemap)
> > > >  	return dev_hold;
> > > >  }
> > > >  
> > > > +/**
> > > > + * drm_pagemap_reinit() - Reinitialize a drm_pagemap
> > > > + * @dpagemap: The drm_pagemap to reinitialize
> > > > + *
> > > > + * Reinitialize a drm_pagemap, for which drm_pagemap_release
> > > > + * has already been called. This interface is intended for the
> > > > + * situation where the driver caches a destroyed drm_pagemap.
> > > > + *
> > > > + * Return: 0 on success, negative error code on failure.
> > > > + */
> > > > +int drm_pagemap_reinit(struct drm_pagemap *dpagemap)
> > > > +{
> > > > +	dpagemap->dev_hold = drm_pagemap_dev_hold(dpagemap);
> > > > +	if (IS_ERR(dpagemap->dev_hold))
> > > > +		return PTR_ERR(dpagemap->dev_hold);
> > > > +
> > > > +	kref_init(&dpagemap->ref);
> > > > +	return 0;
> > > > +}
> > > > +EXPORT_SYMBOL(drm_pagemap_reinit);
> > > > +
> > > > +/**
> > > > + * drm_pagemap_init() - Initialize a pre-allocated drm_pagemap
> > > > + * @dpagemap: The drm_pagemap to initialize.
> > > > + * @pagemap: The associated dev_pagemap providing the device
> > > > + * private pages.
> > > > + * @drm: The drm device. The drm_pagemap holds a reference on
> > > > the
> > > > + * drm_device and the module owning the drm_device until
> > > > + * drm_pagemap_release(). This facilitates drm_pagemap
> > > > exporting.
> > > > + * @ops: The drm_pagemap ops.
> > > > + *
> > > > + * Initialize and take an initial reference on a drm_pagemap.
> > > > + * After successful return, use drm_pagemap_put() to destroy.
> > > > + *
> > > > + ** Return: 0 on success, negative error code on error.
> > > > + */
> > > > +int drm_pagemap_init(struct drm_pagemap *dpagemap,
> > > > +		     struct dev_pagemap *pagemap,
> > > > +		     struct drm_device *drm,
> > > > +		     const struct drm_pagemap_ops *ops)
> > > > +{
> > > > +	kref_init(&dpagemap->ref);
> > > > +	dpagemap->ops = ops;
> > > > +	dpagemap->pagemap = pagemap;
> > > > +	dpagemap->drm = drm;
> > > > +	dpagemap->cache = NULL;
> > > > +	INIT_LIST_HEAD(&dpagemap->shrink_link);
> > > > +
> > > > +	return drm_pagemap_reinit(dpagemap);
> > > > +}
> > > > +EXPORT_SYMBOL(drm_pagemap_init);
> > > > +
> > > >  /**
> > > >   * drm_pagemap_create() - Create a struct drm_pagemap.
> > > >   * @drm: Pointer to a struct drm_device providing the device-
> > > > private memory.
> > > > @@ -645,22 +698,14 @@ drm_pagemap_create(struct drm_device *drm,
> > > >  		   const struct drm_pagemap_ops *ops)
> > > >  {
> > > >  	struct drm_pagemap *dpagemap =
> > > > kzalloc(sizeof(*dpagemap),
> > > > GFP_KERNEL);
> > > > -	struct drm_pagemap_dev_hold *dev_hold;
> > > > +	int err;
> > > >  
> > > >  	if (!dpagemap)
> > > >  		return ERR_PTR(-ENOMEM);
> > > >  
> > > > -	kref_init(&dpagemap->ref);
> > > > -	dpagemap->drm = drm;
> > > > -	dpagemap->ops = ops;
> > > > -	dpagemap->pagemap = pagemap;
> > > > -
> > > > -	dev_hold = drm_pagemap_dev_hold(dpagemap);
> > > > -	if (IS_ERR(dev_hold)) {
> > > > -		kfree(dpagemap);
> > > > -		return ERR_CAST(dev_hold);
> > > > -	}
> > > > -	dpagemap->dev_hold = dev_hold;
> > > > +	err = drm_pagemap_init(dpagemap, pagemap, drm, ops);
> > > > +	if (err)
> > > > +		return ERR_PTR(err);
> > > >  
> > > >  	return dpagemap;
> > > >  }
> > > > @@ -1023,6 +1068,14 @@ int drm_pagemap_populate_mm(struct
> > > > drm_pagemap *dpagemap,
> > > >  }
> > > >  EXPORT_SYMBOL(drm_pagemap_populate_mm);
> > > >  
> > > > +void drm_pagemap_destroy(struct drm_pagemap *dpagemap, bool
> > > > is_atomic_or_reclaim)
> > > > +{
> > > > +	if (dpagemap->ops->destroy)
> > > > +		dpagemap->ops->destroy(dpagemap,
> > > > is_atomic_or_reclaim);
> > > > +	else
> > > > +		kfree(dpagemap);
> > > > +}
> > > > +
> > > >  static void drm_pagemap_exit(void)
> > > >  {
> > > >  	flush_work(&drm_pagemap_work);
> > > > diff --git a/drivers/gpu/drm/drm_pagemap_util.c
> > > > b/drivers/gpu/drm/drm_pagemap_util.c
> > > > new file mode 100644
> > > > index 000000000000..e1a1d6bf25f4
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/drm_pagemap_util.c
> > > > @@ -0,0 +1,426 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> > > > +/*
> > > > + * Copyright © 2025 Intel Corporation
> > > > + */
> > > > +
> > > > +#include <drm/drm_drv.h>
> > > > +#include <drm/drm_managed.h>
> > > > +#include <drm/drm_pagemap.h>
> > > > +#include <drm/drm_pagemap_util.h>
> > > > +#include <drm/drm_print.h>
> > > > +
> > > > +/**
> > > > + * struct drm_pagemap_cache - Lookup structure for pagemaps
> > > > + *
> > > > + * Structure to keep track of active (refcount > 1) and inactive
> > > > + * (refcount == 0) pagemaps. Inactive pagemaps can be made
> > > > active
> > > > + * again by waiting for the @queued completion (indicating that
> > > > the
> > > > + * pagemap has been put on the @shrinker's list of shrinkable
> > > > + * pagemaps, and then successfully removing it from @shrinker's
> > > > + * list. The latter may fail if the shrinker is already in the
> > > > + * process of freeing the pagemap. A struct drm_pagemap_cache
> > > > can
> > > > + * hold a single struct drm_pagemap.
> > > > + */
> > > > +struct drm_pagemap_cache {
> > > > +	/** @lookup_mutex: Mutex making the lookup process
> > > > atomic
> > > > */
> > > > +	struct mutex lookup_mutex;
> > > > +	/** @lock: Lock protecting the @dpagemap pointer */
> > > > +	spinlock_t lock;
> > > > +	/** @shrinker: Pointer to the shrinker used for this
> > > > cache. Immutable. */
> > > > +	struct drm_pagemap_shrinker *shrinker;
> > > > +	/** @dpagemap: Non-refcounted pointer to the drm_pagemap
> > > > */
> > > > +	struct drm_pagemap *dpagemap;
> > > > +	/**
> > > > +	 * @queued: Signals when an inactive drm_pagemap has
> > > > been
> > > > put on
> > > > +	 * @shrinker's list.
> > > > +	 */
> > > > +	struct completion queued;
> > > > +};
> > > > +
> > > > +/**
> > > > + * struct drm_pagemap_shrinker - Shrinker to remove unused
> > > > pagemaps
> > > > + */
> > > > +struct drm_pagemap_shrinker {
> > > > +	/** @drm: Pointer to the drm device. */
> > > > +	struct drm_device *drm;
> > > > +	/** @lock: Spinlock to protect the @dpagemaps list. */
> > > > +	spinlock_t lock;
> > > > +	/** @dpagemaps: List of unused dpagemaps. */
> > > > +	struct list_head dpagemaps;
> > > > +	/** @num_dpagemaps: Number of unused dpagemaps in
> > > > @dpagemaps. */
> > > > +	atomic_t num_dpagemaps;
> > > > +	/** @shrink: Pointer to the struct shrinker. */
> > > > +	struct shrinker *shrink;
> > > > +};
> > > > +
> > > > +static bool drm_pagemap_shrinker_cancel(struct drm_pagemap
> > > > *dpagemap);
> > > > +
> > > > +static void drm_pagemap_cache_fini(void *arg)
> > > > +{
> > > > +	struct drm_pagemap_cache *cache = arg;
> > > > +	struct drm_pagemap *dpagemap;
> > > > +
> > > > +	drm_dbg(cache->shrinker->drm, "Destroying dpagemap
> > > > cache.\n");
> > > > +	spin_lock(&cache->lock);
> > > > +	dpagemap = cache->dpagemap;
> > > > +	if (!dpagemap) {
> > > > +		spin_unlock(&cache->lock);
> > > > +		goto out;
> > > > +	}
> > > > +
> > > > +	if (drm_pagemap_shrinker_cancel(dpagemap)) {
> > > > +		cache->dpagemap = NULL;
> > > > +		spin_unlock(&cache->lock);
> > > > +		drm_pagemap_destroy(dpagemap, false);
> > > > +	}
> > > > +
> > > > +out:
> > > > +	mutex_destroy(&cache->lookup_mutex);
> > > > +	kfree(cache);
> > > > +}
> > > > +
> > > > +/**
> > > > + * drm_pagemap_cache_create_devm() - Create a drm_pagemap_cache
> > > > + * @shrinker: Pointer to a struct drm_pagemap_shrinker.
> > > > + *
> > > > + * Create a device-managed drm_pagemap cache. The cache is
> > > > automatically
> > > > + * destroyed on struct device removal, at which point any
> > > > *inactive*
> > > > + * drm_pagemap's are destroyed.
> > > > + *
> > > > + * Return: Pointer to a struct drm_pagemap_cache on success.
> > > > Error
> > > > pointer
> > > > + * on failure.
> > > > + */
> > > > +struct drm_pagemap_cache *drm_pagemap_cache_create_devm(struct
> > > > drm_pagemap_shrinker *shrinker)
> > > > +{
> > > > +	struct drm_pagemap_cache *cache =
> > > > kzalloc(sizeof(*cache),
> > > > GFP_KERNEL);
> > > > +	int err;
> > > > +
> > > > +	if (!cache)
> > > > +		return ERR_PTR(-ENOMEM);
> > > > +
> > > > +	mutex_init(&cache->lookup_mutex);
> > > > +	spin_lock_init(&cache->lock);
> > > > +	cache->shrinker = shrinker;
> > > > +	init_completion(&cache->queued);
> > > > +	err = devm_add_action_or_reset(shrinker->drm->dev,
> > > > drm_pagemap_cache_fini, cache);
> > > > +	if (err)
> > > > +		return ERR_PTR(err);
> > > > +
> > > > +	return cache;
> > > > +}
> > > > +EXPORT_SYMBOL(drm_pagemap_cache_create_devm);
> > > > +
> > > > +/**
> > > > + * DOC: Cache lookup
> > > > + *
> > > > + * Cache lookup should be done under a locked mutex, so that a
> > > > + * failed drm_pagemap_get_from_cache() and a following
> > > > + * drm_pagemap_cache_setpagemap() are carried out as an atomic
> > > > + * operation WRT other lookups. Otherwise, racing lookups may
> > > > + * unnecessarily concurrently create pagemaps to fulfill a
> > > > + * failed lookup. The API provides two functions to perform this
> > > > lock,
> > > > + * drm_pagemap_lock_lookup() and drm_pagemap_unlock_lookup() and
> > > > they
> > > > + * should be used in the following way:
> > > > + *
> > > > + * .. code-block:: c
> > > > + *
> > > > + *		drm_pagemap_lock_lookup(cache);
> > > > + *		dpagemap = drm_pagemap_get_from_cache(cache);
> > > > + *		if (dpagemap)
> > > > + *			goto out_unlock;
> > > > + *
> > > > + *		dpagemap = driver_create_new_dpagemap();
> > > > + *		if (!IS_ERR(dpagemap))
> > > > + *			drm_pagemap_cache_set_pagemap(cache,
> > > > dpagemap);
> > > > + *
> > > > + *     out_unlock:
> > > > + *		drm_pagemap_unlock_lookup(cache);
> > > > + */
> > > > +
> > > > +/**
> > > > + * drm_pagemap_cache_lock_lookup() Lock a drm_pagemap_cache for
> > > > lookup
> > > > + * @cache: The drm_pagemap_cache to lock.
> > > > + *
> > > > + * Return: %-EINTR if interrupted while blocking. %0 otherwise.
> > > > + */
> > > > +int drm_pagemap_cache_lock_lookup(struct drm_pagemap_cache
> > > > *cache)
> > > > +{
> > > > +	return mutex_lock_interruptible(&cache->lookup_mutex);
> > > > +}
> > > > +EXPORT_SYMBOL(drm_pagemap_cache_lock_lookup);
> > > > +
> > > > +/**
> > > > + * drm_pagemap_cache_unlock_lookup() Unlock a drm_pagemap_cache
> > > > after lookup
> > > > + * @cache: The drm_pagemap_cache to unlock.
> > > > + */
> > > > +void drm_pagemap_cache_unlock_lookup(struct drm_pagemap_cache
> > > > *cache)
> > > > +{
> > > > +	mutex_unlock(&cache->lookup_mutex);
> > > > +}
> > > > +EXPORT_SYMBOL(drm_pagemap_cache_unlock_lookup);
> > > > +
> > > > +/**
> > > > + * drm_pagemap_get_from_cache() -  Lookup of drm_pagemaps.
> > > > + * @cache: The cache used for lookup.
> > > > + *
> > > > + * If an active pagemap is present in the cache, it is
> > > > immediately
> > > > returned.
> > > > + * If an inactive pagemap is present, it's removed from the
> > > > shrinker list and
> > > > + * an attempt is made to make it active.
> > > > + * If no pagemap present or the attempt to make it active
> > > > failed,
> > > > %NULL is returned
> > > > + * to indicate to the caller to create a new drm_pagemap and
> > > > insert it into
> > > > + * the cache.
> > > > + *
> > > > + * Return: A reference-counted pointer to a drm_pagemap if
> > > > successful. An error
> > > > + * pointer if an error occurred, or %NULL if no drm_pagemap was
> > > > found and
> > > > + * the caller should insert a new one.
> > > > + */
> > > > +struct drm_pagemap *drm_pagemap_get_from_cache(struct
> > > > drm_pagemap_cache *cache)
> > > > +{
> > > > +	struct drm_pagemap *dpagemap;
> > > > +	int err;
> > > > +
> > > > +	lockdep_assert_held(&cache->lookup_mutex);
> > > > +retry:
> > > > +	spin_lock(&cache->lock);
> > > > +	dpagemap = cache->dpagemap;
> > > > +	if (drm_pagemap_get_unless_zero(dpagemap)) {
> > > > +		spin_unlock(&cache->lock);
> > > > +		return dpagemap;
> > > > +	}
> > > > +
> > > > +	if (!dpagemap) {
> > > > +		spin_unlock(&cache->lock);
> > > > +		return NULL;
> > > > +	}
> > > > +
> > > > +	if (!try_wait_for_completion(&cache->queued)) {
> > > > +		spin_unlock(&cache->lock);
> > > > +		err = wait_for_completion_interruptible(&cache-
> > > > > queued);
> > > > +		if (err)
> > > > +			return ERR_PTR(err);
> > > > +		goto retry;
> > > > +	}
> > > > +
> > > > +	if (drm_pagemap_shrinker_cancel(dpagemap)) {
> > > > +		cache->dpagemap = NULL;
> > > > +		spin_unlock(&cache->lock);
> > > > +		err = drm_pagemap_reinit(dpagemap);
> > > > +		if (err) {
> > > > +			drm_pagemap_destroy(dpagemap, false);
> > > > +			return ERR_PTR(err);
> > > > +		}
> > > > +		drm_pagemap_cache_set_pagemap(cache, dpagemap);
> > > > +	} else {
> > > > +		cache->dpagemap = NULL;
> > > > +		spin_unlock(&cache->lock);
> > > > +		dpagemap = NULL;
> > > > +	}
> > > > +
> > > > +	return dpagemap;
> > > > +}
> > > > +EXPORT_SYMBOL(drm_pagemap_get_from_cache);
> > > > +
> > > > +/**
> > > > + * drm_pagemap_cache_set_pagemap() - Assign a drm_pagemap to a
> > > > drm_pagemap_cache
> > > > + * @cache: The cache to assign the drm_pagemap to.
> > > > + * @dpagemap: The drm_pagemap to assign.
> > > > + *
> > > > + * The function must be called to populate a drm_pagemap_cache
> > > > only
> > > > + * after a call to drm_pagemap_get_from_cache() returns NULL.
> > > > + */
> > > > +void drm_pagemap_cache_set_pagemap(struct drm_pagemap_cache
> > > > *cache, struct drm_pagemap *dpagemap)
> > > > +{
> > > > +	struct drm_device *drm = dpagemap->drm;
> > > > +
> > > > +	lockdep_assert_held(&cache->lookup_mutex);
> > > > +	spin_lock(&cache->lock);
> > > > +	dpagemap->cache = cache;
> > > > +	swap(cache->dpagemap, dpagemap);
> > > > +	reinit_completion(&cache->queued);
> > > > +	spin_unlock(&cache->lock);
> > > > +	drm_WARN_ON(drm, !!dpagemap);
> > > > +}
> > > > +EXPORT_SYMBOL(drm_pagemap_cache_set_pagemap);
> > > > +
> > > > +/**
> > > > + * drm_pagemap_get_from_cache_if_active() - Quick lookup of
> > > > active
> > > > drm_pagemaps
> > > > + * @cache: The cache to lookup from.
> > > > + *
> > > > + * Function that should be used to lookup a drm_pagemap that is
> > > > already active.
> > > > + * (refcount > 0).
> > > > + *
> > > > + * Return: A pointer to the cache's drm_pagemap if it's active;
> > > > %NULL otherwise.
> > > > + */
> > > > +struct drm_pagemap *drm_pagemap_get_from_cache_if_active(struct
> > > > drm_pagemap_cache *cache)
> > > > +{
> > > > +	struct drm_pagemap *dpagemap;
> > > > +
> > > > +	spin_lock(&cache->lock);
> > > > +	dpagemap = drm_pagemap_get_unless_zero(cache->dpagemap);
> > > > +	spin_unlock(&cache->lock);
> > > > +
> > > > +	return dpagemap;
> > > > +}
> > > > +EXPORT_SYMBOL(drm_pagemap_get_from_cache_if_active);
> > > > +
> > > > +static bool drm_pagemap_shrinker_cancel(struct drm_pagemap
> > > > *dpagemap)
> > > > +{
> > > > +	struct drm_pagemap_cache *cache = dpagemap->cache;
> > > > +	struct drm_pagemap_shrinker *shrinker = cache->shrinker;
> > > > +
> > > > +	spin_lock(&shrinker->lock);
> > > > +	if (list_empty(&dpagemap->shrink_link)) {
> > > > +		spin_unlock(&shrinker->lock);
> > > > +		return false;
> > > > +	}
> > > > +
> > > > +	list_del_init(&dpagemap->shrink_link);
> > > > +	atomic_dec(&shrinker->num_dpagemaps);
> > > > +	spin_unlock(&shrinker->lock);
> > > > +	return true;
> > > > +}
> > > > +
> > > > +/**
> > > > + * drm_pagemap_shrinker_add() - Add a drm_pagemap to the
> > > > shrinker
> > > > list or destroy
> > > > + * @dpagemap: The drm_pagemap.
> > > > + *
> > > > + * If @dpagemap is associated with a &struct drm_pagemap_cache
> > > > AND
> > > > the
> > > > + * struct device backing the drm device is still alive, add
> > > > @dpagemap to
> > > > + * the &struct drm_pagemap_shrinker list of shrinkable
> > > > drm_pagemaps.
> > > > + *
> > > > + * Otherwise destroy the pagemap directly using
> > > > drm_pagemap_destroy().
> > > > + *
> > > > + * This is an internal function which is not intended to be
> > > > exposed to drivers.
> > > > + */
> > > > +void drm_pagemap_shrinker_add(struct drm_pagemap *dpagemap)
> > > 
> > > Not a full review - slowly wrapping my head around the first 6
> > > patches
> > > but one quick question.
> > > 
> > > This is called from drm_pagemap_put. How do we know what type of
> > > context
> > > we're in? It seems like this could be called from either process
> > > context
> > > or atomic context (e.g., via drm_pagemap_zdd_destroy through
> > > drm_pagemap_page_free). This code doesn’t appear to work in atomic
> > > contexts—if I recall correctly, drm_dev_enter can’t be called from
> > > atomic context. Also, we're missing irqsave on the spinlock.
> > 
> > From reading up on srcu_read_lock(), which is hiding behind
> > drm_dev_enter(), it should be OK to call from atomic context as long
> > as

Yes, that should be fine then.

> > it is also released from the same context. I indeed checked that we
> > could call it under a spinlock without getting any lockdep warnings. 
> > 
> > The irqsave on the spinlock is a different thing, though. Do we know
> > that drm_pagemap_page_free() will be called from irq context?

IIRC it is weird corner case where the final put can be called from an
atomic context but perhaps I am misremembering here. Maybe it was the
final put was from reclaim and that's way we needed worker to be able
put the BO which takes a dma-resv lock?

> 
> Looks like the dmirror_devmem_free()
> https://elixir.bootlin.com/linux/v6.18-rc3/source/lib/test_hmm.c#L1377
> 
> uses a spinlock without irqsave.
> 
> That said, I can add a drm_pagemap_shrinker_might_lock() to our
> page_free() callback for CONFIG_PROVE_LOCKING.
> 

Again maybe I am miremembering here but I agree some lockdep magic would
be good to ensure our design is correct.

Matt

> /Thomas
> 
> 
> > 
> > /Thomas
> > 
> > 
> > 
> > > 
> > > We had a worker for ZDD destroy at one point—should we revive that?
> > > If
> > > we did, I think we could safely enforce a rule that drm_pagemap
> > > operations must only be called from process context.
> > > 
> > > Matt
> > > 
> > > > +{
> > > > +	struct drm_pagemap_cache *cache;
> > > > +	struct drm_pagemap_shrinker *shrinker;
> > > > +	int idx;
> > > > +
> > > > +	/*
> > > > +	 * The pagemap cache and shrinker are disabled at
> > > > +	 * pci device remove time. After that, dpagemaps
> > > > +	 * are freed directly.
> > > > +	 */
> > > > +	if (!drm_dev_enter(dpagemap->drm, &idx))
> > > > +		goto out_no_cache;
> > > > +
> > > > +	cache = dpagemap->cache;
> > > > +	if (!cache) {
> > > > +		drm_dev_exit(idx);
> > > > +		goto out_no_cache;
> > > > +	}
> > > > +
> > > > +	shrinker = cache->shrinker;
> > > > +	spin_lock(&shrinker->lock);
> > > > +	list_add_tail(&dpagemap->shrink_link, &shrinker-
> > > > > dpagemaps);
> > > > +	atomic_inc(&shrinker->num_dpagemaps);
> > > > +	spin_unlock(&shrinker->lock);
> > > > +	complete_all(&cache->queued);
> > > > +	drm_dev_exit(idx);
> > > > +	return;
> > > > +
> > > > +out_no_cache:
> > > > +	drm_pagemap_destroy(dpagemap, true);
> > > > +}
> > > > +
> > > > +static unsigned long
> > > > +drm_pagemap_shrinker_count(struct shrinker *shrink, struct
> > > > shrink_control *sc)
> > > > +{
> > > > +	struct drm_pagemap_shrinker *shrinker = shrink-
> > > > > private_data;
> > > > +	unsigned long count = atomic_read(&shrinker-
> > > > > num_dpagemaps);
> > > > +
> > > > +	return count ? : SHRINK_EMPTY;
> > > > +}
> > > > +
> > > > +static unsigned long
> > > > +drm_pagemap_shrinker_scan(struct shrinker *shrink, struct
> > > > shrink_control *sc)
> > > > +{
> > > > +	struct drm_pagemap_shrinker *shrinker = shrink-
> > > > > private_data;
> > > > +	struct drm_pagemap *dpagemap;
> > > > +	struct drm_pagemap_cache *cache;
> > > > +	unsigned long nr_freed = 0;
> > > > +
> > > > +	sc->nr_scanned = 0;
> > > > +	spin_lock(&shrinker->lock);
> > > > +	do {
> > > > +		dpagemap = list_first_entry_or_null(&shrinker-
> > > > > dpagemaps, typeof(*dpagemap),
> > > > +						   
> > > > shrink_link);
> > > > +		if (!dpagemap)
> > > > +			break;
> > > > +
> > > > +		atomic_dec(&shrinker->num_dpagemaps);
> > > > +		list_del_init(&dpagemap->shrink_link);
> > > > +		spin_unlock(&shrinker->lock);
> > > > +
> > > > +		sc->nr_scanned++;
> > > > +		nr_freed++;
> > > > +
> > > > +		cache = dpagemap->cache;
> > > > +		spin_lock(&cache->lock);
> > > > +		cache->dpagemap = NULL;
> > > > +		spin_unlock(&cache->lock);
> > > > +
> > > > +		drm_dbg(dpagemap->drm, "Shrinking dpagemap
> > > > %p.\n",
> > > > dpagemap);
> > > > +		drm_pagemap_destroy(dpagemap, true);
> > > > +		spin_lock(&shrinker->lock);
> > > > +	} while (sc->nr_scanned < sc->nr_to_scan);
> > > > +	spin_unlock(&shrinker->lock);
> > > > +
> > > > +	return sc->nr_scanned ? nr_freed : SHRINK_STOP;
> > > > +}
> > > > +
> > > > +static void drm_pagemap_shrinker_fini(void *arg)
> > > > +{
> > > > +	struct drm_pagemap_shrinker *shrinker = arg;
> > > > +
> > > > +	drm_dbg(shrinker->drm, "Destroying dpagemap
> > > > shrinker.\n");
> > > > +	drm_WARN_ON(shrinker->drm, !!atomic_read(&shrinker-
> > > > > num_dpagemaps));
> > > > +	shrinker_free(shrinker->shrink);
> > > > +	kfree(shrinker);
> > > > +}
> > > > +
> > > > +/**
> > > > + * drm_pagemap_shrinker_create_devm() - Create and register a
> > > > pagemap shrinker
> > > > + * @drm: The drm device
> > > > + *
> > > > + * Create and register a pagemap shrinker that shrinks unused
> > > > pagemaps
> > > > + * and thereby reduces memory footprint.
> > > > + * The shrinker is drm_device managed and unregisters itself
> > > > when
> > > > + * the drm device is removed.
> > > > + *
> > > > + * Return: %0 on success, negative error code on failure.
> > > > + */
> > > > +struct drm_pagemap_shrinker
> > > > *drm_pagemap_shrinker_create_devm(struct drm_device *drm)
> > > > +{
> > > > +	struct drm_pagemap_shrinker *shrinker;
> > > > +	struct shrinker *shrink;
> > > > +	int err;
> > > > +
> > > > +	shrinker = kzalloc(sizeof(*shrinker), GFP_KERNEL);
> > > > +	if (!shrinker)
> > > > +		return ERR_PTR(-ENOMEM);
> > > > +
> > > > +	shrink = shrinker_alloc(0, "drm-drm_pagemap:%s", drm-
> > > > > unique);
> > > > +	if (!shrink) {
> > > > +		kfree(shrinker);
> > > > +		return ERR_PTR(-ENOMEM);
> > > > +	}
> > > > +
> > > > +	spin_lock_init(&shrinker->lock);
> > > > +	INIT_LIST_HEAD(&shrinker->dpagemaps);
> > > > +	shrinker->drm = drm;
> > > > +	shrinker->shrink = shrink;
> > > > +	shrink->count_objects = drm_pagemap_shrinker_count;
> > > > +	shrink->scan_objects = drm_pagemap_shrinker_scan;
> > > > +	shrink->private_data = shrinker;
> > > > +	shrinker_register(shrink);
> > > > +
> > > > +	err = devm_add_action_or_reset(drm->dev,
> > > > drm_pagemap_shrinker_fini, shrinker);
> > > > +	if (err)
> > > > +		return ERR_PTR(err);
> > > > +
> > > > +	return shrinker;
> > > > +}
> > > > +EXPORT_SYMBOL(drm_pagemap_shrinker_create_devm);
> > > > diff --git a/include/drm/drm_pagemap.h
> > > > b/include/drm/drm_pagemap.h
> > > > index 5cfe54331ba7..4b9af5e785c6 100644
> > > > --- a/include/drm/drm_pagemap.h
> > > > +++ b/include/drm/drm_pagemap.h
> > > > @@ -9,6 +9,7 @@
> > > >  #define NR_PAGES(order) (1U << (order))
> > > >  
> > > >  struct drm_pagemap;
> > > > +struct drm_pagemap_cache;
> > > >  struct drm_pagemap_dev_hold;
> > > >  struct drm_pagemap_zdd;
> > > >  struct device;
> > > > @@ -124,6 +125,25 @@ struct drm_pagemap_ops {
> > > >  			   unsigned long start, unsigned long
> > > > end,
> > > >  			   struct mm_struct *mm,
> > > >  			   unsigned long timeslice_ms);
> > > > +	/**
> > > > +	 * @destroy: Destroy the drm_pagemap and associated
> > > > resources.
> > > > +	 * @dpagemap: The drm_pagemap to destroy.
> > > > +	 * @is_atomic_or_reclaim: The function may be called
> > > > from
> > > > +	 * atomic- or reclaim context.
> > > > +	 *
> > > > +	 * The implementation should take care not to attempt to
> > > > +	 * destroy resources that may already have been
> > > > destroyed
> > > > +	 * using devm_ callbacks, since this function may be
> > > > called
> > > > +	 * after the underlying struct device has been unbound.
> > > > +	 * If the implementation defers the execution to a work
> > > > item
> > > > +	 * to avoid locking issues, then it must make sure the
> > > > work
> > > > +	 * items are flushed before module exit. If the destroy
> > > > call
> > > > +	 * happens after the provider's pci_remove() callback
> > > > has
> > > > +	 * been executed, a module reference and drm device
> > > > reference is
> > > > +	 * held across the destroy callback.
> > > > +	 */
> > > > +	void (*destroy)(struct drm_pagemap *dpagemap,
> > > > +			bool is_atomic_or_reclaim);
> > > >  };
> > > >  
> > > >  /**
> > > > @@ -135,6 +155,10 @@ struct drm_pagemap_ops {
> > > >   * @pagemap: Pointer to the underlying dev_pagemap.
> > > >   * @dev_hold: Pointer to a struct drm_pagemap_dev_hold for
> > > >   * device referencing.
> > > > + * @cache: Back-pointer to the &struct drm_pagemap_cache used
> > > > for
> > > > this
> > > > + * &struct drm_pagemap. May be NULL if no cache is used.
> > > > + * @shrink_link: Link into the shrinker's list of drm_pagemaps.
> > > > Only
> > > > + * used if also using a pagemap cache.
> > > >   */
> > > >  struct drm_pagemap {
> > > >  	const struct drm_pagemap_ops *ops;
> > > > @@ -142,6 +166,8 @@ struct drm_pagemap {
> > > >  	struct drm_device *drm;
> > > >  	struct dev_pagemap *pagemap;
> > > >  	struct drm_pagemap_dev_hold *dev_hold;
> > > > +	struct drm_pagemap_cache *cache;
> > > > +	struct list_head shrink_link;
> > > >  };
> > > >  
> > > >  struct drm_pagemap_devmem;
> > > > @@ -210,6 +236,11 @@ struct drm_pagemap_devmem_ops {
> > > >  			   unsigned long npages);
> > > >  };
> > > >  
> > > > +int drm_pagemap_init(struct drm_pagemap *dpagemap,
> > > > +		     struct dev_pagemap *pagemap,
> > > > +		     struct drm_device *drm,
> > > > +		     const struct drm_pagemap_ops *ops);
> > > > +
> > > >  struct drm_pagemap *drm_pagemap_create(struct drm_device *drm,
> > > >  				       struct dev_pagemap
> > > > *pagemap,
> > > >  				       const struct
> > > > drm_pagemap_ops *ops);
> > > > @@ -228,9 +259,9 @@ static inline void drm_pagemap_put(struct
> > > > drm_pagemap *dpagemap)
> > > >  
> > > >  /**
> > > >   * drm_pagemap_get() - Obtain a reference on a struct
> > > > drm_pagemap
> > > > - * @dpagemap: Pointer to the struct drm_pagemap.
> > > > + * @dpagemap: Pointer to the struct drm_pagemap, or NULL.
> > > >   *
> > > > - * Return: Pointer to the struct drm_pagemap.
> > > > + * Return: Pointer to the struct drm_pagemap, or NULL.
> > > >   */
> > > >  static inline struct drm_pagemap *
> > > >  drm_pagemap_get(struct drm_pagemap *dpagemap)
> > > > @@ -241,6 +272,20 @@ drm_pagemap_get(struct drm_pagemap
> > > > *dpagemap)
> > > >  	return dpagemap;
> > > >  }
> > > >  
> > > > +/**
> > > > + * drm_pagemap_get_unless_zero() - Obtain a reference on a
> > > > struct
> > > > drm_pagemap
> > > > + * unless the current reference count is zero.
> > > > + * @dpagemap: Pointer to the drm_pagemap or NULL.
> > > > + *
> > > > + * Return: A pointer to @dpagemap if the reference count was
> > > > successfully
> > > > + * incremented. NULL if @dpagemap was NULL, or its refcount was
> > > > 0.
> > > > + */
> > > > +static inline struct drm_pagemap * __must_check
> > > > +drm_pagemap_get_unless_zero(struct drm_pagemap *dpagemap)
> > > > +{
> > > > +	return (dpagemap && kref_get_unless_zero(&dpagemap-
> > > > >ref))
> > > > ? dpagemap : NULL;
> > > > +}
> > > > +
> > > >  /**
> > > >   * struct drm_pagemap_devmem - Structure representing a GPU SVM
> > > > device memory allocation
> > > >   *
> > > > @@ -284,5 +329,7 @@ int drm_pagemap_populate_mm(struct
> > > > drm_pagemap
> > > > *dpagemap,
> > > >  			    struct mm_struct *mm,
> > > >  			    unsigned long timeslice_ms);
> > > >  
> > > > -#endif
> > > > +void drm_pagemap_destroy(struct drm_pagemap *dpagemap, bool
> > > > is_atomic_or_reclaim);
> > > >  
> > > > +int drm_pagemap_reinit(struct drm_pagemap *dpagemap);
> > > > +#endif
> > > > diff --git a/include/drm/drm_pagemap_util.h
> > > > b/include/drm/drm_pagemap_util.h
> > > > new file mode 100644
> > > > index 000000000000..292244d429ee
> > > > --- /dev/null
> > > > +++ b/include/drm/drm_pagemap_util.h
> > > > @@ -0,0 +1,25 @@
> > > > +/* SPDX-License-Identifier: MIT */
> > > > +#ifndef _DRM_PAGEMAP_UTIL_H_
> > > > +#define _DRM_PAGEMAP_UTIL_H_
> > > > +
> > > > +struct drm_device;
> > > > +struct drm_pagemap;
> > > > +struct drm_pagemap_cache;
> > > > +struct drm_pagemap_shrinker;
> > > > +
> > > > +void drm_pagemap_shrinker_add(struct drm_pagemap *dpagemap);
> > > > +
> > > > +int drm_pagemap_cache_lock_lookup(struct drm_pagemap_cache
> > > > *cache);
> > > > +
> > > > +void drm_pagemap_cache_unlock_lookup(struct drm_pagemap_cache
> > > > *cache);
> > > > +
> > > > +struct drm_pagemap_shrinker
> > > > *drm_pagemap_shrinker_create_devm(struct drm_device *drm);
> > > > +
> > > > +struct drm_pagemap_cache *drm_pagemap_cache_create_devm(struct
> > > > drm_pagemap_shrinker *shrinker);
> > > > +
> > > > +struct drm_pagemap *drm_pagemap_get_from_cache(struct
> > > > drm_pagemap_cache *cache);
> > > > +
> > > > +void drm_pagemap_cache_set_pagemap(struct drm_pagemap_cache
> > > > *cache, struct drm_pagemap *dpagemap);
> > > > +
> > > > +struct drm_pagemap *drm_pagemap_get_from_cache_if_active(struct
> > > > drm_pagemap_cache *cache);
> > > > +#endif
> > > > -- 
> > > > 2.51.0
> > > > 
> > 
> 
