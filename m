Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB26778CA2
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 13:03:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 360A410E68D;
	Fri, 11 Aug 2023 11:03:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20609.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::609])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D2210E68D
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 11:02:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gtkERRevPfj/2eRWl6l09HBbqtBZ9SKl5mJU5ntn/d8gDiNnY3/Yv544Tn5+95AiV4uveKVEuXskM+qNEj2RX5Ab/Mmhe/ZkbVo9d0S3Ap2YGbkXjbmM9BrnsGgr3/yqRIpNQeIVwtIcDKljbH0JnBY2UM1ihYTU1YgK/VXN1c/kfYnu3EeLlZj5uIMZ8hM3v1S6e3xXLCJac/FI6sr+3k+qr6y8ISCl3KNASI5D0+JJVv4/yIrgV37YF/+I3pkYcRUKA3VtbkEUeF3g8foqC4F1Vq+8zfXx1e0A0IXo93gwIc+J3XcBDI9LaDC1adLHCa+UvpxmsonjyNLaaSgljw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aSVPjW80VJ4k6w1RvvTx2OiVe3CSY1oPY+MY4ab1X3E=;
 b=KlGbrlydWFZ/x+5eg/yX4PALNRw/wENmTzbuJXtwWA79TLSzbvTy/ZcAIC1OlEPA0nDeoJFbiCc+YKgbITqMyoeaUKeQ9ql5O4toR58QV4f3xAWr1EjsWyDqe8/BIf/UOdBbpRDp5jCeoHPwIOMGDnz+totCqhBNOOjrf5uCuepsk8Mx0Y+OW1QcPF42IZe1SQsuos7Je+du1bhXZSr3Uo5S8JPCcsLRutnQoiV7ORVxWKu1Ev7h3Kp1GJff9dOshBFeYJzIWflbdLTKL7gyZhP3oMddlNMpBtB8/nW5QBJzhPzcOY3hLyzWPSnttZBF3lcVpDNATNz6/l1pDaT8cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aSVPjW80VJ4k6w1RvvTx2OiVe3CSY1oPY+MY4ab1X3E=;
 b=Gr9fO/nelDsbjWc3fjRFxgZ+Ofrlw0edcC6p5vEpdRScoKkjZrDkYJFj5YdRzFskpT4QRHRCA86nA/1YCXIR+TY/p2mjxeYyh31YcCb/RrTkOXOhcWZf9r/BThgI6vBM5AlRc2VrNd/Gm/qv+TcacVn0sHOVaOf4nDuHlyXSLt0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA3PR12MB7829.namprd12.prod.outlook.com (2603:10b6:806:316::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Fri, 11 Aug
 2023 11:02:57 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6652.028; Fri, 11 Aug 2023
 11:02:57 +0000
Message-ID: <8e50df70-e05b-e27b-958a-6c97943917d4@amd.com>
Date: Fri, 11 Aug 2023 13:02:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH v2 00/11] Device Memory TCP
To: Mina Almasry <almasrymina@google.com>
References: <20230810015751.3297321-1-almasrymina@google.com>
 <1009bd5b-d577-ca7b-8eff-192ee89ad67d@amd.com>
 <CAHS8izPrOcrJpE1ysCM7rwHhBMPvj0vQwzfOyVqdxsVux8oMww@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAHS8izPrOcrJpE1ysCM7rwHhBMPvj0vQwzfOyVqdxsVux8oMww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0148.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::7) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SA3PR12MB7829:EE_
X-MS-Office365-Filtering-Correlation-Id: 63c74776-8372-445f-7e98-08db9a5a84da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4oxbNZVAHLfCqYpDcNLISeYD1NEAMjKbTZB+2W5dobbUbTjI5LQ7ZZ34ktuE3jXscA0lcBS1T+XTadYlfnAn1+jOllUM9ggldhfrRL5jWXMeGLafmzLvCncOubEsbQR6RhOtewEY5226zzJ1hm5rgQFu736wNjzZKRpKsGCPleUIMGcCl0CIcMe06LpD0cNYEfmSXXR1NVvUROVYzZyDetp525XOxQ2dEn9n4V0/6tFos0PRGT8mtOF5VMlD0Y8LqrCy9xbwDLCwDzGLFstX1QYdJPXYwMYCpVmnqWStTSE5WXynuTSWbjw9xpKs5xRf+TQumiW0nELmN5qGnbDxQGuIvg/x/xLdTQSJTedaq0AJi0MXJ2Mp6DufBbYmcUjvS8CgwhqqcMyMPeVvzDLmWvA5Y2jbwg/VFiA6Jia0mxP7qCoZxDuFBiwzsShQlkfMuJB8iMxHkSt5NPz/riwbEuLeo2O76NtjwNBzfYMedk3NleDltLpaErIHJNlSFJmmeTOls8GI2zm5FKtfK2Bu4VmqWaxrHIV42xYOZOYzq9lAbkHN2CSwpSEu24i3fj9J/DszFy31qNOXeUrch2zEwNRSuzfxTqTOyrzeqDeB/oasVgbmmhpb0g/vUCR1Cs4niGZQiAcvkihIjbeVQ17eew==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(346002)(376002)(39860400002)(366004)(451199021)(186006)(1800799006)(6506007)(8936002)(8676002)(53546011)(41300700001)(36756003)(2616005)(83380400001)(66574015)(2906002)(38100700002)(86362001)(31696002)(7416002)(54906003)(66476007)(66946007)(66556008)(4326008)(6916009)(31686004)(6512007)(966005)(6666004)(478600001)(6486002)(5660300002)(316002)(66899021)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amJIUmsrMkNVckJGYXpUcEdockFpcEJZc2NSRnJTT2VhSmFLaUE4Rzg1STFp?=
 =?utf-8?B?UlkwNkhkL1gxYzZUNzBVTnE4MUV1NzFTVXNYZ3cyZEoyVGNsQ3A4amNkZGlD?=
 =?utf-8?B?TVdpQ2tSRW13MVpxTlljNXI4RWU3SG1XVmhnRHI0aDRaVTVOd1RSRDNNU09z?=
 =?utf-8?B?RlY5azJMbHNlc2xiNThVbzAxdy9CUU91VEpvQ3BxMTV6bjFiNHQrWFBMeTJj?=
 =?utf-8?B?U3lXUVlhRVRzMlV6bGNYR1ozajMxVEF5b3p3dStKV0RuUHhJL0RiZEgxcGQ5?=
 =?utf-8?B?MXZmTGJwM2dVRTNLaUpJREhJYmNDWHpQb2crN09aMW9leHNIb3VvMVZ4WUJP?=
 =?utf-8?B?cDhmQkxCajh2UkJyOTZFZUlRQ3FyakFwcTBWVzNhUmFudm81RjJCa2FpMDNQ?=
 =?utf-8?B?Zk5kUGZha1RqYUgzY1RpdGIyUWYrWVdWNzJpREFsYmxSTFlXa0ZqSDdyNmwz?=
 =?utf-8?B?RjEzaVgxM0ZtSXdUQ0NXWWRPUmRUUHQ4b0tBU0JOWFpHZDFCWUt5S1IvNU9L?=
 =?utf-8?B?ZjlmcU5NMjNLejVNeFJOYXc1cmhWbk0rYm8vdm9BNmNCbFZCMFVTekgzL0NK?=
 =?utf-8?B?Kzg0TGptU2V4Umx6WTduNnU3L0tvMFlqSThzN0FGclJkcmJUV3lmRHVNZTBq?=
 =?utf-8?B?RG1wTHFjaTNycDlMWmFoSVNXUlpFRVNiUndJbzh3UXB3Tkt2VHlEakpnL3Zv?=
 =?utf-8?B?R29wRFZJQy9rRXhpMUdDYWo2V00wdlUxZ1ZNM0pOajhHS0liR2pDY3NWdk0v?=
 =?utf-8?B?Y1VVKzllcXdESmdqb2phV3RPZjc5dXBaZGQ5blV4M0YxT1pjUWlTK2F4ZW82?=
 =?utf-8?B?alRUUG5rWkY5aUZDVnovSVBLbTgrellKbXJBeTJEejlibERmemQ1UkF0aXlH?=
 =?utf-8?B?YmJBcWFlemZXZjVudDVQYzdNdnV6cUVKY25jdURnbUhNNkpab0ZGREgwOHph?=
 =?utf-8?B?UzF2QUZPVDJ4VXRVUVFoZzFaNThubUxrWWgwTzlZbnpSY00rR1IwSS9TMkhl?=
 =?utf-8?B?clR6aEdWb1JNaFVyUmwwV1N6a21scWlLZDgzSUc1RVozT2d4ZmY3Y2JkaVlT?=
 =?utf-8?B?UDJyTGttTHgwTVRWZDd4ODVDL2tENm1RbEVtVks5d2FRamQwZS9wRzVQaTZO?=
 =?utf-8?B?eWcvczFRZGJmQ3BCdWUrT29scXZGaWFhRkNwTWhmdGtGMHRjOXdXOTNSYWlO?=
 =?utf-8?B?V3JiZHBnRzNKUStucjdrbFdqMi9yLzBmOVF0ZURjTUhCb09pRHoyZEU2Z2pz?=
 =?utf-8?B?M0lYSjJFY2J0UHM5Y2lKRHVvUUs4bTF2N1F6bHMvZ2hCUVVva1Y3UEx5RDdG?=
 =?utf-8?B?ajJQNmRHL2N2d2NSNmJaR3pkOG1pcCtoR29GYytpc2ZpR0hSRGRMcDVDejhw?=
 =?utf-8?B?OTE2cHI0Y2V0akQ2TUNLalZBWEhYVjJBNm56ZlI1V2M4UGxiWnNKRGgyaWxV?=
 =?utf-8?B?OHF3ekx2TE1YTi9ZblVYTUREd0xQN1BYb0Mwb2VWbHBFNFZySVg3VEE1dmRw?=
 =?utf-8?B?UFVpdE44bXRkYmp1ZlhBVmRXUFVkZldIUWxnb3RDdlZTeVlsSk1wc2ZUcVBN?=
 =?utf-8?B?VHhBUGZNamNXVTRHUnRaVE5oY1hmamF0M2NFcGthR1BRR2JxS2sveHB4bXBy?=
 =?utf-8?B?OVZzYmIvY0tnMVpEVFU0ZWdZcUxuUUU4SnhpZTBZZ0NlWnd4Q3htSVdNQklV?=
 =?utf-8?B?eUwzbEN2dnF0bE5Jb29pT1U3UCtqQkJMSVZWM1ZSM2JVbm1JbnlVZU1nL1Iz?=
 =?utf-8?B?ZjIyMEFNVXhubG9zQ3Q2bkxsSE5OQzM4ZURtekxPenQ3bUdTOEpvQ0gycGlt?=
 =?utf-8?B?Y2VOV2hZZXp5L0ZIRjZTdzB2ZlZoOGNnVTZBaVdlZVBmdlBuRVpYVU13Yzkv?=
 =?utf-8?B?ajBzWlNrSUY4OFRsNGlGQ3Y0M3g4eGR2RFRCVkRhUnVhaHo5UGNqcXYvdDdh?=
 =?utf-8?B?dlgrakM4WEw4bGZZNXUxRkF5THE1VDJxR1AwZlU1ZVozSHc1SUhtSTE5K00v?=
 =?utf-8?B?c0lObDBRVUZKU2VNb0dYQWxkTThlNzRobjV2aWorTHluSExVbFpkelg5TUF6?=
 =?utf-8?B?TlRmb3B5VkppK1hJRnVobm8zT1RaT1o2WXg0MTM1OHVkODlRT3NCL1FRakVL?=
 =?utf-8?B?cmRhN2NobkJnQnhCdmFVcXpzMzZwSkJmRElMNklrVk05U0dJOW5JNis3d2hL?=
 =?utf-8?Q?ZnUJgVoZnvJFjwuwNarV3HOoEk5phvgExi+3cC0aKbWD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63c74776-8372-445f-7e98-08db9a5a84da
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2023 11:02:57.1082 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cMABFwps6H3O5OyuxcC5z0godxSPW503rPDuhhdpFqQ56rDscnBTvN2QuRvZaE5g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7829
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
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 stephen@networkplumber.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Eric Dumazet <edumazet@google.com>, sdf@google.com,
 Andy Lutomirski <luto@kernel.org>, Hari Ramakrishnan <rharix@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.08.23 um 20:44 schrieb Mina Almasry:
> On Thu, Aug 10, 2023 at 3:29 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 10.08.23 um 03:57 schrieb Mina Almasry:
>>> Changes in RFC v2:
>>> ------------------
>>>
>>> The sticking point in RFC v1[1] was the dma-buf pages approach we used to
>>> deliver the device memory to the TCP stack. RFC v2 is a proof-of-concept
>>> that attempts to resolve this by implementing scatterlist support in the
>>> networking stack, such that we can import the dma-buf scatterlist
>>> directly.
>> Impressive work, I didn't thought that this would be possible that "easily".
>>
>> Please note that we have considered replacing scatterlists with simple
>> arrays of DMA-addresses in the DMA-buf framework to avoid people trying
>> to access the struct page inside the scatterlist.
>>
> FWIW, I'm not doing anything with the struct pages inside the
> scatterlist. All I need from the scatterlist are the
> sg_dma_address(sg) and the sg_dma_len(sg), and I'm guessing the array
> you're describing will provide exactly those, but let me know if I
> misunderstood.

Your understanding is perfectly correct.

>
>> It might be a good idea to push for that first before this here is
>> finally implemented.
>>
>> GPU drivers already convert the scatterlist used to arrays of
>> DMA-addresses as soon as they get them. This leaves RDMA and V4L as the
>> other two main users which would need to be converted.
>>
>>>    This is the approach proposed at a high level here[2].
>>>
>>> Detailed changes:
>>> 1. Replaced dma-buf pages approach with importing scatterlist into the
>>>      page pool.
>>> 2. Replace the dma-buf pages centric API with a netlink API.
>>> 3. Removed the TX path implementation - there is no issue with
>>>      implementing the TX path with scatterlist approach, but leaving
>>>      out the TX path makes it easier to review.
>>> 4. Functionality is tested with this proposal, but I have not conducted
>>>      perf testing yet. I'm not sure there are regressions, but I removed
>>>      perf claims from the cover letter until they can be re-confirmed.
>>> 5. Added Signed-off-by: contributors to the implementation.
>>> 6. Fixed some bugs with the RX path since RFC v1.
>>>
>>> Any feedback welcome, but specifically the biggest pending questions
>>> needing feedback IMO are:
>>>
>>> 1. Feedback on the scatterlist-based approach in general.
>> As far as I can see this sounds like the right thing to do in general.
>>
>> Question is rather if we should stick with scatterlist, use array of
>> DMA-addresses or maybe even come up with a completely new structure.
>>
> As far as I can tell, it should be trivial to switch this device
> memory TCP implementation to anything that provides:
>
> 1. DMA-addresses (sg_dma_address() equivalent)
> 2. lengths (sg_dma_len() equivalent)
>
> if you go that route. Specifically, I think it will be pretty much a
> localized change to netdev_bind_dmabuf_to_queue() implemented in this
> patch:
> https://lore.kernel.org/netdev/ZNULIDzuVVyfyMq2@ziepe.ca/T/#m2d344b08f54562cc9155c3f5b018cbfaed96036f

Thanks, that's exactly what I wanted to hear.

>
>>> 2. Netlink API (Patch 1 & 2).
>> How does netlink manage the lifetime of objects?
>>
> Netlink itself doesn't handle the lifetime of the binding. However,
> the API I implemented unbinds the dma-buf when the netlink socket is
> destroyed. I do this so that even if the user process crashes or
> forgets to unbind, the dma-buf will still be unbound once the netlink
> socket is closed on the process exit. Details in this patch:
> https://lore.kernel.org/netdev/ZNULIDzuVVyfyMq2@ziepe.ca/T/#m2d344b08f54562cc9155c3f5b018cbfaed96036f

I need to double check the details, but at least of hand that sounds 
sufficient for the lifetime requirements of DMA-buf.

Thanks,
Christian.

>
> On Thu, Aug 10, 2023 at 9:07 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>> On Thu, Aug 10, 2023 at 12:29:08PM +0200, Christian König wrote:
>>> Am 10.08.23 um 03:57 schrieb Mina Almasry:
>>>> Changes in RFC v2:
>>>> ------------------
>>>>
>>>> The sticking point in RFC v1[1] was the dma-buf pages approach we used to
>>>> deliver the device memory to the TCP stack. RFC v2 is a proof-of-concept
>>>> that attempts to resolve this by implementing scatterlist support in the
>>>> networking stack, such that we can import the dma-buf scatterlist
>>>> directly.
>>> Impressive work, I didn't thought that this would be possible that "easily".
>>>
>>> Please note that we have considered replacing scatterlists with simple
>>> arrays of DMA-addresses in the DMA-buf framework to avoid people trying to
>>> access the struct page inside the scatterlist.
>>>
>>> It might be a good idea to push for that first before this here is finally
>>> implemented.
>>>
>>> GPU drivers already convert the scatterlist used to arrays of DMA-addresses
>>> as soon as they get them. This leaves RDMA and V4L as the other two main
>>> users which would need to be converted.
>> Oh that would be a nightmare for RDMA.
>>
>> We need a standard based way to have scalable lists of DMA addresses :(
>>
>>>> 2. Netlink API (Patch 1 & 2).
>>> How does netlink manage the lifetime of objects?
>> And access control..
>>
> Someone will correct me if I'm wrong but I'm not sure netlink itself
> will do (sufficient) access control. However I meant for the netlink
> API to bind dma-bufs to be a CAP_NET_ADMIN API, and I forgot to add
> this check in this proof-of-concept, sorry. I'll add a CAP_NET_ADMIN
> check in netdev_bind_dmabuf_to_queue() in the next iteration.

