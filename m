Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E409D5D45
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 11:29:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F66810EB43;
	Fri, 22 Nov 2024 10:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3biTmaxy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2044.outbound.protection.outlook.com [40.107.93.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6648A10EB43;
 Fri, 22 Nov 2024 10:29:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HRXFYuQMASvp7iiiY1wNMRu8uoTJtEPtrKP3uVmP1n/vjamHaQ9zzDdj3UrAxVsgUVOIQeSAOGKeSUdl7o2HYNjkb7kZydCa8dmD7BSccrBuFbGEJ1D+PJkqqzLGC5bKXyP0/7kgNTZ4bCBlWzcb47WZyrMw7/KHRUg9mMgaoqsTnVzlvn3LMvQ5mRadM9Y87j2xf5aq/7TSvl4qx34OsU4eRnPOViC2OabmJdMfFvuZsqSKQDEdcebT6uftCN+Zi68NEPlBc5jOnUTHSJLfja7vym4R0/fTpI0+785eY09hz77nmkY8bj6iPedArtWRazIlUdJb0hAYTS8CdAR77Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=df7JC0n0YfQYGDqrma08MQz0gbyRAL0KY0H3tGcDMO8=;
 b=jHP2xtcfImHEDwUMY2PtWXxxkxFmEF9O3WcoMCWMdo8nNQ6dYRrDrL6Mv73f8F1z0kDKM2A1eRsPLuRkIdYJd+qDOoEg0xetRspn9bVFVKwcx/uSE6Q2/I3WJQNveujVIB4Ws//eitq63QvHSpaux1duhRJfrZhvLg7gYwYA7CkbghJZEEEeGwsUIRe13TTAmZH7rVmpfmeMTkPtFIy74iZB3pxrXO1s4Q+IM1DP4HId3DqhnY7scYGIxR3yks15TXgpYdoloQFEpuQ2EYeHrRd/N6scC2Xb4B9jQrlX21IrGgivAIAGg0gqDXI6kZG2qM3SGgPiiIlzScZXJfxrHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=df7JC0n0YfQYGDqrma08MQz0gbyRAL0KY0H3tGcDMO8=;
 b=3biTmaxyO8qle/mD+5ccSAMOfZjmPNKq54uDFytoTf9WO6quq2SHPpvQC8/+/y49VhPs3VLOtnDcupq43IJQMrXDUDtDE42RWgw2ri30DHAaLLpc0YX9fpT4x85RvzjHpTpKwfU97jMPhnzpIc0x55x+8q5QJB8o/KFo2zHs1CA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN6PR12MB8541.namprd12.prod.outlook.com (2603:10b6:208:47a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Fri, 22 Nov
 2024 10:29:05 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8158.019; Fri, 22 Nov 2024
 10:29:05 +0000
Content-Type: multipart/alternative;
 boundary="------------hEoeDbVYOvZuuvolV9zuEaZw"
Message-ID: <42e5ad2f-b4d0-4d48-888c-2dd398044f62@amd.com>
Date: Fri, 22 Nov 2024 11:28:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 02/29] dma-fence: Add dma_fence_user_fence
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kenneth.w.graunke@intel.com, lionel.g.landwerlin@intel.com,
 jose.souza@intel.com, simona.vetter@ffwll.ch,
 thomas.hellstrom@linux.intel.com, boris.brezillon@collabora.com,
 airlied@gmail.com, mihail.atanassov@arm.com, steven.price@arm.com,
 shashank.sharma@amd.com
References: <20241118233757.2374041-1-matthew.brost@intel.com>
 <20241118233757.2374041-3-matthew.brost@intel.com>
 <f802caa1-85a7-4a5f-ae92-9b1c0f4c500e@amd.com>
 <Zz5nrl3H2wAagwgE@lstrano-desk.jf.intel.com>
 <01678a48-828a-400f-b989-51c497845340@amd.com>
 <Zz/t5pp9rCg9b7lw@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <Zz/t5pp9rCg9b7lw@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: FR4P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN6PR12MB8541:EE_
X-MS-Office365-Filtering-Correlation-Id: d0baf5e0-da8d-40d2-757f-08dd0ae07da4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bTJPVWd5SDRIL3MwNVVxdFZ3Kzdib0RXNWJhUEIyRktmSW1VclBpYjRFOUE1?=
 =?utf-8?B?cWVUaHR4TDVVdkUzTzJPb2RrbUdBc3ZUd1FHYWNBbGRXZGx1ektvNDloLzNM?=
 =?utf-8?B?VUR5dHFORXl3MmZRUlFidEo2ZG9ScWNOM3ZXL05XN1doMFZHMWFZMlpGNTEv?=
 =?utf-8?B?V1NXNEFuT0duay9kdlkrVWl4TXdMUktJT3VZU09TblJlRWFNblpIaUtXMmpX?=
 =?utf-8?B?NkZQdWhPTE5UUXRsR0lwZUNNak54TTBwOEFmTW0wVVpEQzBLekZTYVNwUUpx?=
 =?utf-8?B?QWhPK2dZREtuN20zeXF1TnpFUktlbGtnRFNNTWdrYW5GbFNyMFRlUjVuSzBN?=
 =?utf-8?B?VzlzU3czbDY1RlB5SFhsL29kN0Y2cU9aUjE3Y3QwWFZzQ1pMZ3BJTUUrbXFn?=
 =?utf-8?B?ZVB0OHNVcmNUclRYL00vTGwrdG9rOGRhNUVNOHUwb1ZET00rTDhMZUY2ZEw4?=
 =?utf-8?B?S2NtTDZFcm9FczZ5UzJBL2tTSUhvb09yRE5WN1lZaGJVMUd6eDVkcXQ4M0xl?=
 =?utf-8?B?Sm9TL2pyUmpaUFh3MWY4bGpmb2VhbEZDS1NyenllTjZWWlNMQk9MT0tCK01j?=
 =?utf-8?B?QjNPaUV1NHgveW04SGJUM2t2UVBDWmFGSWRDZWQxWTU1S0dKNWthejdhSkI3?=
 =?utf-8?B?NEZ4M2t5QUFZZnVPK0JOSGpXUWVRTG1FeWYxOUxXa3p4NkRrNSswUG05ODNR?=
 =?utf-8?B?ZklBeTBta3hBMnpvRU1GWkpHYVlXSThiRkZPTmJmdUpKUTE0UDU1T3JjZ2tm?=
 =?utf-8?B?WHVHaitzR2I3NlFvL2pNZFNCaGVLbXdyZWR3TnN0NFl3Q09LVmo3eXB4bWto?=
 =?utf-8?B?QjdtWE85M2ZUdDhzbFUxOXdEZUEzd0pjUmJ1bXpBS3dDdW8rYU40ME4zRGZv?=
 =?utf-8?B?TnNJNUV2eStRa1IvUE5heFBuTmVpY25WS2VtblhnWHBVM3lIZ25YS3U3MW5O?=
 =?utf-8?B?aitUbTNPRi9hS1p1c3UzU1JnRDMyQ0lHeEUvamxIb1dQd3pBQlhqbTIxVFZz?=
 =?utf-8?B?TUNXckdBWnJVU2U0S21zZDVTdm5TT1VQMWFKODQ0N2tGY1lNa20yYjBGT3dV?=
 =?utf-8?B?eFFZbXRNcnlYVmJDd09kL0RPSkx3WFJ3Zm4xR3A3bU1qcWtEc3VlemNGMkJZ?=
 =?utf-8?B?czE3bzA5N1hHZ2FOUjNpMGxBc1JLWC9UblhFT0paNHZMMUo3S0JqNHdaVE93?=
 =?utf-8?B?anEyNVMyMGJkSjJUUk8zMmoyanExRElPOXU5MDJQVFF5SGpDbE1sNmVCV2xR?=
 =?utf-8?B?RFNTVEQyZThkaEorSU5ySGVra1V5dHdlNi9qN0ZGQXo4a05Ic2RFYWpwQnBq?=
 =?utf-8?B?Y0oydC9KZUdzOU9aelhCVWYxNlFvSDB1aXlHaUtkRUUzYmpWTGJLbEIrY2ox?=
 =?utf-8?B?SExGQmMwSGZ1eE9XaXdwUW5UV3Z1ZlFPUDJNc3ZCRjVTWFEyRkg1ZS9VR0kz?=
 =?utf-8?B?Z0FFR0tQTVd3SW5JZVR4ck1rZjlTNnpzem96M1pHaTN5R20yOVhlTW1OQ0Q0?=
 =?utf-8?B?NHhBY3pTWGEwVUNrQ0xvM014cHdSbVhrY2JBNzNpL2xwUXcwTndqdndHcFNP?=
 =?utf-8?B?c3RmMTNMNzBKNGJCVjlyV2gwTytUeXJIcnU4LzBNU0s4VEJpR29KbXRhYytK?=
 =?utf-8?B?L3h6cm9wdmxMZStRaVJBZDdTSGpycXRoQ1F3T2svczVLTUVLck9LNjZ3VHNP?=
 =?utf-8?B?ZDhBMWdxQXRTNmdmbVpPNjV1RmRKRXplV2dJTG9mdVkzWTNrUHQvTHRlVFNp?=
 =?utf-8?B?YU1qaDFxRDZISFY3OXlkQ2Fzb2N4T3ZXOXFRZk51SDVraEhFSkZqVnNOUVJS?=
 =?utf-8?B?b0gzVnZFUForSFZHQ3RIUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azR1Q3dHbTFZNUxvQXBBaXMveUFha2ZlZ0hDVFRia3hEeElIaDV2K1VsLzRB?=
 =?utf-8?B?UGFTbGtjZCt4TTlMa0s5b0MxeEE0bTRFUWcwVVRUdTRoR3dKamdaeXlMbCtP?=
 =?utf-8?B?VjVNeDhmSS9MT2J1bi9DVTdMRVB0eHAzNFRLTHYzRjNWZXhQbG5wcUtGekNE?=
 =?utf-8?B?RHBvYXZObTA1SVFISlpjWGRZcExqYWhNd0ppYXc1a0JvRGNSQmhQazVuUkQw?=
 =?utf-8?B?THIxZnNIVjdPVGZmVS8vSjFWd2ZvSkRzWEw5OThqMTc2WFRoOUpWVWttNkcy?=
 =?utf-8?B?RlIyUWhZQzF2Q1JhTUtOSzkwRWtSQnhESXkzL0FBK2doeHkrakdKRnRVakh3?=
 =?utf-8?B?RXdIcWNpWlB6NUlubGxOR2FqTlhVdVNNQzhtV2xhY3lRcGZjVnBaSHI3Qk1J?=
 =?utf-8?B?dVArQjJjVE02bGtpOFR6MzRNcmhtT2FvRVNxLzFzZUp3Z3hiR1R4SS9WM1E4?=
 =?utf-8?B?aUNGMUdsMmVONVEyYXQxaDA3NnJmRVRBSVhhcm1QWi95RTNwT3NMY0R6NURy?=
 =?utf-8?B?MXpBM0lIWEVoSXowTkI2anR3dHBoMDZCYmlyRFRWbzFQNGpjZzQwTmlPRkZs?=
 =?utf-8?B?eTlQSS82T0h4NW1XNVBlaFVzem5NeDlZN1AvdlBFN2d1RldoRXpvWnZha0tw?=
 =?utf-8?B?eWJFUEtVWHgvdE5ZK2N5RFZUTGdxdmgram5qRzNyYXhMWDRjalJlV2RZRWFu?=
 =?utf-8?B?a3QxMDJjTmVoRVhuYmt6YURaT0h3VS9xSnpwdXhGcC9IcmJad3RJNkpjSFVt?=
 =?utf-8?B?b2wyNVUzRUxQR1lvRm9sZzJyd1FMLyszQkRwWDBjK3o5TVllSlEvbTJQVGN1?=
 =?utf-8?B?WEtxWEk4aFVkcmk1aEtIYVdTZkx4Qk1Lcjc1Z3dMZnhCSnVlcE1wcm91RG9r?=
 =?utf-8?B?WWplclpzdUg2SExyaXVSc0NIVi9jOGJzSU5Ib2FjWThWeW5QR0lPODlrb1Nx?=
 =?utf-8?B?WENiaVRxbFRQc1UxaHVRT241blRpQUp0TjI0ZFJYN3FJbzlnWUZJSVhaclNS?=
 =?utf-8?B?RXlVajRkdUNWQUNDY0J5bktpYVZSYUx4dTBDMWoxajdaRnNnNytKSTNYcG85?=
 =?utf-8?B?eGFiWXFJMXlROWIyaVZaWFpmOTB6dXNrajY0WmQ1a250OXZ2cC8rcFpFbExQ?=
 =?utf-8?B?bGwvR0N0cE9jbTNuc0JlTXlTNE1ocXcyREx6Q3UzQnZqSUlmK2MwbXFTVjlF?=
 =?utf-8?B?QVc3Z29PSmpjY0NHazVaeXpBbXdOVXIwZkpWYUthT3B6ZEhrOE91Q0FVcUJw?=
 =?utf-8?B?alVBbElWcWgvRzUzTThGaTlhMHlyK3ZxUGJPTGVBZnBwNm9GdnFMNjg2OXBM?=
 =?utf-8?B?bllLRXVHa01SN3hjNGY5U2dtbkUyVUVKbGxpQmsyR2R5UWQxcytTVWZmTEIy?=
 =?utf-8?B?SC9xVC9rNTBSNjBmMmpaenRkZzFuT2owYkpzVkZuT3R4RmFWNUxqeWRYNmlM?=
 =?utf-8?B?TGNVVDBneGZkL08zVEJleHcyRDZlam5TWGhtTmt1Mm5sNHZsdDUzKzNha0hs?=
 =?utf-8?B?WER3MVVrOWRRR1ZQTnJSbkZxcXdJNXZnWDkwTGFaNlJ4ZWZ5NWg4eWRTYWJy?=
 =?utf-8?B?UVFtNUkxZThFTjMwQUNsdGlQS0E0akFwQkt0akJnamNPNnpiYkl2Nk5yMFhX?=
 =?utf-8?B?VkhnRkxudzd1ZHlDeTA0OUF3b3dJS2VtOHVlL3hvb0Y1c0hVRkI5TFZkQ0FV?=
 =?utf-8?B?Zis1a1p5UDJKT2Y3eDUwajIxRFVrVUQrdmdGNFNubUJQTzI0eUVYa05qc1Jh?=
 =?utf-8?B?Y2dOZEQ1bWZHRkFUNjNaUUI4VWJzRXNVL3MyekpPWk5VaVlLdjhrU3djN3JR?=
 =?utf-8?B?Tmd3dmNnUVZuQ2hoSTY5ZGdUR3F5VXBWNVFRc2M4SkFrcUt3b2J5YU5IdmhB?=
 =?utf-8?B?U0xxUERraGJwSXFoVk95NFdoUTJ2R1N2NjM1UWdQNXhVMkRvTmlucTQyOTcx?=
 =?utf-8?B?OWxyVzRvd0M3a05Da2I1V2lFOG9lYWxpVWFJcmFZVUVNQ0c0OSswOWhZUnls?=
 =?utf-8?B?dE5ZZFZIWnhNeWx6Y2RrV0pTbCs2aUp3OHNseXZIT0MwZWxUQ0dmbTdtQzc0?=
 =?utf-8?B?S3pWaXNyRHVsR2FRQ2NkdjFWeURKR3VjcVR5MHF0RVRDZW9ZQkwrZEp6eWF0?=
 =?utf-8?Q?6H4voxRcL3hTf8VvWcP58ITph?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0baf5e0-da8d-40d2-757f-08dd0ae07da4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 10:29:05.4458 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I6xV+J9sdoScd2ggDI9Fdwd3puUJbk7GlN2lblmvcBH1XvO2ErTL9RMNPbqLeOgF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8541
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

--------------hEoeDbVYOvZuuvolV9zuEaZw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 22.11.24 um 03:35 schrieb Matthew Brost:
> [SNIP]
>>> The flow here would be, a user job needs to wait on external dma-fence
>>> in a syncobj, syncfile, etc..., call the convert dma-fence to user fence
>>> IOCTL before the submission (patch 22, 28 in this series), program the
>>> wait via ring instructions, and then do the user submission. This would
>>> avoid blocking on external dma-fences in the submission path.
>>>
>>> I think this makes sense and having a light weight helper to normalize
>>> this flow across drivers makes a bit sense too.
>> Well we have pretty much the same concept, but all writes are done by the
>> hardware and not go by a round-trip through the CPU.
>>
> Hmm, I'm curious how that works on your end. Doesn't the DMA fence
> signaling have to go through the kernel?

No, we have a protected_fence packet which basically writes the current 
processing status (RPTR) into a location defined by the kernel driver.

So neither the value nor the location of the write can be manipulated by 
userspace.

This way queues can signal each other their status without going through 
a CPU round trip nor writing into a shared memory location. Writing into 
a memory location can probably be done by any hardware, but that usually 
has tons of scheduling implications, e.g. priority inversion etc...

> Yes, of course, in Xe we program seqno writes through the GPU when we
> can, but our bind code currently opportunistically bypasses the GPU.
> Eventually, I think it will become a 100% CPU operation for various
> reasons. Likewise, if a fence is coming from an external process, there
> is no GPU job to write the seqno.

Good point, for that use case the implementation would be useful for us 
as well.

> Of course, we could issue a GPU job to
> write the seqno, but this would add latency. In the case of VM bind, we
> really want to completely decouple that from the GPU for various reasons
> (I can explain why if needed, but it's kind of off-topic).
>
>> We have a read only mapped seq64 area in the kernel reserved part of the VM
>> address space.
>>
>> Through this area the queues can see each others fence progress and we can
>> say things like BO mapping and TLB flush are finished when this seq64
>> increases please suspend further processing until you see that.
>>
>> Could be that this is useful for more than XE, but at least for AMD I
>> currently don't see that.
>>
> Ok, we have no other current users, and if you feel it is better to
> carry this in Xe in a way that it can be moved to the common layer
> later, there’s no issue with that. We have several other components like
> this in Xe that are generic but currently live in Xe.

It's probably overkill for DMA-buf, but maybe we can put that stuff into 
DRM.

Christian.

>
> Matt
>
>> Regards,
>> Christian.
>>
>>> Matt
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> +}
>>>>> +EXPORT_SYMBOL(dma_fence_user_fence_free);
>>>>> +
>>>>> +/**
>>>>> + * dma_fence_user_fence_attach() - Attach user fence to dma-fence
>>>>> + *
>>>>> + * @fence: fence
>>>>> + * @user_fence user fence
>>>>> + * @map: IOSYS map to write seqno to
>>>>> + * @seqno: seqno to write to IOSYS map
>>>>> + *
>>>>> + * Attach a user fence, which is a seqno write to an IOSYS map, to a DMA fence.
>>>>> + * The caller must guarantee that the memory in the IOSYS map doesn't move
>>>>> + * before the fence signals. This is typically done by installing the DMA fence
>>>>> + * into the BO's DMA reservation bookkeeping slot from which the IOSYS was
>>>>> + * derived.
>>>>> + */
>>>>> +void dma_fence_user_fence_attach(struct dma_fence *fence,
>>>>> +				 struct dma_fence_user_fence *user_fence,
>>>>> +				 struct iosys_map *map, u64 seqno)
>>>>> +{
>>>>> +	int err;
>>>>> +
>>>>> +	user_fence->map = *map;
>>>>> +	user_fence->seqno = seqno;
>>>>> +
>>>>> +	err = dma_fence_add_callback(fence, &user_fence->cb, user_fence_cb);
>>>>> +	if (err == -ENOENT)
>>>>> +		user_fence_cb(NULL, &user_fence->cb);
>>>>> +}
>>>>> +EXPORT_SYMBOL(dma_fence_user_fence_attach);
>>>>> diff --git a/include/linux/dma-fence-user-fence.h b/include/linux/dma-fence-user-fence.h
>>>>> new file mode 100644
>>>>> index 000000000000..8678129c7d56
>>>>> --- /dev/null
>>>>> +++ b/include/linux/dma-fence-user-fence.h
>>>>> @@ -0,0 +1,31 @@
>>>>> +/* SPDX-License-Identifier: MIT */
>>>>> +/*
>>>>> + * Copyright © 2024 Intel Corporation
>>>>> + */
>>>>> +
>>>>> +#ifndef __LINUX_DMA_FENCE_USER_FENCE_H
>>>>> +#define __LINUX_DMA_FENCE_USER_FENCE_H
>>>>> +
>>>>> +#include <linux/dma-fence.h>
>>>>> +#include <linux/iosys-map.h>
>>>>> +
>>>>> +/** struct dma_fence_user_fence - User fence */
>>>>> +struct dma_fence_user_fence {
>>>>> +	/** @cb: dma-fence callback used to attach user fence to dma-fence */
>>>>> +	struct dma_fence_cb cb;
>>>>> +	/** @map: IOSYS map to write seqno to */
>>>>> +	struct iosys_map map;
>>>>> +	/** @seqno: seqno to write to IOSYS map */
>>>>> +	u64 seqno;
>>>>> +};
>>>>> +
>>>>> +struct dma_fence_user_fence *dma_fence_user_fence_alloc(void);
>>>>> +
>>>>> +void dma_fence_user_fence_free(struct dma_fence_user_fence *user_fence);
>>>>> +
>>>>> +void dma_fence_user_fence_attach(struct dma_fence *fence,
>>>>> +				 struct dma_fence_user_fence *user_fence,
>>>>> +				 struct iosys_map *map,
>>>>> +				 u64 seqno);
>>>>> +
>>>>> +#endif

--------------hEoeDbVYOvZuuvolV9zuEaZw
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 22.11.24 um 03:35 schrieb Matthew Brost:<br>
    <blockquote type="cite" cite="mid:Zz%2Ft5pp9rCg9b7lw@lstrano-desk.jf.intel.com">[SNIP]<span style="white-space: pre-wrap">
</span>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">The flow here would be, a user job needs to wait on external dma-fence
in a syncobj, syncfile, etc..., call the convert dma-fence to user fence
IOCTL before the submission (patch 22, 28 in this series), program the
wait via ring instructions, and then do the user submission. This would
avoid blocking on external dma-fences in the submission path.

I think this makes sense and having a light weight helper to normalize
this flow across drivers makes a bit sense too.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Well we have pretty much the same concept, but all writes are done by the
hardware and not go by a round-trip through the CPU.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Hmm, I'm curious how that works on your end. Doesn't the DMA fence
signaling have to go through the kernel?</pre>
    </blockquote>
    <br>
    No, we have a protected_fence packet which basically writes the
    current processing status (RPTR) into a location defined by the
    kernel driver.<br>
    <br>
    So neither the value nor the location of the write can be
    manipulated by userspace.<br>
    <br>
    This way queues can signal each other their status without going
    through a CPU round trip nor writing into a shared memory location.
    Writing into a memory location can probably be done by any hardware,
    but that usually has tons of scheduling implications, e.g. priority
    inversion etc...<br>
    <br>
    <blockquote type="cite" cite="mid:Zz%2Ft5pp9rCg9b7lw@lstrano-desk.jf.intel.com">
      <pre class="moz-quote-pre" wrap="">Yes, of course, in Xe we program seqno writes through the GPU when we
can, but our bind code currently opportunistically bypasses the GPU.
Eventually, I think it will become a 100% CPU operation for various
reasons. Likewise, if a fence is coming from an external process, there
is no GPU job to write the seqno.</pre>
    </blockquote>
    <br>
    Good point, for that use case the implementation would be useful for
    us as well.<br>
    <br>
    <blockquote type="cite" cite="mid:Zz%2Ft5pp9rCg9b7lw@lstrano-desk.jf.intel.com">
      <pre class="moz-quote-pre" wrap="">Of course, we could issue a GPU job to
write the seqno, but this would add latency. In the case of VM bind, we
really want to completely decouple that from the GPU for various reasons
(I can explain why if needed, but it's kind of off-topic).

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">We have a read only mapped seq64 area in the kernel reserved part of the VM
address space.

Through this area the queues can see each others fence progress and we can
say things like BO mapping and TLB flush are finished when this seq64
increases please suspend further processing until you see that.

Could be that this is useful for more than XE, but at least for AMD I
currently don't see that.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Ok, we have no other current users, and if you feel it is better to
carry this in Xe in a way that it can be moved to the common layer
later, there’s no issue with that. We have several other components like
this in Xe that are generic but currently live in Xe.</pre>
    </blockquote>
    <br>
    It's probably overkill for DMA-buf, but maybe we can put that stuff
    into DRM.<br>
    <br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:Zz%2Ft5pp9rCg9b7lw@lstrano-desk.jf.intel.com">
      <pre class="moz-quote-pre" wrap="">

Matt

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Regards,
Christian.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
Matt

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Regards,
Christian.

</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">+}
+EXPORT_SYMBOL(dma_fence_user_fence_free);
+
+/**
+ * dma_fence_user_fence_attach() - Attach user fence to dma-fence
+ *
+ * @fence: fence
+ * @user_fence user fence
+ * @map: IOSYS map to write seqno to
+ * @seqno: seqno to write to IOSYS map
+ *
+ * Attach a user fence, which is a seqno write to an IOSYS map, to a DMA fence.
+ * The caller must guarantee that the memory in the IOSYS map doesn't move
+ * before the fence signals. This is typically done by installing the DMA fence
+ * into the BO's DMA reservation bookkeeping slot from which the IOSYS was
+ * derived.
+ */
+void dma_fence_user_fence_attach(struct dma_fence *fence,
+				 struct dma_fence_user_fence *user_fence,
+				 struct iosys_map *map, u64 seqno)
+{
+	int err;
+
+	user_fence-&gt;map = *map;
+	user_fence-&gt;seqno = seqno;
+
+	err = dma_fence_add_callback(fence, &amp;user_fence-&gt;cb, user_fence_cb);
+	if (err == -ENOENT)
+		user_fence_cb(NULL, &amp;user_fence-&gt;cb);
+}
+EXPORT_SYMBOL(dma_fence_user_fence_attach);
diff --git a/include/linux/dma-fence-user-fence.h b/include/linux/dma-fence-user-fence.h
new file mode 100644
index 000000000000..8678129c7d56
--- /dev/null
+++ b/include/linux/dma-fence-user-fence.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef __LINUX_DMA_FENCE_USER_FENCE_H
+#define __LINUX_DMA_FENCE_USER_FENCE_H
+
+#include &lt;linux/dma-fence.h&gt;
+#include &lt;linux/iosys-map.h&gt;
+
+/** struct dma_fence_user_fence - User fence */
+struct dma_fence_user_fence {
+	/** @cb: dma-fence callback used to attach user fence to dma-fence */
+	struct dma_fence_cb cb;
+	/** @map: IOSYS map to write seqno to */
+	struct iosys_map map;
+	/** @seqno: seqno to write to IOSYS map */
+	u64 seqno;
+};
+
+struct dma_fence_user_fence *dma_fence_user_fence_alloc(void);
+
+void dma_fence_user_fence_free(struct dma_fence_user_fence *user_fence);
+
+void dma_fence_user_fence_attach(struct dma_fence *fence,
+				 struct dma_fence_user_fence *user_fence,
+				 struct iosys_map *map,
+				 u64 seqno);
+
+#endif
</pre>
            </blockquote>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------hEoeDbVYOvZuuvolV9zuEaZw--
