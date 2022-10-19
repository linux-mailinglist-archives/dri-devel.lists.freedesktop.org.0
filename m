Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB75604711
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 15:28:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DC9E10F237;
	Wed, 19 Oct 2022 13:28:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2061.outbound.protection.outlook.com [40.107.95.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F381C10EAD2;
 Wed, 19 Oct 2022 13:28:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J+nMhJLOyXw+PeG4NOOAS5mpYloYIg0xSBN1Ealyx7P4nIQm6Fn9B3gVOzTh89vreXeNr7g2ntS8eFpUYRb/jmkSmUj213qkpZRj8S4+FzPauZTKb0ijzCrxaGPZFnNDKFPXhjNds8szgImiVcLwDjJ2OJ2rh2+cXnaolIEAEKhn1+bpEXv1e+e5D0ZZXk8joNby9a+VFShqQSWO6fU1l+HILA4sp5I66AS0mjr8FzzmvCEZ9zMJgoYXhUtaPJntQhwD2xy6GogGSSQKLpcQIk2udzfIoNLnpuIlsFJZ2qAozvb2G926xsiXAYrwE8xkX7u7ZcP7/dHMQcJ4Mem5Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OUVUlj1khZS4qOwz9HlfbfG8/dDiXQ3NpNi692JTr8A=;
 b=gWxAYoGTiNZ76yx1xTWmKyX+J7bvWlSlBxRdjLIfbEiKTVWcqnXnGgJJ0wScQ2wFdI+78B4a4uk/qKz7LwucVe/qi2vFFuX9dbNdFGLKFygaJUgXcbX/wNYRY7S7sm1fKtzE3cPmtNkDWThRAo3cf2kYrVkPXRCmYxewWY3So+6JG9GmwonVO9h8n4LV0sg54EuNw63aYs+TguJsjnr7+gAghJX3FvInQjqlAIDhAdBY3loaXt9DXflTEMKrmflrVWM62aLVTV72fiEZkch8LWaJNX1BrXXLdTa8+rXisq5DsDM/oliG4FpF7ESWHFBjqC9YzQo2yQ97FObWn2OcXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OUVUlj1khZS4qOwz9HlfbfG8/dDiXQ3NpNi692JTr8A=;
 b=dgzWU+TPw1WuVgQp9uBgFjWgrDC8Fhh8NB65kIuyCpY1yaedOJo6xppb5EdNtjJSIyhP72baUlcl+OPehlfvLwLTbSjFjcg2sgReHBbEEvJoYr9LNlOeK4rKMd3etKdEAtsJ1I06l7WrpBE+7FPXkQtXtVbLF5+SXXurQIf4OLQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CH2PR12MB4262.namprd12.prod.outlook.com (2603:10b6:610:af::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Wed, 19 Oct
 2022 13:28:07 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aef3:6aae:b904:e395]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aef3:6aae:b904:e395%7]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 13:28:07 +0000
Message-ID: <8eb93fb6-a1c4-5ef4-f549-8649bb36e59a@amd.com>
Date: Wed, 19 Oct 2022 09:28:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH -next] drm/amd/display: make dcn32_mpc_funcs static
Content-Language: en-US
To: ruanjinjie <ruanjinjie@huawei.com>, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, jiapeng.chong@linux.alibaba.com, hanyihao@vivo.com,
 aurabindo.pillai@amd.com, Martin.Leung@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20221019062347.3756071-1-ruanjinjie@huawei.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20221019062347.3756071-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0069.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::8) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CH2PR12MB4262:EE_
X-MS-Office365-Filtering-Correlation-Id: fd7279e2-6f39-476d-1c2a-08dab1d5c23b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C6WvJtMeBm6IvEr33+x/xYrcj/LxfMTuDkiNeYOn9Ob02bvy/UF6ueJNT+FCImwDOCpykRQzhANdhak+tBY2aNQmr1qmlRisHnxof4Z2E3caSGsT2r3qxfhTJRaK418MPq6XnSR0QYNtBbn5QK4cV7UfDlklmgQhQl4L5rEnK/YhQq7DO69LqtSTfF8dOZ53QQUbsCSDXUN4hSsavwsrEjfl0G6nmQNNRJqINID0xcJEd6xflOOxSm8QmF5P+yuvOW4dkrDtVEEJlshdcW3KhzQ0sodJziUgdElYElENdiBDw+l5wcpm7V9jHz/c9jAObT8hL1EprXV62aNmn1yPwL4uA4fQ5v03u2dcNlJJug9hMqdPgOW/4YViyCXOyJ6jcaVUJzRlnkKcgaEIhR2I9FEIfGOlfArWDUzG450XaSwjPl0oVabq/Kewk5UOBkXiJc+jrgwgSZM6stp+VO2O0AxfG4v8Su5iWL5jD8Px5oXFx6F+q6UJh/O8Dq9qW48Vdjp3B63+PwcxBpyGvYCM/HdpyK+7FrP83z7b6JC2w/ehuiAScCRjERFFo5Pc4H6SC2oXmTUdfNThXqyRnuhqzF/JlssCrVA+u/LRVutWqrwZ43yc6i58Tottn2eilgQ7yRyKZM3DRFLJo02iigZlbmUueZ2t4KfdRdtlhiR+eqytD5M9Nj6i7k1F6+QtdhT0Ivmc+rMVmLYCkSyENovpGyKRQlBSYqI2Z9tYaHgNqIYPsOa7XaLevuM1nq6bj0DZ3DMLAwbQZB+QBk0gUMvZOremYyXK78SJWbPkFe/c8mVZKPzdz61uYPG4OoxknzaG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(376002)(366004)(39860400002)(396003)(451199015)(2616005)(478600001)(26005)(8936002)(5660300002)(6486002)(6512007)(66556008)(66476007)(316002)(66946007)(8676002)(6666004)(186003)(41300700001)(53546011)(4001150100001)(2906002)(6506007)(86362001)(31696002)(36756003)(44832011)(83380400001)(38100700002)(31686004)(921005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3pFV0JBZStXay9EaXF3M3pnd2o5Tkp2ejZVQmZlazlUMzVpTzdRV1Z4MHkw?=
 =?utf-8?B?d2NWVXo1UGJBekVHT0VIZndqcGZjMFRSc1VlalpaUmswMWowci85Nlp3RnQr?=
 =?utf-8?B?S2ZReWxDeHg3TGg2NlUvVmFMVmlLNmxuRGY3aHcwVWRVZ0NjQ1pzZFJhYkQ0?=
 =?utf-8?B?Vy9jMXFXTUd2TEd6aHFzZkMrNGN4ZnNCSHArT2c3N0U4K2MwL0hQUzF5TEZP?=
 =?utf-8?B?NW9KeS9DNHpFeWYyUjNGTHNad054eG1hODJOTy82Vk9Sdzd3OVNZTHVhQmhp?=
 =?utf-8?B?QTdOVGdlY2pscTMvTGp3MWh6cCt2U0VLOVdTTmhrV2RETlE4ZDh6NlhqRWZh?=
 =?utf-8?B?cVQwYVNXT3Bib1AwSVBHbHp2L0Y3YXR2OWg4SEszdDNpaDV1blRTSEVpMXBw?=
 =?utf-8?B?TlRpSSsyWnN4MlhxYjFOMkpUQ3VWQms3T3dWS0Y3c3M3S003ZG5lanA0cktN?=
 =?utf-8?B?aHBvdVQzcmhJem1mZkdFNVdOUDVFU3Z5d01kS05DczZDNzRKN2prNG5ZTDZx?=
 =?utf-8?B?QkV3dmZKT1BLKzdoZUlGQU1wcFZoazNJYmhrS25Xemd0ZGdvSUVVNmgxZy92?=
 =?utf-8?B?K1VLWHg0RjJ3T2hUY0czanVONFU3SXRJZUVFalFYTG1OazNtQm9JaU0zZEMx?=
 =?utf-8?B?TUxSYXNZckJZQzNxZUdRTUNtdWJWVnQ3bDBFTHIwYis5VlF0Q3FJUElJdXlB?=
 =?utf-8?B?Uk5tUXFzbVJsRzg5cmUrZkpJcmlibGl3YlhVV3p6aUtKUldieW83V3FFRDND?=
 =?utf-8?B?NlFoQlM0Z25qMk1ueWNGRFNYZFFuNXdPQ0RpV3N6TlF3ZUdRSitzNkVyRGY4?=
 =?utf-8?B?UHN4UGVocVp0d1N0N1RjaEFVS011aDJxbGl4MjVISVFtWWVhaDJ0S3o2OEZ0?=
 =?utf-8?B?WVdLWGRlenZMREdwZStya3RQczJhSmYwVVgyTU1kMVBUc2FkNzJnV2Z5ZFRT?=
 =?utf-8?B?cDdkaGhLS0Z3bDQ3QnFuQzVhRlBQbEU5YmFMT0FINWtoZzc3SHRodW9zYkRT?=
 =?utf-8?B?aXRMa0VYeW9MTU5saGRNTytBcWtTZFdxUEVuNGI4NVowODYybWxlSjhpejdF?=
 =?utf-8?B?Ry9NNFZVb0pUaXE4NFlsQUpTZ01oVEhpWHlYVUtXWExwNlk5M2JKMUNlZGZ3?=
 =?utf-8?B?bGJyb2F1N1RhcEpmWmdCa3V4RUR5K1ZNd01RL3lISmhGRkV2TmxWcVl2SVc0?=
 =?utf-8?B?WldkaEtLWVZMTW95RUQvdHgweW0vQm5yWDdGWnQ2RHhJUHBNWk1VQWdxZjlF?=
 =?utf-8?B?bjVaZlhlajh6QktCMlMxNm5QTS8rNGI3cjN1eXYwaEZWOUE2V2F6Ukw4Nm90?=
 =?utf-8?B?c2hwUU9pZHo3WWdocFRGb29xd0I2UkJvaGgrMTljNG5KTk9kRjFaVzFFTzdZ?=
 =?utf-8?B?MHlzNjNaZ3BQSlhKaGpiakJIcEdVMmY1ME16S1JMQ2N5eUh3djZZSDVPMUNz?=
 =?utf-8?B?djBYS0hKT24zdCtSWms1aDhVeDNGWUorL1VVUzZFQ3JOUWpjQXZUVFRuVkww?=
 =?utf-8?B?dUY4NTZNb2JaS29IUllYV3RvR2h6TlpVcityOWloallBdU9IenREOFB2aFlQ?=
 =?utf-8?B?eXpUc0wvUGcvVG5DM0hyemZQMjBSMnc3VkZNSGZGalhmNjRMRTJ2NytpTXc5?=
 =?utf-8?B?aC9sRmNSN1Rqa01PRE8xdkZacEI1UThwZ3pDYzI2Q1VKakZVM1NlY012SXhE?=
 =?utf-8?B?a3ZqZWdHOXdOTzRVc0RNWDY3WXViZ1lZKzhFdEpyZnpBUUxkZFlxNjZjSWcv?=
 =?utf-8?B?d3RyVnZMbDUwNVVuTFNlS0ozSjl0WDBWa0R3bzV4R0lZUWNNbXNDam94bkJK?=
 =?utf-8?B?RGh0OG9EamR6RHFWM1ZQZ1FNRjZzNWV4b1hIUE9iSGY5NjBJR1ZOMWhSOElk?=
 =?utf-8?B?elVINkVZdzZLeXFZZnYzWEwwcDRlUk9Ud0F1bDJlMjZQL20zc01mMGc1WUdz?=
 =?utf-8?B?SitZYjJrNS8xSzBxU2l6L1FZVlhDVHBmb3NHeXlRYmZxdVp3cmNXZGxxS3hH?=
 =?utf-8?B?UndUNFlJUjJhZjlGN2lsY0ZRY1ZVUmJEYXA0dVNXdXY5VWJaMStzYlVCM1Fy?=
 =?utf-8?B?MHcwOTVzdTNEWXR4ZGlneEpJem00RlpxeWZaeUozK3Y2clBYKy9CWlpHOGdS?=
 =?utf-8?Q?nLe7Lxw6TlQ/WMu3tVSNxFHDx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd7279e2-6f39-476d-1c2a-08dab1d5c23b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 13:28:07.3507 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qomeJE+pJjzPHvDh87J1OcMku8icgg3oHsKrqkv9xnMA2yOqzM09ye5TNDtyel3Tv0JrqcwZg8r1I1cEsc5dPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4262
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

On 2022-10-19 02:23, ruanjinjie wrote:
> The symbol is not used outside of the file, so mark it static.
> 
> Fixes the following warning:
> 
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_mpc.c:985:24: warning:
> symbol 'dcn32_mpc_funcs' was not declared. Should it be static?
> 
> Signed-off-by: ruanjinjie <ruanjinjie@huawei.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c
> index 4edd0655965b..206a5ddbaf6d 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c
> @@ -982,7 +982,7 @@ static bool mpc32_program_3dlut(
>  	return true;
>  }
>  
> -const struct mpc_funcs dcn32_mpc_funcs = {
> +static const struct mpc_funcs dcn32_mpc_funcs = {
>  	.read_mpcc_state = mpc1_read_mpcc_state,
>  	.insert_plane = mpc1_insert_plane,
>  	.remove_mpcc = mpc1_remove_mpcc,

