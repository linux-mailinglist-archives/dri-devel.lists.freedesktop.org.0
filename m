Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4029C59D26B
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 09:43:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9FD4B0515;
	Tue, 23 Aug 2022 07:41:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 544C112B87F
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 07:41:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HoI+tWJnr+0LNlIX1Gu5gX+0IglPpxSiIEfUZxcJe54hk634j07oo7QtUP2bVdqXQhjBJqtjAKsDcYNsHiQMr8cz9jqQt/5HHHI7cK7u5vj5ZJtYOdfEFg1C+1xTtnFXRuq9pbPoOZu70s+def2p6zRpHN1K+UeW88hRYZNfL30EjoJyw2fm/YN1ny4Kwj3g5QweecFhRbPyyKvt9OMynbhnOC/bVUwPmmhdXo/1JcUJKCo9MSY7nD43oFmEfsfx82vsy1APG2DOLxYgm11J2qYNyfM2c0CRTudYuHd+nASQ7P+6oOz9xEgatGzfyVZSEsWeMAZahLHYHxLR+DmCCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8BT0Vx0vg88O3c9BWt69mHvVz0Z60w7RZsBU3MGcTX0=;
 b=XZvxptPJvfBBnaJhvA9QhZQN02shEDbS57ie2r7iahHpvDk+VEFwW88qfOAxm5pjS5HAILoN5kIXfI9YIRHqbm02AbLAAUon/USnhvrhImVmjIq2Vi0c5TAo5qeP0G2cdXHUMbICfN4qZy6eIHGgFLUpfNPGDaehBSW59bYti7WimVtqtdgdTTKIrDa4z00LgA0ut5M0251WSFjrH3GRAu+WadjBw2hahYMBhhCCwp8t3Is6uPlugLExMtTHv4xcU9pijG7vjXGvxQkXzd9cKpDC17JT0Xg8UbyGzar5PYJf3+nodvGIRlVpb8DZyQkinYV4I1EJHeBlxrdCUFkuJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8BT0Vx0vg88O3c9BWt69mHvVz0Z60w7RZsBU3MGcTX0=;
 b=a4yz8fjM9STGUSOWDgUTy91vcngzQ+TXDE2ag0h6+ErilD8GVdO1hWqCmbA+A1RHeVzH4Gx4C3+HdRGW2q6RCCC00I7BP+odk7jV12hFyLnnP8M5SbjE4JvWqacft+H2pSvNMiTvht7BlMo6R5CnHa0WlhkESL/oOAg2Pjzvy10=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by BLAPR03MB5604.namprd03.prod.outlook.com (2603:10b6:208:29a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Tue, 23 Aug
 2022 07:41:06 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::c832:eea0:1883:a19c]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::c832:eea0:1883:a19c%3]) with mapi id 15.20.5566.014; Tue, 23 Aug 2022
 07:41:06 +0000
Message-ID: <2f3c8f6d-fc01-353e-fb74-b7f9af1ed2c4@synaptics.com>
Date: Tue, 23 Aug 2022 15:40:57 +0800
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
 <1f926989-eb13-14ee-e30d-ac6d01b86c52@synaptics.com>
 <e15165f60ce801dd502bfe1992ea430fe37c5a91.camel@ndufresne.ca>
From: Hsia-Jun Li <Randy.Li@synaptics.com>
In-Reply-To: <e15165f60ce801dd502bfe1992ea430fe37c5a91.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR01CA0058.prod.exchangelabs.com (2603:10b6:a03:94::35)
 To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 053ebc16-ecd8-4738-aeb8-08da84dad67d
X-MS-TrafficTypeDiagnostic: BLAPR03MB5604:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EDrnaG1Ynu3khegpFdoT1ZDpmO8uMTxAEnNlyO43+9oew/MCiJUaQYsz2kkXnt+vaay23/JCw+EKaxJcBB97eE3GL4CiUcX8mq7BRNPvBunG9nWJgYc4VlRzrVMgywZ3MK+lLe0ZaN0Kh3RU1UhxITzfLzKeb6U80zm68sDnQwQ9VHd05tPJhGr0IIiFya22ISL7CH71hgFXvYghOWhJbwY/KyZiqTbds5Wcgl+zvyWqc6oV/mUcqG3iQLyhObBETFDv5bWCi/wwP2wvsCO0J0DQpkHNFbLacgoRDs1tYgsNtE6uawaKTUEOfu6zrtuZWGYoHh0nOMRhi9G6wlUm9+yE1rt4/jN9IAvIuqpnHPjNeXnEpvrwWw/uQDFIWFU3mEYP5YzeaImGCmLgR096ARotAMbRm2rpkNe1uUwhdsRBr0MIJxlD9XMOebbL3KPyEFjmQEKPtLfhWBnHfH1PR4Z9g1ZLAbttyKTLmwjImN0xv17CaiRxt65YR7lmLngVmcsrV7GDCF/ZWfkAoR3g+4U9BsmVsUG3VUG5BIjiUSamJBYsMIzUig7Z0iSB/W1sDispSTHDETFxf9JZnbLNqI5Han2ajp3zRGGc4w/KXbeS2YSB5B7rO7lqfjjfJ8Jf0BuVU/nuPQ+mNOcTQWP/hg/jS+PC9epKeZX3yCS4sJIdRcOHv69vYOc/ogLprF+ivrjcZ0qeftsDmw0lisCNzoqOxuhD9a581BPQc2rtoxhdmFL+Sg3wNYh9TfK6uT0wRRuG6i6tFuzUNiW+Z+gFgY1M52QOugQkXWdVUBNssfiI8XLpAtylyhkUzmpydEqOUf6rvQer9gDxQEsx/+11yIMv+3CJYK50HSFo4m1gC+8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5196.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(136003)(39850400004)(376002)(346002)(396003)(6666004)(478600001)(31686004)(53546011)(52116002)(6486002)(966005)(2906002)(5660300002)(4326008)(7416002)(66476007)(8676002)(66556008)(83380400001)(6512007)(316002)(26005)(66946007)(6916009)(36756003)(41300700001)(86362001)(186003)(38350700002)(31696002)(6506007)(8936002)(66574015)(30864003)(2616005)(54906003)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjFuSnBnT2h2V0FlSEQyZGRLVktNVFRxYWpJUEl5WGhuaU5tRU1yVFFlTFls?=
 =?utf-8?B?UGdRQzAwOUhLbWFpUlFxdDlPYTVDRGxFeThKZmNtM2Zpamw0c2x4ZDVsaGxH?=
 =?utf-8?B?d0s5YWhxOE5NN2k1YWVuVnZ0ZFBSVHlQRktoT1IvZDRpaHA4dkFycW8vZVRW?=
 =?utf-8?B?ZDc3d1ZQNzVVOVlRV3VXa083ZlVpcnMxcDNSZXhxM1BqNjRibENwejA4eWg5?=
 =?utf-8?B?Sm1obThWQWNSNCt4cTNEaUdJMTFIdDZFc2dyMUlKZndwdEp6TGd1SHUxMCtl?=
 =?utf-8?B?SlFJd1FqQ2lXMUlkTTJNYWVKRVlaSXN1VjNkZmtFWC8zMUo4Z3p1SVNhOVEv?=
 =?utf-8?B?RklIK2NnTmdFL1JiTGs2MEpFbStiV1JnVWdndEJEQ0FESDFXSFJRSE5zbnB2?=
 =?utf-8?B?bXpJMFF6M08rS2FOYTVTMmM2Y0tueTZwQUhKdkRwSFBmMFplUG1NUkhtYzAv?=
 =?utf-8?B?QSszSjNlcTZiSE9ka1lRK2dZOE52RGNsTnAvRUFwY1BySlJuVlQ0NURqTlZJ?=
 =?utf-8?B?blY3d014MnVwT1IxRTcvMVZvajlITTA3UG5vRHZ6dHVLaE1aS1lTTFZIY1Fu?=
 =?utf-8?B?SEhBSUJ1NTF2VzIrTFFyUzc4bElxMnNNcUd1Rkd6TlNtWjFmaG1FVzN1RVBu?=
 =?utf-8?B?TUV3cjBzNDk1NDMxenlIdmZqSmpXTUJJbWlyTmYzTzZZU3ZSbXgxKzUrSUk1?=
 =?utf-8?B?WGJrMFkrQklSMDIwTVo5Um1ORUhJY3g0ZGMxZzBRNWpTZmZrenhtMjA2d0ZL?=
 =?utf-8?B?SGV5emI0SnFDTldQN2N3MEl5UDROdVAyK0lxVXdxZlI5REdzU0NHeUFPV2lK?=
 =?utf-8?B?MHhSd3FJM3VQUVpjSTdrbG5pUzYvTnNHckFjL0RkLzJ4WUFneEtmSERIZjhu?=
 =?utf-8?B?Y3dxMUlhV2VSUWpaQmg2dmlDMjJBSm9jYUtGWXkxVUd0dkhZcU4wRFdGNVM0?=
 =?utf-8?B?Y0xmbGpRUm5FK0UwWDRES1dOSEY1ZDQ0U0FvNHhDSk5QbmlUY2VCaTV5TTY5?=
 =?utf-8?B?WUY5MzJlOXRQY1J0Z3UxZVlvbUVtS0s5em41TG1GNnFFbWdmZVVHbnFWaTZq?=
 =?utf-8?B?T2Y3TFBhSCtaaDBNRVB2bXZXK1ROcTRGbk96V0NiRm03Z1FIS0gvak5mN2ZN?=
 =?utf-8?B?Z2t6cTRpa0Jlancxb1J0YmJEd1NlUGxkdnlCd1A2V1BNVU9IVlVySGNKWVVY?=
 =?utf-8?B?NDlrbCtPdXVYeFBLc1Bod3pFUHFDWTRobDZZOWtxOFA1MU5vOUtkQVZibVo4?=
 =?utf-8?B?aXIxU2F1ZE00TTV6dmNCakdFcDljbVB2M09mTEYwL0V1aHo3b1lhWC82eWw5?=
 =?utf-8?B?THd5SXRIUUJTV2ZwSmsxN3hyR1lpNkJiTSttemVhdWFObEhlQlpqc3IzSStp?=
 =?utf-8?B?aHdMK21iZ29xTFU1WGVQTC9jNHdrNHMwY2Q5cm1rdjZ4Y0JQN3FKNEVQMGJM?=
 =?utf-8?B?L2kvVUsxQ0VBREVlNnl5VEs1Wi91Mkx3L1FZc1ZkWTMzZ1VUSndoVlYvbVlu?=
 =?utf-8?B?ZXNhYklKMEdkRUFuMUFBMlF2aS9tMnN4QjJvM3FDVkpkZVRUSzI0VkQ4ZEFM?=
 =?utf-8?B?ckZ3SWVSdThYWnhhT21MK0dRSVhleHFTaGk5VExqRzZyQ01ZaVluMGNsaDBO?=
 =?utf-8?B?L2RaWDAyMk1FUEVWRCt4WEhsVFZGTjd2bm1VRlJMclVsTDR0aXRPeFhUT0VN?=
 =?utf-8?B?RFFhYW9lZDMwazA3d041UGc4cGU3SnBCZ3JHbDBad1AwYThmeHM1YUpncjYv?=
 =?utf-8?B?TFFINkNwZWsrNWNhamhrSi9FQVJ6RC9PTk50TEZGeGtiYmMveEFaKy9ReWxI?=
 =?utf-8?B?RjVLMW9mb01RZEx0NjlZcTV3ZUVEM0NHbVBrTGd1QWR3N0U2RkJnOXBKbWp0?=
 =?utf-8?B?RHcyRDhWc1FPVE1McjVWK0hKdjRkTjhyb2FYZldYNXdBNVFIWW1pci9KOFpK?=
 =?utf-8?B?c2NaMUtDSk1JUUxwTDNlcEE3cHNBZWJtbXZaa1Vkc0Q3djZlM0ZPYUQ0dUky?=
 =?utf-8?B?bDZsTnRaNGJlSGJyK1BvYXNlWnpWV3BYNkxqUHJIVy9jV1lXNkxFZXZZZXRI?=
 =?utf-8?B?UkhOdzhXT1Y5dkQ2V05ia0krWlcyVkJjOTdITEc5cXVpN1cwVFg0ckhGWTgr?=
 =?utf-8?Q?oStVO4DEhO/KqUMb9ONe4bnhu?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 053ebc16-ecd8-4738-aeb8-08da84dad67d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 07:41:06.5613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mUdYoMS4biBN1M6eSvyjiS11xZ4tL5tfAfPj1F+vXMPSujoXk6h4IBIqVS0iS97jqTVCkWdaX7k+Xqp4RkwfkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5604
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



On 8/22/22 22:15, Nicolas Dufresne wrote:
> CAUTION: Email originated externally, do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> 
> Le samedi 20 août 2022 à 08:10 +0800, Hsia-Jun Li a écrit :
>>
>> On 8/20/22 03:17, Nicolas Dufresne wrote:
>>> CAUTION: Email originated externally, do not click links or open attachments unless you recognize the sender and know the content is safe.
>>>
>>>
>>> Le vendredi 19 août 2022 à 23:44 +0800, Hsia-Jun Li a écrit :
>>>>
>>>> On 8/19/22 23:28, Nicolas Dufresne wrote:
>>>>> CAUTION: Email originated externally, do not click links or open attachments unless you recognize the sender and know the content is safe.
>>>>>
>>>>>
>>>>> Le vendredi 19 août 2022 à 02:13 +0300, Laurent Pinchart a écrit :
>>>>>> On Thu, Aug 18, 2022 at 02:33:42PM +0800, Hsia-Jun Li wrote:
>>>>>>> On 8/18/22 14:06, Tomasz Figa wrote:
>>>>>>>> On Tue, Aug 9, 2022 at 1:28 AM Hsia-Jun Li <randy.li@synaptics.com> wrote:
>>>>>>>>>
>>>>>>>>> From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>
>>>>>>>>>
>>>>>>>>> The most of detail has been written in the drm.
>>>>>>
>>>>>> This patch still needs a description of the format, which should go to
>>>>>> Documentation/userspace-api/media/v4l/.
>>>>>>
>>>>>>>>> Please notice that the tiled formats here request
>>>>>>>>> one more plane for storing the motion vector metadata.
>>>>>>>>> This buffer won't be compressed, so you can't append
>>>>>>>>> it to luma or chroma plane.
>>>>>>>>
>>>>>>>> Does the motion vector buffer need to be exposed to userspace? Is the
>>>>>>>> decoder stateless (requires userspace to specify the reference frames)
>>>>>>>> or stateful (manages the entire decoding process internally)?
>>>>>>>
>>>>>>> No, users don't need to access them at all. Just they need a different
>>>>>>> dma-heap.
>>>>>>>
>>>>>>> You would only get the stateful version of both encoder and decoder.
>>>>>>
>>>>>> Shouldn't the motion vectors be stored in a separate V4L2 buffer,
>>>>>> submitted through a different queue then ?
>>>>>
>>>>> Imho, I believe these should be invisible to users and pooled separately to
>>>>> reduce the overhead. The number of reference is usually lower then the number of
>>>>> allocated display buffers.
>>>>>
>>>> You can't. The motion vector buffer can't share with the luma and chroma
>>>> data planes, nor the data plane for the compression meta data.
>>>>
>>>> You could consider this as a security requirement(the memory region for
>>>> the MV could only be accessed by the decoder) or hardware limitation.
>>>>
>>>> It is also not very easy to manage such a large buffer that would change
>>>> when the resolution changed.
>>>
>>> Your argument are just aiming toward the fact that you should not let the user
>>> allocate these in the first place. They should not be bound to the v4l2 buffer.
>>> Allocate these in your driver, and leave to your user the pixel buffer (and
>>> compress meta) allocation work.
>>>
>> What I want to say is that userspace could allocate buffers then make
>> the v4l2 decoder import these buffers, but each planes should come from
>> the right DMA-heaps. Usually the userspace would know better the memory
>> occupation, it would bring some flexibility here.
>>
>> Currently, they are another thing bothers me, I need to allocate a small
>> piece of memory(less than 128KiB) as the compression metadata buffers as
>> I mentioned here. And these pieces of memory should be located in a
>> small region, or the performance could be badly hurt, besides, we don't
>> support IOMMU for this kind of data.
>>
>> Any idea about assign a small piece of memory from a pre-allocated
>> memory or select region(I don't think I could reserve them in a
>> DMA-heap) for a plane in the MMAP type buffer ?
> 
> A V4L2 driver should first implement the V4L2 semantic before adding optional
> use case like buffer importation. For this reason, your V4L2 driver should know
> all the memory requirements and how to allocate that memory. 
Yes, that is what I intend to. Or I just smuggle those things somewhere.
Later on, your
> importing driver will have to validate that the userland did it right at
> importation. This is to follow V4L2 semantic and security model. If you move
> simply trust the userland (gralloc), you are not doing it right.
> 
Yes, that is what I try to describe in the other thread
https://lore.kernel.org/linux-media/B4B3306F-C3B4-4594-BDF9-4BBC59C628C9@soulik.info/
I don't have the problem that let the userspace decided where and how to 
allocate the memory, but we need a new protocol here to let the 
userspace do it right.
>>
>> Besides, I am not very satisfied with the dynamic resolution change
>> steps if I understand it correct. Buffers reallocation should happen
>> when we receive the event not until the drain is done. A resolution
>> rising is very common when you are playing a network stream, it would be
>> better that the decoder decided how many buffers it need for the
>> previous sequence while the userspace could reallocate the reset of
>> buffers in the CAPTURE queue.
>>> Other driver handle this just fine, if your v4l2 driver implement the v4l2
>>> resolution change mechanism, is should be very simple to manage.
> 
> This is a limitation of the queue design of V4L2. While streaming the buffers
> associated with the queue must currently be large enough to support the selected
> format. "large enough" in your case is complex, and validation must be
> programmed in your driver.
> 
> There was discussion on perhaps extending on CREATE_BUFS feature, that let you
> allocate at run-time for a different format/resolution (no drivers currently
> allow that). The rules around that aren't specified (and will have to be defined
> before a driver starts making use of that). Note that to be usable, a
> DELETE_BUF(s) ioctl would probably be needed too.
> 
> In current state, If your driver can support it, userland does not strictly need
> to re-allocate if the resolution is changed to smaller. In most SVC scenarios,
> the largest resolution is known in advance, so pre-allocation can happen to the
When you play a video from Youtube, you may notice that starting 
resolution is low, then after it received more data knowning the 
bandwidth is enough, it would switch to a higher resolution. I don't 
think it would inform the codecs2 or OMX there is a higher target 
resolution.

Besides, for the case of SVC in a conference system, the remote(gatway) 
would not tell you there is a higer resolution or frame rate because you 
can't receive it in negotiate stage, it could be permanently(device 
capability) or just bandwidth problem. Whether we know there is a higher 
requirement video depends on the transport protocols used here.

The basic idea of SVC is that the low layer didn't depends on the upper 
layer, we can't tell how the bitstream usually.
> appropriate resolution and queue size. Re-allocation is then rarely triggered at
> run time. Unlike your system, IOMMU system are not as affected by allocation
> latency and manages to do gapless transition despite this inefficiency.
> 
> Note that all this is pure recommendation. What I'm seeing here is a pixel
> format documented with Android assumptions rather then mainline, and sent
> without the associated implementation. This simply raises some question on the
Because this implementation is very complex as you could see now, I 
didn't see the exist implementation here could decode DRM video or has 
the security restriction here.

And you see even before this decoder driver is done, we have had enough 
problems, even just the definition of pixel formats and data exchange 
mechanism.
> viability of the whole. This is not a critic but just some verification that
> ensure you are following the V4L2 spec.
I really want to those recommendations here, I want to make everything 
right at the first place. Or we would make a driver we would know it 
won't follow the v4l2 spec.
> 
>>>
>>>>>>
>>>>>>>>> Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
>>>>>>>>> ---
>>>>>>>>>      drivers/media/v4l2-core/v4l2-common.c | 1 +
>>>>>>>>>      drivers/media/v4l2-core/v4l2-ioctl.c  | 2 ++
>>>>>>>>>      include/uapi/linux/videodev2.h        | 2 ++
>>>>>>>>>      3 files changed, 5 insertions(+)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
>>>>>>>>> index e0fbe6ba4b6c..f645278b3055 100644
>>>>>>>>> --- a/drivers/media/v4l2-core/v4l2-common.c
>>>>>>>>> +++ b/drivers/media/v4l2-core/v4l2-common.c
>>>>>>>>> @@ -314,6 +314,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
>>>>>>>>>                     { .format = V4L2_PIX_FMT_SGBRG12,       .pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
>>>>>>>>>                     { .format = V4L2_PIX_FMT_SGRBG12,       .pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
>>>>>>>>>                     { .format = V4L2_PIX_FMT_SRGGB12,       .pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
>>>>>>>>> +               { .format = V4L2_PIX_FMT_NV12M_V4H1C, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 5, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 2, .block_w = { 128, 128 }, .block_h = { 128, 128 } },
>>>>>>>>>             };
>>>>>>>>>             unsigned int i;
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>>>>>>>>> index e6fd355a2e92..8f65964aff08 100644
>>>>>>>>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>>>>>>>>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>>>>>>>>> @@ -1497,6 +1497,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>>>>>>>>>                     case V4L2_PIX_FMT_MT21C:        descr = "Mediatek Compressed Format"; break;
>>>>>>>>>                     case V4L2_PIX_FMT_QC08C:        descr = "QCOM Compressed 8-bit Format"; break;
>>>>>>>>>                     case V4L2_PIX_FMT_QC10C:        descr = "QCOM Compressed 10-bit Format"; break;
>>>>>>>>> +               case V4L2_PIX_FMT_NV12M_V4H1C:  descr = "Synaptics Compressed 8-bit tiled Format";break;
>>>>>>>>> +               case V4L2_PIX_FMT_NV12M_10_V4H3P8C:     descr = "Synaptics Compressed 10-bit tiled Format";break;
>>>>>>>>>                     default:
>>>>>>>>>                             if (fmt->description[0])
>>>>>>>>>                                     return;
>>>>>>>>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>>>>>>>>> index 01e630f2ec78..7e928cb69e7c 100644
>>>>>>>>> --- a/include/uapi/linux/videodev2.h
>>>>>>>>> +++ b/include/uapi/linux/videodev2.h
>>>>>>>>> @@ -661,6 +661,8 @@ struct v4l2_pix_format {
>>>>>>>>>      #define V4L2_PIX_FMT_NV12MT_16X16 v4l2_fourcc('V', 'M', '1', '2') /* 12  Y/CbCr 4:2:0 16x16 tiles */
>>>>>>>>>      #define V4L2_PIX_FMT_NV12M_8L128      v4l2_fourcc('N', 'A', '1', '2') /* Y/CbCr 4:2:0 8x128 tiles */
>>>>>>>>>      #define V4L2_PIX_FMT_NV12M_10BE_8L128 v4l2_fourcc_be('N', 'T', '1', '2') /* Y/CbCr 4:2:0 10-bit 8x128 tiles */
>>>>>>>>> +#define V4L2_PIX_FMT_NV12M_V4H1C v4l2_fourcc('S', 'Y', '1', '2')   /* 12  Y/CbCr 4:2:0 tiles */
>>>>>>>>> +#define V4L2_PIX_FMT_NV12M_10_V4H3P8C v4l2_fourcc('S', 'Y', '1', '0')   /* 12  Y/CbCr 4:2:0 10-bits tiles */
>>>>>>>>>
>>>>>>>>>      /* Bayer formats - see https://urldefense.proofpoint.com/v2/url?u=http-3A__www.siliconimaging.com_RGB-2520Bayer.htm&d=DwIFaQ&c=7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0UY&r=P4xb2_7biqBxD4LGGPrSV6j-jf3C3xlR7PXU-mLTeZE&m=lkQiuhx0yMAYHGcW-0WaHlF3e2etMHsu-FoNIBdZILGH6FPigwSAmel2vAdcVLkp&s=JKsBzpb_3u9xv52MaMuT4U3T1pPqcObYkpHDBxvcx_4&e=   */
>>>>>>>>>      #define V4L2_PIX_FMT_SBGGR8  v4l2_fourcc('B', 'A', '8', '1') /*  8  BGBG.. GRGR.. */
>>>>>>
>>>>>
>>>>
>>>
>>
> 

-- 
Hsia-Jun(Randy) Li
