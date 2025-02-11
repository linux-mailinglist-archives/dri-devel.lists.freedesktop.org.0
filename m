Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD25A3194D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 00:10:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4271F10E752;
	Tue, 11 Feb 2025 23:10:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M1W/m7Ml";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77A3B10E193;
 Tue, 11 Feb 2025 23:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739315406; x=1770851406;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VGQxkNczjD4ea/rjnsctc1nMVPos+mSGXMndiiVGm0w=;
 b=M1W/m7MlGNqhg+biu9pyPj7c2hShXU5wqDAn939Dy3ytImknd7mQJ3Je
 +6faSrLlFRkeKH9u9p78fmV0/5U3kOWiI0NKcjnfe2ORBSN1NPHvIIB/y
 CksUXHVh2QILac2D0gLJw2+fKnO59n48uI5CwSVseE7nbVTgcE1qOggEL
 hXxRM2aNMsZLOrCO1YKlJy4nExRr3KULuiCyWW4JqFyDA9v+byQsuoI/J
 ow772KtVzcJ/V8JgyiV6jozcVtMaznlT4gS6BUCA8dnwj9Q4tKkk9VprK
 1GOB+ToH1IBDu3XszZFFuaIH8d8ZwbwP2xZUx8MTkg40s0PH1DQGtsCd2 Q==;
X-CSE-ConnectionGUID: SVGVzzpNSLG5huKx0rWkPA==
X-CSE-MsgGUID: 5KUiy1avQAaxT/O/X85CYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="40221237"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; d="scan'208";a="40221237"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 15:10:05 -0800
X-CSE-ConnectionGUID: vj0521rtSaauamVB4ZoMcw==
X-CSE-MsgGUID: c0wUE85eSEGFVmoc8cVqmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117268838"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Feb 2025 15:10:04 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Feb 2025 15:10:03 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Feb 2025 15:10:03 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Feb 2025 15:10:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ngp34JY8GAQxmC+CpmLXkfjyV5CieswyTHhEIBKwtET2S0em9bi7E/TCWMnJq8dgpMduIr2+nob8Z7qofR5z0/gNXdpRGDyfpjhcAzgT+hPr2M5qFppQQGJraBNHyOtFjiZzpMbHPgQGKy8HIfgKid7Z2cpNlSjbXGPSYNMWXCnO/fSnaqvbwGszWteU8EBSmbaj5xkwvpJpmRYOgXr4+sy6HkK/kHPrV+S3G4Z1blZO+bIPuPxRnTCmas1bpGIqY+doVxVJ8eaTsUkUj7NsI5M/g/S7bvzVrrnahUdGKQncjdYjHHANc2sAx7iUq9R4CvjeIBgwsbt2jSQYqFyYsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5fVW+PVOLKDRbE+t+5PyaFXilWbsEV0ywALIjZSOTzo=;
 b=xqI0NCFpUj87dnQHRIojVH8ZPfMMaHKV+CktP5c4AfM98jT17QsRpQurwqIBdEYC3n9o6IzzSxCPB5XjbX5J1lTRb4XJd2B3OAJCLI9eKrCpHeCrdfO66IZ8GMLkuLjVPqEmXQ4hFlL643LYXxx7s+AKtRItGpCv/ziESuYJO56gz5No6WflcYGXYQpn5a5z8Wl8Zsi2yAPkZNyw1PFB3wihfyJLLM6I2/Ifq+woFIevBiG455D3YiGaI6dmE6X9jK2wu4zDqww7zjHH7X9XB+yyxQSsVjPW0cFiByiHD+4u+VVGA0Tl2z+VY8ZzOw4dSj7yDAK4RTDzoluvqd3PSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by IA0PR11MB7909.namprd11.prod.outlook.com (2603:10b6:208:407::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 23:09:20 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 23:09:20 +0000
Message-ID: <850c82d7-cdcc-4182-b7db-61f0d38e5a2f@intel.com>
Date: Tue, 11 Feb 2025 18:09:16 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/6] drm/xe/guc: Update comments on GuC-Err-Capture
 flows
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, John Harrison <john.c.harrison@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
References: <20250210233254.419587-1-alan.previn.teres.alexis@intel.com>
 <20250210233254.419587-7-alan.previn.teres.alexis@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <20250210233254.419587-7-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0180.namprd04.prod.outlook.com
 (2603:10b6:303:85::35) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|IA0PR11MB7909:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e18bbe2-1b91-480a-96e3-08dd4af11d98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ajVJc2RBc3ZqZ3BmNjM3UmlEOURTYjZWK3hLVFI5ZVUzRU00NnNxTEtOYzFY?=
 =?utf-8?B?T3BzcC9IVU8vbjVxc0IzREJYKzlrRUtZaHlJVjdCNFp3c1dZeUNQQSt6cFpt?=
 =?utf-8?B?M2hTR1pidUg0QVhWa3h3S2UvSUpydU51dmJWQ3NTT1gwelA3bHpOQllUUTJO?=
 =?utf-8?B?VU1lYjNGZ0xjaUdaMC9RQ2tjRkJ3M2lYK3REc21wQnlqMEMvTzk0S2VJUGIw?=
 =?utf-8?B?dE9yRmlkN0xVV1ZsUzhpRVRpSGNlN2JqdHhrbzZXMnNqN1V6dVZsNW1jdStn?=
 =?utf-8?B?TjRvWTdhREpLV01hL3h2WlNQTDB0TDkvVERTb29QczJaNElTV3FEM09OemNH?=
 =?utf-8?B?dlB2T0o4UStEZS9EeStoY1VBUDA3N2R5NG5BL1lqVnFhbGlUOEtXQU53b0Fm?=
 =?utf-8?B?ck5iZWlyMDVnNElMWTIwSEh0UG5wZWNaQzJNNElBWHdEM2pSdzBtYVE4ZkxQ?=
 =?utf-8?B?ZVF3ZkdkNHdsdGs2ekpEK2U1VjB1aTJ2eUNVWENIQ3JOZHJkWHlGdm5TUWJv?=
 =?utf-8?B?R2hLbDk5SldhUWF3Wi9FM3hjc3JvdWFCUk1iMDY0cTRzQnBXZk1OejVKamUv?=
 =?utf-8?B?SmliUXFsSVJLalNVUmVUTFhITXBsdmhrSFZkVktybDhSM0lheEZnUnoxdktj?=
 =?utf-8?B?SjRESkt5ZDYva1JZRmxvcVZwN2tzNDI5dWV0WitpKzAySkpXWlVCbEtDQmhO?=
 =?utf-8?B?NE5DQTNiRWtqS1lxdm5iaWtOak1hMjgzMHBoRkFUZlB2SDJSZW5FL2FhRDFl?=
 =?utf-8?B?QkJ6eG8zU0oreXo2VDlmUmtBWGI0bXZGbWlsbTE0Z0l1emJXMExaWWdiR1Qv?=
 =?utf-8?B?UG5semIwNjFmWG45aVVGS3RDODd0YWlrMHd5RnR2VjByVUFGdFdnNThwbXhV?=
 =?utf-8?B?aWxGb0Q1UWN0cm1GYm9Gd2hFRkRTaUV3ei9hRGNTQkQyZFdHVG1EbGpXYXUy?=
 =?utf-8?B?ellsUkhCT1dDSGZtZ3FHVm5vWnNLWjEvU080S1MvUzVWdjFPeEVpT3BqZGN5?=
 =?utf-8?B?dmk2R1JONEIrTGtSU3FBck9ONzRnR0NPNkFYZEtGOGp6S0hQNlFBUkp0Wm1l?=
 =?utf-8?B?YmR1NHd4aitISStHMEJPdTk4Q2pFdGMzajFIdlFUMlMyZ2l2NWtRMFpmM2dm?=
 =?utf-8?B?LzRFR1NMdVRVNkduZklrMTFla3c0NlpmWHhvWkRkM3NScmN3bWhjdElTUTVJ?=
 =?utf-8?B?Y3BNS1BDYmRnKytwRTdQL0ZzekpGWTdZVXlkWUNZTUN4eVVJem94aFlCYkZv?=
 =?utf-8?B?Y1grSDdSdGswaFJmck5LczIyRDVlY3ZGbzZSS0tVVWhPR3MrNUttdS9jdUUv?=
 =?utf-8?B?TzBkSWZIcm1RWGRmbGRXb1MrcjgyT052RVJ2K1VOcVZscjU5K1JaNDFyME5x?=
 =?utf-8?B?NmNmYjRaSUc5Mmt6eFJLUVcyL1F5VnFMOVE1WkdqcnNCZGZyejhFSEZWWTJn?=
 =?utf-8?B?aUpPUzA5aDJFOXkxd3V6TzFlVG9SMW84VzFnbzF3Zi9qcDZCdGtDVU5RU3g3?=
 =?utf-8?B?ODV3d002MUtOMkV3R2hpaDZOeXBOSGx2QlVPVzIrVlpwVTRPYVhJMit1NWZN?=
 =?utf-8?B?SU9FV2ZMMVBNSm9rbWd2dnBQMXRqaGpzZ1FQTWs5NVE2V1Z1cWsxUjZWck4r?=
 =?utf-8?B?UE03ZmpuWDI0S3NCTTlVZG9NbmZFZW45TDdrczVuOXlqUzEwL0lWVFBUcWNC?=
 =?utf-8?B?MzZoaDFDczFCd3B5VmJUVXNYVzJMK29jZzVNaFhQWmtZU2lYRWhzWXpCaVVk?=
 =?utf-8?B?ZXhYLzhTME9TeUlwMkVmQksyMVNlcXhDL0VjRUdoOWtBcXhKQWkrelVvTHNQ?=
 =?utf-8?B?TXVrdjYxbjdyZnZNZVNqS3RJU1ViUmNyZ01YL1RTTERPZmJTVXQ5RHZ0MG80?=
 =?utf-8?Q?xkk6q1pC/btVU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Um9ZZWVXZGVlTDNqWnBvVlhmdVRGSVljQW5RNTlCeFRVQUVpRnZxbE4zZklC?=
 =?utf-8?B?MUdva1p3M25MWWFxdHpncmppbThRVERVbzdVTnI4VE0xaU81em5UbUZsSmZL?=
 =?utf-8?B?Q0RnZWRvOStBZFpSZm94TG5pdkRSYXU3bnRuY1lVczM5bGhXQkxFcjNxK2Nv?=
 =?utf-8?B?NGU0dUhTRDFuRkFpYldpSHhKWkRVQmxuc2xkNHpKMUZEOXFYTUM0eDRwTUdO?=
 =?utf-8?B?Z2Z5c2Q1VE1GaCtHUWpORjR0ZVh0WEd3d2RqRno3VFE3YWxhcUtXUFJ4T0tw?=
 =?utf-8?B?QTBZbUtrQTVqR3V3V0M5d1ZvcnhhZFdjSWhrZFhFYUpyWFo4OFkvK0hPekk1?=
 =?utf-8?B?VjBYc01DNzVIdVNNTkV6Q2VnSk9ZZk5GR2Y0ZGo1ZlBZVGxlZUliZUxFK1lG?=
 =?utf-8?B?UElkZUMwZHpoNlNLYktDVUVIYS9XV1Z6T1J1d2g2Y05FYTJBVCtGN2JHdjZD?=
 =?utf-8?B?dFBuMkdCSkhWSjRNc21UcFQ4b0RKZjFlUTRBZEYyQTBvemNnZWM3YUlEMWhv?=
 =?utf-8?B?eVJhNXgwY284QWNYWXFZR2c0dWN0QyswSEVZb2krbVBkSno2ZFRxNG5rWEhj?=
 =?utf-8?B?NkU2TFBjSFN0bWZnY29Nb1dKMzV6N3p5eGQrZVdPd0NCT0crQkl3N1hlb0Ji?=
 =?utf-8?B?SUpwTGVmTjFMOWJwbFVrR1lWYVJ5ZGxSa3ZQSUhUZWhwRlpTdzhmclBoRjBv?=
 =?utf-8?B?eXNXTEdjVEZQSHkxR0JCbzRkNjI3aTY5YlBuZU41L25pb1k0S2dvUG1ST21B?=
 =?utf-8?B?Q2E2UWFwbEVXcW04ZngxSk5aWGlBMk9OZVBXY3BIaWsvSTBzWU9aUFFsQWti?=
 =?utf-8?B?VzdLRVFodHMwdWRWbFRmTGdNZVY5K0REcFpNUm1pVkZzQ2Nod1ZmcytHTXlF?=
 =?utf-8?B?NGxYbHMzaWpsRUlzbXlrallOWnB2VTh6L0ZBaUpETHdNMFJsRjl3OTMxOXJH?=
 =?utf-8?B?anVNK0hxOG5ZMjJOYm9HWlo3ZFhydkFlNlMyNG13bzZCbUk3UHdsazBUbHVM?=
 =?utf-8?B?OGpVNWZsd3lWTDdteUhoRXlqcWhJeHlPUzd3M29jemFUNXlUUjV1L1p4MGQ0?=
 =?utf-8?B?WVdNbkRPM0xrcHRMNDUwamh4ejJrWVdTbzlUTnhHaTNwZDZkRUI2RmEvTWc4?=
 =?utf-8?B?V1pFbUVGK0d5WG9CWEh5S3FNaFpqTWtWeTZFN2NCYVVYcXZqeU9MU3BiWUVn?=
 =?utf-8?B?RVRJZW0rdVFrSm1nWHBjdjIwTjFYWXJoMkxSMERSR253d01FWDBXclcvTjJ4?=
 =?utf-8?B?VjZSMHZET3VEQ3hsZmdDa3dndFpHMjQrU1FhcUhialRyQlNxbG80OTNjNGFZ?=
 =?utf-8?B?M2Z6Q3AzNklIejZRSkhvT1JKQm9ldXE5RmdKVVB0ZUJGRjg0eU9GYnhLR2xm?=
 =?utf-8?B?T2NMU0tjbDZ0OUxUZVRrdnZEck9RZ3RWQlo0ZFJOd0dmL2ZDcDhEOUJ6V0tq?=
 =?utf-8?B?NHdBellESUpmekkrL3NlNlZMQXo5TUFqTnFkYTYyOE5DQmxPSi8vbFJzR2xX?=
 =?utf-8?B?MUZoMHRCM2RhaDV1bkZqR1dmKzUvUUZWY1d5SlZhSnl5R1JWeU81UE5HUG5H?=
 =?utf-8?B?bjM1d0dFaEM0dUZ1bllIUnYxdmI0eGU2QkdHRkdYTEp0cGtvNmVxREV3Z1hP?=
 =?utf-8?B?NnZLcGx3dmdSS2d3TWRaa1VmdTFIVW82c0RXRlgrTU1zTWpWbDZEQUVKYmVv?=
 =?utf-8?B?aEF1Z2pkZjh2RVJvcysxZUxMejFUcHNaa3RQSkJmTlBhZjJhUXJ4UXk0RHpl?=
 =?utf-8?B?alh3bVFkMGdlYVZ4bUZNeXg5TmVUZTFmSXVZSFczOHJwTU1vN05WeDNES21m?=
 =?utf-8?B?Tm1TdjNxZVc4cUI0bENEb050UTNWZE44NEtFMTIvTWdSMlBjaTIwYURYRnRD?=
 =?utf-8?B?QWdTbkpSNEdQcmZobkJIdTJmdzFyZTUzK3ZzQXVkc0UvYXJJeThOQThuZG5y?=
 =?utf-8?B?VUdMRXYrS25pV0lhQk9EZlIxN0xMTGdYM3JjTXF6YXJFNnVDNHJSS2RwYXZk?=
 =?utf-8?B?bEV5eVp3RTVBU0tOaFhrVVZtcWVaUW5NazNFT2ZxQldkRmRKcjJwNnRadVYz?=
 =?utf-8?B?dytnNTBpbWE4VEpRbEVxS1JCR2Z4dDZydmREVHVCU1NqTGhDcGY5d25UOWtn?=
 =?utf-8?B?S0hheHVXbktXL1dDdzkzMGdwVG51RHFiMG5CZEZwZDBqeXBiOEJXcmdYaDUz?=
 =?utf-8?B?S3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e18bbe2-1b91-480a-96e3-08dd4af11d98
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 23:09:20.8342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VDNrcfSzkuO1XL/Jo7XvrssajFoItK6wHoY1GrKPLWEFGFCVbiTO8SNbK4lOs/UZ9gmO2GiSZ6pE479dD+jOUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7909
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



On 2025-02-10 6:32 p.m., Alan Previn wrote:
> Update the comments on GuC-Err-Capture flows with the
> updated function names.
> 
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_capture.c | 19 +++++++++++--------
>   1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index 746d3b21b18b..15f9b08ff7bb 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -905,22 +905,25 @@ guc_capture_init_node(struct xe_guc *guc, struct xe_guc_capture_snapshot *node)
>    *                   list. This list is used for matchup and printout by xe_devcoredump_read
>    *                   and xe_engine_snapshot_print, (when user invokes the devcoredump sysfs).
>    *
> - * GUC --> notify context reset:
> - * -----------------------------
> + * DRM Scheduler job-timeout OR GuC-notify guc-id reset:
> + * -----------------------------------------------------
>    *     --> guc_exec_queue_timedout_job
> - *                   L--> xe_devcoredump
> + *               L--> xe_guc_capture_snapshot_store_manual_job (if GuC didn't report an
> + *                    error capture node for this job)
> + *               L--> xe_devcoredump
>    *                          L--> devcoredump_snapshot
> - *                               --> xe_hw_engine_snapshot_capture
> - *                               --> xe_engine_manual_capture(For manual capture)
> + *                               --> xe_engine_snapshot_capture_for_queue
>    *
> - * User Sysfs / Debugfs
> - * --------------------
> - *      --> xe_devcoredump_read->
> + * User Devcoredump Sysfs
> + * ----------------------
> + *      --> xe_devcoredump_read-> (user cats devcoredump)
>    *             L--> xxx_snapshot_print
>    *                    L--> xe_hw_engine_print --> xe_hw_engine_snapshot_print
>    *                          L--> xe_guc_capture_snapshot_print
				L--> hw_engine_snapshot_capture
     				     xe_guc_capture_snapshot_manual_hwe
				     // The new function which do manual capture without job
And, for debugfs, it did not calls xe_devcoredump_read...
instead, by "hw_engines". Shall we mention debugfs call 
xe_hw_engine_print directly?

Other than that, LGTM
Reviewed-by: Zhanjun Dong <zhanjun.dong@intel.com>


>    *                               Print register lists values saved in matching
>    *                               node from guc->capture->outlist
> + *      --> xe_devcoredump_free (when user clears the dump)
> + *             L--> xe_devcoredump_snapshot_free --> xe_guc_capture_put_matched_nodes
>    *
>    */
>   

