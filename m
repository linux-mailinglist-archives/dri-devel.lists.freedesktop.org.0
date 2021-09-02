Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D44F3FEC95
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 13:00:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57E8E6E4D2;
	Thu,  2 Sep 2021 11:00:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2066.outbound.protection.outlook.com [40.107.223.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C8BF89D7C;
 Thu,  2 Sep 2021 11:00:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mD0gh2OlsRY1bBs39Lq3FGnnMmPocSDimeJkoVfpq7FD2BDAayx+sfhTaO2fzicnE/3UDuBoWZNfL4Gb5P2mMAG7/dY0dev8Fqepta44jKHDcqfcSUYbEjbYWLvGVcELXDfSJPfQAkWEveQ4yxqtXVGtP/9kAJSxmi4PwbValMPUPd7fnQq8tVAFRJIDn2y/3tjJjT0Z/k/cCBjfadsIw6eCYZLif+VkM3qXTChAlWIzGUbWFi7GvbM/EI0YZX6YkV0Q7A3FnSy00P1LQ9IDr9AqewvR4E4mDFpEjy14HY7BtbDtDjUuKoBRok9B7J61XxlhoqO3IkuqxXW6dMGeLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=59pKOF/gK7EGUGLvxMWiCnlo+8p5m/phv2RNIsqR4LI=;
 b=el9nkuR43TtXmBSPDNMIAzJqZQXneSU9fTWmnrqE5Y973yMdylbCTPCYWgZWJn1aNz9NdZNTykh9KiIT/H0ZiPqrzjCzzWbBppjWVhDPkwRSLO2VTae4fvzU1S+mxkaFcnxo6DKwjdV0xC3YZue4Oa9YKiSjxVykIxQEHXg1SoCIRVooXrkibADvuejxRuffL+0jHuaMUZVevwJ8jNPhEHxN2GYm79vmv5936vTeieNioXQoGQXLbunTxx0yRFjxbNntloOedOGmAgACQr4jK1bEVWxs+QvPOQt1F2P0ggbQLPnR1ub8O09vXsAEtir310YfdZr0CkvBl6HafdJSZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59pKOF/gK7EGUGLvxMWiCnlo+8p5m/phv2RNIsqR4LI=;
 b=VUy5oNlRzb5y6jIEK0mij+Q/ChbF0YtclbmA+M+lll/ZE09CT/ifUhtITUmQxn6KT7lCQrpmZrnpYiN2MUTtl1k1hlDTCOKk5e499KpTOTBSuypRqbRL7FP3g05Oh941qjttj2YDwnlFwio1qua+Fz6MTVLO8Dx+VsYPLvAjbmE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4405.namprd12.prod.outlook.com (2603:10b6:208:26d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Thu, 2 Sep
 2021 11:00:35 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4478.022; Thu, 2 Sep 2021
 11:00:35 +0000
Subject: Re: [diagnostic TDR mode patches] unify our solution
 opinions/suggestions in one thread
To: "Liu, Monk" <Monk.Liu@amd.com>, Dave Airlie <airlied@gmail.com>,
 Alex Deucher <alexdeucher@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "Chen, JingWen" <JingWen.Chen2@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <BL1PR12MB526942160701B46D4B28EEEC84CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <CAKMK7uHKX0rSVk_yBPo_KAEJ-UeLk5UxQ2kBdv+FD2j9zAjfZA@mail.gmail.com>
 <BL1PR12MB5269B303372A6251EDD1DC2C84CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <CADnq5_PUvgt9Cv2L3G4GGBJv_WBhtOp8DN+3WMvoES_80UMKfQ@mail.gmail.com>
 <CAPM=9tz-66nXR8gbMucsBo5Q1VJ5AsrVZh4pF0r0WfFi7CQtzg@mail.gmail.com>
 <BL1PR12MB5269F6B279EDE278C8FDF90A84CE9@BL1PR12MB5269.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <a1f2cfdf-e1af-e265-3d96-b8f5c47a0b84@amd.com>
Date: Thu, 2 Sep 2021 13:00:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <BL1PR12MB5269F6B279EDE278C8FDF90A84CE9@BL1PR12MB5269.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM9P195CA0008.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::13) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:eecb:a21b:e309:246]
 (2a02:908:1252:fb60:eecb:a21b:e309:246) by
 AM9P195CA0008.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 11:00:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38a8e66d-b35e-4de0-9764-08d96e00e3b9
X-MS-TrafficTypeDiagnostic: MN2PR12MB4405:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4405084106F9C1905857AB9D83CE9@MN2PR12MB4405.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dv5U0fCKrSLO2I6TR1lkwDwx85a/EkJHoYwUBmfQwNqZILN0YV09cKOUC3L/mt6LHJIga3UP7u+SZdQZElO1B6OMvcrvLgZgtALkm70ITj/uoFOCIUF/sYiwRnEHN5+bwvbUomgsZnjezF64asplI36h1/PtclkGvKZPrSpLLMcXwribU3vzNpd963Ugflu/RJF0CEgUQGDmwk83Y7BFTcYz1xWkTQe4VrTBDnkQ6A/Z4shDJj3p1tJTyIecpexhWCANqoDy5CPcxJXYAh/SawwYxg9p4xyEbwuv4uwtjlxSR7X9xIZHkfjEn5M9yutNEyVO3QE/p7GhoueVAF3qn+7wXcj5owAH03ZTylbmnCIEbjBXsConGwxUR3RpJD0GyJKdU/3fRuEVIPAJEExVnEs6Z5rd4bVsOkVqupsWZrQEmgOiOazg2+/nskVwI6nKpQwQ3wSbRVfBVNuwap4rgC8AEvTm6p1jsv0oX7iSFFj6ygcU33u/HojnQ3Kyu2l18KE8eYIxqKpTSy9FdYXKrM6nfb+1yNItRRZFtTkp5VnXFcy7YVaB8KsGtDKzDBkVmLxD49fDcNwzBihVE68SFuESU2Mtxls2NakZ0U50TzV/xQj4JahCrzTXgCgMDmMuc9LJUbRTIWYYxosWBvJdfM6rPCGuog99gFq4Q7G0weCKd5iFfNWjGgZAPAHKb+O2+PxnN18Q9scOMhWFMOaqFjv7k9TlRrhOGfM05LS75+GUkNrvhsUYOyCvAa/VPnQX7QcxlWAosVP1IP5+ClBjxtew8eC7+RBMr18OketCTWSkRMZ79L50QHwGM8lNRTQZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(396003)(376002)(366004)(136003)(31696002)(8676002)(86362001)(2616005)(6486002)(53546011)(66556008)(66476007)(66946007)(6666004)(186003)(36756003)(478600001)(31686004)(8936002)(45080400002)(54906003)(110136005)(316002)(83380400001)(966005)(5660300002)(4326008)(2906002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akRpbEZrckVkeFRBRWdRM0NtdURZVkp0Qm1oNjdXZDNETkdOdXhFYU16aW1P?=
 =?utf-8?B?OWtYU29ZbXlJNVRYSUlQM0lTK3RSZXNDdzlITVJhajNFc0ttMk9XeDZNT2Zk?=
 =?utf-8?B?SFlxWk5zMWxSWVRFa0orZWNkQUkzUlVJakdXcjJiSVNhMWh5V3UwR3BUaVhW?=
 =?utf-8?B?WldTUG00L2pGQ21ZUTY3NW8ybEw1Rklqbys0T3BZT3Q5bUJDM3FwZVdZWFUr?=
 =?utf-8?B?MmZmZlY2VTJWNFgxcmp6aVUwZVlDYTVHVzlLbk9hUlgyRWRmRVVjMEI0VElR?=
 =?utf-8?B?VGZ4NEJ1bTA0Y3BzY3A0Y0NDblpOaFptNVp6SDNSK2kyaUNndUoxb0xXZVVW?=
 =?utf-8?B?R3hUa0JZdTc1enhhZWQxWFQ4ZVZReVFjWVhPc01HeFQzNWM5SGcxVEJxejFS?=
 =?utf-8?B?bGM1a0NxSFJEM1ZadXRld0YrVXF0RTg3N1g2SXZpYUZjMkRzZ01sV2h1RmRU?=
 =?utf-8?B?c2tDYnVmZFYxMHArWGc0cWF1YXhCcUxEbFB2UldhdjRmQjFXY2xxUnZGakth?=
 =?utf-8?B?N0FiaUtQdW56dmszNHVON2Q2dTZ6QmdGMXhYK2V5VVRCTlRyUHB0dkZraFVR?=
 =?utf-8?B?bHlyZFFmRXgybldIMU5kZWNsaEhwY0p3SEs0Q0FjOHkwclpEYVd5blQ4cVYy?=
 =?utf-8?B?TlNoS0dzMVNkbFE4a0NlMGlWMms1eFU1YWM0NWlrVUg2U2lTZUZlQnh0QkU0?=
 =?utf-8?B?dmZLNmlweHNqWE53Q3NpM3BjL2IzM3h1QVdNTkp0ZFhDN0E2cno4RUlNL0JE?=
 =?utf-8?B?MEV1NEFveE54VXl5SEZjQTQ2L0NIN3ZtditoLzFmMXVxVTFFMEVEeWkzQ0dx?=
 =?utf-8?B?VGZGTWZUVFE5WFlkTUsxT1JzVlhHSFNEblp0MW53VVFYcDJodlo3dXFpd3Nw?=
 =?utf-8?B?Z09rWGdITzcyNGRWREsxZjVOb2dUTDBRY3o3cjlIL2FrSzE4UkRJMHV5bWFF?=
 =?utf-8?B?V3QzeFZXendmSE9ydklhSUp5ZXdUR2phVXBTNDc5SnlaZUlod0w2YkwvWVlm?=
 =?utf-8?B?RTlPZVN6cjROK0RVTW5tZXJTVU01eHc1Z0VuNkdJODYzU3gzbGlYYnl2bmFz?=
 =?utf-8?B?YWlSU0hNZWs0ZHNkYm13RnFIbGk3aTE5b1VaRk0vTW8vTnBSRjBhUUR4Y2t6?=
 =?utf-8?B?WklSZWtXVm16T2NBc1puckxDSmVtK3Vmbi9oNzQzQkhSTTVvQnpJbjNTNy8r?=
 =?utf-8?B?MUdsTExQa0tPZDBWdklRM1lybFhvUUNJa0txb05BS1l6SzlyOStRVDM0SENZ?=
 =?utf-8?B?L2FVQVAxemlVcE5lUVcwaFMzTlI0anFvUlpkQkZ3MVZmREdsNlc5Vnh1bWd3?=
 =?utf-8?B?YXh4N2dZUFZnNGFYZFNmdk1TK2xhRFNaOVNpT1E4ZjdlNUxDR3BrTzlsY1M4?=
 =?utf-8?B?L0JaTTdobEs0aURrQXNpbjhWSHd6RU9FQzh2Ky9uK1c4d0c3bEVlWW0xaGh0?=
 =?utf-8?B?RmIzbjdHQWI3VXNiMGJ2Z3RROTlBN1RNazlMZHgya0tkYzFOQU11K0swRHlG?=
 =?utf-8?B?NnBRQ3N5M0R3UGtXd3dxenlwUFVYLzhvbTBXZGprdlBwTWdteGMvaENidXBN?=
 =?utf-8?B?L2lqQWR0ZkxBeDBkNitVS2VMK3N5dTRKekVoMlhucGREbXZTQ1RKUGdSUGFW?=
 =?utf-8?B?NDBZYmdSdEJhK3Y1Z0RkTEdBZDA4UE1ycGZOV3FuK2pOdnpyMUJaQ01BL1Vm?=
 =?utf-8?B?M25PVlBoeTdURFZ3M1Avd2N0WS85VG5DR2l0U1VXSXhtbWNhQy9OM1ZqUTlI?=
 =?utf-8?B?YnFLdERjeVFEK2U3dmRmeVlBaUlpbDZpaGxwQzJURzMxNVdLbUNmQVc2YkFx?=
 =?utf-8?B?b3dmam9GcnE0NmdTRmZGcjRrdXBFSDVKRTVaOXBpY0xuN1BhRWlSWi9xM09W?=
 =?utf-8?Q?VstTOlpy8AC7e?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38a8e66d-b35e-4de0-9764-08d96e00e3b9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 11:00:35.1390 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k29XKG5xjoEKrjF5ySlbmzvDjqUMJFMGRfIg5XSoSRPRBR3xAa+OZLaKbMpjcPF2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4405
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

Hi Monk,

Am 02.09.21 um 07:52 schrieb Liu, Monk:
> [AMD Official Use Only]
>
> I'm not sure I can add much to help this along, I'm sure Alex has some internal training,
> Once your driver is upstream, it belongs to upstream, you can maintain it, but you no longer control it 100%, it's a tradeoff, it's not one companies always understand.
> Usually people are fine developing away internally, but once interaction with other parts of the kernel/subsystem is required they have the realisation that they needed to work upstream 6 months earlier.
> The best time to interact with upstream was 6 months ago, the second best time is now.
> <<<
>
> Daniel/AlexD
>
> I didn't mean your changes on AMD driver need my personal approval or review ... and  I'm totally already get used that our driver is not 100% under control by AMDers,
> but supposedly any one from community (including you) who tend to change AMD's driver need at least to get approvement from someone in AMD, e.g.: AlexD or Christian, doesn't that reasonable?

I'm fearing that just repeating what Alex said, but to make it clear 
once more: That is *not* necessary!

The shared repository is owned by upstream maintainers and they are 
usually free to do restructuring work without getting acknowledge from 
every single driver maintainer.

Anybody can of course technically object to upstream design decisions, 
but that means that you need to pay attention to the mailing lists in 
the first place.

> just like we need your approve if we try to modify DRM-sched, or need panfrost's approval if we need to change panfrost code ...
>
> by only CC AMD's engineers looks not quite properly, how do you know if your changes (on AMD code part) are conflicting with AMD's on-going internal features/refactoring or not ?

Well because AMD is supposed to work in public as much as possible and 
ask upstream before doing changes to the code base.

Additional to that design decisions are supposed to be discussed on the 
mailing list and *not* internally.

Regards,
Christian.

>
> Thanks
>
> ------------------------------------------
> Monk Liu | Cloud-GPU Core team
> ------------------------------------------
>
> -----Original Message-----
> From: Dave Airlie <airlied@gmail.com>
> Sent: Thursday, September 2, 2021 2:51 AM
> To: Alex Deucher <alexdeucher@gmail.com>
> Cc: Liu, Monk <Monk.Liu@amd.com>; Daniel Vetter <daniel@ffwll.ch>; Koenig, Christian <Christian.Koenig@amd.com>; Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; Chen, JingWen <JingWen.Chen2@amd.com>; DRI Development <dri-devel@lists.freedesktop.org>; amd-gfx@lists.freedesktop.org
> Subject: Re: [diagnostic TDR mode patches] unify our solution opinions/suggestions in one thread
>
> On Thu, 2 Sept 2021 at 01:20, Alex Deucher <alexdeucher@gmail.com> wrote:
>> On Wed, Sep 1, 2021 at 6:19 AM Liu, Monk <Monk.Liu@amd.com> wrote:
>>> [AMD Official Use Only]
>>>
>>> Daniel
>>>
>>>  From the link you share it looks you(or someone else) have quite a bunch patches that changes DRM_SCHED or even amdgpu, by that case before they are merged to kernel tree I'm wondering if any AMD develop reviewed them ?
>>>
>>> They looks to me somehow conflicting with what we changed in our repo....
>>>
>>> It is really a chaos for AMDer if someone else out side of AMD changes our kernel driver (or/and scheduler) without reviewed by AMDer, just like we are requiring your review if we tend to change scheduler's logic here ....
>>>
>>> This one changes AMD's code:
>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flo
>>> re.kernel.org%2Fdri-devel%2F20210625133327.2598825-2-boris.brezillon
>>> %40collabora.com%2F&amp;data=04%7C01%7CMonk.Liu%40amd.com%7C6c507d18
>>> d65341ef53bb08d96d7976e6%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%
>>> 7C637661190727875969%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJ
>>> QIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=BWJSkKN
>>> y2%2BwjxbQrfxGPzuJ5PBpBwB4aV0ZH6QoJGEg%3D&amp;reserved=0
>>> And I didn't see any reviewed-by from AMDers ...
>>>
>>> This one also touches AMD's code:
>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flo
>>> re.kernel.org%2Fdri-devel%2F20200604081224.863494-12-daniel.vetter%4
>>> 0ffwll.ch%2F&amp;data=04%7C01%7CMonk.Liu%40amd.com%7C6c507d18d65341e
>>> f53bb08d96d7976e6%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C63766
>>> 1190727885929%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2
>>> luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=%2F8vIVXCWjHkM
>>> 56pcYI9EvuzhbsZhV9WczkKaBJE67KQ%3D&amp;reserved=0
>>> Which is conflicting with one patch we submitted (in our repo
>>> rightnow), and neither see AMDder gave a review-by on this one (let
>>> me know if I missed it)
>>>
>> Monk, this is not how upstream works.  You need to participate.
>> That's how communities work.  There's a reason all these discussions
>> happen on public mailing lists.  The patch author can't be expected to
>> know every person on every vendor team to CC with a patch.  If you
>> have concerns, you need to raise them when the patches are being
>> discussed.
>>
> I'm not sure I can add much to help this along, I'm sure Alex has some internal training,
>
> Once your driver is upstream, it belongs to upstream, you can maintain it, but you no longer control it 100%, it's a tradeoff, it's not one companies always understand.
>
> Usually people are fine developing away internally, but once interaction with other parts of the kernel/subsystem is required they have the realisation that they needed to work upstream 6 months earlier.
>
> The best time to interact with upstream was 6 months ago, the second best time is now.
>
> Dave.

