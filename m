Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EE3A5F7C6
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 15:20:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E4A10E8AC;
	Thu, 13 Mar 2025 14:20:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ODeHixNJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2085.outbound.protection.outlook.com [40.107.95.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F5DF10E8AC
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 14:20:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n6S6wffq57nStjsqh6wS7wJZ0Qaw8y7UmaW/TOZhDXSrTRzg/we9PfLw6CRajqtHzU+H/5L7w6Lu8eNvhxYw4yRg0TzBTxnYtIvZgaG3DJimPPPdGp9hG865rXgf1uI+YVFOP64hJRo2ucOvXEcfwotFgsfqYy40I/6Ran5BKhImAVwfEuPE0VgOnCbkZDGPEH3khUzP+rf8I9SBdMDqzSJIa1xPfyFgeLUbR1tR0eNLWrsgYbpR3eox4mjSmFgZxcktUkHO8jkqSmlFUEvqis4gZsVctr1lCt62cj3Ba5Pvzx3Gn+uPZWXi9JftcNUvWnof7lno5FNjzC4CabKmXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=geknnebyXJ8VSpqTITH9zaKgQYwtUwCPkAaFeH+uF9o=;
 b=QVzyYpfi/0QTwV+XU+n5eZkcM7Yy/O4rjWw/PkCjlDWQiPKX27I/kCVJkeCg6I9oIlsnt8V6INHEveTiRF40+9HAiEJpDk3hm1QP+hhONjtFSVh4s+Xjh7F/JqxqRQoOmX/8l7xMXbmnAjyAu04KvoCgqzHn3Z/Z/Zuo1wpAD0vc4gnwOhNArpGkR80zgbW1MJGvLjuFu8SmiXci43dF02rMOmf1Hm3ORDpEaUsyyM7nhNr9Zk6BolKroj5jAd/aYPTlSa9B+osby50ruwigra3vkqnu7y8Qfw4l8Vwe5H0mawmNsEsGtBQ5+QtHsZMpeZYGgLclQpyG07g8+MfsYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=geknnebyXJ8VSpqTITH9zaKgQYwtUwCPkAaFeH+uF9o=;
 b=ODeHixNJBh8EAdwZ3WwD5TAhvll0RFW9Z3UcXDMHRnLg/eVibqVwgsI6ESyiv9gNf8TeIKBoKXKGUQjnv6pN9d1B7WKKJRIIJQkTiwVRjWBvtLQqqj2UG+0wQjsiPmM9dvo7R2+9JuKnOHdLI9gGXD7+P/kYgd1VP0FLBNfCN1A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB7172.namprd12.prod.outlook.com (2603:10b6:930:5b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Thu, 13 Mar
 2025 14:20:44 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 14:20:44 +0000
Message-ID: <6a24d733-88ef-4cfb-8cc8-1c01fb64fc0f@amd.com>
Date: Thu, 13 Mar 2025 15:20:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm/tests: fix potential null pointer dereference in
 ttm_bo_unreserve_bulk()
To: Qasim Ijaz <qasdev00@gmail.com>, ray.huang@amd.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, thomas.hellstrom@linux.intel.com,
 Arunpravin.PaneerSelvam@amd.com, karolina.stolarek@intel.com,
 jeff.johnson@oss.qualcomm.com, bigeasy@linutronix.de
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250311190138.17276-1-qasdev00@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250311190138.17276-1-qasdev00@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0146.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB7172:EE_
X-MS-Office365-Filtering-Correlation-Id: 7670f1c4-d510-4570-5251-08dd623a3dbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|366016|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a0ZiemJOZzJWcld2TEJWaGJ3ZSs0ZFhxeWhZYk15ZjdVU3hlVWZITHZBZ0k0?=
 =?utf-8?B?bm1MdmFrRVFBbm81YUxaUVJLTkUvSkdXa3lxUWJwZGhVbkNSVjZSci9sYzJI?=
 =?utf-8?B?VHpOKzhtcjhYUnJsRGZWSmpQLzJXY2N5SDEzZ2ptc1N5Znp5MjYrUHc4dTlx?=
 =?utf-8?B?cVg5S2xwR2xyQnA1RUYxa3lHNXRTV25UdllvQTFKL3g3eE1SZkJ4dlBiaVIw?=
 =?utf-8?B?MDZQRXJSTVRKTWQ2M3JCTXErZlJSUEZhZlpLSDBJR2R3eEdHcHpCSDl0U3NT?=
 =?utf-8?B?azJSZWFGck0yUE43U3lxNHpkZXk1V2ZSN3hsNGt3cGZTdE9OeFMrbDFmMVVG?=
 =?utf-8?B?S2s1ZzFvUjVsb3FHTGdZUE1iREM1YmErSHI4QklXQkdhNkFJZFB4dzI0MkdQ?=
 =?utf-8?B?SWI5MkI2OGJtQ3pwM1VBcnF4eDZ4QjJvWFBmdmJyS1NlbVpJa2VWaUEyWUJX?=
 =?utf-8?B?WmZCQVdkN01vMGNtbFdoUm9RcCtHSW5nb1ZCMDZaV2o1MXI1eXBiWTY1THJV?=
 =?utf-8?B?am9OYTYvV2tJcnZWR2IzR1MwQzdNRGV2SDZnbDRUV0dUNytiUWxKNGZZWXpX?=
 =?utf-8?B?Sk5NL2JRZnBMcE9ZSC9oeEwzOFlyMWNSRjNwbTNTSDRRMUJhQXZzUWpUc3Rz?=
 =?utf-8?B?bVk1aDh1S2RZOXFwdVMxQXRkS0kwVE5zUjlWM1VzKy91WXg1d3lPcEVycGwy?=
 =?utf-8?B?dWhRSGtldHFzbnNnbzFGOU1uNlZkY1dPZ21XTCtTYTdrZjF3dE05UzVVNzQ4?=
 =?utf-8?B?YmNhQ0dHMVZseDh6K3ZWUklSdjJhZlYvSWc2ZVJsNUZiVDZGaDhPclNjdGt1?=
 =?utf-8?B?MHZjRVRoV2ZtSFhjSjNldkJScC9KV25Ba1pLNUJ2aXJiNDVZSXY4ZXA0Ujd0?=
 =?utf-8?B?eis0VFB2YWh4RWRoRklTUkE0ZVgybkpGZ09TaEl6eEtTZHJ6UU5XSzdyMlJw?=
 =?utf-8?B?cFU2c1EvZVg3YXV2N1kyQ2NSaEFvNnFqZnAvSGRSQ0MxN1QrSUM3bGdEUkc2?=
 =?utf-8?B?UzZxb2Z3dWlMaHRPZGRKL2hOem1QOGNKWXZKRStEczJRVHNjV2FkS01td3dV?=
 =?utf-8?B?aytzVzJ0RFRwWHp2YmdDV0NnTmxYUCtnRDZVTGJ5VjVPT1JtakZkdWw5SHFY?=
 =?utf-8?B?Vy9Ncm9zcjB5eEpRVis1QXdJaDh1d0JENFdwOWplSGlEaHNaeFdvTTFnY254?=
 =?utf-8?B?OHE5d0tuMk5Ea0JWZFY3OWxGMWZKWEQybDlXVkRJVytKdHdjL2gxa0pHa0Ex?=
 =?utf-8?B?WWFta0J6TmZZSWNvOXNvTEFnU3RzTXQ3ZWMvTDdiR0lydldDSzRTS1NnZXNI?=
 =?utf-8?B?bEVOUzFOVlRRUjFlZGN3ek80cjJPVlRSdStucUxUQldxdGdtSGExWG1LZFB2?=
 =?utf-8?B?eXRGRWxROGMxa1FKQW1QYi83L0NrWWpUMWVTa3QyTHlIQThqb25IMFkyd21m?=
 =?utf-8?B?U2l0dXRoVTdsQ1FxcWdaWnZ0WTZuTGJQSURqeHpUNE9wVXU4NW1DNW8wRzha?=
 =?utf-8?B?NFo5d3hBWGhDOC9UMTJOUEVmNkZEZFRQQjFlZEQxWllZanBsaWJPRlQzaTlY?=
 =?utf-8?B?blpwQ0NtNnRyblEvazBhR1I1UVM5WUladUtOWDBrYW9YenRmTTlHenk1ZWF6?=
 =?utf-8?B?RTdBSnVMT3JFY1RTUGx5WkNmeElyUUFWeTZUaHppdVVhTWZVUHhma2x5Njlt?=
 =?utf-8?B?RVpueHZmWVd2Ui9XemdrTEM2N1ZLVVV1alI5aE5lTEtqQVdHbnRBNkI1ZmlM?=
 =?utf-8?B?N2ZlaEY5OUNVR0hjUWZtVm1tZXl3N1JFWVNhODFwa09QT09JYkhKclNRUnY3?=
 =?utf-8?B?OTcrcjd2SElvVWY2Q0crSERJRlJXeHduUHFzSTNENUNsVEpVZUVkcjVtYmtJ?=
 =?utf-8?B?NTFSbnJWZ3N1aWtycGJ4TzZvN2t2ZERhT3FZTFcyY3lpUWRnTEt6N1BHSG1i?=
 =?utf-8?Q?OWmhEIuKPrM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SSsyODl4RzYzT3h5K1JJYzJ3UFFuR0ZWMFgvWEtaV1lENHYvUEtMVjRyK2wv?=
 =?utf-8?B?Rnp0eHROOHhTTFdrVzkxN1grQlFKU1JCT2N3YXhEMzJjL002RUc2ZjNPNXlS?=
 =?utf-8?B?UkliVm9zQXRRa3JQYWdBVWk5a2tUazN6SW0rUHdQb0VrSzAwNHNWNTNZaGZl?=
 =?utf-8?B?SXdvZ3Bxcjh4WjJpYmY5bzZ3a2FicmZVZ3BScEwzVFZUL2hqa0Fob1hXL2Rs?=
 =?utf-8?B?MmpNS2NMOUt0WWgrS05rRTBLMmExSnhNR3VSd3pLZEdJYTk5TGJ3dHlxSHJz?=
 =?utf-8?B?SDcvTUJTL2N0VnBzL3NxY1pBQU1SWUlucWttM2NoSXpCbXFCL0o2T3dBR0tI?=
 =?utf-8?B?eVhrdXNkdDIxdVFuZW5YM0IyV0VFbXZhQWZKY3dsemxSY1RFZ3lnQmhrYUxu?=
 =?utf-8?B?d3FLZSs3Q0pHbDduU1ZQSzlWaEF6SVptQnltVEorWnhVT09sSUNPclJBS2hp?=
 =?utf-8?B?ZElWU2tvWkFEeDN0WUlxZld3Y2orNXBNb2J5L0FlOUhodm83c2pNUEE2ZTRH?=
 =?utf-8?B?ZWhiSmlvR3p4T0lSUVJyU1BjTUgwRGpMTnRXOFB2MllzTERRQW12alZmVys4?=
 =?utf-8?B?RjhvZHI3VldnLzNqZk1BVU92QTZnYWhVUGljRStLU29TT1ZrVklOQThzNVlT?=
 =?utf-8?B?UXQ0S2FoTkhtOXhFTlh2K3lEMUlYRTN5ZHl2bytoUzF2ZGxBOE1aTFl2dDR1?=
 =?utf-8?B?c0NpcDkxMERXL0Q1SWNzQlJTa0tzU0JtcTY4YVUyV2hONmN0a3JONHByL29E?=
 =?utf-8?B?L045Z2RtYnFIR2ZCVkkvOS9GN25FTGFsMDVOSmJmQnprWlVUQThRZm5iVjln?=
 =?utf-8?B?WEJkL2dMMmpBYTRjaERzNUZMQ211Wm5UeU9sNmMyanBFVFYvMFNQUUZ1R3lY?=
 =?utf-8?B?SW1DQURHUzkxT1k0Qm56NCtoSjZTaklUSXNRWHZLUXp2akFqaEJ0Vm45aEtC?=
 =?utf-8?B?eUQ1V3RWZ3JET0N1OXBVaXl6Vm1IcklNSGY3YWJIdjNoNCtOSVlGRjhtY0pZ?=
 =?utf-8?B?eFZBcUc0b3BVUjUwTHQ2eDExWThOTGNvbUd0YUtkT3pmYlphVm1GYk9IdGFE?=
 =?utf-8?B?NlQ1QW5MSTdhSlcySWRYUlpyb1N0b0pnU3hjL0lOM0d4bFB0bnNFSGM5clNz?=
 =?utf-8?B?TzRpUWRRVHpNenZGa2RBYkx4MG1YcUpkNFVFeElrbThGVmRDZ2xIZ1EzSTBa?=
 =?utf-8?B?RWphT2F4UnplZVZCcEhzT2RuNXRNekJvd21yWmcrRjFuSzJTUTQ0OFYxc3Zq?=
 =?utf-8?B?a1YyUFdKbTNkd1NIWTRNd3Y2Mjg4UDZOeUFBRnhqdTE1dDRBQkNmaDhOWUp4?=
 =?utf-8?B?RFV1eXhpTVN4aHhWWjkxYTdFNG5hUS9QODZ3N3IwMmZZdUxHaGJNOWEzTi9G?=
 =?utf-8?B?Sm5jaW16OVNKZlRPZ05JQWZvWUFhcGkvcDhRZUtGcitSdFo3ZFk0Y28wWWFy?=
 =?utf-8?B?bDkwUElOWnV5bWk1bjEzNmxjcHhVUzQ0SWo1cW5sY3U5czBwWkNZVXlsdE5X?=
 =?utf-8?B?NWczODBQV3RzVWVhYmRzZS95aThzOWY3VDlUWjJsRjVsTENXZ0lhTzE5NWlJ?=
 =?utf-8?B?V0VxNk1adzJlQW9qR0FhOWxGOS8vaU9rOFZtYXlaeUdpeUZ3TGRJY3dRK0V5?=
 =?utf-8?B?L3FXaFVUVUd3TFFoYXBPTU9XTCtYVngwRXZaRFFoY0ozaHlidGFDeWZPc3pn?=
 =?utf-8?B?aGF5eWJ3dTlzWmZBSGFScXJqUkpHUW5oUnJJdWF2STNvTjRCYmRLMVhZR2k0?=
 =?utf-8?B?d0NZc0IwTzJ3emRXc1JPWVAxbDFnaUJrbktUa2VjN3hvaER6U1VnY1NvcEhW?=
 =?utf-8?B?YTNpSVZLazg2bDNqYm9ENzY4ZnQ2Y2xIUU8rcVJXNXZ5dkNTQTBTcm5VSU9I?=
 =?utf-8?B?Q2w1RXQ5UUNlOGJhVG4xakVJaGFMY0FQMGZhVTlkekwzSDFOdVlIU01xdnpu?=
 =?utf-8?B?bnppTURQVzdzdVp3aEEwa3ZseDJGNnZpNU1XYkRzaWV2c0RvNkx6SnVxNWFK?=
 =?utf-8?B?SXQ0MUczcUM3R1YxZk9leFJ2cUdNSHRyWExIN3IzNlBnRzZtQkljUGRsWG41?=
 =?utf-8?B?clVYYk10bmJuY1o5WVpvRzcyRVdnL3ZlYklDNGVYaTFSM0lsdm5UVnNINU9k?=
 =?utf-8?Q?ekC1lQXhqQIpxGcGjnPtV/yIM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7670f1c4-d510-4570-5251-08dd623a3dbf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 14:20:44.2820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m5yUiBDfYQ/69Lxg1fuQwG/91HWWAqCmn1zer1blVm/o+n1wExabpiXEwQ28Qk3r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7172
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

Am 11.03.25 um 20:01 schrieb Qasim Ijaz:
> In the ttm_bo_unreserve_bulk() test function, resv is allocated 
> using kunit_kzalloc(), but the subsequent assertion mistakenly 
> verifies the ttm_dev pointer instead of checking the resv pointer. 
> This mistake means that if allocation for resv fails, the error will 
> go undetected, resv will be NULL and a call to dma_resv_init(resv) 

The description here is correct, but the subject line is a bit misleading.

Please use something like this instead "drm/ttm/tests: incorrect assert in ttm_bo_unreserve_bulk()".

> will dereference a NULL pointer. 

That irrelevant, an allocation failure will result in a NULL pointer deref anyway. This is just an unit test.

>
> Fix the assertion to properly verify the resv pointer.
>
> Fixes: 588c4c8d58c4 ("drm/ttm/tests: Fix a warning in ttm_bo_unreserve_bulk")
> Cc: stable@vger.kernel.org

Please drop those tags. This is just an unit test, not relevant for stability and therefore shouldn't be backported.

Regards,
Christian.

> Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
> ---
>  drivers/gpu/drm/ttm/tests/ttm_bo_test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> index f8f20d2f6174..e08e5a138420 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> @@ -340,7 +340,7 @@ static void ttm_bo_unreserve_bulk(struct kunit *test)
>  	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
>  
>  	resv = kunit_kzalloc(test, sizeof(*resv), GFP_KERNEL);
> -	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
> +	KUNIT_ASSERT_NOT_NULL(test, resv);
>  
>  	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
>  	KUNIT_ASSERT_EQ(test, err, 0);

