Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 827A7788061
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 08:56:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85BB810E619;
	Fri, 25 Aug 2023 06:56:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5EF710E619;
 Fri, 25 Aug 2023 06:56:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fhZgtutATY5BVR/PC8rgWNlU/fh3Z29OuuARmIS/10+F01tz+oujTxCu/D2YBujOELIeNPBIRLEhXyqCTLRiWwoTgqdShuV3L9TSvY/uhwJn5GZ3jfkE4p9wYnG5WTpv3TzfaaLITysPEclcDyoYDXp/AEZqM0lqD4s+Jn9QD8nbgVqiUbD8Z6mLq/Obf6ro5Bn28QhIkUOAnnx9XUsMYaWmTFNe2wiT8mpLh6vVck4V1A+/VR6l4265S86iOBUZrt8TmHFJKVM4bwiEp4RmjOjnAuPrktID2IpfM2RxN5k3ykGMKqxQAs8fEcVWPXnQf1P87ddnTKWrMmL4owQ1Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Licu9mBz1FYOXkWINSNAva2/ULupc9YlbV4kgaag0I=;
 b=ctAxygoDr6TBCHv+FcGyd9RFuVAAAu3DKKAgIuxC0XkHeMhxH9bdlYPIbms6B03S2m5A5Pi8bsCNy//kiVRUdye/D7unup0Fv2SM927HXoAFrOdsdJL8mQIcYfoRhye92MUakwGhdUMZb5sF2otl3C7aywyNYOYn4ya6sDxFf2RyD4arP97KlW4TA2LqsUiMxocCp2pt3+KbX33q3w6Uadtbz5BHtTtOyUThs0WOTKRpu3TVwvItJ96ARFNP/LA9SfbU38cgEj6nT/2uqL1r6ZRlUuSBjbWNkUjV8VgGiP6w+nzP5V4KwhqDOm6bbQZia1qNeB+egEwhryWRce/6Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Licu9mBz1FYOXkWINSNAva2/ULupc9YlbV4kgaag0I=;
 b=tMztLKFadPzWxSrsiE/ZyUzTq7/TIFjTaa8RMZi0bLrjak+PccdsfZqn1tmLO9KyoAcpqVSlHNzvGKC9ocpZPuvYcG0HZCw1GJVqwtjBqWDtbQKBqxfQkhSuvQv4HgqgPYa7xwPuEEu7E0MPuyPFrdjXY3j8hoz50cBSvGzcOEM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL1PR12MB5380.namprd12.prod.outlook.com (2603:10b6:208:314::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.29; Fri, 25 Aug
 2023 06:56:49 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6699.028; Fri, 25 Aug 2023
 06:56:49 +0000
Message-ID: <32549529-6cc8-e187-9436-8b9d28e88b1d@amd.com>
Date: Fri, 25 Aug 2023 08:56:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] drm/amdgpu: Merge debug module parameters
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230824162505.173399-1-andrealmeid@igalia.com>
 <20230824162505.173399-2-andrealmeid@igalia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230824162505.173399-2-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BL1PR12MB5380:EE_
X-MS-Office365-Filtering-Correlation-Id: 4802ab4e-3207-491b-827d-08dba5387406
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I75PrNqldH1f8F1vYSRI8LSf3Y1nLeO37nVY3A/Vb6/E4DcZZv8KGa3zplQaPFMpoQmDMNaEr+FSmyO9pcGXnr9L7lIIInfLwrkj8Oyb18i1hRtbOVoCzFJztFb63ObmsPO9sB2P8q1WX4VSh4afi37TX0lih+yL3ENQ+QBKn8rFeUK/HZncui0axldr6Hb1GwBaZ59tS8f+SkRaHYubsKbdLPRIwRBzCnFXQ/U6u/yi2VBQPK+L8fo00SqbeYDueB8AcsHhYdl5WOEBG46+KZE5aPCM/Mfgp34GxuPP17OcRCfmlEZrbewuf9NWMFjQYzfbaHVuBZ+cIyPHI7Tc4KP8XHAIOX+/Dex/qdN3zFpgRAwfbKModazcCJzr/veIO8FdMXdhoRxi8lbrbp+oRrIwqisI47I5tZUhLzz2Etc6qqQW5lMgvsYR7ysNrRBm1FfbCeOuhURJxaDI48d37fnEzk9Dvdtjc6OryAZW1NUUPreuAX6lJ8gbrt1++rmcOvbrxak0VrLidCuctrepRxeNBVnajCHnQ4rf71IpD9Nip15hUCztI2rX07fGTkiQcuX24OLGsBH3DNQrnUjda9BtJJHXz5pt3ww4a8q+/MgvsPUk3J4kD6P8LHnajwuedhfW4is2CNiwKLwne0pvBw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(136003)(376002)(39860400002)(366004)(1800799009)(451199024)(186009)(83380400001)(6512007)(26005)(478600001)(2616005)(5660300002)(31686004)(2906002)(8936002)(4326008)(8676002)(38100700002)(66476007)(66556008)(66946007)(86362001)(41300700001)(31696002)(6506007)(6486002)(36756003)(6666004)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTJicEhpZVo4WkNaNmIxMFUwRmJvN3dXUHFjWks4K0hZYnZPY1VENi94MUpN?=
 =?utf-8?B?RWNlcU5xeEdZTTZiUEF0NW0wWDl6Tmc2TTNwVS9PV2xGRjFRZXZPd25VTmdh?=
 =?utf-8?B?Y0E1WkM2ZW1SUWVJQ3pCaDRMY2o1bFl2dGJlWjhjYjdKZlZOcXVwQ1Qvaklv?=
 =?utf-8?B?RG05UEVJTEFLR2M4aUs3ZXpLRE5FbGZIQ3ozbDU2Y2txam0vcU1iWHN0UmNR?=
 =?utf-8?B?aWR6V3NqYStOSHZidzdURktEQkVIeDJEWTRWeUZmNW03Q1U3RjkvUkxCL3dS?=
 =?utf-8?B?T3ZEYytkMXpLZlJYdUNza0dDcHNER0h6RllQR2luaHc3MS9PR1czemMxWUh6?=
 =?utf-8?B?cnNoTXpNNzVOSjJwWXVVZ2pGZVd2RHAxT0ZxRzkzVXFWM1kxSlR5ckJQRzJ0?=
 =?utf-8?B?NGpBS0tpT0krM2QzVzVIbzhPQUlHTE5EMjJJa1RSYVlBWEtMZmJIY2RvQlI2?=
 =?utf-8?B?dC9CUUU3UzZjQXpNd3ZVWWpnd1FsNTZLSzN3T29EQmR4ZDdWWnNQck1RTW9u?=
 =?utf-8?B?Q294b3ZrN2VvN3lUVmE5bmMwYUVMc0FJTnVuZCs3d0lXK2pvMEUyeHB2MXZs?=
 =?utf-8?B?NVNUOXJaT0dqcnlneDM4UjZndU8zaVQwTlp4YjdNdUxUMjIzenRML1ZoVE1J?=
 =?utf-8?B?dHJyRlFpODRQS2NuY2pFbFhQMzVFTkVyRE5kSWp5QzY1elpVR09zVXJwbkY0?=
 =?utf-8?B?NGF3K3JaT0ZqUWpWU3JNM2tjcXI1Z3ROaWcyL3BZb3Z5enNEckh5aW1Pb0F2?=
 =?utf-8?B?MkNwN3ZOOGJ5YTdaR3lBa3krQ3AxNjRpQW9UVC9sdjAwcDc5dFB3V3M5RzM3?=
 =?utf-8?B?QjZnT3o0elh5N09aekwra3c3UEFBL3pjb29ZOTZRTWk5K2hKbm51R3BXa3lX?=
 =?utf-8?B?RXg2MUZrRnowVHJ3MUhCUVJTYjhDL2ZRVFRYdm9UaytoR2lubGJLMWlxQWhK?=
 =?utf-8?B?OUFCYjlzQ08xT3VQTEFINFVtZlNwaGdCRHBCbTlEQi9zRDlvOGVlc3JQdE55?=
 =?utf-8?B?Rk9wLzFlczdnUEpOL29XdDd3a0VhcHZNeW9mQTZlbThwcFFtbFdUL0tUV21X?=
 =?utf-8?B?cWhMVmpEa1JxU2NkU1VDR3B3Q2ZTQjlRZCtLaEFDa1NOUGlTNEtSQWU3NGdB?=
 =?utf-8?B?WnZ2bDFKOU9MUzJ1amtmYWhIY1htZzV3YVpSNk5Edk95QXlTWDdsMzd2RS80?=
 =?utf-8?B?L0IwOTg1VExFVHgvMCtGOUNlaFhyMHhHKzVOMEdMVmdxdnBCRDBUNFVTOGxz?=
 =?utf-8?B?Zkl5TXdPTEJmZEN4aExxR0x6WmFjeGxSazBwQ3pOQjlTSjJES2R3RWd3U05s?=
 =?utf-8?B?RTRLcUZRTVFYN3l6TVdQdFhVc3hsck01ZFZqOHJMaFR6VEdvL1BvcjJMMzVP?=
 =?utf-8?B?WERURjh2VWlpU3hrcUN2dkNWNkF4b3c2cTF6QWdYSnJEYWl6WndnNjN0bFc0?=
 =?utf-8?B?K2g0eERSRGZBVXh1Z2xBNkdTQmU0YkdyNjlSUTl5dWhnUFZTSW1wbThiVjZY?=
 =?utf-8?B?TUZadjE4SjNPczJWMVJEQVlRZXJsSkQ2ZlVqbTROQmQ3MGhuZE91cGt1dHU3?=
 =?utf-8?B?VEM2RWpsM2tya0NJdkI1UVVaRDJrRm9yeDVzd3JMN2ZVT0VLZVJ5bE93OVhu?=
 =?utf-8?B?NFlzUlBxSWMyNGhKQWVEdHJmMTV0VTl4dytaN0JOZHlWQVFvajBUd3g1RHBG?=
 =?utf-8?B?eFVmTThieGZtbGxEYmV6dnMyNkk1Qzc4Sm43VURvRGVuaHA3WE55TXNyY2Fv?=
 =?utf-8?B?ZWRScEl1dkY3VUxRSlg5T2Z4aTFCWUdzQlVqK0pwYU5zSHFPT25mZUF4bWZP?=
 =?utf-8?B?UnNoUnJYYkZaQ0pEcjdUbWFvQ0xROStvUXcxV1ErcHZqbkxDbU1JN0lDSTV2?=
 =?utf-8?B?UFdpRlhMaEtaMHI5ZWRIMFlTSGtGcm8vckF3Sk9RTjlXQlM3M2FZanZYZ1RI?=
 =?utf-8?B?cGszVTBKbTBnR3M0bkZuV3pOYkxHSndsa3hJamprUGwrVGFzMERtNjJLOGho?=
 =?utf-8?B?TkZzSzBNbTUwdW9lTFJLUFlrYWNWb205Njh5Qm1QNmRMUlpPUkgwd211VGhL?=
 =?utf-8?B?VEllWllaNjNuVkJ1M0NJbjh0MUd2ZEM2QkNvS0N4Y1MxeWxtbCtWL1NyK2Fk?=
 =?utf-8?Q?7Zi8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4802ab4e-3207-491b-827d-08dba5387406
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 06:56:48.8584 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ciPrLxqTvSCsB1I2Qt68LhggW+iabexN6JIiljiMOuxGsS0rV6Urfbf4hhb4XV5/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5380
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
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>, kernel-dev@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 24.08.23 um 18:25 schrieb André Almeida:
> Merge all developer debug options available as separated module
> parameters in one, making it obvious that are for developers.
>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  | 24 ++++++++++++++++++++++++
>   drivers/gpu/drm/amd/include/amd_shared.h |  9 +++++++++
>   2 files changed, 33 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index f5856b82605e..d53e4097acc0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -194,6 +194,7 @@ int amdgpu_use_xgmi_p2p = 1;
>   int amdgpu_vcnfw_log;
>   int amdgpu_sg_display = -1; /* auto */
>   int amdgpu_user_partt_mode = AMDGPU_AUTO_COMPUTE_PARTITION_MODE;
> +uint amdgpu_debug_mask;
>   
>   static void amdgpu_drv_delayed_reset_work_handler(struct work_struct *work);
>   
> @@ -938,6 +939,9 @@ module_param_named(user_partt_mode, amdgpu_user_partt_mode, uint, 0444);
>   module_param(enforce_isolation, bool, 0444);
>   MODULE_PARM_DESC(enforce_isolation, "enforce process isolation between graphics and compute . enforce_isolation = on");
>   
> +MODULE_PARM_DESC(debug_mask, "debug options for amdgpu, disabled by default");
> +module_param_named(debug_mask, amdgpu_debug_mask, uint, 0444);
> +
>   /* These devices are not supported by amdgpu.
>    * They are supported by the mach64, r128, radeon drivers
>    */
> @@ -2871,6 +2875,24 @@ static struct pci_driver amdgpu_kms_pci_driver = {
>   	.dev_groups = amdgpu_sysfs_groups,
>   };
>   
> +static void amdgpu_init_debug_options(void)
> +{
> +	if (amdgpu_debug_mask & DEBUG_VERBOSE_EVICTIONS) {
> +		pr_info("debug: eviction debug messages enabled\n");
> +		debug_evictions = true;
> +	}
> +
> +	if (amdgpu_debug_mask & DEBUG_VM) {
> +		pr_info("debug: VM handling debug enabled\n");
> +		amdgpu_vm_debug = true;
> +	}
> +
> +	if (amdgpu_debug_mask & DEBUG_LARGEBAR) {
> +		pr_info("debug: enabled simulating large-bar capability on non-large bar system\n");
> +		debug_largebar = true;

How should that work???

> +	}
> +}
> +
>   static int __init amdgpu_init(void)
>   {
>   	int r;
> @@ -2893,6 +2915,8 @@ static int __init amdgpu_init(void)
>   	/* Ignore KFD init failures. Normal when CONFIG_HSA_AMD is not set. */
>   	amdgpu_amdkfd_init();
>   
> +	amdgpu_init_debug_options();
> +
>   	/* let modprobe override vga console setting */
>   	return pci_register_driver(&amdgpu_kms_pci_driver);
>   
> diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd/include/amd_shared.h
> index 67d7b7ee8a2a..6fa644c249a5 100644
> --- a/drivers/gpu/drm/amd/include/amd_shared.h
> +++ b/drivers/gpu/drm/amd/include/amd_shared.h
> @@ -257,6 +257,15 @@ enum DC_DEBUG_MASK {
>   
>   enum amd_dpm_forced_level;
>   
> +/*
> + * amdgpu.debug module options. Are all disabled by default
> + */
> +enum AMDGPU_DEBUG_MASK {
> +	DEBUG_VERBOSE_EVICTIONS = (1 << 0),		// 0x1
> +	DEBUG_VM = (1 << 1),				// 0x2
> +	DEBUG_LARGEBAR = (1 << 2),			// 0x4

Good start, but please give the symbol names an AMDGPU_ prefix. Stuff 
like DEBUG_VM is just way to general and could clash.

Apart from that comments on the same line and using // style comments 
are frowned upon. You should probably rather use the BIT() macro here.

Regards,
Christian.

> +
>   /**
>    * struct amd_ip_funcs - general hooks for managing amdgpu IP Blocks
>    * @name: Name of IP block

