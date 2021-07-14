Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BF93C8541
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 15:24:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D47E46E2B6;
	Wed, 14 Jul 2021 13:24:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2080.outbound.protection.outlook.com [40.107.220.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42DE16E2B4;
 Wed, 14 Jul 2021 13:24:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AWfjQ7zfCesvqSkKEda47ztkpSddNTtbFpx7zkyCNjeuk64rCkQrh3U4WevnS0ApIrK2l57vsT0z11hqrI8s6alP5MGrcj/UG7CmWpdKthw0JpUX4omknlsBT/C5K7FkjYr8MiB3m7SIeDrJE9CxauksHQ3+qxlwPOUgCbPLqrrjN++gTrkspFL18EGIY45Sr7mKPUkg3qK05InnJlv7KYH8iCjCyOKmH4Car+Fi8xpIwMiGrhQFqGifR7zRAhGTVlK4jYwOwEPPocFRm9WgedQH9XXXMpP+/wH5D+qF1BaXQy3IldAQhiEu1TwFdinauGQBgQLCeTfKKWmQm15QaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/epbVhtrd8Zyqxd1gxDJcQPkCmV+Z2Tc1zolLpqt4ig=;
 b=EP/nsP3yri1/OoTxJiI+U8vrXXtu68RXcrSJw9uxAf1f8IBXXCK3o9LfYf8f53Uf6FfL54hmkFGaTm7rxrXtKAWea1zz0PuuIb4W8aluZWlGrDRUHtYWUeYdujY3tDMqNfrF74oD7cUCrkBVFOHH6nbTkTaHMkIMgEAQ3Ll7GPLEwy52Jfn+hrIg5/ITnkWabRomjq8+PSj3kjDR/V/Y+Qi5YhKkkGofFz+qkCTuOHEekiwjx3WmKpId+rmLyJaLJ1paYqfii0phKghNaxQbg2aWXvP+cOtObyEOD+i+gHNnqq4kBsttyGO4KmrfZL5yiCLQQIpockPbdIhzP3E9sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/epbVhtrd8Zyqxd1gxDJcQPkCmV+Z2Tc1zolLpqt4ig=;
 b=gamygu0/BdKWBsEUGtnkP5i4J3840AzfKt86tg/8R/47w/yq4WYVjMBgNZOhd8lzP8Lx7byHyLZ6dqqvKqXQ+RCVmovguxUfL1OK/wK+0YLWYdHKFLa/aY1Dwrv1r1bLDtUWfq0kt//Yz7HbjomT61YyP0CkFQi2OUi3hEwvHkM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4126.namprd12.prod.outlook.com (2603:10b6:208:199::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Wed, 14 Jul
 2021 13:24:26 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 13:24:26 +0000
Subject: Re: [PATCH v2 1/4] drm/amd/display: Introduce FPU directory inside DC
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel@ffwll.ch>,
 roman.li@amd.com, anson.jacob@amd.com, hersenxs.wu@amd.com,
 jerry.zuo@amd.com, sunpeng.li@amd.com, aric.cyr@amd.com
References: <20210713140612.2721113-1-Rodrigo.Siqueira@amd.com>
 <20210713140612.2721113-2-Rodrigo.Siqueira@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <2da8d3d5-618b-6d06-e6ca-653c08008984@amd.com>
Date: Wed, 14 Jul 2021 15:24:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210713140612.2721113-2-Rodrigo.Siqueira@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: FR0P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::19) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:fe2b:fec6:eeb5:c7dc]
 (2a02:908:1252:fb60:fe2b:fec6:eeb5:c7dc) by
 FR0P281CA0014.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.10 via Frontend Transport; Wed, 14 Jul 2021 13:24:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89425e02-3f71-42f3-5930-08d946cab363
X-MS-TrafficTypeDiagnostic: MN2PR12MB4126:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB41265A95221F89CA92FF880383139@MN2PR12MB4126.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nrDo3r2SnMYohrcymj2mf8+EXy9GtM7gctCUFRU+8iE1kTClADuHuC0qRCgBo3hW4B58XcR42qR+n1RbXv09Bis7tUjFXxxeVEoi0Z7a2uV9nXUlxFovfDRoE2aNKEbxog0LG6rDxj2IXmkChfN8uVswf/d+vKi0bVmFeJP7BZahbiYbpqDHjGhev9ow9LSb0w5xnpO85UNvhSFAAOA2F2ltcRiqt7iYHSunRpXdSEe8uqOyeBAyFMW6QDVtwoW3mVfuYpOJ7noHyUvS6fZ177bpHNDgLjF1zHF1iD1VCzjyHI3j5ewmJceBE7b3I6oseuhGWSgGCxmMbSCQrvz5O3YB1DBxV8y11lmgXgC0qL7HO0ZgdrkNLZZhqJjU2dRTCUpd3Yjp/Xo9corLByzlnaAR7/Ykejm8OlJITDpTewliXrCBRsgXdvdrenz7R2+OaotpShjSgcXtuSumgP+dszPjgPZFWNGeemK2kV8W4SutH6Mg6WJOwqEqTOeUk3yh3eJzheU56veoDz2C0hteI8Q69wy4TmdzGIhavolUMhhFv79iX9gwZHd7r3PRq0jEZ9Jnntn5hnyIvNvK6TJYGd0ci80FCHwlmGLnTeXoKVZiJWOVErPe3f+4UlnRktEJc4PHmNwVJFrhPG+ZFIc4/ry5CMFNIEpwhZcVds747gpm0bwaUAQgMnq90l/HTdrqXryvHi475c5EF2Xvge04kS6B/+i3AZn0cboR1o4D4xY8YdqSdO+jF8j9TCcypyOa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(376002)(366004)(396003)(31696002)(66476007)(66556008)(6666004)(6636002)(186003)(8936002)(30864003)(110136005)(38100700002)(2616005)(316002)(5660300002)(86362001)(36756003)(31686004)(4326008)(2906002)(6486002)(478600001)(66946007)(8676002)(83380400001)(921005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGFzZ2hlMUsyT0dDUXFacGIvTVh2akxXQjdxSXY5dUx0QUNDcTZLVEFuMFMw?=
 =?utf-8?B?UlRBWDV0VHRGMWIyaFQwL0N0SUxvNXVyeEZqeEhMQTYxNWNnQmpCWmp6ekxr?=
 =?utf-8?B?QS9IZzFVbm1mQ2hXR1A2bnZDWlBwZytsVjNoVEs3V01oeXA3ZmNna0hWaTFr?=
 =?utf-8?B?NXdFZlJnNk8xbzdCZ3diL3B5TVNtWksyaitjbkJRSWNkWkdpSzBPRlNCbGh3?=
 =?utf-8?B?T0UybHl3aHNvdXdia3IvQU5mdnVLRFRLRkJyeHlBNEJ1elFuYnFOa3hxM0Er?=
 =?utf-8?B?SVo5YUdQVktEc0YybkhRNnlsU3pmWW0yK2NKbE40WWNra2xSQ2Fablp2dktn?=
 =?utf-8?B?Mk16TDBXem9mb1dPcU1MWlNQV0RSOHQ2QVJ0VXRqZFdoYUswdnBVeXN4TS95?=
 =?utf-8?B?K1RFeTFNbFRQeFZBNE5Eblo2MjBVN0gxbFg4N01venQ2TWRMTHMwRkRySnpM?=
 =?utf-8?B?TW5MMWI1bGtyejR1VUJZQ2pqdWRtVlZ0bndBREs5VGl0OVhRSG9GRXJxdVZ3?=
 =?utf-8?B?YVArR3BHSTZ0dUNpMFozNGVteVA1NysyVmtyS1BlQ0ZxWVhGUFpWTzlUaHhR?=
 =?utf-8?B?SEd1YXZ4WlZZdDAveWkvdWVWbHRDY1hPVlM4bkMrdTJvYnRoTGRDQWRXOXpM?=
 =?utf-8?B?T3pGam1PSTV0cFJueUVzRnNrbGNiL01YVTg0aXF5VEQrNVN0UUlFUmxUUFNn?=
 =?utf-8?B?Q0luTXFpSktobllnS2lPdGFxMnFPcUVZSW9ZemNnOUd1am1vV1ZaTXVOTXUx?=
 =?utf-8?B?ZGxrUkNXQWxzS2pEbEovc25KcUt0QVB0dTdPRHNXM08xNGhZWjNnVUl5WXc5?=
 =?utf-8?B?ajREMzY1N05ISjh6ZVFVUXlVY09oV29zMjJrYUk1a0VXZGo4bERmQWM0cnBM?=
 =?utf-8?B?djhReFN2VmZMS2RGK2FBcCtNYWZtSWtocThHc3J1eWszRjVCT0NCZHdPdmNQ?=
 =?utf-8?B?YVB6cTYwbjJ0QXN6czBxWXo4L25tWE5MU3k0OFpPdGxHNmxwczVEYkJ6WG9z?=
 =?utf-8?B?NDU1YzV3NlpnU2V4RWVkRVpGNnZ1d250Nk5Uc2tFWWlUZ29raXdsWVpwSVEr?=
 =?utf-8?B?SFMwMjdQTXQ2VE52cUQyOXlsQmNnNFdkOTF0Y0c5UlM3QjV5ZDVkclF5RDFo?=
 =?utf-8?B?R1FNYmV2blMrd2VuUUU4MUlXM1FBemJwSXlmamhYazE1bzRzR3lSUm9OZ3Zy?=
 =?utf-8?B?QkFWTFhyT0xLYzk4akVUM1c0STNwamJCOEVuRnlPVFVxZEZyRnVvMmdMTlV4?=
 =?utf-8?B?UVE2SVVud09lbitrMVV5VzZLaThEb1ZkRTRnYnJ5ZStqRHB2MDJnaE5ESGJj?=
 =?utf-8?B?QnlxZ3ZrbkMzRFNKNE8ydnZlbndrVXFnYXcxK2hKNTdqWmp3SnV4LzhrYUpr?=
 =?utf-8?B?QVQxWmhWU3h4U2JzcXE2cEdzR2p2Z3VXSWNCWEFhM0VOYjFMNGwrMVF1MytR?=
 =?utf-8?B?Y3dIc1lNTDZtQ2lZVkdNdDJEcHhmNHBOTTVCZGpjUDU4bm12bW9IVXYxSUh6?=
 =?utf-8?B?bDlDa1djUUo4L042Skp3bmROYnE4U3lUaEZQU0tlSHcrZ3JUY2lVSDFLMHVB?=
 =?utf-8?B?S0wxWmlpUDBlWC96WlBxZEU5SDhzZjlsS2lHdjF0Z0JPejl2ZlJDREJPbkZU?=
 =?utf-8?B?cWNCNUY0Y1RlUkZ0Tkg4azFhVzRnQWpHZlZYeWVoYU8yTkxoZW1EdVRzd1dP?=
 =?utf-8?B?V3RjNHdJOEZaSW85cnBVNXFWd0Y3WERQK0dwSC85d1ZGOHhrSFZLY3lKZm90?=
 =?utf-8?B?bUw3TmpVU3NUWnR5RjNFT2R2YnNCY0Y3Q0hRYnRXVHM3Q2xuUHo3Uk9jNjdh?=
 =?utf-8?B?WStxSGhJOHNQZUpIOWxQZlIxMXpxUFVlOFVmdzNFWXNCMklKY3F3dWVIanVp?=
 =?utf-8?Q?lyXShb51RZ6e2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89425e02-3f71-42f3-5930-08d946cab363
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 13:24:25.8355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OgMqnJMff38lxdhlo7beHXcqszSJlAGQZEkXtlVwdzQCyMCRns7EvZcEF9cYYsbc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4126
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.07.21 um 16:06 schrieb Rodrigo Siqueira:
> The display core files rely on FPU operation, which requires to be
> compiled with special flags. Ideally, we don't want these FPU operations
> spread around the DC code; nevertheless, it happens in the current
> source. This commit introduces a new directory named fpu_operations that
> intends to centralize all files that require the FPU compilation flag.
> As part of this new component, this patch also moves one of the
> functions that require FPU access to a single shared file. Notice that
> this is the first part of the work, and it does not fix the FPU issue
> yet; we still need other patches for achieving the complete isolation of
> this file.
>
> Change since V1:
> - Update documentation and rebase.
>
> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> ---
>   drivers/gpu/drm/amd/display/dc/Makefile       |  1 +
>   .../drm/amd/display/dc/dcn20/dcn20_resource.c | 39 +--------
>   .../drm/amd/display/dc/dcn20/dcn20_resource.h |  2 -
>   .../drm/amd/display/dc/dcn21/dcn21_resource.c |  2 +
>   .../amd/display/dc/fpu_operations/Makefile    | 58 +++++++++++++
>   .../drm/amd/display/dc/fpu_operations/dcn2x.c | 87 +++++++++++++++++++
>   .../drm/amd/display/dc/fpu_operations/dcn2x.h | 33 +++++++
>   7 files changed, 183 insertions(+), 39 deletions(-)
>   create mode 100644 drivers/gpu/drm/amd/display/dc/fpu_operations/Makefile
>   create mode 100644 drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.c
>   create mode 100644 drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.h
>
> diff --git a/drivers/gpu/drm/amd/display/dc/Makefile b/drivers/gpu/drm/amd/display/dc/Makefile
> index 943fcb164876..93e731a9be68 100644
> --- a/drivers/gpu/drm/amd/display/dc/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/Makefile
> @@ -37,6 +37,7 @@ DC_LIBS += dcn303
>   DC_LIBS += dcn31
>   endif
>   
> +DC_LIBS += fpu_operations
>   DC_LIBS += dce120
>   
>   DC_LIBS += dce112
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> index 1b05a37b674d..f99b09643a52 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> @@ -35,6 +35,8 @@
>   #include "include/irq_service_interface.h"
>   #include "dcn20/dcn20_resource.h"
>   
> +#include "fpu_operations/dcn2x.h"
> +
>   #include "dcn10/dcn10_hubp.h"
>   #include "dcn10/dcn10_ipp.h"
>   #include "dcn20_hubbub.h"
> @@ -1974,43 +1976,6 @@ void dcn20_split_stream_for_mpc(
>   	ASSERT(primary_pipe->plane_state);
>   }
>   
> -void dcn20_populate_dml_writeback_from_context(
> -		struct dc *dc, struct resource_context *res_ctx, display_e2e_pipe_params_st *pipes)
> -{
> -	int pipe_cnt, i;
> -
> -	for (i = 0, pipe_cnt = 0; i < dc->res_pool->pipe_count; i++) {
> -		struct dc_writeback_info *wb_info = &res_ctx->pipe_ctx[i].stream->writeback_info[0];
> -
> -		if (!res_ctx->pipe_ctx[i].stream)
> -			continue;
> -
> -		/* Set writeback information */
> -		pipes[pipe_cnt].dout.wb_enable = (wb_info->wb_enabled == true) ? 1 : 0;
> -		pipes[pipe_cnt].dout.num_active_wb++;
> -		pipes[pipe_cnt].dout.wb.wb_src_height = wb_info->dwb_params.cnv_params.crop_height;
> -		pipes[pipe_cnt].dout.wb.wb_src_width = wb_info->dwb_params.cnv_params.crop_width;
> -		pipes[pipe_cnt].dout.wb.wb_dst_width = wb_info->dwb_params.dest_width;
> -		pipes[pipe_cnt].dout.wb.wb_dst_height = wb_info->dwb_params.dest_height;
> -		pipes[pipe_cnt].dout.wb.wb_htaps_luma = 1;
> -		pipes[pipe_cnt].dout.wb.wb_vtaps_luma = 1;
> -		pipes[pipe_cnt].dout.wb.wb_htaps_chroma = wb_info->dwb_params.scaler_taps.h_taps_c;
> -		pipes[pipe_cnt].dout.wb.wb_vtaps_chroma = wb_info->dwb_params.scaler_taps.v_taps_c;
> -		pipes[pipe_cnt].dout.wb.wb_hratio = 1.0;
> -		pipes[pipe_cnt].dout.wb.wb_vratio = 1.0;
> -		if (wb_info->dwb_params.out_format == dwb_scaler_mode_yuv420) {
> -			if (wb_info->dwb_params.output_depth == DWB_OUTPUT_PIXEL_DEPTH_8BPC)
> -				pipes[pipe_cnt].dout.wb.wb_pixel_format = dm_420_8;
> -			else
> -				pipes[pipe_cnt].dout.wb.wb_pixel_format = dm_420_10;
> -		} else
> -			pipes[pipe_cnt].dout.wb.wb_pixel_format = dm_444_32;
> -
> -		pipe_cnt++;
> -	}
> -
> -}
> -
>   int dcn20_populate_dml_pipes_from_context(
>   		struct dc *dc,
>   		struct dc_state *context,
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.h b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.h
> index c8f3127bbcdf..6ec8ff45f0f7 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.h
> +++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.h
> @@ -58,8 +58,6 @@ struct pipe_ctx *dcn20_acquire_idle_pipe_for_layer(
>   		struct dc_state *state,
>   		const struct resource_pool *pool,
>   		struct dc_stream_state *stream);
> -void dcn20_populate_dml_writeback_from_context(
> -		struct dc *dc, struct resource_context *res_ctx, display_e2e_pipe_params_st *pipes);
>   
>   struct stream_encoder *dcn20_stream_encoder_create(
>   	enum engine_id eng_id,
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
> index f3d98e3ba624..85385144e2c5 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
> @@ -35,6 +35,8 @@
>   #include "include/irq_service_interface.h"
>   #include "dcn20/dcn20_resource.h"
>   
> +#include "fpu_operations/dcn2x.h"
> +
>   #include "clk_mgr.h"
>   #include "dcn10/dcn10_hubp.h"
>   #include "dcn10/dcn10_ipp.h"
> diff --git a/drivers/gpu/drm/amd/display/dc/fpu_operations/Makefile b/drivers/gpu/drm/amd/display/dc/fpu_operations/Makefile
> new file mode 100644
> index 000000000000..7f6f90c3f267
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/display/dc/fpu_operations/Makefile
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: MIT
> +#
> +# Copyright 2021 Advanced Micro Devices, Inc.
> +#
> +# Permission is hereby granted, free of charge, to any person obtaining a
> +# copy of this software and associated documentation files (the "Software"),
> +# to deal in the Software without restriction, including without limitation
> +# the rights to use, copy, modify, merge, publish, distribute, sublicense,
> +# and/or sell copies of the Software, and to permit persons to whom the
> +# Software is furnished to do so, subject to the following conditions:
> +#
> +# The above copyright notice and this permission notice shall be included in
> +# all copies or substantial portions of the Software.
> +#
> +# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> +# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> +# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> +# THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> +# OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> +# ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> +# OTHER DEALINGS IN THE SOFTWARE.
> +#
> +#
> +# Makefile for fpu operations component.
> +#
> +
> +FPU_OPERATIONS = dcn2x.o
> +
> +ifdef CONFIG_X86
> +fpu_ccflags := -mhard-float -msse
> +endif
> +
> +ifdef CONFIG_PPC64
> +fpu_ccflags := -mhard-float -maltivec
> +endif
> +
> +ifdef CONFIG_CC_IS_GCC
> +ifeq ($(call cc-ifversion, -lt, 0701, y), y)
> +IS_OLD_GCC = 1
> +endif
> +endif
> +
> +ifdef CONFIG_X86
> +ifdef IS_OLD_GCC
> +# Stack alignment mismatch, proceed with caution.
> +# GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-boundary=3
> +# (8B stack alignment).
> +fpu_ccflags := -mpreferred-stack-boundary=4
> +else
> +fpu_ccflags :=  -msse2
> +endif
> +endif
> +
> +CFLAGS_$(AMDDALPATH)/dc/fpu_operations/dcn2x.o += $(fpu_ccflags)
> +
> +AMD_DAL_FPU_OPERATIONS = $(addprefix $(AMDDALPATH)/dc/fpu_operations/,$(FPU_OPERATIONS))
> +
> +AMD_DISPLAY_FILES += $(AMD_DAL_FPU_OPERATIONS)
> diff --git a/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.c b/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.c
> new file mode 100644
> index 000000000000..c815d6c01d64
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.c
> @@ -0,0 +1,87 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2021 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * Authors: AMD
> + *
> + */
> +
> +#include "resource.h"
> +
> +/**
> + * DOC: DCN2x FPU manipulation Overview
> + *
> + * The DCN architecture relies on FPU operations, which require special
> + * compilation flags and the use of kernel_fpu_begin/end functions; ideally, we
> + * want to avoid spreading FPU access across multiple files. With this idea in
> + * mind, this file aims to centralize all DCN20 and DCN2.1 (DCN2x) functions
> + * that require FPU access in a single place. Code in this file follows the
> + * following code pattern:
> + *
> + * 1. Functions that use FPU operations should be isolated in static functions.
> + * 2. The FPU functions should have the noinline attribute to ensure anything
> + *    that deals with FP register is contained within this call.
> + * 3. All function that needs to be accessed outside this file requires a
> + *    public interface that not uses any FPU reference.
> + */
> +
> +static noinline void _dcn20_populate_dml_writeback_from_context(struct dc *dc,
> +	struct resource_context *res_ctx, display_e2e_pipe_params_st *pipes)
> +{
> +	int pipe_cnt, i;
> +
> +	for (i = 0, pipe_cnt = 0; i < dc->res_pool->pipe_count; i++) {
> +		struct dc_writeback_info *wb_info = &res_ctx->pipe_ctx[i].stream->writeback_info[0];
> +
> +		if (!res_ctx->pipe_ctx[i].stream)
> +			continue;
> +
> +		/* Set writeback information */
> +		pipes[pipe_cnt].dout.wb_enable = (wb_info->wb_enabled == true) ? 1 : 0;
> +		pipes[pipe_cnt].dout.num_active_wb++;
> +		pipes[pipe_cnt].dout.wb.wb_src_height = wb_info->dwb_params.cnv_params.crop_height;
> +		pipes[pipe_cnt].dout.wb.wb_src_width = wb_info->dwb_params.cnv_params.crop_width;
> +		pipes[pipe_cnt].dout.wb.wb_dst_width = wb_info->dwb_params.dest_width;
> +		pipes[pipe_cnt].dout.wb.wb_dst_height = wb_info->dwb_params.dest_height;
> +		pipes[pipe_cnt].dout.wb.wb_htaps_luma = 1;
> +		pipes[pipe_cnt].dout.wb.wb_vtaps_luma = 1;
> +		pipes[pipe_cnt].dout.wb.wb_htaps_chroma = wb_info->dwb_params.scaler_taps.h_taps_c;
> +		pipes[pipe_cnt].dout.wb.wb_vtaps_chroma = wb_info->dwb_params.scaler_taps.v_taps_c;
> +		pipes[pipe_cnt].dout.wb.wb_hratio = 1.0;
> +		pipes[pipe_cnt].dout.wb.wb_vratio = 1.0;
> +		if (wb_info->dwb_params.out_format == dwb_scaler_mode_yuv420) {
> +			if (wb_info->dwb_params.output_depth == DWB_OUTPUT_PIXEL_DEPTH_8BPC)
> +				pipes[pipe_cnt].dout.wb.wb_pixel_format = dm_420_8;
> +			else
> +				pipes[pipe_cnt].dout.wb.wb_pixel_format = dm_420_10;
> +		} else {
> +			pipes[pipe_cnt].dout.wb.wb_pixel_format = dm_444_32;
> +		}
> +
> +		pipe_cnt++;
> +	}
> +}
> +
> +void dcn20_populate_dml_writeback_from_context(struct dc *dc,
> +	struct resource_context *res_ctx, display_e2e_pipe_params_st *pipes)
> +{
> +	_dcn20_populate_dml_writeback_from_context(dc, res_ctx, pipes);
> +}

As far as I can see you don't need the wrapper function any longer.

Just put the implementation in this function directly.

Christian.

> diff --git a/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.h b/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.h
> new file mode 100644
> index 000000000000..c060f909164b
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.h
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright 2021 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * Authors: AMD
> + *
> + */
> +
> +#ifndef __DCN2X_H__
> +#define __DCN2X_H__
> +
> +void dcn20_populate_dml_writeback_from_context(struct dc *dc,
> +	struct resource_context *res_ctx, display_e2e_pipe_params_st *pipes);
> +
> +#endif /* __DCN2X_H__ */

