Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA018579BF1
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 14:34:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D64D11B812;
	Tue, 19 Jul 2022 12:34:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2076.outbound.protection.outlook.com [40.107.92.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0228911B572;
 Tue, 19 Jul 2022 12:34:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k6HXYcnWMzLrpp8LyzzaEon5dA5CjNRiyts2utZYYaZn2q3kXnhs4MJjCdgnpD3m2NnC46j3YfwOpNGPYPtuz99GLAygOWJK9sGiKYI6NMJwcIyculi1/dyJ0kAOPRgnsqEnaY8b4GJhxKuFm4bikVKhV3Ndca2CGaqIHz3mGS8kMKER85rld4leyURi7bO2EhAFqB7+2Z46eyGjlmeAWsbeZnDHWPozL/LnilCclgH1G25CPpeGCtnDu5g6/fYNqKoIPF6oqjehkPa2Y8tLCPZ4TXnkR9jbS0WKQMXqEnK7VB1lhizcKnMZ7zawt4Ep0p0xu/miTo80WuVLFrpCFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ov+wvbAqSrLZITe9REL7kYxYFzmP15VlOgCAKfsQa2w=;
 b=BECzIPSFYb4ZwJmfoYgBOZLLlgL5kYbLqQVpSR7gNH6uepddKc/ur7zjL08VbbGyeFuOKCeo8iEpVpt0SuS5Xldyd0VLwbCBGyAGWsqns52xwgSzbDZ++G6UnbaxZaK1K9ApRoYFt9xophfMYNVhWC7htxTptRwT/WiC4k+vVVr1CDUBhhov0rDafWQduHe/YZANOjecJR0Zq23twekh9hU8TvHXYo4kLvMBdtRsa17JdlIYtxf6GY7F9Np0iQltpPsxDIzOlLdNGrJUPyepTWakytk1nMivS2di6pd82W7Er/UGgpITGIg6+JyQZbOpnCz+jCtH33Wme4awtS9PKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ov+wvbAqSrLZITe9REL7kYxYFzmP15VlOgCAKfsQa2w=;
 b=qq3NjdY78azeoEm6du3rKK+2yKdBfE0tbsNzepOe38CRhkxcY90Xthfsrt69eOif/A+OGW0xgpm3FZc22MTBghRXbcK6mfpRgk2s3qADpFnp0mJzXhKxc5Ir92IlGIN8U3Ely7kHSv6tfpPZNDAwnWTh0FVedJAmDQNfevP5qEA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB3883.namprd12.prod.outlook.com (2603:10b6:5:1c9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.17; Tue, 19 Jul
 2022 12:34:27 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5438.024; Tue, 19 Jul 2022
 12:34:27 +0000
Message-ID: <9012daf3-1fbd-524c-55b5-21e9c7c70327@amd.com>
Date: Tue, 19 Jul 2022 14:34:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/amdgpu: Fix comment typo
Content-Language: en-US
To: Jason Wang <wangborong@cdjrlc.com>, daniel@ffwll.ch
References: <20220716042841.40555-1-wangborong@cdjrlc.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220716042841.40555-1-wangborong@cdjrlc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::23) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15ca89e5-b62f-496d-ceff-08da6983053a
X-MS-TrafficTypeDiagnostic: DM6PR12MB3883:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aYsnYvTGLsJ31Ocxre2LKevmfSC0ReM4O4Kty7/nOX4+EK0u4TfjR9zBi8iv1/D2jjD2SM70nkI+DEz85V9TTWfmELtJEy5WZX7n7bYBWwJfV6LHo2IJYsSVnZ2xoODjghvWLoUOHMTVBvoMbB+j+dxqQFZJPYoLj4HgRa9BJTakyhTNwDakm7mQORmF1m0XYyol79rm8uAq2qrgtCbcEEuC1bRmWu+z+5k7xIfKL3o6DBtE5u1CFGJWWdGHHPqj0K9VA40y+rt/xOY6BzqnYOBRHFzOYQ37neCyCbzn1RtAr/rTPoMRdcAgS8LqVsGm0hzUm3aje5f4X8+XX69WU4H4dkn+SvxuarZ4+G6YOFDdQDeXpBxcOieVnz+pF92A/+tQGnQ4i84h2VCvmxICfAzM8pD3zoOz/2XtW5b7p6HNyRh8VztCAiwBfeVYhGeR/NtmtUGj1qba6JrMhsiG2T9rb0OE5MqPH6BUzd6x+FZPS/kl5t6eAn+lK8yI1lGleoLoZ+iVWDKfx0pxdbUUXRn4SJnTL5W82gRq+uyzNNtcph83PIBolASoT06XJ2z52MTtgP0Jrk88AzMCrQTHHBONUcg3NTt9ymLMKI6S2FXzPLSVMNChvi2WEDsRYm7V8fNp95wF6oo99GFpxWPaY0LL2O8bDLn9qXT7vu9m8TOR4QFh6qnCsUwPfprsRLJGRIdNsqyP0PYznkaF0JAZQH9PGbpPoDTq7z+p2Bxk/zN8I+5p2laonrJtmmDsSMi4CMUYsEmUGhRgHsxOvgjO3nvN9gUpGK3XLVHwW1MypcojflaK5ZN75vLSb3gJ9Ie3tXmFNhEgz1kUtzQCvNluQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(39860400002)(376002)(346002)(396003)(136003)(186003)(83380400001)(2616005)(38100700002)(66574015)(316002)(4326008)(31686004)(8676002)(36756003)(66476007)(66556008)(66946007)(6506007)(6486002)(6512007)(41300700001)(2906002)(6666004)(8936002)(86362001)(5660300002)(478600001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmpST1psS1VlNHI5Q0hBMDZPalJLRHdKQjdtcGdhbE8yTkY2aVZ3REdBUExa?=
 =?utf-8?B?NTFpMVNQeXpIY01RaEF0WWloc01EdWo5N0VLOXlHUit3K25YdjRuVzl4VjdN?=
 =?utf-8?B?cVB3VHdWdkpWcVl5eU1UcEx6cjBaYW5JT3VqTFpYbGVvQm54bmdCSHM5RlBR?=
 =?utf-8?B?bkJsMnkzN0l0eWlzYjlyOUFjSm9DRWdxL0g4VGdNT0c1YVJlU2k5OExSWW1s?=
 =?utf-8?B?SC9tdlFzZjEwZXJPdXlEd1ZUWlN5Zjl5VklzRmtnUkJCOUZ4YWNWbWhuWm15?=
 =?utf-8?B?M0t4WHFTY1VuYUpzbzZjbXpxTHFSdEM0SUZYSEpDWklNOERyZmw3aDRWNkt3?=
 =?utf-8?B?a0pBaDVkcUI5WUxITVRjWDBMNDljQi9XU2xWNjR0dUtaM3B3MEhDdEtUbXRT?=
 =?utf-8?B?OWVjR0pDUEl1ME1WVEw5WlJPREJyU3NRdDJ6eElodjZBQktySFZQYjh3Y1pH?=
 =?utf-8?B?cVRrOWlnOGFYcUk1OHowODA3SlR1d3JndDRIMEViOHJXakRQYWV6c0pqYlBR?=
 =?utf-8?B?SGpLaXVFNlVYc1JCRmFKT01Cd1lxY3pTd2drZVRtVWFQMzdrZFBzYVgwT05v?=
 =?utf-8?B?VGg5bC8rdUtWUzBLRDFRK0VzS1dJclg5cVAvdFdtZkZOVXkrNkRoT0ZuVlkv?=
 =?utf-8?B?YVh4MkpmYTByNHpjVk5Pa21UWUNrWkQ0ZkxPSS9lcEZKYi9FUTYrQ1BHK3Bq?=
 =?utf-8?B?czk3SnZuU2hwdnlST0dUQzZSaVZnNHNFaE9qcW5BSkY0WkxCZFFHYTFqOERw?=
 =?utf-8?B?dVBrK2tOYmk1K2pFRW92YkJRMC9xc05EbjBabC9qbXV5TlYzOUxFN0JLelE0?=
 =?utf-8?B?N3FYdzI5N1VTMDJxaFZKUnpOZzF6U2g5Mm05U21kNTdqQWRzcWxNcGhjYmla?=
 =?utf-8?B?dWZ0V0UrV2p4ZjkzWlBURnhXVmNNeE5pV3dnbytReHBoWUJsNlRzVlVhN3Jw?=
 =?utf-8?B?d3RSZmkyZ1pmbGtHbWtmcnJhU3ZKbTRTMXJtelZFMUdZWC9DUW1razVRTFlv?=
 =?utf-8?B?ZGtmbUg0d0JqcVM3UnVoQ0JoNjJ2b2dYL2RITDJhV0JzcDJtL0s2MWR5dXVu?=
 =?utf-8?B?ZkNqOXNFWTFQTnZxZG12anJ5a01zQUNPNnVHUkc3VzZTY1hodzFVZm5LY1Vu?=
 =?utf-8?B?YnV3cXdqbXQ1clJJY3dXVXVhMlB4V3g1Zk4vQWpEdUR1YTJVVk03RGpTZjZp?=
 =?utf-8?B?SDN5dXVmT3BNaTVraXQrS095QjQ2VktybUdkL0ZrNVBhRzFONDhmSG5lVmZh?=
 =?utf-8?B?aWhhalFSSTFkNmE0OEpDai9KTGVFZEZYUzNSZ1VyTkJqT1F6emx1c1dYL0tJ?=
 =?utf-8?B?QjdZT2ErWjhrd2UxK3BVb2l3ZmlXK3MyNWMxQ2dTUkNTcndJcS95RGFWN3V5?=
 =?utf-8?B?dHB6R3VaSzI1Y2hoREU2Z1lwZ3FFUEZ3MFVmMVNRYTM3NklnOFZvNzRTa1Rk?=
 =?utf-8?B?WDI4VXNJTkY0QWhLVW4zZVBlQmNjVXVRdVgwNUl1S3NMT0NxV1BRY2xRR200?=
 =?utf-8?B?VFcyNWxLY3l2SUJHYlFkQXc4eFdPcUg0Z3R1Skp0VzcyZEhnRWlRNS9nRzJ4?=
 =?utf-8?B?NUNvNEJiWkJadkVhNHA5RUlFZHdFM3NVaEl3YmdJWnFyRjhzZzhCc0VsblJ2?=
 =?utf-8?B?SEhTenN1WTM5TjQ1d2JNYWpQZGRzcGxxRno2S0tibkhvdjRYYzB2NEFoV2Y3?=
 =?utf-8?B?RHdIc3BNYWFVOXd6RlJyMkgxNCtDWHlLcDArb2NPZmwvUVA5bUFNSERKK21r?=
 =?utf-8?B?Zy8vQVNseWJTNnFPNEI3NkVoYVdXa3lVOXRuR3R1V1doOVlVbW1ZNmpoUnow?=
 =?utf-8?B?YnlsYTBYa2VBSzZRbXlnSGJBRCtYM2MwN0lEMTYyVGV1NC9tTm1uOW4xWDdR?=
 =?utf-8?B?UER2dFVKc1JidVhiUU1UTEJ1YW1mUUdTZVkwZUdlV3lSN2kvTjBoZmVYcklq?=
 =?utf-8?B?L3NqOGZ5TTE3bDZ1TG5RUzhxVVBrSVplNXlFTzNuZFdiTVpEMmpUN0NLVm5k?=
 =?utf-8?B?WmVFUmZzYTBzdjdoRjl6dzg4S0lKdlZhRytIQUVJcGhEZlFRU0RFalpWbFNn?=
 =?utf-8?B?RStRZURKcHY4ZGFLVE1ZZVZOUzd4Vmg3VDR1ZC92TWl4a1JuVGxhSlBBV3Va?=
 =?utf-8?B?cCtsVDdoYUlINnFBWk44VWwwNUdmb1FndHVmd24rTTJCV1FESVVmSEt6YUxh?=
 =?utf-8?Q?U5fq6xvtavYcV2WuKSmu29ZEsvbXWb+SHXcnBm4Qm1hW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15ca89e5-b62f-496d-ceff-08da6983053a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 12:34:27.8218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y7Wy9xsomQK9Dnp6bDzzs5UrOT+sLQP/JcqiiBYEAfnAnGRS1p9Z5JpzrZFXKLeg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3883
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 solomon.chiu@amd.com, kai.heng.feng@canonical.com, mario.limonciello@amd.com,
 alexander.deucher@amd.com, evan.quan@amd.com, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.07.22 um 06:28 schrieb Jason Wang:
> The double `to' is duplicated in the comment, remove one.
>
> Signed-off-by: Jason Wang <wangborong@cdjrlc.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index e3d139708160..b45cd7cbbea8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -80,7 +80,7 @@
>    * - 3.24.0 - Add high priority compute support for gfx9
>    * - 3.25.0 - Add support for sensor query info (stable pstate sclk/mclk).
>    * - 3.26.0 - GFX9: Process AMDGPU_IB_FLAG_TC_WB_NOT_INVALIDATE.
> - * - 3.27.0 - Add new chunk to to AMDGPU_CS to enable BO_LIST creation.
> + * - 3.27.0 - Add new chunk to AMDGPU_CS to enable BO_LIST creation.
>    * - 3.28.0 - Add AMDGPU_CHUNK_ID_SCHEDULED_DEPENDENCIES
>    * - 3.29.0 - Add AMDGPU_IB_FLAG_RESET_GDS_MAX_WAVE_ID
>    * - 3.30.0 - Add AMDGPU_SCHED_OP_CONTEXT_PRIORITY_OVERRIDE.

