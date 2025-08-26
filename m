Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F56CB35997
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 11:56:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56C0710E5E5;
	Tue, 26 Aug 2025 09:56:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xmV4cQdA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2089.outbound.protection.outlook.com [40.107.236.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FD9710E300;
 Tue, 26 Aug 2025 09:56:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f+TtJqarAR7Qgc/bThyhgLpZtaseGInRWw9E+ppv01R9oCaxSBINwKssszYrDH/xGvYseqY0KoRjKn/g7HSxbtcaiqHHKHRfLhfBiPz/ljnsdobU3rKp5RY1MaHa6Aq8JrwQSblGWxYdDDg9e3ktv+SU3RmljWAuqWrCjJIB+rPQf82/PL6NniwI8BU6cLWEUvrRg5pZRLZvitJWNz/m0M+jNGlx6UkX2QtLJ2Zft+F+qnxqT5+KhNoM8WwRnUtnqQ+o7vFBGuFyWddno1HqpH6/cnfbp0M234zzrstsrF/ffKti+JSn2dwoUD0yBEy7PX4451kIWLQiilcPk4y7tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q3yJgpqoRQjNwRja6+nbFAVZB+dvlOT2xyPbGssfJKo=;
 b=VfY2uKFH04ZLnscw3O0kaoR//jRT4tZ/QwZX0BjfjFPNJo2TaiaOODH0mn2MdZbdVfN9/BNRdol8pdRNUNubuMEXCp+goOKM4C3DqC2MxU/q3166aTZJ83T5pj7K6Ar30crr4A/BWiaA9VE/6vKQ7ap66swq4fF9snEj2ri+ncwD0i0SLf84j3v/QfhLREg1ItfOU1JZ3//lxMqwN4hf9qT/a7vAcMGu+OzgsbQdgMfMzydELcV7yv9NO/ad9gn+dEKfZAtBwweb78pJtQOQOOnsjvlelxalxJM5KC2EsaK2N3bvEL7FsBIPijNQMh1x6BRk+ucJSE1mRwC0DBGSgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q3yJgpqoRQjNwRja6+nbFAVZB+dvlOT2xyPbGssfJKo=;
 b=xmV4cQdAGxW73zkFGaW9ADMG4OkQtHY9pfp3XfxUjCpPWUb5eWcsTPm75CVxfMjOv0k/mwjuwnLGNBRnHhISfym5dwH6ysEh9177r9Pk1Se5MAJRqgSZzaFiv6KWHOh86XVx8CFO93Qqnox69dKA1WYc4UMB+QpS8ofaFnfrft0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB6397.namprd12.prod.outlook.com (2603:10b6:8:b4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 09:56:47 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 09:56:47 +0000
Message-ID: <a01f7ca8-7930-4b04-b597-0ebf8500a748@amd.com>
Date: Tue, 26 Aug 2025 11:56:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re:
To: David Hildenbrand <david@redhat.com>, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, x86@kernel.org
Cc: airlied@gmail.com, thomas.hellstrom@linux.intel.com,
 matthew.brost@intel.com, dave.hansen@linux.intel.com, luto@kernel.org,
 peterz@infradead.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
References: <20250820143739.3422-1-christian.koenig@amd.com>
 <edf4aee5-54eb-4fad-aa89-4913d44371fe@redhat.com>
 <4e5f4ef0-53f1-417e-8f3b-76fd7c64cd23@amd.com>
 <f983521c-b43d-4245-93fc-fcb847908573@redhat.com>
 <a1b95d23-1908-42c1-8ff6-da051fc140aa@amd.com>
 <6591105b-969d-44d6-80e1-233c1b84b121@redhat.com>
 <fc3e013c-e7f7-441d-a638-2ee3dd372775@amd.com>
 <75aca34d-3557-49e9-a523-bd3244c28190@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <75aca34d-3557-49e9-a523-bd3244c28190@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0161.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB6397:EE_
X-MS-Office365-Filtering-Correlation-Id: acc9d945-c8f1-4024-c1ce-08dde486def8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TlZWc3NqWnNNcVIxOGlVSVJWNG5Yc09OMWxiZElvMDBmOE5QaXJyZzJFbTE5?=
 =?utf-8?B?R0s2L0hDdHpmeW0vMmlDd0tkeGNMa255V3hMcEVXYThjeWpqQzZpK2JnNDZj?=
 =?utf-8?B?cWQ4cmh1czBqejI1N3pVL2RZZmtEQkZSZmNoN0pNQjFDS2lkK0tpVEJSVmtI?=
 =?utf-8?B?THdOR3hhaWVCSFA0Sk9mYW4zenU5YkdhMUlQS1NxVnVwUWZrQzJUSHhBcDhL?=
 =?utf-8?B?blpsaVdnbllMYXI3WGF3elFxVUNQUDMxNHhxeVpNMnI3eFllSUh3RVlxd0pP?=
 =?utf-8?B?YWNHQ095dDFPang2Q0UxcHhCU1F1eHg0d2J5K1hmb2RGVU5tY0MxNWt2MU9G?=
 =?utf-8?B?T21XY3VpMmxWZGRXS3FXcVRuL1ljaHFHUG11eDFrYkkwclFRWmduYmpFMFZD?=
 =?utf-8?B?Z0d6YmorZ3JzMDNXS2NZQUFTZitxaFgreUVoNzJZem83WG1zT0NJTVFrUVds?=
 =?utf-8?B?L0dhSUk5SUdhSzVOTHdNNnJvVjhKTzRsRzZPdkpvMitkS01yZWFWYkpSOEN2?=
 =?utf-8?B?QjF0bG81VWM4dUt5NDkvb2xUS1N4d1VWMnVwL1U5Q1BRYVRLR1l1N2RsZDlu?=
 =?utf-8?B?L0FsdDFDaittUXVoVjNNR3oyWXd6S21VSVduZzVTWFZCdXovaEprT01Ocmpz?=
 =?utf-8?B?cnJsVktyWXlUSVRiOGFRd09yaVltdFhlTXloMVRWdlRDM3ZGSnpiblBRUHlB?=
 =?utf-8?B?KzdxNzJCdCtKTDhFUERiOUdvMmZsd3FFSHZIK3dwdzNxMnhFS2VrcHZLWVJK?=
 =?utf-8?B?V1cwTU9LYitFZkFYaDB3VlI5OVNxM21hWXpTOFVRTnBiTW9mcEJLa0tKUm1o?=
 =?utf-8?B?dVNDdmpmUWNpYXNNNTluZmNzWXVJQ2JLbjRkUlBoMituUUZ0WlpwYWlLZ2pq?=
 =?utf-8?B?TTZOWkZZVU1idzNxUFZCeE9MRFRxdzZzVEpSUnN0T2UrVUZ6TisreWxheTFy?=
 =?utf-8?B?aUpLSmtUeUY0bnRrUmpEb0U0cDFTMjd6MGhtT2VSQk8vVDkwRXdORE84WHp2?=
 =?utf-8?B?MEQ5by84a3ZFZzVWSjRxK280VURIaGhCNEdrQ1F0Y0Q4UHRLUWxRVFB4a2tK?=
 =?utf-8?B?WVdMV1JlMk5ReERRQkw0TDZKSlRmUnQ1ZklOOVlIQm0vTEZvRHZQeTBpY3lm?=
 =?utf-8?B?WUNLZy9WSm1iZzJ3SllKUXA1UEptNDJIczBOang5dHVib0Z1WGNxYlZqZThS?=
 =?utf-8?B?RVd6aGJKNW52N0xLNnFhM2hJeHdoMTVRNGN6czJ3VzBvWlZYbHBHUDM0L1BU?=
 =?utf-8?B?NEROdllWNHo2U2JiZnAxb1VkWFVENXBiczZ5OUdBUGp0NXMxb0l5R0svd3dx?=
 =?utf-8?B?WmRrcW13cHR2bE80TmdaeEdCV1FCTzl4dGk2bTNLRm8xQjJXcGFCV2M5Skp2?=
 =?utf-8?B?Y0pTZmowTFJXKzM4ckgyWFR4SzVpK3RqUnFkaU4zWWU2MDZYdDRzS1NGU0NF?=
 =?utf-8?B?bHEvS0RpSytoa1k0aEtTZFRQdU1ZV2xoSWJiNnRJbW9UcWZ4cG13RE5XSE5X?=
 =?utf-8?B?dzNhZEZrNmQwS0JzYlpmNktBWTY2Y0FpM1ovSDZXcE9sU0pTWU9zM2p4cGxa?=
 =?utf-8?B?RTM5TkhHSTY2L3ptTUlWdVVyVWxMVFozOHZuSFMvN1pxbVgyQldNYWlUdEdM?=
 =?utf-8?B?NnFCOUMxUU55b25CODM2SDVQUXcvVE9vL0dadkZFQmZQQVZnTE1WdGp0djh4?=
 =?utf-8?B?ZTZzbCtTK0pUREt5VXcxSVlDeEZ0UHBISm9lSzhDKzBDWTN2djJycVdXTTZK?=
 =?utf-8?B?SmFpdlpJMFA3Zlo0ajFkemYwWkN4Q3UwOXdUd09pZ1lxNy9VUklLNzhib0pW?=
 =?utf-8?B?WVptSmxjajNkemEvVU9HWmw3UEgvSHpSNFFKcVc3bEVHZDhZQ0d3b0QwNi9R?=
 =?utf-8?B?ak1QK1JaTlpNZUJtSnlGN1c4MUN2QUJiTkZSSDBjc05rRkk1SXZhSktjbHpN?=
 =?utf-8?Q?jM09Koul/y4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wm82ZCtaNWJMYXBoMHNsQ0FqTDBwd3JiQlBrWjdJYkxVV05admUzNnFHSlUr?=
 =?utf-8?B?UDRrK2QwU2VRUURlL3AwWjg3R25ZcWI2YVdqUzRXbzVkZENlNUQ5MXFuRytT?=
 =?utf-8?B?a01vV3lQV2RTUjA5K1hmOHMxN3FwZXVEdHZLVXQwdW5xamQ0V0dOMVJ3VHNr?=
 =?utf-8?B?cmRvRGR6L2EranovRHpQTEMrRW5ybk8rTXMyNlNLMVVOUVliUTdJbG9IWWJI?=
 =?utf-8?B?RnpUUjBWY2dpMlN5QUVNUW0zYkdWYUxmcDdxSDJOVXlkdk4yNXdsWVI2N2FT?=
 =?utf-8?B?WW1vcy9aeSs2VVlKaWlDeG9SNXlZS3U4Skpqb3JzZVNuV2t3UGw3MFQ0aGxp?=
 =?utf-8?B?N2YyVEFOdzFobEtFNGF1MzE1c1ZiVHZvUTVrWlRKckpyZEkzTWRKL01Udjg5?=
 =?utf-8?B?emNWOHZEVE5WWUc4OGZFZnViZWo0ZVFqTzJ2SEQrUHBHNGl6dHpDdmFYZmx2?=
 =?utf-8?B?K05laldiODJaa1o5dktGY2tIUm5iayszbWV3Mlo2Um9yRjVXdGtiZGY4U1lP?=
 =?utf-8?B?Sk1YVTN4cnJ1dFVwTnlzNllueHprcllOQ2dEL3ZNWS9OZVhJZUo2eE1qUXdV?=
 =?utf-8?B?NG1SZEFRNkdZTDBaU3ZWbUQ5VFN5Q2RqUW9ZdHpPd3JSN0lSazhlWnBsUTgr?=
 =?utf-8?B?TytzMk9SYUkwZjZXSkdFeVZiWExxMmlwekR0dUgzMUhidVpocXNHdnl1Tkdi?=
 =?utf-8?B?TytNaUczVmdLd1BEaXFmZlZJajRmUEhUR2tDU2dubnpBbTdLcEtsOGxLN0ht?=
 =?utf-8?B?TGFGZUdpMzlXNktZY0VOa3crVzRRRWlKQnpwemZIbFQrcU96c0kxRWgySEZJ?=
 =?utf-8?B?RGw2Yi9rZWZucXJFQW5maGpLMzlRclBWaCsxWVVjUENLeGcrYWVQQ3BNN0lz?=
 =?utf-8?B?ZnFDdlFIMjJpa3kvNS8vak9JZDdHejhaTEtqYzB0cDhMSklNQXh5MzNrWEh3?=
 =?utf-8?B?bC9EY3RXejhBc3ZVUDN2L0p3dFNNMmdKa0locnd6SHJmQTg4eFFGMENEbGEw?=
 =?utf-8?B?MFNaWnlzL0FmKy80QnFoejd3VXdkSUNtbDh3ZHhPaHRLWnkxMGt0RFoyVkg3?=
 =?utf-8?B?ZWh1TEx3YVVkTUZtMVhEUnB1TDZ1dXJuNlJlRHYzNUVwNDIrQ2NDQm5CNWlT?=
 =?utf-8?B?ejd2bUwzUWFFSlMycTlWdlFWRVVEYW9Dd0ZvdHVHMDVzV292Q0t2alRXcjlt?=
 =?utf-8?B?VlhUOXpwQkNSNVY1SW5NV042L1hobFJVUW5ydzB2ekdBZ0JiTktmanUzMGlS?=
 =?utf-8?B?QS9qMFJHemVwTTBiZjlUVWtpWlJHK2srOWg3WDhLYXlTSzF2WmpVaVpXenFj?=
 =?utf-8?B?YlpJck8rUXZxS1o5Q2RaQVBpNnRtdUlaKys1eGdmVThRUlMxZDNKYnBLeE1w?=
 =?utf-8?B?Z2ZnOUNxbjJDVjN1NFNGTlc1b0cvdVRNT2IzRnBWMndlMGFyNEpQb09DQ1Vv?=
 =?utf-8?B?ZW1OeFd0Rms4bFltRmZGUmgva0FtS3hWNmRrQjI2ZUQwZ2JBUUs4S1ZDVHpp?=
 =?utf-8?B?aklZRHJhNUhmTThDK29kQzlHTk1rcGFRek8vQUZreldpTUx0SWpjemlNck1z?=
 =?utf-8?B?NFRCT2owdHVTZE0wZkVscEJ4cmdGR0cvdUl6ZFAyN0ZoanNzNmZDOS9EVGNS?=
 =?utf-8?B?MWY0bVlpT1BVUFZ5ek91TUNEM2xtcXh2U0JYeFRZWE52d0QxTm9IdHk1UCsy?=
 =?utf-8?B?TXh5bkhReFdVQzdjaWVMbFFLOGJxTDgwaUhhcVJVdjQxeEpWVFpjU2FTWERs?=
 =?utf-8?B?Mkw1RFhaZHJJWDNHZVZJSzFSeExrUjFMZy9xZHRxcTIvMDBnRS8zSml0SEd3?=
 =?utf-8?B?czhreFEyVWYzYi9KNWhtbFdhOURla3hSTUw3MHQzUVBBbHY3Y2tUbEc4eUJx?=
 =?utf-8?B?Y3BGYlZQaXVCVWpyV1dWVlFhSVVVT0FoZkxoS01TQjFLM1dtSnRiSFRzSGdu?=
 =?utf-8?B?MTluemEzTHNKbDFwcDlydTdoZHo3SlhqQ0VGYTNuaEtNN2wrUVg3S1hYU3VM?=
 =?utf-8?B?VVlrano0TW5DbE5xRFBQTUw0MDhuVFo4R3hiQWMxRUpXeXJZdW9NVHpiZEI2?=
 =?utf-8?B?d1pxZWxXc1FUMHVwQTYya2hpd28rUFA3d1ZNcUc1UEFFeUVwdVZYdmR2bTlP?=
 =?utf-8?Q?s5Q5AZR79kddGfje8wzyppbNG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acc9d945-c8f1-4024-c1ce-08dde486def8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 09:56:47.7057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GrcUt5xB6O7vxpq2cJa12P027mGWUrHpZY4ryGYOYS4LcUusqxyMYoWUC3IW7xU6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6397
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

On 26.08.25 11:17, David Hildenbrand wrote:
> On 26.08.25 11:00, Christian König wrote:
>> On 26.08.25 10:46, David Hildenbrand wrote:
>>>>> So my assumption would be that that is missing for the drivers here?
>>>>
>>>> Well yes and no.
>>>>
>>>> See the PAT is optimized for applying specific caching attributes to ranges [A..B] (e.g. it uses an R/B tree). But what drivers do here is that they have single pages (usually for get_free_page or similar) and want to apply a certain caching attribute to it.
>>>>
>>>> So what would happen is that we completely clutter the R/B tree used by the PAT with thousands if not millions of entries.
>>>>
>>>
>>> Hm, above you're saying that there is no direct map, but now you are saying that the pages were obtained through get_free_page()?
>>
>> The problem only happens with highmem pages on 32bit kernels. Those pages are not in the linear mapping.
> 
> Right, in the common case there is a direct map.
> 
>>
>>> I agree that what you describe here sounds suboptimal. But if the pages where obtained from the buddy, there surely is a direct map -- unless we explicitly remove it :(
>>>
>>> If we're talking about individual pages without a directmap, I would wonder if they are actually part of a bigger memory region that can just be reserved in one go (similar to how remap_pfn_range()) would handle it.
>>>
>>> Can you briefly describe how your use case obtains these PFNs, and how scattered tehy + their caching attributes might be?
>>
>> What drivers do is to call get_free_page() or alloc_pages_node() with the GFP_HIGHUSER flag set.
>>
>> For non highmem pages drivers then calls set_pages_wc/uc() which changes the caching of the linear mapping, but for highmem pages there is no linear mapping so set_pages_wc() or set_pages_uc() doesn't work and drivers avoid calling it.
>>
>> Those are basically just random system memory pages. So they are potentially scattered over the whole memory address space.
> 
> Thanks, that's valuable information.
> 
> So essentially these drivers maintain their own consistency and PAT is not aware of that.
> 
> And the real problem is ordinary system RAM.
> 
> There are various ways forward.
> 
> 1) We use another interface that consumes pages instead of PFNs, like a
>    vm_insert_pages_pgprot() we would be adding.
> 
>    Is there any strong requirement for inserting non-refcounted PFNs?

Yes, there is a strong requirement to insert non-refcounted PFNs.

We had a lot of trouble with KVM people trying to grab a reference to those pages even if the VMA had the VM_PFNMAP flag set.

> 2) We add another interface that consumes PFNs, but explicitly states
>    that it is only for ordinary system RAM, and that the user is
>    required for updating the direct map.
> 
>    We could sanity-check the direct map in debug kernels.

I would rather like to see vmf_insert_pfn_prot() fixed instead.

That function was explicitly added to insert the PFN with the given attributes and as far as I can see all users of that function expect exactly that.

> 
> 3) We teach PAT code in pfnmap_setup_cachemode_pfn() about treating this
>    system RAM differently.
> 
> 
> There is also the option for a mixture between 1 and 2, where we get pages, but we map them non-refcounted in a VM_PFNMAP.
> 
> In general, having pages makes it easier to assert that they are likely ordinary system ram pages, and that the interface is not getting abused for something else.

Well, exactly that's the use case here and that is not abusive at all as far as I can see.

What drivers want is to insert a PFN with a certain set of caching attributes regardless if it's system memory or iomem. That's why vmf_insert_pfn_prot() was created in the first place.

That drivers need to call set_pages_wc/uc() for the linear mapping on x86 manually is correct and checking that is clearly a good idea for debug kernels.

> We could also perform the set_pages_wc/uc() from inside that function, but maybe it depends on the use case whether we want to do that whenever we map them into a process?

It sounds like a good idea in theory, but I think it is potentially to much overhead to be applicable.

Thanks,
Christian.
