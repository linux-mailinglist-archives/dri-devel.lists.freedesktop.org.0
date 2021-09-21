Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA95413297
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 13:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36FAF6E956;
	Tue, 21 Sep 2021 11:33:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 559F66E92E;
 Tue, 21 Sep 2021 11:33:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ET6kEo2pNZAs2sRNBefN5wTZdyCr7GAfx8e6HYkDTepbqdEy2lKERscbQ2KyOd1vvjjntsObpdrac53cvMUQ5fNO346ibZhtsmJaEj2SULeVMcTYRoMpNm+fNtOpy2UEp1Ga/phbVYy6efzTJIeVgmTsG6HWczP/o5qnKauDrN+WptavAocopHGb4FpdM+NKNmdc/PM6aBX98FV1uaFGBLk4YMGSi8J2HYSGYQSJ+zk4AfQSUPlQ2XC6ve56fQMvx5m3qJZHwV85BSzL5yb5jLvFXM0NmUxd5WmZrNxrALr8iuP4DnZPJRrvirTaSI9GqN7Vd6WA948ZDTOrxeJQjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=FimE1Z/D4PXwStiL2ebbxZQnmn2PQjso3WrsHDMRp8M=;
 b=VM2IEhk5ydgZCNFxeafayQADoczyJd+8/sXZ0jPTgFHFYxeVDnoLhUAeqY+AiBnMlaQtecFcDb5GckvA0NtY9zNwjyRw1DFzD3mKS9d+XgMW7kirn9K5YRg7TF0ZYYs6FpoAw4CyZRT9yMM3gFk6cwI2s+How88eI+2T5Y8mpczSHk1vaSemLHBemQjeqFw/dgs6ikTeoMPZxikspGYHZxI6SV+NjcZFlG6c2XC9y8nSdERgQk6RkPg1qDaP6dt0JOJELkCK3aiNQxMHzjvduS4DFx79bCIxRxcJN17Zyl7CQqghbVCR0jK5YUHu95WmU9TlmWI9abQgQhmqX0fc/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FimE1Z/D4PXwStiL2ebbxZQnmn2PQjso3WrsHDMRp8M=;
 b=pdiS6ty9jymRqkSWW+Rnb7fJNvu2BQKigeTshq1tht8S1jYGUADhAf2F22owGz1Gq+24X7GnqB0b04kaPWOq0Sj3Ni2/CaH6hcSIEKkawcI9u/ckFRDqTh0kukdalJPdF4R0N/DhpHpcsQG+KAs6pHzCnnPQwJ2HX8hqJhXEONg=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4440.namprd12.prod.outlook.com (2603:10b6:208:26e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Tue, 21 Sep
 2021 11:33:17 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 11:33:17 +0000
Subject: Re: [PATCH v4 06/14] drm/ttm: add some kernel-doc for TTM_TT_FLAG_*
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
References: <20210921110121.3783395-1-matthew.auld@intel.com>
 <20210921110121.3783395-6-matthew.auld@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b3413978-9a52-ca06-47cb-27dee3d89ce6@amd.com>
Date: Tue, 21 Sep 2021 13:33:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210921110121.3783395-6-matthew.auld@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR1PR01CA0022.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::35) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:8582:d9f8:1318:9d2b]
 (2a02:908:1252:fb60:8582:d9f8:1318:9d2b) by
 PR1PR01CA0022.eurprd01.prod.exchangelabs.com (2603:10a6:102::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17 via Frontend
 Transport; Tue, 21 Sep 2021 11:33:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f5cd8a2-c746-49b3-ddab-08d97cf39b1e
X-MS-TrafficTypeDiagnostic: MN2PR12MB4440:
X-Microsoft-Antispam-PRVS: <MN2PR12MB444064145247F4916052B76B83A19@MN2PR12MB4440.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yTZb/UDpT6lEKrXyLq9qcpfS2eXLbfTyP3fEqDLrPvXWRB5SgqJAOnBp7ksalvNRJ6pY78PxSoRrnMvzNltXc0BWoMBdEQzkiQzo3DRmDqC+z+m5xT1WmHCX3rcCEweX4CqbbKIW63OL1LOGq9dMe+moFafaypRYqNWmA9FFXseDWF6P9NyAjNuysggTG1B0Jh+PJzDpfNrQ8wnQhpwpD81qMNk1G4reirx4mcp3Frk5Zg6v4HF8etg/b3MqnWxJZcezNwIoktIxMQLxeFEvI8RENlZArmuGm4g1Etl1iG9gNRVP+aw/8daHD1nQpg7PdYXk/3zHfIwqIdhs3NQY7fI/4hkTBCFEabW8yR/LsYyT50/lm8bSrH5ef7mLNBydei4XUiV0laEI8vGIxP86R9S3PkEvSsoQsEwMxME8iz+uc75Sf/12yWSs85NPhR/gc6HI6lUPg7inrOs48pz+DEyAo7faCTRu8MqC3C+tH3Yy3iDZWY+u5XhpvZNLfIKdALCj8Zsik1llXHhphz0OcT8OFHUUiVA+qElmV/ITlvIYH9FHvUVc6bF26o/B78KQMKi9COZWoyB636Rdy9ZpCVX3LGRIE9OcgCWuTCbI6vQ1TovqCugE5x+K2ihFAApCBkq1HEUCa0zYM5reCsxiieMa6mBO7KFTfCU3axZBOYzAN6MKA4IJ56vtpI8bK4oN4OEbyk1cLuKm6XC4NOWkLA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(8676002)(508600001)(31686004)(66574015)(5660300002)(6486002)(8936002)(2616005)(66556008)(31696002)(66946007)(66476007)(38100700002)(36756003)(186003)(6666004)(83380400001)(2906002)(316002)(4326008)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUZuWnovSVUrUXVkSk1rOWpXdlc4ZTBENTRVOWZJSVhScnZpNzVlczB5ekRa?=
 =?utf-8?B?RnpLY1EzL0ZxZ2p3QzFDNHNyd05qZW5VNGgyK3FqU3BtTzR4TXlSUGIyODJl?=
 =?utf-8?B?WWo4Sk1wNTRvNWppb0hqc1dXRDhheU9mTk1RVE9BY1YrNHRRS0NlNFFnQTJD?=
 =?utf-8?B?Q1NkVUpnVUdPMHlFdU13cXZIeDEzZ0ZpcHkweUF3MU03RUZDSzcvMzdRYmRX?=
 =?utf-8?B?SFJxSTY3SnNlT2hDSjVqdmRiWENuVk0rMUhzTFpVTXJNeUVOQlRSM05DTitq?=
 =?utf-8?B?K1hub1F3b052a0xDWDZvdDQ4WEpBYnhicEc0M2ZsMDhDam5KZUNNalZCZHNj?=
 =?utf-8?B?L0ZLRjh2NjlkVUZTMmR1Z3huR3hYeXMwZXZaYmdrMzU3dXVDRmFRcEZyTlFG?=
 =?utf-8?B?OThROG8wd2JPSWlBandmbzl0bC9mVnlPWC9TWThMcEtvenVQZXlHSnJQWTNq?=
 =?utf-8?B?MTNxOUZyWHpHSis2OGptTFYxelBvTjBscGNPbkMwMnNONkRBb3YybzMvb2lJ?=
 =?utf-8?B?eHd0Y1k5UkxYMzl3WGo5NmdxQUU1QXhBbGdpNHhxQXAySFIxdmRCSjJaQ1Vy?=
 =?utf-8?B?bUZvOEdxOHpEOEJIM3h4c3MxeEtEUWhHY3NsSGQvVlNmaTNJSytKUFlRcnZQ?=
 =?utf-8?B?WTgrSlEyTmdqQzFPM0pQZUdwT285Um5NNjJuNlQ5TkdSVGh3dVE5eVBuZE5D?=
 =?utf-8?B?OEE2SGprUWQ5QjB0RFJhYm91a1BpV1RMSHRkYWtkYWcwUGZUam1FMm9KeGl6?=
 =?utf-8?B?OElpOWtDbzdwekdmMDBqZkFHbzBxWXdKNUJUSXQyS1lSSmhQL2tncFBRMjIx?=
 =?utf-8?B?eGdOeXJ4OUowUUN4a1NkTmlNOVFsOCtLTDZHSDVhVEI1ZFVWZWRvU3o1TWh6?=
 =?utf-8?B?Y09VTXNBck1Gdkk4YWR5ME5UQVcrbkRxUGxuS0RrdG4rY05RbThIUHZMaUo2?=
 =?utf-8?B?RmxFaEFWNm5FMEdHelVUN3h5UmFiTG9Edm5jZzRMeDNwd3haTGMrYXFRdGdG?=
 =?utf-8?B?TEYrOSsxYzRCTHU3VlRmOUtXQlRNbUROekNjQUpxNDFCQVZ3NWJwY3E1Q09E?=
 =?utf-8?B?aG92TlduR3lOM0lVQ3RuTDdpTm1iR3M5QXNlaWJtVWIvR2lrU1BpRmUxbUtK?=
 =?utf-8?B?RnNvZGthdC9VTTVxUUo0MXhxb0VkNUpTMXd3WnJjb1VHQnpOUmZJRFBpQzRu?=
 =?utf-8?B?c25uNmVvQm9raTB4ZTF5dkYyemt4NExLREd0dm92TGZnTnQ0NG42T0w1Y2Nh?=
 =?utf-8?B?VmpadC9ZRDhEajY1RGpIWlpJWmFaVmlRSW1TT0h0SDQyU3A4dzQ3aU9zQUNj?=
 =?utf-8?B?Ri9yNkVZYXk4Vy84VHJDTDNCOXBuem5OVnpVZnkzcDN4TXRVeHhqT2U3cGZE?=
 =?utf-8?B?ZCtsT2ZWQlI4OTJNRW5DZFB3TWgxNFRramlZVXo3SktHcnkrYW9yYURaa001?=
 =?utf-8?B?ZjJUOFEzbVArYXc3aUNYKzhtdjQ0SjByVW1OMXBycFcxTjhPUmtYUUg3ZVFv?=
 =?utf-8?B?UXVOeStNV09JN0xDdEtoL0pKYU1hNW83MnZ6UGZpTTVWczJHZVdCcHJWd3JK?=
 =?utf-8?B?b3EyRzN1YWZORzBGZG5UT1ozVlpCRHdiTEVhdDNFUkE1MTliNjVCajBmSjg4?=
 =?utf-8?B?Q1hLQnNoalJlUFFWZTZtK2Jvd3h6ZWFJdkw2SnJ3c294bjRiOUl0dW5lL2Z5?=
 =?utf-8?B?YWxucW5Cc2Nydjc4YThYaVU5TWQ1VW9rdGZGWmRnejVYbzhQb05oWVZmL3Iy?=
 =?utf-8?B?azFoOElZdW53eHdVaVlnZEFNTlVNMyswa0hyWWxWZ1N5dlU4NzAvUXJweWg3?=
 =?utf-8?B?d0JXb25lTGlZYXowSDY3em1Sb1JUbDgySHIrZDFRcXFZOEpYU1hrUlNpcmhU?=
 =?utf-8?Q?2F3QhuhQCWc1c?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f5cd8a2-c746-49b3-ddab-08d97cf39b1e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 11:33:17.2583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kRX6IZPB16A+NndnaSSuWKDsOSgrRpTq+xGubI2OthUd80E1F2rHExWsXat5z/0w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4440
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

Am 21.09.21 um 13:01 schrieb Matthew Auld:
> Move it to inline kernel-doc, otherwise we can't add empty lines it
> seems. Also drop the kernel-doc for pages_list, which doesn't seem to
> exist.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Christian König <christian.koenig@amd.com>

One comment below, with that fixed Reviewed-by: Christian König 
<christian.koenig@amd.com>

> ---
>   include/drm/ttm/ttm_tt.h | 57 ++++++++++++++++++++++++++--------------
>   1 file changed, 38 insertions(+), 19 deletions(-)
>
> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> index b023cd58ff38..f3ef568da651 100644
> --- a/include/drm/ttm/ttm_tt.h
> +++ b/include/drm/ttm/ttm_tt.h
> @@ -38,35 +38,54 @@ struct ttm_resource;
>   struct ttm_buffer_object;
>   struct ttm_operation_ctx;
>   
> -#define TTM_TT_FLAG_SWAPPED	(1 << 0)
> -#define TTM_TT_FLAG_ZERO_ALLOC	(1 << 1)
> -#define TTM_TT_FLAG_EXTERNAL	(1 << 2)
> -
> -#define TTM_TT_FLAG_PRIV_POPULATED  (1 << 31)
> -
>   /**
> - * struct ttm_tt
> - *
> - * @pages: Array of pages backing the data.
> - * @page_flags: see TTM_TT_FLAG_*
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
> +	 * TTM_TT_FLAG_SWAPPED: Set if the pages have been swapped out.
> +	 * Calling ttm_tt_populate() will swap the pages back in, and unset the
> +	 * flag.
> +	 *
> +	 * TTM_TT_FLAG_ZERO_ALLOC: Set if the pages will be zeroed on
> +	 * allocation.
> +	 *
> +	 * TTM_TT_FLAG_EXTERNAL: Set if the underlying pages were allocated
> +	 * externally, like with dma-buf or userptr. This effectively disables
> +	 * TTM swapping out such pages.  Also important is to prevent TTM from
> +	 * ever directly mapping these pages.
> +	 *
> +	 * Note that enum ttm_bo_type.ttm_bo_type_sg objects will always enable
> +	 * this flag.
> +	 *
> +	 * TTM_TT_FLAG_PRIV_POPULATED: TTM internal only. DO NOT USE.

The swapped flag should probably not be touched by the drivers either.

Better just describe what this is good for.

Christian.

> +	 */
> +#define TTM_TT_FLAG_SWAPPED	(1 << 0)
> +#define TTM_TT_FLAG_ZERO_ALLOC	(1 << 1)
> +#define TTM_TT_FLAG_EXTERNAL	(1 << 2)
> +
> +#define TTM_TT_FLAG_PRIV_POPULATED  (1 << 31)
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

