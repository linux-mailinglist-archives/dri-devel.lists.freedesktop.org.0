Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F175E5B8F
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 08:42:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA8D110E04B;
	Thu, 22 Sep 2022 06:42:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2065.outbound.protection.outlook.com [40.107.92.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE4910E04B
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 06:42:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EKHvu4gfutLzy1W/j2VCBTQABStMSgZvP4Twx79rVkm8GcVVKdBZA87WQ8S9bGRDeY7i96wqL635VoYKpmBdvjGVc3Rk2vHwdtFAx7U36WXzvhdfys/GMLyeVIlrbLdKTBdnVVuPSGTAnk7bMWXv/SQgb79mphKORuJRvJ0ijoabzhuYhGgzoGEbHVKubQmfIxYXnay0YYimUuhqaerm1c4a9P/kSvhgY3y8EP4OEL1mR812/TusuWmvkGN9lyvkUNClLtA4NV6c06EPZWZOweQslm5zXZc5x9d9W0dm9kIAA8OmRBYfLf80rc1sp5PXv+GMAwkTJDEwEUTG6mIapg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xj/5Zi3zlcBYiqQ01wrfjGr6X3RT1DN1CIcKooCSHyk=;
 b=JToZsQG7l0PiuQngiRVmY4EFeBlzP/U4HosDCeqAyWBSHFNnWpM3fVP7EnML/apQztHkN1h+P+j2W3iIfe0LZNgqbF4JXsBHWZY8OkZ7PI5SbqshNXuCOfshpzD1NGIbsN3pR2GDz6p+XaixsDJA18vwSNyIksI7ytN0LDUrqplDnEX4MQv41fxdpMe5+4E46jjrnjtp4763I5mizdUkXCcdtRMY85QNaUWoEEBok6bHX2zdSDt+2fJftpsnGiqYHSeFnzCrAj/OA/lfqWOj7Of/qmJOLnPXLOobG1Vx9DSKYEyw22+z5f+btung7kLGfEsRWcoBKCpirzzm1dLjRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xj/5Zi3zlcBYiqQ01wrfjGr6X3RT1DN1CIcKooCSHyk=;
 b=YlzyP3vaXL6wUGcxBWZamU4PvhzQrMWRWji8guIwaWLRhfhLiHust1frPflHTSaKTvPZjq2I6lWJpLmnmzApQtLEZ4JXKlGCsvfc/0q1R/qLuZ1phTvISscBaeAQ3s3Jahjk/ys7YkgxuSpUfaNpcAZbtRzVX4QdE5q3cmnW9qc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN0PR12MB6294.namprd12.prod.outlook.com (2603:10b6:208:3c1::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Thu, 22 Sep
 2022 06:42:00 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed%6]) with mapi id 15.20.5654.016; Thu, 22 Sep 2022
 06:42:00 +0000
Message-ID: <a29916d7-363a-3524-689c-c9803e940161@amd.com>
Date: Thu, 22 Sep 2022 08:41:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/ttm: clean the redundant assignment
Content-Language: en-US
To: Chuansheng Liu <chuansheng.liu@intel.com>, dri-devel@lists.freedesktop.org
References: <20220922004901.61424-1-chuansheng.liu@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220922004901.61424-1-chuansheng.liu@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0419.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MN0PR12MB6294:EE_
X-MS-Office365-Filtering-Correlation-Id: de509426-87ae-4c4e-6b7e-08da9c658d4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bpQ8r8JTAz/qD3NW1CO9o3loeIf9A0wOYdrmR7MY6QPb/8BMySfa2QA+DDdPHjRE48j/BwUy3cd26usJw7TEGYQjNHnraFsmifuFJXnnLgrjk5tS6nmrw+La2oA/HWmeex9jtlTy/MegtvZ7DNp9zMj/2uspt1qDSU8oV/6JgFJJSY5gtagauu7n8OcR4+zd0e7xthY0eOHKrAdgUFiSWRb6w/rpMYvJ3tzh/ViOGlk09KPlH4qOBRnGbpWHw1frxnMKbfsQCcvu3SCIGgjloAgmm/qPHL65hEaTu2W2MzQnQx4ELLVcuBl6gVZWPcnWXdRuEM9MPQ7q6WZOkMOc1ZVGckVZbAUe88cL8oILu/xfYf3UItlbbSub/iKXGFIrfsmkd1eNNt4H3af5QanlXa71gAjQPeltFZwkaissSJrRdp68Ph6xGpfOi0kLZeX3e5+e9FJ8UyW2/KYknfrY4KOt3W222GW9fteHpm4F+wCfPhHKvOv0I2YFYTtQbtGb2xtJVM5qJ9NPEPdf4J6zvtygkWeceYSa3CNy7lqcP1cv6z7hghPAnjcyzy9l4TJ+wP3ZHxFGvblU26a6MoMX9ZQdROon0rp4+mi8QD3ni6gfQCKzccu2Z8j8SRuUQ16pMlcgOV+nJu3qXLQEjx6f9/0eM+2BazvH0Y0t7lmf5N9ZVYJ2mauHLHAwkyDcDrN/dejqNEl4jxvv6ypgOqIqeHi2yscjmg1kD7ET5rrvx1OwmR12SzRYZVr73WkGNrBwUoaiIbewEMbrMIfgepmWVj0WLtHWM05zaR75Op9B6h0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(136003)(39860400002)(396003)(366004)(451199015)(2906002)(6666004)(66574015)(36756003)(6506007)(86362001)(5660300002)(6486002)(478600001)(8936002)(4744005)(41300700001)(31696002)(26005)(6512007)(2616005)(38100700002)(186003)(31686004)(8676002)(66476007)(316002)(66556008)(66946007)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3k4eTRqK0p2M2ZhZlNqKzNWeTh3eFFTeXNDWFQranBvKy83dXRycnJBY2lL?=
 =?utf-8?B?Vkk0Y21wYWlPOTRCTGNLdjlMU2JQL0NEaWxZUW9PVDdpNHlGYlJHdHFEbWd6?=
 =?utf-8?B?U2RVZ2NrclVVZlZwU0VicFZyU0pFamh4SHFlVzM4WHZia29BNktGdGxOZFR2?=
 =?utf-8?B?K1pVZXFMZ3JCNjU1TlMvQmdONnNRMVFkTnVkbGRYY253VDNwbDdRUWdTZ3Q0?=
 =?utf-8?B?L2xuSThVMTN6QVg5YnB0OCsvOUhZY3lhaVdIbEZHKzN6ZFJLKzNXOTYzeEU3?=
 =?utf-8?B?eVBycUttc2JnV0pKY09qNmRpUW1wUGwrSXRXNnNJSllHNVRrNm00TW9BZ3do?=
 =?utf-8?B?MHNSckIxbExzRGRxazRrbmNIcTBpNUxvcFh0bTFONHU1Mk1SZmVDQnF2Z1hT?=
 =?utf-8?B?Rnc5NGxkZm5mT3pDQ05Ec0E5V2ZCTXRkUDhFcHpUQnZEZDlrYVY2eWNtZDhG?=
 =?utf-8?B?TUJpUytQNUo0emdOOTQxdU5SMnA3aXR3RWJ6L21TcjFxZFVBSExuVjZsUnJh?=
 =?utf-8?B?Zjh2NGpTQUNrYjBLWEh1di9zYmFySnNteFJ1ZTI3OFFLTVl2bXkyd0ltSkxQ?=
 =?utf-8?B?WlhHd3VxOXFBNFN5MlplVUVON2V5TGwwQjRaSitObXhkT21VSDFXWUdFZUI0?=
 =?utf-8?B?dVVYY1F3RitRUytzSEpCR3F0Smo2c3RCSitoSnNxeVYyMmNuS2RwUnBLZjRm?=
 =?utf-8?B?eUoxOXJORFBoRDV4NkVZbVcwTmszNjYzb0tOb21MSFBISDllWks0UEVmR2cr?=
 =?utf-8?B?M3dBeVBnYm9JbzU3RzJFTmhYUW5vNFBKMzB3bWJaRHUxZXhQOWp6VXpDNmQ1?=
 =?utf-8?B?aysyMW1LUFp5VFg4Z1p0V3pUS3BlcGtRc3FWQXBzSGNieEhQeG1GV3ZiUE9r?=
 =?utf-8?B?eUFmeWF0ZWxIUEtCKzVxdFdCKzRlUTMyR1BXWHU5enRLbTFvQkdRZlExMmtz?=
 =?utf-8?B?S0FEU3JoaEhKT3gyZmRCK3lYRUV0TGlSVUlGaWgvZmlWMEpHYnRBS2xhK0R4?=
 =?utf-8?B?NWs2NUZidnVDM1I5QzUrTFlqVGg1L2txN3EvMXJLK0hidnBSWVVNZHZVdkEy?=
 =?utf-8?B?YTZqaU9NRzArWDFYRUJ5NVZXK3JGVDUzaXFsZmlDOGphQWpjeVJES1RaRHZ2?=
 =?utf-8?B?aWhZamNzZzhISDhIbmNJc1FJaExXc0ZKM3hFUHI4Q0t0RmYyTlZnaXlaeUp2?=
 =?utf-8?B?R2Q2QmRESm1ycnZZNFE2dTd6QjFGZFZEREgxTjBlYVFqWlFzazZSMFN0VXFq?=
 =?utf-8?B?ZStTTktGSXVOUEM3dWZZWkJXRkcvQURLTGJzaVlBS1JGb2pWbVVmS0RCRE1n?=
 =?utf-8?B?REN4WEc2WmVxZXA1L3BHNnN3bk1xY2hmK05vT1ExYVNQMmcvRXZ3SFZqODFL?=
 =?utf-8?B?NEY1bFA3dXpFZVZwckhkeEFXYnF3OWhDTVNRZU4zMm5ESENTQzdKUitZYVFu?=
 =?utf-8?B?QjhFc2dNYU5VL2J2ZEp6WG4wbVNhSEZnbysva3dwZWdFbG9pOURuZ0ZjN1Rk?=
 =?utf-8?B?dkNtZm5WQXlPQ0RreGllOVlma0QyN2FsdE9OQldDc2F5RHI0RzRERzgvdW5u?=
 =?utf-8?B?aE1qUEJhSEpFKzBPcVRtL01lcUczNmFzb0ZjNnJCUjV5YVpLSEZMalUyUXd6?=
 =?utf-8?B?RW9ZTXpRMVQrNEpEUmdORXRVcXpvMzBrWlF4N3NBbVJHdjhjdUxSQ2dlL0ZL?=
 =?utf-8?B?Rkh3K2ZNclpwQXBMWkxxTXVqNU5LUWZTRFp0Q0dhbklHK3BHUWY0bVkyMlly?=
 =?utf-8?B?M2w3YThhMEZycjkzc2JLajBKYUMreEhjSjFlYklwanZNemo3OU1qK0t4VHF4?=
 =?utf-8?B?M2diVGFRbFNPTVU4Kzd5RG5rVTUyU1RNZnh4Q3E0MGZUdmpCa2JYUHY4Q0pL?=
 =?utf-8?B?cEZsQ3pIV281cDMxNmNHaGJ4bUdmWUUwS0t1UXB6ck4xSlFIc0NjV3NjaDNl?=
 =?utf-8?B?cVFWTzRYVnlwWVQ3NFVhaE5JZmlMeWdaRmJXOXk1bGZzUnErdkNISWZwY3lW?=
 =?utf-8?B?andpNWJoSXdpblJXcEtldUFvRVZtN0x0cTBjaStaa1Rya01pODEwYWpGMEFT?=
 =?utf-8?B?ajAyaVd1d3lxV1VEU2FPQ0VsaGcvTDAwMUEyRnplaFRMVmpFRGZFUVFRM3hP?=
 =?utf-8?Q?knBMKehWnjMetUoAmpGKQqtv8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de509426-87ae-4c4e-6b7e-08da9c658d4c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 06:42:00.4759 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8XnN77JlAZo4ehicln4cc34f9UE8l+QdA2SjRJ39XvnKKFF5LhTqxIsiF4PO+sVK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6294
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

Am 22.09.22 um 02:49 schrieb Chuansheng Liu:
> Clean the redundant assignment of ttm->caching in ttm_tt_init_fields().
>
> Signed-off-by: Chuansheng Liu <chuansheng.liu@intel.com>

I'm really wondering how this came to be. Anyway Reviewed-by: Christian 
König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/ttm/ttm_tt.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index d505603930a7..e110db86c870 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -136,7 +136,6 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm,
>   			       unsigned long extra_pages)
>   {
>   	ttm->num_pages = (PAGE_ALIGN(bo->base.size) >> PAGE_SHIFT) + extra_pages;
> -	ttm->caching = ttm_cached;
>   	ttm->page_flags = page_flags;
>   	ttm->dma_address = NULL;
>   	ttm->swap_storage = NULL;

