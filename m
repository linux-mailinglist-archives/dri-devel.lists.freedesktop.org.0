Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB6185F469
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 10:33:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CBF610E8DA;
	Thu, 22 Feb 2024 09:33:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="u+Ggom5a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2089.outbound.protection.outlook.com [40.107.93.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E61E710E8D7;
 Thu, 22 Feb 2024 09:33:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M8XfPfTNl03fstHl14nI7hb5ObEFnboYK+tAuSiq3fhHC/7bXLBONVd3MNofKAdNj/vLl1iZ6FkgvBFT832LGLAjol6oC5EMxrsoLLSqNB+xxJBfQPJZiUECUrUqGkRWSn5Mrxy5/vG/fOKQ1yvBzlUFktWND47yqiNHmhx3Zlg+pdRak+72fOkJyYwR2aexs0ewoi7Am25hWczrRxrfwHnV4SJeinRnwzSjxRSgcpa/cDTd2I3PUaYgeeKWb1x1y+OpcDcGRU1zdgH7LA84HZSxdzHYolgUbJiDCIicMjuLQREyQbz+/UQguwyHDIqPrpsorEfPnH6s/J9cf/kPOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WoyFmyFgqIMY+0WXI249DO9qaR6YG9x/I+Y0pBEGfR0=;
 b=Gc7GhVvbzSy7uaDQeOg/fWCNsv0pxiPb0Mn4dOz0jeCs+JjwEQieXczZeJWS1SPQ9BIGe0A9gTZYwHqeH23eRkYyqtp8V67+Z+rbe27Ox0PsknSwpiVlTqqA/NAK5c4nrKRwHOcVsDySTEAmqQ+YjXZumEiZpWAnLZn5JxFN4n1Xs5KSCbGmacLel88rpbHcy9+uO6HbGilaGilIk6w5MwCJlRp0FD+2PxA/wUN8BR84DIo9zWxy4c6Pyr55paVV8fx4IFkIE/wKx5JeEuU+fAGlxaEtcnPxemqsLRtiifDqkxHTm0f0UCAcIj9hC7TvIBn7wp/B+eQkFL5wu9AS0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WoyFmyFgqIMY+0WXI249DO9qaR6YG9x/I+Y0pBEGfR0=;
 b=u+Ggom5abwJWCOOkkNeZ1sSfeqF2a8sdB4cT4Nf46awV/rytZoVvT9NV3rmDWJQ6jxTbRXu4+K/br+QWM/Ecr2F/FkvPlySfIuX5XOVsnYGJhInVMmiKz/bovxT6jgZulCNDTJgdYeUZUOoCEx9KMe143Zc+AYKylWgC4qkW69U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB6422.namprd12.prod.outlook.com (2603:10b6:8:b9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.22; Thu, 22 Feb
 2024 09:33:05 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7316.018; Thu, 22 Feb 2024
 09:33:05 +0000
Message-ID: <91f787db-9a11-4f6d-8bcb-d0e4b05604db@amd.com>
Date: Thu, 22 Feb 2024 10:32:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: clean unnecessary braces
Content-Language: en-US
To: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>,
 =?UTF-8?Q?T=C3=BAlio_Fernandes?= <tuliomf09@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch
References: <20240217202015.2034288-1-tuliomf09@gmail.com>
 <9b3fc6a9-a24f-4270-ac66-696fde238947@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <9b3fc6a9-a24f-4270-ac66-696fde238947@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0187.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB6422:EE_
X-MS-Office365-Filtering-Correlation-Id: 21f7874a-4588-4187-3f4f-08dc338945bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 10ZW7hFGfTfbglij43hr10J7fj0RxhwwprycSMhQeqY7Qf3oo9y9QNyvgtmW4IYhon+ca1hESnwMYVf+sbmxq1LQ2m7bQ+z7WbYRE49EVg+sEuTfyVu1gEn6i3/XolXVW9MNXnYoswbbJK/rzAoVKCX7AmJuz9Mf2Z7U2IguxXfHy3hTvTs4/8mS/gkxqEyRn1SqWZRnDmrf4WC7+YoN/mLZHbp0X1vA1Mil77uldfBR2YCQaJ8dCc52b+5fCnDld4INRtPS5nY4yrBw1tlPNXLWOBYIScdFWQE3Xx4sZnAdMhtYKNzyMbFXEo75m//yIKxv3Mf/51gvn1NsoUMV5cA9QH+R11mylJ0ev06AUrigm7zXMAURaqTOrT20uWIVnbRmElKN04/2tVvZzfm9LHQYWqocEMAtBJisWlT3W7seRIScpYTyPDt5bhs0dZn/Jebk/ALGuTt1gFFVtZPXHSFRO4oY8AsvsOVlmY+AxEsfAbruLAh8Ue+J5B45yDmlhJ4nlPW54acmB5TQVb4ABtXtMRedYuQueKSAupwwBUACIFDHsMb8fg3NfA45Juf3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(230273577357003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVVxTm1Vak04eUt2dzRlcnFrOS9JaFErSURmQVc5ckdCdlRabG4wMDlZTE10?=
 =?utf-8?B?YWJYNjhvd2NPRmZLK0M5QitraUdkdTRvVEhGSW5RZ1JDUnJCSk9EWVRaYnhD?=
 =?utf-8?B?WTU2WW8xbWRBWXhrTzBrMTI0Z05KdmlCOEFoVFJDWGhFOEZVRWlnUk5XVndl?=
 =?utf-8?B?Zy96dGtEM1BxU0tzZklEejJRM0RoRG85aDA2dHg3d3VuUjVlQXY4YUJmZkVi?=
 =?utf-8?B?cEVVVW5ha1VPcTh2ZTJsNG41amNZSWNUdTl2WkJLdTdqRXowZG82UWljMXBk?=
 =?utf-8?B?dFQrZGdSa2xMaER2U0J1TTFxaVhKNWFXUVk4eDEwQWl4VDA2UkR0bzV3b3dz?=
 =?utf-8?B?ODJoa1ZKRXp0WnMzMjh1bU5lN0hNdEp6TnQrdDM4RkJBbCt6dmVaNnZKVW1s?=
 =?utf-8?B?aFdIQzYvK2FxTElKTHJKK1U0aFo3S3lZYlpaUzduNEM3TFZTNEpqSzVLZDJw?=
 =?utf-8?B?cGZBbVJvallGamI3TWFENTVEUlVBM0xremxrcXZWSVNPT3pmUnNmNHpTMFN2?=
 =?utf-8?B?NWgyWE1pRTk4NGRHL04ycHRZRU54MlRsZ0lJTERoUndCSHdvVXpMK0RaZndE?=
 =?utf-8?B?OHhvZm84OXAxOEpvRktVYzRpRDZuZGNubFhEMVF2dVBKbXlCcFkvbnpmNWtH?=
 =?utf-8?B?Q1RXaXJsVldaMkdqcHcrL1JVTE03NGtPanB4MzZyR2ZEMGcwZ1REYkdsSCsy?=
 =?utf-8?B?V3g5N0lxcFBFNEM2NG5QYjVaTGhBclRMUFN0UVRKSEZhRWpJL3c1ZG55cFJK?=
 =?utf-8?B?ZVBqalhkcnN5c2thell0cUpQeUNwR085RTFWM1JMSkkvcDg2U3FUUE5JSWZ6?=
 =?utf-8?B?Z1lJbXNmU3QrSWdKeFNLcllub25RUTkrek8rQ1pndVdYVGJtckNDakhlc0wx?=
 =?utf-8?B?NjVNN0F3MkR4RDRQb1NPU2t1N0FHVWM5a3F5YWttdjJBdUROMm91Rmp2d3Zu?=
 =?utf-8?B?dDVYbkFXcFhhZENxN1dXdVNlODF3T3FFV2VXSHhFcHlKcE1odDRNTWw2WEhS?=
 =?utf-8?B?MUZyM2dlSnR6OEwvSVVKcVBkNTNHN0Q2Y0diTHJ5QTF3cElwLyt5dFRUak91?=
 =?utf-8?B?RGkwRkFnaUdESndrOVN5SWpMWlZoNWxDTUJUNk5IRGp0NFVKUmxuemhWalJq?=
 =?utf-8?B?STJSOFFRR3dMV0lGcGd0Vlo5RFl5SUxyZ2JkZHVoZlNGSytGT0xhc0h0YnJx?=
 =?utf-8?B?YXl2K0Zha1QwVFV1WW9uMEJVc1c1eWVJUUkvR1pGaHdWTDY1S1plbnFNRTdY?=
 =?utf-8?B?QzdpL01JU3d5cmZUc0JoNTltaElCSzdLT3NNVWVmSlIxa1pyQUxYbFlFaXVy?=
 =?utf-8?B?MCtLWUZ4dmxkSnFnQ3RKMXlUdlZFdUVpL2ZDNFAvdUZaQWFOd3hlOEcwL01x?=
 =?utf-8?B?UGtvdnh0UTc1akxYSzV6TXh3b2RJcUVPS2ZtdC9GRUQ3MkhWQjJPOTZuLzZC?=
 =?utf-8?B?M2diYjEvK0locVRNS0sxeU9pMzNrdGF5dW5STG8zMUNvVTRBamtKL25PcUlU?=
 =?utf-8?B?QnkvaEhPZDBMM1BValA5WFBOZENCNnpzaGVSN1BGUXlGZkcxd1VSVzRIZFNJ?=
 =?utf-8?B?REdLaVdDcVg3YU4zYmtMZjd6RnZ3MjFKWEZBZU5Xb1lvWkpIM3VvdnQxbldY?=
 =?utf-8?B?dHpFZUxEdmFoVlY1NzBRMnVFdDlZdXp6bmxsQUkzVEJuZkZoSGMvYTZSWVVi?=
 =?utf-8?B?MmREMXp0Q0d6NjVxTXN0NDgxcUdSczJXYXBJL1pTaHdpQ2E2TnFNemF6NHdx?=
 =?utf-8?B?Y05tN3B5c29Nb3daMm5UR0pHdDJuQmhrUHA2ZWV0S2pqUUttTngzMzgzemZk?=
 =?utf-8?B?cE9xOHhlK21ETlhhMGRoSUNrYnZ3a2RLQnd5US9Rd2xkM28rZllRT0dtOU1y?=
 =?utf-8?B?RURxZ1BXVHN2ejBDaldLVWhLeDhIcWV6bmJ4ckY5QUNPMEdCWDczdjNNaEc5?=
 =?utf-8?B?YzB6S3ZpSGNXbzVSaHk2dklzMlA4bGZNZFpkd0FDWWRnWmszWStiNmdGY0po?=
 =?utf-8?B?Mlh0Y1lIVlQxUnhOQzhQcksvb093TkRrQW5DbmU5L3dibXEvYUxETDlkV2tm?=
 =?utf-8?B?WWVIUWc5dXVzR3h3OXlPaHhuKzVvdFVCQ3ZwYUUzQTdZdHRxbWFwYWhCbGJk?=
 =?utf-8?Q?BDFOcMtmg1MFHj4ft1z1Wu17p?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21f7874a-4588-4187-3f4f-08dc338945bb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 09:33:05.4339 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rSTF4KEDJu5uZjTL2VXBkGTjlDDGyl6g/HlcNfP30VNOE/4rY5K1/MlxZqQ7ctoU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6422
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

Am 21.02.24 um 19:01 schrieb Rodrigo Siqueira Jordao:
> [SNIP]
>> diff --git 
>> a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c 
>> b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
>> index 87760600e154..e179dea148e7 100644
>> --- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
>> +++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
>> @@ -110,14 +110,12 @@ uint32_t 
>> dcn32_helper_calculate_num_ways_for_subvp(
>>           struct dc_state *context)
>>   {
>>       if (context->bw_ctx.bw.dcn.mall_subvp_size_bytes > 0) {
>> -        if (dc->debug.force_subvp_num_ways) {
>> +        if (dc->debug.force_subvp_num_ways)
>>               return dc->debug.force_subvp_num_ways;
>> -        } else {
>> +        else
>>               return dcn32_helper_mall_bytes_to_ways(dc, 
>> context->bw_ctx.bw.dcn.mall_subvp_size_bytes);
>> -        }
>> -    } else {
>> +    } else
>
> Actually, we want to keep the braces around the else part to keep the 
> braces balanced with the if condition.

Yeah, and checkpatch actually complains about that. E.g. you shouldn't 
use "} else" or "else {", but always "} else {".

So the patch is actually a bit bogus and introduces new coding style 
warnings.

Regards,
Christian.

>
> Thanks
> Siqueira
>
>>           return 0;
>> -    }
>>   }
>>     void dcn32_merge_pipes_for_subvp(struct dc *dc,
>> @@ -250,9 +248,9 @@ bool dcn32_is_psr_capable(struct pipe_ctx *pipe)
>>   {
>>       bool psr_capable = false;
>>   -    if (pipe->stream && 
>> pipe->stream->link->psr_settings.psr_version != 
>> DC_PSR_VERSION_UNSUPPORTED) {
>> +    if (pipe->stream && pipe->stream->link->psr_settings.psr_version 
>> != DC_PSR_VERSION_UNSUPPORTED)
>>           psr_capable = true;
>> -    }
>> +
>>       return psr_capable;
>>   }
>>   @@ -278,9 +276,9 @@ static void override_det_for_subvp(struct dc 
>> *dc, struct dc_state *context, uint
>>           if (pipe_ctx->stream && pipe_ctx->plane_state && 
>> dc_state_get_pipe_subvp_type(context, pipe_ctx) != SUBVP_PHANTOM) {
>>               if (dcn32_allow_subvp_high_refresh_rate(dc, context, 
>> pipe_ctx)) {
>>   -                if (pipe_ctx->stream->timing.v_addressable == 1080 
>> && pipe_ctx->stream->timing.h_addressable == 1920) {
>> +                if (pipe_ctx->stream->timing.v_addressable == 1080 
>> && pipe_ctx->stream->timing.h_addressable == 1920)
>>                       fhd_count++;
>> -                }
>> +
>>                   subvp_high_refresh_count++;
>>               }
>>           }
>

