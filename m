Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 393BE7803D9
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 04:36:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B1F110E41B;
	Fri, 18 Aug 2023 02:36:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8188110E41B
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 02:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692326175; x=1723862175;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ynkYF4gNrIeE0+YA+0i29YdInEf3OBpXTsodZe7EOS0=;
 b=X8xerrZD/YGd1DoB5wxq69BjlZ1AmFhrVlqzP8X5SThf8O7+xUj3JTSD
 KZZtQutgZJK3lBoGtIvuezZ072bcoTlcNK0b8tpvl0KMUvy4NGmiZYYOG
 S2A0l08Aq3PNmPBLqOVxId3A8N1+Ub428ijo54ftZcl9k81hE1r+cYc8n
 aQJHPXSHjtPD4GeCGZkkH6wdrHWU3dkyhXuJEjsoxWNQFv/HAiQeQiYqE
 G+ewkZA0um2d67h5Nwcjdj1KLA2YYaFXPgaMZxuiK6Ty+Zi8GpfD2AEFr
 u9s2WhVT5a9t+AoPF7yqYH7QZT5fHa+N8qyQ/XTirWmd1s3UXKAfEV6ln A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="353299566"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="353299566"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 19:36:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="764370243"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="764370243"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 17 Aug 2023 19:36:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 17 Aug 2023 19:36:14 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 17 Aug 2023 19:36:14 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 17 Aug 2023 19:36:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VKYRE6nCuiwVsfQUPuBGUWDPNn4lwQD+hSqAmqAaxZS33JT+gbgxuZbYx0djI7bj3xhUPI3hh5f63G8x9fW60Ek22E4/qE9ef2K1tXLMkmfJRqt6sNiSyOcZwKp1VmbN+naOqWuC5Ct7l5srCbW3hVA/9JYSMwpBX+4jtsSEn5yRyMzKw9PkNzz3SHGd9lU492aooQK4mBn9rycDAOzeuFjDtPHtEWs5RLswQJcpBdIuBlElRzxwmdB8vcsndWvSX5W7vQYgpYUx2LMZwAtDyhIwBVR/By5fIk4kl3wXckXOfjwLebCbiijJj93TwkwA6gIO0hct3PrXVn5zvst0dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mo8V/VSWPFg5jvRL5KXLrRcIJeOwAuilC4eYrT6aKSM=;
 b=AzUhuVD/8GYXMP9ih+DQcY/L75pIrexE+svdmpEmrMRLOuzzTExj78tUXPpXuBG/iFybsOExQ54S6KK8BWwkVf2+QC9R+8pnxftxpfkJ2xjwsdD/F+F2G/fJJzEJfQN21sJ59YzxVoUl+tpyMenQ9hEX35/GJ/Paj8sWqlgrN2bKq/aX0bWn6pFdBqJpNs6M7FPTClCiMb6y9w61LzHEpRhAqeI1zMNA6yjYTXDIwTVkSdTrcLQD7hFd0ryH5z71IQ6pf518lY5AgqztNnxIBix5E2P6kNneicvuYf5cit7E2vAZ8RsV8qhlWsD0q0K25Afp0+ZtyEVzQepO4pAg1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6879.namprd11.prod.outlook.com (2603:10b6:510:229::22)
 by DM4PR11MB5503.namprd11.prod.outlook.com (2603:10b6:5:39f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Fri, 18 Aug
 2023 02:36:07 +0000
Received: from PH8PR11MB6879.namprd11.prod.outlook.com
 ([fe80::e12e:7690:e251:1aa5]) by PH8PR11MB6879.namprd11.prod.outlook.com
 ([fe80::e12e:7690:e251:1aa5%3]) with mapi id 15.20.6631.046; Fri, 18 Aug 2023
 02:36:06 +0000
Message-ID: <5ecc80d3-6633-bcec-1424-b489f653663a@intel.com>
Date: Thu, 17 Aug 2023 19:36:04 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [RFC PATCH 1/3] drm/virtio: .release ops for virtgpu fence release
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 <dri-devel@lists.freedesktop.org>
References: <20230712224424.30158-1-dongwon.kim@intel.com>
 <20230712224424.30158-2-dongwon.kim@intel.com>
 <b82d4b66-d65c-16d6-9fed-5be50977ff86@collabora.com>
 <ff7d16ce-887e-98a9-5bc4-fd3aeef6ea00@intel.com>
 <853f28d6-91e5-1482-d923-5f7fd0e6d018@collabora.com>
Content-Language: en-US
From: "Kim, Dongwon" <dongwon.kim@intel.com>
In-Reply-To: <853f28d6-91e5-1482-d923-5f7fd0e6d018@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0057.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::32) To PH8PR11MB6879.namprd11.prod.outlook.com
 (2603:10b6:510:229::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6879:EE_|DM4PR11MB5503:EE_
X-MS-Office365-Filtering-Correlation-Id: fff2c3c8-8680-4e37-af2a-08db9f93dfb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VqMwg1oNK918TEV15zAQs7reXjz8nX3qhxHTVIdyjNy1MTfPOA+LD9eZ5e44sbVMsgvqeqBCT0FCOmANJ8y/oSKH+9MBNm2zRJlKQUI6fDQHgdA4yjUgNWDoEd/UQl+H2xQSON0FX4QJP/v0B5tgtAjek7GBHTVkEUzVrWtW7bWzC2u1luR4F0gvieFLwf0TaX1Ui4EBtlfX9r3bqZR9isUxFytymjZ/qpo4j2yjGVc4im689KHSBbv9yS5g1wTPBtCGsJpsSbXLNX5ydywFSCOYbMweh71rxfMN/X/KrC8VPr/BoImIoo1oogOFg1ErEEktAyGPuy7aReDpcUoJc/chneFocPcLnBI3ESH9s0V2o+Vh2swf3gWMyndqpgxzXEJeROjzC1BJe4qKLPBGtZmRrXgPNMRE0g0inLEpAzRB1b+kKUogW0IR/T0ehtmgYw7d0VKQ5z70JaSjFu2D3nMMJALflSrGVnP/5n/TVv79hg/wH/FB4nE66NVv+5HA/st/ffCx8qOkiR3BHqinGIOsBUkHWHam+3Chkq4jqg0kR9IN/J61vg/HuW6ajsWokbWzgh+qu1+9rJdjh1Qo3uqCMRizcjENtHdf49QKF49My/etL4uwkQ2ARugRdJ1UmcZYLrR3i47dIyl9GrECEg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6879.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(136003)(366004)(39860400002)(396003)(451199024)(186009)(1800799009)(31686004)(86362001)(31696002)(36756003)(82960400001)(38100700002)(478600001)(5660300002)(2616005)(6486002)(6506007)(66556008)(66476007)(66946007)(26005)(316002)(53546011)(6512007)(4326008)(8676002)(41300700001)(8936002)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWZSNUhxVG9ZaEdGTyt1SjNXK1BzNmVWYnFCVm1XMk9UbkpKQVp2SkRnZVA4?=
 =?utf-8?B?ZXBPR3JtR2JvYVFqcVBTYzZLZTNHTzRKVHBOemU1NVZ3elB4VHl5dDZVandL?=
 =?utf-8?B?ZGYxenpYeDdYTGNQVzFQZ2J3KzFsaVlKNjg2Tll3VlV1SE55QWhkM1dWVjBT?=
 =?utf-8?B?UmdhakNBMVVxQjZ5QzN4RGN3MTdWZGtsMEZhbm1TTGdzanZHWVBjdktoSEI1?=
 =?utf-8?B?V0VUZ2FycHBaeUNucllsRUVucUN5LzVLZjBlUFFMeGZQd3poRlVwMFRrNnM3?=
 =?utf-8?B?UExrQjVqWUZFL1A4a1M3cWhXZkJoak9RaDVPOVhBdk1HNm4vV2NhdFhJWWpn?=
 =?utf-8?B?K3RhdjZTSElXRUNKY2NjUlJjVlh6UTh4QUtubndkUDJYbVM1V2tPMjhocW1M?=
 =?utf-8?B?QW1rQ3YwYTJQU0VMWjU2dDRtTkNLdEc0RUVQUkRsY09FVUpBUlliTS9Zemwy?=
 =?utf-8?B?N0kweWRyMGVHQnRTUmNDb1VtS2NHbDgvZmkzMDBHUUw2d1NUVjl4TzdaaHhO?=
 =?utf-8?B?dC8yS2R0b0JsVUV0M2IwV0ZoNWtpRTFzR3pHQmtjSWNYNjZaNWExMGVYK1hG?=
 =?utf-8?B?SE5uVk45R2hZalNRQUFQWkh6eWd2QzZ5cktpUUYxQ0dwWkRQanVMSHovU1o5?=
 =?utf-8?B?ZCtpbE1YVS9zSUFzRGZ3N3MybWJOeDRwMGgvVmFxNVFpOG9CMmhEaDVHaUpk?=
 =?utf-8?B?UTc1dXJZUnNNQUl6dVlKRkVBOU1YNFpwMkFXR0tING1acGFrMGYzZWlsc0Ju?=
 =?utf-8?B?R1ZNV0JGTkxPMk5sR213em9wVWF0VG5EM0JKVVNBZzB6MU5NeG41VjVvaHBS?=
 =?utf-8?B?bWMxR0FaSHFkNWhsb0RRZFFTSEEvajFWWmJvQlRWSWc0VjJudzZYaW5yY2xn?=
 =?utf-8?B?VWNjVWwwNlZrWDNTMDBpREwwN0kycmUyb3ZSUDJjWHhraUdoOXF3bm1rRFFv?=
 =?utf-8?B?ZEp4bmUydmZOOGdjS1ZWMy9DdFpUaVkzWWV1ZFQwUnYzdG9EVk1nblhLUHA5?=
 =?utf-8?B?ZkJoQzBwZXdwSVduQllrV2pBRlpldFkrUWxLdmZITEI2RG9BSk40OFFGZG9s?=
 =?utf-8?B?U1FvOUF6NmwvNlVneTZLbW05U2lWT0NlMWRkdk93ZW9hbDNCaHF0MFZ2a2JN?=
 =?utf-8?B?UFpWdUJ2VDZLdjd2UGRJeHVzNGhZVzEyTjhwblJJRzJ2V0s3alJCSThTcDJR?=
 =?utf-8?B?Zk9oTUoxQzZjdytYZW1VOEdrbEJvWGFkMERpSUxBK1dlRG1vamFsYkQ2ckxk?=
 =?utf-8?B?ZEpTZXZNa00zeHJGektWWkZVSU4xTGUvSEJLSjFFbFo4OEdlK0RPQjhxZzlD?=
 =?utf-8?B?QnhZRFF1RWFHMUQwVzFSQkp1V2pDbHduSjZXa09TZWVQMzY3T1J6ZVBqd280?=
 =?utf-8?B?aWd6Y0VWa2lycEFKdVg0MDVVQkI5ZDZtRUxWYUhZRmc2eHlqdjYwc1FqSlk3?=
 =?utf-8?B?VjNJUDk2UWdHQlJmY2xJMFBCUGFvNUhIbGZxRUxwTTVGby82S3FQRWhlNktD?=
 =?utf-8?B?UjZ0MGNja3Zma3ZQeWlZYnl5VmRUcHQ1WXJETXBOWUtFQVdwZGswQkpBNllz?=
 =?utf-8?B?Skl4RkFXeEM2dWFLUnVwbFVneG9XT2pEa0JzWTFrM3pkY1cwdnFWcVdBU1Bw?=
 =?utf-8?B?L3NZbTMyL2UwRE51cVBQQU1OTXR4ZmxpNlBDSGtFc3ZmVkdIUU42NWpHcys2?=
 =?utf-8?B?QmRBbi8vbGI0Y1QrRmE2Qllwa29DVk5CMjRZa1hJcGtUeDR6YkdNQmhycXNt?=
 =?utf-8?B?OEtTalVrbHc2UXEzNzJOVUlUWmtLTmlDdjV3OGo1S3VLSnhYWnI0dnN2STNk?=
 =?utf-8?B?TEltY1hFUkJTUUpqMW1VMWo5T1RHWWNZMy8vRml6dURQeGVrYXNPRE43NGc4?=
 =?utf-8?B?aWJGN3N6VWo3QUw4TmZic1pNamYvWGxvM1ZHS3NMYzFVditETkV5cUR0VEt1?=
 =?utf-8?B?OXlvNS9hZnJ0V3B0SHE3MEFIaVNZK3V1Y0tld3FQQVQ4eThod2tnQ3h5WXQr?=
 =?utf-8?B?dEVyTEFoSXBiQnMxLy9oWVRBdGZRa0pnZHVoQkJuTGtwTnJvMkNXUkpVTUhz?=
 =?utf-8?B?VVRxUFRaUVpYYWROd3Q0YWM5ZlJLd2ZQZmhHYy9UakhpNzBjeGFrVmlSazY3?=
 =?utf-8?Q?ZKty2FipUrnqUIOcg3iVnMCdE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fff2c3c8-8680-4e37-af2a-08db9f93dfb9
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6879.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 02:36:06.6749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7FA9oi4xd6P2h2XhMw4uGTd7AW01xJ37FNZ0Oo7M8E9SBBbDoSKvJyWBDRBVDEls7fGciPwMT95fvtRyiODW3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5503
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

I see it now. For some reason, I assumed virtio_gpu_fence holds the 
pointer of dma_fence. This release ops is indeed not needed as you 
mentioned. Thanks

>
