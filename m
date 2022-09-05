Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFA85ACA53
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 08:08:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 803C510E157;
	Mon,  5 Sep 2022 06:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2042.outbound.protection.outlook.com [40.107.244.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93EDD10E155;
 Mon,  5 Sep 2022 06:08:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H7QAbuLZv2ko6VGXQe79zRREXKskWd+F2LV5AS2z0RP/KvNlSxWb3ICmOc3a5jiezGcrN7GoPpUB8lSw8EiXJZZTsmpCrqgPDnW51VVAQBNgYIpVtwTXQ+TYKEunTXwEPXbEK+9TLz+/lZ/XLxbPnkgnWWfH42Osdgsju4Dl3kVZLtxgjfJlzI8AOzceK0H3EMLvCXheyMNqPpUVKp/x/IEukqwZXLHogWlWbSvsbwiaaCw3nxJuEY5zmSCX+zG4EHltlUw0nxuoDX9ang4Adc6SDllTPbYONAw52zbxbJ4bSVO5Kqn8hHSlL1GKOIWGhwmRCAwsN4pdOIYe9OFJaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A9Nfozgk6DGMDvaGuJ5B3JGRIk0otPbdd6y3K364BA0=;
 b=iX9OsXkPyY7k9XAQ5gD0vdnBKLb/Ze7YjPYZPM5xYT0L62yWwKbIGwCGlu8sLNVm2e6MtHQpVbGYFVUQsli/ZneTad+zh7OGaxFcE/faLc9NjCE1d/zizjY+6NqOkHG2GYNyX5WZ94w8cbDdkcpDKcaeYZ4/VynwxaE6M69tWlQjWEtuzTwFkhO8y/H00iBBonJWE+CYg+AY1He/gqLmf4VY8FIk775SKeCmlI0PWkYIggb7PwWQ7Y/ALcx6SxxiRM+Zt5RYqxN9hGiwiawIqbilrdk345mtXSajdNKpiCMea85GXCpmxNs5s8Yg+LHkQ0XgYcKRJeQBy+Ync7owdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9Nfozgk6DGMDvaGuJ5B3JGRIk0otPbdd6y3K364BA0=;
 b=eihKgSUMKdsK9qfM7ZXFng28WOTj+V211ZuCxLNH/R2fd2q2nQGia8sL/uSRHzHPpU9zkk3EiBKHsCjjEouLqKorlql0I1Uk8VrtoPf0lQw8YBRSGTs9M7GXSpHY6TwZdHNcPMj3uMxiCuH6X0e8IFdSru2Y+ILQAg88Yc0MnqY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4515.namprd12.prod.outlook.com (2603:10b6:5:2a1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Mon, 5 Sep
 2022 06:08:25 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94%7]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 06:08:25 +0000
Message-ID: <cf064610-2615-1dcd-0f47-9413f0d648b0@amd.com>
Date: Mon, 5 Sep 2022 08:08:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/amdgpu: cleanup coding style in amdgpu_fence.c
Content-Language: en-US
To: Jingyu Wang <jingyuwang_vip@163.com>, alexander.deucher@amd.com,
 Xinhui.Pan@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 Hawking.Zhang@amd.com, ray.huang@amd.com, Jack.Xiao@amd.com,
 guchun.chen@amd.com, Likun.Gao@amd.com, en.brown@intel.com
References: <20220904193132.15446-1-jingyuwang_vip@163.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220904193132.15446-1-jingyuwang_vip@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0024.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::11) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d34de3d-6043-47a7-c564-08da8f050b04
X-MS-TrafficTypeDiagnostic: DM6PR12MB4515:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k+5dRWkNvvIltcnLN+6deEGJDUQg/Spf80cYFAt1goO6krq+ZjGmDqyMy7tAYMI6tTO2uABZNz0sTR7wm86c2bjUGp2DsULL/lTdGaKNo7r8hKMKH4i8eAoArrlUzyT/BLBwkyKF2DyOWuLrgaAipmRgdY6feg71Flh4zktNhtdhqhM++ohIvpjlthIjl88rMRk0i/GtxScSiI7y061BiZxmCh9fPqB8BmfRpwflvKUXYOpcJ7HFbaoQnlFUDd1pxH/h88Apvkoku9S+zIIUXCbWwT2FaYvGwwM5KUvN8p4fum2Ddex5bftcokgt0gnQD1sc/ulMqBKIt3o92l/gtVrA+yv+/rS2u0l9INKLRPdRciZJEnAJzSM3SVxHzAZfGV5bW1ZUXLTUDbBNmnpyllU8w83YluavUeGMpNZ6K6EmTVN1ZFQ/iOA/CGQV9LMq6xUJs80LTiRStpkMbevHVexV8Wc82/N0Zzmu9VX+qUSTcaeSJ4Osc8QZl7P7eDc/mr67WOtwV6JgpqkHgwcNEjZo4saW0VezE3sbuIDKmTva1lA1vWPWOykW02vfUDdYaZ1DfS+U5GqbQ6OJYDPYQimtLSwgwsdDyainiqzfW3xLYv1yhSt6hH5bEZ9NY83xLmGVimAFk7dTpDdb2/00qvbEvfhtxwHqRRrvOJTZK1qQocfn2xDn9tVGwYaaBcfOvM5njf8tN0ZS0p0k7xXAT6dvJbl4wznzev5SKDKGxMUm7eC3ifK3sh7c8KlT7DOw5bv5PnpOA+15MwLfR6HXeV6tMttH7/soyfl92LkvIf5dcBQS1espCHg6b8tx/tjk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(366004)(346002)(136003)(396003)(39860400002)(31686004)(186003)(921005)(83380400001)(316002)(2616005)(6486002)(26005)(2906002)(5660300002)(8936002)(36756003)(6512007)(41300700001)(4326008)(8676002)(31696002)(6506007)(38100700002)(478600001)(66946007)(66556008)(86362001)(66476007)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akdpSEU2RTU3dGI5QlQ0Sjk1NU5IM3hTUVZYY1k2Z2I3WHRuSHJ1eC93Mm1S?=
 =?utf-8?B?UXhpbitZR2gzV2tEWWlzVzV6aWVmSFVGd0FaY29RVmlDZ2ZZc2gxR3lGWFIz?=
 =?utf-8?B?ekFMNUlsck0rbEVzVkZseHpMZzh0SDJMbG1RcE14OUMwdm8raENZVk1OYlRU?=
 =?utf-8?B?N0U1NWVqZnB3ODU1a1EwVTJpSmJ4cWN2aVVVMlVuSW41d0Y2YlErN0loWDFU?=
 =?utf-8?B?eUZtazY5azFqMnhOV3dTOHl1VjVyNEdFOXVtcWl1RWthWXZWZU04M2QrUkVq?=
 =?utf-8?B?b3o5QVNqM3N0aFJSOE56MDkrVEc5cVJUSkFpenVjTmtIL2pXRE5aUEI5bmVV?=
 =?utf-8?B?eFJPejBrK1I1Z2NsOVFmQWUvdnV0WEFIenk0djVVWmxSUTFUOGtvZTJ5TjJD?=
 =?utf-8?B?MXVpRWZERzgyQ0pObk5Jd3gyOHdnR3NIY09Rd0tsUzRDVGxaRUdtemFMMGhm?=
 =?utf-8?B?VnFUR3RIU2RFY2Q4ODRyYXNPaGV1b1pQWXZCb3ZnU3dXb1B4VEtmRjdmRzFa?=
 =?utf-8?B?WnM0cDJvK3ZUTjNFejN6NlhCMytiaTZ6SDgyRDdvQkM3VG5xeWI4MFlGd0w5?=
 =?utf-8?B?U1JYYXpYcVZwZmZ4QXlTcHZqVis2QUE1MkliSEw0bkVsc003Y1RrWGpYOTFZ?=
 =?utf-8?B?SDV6MTFTVnpLTXI5bUJhd3Z1UmJQZzE4MEtqOU9Fb1Q3YjRPcTFlZk1BeHVk?=
 =?utf-8?B?RVFTVFo3cmU1VUJ1ZS9EbmNNU0ZwRm82Tmpya0hPOW1xUWV6bTJjeDUyMVRB?=
 =?utf-8?B?dUNHaFU2QUJCQXlpd2JVVmNoc2poMmZBTDdLZDAyTU1mS1d1eVJWN01DMFEr?=
 =?utf-8?B?Q3hTakJsano1c0F0VmJpZU43aG1ZbWMyTjc4UzdFNExCcUZDM0FKMnRSemt4?=
 =?utf-8?B?cUoxSWg4a0plcFVSUVBNSzlWRStrYzloazh0ek1jb0ZTSDEyYmV2eDhLRDJx?=
 =?utf-8?B?aHJYTDNIdGFkQWFmZ0tna0R2UEtZUkRJRzRKV3lNaHI2UUZacTJzTk93VW9n?=
 =?utf-8?B?MHVwc2crNjNYQVZnVWpINjY1akVoeHh2c2JFYS85NHg5R00raGZ2WXJ2azQz?=
 =?utf-8?B?dE9EQ0J0ODhSVVdmUkN6N050NU53QWMvUEZDZXBDSFlkWjc5RWZLMFNxbVpW?=
 =?utf-8?B?VXlDbjM1QkFRZ3RKd213blRZQjY3RGFYSEc0OHNzU0gxMmkzM2VDY3dLNHRj?=
 =?utf-8?B?enNqRkVoV1p5WW92WFh3MEF2bWtYc0lOeEFrbGIyZmNDM3d6SjR0WjRBbnNU?=
 =?utf-8?B?Qlc3MXVqZVIwOFBnU2VCUVpUcG81TlArbUUzQllIcGEyUkVDOWwyZ2NqTits?=
 =?utf-8?B?cGRIVG5OYytRcFMveWlxWEtyb1V2NzdqakZwdFNHYUtiS1BEWC8zWFZwWmlC?=
 =?utf-8?B?Vit1cGl0aDRXRHVsdVhHd1JRSFZVMEJVUzV1bWxjSHFPb2RPL0FOSGtTbTZp?=
 =?utf-8?B?QVdCL053Q0pDOHA2WGF5eXAvVFV1ZjNCVVJvNE5IMEt0L2IxalJTUU1JT1lu?=
 =?utf-8?B?YjlEbVdHanpRdFdDRDZseTVtSTdoclV2TkhZaUJZaHZxcm1KUVNjT3hUOE40?=
 =?utf-8?B?eU1kTy9peGJFZmRiUHhnWDg5NlFabldGangyQkdueXNqNlBaeXdhNnhaczhL?=
 =?utf-8?B?M3dFeXpuellVdmxUSGM2VjZKWlQrTkpFRTJxQU1MSW8xQlpoU2hKODcwOTJ6?=
 =?utf-8?B?THVBSG53dGZRRURnZ0w3SU8ybmhsa2JNQ2k4dFFmQ1FDbGRsaE4zbWlNUGhm?=
 =?utf-8?B?QjV2YzUzU3hUNG5WblVHTXkyakgxZmw4Mi91bWZjUUlXTnZUZzdGeFhDRStx?=
 =?utf-8?B?Y2VHNThOWDY2a1V1bmtJQnQ5dUVTd21kUFpTaWFCT09YWnZnWVFHUFliZFRw?=
 =?utf-8?B?N2lONmxqcU5kM09XZzRtc29wTTE4bTAvd0VESFJReUdUZmxic1R6ZGozcFBH?=
 =?utf-8?B?RXpCY2JBdnpaeDd2dTdHRTJsNGRCWSt6YnlMeXY0WEE1T2VmYnhCelBtbXBa?=
 =?utf-8?B?dkJvSDFOMXpMMTAzTGRoZlNSdmxtU1Z1dE5kdVBNdWtkb3BGY1Zoc3lmWmFM?=
 =?utf-8?B?WGZUYW1oUXhSRGU0M2J0L2dnZWVBQ2JkWTl3R0xORVhIcDJyN2c2OFBteDV0?=
 =?utf-8?Q?efFTzhSOJgE5Szqmb1h+r1N83?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d34de3d-6043-47a7-c564-08da8f050b04
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 06:08:25.1004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n8I1lPOxNIN8zhRNH0LuETFfa2yFmSEsC+EQEwJrh+BCrIfGuKoiz70ngs7dfx9D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4515
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

Am 04.09.22 um 21:31 schrieb Jingyu Wang:
> Fix everything checkpatch.pl complained about in amdgpu_fence.c
>
> Signed-off-by: Jingyu Wang <jingyuwang_vip@163.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 14 ++++++++------
>   1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> index 8adeb7469f1e..ae9daf653ad3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: MIT
>   /*
>    * Copyright 2009 Jerome Glisse.
>    * All Rights Reserved.
> @@ -42,7 +43,6 @@
>   #include "amdgpu_reset.h"
>   
>   /*
> - * Fences
>    * Fences mark an event in the GPUs pipeline and are used
>    * for GPU/CPU synchronization.  When the fence is written,
>    * it is expected that all buffers associated with that fence
> @@ -139,7 +139,7 @@ static u32 amdgpu_fence_read(struct amdgpu_ring *ring)
>    * Returns 0 on success, -ENOMEM on failure.
>    */
>   int amdgpu_fence_emit(struct amdgpu_ring *ring, struct dma_fence **f, struct amdgpu_job *job,
> -		      unsigned flags)
> +		      unsigned int flags)
>   {
>   	struct amdgpu_device *adev = ring->adev;
>   	struct dma_fence *fence;
> @@ -173,8 +173,7 @@ int amdgpu_fence_emit(struct amdgpu_ring *ring, struct dma_fence **f, struct amd
>   				       adev->fence_context + ring->idx, seq);
>   			/* Against remove in amdgpu_job_{free, free_cb} */
>   			dma_fence_get(fence);
> -		}
> -		else
> +		} else

That will still be complained about. This should be "} else {".

Apart from this nit pick you patches look good to me now.

Thanks,
Christian.

>   			dma_fence_init(fence, &amdgpu_fence_ops,
>   				       &ring->fence_drv.lock,
>   				       adev->fence_context + ring->idx, seq);
> @@ -393,7 +392,7 @@ signed long amdgpu_fence_wait_polling(struct amdgpu_ring *ring,
>    * Returns the number of emitted fences on the ring.  Used by the
>    * dynpm code to ring track activity.
>    */
> -unsigned amdgpu_fence_count_emitted(struct amdgpu_ring *ring)
> +unsigned int amdgpu_fence_count_emitted(struct amdgpu_ring *ring)
>   {
>   	uint64_t emitted;
>   
> @@ -422,7 +421,7 @@ unsigned amdgpu_fence_count_emitted(struct amdgpu_ring *ring)
>    */
>   int amdgpu_fence_driver_start_ring(struct amdgpu_ring *ring,
>   				   struct amdgpu_irq_src *irq_src,
> -				   unsigned irq_type)
> +				   unsigned int irq_type)
>   {
>   	struct amdgpu_device *adev = ring->adev;
>   	uint64_t index;
> @@ -594,6 +593,7 @@ void amdgpu_fence_driver_hw_init(struct amdgpu_device *adev)
>   
>   	for (i = 0; i < AMDGPU_MAX_RINGS; i++) {
>   		struct amdgpu_ring *ring = adev->rings[i];
> +
>   		if (!ring || !ring->fence_drv.initialized)
>   			continue;
>   
> @@ -772,6 +772,7 @@ static int amdgpu_debugfs_fence_info_show(struct seq_file *m, void *unused)
>   
>   	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
>   		struct amdgpu_ring *ring = adev->rings[i];
> +
>   		if (!ring || !ring->fence_drv.initialized)
>   			continue;
>   
> @@ -845,6 +846,7 @@ static void amdgpu_debugfs_reset_work(struct work_struct *work)
>   						  reset_work);
>   
>   	struct amdgpu_reset_context reset_context;
> +
>   	memset(&reset_context, 0, sizeof(reset_context));
>   
>   	reset_context.method = AMD_RESET_METHOD_NONE;
>
> base-commit: e47eb90a0a9ae20b82635b9b99a8d0979b757ad8
> prerequisite-patch-id: f039528bc88876d6e0f64e843da089e85f6d3f58

