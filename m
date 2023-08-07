Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 731227724A8
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 14:47:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C187210E289;
	Mon,  7 Aug 2023 12:47:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2082.outbound.protection.outlook.com [40.107.94.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB0410E0A6;
 Mon,  7 Aug 2023 12:47:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DMqYDfipqu1DbaQ9qkrQ+St452NtpXQdH2pXENvMX6DrEIHt535fq89F6W1D5dRjHoggAitsMA/uduW9TicibaqjNtTLU9CXFOpN5EtUDFaGafDy+KvoUY2aqkoqdukrd3PcE+IBKwOE4IDYN6sLr4uPvJb0RO5azsG97Rg7fdQE8kfl366bxACDRacZTqhb9KX+imREcOdLHvAJhjwlVDsMItq4sVSrQanIdJDtvQm+ME60MEzS3lkIvOmYT1ItyjtfnSreweerhxfwaZg8xEzKE4G662nYQLH0idfq5k2iouP44UW0EWULkhWo01GGVBko0yTJHmtpMA+yg0GpJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RqVTcE4mtbkZ37/QRDSf+IgwTpCdZIWqCbfMHAyu7Mc=;
 b=GKPocJq0Rjo8ySndd2dbDKpcbwAFz1whA6UjTSD2Wb9+DkhsUIFkldAmpa+4px7Mwpki77xjEnt6qZ0Y5VWNPntulMAlNTxlQCdjS3XasQOtysZkd371v6Bje2YmJN9IVL4HJvWc26UL5S32KXJz8Fony0XNiQGk49Xo8m1GUcHpIlKSLG6futuc0Ff7LPEYe3zxIfSchvLHNA7efPrWrDP0ETzUpD5wOKofgs4nBUvGibAXQhU+7LwE8k71fgVGIJXaazAinL6EzW1+QUraAtSloMvelI9nmsAGrTUpXFcjDV0PveDAEBtDNX+lrOAEpjOYWNbunosaqIYhtovKbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RqVTcE4mtbkZ37/QRDSf+IgwTpCdZIWqCbfMHAyu7Mc=;
 b=fA0jl0wg251FbXSYVHcu42zMdXaMET0GLFAkqPJpL68nHx3mVBjvx0oOyjYSlDgtQj8h2XuzbWG8QuEryNjjAVoD1Sov/ChjIx1XfdQp5IQB5ga3ujFlyZojz+o97HCpkXOMwAJhCAO+6aa4+/ZKTU6c2Hf6bvMi9ZvW6uDB3j4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by MW4PR12MB7015.namprd12.prod.outlook.com (2603:10b6:303:218::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 12:46:59 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6787:e196:b8dc:93a1]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6787:e196:b8dc:93a1%7]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 12:46:59 +0000
Content-Type: multipart/alternative;
 boundary="------------bNijIllXmJXNrSeHMz1bt7Lk"
Message-ID: <7da03cc3-eb0d-4f97-1f3f-e38f1f862039@amd.com>
Date: Mon, 7 Aug 2023 18:16:51 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/buddy: Fix drm buddy info output format
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Ma Jun <Jun.Ma2@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230804065647.4096957-1-Jun.Ma2@amd.com>
 <ed0b3a5c-9e81-6fee-aba1-5d1c9ca89130@amd.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <ed0b3a5c-9e81-6fee-aba1-5d1c9ca89130@amd.com>
X-ClientProxiedBy: PN3PR01CA0082.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::17) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|MW4PR12MB7015:EE_
X-MS-Office365-Filtering-Correlation-Id: fed4bbb4-fa5d-45cc-7604-08db974463d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zrv0eeU9w+wHikexQPF0OAzvdtvXLl5PKnlUot943688YyJpvIJt+5w4sti+zvAoHV0peQ+kYqGmNxq8iaPsqUiaJ+ofh/pCijhK17v/iPTiE/iZ5vMUC88gtlJpn+vAnFB00S3+b38aA/PqjbpD6F4qsVvuaiCCSJ4jqlPGKGFY7JG6xwCVrARd2GP97emZzeC11ObpCjV1Tsau0LRSUOhMGJUIvGS0pEtlK61RmpBwgJ/+HUx6JeOr3qNWjzjwZiar0S4u0hHdmX2M8WFLkQHr82WyD2W2Erp2N3l5xeDTWoey17Qbvcbn+uhdNV/nlTjtDMGRO/rNAb0iI12SkMzVVltt9nyalTbdDGIKWBEpyInj7avOC+r9jgj5R07Bse/imK6+mUwOW595Gg3+Lt2ncLA4Uu6AOmE+nFZwsFnXwIALgwuvLXDSsPTbTn/d5K2+txulvspLavNqjSMjgns5I+Kxk9pf/swLOnGZkRoY2yS9MMnWpuK7ay/p2oWyTdvPIASCZTsGWcgKSYBtdV1Sqw9Zo3muPzw/Q0mtNzxhNv2y/MovBHy8+jE6F44dyHCtRwtStAVQASsQ7w+xqhdSu/+yNWbQ7Q5ZlfcI2Cfhz5F3FwPc8WfqUdBvQPFT1Zoi3xPfEEH7wKkHBDQN4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(451199021)(186006)(1800799003)(86362001)(31696002)(41300700001)(478600001)(53546011)(6506007)(8676002)(8936002)(26005)(38100700002)(33964004)(6486002)(6666004)(450100002)(66574015)(2616005)(5660300002)(83380400001)(2906002)(36756003)(110136005)(31686004)(316002)(66556008)(66476007)(66946007)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUVyaHBiY0hSUU5UUTM0cWF0UnJXQTdwbGJ4d0tQenBtYWYrdW5peWRuMHk5?=
 =?utf-8?B?R3A3NnAvS2VoUkgranl2QkZyOHZ2dDFrL20zQmwrMk13M2MzTUdsQnhUaXZW?=
 =?utf-8?B?ZVVmblpQS2x6RGZ0R0ZRdmF3NkI3OVZhNkYxNHB2Umw3NzRhQ3RvdllBcDZD?=
 =?utf-8?B?MTRGQUlIaHNUaHVGSnBPUTFBcUJxcUJWMnB0Z2dlQ2tJYXEyZEtTaXEzbDBO?=
 =?utf-8?B?VGNsaFo2QVNzV1dxRmloOVc2bDczL2xVNTBiaTVncDVEOTR0dUgyWHpkeTdQ?=
 =?utf-8?B?Z2xNeDBJc1AxMmhRUXpyYU5YYTRnRnJtd2N0V3ZvbGd5T2hmV24vYzVGTHpl?=
 =?utf-8?B?bFlRcVNJWmJja1VWZy8xZnFXc2tyNkFJNU55Zyt5ZHY0TVh3emNuUG9INS9r?=
 =?utf-8?B?cEZLOHhBY3hDU2p1MC8rU2xzNG1uTXYrVGhIZEZleFU0Zkk2Q3dOaDVzT0Vj?=
 =?utf-8?B?Um91S0pyd09INjdkejdybWxJSXprVFc5Mks1UGhUZDE5Q0prVzA5alZ6bnFI?=
 =?utf-8?B?RjJDSU4wQXRHRk5TQm9rN3dPazZBa1F1djRnSE5wMlBMYklyZ084cEsrKzI0?=
 =?utf-8?B?Y3VyTHZORXlqbHhFdjBYSTgrb1FScjg2T0lRcWtWdk1jMFNHRzJJT1k0dGlI?=
 =?utf-8?B?clRUYjY3NVNxYm1jc0o1aXJnNkJTVjIxcWZWK2ZFL2dVc0I2bWlKMmxCRVFk?=
 =?utf-8?B?eXIwU2FKU0kyc3BTNEw4QWxuVzV2aWEzdG83Zkt3SHNjQXRzZFZXakM4UzNO?=
 =?utf-8?B?Y0JNa2cybG5kYWROL1lqbWFCaHVxczJMVnBLQ0RscUhWWUVmTkVWcWl1VG9l?=
 =?utf-8?B?WFNIWk1RY3Jiem5pVzJpMW1XdkpUYWxrejNTYzFEQWJOMnJlU21KNEVlY0Vw?=
 =?utf-8?B?UW52bHM5SFkweWtxZmloNjZBU3JaM1lMQ2xWZnBEK1dDY09lMDhOWFlHUTFr?=
 =?utf-8?B?OG1tMFZiRUxRRjJRZlA0QnduOGdYaEJmZmNiNjB6aEl4T2VQY1prOXdpUm1G?=
 =?utf-8?B?MUtSZitiYktaNmx4aE9Ya3lmUTRpS2M1YzE1aE81Wlk0UExKdHM4WDBsaGNQ?=
 =?utf-8?B?KzAwajd5ZVc3K0kyUnE1R080ZlZDUlFoUFFPNFhXSzI0RDIrdGhUeHUzaGRD?=
 =?utf-8?B?a3lzMjAzckRUYktFVXJwNWIvT1lIdTB0V0xMcU1HKzRxaFZwaDNMRzhvTHdH?=
 =?utf-8?B?VXllTEhyRURDUnYvL1Z4bER0cnJFUEgweXJybjN5Sm1yTC9PZmFEampEVnd6?=
 =?utf-8?B?SUNtQnBzVVJHN1BMRnJ5M21OQnhlcGY0YnZUaGNhbFFoM2grOThsREV0V2tk?=
 =?utf-8?B?Q0NPMk1KSnpXcDk5ZUw5c0xTOGNUS2cxblorcGJNcGduY3kxb1ZML002RUMz?=
 =?utf-8?B?b01iUi9kOGlmQzh3WmMvVFlsMVYxU0JEYmhZUVVZRGVaeUcveUg5TG1MSzZT?=
 =?utf-8?B?L2NZUUluT3FDK3NqM3ErV3pncW1iN2gvcEVwQVI0RncyakhMK3pVUkkybS9l?=
 =?utf-8?B?cnE0MTM5dDJ4Ylc2RjlOaEp2cWZXYjNsV2wzSTJLa09GVy9nOTJOaHh2T1Vn?=
 =?utf-8?B?dGJUdmt1Mk9oc2pMZFJyOE1iNUdvK0F5V0h0dTdqcUF0MDlGZ05MNmRFUWtF?=
 =?utf-8?B?MVhQY1FkUVk1cTZ4TDErMjM2Qys5d255UXZ6UFoyMmVZcHBkTTU4TjJvbkpx?=
 =?utf-8?B?bHNJUERZWERDelpFSlQ0WEY3Ykp5SE1QcnNybjNBLzlaQTFMVnorcjV1TVRs?=
 =?utf-8?B?Mk1rSjk4M085TGRQV2JTaUdFU2Y3eStpOHdwVSsxY0VTaEVteUZGVVlBS0oy?=
 =?utf-8?B?NWprOGF1WW1VSHYzeExxMkFxS2s3UVpTSUxjZ1ZnYk0zV0UyMHQzYTBJN1E1?=
 =?utf-8?B?YzE3QlR4SHBTb2lRZmtIOWFwd3UwdDRkUmV4T0FvMU5wYkhjaEMzRXVEQ3gw?=
 =?utf-8?B?by8yUkh0V0c1MnB5MWZHOHUzMGJ5cDBzR2NhR3ZuUDBQNHdBRFVLVWdQcm1B?=
 =?utf-8?B?a25naUlTSHYvWllIS2lRcmlnQ0VjMWczenN1VFExNXZ3QVBCSnNRbkVIdzMv?=
 =?utf-8?B?NDh2dVhuQXRQL08rbThzSTlWS1VxL0UwSE1IN2JlTnFNby9VTzVPT2Q2UUdx?=
 =?utf-8?Q?ZV528IOIR2B5cO7+pC/hc6TS/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fed4bbb4-fa5d-45cc-7604-08db974463d7
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 12:46:59.7100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cnj51GKjjmJT0gVZy5tHwzg7DFVmwWOFoZw3b6iPdCg958qcRHI0T0biJsfQyYX64LbOpx1qLcGUdfA1NQPTcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7015
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

--------------bNijIllXmJXNrSeHMz1bt7Lk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

looks good to me as well.

Reviewed-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>

On 8/7/2023 12:17 PM, Christian König wrote:
> Am 04.08.23 um 08:56 schrieb Ma Jun:
>> [1] Change pages to blocks to avoid confusion.
>> [2] Fix output format to align the output info.
>>
>> Signed-off-by: Ma Jun <Jun.Ma2@amd.com>
>
> Of hand looks good to me, but Arun should probably judge.
>
> Christian.
>
>> ---
>>   drivers/gpu/drm/drm_buddy.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index 3d1f50f481cf..ef3dd15c334a 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -781,15 +781,15 @@ void drm_buddy_print(struct drm_buddy *mm, 
>> struct drm_printer *p)
>>               count++;
>>           }
>>   -        drm_printf(p, "order-%d ", order);
>> +        drm_printf(p, "order-%2d ", order);
>>             free = count * (mm->chunk_size << order);
>>           if (free < SZ_1M)
>> -            drm_printf(p, "free: %lluKiB", free >> 10);
>> +            drm_printf(p, "free: %8llu KiB", free >> 10);
>>           else
>> -            drm_printf(p, "free: %lluMiB", free >> 20);
>> +            drm_printf(p, "free: %8llu MiB", free >> 20);
>>   -        drm_printf(p, ", pages: %llu\n", count);
>> +        drm_printf(p, ", blocks: %llu\n", count);
>>       }
>>   }
>>   EXPORT_SYMBOL(drm_buddy_print);
>

--------------bNijIllXmJXNrSeHMz1bt7Lk
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    looks good to me as well.<br>
    <br>
    Reviewed-by:
    Arunpravin Paneer Selvam &lt;<a href="mailto:Arunpravin.PaneerSelvam@amd.com" class="moz-txt-link-freetext">Arunpravin.PaneerSelvam@amd.com</a>&gt;<br>
    <br>
    <div class="moz-cite-prefix">On 8/7/2023 12:17 PM, Christian König
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:ed0b3a5c-9e81-6fee-aba1-5d1c9ca89130@amd.com">Am
      04.08.23 um 08:56 schrieb Ma Jun:
      <br>
      <blockquote type="cite">[1] Change pages to blocks to avoid
        confusion.
        <br>
        [2] Fix output format to align the output info.
        <br>
        <br>
        Signed-off-by: Ma Jun <a class="moz-txt-link-rfc2396E" href="mailto:Jun.Ma2@amd.com">&lt;Jun.Ma2@amd.com&gt;</a>
        <br>
      </blockquote>
      <br>
      Of hand looks good to me, but Arun should probably judge.
      <br>
      <br>
      Christian.
      <br>
      <br>
      <blockquote type="cite">---
        <br>
        &nbsp; drivers/gpu/drm/drm_buddy.c | 8 ++++----
        <br>
        &nbsp; 1 file changed, 4 insertions(+), 4 deletions(-)
        <br>
        <br>
        diff --git a/drivers/gpu/drm/drm_buddy.c
        b/drivers/gpu/drm/drm_buddy.c
        <br>
        index 3d1f50f481cf..ef3dd15c334a 100644
        <br>
        --- a/drivers/gpu/drm/drm_buddy.c
        <br>
        +++ b/drivers/gpu/drm/drm_buddy.c
        <br>
        @@ -781,15 +781,15 @@ void drm_buddy_print(struct drm_buddy *mm,
        struct drm_printer *p)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; count++;
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        &nbsp; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;order-%d &quot;, order);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;order-%2d &quot;, order);
        <br>
        &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free = count * (mm-&gt;chunk_size &lt;&lt; order);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (free &lt; SZ_1M)
        <br>
        -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;free: %lluKiB&quot;, free &gt;&gt; 10);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;free: %8llu KiB&quot;, free &gt;&gt; 10);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else
        <br>
        -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;free: %lluMiB&quot;, free &gt;&gt; 20);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;free: %8llu MiB&quot;, free &gt;&gt; 20);
        <br>
        &nbsp; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;, pages: %llu\n&quot;, count);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;, blocks: %llu\n&quot;, count);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        &nbsp; }
        <br>
        &nbsp; EXPORT_SYMBOL(drm_buddy_print);
        <br>
      </blockquote>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------bNijIllXmJXNrSeHMz1bt7Lk--
