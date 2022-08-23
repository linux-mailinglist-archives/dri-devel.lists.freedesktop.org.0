Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8999759D0E8
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 08:00:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEAD7AE952;
	Tue, 23 Aug 2022 06:00:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2057.outbound.protection.outlook.com [40.107.95.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C1CAE92E
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 05:59:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cQ9wjMrabvWcE0o/CmoJHntwM9harSXcrl1L8pvQknt1vr8a219kfzPpdBAekQR9fA0QfmMiii7YkvTox5j2zO6IDA95WK4cBMlo1VfSd2Gg7Fhn82AQLaOdmdqoE3021YUoplObTSACwrqSJIwIIRnyJat7g/wbYjgjOZpNezoEkQlgP03GtvQ3lEItrYH+Y2+Pkp6J0/yCrNsew1MhL3XqdRPRb6BGZz0k0Gdj5VGOq+UJ3mj/490SH069+wCMOdsRqytDlFJTW5AIGMcxZLy6pNokc+qoMNQe0V5OiMqBEl73BETABUfhLQmDJuTp+57VJ+kB11rMCQfkKJZYvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rNY8cx3d3popkl3XeApsMW4me4N7keMu8agr3L5b04=;
 b=XFzUgSpojKgZXJpfBCEF2bupbXx3f74HbQGyd+MwNwGz5vDBRuat79qIOnoJUA04n5FU2uWH3ZhHLu9nnSpEqhIrCuVbwCME5lnoEOSWY8i0i8fWqm2l5S3PgPSVtFz/DBSDab5DhM/SzH1gOoJ/7gWs+f/vR2W96+YibKPEfOIr5/XTk2ENMOvzK4YBaZdHJ4eVY1lsg3OxJnWuwSAY7EhH+EQ9BphgjNI14mPZKMGubOZekDU6gssDTuy+wHkuwjYS4bhWrUIwKsUrHcAEmBXriA1bvfjO59TVazagCL+atCyVAVWI6hTLeXscYeKx02dOsKUh2NQq+dOi5j92TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rNY8cx3d3popkl3XeApsMW4me4N7keMu8agr3L5b04=;
 b=H0FZEbe6GoRT3gQxu3LR7Wz2Zd3tp+3x40hYFlwuTUvBsb+8D3iHVP3OOIJnSeAInVIbz+Gq855OS8QZt2aD/5fTx02klQ0Yla3zQM6x0JhUuX+Qwpi2RnzE4q9xmPqmkzskhFTdK3TikVMrk4bg3no5yGMCauQ1YzbahoJzCTM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BYAPR12MB3205.namprd12.prod.outlook.com (2603:10b6:a03:134::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.20; Tue, 23 Aug
 2022 05:59:46 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5546.022; Tue, 23 Aug 2022
 05:59:46 +0000
Message-ID: <3112082f-9950-d6d2-34b8-0cf2a044f28b@amd.com>
Date: Tue, 23 Aug 2022 07:59:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm: Move radeon and amdgpu Kconfig options into their
 directories
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20220823000111.9765-1-afd@ti.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220823000111.9765-1-afd@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0766.eurprd06.prod.outlook.com
 (2603:10a6:20b:484::22) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99b75511-64aa-4019-a3c4-08da84ccae88
X-MS-TrafficTypeDiagnostic: BYAPR12MB3205:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZuKGHHsAnDVPmBdpvPrioPIWAGr14AxcpGfApjsaRjNvpr4LgMybiOCe9xZSbfrQbvumu+JTZttz+sJBcGPDviX6+s1ogPfBZ4JDL9DmJ3znH27gxVPJh0QI4tRjyJIE2zuZg6uH5g7eMUOZmAly2HkgDnLqyNwnutBfbCpSHv+F773Npu+6n/mBhfO8QHvDxlfXhYvSyMtaxMSHFcGWhZyk1K5csDawT5ShcL/S10/O1WuyQntOpj8TtkH3A20WlBIik0CCrVRBweIMgsVC1nevs8TRu/wr5wcmVdmSx8ERW6N1+nVUaNw6cQNWA8OPrDQHGMzhOKjj9ifNEJEgftje/nKfFsy2rKEHn6d8gc+8L8XES8vAgYiAI3lNhe8IgYEVYORtzsyCNtQ6ZxeODhnH+Ixlg3ZuOIgMnR8tTWnuE5EV3VCLuJ01ylE8tN57fp2sNqnfcPLxW9v1udMI31nWMp5nW5XNnqu5iAc56ltuOd3soXZaHYRC1G7PguKxNEj/SVyUCLejcABxcNgEgDHF9kasG1wMy4uzcYiprIbT/KapaVa5SYv9Mwf6p3SVjHMoFyzdHJVeiMQY6lhUzK994SqUEsHP9K6thWH+fioXfTft9qwDT6aHItmDk9SfKXJePymqRRqarsKKA9eZz0aMjONyhc27wm6HCPP6sNT/EDqBNQdpFexg9/TkEG7Z4vgY0KpynJNmHFrKYvzsXX5y4XKj5R1WQ3SSP9RQ8XrRIMOnWAN1FqpppfTkfmFBYf0fN9WU5Bw9/OtUaHO2lqQWFcSkmmaRkeruOEy60PY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(366004)(136003)(376002)(39860400002)(186003)(2616005)(31696002)(83380400001)(38100700002)(316002)(66946007)(66476007)(66556008)(8676002)(110136005)(31686004)(2906002)(86362001)(36756003)(5660300002)(8936002)(6486002)(478600001)(26005)(41300700001)(6666004)(6512007)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjNhOTA2dWNuUmhMbTNXWVI4LzZoUDR4bkhITWR4ZFBXZ1pZYVBlUVhJd09N?=
 =?utf-8?B?cURVZkFhUXlNRWhRMGMza0VmV1Q3NDlZak1hZmhGMW5aU1JZcnVpZWxzUThi?=
 =?utf-8?B?NElxdXdHbWRUcEp2a1FSSXNCUlBNZG9rU3BQZTBwMUVPY1ZNMFNDbVZ0MHpC?=
 =?utf-8?B?Zk9iUlFOaUFGQUcrcFdTdWFWV1I1Uy9ITWF0NWgxdlRNUndRQzdiVjh0YXlF?=
 =?utf-8?B?bkxKQkxkejlQYnUyc3M1U0UyWm9hQm41bTNXNDJjaTVPTnVVZnZBNWtzMTdM?=
 =?utf-8?B?aTBZVnZDNTJYaERkYVVJM1ZBZ0hnemJYNDljemxYOG1YM0NYS1BacG9vekRD?=
 =?utf-8?B?VWUyRVZ6blF2RWtjeUx3cXdQNEppUjBuY3o4YzFtZ1EyejNEREhDMk9xYXpZ?=
 =?utf-8?B?cjBheUR4dUVQbFI5VUNmYkJqZWZBRituVU9iWUsybXhmcllmblVzYUZUdElD?=
 =?utf-8?B?dWN6QUpWclBObVBqL1g5bWhpd003Y0hoN2ZpeUZDTXhxbTMrQkU5QUlBS05Z?=
 =?utf-8?B?QTNFUG9TcFI1bjd3dHpFbzVLMlZJV0hXSVBrUlQ2RHVPQklmNDhsVWgrSE1Q?=
 =?utf-8?B?N1VYS21CdFl3KzJ0Y2pzQ3NUMm1DWElFNU9HRi9ydWRXNGVzajdhekFIZHFw?=
 =?utf-8?B?Vyt2b2t5ZFFrZ24ycUNYVnBIQUh5U0laSVNXT2Zmc2UzdU1ueUkrSG1ic1pz?=
 =?utf-8?B?ekdiVUdUNzcxUVhWeVIrVzAyQXorMm1BNFNVTytmRzQzK0NVaGxrOXVXMVVx?=
 =?utf-8?B?MXRQTlNHVGV0MkphQmJRL2pJYzNKTUh3cjRPVlpPOEhJMFc5WlZ3R3RvejFp?=
 =?utf-8?B?NEY1T3UxNXhUUWwrWnpCN1lFTkduWTZCKy9uMTJGT2gzbTdONWlFWmFkdXZQ?=
 =?utf-8?B?OTZkeDhuRVI4TFk4eHF5TUlyVjNHL3EvVG1aSzJGS3oweUZuaTBBNmJxTHNG?=
 =?utf-8?B?Z1E5dVVlaHU2ckhnZkFUMEJhdlJXeDVtSmwzYnAvTHBjc0pJaEJiaHduZUFS?=
 =?utf-8?B?aWw3cTBRYng5aUZtM3B5T1p0ak1USlk1cTRUUm1vaTVEQVY1MjFYYlpKUDU1?=
 =?utf-8?B?RXVkVVR5TUMyTGVzZzRvS09vRWYwcFk5RXBVN01rc1lHMGlHSkI5QmFyRWZ0?=
 =?utf-8?B?NTVoWVRTTU5SZW9nLzV5ZzdpU3Vsc2dhaGJPZ3EwUTV1OWtpMFBpT1VQek53?=
 =?utf-8?B?WGFhNWJSbnhnVDNta2l5ajFuV0M5bEVqL1FBVGJYWlRlaFFIWE9RV0hueS9N?=
 =?utf-8?B?NndLcHhSdy95Z0gxQ2NlaXVTTGd2bnBIdGw3dkg3djhkVTRhZGJIV0c0MSsz?=
 =?utf-8?B?UldrNmxTYU85MU9oaEljVGNEVFFsc1dEVk9sVmtlRThMU2p4bUNwYm5YeHZJ?=
 =?utf-8?B?SnRUTkk1UldJUGp4OVlQNEN5b3ZWM3dHZGhLZjBZRG5DbC9DdGtlZlAvUGlT?=
 =?utf-8?B?Q3FVL09iQ3B5OFQ3dHRXMVhLK1ZxcTJ4N3FqaWdZL0FlY1o4QXROVU9UWlZw?=
 =?utf-8?B?Q29sVXJQd0RXanI5SjhpY3lJU3RVdTZzMjJCRlZoaXFvc20yL1VrT1dHRERn?=
 =?utf-8?B?dDFWUUlQTWdNMVRhRVBFajhub1FEZDROV05hU3A1eTVmR0U1TUJPVzd3YnFD?=
 =?utf-8?B?dkdDdjFzMVQ5ZVg1ZkowaFY4Y3FJNnVDREtCdG1oM1BCMlBCTTludkYrSmFu?=
 =?utf-8?B?RVVlcEhSVGJ1Y09LMGNtQnJ4MDN5WXd2KzJDaEZhaStGTHlMRStUb3BWSE4w?=
 =?utf-8?B?dzBFU3ZYOGF0L3BxSzAwV29lazdoSGJXZDZFVHJBTXVUS3ZyN3VYczA2czhT?=
 =?utf-8?B?VmtEOW94TDVJVktiaTRwMlcyMkorN2RjRGllNnd4R2tQUkZUSzJJWEIrbG5p?=
 =?utf-8?B?S3V0RDFWNkRNNi8yQ0FuYjhrZ3ZuRzBTZzJMTGd0cTJwN3VNKzZlaEJhUlBD?=
 =?utf-8?B?RE1tZzlYejBJRkYrU1pudnpoNG02RlJGWFl2cGh3dkN4MlFBcnUya3FEWmhR?=
 =?utf-8?B?UzBxUFFFNFkzMTJnUStDaXBhaktiY0R6aDBweFJxdE5WVVVVSUF6ZVp6VTB2?=
 =?utf-8?B?clFxbUJsakRZZ2t6QUtKYVYzSkRndDB4UkpyUTVnV2c2MWp0V1M4RXFpZEhT?=
 =?utf-8?Q?wfkhfiH+pLChmkhJRqpoHX+sX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99b75511-64aa-4019-a3c4-08da84ccae88
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 05:59:46.4762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dOvNrOWTWZ8Onp6F2KnBuCVF9rO0qYsJ9JGN/uHAO1aFI9z3LWknt/qAwIbrsqjL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3205
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.08.22 um 02:01 schrieb Andrew Davis:
> Most Kconfig options to enable a driver are in the Kconfig file
> inside the relevant directory, move these two to the same.
>
> Signed-off-by: Andrew Davis <afd@ti.com>

With the tab vs. spaces pointed out by Randy fixed the patch is 
Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/Kconfig            | 42 ------------------------------
>   drivers/gpu/drm/amd/amdgpu/Kconfig | 22 ++++++++++++++++
>   drivers/gpu/drm/radeon/Kconfig     | 22 ++++++++++++++++
>   3 files changed, 44 insertions(+), 42 deletions(-)
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 6c2256e8474b..24fa9ccd92a4 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -234,50 +234,8 @@ source "drivers/gpu/drm/i2c/Kconfig"
>   
>   source "drivers/gpu/drm/arm/Kconfig"
>   
> -config DRM_RADEON
> -	tristate "ATI Radeon"
> -	depends on DRM && PCI && MMU
> -	depends on AGP || !AGP
> -	select FW_LOADER
> -	select DRM_DISPLAY_DP_HELPER
> -	select DRM_DISPLAY_HELPER
> -        select DRM_KMS_HELPER
> -        select DRM_TTM
> -	select DRM_TTM_HELPER
> -	select POWER_SUPPLY
> -	select HWMON
> -	select BACKLIGHT_CLASS_DEVICE
> -	select INTERVAL_TREE
> -	help
> -	  Choose this option if you have an ATI Radeon graphics card.  There
> -	  are both PCI and AGP versions.  You don't need to choose this to
> -	  run the Radeon in plain VGA mode.
> -
> -	  If M is selected, the module will be called radeon.
> -
>   source "drivers/gpu/drm/radeon/Kconfig"
>   
> -config DRM_AMDGPU
> -	tristate "AMD GPU"
> -	depends on DRM && PCI && MMU
> -	select FW_LOADER
> -	select DRM_DISPLAY_DP_HELPER
> -	select DRM_DISPLAY_HDMI_HELPER
> -	select DRM_DISPLAY_HELPER
> -	select DRM_KMS_HELPER
> -	select DRM_SCHED
> -	select DRM_TTM
> -	select DRM_TTM_HELPER
> -	select POWER_SUPPLY
> -	select HWMON
> -	select BACKLIGHT_CLASS_DEVICE
> -	select INTERVAL_TREE
> -	select DRM_BUDDY
> -	help
> -	  Choose this option if you have a recent AMD Radeon graphics card.
> -
> -	  If M is selected, the module will be called amdgpu.
> -
>   source "drivers/gpu/drm/amd/amdgpu/Kconfig"
>   
>   source "drivers/gpu/drm/nouveau/Kconfig"
> diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amdgpu/Kconfig
> index 7777d55275de..36b1206124cf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/Kconfig
> +++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
> @@ -1,4 +1,26 @@
>   # SPDX-License-Identifier: MIT
> +
> +config DRM_AMDGPU
> +	tristate "AMD GPU"
> +	depends on DRM && PCI && MMU
> +	select FW_LOADER
> +	select DRM_DISPLAY_DP_HELPER
> +	select DRM_DISPLAY_HDMI_HELPER
> +	select DRM_DISPLAY_HELPER
> +	select DRM_KMS_HELPER
> +	select DRM_SCHED
> +	select DRM_TTM
> +	select DRM_TTM_HELPER
> +	select POWER_SUPPLY
> +	select HWMON
> +	select BACKLIGHT_CLASS_DEVICE
> +	select INTERVAL_TREE
> +	select DRM_BUDDY
> +	help
> +	  Choose this option if you have a recent AMD Radeon graphics card.
> +
> +	  If M is selected, the module will be called amdgpu.
> +
>   config DRM_AMDGPU_SI
>   	bool "Enable amdgpu support for SI parts"
>   	depends on DRM_AMDGPU
> diff --git a/drivers/gpu/drm/radeon/Kconfig b/drivers/gpu/drm/radeon/Kconfig
> index 52819e7f1fca..3248d12c562d 100644
> --- a/drivers/gpu/drm/radeon/Kconfig
> +++ b/drivers/gpu/drm/radeon/Kconfig
> @@ -1,4 +1,26 @@
>   # SPDX-License-Identifier: MIT
> +
> +config DRM_RADEON
> +	tristate "ATI Radeon"
> +	depends on DRM && PCI && MMU
> +	depends on AGP || !AGP
> +	select FW_LOADER
> +	select DRM_DISPLAY_DP_HELPER
> +	select DRM_DISPLAY_HELPER
> +        select DRM_KMS_HELPER
> +        select DRM_TTM
> +	select DRM_TTM_HELPER
> +	select POWER_SUPPLY
> +	select HWMON
> +	select BACKLIGHT_CLASS_DEVICE
> +	select INTERVAL_TREE
> +	help
> +	  Choose this option if you have an ATI Radeon graphics card.  There
> +	  are both PCI and AGP versions.  You don't need to choose this to
> +	  run the Radeon in plain VGA mode.
> +
> +	  If M is selected, the module will be called radeon.
> +
>   config DRM_RADEON_USERPTR
>   	bool "Always enable userptr support"
>   	depends on DRM_RADEON

