Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DC570FF31
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 22:27:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2070910E690;
	Wed, 24 May 2023 20:27:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2071.outbound.protection.outlook.com [40.107.93.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA2B10E68B;
 Wed, 24 May 2023 20:27:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H1BTq4XK9UqG/WWjYkvz6rT56y0bQyW4fRBR/rIk9FcsJ4SNDbdxp8eus7QYtJVqZ40GCDQsDNIFfUtyTsh5Y7OSgNnPC9D5qCJfr5DnDBjT8DkFIWeHtYSyfHgHNvibZ+BxQEFJdcwZQnDDCudnFVaNqYS1wAx92yfsPfW2G9W9lc6wIXoyYWzIFCZG0EStOnl0CIaNAadaIAAMNBWYZs9RM358w2kzqAGw+PrNuKx7syhmjiyzkGIIVowSO9d/j7wh1t1NbdmO1WT2juAmI1zlsYgkhPnBLHXIt+k0kcoyC42Sk6XsaapL7tVf3H3sLn7zVPRuJvv5DFQ648AvpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7c5Zdty4k6iM03lX7a0bQfGtO1591xh9sKZRX6FWZtw=;
 b=bUCNdllESrcQDfFIewEdx7FxblbXfvb39j17c5dOwrYWoEntB6ncWU4avDYn0n2+fLQYGQ1XAh12IfXx8FpgGfbnS/3LegH0wtAhd5yEIP+2bV1aJm/WnQR5aIpE/6CuxwVHabS8YqBose391GRYJ329yjQJbkXxIQV1G8rdndBTrMjI+61TnJ4hxLvs6vwuWFG6Y6KlwMkfILYCcrRXSEu7Si8dbrRSEpAr8AcVrpzhTR13XT+t/2zpljnsKrpU7AX0kG+DAKGLgNAVvuUHDEbSGPDpxmPAAdYoL8rquVz/LygOmUhMgpZt8Qtqx9r7i5eV+3HksfOW0bfedP6DYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7c5Zdty4k6iM03lX7a0bQfGtO1591xh9sKZRX6FWZtw=;
 b=AAyvn3tqwBUFolzDXVH3ApVTSbQJm23bwPtBMHvmJHXLQX+eESqZMAAgzVbzF3qu4FtT/AUl6TYEIOKd1aDbQNG9rYT7U88r03jjLGZJUomI2zlAZJ7LevmWsflYBwwQVAnp7XgBqfVVmYrUASR2PLI2/dvq5KCSb72m+fXPoas=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 SA3PR12MB7832.namprd12.prod.outlook.com (2603:10b6:806:31f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 20:27:36 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1%7]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 20:27:36 +0000
Message-ID: <e26351ed-ba64-b7e1-5165-de40622e0d30@amd.com>
Date: Wed, 24 May 2023 16:27:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] drm/amd/display: enable more strict compile checks
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>,
 Felix Kuehling <felix.kuehling@amd.com>
References: <20230524191955.252212-1-hamza.mahfooz@amd.com>
 <CADnq5_Mz6aPFYGnr8J8C8UeTpbo7JDg+uvjqAxo7o4vmTGej2A@mail.gmail.com>
 <DM6PR12MB3996C4248CBC968A7B08341583419@DM6PR12MB3996.namprd12.prod.outlook.com>
 <BL1PR12MB589849F37FBE98A3A06A316185419@BL1PR12MB5898.namprd12.prod.outlook.com>
 <3fefc712-913a-a391-bc7b-c0c75eff1c3d@amd.com>
 <CADnq5_OdWbg6zKjPrRwd2QSDnHgFuThF+OQHM=tVWj-2ySCu_A@mail.gmail.com>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <CADnq5_OdWbg6zKjPrRwd2QSDnHgFuThF+OQHM=tVWj-2ySCu_A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0295.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6d::20) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|SA3PR12MB7832:EE_
X-MS-Office365-Filtering-Correlation-Id: f56a8d91-c284-43a3-2aa4-08db5c954f79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K+qVBqahh5u66EyxLtOjOWF37tSFdFh7hMHB6GhVPWqQmSKRPwIT++vL5f8AclonJC7DJ99TAOXx2yPjE7ORmt9H9KI4XNFIlHdxSTnqhttBhCB8h02825NHC9K48f4i3Uu515GP2IyzpBDOTY8uCjTg+J70t09UCkxg7Y3RFA+JwvA8eJpwvUx/PKCf5HaGkJmj5oYRK/iiiakocfmHYXJ8QL4pWK5AX8boe/4/KiZD1rXI0zDfMjSkt8aaCBKIO3npVCuAcLRo83jy7OEZOSVRKAUndSC3gYr2Gh+0lX02DIUCYAAklNIEYxJ04K7Ss/eki99BFvudFRxpvtZTICw+jlXAmoYUlPVTGfMZsvD2ONjurUN1jLfU47O1wC81NXTyJJAsFkdb2OwyYRJwg1L6YeAQM5eDbmwIRSWK9mIKX24FMwyIfrlHvDi6nymPbNX33grNOutikA9dybvKuFjxq0tTCj9RaYbpC+oLvPTUtElW3Vp8FXC9AIgJ+RBWtBYKcYdhE1zBaWEGrt9Szf3eb4fb3lb0gkbsHHen4rtGsgUolJaBsVimo0sWO9+nQsQB7JZdoo99zvrLW1h+4Yd8ATFZz7Np/LFcvLPwnF/v+0xVeweU/zZEm73tEYq0oKjQ4/9KMXoscct7B2BDjA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(346002)(366004)(136003)(39860400002)(451199021)(6666004)(110136005)(478600001)(83380400001)(2616005)(86362001)(31696002)(38100700002)(6512007)(36756003)(26005)(6506007)(186003)(53546011)(41300700001)(8936002)(316002)(31686004)(6486002)(5660300002)(2906002)(44832011)(54906003)(8676002)(66946007)(66556008)(66476007)(4326008)(6636002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTVwSEZmeFEzcFNFVTYzZjR2anZwRzhVakY2b0VNaVdaOVNGbWpJb1R2Wkw2?=
 =?utf-8?B?eUQzeXlnK0hNMm1yYnFQc1VCL041ZmdCSVNxSEZMU0gzTDZCcWticVZ6Zlh3?=
 =?utf-8?B?RVNCcEQvalpSYnNFSzVQWjRJa0NDaGRxbktuUWZxcmYvWnZub3piVUtMS2dZ?=
 =?utf-8?B?ZC9rUi9OSFRrSnlDNXRrZW4xSWl5OWxaa2FjZVZhU29adzZMdU9FUGdHU1A1?=
 =?utf-8?B?UWxjWWNYSCtvT3AvdU1FVExhM3hqWXNyODlqTU04T1BiQWphWDBiRUtLOXVI?=
 =?utf-8?B?R0R3bHRxSEZibmJYQmNNNjZuck9UNm03UEd5bXBuTGdFU3I2VGNVTVFYUFdT?=
 =?utf-8?B?VzBHQXZ1YXloRVo3d1JaTFdYaDMreHBLdDZmbHVhUmFUWlpaK3FCbGpNYW1R?=
 =?utf-8?B?azFhWlRZMExJU3FKaDFVMGEwVGJqNlJ2NEphdzE5aWE5aHlnN1JXQ1lYVFM2?=
 =?utf-8?B?UkFPemxpTDBEM1BnY2tCaXhBcEJFekh0a2RMQjJVWE5yY3FlRE4zUm1xU3Uy?=
 =?utf-8?B?Q3RZWDd3ZWoyRCs4N2M2cW5PREhNMHlhL3ByYkxGMW51SXNwWXUrN0Q1N1ZR?=
 =?utf-8?B?TWlXcnQvMVlpc3dPeTIzSGNISFJWZGM3MTV4ajJweUxSMDFPVWRyQ0FldHM2?=
 =?utf-8?B?RlVoK1BCazZJS2M3dkc2MzNPdDBHaUZlbVBUWVRDd0phc1lVdld2NCtjVGJX?=
 =?utf-8?B?WndqekM2OCtDbDhyUnhKUFhWanlHVDNGUkpJb2phb1ZQV242ckt2QmxNTDgy?=
 =?utf-8?B?WWpJQlhQOHlTOU5LWDhZZnFlN1UwNWJQZUpBRjRZdElIRUZRYllnSFRsNmd2?=
 =?utf-8?B?RndaNDlLS2Rtd09WTzBMM3pkSXFONGUrRFlVR1ZYcThhMkxSaDc4anFGOURZ?=
 =?utf-8?B?am9mYnBtbm12ZG5aaUdUNGhDUXg3UFZzcWxsWTE2TXdseVMyd0hQOWZiU2RC?=
 =?utf-8?B?NWQzcThqTHdvRVdJQ2R3T2xJTTAyeE9wSlkrUkFZdlNRZGd1NmEvTmpBRW5Y?=
 =?utf-8?B?SGJuNDhUVWZDcHpIYWJEaFdXSEF6dHJLZVJmK1BSM3l0NXBBSkcvMjdVSVVj?=
 =?utf-8?B?UVowRXduOWY1MUZMR25BWkhiQjI1ZGZWRVhYaG1QMzcxZ2lWZ25kVGdJaWNw?=
 =?utf-8?B?eTFiMGhvWDRiK2YzUnhzU3JyOUpCU2hKNE1lZkpVZnJrU2Rxd3YrbU1naXNX?=
 =?utf-8?B?M3pzMzIvbE9wU0dLc2RWZkhPWXhJU2VkaDZlQW1nMXRsOUd0RDlrLzY4UG1I?=
 =?utf-8?B?RDFyZFF4Z3ZnZmd3RXNOSGhTTzNwalhlNlpRQ0tNRlRZN0w0ZXpWc2txUU5R?=
 =?utf-8?B?QmlnWFBRR0gyK1crYU43VzlYTUpBeG9QbzJnVDVySEkyeC9ySHJoRmNKVzZ3?=
 =?utf-8?B?eXN6bTJZVkpTcUJoWkJkQjVENGIyOXloSkVWcS9MclpqeFlMZ3FscUt2YnM0?=
 =?utf-8?B?d2Y0c1lScEJUQXQ0M1c1SXNqbVgzcWxoOE9YZ2E3Nm05OTRrSXc2dHlLa294?=
 =?utf-8?B?S1VtUHhrdURGejlLR0pFU2dUZ3o2Ny9EeUdYSUNNdSs0UWdZTituTW9mV2N1?=
 =?utf-8?B?NzN4VHBDeGNPVXU5VTY3WUJLc2JVQTB4dU5BQ2xqcmpjeU5wYk1OM0VyVUhq?=
 =?utf-8?B?Qm9OQmdmQzFsdi9ndFZSVUNFVjlQbjlsY09OTnNUUXZtcmdPQUZhU1ZnSlV0?=
 =?utf-8?B?N3d4TTFrNGFIbVRZSjNjanAwOU8zeUg5YVJHU3VWZmVUOG9DZjdnOGUxSUZs?=
 =?utf-8?B?M2pxQkJ1NWdoUitMbWxRaHJKblVvTjRhZ1ZDeGxDZkhwWXcrZVFEL3l0b2w1?=
 =?utf-8?B?SDZlcWVzVGwzSGJoTWdFa29SM2I2ZXZaSFh3Mm8zUVQxM3JUZFdtTDBWS0M0?=
 =?utf-8?B?dTJCeXc3QjVyaXlvV2NLSCtWYmV0cGg3RzFML3hNdlZadmVEbVhRU2RVaUNv?=
 =?utf-8?B?eitpZ3R4V0d0amU3UXV0WDcrUnpQb3lkODFMQUt3RldONlFrNEZXbVpSQU1r?=
 =?utf-8?B?QkZsZVlVUTU3SU9FUCt5NE9BUXl4MFlPMk5rK1d0WGdLeU9NZDJwOGkyMDRm?=
 =?utf-8?B?R21QMVVLOEp6Si9RTzhndTBMdC90OXJXZ29wbXFTSi8rSDNxY0JjclZiaFVx?=
 =?utf-8?Q?n1rzqK7yG/nr0lnyzzRgYdj1U?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f56a8d91-c284-43a3-2aa4-08db5c954f79
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 20:27:35.8581 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t08ehKTEt3T9spON6fCn6980vD2lroDAn1GlIRiCBV2Z2S+m2yvZkes/VGoWHu1yr4K4lD2cCcXhYJChXAz+dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7832
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Kees Cook <keescook@chromium.org>, "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>,
 "Ho, Kenny" <Kenny.Ho@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Russell,
 Kent" <Kent.Russell@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+ Kees

On 5/24/23 15:50, Alex Deucher wrote:
> On Wed, May 24, 2023 at 3:46 PM Felix Kuehling <felix.kuehling@amd.com> wrote:
>>
>> Sure, I think we tried enabling warnings as errors before and had to
>> revert it because of weird compiler quirks or the variety of compiler
>> versions that need to be supported.
>>
>> Alex, are you planning to upstream this, or is this only to enforce more
>> internal discipline about not ignoring warnings?
> 
> I'd like to upstream it.  Upstream already has CONFIG_WERROR as a
> config option, but it's been problematic to enable in CI because of
> various breakages outside of the driver and in different compilers.
> That said, I don't know how much trouble enabling it will cause with
> various compilers in the wild.
> 
> Alex
> 
>>
>> Regards,
>>     Felix
>>
>>
>> On 2023-05-24 15:41, Russell, Kent wrote:
>>>
>>> [AMD Official Use Only - General]
>>>
>>>
>>> (Adding Felix in CC)
>>>
>>> I’m a fan of adding it to KFD as well. Felix, can you foresee any
>>> issues here?
>>>
>>> Kent
>>>
>>> *From:* amd-gfx <amd-gfx-bounces@lists.freedesktop.org> *On Behalf Of
>>> *Ho, Kenny
>>> *Sent:* Wednesday, May 24, 2023 3:23 PM
>>> *To:* Alex Deucher <alexdeucher@gmail.com>; Mahfooz, Hamza
>>> <Hamza.Mahfooz@amd.com>
>>> *Cc:* Li, Sun peng (Leo) <Sunpeng.Li@amd.com>; Wentland, Harry
>>> <Harry.Wentland@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; Siqueira,
>>> Rodrigo <Rodrigo.Siqueira@amd.com>; linux-kernel@vger.kernel.org;
>>> dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; Daniel
>>> Vetter <daniel@ffwll.ch>; Deucher, Alexander
>>> <Alexander.Deucher@amd.com>; David Airlie <airlied@gmail.com>; Koenig,
>>> Christian <Christian.Koenig@amd.com>
>>> *Subject:* Re: [PATCH v2] drm/amd/display: enable more strict compile
>>> checks
>>>
>>> [AMD Official Use Only - General]
>>>
>>> [AMD Official Use Only - General]
>>>
>>> (+ Felix)
>>>
>>> Should we do the same for other modules under amd (amdkfd)?  I was
>>> going to enable full kernel werror in the kconfig used by my CI but
>>> this is probably better.
>>>
>>> Kenny
>>>
>>> ------------------------------------------------------------------------
>>>
>>> *From:*Alex Deucher <alexdeucher@gmail.com>
>>> *Sent:* Wednesday, May 24, 2023 3:22 PM
>>> *To:* Mahfooz, Hamza <Hamza.Mahfooz@amd.com>
>>> *Cc:* amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>;
>>> Li, Sun peng (Leo) <Sunpeng.Li@amd.com>; Ho, Kenny <Kenny.Ho@amd.com>;
>>> Pan, Xinhui <Xinhui.Pan@amd.com>; Siqueira, Rodrigo
>>> <Rodrigo.Siqueira@amd.com>; linux-kernel@vger.kernel.org
>>> <linux-kernel@vger.kernel.org>; dri-devel@lists.freedesktop.org
>>> <dri-devel@lists.freedesktop.org>; Daniel Vetter <daniel@ffwll.ch>;
>>> Deucher, Alexander <Alexander.Deucher@amd.com>; David Airlie
>>> <airlied@gmail.com>; Wentland, Harry <Harry.Wentland@amd.com>; Koenig,
>>> Christian <Christian.Koenig@amd.com>
>>> *Subject:* Re: [PATCH v2] drm/amd/display: enable more strict compile
>>> checks
>>>
>>> On Wed, May 24, 2023 at 3:20 PM Hamza Mahfooz <hamza.mahfooz@amd.com>
>>> wrote:
>>>>
>>>> Currently, there are quite a number of issues that are quite easy for
>>>> the CI to catch, that slip through the cracks. Among them, there are
>>>> unused variable and indentation issues. Also, we should consider all
>>>> warnings to be compile errors, since the community will eventually end
>>>> up complaining about them. So, enable -Werror, -Wunused and
>>>> -Wmisleading-indentation for all kernel builds.
>>>>
>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>> Cc: Harry Wentland <harry.wentland@amd.com>
>>>> Cc: Kenny Ho <kenny.ho@amd.com>
>>>> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>>>> ---
>>>> v2: fix grammatical error
>>>> ---
>>>>   drivers/gpu/drm/amd/display/Makefile | 2 ++
>>>>   1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/display/Makefile
>>> b/drivers/gpu/drm/amd/display/Makefile
>>>> index 0d610cb376bb..3c44162ebe21 100644
>>>> --- a/drivers/gpu/drm/amd/display/Makefile
>>>> +++ b/drivers/gpu/drm/amd/display/Makefile
>>>> @@ -26,6 +26,8 @@
>>>>
>>>>   AMDDALPATH = $(RELATIVE_AMD_DISPLAY_PATH)
>>>>
>>>> +subdir-ccflags-y += -Werror -Wunused -Wmisleading-indentation
>>>> +
>>>
>>> Care to enable this for the rest of amdgpu as well?  Or send out an
>>> additional patch to do that?  Either way:
>>> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
>>>
>>> Alex
>>>
>>>>   subdir-ccflags-y += -I$(FULL_AMD_DISPLAY_PATH)/dc/inc/
>>>>   subdir-ccflags-y += -I$(FULL_AMD_DISPLAY_PATH)/dc/inc/hw
>>>>   subdir-ccflags-y += -I$(FULL_AMD_DISPLAY_PATH)/dc/clk_mgr
>>>> --
>>>> 2.40.1
>>>>
>>>
-- 
Hamza

