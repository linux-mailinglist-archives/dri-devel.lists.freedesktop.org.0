Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0490678168
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 17:29:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB94A10E1CF;
	Mon, 23 Jan 2023 16:29:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2077.outbound.protection.outlook.com [40.107.220.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E534D10E1CF
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 16:29:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bOKLSU9JeUmx8T2toFZ2EU5mmXfVcTQjkQ60SkoRabN3ZNQLtmcx6ueIdNyxTNNfUU6PcCA7nhN6es46AnugUmGB8ZiJrXm+Ct+i0RoPWPT1vAbMPbVhC3aBKM3KiqBlGQrpsePz89FOQryk3FpLTiLllqpKsp25IF+Tuz4d4QeIezTzzqD/ahs6QVp2KsdX/c8UpSZ2nSxFJN+fs8Vrez/6fTOPSqPUB3UkwRfJKO8T/4GAFXOuCi5RBdU7Ro7OEVSfGJ+yUln/g8u7uMO1ULPX5hmJo7JCHE+Yy0SRhAaCh29s5OrsRpCcT8sqJmyR1pHPOHs/MpDfxgwaDFy/1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mc5C1oaleI+xNwcX39Ed+rYtT21ctdN9Mk3L7TRuOpE=;
 b=Ep6eY6PhftQT3DlN5gWiWYF/QutN1Moi4BfFLSLijEM43nkDki/12cHy791g3lYIgGSLEJP8ygkUpE8P1hOSks91Fb0Z+c+OenQn/nCUNiMCFHsOnNtucz6RYetdFnyWSL1+6P4Du0Ith8Y5fI5HCyps7ZEW5hsm5NFD/HXbb1QCzkaS0nBpA5Dm7ktYi9iMjsSPCdK7n7bxCPlGm8YOEzalErmbvOksoTugc+cSFiTOs6j5qkruBoq7if/ij5VDFKEp9zmHXhDpA8tzPQlgl3B9YNi34aMutzy9lKotjHEPGpU4Ek3KjFtYNygeN3GzZOxPStGUUbXx69bG4mwLcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mc5C1oaleI+xNwcX39Ed+rYtT21ctdN9Mk3L7TRuOpE=;
 b=VW7ct740EXkOF2TftlktH89lOVTwxpeFb2kDKUU0T/mtEbta02mYSvrTeCU7mI4jEoxSkFU5ipqUcm6e0vkPgA2qc4cVZwKIPg/wm5gF/+1QW8a00oe8BqJMTb1uRtAEaG8o2hCvXCeup7K0mzyx0jBokgmJqJq/cL3/A4S0Nbs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW3PR12MB4507.namprd12.prod.outlook.com (2603:10b6:303:2c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 16:29:25 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0%3]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 16:29:25 +0000
Message-ID: <1f4a1a5c-e0d5-7f0e-353c-daa89f1369ea@amd.com>
Date: Mon, 23 Jan 2023 17:29:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: DMA-heap driver hints
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20230123123756.401692-1-christian.koenig@amd.com>
 <Y86R3vQX+vW0+oxw@pendragon.ideasonboard.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <Y86R3vQX+vW0+oxw@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0123.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::9) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MW3PR12MB4507:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ab5578b-ba2f-42d8-e512-08dafd5efdee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 380nR07Vw/zJhCBJnyH79Bf323ERE3zaq95FwdQZec6fT+TYHVjwSSmxxFBBotci6VfkxX452bLxvndPhRtlvUKx5rMZnDNRWe0zJ3q3VdNoeol28FUSQLP9ScyhMd7MVyxl494yHzyrdzUNI5SBWlcvfCbehrY1rzQ/Xj9xXDL0d/UrCh9FGthTvTWjKELkxGVB9yO1aiYHdkld98uYRTx+re7o/a16FCX524GoeY837A+lQC10CamaCKatoIDLw1DLGby/5br/hFF5LrYDfOe/+GNuSM7/sU3aA+0zwPWYqIOx+UFOkESw2FYKHyrAFkXubKO4qhpeqmd5BTw355UkwSbj8f5frRSFuXP/q7zn3ORDCiW88qEPEzf1xbhKDkBf6jFmQVFA9ifiqXWCZM6ai3sj48usYfhsdQr8aXpyU+EkvuUn1x+Zs+mdemxpi4fa39wgGHyJWgqmgogjK7Ad23gMo35KoeB1tj55T9RSyEJJNjKlbBHLmFU4r3LssZlGqVgZWOOZZdsgHFsiMEbJswR9tdRcTw2gEUfVuwKVeV2+HDlXyyEyd/BaYwotbQFOiOy+pJfHR+4FqaXBe/VVPRCsgaW1el7Z0TqcTBNhaWXYuN77t+/7k2zvu96L3cq8SyS8Sy9D2A4FVh2oAnkSsMwkEN+xQkARo4BD0lywOotsG1lOdKWUgckMmayFwxcgKwU/E+8KywdvWaEA/aPG7e5YoRsEADYS9OSh2MYVuvM9aa30NYGK83VpsDurxYuEBp3eIP22TAB1iXC5/yapjNLw84gnP2wZSq6IKWm+NE+wGmcd7atdiHImSbIu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(136003)(39860400002)(366004)(346002)(451199015)(83380400001)(66476007)(66946007)(66556008)(86362001)(8676002)(4326008)(6916009)(66899015)(316002)(36756003)(6506007)(3480700007)(6666004)(186003)(6512007)(6486002)(966005)(478600001)(2616005)(31686004)(8936002)(7416002)(66574015)(5660300002)(31696002)(41300700001)(2906002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aW5WY2R0cTc5aWhib3VWbWpDQ3pieERpVHkrU2tqT21BWS84QWxxcFlmSVFV?=
 =?utf-8?B?ZEQvYStWdUtxRjN0N0JNWlo4aG5sY3lFK0F4TUE5bnZNcHdTNGJpV3F3bjF1?=
 =?utf-8?B?SVRzZ0hTSm13cytGOFUzY05hdlNpdSt6RHFLVkMrUEJ2cVBURzRIL05IbEhC?=
 =?utf-8?B?N0tlNy9hcDNiYkJjY0dLTVBpSkw1OGp4aGswa1haWjdmQjBycG1raFhNVkxQ?=
 =?utf-8?B?MWlYQjNHZDdqdlRhRTNRTSs3UGxNb1RSUmlKREN6eWpSU0E3YngxdTVZZTcx?=
 =?utf-8?B?Tm02QmpCamZkKzJzZGpacDVpTjYzdDhTRU9CbFd3MEhpbGl5QURKL0VjTlMr?=
 =?utf-8?B?YVQ1MlpoSnN0eDVLdmNqL2k4ZGREZTMrM2VtL1dISkV2RjM1andXcjJ3ZGtF?=
 =?utf-8?B?YjBZd2NUT1FDY1A3QUZYMDE0NEJhOVFsVGVmTEdIL0VmM0d4SWI5Y3NQUnF4?=
 =?utf-8?B?SVR6TjE0ckgxN2Q0ZkczRlpmNHpXZW13b0ZzNjNrSTUvMHIyaCsvTW5UT0xP?=
 =?utf-8?B?dVhnOEFaUnRWblNDdWh2Q0FGM09qaXBPaTlqTVVWMTVqeHA1YXcxNENrcmJ5?=
 =?utf-8?B?RDFzLzhYMnJGZ3RjUy9kNzVGTzk0MW0zMURlR1UrZ2J5QzQxYUNhQU9CbTdR?=
 =?utf-8?B?dC8xVGpldmZsL3hkU210dUFwQUJFQ0hManJ4ZlFSR1FCeE0razQ1a3dlSlQ4?=
 =?utf-8?B?aWtYbWZHRlZuTFdNaHZtdjFlVHg5eGcrMFRhWU1ad0dpb1IxbHlLRkNBVVZN?=
 =?utf-8?B?RkRubXFVTUF5L3pqaFBVTmJsZmJiWEJrOVZyZzlWZ0x2OW5nV3Nzdm1VSHg4?=
 =?utf-8?B?THlOZUl2Uys3R3U5MnNSd0JFckhCVFV3eFA4RW9Mbzl0OHhkQU96SDE3RE9s?=
 =?utf-8?B?R2Fla2pGYXpFc1EwaWtyUTkxYWVFeVplWlpwelZiQk9PdG5rS1V6eTdicHpu?=
 =?utf-8?B?YzQxS1FycXpIeFBCNzFyRi9vakE5Rno0ckFtenIybkViVy9Ed0JKQldmN0xs?=
 =?utf-8?B?U2hMUk1PbFptOUt6V01GZTNlSHMvUDY0RUZsUGRIRVZ3Y3F4NTZLd0xyYVo3?=
 =?utf-8?B?WmY5RVRpb0FiUk9SQWd0VXVtenVKMDNZU1p0d3dyQU9FLzFtMzZMZlZLZ3d6?=
 =?utf-8?B?Q2tiSXphdEd6VG90MWdvWGYzZ2RkYnVmbjM1ckVrcnM5Ujg2Y1VpVXBXQlBF?=
 =?utf-8?B?MWdwTEpVMHlqZW5Na1VBWk1DUjBVYUNJdG5XOW1YS0M4cEg0S0JMeGxGK2M1?=
 =?utf-8?B?bXhqZUVycDNYMkd1UUFXZ3dsbGN0Rmo1RzA3OWFDblJiNXV2cG1MUHBOdHda?=
 =?utf-8?B?VU9wa0JzVXYzY2FYaE1SQ2R6Ryt0alpkaGlERjhXRnA5ZVVaTzBHRmovanVo?=
 =?utf-8?B?TlZNNkFOWlU2RzFkY2JsWVkyQXRvSzdpMmFsVGYxNlM5NVcvQTNxK1JKdW9U?=
 =?utf-8?B?ekw1WThpd0tWUlVnVnV3TCsxZWI0S21YbGlBTHpuWjRvVnRySHlWLzRrTHRP?=
 =?utf-8?B?TjNuSnhYby9vMWZ5M0dOSDFsTUUzN2lkTTNReEJjQ1RydXZ1cWVjRDBDaW9B?=
 =?utf-8?B?VVZUdXYvN0dKRUZEdk9rR2VwVDhOVGhOUloxVlJ3dzlEeTFtazFiM1hUL0U5?=
 =?utf-8?B?SHkvdG9tN040dmZpLzFKNEpyNElPeWVzQVhGTGJScVY0NE5taGdiZmUvZVIr?=
 =?utf-8?B?Y0FIK0o4cERwcTNOcEZQVE5DblJmSDRxeFBsUDhCOGZ6RkJHRjFsUnFuRXB2?=
 =?utf-8?B?aWE0TU9OZkRUa1pqM0pEMFdXV0RJZ0NZYTBkYUt2cHoxdFUvUElRaHF3WGIx?=
 =?utf-8?B?NE56U0hIVnczQndDZGJRUmFCMHliRTFOMzBWSkdVVTlwVG5TeDV1Q2huL0l2?=
 =?utf-8?B?Y3VQbzFKMHA0SlhtbEd6YlNuR1diNUwwRDE0TzRFdWVlVnU0QzB3eTJJRHht?=
 =?utf-8?B?ckNVZ3RCUFJzRG9GQXJGbUZGQ2kvbytzZUVjUkhBM3NIK1hZTHR2OWUwNWdN?=
 =?utf-8?B?bVFlWkFJcm1wUTg4MTlrbmdaMWNOd3o2SjhwOEYrWFM4aFEvUzg0QXZXQWtm?=
 =?utf-8?B?UFVLQTl2dDhuWmpHVnRWMHMxZFplbm9ZRkxBa0JKZW1hQXlFQnVicFd1cHcx?=
 =?utf-8?B?TkczY2VsQm1xRnpid1RBeGNJVUtDVEE3SEs1VHhnNVAwMkU0Q0k2RzdYV0gy?=
 =?utf-8?Q?On2u7no8uODc9ezXAKGlip5YbHcOa/S5eO904J+7x1m0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ab5578b-ba2f-42d8-e512-08dafd5efdee
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 16:29:25.7578 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8aKb7G8RMY1lhUOOq3DMKN31QO3s8bk+MDgDJyZv4dwZI1W5hZ3DHvp5QY5AIZI6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4507
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
 linux-media@vger.kernel.org, mchehab@kernel.org, ppaalanen@gmail.com,
 dri-devel@lists.freedesktop.org, nicolas@ndufresne.ca, hverkuil@xs4all.nl,
 jstultz@google.com, lmark@codeaurora.org, tfiga@chromium.org,
 sumit.semwal@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.01.23 um 14:55 schrieb Laurent Pinchart:
> Hi Christian,
>
> CC'ing James as I think this is related to his work on the unix device
> memory allocator ([1]).
>
> [1] https://lore.kernel.org/dri-devel/8b555674-1c5b-c791-4547-2ea7c16aee6c@nvidia.com/
>
> On Mon, Jan 23, 2023 at 01:37:54PM +0100, Christian König wrote:
>> Hi guys,
>>
>> this is just an RFC! The last time we discussed the DMA-buf coherency
>> problem [1] we concluded that DMA-heap first needs a better way to
>> communicate to userspace which heap to use for a certain device.
>>
>> As far as I know userspace currently just hard codes that information
>> which is certainly not desirable considering that we should have this
>> inside the kernel as well.
>>
>> So what those two patches here do is to first add some
>> dma_heap_create_device_link() and  dma_heap_remove_device_link()
>> function and then demonstrating the functionality with uvcvideo
>> driver.
>>
>> The preferred DMA-heap is represented with a symlink in sysfs between
>> the device and the virtual DMA-heap device node.
> I'll start with a few high-level comments/questions:
>
> - Instead of tying drivers to heaps, have you considered a system where
>    a driver would expose constraints, and a heap would then be selected
>    based on those constraints ? A tight coupling between heaps and
>    drivers means downstream patches to drivers in order to use
>    vendor-specific heaps, that sounds painful.

I was wondering the same thing as well, but came to the conclusion that 
just the other way around is the less painful approach.

The problem is that there are so many driver specific constrains that I 
don't even know where to start from.

>    A constraint-based system would also, I think, be easier to extend
>    with additional constraints in the future.
>
> - I assume some drivers will be able to support multiple heaps. How do
>    you envision this being implemented ?

I don't really see an use case for this.

We do have some drivers which say: for this use case you can use 
whatever you want, but for that use case you need to use specific memory 
(scan out on GPUs for example works like this).

But those specific use cases are exactly that, very specific. And 
exposing all the constrains for them inside a kernel UAPI is a futile 
effort (at least for the GPU scan out case). In those situations it's 
just better to have the allocator in userspace deal with device specific 
stuff.

What I want to do is to separate the problem. The kernel only provides 
the information where to allocate from, figuring out the details like 
how many bytes, which format, plane layout etc.. is still the job of 
userspace.

What we do have is compatibility between heaps. E.g. a CMA heap is 
usually compatible with the system heap or might even be a subset of 
another CMA heap. But I wanted to add that as next step to the heaps 
framework itself.

> - Devices could have different constraints based on particular
>    configurations. For instance, a device may require specific memory
>    layout for multi-planar YUV formats only (as in allocating the Y and C
>    planes of NV12 from different memory banks). A dynamic API may thus be
>    needed (but may also be very painful to use from userspace).

Uff, good to know. But I'm not sure how to expose stuff like that.

>> What's still missing is certainly matching userspace for this since I
>> wanted to discuss the initial kernel approach first.
> https://git.libcamera.org/libcamera/libcamera.git/ would be a good place
> to prototype userspace support :-)

Thanks for the pointer and the review,
Christian.

>
>> Please take a look and comment.
>>
>> Thanks,
>> Christian.
>>
>> [1] https://lore.kernel.org/all/11a6f97c-e45f-f24b-8a73-48d5a388a2cc@gmail.com/T/

