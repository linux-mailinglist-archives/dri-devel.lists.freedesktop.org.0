Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D50971F356
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 22:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F25210E5BC;
	Thu,  1 Jun 2023 20:02:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8060210E00D;
 Thu,  1 Jun 2023 20:02:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PtmD9X1FtDOeoIbd6c5slhEQAwVcn3eZzB1o0g9WeAV1wOzn/v/3Fulmw96gSlbJtgZyfH81gGDLKoH4J74LIDlLC6EXiufhYicfk+oXWrRUYO0GW5sDCH+Xoc1VKaLtAFdz/3RelQxI2gLkvVQyX9IdN2JRNDdUWjO75yFwbTXulUdeYmR2Nkry3QQw5WHa0BV9aw/rQxTF+fDRRxMN/nIriMIatL6OTfyGrz+JuJe7CxkUsqMpDA+rPeMPncZmYigBL5i1DozMUbopK6Gvhbe4jbLDXTjpA8dmE9eICXKtJgJPN9xuN//fwHwGzHlbahjA+6y5TvR6KZibeeogLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bx9jmB/J+G0d4c+eLB09i+cNOaX8h895PVE83dtlZoc=;
 b=CKk7R10KWx3TXDEWpv3ci9jaTrFqdFgHDvfl9JFzREFkpFCIsO6eOYjqvWE3ARAdsQmEhxqpUEZ9670sXWADHH+B6Uhoc7m4dlrC1xFW/CKmECcBvgeD66CPdITptJXOa99AHsSeNLmE1qU3uIByDBZ+bYyoY/B9nALDtLnVIlbauTj0Ry+Ltyx1SXV6XFGNDdzMVm4fFjzhV3WIARVyCE7iibeMxVAOG8hdvBaquctrdmSHC291cAhEMk8j4eUioln8AnZnI7fKnFNI4d0XdJ1SD2EhoSSR5sdoHO2bVY5O2R4sn2+7DVm/X/RnrP3h+3y9dDcGLK+nGw2pUyx/kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bx9jmB/J+G0d4c+eLB09i+cNOaX8h895PVE83dtlZoc=;
 b=V/dvAbgL/TWtdbeyxxVS5Dqskmiy67oXhTn0wDaD+BWOQfafIsfjfq1YNcKq4WSyrHwtw7p0c5B1HIUo7NT1LlyRna8Wpyqw5wz9deaWLUQHPtk5K2sA0CNUaXD6uG+hSHehTlqMsdwRtEVSh3ALVADJrGIJRJA3nQq218RevLo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5112.namprd12.prod.outlook.com (2603:10b6:208:316::16)
 by PH7PR12MB7187.namprd12.prod.outlook.com (2603:10b6:510:203::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.26; Thu, 1 Jun
 2023 20:01:52 +0000
Received: from BL1PR12MB5112.namprd12.prod.outlook.com
 ([fe80::5c06:6ce6:fe4f:41da]) by BL1PR12MB5112.namprd12.prod.outlook.com
 ([fe80::5c06:6ce6:fe4f:41da%5]) with mapi id 15.20.6455.024; Thu, 1 Jun 2023
 20:01:52 +0000
Message-ID: <16959c51-5877-07b3-7451-f620fa32724a@amd.com>
Date: Thu, 1 Jun 2023 16:01:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH -next] drm/amdkfd: clean up one inconsistent indenting
To: Yang Li <yang.lee@linux.alibaba.com>, airlied@gmail.com
References: <20230531020811.110744-1-yang.lee@linux.alibaba.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20230531020811.110744-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0013.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:85::12) To BL1PR12MB5112.namprd12.prod.outlook.com
 (2603:10b6:208:316::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5112:EE_|PH7PR12MB7187:EE_
X-MS-Office365-Filtering-Correlation-Id: 58401c2c-d472-443d-c5c4-08db62db0aaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5nKHNNYD3fjL4AqAX8rS7NdsGOO9e3ouX96sKBwj/SW2ABmbcp4OFKVACYU0m1ZbbUHglKNYJYM9ltWS9dcKGhNHVs1U/wDZz2wERlJGKiY6RxGBPs/gkEk3pQKTshBgACbf1oMtfWS6MZ8dTH2Hhsyf6yZR1Ok3gQf/p/QeHGZuKjHV5IAnLys4BUP3t3aROqYXV3o7mXNELMNYiQ78lTXpQePwpA+DhkPGxOtPYShe+wIqe+onhQ2b9Rcg+cbDGPJAPL/DMQ2FM/FEBLw+AMFdk/NuHy/tWEOD9uVT3gMIa/dUKi2eSVcLe682SSGaoCii9egqdO/Aj0sMiI+cptMTxxMZqnFszxnqNDs1gyrfKuRH2lrGVuMPPA1sP29wZRytF/600enBlAt/1i5qD+k4pSSeyTfU4RjMHIA8iyDO7rUhuCgOeqK1EvVnDYSTxT49HWJj1iBIKAUOPYMSOP9N+PllvsXV46KiKdxwwrvOVtq3I7EiBfsoRfdpLPaTB8qb2tlOFt5+ksADZ+BGL+AUHoK7r1sYbiCPkbF/3QH0vvsz95Y7kze5hBhc6sjeevI6QzKvHs/n8i1l4PYLlXgRWoCB4XCgQlAsqcgdisagHFW32noEwBOYWHU34+tfmAeNUly2G4yH8N+Qy38zJw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5112.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(451199021)(478600001)(31686004)(26005)(6506007)(6512007)(83380400001)(53546011)(2616005)(2906002)(4744005)(186003)(44832011)(8676002)(36916002)(8936002)(38100700002)(6486002)(86362001)(6666004)(316002)(36756003)(31696002)(41300700001)(5660300002)(66556008)(66946007)(4326008)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elJTTVlYYllQT0N5cE5GSk91Y3VZbEhFRHNxRlJ5b2JOT3hFOUhoUDhTWGlV?=
 =?utf-8?B?V2k4SFo5b2xRbWhnbWZub3JJWkIvMFhGalRXWDFORUh0OGFzRGZ4U1daaDRS?=
 =?utf-8?B?YVB3Z2IzWEZ0eGlIaGcydHNTUXZqTHE3c2dVTUpTT3luTGU4bUJwdTgzMU15?=
 =?utf-8?B?Z29veFVHK01veUR5YnJQVWRzNnA0U01OYjBoVmV5M1A2dU1XVjhKejR1YW1C?=
 =?utf-8?B?ZG5KamoxOGZDM1A0RHJCa2JIV1BTcmFPQjYrUFR5ZGt3SVlENVdTVmx5VTdL?=
 =?utf-8?B?bHp1Y0doeUx5UzdqQjgvNlZCR0krenhTNmlPaitjVFIwa2RVem1HWHlOTC82?=
 =?utf-8?B?MHl6dUxNcExoQm1iLzVXQjd5TEZHNE1lRVBVSmtUTTI3VnVwZWlXS0ZycWxq?=
 =?utf-8?B?bWlVdmJGejBmeGtyTmZpdDVCZUN0MDdQMi9PZ3ZoZ1k4Z2VCcUltOFZGbW5i?=
 =?utf-8?B?T3lNTUhYcHFmSzY1VEJkaCsyWDR5dUZTbVFaaGRFaThrbmZVNVZxd1E0dTd1?=
 =?utf-8?B?Z2V4UWxPM2tWa2ttTDlVUWx3Y2dwenN0OGdOa2UvSHN1TCtWRmZOa1YvWnNU?=
 =?utf-8?B?ZzB3RWs4WE1XYVEwMndDOTdTL1BEd01CZ2tCOGNJUEFicFEyYmVUdk4rUms2?=
 =?utf-8?B?bk00S0lWdGVEbDNvckhJT0FKaHEzK2NmdEZudzNFZk1lMHhTcTZNTjljWEV3?=
 =?utf-8?B?S2JaaGMzRkdEWDNkWHdNZnJhWFJpODgyV2hkd0NkSDdxS3RoeEhjSVA5R3po?=
 =?utf-8?B?ODNsRXpnTFRQVEZhV3BHNnF2ZWNnaWxKVWVaTE53OXpYK0pVN2VVclBzNFVO?=
 =?utf-8?B?MG1zeUtrR0Qzazh2d29qVnBVWGZTOUNhRll2RElDVzFBa3VYQXlzK2xMSjhk?=
 =?utf-8?B?V2hRWldEOGdkMDF1cVBrL2lUUFBFcGtXZVBhaFZmWWdOVlUySjZYNDR2M2dC?=
 =?utf-8?B?WHpmWno3RE5TV25Wb2w4UFdDdGhDNmxDSzRrbmlQVWtibWNZdHJXS1UycS9k?=
 =?utf-8?B?SUQzZW5xVjREbUtTeW9yQjZ6cjFUbmhLem53ZU5zaG1sbUNIc1pCRzc2c0JL?=
 =?utf-8?B?TEJTdTNGVzdOMkZQOGFHRjdWRmxPd0NqbWtiZHluY2JmL2hPVFN3RWNwVWxM?=
 =?utf-8?B?SjJJRW5Pdks4NTJ1enJYNG5hdHZLSllHci9CTkFqc2ZjT3BXM1d6NTY5ekFV?=
 =?utf-8?B?VGpRQXZXNGNicEI5TW5GNHpVQmtHOFNPSWo2OVpzM2d5bFZWUVdlcW9aNDZR?=
 =?utf-8?B?d21Hd3MwWnA2RkRWN1BBV2VsZEpmUllMWTFPYzVHOE0wbkhsc3VwRmFMR2VI?=
 =?utf-8?B?VVl6ZFYyOGZSbStGbVNZMmdoS0p2MlVyOGVEeWdSV3hDTFRWMTJIWDIrc1ds?=
 =?utf-8?B?VmJBZE12bFlJOWN2RGdaNnZIbHJyMzFqbEgxTmdPWllOcHdWUjVKVXJWMXk1?=
 =?utf-8?B?MDVLTUhKY1RBcWF1MFBsT3ZrWDB6VlNZUmgwLzByQ2xMWXhnTk5rUG5zd0VU?=
 =?utf-8?B?Zng2Q2RmLzdJZWRFN2JtcEhkM0tXb1Z0NnEweHl2c2Z2WlNnU3NGSk1ZK3BM?=
 =?utf-8?B?TmlYMUdIdzJPYVpoUHR6VStkejNlSjJBR0ZNS01hblZDOGNBdUxBRFJYQmJm?=
 =?utf-8?B?aFVSK043Q0pjMmZ4cm5tMk5MR0VFTHoyWUJIV1UzZUpQdU96MmU3L2Q2dEZr?=
 =?utf-8?B?d2xFSkMxSzJHWXovOVEwSVlCK0FTbWMrQ29hRU5WY1lQcGppUlUxUmRYZWw4?=
 =?utf-8?B?dlRNM1pYeE5DZ3NZWjBvWXV0ZVNsSGJZYm9oSFNpSEdoYUUvL3VGYWFJTVBH?=
 =?utf-8?B?U3R3OEtNTDUvVW1DMnBvOWZhK2RCQWE2bFRSYjdYMEVhM3hVWktYbno5d0cx?=
 =?utf-8?B?aUNuVmpjWWh3NnRUdVpOUlRDZG5WaWJRZXlwVmxkeXEvV2pIbmY2eitEUWVN?=
 =?utf-8?B?VFNoMWNZZ095NnY2UWpYdmZ2aE02VndkNjhpV2d5aDcyMkF5cFphRVNsQktG?=
 =?utf-8?B?Z3owM0xVeXVKNVM5bU9haTUycU92ZUtUalRxTWZ4bjlvOTRSQ3YyQ3ZHT2Z5?=
 =?utf-8?B?dzBZUE1lWm1ORHN1R2UxM3FocmxqL3MxL1ZjdEFxSkk0a2ZTaEFXVWthM3c0?=
 =?utf-8?Q?q2dOwkGDd+LIsNViHLo+EHBgo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58401c2c-d472-443d-c5c4-08db62db0aaa
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5112.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 20:01:52.3408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hCXYOG0bp/zw4hPAna2D/kevkfFEXmStpKvSGDxF9sAeI+5uN9BGvh3iLRWyUjX8/6x9BIjs07hZoOhPdpID+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7187
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-30 22:08, Yang Li wrote:
> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device.c:1036 kgd2kfd_interrupt() warn: inconsistent indenting
>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>

I'm applying the patch to amd-staging-drm-next. Thanks!


> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_device.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
> index 862a50f7b490..0398a8c52a44 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
> @@ -1033,7 +1033,7 @@ void kgd2kfd_interrupt(struct kfd_dev *kfd, const void *ih_ring_entry)
>   			    	is_patched ? patched_ihre : ih_ring_entry)) {
>   			kfd_queue_work(node->ih_wq, &node->interrupt_work);
>   			spin_unlock_irqrestore(&node->interrupt_lock, flags);
> -				return;
> +			return;
>   		}
>   		spin_unlock_irqrestore(&node->interrupt_lock, flags);
>   	}
