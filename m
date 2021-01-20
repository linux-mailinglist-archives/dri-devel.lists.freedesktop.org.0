Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2ED92FD365
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jan 2021 16:05:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABCD86E0AD;
	Wed, 20 Jan 2021 15:05:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760089.outbound.protection.outlook.com [40.107.76.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5FB36E0AD;
 Wed, 20 Jan 2021 15:05:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JRgU3C6zSo9EdOjDblT8YcpgCza+witqO9yQUEHGgHccKVMZDgeVFTfirDzZppUH4zZVRIAaAGOxNne+4BEpflD14n1LDfm7ye87C12UJGe4DJMH7jjZMotHmghyAI1ntYTKorYwf7EBY4ozvx/VzKG0p7puV/O4Vx1VYX79Hr3JiTmDRYM0Y5Nx8BoF/MpfIgSwJa4xqZysJdUERHtkiHnhuFWIJ6t8dgjSQ57Qem+WtSjYubbVT8g82sBaExWcFiznCsNdWUfGEMQD0zzW+MuzaRvAh/ldb0kaNff/2BEa9Ps1nTDdmQAnn9IQJ+EoCBSv46D9RMeH7OUFBHyFiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kbknr0iM5W3FZOmTCFSaF0x2qobr6MutnlCqwjQgTIk=;
 b=myzgwOdMnDvs10cG7Z3zaMKKOlcGl1nQ/uLyqrNGDDXUL2EFp2a7FiPwhJXx82ezgCNFh8k+ckgiHg8X4V/vi+FN1pQ6ZzbQIBRCYlnHjw2ZYiYLpeir4pysNA8uG8hSnc3ksKBvKw4fER6BinxJ9eexcswGOpITKrfOuG769ml+yNunrzdfw/2pJMT28xo7qaynuyJOk3DMghJXzP5u7Sc9I2BN2KnirDDTyKNXiWcOBzNg+31w7nB0XzZrl//pt22pevIkiWI8YFnwWtlnFQ6Y7hiMMFol85SrXXGCRk5M6KiR7qCZZ6BzSu+lEYZ/bAKs0T9k7DozTOCAneBn0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kbknr0iM5W3FZOmTCFSaF0x2qobr6MutnlCqwjQgTIk=;
 b=SAVrgyUZU4u6f4Yby6XqzF+tJ8LtMvvpIssx73pZEV02pb4L3CCVsLlla3TZbETb/agzYCJLUZmXvalXdB/M9wsxo9Uqdw9SbOmls8sLudQfXlXUK/E+yzfqAfxGbU4hYAuMF0i5fWb3gV62ns7rF1yrY85gVKqAoFnTabjSgcI=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11)
 by MW3PR12MB4569.namprd12.prod.outlook.com (2603:10b6:303:57::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Wed, 20 Jan
 2021 15:05:44 +0000
Received: from MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::172:235e:14a4:bdc6]) by MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::172:235e:14a4:bdc6%7]) with mapi id 15.20.3763.014; Wed, 20 Jan 2021
 15:05:44 +0000
Subject: Re: [PATCH] drm/amdgpu: Assign boolean values to a bool variable
To: Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
References: <1611127007-39308-1-git-send-email-abaci-bugfix@linux.alibaba.com>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <3e2d3292-8611-68de-e1ed-7266fd41ce76@amd.com>
Date: Wed, 20 Jan 2021 10:05:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <1611127007-39308-1-git-send-email-abaci-bugfix@linux.alibaba.com>
Content-Language: en-US
X-Originating-IP: [165.204.84.11]
X-ClientProxiedBy: MN2PR10CA0012.namprd10.prod.outlook.com
 (2603:10b6:208:120::25) To MW3PR12MB4379.namprd12.prod.outlook.com
 (2603:10b6:303:5e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.7.88] (165.204.84.11) by
 MN2PR10CA0012.namprd10.prod.outlook.com (2603:10b6:208:120::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend
 Transport; Wed, 20 Jan 2021 15:05:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 19b72e77-b6b7-4c42-d91b-08d8bd54dc55
X-MS-TrafficTypeDiagnostic: MW3PR12MB4569:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW3PR12MB456997BD27ED04D4E96B38988CA20@MW3PR12MB4569.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zq7+ji74h4V5iwCZ+lsMkahwHMUB3NRLbE4UEpoPbcwKyh63c6igY19ia56+AARG9s17ZRJaKeHAIm+vnX/58s/IQ2jn7B8dKFUyZUdj10EeWIwwEAgZwnQLa2xH0LkUIGZWhyXy/2Rw5VoYWk6iLxDeFN1bR8d5NxmTkEgcuIl7/Uou8pz/g8S2xhl8ZheweK1KZdHZB3lHBYUPsFMclIEKde/vgzYUJYlyKbfwTosrtVOUA68zPiNJZ4A3QzCXBbvXQkdfSBcNQnkCx2vyLfQur6yUGYD2mEfO4C4VgqGB4Re37nsW8xsx46EfIxTLttLU5uNnE3TB+0voqZl0bcT5ufs6xWnK9Msj3Yfupvy3v0bJuWgXZA6VceM2gFPAjt6GANg9pownSCnhJDyamRO9yT9CZdvyyVNw39zNggPm0uOLRoUg5b7TlOr35ZdY3rXad5CmVXXKHViEXcMDVETMZGufH1puoTI3HgUWKBvPGZyTinS6mzHJdw9EeK/4QIytNclQwuM/Yahn7P4n1aZdH0AI7NGvIdCqmVpshRaYyVMFxVYrveeH5xhsfeCT0rrtszgCoe/NZXd9OO5N3CZVmux5DzLClYnCJ/htiuI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4379.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(39860400002)(136003)(376002)(66476007)(4326008)(8936002)(6916009)(31686004)(36756003)(8676002)(316002)(66556008)(956004)(186003)(44832011)(16576012)(83380400001)(2906002)(66946007)(16526019)(86362001)(5660300002)(52116002)(6486002)(31696002)(2616005)(26005)(53546011)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?K0tlNXdkendkYWZSSlFBRmUyZEV2U3dmY2w2UGRRbzlUVFBKL04zSnRtVE5Y?=
 =?utf-8?B?TTR2V0xRVHlwVFZUbFFsS2d1UVVMMS91RFRKZFNPZEVkTUdrckp2UnMreWNj?=
 =?utf-8?B?SllMTDhWU3UyOVN1TUNMazBPODl4YzBBdDdpU09lSlZTOEVaV2d3WW42M2lx?=
 =?utf-8?B?cGxndnUrQjBFeWNqMkZrUUNPOElMc3gwS0ZXaXNSSGRZdHZrUnJKTWh5cG5V?=
 =?utf-8?B?cWZ4UHZ6YUVheWVoS29scTJkMkJRUG8raCtOQlBWZEgrOURnL1J6aENzc3l4?=
 =?utf-8?B?NEdvOG9OK25ockNxK0ZpcEhKME13MGtoZjZoYmJGclJiR3lYdi9SYzNtbVRZ?=
 =?utf-8?B?N2pWMUM0TEd4cFZvR0RCbEx2Q0hySFVPUXRaTzRGOFVmUGpOQXduNFphaGF6?=
 =?utf-8?B?dzdScHJ2V3hHNTNCbk9jR2k5RGhESHlvTEN0andlR3VvZnE3bWNWOFpTSnpL?=
 =?utf-8?B?MGphQW1POWpTeUN6WXZqTHpqb1BsbEordDAwSmxMMkJGNC90OGJiamhVZVN5?=
 =?utf-8?B?eDNFZS9VbWhFZHhWZnI4Kzl0ZW13OTJYVm5PbnJTRlNPVHR1N0JzRW9BVDdI?=
 =?utf-8?B?ZDdXYXRwbDNYSVNtM29PRFJGdjNQUEErT0ZkQjBHb2NHYm5jWkVFRWlETDB2?=
 =?utf-8?B?LzJkSFkvUEpOaHVjK0VUN3ZNK0NwdTZaVGF2VU9IdHdaWXI2NWl3NDExeW1J?=
 =?utf-8?B?Mzc1OG90cUhMQTBNU05OaTJjRjY2MnIyNnN6SDA0T00zeXFoTTVEdS95OE83?=
 =?utf-8?B?Q2pTU2U5TGtJSTFONkVYcVdWMXBlRTFBTzZGVDlnVHhGNmNrMWthKzE5RU9j?=
 =?utf-8?B?YlVYL0NGbkM5TU13MjhERlI3RkNIVk1CTTRlRWdYWEFIbFpvUG1ibk9wYjdV?=
 =?utf-8?B?Skd2eUMwQzVGQWNKd1BGTjgwSWxNZUpCamJ3YjFreUhJa2RRSHpieW5oeUIv?=
 =?utf-8?B?V1NXL0pUbXNrQzM5cXJjUnN6RmQyQkZndVplV0p5VFQ1VzNlUDJiWHRTeW5D?=
 =?utf-8?B?QUJNNklnRnM5RGUzOEV0MmFoL0ZkMEZlL1ZYN1YrQ01zKzgwdkVqTjVxR3ZX?=
 =?utf-8?B?dm5DMnBLa0taNUVFZ1RINkZIT2crRThzUGxndit0TWV3R0tyUTVaVmI1endI?=
 =?utf-8?B?TlROdHRZZjYxYXE4a3d0bTczU1R0OGNYMWlZQnJpVGw5V28xZFlkRk5oL0tT?=
 =?utf-8?B?OWNjRWcyVXl2Z213aDROZzFvVkVQT3pQaEJVc1F4cTAzdUswc1FlODdNWlZG?=
 =?utf-8?B?aC9JRng1Z3JmOUpEV3lBWml0UTRPVzdyaDhwRk5RZCtCU0tqa0FiRG9rT2dF?=
 =?utf-8?Q?Rd37vXqmUKJVVe+P7I6JuYabH4GUpvzD0n?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19b72e77-b6b7-4c42-d91b-08d8bd54dc55
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4379.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 15:05:44.6293 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tj56jqmNAW+m6vE4LxbX4RgcuNkr1ui/C1phqpNFLbbV2bnpdbt04y9BY2Nzv/Q32de8P+gskhvvVtZKmMUJHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4569
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
Cc: Dmytro.Laktyushkin@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 luben.tuikov@amd.com, Eric.Bernstein@amd.com, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, Bhawanpreet.Lakha@amd.com, christian.koenig@amd.com,
 yebin10@huawei.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-01-20 2:16 a.m., Jiapeng Zhong wrote:
> Fix the following coccicheck warnings:
> 
> ./drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.c:
> 1009:6-16: WARNING: Assignment of 0/1 to bool variable.
> 
> ./drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.c:
> 200:2-10: WARNING: Assignment of 0/1 to bool variable.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>   .../display/dc/dml/dcn30/display_rq_dlg_calc_30.c  | 32 +++++++++++-----------
>   1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.c
> index 5b5916b..0f14f20 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.c
> @@ -165,8 +165,8 @@ static void handle_det_buf_split(struct display_mode_lib *mode_lib,
>   	unsigned int swath_bytes_c = 0;
>   	unsigned int full_swath_bytes_packed_l = 0;
>   	unsigned int full_swath_bytes_packed_c = 0;
> -	bool req128_l = 0;
> -	bool req128_c = 0;
> +	bool req128_l = false;
> +	bool req128_c = false;
>   	bool surf_linear = (pipe_src_param.sw_mode == dm_sw_linear);
>   	bool surf_vert = (pipe_src_param.source_scan == dm_vert);
>   	unsigned int log2_swath_height_l = 0;
> @@ -191,37 +191,37 @@ static void handle_det_buf_split(struct display_mode_lib *mode_lib,
>   		total_swath_bytes = 2 * full_swath_bytes_packed_l;
>   
>   	if (total_swath_bytes <= detile_buf_size_in_bytes) { //full 256b request
> -		req128_l = 0;
> -		req128_c = 0;
> +		req128_l = false;
> +		req128_c = false;
>   		swath_bytes_l = full_swath_bytes_packed_l;
>   		swath_bytes_c = full_swath_bytes_packed_c;
>   	} else if (!rq_param->yuv420) {
> -		req128_l = 1;
> -		req128_c = 0;
> +		req128_l = true;
> +		req128_c = false;
>   		swath_bytes_c = full_swath_bytes_packed_c;
>   		swath_bytes_l = full_swath_bytes_packed_l / 2;
>   	} else if ((double)full_swath_bytes_packed_l / (double)full_swath_bytes_packed_c < 1.5) {
> -		req128_l = 0;
> -		req128_c = 1;
> +		req128_l = false;
> +		req128_c = true;
>   		swath_bytes_l = full_swath_bytes_packed_l;
>   		swath_bytes_c = full_swath_bytes_packed_c / 2;
>   
>   		total_swath_bytes = 2 * swath_bytes_l + 2 * swath_bytes_c;
>   
>   		if (total_swath_bytes > detile_buf_size_in_bytes) {
> -			req128_l = 1;
> +			req128_l = true;
>   			swath_bytes_l = full_swath_bytes_packed_l / 2;
>   		}
>   	} else {
> -		req128_l = 1;
> -		req128_c = 0;
> +		req128_l = true;
> +		req128_c = false;
>   		swath_bytes_l = full_swath_bytes_packed_l/2;
>   		swath_bytes_c = full_swath_bytes_packed_c;
>   
>   		total_swath_bytes = 2 * swath_bytes_l + 2 * swath_bytes_c;
>   
>   		if (total_swath_bytes > detile_buf_size_in_bytes) {
> -			req128_c = 1;
> +			req128_c = true;
>   			swath_bytes_c = full_swath_bytes_packed_c/2;
>   		}
>   	}
> @@ -1006,8 +1006,8 @@ static void dml_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
>   
>   	double min_dst_y_ttu_vblank = 0;
>   	unsigned int dlg_vblank_start = 0;
> -	bool dual_plane = 0;
> -	bool mode_422 = 0;
> +	bool dual_plane = false;
> +	bool mode_422 = false;
>   	unsigned int access_dir = 0;
>   	unsigned int vp_height_l = 0;
>   	unsigned int vp_width_l = 0;
> @@ -1021,7 +1021,7 @@ static void dml_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
>   	double hratio_c = 0;
>   	double vratio_l = 0;
>   	double vratio_c = 0;
> -	bool scl_enable = 0;
> +	bool scl_enable = false;
>   
>   	double line_time_in_us = 0;
>   	//	double vinit_l;
> @@ -1156,7 +1156,7 @@ static void dml_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
>   	// Source
>   	//			 dcc_en			  = src.dcc;
>   	dual_plane = is_dual_plane((enum source_format_class)(src->source_format));
> -	mode_422 = 0; // TODO
> +	mode_422 = false; // TODO
>   	access_dir = (src->source_scan == dm_vert); // vp access direction: horizontal or vertical accessed
>   	vp_height_l = src->viewport_height;
>   	vp_width_l = src->viewport_width;
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
