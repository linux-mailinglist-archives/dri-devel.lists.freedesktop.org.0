Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EC739DEC1
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 16:29:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE3666E891;
	Mon,  7 Jun 2021 14:29:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2059.outbound.protection.outlook.com [40.107.223.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B42E26E419;
 Mon,  7 Jun 2021 14:29:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BAeLAG/zMYdoqmZCkTBuZ+Y4UPjF1Gg6++OaiZDl4/MYqubAbcn7NnCkanHyI1wRTtA2r9SV1lkCOqKZzUvUn2oz98eVPyZ5BqPNIrdx9cCCgsObt6tNQOT55jRTFUtnsxbdhLpwAVfWyiIeR3bjEPP1RW8v3RzLMzQas4zoJ8P74Pq1gz7XAEd58WZAPRk+mA0s4/OgohO8Lz7DUEWU4yyUobLRDVvNhyy6GF9YQSONKncS9U1c7oR04jNpoK39DBkC20aIP85Pk7iYeX5VeV4s4Dq0kM5qpbDKCPnH2QDPlA4XP+cUlVRydxWyayfiJW2+rtIEsfTfwPI8zJFdXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJo5a792LkAuZYBGOExxtadqrRpqiETYS3/p5JyW3I0=;
 b=ht8QLrKHXjXAHcZQQyvI8IQsjl1iOVcW4wxWmowi+nudxqLHjtYszUgAKcFG93GDozR7LGBAj2rUo2pYzvsT484X5cQeVRYV9Iz/ZKNfI1bESpU2bxhYxlgmEcryhiPw2Koub/N9sqLDTSbRP8o7vwJh/AQEfhWEGpIau3qKRgbc6LtCohs3cEzjwqGrDJxPuz4ece+jPlCmdOMiHiLg5+DjxYRIIjgt2YQfy9C2vgYU/dKhFYxUFYIq9DoD1PNXCp02g3TajdtwcEdfdwAyDXwHv2tmbPuInSk4/ha2EKC0t2ToJclDWuckcx1Hz7/wGjamawk5YTgB3M3M3qEsyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJo5a792LkAuZYBGOExxtadqrRpqiETYS3/p5JyW3I0=;
 b=GqyCVMtsKTzYKkBQVywpZI49BRIDy4bxxnCRJ+B5EpjjUIvTj+PXxNTvOROznUpGft3rFzrDB2hswU/IzN4RA8nigz/wRogjFAlvRtUUqx/aMryf6obE7g8l5FPi7EChE+1yCT3UtZvyFyKXqdShyDjvI17vCqdahcFdlEVXWHU=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2813.namprd12.prod.outlook.com (2603:10b6:805:69::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.26; Mon, 7 Jun
 2021 14:29:19 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4195.024; Mon, 7 Jun 2021
 14:29:19 +0000
Subject: Re: [PATCH 0/7] libdrm tests for hot-unplug fe goature
To: Alex Deucher <alexdeucher@gmail.com>
References: <20210601201702.23316-1-andrey.grodzovsky@amd.com>
 <CADnq5_Nfs_j9XE1Siou2wGYuwd5cvTD1T7m9gFpS9z74D=AuAQ@mail.gmail.com>
 <SN6PR12MB46230F8575C786B53056FE79EA3C9@SN6PR12MB4623.namprd12.prod.outlook.com>
 <CADnq5_OHQ3Dtq3ZikvDPR=pSubSBq0pN_uRkXW8FaVcbr2pWAQ@mail.gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <48f25209-8832-33e0-cb2d-e47db0ecfe78@amd.com>
Date: Mon, 7 Jun 2021 10:29:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CADnq5_OHQ3Dtq3ZikvDPR=pSubSBq0pN_uRkXW8FaVcbr2pWAQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:de1b:fb9d:c48e:87bf]
X-ClientProxiedBy: YT1PR01CA0064.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::33) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:de1b:fb9d:c48e:87bf]
 (2607:fea8:3edf:49b0:de1b:fb9d:c48e:87bf) by
 YT1PR01CA0064.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.25 via Frontend Transport; Mon, 7 Jun 2021 14:29:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f1b4574-f168-456a-0301-08d929c0a297
X-MS-TrafficTypeDiagnostic: SN6PR12MB2813:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB281381B67C4C231B2694D5F7EA389@SN6PR12MB2813.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TJhRQxbULiwRG+08nun4cPbpXfeTvooWx/NrQXQgMUyfndjr8gx506VHDoVnZsrcgWGAeTdm7aAWpokG3A/CzgFGBogpE5SYIKNrApIZF40kjnzEBppBFkiuBE+s9aleUSmKiCYvNmLIWNDA7afNAvueqdSgbtiYoWNYOmOl5CKRm8qhckvTQSI5A/1D/wiztpUU55XWQRy3+NDCx/eJyfCH3GFjjGl3cuKONaDyQlTpYxALbkQqpR0PBp9QNBXq3kN+erylJ/Me4AgWNaVga8eHI+ZVbZwhUP8T40BYvZ5iku6OryD0gXhUpONm+zHZ8xqmYk5ENflnRCpx8FUb+IHdnIGCq5Qr9Ltkk5vo4bFUYE1otkGIdEZICIKKLh0cXjwYrm/SnxbMd+zRCANfa54m4Bt02GkndQGMID0Cu/R3KU9LlpyBrC4AjtMHOsg+qJBUodtAfDlpxemQBlNF8RxjjQrUYV8gspEyuMuLb47LVfkxWspIZcJPCqMKkE2u6HZyNHqCvqiAEoLelI7Tpa3VaI9b87UQflg1PiIXiCJ5L8hpdNw3xHchpZgAOyB3wQGw0hZ/wOfcj+DSCJsB/O1qih9b1E0aNJBDuNFkVzzNlLJmkUvgZKYj51RazoX58Sf0U8oh2i9Q2/NttuLmJ3dykLIjs+fiMuCATxl6iDCRlhJj5EQNOCQhLhK8p7UPGPpiiDjSCD0EefNjY4zGgnJKaWq7AFmjTUcTjUONpfM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(39850400004)(366004)(136003)(83380400001)(45080400002)(66574015)(8936002)(316002)(8676002)(54906003)(4326008)(2906002)(36756003)(186003)(38100700002)(6916009)(53546011)(2616005)(5660300002)(6486002)(31696002)(31686004)(66946007)(16526019)(66476007)(66556008)(52116002)(44832011)(86362001)(478600001)(966005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cXRuOTg3aXRXOXVjZ1M2SjBLTTJmc2lJZUZPTlVIU0RPQkVnOVNIb2R1RVp0?=
 =?utf-8?B?ekx1N1VaT2xyckp6YXc2NDVWTm9xeXIySWh3ZG9rT09kclJ6UTRFRzd5bHFU?=
 =?utf-8?B?SnFCeTFUNlZ0U213OWlDeXFuVE1mZ3Nkayt0UlMxWDlxY21FMFV3VUF5WWpz?=
 =?utf-8?B?Rkk5ZXJxTEtCNUYxck4vOUJvV2ZaR0dxZFV4UWcvWEFwa1BSMHRzYm1YVGVt?=
 =?utf-8?B?RUJhdzROR3hDQlNDZm5zN1cxRUk4blUyRnhhOVZwWWhvczZpSVdrQy9FWVdD?=
 =?utf-8?B?WjB2WDZFcm8zb2NDNHE3MktSVmpVN29UMUdrSGJMSGg5RUtnYmRyc3ZCRytR?=
 =?utf-8?B?T1BqVDc1MXpxZHludThPTjZVWHNXNnMxUS9aSUo0STlLakFGTFhyY0VyUnlq?=
 =?utf-8?B?cGQyQk1MbDd0eDdNck9VZXJlNTNUeU83K2Y1UjlHdmlzV0xueGZITzhSQnZM?=
 =?utf-8?B?d1JPWmhNclRjaHo4UFdOdkhJZ1JIZGE0b1YvaXQ2ekwyZll1b25xVnBIeTRD?=
 =?utf-8?B?a0gveUVLQlJ3Ty9HMURsQkVYaGtuMEtZd0xtYjd1NVpOMFBoZ3RYUXJXM3hv?=
 =?utf-8?B?NzFhak03emtkdkdldWRkaFBPcDN4UktoM2dYZDJXVm1razFSVHU5UWFLMUV2?=
 =?utf-8?B?UUNKVmVjUnMwTTE2a1AwZE1uVk94MGF1K1d5V3hXenVhMzNsVEhlZnltMEtK?=
 =?utf-8?B?a3RtU2FKT2N1ampsNnJCNFdoanNrTXc4RUpkdEFISlRmLzFmRUczZzluWWNI?=
 =?utf-8?B?QVNwWVlJMDgrQzlSZTB2ZXJPTVBuTGs5UjFQekxXOVl3bmhxQU9VTnBzUEdT?=
 =?utf-8?B?Q01SVFpuM0hmUFMyMzBQUFdFQkJZeE1HNCtLM2hOZXFLejlTVFBLUHlBS1p2?=
 =?utf-8?B?b3FnZjdEVDlpb0lUQW1YM3Y2cE9KN3N5MjBvSWFrRjRMZDlGdXJKNXFVOXdo?=
 =?utf-8?B?Y3M2NU1HUlBiL2FCQVo1RVE0Y3N5aUFvcERCbnBTcFhNYnBQR01MRzVTME01?=
 =?utf-8?B?VElqakNqWnNhcmZmOXlqNmFKbGVZbkF6MmdjcXJ3NVNFWE1DNHdsOW5Kc1Qx?=
 =?utf-8?B?Z3JTa3p0dVBscCtOSUlWQytSZkxabVlaZVcwanJBQ3ZUZzR0dmF0eXR3Uzdr?=
 =?utf-8?B?bTNTZ0lFTVd3MjROWXd2V3pTMnpma29MeHNOTFNHWWJ1SlZuMlBjRndOKzVa?=
 =?utf-8?B?Zys0MFRoVXhXOEd5cTAzNXpyMGw1YUozb2pZVEtINEFWdWdMN24yTlY4MjE4?=
 =?utf-8?B?QlVUdk5OYWtHMGs3eHpSZjN1Wk1saUVUcmZWSllsWG5CV3VJRU90c092dmxC?=
 =?utf-8?B?YW0vRWJiVVNRSU9oVmp4VTRXdnRrZ1gvcFZGUkFkRys3ZVArZW93dlB3ZjhZ?=
 =?utf-8?B?MUhtN0NBUXdqc3VoRDlHWGl4YkttRFBrbnJ0cHJydGF6TWxhME9ZZW16WjRz?=
 =?utf-8?B?VGduZGZyYWpGcnlKcUJvaG9CL05mRG41cGwyNFBNNTIzZVlCbEtXY0VPQmFZ?=
 =?utf-8?B?MndzT05ucnBkdHJ5WDlnSzQ1MXNubXBGbjlzYW8wRUt5YnZCZjMvT2JGODUw?=
 =?utf-8?B?R0xEcStxc2FZdjVhRHV2U0h0eCt2V25wVkxBMlBOekZCYS94YVZWZGFYUjJq?=
 =?utf-8?B?Z29DTGpuTW1WSWtlTG9ianRnQnV0ekJINVhLaWkyei9GSWN5clB6ejF0Rk05?=
 =?utf-8?B?WGp3VXArVzlocGtIYXpBaFNNeVBpZkVtcVFkK1YwQzNYcU12cnRHNkRqd29R?=
 =?utf-8?B?RXQyWm1Bb2Z5S2dSSTAyeWtySTdSZktMb3BpblB6NXhnVFE4b3EvZmxsNDdo?=
 =?utf-8?B?Mmc3QlFBN1FrYmhmQkFrME5NVENuSXl1L25TT1A3VUw4VVZSSFV2UlRKbUhs?=
 =?utf-8?Q?15DCGNEXKEB8u?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f1b4574-f168-456a-0301-08d929c0a297
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 14:29:19.0319 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iVVzfJTDwGdKvh6/yg9npGVdh+z0Kih7lwp8l1pAIL1v6+oakeoTdXvj3kJjo6aovkeocm1W6ucZgF+A41flpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2813
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey, MR created at 
https://gitlab.freedesktop.org/mesa/drm/-/merge_requests/172, please 
help review.

Andrey

On 2021-06-03 10:26 p.m., Alex Deucher wrote:
> Code review happens on gitlab now for libdrm.
>
> Alex
>
> On Thu, Jun 3, 2021 at 6:02 PM Grodzovsky, Andrey
> <Andrey.Grodzovsky@amd.com> wrote:
>> Is libdrm on gitlab ? I wasn't aware of this. I assumed code reviews still go through dri-devel.
>>
>> Andrey
>>
>> ________________________________
>> From: Alex Deucher <alexdeucher@gmail.com>
>> Sent: 03 June 2021 17:20
>> To: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
>> Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>; amd-gfx list <amd-gfx@lists.freedesktop.org>; Deucher, Alexander <Alexander.Deucher@amd.com>; Christian König <ckoenig.leichtzumerken@gmail.com>
>> Subject: Re: [PATCH 0/7] libdrm tests for hot-unplug feature
>>
>> Please open a gitlab MR for these.
>>
>> Alex
>>
>> On Tue, Jun 1, 2021 at 4:17 PM Andrey Grodzovsky
>> <andrey.grodzovsky@amd.com> wrote:
>>> Adding some tests to acompany the recently added hot-unplug
>>> feature. For now the test suite is disabled until the feature
>>> propagates from drm-misc-next to drm-next.
>>>
>>> Andrey Grodzovsky (7):
>>>    tests/amdgpu: Fix valgrind warning
>>>    xf86drm: Add function to retrieve char device path
>>>    test/amdgpu: Add helper functions for hot unplug
>>>    test/amdgpu/hotunplug: Add test suite for GPU unplug
>>>    test/amdgpu/hotunplug: Add basic test
>>>    tests/amdgpu/hotunplug: Add unplug with cs test.
>>>    tests/amdgpu/hotunplug: Add hotunplug with exported bo test
>>>
>>>   tests/amdgpu/amdgpu_test.c     |  42 +++-
>>>   tests/amdgpu/amdgpu_test.h     |  26 +++
>>>   tests/amdgpu/basic_tests.c     |   5 +-
>>>   tests/amdgpu/hotunplug_tests.c | 357 +++++++++++++++++++++++++++++++++
>>>   tests/amdgpu/meson.build       |   1 +
>>>   xf86drm.c                      |  23 +++
>>>   xf86drm.h                      |   1 +
>>>   7 files changed, 450 insertions(+), 5 deletions(-)
>>>   create mode 100644 tests/amdgpu/hotunplug_tests.c
>>>
>>> --
>>> 2.25.1
>>>
>>> _______________________________________________
>>> amd-gfx mailing list
>>> amd-gfx@lists.freedesktop.org
>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=04%7C01%7CAndrey.Grodzovsky%40amd.com%7C155b8cb8d6834e86275a08d927004117%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637583704326965590%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=AclAYkIS4xlE6cpmmaMyIo86gJ70Pk%2FkqJncGNAM3cw%3D&amp;reserved=0
