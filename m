Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C15189176B
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 12:10:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 639B210FFE0;
	Fri, 29 Mar 2024 11:10:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fX+4fFAQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2090.outbound.protection.outlook.com [40.107.243.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12DAC112655;
 Fri, 29 Mar 2024 11:10:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LNMnKSW247RD+QiW7Bp2O9cj3o+4o+UxVPR50GbHm5SanuGOhMTblFIEwYqkaa3LgbGjlujSdlwkP1jw/nEo9AwNvuQfOHx3Wll5n1OIaapc9lIV1Bm4ttEMhfSvrAT2kDI8JMvXwwLM0Q9kU74c7gdp+R0UKxyNZ+VFZUkCiyq0roZV6p8iZVVjyeiPI2sgU0+U+cbFvnfOVtibUnNWANBkaxPztxI6soIV1Xd95jF6NYavHVxTrcTf0+NMx9WqCXjxQAkoYmWMxM+tkyrVDYajPT6w5kdaUfYvEDXQwsu5HEsJSyR1HYifXRqZ1jOp19nfgJtiuGJpztJoAQ+Ewg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xNKq/8gNjEI+3jsSJH8lFsJ7jvaKAucIhnG7CDw7P7k=;
 b=KmoIwr/LOabN0lOLOHRcDiEFCOWrczpDdbI1ThosJelnx6KgnwnZCKd0hB2FQ6Fk0qsENhRWRgHhuzZVE+iBi5imGp0phJjaahgT2+4eLXdTeIlt5e+CvJzUeswxVWWrjBVSjODEuTpafBDM8E51uTEm2xPHQvDKOsmy4XdT0smpA3q9EG2Ou/h+l/vGOOxN7IvFWz44Rt4HwJrxdYvSZfmuT4v8wjlsWY9OHXl4naEt+4YmCIv7qrcadmaTqOM39kbQ7nLJ8FPJDFwpfXnLzyYBJ9QGWbKH/gMvQay7fp6pnZyKzHHzMS6Ztm8xofQ4mEDnfxscQV1Mx1XWPkmmVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xNKq/8gNjEI+3jsSJH8lFsJ7jvaKAucIhnG7CDw7P7k=;
 b=fX+4fFAQO6nuCR8IDkJw4HM/u+LmfbOLXjqpvRUfWF67QY1ETDH1OI1W34THaU5UlZqBMp5DfnTaf5YbWu5b4vmRU7D/eHs+vRTe4zo+94L+Q+RA1QJ+jsw+J4duSObx/MW4lYykzZEbkGVF91XtZHJ0Y8S2+FFwHfFVjL6teEs=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB8832.namprd12.prod.outlook.com (2603:10b6:a03:4d0::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.41; Fri, 29 Mar
 2024 11:10:09 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7409.031; Fri, 29 Mar 2024
 11:10:09 +0000
Message-ID: <f497b2d6-171a-46ec-84a7-cc148b39b992@amd.com>
Date: Fri, 29 Mar 2024 12:10:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: remove unused paramter
To: Jesse Zhang <jesse.zhang@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>
References: <20240325074540.2426476-1-jesse.zhang@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240325074540.2426476-1-jesse.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0159.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB8832:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: twwTvCa+zJNMtfEFIdvjCaIBspp2wpwcMfoTDlNzxpZbUaYslyQDER721Cd2w4MjY76/KCX5eCq3kAAgKwv1xtioIlFDfnB376tG8p3RHHCNt0xtDQnxIQIsNnuPmRMd24gxmFeaSf/10GVJucsJO57dDfFJQqiKzWv+eX4uH7ZMh6ga/deaDCYz0X5xsRWOG/IsEpGr3uKnZ184p/yvmZ4Vr5TYoMfZKcvBJzU4LHKKJz5PsDI0mlTo2hlZAur3y/8loB6xpjBj3ePFVyxyhUNm9mpquXT2e3se2ozf/XxCjwzPPEFWGqUoAXOo3ctlb2h4THXmZi6RZbq6qFugL5dsiV3JH7r4F22/Dn6TC58sA9o06md0v5KlXSEOQJn3S8YE38Yxwz3HmW9sGZPe3FnMs1IxY6cK39tRLCp2yDtcmDXQRVwo1yQU2J66OdpKACIZZF3Kn8fcBa1KbXydBOD8QvZVDuAjN4sqAEVug0XMmlehu1zYAfL7sjRszSCFUeTkeC6rxvJdt9FmDeOTM+2kY6qkbifBaeomx+2wti0860wSnhCch2IF4I942MEiLrARNWl5H9Ip3O9frHqX8MU8EIGDDkTWatLzCDCYzH+FrT8IvvI3BbSc8bwgF5Vja65comMG0Q5cFCq2zpMJUsGGAd4CVwBB5LA562EOTkY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFNpUlMyeTdPd2xMQTY3dWUwL0ZSY3U3K1ZEdk9zSHE1VjRqa0FVdVBvcjlO?=
 =?utf-8?B?V3pFSzhLUmJncUo0MGNuS3ZuTGVZMlVERDBYUG1XZmpaalFLWURuczhubTVx?=
 =?utf-8?B?RTRuSmhtSjdZL3hkVFJqMjExeFFJUmd6RUE5N1JvRWZqRUtsMGR4bXR0TWh4?=
 =?utf-8?B?d01qWVVvL3VNc3dJaE00dmpUQStPQTNzVXFIWU03SVM3L3hyTXdxcFpOcHZ2?=
 =?utf-8?B?QkdMMmFYWmE0dzMzTTVhUERScmN2TU1VS2NOY1RIT2VReWZsaEtGaWdlS2lV?=
 =?utf-8?B?QnVKVEtSbzNpa0tjSWhmUWVEbUoyTHF0UUNhbDRqWFVQc2dYNHYyREVJeExh?=
 =?utf-8?B?ajFndDVaZTNqYWVjZFk2UHorMTJJRitTUDlnUEhEK25aN0w0TlRzbHgyTmZj?=
 =?utf-8?B?QjVla1JrR3JsOHZ1bVVzaVpPcmV6NTZCa1VTNEk4MysyQ2xuOXVhdEpoYkMv?=
 =?utf-8?B?WVVETFg1VGNhYUkxNStjYngrdGEza0ZsT2t2QWduellzNnYxSktXdjkrdXhk?=
 =?utf-8?B?Y0Y1SWp6czRsMmRqQ2x3MUEwcTdVUEE1ZFh1QVFUOExteDAwZDVQQm9iYWIy?=
 =?utf-8?B?SlZDcmxXTER5Q0cyVkg2R1hXaUNZUnZ6dC9QMG9TV3Q4cXVHRGNqaERLd25s?=
 =?utf-8?B?MGpyZksxcGU3NG9GYzFQUlp4R0x0c1hTeG5Hc2Q4SDR5azRGanluOHdCY1gv?=
 =?utf-8?B?dEF2dHd2QXN5ellDa3kvbDFRK0pEZWxvWW14dmVRMnZBd3NPdTRibkZhazNj?=
 =?utf-8?B?Z3o0Ui84Q2luVCt4Mnd5L1JxVDVyaHUyVDhNay9DOUViOTFhVEhTeGo3M2hJ?=
 =?utf-8?B?OXZGNDVxUG9vSjlWTW9yYmlUVXV1dHNPQXlpVjhvMXkrcnA3WDcyTU5uN1Nh?=
 =?utf-8?B?TXpGeUVDMHI5NC9GQzBTV2dvTENzWFlseWdtQkhXQnVtZkRYUmFGZ2dCcU5W?=
 =?utf-8?B?ZExMM3YxT3E5d3c2bGZ2M1QyWmtLVXp2dGdZYm5iZXpZYmZpRFI4b2tRa1BC?=
 =?utf-8?B?ekdObndXd0tPYUtoZTFXWmxIOXRHYXFpRVdmbW81Rm9wRC95aDdYRzZ2bmNo?=
 =?utf-8?B?NG1uRVNXUFZJVjhsa1RBbVd0MEJ1SGFjQzlyY002TVFFVCs1ejB4Sk0zMnE0?=
 =?utf-8?B?cmlnTXRNUGFidktVdWR0OFBDeEpiSkE2cWtqSUlUd1VZclJxeDdrMTFaeGkv?=
 =?utf-8?B?S3lic25pbmhycmFHOWI0My9YdFFsOGVUWXAzRjY5S2JFaWJYVFNoMVpieCtT?=
 =?utf-8?B?SlpKN3hkb25JZlVZa1REditaak1rM3Z4dVhidDlWSHhQYnRBRUdvS0hkS0Ur?=
 =?utf-8?B?VGpUYmF5RTVGMFFsSC9TdEtEZmowNnVOOTYxdVgzSXh5MDZvT1NaQ00rS0ZO?=
 =?utf-8?B?OWNnWUlhbWVHYmY0TC8vajc4Z1hQU0NZcjliQjFOVXMyV09yb3d0SDFQd2VH?=
 =?utf-8?B?Z0UzVlZ4N1RwZUI5Q0VzV0VJZStaSGNheUI3N2RhenRZd2V3dW94VkhnYlFi?=
 =?utf-8?B?eGJqT2VzNXV2cm1pQktyUDJBWG1kNDNGanpWNnd6TDVBd2NlQkwyRjZPZ2NB?=
 =?utf-8?B?Y1A3dFU0Rjdmc3FTTFpWYVZ3aU43SVVMUXN4VG9vZGlXUStIcUdOY3lVSkJH?=
 =?utf-8?B?SnhBM1dKZ1pjM0hnVFEyWm5vbWhjeEo3bnhMNmNndXQ0bmpIaWFYZlNmRGZ5?=
 =?utf-8?B?V2JyU0UxdzVHWnp5dUxlTFZvaTVValBNS0NjUzd5L2dhVlBZVXk0b09lQnZw?=
 =?utf-8?B?UjVvM1lnRzJkUjRNaVFrT0p2d0xYNVNUM1NqbElVYTJBZDB4cWgxVStHd2hC?=
 =?utf-8?B?L0h1RjZMczkxRk9oKy82WXNpaDhvK2JMdzdvWWlndVdmTkZWRktJZUVjZ2E4?=
 =?utf-8?B?Uk00UGc1dEJrTDBWSVIwM0FFOVEyNFZabEgyR3Bmb2kwT3pFa0R4R1JMdnph?=
 =?utf-8?B?ZGVnZmJacFNXNWdnSmFBUTNZekQyOGpMOWE2UkR3UEF6ajBzOFNmY2xydjAz?=
 =?utf-8?B?T083SGw4M1VjSkVOMjNBaW01UDgxVkVNSzZVTVE1V2c5Q3l5VWU0dTBnbmJK?=
 =?utf-8?B?QTFmU2lPK1F5ck5BMW9yOUZyU0tnUFpub3B5ZEJmUHdDeGsrUnZXTVg1QTk3?=
 =?utf-8?Q?AJS7ptbOZZH7PXsEXRRKWPz8j?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22c2c895-22b6-4c18-9fd9-08dc4fe0cb8d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2024 11:10:08.9221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E8R20yh7pk5GlpKKjckBNQmG3/ztfnn172O7j/Q8GD+cPFkVa5aQzLKVrFrdeOCx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8832
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

Am 25.03.24 um 08:45 schrieb Jesse Zhang:
> remove the unsed the paramter in the function
> ttm_bo_bounce_temp_buffer and ttm_bo_add_move_fence.
>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>

Good catch, Reviewed-by: Christian König <christian.koenig@amd.com>

Regards,
Christian.

> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index edf10618fe2b..7f08787687a7 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -402,7 +402,6 @@ void ttm_bo_put(struct ttm_buffer_object *bo)
>   EXPORT_SYMBOL(ttm_bo_put);
>   
>   static int ttm_bo_bounce_temp_buffer(struct ttm_buffer_object *bo,
> -				     struct ttm_resource **mem,
>   				     struct ttm_operation_ctx *ctx,
>   				     struct ttm_place *hop)
>   {
> @@ -470,7 +469,7 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
>   		if (ret != -EMULTIHOP)
>   			break;
>   
> -		ret = ttm_bo_bounce_temp_buffer(bo, &evict_mem, ctx, &hop);
> +		ret = ttm_bo_bounce_temp_buffer(bo, ctx, &hop);
>   	} while (!ret);
>   
>   	if (ret) {
> @@ -699,7 +698,6 @@ EXPORT_SYMBOL(ttm_bo_unpin);
>    */
>   static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
>   				 struct ttm_resource_manager *man,
> -				 struct ttm_resource *mem,
>   				 bool no_wait_gpu)
>   {
>   	struct dma_fence *fence;
> @@ -753,7 +751,7 @@ static int ttm_bo_mem_force_space(struct ttm_buffer_object *bo,
>   			return ret;
>   	} while (1);
>   
> -	return ttm_bo_add_move_fence(bo, man, *mem, ctx->no_wait_gpu);
> +	return ttm_bo_add_move_fence(bo, man, ctx->no_wait_gpu);
>   }
>   
>   /**
> @@ -802,7 +800,7 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
>   		if (unlikely(ret))
>   			goto error;
>   
> -		ret = ttm_bo_add_move_fence(bo, man, *mem, ctx->no_wait_gpu);
> +		ret = ttm_bo_add_move_fence(bo, man, ctx->no_wait_gpu);
>   		if (unlikely(ret)) {
>   			ttm_resource_free(bo, mem);
>   			if (ret == -EBUSY)
> @@ -866,7 +864,7 @@ static int ttm_bo_move_buffer(struct ttm_buffer_object *bo,
>   bounce:
>   	ret = ttm_bo_handle_move_mem(bo, mem, false, ctx, &hop);
>   	if (ret == -EMULTIHOP) {
> -		ret = ttm_bo_bounce_temp_buffer(bo, &mem, ctx, &hop);
> +		ret = ttm_bo_bounce_temp_buffer(bo, ctx, &hop);
>   		if (ret)
>   			goto out;
>   		/* try and move to final place now. */

