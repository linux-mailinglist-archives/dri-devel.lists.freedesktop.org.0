Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 660306DC806
	for <lists+dri-devel@lfdr.de>; Mon, 10 Apr 2023 16:47:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FFD510E3AA;
	Mon, 10 Apr 2023 14:47:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061.outbound.protection.outlook.com [40.107.237.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FACB10E3A5;
 Mon, 10 Apr 2023 14:47:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JjcMwyAiD+nIPXYns/WZ11p0OCYrbgHRQcBaoG1eqh7m/b2KhwdeD7LbUj7+RJYt9kHA1YdWbUEhU3QzI+04HYrjqdhnyZYV1FbfBpT+YVTFhl3KTzi+uboYpCW4DpF3OnvCoWEO5dhUmbfiicW0RgHkdiOSXGbJJ8w+4qaaDWnkFeki6GOxuTPGlEG2nPEE0kNRHW13yrcu6Z8JFFuz4BN0bJp/35P2W5J79hNwmcHMuuoTrQlHw75IRkXBM375vD4f7NNEWwuuZ8ZFSyXmapnnozeRqYRqFDSbV8pLuBmyntYEeKKLeJjECzLYLSRo4G6rJGllJHncJhC2sF03Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7YtOYjG7GfOwp1FC9b7Bko180a+ffgTOWGxwoqndaFU=;
 b=dkehQJdfOjaFCksHneDfWIZoWxA6JKSxmhGY1eKwHaVYV42NTaWdvmaxudgxWsWqKAP00Y7Io4WIbzqcHApveVlTHFZIh4MygElwcLipmfJF4uIRxcyIALY7pYCXcEPWmPBWTbCboxW7BgtVWbwXPcK9Kd3sXMEZzWiishAZMOY6tt8hO0KkrymNzW0gDnWo0nxmckCG5HktgNKwnPj9ZvhVXSHvr0/9J70YCuGUPhmMipEshaoAIFpsDx4hVKjILsrIstpLNvvCp40dKLpm+KS1VHHtD5skhxrfCV93VafQt3/l9m9z7ZklFjhXhNhXkBTCyfWzgiQA9MCnCh35uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7YtOYjG7GfOwp1FC9b7Bko180a+ffgTOWGxwoqndaFU=;
 b=qRbkqkbiJAV8ifYN82Mi/IyXp1IPb84rxN9zQKe8yLX9uAa8xlx0vPcEq/UPfym6y+je251ngvtbiu0odw/Shg+5lDWA9HZJTSL0UZ4LeNlPMMpx7xFmYemjxlPtwyErjJvCi04J2/Q3E+nmHL1OBGo/fE9Ew4OPPjMpilRwl5g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 PH8PR12MB7110.namprd12.prod.outlook.com (2603:10b6:510:22e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.35; Mon, 10 Apr
 2023 14:47:28 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1%9]) with mapi id 15.20.6277.038; Mon, 10 Apr 2023
 14:47:28 +0000
Message-ID: <e912dd87-f518-bb82-0c18-be4fb2b11b8b@amd.com>
Date: Mon, 10 Apr 2023 10:48:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] drm/amd/display: set variables aperture_default_system
 and context0_default_system storage-class-specifier to static
Content-Language: en-US
To: Tom Rix <trix@redhat.com>, harry.wentland@amd.com, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, Brian.Chang@amd.com, Martin.Leung@amd.com,
 David.Galiffi@amd.com, Ethan.Wellenreiter@amd.com, martin.tsai@amd.com,
 tales.aparecida@gmail.com
References: <20230406195818.1958162-1-trix@redhat.com>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230406195818.1958162-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0464.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d6::21) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|PH8PR12MB7110:EE_
X-MS-Office365-Filtering-Correlation-Id: 63659b1c-27aa-4f69-de9e-08db39d28153
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hQBm/1ossL8Zv05FJfWfl+VMms+LQ0IJbW39BtyEsREbp0M7U/6AR5ounc/0nnbM1wEOnVNiba439yTjnRs/kfSPqVforK/vJpbPWtXiQrO+QlGe/B9J1Jt/+MjTBps7tIT44hfoxsyDGRdCwadeQFOmq+ok/4vFAfQpyj7LJ4+Ye5gyzMcM3oOqw1IzmnEX5jrQYQysh+AjYnvlmJD0w5SX9FHwEyXzJCt/B8HoOv/5AY37h/vXJVEdOX9j0pmtoQETnDzcqTh6ln022GE2JpvIMJMr2A/WSgs4CxwJywHDYUYWF1t7WgHU0nyeQm1DQ0P8NTWIyFQFTfMfm3MMwkEMe7cguQOplmgnRejtBSPgB5Yfiwpt79F+kBMm7gdyVTg+IaYgyA+WayUFvEQgGR7aCHLOsxb8HEicu25MBfiCL25q9bMNJXblODAYEL+CMMMBLnO++LTHXs3j6zZxwrWDFHdj+3zrDrpudGfVuQeVcwSEULxlDwR2Zgc0oFDoP9DYfS/l0BvKFFqzmL31SWm9RF81wcOycgkVFWlpw4dJwH3xAEORekjsSCebwU21bY0lSeEr+AUVhAhJhUa5TEYfwUMDfuG8w2hTyCBRKFbW+QsYHCvv13quFa9f5qV4wUWGrCh+dlC/8gXesKopbNkmF2ss24sXdOrGYMTmYwA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(366004)(396003)(136003)(39860400002)(451199021)(86362001)(31696002)(36756003)(316002)(41300700001)(8676002)(4326008)(66946007)(6486002)(478600001)(66476007)(66556008)(5660300002)(2906002)(44832011)(8936002)(921005)(38100700002)(186003)(53546011)(6666004)(6506007)(26005)(6512007)(2616005)(83380400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVIwWkk1TGRNcEt0R21pa3hKTG5jQnlSM0xLaENlMk40MHFQeVZ5UStoOXEw?=
 =?utf-8?B?c2cwb3hQaDFQbFc0N1U3Zm9QcGNlaEtVdVNhcGRnMUp1VzhHK3EwSm45MVl5?=
 =?utf-8?B?K3p1US9oM1UvdjZIWEMwT3ZtM0plZ20yVGg4YXY3RTVWekd4ZVZYSjNwRXM3?=
 =?utf-8?B?cExVaEFlOUZEY00xK2U5SDltYmt0OHluaVhvMkJGcXhGM0VTVXJMRGt5dHpT?=
 =?utf-8?B?QnRlMHF3UzFDTTVPcHBwbUc1UnRSMXBlRDFmU09qMXpmWS84eG9BNFlSMW90?=
 =?utf-8?B?WmJWcldZWFdOWisvU1dpMG4zZWRrY0FHVzhxSGY0emJoK3VDWng2VS9YQkVm?=
 =?utf-8?B?RDdLUmNxUHc0MEs0MXpUWnR6dTFScGtrMzEwVUVVY0JDSWZzQlpPM0h5UjNP?=
 =?utf-8?B?elVsd2lqdHdQL0JaLzZidFNONkdhMUJjMFpEdXl2VEJGNGhLZDhnZjBaU1U1?=
 =?utf-8?B?MG5CU0M4WGxSelY3MlgwcTRObWpZSkcyamY3RkNmUlVvRjJpN2xscVVmbzFw?=
 =?utf-8?B?amFUQ1ZKOWtJbmNuWE9HVG5Ib2hkWU82ZzNLL3FncFNrLzFMUm05OE5oRmp1?=
 =?utf-8?B?VjgxcWVzb1RnVERFVnlyT2VkMk12eEFuS2Z6QjJNWFhYeWVZbGpPT1phdjlU?=
 =?utf-8?B?cmloYzljUkdvWVlZSGtDcnk1NnBLYWhMeXF0ZXdQRkxpT2dTbFhkZFpEdFUw?=
 =?utf-8?B?YzByTU9pckRtdzFSR1FieVRMaTZneERIb2Nib1JySWtOVVFzbEo5MXFLVHJJ?=
 =?utf-8?B?VEc1ZDJES2FJTlp1YnBUWWU3VTFsV0ZONTMvQldJRjJWT0ZzK1U2UlRlVVgx?=
 =?utf-8?B?VW0xSVRNTGFkSUdkekRSYTdoU0Z5SzlEWHJaZU11T1Q3Ui9LRy9QN3hzaUY0?=
 =?utf-8?B?Nys5REF2a3ZidU9OTUZ1ZGhZcXBpM0kzc0d2ditMbTJNb1VNVE02T0doUmZM?=
 =?utf-8?B?NFpoSmpDT24wZ1BCdDQvSHNyRWIzbExLbzR5VUV1N2JwbFZiQTN0QjczVlZV?=
 =?utf-8?B?NjFtd0kxd0NTaEE5Zmx4dkFaQmk4M3hyb0VkcDJiZUUwYS8yQ3V2MDV3QUd0?=
 =?utf-8?B?Qi9oZWR0MGtwQ1BYbjNwUUVnb0NCbkgwZnBaWmEzWXNuU1hoZXFubVBrR2dD?=
 =?utf-8?B?dFVLNjVPWk5ER2VrZ1RzYlVFSzJDSGNBSnd6Yjhkdy9JMjl1Q3ByMml4TkFW?=
 =?utf-8?B?QmV6WEt5bjUySnJzSGlCWkU4U3h1Z200SWFBZHRGMm9nUU54elViWmFabFBE?=
 =?utf-8?B?cWhnSFdFMWVHUFN3UzNFWTRoOGFPQ1hBV1JQV1FjN05XTXZKVlAxRUlOS21Z?=
 =?utf-8?B?UmNlMURUanBFU2RsTnpIL1dxRW5wRDZ2Z2dPM3l1N0xMaDJTVk1jdlNPeUpQ?=
 =?utf-8?B?TERUYm1nbzlKM1lPZ2tYRXpueDRXNXpJaTdldk1LVzFGL011YW02S0RiakJT?=
 =?utf-8?B?VVRGOGZCQWoxc2lEWG9ITXR6UnlwWVpBUndQTzBTc2dEOEZkVWl1V2V6aDJT?=
 =?utf-8?B?TWhTbGVlRytDVW1oQkcyVnJhVTFCQll0VWJha2F2Yk9scVhLeGlBOENPZndj?=
 =?utf-8?B?VXpBOEpycG4rdjlEWjBvZUI4WkdwWFphVVl3eEdzWFhlNlFPM011SUNwbUFF?=
 =?utf-8?B?dmpDdDBaUzA0bk91RkdCNkNxek9FMGkyR3B3STNrTjRiZElDcTVyQVYyV0lS?=
 =?utf-8?B?QUZvNjdFRVBWZmJ4aWczMThwWWNGbUZ1Mk9jTnprR1VCejFhRzNJYU5STGZV?=
 =?utf-8?B?V0N4TDZOREkyanRIS1dYVy93T1Q4QlFWSlZGZmZacnV4SUhPVVlDMmZoSElC?=
 =?utf-8?B?NC9sTGtSMkU4bElWdVEzNGc1YWpiSkNRUkRPVWxadXVhbkdHaXBHWkVmeUZ6?=
 =?utf-8?B?Rmc1LzRmWXZBczNFQ2hiLzZTcmxudHFxMXhteE1oU2l0WHFSZURsS1ZPbzhu?=
 =?utf-8?B?UFg1VXBCdnRGdm9jTUNxeHJCOTV4emtoOE9BcGZFS0g4b1hSaTMxL1dWSGtk?=
 =?utf-8?B?MEI1ZG9RVjV1TXBraVRKbUkvd3IwY3BKVmZ6Y3U5a2lFNU45UmZYSWdvcVpC?=
 =?utf-8?B?TjNsejVTSE5EZEFLMFVBemVlRXZYUUh5TkV6R1N5STNMcTQxaS9XRVhYaTRx?=
 =?utf-8?Q?ovfXCX+uYMUPyHdceN2vXG7ny?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63659b1c-27aa-4f69-de9e-08db39d28153
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2023 14:47:28.0651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LuOQYDMzn+8S3xmPFWtjGsa+Wwz29RAYCjkRdvZCqavZN2wql322bCmnZKS/Hz6GqemKq0m8gvJolH/poadAtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7110
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/6/23 15:58, Tom Rix wrote:
> smatch reports
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hubp.c:758:10: warning: symbol
>    'aperture_default_system' was not declared. Should it be static?
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hubp.c:759:10: warning: symbol
>    'context0_default_system' was not declared. Should it be static?
> 
> These variables are only used in one file so should be static.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Applied, thanks!

> ---
>   drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c
> index a142a00bc432..bf399819ca80 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c
> @@ -755,8 +755,8 @@ bool hubp1_is_flip_pending(struct hubp *hubp)
>   	return false;
>   }
>   
> -uint32_t aperture_default_system = 1;
> -uint32_t context0_default_system; /* = 0;*/
> +static uint32_t aperture_default_system = 1;
> +static uint32_t context0_default_system; /* = 0;*/
>   
>   static void hubp1_set_vm_system_aperture_settings(struct hubp *hubp,
>   		struct vm_system_aperture_param *apt)
-- 
Hamza

