Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0288A12D5
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 13:18:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C66E10F026;
	Thu, 11 Apr 2024 11:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TcO+lsli";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2055.outbound.protection.outlook.com [40.107.244.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43EAF10F021;
 Thu, 11 Apr 2024 11:18:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ayaD5hGBX1Y8Boh+DCGGYOQa0E+Z6So53GL7/DOTs+xXPXQWISCun6ouqBVM7unGaIWiCAbRhoniBLRMDRupr1UP+z93xgvoZLTUj6Nqwal3zlZ0btvk5ZEHKiLlVj6IWcqSuXtMpZCFyw6X88Hg6/bAXsfR2hTvSeaMPdDB+VR4SmggD7LKIVIs+wmsUFuWQy+3qzrAMER2o+ieQ621ILH/zZL7TmIL1v4ArtTvApqPcxuuio6i4bK5RRr9OhhZK2dDDtNndrR1WX4JeKWP4hQnPToAEWKP3BQOr345F8O+NsisJZ2SXK5nxZ0aCKBMw8ysjF1h5A7tV6/Ek2eNHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c54fAGb4hCAExP54Lu0hMxIH40Pv/RR62UEDmC6A6iw=;
 b=n5bXQY6Xfqm3PBzSQ8I3ZsdFCVOidMnkP9ANgYKs8u3YTrq/vcN3SyxeQghj9S3A6kD8G2epiCwK+7Mhhpf1a2UkAI4Bfi8M8MDckXZpaKZqVSVodsUwtTAT9z++coOLmy0jkGeDjAM7Hvr9D/8PsfLeKWJmrUnKI7WBzLFY9wtrYRhPUeU7UJUqdzO5TrN/iSB0ZPQ8oZ7vOL1c2Oy/SmSn+VTuJ8LRzYutFfpe01iz6+yOSDIk23IIsoF8rbgNa8BitmWzmKYKMnHNIEBydWszJq3KY84VEJW9WeBFp0jS23XBBqNYwRdzcka2nMM3MIhAFRsGNeR62bQfTWxLzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c54fAGb4hCAExP54Lu0hMxIH40Pv/RR62UEDmC6A6iw=;
 b=TcO+lsli2KGU2DmyAxbYS1r933BTRPM1D8lL7YimShQgGHi4jTiTdoLnuJEZyOvTrdwm9SiqbSx42Wx8w9dZDjre0YE5+BzXOt4wIN/wnJWW5B/LPXvvaZR3khjFZJT0b35adFiC9FICIUICmVQmdtmADS8CA1f2w68QYLnaGlE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB5620.namprd12.prod.outlook.com (2603:10b6:510:137::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 11 Apr
 2024 11:18:35 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7409.053; Thu, 11 Apr 2024
 11:18:35 +0000
Message-ID: <52814612-7664-4953-aa3b-980d59690734@amd.com>
Date: Thu, 11 Apr 2024 13:18:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] drm/ttm: remove unused paramter
To: jesse.zhang@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Alexander.Deucher@amd.com
References: <20240401030443.3384494-1-jesse.zhang@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240401030443.3384494-1-jesse.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FRYP281CA0010.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::20)
 To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB5620:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b0c5293-cbc2-4885-9a87-08dc5a1920d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kW4lx/eGieubz/tLjYmrnOfBkg8qpfHVQVkiymOicRP5nkYm9UyEznhQXcVzudk0xZu7+9Z0gqJkiBtgbO/62ZkNrnBh58iyS2Z8wgcMuWS9gbcSvKxOXN8NACJ59LeCD6duVbZBfx9iI8WeEUAzCKQL1i9sqRrcJDwMZwWJlqh0Thloke/oAGm8rH0AtQkA3Ovt8iAWYlhitXPIQO5beG5L9fmghs3ORvsenbz2hgyr6YOwe6+jIxDOSU5os/O2L/roevPyQnQ8Dun5OLRqkwHihOIX75Or/PwCFVFOWf514//MKcR1lNQDpztSj4dVuWGfe5Q4AREOdlH4PTcgBUe/H0qLzYMHHyW9eXNXDJjFe+j1PrpsXHUgMOUiPurcavE93xkkRJXy3CjpV17EWHiezzYlQFRgSVoTTnIx9XBDlr3NsV/25qbLyq5AtEYdprapBAoN3Yg7dLWEgjKVPSI7sPYiJybWRsG2dKX4dxgqo+lPjYeuznsX1V8Q0zvVnGsJ11M91bWpGUxEK6JJIAi3UQ3DMzHrWbaYTrP8nrPFTLmXFUVPQPbUJOPSsouNQmYzjfUbCspU7hpHBbJe/vfFz6Cp8HfJqG0kC1p2WBgwSZQLA1Ze99XN6+8spj2k777rNG8bAj6p3W5icNawkZmnRapt41PllZIIXjK0Aqo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlRQVE1VNWRRMU5QRjdDSUIvemN4YUxiZFpwMWc3UWZhbDdSWEhCTGthOWJG?=
 =?utf-8?B?clYzRm1FQU1aU0JYL3k3Vkh0N09kejh5a1EvaEhtNWgvYUluT3NvbHMzSlBh?=
 =?utf-8?B?elVKd005MFhyNDQ5N0p6SG1SdUZJSnpuQUsxLzNYbG9vUXM5ZmphdEZjZWMy?=
 =?utf-8?B?RDBRUE4xMjV4aitqUC91OXJBWmcxS215RFhjclpKZnRKNzRCcDg5akZoMzJS?=
 =?utf-8?B?Qkc5MCtIcnhUSkl2ejQxNG9GQnJGSS9QTS80MDhSaDNmTmNMVUoxSjE0KzBJ?=
 =?utf-8?B?bHltVWFSRGE5ODNhbTU4TUpFTCtvdFBzQUFyK2MvSE0ybUU5K2h6WWdOOWZm?=
 =?utf-8?B?ZVhyZlZUTU9GQzdZWndCbkl0dkJmeHR3dlg1UjhFZENqbmFUZWtXNExjR3R4?=
 =?utf-8?B?K0Nmd2ZzRENKNktROXNXaDJsbUd0UUFoQWN0UnlKNkZNL3dxWWE0VGYrOEQ5?=
 =?utf-8?B?UFlYRmQrVzBDMi9xYUNuVjJ5UGlLRklHem92dWZENkg3akNjWFJNWTNaMkp2?=
 =?utf-8?B?QzdmVmU5WHl3bGFJUUl1Q2t5SDdid0Y0R3p6dFZwTDBCTDFvUno2b2dMMUN5?=
 =?utf-8?B?bnZWbEhlbGFSMUJPUUlUdE5MT3V4ZWFwSkhFbzJUTkEzK0hab2p3Nm5qZk4w?=
 =?utf-8?B?ajNzeHh5UUJqcUxrV3JzVm9UMXlDekJ2MTlSWHozblF4dkY3UTdaVVRoMkJG?=
 =?utf-8?B?dUozcFpUVnNTVVE2Tjd0cDIyREZSRkY2d1MzMFVrWG1pVERwUXRJeFFUZ3VN?=
 =?utf-8?B?VjhCa2tDWk9CTjlmdWxVVnRURDB0U0hMUERaREo2RERqQ1UrWTllaGpuNkxO?=
 =?utf-8?B?STRLT1ArdDdqNUZTVHFsSHdnTnhXSlduMjV0U2o1RXdUNW5QdGFTVkhEajRE?=
 =?utf-8?B?cUYzTER5ak40RElabEc2bWh2RFIybHVNQ3dISFU2dEFNWmZmU05lUGk5RmZI?=
 =?utf-8?B?bzBUT29oUmNWTEtDRWdFUnpzSU5kQlp4MlhRdzNYZVF0VFA3YU1udWxEVFM0?=
 =?utf-8?B?V2E3MmFKMnNSbXQ0dElxcjhNYTBhVlZMbFl1d3FXenB2WUtUWG91YWdjczRa?=
 =?utf-8?B?V09JUm0rSnhFZktkd2ZLdDdyaFFCUExyeHB4ZDdkUlJib1dSdHkxdDl4dU16?=
 =?utf-8?B?dlRwZG5JcGFSdmg3cDNQSENreHRHeGlaK0VqbDVmNHU0YjJhSzdMajRadHVx?=
 =?utf-8?B?dnhpZ1VVMk1Ic0ltd3JSdDJESU1MVWxQWGJkeENFdDZEYWFTcHJ2T1V2Q2dP?=
 =?utf-8?B?cHBBTVFaMTdrM2ZCa05KcnFadzZwMEJQbWtmS0UzeHhsNy9OUndRRVZSNWVy?=
 =?utf-8?B?ZUt6NkJuQzAvdmZzd2VBOGxBQlF3K0h1b2JRbnZaY1kwaEczUGNPdVU2aHIx?=
 =?utf-8?B?SWV4OG9JTjk2MlpFSlBqODdNQW5nV0N1b2FSaFFGSGI2clU1TzNvWUk4cWZr?=
 =?utf-8?B?TTZuRmlLQWkraC8va1ZPVmhVRnNqaENyb2wxRm1hejQ5SmUyUUdjODVjNzhu?=
 =?utf-8?B?T25TbnBmRTg0dE9SSXVYbFY1N3hGQWJXMEFsOVNHV2RPdVROSDlSdmM0NG5K?=
 =?utf-8?B?YXNzR0RlMlFtTDNYUGZGWXgvd0FtcUFia1pRRGVmUDRtM05NWUlKMGVkdzF6?=
 =?utf-8?B?L09MU1F4WXp5SS8xOThGMXJkbW1PS3U0WEZETThhQm56UFdhQi9yZmh1b2VX?=
 =?utf-8?B?Z2IwMHgvZVoyNlRLNzZaaHIxMlRYUTVabnFySW5LZ2c2ZDh6dFZjVnpZQUVw?=
 =?utf-8?B?SDV4Mzl1UkRpY1JIZXRiM3gybFBVcHU2RGduL1ZCdHhlc0VubHdZSXpxRUlX?=
 =?utf-8?B?bjNkNWh3NjZwdDZBZ0wrSmd6OXBVcXpocURUdXRRR1o3SHNrNTg4Mysrbmpz?=
 =?utf-8?B?K2RyQWU2VStYU3ZSZ3JYNExzb3d5aFAxWjN2elFnaTZIQVVuZXBIdm04WFlG?=
 =?utf-8?B?cExlQ1FtMTg0WTlKLzhXNXVNWUJyUmZNZXNOWUpadnVIRkRSNmNHQU9yUVgw?=
 =?utf-8?B?Y05RcEJyVTNCazVJY0M5RyszZ1d0TUE3OENNYVM2aWdHVVpOYXVvcGpJYXM4?=
 =?utf-8?B?OWFSelJ5cHBkbzZhN0NYdmZ6U09ZbWxBTkdFZzhyTy9VUlVEK2lKYm93ZjlZ?=
 =?utf-8?Q?Kr9RjzFo5yfWMz+RUkG+/qCj/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b0c5293-cbc2-4885-9a87-08dc5a1920d7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 11:18:35.4119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vzuGeSnNkjxOSZ1dEVKvlbeqyrZMjYZLU7kz8bVL+aS/5EcXmIfaKXekguCfA599
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5620
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

Am 01.04.24 um 05:04 schrieb jesse.zhang@amd.com:
> From: Jesse Zhang <jesse.zhang@amd.com>
>
> remove the unsed the paramter in the function
> ttm_bo_bounce_temp_buffer and ttm_bo_add_move_fence.
>   V2:rebase the patch on top of drm-misc-next (Christian)

And pushed to drm-misc-next.

Thanks,
Christian.

>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> Reviewed-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index e059b1e1b13b..6396dece0db1 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -402,7 +402,6 @@ void ttm_bo_put(struct ttm_buffer_object *bo)
>   EXPORT_SYMBOL(ttm_bo_put);
>   
>   static int ttm_bo_bounce_temp_buffer(struct ttm_buffer_object *bo,
> -				     struct ttm_resource **mem,
>   				     struct ttm_operation_ctx *ctx,
>   				     struct ttm_place *hop)
>   {
> @@ -469,7 +468,7 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
>   		if (ret != -EMULTIHOP)
>   			break;
>   
> -		ret = ttm_bo_bounce_temp_buffer(bo, &evict_mem, ctx, &hop);
> +		ret = ttm_bo_bounce_temp_buffer(bo, ctx, &hop);
>   	} while (!ret);
>   
>   	if (ret) {
> @@ -698,7 +697,6 @@ EXPORT_SYMBOL(ttm_bo_unpin);
>    */
>   static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
>   				 struct ttm_resource_manager *man,
> -				 struct ttm_resource *mem,
>   				 bool no_wait_gpu)
>   {
>   	struct dma_fence *fence;
> @@ -787,7 +785,7 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
>   		if (ret)
>   			continue;
>   
> -		ret = ttm_bo_add_move_fence(bo, man, *res, ctx->no_wait_gpu);
> +		ret = ttm_bo_add_move_fence(bo, man, ctx->no_wait_gpu);
>   		if (unlikely(ret)) {
>   			ttm_resource_free(bo, res);
>   			if (ret == -EBUSY)
> @@ -894,7 +892,7 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
>   bounce:
>   		ret = ttm_bo_handle_move_mem(bo, res, false, ctx, &hop);
>   		if (ret == -EMULTIHOP) {
> -			ret = ttm_bo_bounce_temp_buffer(bo, &res, ctx, &hop);
> +			ret = ttm_bo_bounce_temp_buffer(bo, ctx, &hop);
>   			/* try and move to final place now. */
>   			if (!ret)
>   				goto bounce;

