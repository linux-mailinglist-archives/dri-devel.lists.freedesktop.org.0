Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A97D07B15D1
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 10:16:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2289210E5E6;
	Thu, 28 Sep 2023 08:16:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55A4010E5E5;
 Thu, 28 Sep 2023 08:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695888967; x=1727424967;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=x+sqVBtG9Yc5rGFKC9YMxcVa/elSF0HBNeCLiFKa6u0=;
 b=PxYzlYr54jLzPUPsZPiJJwCm3HWDfxIZvxKpHINrllsZ2+htP4wBSFAw
 p9oWwaIAtFMxqgV3cUA0vW05KFuLmAni/GTuJ/vTDdL1YWshKy/P+YNaG
 W08B8rpHT+PeTJJ74Uif9+N0Cfq4chYGS52ZXZ5UeTTzbAwa8MDGu9z9I
 eEiOLbHAuft2nJhDKhzwZvFCaSU4SWi0jXUhcqqU+2FknTlKxVkaJihXQ
 ArOE77LWjl9RIgLjmxNDosqwHykfZGlgAqkLk5W8s/qdXEPdfnfRGiPlH
 3Xr4xo6Vrxw92eAz9tGm5hWgF9hbkITZUcKqrYl2127Bf7bWwUkFvcg/z g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="362251848"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; d="scan'208";a="362251848"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 01:16:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="865174343"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; d="scan'208";a="865174343"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Sep 2023 01:16:06 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 28 Sep 2023 01:16:06 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 28 Sep 2023 01:16:05 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 28 Sep 2023 01:16:05 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 28 Sep 2023 01:16:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mj8G3RC62baLM77huXFQGZYIq9LiOoc/HiD8vk1R4ZtxozqdzZLhZUlq9+hGW+xfQ88ti717MlXkB0lJnTPQ9jxwle8mzNo1oUEiGw1TTUNZTtwf94n1dyCDKId6mCgz83e1cIjb7uyU2lE8GDvkj/i4JBDu11+wHk0IowTRv934OLAZVqiTGqCuzjzRcsQAGtBU/4NFZT0cNvC8ilWdwvc3sXHvw0+ITYNM8j7iO1zettJE/o0hj0TYbbC0A3DQTIFUTF2oUir/u8KRMQoRThsrTFeal/E3pa7eXgXwSX1A0fgnFpC6wFI7VsEGKJqifn8WXqriS99EQRxJu/bYoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4RBkVQfvmz9X4ACYjpWxK0vdCNMRDaAtBKFHZBJEHII=;
 b=Vj3V+KNsi/z4PEMUApoWRKVyDtvD3cj8GjewQPYWRj24PDsCeZVjrZjFnWemTjUyLGrCnAT2T4itf73gbAgDFs2uupayQCqF+WmRcXS6otKSoM1cO6P+tJmEetZEXaETVXXMgMbfAoPyWjG6eGwMXp+qoRnhomlUbQvCUzgIuRA3rEsNJVSymZZC9GUi5XsPApzL0uh3sbqHsqjMg+aqvib/aJzj4lybmm4dD5vRg7zXY5sBBldtRxsgba7nu9Ks0nb/l0MIWpYTXFwtPAeupsEkrsy/8m4kRLUFDPkLjGtAfu5ECpc4bYArJgqolNwBDdOQRX2q5zlnhoRWGhkNsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2961.namprd11.prod.outlook.com (2603:10b6:208:76::23)
 by BL1PR11MB5511.namprd11.prod.outlook.com (2603:10b6:208:317::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Thu, 28 Sep
 2023 08:16:03 +0000
Received: from BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::1d18:2488:73b2:e47d]) by BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::1d18:2488:73b2:e47d%6]) with mapi id 15.20.6813.027; Thu, 28 Sep 2023
 08:16:03 +0000
Message-ID: <c6285d4e-caa1-55f7-45d7-f4bca3e5ed14@intel.com>
Date: Thu, 28 Sep 2023 10:15:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 1/4] drm/i915: Introduce intel_gt_mcr_lock_reset()
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20230927210357.17461-1-nirmoy.das@intel.com>
 <20230927222339.GD2706891@mdroper-desk1.amr.corp.intel.com>
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <20230927222339.GD2706891@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0247.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::16) To BL0PR11MB2961.namprd11.prod.outlook.com
 (2603:10b6:208:76::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2961:EE_|BL1PR11MB5511:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ea5f24e-b382-4d28-d3f5-08dbbffb27e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YI9nQeNlPVOHTSOqXOahzcCPXu4UyBmDAKGygvSwr32RIFuRqWVtVtRZiAXfnRzOMMD69Pg7Xcb28XPnJKELbdZsVllpJC0v2/lL3Waaa/t4ZJJ2/jKB4cRZ9tvw8lJ22a7eN5KHF8MBgeQaeBkKN5ml0u5PM5YN0ek721suICHHA95ihNUrB/zoLEjAV/4CQkfCf2ryphjoVNgNCT5NznWVb2VejuFshkrNYsV62vgYQKeDGHp9kyAvdb5gJcsjum8Cuk9IdZdKJImrPgG6lxaW9+4jY+50Jzi2/PZGMA2Rp0yD18p9qIUhpYJaUdji/LbK0RmNxL9Z6awhbBH8kMy/4JCGVfGaKdJJMuH/LcGpDtwt7YNmlk9EmfiMajB/VTS36U1KDgCwSS+Bi5LJD3OtkHD8klgroBqdl4zrhfaOTX37rwfifYscUB1qx3CuwAdp9VroZwMvepOPfdMFW6glSB52ltClFxhs+1I0WHSxGmyRrUGARaHw3+bMPBal9SGv0wShVjicdTiryrYaeEqKyJXwB+yZ1OBz3oGb/AMRXCFbmPfWqPoiguME88eT5MNF74TnbaMCz/aZyHmJNHXcphs0XpL5g0e830I6Pi0PpvfRwKA6L78qTMLyP92VAmHF3ZRAdq2Ra0KMo2QSMw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB2961.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(39860400002)(376002)(366004)(346002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(31686004)(6862004)(66476007)(44832011)(66556008)(66946007)(5660300002)(2906002)(478600001)(6666004)(6506007)(6486002)(6512007)(86362001)(53546011)(2616005)(41300700001)(26005)(316002)(6636002)(8676002)(4326008)(83380400001)(8936002)(38100700002)(36756003)(82960400001)(37006003)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHNhRnVnQVBtQ1dMNVA1R3J0MDFQR0FhamlTMklvWWlRUDU5OWFDYnFLK2VR?=
 =?utf-8?B?ektoMWhydTZUUUhvS3lUem01Sm1ZZ20ra3VzVHM2VWxCUUl2cG5BNmhNWUsr?=
 =?utf-8?B?c2RMc0c3K0V6aWViZXdWdTA5bDlnQjdiRTdDY1NaMTNSWm1TdXFQa2VqYXp1?=
 =?utf-8?B?VUgvMGt3TWFydTFQU1lMdVJtNHZ3TDhxU2xmY25zZGl5by9KZDhQc1JHQnFo?=
 =?utf-8?B?MXZGNUYwMVpjQ3gvU0RxSlE3bDZzNnREeHZSQzB3a3ozMHdwdW9sM01td1gv?=
 =?utf-8?B?dWlxbW12aWRmM20rcTJ4VmhMZHAveDh0SDN0em1HSHp0Ni9ETFNGZG9zMFAy?=
 =?utf-8?B?cDhJRXFzT0g4aFlnWWlhYnZEbUZKc0pKQW9oVTZxTGdwTUxvLzRzSU5TSGUx?=
 =?utf-8?B?ZEVuczVsUDBnL1dCUzdTLytPUGdjSGJFTVVtUno4WjhtRUt1SUtocGhPczBa?=
 =?utf-8?B?ODAxbU4wOFpJM1c5eGpXSExpQytvWk04MUdxR3F2SWZYRWU1RCtnU0hQQTU3?=
 =?utf-8?B?Ymx2WXZuQ0ExaXJGRVlEcEc1dHlCUytxSDUrMmNYcGtFVkQ4NDF4R1ZKdzVJ?=
 =?utf-8?B?VHhTRm5OYzA0a1QxOUQxRlFrUlBWRzQzUDFtM3NFTHhNRnh5L3AzdTU1Yk1X?=
 =?utf-8?B?VWFWam4ydUlEOVhoT2NQcDhtSGpHMklybU1lNGFJcUdZLzFKUjl0OXd4VURl?=
 =?utf-8?B?K0h5VDFTbGN2RWFzUXR4aGRxUXZuZGNRUGFZaDl5ZTlWd0U2ekg4RjNIWUUx?=
 =?utf-8?B?cXdJSzAwZlkyRUlmZGRuakF2SWRiNi9QR3I1M05wWVlPT2RxWkpYOHF4WUsw?=
 =?utf-8?B?UTlpcEJFWkF2NWZCYVY2NzBIN2JOVVZId1JDZ0FpZlFOVlQ0UHRRcVRUR2VB?=
 =?utf-8?B?UDkzcUtSM1c2cUNxWEpYanYwS05rdU9NN00xN2EzNitXbzd1d2RxVXA2NjZq?=
 =?utf-8?B?ZWV2QnQ1SmowOG1vdUFCQ0ZVcWd4MjNzako2QVR3bnpiRUFnUTVrQzBIcGxY?=
 =?utf-8?B?VmxHTnc1bTBEK1hST3NEVGdWb3ZQdVgwVCtLK2pTQlFBZXpPRHZYVmIrYUNn?=
 =?utf-8?B?RW9mVERBOG9KRmFJMS9ralFEaGxCdkxxVUNSKzFmL1JwS2NRSk5iNUxjK2pv?=
 =?utf-8?B?N0tQUW9nMXRnVEcrMVlSU3JCSytVMzhjVHB2VnBMSnllOWVCQlZmOVVvMkk2?=
 =?utf-8?B?ZFJ1UlE0UmJQRzFMNHYzdWIyQk5KT0pYdVhlN1VpbWhqL2p6VS9QVXAvR25x?=
 =?utf-8?B?QVJmTnBKUDJMaEdPSERBekdTY0V3QzIwenkwVGRCQS94Z3ZMK2VkYVZHb3BD?=
 =?utf-8?B?S1llRXpveHhEdCtVK0kxY3kvdmdwc2VHWlZtWW5SeDlLblhDTzNGQnVxZy9q?=
 =?utf-8?B?ME1ydEU0dm84N255eWxKc0laUWx3U2liYWF2UGY4czNuc0ZSNGJHZzVCeUdC?=
 =?utf-8?B?MlFJYVpDRmRHS09ocmhMaVNNdzBXSTVTMG9iY2FmTkh0OTVaQjVnNVkwMU4v?=
 =?utf-8?B?S1pSSTFEMXRlbXA5K01QK09MaDBwMGVqVnoyT1NxZXJ0MTU3S0cxYUNUZXMv?=
 =?utf-8?B?STJCVUlIQTBncktGR1B1Y1hhU3M2LzhaWmdXZ2xRYmpNNThuak53d3dub2NN?=
 =?utf-8?B?UEdjbG9QWmhJNTJ3Y3NBYjNpK3VrSkxoekdrSkR2NUNXN1VINVpFQTAwSDhw?=
 =?utf-8?B?UGlUK25uVGRQYzBlWmxrdXI4WTZTTXNHR3IvTTEwZ1kyeHgzY3ZRM2d4cHFD?=
 =?utf-8?B?dUlHSDRUbW1rdjNsOUZjV0NLZkNrZDZ6VGF2TVNhU2pPdms4ckd5LzJoUzZz?=
 =?utf-8?B?aWhLb0hYNjVVNWY5bm9qdGJKYndxSyt3cjN5VktFYjlYUFlXeXdwcm1FTTZw?=
 =?utf-8?B?U2twY0cxWi9iNlkxSmxjdzE1RU5LeWxjbU54R1pHWnRaMEl6czZGaGJjdVV6?=
 =?utf-8?B?RU5MVm5CL09LVHphbmFTODJabGx5enMwYVJzVHZ4Q3YrNUx3RUo3RGgwRWtY?=
 =?utf-8?B?UWljYzF5ZnB5cmNXMTYwYlU5UXRyYXNBdC8vTENZVVBUWmFzTlN4c3ZLNlRS?=
 =?utf-8?B?ZVo2MC8xenpPOXYwcDFxTEdIbHpvRXZERGE4Y01odmI3eE54Mkp0cXVkZkFO?=
 =?utf-8?Q?86rNWdTQYbUajPOs09wGNDcCO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ea5f24e-b382-4d28-d3f5-08dbbffb27e0
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2961.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 08:16:03.1511 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kNzjOCpz2VTSaioVUTO+a1G4eenfp+JY27jgKLBPvAIxVuHlkQW4FnJXGyBlQdierSd+w37JY3AQm5S1dfDUQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5511
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
Cc: intel-gfx@lists.freedesktop.org, andi.shyti@linux.intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 9/28/2023 12:23 AM, Matt Roper wrote:
> On Wed, Sep 27, 2023 at 11:03:54PM +0200, Nirmoy Das wrote:
>> Implement intel_gt_mcr_lock_reset() to provide a mechanism
>> for resetting the steer semaphore when absolutely necessary.
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_gt_mcr.c | 29 ++++++++++++++++++++++++++
>>   drivers/gpu/drm/i915/gt/intel_gt_mcr.h |  1 +
>>   2 files changed, 30 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
>> index bf4a933de03a..d98e0d2fc2ee 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
>> @@ -419,6 +419,35 @@ void intel_gt_mcr_unlock(struct intel_gt *gt, unsigned long flags)
>>   		intel_uncore_write_fw(gt->uncore, MTL_STEER_SEMAPHORE, 0x1);
>>   }
>>   
>> +/**
>> + * intel_gt_mcr_lock_reset - Reset MCR steering lock
>> + * @gt: GT structure
>> + *
>> + * Performs a steer semaphore reset operation. On MTL and beyond, a hardware
>> + * lock will also be taken to serialize access not only for the driver,
>> + * but also for external hardware and firmware agents.
> The text here makes it sound like this reset function is going to take
> the lock.  Since we have the same language in the lock() function's
> kerneldoc, I think you can just delete this whole sentence.
>
>> + * However, there may be situations where the driver must reset the semaphore
>> + * but only when it is absolutely certain that no other agent should own the
>> + * lock at that given time.
> This part leads to questions about what such situations would be and how
> we'd know it's safe to use.  Maybe it's best to just say something like
> "This will be used to sanitize the initial status of the hardware lock
> during driver load and resume since there won't be any concurrent access
> from other agents at those times, but it's possible that boot firmware
> may have left the lock in a bad state."
sounds better than mine. I will just keep that as description and remove 
rest.
>
>> + *
>> + * Context: Takes gt->mcr_lock.  uncore->lock should *not* be held when this
>> + *          function is called, although it may be acquired after this
>> + *          function call.
>> + */
>> +void intel_gt_mcr_lock_reset(struct intel_gt *gt)
>> +{
>> +	unsigned long __flags;
>> +
>> +	lockdep_assert_not_held(&gt->uncore->lock);
>> +
>> +	spin_lock_irqsave(&gt->mcr_lock, __flags);
> If we're doing this to sanitize at load/resume, then presumably we
> shouldn't ever be racing with other driver threads either, right?


Driver load and suspend/resume is single threaded afaik but I think I 
just needed double conformation.

Will remove the lock.


Thanks,

Nirmoy

>   If it
> was possible for some other thread to already be grabbing the MCR lock,
> then that would mean it also isn't safe for us to reset it here either.
>
>
> Matt
>
>> +
>> +	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 70))
>> +		intel_uncore_write_fw(gt->uncore, MTL_STEER_SEMAPHORE, 0x1);
>> +
>> +	spin_unlock_irqrestore(&gt->mcr_lock, __flags);
>> +}
>> +
>>   /**
>>    * intel_gt_mcr_read - read a specific instance of an MCR register
>>    * @gt: GT structure
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.h b/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
>> index 41684495b7da..485c7711f2e8 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
>> @@ -11,6 +11,7 @@
>>   void intel_gt_mcr_init(struct intel_gt *gt);
>>   void intel_gt_mcr_lock(struct intel_gt *gt, unsigned long *flags);
>>   void intel_gt_mcr_unlock(struct intel_gt *gt, unsigned long flags);
>> +void intel_gt_mcr_lock_reset(struct intel_gt *gt);
>>   
>>   u32 intel_gt_mcr_read(struct intel_gt *gt,
>>   		      i915_mcr_reg_t reg,
>> -- 
>> 2.41.0
>>
