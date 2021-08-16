Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B06273ECF48
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 09:23:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E886D89C9A;
	Mon, 16 Aug 2021 07:23:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2044.outbound.protection.outlook.com [40.107.220.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACC9F89C8F;
 Mon, 16 Aug 2021 07:22:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=emIE4AigZQwzl8nUCB3XGgTkub0/sbHH45cgztJTUq3i1Wu/Bd9Hm0bBCPzbdN9e65LHBlahi1wVXw7urVsw/oKwoR9IFs//Bn0KhGwhCgLJJtb9ZYDUb7cn/65KcJhlKpI5qoXaaA5cRdlU3xM5ZhJTvrdsOo78TQ/P9bD5eplUbPIy1LGzDbPMWg/VNzUZZrrfoifmJHL2tQmGExpWUCpqdQDqSVbzxGjuy+D4vX5ZJio/7tX99FXSTuhyZae6PFXunlwaHC3vUh1KUla92vWwgD6eQPdj4vdFfCNkDQzJXZIPLeHBR3KhaoVEgsgqOxcTPV5rFv9wYIxoZxTMKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBBPRdzv/EIh54yLXbFTH6MFGsxLPhwoqoP09S2yB0Y=;
 b=BnnLYKoIb1BovFbXweVxJTACI5mnufm4/6F5RK7XfxePVEjrIjXGVvHInQwsfKyuuMg8WqZ6CJBYN87pzD/Lv+ncU69X4JFef839/gTWcv17otNQ1E1oPJfGSNX97aopAXDh41cekwYEO/kB+ritgVnLG/07YKOTzNqWBeFFWcZdWk3cFlkHHzQnA8OtvWeLoLZTnNcL7k2U2E/E6RXQJ3unP7QWdzV3nucMgB1n56yQxec520z9Ai0VszyOJ8hU1WzS3xzlxdSRedyQGkpJnQ7jVd6qCk6UhecJNDrBwJB/fkQTJTfbAapncDkYBOo0D+tdPrNOnRJKfaFLTUxw8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBBPRdzv/EIh54yLXbFTH6MFGsxLPhwoqoP09S2yB0Y=;
 b=qbm+C8SqJd42BdnPyr+WiDPx7iW3KVbPq5hlVHspCbd2F3d1/p0+zv8GYh/GdH0HvLEjrahu5dEIXN1CbO+iBrdbvTjrh4slsGU02Cj674nCJjr5M5ubeC57ue7BpESvNsNdDyrKZhJkZYDoINWGojJ7PDpnJUrioh+MPV+DO1Q=
Authentication-Results: googlegroups.com; dkim=none (message not signed)
 header.d=none;googlegroups.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3838.namprd12.prod.outlook.com (2603:10b6:208:16c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Mon, 16 Aug
 2021 07:22:55 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 07:22:55 +0000
Subject: Re: [PATCH] drm/radeon: Add break to switch statement in
 radeonfb_create_pinned_object()
To: Nathan Chancellor <nathan@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Kees Cook <keescook@chromium.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com
References: <20210815192959.90142-1-nathan@kernel.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d2e9b2a0-49b9-42fe-47fc-66a44bef3b01@amd.com>
Date: Mon, 16 Aug 2021 09:22:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210815192959.90142-1-nathan@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR3P192CA0010.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::15) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:7d83:fd8:eb16:8605]
 (2a02:908:1252:fb60:7d83:fd8:eb16:8605) by
 PR3P192CA0010.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:56::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.17 via Frontend Transport; Mon, 16 Aug 2021 07:22:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 313f7a5e-87df-43c0-e561-08d96086aa4d
X-MS-TrafficTypeDiagnostic: MN2PR12MB3838:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3838C43EB74DC2D10E3BFEFC83FD9@MN2PR12MB3838.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:16;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9mggssteOv+Od9ZkDhFQ6OlWF+kPQgdxL0NDOT4AA60yEyAAbYt9cCbzaarZZJqmI+qi1PeH4kYBrI8OBPoMYuxXQ3jW67cg+569gtfJ+CpfmYN+58hOPKafel5CgbYaoizBGTjf9q4BhprSthCeYXZ1c4465mR8GCtOQtJ5FwrbwQAIE6ujDqnUy60PMSEVSoJrbUEP/zmQGN1PRtASU9WHYh9QUkHpdQAI07MKi7Zm86433c8XPTUm71mq+oo8HnmXWWEkGkONt8Z47obPCOUuEqCzDv6CHAS1wSjoyenuAtqTcdlHH+0nJFFl2S/SXcRFga5ZbVOqBtYwo49NFXIqzhLgkf9y1nJYOLxFVpSqVyA1Pg4HqxBQd2mg4LwrrY5iWjNL4g8fXKh7Gu5DH9asf1VDx/A8ty8dR9T4cNcJXCWQHDHJmF/UOuQfY0D2orQjZq1+CjjGdQVmqweBQ/xLtvg5qLy6ZpIVLZHOh7WuWbWSd1X8197M8ZqIRO2crs6qL3CthsjhmXyTmjycAG2ynzdIu4GK+k2k1QN/1KFchalaBgQYCDP2SSwyReYfweTGVI2LZaj4ZrCcTgdqke91VN0S2az6GmbzRILOKLuq3wJoF/sL9WbXlkmgP9K3+08HaTxRI5pKgL38OKUyvcdD0TlfAe6iXMaoA7XXsDhhMnAQ+6SdWrTTlLoyPAN/Pu5ynxyVuvsyS67CODzWACar78PO41emgJrNxVli+L0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(6636002)(2616005)(83380400001)(31686004)(6666004)(6486002)(36756003)(38100700002)(66574015)(31696002)(66946007)(8936002)(478600001)(4326008)(110136005)(2906002)(5660300002)(8676002)(54906003)(186003)(86362001)(66556008)(316002)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WG80OEpCWndOZEJzSG9yUkxPc3U2QTEwMnF5Q08rZm1GVThNTkU1R3FxWVBK?=
 =?utf-8?B?WUNEZG1wb1N5b2RXZWFWay9oYmNwUTJlK0VGOEdkNU1vWUYzaHV6UnZIRE5n?=
 =?utf-8?B?VzhSYlZ6anNob2xtM0hoMFdBdlA3TUJFNjJYOXBsQ0FZYTVvUjUvTk9xRjlw?=
 =?utf-8?B?dkhVdnptU1hCQ251YXJVOThzanFzVDBBSmN6Q0tkVmVUcVphYjV3citrZURK?=
 =?utf-8?B?SldlcmtVS1ZCQUJ3TlZxRGhiYUxTZ1R0dHlscjgvMlNqNlNyb0taMFVnL01M?=
 =?utf-8?B?WWswbHRRcWhPYnhFYS9LcHIzR3JSa3VEZkVyY1JhWHBJcGhWN0FHbkt6TmdX?=
 =?utf-8?B?RWtBd09tM3poRkJnRVRvbnczTlByeEQ2a3pwbDhYdEcrR2F1bHZWRVVZVVI2?=
 =?utf-8?B?WXdaR1dIeGhvUFpKcVhNbnRJbFh1TE0rUlc2Uk5jNWhNOUJGd2Y0bmN5aWZa?=
 =?utf-8?B?Z2tPYkxlaDJNWTRyVFB2VXdjY2o3Sm9lZno3T1dPTTdwYWtncTRMMUpyVlFp?=
 =?utf-8?B?eTV4YThLd1pMVmpUdCs5SWhCQkt0VGJUMGdyZTNhN3hhWkR5a3VBZGZ2bVdC?=
 =?utf-8?B?UzQ3U09aS0Q3b1AzRndyQ2QzZkU0VUs4SXRVY0F0OTlsWThpRUFhK3hpb1Ir?=
 =?utf-8?B?ZENDK1NxeURubFZPblE2aXA2ckU3emhKNjVicGNJdXA5cURoTHVoc0FENFhU?=
 =?utf-8?B?NnlBRkJEWUtxemFvR0s5c1paTHA2cWt5d3pCTi9lNTlRc2tYc3BMOG9pSy83?=
 =?utf-8?B?bnBwaGdPUDI2enJReFhIVWphK1QzUDJlc0dnQkxyZk5FR1V4OTZrejdkK0dy?=
 =?utf-8?B?QjRHUjBRZ1JEbVJUcXFrWERackpnNkFhdVFlZjdCRDd6eEI2elBhblYrb1FI?=
 =?utf-8?B?UDFNL2g3Zi9TUFZ3dGdVUGlpOG9RZlJFMXdLcXdBSDRQSTk3N0JkVGFoVDFU?=
 =?utf-8?B?TldCakhWMS9BaXp1Rlk5UUMrT1p6bUU5ZDBIT2k2Z3RtUHIrd2d0UGxFZ1kr?=
 =?utf-8?B?aWRhVGVDUDFCMk5CNnRBM2dTRTlzK1NXMUY3UWowbFRKak5FNUVIWnUxTFlS?=
 =?utf-8?B?OW5EQnZvcjRqSzN3NytyV2Y5SUpUZHJrV2dMNFpvWEgyckovakFkbUplOXlw?=
 =?utf-8?B?b0xDRUlqbUNJTU5qSTg3OEVITE5weEg3SEE5MFVHc2huRm4rOWdIT0VySld6?=
 =?utf-8?B?LzFNMlJnWWYvanduY290cmpyWnA0eC90ZHN5ZzNIWmNvQllobkpIdlh3aGZr?=
 =?utf-8?B?NTE5WG5ZRnJCR3NrTFpWRmNDY3hzSWNQN0UrVjFuTDV1c3Q2S1NmMTVpbVFk?=
 =?utf-8?B?YkVHYmdBRXBzYmVXZjJDWFBNRE1VNjNaalNEZUxVb25ZVDNHZTVDWkpYWktl?=
 =?utf-8?B?eXNoSTM3YTlBWTBFSnNxWXVmc2hTYWZLL0RYMi8vdzNmN2JnL3RnKzRYUjA0?=
 =?utf-8?B?U25WZENNVGg2L0VZVWgxQzZJL2NVNG4xWExKSUZtV0tMZDdKVEoyUUYwK1R5?=
 =?utf-8?B?QkJDaC9hR2Rob3VsZ0hZRkpaZTRyZkhlRnhuRHpCZzU3SVpaZzJwVXNmdmE3?=
 =?utf-8?B?MkpvUTR1SXF4eDdpa2RQZk5nbkhwQzExVUdHaXBYNDJBSDl2WlFtcjNxeDlV?=
 =?utf-8?B?WEZma3ZvMVhxTFZlRUpZMXpqU1JmakJKMjJkeWtEV25hOVozQ1FRbmpkRTR2?=
 =?utf-8?B?bFB3cVdWaEx0MHhrVlpwS0lINzVNbHJPazNvTXdlbHY4Z0JOTmZDeVlMUnpO?=
 =?utf-8?B?M1RveEhRbmVHcndSMmlib00zV3RpdzBaanM3OUt3NWo2WVF6Uks0UjN4d1J0?=
 =?utf-8?B?RGFZZjkrcEl0L3FvMisybFNFbytCMkMrYzh3czZJME1yR1VXWkVzUlF3dFNT?=
 =?utf-8?Q?T549CP0ZiJGPH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 313f7a5e-87df-43c0-e561-08d96086aa4d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 07:22:55.0950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tTktETZPD31yV+tZu7jn2z1JMLN36pTTUD3a22S+qouIU6s89wDxmZqPjS95fwjq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3838
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

Am 15.08.21 um 21:29 schrieb Nathan Chancellor:
> Clang + -Wimplicit-fallthrough warns:
>
> drivers/gpu/drm/radeon/radeon_fb.c:170:2: warning: unannotated
> fall-through between switch labels [-Wimplicit-fallthrough]
>          default:
>          ^
> drivers/gpu/drm/radeon/radeon_fb.c:170:2: note: insert 'break;' to avoid
> fall-through
>          default:
>          ^
>          break;
> 1 warning generated.
>
> Clang's version of this warning is a little bit more pedantic than
> GCC's. Add the missing break to satisfy it to match what has been done
> all over the kernel tree.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/radeon/radeon_fb.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_fb.c b/drivers/gpu/drm/radeon/radeon_fb.c
> index 0b206b052972..c8b545181497 100644
> --- a/drivers/gpu/drm/radeon/radeon_fb.c
> +++ b/drivers/gpu/drm/radeon/radeon_fb.c
> @@ -167,6 +167,7 @@ static int radeonfb_create_pinned_object(struct radeon_fbdev *rfbdev,
>   		break;
>   	case 2:
>   		tiling_flags |= RADEON_TILING_SWAP_16BIT;
> +		break;
>   	default:
>   		break;
>   	}
>
> base-commit: ba31f97d43be41ca99ab72a6131d7c226306865f

