Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F48858A34D
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 00:33:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC478BE1C;
	Thu,  4 Aug 2022 22:33:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062.outbound.protection.outlook.com [40.107.220.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFB07A9143;
 Thu,  4 Aug 2022 22:32:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FCUIuTu3xyib2Gz0sn88LodAeZ61ucVoHI6i9UY12zZGBkoUg8CCtiC1VSX7onAUBs5MO81yTCjpk2x5HDxgKyD4Lrz2zPMbp8tbxQbPNjwm3/MyGeHQ0BGVMohAV6O2K+t1j3R7p3UxJ21iBb22N3OI7MTIx2ILcwoqqhpyLNCH7FskaS/KGzc6RuePEZH0Oz9aUAp0BqrozUk/jA+5b6vtMLhVOdTwORe4eUmApSU7Mk0nwtpwADw3a9oS7jFhzpNP6zUlWENr9KaUk9EU3QFeaTx+wjWhQgcdB1q5e2wuYTQRLaG5J5xpNqrvV2lLtfIBUrzdHYzqFGZ0sZ3sZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tn98jzwGic1vZgUk9vMl51r9BI9UfYVQsTciMtwh3Jo=;
 b=g8fZ1NFtb5xKk5Fs4gbFrelnwh0imvEVUilRPoQjLXLBjadTC7YW5dKlhWZn0ILdSqmF7mAK+fx1OUCirgCDw2uwnyvzrxn+l7JAb6nbhon3nZHt1fyyY9d2ei7GphI77um9kvcXG8p9UH1sYlTnS9MPs9v4Ztt9d32ZPQ6sZ4PmDcOP+htM8Qe4pYlIQOKNPZwLwuvXzeSjSrLOIaWbcB5zis+Y5nczmqDrf38KWPsGjccffSiTtK2Xjx/FsqjnizcCpv+oCYVX3E+8wanG4a8VdsyseAgUgOMrxssihpJazdSGgJS6bpRaTawg+mpEP28DBmxKChLA+BLwJyPsbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tn98jzwGic1vZgUk9vMl51r9BI9UfYVQsTciMtwh3Jo=;
 b=FqeQSCpFPKcmMaxG0fxZQ9fW/np6UE3mfz4HM7+pjsCK7xsctlcju+ngK56bGATprvDARlg9389FSJN48G2Grx/HLkcwauaM3HUL7SwaWzebIh7uxC3Cn0Iuas2uEbm99pb3E3qL20ZTSNqRWzimMtAmBz3xyt5sjXVOiySgaOE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by BY5PR12MB5525.namprd12.prod.outlook.com (2603:10b6:a03:1df::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Thu, 4 Aug
 2022 22:32:23 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::d122:1dae:8445:2e43]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::d122:1dae:8445:2e43%7]) with mapi id 15.20.5482.016; Thu, 4 Aug 2022
 22:32:23 +0000
Message-ID: <3bf19a76-c2a3-1e63-5c2b-4935a9accb83@amd.com>
Date: Thu, 4 Aug 2022 18:32:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 3/4] drm/amd/display: add doc entries for MPC blending
 configuration
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, sungjoon.kim@amd.com,
 nicholas.kazlauskas@amd.com
References: <20220804150107.3435964-1-mwen@igalia.com>
 <20220804150107.3435964-4-mwen@igalia.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20220804150107.3435964-4-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:610:59::24) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14218295-152a-4c74-e60d-08da7669333b
X-MS-TrafficTypeDiagnostic: BY5PR12MB5525:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xk6ad6+vgUiYIYrknVa0OgkyiHwKdBn+/+kFcJS1w/LClF8CmZOKKSQjWunj50LcOY/gBpnY5PTwvj9ox+gHHAkxWS8ZIIldAktE/T6T8gWTxbedQu0iV2CFAT55F1FhueH65TNLOMgd2716aPi7Ble8H4m8YpbfQxSPID5J+/csDbELQ7LjQfgGyUBh0nac+EjYLAMGmoHnztDt6DgQ1olw1vFm1Kv00TnFm3NYrq1VlAVbWpwF7DJWhocuh6jxTxs1ukB9LWHLooAnC9dXg+0Ol9q4qWCNsQ7AWEHAMQFZ6rcK8Aju6iTT7DMZSx4EaSoRo0y5Jn/uUJaGQv0v/3+RyjqWvvSs/JvK8uVw8MnQA8rIRKhwRRVms/ER4v9gy9kGd0mk/TG41wr/ZXcSYL5Yw7UGZrq3oFJp9tVx+BwJI+4XP6Zt9ZSl+wMmozZWa+igqjs73JpqYxg7yeOoJkyonnMAdcnWPcVApzfRQ9VKUjvgm4uoLgSHGRFxRd2/yPGovMkopLHCgZ3CoOF6DGSFI5V/0cJcfpgUe6Zg7xQTQaix/+wMeRetmK72so+kuzpyy0Sqi0jr+XSpAhPQrFW3kRUWcS6K1zJ/BUMfem9ZYocolE159i2e0z0ot24ilHNdgEYS4W8dYD2e4NdV6882I4f+x5tj7hzQbYFcVWJt8b6OPDHr2AeiAgLDKB0AEQvRq1DY7kl6o5GzWaGUvQ8OlBQudVCZDqufbiFtIgzkG0kLeV3jyT4tmGfcSaZvvUR2WgpCnr8sU0rNlaPPdWQ6cM5TnOipVWoTmk73F94=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(53546011)(6506007)(186003)(41300700001)(2906002)(6512007)(2616005)(26005)(38100700002)(86362001)(31696002)(83380400001)(478600001)(5660300002)(6486002)(966005)(110136005)(6636002)(36756003)(316002)(66556008)(31686004)(4326008)(8676002)(8936002)(66476007)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0g5ZHpzUk56OVBCSEhXQ1czQi9DSnZQRGtpQUF1bjQzYVRFekhlclF3YlRO?=
 =?utf-8?B?QU5hUlBXd3JiQ21oR1FCZGdXNEU0ZnBPVnhSRkNRVkhPc05rZDBsUnFjTUxp?=
 =?utf-8?B?amYwVlZXbTlYcDh4K0FZeHdWY1pmNXNNc3VHMTJzMm1hSW0ra2hoN0hESHhk?=
 =?utf-8?B?R2Zka2FxZWdNaWdGQlBRQXBKcCtBWGh2RnlLbmtlejhiV0RYdWtiODB2cThG?=
 =?utf-8?B?ZjlEb2pKWkh6U0VuY0I4OG13aUZJRE82blJwalpaVFVaOXh2dkZJQWI1VUFB?=
 =?utf-8?B?QndXV1U1elA0VG56VjVhTXJPRDcrVG5yLzVRQkVGT2dhRDQvTFRtV3Fad2VB?=
 =?utf-8?B?dkZ6N0dzS09KWHJiSmJjd01EQ0xPL01Ra2RUQ2dFRU9OQ1pOeFd4ZFlTVUhS?=
 =?utf-8?B?ZytuWHA0UWdSV245NXNKNG1UdnRYZ1puQlJmOHYxMnlNNVNtQXpkWmVwYjFr?=
 =?utf-8?B?amhVbG43K3Jwb051YVFoTjhYSDBUVER5WXpTaWVSNkJkK1R2c1B0Ry9ncXlJ?=
 =?utf-8?B?WDdudy9GL3JSTDJYM0h0TEErNGxhMVRzMXhiZ3gvRTRnVVZZdTFWdmtjUGg0?=
 =?utf-8?B?ZHNtS1Y5a1lWT3M5YUp2NUN2ZWZFdVBpamQrWGJuQ3JDU3E1cmdRaC9SRnBU?=
 =?utf-8?B?Mmgyb0hvZkYxKzFsd1VWYUNGQ24wVXh0cndGZnRJc1JqcEg5VFlMaTRIZDNz?=
 =?utf-8?B?OSt6ZVNaR3BVZzcrYW54MHJqYWNNSFd4VjBwMmg3UGR4YUVtRzhUSlIvRGQ1?=
 =?utf-8?B?dmZxRTRkZTBGelBodVJWQSs5NHFKSWNBSUNCaFA3NGd3SlpPejlzcy9LT2d6?=
 =?utf-8?B?TGRtdUprRHdTaDNEN2dOSHBtUnloMStxMS9vSVZ0TkFWcFAyR2Fkcnh2SmRq?=
 =?utf-8?B?dGJtekcrdC9LYTd5V2dLb21uOExNL0VHc0FvcHA0emw3clBnTFBlcE5aU0Zk?=
 =?utf-8?B?QU1EdXZmSDU0Tyt4UXVEYmVCcEh1REpiU3NTY2FtanozVTI3SkNTZEhMVE5a?=
 =?utf-8?B?S3VPWENaaEphYnU3SGRkWkxXWWdaTzNLbHVRMG12Wk85SGtDRE1pZ2o1OXRz?=
 =?utf-8?B?bEduSWl2SFBLR0hJK1FIdnRtbUMyNmVGei9kTC9WZDBmbkpuSGgzM3BUK1hZ?=
 =?utf-8?B?eWpMb0pHWHdyVmlLZStnV3lLZnBMajVGa2doditYMUdYRWF3Z1ZHeTBMOFo2?=
 =?utf-8?B?RGhpQnplNmlmYzkyRm1va1pSMUNhWGgyUGMxa0dPREVFU2ZEN3hwMDZoU2dI?=
 =?utf-8?B?bVJ0MGM1c1NocXpUd0ZCY3JEWUhKSFM4UUM1U2FxSWo5d0tVbmdRV3RqMEJT?=
 =?utf-8?B?aXo0cy9kM0Rqa2l3ZWRUZjk1bVNmWWs3dmJQanhjbW9XcDAzbWFFTXVaWURp?=
 =?utf-8?B?UEZyaGR6WDExRlZkVGJwNy9uR3psQ0hkR2ZJSGt0NU5hUitUdWkxcW4xeUVM?=
 =?utf-8?B?bjNRYWNVSzRFTUJ0NXovNERoN3lpb1FEUHY2c3JZYWM0dnlZSVBkSjQxaDZQ?=
 =?utf-8?B?ZWlOclg3T0VobEsySm1mMWx3SXBZcmZYSEtyd09RUWtEbWduMEVTMi8wNWZD?=
 =?utf-8?B?aWhqRzZrWEZDQWZoSzJIOC8zTDZFRko5Q2s2OXBIdERvbCtSOVY1Q01jalVa?=
 =?utf-8?B?VGdQYll1YVV5ZmQ2ZmZZR1NKOHlTNTNQSVNtY2R5RVpleU5HK09BQStHTE9j?=
 =?utf-8?B?eXBuR0RqL3AzS3VQcmU0T1Y5SmI0dzlzZnBLUDhnVkFSN3hNd3VTN2NlbnIz?=
 =?utf-8?B?aTR6ZXJ2MWZDYUU0Y3BGdlJJUjVMNzc1WmwxRVJycHY3YmRUcEZ0TTZEMWtM?=
 =?utf-8?B?RE40aFRxMWRhUG1SdFhEd0RQdVBpZEQ4V1pWL2JKU0tBdmZISGVONkpNMmxt?=
 =?utf-8?B?VFRrK1pBSG1TOWNlZjd4NXAyT1VSTHg0YkxadU8xSE5DRVhObHYzOWNQUXF5?=
 =?utf-8?B?YUthWmFaU1pVMng1bTNXTTY4ZXVUR2ZLL0JnQmdkVDZDaTFXemZGS1dqWUR0?=
 =?utf-8?B?UGxVTTVpRGIyNmFqSkU3QlVjVDRPY2lEWXcrdHhoc3hFR3ZQNGV2U1IxNTBa?=
 =?utf-8?B?dk9kbExGWnNweE1MOEpmakFaQkVCMnZSeFJueDZ6aWk2ajdCSXVCQ2RmdjZj?=
 =?utf-8?Q?CgIkNOHlMH1qaofwT+xb24LnC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14218295-152a-4c74-e60d-08da7669333b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 22:32:23.2522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v2rhuXvrPuWNTRyDio5dba6swQrUWWaZct4JohzSP4FQfAeXMQqcBS/XhxDxXDCPJOyP/3KEwGuMkE7DpCE6oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB5525
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
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-08-04 11:01, Melissa Wen wrote:
> Describe structs and enums used to set blend mode properties to MPC
> blocks. Some pieces of information are already available as code
> comments, and were just formatted. Others were collected and summarised
> from discussions on AMD issue tracker[1][2].
> 
> [1] https://gitlab.freedesktop.org/drm/amd/-/issues/1734
> [2] https://gitlab.freedesktop.org/drm/amd/-/issues/1769
> 
> v2:
> - fix typos (Tales)
> - add MPCC to MPC entry in the glossary
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> Reviewed-by: Tales Aparecida <tales.aparecida@gmail.com>
> ---
>   .../gpu/amdgpu/display/dc-glossary.rst        |  2 +-
>   drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h   | 91 ++++++++++++++++---
>   2 files changed, 78 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/gpu/amdgpu/display/dc-glossary.rst b/Documentation/gpu/amdgpu/display/dc-glossary.rst
> index 116f5f0942fd..0b0ffd428dd2 100644
> --- a/Documentation/gpu/amdgpu/display/dc-glossary.rst
> +++ b/Documentation/gpu/amdgpu/display/dc-glossary.rst
> @@ -170,7 +170,7 @@ consider asking in the amdgfx and update this page.
>       MC
>         Memory Controller
>   
> -    MPC
> +    MPC/MPCC
>         Multiple pipes and plane combine
>   
>       MPO
> diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> index 5097037e3962..8d86159d9de0 100644
> --- a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> +++ b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> @@ -22,6 +22,16 @@
>    *
>    */
>   
> +/**
> + * DOC: mpc-overview
> + *
> + * Multiple Pipe/Plane Combined (MPC) is a component in the hardware pipeline
> + * that performs blending of multiple planes, using global and per-pixel alpha.
> + * It also performs post-blending color correction operations according to the
> + * hardware capabilities, such as color transformation matrix and gamma 1D and
> + * 3D LUT.
> + */
> +
>   #ifndef __DC_MPCC_H__
>   #define __DC_MPCC_H__
>   
> @@ -48,14 +58,39 @@ enum mpcc_blend_mode {
>   	MPCC_BLEND_MODE_TOP_BOT_BLENDING
>   };
>   
> +/**
> + * enum mpcc_alpha_blend_mode - define the alpha blend mode regarding pixel
> + * alpha and plane alpha values
> + */
>   enum mpcc_alpha_blend_mode {
> +	/**
> +	 * @MPCC_ALPHA_BLEND_MODE_PER_PIXEL_ALPHA: per pixel alpha using DPP
> +	 * alpha value
> +	 */
>   	MPCC_ALPHA_BLEND_MODE_PER_PIXEL_ALPHA,
> +	/**
> +	 * @MPCC_ALPHA_BLEND_MODE_PER_PIXEL_ALPHA_COMBINED_GLOBAL_GAIN: per
> +	 * pixel alpha using DPP alpha value multiplied by a global gain (plane
> +	 * alpha)
> +	 */
>   	MPCC_ALPHA_BLEND_MODE_PER_PIXEL_ALPHA_COMBINED_GLOBAL_GAIN,
> +	/**
> +	 * @MPCC_ALPHA_BLEND_MODE_GLOBAL_ALPHA: global alpha value, ignores
> +	 * pixel alpha and consider only plane alpha
> +	 */
>   	MPCC_ALPHA_BLEND_MODE_GLOBAL_ALPHA
>   };
>   
> -/*
> - * MPCC blending configuration
> +/**
> + * struct mpcc_blnd_cfg - MPCC blending configuration
> + *
> + * @black_color: background color
> + * @alpha_mode: alpha blend mode (MPCC_ALPHA_BLND_MODE)
> + * @pre_multiplied_alpha: whether pixel color values were pre-multiplied by the
> + * alpha channel (MPCC_ALPHA_MULTIPLIED_MODE)
> + * @global_gain: used when blend mode considers both pixel alpha and plane
> + * alpha value and assumes the global alpha value.
> + * @global_alpha: plane alpha value
>    */
>   struct mpcc_blnd_cfg {
>   	struct tg_color black_color;	/* background color */
> @@ -107,8 +142,15 @@ struct mpc_dwb_flow_control {
>   	int flow_ctrl_cnt1;
>   };
>   
> -/*
> - * MPCC connection and blending configuration for a single MPCC instance.
> +/**
> + * struct mpcc - MPCC connection and blending configuration for a single MPCC instance.
> + * @mpcc_id: MPCC physical instance
> + * @dpp_id: DPP input to this MPCC
> + * @mpcc_bot: pointer to bottom layer MPCC. NULL when not connected.
> + * @blnd_cfg: the blending configuration for this MPCC
> + * @sm_cfg: stereo mix setting for this MPCC
> + * @shared_bottom: if MPCC output to both OPP and DWB endpoints, true. Otherwise, false.
> + *
>    * This struct is used as a node in an MPC tree.
>    */
>   struct mpcc {
> @@ -120,8 +162,12 @@ struct mpcc {
>   	bool shared_bottom;		/* TRUE if MPCC output to both OPP and DWB endpoints, else FALSE */
>   };
>   
> -/*
> - * MPC tree represents all MPCC connections for a pipe.
> +/**
> + * struct mpc_tree - MPC tree represents all MPCC connections for a pipe.
> + *
> + * @opp_id: the OPP instance that owns this MPC tree
> + * @opp_list: the top MPCC layer of the MPC tree that outputs to OPP endpoint
> + *
>    */
>   struct mpc_tree {
>   	int opp_id;			/* The OPP instance that owns this MPC tree */
> @@ -149,13 +195,18 @@ struct mpcc_state {
>   	uint32_t busy;
>   };
>   
> +/**
> + * struct mpc_funcs - funcs
> + */
>   struct mpc_funcs {
>   	void (*read_mpcc_state)(
>   			struct mpc *mpc,
>   			int mpcc_inst,
>   			struct mpcc_state *s);
>   
> -	/*
> +	/**
> +	 * @insert_plane:
> +	 *
>   	 * Insert DPP into MPC tree based on specified blending position.
>   	 * Only used for planes that are part of blending chain for OPP output
>   	 *
> @@ -180,7 +231,9 @@ struct mpc_funcs {
>   			int dpp_id,
>   			int mpcc_id);
>   
> -	/*
> +	/**
> +	 * @remove_mpcc:
> +	 *
>   	 * Remove a specified MPCC from the MPC tree.
>   	 *
>   	 * Parameters:
> @@ -195,7 +248,9 @@ struct mpc_funcs {
>   			struct mpc_tree *tree,
>   			struct mpcc *mpcc);
>   
> -	/*
> +	/**
> +	 * @mpc_init:
> +	 *
>   	 * Reset the MPCC HW status by disconnecting all muxes.
>   	 *
>   	 * Parameters:
> @@ -208,7 +263,9 @@ struct mpc_funcs {
>   			struct mpc *mpc,
>   			unsigned int mpcc_id);
>   
> -	/*
> +	/**
> +	 * @update_blending:
> +	 *
>   	 * Update the blending configuration for a specified MPCC.
>   	 *
>   	 * Parameters:
> @@ -223,7 +280,9 @@ struct mpc_funcs {
>   		struct mpcc_blnd_cfg *blnd_cfg,
>   		int mpcc_id);
>   
> -	/*
> +	/**
> +	 * @cursor_lock:
> +	 *
>   	 * Lock cursor updates for the specified OPP.
>   	 * OPP defines the set of MPCC that are locked together for cursor.
>   	 *
> @@ -239,8 +298,10 @@ struct mpc_funcs {
>   			int opp_id,
>   			bool lock);
>   
> -	/*
> -	 * Add DPP into 'secondary' MPC tree based on specified blending position.
> +	/**
> +	 * @insert_plane_to_secondary:
> +	 *
> +	 * Add DPP into secondary MPC tree based on specified blending position.
>   	 * Only used for planes that are part of blending chain for DWB output
>   	 *
>   	 * Parameters:
> @@ -264,7 +325,9 @@ struct mpc_funcs {
>   			int dpp_id,
>   			int mpcc_id);
>   
> -	/*
> +	/**
> +	 * @remove_mpcc_from_secondary:
> +	 *
>   	 * Remove a specified DPP from the 'secondary' MPC tree.
>   	 *
>   	 * Parameters:

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
