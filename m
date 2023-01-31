Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 452BA682F79
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 15:40:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57D4E10E353;
	Tue, 31 Jan 2023 14:40:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2057.outbound.protection.outlook.com [40.107.212.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0B9710E34E;
 Tue, 31 Jan 2023 14:40:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mHjtrbIwCsXKM4UzNjBgPPFLp4TkGAU4688iKtxSbpc+S+6iLb2xgdVsBd2Is9/itQ8p3Gg1lEYmZl3RG4dYgzw2tffhi2Y2PgR3v135dklHGOJ1e/1WF+0PXK1npT01qFwJqeZx12WCXUCNzIo/6aTr4/GONJD51R3q0Zxro3WNUtkEsJmuegb7R14ZpdP1LKoAg4jFgnsAP2/n7UXnbixzitrAUhSrNbF301A0DImY08oG56eDJIla9PYKWWtVvaI3poZAUmVp0Qc78WHEcLYryAZj9YYVBS82Af9siMl4NIHp4jFkvIjpJwINz0202IdG5VMmoFVpEuT1YauYrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G9UC3QWJHLkdf3zbtdGV6EByUflBF93NLkO1AOT25G4=;
 b=ByXJLb1AxzaVDA3V2mstQWv20OsM7MRdoty/lYzJk1AAXQKUmWcT21+GXviWPKfrJosHp8/Viu7+GvslTJu5KCchWZFDi18Dql1lj+BLCfeWcp/ymHDgLTAxxKC6l/ta2qDLGqe3WENRJFnAYT/s5fYoGihh+bD9S7yiFP1KkIo7yzJ8U3VtGzI7vgGta4vCW4lqlcLV240ypyDWV4M4RJzpzx4gtQT7I/RWkricAdu+XfWAshCmXbuW6N4syWThUWm/MX4UklPfh89E3Ao89BrBSScna91cJKvkFFYSF2FlgPvzAtzAdwG1Lvh1+jSwnpwZks3R+a4oqBWtYXPLTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G9UC3QWJHLkdf3zbtdGV6EByUflBF93NLkO1AOT25G4=;
 b=C44Oz5X24HocX9b9qjfns0PI6UIcpNSpPi4u7fqw78Z+XvmoWD+nda/tFSdBtd/XNGDjK82I6cm3ft41SfSlx1rLfjqa+TmDDFrPJeXsfI/xnqfgeLsj52Opi6qWmjDtxFqP3EQ4g4D9c7CAdp9lFxa8aWvd+wcO5qSIsDojL8Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CH0PR12MB8461.namprd12.prod.outlook.com (2603:10b6:610:183::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 14:40:37 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::152b:e615:3d60:2bf0]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::152b:e615:3d60:2bf0%5]) with mapi id 15.20.6043.033; Tue, 31 Jan 2023
 14:40:37 +0000
Message-ID: <ffbb892d-e374-d706-ebb6-f8367f300c7b@amd.com>
Date: Tue, 31 Jan 2023 09:40:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/amd/display: Trivial swizzle-related code clean-ups
Content-Language: en-US
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>, amd-gfx@lists.freedesktop.org
References: <20230130195607.1297694-1-gpiccoli@igalia.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230130195607.1297694-1-gpiccoli@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0031.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::44) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CH0PR12MB8461:EE_
X-MS-Office365-Filtering-Correlation-Id: 563946a1-05af-47b2-cd40-08db03991dd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /P6lEAosGdwJIQxbHepTXMmJ5vZ8vVV9qi11/6o6b6Rwu9IgwSYIvhb+49maRUde15FeqboC3ptsY2iflysoDGoUuuyiduJVv9k+9fiuVYR+4neTV6zqLraXXeO9RoZ3PgbGQhPZlWVOOZstUcA0Xs8MVa6/P48t3y4bP3j3qFRX42s9oLyWaFidg17MN0XeVTbJ5b2yeMs+hU3hSnLbPB/FAwHe+ux1Kxb+qqDzAMo+4JMOJm732z948o8op+f5c62EuMisSEgOj6DLZHzzyJ7REjs7xPAAKgxGmqcteA4QuF4pE1Bv+YgFSTG6Qu/gXoXeI9oEfweNn052ZxNZ5HpqcymVeQoU8VdQwE9ob1bAVqpyB4dC/UJpbyDeg7WrzRUC1Em5skGUldItfjbQtY98wzNTEO5q3PaxkmBkDt90dyYffH2v7ZTaRnPFB8FpwafkyFQy/4kedPUz3KVRFF1tq10Pp2gGAMwlXzxTcvyqEORMyL6JqK9pAphSBlpQznsCRzFhEONTt2q5nxrzer6St5Swu6hix9Sn4p0vGYMteUVk62MWZ0cmMoxqZjPjvo1US2Zcu33J8ytFk5spQu8DLRZ7QnAnv4Ae0ZI3Bwi/3SIO9+gjBfxq4jc2HeX+cJEs2d76TAY03TplQDaqQ9fSNKt5zJMtH8kim/hPJjlzORD/DBmcu7Bo+ygoMqGU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(396003)(346002)(376002)(366004)(39860400002)(451199018)(36756003)(316002)(6666004)(53546011)(54906003)(6486002)(478600001)(966005)(6506007)(44832011)(5660300002)(2906002)(4326008)(8676002)(66476007)(66556008)(66946007)(8936002)(41300700001)(38100700002)(86362001)(31696002)(186003)(2616005)(6512007)(26005)(83380400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlpWU0dHWFo4UUtDaTcrK01IaFdTbmtXL2tGV213cTd2WDBnM1JrT2tMMWx6?=
 =?utf-8?B?V2wzaWZ1NldKZDJtS1Vid2VLWXRpTWRqR3g2Tkl5cmVQbndHK3dVK1VueGJQ?=
 =?utf-8?B?eTJCb29Jcnk3eGFpY0YramZJdmhpc3FtalY0Wm41NWRqWlVpRGpySCtKY0c3?=
 =?utf-8?B?c3pBVGdMeWVidDNOZ3pRTmtZdXN0WFR3YnVockN3VGpoaW5YUGFDWll1KzJh?=
 =?utf-8?B?bER6R3A0Q01sMTdQaDVMa2tkZzR4QWoxUHZYQmNDckJmQjFBWCs5M3ZiSUlD?=
 =?utf-8?B?NEMyMStXQzhHOVA4a0hSeXgrQ2R0bk1FZEh4RWFxZTE1Vy9Rd1ViZXVBN0NZ?=
 =?utf-8?B?TllZL3puaS93YkdXVzlQNVdGY210WFZPaVFTWTgyTmRKY3FCc2ErWWs5bEo0?=
 =?utf-8?B?MCtaTk1LdlNreXhRa3ZCWjhVZ2loNW41YWhyTmQ3a1RNYTlvQkdIUVl5RjFX?=
 =?utf-8?B?ZGVGUkpON3ZscmdBTDltbFJqUDV4U29nZG0vcFoyT1FqcmxjYmFEeFRXODVy?=
 =?utf-8?B?ODBYUFV1cC9xaXVPNkk1QlhCaWtObXNkLzNYRzlHYk5pWWYwV2VrTTlEa0NL?=
 =?utf-8?B?RnhRNjJUa09KY2RpV2tCOXl6dUhyeG16RnZzeHJnQTdjU2FmRUFFNXBsU29E?=
 =?utf-8?B?UjJFQXQyZW0yaS9ISWNCMVNSTTBFMkVQdTIzVFpBaVZhdGJQL21rTDhZN01v?=
 =?utf-8?B?OWxTekRMRGFuNGY0bEtQdHNCWmJNTUtWNE0vR2dhL29MNHNBVmxQR0FRT1JU?=
 =?utf-8?B?SmQ3bmF0dDBOWERCOXVDUktHQ3NnaHRlUnRGdzB6MjdVcnVpeTRuZzJjUEht?=
 =?utf-8?B?ajhyVmcwU200WGU0bjJuNGcxNXppd29TcHVIVFQ2Y3UzbUVWQndoNnd0Z0w3?=
 =?utf-8?B?NG0xZHpSdTk2VFgyUHJpZVQvVVpWN1JSQXFIMmdTdVVpWllabVcxL0p6NG1r?=
 =?utf-8?B?M2M1T3RDbCtPR3l5aXY2alNaWGZ1V3ZvZm1Ua1lrYTdLSk9TVDZPeVhSbkQ4?=
 =?utf-8?B?L2ZDL0ljTzhxVnA4dDJQbEhXVEh6ZUdSS2cySTFEZ0lkdjlTbVd6amEzMFg1?=
 =?utf-8?B?QWNtMUQvVGFBNm9MOVZXMS9NV3pmUmxqSS9McEY2K2tpM3Q2MWNTanFNV1Bi?=
 =?utf-8?B?Yyt2VTZEalZqZFpkY1NkajhlcWIyREZzdWdOMURrNm1xMXdta2FGUjZNbXN3?=
 =?utf-8?B?cUJLN2xSd2cycEZidmhJOHNrbmFQNVMrZWlkNTdGZ1hMQ1g2TEhxeGwxR1Bh?=
 =?utf-8?B?MWtLeldocURLdkZxWTEwQ3hWZFdkQzhmSW5pOWxnRitleFZYZldkUEFOWWpj?=
 =?utf-8?B?VWUzdWZiT0dzYWdGY2U2R21Ic3RmY3lNTzhWd3NWcFhZekhDaDVtTXdhNHlG?=
 =?utf-8?B?VXVTM0NVMFgxcmdzTlQzcHZDMnQ1cWtnLzA0U29vWjNZVmRMcVEzU0Z1VTkw?=
 =?utf-8?B?RklOVVNleURSM0NPUnc4dGJnQUxqSVpFTWpmQWliVW1RcU5iNjA5U05HZVQr?=
 =?utf-8?B?L2ZGd3ZJUnRHQStVNEcxTGdBcUhVNlJBQ2lKQ2lDZW1UOEZMUzc2N0lkNnVF?=
 =?utf-8?B?QXh2elJrUTltQU9Ga0ZJdWFEL1lNVS9nYnFjbzM5cnFkaHJYV0NkcDJtamlG?=
 =?utf-8?B?R0VnQ01FTjJoeHRhcEdxL25GVERpSElSMVZHWGlZNTdESVB5M1B3RUJHMmNp?=
 =?utf-8?B?NjBwR0YyVjdwQkVvdktwMkdIRWd4T1FhME9hNlA2RkNqUVlwOEo5YXAvQmxn?=
 =?utf-8?B?WXdwMHBGdVcvNkZMVUptWEUzbUZyVXRYenZBdE9zQ0pDMHNaek1aRWhqWHFU?=
 =?utf-8?B?MnBNV1NDbEZFbGI5anZiMGZGWkV5SkFGb2I2b3VTTXJLSzV3elhQaGprU1Zk?=
 =?utf-8?B?UnUzU3ZCT2tzdmlKdGF0NkJGK012YVowazFwMHRKRmk2U0s0WjgzS0h4KzZN?=
 =?utf-8?B?RitRVnVhRFlublZXY29oTWpYQ0lXckJCTWVPUmxad3d2TmJMTG04QnNWL3hn?=
 =?utf-8?B?eFRIQlE3S24xdUF4SVVuR3RaejdjSDNwNHEwcWxtVzFmRmQ5QllDNkR6d3hz?=
 =?utf-8?B?SHg3dUVNb0lHVFhESUNudjVyMFlZYjg4TFYrR1BtWEk5REJtMUZWR0V5QU10?=
 =?utf-8?Q?snuQGbvbbgpwEuj4Cv9zQ+QzK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 563946a1-05af-47b2-cd40-08db03991dd4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 14:40:37.1234 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: srJii13Ti808SfUV9GEZpz/YskMpBbkYT2r4W6Pi1Y/Emu7cae2tSADTM00kmgSx0WDTjaPC9s3Gnp0Go+i1Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8461
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
Cc: kernel@gpiccoli.net, Swapnil Patel <Swapnil.Patel@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Xinhui.Pan@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 dri-devel@lists.freedesktop.org, Mark Broadworth <mark.broadworth@amd.com>,
 Melissa Wen <mwen@igalia.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 Sung Joon Kim <Sungjoon.Kim@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/30/23 14:56, Guilherme G. Piccoli wrote:
> This is a very trivial code clean-up related to commit 5468c36d6285
> ("drm/amd/display: Filter Invalid 420 Modes for HDMI TMDS"). This commit
> added a validation on driver probe to prevent invalid TMDS modes, but one
> of the fake properties (swizzle) ended-up causing a warning on driver
> probe; was reported here: https://gitlab.freedesktop.org/drm/amd/-/issues/2264.
> 
> It was fixed by commit 105a8b8698e2 ("drm/amd/display: patch cases with
> unknown plane state to prevent warning"), but the validation code had
> a double variable assignment, which we hereby remove. Also, the fix relies
> in the dcn2{0,1}patch_unknown_plane_state() callbacks, so while at it we
> took the opportunity to perform a small code clean-up in such routines.
> 
> Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
> Cc: Daniel Wheeler <daniel.wheeler@amd.com>
> Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Mark Broadworth <mark.broadworth@amd.com>
> Cc: Melissa Wen <mwen@igalia.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: Sung Joon Kim <Sungjoon.Kim@amd.com>
> Cc: Swapnil Patel <Swapnil.Patel@amd.com>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c     | 1 -
>  drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c | 8 ++------
>  drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c | 6 ++----
>  3 files changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 86a2f7f58550..e71e94663d14 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -6336,7 +6336,6 @@ static enum dc_status dm_validate_stream_and_context(struct dc *dc,
>  	dc_plane_state->plane_size.surface_size.width  = stream->src.width;
>  	dc_plane_state->plane_size.chroma_size.height  = stream->src.height;
>  	dc_plane_state->plane_size.chroma_size.width   = stream->src.width;
> -	dc_plane_state->tiling_info.gfx9.swizzle =  DC_SW_UNKNOWN;
>  	dc_plane_state->format = SURFACE_PIXEL_FORMAT_GRPH_ARGB8888;
>  	dc_plane_state->tiling_info.gfx9.swizzle = DC_SW_UNKNOWN;
>  	dc_plane_state->rotation = ROTATION_ANGLE_0;
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> index 531f405d2554..3af24ef9cb2d 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> @@ -2225,14 +2225,10 @@ enum dc_status dcn20_patch_unknown_plane_state(struct dc_plane_state *plane_stat
>  	enum surface_pixel_format surf_pix_format = plane_state->format;
>  	unsigned int bpp = resource_pixel_format_to_bpp(surf_pix_format);
>  
> -	enum swizzle_mode_values swizzle = DC_SW_LINEAR;
> -
> +	plane_state->tiling_info.gfx9.swizzle = DC_SW_64KB_S;
>  	if (bpp == 64)
> -		swizzle = DC_SW_64KB_D;
> -	else
> -		swizzle = DC_SW_64KB_S;
> +		plane_state->tiling_info.gfx9.swizzle = DC_SW_64KB_D;
>  
> -	plane_state->tiling_info.gfx9.swizzle = swizzle;
>  	return DC_OK;
>  }
>  
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
> index fbcf0afeae0d..8f9244fe5c86 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
> @@ -1393,15 +1393,13 @@ static uint32_t read_pipe_fuses(struct dc_context *ctx)
>  
>  static enum dc_status dcn21_patch_unknown_plane_state(struct dc_plane_state *plane_state)
>  {
> -	enum dc_status result = DC_OK;
> -
>  	if (plane_state->ctx->dc->debug.disable_dcc == DCC_ENABLE) {
>  		plane_state->dcc.enable = 1;
>  		/* align to our worst case block width */
>  		plane_state->dcc.meta_pitch = ((plane_state->src_rect.width + 1023) / 1024) * 1024;
>  	}
> -	result = dcn20_patch_unknown_plane_state(plane_state);
> -	return result;
> +
> +	return dcn20_patch_unknown_plane_state(plane_state);
>  }
>  
>  static const struct resource_funcs dcn21_res_pool_funcs = {

