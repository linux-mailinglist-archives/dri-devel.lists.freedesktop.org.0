Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E88C146EE94
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:57:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2516410E8BB;
	Thu,  9 Dec 2021 16:53:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2076.outbound.protection.outlook.com [40.107.93.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8945C89259;
 Thu,  9 Dec 2021 10:25:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nTH7ZZKM/ETo10+mGkPc14uEaXJOFsmr/tlDe/YFLN/8/JstW2EQZq1P+IbNjwEaijaTcH/LDODcwleT4AWSEO0gSsB/B01MRJnjas4Sz4wRwjSmO/aDhSKngrsKvO1+QTkFc6wa0O0t1rka9RudQnvCYusVkNY79qa8Q5qLN5rGFukRORnl+517wGaBY97giCznHZh8Nuhwyxf3ITIAr+weSP4xO/i0DkX6Ia2mFIJ9SeoXn5uV1lrzQKz1xmeZO9fSGqv93TVY3lIpbFGJjXnRSyrDT2DzFa8CMcFjWIlS6OSDRwwSfRjr7t/9Xj9VresKEeQnRwBbS+Yn7tSsZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gWmbIv/hk+t+KE9OnAMQReNcoGf5WPHcuKfLAIaVuUc=;
 b=ROvoHF/GCnlIbp6aq410BroRD1vexSKc5JooWJKOfr7EivCOptjX94SdYSkVX/ndUWrx2uK2a38IxrOGKAL0jpSGyPwarLju4fblRYD7Ew/Qjs2DVCEv2m5YQlS3iS14cGm3XRsHgSWmHiIrq4uWX9tqV0uOXhzP2fVs5RwcYNFuggfYC8uaXche8KHr6F8ZniAl5+ZBrlrloE7DRLwvBJeQH6VL0gRNWQxoeljT7wJbxRA7MPnmLVYQryXLvgLEmfDBf5sLUgntMmd7//eFMBl4+1OyOLLbNvhuFx+jmxbsFpOxGRYCGhetmSKDEHNwGsB8ltFMOcLRuzFCN17YDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gWmbIv/hk+t+KE9OnAMQReNcoGf5WPHcuKfLAIaVuUc=;
 b=0JQSTh3uKEtECIb322V0usASR11spK6jQi0mOrhDoQlVANfOLB8d2XL5ZDY7BZFfvSS+aCNJ8Nw3Z+GdQFfGkeiAcg6T6SwwSEY73W/uZNHEzY/LWhC25qG6wa8J7JL4xzf7XLDAD7ZvghPFNlxvjghnHbasQtnFaOjoxEXRLtE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1711.namprd12.prod.outlook.com
 (2603:10b6:300:10a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Thu, 9 Dec
 2021 10:25:43 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4%12]) with mapi id 15.20.4755.024; Thu, 9 Dec 2021
 10:25:43 +0000
Subject: Re: [Nouveau] Regression in 5.15 in nouveau
To: Dan Moulding <dmoulding@me.com>, sf@sfritsch.de
References: <3bf72f52-0101-36e1-8c95-4bd983dd4f04@sfritsch.de>
 <20211207204528.6740-1-dmoulding@me.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <c958de80-b8e2-da57-d30f-6f3a786e6f58@amd.com>
Date: Thu, 9 Dec 2021 11:25:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211207204528.6740-1-dmoulding@me.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM6PR08CA0017.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::29) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:2e35:ddd6:f296:528]
 (2a02:908:1252:fb60:2e35:ddd6:f296:528) by
 AM6PR08CA0017.eurprd08.prod.outlook.com (2603:10a6:20b:b2::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 9 Dec 2021 10:25:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc679abd-6f19-4e9a-1f24-08d9bafe4147
X-MS-TrafficTypeDiagnostic: MWHPR12MB1711:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB17115A26CCF5DFC8271F55E483709@MWHPR12MB1711.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:644;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LwDSt2ZVseXWCB/XdSfWKgvLTH18C9WB5rsxpbT11qq2w3hGnoi/7v3GIOAd9tTg/l8q0lhEvzxuEyciGB3FLE0Fla8Bm6X4cImRaj1Q9CM8O2Jq3mB5/eDECGxnHAzk7bIV4H0wY3W0fSacB1X+6zcguhRRiV4qpk/FS2YNtr10cYbR6CKWZu74w26Zg9qj2NEBRvcWNThVb4I6EveLfUAH8ID3loFqq2sXwPOm1BUhaXCJpaIx429WZJn+H7m3x0elx0p28TuPksIvyPLmabINO+e9ELZG+qyaclzeA005VLWxV6QNN1JpNnx2vJ4eMhMGQdgY+NjJTOEvYSXrhTv5bayturSm+cPTC7jCPdc3bUb2IFrGZ2405ITfC9PDxfQWX2qTZCXlAnwMQJr0ZQiOYsyNZCyZjBRQUezM07ovNR1o9w/2t7I3noARsRyOBmVvq10Ok597ngQB1DG7zmi//8azs1Da8RfCscffAqqlxPYaziMWz2D/kVMYnhp/3zNwqjUcJH1g7TqoU9A+6A/AkAIIZHPgkiuupI285et5SkNT6ZHZq2SQbC+X4e8BMLUR//6bACB+KnTnDWR9xTzKnUNladO+onLtmvCEIeghZ8v7+ucRZMvcMJqEg0CovSZoxu58Cc3C0DwMiHTlNIEWPaKjIk6pcZVHlRNR6KFsJ1swptE9BFklIuOKNBxNJMoRbMRLpmnhShrj1vSgxRsK8TxOKPkNJ2s+x6MZgu+gQML5vu9ClIU76rgxvHGr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(31686004)(508600001)(66556008)(8676002)(186003)(8936002)(38100700002)(86362001)(31696002)(36756003)(66946007)(83380400001)(4326008)(2616005)(5660300002)(2906002)(316002)(6486002)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHJ5bHAzaXNyWjRNb3dSMzcvUGNjNmJEbE9PNys1UzRDNDVjd093MjBqSU9X?=
 =?utf-8?B?OFloTWgzNkhVRTVQaWFLdTFGT1NNVXBlbE8wdHlIeVlaL240SjlmZ2lOSE5V?=
 =?utf-8?B?WW91ZHROYUUxdGFOeFRGR1RzdEwrK3VsODhKTjRVbjdTU1Q4eFJOb1ZEdXFy?=
 =?utf-8?B?NG1XeExGRHdKK0wwWWNnQXE4dUw2bXRmK2JldjJ1c0MvbEVKSFNiWlYwQjJq?=
 =?utf-8?B?N1VUak5Nb1RidFZudUN4eFZZVHR5RWRhcVRkK2xDTUVselB2bmdYRnROOGJS?=
 =?utf-8?B?VFR6VHovc1FJZmRiRGxmYXJER1B6aUlDKzlpN2VDMGN2NlZNa0FWMlN0cFNB?=
 =?utf-8?B?L05FSEsrNjlaT2hKQ1JqV2FXMjE4UmpOWm1MRThhL25ZalhPYVYwTlBmYk5Y?=
 =?utf-8?B?U2lrekdJMUZzb3NsVm5LajlHbVlMYWZDMW1WbnMwNm8zdGtkall3QS9XcGRX?=
 =?utf-8?B?UndZZ3VkaWxzOUZmeS9Tazlzc29FS2Jkck5GeTVMOVdqRWlKMmhRNXR5QTlL?=
 =?utf-8?B?a2JjSERScTJQZG1pdzF6cmc1OFVKL1MrcmN1c1ZJUGsrSTRLd1RKdWM2bm4v?=
 =?utf-8?B?NmpONXRwazY5Z0UwRjJUbEpDNktkNmhhTEZFMklVMGxXa0VEUHI2Yzd0V0gx?=
 =?utf-8?B?UUczN1h2bTl4U2sxd2dzZmRrd0xKVkQ1U00wN0p1aUM3MWpienZFS0FReGZh?=
 =?utf-8?B?NGovdGxrUVZtM051Wjh1V2xDTmUxYlM2UmgzS3Irb0MyQjVCWEpnUHl6TERS?=
 =?utf-8?B?NWs3WVBldE1hMERqMTFaU3g4ZTBicmdPWjBCOTBZMVRIaGEzUWJNQlpnN0I5?=
 =?utf-8?B?cktnOGlwNHRJR25Oem01STByVThFdEEvWktFZzRUeEVMbEl1SFdMcFZRMlBS?=
 =?utf-8?B?YjUwYytQODRwWEd3NGVSdkJ2QlhKMzdqVHMxZHlhUkw0SGJLcW9yakRSU1VG?=
 =?utf-8?B?K3VTZU81TysxS1hRUnZMRHdFbkZYY2Nkd2RBanBTMkUwS1VqNG5Kb21SWi96?=
 =?utf-8?B?LzhJL3I2Skdha21zRzhxelRSRER4U2tITTVLNzVzOGpSU3cvb3A5Y0pEbElM?=
 =?utf-8?B?d3BxWHhZbWQveWU2UlZIV3ZjeTk2WEo1bkc2L3oyK3pCdXpLcW5OZjlyMWRB?=
 =?utf-8?B?MGtPTjhLMWhpVmFmY203dUhsWlVLMmRvclN1d0xvRE1nZTNYTVlDdlF3di9x?=
 =?utf-8?B?QWVJbWdIVWRFYjhTMFFVdSs5aDRBWWZvYWd2SDBPd1JHUzBSNzJLdVAyS3ph?=
 =?utf-8?B?eEtnZm9MMjg4OVM5b29aemJvZUtLSm5HTWtzSTZRanZORlFMYTArdnUvT3FL?=
 =?utf-8?B?V0lNQ0U5U2hOb0Fka3BWdmU3dGZRZ3VIemVJUnN5T3RLbE54TUFqRGtINXE2?=
 =?utf-8?B?Q2NvL1I5NkhFOHNOeTFIaGR5T1lrK3BscU4xZVR0SG9yZUd4M0g0MmdDc1lI?=
 =?utf-8?B?SHM1TEZKditycUt1ZXlOc3l2OSt6Z082QlNscXhRVTFZamtPY0FmVkNTWWIw?=
 =?utf-8?B?eVdDR3pIaXJlTmlQamlDV2NxcXJ6V3BDZ2lDUEdWVWV2NkozcHhIdHFUakFM?=
 =?utf-8?B?QnErNC9uVC92WkJRUWVobDNydEhVeGJxQmFrcXphTFIzNFlrUXVVclRMN2Zr?=
 =?utf-8?B?VllNZ0hFMFR1S1d4bEpUUDVVS0VCMDY5SGsxWGJtZmdJVWQ5RDM5MmJCR1dP?=
 =?utf-8?B?eE1WVEF0aC9vdXlmNjZna2FnRjA3RFp6Uk5CSUE4L0NaKzZxQ1FMUEhPbzlk?=
 =?utf-8?B?djJTUXdOdUg2cEQ5eXVycDlVaVhlQXlrRGwraE5kSUs2ck9WT3A4OVdIck8y?=
 =?utf-8?B?Rk1naXhhSXNMbi9manJqNDJzalVNRzRVbnRkZDg4SStreE92RkRucERNTUdu?=
 =?utf-8?B?MnZUTHpCVmZDR2paQmJGb0hSWnpMcjVYTzlhVWlBVFZ3V09pM3dDdDlHUWk2?=
 =?utf-8?B?aXJ3NCtkSE1mZUQ1aERJOVA3dmRYekd1L25DUkhhUUgxTzJiUnJ2RkhsalhZ?=
 =?utf-8?B?U2dyY1ZSTS9nWE1HaFB0Vy9Xd24rZHRmK1lIaktSbXZINXp4SjZ6bkQ3dStO?=
 =?utf-8?B?Y2dSMWxyNzJTSThROUlFNnZnWUlzbjhlWCtNUGE0aW1xdTJaTVJBdGhDTS9K?=
 =?utf-8?B?YUIvdjVKK1JTU09YOGhqZms0SUVyZzE2S2FON0lzZjJESEdKUzlmaDVFVXVk?=
 =?utf-8?Q?o8xWo9R/exXvrdXXv9GSa0s=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc679abd-6f19-4e9a-1f24-08d9bafe4147
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 10:25:43.1254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q8/jpGycnOf6j1oq3koQuhtmGfu2S5NdjJUJbWp8zsoEM4ie9eLJaCyyH9geZpMf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1711
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
Cc: nouveau@lists.freedesktop.org, regressions@leemhuis.info,
 bskeggs@redhat.com, dri-devel@lists.freedesktop.org,
 regressions@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 07.12.21 um 21:45 schrieb Dan Moulding:
>> There is a pretty obvious typo in there:
>>
>> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
>> @@ -359,7 +359,7 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct
>> nouveau_channel *chan, bool e
>>                   fobj = dma_resv_shared_list(resv);
>>           }
>>
>> -       for (i = 0; (i < fobj ? fobj->shared_count : 0) && !ret; ++i) {
>> +       for (i = 0; i < (fobj ? fobj->shared_count : 0) && !ret; ++i) {
>>                   struct nouveau_channel *prev = NULL;
>>                   bool must_wait = true;
>>
>>
>> With that it works and I don't see the flickering in a short test. I
>> will do more testing, but maybe Dan can test, too.
>>
>> Cheers,
>> Stefan
> After fixing the typo the patch is working for me, also. dmesg is also
> clean. I will continue running the patched kernel. If I see any
> issues, I will report back here.

Thanks for fixing that stupid typo. I've just send out an updated 
version to the mailing list with everybody in CC.

Please review and/or comment further.

Regards,
Christian.

>
> Cheers,
>
> -- Dan

