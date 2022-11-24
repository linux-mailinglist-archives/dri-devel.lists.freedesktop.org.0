Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 198F66372A0
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 08:03:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EECC10E05F;
	Thu, 24 Nov 2022 07:03:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2073.outbound.protection.outlook.com [40.107.220.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E1A10E68F
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 07:03:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RIz/bL07Y2vUvMXqQsYsRRt3qMC9+djbIvaNxIpARICuCMlSBpskmcUgRUhNKLIbHJksoBDewiW6vHbcgw1lbG/gTsVCoKhzAKPuQRtLA9d41ps5Xf49SfHfDE8f1ymTX1CBGlqZMpPpwmmRCpjnFW+VUgh/SvbE/yRE6I1r5uhvf2xMi1pDbmzDo6DVBZpLicq15pCRKHYqI/3MDSwXtXduPM0b2oVj2iA0aIIhwVFubGs641g7ZoJXw2vKYioOrqoDx2l9wzY4zZJ5LDv7aZ+E4jUxVLVucKMnkg43ss3vQ1Z0MwFvavoVH1cAxSTAVYhm+ChQxIG5+3LDTxhB7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yT29+pvl6mykGsjgj4QkIeSGl3UOzj44u8LHVm2FZ9c=;
 b=VUUNElcQmaddZE5R+1cLnxzZc0omSHhwUXqxsA8Jq9JPvCtH9LVTOz+rn/9dQPhNWvO1Y/pCbJeKqmg53V422VTImojC+ahLweQ8DWzSu/lvtUfSXWA4zaBzvm9A76m4rvSDiOj8JnV9I2Fv0ODDBO9YEkkl/ZPZDUZJW2EW+lOhMHvuA6suhM0jAvbVPLoULc+a9tiET/+gzc5KIamCyyt7SiXu9oHb6+X9ZBUVvzhWqlnCjfpHbdwTHDUNXbHPiWnhEIE2xnZyZUS8hDUFS3+D/MrRJjLqQ7ukzgET9vp9/z8wEAopjj3dTIvjRzcT2UEYvEhWaqPKVAvrWqQ1aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yT29+pvl6mykGsjgj4QkIeSGl3UOzj44u8LHVm2FZ9c=;
 b=kkHEdQJshyLopdl0gouPBcqQ+PWpjubELzmLZhbEX2sv1KsO3ihze/ez6pDd0Yh6TN3QhgRDjN2T/9Lo9o+r4Pm4iqM18+BHl5lnxOHxYuKuyMTIXnoklL2RBed0eZdwZxNfDZCdPf0KD+pf3bXwKXL+FHLoSVRny8tkwBknGrA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH2PR12MB4956.namprd12.prod.outlook.com (2603:10b6:610:69::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Thu, 24 Nov
 2022 07:03:19 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421%7]) with mapi id 15.20.5857.019; Thu, 24 Nov 2022
 07:03:16 +0000
Message-ID: <260a86f0-057e-e235-ac38-abeb922d0dc1@amd.com>
Date: Thu, 24 Nov 2022 08:03:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] dma-buf: A collection of typo and documentation fixes
Content-Language: en-US
To: "T.J. Mercier" <tjmercier@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
References: <20221123193519.3948105-1-tjmercier@google.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20221123193519.3948105-1-tjmercier@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0007.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH2PR12MB4956:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f57960c-46a9-489d-ae40-08dacde9f5c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zNir58XN0Hya6bdp/xfV9R6FWBEXM8DEXBsAnpsZLf0eQdWJOlrCqJye5Yyhs2W8b84kpk/RwpQzmSiVEyirONgOFkmRO2Brcr9tz4wSRFU/aHSAzKxUdsw2FHOOY+ptrU2R0QCpicVWVsb9vcpoSBzJvKo6btcS4iKsM7jZtmLatnwLAIN74JrAZ4cUdeB40RyE8uR9/+r5hUVib9X25CjOkcMR/45ES7YzFbLgGl4DZmCKwWGuuc8tBLWTt7TwjS/HY0oy4lEBPk+UVL1EpamYLyRSAdyzvP9YZYaQpsDhSbH1dcgZ4SQ/bCFY4+33VN2f7rbLZPTLIETrcf4MlCCeI/zM6+fggfJVPUBPbY+PxJSzKb1PIJWk7hLtWk30WRiLq+bmz4ld6qLJH0+0aAIEe9uqdU12+ldSIOWjgenUr7/oqWnCEDiZgUDJmL5QTimA5UxZrZfrPntkq66/tJ4LyKVLQV31IrDqDbU4mSTjl2W5vUfkh4pkRHhgdGWyLCwupVaGvNCcB3f6oKaJJlr/InslmzFyTKk71+C8RExQ9/R7QELdjU1XRjzfPsjlwLJP14X5Bf88uHfa0LaDYcHIUUg9lMPmVli4Ho1MzAG36UqgFjjwIJ2KaCBHxkxBfBlzZAAi7tJNAJb6622qgnPVw2QraBtcnpfn4Nfy4AWNLtKofxhP0WT0rnizskWTwvJdo5/8SjsMv9oqIhIxjAbA3WXv94GAACwA05Op6rw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(366004)(39860400002)(396003)(136003)(451199015)(36756003)(86362001)(31696002)(6486002)(110136005)(26005)(6666004)(6506007)(5660300002)(478600001)(8936002)(41300700001)(2906002)(316002)(4326008)(66946007)(66476007)(66556008)(8676002)(38100700002)(186003)(6512007)(2616005)(66574015)(31686004)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mmt0cThndWlNdWcwN1piNXRnUWNJUS9iTlFaWjRlQzNWMG44bG1YKzhBbTBh?=
 =?utf-8?B?M2FtMUhqWFNXRUZ6ZEpZVHFOTmFMYnFaWHNoQWtVSll1YVJOVVdUMEM3ZHkw?=
 =?utf-8?B?ZVAyQ3RWYnluUjRVN1o3OTVWcXNBV1BLSVR2RFVEaGFSSkRlTTlnRFE3VjVI?=
 =?utf-8?B?QnJtQXZzRmxtT3lKdjVISWFrQi9wdkJpSk5sQjlZYm1ORTErSnVxQWgzdTRD?=
 =?utf-8?B?Z1BMeUUyNjJRZzhGOHFqSXpzYUhRUEg0ODQ1bnhQVTlaOGIzZGFETWcxdGpO?=
 =?utf-8?B?ZTVSN0NEMmx5b2Y0ejRVcnJ3NnkzalJoMDM1bUlIZWhoZ3pTWVZQejg0SkNp?=
 =?utf-8?B?Rm1mVmoyTjc1WUM2aWxHR1NYcm1CTHpENVBsaWYwVmxFTXExczYzQ3lsa1BU?=
 =?utf-8?B?cVh1cWNzSERxQW5sL3pNV05SeUxtWFk3Umk0YVZON3QwK2FuVmdSMVNBbW9Y?=
 =?utf-8?B?di9SUmZWMVNVdDRyc3VHa3ZQdlZOVXppK0JnSmpqT1hsMm5mc29Kbm5pdE1Y?=
 =?utf-8?B?UkZ1ZVBieWt4Q0dKREhacGoxQWpPRmZVRk9kZUlhV200Z0M5cnJlT3ZQOFhO?=
 =?utf-8?B?aDI2Yy9NZGpUdmJLZWsvYlJ6TkFsdVFpbTN0QjRFMDZSN1U5L2lIaFF3RlM2?=
 =?utf-8?B?NXhyTGtOSUgwVnFIYUdyNDk2cEhUNCtXbDJzdGI5YXRvZm0wN3ZQNGRrZGtq?=
 =?utf-8?B?V3UrTmNTeWdhWjdSSFl0bk12R2tOOUdkNCtiVzVzWXQ0aTE4R1FOMnZkcE10?=
 =?utf-8?B?endDRVc5d0R6SDRXcHljS240Y0Y3c0NqK2JIelZYeFVvNnJ0dklWSDNSS0Jp?=
 =?utf-8?B?TUtrSWd5aVZlR2VHZDNJY0xoK1k1ZWFyV0VFYnJnRTJ5THpkeXlkOWg3clRr?=
 =?utf-8?B?WmNZaGFFNUpSamJuT1ZUZTNja3JGNUkrZ3FHbDI1WExRWmhvd29JVWlSZEs0?=
 =?utf-8?B?Y0xUOWp1YmhrREhUSitJamxUeGg4ZVYwYk1za0tyeEQ0eVhKSEh3TW1UbVdU?=
 =?utf-8?B?WXRNczI3YzU2eXV0a2FESXVQV0VtYzNYbHhaK3g4OGFJSHZlMkZqRFVXRElS?=
 =?utf-8?B?WnlPWkpGYk81TGNQMTRaYUltTWVteFJmNk1keEZOaFhNZnBLaUhwQitYS3ZB?=
 =?utf-8?B?bHlsbjdDWE5xT21GNXIyNkRkR08xTDNzek96UkNsSDVFbjFNZHZaNHd0cGdm?=
 =?utf-8?B?NFl3SHVjQzJPRElUZDA3NjZyVkxndCtiWExHOUhxQlprK1VteWZObk16Ymo2?=
 =?utf-8?B?NENTeHFjM0JISnE3M2wrOUZGOTgxUm5HUFZpMVRhVCtxcXZoSjNtSDdLeXBo?=
 =?utf-8?B?a1c0WGpvNUVXdjVNbFYvOUV3OEpmSTVkc0xlVXhIVjZEOEFPMWJFS0lwVzJh?=
 =?utf-8?B?ZDRUeU5RSEJKeUhnQk5uTEZQWjdPdzBIMllnWjRZbWtZWTNIVzA0L0IrdGt3?=
 =?utf-8?B?dnVRQXFVSlN3b1pJV2hYQ0w5VWV4MkJSVHRZVFRxN1VjdXcvaTFOMUd1cXdE?=
 =?utf-8?B?NVJFQnFUbjcrS1pSTCswc09MaCtsQkROYzlLMWF5bmpxcFFlOWM2UnY0dGwz?=
 =?utf-8?B?MmZSOGdOampoT1V6d1Jkd3ljUjZBaE9UOXF0NHdNS1dRZVhNLyt4MVBoTGdF?=
 =?utf-8?B?SGVBZElEUlljSUJSODlQcTRtMmU0dUFSR0RtVHRjemE5OFl4dXRYZVlIUnVv?=
 =?utf-8?B?Q3ZUckhIOHNnN3RReldSNXhxSjFtdS90dHptcFhzVEs2WURJNzZuNTY4ZVNp?=
 =?utf-8?B?Sy9hMU16dzhWSjNwek0xRlZRbGsySy8rS204S0lYaHh4ZXZFMHhnVzNlcWZB?=
 =?utf-8?B?eVhTU3JSVk93aDRkWU56bm5tSkRvcjNQbXB1Rm9vTlo1SDdlWkRwaXNnWW1l?=
 =?utf-8?B?NUZ1ZndISlhJVEVVUEVkT1U1aC9IUUdScmRCZmx4YnNmQWVqSWQzV3VZQUhY?=
 =?utf-8?B?V0lqTXhWa1QzZFdNL1FqNkEvZElTeHdjZ3VCZTNWY0pUb1AwbVhsSWFGV3hu?=
 =?utf-8?B?N1ZpbjJ6WDg5bFM2UWlhWUZXKzJkc1dKUlF6bXlYSFFTUWFjMDN5LzFzWjRK?=
 =?utf-8?B?NUhlUjNnNzJ0RDZLTzE5aDhnNHEzdkxrWTZsc1Npa3dTYnhZekh5UTN0c3R3?=
 =?utf-8?Q?TU4U=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f57960c-46a9-489d-ae40-08dacde9f5c5
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2022 07:03:16.2668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OH+XlAStvOEv/ytSoTaePhRrQ0FUmwVkSAosALU7QlXCiAsj4Vc+OgeipnX5PZwR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4956
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
Cc: linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.11.22 um 20:35 schrieb T.J. Mercier:
> I've been collecting these typo fixes for a while and it feels like
> time to send them in.
>
> Signed-off-by: T.J. Mercier <tjmercier@google.com>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/dma-buf/dma-buf.c | 14 +++++++-------
>   include/linux/dma-buf.h   |  6 +++---
>   2 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index dd0f83ee505b..614ccd208af4 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -1141,7 +1141,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_attachment, DMA_BUF);
>    *
>    * @dmabuf:	[in]	buffer which is moving
>    *
> - * Informs all attachmenst that they need to destroy and recreated all their
> + * Informs all attachments that they need to destroy and recreate all their
>    * mappings.
>    */
>   void dma_buf_move_notify(struct dma_buf *dmabuf)
> @@ -1159,11 +1159,11 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_move_notify, DMA_BUF);
>   /**
>    * DOC: cpu access
>    *
> - * There are mutliple reasons for supporting CPU access to a dma buffer object:
> + * There are multiple reasons for supporting CPU access to a dma buffer object:
>    *
>    * - Fallback operations in the kernel, for example when a device is connected
>    *   over USB and the kernel needs to shuffle the data around first before
> - *   sending it away. Cache coherency is handled by braketing any transactions
> + *   sending it away. Cache coherency is handled by bracketing any transactions
>    *   with calls to dma_buf_begin_cpu_access() and dma_buf_end_cpu_access()
>    *   access.
>    *
> @@ -1190,7 +1190,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_move_notify, DMA_BUF);
>    *   replace ION buffers mmap support was needed.
>    *
>    *   There is no special interfaces, userspace simply calls mmap on the dma-buf
> - *   fd. But like for CPU access there's a need to braket the actual access,
> + *   fd. But like for CPU access there's a need to bracket the actual access,
>    *   which is handled by the ioctl (DMA_BUF_IOCTL_SYNC). Note that
>    *   DMA_BUF_IOCTL_SYNC can fail with -EAGAIN or -EINTR, in which case it must
>    *   be restarted.
> @@ -1264,10 +1264,10 @@ static int __dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
>    * preparations. Coherency is only guaranteed in the specified range for the
>    * specified access direction.
>    * @dmabuf:	[in]	buffer to prepare cpu access for.
> - * @direction:	[in]	length of range for cpu access.
> + * @direction:	[in]	direction of access.
>    *
>    * After the cpu access is complete the caller should call
> - * dma_buf_end_cpu_access(). Only when cpu access is braketed by both calls is
> + * dma_buf_end_cpu_access(). Only when cpu access is bracketed by both calls is
>    * it guaranteed to be coherent with other DMA access.
>    *
>    * This function will also wait for any DMA transactions tracked through
> @@ -1307,7 +1307,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_begin_cpu_access, DMA_BUF);
>    * actions. Coherency is only guaranteed in the specified range for the
>    * specified access direction.
>    * @dmabuf:	[in]	buffer to complete cpu access for.
> - * @direction:	[in]	length of range for cpu access.
> + * @direction:	[in]	direction of access.
>    *
>    * This terminates CPU access started with dma_buf_begin_cpu_access().
>    *
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 71731796c8c3..1d61a4f6db35 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -330,7 +330,7 @@ struct dma_buf {
>   	 * @lock:
>   	 *
>   	 * Used internally to serialize list manipulation, attach/detach and
> -	 * vmap/unmap. Note that in many cases this is superseeded by
> +	 * vmap/unmap. Note that in many cases this is superseded by
>   	 * dma_resv_lock() on @resv.
>   	 */
>   	struct mutex lock;
> @@ -365,7 +365,7 @@ struct dma_buf {
>   	 */
>   	const char *name;
>   
> -	/** @name_lock: Spinlock to protect name acces for read access. */
> +	/** @name_lock: Spinlock to protect name access for read access. */
>   	spinlock_t name_lock;
>   
>   	/**
> @@ -402,7 +402,7 @@ struct dma_buf {
>   	 *   anything the userspace API considers write access.
>   	 *
>   	 * - Drivers may just always add a write fence, since that only
> -	 *   causes unecessarily synchronization, but no correctness issues.
> +	 *   causes unnecessary synchronization, but no correctness issues.
>   	 *
>   	 * - Some drivers only expose a synchronous userspace API with no
>   	 *   pipelining across drivers. These do not set any fences for their

