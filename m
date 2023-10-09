Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C13CD7BEB10
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 21:58:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 608A910E2D9;
	Mon,  9 Oct 2023 19:58:06 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB7610E2D9;
 Mon,  9 Oct 2023 19:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696881483; x=1728417483;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HWK0MgVlDSGvT0R6e0s9V2BzNrFiNXN4SEUGl35n/4Y=;
 b=hTVXi1iNNyt2Q5NOEUivlgodSTHVQiMNci9pn5G8opmErwSa4z/qi0il
 EM1ONDB+UQSAdCKS+GYxwVDYPJJxFdQ53vT8tq37I3yeM82dNqOORanbA
 EeDyQrhl1O/tSrYhYyVnIDYMcagmXEzir7VHIDOzdCmpZH10WpdPKrU08
 aohFT8aqTlQGMW/HTOiEqGebgJkkOdQJpu661LuXT3zI79nbwcPyEhokt
 gGQ1Y9y3CgqZboqVWTvSXcLUEaTB7P3Ss52yLrW5FEEwCmfhEL6PVKOYg
 kdOf6rEOP8HYKRLCiDZLHHW3Dk325YCvJRPxgCQYFqmO+D6j44ffjXF9L A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="415221649"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="415221649"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 12:58:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="756830442"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="756830442"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2023 12:58:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 12:58:02 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 9 Oct 2023 12:58:02 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 9 Oct 2023 12:58:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WOMz5ARExhHGkn3MH0vbFYCTdDNSczirip0T1ZjXTp/MvznuPrw4kWSX5JFdk4aAuzwU0zBL8KoDNljAbb8UVEMm/8bj58AHQKCsYDqCinfIwIAM0dUf01FiWcfU+GIobPVwxXKbD2T+MyMMmp4TxQf/+IHnMtL+00N3Ov7gf/9F9ULlQIQnuXILIwU10GpOnwXJVwNvRuGBizErJxTjp+HnjQMje2/xka5cgXIqE88B2g5rYd54dO1+G9cWyd9N3FApie6WJ2NFSMELu/BxNDOgufujDcsz+2tw/wgRSB5Mkrd2gDkN+ch5ZYQK9kGDbYs6x4W/h3PcTshVKjt9kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rXGda0F7pzHTNr0djaFXcV27cV14yIFumCjIhGymlhY=;
 b=hX9vrtFamzM0V57XFVMQtAwD4aNZc1TrAQsGBaeTk4IEJ7yOIdDpiYDorJ2DMMkJkrvEG7WQaVHpyz6rv6CfmCtaBah20peIX7FloKFjq21V8KAWqQuUnfIzC3QhGz9RnoKkt1mGCcQgAENka6emgkyVh5Rvj+pgrxx7jU23V+dkqm9uhCA43/47UNmNXx2jM7ngcVKNHOLh7t7N47FWuvvRqQhhBSXFvFuGBUuRa78QpJm49hESmQLTqRKcTjbWHxohcUkPBmXFJH+eAJeikBCaZAbwYBIyel+lH9HVWWXjeiKjAtTjEzbANYy404Dumc9W3U4KXSik7DueMNlzbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SA0PR11MB4702.namprd11.prod.outlook.com (2603:10b6:806:92::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37; Mon, 9 Oct
 2023 19:57:59 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::a782:6fec:8d96:27b5]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::a782:6fec:8d96:27b5%6]) with mapi id 15.20.6863.032; Mon, 9 Oct 2023
 19:57:58 +0000
Message-ID: <1409712e-d495-41df-842b-211fa3f37384@intel.com>
Date: Mon, 9 Oct 2023 12:57:55 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915: More use of GT specific print
 helpers
Content-Language: en-GB
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20231009183802.673882-1-John.C.Harrison@Intel.com>
 <20231009183802.673882-3-John.C.Harrison@Intel.com>
 <ZSRaaVzpL51DA3y+@ashyti-mobl2.lan>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ZSRaaVzpL51DA3y+@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P222CA0006.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::11) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SA0PR11MB4702:EE_
X-MS-Office365-Filtering-Correlation-Id: c81ed1c1-755c-4cd3-788b-08dbc9020910
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zJx0IAQYCPvR8B+DI+FjUNxPbGVqAFwZOnq6PhNSjvWYeenn+vSKoC0grpEDS25AdTsbQnJBVT2zw8IQW5DkUFS/7zlKc+6PEKrYszYaOAvpjKcKuuUdh3bRa0Ejxnb8QdMPsvu/iaUVVRLod6knqrNDp86voHo+Ygjsqs84hhZnwVcBDw2yrK5OP2p7qKfs1+EYnRY+QWJzmXz/G3cItbBuEL9EEnJ4UkArqCgMvd88VwRKtzWWaCdVsf1vlacqEfQS7kzSSAmK2TS/lZAZbISe+XErvyIGnAozP2CBGwHaTQr7+LcsjOYSVgdw1ouAPewKhqI3he5B0Qi26I3KPb6dTTF6B8hF3x8Oj7XUUTBlCZskP1j7irtke+Z+f08ww1Xmps3wWv2gnEME/yryFKuvrY6vXzKod6kTujtDRsDD3TSIf2b62/6dFsFs8aU+pZSZvPD4BHtcM2CoTCdAsJFBZGDtfF1rDxsQMVxO5DC3jy6a54u0aUOw9FMXBpPidKF3WIZ24PA0MksrIu60NKM1J4BY69oT0aEE3eLAb5wfFAKq9yHKfj7T/s6w0Kv6fUiWX3cBwhMNhz3yNQINC6CTjdfQjv3aoLFe3eA7kZVpffHSBY19TZ76+fLa/UGBZrhnLzpkXZQ5iRMyA7rmDA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(376002)(366004)(136003)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(31696002)(86362001)(82960400001)(38100700002)(36756003)(31686004)(6512007)(2906002)(478600001)(6486002)(41300700001)(5660300002)(8676002)(4326008)(53546011)(6666004)(6506007)(8936002)(2616005)(83380400001)(66476007)(66556008)(6916009)(316002)(66946007)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDN6K05LMEV0ZElHUGhzY1plRUlFUjd5enpzNjZ0L1pueXRaTUwxQjU1YkV2?=
 =?utf-8?B?ZkdVTzZwUnBDekFCTDZrWVhHM3BoYzU5QjArTm9xZEVZWWNOWHVnNHAyaHNB?=
 =?utf-8?B?UWdPbWVpbkgrUmRLL1Z3d0J0QWVxeWRNRThjcGRKNlQzdDJaeFB5Z2N3SGRh?=
 =?utf-8?B?VHFFdVU5V1NzeXE4MGxoZ2pLY1crM0Vkek1OZHVmTG5EU0NPemZvOXo3TmRs?=
 =?utf-8?B?UE9Uc3lPZjloMjZGQTdHcmU4Tkh6UmxFVnlBNTJjaDIwVkRaTXBaY3IrdnpY?=
 =?utf-8?B?ZkF3U3d2TWtIVEtOQkNiT2VHa0YrK2JwNXJlbFlHM0NhLzhVRXp0YThucW1U?=
 =?utf-8?B?U1hMVFR3M2dZNm5HajBzaWlueTZxbzFOSkxnR2xydytDaHQzWm0yMTI4LzFX?=
 =?utf-8?B?alNhR0hJQTVNbWRtdWQ4T1pBZ2VBeEdYclE1SGpESE1lOWoxSnhTZXJMb3VI?=
 =?utf-8?B?L3FYVUMyOVBhU1pQbllML2RvZlB4UTdZeHVhSWtyUjNJYXBZRmVqZkxLb3NT?=
 =?utf-8?B?N09LcXR1MWhZMFpYQjZFdVAvT3hRTmV1anN3enloekhqWktHN1V3N3dYeVBy?=
 =?utf-8?B?MzdFdUhUY3RFOFdjUUZhSVUxcFp2blFKb2lESHh6SzRQTmgxTWpsYlJRTVZk?=
 =?utf-8?B?bzhmeFh3TGxQUHNXOXBza3Fham9kMG1QMUJSRlVXRTUwL3hoekZQM2Q0UU9m?=
 =?utf-8?B?RmNEY0NUVkxvcks0Q3pBY3MxNEVrUDNDdmkrZ0pwV1p5VkFwVnY0K1hmb1dT?=
 =?utf-8?B?RXdJUGV0YjNZdGIrUmpFM2RGOWNWUXVVSUp1UkVWaEF6blozNVJ5NTZ2Z241?=
 =?utf-8?B?SUVZWGd3SFNVK25LVXBvelJuL3Nhc1NmOEZGN00rcWUzUkc2M2loV0ZTNTE1?=
 =?utf-8?B?cFdPNEo4K0VVR2lRQ1piUHZUaFV0SnBHZmV0SUx1aDFDS1JyN1NZdjZSeW1i?=
 =?utf-8?B?SW9KeFpUeXFPZ1JIaEVIWUtRTkdPQTlmSnM3WVd3ZTNSK290N0dDczVnY3Y5?=
 =?utf-8?B?MzB4MlMwMDl3MXpaYnlmeU9Nc0EyazM5ZmkyY1BWbkR4QWcxbzdsWWo4cEdE?=
 =?utf-8?B?NXhiUW9FcVRBMW0reVBWOHcvdXUySEM3c0gwcE1DYWd5RlNxSnFrVzFxc0Vq?=
 =?utf-8?B?M2tSRUhjQ1BkbEY3R1JQbTlNYWVURGlrVEJVK1VjZE9ISllDN0k0Umc1cVpr?=
 =?utf-8?B?VGdDMm5lRUtncU9FZ1FKc0JlNXN3TWRjc0tYT1BYUWlzV05Oem01TnVINzE5?=
 =?utf-8?B?T0RHcGxNMjBZN1MrZ09HVmwyd3ArWFJ1NHRiQWR0alp5MllaUHNqTUNwUm85?=
 =?utf-8?B?RTlxM1k3SzdnQk9sN09nT0ZFeHF4U2oxQkpYUGxzanlBeVBpK281ZW9pSDRo?=
 =?utf-8?B?ZHVmdVhUdHQ4WmRrZG10MFlWK2hZZEZZVXg3VzZTVk1FdnMvMHVQdWxnRDBK?=
 =?utf-8?B?TThmRDdtVlh5aW0veFdGcTEvOTYzcHFMZHJxRklhNm5LbkErRGtDWWhsZDIw?=
 =?utf-8?B?RkV3a2huWnM5cG9UUHMxVUZwVjV5aWxiVklveGFFVHpqOVEvVy9lc3hzaGpH?=
 =?utf-8?B?VWFUcWw2bHczUTZWMUtjR2QrQUZJb1U5WUo1QndndUhEUlMyaFBDVmp5emVU?=
 =?utf-8?B?UXB0WFdCOTIwdzhXWUlxSTFkQzF0OVFvUmlubXBGY1ViY25SOFJFMkRtNVBQ?=
 =?utf-8?B?NDZ5ZUFaUElaVFhwaEpqd2cwb1FJblFMZEpHZGJNaDB5UEJ4YlBCSFk3UUZJ?=
 =?utf-8?B?Z3JsSkdTeExCUVAvMGhSbXdNU05oY1VmQ0ZzSnhyUzN6YzBnczExMGg2ZTZk?=
 =?utf-8?B?ZlVMNlFVSVJNd2NZUm1KWlNYUzYvSnFRM2JJZk10azZOYndoNkRUdW5hTURu?=
 =?utf-8?B?VytnNHVJazh1VVVmSHhTek4za1EvY0FleFlpdWZDTFh4N2lrNEtpQUNISzMx?=
 =?utf-8?B?V1pjT3lBbHlSenViRzdiTFJBS2RqMWZCREUyeFVxM294RTNvOFFUOWpQMXN6?=
 =?utf-8?B?T2NsaGRkSGVpb1dER1lpYS9QWlJqQTRWaTJSR0N4U1dCZmhhM3Zzem5KS0Ux?=
 =?utf-8?B?a2ZtYlZOKzRaUEdQRzZyRVhkYUxnZ2s4WGN1Qm4zQmRKNkNGMml0N0xQWG81?=
 =?utf-8?B?ZmtYSENJTTlCSDYxMEd6aWFha1NqbTdxUCtNSnBKSytJaG1nNXArREowR2xY?=
 =?utf-8?B?T3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c81ed1c1-755c-4cd3-788b-08dbc9020910
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 19:57:58.3281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BjKhL188Q6KJRBLT88SF88D899X8Cl8XAUDIikdH54FE9n1Kx5j+2uzBGqN2zhmOqFbXe80NmCICyqy7LJZa4jALImvNTtDBOEzfCJkGlwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4702
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
Cc: Intel-GFX@lists.freedesktop.org, DRI-Devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/9/2023 12:54, Andi Shyti wrote:
> Hi John,
>
> ...
>
>> --- a/drivers/gpu/drm/i915/i915_driver.c
>> +++ b/drivers/gpu/drm/i915/i915_driver.c
>> @@ -71,6 +71,7 @@
>>   #include "gem/i915_gem_pm.h"
>>   #include "gt/intel_gt.h"
>>   #include "gt/intel_gt_pm.h"
>> +#include "gt/intel_gt_print.h"
>>   #include "gt/intel_rc6.h"
>>   
>>   #include "pxp/intel_pxp.h"
>> @@ -429,7 +430,7 @@ static int i915_pcode_init(struct drm_i915_private *i915)
>>   	for_each_gt(gt, i915, id) {
>>   		ret = intel_pcode_init(gt->uncore);
>>   		if (ret) {
>> -			drm_err(&gt->i915->drm, "gt%d: intel_pcode_init failed %d\n", id, ret);
>> +			gt_err(gt, "intel_pcode_init failed %d\n", ret);
> using gt_*() print functions in the upper layers looks a bit
> wrong to me. If we need GT printing, the prints need to be done
> inside the function called, in this case would be
> intel_pcode_init().
It is less wrong that using gt->i915->drm as a parameter and 'gt%d' in 
the format string. That is the whole point of the helper. The code has 
access to a gt object so it should use the gt helper to make use of that 
object rather than unrolling it and diving in to the gt internals.

As for moving the error message inside the init function itself. That is 
maybe a valid change but that potentially counts as a functional change 
and should be done by someone who actually knows the code. All I'm doing 
is improving the code layering by using the correct helper to hide the 
internal details of an object this layer should not know about.

John.

>
> Andi

