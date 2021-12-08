Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D0146D752
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 16:46:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD6172D52;
	Wed,  8 Dec 2021 15:46:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA40C72D52;
 Wed,  8 Dec 2021 15:46:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=muRvRyIKQlnYZo6sdIaV+13sdl6eILzvqSkBE24xdsPJ2QT7NPZ9yWkjVACMrcZ6GbhAb5iaAlqW4GvBpxmgSWBHXvCVKhZDVgncYZ0UdbVe2UpuPXgUb32uIBIoubu/Yfwag+54MUl5dLUgqZDG3hEf/77eDJKAl8aR0Gs+UcgRTh47Hu8hGmyReLoApelahr0F4i233uvjFG1HN+ALe86+mDMJswFcfdia3Vr4t4rd/epZw+IpvD7PZC5TSsnu4ZrxHzAW6208hQRXyjMEm+zwurN/GsdceUGz9EE5cZLk3WGLuMGZ/yIjx/lBsR+0EXlkc8sInfoy4yECNpih4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qjp1rR1TV/7oJnnJRO+2HzB4WqZlD/DUOcZkpHs1UNA=;
 b=hw3tbSPa7sUCIwcS1eduAavyO5ow6TNsuCbHgfPxGRkHL5Gip9WGc21DrYb7rmmcCOgV25NpFJu0cvc0BjDiVEpX1hmGozLfKpSXYUJtaR6u5uQHiF+w4q198IqqjGKkD6SF9drdyhFhJ+dtQmP+YvkMCg//Yz5A03yxqQpaS+RNbWzI1s1ZI6vPauzjDEt3TiE9Y549uw1EJe/Zt0YrhIEYPKZUXAOTq0FXOHucWPqk+xSw0dOmIdKwufBQb4gKGEWoooYARr1PDbHwzPK/uyDQ2F1EgWnCkqVF/YQdvxHoKX5yByAYcEqdkZ0fxClI1CDXBRHyw362YXlAGc+IRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qjp1rR1TV/7oJnnJRO+2HzB4WqZlD/DUOcZkpHs1UNA=;
 b=GQnKK4/pPk4977HkJ3Prksl1iGfvhvn66q8LXl867dpxsbdreChRrdSLmFh7ooPzwYfz8oEF9/IG+LQu1GH4xannSunpcbUTzA2ttQmXINJ6p4j7eFrwzzS8u1NVHqeLrvSSU6t4w0xffQI46uLD6uY7UqdqN7h8WbKX3A3hv1U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2896.namprd12.prod.outlook.com (2603:10b6:208:ab::22)
 by MN2PR12MB3037.namprd12.prod.outlook.com (2603:10b6:208:c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Wed, 8 Dec
 2021 15:46:09 +0000
Received: from MN2PR12MB2896.namprd12.prod.outlook.com
 ([fe80::44f7:66fe:4419:d8d3]) by MN2PR12MB2896.namprd12.prod.outlook.com
 ([fe80::44f7:66fe:4419:d8d3%7]) with mapi id 15.20.4778.011; Wed, 8 Dec 2021
 15:46:09 +0000
Subject: Re: [PATCH v2 6/6] Documentation/gpu: Add amdgpu and dc glossary
To: Yann Dirson <ydirson@free.fr>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
References: <1907703259.37063142.1638906572289.JavaMail.root@zimbra39-e7>
From: Rodrigo Siqueira Jordao <rjordrigo@amd.com>
Message-ID: <10268a33-8441-5b95-743c-bc56017dc75d@amd.com>
Date: Wed, 8 Dec 2021 10:46:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <1907703259.37063142.1638906572289.JavaMail.root@zimbra39-e7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0241.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::6) To MN2PR12MB2896.namprd12.prod.outlook.com
 (2603:10b6:208:ab::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 345ca7e6-bb11-40d0-62ea-08d9ba61da87
X-MS-TrafficTypeDiagnostic: MN2PR12MB3037:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB3037C624EC24927A8B353AAD986F9@MN2PR12MB3037.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L5ZO3IWwW6SqEF5YNqpYlUaBcLdrvBm0kyeLAKk9q2MLuQENvxHhsNqGbeMiKy7ZhOC3UI0hoI+d/ApuIxLFxg0FZ1J1VhIeFrc9P7VqOufULCPl6+vUmFc8//k3Nt5YgtPwiu5M1PAY8lRMx6mrpwcfZo9I82VSOShG7BxPNIbLDpm9WYbpXItx4Ipmscf0LpkrHh6bBb8G4nFIiOdNT5ZX3s8l/KG3P5d10qUnXJ9Ppq5Ffj92wCR3FyaejUXkgnEI+Z5yutMU/HmPUt/RW5R4CuMfj6FDL6kS277nqqsT+vSgZ2vhSwWHYkD12qDhsu7LhnuX+9eeYA/nQXVGx/qikFcxqOX/gSbmJ9aia87LNo72QQx8l21OsAlnUCB/Eezj/y1pqVz+wcT3APr3AHvaqpcLEXoG9Ci5yZtOP1r+3AWV4lo45JbiQH8yPXm/0H8ZHC9HwKic65tQ+ZqC/6/M7ZZsR4Bumcr7J7lkexM0tSvwp39/lTZUPrEdbHTeHazzxBlYC6yRgXujYJGpiA4DYn2pUET9rj44ieDu1POqRHYN+lSWWItJorMkIx7XBBRbaWfninRPhmoh2Qjb2c/ys7MKGBZITlsy+OwXINR6T+y6L+uMW83qpLoYMhAjHPrns79+iNmo2hXbwc8Lq1bNE3Zk0lmow77eNHB2n4EJNXsQ4hr6UaEbJuTouGwBKqoh3raMS93zVnljrKlg4mNckAlDCdmCouwXRUfuJdlVuZR3eqq1zKYB5u1/V8mr9wK+EFYSWUx5ExfROdhJeYWII1q4euF6KqewpH3JS0KAO/ErORrbIZMSs/gkIWZX234EDlStGToLBYeXXLxZhQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2896.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6636002)(508600001)(83380400001)(316002)(6506007)(53546011)(7416002)(4326008)(6666004)(31686004)(66476007)(66556008)(54906003)(110136005)(5660300002)(66946007)(6512007)(2616005)(8936002)(186003)(31696002)(966005)(6486002)(36756003)(8676002)(38100700002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHJqZkN0TWM4MTBURnZod1dieXNaWDk5MVJVb3Z4dGV0aWpuSW5LMmJTczZI?=
 =?utf-8?B?Um14RzRQNDVFb3JYMzVWNkx5Z0ZlbWlJMHJBck0yc2xtUSt2azhnNWU1QTcy?=
 =?utf-8?B?R0ZGK1BxMVkzaHF4NmY3T1NHTS9tbnNhZ2JSRk1oWlcxOTFsKzV1S1RWVzEx?=
 =?utf-8?B?dUUyWnJWelV1STYvajM0SWgwaENNV01sV2k1UzhlMEZublNrSERoS09IWGYw?=
 =?utf-8?B?eXF0YnE3MUtmMUdxam9NZGJ2ZzBLb3BSR3NLbFpicDg4amhCNzZlYVhWeW12?=
 =?utf-8?B?Qkd5WVBCMnJSZzNISzF1RGJSWXFoYStRanRLbmx5dXlMUVM5L2ltREVSazRZ?=
 =?utf-8?B?STRUNm5IMnhZMGIvUnlQNFVHZE1DeWpOQVhwRFlFNmtBWDBGMzY3bHJ0N0Q3?=
 =?utf-8?B?VTNiSHF5N3U0Y3Z2UzdVMXEvcFdobFBZYU5KMEdOazFaWWdpRmlNcGxveXpG?=
 =?utf-8?B?VWcyMnR3SCttb0lkUDVOQ2FEaGlaYXFIamU4TTEycXMrNWVvdGdOTzBDVzNP?=
 =?utf-8?B?S0xoampQVHpZSXA5OVZaVmFIR1UxTVBKUGQvWnpEenZUYWszM1ZZTmc4YktW?=
 =?utf-8?B?YWIvbXpJSWtmRk5OK3daMlNJSXFRcURoclJKclBka1hxdVhGVTFLTEZSazc5?=
 =?utf-8?B?U21LTHU0MWFFMEpraERRSlkyLzN3Mk14bHVXUy80OFNibmlqOUc5aUcybGth?=
 =?utf-8?B?MjJwMlBMcXZEcVZIb2p0VHZ4N0FGOERnc1owWUNUTG9DeVZINTJwQlZYdVJN?=
 =?utf-8?B?YTFkQnFGdVcwV1J3dXBEVlNFNk1RL0lpaDhURmZJY0xyRzBJUGlsSXBkN2gv?=
 =?utf-8?B?enREMEc3b0luZlMyTGpkRGJMTzlxSDBoby9Ba0lxZ3FwQXdzVE5WQTR3MmxS?=
 =?utf-8?B?MkFYSnlMMVlNRTB3TzVvdkFwSXh0UTdIaldZN0pyVWo1MCtnSlgxbjkwT0pN?=
 =?utf-8?B?bTMxdzdYczNHTGNlR0hLTUxxQ0RnYWIwSEl6b1NIVTFNcTVyN3QyLzJvZWVB?=
 =?utf-8?B?Smp2KzJ4VVRQcHY4dUVQWDZDYjg3UlM1cDZpMzY4YVJXS2NuQmJqUnBUUmdT?=
 =?utf-8?B?ajVzeTNuRXlsazk4dTVWaWk3SWk4anZWRXdpeEJzRmdPYWx3YXpqaTBWM2Q4?=
 =?utf-8?B?SmNrVFM2cXg3MWFERGRFNXVKYWRTdE5MWmVQRk9ONmg0VFBxSGQ4Z0ZyT2Ft?=
 =?utf-8?B?WG4zVUFFRXdnMXNRYUNES09haVQ2VlY1OUo0UGkyZkRlemN2R0s4ZUdHVlkv?=
 =?utf-8?B?NjlacFB3SVR5dGdtTEh2dUFBVXQ3RVd5Q01pT01IcU50YkVNbmZDTGZwTDlZ?=
 =?utf-8?B?Q0RhMVZLTXpnRnJQUzJFSVZJZXBvZm5BSU1tQmpuMVcwajdkdEUyZHIxU2M1?=
 =?utf-8?B?V01wNW9JZkEycVFlY09sc2RTa3RpaEFHZ1k4R0w0QXpHb3pqL0hMd2phRHNY?=
 =?utf-8?B?bGI0MzJ1V0hWZFNjNy9qZktTMWNaTUhQZlZrY3hlOEJnM2tEb1lTalBzT2hQ?=
 =?utf-8?B?TUVIdXFFSEJkdVZRNHNwWUJLbUdCbkY5bGsrd1REc0VEYkZrTXhtNHNxb25T?=
 =?utf-8?B?QnZScDBYcnkxdWVrVnFpWE5Hc2RGclF1UVdFOUdGbXQzTENkU1A0Mk45RHNv?=
 =?utf-8?B?SDhlSEZkaS8yQ3BWSncvWktBK3ZVRzh6Rks3NzJ0d0xYRm1pWXVXUVVSaEVO?=
 =?utf-8?B?U0UxQWlVMi8xT2krZ0djYUMvckdzS2NmMFNJWFdtQTVIZmNSMUlqRnU3VklX?=
 =?utf-8?B?QmpUdHhSQkMxWFgySE84K1ZmN0pQck12cGtnN3B0c3ZlMldoZXJGRkR6dXI2?=
 =?utf-8?B?QldlaFJWVWZpMEFvQ1FnRmJwa3oxVzhvMDBiYUxFNk4rZjl6Smc0dElDQkdK?=
 =?utf-8?B?WW1zNDROS2hLV29IMlRUYVh6VmdBa0FnaXVaMkErU1VCZmFjcGpjQkt4L1Ft?=
 =?utf-8?B?Q0llVSt5bUZnUjR2cnhhZlF3WlRuQUVlWnhjVzF6MlZjdVBaM0VRdUdudUFJ?=
 =?utf-8?B?bllGTDhtbkQrUHRLVFFGc1Z1SlZtdXVaUUNORFpNWkd5V1ZCNXpiTlJlR0Z4?=
 =?utf-8?B?eFJKbnpveEtDcEUrRHJpTGxaM2t5bHE5S0l4VjNBeUFrY0pIczkwNHUySU10?=
 =?utf-8?B?cERqUEVrUUlYUjdlUDJuWkdWR0h3dUNqbGxMVXovMjdLTXN5eVdMMTdKOWxx?=
 =?utf-8?B?UE5PNnhySzRoVW9SME1HQ0gyTmJlL1czTWlDSmgvQlJJYjdwcmNleDdHbDhu?=
 =?utf-8?Q?xrsRUWYPcWwMi2DU94spp+1BgoCZOZhI2ho+7QzMEo=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 345ca7e6-bb11-40d0-62ea-08d9ba61da87
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2896.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2021 15:46:09.3154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CBAXjnth0RTRrpt8PcFr5OkYw+6WqFm+HqjvgW/Qn+KL4faLTsMTIOIHU+b+c87JrEdj0RyGwRX1vbFaW94Vug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3037
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
Cc: Mark Yacoub <markyacoub@chromium.org>,
 bhawanpreet lakha <bhawanpreet.lakha@amd.com>,
 nicholas choi <nicholas.choi@amd.com>, linux-doc@vger.kernel.org,
 Michel Daenzer <michel@daenzer.net>, roman li <roman.li@amd.com>,
 amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Marek Olsak <marek.olsak@amd.com>, aurabindo pillai <aurabindo.pillai@amd.com>,
 Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 qingqing zhuo <qingqing.zhuo@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, Roman Gilg <subdiff@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-12-07 2:49 p.m., Yann Dirson wrote:
> 
>> On Thu, Dec 02, 2021 at 11:01:32AM -0500, Rodrigo Siqueira wrote:
>>> In the DC driver, we have multiple acronyms that are not obvious
>>> most of
>>> the time; the same idea is valid for amdgpu. This commit introduces
>>> a DC
>>> and amdgpu glossary in order to make it easier to navigate through
>>> our
>>> driver.
>>>
>>> Changes since V1:
>>>   - Yann: Divide glossary based on driver context.
>>>   - Alex: Make terms more consistent and update CPLIB
>>>   - Add new acronyms to the glossary
> 
> If you're rerolling, it could be a good time to include the additional
> (and detailed) entries from Alex's answer to "Looking for clarifications
> around gfx/kcq/kiq".  Finding a way to fit the other details not
> fitting directly in the glossary will likely take more rounds, though,
> so we can wait for the first round to be merged before dealing with them.

Hi Yann,

I will send another version to address Daniel's comment, and I'll also 
expand the amdgpu acronyms glossary based on your mail thread with Alex. 
However, I don't want to add more details about that discussion in this 
series because I don't want to lose focus in this patchset since my main 
goal is to start to expand display documentation.

By the way, I think you could consider writing a kernel-doc based on 
your discussion with Alex. This way, you can try to consolidate what you 
discover and get reviews in the content.

Thanks
Siqueira

> 
> 
>>>
>>> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>>> ---
>>>   Documentation/gpu/amdgpu/amdgpu-glossary.rst  |  47 ++++
>>>   .../gpu/amdgpu/display/dc-glossary.rst        | 243
>>>   ++++++++++++++++++
>>>   Documentation/gpu/amdgpu/display/index.rst    |   1 +
>>>   Documentation/gpu/amdgpu/index.rst            |   7 +
>>>   4 files changed, 298 insertions(+)
>>>   create mode 100644 Documentation/gpu/amdgpu/amdgpu-glossary.rst
>>>   create mode 100644
>>>   Documentation/gpu/amdgpu/display/dc-glossary.rst
>>>
>>> diff --git a/Documentation/gpu/amdgpu/amdgpu-glossary.rst
>>> b/Documentation/gpu/amdgpu/amdgpu-glossary.rst
>>> new file mode 100644
>>> index 000000000000..e635851025e7
>>> --- /dev/null
>>> +++ b/Documentation/gpu/amdgpu/amdgpu-glossary.rst
>>> @@ -0,0 +1,47 @@
>>> +===============
>>> +AMDGPU Glossary
>>> +===============
>>> +
>>> +Here you can find some generic acronyms used in the amdgpu driver.
>>> Notice that
>>> +we have a dedicated glossary for Display Core.
>>
>> Maybe add a link to that here so it's easier to find? sphinx
>> autogenerates
>> header targets so pretty easy (if the heading is unique at least).
>> -Daniel
>>
>>> +
>>> +.. glossary::
>>> +
>>> +    CPLIB
>>> +      Content Protection Library
>>> +
>>> +    DFS
>>> +      Digital Frequency Synthesizer
>>> +
>>> +    ECP
>>> +      Enhanced Content Protection
>>> +
>>> +    EOP
>>> +      End Of Pipe/Pipeline
>>> +
>>> +    HQD
>>> +      Hardware Queue Descriptor
>>> +
>>> +    KCQ
>>> +      Kernel Compute Queue
>>> +
>>> +    KGQ
>>> +      Kernel Graphics Queue
>>> +
>>> +    KIQ
>>> +      Kernel Interface Queue
>>> +
>>> +    MQD
>>> +      Memory Queue Descriptor
>>> +
>>> +    PPLib
>>> +      PowerPlay Library - PowerPlay is the power management
>>> component.
>>> +
>>> +    SMU
>>> +      System Management Unit
>>> +
>>> +    VCE
>>> +      Video Compression Engine
>>> +
>>> +    VCN
>>> +      Video Codec Next
>>> diff --git a/Documentation/gpu/amdgpu/display/dc-glossary.rst
>>> b/Documentation/gpu/amdgpu/display/dc-glossary.rst
>>> new file mode 100644
>>> index 000000000000..547c0bfbb3e2
>>> --- /dev/null
>>> +++ b/Documentation/gpu/amdgpu/display/dc-glossary.rst
>>> @@ -0,0 +1,243 @@
>>> +===========
>>> +DC Glossary
>>> +===========
>>> +
>>> +On this page, we try to keep track of acronyms related to the
>>> display
>>> +component. If you do not find what you are looking for, look at
>>> the amdgpu
>>> +glossary; if you cannot find it anywhere, consider asking in the
>>> amdgfx and
>>> +update this page.
>>> +
>>> +.. glossary::
>>> +
>>> +    ABM
>>> +      Adaptive Backlight Modulation
>>> +
>>> +    APU
>>> +      Accelerated Processing Unit
>>> +
>>> +    ASIC
>>> +      Application-Specific Integrated Circuit
>>> +
>>> +    ASSR
>>> +      Alternate Scrambler Seed Reset
>>> +
>>> +    AZ
>>> +      Azalia (HD audio DMA engine)
>>> +
>>> +    BPC
>>> +      Bits Per Colour/Component
>>> +
>>> +    BPP
>>> +      Bits Per Pixel
>>> +
>>> +    Clocks
>>> +      * PCLK: Pixel Clock
>>> +      * SYMCLK: Symbol Clock
>>> +      * SOCCLK: GPU Engine Clock
>>> +      * DISPCLK: Display Clock
>>> +      * DPPCLK: DPP Clock
>>> +      * DCFCLK: Display Controller Fabric Clock
>>> +      * REFCLK: Real Time Reference Clock
>>> +      * PPLL: Pixel PLL
>>> +      * FCLK: Fabric Clock
>>> +      * MCLK: Memory Clock
>>> +
>>> +    CRC
>>> +      Cyclic Redundancy Check
>>> +
>>> +    CRTC
>>> +      Cathode Ray Tube Controller - commonly called "Controller" -
>>> Generates
>>> +      raw stream of pixels, clocked at pixel clock
>>> +
>>> +    CVT
>>> +      Coordinated Video Timings
>>> +
>>> +    DAL
>>> +      Display Abstraction layer
>>> +
>>> +    DC (Software)
>>> +      Display Core
>>> +
>>> +    DC (Hardware)
>>> +      Display Controller
>>> +
>>> +    DCC
>>> +      Delta Colour Compression
>>> +
>>> +    DCE
>>> +      Display Controller Engine
>>> +
>>> +    DCHUB
>>> +      Display Controller HUB
>>> +
>>> +    ARB
>>> +      Arbiter
>>> +
>>> +    VTG
>>> +      Vertical Timing Generator
>>> +
>>> +    DCN
>>> +      Display Core Next
>>> +
>>> +    DCCG
>>> +      Display Clock Generator block
>>> +
>>> +    DDC
>>> +      Display Data Channel
>>> +
>>> +    DIO
>>> +      Display IO
>>> +
>>> +    DPP
>>> +      Display Pipes and Planes
>>> +
>>> +    DSC
>>> +      Display Stream Compression (Reduce the amount of bits to
>>> represent pixel
>>> +      count while at the same pixel clock)
>>> +
>>> +    dGPU
>>> +      discrete GPU
>>> +
>>> +    DMIF
>>> +      Display Memory Interface
>>> +
>>> +    DML
>>> +      Display Mode Library
>>> +
>>> +    DMCU
>>> +      Display Micro-Controller Unit
>>> +
>>> +    DMCUB
>>> +      Display Micro-Controller Unit, version B
>>> +
>>> +    DPCD
>>> +      DisplayPort Configuration Data
>>> +
>>> +    DPM(S)
>>> +      Display Power Management (Signaling)
>>> +
>>> +    DRR
>>> +      Dynamic Refresh Rate
>>> +
>>> +    DWB
>>> +      Display Writeback
>>> +
>>> +    FB
>>> +      Frame Buffer
>>> +
>>> +    FBC
>>> +      Frame Buffer Compression
>>> +
>>> +    FEC
>>> +      Forward Error Correction
>>> +
>>> +    FRL
>>> +      Fixed Rate Link
>>> +
>>> +    GCO
>>> +      Graphical Controller Object
>>> +
>>> +    GMC
>>> +      Graphic Memory Controller
>>> +
>>> +    GSL
>>> +      Global Swap Lock
>>> +
>>> +    iGPU
>>> +      integrated GPU
>>> +
>>> +    IH
>>> +      Interrupt Handler
>>> +
>>> +    ISR
>>> +      Interrupt Service Request
>>> +
>>> +    ISV
>>> +      Independent Software Vendor
>>> +
>>> +    KMD
>>> +      Kernel Mode Driver
>>> +
>>> +    LB
>>> +      Line Buffer
>>> +
>>> +    LFC
>>> +      Low Framerate Compensation
>>> +
>>> +    LTTPR
>>> +      Link Training Tunable Phy Repeater
>>> +
>>> +    LUT
>>> +      Lookup Table
>>> +
>>> +    MALL
>>> +      Memory Access at Last Level
>>> +
>>> +    MC
>>> +      Memory Controller
>>> +
>>> +    MPC
>>> +      Multiple pipes and plane combine
>>> +
>>> +    MPO
>>> +      Multi Plane Overlay
>>> +
>>> +    MST
>>> +      Multi Stream Transport
>>> +
>>> +    NBP State
>>> +      Northbridge Power State
>>> +
>>> +    NBIO
>>> +      North Bridge Input/Output
>>> +
>>> +    ODM
>>> +      Output Data Mapping
>>> +
>>> +    OPM
>>> +      Output Protection Manager
>>> +
>>> +    OPP
>>> +      Output Plane Processor
>>> +
>>> +    OPTC
>>> +      Output Pipe Timing Combiner
>>> +
>>> +    OTG
>>> +      Output Timing Generator
>>> +
>>> +    PCON
>>> +      Power Controller
>>> +
>>> +    PGFSM
>>> +      Power Gate Finite State Machine
>>> +
>>> +    PSR
>>> +      Panel Self Refresh
>>> +
>>> +    SCL
>>> +      Scaler
>>> +
>>> +    SDP
>>> +      Scalable Data Port
>>> +
>>> +    SLS
>>> +      Single Large Surface
>>> +
>>> +    SST
>>> +      Single Stream Transport
>>> +
>>> +    TMDS
>>> +      Transition-Minimized Differential Signaling
>>> +
>>> +    TMZ
>>> +      Trusted Memory Zone
>>> +
>>> +    TTU
>>> +      Time to Underflow
>>> +
>>> +    VRR
>>> +      Variable Refresh Rate
>>> +
>>> +    UVD
>>> +      Unified Video Decoder
>>> diff --git a/Documentation/gpu/amdgpu/display/index.rst
>>> b/Documentation/gpu/amdgpu/display/index.rst
>>> index fe2ecad8df81..e23c752ee5f5 100644
>>> --- a/Documentation/gpu/amdgpu/display/index.rst
>>> +++ b/Documentation/gpu/amdgpu/display/index.rst
>>> @@ -26,3 +26,4 @@ table of content:
>>>      display-manager.rst
>>>      dc-debug.rst
>>>      dcn-overview.rst
>>> +   dc-glossary.rst
>>> diff --git a/Documentation/gpu/amdgpu/index.rst
>>> b/Documentation/gpu/amdgpu/index.rst
>>> index 5c8cbf514097..ff38c360b04e 100644
>>> --- a/Documentation/gpu/amdgpu/index.rst
>>> +++ b/Documentation/gpu/amdgpu/index.rst
>>> @@ -334,3 +334,10 @@ smartshift_bias
>>>   
>>>   .. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
>>>      :doc: smartshift_bias
>>> +
>>> +AMDGPU Glossary
>>> +===============
>>> +
>>> +.. toctree::
>>> +
>>> +   amdgpu-glossary.rst
>>> --
>>> 2.25.1
>>>
>>
>> --
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch/>>>

