Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8480783B073
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 18:52:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0BDE10EA81;
	Wed, 24 Jan 2024 17:52:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2070.outbound.protection.outlook.com [40.107.220.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47C1B10ECF7
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 17:52:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eJqWHcNqQfktQBDeJHXrJu2bsUp24Isx/pCloLEgLpvD05BHGsQst3lHY3aUGDmYLvaHD98GjbFoOVtdVcIbPF81gTaFUITuJXLQBdKTmTgZRj3HF19JrY9UJwjVnGv4y389E+h4kjj61SYyPJ2UvLxgJEwGcGF1g6e0O/Ud83wb0Gkh3RmKVj56htGCo+BOFWd8/8YnTOvAROP0m6nc5o0Brn1jTjTanmA4lZpoNEf2HdVQmS1lork4eJQfYho84Y08w5QV3ER+dbcw8CrG1aRe89+DMcYyhUTYkNomKb2g9Z3KQVyWcAFj8b0/kTe+5gWUjuP10qZJ4geFoudWRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WHqGWJPD/4nck7UiwVtFKDSnZFVQghZoXI2ghwfREHw=;
 b=UeRD7pOtng2RPq8vXtzYF5vAbWNEEJri01e0WW8GuXppjLSWryyrFKxbWZsDDoZhf4tfykd9AiWeOtMAAqPFGjGfseRtGMrfhie3bLaSq+FK1+16lO9ULbubwmU1knkQIaAbeLsc5OXByLHJ9c25OeheTK9xMGisI7OA3tU8uevsOrtPTIZtht0fYmUfdRlpoM5IJQ4i0j/RLxti8q9pzJjVjELmXYa/tBiImfsfv/5gWiOUu0zru17z59GhEBPecQseuOdzf+w1SWv9OJVe7ct1fknEy2/R7d2POL6qUgV2QYwLuQPFAWrzI00nRJe5rSt4wysaf+mTEjxQZjDSMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WHqGWJPD/4nck7UiwVtFKDSnZFVQghZoXI2ghwfREHw=;
 b=S67ITcvnqA6phA8urYD43dx9aL3McuD+MVhs5xiKg4wn3EVMifEf/747kBXFz4umTTcDRXFmd3viw1diuFvsLDF6uRr3Ki920I2Siad+yU7JvcU+7ovVIJsq8qAK+nV/NTYdtVEp3O1BXgvVltnmAkSPPl3QqgvV0UyzTtH3KTM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CY8PR12MB7657.namprd12.prod.outlook.com (2603:10b6:930:9d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Wed, 24 Jan
 2024 17:52:30 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ce8d:7121:cb06:91ba]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ce8d:7121:cb06:91ba%4]) with mapi id 15.20.7202.039; Wed, 24 Jan 2024
 17:52:30 +0000
Message-ID: <05ddb2da-b182-4791-8ef7-82179fd159a8@amd.com>
Date: Wed, 24 Jan 2024 11:52:27 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [git pull] drm for 6.8
Content-Language: en-US
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <CAPM=9twKBmO2Svky-zeP+KS8qWHFj9zrgeBqW9y__tUwcAYZhw@mail.gmail.com>
 <2faccc1a-7fdd-499b-aa0a-bd54f4068f3e@suse.cz>
 <CAOVeLGRxXfs4wxSmB2ULZS72NvJkWQvZyPRz0rAmQyFtL39ekw@mail.gmail.com>
 <0a782904-bb19-4111-979a-31b52aa44ca9@suse.cz>
 <a51ddb8c-cf11-4394-a2fe-ca855749ff02@amd.com>
 <e7eb12a9-67ed-45b1-aaf6-e1df52a247bd@leemhuis.info>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <e7eb12a9-67ed-45b1-aaf6-e1df52a247bd@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS7PR03CA0089.namprd03.prod.outlook.com
 (2603:10b6:5:3bb::34) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CY8PR12MB7657:EE_
X-MS-Office365-Filtering-Correlation-Id: 7793f3a4-5d9c-4aed-a32d-08dc1d053c12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qkBniext6puR9yl1gzo3gPeICL/J1w5KJXqGjrZxBbRlyba9fIYp2rKRX7DwuZrv25GgloIgtR3pXi3e2g3dkpMV0sQj2BQt0Ue9qmkc9SKxDRv/bhM6eRtW7AuEZuopTK55q4lCz49T8r1K2dgMpQkPMWtavkSZdrfGElEMuXfURzKP1F3G6imKL5MVlXIG/5FmwBcV0d8gE9b9qzGK7lDcJBh+R3JxKhdP8V6GzeIC91g7prMgvLkUZy3vpar04SiDpoZJE0PX/NweLgueWRMIOKJqbtu607GDoP3w6dQPhBecrmQfSW4audfEBPzDE9d5wAgNX3SfGzlebZec+wBct1xnZpE7ABwF7tN9u3Vqeduf0dGQNT7EMdnNDBPSu6dNjfi/9UorJxbvfaP+tj09eWiSKW9udK+e3uM7OAqL1Q2JIzNLapwloyeh5u7EgDcfjKwkhVODWt07tpCurQnzF823Q0QwuUmLQUnNYXrD2WtUqh5w85zx7+ijStc/TzD6wN9U5la7PPYoPmk6Wv8au94OOARoHQaMNts63sQmuAq4wfEvrcoZmczBd4zC9TZq67VayUZeDPlPmM0GxCB7TBzPw5Sbx5UeTNArriraWSuJO7Y89UjV9grVGVM2b/F+h708DHtqLyshCNS9/MEJ6oyZIJKme6Ba12dYR8CDvrP8KHFdHyKaMrbzWWxr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(346002)(376002)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(31686004)(66899024)(83380400001)(36756003)(86362001)(31696002)(26005)(38100700002)(41300700001)(6486002)(6512007)(6506007)(44832011)(54906003)(2906002)(316002)(478600001)(966005)(4326008)(53546011)(110136005)(66946007)(6666004)(66556008)(7416002)(66476007)(2616005)(5660300002)(8936002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ditPd2xzUXh1L01pZm9xR3hXUVBmbFc1TE9zdzNUZUJhdjREVER1YjU4V09O?=
 =?utf-8?B?M3hIUTExV2QwVEV3VnQyQUQ5SncxRWF4dWhrbVNBTVpTN3lIbXA2aVV3cSsy?=
 =?utf-8?B?cU5wZjR3U25iL21KOW5BUzRaSEY0OVkrSmNuVXI3Y0d5RnEzdlY1dkNxUU5E?=
 =?utf-8?B?YW1LRXRDUUF4MnBMQ3FmUVBhTDFZTFd4VXA5OVFzWEJoRUtFY1FlZUlwR1NC?=
 =?utf-8?B?NVpiTDRrbkQ0Z0IvbWlWdUNNNktFaE1yZ1ZYa0kwMVY4N2RtSDc1bzJnMmdu?=
 =?utf-8?B?TndOVHIvYVoxRklzUmgvWGVuZW41VEErN3VvSWZtOW1VK3lvUXU0KzdmWFpr?=
 =?utf-8?B?dzRNWHdNQ09PME5kUlRDWmJwdzlNM2pBNmxnT1VOOURBeUZ4cndsTStMQTRQ?=
 =?utf-8?B?U05idzRQendQVm9EQVVSVzJZaTM1eUladnpaYUNHdThOYWtLNWhXbDZvaGtM?=
 =?utf-8?B?aGEzcWhaUlk5T29EdVBsczR4Y1Y5OGNrMHJJSFpTKzRmMlRtcWlnUGY0Ylk3?=
 =?utf-8?B?OU02TFZDZXl6Zjc2V1lLYWpzNlVjcHVkZGRsYnllbENhTTUvaWVtVUthclV6?=
 =?utf-8?B?NGkxaEtzUzZFbWtubUZPbmcyUVdaUlJGNlFUbGsrV2dvSTgwMW04SEU5cGF6?=
 =?utf-8?B?bVZrdVBJcTRoZkI2V2lWZFdlaDZ2M0ovT3E5a252dEU4SzdVaW1icDdwVnN1?=
 =?utf-8?B?Y0F3MlkwSTBZYzU2czU0Vnl0aEdYdkJNbmd6ZlBUMk8wT1NjdnlsaXlMVDBr?=
 =?utf-8?B?V090TFk5RityeklpaDJrTzBuVWVyYXFTN3UxZHVwdURhbUZnMzNxdU9nQ3or?=
 =?utf-8?B?TUd6Y3d4MkVxY3luNHZzQVdWUUJyS0VlQzlMb0h3SkhKbmQ5L0RpYjQ2SUtM?=
 =?utf-8?B?bDVEYWlOQ3g0K3UyQ29wNzFaTVRZTSttQXA1eDRURlUraWJBZXRZbHRNd01S?=
 =?utf-8?B?ZWJ3MGRZeFFNL1hDb2VnRkxzeGhpajhpQ0h0eWQrK3FLbXlyTVk5Yzg4dVRF?=
 =?utf-8?B?TFBhSytHT0lCcDArUFZIWkphR0pPT05wRUhhSTU3UVhFaXgxeUk4Tkt1S2M3?=
 =?utf-8?B?M2RwUnFaTC9sd2MwTzk3YVcxNXgwbGRBL1FtMzl5Mm1rcjlxNVJjWFFNbkJt?=
 =?utf-8?B?d20vQTBUaTYrbmlsUFNxaW11VW1XTTJ1ajVmOHlwZlFXNmtodDJIaEY5WjNs?=
 =?utf-8?B?eElrc0swZURPMkpYM0ZkSTFwWW1Ja2xnNlFQSXpsOEhlejJ5UnFzZU1PZHZG?=
 =?utf-8?B?SCtZMi9PU3BDZFQ5dTUxNDIvS1FMYjR0MUNUWUdEMEZ5WHZ5ZzQ4RVFkbyt5?=
 =?utf-8?B?Yk9WU21EMHNFM3ptS3BSSTFzVUlxODArcUxCNitwckMxcDdoTnY4SHRLSFoy?=
 =?utf-8?B?dE1OQ0svNFZtSGZSOHhiWUxDSmNTNW9pd0NtbkRsNXl6YXh4WEM2S0tHNEhj?=
 =?utf-8?B?bDZKdHowTzFONjdZeklHZHVFNjRZVFNDUGxhUjljem1DZFo5dWpRbUd2TjQ2?=
 =?utf-8?B?Nk44dTh3Q0N5SnNwbWE4R2tzY3NxTGN1ZDVadXFub3F1bjJaL2syMjl2em5Z?=
 =?utf-8?B?MWMwM3g0K043aHRJc3k1NmlWTWZMV0ZYcHJTdFJna2J1SXBheEJyc2tCaVJV?=
 =?utf-8?B?Qnh3U3NJOExTTDFlWkxzWDdPTzliYW8wR0xHWnBBdm1UNjRrU3h5Q3FyclBL?=
 =?utf-8?B?OGQyeDMvMUVzRGQ4Wi9hYzlhem5HZG1QWDdyZXhyaWtCRFdrUHRsV2JvVDZ3?=
 =?utf-8?B?bldrcnM0S052ZC9VSGJRZElQd2NNbHZsVUV0U2x5SHA3eEl3RFc1bnNwam95?=
 =?utf-8?B?UVlVVExYUmtZVXVBUjMyQ1dOUW5KQWRlODdRMW9vMTlxclNkaWJPdTNwUUpp?=
 =?utf-8?B?ekxmVXF5Wm04cCt2V3l5Vld3K0t0aERZMVhNd0ljM2ZpeS9HZFFDNHZBQ2FQ?=
 =?utf-8?B?OHYvNzV1MGhicitacmIyWnVCL2QvS2RiWHFzbVdxWjlsVWMzejhYWk1pMll1?=
 =?utf-8?B?Zms0dlVnS2dxcVJzSE5SWVZKNTNNblNmb1lNNG9DRVIyUUR4aDdUb25tV0NE?=
 =?utf-8?B?cFdTVS82OVR6bEdocmRXWk9JcDY1Vncva2VxQVFqOGdjQ1dHVTVKREJKZEto?=
 =?utf-8?Q?Gu0vYn4MJmKLcqzWTPNhLcdAC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7793f3a4-5d9c-4aed-a32d-08dc1d053c12
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 17:52:30.0886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3oWTDX9SqQQRs/hoRWq3N/UvQ9z1t3JwMdq9JmXFvcljNXNQbkm6wxHhAfQAzhxrDC+bLjpS0QckK9ArvVo6kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7657
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

On 1/24/2024 11:51, Thorsten Leemhuis wrote:
> Linus, if you have a minute, I'd really like to know...
> 
> On 24.01.24 17:41, Mario Limonciello wrote:
>> On 1/24/2024 10:24, Vlastimil Babka wrote:
>>> On 1/24/24 16:31, Donald Carr wrote:
>>>> On Wed, Jan 24, 2024 at 7:06 AM Vlastimil Babka <vbabka@suse.cz> wrote:
>>>>> When testing the rc1 on my openSUSE Tumbleweed desktop, I've started
>>>>> experiencing "frozen desktop" (KDE/Wayland) issues. The symptoms are
>>>>> that
>>>>> everything freezes including mouse cursor. After a while it either
>>>>> resolves,
>>>>> or e.g. firefox crashes (if it was actively used when it froze) or it's
>>>>> frozen for too long and I reboot with alt-sysrq-b. When it's frozen
>>>>> I can
>>>>> still ssh to the machine, and there's nothing happening in dmesg.
>>>>> The machine is based on Amd Ryzen 7 2700 and Radeon RX7600.
>>>> [...]
>>>> I am experiencing the exact same symptoms;
>>>
>>> Big thanks to Thorsten who suggested I look at the following:
>>>
>>> https://lore.kernel.org/all/20240123021155.2775-1-mario.limonciello@amd.com/
>>> https://lore.kernel.org/all/CABXGCsM2VLs489CH-vF-1539-s3in37=bwuOWtoeeE+q26zE+Q@mail.gmail.com/
>>>
>>> Instead of further bisection I've applied Mario's revert from the
>>> first link
>>> on top of 6.8-rc1 and the issue seems gone for me now.
>>
>> Thanks for confirming.  I don't think we should jump right to the revert
>> right now.
>>
>>    I posted it in case that is the direction we need to go
>> (simple git revert didn't work due to contextual changes).
>>
>> Let's give the folks who work on GPU scheduler some time to understand
>> the failure and see if they can fix it.
> 
> ...how you think about this and other situations like this. Given that
> we have
> 
> * two affected people in this thread
> * one earlier thread about it
> * the machine that made Mario write the patch
> * and I have someone in #fedora-kernel that likely is affected as well
> 
> it seems that this is not some corner case very few people run into.
> Hence I tend to say that this should be dealt with rather sooner than
> later. Maybe before rc2? Or is this asking too much?
> 
> The thing from my point of view is, that each such problem might
> discourage testers from testing again or lead to thoughts like "I only
> start testing after -rc4". Not to mention that other people will try to
> bisect the problem like Vlastimil did, which will cost them quite some
> time and effort -- only to find out that we known about the problem
> already and did not quickly fix it. That is discouraging for them as
> well and thus bad for field testing I'd assume.
> 
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.

A test patch was just posted.  I haven't gotten a chance to try it yet. 
I will this afternoon.
