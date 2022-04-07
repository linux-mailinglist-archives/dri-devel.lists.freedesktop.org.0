Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A306A4F816D
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 16:18:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F0BC10E077;
	Thu,  7 Apr 2022 14:18:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2072.outbound.protection.outlook.com [40.107.94.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B69610E077;
 Thu,  7 Apr 2022 14:18:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WqoyEEyKsj+pEH+1yg2gOtE8srOFhY0NtpjVI4iAQFqyrcoXIJFPOimAI2LAmW+4AT/FBJIA1bG2CUzBJs75YYrUiq71us9XF4QGU6y5pa94tH8bTpBw02+e4LwzhA1otAaYgG2t1GzLmFjHby9c3e89rrSfiuMuuGGfU4BH/VoUaf2aZQ+l8i4GA99ee7vG/IN+sopShS7HKpWTDZlm1vMsjl3lzqHhjc+t+q7cKq538I69B0n2LRHou/5rKeAfHVmTdVd/8gKBRZ5tOkc/rHjyCVfYI0Ug9w5rfOmTDm68keYMiEF8L0achWi2/D+rblrMGxMiYTQS30rgviecNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nL7Zlf06HnJeYBDy43Vz9tyqp+zvNXEe7zh9nRW39g0=;
 b=Rid8CT/roo6iTZg/6FRsZLS7ltZlylCvfydbTaRx69s+FWKQmZtOhFOQz1D9kP8TKm8n0dykUBXHeLrNCKHnY00kJIRaIYov0W13ZX72GK7PdKxaYJ/JeYCifdS4Nav618nEE5E+5V0i8juL71rnb33s0JXZtUnj6cxcJ9dgjw37w/aqOKPv2Kc/79CLBTTkkI+w62RrY6BaviJBgC9GKfFUBgcKSv0PZhVdqOPcDX7dVKKuU6UKQKZ3qsK0C1//pZZv2G3TiLCSqwfxpBzQxnyBBhSNgmT4ZM4uahesgYmu6KiYgVeeVcb1qwrdw6aXh4HvDuTviUiymQ1ViTqRJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nL7Zlf06HnJeYBDy43Vz9tyqp+zvNXEe7zh9nRW39g0=;
 b=ygxZlqSMG8XkywFzu25fFWsich+ij7FzJ/hzc7B3977IOGrdH9BHCFFbRVAmY4DDVo2faD8Bu06jClfYQ5CfsG27+gpYZdF1e3mRnErHkxaiVzC69bcn7bCQZpfwAFQMOZJwLIJ87PIJ5AtnRCfuaKQ17ajZRvg1qMLHA5wMIBw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SN1PR12MB2528.namprd12.prod.outlook.com (2603:10b6:802:28::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Thu, 7 Apr
 2022 14:18:19 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::61e4:a6bf:9444:31f9]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::61e4:a6bf:9444:31f9%6]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 14:18:19 +0000
Message-ID: <bb7635cf-461e-7abd-6092-4be67099c846@amd.com>
Date: Thu, 7 Apr 2022 10:18:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/amd/display: Fix indenting mistakes in
 dcn10_hw_sequencer.c
Content-Language: en-US
To: Haowen Bai <baihaowen@meizu.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <1649311250-17077-1-git-send-email-baihaowen@meizu.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <1649311250-17077-1-git-send-email-baihaowen@meizu.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0151.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::24) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1baf9db6-b5e1-4d80-d213-08da18a176c7
X-MS-TrafficTypeDiagnostic: SN1PR12MB2528:EE_
X-Microsoft-Antispam-PRVS: <SN1PR12MB25284B265E7837B170BA99F98CE69@SN1PR12MB2528.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: siZJHBOlwAjSOcw3WjI3rRAtqnJ2yUBGpniLVywP+0ekc+XFsicENX+C98n1tYEMt260C2YWOmfpQ7/EKPTn257a6aVdD0F6yNeyJxnidWOWMlhXnlV51rYrbrCi48nXCG0Ug5cTUgWaug4DF7W7PdFfNbFQvdE3fUNZzugV0thJOH5a5K3S4dOng8Pl8+QlKNd1oJQ0XzCAjvwXPOryL2d+W/Debk6fAjOw44XYyAjI9r5ATXAhTL0yjpzIcrkUkQ4pC1I7YGVZLDfGlMRUSgkXRlBj4q7f0ioAT9E7JtgkHlRtRoPVC84MQdCsZ4+Ac6lwpE0JB2kTeLBJGMf+9X2j+4HJhhWM8jRglV/YuBth+LoS/oepVAXPLItbuITeCSbgMerYNMCcBLRfDOmD/SA/vG0ONTyu37ZdM3+X2TQvUyEI1CECMlYo75i8OYEqZB7SJSngIvYzC/hCQbrMWarAgRC6OSgMbT1sVpY+euAejAXYyx3lttDVaUv+Sa/FiMshU3vDjMs2OpTdq6yBsKIETElU3GhzIOc2UAUSZGHGh2rWT7ZcgGdfPpaG26GaOvZuPONgeIoNYQ4E2gPkaeJst4xRiuIgTAdkevmAIVd2x37jkdlNTKk7Jq3yv3s2C1nNS5gCP3gg/h11rH+H3VZ6a987gMik+wjKmpLqzrH5lHakN58ivSCwthLJtspqoBOoTLRcjRyV839Ae7haBduii/wXYbFecRn5rZ+6Zcwh/ZJyOJPE4DZntt05VbVW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31696002)(38100700002)(86362001)(5660300002)(6486002)(36756003)(66556008)(508600001)(316002)(8676002)(8936002)(4326008)(110136005)(66946007)(26005)(186003)(83380400001)(2616005)(31686004)(53546011)(2906002)(6666004)(6512007)(6506007)(44832011)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3hlNzBnTFhHbzdMcUdtUHZhL0hDSm9TSGxYc2I2WHZkS3JwOU9waXFaMXI3?=
 =?utf-8?B?QU40elhzenAwWWNNUXhCNXJ4eUlkeVBTYjBBeGVLS3NiUmhNZXVob1hsaW5C?=
 =?utf-8?B?NnpIT213MUI3YkJCRkZLSXhvRURrTEtRRzgzTnprNUt1UzFndWF4TTBTZlda?=
 =?utf-8?B?c1dIQW5tYzNYa1lLNGg0Z01LenY0UUFNVWdQMjQrclk0bFBvU3NpL3hGMVg5?=
 =?utf-8?B?VW1hOG1wSjBTbHM4eHRsQnI5ZXM0b1F6SHRJWk5XOFNxV2VJcnF5cWFmekND?=
 =?utf-8?B?cWxybUNIWWdFRWtXSUhPMEFkS2IwdzYrR1JEWnZVTzc2S3VLNHNyTVFOUGtr?=
 =?utf-8?B?SU5zWC9uOFpaQkhDVjJnUGNLR2FSYjNRTTFjcDhiU09jME1EdndJUmJQSTJP?=
 =?utf-8?B?czZ4enIxNHpzYTJMWDJHdlZDUWEyMDg4WktZVS9IbmczcWExM3EvUXE2ejNp?=
 =?utf-8?B?aEpGQTFjNE95Ni91emhNYlI4QVFCVkpCZGxoYUJLUzhzUGdSL092VVVjZ3lE?=
 =?utf-8?B?UEtraXF3VEV5bXhuaU1ZVTNsaW5FdUdnNUoxYVRKb3MvVDVsMGZQanJXZnA4?=
 =?utf-8?B?Ylc4U3JQSEJxUnRzRFpkSXJ2L1N6ajFiWFdwTWo5cDcxMnJGQ3U2bm1JbFJi?=
 =?utf-8?B?TEJIajBpOFVQYnR2dFNpbzFCYlVTSlVqYmV6ZEFNbDY0SzIwU296STJBT3dy?=
 =?utf-8?B?TjZOZDhuNDZ1Y2RCOStLa3Jzb0tEYXpMdFo2R0lTVEZwQWtrMHFPYWpoandS?=
 =?utf-8?B?RkNnREdGUE8wZDhsb2NWcFhDeUMrd3JodDBHOWI1QnhVaEtwVlNPSTBLL0h3?=
 =?utf-8?B?RUtHbnpZMGhSd0NieHlQMk52MHpBWm1MMlRjZFEzTmFQUzFYc280M1FFeDdI?=
 =?utf-8?B?LzZ1Nk9pbjM1TFU0aXBLTEVLb1hOV2RyWHNYdG9ZREkwanlYL3RpaVRhamtT?=
 =?utf-8?B?Z1VLV3BEWndZYi9oN2dBY0NlT1h0ZHFvMTJ2NDZ2c0NGN1VlYS9pR1kwNi9j?=
 =?utf-8?B?NGZINWgvN3FPL3RuS1ZCbjFTdS9ZTk5VV3dpUWJ0K1BaWFdkQytxOS9xWHNH?=
 =?utf-8?B?dmRCMlZEbHdqYW56cU44MXRTVVh3SUxFVVZmdGRrcGtaWXBBM3d3bjFIcUN5?=
 =?utf-8?B?elNDUC9kb1FiZTYzb3ZyeWhob1p5RWJwWWljV3Bxd2NOemRKam81U0J0VXo2?=
 =?utf-8?B?NVBWRGpyL0w5MFlmVzlwbnh6ZWxsQml5blpERnRNTVY3YkRlWTMxcmtzZ21R?=
 =?utf-8?B?RUh5NEhlb05Fd0w0Mm5qTzd4MDNtd0Y5MzNMNXpxVmJRTnN1MmZLUTBVQ1dV?=
 =?utf-8?B?MmZ0ZmJQTWhDbGh1NkZkY0Q4M0ZVUVVtNDdPUUZOUGdhMFpTRVVnTUgyRWRE?=
 =?utf-8?B?MVVGaGFmRW51eFIzU2xURnkyTmJGR29id09qLzYvWHVuRXZvTW1xZThITlpU?=
 =?utf-8?B?TzFQZDFHZDcxYVBEZFFvcWc3R3NUdnIxd1VZYUxDbVFtaFQ4SWpVSzdYenli?=
 =?utf-8?B?MHY4eDBqSFpQRzdoQWIxMWZsZzd1WE5LckVXMFRBb1VnTG00b3JLcnVOS3Nq?=
 =?utf-8?B?TUllWEZlbkVaNWF5TVdyb2FaYUdKQzJQMjFhV055L0IwWTdVcjMrWFVpQk1I?=
 =?utf-8?B?U1J6bmcyYXlFRVM1cWpYM1RtNTVTU0d5RXVwMThseDlzYkNnNTg1QktpZDZj?=
 =?utf-8?B?UnQwakdNTldyZTlnNTQrRFd6M0VKV2F2eGxMOWdoZm93RjhnT2dBWEdYS0lv?=
 =?utf-8?B?K1g5Y0hJUDVjVUxOM1kwZHpNeW1VdCt2aHhrZ2xkTk5JeHhBMGJFM0lRV1dC?=
 =?utf-8?B?dGtPbjhQY2Npc240YUpiSFBCVUszbzJ3UkFCSXdEWklZeTVvSG9md0gzVW5y?=
 =?utf-8?B?SzBxNTlhWU9BUjNwb1pPY3lmTHA3UlYydXlIZHhtNnRMTm5sdGlOSzVGRG9n?=
 =?utf-8?B?MWtCRXRMNGE2ZC9YUVQzeE5rZG9FaTdwQUpybnozei9Ocnp6MnExNitTRXVL?=
 =?utf-8?B?eGRaaFhhditoTmUrck1EdDg5S1NHWURXZTV3QWc1RjhhSkFoTGkvMTQyQ3F3?=
 =?utf-8?B?MmN0M0grSFpJVEd3VVBueHBvMHFDNEFCdEZYVjJPOUNEb1orSHE3STR1SE9o?=
 =?utf-8?B?M2cyM1EvR3lDUm83OWFjTWtRMHMyMTE1b2Qydkd0andQVHJxbHcxcndkYWx5?=
 =?utf-8?B?aDBYTkdpREdHc0lWaG1laVNvVzdUMEJ4MnN0M1YxZUx1cnl3ekkzUmhDYVNQ?=
 =?utf-8?B?NDhta1lhNThwYWM1TFFOMnE4bTMxTGVyS0ZJQUczcHA4M1dIY085cU5MWEF5?=
 =?utf-8?B?dnJMK2F0WDMza3dUNlI4U2JRN3hWSk40dU9FNFlwWHpYcHdMUG9oZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1baf9db6-b5e1-4d80-d213-08da18a176c7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 14:18:18.9204 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CI/5WIw23ydwEpMySoMVOYtGFMvHr2S58Giqj/HXTdndtYGuMhbuEJM7HQqInt5PZOExKMMfrY1egoKiqCkGBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2528
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-04-07 02:00, Haowen Bai wrote:
> Smatch reports the following:
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hw_sequencer.c:2174
> dcn10_enable_vblanks_synchronization() warn: if statement not indented
> 
> Signed-off-by: Haowen Bai <baihaowen@meizu.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> index ee22f4422d26..3c338b85040c 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> @@ -2172,13 +2172,13 @@ void dcn10_enable_vblanks_synchronization(
>  	if (master >= 0) {
>  		for (i = 0; i < group_size; i++) {
>  			if (i != master && !grouped_pipes[i]->stream->has_non_synchronizable_pclk)
> -			grouped_pipes[i]->stream_res.tg->funcs->align_vblanks(
> -				grouped_pipes[master]->stream_res.tg,
> -				grouped_pipes[i]->stream_res.tg,
> -				grouped_pipes[master]->stream->timing.pix_clk_100hz,
> -				grouped_pipes[i]->stream->timing.pix_clk_100hz,
> -				get_clock_divider(grouped_pipes[master], false),
> -				get_clock_divider(grouped_pipes[i], false));
> +				grouped_pipes[i]->stream_res.tg->funcs->align_vblanks(
> +					grouped_pipes[master]->stream_res.tg,
> +					grouped_pipes[i]->stream_res.tg,
> +					grouped_pipes[master]->stream->timing.pix_clk_100hz,
> +					grouped_pipes[i]->stream->timing.pix_clk_100hz,
> +					get_clock_divider(grouped_pipes[master], false),
> +					get_clock_divider(grouped_pipes[i], false));
>  				grouped_pipes[i]->stream->vblank_synchronized = true;
>  		}
>  		grouped_pipes[master]->stream->vblank_synchronized = true;

