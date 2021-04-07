Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3403567F0
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 11:25:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC296E093;
	Wed,  7 Apr 2021 09:25:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2045.outbound.protection.outlook.com [40.107.223.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7EE36E8E2
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Apr 2021 09:25:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QrBGbgEmxnWl+cEUx37kqGZk6oxso+hUZF2HYf7BwEb4nZudfU+dBzmv4y0mZIrjdf3w6ro5x2BRPb7h2YXafk2439FoP0Ee0u5IwrRxJ6dPrPcIhDbPgDGBsinC65qup1IU1l1FZr12mzyxGis0nNV0LvfUB6+AgxoUB1Uvu7qby4aMdhOkb+YiLLQ5ho+4gonWJk9ZII4ebI/hF2qQTmiRJwQjSkd+wlKGwOnlUJ0DFjOhmT9Yx/YD4jhOzo6ifNRw6wS3nj2fhi+BYDs4rQqUUuRbh5UQslakUC574+YdexTV+ToySfFIqAuziA7R+7i2T10f7RgQn16MUBuBDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PT+IsCUa+peiQP5NscogrXRHxVjbZi6gyievMTNeh1s=;
 b=Hr8y8oMeb3XHgAtH4lHtUKrQecTk+YYIANMo4JXQ0YEpZkfsqKPatmkmRXDgxJUycqkiUID7zRNNylzNB84YTtw5zRyDtB+c4cuBXq5GgZUg39zmw8/vfkmeTzcxAL/RsN+I8Q7KE64VE9D5L6MMjk4z7Q0lwjt7QWOW2xY1s3lnc+Guf8YgGe0nXx30xSsEoaVZ5BIFbR3kbh8J2gPASMBpyueph8UTYYg9JZ0YhrBhmNnyts2ZZXXBqffqpFxmd6xOyeK3pjgt4QRaRBbsVHiyoxnFCP7JzriGArdHkCLsDUe5vAUwtAHJpnE2xj7/ZA24XRv1Vzi9+odQyn1nPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PT+IsCUa+peiQP5NscogrXRHxVjbZi6gyievMTNeh1s=;
 b=DVET0xmj3iCA5pSWMvhCIyvEOouq4h+gq5kzCIQX3QOD5S73BWUsDcYJ3+D9xMnShhQlWWQWh3yFq6Yevzfoe3pQe5Fcf4SDlgfScScO2WRKh7gCPfxppGP6WUfB4pVz7L5orIEDQxx028SRb8L8zEvT+PhIuRStExm8QMJdEAU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB3764.namprd12.prod.outlook.com (2603:10b6:a03:1ac::17)
 by BY5PR12MB4902.namprd12.prod.outlook.com (2603:10b6:a03:1dd::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Wed, 7 Apr
 2021 09:25:43 +0000
Received: from BY5PR12MB3764.namprd12.prod.outlook.com
 ([fe80::11bb:b39e:3f42:d2af]) by BY5PR12MB3764.namprd12.prod.outlook.com
 ([fe80::11bb:b39e:3f42:d2af%7]) with mapi id 15.20.3999.033; Wed, 7 Apr 2021
 09:25:42 +0000
Subject: Re: your mail
To: Huang Rui <ray.huang@amd.com>, songqiang <songqiang@uniontech.com>
References: <20210407012746.16082-1-songqiang@uniontech.com>
 <20210407082509.GA763729@hr-amd>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <c43432c9-175f-5359-3024-df721181f13d@amd.com>
Date: Wed, 7 Apr 2021 11:25:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210407082509.GA763729@hr-amd>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:c8cb:bea6:b85a:47d0]
X-ClientProxiedBy: AM0PR02CA0022.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::35) To BY5PR12MB3764.namprd12.prod.outlook.com
 (2603:10b6:a03:1ac::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:c8cb:bea6:b85a:47d0]
 (2a02:908:1252:fb60:c8cb:bea6:b85a:47d0) by
 AM0PR02CA0022.eurprd02.prod.outlook.com (2603:10a6:208:3e::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 7 Apr 2021 09:25:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd7e0a01-a6fe-4460-92c3-08d8f9a71d75
X-MS-TrafficTypeDiagnostic: BY5PR12MB4902:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB4902603920D0C0F75069F3BB83759@BY5PR12MB4902.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f34ug5aJoH6/z6p+7rjfZVpJSZFGVmEiZXUtdG1fNKWqhWwY/ANmRGkikA9RTYaM0ZnVidAFP+oQ4rp7sV+DmLWpZEqUpn2utYFKf62/QCzEAVVwUx32uHxyGBD902sjVDriKCzDvUAwBI2CHsroWL988noBUP2jkVQS339eqNDXDvVKftRsb2VoH8FjyO5Eh6s5Ewzp2/5K+Kt+dhN+WRaba7c20Kwl1eEl73arRaoOxdYRCsuc4sy7d3g4aK9iUBXbriNt+3x/SWYzR34Si+qKVrZW1dkuL6jlaOefHBJ1rzQVncr3cKh28z408HZXS65l8HwfcaH6vVe2EOd+NjZLY+fN+OUz3YsKOx1tBZbU9Kwfwvo5tlX+1IFkSGoJjMfSoZ0zoaO8ckbkGGUAtEdSRZ0YDysz++EEb0Fjj7iTdsSByXqiDzdVUNjNlrUHGO4udzJJLa32bc64cozUNMbhfbsea4K4JXO+Q5+SNlm+ZlS9msgPf76dJQobuuUrGkUlN/Dj8xw3Vts68IYfx2SX7ZZV+I47AFoOkLRjd+5l3FYmsV1QttnQkC0UYiBkTcpmFN510KD69Shb2mUOUkNH3DjvLCXL07sE9pptns3mHeeGCeM5h4I6k3GOG8hTIP4t+6mlMT+kkWoGoCpIqagxE4t2Ee+EMb8s/Xx8ctRCE5zRLW5LUwBnuluKahRodkGd1ev9o2vbobEqknApXP1L2tDSGXejOUC5wJ1Mo7/UhrSRbtM053f7bB64uDMP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB3764.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(346002)(39860400002)(366004)(8936002)(4326008)(8676002)(110136005)(478600001)(31686004)(5660300002)(2906002)(186003)(16526019)(66556008)(36756003)(31696002)(6666004)(45080400002)(86362001)(3480700007)(54906003)(52116002)(2616005)(966005)(66946007)(38100700001)(83380400001)(6486002)(66476007)(316002)(7116003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NWxMbmdXWE1qVHVsRE9kRnd6VmxKNUxNU21meHRjY2UyaVZVZExHVkNwbk9X?=
 =?utf-8?B?KzNPaTJ2U0k2TkFwbWJOYkhWRzlrZTBGSU0xRGxnY2N1endMbE1sWGZFWlp4?=
 =?utf-8?B?TWJSWHdMUGFWTC9TTzZtdHUzQk40ekJ2WlhkY0hMT2k3UVlTdElydlhvV1VQ?=
 =?utf-8?B?YjZJYXpqNHpaM21EM1orcEJGS1YvMS9kdW1hMlM3ZmtDRlg3eE9qYW8wTEhM?=
 =?utf-8?B?UUJuYWxNQ2E1NERPRHlOR3BrVDh2d3g5QmVrZWJCSm5RWlF1dWlZcXFYb0M5?=
 =?utf-8?B?dHJGd2VjcHlZcWhwbytvRm9UU2tuc2JnbjgyYkVIcFp0VFhtdDV4bWZTMGVm?=
 =?utf-8?B?NGJTNUdIVlZRemtHa24veGNJeGV3aHBpRVFhbkw0MEJBUUhFZEhZREIzZnA2?=
 =?utf-8?B?bm9IRHdxN3JlNVRMd1h2MytQMUl4VS9MMVNlY0ZPZWpTNHVtMjRpMVA5WFZI?=
 =?utf-8?B?MUxjNXU4b0VoblFyZ285V1V1NHR3V0wwVldQNFpnS0tHcE5HaWp1eXJrd0lB?=
 =?utf-8?B?SHBxdCtiWkNPbGFic3RCRXhVSk4wdmZLT3pCQWY4M2JRQU4reXp5Y2hVODEy?=
 =?utf-8?B?Q1BrcTVtRUwyLzgweGpmU084SkpxMGZNcW1mYWlveWlLaDdSN3U2b3Y5Snd2?=
 =?utf-8?B?Z21YcFJEMExqRzRpa3ZKcWJBL2JSQVh5TTB6cUk1a3VSK3hkNW1xdm9PZ1Vz?=
 =?utf-8?B?cVMzYlhDaGFYRlpsV1p3ZG96bzBlQnc3Y213clNIcFVtSGxrTlFyeTYwenRp?=
 =?utf-8?B?QUNTZTEyWHMxWEc0c2FRcDlwRXR6M1JPQnJFWGt1VU01UjVsb2JTd3VIaWlQ?=
 =?utf-8?B?TFRkaDlTNnVUWGs3MVhKQTVEbjhRV0orbXR0dzhpcklBU1Z6V1RTdng5M2xq?=
 =?utf-8?B?azFBVGY1UVNvWThIcjJQQWM0MWlvQS9BeG1LOUJWeDJRaVFVZWtYMCsyei9J?=
 =?utf-8?B?OFZsamdSVTdhSHR3c0VzRmFmVUJveTJPRUtyMDR2ampERTh1SWtTVmcxanFy?=
 =?utf-8?B?djY2WVZZUmF1WEFiWVBMTUNhOWN6WHo0YzBlWDVGdFp6UEo3SWlhR0tKOEtN?=
 =?utf-8?B?bzRzQktXRmZYTFdwNzNpNFpqSG94SU41YlBRcDFWOXRweURFT1NsZ2R0TVV6?=
 =?utf-8?B?V0JzTHFKamNZdm9WeEcrWlJmYXBqZG4yMzlDNDYzdG8wa1dGNDBucnhvRGIy?=
 =?utf-8?B?NS9xK2toNFp2dTZjNWpLZ3FOZ2VFWlFuZFQvSFlzTnpWYU9semZodU9oZHN3?=
 =?utf-8?B?Q0ViMmczWmowSjNSTDIwNEhCd1ZZdEtUb3h3c2VIdHltVno3a2JjMk8wZmZD?=
 =?utf-8?B?TGVnaFJWeU84d01CdG9LNkN0SGdiaW0xTVBtNFJHK2g1ZmxUYndQeTBhRzVI?=
 =?utf-8?B?OHVRQ0hNaFBRb3dJNkdNc1pqVXFSZTFaRDY5RDgxNkpwS2REUmpWcFFhdU9H?=
 =?utf-8?B?cUdENmRqSEFTWTVTOG1nL0EzSTdGY3d1RzlWaExzWlJrOWFlbm1rbVBrdUxh?=
 =?utf-8?B?dFBoQnJ6WlJITTZhOUdGRVBqVUk1NTNyVVBWSDBwa3VnTkpLWWNidkN6MFo4?=
 =?utf-8?B?NkRyaC9TTzVralJZMkN5RFZSenhMeTd3M3NwYUR2NkJRNXE4ZkNBYysramRz?=
 =?utf-8?B?T3lTNGpnNUhnY29JRktEenljcE13MGVIZExjdnhMbGo5Y0FBMktLYVM3LzV0?=
 =?utf-8?B?eEEwZC8vQysyOG1xdTlsWUxEbzhyMTlrR2hwcFNHai9JdWtxdFQ1bHdmc1Rn?=
 =?utf-8?B?UDVwVWlxdjBEVWRGMEFEUG1ReWhPMVBQelpCaTdMbmJYWHVYcE9qb1IyRlJ1?=
 =?utf-8?B?MWNzMnZaYXJldGVBTDRPRjZKZnhwYnp1dVl4MlJmYTRqcVZlb0paaU5UczQ5?=
 =?utf-8?Q?z/RbXtcolbf3E?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd7e0a01-a6fe-4460-92c3-08d8f9a71d75
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3764.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 09:25:42.6321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M7PobD8VAXrQtLSLus6Z12l4jgNoTl4TH4zJwW5kKBACzX6OHAONULwvMBIJtDjo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4902
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks Ray for pointing this out. Looks like the mail ended up in my 
spam folder otherwise.

Apart from that this patch is a really really big NAK. I can't count how 
often I had to reject stuff like this!

Using the page reference for TTM pages is illegal and can lead to struct 
page corruption.

Can you please describe why you need that?

Regards,
Christian.

Am 07.04.21 um 10:25 schrieb Huang Rui:
> On Wed, Apr 07, 2021 at 09:27:46AM +0800, songqiang wrote:
>
> Please add the description in the commit message and subject.
>
> Thanks,
> Ray
>
>> Signed-off-by: songqiang <songqiang@uniontech.com>
>> ---
>>   drivers/gpu/drm/ttm/ttm_page_alloc.c | 18 ++++++++++++++----
>>   1 file changed, 14 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_page_alloc.c b/drivers/gpu/drm/ttm/ttm_page_alloc.c
>> index 14660f723f71..f3698f0ad4d7 100644
>> --- a/drivers/gpu/drm/ttm/ttm_page_alloc.c
>> +++ b/drivers/gpu/drm/ttm/ttm_page_alloc.c
>> @@ -736,8 +736,16 @@ static void ttm_put_pages(struct page **pages, unsigned npages, int flags,
>>   					if (++p != pages[i + j])
>>   					    break;
>>   
>> -				if (j == HPAGE_PMD_NR)
>> +				if (j == HPAGE_PMD_NR) {
>>   					order = HPAGE_PMD_ORDER;
>> +					for (j = 1; j < HPAGE_PMD_NR; ++j)
>> +						page_ref_dec(pages[i+j]);
>> +				}
>>   			}
>>   #endif
>>   
>> @@ -868,10 +876,12 @@ static int ttm_get_pages(struct page **pages, unsigned npages, int flags,
>>   				p = alloc_pages(huge_flags, HPAGE_PMD_ORDER);
>>   				if (!p)
>>   					break;
>> -
>> -				for (j = 0; j < HPAGE_PMD_NR; ++j)
>> +				for (j = 0; j < HPAGE_PMD_NR; ++j) {
>>   					pages[i++] = p++;
>> -
>> +					if (j > 0)
>> +						page_ref_inc(pages[i-1]);
>> +				}
>>   				npages -= HPAGE_PMD_NR;
>>   			}
>>   		}
>>
>>
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=04%7C01%7Cray.huang%40amd.com%7C4ccc617b77d746db5af108d8f98db612%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637533734805563118%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=9bSP90LYdJyJYJYmuphVmqk%2B3%2FE4JPrtXkQTbxwAt68%3D&amp;reserved=0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
