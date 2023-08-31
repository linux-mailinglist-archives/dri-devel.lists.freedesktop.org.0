Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E94478E684
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 08:29:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60C8310E57F;
	Thu, 31 Aug 2023 06:29:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 113EB10E572;
 Thu, 31 Aug 2023 06:29:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XgTTbqVgM8kvrHREoc6+XNST2KeRwJZ2yQUk8qfMLntMe7gLG02YTGtP/6r8wlqKbHPipB17vlFMK0WCKL0k0uq1/6MsjNV3FLg6d0k6uURbKCpK236KVY2FvFJyPeSplnxqnANo3Xe4X60tHKy93iKl8bgp6Z9gjnAnDrAJwBBnBSFNrD4o6JDXhUK96NrV0d7C++zuvx9bKHuhzT6GuwQgv7IDlHT5BUT5W4oJEb1anjjawT5bVbWUoW8VQpokNJ4C58kA1Nr1A4+Cmhe0Xz4Tl+mUEzTfKTpsVS25as1R8SrYftrh5BIZxuZx7yD0e/6559H0uT8L8efF75voQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aKqnCac0W5gjYT+esd9c45V5h7YRU/FBo9wC7pvCXew=;
 b=B9AtOuKWOtHWbRFUCFFyZT8ua+sG/2C4vzoEppPcESDNMNrYcz9RRIY3FeKxWwYx4xWaxJg88RM/T/kXbKL6ROY8Lsrhtw8nOcMSE9oCnaDkNOEB2PH3CDxZsR8ESC8j3X9eI9s8E4N5izJrRXUgWHL7+z/RSkpcwWLqr40CrAwuB8mqNnIPYxwPhOMUKnCUewsUUUUBJM+1hLlF+ypN97xzygPlIqwjs5PKuQk91FhdZh57OJ2dqC77ji54h2Cv0Ejh81BkMLWY+z8O+qURLXz+s6VRjYDekU7O54BdEYRURSnJOPP7HmE6n1VwXQjN7OTH6HDPbvWj0wMqYVMmNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aKqnCac0W5gjYT+esd9c45V5h7YRU/FBo9wC7pvCXew=;
 b=RQCPYArBQy1BkCU/xedQyWkKqLyjHmTDE5cBakStNXi8GVmn5sAfaQU12eZNBPfvLoB6GpMr0dgwvYIS5P9a6jq0CyEiu86Ehn0mTBw/pmK1z/KyrPMTx3s28UeoF4B8ZukVmGFP+xOqIlXbjNxZEbVtIBXhf8VojYPVU6LpOMw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ0PR12MB5408.namprd12.prod.outlook.com (2603:10b6:a03:305::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Thu, 31 Aug
 2023 06:29:38 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6745.021; Thu, 31 Aug 2023
 06:29:36 +0000
Message-ID: <b7226a29-0889-ee21-6207-c29fe971db4e@amd.com>
Date: Thu, 31 Aug 2023 08:29:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/2] drm/amdgpu: Merge debug module parameters
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230830220808.421935-1-andrealmeid@igalia.com>
 <20230830220808.421935-2-andrealmeid@igalia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230830220808.421935-2-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0245.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::6) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ0PR12MB5408:EE_
X-MS-Office365-Filtering-Correlation-Id: ca3a249b-3b74-4437-a740-08dba9eba5d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fo60vkrf3wT6jHRYKG5Bwe/KeyiU/jcIMFdysCR3ZSsbpcvmMkDRgc90ff9Izqr2Jv4G70pLChCW2+h3guaxNOWEJFz6lOG+2cHtTM7U57czN62lrm45AwdH3kwDfEGr9sF4krlRk2PHUiUTiGqzNc8PIwzt7XlUGShHLKS2mk5LPguJEwwjcA1pC64J8EocNOouEMJa/cCG41Sa7ZYGf3SZFxbb18XeOumHJ0YkEO94U9IUncuZY6GcgAm5g6YHLjpo5ROvD6Mrlr3lyaLg/Z8Ptwj1VddxcB7byF3gEZkgdQY/EFmH26/sRJFPNexnVwJC0X/9szxwHElLTGG7+nifPnugx9NNqbyX0SzWUbSnycblFCXny7dqucODhic4EFDgk/TTN3XaTtiyo5JT/F7dwuUaRts/IVS0IPBxrr/lOpgFfaLgqrcqvjZEwJZf7ZvlOTu0JSmXqO4z+aMo7PqNt7sJd0hnJNhcpJnxCMJKMxhKpZ3XSmawdh/moc45XZPzAMX3YbUlfqPE3KWQnMepYUb41RLh8KFKqBXYndXGF0ZN+t2UECHiXAcslAhfVGNXP5CsR/s4iKIlCC2Z7iFyZoObDOwm6Zr7aXa2yr0mWAYJlVezmGfLzyYBW5m7qccxyV3lyQN09ztqtJ4Q/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(39860400002)(366004)(396003)(346002)(186009)(451199024)(1800799009)(6512007)(6486002)(6506007)(6666004)(83380400001)(478600001)(2906002)(26005)(316002)(66476007)(4326008)(66556008)(8676002)(41300700001)(66946007)(5660300002)(8936002)(86362001)(36756003)(31696002)(38100700002)(2616005)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SE1malNjdGU5OTNSYTRuNFh2bkVUNlBQVjV1WG43ZzZ4ZDFpR2xXSHRuMnh4?=
 =?utf-8?B?ZGVUQW1ndzV1MmNQZ1Fza3lsajRPTW1jTUcwcWpzZ01sYmk0eHY0S3h1ZXpq?=
 =?utf-8?B?ZzZFZWhJcG9KaldCSzJBbHVPeWdZZEtNaWUzUElmODYwb0tWbm1SL0R2aTdr?=
 =?utf-8?B?Q3FDVm1sVi9RZWdRaFQ1U3lQOTRBUVEvUElxMENMTkVtZGhONmxwclZvS3BP?=
 =?utf-8?B?ZHNyK05pTGdDZmM3Mnh0NkpkeWJCeGp1am1ka3FOL0FaRGpyb0lxREFDeXpr?=
 =?utf-8?B?enFuL21tUHdXSDVBTndMZE9ISnFBeVZETnhkbFJoYW9HdGJQR2lGdkNqNFpM?=
 =?utf-8?B?cWwvdlIvc1l0c1c4aVBURFJQYWRLRlNCQ3lCMC9aeXpZdktEaDh5WTlwL24v?=
 =?utf-8?B?eTl5d1R1Vm85L1FSK1RCR1o0c29ZN016eFFJbUNPL1hjaUdwVyt6bU1Ha0VJ?=
 =?utf-8?B?UE9XY3l4SlJNdGUzdFZ3NEIvVnl2NFViZW5QRTlvWkY5aDA2SG5xNmRPZ2ox?=
 =?utf-8?B?WktwdVdVNU53cWMzTWp5REE5N0FhbEVGMHhNV20yeGM5MFhSbFB2TXk4L203?=
 =?utf-8?B?dnpQRU9DdkRibzdjYWZmWmRZdE5QU0lEWTZIcFlNbUFxam8zeFVxNDF6V0FR?=
 =?utf-8?B?Z0ZpQ1lncTZReXNrTXRGVG1DVTFJdE4xeDZOWkpUM0Z4WGxzMVVLSFlNM1dP?=
 =?utf-8?B?aUU3akFKQ1Y2M3Fsamdnd0hyMUpNTGJwSHdOUiswK3hGOUR1K3ZGczFCUXV4?=
 =?utf-8?B?NDRVL0NDSDM2NzlqVDQrMVErbm1kZEJkakFTUzczdmZ2OEpSSUNqVWo4RjZ5?=
 =?utf-8?B?WU45MndGa2E1VG5wOENDTTNZaSt3dk9EWUtxYWJSeFM2dXJhYm5wRDZpUW9G?=
 =?utf-8?B?Ykdkb1EvNE5xN0thdW4vVDJsVEVReFA1ZjlVWTdrL2NCS25seDBPVGdkZzdG?=
 =?utf-8?B?elR0L1F4MFFrTWIvKzFRY1E5ZWM5NytCc2dtZVlFQkFOVjRSYzRvS1REVURD?=
 =?utf-8?B?TUYyaXlZbDh3Vzl3d1NlaFlPRm5EOHZwT09iNVJQeU8vNUZnL3kwazRYSjJz?=
 =?utf-8?B?SUx3WFRIRmtnOUtRejhZaTkwanVGYjRSWWVJQWdsSnFSRDR6OVRESThORU5j?=
 =?utf-8?B?MXBmaXRpN05JdzV6c0xWb29ROXUwV0hXZ01vb2tGaHZESGZUSjFzUWtSNmdH?=
 =?utf-8?B?dUtIM0NEcjNDamRRYWRrbnRPbVBtcjczUG1hT2hUZExoQ25OV2RGckR6bUts?=
 =?utf-8?B?bWZoSFFHUXlSWEFHL3hIbHlZTXRRQXJZNUxDOGxiNWoxNkEySlRUZFk1Z3Ru?=
 =?utf-8?B?WnB3UkdZenpjU080TncwMEZ5T0NvSHY3SisyWEh0bG1SY1l0c0lUSlBQSUc3?=
 =?utf-8?B?bEZ4bGhNYlhIWFBHZzZOeS80MDdVZFVXQkZhMVlBVEFuMjlOYUpMN3NVS3M2?=
 =?utf-8?B?VmR3Q3VYa2ZtS0QzK0l6SEF4ei9PdWlIaC9XbnZhRmFzd2pTSnA2MXI2MTJy?=
 =?utf-8?B?bVFMaWFXR0tpZ2piL1Z0M2xLZ3RKMWRYMjY1WlUrV2ZvdEwzSFA3TGhqdzhQ?=
 =?utf-8?B?dVhqdkRCUmRMcHh0c3pML1dVR2swOTJoSXFWMHdmYXl0TWxHWHB4T3RSYTI5?=
 =?utf-8?B?MG8wV0lGdEpKNjdqeHQxaHA4M1NLV1dPMy9LS3lGaEoyczBkcCswbUwydE1r?=
 =?utf-8?B?U09mK3FzRkNqSHovVTRRZmxvQXRyeitoNEE2dFRUV0tNT05Zd2w2S3ZCVldl?=
 =?utf-8?B?eUxLV3l5NDJIZzVhTnRPOXJUelQ0SkE4UE1GcEJyWGk1VHIyVU5pWlNnYUd6?=
 =?utf-8?B?cnJQdWU5YlZuc2JyWWE0c0o5TVZXblM4Sitka2U1S3k2bXE4eEo3M1lDb3RD?=
 =?utf-8?B?MXRXVUNqV1Q4L0ZUOWZ1dHkwYmtJYmw5U0w4NDh4TklPTDBwZmVCTld1QjEy?=
 =?utf-8?B?QXdRV0h4ZmpZZnJHSW9ianA1aExIN1NMZ0hudGJFdzFJR014NWFvS2ZXL05T?=
 =?utf-8?B?SGZuRDlOTktDZmd3c3JNWXVzYjhBOUhWeHc4VjRhc3dpUEF5SlBQR3hjbFBV?=
 =?utf-8?B?N3NEZ3lYNjNQenB2RjNEUksxb3drSG4xcEtYQzBBYzdHYzl3K0lnbVdhNjdR?=
 =?utf-8?Q?gruKDMJoIwr9aUsmz6JCcoDud?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca3a249b-3b74-4437-a740-08dba9eba5d9
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 06:29:36.9369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CxDhQXulBMURg0aEIrjjwmGGpNwTE1yDHCETEevznwowdnkm6FVe2YWKeKDQZ9Bx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5408
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



Am 31.08.23 um 00:08 schrieb André Almeida:
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

That is probably not the right place for this.

Better put this into drivers/gpu/drm/amd/amdgpu/amdgpu_drv.h

Apart from that really good work. With the location of the defines fixed 
feel free to add my rb before sending it out the next time.

Regards,
Christian.

>   /**
>    * struct amd_ip_funcs - general hooks for managing amdgpu IP Blocks
>    * @name: Name of IP block

