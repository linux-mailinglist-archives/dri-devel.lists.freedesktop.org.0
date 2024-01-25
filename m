Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8F183C5ED
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 16:00:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FFFF10F41E;
	Thu, 25 Jan 2024 15:00:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F2A10F41E
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 15:00:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ci9tS/t1sLLMNvt+T1y9QtIeSCeBKzwygEu4abGvQyNkQpfgUn1BN8KmZHTDdDL84PyMqitFlSpvQdeiBh2mXKEL9IoGPptmnrR8SFhGlVU+EHAyUNxy6gH20gjPlINSfTc0MaJQDxzS7wZj2+lqzZa7WQx9JiUzVZY2QWQYvA9twb6y248opSwml3L6QkAL4zfYYv2K9duCqo5hPVIzyUWAoM3L56G0cOipxvHRNycMXK9ZF+j1uyNXpWilKcWhgeLurWcFVuXhQPC110Q6s3QQ9/VXISQVDMLwHWmSIziYQAlAdhBoTxvf76SP/sHhONkmwTJEMofQda4Hm8LLfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tpy/4vMuXM9y6vOEXSPY7qm1mnaoiTsHs/uZ23ER7lg=;
 b=PEt9q4fMfM1ToyjvWqvWFcUttKmQJLn0DH/XqMy7Gq/1JwsGvsMY3uM3nvmd8sk+gPl1TkyDnYETPBJdDHIyot3hhEnpqIju/oIdPDxhPKaMweEDJbxLMoPbuRigvZkgaw3pw/6mMtpO6Drj4/y6voKkrxHE3WKgKB4AfFYHTPFpBv+54b8RoqqycimTX18MPZJAXFTO6zNI5mljcyGkIH3Z9dOvBp/1Rqj/9toY56U2N72BB85rBJPKXRbir4taF6rCd8UB29rpXOp1SlQai0HSWWwedhcsP4mgdzHErOokG/G+2a2XDdRtonVhiMAGW9akfpjAxUtLunqSk1ZDKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpy/4vMuXM9y6vOEXSPY7qm1mnaoiTsHs/uZ23ER7lg=;
 b=lVL0gHpCADaeV3nXDQfXBQsRVsfxbvQ7atm7KfEAHJBfYVQu7wdCF0UpZNkNog5uuH+fqvYdW5mqyfziV8Xmm/p+4///nLZRiaxjaxRDtCuI0HulUrXEHMGSx1nUUGiWbIlWhU4bYqmgXqgD8WNHDcaryvzYJVqg3Ajtgx9orBY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA3PR12MB9179.namprd12.prod.outlook.com (2603:10b6:806:3a1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Thu, 25 Jan
 2024 15:00:23 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7228.026; Thu, 25 Jan 2024
 15:00:22 +0000
Content-Type: multipart/alternative;
 boundary="------------qYUwP61eyIICIm0RCw6BFLAc"
Message-ID: <2ac7562c-d221-409a-bfee-1b3cfcc0f1c6@amd.com>
Date: Thu, 25 Jan 2024 16:00:16 +0100
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
 <577501f9-9d1c-4f8d-9882-7c71090e5ef3@amd.com>
 <7928c0866ac5b2bfaaa56ad3422bedc9061e0f7b.camel@crapouillou.net>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <7928c0866ac5b2bfaaa56ad3422bedc9061e0f7b.camel@crapouillou.net>
X-ClientProxiedBy: FR3P281CA0205.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA3PR12MB9179:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f2641cb-e43b-4cbc-dbbe-08dc1db65aea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Us0sgN8t90Z8w/5Ptclrxkf77IkKJdsEi+x3b+g/FKlVeUMPhZuxwXVJxEJDaB8Oa7CBHHNAR9ASEyzYbpdS8AhXBGULoHFI2wsFqt/Pb62EXWfIuouiAAspIVPnua8kAUN2zo2yQVXJsMIca2GeSzM0+rLpWobxDWD3BPPeZFl6Ww0eBG/5jxBQbPvm5OoN/QDO8XItmPtMDvlwYRTg/tAOP3yY6EO5OOFKeCnqM+egro8uBC7b30uOcYziIMwaHgccvkNyzp5xC8+sajZlJbv1kKGuRxD9MBh4fa+Yqvp7VUHtgYfwT8FTGEjC9vcgN96SSkueD0rvWPe3ywY0PMlrE3WBjjiOf6N2HGHQ0y8MiYGWzQ1MmNPNhsE9YVTCizJ2bKSMjdAiXms87R3OZ8lNyN2GEk2xHnrwsGmarCAcbYUERplEU+eakw7KFv5MM0rFVMkLrHkc9yTVhUUI9Wj7DFTvUf/mGTaAVfOR+yewd2lZCKiOvO/o6s7ccv90UlMzQ8hQrSzBtD2JNowgLW1Hfk82WPPqixH6u5ctN+lkMdKNoACWhfAM/m6PAk+DwkLEQyVu8SrPaRxWernM4F3uHKY35pHYjfDuIjUMlv+rzejQsilXjgZZV5jB9ldOr7B9Usu901T1m8ldrXstjA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(396003)(136003)(39860400002)(366004)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(41300700001)(26005)(2616005)(31686004)(6486002)(36756003)(478600001)(33964004)(6512007)(6506007)(6666004)(83380400001)(38100700002)(54906003)(5660300002)(31696002)(2906002)(316002)(110136005)(66476007)(66556008)(66946007)(86362001)(8936002)(7416002)(4326008)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkdPSnNJUWhPM2tMKzlIbUJWRENqUUtobWwxTFZqQTBaUXRRMnFIOXk5YUU2?=
 =?utf-8?B?S0Nkblo2eVdqalFlWDc5bFdnNWxsdi9xRjk0Sm5RR2paUVBXUUdGelVJdEtq?=
 =?utf-8?B?NUJGN0UrcThCZ1IxQTBUcEc5R0gzZERtVnZrYnN4a1pnS05rdXVOZ04vSXlN?=
 =?utf-8?B?RmlyN2ladGlBNWZTaURoL0lrS3Z3TlJWUDRpcm5pRjJaNk9oNzJFMmx3Tmky?=
 =?utf-8?B?dXJWY1B4Ym9CL1lrZHg1U0RYRUs5UGNaOG8zSXpwTWlibiswZXYya0paK09o?=
 =?utf-8?B?S1BIMHlBaG5JYUZRait5OFMza0U4b21IUG5GM2VaK0hOUXJQejM1TkZRQldH?=
 =?utf-8?B?Mlc3T2ZVZEo3QU10dHdrWXZ0M3ZMaVNGTThJK0ZLVDM3V2xYMWR2Y0F6d2Fo?=
 =?utf-8?B?RTRhMjZESnlrNzQwb3JiNWN5VWlYWnZ4VVZZWE9zMW9WMU83Rk5RRkZMQ2xy?=
 =?utf-8?B?TkVHWHNqTUJiNXFIY0xraGVhZlVhcU54V1h3K2gwcEtBc0VvcVlGMTQzMG52?=
 =?utf-8?B?dHgvRnRlQ25HMTBjNDRkTmk2UTg5clVxdHZscEh1N0ZmY1pWV3JLa0x2SDdW?=
 =?utf-8?B?V2FTUjFrNlRwOW11Q2M1QmdBaXJBS3p6aHg0YUNqNk53Z3FzQWUzS0ljVE12?=
 =?utf-8?B?VS9pTFQ3SVFIdEpQTVZxMGcwakZPazJONnliRzFUcTloQWxXQW54QlhEaWl1?=
 =?utf-8?B?QnlxVVZ3c1daendTSnVQYXFYeGZWeFpmQktBVXlKd3hGeUxreTFCdFN4WU1o?=
 =?utf-8?B?enNucUMrWnM4dzZUa241bUNMajJDVzdmbEM1Z3ZVTjArbkhpRWRxNzBoK3dO?=
 =?utf-8?B?anZmMG1xWEhXYnk3STJHVHpROWJHU0YrL1JoYmpJTVBWMTNmNmt6OGlCeVhU?=
 =?utf-8?B?bkpWTjZiU09OUHpUSkpOc2kyNmlJVGdCK0VsMk53R1l2MFpGS3VjTzZHR1Fy?=
 =?utf-8?B?UlluSnZpNTc1TzFmNFVOMUQvMjk1N2ROQk9nYWJFdFhsSlRKSkdaZS8xUVJG?=
 =?utf-8?B?Y0tDTnI5UEIwV3U5Y0lJL25SQTFmdFBrVGluMHBjMXVLd3RRUHlBN2JNQjZF?=
 =?utf-8?B?RUY0UjBhNEdHWjNMaG81L05pejhjK3JVN0ZNWWt4dUhOd1V0UlpOZUZvRkhJ?=
 =?utf-8?B?SCtObDEyV1NOZ1NUK1ZJVkh4Q1Y1NXdmUXZ4aWE5UnpRd3VQdUFYaWVpMVFY?=
 =?utf-8?B?dHpXaGxPZzFsVHVCQThPVFh5eDdoZ1JxL1lCaUwzSjdLa1pIZ3N2VnQzWm82?=
 =?utf-8?B?MTlnQTVtOHRJdHF2OGYrWXN2eDI0cm5BTldGYjJHYUUySGZCQzlaNGx6UXdJ?=
 =?utf-8?B?cHdZdjBIUXhkQ29BaVB4S3BQNVJmRVFyTGtwWGhXYnZySzlyVWY2aVh1UWZz?=
 =?utf-8?B?M0VSdGJINlJzTXRwdHk5WDFCRmh4aFBlN3EySmhMeEJhTEVTWEY4bW93UjFM?=
 =?utf-8?B?OVB4ejNDaGZ3OUhnQktXY2VUOEd4cWlTblJXR2RMRXI3STFwcWhVTU80T0JW?=
 =?utf-8?B?bGlGWmpFQVc2Qk5vSWRSK1NYZGgwMERrWXNNemJvQjVCTnlGSG95OEg1TWxu?=
 =?utf-8?B?YTF1cy9oZ1p0V2lJc2picXByN2U5c3dKTU1QVFdIZ2RJZzg0V0JmRkRWZExC?=
 =?utf-8?B?VzFzalkyUDJJSFBpMUhtWGZZSm5PankzaGJ0RkZVbVB6ejVqNlZRVllBWVZu?=
 =?utf-8?B?dFVHS3EzWWdCY1FrNmhTa3BoSDNtRmg0cXJ3ZXhsWE1YVmFYS2J5RGtnTWF6?=
 =?utf-8?B?NlpvSGNzTGRyWHlxREpxSFc1UmxJZW53ZW5qS3E2L2tBeHhhQkpEdk0xR1Nv?=
 =?utf-8?B?N3grMXpPOCs5dHpxSDhqV0VuQ0FWODdwaVJLQjl5T1lzRm4rcGoxNmVWdUJS?=
 =?utf-8?B?QWl6WFBLZno5YUlpbk9EdEVNbldtbmRxL0FNa0x4ZDVEMk9xU0Mvb2xDcnJH?=
 =?utf-8?B?TE43OTlWanMxY3pvOTFKRWtBSXQrd09ldlZBejlqNklTdDQvUFBTcjFzZEtv?=
 =?utf-8?B?WkEwOGdNOGVaS3k1SGxRRW03aVNTVXIyVjFUVWtCT2pkcGNrMkNrYnFIMDY1?=
 =?utf-8?B?SThOYitadkJlcVFpMldjYjQ5UVpoZkZLM0hIV3Y4cGkvZzlqZ1RRUG5WQWJx?=
 =?utf-8?Q?hK1zo2my5YuK9p9Fhe4KZ8ee0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f2641cb-e43b-4cbc-dbbe-08dc1db65aea
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2024 15:00:22.9369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dllCWIzLdtrXTdJET6s9RnDxBRqIpTrZmg7o7FOGjgDMUrKS2EM3ASerm9mL4ziw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9179
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

--------------qYUwP61eyIICIm0RCw6BFLAc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 24.01.24 um 11:58 schrieb Paul Cercueil:
> [SNIP]
>>>   
>>> The problem was then that dma_buf_unmap_attachment cannot be called
>>> before the dma_fence is signaled, and calling it after is already
>>> too
>>> late (because the fence would be signaled before the data is
>>> sync'd).
>>>   
>>   
>>   Well what sync are you talking about? CPU sync? In DMA-buf that is
>> handled differently.
>>   
>>   For importers it's mandatory that they can be coherent with the
>> exporter. That usually means they can snoop the CPU cache if the
>> exporter can snoop the CPU cache.
> I seem to have such a system where one device can snoop the CPU cache
> and the other cannot. Therefore if I want to support it properly, I do
> need cache flush/sync. I don't actually try to access the data using
> the CPU (and when I do, I call the sync start/end ioctls).

Usually that isn't a problem as long as you don't access the data with 
the CPU.

[SNIP]

>>> (and I *think* there is a way to force coherency in the
>>> Ultrascale's
>>> interconnect - we're investigating it)
>>>   
>>   
>>   What you can do is that instead of using udmabuf or dma-heaps is
>> that the device which can't provide coherency act as exporters of the
>> buffers.
>>   
>>   The exporter is allowed to call sync_for_cpu/sync_for_device on it's
>> own buffers and also gets begin/end CPU access notfications. So you
>> can then handle coherency between the exporter and the CPU.
> But again that would only work if the importers would call
> begin_cpu_access() / end_cpu_access(), which they don't, because they
> don't actually access the data using the CPU.

Wow, that is a completely new use case then.

Neither DMA-buf nor the DMA subsystem in Linux actually supports this as 
far as I can see.

> Unless you mean that the exporter can call sync_for_cpu/sync_for_device
> before/after every single DMA transfer so that the data appears
> coherent to the importers, without them having to call
> begin_cpu_access() / end_cpu_access().

Yeah, I mean the importers don't have to call begin_cpu_access() / 
end_cpu_access() if they don't do CPU access :)

What you can still do as exporter is to call sync_for_device() and 
sync_for_cpu() before and after each operation on your non-coherent 
device. Paired with the fence signaling that should still work fine then.

But taking a step back, this use case is not something even the low 
level DMA subsystem supports. That sync_for_cpu() does the right thing 
is coincident and not proper engineering.

What you need is a sync_device_to_device() which does the appropriate 
actions depending on which devices are involved.

> In which case - this would still demultiply the complexity; my USB-
> functionfs interface here (and IIO interface in the separate patchset)
> are not device-specific, so I'd rather keep them importers.
>   
>>   If you really don't have coherency between devices then that would
>> be a really new use case and we would need much more agreement on how
>> to do this.
> [snip]
>
> Agreed. Desiging a good generic solution would be better.
>
> With that said...
>
> Let's keep it out of this USB-functionfs interface for now. The
> interface does work perfectly fine on platforms that don't have
> coherency problems. The coherency issue in itself really is a
> tangential issue.

Yeah, completely agree.

> So I will send a v6 where I don't try to force the cache coherency -
> and instead assume that the attached devices are coherent between
> themselves.
>
> But it would be even better to have a way to detect non-coherency and
> return an error on attach.

Take a look into the DMA subsystem. I'm pretty sure we already have 
something like this in there.

If nothing else helps you could take a look if the coherent memory 
access mask is non zero or something like that.

Regards,
Christian.

>
> Cheers,
> -Paul

--------------qYUwP61eyIICIm0RCw6BFLAc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 24.01.24 um 11:58 schrieb Paul Cercueil:<br>
    <blockquote type="cite" cite="mid:7928c0866ac5b2bfaaa56ad3422bedc9061e0f7b.camel@crapouillou.net">[SNIP]<span style="white-space: pre-wrap">
</span><span style="white-space: pre-wrap">
</span>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">&nbsp;
The problem was then that dma_buf_unmap_attachment cannot be called
before the dma_fence is signaled, and calling it after is already
too
late (because the fence would be signaled before the data is
sync'd).
&nbsp;
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">&nbsp;
&nbsp;Well what sync are you talking about? CPU sync? In DMA-buf that is
handled differently.
&nbsp;
&nbsp;For importers it's mandatory that they can be coherent with the
exporter. That usually means they can snoop the CPU cache if the
exporter can snoop the CPU cache.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I seem to have such a system where one device can snoop the CPU cache
and the other cannot. Therefore if I want to support it properly, I do
need cache flush/sync. I don't actually try to access the data using
the CPU (and when I do, I call the sync start/end ioctls).</pre>
    </blockquote>
    <br>
    Usually that isn't a problem as long as you don't access the data
    with the CPU.<br>
    <br>
    [SNIP]<br>
    <br>
    <span style="white-space: pre-wrap">
</span><span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:7928c0866ac5b2bfaaa56ad3422bedc9061e0f7b.camel@crapouillou.net">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">(and I *think* there is a way to force coherency in the
Ultrascale's
interconnect - we're investigating it)
&nbsp;
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">&nbsp;
&nbsp;What you can do is that instead of using udmabuf or dma-heaps is
that the device which can't provide coherency act as exporters of the
buffers.
&nbsp;
&nbsp;The exporter is allowed to call sync_for_cpu/sync_for_device on it's
own buffers and also gets begin/end CPU access notfications. So you
can then handle coherency between the exporter and the CPU.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
But again that would only work if the importers would call
begin_cpu_access() / end_cpu_access(), which they don't, because they
don't actually access the data using the CPU.</pre>
    </blockquote>
    <br>
    Wow, that is a completely new use case then.<br>
    <br>
    Neither DMA-buf nor the DMA subsystem in Linux actually supports
    this as far as I can see.<br>
    <br>
    <blockquote type="cite" cite="mid:7928c0866ac5b2bfaaa56ad3422bedc9061e0f7b.camel@crapouillou.net">
      <pre class="moz-quote-pre" wrap="">Unless you mean that the exporter can call sync_for_cpu/sync_for_device
before/after every single DMA transfer so that the data appears
coherent to the importers, without them having to call
begin_cpu_access() / end_cpu_access().</pre>
    </blockquote>
    <br>
    Yeah, I mean the importers don't have to call begin_cpu_access() /
    end_cpu_access() if they don't do CPU access :)<br>
    <br>
    What you can still do as exporter is to call sync_for_device() and
    sync_for_cpu() before and after each operation on your non-coherent
    device. Paired with the fence signaling that should still work fine
    then.<br>
    <br>
    But taking a step back, this use case is not something even the low
    level DMA subsystem supports. That sync_for_cpu() does the right
    thing is coincident and not proper engineering.<br>
    <br>
    What you need is a sync_device_to_device() which does the
    appropriate actions depending on which devices are involved.<br>
    <br>
    <blockquote type="cite" cite="mid:7928c0866ac5b2bfaaa56ad3422bedc9061e0f7b.camel@crapouillou.net">
      <pre class="moz-quote-pre" wrap="">In which case - this would still demultiply the complexity; my USB-
functionfs interface here (and IIO interface in the separate patchset)
are not device-specific, so I'd rather keep them importers.
&nbsp;
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">&nbsp;If you really don't have coherency between devices then that would
be a really new use case and we would need much more agreement on how
to do this.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
[snip]

Agreed. Desiging a good generic solution would be better.

With that said...

Let's keep it out of this USB-functionfs interface for now. The
interface does work perfectly fine on platforms that don't have
coherency problems. The coherency issue in itself really is a
tangential issue.</pre>
    </blockquote>
    <br>
    Yeah, completely agree.<br>
    <br>
    <blockquote type="cite" cite="mid:7928c0866ac5b2bfaaa56ad3422bedc9061e0f7b.camel@crapouillou.net">
      <pre class="moz-quote-pre" wrap="">So I will send a v6 where I don't try to force the cache coherency -
and instead assume that the attached devices are coherent between
themselves.

But it would be even better to have a way to detect non-coherency and
return an error on attach.</pre>
    </blockquote>
    <br>
    Take a look into the DMA subsystem. I'm pretty sure we already have
    something like this in there.<br>
    <br>
    If nothing else helps you could take a look if the coherent memory
    access mask is non zero or something like that.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:7928c0866ac5b2bfaaa56ad3422bedc9061e0f7b.camel@crapouillou.net">
      <pre class="moz-quote-pre" wrap="">

Cheers,
-Paul
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------qYUwP61eyIICIm0RCw6BFLAc--
