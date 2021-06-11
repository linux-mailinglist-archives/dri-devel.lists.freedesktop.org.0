Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E2F3A3D09
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 09:25:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0FA66E7D5;
	Fri, 11 Jun 2021 07:25:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2048.outbound.protection.outlook.com [40.107.96.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF8F6E7D5
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 07:25:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Thm3vkUoyp38bC7IkR/EIEfRxAluTtVP8XtUzWWbk5t4Bj0PzPYv5h+3RNbT/VmmWffGvPEaCVGIr6uPjHsM5/9dj87SvGMcWJZwS4QQJkf+O9ifpBZT3XgAB/XyLdK3KBZ3sUWdx6UuCGSRi3ql9CV4yptm6vInzCcZBfJd2Jsk0oB9JyJCTcLuS0C+gXNT6AIW9AwU/qAfEcn89r6ZZSCmYQz7QYSw63rWFZetQNdIskYAw2bTHwCUYlTUk+yVGCbBsU5IukPQZZt1aljhwl+Zo+hpTZKiNcmGyeStgY2eoBRB4lzyppIiFDvwaojXELyc1tGJNP2gtJY1DilT6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FdOuhZ7Ia3LM+4jTtZVMcTO3f7LBDyRQ/2bRRcUHW0k=;
 b=GKddbTCCiKOROWYD697hhU8w+o1NnGzs6rFKDu730L2S7gkX9VCtG3Amk37GCFr59+W1O2UWPBIhJ2/ePZ36u+T8U1mVFiREPgoOca5q26LO7QAYYEidQXpWiXln4HwTz7ib/53TNzdo0zMGlgeWBdsyZk0LIh/AOb08btSWLZQ58pwLBMaMgSQT8u5qm0g3FM+4S7neYHyt1dY1VBScHupI22MA36a7+YdJgiQtkIpqBB9/5ox1TEyYMS8th84UJSQ42aOskxMPg5erVLYIltxDo4zficsXc0zJvLkhKnzRPh3JoaRWR9+Bhpi4ZDgef9Aau9GKWuscQYg8x16Hyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FdOuhZ7Ia3LM+4jTtZVMcTO3f7LBDyRQ/2bRRcUHW0k=;
 b=Sw6o/2AfFxKinOT49HG9TgmalYpQSlm+eOQBccnDc98T5yBUqYsRlR929C3Q4pXCR+pjd2ncXIZjKDRswuaKhvZwE+hl+KSVzquedAaTJYu3BRDgt/fnZBVuOHi9zplNKHa8EIC7z6ukykqz+6/RnY1jFAvB9eWjUobCHjhIPJY=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4518.namprd12.prod.outlook.com (2603:10b6:208:266::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.23; Fri, 11 Jun
 2021 07:25:05 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4219.022; Fri, 11 Jun 2021
 07:25:05 +0000
Subject: Re: [PATCH 3/6] dma-buf: Document DMA_BUF_IOCTL_SYNC (v2)
To: Jason Ekstrand <jason@jlekstrand.net>, dri-devel@lists.freedesktop.org
References: <20210610210925.642582-1-jason@jlekstrand.net>
 <20210610210925.642582-4-jason@jlekstrand.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f0af62c9-5f06-fc3b-bcbb-ad33b78212cf@amd.com>
Date: Fri, 11 Jun 2021 09:24:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210610210925.642582-4-jason@jlekstrand.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:1e99:1d6a:3624:888b]
X-ClientProxiedBy: PR0P264CA0055.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::19) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:1e99:1d6a:3624:888b]
 (2a02:908:1252:fb60:1e99:1d6a:3624:888b) by
 PR0P264CA0055.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1d::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Fri, 11 Jun 2021 07:25:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b9f0095-a1f7-4eda-704e-08d92caa08b2
X-MS-TrafficTypeDiagnostic: MN2PR12MB4518:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4518133D045474AA77F745E283349@MN2PR12MB4518.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 831YhF0ckS1UXWHU3hT3hOVS/sgOfkxE+kjwti5AvNViKP7ngsGUk4U0WxO+4eVYZnpExzgMVIunCZttKcFgWKvzAB/wFK0xylayGQFgH3W4uUkxs2DcgxswihKfIoYg6PYvWHpIrGmNQGRMjUEpXPsxWuArAVUdhTz65+wrMaldNiNNdgvnu4wcp3m6MSSzt63PEFnGSDV0Z6fWlyJjGfxH2g4XsuxF0bfStj9qgjoGUTqhM5ZoSIf2MCLrZJ06I7hA8nUflASaOIJ6gtZHrQsvMj0jOwdv6mOO6YH86AhJ1ff6v4y2u2x43dBb+5y+rbYZrPOFWyrO++TA49gugEutZ2YBM9l/N5IwxxRPbkmzNye6RB4e1NTwVT+KUDND7WoeiI0GBXMdZMQ4UwiCcBcIKCt/8H0nZAXEs2P69mpKbbnPNaer9MNeHUWTvt6hHduriCJSJrk1hUvfcpeiPnMkTDwwf8JXSYe4UWSw+/7ufarNbJMOLiejPt1VM93fvwWUUHR4QVDQlLW+n0TU+RXnwAr+9l3JukMiOyZ2LYYqJ1IgCPcKRkBF3f3zRWPu8eclSyFGdRbXmdeM8MUQUttowB+RG7wHgbEK4LEzUK7AxeWFbsMAx1PqIeiYkr5uDmKQbHUeS1sGp1L1k8EOBdW6jzBINLT+j7TJHceyFBvpdANrQtc+JkkJfsrPcGvV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(346002)(366004)(136003)(376002)(8936002)(8676002)(316002)(66556008)(66476007)(186003)(66946007)(478600001)(16526019)(38100700002)(4326008)(31696002)(83380400001)(5660300002)(31686004)(66574015)(54906003)(6486002)(36756003)(6666004)(2616005)(86362001)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3MwZ3lrODQzYW9zd0xYTElhdXdnUll2b2g1NmdxWFRoelo0d3BEVWxPUGx5?=
 =?utf-8?B?MGJMS09NTTdIMG1ReEMrM3FpeUkyS2FOT085VXhsaUEvWDBHdXhVS25acWhV?=
 =?utf-8?B?NVUrZ3dtZHZNL0hlNHBTYW9tMUFnVWttdGthMXRyMFZuTGllVnFrYVhLcFM0?=
 =?utf-8?B?NlRtN2lzQlZ3QlFVTzM5U0cxck00RTEyZG5QRUw1OG5MTnlHZU5UQmJvTE1a?=
 =?utf-8?B?Mm9yQVd6eVQ0Mmt0cEwwRHRsMUdoYldIb1JFeGYyRUowSHA1U3NQbFpQWGRm?=
 =?utf-8?B?YVU4U0l3ZTlLaW9PQk9zNnJOekxUN0MrYTB4V0k4MzZZNjQ4em4yQVFxeTgz?=
 =?utf-8?B?UzM1cGRnak1ydktaYi9rRGp3UCsxV0tQRWk2ZGtYN0VFWUJzTGw4cEEzR2RV?=
 =?utf-8?B?TmRvbEtIcGZ5eklMZTkvY0JPOGFCSjVGckttcXh0dHBJME1PSEhNQUVTdFhu?=
 =?utf-8?B?c2RGNDhLc2lINmgxM1NFMkUzNlNwZ1JkTjBWUzR5VWhtYTVoWTJJT1U0a2U1?=
 =?utf-8?B?UDk5T1dqc0phWW0veWpIUVM3YS9UYjRRL21sVDducFJKSmdxcW1qSDNyTGw2?=
 =?utf-8?B?YUQ4YmI4bUZTL2RHcFNKOE5lVUw3U0tmSm95QVR5dHh6dytSb1lYOXpqSUNB?=
 =?utf-8?B?SXkvbnVIRllJbmhaenBBV25pVlE1ZGVzTlQ4TlpMVHFXbkRBamkwamwxeFI2?=
 =?utf-8?B?eTlkN05OczZJQVk5Uzlyc0tzc210NWJlV0J5TkxEOEFyY1dzenVCT3ZpdE93?=
 =?utf-8?B?LzN3NXdTYmJTL0NobG53TG5xeUxSdVBid3hWZCt0djhLemYyNWs2ZWhpUnMr?=
 =?utf-8?B?aUVsMHkxeTRnL1N0M1ZoRFQ4aW8zaWk4OHFYRjRURVFrV1d3WlgxaVcvS3Vk?=
 =?utf-8?B?T2JaZ1N0WWZpVEovK0lUY0p0MHRPbWdHNFlXYVVLZ29BS2tnVE95QVRNaC9L?=
 =?utf-8?B?b05mUTJSTEQzdXZ2MHlpQmNEUHNnL3RWc09mcW11ZkNNaTJRNzV6TlBGYUx2?=
 =?utf-8?B?NTRaYmdCTjY4S1NTOFF4RkdSelp4L1pjemFkZTBack1MMS90MVRVcE1NMlBS?=
 =?utf-8?B?NVovVW9WSktzOHZUZjNhbkt2eGZZN1MxamZ2bEkwVHpWUG8vTktyUWZQY1Nv?=
 =?utf-8?B?d3JzN0FMVlB4TTRKWWNmTlVvejNteDVwanU4bkFQREtUSFE3STNvRlFINmZW?=
 =?utf-8?B?Zk5TMVB6c0NyTEwvN0lzcUJ0WVc5QUM4TlA1N1FTRUpubjBZaHRDU25DazVP?=
 =?utf-8?B?OVlJWGx5UVowOXQ1Ri9XQU9PMmp1SjkwNmFxTDVBMU05cGVhOEF0dnJmWlNl?=
 =?utf-8?B?aTRZckJ0ZlpxQVNaZkc4QzRGODliN1FMMkJVcXdWdjYrbDZwSzRyRTkxL3k4?=
 =?utf-8?B?VlJnZEhLTGgvdFV0Yk1RMDFvcTJMc0hoQkRPUmdWZkpESU1vWDdNeGlVZktY?=
 =?utf-8?B?UEE1eTh2UFFVWXI1Z2dRN2dNczFwOFliQjZXN2JxM2IyVTBZb0tsVFpJL1Ix?=
 =?utf-8?B?NEdNWm83TDRGTGtVNFFGVkVDandtNzF6OTdTNTNGRnZYSmE2V29xZ2krQzJs?=
 =?utf-8?B?NGExRGd4dFVuNk1EeFpRSDZDU0JNUVYzalQ1TjVSc0RpNmgza3h2MUxqbmdQ?=
 =?utf-8?B?Z2pQRnVUSFhHcDU3OXoxbGdMam14RktSS2t0dkRhQ2J6RGttNW5mYXlUVnNJ?=
 =?utf-8?B?RXRxcnhCNGlwU1NoMjI2a2xPYW1DVTd2Sno2RjIxeXVzVjZ3NExuZzJ0a3Zj?=
 =?utf-8?B?SGwzUFdXUE1kMmRRYU0vWmlTbHl6dFZ2MlNaV1A5U3BudmFhYy9TcjArQzRx?=
 =?utf-8?B?WXVXSzMwYVRaWk1TZndlL1dkMVVIcWgxdzg3WFFNMW4raHdBbzNIdEM4N2di?=
 =?utf-8?Q?3haqddbv05L1g?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b9f0095-a1f7-4eda-704e-08d92caa08b2
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2021 07:25:05.2469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7BVNxVB6xklHZ1UXlv5vnuRG/ISBU7k4SpP46sOopTl+KtTutXnk9wZbZl652jcw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4518
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.06.21 um 23:09 schrieb Jason Ekstrand:
> This adds a new "DMA Buffer ioctls" section to the dma-buf docs and adds
> documentation for DMA_BUF_IOCTL_SYNC.
>
> v2 (Daniel Vetter):
>   - Fix a couple typos
>   - Add commentary about synchronization with other devices
>   - Use item list format for describing flags
>
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   Documentation/driver-api/dma-buf.rst |  8 +++++
>   include/uapi/linux/dma-buf.h         | 46 +++++++++++++++++++++++++++-
>   2 files changed, 53 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
> index 7f21425d9435a..0d4c13ec1a800 100644
> --- a/Documentation/driver-api/dma-buf.rst
> +++ b/Documentation/driver-api/dma-buf.rst
> @@ -88,6 +88,9 @@ consider though:
>   - The DMA buffer FD is also pollable, see `Implicit Fence Poll Support`_ below for
>     details.
>   
> +- The DMA buffer FD also supports a few dma-buf-specific ioctls, see
> +  `DMA Buffer ioctls`_ below for details.
> +
>   Basic Operation and Device DMA Access
>   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   
> @@ -106,6 +109,11 @@ Implicit Fence Poll Support
>   .. kernel-doc:: drivers/dma-buf/dma-buf.c
>      :doc: implicit fence polling
>   
> +DMA Buffer ioctls
> +~~~~~~~~~~~~~~~~~
> +
> +.. kernel-doc:: include/uapi/linux/dma-buf.h
> +
>   Kernel Functions and Structures Reference
>   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   
> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
> index 7f30393b92c3b..1c131002fe1ee 100644
> --- a/include/uapi/linux/dma-buf.h
> +++ b/include/uapi/linux/dma-buf.h
> @@ -22,8 +22,52 @@
>   
>   #include <linux/types.h>
>   
> -/* begin/end dma-buf functions used for userspace mmap. */
> +/**
> + * struct dma_buf_sync - Synchronize with CPU access.
> + *
> + * When a DMA buffer is accessed from the CPU via mmap, it is not always
> + * possible to guarantee coherency between the CPU-visible map and underlying
> + * memory.  To manage coherency, DMA_BUF_IOCTL_SYNC must be used to bracket
> + * any CPU access to give the kernel the chance to shuffle memory around if
> + * needed.
> + *
> + * Prior to accessing the map, the client must call DMA_BUF_IOCTL_SYNC
> + * with DMA_BUF_SYNC_START and the appropriate read/write flags.  Once the
> + * access is complete, the client should call DMA_BUF_IOCTL_SYNC with
> + * DMA_BUF_SYNC_END and the same read/write flags.
> + *
> + * The synchronization provided via DMA_BUF_IOCTL_SYNC only provides cache
> + * coherency.  It does not prevent other processes or devices from
> + * accessing the memory at the same time.  If synchronization with a GPU or
> + * other device driver is required, it is the client's responsibility to
> + * wait for buffer to be ready for reading or writing.  If the driver or
> + * API with which the client is interacting uses implicit synchronization,
> + * this can be done via poll() on the DMA buffer file descriptor.  If the
> + * driver or API requires explicit synchronization, the client may have to
> + * wait on a sync_file or other synchronization primitive outside the scope
> + * of the DMA buffer API.
> + */
>   struct dma_buf_sync {
> +	/**
> +	 * @flags: Set of access flags
> +	 *
> +	 * DMA_BUF_SYNC_START:
> +	 *     Indicates the start of a map access session.
> +	 *
> +	 * DMA_BUF_SYNC_END:
> +	 *     Indicates the end of a map access session.
> +	 *
> +	 * DMA_BUF_SYNC_READ:
> +	 *     Indicates that the mapped DMA buffer will be read by the
> +	 *     client via the CPU map.
> +	 *
> +	 * DMA_BUF_SYNC_WRITE:
> +	 *     Indicates that the mapped DMA buffer will be written by the
> +	 *     client via the CPU map.
> +	 *
> +	 * DMA_BUF_SYNC_RW:
> +	 *     An alias for DMA_BUF_SYNC_READ | DMA_BUF_SYNC_WRITE.
> +	 */
>   	__u64 flags;
>   };
>   

