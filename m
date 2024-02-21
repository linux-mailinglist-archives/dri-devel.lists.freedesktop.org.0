Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C222985E51B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 19:01:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09A6110E6E1;
	Wed, 21 Feb 2024 18:01:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4M9UkG3y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F067810E679;
 Wed, 21 Feb 2024 18:01:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d/sl8O0BHvQW1XgIalUpPssi2yjpzdbLY3eKwsxHgJ+RbZ9c7Xg3P/Ap98GJ+/IZtRHamcyN9G7yFPRV41pCXVA5j+aX2ls9dwLw64wgu40+30JKqdFL5Y/aKPa+VOij8EmfMezyhTeFzRlxmvO+6k42mHqWvubR7U3lPhh3Q3xhcF0ZRfmanyDmomj68nTozNK7QR2nWmMyrv9yZn+D9y/HTzoLLUAUzvsteOvcG0U/oFG065HOjQIXHAfmSriTnWfv4/29ogqo+uXXWmXQoZi/wcxUz2kUYiDMU0SaK7vLLi3ALQ4ygSpJU2zmNAD/Xe/8cZiErs9hGISU6tFS5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7O8OtVP7wO+f1YEhBJN+rn6OoZIDzcBgc21v+IQ9T3M=;
 b=lHOoDniGeVHiduCblsg/nJzVtDkEhG2H2+7cpLLcBiidRtng5MGETNZg+hiL4i2MUxpt6F+OHmycuFvIkiqu4AObTXZKUijuhaqE60z0aDeb8c6MrQCPjx6Ac5tvz4n03m0w60PVc2xVNcnowIGD/ZbQKk37Eu0yZy5MjVxuwdWWaUqBGalrV685/qCNQTSw4vmTWUm+bHesnp/Td2by19HH9gXw/7Wzrhn53aGEPwKtHy1CxLhn7PahpBtSGQVR28ZER3hshGsHxbkLVN1ao0bclsVB6tdQU3VArZ+WF4lXWmq1C2oFucPmyuw8SyfMZ8/SLN6BdU5Tc2TFu5HdiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7O8OtVP7wO+f1YEhBJN+rn6OoZIDzcBgc21v+IQ9T3M=;
 b=4M9UkG3yvdh9CYrJbGuEZ1V9L2hnPtjwI4/oP1GFJpf9Pp+W1ZdTik2KVDTNzsTgRlkFI+L231q5Sl7thJGxq6ADkf0XjVAlurtLbLjr2s9X/1VfLLTWrbNJLjYr7IxN87UxslUP03JcrsraiDJANU346W0ceW76MWXZdu8triY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW6PR12MB8733.namprd12.prod.outlook.com (2603:10b6:303:24c::8)
 by MW3PR12MB4380.namprd12.prod.outlook.com (2603:10b6:303:5a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.17; Wed, 21 Feb
 2024 18:01:08 +0000
Received: from MW6PR12MB8733.namprd12.prod.outlook.com
 ([fe80::36bb:f12:cd0b:9e8e]) by MW6PR12MB8733.namprd12.prod.outlook.com
 ([fe80::36bb:f12:cd0b:9e8e%4]) with mapi id 15.20.7316.018; Wed, 21 Feb 2024
 18:01:08 +0000
Message-ID: <9b3fc6a9-a24f-4270-ac66-696fde238947@amd.com>
Date: Wed, 21 Feb 2024 11:01:02 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: clean unnecessary braces
Content-Language: en-US
To: =?UTF-8?Q?T=C3=BAlio_Fernandes?= <tuliomf09@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20240217202015.2034288-1-tuliomf09@gmail.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20240217202015.2034288-1-tuliomf09@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0755.namprd03.prod.outlook.com
 (2603:10b6:408:13a::10) To MW6PR12MB8733.namprd12.prod.outlook.com
 (2603:10b6:303:24c::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR12MB8733:EE_|MW3PR12MB4380:EE_
X-MS-Office365-Filtering-Correlation-Id: a3a30efb-4949-4525-ac84-08dc33071443
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tDSf+IRTgzOnABIhIvoHwjDZSWMAU3UQnXsGExIb+8Fx4Fi+bUfM5hgQcHTipCZ1cWnaShMm8jpF0lmR+MFXDP8cn8rsAPtRlPY1Xjx8ZBez0R7d1NcRfwpgmi/NWpGPjX0v3XK9kFIcatl6kDQWSo/0W/Yb5gPtdctIY9SR8C6m6C9FcJ4B7Z+Bmf2tO3p9RrnplMapppVLZdUf91Epy9VNVGvL5K5aWfgk1PgTlPK8oacT9cHoNrIjj9Xao0RGbfsFoLCv6aNjcrGWLvsj3xstG9K/2liyr/2XS6yRPrDpI1V2tMxZqhrfAQYLsMWN19jG5HiBEmbc2yg2j8+U5F/QF2X8OrTNY8pAX/MZu7xzHPmruVowpmvQ3BqD/aHk6ACytJErMDPkuIMxDuvQNECnj5bb2Rc8c1bvNBqffOnAqGE11fA0xXUF6DxMjl+kSgwQAbRYLmvrJvP2ny/MB7q3DUuHTQZGda1nQWHo1Ne5GT+rcDNI+XgKD4saiude4rx5U2XsMTAHBsQHG9wAdBlJEj1ZtpRIMyVnQhpo3Gw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW6PR12MB8733.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjI1M29EcWFrMndZN2dsK0JSa2JVWmJFeC9zMnZnVFhxd04xSmtBbkhhemsv?=
 =?utf-8?B?SnV0RUx6eFNtRElhR1dGSEJTQXhKUVM5bWx3elkwaTdOdG8vZGduQzU4L08z?=
 =?utf-8?B?WTUxdlRyZmdlUXdXbEhkRnp1UUEzMFV4aHBlV3N1TW1VdURLWlNpQjIvRmlm?=
 =?utf-8?B?VnRvNnJKSUU5T2RGT0l1bGxUZzNJazEraFhkMzk3azU0MnBPbkN0NWx1TXV0?=
 =?utf-8?B?dncxTU8rZlpRaXlkWGZVVFd0YnFOcGZhLzBubmx5azl4eTBhSzB0RklpOGxC?=
 =?utf-8?B?TGEyQjNEdC9wRWl3R2VZUUwvQ1VHN0ZnMUczMlN2bVh0eUw1a1VIRkFKeENS?=
 =?utf-8?B?Ukdic3B4MGozZjVINFJSTlBTd2pEUGIwcTJGVzJndUIvNVF3b3dZUHUwVTQy?=
 =?utf-8?B?cEtVQU9DOVJNdENYKzIyZzZtVTQvZ0hhTVVNaEMwNHhGWnA3Z0szQVRrRHJN?=
 =?utf-8?B?b01GbE9YV0J2d0ZRRFA1V3dBT3lpcndOcGhETjhWbWg3anJONUJicXppN1M4?=
 =?utf-8?B?ZlJLako0NExXQzV5Qk82a2hKSDQzY2RBMktqWUZuNitkNnM2c1RUOEZiWm9E?=
 =?utf-8?B?dytxQm5PNXZtNVRZdis2ckFvVXdZc3ZqQzRGblFkS1dSV3RPbWpGTEp2a0pY?=
 =?utf-8?B?b3o5dFNXMjNWTldNQzcxbWN5OUF6RXk3T282MTlERGpOTGFPMHFHdWpsS0tQ?=
 =?utf-8?B?NlVXSERxTGFtenpZZ1YvU1lUOEd6RFdwUVhYbEF4N0xCRGkvTXpTVk0xKzF2?=
 =?utf-8?B?ZTJHMlhHOGR6cjdiQkQyclFGcnN4OXp1Q3poMG5QSVUvdmt6U2I1Y2FlZGhQ?=
 =?utf-8?B?Zzhtb0tyQkROWkFtMDQzS3ErSjRmUWN5R2g3WG9tSlRlalBGdStYL0N0c2hs?=
 =?utf-8?B?bVlhelZleUNiOC90dDBKWlBQeXJqanp1eU81SXZrWTB4RzFmbWdaT1p6TW5O?=
 =?utf-8?B?N20xRTJ0VUsxVGN6VHFCcXkvb0FQYlpRdDA0VWNFMVNHUFlnblZrVGlENk93?=
 =?utf-8?B?WkNyZzVvUnNSdnV2R2txZGhJNStWVnFxdzNVQ3htYWpoV3lVbzNDV0hoeU5h?=
 =?utf-8?B?S25nbkpLMWptczhnOXc4R3lyMmo2L1BlSmZ3VnNlNmlUYWxHMnRsNjhiZnJG?=
 =?utf-8?B?MU5IeWFIa3hHak56M2FMRSt0ZG1Sc2pUNUtscVloV05mNGpKaTFZYjY1UlFE?=
 =?utf-8?B?SWVyNTBmRmRxaWdIeUx0K0x3RUxmbnRHZ1ZLeU1HTjRoUFlOaHJkdUcxa011?=
 =?utf-8?B?VVZ0eDFvOC9FRkR3R2FKQTRER05Rcy9PVFJKanRPeEx4NVd3SzdlS0xXN2hj?=
 =?utf-8?B?MEhkUWZtR0I5bFNySzZRMVQvaDNuZVNRY2ExZ2kwN2ZRaUFhOHplVHc4UmVa?=
 =?utf-8?B?NURFdkFwMHdwVFcvbi9xbGl5aERJR25pMy90VVZDL3ZLaTlWQjF4NFlZK01L?=
 =?utf-8?B?eGRkd1lSREhSQ0d4aTF4aDRvMDVwemxCMTUydHlOVHpEWG8xRXVGM1dLOThx?=
 =?utf-8?B?LzRobWdQTWFhcDJUQ3g2UEVseUJZT2tkb2pwVEVjbkpHNU8wOWxxcHNNK2dV?=
 =?utf-8?B?bHZVeHRPeFdpaU1VTTR2R0Exc2JWd3JBMDBqU2tnY3VGYSswNXBDdk9aM01y?=
 =?utf-8?B?UFhRWVlRNjNFZ2JSSjNsWFd2N1FFWE5YbiswWDJ1NjM3MVBRVlVORU9mY0t5?=
 =?utf-8?B?SVl6YnhKbndQNUtud0dNd2FOVVVvTXFHYjdHa25jWTBReGxrek02T045ZHFD?=
 =?utf-8?B?VllnS3I2ZWpMS1JWYUxwcW5tR211OHJrNHhrTElrYUZPemYzMTh4eEtVaWdZ?=
 =?utf-8?B?NUh0MzRLbzBtZ1RaK0lQQ01pRjc2U3JGdW9TdmFmVWQxeU5ROVh0bGZ3Rzg2?=
 =?utf-8?B?cVBKNmc1N2w3NXZBTGd4aGRyRncwRlpuNmxQaG0zTVBOd0ExU05CMndtV3J2?=
 =?utf-8?B?L2xYaGVYS1BqVmU1YVlaU3RhbWpxQVpON1NXNkxuNHl3VWk4dGhyZ2g3K3Nq?=
 =?utf-8?B?WWI2T2JvWFhyOGsvQm1tU0ZUVmJBd1NqWDFja3ZqVFY0M1J5aGhmUkdDUDEy?=
 =?utf-8?B?aTRnV2h6RkM2azhJU2hHZEp0WEdNSDVPR0VjWHVQYlNhZ0J6NWd4Nk44djA5?=
 =?utf-8?Q?+3TxrXrOfBWbCa/+/aona1mG2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3a30efb-4949-4525-ac84-08dc33071443
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB8733.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2024 18:01:07.9580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8M/KQy7fmdtVYHwNj3gLF2uBSyLISOZw31gAHFA7vZztQhwWAaMWdh/Ev2T8tvplaqGo6Yv/ubgzxADxUMm3Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4380
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

Hi Túlio,

First of all thanks for your patch. See my comments inline.

On 2/17/24 13:20, Túlio Fernandes wrote:
> Clean unnecessary braces in dc/dcn32/dcn32_resource_helpers.c and dc/dcn32/dcn201_link_encoder.c

Did you identify this issue with checkpatch? If so, I recommend you 
paste the error message in the commit message. Iirc, checkpatch provides 
the file and the function name, which can make this commit message more 
informative. Also, wrap the commit message under 70 characters.

> 
> Signed-off-by: Túlio Fernandes <tuliomf09@gmail.com>
> ---
>   .../display/dc/dcn32/dcn32_resource_helpers.c    | 16 +++++++---------
>   1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
> index 87760600e154..e179dea148e7 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
> @@ -110,14 +110,12 @@ uint32_t dcn32_helper_calculate_num_ways_for_subvp(
>   		struct dc_state *context)
>   {
>   	if (context->bw_ctx.bw.dcn.mall_subvp_size_bytes > 0) {
> -		if (dc->debug.force_subvp_num_ways) {
> +		if (dc->debug.force_subvp_num_ways)
>   			return dc->debug.force_subvp_num_ways;
> -		} else {
> +		else
>   			return dcn32_helper_mall_bytes_to_ways(dc, context->bw_ctx.bw.dcn.mall_subvp_size_bytes);
> -		}
> -	} else {
> +	} else

Actually, we want to keep the braces around the else part to keep the 
braces balanced with the if condition.

Thanks
Siqueira

>   		return 0;
> -	}
>   }
>   
>   void dcn32_merge_pipes_for_subvp(struct dc *dc,
> @@ -250,9 +248,9 @@ bool dcn32_is_psr_capable(struct pipe_ctx *pipe)
>   {
>   	bool psr_capable = false;
>   
> -	if (pipe->stream && pipe->stream->link->psr_settings.psr_version != DC_PSR_VERSION_UNSUPPORTED) {
> +	if (pipe->stream && pipe->stream->link->psr_settings.psr_version != DC_PSR_VERSION_UNSUPPORTED)
>   		psr_capable = true;
> -	}
> +
>   	return psr_capable;
>   }
>   
> @@ -278,9 +276,9 @@ static void override_det_for_subvp(struct dc *dc, struct dc_state *context, uint
>   		if (pipe_ctx->stream && pipe_ctx->plane_state && dc_state_get_pipe_subvp_type(context, pipe_ctx) != SUBVP_PHANTOM) {
>   			if (dcn32_allow_subvp_high_refresh_rate(dc, context, pipe_ctx)) {
>   
> -				if (pipe_ctx->stream->timing.v_addressable == 1080 && pipe_ctx->stream->timing.h_addressable == 1920) {
> +				if (pipe_ctx->stream->timing.v_addressable == 1080 && pipe_ctx->stream->timing.h_addressable == 1920)
>   					fhd_count++;
> -				}
> +
>   				subvp_high_refresh_count++;
>   			}
>   		}

