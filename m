Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AD5545DD4
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 09:52:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D1610EFBD;
	Fri, 10 Jun 2022 07:52:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2125.outbound.protection.outlook.com [40.107.215.125])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C72C10EFBD
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 07:52:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N5h4D6opVLtSGne5yC0db7N8DZNU7yju62VIC5EHM9XXJloZ5K37t/CLYtnBUSNNkyjL8oc1Duuu73fRTu3Pwvo2ZDvOYoOzXSC8zzG5WAaw0dY5qENROEBSgeZp0yMPiTV+HT250w1V/jkkB5is5aAUTr6C3H1GGHrezvCX1lmErs+vGiwN5Nio8EpowFAda2P2IiSbDK8NUTw2+x8K+kE4tkiVyyWTSFaLMOYZ9VtjUahc6ltYOquT8gOQ4iQg/XWDVJ5O1P4q1r5/lGndRLd4OPQYLuk6hgsFUkZyBTc92K0pM6tAnubgyzTAslyQbWd91jZ96pjRZbGtIATgzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EKZoOldyoVb419C3vi8I1N+6etu14Vr1vxkkcwjqACg=;
 b=DWof5XhU8QZ6kzsI/Kl0s0sKkzKVgYxuzVXZ9Pgxe/NnycvEqbXF4XhCim3Xhp2hS5hrr+MREBIRBy4QP4hc4zvrjyAivS1nlId5SSNOuKZ6SZ9F1ZRQMwCvWFwpDKUDCs8HrrShFFhWmWqP4BSTp4m/I82GvwfRZsRPPnbeCZV75IWjLY5YIhY80q+/SSMf0/XXJZw3z+WY4Tj3Lnfax/76VCGWlRS7sV1wWJBol1sSYpaKojKcgkHJgwSHwSlO4q13eVL0ZxWOu9YawrPNIbhB18KPdjJvAjbk5GOrPNx7KZNlatVoCK2j+rOrpAgqOb/BaOyPzFvcVly3ESlGeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EKZoOldyoVb419C3vi8I1N+6etu14Vr1vxkkcwjqACg=;
 b=V0BXpiB+uyql0gyQtvog99p/0nm2wz8DMrDCQSR2AjBv4IkU9FnQeXa6eO6RMFVcZrXVfw7my1xc1my82d/90Thjuxm5jS1SrkS/X+5mgHVU0JKDhxoRawlQOOhssfJWcip657Meu1SKeb3SHkOeKto3hi+knpJLHgAfF7xlrqM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com (2603:1096:4:78::19) by
 PS1PR0601MB3689.apcprd06.prod.outlook.com (2603:1096:300:78::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.18; Fri, 10 Jun
 2022 07:52:48 +0000
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::ccb7:f612:80b2:64d5]) by SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::ccb7:f612:80b2:64d5%4]) with mapi id 15.20.5314.019; Fri, 10 Jun 2022
 07:52:48 +0000
Message-ID: <7a689b6c-31b7-61d2-7bf4-6fdf49bb4ae4@vivo.com>
Date: Fri, 10 Jun 2022 15:52:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dma-buf: Don't use typeof in va_arg
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
References: <20220610072019.3075023-1-wanjiabing@vivo.com>
 <c079243c-9084-b565-2320-20453815c79a@amd.com>
From: Jiabing Wan <wanjiabing@vivo.com>
Organization: vivo
In-Reply-To: <c079243c-9084-b565-2320-20453815c79a@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ME2PR01CA0062.ausprd01.prod.outlook.com
 (2603:10c6:201:2b::26) To SG2PR06MB3367.apcprd06.prod.outlook.com
 (2603:1096:4:78::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f30d2bf0-464e-4186-6fcf-08da4ab63635
X-MS-TrafficTypeDiagnostic: PS1PR0601MB3689:EE_
X-Microsoft-Antispam-PRVS: <PS1PR0601MB3689C6A6A8B056E862007E0CABA69@PS1PR0601MB3689.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aQxy22c684aAePEda9FhYGeW26AqIMhTTwT6/H5qissipU4/QmU4wat+Sy6ZFYe6MZUWnrYXo6/XqFxl598LZ2ICTOPT/0HhjpvPfp4jpAqLD01Kbg8saDl1hiHWDLGqkICnZ+T8F0KlRZ6FSEo78wu/o+5YRT6hWM+plMmZEuzvPsr3jdfUp4VVFD5Hw8pQnwwhKFznhUEgdPBsxcSTF4ZBXSXzITPROahfQyysfwVzUoCqvni+4vO/at02yif0jAzJekvuqgUyZr10b/P6Afd8h3A1Stgzv16kzJ6/WUbrMXzxfRZK5jk/621BD08vOkV4s859wuq26oFgOta0fOOZixBAUkDY/BMcJZ4uaGndvPXbaIOWWOg8kbmvymbyg/8o1mPFXQk7yphi8jde39M8zsykN73T92aDts8aSi5jISDBf2DXRELo4PBN83VChhdBzYBMVeq3FCg7IiJ5cO7rxwoxhG8N+FGk8RC2qeRMgKXyaGUfXlYK2s3F55bkNd9OMY/mqIa8MZn662CLOpCTGwo6AwosS/miEFA4xvYHWH+SwAOTPyUsiIIVL3V9K8VB8LNKuo46jNPJVDwfOCE6yvxBe4RF11dXLgHf73IysH73LT3ryIF1nYAn0MlQde5Y2Z5m+lTQOZ81/1yAqU8uJnmLTUofT8jbdM+9LaX2ru3BgqmVvMVTKEATOdY4glz269HnLpnye7EDRgdtIg6aH6IVCCG+7CPbUxOj++pIXzIa6k9Ll478MWfZc4EvA5vC2OKZqGTTEmqYaqbLNrdedJgbgmaCkO3GZNTRQyM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR06MB3367.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(66556008)(31686004)(8676002)(31696002)(86362001)(8936002)(5660300002)(316002)(49246003)(66476007)(110136005)(6666004)(2906002)(53546011)(6506007)(508600001)(26005)(6512007)(83380400001)(36756003)(186003)(38100700002)(2616005)(66574015)(38350700002)(6486002)(36916002)(52116002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3JITEFlZGg2bG9VL3l6RXFUVDRKQ2VCTmt0T0VpQy9OS1gzai9QQTBKdEIz?=
 =?utf-8?B?bkl4RnZ2aFpYKzczREtzbStOTnUyWnRWemdoK0xtM0dsUzVvN3ptMFRvYzRh?=
 =?utf-8?B?Y1J3djMwb09lNzlUUXZlNDQ5MlRiTDFTZmRzQy8vRC93Y05uemhvdStMcVlz?=
 =?utf-8?B?VjVJU3NNNWc4MXlFNVBlVE1NK0w2OGg3ZnRiZUhxY3ZJTVdoMjZlTEJ1STgr?=
 =?utf-8?B?a3RxeEJVQ0JtVndkNW5lN20wVUFGRmwwVCtkTHBZSmFTM1ZBMTk5d25sb0Ri?=
 =?utf-8?B?RWZ3ekZMK3U2N1lVbEdHWVR5bHo0SkZnUWltM3Y4ZVJuSEt3bnVNMXlxZ3hC?=
 =?utf-8?B?MXl6VDBkL2NobmVyMVMxZFFvbzFhWkVaL0ZPK0VNNEdDMURDU0podit4eFBr?=
 =?utf-8?B?RWxaQUd4dnRKUnEyV3lHU0orVWEyVmhIOWllMjNnekZ4NFpmWTNPc2JHTkdn?=
 =?utf-8?B?UFRLTkIxT3ZhbVYrQXdmWEJxRzR0K0F2T3MzeXIvWHJUKytsWDZWZm41a0NG?=
 =?utf-8?B?NGptOXplQlJZT1cyMUdzU3FjSDduanNabUZmNVdCNlBiTENyYjhIOXc4S3BJ?=
 =?utf-8?B?TTdvRVRnSERDbkorTVc4ZXM1cjVrMXNqOFp5cW1OMjhweXk3R1N0L1hSWDJr?=
 =?utf-8?B?RDlsV0plSjE1enBIZTFhOThEQS80cVNGOGZGWllXbnhjOXI1TEtVSnFTL0Zz?=
 =?utf-8?B?MXdjUVpFd01zejhxcURsUEI5KzZ3MXJaa2IyS0RORURWOCtBUkFlWWpoM0tt?=
 =?utf-8?B?aW03dDhIbGVMMHo5RE5yS0p1UlIxK0xoSkFYOW5ETnZkdE1wWitkeWJSTXZC?=
 =?utf-8?B?d05qOGpIYXpHU0VNRTRKUWpDS0RNK2NFN3ZnUGVveVRJMjg2Ky9BSWZOUG1I?=
 =?utf-8?B?cW9aQmNTT1JGY0szQUNwdGhOZGM1N3ZPalJsUWhzZGtVOTMrS1B0SElLbGNu?=
 =?utf-8?B?MW1Vakg1dXhNTE93R29FNHlGeHpZMGk1TU1haFVZUXJMSWdzdHpwdU9pa1k1?=
 =?utf-8?B?a1FVTEVNUVIwZThyakJTTjZhVFduRkxsUWdFY3pBRlhWK1B3NVJIeWFSalhz?=
 =?utf-8?B?VW9UTDdnNTJBbGkyUzd1d1hGM25jTzd3M3U5ZGV0ODlJWW8rREZZR1VVZlIz?=
 =?utf-8?B?QjFZRWtnV1JtUFZkTzYwNGRYdGdQcE4xK0pQdmFKek9WSGlzeVZQZ3laS21x?=
 =?utf-8?B?bUZRajVGQ0plTWlDclhNb2pDMExnbi9GOXJwaUNVQndlaTFuZGt1R1FVbzZp?=
 =?utf-8?B?T2R3cmxVL01UL3phRngrUlJxL3JteVZ0Y0swdm1kamVqZmk1U1dDNmJ1S0hD?=
 =?utf-8?B?cGt3b2ovVFZrQTMrK3NNWlFkZTRDWHV1NzJHRWVmakpiT1B2TUpMd1JXS0dN?=
 =?utf-8?B?R29lWG01bEN0b1ZwejBCR09ueUlPNHM0Q3lrRnFPTjhYUXlVVW9vaEVUdjNC?=
 =?utf-8?B?TXJNbUhNZE40ZG1kSnlpZmNWaUp5NFRPaStVM3BrV3UwcjZyY1NEd1ZUM2lG?=
 =?utf-8?B?UzFzcjJrNEtpR1YwRXAzWTdZSjYrYk5vd1FjcHhtZW9ZQkdNK0g3cW9xamRB?=
 =?utf-8?B?eDVqd0hPV2tuT0ptWVpsWmlvNVlZN09GK0FJbFROQjNGY3FGUG5KOFcyMk0w?=
 =?utf-8?B?UW1CMkNXNituVjN2cmFxdndhUzlwOFZpZVB1WDN0R2VIRm1hVjZiSmZkdWp0?=
 =?utf-8?B?TmZtU3pYWGtiazdtV3BSYTBxa2hENWFXV1pBekVNaHVxNXY0VFZSVmlFSU1X?=
 =?utf-8?B?WGtaRXJjaGlhejUzN09uSldXdnZ4SVhkN29FRzRQVTBPZXA1Nkt1T1A4ajlt?=
 =?utf-8?B?Q0NtaHluRTVRRHoxSjQ3ck5hV0R5MWM5cFlTZkxsSDUvK3BMNERuR05KT1dw?=
 =?utf-8?B?cjFjZ0x5ZVoyVHBwWW0xRXpPRy94ekgveVRLWi9MSzRLM1RGeFBTa3hjak5p?=
 =?utf-8?B?cHlleWltZ09sU2huYW1JYkIvcXEvSnFadElJMkp0YVIzMVhnSTdZM3hFVzBv?=
 =?utf-8?B?OHNVcWE0WFZjZGJIMkdJeWFXQXNGUFlrVE1JbTE5OGhUWHZiWDdNOEVWWXE3?=
 =?utf-8?B?TVpGTWJ3MTNpOHdyVGpvNU55d3pUeUdDQnlaZnBrM0lCQjNKNTNVVi82N2VD?=
 =?utf-8?B?M0FvVjVmVlVncmZqTnl0bVhwNitTN2MrVEFnNElEQUlSS2hZSmZZdWg5WlBV?=
 =?utf-8?B?U2JqVU54RmVCV3VNVEx3YThsL3kxZmRGYm4xM1Noa2YxK0ZDV0lxUWJBUWlS?=
 =?utf-8?B?VHRKVXZUL1JRUmpvbWxvdjVSVHY1SXBkdVBvVzY5NXQ4V3g0ZWRQRHF1ejJi?=
 =?utf-8?B?bEw3VUpSeFFFeHpOVFM3Rll1R3ZaVGZ4WGIxS1FoSEY2NG1XWmthUT09?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f30d2bf0-464e-4186-6fcf-08da4ab63635
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3367.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 07:52:48.2665 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uN1Mhff/SJ13m9dHkLnDnoCiuIJv8dCTCycrihbWROPmr1F752SQrILwssUEQ+uRUfv0NYVG1uM8y9ba1Ccy+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PR0601MB3689
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



On 2022/6/10 15:24, Christian König wrote:
> Am 10.06.22 um 09:20 schrieb Wan Jiabing:
>> Fix following coccicheck warning:
>> ./drivers/dma-buf/st-dma-fence-unwrap.c:75:39-45: ERROR: reference 
>> preceded by free on line 70
>>
>> Use 'struct dma_fence *' instead of 'typeof(*fences)' to avoid this
>> warning and also fix other 'typeof(*fences)' to make them consistent.
>
> Well that doesn't looks correct to me.
>
> *fence should be valid at this point, why does coccicheck things it is 
> freed?

*fence is valid. Coccicheck reports this because fence is freed.
But use 'struct dma_fence *' can avoid this wrong report.

I also grep all code and find it's unusual to use 'typeof' in va_arg, 
only two files.

grep -R "va_arg("  . | grep 'typeof'
./drivers/dma-buf/st-dma-fence-unwrap.c:                fences[i] = 
va_arg(valist, typeof(*fences));
./drivers/dma-buf/st-dma-fence-unwrap.c: dma_fence_put(va_arg(valist, 
typeof(*fences)));
./lib/test_scanf.c:             typeof(*expect) got = *va_arg(ap, 
typeof(expect));              \

And other files all use declaration name directly.
So I send this patch makes code clearer and fix the wrong warning by the 
way.

Thanks,
Wan Jiabing

>
> Regards,
> Christian.
>
>>
>> Fixes: 0c5064fa8d5a ("dma-buf: cleanup dma_fence_unwrap selftest v2")
>> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
>> ---
>>   drivers/dma-buf/st-dma-fence-unwrap.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/dma-buf/st-dma-fence-unwrap.c 
>> b/drivers/dma-buf/st-dma-fence-unwrap.c
>> index 4105d5ea8dde..1137a6d90b32 100644
>> --- a/drivers/dma-buf/st-dma-fence-unwrap.c
>> +++ b/drivers/dma-buf/st-dma-fence-unwrap.c
>> @@ -56,7 +56,7 @@ static struct dma_fence *mock_array(unsigned int 
>> num_fences, ...)
>>         va_start(valist, num_fences);
>>       for (i = 0; i < num_fences; ++i)
>> -        fences[i] = va_arg(valist, typeof(*fences));
>> +        fences[i] = va_arg(valist, struct dma_fence *);
>>       va_end(valist);
>>         array = dma_fence_array_create(num_fences, fences,
>> @@ -72,7 +72,7 @@ static struct dma_fence *mock_array(unsigned int 
>> num_fences, ...)
>>   error_put:
>>       va_start(valist, num_fences);
>>       for (i = 0; i < num_fences; ++i)
>> -        dma_fence_put(va_arg(valist, typeof(*fences)));
>> +        dma_fence_put(va_arg(valist, struct dma_fence *));
>>       va_end(valist);
>>       return NULL;
>>   }
>

