Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AA9597EA1
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 08:31:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 674CFB8F5D;
	Thu, 18 Aug 2022 06:31:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2059.outbound.protection.outlook.com [40.107.243.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A982B95B8
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 06:31:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ae+56oEU1RxwB945VvV8QytbKx7ENgVYZyb1+NX9GHQn4B+RQC/0UnsQrpuKY7jD6Mw66UdfaezlwBkH6u3OBCyVQNr7rqHLsstMzsZ4J+ce92bblsiqsPQtpgtMuK5lUlRXnQejciKrmgFkC5mFabwJyiE6nyYXqxsw8WDS3dblCJL2r6W92k2+cDj+ePOysuWZuYfM3bYFkUUsi3hXIzyKEj9xViHcUtN7MLn8Olq0SdNojDp98qkRiaC4Y57aqa4UpnPqgiMfIPUO9T9nrYCaWk8i/n2ASNgO/arAp+WVMP93qGMfgq2u0rf9AJATnsyDLC7stkoHcaGsS7tQMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3IFlt+wKk4pO/jlofImsk+QDQVhugYfqg4cyU8WUdK4=;
 b=WaRtiAkXPVnsV5LSx6KFg7gzemj+wMZdjob344WJQHMENi/UkVueztEqNenRurhGCXS9Dw6+Wh5O6c+5mEo8NlWtT+QSq9JM9D3H8Zj5exQKf7RPHsfFYEixCVlZNPFIx7zGnmoj7nJh/FLxb8NRNh6OjlZQfFtWEfpMLVyONdCY5y8ZIVq2qSEa+xgV0s1v8z1XPTez3vCBbTxRvuiiE5gJ1Y94Nislclw/TQakZRCbu20HOSpeYW3Gp4o5IIZLl/cF8IYEUQQja0eIefinnmbjRjdCkhUYqbI8KEFfxSzzyFw3D1aWhqmEBjZ16Y4ouzbduziX1f1dWbRO+QjrUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3IFlt+wKk4pO/jlofImsk+QDQVhugYfqg4cyU8WUdK4=;
 b=RO7X38nxaipShMy/lbEpTJdBhd2pg2dvjXXQ09TOVGaf/KBXKf/j6dV8IqJeKP/jjQSBjmbLzjebdf2r1GZkfpyOKesf628AebSETsxkKt7Xk+maZlyCYqdevtmySURaaem8Z/I/mOqVwvwDVuzm246dD476IJfM2TZUsFJ4gh4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by BL1PR03MB6071.namprd03.prod.outlook.com (2603:10b6:208:31b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Thu, 18 Aug
 2022 06:31:10 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::c832:eea0:1883:a19c]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::c832:eea0:1883:a19c%3]) with mapi id 15.20.5525.011; Thu, 18 Aug 2022
 06:31:10 +0000
Message-ID: <01416e72-4ff4-c49d-956b-ec1877990ef6@synaptics.com>
Date: Thu, 18 Aug 2022 14:31:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] [Draft]: media: videobuf2-dma-heap: add a vendor defined
 memory runtine
Content-Language: en-US
To: Tomasz Figa <tfiga@chromium.org>
References: <CAAFQd5AL=OejdaubnYDRF4M1EKyStZP_FAMPz4CJ=KCa_8QjaA@mail.gmail.com>
 <CF192A87-1664-45B2-B26C-A9B8B6A52523@soulik.info>
 <CAAFQd5DTNDkZ7W0Rs8Xfq-x+y+cmHZHkDYQys29aNt2YvCJc1A@mail.gmail.com>
 <7c7c2c49-a0e4-cda8-be29-0d143851b9fd@synaptics.com>
 <CAAFQd5BDWBwYH=hfQBmvuyB6xSgXhHKhv2093w2irz4C4_kX5w@mail.gmail.com>
From: Hsia-Jun Li <Randy.Li@synaptics.com>
In-Reply-To: <CAAFQd5BDWBwYH=hfQBmvuyB6xSgXhHKhv2093w2irz4C4_kX5w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0084.namprd03.prod.outlook.com
 (2603:10b6:a03:331::29) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e22ad55c-1d95-48fc-680c-08da80e33d3e
X-MS-TrafficTypeDiagnostic: BL1PR03MB6071:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qr66g0vPJuJoVk8nxZvOOmpe5Z3UjSl7M7oeay8znB80dOshxYuw0E+80lkc2bx6rpLt6dkJxpHjtblrB1xPGBmqfh/qX6b8Fm31+Kdx7tEyMQKMMvhHi8juwerJJk6YDtv3Dp2G4hDtpN3OnFiLcLVNVgJtNucU7LAtpvEixkjkhMg1EDNVQco6uNuUlQrgKILwGOWH1kArWnx+KcDx5KWMhCZp8Y1itNVaRme8p8tVx79wmwsDLnlXoTyv01Tj3ooPjrr4rXEK9yo2jxy1lsHbNigrM+/PRjQnPQCpHuphbUssfWPQ3ebOqym8YivVw2d/pI2FbbefAiSVTDtk+Bprzsj7vc4j1mXM+tfP+uvh6cmNKoWvhY8Gur/0oqQUmNeKgJFQdDjx45pJljHXQLdylC1Q0eAEccUGfvXIgGq9Zja0SSNn1StROXSeu/P6+UPwkYTNiirFW+3OJ5ahrnZZEDhy28jT+b+EUpbC9K+UHKvKctlvQnJNuTFGWC8YlSmEi8Cvu9Bcip7AFOOyHwjMHYZVQoseuEX7NfVsmMWeyJ9MEn/52oBx/2MvDjR6QYuh7F5cjFxsy5Za8UubkmAlG1wnSapGKIN3cGZmQrOlGKL2M2R353lnrVaZ8KxVZRncAEOSlAJAYki+l8OSAkNBDx+OS1xyEcGS8LMAnkbabtjKyeDMF7B9rydJoIGDK1rwvkIAb5zkmDNfJ2ioj6w20RGMyCtT748WtfAAiGc89C8/Jwk3yzzwviKhoRYKpEom8OLhBki+MHCFn35Ri3xtOXqVZVmUswvD2g3AuhpjyU3WYNDBtlj+rAgxlww8lNm27wTnGUFUtL/DUNMJhw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5196.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(366004)(39860400002)(346002)(376002)(396003)(38350700002)(66556008)(316002)(6916009)(38100700002)(8676002)(478600001)(36756003)(66946007)(31686004)(4326008)(6486002)(86362001)(31696002)(6666004)(26005)(30864003)(2906002)(83380400001)(8936002)(6506007)(6512007)(2616005)(41300700001)(186003)(52116002)(66476007)(53546011)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2VQNkxEVnByck80bVlaYm00bVNmQTlBbkFYZVFYZEptVUh2ck9pQnRpU3BL?=
 =?utf-8?B?RnpWVXgvYWdOV1B3b1dzRlMvK3l4dVlidkE5SjdhbTdQT2YrWE9Kc0EvMWtr?=
 =?utf-8?B?ZmZiMjB4V1hLSk5ncUZIUEtxYi9aOW1FVGpzNDdEWUVUNTY0clQ1cWNGQ2cw?=
 =?utf-8?B?V2RSQTc2eFczeGxPUmN0Ylo5TVdLd1ZDSUJDVmZJam94RnZVZWQzZWlVUmI2?=
 =?utf-8?B?VzhqUFJxclVzbEkzUUtxRmljeTYxbkJlM012VlVpakVuTVpQMU9HbC9qSmNC?=
 =?utf-8?B?dEY4YWZjV0EwWEExZ1lOVGpUMVRCOXBsNzFleUEwQTZ5UEJzeHVSVFNTZGtx?=
 =?utf-8?B?VnNhSGlDdncvc05JMi9yNkxFTVJaamdNclNrZElFTHgrZnlLSnV1aGtUdWhv?=
 =?utf-8?B?UUVPVDNvYktUcHlRSW1vU0ZzbzV3ZnhJSnRmTmhGd25JL2hKa1JUNTIrSjJi?=
 =?utf-8?B?bFNuMGhLQjhNVmVvZjdSU0lSNlE2MkIzYmVia0paNGFDUkwxYW92TXRzUnA0?=
 =?utf-8?B?T3FZZmg4OENCRytGeW9ydFpHY09rdk5lb3NEUnJHa2xFUVYwa1pqaEI5Z2Ix?=
 =?utf-8?B?VklaZjk4WmpXZ00rTm9RcGp6MzZoSFFIRG9uVjhseTdLbXMxeWVqOHY4M0xi?=
 =?utf-8?B?R0xadS9KSHlacTNOdEdSaEFVc2x2eXdQMm9KTW82bUpQR1MyOWtQL0RWdHcv?=
 =?utf-8?B?aWhyd0FTWXp0N0UxRDM1L202NmNncG9BcmR1YzdqRHBPaEZrZmNXelpERWlY?=
 =?utf-8?B?aVQ1bUIxWDVPYTlvUlB6YXlmZk1HU3NBZVR2YkNvaUtScXdCY2ZvdGpCNG1Y?=
 =?utf-8?B?aW1vOWxDdnd5QUkzSkhHTGtjTTF4NDE1dUg2RmI4NlBlWlcwemdMN2tIcklH?=
 =?utf-8?B?K2NiWlBLbmtyaW1zUk03bTRmY2xQeDJyWXlnUGZsUGd0aXpFNE0rRG9qYW9M?=
 =?utf-8?B?a1R2d1dzT0h5MGptUVVVRmduaCtaZWp5QUo5c09LUTZPeVFYd1lyTno2R0Z5?=
 =?utf-8?B?RlU3UEdjdUV6cURkNmFNaUJXRDJ1Z3Q4YnhSeXNpczBMYlM1bys3Qld5ZFRS?=
 =?utf-8?B?VXBzU2N4TjVLc3U4aFRmOHZpdDZPcUZZazFoK0tTVVg0cFFaRVFFVFNmZUQ4?=
 =?utf-8?B?U09Bb3hPcm9hc2dZTzVPSDJoV1kwVURuNUtwN3JaM0RFd094T0ZpZFR6dzhk?=
 =?utf-8?B?Szg0aFhHZnRRcjkzc2RJN0V1NGJZamgzc2lkQUdzT2x1cldqaW56QklqTHFD?=
 =?utf-8?B?S1hBNEtncDZhRlc1dFY0QzZrRys0dU9sMjdobVg0RFNhQ0NoZkNtc0xHM3FQ?=
 =?utf-8?B?T24vMlhPajUybzBJeGdnczZaaVQwVlNMTHc2RktZYkxiT04wTFM5aE9DTUNh?=
 =?utf-8?B?M3JFL212OU5Yc2ZaUXoyemMyeVFkWDFHZEtVbUt5TkZvOVRuakJKQWFTNHVI?=
 =?utf-8?B?Vm4vMXE4ZzRVNEI0NlZaaUFKNmZkWTg2SUhnQThkeTg2ejZGVW9XcGIwSDFx?=
 =?utf-8?B?bzBFRmsxUGpuNjJKa04xTjJZNy90RzMrbldyY1I4dWsrWVIxSlR5aWoyZWEx?=
 =?utf-8?B?YlVSd2J3aXZnNVRiL0lXTUd6Skg4Zk12S29YU211OHBUZTRESUVhUG1yWjB6?=
 =?utf-8?B?dU5KOXdQOUdhTWR0dHIyMEFLTmFSbUlDNy9IRCthUXBqZ25KeDkvYWtIRUUz?=
 =?utf-8?B?Y00yQm94Y3JYYk0wR1hpVzFKQVJVOWZ2VGxrZWUvdnpJalZ2T1ZDQ05ZVjAw?=
 =?utf-8?B?VUpyQXFLMEMrN2VGZ2tvQkpYcEZ2aVUxUkJ3YUZNSTZXeC9SOXBqanYyM0Iy?=
 =?utf-8?B?RTFkbDNhRnlRc2dRVHBhdGpINjVGVW1pb2wwam5aR2VsRlMyQlBHbDlSeUwv?=
 =?utf-8?B?UEVXVWlxdDh0QlcwK0ZQLzc2b2xVUVc5WjBJMnBla1ZzWDhFcTV1UXBNaDZR?=
 =?utf-8?B?M3hZOGRacFp3eGUvQjhxUVFQLy9NdFVhWDRUaE0yN1FYYXZlcGRrQzJONWZD?=
 =?utf-8?B?VUVlUFBWYlpSVVhxdVQwTkVFUjNxSCtBaDZOTU5XVitBY3RUYkVnV0p5alBN?=
 =?utf-8?B?ckx6dWFXWi9aRWFWWW9WbzJOcm5ENHIxenFWSzVYemdCcGlhVStrOGttMGZZ?=
 =?utf-8?Q?bTpKTtr6ytPIinSA26ejTGAiQ?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e22ad55c-1d95-48fc-680c-08da80e33d3e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 06:31:10.1027 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PhL959EHCegRTxm/L3rT2Jiq2vtTs+ROBlvwWToNNQquE9gVyWDgz8hQNjwAV3NzhirjfJ3AjsqlpU1UCuiGwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6071
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
Cc: ayaka <ayaka@soulik.info>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 christian.koenig@amd.com, m.szyprowski@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/18/22 13:50, Tomasz Figa wrote:
> CAUTION: Email originated externally, do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> 
> Hi Randy,
> 
> Sorry for the late reply, I went on vacation last week.
> 
> On Sun, Aug 7, 2022 at 12:23 AM Hsia-Jun Li <Randy.Li@synaptics.com> wrote:
>>
>>
>>
>> On 8/5/22 18:09, Tomasz Figa wrote:
>>> CAUTION: Email originated externally, do not click links or open attachments unless you recognize the sender and know the content is safe.
>>>
>>>
>>> On Tue, Aug 2, 2022 at 9:21 PM ayaka <ayaka@soulik.info> wrote:
>>>>
>>>> Sorry, the previous one contains html data.
>>>>
>>>>> On Aug 2, 2022, at 3:33 PM, Tomasz Figa <tfiga@chromium.org> wrote:
>>>>>
>>>>> ﻿On Mon, Aug 1, 2022 at 8:43 PM ayaka <ayaka@soulik.info> wrote:
>>>>>> Sent from my iPad
>>>>>>>> On Aug 1, 2022, at 5:46 PM, Tomasz Figa <tfiga@chromium.org> wrote:
>>>>>>> ﻿CAUTION: Email originated externally, do not click links or open attachments unless you recognize the sender and know the content is safe.
>>>>>>>> On Mon, Aug 1, 2022 at 3:44 PM Hsia-Jun Li <Randy.Li@synaptics.com> wrote:
>>>>>>>>> On 8/1/22 14:19, Tomasz Figa wrote:
>>>>>>>> Hello Tomasz
>>>>>>>>> ?Hi Randy,
>>>>>>>>> On Mon, Aug 1, 2022 at 5:21 AM <ayaka@soulik.info> wrote:
>>>>>>>>>> From: Randy Li <ayaka@soulik.info>
>>>>>>>>>> This module is still at a early stage, I wrote this for showing what
>>>>>>>>>> APIs we need here.
>>>>>>>>>> Let me explain why we need such a module here.
>>>>>>>>>> If you won't allocate buffers from a V4L2 M2M device, this module
>>>>>>>>>> may not be very useful. I am sure the most of users won't know a
>>>>>>>>>> device would require them allocate buffers from a DMA-Heap then
>>>>>>>>>> import those buffers into a V4L2's queue.
>>>>>>>>>> Then the question goes back to why DMA-Heap. From the Android's
>>>>>>>>>> description, we know it is about the copyright's DRM.
>>>>>>>>>> When we allocate a buffer in a DMA-Heap, it may register that buffer
>>>>>>>>>> in the trusted execution environment so the firmware which is running
>>>>>>>>>> or could only be acccesed from there could use that buffer later.
>>>>>>>>>> The answer above leads to another thing which is not done in this
>>>>>>>>>> version, the DMA mapping. Although in some platforms, a DMA-Heap
>>>>>>>>>> responses a IOMMU device as well. For the genernal purpose, we would
>>>>>>>>>> be better assuming the device mapping should be done for each device
>>>>>>>>>> itself. The problem here we only know alloc_devs in those DMAbuf
>>>>>>>>>> methods, which are DMA-heaps in my design, the device from the queue
>>>>>>>>>> is not enough, a plane may requests another IOMMU device or table
>>>>>>>>>> for mapping.
>>>>>>>>>> Signed-off-by: Randy Li <ayaka@soulik.info>
>>>>>>>>>> ---
>>>>>>>>>> drivers/media/common/videobuf2/Kconfig        |   6 +
>>>>>>>>>> drivers/media/common/videobuf2/Makefile       |   1 +
>>>>>>>>>> .../common/videobuf2/videobuf2-dma-heap.c     | 350 ++++++++++++++++++
>>>>>>>>>> include/media/videobuf2-dma-heap.h            |  30 ++
>>>>>>>>>> 4 files changed, 387 insertions(+)
>>>>>>>>>> create mode 100644 drivers/media/common/videobuf2/videobuf2-dma-heap.c
>>>>>>>>>> create mode 100644 include/media/videobuf2-dma-heap.h
>>>>>>>>> First of all, thanks for the series.
>>>>>>>>> Possibly a stupid question, but why not just allocate the DMA-bufs
>>>>>>>>> directly from the DMA-buf heap device in the userspace and just import
>>>>>>>>> the buffers to the V4L2 device using V4L2_MEMORY_DMABUF?
>>>>>>>> Sometimes the allocation policy could be very complex, let's suppose a
>>>>>>>> multiple planes pixel format enabling with frame buffer compression.
>>>>>>>> Its luma, chroma data could be allocated from a pool which is delegated
>>>>>>>> for large buffers while its metadata would come from a pool which many
>>>>>>>> users could take some few slices from it(likes system pool).
>>>>>>>> Then when we have a new users knowing nothing about this platform, if we
>>>>>>>> just configure the alloc_devs in each queues well. The user won't need
>>>>>>>> to know those complex rules.
>>>>>>>> The real situation could be more complex, Samsung MFC's left and right
>>>>>>>> banks could be regarded as two pools, many devices would benefit from
>>>>>>>> this either from the allocation times or the security buffers policy.
>>>>>>>> In our design, when we need to do some security decoding(DRM video),
>>>>>>>> codecs2 would allocate buffers from the pool delegated for that. While
>>>>>>>> the non-DRM video, users could not care about this.
>>>>>>> I'm a little bit surprised about this, because on Android all the
>>>>>>> graphics buffers are allocated from the system IAllocator and imported
>>>>>>> to the specific devices.
>>>>>> In the non-tunnel mode, yes it is. While the tunnel mode is completely vendor defined. Neither HWC nor codec2 cares about where the buffers coming from, you could do what ever you want.
>>>>>> Besides there are DRM video in GNU Linux platform, I heard the webkit has made huge effort here and Playready is one could work in non-Android Linux.
>>>>>>> Would it make sense to instead extend the UAPI to expose enough
>>>>>>> information about the allocation requirements to the userspace, so it
>>>>>>> can allocate correctly?
>>>>>> Yes, it could. But as I said it would need the users to do more works.
>>>>>>> My reasoning here is that it's not a driver's decision to allocate
>>>>>>> from a DMA-buf heap (and which one) or not. It's the userspace which
>>>>>>> knows that, based on the specific use case that it wants to fulfill.
>>>>>> Although I would like to let the users decide that, users just can’t do that which would violate the security rules in some platforms.
>>>>>> For example,  video codec and display device could only access a region of memory, any other device or trusted apps can’t access it. Users have to allocate the buffer from the pool the vendor decided.
>>>>>> So why not we offer a quick way that users don’t need to try and error.
>>>>>
>>>>> In principle, I'm not against integrating DMA-buf heap with vb2,
>>>>> however I see some problems I mentioned before:
>>>>>
>>>>> 1) How would the driver know if it should allocate from a DMA-buf heap or not?
>>>>
>>>> struct vb2_queue.mem_ops
>>>>
>>>> int (*queue_setup)(struct vb2_queue *q,unsigned int *num_buffers, unsigned int *num_planes, unsigned int sizes[], struct device *alloc_devs[]);
>>>
>>> Sorry, I don't understand what you mean here.
>>>
>>> Just to make sure we're on the same page - what I'm referring to is
>>> that whether DMA-buf heap is used or not is specific to a given use
>>> case, which is controlled by the userspace. So the userspace must be
>>> able to control whether the driver allocates from a DMA-buf heap or
>>> the regular way.
>> No, it does not depend on the use case here. We don't accept any buffers
>> beyond the region we decided. Even for the non-DRM, non-security video,
>> our codec devices are running under the secure mode.
>>
>> You MUST allocate the buffer for a device from the DMA-heap we(SYNA)
>> decided.
> 
> That's your use case, but there could be use cases which work
> differently. In fact, in ChromeOS we only use the secure allocation
> path for protected content, because it imposes some overhead.
> 
>>
>> I believe some other devices may have much limitation for not the
>> security reason, for example, it can't access the memory above 4 GiB or
>> for the performance's reason.
> 
> For such limitations, there is the shared DMA pool or restricted DMA
> pool functionality, which can be given to a device in DT and then the
> DMA mapping API would just allocate within that area for that device.
> Maybe that's what you need here?
> 
For Synaptics VideoSmart devices, it is simple that we want to limit the 
memory region a IP device could access. I just try to find out some 
reasons here.

>>>
>>>>
>>>>> 2) How would the driver know which heap to allocate from?
>>>>
>>>>   From vb2_queue.alloc_devs
>>>>
>>>> What I did now is likes what MFC does, create some mem_alloc_devs.
>>>> It would be better that we could retrieve the DMA-heaps’ devices from kernel, but that is not enough, we need a place to store the heap flags although none of them are defined yet.
>>>>
>>>>   From Android documents, I think it is unlikely we would have heap flags.
>>>> “Standardization: The DMA-BUF heaps framework offers a well-defined UAPI. ION allowed custom flags and heap IDs that prevented developing a common testing framework because each device’s ION implementation could behave differently.”
>>>>
>>>
>>> alloc_devs is something that the driver sets and it's a struct device
>>> for which the DMA API can be called to manage the DMA buffers for this
>>> video device. It's not a way to select a use case-dependent allocation
>>> method.
>>>
>> I see, then move to the last question, we need to expand the V4L2
>> framework's structure.
>>>>> 3) How would the heap know how to allocate properly for the device?
>>>>>
>>>> Because “each DMA-BUF heap is a separate character device”.
>>>
>>> Could you elaborate? Sorry, I'm not sure how this answers my question.
>> Because a DMA-heap, a heap device itself is enough here, may plus HEAP
>> flag when there is.
>>
>> I don't know what else would be need to do here.
>> If you allocate a buffer from a heap which is delegated for security
>> memory of that device, the heap driver itself would inform the TEE the
>> pages occupied by it or the memory allocated from the pool which is in a
>> region of memory reserved for this purpose.
> 
> So the heap is only for the video device?
> 
dma-heaps?
There are heaps for dolby audio, NPU and DRM IPs.
Even the GPU shader or AI model in SPIR-V could be protected in the 
synaptics's platform.
>>>
>>>> But as I said in the first draft I am not sure about the DMA mapping part. alloc_devs responds for the heap, we have a device variable in the queue that mapping function could access, but that may not be enough. A plane may apply a different mapping policy or IOMMU here.
>>>>
>>>> Would it be better that I create a interface here that creating a memdev with DMA-heap description ?
>>>
>>> My intuition still tells me that it would be universally better to
>>> just let the userspace allocate the buffers independently (like with
>>> gralloc/Ion) and import to V4L2 using V4L2_MEM_DMABUF. It was possible
>>> to do things this way nicely with regular Android graphics buffers, so
>>> could you explain what difference of your use case makes it
>>> impossible?
>> Without keeping the backward compatibility, it won't have any problem IF
>> we could tell the users the acceptable DMA-heap for each of planes and
>> DMA-heap's heap flags.
>>
>> We don't have an ioctl for this yet, the most possible for the decoder
>> is doing that at GET_FMT ioctl()?.
> 
> Do we need the kernel to tell the userspace which heap to use? As you
> mentioned above, the heap would be specific for the video device and
> the userspace would also be specific for your use case, so why
> couldn't it just find the right heap on its own (e.g. by name)?
Yes, as long as you won't mind me expanding the v4l2 allocator APIs.

As I would mention this in the synaptics pxiel formats' email, mvtp may 
(in the most of case) use a different heap with the one luma and chroma 
data.
> 
> As for heap flags, could you elaborate on what kind of flags you
> imagine could be decided by a V4L2 driver?
I don't much idea here acutally, I don't even know any pretension need 
here. But if I could expand the APIs, I would just leave a windows for 
the furture usage.
> 
> Best regards,
> Tomasz

-- 
Hsia-Jun(Randy) Li
