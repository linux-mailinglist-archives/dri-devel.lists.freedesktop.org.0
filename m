Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8023BA77446
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 08:09:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 677BE10E4F3;
	Tue,  1 Apr 2025 06:09:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MPj805/9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 417C010E296;
 Tue,  1 Apr 2025 06:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743487765; x=1775023765;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=OR0bBoEBbwuC5WnrYD8Oovzin+CL5bIekfVovVKg/aU=;
 b=MPj805/9o2HoASFwkmRsigL3R5YobUglLwgN0N1GTfE1De3mRvg4W91M
 KQCn8FfH4EiCJ0ITI9OGWSvTFbMDlQN2cyIf+71bUhjkiWJAn6CBBHbB3
 eIj+gsbwpjEIqbxYAnX7TW/u4btq5jZJ1wP+1axIsepeR4kEWrBLxMEEM
 hKVJPp34m6H4xaM7gLKb+kYgZlXgj/xQcljVZTOkctIoYu5gx7fjURMBh
 sBwgMQrqyFwBWe5tjMU3ixogZ1rG6PAZmuL6YwD0FoBzPKKE0g6GT1Nrm
 aZoWb9F+nCAyFchgo87zTdP0QFt/utPbpYDQxd41ezV/8q/kscwcphQkQ Q==;
X-CSE-ConnectionGUID: 4AfoR7HjRDCsntSB0pGA0w==
X-CSE-MsgGUID: +RMyRBIDR1WIt6fQO+OiXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="44507300"
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; d="scan'208";a="44507300"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 23:09:24 -0700
X-CSE-ConnectionGUID: W4pdXuKwT92M6tSfQM8GZQ==
X-CSE-MsgGUID: MxYJnxUVRyCoGQYRG75Lrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; d="scan'208";a="157287863"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 23:09:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 31 Mar 2025 23:09:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 23:09:23 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 23:09:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TII99PUT/5Kwfqsz5Gv2hzn/nxCUdTNhumhJ/f3jyncBwEqjaAM4iS5ndV5twUQOH9xdc6ROY7YfyEsvylRCrO5fo/j49NbShFmbMvvZW6MX3h9EYcjlo79SwFj9JBgtNlrGzTRkhzpBcvIRWBeCQxZVGiImX4RnpF0m+/VRZS1rHs2Ej+JOfhtyw0ShYaoGpoCbH+FY0gRa3/gviRLfXqeDIVeyBwTa39zct3g1GNwXnkn2rcVdoaHG1G2bBFUxSiBPPz0VYkGnJgCAn9iLxI4+66gkntNuy2Jr+WolZ5XYBX6DomX7kbaax43CCFpqEj0X0YOBaBSxwxe6bPLRmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=762YKs/htGmJdCwTO1c6g55bj+BhaYtJZlOyXs4cv4w=;
 b=Yt/WXfxdwEcBEB6PouC5poMOgb2aBJCDPCAS6I53ce66mBFbXivGH2KWx1JJzfIsqm59D4VTT5gZUPHcoDRH5WubwnT7oKDLUZBjC0QUg+E0TD029HOsHBI6LywkF4GeVUKzSqNbHF4qZvGksN2j7jTOFOr+sEfWYwzMqZidLPO2t9HV8xuiBNgvI9cIp28SGbY+4K+29cUQRbvae7se25ygSdeAiSVUiuJQQAao++51SAb56niAbcG7+osbD2IkD41rogP0qPNd9zoc8Sd8dnfVPKhfHXIYex0C8WXI1Go0/4xU7vA1QwwuNhfvGY1JWfWLGolMbxUOb5i06t3iew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by MN0PR11MB6302.namprd11.prod.outlook.com (2603:10b6:208:3c2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.52; Tue, 1 Apr
 2025 06:09:19 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%4]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 06:09:18 +0000
Message-ID: <1bd83249-b8aa-41a8-a978-cdf1fef86cc7@intel.com>
Date: Tue, 1 Apr 2025 11:39:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/12] drm/i915/display: Enable/disable casf
To: Nemesa Garg <nemesa.garg@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20250321160628.2663912-1-nemesa.garg@intel.com>
 <20250321160628.2663912-12-nemesa.garg@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250321160628.2663912-12-nemesa.garg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0177.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::9) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|MN0PR11MB6302:EE_
X-MS-Office365-Filtering-Correlation-Id: a167a11b-dcc4-45ba-b58b-08dd70e3bcf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZmhTSGJqYXQxWnZwQTVPU0RTQ1BhQXo2Qy8yVUkwR3hVc3FHQkNXRmREVnRI?=
 =?utf-8?B?eXpEVXU5SG5pbDBkcnpYTHpudm04R1BkT0kwQ0dxVGsySUZhQXRNeXBrc0hO?=
 =?utf-8?B?em9OR3pGL05sU2RYOEZlM0VOS1paMnNINmJZSVhKWmhKSTdLQ0hXNXlPblp6?=
 =?utf-8?B?aGN4Um5ZNFhuY21JaHBmNW0yL2RKOE5MWE5WdjJoQTZhYTlXdzgvZjBFSi9C?=
 =?utf-8?B?RVRCSDJwbG1nK3FqRkkyb3pjMCtHOEVWUCtVelFBT3R0VkxONDIrZ0w5NzhY?=
 =?utf-8?B?bHN3eWhHTEdBejQ4RmZWVmx2cTlmSTljS0hJd2swSlJDdk92ZkRTVHBJRTkz?=
 =?utf-8?B?aWh3aUZhaXZzUy9JUHBhRHNSTUZDWmZKcTAvdWlsVEliMjRsemgzeDArcS9T?=
 =?utf-8?B?ZTF3dDhUTlM4L1g1YTkzWE9SYWJVUksvLzVnRW5wNGlJUWEyUS9ra3VaZUth?=
 =?utf-8?B?T3ZzNWNFSGVGT0hZQ0RuZkkzUHFvRTFVSFJrbmplOXBjREcxZGhSaEQrQUky?=
 =?utf-8?B?NGxkeitpRUp4OHFWR1RXSDdHOXR1aTd3RHdhUEo1bXVwTXN1ZnhZbFJxQ3I4?=
 =?utf-8?B?QmhnSmhoR2N0S2U1S2ptWjVjSjN2R3kzaUVENFRvZm5iM3Q3S1NHQUx1eWtV?=
 =?utf-8?B?RDQvOW1mbUViM2FrSmNSVTZ4NnY3YVVhS25VeUlKcjBuOE1YUWtRR25kbTNL?=
 =?utf-8?B?aHRBNzh2RjN4T3hFYlNYeHlSZjdoREg0Qk5wcXpDRThwVzk4QXhudmdpVHIw?=
 =?utf-8?B?ak90dkJmb1pjUXZNTERsa242UnBxTFVsYWJCeFlaWm96OUZFSmRtWFFCUm56?=
 =?utf-8?B?WmFkNEFCZzhGbTYzSktUTG40VW80ZEhIdWY0VDBLdDRvVy9USXdkWGtZNUx4?=
 =?utf-8?B?N29TRExsNVJOMU5Ka0s5NnFjaERpV0hVcnlOZnhBUjZtQjNQZjE3Y25YUEVj?=
 =?utf-8?B?V2NvMUx1THYwUWMrTW1CUC9mOVhMSWttOTlMZWFrS01XVDBlVDJBM3NmZ3U1?=
 =?utf-8?B?RmFEZDNnUzIva3p1YUdJUHVJQk45V0ZuL2JZVnVIT3g4bWRERFBVVXpEcTlk?=
 =?utf-8?B?em1wOThheG1yM2pQWW1NUzdCWHBjNkl0dVVIc0pZR3Q1RCtZUG9QNzZxRWUv?=
 =?utf-8?B?YnNQNk1aZGFFL1h1ZkhLeTB4S3ZvNkNKc0VvMWc5cTVqVjlxOVpMWkYvcXda?=
 =?utf-8?B?ZHpXMHVaVUxzTTNMWnR6MzAyTlJEVE9CYTI4TWhDbjJIcURCcEo2cjdtblFS?=
 =?utf-8?B?cWlNMm1Ndml5SllsYkxmMzB6aHQ5MlFQeFBSSjNjOTg4b0hkZWFTYTF6KzE0?=
 =?utf-8?B?aUZBKzZ6SGtRbDZGTmJBbFV4YWpRT1A1NVpEVUxzSDNlZ1lBNk5SL1plOXRM?=
 =?utf-8?B?TC8zRFBxbzBCdlVva3oyYVZ2VGl4Y3dpOG5DU3FzU1JCRlpkdTkwL1p5YzFY?=
 =?utf-8?B?WlF6eVRYY1dFbHN1NzR0SlM2SWJaNzZFai9CUlhsYjZmU3ArYm42TlVpQ2V1?=
 =?utf-8?B?QngxaGExbUY2cGUzL2lEU2dFTmoycGp2cFBsZ0lNL1Z0ZVBYWllXYklYRmUx?=
 =?utf-8?B?R0lKaTFRcmpZbnFZTkVkQVpoSWxqc2QwaEhjU1pjTzJIWTdIOE5weXFRNUg1?=
 =?utf-8?B?a0ZiYmQzaXdYRy9Gd3lWYWo4UzhzUXhmeGNqUVRHRnRrc2k3OWF0c0FrbXYr?=
 =?utf-8?B?WmFqd0xWVzArN0tUaWhrajFVQndwNkNtMVFLSFN2RzJ4YUFsM3BucWdPUDdt?=
 =?utf-8?B?d2VwdGxJQ2t3eTZaeUdESXlFNHR3dk9GVy9qa09ZUkplSmN5SzBBOGN3MjVC?=
 =?utf-8?B?OUdLUEZwYVlDdk1IM2ZOSlZxRjRTZnFINzNJZlpkdjFuRnU0MVJUUlQ3Ujhz?=
 =?utf-8?Q?BMmnmmCOPlLkm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUo3VXVHMHI0SEhYRkgzN3JvWW15cmdoRG9LRUhCVE5yWWdmemg0TUZRSWk5?=
 =?utf-8?B?NDlGL2pTbTArdXE2VGo3eTA4ZzQ1TGdIb1gwU3E4ZytBdXdzSk5XNHBiKzJC?=
 =?utf-8?B?Z0lDakVKbjdCam9xWExHTjBNanh1cnRpOFFnWUZKV2tUOTN3b213eWRmcXht?=
 =?utf-8?B?L0hLV3B5YnI2Wml4T1I5Smt0MFFLbWRpZ3A0cjNlWi9VM3pRNXd5STNWaktt?=
 =?utf-8?B?RGxIaTZ2T0dtMnVqSkMxVDliN0NoN0NpenpuZ0ZtNC8vWGlVWFVHcmJwblR6?=
 =?utf-8?B?NHBWbW9iOVJuclpCc3hGRVVYMysvMUxOdmpsRU5UMUh4Q3lsckZRV0VQc3lQ?=
 =?utf-8?B?Z1c1dnRDOFBiSktsdS9ha1Viekx0a1pVOTV1OUxveVpVRk1vT1lkQjI0ZVpI?=
 =?utf-8?B?YlZTbVRpUnVLNFgrcGRwV0RXQWVTdXZDOXFmSDJqUUNPZEVUcWlVTGsrL09o?=
 =?utf-8?B?NkJ4VkVsOVF2U1dtTitrbEhqcVkvMmpramVpaGJRL1pKSU1CVkJVWTNiY25i?=
 =?utf-8?B?bE5IclJJL0hpaEg3WEZCNlI1b2VuUGNtRUJQUHM2c2RTbjFwZjZiSUpKYmI0?=
 =?utf-8?B?SXNHTStIRDlvY3MvbDdKNUM3SGJHeUxmQjZJWGlTeHpENFplU2lzOWEwaVVl?=
 =?utf-8?B?VEFiKzJ0WE5pOGl2dlZOV0hsMWk3WkFyMDM2Sng3Q2tMcjZhSG56M1FUdHpX?=
 =?utf-8?B?UG11cnlvN29lcUdkNGNVTG1FOXZBRnk2TXQrNDdHNldLb0doNk1VcXdTbHR4?=
 =?utf-8?B?M0dBUGxJbFptdVZ3TS9iNmh4WW9GWEFQYitVVEFFcUpNSkpuaXBmamxnbHVY?=
 =?utf-8?B?b0s4MElLeEc1OHBqY01LN1hEdUY5S1A0TldNdkVkZnlieTRYdVIwVUQ2bFNQ?=
 =?utf-8?B?SDlGc2lmcmdoS3FYQUdaNXgrRmtKSGlENytlRzJWU001eVhWMDNvUzRzSGk3?=
 =?utf-8?B?Wkg2SFZQVFM0bFlVZTdTMVRCWTBuL3UzVFVkVzVoZ2EyRmFZOXQwczRnNDFF?=
 =?utf-8?B?SU5LdmJ5ZmZvSGtDbUxJV2QxTHp3aGJwNXhZbld5amZBT1hIb3l3cWgyQkpm?=
 =?utf-8?B?cHUvMXh2MlZXSVFkWkFiNXd1Um9zTE9SdGRxdGdZSVZBdFVGSWJ5ZE1CWTUw?=
 =?utf-8?B?OGMzdjV0STdEYmw4bDhZT0p1VS9hWkdKM2Y4cTlSZUQ2c0VGUk4xTHMzelVz?=
 =?utf-8?B?NHFyeHQ4cThnRlhjTnVhMXN6RjJBV3BLUm1tWWVKWGpPdC82Rjg2VW1USCsr?=
 =?utf-8?B?MVFCajRMQjVXekZjcFFZNWVvd0VLOHNGWk1vSkx6R0RqODhIMWpCOFFVTGg5?=
 =?utf-8?B?QnhjQy90aUx0cTkxN2M4MFc5WVhqRU1oTWhkbUk0Y1I0VVB4d0Rxc2FrZVF3?=
 =?utf-8?B?amFDTzVsTTNXRDdSMFU3Nm5TbVhOWWRtV0g1K0hWSVN5NGd2WGVlNXdTK3Vn?=
 =?utf-8?B?RUozNERPVWFpSGErZ0lXakhmR1lRQSt3UTNqTlNLUzV6T0c0Zld0K21GdERB?=
 =?utf-8?B?Y1NUdUhVNHpGdDlIcjNKV1FUdm9kdkRjZW1DNGJ5cGE5d2huVlpncGZjTHJM?=
 =?utf-8?B?c2hFZmZwazROSUUybkd0T2EyNm5WaDlUVlZLbTBXQTVzdGxrNm5tM293dTRG?=
 =?utf-8?B?OHhDTllmZHh0alM4dWQ3NG1CaC96OHJjMzBQaS9HY1JuY0tqZkJqY0J2MG9Z?=
 =?utf-8?B?dnBWcy9DcS91MXcvNzdTMTB4WWFQWllyUU93K1ZEb21oeEtINFI5RXJlRmNs?=
 =?utf-8?B?Y0tSVFcvdCtvMndXc2VtTWY0VHZUVVZpZXUvK3QreWE3N2RFdWxoMU12K0Jo?=
 =?utf-8?B?TjNObTRZajF3L1lWclhLWjdVUmFKTHI4WHBzNHJRWmhoQ1NLdTdVRkllZHc5?=
 =?utf-8?B?VUFnSXN6WllXcU4yWDcycUx5MWJHMnhRa2kraWZWNUFHQmxvbDZMbWlPTjU4?=
 =?utf-8?B?UE0yOW0wSFRDTFpndWtCZUcwSFlxb09LNjRGcmlKOGVqT2prUW5xaUt6aHA3?=
 =?utf-8?B?UUJyTTE5Tmx0MUw0TmZxbFhXbEJpak11bENhMzhKdUJTamp5eFZGeURQeVJz?=
 =?utf-8?B?ck1qVFg5UkRyVE93a2xydWxybXZNNzBJVFdDYVBEUjlveWIxUE5BcjlXSkl1?=
 =?utf-8?B?VWVBbXVYREpPYmxxL2ZzTkZKSWJOeHZxWmQ1cC9lR3pDNUpSVDlRdnRxVm5s?=
 =?utf-8?B?RUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a167a11b-dcc4-45ba-b58b-08dd70e3bcf5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 06:09:18.7752 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lMHstbY5V/6ZDWFfr7xbXKEtV2isEoLCxdLYLb3nk59uZ2serR3bFGYrt3z2Y6mKATL8a8b+DFhjQhpi1SG5/Mdn7JZS5t+6x/+M9dqMIgs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6302
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


On 3/21/2025 9:36 PM, Nemesa Garg wrote:
> To enable or disable the sharpness check the
> casf_enable flag. While enabling the sharpness
> write the programmable coefficients, sharpness
> register bits and also enable the scaler.
> Load the filter lut value which needs to be done
> one time while enabling the sharpness.
>
> v2: Introduce casf_enable here[Ankit]
>
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   drivers/gpu/drm/i915/display/intel_casf.c    | 27 ++++++++++++++++++++
>   drivers/gpu/drm/i915/display/intel_casf.h    |  2 ++
>   drivers/gpu/drm/i915/display/intel_display.c | 27 ++++++++++++++++++++
>   3 files changed, 56 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
> index 367a73a91ae6..58fa57596457 100644
> --- a/drivers/gpu/drm/i915/display/intel_casf.c
> +++ b/drivers/gpu/drm/i915/display/intel_casf.c
> @@ -248,3 +248,30 @@ void intel_casf_scaler_compute_config(struct intel_crtc_state *crtc_state)
>   					      filter_coeff[i]);
>   	}
>   }
> +
> +void intel_casf_enable(struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
> +	u32 sharpness_ctl;
> +
> +	intel_filter_lut_load(crtc, crtc_state);
> +
> +	intel_casf_write_coeff(crtc_state);
> +
> +	sharpness_ctl = FILTER_EN | FILTER_STRENGTH(crtc_state->hw.casf_params.strength);
> +
> +	sharpness_ctl |= crtc_state->hw.casf_params.win_size;
> +
> +	intel_de_write(display, SHARPNESS_CTL(crtc->pipe), sharpness_ctl);
> +
> +	skl_scaler_setup_casf(crtc_state);
> +}
> +
> +void intel_casf_disable(const struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
> +
> +	intel_de_write(display, SHARPNESS_CTL(crtc->pipe), 0);
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_casf.h b/drivers/gpu/drm/i915/display/intel_casf.h
> index 026a2b8348df..301a9fbd930f 100644
> --- a/drivers/gpu/drm/i915/display/intel_casf.h
> +++ b/drivers/gpu/drm/i915/display/intel_casf.h
> @@ -18,5 +18,7 @@ void intel_filter_lut_load(struct intel_crtc *crtc,
>   			   const struct intel_crtc_state *crtc_state);
>   void intel_casf_scaler_compute_config(struct intel_crtc_state *crtc_state);
>   bool intel_casf_needs_scaler(const struct intel_crtc_state *crtc_state);
> +void intel_casf_enable(struct intel_crtc_state *crtc_state);
> +void intel_casf_disable(const struct intel_crtc_state *crtc_state);
>   
>   #endif /* __INTEL_CASF_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index d6691cb07173..cda8a4fed7bc 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -1036,6 +1036,25 @@ static bool audio_disabling(const struct intel_crtc_state *old_crtc_state,
>   		 memcmp(old_crtc_state->eld, new_crtc_state->eld, MAX_ELD_BYTES) != 0);
>   }
>   
> +static bool intel_casf_enabling(const struct intel_crtc_state *new_crtc_state,
> +				const struct intel_crtc_state *old_crtc_state)
> +{
> +	if (!new_crtc_state->hw.active)
> +		return false;
> +
> +	return is_enabling(hw.casf_params.casf_enable, old_crtc_state, new_crtc_state);
> +}
> +
> +static bool intel_casf_disabling(const struct intel_crtc_state *new_crtc_state,
> +				 const struct intel_crtc_state *old_crtc_state)
> +{
> +	if (!new_crtc_state->hw.active)
> +		return false;
> +
> +	return (old_crtc_state->hw.casf_params.casf_enable &&
> +		!new_crtc_state->hw.casf_params.casf_enable);
> +}
> +
>   #undef is_disabling
>   #undef is_enabling
>   
> @@ -1183,6 +1202,9 @@ static void intel_pre_plane_update(struct intel_atomic_state *state,
>   	if (audio_disabling(old_crtc_state, new_crtc_state))
>   		intel_encoders_audio_disable(state, crtc);
>   
> +	if (intel_casf_disabling(old_crtc_state, new_crtc_state))
> +		intel_casf_disable(new_crtc_state);
> +
>   	intel_drrs_deactivate(old_crtc_state);
>   
>   	intel_psr_pre_plane_update(state, crtc);
> @@ -6699,6 +6721,11 @@ static void intel_pre_update_crtc(struct intel_atomic_state *state,
>   			intel_vrr_set_transcoder_timings(new_crtc_state);
>   	}
>   
> +	if (intel_casf_enabling(new_crtc_state, old_crtc_state))
> +		intel_casf_enable(new_crtc_state);
> +	else if (new_crtc_state->hw.casf_params.strength != old_crtc_state->hw.casf_params.strength)
> +		intel_casf_update_strength(new_crtc_state);
> +
>   	intel_fbc_update(state, crtc);
>   
>   	drm_WARN_ON(display->drm, !intel_display_power_is_enabled(display, POWER_DOMAIN_DC_OFF));
