Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AC061EB28
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 07:41:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F70D10E1EC;
	Mon,  7 Nov 2022 06:41:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60A6E10E030;
 Mon,  7 Nov 2022 06:41:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hcd8ZP3ZjS4COsjJocf0kK789tnVhxFD3ROorrh1HvH185oW8FNJdE9Vd9QbWDxMHU6KQC8vDo1RitAK+4bfDIrMVKlFjBKU0cm1/oQ5BHYDhcE9PMetd10a82lvsvFztlbpnKSNg+0N30QnP/F8X8+nONa8wdUZQOLsCCsfNf1r+tjc69OXSVWt7oaEZxOn8cHbrVowc2zbf03g1h+bMx559rgqSCH/nnYSWQAr3yTIl/bu6BagDT1Nzn+BLuKxcBhKkpO4+OeAadd7p3gqYZL6ef2B+RSxhAqU66dO2EiIDgSYTLyaf93diaZFjVjhxybOq5iGG6DQZK6iMQ2RyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wXhZGnXlu7Lx+6S8ZI+KG+DKGc1mmAxUFtSW6bcvN88=;
 b=N5xYvSzd0geAQNYZPbryurH07V+lMZclRn/z3Fo1VWHeWGn1CEJaE1BWSdbfpEZb/z7aSG3Pbm8Q9QJMdL2IKftAK/9dJJ4QLhSuo0YTgOFFxE/5AqVyuWdLxWL3gC3hK7Pm6eXjfsuoPSXn8RXocQ+9uz5Wl6dKPxo8hEKCWIiBOPP2XumP35jMgQYIQfPxVJRPYV4vJE3sLesYsElaXGqir9bDfeoJH3KXeSGojAGQmlCarQuG0laY5RnHAlsxUO4IUF/VEPPo+Oq7CznmwJuM56bk4KpbEDFjIUL/hh9+ZLII1HRjBSaUGn7Kc/LDl/MMyz/dgM4qB8a9zRw0vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wXhZGnXlu7Lx+6S8ZI+KG+DKGc1mmAxUFtSW6bcvN88=;
 b=ezBIJnFToc/+sMlnGd0Ql4QbJYOvH5IRnD27xFcnhwRlNYZuWfcHHqF5FHglUQ8CogaP01PzDKZmSnwUDOHAh6Md6eimTWU+9+nHDIMATzZDjMpbP21LVbikfJ/YexIPBQO8GIdKRykV3U+MdAmg8UYqMk3lIPBPfrAY370yMn0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6351.namprd12.prod.outlook.com (2603:10b6:8:a2::6) by
 SA1PR12MB7442.namprd12.prod.outlook.com (2603:10b6:806:2b5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.25; Mon, 7 Nov
 2022 06:41:33 +0000
Received: from DM4PR12MB6351.namprd12.prod.outlook.com
 ([fe80::dda9:dc0a:4491:ac2]) by DM4PR12MB6351.namprd12.prod.outlook.com
 ([fe80::dda9:dc0a:4491:ac2%6]) with mapi id 15.20.5791.025; Mon, 7 Nov 2022
 06:41:33 +0000
Message-ID: <73594386-5c09-f2f3-dabc-6c2611849ba2@amd.com>
Date: Mon, 7 Nov 2022 14:41:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Coverity: kfd_parse_subtype_cache(): Memory - corruptions
Content-Language: en-US
To: Felix Kuehling <felix.kuehling@amd.com>,
 coverity-bot <keescook@chromium.org>,
 Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>,
 "Ma, Jun" <Jun.Ma2@amd.com>
References: <202211041239.2B98F280@keescook>
 <8bca88b8-e7cb-8458-01e9-544de44302b8@amd.com>
From: "Ma, Jun" <majun@amd.com>
In-Reply-To: <8bca88b8-e7cb-8458-01e9-544de44302b8@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0017.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::10) To DM4PR12MB6351.namprd12.prod.outlook.com
 (2603:10b6:8:a2::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6351:EE_|SA1PR12MB7442:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a3eadd9-aa90-4b98-7bd2-08dac08b1c21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XDTQBMCticy2/F1NzjS3y5Axt4uQLybixqwDF30dgRZUj2+G34qyvvL6K2W/KcBxxrTAuyLaefxJTet+nYkI0kEcy/Sw7YU2z1q32aiH33iRkSoE9Ay1YhWP9mKTCK1+HHvYK6KnhkZJYTxc7clQuXx8JC7hR+dP8VOA4E6pFSdS7Od2bz9Pah4rKW3QoqZAIc8FZnstMHbHQH1uRBXC4wNFeXO/Z0VtRrSyQC/F2xyWg7Hwaa2ZLRUfL4/n/4fs/0TKCJ4j4G7cz/wv0HPZ1vBKleGd7YHEu2ldoiqJi3ZGl4l5696R6lvZ8VQF4TYG+SM8nk5YQYLEKf63trQK233Kw1uIdNxvBkpSCnu8bhEn5TYP+gGA99p4/i0ufRf8TwZ3hpoAC8RLWKoC+3EN+mbvFaWgIxP2C68Kux86/lreOhc/7lyt+q+g+q580dn8urpLJNVvdU8IUxM5Yjk5trIsL0CkVnRq1UgbYmlW82Jw9yiRn4a5TV2KCkk6lecAZ3PzjhTr5x1mQBtPZfmQfSWdQlp4oQ20AQ+pprsx221lTaemH1GBWUXZg8hye09T2hHCVIrqOKtrkKHxMJyaGC+LpLBv22ecT4JWgJKaHI/hQEPcpmfYEQW4sLxXgg1rUjXItaR9vJgGWtznlK6jDvzcM1QC9WWp+0TWl2IX8ha3wQT26m6UcVxJuVPALSE3s/o7nFMkdRR2uQJqDYXitQEOeNO74sMkaKtd9TAt4/vnh5zqviXmVj4BPSOOyaKL9enF+1AazzwHN+r0EPrTDWECq4zx8Ynwyz976ikfVbGDAOrLOyTLiVBo7NojM/tV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6351.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(451199015)(36756003)(31686004)(38100700002)(6486002)(966005)(6636002)(54906003)(316002)(31696002)(478600001)(6512007)(6506007)(26005)(53546011)(6666004)(66556008)(8676002)(66946007)(4326008)(66476007)(5660300002)(8936002)(7416002)(83380400001)(186003)(2616005)(41300700001)(2906002)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUp4REJRQTRkaVBHRnJEbkRtSHdSWnBQMThKNVhMU1BtVFljSHFVREs4MENC?=
 =?utf-8?B?WUVLSG0yT1ppQW5sMFlEY3BCZ1g4UGpPYmJnYnpxVVI5eHpIdTI5SE1pQzdC?=
 =?utf-8?B?Nk94Yy9DZE1uUXpWeWhNUlFrclNZdWNscEwyUW0xL2l3UU5PUjh5RHZFaWVB?=
 =?utf-8?B?a0hFYjdJNmoyM2RuRTVkeVB0MUtBWGp1R2gweHpVaFpVbnNmSTBQYXY2bHNO?=
 =?utf-8?B?TngzelFiVWh6TVcwL2E5TllHVTFnbUlYS2NSVk9JdWpoNnY4bkRocVJTMjJa?=
 =?utf-8?B?Nk96SXdnMzNIaW5DRkFQUW0wWUtkWlV5dmMzQ2hOMjN4bkFnZk1XSElkdHdI?=
 =?utf-8?B?NTN5QjQ0RWhqUG1PY1JsemZPUlRRdU9LVkI5Tk54V1NQYU5XbjZWMlVjUWtM?=
 =?utf-8?B?cVROSGZzNmVBTXF0eG9WTTJRT3lBL2wzUlN5Wi8rTi9sZFF0cnJrQjMwUGNJ?=
 =?utf-8?B?NitUcE40Y3Q3c2VCZmNBZHdIYTU2MzZFZldXcCtOeTdvc2J0WkVPbHR2TXow?=
 =?utf-8?B?RzB2My9tcE5IdXp0WWVIRSs1alhyWjVhU1EzU3pabWFwYlVpNEJqMCtxclo5?=
 =?utf-8?B?OVVDT0ZrbWpBaDNaMllJYURRRWxDMTVpdit4UU4wSnMrL2JzMVNpSnBoQm8x?=
 =?utf-8?B?b1djQ0ppMGM4RkZNaitrcGVKc1IzaUMzcE1Xdy9vVm43WDVwVmgxejJIS1NW?=
 =?utf-8?B?Vlcza09FblZ0NXJleEJkOGcrUEJlSFh3YjYzOXhnekljcDdObDJlNFQzdU01?=
 =?utf-8?B?TkJxS3l4TnZIVnRvUnd4bGNBVEk2R0xvOE53MysxM0lLczlnMnZJZDA0ZEU1?=
 =?utf-8?B?aXVaWTM0amI2Y3NSTVk4a2NYRE5qbVdFR0xTMHduelJZZHBTcGxsbDZZY1pt?=
 =?utf-8?B?ZXpSeWFXNkoxS2ZWUFRaYTBwdSt3NmIxTWpPUHUrUUphTkN6NnlNdFo0d3Qy?=
 =?utf-8?B?aTZkZEJCR0FXc1VLaFRmZ3NCNUpkanBpajlwN0FQcy8yUTFBaVo2ekk1NGho?=
 =?utf-8?B?QndwbjViSjhyaXpqQXBNdC93RWljMlpSYnEzOHk0L0VGZTNiaXpUbEpmWExl?=
 =?utf-8?B?RXM4Zmk1cXVHbzVKdmtiTUZWNWpsU25adERQdXdkVStUS1VxZVV2eWlNYkJy?=
 =?utf-8?B?ZHRxK0gwSWFMRnFpcjJPUHNYS20rSHhJZXNPVlJ5MVVVTWptTWdBRk1kSDNm?=
 =?utf-8?B?WkZnOGRYQmFpVlozdExlV0hMLzhSTUR4ZFp4c00xOUJPTjVJN2l5NnVCZ0Jr?=
 =?utf-8?B?aFBwaGRxSlQ0bTVRbEpUWDd6WGY5bWlqRXdqMHRidW5KQTlpZkE2azhjaW5S?=
 =?utf-8?B?OEIyeE96enB1OG1nenBVbjdaZkFTa3NLL1BOZldNanFCQ2RudDdOV2xmclJs?=
 =?utf-8?B?SEV2M0NnY3N4ZzZrckpGUWtEYnRxaWhLS3V3Tjdwdnh1cVRmdkVaNW52d2sy?=
 =?utf-8?B?ZXo2a0h2cDZRKytOd05WSjRLZm5zZUR1RXRUeXhsZEF0NFdkTS9FK3RqSnVY?=
 =?utf-8?B?OVlIbjFoS25sU09FeHZpUjYyOWF6ZGN6V1NVb0hQeVJPS3lDZStNMllkeGxK?=
 =?utf-8?B?VWovdWJjVWFMN2VwcWRnOG9IOUxyMzZ1dHord1R4bkVJMlR5TWNEQ0tJNzh6?=
 =?utf-8?B?OUlNY0x0dTJkbmJBaW5uaUg2QlNFNk5IZTBQdmFRMEdRc0lqS2xpTE1Bb09V?=
 =?utf-8?B?dC9WeVlvdDZIdlhJb0dpcVJISXZZMXRYc1RwV0ZEWjJseStla2V4SjE5NWFD?=
 =?utf-8?B?dW5BNG5TZUttMENGSW4yblZ1Snc3RkcxSmk4UDhIY3FNYm9KV0dRamJCSnp1?=
 =?utf-8?B?N1Jtc2lzUFBDWCt2dUxGMjZZVHJKaHRIVEh2MitFRHJUZlN3eE9KT2RPdDkr?=
 =?utf-8?B?c0p3U2Eva2J1SnY2R2RjY0ZUNVVvZzBjeEV2K0VRdHBQSXMrYXVuQWdmNU5u?=
 =?utf-8?B?cFU0VmlMc095R0Y5WXhaemJDaU9kcXB6TG9DazJIQlJVTk5YVnkwL3l6eml6?=
 =?utf-8?B?VVNlWHMyRkR3SVlnWFZYN2JNNWtDcmJzaEkzUURPQXE3NHdjUWpMV2E0dHpB?=
 =?utf-8?B?akltMlVURDk2ZEc5NENtZERBK3hNRUdIY0JRSC8vTTdWYlorYVRzRUc3TXYr?=
 =?utf-8?Q?J3QdS72m4lBOr7DfB+6xPrSB7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a3eadd9-aa90-4b98-7bd2-08dac08b1c21
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6351.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 06:41:33.4571 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7aZ6WGvAkjTtcdOYMNJNelBDiy1rnZAAIAU08zaE36zRxaOyd8ZD4lVzY41AQLUz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7442
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
Cc: Jay Cornwall <Jay.Cornwall@amd.com>, majun@amd.com,
 Amber Lin <Amber.Lin@amd.com>, Ben Goz <ben.goz@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-next@vger.kernel.org, linux-hardening@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Kent Russell <kent.russell@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks, I will send the fix patch.

Regards,
Ma Jun

On 11/5/2022 4:40 AM, Felix Kuehling wrote:
> On 2022-11-04 15:41, coverity-bot wrote:
>> Hello!
>>
>> This is an experimental semi-automated report about issues detected by
>> Coverity from a scan of next-20221104 as part of the linux-next scan project:
>> https://scan.coverity.com/projects/linux-next-weekly-scan
>>
>> You're getting this email because you were associated with the identified
>> lines of code (noted below) that were touched by commits:
>>
>>    Fri Dec 8 23:08:59 2017 -0500
>>      3a87177eb141 ("drm/amdkfd: Add topology support for dGPUs")
>>
>> Coverity reported the following:
>>
>> *** CID 1527133:  Memory - corruptions  (OVERRUN)
>> drivers/gpu/drm/amd/amdkfd/kfd_crat.c:1113 in kfd_parse_subtype_cache()
>> 1107     			props->cache_size = cache->cache_size;
>> 1108     			props->cacheline_size = cache->cache_line_size;
>> 1109     			props->cachelines_per_tag = cache->lines_per_tag;
>> 1110     			props->cache_assoc = cache->associativity;
>> 1111     			props->cache_latency = cache->cache_latency;
>> 1112
>> vvv     CID 1527133:  Memory - corruptions  (OVERRUN)
>> vvv     Overrunning array "cache->sibling_map" of 32 bytes by passing it to a function which accesses it at byte offset 63 using argument "64UL". [Note: The source code implementation of the function has been overridden by a builtin model.]
>> 1113     			memcpy(props->sibling_map, cache->sibling_map,
>> 1114     					sizeof(props->sibling_map));
>> 1115
>> 1116     			/* set the sibling_map_size as 32 for CRAT from ACPI */
>> 1117     			props->sibling_map_size = CRAT_SIBLINGMAP_SIZE;
>> 1118
>>
>> If this is a false positive, please let us know so we can mark it as
>> such, or teach the Coverity rules to be smarter. If not, please make
>> sure fixes get into linux-next. :) For patches fixing this, please
>> include these lines (but double-check the "Fixes" first):
>>
>> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
>> Addresses-Coverity-ID: 1527133 ("Memory - corruptions")
>> Fixes: 3a87177eb141 ("drm/amdkfd: Add topology support for dGPUs")
>>
>> I'm not sure why this suddenly appeared after 5 years, but the read
>> over-run looks legit:
> 
> 
> I think this was introduced by a more recent patch that was in fact 
> meant to fix an array overrun on HW that is outgrowing the CRAT sibling 
> map size:
>
>> commit 0938fbeb6f53fc44bc9b19784dee28496e68ba0c
>> Author: Ma Jun <Jun.Ma2@amd.com>
>> Date:   Wed Nov 2 15:53:26 2022 +0800
>>
>>     drm/amdkfd: Fix the warning of array-index-out-of-bounds
>>
>>     For some GPUs with more CUs, the original sibling_map[32]
>>     in struct crat_subtype_cache is not enough
>>     to save the cache information when create the VCRAT table,
>>     so skip filling the struct crat_subtype_cache info instead
>>     fill struct kfd_cache_properties directly to fix this problem.
>>
>>     Signed-off-by: Ma Jun <Jun.Ma2@amd.com>
>>     Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
>>     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> I added Ma Jun to the email.
> 
> Regards,
>    Felix
> 
> 
>>
>> struct crat_subtype_cache {
>>          ...
>>          uint8_t         sibling_map[CRAT_SIBLINGMAP_SIZE];
>>
>> #define CRAT_SIBLINGMAP_SIZE    32
>>
>>
>> struct kfd_cache_properties {
>>          ...
>>          uint8_t                 sibling_map[CACHE_SIBLINGMAP_SIZE];
>>
>> #define CACHE_SIBLINGMAP_SIZE 64
>>
>> Thanks for your attention!
>>
