Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCF46748A8
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 02:12:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA4AF10E9FA;
	Fri, 20 Jan 2023 01:12:47 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F3F110E9FA;
 Fri, 20 Jan 2023 01:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674177165; x=1705713165;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=F2UqyZ4t66VkHAcB/YJ9vGSZBbJgsssHF564sMdngZo=;
 b=MinRK7v4V7/tlGgaPVyzC7Aq3WrXk8L01I7tOWtOFIpFrQP3UfoIxDWE
 JmeAtQftZQlTVD6KVNN1rwm0jv2wV88jqpn/rgAEJai3b5Cs9V1jQYcEC
 ipiE7XNgsMEXH53fbiL2CgGVh4IC83l4Neri0A74cZefvyQnKK2fhy/tn
 2uzOC534cYaWlkXzhEjBtDe0kn/dwTBj3/Uw3dj3QB6MuNsc870HHJNid
 ERFbUY5B8PIR0XkpmHMWZJLeSDpI0dAwHT9jIr422qHhGz3lRmN82kLVQ
 AQTvqsa+cIRwBdvCYp9IbePfBS2uPXOivOlZqqcWJiwJ7pdyZK4FcAcp1 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="327573585"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; d="scan'208";a="327573585"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 17:12:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="662375285"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; d="scan'208";a="662375285"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 19 Jan 2023 17:12:44 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 17:12:44 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 17:12:43 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 19 Jan 2023 17:12:43 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 19 Jan 2023 17:12:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JL9qT35r9UPw/7ovp9rn2Ep/g/Etk/lAess/iigSvB3Ctt60gzIZ2KWNe+V+Kh3wPqzX31+DK97zEs9N75QKrDpq/Jp3SU4aD+cKsLoZDZHb5QalGJU/Dcn/bzmfE5ePfu/K43xleZs5DGYW9A8j0ICjQ+Bvg27A/6p+rciiJGeciUVasne3QIJ3Mb964fLOPX9ZzVLt4EPlWy0RLeDsCMmPavhNZUHsV8OkNxHsiUa3DegTq2ntAOJh20E5k6cFxfw1zqUOdax/D0fXxAwHC7mIfwhaFSlLk3uvQ0aahSnal8iNoU7Amu873Nqm+PJDqqRI7p7PkOB4L+N/BYxSVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nsYhi1D0zHVBVJ12QY1bPx3hKPwDF3kjOMxO8hImd2Q=;
 b=bL9VO/dIcsoqyCwbYE2VE+08p1ktVQuu2zCbcve5GIrZXOJfmDIHP6KDhBL1LQpMjjdphNedyvLyePrtTmN/q0wAcyaGDbCP9e38ESzsGiMxfWHwunHFMsCf95QNHM+P5d0k9LgnqiciikLL7UKtv7Ah/B+InwBw6HdQK1urkSr3lVjZKFAIjBOAn4JC1bYZzwZpzbXaqMpSAWd/h4/8OdM53bZ7tVsfQffMSXSLEjv7LH7AHVmMYbgBpeJj0WcsIsb2autS8r0iH+mQdAhLbzoGM3xAp9MsQqynx7LxV0qBpgvrRsvJR/1eJ1qnOEwuyEHXQ5nJwdQ8ZPRiG/qPsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 SJ0PR11MB5678.namprd11.prod.outlook.com (2603:10b6:a03:3b8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.26; Fri, 20 Jan
 2023 01:12:41 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::62c1:155c:1857:167a]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::62c1:155c:1857:167a%8]) with mapi id 15.20.6002.027; Fri, 20 Jan 2023
 01:12:41 +0000
Message-ID: <4b7ee083-0ca1-7e6d-84fd-c3d3a907e1fe@intel.com>
Date: Thu, 19 Jan 2023 17:12:37 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 1/6] drm/i915: Fix request locking during error capture
 & debugfs dump
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230119065000.1661857-1-John.C.Harrison@Intel.com>
 <20230119065000.1661857-2-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230119065000.1661857-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0088.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::29) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|SJ0PR11MB5678:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e363926-3874-4ef6-411f-08dafa836d18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O58AKf+EXarE2eBF0dtvVnACNagqvvVHGk2c8s8FC3WRUQU+vOMENHfX+eC+ZWJms4flc0CiLjzerY9YMvhEHA5JAuksjm7LYY0RlH1X6rTliIg02D00xho46suKJMgmpFFMTM7LxA7rIwVmGvSc5NZ6iMs8VwCnoTVzS0gfn+/auw6Yeb0NES54wiY2aMNkrey95IjMABrDAjiHdF+nizuyT4JWge616+PmjDmeLn8cZfWoFY0HosToqg5vtrBxbPzIXg8XKS+8xLJI9BHmiuUGoQJSgUBEw5STrb+9GW5DYZFp4TAiWoAFPSt0wwsNiemM1YXAjal2xMSxetHYWmEdvyTVaXz7YeEaXW+CmBZsfvq4JJmnUJcLBZmqfIRt2tEhMtE0eu8iSv/i4a3YC4r07RQ8ci/iNRscbpQPjBzcBoOh3ingYTe/8zc8y5hf7fl+cB7irdzzKkmsVrMUjuhbCUWCUWTz46YGeSaiw8Wih53ZTcta2wby2pqkwRMLM3MyBqEkf6L1DvZ2Mig2XYzUfqF+Q5XhMItsBqDUrJE/HSmYoITBTjsgutBmVDnU/GjDLXY4zWBSJnHdDWYKqrb15qbwX+xt5xotJtTBBGMiMJz9s+M4AEF4GDDqm6SjQWBdCoP7IDibNJVMBYC8t2bpCR4YnOP/DTc53bwmLq8HqwC06aOv07cjz/0ThRcsOiiFtk195v12N7qe9PC+0AGXqCGlIt5zCX5RY2Uy7TM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(136003)(346002)(396003)(376002)(366004)(451199015)(86362001)(6486002)(31696002)(53546011)(6506007)(36756003)(6666004)(478600001)(8936002)(316002)(5660300002)(82960400001)(4326008)(66556008)(66476007)(38100700002)(8676002)(66946007)(41300700001)(6512007)(186003)(26005)(2616005)(83380400001)(2906002)(54906003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3dnUDR1d3NSYmhsUHhQbk9EbHRwREJBVXpXZ1FlUk81aUFPRmlRT1RoQXFT?=
 =?utf-8?B?U2xJSm9wT0g4YVBSNi9wUkgvdy96TDE3NG9lOUhXWGsweTlnN0NsaVBSZ0VP?=
 =?utf-8?B?a3JZZkY2QmpUTStqY3RQQnJhRnZtL3FPZjMvZlJJWnlwZVlKN2hrWjBPQnFr?=
 =?utf-8?B?NzFKWExLSm9HVHFnMElseVUwUHdoeXRSRFF6SURLNzlBNGcrVVdDSzBLalQ2?=
 =?utf-8?B?NGdNaGxzYWljSXp4WGJVNHhaaWRlWlV4UkhPdnorYmI1cUdlZ0ZleE1PMXBU?=
 =?utf-8?B?QlpMMmJ3MTR4cFpodjZmMk9ZZjc1bURsS1VLNnFYYjM4Tmxia1lIUW9ndUcy?=
 =?utf-8?B?anRSR2liLzk3NDNKL2RWK25qZms4aEpVT3NGeW1wdzFTV2ZaTzFuaGhmb2tG?=
 =?utf-8?B?YnE4NU80NWd5SHJWejdob0FTTnJUT21ZMGY3UEs2RGdZOGxFQ3Y2Q2RRZmtu?=
 =?utf-8?B?ZXoyWE9yUlJGZkVsM2J4UExobVNlUld6dmV6STNHNmlVeWpZNUtHZENSU1Rq?=
 =?utf-8?B?MXBqb3hvcUNxajQwcTIxejJKQXdBNVVJV0JGOTYrQ1BSSHNRbk1qQ2pzckJH?=
 =?utf-8?B?WGZsTXVLY3V0RU5UQ2tJamVLQU84S3Rod1I0VTlyc2NyTUxSMTg4TFROd01v?=
 =?utf-8?B?QTJDakQ4cVllUFU4WGl2OUdCbGsyb2o2eFFiblRlR3VJQ296Nm5kQUYxa2dQ?=
 =?utf-8?B?U3NWd01ZMmtNc3lwRmo5elAxcFlzdW4rV1pHTSt5MmVvbkpiNHZueU44MTJa?=
 =?utf-8?B?bDRid0ZFVVc0N0xKWkNvRGNCdG1PMzFORnlRNnRSb1ljWGU1RWRkbkFOWkQ2?=
 =?utf-8?B?NGhnenYvS1BHU0dZL2JYTGFLUWNsM2hZWlYrZm1Ra3I4UytPWGM3akdkK3g0?=
 =?utf-8?B?Qy91RHVLUS80cms1OGs4Nll4bWxSdTBiVVczTGRRSDlzSHVObkNyVTNJMW9T?=
 =?utf-8?B?NzN2eTFkZkpFblhZcmNZMmpydWJzQ2VKcnZtSDhNc1lLbTFQTW95ZHRnSGhz?=
 =?utf-8?B?cUxvbk1hQkh5dDZLU09pU0Ztd2RmU3A4OFp6M2h4cmZTamFSWnNIYjZPWWpl?=
 =?utf-8?B?L3ZVL1djUjJCcHFHSW1RbDNlMTRrOHZ5aVJyRWZaR2JBb1hZem1xc1Q1NXRn?=
 =?utf-8?B?MWhXUjlyQzBBMCt1S3J0MUlBN0EvMXJkanVCRHhNQmRjTk1TVHNhVUV3bGcr?=
 =?utf-8?B?OUxpTnlkTzhvNDQ0bm5LM1A0NVJNU0UxRG1UeTZWRG9vOVNENElrQmYzNmR3?=
 =?utf-8?B?WFFkY29SR0RWaFpmNzhESHFPT1FvM21rc2QrWU9XbitGMGdheS9CNGh6TkU0?=
 =?utf-8?B?MHdNSWJDK2NhTHBWQ1dlVDJERFpOVmRlSmlaUnhPb1haNXo2WGtQZjdFRUJu?=
 =?utf-8?B?VVdDbUpRWXM5SDRtRUlKLzFNeU5CTHJob1ZOMmQwd2RuUU45LzlIbXlHcWs1?=
 =?utf-8?B?WHVYVmpSMDcxWWRFT3NsVUM0NFBIVThWTjBCenVjOFEzbWdqMEFUNWdmbVo3?=
 =?utf-8?B?TmVRUVNZSktydEo3cDVPVjNIcnlQNFZkRTNHMms0WHlVdExJYnBRSCt4UVJT?=
 =?utf-8?B?UTZIckcybnBYOGJLYWk0bXFJRkhJRTZzaDI2M1g1U1pzVHUwS0hIbTU0amlz?=
 =?utf-8?B?SUR6NzNzclZ1dDl6bXNmWW1hcTJ1RC9zWURSVlJyVHNBRkVhTXJJK21ZK1dK?=
 =?utf-8?B?bXNqT0d4aEdidEdta2Q0RnhoZXorditnVFlCV01qUzczQmZDK20zV3FtM2dR?=
 =?utf-8?B?SkZvY3A4em1vdnFjUGx5SHI3eTJSdThPVnZFMm0wcjlrU1FlSURZU3VoMGw5?=
 =?utf-8?B?OVJVNURTQVlKVFhoWFcrNmt4WUdva0twVzNESFlVV2xEZlh5eWxrKzUxRnVo?=
 =?utf-8?B?QjE3Vm5qVVhLdm5rLzZzNXA1SHhqNXlIT2NYb2c1dXZicU8xLzhhcVZxbnAr?=
 =?utf-8?B?SXp4bG9YTjArSndibTVjdWVoYnp3djdjaGFVZDM0bzIzaysvTFZsRFFPRWc0?=
 =?utf-8?B?Y3RibGhCbEFMRk81VFd1U29UdHZzWkp6NXF0MjY5bEZSRG9QUE1EMTgzd05i?=
 =?utf-8?B?c3pKSEVuQ1RHZWRLSmtLK2FLbHltMnhIUXEyVnhRU3Q3U2NLVXU1Y0tzU3h3?=
 =?utf-8?B?enIzWVRMWExKVmRXQjEwa3MwV25pcHk5Q1BFelAva3lWUEM5bStRVDNocFR3?=
 =?utf-8?Q?c6XxwDa5kQKy/SGJ52TYH/o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e363926-3874-4ef6-411f-08dafa836d18
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 01:12:40.9311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F6OjjQHYzcFtXxcmPDro8+vh4vy25I6ZvJ4GJ5vFoWuvTRfHzgSPm/pkDaedG3+g+yuaNj7Pzj0xqs1Wp0b09Fmvjje1rA7HchXulryQwbI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5678
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michael Cheng <michael.cheng@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>, Umesh
 Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Bruce Chang <yu.bruce.chang@intel.com>, DRI-Devel@Lists.FreeDesktop.Org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/18/2023 10:49 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> When GuC support was added to error capture, the locking around the
> request object was broken. Fix it up.
>
> The context based search manages the spinlocking around the search
> internally. So it needs to grab the reference count internally as
> well. The execlist only request based search relies on external
> locking, so it needs an external reference count but within the
> spinlock not outside it.
>
> The only other caller of the context based search is the code for
> dumping engine state to debugfs. That code wasn't previously getting
> an explicit reference at all as it does everything while holding the
> execlist specific spinlock. So, that needs updaing as well as that
> spinlock doesn't help when using GuC submission. Rather than trying to
> conditionally get/put depending on submission model, just change it to
> always do the get/put.
>
> In addition, intel_guc_find_hung_context() was not acquiring the
> correct spinlock before searching the request list. So fix that up
> too. While at it, add some extra whitespace padding for readability.
>
> v2: Explicitly document adding an extra blank line in some dense code
> (Andy Shevchenko). Fix multiple potential null pointer derefs in case
> of no request found (some spotted by Tvrtko, but there was more!).
> Also fix a leaked request in case of !started and another in
> __guc_reset_context now that intel_context_find_active_request is
> actually reference counting the returned request.
>
> Fixes: dc0dad365c5e ("drm/i915/guc: Fix for error capture after full GPU reset with GuC")
> Fixes: 573ba126aef3 ("drm/i915/guc: Capture error state on context reset")
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Cc: Michael Cheng <michael.cheng@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: Bruce Chang <yu.bruce.chang@intel.com>
> Cc: intel-gfx@lists.freedesktop.org
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_context.c           |  2 ++
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c         |  8 +++++++-
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 13 +++++++++++++
>   drivers/gpu/drm/i915/i915_gpu_error.c             | 12 ++++++------
>   4 files changed, 28 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> index e94365b08f1ef..e7c5509c48ef1 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.c
> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> @@ -552,6 +552,8 @@ struct i915_request *intel_context_find_active_request(struct intel_context *ce)

Might be worth renaming this to intel_context_active_request_get(..), to 
make it clear that it does take a reference. Not a blocker.

>   
>   		active = rq;
>   	}
> +	if (active)
> +		active = i915_request_get_rcu(active);
>   	spin_unlock_irqrestore(&parent->guc_state.lock, flags);
>   
>   	return active;
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 922f1bb22dc68..6a082658d0082 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -2236,10 +2236,14 @@ static void engine_dump_active_requests(struct intel_engine_cs *engine, struct d
>   	guc = intel_uc_uses_guc_submission(&engine->gt->uc);
>   	if (guc) {
>   		ce = intel_engine_get_hung_context(engine);
> -		if (ce)
> +		if (ce) {
> +			/* This will reference count the request (if found) */
>   			hung_rq = intel_context_find_active_request(ce);
> +		}
>   	} else {
>   		hung_rq = intel_engine_execlist_find_hung_request(engine);
> +		if (hung_rq)
> +			hung_rq = i915_request_get_rcu(hung_rq);
>   	}

Not a fan of the behavior asymmetry, but given that the 2 flows are 
completely different I can't think of anything cleaner, so:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

>   
>   	if (hung_rq)
> @@ -2250,6 +2254,8 @@ static void engine_dump_active_requests(struct intel_engine_cs *engine, struct d
>   	else
>   		intel_engine_dump_active_requests(&engine->sched_engine->requests,
>   						  hung_rq, m);
> +	if (hung_rq)
> +		i915_request_put(hung_rq);
>   }
>   
>   void intel_engine_dump(struct intel_engine_cs *engine,
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index b436dd7f12e42..d123cbd90a919 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1702,6 +1702,7 @@ static void __guc_reset_context(struct intel_context *ce, intel_engine_mask_t st
>   			goto next_context;
>   
>   		guilty = false;
> +		/* NB: This gets a reference to the request */
>   		rq = intel_context_find_active_request(ce);
>   		if (!rq) {
>   			head = ce->ring->tail;
> @@ -1715,6 +1716,7 @@ static void __guc_reset_context(struct intel_context *ce, intel_engine_mask_t st
>   		head = intel_ring_wrap(ce->ring, rq->head);
>   
>   		__i915_request_reset(rq, guilty);
> +		i915_request_put(rq);
>   out_replay:
>   		guc_reset_state(ce, head, guilty);
>   next_context:
> @@ -4820,6 +4822,8 @@ void intel_guc_find_hung_context(struct intel_engine_cs *engine)
>   
>   	xa_lock_irqsave(&guc->context_lookup, flags);
>   	xa_for_each(&guc->context_lookup, index, ce) {
> +		bool found;
> +
>   		if (!kref_get_unless_zero(&ce->ref))
>   			continue;
>   
> @@ -4836,10 +4840,18 @@ void intel_guc_find_hung_context(struct intel_engine_cs *engine)
>   				goto next;
>   		}
>   
> +		found = false;
> +		spin_lock(&ce->guc_state.lock);
>   		list_for_each_entry(rq, &ce->guc_state.requests, sched.link) {
>   			if (i915_test_request_state(rq) != I915_REQUEST_ACTIVE)
>   				continue;
>   
> +			found = true;
> +			break;
> +		}
> +		spin_unlock(&ce->guc_state.lock);
> +
> +		if (found) {
>   			intel_engine_set_hung_context(engine, ce);
>   
>   			/* Can only cope with one hang at a time... */
> @@ -4847,6 +4859,7 @@ void intel_guc_find_hung_context(struct intel_engine_cs *engine)
>   			xa_lock(&guc->context_lookup);
>   			goto done;
>   		}
> +
>   next:
>   		intel_context_put(ce);
>   		xa_lock(&guc->context_lookup);
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
> index 9d5d5a397b64e..7ea36478ee52d 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -1607,6 +1607,7 @@ capture_engine(struct intel_engine_cs *engine,
>   	ce = intel_engine_get_hung_context(engine);
>   	if (ce) {
>   		intel_engine_clear_hung_context(engine);
> +		/* This will reference count the request (if found) */
>   		rq = intel_context_find_active_request(ce);
>   		if (!rq || !i915_request_started(rq))
>   			goto no_request_capture;
> @@ -1618,21 +1619,18 @@ capture_engine(struct intel_engine_cs *engine,
>   		if (!intel_uc_uses_guc_submission(&engine->gt->uc)) {
>   			spin_lock_irqsave(&engine->sched_engine->lock, flags);
>   			rq = intel_engine_execlist_find_hung_request(engine);
> +			if (rq)
> +				rq = i915_request_get_rcu(rq);
>   			spin_unlock_irqrestore(&engine->sched_engine->lock,
>   					       flags);
>   		}
>   	}
> -	if (rq)
> -		rq = i915_request_get_rcu(rq);
> -
>   	if (!rq)
>   		goto no_request_capture;
>   
>   	capture = intel_engine_coredump_add_request(ee, rq, ATOMIC_MAYFAIL);
> -	if (!capture) {
> -		i915_request_put(rq);
> +	if (!capture)
>   		goto no_request_capture;
> -	}
>   	if (dump_flags & CORE_DUMP_FLAG_IS_GUC_CAPTURE)
>   		intel_guc_capture_get_matching_node(engine->gt, ee, ce);
>   
> @@ -1642,6 +1640,8 @@ capture_engine(struct intel_engine_cs *engine,
>   	return ee;
>   
>   no_request_capture:
> +	if (rq)
> +		i915_request_put(rq);
>   	kfree(ee);
>   	return NULL;
>   }

