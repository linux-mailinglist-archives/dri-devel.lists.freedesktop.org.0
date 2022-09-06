Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 131795AEA5E
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 15:46:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0486D10E674;
	Tue,  6 Sep 2022 13:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2054.outbound.protection.outlook.com [40.107.223.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5DD010E666;
 Tue,  6 Sep 2022 13:46:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c0jFjG1NZrnQqpWN50TYPZcXXw3nmg7kq2n4a2H7ACITUtcLJEebUyU+10ZCN7ccp6TeROwWPWUiKY8CIRjNI/H0+xM3Dq64zQLpQEQ2fl5G/UdEcASCOvAlp0tPSH2JNmlfK4qnKeabFFX0kzoqspoUgrag+tOK/rz1WJl0sIWjhUIvNt9lwOiF2+tj1MQx79Pu7+jZjFQ5Irt6nobMe47NMsrLS0bEyQ8HR9gJh1Ezk/UKZ2bFUGDyzrATOpKo39LSGX+TEmhOBStqL1jSIe6LzNUYTvyukl3DVJIJLYCIlgkGOF3TqQu34SkIXPIm/ow8v1ii6KgACfmjfcz1Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oVFOeuISb2CQY5iB3SrM+8Dmpa0eXVBFwLNF4T7ts+s=;
 b=JGwV4BNPcZEIByA33SUSWP8gStRC9a3qubE6vYIh8ERlqWCVdnOB3aHhrWHvgHgnF+k0k+HMFgf6SygVBo7w76fASXt3FUXDcrgVmqxqWrOUuMSHifCK5k3Nsrws/KZzcpDQDRS/0DZcWlUX4ZK1fDIzw1OnjKGHkJCyYwPQUvVgc9bKXbjS3EGLgtnlcEAUlZx+UQZOuH/Wx03D3R6jE7gcsg+eohhsOaVPeSwkekEZYqdzkKMCIP/hVG8Sg37RV01NM43tr5fQBGIVHRO2Fo6529PLcn7KqugAgSIjI8tdvFVq1rJld94mWMqaUBvKZ4H+2HqyfsZe1KzkfZjCJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oVFOeuISb2CQY5iB3SrM+8Dmpa0eXVBFwLNF4T7ts+s=;
 b=0tW/w+ZWxWQ+E0p8rqP4qH18aX+I1t0vn/+PQutiVzvZfdCEZBym4cz8AEAhJNG47MnMVSq8I1Rekg9hQ4khn8v9gxHNPdMEsj0V8k8/w8hKiJXQO/ClyK28nn3+cc5eokFEE7ZOcandasN12NovcLOTh1DT8Iaf6LD0WhKaAH4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by CY5PR12MB6226.namprd12.prod.outlook.com (2603:10b6:930:22::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Tue, 6 Sep
 2022 13:46:12 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::406d:afb5:d2d7:8115]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::406d:afb5:d2d7:8115%6]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 13:46:12 +0000
Message-ID: <18083c05-7636-2155-610b-2d1347f8585f@amd.com>
Date: Tue, 6 Sep 2022 09:46:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/amdgpu: cleanup coding style in amdgpu_amdkfd_gpuvm.c
Content-Language: en-US
To: Jingyu Wang <jingyuwang_vip@163.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch
References: <20220905083825.23429-1-jingyuwang_vip@163.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20220905083825.23429-1-jingyuwang_vip@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT2PR01CA0007.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::12) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee4e760e-af8b-49a2-e6ad-08da900e2937
X-MS-TrafficTypeDiagnostic: CY5PR12MB6226:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HtdxUu3YFPkz5bnVvsFI5CqvQXsfs8+MTOOASW3nYnuOY+qS3Xab7OfWH5IzIVcAqKZ60iccxrPp47ykPU+6006MN8I0nCXkOCko4uZrD9IDtVrnUMh9kv12AV+NBrwCsU2chavrDxI3ktpd6Jq3xIq1cZa4zxDy73x5/X9QNtoFQb5HHkPiKYzD0hRQhPM1GVhVdTDHFglmmM510MVWfCJ+AwLgMlWJuNf/WynVK59AdhMIM3N2oQfOBbUGVGTVYqvx1y838z8gxtQNWJYflt3uu60nOiIRZZFgUFVERZpK3XTv5oJG0SuseuaiEO5F5oOUtncJFlDVRv9xzVJXvmghjYpCgeUHp0AwAeLfgpB7yltceRs2zKRMlly7ShbeM1lZqj6fbkOBUZXu1MciqsY73LQmlDME43OF6ggKg80NDD9SFqcK3ZdYwrQKd9pXLEChZvwCGAs8jrM69e1ix8sQC7YwhwhsPKm6dCofiRWQHaM9JQryn7bbRug7Eeibro3ouUyWAgRARPCnkK/PY6qvqqmfBdpvm/Gn7vcDNFFr5X2usKLHaWZ6ee2kDYU+Hkg5CtcaFSXpVzO5npBS7L1L+xYyWXAryT/WlPenpifGY0T0F0s9YCfltfBpjdIqqyKbIi08EOYxCu4uoeXsv4TdsBCyOvfwfShAqa/4BkIDmqdmrwnXswGwB8blefpCGh02E9PQ6QoOixZ4PDJnrnxT8zjAUd550udyBDl+GDytW38ZoOI8l1VUlDckh8fK6x4vT2wp5iCAXf+qz2hObYq3rneUuRUc6hTiYkrmAWY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(136003)(396003)(366004)(346002)(376002)(478600001)(6506007)(8936002)(6512007)(26005)(86362001)(31696002)(41300700001)(6486002)(38100700002)(186003)(2616005)(4326008)(2906002)(31686004)(8676002)(83380400001)(36756003)(316002)(66476007)(66556008)(66946007)(5660300002)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjYvaWRYbEFSQWFTTlJFeFJGOUdzMmtwRkF0YmU3U3BPY1czdlpER016UUtk?=
 =?utf-8?B?WnpEWkxRcGRKL3NCTWN4aXREeXI3VkdYREpaLzlZZmczRHQ3YjFOQlRkdkJQ?=
 =?utf-8?B?UXJTN2ZaUWFPUm1qSHp2dzBJQ0JrY1hkbVpEbzBTbDRaQ2lCMWc0RElOUWYz?=
 =?utf-8?B?SFlDdGEyaFUrM1ZUYjZ4YW5oelhhVTJMR3c1dGdIU0xnRzRNcTBFZDZZdVB6?=
 =?utf-8?B?OFJaVHBmb3RIUno2ZFhMK1RFU0p2SXpzaGZJRmNOVnRPVitZd2pEOWFhUWpm?=
 =?utf-8?B?elREWktxSE55L0VQL2dPK081TVJRTk4xNlcwbVRPRDNMckV5bHJUWEtDMVJ5?=
 =?utf-8?B?U3MrQkgzUUk5NDNDaDgzZ3RnR1JWWktCTGV4YUQ3ZUVkYi9nQkJQQTBqU09s?=
 =?utf-8?B?WU5YaGRsWWpuYmxiNDE1dUZMaXdTRmVkZXRUaUxCQnNCcmxRLzkwYlhjaEVV?=
 =?utf-8?B?d1dvR01PakEyNjBrdFdGT1JNQ1NBa0o3cGx6NXRpWTFubWtFUEIxRG9McHVj?=
 =?utf-8?B?czQvUCtuaTF0b1B5YUIzYmsxT2hFMWRhcWxxUHFWbWZUcmVhWkJoS2hCdVQ5?=
 =?utf-8?B?N0NWV1RVRGhnS2UyNDNqTGZYVlJvRHhOZm1Nb2prV0JXREFQdlU5ajBWS1NF?=
 =?utf-8?B?ME5yN2ZXTFZaRnFhZktqcVp0VEw1eUVEOTBZYjhVYXhlMTRWcHlHWDlJNjlE?=
 =?utf-8?B?WlR2RW42K2pIbzNvb3RnS0kzSzRVSW56NmdpQldwaWZGRHFjQ0d5L1RJczZY?=
 =?utf-8?B?VGNwUGNlSVZIY0lPMGRFVkZPTnRYWFJDbDNXcUNrS3B2QkhMaUJPRnFTazc1?=
 =?utf-8?B?OC80M01uSDlubTVwajdkM1ZlUi9WcHQ4bFZpWGhtRWhMYklYQU80ckNhNXdT?=
 =?utf-8?B?SzcyOUFkMXI4S3g3VUtrUG45OVpVRE11dnVBVW4wZlY5K3VyY2t4QTByT0ZP?=
 =?utf-8?B?VUVRZ29GSzFROVRSNUZNamlOUStSd0p5OWxiUXk2WVpWUG9zeGVQU29qeEJ1?=
 =?utf-8?B?YzBRbURpUytRNWlCNEZZMGlrZTZTV0JyZlFDTm8xUDRwSTVtb3ptYmY4b0pY?=
 =?utf-8?B?OGNTak1PSEUySDVqOU5qTURrSndxNjAwZ0wwL29IZVR0MG5Kdzd0VzBwbURn?=
 =?utf-8?B?bVBYdDgxS1dlT2F1N3Jtbm9rdXBQSTZOSjRrT1hLNy9EQ2FOWWJBdm9DcVdu?=
 =?utf-8?B?bTJ5dUpTdmJMeCtkVW1oRVRLREJ2RE82UFBUeFhYQnR5Y1UyM3BMUVljTzIr?=
 =?utf-8?B?K2lXS2QyY3dmL1JXWTVIc2g5SU5FWXVnKzdpeCtVNGtlc1BJMVhmV3RtZkNN?=
 =?utf-8?B?bnVnS0N6d3ZpT05pRFpVTTZIVE5IMlJZOUx0QUQ0QjhlOWVkS0NiZC80Tjhh?=
 =?utf-8?B?MFVyM0JVaXIzbnB1ckF0WDM0SHNRNUR5NlRpNEw4cU5LQ1hRdFp2b3NETXFr?=
 =?utf-8?B?cVRIOGZvVE9iSWlydzR5Y1RvNFBHMnFJWkErZVhQbTJHQllBakgxQUk5SzV1?=
 =?utf-8?B?R2xwK21Bd2ZrS3ZjTkxSZzF0WDVJck9aVUowaE0rd000b2QvR2taN2ZGNVQz?=
 =?utf-8?B?eFhmSU1WQ29xczZCODRCaFREcVJmV25KbHlMTDJGMElKOEk3SlBGekQ3bThU?=
 =?utf-8?B?akJ1WVkxcHdwenNnM2szMTVxQktGcDZiVFZad3k3ZmhBQ2EwWm5XRVNIOVgy?=
 =?utf-8?B?YzhqeGhEQm5tYS9kSE41T2ZYWlZhT01jR0VsZWNIZWZlZHUreVk2UjNhRmwz?=
 =?utf-8?B?UGZjNzl2ODVWV0E0VEwwRWRPeG5mOHlyL0g5eXZaSkppcU1TN2lnSzR6L2o1?=
 =?utf-8?B?a1JpanRGQllFRGRYaUlnTEJIOHVGcExTdGQxcHlhd0dOSXNFMWlGOWx0eXdN?=
 =?utf-8?B?dk9XMVFEUnFGelJ4OUNoNXVBa1BCSzltZThCbXFuNGFKK0RPdlRWNlFqd05a?=
 =?utf-8?B?aXg5RFVYWkFRSUhCUVV2UytXdjBiVnFXMHdvV3BFRFBEN3R2MkpaMnhYMXF5?=
 =?utf-8?B?L0I0YkNNZGppSXpTSUpsUGpPK0FteDViWkdRemUzTDNLMWFJN3pCQitIZHFk?=
 =?utf-8?B?ZUtyYXVHMWFsc0s1TWdKWW5aS1VVR3hDMFhQRlhxMXhzdk9WODNRUjQwU1Fs?=
 =?utf-8?Q?VHl+HD76eGcKRWeS0S5UrxCKL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee4e760e-af8b-49a2-e6ad-08da900e2937
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 13:46:12.3848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FFwyCn+82YE+P/EKE0HtCA06B1feyWb4LqI+w4OpX8nCrJmULIuFiGooWpGGTW6QoPEtTSj0A8P63Zh5J9fzIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6226
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


Am 2022-09-05 um 04:38 schrieb Jingyu Wang:
> Fix everything checkpatch.pl complained about in amdgpu_amdkfd_gpuvm.c
>
> Signed-off-by: Jingyu Wang <jingyuwang_vip@163.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index cbd593f7d553..eff596c60c89 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: MIT

I'm not sure if this is correct. We've used "GPL-2.0 OR MIT" in KFD. In 
amdgpu there is currently a mix of licenses. Alex, do you want to make a 
call on a consistent one to use in amdgpu?

Other than that, this patch is

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


>   /*
>    * Copyright 2014-2018 Advanced Micro Devices, Inc.
>    *
> @@ -1612,6 +1613,7 @@ size_t amdgpu_amdkfd_get_available_memory(struct amdgpu_device *adev)
>   	uint64_t reserved_for_pt =
>   		ESTIMATE_PT_SIZE(amdgpu_amdkfd_total_mem_size);
>   	size_t available;
> +
>   	spin_lock(&kfd_mem_limit.mem_limit_lock);
>   	available = adev->gmc.real_vram_size
>   		- adev->kfd.vram_used_aligned
> @@ -2216,7 +2218,7 @@ int amdgpu_amdkfd_gpuvm_get_vm_fault_info(struct amdgpu_device *adev,
>   {
>   	if (atomic_read(&adev->gmc.vm_fault_info_updated) == 1) {
>   		*mem = *adev->gmc.vm_fault_info;
> -		mb();
> +		mb(); /* make sure read happened */
>   		atomic_set(&adev->gmc.vm_fault_info_updated, 0);
>   	}
>   	return 0;
>
> base-commit: e47eb90a0a9ae20b82635b9b99a8d0979b757ad8
