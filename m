Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16508C2B76A
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 12:43:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F11010E3B7;
	Mon,  3 Nov 2025 11:43:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="owto3cia";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013007.outbound.protection.outlook.com
 [40.107.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04EFE10E3B7;
 Mon,  3 Nov 2025 11:43:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TNQ5XAg/TuWPKfpruh8ltKlemq8hmv49h5mNCihcLUjBKcX/7HVpVmyAgYtRR047JHXIybqcVbNyzM7TAkacjM2EqTlH0o9US3nJRv/cpqSSMlcjp5EA5hTKuw7WUKatQd5knmvH4b0Bm+Elihsr13HaiRqx1oXneme+hU8opFSiqdjWIPN16cI4owAf+KHjY07S7K9QQVnzos5LhQFTVu5jGviGj3ilRhwrHj7xJ3ogdOswMnA9Hyfd/oeIAISqd7MYrYNxVx918oAXkjrZlsI7Dr6Z+XB7jwRCgBuW4bwZrNjby5MyGPkG9684V3HBbmh4RmdL1XAWdvC1m2Newg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=56RGVvkHQ9B+3j9ABkcWgHIsHEUXIx040P6ya/k/hkQ=;
 b=kcPBXk330FmDaDFWbD+aMuGYcynw9qLWyk+5WQQCCjTSv4VpPx9Kf7DP9wRC3Al+71cZfvpWvuQ5L3OyKILnWNBBLPGGwE/fWZxOukwDLLjdVELPlTIELdyrsjagtrmNMwquGgB9w8M6QP/KKQgKeIB2q0uskpXvlEbhAbfoCMO5QZTE0+ZS/sEIv9KhqkKXob5CRPIPhkhHF1LAFcT7tqdU1dCSEWSsu4n8Yx6KR+S/QRAMLtyw79Qiw1wt+euWzRDzYP5ZPreCOkBC9dtnZWb1/vmm4TulrbtSq3AykqrLKgADkNTrB7ltlThR604HZLtihgnU5yqH8OBdloHlNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=56RGVvkHQ9B+3j9ABkcWgHIsHEUXIx040P6ya/k/hkQ=;
 b=owto3ciaLiMTUjwF4cyGJy4JcPA9SOvry+twKc+LKduMa71Q47bPAC3+EObC8FXsDdGTyg7eCMD0a6aWdZJrO2/BDrt9xLalaKDkHEjHLC5Nc4rFaLoYbA7Du+ZTT9jrGUSbNp5B4vi8JJrEDOT3kPLvID1e6I8pp3jfXcmb8Iw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BY5PR12MB4131.namprd12.prod.outlook.com (2603:10b6:a03:212::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 11:43:36 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 11:43:36 +0000
Message-ID: <2f8a4b6b-4b9e-480b-8ea0-35e9293d0b85@amd.com>
Date: Mon, 3 Nov 2025 12:43:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Independence for dma_fences!
To: Matthew Brost <matthew.brost@intel.com>
Cc: phasta@kernel.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20251013143502.1655-1-christian.koenig@amd.com>
 <15b2f86e8d6cb1df93edf73001fda2c378926016.camel@mailbox.org>
 <c5ee86a8-3c6d-462b-b435-e25e8a925bde@amd.com>
 <0e7f3ab50a2c30f193491bb82f97004150b99772.camel@mailbox.org>
 <2da2077c-4226-4ba4-8935-e7e15e6b9765@amd.com>
 <aQJ+08BFLtmsM8LQ@lstrano-desk.jf.intel.com>
 <6739aebe-45eb-44a5-a539-209fc3ed809b@amd.com>
 <aQT1lpZJwQmWXGBt@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aQT1lpZJwQmWXGBt@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR10CA0009.namprd10.prod.outlook.com
 (2603:10b6:408:143::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BY5PR12MB4131:EE_
X-MS-Office365-Filtering-Correlation-Id: 0df7fe5f-7ebf-4ade-6543-08de1ace3990
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V0dqMlRPRUhLaW43NzUwbUgycC9aSWFGWWQxUysrOGxFY1huZ2oyR3dsbXpm?=
 =?utf-8?B?Q1hEekN6bm5wdDRwTVZjRHo1Sml5QWtVTGw3NjBwU3FHcVhpei9DMkptWEti?=
 =?utf-8?B?UjBnYTQweiszV1RtTkY0MG9aUkxZZFJQdEp5OXhyN2h0Z1g5enV1UTNmdERk?=
 =?utf-8?B?K1kyOUNFL0NtV3p1M3FZT3FwcVJhMGJyMGtrN3I1SmZBZkZkeWVUdUI0a2RY?=
 =?utf-8?B?R0JiTUhMQ2poL3NVN3VBSzd2RVd2REJOUjJjQnc5c1MrSXE4YUZRMFpxa1M4?=
 =?utf-8?B?dXlxK1JvWTczOE1QNlcrOEc0V2RZa0RTWnBOWUFIOFBObiswMmk3SnZUODIv?=
 =?utf-8?B?SUZlL1hVc1NjUmZhK08xNVNQOCtGR280aFNWa2UxNXdVeUJUSDBJQm1HTmxj?=
 =?utf-8?B?elFGNmI1TVJiZkxUSDMzN0RWMlhtd0hhK09tMHFaMElZUGd3WlJHcnpab1dw?=
 =?utf-8?B?V3IwMEFyNUFDd1gwN1hJNWthRkpMVUVxYWhralRDWFdnVDV3TzJRS3hmTGZI?=
 =?utf-8?B?SGZ3bElCVUticVBzUnpLK0dBOXQ0RTFDcXpnbmdJbDJJTkVDM2RubkVBR0hu?=
 =?utf-8?B?eEo5dElmdDNhemU5SHIwOUhvUnVLM1ZhaVRKaGNNaW5UbXlEU0pvNkp1cXJv?=
 =?utf-8?B?THYrSXhoNWZlL21wa1ZZM01UdmtWaUZhOXV0UUcrZHJHVUdlejhDc3hlVjR0?=
 =?utf-8?B?Vyt6RkRGQksyUERIUzRQVGtxTk9BYkxodGt2OGRRUW0vNitBaVZra2kwb21w?=
 =?utf-8?B?SUtxNVFoTmViZ3JId1U2d2FSUkFzakNueFlXN2tRMnFncit1UGNpU0lXUUlE?=
 =?utf-8?B?cVZPK3pqMmFxV0VxQVVPTjhJOG5EbSs1ZVV6Q2wzNmxvazZVMTlOZm1ERlNw?=
 =?utf-8?B?djh1aE9pNzE0ZUE3eXVpWmhhTUkydWxRVzU5VmVCM0U3SE9tRXJycHpKUzB1?=
 =?utf-8?B?ZVJBalRXK3QrMDZrNmthcmgvcWZoUWxRZHJ4b3hqS09rd0lwSGZ0bTl4UHgx?=
 =?utf-8?B?a2xRcGp0MEtNZUFFYlZrR252dlJ3OERlSjF5dmxTaS9lRWpKaW5abURMSHJW?=
 =?utf-8?B?YXUyQWNqMHlnaDczYTExem0rclh0RzV6dW5zRkRQd3ZaOUVwMXRwZTRKT05s?=
 =?utf-8?B?WEFTWEVTM0xROWNSRHV1REJ1Q2NlSFNTVWpjY2pZd3o2MzgvTzZoSGhTbXB3?=
 =?utf-8?B?ZlFDbHZXb21wSFZkVVNHSVRQaE9TNnNiTThxNWZMSDM5eU4yQnVpbGM0Z1hs?=
 =?utf-8?B?Mkt5dGZNdHRrRkc2MVY3bDA1OHlmaWkxVi9ibFJYZTh1emxXamlwTnFqV3VX?=
 =?utf-8?B?dXhzWEhUMkFtbHlUOURPdlpzNDg4NXRkUk1Ib25wN3duWXdEUXFqbzc2eEMy?=
 =?utf-8?B?U0wzSzAzOGE0d0JjaHI5NVVNVUtlNjY5QkFEcW9FMWpOQlJwSGQzVmZOVGxT?=
 =?utf-8?B?Mi80cFV2S0FMemlOWWIxZzhjTGJ5RlZQNjUrUmRxNWF4QmRpc0lYYXExS1lC?=
 =?utf-8?B?cG9LS1k2ODI2TGdmaW5IU05KZGNxSGJmZVR6QlVYWkJXbGsxL1JYUUN4TDFW?=
 =?utf-8?B?a3Y3aTU3d2xqQzhxYWFmRGtjR25wM0hhWHJQa3FyMkV4MXVyajMvM1J2SmFx?=
 =?utf-8?B?NCtabEZDUDRITFNyaGd1eUtjOFdBejFqNGJqTGtqS1lFdU84QjE1dnFkNzRM?=
 =?utf-8?B?R2dkK2I0TTlZZEsyZXJpTTNEb3g1ZnpkaUp3MEpQRG55V0g2TW1uOXlndWpL?=
 =?utf-8?B?NDQ5NXM1d09xNUYyc2ExcVdHaEpacUpDL3lCSzhpTlpvT3dEdmhCYWF0b0xm?=
 =?utf-8?B?ZHNHd1BxMUxwV2JydTlBdkZyZEVZYzQ1NGZ4T2ZsQ21ieFJDMWZyRGJrRHNB?=
 =?utf-8?B?Mlh6ZC84d1AzMDRqNTJQRzAwRlhXWkp3SzBvT2JWSU51UmkvNDdyRWdBWkll?=
 =?utf-8?Q?BZuVs1AxlbtqVMxH+MgUmm51MJJMEH+9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHg3M3dhZVNCdXBhcTlTMUFFTk9RUFFQOTUySUFiSmkybmF4bENHUXBMTTVK?=
 =?utf-8?B?ME5nUlQxY3Z6L1dSemZSd3FwOWEweEFYT3NPeHVDUForaVNVSjdnMkZ2WlJo?=
 =?utf-8?B?RUxPa3JGYXZzQUNHZG9OaFNrNFFRUElRQyszM3F3bVgvTHNFUS9aRThGdktJ?=
 =?utf-8?B?aDJkMDNaZ212UVF1Y3lPYTAzOTRNMHdUYUowNVM4V2xsRFhBcGJ0RVZJT2w0?=
 =?utf-8?B?eG0rNGVYYzhjVzM1L20ycHp0Z3lGV25IWEhtSERFelZjbWxjejFsUkZnZGNk?=
 =?utf-8?B?K1ptVnY0T2E0Qm9tK0hMQXFNdjBhbzJnOHhZVDd2Y1dRdUNKRnVWeTZSMEdG?=
 =?utf-8?B?OWtNNm5TVXN2bDNhN3lLTHgzeWZGNytJNHRGTEp3eVQ1TVpwNDF0NjJ4YW5H?=
 =?utf-8?B?bXNrQjVhRFh2eVFlTWNkTS9sVUVtS0cxejAzeGk4UTAwSnBJS1JHbTdoR2pF?=
 =?utf-8?B?RGJGSUNuSVlUZWFIckN6NVRKVlNlM3VHYmRjV0FOT3NYa2lzU2NQaTNQOS94?=
 =?utf-8?B?OUJoRGQySXQvcU9mSC84ZmJjWWRFUFJkU09KNmRnSkY0eXRyRGF5bU16OGFX?=
 =?utf-8?B?d3NOMFBXV1lVZjFtOEpNaENVNzMrSnVzMTY3UzRyM2VLRkRFbTFNcnFycGNQ?=
 =?utf-8?B?YUcxUW4wWlRSSk1vSnpxYzBweEFaemhxU01BelFTcjliT016dElaaExTM0pK?=
 =?utf-8?B?aXlWanpqcnYyTlNudmZwOVNWZTBITTNCNVJHSnhGVVczTHlLQ2ZLa2Z2UytW?=
 =?utf-8?B?MUdqd2FQVHZodUptaTB4Um9zNDZha0tFQllWSHBkejhEM2xaZHRoWjltTnNH?=
 =?utf-8?B?UW9QUWtkbExQMHpZMkhFWENRZXZ1ellNR0U5Slg3ME9WUGJnYXU2UHdrRlB2?=
 =?utf-8?B?eE5vRmZTQ0VUcGdNU1c5cXkxd1pkMjN6UzVLOSs2dld6eThYZ0kzaDRjbkt3?=
 =?utf-8?B?Z29KRkp5UWZYbzkrSytsL09JNG93b1hiUnVEN3pOMG5WM3F1R2tLSTZTc01h?=
 =?utf-8?B?RzB4bzBYV1lFS1AzSGpNYmdjRTg0SnBCY1lqd0plaW1zbm9rZkUrRFJLbzk1?=
 =?utf-8?B?ekxZdi9zVmswc2NXYVppUXFlQjM3NloyTHBzYXpaOGdEbWlYMXRCWG9GYytN?=
 =?utf-8?B?SnhMcG4wRDk3K1NVWlRFNEtnRGFrMXdNYnBYdzh0ckdobEVadGhjM2RBOUlm?=
 =?utf-8?B?b29GNHVkR0tTbkoxK0tvUDU1RVB6ekpUNnc5VU9WN3BaWXQvaGJBTzRLa3hW?=
 =?utf-8?B?QWt3K2FYTEszTng3MlU1cHBMd2dtRGtYZDN0S3RuYmM0ZFRxVythakhvLzJW?=
 =?utf-8?B?UkFzVXhCeGs5c3NVNzNyWFdQU1MvbUYrdm5BcnozeXVCWjdqNTdMSmVLZjM5?=
 =?utf-8?B?eXNGL3dWTTBVYk94ci9yZGY2MHgxQ1JxdkM2bFRMVzlNYnBHNTZobU1zYmZI?=
 =?utf-8?B?cU92bFZkQWdnM0hESi9pTzVKemZjL0FzV1d4UW5wcXpUWENWZkJnZDc0YTQv?=
 =?utf-8?B?cGhvcU9OMXM4NUhtcnhrQ0YzK0oxdUc0RStydGZRLzJJckQ2bFZlbnlDeHZ2?=
 =?utf-8?B?WlZpeFIxb1AvamlCQVRHY0hCZzczVndYUGRjSnBTbitBYTI4MEdFb1JnVXIv?=
 =?utf-8?B?SXg4d1M1cDlkTkNIVTgxNkcxTFZPN2tXQWQ2N2l1dS8rdmhOMlF3aldGVXo4?=
 =?utf-8?B?eXFnUEl2Q1kyVkludkZwa2VmTUFVdStBeWYrWmFtY25YQkJwa2tkWWRCaUxP?=
 =?utf-8?B?eFZBZWtOWXJydEhqVGtPZXRnZjJyZmRqdU1ObmpjWWQ3enhqcjNpZkpuci9P?=
 =?utf-8?B?aVZobm5DUHBoSGRQRTVKOFFDeW5VQlp5UE16cGd4cnlLQ2hjcVBVOVFJSnNr?=
 =?utf-8?B?d1BwT0FMV0FnQzIrL0ZhWG10TkRnb3ZBQStZSUVrYzd4ZFl4ckk5ZUxCd3R5?=
 =?utf-8?B?eVBNTVE4S1l3QmdGbkl2aHN2alp0QW1ZSCtEalZWS3kvbGxrNzc5bWVNNW56?=
 =?utf-8?B?c2dHU3ZpeTFSd3VraTBOM2IyZVUzS0ErSWRJYlEzbU9qOHhjeEkzWEZuZjE1?=
 =?utf-8?B?ZGZlWUtUU1RtUnBjbTJjbEZXM3BFNkF1NTIzRTB3R3FWYkU5UDJpUEJEQ3Zm?=
 =?utf-8?Q?K1qo=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0df7fe5f-7ebf-4ade-6543-08de1ace3990
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 11:43:36.5689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 41lkUuhVtpvDK7iQ8IAz1SzEdXBdR0nFYaft6OCFuC6IKf4Y1gAHdKEiOXnHmTdt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4131
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

On 10/31/25 18:44, Matthew Brost wrote:
>>> Not to derail the conversation, but I noticed that dma-fence-arrays can,
>>> in fact, signal out of order. The issue lies in dma-fence-cb, which
>>> signals the fence using irq_queue_work. Internally, irq_queue_work uses
>>> llist, a LIFO structure. So, if two dma-fence-arrays have all their
>>> fences signaled from a thread, the IRQ work that signals each individual
>>> dma-fence-array will execute out of order.
>>>
>>> We should probably fix this.
>>
>> No we don't. That's what I'm trying to point out all the time.
>>
>> The original idea of sharing the lock was to guarantee that fence signal in order, but that never worked correct even for driver fences.
>>
>> The background is the optimization we do in the signaling fast path. E.g. when dma_fence_is_signaled() is called.
>>
> 
> Ah, yes—I see this now. I was operating under the assumption that fences
> on a timeline must signal in order, but that’s not actually true. What
> is true is that if a fence later on a timeline signals, all prior fences
> are complete (i.e., the underlying hardware condition is met, even if
> the software hasn’t signaled them yet).
> 
> Could we document this somewhere in the dma-fence kernel docs? I can
> take a stab at writing it up if you'd like. This is a fairly confusing
> aspect of dma-fence behavior.

We do have some hints in the documentation about that, but nothing which clearly says "don't expect fences submitted in the order A,B,C to also signal in order A,B,C unless signaling of each is enabled".

Were could we add something like that?

Christian.

> 
> Matt
