Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 513E159D1AE
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 09:04:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F02898C58;
	Tue, 23 Aug 2022 07:04:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC73AAFA45
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 07:03:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h2IbQGeDehX1Ngs6Ut5gd2JvKUjZGTLDd6dNSREcLFwWY7gFuQUYt2GpWr1BtUvKEiEq5f6raXEfKJ3EGOLMys2H7d7ZATp753N1y8/+9VyFIPeBwVPOaiY2Kkwo+TIq/c0yxo1NIL5ajAKYldU6RUSOJoS2LlrzQ4BWhuMxpQ0lrG0BR7JW2bFv3qwDvB8Rs2/VUbRAvzE4GDDFyXqgD18nWZCxYsPx6ozuf/LTW7At7lJAe9xXplDg5e9EYMt09rlxfcLHT+qNquwlrWaDAcDVk1lgxL11au30dbAhpdeJxUxo9VNe4ym4ZbtVOGYrz8VtGEXhYZkTmAKntF6fMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5pH7FUIEM+FntB/+xmjVUAaK8Db43yvd96VDAtAbt9M=;
 b=UrnTjLyiTfsqOWKYld+EPq1dt3NiA4gqpzX1hcO1KktuF5rJy7XZr6Ks+UNbbm1z9sDiw3klWXOhE2rQmyvvP8NI8WZwzmX6ybcQTJmmI2MKKAEGWP+TeGUc9rDMhCQ55P5mKIdyjf0JqRW3M5bGLlD8KRIqfaQXg5SD8tE3D2LQTFLYqRd2E+RPZhUqrE1OBfIjVIOYUO4N+D1AwMfTrrijsNTjc3nKvZXo043BfG/dbbEfw0P/D6Hwow3gxz4CiEkRMCtlGqL46mjnpDbrfM+FKX/NVu7eHHN8WyDYxZdT/ziVd4IHUfaF88CIp3PG3vTZPsEBHlRy7MkqzyXwZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5pH7FUIEM+FntB/+xmjVUAaK8Db43yvd96VDAtAbt9M=;
 b=KPZRlbNKtDy7HYd2rFjaYOYhOcPFWFzuDk6PzzwCwpmg/5Feui8no+DexvItnvc5RaTNA7yiICbs2YDveghCF3+o6yBXKPA2cAlZ3Dyyaze4ES9avbjOZNbf+PwyMr4dX7uUPGibwHWBjVZIKnFnr5YrsqsdIt42hIgwOzMB8BY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Tue, 23 Aug
 2022 07:03:49 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::c832:eea0:1883:a19c]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::c832:eea0:1883:a19c%3]) with mapi id 15.20.5566.014; Tue, 23 Aug 2022
 07:03:49 +0000
Message-ID: <93ebc96e-5750-bb6b-c97e-a178c8d49952@synaptics.com>
Date: Tue, 23 Aug 2022 15:03:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/2] [WIP]: media: Add Synaptics compressed tiled format
Content-Language: en-US
To: Tomasz Figa <tfiga@chromium.org>
References: <20220808162750.828001-1-randy.li@synaptics.com>
 <20220808162750.828001-3-randy.li@synaptics.com>
 <CAAFQd5AKjpJ+fPAeCqdNnJbS4R7SdaHkfyW4qG1xXr-sE801pQ@mail.gmail.com>
 <13d37c15-79f3-4e16-8cf4-fc37846f4a04@synaptics.com>
 <Yv7HnHE7bLmgq5D0@pendragon.ideasonboard.com>
 <6da7faf329128312f0862f555d1a855437ae99f3.camel@ndufresne.ca>
 <50dd9b7a-8f48-0799-57f6-048d20de8dcc@synaptics.com>
 <CAAFQd5D-eG-1cHvRX2nF0nKv6Zz3vVq6_KJ7HV0zZjADV9v1Zg@mail.gmail.com>
From: Hsia-Jun Li <Randy.Li@synaptics.com>
In-Reply-To: <CAAFQd5D-eG-1cHvRX2nF0nKv6Zz3vVq6_KJ7HV0zZjADV9v1Zg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY8PR22CA0016.namprd22.prod.outlook.com
 (2603:10b6:930:45::27) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8dfd36b-920a-449b-98e9-08da84d5a12d
X-MS-TrafficTypeDiagnostic: DS7PR03MB5608:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OYv0hNVXQNXsCb5yteiUxaczVjdZb0hXJT1UhWuyNdbX/YnUCDx3XEBr5WWtE/ks5FNkltTx2KP+RS00n0s3ye3zgJII9/W/yXo4AWcQ+5UTmjnonmPjhuHdHdg3ZF+Jk+jshPolJquLEsZftzWLsmn8TXZXH9+mYxmse5zgV9hLN5qv6MrHnoTvKBztCr774BBK/Bnq0G/VLCe7LuAWyY6C9PQSliCwz3mN3MVFqqd0wgwpRPpGdr21DKPJQN7zXPnnVM1MyZDnXS1wFAg0/Myrdc38k0TgtkEc0Hn94jOA2/qu+WIuIJN8ElUSvkcOL1lvKvq6wgBVeCcHq6UHgUS6JpXAxF2IFwpPOuh8k4u90CyQyh99xpS264RKqhsSk2Es5WlDzXn7rbznPBYJsn55hJFq0wFenL0Bj2Kw7ZpatD1C5/aN/3hYbAM74I5ztIOvLzTopX2fHasvagumZBom0cBWGrfNWC0N8oYy7uKKu1tGrubPViwND6gb/fRGtBDZb9zq8afPMOik39qR1g1nYRGevHzh+1+DglWl9RSwncxnfcXFYGWQHDwCTWjIQE2vMkejdpOtTAXj+LnLkP8l+VAh9QRYH/LFpr4egcpQspEtEzwsDrO5Cf5HT+nEyMZZwWZCIMumc8ENHlfFUQPsJSV29E6B1gTHxVivgQQ2zGQ/42zQIIaiAUbRCBNIrb6ZZ9w+EV2yHu8rZ2wsEuf6lGMPL8rwYL1hwcTwBRU8iYQZIKMcdbuDsOkpZqhI9HiIrls410GMzg2J1VEBoStFsB2clFTq6rcL8xgrnQcLqBOqxoJaOuOLGtXgTP6vDDsfA3SBHcV7Qy2TcmcJVkY9pj+owR0OfLpyRmv/tLc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5196.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(136003)(366004)(39860400002)(346002)(376002)(66574015)(31696002)(86362001)(2616005)(186003)(38350700002)(38100700002)(83380400001)(8936002)(7416002)(5660300002)(6506007)(31686004)(4326008)(8676002)(66946007)(66556008)(66476007)(36756003)(2906002)(6486002)(966005)(478600001)(41300700001)(6666004)(6512007)(54906003)(6916009)(316002)(53546011)(52116002)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2o5TjEvTTk1VWZNbmxtc3pxeEsxZm94c2puRGtCVklnWFRkYnRJbTdkUXdB?=
 =?utf-8?B?S1ZSanVqcXhwQ2dqVkpacEQ1TFVIc1dRRWJLU0JBUXFmVHE0d2Y4Z2Z1cVdz?=
 =?utf-8?B?UVROb2dyWlhlNUJuVjVCNGg4Vk5uTTdYTTZ3ZDNBM21zMEc2emNzb2V1ZTRP?=
 =?utf-8?B?STB1M2NkejhUa1RNRDFMWkVHcTFzeW9EYTEyVFZscmxSODU3eXI0UHV1QlRR?=
 =?utf-8?B?Njk1UUphVmU0UkdjNlFKbDF6UEVHSnpxK29aaHpqZUl6UkxTcklqRnpOcjFI?=
 =?utf-8?B?SFY0aUlUMDlpOVo5eFBFNEVPSDk1ZUZNN0RRU2s5SVJvSDhyL0VTS1JaZlE1?=
 =?utf-8?B?bEEzTlJWUHNnTjFWNTkrZmpSbm1oa0tEK0g5UDU1ZlFhcnFHY3pBQXVxMkRI?=
 =?utf-8?B?VVBNZ0tvamdSWGd3ZC9GZi9aQUtPWmE3SUtWekJHViswdWNxUG1ZSFlUdm5l?=
 =?utf-8?B?MTNWUTYwU1I3VmdSVHhaZTZ0RS9ucDFpYXNuOThpZFdILzIxcXJtTWd5Zjd3?=
 =?utf-8?B?WGg2RlBjeE9SaXJsc1hmY1BoR1NHSkVUSmcvblVWRzF0QTZybllicjhvbWQx?=
 =?utf-8?B?VFZiQUJkM1p3QzJlMWJETXhhYlJXZmYrcU1aQjJkRVVrT1FxUThrUzhGMm5S?=
 =?utf-8?B?OGJFelNkYThDUGpteFJROGFTeklXQmJ1bFNkUCtTVVl3aGltSW8ycEI3QWtZ?=
 =?utf-8?B?Ym50TzJLamtYajBTcXBHeEM4U3Q5MG5hYU9RYld5SVdva0RROUNObUNrUVFN?=
 =?utf-8?B?WDBiZThYZ1JGVHhybStkLy9rNzU1aUN3cko3dVlkV0dhVlljMXZNQlR4cWl3?=
 =?utf-8?B?NGhBSUJMWFJ0ZnhCQTNjRnIxTHF0bEl0RXJ4M3ZPZ2tIdzdrUTBNRzZucEZp?=
 =?utf-8?B?VmtMRGg1UDZxek5Pc3luMDVHRVg3dGRxUWZXTGlsdHVPaVltYlo1WkI0bHpZ?=
 =?utf-8?B?bEYva1UraERza2c4dG9tTjUrREQ2bUxQQXJxclIzVmI4SWFmL2p2d1FLckZO?=
 =?utf-8?B?RTUvTkJhSDJabzVpa3VrVlBBQVovTzk1b3doSlRLbXQyZHVBci9keE1aK2pH?=
 =?utf-8?B?RkIwWWlieWVIZDVQOXJJMlNkc2kxSEsrV2IrSTUzOCtXVGYyVnEzS2kwazND?=
 =?utf-8?B?Sm1jR0lSdEgxd1JQZ0N1QUpJMW85V2hxUUpqZnRjMnlzSXBmcmY0MmJ3cEVB?=
 =?utf-8?B?VFZ4K3dVNXNKVDEvcUxLbHRhTStQdzhGaWdMTGxIYWFmKzZzSUtpaW56NDY5?=
 =?utf-8?B?MFYvYVV1NlhVRStGcWlUZmFXL1NpNFE0OXlBeHh4K01ITndzUys2SFRweVIw?=
 =?utf-8?B?c3JFekV0WElpVi9UaDdpdjNJQVcvanlxb2JJTmx4OTJJTjVXWXNaNzUrZFJZ?=
 =?utf-8?B?M0dCdU9udmo4YmtZcjZuZXlJQ3hEOEVkTTVDbithbVRHdXVoUXdOTDFNYS9l?=
 =?utf-8?B?eVpTVUx3TzZUUlQxYWI0b0VvMHZvbHpXOXp1MXRaVHA1OUdmaW5LUGgvQWtY?=
 =?utf-8?B?bURHQ25JbklMaEN5anc0L2Z0RGxZMk9vVDE2M0wyWTVTL1RaYnpyc2EvalNX?=
 =?utf-8?B?TG44SzV6akJzKzd0VktGR3oyTDVjU3FLclpiMjVJZk9vRlFLZDF2S0ZIc2hE?=
 =?utf-8?B?RGgzNzdPWXlCUFgxQ2IzTG1BOHJkTUJkUGZPcTFYUGhWdHFWaVFOUFdhcUJz?=
 =?utf-8?B?emVxY25mWXdxbmR4VlZ3S2FJVFoyVXUrT0dXMm5nUUlWMExwMkIva3VFQXlh?=
 =?utf-8?B?UTBIVmdXTkVnY1o0OTBZMFJKU01MdVo3VVRHVWxNN2tjOG04dUVjQXd1elVH?=
 =?utf-8?B?UVIwRU1RdUpaUEFwN09vME9UV3hQOU1zU0dEcjUvZSsvMzd0aEF4Wi94Q2pq?=
 =?utf-8?B?UVhCUTNVNFZGbDIrQXQvUkZubDhKVVg0RVlrdGloekNhMmxVekExQjNicmZy?=
 =?utf-8?B?aHJyelU2aUZ1dVlvU0lYb1Q1Rk9xSnZTbmFXd3g1c21NM2Y3ckZwckZHQnNW?=
 =?utf-8?B?R3QzSUlqdDZtREIyeHFPdjJYUlNRbUxQcHBHb1J1RlhiY3hjNzVuZyt3Uisz?=
 =?utf-8?B?Nk1GcXdlaEV2ZE00RlBrbWREUkJEVFZRSXZjTG9PZ1ZBOTE2T21LUHVDK3B5?=
 =?utf-8?Q?yVz7U9biMRVmclA+eWlJE7hAy?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8dfd36b-920a-449b-98e9-08da84d5a12d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 07:03:49.4772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NlzNTE+58rz7vz3ruOHyn8a9CdjOvXTtu/1XTbI5TNI+d51XPkNrQAInvcCzx4bSVLOCthk37543FkMsLjMtEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5608
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
 linux-media@vger.kernel.org, Nicolas Dufresne <nicolas@ndufresne.ca>,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
 jszhang@kernel.org, ezequiel@vanguardiasur.com.ar
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/23/22 14:05, Tomasz Figa wrote:
> CAUTION: Email originated externally, do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> 
> On Sat, Aug 20, 2022 at 12:44 AM Hsia-Jun Li <Randy.Li@synaptics.com> wrote:
>>
>>
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
> 
> I believe what Nicolas is suggesting is to just keep the MV buffer
> handling completely separate from video buffers. Just keep a map
> between frame buffer and MV buffer in the driver and use the right
> buffer when triggering a decode.
> 
>>
>> You could consider this as a security requirement(the memory region for
>> the MV could only be accessed by the decoder) or hardware limitation.
>>
>> It is also not very easy to manage such a large buffer that would change
>> when the resolution changed.
> 
> How does it differ from managing additional planes of video buffers?
I should say I am not against his suggestion if I could make a DMA-heap 
v4l2 allocator merge into kernel in the future. Although I think we need 
two heaps here one for the normal video and one for the secure video, I 
don't have much idea on how to determine whether we are decoding a 
secure or non-secure video here (The design here is that the kernel 
didn't know, only hardware and TEE care about that).

Just one place that I think it would be more simple for me to manage the 
buffer here. When the decoder goes to the drain stage, then the MV 
buffer goes when the data buffer goes and create when the data buffer 
creates.
I know that is not a lot of work to doing the mapping between them. I 
just need to convince the other accepting that do not allocator the MV 
buffer outside.
> 
> Best regards,
> Tomasz
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
>> --
>> Hsia-Jun(Randy) Li

-- 
Hsia-Jun(Randy) Li
