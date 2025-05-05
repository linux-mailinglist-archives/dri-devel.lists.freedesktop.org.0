Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B12AA99D0
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 18:56:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA10310E2ED;
	Mon,  5 May 2025 16:56:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Isu8W6XX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3C2710E00F
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 16:56:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F/0E+HuLstuS6RrQXF64eJK/xz+1FVCX9xIswmEtvB2JgrkBMBIqTAmuUAswzlDJf9zZMIT9UejcH9sJvFxqUUblSoeTI4MUBiXclz7/2rb8iDZEXJiZEcQ2bdsdU1uuLObHXC8une0Wb/XPudbNel3R7IbQYUOUUVkUfTuUn2kPhNfCvRKVSTvLcDiI9vS4wEJeINtTnBNo9cBacFmwl6VLOlXZoHqxK5kHHbA31uCCsJLcND+m4FL2HK+egaJSHO1ZopRpJS9uEiAnQgj4ud4msrDSdkUketZDd+LdUHSJVAwnycI3ArFCDJpTiiPrFUsaHfQulxtNh3uqp32nYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LzyBkPKE0EC+UTLfhDrWVo1AK/4DlynTS2l/Nmc3IzE=;
 b=RWv0TIVzoAXXiWZCXSmLom8Z8Ti7cNudIrr/9EAu7Dvs7Vm2V+icWmZ1082o0yPgelrFwULCBU/rmmXsMy2GbgJQxu1xF2EwYDwk8bv7t0Xgjf4mkwhsRRghTpLMipW0KzCfClkTlyODkgmjtl5Z8EXh0f6oo645qCaMAOfKjahTPhaUBl9SWPPEHMmhPkpB6j0XyQOWMf8yLt/HnroKsEr9jrolMsXg2R/k2vaUBPCrdryCRmYNltH1Jmr2JY+zCydqC7lS5V2BSwc6aQW6h4TXVtloEFkQBVAvVkSl8ZVZENQGxf7CMF2FSsQJMytMYpsUyDI4A4jvTK4F22rBTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzyBkPKE0EC+UTLfhDrWVo1AK/4DlynTS2l/Nmc3IzE=;
 b=Isu8W6XXZAtQglK4V7InSciehqVnoikjouL0X20luGasGWi5C+QTYxuZqXiG/c8z7hei4N7WE0fbuqjqSvMtLBAFwt9qIGJTHG0DWt6OSAUFU5thT7eTn7FJBrz07QJBBdk49J4mKJ/xyjQ9pnv9x2nJqvOaqBUmiO3K56nSzJc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BL3PR12MB6572.namprd12.prod.outlook.com (2603:10b6:208:38f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Mon, 5 May
 2025 16:56:11 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%5]) with mapi id 15.20.8699.026; Mon, 5 May 2025
 16:56:11 +0000
Message-ID: <0a7cf86d-9504-4ce4-9769-24c4e0c26fdf@amd.com>
Date: Mon, 5 May 2025 12:56:07 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: backlight: Clarify `actual_brightness`
To: Mario Limonciello <superm1@kernel.org>, mario.limonciello@amd.com,
 lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com
Cc: Lennart Poettering <lennart@poettering.net>,
 richard.purdie@linuxfoundation.org, dri-devel@lists.freedesktop.org
References: <20250415192101.2033518-1-superm1@kernel.org>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20250415192101.2033518-1-superm1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXPR0101CA0059.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:14::36) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|BL3PR12MB6572:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a0d4f57-9ea3-4a56-eea5-08dd8bf5bcf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Sk9rdGFLck9mdUp5Y2gvdHcrSVRteTZYci9iRlNobUk3RnZVdEZYSTBGNDJY?=
 =?utf-8?B?VkVSLzR5dVBacWhYa1JGa0pCRjh6T0tnWWlHdnFBeVBWMElZRGlUNVI0aVNY?=
 =?utf-8?B?emM3ZUl6OW85b3NiTzE1empVSkpzdGpTMUVJTlhDcEMyakhrWXZRV3dnd2Vl?=
 =?utf-8?B?NE40bEhOQmtBa1orbVZkQlduSXFob1pIUXluMGdMY3gvSFIwdVBlY2paRmNZ?=
 =?utf-8?B?eU9NdThXTklldXAzZTh5TGptQnk5UHZLcWF0UisxZTNuekVnZjhjUndKOTNS?=
 =?utf-8?B?bW41K2xqNW9peUZJZmd4aWdObFB5MWg5SzF2NnBpQzRNZ0o4VlJnU25Rd0dj?=
 =?utf-8?B?a2dwdThFempPd2pNUXNERUY2cHNBbW9hOVhvYTVSVmg2QVB0MEl6eDdvVkpF?=
 =?utf-8?B?aUpCS1UxakYyNUZXNnp6V21WdVNwbzlCQWI5UFZlVjJoSU5HRmY5RHZtZWpQ?=
 =?utf-8?B?SnFEeVQvOERsL3VNUmNWeVIrR1ZMR2I1bTBpeWNrQ05jd3gzZVc1YXZqcVh0?=
 =?utf-8?B?bHVpSW92MVdjVjd3eUR2U0YrNnFPcHVyVHpDRmw1MU91bUdQeTVrUlVjU216?=
 =?utf-8?B?RG5oU0ZqVFhCZzNIbzE2T0ZqM0g2UzN2Tm01b0tCenNDR1JMN24rdzBtb1RC?=
 =?utf-8?B?UGlLL0IwYnRvVUtYV05EWjBCNkJ2THFYWjlwcjNnR2xMTTNubjg3TGpqU1Zh?=
 =?utf-8?B?aHd5S1BQcXhtTExsci94ZVErZDNPZzNQaGVSdlRkMjJhNUV3QXVsOVNwZnNL?=
 =?utf-8?B?Y1NrdnJ3TmJwZTNrdFB0bVZrWlRGalM1ZUp6M2dnT1UxeUZUamsvbnBvQ2kr?=
 =?utf-8?B?dkZTVXFtbnZwT3dkMXdvVmtPNW5yUDhIR25mQS9INDZFdmIrNDJ3WTUvYkNq?=
 =?utf-8?B?N25LM3ZLY2loa1pITjhlYTR3TW52Z3hWTEN1RVFuWWlTaVlIZVY2VXFlNXVl?=
 =?utf-8?B?MktQQ0wzUjlEZy9ud0NYMG1OdytGc3Bpayt2UHFpRjZORll1d3RRQnFhRUo4?=
 =?utf-8?B?N1A4OXgzVUY4RW9FTEpqMXNzYUJOWW5mbGpWWlQyQ1dwK3lwQmYxbFBBaU82?=
 =?utf-8?B?TUdzRy8wcGdlUlFrTGlGcUE3T1hQN1VMWXhqZFM1c2JpelRJMU1BaUxEQ2VS?=
 =?utf-8?B?V2liSHJEQktibTRLVm5LUWlnZ0d2akR6OXFFbFJaV0hQZjY3Z1JXRjFPUWRk?=
 =?utf-8?B?MHhUTW1ZeUhwQjl5bXF3WXJBZVJKNDdqTjN2TUhrcXFQTGpQNHdveFRReDZF?=
 =?utf-8?B?Y3BtaGN5Skp4eE12eHBzTG9HN3FQQ0ljR0NXRFpSSTV1M0VIcE52d2xBMk4y?=
 =?utf-8?B?RTFjZ3k1UHI5ZndPaGhEZmNldHc2YWp0MFlwK2QveFNQU2NOQnRBREU0Vm9L?=
 =?utf-8?B?MVZmTkNDQ3JVMnJpbEZvelBWN3BHcmVyWkNmVGNBZVlhZzVqc1hSbG1GRVFu?=
 =?utf-8?B?WDNJWmJFcW5HSWxGNnBXK2xtMXErR0RtTFZqdGRoWFo0dFFkT2ZPbXd3U3Qz?=
 =?utf-8?B?TTIrbDlQTHg2cDE2b3BxWWswL20zL2hydTB2N3pDZVplVmw1MjNKOTRoa3F0?=
 =?utf-8?B?L2tTOEJWYUxpRlF2WThMdnY5UkpvY2x2VytlSCtLOVVCNy9QQ1p5aUI0aXVs?=
 =?utf-8?B?TWZ5QVZZL2lKT21RUlNIS0tDTnJuM1V0b21BMVpYSklqODBVNlRzMEFXY0Vq?=
 =?utf-8?B?TGd5enh0QzlxUDMrb2tCRmVZbVB0VEFpY3pKUytjTU5obVhQOEx4Z1BjRzJ6?=
 =?utf-8?B?MXB3MGcxLzNzb0ZicGM4NFRzbHBhWWlZSWtTZ05EYmJrd3VxTmNtWWVxaGt5?=
 =?utf-8?B?bm8rUFBQR1JleXdRb0llVU0zRVRvYUFkejcyQjF2NkxRd2orMG9NeTdESE4y?=
 =?utf-8?B?NVJiQ2NOT2NqVWN3TkVNRDdxdDZOMmN1K1l0ZUFXbDFWTGJSb0ZXNXJ6dkZv?=
 =?utf-8?Q?m1ktrJ3vGOs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0x6TzNYTTR0ejRkZ2I3ZFcxSmlrUE80b2ZzQnJOaWNsbWx5eGdNVWJWUU1O?=
 =?utf-8?B?aGxRSmw5dk5pZHdXQUNpWW1mTXpRd0MzTDlNVHNpanF3ZjhkSFdwUHdMYzE1?=
 =?utf-8?B?TkFrdWZQQW1wL1pGWUV6SEpnbklBRmh6WnNXS084QzYzcVdYOUtHcUlQeVA0?=
 =?utf-8?B?WWkzaThQUmFLd3NqNG1WRjIzMHg2MDNWeFYvME9MaHNQUWNzcEVBMUE2d2pD?=
 =?utf-8?B?YnB4TXhSdXpyVWc1VjV6OUJuWG8xd0t3KzBhR3JobEZDZkNta0pkVW1jSFVu?=
 =?utf-8?B?V1hZZGdxR3NrRmVRRmY2WHUwekg4dFc4NWVkZkJqSFl1TWhIOElpSGt0bFkr?=
 =?utf-8?B?c2ZvcnF0NkFyc0Z5NFRWNHhmWmZXWDVqNnhkT0pGZFFOVi9QYWx1SUhyeTMy?=
 =?utf-8?B?UnM0bTdqK3dRZXJEOE5OeVQwc3BnbnV1Y05vcm4vVmJ4M3FJa0NuUkhRa3d6?=
 =?utf-8?B?TWt1RmJqN2I3NFRxTXhQY1JVQXc5VDQ1OFBlZHlDUHFVamZiZ0VsVlczdmk0?=
 =?utf-8?B?TlhteDBDTXJsb04wR1BIN1hHZnF6YWszeTVpcjZ2TEd5MnFodkIyWDRQeW1D?=
 =?utf-8?B?V05TY1d5cWtDb3BCRjR0WUx2UHRSbzZjdWtYT0w4KzVOcmlPd3BLemx6cTcy?=
 =?utf-8?B?R0xxcTBIZmYyNFVkRDI3ZGxYR0tycGhGTUErSVhiTXhRNDg1Z1AranYxdWJU?=
 =?utf-8?B?bGdaM28ydUk2VXo0MzFRREpkRnllQ09TUmQvMXg3S2NLMFBTWU5aS3B3Q3ZZ?=
 =?utf-8?B?OUhoU2tLaERORjQ2SDZ2VGViNlY0RjVlc0lhYTNzdmI3RVE0OXJvUWx1TW5j?=
 =?utf-8?B?Q0x4TXdHSlo5dmRBZTQ2OGxsSEt1QXJ3eDBlK2hyL0NBajJuazYzUFVEYXRV?=
 =?utf-8?B?Vll2Smc2K2xRUnlpMWQyY1Q5TUo4VWlpTXNSNGdRNm5MTVZhcGRnNW1ZSEhp?=
 =?utf-8?B?bitNTEdRK1ZhME9XZU9xckhnaUovNm11YVQveFAydDh0bmE2NEUxaGNxMDhy?=
 =?utf-8?B?VUU3d2JZYUxDNHd4dHgxSm42Z3ZobG1SUFR0N0FDb3Z4Uk12dGsyR1RFUk1Y?=
 =?utf-8?B?SkphYmlNSFN6a1lZTHFXMDFxdGlZN1FqclBJL1IzTFZXcStwWVU5TVVPRWZm?=
 =?utf-8?B?UnV3VGpJeDMvWVJFK0YzSW1ucnNid0VjK0t0d0ZOdW9qWkR4M2RwdmNGOFJB?=
 =?utf-8?B?bnJqVnBQTHVWQVhDVkMrdHR2Y1Btb3FnVzlBbHJxUEtaWm02bkdnTThIK2F3?=
 =?utf-8?B?UDEzYzE5WlZKcFJobk14UlJxZU9WYzllZ3NkU0lPS2hqTkd1NlI1bWo1ak9i?=
 =?utf-8?B?WWFwSk5zSmtvU3V0WW53SWhnL2hHRFBKUGpWaW1xZXo3amNUcHVQT3EvRmFH?=
 =?utf-8?B?NVRINWJWZWlZUzBFZGtjMmFEWjVDVFlJalFpaklpd3NhMThLaDVva1hnaHFj?=
 =?utf-8?B?Tk5laTFEeXZCRktRazZTWTVXVFZqVkNsVVVMakNmcU5saGdaT0ZoWUJmMWtN?=
 =?utf-8?B?cDhMZ2dMb3N5TldNdjA1YXZOZS9vSmcxN21Md0R2TGJZbUZqZTF6MVVKUk1K?=
 =?utf-8?B?Z0NaQmZPczRSdUpnK3RHR1c0QzhxSTdzb0tnb1lEeHR0VjEvN1FIZ2ZMdHc5?=
 =?utf-8?B?cTdwOWlpWUFlbHRaeW5JTXZOcnlXcFdvaE5Dd2d0VHoyQkVuRWhPcWlZa0lh?=
 =?utf-8?B?VXY1blcxaDBEa2h6Sy9ORlRXa01YQVgxSFVSUGdKVVVHc2RHMjdKTCtCbU1Q?=
 =?utf-8?B?WlQ2N1pMVk5IWE9xM1dyNmxMcHBZbDZyeUVZNFE2UURrcHR1WU1tQ1NqeUk2?=
 =?utf-8?B?ZVBuWXAxdEZ3Nng4cmdkV3VRWDFLV24yYTNtaVduZzhHTE5NdlArUDBwK2Ft?=
 =?utf-8?B?cUx3WENxbHVTYlZsRUd0Yk5zN3hHVmVvbFZONVN1NVFlcm5sbkh1WHBKVWpH?=
 =?utf-8?B?N1FJWjd6dFFkeFIreW5qa2hVanhLaGQ3TGdMcjdvdW11RG5CSGVIa0cwQmo3?=
 =?utf-8?B?SGsxc012NWpZWmk0dW41Nmw1RGlEcDJTZ1F0SWJjcUltR3pvbXZDWmZyS05t?=
 =?utf-8?B?Zzh5VzE2SFhreDYrL2ZFd0hRRHRuMWdQL0VxL0hLL0VRVGo4NWFkNjkxQ2xU?=
 =?utf-8?Q?uUjQODSt0CZ1HcOp5weKPmNEF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a0d4f57-9ea3-4a56-eea5-08dd8bf5bcf2
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 16:56:11.3898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VQ4P1F+kvx00GYMLqpCzcxvSL2qCc3dq9Wxyk8Jg6BfMQ1pL3n1+K/t3XkgGvDzM6IEbN6CUVWcrcIcZVzcisg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6572
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



On 2025-04-15 15:20, Mario Limonciello wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> Currently userspace software systemd treats `brightness` and
> `actual_brightness` identically due to a bug found in an out of tree
> driver.
> 
> This however causes problems for in-tree drivers that use brightness
> to report user requested `brightness` and `actual_brightness` to report
> what the hardware actually has programmed.
> 
> Clarify the documentation to match the behavior described in commit
> 6ca017658b1f9 ("[PATCH] backlight: Backlight Class Improvements").
> 
> Cc: Lee Jones <lee@kernel.org>
> Cc: Lennart Poettering <lennart@poettering.net>
> Cc: richard.purdie@linuxfoundation.org
> Link: https://github.com/systemd/systemd/pull/36881
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v2:
>  * Add more explanation

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  Documentation/ABI/stable/sysfs-class-backlight | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/stable/sysfs-class-backlight b/Documentation/ABI/stable/sysfs-class-backlight
> index 6102d6bebdf9a..40b8c46b95b28 100644
> --- a/Documentation/ABI/stable/sysfs-class-backlight
> +++ b/Documentation/ABI/stable/sysfs-class-backlight
> @@ -26,7 +26,12 @@ Date:		March 2006
>  KernelVersion:	2.6.17
>  Contact:	Richard Purdie <rpurdie@rpsys.net>
>  Description:
> -		Show the actual brightness by querying the hardware.
> +		Show the actual brightness by querying the hardware. Due
> +		to implementation differences in hardware this may not
> +		match the value in 'brightness'. For example some hardware
> +		may treat blanking differently or have custom power saving
> +		features. Userspace should generally use the values in
> +		'brightness' to make decisions.
>  Users:		HAL
>  
>  What:		/sys/class/backlight/<backlight>/max_brightness

