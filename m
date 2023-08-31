Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC59178F31E
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 21:13:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F19E10E6B9;
	Thu, 31 Aug 2023 19:13:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20618.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::618])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BEDC10E6B9;
 Thu, 31 Aug 2023 19:13:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jEIe7DDraeu1r3ulY4IBVYqrxkscJ+bdpGCNulBlkzw4ut7jtImDMh7Gfx1LzXr5fIotNp+hFVoYhqB9jHxjUOlT2KVRyY1euIcBK8L2yqfTiCINcMKY/52CyNort04c6D3Y7lhFln+2/efzBV6Hth7MuHLeU5nH0NKQCP7N3/DlsKztElGZHNZPIVAvruO4HM1pjem9fKyDqRD3uXr9f9ZYoTcfVOO0SX9DzuYL4n2GyMcmTGBfA/EIQwe+R422j+OENB94khGP4O00et0Nk91YzAduqfhvBPBM1k1bRC1jeIxqXL4/TsPGrWm1fO5GKaqrVbJpUgLKD3eq7NhrLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FrmuSdUNU4k0o/rBQBYgfGGhhSJn6cpsR2j+tBK1jhQ=;
 b=Xo74BM/bFLWS7ADB9JuC1hHkNLvWB2xdgNUw7iCocb2rmtHBZD1/ASMA8Pd+TASE1NGWwi4e0FUSeu0lxLKpbp8S3AHQpxB0VWHCGm7WO68CK2YEUXmnFwPEKo1kY3h4ntFWVKlW9OTCIhTVbUXVwg7ff8W9jwYeepkqzaywT+NbIzSHjOqNR96QolYkTRZETzxpAbQ30yVs/YaAgbOiXImjiTc9m+qHqV8mgRSs4ZDM85vAIJ3App+IOKQ9lOV7nUIGHIi8OyAG9At1wFrc9svT5VBFEnqghynn2Nt79ZCDkEPWqnd1TmkOc5d86Xj1Q3VXS2zI4ElUcgUPe68yvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FrmuSdUNU4k0o/rBQBYgfGGhhSJn6cpsR2j+tBK1jhQ=;
 b=EyfF7GISGdlG5eJxD+vIkxT50AyIt1nMUuN+ALOGP1oCryVJMe0ANlesc2HQedarO0NxG0duAZYVv8SfyfIFeuBaKaaD5BalHlbnukxoJKt7ZJXYl0PL1TNIC1wlzvcQOfF30J6xGRwCKtZKJIa6Y0GVsf2vQo/OrGPBzpOaRn0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DS0PR12MB7995.namprd12.prod.outlook.com (2603:10b6:8:14e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Thu, 31 Aug
 2023 19:13:26 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f%3]) with mapi id 15.20.6745.021; Thu, 31 Aug 2023
 19:13:26 +0000
Message-ID: <9689ecc6-5570-41c4-99d9-19ce4fcea8c3@amd.com>
Date: Thu, 31 Aug 2023 15:13:20 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "drm/amd/display: Remove v_startup workaround for
 dcn3+"
Content-Language: en-US
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, amd-gfx@lists.freedesktop.org
References: <20230829201042.322173-1-hamza.mahfooz@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230829201042.322173-1-hamza.mahfooz@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0273.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::22) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DS0PR12MB7995:EE_
X-MS-Office365-Filtering-Correlation-Id: eb6450d5-0957-4139-d9e3-08dbaa5659c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vd3oEacZ2XMqGGhXn9Y9eowrrr1AlA/KNhpOIbIT+fHl2igzm4xaOTWZeLumz54WZgcO76/D2vbItBLEirv9QZ4MOcZDFo0EJOr8z1XkvxGBEboj3TfUO6dPcQNelDS++EchJxzJXdsAXQJasjPc2FOUwY8IK6cM7P1/i165rZOoCcQMUOVXn0J3h/VAlA9pv+vW4h0uLSe3p44t10pvuL4apwL7dxTvPh1Er+k4+nmvSOKIzZhZSRln9tzr5PJCXTnxdrSUjhEnvNhsCzCCkxWwu9UQ+bOBMpVgHUyjphsTxdQIHvXxiXcivDMES3PJwtZNV/VEwBqfIBOFKBUVGvNa92fQ4Q0+aGvD0ADJ4Ftye6/D4k/8IBxSaQd4z3QCcrZIcUsDXBrt67yMjf8p2oUu9JvTS02pQ9b19gkZpoGS2mZknr4IqkLi2A1Zs/ETUQm1KBtHE5Z6pD7Q7pmJFk8pQwiBM3R2wenFwp2Gj64QTBFo6h7XDq/SA9eEIWQ7K1T6ygBLLgU6YMeWJuWNsmP+qy6QQWGOTFaWCbIlTMRSeuySiko2kYysImjS7YlC9L7qVZ5Wzsy3k99OWqtWRCgn7/DeFbrYrV6Cs7EvGktraY9Q3pZDNGfhL4iGWIy1oERttCqE2UqEik3ZWxX38g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(136003)(396003)(39860400002)(186009)(1800799009)(451199024)(41300700001)(53546011)(6666004)(38100700002)(478600001)(2616005)(31696002)(6506007)(86362001)(83380400001)(966005)(6512007)(6486002)(26005)(36756003)(66556008)(66476007)(316002)(66946007)(54906003)(2906002)(5660300002)(8676002)(8936002)(4326008)(44832011)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWQ4UVlnWkZEYWdYS1JKeGoxTXpZN0k3M3ZXSVJJQWkzMEhvUnpGMGxVNWhD?=
 =?utf-8?B?WS9naEc2eWg2ME1oZWZ6RkhWSEpZMGxEUExBS1NCMFdRZ1l0YlhubU5XQWhm?=
 =?utf-8?B?S3kxOHVxbE9hWjVPOGZOMlBuMktSbVM2TG1JLzlIZnJlZ3VoNUFiL0xveHpC?=
 =?utf-8?B?cDJva3pmRXBJNW9wbm9XbFFxQXhmRXBUaVZuUE8zYWgwOXVYYjhVWHB2MUxZ?=
 =?utf-8?B?TVc2d1E1UEtVTnBCUWQ2cUFiOHdySk5TSDJieEdJckFwcXJQekNSM1grVGVq?=
 =?utf-8?B?Y1BDTXB5S0NURUxkUlpXNXUwc3NqZllmOEdDamNxZUpkTXVYWnNpWTVBMElo?=
 =?utf-8?B?NG9jdTBhSzFSZWRrQTZSQ1BUYWVTbytCdTFmeFpqSTFhUnFOZXNzYXJvRFFr?=
 =?utf-8?B?UUNLaEtMYVVzN2hIdWhOb2E3d3dFWjRCcVpwN3d4M3FtaVM3WmE0MC9TMFZm?=
 =?utf-8?B?S1NSV0ZrUGw2M2R0OXcxai9YdU1nNTZHVk9WUnVTY1hNM1hxVmUyaDJKNlB0?=
 =?utf-8?B?UFZ1dWFFK3kwUjVDaXhFQnEzUDJIQ1ZsQTUwVUxzeDhuR1FvRmZuMjFUUW1P?=
 =?utf-8?B?U0dIMlBTRFlyTjQzZGdtNzlsd2NNc0tHNzJVbHVjbm9udDBzQzE0MXFIWitn?=
 =?utf-8?B?ZlE5eGNQTG9UcTQ1MXBINW1IY29KNEpvSW4zc2tia0QrN1doUDg5QW05bXNZ?=
 =?utf-8?B?c0hwQll4azE0WHJwUU1HdllKS244NkNrdjZRUk14NWJYQVlWSzhmeWxYK3lx?=
 =?utf-8?B?WU9tUTc5NnF4ZW9oZS8yaHhOUERaY3Q3TGExaVB3MlY0dnorOFZPUnFvZS96?=
 =?utf-8?B?T3hnZXBuZkxhSTFaMklET2JqK08vUEhvajhCYWphaXFKMmRkVDFqNFJJREk1?=
 =?utf-8?B?MUpMSjkySHhlYjlqSXFOa2VkUVErVXBaSnNRekQvT2FDZ095SUJWRFFjdTVk?=
 =?utf-8?B?R2FLamhaZERVR0pVbXh1cVlrMS96WFZsMzJ5NFhrQXdiNDlzdmsyWFRaT05O?=
 =?utf-8?B?UzhZODkwdzErR0Z5ZVdPNFMrdCtWWVhkNmxsbE04RXJRbWFKbjMyTmVwYWw5?=
 =?utf-8?B?d3ljR0p5cnlQb2g1OG4yWnBSVmhxWVFXZEUyaE9KQWl3RjVFbi9TakpMZmVB?=
 =?utf-8?B?V0owOXY0WUJzTXQ5ckgyOUlQOVhhTWtKRThKVjJURWlZeXNEZm9OOGpQdjJh?=
 =?utf-8?B?T3M4eWdMVU1sZ09wQ0pXeWM5SHlwZ3JuYkxmK2svVnhmSExpemhkWUdQSm1V?=
 =?utf-8?B?cWZFY1VPL0Z0US9Sbk9iRVZMdVU1V0xjTjUvRXNRZlVOSXFhVUZzcWtwVnhP?=
 =?utf-8?B?TnY1SzZIZDlOUzJQTXJlK3Fxb3AyY0hsclBLYmFuSnRibk5zZXBQUmJneWRC?=
 =?utf-8?B?QlliYWtMd0l6MjE4R3JpbUl5ZnZDV0lIQUVyTXJQR3l0K0RCMDBMOXJIVXpq?=
 =?utf-8?B?d2NBVGNiLyt3UW1ZSGhIT3o4V2VGVjZxVWtDdXB3QVZSMnQ2TDhCRU9Ma04r?=
 =?utf-8?B?SGVxM0ZhWXhxMENpbHd4QVlnMWVkT2RrR3JnZkd6S0RCZDNnSkZ2MXlnYlpq?=
 =?utf-8?B?NnAxbitlZ1RSVmJvL0g1U1hlOHlrL0pGb1VHUFZMVnhMamFndWF2bGVjZk0x?=
 =?utf-8?B?ekZ3NDI0dXZKazBMT3NMM3Q0WXNsUHJLbDRmUDRyYkp4YzNLSGlvSzU3Uld2?=
 =?utf-8?B?MThPYy9EMStvcUNQV1d4Tm9LR2tCL09BbTVhSUJMcXc4WmE2ejQ4Q05pc3NP?=
 =?utf-8?B?cEhHS0xxVDZWcEJEaEVOaVo2d3BJU0hUdVk2ZWtKS2xkMGRLWGFnc3NDSXBt?=
 =?utf-8?B?eUhIZU85NExEUzVlUjNpYWtQV1AwZlJoWkVIemtRdmxsYlRRZ285R1lSZWlw?=
 =?utf-8?B?cjU4U3FoellZT3NrOUwvWk0yUThBcXBHcXhidnBZcTVpd3BJd2s3bkt4TjRx?=
 =?utf-8?B?S2l6UkhENElMclVVKzZHWlc3blNpVFRrbzNLMEZmUGdxeXpyT3EyaDhEck1w?=
 =?utf-8?B?SzNHWFU2S29oeS8zSVc3dlMyLzhsdHdvd2d5MnZyak5BbzZWbG9YazZqZ2wr?=
 =?utf-8?B?Y1ZzeXorTklVc1ZuWmgvSStpMGVnazBwVUxOL3BBSmZPOUZIQk5sNGNxOWJv?=
 =?utf-8?Q?/RLZyZBRQAZhlJMlGtnEXysAy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb6450d5-0957-4139-d9e3-08dbaa5659c2
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 19:13:25.9403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WLv8OzesFxnpBYYfMhiDLyKcHLxVsP4Fb35Ih5uedQ6rXE9U/x0sUuIsAOVCGStPyNIMElcvpsWtg7jwyc49mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7995
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
Cc: Daniel Miess <daniel.miess@amd.com>, dri-devel@lists.freedesktop.org,
 Gabe Teeger <gabe.teeger@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>, Leo Chen <sancchen@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Alvin Lee <Alvin.Lee2@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Jun Lei <jun.lei@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sung Joon Kim <sungjoon.kim@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-08-29 16:10, Hamza Mahfooz wrote:
> This reverts commit 3a31e8b89b7240d9a17ace8a1ed050bdcb560f9e.
> 

This isn't a straight-up revert. Please split it into a revert (git revert),
followed by a patch to limit the revert to < DCN_VERSION_3_1.

Harry

> We still need to call dcn20_adjust_freesync_v_startup() for older DCN3+
> ASICs otherwise it can cause DP to HDMI 2.1 PCONs to fail to light up.
> So, reintroduce the reverted code and limit it to ASICs older than
> DCN31.
> 
> Cc: stable@vger.kernel.org
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2809
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
>  .../drm/amd/display/dc/dml/dcn20/dcn20_fpu.c  | 24 ++++---------------
>  1 file changed, 4 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
> index 0989a0152ae8..0841176e8d6c 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
> @@ -1099,6 +1099,10 @@ void dcn20_calculate_dlg_params(struct dc *dc,
>  		context->res_ctx.pipe_ctx[i].plane_res.bw.dppclk_khz =
>  						pipes[pipe_idx].clks_cfg.dppclk_mhz * 1000;
>  		context->res_ctx.pipe_ctx[i].pipe_dlg_param = pipes[pipe_idx].pipe.dest;
> +		if (dc->ctx->dce_version < DCN_VERSION_3_1 &&
> +		    context->res_ctx.pipe_ctx[i].stream->adaptive_sync_infopacket.valid)
> +			dcn20_adjust_freesync_v_startup(&context->res_ctx.pipe_ctx[i].stream->timing,
> +							&context->res_ctx.pipe_ctx[i].pipe_dlg_param.vstartup_start);
>  
>  		pipe_idx++;
>  	}
> @@ -1927,7 +1931,6 @@ static bool dcn20_validate_bandwidth_internal(struct dc *dc, struct dc_state *co
>  	int vlevel = 0;
>  	int pipe_split_from[MAX_PIPES];
>  	int pipe_cnt = 0;
> -	int i = 0;
>  	display_e2e_pipe_params_st *pipes = kzalloc(dc->res_pool->pipe_count * sizeof(display_e2e_pipe_params_st), GFP_ATOMIC);
>  	DC_LOGGER_INIT(dc->ctx->logger);
>  
> @@ -1951,15 +1954,6 @@ static bool dcn20_validate_bandwidth_internal(struct dc *dc, struct dc_state *co
>  	dcn20_calculate_wm(dc, context, pipes, &pipe_cnt, pipe_split_from, vlevel, fast_validate);
>  	dcn20_calculate_dlg_params(dc, context, pipes, pipe_cnt, vlevel);
>  
> -	for (i = 0; i < dc->res_pool->pipe_count; i++) {
> -		if (!context->res_ctx.pipe_ctx[i].stream)
> -			continue;
> -		if (context->res_ctx.pipe_ctx[i].stream->adaptive_sync_infopacket.valid)
> -			dcn20_adjust_freesync_v_startup(
> -				&context->res_ctx.pipe_ctx[i].stream->timing,
> -				&context->res_ctx.pipe_ctx[i].pipe_dlg_param.vstartup_start);
> -	}
> -
>  	BW_VAL_TRACE_END_WATERMARKS();
>  
>  	goto validate_out;
> @@ -2232,7 +2226,6 @@ bool dcn21_validate_bandwidth_fp(struct dc *dc,
>  	int vlevel = 0;
>  	int pipe_split_from[MAX_PIPES];
>  	int pipe_cnt = 0;
> -	int i = 0;
>  	display_e2e_pipe_params_st *pipes = kzalloc(dc->res_pool->pipe_count * sizeof(display_e2e_pipe_params_st), GFP_ATOMIC);
>  	DC_LOGGER_INIT(dc->ctx->logger);
>  
> @@ -2261,15 +2254,6 @@ bool dcn21_validate_bandwidth_fp(struct dc *dc,
>  	dcn21_calculate_wm(dc, context, pipes, &pipe_cnt, pipe_split_from, vlevel, fast_validate);
>  	dcn20_calculate_dlg_params(dc, context, pipes, pipe_cnt, vlevel);
>  
> -	for (i = 0; i < dc->res_pool->pipe_count; i++) {
> -		if (!context->res_ctx.pipe_ctx[i].stream)
> -			continue;
> -		if (context->res_ctx.pipe_ctx[i].stream->adaptive_sync_infopacket.valid)
> -			dcn20_adjust_freesync_v_startup(
> -				&context->res_ctx.pipe_ctx[i].stream->timing,
> -				&context->res_ctx.pipe_ctx[i].pipe_dlg_param.vstartup_start);
> -	}
> -
>  	BW_VAL_TRACE_END_WATERMARKS();
>  
>  	goto validate_out;

