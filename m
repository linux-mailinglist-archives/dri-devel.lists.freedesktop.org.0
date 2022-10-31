Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 519A161396E
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 15:54:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 944C510E279;
	Mon, 31 Oct 2022 14:54:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 528F810E1E2;
 Mon, 31 Oct 2022 14:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667228073; x=1698764073;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fsdfTd7Ih1dW5yZ8H7Dt+05lYC1aT55/6nADIQIMhd0=;
 b=GZHyOUGgl0UBcf4/XtlkgA1c2u7M1cVCewsr8IHrc7612gfvuYr7ogWd
 i+OvbCSNYVg1exIT/kc0IfI8Xm7ZZuf6k5VIviay0LzMDKCoBzoCT1Uds
 3c0q70dTtkMTSaKinrkkANpGO26hQqJ/AUAm/oetBMoPJWyIrC+1wKi/x
 Bd/piFElpC3nmtx1fsig5EkojVLCspV2GETxzUcJXeIhv3YuPrwPZowyO
 glw1Vv7PaCUZjTWt/yYoy2K0jr0VsK4A70UvK56SViTi4izgcTHG3EQL3
 SVDeEb1YfSeCTj6GmgWhqrC4m/QmRK1aIvVW5sxvK5ThNM1oHgBt57iZ3 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="335575839"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; d="scan'208";a="335575839"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 07:54:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="962802680"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; d="scan'208";a="962802680"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 31 Oct 2022 07:54:32 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 31 Oct 2022 07:54:32 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 31 Oct 2022 07:54:32 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 31 Oct 2022 07:54:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ig626XiSl0wFzIVoQkHskpagS8za2ARCe60qlSBNphkXC4bzzQw/G+HCAmXO2Pci2373vG2NPgfwKFkhl04SYXe0KdsztFRLLl4BpmZKe538VSEKmIq1ySWk/SA80AYUDecvq29rxMYh72lHlJrbX1podgd7A+3EPGBtFZaMNdO5P8FNQEnpwxd0DdVzbLdU/ojYSHrUjJ9ZURwM+pBetX7CK/r1mFkwwcetj3Yw+ST1T1N5dxO8lZ4Pk4nlWNAYARuLiKl3HRZ8IFcpYKiA+Hl+tJBE1M6erYiX94MxlbzZGtdpd7IPH5lO/8jPO2/GmRNCmWGpfA96YoRThvrN0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gBcoDg354Ujb87u+Qo6ZeVvJ7kf7NZJsF3wehVOFv8I=;
 b=cLA2/5ZO+KPiqjVab9Ye3EJelY4zPnWIHggVB0Nv3MMc4OyCQ7IkS3S1qsiE70/LmuN8lwZLdlNhZUWoInQPVZkYYILhKIhPW89lMrpDkedru1eQHgNxVlvTQfCz72mjaBAvuIzJQ5We4JJNkJAjIZ4xen81+2nSH7B6k7bBhBIImXTwRlzhFcvXxF5lWyF/sfLyzTgIN1bLXcXZ+cEQfV8ocNppcwD5EHTYXtuCYND+9Uz4IOlmo7VJA48AzWB9JnXqEsNSMMATqFCk+00m3mnF4cfo/jdu0QDBU4cxECJXzqo15ixgEbv6KhBmXE265+k8RRdj5J9/oP8QFVdE9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DS0PR11MB6472.namprd11.prod.outlook.com (2603:10b6:8:c0::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.15; Mon, 31 Oct 2022 14:54:30 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::bff2:8e4f:a657:6095]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::bff2:8e4f:a657:6095%5]) with mapi id 15.20.5769.019; Mon, 31 Oct 2022
 14:54:30 +0000
Message-ID: <09f76f5e-ce38-5451-3d79-ceb11c90c10b@intel.com>
Date: Mon, 31 Oct 2022 07:54:27 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [Intel-gfx] [PATCH 3/5] drm/i915/mtl: add GSC CS interrupt support
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20221027221554.2638087-1-daniele.ceraolospurio@intel.com>
 <20221027221554.2638087-4-daniele.ceraolospurio@intel.com>
 <2125e5fd-e8d1-f4c1-7af1-58fb61f38049@linux.intel.com>
 <4bffd427-be49-0e67-b7e1-a5dd565786c6@intel.com>
 <d7eca606-9067-08d2-560f-fc3edf6e8ceb@linux.intel.com>
Content-Language: en-US
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <d7eca606-9067-08d2-560f-fc3edf6e8ceb@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::38) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|DS0PR11MB6472:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c8e0bb2-6dc6-4f90-8e5f-08dabb4fd098
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uH5UROdKC+YEb1Wvyzrf91IrWTk+8rxg70J7gVHJGXLbMMYDyIfE3RI2x08GAxdXBVaLdiQQTNU9l9+jGMZBkP7op8Y86fwOgiCvSG6K872U8mUUrJQF8scWaQziJQw6HllCxtjxfMJK4Gb+ISBe1p4bbEHFA30ed015qAqUKkZR5wdnr8f8Huk710hJ/is8dFfQ5Z8/rPRbdUPOxQloobcGkTifYapSGUpUW9eRw6TlPZSAxjdRBcM57BG5juz3QyK7yfY9X3d+WYb6VWUOj2s5148hl9isqcnk7uRQoW9hHpbxFoxa/JTXDFxlWbv9F5sx9jniGtyGFVUD7KkdH1SJJ6nIhJK1hI5/RlCIICS0CjltoE5Qx8PsfRKjrxHKfvslYEasQFdVSAtSAlErgZ0VEYL9VBbgPJz+TFTE7zG5G4QtayKdveAQojFNAPThyHsg8bBK+fxs+WcAx8s3dAS12WZ6STHzBYeL9XhaxRgnQVO/V5ACk9QboT+6UsaTWxiWX4LfZowo6yaDZ+flowy2bwlO4Qbq3C73jQS5fy6oHN6ls95xG3aZ/ccfby2MryGo/EXxjdHsZ0ig7yI0lrqbgRLMTXN7W6mwWvG4S7p05cWE/P1msm0/B2/TWjupoVE7JR661mI9s+oiYu7keEB7pO0DG6j2kbF9Q+YRw7cW+fHz5dIf5wwTKC2OAS3I9XXcudN1F/GL4hRRJDg6APNU0EmNhlRvMTZXwfnrrK2n38xiJWUsktwRgilGkCv0vdZ0DUhvlOPbF9e04Xwe1O7jGhgh+bgaSUYiN7JDyxU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(39860400002)(396003)(366004)(346002)(376002)(451199015)(6666004)(82960400001)(86362001)(31696002)(38100700002)(2906002)(5660300002)(66476007)(8676002)(6512007)(4326008)(41300700001)(2616005)(66556008)(6506007)(6486002)(53546011)(186003)(478600001)(8936002)(316002)(66946007)(26005)(31686004)(83380400001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGVDeGxTK25Ca1hiTG1ENXBYMVJhRUNsQ25OcG5PaFpYdGtoZGNhRzhOeGlY?=
 =?utf-8?B?UWFNODNWaytGdVE1Zk5RendMZmg0NHdWd2F6UmQ4WVUxOU50ZDZTSzFTR3or?=
 =?utf-8?B?eFZUSmdMbDdHMGh5K3hiVTRndlhLLzJoSDhsYkdLMzJ0dlFJWGhnaDNsV3cw?=
 =?utf-8?B?TkNTekVpS2JEZ2N2WFJQYjV2d3VJdWNIRk5naENDOE9EQng1NTFBS292dExM?=
 =?utf-8?B?Y0FLNDdmYTc0Qnd1NnQvd1JPblZydWVwTWZ3U0UrOEF5ZjkxMDQ3OEg4UGZZ?=
 =?utf-8?B?aElaSndtVkQ4eWFhYlV2ZjlNbUpzWnhPdlhFanVud28zM2RJTW9TUEx2R00w?=
 =?utf-8?B?SWpYNDlIdFMzcWJ4UTlEYUdhbWdqNFl0eFFlaUticTE2eHAvcVhVRDVOcEZw?=
 =?utf-8?B?d2JjMjdnd3BXYTUyWVhhVkNjY1Q4UnZ1cWpoTGUxem45MisyOFMzcVlJZGxV?=
 =?utf-8?B?MkQ1dzF5TzFsd0NPaEVJS3EzSnpSZmx6RUVzZWUvYXVOQ3RVNFgwdWRoZnkx?=
 =?utf-8?B?eXh6Ti9QWGh0WFJ0UG5KZ1psckRZWjFCV283YW43aEl6N0JyUW9udjVWL2Mr?=
 =?utf-8?B?WE1UTmxUMWk4NnQrKzdKS3NqSTR1YTAwTEJJbTV1dUpvMDF3WnViSlBOY0tH?=
 =?utf-8?B?QUlhMExSNUp3ODM5T0xWYldIKytwc3BUNGdSejhXVXFHSlhobHMyaGJrVUFr?=
 =?utf-8?B?ZTAwYThsQmZud3ZLR0pYckR5bjR2QjQyQURib2hmY1pHbUVLU1d5TG90ZTRm?=
 =?utf-8?B?YVdBY1pIUHlSWGxQajl5OHRsN3E1eHJJN1Fub2lWRVhZcnl4eUVWRDNaNmRZ?=
 =?utf-8?B?cFNTT0JCUmg1THduSXBjYnN3bWt2QWZUYjNyc1ozVmNqTzBmMzBkVzh0VHdl?=
 =?utf-8?B?MVFodCs2c0FDYmlReUV6YjQ4WGZFYmlrRFJ0NFlsbnBaS0pMNHJ2aHVBWkZQ?=
 =?utf-8?B?TVpjNFZnOXhybVhldTBYUytSZU8rTnRybmpvYytZYXNDRTNmYjhycjE3ZENa?=
 =?utf-8?B?U2hydW56Q1hsYVNnL3FkUWZ2MjE4MDU1UmxUMXl4MmZVb1Y2akprR3A2dXBB?=
 =?utf-8?B?NXJXcHorZnkxSkZHK3p2SnFId3FiMkd0NjFsYWR6SkpSdDB5VmdlZ25ySisy?=
 =?utf-8?B?aVArUXVKb21aSzVsUGhhbmp5SG1HMGsrN3RwRWVXS3hmbW1jbVNpZkhxMDEx?=
 =?utf-8?B?cGpsN0kwaG5kdHNGTGtOdlYxRE9ndVppSUlZVnBJVmd1TWNFMmhybmg2b2dp?=
 =?utf-8?B?MDNNd2p5dVVBWk5yU090ZVVTMjc1VmJHZk9DMzNwdjhpTDIvU2NIUEZuZjFF?=
 =?utf-8?B?WkFlNmlSK1FlTkJ1R3NPSVhYNHoxQXlOQTRXNVoxNitSNUFnMzJqVG12TkFt?=
 =?utf-8?B?T3l0dVpMVWxoOHFRbmp4Q2NTaEVES29ReWJhdjVCOEYwTFFsKzZsVjdQd2do?=
 =?utf-8?B?RFZFVEYxSUdYVDV4RG1aeW5yZHhsNC9UN0t5OS9wVEF5OTc1U1lYUlUvSzRz?=
 =?utf-8?B?cURtMlp5LzJLZWdhbEZYTjdVeGgwRERIM3VIZWkwckdib2NYWEFsSkZabjh1?=
 =?utf-8?B?TXhTa2xaaDhhdndBdjB2K05IckRTYmM5ZSs4SWFWV0lKQWN4ZTdaZUxZNVZr?=
 =?utf-8?B?Z2VMN01UUENEbktjc3lFN25CNjgrNmJLVFNhYldGQzU0eDI0aXRXRnpvdWw1?=
 =?utf-8?B?R0VVYWFOSERMSGVNSERYbkJvZmVNMDczSENPN0dYSjJOWFhQL1Z5WG5EcEU5?=
 =?utf-8?B?SXUvUTRrajl3WHVBQ0FKVytuWTdodFlWQ1BXbS9zSW1TUW9hSTh2ZWlUZ3RS?=
 =?utf-8?B?ejJFcUFvQ1djSUhlQURneEx1VWNaeXlRZXRiMmVvY0diS043Q2RMMHpxL2lr?=
 =?utf-8?B?NnUyd2ptL0J5WVdmbGNIRmg3dmU2Nit6ZTI5a240eWhzRnhsT0VDNk5obVdX?=
 =?utf-8?B?bE1tMGVHZmhCQlBMYklndTFqRUFsaGlkRFVuckI2NWp1REc0a2lZRlRPZURQ?=
 =?utf-8?B?T0hrYXo4aDlUZWRKeUtkSTZLRGFyVFdGc2pqVCtadzhOZUt4ZkNISTNXVERo?=
 =?utf-8?B?SUF5WnN1VCtRWkh4eThwZHRLSHhKOHdNY2tGWmFhUms3b1RCcHdyR3NIV2Fz?=
 =?utf-8?B?UmM2Z2Z4cnc4c0lKeXg4Sk9vMXd2V2hIQzFsRCtmSTFFQ0lVYXEycVZ1UjZm?=
 =?utf-8?B?Q3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c8e0bb2-6dc6-4f90-8e5f-08dabb4fd098
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 14:54:30.5159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t2Y8xFWe06ax8vpxUeulIPR230fnzYdPZ/B9AvjnsnEpzEGrXLwUb+RO4IWsHzOzOdhczCtmrWy75qAaofvz7hiT8tCiHikFyzID9WyQsCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6472
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/31/2022 5:55 AM, Tvrtko Ursulin wrote:
>
> On 28/10/2022 18:00, Ceraolo Spurio, Daniele wrote:
>> On 10/28/2022 1:38 AM, Tvrtko Ursulin wrote:
>>>
>>> On 27/10/2022 23:15, Daniele Ceraolo Spurio wrote:
>>>> The GSC CS re-uses the same interrupt bits that the GSC used in older
>>>> platforms. This means that we can now have an engine interrupt coming
>>>> out of OTHER_CLASS, so we need to handle that appropriately.
>>>>
>>>> Signed-off-by: Daniele Ceraolo Spurio 
>>>> <daniele.ceraolospurio@intel.com>
>>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/i915/gt/intel_gt_irq.c | 78 
>>>> ++++++++++++++------------
>>>>   1 file changed, 43 insertions(+), 35 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c 
>>>> b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
>>>> index f26882fdc24c..34ff1ee7e931 100644
>>>> --- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
>>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
>>>> @@ -81,35 +81,27 @@ gen11_other_irq_handler(struct intel_gt *gt, 
>>>> const u8 instance,
>>>>             instance, iir);
>>>>   }
>>>>   -static void
>>>> -gen11_engine_irq_handler(struct intel_gt *gt, const u8 class,
>>>> -             const u8 instance, const u16 iir)
>>>> +static struct intel_gt *pick_gt(struct intel_gt *gt, u8 class, u8 
>>>> instance)
>>>>   {
>>>> -    struct intel_engine_cs *engine;
>>>> -
>>>> -    /*
>>>> -     * Platforms with standalone media have their media engines in 
>>>> another
>>>> -     * GT.
>>>> -     */
>>>> -    if (MEDIA_VER(gt->i915) >= 13 &&
>>>> -        (class == VIDEO_DECODE_CLASS || class == 
>>>> VIDEO_ENHANCEMENT_CLASS)) {
>>>> -        if (!gt->i915->media_gt)
>>>> -            goto err;
>>>> +    struct intel_gt *media_gt = gt->i915->media_gt;
>>>>   -        gt = gt->i915->media_gt;
>>>> +    /* we expect the non-media gt to be passed in */
>>>> +    GEM_BUG_ON(gt == media_gt);
>>>> +
>>>> +    if (!media_gt)
>>>> +        return gt;
>>>> +
>>>> +    switch (class) {
>>>> +    case VIDEO_DECODE_CLASS:
>>>> +    case VIDEO_ENHANCEMENT_CLASS:
>>>> +        return media_gt;
>>>> +    case OTHER_CLASS:
>>>> +        if (instance == OTHER_GSC_INSTANCE && HAS_ENGINE(media_gt, 
>>>> GSC0))
>>>> +            return media_gt;
>>>> +        fallthrough;
>>>> +    default:
>>>> +        return gt;
>>>>       }
>>>> -
>>>> -    if (instance <= MAX_ENGINE_INSTANCE)
>>>> -        engine = gt->engine_class[class][instance];
>>>> -    else
>>>> -        engine = NULL;
>>>> -
>>>> -    if (likely(engine))
>>>> -        return intel_engine_cs_irq(engine, iir);
>>>> -
>>>> -err:
>>>> -    WARN_ONCE(1, "unhandled engine interrupt class=0x%x, 
>>>> instance=0x%x\n",
>>>> -          class, instance);
>>>>   }
>>>>     static void
>>>> @@ -118,12 +110,24 @@ gen11_gt_identity_handler(struct intel_gt 
>>>> *gt, const u32 identity)
>>>>       const u8 class = GEN11_INTR_ENGINE_CLASS(identity);
>>>>       const u8 instance = GEN11_INTR_ENGINE_INSTANCE(identity);
>>>>       const u16 intr = GEN11_INTR_ENGINE_INTR(identity);
>>>> +    struct intel_engine_cs *engine;
>>>>         if (unlikely(!intr))
>>>>           return;
>>>>   -    if (class <= COPY_ENGINE_CLASS || class == COMPUTE_CLASS)
>>>> -        return gen11_engine_irq_handler(gt, class, instance, intr);
>>>> +    /*
>>>> +     * Platforms with standalone media have the media and GSC 
>>>> engines in
>>>> +     * another GT.
>>>> +     */
>>>> +    gt = pick_gt(gt, class, instance);
>>>> +
>>>> +    if (class <= MAX_ENGINE_CLASS && instance <= MAX_ENGINE_INSTANCE)
>>>> +        engine = gt->engine_class[class][instance];
>>>> +    else
>>>> +        engine = NULL;
>>>> +
>>>> +    if (engine)
>>>> +        return intel_engine_cs_irq(engine, intr);
>>>
>>> Drive by observation - you could fold the above two ifs into one 
>>> since engine appears unused afterwards.
>>
>> engine can be NULL in both branches of the if statement, so to get a 
>> unified if we'd have to do something like:
>>
>> if (class <= MAX_ENGINE_CLASS && instance <= MAX_ENGINE_INSTANCE) {
>>          struct intel_engine_cs *engine = 
>> gt->engine_class[class][instance];
>>          if (engine)
>>                  return intel_engine_cs_irq(engine, intr);
>> }
>>
>> Is this what you are suggesting?
>
> Right, two ifs are needed after all. Well at least it would avoid the 
> pointless engine = NULL assignment. Up to you.
>
> Absence of any out-of-range class/instance logging is intentional?

There is already a log further down in this function.

Daniele

>
> Regards,
>
> Tvrtko

