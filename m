Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA0358BBF3
	for <lists+dri-devel@lfdr.de>; Sun,  7 Aug 2022 19:15:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E6E10E355;
	Sun,  7 Aug 2022 17:14:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2068.outbound.protection.outlook.com [40.107.101.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A6BB10E2AE;
 Sun,  7 Aug 2022 17:14:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bNi0ma+mu8CMkVmhzpz20iIhJk90GjURe1L5bkUX/MF2V5fZB1NVKxuhUkSUvNyvKQtQBJ1bhDn8TTjrazv4zcge0ImcJ1I7mcj8DRdMLPl6rCdwhp8AI5merYasDSUK+DMC6xAQ27vHSMOne88ZnRed4Y2owQKv5gq6dkKyCim1duJJ+Y0kQR5BAG7ZH6oEgPEO1ouYLmtzROPy6eGeXWOA+PgKP1WHzpANXQpELmFlUpclmstHNiab+AfzvHuCVBMHjjJI5WaTWwFeKrg3fzPCtJh7SL5OOv90gOuZ0oQq0SjEHJB4UDrgLESQ3/RFgxLarkq5myXn3ZEQ0CqxeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oG2k+mkRaPtAaLPE7WgdHy53dcRhS5z+rzU8gkd9BMQ=;
 b=SIqmRl6XJO2dmUrXffobJhgA81UPJ86w0EPfOK1tQMCqukbhAaRjgzcZLLbdGtS03L2z33JMF3UUxgiFvan24ISRyNFMX3elg7K4GQ/Qigu3XMbSIXm1y0OrV4EFhy8D4y2/XvbEzDQRnoZTapsWqOg0v3Ax6JJzSN1AkPXOBlL9mVTmD/7b2j2JpYrBxGI/wpKgrWvhxJt2a2N93acZQpoTthw8Gdmvz2S1gbUu0NvklE6WFoOV+zLw3x+uGW1kNJJR8y67BCX7GjVl4PloQS5+zBnSJREA7oDwvPFoLFaO+ly0ZYg0Vi3ERtrd85T3eKD1KA1G/qij8rzUt2JPmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oG2k+mkRaPtAaLPE7WgdHy53dcRhS5z+rzU8gkd9BMQ=;
 b=Fm4PiRwJWW1b5USqQm/GJVwlwHiu3bG2qWtGyxvOpXwhdOgNySWGzWcyQB+gG/Vvc0ZgbeePO1bkVXtzp18Gp+doE4f17zO27e9IA596+GSIO/WWdR4LBjhzckeLGdxRMNGqHtj16yArGbel2C5793G1447XZGeetNhsx8DPdi4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ0PR12MB6880.namprd12.prod.outlook.com (2603:10b6:a03:485::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Sun, 7 Aug
 2022 17:14:49 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5504.019; Sun, 7 Aug 2022
 17:14:49 +0000
Message-ID: <973de2f8-75e4-d4c7-a13a-c541a6cf7c77@amd.com>
Date: Sun, 7 Aug 2022 19:14:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [Linaro-mm-sig] [PATCH 1/3] dma-buf: Add ioctl to query mmap info
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20220729170744.1301044-1-robdclark@gmail.com>
 <20220729170744.1301044-2-robdclark@gmail.com>
 <3d2083aa-fc6c-6875-3daf-e5abe45fb762@gmail.com>
 <CAF6AEGvKdM3vyCvBZK=ZcdGmak7tsrP1b8ANyyaMjVfNDViqyw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAF6AEGvKdM3vyCvBZK=ZcdGmak7tsrP1b8ANyyaMjVfNDViqyw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0126.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::6) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 001f63e6-d9f6-4b24-35c4-08da78985580
X-MS-TrafficTypeDiagnostic: SJ0PR12MB6880:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FQDOkYKOzVVpy1HqW8Mwmd/3Lni/i0W12yhqJao6Gp3rcaXOpukRAzJqI1KxNtBQ1VHL2JcbsYz8etcggLq7mRgvP5KINkJ1c3v/oSC2URSLvyO1jCmvDRO9d6+98gnyyTG8YNK2walze4zRPYOAfVEZjGQJDtzPBe9XTD4/0IIrpu6dBh6tST2p9fCSoGA5aL+SAU/Gc7Y5aLeuehO/AFn1qSGpfnSFXpYzaf1Z7YVgESyfL2a+CY3zVl8e4cOKriKZSl2BzbB/0H+37SAl+jNwlO3fUd62MMMiIvbaaatSaNnNz58Igsj+0y+qbvx4JG/sBAUcgZiD0rNo5vp2gUrlGPBD0CPTqO9ijmolmSzpyC/5q/upMiNYBq0PGIBKzRh197jLYmwQN5vzEDcGNDf6pNveYmS74LxW/KAMCoMhpff7BTh+dgL9v3ws/rhr+O0ThtXeqQUsaKEeWhH5zTRxifQvYT2PM6TR7BkU4zCH1P93Oxhzq6NQMYpkCoQ+DlAV8M/c/cLFlpCCqdcUytTvg6hRWTcZnqxYR/etT62P3yO9BDgdanXBEkEInVWHWfphGH+CsHn93RZphYPuDwm6OULzv4A5uRaX8HjC70T2jUlpN7NkY893GjEW2eTyktRkWGz2mXgQMevVdbjgmcEFdinjK/fTCwgWUVCNRHxZrGOvPGUHA3UXsfu47oETcGm1VW052htlEk8Z5trpwHjnoKgzUptl2Cz/JFtV7EYJO+7YlB4MnBH69RpDgh4OvLGXv4MFjsslt8RV10DIcnDPZBN727cAk2Qk9BHjiwgu6QOuO00+R9/x+azLxLodoFIpdHxIYQ8rIGW2NZC1kA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(39860400002)(366004)(136003)(346002)(396003)(8936002)(31686004)(5660300002)(7416002)(66556008)(8676002)(66946007)(66476007)(4326008)(2906002)(316002)(54906003)(6486002)(478600001)(36756003)(110136005)(38100700002)(41300700001)(31696002)(53546011)(6666004)(2616005)(86362001)(6512007)(6506007)(66574015)(186003)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzZqWXhKOG9LZGdXRWVKam1PTE1rNzFQZG9KS2UwWkdsZE02MUh2MjliZTcr?=
 =?utf-8?B?clVUcUNDb2hTUlJ6ZytPbWRJRkxYOW5laVhNenQ3Ylc1b0tPRFZYekFZV2g4?=
 =?utf-8?B?L2ljWVM4LzRzZXNTeG4ycWRKWHpyL1l4Sk1COVQ1RWhpTEo2aTk1cTJyL1Ex?=
 =?utf-8?B?SFN2b2NuMjZTZFJmN3NIbVR2UjltVTRUNWpsZmhCeTRSbW1GeDNEaDNvK1ZU?=
 =?utf-8?B?TyttRS9yVTUxRE1venIzR1ZxenFsRDdHTXVyNmNYRGpVVVQyWGJyQWJzenVa?=
 =?utf-8?B?NGsxWlpuK1Y3Wmo2Yk9OYkFXZjBneUtjVjJxTElVUGcrWTN1cHZRNG9kL1p3?=
 =?utf-8?B?YndzcG5VMFBITS8vSElqRTRYZk9hSHZFeWk1RTJVWW1wZCtXRG8zb3BvemJy?=
 =?utf-8?B?R1R3MmE1T0FVb2E5RFUzM09HRVFFOStqSzJjdHd0UCszRUhQMmM0eGxEa0kr?=
 =?utf-8?B?RzNCaDZ0OHZjRXRrTStualVUVitKMTVWNlFBeFduVXZEN3RUdncwdC81NVBH?=
 =?utf-8?B?WkhwNjUxckZZQURIbjBkanpQRjNQRkJqeDJwaU92UWVGbjRsU0NvbFluTFdG?=
 =?utf-8?B?a25hT1c3SVhFa2VYUVlCakxFK3ZoM1VjTFEweWpGYi9MeEtIOVFPLy80QWpN?=
 =?utf-8?B?Y0pzczBmQWQzdEJMc1ZKT1dlcXVEdXJrUG40SC8xUTJiK0xDdTdZaUVpSnVF?=
 =?utf-8?B?ekFqUlFwL09RRWVDNm1HZW81OUU3NSttSTE1cUlRYys1TlhSZ1FkUnBFVEMw?=
 =?utf-8?B?RmVwRnBUZ2V0ODVxdlRsVXN2VWFZVnNubWR4eW1FME5GQjhLSk1MRytpMXVL?=
 =?utf-8?B?SVlrQm01Y0k0YzBjMzQ4aUlTYmYwY1pQQ2xjSmJZU1VKOElkcFU5L0E4clVz?=
 =?utf-8?B?aHRFOEc4QU1ETXBMczNiMnNiUUVqQTFhRWFxUDlFalVZRW5NL20xZ0UzbXRn?=
 =?utf-8?B?am8xZEk4M3cxWVFacmVVM3ZnZjV5cy9McHEzNjFWZGJHd0cxUms2MFNPMmFJ?=
 =?utf-8?B?U25HY3hzajNDelR1OU9hT3ZIMk0rWldSeDhMT3E0MG5nbDZwZkEySENNOFJW?=
 =?utf-8?B?MzBXaHdvSzJhS3hjMW9ScCs5WXY4WTVxbGZPUWRDNjNiSlcvZzVkV0Zxa3l4?=
 =?utf-8?B?c1Exd1dka1IyZnVSMHpRZENKU1RkWnc1S3B5ejBWSG1mZW1mKzRDUS90SVhj?=
 =?utf-8?B?alFJdldKclR6SDNQR256bVh2ZDRYR0hOd25JSndYamYyMXgxYjFOOGpDT2xR?=
 =?utf-8?B?dWNQUUFtdkJIZVRHUHVBMjBpK1B6WkR5WHI4RHNoUEdvV2tkNHFkNDh1Z2lK?=
 =?utf-8?B?RXNQTjV5cmFnUkJ1N2VUQjFrY29QUFh0ZEd0QzZ6ZnI0MFVublc1L2JMcW9S?=
 =?utf-8?B?NEZjYWRHTEJ4b1JYWXgyYUNNbHF2citOWTJuNkdUOSsxaGdzd0dpVUdmS2dU?=
 =?utf-8?B?ZmpUVnJwbVN1NkpwL3pzUWNXTmM4S0doT0h3UFhRMG9DQi9XVjNGVUJiZlZ2?=
 =?utf-8?B?VitSNDE5aUJXN1RDQVlXVUpoMkluUVM3NGd0OG0zL2NUZ0VscTU2OVczQzRX?=
 =?utf-8?B?VWFnN2s3Z2xodm5NMzlnNzJ5Nml3ZG96Rlp0WFJ0a0FSb3hsbDdhY3dqcFFS?=
 =?utf-8?B?bDBBUVAzQ2VvYWRUZFdIY2hWOG9XQWlNd1plbmdiNTB0eXoyNS90N1lkU1Vs?=
 =?utf-8?B?RlJPZmk5OElFZEdEcU42aHVvUnpTZG16eGN0UENMalY3SGlMdnpOZVBXME8z?=
 =?utf-8?B?SXdVbnJqWGFWQ2VhbEVXalhBOVFDSFIzdmFmNk1VclNXbGplYzA2aDM5MWtH?=
 =?utf-8?B?ODFVOSttRVc2bGxXYzNwT3hLVlgvRFNXc3IrbDVjdTBCd2paajk1RVpCa05n?=
 =?utf-8?B?K0NjeUwxTGY4SU45Ymg1dmZKdVNZTHFVSmtxelI0L1RZOTVOcUtuMEVEWDlp?=
 =?utf-8?B?QURaeFRrTnZLdGhXSUI2cWdyYTBETklCMTN3QU5pU3hDZEpuaGJOUEdHWkkw?=
 =?utf-8?B?cDFDL1FRdDRaMHA3WU1FSGs3V2RkWUF0ckpFMDJZUW9GYm1GMkpWNU9sNUZO?=
 =?utf-8?B?bHpzaURZM1d6WGk1QjBtTkVVM3g4eGlBY2F2N1NUMmY1SSt3ODV6ZXNPZ3c5?=
 =?utf-8?B?cDRiNXdhVVRkRzdzNzlPcjgzbEdCZHBxSjRyV0dCUVhvNjZlc3RMRWs0M2tO?=
 =?utf-8?Q?T7HsfV8jR37iOqVv/XB/zznzoD3g6hrKgeChxzNeaVlV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 001f63e6-d9f6-4b24-35c4-08da78985580
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2022 17:14:49.2580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BVwbSz6Gc7Yxf9/dPywXzbNJ+TrIp7xnnwAW/NBXah38lnngQTsGNTQVdSctpLCw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6880
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
Cc: Rob Clark <robdclark@chromium.org>,
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 freedreno@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.08.22 um 19:02 schrieb Rob Clark:
> On Sun, Aug 7, 2022 at 9:09 AM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Am 29.07.22 um 19:07 schrieb Rob Clark:
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> This is a fairly narrowly focused interface, providing a way for a VMM
>>> in userspace to tell the guest kernel what pgprot settings to use when
>>> mapping a buffer to guest userspace.
>>>
>>> For buffers that get mapped into guest userspace, virglrenderer returns
>>> a dma-buf fd to the VMM (crosvm or qemu).
>> Wow, wait a second. Who is giving whom the DMA-buf fd here?
> Not sure I understand the question.. the dma-buf fd could come from
> EGL_MESA_image_dma_buf_export, gbm, or similar.
>
>> My last status was that this design was illegal and couldn't be
>> implemented because it requires internal knowledge only the exporting
>> driver can have.
> This ioctl provides that information from the exporting driver so that
> a VMM doesn't have to make assumptions ;-)

And exactly that was NAKed the last time it came up. Only the exporting 
driver is allowed to mmap() the DMA-buf into the guest.

This way you also don't need to transport any caching information anywhere.

> Currently crosvm assumes if (drivername == "i915") then it is a cached
> mapping, otherwise it is wc.  I'm trying to find a way to fix this.
> Suggestions welcome, but because of how mapping to a guest VM works, a
> VMM is a somewhat special case where this information is needed in
> userspace.

Ok that leaves me completely puzzled. How does that work in the first place?

In other words how does the mapping into the guest page tables happen?

Regards,
Christian.

>
> BR,
> -R
>
>> @Daniel has anything changed on that is or my status still valid?
>>
>> Regards,
>> Christian.
>>
>>>     In addition to mapping the
>>> pages into the guest VM, it needs to report to drm/virtio in the guest
>>> the cache settings to use for guest userspace.  In particular, on some
>>> architectures, creating aliased mappings with different cache attributes
>>> is frowned upon, so it is important that the guest mappings have the
>>> same cache attributes as any potential host mappings.
>>>
>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>> ---
>>>    drivers/dma-buf/dma-buf.c    | 26 ++++++++++++++++++++++++++
>>>    include/linux/dma-buf.h      |  7 +++++++
>>>    include/uapi/linux/dma-buf.h | 28 ++++++++++++++++++++++++++++
>>>    3 files changed, 61 insertions(+)
>>>
>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>>> index 32f55640890c..d02d6c2a3b49 100644
>>> --- a/drivers/dma-buf/dma-buf.c
>>> +++ b/drivers/dma-buf/dma-buf.c
>>> @@ -326,6 +326,29 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
>>>        return 0;
>>>    }
>>>
>>> +static long dma_buf_info(struct dma_buf *dmabuf, const void __user *uarg)
>>> +{
>>> +     struct dma_buf_info arg;
>>> +
>>> +     if (copy_from_user(&arg, uarg, sizeof(arg)))
>>> +             return -EFAULT;
>>> +
>>> +     switch (arg.param) {
>>> +     case DMA_BUF_INFO_VM_PROT:
>>> +             if (!dmabuf->ops->mmap_info)
>>> +                     return -ENOSYS;
>>> +             arg.value = dmabuf->ops->mmap_info(dmabuf);
>>> +             break;
>>> +     default:
>>> +             return -EINVAL;
>>> +     }
>>> +
>>> +     if (copy_to_user(uarg, &arg, sizeof(arg)))
>>> +             return -EFAULT;
>>> +
>>> +     return 0;
>>> +}
>>> +
>>>    static long dma_buf_ioctl(struct file *file,
>>>                          unsigned int cmd, unsigned long arg)
>>>    {
>>> @@ -369,6 +392,9 @@ static long dma_buf_ioctl(struct file *file,
>>>        case DMA_BUF_SET_NAME_B:
>>>                return dma_buf_set_name(dmabuf, (const char __user *)arg);
>>>
>>> +     case DMA_BUF_IOCTL_INFO:
>>> +             return dma_buf_info(dmabuf, (const void __user *)arg);
>>> +
>>>        default:
>>>                return -ENOTTY;
>>>        }
>>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
>>> index 71731796c8c3..6f4de64a5937 100644
>>> --- a/include/linux/dma-buf.h
>>> +++ b/include/linux/dma-buf.h
>>> @@ -283,6 +283,13 @@ struct dma_buf_ops {
>>>         */
>>>        int (*mmap)(struct dma_buf *, struct vm_area_struct *vma);
>>>
>>> +     /**
>>> +      * @mmap_info:
>>> +      *
>>> +      * Return mmapping info for the buffer.  See DMA_BUF_INFO_VM_PROT.
>>> +      */
>>> +     int (*mmap_info)(struct dma_buf *);
>>> +
>>>        int (*vmap)(struct dma_buf *dmabuf, struct iosys_map *map);
>>>        void (*vunmap)(struct dma_buf *dmabuf, struct iosys_map *map);
>>>    };
>>> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
>>> index b1523cb8ab30..a41adac0f46a 100644
>>> --- a/include/uapi/linux/dma-buf.h
>>> +++ b/include/uapi/linux/dma-buf.h
>>> @@ -85,6 +85,32 @@ struct dma_buf_sync {
>>>
>>>    #define DMA_BUF_NAME_LEN    32
>>>
>>> +
>>> +/**
>>> + * struct dma_buf_info - Query info about the buffer.
>>> + */
>>> +struct dma_buf_info {
>>> +
>>> +#define DMA_BUF_INFO_VM_PROT      1
>>> +#  define DMA_BUF_VM_PROT_WC      0
>>> +#  define DMA_BUF_VM_PROT_CACHED  1
>>> +
>>> +     /**
>>> +      * @param: Which param to query
>>> +      *
>>> +      * DMA_BUF_INFO_BM_PROT:
>>> +      *     Query the access permissions of userspace mmap's of this buffer.
>>> +      *     Returns one of DMA_BUF_VM_PROT_x
>>> +      */
>>> +     __u32 param;
>>> +     __u32 pad;
>>> +
>>> +     /**
>>> +      * @value: Return value of the query.
>>> +      */
>>> +     __u64 value;
>>> +};
>>> +
>>>    #define DMA_BUF_BASE                'b'
>>>    #define DMA_BUF_IOCTL_SYNC  _IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
>>>
>>> @@ -95,4 +121,6 @@ struct dma_buf_sync {
>>>    #define DMA_BUF_SET_NAME_A  _IOW(DMA_BUF_BASE, 1, __u32)
>>>    #define DMA_BUF_SET_NAME_B  _IOW(DMA_BUF_BASE, 1, __u64)
>>>
>>> +#define DMA_BUF_IOCTL_INFO   _IOWR(DMA_BUF_BASE, 2, struct dma_buf_info)
>>> +
>>>    #endif

