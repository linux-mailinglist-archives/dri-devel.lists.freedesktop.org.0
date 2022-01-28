Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC22D49FFDC
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 18:59:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F89710E318;
	Fri, 28 Jan 2022 17:59:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2050.outbound.protection.outlook.com [40.107.101.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBDD710E14E;
 Fri, 28 Jan 2022 17:59:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PT7bEOjd+KRBnoEoeUJTFdEASKVZ3v1j8ioBS34VPQctrEpi64ZKy6wCuohxUbo2M/ZspUXVvqfwHuPRHkC6Bb9E4mFKXgo1B3+o5x89kI5JRv2V+5Gaw4vHH1RoVosT6adqin3arNeAF2q+pCkSmy6kEgmwlL0ucN154bve+4+4mLOurzDqCN5OlbjiHKfldXLPVFS/WcgD2s2vx45LIl0PzS7YACXjEuh5juetLEbU87GIUI7vBmp9T37+GoYS8x1RtQ02CJveDXwTEzbew/NOPFFimF2NyEgN8HG2g0UKrdaPcUJSvFxwRGqhtMaqGHPr56sVqsZviRyKPtb83A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MVvbwMBvdWK1hUMeFrzLPDoOowFEi1usBRg9uDsG59g=;
 b=FyBLF5douMhGqJuw/WpRQVH7ySVmpoQiKv4RLZmMjTUwoYzwtzzHJvgt3TIKxitRcUWev7DnBdb5xIDI/bSDCN0lArhUf4eKL3ut+T3TQtOjdp4x7k08ujZQgkHdHu6L2PsBRargske6fDRG/+JQYJ0dHyfnPiV35CsqSgqcCiWQS53GFyO9nFcUxGa5T7DqgNa6cKEGdCcxBbd9P7uBlgOySy49+5CMU497lTcsnhNrJajMWiwMuAU/ZLmwKfCqW3MEzo4Q0YNNBNiVM/MZyMP5T9Mi38FoTRHzwTA1OtP6g9tj/8TFSY07v2MyIAcAYX6N/JFjcuwgMOnhvW+Sqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MVvbwMBvdWK1hUMeFrzLPDoOowFEi1usBRg9uDsG59g=;
 b=lruWfrhxhxMLnJGmVPquM/00d/lY9ojQ35MeOr4DZRepdngXXshQ/2OXMptpHTAiHsDI17oKQSs1p0q2YXUK0GwPwaBQ4Btd3Qdxdt1mIkjvFvi+UjAHaZy62CVzrTbFy9PkD2EjXt+OrCvCP6VmqpjH8bDAjnDsbsb6B4UYkfE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DM6PR12MB4844.namprd12.prod.outlook.com (2603:10b6:5:1d0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.18; Fri, 28 Jan
 2022 17:59:42 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd4b:b67b:1688:b52]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd4b:b67b:1688:b52%9]) with mapi id 15.20.4930.017; Fri, 28 Jan 2022
 17:59:42 +0000
Message-ID: <6a5b1f8e-22a1-9c26-aea4-6bb38c4aa084@amd.com>
Date: Fri, 28 Jan 2022 12:59:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH][next] drm/amd/display: fix spelling mistake: synatpics ->
 synaptics
Content-Language: en-US
To: Colin Ian King <colin.i.king@gmail.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Xinhui.Pan@amd.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20220128173502.594099-1-colin.i.king@gmail.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20220128173502.594099-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YTXPR0101CA0007.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::20) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 486e7d39-5d44-426b-1513-08d9e287f5fc
X-MS-TrafficTypeDiagnostic: DM6PR12MB4844:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB4844808CCDA02ABA2C1E9F668C229@DM6PR12MB4844.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:167;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ECqQE4rJOk08rSPUmAg2TzAwMLlo4H5H2avKRU7yYyp194qIBc3vBoQ7jsfQMDQKHoPhJNi4ng6xqm7QyO67Cui0f2fcLtWkSiH6om+kda23Q61E4uy5paFGKhRfAs1MnxSgYGXP3yGPaM2O/TzIkJ5xg/apVbDbDs1pzUhc2fz9BXHQi+csyoVxguU9IrumSPdSaHlTZmN+uGNjclZjPqGdPR3jt8iGzVu6Oq5SZN+yc7R61HZfcPing1ApWSGNof4HWzNGopKwEde9uxu7fqi2QBVmi/arcId+J9RtPTM2dmUPygODKsKoFsE153mPxVpxodOGvZlSuoUAfwWNMglv0wxt28x3ok4mWuUgzAWBAJkQyCcrWoBXjha1vb+bhSTkQI43gCouc/Jl3KwgYpPLkWjcFeyO6NOVZMsVi+gAP1qJdaIh+1tDerFL/l1TeQuyyjo7kgvkA3tZ7KgeGCF73h8JaknatKFSkoOVroZZu0GieoK6cBoxLy0yTQTLSvmiQXWKObbaDINiwZxLyVN8OkVj8A6TGfGyiMTS9mjH4hn/oCgaOr5eYE0vTLoiFzhC7iYLTfb/Tt3/MXr2F+7brIrz3WpaUSzUSN1epjTgHdTX3wMgNq33xWUyItuSy/BYxQdHKwx4i4xqvB7UY/WYqlCBJrp51QHQNnCPY0MHclGwwIdX6RbtDRewP/T3cw+aKlVuej3cFndjZUpgID0m2vVdTa9R6wbfLkL/am2mqUH7tfuuPjs5th81TVDx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(53546011)(6512007)(6506007)(316002)(8676002)(2616005)(31696002)(86362001)(6666004)(110136005)(8936002)(508600001)(66946007)(66476007)(66556008)(6486002)(4326008)(186003)(83380400001)(44832011)(921005)(5660300002)(31686004)(36756003)(38100700002)(26005)(2906002)(45980500001)(43740500002)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlRGQTB3S3JjbHNRc2QxWHF0T3UzM01DUVYyMG5sb0h5YUN1WG9LODVNSzRQ?=
 =?utf-8?B?SDdOa21teUVWeW56UVJwdDhmNWNvbXVTV1c2Vk92OGRteTZNS09MUU5hZldC?=
 =?utf-8?B?Y0lrTDBIMnRtcTJkWGtwdEx3c0RRZjNSWG9nZ1U5Q1JoRmtSVDVXMWF2Y0Uw?=
 =?utf-8?B?cFR0TVlybVlDbGI3T3VOeU1SMmQwd25JKzg5NG5vbVlUWDEwaFpqYzlqTjlo?=
 =?utf-8?B?Y0oyMytBMTZQZ3lrdVFmMGRPMnZVSU1rbE1hb1kxRndZMjJHTmF4d2pGTk9M?=
 =?utf-8?B?WCtqUHZVc2FuM0FGcWl1bXlSeFZ2dFYzbnM2TWthTnNQNGN1czE3dVcvR0xJ?=
 =?utf-8?B?b2Z6OFFNUWFxR0Q0aUFFVXEyV01uOVlJTzFXSERqNG5uU2RnV2dZVXVlamJ4?=
 =?utf-8?B?Sldxc1puN1VuL0w0SDljNFdlRGNEN0I2VGVBeUJtd2dIckFSMkN0a0xZNkF3?=
 =?utf-8?B?TzA5a1FXUlVsbkgzS1I2cDcrb2Q0cXF5TmYxNXRKYTNuR3huTWJPQ2F2RzNa?=
 =?utf-8?B?OUZoVUVrblVzSVFjbGkwVXF4TldKU1pyaWZnR256MXFVdU9xelkzTUlrYys0?=
 =?utf-8?B?OG02Tm14NWo4YkZhUFh2cDN5amN3Ym5wa3VPRU1RdjVVTDdIWHozbXJtQjVy?=
 =?utf-8?B?RUdCelEzdncwM3RVSUtEQTNKS2hTb2U2a1ZmRHJHVURlREpxMWFGd0puT0VU?=
 =?utf-8?B?ZTgvSE9QbVRoQ05xUllGVEZiR2pXQ2dENUxaTGROTS9CeElmNDg3S281K3lN?=
 =?utf-8?B?cUtOL0pvMnhjYnZZMEwyUDliMHd0TmZnc3NiZzVQa3RyNUVPTlRXLzRiQXAy?=
 =?utf-8?B?SllZUzlnRHV2b2k5eVYySlRzLzE0dmJlaWtnMFJ3OTNhOFhKdHo5a2dFV0VF?=
 =?utf-8?B?R0V5Q3RyenRXMmFSYjhOSVFEeTFCK09QSDZQNU4rSEx3eks1UkFmd1k4amJ2?=
 =?utf-8?B?dzZjWG5CMTVQRnNYa0NVVnExeDZKdjhzN3ZSYm92SUZyVFJyS2IzYlZlZDFT?=
 =?utf-8?B?TC9Xc3ltQ1B2WG5NdVI0TjB4N0R4L3JDdGVGNitEOTNEd1hnN2xGVzkyQVNq?=
 =?utf-8?B?OUEya3pPMUlQTDNWRVBZVnFpZjc5VWtjUFR3K05YQ2p4a2RXZkdqOHdQeWNK?=
 =?utf-8?B?bFBPT3p4aTdISUxQMEFmWWFIalZSL1Z2b3FJQ05DK3BrUnp5aDRrT2dWWGti?=
 =?utf-8?B?N2xKNFVLWGlkTGF2Uk10V3B2WVBtTDhHV0krcDVMQnpoWlR1SUhkYjY5Zkcz?=
 =?utf-8?B?UGZUYk05Tjg1OGdaMEFaejRIRmszbVRiWTd1dTFBMVVqd1dDVmlNUHpsa3FM?=
 =?utf-8?B?eWVmam5ibDVKZjhvd2tTQUVzR0hyZS9kSnlFQ01KZXk4cEsvM2I5cFhPZEhK?=
 =?utf-8?B?ZXZaeFh2Zm1Jajg0aGdPZGpPNWhqSXhLc2dlT2pUekoxdFFJWjkxS0NLWGhX?=
 =?utf-8?B?MlVndEYwWWM0K1h3YWtwb3JxekxxdnpjeFh5MUowMDlLMlg4SWI5NVhFZ0N0?=
 =?utf-8?B?ZzFJdVBXcGh0NzZEU2gzYlFSM21IeVF2blVEcnF2NTRlOVRpOGJ5N0xKWFZk?=
 =?utf-8?B?cWRBSFpmOEpBQVcrc0JjKzlvczcxY1A4bE9BekRmTEJYUkJQdXMvRjhkK3VS?=
 =?utf-8?B?bHhUQlFCTE5FRXpObHk0VXVwRk1GbVBQNW5mSkxuY0xTWDZRMmZLMFJEMjNR?=
 =?utf-8?B?KzU2UDN6Vld2VzRSSitVcGFxNGdUUXdaV0RlTUZSOCt1cnR0a0tZN1M4TERO?=
 =?utf-8?B?d1d2d0hEMTZJT0JvNW1rK293eUVQcktFc3YydTUzRGx2WUFaSk1sMkFhMC8w?=
 =?utf-8?B?RlJKeWVtWWt6eU9NOVBWWWVETnpWK0cyalNoRmhpNmNpVkR0NWZNSXhXdmdG?=
 =?utf-8?B?aDBsSkRhMXN0MldSSGNxRlVkZnpoYkpEZ21yUVR4VmUrVkdHWVhnWDljY21W?=
 =?utf-8?B?SzQvaSthRUVpdjhNQWV0dGF3TisvT09LL0VCc3YwWmFzSzJ5Mk4zcVlPb0Nv?=
 =?utf-8?B?MUJNa1V1OWN0cEVmNElqbVhFTEhMMklxbXMwVkFkTGI4b3pZcDdNbGxBUlVm?=
 =?utf-8?B?MUo1L0pZODVRZWxLdGgyeitTTHAwMnhtR0xyckR4dnBXRFpDOUJEQnRtSGxC?=
 =?utf-8?B?WHFJYkVjM2lPVDhRZDI0ak5URmFlUEtrcDliZ2xhWUZMVnBiYkFZSmpIK09K?=
 =?utf-8?Q?SKkikPfu9Zzhq7f81fgDpmY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 486e7d39-5d44-426b-1513-08d9e287f5fc
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 17:59:42.6765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G7501eqzHXcpT/zuqjvtjvVYYD6zZmrGXbaGG4OCqiUPNWKnVPGODZRrUPT2vYsJb7e1QqF8dzfE0ZQrBdTrtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4844
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-01-28 12:35, Colin Ian King wrote:
> There are quite a few spelling mistakes in various function names
> and error messages. Fix these.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 32 +++++++++----------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index 75b5299b3576..db4ab01267e4 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -539,7 +539,7 @@ bool dm_helpers_submit_i2c(
>  }
>  
>  #if defined(CONFIG_DRM_AMD_DC_DCN)
> -static bool execute_synatpics_rc_command(struct drm_dp_aux *aux,
> +static bool execute_synaptics_rc_command(struct drm_dp_aux *aux,
>  		bool is_write_cmd,
>  		unsigned char cmd,
>  		unsigned int length,
> @@ -578,7 +578,7 @@ static bool execute_synatpics_rc_command(struct drm_dp_aux *aux,
>  	ret = drm_dp_dpcd_write(aux, SYNAPTICS_RC_COMMAND, &rc_cmd, sizeof(rc_cmd));
>  
>  	if (ret < 0) {
> -		DRM_ERROR("	execute_synatpics_rc_command - write cmd ..., err = %d\n", ret);
> +		DRM_ERROR("	execute_synaptics_rc_command - write cmd ..., err = %d\n", ret);
>  		return false;
>  	}
>  
> @@ -600,7 +600,7 @@ static bool execute_synatpics_rc_command(struct drm_dp_aux *aux,
>  		drm_dp_dpcd_read(aux, SYNAPTICS_RC_DATA, data, length);
>  	}
>  
> -	DC_LOG_DC("	execute_synatpics_rc_command - success = %d\n", success);
> +	DC_LOG_DC("	execute_synaptics_rc_command - success = %d\n", success);
>  
>  	return success;
>  }
> @@ -618,54 +618,54 @@ static void apply_synaptics_fifo_reset_wa(struct drm_dp_aux *aux)
>  	data[3] = 'U';
>  	data[4] = 'S';
>  
> -	if (!execute_synatpics_rc_command(aux, true, 0x01, 5, 0, data))
> +	if (!execute_synaptics_rc_command(aux, true, 0x01, 5, 0, data))
>  		return;
>  
>  	// Step 3 and 4
> -	if (!execute_synatpics_rc_command(aux, false, 0x31, 4, 0x220998, data))
> +	if (!execute_synaptics_rc_command(aux, false, 0x31, 4, 0x220998, data))
>  		return;
>  
>  	data[0] &= (~(1 << 1)); // set bit 1 to 0
> -	if (!execute_synatpics_rc_command(aux, true, 0x21, 4, 0x220998, data))
> +	if (!execute_synaptics_rc_command(aux, true, 0x21, 4, 0x220998, data))
>  		return;
>  
> -	if (!execute_synatpics_rc_command(aux, false, 0x31, 4, 0x220D98, data))
> +	if (!execute_synaptics_rc_command(aux, false, 0x31, 4, 0x220D98, data))
>  		return;
>  
>  	data[0] &= (~(1 << 1)); // set bit 1 to 0
> -	if (!execute_synatpics_rc_command(aux, true, 0x21, 4, 0x220D98, data))
> +	if (!execute_synaptics_rc_command(aux, true, 0x21, 4, 0x220D98, data))
>  		return;
>  
> -	if (!execute_synatpics_rc_command(aux, false, 0x31, 4, 0x221198, data))
> +	if (!execute_synaptics_rc_command(aux, false, 0x31, 4, 0x221198, data))
>  		return;
>  
>  	data[0] &= (~(1 << 1)); // set bit 1 to 0
> -	if (!execute_synatpics_rc_command(aux, true, 0x21, 4, 0x221198, data))
> +	if (!execute_synaptics_rc_command(aux, true, 0x21, 4, 0x221198, data))
>  		return;
>  
>  	// Step 3 and 5
> -	if (!execute_synatpics_rc_command(aux, false, 0x31, 4, 0x220998, data))
> +	if (!execute_synaptics_rc_command(aux, false, 0x31, 4, 0x220998, data))
>  		return;
>  
>  	data[0] |= (1 << 1); // set bit 1 to 1
> -	if (!execute_synatpics_rc_command(aux, true, 0x21, 4, 0x220998, data))
> +	if (!execute_synaptics_rc_command(aux, true, 0x21, 4, 0x220998, data))
>  		return;
>  
> -	if (!execute_synatpics_rc_command(aux, false, 0x31, 4, 0x220D98, data))
> +	if (!execute_synaptics_rc_command(aux, false, 0x31, 4, 0x220D98, data))
>  		return;
>  
>  	data[0] |= (1 << 1); // set bit 1 to 1
>  		return;
>  
> -	if (!execute_synatpics_rc_command(aux, false, 0x31, 4, 0x221198, data))
> +	if (!execute_synaptics_rc_command(aux, false, 0x31, 4, 0x221198, data))
>  		return;
>  
>  	data[0] |= (1 << 1); // set bit 1 to 1
> -	if (!execute_synatpics_rc_command(aux, true, 0x21, 4, 0x221198, data))
> +	if (!execute_synaptics_rc_command(aux, true, 0x21, 4, 0x221198, data))
>  		return;
>  
>  	// Step 6
> -	if (!execute_synatpics_rc_command(aux, true, 0x02, 0, 0, NULL))
> +	if (!execute_synaptics_rc_command(aux, true, 0x02, 0, 0, NULL))
>  		return;
>  
>  	DC_LOG_DC("Done apply_synaptics_fifo_reset_wa\n");

