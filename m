Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F4F59A9C7
	for <lists+dri-devel@lfdr.de>; Sat, 20 Aug 2022 02:11:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8196C10E055;
	Sat, 20 Aug 2022 00:11:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2063.outbound.protection.outlook.com [40.107.93.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB26410E055
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Aug 2022 00:10:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IHiYa16LNX+K74mt925fRLFW7RvPQOlyu7jgeuTS/CiJ/HPq7vFerP7nuPjyfUVtgIduzXDUsru9wXCRj65OXYtKoVxG0DJ7qZUFs396kFwBeXTpaRiE+g36EeZmgxvXjC4afUsKGpr8vjonFd45yaNvMeXVoxXLkIV28d9a93RJdGq2PVcEXuqFRhYoF1WiXDcSgUBPM7qgDU8gp3kZLEM8XazrKLP7Gl/2BLa2oqRG5UvnBPtJd6NmVY6Fjt8dkBOU4GgagakCyxFwq4k5UcFqL7CLMSxsfWmkrXbnCKHwt5DoX2Kjnq+14h7pqc2//8OZWw1dRj8fXbJSHBBaVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8SgBpI88XZdgOUILSVXatK9tjCvJhYeRwXV0+YP4/zc=;
 b=SeWwQqXyBI2kZMjW+yMpLR7E1t3mQGT8wRS0wz6pm+QvMjAGVC/8s9kJOsw5Eslz1Zqds1qTr2RfdHL57+gySGZP5RmntzEVf03WYlnTK63u2xtAkSiOJblMf8xK2q5mWcoPZNRXOea8glAONxiVs7QdDW9Nf1ogyNGbKqWAkyskpAHVz3IuF+K7uZ1b8kLJPycpEI7wT1eNA3BXyTXqg9/7H2k7B2rLXOEnqvrXMcj9vXLq/iiGMMOXcohXlIjve8KP6DLEHj754EScSUzUjJVu66TvUyTVwtBvdYDUIoNSUFjna0/bQxWDUPjNgd0CgLrMPvvhQjhgK362dpfvTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8SgBpI88XZdgOUILSVXatK9tjCvJhYeRwXV0+YP4/zc=;
 b=ZAABbRanhLaItnc4CifncoKYKYOhomR3izuYLn+jyVFwZZshRuj/pSzzvkTL+fGFGhs8LopePxK24IE0eLHUK1QYE5cw8L2G1PNbDCZlxVTqPjI09aOUKASAyuvIxsJvrqGGNOncbYqinAIZWz7UUKnOB/2cW1k64AIFaUlZdF8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by PH0PR03MB6953.namprd03.prod.outlook.com (2603:10b6:510:170::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Sat, 20 Aug
 2022 00:10:52 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::c832:eea0:1883:a19c]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::c832:eea0:1883:a19c%3]) with mapi id 15.20.5546.016; Sat, 20 Aug 2022
 00:10:51 +0000
Message-ID: <1f926989-eb13-14ee-e30d-ac6d01b86c52@synaptics.com>
Date: Sat, 20 Aug 2022 08:10:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/2] [WIP]: media: Add Synaptics compressed tiled format
Content-Language: en-US
To: Nicolas Dufresne <nicolas@ndufresne.ca>
References: <20220808162750.828001-1-randy.li@synaptics.com>
 <20220808162750.828001-3-randy.li@synaptics.com>
 <CAAFQd5AKjpJ+fPAeCqdNnJbS4R7SdaHkfyW4qG1xXr-sE801pQ@mail.gmail.com>
 <13d37c15-79f3-4e16-8cf4-fc37846f4a04@synaptics.com>
 <Yv7HnHE7bLmgq5D0@pendragon.ideasonboard.com>
 <6da7faf329128312f0862f555d1a855437ae99f3.camel@ndufresne.ca>
 <50dd9b7a-8f48-0799-57f6-048d20de8dcc@synaptics.com>
 <2662ac698898f71f60b9b7e0ad4703854de1d012.camel@ndufresne.ca>
From: Hsia-Jun Li <Randy.Li@synaptics.com>
In-Reply-To: <2662ac698898f71f60b9b7e0ad4703854de1d012.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR17CA0044.namprd17.prod.outlook.com
 (2603:10b6:a03:167::21) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ebb44ff-fff7-413d-3a86-08da8240712d
X-MS-TrafficTypeDiagnostic: PH0PR03MB6953:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /8uMFsRFwThqTOB1jTMlZSmW8pyEm/Os2/0G8p8bbYAOoG+bQk7hFZq7nvnOQ+7ZWT/GJc/KF6T9maizkfxxqjuHyrbExkWZrSV8TskDFAYQL8/RC8RJkjbsKcsHWWA7fvSJ37nm/ZgbGAw7fgeNGGYJ6d0jzAnbno96y/B4zk/pJ8RHBV93sNbdFJRb2V2xSpEPpCvTb6nQ3g8VlWWMSb9q2NHAF/APyFD1zVt5zMRrAyJu2wIMQYQ0EofuHycd0Ro70+B6CDxoul+rg39qipC3XoawAukp14YPB6avrrWzTxqbSL7WhmmWLlm/cWOfVIn4ARuDDDD1dn4MVHAvb1Fe0wWj0S/jgqmI9vk+L8oaM/pBv8OzR+oqelSNJijteUNUq3/2SHK/4ouBsg/JYF6jcgaxpw5X2/2NEerXYzx6ADd00HijTepA/SChwD7GrzvZCA06rsLf8xkZrt5EWE5KXyPDzrkboYbkGqj0JkpM3FOxYt48Gg4FiKT9OJkcWVoh1qqldOOurKXEgfniLXEak/8zQtVLYClpCcSY2Fu2vAQvzouVxcMbJv4Kl0r71UpO97vL6D3IgTPdU24R6kt52+UzXMymrX0RazOCov+Zd90UdS+zawF1nk94pwa3TLFX11PG5loGZHeUa5104OgCDxm8tUSbot3TVf7H/CFWQiKhHoW0s44OAAr/d4UV99UGXZFDZh7yjCRIAEBZBRhYW19DQ6B0VqxxD9wVPDI34Tkwiu1ptjy5f+b9E938pjtybWW9+wb1voUvE+DVle5aI70XgvIUA7JovvUjof7dx7eSIeOfMHBMOO3ucbY6QLeq3qeiu/zM6Gy7u9opt9Ual63V8bncReYcjbJbP3s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5196.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(376002)(396003)(39850400004)(346002)(366004)(41300700001)(83380400001)(6506007)(478600001)(6486002)(6512007)(966005)(38350700002)(38100700002)(86362001)(2906002)(186003)(52116002)(53546011)(31696002)(6666004)(5660300002)(8936002)(7416002)(26005)(4326008)(66574015)(66946007)(66556008)(66476007)(31686004)(6916009)(316002)(8676002)(2616005)(54906003)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFNDRjU3bExnemlrMklHa3BCK0pKaFZXQ21BTEpwMU4vQzBmK1lsSUJ2MWtX?=
 =?utf-8?B?c2VGcG1zWlEwVXlRTlhBZ0xOYW9wcEhMd3UzcE84VDN0Vm5CSUttYlRLdHFZ?=
 =?utf-8?B?OXphdEFDcVVNSE8wQkpvNmdWVnR6dllhSUlaRFhYNisrUG9ac1N4NkxIajRy?=
 =?utf-8?B?eFR2WExNSXcxUUxtSG56TlhjNkJIQjhDd1lIMWVXalpUZlY5MVNSRkVadG12?=
 =?utf-8?B?Wm9GRi81Rjd5QW4wNW1WMU1pSDd6NHhoZ2crSVRiQ00zUExZR3ZFQTRUZkdu?=
 =?utf-8?B?dE5yNHQxYk13K3J2U1JYMlBCSkdLUnY2ZDE0UDB3RllvZ1ZOamdtR3hPKy9B?=
 =?utf-8?B?R3RkanhrZHR5R2w4NjV0TUFranQ0YU0wM3NzdjJsK0dZd1haejdxTE5ielRw?=
 =?utf-8?B?MGhPWFZiUGZ2VWFtTWJrV2pTcDk0UGpXY3pKQnFGWXlNUEFyVStoVEkxOGNO?=
 =?utf-8?B?ODA5dGRaWUo5U0lhNjVIVXpDUTYvYmZScHZzMlZUOUI1S3NOaWFzeitORnRG?=
 =?utf-8?B?M25DaW9sZUJLVCtuRW1qNWxZWG1TQVROTktVY0NhbHpFUHJtZks2VjZSVWc4?=
 =?utf-8?B?TUVJSXNZOUxsYm5DRCtRZHlaS2luTGpOMjNkbTJqWkdmZ0lnQXdlRnBDSktX?=
 =?utf-8?B?WHhla2tFTnVYQVZSR1QrYW1nd3o2U3cyT2NkQ0lIVnd1cHdkTXhjTi9NbDFJ?=
 =?utf-8?B?S2EzWUg0MEpEY2Z1R3NlOGJzd29TdVRONGlWN3gxMzkxT3RWTWVVNkdyYWlq?=
 =?utf-8?B?WGZVSm9kM2RYTitsVWRXTjdhNW1vRWpWTEdTcUoxaUV1cEhDYTBENlNJRUJl?=
 =?utf-8?B?MVY3WkdpQ0gzUmVEOFV4MCttdlJjbFV0OEp3c0VjTDhaYnlVdm84cktyL21r?=
 =?utf-8?B?TTR2RXVMb1M5N2M0eC8wazFtckVmTzVLV0FDQkQ4Y3JLOEdueDg0RksrR1JS?=
 =?utf-8?B?czlJYkhNVDhta3hVOU9FRzVFcXNzTVFVWjBsMWd1SUJ4d25hZkEzcUd1WnRG?=
 =?utf-8?B?ZnpGS1ZkL0N4bnpDcWNpN0dFa0VyMW51L0JvQ243OExSZ1JNUi9URXBvejQw?=
 =?utf-8?B?VXloK0NibW81djRJblFSN0t0V0hUOTlDWUR1NEh6QXlXcTdOZ05rUVFsV1Uv?=
 =?utf-8?B?ZWZHRDVVcFRaUUFCYi9DTXViYWMxVmhvUit6UGYxMUxHODhtMDdvRE9yUmhm?=
 =?utf-8?B?bGhXQWNnZnN6R2tTdXBNSmZGbnpHLzNnY3hhUStuUFZJOE5jWnFyZDYzdjVu?=
 =?utf-8?B?YTk1U2d1MTd3L09FUVFJUzRkNktzbjdoN2xpZzNFTjdCS290RG9kQ05JUzUz?=
 =?utf-8?B?T1E0Q1hyOVVoU2p1dWVCVElCU2pDQUN2SHlkaUtPRm9DT01PWGx0MklNVC9V?=
 =?utf-8?B?TzZvbkpZZ0V2TkVtYnFrTlhLN1pkYmFzaEFrdmoxOHlqY0JjOEFyTzY1OEpW?=
 =?utf-8?B?bk1OOXBwYW5mN25WQUM4Skk2YkxCL0NVbllzWVc4WHpYUmZyZkJwbUE5NmxE?=
 =?utf-8?B?bkhhZ05KRldxalJ3QnFKVjlBZ1FqY0NXdGM4YjAzVEQ0RklObUtMS3JBTU9P?=
 =?utf-8?B?b09uSXVkZnpSemUyMUxvemQxZUdLdkRLaFcrNXA4ck5IK0M5MFg5S1dOUnhM?=
 =?utf-8?B?T2VTMjN5bEh4bTdJK3orZU1uS0pHNU9CQlNUOVFjSDFmMmxnSWphL1BHMHYz?=
 =?utf-8?B?Q2pQdjJDYWdVVFEvZzFvQlZEbVUveW1vSEpGa2k2SFM5bWMwRTMvWFY4VzAy?=
 =?utf-8?B?Nm1jd3Nsc0xobHg1ZWg2d05WNWNPUUNxbmlMOUNMZ0dESS9LL210eGNHakNG?=
 =?utf-8?B?NmducXA2LzNlaDcrb1gzaFREb21scW9UZ01PSGVyQXprMm1MVWNqUDBadTNB?=
 =?utf-8?B?SWMxemh2cVd0V01zVURVeGlIS3hBR2R3Z2d1RDBHOFFsc08wNjQ2SndMdFJ4?=
 =?utf-8?B?WjA4blJuQ3V0MmVTcTg5Ykh2M00xTWRBWlNMZ0J6RTJOc0QvNlpzNmdQbEdT?=
 =?utf-8?B?MHZKenBadFM0cUdyZzRnUVZOZTNyY3k0SjNFa2NvbkFDb0JidWRkekkraHQz?=
 =?utf-8?B?a1dCRlAxdEl3Z0plT005L3NlNFhuakN4N0prRC83RkpGY3dydURPUUVFSWQw?=
 =?utf-8?Q?H9yrbdKnLY1h3MJ9jrSYUnlXV?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ebb44ff-fff7-413d-3a86-08da8240712d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2022 00:10:51.6840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LQWiizzDyrAAE3WAzCA3faIWQwM0E8Q/bvwBBsQqFtrdk40c5k154Wbph3ZRF467Vieb/Q3dwbjI4nRUBMkABg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6953
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
Cc: linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 sebastian.hesselbarth@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, ribalda@chromium.org,
 linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
 jszhang@kernel.org, ezequiel@vanguardiasur.com.ar
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/20/22 03:17, Nicolas Dufresne wrote:
> CAUTION: Email originated externally, do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> 
> Le vendredi 19 août 2022 à 23:44 +0800, Hsia-Jun Li a écrit :
>>
>> On 8/19/22 23:28, Nicolas Dufresne wrote:
>>> CAUTION: Email originated externally, do not click links or open attachments unless you recognize the sender and know the content is safe.
>>>
>>>
>>> Le vendredi 19 août 2022 à 02:13 +0300, Laurent Pinchart a écrit :
>>>> On Thu, Aug 18, 2022 at 02:33:42PM +0800, Hsia-Jun Li wrote:
>>>>> On 8/18/22 14:06, Tomasz Figa wrote:
>>>>>> On Tue, Aug 9, 2022 at 1:28 AM Hsia-Jun Li <randy.li@synaptics.com> wrote:
>>>>>>>
>>>>>>> From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>
>>>>>>>
>>>>>>> The most of detail has been written in the drm.
>>>>
>>>> This patch still needs a description of the format, which should go to
>>>> Documentation/userspace-api/media/v4l/.
>>>>
>>>>>>> Please notice that the tiled formats here request
>>>>>>> one more plane for storing the motion vector metadata.
>>>>>>> This buffer won't be compressed, so you can't append
>>>>>>> it to luma or chroma plane.
>>>>>>
>>>>>> Does the motion vector buffer need to be exposed to userspace? Is the
>>>>>> decoder stateless (requires userspace to specify the reference frames)
>>>>>> or stateful (manages the entire decoding process internally)?
>>>>>
>>>>> No, users don't need to access them at all. Just they need a different
>>>>> dma-heap.
>>>>>
>>>>> You would only get the stateful version of both encoder and decoder.
>>>>
>>>> Shouldn't the motion vectors be stored in a separate V4L2 buffer,
>>>> submitted through a different queue then ?
>>>
>>> Imho, I believe these should be invisible to users and pooled separately to
>>> reduce the overhead. The number of reference is usually lower then the number of
>>> allocated display buffers.
>>>
>> You can't. The motion vector buffer can't share with the luma and chroma
>> data planes, nor the data plane for the compression meta data.
>>
>> You could consider this as a security requirement(the memory region for
>> the MV could only be accessed by the decoder) or hardware limitation.
>>
>> It is also not very easy to manage such a large buffer that would change
>> when the resolution changed.
> 
> Your argument are just aiming toward the fact that you should not let the user
> allocate these in the first place. They should not be bound to the v4l2 buffer.
> Allocate these in your driver, and leave to your user the pixel buffer (and
> compress meta) allocation work.
> 
What I want to say is that userspace could allocate buffers then make 
the v4l2 decoder import these buffers, but each planes should come from 
the right DMA-heaps. Usually the userspace would know better the memory 
occupation, it would bring some flexibility here.

Currently, they are another thing bothers me, I need to allocate a small 
piece of memory(less than 128KiB) as the compression metadata buffers as 
I mentioned here. And these pieces of memory should be located in a 
small region, or the performance could be badly hurt, besides, we don't 
support IOMMU for this kind of data.

Any idea about assign a small piece of memory from a pre-allocated 
memory or select region(I don't think I could reserve them in a 
DMA-heap) for a plane in the MMAP type buffer ?

Besides, I am not very satisfied with the dynamic resolution change 
steps if I understand it correct. Buffers reallocation should happen 
when we receive the event not until the drain is done. A resolution 
rising is very common when you are playing a network stream, it would be 
better that the decoder decided how many buffers it need for the 
previous sequence while the userspace could reallocate the reset of 
buffers in the CAPTURE queue.
> Other driver handle this just fine, if your v4l2 driver implement the v4l2
> resolution change mechanism, is should be very simple to manage.
> 
>>>>
>>>>>>> Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
>>>>>>> ---
>>>>>>>     drivers/media/v4l2-core/v4l2-common.c | 1 +
>>>>>>>     drivers/media/v4l2-core/v4l2-ioctl.c  | 2 ++
>>>>>>>     include/uapi/linux/videodev2.h        | 2 ++
>>>>>>>     3 files changed, 5 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
>>>>>>> index e0fbe6ba4b6c..f645278b3055 100644
>>>>>>> --- a/drivers/media/v4l2-core/v4l2-common.c
>>>>>>> +++ b/drivers/media/v4l2-core/v4l2-common.c
>>>>>>> @@ -314,6 +314,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
>>>>>>>                    { .format = V4L2_PIX_FMT_SGBRG12,       .pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
>>>>>>>                    { .format = V4L2_PIX_FMT_SGRBG12,       .pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
>>>>>>>                    { .format = V4L2_PIX_FMT_SRGGB12,       .pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
>>>>>>> +               { .format = V4L2_PIX_FMT_NV12M_V4H1C, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 5, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 2, .block_w = { 128, 128 }, .block_h = { 128, 128 } },
>>>>>>>            };
>>>>>>>            unsigned int i;
>>>>>>>
>>>>>>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>>>>>>> index e6fd355a2e92..8f65964aff08 100644
>>>>>>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>>>>>>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>>>>>>> @@ -1497,6 +1497,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>>>>>>>                    case V4L2_PIX_FMT_MT21C:        descr = "Mediatek Compressed Format"; break;
>>>>>>>                    case V4L2_PIX_FMT_QC08C:        descr = "QCOM Compressed 8-bit Format"; break;
>>>>>>>                    case V4L2_PIX_FMT_QC10C:        descr = "QCOM Compressed 10-bit Format"; break;
>>>>>>> +               case V4L2_PIX_FMT_NV12M_V4H1C:  descr = "Synaptics Compressed 8-bit tiled Format";break;
>>>>>>> +               case V4L2_PIX_FMT_NV12M_10_V4H3P8C:     descr = "Synaptics Compressed 10-bit tiled Format";break;
>>>>>>>                    default:
>>>>>>>                            if (fmt->description[0])
>>>>>>>                                    return;
>>>>>>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>>>>>>> index 01e630f2ec78..7e928cb69e7c 100644
>>>>>>> --- a/include/uapi/linux/videodev2.h
>>>>>>> +++ b/include/uapi/linux/videodev2.h
>>>>>>> @@ -661,6 +661,8 @@ struct v4l2_pix_format {
>>>>>>>     #define V4L2_PIX_FMT_NV12MT_16X16 v4l2_fourcc('V', 'M', '1', '2') /* 12  Y/CbCr 4:2:0 16x16 tiles */
>>>>>>>     #define V4L2_PIX_FMT_NV12M_8L128      v4l2_fourcc('N', 'A', '1', '2') /* Y/CbCr 4:2:0 8x128 tiles */
>>>>>>>     #define V4L2_PIX_FMT_NV12M_10BE_8L128 v4l2_fourcc_be('N', 'T', '1', '2') /* Y/CbCr 4:2:0 10-bit 8x128 tiles */
>>>>>>> +#define V4L2_PIX_FMT_NV12M_V4H1C v4l2_fourcc('S', 'Y', '1', '2')   /* 12  Y/CbCr 4:2:0 tiles */
>>>>>>> +#define V4L2_PIX_FMT_NV12M_10_V4H3P8C v4l2_fourcc('S', 'Y', '1', '0')   /* 12  Y/CbCr 4:2:0 10-bits tiles */
>>>>>>>
>>>>>>>     /* Bayer formats - see https://urldefense.proofpoint.com/v2/url?u=http-3A__www.siliconimaging.com_RGB-2520Bayer.htm&d=DwIFaQ&c=7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0UY&r=P4xb2_7biqBxD4LGGPrSV6j-jf3C3xlR7PXU-mLTeZE&m=lkQiuhx0yMAYHGcW-0WaHlF3e2etMHsu-FoNIBdZILGH6FPigwSAmel2vAdcVLkp&s=JKsBzpb_3u9xv52MaMuT4U3T1pPqcObYkpHDBxvcx_4&e=   */
>>>>>>>     #define V4L2_PIX_FMT_SBGGR8  v4l2_fourcc('B', 'A', '8', '1') /*  8  BGBG.. GRGR.. */
>>>>
>>>
>>
> 

-- 
Hsia-Jun(Randy) Li
