Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1746CABF2
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 19:37:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E658F10E06D;
	Mon, 27 Mar 2023 17:37:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::624])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ADEA10E06D;
 Mon, 27 Mar 2023 17:37:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cDODvRDeOW/pytIKhDVaAb4/fN+p/OIisIC8+HWdOFbOJTZx8qVP+KCvkRjTJN/XLFPCgj18xUCelly35jxHesK5gSOgXNq3ZZwJX+a3WrAdo8DetSoB/N+ld+ZVcvKFE+NBgmAfJ2rgimoBwFIVgxwbkIGQP2welsRVg+Cx5VbjF7SMSz7wXQh02gSB5oWeD8hk3GqRjeIEIqxLFKjmobCGNLJROfptRtONwUjCr1DIaD8JRfiAJUfbk1s1zftf4FMnrY6aTCkWFQv5IkBP9LQoEMHe/Xpyy+e7A+vF6XKMuVgNoJsLELPHLVocAmf7TARraCEYZITRUfRq8/ZLXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f7RZu7eUsyIXv6NA8USQ3UiNbS+u4XuPIos7IAnPPB8=;
 b=B4kQv1fWnymsNFtLsQ3yI2GJixxp+UKI+9EkUWtHjYRJHqUuOo8+SZqbdAX41fvHT6+hJ5IBGKzKBKRfxTqIdnS6V3zMrscbkzkQaF7wH4jQH0bHcf5+lumypEFrZ2VH2PXgLWlvPD88HBfEfN1LewP0YYUCRdxwfN6T2GCz9B68Mj4BU6zTjV07bvrwyl6xnwYGPXMgG4DNao66sEko4gQVi9pCIl5JGBW/2FYyRP0sBSovvMuqdgzaVgB9oXQw0pxxgE/d35eCK6u6/rQ+c9W6eFNjkyaQ1dLop/cqNrp45X/xRLJPovX9CWighqmoNPn/z3nv/Mgsj5UprdW8LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f7RZu7eUsyIXv6NA8USQ3UiNbS+u4XuPIos7IAnPPB8=;
 b=pwXHSISgmB+WksWZSNkhUYqSCCQ5AAZ8MYLn16IrNjeJ7rsxt6E8N7VyDpSI+GXlLCkOPKeVKX87EIZrRbITMVsa54Fuh99KoU/np0wrnDmWcyc4Jho+42N0kD4ovMrq2ruwDmbgwuM8Rb68Md2UWK1JXtHGAlSvLClL5oPzxTM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 CH3PR12MB8403.namprd12.prod.outlook.com (2603:10b6:610:133::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.28; Mon, 27 Mar
 2023 17:37:45 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::cdcb:a816:4bc3:a83f]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::cdcb:a816:4bc3:a83f%9]) with mapi id 15.20.6178.041; Mon, 27 Mar 2023
 17:37:45 +0000
Message-ID: <a7e13ddf-cfec-d89f-dc39-fa6fcc58dcfa@amd.com>
Date: Mon, 27 Mar 2023 13:39:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/amd/display: Whitespace cleanup
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>
References: <20230327160754.772302-1-u.kleine-koenig@pengutronix.de>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230327160754.772302-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0089.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:84::9) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|CH3PR12MB8403:EE_
X-MS-Office365-Filtering-Correlation-Id: bc33a693-e3ee-45f5-f7b8-08db2ee9f9c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MXz3rOV/wpioVQLcz6Vr+GgL+XL+He4wFPtJBOeykpnvQiBeBxkh65uaWHbTZvLhJVoXQpoy3McCUKCIxeLCHDj+lpSoBU1eRyYt8mV8zdLqqN0gwfNgUlk0NOFXF1BKIMDaQ8QxguMO/urWf+99PgUQ7ZsCMJg3hF//wr4QdwwbGsPOYZdmsVLar1eoNWHAX45hPXOH4E8q3Ve3M/G8eEPVOpU1OUxzznWBausHzAqSI6nyaV1B36d0MBDO/a+3GuV3x+V2smJvC7L/aMQqpCbbeQQC7iRBfJBL7CohIfdDtyM1+BXGLSrWLmWj8wP97wgb4pck21CnwSjfMzI3BtaRd3O1vHO7qPtD+WsQGLRrj8jxJjXBzV+wkMWqW+3tZUKYecBMRK1BoP27wbur0JHwZnIrBIEC5IDcSdk1bpsigllAm/EBl9D4MkqOQbFnbLvqUwpCKbJOc+siy5slPJIamMnR3DSo5/DYrbub5dlVHxR9MMX2AIjQKnr3AEK0RDsOkPLOpeDDqlIF1DqM8Qt9WQuRcUiZPw6/ci6AQedv3ZZB7jRO+JCMVrp3W90SBSi1DxZprjB4xt6L2dIzXhjCU1UkL19FKIRFSn4NbG5WdG8sYIaXtsmlatsAa+F/+k3ViE/ydH/lq8cR51AxTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(366004)(136003)(346002)(39860400002)(451199021)(2616005)(66574015)(83380400001)(8676002)(66946007)(66556008)(2906002)(66476007)(6512007)(4326008)(6636002)(478600001)(316002)(186003)(110136005)(26005)(53546011)(6666004)(6506007)(44832011)(31696002)(86362001)(36756003)(41300700001)(8936002)(38100700002)(6486002)(5660300002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tjk2YmMvWkdnTVBURWVlVlRXeVBNT1grOUlnQ3E2SzYxYi9VREx4WDFhbnM3?=
 =?utf-8?B?bThubnJYQ0JuSTE2b0dWVVFISGZuMHBZeEhBQjQ0aFV0VzlCMFFKMHU5UzJr?=
 =?utf-8?B?eEtaQ3NRZFpuSjgyeTFYdDVzOHNGREk0ZFNPcGlHRXVrd25ZZSt1SHFNVlF5?=
 =?utf-8?B?anBNYm55V0VvcTJSNHRTOEozSGJPM2JFaDRGMGd0Q0FxeFBSSEpjeXIzVlVM?=
 =?utf-8?B?MFkweVU3bEFZdTdIKzF1TkRQbzl2TmFLRjZaY2VWSys5amZoZEpNOXlRcllY?=
 =?utf-8?B?Q3FoYW11SGY4bDRyenVDSmlSTEhCVGlrb2Z2ZjAvYlVmNFBNMmNJSHpNRTBs?=
 =?utf-8?B?Zzd3d2xZeVBXandxMi95UlV0OHppZmE2RzJWRFVHSnBTVDEwRWFZcWxLcVFL?=
 =?utf-8?B?aHB3Y1YxNlZmaldqYVppWElTeVllMEluUEtyZW5GemlNQVhtMHdjK2xBRW1W?=
 =?utf-8?B?akYranplN2VxV0g1d0kwQkpzOTVDM0IxOXdxa0orQklNemRxUmRnV2dJRndR?=
 =?utf-8?B?WkdjMEpjZ0JoQ3J1ZWZTRVBaTlExckNuUm0wWTRvM09qYXZjczVJckFTNGZO?=
 =?utf-8?B?Qld4MjcxK0d1UW1NY1lYVkdEOHZvUTFMT1dxVTFON1JqYjNwT3JUSVJ6ZXpY?=
 =?utf-8?B?amlRZ3dJY1VWbUVGWGVnOFB6TXlLbWsrVDJMT1doU25KWlErdTF4dDRMV3Mz?=
 =?utf-8?B?ekhZa2l6Q0ZUSFZMOXNUSWJSOUdxT1g5cVY2cWVUcFZQUm5FWmxXaVJnRGx3?=
 =?utf-8?B?d1FBcjgrUmdRejV1eXlNcytiTWxRTEFOQ3JyQkc2S1lqckZmV3A0ak9QakVu?=
 =?utf-8?B?TDBmYzV0SUlSekdyNTY2R3VneC9DeVFvaUd4eVNtYVZsbjNJRE1ubkhRblJC?=
 =?utf-8?B?eEM4YldqencvQXRYaTVidHFZclBUTnNMUkp3QjFsdVArL2JFMU1BcTFYSWxh?=
 =?utf-8?B?cVE0S2EwVWJodVRBU0F4TDJhUDgwejlOaHFFNGg4YUFkMG02SjZZS2JoekpK?=
 =?utf-8?B?ZzFxa1pZVUx0djZhcnFZa1R5ODMreXRGdmRtSGNyV2VHL2lNWU5JVG1zS29P?=
 =?utf-8?B?WVlmcGRZTm80U0pMRzU3TnVLcVk4MkYxZTQwWjV6Y1Z4S0pxZ1Q5a2J0TWc3?=
 =?utf-8?B?RVJtb0RrMWtiMDZUMkd1MTMxWE1OSGM0OXNJelBGV1VMV1ZjdlBTQkFOcVAx?=
 =?utf-8?B?QmRZcFRHemxyZlByaDN6WUJ2Zm1qMllyZERkanFpNUlLYk1VZitJbGJzN2hR?=
 =?utf-8?B?aHBlZVZQUlVsRk0zQ1NTSElyQlI5WXI0enB6M0lmV2pSclJPVWYzSXlwcllI?=
 =?utf-8?B?UzdUL0NWTGtsVk9QbWFtcGdxMjlVa1lVeVJSZklpNHhaR2tYVHM3enA0YWRj?=
 =?utf-8?B?ZHAvU2pRSGlkTFN4WGw4NGo4c3hCdUZkNEhUc0RwMFZCRVFoaEx2TDdkVDdv?=
 =?utf-8?B?NjMveFdaQTFWSWR5c0hkTkpvcXI1MDFhNlFCVjJ3RTNXTDl1OTFKd0JTK0Jq?=
 =?utf-8?B?R3lWTkNKNmJDMmJWdkxBMlhiSXRSODFOSzZHK3Z1ckVrS1VFekMrYnF5aXRU?=
 =?utf-8?B?ZUNIUEI4WkViYlNjSk9BRVRna2ppOFpLaXhZZHIzT1JORGt1REVzcUF4RXJO?=
 =?utf-8?B?ZmIrTXRvNlZBa2Ria0xqakNOdCtmWEl3Tm5WYjhXZ2ZDV2d6TFNaTHkvbTlH?=
 =?utf-8?B?NmJwYzJsNFZXTkN1VFZ6TFAwSHFaa3QrMXdFRE80TkdhdSsvbDVUU1ErbTVh?=
 =?utf-8?B?UkkxSUxOZWZIQndNb2tkaG5aL2F1dVZkMGpTYUNHRnNsNjFITzlBb0twajVt?=
 =?utf-8?B?S3c4SVFyc1lyMHpXWEU0UytITlF4ak5McmpCRHhnTWpiMU9pdmsrL0RhR3RY?=
 =?utf-8?B?T25CdWQ0SmRLbHEzZG1CVXJwbnEvWURQcnpOdHBqbzhwNDlrR2NsQ09Sd3Zu?=
 =?utf-8?B?MElKMENzTWo5QkRrVE9mSCtJZ0RFZ0Y3K24xNXRMSllsV3dZN3VUQmV5TzQz?=
 =?utf-8?B?UE1aeUQrbjB0MXdMenpWOUo1cWVkckpzZ1hrUlAwNlBxZFRKVURtYzdBcFhB?=
 =?utf-8?B?dkxMY2l6S2NtTmZ2UWJaY3lnRUNaWFFRbGxjZE0wRG1LcWtoK3p3djhKNno1?=
 =?utf-8?Q?BzQOUZaKkQZGiNnA1qdX09tuK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc33a693-e3ee-45f5-f7b8-08db2ee9f9c8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 17:37:45.8043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LVx4cXpmcglgymg4QKK1zu2eQxcrShg9bTHhAkMNdjOh+Mh8mNP8eUyn4ZHc5FNAax+XOCZthy65XXf2DUjeWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8403
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
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/27/23 12:07, Uwe Kleine-König wrote:
> Commit 075e2099c32c ("drm/amd/display: Fix race condition in DPIA AUX
> transfer") was backported to stable, which I noticed because of git
> saying
> 
> 	linux-6.1/.git/rebase-apply/patch:37154: space before tab in indent.
> 
> while applying patch-6.1.21. While fixing the code location that issued
> that warning, improve in few more places.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Applied, thanks!

> ---
> Hello,
> 
> while reading through the driver I found a few more things that could be
> improved. E.g
> 
> | @@ -2625,43 +2625,35 @@ static void emulated_link_detect(struct dc_link *link)
> |  		dc_sink_release(prev_sink);
> |
> |  	switch (link->connector_signal) {
> | -	case SIGNAL_TYPE_HDMI_TYPE_A: {
> | +	case SIGNAL_TYPE_HDMI_TYPE_A:
> |  		sink_caps.transaction_type = DDC_TRANSACTION_TYPE_I2C;
> |  		sink_caps.signal = SIGNAL_TYPE_HDMI_TYPE_A;
> |  		break;
> | -	}
> |
> | -	case SIGNAL_TYPE_DVI_SINGLE_LINK: {
> | +	case SIGNAL_TYPE_DVI_SINGLE_LINK:
> |  		sink_caps.transaction_type = DDC_TRANSACTION_TYPE_I2C;
> |  		sink_caps.signal = SIGNAL_TYPE_DVI_SINGLE_LINK;
> |  		break;
> | -	}
> |
> | -	case SIGNAL_TYPE_DVI_DUAL_LINK: {
> | +	case SIGNAL_TYPE_DVI_DUAL_LINK:
> |  		sink_caps.transaction_type = DDC_TRANSACTION_TYPE_I2C;
> |  		sink_caps.signal = SIGNAL_TYPE_DVI_DUAL_LINK;
> |  		break;
> | -	}
> |
> | -	case SIGNAL_TYPE_LVDS: {
> | +	case SIGNAL_TYPE_LVDS:
> |  		sink_caps.transaction_type = DDC_TRANSACTION_TYPE_I2C;
> |  		sink_caps.signal = SIGNAL_TYPE_LVDS;
> |  		break;
> | -	}
> |
> | -	case SIGNAL_TYPE_EDP: {
> | -		sink_caps.transaction_type =
> | -			DDC_TRANSACTION_TYPE_I2C_OVER_AUX;
> | +	case SIGNAL_TYPE_EDP:
> | +		sink_caps.transaction_type = DDC_TRANSACTION_TYPE_I2C_OVER_AUX;
> |  		sink_caps.signal = SIGNAL_TYPE_EDP;
> |  		break;
> | -	}
> |
> | -	case SIGNAL_TYPE_DISPLAY_PORT: {
> | -		sink_caps.transaction_type =
> | -			DDC_TRANSACTION_TYPE_I2C_OVER_AUX;
> | +	case SIGNAL_TYPE_DISPLAY_PORT:
> | +		sink_caps.transaction_type = DDC_TRANSACTION_TYPE_I2C_OVER_AUX;
> |  		sink_caps.signal = SIGNAL_TYPE_VIRTUAL;
> |  		break;
> | -	}
> |
> |  	default:
> |  		DC_ERROR("Invalid connector type! signal:%d\n",
> 
> (hopefully that is quoted good enough not to be picked up by git)
> 
> Best regards
> Uwe
> 
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 26 +++++++++----------
>   1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 5bac5781a06b..78590e48e8d5 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -2300,9 +2300,9 @@ static int dm_late_init(void *handle)
>   	 */
>   	params.min_abm_backlight = 0x28F;
>   	/* In the case where abm is implemented on dmcub,
> -	* dmcu object will be null.
> -	* ABM 2.4 and up are implemented on dmcub.
> -	*/
> +	 * dmcu object will be null.
> +	 * ABM 2.4 and up are implemented on dmcub.
> +	 */
>   	if (dmcu) {
>   		if (!dmcu_load_iram(dmcu, params))
>   			return -EINVAL;
> @@ -7106,13 +7106,13 @@ static uint add_fs_modes(struct amdgpu_dm_connector *aconnector)
>   	/* Standard FPS values
>   	 *
>   	 * 23.976       - TV/NTSC
> -	 * 24 	        - Cinema
> -	 * 25 	        - TV/PAL
> +	 * 24           - Cinema
> +	 * 25           - TV/PAL
>   	 * 29.97        - TV/NTSC
> -	 * 30 	        - TV/NTSC
> -	 * 48 	        - Cinema HFR
> -	 * 50 	        - TV/PAL
> -	 * 60 	        - Commonly used
> +	 * 30           - TV/NTSC
> +	 * 48           - Cinema HFR
> +	 * 50           - TV/PAL
> +	 * 60           - Commonly used
>   	 * 48,72,96,120 - Multiples of 24
>   	 */
>   	static const u32 common_rates[] = {
> @@ -7740,7 +7740,7 @@ static void update_freesync_state_on_stream(
>   		return;
>   
>   	spin_lock_irqsave(&adev_to_drm(adev)->event_lock, flags);
> -        vrr_params = acrtc->dm_irq_params.vrr_params;
> +	vrr_params = acrtc->dm_irq_params.vrr_params;
>   
>   	if (surface) {
>   		mod_freesync_handle_preflip(
> @@ -8321,7 +8321,7 @@ static void amdgpu_dm_commit_audio(struct drm_device *dev,
>   		if (!drm_atomic_crtc_needs_modeset(new_crtc_state))
>   			continue;
>   
> -	notify:
> +notify:
>   		aconnector = to_amdgpu_dm_connector(connector);
>   
>   		mutex_lock(&adev->dm.audio_lock);
> @@ -9337,7 +9337,7 @@ static int dm_update_crtc_state(struct amdgpu_display_manager *dm,
>   skip_modeset:
>   	/* Release extra reference */
>   	if (new_stream)
> -		 dc_stream_release(new_stream);
> +		dc_stream_release(new_stream);
>   
>   	/*
>   	 * We want to do dc stream updates that do not require a
> @@ -10671,7 +10671,7 @@ int amdgpu_dm_process_dmub_aux_transfer_sync(
>   	if (!dc_process_dmub_aux_transfer_async(ctx->dc, link_index, payload)) {
>   		*operation_result = AUX_RET_ERROR_ENGINE_ACQUIRE;
>   		goto out;
> - 	}
> +	}
>   
>   	if (!wait_for_completion_timeout(&adev->dm.dmub_aux_transfer_done, 10 * HZ)) {
>   		DRM_ERROR("wait_for_completion_timeout timeout!");
> 
> base-commit: e5dbf24e8b9e6aa0a185d86ce46a7a9c79ebb40f

-- 
Hamza

