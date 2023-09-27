Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E231C7AF99E
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 06:44:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1E9E10E39C;
	Wed, 27 Sep 2023 04:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A438A10E39C;
 Wed, 27 Sep 2023 04:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695789851; x=1727325851;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=h8hSHsOTnWdZTpmcyoJhYsZhmC5Kp4/zPu9bCSQ22mA=;
 b=I/83ZmDxLeNjoLaS/xwL4i7cVq4l95paXXuisLK+e4Fx2BI/I0bGXkOc
 bw6ImgXXA4aDbSTRZ12keof1pCCu9d6MNvplwpAiWWaWxAtdzvEC6uGKL
 MSxYOneHaFkM2XDw3BmCW36U9G+H2jjrZk5fpTYP6AT8bBcrUAGwDfbU2
 LTgelecRLoajgZB7dNnQ4CuR+ZqbIcsYJHf1ZRnb0/K/UzeMeYi6/0nPf
 Y2F0C0ASXquh+Rk1DDweQcLn+UAW7tnbbybsXuTWap0yIWEvs7YhpKsgy
 qVYZsnyDYkAKpAWAUG5XRUyOU2wWuwvsIWUD1MwALqWxZkldd7FJryXBA w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="361110721"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="361110721"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 21:44:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="814717153"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="814717153"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 21:44:10 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 21:44:10 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 21:44:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 21:44:10 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 21:44:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VMmm1g+eelDFJRFe0mu509gLV9yM9VmU3/BvbzD4fYrkfRPjFqP/OPbRmlAp+hdeETv1CdiEJfOYZR2tZYoQmtnFRWi0piJU0nMFHFXVVcK1McElGs4ysd+rO1i50UmvFd04uXCtYwPBhdd1nKNkvZ4IlRSjxlG5aIAwlW50p9IADky2Haq/LknjcDJs3o2o4HBfgjjlBYTCygIxV2gZtfVqOaHupw6m/MW6eoo/hMw6ITvuEiP0Oj3Hh4fHgQjfTQr6wN5cSrKZ9MqpdHFmWVAodickFu8ooLP3aekhEapWCslXrl/pV2ErcdXz7IuNiRjX9f6tKEIPvfqRmmiK7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjOUw8Z5/D4aS4TFbQEJi7XAaKqNf857GX6MPTXl7co=;
 b=MbbI305n40QkonhOm10XsBvQrxZMVD3su8y6hngTPUSBJR1cFclIDeBWkzOSzlKYJxXy6DVVQTbxU8e4wYiJY+1lJ8Jca8W1JoHRTygijN9nkhRiNUUQW03VSizhfy7M5XD0uy3v0TMgd2uAG41wFGRAJVvcmIicnVLrKiUkgRZ9krEHn+ckXcSfjlSUcvEm7CurccsgSol23JUCu1716xNp07z5eqk7a4z/qXuYW8QlR8De0Jh11fzFfjjsIcm6/UiYzAO+YX/viUrbTvlURwHSyBd6P1XdeyFcJILhazi8vg+8o6/QYSQq+cHVLVcge2Bx1dCTrk9zu+ktH/VLCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by DM4PR11MB5360.namprd11.prod.outlook.com (2603:10b6:5:397::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 04:44:07 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::547b:6763:164a:4283]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::547b:6763:164a:4283%5]) with mapi id 15.20.6813.024; Wed, 27 Sep 2023
 04:44:07 +0000
Message-ID: <7af74032-44bb-179f-b5c7-e20ed566be28@intel.com>
Date: Wed, 27 Sep 2023 10:13:55 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
Subject: Re: [PATCH 5/6] drm/i915: Add stable memory region names
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20230922134700.235039-1-tvrtko.ursulin@linux.intel.com>
 <20230922134700.235039-6-tvrtko.ursulin@linux.intel.com>
 <4530159c-d3c6-533f-9e4b-f50dba6ffea2@intel.com>
 <d7a022e9-411c-043b-fe71-b056f88176ff@linux.intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <d7a022e9-411c-043b-fe71-b056f88176ff@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0165.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::9) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|DM4PR11MB5360:EE_
X-MS-Office365-Filtering-Correlation-Id: a7bfcac4-afe8-4d0f-3d05-08dbbf1461f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BHK30kGgu1u/MkScXvyr7LVNjx/bMds0CIwIu2YnxEkBdQFgiycUx5XICWb2keFrTI7lSrH5IIACAqM1YUMjVVu+Uh0jMiUaLcWfU/o78UI5vLpT7Nthb2eh9Kp5WvkwfiKwHf9foJAEtu/68la1X8jEhPA5uErtBDXEWPZXFRFAjyEHg3jVC2WC+QXUn0Pt6GRozoz0b85xnbLDSnplOz8/I0M81DmVhAMITIUHH8Y9DSWq3Nl99NjDgymg//mfJJVFzJjpmPqgOieBI6A/oQ6g8bmuwQVJMn75jPm7xAPl0UtOWauc/gA6Ua86A5ONntv80IbT6lRrl+eQJONgjzMvfEJW9x9NCwg2jm3Rc365aOqbycj0qhlEKuGFSF5JNc4MqyFMqV6YtgOnSRZ6y2lCryST4M9rOexvojl5aWOjSnL6+CGaBIiCajtG08COhxbhp9QrvaESnl4bMYklSfh65bNSWBiu3e+pw5U6h8j6aCVlIZ/WAVJcQOKQOHrm94ZNsTTpDQPyF+Y1RdPoKx7uBbedXbGOg3vnYbtWFenP01ay8ojbzrwHgDRkvd+mawdGLilT8dLL3DHdBOVDb92StR87GuAQ6gd5GYRGoBSuhM7UXKOifzk6wirvFhBjMI6qeh37zs2986LSk/SQeA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(39860400002)(366004)(136003)(376002)(230922051799003)(451199024)(186009)(1800799009)(31686004)(53546011)(6506007)(6666004)(478600001)(6486002)(38100700002)(82960400001)(31696002)(83380400001)(41300700001)(36756003)(2616005)(26005)(6512007)(2906002)(86362001)(66476007)(66556008)(66946007)(5660300002)(8676002)(316002)(8936002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3BES1VlczZlMUtKTzBNbWpGaDNxSGE1S25xZUg3MlNaWGlTUTFrSjJsb2x0?=
 =?utf-8?B?TVIyOXpCaEpsQ05VZkpuaitjQmFwZkRoZk5WNWxGV0Z1R0xtdDJxVWtIMENs?=
 =?utf-8?B?QWc5M05EdkZ3Y1N6RUdtdWNWdnN3SjZDaGE4ems2WEwzSmE1dlFER2EwRTV5?=
 =?utf-8?B?V0YycFVPWEFWQVFySkRtWG12eksxQXRodkNmei8rd3d4QnlMMlh2U2ovTkdX?=
 =?utf-8?B?OWRtU09BYjlHWCtqYnVNaVVGeFhFUTFuU1JTK2lQaU51b2ZqZ0MxbHVYVHEr?=
 =?utf-8?B?eVN5SW5kQ2VTcGtNSFJnNmRuMWlnTU1IeGNNMDdlTStXNUhORGZROXRSMUw0?=
 =?utf-8?B?eDBuQVlDdnMvc1RtdkdCRjZ5RDRrM2hzc1dLQVUzUHZkNThJVXNmbFhFcnV5?=
 =?utf-8?B?QmZaeVFyb2NhY1c1MXNLM1NoZXdQbXhzMDVneXIwR0czRW9FOW5wTndsbnRv?=
 =?utf-8?B?bkxjWkxuZzBZcmRpdE1oRTVmNUYrWTlRcXlnQkdwaXhPUm5udmFGWnh3YnJu?=
 =?utf-8?B?RFFKUFZkTno0b3RJdFpZL211QU42Z2o5ekgxRTVSQjQzL1JOYzJmd2tqdk4z?=
 =?utf-8?B?K1BhNFp2WGUvMDhHd0tWdUMzR0ZDek5yNU0wS0tIMUFrTmhCWUxGSlZ1QXo4?=
 =?utf-8?B?Y0tWd3R0RGVKZnJmWlM5azlpL05kTnNLSVhFbmxoYXR5WEpVaUVGRmw4dWYy?=
 =?utf-8?B?dU5sWllmRncrR2lPdm4zck40dE5IaitRQmdDVFhSTkFnQms5VklkZWwyWWhr?=
 =?utf-8?B?N1VqREY2MnVVWTlCVGJObmQxanhnSElQREpEMjV4emcxcFpIb2hpRG83REtP?=
 =?utf-8?B?UDdDQ0RUSlV0VFVVSytKS254ZXppcVNnUzM5QXFWbjlLRHhLUGd0VXppS3Qw?=
 =?utf-8?B?RHN4c0x0UzZVYXJEY1VhZXdwVmZLcjdGVnV2NERPZ050RHMwa2E1Zm1Vb3RL?=
 =?utf-8?B?ZnBUWUNBclpNdDFXN3AwZFpLaHo3eDQ4bEt0d3l1b2dmVzlFOE82OVV1cndu?=
 =?utf-8?B?VE9ZVkRWWTV6QVhCVHRzYUN5ZlZRTm5YQjhJam02UklzUDZwNzE0Z2pUa1hq?=
 =?utf-8?B?b3BGMEt4b0VQSUdON0tWc1E5RENtSlBwUzBXbUQvSzBrUFB1MWlxZXBRdHFr?=
 =?utf-8?B?SmtBVGgzL1oxQnArNE0wNmh2MkVrSGlYS1VEU1hlMmxqT1U5enkvR1B2UEFa?=
 =?utf-8?B?T1N5dXpwL1hPNHp0aVNPNUtLRkFaQkFFZE5SS2Y5Zm8vRmVWTkZVOEdoeXNo?=
 =?utf-8?B?V2dnZTU4SlZaUU1mOWg0TUdCaXowdmJndFB4WGg1ZkRabU0yUGZyUkdqYXlG?=
 =?utf-8?B?QTVlWmpZYlVEOEdldXZDdlRMc294T2JLQnZUNmRvUjJSczdwRXhUckRXSnlj?=
 =?utf-8?B?dFJtaVFSWUJYVjd0OUNQMXlsMXVCbzE0NDFBOC8rVEQ4MzVQeS92VnNJVVYw?=
 =?utf-8?B?dVZIdkljK0NEdm1rVk9MZkR0MXBKcVZyRVpIYmRPcE5yQ01mT0lRRnZERjMy?=
 =?utf-8?B?UFlFaUJ2UHJtUHhoOUxPMGFvTjIvbHljTitTbml5VkVadmkzQmhZN3lOcVhi?=
 =?utf-8?B?QisyTCtWZm9SazlCZkhrdExDL1kxZ0hkVDdMMnNrNTVLSEV3Y2hZaW1RNUhN?=
 =?utf-8?B?NXFKN3hIRVBEaG1GSEZkVHBjQkF4ZXcxT3cwR1l5RFpXbEdmR3ViK2JPUXdv?=
 =?utf-8?B?Q3pVYURmZXhQaWRJdGhLSWx0Nkd5emlMUFRTa2RDa2hFN2FQQTJhSjNUeENQ?=
 =?utf-8?B?ZnNsNDJtbUFQWG5oVWJVTFU2Um9lVmZmMzYyOS9UeDIrMDI0QXhieDRFRm11?=
 =?utf-8?B?K1Fza3BlVndlTG9NYmVFSkJTajNqZ2RoQjdnVHREUE91K2JYUG96MDN0VHR6?=
 =?utf-8?B?bDk0RGpEVit6VnkraEVJQ3p1SWwxeCt4a0JPL0NwZmh4MWt4bTFESzZTZUlm?=
 =?utf-8?B?VmQ2b2lvL1FJMjlMYUtUd0JQOHhZaTFwUWZmakdsMmEvNmNMcWJOWmFvUFBE?=
 =?utf-8?B?UnozNkZGVlZvdUMwaGk3NTg0ZmtHU1I1amdyd1BEaTBLU20zSWZCemhzZHUz?=
 =?utf-8?B?MytjKzdrc2dRT1hnQTVWWFdjalZZSXl2QzV1Z0xrSEJnaVI2ZmFKalVsZjJG?=
 =?utf-8?B?UzZNVk9qMzE5QU1XN0FoWU5OVmRYZUZmd0kxSWJhZ0kwVzFLd2RIMWMzdVdD?=
 =?utf-8?B?blE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a7bfcac4-afe8-4d0f-3d05-08dbbf1461f1
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 04:44:07.0479 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 29dJ+c0ge+PfuT3XuZ0q4C/lbFn4XIvusORF2xNa2xYYMl3HXSCZGS1xoDSQ3rbjj+Jzb6I5EU73Mv9lNbgPgqnyuIEZDq1FHAGtwSSJPiY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5360
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 26-09-2023 21:12, Tvrtko Ursulin wrote:
> 
> On 26/09/2023 16:29, Iddamsetty, Aravind wrote:
>> On 22-09-2023 19:16, Tvrtko Ursulin wrote:
>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>
>>> At the moment memory region names are a bit too varied and too
>>> inconsistent to be used for ABI purposes, like for upcoming fdinfo
>>> memory stats.
>>>
>>> System memory can be either system or system-ttm. Local memory has the
>>> instance number appended, others do not. Not only incosistent but thi
>>> kind of implementation detail is uninteresting for intended users of
>>> fdinfo memory stats.
>>>
>>> Add a stable name always formed as $type$instance. Could have chosen a
>>> different stable scheme, but I think any consistent and stable scheme
>>> should do just fine.
>>>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/intel_memory_region.c | 19 +++++++++++++++++++
>>>   drivers/gpu/drm/i915/intel_memory_region.h |  1 +
>>>   2 files changed, 20 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/intel_memory_region.c
>>> b/drivers/gpu/drm/i915/intel_memory_region.c
>>> index 3d1fdea9811d..60a03340bbd4 100644
>>> --- a/drivers/gpu/drm/i915/intel_memory_region.c
>>> +++ b/drivers/gpu/drm/i915/intel_memory_region.c
>>> @@ -216,6 +216,22 @@ static int intel_memory_region_memtest(struct
>>> intel_memory_region *mem,
>>>       return err;
>>>   }
>>>   +static const char *region_type_str(u16 type)
>>> +{
>>> +    switch (type) {
>>> +    case INTEL_MEMORY_SYSTEM:
>>> +        return "system";
>>> +    case INTEL_MEMORY_LOCAL:
>>> +        return "local";
>>> +    case INTEL_MEMORY_STOLEN_LOCAL:
>>> +        return "stolen-local";
>>> +    case INTEL_MEMORY_STOLEN_SYSTEM:
>>> +        return "stolen-system";
>>> +    default:
>>> +        return "unknown";
>>> +    }
>>> +}
>>> +
>>>   struct intel_memory_region *
>>>   intel_memory_region_create(struct drm_i915_private *i915,
>>>                  resource_size_t start,
>>> @@ -244,6 +260,9 @@ intel_memory_region_create(struct
>>> drm_i915_private *i915,
>>>       mem->type = type;
>>>       mem->instance = instance;
>>>   +    snprintf(mem->uabi_name, sizeof(mem->uabi_name), "%s%u",
>>> +         region_type_str(type), instance);
>>> +
>>>       mutex_init(&mem->objects.lock);
>>>       INIT_LIST_HEAD(&mem->objects.list);
>>>   diff --git a/drivers/gpu/drm/i915/intel_memory_region.h
>>> b/drivers/gpu/drm/i915/intel_memory_region.h
>>> index 2953ed5c3248..9ba36454e51b 100644
>>> --- a/drivers/gpu/drm/i915/intel_memory_region.h
>>> +++ b/drivers/gpu/drm/i915/intel_memory_region.h
>>> @@ -80,6 +80,7 @@ struct intel_memory_region {
>>>       u16 instance;
>>>       enum intel_region_id id;
>>>       char name[16];
>>> +    char uabi_name[16];
>>
>> Just a thought instead of creating a new field, can't we derive this
>> with name and instance?
> 
> I'd rather not snprintf on every fdinfo read - for every pid and every
> drm fd versus 2-3 strings kept around.

ya agreed makes no sense.
> 
> I did briefly wonder if mr->name could be dropped, that is renamed to
> mr->uabi_name, but I guess there is some value to print the internal
> name in some log messages, to leave a trace of what underlying
> implementation is used. Although I am not too sure about the value of
> that either since it is implied from the kernel version.
> 
> Then on top the usage in i915_gem_create/repr_name I could replace with
> mr->uabi_name and simplify. If there is any value in printing the name
> there, versus just uabi type:instance integers. Dunno. All I know is
> fdinfo should have stable names and not confuse with implementation
> details so I need something..

Ok. LGTM

Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>

Thanks,
Aravind.
> 
> Regards,
> 
> Tvrtko
