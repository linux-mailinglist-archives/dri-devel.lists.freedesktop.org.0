Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B79D867C23
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 17:34:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0699110E21D;
	Mon, 26 Feb 2024 16:34:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jV6HSpak";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2043.outbound.protection.outlook.com [40.107.93.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 669EE10E1C9;
 Mon, 26 Feb 2024 16:34:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MV7TFewuauzArDi4lepbuxsN3WtJmrRCa/KynIwbbeq4itfeAL55NiZoZs5QoUKgrZti1jGhATUHe6cN4R6wEGkR720gksjvVtg6wcp2zinN4PToQ42Q4EU8/jZnvpuWdtJlojhGIrx0bwkd9gyQR3EU+TLIN/UmZnASbtlca6/IS6Bgu53bs75/TPXM8hW4/xIjcHpCfuar8uppg4xwj6GvRV1WcSRHYF7vuEqjssQ2otqmH0OhvLEvKb0oBF/2+3CiOzMxGu/j5rKkKUoFmxUx6LnNyRDkpPJUYeYIRMeC0Z2Rndl6pu9QHEMS/r8See5j08co0kEyMdFyxc8apw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HpZK4fjkpAKtGSxAZ0MZN9rnfTvq2vMVy+NW3cfW88Q=;
 b=KIc+LOYHhU7Hj9dNIml7yyIY2j4OwxUwZOmMDb379xnysrkpP2CCfYusZfL8lpvIQcSoGxvWPDRkBTzn+o/A8VEX8lHnoSyI8ODXBH3x+0dsVqRLUZ49x8Pv+A2sO0O7P90ACIZKWT9/WtvImAXw8XmqZ52qxU3JwRVD8MV7mTiGhNjW/M+yXHkNF7o9b6duEvSOeskicM2sWLUeKr14457GB2INTyb4mhTn0bTrudOb6fzsKlPGHOR10zC+iANesFGYkX8jGvLD5NRH2GRnE4k1RrhsfxqrVjuoPFnDbeR5lmneDp1pr0OD/jdludQIfmG8c2M8HmxiDMx06w5azA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HpZK4fjkpAKtGSxAZ0MZN9rnfTvq2vMVy+NW3cfW88Q=;
 b=jV6HSpakdd61p8ZC+3a2uJpG8Iq+WIprvmdHMcr1UYnCNO1wxi11gbGj74Hrh1QySKeT+SjBQy66/N1wGwOm63vbmEyvmJtZ7zHFiiWxq1cqGemIn+zdAROAwxghpJpocdV81McqcqAr8GDMJ9vUtfWeF1YZOr8Kd4oBLNWPctc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB5625.namprd12.prod.outlook.com (2603:10b6:303:168::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Mon, 26 Feb
 2024 16:34:46 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7316.031; Mon, 26 Feb 2024
 16:34:45 +0000
Content-Type: multipart/alternative;
 boundary="------------snwJIIzvCdr3uyXN8fXRVOhP"
Message-ID: <4253f207-23af-4510-aa0c-a7509546917a@amd.com>
Date: Mon, 26 Feb 2024 17:34:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/amdgpu: Refuse to create a KMS FB for non-P2P
 exported dma-bufs
Content-Language: en-US
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Alex Deucher <alexander.deucher@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20240222172821.16901-1-michel@daenzer.net>
 <3156ea34-0655-4b0f-9438-9113fb714373@amd.com>
 <2d7632f0-0783-4d82-9d81-dd6bd52d5db6@daenzer.net>
 <84fa5bc1-6b4d-4d82-844a-8070d4bd78eb@amd.com>
 <b08c2c14-5a99-49cf-ba79-b89f86487f15@daenzer.net>
 <7dd49c00-8d5e-4492-801c-f1b6db5e1737@daenzer.net>
 <d1528a0e-6dd3-497a-972c-3b86efd46313@amd.com>
 <298c5ccd-d39c-4036-8ad6-624f635bc08c@daenzer.net>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <298c5ccd-d39c-4036-8ad6-624f635bc08c@daenzer.net>
X-ClientProxiedBy: FR4P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB5625:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d609766-2895-46c3-195e-08dc36e8d78d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rCbYwvQoDAHb2nE2CyU4Oyw6Ye0y5i6gm+476uAWTz4mr7hmSCiVD5eQy1soRKdQA5Xq4UNO87t17xN6hwAJiEH1IdMPaYxtUOEeRq8CEC4gPpqeFqG7Ryuj6b0EObRFz7zLmHUazznBH7K1Fd8jxy0PupBnoiYGhqZ9ri0nDbeaGadSLE9CdWSzyQxUCgUClDeA987bZRPgVNdJVkJB/Wk2sLpNg900Jrficj3mtda2TinTPMA/rkeaXYjl6l2KjwCD7BPzPO5yRlHkuLBCBu2Vz6+EIyUpuEXJQ4zPdbLSOfcIavHeVIcENtYWMNjTa/BLlTKm65TAb3W48iUMvpblLG2rjdzROZdlaXCoU2sE7U+OHKMYZh8Jlu83XTtrFS7PQMvpUC1WR4uLfnBVcpaj9fQuxGoCdp4QRw3D4yYLg41Ebov9fMb0bfYXmA0hN7i3lLop28s4qyMls5VrSS9Ljm4XpAsmoYw2A9URKPsnKFFwHRbeHXINbFtNj9pcNtHIDFwoANhRMOha8OX3qvIbuWjSUUL3YNldKmES0r/jonFI0tsEdG/MQUVLrpSuVh8Bb+Qj3pabZ1wthw039oSjXKPQh5/7V6XMZJZRfblt2l85UMVsOBNXVLK+tIvE3n1RTvpQ/jalEePChgvXDA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWNwTjhvUWNxMDNEQXZkdmJjcHRkOCtUUVMwc05pREFWR3FNajd6Tk9sQVd6?=
 =?utf-8?B?NFd6MVZwdGpPS09DdjhGcXVQMzJQa21PZGF5UU5lSzkzWVhiZW5SYjJuazhx?=
 =?utf-8?B?UXk5ZWV4ZW5SemM4UWZJa3J2enY4dll0YVBQUzVUcHE3dFFCVlozZG5EWS9D?=
 =?utf-8?B?eHM2UFVPUXZXdXk4UFVpai9yUUFHNGFLaGJ1NGZ2UmRxaEMvN24rVWtzbXpP?=
 =?utf-8?B?b015RXBkNEoraVZqaFd2S0lhM3FMYjZSa2dRL1NXQ2QxcEt3bmhWNVBpZWs2?=
 =?utf-8?B?OEJGckhUeDJMcXpyQ28zRmR1TkJoTm53YS9VaTlJbG16dk04aUNabGZYdzhs?=
 =?utf-8?B?a2JYNHgzZnJYQWJQZ0ZhOWcvbUErM3dUM0EzUnVJMDhyM0JpaHRLZlFXazNB?=
 =?utf-8?B?TXErNU5FZkFYTFRLemxEa1pwZzVldnZ0Q2I4aTlacHFjZTFjSU9TMGlKYXBz?=
 =?utf-8?B?ODFCQ0ZyT3o3N24rMC9zSTlDMTM4NjBvUzhXSXB4ZkNSV1o4WVB0TWRpenUv?=
 =?utf-8?B?cHQxcTRFNGFXUHR6RXVjcTZxMHZyY1YzdGVBT1JtY0xSOHV0VmF3S1hxZjBO?=
 =?utf-8?B?eVJkVkFCbm5uNUVwaWl5b05YcWczdmtCb2k3RWpSdWRYVWpzV0Y0L1NIUmw5?=
 =?utf-8?B?V1ZEQnB5UTVwdU1pS0VWbGU2YTFmS09FcG5iOHRFek85YW9ZR3hGcjA5T2RR?=
 =?utf-8?B?K3pVcGFIelF6UUhRWEsyOHNpOHVOK2NBY1dlbEtlMWhvYUZtVmxuS2d5L2tC?=
 =?utf-8?B?R0tIMjAzVDJCMGNQcE9kRzY0Z0N0cUtDZG5CL1ZLZzJKejVQaTA1cmZSTHlN?=
 =?utf-8?B?ZDNRZXpWaXlKcDRUNTdML3h6Z2U4MWJLY01UNDI0NWxRNUhQanRmbnpyUDRN?=
 =?utf-8?B?QU92cE1ZcGIzWVVOc01rSDJ4d25lTjRzeDZQQldvQUZmU0IrRnpNQUYxaW95?=
 =?utf-8?B?UmxZWUxDbVNJS1hFSktKa1RHd0ZydGg5N1JBeVpnOWhmc0VJdStJSnBvV2Jl?=
 =?utf-8?B?bHI1OVlmREZkRFlxamFzV2MxekFZekFFTWxxNlhZR2xGRStIMFVSellWbW1j?=
 =?utf-8?B?S1I4YlZGYjgrUDdUaC9GV2NRNGRMNjd4TGFCMkpvZFhxK0lDbVczSGcvbDJU?=
 =?utf-8?B?cjBSeVlmdWUwNzYxMUc5em1BcGR2THNGWGVJejJTYkk3bEZqcFhLaXBjTGxo?=
 =?utf-8?B?WnhoU2VDY3hnak9EZFJMaDJqMTJvKzBxZGRBNlpOQ1NSN2lHbTVqRjZXVzVV?=
 =?utf-8?B?dTNPZHB5UmN5SWxtTmZtQzhhSjlkdXAwUHdid1U1dFYway9Bb0h2WC9mZ0x4?=
 =?utf-8?B?UWgvUGQ1d2Y3VExOam1qRTczMy85d1dib1JRajduUVJYbkRWT1NTYzZBTUFJ?=
 =?utf-8?B?Z04rV3MxSGljdXNhOXNpbXpzVWRFVnVYajJaQ0xSdkwvTTB4Y09JZ201ZnRM?=
 =?utf-8?B?a1ZXQVB5SFdadk1MWEhVVWNTeVl6Qno2bWFiMEVGaGswdWhCR1llV1k1MFpy?=
 =?utf-8?B?YnZURTFGUDY4SEtnd09hK2tEUXlPWkZHdEJXMWdvUFJsRTVwbTdua015bngr?=
 =?utf-8?B?Z3FFd1JKcW0vU1B3OHpMNVhuZ1MvQlVJem8zMGpoVEE1Mnl3NzlxZWtLazY3?=
 =?utf-8?B?TldPM2QyS3FYRHNXYzM0UUFaSzd6SlYzaWRzdzFaM1FEbzVhT2FsU3FtbWFP?=
 =?utf-8?B?alllR1VtTXhVeXdpSFByTlo5L3Z0YUdpYjlsQUxTU1ZZUjhud2ZXUGZyRWY5?=
 =?utf-8?B?YitZTzFKZSt5Z3E2OU14VmdGd216SS9qMnRJemh0eUc5ek5UajVGTzB0Z2xy?=
 =?utf-8?B?a3draURkZlZqYjVvV1pKc2o0ZUlScEs5dkdGb0FHRzVuaGJKVDhQYjMvQkZ1?=
 =?utf-8?B?b0JabnI2WXB1ejNmcFhzWTlPT1VDc1lCaVNSdktJTE43VmRDdVhLS1JkU2dp?=
 =?utf-8?B?LzgwT0xTZEtsREc1RE1MQUx6WmNnQzZKV3luRVdteERxNm1DVTFTZTZpZXhQ?=
 =?utf-8?B?by9FOEM0cHhhbk0vL0JDdUdPNE90WUVZR2NkZEVjWVM1S2Z6OWlpTVlkc3NH?=
 =?utf-8?B?K3cxWFQ1bGZWKzkvWWRpMEhZTjhiZkllcnMrYzl2MEVaSUZyT3padzlyZWJU?=
 =?utf-8?Q?0bW6lkQ45MzDF9JgA7JNLtCvd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d609766-2895-46c3-195e-08dc36e8d78d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 16:34:45.8847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uzwN/caj/Ynu47FtAga5r4Y84i4Lso3KbMPPVitihLQNr2efY9lcq7DVzucYvrEL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5625
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

--------------snwJIIzvCdr3uyXN8fXRVOhP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 26.02.24 um 17:27 schrieb Michel Dänzer:
> On 2024-02-26 16:58, Christian König wrote:
>> Am 23.02.24 um 17:43 schrieb Michel Dänzer:
>>> On 2024-02-23 11:04, Michel Dänzer wrote:
>>>> On 2024-02-23 10:34, Christian König wrote:
>>>>> Am 23.02.24 um 09:11 schrieb Michel Dänzer:
>>>>>> On 2024-02-23 08:06, Christian König wrote:
>>>>>>> Am 22.02.24 um 18:28 schrieb Michel Dänzer:
>>>>>>>> From: Michel Dänzer<mdaenzer@redhat.com>
>>>>>>>>
>>>>>>>> Pinning the BO storage to VRAM for scanout would make it inaccessible
>>>>>>>> to non-P2P dma-buf importers.
>>>>>>> Thinking more about it I don't think we can do this.
>>>>>>>
>>>>>>> Using the BO in a ping/pong fashion for scanout and DMA-buf is actually valid, you just can't do both at the same time.
>>>>>>>
>>>>>>> And if I'm not completely mistaken we actually have use cases for this at the moment,
>>>>>> Those use cases don't have P2P & CONFIG_DMABUF_MOVE_NOTIFY?
>>>>> Nope, we are basically talking about unit tests and examples for inter device operations.
>>>> Sounds like the "no user-space regressions" rule might not apply then.
>>> To clarify what I mean by that:
>>>
>>> "We can't fix this issue, because it would break some unit tests and examples" is similar to saying "We can't fix this KMS bug, because there are IGT tests expecting the buggy behaviour". In practice, the latter do get fixed, along with the IGT tests.
>> The problem here is that this is not a bug, but intentional behavior. Exporting BOs and using them in scanout in a ping/pong fashion is perfectly valid.
> The problem with the status quo is that it requires amdgpu-specific knowledge and worst-case pessimization in user space.

Yeah, I'm perfectly aware of that. But that approach here really doesn't 
seems to be valid.

>> We have use cases which depend on this behavior and I'm not going to break those to fix your use case.
> It's not "my" use case, it's a Wayland compositor trying to make use of BO sharing and scanout without always pessimizing for the worst case.
>
> That's surely more of a real-world use case than unit tests and examples.

I've looked a bit deeper into this and we have told customers for the 
last ~10 years or so that this is how it is supposed to work and that 
they can use this approach.

So this is much more than unit tests and examples, we are changing 
existing behavior which is clearly not a bug but intentional and have a 
very high chance to break valid use cases.

My question is why has it worked so far? I mean we are not doing this 
since yesterday and the problem only shows up now?

While I see the use case something is still missing in that picture.

Christian.
--------------snwJIIzvCdr3uyXN8fXRVOhP
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 26.02.24 um 17:27 schrieb Michel Dänzer:<br>
    <blockquote type="cite" cite="mid:298c5ccd-d39c-4036-8ad6-624f635bc08c@daenzer.net">
      <pre class="moz-quote-pre" wrap="">On 2024-02-26 16:58, Christian König wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Am 23.02.24 um 17:43 schrieb Michel Dänzer:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On 2024-02-23 11:04, Michel Dänzer wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On 2024-02-23 10:34, Christian König wrote:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Am 23.02.24 um 09:11 schrieb Michel Dänzer:
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">On 2024-02-23 08:06, Christian König wrote:
</pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">Am 22.02.24 um 18:28 schrieb Michel Dänzer:
</pre>
                  <blockquote type="cite">
                    <pre class="moz-quote-pre" wrap="">From: Michel Dänzer <a class="moz-txt-link-rfc2396E" href="mailto:mdaenzer@redhat.com">&lt;mdaenzer@redhat.com&gt;</a>

Pinning the BO storage to VRAM for scanout would make it inaccessible
to non-P2P dma-buf importers.
</pre>
                  </blockquote>
                  <pre class="moz-quote-pre" wrap="">Thinking more about it I don't think we can do this.

Using the BO in a ping/pong fashion for scanout and DMA-buf is actually valid, you just can't do both at the same time.

And if I'm not completely mistaken we actually have use cases for this at the moment,
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">Those use cases don't have P2P &amp; CONFIG_DMABUF_MOVE_NOTIFY?
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">Nope, we are basically talking about unit tests and examples for inter device operations.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Sounds like the &quot;no user-space regressions&quot; rule might not apply then.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">To clarify what I mean by that:

&quot;We can't fix this issue, because it would break some unit tests and examples&quot; is similar to saying &quot;We can't fix this KMS bug, because there are IGT tests expecting the buggy behaviour&quot;. In practice, the latter do get fixed, along with the IGT tests.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
The problem here is that this is not a bug, but intentional behavior. Exporting BOs and using them in scanout in a ping/pong fashion is perfectly valid.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
The problem with the status quo is that it requires amdgpu-specific knowledge and worst-case pessimization in user space.</pre>
    </blockquote>
    <br>
    Yeah, I'm perfectly aware of that. But that approach here really
    doesn't seems to be valid.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:298c5ccd-d39c-4036-8ad6-624f635bc08c@daenzer.net">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">We have use cases which depend on this behavior and I'm not going to break those to fix your use case.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
It's not &quot;my&quot; use case, it's a Wayland compositor trying to make use of BO sharing and scanout without always pessimizing for the worst case.

That's surely more of a real-world use case than unit tests and examples.
</pre>
    </blockquote>
    <br>
    I've looked a bit deeper into this and we have told customers for
    the last ~10 years or so that this is how it is supposed to work and
    that they can use this approach.<br>
    <br>
    So this is much more than unit tests and examples, we are changing
    existing behavior which is clearly not a bug but intentional and
    have a very high chance to break valid use cases.<br>
    <br>
    My question is why has it worked so far? I mean we are not doing
    this since yesterday and the problem only shows up now?<br>
    <br>
    While I see the use case something is still missing in that picture.<br>
    <br>
    Christian.<br>
  </body>
</html>

--------------snwJIIzvCdr3uyXN8fXRVOhP--
