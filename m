Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A5D5AC4B8
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 16:13:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9786E10E031;
	Sun,  4 Sep 2022 14:13:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2078.outbound.protection.outlook.com [40.107.94.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F5010E031;
 Sun,  4 Sep 2022 14:13:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d4WO/J09zM770rB8EqbQGD9zwedSOAvpyWa/O10rVRgEev3lKwZHI3j/LbvNtZgmzvtW4Lt38/Q6Jo+NJDTDJNTESpnNLFuIAoRHpD2SsFCsA+N7wM8UQ7ePY56HKJD7QTrsreQ3swF0nA6xK6swpTcxSUBrZm3YUF3AdifQUr47vPjkACrNpHye50VdIASElwqHdgKOAbu7KkdkUlg2IcpkwY7BJIIMoUnwIGTvPcftUnyA+PApGP5hBFFZNSMl5E9t7qp7Ru3lF2eJkT43PNh8SPnc2MOPzJB2xfZS0G83XTiu5AXAhoMCfVyIMVAM/krGG3VTmuOt4s0gFzLPEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mnWpIw8bo0nsfjIree/0UYeTboeYThY60xZ5OIxpz38=;
 b=D8Uw2UK8kABAUAAIJQteBlJx1AXH7ITLEa8Yah7KWpED8DWCb/gPriTIEeEHpOrbvWzajfpxKppx3N5RRy9L6bj1DXXTwAzfamQi3hGJwCVenrFDC2uxpEFr86l0ObA2mB2WnTji74dH1FE/iJA2n4iWKGTSbDXiDz6APyCC3siIDLE4d9PIAdmOuGOlxMP64sZDBwrfep0dl9BeHwGKj+mNYc4fFnuYFacw0t2sviutYHoPFlMBa4tf/L+zyCixNVueONASx9q3Xzho2OJb/VJfamX8er3+EWqhI8IndfumcEEDJjf4FGlNVYluzXa3eSeM9pGy5tLGM0vVUaxEAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mnWpIw8bo0nsfjIree/0UYeTboeYThY60xZ5OIxpz38=;
 b=lRVoBcPRqtx0G2lao8M/m/WEOSWxhxsY4A+0kDXjuax/OtELwD+q8esgVNSy2g0RKn0PuSVHzSMmkq+SOq71RzcDFxMSHZKBRzr5cB17/80Qumdt6ciYPR2tPvnF0P1GOpFML3CL4E7daBQk1rJuv4nIOPchtwdS1IvcPU6ds4Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB7161.namprd12.prod.outlook.com (2603:10b6:510:200::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Sun, 4 Sep
 2022 14:13:21 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94%7]) with mapi id 15.20.5588.018; Sun, 4 Sep 2022
 14:13:21 +0000
Message-ID: <5112955e-3f1a-be3f-a07d-afd0923ac26a@amd.com>
Date: Sun, 4 Sep 2022 16:13:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] amd: amdgpu: fix coding style issue
Content-Language: en-US
To: Jingyu Wang <jingyuwang_vip@163.com>, alexander.deucher@amd.com,
 Xinhui.Pan@amd.com, airlied@linux.ie, daniel@ffwll.ch, Felix.Kuehling@amd.com
References: <20220904092625.1007393-1-jingyuwang_vip@163.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220904092625.1007393-1-jingyuwang_vip@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR02CA0010.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::23) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b348e1f0-086b-4c2f-abcf-08da8e7f9f6a
X-MS-TrafficTypeDiagnostic: PH7PR12MB7161:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9B792YNEMtdlCB9Al3zNYu5ui7BziauTZwbf3UmUj6ArB7UcurwU3WDrPpkS3Y96rggyopjZ+ElSRz9E3STs8kVNuQwpivt1GV3eoXFQ7DCFOpZ6ailYBxfP91Q0+kFIKklsV6hbP42ZyInq8UvrSWTk5JN4C67pIKcuUBXkpy4w6systTfm471aoBopSVC2x86+witXqN+IiwE/ZCMOTmf65phUuKC0uYFhOA3bTdULYRRjIhHYGsS+TqA/pj+GWx3XXCZGyPaqOeB1nlDIAuRKdCMhZAL3ZHK8RlyHuaC8yHxM3uQFNZzg7QdGJM3d1bJcFKyeEMD34uV84fIGzCZ8dZStXHacYpn6BjpJUBWV67Ke0dbtDYzna9a8lzcQm7Rm4l+b9bPLbRYiscg1T6Tv4k5ZLcnqErHWXtNkW4MoU8ZQ4JotBj32BEHrTEH3b/A7MTra0P4xjT31rDb6swoTRUXVldfI8T0LZJUFTroaKTo8I2f5NsklvDWmdGcehfi72Vf5V51wW0mKzJ/v6+pHKv9wOx/TtleJTTRdHDnooVjvrZ7VkHTYNKdNLtpHFSX3bSRwEA4rktIUkJ6ONERrl83QphmyvquUatiS8lD+yC0+GQKidjdv8PrK+63uAp+mxKeTsV4LqNEOETVeD0oDySlrRlomFg/j+IfBjCmXeauKPudwtkF9KDcyFFmVSlIWmKrJosMVIKDpBs2sYYkEUMJZ8psplUEB14pzUt7ZxyNSooB56XAYX4QTBcSAGAA3JXMgGYJ1uDKy68U2K9UZZ6yXhB5qdMEPS9GNWXM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(316002)(6636002)(83380400001)(6506007)(6512007)(6666004)(478600001)(8936002)(31686004)(31696002)(36756003)(86362001)(2906002)(5660300002)(4326008)(66556008)(66476007)(8676002)(66946007)(41300700001)(186003)(2616005)(6486002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1B4S01OeG5ncmlkajhPbEEycWhMa1hBWWVXZ2Q5NHZ5bnJpVzl0RXd6b3o5?=
 =?utf-8?B?MXJvZVhUek5JK2plaFc1ZElYRXVaOEdYV1FkS3NnWGVkakwzS1o5MFZmR3Bk?=
 =?utf-8?B?WnA0emRrT1NKb3BkQWM5M0lSd1QwWjlzQzE0d3lOZXVMNmZCdit6TURUNENE?=
 =?utf-8?B?UC9pZmdFZjQ0amJvN09LaWdLRWQ2OW90Y21LdS9oMjQ5eWFFZGJVa0tCZkdE?=
 =?utf-8?B?eG9BRXhkbmUwU1BxNTgwbmVIZXlXZFVDc3NmTUlyR1U4bklBNlpSRlNFRTNG?=
 =?utf-8?B?cE9heVlHa0hLbHJLMlAxUHRCV3F2eUVHVldaZzNRUlVhdnhISnJValN1bWZH?=
 =?utf-8?B?SkFxaGRHV0lrNEp2SVZnNjJIWXBxaWpZdkp1blBsWXIrT0V3ZG4ra1A2MEVi?=
 =?utf-8?B?aGxnc2tiY05keG1CTU42THVXMGl5VStJWThPeHZCT1VPdEYwYzZoKy9yT3Uw?=
 =?utf-8?B?aHEyLzdLZGVlNDNjeVlNRHZpa2xLMTh2dUhXRi9UYzk1QW9NWFBhQlhqREdN?=
 =?utf-8?B?amtLS3V5MVBZMTJZdjFGMHRUV2pKVldwWDlROG8zcWZtVEJLNWx0bm5kK2Z0?=
 =?utf-8?B?SjI4d3FaODlEYXBYY0ZJaDliK0dDeTNOUGM5d0VsR2ozWXRqa1BFYXRJRDdR?=
 =?utf-8?B?U0c5eTVjcVp1dDhNMk84dmp4SHQxRlh2L1c5a0o2bGFGcVdOeXZ6cGlqd0xQ?=
 =?utf-8?B?eFhMVCtJNUR2bFBQdkw2VU5tZFA3NDkyNG1wd0RXLzBsOGV0cWs5S1luQlpW?=
 =?utf-8?B?bmN6QVBpbnhjcUNIZWtZRktBN2V4cHJoZGsvUVAzSlAyOWw4enpodC9MSEVE?=
 =?utf-8?B?T1JrR1lrNThrQ0xlQnRQbExjYitMYUZ5aGtQWGdEcFlKaGt6UlFURlRqRklR?=
 =?utf-8?B?ZGV1c2lVMW5OZ01oaEZ2N0RwbS9RaGUrN3lVQ0FUeWVvRFNnRGpqUjJQcmZY?=
 =?utf-8?B?dmtuWDVCNHZrNm9jajNvNG5VdHlMQTBHckVsamVHbUdDV1hiMlQ5SmI3Z1Yz?=
 =?utf-8?B?QTIzdEpLbUpEZlpFck1HdUpIeCs0MTNkanVNdDhOd0ROMnF5cm1FRGtVS2dC?=
 =?utf-8?B?azF0NEwwRkNaTjFDMXFMV1FtZU1QenJVOHlsa1o0REVINTRyTEo4cEJuaWQ3?=
 =?utf-8?B?cFFJeDZzY251dmNUQ2VRQzFtakQzQm04eCtjS1RzcVpjb25CVVFLYm5RY0tz?=
 =?utf-8?B?N01YZTd5K0I3bTJLRlJMM2swWDNnQXhzUVR0TDlZSkpqYlE4UGtGUnZtdXlN?=
 =?utf-8?B?T1R4MjRiQmZUTFE4N3NZYUk2ek0rU0E1Vng3SHpFM0NGRTVTMnRRd2RsNmIy?=
 =?utf-8?B?T2ZWWGJESHJtN24wWUQ5SThOUHlhb0pCcUwvZ2k4NStSV1FweVkwUUpPTlRQ?=
 =?utf-8?B?MkdSaldEWGJpbUVQSklrQmJxcCtLV2l2bStPdWgwSjI3Qys2WWpTYTNpN0tG?=
 =?utf-8?B?TGpvNnRMREl5YjFhOVZIaEJpNGlTM2wrK21mU09TZjNGT2ZvNC9TZGRMVEw4?=
 =?utf-8?B?OFBRUDhLWFk3UmQzVEZRN2I3ZXhTeEp1aDc1RThjQnJLYWkwSllVV0VRL0Er?=
 =?utf-8?B?bjMvZWNCYkZIdktiQ1FKMzlxUmZhdXhueHhqcklJQ0xpNk5VclNuT0FMaUcw?=
 =?utf-8?B?ZjFFMmk3RGp5ZnNqQTFmVjF3dGpUSGprTW8zSU9iLzdwU3o5S3Z3anJRbHg1?=
 =?utf-8?B?SEJiZ1dtendEU2duc3BQeTljQnF1UFBKWE0reEhXdzRHdjhRZk1FdlZDMUJy?=
 =?utf-8?B?ZXlVQlR4SEJKRXZ5eHZWSURsV2ZBYTV4YkwvbS9HT29LdFFwK0NtbThraVVL?=
 =?utf-8?B?RStnYXhtckd2ZjNOSmxSSVlMNTE0MDllRSthek9ITHpBWEtZVk5RQUNZWGVM?=
 =?utf-8?B?dm4xWXpiWEl1UkFjU2VsRUo4aG9hMkhja3ZZRThpUXRsaTY3UmdZSnUvaXNw?=
 =?utf-8?B?dU1yUjRVa2JUM29ERitZZWx4dlRSaXZzSVl5b2g1cC9lYVdXSEtaQXFUR2ZD?=
 =?utf-8?B?dThvWHpOK2hLeEIreDk3eUg3eVVMMDRRbzg1aUVmZ3I5eVkya3I3UkcxbllX?=
 =?utf-8?B?dFg1RUZtcFRwQjl0UUFrL2V5UVlxblFGWFI5RlZYL2VYcXNWWFdBQVoybWQ2?=
 =?utf-8?B?RExMRnVIYnI5Q1NFS3F3VkFiYUpxYXNJMjV5UlhOUXNJK0lHTXJyVFpTRVJS?=
 =?utf-8?Q?bTjiDMGQSXUQAJb5/zo75huvqoIXLrtmuIcTCWJ9rGOx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b348e1f0-086b-4c2f-abcf-08da8e7f9f6a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2022 14:13:21.4780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m5xwyyuWbn421fyebF3LYOqwgdPysHxej9EX+T/ZyxhRL00KWR5wwkKSR85Tl4qU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7161
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 04.09.22 um 11:26 schrieb Jingyu Wang:
> This is a patch to the amdgpu_sync.c file that fixes some warnings found by the checkpatch.pl tool
>
> Signed-off-by: Jingyu Wang <jingyuwang_vip@163.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> index 504af1b93bfa..dfc787b749b2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> @@ -1,5 +1,6 @@
> -/*
> - * Copyright 2014 Advanced Micro Devices, Inc.
> +// SPDX-License-Identifier: GPL-2.0

This code is under and MIT license.

Christian.

> +
> +/* Copyright 2014 Advanced Micro Devices, Inc.
>    * All Rights Reserved.
>    *
>    * Permission is hereby granted, free of charge, to any person obtaining a
> @@ -315,6 +316,7 @@ struct dma_fence *amdgpu_sync_get_fence(struct amdgpu_sync *sync)
>   	struct hlist_node *tmp;
>   	struct dma_fence *f;
>   	int i;
> +
>   	hash_for_each_safe(sync->fences, i, tmp, e, node) {
>   
>   		f = e->fence;
> @@ -392,7 +394,7 @@ void amdgpu_sync_free(struct amdgpu_sync *sync)
>   {
>   	struct amdgpu_sync_entry *e;
>   	struct hlist_node *tmp;
> -	unsigned i;
> +	unsigned int i;
>   
>   	hash_for_each_safe(sync->fences, i, tmp, e, node) {
>   		hash_del(&e->node);

