Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B20B6A59D7
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 14:13:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2228910E4D6;
	Tue, 28 Feb 2023 13:13:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FF2A10E6A5;
 Tue, 28 Feb 2023 13:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677589984; x=1709125984;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LnY5nbwsXXHq44Te5mqd5WrIp4dUV/CyJ86fWgeTnrM=;
 b=UJajU5QznbjBFrgC5mifGLa6qoIzmGEvJ9PjbQQqk4SYsHHzmtJDzSK+
 lg/iHGjqLlBPm+1I+cZQ6u4QxUS5a6rI8UBBhlahlceWVxnMnWhBG5v7y
 Yl2MShe8TEMUNBb2YLmP3Inbh8oOSWjU9fqi3N1tdp6uZFiUarZ3L6Wv8
 LTrfPfZfJC4AwAy/dmOI4LpC9wF9ecdjbS9n/cRUy9gVPLTR56zdSa7NU
 OjHGWS6UJ82VJuUI/znCvc8e5XeWwbl0Z+xB5SmreZXYFJclSGVmCsQMz
 L5Fii/2Yn9CKT6wpIxtZIImpRQimGmWIsIMFQ5M+M2sZE3rr+NyNATmLo w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="335616503"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; d="scan'208";a="335616503"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 05:13:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="848246179"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; d="scan'208";a="848246179"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP; 28 Feb 2023 05:13:03 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 28 Feb 2023 05:13:02 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 28 Feb 2023 05:13:02 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 28 Feb 2023 05:13:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=myNAEBlPd8tU8kIyBFSHhxFbT/Wj9feMEOfGhwBuFemF7prNYusX8An65St8nOrXnNY+/pG7ertAjAh7x1bENHFJ+2AJ/z2gQe3c5cC3y+XK0IrspK0CcuIf8EljzQdopIXdUgYQYm2AyZsqvJznz39x77UBq4kQuqFbxhLGx9EiSKJ22ChUEQj3Sr4L9N+2EafbnrkeuN0bWzTt3hw6Qs5dZNe0nnyBHYwJW9+ydCX4GPaOB3AYuWZh/HtjiJsN5T+X10lhGdclWKtMc+IPwMBshDkZ8PICq1OOr3cfZecj6u0KWjdGs7EwkUT3quIBw9L8tmJZi21wLuMr3sezXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MvRDfXyJICr63OUSWM5LptL7RWYTcOamDP3rulqnwNI=;
 b=X2lm7dNS5ZV+6tzod0HGIGDqqp5HrLdGv/wz49ZpEwO3sZd6Zu1KuWZvAZdP4xafANPX9CsLtEA3bcthHkReVHvxQoVyjiIflDPzzZDYnz2r1Osi+kGJmGVCdGhP50zEjuYNiNd4567cWzNkt2z+hJINl4t3nwMK6S/wteiati/wORepBRvBijQdpTSEW7ZT9b/lmk2PUCO/uVYtQudcPLupNF04vM09g/NF5wUuN2x9LbP0VThaqM8V/AD53jJvDfSJsK/9CnOzZUnBIFteKLsPEVxnORbz77xgRPWz9C5fun+Uot+7Jiw4xKFfeptaJVw9/ymgvqhTeDSbbYCdyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SJ0PR11MB5896.namprd11.prod.outlook.com (2603:10b6:a03:42c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Tue, 28 Feb
 2023 13:13:00 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::ba24:c771:dd96:7d68]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::ba24:c771:dd96:7d68%9]) with mapi id 15.20.6134.030; Tue, 28 Feb 2023
 13:13:00 +0000
Message-ID: <c526d71c-c314-cd87-8684-5c12d7721679@intel.com>
Date: Tue, 28 Feb 2023 18:42:50 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/mtl: Apply Wa_14017073508 for MTL
 SoC Step
To: Matt Roper <matthew.d.roper@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
References: <20230223184140.3452853-1-badal.nilawar@intel.com>
 <Y/fKjHl/xb1CBD/b@intel.com>
 <Y/fW7AwGnT7KJJCS@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <Y/fW7AwGnT7KJJCS@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0100.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::15) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SJ0PR11MB5896:EE_
X-MS-Office365-Filtering-Correlation-Id: d0404de5-bed7-4a44-c8e3-08db198d8435
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QJobslg4yyZnOh+TOaKxXXYh47Ps5VsDmIo/ENGfbG4Xof2631EnoZHz7LeiHDif/2cRWZMWpks1KAf9faAJuDcvVxfbKwaQL3DDAXTybNoA08i6COSQcp+RyJbMBdLNlskBDh2cKNHSIQpXqn8/2Y9YuABJd3zGQH7lfvTP6hd8ZgTS3MS8TI65DdGenDyo/OucFNuXW5lOBapiz9nlgAcOK30Fj0XYmgDHnWcg0m/Ht38qNdLO8UNs/TskOQ55m6ODWnXBOqxQh1vdgO7r64Yj3fA5jU2+4b0/7JzI4KxufSluTajA4vMWLdGA7fk40eGJunhOLXGuWFUsNwozAvArir7qkIZ51q3MHLUZTLp5kkpgrViIaQ2Ptyx4yKRhhgvvMsSHMqtLL49wvQiUOiUBeMKcNWGC1mpAYXzj05M+Js3Lsx+vMQ5znI8LTeAbWWLnQl63v/9Cy+b8/jBMgN2B0nRoh5ySguNDylqHg3/QhyE8zQZumanxOO5F4itpwdfwJBdyABM6ihoHlqaLdcU82xQcZG5FTk5/Rfqg63fV4VmeghPmi99fY6XahPNZqSMYBIuwPQtS7roeh04OFubHwD30HeSVLzHRg3LeZmk+wNl3p3ZZad9Bp7YiJQjR6lY86n9UQu4IenNDtaCaR8q1h4pzTlXxe9YJDQIQBre/ZZHxVf2Ugs6xq6Rxs3WC2ONG4v/jtH37CQT+9vPwVk4FMa32m8qExHtSRUppiNE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(346002)(366004)(136003)(39860400002)(451199018)(38100700002)(31696002)(2906002)(82960400001)(31686004)(86362001)(6486002)(6512007)(66556008)(53546011)(6506007)(36756003)(186003)(4326008)(8676002)(66476007)(6636002)(83380400001)(478600001)(110136005)(41300700001)(2616005)(6666004)(26005)(66946007)(316002)(5660300002)(8936002)(450100002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTNiZmhBSGE1STNuS2w5M2YyNEdMUW9WbFY4ZGNXS3JqQ0tvelg5L3pSNjR2?=
 =?utf-8?B?ZFhkNlpRbUowbGF3aCtwYUU1US81b3dHTzdRSmg3NFBhVEJqODZBaVVqemJ6?=
 =?utf-8?B?Y1NFcWtNYittWkFPb2tMYWZxWHRoTk9nSE9MdEZDelZIdThpVjhiZkVDaFls?=
 =?utf-8?B?clFyd1dVUHpqQ1U5U3JkTDRBdzBZMnh2RUM1M1BZeXZIalRlMndpOThhVlZw?=
 =?utf-8?B?MS9SWXcwOFFNQ0d6QjdpT0piZGhBcTFKREtHS0Fka21sVnpWZzFISVlFb0I1?=
 =?utf-8?B?N3B6QmcrNkZZbit4cHVXRHdwalJ5ck5aV2JZTnhaRWloblB1dHpEb0xyQWNT?=
 =?utf-8?B?ZUdObEdMbUgvbUl1SHo4WlIwQVlBdloyd0g1WURkcStxZW1xaExMalVEdzhW?=
 =?utf-8?B?aVhGbXBaUDlGTDI3NitRUjJkWTAvYkxkVWtWa2JiYmlkd2dmMndwSUkxbUFs?=
 =?utf-8?B?MUMreVY5L1pDaHNBUThxVjlWOS9nNWtRUm1rZkg5VEc1U2JXYTVrcjI5MXlJ?=
 =?utf-8?B?ZnluQzJIdStnRUlUbDJiWUxTZEU0TUJ1YmliOUo1YzZEYkszbkRHdEwzTE1O?=
 =?utf-8?B?YTdKcjdlbDIwQ0JERG8xZDhhL3BiUTh6eCszVXhxam40RzdnbCtHY3h6K3h6?=
 =?utf-8?B?cVRvbUZJV1d3RExOVVFjVlJmTkVoTmNSMGZ0eFNNNnJRVndYUkFNUk5VckRN?=
 =?utf-8?B?Ulc1VnA3R2l6Qk1nYWtVaUU3ZkE4M3BoaW1GbVU3WkRsNHkrZytlTzVBakJw?=
 =?utf-8?B?NS9CVVhNcC9ZMHhyd2N2VHhULzFoVmxIUmxoWmpLeVVxTnVGUWhuQXBCYWo2?=
 =?utf-8?B?ZmRkcHZWZDBoT2pnNGlLVVZtSWxJT0trQVJ4V2w4NEUzU2VSM0lnWUVIQ2JI?=
 =?utf-8?B?alM1WXY4THVyZmNEN2pNL0RZWkNUMENNa2tmRmdSMUlyR2tQUVhJSERUUDFi?=
 =?utf-8?B?SzFXNG9uNnEvdmc4WlpmVVVoSVZCd0dQNVRrdHJ5UmU4L1ozZVk0U01KUy9l?=
 =?utf-8?B?VEpnbWVUYTJJenh4SThJbXZzbVpOZUhURHNPUWNldHJDeGgvK29VRDYwM0t3?=
 =?utf-8?B?Y1BHa0FaVjlZR3RabHdhZ1loUGdpdEZ0VmdUMzdodUxvN2FLOURzbWpadW9u?=
 =?utf-8?B?OUlURU1Oa0hMclJjKy9kUmx2cTg3WGNIYU1zWjM5WUdmR1grMUptSlZ6NklZ?=
 =?utf-8?B?U2lsbmFrQTc5R2Z6WE81U0VJUkpvTGd2VXhYa2FUckZzSnJQSC9JMFBEQXZJ?=
 =?utf-8?B?QjVUZUUxaG9oRkZ3V3JSNTVBVDZBTTlKTzdyd1NUMkpMWUp4STJHZGxuNkpD?=
 =?utf-8?B?MzN4ZWdKWVdXYnBsQ1JIL1duY3N6VE1sQ3g2MFpXTG1CNW4yUHl6TFZ2UHZz?=
 =?utf-8?B?U1NTcDFVQ1VmazdZSEVVai9KTURNcWovb3MvT2dsanJqVTRFWkpsMXR1Z0xh?=
 =?utf-8?B?WTBBMFEybXYzYWdXbkUwdmErOEFNLy9YNkZUdWY3Y28vS1A4blJYZVY4RDdx?=
 =?utf-8?B?MCtsbHF4Nm1Kc0trc05rdWJ4ajI2emZsSi8raFdzaHJ5amw5ZmtuT3NYYUg1?=
 =?utf-8?B?bHN6Q0ZGclphRzhlSUF1SUM5M1U5bVI0YmtyRUhsUTFaVmRFNm55MlFkTjE5?=
 =?utf-8?B?Y2JKRkJNb2JxYmEydkMzZ1JkM0k5aXJFQWJuNkJVM0FROVQ3MWZOdUhLMk00?=
 =?utf-8?B?NGRZVFNxTnVHQThmNkI5Z3lSbG1HSmZUajJXLzREbjZmcmdMZVlrT2t5TUEw?=
 =?utf-8?B?R2M2N3hEQWpPcjFJNjNyQjZ5M21hc25TS0o5VTRaTjQ5YXlyWUZEcW9HS1Zz?=
 =?utf-8?B?bnNGRGxGRGdOcUVNSnp5NHNmeWE2U1VkNU9pTzZTdW83Y1FWcTd5YmdvcFlG?=
 =?utf-8?B?N0QxUVJIZW9zVjlCU1VKRlF3c2dncG8yb2k3amRqNWdOSXE3L2JuVFdic09L?=
 =?utf-8?B?TzlVc1lId2dvN3JQODJ0eG93QjNBSDZNaWlzd0ZBL1ZtMnUya0F1SEt6OTJH?=
 =?utf-8?B?QVhtRWNkSTdCcTBqOXlGTERFY29XQXkyQmlqZDdSZkFzaHRobXBVQ1pXb3kw?=
 =?utf-8?B?c3dubXBCY05vdUc0YWpnMmRkS3Y1eTBqNGpDT3V3QmllQk9LdWN4dXM2OS94?=
 =?utf-8?B?TXZNaHd1Nml2ZnpSRzRqS3FEazkxWERWUHJUMXU2dFlna3IwMHNISWNtM3FT?=
 =?utf-8?B?V1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d0404de5-bed7-4a44-c8e3-08db198d8435
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 13:13:00.4132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S6KnBNuBGEplqxvmRpSAmRuXnLyOQjc10prl6m9Q3AXgnm2DnH/gjDls+bpduEd3rgh5Tv+wFQqbAlxluAijyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5896
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matt,

On 24-02-2023 02:43, Matt Roper wrote:
> On Thu, Feb 23, 2023 at 03:20:28PM -0500, Rodrigo Vivi wrote:
>> On Fri, Feb 24, 2023 at 12:11:40AM +0530, Badal Nilawar wrote:
>>> Apply Wa_14017073508 for MTL SoC die A step instead of graphics step.
>>> To get the SoC die stepping there is no direct interface so using
>>> revid as revid 0 aligns with SoC die A step.
>>>
>>> Bspec: 55420
>>
>> This doesn't prove anything. It is just saying Die A0 with GT A0,
>> die B0 with GT B0 and so on... Please help me to understand that
>> better offline before we move forward...
> 
> The definition of the workaround doesn't say anything about SoC
> steppings that I can see.  The workaround itself is tagged as being
> being tied to Xe_LPM+ (i.e., the media IP), not to MTL as a platform and
> not to the Xe_LPG graphics IP.  In relation to the media IP
> specifically, the bounds are listed as needed from A0, fixed in B0.  So
> unless there's a belief that the workaround itself is incorrect, I think
> the bounds should be
> 
>          IS_MTL_MEDIA_STEP(i915, STEP_A0, STEP_B0)

As discussed offline I will update the patch with above change and resend.

Thanks,
Badal
> 
> 
> Matt
> 
>>
>>>
>>> Fixes: 8f70f1ec587d ("drm/i915/mtl: Add Wa_14017073508 for SAMedia")
>>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gt/intel_gt_pm.c     | 4 ++--
>>>   drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c | 2 +-
>>>   2 files changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
>>> index cef3d6f5c34e..4ba3c8c97ccc 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
>>> @@ -29,7 +29,7 @@
>>>   static void mtl_media_busy(struct intel_gt *gt)
>>>   {
>>>   	/* Wa_14017073508: mtl */
>>> -	if (IS_MTL_GRAPHICS_STEP(gt->i915, P, STEP_A0, STEP_B0) &&
>>> +	if (IS_METEORLAKE(gt->i915) && INTEL_REVID(gt->i915) == 0 &&
>>>   	    gt->type == GT_MEDIA)
>>>   		snb_pcode_write_p(gt->uncore, PCODE_MBOX_GT_STATE,
>>>   				  PCODE_MBOX_GT_STATE_MEDIA_BUSY,
>>> @@ -39,7 +39,7 @@ static void mtl_media_busy(struct intel_gt *gt)
>>>   static void mtl_media_idle(struct intel_gt *gt)
>>>   {
>>>   	/* Wa_14017073508: mtl */
>>> -	if (IS_MTL_GRAPHICS_STEP(gt->i915, P, STEP_A0, STEP_B0) &&
>>> +	if (IS_METEORLAKE(gt->i915) && INTEL_REVID(gt->i915) == 0 &&
>>>   	    gt->type == GT_MEDIA)
>>>   		snb_pcode_write_p(gt->uncore, PCODE_MBOX_GT_STATE,
>>>   				  PCODE_MBOX_GT_STATE_MEDIA_NOT_BUSY,
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
>>> index fcf51614f9a4..7429c233ad45 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
>>> @@ -19,7 +19,7 @@ static bool __guc_rc_supported(struct intel_guc *guc)
>>>   	 * Do not enable gucrc to avoid additional interrupts which
>>>   	 * may disrupt pcode wa.
>>>   	 */
>>> -	if (IS_MTL_GRAPHICS_STEP(gt->i915, P, STEP_A0, STEP_B0) &&
>>> +	if (IS_METEORLAKE(gt->i915) && INTEL_REVID(gt->i915) == 0 &&
>>>   	    gt->type == GT_MEDIA)
>>>   		return false;
>>>   
>>> -- 
>>> 2.25.1
>>>
> 
