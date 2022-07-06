Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF0D5685B2
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 12:36:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5EAB11367B;
	Wed,  6 Jul 2022 10:36:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2074.outbound.protection.outlook.com [40.107.102.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8999D11367D;
 Wed,  6 Jul 2022 10:36:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fMsUaI829gQeMa1invNuAj3XXIp2Cz1CrZzzcO35utG1sSBFpgdTjo/ka1jxcaEYP5QwVhJRK6mGcqzhx+nxCV0K0yGXpMR6jw9L2KxzH2WtKj6UU7BbFB8+CHVpLsVNqXJt/IyWGow/PF3+mI2gUKhE7oENqMc6/HdNU9ZtWQ/eGfGeetC4vnNPF4emjT/BOxqRo31LUJPg5zDP5EafZfIJi5ZeIVQz/NFObmVcmxAFDnrXt//KZkMK0REDdzE0PWJIqHvO5G826fHRwRqg5WAGd2pzAMX4ciV1meoZzQ3x97WXE1OXsmHyjEN6Z0MDZhbv3s3ioQdd2L8F1yxcgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DwFRBHYv8D3L4vGHneb9TWXglgd3NyiuV6MXaqkmNL8=;
 b=bQ4uHlJHUmJtvsZrPMWUXJMbRDYx6pevruy4DNczLmYka2dVGtKO/Nt3NV/tj5iHOPXnR0Oj7TUhVbZ8602srmEQohxMUs9qMwOz31Lq61ChiS3mbh8lM5s4iCyvz6P4bAXxY4NsrVw+nbC8xnODsnFflU/1iGXJ5Ie9tZsN0vpJKz1AZenoRecgAgYhg7VjPiqgPXpriiJ6/4RiahNCfeE4HQo9hrU+F9N5E0HoLvOa6V/e6V9Ibg8ShRFD6D9dLiZ+QOtPvmi3Kc2l9F/xv4o3H0g3Fxmii2PRBjUKbWROFifLE5D++ucA+8fWtriiYLIUOpMrrZzsnPmikhw+eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DwFRBHYv8D3L4vGHneb9TWXglgd3NyiuV6MXaqkmNL8=;
 b=Ri+6acXIJy7cE0Og2+lbW72j2bAQrwTDv8boz7v+KUoy4LZpU5L3shcNaOygtTeSqGqZ/3Vos+KxRLi4Mhedl4JeImK/7mxwn/rUTFN6Jo4snJap897slDTL2lcI7277SPo60RjN/8u2PxrfP3kDv2iS7xW7zmTE5XfEiZTjEic=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN6PR12MB1873.namprd12.prod.outlook.com (2603:10b6:404:102::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Wed, 6 Jul
 2022 10:36:48 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5417.016; Wed, 6 Jul 2022
 10:36:48 +0000
Message-ID: <47be7e87-b688-05a6-1297-8e26f5b84274@amd.com>
Date: Wed, 6 Jul 2022 12:36:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 1/3] drm/amdgpu: fix for coding style issues
Content-Language: en-US
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220706102851.2451164-1-Vijendar.Mukunda@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220706102851.2451164-1-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0080.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c696c93-8857-49ae-a222-08da5f3b6e11
X-MS-TrafficTypeDiagnostic: BN6PR12MB1873:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E7q49h7AnGlCMVNk47+EEo51h8swgVqZmH6Sl9tBfav9XuwFRsGxQH+SM70IfAaydcvuq1Tnbo3V0c++SGT3LkiJdhFKVw60oFMZiiE0L/3N/VZgHjVcPUjS34SWV+DlIGIUFBNkt5FsLjFg0/lb9cP+VkYvzOVmrZkaxUlRRZ0fEBCkL9bG5cZauHKa4zslIPIOjXfHcylygOQBD9sLRjOy7JBFCo7nPly4C5rdHoCo+S30v5fqFp+s+RFrop3Vwz1p3eaOq7OmYrN4TsWSRvaDb7Sy/rz9NmLkHMPn7i0Dlpg1TYJhHABVwHh1j9nPuoMyUuHVgo9YuQjyNlPcj3baIV4Pza/H4XH0aLdMhEbZ/fb664Evv9iH7msGPr8oYe7JqcPSlzXTLfZoyhkhYchfGbdfi/I4I4ESKjgqJmb4wJQa4HB8K0rRKu1K1+mAKxb0zm2AjaleFnBIoIKVvou1lT/NjXDIYHiuc5vwgPXPRdCswDIaOqoi+10Ev/yLygODbxMps2536HLmyB7uJqkwdoDJqg/uSENe6tjjXVHFaFiSy3g+1PkVO/yIxe5hY693+xKDcnqnlsQwTfDhZCAfF1xGuj6HuIOogofv4eNBBHQlsemDIy6Ee9aYpz2n0ZKwbOkLVBxIpNj20xnTWd9pg8fr62XVaWhOnBuK7ke0mxg0x1rCp5Uqgw6bVY99Lz+GCnd4PGxXJiQZGoV5SUInvXiBO7faECjG/FWFzYAVLC0eKBa/vJwj7wcGk+7RJUJlp0Weh5IqK+qu0p8IG4YoxdZd2gt0IJskEAxigKWmnrvXYfcpgcgtFoLulHaDQKcPCB7X32JwGeJGG4GbPuEe7uv6ZRBED3290qQ+NgA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(396003)(346002)(39860400002)(376002)(366004)(66476007)(4326008)(8676002)(66556008)(2616005)(66946007)(31686004)(186003)(38100700002)(6506007)(83380400001)(2906002)(36756003)(66574015)(6512007)(6486002)(54906003)(478600001)(6666004)(41300700001)(5660300002)(31696002)(86362001)(316002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnZTUjRjbzJaQnRRci96RVNvbFprOGdsSkQxUXRUcnV3cnBSdm9sRGtOU0kz?=
 =?utf-8?B?OFdHVmFhc2xpdEJyNHhTeW5oUnJQRllNQU9KSUlJQ2hEejBjSFNvOGpacGlt?=
 =?utf-8?B?cUkwUHlBS280S0wvWENMTUJuMnFRSmZ6bG1hTGtTT0ZlYzV5WWpGd1RJTUJY?=
 =?utf-8?B?czJ3Ti9pU3RGLzAvcEVZRnRrVytiTG9xRTBOUUgxL1hFZm1qa0VPbXNqZHdq?=
 =?utf-8?B?enZVaDlWL2NKVThoMnBGWkNqS3ZVRzY0UXRLanluN0RkaVBlUzVpSW95QlVO?=
 =?utf-8?B?dGN4eUhSMDh2TUhIL2d6MG5TUXVFWTlhdlZzRVFBVUEweFpwcFdYUGliVFB2?=
 =?utf-8?B?MkQ3Z3ZyL295ZEIrQ2NzZkI1THE5YVRCczdzWEZkT2ppVXlkTC9PUmdtOXFp?=
 =?utf-8?B?ZFdNZ1Ezb3hMYjRVOFY5ZXhNRTBUbU1EZVpoRWlCWlpYV3dzNTZLRStuSG9B?=
 =?utf-8?B?OXprbWJWR3BPNnIySDh1Yjc5SHNBYjZia3FGRkpYcG4vWlBkbjFjL2NCTWFQ?=
 =?utf-8?B?bkhFekpwWGhDODdxZnR5djAxK3hjdE8yOTFsN0VQNUluWHIwVWR5akRXdWl1?=
 =?utf-8?B?UVUzazZQS0MyZFo5dnhreFhsWE1NSTRwVWZicUZtVFp5WEp3dXFjUFRmY2pn?=
 =?utf-8?B?cUlvNW5Xb3FKSHlWekl1aVlWUkIvK1N6ZzAyTDRkcXAwTTZic05MdlQyY05E?=
 =?utf-8?B?Q2JBUndyb1dCYmFLVXRyWVZvL1BiZTQzNENiWThmUjQrbVhDRjNtVUEwbFVl?=
 =?utf-8?B?WTFQSy91OERBM1ZKb2ttZUF5MTlPSkNZaDAvZGlZZWJ0ZGlvQXc4Q3B0L1Jh?=
 =?utf-8?B?SHdZVXhPQmZMaStoRnBjZE9kWTkxOFZ0ZkNScHJBUUMrdzMzZERSdDZZZ1Ru?=
 =?utf-8?B?QXhlM2ZRZjJtQnpqOXhIRk5BRFlDRjZYb2l2MDlhSGs5Ukh5LytrRngxOWpo?=
 =?utf-8?B?QUZDbFY1M3JiQ0d1alkxZGh0Q2VOcjJKWjBRa2QwcXdxeE1GWGVrKy9wUXpF?=
 =?utf-8?B?dEJUWHR2VW8zWk1Hcy9Seldxamd0ajBCNTVjOXRiUDcwVEhrY1hvdWVIaHQv?=
 =?utf-8?B?cTRtaStnOHVJcXZ4eldqRjRQOE12djIzVUxYWFUxWjVJNitqY1U3VkFsVVU5?=
 =?utf-8?B?UnpSNlRZOHc1YW56ZGhhR3E2SXlxNStxaWVaa1hIY1paVHRSazI5WGFPcEZS?=
 =?utf-8?B?TGxHT0dGdUFZNFF0TFlaZy9GbS90OW1rakExWHhTaWV6RldmR0RmQ2lwZmVm?=
 =?utf-8?B?Z1pQZjh6ZHBEM0VoMHh0L3p4YWhEY3VabHNSTlhnc0lyTjFLaUR5SlVwNGtF?=
 =?utf-8?B?elZxbVdmbCtSNmtqa2ExcXlmU2YxRzVEUFBnN3hRL1ZmNzFiSUFlR3FmeElo?=
 =?utf-8?B?S3NSdU1oOHp0VUJzd1ZLTk0zY0d2UHdMNG9MWXY1KzU4TGNaeTBUc0J6MVVM?=
 =?utf-8?B?V01JYW9EWkh6L0o2U1lRNis3Rk9YQXcrZS9HUzJLVFpBNUsybXlIb0JCZ0V6?=
 =?utf-8?B?MTBxVDhNZzJ6cWp0MElmYjhvd1EzWk5kYmZzVm1GdGs2cDZnbkwxQ0w1TkNy?=
 =?utf-8?B?QmszRHFlZGhSZS8yK01IcEVxT09Wd2I4bHJrN3hlM05JVVAvd0E1MnpVQ2E5?=
 =?utf-8?B?di93djZWSFNOSDBNR2xHSWM2NE1JeGJDWDBaK1JCdURKTmhGb0E3RjRhbjk1?=
 =?utf-8?B?VFhZRVQ2aVFMVnJQZFUyeXphSWpYM3dMWFpUVWl5Zmw3eVA2SVZ6MTI0ek9p?=
 =?utf-8?B?dFk2amxZS2psQnAySnpFVHIxV1o2bTd6WW1GRkhSYVpRRzloSjFESGtZSWgv?=
 =?utf-8?B?cHpGNmRpT0VIam9ISFNlQnQ0Rmphd1ZFNjdFdnVOS3NaTUxOWXdZTW16TTFm?=
 =?utf-8?B?dVFPZVExU1ZCNHpCeG9hcTJjU0lKQUpMSE5SYmNhRFE2ZUZUZ2xEcGk2ZTFu?=
 =?utf-8?B?c1luM0Rsa25rdTU5V0RXRUgyRkh2UVFtbzlnaEJvNkJoSjh0d1daYlVDR0wv?=
 =?utf-8?B?ZEZOeHpMczNHZ3dkNXJ4NkFRdUtUZDJmZTVGRkVTK2UzRUtaLzJjNjBIQXB6?=
 =?utf-8?B?ZjhQc0RpTWV4eDl6bEVQOWlaVVNFdW5KQUxDSGFNcHVDdkNST2haZWtSeWJn?=
 =?utf-8?B?aVFaMjZnbnlzbGJWbEhDZlFOamxNaTljaVJBclRueXFvMDEzVWEyVTMyNkxH?=
 =?utf-8?Q?LV7hs4Z8t0NxEpvScghwz+1ZfRzGluU0soan78ml/VBU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c696c93-8857-49ae-a222-08da5f3b6e11
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 10:36:48.1954 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vvz2IljyAxAPZsX9V1sQxZ96UC3hyraSFjOl6cwZHaxBQMHgZdsn3OF72ETxz48R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1873
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
Cc: Sunil-kumar.Dommati@amd.com, David Airlie <airlied@linux.ie>,
 Basavaraj.Hiregoudar@amd.com, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>, Alexander.Deucher@amd.com,
 zhuning@everest-semi.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 06.07.22 um 12:28 schrieb Vijendar Mukunda:
> Fixed below checkpatch warnings and errors
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:131: CHECK: Comparison to NULL could be written "apd"
> drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:150: CHECK: Comparison to NULL could be written "apd"
> drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:196: CHECK: Prefer kernel type 'u64' over 'uint64_t'
> drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:224: CHECK: Please don't use multiple blank lines
> drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:226: CHECK: Comparison to NULL could be written "!adev->acp.acp_genpd"
> drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:233: CHECK: Please don't use multiple blank lines
> drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:239: CHECK: Alignment should match open parenthesis
> drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:241: CHECK: Comparison to NULL could be written "!adev->acp.acp_cell"
> drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:247: CHECK: Comparison to NULL could be written "!adev->acp.acp_res"
> drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:253: CHECK: Comparison to NULL could be written "!i2s_pdata"
> drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:350: CHECK: Alignment should match open parenthesis
> drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:550: ERROR: that open brace { should be on the previous line
>
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

>
> ---
> changes since v2:
>            - Removed Null check for apd structure
>            - Modified commit message
> changes since v1:
>             - Modified commit label as drm/amdgpu
>
>   drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c | 35 +++++++++----------------
>   1 file changed, 12 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
> index cc9c9f8b23b2..ceda19152c77 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
> @@ -128,16 +128,14 @@ static int acp_poweroff(struct generic_pm_domain *genpd)
>   	struct amdgpu_device *adev;
>   
>   	apd = container_of(genpd, struct acp_pm_domain, gpd);
> -	if (apd != NULL) {
> -		adev = apd->adev;
> +	adev = apd->adev;
>   	/* call smu to POWER GATE ACP block
>   	 * smu will
>   	 * 1. turn off the acp clock
>   	 * 2. power off the acp tiles
>   	 * 3. check and enter ulv state
>   	 */
> -		amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_ACP, true);
> -	}
> +	amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_ACP, true);
>   	return 0;
>   }
>   
> @@ -147,16 +145,14 @@ static int acp_poweron(struct generic_pm_domain *genpd)
>   	struct amdgpu_device *adev;
>   
>   	apd = container_of(genpd, struct acp_pm_domain, gpd);
> -	if (apd != NULL) {
> -		adev = apd->adev;
> +	adev = apd->adev;
>   	/* call smu to UNGATE ACP block
>   	 * smu will
>   	 * 1. exit ulv
>   	 * 2. turn on acp clock
>   	 * 3. power on acp tiles
>   	 */
> -		amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_ACP, false);
> -	}
> +	amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_ACP, false);
>   	return 0;
>   }
>   
> @@ -193,7 +189,7 @@ static int acp_genpd_remove_device(struct device *dev, void *data)
>   static int acp_hw_init(void *handle)
>   {
>   	int r;
> -	uint64_t acp_base;
> +	u64 acp_base;
>   	u32 val = 0;
>   	u32 count = 0;
>   	struct i2s_platform_data *i2s_pdata = NULL;
> @@ -220,37 +216,32 @@ static int acp_hw_init(void *handle)
>   		return -EINVAL;
>   
>   	acp_base = adev->rmmio_base;
> -
> -
>   	adev->acp.acp_genpd = kzalloc(sizeof(struct acp_pm_domain), GFP_KERNEL);
> -	if (adev->acp.acp_genpd == NULL)
> +	if (!adev->acp.acp_genpd)
>   		return -ENOMEM;
>   
>   	adev->acp.acp_genpd->gpd.name = "ACP_AUDIO";
>   	adev->acp.acp_genpd->gpd.power_off = acp_poweroff;
>   	adev->acp.acp_genpd->gpd.power_on = acp_poweron;
> -
> -
>   	adev->acp.acp_genpd->adev = adev;
>   
>   	pm_genpd_init(&adev->acp.acp_genpd->gpd, NULL, false);
>   
> -	adev->acp.acp_cell = kcalloc(ACP_DEVS, sizeof(struct mfd_cell),
> -							GFP_KERNEL);
> +	adev->acp.acp_cell = kcalloc(ACP_DEVS, sizeof(struct mfd_cell), GFP_KERNEL);
>   
> -	if (adev->acp.acp_cell == NULL) {
> +	if (!adev->acp.acp_cell) {
>   		r = -ENOMEM;
>   		goto failure;
>   	}
>   
>   	adev->acp.acp_res = kcalloc(5, sizeof(struct resource), GFP_KERNEL);
> -	if (adev->acp.acp_res == NULL) {
> +	if (!adev->acp.acp_res) {
>   		r = -ENOMEM;
>   		goto failure;
>   	}
>   
>   	i2s_pdata = kcalloc(3, sizeof(struct i2s_platform_data), GFP_KERNEL);
> -	if (i2s_pdata == NULL) {
> +	if (!i2s_pdata) {
>   		r = -ENOMEM;
>   		goto failure;
>   	}
> @@ -346,8 +337,7 @@ static int acp_hw_init(void *handle)
>   	adev->acp.acp_cell[3].platform_data = &i2s_pdata[2];
>   	adev->acp.acp_cell[3].pdata_size = sizeof(struct i2s_platform_data);
>   
> -	r = mfd_add_hotplug_devices(adev->acp.parent, adev->acp.acp_cell,
> -								ACP_DEVS);
> +	r = mfd_add_hotplug_devices(adev->acp.parent, adev->acp.acp_cell, ACP_DEVS);
>   	if (r)
>   		goto failure;
>   
> @@ -546,8 +536,7 @@ static const struct amd_ip_funcs acp_ip_funcs = {
>   	.set_powergating_state = acp_set_powergating_state,
>   };
>   
> -const struct amdgpu_ip_block_version acp_ip_block =
> -{
> +const struct amdgpu_ip_block_version acp_ip_block = {
>   	.type = AMD_IP_BLOCK_TYPE_ACP,
>   	.major = 2,
>   	.minor = 2,

