Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B5560D4DF
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 21:43:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7364F10E0FD;
	Tue, 25 Oct 2022 19:42:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2055.outbound.protection.outlook.com [40.107.237.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23CA310E0FD;
 Tue, 25 Oct 2022 19:42:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YW4C+f2VHJ6VWlYk9Bv5v5ClHcIG8lcHyBwQksW2SJihqJYnCcqPcF6UQXZpBg3BHMYi5rK9BZQOtn6nBE9663vRo0k3vdf+bND+VzxpRK/50oerJ9SB3s39awe62bUzR6sahQ590WxDLs4DRllaMzA4V9LUicBlpvgZAKRjnadLYoyBGBLK/TQm8CSoGk3vEneTAR9ffoEox/NiFekzGmiFiscWsBW8YV8QhdjeCSLJ8c8lr3gatqP3/Vd6/LdjsbhLUyLP5hY3umeYJ1axN+s0vl7K6ERrZLp6OOBlMcZTvg1Yi5kPrwwyr//EEbUFkwspC/v1Ipk0R7va6o5gRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AqZzB0GYIVPJxd/gh7FTIU1XGm9YvrSVzIFcwYbnvds=;
 b=KK3Eqy2YaAKv2EjgRtrKTViWNIbyEV0e7swbR4eEzWtYuwMnVn3GV6T9J3hELbwTHyiP+NSmHRim1xVetiFXf1x9L/7btIY83whDXZmOd256fzGuet4hADuYZFQMlWrdD0NHzrCsloqXzy2aDJDbgU+YZXxJqo/o4w6DaVWB+qK7ildmy7ZKmGBBWJDp2/HUfB6doFywk9FubV9GoLH5qCIuEHxtqj9fHe+VJ0MOCcoq9ZBPiNdVHQaLSYR4dyUehBEkDnya7YCctzqvuTQVkAENoUxRn7xA71dBTIaHM7Mwj7kQyuAeDe+O/4WaBj6hBc7Ci+kkR3HQONguvk5ksQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AqZzB0GYIVPJxd/gh7FTIU1XGm9YvrSVzIFcwYbnvds=;
 b=hiq0FoVzCyFMyDoL7IF4LAC9iC+3aerwKe7QvMAHiGvqeOJbR5GwDqB3pECHY7NAPk96yLutJ48eBaw1p3GlPxyxEimnuKM9MUd9P662J2CPPua+kNeO9AuF52IY9c4JvWNlUZ8a6rJnpdhhsk6hwK00rZLA5NrvWyd8oILUsp8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by SJ1PR12MB6026.namprd12.prod.outlook.com (2603:10b6:a03:48b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Tue, 25 Oct
 2022 19:42:49 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::7e91:f457:9ec5:33be]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::7e91:f457:9ec5:33be%6]) with mapi id 15.20.5746.026; Tue, 25 Oct 2022
 19:42:49 +0000
Message-ID: <4caa8083-017f-034e-55cf-321ad1a7ba44@amd.com>
Date: Tue, 25 Oct 2022 15:42:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH -next] drm/amdkfd: clean up some inconsistent indentings
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>, alexander.deucher@amd.com
References: <20221025060944.31705-1-yang.lee@linux.alibaba.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20221025060944.31705-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0116.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::25) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|SJ1PR12MB6026:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e82d64d-674b-486a-4509-08dab6c118e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UCtZTNVHV6w4ZJaW/nhh/M2GsByxRKeqd3IAW6IZH4uqHE1DukHKE8nACxe3xFd3Hub0gIoS0wGNcl8MGodXLWyGvw8loGyYEOtaJYa2Egyj+/AFkTrMsUnorMhkGPM41d6l3JpHo2YqKmSGHS+Uz+VGoMT+adoB5gknBmnJ5Id0vvuTT3Cty8OZtKRAFIVO1YWWqkNb/oVD1lxq/IciDn195GI8pdqC3MQmmSnxH44Z4kMvTVMSRHizBzWtbYpyBVW7mqZjkoJjgNIazVfhVZ+yx+q8ba4W3uRYSK3yvLcbaBJO+nep1yzcifExKsUIL33rra0l8RVoGCFsW5iQ2swnG3XKo2NmbNUNxJAHyj2WfFUIGG/6PusnGjcG8p0l4TMNKm6FPHvU4WJ4J+9odruQuL45I8OoZHlHfTtReFOPMyiAFsN/WuIFFKWd7nmcue3oSDPpr3vp7DTbAbzf6N8/1ocae9mTsiyM0pEWP4oty/R5+p3oazlO9KcnggmFPappDHzoLqEVo1dF/J/CeyrCGH4ndBFCqEBP5O8le87uX3Tv6GDsrPP7UgPThMfMcBB0gj4t2KlJtk2dEjF3ESdgoZmAYyACg3KWHNScNoJZKIygJH7DoIIPdhLgWoAWac+zEi97Ic3LoO/IwC2ux42j3b4nd4JVTGF+1qwlQqaNsVs0z1h//4jItxDGPs03Uyj2J1y8Q2V3vt5SbBgye6GdbzoVyo2XjkTzCYJ0NFhAQsl7y/cuIjL4kUx0ZDfJDKcZKUfe2WBN6c6aQvD6fdckU6G8b3D2NLgKXLuWW0VzFJCerMGTrdaANSVFmLOc+8Nw/BSIUtYupSUvPrbrEA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(376002)(346002)(39860400002)(396003)(451199015)(83380400001)(26005)(478600001)(8936002)(44832011)(41300700001)(5660300002)(2616005)(6512007)(6506007)(66556008)(6486002)(966005)(316002)(4326008)(66946007)(8676002)(186003)(66476007)(6636002)(4001150100001)(36756003)(86362001)(31696002)(2906002)(38100700002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1loMjhraWplUnJjdTl0aVI4T1d5ZmpObmNqbW1POHc5Rmc1M2ZYcFJpajJW?=
 =?utf-8?B?OTBmcnV5YjFuTUF5THNXMTVkWFNsS0FoT0pRaTVVTXA4eW15b0pDOUVIcGFB?=
 =?utf-8?B?WnN5b0FrUmlMT2dvUi9vN1ZLVHcvNFI1K3Vma3g3bFNJWThTdDkzL0JJcDZD?=
 =?utf-8?B?RjN3cmdJbmdTRGFVbGVRc3o1NEtqTCswQTRmb1AreXRBd0dJenllUDF1TVM4?=
 =?utf-8?B?Uk1KcS90NHQ3dFhPUDBXZHVxUjV3N3hnRkR0TzhhYXFiNjVaN21FNWpCbWpL?=
 =?utf-8?B?ckM0YjRrci9MNkR3SkFSbThIVFlNVGhMMnRKYzJUVGs3MFRzdnVpMmRxM3Rw?=
 =?utf-8?B?N0sxbHJOdElhT0liMG1ZcTA4THg5bERjaFJwNlBTNGFkd1RQRDEzVmZnU1Jn?=
 =?utf-8?B?YTV5czY0NldnNnprK0kzbldUaVlVNFhwaVk0aUF2V0w4bFVDMytIRE9LMkdz?=
 =?utf-8?B?a3oyRll4MzVyN3hzN05sNHN0MnNxZXA1c3VRVW1sOW4wcGVEdm5aMWNGK01k?=
 =?utf-8?B?ZDFmcnZ3WUZrbXRxWU4rdXRrcWRTWDZVcmliVDU3TEplOUNJbmRUc2lZRDly?=
 =?utf-8?B?Tzg0QmFyMW1LYjRXWjJGUXFBQXNXYWJoaGs4TndRRkVjZ1hLSldYSFF6QVFx?=
 =?utf-8?B?NVpoQVlkcWJJbHJkTU1wdzJsYjVGY1ZOMFQzVlIySGJiTVpTUittR1FlZStj?=
 =?utf-8?B?eFptc1pyTURwT3k5NFd0UVB1TThIbzd4R3A3VVNoNFNrVVdsTitHa0VaOXJC?=
 =?utf-8?B?aHBZVm1Db3N0STBzYkhrb0R2WXFlem5OMWJ2ZHdlMTlTQlFZSnl2OVlOWGg1?=
 =?utf-8?B?Q0RFWWY2YVBQZmt6Rk1BclpGdUNEZFdWaFVMWVEzeXdtdzdnV29BWmNsSVdx?=
 =?utf-8?B?dnZuT1JzdG9TVldRL0ZFUndoa1ZodEh3dDI4aThTd0YyTGg4Zlp3UlRQaEg5?=
 =?utf-8?B?ak9lM3AxN3RGUExKcU9MeEI1VkZ0bHgrZ1pMMlVLQmRFZVViT0Vqc1YzU2pr?=
 =?utf-8?B?TTNIa20yK3FtZjJTaGcyMkJaakV2L0ppcVQwTGcyY0M1THl6eXhJZi9qMFM1?=
 =?utf-8?B?WHQybmdzeEFCM1JkU1VEQzNqQVBIWGFKOVdjV1Z2SHYzMEtjc1RXNUpvY21s?=
 =?utf-8?B?SWwyMThLclRqenRjMWszWitLWVM5SDIwNmFLU0o5MlorY1J4cEowRHBKMmZK?=
 =?utf-8?B?cmFBNzYreU5lQjJZRkVib3FweDM1UlA4ZWpaVTlXa1RwNk5nZEF6UTMvK1RP?=
 =?utf-8?B?WWJYdTRscVZrMXc4Q3RqYmF4Nm1lY3ZUaUxNWkFESndsRnFnVzdaQWRpOUlK?=
 =?utf-8?B?RkRIVTdoQVRWdXdqL2VkYkc0eGxQdTJlZGM5OUdUVmg4Zzc0dGlaOEF5dUhZ?=
 =?utf-8?B?SFRuR3Y1dVdKclIxdG1jcG4xekxkUnlVNzN5VUlyNmFiby9JbGR5TlZlU09F?=
 =?utf-8?B?T0NpWUhyVklWbmlkMFB0KzZmSi83aXZEZG1LWHVyQ0lxd0hINlMySWtMeko1?=
 =?utf-8?B?bUI3Y1pkTjhmTnhWYjg4TlYra3dLcnBJdktLcmlCVndZM2NUZ0RrL0JobElQ?=
 =?utf-8?B?NXp5bWJaTU5UenJWcHhHeEVYeG84aHZDcjNlenhqVnpuN3BjTTNmSkZFdE1p?=
 =?utf-8?B?RzRwNTd3cFRRMC9ZT3hNZUZNOWxEWHllYjlOZm1GZG5ZK2VteldCRitDMEt6?=
 =?utf-8?B?ZFA4bS9Uby9IMG0vbTZ1djJmeEx2eTBKSERFV1NZblo0NmVNWUNPeG1lclF0?=
 =?utf-8?B?NVZIblFZY1E3d3FDRnNXcDFjZ0loWUxtUEZ2dHJuZnVSeURyczhLVFI2Umxv?=
 =?utf-8?B?RWNuaHhUUTZkOVcwMlhEdFpiN01SSHJjZ1pwZU9wY3ZNZDcwQ2UzS3lLRS9G?=
 =?utf-8?B?TkMvWFRzOGJleEloc1BZR1did2VET0ljNEhLV2xLZ25OUGpKNUFLNCt3Rm1B?=
 =?utf-8?B?TTU5eW8yNkx4L0dld1YwTGVJMldkLzFnQXcxYnRVemlCdVFLTklQaHZ2KzZ3?=
 =?utf-8?B?L2pzdjliRnVMaXZlNnp2ejlKUHUxc3J6M1dpbldaUE5VSmdtcTlwcnlhTDVU?=
 =?utf-8?B?bGYyMU5zRm5ZNlhMeDdnRnU0WTY5WDVhUkJGZ3hFZ0oxeW5WOHFIVFdHaWta?=
 =?utf-8?Q?Jl93yk0fZwQstHyD6m0U81O8p?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e82d64d-674b-486a-4509-08dab6c118e1
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 19:42:49.0737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BpWXOoOMyDkgSCVPvih0c2g6S+9MA9scGRTld22iivxfRKBu0DLB/AG7pBtB/2otL4Dty0N9q5DAWG/cnkcbyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6026
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
Cc: Xinhui.Pan@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2022-10-25 um 02:09 schrieb Yang Li:
> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_migrate.c:331 svm_migrate_copy_to_vram() warn: inconsistent indenting
>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2537
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

This patch doesn't apply to our amd-staging-drm-next, nor to the 
kernel.org master branch. Which branch is this against?

Thanks,
   Felix


> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> index 20d6b2578927..cddf259875c0 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -328,8 +328,7 @@ svm_migrate_copy_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
>   
>   		dst[i] = cursor.start + (j << PAGE_SHIFT);
>   		migrate->dst[i] = svm_migrate_addr_to_pfn(adev, dst[i]);
> -			svm_migrate_get_vram_page(&kfddev->pgmap, prange,
> -						  migrate->dst[i]);
> +		svm_migrate_get_vram_page(&kfddev->pgmap, prange, migrate->dst[i]);
>   		migrate->dst[i] = migrate_pfn(migrate->dst[i]);
>   
>   		spage = migrate_pfn_to_page(migrate->src[i]);
