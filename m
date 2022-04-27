Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EC451110B
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 08:20:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF3F10E3BA;
	Wed, 27 Apr 2022 06:20:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2063.outbound.protection.outlook.com [40.107.101.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABC2210E05F;
 Wed, 27 Apr 2022 06:20:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O6YsIgcAFfVnsORTmVHSDuZLEb80L2yCpoc6n61vnmBR0YOmVAVBhb/fIwIUg1nbazgVgVExZkFsTiUoeCK8+zCh5q5vH9z4oduKxh/dH8f963Wl+sNUiTfcKi0qbEQjFRLsH9fcbmQRLYhcxG5Qgbyyw4az1iPcu4zK/UwoMFfUe+8C9LVkNAD7Lsr//LKnwUmMoJzCm5M5WPz1AuX+CUCbry3GWdXq8lNSwqrVMhotA99khuBz++H1/1HX/6SrYDIhTdlag82vrlzdAhIeuzSguynMlcgyCZfp35ap6Jv/k4rWMpCB6LhYRBWcu1WTnXaHlFqi5Eh/Hgate/RAAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jCGOh0n5/Pe83hLYx/5J5lnU8o4tLgJa2GP+CMU8ZoQ=;
 b=AVJtzjVD7rIunGZjGOgxoArzAPG70YGzAN9fh5xkyUgjuf9PCULzZdgAe+81bCirOhbaOjS+3HJRSdXF5JlCy5OsAjWJOWHsYqKD8C/wOu44ozzN4Fjwz+LpkQCFkkgNB7WAHIMrgi4lENxADyQD344e0lD1Fj75QZYnQ/AuioU+DL6PHVpZnwOSKAlNPSz60yC6LIXFqtbLyTBbo0FmWuUHccjh2iBS0FodPBPeaLsrnHFvAhuaIVw6wTnkHeZMyRC88pzAZapFqtbtI0RNRyNyQDRodRSiO6GdN0Losgns6njFU/auhy+vCFMLlb8IADR/QBTVmIPxnX15aT8ysw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jCGOh0n5/Pe83hLYx/5J5lnU8o4tLgJa2GP+CMU8ZoQ=;
 b=YztX+eiBA2AVdUzve9P8f2wi7iXIbS9AR2gA0fXOigXbyrWy9VBidh0LScKYIKZb3dWI2BMwddd8x178YAR8rG7rpcUSdPX76EIfwKQ10HeHAvHpIaW+u5MQqQTQZDtEnRs95qjyEb2TMlbIE6kYZUW2/spN20FK+3UnmYd4h0g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4810.namprd12.prod.outlook.com (2603:10b6:5:1f7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Wed, 27 Apr
 2022 06:20:05 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 06:20:05 +0000
Message-ID: <b587ca5f-eb8a-cf0c-5c07-9844c8794463@amd.com>
Date: Wed, 27 Apr 2022 08:19:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] drm/msm: add trace_dma_fence_emit to msm_gpu_submit
Content-Language: en-US
To: Chia-I Wu <olvaffe@gmail.com>
References: <20220412212558.827289-1-olvaffe@gmail.com>
 <CAPaKu7Tv1Mxt7Ao8kH2-MZDBK7EB0D41COJD8Sjze76t_o-qmw@mail.gmail.com>
 <ffe7dbc1-8a19-1e19-402d-27efc8e55b39@amd.com>
 <CAJs_Fx7OQ2OJo3pQ-ETT1827PtfuFsvn984gg8GeDVrqy0Ucug@mail.gmail.com>
 <215f55f6-97b8-5dd3-a2cc-fe42e19a2769@amd.com>
 <CAJs_Fx69yhVQ6t1xdTqEs3kxiz1gZSZ2-qNA=Cq21j_BSaymrQ@mail.gmail.com>
 <17fc1a68-747a-f707-364d-76f12a2b535a@amd.com>
 <CAPaKu7Rny7pxsPA+cnow0d6PAD2YCb+b+j1_Di5gziyOVNLaYQ@mail.gmail.com>
 <c32bf2de-0e48-e3b7-98ae-0bcd46933465@amd.com>
 <CAPaKu7T2hTFnsSSdFvQRuGefhZHVmGO9KXKpO8Y_ZcLbe75rpA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAPaKu7T2hTFnsSSdFvQRuGefhZHVmGO9KXKpO8Y_ZcLbe75rpA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P191CA0074.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8a::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c928d98-3be1-4cbe-5df1-08da2815f7fe
X-MS-TrafficTypeDiagnostic: DM6PR12MB4810:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB481046AB2D0C16DD2A7CFE9083FA9@DM6PR12MB4810.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CtRcP/xTgkcN6peCZSom0ORdSqpf+6yquqvtvj4+iojoIdDpO/WexSobWGF83AhRoNEbN2Phr0L5cERe1beMK+uV4XeMrhPZ4QZVai8mCEvHTYjuOnnHjwAHqGKegqa7S3bWVC8JoirrxXVDCTzzCZuTMH1LQ8iQdKL1fh8xBCLp7OcDhnHFzAROKLfBnOkCx1MBajXbmqJ3bhw9aGXchFrkbl9OFkrq2XRdXW5lLFTfv2sv3G/10HWICj2VrHr3cB3F08cya/ktU7cEYBj+vva+MRBGyZA1CvGoH53ms9JaBDhZg01X7tmHCoJzt5wAfsbx1yHicSqpFLgfFM0hnDWHmtrLcUGUIAyd7mwdM+MFSuK1rGAjvA4vUm5YNyvMyRi064R0fzkPTZiTb/jv0cEEWJKaLOksbNuAeWJm5JHNDbDDQrYok4v9ISAa1cWb4v7hqz0LoUEwcNn7qtp+4BlnqZdiq3vZ+blLuO+NX4SXl/03sb5xbS/CVYkgXhsPm/HV43wFbGFIio3erbeXx85LyrGNfp6wePk++ZTctMkBvQHW52gorlZfP9c/4Rz6IE6JUs47HdjIdI2Ss8r5Q6KR+7g/AAsq+B4NA0LKluO4cJB7ooCN4qjJK4sNO3QKkQGk4yJqg3xuTptvxo4sDlMg7PriX7RfLVc60aCgmjusZnVefqCkQ+LN1wN0KNh6QA+rVl7mBTNel/toEO5kCGuymqcH1qK3k1AvnccSbHc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6916009)(54906003)(6506007)(508600001)(53546011)(6486002)(31696002)(83380400001)(6666004)(2906002)(86362001)(38100700002)(4326008)(8676002)(66476007)(31686004)(316002)(2616005)(186003)(36756003)(66946007)(66556008)(66574015)(7416002)(8936002)(5660300002)(6512007)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1RjQzJWdk5ZOGtLSTlJVUNuYUtvQXlwOTBrdGRzVXZFUU51czFPeW84RHRO?=
 =?utf-8?B?aWFnU2JMU3hHQjJtd0RrV20rZGM5WnYvamR1SStBcW9BbXZJcHFjSDczN3gr?=
 =?utf-8?B?eHNtUzJBNGxOdnRLR2N2b0JIak5hRTJSYllyTXJBaGp2OTBYTnNRSEtYaFRr?=
 =?utf-8?B?bVJBUG92cjB4VU05NzIyQndNbGg4V2h5RjE0SFNYbTJqSEVTL1U3NThrRnRO?=
 =?utf-8?B?dXZ3a25za0tOdUhEVlZ6S0tYaFo2eGZVczZwN2t2WmFZVDRTMnpMeVNDcjJI?=
 =?utf-8?B?WXNnQXg4N1BXd2ZJM0pEWXE4Z0djb2twN3N6RWZnM3V0T3dsY1FLVjl6QWFj?=
 =?utf-8?B?eVM3WjB3citoa0RwTFlLMG9rMkhQbDJ4eGthL05Sd2NrNkQ0U1drOWlHb1Uz?=
 =?utf-8?B?Q05TSXpwdzNPazBQYjA3Y2M2UjNnSHp1c0xDeU1oQy9YUjdlYkh3RmptR3Zz?=
 =?utf-8?B?cU8wcDEzbzg5K05Mc0JaVWZDR2xzMFpadEl3Z0F2Qjl1RHE5TXJ2NFlwdDB4?=
 =?utf-8?B?eDZuVlZoZnM0bnNrZDR0YTFhNTd6aHFsdnVlUExUMEI1UWJmNGttUXRzWlVN?=
 =?utf-8?B?REh0dzZqV0dYMFdSekRySE81NkY0QmRCR0t5SDZablFrazlucERJTmYrcUF0?=
 =?utf-8?B?ODFVSjcwaXR0cyt6TlRPRWNJMEZzRFNzYTR4dWduYzdoa2kvV3NWb2JLV1Rk?=
 =?utf-8?B?R2dQOXVsUTc4ZkVnbGVpRThIeTBqbzl3VFJyZy9nOVhBVGczVmlIQ2pFS2hm?=
 =?utf-8?B?c3BXYnFqbjZDMThVQW9tUkxhV3JueHpxdEE0bTdzV3FRbmFsSmU5ZFhpRTdG?=
 =?utf-8?B?M1o3U0RVQjJnbWtybE1ja0hteFI0Y2Y1enBIMkVDazRFek1EdzFxUzg1bjVJ?=
 =?utf-8?B?SnhiQTl3dkR3YmQ1ZUQrWjllRGlnOVk2ejk5R202b09vQXNBMFNWd0VkWlFJ?=
 =?utf-8?B?OC9Yb1YxYlFMbkNtMGJ4YnVYREZDK3phVysrOHRBaWVmMXNOUU1rMyt0QnZU?=
 =?utf-8?B?WG5KdXN1TUhYZ25wTmlJMjlSd3F0K1JlSklPOWFIMU9EempyOWtCNDg2dCtR?=
 =?utf-8?B?SjlWNjZjUHZXYmE3OXRlcW5CT3Bic3poZU56cERwYjI4R1VTTm5vTFRHSXJE?=
 =?utf-8?B?QWpVdnlBMXk3aWNKSmZlSWZ2RWxDT3Zqenh0MVgxNzNYU2hXNm1TY0dkNVBh?=
 =?utf-8?B?Y2g1eFB0eFlpdlhKRTR3WlV1Ti8vZnlOZ1ViS1hMcmN5RXZBV1lYTVVKRmZX?=
 =?utf-8?B?UHFCeGxWYUtFTHZtNmxHYjJ2Nis3L2VBeXlpSkhLcWJ0OTkzSXpvVE1FMDEr?=
 =?utf-8?B?OFJ2MzJKZHp1UFdYeEI1SXFKNXVKYzUyZ08wVmo2L05vZ3RQSG4xZ2F6TkVt?=
 =?utf-8?B?bzlLc3VDYVF3RmF5K25iWUs5Q2Z2ZXZDOTgyT1hrUXp2Uk4xM0hBSWxrdkxs?=
 =?utf-8?B?cTc2c1l3K2FvNlF5UjJjcHNYaXVkTUlPTThjSzNiZ0F6S0JvU2FiVUNSaTho?=
 =?utf-8?B?NkphVVV4K3BsQ2xNaFF1eUFTcXAxZWc1Y05hRm1vTGxFcTNaNUNwUFpYTFRU?=
 =?utf-8?B?V1NEU3c2Si85YkoxWU9WTDY3N0FGakIwaW1COS9MWnM1OU9rSURhclJVTHhk?=
 =?utf-8?B?RkkxcHFGRS80UmIyV2o0TnFqTll4ejhXUmdCOVhyK2lOS2ZFbDdYNmcyNSto?=
 =?utf-8?B?ekZGUGthUXhoVUExUWIwRGFUNjE4RGg3R2NCbFNjSDA2MVFmNGIrZHhDTTc1?=
 =?utf-8?B?bXA0R2JNUm5MNThzV29qK1ZTRFNsQmZ6enRNRmUyZ0NvQ0gzd29ieTlyOE1D?=
 =?utf-8?B?UnBpSzcyZ2JOVXlxVk9UQUxJR2ZaOWJhcXFwZnc4bDFsOUZHYTY3ZWs0c054?=
 =?utf-8?B?UVFhbmtVaGJUSThhc1NWK29wVWVmWEZTQ25nNTh4ZzJ2NGp5VGVaT0tIVG9L?=
 =?utf-8?B?WnJEKytLa0hFYi8rY2dOdFhUMzJuMDA2a3krRXNqbmRQeitNYS9oRGtlNkoz?=
 =?utf-8?B?c0RNMnd4RW8wWk4vTThVdzZtVnVQWXN4QmlpalUzYXM1c0lQUzRuS25QVkNt?=
 =?utf-8?B?ZzVHSXFPRWhvblNiQjUvMmU4Qjl2elJVeFlWaklseFpod2tQZU9OQnRYL2VV?=
 =?utf-8?B?bmFtTDZyOHRoU2k2RmR0bU9aZmxmeDVLWXVqMURML2p1OCt0QVNsZWFxb3hC?=
 =?utf-8?B?dmpRd1o0cHpmdndmRUVjMmFnSlB0OEFwbWpPZnVzajNodjNVbHJDcEJHYm11?=
 =?utf-8?B?d2RmWDBBTHFhTXZiYm9uQkVacmFtNEVJQ2RZK01RU3ZnVUFySjl5TDdXaU1B?=
 =?utf-8?B?RVpaMkxiQ3hOT3E5L1UvczZaQWUwQ3MzK0RaRlRkK0xtcEIzZ0s4QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c928d98-3be1-4cbe-5df1-08da2815f7fe
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 06:20:04.9538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZXZX9idvIeju+wJVbmCdJkqTv9IoSWN0SI4hCEvLYN/HU9GNrBsWh/zGKUI7u2bu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4810
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 26.04.22 um 20:50 schrieb Chia-I Wu:
> On Tue, Apr 26, 2022 at 11:02 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 26.04.22 um 19:40 schrieb Chia-I Wu:
>>> [SNIP]
>>>>>> Well I just send a patch to completely remove the trace point.
>>>>>>
>>>>>> As I said it absolutely doesn't make sense to use this for
>>>>>> visualization, that's what the trace_dma_fence_init trace point is good for.
>>> I am a bit confused by this.  _emit and _signaled are a great way to
>>> see how many fences are pending from cpu's point of view.  How does
>>> _emit make no sense and _init is good instead?
>> We had exactly that confusion now multiple times and it's one of the
>> main reasons why I want to remove the _emit trace point.
>>
>> See the when you want to know how many fences are pending you need to
>> watch out for init/destroy and *NOT* emit.
>>
>> The reason is that in the special case where emit makes sense (e.g. the
>> GPU scheduler fences) emit comes later than init, but pending on the CPU
>> and taking up resources are all fences and not just the one emitted to
>> the hardware.
> I am more interested in pending on the GPU.
>
>> On the other hand when you want to measure how much time each operation
>> took on the hardware you need to take a look at the differences of the
>> signal events on each timeline.
> _signaled alone is not enough when the GPU is not always busy.  After
> the last pending fence signals but before the following _init/_emit,
> nothing is pending.

Yeah, I'm perfectly aware of that.

> For all drivers except virtio-gpu, _init and "ring head update" always
> happen close enough that I can see why _emit is redundant.  But I like
> having _emit as a generic tracepoint for timelines where _init and
> _emit can be apart, instead of requiring a special case tracepoint for
> each special case timeline.

And I'm certainly not going to add _emit to all drivers just because of 
that. As you said it is a special case for virtio-gpu and the GPU scheduler.

And as I explained before the difference between _init and _emit 
shouldn't matter to your visualization. The background is that as soon 
as an dma_fence is initialized with _init it is "live" regarding the 
dependency and memory management and exactly that's what matters for the 
visualization.

The latency between _init and _emit is just interesting for debugging 
the scheduler and surprisingly virtio-gpu as well, for all other use 
cases it is irrelevant.

Regards,
Christian.

>> So there isn't really any use case for the emit trace point, except when
>> you want to figure out how much latency the scheduler introduce. Then
>> you want to take a look at init and emit, but that isn't really that
>> interesting for performance analyses.
>>
>> Regards,
>> Christian.
>>

