Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0915A40D371
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 08:52:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F586EABC;
	Thu, 16 Sep 2021 06:52:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2062.outbound.protection.outlook.com [40.107.96.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E88B76EABB;
 Thu, 16 Sep 2021 06:52:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iUUYKDNKKwd+rnCKZ2r+gixDUm0dCBL7zBHDzCaqo5KsVQFe11PQST4L8ogbD0XD94N8ynoBu6dIQZBR5K/2HOjWKwQoeWoVFfTxtI4rGGNsxUt+/FR00MnA0hMRrnxqzITeCLzz4fuOmBu4CsAph4m9mbyLJxB7rCIDfM+TU72BGu2JOLUJ1L0loJMqfKk0JhfQyWJadDoOYAYUcRM8M2O2Tm+hMH7RjkibLAw42cesy1Y5ZEUyOJyX36o95ygyyrVu3qFor07AlYxcaBv614Z4ANL8qj+1AMR2FFvxnv88+yOVMUm6Qyx57xxnv8sYueht0iEwB10Jx3f7s+Ctyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=3W6frwHSoHaCY7/SxSYrYsL4UQh3GSRkWSlIFSvlx+I=;
 b=Lf1I1Y1BFMzreGTxe/8629P/iDKzDP7PiCSZyvs6leUuTMrIHYxeH7UD6mW8dopBfZKGqBpAvjNwsMnjMGgWo7aLpFa0LwBDkaDtShuPJi0vxo8YmT1gQRWXAwBEy4kT3XunWFtPMnv2ZjUMk5M+k5775RyagrM6Mf8I2dkUyWfCAy+TBjrgYEJwMaW8Z/bdQFJpj2uNx/+VARFgCBKnVkcaRh4UzPxpiAu/IUiaSPBkHY+6YAJyKmPKSeAB80/mLPvHf3thS9faTZHBXKpmwm93DQtDUb8SG78wf7hCnAZ83RbEy9MWErRJ1a7/lX1/cpkIA8X+9Xvc2fphsBpmrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3W6frwHSoHaCY7/SxSYrYsL4UQh3GSRkWSlIFSvlx+I=;
 b=y4tSqfvCEDzkeD7l8vW9lvGqeX3cH1CQj38cGC5QkpCWkcQJQAbZLaeP9zi7uE3vq3l2/ReZWbcqKKmP5ZLLfs4rJ9+U/Yp3u2BRatWvmUFrgHYI1SN1LGE2iglXPzRwklvMnEUyNL/Zx74XQNlpZMHxGxSz+CN+3F6Q//qxWPs=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4847.namprd12.prod.outlook.com (2603:10b6:208:1ba::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Thu, 16 Sep
 2021 06:52:08 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4523.014; Thu, 16 Sep 2021
 06:52:08 +0000
Subject: Re: [PATCH v3 05/12] drm/ttm: add some kernel-doc for TTM_PAGE_FLAG_*
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
References: <20210915185954.3114858-1-matthew.auld@intel.com>
 <20210915185954.3114858-5-matthew.auld@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d61f1da1-9ff1-c28d-b40a-3dcac4b0ad78@amd.com>
Date: Thu, 16 Sep 2021 08:52:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210915185954.3114858-5-matthew.auld@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR03CA0030.eurprd03.prod.outlook.com
 (2603:10a6:208:14::43) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 AM0PR03CA0030.eurprd03.prod.outlook.com (2603:10a6:208:14::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.16 via Frontend Transport; Thu, 16 Sep 2021 06:52:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5cfd3a8e-d489-4307-5086-08d978de8023
X-MS-TrafficTypeDiagnostic: MN2PR12MB4847:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4847A6814A11E572E69D479783DC9@MN2PR12MB4847.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E+N4OxmJBi6ppjWOsRwYU9VlKNS5g160XkIMKB48wbD8u7EpxUdl9YM+zKOO0FYWx3VhwmqGwdebgdKAqrJdSdQNSPAVv1TatBwmyniT0vggmCWNnvY7MFvImukyOqlZ8vHT2vObpbukwh2SZoldvYjcwSP8sX3bxx66F5GFpGLWPSdhJ3gwnxlf0LyZmBAZYqxdWRajeTtoXBq1UqEUdqqOBX+RXGVcgyNbCeiph8P+CSx8NAP0Bhj2w4tsfWwyBOGIPJb7CH1DU330PNorrnPDOlYE4pDp2A0YblJexYQZNG8Tm//XmCAWAXaTrTU7toQmJJs/kSzu59nhxpzGw6C8uah5RaZOBDL/vliq7pbe+v4xkIVLszBH9Ak0ELtBzgvuMpOwvyZ2HhVOEBWECWbjFHFhgXG1TzG93LbFuooFoW3pv1HQ9xvW070/eMCp4McEb8VMyvlgTf8haUFmgoIFym+XwictlihKYX4FF1ESXRMrVZKJ+ZxkgMS+6zU7XZkyW7aVqDr6XupdS8BONjaHr315lYEI6oF3SiQBTGJdX07PYuvtx0ZEUehBo+35V6iZkvaTlfpmBz5F1QkjYNAYJ2WB+PJ1QPhVP1ln8j7jC5CevpUxw4cEcyMcVvZIPtHQFwaeR3rmr0xlR5rHjFbTh3eYnRL736yRkhm6DGUi1pPI6Mj5ks+L25C7iPurWGFxrzRVRV4dXOWct7EEaPuohOcbTWVFUxAamtuaYOk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39860400002)(366004)(346002)(136003)(2616005)(26005)(186003)(31696002)(6666004)(956004)(86362001)(66574015)(83380400001)(5660300002)(66556008)(66946007)(8676002)(66476007)(8936002)(36756003)(2906002)(6486002)(478600001)(316002)(16576012)(4326008)(38100700002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2FuSTVvQ0hpbnhzQW43TFBzVW5QV2FqUGNCTWVPUEhZRndLUGFWUjJYSk5F?=
 =?utf-8?B?QVpyenplU3gwN1IzektpdHRSY1VGdmh4aExEQ2pYSVQwZ1pzdDIzbmN6cDNH?=
 =?utf-8?B?SFBUNnlNQyt5Z3VrNE5UVUNTMWFJMUd6Q1VhQWFpMjhzWFBEZ2Y0dENCUGZU?=
 =?utf-8?B?UkY4TFlqNkcwTjBiTG1EaEQzTmZveExJalp5WXhYLzBRZFFSdXdxWEZVd2ty?=
 =?utf-8?B?ZC9kWnExV1huWERXU3ZCczNuSGJsazNZcmVSU1R6b2R2dzBXSGVKLzdlUHR2?=
 =?utf-8?B?enJtK2FSNUY2dHpSZUtsaWN2Vzhla21qRVI5RGRDVjBzcFRoSHhrMFREeGc1?=
 =?utf-8?B?MEtoWExJL0E1NmwvZlV1RmErWklNRm51TGpRa25ERVVLeENtSFdHVWE1YmFh?=
 =?utf-8?B?aXdJbnV0bHJVYy9TVi9VZnVRbDFpQmFmeEpyVThRRWxJMStnVG5NRnVueHF3?=
 =?utf-8?B?R2xQajF1R2hsZlNsTTJ5L2U0UDcrOGd4YjVFU1hqQWhvd2tLaUtOWVJnakhE?=
 =?utf-8?B?dTdaeDVlZ3p4MXZ1dWdNUy9Mc3l0UVRORDUvb2pQT0k2TUVHK2xPMk5qNE9r?=
 =?utf-8?B?UUhaSWxlL0VsQWZIYVBLWkdQdGVXQmp4SnhOeDJVa2VuSmFmNkVoR0JCenNm?=
 =?utf-8?B?SnFoTGZWc2N4LzUyWTRidGZ4MWlBdkRKTkhQUHBheks0Znk4QjZkbHlIZnc5?=
 =?utf-8?B?Z3NxQjFuWG0zbElIRmdnbWtwUWgvNkltY2N6OHJrWWtrTTdqZ2xrdDJWUXBj?=
 =?utf-8?B?Mlh1cGFPV1ZCVWprZTVTTmIxY0x5T01yRDNLd3hQaGR5M3J2UmFyQVMwSEpH?=
 =?utf-8?B?OFV2VzZPbkxsaWN4OXg5Z2Q0TnBtTjJYRDRPaDFmNWNkQjVJTnB3a1F3SW9D?=
 =?utf-8?B?MHBCM2FvRXhkR3RKRHZ4NzlmUitRQVEwM1FacnFjSkxUYWJJSlBvY3NBOGpU?=
 =?utf-8?B?RmNJelBPcFlycE5HcmVpcStRa0NsY1A1K1kwSkpMSE5oNkN3Zno2Z1ZLQkVF?=
 =?utf-8?B?NlBMSTBCVXpCcUhoeXptOFJrWXl4djM2cXNhN2U4ZkI0S1JRMm91MDg5L0t6?=
 =?utf-8?B?NzlvbGJZTEZ0Y3VqUUVuaDFLZmhTSnJGU0hPMHR3NjhoMkE0bnRwb3lmQ1Ft?=
 =?utf-8?B?eUQ2M1RDd1VWcEp4UlRwL3cxVUl3TkFScDZYeWJ6bHk3U0NZRTJPaUx2c3BY?=
 =?utf-8?B?NjZML0RNdFVqN2tBM1hmUGZ6SXhIdnc0QWhvVXQrb24rMkt1KzNBdFdnbWpI?=
 =?utf-8?B?U0FJWnZ4bWxIeHJDQkNidC92dzlYaXpsRHVkQ0UxeGhERE1uUTN5cUNId091?=
 =?utf-8?B?LzlUZG9RdS8xTmsrM3k2ZElkN2RXcFZ5UDg1L1NLNE41NGRpQktCODV0aW4y?=
 =?utf-8?B?TWpORkFQNzZneEVPUHJWV1oxQ2hvSytMRjZTVTI2T1RyN0JROHJlZlJUUk1D?=
 =?utf-8?B?Q0MwM2RTeW03ZklyTUxlenRlRWFVMEFKV2ZLY0NnM0ZOSjd0YVEvaTFsdXpT?=
 =?utf-8?B?MXZ0SytuTEY0Y2dEZ09VU3BTL01QV202emxON0ZXaFZRQUU3WUwyaGJYajBB?=
 =?utf-8?B?SEo5NGJJS0plaHNuL0FMT1lZTkt4MDF6L1AvTXZVS1ZwcmRFb1pUS1l3bWFx?=
 =?utf-8?B?MU5aeVRMT1VFUjREQzZLRmFuZnBiMDdaQk9kVDJJZHUxVDJNRUpiQjA5NU9X?=
 =?utf-8?B?SWdNUXZzUmFFUStaRzdXWUgxeTZibm1vMzRDSWhiR2JNaDNidnNZV1lHUi9J?=
 =?utf-8?Q?BHXSoQ5PqwI/AJWvyP3fFbKcD9DA9nP1Tv5/8Aq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cfd3a8e-d489-4307-5086-08d978de8023
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 06:52:08.0874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ezHxRoSrrat2VGkAotulpU/zm/K/BAoRlLqkcm8ctZH72jQ8ravryi83mUiq8BCR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4847
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

Am 15.09.21 um 20:59 schrieb Matthew Auld:
> Move it to inline kernel-doc, otherwise we can't add empty lines it
> seems. Also drop the kernel-doc for pages_list, which doesn't seem to
> exist, and get rid of all the strange holes.

As suggested on the other patch I would do the rename and renumbering in 
there and only the documentation change here.

Christian.

>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Christian König <christian.koenig@amd.com>
> ---
>   include/drm/ttm/ttm_tt.h | 57 ++++++++++++++++++++++++++--------------
>   1 file changed, 38 insertions(+), 19 deletions(-)
>
> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> index a6c284c21e72..7f54a83c95ef 100644
> --- a/include/drm/ttm/ttm_tt.h
> +++ b/include/drm/ttm/ttm_tt.h
> @@ -38,35 +38,54 @@ struct ttm_resource;
>   struct ttm_buffer_object;
>   struct ttm_operation_ctx;
>   
> -#define TTM_PAGE_FLAG_SWAPPED		(1 << 4)
> -#define TTM_PAGE_FLAG_ZERO_ALLOC	(1 << 6)
> -#define TTM_PAGE_FLAG_EXTERNAL		(1 << 8)
> -
> -#define TTM_PAGE_FLAG_PRIV_POPULATED  (1 << 31)
> -
>   /**
> - * struct ttm_tt
> - *
> - * @pages: Array of pages backing the data.
> - * @page_flags: see TTM_PAGE_FLAG_*
> - * @num_pages: Number of pages in the page array.
> - * @sg: for SG objects via dma-buf
> - * @dma_address: The DMA (bus) addresses of the pages
> - * @swap_storage: Pointer to shmem struct file for swap storage.
> - * @pages_list: used by some page allocation backend
> - * @caching: The current caching state of the pages, see enum ttm_caching.
> - *
> - * This is a structure holding the pages, caching- and aperture binding
> - * status for a buffer object that isn't backed by fixed (VRAM / AGP)
> + * struct ttm_tt - This is a structure holding the pages, caching- and aperture
> + * binding status for a buffer object that isn't backed by fixed (VRAM / AGP)
>    * memory.
>    */
>   struct ttm_tt {
> +	/** @pages: Array of pages backing the data. */
>   	struct page **pages;
> +	/**
> +	 * @page_flags: The page flags.
> +	 *
> +	 * Supported values:
> +	 *
> +	 * TTM_PAGE_FLAG_SWAPPED: Set if the pages have been swapped out.
> +	 * Calling ttm_tt_populate() will swap the pages back in, and unset the
> +	 * flag.
> +	 *
> +	 * TTM_PAGE_FLAG_ZERO_ALLOC: Set if the pages will be zeroed on
> +	 * allocation.
> +	 *
> +	 * TTM_PAGE_FLAG_EXTERNAL: Set if the underlying pages were allocated
> +	 * externally, like with dma-buf or userptr. This effectively disables
> +	 * TTM swapping out such pages.  Also important is to prevent TTM from
> +	 * ever directly mapping these pages.
> +	 *
> +	 * Note that enum ttm_bo_type.ttm_bo_type_sg objects will always enable
> +	 * this flag.
> +	 *
> +	 * TTM_PAGE_FLAG_PRIV_POPULATED: TTM internal only. DO NOT USE.
> +	 */
> +#define TTM_PAGE_FLAG_SWAPPED		(1 << 0)
> +#define TTM_PAGE_FLAG_ZERO_ALLOC	(1 << 1)
> +#define TTM_PAGE_FLAG_EXTERNAL		(1 << 2)
> +
> +#define TTM_PAGE_FLAG_PRIV_POPULATED	(1 << 31)
>   	uint32_t page_flags;
> +	/** @num_pages: Number of pages in the page array. */
>   	uint32_t num_pages;
> +	/** @sg: for SG objects via dma-buf. */
>   	struct sg_table *sg;
> +	/** @dma_address: The DMA (bus) addresses of the pages. */
>   	dma_addr_t *dma_address;
> +	/** @swap_storage: Pointer to shmem struct file for swap storage. */
>   	struct file *swap_storage;
> +	/**
> +	 * @caching: The current caching state of the pages, see enum
> +	 * ttm_caching.
> +	 */
>   	enum ttm_caching caching;
>   };
>   

