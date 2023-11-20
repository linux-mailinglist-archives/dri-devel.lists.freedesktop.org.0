Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 309A27F1891
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 17:24:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 195EC10E061;
	Mon, 20 Nov 2023 16:24:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20609.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::609])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64D0D10E060;
 Mon, 20 Nov 2023 16:24:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g+hHN22e34x4T/D/ytqcouFVtNdmUckj0kH3AurU/LgneIckNhRYpGbHfKmKSbYtIdZyxThfspqC+JZRBV3vRVoc9GsSpf0dCFboNsopMz/P5zXCiOiBJNQv4spGHRrAWn01Ckl6Nh0j0Rpkb6UOzMOqS441859Y1yr0kirpLX8xD4sb5yzFoG7MY/0LJIb1rMYv4Zj/7t1bBxtBMjbWNZqPlTzP2JrbpQV68y5tiQecwrfsR6uBjoRADE4wBKUpZCR9hTgNOPUp8JW5791EyrPpnfsXqsSGmXHeV2+VPdWboU0lw2c2Pady6atoDKnlKwQEY9ceWFAng0cKaIUsjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bAmC98RlNntqiDeXBxvhpMZf4SSxqNsVPM1NB9jCutY=;
 b=iZOO+ufzTCEV5qpLptR48gRSZugIRK/X4S57MCkpEU/4g4tyhA2XQzeWl++N8AmLU5xxSzk6JJJdTWpJFwXcm9tppanbCIBBYVEB2GdUw6ESH6QaUtR9jE9QqEgLW30JMNxmwJkHI5nmkc3/uIK3kZeH21xprKEM+43/nnHy/GSjLbCavrzx0lCRjRsT44AI2cICAYImHpD9cUMs1//LiYa5vYAEiw1/SAb2UAcXhJxc+fUIaueo95H0gekqza6wkN4xyZyen3GP26QwznlCgK13O5p8ZJmC6ht3ijjP02BZDnrcU8xclb5ogb9Wu7DP8CY6KsPkRxcLdmrLYdsT+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bAmC98RlNntqiDeXBxvhpMZf4SSxqNsVPM1NB9jCutY=;
 b=lIBybu5OYhnXG3AyoKujyNq2Q4YU2lOl87hQS5Nul9yewEy/5cfwf8Wf0+f2g2Gx5CLKYA2Nu/ANJmdL0ltCx4AsMYehZ9u/mO8ll/5rXJDmqe54S/MQorX/9xMWsA+uTR7GLvjMXmv/x3YH2TTikJCpDcFx0RHSLAAwcUXBnUA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH0PR12MB5452.namprd12.prod.outlook.com (2603:10b6:510:d7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.26; Mon, 20 Nov
 2023 16:24:16 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%7]) with mapi id 15.20.7002.027; Mon, 20 Nov 2023
 16:24:16 +0000
Message-ID: <96e2e13c-f01c-4baf-a9a3-cbaa48fb10c7@amd.com>
Date: Mon, 20 Nov 2023 17:24:14 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Radeon regression in 6.6 kernel
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <87edgv4x3i.fsf@vps.thesusis.net>
 <559d0fa5-953a-4a97-b03b-5eb1287c83d8@leemhuis.info>
 <CAPM=9tw-8pQWFso0zuLqpsqd5BSHWtc4As9ttdjY-DDr70EMqQ@mail.gmail.com>
 <bdb238b6-60c7-4f26-81d0-9e62cd5dd326@gmail.com>
 <CADnq5_NVGS1XykxGxpcu_bpPbzboCUJQkcCF3r+0N9a23KUgiQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CADnq5_NVGS1XykxGxpcu_bpPbzboCUJQkcCF3r+0N9a23KUgiQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0218.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH0PR12MB5452:EE_
X-MS-Office365-Filtering-Correlation-Id: 590a02ab-14f7-4406-54f9-08dbe9e52405
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yi93lW9JIGm44DZh+65YQcRdbDOMQIN1GilXWCdHVsHgJaYXbzdhsd50Sp9BeoSehzJFydnN4Tas22OEXwwjYm7hH/iPpCPdWPKZNRAEI1uyqsC9v1AzHO6tFfH5AXsB6OKNZNyTtRNv3MyuxQolWHYnLBUmO32m5J64Q1LLX4oi+VFu8IOn1EemBcwFPbM3yecVP33zQz8ig9wzdNsvXvitr5kmqdkDotvDPzX4z6XbPbkWzoqmHFwt/oLm25SC9Es3KYtXP/Dvq4bZ6Ez1roi1+6sNiuem6Ct3eEkr2BQq+1PwUF0QL0VVlmpWNbNzZBY7GDDZzCP6xEyNTXMxxTRuyGRgti/pLbLFzilNDP1e/nJE6EUWNx0VWRQ/GfhNXHTob196tCldUtuOz7U2w1B0GSzwAEMv8PHRWk02kpo4rs4yI7lUMzg5QH325yIAhy3Yj9Mzz7RiTHfLGztsLs9FM7NMOspVso0ME8+IgOjwjQfRNH659lWN/JFsLzvXz/uMuNmsYP/sMHgg8fTJmg/xxtd/KWX8SkFtSwAFcYoP1YIiVqCYKxS80aBtiPb80EQNCmrfUPfizEi4QK9Zd400N3l77sor9QAy+Mvlv4iK3CrMreH6Fv+eqEPq6btg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(366004)(136003)(396003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(41300700001)(36756003)(31696002)(2906002)(5660300002)(86362001)(6486002)(66574015)(110136005)(8936002)(83380400001)(6506007)(53546011)(478600001)(966005)(26005)(2616005)(6512007)(38100700002)(4326008)(8676002)(54906003)(316002)(66946007)(31686004)(66556008)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUdaekJpSk1MNFJENVlmMWN4T1VzT3laU1NRTnRRTWVHcGdQQTR3WTlzeEJD?=
 =?utf-8?B?TXZOZXAvK3RRZTBLTmgybk9jUU4yckFnRFlkNHJDQXRmSEc3M3NNdVVlZTRS?=
 =?utf-8?B?OVNaeDB0UDEyU09LY3B4TEc4bVlTTThXaVZ0WjNZeWZlNDFvNjU0ZXJPRllh?=
 =?utf-8?B?ZnFWYkdOWkdjUnNucmNOZVk0Q1ZONmF3cGx4QlBBR1NBdktlbkZKVUhHeDBr?=
 =?utf-8?B?YmJXVWZ5aW4xMCs3b3dodzJoaU5oOXZPemdNcHZWVUlFQTQ2QW54akluMnAv?=
 =?utf-8?B?d0tEUWpwTVA5em9sekpKVldCZ1RqSU1jVCtZcmpLZGUxNnVCR2pSSDBMakR4?=
 =?utf-8?B?MlgwdklZM0VnbVpRS1BiNEJGT21MUFJJSUFrcW9PMWJWZTBwSE16K3RYdnUw?=
 =?utf-8?B?bzVBYVNqVnpmK1BtM29oeXpRTUkvRjF4enNKQ2RNYnZDYlBQUHpTZVFOMzdC?=
 =?utf-8?B?Q05jMTFNRVhkWTFTYW5CSzFUTTVsZUorU0NuZGprWmF5MFd0Sk5qWjNMSXhW?=
 =?utf-8?B?R2V4UUZaS1BhdUpMTGR1eklrK3ZwOGZjbER4c1NvdmsvVzQ3N0NGeDZZMnhJ?=
 =?utf-8?B?QXNJSTBqQ2xKWVNpaEJjM1J3MGJod2Nad3RJQVlJYk5VQm1hamExTlQvL1E5?=
 =?utf-8?B?VGVGaXZhek1jRjhmYVZYMDhCbkdPUGZuVG1JelVwaW5JamdMUkNCZmllNVkw?=
 =?utf-8?B?U0RxRmY5cXdYeEJpN1Z4N1JwYzRKZ0NDRldyM2dwZXBCTWQ3ZCtRRGxpK2c5?=
 =?utf-8?B?Y1NjU0RPZld4a3hrYjhVcGJRYXBGY3JPT2lBa0FKa0pEYUhodW9vSTBFYmlC?=
 =?utf-8?B?cWxGSGt1TDlzRHZJRlQ1VlJ1TnRDdy9lclYrU2NnWG0yUDBPVjNpS2p4TWI1?=
 =?utf-8?B?UUl5enVVTHJyMFUzVU9ZdnV5Z0FrZS9EZ1BpL2NoRG4xYnZSRG83Mk4rUmxu?=
 =?utf-8?B?amRHRm5PeDVFUUZacGZuTFRUKzZDZ0grWkNoRDhzazBzZUt5bUV3NkxYdysr?=
 =?utf-8?B?dEdvVmlzaFpOZHVuNmViSmdmK0FGUjM2bUZjL09DS2xYT1FlN3d6ZG9qeUdo?=
 =?utf-8?B?RHZLV1lYUGJWaDlKb3kvUVZzbkYvNENEeW5IM3R2bmtCUkZqd0EyY0YveGh3?=
 =?utf-8?B?OUxIcGtyWmhJWlowdmpuN1Q3eC9RbU53L3RKVTN3bFJWa3BPdjd4Q096R3J0?=
 =?utf-8?B?c3hncVpwQlZNWFJsZXJNYjgwV3lvM1FPZlMwNFZBQkQ5blFPbWV4dnNDRndT?=
 =?utf-8?B?dUtCbW50RjVtSDVUcWprR3NXcW9YdUtDSHcxMzF5MkNsay9JSGlTTGp4Tnhq?=
 =?utf-8?B?MGlsZ2QwVzEzOHZSSG5tL0xvVVIyckJ1TjdUUmVHVitZdVcyWjJFYmJ2YXVa?=
 =?utf-8?B?QTlFL1pnRkZmd25qd0ZsaWRNV1ZjT2Z2Wk1IYi9xOFJ4VEpCWElZTUFubmti?=
 =?utf-8?B?UGptL1VWMDlIQTRXb2VJQlpJM040N21YTjhuU28zVVhvOUtIRWxvbThFeVBy?=
 =?utf-8?B?NHpQVG1tZHMwSUxqRWcycXJmTFl1WEFKOUtEOThEL28rMHJIZVJhMzI3Q2pJ?=
 =?utf-8?B?UE5CRnJsK0NkR1RUKzVTYTNnSHdUL0RrMzlNaWFIOExEMUc0dnU2Rmt5bWx2?=
 =?utf-8?B?TFZYL1dyV21TVE5MM09DRVUvSmVmNkVPSlpBYWZDM3pENXQyZFhISk52eXdB?=
 =?utf-8?B?UjZ0NkVMb0M3ZzZYUThhVnlzV2NuS0tnR0VzOTVmOXVGdzdlWlIzYUpZZW5Z?=
 =?utf-8?B?cmE3aFhKRHhPTlZXaHRtUDdIbDIwa1c4enlHaXVsQzRoQkVoY2NDcy95dWpS?=
 =?utf-8?B?Ti9XNjFLcDdEUi91QlRSMmY3L1JaOVFUSURoeDlhY1VWQzlKc2xTTXRsMWt5?=
 =?utf-8?B?akFRMWN0OHFFSkt0OVJ2T0J1Y0pwVFNtU2RacWtvdDdCWVlTb3I1akh6YjR6?=
 =?utf-8?B?cWg4WGMweEtnUkoxMVYrOURacmU2RlpSeUp0TytDQUw2QmdTcmhkUTMxY2VF?=
 =?utf-8?B?em5yNGNmQVlUQVEzNGs0cHlYNW9iVW1VOWZvQ1BOZHh1UHpkVk4rdDlBa3VL?=
 =?utf-8?B?Rlp0SGhabzg3Z0M3Mk1xS0E2enNNNGlrNXVrWWFUYnV6ZThVQ252d2w1dG9I?=
 =?utf-8?Q?rQ71JzIpy2hkYkCIIv8LSf6e3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 590a02ab-14f7-4406-54f9-08dbe9e52405
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 16:24:16.5151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OhmwyVqVNG+3r9hLnWy2cuY/mhRp7S6YerrBOYLUJOm/1afg7Z3YCcCvaDr82Ig1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5452
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Luben Tuikov <luben.tuikov@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Phillip Susi <phill@thesusis.net>, Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 20.11.23 um 17:08 schrieb Alex Deucher:
> On Mon, Nov 20, 2023 at 10:57 AM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Am 19.11.23 um 07:47 schrieb Dave Airlie:
>>>> On 12.11.23 01:46, Phillip Susi wrote:
>>>>> I had been testing some things on a post 6.6-rc5 kernel for a week or
>>>>> two and then when I pulled to a post 6.6 release kernel, I found that
>>>>> system suspend was broken.  It seems that the radeon driver failed to
>>>>> suspend, leaving the display dead, the wayland display server hung, and
>>>>> the system still running.  I have been trying to bisect it for the last
>>>>> few days and have only been able to narrow it down to the following 3
>>>>> commits:
>>>>>
>>>>> There are only 'skip'ped commits left to test.
>>>>> The first bad commit could be any of:
>>>>> 56e449603f0ac580700621a356d35d5716a62ce5
>>>>> c07bf1636f0005f9eb7956404490672286ea59d3
>>>>> b70438004a14f4d0f9890b3297cd66248728546c
>>>>> We cannot bisect more!
>>>> Hmm, not a single reply from the amdgpu folks. Wondering how we can
>>>> encourage them to look into this.
>>>>
>>>> Phillip, reporting issues by mail should still work, but you might have
>>>> more luck here, as that's where the amdgpu afaics prefer to track bugs:
>>>> https://gitlab.freedesktop.org/drm/amd/-/issues
>>>>
>>>> When you file an issue there, please mention it here.
>>>>
>>>> Furthermore it might help if you could verify if 6.7-rc1 (or rc2, which
>>>> comes out later today) or 6.6.2-rc1 improve things.
>>> It would also be good to test if reverting any of these is possible or not.
>> Well none of the commits mentioned can affect radeon in any way. Radeon
>> simply doesn't use the scheduler.
>>
>> My suspicion is that the user is actually using amdgpu instead of
>> radeon. The switch potentially occurred accidentally, for example by
>> compiling amdgpu support for SI/CIK.
>>
>> Those amdgpu problems for older ASIC have already been worked on and
>> should be fixed by now.
> In this case it's a navi23 (so radeon in the marketing sense).

Thanks, couldn't find that in the mail thread.

In that case those are the already known problems with the scheduler 
changes, aren't they?

Christian.

>
> Alex
>
>> Regards,
>> Christian.
>>
>>> File the gitlab issue and we should poke amd a but more to take a look.
>>>
>>> Dave.

