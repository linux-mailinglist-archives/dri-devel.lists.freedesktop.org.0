Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F8339426B
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 14:18:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A32EA6F5A7;
	Fri, 28 May 2021 12:18:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2040.outbound.protection.outlook.com [40.107.92.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCC3E6E528;
 Fri, 28 May 2021 12:18:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qql8pdkNaJJtVCGPX6MzHPvhq+uhONKMbdmqd99GKrasOu9ud17yyka2gIgMdMcJP26qLPrw/FHtr7NgvzqYdvUSFg9RcU/gmJcG8jnHvkSUOB+LzZDwnqrC/0JBWtW8yQ/tRh2jecwEBaV/lmd1QMbAhmt5AuZVDv9yCQfanT0TrWRhKX/dEoJttYPXUsznT+3EIYGRmOK0aVAFYAvir1MouyQkryV0cQ+SRRuGMIYuyPmjCg2ObxwrQe+iDU04wksu+jWUPK/g1G/wkwT2WuoJJkieUaucAuE/BYbCQJpaiAgn/GxnA1pDgiRugBetj8axMb0Hj8SbIA/M8GQRvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WU/d0yAslbJCuaO8uINvMc1IGDajUOC9Ejc96ICdXYo=;
 b=E4JBmXQjkBhaE9wuCBznYlHpXzz6FNBbvgz2X3qjjv01e0E2/imY7hLVs3pwfp+vzAnHIfFJ9IMkB2yvFmPuwEz0679uBxHw3g8WDSQo3QDDiY9o6ng0iVR4KiODBqsKqzgVLah6oPXZEPKhGKfmjbgkHq44cAkXfWJlS2cqsVFgGFVVD+NVJ+9Jhh9MVvp3g9JZkXeITCuNRxS5FIrbBcP7KmlWMPo/X5yVCq8aS6ragoVHmT+iEr/QNpraSwMm8O4zd+IB0y/q55dC8DxPo8YDOwelQUpmHUGDjDfzDSt5dcAQRN51i6YvGauVJNw8bAuyiJGtU3/1r9c68TiLyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WU/d0yAslbJCuaO8uINvMc1IGDajUOC9Ejc96ICdXYo=;
 b=HnCxtOiV9SBFhj1C8tsUILoTMBDRZmoWcUAQ5vcLgY6Vai57KY/Yts1hszpAp13g/DbzPg46+Vr8g4om1yuXhFW0EQX/2unwGf7+j8u/TXtxeTGEX6aLhF4C2aS5Pj63ko7KXwZtgvbuMccH6OxdSQVZMTaK2qC/atvwJJl0P6E=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4739.namprd12.prod.outlook.com (2603:10b6:208:81::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Fri, 28 May
 2021 12:18:27 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4173.024; Fri, 28 May 2021
 12:18:27 +0000
Subject: Re: [PATCH v3] amdgpu: remove unreachable code
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, alexander.deucher@amd.com
References: <1622194158-70898-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <37a4f0bf-4acb-3961-699b-8335e194e315@amd.com>
Date: Fri, 28 May 2021 14:18:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <1622194158-70898-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:c3f6:1c8f:ede0:3bcb]
X-ClientProxiedBy: AM8P191CA0006.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::11) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:c3f6:1c8f:ede0:3bcb]
 (2a02:908:1252:fb60:c3f6:1c8f:ede0:3bcb) by
 AM8P191CA0006.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Fri, 28 May 2021 12:18:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d3e2f93-e7c6-40ec-73b6-08d921d2b227
X-MS-TrafficTypeDiagnostic: BL0PR12MB4739:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4739EFCC791330925B348FE683229@BL0PR12MB4739.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J9wsCu3xruOOaogQzadeInkBiVFIk8rMakkXb2TTl0garPxhkMumZAy5K4W9lVqghNDanva8Jx2pSpb4OZ4+P/XVSS9z2ZC/XFsanVg1AUP1wor8yR6VSuraQJpk3Q1SoLds8wHNdTa/ZsLIfuI7vcHW+ew62gJSCAYHchCCU43u8qcTL0LEXf1q3FbdJZQGSVybHNlKX5plqTcwjHBU6ilpjiapqCSNcL2b1Ni8TEAf/QRKGn4OyoFN3lYxWg3nqo3GuP5vGED/ynIeSLyCbxjv1RwSWvJUcRKo4Vf08Mz5urU3cw6uZQu5nma2GsoYsM0eDOd/Yg3ZdDrTBKn+AGMkMxpG4DgzMzi58+jMh0X0WDMqA4Gd6m6LRyMJCcIsToHlGYhUUeTg16XXgnjJVBfgTEPqmynXt+MVMPE9o0eytufV2VEm9fYf+mddvXmZy/jcAuyUn7+uqDZG0IHd5vgMuFTsfNp7dotPRj3omtxU6KdSdS0IFQHgDVsSw5t4UXcv3f5cCfup0Ac4Vok8cmlJoVWWf6vXW+DcZKl15rJkOlwWOCZGZcmRTE0Y3cSopr9yE9oiPurVopIGYvk+yPCJCNQnwz4cdhHFFaDHiicgHNBLzqQvtfKXl0XVuqjgTZ8rOMFxqTrGrkRs9MO9POQXu2nLUctOSpiHHK/ej4ybuiJpsJ4RA4jl79dgjDONiz7S6u7OvUxFNHAVoI3+HQ4crBehxht7XPxXjYDZvih0ql+6v2SyCMjYSKyoa+W79RVj/P5XXEf5uavGfAZlUoWKCv7FN49Bz2NDeFypUfrJ3eYAHbzxYHow7mg0+fKM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(396003)(346002)(376002)(136003)(4326008)(478600001)(31686004)(6666004)(2616005)(966005)(36756003)(66946007)(5660300002)(2906002)(6486002)(8676002)(16526019)(6636002)(8936002)(66574015)(66476007)(38100700002)(83380400001)(186003)(66556008)(31696002)(86362001)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WkR3cE9ZTC94VTdvRExXcktrQVFvQ1htZi8xb3VMYzd0T0xabTExOTlwYzhN?=
 =?utf-8?B?THZZbGhuZ2NUaVpYNE9ySHY2QkRXRUxnWGVUbDlkVWxBV1NqcG5lUUFqellh?=
 =?utf-8?B?aktGcEZRNElFdVFoQ3hMODl4UCtyenNhcW5yaDZOT0pPdWhGMzZaMVhJYWRT?=
 =?utf-8?B?dmdhdzBMSWxRZm9QM0FTeVRYYldxczlnMkVVeEJOOVdBa2RmMm1LcnM1RTdz?=
 =?utf-8?B?VlZDcjMxSEpLVmhCbkhXWWQwL2VjcDNVL3lWL3F5TlZqdWQvV1Y3VGp5L2Rr?=
 =?utf-8?B?Z1huaEUvbTZhdVovakk5UkgyTWs2U0VDeFFId0lIVWpGMzRnVnBvMktlMC96?=
 =?utf-8?B?ZXhCZTIvV00rUG9YVXNEcG1ReUlxclNhUEE4Y2pzUkdxeFZiUmNVMENkZTZX?=
 =?utf-8?B?WjJQd3RJeks2UnhxRnJrN1VHY3BqakJwQTZkRzBRemtaTmZoTDFaYlBSUUEw?=
 =?utf-8?B?V2kxa1VCTUsvNHVLcGl0NkRFeWkrUEZ1bWFGTlV6WUdINEJCWXlGL0lJTUti?=
 =?utf-8?B?ZERPWGloZ3hJaCtvcTJTaXV2UTUyZzlIU3RKVkNiTXJyOUVReWJnZ2NxSGh4?=
 =?utf-8?B?aTV4R252VHl3WEM5U2VyTldwQStMODlDTWh6TzNxN1R0UHpBeXppZC9qRjNp?=
 =?utf-8?B?UkN6cnRXM2Jyc3JMYS9sdDRmZXRqTCtNWDBXbVZMTCtKY0Z0d3FUWWMxZ0F2?=
 =?utf-8?B?RVk5YkFublBiSUxzcVRiU1I2cWFkWjNOZFZob1FOOGtFWFRUYjFQUTkvL3kv?=
 =?utf-8?B?U1RpUVNFRVo1dG9NVWFXbldUcE9iQlJzMFkwcGUrT0dYU093OFpseWRJcWk1?=
 =?utf-8?B?by9PbDJNeGdZWG8reHgwRUN1Z1F4eEgzTGV0ZVJISmMzNmVMY3JIcDEzUGxl?=
 =?utf-8?B?OU1sZ1lMWXhHZjRUaFk5M29JUWl5cmNhNlYyM1ZFaWdNa3ZtQVZiQjlCSkJX?=
 =?utf-8?B?NG9PVS95RXU1K0hmdHE5NjJkWTM5T29wUFJJYlhlU2JIZWtIQkw5QkFWalRO?=
 =?utf-8?B?dWFUVkh1QlNKQ0lveE4zcGhYL05IOG1nWnVPajgwVFg1dWw3ZmI4MlVxYmZ1?=
 =?utf-8?B?djY0dCtublhIcDc5alE5c2w1NGVGM04weHRzT0NrZExkWDJoVnZ1WFVNRmRP?=
 =?utf-8?B?THpTSkFJS2tlYWRVOTJrTEpLQWVRWE5lQ2tZd1lsZkRzQnZ2cXpVM2FCMjlZ?=
 =?utf-8?B?TWFURUU5WjRCWnZhMzFpUG14TGJhVWg2amU4WjZ3RDhpYUxYeEl2bnNpckp6?=
 =?utf-8?B?T29pT3ZJc1Y4YU5mOUVRYjR0WmVXSjMrQnJXdEMrdUtlTC9FWER3QVNBNkxr?=
 =?utf-8?B?bXlRMVdBejBta3VMc1doV0x0cGlNendsTGtvckN2MGZXUVBRV2lpa2lYTldj?=
 =?utf-8?B?dVlDZFQ2andPcnpUdVFTNGlhZXJ4dmxqVDdtcmI2WFJtblF2bGVEVXlsVFV3?=
 =?utf-8?B?TWJYKzQ1OWdNa2pGWkxKTjQ4RFU1NThQZUcxbTErUzdnOHhDaFF6NFdRbkRN?=
 =?utf-8?B?ckhNdG5EaS9MSklhY3lnYWhyTVJmYlpZZ2h4cVNOMWpkTzdEVHNzNDAvQk5N?=
 =?utf-8?B?bk4zK3VJZ005TENXbVR2UjVhWXR0Ym53Qm91VXNLRHFBR1lCc0lVSHh5azFO?=
 =?utf-8?B?N29jUmhMU1VDWnphWHdDRVR6cENzcHRzR3UxdWVVSTNZM1daYUJGU1M2VkxX?=
 =?utf-8?B?OFNlM0hVTGdTUmpVUm1CZ0JWZ29VZ3kvT3lzNyt6TzBSMEdHZFhvVTR3VEZl?=
 =?utf-8?B?b08wckRaNUowSWJieTlNamxnb3ZxcndsblpaTUwxdlpOOG51WXYvKzROb0lC?=
 =?utf-8?B?UUZicmhQTXlJRnhjbGNvTkZBTTdidVdtM0pZRnFraGlwRmZLdXBDYk5jS1pq?=
 =?utf-8?Q?GJSe8RJstrpGu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d3e2f93-e7c6-40ec-73b6-08d921d2b227
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 12:18:27.1571 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k1pVA7bMP0POSqYQFSY/btxKVkt4oKesxZSVoc42VJc1bDiG8KLNp+Yba1DawWh/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4739
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 amd-gfx@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 28.05.21 um 11:29 schrieb Jiapeng Chong:
> In the function amdgpu_uvd_cs_msg(), every branch in the switch
> statement will have a return, so the code below the switch statement
> will not be executed.
>
> Eliminate the follow smatch warning:
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:845 amdgpu_uvd_cs_msg() warn:
> ignoring unreachable code.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
> Changes in v2:
>    -For the follow advice: https://lore.kernel.org/patchwork/patch/1435968/
>
>   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> index c6dbc08..35f6874 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> @@ -829,9 +829,8 @@ static int amdgpu_uvd_cs_msg(struct amdgpu_uvd_cs_ctx *ctx,
>   
>   	default:
>   		DRM_ERROR("Illegal UVD message type (%d)!\n", msg_type);
> -		return -EINVAL;
>   	}
> -	BUG();
> +
>   	return -EINVAL;
>   }
>   

