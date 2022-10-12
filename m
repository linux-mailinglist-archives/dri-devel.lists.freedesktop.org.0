Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DACAC5FC5AC
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 14:57:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3071610E4C5;
	Wed, 12 Oct 2022 12:56:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::61c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A691310E4C5
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Oct 2022 12:56:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yhnh9Us8vVTrVpz9IU7RSaKQyJaiQckapMeqvc4SsbP2Cj6UOxJRMCKWBLSLsAZij7vGw1HBmVhwPzMdTw15iHZy0r0AJekpWURRugKljs8eWBzke+7eYRkBKTIdMhnqkEhSoiXZHo9uJhvCErmYtgB9s8e+OciAxS5W2O8knh2Sz5Vz/6mZFGH6k34CV8WHxqiafep4PoRAMDCpMfzjUVPF433lKu9z6g2wHqMqJQMbhitObUn4TnKTtptYz7L2GSKxvrJtaf3BuvNSowBsXj3z0FQlwDXaJYACDGRWStKoVKy6ObhueDKkoOVGMMm8TjjZFv/453TLmMBB8oRhtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9YE4ILTd71D4RHtXZzLjR0ACF1wGqKCoAjrqy8+ATR0=;
 b=mv4PldhbxpqKf27LkRA5BShIdj13/R0CBAk6Dt2Ut8ajaggyjzOC99qEN0NghpG66cO198bVsaRuI63sEZZv6U4tN+vUxUxYw8j856Y8MrAkKyzmU69ZPio+styHj1X3SCKF9yx10RrISIGqIf2fosD3z6Pup5y5VPK4y0MFNlHCVDl/qRI2EpxV2QdqDTSNs16QzBs7rXX5J9Ycq9ZF41oH6hOphSz6SlFAOk0KN2Szx1hNmbSKuCrtcEmlb5kKwWsplXxHSMB/BS0RaoFEX2YDFMmgLXGZd5vmPuPp4dDT4P0hwxV1ZxkwwnsCdj+pVXuau2hiC8ZhgESOPI7yGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9YE4ILTd71D4RHtXZzLjR0ACF1wGqKCoAjrqy8+ATR0=;
 b=bx7BglkEloDDjW5I4dlEhOlHNKwtZE9igQU+Oh9uJWE9Yhh3haZw70R80peOnHXB0qOWV/xwFY6E9Chp8E1kCOCz7OvYswGo4jVhax3DPesXGACEGaylKZD/LmWrKxKWub26oMSt3odWW7mGkJbWCbdrK5dUz4ZTJRJHoZvZ2lM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CO6PR12MB5443.namprd12.prod.outlook.com (2603:10b6:303:13a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Wed, 12 Oct
 2022 12:56:27 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::805b:58b6:1f27:d644]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::805b:58b6:1f27:d644%6]) with mapi id 15.20.5723.022; Wed, 12 Oct 2022
 12:56:27 +0000
Message-ID: <83c2fb62-dd6d-612a-e9e2-b45a3ef7d19a@amd.com>
Date: Wed, 12 Oct 2022 14:56:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/ttm: Remove unnecessary drm_mm_clean
Content-Language: en-US
To: Zeng Heng <zengheng4@huawei.com>, ray.huang@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20221012124735.1702700-1-zengheng4@huawei.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20221012124735.1702700-1-zengheng4@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CO6PR12MB5443:EE_
X-MS-Office365-Filtering-Correlation-Id: c6829109-cec5-4605-14a0-08daac512cc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O4A3vtTIXYuU1Z2woX5nYANYAqpCaWmMjVByn4OiFjXNEvs9J2by0Kya3g9+Bg/aDiY73mLib/J/pdu76T0Q0kdDm8Gtg5rANbQXaFmreoyjrpXgwf+UP69hBUsmLkkBZD33UuRPlFnWgG6iiUDBLNjwnWEbJVDzH8+yoYb0t63A2rYF5CEzh4AR5OUvTRHiM432ZTOUy0Pfr1FQqs7YzJXjKccEw9BLO3qhizswY/IFphWUdWziuVNv5lHXwXhlSD0yfPXoRcKaTmZIN1Tq7Sc4Ar8BXzb9Ch7z6+EPN/oiUH1kcr1Z0SrHFI9DaSJ6KWZUVCaV2zUsZd6iKGP3tX/a+dQfNkM0+KwrBdO/qoDnyV9LPfCUy40uLVe1UB5+V+jatlCll9Avk8s9qqOsuKtxsioKYYGVpNFm/LdhvXnHsCJYym5xnIFGP4cz6j16toz+Kl2701YrHp2w3YpFM2ej0K6HJVZA3hXeWNpkCBXYXxEnBT363/Tj7XGN9FuELyxtz5PLxL6L+g8jlVAtvpXvItSO4oeO6oADOrSRg7jrpaFG82rBMc4ko9WAfnosJGvZ/9kfiE+0MCsFPLH4JZKwsGkPi2JY8MAMfUY6d8tSwiCEYrIcUNRtjppViOLTMtUzFKq9CwlxcqP4pQINZRHoSEnVcke/EZoraQfSTsQ/pLqX9G2m3jYbo8dBkGQIaaDnNtlQHQqSpVmmX7qwwX1BGrWOhgT5GhshYp8FWeRzuMWAM+sn5dBDKjITwiyrkmpz/GV8MJ4WYCobrbDlmlM+DPzH2ZPEfYeQD5bPuFM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(366004)(136003)(376002)(346002)(451199015)(316002)(4744005)(2906002)(66946007)(66556008)(66476007)(8676002)(4326008)(5660300002)(8936002)(41300700001)(6506007)(83380400001)(6512007)(186003)(66574015)(2616005)(478600001)(6486002)(6666004)(38100700002)(31686004)(31696002)(86362001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEJMNW5sZDNCRlQwdXVRaGJXa01yYk9CTzgwdXMzWjhNTWs0ZEtqWFR5T1RV?=
 =?utf-8?B?ZXFqSmVXZkg4NlJONXBFRmEzbE52b2swOEVtVC90MVNQNlkzSWZuckIwZU14?=
 =?utf-8?B?QzNoQ01NWHBUWFh0WGNTdWNrb052V3NSajRMajdHaDVGeitnMnBuQVR3c3R4?=
 =?utf-8?B?WVZJMlRnU2NPZzc4QlVSRWlYS0ZVTWNmejlSOStzc2p6OVI2T0FUNStmNTNT?=
 =?utf-8?B?MmNnVjJnMTJzTVRmcXovaXN6a1lmanBmQVFVWWdlN3pxTDZZbEl0enFQb0wv?=
 =?utf-8?B?Q0ExZ1BLM3RTUTExN1VuSTZUdlgvZVVzQjdRWDlNRk1rb0k3UGNQV1AvcTlJ?=
 =?utf-8?B?UEtBc3ViNVF1MmIwWjAvRkJaZU45V0JENm1MeXc4L3M5R05zVGdYaStBSyty?=
 =?utf-8?B?eTBDeE5NZGJRblJsd3kySWhRUkErVXJ6dGNYUm8vLzUxWUxnTGw4bUozdGFh?=
 =?utf-8?B?Y1IwWUFFdlI5QVVTV0xVL1ZaRXV1eFBQWVd4L0ZjcHY4d1dCV1BCaCtKNmJW?=
 =?utf-8?B?MnRMcWNKTjNYcVlURjZXRWhDdmRYd3VVbStWMSs4YWRRMTFFZjU0bWY4WGEx?=
 =?utf-8?B?NzJBdURoL0pMVVRRSjVrdmJSQnIyUnBzakNURlFsZCtjN01IaGowM0hRZTNq?=
 =?utf-8?B?WGxPeitGb0QxQWsrSmZYMHJjdG9LSTI1VVo1RGRhbXZpaGZjcVM0VXMvZHd0?=
 =?utf-8?B?c0NZdGQwb2xkT0N5OE9QNHl5SW9xNGtlakJDK3hxaHZ2VXp6SUM1a1NvaXJn?=
 =?utf-8?B?OEcvYVZvM1MzQ0ZDeks3WnRZQmlxMVdFVm5aVFErSitJeGE1b1MzamtrRU1Q?=
 =?utf-8?B?OGhmQ2krbTRKcnJjZm9mci9vdXZDYWFLYlBwNVlSck1mZnltdUNKTXVzVHc3?=
 =?utf-8?B?RW0yK1puL0k0OXM5ZU9NSEV2NFUrWmFBWXZDTitkZDhLbGRqa2tDcUpGeVJR?=
 =?utf-8?B?Rmd0bXVsTmJoUUU3cGtkRXNaUERFM0k0SHc5djVGYTZ5ajVkZllGWS9zK2Rw?=
 =?utf-8?B?eVVsVTNBcUZBMTBLR1Z6SHZMbDlIcHduT0V0WlhDYVVNN2taZ3NaSWtRcUZT?=
 =?utf-8?B?S29TMWhoMnQ0OWRaUTI0dkZEdm0zTm1oOWc0T3RMNFp1cDNIU1ZDU255QnZx?=
 =?utf-8?B?dzA0RGt6TmVNakt4d0tRcGdwM0VuQzllNnQ2N2RNeUppYVlRN2h2LzN4STFr?=
 =?utf-8?B?c2hJK01lWVkzV3V5Si9qYjluM2ZhclRLODJuNXljUEFyZUhDYVFTeFpOL2lM?=
 =?utf-8?B?MllRVkVKVG9lTzcxNkViSmk1c3JMejVPWGpyR3B2eVZVcm52Ni9xTE5JNFg0?=
 =?utf-8?B?MmpXeXBGZWJxOU1MVDJxQUVhVmZOaVhwbEw2RkZwemc3alVPTEFMUHBLSXdF?=
 =?utf-8?B?Q2l2NVBJK3J6U1YvTXNGbElRcFlidTFEb3FQQnQzNzlpc0dYaTk4aDB6Y1dE?=
 =?utf-8?B?bjRHR2JzYlFRM29mMGpxWWQxRUxINkVvNWpheS9YaGltUURLc3lWeGtKck5K?=
 =?utf-8?B?STF2YjVlWWdFaFlrRmQrRXhrTmJEdzVpa2ZCajNYd1FHODBZU1dland2UHVi?=
 =?utf-8?B?eis4UUJmSXg1cmpDNGxEZlY2aDlZRElLOEo3OUpKc3MyMEg1bFpsSG9LUFVx?=
 =?utf-8?B?Y0xkL2dmSTkrWWlFYU1DNTQ3ZWpiWW9iTTM0MWxlZ1hDSDF1eGNEaW5SaG5E?=
 =?utf-8?B?WkdIKzJmTlRIVnVYaXFBQTJXRnRrRnBnNVZLWXNZYjFnS210M3h3SEhzOFB3?=
 =?utf-8?B?Uk9MN29jUk9sbS96Znc2WXU1ZzFVbW1BK0cyMG9ueUFEbitzaTFobXR3VVhk?=
 =?utf-8?B?TVI2UWo0SVBERGdUQzNRaWhQbkVWVTMxOW9iQXpiVE5BNnZzUXU2RUM4dHdM?=
 =?utf-8?B?M05BMjBxOWQ0RUN4RXdOY0pXZWx4akVBZmNGc0oxdGFqbTN0V1dwQmFtUlVN?=
 =?utf-8?B?TkRoenhEQVJ2NXVIWWNJK21TTnI4enhQNW1NaGw3dWtIdjMrdWhVTlhDWHE4?=
 =?utf-8?B?MEluWXlHZVNHUDJaSEpzRjZYWEF4QWZweDZabHl2a1ozZ2puZ2pGZ2NQeTkr?=
 =?utf-8?B?ajZXeXgyRWVyL1EzUEhFSkw5VGhEWmtHem5WZlk0eXNxNnpPVmlNUDJYQlJH?=
 =?utf-8?B?c0prc1FRazRZdHFwdkRTU3o3bThHVDVBVjMwaVNyTnhpU2l5SWRBSzJVMEV5?=
 =?utf-8?Q?5wEmMKmNmybK0ozbeFTtNHTH99IGzWJm7Dkzx0C4DO0o?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6829109-cec5-4605-14a0-08daac512cc9
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 12:56:27.2394 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GWXWfuLjOUcJxrs51sdA86KlDzRG9e3L12TUOQwL4df7t1MvxtnMlJa08e7Kck7t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5443
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
Cc: liwei391@huawei.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 12.10.22 um 14:47 schrieb Zeng Heng:
> Remove unnecessary `drm_mm_clean` calling in
> `ttm_range_man_fini_nocheck`, due to effective
> check is already included in the following
> `drm_mm_takedown`.
>
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

Can you push it to drm-misc-next or should I do that?

Thanks,
Christian.

> ---
>   drivers/gpu/drm/ttm/ttm_range_manager.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
> index 4cfef2b3514d..f7c16c46cfbc 100644
> --- a/drivers/gpu/drm/ttm/ttm_range_manager.c
> +++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
> @@ -229,7 +229,6 @@ int ttm_range_man_fini_nocheck(struct ttm_device *bdev,
>   		return ret;
>   
>   	spin_lock(&rman->lock);
> -	drm_mm_clean(mm);
>   	drm_mm_takedown(mm);
>   	spin_unlock(&rman->lock);
>   

