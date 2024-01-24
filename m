Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6829583B106
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 19:24:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EAC410EA72;
	Wed, 24 Jan 2024 18:24:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D38E210EA72
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 18:23:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jp31aX0OaU0QXKv4TPkjHcICq+aJfcxBuj7njNhaWI8411lHsEgbfauyNTbGByc+qauiYqRL8uEpuev30KUHjKkpV+Njd0GCuO/T0AB3lv9+qzMdRJQdGli5PbQsDWMwkEGKfDR7/hHE9j4jboJo9XrMCX0dfRTbM3GTRjrMDJf94lo7G/RIzn9nl6oFd9LvH2nIbYyPeraRDwAdpTToPamx9ykMEy/XkRtG58HPjmFpJTg3rL3yt8A6GpMfaDGK/hVrbp0BNfzqspzuB54NqQ8lmazNfRbrqCOxnVGNIOjUNBj0nQhpgZNy6tH6o06RtkabvT31pNzsY+Yr9ZSXcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9iJOH+xVTBBy6FmcfA3EjBXEWJTdUgSstRqiS2ln60M=;
 b=kLB5CT/JW3lf9I+un3QUpmUaoSMpEs4N98TzyADCnKswaEsWulf/Zmo3TUAEjsbi73yRik8Swch8mhQBjAI0BJh3U23uwYOYCJHA0YQrfqtXABzSz/tTxmOLmKd6W1rmwGLbnq5fUdCR5wTGQeTbpM9jVWAJJHPVkHcY7xFHK5VgsuzuO7RR568NAQ1jIBTI+p7xigYYukq2oV162UP0KQgnnytec4gJYJSsEN0bw4nObWwsh/2FUUgcZQnA/veEeFZfUhkqvcWeU9jYOwGwlLptbY/HyOA9sToIoRNMtwmzSpS1ck1mN9dNhQIdjJamVkP0lx/tqy6C7pTwYmL2BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9iJOH+xVTBBy6FmcfA3EjBXEWJTdUgSstRqiS2ln60M=;
 b=u7G3pw1J7geWeEM6XlIup/wd28d+eXxzCiEV1r4hKrxTCLy67XkI8GvzgdYM2aNyAKdLsNQrIuCR6cZ6n/sfAxLT2M0gURPDItAqYkUZfNStRXQI7xsnnVUoVobKcPVgXGbw7KY11Kqq4aKwOG8Yz3Vd5LNLOQq1T4AiEZRukk4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS0PR12MB7655.namprd12.prod.outlook.com (2603:10b6:8:11e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Wed, 24 Jan
 2024 18:23:54 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ce8d:7121:cb06:91ba]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ce8d:7121:cb06:91ba%4]) with mapi id 15.20.7202.039; Wed, 24 Jan 2024
 18:23:54 +0000
Message-ID: <54efe4c8-38d8-4a5f-ac7a-aeb7a4e3535f@amd.com>
Date: Wed, 24 Jan 2024 12:23:52 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [git pull] drm for 6.8
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <CAPM=9twKBmO2Svky-zeP+KS8qWHFj9zrgeBqW9y__tUwcAYZhw@mail.gmail.com>
 <2faccc1a-7fdd-499b-aa0a-bd54f4068f3e@suse.cz>
 <CAOVeLGRxXfs4wxSmB2ULZS72NvJkWQvZyPRz0rAmQyFtL39ekw@mail.gmail.com>
 <0a782904-bb19-4111-979a-31b52aa44ca9@suse.cz>
 <a51ddb8c-cf11-4394-a2fe-ca855749ff02@amd.com>
 <e7eb12a9-67ed-45b1-aaf6-e1df52a247bd@leemhuis.info>
 <05ddb2da-b182-4791-8ef7-82179fd159a8@amd.com>
In-Reply-To: <05ddb2da-b182-4791-8ef7-82179fd159a8@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR11CA0024.namprd11.prod.outlook.com
 (2603:10b6:5:190::37) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS0PR12MB7655:EE_
X-MS-Office365-Filtering-Correlation-Id: f1dc435b-e129-4bae-76de-08dc1d099f5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z/PBhxoFbzLGu8rrSXYqelAtGw0LFjkppd52+qw/IuAZ50l1wWKR8BG3Q4VUm2Odc+ykB5pBc/zbgCOl0JIxzTvy6MdzOrVKQgXFwlPGXMtUiPGH3k+Kwh0Z8Abgza5h5m2YPHb7zGO7heFFq9+27D8UxlIBJDBBwxVhGpakkt2tDPjQd2spsr/3cq5Bo3h0lk4BBBiprMHyhYE9Qtv4zYmG36Ng9mqqr6Wrq5xfAFEeWF4N1O9ZiupePN5XfcxArR7tdGYZZgrS1puHg1AnUPEVYe9T4n6NWIjgiobN8NVcBeLJ92nzItGRfukXyuosH2g/T4NwGSBuVDW8IoeNYv+N8JlB+cU2C7BiJWMJET3R6vjLOmWZQWTF2X9bhzxHy0tJgRVnx6L+VcrQJTL6jVGc+7QRgx7ncorOGurqltGckSkOD0rSkLeYSzBZBGyV+D398OnHQYUA1Xd0tx3CSsn1CDu7Jlo9bgguDDtgu64uyBvqXYVXuZmiLdAsE1rnqYkA0LbT167z2NiLhGSu39QJo+Sv38PFP4r9H9GO3vpiPl2l1eAKMLjx4h3CsDq37ZP8l5gcBjzMFR8vk/1WdcFOjfH/2NaDKHPp8smVqVjEo0qYBlAn2wf46aIa7mcCuwdzyoKBxnFzaRxLo71lwhxpHSDaZwP/Em56fIgZ3gY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(396003)(136003)(366004)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(6512007)(7416002)(66899024)(6506007)(53546011)(26005)(83380400001)(2616005)(41300700001)(8936002)(36756003)(8676002)(4326008)(316002)(44832011)(2906002)(54906003)(5660300002)(86362001)(110136005)(31696002)(66476007)(66556008)(6486002)(966005)(478600001)(31686004)(66946007)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTJKdUhqLzdXZGRybVM5OEhBaWk0cDFyYm42ZndhYzRWVjhlck5vQmZuQlNz?=
 =?utf-8?B?YTRZbm5QNVVVbXVKbThIclV1NWE5ODdKYk5wS3hVMmVYNmllQkczQkt3SzMv?=
 =?utf-8?B?UzJkWVpORHVpVlpKL1hGOUh0MTMzais4c3kySFdLRGpUL2ZMK082bDlGcXlY?=
 =?utf-8?B?UGJtekZVNkpGZks5SjdyQmVtYVNXaHhxYmxGNjJ3NlJvckNsTldveXV0WEZZ?=
 =?utf-8?B?WWpOakNsM0l5emJGSlU3MnhGUHAyeWg4WHN2UzRQbHhpTWRTN3RMSWtFTlhY?=
 =?utf-8?B?SWRPSGsybVlPRkRVcWdRYnVVN2YyUVVpcUpYOEttY1pkL2NtTzZOSFppLzNM?=
 =?utf-8?B?d2VMOUVmblZSWXAxYXp3OGFwVU96MC85RWxLdTFOTXlqTVByTDE1U0hzeitY?=
 =?utf-8?B?NUdibnNhNDFGeVhsQmVEWUd5QThEcVdOb3U5Q24rZjBtNjF2aTkxQTVMYXZE?=
 =?utf-8?B?SzNPUjZjU0hXenJsbUV2SmF0Q1YvK01kU3ZHWVM5WEdYTjUybTZIclJ4Vjd5?=
 =?utf-8?B?RktpL2JLeUZqNkwxWWtxRlgzeE9LbWNoR3BhZy9Jd2Z0eTlwSzNDUnlsUGRz?=
 =?utf-8?B?R3ZkSzRQNnBOVGpoMFRFZEdXOWpQbFZHZ2FtZjdwMEg2UVdoVS9IWUo3UVdy?=
 =?utf-8?B?Zk8rVHQzclVXdXJFQzFBRG1KWURNL0pXa1lmL3RPQ0xxSEg0dTg0M0h0M2pj?=
 =?utf-8?B?WVhqTmsvSWszNG90cEVFUVU2RHFkQ1dPdE84MGVRcTlneEN3dGNjRnFwbUUr?=
 =?utf-8?B?VlBvUS9yVGJFanlZaXlUL0gvN3JIbWR2bTA1NW9pbCtORzh4N0l2SFJvRmdo?=
 =?utf-8?B?OVpFcldPYmRuTW42T2V0ZmRydzJEbkhTcitFcklmbWxwek1nRmIrV0h0NnRS?=
 =?utf-8?B?SjlSUS9xZlNsckx5WkhydkFIT25renhPQklFQ2lHUHowcm5MZ0syMWV3TVJG?=
 =?utf-8?B?dmZpMFV1VlYySTh6cHhLRWo2ZGgxeFJNY2EvaUNXS2JrK0RXZUl5V0FlaXVD?=
 =?utf-8?B?d1oyOHZFTXNmT3Npa21PS3ZRWFJ0aWh0QWxQWEY1V25IQkFLZjFCUmtsQVJ4?=
 =?utf-8?B?Nmg3T3hKY2NoVTA2V2VNYVBZbVJERDhtTnY1NU4rVG1namsyT25QbTR0N0lm?=
 =?utf-8?B?V09oQmlmZjlhZFhpV0xvTW5xbW55K28weXduTU1wVFIzc1hCWU4xV2dmRW83?=
 =?utf-8?B?ckhINDJYdTVVMzJpTmV3SVpsRkNWaXllbStqVzNaMXhWcXBFN3BiQUx6RUdG?=
 =?utf-8?B?WW5FaUFOMW9JUGxRUnBQWXZOVTJ5ZWh5bkh3OTJmY25WdmNoU3U5RnhudVlr?=
 =?utf-8?B?dlRZMXFjZVk4ZElGc0ZSWjR4QmlCRUUzL2s3T1BOdnVrclFTdWtzR3NkYnhq?=
 =?utf-8?B?d3lGVi9iNWhidGVQWEVRZm1GVzVMVHJzN0thc0xia1M4UmxtblhEaUkvdmxn?=
 =?utf-8?B?NGFOK3lJSkpoU0Y1Uk83MWlsTFpMMXJNMS9vN2thZUcyYkZYMWg4SnVFdGNj?=
 =?utf-8?B?RVRsQTdrcWhFTUdxNk1vWjVMYUQwZjYvM25WUDZUcVNxWWQ0dkt4MlNOeXY3?=
 =?utf-8?B?ckswVWpsRkR2WTdYbUdDSHlpQ0J1RHpUdUZqam5qOTcwWEF6K3Z5YmlrcDJm?=
 =?utf-8?B?dkdjZWpHUFVtNzJNTFBreW1lTGVBa1N3V01PaEJBeFFja21UTDlFVXJQdGlu?=
 =?utf-8?B?UWtxMlRGQU9NNHMwZlZsUkNTYVZhbmFYSE5CZWM0aHlmeDFhRFNpTE1VaFUy?=
 =?utf-8?B?K0pqR2U2SURnRVRPZ3hRS0tWQnY2M3hRS0RWOTVVN3dBUDFsS0dVSXN1LzRZ?=
 =?utf-8?B?cHo5elljZHhlK2RXUDJUTDJhZHhOeE5VZGYxd05BMm5hZVBhTTZyQWhCdWkv?=
 =?utf-8?B?NkFpbGtYZTBTVXRmTFFvSG04KzNpR1pEano0UFk4MG53Yy9HWW5TSFR4dEJh?=
 =?utf-8?B?dDlHQVZ3OENUenlTTWhEUldLNExqaEZNYW5MbmJ6Q0x5b3VhR1NYN1pQRlZJ?=
 =?utf-8?B?NnRpaWpZbjlBVFF5NW1KMTJiTFNzaFhqNTlGeURPZkFWRkVJdkVWbEVWYWhH?=
 =?utf-8?B?TUNvaktIUW85RE9SUE1MNTNOL1hFVTFBZ1prSkx4Q3A3cEkwOGZtSmhxcHgy?=
 =?utf-8?Q?bMzk8Ene5W7/XYtBAbuiFs+x4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1dc435b-e129-4bae-76de-08dc1d099f5f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 18:23:54.6895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lZLWAfy7pcB4TGG844KYruMqdazgcQ/1pIUtkKGTxRXzNPMSvGnhjocBZHvRs637UUFZnZdjtL5t7ayesOS7WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7655
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
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Donald Carr <sirspudd@gmail.com>,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 Dave Airlie <airlied@gmail.com>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/24/2024 11:52, Mario Limonciello wrote:
> On 1/24/2024 11:51, Thorsten Leemhuis wrote:
>> Linus, if you have a minute, I'd really like to know...
>>
>> On 24.01.24 17:41, Mario Limonciello wrote:
>>> On 1/24/2024 10:24, Vlastimil Babka wrote:
>>>> On 1/24/24 16:31, Donald Carr wrote:
>>>>> On Wed, Jan 24, 2024 at 7:06 AM Vlastimil Babka <vbabka@suse.cz> 
>>>>> wrote:
>>>>>> When testing the rc1 on my openSUSE Tumbleweed desktop, I've started
>>>>>> experiencing "frozen desktop" (KDE/Wayland) issues. The symptoms are
>>>>>> that
>>>>>> everything freezes including mouse cursor. After a while it either
>>>>>> resolves,
>>>>>> or e.g. firefox crashes (if it was actively used when it froze) or 
>>>>>> it's
>>>>>> frozen for too long and I reboot with alt-sysrq-b. When it's frozen
>>>>>> I can
>>>>>> still ssh to the machine, and there's nothing happening in dmesg.
>>>>>> The machine is based on Amd Ryzen 7 2700 and Radeon RX7600.
>>>>> [...]
>>>>> I am experiencing the exact same symptoms;
>>>>
>>>> Big thanks to Thorsten who suggested I look at the following:
>>>>
>>>> https://lore.kernel.org/all/20240123021155.2775-1-mario.limonciello@amd.com/
>>>> https://lore.kernel.org/all/CABXGCsM2VLs489CH-vF-1539-s3in37=bwuOWtoeeE+q26zE+Q@mail.gmail.com/
>>>>
>>>> Instead of further bisection I've applied Mario's revert from the
>>>> first link
>>>> on top of 6.8-rc1 and the issue seems gone for me now.
>>>
>>> Thanks for confirming.  I don't think we should jump right to the revert
>>> right now.
>>>
>>>    I posted it in case that is the direction we need to go
>>> (simple git revert didn't work due to contextual changes).
>>>
>>> Let's give the folks who work on GPU scheduler some time to understand
>>> the failure and see if they can fix it.
>>
>> ...how you think about this and other situations like this. Given that
>> we have
>>
>> * two affected people in this thread
>> * one earlier thread about it
>> * the machine that made Mario write the patch
>> * and I have someone in #fedora-kernel that likely is affected as well
>>
>> it seems that this is not some corner case very few people run into.
>> Hence I tend to say that this should be dealt with rather sooner than
>> later. Maybe before rc2? Or is this asking too much?
>>
>> The thing from my point of view is, that each such problem might
>> discourage testers from testing again or lead to thoughts like "I only
>> start testing after -rc4". Not to mention that other people will try to
>> bisect the problem like Vlastimil did, which will cost them quite some
>> time and effort -- only to find out that we known about the problem
>> already and did not quickly fix it. That is discouraging for them as
>> well and thus bad for field testing I'd assume.
>>
>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>> -- 
>> Everything you wanna know about Linux kernel regression tracking:
>> https://linux-regtracking.leemhuis.info/about/#tldr
>> If I did something stupid, please tell me, as explained on that page.
> 
> A test patch was just posted.  I haven't gotten a chance to try it yet. 
> I will this afternoon.

The test patch [1] posted to [2] works for me.  I expect that Matthew 
will post it to dri-devel and this can catch RC2 or RC3.

[1] 
https://gitlab.freedesktop.org/drm/amd/uploads/ca8dfaa22d6f5d247c28acf6cf3eafd2/0001-Drain-all-entities-in-DRM-run-jon-worker.patch
[2] https://gitlab.freedesktop.org/drm/amd/-/issues/3124

