Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8789C6791BC
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 08:15:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9658010E611;
	Tue, 24 Jan 2023 07:15:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2049.outbound.protection.outlook.com [40.107.101.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE75210E611
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 07:15:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YZHzVmdPWsLXaIT3tTMoK79rBTBqeKXbT5Wn/EBAxcM6DuzvHTRiLoYmZ0BzLzH2gw8jjuUomdFZJeqPBqoKfsmRfqjrXxXiqJXXVFIXtJGwb/ed1tAVSwd0Xpx9gXmARnvBEoa8MqJlJkbl/ff7aBy7xgVwNYaLzquqfgj5v1il0+kJn1Awa0LpASTxWrMrKgSLBh6YRdQnihAkswCLUQzLbYmYS+pXJfMdlgb5p1cM48vDuVY/1Wq+R2HHwB5aJU7OY2jSoTGLNHjuVR5KmtSqDDrEJNfx+YaDIp3dEOL+dl2VFAw2N6nDzYZvxnfVK/G/vVumeGYyG6gX/BFCUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4whNJEub6QoNHbzXiObbVmUH0H0fp6h85OjDkSlplBg=;
 b=afDJEiSlUYJCwss2sX4f6cUuhVvWgKHu0l6y5G6XQPwi7tVe5CA6GoNCyV5IYNd2bI7eys1071vWahAG9KDzUg8qHwVWIE8OC/a4YIeJzbIbvM5wSlXK0ejI6evgBMeU4CvUxYpS0u5hEgVP53oi+2tiPvKZEG7c2Q8KydRljimnS/9UoNHDBVSgvWEx3vRqc8ESgxw9uFrEIdI408yCOA2vnb+waKRhxY2GA5vZY9T2NDXkRxXCXLKVU0o2Cm7dmUnb57yerY5Nj0JdP9l/bx4OE2Uid82A3m6zZBWOpQFnOSccidClJglFlE98d4yCQFu+Wd9A2WceuorXmthnEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4whNJEub6QoNHbzXiObbVmUH0H0fp6h85OjDkSlplBg=;
 b=NY/zvQ3iV1Aenkn/uwZRVH/NYGzSmRF8iMJMsa3GcR+JbBy1w8tHdI7eqkVhi3D9dfU7c2qck2JU46YalyDqnIRBiKKlRoPJ3Qr+WT0AR3ZxsMSsX4V0JyxWLMVj8SS4I4i+lFINJvZrLu3FkZjnFF2F9QwUqSvq/i21HIo9vfU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ1PR12MB6100.namprd12.prod.outlook.com (2603:10b6:a03:45d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 07:15:37 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0%3]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 07:15:37 +0000
Message-ID: <33f87d88-b05d-e524-54fb-d5fd2f676217@amd.com>
Date: Tue, 24 Jan 2023 08:15:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: DMA-heap driver hints
Content-Language: en-US
To: John Stultz <jstultz@google.com>
References: <20230123123756.401692-1-christian.koenig@amd.com>
 <Y86R3vQX+vW0+oxw@pendragon.ideasonboard.com>
 <1f4a1a5c-e0d5-7f0e-353c-daa89f1369ea@amd.com>
 <CANDhNCoVkq4pQJvtgmvJJe=68ZoQOdjYFkbGG-PXVujX1py4aw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CANDhNCoVkq4pQJvtgmvJJe=68ZoQOdjYFkbGG-PXVujX1py4aw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0127.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ1PR12MB6100:EE_
X-MS-Office365-Filtering-Correlation-Id: 4042651a-e433-43e7-c501-08dafddaca9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z/KkuUwXPDbEGjFoiYLvdP4v9O4IynmfAwXY1QaLj3AQjMcFolgCcpaHrawdwV7wZ1+EU2SZQ1sHz2c1qIu7JP1ZdvDS2EF6y33dbPpCyyOm+93d70WoHX3iOu7tgIDVgLFidsQ6wTDiDNJzdGy60Ksl1+Piq866Fc0YXrI24Sn0Jh4ioNyCzYHzebf4F8WRrDpW4+Z1mRqwB6IdIPQofrxv5gmo7LF+vr+Sv9R+RmwffBa6RDk3o/QsN3a+DuU360HmU7WXbu2qcRqzimeJO66dVf1SdzWgU0HbPPqGVC964BWQRLr8+BWM1iGRGv2uDIQHD4N/XYwPyx1FbljRntziem8BKF4vn5WqtVqW0rbJ0jDlN514oBti1S7+eXNoyBLRcflfGgZKKIYWo6LZxL28WW3cZw0w8ZnrVlNJynXvYwxybbh2bhC5eyUxGv20uKwoPlmsx0ei8oUK3m+CL97xdlVMuX1XEkFvzRHXCfqC0HyKEGCVOpSGPdAKPSPhqnSRvvWKFKZaQ8NQ+KCmCePY9So2kBF/8aq3+eGrnmXow4xgqAZYe6SmW3uayNX7Zlwj8rgcvHwb0x7JqW6JXb0wyyOJcMS86fgBvLUHM7BOrVaxbCVvyMAUgul/+oYLdCsBbAreuffC3Puu2srMrvUmp/3ba7Tsot22nR0UXjRHxd1jBzNm4Njmi76SjaSsqxSmoO2RrepYkCdrCdmPSFWkv5f+PKkD6pNgsmOjnDo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(346002)(376002)(39860400002)(136003)(451199015)(38100700002)(3480700007)(83380400001)(7416002)(41300700001)(86362001)(2906002)(5660300002)(8936002)(4326008)(8676002)(6512007)(26005)(53546011)(6916009)(6506007)(186003)(316002)(6666004)(66476007)(66556008)(54906003)(2616005)(478600001)(6486002)(66946007)(31686004)(66899015)(31696002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnBtNjdVRnZaMzJ3YS9OWGN3THlDczVCdGVWaW5qM1NrbXVHYWlQT0daNW5q?=
 =?utf-8?B?Njk5cnJib0poUDJpSlFIaWlpQTl0RGpnN1hZTmpwd2tPbUdIRVlhelhtVTk2?=
 =?utf-8?B?MmtuRWZMd2ovRmNHNkpZdGdVUlNReDJhOEtaT1FhQnNjeVBFOHlLQjdLcFlC?=
 =?utf-8?B?UFF0ZkNORGwxVk5yaDJxR05wNEFIZDJTWUMvQ01RVzlGTmM4eVZHTGJuYUdl?=
 =?utf-8?B?NkY0TGE5VytHZ0p3bEdMTEhEcDBLc2l1T3cvaTJ1MmdQSzU0RTBJMmFYNHBl?=
 =?utf-8?B?M3pqejRqNWdlcFJ3eElDTGFyUkhXT3Y0elJHZGtyU212eWI4YWlzQXJsUjlF?=
 =?utf-8?B?YTU2aTYzL2l0R0xsODdod3ZoUUdRdFNRdWp4RVh5SnV4KzdPNEwyV1drdTNu?=
 =?utf-8?B?ZXRyYXhWTnVjbWxRUGNxTGtremxrcEE5WGRLODNUeXBDZnNvcXZFWU91QVhI?=
 =?utf-8?B?VnRtU3dPTUZJRWdIdG85ZnpXUW1CSXJSc2ozZmtsWGttQmNqanozK2NwWlhp?=
 =?utf-8?B?ejRIQjFGTjJCcVRRc3IwNWdhbWQzZFl0enVtMTFjMjJuY0tsZVkrd0FjZ3gz?=
 =?utf-8?B?dndXVzlVQ3U1cENpSnQ2eldWeGNLL0J5WHNaTld1OVc1dkVpcTVoaGJSSzlE?=
 =?utf-8?B?MkpqempLVkl4ZGtRZUQwSk5qOEppQi9SVE9ocW96ckhNTjhlUVY0elZqQWwv?=
 =?utf-8?B?UERNRWtTQTlLN25yN2JXTWJIbzBndU9yMFN1VloyZnlHZXV3VE44NjFXWnlX?=
 =?utf-8?B?VTF1SDJ5VTQ3QVEvRzB3SVZpdTFNTDFkbXVXaU4xZDhadnUwelVYRHQ5eHVU?=
 =?utf-8?B?WERwY3AzT2pKWkN2MnVjSXVUaU56Q0ZZa0s5Z2huTHNTTTRWNEhkNTBFZ1RJ?=
 =?utf-8?B?blJOcnJxWXdqcTM2Y3JtbmFTUVlKMGt3ZzRpcm1tWVhLdVVGdHZQS3NFKzlz?=
 =?utf-8?B?VG1OOTVqYWJNdklqWnY5Q2NGY3FVNUZiMjZrMjRkcmJyYU4xdENMRGc2RU82?=
 =?utf-8?B?ZlFTMVpCcndJVzdXa21acndkaEU1TkNUYS9SdXhXc0w0cXVseS93dCtlTFMy?=
 =?utf-8?B?Vll3ZmxITmFDa1oyc0o2L2dTL2t1eXdTVkl3RGdvR3lCazZwT2lIdFo2bW9S?=
 =?utf-8?B?V0J1ZmZwaGlpUkwyTm1DenRwVnZta014YmRRMWpOUTlKeXhwUWZMMEZUaTdh?=
 =?utf-8?B?blhVc294S3VEVXFrejRXRUFGMStKR3o5TXU2UytJRS9Lb3NEb3luTW03dTdz?=
 =?utf-8?B?WWk1RzYvMnJEakwrZkFSNTlDSVhrb1NoeUIyemM3ZlFTMUZFTDNVbHhldWI1?=
 =?utf-8?B?Yzc2N0ZFMVdNTmd4cmZvektSQ21VSklSNXp3ZlVQUTJXdW85QWNMaEY0Rkp4?=
 =?utf-8?B?SGNtK0pJZkYwNndtRi9vRW5lOVMydGJIU3dwbllsVCtNVjE2aFRPSWRwQmVh?=
 =?utf-8?B?WFRqUTFrbVV0ankzNmd6VWtFdlJ1RVBmdjhBZm14SnpKU0x1STM1Y08vaDl1?=
 =?utf-8?B?RzFDTWpxanRXdUZOb1NyMjEwNWZZUHQ5clpyN3NRK1U3K1pqSWdxM0oyU1l1?=
 =?utf-8?B?VXBPendjZmVqc2I2OThEbVVrbjhxZWo2TzdDSGxCQUNFYjBUZWh5cU9aUHZQ?=
 =?utf-8?B?UkdhZ2ovaWlQMkFzeEpVTDFhcjZXSjBNM2VCb2F2SElHTDQ5TU1xUXNzNW54?=
 =?utf-8?B?RjJLbG1nS3ppaVJ6bGNPdFVNWnZrdkZvTmE2eUxIdGt6VEoyWi9PM3AwSm5p?=
 =?utf-8?B?NTFWOTZqeEc0MC9wQlAzaTVFaWgySjM1UndaR2p1SzlmNWc0QW5ZSWpjZlpH?=
 =?utf-8?B?TjlUTUxYREU4TEJQeTg2b1VXSTlxdXFJeVdPNld6MHNURGFoVjNWL3R2U2hI?=
 =?utf-8?B?SW14UWNOMnZnMGRtLzd5S0xUVU5UMlp2N3l4SFVBbTFHUVJKYm43d1pIR2FE?=
 =?utf-8?B?NGRGUUdkcGZScVViQ3hBK3FzNHJVQmdqZXA0QkVVa0Z0TkkyWkNYUWdPK3hD?=
 =?utf-8?B?VVhaV3dxeERRcFBDWWdoa0d1bklURVNhYW1nSXVYQlpPSXo5WFQ5Vit5dSt4?=
 =?utf-8?B?dkJWNzEzRUh3dGJVNWFtTGRJblpER2tDVkQ3ald2Q2w5dDZlK2pqQUNQa05k?=
 =?utf-8?Q?Fk9wQZ94ZQX4SogVQKCcfWrfS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4042651a-e433-43e7-c501-08dafddaca9b
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 07:15:37.2750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pRmE6Ut31RrjrrN6Z8rDdXGWYih5oMSR/sOs1H/4GgKGjryC/ckIe50y5D3vc6r2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6100
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
Cc: James Jones <jajones@nvidia.com>, linaro-mm-sig@lists.linaro.org,
 sebastian.wick@redhat.com, labbott@redhat.com, benjamin.gaignard@collabora.com,
 linux-media@vger.kernel.org, mchehab@kernel.org,
 dri-devel@lists.freedesktop.org, nicolas@ndufresne.ca, hverkuil@xs4all.nl,
 ppaalanen@gmail.com, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 lmark@codeaurora.org, tfiga@chromium.org, sumit.semwal@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 24.01.23 um 06:19 schrieb John Stultz:
> On Mon, Jan 23, 2023 at 8:29 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 23.01.23 um 14:55 schrieb Laurent Pinchart:
>>> - I assume some drivers will be able to support multiple heaps. How do
>>>     you envision this being implemented ?
>> I don't really see an use case for this.
>>
>> We do have some drivers which say: for this use case you can use
>> whatever you want, but for that use case you need to use specific memory
>> (scan out on GPUs for example works like this).
>>
> [snipping the constraints argument, which I agree with]
>> What we do have is compatibility between heaps. E.g. a CMA heap is
>> usually compatible with the system heap or might even be a subset of
>> another CMA heap. But I wanted to add that as next step to the heaps
>> framework itself.
> So the difficult question is how is userland supposed to know which
> heap is compatible with which?

The heaps should know which other heap they are compatible with.

E.g. the CMA heap should have a link to the system heap because it can 
handle all system memory allocations as well.

If we have a specialized CMA heap (for example for 32bit DMA) it should 
have a link to the general CMA heap.

> If you have two devices, one that points to heap "foo" and the other
> points to heap "bar", how does userland know that "foo" satisfies the
> constraints of "bar" but "bar" doesn't satisfy the constraints of
> "foo".
> (foo ="cma",  bar="system")
>
> I think it would be much better for device 1 to list "foo" and device
> 2 to list "foo" and "bar", so you can find that "foo" is the common
> heap which will solve both devices' needs.

I think that this would be a rather bad idea because then all devices 
need to know about all the possible different heaps they are compatible 
with.

For example a device which knows that it's compatible with system memory 
should only expose that information.

That a CMA heap is also compatible with system memory is irrelevant for 
this device and should be handled between the CMA and system heap.

>>> - Devices could have different constraints based on particular
>>>     configurations. For instance, a device may require specific memory
>>>     layout for multi-planar YUV formats only (as in allocating the Y and C
>>>     planes of NV12 from different memory banks). A dynamic API may thus be
>>>     needed (but may also be very painful to use from userspace).
>> Uff, good to know. But I'm not sure how to expose stuff like that.
> Yeah. These edge cases are really hard to solve generically.  And
> single devices that have separate constraints for different uses are
> also not going to be solvable with a simple linking approach.
>
> But I do wonder if a generic solution to all cases is needed
> (especially if it really isn't possible)? If we leave the option for
> gralloc like omniscient device-specific userland policy, those edge
> cases can be handled by those devices that can't run generic logic.
> And those devices just won't be able to be supported by generic
> distros, hopefully motivating future designs to have less odd
> constraints?

Potentially yes, but I think that anything more complex than "please 
allocate from this piece of memory for me" is not something which should 
be handled inside the device independent framework.

Especially device specific memory and allocation constrains (e.g. things 
like don't put those two things on the same memory channel) is *not* 
something we should have in an inter device framework.

In those cases we should just be able to say that an allocation should 
be made from a specific device and then let the device specific drivers 
deal with the constrain.

Regards,
Christian.

>
> thanks
> -john

