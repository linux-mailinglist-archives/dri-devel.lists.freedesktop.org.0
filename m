Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 127FF78F24C
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 20:10:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF3C510E642;
	Thu, 31 Aug 2023 18:10:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D66A210E1A6;
 Thu, 31 Aug 2023 18:10:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dx7smDh568LgzS77hTC3r/qp7Z3GAP1SSlRurqNTYjaHyYux8J87zKBlqiQwbtUkicy2sbg1HMctZ17rLIhf4bnsJwLaAjdehfz0V8KXTcydhE2zhMDxkP+JHqub4EwT1ulKFxZbBzqWRrhkj15o6WkdGGEi5OeR61wNea3keVcPVMug2YLFF0ymsvtKL+t9KtAMEO+v16g9SBb2mkFn5qG219SoSQ8+l3ViSu8GJmVRask3z+w51pWQabn3HM3g7csIthhWYbSBO/+1Q2i+2De/ALrLjId/cFAQAtmS3K9VHIp3WPV2NKK+V+J+VAxMvRpkP+ouktPtyiT09xEbTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jIMtMAP4+SxtEbk0K8LgPYGWnl87iD1+x3p57TTbABg=;
 b=HGk7S6EWzQ/ERv44Y0NnY2Qw11D8UlYK3sM+9lpyKcUUQhMV/6U6fXZK50/DsL3CXZTxNrXOKhHiA87XK4edjRVVWssHeOi0fflbX3wJCfA1+X5kS4jlwxq6XG7idIN+sTcR6dPcLWpklBXSMVmyt9bglSzjfKWPF+hd2te3K4E5pCA+CYQrcM4lHbbA+6lt18DlrbbkqfZ7vY6daYE5AIyIFafT+vAWm0ZpK4qJ931GC9tHEGWk18ohl+/7sjYMLhTsRaNGrrZpiY0Dx/qNpyR9CM/PpZaXd6lUmdtMUib6iSoxAWeiSx4IxOayWVVXsSbkyCChNJd0TqP8Gh+3SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jIMtMAP4+SxtEbk0K8LgPYGWnl87iD1+x3p57TTbABg=;
 b=SqQRJ71UuPBmFf61bIABG/bVlu/fL91PXk6BOXqPKYziDK67AiwywfbeFZtukR5WQA5etWe1IcphxlsTuJqvvphPmdSOYicY/ZYUF2j6WOh4mtdLLax35Pe3MxFQksx5fsJ1Pekn+PDcaHkqzwLPyG99ZmQOq/aj2owx/5xzT7s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BL1PR12MB5924.namprd12.prod.outlook.com (2603:10b6:208:39b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Thu, 31 Aug
 2023 18:10:34 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::ca28:efb4:a838:58fb]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::ca28:efb4:a838:58fb%4]) with mapi id 15.20.6745.022; Thu, 31 Aug 2023
 18:10:34 +0000
Message-ID: <885272f3-66e1-01ae-ac81-861d16e582a0@amd.com>
Date: Thu, 31 Aug 2023 14:10:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/2] drm/amdgpu: Merge debug module parameters
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230830220808.421935-1-andrealmeid@igalia.com>
 <20230830220808.421935-2-andrealmeid@igalia.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20230830220808.421935-2-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0059.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::31) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|BL1PR12MB5924:EE_
X-MS-Office365-Filtering-Correlation-Id: 6051d301-b105-4f0f-ad82-08dbaa4d921d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NfY798n1Gh+2aobGKVyudcdtySVbtVBTXvuepXMOkpK/C91wflqt/20p6S25LaEkid4UIK3NQahhJR+gGfcyM5Uk2aMUAoVFUmTB5X43mqHtbWLUjHdCuqCXBtbE6nELPXlWoJLZTAjCMyZZjOwFZXO76pQPOw5IILldWRTwB4Etrtcdixi+dZbqu8bmiU5srJ7OuPHwHdZaEPt4x73uoWOowK7lf2ASeqi0OT4Yp+KJa0ANEgudydrtqmytzZpyUHdb7+nEsXBugmcZjahcj16ssR7scb8XPwPmhMiG17tcuzHf29F6v+/oy6Trm7gTsD/40BPn/YJBQOr6pC7W8QqZ5H2tUTcdE9AqS3zOHPMhhmqwmnZoJBi25brAKy6lSzUhRFl9GLtedm7KwY6KbxjEtsIzIZ77mvi2yZ/q34rIZanTr/Z0JFnsK/+fLcBfqBxXgrpf7gOy1bLbYsZnjjn1BV9XVdvC500iDm2wOtSDNxvRlFrRqJlnfaKSiv7OsS1Agncmvd0TCgI4hw4/ngsASj7q9RxrGXHYjksZVxN3VcmngogDtutbYVVBE6EUnK/Hz+4RpgejK6eXn3w6cgO/fTq62CAIklrXi7PnvCNPMKSEnYEwG8NPzPrLpJL48eG9RJHVSvaVWNPAgZ74XA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(376002)(396003)(39860400002)(346002)(451199024)(186009)(1800799009)(31686004)(36916002)(6666004)(6512007)(6486002)(4326008)(6506007)(31696002)(86362001)(36756003)(38100700002)(2906002)(26005)(53546011)(478600001)(83380400001)(66556008)(8936002)(8676002)(5660300002)(44832011)(316002)(66476007)(66946007)(41300700001)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3lOUHkrblV4WHpEOEZuWmw5RkVrQThNNDZxWUtvTUhjZm1tcEtrSVZXdEZ0?=
 =?utf-8?B?Nzd5SkF1R0xKclAxT01uamR1ZXlPNDNvdFk5VU5veXZwTlpSZW5RUFIyQmNh?=
 =?utf-8?B?dXZQTlE4R2xpNVY3OUdleEI3UVF1dW1CMmJFOHdjZXpRaGZrVVJKMThJSXRV?=
 =?utf-8?B?bk1McGlScW9iOXVmVmIybFNiUlNXazRpUkxoa1UwNmNGL0ZiVmhjR1dKdGhh?=
 =?utf-8?B?dEJxSFlIQzVmSVBHVmV2dlBXaDhnM24zQlBTUmk1MlFBVklyZUVHVmoyWVBs?=
 =?utf-8?B?cWpadURvQUFOSmVYQXg2WVBoN3lnamlIcEluaUh4dHRQVlhLQUw1WWUyUnNY?=
 =?utf-8?B?VGFIdFB4MDlBMzVLbVBiMlhaMXdDWWZKNzhIOTVCd0hjR2Z6bjhoVk9MWnVw?=
 =?utf-8?B?UXZnTm9RcHNkWUtaRVhmbFRjL1lJOUJBd00xdkVxWmRiVEU4ekE5NWVvOU96?=
 =?utf-8?B?WDlTU1pFME9OR0lVNDV4RmNTTTVJb1BOU3UzRlJBSmdsRTNyYUdmTlFHdkxW?=
 =?utf-8?B?TndOd3RsS3NucGhkK2NZUzBOTlp5dkdpZ2JwZXl6eW5PZzRYQ1VqZDhRU3FT?=
 =?utf-8?B?aURscWRodGg1WjZscVhMQlQ2c1piUmRvYXJZeGJoWGVTcmtCbXMzL0ZUTXBD?=
 =?utf-8?B?cWxqaCtCNWNwWW5jbkNpUjBxLzFJSWRRaUl0b2I5aHFIQXBnMVZwcXM0Tmh4?=
 =?utf-8?B?SVBCQnhvQTd6c1Q2NVJsWkpNYTlPUG82NjlZU0h5Qm03ekR6TzloTTZJRDBG?=
 =?utf-8?B?dWtuUU53VkNvaDFIWDJpMzF3anpUQ0ozNm5hQlpiZnlBZ3lCRVBYeHR0VUtw?=
 =?utf-8?B?YmlOb1BvbXNNV05lUGU5Zy91MlhZQTF6VVhMNTJwNURhVEQ2RzIxOGJ2ZDFl?=
 =?utf-8?B?Szh2aVY4QVRVcno5dXh0RndzclFqWTlwN0hYT3VMRHpRR01qbFkrZ3hnSGl0?=
 =?utf-8?B?cm9aYktCWHBJVk9PZDNiQjUyRjBNc1JlZnRYdjU3UFlJS01mQjZGSkd6TkZG?=
 =?utf-8?B?TDVsb0pSbTk0MmdyaFpOZERqY0MydjY3aHlFcFp0LytHNjY3N00wZ2hnaDhK?=
 =?utf-8?B?SzJPbUlwZjlUWVk4aDNQOWs2aGo2c1dYT0t6d1RNN0lhUkZ3dERKTUkwYTVk?=
 =?utf-8?B?NVI0MW9GRTZxRGZBREZUSGU3QTM1M0lveFFwS2tocmNTL01MMFljazZHZ0l4?=
 =?utf-8?B?VnpTOVNKOUFHQXk1OUljclF4bXkvYkFoZ3NNTVNURmFHVDdpL1J5a1c4VzlU?=
 =?utf-8?B?bnBzNFgrZXVvU2t0NDVjZXRkWmxzMVlFVkYyN2VjMVl0SGRkQWJ6M3M1T3JH?=
 =?utf-8?B?ZlZUSTMyVGF6WWI2YUpGc21BWEZMTGxzc09qeDRHUUd6YWxkdDNQZWxqRHJp?=
 =?utf-8?B?VldGUkRZWk5aVEprQTJid2tuYitZeDEzREdVTnBiNjMvSDFVNjFRZGk0NUUr?=
 =?utf-8?B?N1RKSzFzN2p0OURGWU52U2dNTHE1WDBtaTdIaUhJOTllSmtEcFJJT1MwUkNp?=
 =?utf-8?B?YlRTaVlkemszNXFsNVFpa3pEamdlQklkRDBMbDNXclJJbDcxRTV0MURveGVn?=
 =?utf-8?B?eG50bkpFRFJUM1lqMmg4NXFRcTdKblFxQWo3U2pubVZuNHJmQ3R2cDVZZGt4?=
 =?utf-8?B?V2NVbUdTNFJYbGNWVjJ1MjhaZkVCNFhueGVUZ01SbkJUeDJsNmJiUGF6V2g1?=
 =?utf-8?B?L3Ztc2ZhTC9PeFYwSHVxemoya3ltWEJ0SGliOXBGME9pWWVaRFYwaXdxRmUw?=
 =?utf-8?B?Zk9vZ3ZKTGdZcU5WWjNMZDNqL3hJcEcxNjVLMDFoSW9mQlBjTjJlckhqalJU?=
 =?utf-8?B?WTh1eFE2NjI5TDN3SHdYUHJ5Y3o5MU5pSFN0QUNaeHAwL3hTYm5YSnJFNktn?=
 =?utf-8?B?U1YzWlRDMGRpOVBUZ2hSUlU3VkthRTUzbk5LZWJmUEFTdlcyd2NQMERMUCtR?=
 =?utf-8?B?VWdGRzcrOFNCTjQyTDNZMmE2Z0Frbk1pdGFxQUtXQ1B0ZDJNL0hsU1BtbWxq?=
 =?utf-8?B?UUZNaVBIbjNRbjBORFJYd1BKaHljMVVkVGpoUzV2aFpXRHBvY0kxY3lIMVkw?=
 =?utf-8?B?d3ZWZnRhZFpkV05UOURaTE5GcGluK3prUU5lTWZYVTlxZC9oTGYxSG9mZGgr?=
 =?utf-8?Q?WbXL2Tkq3Krgaf3gHUPmfzrwg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6051d301-b105-4f0f-ad82-08dbaa4d921d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 18:10:34.5201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w5X3DGaIu9Aog77kLFbGv+f/9tDw3BtpZfrAgIVXczyq6tRVcO3Sjhd36hzhAtnaJ2esUMJbNYl6bRWOgnLx3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5924
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
Cc: alexander.deucher@amd.com, pierre-eric.pelloux-prayer@amd.com,
 kernel-dev@igalia.com, =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2023-08-30 18:08, André Almeida wrote:
> Merge all developer debug options available as separated module
> parameters in one, making it obvious that are for developers.
>
> Drop the obsolete module options in favor of the new ones.
>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
> v2:
> - drop old module params
> - use BIT() macros
> - replace global var with adev-> vars
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h      |  4 ++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c   |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  | 48 ++++++++++++++----------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c  |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c   |  2 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |  2 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_crat.c    |  2 +-
>   drivers/gpu/drm/amd/include/amd_shared.h |  8 ++++
>   8 files changed, 45 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 4de074243c4d..82eaccfce347 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1101,6 +1101,10 @@ struct amdgpu_device {
>   	bool                            dc_enabled;
>   	/* Mask of active clusters */
>   	uint32_t			aid_mask;
> +
> +	/* Debug */
> +	bool                            debug_vm;
> +	bool                            debug_largebar;
>   };
>   
>   static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index fb78a8f47587..8a26bed76505 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -1191,7 +1191,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
>   		job->vm_pd_addr = amdgpu_gmc_pd_addr(vm->root.bo);
>   	}
>   
> -	if (amdgpu_vm_debug) {
> +	if (adev->debug_vm) {
>   		/* Invalidate all BOs to test for userspace bugs */
>   		amdgpu_bo_list_for_each_entry(e, p->bo_list) {
>   			struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index f5856b82605e..0cd48c025433 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -140,7 +140,6 @@ int amdgpu_vm_size = -1;
>   int amdgpu_vm_fragment_size = -1;
>   int amdgpu_vm_block_size = -1;
>   int amdgpu_vm_fault_stop;
> -int amdgpu_vm_debug;
>   int amdgpu_vm_update_mode = -1;
>   int amdgpu_exp_hw_support;
>   int amdgpu_dc = -1;
> @@ -194,6 +193,7 @@ int amdgpu_use_xgmi_p2p = 1;
>   int amdgpu_vcnfw_log;
>   int amdgpu_sg_display = -1; /* auto */
>   int amdgpu_user_partt_mode = AMDGPU_AUTO_COMPUTE_PARTITION_MODE;
> +uint amdgpu_debug_mask;
>   
>   static void amdgpu_drv_delayed_reset_work_handler(struct work_struct *work);
>   
> @@ -405,13 +405,6 @@ module_param_named(vm_block_size, amdgpu_vm_block_size, int, 0444);
>   MODULE_PARM_DESC(vm_fault_stop, "Stop on VM fault (0 = never (default), 1 = print first, 2 = always)");
>   module_param_named(vm_fault_stop, amdgpu_vm_fault_stop, int, 0444);
>   
> -/**
> - * DOC: vm_debug (int)
> - * Debug VM handling (0 = disabled, 1 = enabled). The default is 0 (Disabled).
> - */
> -MODULE_PARM_DESC(vm_debug, "Debug VM handling (0 = disabled (default), 1 = enabled)");
> -module_param_named(vm_debug, amdgpu_vm_debug, int, 0644);

This parameter used to be writable, which means it could be changed 
through sysfs after loading the module. Code looking at the global 
variable would see the last value written by user mode. With your 
changes, this is no longer writable, and driver code is now looking at 
adev->debug_vm, which cannot be updated through sysfs. As long as 
everyone is OK with that change, I have no objections. Just pointing it out.

Regardless, this patch is

Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>


> -
>   /**
>    * DOC: vm_update_mode (int)
>    * Override VM update mode. VM updated by using CPU (0 = never, 1 = Graphics only, 2 = Compute only, 3 = Both). The default
> @@ -743,18 +736,6 @@ module_param(send_sigterm, int, 0444);
>   MODULE_PARM_DESC(send_sigterm,
>   	"Send sigterm to HSA process on unhandled exception (0 = disable, 1 = enable)");
>   
> -/**
> - * DOC: debug_largebar (int)
> - * Set debug_largebar as 1 to enable simulating large-bar capability on non-large bar
> - * system. This limits the VRAM size reported to ROCm applications to the visible
> - * size, usually 256MB.
> - * Default value is 0, diabled.
> - */
> -int debug_largebar;
> -module_param(debug_largebar, int, 0444);
> -MODULE_PARM_DESC(debug_largebar,
> -	"Debug large-bar flag used to simulate large-bar capability on non-large bar machine (0 = disable, 1 = enable)");
> -
>   /**
>    * DOC: halt_if_hws_hang (int)
>    * Halt if HWS hang is detected. Default value, 0, disables the halt on hang.
> @@ -938,6 +919,18 @@ module_param_named(user_partt_mode, amdgpu_user_partt_mode, uint, 0444);
>   module_param(enforce_isolation, bool, 0444);
>   MODULE_PARM_DESC(enforce_isolation, "enforce process isolation between graphics and compute . enforce_isolation = on");
>   
> +/**
> + * DOC: debug_mask (uint)
> + * Debug options for amdgpu, work as a binary mask with the following options:
> + *
> + * - 0x1: Debug VM handling
> + * - 0x2: Enable simulating large-bar capability on non-large bar system. This
> + *   limits the VRAM size reported to ROCm applications to the visible
> + *   size, usually 256MB.
> + */
> +MODULE_PARM_DESC(debug_mask, "debug options for amdgpu, disabled by default");
> +module_param_named(debug_mask, amdgpu_debug_mask, uint, 0444);
> +
>   /* These devices are not supported by amdgpu.
>    * They are supported by the mach64, r128, radeon drivers
>    */
> @@ -2042,6 +2035,19 @@ static void amdgpu_get_secondary_funcs(struct amdgpu_device *adev)
>   	}
>   }
>   
> +static void amdgpu_init_debug_options(struct amdgpu_device *adev)
> +{
> +	if (amdgpu_debug_mask & AMDGPU_DEBUG_VM) {
> +		pr_info("debug: VM handling debug enabled\n");
> +		adev->debug_vm = true;
> +	}
> +
> +	if (amdgpu_debug_mask & AMDGPU_DEBUG_LARGEBAR) {
> +		pr_info("debug: enabled simulating large-bar capability on non-large bar system\n");
> +		adev->debug_largebar = true;
> +	}
> +}
> +
>   static int amdgpu_pci_probe(struct pci_dev *pdev,
>   			    const struct pci_device_id *ent)
>   {
> @@ -2220,6 +2226,8 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
>   			amdgpu_get_secondary_funcs(adev);
>   	}
>   
> +	amdgpu_init_debug_options(adev);
> +
>   	return 0;
>   
>   err_pci:
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index 09203e22b026..548e65f2db5f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -794,7 +794,7 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
>   	default:
>   		break;
>   	}
> -	if (!r && !(args->flags & AMDGPU_VM_DELAY_UPDATE) && !amdgpu_vm_debug)
> +	if (!r && !(args->flags & AMDGPU_VM_DELAY_UPDATE) && !adev->debug_vm)
>   		amdgpu_gem_va_update_vm(adev, &fpriv->vm, bo_va,
>   					args->operation);
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 74380b21e7a5..d483cd9c612a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -1407,7 +1407,7 @@ int amdgpu_vm_handle_moved(struct amdgpu_device *adev,
>   		spin_unlock(&vm->status_lock);
>   
>   		/* Try to reserve the BO to avoid clearing its ptes */
> -		if (!amdgpu_vm_debug && dma_resv_trylock(resv))
> +		if (!adev->debug_vm && dma_resv_trylock(resv))
>   			clear = false;
>   		/* Somebody else is using the BO right now */
>   		else
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index 3b8f592384fa..41ac2ec936c3 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -1021,7 +1021,7 @@ static int kfd_ioctl_acquire_vm(struct file *filep, struct kfd_process *p,
>   
>   bool kfd_dev_is_large_bar(struct kfd_node *dev)
>   {
> -	if (debug_largebar) {
> +	if (dev->kfd->adev->debug_largebar) {
>   		pr_debug("Simulate large-bar allocation on non large-bar machine\n");
>   		return true;
>   	}
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c b/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
> index 2e9612cf56ae..b05e06f89814 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
> @@ -2115,7 +2115,7 @@ static int kfd_create_vcrat_image_gpu(void *pcrat_image,
>   	sub_type_hdr = (typeof(sub_type_hdr))((char *)sub_type_hdr +
>   			sub_type_hdr->length);
>   
> -	if (debug_largebar)
> +	if (kdev->adev->debug_largebar)
>   		local_mem_info.local_mem_size_private = 0;
>   
>   	if (local_mem_info.local_mem_size_private == 0)
> diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd/include/amd_shared.h
> index 67d7b7ee8a2a..2fd6af2183cc 100644
> --- a/drivers/gpu/drm/amd/include/amd_shared.h
> +++ b/drivers/gpu/drm/amd/include/amd_shared.h
> @@ -257,6 +257,14 @@ enum DC_DEBUG_MASK {
>   
>   enum amd_dpm_forced_level;
>   
> +/*
> + * amdgpu.debug module options. Are all disabled by default
> + */
> +enum AMDGPU_DEBUG_MASK {
> +	AMDGPU_DEBUG_VM = BIT(0),
> +	AMDGPU_DEBUG_LARGEBAR = BIT(1),
> +};
> +
>   /**
>    * struct amd_ip_funcs - general hooks for managing amdgpu IP Blocks
>    * @name: Name of IP block
