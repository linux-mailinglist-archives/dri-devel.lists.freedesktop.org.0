Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEFA7DBB25
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 14:54:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 507A410E0F4;
	Mon, 30 Oct 2023 13:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2045.outbound.protection.outlook.com [40.107.96.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 947CF10E0F4;
 Mon, 30 Oct 2023 13:54:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KPmuCgjdMls91qehmEu3ZkEx4gOb9vZ58beJiQ+NKg/3XXnnW9YWyTg5UnBhFPJz2el3ak5+t4DTPohimNU3y75biBJuqq4jU6UN22Fp06sGLw4oyLw7EFkvr9JMoKdFX+htGMspXMMxWl90spAvT6bh2/7BuTxewqnem5Xb6RGyhCFYFl+oJ4N3KEzmfEPlDe515x7vhax6d0Y7VmmRyB/Vk6wj/0UxLKp0KJSIbNwpm9ZyBZECF/AX1XTgoMEUrBjOS66EpUhmhMBProXnayWxgtJo4i+MMTpfoL+pPNEUiKNCvea12GmmDDpoETjvjdieqCs/CfnkNgeboDd32Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6fZS+ghr7l8tJ7qgpBUbuX0ahwciCBQKwFQlWxARTi4=;
 b=Q4tBZRK2nCMYCY8L+TqfxJ4ieaulVLTtc8vmHaYh1ikUqJpnLO3tjI6mQc2mj0nhzirdRUCAPg+lrNVnGIJATl36D1wCAgq4dy1fH4YjftT4sao7DuFkFBUMHFo22T19cKFotDXBDgWNU8eQoHMwzsnuJT5j0y0FfqX2ck1jtrjQOApYkFDnpQrtezFIpQJEWbVqwJVfYmvLNVLMStcKXVI3sLTIwCu9MLKPqm+RqhKtZpjErKSmWcPHIs+1ZXRuZ5pFakATkEacoYzSEsTnracINUxHO9/ZUNAYqBPiKnqMfn3UhQszvNkXZs5kpVOZ3tTiwyPJePJhty3VE+UHpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6fZS+ghr7l8tJ7qgpBUbuX0ahwciCBQKwFQlWxARTi4=;
 b=MKpJI7hLqyEqlT5k6laJpFV53/MBpvGfZoXdy/mS1q8gXsW3IBffZ7RDiWzQJr69OmJ7LsWCHaERD7pd3f2NSXYb933l0iTYoJSjdUqZPLW+pBX7nbrIFrslxYQDubeVPYRJwMHdTDt0UlprgJIfzXdHxXAUE+KM4Mi/rBDkqos=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5284.namprd12.prod.outlook.com (2603:10b6:610:d7::13)
 by MN2PR12MB4533.namprd12.prod.outlook.com (2603:10b6:208:266::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.26; Mon, 30 Oct
 2023 13:54:15 +0000
Received: from CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::33ed:3162:e4ed:3569]) by CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::33ed:3162:e4ed:3569%6]) with mapi id 15.20.6933.028; Mon, 30 Oct 2023
 13:54:15 +0000
Message-ID: <d56cd927-49fc-cb4e-8abd-abc539e4d276@amd.com>
Date: Mon, 30 Oct 2023 09:54:10 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: remove duplicated argument
Content-Language: en-CA
To: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 skhan@linuxfoundation.org
References: <20231029093926.137766-1-jose.pekkarinen@foxhound.fi>
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
In-Reply-To: <20231029093926.137766-1-jose.pekkarinen@foxhound.fi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQXP288CA0020.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:41::49) To CH0PR12MB5284.namprd12.prod.outlook.com
 (2603:10b6:610:d7::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5284:EE_|MN2PR12MB4533:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bc89c14-6105-42e6-59ac-08dbd94fb400
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ELuE7TohiQKPKOUAv9mXKT0DAUrevXdGIlwtKbtTn2NRMQOVbiUB1spz+vbjec12JaAM6vnefW0pxt80TmGAu0tkeB151NeXQFaP02cDlz7aXS1Rr2rhlruQvNCUtIjXeKAZA/1P8hYc1am38WNlSuLtk7TivE5RV8DwlyaWAm+peF1dusXHk8O4dQCeGnilohmnkldmAETwryiYFi8ftot/zwO5HnKUijK1WvyT+ripLKEYt0s+x5LpyOAur/JS75r2ArdFwp3RNpXCu9M0DNvp5G1UKCgUdHrVn7XGWGwmctc5loq/2RoF1cCoyXNoInrebsjgwH48W9fSRMXGIj7AJfef6vyIRP59ChYa+mvTNak7LX67G2AX7P18TOlJryMoB8Pm75r33eW8i6jrfcwwKmdfUk6Qm+7E/DcjPFyFOQK5852p4b14EGtHerhfJZH/LYmJAEXECv52zjIIdqqKT9NJMnPxanIiI9TAyn8gVRV7lh2zJFQ+u2PanbgpWACsKG7DozcAZd+HSXFZRW9ijOmVkeQZOHJV3HMsw4eruXtNxpm2tsE1d0JfIp3ULBWD6iwY814t0mXWmXEAn9C69wk86bsP8CXHB10GWYT1Hs7YRge2CafNYkE2VTm1/lpoQVR9FGNF+qv5mDlt1w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5284.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(376002)(346002)(39860400002)(136003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(6506007)(53546011)(6666004)(6512007)(6486002)(83380400001)(478600001)(26005)(2616005)(2906002)(5660300002)(66946007)(66476007)(66556008)(8936002)(44832011)(8676002)(4326008)(316002)(31696002)(86362001)(36756003)(38100700002)(41300700001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWxPUHFwam9sNWpObTE1c0FleUxUVHZFNU5Vem9DUHVXUGlPNnI3NE8rRHR2?=
 =?utf-8?B?MXN5b29oWU5FbTlxbGlqVzRVaXltUjBoakVlNmZnUW9YTzJIOU9XUFlRai9m?=
 =?utf-8?B?N1lTTTJjV2U0TGtmbUFZZ25KZ21acmNkdEczZnQ4aG5aRmM0cHJMMlpkRkJL?=
 =?utf-8?B?STB1bC9MTmovM1NBbkZ5TGFOZUJML3BEOVE0MUJEOGc4d1ZDTDRNb3lKeUpD?=
 =?utf-8?B?cC9zK081M1NnUVBUM3B0YlZwRG55c1RRVm5IQ212OUhHV09ac1YyR0k4QS9k?=
 =?utf-8?B?dWdBN3h6WWpSMzZtdmxuYU9aeWhaa3c5SWlkZjZ2ck9HWmpTWXNsUlBUZnVa?=
 =?utf-8?B?aWxPZUZMaFZoK01aYjR4cElnYjFTaldRS2czbkVmTkhwZDBpUEp5RitqbjZZ?=
 =?utf-8?B?dEVkODZTaUV0ZjhVd041YmNFNWQ4ZDdZUTNnZVg1TS9pQm94c2RJZWVxdkhv?=
 =?utf-8?B?ZG55ajZNZGUwakRtaHpycFo5ak8wSXhoRVJXVUY4VkNSdmNYK1BCMmZ1S2tQ?=
 =?utf-8?B?UGpScVNHYXNaS3BnQVIxZjcreGRGZzhLWnd3Q1orNG9rRGRKK1gvdnB0SzFu?=
 =?utf-8?B?elIrWmZURkpRSFpUYTZjeGI4M0VYSmxBV1pIeWRqN0szTlR4U2huT2RxTTBp?=
 =?utf-8?B?N21Ubm1UUFhXMUV0WHhZcEVJQ3hocXFORkU5THdjVkZMWDVWVlJCRGxQT0dT?=
 =?utf-8?B?bTEvSnZMWTJFYXlkeHJJaG9WeFg0LytqN2g2OWc1OFJSbE5nK2wxS0xJTXpj?=
 =?utf-8?B?aWM3RTUwYTREa1V6QTdTMGF5YnZTY1NZczhWRjdhRzA5ZDVmakVNMG9hVlhk?=
 =?utf-8?B?ZXdoSExCakRxU1hneDdMdkQ0UWZTZWF6WDFUS2wxcGtMM2VacktNY0lmb09Q?=
 =?utf-8?B?c1VkbXM1R3VKSGExWTFTMkI4ajBSaG9pYUJkcVVlUTBGZW1KQjFWNEhLY1hI?=
 =?utf-8?B?YnErNnk5d2RUVXJHVUx3bk5ZRi9YeEdXbStSZFNZRFE2emsyVU5rWEdzS0hL?=
 =?utf-8?B?TldyTXg1R1pqa3pXVTZ5UDFMQVo2QVBtVnZ3STNYRGFYSGRPaytGdmZ0ZGp1?=
 =?utf-8?B?MEV6S2FyMmc3M0h4RVMxemY2R01BaUpSZmlMSXVHNU9OSk5iZS9RM2dnZVRv?=
 =?utf-8?B?bktNdGphZHhrTXlNeEpleGU3NWhaSFUrUjlkSUNMNVZvUlFCbXQ4UWQ5aEhx?=
 =?utf-8?B?aklTdHhPVUJhRUdZZ1NMYVUrd01PT1RtQzZRRjllWmxZdDN4bDc0TldSZnlN?=
 =?utf-8?B?bzFvbmlyRHJHUXZZVzRkTk0yNUM0RjJ3dXJ4VlFhRnoxemVQUzl4R2ltR1VT?=
 =?utf-8?B?c1l2NjJlSjkrdjZDTWZZaHdTdGhTbElDT0dsRFVmSVJVdEhmSk8rUlhIQy9v?=
 =?utf-8?B?cEdza1JrbTZhQlRNVXV1aHVWTC91dDlUSnB5TVNqR3hMYlZRRWlGRFkvbW1q?=
 =?utf-8?B?YmpaWUtNV1Qvb3orZFNZZ1R2TjlnZmMzODRPYTJuYkFwVXBJaXE4dXBEMEVs?=
 =?utf-8?B?MFp3Nkszd1NVdFo2SkF4V3EyM3JpQ0RXU0JCQXZaZE0rZWJMcmZsY1Rpdzkw?=
 =?utf-8?B?U0o4c2xQVWR4dmVXQytPOG90MDhkYUttWStjQTJqVklOYzJlOFl0ODVvU2lr?=
 =?utf-8?B?RFZIcUxVK28vMUhtT3UxZW1NeTBQclZZdnI5dHh3YUJDVlk2UFZiclo0c3dm?=
 =?utf-8?B?dEhiaWU0S2JRTmR3Tk8rNG01dnVUNkN2UW5paGV6UEZIY2NXclpKcTZ6NUhq?=
 =?utf-8?B?cXZYb0FZUUUvdktITTBWY3l3dDdTYXo3bUdTQWdQbDB5UEEzdHNFS1phUGVt?=
 =?utf-8?B?d1NvczlENDVyQ3pNMkkvV1p4QTdTcXVYcEx4NDhlZUFHZkhseUtnLzhiQnA3?=
 =?utf-8?B?b0g1WmF1dVo5TzZBMVlCMXpEaExUbGlEV3p6N2M0ODNLUU9BYXNPK2Q0cmx2?=
 =?utf-8?B?MlZBejg4eXhvdEF6Qk9rd1ZoQjRwRmxxWTdIcDZleC93bE5EM1BmeFJPYk11?=
 =?utf-8?B?YWVwV0xIVElYS2x4cCtNTENwcUU0UnA0T21lU05tUlhlanRyWnIyQkMwTnRL?=
 =?utf-8?B?YmN4U0xwSnNxRUxickgrQlVNQjJPamdVUm00VlVnOFpCSDJRamxQTkY4bFNu?=
 =?utf-8?Q?KbbiyTo92Xh4qvtJLZz6V2GsR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bc89c14-6105-42e6-59ac-08dbd94fb400
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 13:54:15.4468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mnp4L/TylTaRlH4QSEg6vBVvP8h8Oax1RSI7cjxmq2q5736eVntxbZK3K/sRziigxI7Z1sApyfWNI1J0c9pKBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4533
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
Cc: sunran001@208suo.com, alex.hung@amd.com,
 linux-kernel-mentees@lists.linuxfoundation.org, qingqing.zhuo@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Zhongwei.Zhang@amd.com, Yao.Wang1@amd.com, dri-devel@lists.freedesktop.org,
 Jun.Lei@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/29/2023 5:39 AM, José Pekkarinen wrote:
> Spotted by coccicheck, there is a redundant check for
> v->SourcePixelFormat[k] != dm_444_16. This patch will
> remove it. The corresponding output follows.
> 
> drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c:5130:86-122: duplicated argument to && or ||
> 
> Signed-off-by: José Pekkarinen <jose.pekkarinen@foxhound.fi>
> ---
>   drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
> index ad741a723c0e..3686f1e7de3a 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
> @@ -5128,7 +5128,7 @@ void dml30_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>   			ViewportExceedsSurface = true;
>   
>   		if (v->SourcePixelFormat[k] != dm_444_64 && v->SourcePixelFormat[k] != dm_444_32 && v->SourcePixelFormat[k] != dm_444_16
> -				&& v->SourcePixelFormat[k] != dm_444_16 && v->SourcePixelFormat[k] != dm_444_8 && v->SourcePixelFormat[k] != dm_rgbe) {
> +				&& v->SourcePixelFormat[k] != dm_444_8 && v->SourcePixelFormat[k] != dm_rgbe) {
>   			if (v->ViewportWidthChroma[k] > v->SurfaceWidthC[k] || v->ViewportHeightChroma[k] > v->SurfaceHeightC[k]) {
>   				ViewportExceedsSurface = true;
>   			}

Thanks for catching.

Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
