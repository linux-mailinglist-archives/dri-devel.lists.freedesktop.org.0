Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C7E3A193D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 17:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89ADE6E519;
	Wed,  9 Jun 2021 15:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2070.outbound.protection.outlook.com [40.107.236.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF1DD6E519;
 Wed,  9 Jun 2021 15:22:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jGGKIW6iF1bhEyQV+HXFII+mZf8BZq8G8plMWDQ/fV7X2ieDamoEBBEm0aA0SMw81FO7hY9ROPR67QL7/+mmtKdU0YYVRYm9OgrarsRZ3n6ylIuk5Gr2UkOw5aI32ZdMYqXZO100zQKfXLBXD0If7zMCWhToeGRXExdKd0F5uZOrOjQP2KH4glktJPIyB/eeux1+FfIhvLZowQBQw1lrN3l7yOwNZkNjh6rd46+JawIBwtDtQ1fSuZNhFiHLmG2OQymyC8NeDgNsBmr5P7RmYrHX/tHRThKko3hV/lJXyYCvtweYgYxR0HrRTJJUwxYvEJc5/RCnUfvPao1UBMBy/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPYo3SYryshXFR1+ZCxlT7E93wvokAIMWZIFKmFrRSY=;
 b=DtzTOrep3h4QbbW77UbqFyorfi0rUblLhfnY+VXZ55QbO6O6bck1Ri7qGu1tG3g4NENfo2HIhrLiCze4wuOPySe0LLbbNzuILt9J1rKib/68B2AU+U4YvwJiqVneqLDsg6qrrleqJwl3D4Xgy5S5qps35IrorQM0zuTGkBk/xlRmBQb+f9t4iX+w8HyaGgkhiBJ7lnc5xpHIZiDV0POHQdx5sck1jjPaVT6ttlEJzBp95GYsmxjiXGj+KRnrdpevRGw7sfDQYNyXWIz3ei8pCbXearqoMPtL073WuXo4hByxqXj93OfHLCHaiT+wNtBmXRf7iKcLoSNRRkEHHEE+iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPYo3SYryshXFR1+ZCxlT7E93wvokAIMWZIFKmFrRSY=;
 b=jkr0Lf5w5Q/gc1Dm1HozJbqsDZSg/XBZ0O2C6pRSG/qnefau8tbVt+udrb3lMO8KDi6w+tPHGlKeIJlaIminsIAZ5G7qB4SkzvdIqdruDNbmgd5/kjqZqrmEXSpry5gSb8AixAMCbW0aM4V/SGfPbHw9vD/CtyZ66bvijvPlPwI=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2451.namprd12.prod.outlook.com (2603:10b6:207:4e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Wed, 9 Jun
 2021 15:22:04 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4219.022; Wed, 9 Jun 2021
 15:22:04 +0000
Subject: Re: [Nouveau] Trouble with TTM patches w/nouveau in linux-next
To: Ilia Mirkin <imirkin@alum.mit.edu>
References: <2e4987b0-7fc9-d217-450c-943de430dbd1@kapsi.fi>
 <816b619b-ff20-009a-ea05-504497c1946b@amd.com>
 <CAKb7UvjrxXyvr9qpLbkoDQ2eScj4YdayP6OnG8rZnmEn1hyKvw@mail.gmail.com>
 <1c9bdd1b-abea-872c-e23a-8a0e1e777a02@amd.com>
 <CAKb7UvhX9mABdtOnq5Uu4zmKW6HLaJzfFakcXVB008U4hRsgng@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <367d42e1-eb7f-3dba-f33c-1fa0e555eebd@amd.com>
Date: Wed, 9 Jun 2021 17:21:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CAKb7UvhX9mABdtOnq5Uu4zmKW6HLaJzfFakcXVB008U4hRsgng@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:3e79:91ff:ea38:2624]
X-ClientProxiedBy: FR0P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::17) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:3e79:91ff:ea38:2624]
 (2a02:908:1252:fb60:3e79:91ff:ea38:2624) by
 FR0P281CA0053.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.12 via Frontend Transport; Wed, 9 Jun 2021 15:22:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6beec4c8-5cf8-4bdb-4f5f-08d92b5a55d1
X-MS-TrafficTypeDiagnostic: BL0PR12MB2451:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB245167985EE3A30BC084562883369@BL0PR12MB2451.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2GYEGohwZw5sI8SABgpFk8XNyF3qw3P2uOe+gHt3/buVmalWxNPZYF/KsXx3aJY2LIO8iczbJ+YOiQoaYyF/8xMN5W1BV9NALnAGgH0DplSqxsw0BASyPKuZB23UcNhK51p0NCP56T+EreZT3Ubw45ojE736C3g9HIe5/b2a+tw0HTkY67u49wSgjJdigNeaQU/+Ex8ALPlP21YYZHTewFUQ6nA3NJcw4rNMy1bgKuOJ9k90WGIpDwpt6+lhh2Fzkn5yyf6JxjX3bbiEcpmGpWXlN3Fdrcb8sTimkUyAdvjA+fDv6FJvHb9te3tnTUbI5kVQGR3tT/oLgATz1pAvoSSXtlkiTtFwh8inqSpdjkv+xcW89oRkNKoUFKdDuGvcP7R/LDBJbNZ0sE5ixWGInpx9P151CB/hP64BPU3BcY7fRfOu1tMO4Y0h8Exp4Xewirke4PLprY5/OyzRZpoqFmGdIsYn8+fOqDX6XVedpGvootuEFyS9Tw6VdJ6spdySgvW9RcbJKFdVzxr1NCatrxa4GUbAfIVrqecUryTgdoPzR2WK1VKT4EbsV+uW+qiwPwtWBbaBQg5BFNhqk++jSfvHEYfRzybzXECT6Hisugfyw70nF/bmvO/oqiJqU0vnkgZsxg6HY9lPGwHq28HUuG2Y+FmcYpxnzSAoe3F+8rfwGc6VDBbAO3MU5ZQagqOIFa9hh4oRhTCWCf5ncI+FXOeklVQtES7+hsWxEBycsc8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39860400002)(396003)(376002)(366004)(966005)(478600001)(31686004)(38100700002)(54906003)(45080400002)(5660300002)(53546011)(2906002)(6916009)(6666004)(8676002)(66476007)(4326008)(8936002)(2616005)(66556008)(66946007)(6486002)(83380400001)(16526019)(31696002)(186003)(86362001)(36756003)(66574015)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0U5VEtuQUNicHQzVWUzTVl3NG9VM2Uyamx2T1BhVnoyK2Y2K3QyMVFwMWkv?=
 =?utf-8?B?SHJORjBnNlpRNkdETlBBVE00TWJWZ3V2K2MzRDlDOERjUVZrTkkwQlMxSGRT?=
 =?utf-8?B?MzN4Z0kzWkt4SFFuSmYwcHhwbHY3S0VrN3U4dzFoRnRpYkdnK2R0dFFvSmUz?=
 =?utf-8?B?MnZXMDZ3TFA0Smd6cmszWXI1NzNrN1Z0ZVljc3N4RitsS1h1bXNZUFBnNnQx?=
 =?utf-8?B?Q0x4aHdpU2Q2WDFSYXVXSDZVZXhralFvR2lMZVZ3VE9uN1hyWVkwV1F1b05q?=
 =?utf-8?B?TkJvdUd0S2pWT1BmRm95NDNnekJzYTlaNXlPTUkyazdmcW5jQjRDa2xiRlBn?=
 =?utf-8?B?Ums4NU4wSVBxdW53ZUtETVhEUUtzWlN3YkVkbG9sNkFlQkRXMmcxa1RaVGZu?=
 =?utf-8?B?bEowVDh3bzJQY1BFUVNEa21WSVZIVnVNVHlzS3VOQzV6M1VDR0VVVlBUU2NN?=
 =?utf-8?B?YWFNUVVuZ05sZ1QvUGdSck1PbHkvdWdZNDIrM0s4NmtQMWtDWlhSSFJEeXdX?=
 =?utf-8?B?Sy9mUGUvd2I5N3M2NlBVbWlUUEt4aVdlQ3hIMm1ZeHFYZEVCTnZlM1RhN2d6?=
 =?utf-8?B?b2FRMkdXSGpNbEZpSTcvWmQxUXdPeW00ZHUxYmhRODFuL1h3RkpTRkFncm44?=
 =?utf-8?B?cjZuRmw5RmVCYW9CRlBCWXlXL0xDU2ZiZ3RJWWkwZEFGNnRKOGR3WEtUczUx?=
 =?utf-8?B?OGs5TTBoa0xuNjZrYWhTVGpxVHU4UUtlU29tMU9hVXFnYzltOU1TcFVUa2hE?=
 =?utf-8?B?VGV6TDNlNlU1NWpacThVN0g0VU5nOE1zS2trWTZycHNxMjJobG5jOHNHOHZO?=
 =?utf-8?B?OUZxREhHbVlJT1Y4RkhUSk02UFg0RFcxb01iNnR0T3VUWGNMb2NhY1BXSDNx?=
 =?utf-8?B?YVZ3WUFnTHhpMWROOXRxdXYyWGttMk01VGVqVTBJVXlZL21STkJEVkZrOC95?=
 =?utf-8?B?ZFRnYkVNTEwwODJCVENSNWhmSkIrdmNRVEF4Z3NUTGUycUlOMkhuMjk1YWlB?=
 =?utf-8?B?WWZucEFnWEFIb082V3FWMjZ2dEp0TUVhQUdnT3FtdnUvZWJxbnVDekgxRG42?=
 =?utf-8?B?RWR5T0o0Sk1nMFFJNDJSbWMrS00zOVBnQXgxaEM3L1o4dlBBaEhtVkJORzZr?=
 =?utf-8?B?ZmErMWhmSWJWeFFIOVdZUEUzc3F5VmNXUG1iVCs5bE1za0lBaGVXTjV3dWZ3?=
 =?utf-8?B?ZnFEQWM2WXpFNE5IWE1hMjRsa2VNWXV1eDdhSkhONFZ3bVNGTmNETEFCTXA1?=
 =?utf-8?B?MUcxRUlnU2JLZW1MK2cwbDBzbk44ZVBuYytmRC9lejJrSUhxNDVkVTNSUzZL?=
 =?utf-8?B?S2ZubjFrUXduK3R2OVpBbFVsTkY0S2tNaHlqYkRSMmNua2pFd3B2ODVIV2xw?=
 =?utf-8?B?MW5NdHUyYnF4R0ttUTQ3Y0lWL0Q3RnNoS0VFbmJScUlzVjUyWXVzU3owUWYv?=
 =?utf-8?B?dUlHT1NYNENEYW41N3d6Q1U5QmlkTnlvWkpZcVRpRyt6TjlOaGNST2RXbUsw?=
 =?utf-8?B?Q1BCdjA0Wi9LZVNZZldGQnhxNnFzK0dLY0lYVDhRQTZxV0UzZlVQYVc2azYz?=
 =?utf-8?B?K2hCdjNqWnVubFFQeldCb09BNTlKcTFNZ1A2U1hBL2xNS3lKK01rMlh2T05x?=
 =?utf-8?B?MURwWHRHVFZkT0hOUzd0MFJLNmVrWjU4c0lodDExcVh1QjAyUGF6aVdZNXc4?=
 =?utf-8?B?VjAzRGZlY25SckxhMzZEanIzWnN3RDRrZnJzWEdqOGdPM1RFQnRxbmIvbFBi?=
 =?utf-8?B?K3lYd2poaEE4OFNvd20xT2xUQndzS21ESDhFallnUEdDck8yc3hHUjVBMlgy?=
 =?utf-8?B?d0JGY2pDOXZvWlB6bXVjcXZNOFhqOGtZeXB3VnlnaHNMUXdrNUEvWDF6OG5Z?=
 =?utf-8?Q?P9amSjhveRM2k?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6beec4c8-5cf8-4bdb-4f5f-08d92b5a55d1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 15:22:03.9315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VdxRVSOP6PCrohQ0dUb+xGzxrodelJO3hda1eCGU2xZlSQ0vUPdanRRGZ3hRE4rV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2451
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
Cc: Mikko Perttunen <cyndis@kapsi.fi>, nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, ray.huang@amd.com,
 matthew.auld@intel.com, linux-tegra <linux-tegra@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Yeah, exactly that's the root cause of the problem.

GEM objects are the base class for TTM BOs for quite a while now.

So we at least need to initialize them or otherwise at least the size of 
the object is not available.

Going to send a fix in a few minutes.

Thanks,
Christian.

Am 09.06.21 um 17:13 schrieb Ilia Mirkin:
> GEM init happens here:
>
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fcgit.freedesktop.org%2Fdrm%2Fdrm%2Ftree%2Fdrivers%2Fgpu%2Fdrm%2Fnouveau%2Fnouveau_gem.c%23n221&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C228788b1c8524fa8128b08d92b591b81%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637588483983919147%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=f%2BFFnPEAEoeuD8bKtnGtL5ZU0HBYpJAjqKqD29Xn9Kw%3D&amp;reserved=0
>
> Note the bo alloc / gem init / bo init dance.
>
> I don't think there is a GEM object for internal allocations at all --
> we just allocate bo's directly and that's it. Perhaps you meant
> something else? I thought GEM was meant for externally-available
> objects.
>
> Cheers,
>
>    -ilia
>
> On Wed, Jun 9, 2021 at 10:58 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Good point, but I think that is unrelated.
>>
>> My suspicion is rather that nouveau is not initializing the underlying
>> GEM object for internal allocations.
>>
>> So what happens is the same as on VMWGFX that TTM doesn't know anything
>> about the size to of the BO resulting in a kmalloc() with a random value
>> and eventually -ENOMEM.
>>
>> Good news is that I can reproduce it, so going to look into that later
>> today.
>>
>> Regards,
>> Christian.
>>
>> Am 09.06.21 um 16:52 schrieb Ilia Mirkin:
>>> Christian - potentially relevant is that Tegra doesn't have VRAM at
>>> all -- all GTT (or GART or whatever it's called nowadays). No
>>> fake/stolen VRAM.
>>>
>>> Cheers,
>>>
>>>     -ilia
>>>
>>> On Wed, Jun 9, 2021 at 10:18 AM Christian König
>>> <christian.koenig@amd.com> wrote:
>>>> Hi Mikko,
>>>>
>>>> strange sounds like Nouveau was somehow also using the GEM workaround
>>>> for VMWGFX as well.
>>>>
>>>> But -12 means -ENOMEM which doesn't fits into the picture.
>>>>
>>>> I will try with a G710, but if that doesn't yields anything I need some
>>>> more input from you.
>>>>
>>>> Thanks for the report,
>>>> Christian.
>>>>
>>>>
>>>> Am 09.06.21 um 15:47 schrieb Mikko Perttunen:
>>>>> Hi,
>>>>>
>>>>> I'm observing nouveau not initializing recently on linux-next on my
>>>>> Tegra186 Jetson TX2 board. Specifically it looks like BO allocation is
>>>>> failing when initializing the sync subsystem:
>>>>>
>>>>> [   21.858149] nouveau 17000000.gpu: DRM: failed to initialise sync
>>>>> subsystem, -28
>>>>>
>>>>> I have been bisecting and I have found two patches that affect this.
>>>>> Firstly, things first break on
>>>>>
>>>>> d02117f8efaa drm/ttm: remove special handling for non GEM drivers
>>>>>
>>>>> starting to return error code -12. Then, at
>>>>>
>>>>> d79025c7f5e3 drm/ttm: always initialize the full ttm_resource v2
>>>>>
>>>>> the error code changes to the above -28.
>>>>>
>>>>> If I checkout one commit prior to d79025c7f5e3 and revert
>>>>> d02117f8efaa, things work again. There are a bunch of other TTM
>>>>> commits between this and HEAD, so reverting these on top of HEAD
>>>>> doesn't work. However, I checked that both yesterday's and today's
>>>>> nexts are also broken.
>>>>>
>>>>> Thank you,
>>>>> Mikko
>>>>>
>>>> _______________________________________________
>>>> Nouveau mailing list
>>>> Nouveau@lists.freedesktop.org
>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fnouveau&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C228788b1c8524fa8128b08d92b591b81%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637588483983919147%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=dn0%2FRAOKKddFQbhJcjd3v1L%2BHc4hGlpWIURPTG33g50%3D&amp;reserved=0

