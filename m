Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 830759C6B1D
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 10:02:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F56510E36F;
	Wed, 13 Nov 2024 09:02:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="A0kAiLrf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2070.outbound.protection.outlook.com [40.107.93.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D241710E36F;
 Wed, 13 Nov 2024 09:02:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vy69GutT25Pxq7ZIxOKpqa5yTpRz3f7z9j4cnbPhaisowOuYodHUYSgbxuqVQcMxxfdtMxih3TU4Hf0KXIDxLEkxqqpk0MLJEa1EzODXo/aZLlpyAMXbaOJopiw7QXT7HwgjQe33+ntIl1Xim0NvmjTtMulkVelklfsAtdvwVnSkqcA48yQk3jlWnhaYZOUdIvL1UAHiEVTOZXsnT7RdsJD71TVp7MP3aAIyk13fwoqk4WhEtQhr2taAGAdGF756oLxxDwdaWICjn2LoffVtmMnpQih9pATcXTd/8a1c7p8yYOEuZdn3KjX8GgJ5Sbowg0AnB0Urq4u8IIqNh+gyxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ddu/CDv+mlV1cvLbThURmt2M0V3DnesbAxCa+6p8wL0=;
 b=GrzdTIFh9vt/vc+RFljDorxM9ekAO2xCN3DrimMezBoU0V7mdaiml2yNgIN1hb5a0H8Ar9jDttP1SgJ2iNzCHRwytwecrIyWf9yTGVmpyX1SdVDRSwi5qW4ldiWyMZuiSiU8hixPBuUum1pdrbNcHvLCJyq7MLYFtSyXGjPYRqQw6cY4vnD6WQPeYuV8Qc182qDvg99HmGikgbpGZiegPX5OGFcg/f64wNSZ3GVhk7V/b3Mue7ISQ7jYn9PRp4cf4wH9u15EWsFsfMqBtymJI2RCwh98dHxeIGUOdtnEf8dYCwkfB0Vhy48K5tn5K4EEoOOJgg7Fg/lV3cqKEYuFZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ddu/CDv+mlV1cvLbThURmt2M0V3DnesbAxCa+6p8wL0=;
 b=A0kAiLrf1osPAtgBecMQn9MS3TtRBushLSujLIvaQZpP/gIoGp3qnBHPCJt2gdpn5p7w6tl+4sZI+iwlUYZJil9QbIumKauyEwRz3F9UfrZfJmt6LeQafhHPTVwGOYCjnEgalChsl7sN0SY03UNWvaUMhPkaxWJtTpp/8YuaaHg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB6483.namprd12.prod.outlook.com (2603:10b6:208:3a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Wed, 13 Nov
 2024 09:02:19 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8137.027; Wed, 13 Nov 2024
 09:02:18 +0000
Content-Type: multipart/alternative;
 boundary="------------Xi8FReqaDhFydcjBH2EKw0Bg"
Message-ID: <ac5b9c6e-027a-40e2-bdab-2cc5e10067d6@amd.com>
Date: Wed, 13 Nov 2024 10:02:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/6] Common preempt fences and semantics
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 simona.vetter@ffwll.ch, thomas.hellstrom@linux.intel.com,
 pstanner@redhat.com, boris.brezillon@collabora.com, airlied@gmail.com,
 ltuikov89@gmail.com, dakr@kernel.org, mihail.atanassov@arm.com,
 steven.price@arm.com, shashank.sharma@amd.com
References: <20241109172942.482630-1-matthew.brost@intel.com>
 <2d634baa-89cc-4b83-a4c4-4d2ca6a4f2b7@amd.com>
 <ZzLLq3IKLnOGSea/@lstrano-desk.jf.intel.com>
 <0dcd54bc-a1e0-41cc-915f-917f1dbf5729@amd.com>
 <ZzQOkyyQeZ3SkcHd@lstrano-desk.jf.intel.com>
 <ZzQPYocTEvnJVgQ1@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZzQPYocTEvnJVgQ1@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: FR4P281CA0136.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB6483:EE_
X-MS-Office365-Filtering-Correlation-Id: 901842c3-f5d6-44f5-86fc-08dd03c1e098
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NnkyNVQ2RElObkQyN05QU2pWR29zSkt0VkRqbVZBQTR3YndxajAwTTgydVJM?=
 =?utf-8?B?WnNiTTAwWEs1RjM5MHNjTU5kSG10N3FsZlczek4yaE1xeWpIQnBhNlBoVTNh?=
 =?utf-8?B?RXcrTDhzVmxsalNSS05lVllPVmtSTGZDWHMxdEk3dFBHYk05Nm5CV3U0MXg3?=
 =?utf-8?B?aDBUaXNFUFhRU2FpUGU4MFpndlhHZ3lJd2RzK3d2V3FlZGhtanV6czVDMmRY?=
 =?utf-8?B?Y0MycHFSdWlTUEU0Sm5XV0pBQTdMN0hQZjBZTFVuZWlzcEM0MGwwbUZFamlK?=
 =?utf-8?B?MUNuMWZibmJyUTVuSVA0WkcySkdCUVlCd1Rsd2dpUGdJMEgxRmVVS2pIZldW?=
 =?utf-8?B?OERGTjBMVU8yR3U3RW05ZXpFNnQ5RFo5YkVUTWdWWHlwUE9LV2d3TE1iVi9u?=
 =?utf-8?B?dGhobHlhR1l5Yjk4OUJ1TDFnVXgvSzdWakgrOGovc0RoSkVFQlBFek5xZUp6?=
 =?utf-8?B?NUJFbmlSME5RMUlUY2pydWEzdTZFckFveFV0MzQzcG5NRjBMa3pVdWpuZ0xF?=
 =?utf-8?B?bTdyZ0NhOXBzbFltMzNHd0o2OUk5cjFYaG9COXVLMXRnbjVwRVQvc0F0cXhv?=
 =?utf-8?B?bENtdFlIS096a1dCNllXVzZTNzRKdVZ6SHpHQng0Q25IaW5QRVVjdFU1TWpm?=
 =?utf-8?B?NHRyeHU5MlgzMmxjMEUyWU1xZlVFaUZOTlNFT2V1MTc0N28xa0Z6ME11ZGxr?=
 =?utf-8?B?elpnNklVR3F0czVQMzBhdkVJWmRjM0tiUFVNNlFFYktpVVkvYlRSOHRVazRS?=
 =?utf-8?B?TmZTKzl2YUNOTjJ5cEw1eEE2V0lyUzd1YTRzUEI0ZW1IYmFvQm5UZUx5ZEIy?=
 =?utf-8?B?SnVtd0ZSL1kwVzJiVVVHeHJYR1VvZkNCYWdMODVkQUFKQnMvaEdlMi9yZ2Va?=
 =?utf-8?B?c2NUbk5TMDVPaWw0SjFFamgxaFlFMGNZb1dwRHdRc3p5cWxpMWQ0MXh5NGp6?=
 =?utf-8?B?bytsS3IrcW53TG14U0xWcEZXbzI1L0w2bEQ0UWM1YTBaT3Q4SzRDajB2VXQr?=
 =?utf-8?B?SXB2cE4zbnJWcnhnbWk0Q2xsNS84V21HQUJicFZPd0R2NlZzNmhMaXBzMkU0?=
 =?utf-8?B?UDJ6S1BBSEs0WGVGVSt1RjBnbkZxTGozNnoydHF4Zm1qcnRpUDdaMWJrb1p1?=
 =?utf-8?B?RG5iQ0lFaElUWWRUUlBzbHRaMXB5QVNQSk9pd25EL0RVVUhQZFUxeTlnLzlo?=
 =?utf-8?B?NkhZTVNMNjF1YnRpNm1DUU9ibkhHOFM0ZVltZWp1eFY2UjY4cTF6RVZpMjRF?=
 =?utf-8?B?cVNoeVNRSVpJVHZZazVybmw4VnJYblI4T1FWTlFsUmowYTI2YlpkTk90YjBt?=
 =?utf-8?B?bUlKR3dlZ25FZXRWTmIwSzZXMWlsVFNCQlJnL295WmxUc1A2dndtLy9JUG9y?=
 =?utf-8?B?SFZWNnlpcEVYMFBGaS96OEowVjlMZDVFQ0oweXA5MXRWaWFFZVRyRTRkMnd2?=
 =?utf-8?B?V3MrUXZoNlAwSjU5dlJOUG05RnJpSWcwSnBsb0p5bDhObTZtdjUrVnpleldj?=
 =?utf-8?B?eUpRSkpBQ25sN29ZYXgrRXkrK0Nyb0JPOGJHYW1JWXBDNkUxUXNaSE9DUGRr?=
 =?utf-8?B?Z1BBZURYS3FiWm13VkJMZituNkFvR2sxTFBhVGtKMkpsNHVtLzFSbkVMV2s0?=
 =?utf-8?B?ZmFMaGtybnVaYjIzaHlBM3VnOHdnZ3dSSUpPOE1HT0tjNGk4djJkcGdNSHJv?=
 =?utf-8?B?dUx1d2ExSnhrQllqTGRqek9SMXVUQWxmY2tnaW9PbWpMSU4yQWNtMDRaMVg5?=
 =?utf-8?Q?HqVbwkMro6PXFsGg+kKmm+ferrRg08/dczzOP73?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjVDaWVJVjB1ZXZDd3ZEWCtmeC9UMVhkdm1tdEhqYmFKRWdZR2tPNy9CQUNH?=
 =?utf-8?B?cFpZOU5Ga3dtd2g4aUtqeTRRY25zZnlMeE8xaWEveG9TZ0hON3l2UTlUYzNl?=
 =?utf-8?B?UXpzTGZOaUdZTlArcUJEemFNU3lvRloreUZBdDFuRGwzQ3Y1SkFHc0dZckJG?=
 =?utf-8?B?allJcnlBSTdXWVhYTjZxckxrTEFPRjFZZGhKamMxMU9lbTNGQkVQTHBBcEh4?=
 =?utf-8?B?UWJlUnpJMVFMOHVmWGpHT1oyRW1QSVpzVmloTVRaWjkrUmE3dE0vbmtUUktO?=
 =?utf-8?B?c0tyU3lqLzdyZHlidUFGR1ArMzNZbnk3UmdnOTZwNHArZktuNHhodk1FZjNi?=
 =?utf-8?B?dGlaS3NTOXV4dFBDNUlwVkZkeDVSQkVCYVZJSGNzQzZLYjg3eGFCSGxkS25k?=
 =?utf-8?B?ZGJTZjdtaC9wNXd1aGpIMXZydkhXZWpIVFdsaG5uMTRDMmltcERSS2liV0N2?=
 =?utf-8?B?L3NFalBSSTc5RVM5aERHdzBLRy9BQjAwbWlId0xWZ29CaFhVWnZ2d3lNcUNj?=
 =?utf-8?B?UnIxbXh5TGRkbkFqU3pnZ1BUc0U3cnd3VEJsOHhrQ2lBYkd2bEpOL01xbWJq?=
 =?utf-8?B?ckx1Y081MjMxSnFBMXhrRVFlOVJoSlA0ck45STdDQkVTN0t0OExlRWhEVkNF?=
 =?utf-8?B?aGJCZ25yV2Y3NXBGN09tUmliS29Jb3hQQ05LUENzSXRtaFhicFV2VUtKVUxh?=
 =?utf-8?B?ajcreldYcTNvUE1MZVJpRGdmdXhqM1U2bDNGdXhHOEtzL0wzd3dheUJnUjVK?=
 =?utf-8?B?S0E0bEhxU3ZLMGF5ZkNTWDAvWkd5SVo0Nk1kd3B3ZUNPeUVwYmpUdm5NY0NY?=
 =?utf-8?B?VkhWakhWUTZRL0xmbjlxd3gvQlNnN3E2WWdYcGlLOHVIbGVrS1FMMWFqUTI4?=
 =?utf-8?B?OGlVV080MDk3T3R6WlRac2YxbDlVam4vY2ZJZDRWdGdLOGZMb1BoaTFHVDVr?=
 =?utf-8?B?Z0g2VUg2K2YwREx1NENycUZ2M1RDa3JXN0s0R2pwUWpLYVpGRHRiMXdKSkV3?=
 =?utf-8?B?ZG5HQjJaeTJTbTJTTVY0WDh2WE9YQXVSckorVWxXSmZERnJ1bjArRW95WXJr?=
 =?utf-8?B?QXhqZ0ltZTVkRlhOc1lrR2ZRdTBtcFpxbEF5SXJZWEFxQXE5Y0xTL25VTkd5?=
 =?utf-8?B?NTkwbnBFUFVpZGVQU3NGVUFTYmRqZWZNZEtMVVRTN2JqVUJQVzB5emdVY3Mx?=
 =?utf-8?B?UURTbEVaOFhtTU4wWnAvWWFPd25NYmJlVGN5SVlIYWt4WDdxSVhaTUNobW5Z?=
 =?utf-8?B?NC9na1BZTFJsQi9rOVVXQjZuUEVXalpKbk5oNElyVjZ6SHhSU2VUdVc1UkJx?=
 =?utf-8?B?VWZzYTNGR2ViSTZUQUNUVDNUWHNOZnIyaFpOUjdNQ0tvbElKUWk3NWc4cTdU?=
 =?utf-8?B?bGdFS2QvT1h1eHUvRlBTTmdpWFNEc295Z2xDY2t1UXBpN1VZdElqVTlubHVP?=
 =?utf-8?B?YVREWWJSWThCV3VIdmQ4eWR1ZjVEYWtmZjQ2OStkTndLMHErL2lnNmNPdmlF?=
 =?utf-8?B?cU5aM0R6ZkZrMGhCMWVIYjNQcWJieE16WlZWUDFNajMvaHhXWkpjbktySkNu?=
 =?utf-8?B?SkhmdmlzcmkrMFp0aHpRUUEwbHhhcHN3QVNPY1hhaWJyMXNZRWtiQTRiSWVv?=
 =?utf-8?B?elZBTTc4dXBEb0JNL1ZBUVdOdTZOaUNyeXJKNEZ3QWN6NGc1L05XTWxZT2wz?=
 =?utf-8?B?Wm9LbTZhdkNRVlZJQlJMSHNvcVg1bXdaVVBIUzlWK0JwR3p4V2hyQXNlcWty?=
 =?utf-8?B?OUpnNjl4OVVMc0lwTUU5OWdSaTZDd3FZeUU2MTdRVndiaUlteS9EdGYrRDFt?=
 =?utf-8?B?V1RkK3dKTU1tR1NoUi9qVEdiZVVxZnlUQkVEdFdlZUVGdGtQUHhCbGJLMDl1?=
 =?utf-8?B?TlpnbHdZQ1ViU3QzaXJUalVNNWR6QzFMdEJpRktseEZUQ2hvMFRBb1VidTVj?=
 =?utf-8?B?aVVEOVZBU25vYjhwT2tXazV4Y3F1eGJVTERRUzZRdjFwNUUvNTZsZUhmaUJT?=
 =?utf-8?B?Z3N1S3pmNWxYK1dhOGhCWkVJWWZkblpmMkM3a2cyRENuVm5DU2NSM0NvSHMw?=
 =?utf-8?B?U29WeHFmcUIxRFR3aVZRWkdNcGVrNlRuVmlBU3JmK3VBSndmK3A2eVRzQVls?=
 =?utf-8?Q?R3VH8w/KlOruhw3wBM4h4jKlR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 901842c3-f5d6-44f5-86fc-08dd03c1e098
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 09:02:18.9186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HPBkK70NgK3kRjHZpVSOg7A0eJ52Gs+O0FGztSQDBeaHdcJF7UoOM+1IMILDkuWo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6483
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

--------------Xi8FReqaDhFydcjBH2EKw0Bg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 13.11.24 um 03:30 schrieb Matthew Brost:
> [SNIP]
>>>> If you're using gpuvm, just call drm_gpuvm_resv_add_fence. I assume AMD has a
>>>> similarly simple call.
>>> Nope, we try to avoid locking all BOs in the VM as hard as we can.
>>>
>> Why? Calling in to perform fence conversion shouldn't be all that
>> frequent and simplifies things.
>>
>> Also, it's likely that only a few locks are involved, as not too many
>> external BOs are mapped within a VM (i.e., most BOs share the VM's
>> dma-resv lock).

The most common use case are multi GPU systems which share a lot of data 
in a NUMA cluster.

This configuration has almost all BOs shared between GPUs making locking 
the whole VM a task with massive overhead which should be avoided as 
much as possible.

>>>> Now the ordering works inherently in dma-resv and the scheduler. e.g. No
>>>> need to track the last completion fences explictly in preempt fences.
>>> I really don't think that this is a good approach. Explicitly keeping the
>>> last completion fence in the pre-emption fence is basically a must have as
>>> far as I can see.
>>>
>>> The approach you take here looks like a really ugly hack to me.
>>>
>> Well, I have to disagree; it seems like a pretty solid, common design.

What you basically do is to move the responsibility to signal fences in 
the right order from the provider of the fences to the consumer of it.

Since we have tons of consumers of that stuff this is not even remotely 
a defensive design.

>>
>> Anyway, I think I have this more or less working. I want to run this by
>> the Mesa team a bit to ensure I haven't missed anything, and will likely
>> post something shortly after.
>>
>> We can discuss this more after I post and perhaps solicit other
>> opinions, weighing the pros and cons of the approaches here. I do think
>> they function roughly the same, so something commonly agreed upon would
>> be good. Sharing a bit of code, if possible, is always a plus too.

Well to make it clear that will never ever get a green light from my 
side as DMA-buf maintainer. What you suggest here is extremely fragile.

Why not simply wait for the pending completion fences as dependency for 
signaling preemption fences?

That should work for all drivers and is trivial to implement as far as I 
can see.

Regards,
Christian.

>>
>> Matt
>>
>>> Regards,
>>> Christian.
>>>
--------------Xi8FReqaDhFydcjBH2EKw0Bg
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 13.11.24 um 03:30 schrieb Matthew Brost:<br>
    <blockquote type="cite" cite="mid:ZzQPYocTEvnJVgQ1@lstrano-desk.jf.intel.com">[SNIP]<span style="white-space: pre-wrap">
</span>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap=""></pre>
          <span style="white-space: pre-wrap">
</span></blockquote>
      </blockquote>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">If you're using gpuvm, just call drm_gpuvm_resv_add_fence. I assume AMD has a
similarly simple call.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Nope, we try to avoid locking all BOs in the VM as hard as we can.

</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Why? Calling in to perform fence conversion shouldn't be all that
frequent and simplifies things.

Also, it's likely that only a few locks are involved, as not too many
external BOs are mapped within a VM (i.e., most BOs share the VM's
dma-resv lock).</pre>
      </blockquote>
    </blockquote>
    <br>
    The most common use case are multi GPU systems which share a lot of
    data in a NUMA cluster.<br>
    <br>
    This configuration has almost all BOs shared between GPUs making
    locking the whole VM a task with massive overhead which should be
    avoided as much as possible.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:ZzQPYocTEvnJVgQ1@lstrano-desk.jf.intel.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Now the ordering works inherently in dma-resv and the scheduler. e.g. No
need to track the last completion fences explictly in preempt fences.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
I really don't think that this is a good approach. Explicitly keeping the
last completion fence in the pre-emption fence is basically a must have as
far as I can see.

The approach you take here looks like a really ugly hack to me.

</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Well, I have to disagree; it seems like a pretty solid, common design.</pre>
      </blockquote>
    </blockquote>
    <br>
    What you basically do is to move the responsibility to signal fences
    in the right order from the provider of the fences to the consumer
    of it.<br>
    <br>
    Since we have tons of consumers of that stuff this is not even
    remotely a defensive design.<br>
    <br>
    <blockquote type="cite" cite="mid:ZzQPYocTEvnJVgQ1@lstrano-desk.jf.intel.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">

Anyway, I think I have this more or less working. I want to run this by
the Mesa team a bit to ensure I haven't missed anything, and will likely
post something shortly after. 

We can discuss this more after I post and perhaps solicit other
opinions, weighing the pros and cons of the approaches here. I do think
they function roughly the same, so something commonly agreed upon would
be good. Sharing a bit of code, if possible, is always a plus too.</pre>
      </blockquote>
    </blockquote>
    <br>
    Well to make it clear that will never ever get a green light from my
    side as DMA-buf maintainer. What you suggest here is extremely
    fragile.<br>
    <br>
    Why not simply wait for the pending completion fences as dependency
    for signaling preemption fences?<br>
    <br>
    That should work for all drivers and is trivial to implement as far
    as I can see.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:ZzQPYocTEvnJVgQ1@lstrano-desk.jf.intel.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">

Matt

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Regards,
Christian.

</pre>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------Xi8FReqaDhFydcjBH2EKw0Bg--
