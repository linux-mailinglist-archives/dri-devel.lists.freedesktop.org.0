Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11976BAAAAA
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 23:47:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D1410E4B0;
	Mon, 29 Sep 2025 21:47:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lVefmz8A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F15AC10E3D1;
 Mon, 29 Sep 2025 21:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759182448; x=1790718448;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Bp72kthbIC1O8/KkxYFWDifizZHo3vMfXSNJ8C8EQuQ=;
 b=lVefmz8ASxEEESD7v9QA5b5pt1mbJm+tBUpxhEF3241C7ltUCVE0OifA
 PlabzJn+7iPpucaqTHoxEpeDEZqL2SZ3LnrOi/uNn6eyukSop/ewnoCnt
 czNzXXq6yp/10GteybZ5W0cKPSVo6T4woNU24v24jORuFptqH1joG7c/o
 sKrdF/tcFYlDg0bLIBgkk68I8f+VxCIva9t3Qbs+WfYaSNysmjPVBzMrP
 EStUNZ8af/cvfKIUd2iBep12fwn9pHdRtY1d8tb0MxEU4aoqsgHdkwFLz
 ZV0/l6Sg0G7jwa6uK8n6+CMgEXBTK3eQbjRwCeODbjWFVw05LP4bsFcIk A==;
X-CSE-ConnectionGUID: /chRyRNASMa8FI2ZwUnURQ==
X-CSE-MsgGUID: 5xKFHKlTTW6ei4XdLjQ72g==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="65069057"
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="65069057"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 14:47:27 -0700
X-CSE-ConnectionGUID: 3tNk9EM4Rq2dK+1BAHgRjw==
X-CSE-MsgGUID: xwknec2KT9OyZE7NeNDu6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="183598043"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 14:47:27 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 14:47:26 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 14:47:26 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.45) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 14:47:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UlZoY3IgxeBggDOR9HSOeODsoYx8zAtXHXmTg/e9/MC0esXEPtPGMWKUDxaHlnb159RLPU2G+KBjENIz3ZAJV5T5IIaD7p1sxnmYynMvybChWvREFKIu4Z8/9nz5ISn47BWGRGXWMryBLxQ/xVgBANLQj5lXFuWpLQbcs81m23b+YYgy+5RqSpZR67RJ34pkCQgDYSmuyKinJ8/LWj7m2OAxUncWZ1ErtCaGXpDi28ykD5Lfj4dVD8tGJDNVodlpmnKIzNHXXCbiPUFlIbglPkDQVBe/pSX4uUjobWXuSWkDeatcDowaz1/aDt8SdNuUdZgweLXxTHARjsoFTsPTvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mG7sL0i2R4G678TygmwCuQ0RWGCj03w8DHqGAtSeKH8=;
 b=g47b7LksDuRdGe+yukFdO/Gkb65rUsk26bCNJwhFgd8cQ9iBRMBYjHUee4eAJ3bQLRrfTt9NnXNlVW2R0mJOqdN8TYEUON3gSIlQjW3kILnxb/tLtcfAMv2kguWpbTjFemCpzNvVTsFIMWrQ3U30qpJW9fVXgiqSGU7S9U5g2351nIa7X/awiR86gjSaDbSjNpfYb0zYbYy5dUq1FOUu2vD5BKKH7JFGx6kJdtqjSH0YYc6bSnHSQbUkA6p9V9ghK6bRp0BvNhGor3zwQ4Undy9Q5xFfV4vJRQ1HIVb0iJ1UHp3w32RbRzpXNLnV+zqIdKVY4cWCk07f7wpZxF2llQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by MW3PR11MB4588.namprd11.prod.outlook.com (2603:10b6:303:54::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 21:47:24 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 21:47:24 +0000
Message-ID: <0412455f-2738-4eee-8dd2-0dcf28011c85@intel.com>
Date: Tue, 30 Sep 2025 03:17:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] drm/i915/dp: Work around a DSC pixel throughput
 issue
To: Imre Deak <imre.deak@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
CC: Vidya Srinivas <vidya.srinivas@intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20250926211236.474043-1-imre.deak@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250926211236.474043-1-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0122.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::16) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|MW3PR11MB4588:EE_
X-MS-Office365-Filtering-Correlation-Id: c960aa01-9034-43f3-be2a-08ddffa1c61e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UlA3SHR0Z2dYY2F5MXk5alYrUHVnL2FteTFBb0xUWTBHRWJmenJ0TTZqYzhG?=
 =?utf-8?B?RTYyOXhBOHlOc3lUek12ZDZBcWZ0aHpGaHhFam1ENmxxN2ZNZDhjcHBaSXFo?=
 =?utf-8?B?SVN3QThtRHJmSE9HRjZHYmpGSUdJQ2Fzb2x5R1RlbFNlQndJV1NadXJCMGNh?=
 =?utf-8?B?cng4Sm55WnM4ekZBT2xvc3cyS0krblpobGgyN3ZlMlZsd1I5aExzUUxWOFJ6?=
 =?utf-8?B?a1Z2UWFxR1JoWUQ4WTMvam5mbUJZNUFVMUdYcmFTcDFpNStmcTZLNkdWS1pN?=
 =?utf-8?B?THlPTnUrWDNuUDgyemd6ZVdxTThxbnBxK21OeFJKN2ZsM1hiR1NLVGltaU1y?=
 =?utf-8?B?eFBtS04vQ0dNdlFETDNvb3ZwY29CRU10U09sbDhyU3pFT09WMGgxN283eG1j?=
 =?utf-8?B?WkhBWFZVaTVRUVdBckpIZjF1R0V1WkZiVjhGOVNGK1JUUHd0S0xUQnRRMk1J?=
 =?utf-8?B?NG5VV1pabVVvaUx0b3dvdHE4V3RrU0J4RzBreGJhVGMraUN5ZERwSUtnS3dU?=
 =?utf-8?B?YVRVamlDYjZvWkRWYzVkd3RiMi9FSjd0N0VIekJYTjBnK2g5czN2ZGtza092?=
 =?utf-8?B?ZUlVbVZ5d3hscHk0ZXdFUjJMWHlUTEFib1Z6Z3JkUjdiTnFpRGQ5ZlZNM0tX?=
 =?utf-8?B?aHR4Qy9EOUZaNDV2dEl0R01OazM1aFI1M2FNYVRQUThxSERZZ3VtNlFaSEdE?=
 =?utf-8?B?WG9FTzF1clR4MkdLVHFPNUVsN2pwblk2Q0tCbmtGUU1YTkF0MXliMlY5Zy9y?=
 =?utf-8?B?VVJSRTN2VnVHNmN4TnVndmVTQXNWZE1NUnYzYjExOHVvS1pqL0hBeW9iWFNP?=
 =?utf-8?B?U2VWd1JWOFBNNTRES3BCdk95Ri9LclIxSU5OZlM0NVdvMFVsUjZXQmlFMXNY?=
 =?utf-8?B?MDVkYTJ2WlBCc1VEV2xWQ09POWdQOGNKNmdRWmhnVk9YUzdLdktPb28vRVR0?=
 =?utf-8?B?NzVsbnRuOXVlT2lxSlBLenZLV2lXN0FVL2o5NUxsNTlmRHJodXR5dDZmTEdW?=
 =?utf-8?B?QVcxYXpzRWVtNnk4ak5rRGx1cjNGWHU3Z1pRTUI2MXFZcFdRTTIwVHdQUVFR?=
 =?utf-8?B?M3Uwc3l2aFZScGJrZkZ3YmxqaHROMlJtRVAzS2g3K0RBVGFHbXNXZDlha24v?=
 =?utf-8?B?a3ExSFgwaFRTU1dOOWVzWVh6YkxpVUVJaTU3elZqTW8zRC9LZTViSFZsVkxV?=
 =?utf-8?B?T3YrbjljVU5lTzZjRmw0OThTSTNoRTMyTjlEWkhYQXJtelhhSk5tdStEVElZ?=
 =?utf-8?B?Zk5EOVZLYkFlSTBFOXNjQXBFWkpQOGtJOFlDdFp3WndyZXFwTENqMmlXTmpx?=
 =?utf-8?B?RmpuSE9MRnpPeXFYeGQ4aU9QbEtrOTZSZ3lrczRXMmYwM2Z4MHlqenpJbzY4?=
 =?utf-8?B?azN4bDdIT3AwS0g4Rkw5L3FWUUFhNFRILzBPVUVkTFg2Qy9qRk1BWWVHNXdM?=
 =?utf-8?B?Q2h0WVhmbmhSWHpLRUZSQTR5MnltUCtwaENlUFVUU1hXZXg1czRPcCtzVVps?=
 =?utf-8?B?djhxeXZ0dGxaU2kyYThBY05MTlM1S3lUZEl0ZkFDQmNiVjhaVmNkZjVXekUv?=
 =?utf-8?B?SzlRdlpqVkxQd2NvMWJGN0dybWxUdjFvYWFPeVdiLzNXcTVGTGtvSXV2L1h2?=
 =?utf-8?B?blFaMnN1M2ZMZldzeCtzNDVLZmd3NC90M3ArdWF1QmhDWmp1UHU2T2NnZmhG?=
 =?utf-8?B?akpyYmxMWVJlcWtpSE1RQkNSRk94TzFOZndCODZ2V2V0VG5IaGQ1TnFMRkpk?=
 =?utf-8?B?Wmx3d1F4OTVHTFFnbGhJd2l0enZmQno4ZEV2N1p2eXRXbFFtVCtaV3ZhbkFZ?=
 =?utf-8?B?dWtvZHdabWI3ZVFRbi9QM1lGS0RGV3BHWEh3NGJ2VzB3MDJMNm1SREFvZWV2?=
 =?utf-8?B?LzgyQVdselZGU012aDluVU1KS3pWM2FwSGdISUdqZnpvM21rMmsxL1FlMUJo?=
 =?utf-8?B?SWJiK3pFcGRMTDRCeldGbGxaOG1QdTJIeWVmYUVaSnRSRTc0Z2FuNnFYSno5?=
 =?utf-8?B?czRTbGpDN1JBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjMxS2ZBdkdCc0l2dC9ISTdxT2xNekcxKzRra1dCdkpIWXJ2NTZ6QU9ndnEw?=
 =?utf-8?B?MU5YMy9rTkV1YlQ1Qng1NGhMcm80VzdSUW9Ib3RJVHBrY0hXaHE4WEs5eTJV?=
 =?utf-8?B?TE1wYVNkNmdqVERacmVZVjNia0V5TGpRbnpabHlLM0hwSmZCUTg5c3Zudldw?=
 =?utf-8?B?ZVQvR08xdU9IS0pLUzRsc1BnOGN3cFRoR3A0Y1BmTFl5YVhwKzN3QWZzclNn?=
 =?utf-8?B?cGRIejlxcWJtc2IyS2Q3S0lhWTZzVG5YejRBQXVmcmdiS1lkY1lzcWxES1Bm?=
 =?utf-8?B?NkdKUzZWQnNYUDZrTVhPZnJnYXdsZ243bUdDZVpaQ2VRQ0JtR002MmtaR2pq?=
 =?utf-8?B?aEthMml6Y1Z4Skg1VGhsK0xZSjdkMWtDY3Q5Q2QwTjRwQ1lreDNmdlBkTEZW?=
 =?utf-8?B?cjZHUSttVkZrMm8xY2VERUt6ZXExWlBsY2sva3lrSUFIaVMxUjA5WmRVOXQv?=
 =?utf-8?B?SE5aNmdibVdoaDJEYTIrSitocEtlVEc5VjFPVlY0Z1RTZXVTclFxRXhsL2VX?=
 =?utf-8?B?SjJCMHVkZS9vV0tYcjVhaW5rQ2xQT1g3WUlhdG4wK2RjMWJvbW8yZ3I0eTVL?=
 =?utf-8?B?ZGloRDJMMHlOazdCMTJoZ1dMVUl2MW4zd0haQzVDMnh3QWFqelBUcDdjU1JL?=
 =?utf-8?B?UlR1Q0Z0UWNuWFZHZndBY1lPNk9KSHdMdUI1TTdJVU0xb3ZpeGRrbkd4ald3?=
 =?utf-8?B?U013bnpYbUNucGZSMmx5K3JHQmJXL25FUko2bGViRXh1OEZUdXBzc3RKdnV6?=
 =?utf-8?B?b2xEcVRXUUVOMlYwdXZBRmNhd3I2Z3YvRVJlOE1wRS9NQlg0VEIweG1IdjFp?=
 =?utf-8?B?QW1uTTNTUWJCVnhlbnBuOEw4TTJPeHRvb3hOWVNWWDNqUzgrdUd3dkNmMUlR?=
 =?utf-8?B?MmF3cEtQUGpkT0k0WmtmcjVpWTNzbHpleU54RE54ZzEwei93ZnMvMnVjd1pt?=
 =?utf-8?B?TEFtRy9oYVkzWFZ3NXE3TTlxeDI1czZOazJ3TUVaZlRzRm9RUkJQSis4d0pS?=
 =?utf-8?B?eHdIdnpJeGFCZnE3S1JNbGlzcUNlUCtkV29pYWRxb2F0UGM1dE9QeUs5TzJF?=
 =?utf-8?B?WTI1TEhDcHV5R3hMd0JpSDhYVFQyMzBYMVMxandsS2ppRnIxK2drNnl2Ukdk?=
 =?utf-8?B?eXlZUHphTzVCSkJ3VjEwdVFBVVhNQThvb1RhaFBvVXFYcGJTQXRvWGNhenF0?=
 =?utf-8?B?eUszUFlHa2pSVzV5eWRYdnAvZjU3NUlRUytHdCtyaG5uOFZteHU0d09BQi9Y?=
 =?utf-8?B?YzlybWloYzRhUjBtRkdia0hZTFdzdmowekxMak5ncTZKK2VleVQrbFpGSXFC?=
 =?utf-8?B?NzRjMzNhVDk0YkxyNHEzYXdSUW5tYnpxUmYvVHJNVjBIK0VQQ21rcXhlRDVH?=
 =?utf-8?B?anNINUE5WEMzek1odW5WQjVtMXFYV1N0UWJyTG96eURnV1J4OUxPZTQwMFZH?=
 =?utf-8?B?Mnh4MDFIS09hTGl1aFE2aWltTEtPTVpwaHJVaFdsVDdWbUNRZDBiWGxiNUdZ?=
 =?utf-8?B?YVRjZE96NGU4S2wyUFoxZ1RIL3VwUHJDcHpnQ05MYlMyY3o0enorQmJtT1hO?=
 =?utf-8?B?LytLU2FlMStYOStrNVAzTlduMmtmbkI5WkpEL1ZiVnl2ZG1aMS9ha0dkV0Ir?=
 =?utf-8?B?YmtjanBqbDE4ZktSYVcxVWtDUm9vNHhCUy9EZktVS1NITXU3NitVbmlyeFBY?=
 =?utf-8?B?d1FPbzFWWG9TbEdpVDhoSk5qdlRnNWhiSDhQTTdlVE9RUU53cmZsNGU1WkJq?=
 =?utf-8?B?L0VaYytKT3U3TE1DN2lNMEgvcnl1V0ZLKy92ZWJzUDMzOUhweUkyTmV4RXk5?=
 =?utf-8?B?T0RsTURHUDZPZ0I3RllNc2gyWXZsdHBGM0ZyYnBNNmIwTlI0cmN5VkxrVHEz?=
 =?utf-8?B?Z1VFRmpoOTlWWDFXSlpJTmhuc1RUa2Z4eHNDMlkrZDJWcWpENGtxaTN1bm4z?=
 =?utf-8?B?WWkraGRScmlpNWd1b3lOT2V3SmFvOTExckp6WSsyUmJsbmhycms5REdoNmZB?=
 =?utf-8?B?V1RiOEZSUGdkbXBXYXc5eGUwQ3JUdFRjSmVpZWpuYzgxT21vaVJxUTAwdUM5?=
 =?utf-8?B?WDFIMEI0MmdCUHQ2NGN3UHRVUFNSVGtGMWwzaC9wbDZROUd1bXljSVg2aURX?=
 =?utf-8?B?VVMxZWtWVmpncitvOURGWHRlR0xhVkNuS2VEbzVzRnJFaTJaaGsvVmtWdWpH?=
 =?utf-8?B?UlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c960aa01-9034-43f3-be2a-08ddffa1c61e
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 21:47:23.9797 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: orTZuV3DlzIjbD1wAwAVgJZa3kj3pBqfd1H5ngAkyhrVq3Eni385/yv8v9h6lszZTfLGiQ64wE/c2CEwfrX8Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4588
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

Hi Imre,

Thanks for the fix.
Validated with Dell WD 19TB and LG 40WP95-C

Tested-by: Swati Sharma <swati2.sharma@intel.com>

On 27-09-2025 02:42 am, Imre Deak wrote:
> This is v4 of [1], with the following changes:
>
> - Fix drm_dp_dsc_sink_max_slice_throughput()'s name.
> - Use the clearer peak_pixel_rate vs. pixel_clock as the above
>    function's parameter.
> - Clarify the meaning of peak_pixel_rate for MST tiled displays.
> - Fix return value from dsc_throughput_quirk_max_bpp_x16(), in case it's
>    not required to limit the BPP.
>
> [1] https://lore.kernel.org/all/20250924152332.359768-1-imre.deak@intel.com
>
> Reported-by: Vidya Srinivas <vidya.srinivas@intel.com>
> Reported-by: Swati Sharma <swati2.sharma@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: dri-devel@lists.freedesktop.org
>
> Imre Deak (6):
>    drm/dp: Add quirk for Synaptics DSC throughput link-bpp limit
>    drm/dp: Add helpers to query the branch DSC max throughput/line-width
>    drm/i915/dp: Calculate DSC slice count based on per-slice peak
>      throughput
>    drm/i915/dp: Pass DPCD device descriptor to
>      intel_dp_get_dsc_sink_cap()
>    drm/i915/dp: Verify branch devices' overall pixel throughput/line
>      width
>    drm/i915/dp: Handle Synaptics DSC throughput link-bpp quirk
>
>   drivers/gpu/drm/display/drm_dp_helper.c       | 146 ++++++++++++++++++
>   .../drm/i915/display/intel_display_types.h    |   9 ++
>   drivers/gpu/drm/i915/display/intel_dp.c       | 146 ++++++++++++++++--
>   drivers/gpu/drm/i915/display/intel_dp.h       |   5 +-
>   drivers/gpu/drm/i915/display/intel_dp_mst.c   |   9 +-
>   include/drm/display/drm_dp.h                  |   1 +
>   include/drm/display/drm_dp_helper.h           |  14 ++
>   7 files changed, 316 insertions(+), 14 deletions(-)
>

