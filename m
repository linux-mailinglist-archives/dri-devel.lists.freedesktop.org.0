Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE6B857B89
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 12:23:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 667BD10E4BF;
	Fri, 16 Feb 2024 11:23:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="22F+wEuP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2063.outbound.protection.outlook.com [40.107.101.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA38C10E4BF;
 Fri, 16 Feb 2024 11:23:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kmSXRNp2EGxsRxqX5ia7mA40PSRTEqcBYXzVtSKBMjFFji8Yda1K2J51KnGuUoloNawUgYPvoyG8nQ6ZFVk24HJggXDTLnP6R2cUm42ETmc1zrv1zRPfNZ9ENACunkmdENMILzFhqr1WJNmC452trmSYSQzxyohTCBp7ryHiMtGL9FS9/k8q8NnRleqnAVhyIbXUidjXzJh1ie+OKNnycwB+VQXZ6SAZu8H6avebbx5yVi8h4Wk45vXR2VP5mcrcDAcEUtMsGb3JdSsCWhi4+yt945W/JP9aOLKTE8RJzCaGThPspdaLA9IoHzPu9NecZ6H2SVNnfjg/IYJUO0u36g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rtRlbMnanYULBhgkjLdBJ96DoU8ah32aWn6SNr8wZVo=;
 b=VeoeEe4pUmONlT1Q6CADkKRQCY9DopgLPMYLGHZjsC/C8NedUKma0w+mkt3zTT2adm5H6Wi5qFB6Cox1VJ9Y2O2UAHA2J1vWvGDadPTx8uhdPxNbwaocVXqnnVhkv99CmON736T2x7+VsOjtv3yBH08z0/5VwheXZaErJmJauOzrCJ5XhOIG71ueB0+dZJwjR5GRk3+QAmDIrOVe297dLGaNoqC2tbkK7qajO7zj+4Uvcl0YAD3kjCDLeaFUhTF78NsIbaYefma5SwYCf41XgUANmtSYbBQzvoW7lKLeCVGcFnsRjQElhF1uAEXbxXptfym/NCEaYqJwMM5Kks9bgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rtRlbMnanYULBhgkjLdBJ96DoU8ah32aWn6SNr8wZVo=;
 b=22F+wEuPxTdixlxIEWPeXGddy3uVi/oh4zr+OgrBPPA70JUlRB4ePVuDQ1joiYWiRTez3k0kIxkPBeO+JTd4Pk3Gy5kbVhOt/7YjQ53Faja8FF/4zY9PGVm3d/14a4CRCEaYavgfXG92Qc2JoTZaS3cFTu6isdWDIShELj5Ojwg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by IA1PR12MB7544.namprd12.prod.outlook.com (2603:10b6:208:42c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.14; Fri, 16 Feb
 2024 11:23:45 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::e3ee:6c2c:4e87:a6d6]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::e3ee:6c2c:4e87:a6d6%5]) with mapi id 15.20.7316.012; Fri, 16 Feb 2024
 11:23:45 +0000
Content-Type: multipart/alternative;
 boundary="------------JeGxHCGedouUf7VKHfSomBk9"
Message-ID: <992b9dbb-f4d5-9de6-0d07-7378178d5b40@amd.com>
Date: Fri, 16 Feb 2024 16:53:35 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/6] drm/tests/drm_buddy: fix 32b build
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Geert Uytterhoeven
 <geert@linux-m68k.org>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>, Maxime Ripard <mripard@redhat.com>
References: <20240215174431.285069-7-matthew.auld@intel.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <20240215174431.285069-7-matthew.auld@intel.com>
X-ClientProxiedBy: PN3PR01CA0042.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::7) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|IA1PR12MB7544:EE_
X-MS-Office365-Filtering-Correlation-Id: f2be8576-0036-4165-2c48-08dc2ee1bce2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gLzYN/2/id8FbCRpcsB4GNroCcvHAjIIYwzk40aetSXTyUw2jeo01uwTcwZ5NLEly1bBii4wEMH7mlBCvDgJQ3LtPTC2X7zMO3dW6HcGVg4Q78B3iPSiTcaInGuv49dwijefrnTu7I2OyT9syqFXOH80t7qMLSABj3Po3lWENq+ZyxOnwouxIHb7NtOzwDyuPZONrVNF0q31EGsioH86C7A2DeIWtZbL/c40tZtHknJzLqts6enFo/vOqwzBpCX+AWESvJTGT3EYAHa/O1kwBNibajihOnRCKD/9Y9guDskgJkF66eOXumz7xqqb4Wt5gPemAucLmyi4s/IjC62sJ1i+IEqAyd+7qd3MHK0KiXTCBVmvwvUyNmLU4eE7kyUa0oE/jDxE8FjB0HKmKD7nQse8O6H3hNytccYRb66hQSHEqzkLpffeDrZOvmanRRrzJ/iSkPWprk8LFTFLznm+A9XoB99yYITosGjkivFwdJ410BnntWusTdLO7C8qEmZmNShGdyVknmpl6gDlkngfQ8E4fRfVGZD6m8VwX2aVivlVM41fAhqT+urB3QthMyCH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(136003)(39850400004)(366004)(346002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(31686004)(2906002)(5660300002)(26005)(83380400001)(2616005)(36756003)(38100700002)(6512007)(6666004)(478600001)(53546011)(33964004)(6486002)(66476007)(31696002)(66946007)(54906003)(66556008)(316002)(6506007)(66574015)(8936002)(8676002)(41300700001)(4326008)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWFFYnVzM01PTkNOSDJ0dlNnUW80ZGVFV2VSamVWRzBCV1F3bGwzdXlQTHNL?=
 =?utf-8?B?b2tTNWh4NDFOWExIL3VVeXRBU3VlUm9STWRSZWY1VHBNUEdpT0xrR3d5ajlx?=
 =?utf-8?B?M3I5R1BOWTVjM3N0ZVRCY1gwVi9HWVhtbDg5TDJyL21LS1F3RjlvczNWYlFM?=
 =?utf-8?B?Y3pnZ0xBN1ZOMzZvQmdiOTVOUWJnNlFMR2h0bEUxYnN3L2IycUlxMnVvVlNw?=
 =?utf-8?B?R2FEa1JTYmVuMVVpLzMvYm5LSC9iOUYzRDJDd3ltYXhsSlBDRWNlZU1JUzJu?=
 =?utf-8?B?Y3RUYkdrWHVXQWJNTUJpWHVSQTJZTUFXaGU5WTc1eW1FcXdPN0pEdjFsRjJM?=
 =?utf-8?B?UTIwOXBwTWsxU2dzM0pNUDFub2NTWEk1dXVxMlhtMHYwNmUxWk9wKzQxaitM?=
 =?utf-8?B?Znl5S3RnSk5CV3NIRTVEaUFNbHVvNWprcWYra1drNTlXQ0lGRGo4cHNUMVlt?=
 =?utf-8?B?SjlqMWl0c2tYQ3Y3U1Jxayt0TjMwc1B1czVlcU1HSmJZdE9NL0N4NXVXRlpM?=
 =?utf-8?B?ZDRaVnBva3BucEZYNGJiYXM2YVc1QnVOTTF6b0dmUjBBbFNWVlVBOHR3d3NS?=
 =?utf-8?B?bTF0UGdEUmxGQ3ZrMXRybXpEZU96MlJzN2xqdzQ1K3FzeVMwL1JGYVBvcGNO?=
 =?utf-8?B?MzEyY29RWkpVUmN6TDhwUVd0aGgwT1J6QW4rTnVHdVJmVkw2T1RCa3VYVG4z?=
 =?utf-8?B?VklEUDZjQlk4NFFBbmpjVVpFZkI3Y2NYRS8rUUdPT1dxa000YXZjVWFscUsr?=
 =?utf-8?B?TFl0VmI2TVpCbzQvOVNrRXZaTVRHd0VheE4rb0U5YlZwa1N3K3kxK1RCRHVW?=
 =?utf-8?B?WFFpRi9iYWxMcUhpRFkyQTJHWVdJeUprdk0rRTRWbHZHdGozdEVNd2pzWEVh?=
 =?utf-8?B?M2xPUW5DZVFvSFZoNjVkNTZyOXNTQnNRRU5GZ09TL3haZzNTTDR6V3RHWkVG?=
 =?utf-8?B?cm16M2hUcG1aWkt2Skpoc2dveGhMRWZiZXpiTWN6M0JVblBiRlNGcW15Ym1B?=
 =?utf-8?B?SVBCZHR5R0w5bEFxYkMzNExCdHVwOVBaYXdjbWFzN01yWDNBdnFBWGdWUzRa?=
 =?utf-8?B?VE41UU84L0tnWUZuWEpvaXhzNWNicGVYRk10L3R6TTZERFREL0RMeFdlVURu?=
 =?utf-8?B?bk40SW90S1grME9YR2plNWNDR3hkSkdYQ3g2M3F0Z0diTHNRRytwQlRXUXRk?=
 =?utf-8?B?RC9FYU82QitCdkpvUXVEdjcxck9mb2hJYzZHREtEWUl3cm14QnRCRmpzWFIy?=
 =?utf-8?B?S3lodm1Sa2dzTFlqNGYwK2dqaWZzZGxoUlRWWDdqM052Zks3VS9Cem5rZ01V?=
 =?utf-8?B?K2J3SFo5dUltb3BPQ0xaSkYwUUc5YUpKZXhQQ0ozNk12Y1FNb09pdWhRR2Yr?=
 =?utf-8?B?b1dyeUhuMUhBT2J4dHZ3ZnlQT2paT00rVG1KTFFkbDR6ODNtN21hRHZ3SEx4?=
 =?utf-8?B?ci9sMWRYK25vQmlyWU1jK3N6N2tic1hQSENBcmxuMzlVYktxT01HcTdTM042?=
 =?utf-8?B?U0JwT1B2MGZFZDZJZ0FmMlBoZWZtR0dxc05ma0RINnhiTm56ekRsMHBNZE50?=
 =?utf-8?B?MUdMSlE2dGxKQjA3Mk5BajZ3MlQwZklWVldlekFZaFY5QmxBbEsxdlROaGUz?=
 =?utf-8?B?NktoUHgzS1FwU2ZOUjBoTVhvOUU0dkFxSm1KdTBWOTZvQ00xYUYzcDlJckM3?=
 =?utf-8?B?MTc0VWFOeXlrdG1ia0FEY1RSWFVZd2dFWURIWldOcWRja3hwWjZoWk85NG1J?=
 =?utf-8?B?ZklBNTNnZzM4bTFOTjFuaDduUFF6dHpQanBYRjU4LzRCTlBURXlSTUZ0TjI2?=
 =?utf-8?B?dU9IUVp5K1Jlb24rTGsrL2M4a2hrVTVuUlppNXZxUmUyakNEZ1orL3VxS2ZO?=
 =?utf-8?B?YnJvZjZSM0g0d21haURBLy9Kbk5qWHR1clZrckxWV3lhZWFZTVFSVVFkMlNr?=
 =?utf-8?B?Ly9GaXJTbnlSdFY2KzdudXpNVk9BLzZpcEx1dmduK3FRSXhaYlRVZWczazFz?=
 =?utf-8?B?aXNrL202V3p3OUE5OE1RcHBvNzNZaU5TdmJsTFBSeGVtRFhzQUdIN1hlZ0RO?=
 =?utf-8?B?VzVPK2FQc0M0dEVVSVVyMUpyd3YxNzFtTHd4YSttYVdyVUY0NzRKK0UwSHo4?=
 =?utf-8?Q?xOSwIQnATsblnynOPxpUK6nm4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2be8576-0036-4165-2c48-08dc2ee1bce2
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 11:23:45.6404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qAoIvqy3QGqS/lBt9KifH2nnLsTv+W+iaSWrdbRUDmWPMZMCAwzwFlWe6K0leKcI1qQdRpKceorfzYAfxYsosA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7544
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

--------------JeGxHCGedouUf7VKHfSomBk9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Reviewed-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>



On 2/15/2024 11:14 PM, Matthew Auld wrote:
> Doesn't seem to compile on 32b, presumably due to u64 mod/division.
> Simplest is to just switch over to u32 here. Also make print modifiers
> consistent with that.
>
> Fixes: a64056bb5a32 ("drm/tests/drm_buddy: add alloc_contiguous test")
> Reported-by: Geert Uytterhoeven<geert@linux-m68k.org>
> Signed-off-by: Matthew Auld<matthew.auld@intel.com>
> Cc: Arunpravin Paneer Selvam<Arunpravin.PaneerSelvam@amd.com>
> Cc: Christian König<christian.koenig@amd.com>
> Cc: Maxime Ripard<mripard@redhat.com>
> ---
>   drivers/gpu/drm/tests/drm_buddy_test.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
> index fee6bec757d1..edacc1adb28f 100644
> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
> @@ -21,7 +21,7 @@ static inline u64 get_size(int order, u64 chunk_size)
>   
>   static void drm_test_buddy_alloc_contiguous(struct kunit *test)
>   {
> -	u64 mm_size, ps = SZ_4K, i, n_pages, total;
> +	u32 mm_size, ps = SZ_4K, i, n_pages, total;
>   	struct drm_buddy_block *block;
>   	struct drm_buddy mm;
>   	LIST_HEAD(left);
> @@ -56,30 +56,30 @@ static void drm_test_buddy_alloc_contiguous(struct kunit *test)
>   		KUNIT_ASSERT_FALSE_MSG(test,
>   				       drm_buddy_alloc_blocks(&mm, 0, mm_size,
>   							      ps, ps, list, 0),
> -				       "buddy_alloc hit an error size=%d\n",
> +				       "buddy_alloc hit an error size=%u\n",
>   				       ps);
>   	} while (++i < n_pages);
>   
>   	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
>   							   3 * ps, ps, &allocated,
>   							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> -			       "buddy_alloc didn't error size=%d\n", 3 * ps);
> +			       "buddy_alloc didn't error size=%u\n", 3 * ps);
>   
>   	drm_buddy_free_list(&mm, &middle);
>   	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
>   							   3 * ps, ps, &allocated,
>   							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> -			       "buddy_alloc didn't error size=%llu\n", 3 * ps);
> +			       "buddy_alloc didn't error size=%u\n", 3 * ps);
>   	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
>   							   2 * ps, ps, &allocated,
>   							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> -			       "buddy_alloc didn't error size=%llu\n", 2 * ps);
> +			       "buddy_alloc didn't error size=%u\n", 2 * ps);
>   
>   	drm_buddy_free_list(&mm, &right);
>   	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
>   							   3 * ps, ps, &allocated,
>   							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> -			       "buddy_alloc didn't error size=%llu\n", 3 * ps);
> +			       "buddy_alloc didn't error size=%u\n", 3 * ps);
>   	/*
>   	 * At this point we should have enough contiguous space for 2 blocks,
>   	 * however they are never buddies (since we freed middle and right) so
> @@ -88,13 +88,13 @@ static void drm_test_buddy_alloc_contiguous(struct kunit *test)
>   	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
>   							    2 * ps, ps, &allocated,
>   							    DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> -			       "buddy_alloc hit an error size=%d\n", 2 * ps);
> +			       "buddy_alloc hit an error size=%u\n", 2 * ps);
>   
>   	drm_buddy_free_list(&mm, &left);
>   	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
>   							    3 * ps, ps, &allocated,
>   							    DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> -			       "buddy_alloc hit an error size=%d\n", 3 * ps);
> +			       "buddy_alloc hit an error size=%u\n", 3 * ps);
>   
>   	total = 0;
>   	list_for_each_entry(block, &allocated, link)

--------------JeGxHCGedouUf7VKHfSomBk9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt">Reviewed-by:
      Arunpravin Paneer Selvam &lt;<a href="mailto:Arunpravin.PaneerSelvam@amd.com" class="moz-txt-link-freetext">Arunpravin.PaneerSelvam@amd.com</a>&gt;</p>
    <br>
    <br>
    <div class="moz-cite-prefix">On 2/15/2024 11:14 PM, Matthew Auld
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240215174431.285069-7-matthew.auld@intel.com">
      <pre class="moz-quote-pre" wrap="">Doesn't seem to compile on 32b, presumably due to u64 mod/division.
Simplest is to just switch over to u32 here. Also make print modifiers
consistent with that.

Fixes: a64056bb5a32 (&quot;drm/tests/drm_buddy: add alloc_contiguous test&quot;)
Reported-by: Geert Uytterhoeven <a class="moz-txt-link-rfc2396E" href="mailto:geert@linux-m68k.org">&lt;geert@linux-m68k.org&gt;</a>
Signed-off-by: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
Cc: Arunpravin Paneer Selvam <a class="moz-txt-link-rfc2396E" href="mailto:Arunpravin.PaneerSelvam@amd.com">&lt;Arunpravin.PaneerSelvam@amd.com&gt;</a>
Cc: Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>
Cc: Maxime Ripard <a class="moz-txt-link-rfc2396E" href="mailto:mripard@redhat.com">&lt;mripard@redhat.com&gt;</a>
---
 drivers/gpu/drm/tests/drm_buddy_test.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
index fee6bec757d1..edacc1adb28f 100644
--- a/drivers/gpu/drm/tests/drm_buddy_test.c
+++ b/drivers/gpu/drm/tests/drm_buddy_test.c
@@ -21,7 +21,7 @@ static inline u64 get_size(int order, u64 chunk_size)
 
 static void drm_test_buddy_alloc_contiguous(struct kunit *test)
 {
-	u64 mm_size, ps = SZ_4K, i, n_pages, total;
+	u32 mm_size, ps = SZ_4K, i, n_pages, total;
 	struct drm_buddy_block *block;
 	struct drm_buddy mm;
 	LIST_HEAD(left);
@@ -56,30 +56,30 @@ static void drm_test_buddy_alloc_contiguous(struct kunit *test)
 		KUNIT_ASSERT_FALSE_MSG(test,
 				       drm_buddy_alloc_blocks(&amp;mm, 0, mm_size,
 							      ps, ps, list, 0),
-				       &quot;buddy_alloc hit an error size=%d\n&quot;,
+				       &quot;buddy_alloc hit an error size=%u\n&quot;,
 				       ps);
 	} while (++i &lt; n_pages);
 
 	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&amp;mm, 0, mm_size,
 							   3 * ps, ps, &amp;allocated,
 							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
-			       &quot;buddy_alloc didn't error size=%d\n&quot;, 3 * ps);
+			       &quot;buddy_alloc didn't error size=%u\n&quot;, 3 * ps);
 
 	drm_buddy_free_list(&amp;mm, &amp;middle);
 	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&amp;mm, 0, mm_size,
 							   3 * ps, ps, &amp;allocated,
 							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
-			       &quot;buddy_alloc didn't error size=%llu\n&quot;, 3 * ps);
+			       &quot;buddy_alloc didn't error size=%u\n&quot;, 3 * ps);
 	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&amp;mm, 0, mm_size,
 							   2 * ps, ps, &amp;allocated,
 							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
-			       &quot;buddy_alloc didn't error size=%llu\n&quot;, 2 * ps);
+			       &quot;buddy_alloc didn't error size=%u\n&quot;, 2 * ps);
 
 	drm_buddy_free_list(&amp;mm, &amp;right);
 	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&amp;mm, 0, mm_size,
 							   3 * ps, ps, &amp;allocated,
 							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
-			       &quot;buddy_alloc didn't error size=%llu\n&quot;, 3 * ps);
+			       &quot;buddy_alloc didn't error size=%u\n&quot;, 3 * ps);
 	/*
 	 * At this point we should have enough contiguous space for 2 blocks,
 	 * however they are never buddies (since we freed middle and right) so
@@ -88,13 +88,13 @@ static void drm_test_buddy_alloc_contiguous(struct kunit *test)
 	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&amp;mm, 0, mm_size,
 							    2 * ps, ps, &amp;allocated,
 							    DRM_BUDDY_CONTIGUOUS_ALLOCATION),
-			       &quot;buddy_alloc hit an error size=%d\n&quot;, 2 * ps);
+			       &quot;buddy_alloc hit an error size=%u\n&quot;, 2 * ps);
 
 	drm_buddy_free_list(&amp;mm, &amp;left);
 	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&amp;mm, 0, mm_size,
 							    3 * ps, ps, &amp;allocated,
 							    DRM_BUDDY_CONTIGUOUS_ALLOCATION),
-			       &quot;buddy_alloc hit an error size=%d\n&quot;, 3 * ps);
+			       &quot;buddy_alloc hit an error size=%u\n&quot;, 3 * ps);
 
 	total = 0;
 	list_for_each_entry(block, &amp;allocated, link)
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------JeGxHCGedouUf7VKHfSomBk9--
