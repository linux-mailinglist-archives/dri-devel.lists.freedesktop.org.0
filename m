Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA2D841F4E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 10:23:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1475310E5BA;
	Tue, 30 Jan 2024 09:23:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2080.outbound.protection.outlook.com [40.107.101.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 491D4112E85
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 09:23:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c9UGvQrRHL5ygtJmqlqUSxa6MJIWFggrZsNHKnVrdLkrdH6HuLLGgF5HOxQ8OoHtwgPH7LVVWCG31MgrXBcXAaVwaLVkqS9YmhluFIAfDpd2BQGruTi8zpwveEZCbhFAx1hIKM6x/h54bbCAx4ShHyrbAdpfIJiRtq2ipdljLH77IomAm3Wwt2Qu9NSYMXTzBJ+pHhQ4kxST4mFqy6f6R+eaUJ5TUdfr+2XD6lImB+HHIrQEIZND9Kz0h5eCP2pWYyPOzMlTS1qRI9KVw4XrLC0O0BlI7wfe3LueKB1yhD2al9w8iInh5dph++MNTlDdU4wtZ1Fx4tFx1Ym+2q7v0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kXfQfrIHc3x2PcJqJUcWl8K4YGMYUBJH6pPbpQJzH2o=;
 b=LU1zcbucK3CjrF9e4sasdwiGJriYKMgnPWswvMCLOR6Ycedz9OBw4KXyPByO8FSlf5iAkSiX8BtRnmYGouggPJr6W2aYTQjAuiP1Sdd7cU8zH7mqG0hhFVpailJQQP7POtYLQy+6xQWRfLkvYgkULxZwlyTZNl5AekYnqASR6MIP6snAdwvNkQHJSZaDYnxJy/Gpqq+M1wOd4SDFV0kZkv7QQ8xhyuEpZ0JbUr+50GdLTM+B0x3lLrKjWW1i2EvLuZXesRgQkdIdCCmU3Eegh5IYVEX50wAdpa52WWAjRCGChoOU/fqqUMzNaQUm6KlsVAtyiQy72SHtBo+Yfe+XjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kXfQfrIHc3x2PcJqJUcWl8K4YGMYUBJH6pPbpQJzH2o=;
 b=ninPq2Z3LeLrKNe1OCdHb/CW4GVaGUZort7uHTycBykqZgyq+MmxtVDYACmKNg9ATPB6LwWminBAOYdZwpMvZK2yeDXqsm3tw9dD1qxv9RjcBXSWp+o1Rfpb6kOEoBitfU3Dq6HUhqpDAcA+OIf21/0eOsd9AlnTLUj0/e1x+eE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW6PR12MB8835.namprd12.prod.outlook.com (2603:10b6:303:240::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Tue, 30 Jan
 2024 09:23:10 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7228.029; Tue, 30 Jan 2024
 09:23:10 +0000
Content-Type: multipart/alternative;
 boundary="------------5m8sjxDsz0pGlkoY4VWMJ9px"
Message-ID: <a2346244-e22b-4ff6-b6cd-1da7138725ae@amd.com>
Date: Tue, 30 Jan 2024 10:23:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [Linaro-mm-sig] Re: [PATCH v5 1/6] dma-buf: Add
 dma_buf_{begin,end}_access()
Content-Language: en-US
To: Paul Cercueil <paul@crapouillou.net>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <noname.nuno@gmail.com>, Michael Hennerich <Michael.Hennerich@analog.com>,
 linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Christoph Hellwig <hch@lst.de>
References: <442f69f31ece6d441f3dc41c3dfeb4dcf52c00b8.camel@crapouillou.net>
 <0b6b8738-9ea3-44fa-a624-9297bd55778f@amd.com>
 <e4620acdf24628d904cedcb0030d78b14559f337.camel@crapouillou.net>
 <85a89505-edeb-4619-86c1-157f7abdd190@amd.com>
 <0fe2755fb320027234c086bcc88fd107855234c5.camel@crapouillou.net>
 <577501f9-9d1c-4f8d-9882-7c71090e5ef3@amd.com>
 <7928c0866ac5b2bfaaa56ad3422bedc9061e0f7b.camel@crapouillou.net>
 <2ac7562c-d221-409a-bfee-1b3cfcc0f1c6@amd.com>
 <ZbKiCPhRvWaz4Icn@phenom.ffwll.local>
 <c97e38ee-b860-4990-87f1-3e59d7d9c999@amd.com>
 <Zbi6zQYtnfOZu5Wh@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <Zbi6zQYtnfOZu5Wh@phenom.ffwll.local>
X-ClientProxiedBy: FR3P281CA0112.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW6PR12MB8835:EE_
X-MS-Office365-Filtering-Correlation-Id: c1d8de70-5bae-41ca-83dd-08dc21751364
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7wf1cM5iEmQPTWqMwmhZGuRcr6JPVlL9YN4sGIxbg19FmfHg76fuKHs89vfeBR4szua/qTqvCVarZwQyG7QhPNSmCFujA3zZUU6tFZ9fUlQD5r7LJypSJHMKb8cKfLnOhKXMQaUhufrSgL1sv+93Yb/PbZqEK0UF6nrczUQNWy33P5NFAJGgvrM3B6IvLlpqXBz4pT/q0WuM3Ya3xit3SHe2N3ZHpLzxV9SSWZ5qTqIpFsgHaaONEP+vy45+bpQ42QCO/XDA+OHp/MPW7P2VaeY/1jV8bsyvs8kzFfp6elHUrflBGKTLzsGpATaIB6rAeihuOPyHLrmTYeXGtvGOBsIKAbCNtjFjkCeThLQ0tAVpGf7GK/ShqBh4T5pwR75+X8atoDZeyq/Zule3veF6MlPoEiPttCtEM9/i7Jlht7euNu4LEs8Iil+Mqdsm2PiF/clf8WyZuMxPTWJ368o6hYcdsGIQgKR5k9bt9Dj4O2Ld4KtuLRdPLAAQX2WgL2lsOVeqngtJqZT6aUb0IFzHsxlAgLb/TYPr/8KxpGVTT+QRGtS2bTD6RMZvDb4jk8VazCXNhfcQFUvq64FkC5poUhvmmmD5k02L7hF9VZaRjtk/xIeneWKGUWkNlNrtnve0ljlegoh4F8ZDDYcjM0IMN+CLVRxAc6owSnEmJAY3vyw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(396003)(136003)(376002)(346002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(110136005)(38100700002)(66556008)(66476007)(2906002)(8936002)(66946007)(316002)(8676002)(6486002)(6506007)(33964004)(31696002)(7416002)(86362001)(36756003)(31686004)(5660300002)(83380400001)(41300700001)(26005)(921011)(2616005)(66899024)(6512007)(66574015)(478600001)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFhuaUJGK2NhZTNTeXd3QXZhM05PRUZsaUcvckYwcEozSjRlejVpTE1MMGV2?=
 =?utf-8?B?QUxaT3FRRGhqS0pTMWExek1BOHgrQ3UvSzlQNUlRdEpmY3Yvd21QM3NVRHVG?=
 =?utf-8?B?ZzQvVmRGWjZEMWI1UnZTVmY0K0tXc3BGNkVTMythbXFaZzFmM1hyZVJTMHFO?=
 =?utf-8?B?ZFdYWXNsVk9VQzZMN3o3a01YQ3dHbFlXNkdvZjVrVDU5Z1hzMmtRU3ljeits?=
 =?utf-8?B?SjdTZXhzazN3alhkWXVtdzE3SnBEa29NL0hGMjViT0ZlK0VDcUoyY2JiYjV5?=
 =?utf-8?B?cllvbVJlbnk4VXQ0REd4cU5UbzJuQVZiaWMwcVk5cjNWSnZ1eHJ4V2ZrcmhO?=
 =?utf-8?B?Vk1EVmdCbU5nTWJFazZ0UlZZQUpSSDFDTTliQnVqVzNvTTN0eDMwdlBVUVlX?=
 =?utf-8?B?amRnUXc0RHNkeU1tbEgzOCtkZ0NNc25WekVzeTA3RVJzd3dRd2t6RkhrQmpN?=
 =?utf-8?B?YThpRytFb1M2NHlFOC9KaFNpblQwMElacXpLK041SkhpRGVmSkg4QXo2TzBk?=
 =?utf-8?B?N2xrLzFmbHAybUgvWFlidVJEajgxcXpXTjBFeWdwMGVmMEpYaXZRbXNyTGt0?=
 =?utf-8?B?UDNCWHlKdDk0K3UxWUdwYVZEaFduV0JkT2htZzJEL3hKZnFCZUNGdDlUbzFq?=
 =?utf-8?B?MGlxVHFyQ0xLcE1RcW5aU1Y3ZkJzVEdKaDRWaGtMNG00cHFIbzhOaHBBaXI5?=
 =?utf-8?B?b2xqUGpZRTd0NGxCNWxlRVRaWmhqeFRRM3Y5MFJmVlBmMCtRR2ZiaDdDTEs0?=
 =?utf-8?B?RVdMbVpjelBQSUNwUU10OW54M3I3bW0yM2plTTZKSW1rT0FJMVJwRGg0ZmxC?=
 =?utf-8?B?clloUU9oNWZqNFl5empjb1U4ODVhb2R3U2ZaL3VPdlVSMytSZVBlb3dHZG8r?=
 =?utf-8?B?MnE2Yld2cjZ5cWloNnM2ZlRpWHhzRlA3amI5MFhvd1FOQk5vbE9XZVdsYmVa?=
 =?utf-8?B?b0lrWjdac3p0b3ROOHFNNHpjTzhZd1lvUjhhVThZSnkrVHZQQ1FuSEtiWTdH?=
 =?utf-8?B?dEp3b2s4bndFdCttUGU2RzRjSkNPQzBNTW9uMEh6THVDa1BaNDJSdDhKZ3Ro?=
 =?utf-8?B?NStZMG13WHprS001STM3VmxPUUVMOFBwa25OZTF4bWxubHVaUjh5K2FGVjFv?=
 =?utf-8?B?amVsbXYva0xkSjFxZGI5djcxOFJUN0FsMElyLzBsSWJKaHg1TFlBZ25oS2Jt?=
 =?utf-8?B?SVE3SXpCZlpFUFByTDN4ek9wSHZvMXFoZGthaWZuRWRaS1BPemhnOXpOUEpj?=
 =?utf-8?B?c3FxT2lzYTd1OUZWc3U2djhYajNYMWwvWWJkYmY3NWhpY2R5Um5sMzhSbFN5?=
 =?utf-8?B?RDJqL25QT2hmQTRmWkFCSHhWTFVMQURBK3l1QzQ5WXgraWxaNkNOOVhhVy9s?=
 =?utf-8?B?TjAxMFZlMVNNV1pHNFFpYTV1MldzcE4rMElwVXo5Sk5JVURlOG5tMVdXS05s?=
 =?utf-8?B?ekRWRHl6bUZtU0s1WlIzUjFSY1p5RWdDTGd6SU1mNVAxZVN2ZTRyNjQrbkxU?=
 =?utf-8?B?Y1U2bmIxTjY2S2Nob3FidVAxdzlQd1pKZ1gyUXBya2EwOVV0MkY3cUJVelBp?=
 =?utf-8?B?T3VtNzVLdDRJNlUrTG9YUnJpRGxOWGZHdzEyZys4cnB2WU9pcHRVeGIvY2ZK?=
 =?utf-8?B?RjNTT3IvcmRTUzhsdTVkbXRzTnZsNmVkcXdBbmR3L1FKVUhGcXAzQzlEMm85?=
 =?utf-8?B?L0ErbFZDNk13Rk4vNFFncEswN2lFWm5zRkYySnlLWkJyS3A4MUV5MWFDV0d5?=
 =?utf-8?B?OG1TSmt2cVdhbkdZdGpRTkFGTUtKQ2ZXWTVpMGkwU3VzVzI1a1p4MDhPRUdP?=
 =?utf-8?B?Lyt6MXNCSHhzSnRrczdsenh5YUZUUW9kTGYvcjh2VnZZb1N1djI3UXNEaHFr?=
 =?utf-8?B?bTJzQkpnOUkwTE5PemFJKzJpOEtRYmphbWZEYmpHL3RWeC82WlN6WDJsajRD?=
 =?utf-8?B?Q3ZXSSs1azJEZTU2Yk9RSW1FMXdrVDZSUHphNXFyVVkxMGFLMngrTFBrVEUv?=
 =?utf-8?B?eFFJN3M4STFZSFppZDFuMUxDREprNnFYUUZrY3k4WjltQ3RuaWE1ZFdCL1E3?=
 =?utf-8?B?TGtUbjFUczJsYXpiOEY5RmpYNUxTNk9IVTNYdXZ4ek0wdEViSWFMY3BGT2Fo?=
 =?utf-8?Q?6gTS1q1cGDQ4WZDKUtJV+V2Vo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1d8de70-5bae-41ca-83dd-08dc21751364
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 09:23:10.1303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lew8s4g2k8SQ7fhDjlJ/s4RHPZh5tHZf20out2urqsmYQHb4Z6vgil/Ur+hPQWDd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8835
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------5m8sjxDsz0pGlkoY4VWMJ9px
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 30.01.24 um 10:01 schrieb Daniel Vetter:
> On Fri, Jan 26, 2024 at 05:42:50PM +0100, Christian König wrote:
>> [SNIP]
>> Well I think we should have some solution, but I'm not sure if it should be
>> part of DMA-buf.
>>
>> Essentially a DMA-buf exports the buffers as he uses it and the importer (or
>> the DMA-buf subsystem) is then the one who says ok I can use this or I can't
>> use this or I need to call extra functions to use this or whatever.
>>
>> It's not the job of the exporter to provide the coherency for the importer,
>> cause otherwise we would have a lot of code in the exporter which can only
>> be tested when you have the right importer around. And I strongly think that
>> this is a no-go for having a reliable solution.
> The trouble is, that if you have other memory than stuff allocated by the
> dma-api or mapped using the dma-api, then by necessity the exporter has to
> deal with this.

Yes, I was thinking about that as well.

> Which is the exact same reason we also force the exporters to deal with
> the cpu cache flushing - you're argument that it's not great to replicate
> this everywhere holds there equally.

And I'm not really happy with that either.

> The other thing is that right now the exporter is the only one who
> actually knows what kind of dma coherency rules apply for a certain piece
> of memory. E.g. on i915-gem even if it's dma_map_sg mapped the underlying
> i915-gem buffer might be non-coherent, and i915-gem makes it all work by
> doing the appropriate amount of clflush.

Yeah, exactly that's the reason why I think that this stuff doesn't 
belong into exporters/drivers.

Looking at what kind of hacks and workarounds we have in both amdgpu as 
well as i915 it's pretty clear that we need to improve this design somehow.

> Similar funky things happen in other cases.
>
> So unless we add an interface which allows importers to figure out how
> much flushing is needed, currently the exporter is the only one who knows
> (because it can inspect the struct device at dma_buf_attach time).
>
> We could flip this around, but it would be a rather serious depature from
> the dma-buf design approach thus far.

Well clients already give the DMA-direction to exporters when creating 
the mapping and get an appropriate sg_table in return.

All we need to do is getting the information what flushing is needed 
into the object returned here so that the DMA API can work with it.

Christoph Hellwig pretty much nailed it when he said that the problem 
with the sg_table is that it mixes input and output parameters of the 
DMA-API.

I would extend that and say that we need a mapping object the DMA-API 
can work with so that it can know what needs to be done when devices 
request that data is made coherent between them or the CPU.

>> That's why I think the approach of having DMA-buf callbacks is most likely
>> the wrong thing to do.
>>
>> What should happen instead is that the DMA subsystem provides functionality
>> which to devices which don't support coherency through it's connection to
>> say I want to access this data, please make sure to flush the appropriate
>> catches. But that's just a very very rough design idea.
>>
>> This will become more with CXL at the horizon I think.
> Yeah CXL will make this all even more fun, but we are firmly there already
> with devices deciding per-buffer (or sometimes even per-access with
> intel's MOCS stuff) what coherency mode to use for a buffer.
>
> Also arm soc generally have both coherent and non-coherent device
> interconnects, and I think some devices can switch with runtime flags too
> which mode they use for a specific transition.
>
> CXL just extends this to pcie devices.
>
> So the mess is here, how do we deal with it?

I would say we start with the DMA-API by getting away from sg_tables to 
something cleaner and state oriented.

>
> My take is that the opt-in callback addition is far from great, but it's
> in line with how we extended dma-buf the past decade plus too. So unless
> someone's volunteering to pour some serious time into re-engineering this
> all (including testing all the different device/driver<->device/driver
> interactions) I think there's only really one other option: To not support
> these cases at all. And I don't really like that, because it means people
> will hack together something even worse in their drivers.
>
> By adding it to dma-buf it'll stare us in our faces at least :-/

Yeah, it's the way of the least resistance. But with CXL at the horizon 
and more and more drivers using it I think it's predictable that this 
will sooner or later blow up.

Cheers,
Christian.

>
> Cheers, Sima
>
>> Regards,
>> Christian.
>>
>>> Cheers, Sima
>> _______________________________________________
>> Linaro-mm-sig mailing list --linaro-mm-sig@lists.linaro.org
>> To unsubscribe send an email tolinaro-mm-sig-leave@lists.linaro.org

--------------5m8sjxDsz0pGlkoY4VWMJ9px
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 30.01.24 um 10:01 schrieb Daniel Vetter:<br>
    <blockquote type="cite" cite="mid:Zbi6zQYtnfOZu5Wh@phenom.ffwll.local">
      <pre class="moz-quote-pre" wrap="">On Fri, Jan 26, 2024 at 05:42:50PM +0100, Christian König wrote:
</pre>
      <blockquote type="cite">[SNIP]<span style="white-space: pre-wrap">
</span>
        <pre class="moz-quote-pre" wrap="">Well I think we should have some solution, but I'm not sure if it should be
part of DMA-buf.

Essentially a DMA-buf exports the buffers as he uses it and the importer (or
the DMA-buf subsystem) is then the one who says ok I can use this or I can't
use this or I need to call extra functions to use this or whatever.

It's not the job of the exporter to provide the coherency for the importer,
cause otherwise we would have a lot of code in the exporter which can only
be tested when you have the right importer around. And I strongly think that
this is a no-go for having a reliable solution.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
The trouble is, that if you have other memory than stuff allocated by the
dma-api or mapped using the dma-api, then by necessity the exporter has to
deal with this.</pre>
    </blockquote>
    <br>
    Yes, I was thinking about that as well.<br>
    <br>
    <blockquote type="cite" cite="mid:Zbi6zQYtnfOZu5Wh@phenom.ffwll.local">
      <pre class="moz-quote-pre" wrap="">Which is the exact same reason we also force the exporters to deal with
the cpu cache flushing - you're argument that it's not great to replicate
this everywhere holds there equally.</pre>
    </blockquote>
    <br>
    And I'm not really happy with that either.<br>
    <br>
    <blockquote type="cite" cite="mid:Zbi6zQYtnfOZu5Wh@phenom.ffwll.local">
      <pre class="moz-quote-pre" wrap="">The other thing is that right now the exporter is the only one who
actually knows what kind of dma coherency rules apply for a certain piece
of memory. E.g. on i915-gem even if it's dma_map_sg mapped the underlying
i915-gem buffer might be non-coherent, and i915-gem makes it all work by
doing the appropriate amount of clflush.</pre>
    </blockquote>
    <br>
    Yeah, exactly that's the reason why I think that this stuff doesn't
    belong into exporters/drivers.<br>
    <br>
    Looking at what kind of hacks and workarounds we have in both amdgpu
    as well as i915 it's pretty clear that we need to improve this
    design somehow.<br>
    <br>
    <blockquote type="cite" cite="mid:Zbi6zQYtnfOZu5Wh@phenom.ffwll.local">
      <pre class="moz-quote-pre" wrap="">Similar funky things happen in other cases.

So unless we add an interface which allows importers to figure out how
much flushing is needed, currently the exporter is the only one who knows
(because it can inspect the struct device at dma_buf_attach time).

We could flip this around, but it would be a rather serious depature from
the dma-buf design approach thus far.</pre>
    </blockquote>
    <br>
    Well clients already give the DMA-direction to exporters when
    creating the mapping and get an appropriate sg_table in return.<br>
    <br>
    All we need to do is getting the information what flushing is needed
    into the object returned here so that the DMA API can work with it.<br>
    <br>
    Christoph Hellwig pretty much nailed it when he said that the
    problem with the sg_table is that it mixes input and output
    parameters of the DMA-API.<br>
    <br>
    I would extend that and say that we need a mapping object the
    DMA-API can work with so that it can know what needs to be done when
    devices request that data is made coherent between them or the CPU.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:Zbi6zQYtnfOZu5Wh@phenom.ffwll.local">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">That's why I think the approach of having DMA-buf callbacks is most likely
the wrong thing to do.

What should happen instead is that the DMA subsystem provides functionality
which to devices which don't support coherency through it's connection to
say I want to access this data, please make sure to flush the appropriate
catches. But that's just a very very rough design idea.

This will become more with CXL at the horizon I think.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Yeah CXL will make this all even more fun, but we are firmly there already
with devices deciding per-buffer (or sometimes even per-access with
intel's MOCS stuff) what coherency mode to use for a buffer.

Also arm soc generally have both coherent and non-coherent device
interconnects, and I think some devices can switch with runtime flags too
which mode they use for a specific transition.

CXL just extends this to pcie devices.

So the mess is here, how do we deal with it?</pre>
    </blockquote>
    <br>
    I would say we start with the DMA-API by getting away from sg_tables
    to something cleaner and state oriented.<br>
    <br>
    <blockquote type="cite" cite="mid:Zbi6zQYtnfOZu5Wh@phenom.ffwll.local">
      <pre class="moz-quote-pre" wrap="">

My take is that the opt-in callback addition is far from great, but it's
in line with how we extended dma-buf the past decade plus too. So unless
someone's volunteering to pour some serious time into re-engineering this
all (including testing all the different device/driver&lt;-&gt;device/driver
interactions) I think there's only really one other option: To not support
these cases at all. And I don't really like that, because it means people
will hack together something even worse in their drivers.

By adding it to dma-buf it'll stare us in our faces at least :-/</pre>
    </blockquote>
    <br>
    Yeah, it's the way of the least resistance. But with CXL at the
    horizon and more and more drivers using it I think it's predictable
    that this will sooner or later blow up.<br>
    <br>
    Cheers,<br>
    Christian. <br>
    <br>
    <blockquote type="cite" cite="mid:Zbi6zQYtnfOZu5Wh@phenom.ffwll.local">
      <pre class="moz-quote-pre" wrap="">

Cheers, Sima

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Regards,
Christian.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
Cheers, Sima
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
_______________________________________________
Linaro-mm-sig mailing list -- <a class="moz-txt-link-abbreviated" href="mailto:linaro-mm-sig@lists.linaro.org">linaro-mm-sig@lists.linaro.org</a>
To unsubscribe send an email to <a class="moz-txt-link-abbreviated" href="mailto:linaro-mm-sig-leave@lists.linaro.org">linaro-mm-sig-leave@lists.linaro.org</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------5m8sjxDsz0pGlkoY4VWMJ9px--
