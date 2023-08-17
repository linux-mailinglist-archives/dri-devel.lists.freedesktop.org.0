Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4002977F02F
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 07:25:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C67BF10E3F4;
	Thu, 17 Aug 2023 05:25:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6811510E3F9
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 05:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692249941; x=1723785941;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=509ECVQ9f7McOt9FPbLD+hSzUUTW7kF03O5R3bmipho=;
 b=DuiJn+aQoT5MhjCoD4foKtUNG5zQM0mD5nyQ4rc62cE8iNse3/BRhbey
 w37MSQ8Gl9y5QTfxBkx0wwluDDmKkzye3gT+zBAvmWkYl/+HVOnUkdfhX
 nwoODVz4QwSoDVJy4kqn/CX7uHTX8oum+/mqkW5JqAwdIcasww8YVM4Mu
 yVmAUFDn8BXeZ+yrZhGg22/y6KdO6vBOgIPNBvY83c/oE4KfIrhG8XMgm
 dKICJfPwDweHc6L7e+112awSrQnJDlnzz7kJZnsE7lGaiVBieX1x9unR/
 VHhQipaaOjTPTnel4enGBobwv4OkxsYEnSw/6zGONrWAl7Dgy9EL5vPiO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="371616262"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="371616262"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 22:25:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="1065111466"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="1065111466"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP; 16 Aug 2023 22:25:40 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 22:25:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 16 Aug 2023 22:25:39 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 16 Aug 2023 22:25:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DkLzrNs1wt89fJKn4jN0vbBO9DJ8T25/amspAFSpZeraVn6vBdVHRaNeT+Sc/P1PdmbZj1T/JycbV/3RHalXXPoyyfGRn4r+5ymsIJFprv1fv+HHruNdjOHAkgqkycn8bEEQn01hAFU65hWwO+4lu8PuKzTuJyQCNmWhexqJRO+m5sb+v0/4RmKRwGZrAunw/STxOK6DSg+3MORsEDXlkK0ybA8mGfKKyph+4rKcqRKVIjxrPIEKx69sb9/1MhpJKWFpT1jsxh+9uRc82tNbkb8HTix2zDlJhWYnDYHgnUBNzSG2+xXrwTYkYVhBpVHIckpZK02DDU3NZXhQ7hff+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZTb9iIh4RI/HDhFWo5Rl25ASU4nTAieaHRVzpbevW2w=;
 b=Kr4nXrhH0lpMaC2mD0RN+k+U6LLQ3UR79CXlbXBBrzhYVNdd3a1q5790VI9037tgzqZoSpMe28UnHSrKfgDoyhy0PG3lgEQze+Hm2poUyKWwsqup7gNZVP+NccyDj8dhJKLtviDEMpGtDpQjtlerzb2Ms9Obgc+F83NJpMBTMyzYNtCCH4LO+clvFwOvIOlOJzyvZXDKn/c0p9lOXeP1NdrHNGOw5VRTWskAK4H0FpZXeX8r4XFKdVObWsio40BlvPlQy2t48tsh+5oizsrgtcpcdiqPkJuLa1Z9EnAtyCqmOnwzpx/KpH0egXHzv7PRrAPxSC6etixAWFqFt6Ocrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6879.namprd11.prod.outlook.com (2603:10b6:510:229::22)
 by PH8PR11MB6780.namprd11.prod.outlook.com (2603:10b6:510:1cb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.30; Thu, 17 Aug
 2023 05:25:32 +0000
Received: from PH8PR11MB6879.namprd11.prod.outlook.com
 ([fe80::e12e:7690:e251:1aa5]) by PH8PR11MB6879.namprd11.prod.outlook.com
 ([fe80::e12e:7690:e251:1aa5%3]) with mapi id 15.20.6631.046; Thu, 17 Aug 2023
 05:25:32 +0000
Message-ID: <dbee5945-f9d6-5de6-0358-23cf7a14534c@intel.com>
Date: Wed, 16 Aug 2023 22:25:29 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [RFC PATCH 1/3] drm/virtio: .release ops for virtgpu fence release
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 <dri-devel@lists.freedesktop.org>
References: <20230712224424.30158-1-dongwon.kim@intel.com>
 <20230712224424.30158-2-dongwon.kim@intel.com>
 <b82d4b66-d65c-16d6-9fed-5be50977ff86@collabora.com>
 <ff7d16ce-887e-98a9-5bc4-fd3aeef6ea00@intel.com>
 <853f28d6-91e5-1482-d923-5f7fd0e6d018@collabora.com>
From: "Kim, Dongwon" <dongwon.kim@intel.com>
In-Reply-To: <853f28d6-91e5-1482-d923-5f7fd0e6d018@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0229.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::24) To PH8PR11MB6879.namprd11.prod.outlook.com
 (2603:10b6:510:229::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6879:EE_|PH8PR11MB6780:EE_
X-MS-Office365-Filtering-Correlation-Id: 2569f734-fdd7-4723-3195-08db9ee260c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mF1JXgqtxbCR9pI7TMsq3Z1+rsh+wFVIeJort8u1CThjFkZX6dzFc0onV98dJ7A+CmvGW2qfIXGyY+rsYpXw+Np38uI1UArxkGmv2jMoJYDA8MRk8W7LpxLLUS4604SpAxZak+OUee5w8amJ1qCw+5YuKwNDNZeFbZN3elGZjgPc+VBjIhFXHNYTX2ASolkDED7FuBrqMeB5c9KZx6xweGg9NKqb3jBdXDAJqEtbuiLSBUHh2QOYY6kZBXGD2g9mH6MVbblC4KXPuLQ2NTlkP3MqPFL6VWeUjiHrpmdThpWipFTcrpGVP0VEDt09nqrN+U0bcPPidKbyuMAIdbJ9yw0MEZK+81WiV/jIYuKipTDipGzbpy4S5pi1AuSFGZEw/lwrb6hOYIbugxFWJzP0jP/0zWnQqawt9K8Y0bJJyLipaS7yMROQEZ67obWk0X+wbfppx7jcwEju/58eU0kv/VLoqCsVIlKmRJP9JL5sfPC6LA898b5ND/D4uciW/Eh5NQg4J4vBNWbEVISxntT/8K+1E+a/pUf1P5j2xN587kMgVLbS/rxwg/eYtbzo/Aib7zz7PpZKQ0EmQEt0G8ZG3WGvL3oGPWH1VCbGuK5QPK+FXhDJwUCJWoLeVvEapQjhZge8dpXBzHfrT41IsIcimA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6879.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(366004)(396003)(346002)(39860400002)(1800799009)(186009)(451199024)(66556008)(66476007)(38100700002)(82960400001)(316002)(478600001)(66946007)(2906002)(41300700001)(4326008)(8676002)(8936002)(5660300002)(6512007)(6486002)(6666004)(6506007)(26005)(53546011)(2616005)(31696002)(86362001)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2VFcVMxM3AxaG0ySGExTDdDbDREdllJQkp0dnVZeEoxcTZBZnhFRWg5VS9m?=
 =?utf-8?B?MHhEMDRZSzVWNU9aazJkMVZJeG1FRnp6R09OOXZzYTIzSUw1dklRRGZYdE52?=
 =?utf-8?B?Y2RXYU1RU0RVc1VpNEhza014bTVvTWpZa0tPYUlSVSs2bjBqQythaGZZb2NX?=
 =?utf-8?B?ang3S0RaS2FoMVpVM00xYWVlcnpCUDVqQkxTamJjMkd0TmxLcERPcURiMUg0?=
 =?utf-8?B?bUdoY25CamZSRXVXWFdLeFpGV3dxa0NCOVBFRnR3VCtVekJQNWlORWZwYkVK?=
 =?utf-8?B?WVR4RTdKaUpWWDJPNzgrcUN0YnRrK0V5SjhPaE5pV1ZjazlPZEozS0xkd0cv?=
 =?utf-8?B?K0lNZDFXRFpiajBJMUFhK3JKRFdSY3ZEcml1ZFhuenZ5RmxodXB4ZFROSE5C?=
 =?utf-8?B?WGFhNFB1R3crTk5CSGUxam94Y2dzaWJqYlJBMjZkVWlzT1NSOUVqWlYva2ll?=
 =?utf-8?B?akIyOFRhRzhjQmlPL0hQTTBiRFdLMmtzN0hYVTZhS2lrVFdKMTQ1QU9uZlgy?=
 =?utf-8?B?WmpPUnBweTNMemNhMkYxS0JNY1J3UXB0L0JabGhtdjhFOXJINkFZVnoydGpR?=
 =?utf-8?B?VVU5ZmFtdWw1ZERtZ0lTVEFoNTdCQmwydHJybER5TFRyamRpWkJKczVBcXRl?=
 =?utf-8?B?dlRQTDIvd1RDOXo0YkRDSjd3MTlVWHBEL3d0TjVkcEM5eHJQczZqeWtXS1Nx?=
 =?utf-8?B?UmIwcDc1aURlY1hGOUVnRE1SYlhxM0JwTGE4eUQ0QktZamVDemNXTHRoVGhK?=
 =?utf-8?B?UnJLM1pSUGZtY05aMVdxU1lDVkxja0ZUd3JSdG9yMmxISGVycjhGbGZHM2tk?=
 =?utf-8?B?NnRIVzZpaUV6Ykt5VDlNVm1mbU9xaHBJNWNnOC9JWFRKUlRTVGtQNUhjY2cx?=
 =?utf-8?B?Y3Yvbm9kcWxxVk9adUs0bU5TU2VEZTFmVk05QkR6aUxFSzROL2xqKysyTDFZ?=
 =?utf-8?B?U1ZkS1cxUGZmYkZ3OEU1bDBFcFl5cnRCNTc4c3BoWmRRVndOQnZhMlR4YXNj?=
 =?utf-8?B?aWpiZG53eWZ5NGZXSy9OTDQ4QmZseGFqWWFsTENwUUpGbXowR05lek42T2h0?=
 =?utf-8?B?N2Jqa2MyOTZVOCt3VEREWlk4QzNQRnAxTkMzU1Z0MDlBWnFMbVVaUzF5NjZw?=
 =?utf-8?B?ZlFOSjUzV0UxaFlaYkYwaGZ6RGpxOXVjNnhYTkM1WVl3dEVzWWM1eDlWcFFO?=
 =?utf-8?B?UXd0WHdWNnRpendvQ3l2bjc0UjMwNnl6WW5iWXBQRXlhMmpOc1ZsQ1lSQW51?=
 =?utf-8?B?cmNPV2xNRVMzNUNRQ1E3NFZOL2p1RUljbUducUxlODlPMXNEZ2RtRDdTYTRw?=
 =?utf-8?B?aWpMRmQ5anV0RWpjSTNyTHN3T2RTSld2N2FKM0RRMHl0c0NHMWNWU0ZhNkhL?=
 =?utf-8?B?QWdCbEE3cnVBMGVhbllIcDV6TXUvQjVCeUJUdTVRMDRiSDFaVklXcGhNZnlZ?=
 =?utf-8?B?NUk5M1MzbEIrTVU5cGtNdzJiaFNTU3JrRTlEdHZJY2ZXK2FGM2tMUWd0Z0FB?=
 =?utf-8?B?QTNkcjBRbkZIZXBDTG9mUWNuaVRxSGY1T08vSnoyVUpnK0FMM0wxdDBDNi9q?=
 =?utf-8?B?c1ViSjJ2a0Y1S1dkM2pGd1lFeSsyM3pROGZ0TENxdVR0L1FQRnN3RGtNNVlr?=
 =?utf-8?B?b3I2VU1JVWErK1dVVUZML2JITXRESCs4M1FWck1EMlVRbjRjbEZwR3NKQTVh?=
 =?utf-8?B?UkxlMDRzTzk0MjZRTEwyNnpHd0tnUk1FcHBXSytOUitlalREdldPNGhocjBh?=
 =?utf-8?B?cy9RMWpOM1JHRDlnZmcvNU0xckR3clYwZFBzNW1halpyR0dNbUZGbm9EalIz?=
 =?utf-8?B?clJaUkdHaGFDZ2pBb2FuVWdLWDNmRjdGanBRaTJOdTV2V0ZKcGwvK1ZBTisx?=
 =?utf-8?B?azhXYThvOEFFU1hJbGxBU0ZJSzNzbTlVV003ZG15NFVqaUNkRVBKYWVrdHJt?=
 =?utf-8?B?UTR3elBqTjJLM2V3UFMrVnFvYWV6YjUwZmZoWVpjbEpZSHZiK3NjWEtPTFY0?=
 =?utf-8?B?RXZzakp4OGpSbFBsbWhxVG1hRDRtQTBKVzNUa3Y2c1VRUjhCNEprS0FVeGFm?=
 =?utf-8?B?cVFzbFFVeHJHS2NwZFE5ZzBWa3JZMmFvQlA2azc1NXpnZm91MTFFU215RWFs?=
 =?utf-8?Q?NATsLcvZW5A+dxM0zRE+FZIN2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2569f734-fdd7-4723-3195-08db9ee260c9
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6879.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 05:25:32.7780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w0LkSUFcmpEUzM48uXFCnFkZvQX1UnZfmF3zUBZ/zzVS2beBjy0YkAoIPRKLNjsaZSl6fPEDl/ev/fnJ9bgN8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6780
X-OriginatorOrg: intel.com
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>, kraxel@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 8/16/2023 10:05 PM, Dmitry Osipenko wrote:
> On 8/16/23 21:10, Kim, Dongwon wrote:
>> Hi,
>>
>> On 8/14/2023 9:18 PM, Dmitry Osipenko wrote:
>>> On 7/13/23 01:44, Dongwon Kim wrote:
>>>> virtio_gpu_fence_release is added to free virtio-gpu-fence
>>>> upon release of dma_fence.
>>>>
>>>> Cc: Gerd Hoffmann <kraxel@redhat.com>
>>>> Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
>>>> Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/virtio/virtgpu_fence.c | 8 ++++++++
>>>>    1 file changed, 8 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c
>>>> b/drivers/gpu/drm/virtio/virtgpu_fence.c
>>>> index f28357dbde35..ba659ac2a51d 100644
>>>> --- a/drivers/gpu/drm/virtio/virtgpu_fence.c
>>>> +++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
>>>> @@ -63,12 +63,20 @@ static void virtio_gpu_timeline_value_str(struct
>>>> dma_fence *f, char *str,
>>>>             (u64)atomic64_read(&fence->drv->last_fence_id));
>>>>    }
>>>>    +static void virtio_gpu_fence_release(struct dma_fence *f)
>>>> +{
>>>> +    struct virtio_gpu_fence *fence = to_virtio_gpu_fence(f);
>>>> +
>>>> +    kfree(fence);
>>>> +}
>>>> +
>>>>    static const struct dma_fence_ops virtio_gpu_fence_ops = {
>>>>        .get_driver_name     = virtio_gpu_get_driver_name,
>>>>        .get_timeline_name   = virtio_gpu_get_timeline_name,
>>>>        .signaled            = virtio_gpu_fence_signaled,
>>>>        .fence_value_str     = virtio_gpu_fence_value_str,
>>>>        .timeline_value_str  = virtio_gpu_timeline_value_str,
>>>> +    .release         = virtio_gpu_fence_release,
>>>>    };
>>>>      struct virtio_gpu_fence *virtio_gpu_fence_alloc(struct
>>>> virtio_gpu_device *vgdev,
>>> This change doesn't do anything practically useful, AFAICT.
>> The intention of this ".release" is to free virtio_gpu_fence when the
>> last dma_fence_put is done for the associated dma fence.
> What makes you think that fence won't be freed otherwise? Sounds like
> haven't tried to check what dma_fence_release() code does, have you?

Yeah, I know it frees 'struct dma_fence *f' but what about 'struct virtio_gpu_fence *fence'? This is a device specific fence that contains struct dma_fence *f. But hold on... so when fence->ops->release is called then dma_fence_free won't be called here:

	if (fence->ops->release)
		fence->ops->release(fence);
	else
		dma_fence_free(fence);

In that case, I think virtio_gpu_fence_release should do "dma_fence_free(f)" before freeing virtio_gpu_fence? Am I right?
Like,

static void virtio_gpu_fence_release(struct dma_fence *f)
{
     struct virtio_gpu_fence *fence = to_virtio_gpu_fence(f);

     dma_fence_free(f);
     kfree(fence);
}

And can you please review the second and third patches in this series as well?
Thanks!

