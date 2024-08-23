Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5303895CF16
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 16:12:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4051F10EB44;
	Fri, 23 Aug 2024 14:12:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="S6JTYY3Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 116EF10EB36;
 Fri, 23 Aug 2024 14:12:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ANxnhr+p57pdYeqSjQN01OVtUbWhQijzdgebhCxeOjGiHgzowsLRoz+//vIpIOaGeJu+VtyWW2mrCQbdmbDQhOoyE6LTQyTihyGVQaP3Caowm26tM6i/dPr+cKP2fdbDIoTmYYI+ywL1FE9lBwo5w14d0Kc97On5B6bq60geGDLVNSmDBfq1+jDT0OqwdRcLZf71VyYJIb7w3EbaSjDeNp2Pa6usdxPdrjYJgbt9o0KVSq1uHWMz3GDhHb9lthXEafi+35KGwwCyh8yh1pkeyN/ug8wp1rgXxN2qnpIMTgiwAnupqU32GIYa65SIEUPEkJby6ZBBBQcUXWPH3zOctg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vTJBn8tVFnE07qRAaH7nws4WKXLhvyFC156gqe4gUOY=;
 b=hB/QH7odM4LF1RNTBmQRym5LRWDYKuCe02ntPq7Ypru6tq+vjtpMJyLVzDNRg+vTfFOjeyeteg1aCU6KsQvmeweEza5YDy3Q7wBRW8r64Uwrln2cjXsgIZkukrwD3uFyqbyl8Zl2qba1dlw/5uNvD8NAfv4oTAsN+9HNGn9hMvfQz6PUA9bbVh91FzqBG3Tp4Cwa596dtTLOOjKbnMUMSBmBQNRK/WDQONDX6JQcm3Z019rssVFsGKhVszVaAiOvRjvfwTkwmStWsrQPbAGScyjD6JoGDg1NT66fZtnxmKZEUWiWKBdp7+lwzQWCQUN98YMrBo2aowf40iCYnsq6Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vTJBn8tVFnE07qRAaH7nws4WKXLhvyFC156gqe4gUOY=;
 b=S6JTYY3ZrkIjFpjYBmhb5i65lL7nPIa1rxuLpqtmH0+HJAYUw4S5hmbhoTyuEg39tsCxbnGGuH1EugBRFUVHVty56qZz63t4QpUHSRfLgDuLXzO+eeHTPYcYH0mgVFvM0jQM+dqS6W7SqFpj4dgGKJXMXYmRP4+putV1iJpzgnA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB5877.namprd12.prod.outlook.com (2603:10b6:510:1d5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 14:12:17 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 14:12:17 +0000
Message-ID: <704af387-a984-4fcb-866a-1e95a22e50b9@amd.com>
Date: Fri, 23 Aug 2024 16:12:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/ttm: fix kernel-doc typo for @trylock_only
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20240823141110.3431423-1-jani.nikula@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240823141110.3431423-1-jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB5877:EE_
X-MS-Office365-Filtering-Correlation-Id: 453e9e9a-3390-4584-ac55-08dcc37d9806
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Njg2dVl1cXNXY2pCeXNDZEhVeDdKTk91ZTU4dDZ0d0hVQWNSMkxJUTI1WHEr?=
 =?utf-8?B?WVBrWWNQcHR0T3BGMjVySlVQeFdwYTVUK1NxRnAzd1A1SGVheVhwN25QSWJ6?=
 =?utf-8?B?THZxclFmSzFGN2pFdStzcExMY2QvZlBWV2NUbmNPcmw0bHJVOUc2TVE0NS83?=
 =?utf-8?B?Q05uZjVvTlRja25lRDRTRndtbllWZEVFU0VTMm1zQnBML1BkNXVNWEp0dkV0?=
 =?utf-8?B?YUMvTDBxR3o3NkxFcExrMU14VU9WdWhOT0lIK2plZnViNlVSWEdoWXl1SWUw?=
 =?utf-8?B?Y3BYWnZCSnNnNnlvU2ZJaVpzSG5qUFYyUjNtY3Y1a3RJclRSY1dDVHNrYkp0?=
 =?utf-8?B?eHVqQnRzOVZRZjhFcTRoN1duc3pJamFHTUlTNGp6aHJuZTFBcmx3b1RkVTZx?=
 =?utf-8?B?b25YTW9obTgzM0QrdkJMNjZKUHBJYU9BbHdNcEJweG9vaUpFV1d3R0MyVFhs?=
 =?utf-8?B?NkQxbE1ya1ozMExCR1lvczBmQVl3ckRHVnIzV0NIN1N6WjFLRmdPV2M3M0lh?=
 =?utf-8?B?Nk56QkViZ3VIUk5GTWxCSzBpUEpQcmNXSUo1OUw1NVFCaWI1TzMvRnJYbG1Y?=
 =?utf-8?B?ZFBQM2FJcDlxc05OVlNhNWltNXRnR1Q4UERTazM5UEM2UGU1eGJ2cjB6eDRj?=
 =?utf-8?B?aldVSlhtcnN3bHA0bzk2d1hsK3FmUzJtcUZmb3V3ZWVxZDhmYzJ6WTkrdy9i?=
 =?utf-8?B?K09VaVJvdXRnRCtJN3JUTzdMaDRQY0pOWUNvN2FTU0pnanJxUmtyaXlSU0gr?=
 =?utf-8?B?TjZ3MjFsV1RmVGQzRXJsVCthSS8ySjg2eHZwSGRzMklPYUdBNU9SbitXVXdW?=
 =?utf-8?B?MnkvcENMeDQxMUFuMW9BZ3JFNVVna1FxMWV2a2w1Vmw2SXg0VHEyeWVOZWEw?=
 =?utf-8?B?OXV6ZFFrQmR1VS9MdXdiaDdQUXVXbzMvYitnT1ZBcnRTU2xSOGNKR25qNU5V?=
 =?utf-8?B?allTaGFQL0VwQW96SEUveEpFeWdaZTdES2hkcERhZVVQc2VQTmFlN21VWDlG?=
 =?utf-8?B?ZGlUOVg5cFZCMzI0VWpOdTlwKzhiblU0QXYxajBnNDdUYkk4Y0tRNDdxK0NV?=
 =?utf-8?B?ck9PQmVuRGtiNFRCb2VOK2cwQ2EwWlJtZmtQTmV4Z3RpeXVTaGRhVHpiQkJR?=
 =?utf-8?B?R05GQWVrV3VPUElzRHZScEpVYmNMMkJsR2hrWmVGaXI2bGdSUDZSM05hZktM?=
 =?utf-8?B?Qmx3VVBaWXMzeHFpVGNtTWprUmltWGlrUkQ5UWFNQlhJb3l6ZEFSNkk0ZDVj?=
 =?utf-8?B?N0paS3VyRU10amNUT3lwNkdyOWhuSVB5clArM3AxLzUzTFB4N1lQcmlsOXhM?=
 =?utf-8?B?T1RHTXZ1NjE2dGw0TVg0Z0RPK1hOMG93bzV4WHhjeWVHMXc4emNvd3RaWE1M?=
 =?utf-8?B?SmQxUS94VmtBTGNzRTU1aVIrMnpwbG54SUhjd2xWQW00ejF0L2hKWllhNUx2?=
 =?utf-8?B?TlZzSFZOaUlOQkRCdTh4SHMySTdQc3Zkb283dng1ZUZRSVJRTmV2eE1jSFZo?=
 =?utf-8?B?UWFkMWNPOWliSnBIZHVKV25nOHVVL09Wb1NXRnRZZXNIUzlhQTNza05pVmpa?=
 =?utf-8?B?TXZmMUlQU1JKMTJRaFZjQWlaQTh6dlFyVXcrOVlkQVVTemthaFA0Rk9ZNnIx?=
 =?utf-8?B?V2Q4bHlQM2p5bkFwUFR1ZFFNQlNQK2NlME1hQVV1ayt5ejQxOVJYWEh0VVYy?=
 =?utf-8?B?djNkaVMzaFBaQ1lXbzk2M0xzZjFxT2dMTnJyN1ZCQ2Y0bC80SnJRV2U1ZTJw?=
 =?utf-8?B?YjZtdktOTXpoOGxaM1o0UnZvamxHWTRsWitZOXNOVytGdzNEeWJJdkdoR0R1?=
 =?utf-8?B?VUh0enBoMFROWDlOSkttQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emswNkw5TjBIc2UrQXI4V0twUUF0N25JWjB5eWxDOEtLYlFPSlVpbzVhS1Bu?=
 =?utf-8?B?VkpPUVZJYUd2SHVxdUM1djc2bnplMm55aXdmQzhCRnFkQ1VJblh0dDAwN3l6?=
 =?utf-8?B?aklLZElzOVl4eDkrWHBTeTNBOHh5Wm55TlhTQ2JUT0h1ejE3UmdEYVlxM3Jw?=
 =?utf-8?B?T3RabTVtMWZkN3IvRVFCYy8wTXR0RitCMXhRWlh5MFhybHd6VTBIazJnZXd5?=
 =?utf-8?B?RmNsZXJJc0d3dTlFZUxqY3prTTBKRU1JMzNkZmFqMDZEUjdzU0VEUExWUm00?=
 =?utf-8?B?NEo4MCtKU0Mxc0lMMkdqSVhLWFVQWXVTTHZmZ3psM2NVR2kxL0RYcFVRSzlW?=
 =?utf-8?B?TmpPQVNvenpDTXJMbkNvZ01nVGoyZ1kzWjFVOHZrY2tzMjhkUWxnbjVwSTQ1?=
 =?utf-8?B?dS9FZ1B1dS91VEhvUzRVMUFORUx2TlRma3pPV1NBYy9CSmc2TXhzc1p3SzFr?=
 =?utf-8?B?dmpmSGh5R1lNKzFSUG1YTDNVMVAyb2RxZzV0OGVnWVJRTGo1eFYxOXAyUHlo?=
 =?utf-8?B?azlpR0trZFg5azY1b3BLbTlKbWpNK0taR1RsajRmTTlBOGNwVU41V3B1UW04?=
 =?utf-8?B?dE41QXkxdGVkM1E2S3FsQ3pqSWZrak9JSXU2Rm1LbklzRlBQUmczcjl2bjFT?=
 =?utf-8?B?MkcxVngwZHlNWkN4OWxqYjZXSmZsd01ITXRuZmNIYkpCd2ZHSndDOWpDVzBV?=
 =?utf-8?B?cm1RUTZoRjAxUjNoM1RyVFZkZXR4SXVhbnU4Y1NQanhuREZSUkI5UjI0cTRW?=
 =?utf-8?B?WlBaeFZGaUxnOUt3cStoYmxEYys2SGRLbU56LzhDbmtZVmU5N1RiRzNtSzE0?=
 =?utf-8?B?NnpJRnpnczJCUVlHdUFtcHdEM3hWZjNFbXZZZW55UkZYZUJzNDdSMmZDZ2M3?=
 =?utf-8?B?MDVHNTlMVGpxc0hkTkI3WWlQMmltZW5ZMUxoMmlybkswemlqbUZKZFgrUW1C?=
 =?utf-8?B?TUd4NFhBTDlSdEEvOXMrK3dlNFNxb0VGcSt4ZkZOYkl1TWkwMVc0SEpuUU9s?=
 =?utf-8?B?ekFMT3dDMXFuVG1PbDdaTTZrbWxHdnBxV1RhRDdKVWNUY0U5MzJTYkw2ODNn?=
 =?utf-8?B?dERTM3F2SUdEeko1SnQxS0NqWElYTFJiR09pYkVvSHhzNlpKQ0xSMFVRV2th?=
 =?utf-8?B?UXFxV1pjcG1aSGVSckJMWWhHUXVKUExZcndTdU5WR2Era2hpNkp3YWl3SzRY?=
 =?utf-8?B?S3JVRUM3dTBzclVhMUVFc1B3NjU5TDJRdGFhVVRPb2VxcXhMV2daS21SSWRH?=
 =?utf-8?B?RkRUckM1cmRqbHJhTE1kYi9DQnpOUnRqbk1JUTFOdzJwR0FUbHg4TUhkVDdT?=
 =?utf-8?B?ODZMREorUjl1L1Rua0dMRG84Qi9QeHpGeCs1clNoS21NMkpoTjJWUjVHd08x?=
 =?utf-8?B?QzJKVVlUYkhMZkJTWEt6bFNoZldUT0pwdmF4V2p2WW9EZjNxdWkzZ1l4NGVs?=
 =?utf-8?B?UWw0RlQ1TU1ORTJPRGNkaWpGZHpGZ2ZoSG5uQVVWTmxkVS9sRWdGSVFpOHdQ?=
 =?utf-8?B?NjM2VUM3Wm1kM0QyMWU5U3hwT1d2UnJ6Y0hxVUJlSXBSeW5jUWVra3RwNDlO?=
 =?utf-8?B?UmxNL3VEZnM4UDhQbFpOekpVTEdVY0owMjRIZERkd2xENjJ1ZEVNckVFUDhu?=
 =?utf-8?B?TEpPVWp3aTNpRjRXWUtCNnhPMWI5SmlkTVdHUFllUGY2TWo1engvY2VGNEZ6?=
 =?utf-8?B?elRtRDBSKzBUWEsxdC9lS1dLTktBMVM2SGNIbFhJbm0yYTRjZHk4V0ZjWER2?=
 =?utf-8?B?YnlRemE2Y1VWcDB0dGtJd3ZHN05kRnNTeUF0NVFlMnhFZm81S0g1TGZiNUE1?=
 =?utf-8?B?MmxHMHE4Ny92bExRZzVYYUZ1MDEwZEtmcHNmd01vNnBzSnFzZ1VONEx6VC9z?=
 =?utf-8?B?K2ovWklIWEs3VmZ3WTQvdktESHphc2pyYzBSTTFzTEVMdVJVMnAvOTB5dG1P?=
 =?utf-8?B?S0dKTURzUFRvdTFyYUN2UDhwL21vR0NhWkJEQ1B5ZnlvRi9oWnNUQktJZVFo?=
 =?utf-8?B?bDhVUEttcVhwR0FqOTA2OU0zNEdnYjVERVBMdXpKMTB6enQvQUFDendnYnY0?=
 =?utf-8?B?OVlTNllKRzBmN1JXblc1NXZBcWVST0VNUW9lR3J2NDAyT2R1NEZrN2txWGdq?=
 =?utf-8?Q?ZpwrB79jDVt1YeDLeKDLvAa8l?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 453e9e9a-3390-4584-ac55-08dcc37d9806
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 14:12:17.0966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B9pdS2doxlzs7/9jAfnMa9BQENJVrwTu0gbxQI6vGEweCKskT3sbBYJUqUxaX6SF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5877
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

Am 23.08.24 um 16:11 schrieb Jani Nikula:
> s/tryock_only/trylock_only/
>
> Fixes: da966b82bf3d ("drm/ttm: Provide a generic LRU walker helper")
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Christian König <christian.koenig@amd.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   include/drm/ttm/ttm_bo.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index d1a732d56259..7294dde240fb 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -222,7 +222,7 @@ struct ttm_lru_walk {
>   	struct ttm_operation_ctx *ctx;
>   	/** @ticket: The struct ww_acquire_ctx if any. */
>   	struct ww_acquire_ctx *ticket;
> -	/** @tryock_only: Only use trylock for locking. */
> +	/** @trylock_only: Only use trylock for locking. */
>   	bool trylock_only;
>   };
>   

