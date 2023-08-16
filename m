Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF2677E85B
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 20:10:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39BD610E3A3;
	Wed, 16 Aug 2023 18:10:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6476210E3A1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 18:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692209438; x=1723745438;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=H8uTpFlZgoTjCMcke/l0JCFLS4wveCOcG4CZgkpIpPo=;
 b=cZKuU3KR/pnWA2wRr14AliS+xLwX9G5vQfFp6AKyydlzbCwmviadohOW
 TKfzLB1YSg2O/DRW4OiONSmLtVOtWCvuCRgbGcptN96SgV5m3zmU6KIJ6
 UEivJEXo6o78jM0O2qKNlwGjJRTvLQb4O2RmjTf31pisMREtlhTDhHpAP
 +dzPRCqjz4scSQqZQmAmkRDz9NRfHPYBXVzaaQYxIrFOMR6uZEZqCKVwW
 68bo0lByQzyGgzG3hjjCIpNS6fs2F2DNQHtDnXI4wBnB/Ij+iEzKjINAP
 90jGIGBdgr3sO93x6LMwT1dasVinPKvABzYQ+qZF4msuVQtTKEshyj53Z w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="357575533"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; d="scan'208";a="357575533"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 11:10:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="848575590"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; d="scan'208";a="848575590"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 16 Aug 2023 11:10:27 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 11:10:26 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 16 Aug 2023 11:10:26 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 16 Aug 2023 11:10:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C2g4SeOz4TyahC4RsMP5kmM/YNNKBjXwjFGOpmiolfQ+b3tT26ynjB81JJAS8HK/0MuTiIQJ/oROOagrZiIhdIjBFqW0NrodXojODjrOFHcTB92yRlYbfF+qN5xyMuyC/CsOMEqFq4tvc9+/W+iTkBziyh25M5cy0n0ZBB88ST5ZHQ7whPsxM/ZlCsJmwulCo4ToN0+RMw6PTMiuxeYmYoQY2tVmLaQjQ1c+ilm1Nwz3effCAvUaVhzA9tdBGdlKiSQxThRvz8N+52474R2uuAuwuKwlpdea/knuwbet7ldbjnALQ53EkWruXLo0PlOJzzAU8VrUTvmIbOsZKvaBxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iUf/k9TOJow+UD+rLq7yTvUjkwk/whCoY+EiQMZ73AY=;
 b=azAxPlfv2iCEV25+pVy4EfBS6EvD6XG5v0dWV7K7hyUApp2BOJvJiA331btYp85B2LpBbQszh0uJCDqo+3ZQJy7qYD+Gz4788bzp51mzusuH84AamMaS1e2T1eEtHggSpt5dQkxyLoCESywy0u88Yh/X/vfR1uZd1T0Ad3FohyhvOc6/G1xMi91fOsNRQ728lsBwU6sosNTezwhJYa07FJGRaI9+sQ3iBCsHW8QPEtWvUCsn0eNk9oc1VH0A4Q8JB0MH+Kd7XjlpmNZg36aYCD4qp52ERXRplCHBXBxD7xyKTu2voA2P8BhBaXdOirCxuhYmkr5IIDAUEb+wOdOo7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6879.namprd11.prod.outlook.com (2603:10b6:510:229::22)
 by CH3PR11MB8314.namprd11.prod.outlook.com (2603:10b6:610:170::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Wed, 16 Aug
 2023 18:10:24 +0000
Received: from PH8PR11MB6879.namprd11.prod.outlook.com
 ([fe80::e12e:7690:e251:1aa5]) by PH8PR11MB6879.namprd11.prod.outlook.com
 ([fe80::e12e:7690:e251:1aa5%3]) with mapi id 15.20.6631.046; Wed, 16 Aug 2023
 18:10:24 +0000
Message-ID: <ff7d16ce-887e-98a9-5bc4-fd3aeef6ea00@intel.com>
Date: Wed, 16 Aug 2023 11:10:22 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [RFC PATCH 1/3] drm/virtio: .release ops for virtgpu fence release
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 <dri-devel@lists.freedesktop.org>
References: <20230712224424.30158-1-dongwon.kim@intel.com>
 <20230712224424.30158-2-dongwon.kim@intel.com>
 <b82d4b66-d65c-16d6-9fed-5be50977ff86@collabora.com>
From: "Kim, Dongwon" <dongwon.kim@intel.com>
In-Reply-To: <b82d4b66-d65c-16d6-9fed-5be50977ff86@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0092.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::33) To PH8PR11MB6879.namprd11.prod.outlook.com
 (2603:10b6:510:229::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6879:EE_|CH3PR11MB8314:EE_
X-MS-Office365-Filtering-Correlation-Id: 4828131d-2046-4153-bc37-08db9e840ffe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B3uujKGYK2qtAFNCRDRvIW/CdcmFfWyilI870Ov2USygNvC8QVKGE64YOkhKqRebRaJmYw0UoiwGuFCWf4LIc1wOAn5UyyBK2mT5gCzfXL4F2DI0e3ooDNbmvmD3y5GfPnKxLgEOBJDkxWv/sHjf6Fd0EwLvWk7AkO90RXX2exO4kdnKlD4KOu95JXajDiTN06hSz0SoQSnIyyu3d8/OVA5u6ZlZ69UUp++QQPveA5KA8PLbAMJdHwZa8LAvrSdnOAFGmIl3bOtr5MUtozDw2uanZqDgOeVeJSr6ewlqh/kUKQnHolC2Fv4TcGoBVkxVcbJw0ydNaezGLc1AFihyFq58xFyezg7363yr5vDiMAY2oifXNw2f7x+bTNcDTUj66b47p6f6fao+Xw9Oh4PUYBkfUCpa+/IpHQJNCSQKbCStsMNanp3jF2L2r4JIcioJks+IsCjvGKmKuCkuYDEfvGDubxLCSu+nLWjYlzw8P5OdljczOrWbKnybtkeYjpiS4lEk7lnu67iRaZr5z4c1sARCbjVubAqcQYaVntf3bv/FEW15Q1w6boVfpl9roeZtcd6QtUvZR/iJaLji6lHfWHCtM3XJ7NsDIzgCpKg+UDobfNW/Zurxt9sHXP6a02LQKqByzWGiqAz8fZG7iXzhqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6879.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(396003)(376002)(136003)(366004)(451199024)(1800799009)(186009)(316002)(66946007)(66476007)(66556008)(41300700001)(5660300002)(38100700002)(31686004)(8676002)(4326008)(8936002)(82960400001)(2906002)(26005)(478600001)(86362001)(6512007)(53546011)(31696002)(6506007)(36756003)(2616005)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enJZM0dDUGYrc3lwZ3ZKZDNlNGlIK0VTRlBmdmhic0RVQjlkR0pQV3BSRjFi?=
 =?utf-8?B?N1RnMlkwT2NncDR3TC9aMlhwdHF6OTZpTk1Qc3NRRmhSRndTMnRHcjZTcEhR?=
 =?utf-8?B?Ly9YZkZIN3NlaW0renAzODBBUnVTb1FPTmZrVXQ5MXMycU9IWnRGQTVlbng3?=
 =?utf-8?B?MlphbTVSL2xiL1FTNG92Y0xlU3JvbDAvdzdhV1pzOW1KMUdEMlpNQzUwdmMv?=
 =?utf-8?B?RU9lbUJrem5MRXVtZi9RUkluTmNlT1Q2Mk1Db0pSakIzVkNZYmZpc0VsWEV1?=
 =?utf-8?B?SU5KcEZuc3ZRNnVTWDdxdk1icG03OTZlZWRiZW96Yy82M0VzT0NBUEY5ZnJK?=
 =?utf-8?B?SEtWRThrWnJHYnR5TFphL0hPdng2ZGVXZGdWelQxc2xIMHpOeHVtYTI5NjU2?=
 =?utf-8?B?b3VZYWJuZzNJY3NoQ3Z1OHZaWDVMcXRobUVmVEZsZVgxRkRRMUg1RG9acW5C?=
 =?utf-8?B?U244MUxrVnlRMFBLNnhhekVwbXJpcDVzd1NqaVRhcEdXcmpEMUlqOUFVVkZh?=
 =?utf-8?B?VGM0S0pQWnBqUXJSa1V4dEpqdEJXVTdOTjV6TDlKOHJkaERtSk1XZ0VhaTJO?=
 =?utf-8?B?OUQ1MngrbHF4SXNsN0s0bFVScVZSakFSSWZ3eVo2K3BCNTk0bG54cHcvOXR4?=
 =?utf-8?B?WjRWdGJWcDJwMzBRd0F2Sm95aW1lcEkrOEhFNmhLZDJKQnlkQWI0cjFKVmdy?=
 =?utf-8?B?Q1ZsWXJ1cDBMS1UxNkRnRVFBMkNyUnpqRWRoUCtmVE9WTkgzZmd5NWg3a2VN?=
 =?utf-8?B?VWVTajFMczRQTE9ueUxkdC8wYjJpaGt5NmUxUCtSTkZkdzlhMTVZNWJiTkph?=
 =?utf-8?B?TWJYeWZlejhGSmZVK3FtV3dRZ3U4eUpnQllVdG9OMXJiREZKd3BuN1NhRGNE?=
 =?utf-8?B?NE9mVGhoMm1iRzNIZHNVOFo3L0QyRUlDK21ybUpSSVV3K2ZFZHQrNzRkajlX?=
 =?utf-8?B?Wm5QVENVeHBVbWVLZGQ2R0NxOE05TWY1bEt6YWQ0NUo0Vm1xaDgwSmdCTUpM?=
 =?utf-8?B?Y2hUbVJyZUdWODJvZjA2U1B3ZFIxSHpQRWtOVDJOVDZJSjM1TlYyc0kySmJi?=
 =?utf-8?B?cTkwK2k5TVJ5ZUFrOW10SVgzdWgvdHVqVE1ZQnZGNWU5NXFxbVkwbjF1QS9Q?=
 =?utf-8?B?Q2REUkZUYk9NMytmdnJzT1pMRk1EcTExa3B6czRZZGNPaTZQQjRZRnlEckNK?=
 =?utf-8?B?ek53ODdacGMvNXoySjErVm1Yd2NSK2MxUzYxdmkvU2F2STZnZTBYQi9VVHE2?=
 =?utf-8?B?cTNGSzdBNENEUjBGTUpFZEwzb3Y5TEJDUkZFQkFZNTFPWVVEdXdnVmMwVFBO?=
 =?utf-8?B?d1NrZEdqYWY4cVpOaWpkY2RYRms5cGhtZUhja1c0MllobDRjaXUrS3F4Sm1J?=
 =?utf-8?B?dVdxaTY2OTJFZ3Q4L3lXVFFkd28zUkdrZUFodUphc1RGTnFCTDRMYkZTTkJq?=
 =?utf-8?B?L3Q5bml3TmpYaERUNGthVnFidkRCN2o1c1lRMThxdWUzYVNBeCtxTFB5Y2Zs?=
 =?utf-8?B?VTE0Q1BQcEtneU5CYkxwQnRkOFV2ZEMwU2twMjY3aWJaeWhpc2xJRVYvdlll?=
 =?utf-8?B?SFdzY014OXhublhhMlZ1cE1ha1prQVVDYlBjeE9oTDBvSXFoZE1qQWk5UEFs?=
 =?utf-8?B?ai9XU0Z5YTdLcktnY3pEaGJMWW5nejJmUit5N1JaOHQ2NlR6WE9uOVllNnRJ?=
 =?utf-8?B?aTBMK1FHTXl5ZndJdWZjSnZoTC8yZWcyTm85UmkxQ1RuZG5qYkFEME8vdjhF?=
 =?utf-8?B?eWJvVWdXR2lndXhiL0dpcW05T0ZSdUYrMjhud3FtK2MzNUJKdGtxZEROdk9s?=
 =?utf-8?B?cE52Y0F4VHhUVjJtSzlHdVVxZUUwUVExbnA5Q3lLaWRGUWVHbTZ6aU8vRTRB?=
 =?utf-8?B?UlJNVmNXNGx0UEFrdzl5TitFSjJKV284TU91QmRYYXI2NzU1UGZ6aGFncXhS?=
 =?utf-8?B?SWoxSVI0aXlBQzU3emRFWnhqU08vUTRJQm1HUThuSktGdW5QTFNHOXFoSnlv?=
 =?utf-8?B?VjhQaVlWcmNxaDZKaWdoK2JBcjJWUUdFMll2TG5lM1NkQkc2YVp3UXZGOXZE?=
 =?utf-8?B?dkJQRnJmcjRQMFI5MS9IdE5CMXhMejBvdmZzNUY4L2VvNVBicmxhYWZFdWN6?=
 =?utf-8?Q?1iXYwNfF+6dsEf1TX17na7LOh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4828131d-2046-4153-bc37-08db9e840ffe
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6879.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 18:10:24.5835 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gFqD67ss9c8J/IgMjxr+jbtB3DpB3pI1A2ijBilknPGAt3yUZ8mCmTT+55eBXysKJlemeQxz6k+ph0jusHlMKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8314
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

On 8/14/2023 9:18 PM, Dmitry Osipenko wrote:
> On 7/13/23 01:44, Dongwon Kim wrote:
>> virtio_gpu_fence_release is added to free virtio-gpu-fence
>> upon release of dma_fence.
>>
>> Cc: Gerd Hoffmann <kraxel@redhat.com>
>> Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
>> Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
>> ---
>>   drivers/gpu/drm/virtio/virtgpu_fence.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c b/drivers/gpu/drm/virtio/virtgpu_fence.c
>> index f28357dbde35..ba659ac2a51d 100644
>> --- a/drivers/gpu/drm/virtio/virtgpu_fence.c
>> +++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
>> @@ -63,12 +63,20 @@ static void virtio_gpu_timeline_value_str(struct dma_fence *f, char *str,
>>   		 (u64)atomic64_read(&fence->drv->last_fence_id));
>>   }
>>   
>> +static void virtio_gpu_fence_release(struct dma_fence *f)
>> +{
>> +	struct virtio_gpu_fence *fence = to_virtio_gpu_fence(f);
>> +
>> +	kfree(fence);
>> +}
>> +
>>   static const struct dma_fence_ops virtio_gpu_fence_ops = {
>>   	.get_driver_name     = virtio_gpu_get_driver_name,
>>   	.get_timeline_name   = virtio_gpu_get_timeline_name,
>>   	.signaled            = virtio_gpu_fence_signaled,
>>   	.fence_value_str     = virtio_gpu_fence_value_str,
>>   	.timeline_value_str  = virtio_gpu_timeline_value_str,
>> +	.release	     = virtio_gpu_fence_release,
>>   };
>>   
>>   struct virtio_gpu_fence *virtio_gpu_fence_alloc(struct virtio_gpu_device *vgdev,
> This change doesn't do anything practically useful, AFAICT.

The intention of this ".release" is to free virtio_gpu_fence when the 
last dma_fence_put is done for the associated dma fence.

>
