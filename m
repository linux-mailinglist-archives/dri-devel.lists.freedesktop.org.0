Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14420A3520E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 00:17:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D8AE10EBB2;
	Thu, 13 Feb 2025 23:17:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BiJyrX2j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9326B10E16F;
 Thu, 13 Feb 2025 23:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739488631; x=1771024631;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=phMdPaxbcpf+apGnEwTNSVpQL5Bi8inE8HDDw1TOYaU=;
 b=BiJyrX2jW2fbTTyEBgWG/uW8Hg2cxK1o5Qt56zBSkHbhropbsnPP6G2u
 QShMGhNRLBY8JvwNxjbhgoNf1Fb1jdP+i2CopS3X4to61gp9/6lQpaeV6
 PT4YjxcQ6G8rgJ2NyQGyKsgTMg6/pBASdr52aPqbYn9kv4I4D1zEpTHty
 SNj7X0fGE5icIf20mDqETJ2Pf3os78FZ8ditwS6HMr5KQBBJ5+EPgsZ30
 STYflnNSsShhTH01dz70lzA//6KNp55TsCnWXMjfU+abNzVfac0o9SZ91
 YMLcKL6EyClQ6v2ei8opwIkflhR1wGGYmfpzGoEvKaK5Zgyh/ciEqacs9 A==;
X-CSE-ConnectionGUID: McqKIGlyR2C8qazo/Dp1Fg==
X-CSE-MsgGUID: IJhVh0tMQ6qV+WI83dp2Hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51652337"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="51652337"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 15:17:11 -0800
X-CSE-ConnectionGUID: O2rIXMIsTsmlst7Ho2hzQg==
X-CSE-MsgGUID: rsX6dIGrRB2YLsYR692dOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118494690"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2025 15:17:11 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 13 Feb 2025 15:17:09 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 13 Feb 2025 15:17:09 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Feb 2025 15:17:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PYbiBKjdeNBqaxkKmLqNXtA9D+IbBxxzVcfjm5kFncIC+QbcQP46XSskqVRTiorpm3p5txFUO5Ae1tktf/qz8fogoJGNsH7Lk1lXxB5R0+Hdu6wvC1EgjgCGL2zHgD+OwrcAz2JTVqgxkpcbWjAmz4XobCaFJA9FVpbHiAGcjB/vmLy5q9Oqlc71FlyUyyYrNcYyLObBeigEWnocTC2kRk2jsGM+iXvH/+uAE1XNWoc6fYsjkpPug/5ptqVfly/oiYNcPYcK4YGdwXMlGBgue+e3E3KzH1XDbumWZzJIaxKh7PjebXfe+Dh8n6OaN7otLs8la7KYmEuWce6h46bo0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kwKXw1vuokxXU8xfmV2muCMoQEziQEjV4uKFGO2I8Z4=;
 b=Q9BNGO5wkKoj4/OFRTnNYXOA69VD/LuDo57gyZFW9SiLOf6thro/Xc06P60UaMtAXKCnSKcIcWPVY2UQ8JgVNlCDCxdwqkXmhgo2SUsOrDT6p2aeMzrzRYclG8TKTidJj+5wLzN2TGAseBQrvGBg3NIiVbQzXRL9mcektoCkupuJqhC7p6L+zumIxezA5u57iKratBHDIT1oG8v7Ct5X1716rZqHR9ZPCqQkpd/0oExRT+Jo+VI2qtbo/BvjbUcu/2htSHic4U2dnX/n5Io6B4NcVUMlp1tdjqzN0HU9B6kOxojwijBdvDTTQfzATfC6eMrYqgFkQgBJuVlpsz8vQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SA0PR11MB4767.namprd11.prod.outlook.com (2603:10b6:806:97::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Thu, 13 Feb
 2025 23:16:23 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.8445.013; Thu, 13 Feb 2025
 23:16:23 +0000
Message-ID: <7021d441-6c3d-463c-a944-0129423171ac@intel.com>
Date: Thu, 13 Feb 2025 18:16:19 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/6] drm/xe/guc: Don't store capture nodes in
 xe_devcoredump_snapshot
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, John Harrison <john.c.harrison@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
References: <20250213195139.3396082-1-alan.previn.teres.alexis@intel.com>
 <20250213195139.3396082-3-alan.previn.teres.alexis@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <20250213195139.3396082-3-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0035.namprd03.prod.outlook.com
 (2603:10b6:303:8e::10) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SA0PR11MB4767:EE_
X-MS-Office365-Filtering-Correlation-Id: 34af8ba0-6459-4309-d150-08dd4c846e72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZFZHWXNyZGxjemRobEcxTWNTYzluSktkUUxCazJEUEw4UXg0RGVobFJSem16?=
 =?utf-8?B?eUcxSW5PUk4zMDRjSjQ0dE5QanIySmhuYU1uYjFCdnlURkVQWTBqbnhuQnBQ?=
 =?utf-8?B?bWlKSlhmZkVycTc4bENrZklVeVBMZm1LZUV2Rk5ISm43MjNVZ1RVcFhpWjNq?=
 =?utf-8?B?ZU80YmNXUXRRRi9Sb3lLN3hFM1dINEV5VmhlWm10NUx1REdJbURwaFE3WElv?=
 =?utf-8?B?RG91eFVseWFKSWI3UVRZRm9MN2Fyd09QT2JORjdZRjcyMXlwTm9CYkUwUTM2?=
 =?utf-8?B?My8ydkVWNGtXUzFPMFkvZkh4S1J6RkxxWlp4RXROT01KdHNsTUttenFkZlJx?=
 =?utf-8?B?MldaQXVwUjd6NThoQzdJZWF6N0VuUjZLMVJwOTUrT0VhaVRhVFFGWkpvYklZ?=
 =?utf-8?B?cHN5di83UWJ4YVltNStkWlFWaWJ4M2lwL0V5SGROdjk0TktaK1hIZGdma0pr?=
 =?utf-8?B?UEZmdkFPa1JZTnY2blhtM3RyVTdYNFdaZWt1c3dMa3lxd1FrM2hBaGdFNjhC?=
 =?utf-8?B?OWlidkxQQzcycng4UXdmMVFLSFpOL3ROZnh6SVV1RFFqSnJVK2Y0RG9FY3pR?=
 =?utf-8?B?aWd5SXJjaWM0YWx3SWg0VTQ3MGxmVFgxcC9DeU5DMUpPUllOOTBVY2h2eHR1?=
 =?utf-8?B?b1BSM0NzKzUvV0JTa1BLSm5YSGcwaEtaR1RWLytRMTJOTXloY1MrTjhxdDNF?=
 =?utf-8?B?RWVBR2xZeU53cjEwQ0ViVmRrNkxRb2lCOHJQS1UwZDZaUWhaZ3NPejlJVlJL?=
 =?utf-8?B?cVJtUWszNG1FZnc0Y05pR0RmOVVnSHdYRVpMckN0OWdDT2pDZEs0K3BOYkZP?=
 =?utf-8?B?eHJ0N1hKSmZJNERNS0RGNzl3SkFFQWszSVlneW5YRm5HZ1V5SmNUNy92RTQ1?=
 =?utf-8?B?cXpydVVEVExjSm5HWTkyc0dFU25lZ1lJWDN4WStublBIWnBEQzRXVkYxQ1dI?=
 =?utf-8?B?aWo1WUJvazhkbFREVnlSemdXSjhhaittYmFldmtxQ2piaENkREF0MVc0RDQz?=
 =?utf-8?B?U3BESTBEdW1jVUNHQ0RCN05hQXljemFNNE1oeVhWMGNSbFBYcTNlRUZrMUhH?=
 =?utf-8?B?V2R2RWZmUFJuYTR1V043bXltcEpmOGtDQmFYM2M0MkVjL1ZpYWtjaEZXZG1s?=
 =?utf-8?B?UytUek5QNnVPaDFwU0phenl2SUN0UDY2QVdKZ2hVSVJQMS9PY2dCTmhFSEdp?=
 =?utf-8?B?OTNBeUdMcXMzUStuKytETktpLy93dlg3eFFXcTlmMUZOVnFEY0xFN0ZMK1VN?=
 =?utf-8?B?bGVYUWZLak9iTXdPclJodGZUQ1U3SUlkZUF2aUd2QU9UVGxlaitsVjRpTThK?=
 =?utf-8?B?R0U3NUFWemdoTnozRGFrOUtjd25JZnJRWlJFNXJWNFk1bkJZRFZPU1I4NlVi?=
 =?utf-8?B?MWN4VzRicFVHWkt4T3YvbHVxUnJhUmhTMEVxTHlab3lVM2VJSjQ5VWJjUHhy?=
 =?utf-8?B?SDhFT0cvWE1lSDJyRVNlVGN2T252ZWRxUkVRK2tzdFdzSXNVZTNnKytvTGdj?=
 =?utf-8?B?L2FrN3ZPRyt3N3lDWDhPYjQyZCt6emdHalZVUWhGSGRTNUFzU3E3aUpWTlpZ?=
 =?utf-8?B?eHFmMXVKWkoyR0NxSG4vVk1aVlZsUjdlRktGOXNpRmJSRkxSRC9hdE9qWm0y?=
 =?utf-8?B?K2tUT3VDWUp5RXdWMmdkejl3c29OemdqaWwxTFR4UFp5NUhUSEVobVlZSGZR?=
 =?utf-8?B?V3hDSFc1cER2Y3RGM3lHR3lRYWZUUlpnTzZOMGpNeER2TzUxWE1ueFhNL01t?=
 =?utf-8?B?Q3YreXVvOWp2M2REN0FKckFockFkaHd3ZkhyUFd1dWVoSWZ2S1NXVVJ0Mnpw?=
 =?utf-8?B?SEhDVGQ0OUF4b1VqNGgzSnhKMVNoWGcxTlMyMjVGN05HRUNEV0s3UUUxZ2Ex?=
 =?utf-8?Q?wAEcUBdgRj6Yl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTJiTGgrc3c0RkIwV1BDVGRPY21abWtJeENhTS9Eb1lmWSswN1Z1TG9ieStq?=
 =?utf-8?B?RUxpMHJCMG5BeUFaR09FYTRJZmVidDRXSTJGVnNCQjJIb2tVdXRqSHNXSDA5?=
 =?utf-8?B?ZjJyRUpmRTVrV2pOWDZxUHJYd0NzMk10ZzdYVGdNTDJjckJFR1pIait2T0hm?=
 =?utf-8?B?aHNZUDhCWmNpUk8wcnZUQW5naUZLVGdXVS93ZkE1UU9UTC91Skxva2ZGNlUr?=
 =?utf-8?B?dnpzb0RhdUhTMFdBN1cvMjBWZXRDUk42T2RkNVRBZllHU1lHVDNJd3JPRFlI?=
 =?utf-8?B?MjRMdkFyaUJ6VU0yVXdCTm9senpIdjVFN3RleHd1WG5KRU1mMVFTQTMrOEVB?=
 =?utf-8?B?Zk9xNVcxT1JtOVdQS1lWaXF2cThsQTFOdFg0UHlHN2g1eE54aHB1R0NzQmtM?=
 =?utf-8?B?cG1KblkrNUZXMUk4R0dZdDh6UEpXaXVtSHNURFU4Q1BuSFhyS2NnclpUa3Na?=
 =?utf-8?B?K1VKWjE5UkZqNGxNQ0MvSXlKZ1k1c1BKSnAwMzZBL1BxVWY4ejllc3ZRU0RT?=
 =?utf-8?B?QkRJblZzM2dtUEU0amRFOThsdWZQTHpBbkpEdzJWbEl4NTVXOFV3TUxhc0VK?=
 =?utf-8?B?RHg4dEd4ZVhIbEFkV2JKcm1uRnI1ejNuajVaTXdoQXIxaGdkc3paZHBCQmty?=
 =?utf-8?B?UG0vM1ZuaEVxL1EycE1hZDVSWFRFb1lNQ2wxUEMxQ0hSMTJHemc3bUhadEx3?=
 =?utf-8?B?dWlsSWZBckp0VzU5UURaZEtvNEN2cTllQ25NQUJ6eC9Ta3FnSjJCbWJRTk02?=
 =?utf-8?B?VjNlMTJrU1h2ek9BS3ZsOXpvM2FtMEF6Z3A0a29SWCtFRDRScHFWTUVXWkQ5?=
 =?utf-8?B?U3gya1hIVWlqQUc4WHRPektQVUhTSnRLMWR6SnhFTFlTRXc2RTFscEF6alp3?=
 =?utf-8?B?MGd5N0lmeDdRNm5mSWpncStTcUUySWszZDhnQU45QWo5VmRMTjlERDZ2Sy9Z?=
 =?utf-8?B?ZmNwdnduWnp4Z0tBQ1BmdTUrUkl2SmVwWHJPbDY3emJrTkh0aHRwbTBjVG5n?=
 =?utf-8?B?OFVFMitOemN1QlNaTnVEYVVubWxiRDdUdHlHT1RPVXVaZWdqSEJXd2wwQS9R?=
 =?utf-8?B?eEgyZ2pUWVlZZmdacG9sSnhSZDQ2NUUvajR2TllGTVp0T2FabDdHT3hsREpF?=
 =?utf-8?B?WXFjWVRpYjZnRWVDU2NzRjYxd0NqYXFSZEtwdVR5bEtqdExrb2ptV1o4YzVn?=
 =?utf-8?B?bjVkV3FxbUZ2WkgwTVRaZXJuRlA0Tzl6OXJ4OVlWbFdNY3ZPU0ZxeTZGRGpT?=
 =?utf-8?B?Ti9UOUp4NzI4cktqejR1WUplZGV4M1o0bm9vY0dkWHJPSGNvMHNXY1o5Yk5m?=
 =?utf-8?B?VVBHUW1STnhIUlNSZFpRTlB0SG56ZU1iRHBXZzJ0MlRKYlRYNUVONHViTmV1?=
 =?utf-8?B?NWdVWFh4K25BWE0vcDFGVk1HdXB2dGpiVmVXVWZYd2RrQU1PWU5kM0Noazk5?=
 =?utf-8?B?cWM2VUhUdHlxN0V4dStKSjdIQlBzRGU0RW9pRXkzSytNb2JWY0dkNW9iSlFt?=
 =?utf-8?B?emNOWTJCUjZONEUvdElTZ1FSREM2NldOL2VaN01HMDdtRGtCWFJvZnI5dFM1?=
 =?utf-8?B?MlNyRnJvbEF5ZkVGVG9MZXFhQzA1TWlaYUdmYk5iT2t3bytBOEl1ZVFSZWtu?=
 =?utf-8?B?a1RPWHg0Q1FhVjJUcDJGZHh1dkJLL0RJckpKZVY4S2lMVTB5THVPcFBLeERO?=
 =?utf-8?B?SkRkeFdQNE9DOHorVExCaGpqVGFVcGVSMExrbDNsVmtGWSswWERlQzY3amor?=
 =?utf-8?B?QngvWThoR0RncGU5MHJ3NlZyQ2tmVndFUC9ESzlaenh3WVlaMW90WVN1WFNJ?=
 =?utf-8?B?UUFLa2Y1S3RreEdndjU2SmR2cUVrNzJLVnFJbnl2NG5IT2VZTmFDT3NDSG1K?=
 =?utf-8?B?aUI1Zit4L0VJOVpvYnJzdktNUlMzZVAvQjM5M0ZwU05MZFFBY2lQU3Fwb2RC?=
 =?utf-8?B?TDZyaEdIOW94M0xDNlFDRUU3OThBY3FZUUMzMitCQ0xsWkFMVWtOVHM4K1lw?=
 =?utf-8?B?cERoNlhoRy9BVjZuaVQzR0Q2Q3JkUVVFUk0rb3pWd3R5dzU3d1hvSzdVUEc0?=
 =?utf-8?B?QSt6NWpOTFRGSkl4amh6MTdhaGN5YXhZdVJzS0RBenZwLzhDR1F4VW5Pc1RZ?=
 =?utf-8?B?MVpIN1FtTzQ2MlNiY0RZYkV1V1h2c0c2emhpTzhrbjhkOCs1KzRmQzBIbUhP?=
 =?utf-8?B?bnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 34af8ba0-6459-4309-d150-08dd4c846e72
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 23:16:23.0947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XCGtraMqANqzfOWqeiKOK9c2IEmBgR8MtdjMigXGyzCWWtonmNSQUeP5uwQB4ly2PBX+6NrwDK2fVludX7dN/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4767
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

LGTM
Reviewed-by: Zhanjun Dong <zhanjun.dong@intel.com>

On 2025-02-13 2:51 p.m., Alan Previn wrote:
> GuC-Err-Capture should not be storing register snapshot
> nodes directly inside of the top level xe_devcoredump_snapshot
> structure that it doesn't control. Furthermore, that is
> is not right from a driver subsystem layering perspective.
> 
> Instead, when a matching GuC-Err-Capture register snapshot is
> available, it should be stored in xe_hw_engine_snapshot structure.
> 
> To ensure the manual snapshots can be retrieved and released
> like the firmware reported snapshot nodes, replace xe_engine_manual_capture
> with xe_guc_capture_snapshot_store_manual_job (which generates
> and stores the manual GuC-Err-Capture register snapshot
> with a job association within its internal outlist). Take note
> that this replacement function will NOT handle raw jobless
> register dumps. That will be created as a separate helper
> in a following patch of this series.
> 
>     v8:- Add back missing SRIOV-VF-bailout check when getting manual
>          register dumps (Zhanjun).
>        - Add header-comments on the separation of jobless manual-capture
>          as a subsequent patch. (Zhanjun)
>        - Change some xe_gt_warns to xe_gt_dbgs. (Zhanjun)
>     v7:- Use xe_gt_dbg instead of xe_gt_warn when neither GuC-sourced nor
>          manual-sourced capture node is found during xe_hw_engine printing
>          because this can be valid in some code-paths such as for
>          gt-reset events. (John Harrison)
> 
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_devcoredump.c       |   3 -
>   drivers/gpu/drm/xe/xe_devcoredump_types.h |   6 -
>   drivers/gpu/drm/xe/xe_guc_capture.c       | 154 ++++++++++------------
>   drivers/gpu/drm/xe/xe_guc_capture.h       |   9 +-
>   drivers/gpu/drm/xe/xe_guc_submit.c        |  12 +-
>   drivers/gpu/drm/xe/xe_hw_engine.c         |  34 +++--
>   drivers/gpu/drm/xe/xe_hw_engine_types.h   |   8 ++
>   7 files changed, 106 insertions(+), 120 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 39fe485d2085..006041997550 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -149,9 +149,6 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
>   	xe_guc_ct_snapshot_free(ss->guc.ct);
>   	ss->guc.ct = NULL;
>   
> -	xe_guc_capture_put_matched_nodes(&ss->gt->uc.guc);
> -	ss->matched_node = NULL;
> -
>   	xe_guc_exec_queue_snapshot_free(ss->ge);
>   	ss->ge = NULL;
>   
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> index c94ce21043a8..28486ed93314 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> @@ -53,12 +53,6 @@ struct xe_devcoredump_snapshot {
>   	struct xe_hw_engine_snapshot *hwe[XE_NUM_HW_ENGINES];
>   	/** @job: Snapshot of job state */
>   	struct xe_sched_job_snapshot *job;
> -	/**
> -	 * @matched_node: The matched capture node for timedout job
> -	 * this single-node tracker works because devcoredump will always only
> -	 * produce one hw-engine capture per devcoredump event
> -	 */
> -	struct xe_guc_capture_snapshot *matched_node;
>   	/** @vm: Snapshot of VM state */
>   	struct xe_vm_snapshot *vm;
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index e04c87739267..1f9d49f5a805 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -1532,35 +1532,21 @@ read_reg_to_node(struct xe_hw_engine *hwe, const struct __guc_mmio_reg_descr_gro
>   	}
>   }
>   
> -/**
> - * xe_engine_manual_capture - Take a manual engine snapshot from engine.
> - * @hwe: Xe HW Engine.
> - * @snapshot: The engine snapshot
> - *
> - * Take engine snapshot from engine read.
> - *
> - * Returns: None
> - */
> -void
> -xe_engine_manual_capture(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot *snapshot)
> +static struct xe_guc_capture_snapshot *
> +guc_capture_get_manual_snapshot(struct xe_guc *guc, struct xe_hw_engine *hwe)
>   {
> -	struct xe_gt *gt = hwe->gt;
> -	struct xe_device *xe = gt_to_xe(gt);
> -	struct xe_guc *guc = &gt->uc.guc;
> -	struct xe_devcoredump *devcoredump = &xe->devcoredump;
> +	struct xe_gt *gt = guc_to_gt(guc);
>   	enum guc_capture_list_class_type capture_class;
>   	const struct __guc_mmio_reg_descr_group *list;
>   	struct xe_guc_capture_snapshot *new;
>   	enum guc_state_capture_type type;
> -	u16 guc_id = 0;
> -	u32 lrca = 0;
>   
> -	if (IS_SRIOV_VF(xe))
> -		return;
> +	if (IS_SRIOV_VF(guc_to_xe(guc)))
> +		return NULL;
>   
>   	new = guc_capture_get_prealloc_node(guc);
>   	if (!new)
> -		return;
> +		return NULL;
>   
>   	capture_class = xe_engine_class_to_guc_capture_class(hwe->class);
>   	for (type = GUC_STATE_CAPTURE_TYPE_GLOBAL; type < GUC_STATE_CAPTURE_TYPE_MAX; type++) {
> @@ -1594,26 +1580,64 @@ xe_engine_manual_capture(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot
>   		}
>   	}
>   
> -	if (devcoredump && devcoredump->captured) {
> -		struct xe_guc_submit_exec_queue_snapshot *ge = devcoredump->snapshot.ge;
> +	new->eng_class = xe_engine_class_to_guc_class(hwe->class);
> +	new->eng_inst = hwe->instance;
>   
> -		if (ge) {
> -			guc_id = ge->guc.id;
> -			if (ge->lrc[0])
> -				lrca = ge->lrc[0]->context_desc;
> -		}
> +	return new;
> +}
> +
> +/**
> + * xe_guc_capture_snapshot_store_manual_job - Generate and store a manual engine register dump
> + * @guc: Target GuC for manual capture
> + * @q: Associated xe_exec_queue to simulate a manual capture on its behalf.
> + *
> + * Generate a manual GuC-Error-Capture snapshot of engine instance + engine class registers
> + * for the engine of the given exec queue. Stores this node in internal outlist for future
> + * retrieval with the ability to match up against the same queue.
> + *
> + * Returns: None
> + */
> +void
> +xe_guc_capture_snapshot_store_manual_job(struct xe_guc *guc, struct xe_exec_queue *q)
> +{
> +	struct xe_guc_capture_snapshot *new;
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
> +
> +	/* we don't support GuC-Error-Capture, including manual captures on VFs */
> +	if (IS_SRIOV_VF(guc_to_xe(guc)))
> +		return;
> +
> +	if (!q) {
> +		xe_gt_dbg(gt, "Manual GuC Error capture requested with invalid job\n");
> +		return;
>   	}
>   
> -	new->eng_class = xe_engine_class_to_guc_class(hwe->class);
> -	new->eng_inst = hwe->instance;
> -	new->guc_id = guc_id;
> -	new->lrca = lrca;
> +	/* Find hwe for the queue */
> +	for_each_hw_engine(hwe, gt, id) {
> +		if (hwe != q->hwe)
> +			continue;
> +		break;
> +	}
> +	if (hwe != q->hwe) {
> +		xe_gt_dbg(gt, "Manual GuC Error capture failed to find matching engine\n");
> +		return;
> +	}
> +
> +	new = guc_capture_get_manual_snapshot(guc, hwe);
> +	if (!new)
> +		return;
> +
> +	new->guc_id = q->guc->id;
> +	new->lrca = xe_lrc_ggtt_addr(q->lrc[0]);
>   	new->is_partial = 0;
>   	new->locked = 1;
>   	new->source = XE_ENGINE_CAPTURE_SOURCE_MANUAL;
>   
>   	guc_capture_add_node_to_outlist(guc->capture, new);
> -	devcoredump->snapshot.matched_node = new;
> +
> +	return;
>   }
>   
>   static struct guc_mmio_reg *
> @@ -1638,20 +1662,18 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
>   			     u32 type, const struct __guc_mmio_reg_descr_group *list)
>   {
>   	struct xe_gt *gt = snapshot->hwe->gt;
> -	struct xe_device *xe = gt_to_xe(gt);
>   	struct xe_guc *guc = &gt->uc.guc;
> -	struct xe_devcoredump *devcoredump = &xe->devcoredump;
> -	struct xe_devcoredump_snapshot *devcore_snapshot = &devcoredump->snapshot;
>   	struct gcap_reg_list_info *reginfo = NULL;
>   	u32 i, last_value = 0;
>   	bool is_ext, low32_ready = false;
>   
>   	if (!list || !list->list || list->num_regs == 0)
>   		return;
> -	XE_WARN_ON(!devcore_snapshot->matched_node);
> +
> +	XE_WARN_ON(!snapshot->matched_node);
>   
>   	is_ext = list == guc->capture->extlists;
> -	reginfo = &devcore_snapshot->matched_node->reginfo[type];
> +	reginfo = &snapshot->matched_node->reginfo[type];
>   
>   	/*
>   	 * loop through descriptor first and find the register in the node
> @@ -1756,21 +1778,14 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
>   	int type;
>   	const struct __guc_mmio_reg_descr_group *list;
>   	enum guc_capture_list_class_type capture_class;
> -
>   	struct xe_gt *gt;
> -	struct xe_device *xe;
> -	struct xe_devcoredump *devcoredump;
> -	struct xe_devcoredump_snapshot *devcore_snapshot;
>   
>   	if (!snapshot)
>   		return;
>   
>   	gt = snapshot->hwe->gt;
> -	xe = gt_to_xe(gt);
> -	devcoredump = &xe->devcoredump;
> -	devcore_snapshot = &devcoredump->snapshot;
>   
> -	if (!devcore_snapshot->matched_node)
> +	if (!snapshot->matched_node)
>   		return;
>   
>   	xe_gt_assert(gt, snapshot->hwe);
> @@ -1781,9 +1796,9 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
>   		   snapshot->name ? snapshot->name : "",
>   		   snapshot->logical_instance);
>   	drm_printf(p, "\tCapture_source: %s\n",
> -		   devcore_snapshot->matched_node->source == XE_ENGINE_CAPTURE_SOURCE_GUC ?
> +		   snapshot->matched_node->source == XE_ENGINE_CAPTURE_SOURCE_GUC ?
>   		   "GuC" : "Manual");
> -	drm_printf(p, "\tCoverage: %s\n", grptype[devcore_snapshot->matched_node->is_partial]);
> +	drm_printf(p, "\tCoverage: %s\n", grptype[snapshot->matched_node->is_partial]);
>   	drm_printf(p, "\tForcewake: domain 0x%x, ref %d\n",
>   		   snapshot->forcewake.domain, snapshot->forcewake.ref);
>   	drm_printf(p, "\tReserved: %s\n",
> @@ -1809,6 +1824,7 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
>   /**
>    * xe_guc_capture_get_matching_and_lock - Matching GuC capture for the queue.
>    * @q: The exec queue object
> + * @srctype: if the capture-node being searched was manual or from guc
>    *
>    * Search within the capture outlist for the queue, could be used for check if
>    * GuC capture is ready for the queue.
> @@ -1817,13 +1833,13 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
>    * Returns: found guc-capture node ptr else NULL
>    */
>   struct xe_guc_capture_snapshot *
> -xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q)
> +xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q,
> +				     enum xe_guc_capture_snapshot_source srctype)
>   {
>   	struct xe_hw_engine *hwe;
>   	enum xe_hw_engine_id id;
>   	struct xe_device *xe;
>   	u16 guc_class = GUC_LAST_ENGINE_CLASS + 1;
> -	struct xe_devcoredump_snapshot *ss;
>   
>   	if (!q || !q->gt)
>   		return NULL;
> @@ -1832,10 +1848,6 @@ xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q)
>   	if (xe->wedged.mode >= 2 || !xe_device_uc_enabled(xe) || IS_SRIOV_VF(xe))
>   		return NULL;
>   
> -	ss = &xe->devcoredump.snapshot;
> -	if (ss->matched_node && ss->matched_node->source == XE_ENGINE_CAPTURE_SOURCE_GUC)
> -		return ss->matched_node;
> -
>   	/* Find hwe for the queue */
>   	for_each_hw_engine(hwe, q->gt, id) {
>   		if (hwe != q->hwe)
> @@ -1858,7 +1870,7 @@ xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q)
>   		list_for_each_entry_safe(n, ntmp, &guc->capture->outlist, link) {
>   			if (n->eng_class == guc_class && n->eng_inst == hwe->instance &&
>   			    n->guc_id == guc_id && n->lrca == lrca &&
> -			    n->source == XE_ENGINE_CAPTURE_SOURCE_GUC) {
> +			    n->source == srctype) {
>   				n->locked = 1;
>   				return n;
>   			}
> @@ -1893,51 +1905,23 @@ xe_engine_snapshot_capture_for_queue(struct xe_exec_queue *q)
>   			coredump->snapshot.hwe[id] = NULL;
>   			continue;
>   		}
> -
> -		if (!coredump->snapshot.hwe[id]) {
> -			coredump->snapshot.hwe[id] =
> -				xe_hw_engine_snapshot_capture(hwe, q);
> -		} else {
> -			struct xe_guc_capture_snapshot *new;
> -
> -			new = xe_guc_capture_get_matching_and_lock(q);
> -			if (new) {
> -				struct xe_guc *guc =  &q->gt->uc.guc;
> -
> -				/*
> -				 * If we are in here, it means we found a fresh
> -				 * GuC-err-capture node for this engine after
> -				 * previously failing to find a match in the
> -				 * early part of guc_exec_queue_timedout_job.
> -				 * Thus we must free the manually captured node
> -				 */
> -				guc_capture_free_outlist_node(guc->capture,
> -							      coredump->snapshot.matched_node);
> -				coredump->snapshot.matched_node = new;
> -			}
> -		}
> -
> -		break;
> +		coredump->snapshot.hwe[id] = xe_hw_engine_snapshot_capture(hwe, q);
>   	}
>   }
>   
>   /*
>    * xe_guc_capture_put_matched_nodes - Cleanup matched nodes
>    * @guc: The GuC object
> + * @n: the capture node we want to free (along with stale reports from GuC)
>    *
>    * Free matched node and all nodes with the equal guc_id from
>    * GuC captured outlist
>    */
> -void xe_guc_capture_put_matched_nodes(struct xe_guc *guc)
> +void xe_guc_capture_put_matched_nodes(struct xe_guc *guc, struct xe_guc_capture_snapshot *n)
>   {
> -	struct xe_device *xe = guc_to_xe(guc);
> -	struct xe_devcoredump *devcoredump = &xe->devcoredump;
> -	struct xe_guc_capture_snapshot *n = devcoredump->snapshot.matched_node;
> -
>   	if (n) {
>   		guc_capture_remove_stale_matches_from_list(guc->capture, n);
>   		guc_capture_free_outlist_node(guc->capture, n);
> -		devcoredump->snapshot.matched_node = NULL;
>   	}
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
> index 046989fba3b1..8ac893c92f19 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.h
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.h
> @@ -9,6 +9,7 @@
>   #include <linux/types.h>
>   #include "abi/guc_capture_abi.h"
>   #include "xe_guc.h"
> +#include "xe_guc_capture_snapshot_types.h"
>   #include "xe_guc_fwif.h"
>   
>   struct xe_exec_queue;
> @@ -50,12 +51,14 @@ size_t xe_guc_capture_ads_input_worst_size(struct xe_guc *guc);
>   const struct __guc_mmio_reg_descr_group *
>   xe_guc_capture_get_reg_desc_list(struct xe_gt *gt, u32 owner, u32 type,
>   				 enum guc_capture_list_class_type capture_class, bool is_ext);
> -struct xe_guc_capture_snapshot *xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q);
> -void xe_engine_manual_capture(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot *snapshot);
> +struct xe_guc_capture_snapshot *
> +xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q,
> +				     enum xe_guc_capture_snapshot_source srctype);
> +void xe_guc_capture_snapshot_store_manual_job(struct xe_guc *guc, struct xe_exec_queue *q);
>   void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p);
>   void xe_engine_snapshot_capture_for_queue(struct xe_exec_queue *q);
>   void xe_guc_capture_steered_list_init(struct xe_guc *guc);
> -void xe_guc_capture_put_matched_nodes(struct xe_guc *guc);
> +void xe_guc_capture_put_matched_nodes(struct xe_guc *guc, struct xe_guc_capture_snapshot *n);
>   int xe_guc_capture_init(struct xe_guc *guc);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 913c74d6e2ae..6e33081dd7b8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -28,6 +28,7 @@
>   #include "xe_gt_printk.h"
>   #include "xe_guc.h"
>   #include "xe_guc_capture.h"
> +#include "xe_guc_capture_snapshot_types.h"
>   #include "xe_guc_ct.h"
>   #include "xe_guc_exec_queue_types.h"
>   #include "xe_guc_id_mgr.h"
> @@ -1070,14 +1071,17 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   	 * do manual capture first and decide later if we need to use it
>   	 */
>   	if (!exec_queue_killed(q) && !xe->devcoredump.captured &&
> -	    !xe_guc_capture_get_matching_and_lock(q)) {
> +	    !xe_guc_capture_get_matching_and_lock(q, XE_ENGINE_CAPTURE_SOURCE_GUC)) {
>   		/* take force wake before engine register manual capture */
>   		fw_ref = xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
>   		if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
>   			xe_gt_info(q->gt, "failed to get forcewake for coredump capture\n");
> -
> -		xe_engine_snapshot_capture_for_queue(q);
> -
> +		/*
> +		 * Generate a manual capture. Below function will store it
> +		 * in GuC Error Capture's internal link-list as if it came from GuC
> +		 * but with a source-type == XE_ENGINE_CAPTURE_SOURCE_MANUAL
> +		 */
> +		xe_guc_capture_snapshot_store_manual_job(guc, q);
>   		xe_force_wake_put(gt_to_fw(q->gt), fw_ref);
>   	}
>   
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index a99e3160724b..02871d319471 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -25,6 +25,7 @@
>   #include "xe_gt_mcr.h"
>   #include "xe_gt_topology.h"
>   #include "xe_guc_capture.h"
> +#include "xe_guc_capture_snapshot_types.h"
>   #include "xe_hw_engine_group.h"
>   #include "xe_hw_fence.h"
>   #include "xe_irq.h"
> @@ -867,22 +868,22 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_queue *q)
>   		return snapshot;
>   
>   	if (q) {
> -		/* If got guc capture, set source to GuC */
> -		node = xe_guc_capture_get_matching_and_lock(q);
> -		if (node) {
> -			struct xe_device *xe = gt_to_xe(hwe->gt);
> -			struct xe_devcoredump *coredump = &xe->devcoredump;
> -
> -			coredump->snapshot.matched_node = node;
> -			xe_gt_dbg(hwe->gt, "Found and locked GuC-err-capture node");
> -			return snapshot;
> +		/* First, retrieve the manual GuC-Error-Capture node if it exists */
> +		node = xe_guc_capture_get_matching_and_lock(q, XE_ENGINE_CAPTURE_SOURCE_MANUAL);
> +		/* Find preferred node type sourced from firmware if available */
> +		snapshot->matched_node = xe_guc_capture_get_matching_and_lock(q, XE_ENGINE_CAPTURE_SOURCE_GUC);
> +		if (!snapshot->matched_node) {
> +			xe_gt_dbg(hwe->gt, "No fw sourced GuC-Err-Capture for queue %s", q->name);
> +			snapshot->matched_node = node;
> +		} else if (node) {
> +			xe_gt_dbg(hwe->gt, "Found manual GuC-Err-Capture for queue %s", q->name);
> +			xe_guc_capture_put_matched_nodes(&hwe->gt->uc.guc, node);
>   		}
> +		if (!snapshot->matched_node)
> +			xe_gt_dbg(hwe->gt, "Can't retrieve any GuC-Err-Capture node for queue %s",
> +				  q->name);
>   	}
>   
> -	/* otherwise, do manual capture */
> -	xe_engine_manual_capture(hwe, snapshot);
> -	xe_gt_dbg(hwe->gt, "Proceeding with manual engine snapshot");
> -
>   	return snapshot;
>   }
>   
> @@ -900,12 +901,7 @@ void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot)
>   		return;
>   
>   	gt = snapshot->hwe->gt;
> -	/*
> -	 * xe_guc_capture_put_matched_nodes is called here and from
> -	 * xe_devcoredump_snapshot_free, to cover the 2 calling paths
> -	 * of hw_engines - debugfs and devcoredump free.
> -	 */
> -	xe_guc_capture_put_matched_nodes(&gt->uc.guc);
> +	xe_guc_capture_put_matched_nodes(&gt->uc.guc, snapshot->matched_node);
>   
>   	kfree(snapshot->name);
>   	kfree(snapshot);
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> index de69e2628f2f..de1f82c11bcf 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -152,6 +152,7 @@ struct xe_hw_engine {
>   	struct xe_hw_engine_group *hw_engine_group;
>   };
>   
> +struct xe_guc_capture_snapshot;
>   /**
>    * struct xe_hw_engine_snapshot - Hardware engine snapshot
>    *
> @@ -175,6 +176,13 @@ struct xe_hw_engine_snapshot {
>   	u32 mmio_base;
>   	/** @kernel_reserved: Engine reserved, can't be used by userspace */
>   	bool kernel_reserved;
> +	/**
> +	 * @matched_node: GuC Capture snapshot:
> +	 * The matched capture node for the timedout job
> +	 * this single-node tracker works because devcoredump will always only
> +	 * produce one hw-engine capture per devcoredump event
> +	 */
> +	struct xe_guc_capture_snapshot *matched_node;
>   };
>   
>   #endif

