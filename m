Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0977C6684CF
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 21:59:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A8210E92A;
	Thu, 12 Jan 2023 20:59:38 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E908910E928;
 Thu, 12 Jan 2023 20:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673557175; x=1705093175;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=o8IQnvPbHP5XoiYxYr+lhFtTU027SxOE2qS+aFyN/lE=;
 b=LuUFptiNW0gTvvdx+4NNp2FssByc3sqoWvEY+jE8Dp0k6zhHIj/J+sAy
 H5FElBvQjP5zndFNXJ66H7KCPYQhXfPusOmzddh25b+E0j3zKXSrzRL7F
 xEFsScyyhJTPiMQL87TxIQjNTYpSPve0BB3YePqOkKnKDF3RxarpfuzgL
 i1MLvVCDsM/O7MLV/9VgpjDjH62F5MjUtHALhRW+AgRPgagtvv4qFmJXP
 4+hUQ9Rr+oTR3nARUZiyAf9HEXqcWZIGfrGOs9ZuTVlOM3zCt+VOWFCKH
 JsHC3BG6CemFx6COw8gXZBoA3MIbYy65qM6HJBzVJmTWrp151FPPTfs/h A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="322522881"
X-IronPort-AV: E=Sophos;i="5.97,212,1669104000"; d="scan'208";a="322522881"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 12:59:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="831837139"
X-IronPort-AV: E=Sophos;i="5.97,212,1669104000"; d="scan'208";a="831837139"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP; 12 Jan 2023 12:59:34 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 12 Jan 2023 12:59:34 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 12 Jan 2023 12:59:34 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 12 Jan 2023 12:59:34 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 12 Jan 2023 12:59:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UAWLwP1fzVD8kWQBTCgbETuChdEdyK+s8KcP+zIsdv9VRR9GDos1vTH/Pwhxn65N+goPUeu9nYq1WLKKO6L4CeX/BIaoL6mf1eme7HWRymHOIpG7PjhMPy+NwnfCL083UMFIBR++OUxsD+rgFvcZO6ue1C3QtRmn2ZxCUr2mhWRuUt3+nU3KHe5mzhGDEft25PpLS9zKbEbfn+0zEHJdDvHwEIQRW59xa8tcfY8gPfq4NZsVKpBr0HsteafEVUY6CxcV+8M/Mk0Scvac7R+K9dBWLLoFsI0Oy1ATO3yWjT6IICuO7a9y84zBKx0xNh8NGSUgh4dLI7IDwyDSVcqrbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jj4G+aHpOynIw0A7D44JfDJg+YFSfz3Cs8afqE11pzE=;
 b=icikimo4nvC4Jj+XDYh7sxaJvaGsmeV0CDShZyXdjQ+fr9Ax0gTeV9Q3s2Zk4jSm5lrxlfARarrtgFVNkM7lKnY6HG9qqJOe1wyAHNueNTlj+7/u2unsMoEoBIezizHPf61g59Zt7nsuPhvHV6wHAEuJ7yuY6lO4RGZ3VMjD55k36SIaD4joaw1KnQyKcf7Yqzd3ul0PMF+PDofp1i+T9oAhd3fHxf1z4S/ovKe9ZFLHCqP32cvxcRPbwbme2LNXSvdqEocvyB7Nx14IRF9KTf+GdBHrV/05gFg7kD037AAymVzZHxhUQ7myd46tC1IjRDDLy73mYjZ2vAAeR1hrxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by DM8PR11MB5574.namprd11.prod.outlook.com (2603:10b6:8:39::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 20:59:32 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::ec2f:4a87:326b:2610]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::ec2f:4a87:326b:2610%7]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 20:59:32 +0000
Message-ID: <8531ce98-78af-d818-b5bb-0af753a026d3@intel.com>
Date: Thu, 12 Jan 2023 12:59:30 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH 3/4] drm/i915/guc: Look for a guilty context
 when an engine reset fails
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230112025311.2577084-1-John.C.Harrison@Intel.com>
 <20230112025311.2577084-4-John.C.Harrison@Intel.com>
 <393edad8-fa78-4b28-46ac-86da56d03de0@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <393edad8-fa78-4b28-46ac-86da56d03de0@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0188.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::13) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|DM8PR11MB5574:EE_
X-MS-Office365-Filtering-Correlation-Id: de4a04b5-dc00-4695-e37f-08daf4dfe747
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4sjm4UR/TZUipmlBTVRiwTKM+vrSSTQaCHmRU6EO0uDuaMkb1sQrzMz/FoPLEDz6hc2D/pucFGZmVUJCnQgCHFpgo4BHSGBmegTEelhyOYiwdE3giwjh/V6sOztpUvhRQtfHH6fn93VBKuHOM+FwR51Z9WE1e+Ymq4EpCxdW0Km98r6k6J546pt1LvVMChJOwI5nE8BkiN/oltM4S6kGaATVhwXrUztcqrBafkMKeSxb9nE3dZweSqTMMxQkDURVZf5AU3p2rVaf/Lut0qUz4knTfKAO/jBkqmSm8X7q1O8xPcsCIh3UrjYwEpCUA9woccqlyMqRofduUdz7u0fR9zwu3k6Q8j5tykOKtW3CiC+KZVHifAHAc4eoBOpHldJlUUd11/lFZDLbUgmIbe1rRY7Steywk8k+YZOVPA53KI7m2hTX8y3nqGyzzmol3eJmefASVD4Ic/s8oEE0zhCGqry029dFaL7k8rgc7ZWRNgG6kU78qPdQONegPoT8OdVyFpK2P+mSW3octpK62u+mASNUVA9nmtYqFUSTl0h0UC7qOIjrgdhm2oWZeV7ZSwG/ZxhynwHNx/ASNiGUJs7lvCqhXAHD2z6KftlyWJcZhcOfAvo/QNRmP1HBLuvDMrnD0yvkYJHGipyrn/6TvE5E1XfyF38ZhMRs0jdtnhLtIngOdrB8NLZyklNMQavjRriCmeWnckDMkZA/vGqD97LW/bYbqAWr5iQRk0Wf2H58DGk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(346002)(39860400002)(136003)(366004)(376002)(451199015)(6506007)(38100700002)(82960400001)(31686004)(53546011)(2906002)(478600001)(6486002)(2616005)(86362001)(26005)(6512007)(186003)(5660300002)(316002)(83380400001)(8936002)(36756003)(8676002)(41300700001)(31696002)(66946007)(66556008)(66476007)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0RocFJMRWJ6SFZHeEkwK0phUHBYS1NaZDRHbXl5TkJVck1sMzdaZ2RzVTdJ?=
 =?utf-8?B?T0pmNmMrcHBrQlJMWVVWWm85VDVEdWZWVEE2dWY0cUlzMzJTYS9QbjRHZ3JD?=
 =?utf-8?B?aEhmN0gwRnYyY1BYRkJCWnJ5OEdwV3ErQTg2d2ovY3A0N0FqdDNnSVQwNjkv?=
 =?utf-8?B?S3NrZlN1NjBONTJvbmZlcWFWR0hmWkd2TTdnWlZyRytxdXVqd3p2dk1aYXdC?=
 =?utf-8?B?QVNCdUV0Zlg5bEFSR01XTVJweVArNVJTYUp1RHVJNXBOS3NUcEp5NmhzK0ds?=
 =?utf-8?B?TEttSkc2OEdTTE95K29YSkNmU2pOUTZ5Uyt3NkkzZkFPaW9KWEhSQk4zK3Y0?=
 =?utf-8?B?aUtESzJxMUcwTGtuWHl2MGsvMnRySVp6QXp1UHVkeDBucHExTUJieit1MHhQ?=
 =?utf-8?B?dXRaSC9uQUtQdHF4QlMwcko3emtsM0txalJTT21PSlV6QzltODZ0dGpDbUwz?=
 =?utf-8?B?NE5CQW5iWEU3MFlKNzJQbXlJV2h2V1BIakVDQTkxRFdHSDdvTWMySXFHeGdW?=
 =?utf-8?B?cSt5WjVmekFaVG1XbVJ2MlZYNEJyL0NKVUVOYWZxR0g2MzQ1ZjlIV1YwME85?=
 =?utf-8?B?NkttbmZpSzU3L0NjTFVEV0dlUEdZZXhPNE9HK0wwNDRXNnVmbTk1L3ZVTzNK?=
 =?utf-8?B?WEh5ckwrM1hyaVpabkp3NThIMTVrSWZpT3JOazlBWldHcHowUEx1QWQ5aGds?=
 =?utf-8?B?MzFuR0JvcVE4bWR5RGE5cTdiUjVIbFB3anA1eE9RWWpPTS9VaHV2QW9DckVh?=
 =?utf-8?B?MlFnZmR6UzhTb1o1RDNqZXBDTmZKaUVPbThVRDRDRWhDMEFCd1JiaFdGT2ZY?=
 =?utf-8?B?NThaalBEc2VoOWlIc1Z5TXpnWEpzUmtLc3V0TWpaeGFHNWpqZzR2dlN0M0Q0?=
 =?utf-8?B?SFBwUVVpdlE0RG9vY2NJQ1RMWGo5QWtFeldIZE1EdkF1TjNCYnMzcjlmZGsx?=
 =?utf-8?B?ZUN4eDUwMDJCTTdhb0Zwd1F6WlhqN3o4UnlzNER6Z1dRODlhSXp5bGh3alMz?=
 =?utf-8?B?eHYxQVNzcURPVktvYnh5VjU0UzlwWks2dWhYMVlWSW1DQy84ME84L1RXTzJJ?=
 =?utf-8?B?UmdEV09sQjNSSDZ4c1ROQVJuQjFybmtMS2c4OXJicldmc3AveXk5TExQdlF1?=
 =?utf-8?B?RDEvWndFVFVoV1puNkRPOWQwR2ZHMnk2c1AzU1FscTJyRWh3a0JCOVpjRDV5?=
 =?utf-8?B?R2g3YVRwZGRkbnBrYmZMdDlzWWswS21NM1B0M2JEdzhhZmFUMnZTemIvSTlW?=
 =?utf-8?B?Zm10KzZnWC9UQnhIVmlKVFcxTFYxY1A0RzVRMzN6RU1NMko5N1VyRHhXNjRY?=
 =?utf-8?B?ZEx5c3dWZ1JUTTcyZzJvTTBQaWhwc0pxQ3g5V28rTE9kTDY3YlJJOG54ME0y?=
 =?utf-8?B?T1VURzRIY3JueXJ0Y21WVGFKeDZzYllHdm1zY3p3MHNPRFl6Y0Z1RTZGdGcv?=
 =?utf-8?B?bGx0c3VpSUNaWG83bWI1bllFNlRjZzhkWWJCOHBBZytIYS90bGpNM2xnQzR5?=
 =?utf-8?B?UWUvZGJUUmVmUDVjOE1DRWtXNGYwNW9kWldLaUFYQitJTk10anJPbE16WjRS?=
 =?utf-8?B?bGRnUGU5RlFKK3BEcVNTQ05uVkprTmtyMFhpM2x6OThId1BJbmpkM0gwQmdu?=
 =?utf-8?B?eFJCVzJ3MHBvYWJrSmlRSndyTmtGKzZZaEpPMDlMYTJmRDBvRk9YVm9wcWJ4?=
 =?utf-8?B?Wjd6dmtyVW9PS1dBUGpEbE1wTmNHcVhBQXVQSzk5SFpCWDdZOGRNWlZha2xY?=
 =?utf-8?B?S3JlWStiSWlIZHNLUVltSENQNi9LcWpxL08yWEZmWWJnNWV5YlVFblVYdGF4?=
 =?utf-8?B?NkJYNTNsYk5FV28xNU5rcmJVeFM4WGFlM1pRM211SFd1NHA4S2l1Tlpqb2NC?=
 =?utf-8?B?elcrZytrVnljMFJVcXBNaDBvOHBtcnJUM3JUTVRadTRHZUwvNkc2aEhkdXh0?=
 =?utf-8?B?ZXlteDJ0Tm9qOXVKMWtoN0k4UFNWZC9Jc0ZzeFN4QmhUSzZXWTBiQWpvK2w4?=
 =?utf-8?B?T0QwNmV2aEMzWmdRcXVzYVdkL1ZHOXZHZXZ3dXZudzdwemUvTWk0YmdRYXVL?=
 =?utf-8?B?cTdUY3lpcDI2TUw3eU9QcXU2ZXpvNTJhWVBBeTBBSDJqM0lZMFlXMS8yRmlR?=
 =?utf-8?B?azZvdTJUdmZOeFlKaFAyMjlVbmpIWHVxY2R1QWtnZnJzSGVzMVZHdUYxdUk2?=
 =?utf-8?B?TWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de4a04b5-dc00-4695-e37f-08daf4dfe747
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 20:59:32.3197 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tGuszC7Kvj0yOYwI7SuE2bs5PEXjFmMQiajMcYDYWIlD/kmy4Cod5szi6bAqIBR1bLj+j1luyWZkEydxjuu91VbiTaqx2bQQ8jLcbgiXQS8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5574
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/12/2023 02:15, Tvrtko Ursulin wrote:
> On 12/01/2023 02:53, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> Engine resets are supposed to never fail. But in the case when one
>> does (due to unknown reasons that normally come down to a missing
>> w/a), it is useful to get as much information out of the system as
>> possible. Given that the GuC effectively dies on such a situation, it
>> is not possible to get a guilty context notification back. So do a
>> manual search instead. Given that GuC is dead, this is safe because
>> GuC won't be changing the engine state asynchronously.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c   | 17 +++++++++++++++--
>>   1 file changed, 15 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> index b436dd7f12e42..99d09e3394597 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> @@ -4754,11 +4754,24 @@ static void reset_fail_worker_func(struct 
>> work_struct *w)
>>       guc->submission_state.reset_fail_mask = 0;
>>       spin_unlock_irqrestore(&guc->submission_state.lock, flags);
>>   -    if (likely(reset_fail_mask))
>> +    if (likely(reset_fail_mask)) {
>> +        struct intel_engine_cs *engine;
>> +        enum intel_engine_id id;
>> +
>> +        /*
>> +         * GuC is toast at this point - it dead loops after sending 
>> the failed
>> +         * reset notification. So need to manually determine the 
>> guilty context.
>> +         * Note that it should be safe/reliable to do this here 
>> because the GuC
>> +         * is toast and will not be scheduling behind the KMD's back.
>> +         */
>> +        for_each_engine_masked(engine, gt, reset_fail_mask, id)
>> +            intel_guc_find_hung_context(engine);
>> +
>>           intel_gt_handle_error(gt, reset_fail_mask,
>>                         I915_ERROR_CAPTURE,
>> -                      "GuC failed to reset engine mask=0x%x\n",
>> +                      "GuC failed to reset engine mask=0x%x",
>>                         reset_fail_mask);
>> +    }
>>   }
>>     int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
>
> This one I don't feel "at home" enough to r-b. Just a question - can 
> we be sure at this point that GuC is 100% stuck and there isn't a 
> chance it somehow comes alive and starts running in parallel (being 
> driven in parallel by a different "thread" in i915), interfering with 
> the assumption made in the comment?
The GuC API definition for the engine reset failure notification is that 
GuC will dead loop itself after sending - to quote "This is a 
catastrophic failure that requires a full GT reset, or FLR to recover.". 
So yes, GuC is 100% stuck and is not going to self recover. Guaranteed. 
If that changes in the future then that would be a backwards breaking 
API change and would require a corresponding driver update to go with 
supporting the new GuC firmware version.

There is the potential for a GT reset to maybe occur in parallel and 
resurrect the GuC that way. Not sure how that could happen though. The 
heartbeat timeout is significantly longer than the GuC's pre-emption 
timeout + engine reset timeout. That just leaves manual resets from the 
user or maybe from a selftest. If the user is manually poking reset 
debugfs files then it is already known that all bets are off in terms of 
getting an accurate error capture. And if a selftest is triggering GT 
resets in parallel with engine resets then either it is a broken test or 
it is attempting to test an evil corner case in which it is expected 
that error capture results will be unreliable. Having said all that, 
given that the submission_state lock is held here, such a GT reset would 
not get very far in bring the GuC back up anyway. Certainly, it would 
not be able to get as far as submitting new work and thus potentially 
changing the engine state.

So yes, if multiple impossible events occur back to back then the error 
capture may be wonky. Where wonky means a potentially innocent 
context/request gets blamed for breaking the hardware. Oh dear. I can 
live with that.

John.


>
> Regards,
>
> Tvrtko

