Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FECA2C1A0
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 12:36:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFD4A10EAD7;
	Fri,  7 Feb 2025 11:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GUeDlafI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A471310EAD7;
 Fri,  7 Feb 2025 11:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738928169; x=1770464169;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mg7iBmnTlvLbsccB9079bwyyaU0xXdK1mLkdFw/Z2fk=;
 b=GUeDlafIT9X44nMc/DiAz/RxPbWt26L1HiNhB05ltzuoW30zXWfBbnTX
 KLsBBXTFTO9NFF1mcJuWkZYpt11bC40vUFVAn9v5x3AiTp3KzxS4EljQ1
 gwU/XVUNfGlb4y5I7Q1sPtDYhlGXK8NBIe3qFuKrq04wjjdklRyU7EXsX
 zrnmUs1iyATopqjz34G2jFW46TBmUk6cSbTjXzkSSbokg3nhuVfYnK3dM
 L6fOPr0EKHhMLFbZLXKK9Z2HfK/1D8GgLJqCyTp1iJCLdGQJ2t5gGoAo6
 6ilMNaxFqnsPoatz6g2RVPo7+1cSguRZyDQIeh61e2klD0Se/Ae3b6ftx w==;
X-CSE-ConnectionGUID: GWKNwDUOSym0ET0v0er0FA==
X-CSE-MsgGUID: lyQDaArCSLqAuN4ypVw+Xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="57102750"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="57102750"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 03:36:08 -0800
X-CSE-ConnectionGUID: gelntI+0Qt2HAF9KL0a41A==
X-CSE-MsgGUID: aowWcKYLTnmI7pqXnboRvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116700107"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2025 03:36:08 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 7 Feb 2025 03:36:07 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 7 Feb 2025 03:36:07 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Feb 2025 03:36:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yP+ZnMKg7CoLA4Q6eUh38pFDQEYpzgMcyFarzkIXeeAjcBzxTCz17TCes+z0BZOENnak6t2UJq1QLQnN80lMec9/3rxJkEnshudfAPCg4lNt8RxFKyOakQvylSYFzNppIQ9NTJOYPglzuNQwPdaiz+jqfWtDgc/6MKcFhjy9ra+iVdxmaNqPnAv2fqE3t5SrRa8YprLq7ontaTP5Mc1A+Mh1uJkNqKyTSyQN18ndwTKRpGHTdKa6sSNdnIP1YuFWe70E0QYrLPsLwFc8PIpHVPowoxjPEE+QPBZbPQGwkYhWHGQ6v9Q8dVBdhFO/KyFrTVdrFMOyGKnPDv4JkRhA4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5UyDeciyo1CbUbVX4F0hUoRnJgfQmp+FhKWH7VM/JOk=;
 b=LOATxi17S/ic43zebqHaJ+LA/557Tgmdfta9WTW4Bsln5BheSgpyMiEkV3hqYbZyvpZ8iGxlWZSip6nysZHuF8/hzakuvNT1fmGcjdLiZlZPR3sy/GSPM8U4pHV3mEIxDsW8B+zL9KiOZDmXtX3eq/lzOa8uxZBpA6ocjZR3Er9TuAnxvVgG62DNKYyyyTQXGMwXYFmb5CHdhRvUCDfZIsqC5K/aAQ/5JSEcR/Jf6DjHXi4MR3l/1wwNKH1JiQbqe5dTJt7QfrVZ+OKIFGWiL9zHWKheFNanAW2JmiholAFgtXoR9LL2tDaMD4iYyRx8drgz/IhkHhs8MfqyMD5tKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SA0PR11MB4637.namprd11.prod.outlook.com (2603:10b6:806:97::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.14; Fri, 7 Feb
 2025 11:35:35 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8422.011; Fri, 7 Feb 2025
 11:35:35 +0000
Message-ID: <ed21c301-6a17-4e1f-90fe-97c5721854e4@intel.com>
Date: Fri, 7 Feb 2025 17:05:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 19/33] drm/xe/uapi: Add
 DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: <apopple@nvidia.com>, <airlied@gmail.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-20-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250129195212.745731-20-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0074.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::7) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SA0PR11MB4637:EE_
X-MS-Office365-Filtering-Correlation-Id: f93e9041-9ed6-4bf2-e06b-08dd476b89b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?djAzTFgzZlBXSFFZWERFQitpZ09xM0RXSGxLNEdsVXo4QXFpZEF2cHRZbE5H?=
 =?utf-8?B?NDhobnR5bElIU2x2cTRZdWplUUlYb1NLT2lxMGhWVGQxNzhtbml3QWFPL093?=
 =?utf-8?B?T2ZnTzk4OGw5NkJ6RVd0TW96Sm1BTDJ0OEJ5ZGdnNUpUaStyRFpXNkNYSjUx?=
 =?utf-8?B?cE8wakFQRnZKZlFORTZmK2drWWZSd2QvOUJnRlJDVkRTcWIxdERYNVZUKy9Z?=
 =?utf-8?B?U2dnemFpMFpwUkNWZXRKRlUyQ2lleGFxM1RVT1VUWEw1TzhwYUxaNlRCVnp1?=
 =?utf-8?B?L1BOenVCck9wQjBWMDBGZDFhRm4yeWQ3T25aUzJweitlUDdFd1NIMVlBUmE5?=
 =?utf-8?B?QXN3YW5QQTFDbzBuWUNYS0kzb09yTWFVR1FyR2hUc3NMYlptbDhaZm1XYk9U?=
 =?utf-8?B?d3B4YlNPU0J5T29mQ2ptOTVySmFrWjV0UnFzdThuTWwwdW5DVjN2Y1VJWkY1?=
 =?utf-8?B?UUxuYkE2S0UxSHZHaE1ZckxJK1lyWWVMU2pxZHFIbzFnaWMzM05DankvVmcy?=
 =?utf-8?B?QVRQQmhIMUc1aHg5cGhPaWlJLzJ2Y0c2Wkw1R3NsdjdZbFF4NHR4UmRRTGNh?=
 =?utf-8?B?LzV0cVlmSVRMQXl6L2xmSzJ5UjBGSmpFUkpEcWdGY1Z5SkxxUWlZT1h2Zm5Z?=
 =?utf-8?B?ang2N1pBb1ZuTFQvNnJ5T2xnTEEyN2hwenJOUHlhMWhqdmU3RFZ1aFJwSTM5?=
 =?utf-8?B?aVdRS0t6SEczM1hpMStVajlDcXRJVENqaFBjQWlFckJrM3gwY2piRTNxNXc0?=
 =?utf-8?B?aDhrcCthNlBUaGxIMUI4SWVtbUhGTW45dnJlbTJUbSsxVHZ3QUI4THE2V0dt?=
 =?utf-8?B?NlVSaXJNZFA0em4zZUpqSzQweHpCWlNBcDZ6bnFNNFBaQUhZR0FxNHZPd3d5?=
 =?utf-8?B?NHJJSFNLR09rMW1DN291SzdwaVlNVjd5SlZwK1phYTBtb09BdllNTFpBSVBF?=
 =?utf-8?B?cUZYeW12TXpMUTg5SnYrNDkwWndrdFBPdUFINWw1V1ZJVy9IbzFDVkVNUGhW?=
 =?utf-8?B?a1NOSUIyYXpGbTRlZC9iOE1xNXZ3UXZNSnYwaXp0SHlLeGJ1bVZ2SldqMWM5?=
 =?utf-8?B?amFBQlViV2FOSU1xZy92MHJmOCs1TDk5akNWd1JhL1dCaktsRng5Y3lNZFds?=
 =?utf-8?B?S09ubUE2ME1BSmhReERQeFNjQXQvWVYyNTRmWXp5MTFkNnlwbXJCd0I5UFRD?=
 =?utf-8?B?Sno3UXhvYUxYQTRuNWthL0diUlYycmtESjZhTFhMOUR0NTdXYmxNRjlFdFFh?=
 =?utf-8?B?MkZTRHg2T2FVdDhEL2JGVGtjSDlhNStPVk5iQzV3SXpNa2NLTjlCaVdEeE9F?=
 =?utf-8?B?emJyd29vdVhGb0RsRnQ4WUdLZDBPQVdsaW1id1haRFFqbVIrTU8wSE9vSzY2?=
 =?utf-8?B?bi9jU2tFd3l1NXoxUjRUckU0OUpkK1VqeDBuVHlIOHE2V1ZUV2V5bW5Pc0kr?=
 =?utf-8?B?OFE5UEg4UmpwUWt1WXlFRmZ0aUYyVm5vZWM4eWJqTGo4eGM2QU5nV3ZmZDNE?=
 =?utf-8?B?R05lR0lZVDVaZmtwNHBRaHc2Sms1bVZBSmlSei82anFYVUtmb3ROemMwRWhz?=
 =?utf-8?B?Z0NMSUV1QjZSNi9DU1Y3bFhwRWdRcGk3MEROdk8vdVp5amNsNU9LVHA1c0Uy?=
 =?utf-8?B?bjllSUhOSkhWb2pRZ2VDbE92UVRESzVEdFFydTBuaFNMVVQxdE1BUncyUndG?=
 =?utf-8?B?SDhNdjEwNjAzT3ZudDJCZUtBVTVKSFhUU1NmOEFlS2h0Y2RNcVRxd1U2U1NU?=
 =?utf-8?B?eG9TR1VhYXQ0aWVkMUE1b2hOanc3QWtMUEYvU0h0OUlORWNUWlV0NnhSYUdu?=
 =?utf-8?B?NzNibjZuY204VnlOWFFiRGdydkVpZU1RaTJxQUExS2tZaTRJQ1ZDUWh6d3Bw?=
 =?utf-8?Q?LsRQV3Da8L+/m?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXEvWVU1U1QzZDh2dE92NFB4cVJhVlVuc2h2eHdXeFd0eTlvOWtCT1NlaXk3?=
 =?utf-8?B?NDNmbjBBOGdubVk2NGRlTGZpbmJYTkQrNEcvTFlacTVGV3YvOHpnT2FMdlFq?=
 =?utf-8?B?Z3BOWFNJVGpieW92dThJWUdmbVM5d3FYOEJzVklIdXNmU0wxV2VRd0YzSVpH?=
 =?utf-8?B?UWN3VWg1cGRiK3lWQ0VDQ0xMdGxoT0NCY0xRRHVTejh3S1JBb005ai84c3p5?=
 =?utf-8?B?ZHZBQ1dXTE44blZ3QmEwRzZiamJNWVJaN1VqdWZrbWVaUENneEhuLzdScFpE?=
 =?utf-8?B?SkJKUDZvdXBmSEM0aDU5OU4xOWx0QTRMdGtmODFLbjhtVDdJejRRVzRoQXJi?=
 =?utf-8?B?YW80UGVNUHZCOG14d2lBamlWRXFyQUJCcTFXcUkrSk5ScTZlUUFLaitRZlZB?=
 =?utf-8?B?MWR0c1lScCtsUldiR3NxbU1LV1lQVW53N0xxR0RDcWNsN0pnbzYwU0ExdzZ3?=
 =?utf-8?B?ZjJxbTZJT08zbGxSRVIrMkVDRGpKS2habHlaa2Nvcnd6VzhzYjE1K01kSmhS?=
 =?utf-8?B?dmkxVWNWUVFZYlA4NEhTc1J0ckF5MU5NSklJeFJKblpNWEFGMnBQaGpUOE0z?=
 =?utf-8?B?VFhwTG54MW55c1FMektsNVpqVStLbW5RRDlHT1VscnBoN3NuVzVtMCtTTEVK?=
 =?utf-8?B?cEsrTHdZUjh5T2Z1RnRObk9RZHNCYUg3cW0zMUkwNUxNN2dUZ0t6bXhkVDBp?=
 =?utf-8?B?S2E2L3BKQ3FGSm5PcS9OTHAwZmk1K0ZVZFlkRnRPZ1p4Q1JGc2pBVDlCOWZS?=
 =?utf-8?B?bDJRT0d2MTFsVkd0OCtqTjR5cWUyRmpzcUNLbTVUSjhUQVZxcXkwZ0dtRS8v?=
 =?utf-8?B?VmlNWDNDVHVMWjhkZ2c1YzBlYThMTExNY0JFT1MwdGlnYzRkMnhKWExwTkpP?=
 =?utf-8?B?eGJQWnVHYU8rREpZN25GZXRaQVlzSFllVmk5aEFBZ2drdk1nbWpmbUZSWTBV?=
 =?utf-8?B?N09jUGZrbjU0MDRseHlRanU3Ky9CZjdGakd2VXMrOVlPYkd1UnZkRTNWVEhz?=
 =?utf-8?B?VUx0bWFEUU9nZmU2alNuQVFCK0U5dDFDQnN2alhMaVZXdldSUTB0aEtMdmI3?=
 =?utf-8?B?L0lVbTlTNEFkVFM3MU9HZlZ5aDJaemdQcTZKQ2ttaGZYNXNXRmNOenY0dmpG?=
 =?utf-8?B?aXEzUlhpaUllK0MrcVZpUE1mbURrMWlxZ2RXVDMySGdkbGtjbFRqdGowdHdv?=
 =?utf-8?B?ZVAvdEhmZ3dQaE1ZVkpLWUo0dmp1aW9MZjFUc1gyU2Z5TndrWnpSRnFyTHpi?=
 =?utf-8?B?VjN1QXNncDAyazRqN3lMQWZsRGVLaXczbEFnaTREKy81TEEwODAySUF6WCtn?=
 =?utf-8?B?RERXZlFpcWpNUEIrVFl2OHI1VWtlSURrUjNxMk5NK01rN3c4SWdiM1ZCK1Rq?=
 =?utf-8?B?OW9LZmVKQ24rU05RMFNaVzBTd2s5SjBZR3Q3M3czRlRQOTFNV3RvUkZmaDJz?=
 =?utf-8?B?WFdHYWFTTmVlZmZxcWh5aWNQS2w0aUV0NVg4andBWEtKS1NDeFZqSmZtdXI4?=
 =?utf-8?B?MzMwK0M2SGFQd2U0OHdUbVdvZWdTMkdXV0IzSytMeWdTZE1iUjBmUCt2N01w?=
 =?utf-8?B?d1dDRzNkWmhsVzd6MnFFekZ4VFZSejIvUFZ3N2dGS2hVUDhMSlBFL0h0c3Nw?=
 =?utf-8?B?amxPZjlCRWpEM2pmQmM3OElzU2pSb0daOGVuSkhMeTdWZGh4VkUyMEpIRDB2?=
 =?utf-8?B?UVRHcGwwSHJjVW9JazFacWlacUFmYUVWd3RBaE9TQjBzdUtqUVV5VlN3dkVk?=
 =?utf-8?B?N3lRQ0ZTSXl2N2xRc2c4eE1IRmhhdHdqRFpnL3Q3T1dyUFkyRTNqUndHdTZ2?=
 =?utf-8?B?dTNrenp3YmY5bWhGV0g5b2V3bW4xUitKcVVTTFdveVEvZzdGQmRtdzh2RHhX?=
 =?utf-8?B?NkZNVURtNE91M3o2ZEgwQmVtM0kyOWplU0c4RCtJdnAxSkkySEE0SjV5cWdV?=
 =?utf-8?B?c0dlNHRsanhjR3ptd0s1bVRSdmtZQ3k2dHNwRmJocUNYOXJRT1VwT2JSK1Bm?=
 =?utf-8?B?NGF0YWl2NVRFNmt4ajI4akt5YnI3MzV3YnZxL3Y3K0pWTm5tYWRMcURQU2k4?=
 =?utf-8?B?Uk8yZGMyWjFiaWtFdDJJUFlxMk8rbG5ZZE5UNXRKSXg3RUNPTXpzeXhsWU5V?=
 =?utf-8?B?Z0R0OVBpS0t4M3FIb3g3UlRPOHJTK0lGTVpKYmhtclVCa1c2VjM2eCtHWEp4?=
 =?utf-8?Q?yu5LsGQiLoZmccpqquwIzXs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f93e9041-9ed6-4bf2-e06b-08dd476b89b4
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 11:35:35.6598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qfzHbBJ5g9hZHwL/uv7BVoBBwB73ZfivuhSCbKY/LN9z5abBm+JLqLkrghXEatHGrS6CJWUSrnywV8RnnoHu0Cmj3sdAwWmOAiOs1JYLEy8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4637
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



On 30-01-2025 01:21, Matthew Brost wrote:
> Add the DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR device query flag,
> which indicates whether the device supports CPU address mirroring. The
> intent is for UMDs to use this query to determine if a VM can be set up
> with CPU address mirroring. This flag is implemented by checking if the
> device supports GPU faults.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_query.c | 5 ++++-
>   include/uapi/drm/xe_drm.h     | 3 +++
>   2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index c059639613f7..40f56eaf98fa 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -333,8 +333,11 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>   	config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] =
>   		xe->info.devid | (xe->info.revid << 16);
>   	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
> -		config->info[DRM_XE_QUERY_CONFIG_FLAGS] =
> +		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
>   			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
> +	if (xe->info.has_usm)
> +		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
> +			DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR;
>   	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
>   		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
>   	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index b86dc1b4c2fe..37e54ca6ffe9 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -393,6 +393,8 @@ struct drm_xe_query_mem_regions {
>    *
>    *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the device
>    *      has usable VRAM
> + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR - Flag is set if the
> + *      device has CPU address mirroring support
>    *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
>    *    required by this device, typically SZ_4K or SZ_64K
>    *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
> @@ -409,6 +411,7 @@ struct drm_xe_query_config {
>   #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
>   #define DRM_XE_QUERY_CONFIG_FLAGS			1
>   	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
> +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR	(1 << 1)

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
>   #define DRM_XE_QUERY_CONFIG_VA_BITS			3
>   #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4

