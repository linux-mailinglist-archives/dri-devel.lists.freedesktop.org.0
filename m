Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E564788B57
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 16:13:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F9E810E6A4;
	Fri, 25 Aug 2023 14:13:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D826010E6A1;
 Fri, 25 Aug 2023 14:13:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dO1G/bi5xYj0B40xXFMJhctQU5LdPuZ3ORWJDA5OuNm/lyMCTB67ToKhGKYo5pwOdqAZmyFQ2J0VDCITgpgWRW+oBSvyGAkR1tTbPM/taESOpXC0IIFWSHoUt2Q/y34dkbFCrnREFmOLJnZnRcySlmATT/fNgbk/L2NBs7Z6FH+vL69yaUWcsgiYVd0hC4TPYPZC84m+n4x4KgeindKQllirxUIanchSpnXvzwDLkrzb1c9voQtflPsiY0cySHSs9HgecVhI/J7/wfjKGCnI3HGL4IrPtG6+hCIlOdjGRqzO8pDK5kWc9RmxQQhHRhE1LFJIB8Xb91i2M16QRpaGLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pICmLEfuEwWVa7p4Z4jXQG86PZAMDweXo3uM/Nf9iSc=;
 b=Nn+pin2Ea+kunhfgyi8k5BcUVtDYBXRoqaV2Aoq7ugPPScdG5DNdHwryXIpB2DHvnnTGjOUSi84rIpwiU/iQ84AiYnN1zm47h3B1dXkXVlolIQbqSFTOsD2UNrG4jLw4QxfAVRNkEJl8al2bOLkfVcmRGq/XpQfwWDoe0BZ+K+TimvaUPnc6DcYsz84cq4gCqcInnPdozb8WW9XH/nDipH+TRtiJmwY5DENJVw2YmiY3iO06SwVyfZvHblBqBahr65+nc/Z+dNOQ4+sbr2VLSCII7Oc91uoDjAdCsiDvUHlrT/D+oeN8vKAlEAkh20ZkXvM8nBVLlbXbW3onxx8Hwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pICmLEfuEwWVa7p4Z4jXQG86PZAMDweXo3uM/Nf9iSc=;
 b=emGypeZFOWqdtSVDpezt8SH9bdw3Suz9cdlciN+pAsJR6NQKdTpQg3lpKWerfSZiKeaWZR1QM8uotyi7oCpZxU9qR9MIjJNP6CftjG7+F/jr5eYQFnJYLJfZEWB6MrpAM9Yd4NuB8JBRAs3hSuLZOyxTPlyNyImNR66fVLxq9XE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4614.namprd12.prod.outlook.com (2603:10b6:a03:a6::22)
 by DM4PR12MB6400.namprd12.prod.outlook.com (2603:10b6:8:b9::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.29; Fri, 25 Aug 2023 14:13:42 +0000
Received: from BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::af11:a0ea:b4e4:d1e0]) by BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::af11:a0ea:b4e4:d1e0%5]) with mapi id 15.20.6699.028; Fri, 25 Aug 2023
 14:13:42 +0000
Message-ID: <40f50d25-6b12-7195-e459-1abd552c04a8@amd.com>
Date: Fri, 25 Aug 2023 19:43:26 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [V10 7/8] drm/amd/pm: enable Wifi RFI mitigation feature support
 for SMU13.0.0
Content-Language: en-US
To: Evan Quan <evan.quan@amd.com>, lenb@kernel.org,
 johannes@sipsolutions.net, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, alexander.deucher@amd.com,
 rafael@kernel.org, mario.limonciello@amd.com
References: <20230825083846.4001973-1-evan.quan@amd.com>
 <20230825083846.4001973-8-evan.quan@amd.com>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <20230825083846.4001973-8-evan.quan@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0103.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::18) To BYAPR12MB4614.namprd12.prod.outlook.com
 (2603:10b6:a03:a6::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4614:EE_|DM4PR12MB6400:EE_
X-MS-Office365-Filtering-Correlation-Id: e50866e3-c48d-4737-8312-08dba5757c61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IqcyhWkhDTMw3dugNDb2SI8n5aoOKIRsn13PYJWx+n+YFJoO7P+NrD8i2p9b3KLDI8fzNUtbtWbjxDXFoHSWLJvWWOusFMFWCMcRMPp4TE1y2/ZOQ5hTGhqGFkyTDGD9Drub1Htz5RlkW2Wv17ZGDkCI9WL2ICbCGI42oABTtLHJtFi/E3DaUlwwXBAU8jK5rNyCBdWxY3MfHqK3ipXfcIKb9X66hqRFDsRDCm0enbo8yaTkZWLk59kHtK6hsP0ZiutQ//BFYn6hAh3HsB+dwLSlBkBgH6JhnVORMESaoCIvQocNF5MWlsBjt+9Y+hvh3ktvsEr8ruMSxTclBld/G6hP3Ikac7fjueNSNgELi2rg/Rvl+9B0Pens5qAwR93/xWgd9EpM0Uqvu0Fr5RqSywBPlwWXDN7tp9W8Tk6RBH0Py/Pmti9uWH9iaIZA6n7bbKiCDzdsLRxyP8MvW2L72v7Sq7plki51gZ0xXKGvSIzRooBxuDWDRHJCrVUdBZJn+pZx7q81yeckMNg/0ITdrtbrzrQ8U8VnFvMmGpK4ky5ESXo1zAixi0qgv+D+Bc5qNc6beZysXhzf4rupMp1tDjefLn8YbUA+j+jbXitxJvxbyI8aqQf4t5RX5Ui4hK4qEz/AeCxM6ZTU1o/ywCp8H3RbLFi/20Ei0KcIXh2gOSM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4614.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(346002)(366004)(396003)(136003)(451199024)(1800799009)(186009)(38100700002)(921005)(8676002)(4326008)(8936002)(31696002)(41300700001)(316002)(6486002)(6506007)(53546011)(6666004)(36756003)(66946007)(66556008)(66476007)(6636002)(86362001)(6512007)(7416002)(26005)(478600001)(83380400001)(31686004)(2906002)(2616005)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTl1QkdReHpkVjF6WE5jUFVGamZqS2lhaEZQeS95RUd0VEVHR3o1OXE4d09V?=
 =?utf-8?B?dDRLRllsZVh4WDNBNG5WalFRZDJnYTg0K1o1MXRYWDVJRjJrdVc1WFNJSjB4?=
 =?utf-8?B?RVNHWUxJTjI2eFFaYzdPUitTaFI4b1pEd2JKaFBXK3pBL3paT3J1bWxNUUhI?=
 =?utf-8?B?N2VwZTdrYWNtMVFueTRZeHBxY2lueXBXRmxETnRRUk9HTHBMUWpIbXMxdjZE?=
 =?utf-8?B?WFhtM255dUNtRUtFZDhHVjhlQ3RJTm5hcHRETk1qN0oydFlkdkgxa2FVZFZa?=
 =?utf-8?B?R0Zyby9KYUhkTUFFdnVmMGE5cEpJZHhhZnNiK3F0cTRhYkJuVnRVV1hvdlha?=
 =?utf-8?B?eG96Ukxtaml0b0dWTUlUNUhDWHI5c0RTcTY1UjVvalNUL3BrV3lwc1grQ1Js?=
 =?utf-8?B?REZ5dUhReG13UVZscGcycE00Rll6QTYyd2d3c0tnN0lKek1zdXlBdXYwOEcr?=
 =?utf-8?B?RGV2ZkUyaVg0NmJkRkpEbFljclUxV1Iyclo2YkxyVTgrT1NxdXVmSU16cGRE?=
 =?utf-8?B?MjBpcTVScG9SNDhHbjNRZVBTdWhpKzlTSmlwY2l0R1VIRTd4VTM3Q3hYQjRz?=
 =?utf-8?B?UnZ1R2tlZEZRcVRKL2NxcU01UHplZVFkZ00yUjZTbksxUGxTSmY3K05uMEdy?=
 =?utf-8?B?cmJpWVFxTXVsNlFZWHBBWVlNNWVHVmVIbjRvazdCT2g5ZWpwRDgwWDRDcDJ6?=
 =?utf-8?B?Q0NsU2NhR0xHZGxLMFhRakZuQ0tabjJ4ejJnd09vUHZmd1R1bVFxdFp3RU1S?=
 =?utf-8?B?aUtaN0JtKzFOTHlDS3hQY2dnK216YmJjaUt6dmJ0VEQwMzN1VlhPeUNDWDRu?=
 =?utf-8?B?Wi96dVo3a0NaSllSQ25DUzEwVXhaNmNiRmhreWJmU2hSZnU2QlczT2pOaEY3?=
 =?utf-8?B?eEJLdWgvVVNMU2ZRV3FocWU2aDVJM25OelVJdHc1TzlWNjhoWGVkNUlQcm5E?=
 =?utf-8?B?VGVWalJ5SGpjV2ZjSlNTQzZlRE83MlVvNVNzV3NsS1dMN2I4UTR3blNIZ1VG?=
 =?utf-8?B?c2JpcUV2Mlg4eWFzYUUzUUZUTHRYbUhYRWVuYUxzU25INllaeS9mYk9XTXZM?=
 =?utf-8?B?RTd2LzFaNWU2ZHRWcFBkSFErQytCWGdMaG1QTGt0cFZ2OUVCVUpJSDg4VVBu?=
 =?utf-8?B?aktLR0g2cXVoT3lUNSs5WjNXb1BicVJnUTc2b0tUS3ZVb2p4a1JFZ3JoZCtO?=
 =?utf-8?B?TjUzbnZPaVlzYVdFZkZ2ZWpMYTBaSG5raksxK0RwSUtNM3F3VjA4UkEwcWpZ?=
 =?utf-8?B?SXNOQ0QvcUp2S1pmYy9vYnBDMkdMZDFqaFpnYlc0S2hhV3pHV1ZQWXJpY2pj?=
 =?utf-8?B?dk1FVjdkc3RjWGpjb2s4ZTJpNkRHanREM2NuZXNLUGd0MUMrZFZqdi9JRHV4?=
 =?utf-8?B?WWhseHR5dnIvYUZaekt1TUJHVUxFeDl0K1duN1BzS3psSExzU2pHUDB5NEkr?=
 =?utf-8?B?djgrQVZObUJXTy9YbXVSZE1MTlExZ3NDVXhGK1JFc1M4bVc2WTRacDdiaU1P?=
 =?utf-8?B?d3daWnFHNTM0ejJqeWRDRXMyOUROSElyczkyK0xmU3pmMW54RXpJdjJBZHM0?=
 =?utf-8?B?MSs5eGxkMTByeVBsODN1Mk5GWjlQYUZiMTVTRWpEL3pOckVFb3NRY2U1aVho?=
 =?utf-8?B?WDB2dHpQUTZ0WU5oTXIrUExLQ0FUMXowbmxvL0NPbG12VkxGbHFXLy83R0xM?=
 =?utf-8?B?OHJwS0N0OXBSSVd1bU1QQ1VNMGVTT0RRRHJxald2Y1hIOHBMRW9Ua2w4ZGZQ?=
 =?utf-8?B?bVRqVjRDMGFIeHUwcURQM0p4RExkSEJwQnd2L25jZ3BOcTZXQmhKZTEycTlD?=
 =?utf-8?B?RUpEMExqUWhNVk5FTkttUTlxdDdkd05aS0FSbk0veksvZEZDK0R3N3plcEFj?=
 =?utf-8?B?S1dtU0cxV1cvZVJ6K1R2aG9ZcFdINFhkRFYvY2x1TE1iUGd5MFZkKzB2UGxp?=
 =?utf-8?B?bmlmV0piTHh0QU5pWGVBNFZ0d2k5K0pGQ0pKQ1U0dHRMWXZqaUpRNnExYmV4?=
 =?utf-8?B?bTVnMitPem5iNnF6eWtudFlVZVFCVXh0YitPelVMb2J4bVBCQkUxREZNREZZ?=
 =?utf-8?B?N09oclNOUit4cVErNEl3eHpOaXBvcXl2YUQzT0V5S1czY0dwYlhJK1lJSTJB?=
 =?utf-8?Q?I1VE35z1jB+qvn0pEgOR0qRst?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e50866e3-c48d-4737-8312-08dba5757c61
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 14:13:42.3483 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tt66WDvl6F9wqF5z96AiepVyHH/797G48c5choxASrmM1pibPk3KqxmkwV3QZ7Ay
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6400
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/25/2023 2:08 PM, Evan Quan wrote:
> Fulfill the SMU13.0.0 support for Wifi RFI mitigation feature.
> 
> Signed-off-by: Evan Quan <evan.quan@amd.com>
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h |  3 +
>   drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h  |  3 +-
>   drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h  |  3 +
>   .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c    |  9 +++
>   .../drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c  | 60 +++++++++++++++++++
>   5 files changed, 77 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
> index 60d595344c45..a081e6bb27c4 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
> +++ b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
> @@ -325,6 +325,7 @@ enum smu_table_id
>   	SMU_TABLE_PACE,
>   	SMU_TABLE_ECCINFO,
>   	SMU_TABLE_COMBO_PPTABLE,
> +	SMU_TABLE_WIFIBAND,
>   	SMU_TABLE_COUNT,
>   };
>   
> @@ -1501,6 +1502,8 @@ enum smu_baco_seq {
>   			 __dst_size);					   \
>   })
>   
> +#define HZ_IN_MHZ		1000000U
> +
>   #if !defined(SWSMU_CODE_LAYER_L2) && !defined(SWSMU_CODE_LAYER_L3) && !defined(SWSMU_CODE_LAYER_L4)
>   int smu_get_power_limit(void *handle,
>   			uint32_t *limit,
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h
> index 297b70b9388f..5bbb60289a79 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h
> +++ b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h
> @@ -245,7 +245,8 @@
>   	__SMU_DUMMY_MAP(AllowGpo),	\
>   	__SMU_DUMMY_MAP(Mode2Reset),	\
>   	__SMU_DUMMY_MAP(RequestI2cTransaction), \
> -	__SMU_DUMMY_MAP(GetMetricsTable),
> +	__SMU_DUMMY_MAP(GetMetricsTable), \
> +	__SMU_DUMMY_MAP(EnableUCLKShadow),
>   
>   #undef __SMU_DUMMY_MAP
>   #define __SMU_DUMMY_MAP(type)	SMU_MSG_##type
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h
> index 355c156d871a..dd70b56aa71e 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h
> +++ b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h
> @@ -299,5 +299,8 @@ int smu_v13_0_update_pcie_parameters(struct smu_context *smu,
>   				     uint32_t pcie_gen_cap,
>   				     uint32_t pcie_width_cap);
>   
> +int smu_v13_0_enable_uclk_shadow(struct smu_context *smu,
> +				 bool enablement);
> +
>   #endif
>   #endif
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
> index 9b62b45ebb7f..6a5cb582aa92 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
> @@ -2472,3 +2472,12 @@ int smu_v13_0_update_pcie_parameters(struct smu_context *smu,
>   
>   	return 0;
>   }
> +
> +int smu_v13_0_enable_uclk_shadow(struct smu_context *smu,
> +				 bool enablement)
> +{
> +	return smu_cmn_send_smc_msg_with_param(smu,
> +					       SMU_MSG_EnableUCLKShadow,
> +					       enablement,
> +					       NULL);
> +}
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
> index 3d188616ba24..fd3ac18653ed 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
> @@ -154,6 +154,7 @@ static struct cmn2asic_msg_mapping smu_v13_0_0_message_map[SMU_MSG_MAX_COUNT] =
>   	MSG_MAP(AllowGpo,			PPSMC_MSG_SetGpoAllow,           0),
>   	MSG_MAP(AllowIHHostInterrupt,		PPSMC_MSG_AllowIHHostInterrupt,       0),
>   	MSG_MAP(ReenableAcDcInterrupt,		PPSMC_MSG_ReenableAcDcInterrupt,       0),
> +	MSG_MAP(EnableUCLKShadow,		PPSMC_MSG_EnableUCLKShadow,            0),
>   };
>   
>   static struct cmn2asic_mapping smu_v13_0_0_clk_map[SMU_CLK_COUNT] = {
> @@ -237,6 +238,7 @@ static struct cmn2asic_mapping smu_v13_0_0_table_map[SMU_TABLE_COUNT] = {
>   	TAB_MAP(I2C_COMMANDS),
>   	TAB_MAP(ECCINFO),
>   	TAB_MAP(OVERDRIVE),
> +	TAB_MAP(WIFIBAND),
>   };
>   
>   static struct cmn2asic_mapping smu_v13_0_0_pwr_src_map[SMU_POWER_SOURCE_COUNT] = {
> @@ -481,6 +483,9 @@ static int smu_v13_0_0_tables_init(struct smu_context *smu)
>   			PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
>   	SMU_TABLE_INIT(tables, SMU_TABLE_ECCINFO, sizeof(EccInfoTable_t),
>   			PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
> +	SMU_TABLE_INIT(tables, SMU_TABLE_WIFIBAND,
> +		       sizeof(WifiBandEntryTable_t), PAGE_SIZE,
> +		       AMDGPU_GEM_DOMAIN_VRAM);
>   
>   	smu_table->metrics_table = kzalloc(sizeof(SmuMetricsExternal_t), GFP_KERNEL);
>   	if (!smu_table->metrics_table)
> @@ -2593,6 +2598,58 @@ static ssize_t smu_v13_0_0_get_ecc_info(struct smu_context *smu,
>   	return ret;
>   }
>   
> +static bool smu_v13_0_0_wbrf_support_check(struct smu_context *smu)
> +{
> +	struct amdgpu_device *adev = smu->adev;
> +
> +	switch (adev->ip_versions[MP1_HWIP][0]) {
> +	case IP_VERSION(13, 0, 0):
> +		return smu->smc_fw_version >= 0x004e6300;
> +	case IP_VERSION(13, 0, 10):
> +		return smu->smc_fw_version >= 0x00503300;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static int smu_v13_0_0_set_wbrf_exclusion_ranges(struct smu_context *smu,
> +						 struct exclusion_range *exclusion_ranges)
> +{
> +	WifiBandEntryTable_t wifi_bands;
> +	int valid_entries = 0;
> +	int ret, i;
> +
> +	memset(&wifi_bands, 0, sizeof(wifi_bands));
> +	for (i = 0; i < ARRAY_SIZE(wifi_bands.WifiBandEntry); i++) {
> +		if (!exclusion_ranges[i].start &&
> +		    !exclusion_ranges[i].end)
> +			break;
> +
> +		/* PMFW expects the inputs to be in Mhz unit */
> +		wifi_bands.WifiBandEntry[valid_entries].LowFreq =
> +			DIV_ROUND_DOWN_ULL(exclusion_ranges[i].start, HZ_IN_MHZ);
> +		wifi_bands.WifiBandEntry[valid_entries++].HighFreq =
> +			DIV_ROUND_UP_ULL(exclusion_ranges[i].end, HZ_IN_MHZ);
> +	}
> +	wifi_bands.WifiBandEntryNum = valid_entries;
> +
> +	/*
> +	 * Per confirm with PMFW team, WifiBandEntryNum = 0
> +	 * is a valid setting. So, there should be no direct
> +	 * return on that.
> +	 */
> +
> +	ret = smu_cmn_update_table(smu,
> +				   SMU_TABLE_WIFIBAND,
> +				   0,
> +				   (void *)(&wifi_bands),
> +				   true);
> +	if (ret)
> +		dev_err(smu->adev->dev, "Failed to set wifiband!");

As mentioned earlier, this doesn't look like a candidate for ERR level. 
For ex: the system will continue to work fine if the last request is for 
removal of certain bands (a device got disconnected). Even otherwise, 
there is a chance that the bands used by newly added device may not 
cause any interference. Same goes for patch 8.

Thanks,
Lijo

> +
> +	return ret;
> +}
> +
>   static const struct pptable_funcs smu_v13_0_0_ppt_funcs = {
>   	.get_allowed_feature_mask = smu_v13_0_0_get_allowed_feature_mask,
>   	.set_default_dpm_table = smu_v13_0_0_set_default_dpm_table,
> @@ -2672,6 +2729,9 @@ static const struct pptable_funcs smu_v13_0_0_ppt_funcs = {
>   	.send_hbm_bad_channel_flag = smu_v13_0_0_send_bad_mem_channel_flag,
>   	.gpo_control = smu_v13_0_gpo_control,
>   	.get_ecc_info = smu_v13_0_0_get_ecc_info,
> +	.is_asic_wbrf_supported = smu_v13_0_0_wbrf_support_check,
> +	.enable_uclk_shadow = smu_v13_0_enable_uclk_shadow,
> +	.set_wbrf_exclusion_ranges = smu_v13_0_0_set_wbrf_exclusion_ranges,
>   };
>   
>   void smu_v13_0_0_set_ppt_funcs(struct smu_context *smu)
