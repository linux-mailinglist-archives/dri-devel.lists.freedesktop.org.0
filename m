Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9F46D6B07
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 20:00:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 218EF10E18E;
	Tue,  4 Apr 2023 18:00:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACF7410E03C;
 Tue,  4 Apr 2023 18:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680631236; x=1712167236;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DNsqGYKZP148V3VUaw28QaRmPM/PqpDdezjvpJDLCho=;
 b=kMTAiMrbYjwR65MK0LZcg8NBXKNxq7dNFKeg9IXizyIv52RpAUo8yPS2
 Mlfa113WrZAUFpedRricB8phQpjKxFl2bNljwSqmLBUcPdH1IQOoGYxTt
 tYbJQrsWjIU+tnwGay5PxM5zzsiyaS7vEcwNWZMK5GIA9mjuQcy0Sovcc
 USVqSRp+x5ACTPsiuV7ZWBbgEZGoqc8kLeVKzlr1ydAyQv8gpEJo8R8t6
 NZHeRfUk2yF+hXDk1JpyZVBzVIWgug6H8e+ahVuKVjSt/MmCwhPrppXCv
 Lzl42ghoZCUsguiUnxv0fx4incgzTCMBxzl4K3vZ/nU9JA3IiejAJeH1q Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="370081156"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="370081156"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 11:00:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="932532909"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="932532909"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 04 Apr 2023 11:00:31 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 4 Apr 2023 11:00:31 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 4 Apr 2023 11:00:30 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 4 Apr 2023 11:00:30 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 4 Apr 2023 10:59:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XLSw6ZXKRqt1sGCgQEzEabIO1pB5IDWZUFHXc1kbrhCPyGIqNYbPQflg7YyNzLNG3xtHkiVIGggZkHU9NhcrZhskxoGHdj4e9SQHc3chm4uCm15tTiYvwqYl46P9Qqg6ZIBUxWD0DgUIo/BLFZBh+xI5m1gwgLKL9YXHJ9lKvy5oJBTV/PhbZXnTZ4qO1POjQsdhCJmwKgmtr7CbiDcwZ0OWzBEXHu6bcIcwIGYDjk9/NLksSyxWzRaiB2PDP4bzCPBEIfRKiws4FRZlz4AsPqLhRkaltwGBKsHJAs85XGgPGz+6fkb8Km+tTSKxuHMq1nHIk+rZ0sF6oNWA1MQ0rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M24S1X8S9GGYfHKfE+txnPjBHGRVZd7XixywQJxs10I=;
 b=hCFN4K/B3v/H1Yb13Do2R5pXJ3JoWOSZ4pK4xzMSxP0P+3cNt6SEkzBBrbw/ik/vjxKyzXOaBZTWZn6sWRaPwifCudHyX2ay8j+mkn3bJWfrd5Xi4UuI53dzLI66GGmwjnRkm5+IM53QPClkYyopdiMZIXV72Z+Pq4lHJ0mV2M7j8gAf3s59j2EocOAz7axuYngKL/mbQd0Xa+6e2uC0RFHHFwy+BVvqTxgj3HxoYL2hdsrFS6Aq3E16QCpQAlVvGnEXS39t6I9gDy6cV/MuRTfAHARNS6lljYzf566bUFHq3szYSlsNcnVh6UH0uHPUbmqnfh8qqCfOrKL8tsoYCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2961.namprd11.prod.outlook.com (2603:10b6:208:76::23)
 by MW3PR11MB4586.namprd11.prod.outlook.com (2603:10b6:303:5e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 17:59:37 +0000
Received: from BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::6c34:bbe1:bd34:aa2d]) by BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::6c34:bbe1:bd34:aa2d%5]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 17:59:37 +0000
Message-ID: <f3ca9bb1-46e3-cf47-09f1-62ecfface664@intel.com>
Date: Tue, 4 Apr 2023 19:59:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 3/5] drm/i915: Add a function to mmap framebuffer obj
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20230404143100.10452-1-nirmoy.das@intel.com>
 <20230404143100.10452-3-nirmoy.das@intel.com>
 <ZCxW3WZCKFRchRAE@ashyti-mobl2.lan>
From: "Das, Nirmoy" <nirmoy.das@intel.com>
In-Reply-To: <ZCxW3WZCKFRchRAE@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::16) To BL0PR11MB2961.namprd11.prod.outlook.com
 (2603:10b6:208:76::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2961:EE_|MW3PR11MB4586:EE_
X-MS-Office365-Filtering-Correlation-Id: 02493d8f-1d45-4d01-9c75-08db35365a90
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PwaGAJtDFOePf/p/BCAF7pOrxd3dQLsu5NyJ9PTiIMgi+RUqCNEd8Bgk7wibT1XMtMci6qaMpmKmZjJeZ/Wf3y8yHOkPU2jkflklEKdPDGj/huge5W/Af1uEo3mjPsry0qETjcPXwpEWTUFTJFq1NA28LdY8kZdFKX6uXivJj1HBfbDoUv3WPTf+Dv4vT9kPe1YgUuC9XLLdvgubxmIyanST5eLSKMb3yBMdcMzQooA0YGnLLWHIVmxehVhtN1HtvGvNpdgJ4cxP3Dl8C5EZ/RbcJz8FJGVzvqdHsfJlw/JdhMBGgwG1qQ+jHF6aH0zs3+baYYYFjXHB2XawhtSuDUERu2SqlEnunn4A8u/tQneWm32F0kRnbrGJCm6SMeZjD2QUctRGFkscSkll4AZc54n8Sb84SQzDQt34Rogty8qd0E2MmtL8aWKHUrkNbEpTOo6mqW69dN7Jc3jMSVai1GmeR4F7v5c3XZJQfYH9qQNEWp7U/vYOP11QCoN7f8IdCYEHuSqvMk8jJwPIQ5GQg7Y3ufVSO6EI7aP/mfZ4Zp/pxVBpS9EqGjswdaK3rg1wDMZrx9zi/709uNTz+H4CTeD2ZUhwiUstTzdP5hweZInnXPbRqo1EKe33OqqTSzsOz4HxZ0wzyNizt0WnnusHEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB2961.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(376002)(136003)(39860400002)(366004)(451199021)(41300700001)(66556008)(66476007)(66946007)(6916009)(4326008)(2906002)(36756003)(38100700002)(86362001)(31696002)(82960400001)(2616005)(83380400001)(5660300002)(6486002)(8676002)(8936002)(6666004)(54906003)(26005)(6512007)(6506007)(478600001)(53546011)(31686004)(186003)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0NYRnU3Y0wwRGJSWVhwMkFlTFZzcU5ObUJzVjdIRFJpbEdod24va3Bhd2Fa?=
 =?utf-8?B?Y2NHOTVwSlZwM0tpdDBBWlZRalhzblpJQkFTMFYxL2VZaUs4RTYwZDN4NEpn?=
 =?utf-8?B?WFZjcVZoQ2d2a2lMNnM1YjFPeTV6Y2JjTUwrRmRNUDVpd291bmV4SUlnNGFH?=
 =?utf-8?B?MHhzUW9NUDBDbmdlbno3dWZOOVFwV1JzdFhiM2o4aVZOT3NIMTVNbTVKQ09P?=
 =?utf-8?B?N2dYdHI1aHg2SW9TT3JCZGs2RURXd0xicTZLMEVxS1QyMVQ5WGF6MzQzYUpF?=
 =?utf-8?B?cFBiNHBqUVk3eHhZY0JjSi9EMG8zZjd3MXh0MXM3aElacjhxQzhCa3cvVWM4?=
 =?utf-8?B?R3V2ejBRa2V3T0pvN0ZaeFVHSU02RzJHWklrSmVjay9GczE3MVY3ZVlzdjNF?=
 =?utf-8?B?RVhGbG1rTEE5Q3VxSkMzcnNja2VnbmVDViswNU9yM0ZhbStMYnlSNmh0aWR2?=
 =?utf-8?B?NmJPdkxyNFhNc1N5Wm4wK0haWFdUVnJwMTNyU2xKV0trMDI5d0h0VllVV1dW?=
 =?utf-8?B?cUozS2RHTHJ6YkFvYXArRHpHdGFObkt5TlNzZTFlV3AwaTlwOHJkOTFtV2pU?=
 =?utf-8?B?UFNsZXlhY3pxamF4SStyS2ZDajB2RXBHbVpndWNxQXRqemJxb3N3bHVTdERX?=
 =?utf-8?B?R0VNQURPbTF0WGUybHdIQ0YvOHBWSGtWUWdZSDdjRHFPbFI1TXlvNFJyRCt3?=
 =?utf-8?B?bURpNlNqRVJacnZiZFBpK2FONU9tVnMwY1ltajBtT2J1ZlQ2TVhlemJ4YVYv?=
 =?utf-8?B?V0ZGbi9QdEV1ZHY4ZldBQ1ZrdlV5ZTFacEZnY0xISXBkU2dyL0xCK2tCQ0Zn?=
 =?utf-8?B?K3h3RnVtTE84RHF6SGtIZTgxV2xsN0RZVTJnYnl0eXZISVV4NjlYS05zRnJL?=
 =?utf-8?B?blV0bVBNbm1KWVFwUkRYa2FzOUNWdWJibUwyZVZhOHhvNjZGQ2k1aFZaUzhj?=
 =?utf-8?B?WXNnZGV5cjRvZU1nTG1zcDJJQk40V2NXcUJ1NXRTWWZIQzhYMGEyb0t3MHVu?=
 =?utf-8?B?TWFJVjNrYldOOUZJWUQ3TU5kVEVkRWxjK1FQN2ZpdnRlazZJSkhFMlVoRW41?=
 =?utf-8?B?SnA4ckRwNEdVTVFnYXhybnBGa0t1VnBlQS9PUFpJdTBTWkMrN1RZUTBEdGVr?=
 =?utf-8?B?TDRCY3BIZGs0R3Qra2lRTjhHbTE5Z29EZkVIbCtWc052cUVqdGdtL1IycTRQ?=
 =?utf-8?B?MUluakNFampBMVZjcEh6YWZHUUhhYytwMld4YTQvRzJaMzFBRE40VmVmcDh6?=
 =?utf-8?B?eFkyWC9QVlc3eTRITWJJYVRIcHIyK01QWHZTWTk5VytmdUV1MzRvb0NWZE5L?=
 =?utf-8?B?ODhBRS9xZGxuUSt3RG90REpxOURjNmVTN3AwRGM2Yis0NzN1Y1hWcFpvOXEz?=
 =?utf-8?B?V3VzUVBPS2sxQ2lqbEpyVTVBRW4vWkd6RXJ5S2NGbXM5cEUrNTJmU3dFN1J4?=
 =?utf-8?B?cmQ2b3k2MWNyTGxJZmc3Z1UvL1p2Rm9KOWtKcm5LTU92dXBSK1hEOGJJUWhW?=
 =?utf-8?B?bkV0WUIvRkhyVWIrZ1pWRlROOWw4TTc4K0hXQjdJUXREeC9CUmdSdTVBdmlN?=
 =?utf-8?B?ODVKb1dBRUMzblVFdnlqaVJMQmRLdlpyWm02MDhqMzhJSFZFMkdWb1FUeXpl?=
 =?utf-8?B?S2w4WHRFdm5KajAxSVl0UGUzTEwzd2NWbHF3SkhsSDhsUEU2Q3ZMUkY4Nnhl?=
 =?utf-8?B?aitPSWl5a0ZZaTE4bDRSQytYT3JUVkI0S0E2MkR6WVl2L01YQkRQVnlyNHpT?=
 =?utf-8?B?cWZEWUwvMFpSYzV0WVlmSFRXdWtYaHJ2bVgwSWtDYWFVeXRqRkRDRDdDK1E0?=
 =?utf-8?B?MXN5SDd2RytxU2NhMkFRbkpvMlZQK25ERDdQbUpvOXF6WGx1aHZNbDNheUty?=
 =?utf-8?B?U0RxaWpZbno4cDhRMVJHekVTNi9hT3E0d1pGZjA2M1ROZ0NXYUZlWGpzSlAy?=
 =?utf-8?B?Y1ZRSWRhZkM2VEVBcnBMSmxPZGgzbUZaSGRHcUxrSzJlamlYaVRlN0tBNkJm?=
 =?utf-8?B?THA4dGVRTmtkNDVROWluSVVxQXBtV0RRR2RVRElmcHErTTczak5IbENOb3pk?=
 =?utf-8?B?WDFIQVd4QWpDY0NJdSt5bXdKK01BaGFoRC9MdGRjN0FuWXRjcU4vM2cxYXlW?=
 =?utf-8?Q?pBYO1eLPG8lWo7MZwKW5uiGV2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02493d8f-1d45-4d01-9c75-08db35365a90
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2961.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 17:59:36.9893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vZZHyOrtJ3znSashcGZYdCdfsKIaT+O5G3eOdoF5oXG9jmAO1VN5M/NhcK2GdH8m5zFVztWlNbPWiPlpeOTLSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4586
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andi,

On 4/4/2023 6:57 PM, Andi Shyti wrote:
> Hi Nirmoy,
>
> [...]
>
>> +int i915_gem_fb_mmap(struct drm_i915_gem_object *obj, struct vm_area_struct *vma)
>> +{
>> +	struct drm_i915_private *i915 = to_i915(obj->base.dev);
>> +	struct drm_device *dev = &i915->drm;
>> +	struct i915_mmap_offset *mmo = NULL;
>> +	enum i915_mmap_type mmap_type;
>> +	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
>> +
>> +	if (drm_dev_is_unplugged(dev))
>> +		return -ENODEV;
>> +
>> +	/* handle ttm object */
>> +	if (obj->ops->mmap_ops) {
>> +		/*
>> +		 * ttm fault handler, ttm_bo_vm_fault_reserved() uses fake offset
>> +		 * to calculate page offset so set that up.
>> +		 */
>> +		vma->vm_pgoff += drm_vma_node_start(&obj->base.vma_node);
> you could have kept my r-b.


I wasn't sure, so I removed it :)


>   Good work here!
>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>


Thanks,

Nirmoy

>
> Thanks,
> Andi
>
>> +	} else {
>> +		/* handle stolen and smem objects */
>> +		mmap_type = i915_ggtt_has_aperture(ggtt) ? I915_MMAP_TYPE_GTT : I915_MMAP_TYPE_WC;
>> +		mmo = mmap_offset_attach(obj, mmap_type, NULL);
>> +		if (!mmo)
>> +			return -ENODEV;
>> +	}
>> +
>> +	/*
>> +	 * When we install vm_ops for mmap we are too late for
>> +	 * the vm_ops->open() which increases the ref_count of
>> +	 * this obj and then it gets decreased by the vm_ops->close().
>> +	 * To balance this increase the obj ref_count here.
>> +	 */
>> +	obj = i915_gem_object_get(obj);
>> +	return i915_gem_object_mmap(obj, mmo, vma);
>> +}
