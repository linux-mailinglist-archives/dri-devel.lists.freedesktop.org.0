Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC047A33C14
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 11:08:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED76210E09B;
	Thu, 13 Feb 2025 10:08:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AIX5jGF8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D4D10E09B;
 Thu, 13 Feb 2025 10:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739441290; x=1770977290;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=egkaBWpcnmrQyDvIzAeLyFkAFUKn1o3SUq1iFYV2SoU=;
 b=AIX5jGF8QB/PaIHFsiJhYlJL+nqa8nrZUZE+qQR/kQRYcg8f/iA8jcGN
 XeFPwc6LWe8EcJN6IuhD9Y6FhReyYypVDLhkSKC6obmXjyjjV0hD2MRXh
 d7lKMSUomDPM9SSJ4Ku73OxHr2OzfQRS6Ac2yNtlUqC84mTVZiqDDMYb6
 Pd+QYzHgYOxqNunPaiOGNmh0OjXIW7oPZSPUYU6dP4Y/7vcAtRxd4bf4i
 RzNi50vnRG+WOzPjxQnE6OySZF6qiy0F84HDGVH9MkL/ClSMrSRywMDyf
 A6nP/9FFP1RaAlY7CtZHysZnuffLO6nYRn7TA8rGlh8WrUu978U47MyDY w==;
X-CSE-ConnectionGUID: yUbiwr+EREGIhTjUJ9npnA==
X-CSE-MsgGUID: fie+gzlnSWKjnYepHW+H6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="39999928"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="39999928"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 02:08:09 -0800
X-CSE-ConnectionGUID: I/PZ+q/AS6K7s+mP0BDK9Q==
X-CSE-MsgGUID: aW7v9CF3RbCAiOHQuONEtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="143937330"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2025 02:08:09 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 13 Feb 2025 02:08:08 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Feb 2025 02:08:08 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Feb 2025 02:08:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QKmHdnaK7OQI5we/GkuShzpLTTGF1RtB/gLRLSTxyZwRx+9UsBMRh9ifRVYHTCGlE8BztFaRJdRcmPHtLb+HImaVC8qbiOsGr+/S0jiUkmLPl7bFEZrdd8WBbKl9jPXdA1n7fYiBjodV8rAT+UUBv2RotGhSy+YOkB7VHVzqNuTqpg7sb3T5+WUEF1MUfG9iEDYsSNb0B6fBAZdM7jf5Z1PdQg70eRHeHAkr0qIHwkvAzEoDnyNx5MHWzdRXIRymj3oLrZMSmii3UCrYeBAU0bmTeetHxboOlyj1A21GIpXdEBQbTle7QyyJbXRvuhgcGId2o8mYeB1yr80orFLpDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=goV0we0J5VHVojlEUPQN5udl67OV6J1RlJX4XjSVbnQ=;
 b=DuSZqBNHtNHnujbXIaoZHWkpg/TCubZsJ8J506Is5mOrY5PRnXG5c7CWJMqBPTqLPGmIQMsKVtNumInA74TDH+Mw8T+72rX1E/4cshFXox5ge1j9rLE5Xp4ux58oXkKk6KgJaC5ZjN76A4qJ6Xn4cd82mZP/oqIKw12fSDJqVwI7GuhoR48rYmC5zgsUpz+QOUp5ftkqhI+Nd3UA0KptwQoJKB3G9puFDKJCG0uk50XMAMbV+Adr2W3fCC4qpk1+YoswxDrPM3TgmGixoFG4Q69kZE7rI2IQscYkj4vJJeX5me8QW3MXznhhWIAO91gkINj4JiS+H/Uo08XuxAxuFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by MN2PR11MB4741.namprd11.prod.outlook.com (2603:10b6:208:26a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Thu, 13 Feb
 2025 10:08:05 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8445.013; Thu, 13 Feb 2025
 10:08:05 +0000
Message-ID: <be7e2ee2-8d88-4ff0-95cc-eab4590ca198@intel.com>
Date: Thu, 13 Feb 2025 15:37:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/32] drm/xe: Add SVM garbage collector
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: <apopple@nvidia.com>, <airlied@gmail.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
 <20250213021112.1228481-16-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250213021112.1228481-16-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::17) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|MN2PR11MB4741:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d0b99a1-a397-47ac-c856-08dd4c164e87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MXdwYnB1K0s4QUpXRkFtVWpyeXYzWlBqQWZNL3dIeHM4TnNTU3NHTjNjcGRC?=
 =?utf-8?B?cFpFQzVkaEJTNjRGMGZWYk1rNzBIQTdCK2N1WEd5Wi8yZ2p5bHR6RFhhNkxJ?=
 =?utf-8?B?UXY0aGRUbFZoM0J2NjVSOEhVZWdZZjVXOVhSMXBoZEFGbllKcDk2NFBqN1Jt?=
 =?utf-8?B?NHY5Y25ReUdpWmtXOTFtRWdmYUc0bVVtUUdCYnFUeGIwRzZyRDRMUEpIMzBU?=
 =?utf-8?B?bDBlUFVNZ1hnY2tSNzhmblFkcmVBRmVubGhFZkpOMVltTFBtSzJXZWpITHA1?=
 =?utf-8?B?VStzNE9XRlVabkZsSFlIRitlNmdxWEpSR2JJdnVBanFXZzI5djg0NnZoQlRt?=
 =?utf-8?B?S1pzdUpYNzA1enB2RjVXRDBXVHBBN09JVENJVXdtWWdseWNMcDVIYW01RVV2?=
 =?utf-8?B?bEE0THB3N3FlTDYyWjJucmgvQ0ZjNjAwclg1Y1l1eVJzb0x1UmRjdHpFZUs4?=
 =?utf-8?B?a1ZkUnlKS2Qwd0Z6NnE5cTlmejVJL1lHTzA4TmkyU244aE9lZ2pZTTVyblRw?=
 =?utf-8?B?cXY1VXVZRUhTNk5SSXJYVnA1VFhKN3hBNmhmclAwclorVGVWNVMxeml1YU9Y?=
 =?utf-8?B?SERJRXJVZnVTZmRGQ3h3c01UeWxtVS8xTlZ4TFBEdkNkTk1sU0RqbXhZLzN4?=
 =?utf-8?B?K0c4dE81eUNudzh2WldJYU45K1BlN0FOcVhia1FSRG1JRmYySXdiaVZnbzZh?=
 =?utf-8?B?b3hjd05uWnFhNUJhelRScWxXSE1rTmNPUTBvMVdoYVFjY3paQU5OWWhHcGpT?=
 =?utf-8?B?dkF4OFdHYkdHVUhMbmdlc01jUDF3cWRXVytQKzlJeGNVOGE1SjAweHFHTUJP?=
 =?utf-8?B?c3cvWTNFRzdZVmo0L1lhMXZSZ1pDb0g0eFlHMWlWUDkvYUNwWTdMNTh6d2x4?=
 =?utf-8?B?eW8yVFlWaEM4RjlZNFYwcWYrSW9wcmc5WGRLVUVDc2lvQlBSMG01UGM0TVpW?=
 =?utf-8?B?WXRXQ2J0dlN2WEdYY3A0anhxV1BWK3VZV0EvWCtzQXNGcjlKNjBwRVhVWi9l?=
 =?utf-8?B?T1FkUnk5Q2kzZitLSFQ1RFVHcU5UNUJsYy85OENNQWNNY0UwSTNVM1E0M0Vx?=
 =?utf-8?B?UXZHY3YyK2tHV1NzWCtRV2xkV3FkUm5QZUFKM2kwOHlScEJhSm5pR0JMZnUy?=
 =?utf-8?B?ZGw3THBGcjlncUhxRXpPYXdZQjZCRmwrOFlRUThncUtCcWNMRmdaZ0RPNUdH?=
 =?utf-8?B?Qk1henBOeUR3MmpIbE5SMThKT2ZXZHZPd2NDWm0xcG0xQWpIekg1NmlUUGsv?=
 =?utf-8?B?VEUwRDR1YTVOYlpTVGlrTnh2dUdEWUNrRjFQZlVKK1M1anNsSS9hOFhLbUxr?=
 =?utf-8?B?RS9NdCswTzNPakxidXJwaXZzblNPMFA0Y1BqTlI5d3NzWnFhLzUwTEc4TjhD?=
 =?utf-8?B?VVZDSmRuYWJwSjRjeGpobTdQZHRCTWh0U3ozRThyeURweTVBbzdFb0p6QWx4?=
 =?utf-8?B?YlVtakltbmNxVnIvcm1zTUc2YzV1RDUvbXdMelorL3UzalVCeEJ3aFRFeEFS?=
 =?utf-8?B?bWNXMTVuaFdTMnZxVnR0ZmxLNVduN0hJWXdFa2NoaXhqSjVjankvc1NnVmtR?=
 =?utf-8?B?OGpIV25Ja1FOemN5OUU0TGJxd3VyTERuUG5JTDl6TzRHRXJ0K2NMbGdsbVdZ?=
 =?utf-8?B?cGFsUEsxV1lTbXkxdHkrVXUrTUdTME1pUXBuZXF1K2V6TXFGMFF5aE9qR051?=
 =?utf-8?B?NVdNTXBkSmE3WDRzdTdMZVlFK3JHQVN2RkNFM1ZLdFJibmxJTGZEbjlXZmEw?=
 =?utf-8?B?dUpGMGlaT25IZ1I1RVhQV2NuSU5UMlBMaG1aUXRrYnFJaGtRWEZMQlZ6Q1NO?=
 =?utf-8?B?NGNEQlpObkE0MWVEeS9CZ05sMHoza3VZM2kxVjJKdW96cXJSYkQ2djNJZlZ0?=
 =?utf-8?Q?9SB+FrN9eK5me?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3NpNGZUcnF6RXBNRFl2NUZ3YU9hNXpuU3pHOGl1ZjFPc1ZEc1VpaFh2Yjhl?=
 =?utf-8?B?M3RFZE5hc2hRb0lnblhXVGRNWHEwaXpSbVdoY1RNU09TRyt0NnFkV3dHTXhW?=
 =?utf-8?B?Q09jQS9Cd0RKKzh0RFE2VDZvZnBPL01lcXF3VGlkckE0S2E0Y3p3bWVEU0Ur?=
 =?utf-8?B?Z1p0bFFmTW9EMk1MM0FzNnkrWkhxZWF1d0xyTGlqRVRFQlNNOGF0WC96ekhB?=
 =?utf-8?B?SXV1THN3QUFPRmFpaVN1Y1VzbVM2bnJNMDYwSWNiamtTeXcydFFJbnZiUG5K?=
 =?utf-8?B?MjltU0hMcWlER3Yxa2VFRm45ajJvSDhPRnl5aitZRmk2NWJCNXpVbG5Wdm5V?=
 =?utf-8?B?bm9HdEJHQnM3S2FwZGRodVA3NFhwd0QzUnBDNFJoYUFpVVZSL1F6SkdPMXJw?=
 =?utf-8?B?ejE3a3RRb3gzVGJPWmdxM2R6M2s2Sk5TWUJSN1d3bE40ODVhenVhQjVteWZO?=
 =?utf-8?B?NEZQbVVqb09LRC9LeUp1bG9wa05hWkxPbndKRERtTjZqOEdmRnBYcXV6R1dq?=
 =?utf-8?B?aG5KdkxyZ3dKZVNLUm5qWVlHRUFlWnBXMGxZMmpMTWREcTNWcXl4bUNnQWk5?=
 =?utf-8?B?RUlsR0NwYVdzVURaRmdKRVFkVC9EL1Fob2R2dEhBZUpGL3FKTFM1bERCUHZB?=
 =?utf-8?B?N3Y0OWorUnJhcEREaExISG1rZFUrTU5FR2dKaU9JcTIvYjdvU2M3bDd6c25p?=
 =?utf-8?B?MU55L0hxWlArWklNUTNxU1gvTU9id1pEU0xzYW5zYUxhOTRQNlBuMjg3bUxX?=
 =?utf-8?B?Q245Tk9RSTZhUG56UTV1VFJSUWtRMkpFck0yNitiVWthY3A1NXJ6dlpYUkZG?=
 =?utf-8?B?UmkwOVB0UUgxQWZCdzVFM0RteUF1OUpyT1ZJOUZJbGVmd2dCeUxzMjIvRndT?=
 =?utf-8?B?RHZ0OGViSjRQQU5keFBpQzg4aWV6QjRYa0wra3lIU0U3dkFGRzkxOEVXWGRD?=
 =?utf-8?B?VlBVUHZaMmhhZnJOT01ZM05RQWEyR3Bkcm5YRGpCbzFFejVmb3o1eTk1Y1pX?=
 =?utf-8?B?U0FUUDF1MmdiMC9JYW9hSEU4aTlrQ05UMmJLbzBkUEl4bHlRTVExZ1lOdXp5?=
 =?utf-8?B?b1lHaDlESk5FVExmSUtXcWQ4anhpSTcrQ05hSnBHcHMwK3Q3eXlWalhpWnlw?=
 =?utf-8?B?VEtCYURoT295M2YzbGcwV3dvVGpUQzdhbkNyU0VuL0tBaUFnWTN1NjdieWtE?=
 =?utf-8?B?cCs2Rld0WVBRekQzNDZtV3hzVTFpeFNXMi9YYysyTWFHdjkxekd0UnFyTFJP?=
 =?utf-8?B?LzBhMUFNSDhkTk4xVFltVm9YUGNuY24yRW9Eekw1elIwVlhVZGs5ekM0VTBk?=
 =?utf-8?B?VFFTWTlYUWhBeUhJTXBCRFVVcGE0MnljVjNYaDJ0YzgyZGlVckFMemhhcXJs?=
 =?utf-8?B?VlZQV2dPY29CNHdTOGI1Wm13MS9DaGtveHQxZXN0OTZaZVlXSnNMbVlxS21i?=
 =?utf-8?B?aUQ5QXQwcG9EUjBkOC8zQVlVbUhYY2QxRVJKUkpOUmQxdithV2EwMTd5d1Jt?=
 =?utf-8?B?TW5JRzI3U1N0MzZtK1JLQkFoaTZBeU55SFcxVnlZOXlOYnp2T1lYRHRxSHZk?=
 =?utf-8?B?dW1OMHhRUmp0SEZibWZmdXZDcC9OODdGYXRBZGdaaWY0eEN6QzgzNys1U1NZ?=
 =?utf-8?B?d3VMYmt1NnNYWGZqUGJHdmdTbmxRWTMxWTFuMDlTajVkSEI4eVhpUlVmZ0Nl?=
 =?utf-8?B?cDVGZHgrWHF5a2xqdU5DRTlnRE5zRlN3OVFtOUdNVWhsUnBwNnRKTVRoZkJk?=
 =?utf-8?B?MGE5K0FpQUJraEp4WENiYUlTRXZoeXp2R2tIcDVsTlc3ZGxOcUE3amI1SE4x?=
 =?utf-8?B?aUhOeERaWE5kcjJWSitNbXdDc0twZERxTWZVYzNSWXZRZEF1SkwwZWxHUm82?=
 =?utf-8?B?dCtFK0Z5bGpCQndXcGpjYVNvYkxZdmx5N1dnRkg3Tjg3R0l5Wk9DWnFQUU5X?=
 =?utf-8?B?Qms1dVJJb2hwSDRxdThMc29nLzNUQjE2NDBMY2YwQnFnYlN5SmpNQXNISVZh?=
 =?utf-8?B?ejY2L21UbHBhcENwSUFmbzJib1ZZWU5aNG83YU92SWliWGpxbUs1VTBNUkIv?=
 =?utf-8?B?dlBYTkVzMVlaSlNkT0hXZk9EUGg2SVdTd0xLMGRaZjhhb2l1enBKODlkL2du?=
 =?utf-8?B?elpjZDArZVRwQnJJZytUQVYrVXgzb0I4Z29OcFE1akM0SExLTHI0Yk4yTjJm?=
 =?utf-8?Q?Hvx7j49Tc7YTouDwi4PkbEU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d0b99a1-a397-47ac-c856-08dd4c164e87
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 10:08:04.9725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2iwPHU9Z0ELBExf/Qf8LgEq18ubbty27RCbHBOWUuXsiWaUqfkGclxotLaAUur9Tw4KeZptvHXxAwPM4zjalOaXfEuMyTFNZAEOzr1ubzSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4741
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



On 13-02-2025 07:40, Matthew Brost wrote:
> Add basic SVM garbage collector which destroy a SVM range upon a MMU
> UNMAP event. The garbage collector runs on worker or in GPU fault
> handler and is required as locks in the path of reclaim are required and
> cannot be taken the notifier.
> 
> v2:
>   - Flush garbage collector in xe_svm_close
> v3:
>   - Better commit message (Thomas)
>   - Kernel doc (Thomas)
>   - Use list_first_entry_or_null for garbage collector loop (Thomas)
>   - Don't add to garbage collector if VM is closed (Thomas)
> v4:
>   - Use %pe to print error (Thomas)
> v5:
>   - s/visable/visible (Thomas)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/xe_svm.c      | 91 +++++++++++++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_svm.h      |  5 ++
>   drivers/gpu/drm/xe/xe_vm.c       |  4 ++
>   drivers/gpu/drm/xe/xe_vm_types.h | 18 +++++++
>   4 files changed, 116 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index d9d93d12f595..ed91291a24db 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -38,6 +38,7 @@ xe_svm_range_alloc(struct drm_gpusvm *gpusvm)
>   	if (!range)
>   		return ERR_PTR(-ENOMEM);
>   
> +	INIT_LIST_HEAD(&range->garbage_collector_link);
>   	xe_vm_get(gpusvm_to_vm(gpusvm));
>   
>   	return &range->base;
> @@ -54,6 +55,24 @@ static struct xe_svm_range *to_xe_range(struct drm_gpusvm_range *r)
>   	return container_of(r, struct xe_svm_range, base);
>   }
>   
> +static void
> +xe_svm_garbage_collector_add_range(struct xe_vm *vm, struct xe_svm_range *range,
> +				   const struct mmu_notifier_range *mmu_range)
> +{
> +	struct xe_device *xe = vm->xe;
> +
> +	drm_gpusvm_range_set_unmapped(&range->base, mmu_range);
> +
> +	spin_lock(&vm->svm.garbage_collector.lock);
> +	if (list_empty(&range->garbage_collector_link))
> +		list_add_tail(&range->garbage_collector_link,
> +			      &vm->svm.garbage_collector.range_list);
> +	spin_unlock(&vm->svm.garbage_collector.lock);
> +
> +	queue_work(xe_device_get_root_tile(xe)->primary_gt->usm.pf_wq,
> +		   &vm->svm.garbage_collector.work);
> +}
> +
>   static u8
>   xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct drm_gpusvm_range *r,
>   				  const struct mmu_notifier_range *mmu_range,
> @@ -100,7 +119,9 @@ xe_svm_range_notifier_event_end(struct xe_vm *vm, struct drm_gpusvm_range *r,
>   	xe_svm_assert_in_notifier(vm);
>   
>   	drm_gpusvm_range_unmap_pages(&vm->svm.gpusvm, r, &ctx);
> -	/* TODO: Add range to garbage collector if VM is not closed */
> +	if (!xe_vm_is_closed(vm) && mmu_range->event == MMU_NOTIFY_UNMAP)
> +		xe_svm_garbage_collector_add_range(vm, to_xe_range(r),
> +						   mmu_range);
>   }
>   
>   static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
> @@ -202,6 +223,63 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
>   		xe_svm_range_notifier_event_end(vm, r, mmu_range);
>   }
>   
> +static int __xe_svm_garbage_collector(struct xe_vm *vm,
> +				      struct xe_svm_range *range)
> +{
> +	/* TODO: Do unbind */
> +
> +	drm_gpusvm_range_remove(&vm->svm.gpusvm, &range->base);
> +
> +	return 0;
> +}
> +
> +static int xe_svm_garbage_collector(struct xe_vm *vm)
> +{
> +	struct xe_svm_range *range;
> +	int err;
> +
> +	lockdep_assert_held_write(&vm->lock);
> +
> +	if (xe_vm_is_closed_or_banned(vm))
> +		return -ENOENT;
> +
> +	spin_lock(&vm->svm.garbage_collector.lock);
> +	for (;;) {
> +		range = list_first_entry_or_null(&vm->svm.garbage_collector.range_list,
> +						 typeof(*range),
> +						 garbage_collector_link);
> +		if (!range)
> +			break;
> +
> +		list_del(&range->garbage_collector_link);
> +		spin_unlock(&vm->svm.garbage_collector.lock);
> +
> +		err = __xe_svm_garbage_collector(vm, range);
> +		if (err) {
> +			drm_warn(&vm->xe->drm,
> +				 "Garbage collection failed: %pe\n",
> +				 ERR_PTR(err));
> +			xe_vm_kill(vm, true);
> +			return err;
> +		}
> +
> +		spin_lock(&vm->svm.garbage_collector.lock);
> +	}
> +	spin_unlock(&vm->svm.garbage_collector.lock);
> +
> +	return 0;
> +}
> +
> +static void xe_svm_garbage_collector_work_func(struct work_struct *w)
> +{
> +	struct xe_vm *vm = container_of(w, struct xe_vm,
> +					svm.garbage_collector.work);
> +
> +	down_write(&vm->lock);
> +	xe_svm_garbage_collector(vm);
> +	up_write(&vm->lock);
> +}
> +
>   static const struct drm_gpusvm_ops gpusvm_ops = {
>   	.range_alloc = xe_svm_range_alloc,
>   	.range_free = xe_svm_range_free,
> @@ -226,6 +304,11 @@ int xe_svm_init(struct xe_vm *vm)
>   {
>   	int err;
>   
> +	spin_lock_init(&vm->svm.garbage_collector.lock);
> +	INIT_LIST_HEAD(&vm->svm.garbage_collector.range_list);
> +	INIT_WORK(&vm->svm.garbage_collector.work,
> +		  xe_svm_garbage_collector_work_func);
> +
>   	err = drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM", &vm->xe->drm,
>   			      current->mm, NULL, 0, vm->size,
>   			      SZ_512M, &gpusvm_ops, fault_chunk_sizes,
> @@ -247,6 +330,7 @@ int xe_svm_init(struct xe_vm *vm)
>   void xe_svm_close(struct xe_vm *vm)
>   {
>   	xe_assert(vm->xe, xe_vm_is_closed(vm));
> +	flush_work(&vm->svm.garbage_collector.work);
>   }
>   
>   /**
> @@ -296,7 +380,10 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>   	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
>   
>   retry:
> -	/* TODO: Run garbage collector */
> +	/* Always process UNMAPs first so view SVM ranges is current */
> +	err = xe_svm_garbage_collector(vm);
> +	if (err)
> +		return err;
>   
>   	r = drm_gpusvm_range_find_or_insert(&vm->svm.gpusvm, fault_addr,
>   					    xe_vma_start(vma), xe_vma_end(vma),
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 03ae43d8b4ee..b3a4f2e82b50 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -19,6 +19,11 @@ struct xe_vma;
>   struct xe_svm_range {
>   	/** @base: base drm_gpusvm_range */
>   	struct drm_gpusvm_range base;
> +	/**
> +	 * @garbage_collector_link: Link into VM's garbage collect SVM range
> +	 * list. Protected by VM's garbage collect lock.
> +	 */
> +	struct list_head garbage_collector_link;
>   	/**
>   	 * @tile_present: Tile mask of binding is present for this range.
>   	 * Protected by GPU SVM notifier lock.
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 3565c2673b9f..f57fc30b969a 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3150,6 +3150,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   		}
>   	}
>   
> +	/* Ensure all UNMAPs visible */
> +	if (xe_vm_in_fault_mode(vm))
> +		flush_work(&vm->svm.garbage_collector.work);
> +
>   	err = down_write_killable(&vm->lock);
>   	if (err)
>   		goto put_exec_queue;
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 2d988a867e63..8aa77aaaae6b 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -146,6 +146,24 @@ struct xe_vm {
>   	struct {
>   		/** @svm.gpusvm: base GPUSVM used to track fault allocations */
>   		struct drm_gpusvm gpusvm;
> +		/**
> +		 * @svm.garbage_collector: Garbage collector which is used unmap
> +		 * SVM range's GPU bindings and destroy the ranges.
> +		 */
> +		struct {
> +			/** @svm.garbage_collector.lock: Protect's range list */
> +			spinlock_t lock;
> +			/**
> +			 * @svm.garbage_collector.range_list: List of SVM ranges
> +			 * in the garbage collector.
> +			 */
> +			struct list_head range_list;
> +			/**
> +			 * @svm.garbage_collector.work: Worker which the
> +			 * garbage collector runs on.
> +			 */
> +			struct work_struct work;
> +		} garbage_collector;

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   	} svm;
>   
>   	struct xe_device *xe;

