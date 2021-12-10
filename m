Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C008A470D93
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 23:20:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08AEF10E29C;
	Fri, 10 Dec 2021 22:20:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2075.outbound.protection.outlook.com [40.107.244.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B7F510E27A;
 Fri, 10 Dec 2021 22:20:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mjb4wYI8rLx3BRh81hgMrd6A2eYrzxtI3d6c8hwHcmrF25Wdeu2YL63LS7tiJoQmKNHmQ4O2QIl2tFCejLQyEDhpWYU0U6ydw2q3mRPPtMmjjZhTrmOA4bskeCwcuyc3mjUHb1VQT25RzOpQNKg+Xf9rZ7MO0bP1SWUurFBcSyqPB1SFeUa3Udsj4ZOXwdewDINdyFivUdRptF5KH89x2uoeaYr5smatGb/Xs0d06zRl+gN8bS0kE4JvLXIoSqgX8w6Nbf9MW2Aq56yHUBDjvGuLJNNeU82RbSPcgTWHx/AOmLeOnNL3tSgneXJ6rino3BJc6AkV0R6EGLLor0VmcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AXv+0hjhI2VXDZqL2G55xyGctdCS4fzmi6SBmqPk6SQ=;
 b=dO/F39wWKqMckDEGAhlq3tO1tAf5Lbsos0xf44VyX2fTwR5PibD1bUwsh7E4M0iewuhOYa/aLkbqKeqKiJ1AGNre6K3Cc2XelTNHbT1xM88ruGK8TtrDzx1S6/9wxInjz38zlzFUc172g3vwXmAZ8QJ8P/XPwXsjVNt/Ns/WBDvubqOalyvNzbFXbSLoIqNlWm6mz9z12L3mCrQajpU8lh3bIHtk7av4GNLYMNF9MxvxMao3WnqCmK4SbVjNiVt3XRO7WunF9/FTZ9jYiSegsVbrLyCis8Lj0gqOgh3P7Fb+e8/Mp0dMcro3JRwFFRRWOYXYrQoyJ2ro6JAOnJy8rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AXv+0hjhI2VXDZqL2G55xyGctdCS4fzmi6SBmqPk6SQ=;
 b=2WgPapRldepMBjI3biOSscdKtlnVSca7LxzuGlzlQkqh73QkevR1iCCBwTVd+9rKv5dhfSpQCaWIOd72H1cdlbJvm5a6eGzIkBCs+r0HSbMW5DdwEoyDm934K8YdjWrpe0Y/VRYfuE2oq+hVF7EC0KmA2A5/2/QiNW3UebvJxME=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2896.namprd12.prod.outlook.com (2603:10b6:208:ab::22)
 by MN2PR12MB3005.namprd12.prod.outlook.com (2603:10b6:208:c5::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.14; Fri, 10 Dec
 2021 22:20:49 +0000
Received: from MN2PR12MB2896.namprd12.prod.outlook.com
 ([fe80::44f7:66fe:4419:d8d3]) by MN2PR12MB2896.namprd12.prod.outlook.com
 ([fe80::44f7:66fe:4419:d8d3%7]) with mapi id 15.20.4778.011; Fri, 10 Dec 2021
 22:20:49 +0000
Subject: Re: [PATCH v4 0/6] Expand display core documentation
To: Yann Dirson <ydirson@free.fr>, Harry Wentland <harry.wentland@amd.com>
References: <1142902978.47042257.1639083849979.JavaMail.root@zimbra39-e7>
From: Rodrigo Siqueira Jordao <rjordrigo@amd.com>
Message-ID: <9ddd7f26-5a0a-475d-d30a-a82eed3984df@amd.com>
Date: Fri, 10 Dec 2021 17:20:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <1142902978.47042257.1639083849979.JavaMail.root@zimbra39-e7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR12CA0006.namprd12.prod.outlook.com
 (2603:10b6:610:57::16) To MN2PR12MB2896.namprd12.prod.outlook.com
 (2603:10b6:208:ab::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 482baac3-3704-4839-7f1e-08d9bc2b51a6
X-MS-TrafficTypeDiagnostic: MN2PR12MB3005:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB300504A83183484E779805AE98719@MN2PR12MB3005.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pcSum0vabOYghDPhFpICKVtGBvJSWZnLTr/D5RrcZ90IMpvbXPVmfHCO/r0xLR+4gGRomu4kAOqufkdhKBYpEQecI6yk6B2v4aYOGEjHnOM4576cYKogu0BezZPy2odfZr7WZAQQ07ySofQ7LTvPGuC2dE8NTj6OFPfpxrvDv8lSgW+1CZofo4WTNQ31s17kNUBg4E5p639xSN79Cv1zUkiFzxA+5aaFRSBMERTulmw3bGX8Tg/NZJFyK2j5fyDxNogwahf2QZKbHrQdR/RtxWmKvmmYkcv/Et2IIWuygkiMCriJsWmlWIkrpJ5HabeUJzuIr2CtuC9xOTWjggFNBBqSE2n5c2Ah1bHL8/e5eAlvtIs88GTeGn+W4NZDQTUcDXE8iPYukNSSmCUKYvfnZsEBDMhOZBou1QB61c/9qL5WYlXQWH7xOwkAMNisfhfneqYdhC9vdg36y4oDSx8bQRazjRVB/RAUOsRkxMw4svY+JlR7zyHbe4QXxhdHzxtMNW+Qmp60m+R1SelMvdbqN4v0ao0vV1UgxqssvMGUjKYzOkxqJdAV4+ZTb9sRCbKUctv/B44hvQ8Lbp17HdpK0P77SiOvqhS9zuCIPkPrLVOUzpwT4OOnF/Z+rBuy0vDJAK0hFO0mXYcSwN/ssSyU8rrG0YTgf5oKQVc3Gd0y6Hn/Im/61+qo5nZGffhBxeWnLdG7N9iMC7uoFk65/+dJEXInn/iEiqffQoLH6KW/8POyyU8MDDNMLEL/gsqLsUdS7nbF6vX/t+IESovys2GoSQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2896.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(2906002)(83380400001)(6666004)(7416002)(2616005)(186003)(6512007)(31696002)(31686004)(38100700002)(36756003)(54906003)(8676002)(8936002)(66556008)(5660300002)(66476007)(66946007)(4326008)(508600001)(6636002)(53546011)(316002)(6506007)(110136005)(43740500002)(45980500001)(15866825006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGIvUlJUR3NHem9QRFhMbStnMjYxaHJJMXBzcWh4bXhINXVuMXlHWUVhTzhZ?=
 =?utf-8?B?Z21vU0M3KzNEYjNaUjFNNktCN1p5VURZM0h2bm5wSjRTeXk4N2dxdXJ5RzRO?=
 =?utf-8?B?K2xQZC9ReDJHU1dIeVBNeUcxMzJMbFNiS2RkV1lGSW5KVGVKditFSVEyT3Bx?=
 =?utf-8?B?M1dlcDNQWmRvRXhkOHJpTlh3emgvSHdCWlF5QjB2YzB5U2RGYlVHQXk0Q2FT?=
 =?utf-8?B?R2NnaVZrODl1Nkp4TktGN1FOblJOSjdyMHRKZXpORnZKOW10bjZMNVdIUXBU?=
 =?utf-8?B?UXlPOHlFeUpXZ3hrZHJoZWQ4WnY4MUJLT3dHTXpiM1ZuRnB4TmllNDhOTGdh?=
 =?utf-8?B?S2pFaGptWkdlVjRmRjEveGQrcXFLMjVkMzJqTmRZWllvczJLcWZKOVFMMHda?=
 =?utf-8?B?MGorNWVGRGIxZTNLWVZEZ0dCQ1ZUWWdaUkhXdW9GVWExSEpmbWFISXBtUDNh?=
 =?utf-8?B?UWlWdU50QVpFREp4MGNSTGM1NnpveGx2elMxc1cvWkFrRXNLOXplaEhQWThh?=
 =?utf-8?B?R0JHUldib294THpaN2htSmNlVkVVZURNWTRHM0Ztb3FPbXNJZ1IxajJSaElq?=
 =?utf-8?B?MlNDeFQ1M3lVaGxSbXVhaDNybmhQRStYS3dJbEV5VlhjRk9UVndEcDRRaERl?=
 =?utf-8?B?ZGh3cnpIcjAxVnlELzA0eVhEdnFZbVYwR2N0bzZIUEtGU2dheVRTa0JGVlNu?=
 =?utf-8?B?aEJ2S2JTdzlBSGRnZFR0T0lkU0dnb1lHQy9UUEhvemZXRDJSSVhxSnhjREJL?=
 =?utf-8?B?UjhhaHlvQnF3ZEJyTGVPL1RDbDRqWGIrNlkrQm9KenNnN2ZRbTNYdVlYTU9x?=
 =?utf-8?B?QURWcHVxcWFNWXZxQlErN2RsWDljUlpreVJaUGliT3RuajZvSkttRGdpZmRJ?=
 =?utf-8?B?dXRIeXA0SUJnRnJRTDZhQWg3MG5PUnlWZElTOGVZOUs2bHRNWGt1a0JFK05w?=
 =?utf-8?B?ZmZGWkJtNHcvTmt5THpHREFvaEJHbUNYK1FKV3IrYkdlYS92NFB6MW81bmpX?=
 =?utf-8?B?SExPS1JUMHFsN2oxb2I4eUhPdElaWDc0ckJnZy9SWDBHUmNLZGFFaE5wZCtP?=
 =?utf-8?B?dHo0bVExUzhZR0Q1MXJ3WWZ4VHlvYmRxNExUeVkvb01pYi9FUlNVNEZHZklP?=
 =?utf-8?B?YWEweTM1ZE1Ha2lEbUlMKzZBTlRocjdxUmRhbVF4TlVNZU9DSnZ4ZGtoSkNW?=
 =?utf-8?B?aFhkeUx5bE9HeTBvdWNXWEpDTkZOZk5vdEc3dU4yeFE0TGdpZVEvdWhZWnh5?=
 =?utf-8?B?NUJLR2VxOUhOQkZyT3FLTkwvalZ5ZmR4Y1ppSWkvTENFZm5udFg4UThIM01h?=
 =?utf-8?B?YmFsMzFLZlF1eVJhMDQ1U3h2Nm5TdGl6L1lEMWFyOTR5aUdFelM0cjlGc0Zn?=
 =?utf-8?B?ZENIRS9kSFpBTnNOY0pjbDhveXRNdGgwQ0puWnQrSDVmaFQ2b2lXV2xjOUN3?=
 =?utf-8?B?ZlFDei9zZEVKYzJadm5RekRRN21vTWxYR1VzcHl4OWt1QkFNdEIwNHhLUk5W?=
 =?utf-8?B?dlJlbDdwV3V3eEI1SEV6RWJyUUpsS1dWaS9PcE1zSXpHU0VDT3pqajhsZWwx?=
 =?utf-8?B?MkdtYzZaQU45dTF0d3JRN2E5blpWak9uRTgrNVoySThENnE2aUhhVE5pOHpq?=
 =?utf-8?B?VTV6eGd4eDhtVGpMcUtKaWtzSEE4TXd3NUFVQ1h0c2NsSmtDUFRSUFpqRjcw?=
 =?utf-8?B?dXQ3RWxkb3hSZ0RlaTVSbGx1WUE3UStyK0dhbEZCQ01hV0lFbTk2OHpYVFg4?=
 =?utf-8?B?cjNZTzBkYWpRcmtWcWhBTzlNS0FmbGgyS2lENExhb1hab2tiZ0l0d0l4TEY3?=
 =?utf-8?B?MGt3bm1SQi9KdHhNMm52c3Ziakh4QloyRlpUNnVMbHJkaGE2NEV0bjlwWTho?=
 =?utf-8?B?bExWOUlia1RmS2IxZUo1bEFNeUZmL1pEU1FiUHhPbmRFYlVkVTNLSlBxZkwz?=
 =?utf-8?B?ZkhBcjU5OCs2S2thYkFpaWVvR2VBMUtUQTdScmFPZ29iYksvM0x1ejZ0RGFs?=
 =?utf-8?B?VlJVZ1ZXUk5NZ2xTNXRYY0lCVW5yOHZLVzVSSVJsWUxwYStlR1c1WXllN1JS?=
 =?utf-8?B?MEs2T0E1Y2tKTksyKzNSU0F1TVo4cEJ4YjlramR3MklTMS84dTJDMkJYK2Z0?=
 =?utf-8?B?b1RSK3g3aFZ2dnpNOUF5Z0lkeVBNdGVCNlBXTTBydjVXdVFwRGl1SUNPaS9I?=
 =?utf-8?B?MmtCcUNlNUVZdXlsOHdvU2hPTUhRY2N1UGYrUGd5c1NaMlR1c0tjbHp2VlNM?=
 =?utf-8?Q?QBQjbMKOP/ne89Ky8+yndVayyEHpBVviVJOUxnchWw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 482baac3-3704-4839-7f1e-08d9bc2b51a6
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2896.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 22:20:49.2125 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jFWrkBx2FyJd2i9epSLMsqyFLXcPndugDBzxe4ullp2bgP2w5u85p0DvOyNZLLQL1etG8TqvdNjrxuDYSaLVpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3005
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
Cc: Mark Yacoub <markyacoub@chromium.org>, linux-doc@vger.kernel.org,
 qingqing zhuo <qingqing.zhuo@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, roman li <roman.li@amd.com>,
 amd-gfx@lists.freedesktop.org, Roman Gilg <subdiff@gmail.com>,
 Michel Daenzer <michel@daenzer.net>,
 aurabindo pillai <aurabindo.pillai@amd.com>,
 nicholas choi <nicholas.choi@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Sean Paul <seanpaul@chromium.org>,
 Marek Olsak <marek.olsak@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 bhawanpreet lakha <bhawanpreet.lakha@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-12-09 4:04 p.m., Yann Dirson wrote:
> 
>> Thanks for this. It's really good to see this.
>>
>> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> 
> Hearfully seconded, let's get this rolling :)
> 
> Reviewed-by: Yann Dirson <ydirson@free.fr>

Series applied to amd-staging-drm-next

Thanks a lot!

>>
>> Harry
>>
>> On 2021-12-09 09:20, Rodrigo Siqueira wrote:
>>> Display Core (DC) is one of the components under amdgpu, and it has
>>> multiple features directly related to the KMS API. Unfortunately,
>>> we
>>> don't have enough documentation about DC in the upstream, which
>>> makes
>>> the life of some external contributors a little bit more
>>> challenging.
>>> For these reasons, this patchset reworks part of the DC
>>> documentation
>>> and introduces a new set of details on how the display core works
>>> on DCN
>>> IP. Another improvement that this documentation effort tries to
>>> bring is
>>> making explicit some of our hardware-specific details to guide
>>> user-space developers better.
>>>
>>> In my view, it is easier to review this series if you apply it in
>>> your
>>> local kernel and build the HTML version (make htmldocs). I'm
>>> suggesting
>>> this approach because I added a few SVG diagrams that will be
>>> easier to
>>> see in the HTML version. If you cannot build the documentation, try
>>> to
>>> open the SVG images while reviewing the content. In summary, in
>>> this
>>> series, you will find:
>>>
>>> 1. Patch 1: Re-arrange of display core documentation. This is
>>>     preparation work for the other patches, but it is also a way to
>>>     expand
>>>     this documentation.
>>> 2. Patch 2 to 4: Document some common debug options related to
>>> display.
>>> 3. Patch 5: This patch provides an overview of how our display core
>>> next
>>>     works and a brief explanation of each component.
>>> 4. Patch 6: We use a lot of acronyms in our driver; for this
>>> reason, we
>>>     exposed a glossary with common terms used by display core.
>>>
>>> Please let us know what you think we can improve this series and
>>> what
>>> kind of content you want to see for the next series.
>>>
>>> Changes since V3:
>>>   - Add new acronyms to amdgpu glossary
>>>   - Add link between dc and amdgpu glossary
>>> Changes since V2:
>>>   - Add a comment about MMHUBBUB
>>> Changes since V1:
>>>   - Group amdgpu documentation together.
>>>   - Create index pages.
>>>   - Mirror display folder in the documentation.
>>>   - Divide glossary based on driver context.
>>>   - Make terms more consistent and update CPLIB
>>>   - Add new acronyms to the glossary
>>>
>>> Thanks
>>> Siqueira
>>>
>>> Rodrigo Siqueira (6):
>>>    Documentation/gpu: Reorganize DC documentation
>>>    Documentation/gpu: Document amdgpu_dm_visual_confirm debugfs
>>>    entry
>>>    Documentation/gpu: Document pipe split visual confirmation
>>>    Documentation/gpu: How to collect DTN log
>>>    Documentation/gpu: Add basic overview of DC pipeline
>>>    Documentation/gpu: Add amdgpu and dc glossary
>>>
>>>   Documentation/gpu/amdgpu-dc.rst               |   74 --
>>>   Documentation/gpu/amdgpu/amdgpu-glossary.rst  |   87 ++
>>>   .../gpu/amdgpu/display/config_example.svg     |  414 ++++++
>>>   Documentation/gpu/amdgpu/display/dc-debug.rst |   77 ++
>>>   .../gpu/amdgpu/display/dc-glossary.rst        |  237 ++++
>>>   .../amdgpu/display/dc_pipeline_overview.svg   | 1125
>>>   +++++++++++++++++
>>>   .../gpu/amdgpu/display/dcn-overview.rst       |  171 +++
>>>   .../gpu/amdgpu/display/display-manager.rst    |   42 +
>>>   .../gpu/amdgpu/display/global_sync_vblank.svg |  485 +++++++
>>>   Documentation/gpu/amdgpu/display/index.rst    |   29 +
>>>   .../gpu/{amdgpu.rst => amdgpu/index.rst}      |   25 +-
>>>   Documentation/gpu/drivers.rst                 |    3 +-
>>>   12 files changed, 2690 insertions(+), 79 deletions(-)
>>>   delete mode 100644 Documentation/gpu/amdgpu-dc.rst
>>>   create mode 100644 Documentation/gpu/amdgpu/amdgpu-glossary.rst
>>>   create mode 100644
>>>   Documentation/gpu/amdgpu/display/config_example.svg
>>>   create mode 100644 Documentation/gpu/amdgpu/display/dc-debug.rst
>>>   create mode 100644
>>>   Documentation/gpu/amdgpu/display/dc-glossary.rst
>>>   create mode 100644
>>>   Documentation/gpu/amdgpu/display/dc_pipeline_overview.svg
>>>   create mode 100644
>>>   Documentation/gpu/amdgpu/display/dcn-overview.rst
>>>   create mode 100644
>>>   Documentation/gpu/amdgpu/display/display-manager.rst
>>>   create mode 100644
>>>   Documentation/gpu/amdgpu/display/global_sync_vblank.svg
>>>   create mode 100644 Documentation/gpu/amdgpu/display/index.rst
>>>   rename Documentation/gpu/{amdgpu.rst => amdgpu/index.rst} (95%)
>>>
>>
>>

