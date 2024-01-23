Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2260A838FD9
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 14:28:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 679AA10E795;
	Tue, 23 Jan 2024 13:28:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2043.outbound.protection.outlook.com [40.107.237.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0202D10E7CA
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 13:28:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P8ADoFQbReeZWDT6zpoM1zBg9hp8k9rPhxZWcx6IhJK9g4YQ4KWmJShaLf0orIyGzzaW48+AqmH3ubhVPB/yfYItmYz7R0jairDL1aXU588YId4h5xwmGshuwIHhHPD2HMCwDuwuaGaW5KUxbavjM40QzoNONN0zuqx7QKfyg6SLI8L57221T01LD1n4v/RDvcz4u4vLwbt+OG8s9h/Tq+VqrJBjhGmew6yuUnq2ahG3HDdlGZfAwiUBt6oY550Sny5Iiwi8/PUdd2nnPkyc1s975Iih2PQ66oX9AQoC9nWmA4qn5Q+fj2+RxI7HIWmp7rTdrjcypFEbYeQbFumqOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lSPJHYKosunKZLgxIioGCQRyVNTsSvFZskOVucv7UEw=;
 b=ArEe/zS60ILZ108t2btubHWL5uE9rqLzDHTqyNJBiHGgARR9D9w2hrEMGdjzZdeo4Jk0p22gDq2C/sB0bjbi5khnLh6LR65xicLd8U9bea2MZMM8W7qQRgdnvXTNsOymeOrbt1/oJcXV19IVmsfP1FbsdV3k7iz3YlDtHtqS4ABgvwhTeOZz+4O527pnWPtdfNeIiJygKumCs1Nhc4S10NnwBZvdSFZrAyjolxvc05+7wiCJX++RpxYYs9ZBtTOzncIn3kSQqyUQKS5cP94KfSts8bTbRn19zhPVJoQQZPanzYMALAKARvQ5UlNx3Fga0VBtIxZMPdlyvOZCEYCj1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lSPJHYKosunKZLgxIioGCQRyVNTsSvFZskOVucv7UEw=;
 b=MlWUs5WEGsh9Uid8R6zETBMml6mRz2raE9Qe9Cn9AIvuvtIQ8ChsmYpbj60kP0rYGswlkMQiFy+R72Bv0vRtjG1MIqTaCV+YoxY4uw2QdUBcji1CnCRE5WBSHddiMoBQsrwNNvKzraCG37PP4o5o/EA8GPX3qczoLk+cSiEBM1g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB7285.namprd12.prod.outlook.com (2603:10b6:303:22e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Tue, 23 Jan
 2024 13:28:18 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7202.031; Tue, 23 Jan 2024
 13:28:18 +0000
Content-Type: multipart/alternative;
 boundary="------------zGGu3dX8EMazW07Gs3tWx65o"
Message-ID: <577501f9-9d1c-4f8d-9882-7c71090e5ef3@amd.com>
Date: Tue, 23 Jan 2024 14:28:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [Linaro-mm-sig] [PATCH v5 1/6] dma-buf: Add
 dma_buf_{begin,end}_access()
Content-Language: en-US
To: Paul Cercueil <paul@crapouillou.net>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>
References: <20240119141402.44262-1-paul@crapouillou.net>
 <20240119141402.44262-2-paul@crapouillou.net>
 <8035f515-591f-4c87-bf0a-23d5705d9b1c@gmail.com>
 <442f69f31ece6d441f3dc41c3dfeb4dcf52c00b8.camel@crapouillou.net>
 <0b6b8738-9ea3-44fa-a624-9297bd55778f@amd.com>
 <e4620acdf24628d904cedcb0030d78b14559f337.camel@crapouillou.net>
 <85a89505-edeb-4619-86c1-157f7abdd190@amd.com>
 <0fe2755fb320027234c086bcc88fd107855234c5.camel@crapouillou.net>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <0fe2755fb320027234c086bcc88fd107855234c5.camel@crapouillou.net>
X-ClientProxiedBy: FR0P281CA0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB7285:EE_
X-MS-Office365-Filtering-Correlation-Id: 2155f6d4-032b-4199-295f-08dc1c1728ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XDgxK3ZhlopPknvD5l3bTdSQKxof7xmNhd0R89525JNn86b8Ru0Y0h6xRw+TuYDFkdHTCVW8rKNf1fb4JOMjIEAZw0TY4iqQNr/f07Gwl5u5AKP4wOunUU0lKThdRgmo7knfTqoslPFs+NYkJ2j+CDOZEgBViYpxW+v+0gPJoQM9GC78fHqAp1u4mqZieH59iRFR3UaLZu3R3p86ppwPlkB5zZgIJE6R3dC+6b74S8y022Pd75rqPLazKgdiXTMMnBRrwUnMw4pi6QzE2LECLlTaIEybgOiXvWjccRnz1csarqjBa7hRE0cqTqzoSwFrxp5a+nQjC3OcJH/53C0isOXsnwB4GKd1GB510RtucUi1eMqo8MwBi3ajw/RIarh5A0jNJsCWDIl5anGgxlNw9F7WoLKqEGZ2zohcLk0ZMCVBeb2CDjDWSpf1+aFDuEKE+SZ11A8n4iEWpTbBZM07tiQktOxFlucXvy0nRiVsDb647J3k0ntt8tF9/bHA5v38ZKa9VmBdbWEXpggXOHG490ADys2ze7BPME8pQjK5zKexVLMBlxwsj7x+hziJouYccIrLq6TG12dkI/xAi2VfjZZbJpA2U2TYdcMNt+ZqmJVb5oqNURGqsEpmMf+7v8Dms+lMLf6sTyGDCbEOpYcRow==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(396003)(376002)(346002)(39860400002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(31686004)(83380400001)(6512007)(6506007)(33964004)(2616005)(5660300002)(4326008)(8676002)(316002)(110136005)(66476007)(6666004)(66946007)(8936002)(66556008)(54906003)(6486002)(478600001)(26005)(30864003)(2906002)(7416002)(38100700002)(86362001)(31696002)(36756003)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2R4WHBHU2x2Z1grWlpjZ1V5NE9mWitOdlFoSTNKNklQTTY2UkRkTXhZZEZh?=
 =?utf-8?B?T3hoNVQ4cjcvajZOQ0RtUUpoNzQ5S0piQmdCZTFuSmNLTEFRcGQ1aExwOUV3?=
 =?utf-8?B?aE9qakVyYlZ0SG1iT01SUUNyTWJrQW9jaEs3MkpGdkRZYmNRQkdMR2tqa01N?=
 =?utf-8?B?NWRvVWJGeXBQeGhKcURURmlIUG9IUm9oelpZYWUxWndXSDdaU0YwUDlxS3FZ?=
 =?utf-8?B?RmZ2U1lnMFJiRTg0eDMzMW9VcUxNekFDNkt6Z3dNV1pZQ1FDNktVV0szK1l4?=
 =?utf-8?B?QVNnTzVITE90WndsWGpvbE04TUxnWlM2NjkxR2IvaVJGSVB2blRHcWpBS0JW?=
 =?utf-8?B?UGtSRFRYUTNiMEk5dk9BK3ZRNGgvckR5d01sRkpjRkdXWk9JUEgzbzVFTWRj?=
 =?utf-8?B?dUNXcHRhTnBiSk9yU0w4bVdNcUwrbTlDTmFuSjhWclMrZXMxQjNsOVlld3gv?=
 =?utf-8?B?dk96ZEpWRFc4bzVuTitPTXJZa1JFQ285dVJDRmFmRUlVZVhSaFNBS052N2pO?=
 =?utf-8?B?V2NRcUtmdjZHTXpvVHFKNC9iVldMTHc4dy9IMytGb0J3YWNUTW5MekNjMUw2?=
 =?utf-8?B?dVQxVkRzRjhLS1JiOUtFVS9wSitzaFNwY1JuSE16SzNIMGJ4S21wSkxTZldh?=
 =?utf-8?B?c3BFb2FKVGxtWU8xaEJ2SVh2K3BBdElkTkQ3ZTRtOUdkaWwzWHorVnBaTnRr?=
 =?utf-8?B?RjI0RFh4aVpkeExSL1F3MGlreWlsZENVQllnZzBoRTJIM0pRWTgwRTFXNVZj?=
 =?utf-8?B?Y2FRWW8xdWtPdEM5dXUvcTRIaDJEYWxyVS9iNVlMbURBRVJZT0RNV1Q0Qmdh?=
 =?utf-8?B?Nm5mNnpFNFo5STQxUnhvTU1zZEp0UzBqZTVNVE1TUHJZWWFoQ0FXSXlURDlu?=
 =?utf-8?B?L29YZVBYUWM3YXdiVWhFZlNGcWFiNnpxaFc2OEVIZDN6ZXZhbW5mRjJrdmhV?=
 =?utf-8?B?V3JnWnJOK1JCZFd2Zk1pOSttaE9lNEMrMTl3dmNEVmUxWkV0NTFRdHB3SUtM?=
 =?utf-8?B?NC9xaEhBNUtUb1d4dHp5c1ZsblR6NFVSRFpVUG1hclBJN01jVk15V3IzUml5?=
 =?utf-8?B?U0czY2EzOXZ2MTNLdm1rZHo2bEpMY1dRbmJ3UmZZTVIzcml6TTNaeU4ybVJQ?=
 =?utf-8?B?b01EK0JBRkxWUWhRWXF2ZERkUTRSc0hkSFh4WEpWTElod1VjQURWNnQyYm9Z?=
 =?utf-8?B?ZXBHdjkydktLWmJtUmxHekFOVHRVcVZZdFJWNWxZTXNQTTNDZTlXZGtFSzd2?=
 =?utf-8?B?b1VubEh0c3VCeFpHdzJpaTYydE81Y21GUHV1ZWlMMEI3TVpJQ2J6bjh6cGo3?=
 =?utf-8?B?by9IRnRUVHNST0pKeXB4cFI0N3dQNGdmcmxYTjM3TGNGVkV0Ylo4VFFLSFFL?=
 =?utf-8?B?Sk5NODMwRGlQT3V3STlaYjRDVGM5eGpYMlIvSUFTYVdnVlU4UTR2bEhCeDNZ?=
 =?utf-8?B?TXBRSUJHZXJUUjVhaVkwbncvZ1pjbWJ6V1daVGdSR3ZTZ2hPSVZaZkZhN0dT?=
 =?utf-8?B?R2JWM0M2VURHNklHaU1abG1XRFhzYWozdWlNVUdZMFRhQW1aa3RQZ3ZDNklK?=
 =?utf-8?B?RXBqVWswZ01OR25ONjh0KzB3S0JwNm5KWTJ6RkQ2dW1oMk16ZTNyTDdtK1M2?=
 =?utf-8?B?Z2QrNGZCSHNLbFpBelFTTmhSZDlYZkxYMVJHbDArbDZpc0NjY1ZvRU5GY1Uz?=
 =?utf-8?B?YjB3bkxiUlI4dzZQSEhuRnVCSjU0TVBSK0hqM1pBSEMrKzZMS1NzYThsMkJj?=
 =?utf-8?B?VU56U2lsNUEyMStPMnJtQVhBZDNaUE1nZXVRaEZmL0krUUhtbzNsbDBEQ05M?=
 =?utf-8?B?MjRPYzJmc2htVFpQN1MrV1ZHbUF6RzdUaGgxWVZVRlBGTGFJRUZXVmpEUlps?=
 =?utf-8?B?ckpNTVgweDgyMmtXaFBCdHJDUDAxVkdGV3VUNnIrajA4dzhXak1WUkhKbVVs?=
 =?utf-8?B?M21Yd3Y0U1F0WE5kQjY0VENXVGsxVWJscDIxWnYxVDZJMGV2Ui9UaE1UV0xt?=
 =?utf-8?B?Mm54VjhPVm1nZ3JqQVpmT0RQMEhGSkJJK09xZlFlM0FqSUI1QlpUUFFMbUtS?=
 =?utf-8?B?cllsNHZLSlVPZnJURDFMMjl3ZnBJK25IVDFvcEl4T0NDa3pZM1VhUHdqQ2Fm?=
 =?utf-8?Q?So5O7S52FfCwTmu88qykdaydV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2155f6d4-032b-4199-295f-08dc1c1728ff
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 13:28:17.9645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0NAj6N7v4/HVp+5OhHoF7vnNaZrB8SiU7dBRgByI9lE/2LvV6fDNxBmQQtKseZv2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7285
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
Cc: Daniel Vetter <daniel@ffwll.ch>,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-doc@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------zGGu3dX8EMazW07Gs3tWx65o
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 23.01.24 um 14:02 schrieb Paul Cercueil:
> [SNIP]
>>>> That an exporter has to call extra functions to access his own
>>>> buffers
>>>> is a complete no-go for the design since this forces exporters
>>>> into
>>>> doing extra steps for allowing importers to access their data.
>>> Then what about we add these dma_buf_{begin,end}_access(), with
>>> only
>>> implementations for "dumb" exporters e.g. udmabuf or the dmabuf
>>> heaps?
>>> And only importers (who cache the mapping and actually care about
>>> non-
>>> coherency) would have to call these.
>> No, the problem is still that you would have to change all importers
>> to
>> mandatory use dma_buf_begin/end.
>>
>> But going a step back caching the mapping is irrelevant for
>> coherency.
>> Even if you don't cache the mapping you don't get coherency.
> You actually do - at least with udmabuf, as in that case
> dma_buf_map_attachment() / dma_buf_unmap_attachment() will handle cache
> coherency when the SGs are mapped/unmapped.

Well I just double checked the source in 6.7.1 and I can't see udmabuf 
doing anything for cache coherency in map/unmap.

All it does is calling dma_map_sgtable() and dma_unmap_sgtable() to 
create and destroy the SG table and those are not supposed to sync 
anything to the CPU cache.

In other words drivers usually use DMA_ATTR_SKIP_CPU_SYNC here, it's 
just that this is missing from udmabuf.

> The problem was then that dma_buf_unmap_attachment cannot be called
> before the dma_fence is signaled, and calling it after is already too
> late (because the fence would be signaled before the data is sync'd).

Well what sync are you talking about? CPU sync? In DMA-buf that is 
handled differently.

For importers it's mandatory that they can be coherent with the 
exporter. That usually means they can snoop the CPU cache if the 
exporter can snoop the CPU cache.

For exporters you can implement the begin/end CPU access functions which 
allows you to implement something even if your exporting device can't 
snoop the CPU cache.

> Daniel / Sima suggested then that I cache the mapping and add new
> functions to ensure cache coherency, which is what these patches are
> about.

Yeah, I've now catched up on the latest mail. Sorry I haven't seen that 
before.

>
>> In other words exporters are not require to call sync_to_cpu or
>> sync_to_device when you create a mapping.
>>
>> What exactly is your use case here? And why does coherency matters?
> My use-case is, I create DMABUFs with udmabuf, that I attach to
> USB/functionfs with the interface introduced by this patchset. I attach
> them to IIO with a similar interface (being upstreamed in parallel),
> and transfer data from USB to IIO and vice-versa in a zero-copy
> fashion.
>
> This works perfectly fine as long as the USB and IIO hardware are
> coherent between themselves, which is the case on most of our boards.
> However I do have a board (with a Xilinx Ultrascale SoC) where it is
> not the case, and cache flushes/sync are needed. So I was trying to
> rework these new interfaces to work on that system too.

Yeah, that sounds strongly like one of the use cases we have rejected so 
far.

> If this really is a no-no, then I am fine with the assumption that
> devices sharing a DMABUF must be coherent between themselves; but
> that's something that should probably be enforced rather than assumed.
>
> (and I *think* there is a way to force coherency in the Ultrascale's
> interconnect - we're investigating it)

What you can do is that instead of using udmabuf or dma-heaps is that 
the device which can't provide coherency act as exporters of the buffers.

The exporter is allowed to call sync_for_cpu/sync_for_device on it's own 
buffers and also gets begin/end CPU access notfications. So you can then 
handle coherency between the exporter and the CPU.

If you really don't have coherency between devices then that would be a 
really new use case and we would need much more agreement on how to do this.

Regards,
Christian.

>
> Cheers,
> -Paul
>
>>> At the very least, is there a way to check that "the data can be
>>> accessed coherently by the involved devices"? So that my importer
>>> can
>>> EPERM if there is no coherency vs. a device that's already
>>> attached.
>> Yeah, there is functionality for this in the DMA subsystem. I've once
>> created prototype patches for enforcing the same coherency approach
>> between importer and exporter, but we never got around to upstream
>> them.
>>
>>
>>
>>> Cheers,
>>> -Paul
>>>
>>>> That in turn is pretty much un-testable unless you have every
>>>> possible
>>>> importer around while testing the exporter.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>> Cheers,
>>>>> -Paul
>>>>>
>>>>>>> Signed-off-by: Paul Cercueil<paul@crapouillou.net>
>>>>>>>
>>>>>>> ---
>>>>>>> v5: New patch
>>>>>>> ---
>>>>>>>      drivers/dma-buf/dma-buf.c | 66
>>>>>>> +++++++++++++++++++++++++++++++++++++++
>>>>>>>      include/linux/dma-buf.h   | 37 ++++++++++++++++++++++
>>>>>>>      2 files changed, 103 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-
>>>>>>> buf/dma-
>>>>>>> buf.c
>>>>>>> index 8fe5aa67b167..a8bab6c18fcd 100644
>>>>>>> --- a/drivers/dma-buf/dma-buf.c
>>>>>>> +++ b/drivers/dma-buf/dma-buf.c
>>>>>>> @@ -830,6 +830,8 @@ static struct sg_table *
>>>>>>> __map_dma_buf(struct
>>>>>>> dma_buf_attachment *attach,
>>>>>>>       *     - dma_buf_mmap()
>>>>>>>       *     - dma_buf_begin_cpu_access()
>>>>>>>       *     - dma_buf_end_cpu_access()
>>>>>>> + *     - dma_buf_begin_access()
>>>>>>> + *     - dma_buf_end_access()
>>>>>>>       *     - dma_buf_map_attachment_unlocked()
>>>>>>>       *     - dma_buf_unmap_attachment_unlocked()
>>>>>>>       *     - dma_buf_vmap_unlocked()
>>>>>>> @@ -1602,6 +1604,70 @@ void dma_buf_vunmap_unlocked(struct
>>>>>>> dma_buf
>>>>>>> *dmabuf, struct iosys_map *map)
>>>>>>>      }
>>>>>>>      EXPORT_SYMBOL_NS_GPL(dma_buf_vunmap_unlocked, DMA_BUF);
>>>>>>>      
>>>>>>> +/**
>>>>>>> + * @dma_buf_begin_access - Call before any hardware access
>>>>>>> from/to
>>>>>>> the DMABUF
>>>>>>> + * @attach:	[in]	attachment used for hardware
>>>>>>> access
>>>>>>> + * @sg_table:	[in]	scatterlist used for the DMA
>>>>>>> transfer
>>>>>>> + * @direction:  [in]    direction of DMA transfer
>>>>>>> + */
>>>>>>> +int dma_buf_begin_access(struct dma_buf_attachment
>>>>>>> *attach,
>>>>>>> +			 struct sg_table *sgt, enum
>>>>>>> dma_data_direction dir)
>>>>>>> +{
>>>>>>> +	struct dma_buf *dmabuf;
>>>>>>> +	bool cookie;
>>>>>>> +	int ret;
>>>>>>> +
>>>>>>> +	if (WARN_ON(!attach))
>>>>>>> +		return -EINVAL;
>>>>>>> +
>>>>>>> +	dmabuf = attach->dmabuf;
>>>>>>> +
>>>>>>> +	if (!dmabuf->ops->begin_access)
>>>>>>> +		return 0;
>>>>>>> +
>>>>>>> +	cookie = dma_fence_begin_signalling();
>>>>>>> +	ret = dmabuf->ops->begin_access(attach, sgt, dir);
>>>>>>> +	dma_fence_end_signalling(cookie);
>>>>>>> +
>>>>>>> +	if (WARN_ON_ONCE(ret))
>>>>>>> +		return ret;
>>>>>>> +
>>>>>>> +	return 0;
>>>>>>> +}
>>>>>>> +EXPORT_SYMBOL_NS_GPL(dma_buf_begin_access, DMA_BUF);
>>>>>>> +
>>>>>>> +/**
>>>>>>> + * @dma_buf_end_access - Call after any hardware access
>>>>>>> from/to
>>>>>>> the DMABUF
>>>>>>> + * @attach:	[in]	attachment used for hardware
>>>>>>> access
>>>>>>> + * @sg_table:	[in]	scatterlist used for the DMA
>>>>>>> transfer
>>>>>>> + * @direction:  [in]    direction of DMA transfer
>>>>>>> + */
>>>>>>> +int dma_buf_end_access(struct dma_buf_attachment *attach,
>>>>>>> +		       struct sg_table *sgt, enum
>>>>>>> dma_data_direction dir)
>>>>>>> +{
>>>>>>> +	struct dma_buf *dmabuf;
>>>>>>> +	bool cookie;
>>>>>>> +	int ret;
>>>>>>> +
>>>>>>> +	if (WARN_ON(!attach))
>>>>>>> +		return -EINVAL;
>>>>>>> +
>>>>>>> +	dmabuf = attach->dmabuf;
>>>>>>> +
>>>>>>> +	if (!dmabuf->ops->end_access)
>>>>>>> +		return 0;
>>>>>>> +
>>>>>>> +	cookie = dma_fence_begin_signalling();
>>>>>>> +	ret = dmabuf->ops->end_access(attach, sgt, dir);
>>>>>>> +	dma_fence_end_signalling(cookie);
>>>>>>> +
>>>>>>> +	if (WARN_ON_ONCE(ret))
>>>>>>> +		return ret;
>>>>>>> +
>>>>>>> +	return 0;
>>>>>>> +}
>>>>>>> +EXPORT_SYMBOL_NS_GPL(dma_buf_end_access, DMA_BUF);
>>>>>>> +
>>>>>>>      #ifdef CONFIG_DEBUG_FS
>>>>>>>      static int dma_buf_debug_show(struct seq_file *s, void
>>>>>>> *unused)
>>>>>>>      {
>>>>>>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-
>>>>>>> buf.h
>>>>>>> index 8ff4add71f88..8ba612c7cc16 100644
>>>>>>> --- a/include/linux/dma-buf.h
>>>>>>> +++ b/include/linux/dma-buf.h
>>>>>>> @@ -246,6 +246,38 @@ struct dma_buf_ops {
>>>>>>>      	 */
>>>>>>>      	int (*end_cpu_access)(struct dma_buf *, enum
>>>>>>> dma_data_direction);
>>>>>>>      
>>>>>>> +	/**
>>>>>>> +	 * @begin_access:
>>>>>>> +	 *
>>>>>>> +	 * This is called from dma_buf_begin_access() when
>>>>>>> a
>>>>>>> device driver
>>>>>>> +	 * wants to access the data of the DMABUF. The
>>>>>>> exporter
>>>>>>> can use this
>>>>>>> +	 * to flush/sync the caches if needed.
>>>>>>> +	 *
>>>>>>> +	 * This callback is optional.
>>>>>>> +	 *
>>>>>>> +	 * Returns:
>>>>>>> +	 *
>>>>>>> +	 * 0 on success or a negative error code on
>>>>>>> failure.
>>>>>>> +	 */
>>>>>>> +	int (*begin_access)(struct dma_buf_attachment *,
>>>>>>> struct
>>>>>>> sg_table *,
>>>>>>> +			    enum dma_data_direction);
>>>>>>> +
>>>>>>> +	/**
>>>>>>> +	 * @end_access:
>>>>>>> +	 *
>>>>>>> +	 * This is called from dma_buf_end_access() when a
>>>>>>> device
>>>>>>> driver is
>>>>>>> +	 * done accessing the data of the DMABUF. The
>>>>>>> exporter
>>>>>>> can
>>>>>>> use this
>>>>>>> +	 * to flush/sync the caches if needed.
>>>>>>> +	 *
>>>>>>> +	 * This callback is optional.
>>>>>>> +	 *
>>>>>>> +	 * Returns:
>>>>>>> +	 *
>>>>>>> +	 * 0 on success or a negative error code on
>>>>>>> failure.
>>>>>>> +	 */
>>>>>>> +	int (*end_access)(struct dma_buf_attachment *,
>>>>>>> struct
>>>>>>> sg_table *,
>>>>>>> +			  enum dma_data_direction);
>>>>>>> +
>>>>>>>      	/**
>>>>>>>      	 * @mmap:
>>>>>>>      	 *
>>>>>>> @@ -606,6 +638,11 @@ void dma_buf_detach(struct dma_buf
>>>>>>> *dmabuf,
>>>>>>>      int dma_buf_pin(struct dma_buf_attachment *attach);
>>>>>>>      void dma_buf_unpin(struct dma_buf_attachment *attach);
>>>>>>>      
>>>>>>> +int dma_buf_begin_access(struct dma_buf_attachment
>>>>>>> *attach,
>>>>>>> +			 struct sg_table *sgt, enum
>>>>>>> dma_data_direction dir);
>>>>>>> +int dma_buf_end_access(struct dma_buf_attachment *attach,
>>>>>>> +		       struct sg_table *sgt, enum
>>>>>>> dma_data_direction dir);
>>>>>>> +
>>>>>>>      struct dma_buf *dma_buf_export(const struct
>>>>>>> dma_buf_export_info
>>>>>>> *exp_info);
>>>>>>>      
>>>>>>>      int dma_buf_fd(struct dma_buf *dmabuf, int flags);

--------------zGGu3dX8EMazW07Gs3tWx65o
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 23.01.24 um 14:02 schrieb Paul Cercueil:<br>
    <blockquote type="cite" cite="mid:0fe2755fb320027234c086bcc88fd107855234c5.camel@crapouillou.net">[SNIP]<span style="white-space: pre-wrap">
</span>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">That an exporter has to call extra functions to access his own
buffers
is a complete no-go for the design since this forces exporters
into
doing extra steps for allowing importers to access their data.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Then what about we add these dma_buf_{begin,end}_access(), with
only
implementations for &quot;dumb&quot; exporters e.g. udmabuf or the dmabuf
heaps?
And only importers (who cache the mapping and actually care about
non-
coherency) would have to call these.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
No, the problem is still that you would have to change all importers
to 
mandatory use dma_buf_begin/end.

But going a step back caching the mapping is irrelevant for
coherency. 
Even if you don't cache the mapping you don't get coherency.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
You actually do - at least with udmabuf, as in that case
dma_buf_map_attachment() / dma_buf_unmap_attachment() will handle cache
coherency when the SGs are mapped/unmapped.</pre>
    </blockquote>
    <br>
    Well I just double checked the source in 6.7.1 and I can't see
    udmabuf doing anything for cache coherency in map/unmap.<br>
    <br>
    All it does is calling dma_map_sgtable() and dma_unmap_sgtable() to
    create and destroy the SG table and those are not supposed to sync
    anything to the CPU cache.<br>
    <br>
    In other words drivers usually use DMA_ATTR_SKIP_CPU_SYNC here, it's
    just that this is missing from udmabuf.<br>
    <br>
    <blockquote type="cite" cite="mid:0fe2755fb320027234c086bcc88fd107855234c5.camel@crapouillou.net">
      <pre class="moz-quote-pre" wrap="">The problem was then that dma_buf_unmap_attachment cannot be called
before the dma_fence is signaled, and calling it after is already too
late (because the fence would be signaled before the data is sync'd).</pre>
    </blockquote>
    <br>
    Well what sync are you talking about? CPU sync? In DMA-buf that is
    handled differently.<br>
    <br>
    For importers it's mandatory that they can be coherent with the
    exporter. That usually means they can snoop the CPU cache if the
    exporter can snoop the CPU cache.<br>
    <br>
    For exporters you can implement the begin/end CPU access functions
    which allows you to implement something even if your exporting
    device can't snoop the CPU cache.<br>
    <br>
    <blockquote type="cite" cite="mid:0fe2755fb320027234c086bcc88fd107855234c5.camel@crapouillou.net">
      <pre class="moz-quote-pre" wrap="">Daniel / Sima suggested then that I cache the mapping and add new
functions to ensure cache coherency, which is what these patches are
about.</pre>
    </blockquote>
    <br>
    Yeah, I've now catched up on the latest mail. Sorry I haven't seen
    that before.<br>
    <br>
    <blockquote type="cite" cite="mid:0fe2755fb320027234c086bcc88fd107855234c5.camel@crapouillou.net">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">In other words exporters are not require to call sync_to_cpu or 
sync_to_device when you create a mapping.

What exactly is your use case here? And why does coherency matters?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
My use-case is, I create DMABUFs with udmabuf, that I attach to
USB/functionfs with the interface introduced by this patchset. I attach
them to IIO with a similar interface (being upstreamed in parallel),
and transfer data from USB to IIO and vice-versa in a zero-copy
fashion.

This works perfectly fine as long as the USB and IIO hardware are
coherent between themselves, which is the case on most of our boards.
However I do have a board (with a Xilinx Ultrascale SoC) where it is
not the case, and cache flushes/sync are needed. So I was trying to
rework these new interfaces to work on that system too.</pre>
    </blockquote>
    <br>
    Yeah, that sounds strongly like one of the use cases we have
    rejected so far.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:0fe2755fb320027234c086bcc88fd107855234c5.camel@crapouillou.net">
      <pre class="moz-quote-pre" wrap="">
If this really is a no-no, then I am fine with the assumption that
devices sharing a DMABUF must be coherent between themselves; but
that's something that should probably be enforced rather than assumed.

(and I *think* there is a way to force coherency in the Ultrascale's
interconnect - we're investigating it)</pre>
    </blockquote>
    <br>
    What you can do is that instead of using udmabuf or dma-heaps is
    that the device which can't provide coherency act as exporters of
    the buffers.<br>
    <br>
    The exporter is allowed to call sync_for_cpu/sync_for_device on it's
    own buffers and also gets begin/end CPU access notfications. So you
    can then handle coherency between the exporter and the CPU.<br>
    <br>
    If you really don't have coherency between devices then that would
    be a really new use case and we would need much more agreement on
    how to do this.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:0fe2755fb320027234c086bcc88fd107855234c5.camel@crapouillou.net">
      <pre class="moz-quote-pre" wrap="">

Cheers,
-Paul

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">At the very least, is there a way to check that &quot;the data can be
accessed coherently by the involved devices&quot;? So that my importer
can
EPERM if there is no coherency vs. a device that's already
attached.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Yeah, there is functionality for this in the DMA subsystem. I've once
created prototype patches for enforcing the same coherency approach 
between importer and exporter, but we never got around to upstream
them.



</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
Cheers,
-Paul

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">That in turn is pretty much un-testable unless you have every
possible
importer around while testing the exporter.

Regards,
Christian.

</pre>
            <blockquote type="cite">
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">Regards,
Christian.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">Cheers,
-Paul

</pre>
              <blockquote type="cite">
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">Signed-off-by: Paul Cercueil <a class="moz-txt-link-rfc2396E" href="mailto:paul@crapouillou.net">&lt;paul@crapouillou.net&gt;</a>

---
v5: New patch
---
&nbsp;&nbsp;&nbsp; drivers/dma-buf/dma-buf.c | 66
+++++++++++++++++++++++++++++++++++++++
&nbsp;&nbsp;&nbsp; include/linux/dma-buf.h&nbsp;&nbsp; | 37 ++++++++++++++++++++++
&nbsp;&nbsp;&nbsp; 2 files changed, 103 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-
buf/dma-
buf.c
index 8fe5aa67b167..a8bab6c18fcd 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -830,6 +830,8 @@ static struct sg_table *
__map_dma_buf(struct
dma_buf_attachment *attach,
&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp; - dma_buf_mmap()
&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp; - dma_buf_begin_cpu_access()
&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp; - dma_buf_end_cpu_access()
+ *&nbsp;&nbsp;&nbsp;&nbsp; - dma_buf_begin_access()
+ *&nbsp;&nbsp;&nbsp;&nbsp; - dma_buf_end_access()
&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp; - dma_buf_map_attachment_unlocked()
&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp; - dma_buf_unmap_attachment_unlocked()
&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp; - dma_buf_vmap_unlocked()
@@ -1602,6 +1604,70 @@ void dma_buf_vunmap_unlocked(struct
dma_buf
*dmabuf, struct iosys_map *map)
&nbsp;&nbsp;&nbsp; }
&nbsp;&nbsp;&nbsp; EXPORT_SYMBOL_NS_GPL(dma_buf_vunmap_unlocked, DMA_BUF);
&nbsp;&nbsp;&nbsp; 
+/**
+ * @dma_buf_begin_access - Call before any hardware access
from/to
the DMABUF
+ * @attach:	[in]	attachment used for hardware
access
+ * @sg_table:	[in]	scatterlist used for the DMA
transfer
+ * @direction:&nbsp; [in]&nbsp;&nbsp;&nbsp; direction of DMA transfer
+ */
+int dma_buf_begin_access(struct dma_buf_attachment
*attach,
+			 struct sg_table *sgt, enum
dma_data_direction dir)
+{
+	struct dma_buf *dmabuf;
+	bool cookie;
+	int ret;
+
+	if (WARN_ON(!attach))
+		return -EINVAL;
+
+	dmabuf = attach-&gt;dmabuf;
+
+	if (!dmabuf-&gt;ops-&gt;begin_access)
+		return 0;
+
+	cookie = dma_fence_begin_signalling();
+	ret = dmabuf-&gt;ops-&gt;begin_access(attach, sgt, dir);
+	dma_fence_end_signalling(cookie);
+
+	if (WARN_ON_ONCE(ret))
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(dma_buf_begin_access, DMA_BUF);
+
+/**
+ * @dma_buf_end_access - Call after any hardware access
from/to
the DMABUF
+ * @attach:	[in]	attachment used for hardware
access
+ * @sg_table:	[in]	scatterlist used for the DMA
transfer
+ * @direction:&nbsp; [in]&nbsp;&nbsp;&nbsp; direction of DMA transfer
+ */
+int dma_buf_end_access(struct dma_buf_attachment *attach,
+		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct sg_table *sgt, enum
dma_data_direction dir)
+{
+	struct dma_buf *dmabuf;
+	bool cookie;
+	int ret;
+
+	if (WARN_ON(!attach))
+		return -EINVAL;
+
+	dmabuf = attach-&gt;dmabuf;
+
+	if (!dmabuf-&gt;ops-&gt;end_access)
+		return 0;
+
+	cookie = dma_fence_begin_signalling();
+	ret = dmabuf-&gt;ops-&gt;end_access(attach, sgt, dir);
+	dma_fence_end_signalling(cookie);
+
+	if (WARN_ON_ONCE(ret))
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(dma_buf_end_access, DMA_BUF);
+
&nbsp;&nbsp;&nbsp; #ifdef CONFIG_DEBUG_FS
&nbsp;&nbsp;&nbsp; static int dma_buf_debug_show(struct seq_file *s, void
*unused)
&nbsp;&nbsp;&nbsp; {
diff --git a/include/linux/dma-buf.h b/include/linux/dma-
buf.h
index 8ff4add71f88..8ba612c7cc16 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -246,6 +246,38 @@ struct dma_buf_ops {
&nbsp;&nbsp;&nbsp;&nbsp;	 */
&nbsp;&nbsp;&nbsp;&nbsp;	int (*end_cpu_access)(struct dma_buf *, enum
dma_data_direction);
&nbsp;&nbsp;&nbsp; 
+	/**
+	 * @begin_access:
+	 *
+	 * This is called from dma_buf_begin_access() when
a
device driver
+	 * wants to access the data of the DMABUF. The
exporter
can use this
+	 * to flush/sync the caches if needed.
+	 *
+	 * This callback is optional.
+	 *
+	 * Returns:
+	 *
+	 * 0 on success or a negative error code on
failure.
+	 */
+	int (*begin_access)(struct dma_buf_attachment *,
struct
sg_table *,
+			&nbsp;&nbsp;&nbsp; enum dma_data_direction);
+
+	/**
+	 * @end_access:
+	 *
+	 * This is called from dma_buf_end_access() when a
device
driver is
+	 * done accessing the data of the DMABUF. The
exporter
can
use this
+	 * to flush/sync the caches if needed.
+	 *
+	 * This callback is optional.
+	 *
+	 * Returns:
+	 *
+	 * 0 on success or a negative error code on
failure.
+	 */
+	int (*end_access)(struct dma_buf_attachment *,
struct
sg_table *,
+			&nbsp; enum dma_data_direction);
+
&nbsp;&nbsp;&nbsp;&nbsp;	/**
&nbsp;&nbsp;&nbsp;&nbsp;	 * @mmap:
&nbsp;&nbsp;&nbsp;&nbsp;	 *
@@ -606,6 +638,11 @@ void dma_buf_detach(struct dma_buf
*dmabuf,
&nbsp;&nbsp;&nbsp; int dma_buf_pin(struct dma_buf_attachment *attach);
&nbsp;&nbsp;&nbsp; void dma_buf_unpin(struct dma_buf_attachment *attach);
&nbsp;&nbsp;&nbsp; 
+int dma_buf_begin_access(struct dma_buf_attachment
*attach,
+			 struct sg_table *sgt, enum
dma_data_direction dir);
+int dma_buf_end_access(struct dma_buf_attachment *attach,
+		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct sg_table *sgt, enum
dma_data_direction dir);
+
&nbsp;&nbsp;&nbsp; struct dma_buf *dma_buf_export(const struct
dma_buf_export_info
*exp_info);
&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp; int dma_buf_fd(struct dma_buf *dmabuf, int flags);
</pre>
                </blockquote>
              </blockquote>
            </blockquote>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------zGGu3dX8EMazW07Gs3tWx65o--
