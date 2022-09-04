Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EADB5AC4B6
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 16:13:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46B3810E048;
	Sun,  4 Sep 2022 14:12:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2042.outbound.protection.outlook.com [40.107.244.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A3E10E02C;
 Sun,  4 Sep 2022 14:12:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lZGju5MXrt89ik4woXr6kFFAZJdJxfru+ovDd9P+5oK1b9/WD52xUAA5sAMDA8mE4ISUAzu+n89UEu87yTwM6+PY12fMPrVs433+mP3ty+skS5ghg5ABdFJbjvM4EtGHoJseH4Di3zmb0WJFXUymsMe2U4cVcMqG9HTBFyroYIUBdrG+m3abo1wEKCnZOc98G2tUbIUy9HB5iVqRzdlfZEpZzyIMjca7BtIg+ORjIQbv/ApVAqZeFJynlpINtwMY56cQTeiLe0Vnipo3VoxQXdf5Gdv+JgrsBUkA0XOieUpQUI6ClRTwIppP9HKIfx61Qb1QK8c81x38OK7LqsgFdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iva8TNW1o/W5PV489akyuBKyFYWqKZAGvYCUCYrE35U=;
 b=RBsbdp+Phd7kQwYZ3iL7RLol7tPQZOPgEbjB5mKuD5HoWk1VBFQENY3yk25VjNjA2zZmGOMP1j+O2xBazTnsBs7TtYVkN9D8ZMJ9p/16w8JqMXQbxEPyqsLhOx+ppyuAPz8c165poj+kDWZrUVZ8H3F1K5EN3AUFDX7cLSlVlNgeMRJc1ZIqZQOkHX9W7waruUFsO5WG4JEHiiZwbrJ3HLE8s5BCCkHAoMKjN38lWo9Mnq3Pq4SUVGZFRzFGU1y+HqucYUDWP6PKZMUdkfblCG3OWMCC8U5j0sCtPnrnj0LqYB6SBNAhrvzw6UfFv6uo6ey/TkyYUfya31Nh36n6KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iva8TNW1o/W5PV489akyuBKyFYWqKZAGvYCUCYrE35U=;
 b=lypYxSy+hAN/bTAwnvFXTC8tAGdeRvwxEYxO/2vxfLiLgkKYZ2/piPjoK/RwbhJJYC/uxtBf3dxm+cOuJGSq0a3whoYC9gJeWLWCFirGMa3+wdy5NrJViK8ycqfauktpy+yN+zl7PEl0p0tBYnOjapAAzk3hSVrJdLycDt1OsaA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB7161.namprd12.prod.outlook.com (2603:10b6:510:200::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Sun, 4 Sep
 2022 14:12:31 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94%7]) with mapi id 15.20.5588.018; Sun, 4 Sep 2022
 14:12:29 +0000
Message-ID: <0873fb6e-4895-d90c-2882-90118d72dd12@amd.com>
Date: Sun, 4 Sep 2022 16:12:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm: amd: This is a patch to the amdgpu_drv.c file that
 fixes some warnings and errors found by the checkpatch.pl tool
Content-Language: en-US
To: Jingyu Wang <jingyuwang_vip@163.com>, alexander.deucher@amd.com,
 Xinhui.Pan@amd.com, airlied@linux.ie, daniel@ffwll.ch, evan.quan@amd.com,
 mario.limonciello@amd.com, Hawking.Zhang@amd.com, andrey.grodzovsky@amd.com,
 solomon.chiu@amd.com
References: <20220904083912.1006262-1-jingyuwang_vip@163.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220904083912.1006262-1-jingyuwang_vip@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR02CA0011.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::24) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f99b845f-6a19-4708-a778-08da8e7f800f
X-MS-TrafficTypeDiagnostic: PH7PR12MB7161:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bTF9jHvmZR/t7BEpeC4OXDvYMgOJ3QSXIcg6xvlZ3kfGJle/zCUxIGS1c8S7NpFlxIgo6tK9ym75qZKFPOmLiacjxc9KKpQUqn89ExhjBbebWyI02bZ89w2fZTP9VySw91EVroAGvbKA4i8QO5Na4B8GVx4f76atcw+3B47yB+pp9tdwuc/BYsXJnICJD3Blku3YLDIbNC/DooJZsfBGSJio2wWFyidjPYBUwCKAk60F5s7zMHhK6f5L9B6cGjRqrjSzEUw7yexZgq9hnlnYVUQWCQEMP2oERLg+nJbKXERADqJgkcl58BIJz9TMklA+BDvvqdQUYHteKfWkkUwQqtrN1Ak7FxRDO+b6pZAe5Op4d2HpqxAnsz+1TVuXN1SzgWJVrC4hPa2y1uCpc7Ipl8SiwaV5oFE0Go7HU/p4UvTtG9UbGEaZepJ8ZURo3dcrK4GcXIZKed+nbqUetxNw7mWIGIPgS9jeilvKn5z6egzTCjd6x8080dYP8czh6E7CvzVnwxyCKVW4YiqlFtWINNeTP2MFZrJ7v64N/1hBmLFyuhp5W+IrOy+JaLE7puK0umr+6qxaPzCYWY1kxVqVZOG2jAuT6T4PmqqzgyfUnZfyn6PkxgRwpZFl1lazfeXCJC1LyTBAfErs7DW9xtZYrdVoKv6WHihx8NPf0TSo4NePf/mb5UR7VJZ+ntiaj+eaOCDcuAIUAkQCW+fF4AOx1I5pjsTLK9O9Ui8Q4RDQAwOz38zeVzHyeTxXo8RwTcrISsQ6eByQVKHCEVNBiAjf6bqeZOvKjMQq9/+rURIVeyyCl3Qnq0j5gEmkQR5pbrhj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(316002)(6636002)(83380400001)(6506007)(6512007)(6666004)(478600001)(8936002)(31686004)(31696002)(36756003)(86362001)(2906002)(5660300002)(4326008)(66556008)(66476007)(921005)(8676002)(66946007)(41300700001)(186003)(2616005)(6486002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2RhWmxPWDFFcjRZczY3b1kwazZSMHpwUTNPSzhvaEhpMUVJUmtWdU5XY0dM?=
 =?utf-8?B?eXdZMk1QbmZrc3RsZlFyTXkxZlRURjZ3dlpMNjBKRWZncG45TWdMS2xCZm1h?=
 =?utf-8?B?d0JzQlppTDNjNUtWbk1xcDdxR3ZGVWJMT2ZhOWsxWXByOUNnenVSYURDUWlS?=
 =?utf-8?B?T3FvZjFaYzY2UzRncGlmRlM5cUhGUjJKNk9GeW96akVndkdsNDN0SUdFZ0du?=
 =?utf-8?B?V2dVSVFBcTNFRGFUdXFNQ1RGbVhqYmxQMHNQbUQ3R3VkVVp4TGRzVkdSZE9P?=
 =?utf-8?B?cDFlZ3hqY1VwNHVYSVRtQlJlaUFTWHJ0S2JqMHV6RG9selFuOFhRN2NMbUVp?=
 =?utf-8?B?Z1BpUUd5UVZlVEJUckNVQzVlZTRaWCtEVlFjQVl4alFwTEhYUVJkbWV0T0hk?=
 =?utf-8?B?Z0V5Tm8xL2ZFRXMvTEVNMnJXN1JCc1dISVVOc2VKVGY1eFhjM0l0MXhkRWFY?=
 =?utf-8?B?TW5jbm9qL3dZRmhrTURqS0JMWTFtWFVjeWVOaElZV1NYNXhxR0hYTTlMRGFM?=
 =?utf-8?B?NElobzRVbk0yc1ZEZW1CeU1iZ0RQOXRzQjlNV0MrU1d6RndmRkM5aDBXNmwy?=
 =?utf-8?B?Y2JVWC8vZGJ5WVFLNFUxRDJqd2tRV1ZpOHVUYnJ3UHNqQVFYdUhwTUpGY3JP?=
 =?utf-8?B?bWRKNU95V2xZckNSMlR3cy9EendWSlREazNsbEJlclJudy9IUzVITEh0S3BT?=
 =?utf-8?B?eFAzdzVIR21oWjBnSnVvSGN2U1RIR2hqRmVFSjcrSTNHUkwxYkdkeDJZcTBN?=
 =?utf-8?B?QnVHaHlGM04rcmhJNElSd2QyNDNHangzM1BvUWRabWFhckpLTkZadjlHNEsw?=
 =?utf-8?B?UzZzRFpLcC9XOXI5bFlKSXN1Z0Vnb25DaDl0ajBydkNIcDcvVG50dTZQMkkw?=
 =?utf-8?B?MWF3MU5TOWNLeitjWFQ1YThVelZtV0pJWlJyZXg2WElZQldycmJtUzNTT1dj?=
 =?utf-8?B?SC9QdStDeWZuemphb0lKaHNnV0ZFeHh6cWhvcjcydzZtMXFUMVU5Y3pNeDNH?=
 =?utf-8?B?N0p2MFBOb09RWHN3WU14VGpsbFA3S0JYTUprRkoyQWNhazZCeTAzdDQvSHow?=
 =?utf-8?B?YWlRWmFSUDVIOEQ5K2VkTndXR2FHcVBuOS9UMFp4MjBrOEN1ZkE5cTNIRFJq?=
 =?utf-8?B?WS9KNTBWTHdqUko2NzNObzBEUHR4R1RmQVBBQ2dZSDdlN283RzdrSDRpTC9w?=
 =?utf-8?B?ZEZ0bGNLS2FjN3pLdW52QWhWSTFoODVLQVlhSjFkdmY3SlB4TEVBWjI5cTI3?=
 =?utf-8?B?UTdZYnVncGJIZnVFcDlxeFRuaG93QnpmNi83VWgrdWM0RmFYcGU3K2N5bXJy?=
 =?utf-8?B?UG82RS9aT2JMNUUxMnlwd2F5aE9kakFCRVZYdEFMRFpKNisrOU11MHVqRkxH?=
 =?utf-8?B?RG5NYmIrcytrMkRSU0RWZllRam5FNUVadkZFYVFYOExpYS9PVVBVV2dhWHY1?=
 =?utf-8?B?VlFld3I3eUh2K1pMYlFjL2JyR3lXc1ZjeEQ1QnBpZE1KeHJGR0VSZCtUTC9G?=
 =?utf-8?B?TkN0TWZOR1crNFIyaE9hU2JqdHFIOUV6UkdnNk5LRE5hZmZtTzRvR0l4ckhl?=
 =?utf-8?B?OUJvamN1QURpMzJpdnZJWmtnTlRFUThadlRIcGVLUmE1VVpEZzhhT29QTjFj?=
 =?utf-8?B?NTk0ZEVLaFdQUllyTnUyQUViSDRyRlhVTGIvbU5aSW5KQkdiMU1jby9zaDIv?=
 =?utf-8?B?SEJQQ0xlaGFVcnZTUy9nSVdSVVlEamhIVmFTb0F0ajZCZjJuOXpSSFpNTUVy?=
 =?utf-8?B?SmZuTXk0WEdRZVpDMnkya24wVWsvbzA3MEU4dGdFQk9USmVjQ3NHc1pzbEN1?=
 =?utf-8?B?dUNCNGZIRHBhTzdVY2puQWRMeit3c0dPbENYSTdvRHRjMXlnVEFUaC8rVit2?=
 =?utf-8?B?eVpKdU5LUGFNT3N3S2ZOdG1CcjYrYjc4ZGZRL0llTHFqSmwwV1FkbCtoNUdW?=
 =?utf-8?B?N0xFN0hhVG5RUUFXTGtnRXFWUEk4eEZ5Z29yeW1DQ3BWWSsxUk4xQkxSOXJC?=
 =?utf-8?B?ZWRCdG5vQ3dzSnp4VU1nZjJOd3gzeVFsVEkyVk93V1lkN2szMzNrbjRZV0c2?=
 =?utf-8?B?eFpTTnhqOGVXMXJ3UFBEUjRFU0d0U1dPVUpqNmZCQ0h6L3hMdGtEUUkxa0Jq?=
 =?utf-8?B?RmJsaGdtWVpablFodnN4TVJSSmlzOVVGUDNiUGZHZlg5TjA2WStDS1YydHI1?=
 =?utf-8?Q?MzYHpIcGcsIw/RRk1CSaL0fSCRNYD3GU6gvdqwzJbogv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f99b845f-6a19-4708-a778-08da8e7f800f
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2022 14:12:28.9034 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A/N2WXK7Z0XiAtAOtHO39pmXgbRTo9ehY20ASQHgr+dLC9scekGk6AuNE+BTGWFE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7161
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 04.09.22 um 10:39 schrieb Jingyu Wang:


Looks mostly valid, but a few style nits and the kernel test robot 
complained about something as well.

First of all please shorten the subject line, something like 
"drm/amdgpu: cleanup coding style in amdgpu_drv.c".

Then provide a commit message, e.g.: "Fix everything checkpatch.pl 
complained about in amdgpu_drv.c."

> Signed-off-by: Jingyu Wang <jingyuwang_vip@163.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 40 ++++++++++++-------------
>   1 file changed, 20 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index de7144b06e93..5c2ac8123450 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -140,8 +140,8 @@ uint amdgpu_pcie_lane_cap;
>   u64 amdgpu_cg_mask = 0xffffffffffffffff;
>   uint amdgpu_pg_mask = 0xffffffff;
>   uint amdgpu_sdma_phase_quantum = 32;
> -char *amdgpu_disable_cu = NULL;
> -char *amdgpu_virtual_display = NULL;
> +char *amdgpu_disable_cu;
> +char *amdgpu_virtual_display;
>   
>   /*
>    * OverDrive(bit 14) disabled by default
> @@ -287,9 +287,9 @@ module_param_named(msi, amdgpu_msi, int, 0444);
>    * jobs is 10000. The timeout for compute is 60000.
>    */
>   MODULE_PARM_DESC(lockup_timeout, "GPU lockup timeout in ms (default: for bare metal 10000 for non-compute jobs and 60000 for compute jobs; "
> -		"for passthrough or sriov, 10000 for all jobs."
> -		" 0: keep default value. negative: infinity timeout), "
> -		"format: for bare metal [Non-Compute] or [GFX,Compute,SDMA,Video]; "
> +		"for passthrough or sriov, 10000 for all jobs.
> +		0: keep default value. negative: infinity timeout),
> +		format: for bare metal [Non-Compute] or [GFX,Compute,SDMA,Video]; "
>   		"for passthrough or sriov [all jobs] or [GFX,Compute,SDMA,Video].");

checkpatch.pl might now not complain about it, but that doesn't look 
correct on first glance.

You now include all the newlines and empty spaces in the string which is 
not intentionally.

Christian.

>   module_param_string(lockup_timeout, amdgpu_lockup_timeout, sizeof(amdgpu_lockup_timeout), 0444);
>   
> @@ -502,7 +502,7 @@ module_param_named(virtual_display, amdgpu_virtual_display, charp, 0444);
>    * Set how much time allow a job hang and not drop it. The default is 0.
>    */
>   MODULE_PARM_DESC(job_hang_limit, "how much time allow a job hang and not drop it (default 0)");
> -module_param_named(job_hang_limit, amdgpu_job_hang_limit, int ,0444);
> +module_param_named(job_hang_limit, amdgpu_job_hang_limit, int, 0444);
>   
>   /**
>    * DOC: lbpw (int)
> @@ -565,8 +565,8 @@ module_param_named(timeout_period, amdgpu_watchdog_timer.period, uint, 0644);
>    */
>   #ifdef CONFIG_DRM_AMDGPU_SI
>   
> -#if defined(CONFIG_DRM_RADEON) || defined(CONFIG_DRM_RADEON_MODULE)
> -int amdgpu_si_support = 0;
> +#if IS_ENABLED(CONFIG_DRM_RADEON) || defined(CONFIG_DRM_RADEON_MODULE)
> +int amdgpu_si_support;
>   MODULE_PARM_DESC(si_support, "SI support (1 = enabled, 0 = disabled (default))");
>   #else
>   int amdgpu_si_support = 1;
> @@ -584,8 +584,8 @@ module_param_named(si_support, amdgpu_si_support, int, 0444);
>    */
>   #ifdef CONFIG_DRM_AMDGPU_CIK
>   
> -#if defined(CONFIG_DRM_RADEON) || defined(CONFIG_DRM_RADEON_MODULE)
> -int amdgpu_cik_support = 0;
> +#if IS_ENABLED(CONFIG_DRM_RADEON) || defined(CONFIG_DRM_RADEON_MODULE)
> +int amdgpu_cik_support;
>   MODULE_PARM_DESC(cik_support, "CIK support (1 = enabled, 0 = disabled (default))");
>   #else
>   int amdgpu_cik_support = 1;
> @@ -601,8 +601,8 @@ module_param_named(cik_support, amdgpu_cik_support, int, 0444);
>    * E.g. 0x1 = 256Mbyte, 0x2 = 512Mbyte, 0x4 = 1 Gbyte, 0x8 = 2GByte. The default is 0 (disabled).
>    */
>   MODULE_PARM_DESC(smu_memory_pool_size,
> -	"reserve gtt for smu debug usage, 0 = disable,"
> -		"0x1 = 256Mbyte, 0x2 = 512Mbyte, 0x4 = 1 Gbyte, 0x8 = 2GByte");
> +	"reserve gtt for smu debug usage, 0 = disable,
> +		0x1 = 256Mbyte, 0x2 = 512Mbyte, 0x4 = 1 Gbyte, 0x8 = 2GByte");
>   module_param_named(smu_memory_pool_size, amdgpu_smu_memory_pool_size, uint, 0444);
>   
>   /**
> @@ -772,9 +772,9 @@ module_param(hws_gws_support, bool, 0444);
>   MODULE_PARM_DESC(hws_gws_support, "Assume MEC2 FW supports GWS barriers (false = rely on FW version check (Default), true = force supported)");
>   
>   /**
> -  * DOC: queue_preemption_timeout_ms (int)
> -  * queue preemption timeout in ms (1 = Minimum, 9000 = default)
> -  */
> + * DOC: queue_preemption_timeout_ms (int)
> + * queue preemption timeout in ms (1 = Minimum, 9000 = default)
> + */
>   int queue_preemption_timeout_ms = 9000;
>   module_param(queue_preemption_timeout_ms, int, 0644);
>   MODULE_PARM_DESC(queue_preemption_timeout_ms, "queue preemption timeout in ms (1 = Minimum, 9000 = default)");
> @@ -799,7 +799,7 @@ MODULE_PARM_DESC(no_system_mem_limit, "disable system memory limit (false = defa
>    * DOC: no_queue_eviction_on_vm_fault (int)
>    * If set, process queues will not be evicted on gpuvm fault. This is to keep the wavefront context for debugging (0 = queue eviction, 1 = no queue eviction). The default is 0 (queue eviction).
>    */
> -int amdgpu_no_queue_eviction_on_vm_fault = 0;
> +int amdgpu_no_queue_eviction_on_vm_fault;
>   MODULE_PARM_DESC(no_queue_eviction_on_vm_fault, "No queue eviction on VM fault (0 = queue eviction, 1 = no queue eviction)");
>   module_param_named(no_queue_eviction_on_vm_fault, amdgpu_no_queue_eviction_on_vm_fault, int, 0444);
>   #endif
> @@ -1609,7 +1609,7 @@ static const u16 amdgpu_unsupported_pciidlist[] = {
>   };
>   
>   static const struct pci_device_id pciidlist[] = {
> -#ifdef  CONFIG_DRM_AMDGPU_SI
> +#ifdef CONFIG_DRM_AMDGPU_SI
>   	{0x1002, 0x6780, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_TAHITI},
>   	{0x1002, 0x6784, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_TAHITI},
>   	{0x1002, 0x6788, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_TAHITI},
> @@ -2289,7 +2289,6 @@ static void amdgpu_drv_delayed_reset_work_handler(struct work_struct *work)
>   			amdgpu_amdkfd_device_init(adev);
>   		amdgpu_ttm_set_buffer_funcs_status(adev, true);
>   	}
> -	return;
>   }
>   
>   static int amdgpu_pmops_prepare(struct device *dev)
> @@ -2478,6 +2477,7 @@ static int amdgpu_pmops_runtime_suspend(struct device *dev)
>   	/* wait for all rings to drain before suspending */
>   	for (i = 0; i < AMDGPU_MAX_RINGS; i++) {
>   		struct amdgpu_ring *ring = adev->rings[i];
> +
>   		if (ring && ring->sched.ready) {
>   			ret = amdgpu_fence_wait_empty(ring);
>   			if (ret)
> @@ -2600,6 +2600,7 @@ long amdgpu_drm_ioctl(struct file *filp,
>   	struct drm_file *file_priv = filp->private_data;
>   	struct drm_device *dev;
>   	long ret;
> +
>   	dev = file_priv->minor->dev;
>   	ret = pm_runtime_get_sync(dev->dev);
>   	if (ret < 0)
> @@ -2664,9 +2665,8 @@ int amdgpu_file_to_fpriv(struct file *filp, struct amdgpu_fpriv **fpriv)
>   	if (!filp)
>   		return -EINVAL;
>   
> -	if (filp->f_op != &amdgpu_driver_kms_fops) {
> +	if (filp->f_op != &amdgpu_driver_kms_fops)
>   		return -EINVAL;
> -	}
>   
>   	file = filp->private_data;
>   	*fpriv = file->driver_priv;

