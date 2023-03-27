Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7356CA930
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 17:38:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12C510E395;
	Mon, 27 Mar 2023 15:38:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2074.outbound.protection.outlook.com [40.107.220.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C914910E395;
 Mon, 27 Mar 2023 15:38:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fDN2e45K6mNT9QrD9c3/jYB0D8wVVxF27hIv2EVn1SUnQ9fH5w1ZWpb8DJD92Jn/tKF2gPSq+jcCXa/PcXhjZjRkPsYPkSUErvX3aJbRcIc7Xn+YRcW5mu5DxU+1lM/t49HN0ogCwkkI7wwCJ5Kv76AqS73+BtIJ3S+u6Vn++6DW5cDkzdE4wJSVMqJaKuURRLfVcPzG5ZSm84x+Duf2OkrogeTPGaDu/a+9/FgoG+ZMfQikZ6ve8TrCLOmZns0TdQjDC7xE48OaXG4HR3lBQHwqJE3eWTVjVEBllrf8ePPA4SmENGST4ISpYBfuI76WuUwzgph1FwrClKQHhZK9wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G1kTidXDYNeuIgUbcZEhQvydGi2CJnSLZMVNNpeZM9k=;
 b=m7nbsov6/FCqNObImJMj9RuY9ldyzr5V+KddCjZrw/7H32LTvrAZFskS+NTtMFFcR+oSUpjYzjCDIlm4sodB/KJUZ78eydohLN9Vhepgm+CqwEQQY8CYL7IyFohQ7illrvASc3JVwSGYpw7NKyxQ+kxuYnY1o2f7LPqezxgcZQCv05n7Kk9YTjFe+FdL0blpxJNuJXBY77y3kfweOksWfI5dYNZhJt2Tv1B7O8iM2Z2PT9bGqiPgw1rIg0Tn7yyNL5GYB9a2X4P1NeYyvyaYyXuVa9olLV6TVkV7V/AQ0eYYrx/JiUiQ5zdVuvTgcXpvpjs7tr4wOoMlTTXbT0HYWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G1kTidXDYNeuIgUbcZEhQvydGi2CJnSLZMVNNpeZM9k=;
 b=hKlbdauoRFnGj0s2FywC2X2egCjap70yZwlqARl72kbekGjdBcZIdfCevCDb3FCGroKQjsdRfiXe8umB6URnGSQRRQONKHeiNysCYPkz99Dksb7c8rTgD0TKoPKZTM4ORgv+bjiSoEB/4toOTXX9Xb/bqOI1iKg9DAlwSlYAIec=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 SJ0PR12MB7005.namprd12.prod.outlook.com (2603:10b6:a03:486::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 27 Mar
 2023 15:38:16 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b877:9974:5a14:cc37]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b877:9974:5a14:cc37%4]) with mapi id 15.20.6222.028; Mon, 27 Mar 2023
 15:38:16 +0000
Message-ID: <ce68bf88-7b45-a11c-775d-36656b5b9ee3@amd.com>
Date: Mon, 27 Mar 2023 11:38:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/scheduler: Fix variable name in function description
Content-Language: en-CA
From: Luben Tuikov <luben.tuikov@amd.com>
To: Caio Novais <caionovais@usp.br>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20230325131532.6356-1-caionovais@usp.br>
 <17ac25df-1e06-ae3a-e04e-831e20f00323@amd.com>
In-Reply-To: <17ac25df-1e06-ae3a-e04e-831e20f00323@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0067.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:111::22) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|SJ0PR12MB7005:EE_
X-MS-Office365-Filtering-Correlation-Id: 63cb1912-e644-4bab-ba59-08db2ed94890
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AtV3RY7F4eB0kqlY6XcmsMNf2vBp+jJ/8/KCfBqWlhrdhP7g5aBp5JF5lqqtedmoIHLEZ8TOaooEatXre44DrIfiqgoHNFByJReYsDOS+qPx1cCwwE0Wfoin/n4afwHzN3r6BqvA7EQNyr/GJJGLqvCX5dfeqseksUbkLd4zH+9Qo8tclf2/5KW7x3mqRVbWWGme56nFWjPaPLc67Y8pzOSRKIt276UBDFc8J4sk2fQ0WwiocIkwN/0K12oSezyDq/QnjOHfTn5sZaJwqLuDwA361OSk0zVLwvu1OCdMHaKfGfT7uZSdvUNfk/VW0lIShXuNEpQaaFh21OvTOM7V/gJ1eqV6Er0PFX1O/Lwq5PQzgygSPIFQqDUSpQRTegNEPg009DJNMRmPFKMOUMrg4pP4ne0ZHY62WUsqGoNn0G9Ea+o0kz4DCu3GaiPv7jDB+q9FaimesSml7X1pi5phjfCqg/Q3+kvoCXIAiyLvJPzrk4Gy56hEiEnalyiixybZ+eCAD0rD1X+pmXjKL8vFg/lqK1G0ViXy0Hxe5RQyLAiCu+l9MoU42dvoF6FfzTHMMcyHa+UmfI3W2VHItSxJ5kNAjMiyRYCsfed2st7Qzj5auMQz1HdFQ2DL6PNkOdzHXFFTOmtuOu+8lksSyKDR4Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(136003)(346002)(366004)(396003)(39860400002)(451199021)(66556008)(26005)(8676002)(44832011)(41300700001)(6486002)(6512007)(36756003)(8936002)(86362001)(31696002)(2906002)(6666004)(55236004)(66946007)(66476007)(2616005)(31686004)(186003)(5660300002)(4326008)(316002)(478600001)(6506007)(53546011)(83380400001)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlQremFuYUNuQkFxTnprU1RYRnk3aE1YdEJydG5LTUEwT3lSZU56NktUaEhz?=
 =?utf-8?B?MXNmWVByZm5wMDVkN1pPc2t3VUhJQUJJSFcycTNCWEI0WXpYekZKTk90bElH?=
 =?utf-8?B?TlhrcldYbHpLTDF5eEhiamE3bkFqeWVsajNDY3l2cVltSVk2ZW5HTzlQOFVl?=
 =?utf-8?B?QnI2Q1ZMZGloNU1TcDRPOFdDa0t3VGNpaUNmOHlHL2VhSDBVR0Z2Tno3dDha?=
 =?utf-8?B?MzFkR24rc1dVZXlJdk1EdFFlZHM1SzRPL0lvdHhoUktVSzhKWWxVV0J3T3l3?=
 =?utf-8?B?dC9tdTRhcTJLTklTRjYvYUlmY2NCemozTytyQU8wTFdsRFlZT256dDZEb0k2?=
 =?utf-8?B?UEVsZDQ3NzFXdlVIUnlxSlh0YWFkSVJRR24xanl3bml0ZjZjb05zcEZaT0NR?=
 =?utf-8?B?TFZaSEpOZHRBUkxHM0JDRVE4aUpkYURrNGM2dHNVbndKeHpFSkJSZ3FzUzF3?=
 =?utf-8?B?aFhoNFkwdHUxWE5jeENKNWsySEZoV0pnYTVqMkFlMTYyOXg0NTQxbm44L1FZ?=
 =?utf-8?B?RFU1ckE4TndtcHRmWWZ5NklLcEg4SmdkNEttbXI5SDlEZTgrSzgrejcvdmVv?=
 =?utf-8?B?MlNKRkJRa28xaC9ta2VFWWF6dk5GWUY5eEdNQTVUMm5CajNjRUJuU0NWOEQ0?=
 =?utf-8?B?NmF0MmVTUVVETGZ0MmdYemZ6c01xblFMWit3c3JvWEVBWTFYZ285Qno0UkVl?=
 =?utf-8?B?eTlucE5jUm5BVHZLV2N1ZWR0NGVvaE5DZFdYamFWUTJNcjZpMlZQUW55elR1?=
 =?utf-8?B?dzFURzVXYzV3aGZjOUEzWS9xWENhNnE1UUIrT1djSjA0aXBKMDBrOERkNjBM?=
 =?utf-8?B?dnA5K0U5Y3ZyZGlvc2JheTFzeUw4aC9aT2ZwdDduU2VDVzVUNFNxQisvNkFt?=
 =?utf-8?B?WlZ0QXNYWWxyaXNySkIyTVFhZTVLWEQrVGRSVjR6dmJsZlV4MndXM2dVR3dG?=
 =?utf-8?B?aWFtT2ZPSjkvZ2E1NDVDcjlkWHFleWZ3aUwvbElaRTVwWmZmbEw4eXcwZ1ZK?=
 =?utf-8?B?SzRhUDJFTlhERWhSc3V4RzVxSUE1K0c1NVhURDhqVEwzbEdvc1JuNEw1YU1h?=
 =?utf-8?B?SXp4WXowR3RqaUFjTk4vRXJiM25RU2hwSllTcWV1RzUyU1FMQ1pmWWUrY0RY?=
 =?utf-8?B?N3ZIT0crL2xma1BuTmkyaXV1Z1ZyNU5rRmw1cXhKMWpCMTF4KzQyWWEzQ3pI?=
 =?utf-8?B?UkdVUXAzWDBLZi9iLzh0Y3V5cTVIY0hzZjRxTWMxZGxma1BYSnZ1cEpTN0ov?=
 =?utf-8?B?OXJiQ213NStMWVo1MU04bjNRQUwrTDBFMmtwdHgvVDg5T0xLMU1RQXg5Z2xu?=
 =?utf-8?B?bzJGT1VKNUNqMmgvT1FVK0xsbmNqaElTWlkxUmpvaEE2T0dzRnVBSFUxdHdn?=
 =?utf-8?B?dll6dWVhZXpjWk1BUFdvYWZET0hrTXlPbnlDTmd1RkJpbXpPUW1PNWFFUkFp?=
 =?utf-8?B?VEJmNE5Ec3hZYnRIbXJtWnpOQlM4ZEcvV1A2SmlIdk5seGNxN3U2TzVjTDdO?=
 =?utf-8?B?OEljMFRWcVRyc1Q1UEtLN2pUcDNmNjd6OGdYWXUzMzAvaU5KV05WNHcxSlhI?=
 =?utf-8?B?OStOZEJoZlZ4NDhYUSs3eDFRajZWWGF5RlA1VW93cGV2S3hnc3poZm5HQjJ3?=
 =?utf-8?B?ZXRkNU00OEJNcWJTWmw0UEh0SHBHN0YveDNOZmNTVkg2RG91cGtWVW1DVXA3?=
 =?utf-8?B?MEE0aGNXeXg4eTRrOXM0ek9NNi9tRmZ5VkJPOFNJbS9oUlBwTTdhQ3hUNnNU?=
 =?utf-8?B?UnNBUW8xNTNKUmdlaElBMGlVVFJUbmxHVm5CTzN0NWt0V1dZOXh0VXpuWEd2?=
 =?utf-8?B?Y1pvRnZwblgyMVh2K29IdFF2bENBQkFJMHc3RnV2ZUdYYmZITnBxYXl0TFZ2?=
 =?utf-8?B?ajYrdUpBR0E3anpkYTFQSitNTkNTUERRNDRRQ1J0bXhCOEpHRDh3MDhLRm96?=
 =?utf-8?B?MHhaNHdSSGFHaWFSOVNwUHpiRTgraTFXcFB2WkdlY3dpTXNjYjk4aFI3N3Bj?=
 =?utf-8?B?dlRkeHkrT09ueXh5ZlpYMjR6eTZrbEdQb3RXYnZyYnFCZ1M5QXRRaVE2NXpB?=
 =?utf-8?B?bm9Ka05tZUFtR2VGcXN4ckVvNTR6Y0ZhbllJTWF2MGVzai9uSUZ6V3RXYSto?=
 =?utf-8?Q?zhfQ54v3Bzp5AMeSDYrd0HD2M?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63cb1912-e644-4bab-ba59-08db2ed94890
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 15:38:16.4904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x4uWcQhOxL4z1bx48z/ccz5F5w4DvtugLEII70nOx+nCwX5DQP/69TT811K+A2J7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7005
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

Pushed through drm-misc-next.

Regards,
Luben

On 2023-03-27 11:02, Luben Tuikov wrote:
> Thanks for the fix. I'll push this via amd-staging-drm-next.
> 
> Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
> 
> Regards,
> Luben
> 
> On 2023-03-25 09:15, Caio Novais wrote:
>> Compiling AMD GPU drivers displays two warnings:
>>
>> drivers/gpu/drm/scheduler/sched_main.c:738: warning: Function parameter or member 'file' not described in 'drm_sched_job_add_syncobj_dependency'
>> drivers/gpu/drm/scheduler/sched_main.c:738: warning: Excess function
>> parameter 'file_private' description in
>> 'drm_sched_job_add_syncobj_dependency'
>>
>> Get rid of them by renaming the variable name on the function description
>>
>> Signed-off-by: Caio Novais <caionovais@usp.br>
>> ---
>>  drivers/gpu/drm/scheduler/sched_main.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>> index 214364fccb71..7db586e6fce6 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -722,7 +722,7 @@ EXPORT_SYMBOL(drm_sched_job_add_dependency);
>>  /**
>>   * drm_sched_job_add_syncobj_dependency - adds a syncobj's fence as a job dependency
>>   * @job: scheduler job to add the dependencies to
>> - * @file_private: drm file private pointer
>> + * @file: drm file private pointer
>>   * @handle: syncobj handle to lookup
>>   * @point: timeline point
>>   *
> 

