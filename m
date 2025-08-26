Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D48B36F8E
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 18:09:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8798510E69D;
	Tue, 26 Aug 2025 16:09:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="exrlm71V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2066.outbound.protection.outlook.com [40.107.236.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05E0D10E360;
 Tue, 26 Aug 2025 16:09:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S3DJJnHdmtW7FC2EeLBhGMPxODUv7/0NzZBmsewRsE/po9zwTGrUxIQ1pn9oJqBgdrDsCh2F4cQYm8uMQlM7/NAIQjWXuECssN9PI7Qq0+7wHuxDp8MH0tvdtXb/0Gh3OIr20rd74cWpttrGajQ0RlGY7R1bQQ3mh0P6UcGGK4Onrm0O7urN1q2VkdmkjWdFOKRVSnR3wjmdK1jROr0xk3OmcBM3QCnp6cJFmdP3M/2+68/rtw2tPbaJf1sx3GHBIRT54r6/W+l1+xCmwovy+TWjhbpqYXMhvsupVQwKr4ONxwos4GbvSM2l+i8OQHmqgbYdQCO9OIYwF0/f8K9w9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EQY/KhVZEx5kvhO1rHhnUtz/xnNbXy2zrC1gbOFW3ts=;
 b=FI1frg4TvUgxLQVvQC6azkDMZtPNuqFjnMJpPlWFW2iNXmXxwTrD+LPYqfL+p2h7sNsQjFVL/G4apLKD4DIcfUjYjwwESGEz3NL+HXWqsWRIfKkOh+JosOfbi3zzXzJNmHhn62CWvKjUPtNbcHMKd4jxrqdoc1XGi4AKBUjaQ33EFQ23z2yJ53RU4Pnj9BBMQb+Ho2VyI8fp5XsW58UVRuyGPiFBQuQ/KlhRaGdgRLJi/W8YlnWU6i+5h2kAPqCjVgoUzBn1IB1ElM5+k/V+C3QPPEaVptuMriWixW7/yOPigVJ3kU/O9vlH5md1MVLzYpnx47eU2CC5x12pwCPlcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQY/KhVZEx5kvhO1rHhnUtz/xnNbXy2zrC1gbOFW3ts=;
 b=exrlm71VnyDFtlUUUw1rAFFuhEn08knyRo6VX9trymgX/oegpI1eg8eoDG30xtB+RR/IvlzfDEUo7gEqrnF8N5/zWbH4gPIN1q8hFnBnZHoBcp4Sa2bZlnKLy6ROR0mw8ou+Op/9xxueq2thCzHqfYnuQxX7aIaIAZdNUARKUsc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB6064.namprd12.prod.outlook.com (2603:10b6:8:af::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 16:09:21 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 16:09:21 +0000
Message-ID: <87050572-811e-4b0c-9ebd-8ebb05f3c617@amd.com>
Date: Tue, 26 Aug 2025 18:09:13 +0200
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
 <a01f7ca8-7930-4b04-b597-0ebf8500a748@amd.com>
 <d32fa753-66a1-451a-8cef-95c1f78fc366@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <d32fa753-66a1-451a-8cef-95c1f78fc366@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0214.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB6064:EE_
X-MS-Office365-Filtering-Correlation-Id: 99a5e11a-5c7e-43a5-3af0-08dde4baead4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N1FCaklSS3VtS1JoUEU4Sk5Xbko4Q3oyc0VzSG8zWXpFSGxpcmMyN2JsanNN?=
 =?utf-8?B?SEZiU3ByV0NUSFF6Z1d0REp3MlJRVHFoNENLTnZ3elI3VDdMc0RoVWptRzZO?=
 =?utf-8?B?N2JSSW9Bazg5Wnh2cEpIejJzbzNhZUw1TzhhMG02cStDeDhHRlVsVjhwN2JS?=
 =?utf-8?B?Q3NGV1BIV0JRTk55RHVOdnR2RC9LNUFVYlZyQWYyZEN4Sit2cHpCOCtIZ3hY?=
 =?utf-8?B?WnZ3UHoxM25GWGVOcDdNenJZYjcrWDBkRmxoMU1VNmJmaE1ZQ3EveUNjZ1FL?=
 =?utf-8?B?a0lGbHVIc0ttWEZ1c2dyaGUzZzgwZkdwZk8xQUhRTDRvaHZIdmFTMm1nR2ds?=
 =?utf-8?B?MUNnMkFTWWU0TDZPV1h0aWRuUk1VWEQxNld5ZVFLZXVxTldXVG9kcWtTT1Zx?=
 =?utf-8?B?ejU1MWZJM01RaThmcnBZa25XaWZCNm9KYVZldGJFZTZ0ZnJKQkhhZzAxOGgr?=
 =?utf-8?B?WmFCbDFYTjVmeWpaVkdIU2FidVM3ZmEybG15QU1WVXdNYmdsYWJZU1BqaFpH?=
 =?utf-8?B?SFZyYzIxaEMwTHUyeVg5YnlOVCsya29TcnExbENlVHZ5Z0tGamZVWE9WL1pZ?=
 =?utf-8?B?ckV1YTlQT0NQYnJrRXgyVi9lWkFIQnNlMldyYnkrYllYcmJYMXVhZzMvRGsy?=
 =?utf-8?B?VVB0c21NSUdQcTVkSVBBVUlWMG5xUlB5OG5JZFFDSVhPd0VwM2dSTEE2RUxY?=
 =?utf-8?B?ZWFnUnluREZUMENKYk9Zd2lOMkYyaVdhVDl1MnJVajV2QlR0bU5EeGZCN1gy?=
 =?utf-8?B?cGMzVTd2S2MxMGZnSmZZVi9WaW5uYU90VEF1YkVvOG5mY0svUzRDQTRHalM5?=
 =?utf-8?B?bnBTcWhNcGl0V20rMEI5RWtkNTVuSHNua0hoYk40R0hwTGl1RmJCRFBzeFRs?=
 =?utf-8?B?dDFnbnBmdXRqL0pxb1dFN1VLbGdkSG53NUpCelU0THBxdzFvajE0Yjg5M1ZH?=
 =?utf-8?B?cUpFS1dCZlArQmhQaHljSVVDbk9Jd2kram1EKzlkeHczVi9VbGs1ZUNvcjlw?=
 =?utf-8?B?QXhxaGo2ZjFTam92WGw3b0lSTFZueCtrV3BPVS9ZdmVKL0FxMktLejlqYzRy?=
 =?utf-8?B?NVgxZjk2cjBYdHduTDBwUXk3ZnBvNFFWUFdjcm5zdEQxWE9RWXdxbkJ1bGkx?=
 =?utf-8?B?NjB0QURneUFpMVN0ekZrb2krcUFORS9rK3BEM2lkMXhkaHFBOFM3Q3NGdDl1?=
 =?utf-8?B?Slo4OUlqVHE5aTluOTRxcTlsRW9RbE92VGd6eGl0UVVDSGhSbGozeFhCTzhM?=
 =?utf-8?B?cVRPWGhWYUxtV1VqM2xVY3NQYnlTcDJWZUZSZzAwOFNSRys5dWd3L1NDQVpI?=
 =?utf-8?B?TzJDSk12QmtIZy92RzF6eExwMGZ2Yy9vNE5RdW55SEZJUGIrUW5LUVE4MEVx?=
 =?utf-8?B?ZW5KT1RmOGhtb0pJcmt6RGhYbktqOXd3dEZSdEJ4a2NVTlBBempIaTNEN1ps?=
 =?utf-8?B?R3NraXoreHR3V2FESlR5TXRPRFY5QWRaM3kxOVREbTNZYnZMbG5qWVkzR0ZP?=
 =?utf-8?B?d3FkUjBydTVydVVtU0FkTFVuVk13WlhicUdjQ1JKdjg4OTJMMDBuTTZqUGlE?=
 =?utf-8?B?aTNUaVR4elRIOERiV3J4eHJycFBGc0RqOWZ6L1ovL2NBSXZVNVZscmJ1RVdZ?=
 =?utf-8?B?dTZsbWdYam50UHNsa3o4MHMrN2pqZ3lQVEVocHcwWkV0cmwrbm0xSHFhQVBX?=
 =?utf-8?B?WVVOY0VGWkZOYlNJQmp3a2NEN1d3bmNVK2NqRTdxL2pJY0NTRzBkQWdCSlBM?=
 =?utf-8?B?aS9yWGt2VTF6WVJ5NEo0WHlHWkxGd3Y0WTJwSkNGRERyRXpSNDhwb3lSWEFP?=
 =?utf-8?Q?MZxhz7wRZRH4NillkdH4eN8yrcTuos7jkijzQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WC8xS20rK0JMWjB1OTZXZmNLNE40WFp5VFdKaXlvV2N2M29uanBCMjJ6ZHlq?=
 =?utf-8?B?M1hRenJDa0hOelBlUzFTTUQxN3ZGRFg0dHl4bW4yOW9QeS8zc2s3dnU4QS9S?=
 =?utf-8?B?V3h1TnlyMnBqQjB6UDFqQmhtMTA4b1R4aDJSSHpHRnlVejJVWWhldWl3TFVC?=
 =?utf-8?B?YVU1ZnNPcWFzcGpPQ0RYaXI0KzcyUUxRZ3Z0WUp1SGgzSkxQU3RsNFZIcUhD?=
 =?utf-8?B?bDV4RVh6WmNsR0FDWUcrWmZwYW1aSjNCUi8yMTFOL09UOWlrYXFMeXhQalZy?=
 =?utf-8?B?c3F5WXlwZkFxUk5CU1Y5TFVseHY2b1BhSnVkWDk5M0FMV0NubFVDc0ZLU0E2?=
 =?utf-8?B?RXpnM3RTT25sb3BLSlNkNGkyL1BqQTFHNlJGM1FPdUszaWd4TFMvU1F2SGdP?=
 =?utf-8?B?eDRJTHA3R1huTERGRmVEbms0TzR1MWVEQi9YV0dkbCs5YkQ1a1V1bHVPZTdH?=
 =?utf-8?B?amdRdUlrem5KWjBTZlYxdFFOTlN6cEF4Q3NiS0FWSjhEN2tHSmQzUURKajI0?=
 =?utf-8?B?Q0FNYTVjL2NScGZ6aWNocHoycnVEUXc2WEJCQ3c5MnVqQ0VueXpaT3E5emZ5?=
 =?utf-8?B?c01hL3ZNdlFFSnRFMFhVenNPeHhkSTRmMjBRdEp3eGhDZzI4ck82d0RyU0xL?=
 =?utf-8?B?dlppSjBZczUzN05YQVNyY1AraFYyWWdILzVKVG15N3g1eENXNVpEYk01SE5C?=
 =?utf-8?B?WlM1SmlKVjkrRXM2Y2x2VFpyRktsZDhKaVdjL1JvbG1SMG5WU1VOMEQzZmtU?=
 =?utf-8?B?YjZVa3ByR3dNYWJCd3ByT1QxdzNsZU94dFhHRGc1eWdsWk10UEI4ZWdmdXNq?=
 =?utf-8?B?UTBMaVdqNHoyclhjMXluUTBGSjNkVC9yV2tMWU9NZ3dzeThjQ3pMNGl2UGti?=
 =?utf-8?B?UVR6dVdQMmVLUXNVOVJJTTlIVy8rVnVBc3RGMTF3WDdUY0FNejRGZEs5NUMr?=
 =?utf-8?B?L1p3SDI3VTQySDRHZkZOZjRGcTFqUmNiOTdZRW56aTA5ZzEzMHRObWI4dlB1?=
 =?utf-8?B?K2M4NnRiS0JjQkIzVjFXSGtldlBJcmxhZHNFV0puZnRBSzFyKzYySlZQcmNx?=
 =?utf-8?B?dGpRYXdSanRMOTgzSzdhbGcrTUEwc05nblRKTEt4dFNNRFdWc0RNS2tUaUtr?=
 =?utf-8?B?cTBLdU9DVVNnQ3FrVUNaazd0NThxR0dmdFlaUGRaUnNjMnhCSjVmVHRZU3dB?=
 =?utf-8?B?UlFiQVVyQWhNUXB2Zml5TTJQZE1WM1ZNZldkY250Z24yQjlUM0pFZFNBY0Iv?=
 =?utf-8?B?ME0xL0o1TUtvblJpbDRzQytjRS9ISG4vUVdmUm5VK2ViS28wcTVOWE9aZnVP?=
 =?utf-8?B?NmRWcjA2RkJaMDcwRnhwa1p1b2V1YXFLRTE2MjZzSUVpbVF6SEh1VzlaenNV?=
 =?utf-8?B?VGRiYmRzNTZSYUxoLzdydVpYTUpkdUxKbEtEdDhGa2dMT0syNnJYR2lWMW9P?=
 =?utf-8?B?Y0ZoUVpCWW0yWTRQSkUrZVBtaWNiUkM4RkF2ZjkvQjIzTzBVQjBHTkpneWZz?=
 =?utf-8?B?RVFOQkJrMHdFL0M4enZ5bkVvOElGaE50cUF0WTlzMDErM1JBTjB5WHMzV05m?=
 =?utf-8?B?WkVHKzQvaVdUeENIME9mQ3A1VVQ3ckVCc2JkaUhBcUdFS2xvenkyRVcyZ2dp?=
 =?utf-8?B?bHpoWmZRUXkyTlVtUTBFOFBxaWQ4cTZTUzdJSU1nVGlMRDlTdkpESG45U3g4?=
 =?utf-8?B?MDNyTVFySDRMMHh2UmZvZGxtZVF4dVU3L2ozdzA1WUcxU1NuN2JMNGpoLzNa?=
 =?utf-8?B?YVZwdGFXT2pjZXNMQnZsdzhLd2Voa2x2QXJQNmV1ZzVMSHJZV0ZrWFpiM1A5?=
 =?utf-8?B?NXhsWk9wTUNvdkN1M1N5aDZmbVdpOW1QTE5DZEV1eW91VGVZKy9jV1NFSWN4?=
 =?utf-8?B?T3dteFVlTFRCZmlJdHdtVktPeS9UVlcvVVdGUU1TdmRxUEZzbjROU0JFZk9m?=
 =?utf-8?B?Zk8zYWZvTkhnQXgzWWFuKzBmdHpOWVE1WHljN0dJZFltMlhGQ21meS8rcC9T?=
 =?utf-8?B?UkNZOUx4V3orR0dSNEQ4L0pBM3lWV1R3OElNaDZzMDRIY2xXRGVvVVZ0US9X?=
 =?utf-8?B?MlFoS084WU5CNW1xY0pNNDJNT3U4aFRLNmdqWE1KdU1RdC9hMUFKck44R2Ux?=
 =?utf-8?Q?le/6R09/HxFcyoEuYGIfGBTjH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99a5e11a-5c7e-43a5-3af0-08dde4baead4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 16:09:21.2522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g1KJjqZW0PFia1G1M2aG1cU9cJ9oJCDsBezoAAiExhuNiP5WdnNqOWRROYaVF2Xl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6064
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

On 26.08.25 14:07, David Hildenbrand wrote: 
>>
>>> 2) We add another interface that consumes PFNs, but explicitly states
>>>     that it is only for ordinary system RAM, and that the user is
>>>     required for updating the direct map.
>>>
>>>     We could sanity-check the direct map in debug kernels.
>>
>> I would rather like to see vmf_insert_pfn_prot() fixed instead.
>>
>> That function was explicitly added to insert the PFN with the given attributes and as far as I can see all users of that function expect exactly that.
> 
> It's all a bit tricky :(

I would rather say horrible complicated :(

>>>
>>> 3) We teach PAT code in pfnmap_setup_cachemode_pfn() about treating this
>>>     system RAM differently.
>>>
>>>
>>> There is also the option for a mixture between 1 and 2, where we get pages, but we map them non-refcounted in a VM_PFNMAP.
>>>
>>> In general, having pages makes it easier to assert that they are likely ordinary system ram pages, and that the interface is not getting abused for something else.
>>
>> Well, exactly that's the use case here and that is not abusive at all as far as I can see.
>>
>> What drivers want is to insert a PFN with a certain set of caching attributes regardless if it's system memory or iomem. That's why vmf_insert_pfn_prot() was created in the first place.
> 
> I mean, the use case of "allocate pages from the buddy and fixup the linear map" sounds perfectly reasonable to me. Absolutely no reason to get PAT involved. Nobody else should be messing with that memory after all.
> 
> As soon as we are talking about other memory ranges (iomem) that are not from the buddy, it gets weird to bypass PAT, and the question I am asking myself is, when is it okay, and when not.

Ok let me try to explain parts of the history and the big picture for at least the graphics use case on x86.

In 1996/97 Intel came up with the idea of AGP: https://en.wikipedia.org/wiki/Accelerated_Graphics_Port

At that time the CPUs, PCI bus and system memory were all connected together through the north bridge: https://en.wikipedia.org/wiki/Northbridge_(computing)

The problem was that AGP also introduced the concept of putting large amounts of data for the video controller (PCI device) into system memory when you don't have enough local device memory (VRAM).

But that meant when that memory is cached that the north bridge always had to snoop the CPU cache over the front side bus for every access the video controller made. This meant a huge performance bottleneck, so the idea was born to access that data uncached.


Well that was nearly 30years ago, PCI, AGP and front side bus are long gone, but the concept of putting video controller (GPU) stuff into uncached system memory has prevailed.

So for example even modern AMD CPU based laptops need uncached system memory if their local memory is not large enough to contain the picture to display on the monitor. And with modern 8k monitors that can actually happen quite fast...

What drivers do today is to call vmf_insert_pfn_prot() either with the PFN of their local memory (iomem) or uncached/wc system memory.


To summarize that we have an interface to fill in the page tables with either iomem or system memory is actually part of the design. That's how the HW driver is expected to work.

>> That drivers need to call set_pages_wc/uc() for the linear mapping on x86 manually is correct and checking that is clearly a good idea for debug kernels.
> 
> I'll have to think about this a bit: assuming only vmf_insert_pfn() calls pfnmap_setup_cachemode_pfn() but vmf_insert_pfn_prot() doesn't, how could we sanity check that somebody is doing something against the will of PAT.

I think the most defensive approach for a quick fix is this change here:

 static inline void pgprot_set_cachemode(pgprot_t *prot, enum page_cache_mode pcm)
 {
-       *prot = __pgprot((pgprot_val(*prot) & ~_PAGE_CACHE_MASK) |
-                        cachemode2protval(pcm));
+       if (pcm != _PAGE_CACHE_MODE_WB)
+               *prot = __pgprot((pgprot_val(*prot) & ~_PAGE_CACHE_MASK) |
+                                cachemode2protval(pcm));
 }

This applies the PAT value if it's anything else than _PAGE_CACHE_MODE_WB but still allows callers to use something different on normal WB system memory.

What do you think?

Regards,
Christian
