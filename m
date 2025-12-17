Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEA4CC6520
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 07:58:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28CFF10E092;
	Wed, 17 Dec 2025 06:58:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EVFepR2O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A680110E092;
 Wed, 17 Dec 2025 06:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765954703; x=1797490703;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1GnAdlCHuP2iJ852sV4OXncyEjyI541swpBbHYI7u7k=;
 b=EVFepR2OGorZD0R1H5VskENrreLqjYnR/LmqOhmR3YRAaKRVzUUhtN+e
 fMsoYhbJI4cqfEscRSmt2rpd1MhBfKmTSL/LSpIgPoxZGOevsSee3LRki
 +Sr6F9JsK6wwGQ6AOmLidZkfZxL4II5K1W91xNXV+lugpyBfXI0UCtEmU
 33k1/zkk5U23K7ek5wDa3yx9sI9zh8ZSdVOvn4CrbC7jZABt0j//wLcNR
 KQdfY3Ru4jrALZeBRttha+DaSJ9l4/Fhlh1I0flopzxiVhtijcCeo3g8U
 N4pDYtCZ0EgyPvAcmIH4XpQBvZRosCoJYsOXEik0cUQSrjNdN2j7D0bsA A==;
X-CSE-ConnectionGUID: kPJRNm9IRPeUvioDEl5cmg==
X-CSE-MsgGUID: Hn/Oc9mtTM2FyPusIFcfew==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="66876736"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="66876736"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 22:58:22 -0800
X-CSE-ConnectionGUID: l/7BUha7TWi1MzqUhKLClA==
X-CSE-MsgGUID: NXrlSGo8St2cMXG24Ia1qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="197322816"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 22:58:23 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 22:58:21 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 16 Dec 2025 22:58:21 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.2) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 22:58:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vymWEBjv0cmvVBPe8Ffwp6a1R7L5pQHGSnli4b8RMHD1E5zow6m8mGbFakun0u2hNif2nUPHJgDJlKFXGKWlnUUcMhY2+e3SVR1X4jWYABHVVrLdOoh5UIUfD4o0hMv2YdW3CnydG+VSrTdsq3hZ97bWfm4QQM2Vo0SIuP2HjYglPsyQ12+pODLeahqFWFnxWEo3QVyYkFsIf+IAr8xmNE9Fe+6JqdbCiD5BTxK0+QympHKyguiFnhci5XYUsaUTVh/21Ao+hLa1tNmN3JtyXuLCtWDNXRNSiOWa6lL7gUdMsTgtxWoCX1lTpkKVsi42XOTJrmZFNH+6joRvGY+DJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pPZx+rUQyguEPBEilHw3kjZM6cuRqBhL/W5hZU2Zutk=;
 b=Vjs1UB4A3chq1svLXsfxUNYMVG2tOWA0CfV2i56axIaWIZpQQ2FF4sGPNcsnhYCzdVvrj7/X5u+7iP0ODbbXXxvlgE9fAiFk+jZ5GRwmkPVno+1vgs1VlGmBp1h+nGTcQhZvLUUu3IwKytI1Ggd3SwXLBnrm+oNzHWn/JOHM4vJXHV0vHKLosflQkJyc4Lo24hDtcOcbXUQGjbRy8MW4T/JOsRt3MVqgpgdNqvydPtps2gb4cQ+vnDzgD9Dr2Z5fTym4j5BVr0fJhNtR0O/7v7025Q+fU76eNTeCxcXY86f/its3ZbG0cvCYjEiJZlDpS+JU8dVXgiBrlNcvdhHqQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by SA2PR11MB4875.namprd11.prod.outlook.com
 (2603:10b6:806:11a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 06:58:14 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::803d:39cb:d276:4ee5]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::803d:39cb:d276:4ee5%8]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 06:58:14 +0000
Message-ID: <e274ee0e-c336-4e15-b0c7-79759bacf80c@intel.com>
Date: Wed, 17 Dec 2025 12:28:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 20/22] drm/xe: Use drm_gpusvm_scan_mm()
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <apopple@nvidia.com>,
 <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 <dakr@kernel.org>, "Mrozek, Michal" <michal.mrozek@intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>
References: <20251211165909.219710-1-thomas.hellstrom@linux.intel.com>
 <20251211165909.219710-21-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20251211165909.219710-21-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::16) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|SA2PR11MB4875:EE_
X-MS-Office365-Filtering-Correlation-Id: d1cf928b-0b32-4105-d505-08de3d39a601
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z09iYXJBTHJjK3JxUGY4UjF2eTMzMVozcUliWUx4aUd2Rkd1WDlObmJtdkFO?=
 =?utf-8?B?djJtOEJyZzlUeVh0aDc5M3c0R2lvWTNRMmxneUNwTG56L0pwOXIwNEp1Mkxn?=
 =?utf-8?B?L29hYTN4b01CMDk1N2dNazJhSkVNK0xpVGxkZnFwdWlrV0ZzT00wSnRpQUdk?=
 =?utf-8?B?bnFRQnNmdHhGZU05YVdBL293SWQ2YWJEbU9BKzRKYjhxUEJFZnQ2S1Jla25k?=
 =?utf-8?B?WFZjR1JZellzNnkvNkh4T0R3RnhlSGlMYkd2NUw2L2RueVQ5MUZjQ3NRVkox?=
 =?utf-8?B?S2tZVm9JZWh6cVRqU1dIdkRrYXhPYzB2OUVSMjBTMXZrU0hwcU03K0ZzSnhO?=
 =?utf-8?B?MjVvQ25ZRk9BMDJkMzZvVkJ4N3hJZzZTaVl1VXBPSWtNaUhNMzBoVGxBdEgr?=
 =?utf-8?B?b1IyZTRIN1NBWWxqRUZwNGU2L3o2QVNXNVdMeXZEWStUd1pwSjk2b013eFlo?=
 =?utf-8?B?Vmg3OXNpYWFkVlZzVXl6UmVwK2JhbXpldDdRUG13Q3J2Y3VRaFZjZkxUR2tL?=
 =?utf-8?B?cUNSRitJTi9mTG11Q3AxUUhhUW85OUFpNGhPWEtQMVUvNEc1b3VnY3Y3TGYx?=
 =?utf-8?B?ZHk5U2kvOHdCNXBlcVhTbk84R1NVai9nRTk5N1J2dlcxeVlISXZIM1JLMjhR?=
 =?utf-8?B?bXB3OElWMEc1UFNYSm5jb3RSQWthNk90Q1QrUUkzVmtBanRPWVBBMytySW9Z?=
 =?utf-8?B?U0dJRVE2VXVuRWdsRUxFMmNsQ0FLSmNWY1ZWdi9qTno2KzBnYTlidzJWbHVZ?=
 =?utf-8?B?ZUhId3dRdmV3SnFnT1lNUk12ZEloaWgyUHpza0h3c2M1U3ZLYmVCMHBxUTVY?=
 =?utf-8?B?Z3cxWWRldmNqQld1VTlPc1BuUzVsbHAzR1ZNWjJRM3AvcHptaCsxQkUvUkhM?=
 =?utf-8?B?bThjSVNoNm4vb1BOM29EOXE0REdLMGNYdXhrSk83NjVpcjl4dG95dmQ5NC9L?=
 =?utf-8?B?NW0xUGR0NFdXdzBQRmZQZnh1YmpzUGxEbHBBMC83VGY1Y3pqdjdzNThhcWxt?=
 =?utf-8?B?RWlaZzdnQ0dGbDkrYzF5VnE1czZ4NnY2UjIxOTY0UlU2VUJ1RmJpQWdFd3I0?=
 =?utf-8?B?Zk03Q05oVnZma3FSd2JQdnlvdkh4NkpkQ21hbE5YVStta20zLzd5eUJpeFBu?=
 =?utf-8?B?UUQ2dlJySzVvOTNkaEF0NmM4d3BaanN4YzhjQk9FY3QyZCtqSFo1YjVlU2V4?=
 =?utf-8?B?VWdwSlpna2I3QWI4c3c2dHp4OUF4dE00YWpjMm5RcmdBUGFXTlRWUUZtd2Qv?=
 =?utf-8?B?KyszK2RuRWZ3OW5NbEloSFRSZ2xuaVRhQnczZ3Jsci90Umt3TEE5L1Nrb2hh?=
 =?utf-8?B?dkVNMzc5RTQzYmd5dTVQcHV0OFpkU3gwcm01YzQzZWcvZWhJYWdDK3BYQnpS?=
 =?utf-8?B?dnY2QmdGNFNrdTMxNEZQejVoVHVtWnZ2NTFqS01WdlFKRzVrMVdudy94dFdY?=
 =?utf-8?B?Y05ONG1DUmlrakxkd092STV2VE9DaGc2L3ZUTTkrcDk2ZHFPbVdqU2ZHN1px?=
 =?utf-8?B?RHhJZjgranQ0MTFEWi9LZG1GNlQxMGdiZDlvOHEwZDlzSEpEKzZnb2NsS3V6?=
 =?utf-8?B?Qm5UYVcvaHh0ZHk2ZmQxOEd4UGR2UFZ3aXZHdDVJV3duZWlkb2FoTTZMT1Zj?=
 =?utf-8?B?cm9uWk9FMU9IVXA4ekZGZVhtUHRaSHNhWW5hNWlBekthSURBbUpaMENONXc5?=
 =?utf-8?B?d3hLT0hjSC9tYmlVTTZpL3k1MS9RVzZ6Z0ExcDhQTW9IWTUyOXZuTFA0VzR4?=
 =?utf-8?B?UGZHNzNNY3Z5LzZ4eXdsa2pxNXdjeXhYYjdPdUVhQzNrZW1BdmdvYmozQ09D?=
 =?utf-8?B?QXR0YUtNL2kwbE43eWRqKzR0N3lkL2xOQmFyNlVzYXFlS1R4V01POHk0dFZG?=
 =?utf-8?B?cUtMSUlDMlVmcU9KYVA4dldmQUk3OWNhYUNEa3hNb3VYd3FrMGV3TnU2WGdG?=
 =?utf-8?Q?zfWlsbJmFQ3wz0ZTr29iBDamdEKAjqva?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkRoSDdTOVFjbFpobkJ5bFZlRlRDMTI0TjdyQ2Z3WEFrbStSeW1DaWE5M3dJ?=
 =?utf-8?B?Q2M4YWQ1RHJHR1lmWnRtcU1SbytpaStiSkJGZkhXYWthcFFtYWlZYXl4YTUz?=
 =?utf-8?B?dkNBamtIUzZjU2daN2QwcjVkdzljUTRqa1NwTDB2QS9DS05lNGxGVTVubkI2?=
 =?utf-8?B?VkhtY3J3ZkJUZjlneXlmNzNYRncvR08zUmljZmxhSFY4ZkNNNmFsNVVXbUQw?=
 =?utf-8?B?NjN1TUxBeXJLVkVQWmdKVzZDVzhHS2J0NytuZnhmV2VNS0ZtVFlEWnE1aWhV?=
 =?utf-8?B?VkkrU2JRSmtFbG9oaUduSkdXTEFlYnIwZlR1NE1PaUFaK1NTclk1SlZKUi9T?=
 =?utf-8?B?bXdBeTUzNmlWNm9SSlUrTTV4Y2VxYk1VU1M4OUNCUGZsaFhJaVZDM3plMG15?=
 =?utf-8?B?Z2hiWWpNSkFnT3lZRHBQTDJUZVRmQ3IzTlFRbTEvcTNEdlZ3N1J3YWNtMFFM?=
 =?utf-8?B?a2JtMnhUaGhqS1drNlIxTE8rQkNDN256cVZhR3RyZnp5cUdscXpWMTJxYSs0?=
 =?utf-8?B?Y1M4M2tuKzNpanpXSXdkK3NPZnJudURNdHYwdTJZbk51K3dHNDkyTy9RbHA2?=
 =?utf-8?B?Wm5jNTJ2YnJzYVpseENWNzlNQi92cUp0SThrVDY1WkM5RktUVjduVklWb3Nj?=
 =?utf-8?B?WWhGaHN0aS9mWG9pYXZZMDZXUTMzYjY4ZVFuNkx3RGUxcGc2WjZtV1IveENI?=
 =?utf-8?B?d09CbGRFcnEzZnhDcmlkSm43SnIvMzNNTzVWUlJxTmtCenVoTHdiQ1oyUTdJ?=
 =?utf-8?B?eUQvZWF5bmdUQzNoTlVQcXlCZ1lLRnBzWTNodktmNU5lZDRqY3dOOStnZlVq?=
 =?utf-8?B?OXZjMmtWYnJsdnhvaG91S1F3MDZRSDdyOFhOS1ZGbk56VGx4SWs5RFplLzlR?=
 =?utf-8?B?V0pVOUZRTm84Sjg4RXpUcmdQSDBGVjNqZGVUWkdoMEoxdHBzQkR3RE8yS2dv?=
 =?utf-8?B?UVZvQkVxRDBKRytYQmJaUHM4ZGpTTHNabldWQUZpNFovRmh1SC9sVTZXS1FV?=
 =?utf-8?B?UVE0T0swMVVSYUVQS1NZM1dJZHFuUHdySW5EODJoY2hndUt4aHdDT2VITGox?=
 =?utf-8?B?Y2s1U20vR2o0S3Z5R3g1WnVnd1JsK2VDVTk0ZzVHaTlJLzNaRVZLbU5xN29t?=
 =?utf-8?B?R1k0VmZzNlVHcmg3S0daa2RiNmJOTUNWY284ckduazhLVyswOE1DU3Zua1B2?=
 =?utf-8?B?cG1hUTZvUnp3VFdxU3Vld1M0dTlnWWlOZURnUlYwdDlvMkt2RmtHVE1TSkpI?=
 =?utf-8?B?bVVweDg1L2h2dm1OZjgwdVlBaUIrREpvZnRib3ZEaUFabHBmZmlqclU3ME4r?=
 =?utf-8?B?MGxMOEM1UGgzbkNNcS82cDIxVE5DSFRHM21LU0lDb2V3b2ZKKzkrQW5hcTlY?=
 =?utf-8?B?bjFDVE5VdURYaS9xT3VVQ1pqdGFtQ2NvOVJLcjJjQWRMdlBVVXVoNWNsS216?=
 =?utf-8?B?cjBpb3ZIcFB4N2lyL1A3VUlQUEdlT3ZHTnBJSURkRjlKN0kwWnAvQWYrcjNT?=
 =?utf-8?B?bWRreWg5SDNsVjN1YTBoa0FBVmIxQ2gybVBKZzVub24wcnRqdnRqb2pqbHp6?=
 =?utf-8?B?VVNOeEhUUlZWSXYyOEpZbTB3U25RTmV1ci9aeUEwQklXcGxDN0lzSFNLazgz?=
 =?utf-8?B?c1dUdUpmeWh2L0UwTnZHVitVbE9yRzdRMTlzbzhnalJCUjMraGJ6UGNpTnhW?=
 =?utf-8?B?VzNtTzBSWThlbm52ODFEdERSSWJmUk1ERG9naWhaNWd4MFQvekUwUjJ3UCth?=
 =?utf-8?B?bUEyaXV4MWxiM0tkTm1MeUVLU3BBNlhtMnoxV1g5bVFreWZGdHNnYmFOc0Z1?=
 =?utf-8?B?QWZnNzdrZEhoNitSRXJleHdWVXhIc1daWXJKSldjYy95VWtSSWpiM1dKSWZC?=
 =?utf-8?B?NkZLZG1LcWtndjg4cXVCcnpjNGdpQ2pzblhOMERnMS8rQTBsZktMQzR3Umpk?=
 =?utf-8?B?T090L2Y4RmMzNHRFSEdMRWxNZEIzNDl2ZHVhR3FRNXBxS0Y1eUt3WlBKeWs3?=
 =?utf-8?B?QnlzTWI1MDFmTzludTk0QWg3QkdrcnFOU1VudFltMk8zUDZUYnVsVkdzMzlx?=
 =?utf-8?B?NHJUZ2VrQzQrVm51anluM1FKQVZIYWR6NlhxdUFCaUNVdVZhSnRuUmRuTjds?=
 =?utf-8?B?SU1ueEJYbnJqbmU4ZnFZSHNtUUNHeC91OWxlaWVIaFM0bkFCTTJVcWJiUzlT?=
 =?utf-8?B?VEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1cf928b-0b32-4105-d505-08de3d39a601
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 06:58:14.4503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ikweeWZlheTQzqjR5Sp42J7GdjlyQ8TXMncJaVbKnzhF1zB1GdSCo2NhK37aIQOIga77SyFTpyP39DHwLc2P/4+vBtYC/P2vEp8siUFbAMU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4875
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



On 11-12-2025 22:29, Thomas Hellström wrote:
> Use drm_gpusvm_scan_mm() to avoid unnecessarily calling into
> drm_pagemap_populate_mm();
> 
> v3:
> - New patch.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_svm.c | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 2fa73143fcd5..22281d69e26a 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -1625,11 +1625,23 @@ struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *t
>   int xe_svm_alloc_vram(struct xe_svm_range *range, const struct drm_gpusvm_ctx *ctx,
>   		      struct drm_pagemap *dpagemap)
>   {
> -	struct xe_device *xe = range_to_vm(&range->base)->xe;
> +	struct xe_vm *vm = range_to_vm(&range->base);
> +	enum drm_gpusvm_scan_result migration_state;
> +	struct xe_device *xe = vm->xe;
>   
>   	xe_assert(range_to_vm(&range->base)->xe, range->base.pages.flags.migrate_devmem);
>   	range_debug(range, "ALLOCATE VRAM");
>   
> +	migration_state = drm_gpusvm_scan_mm(&range->base,
> +					     xe_svm_private_page_owner(vm, false),
> +					     dpagemap->pagemap);
> +
> +	if (migration_state == DRM_GPUSVM_SCAN_EQUAL) {
> +		if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM))
> +			drm_dbg(dpagemap->drm, "Already migrated!\n");
> +		return 0;
> +	}
> +
>   	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM))
>   		drm_dbg(&xe->drm, "Request migration to device memory on \"%s\".\n",
>   			dpagemap->drm->unique);

