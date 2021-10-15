Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9B342F71B
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 17:43:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 252C789B96;
	Fri, 15 Oct 2021 15:43:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA58689B67;
 Fri, 15 Oct 2021 15:43:22 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10138"; a="227826237"
X-IronPort-AV: E=Sophos;i="5.85,376,1624345200"; d="scan'208";a="227826237"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 08:43:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,376,1624345200"; d="scan'208";a="564357778"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 15 Oct 2021 08:43:02 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 15 Oct 2021 08:43:02 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Fri, 15 Oct 2021 08:43:02 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Fri, 15 Oct 2021 08:43:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ct1GwQXRsPjOWqb0PoQKfeb6R5UHXT3jQvZcIuwaq+kWp47nElAqhI3pYHzQkCPb8wTr0p1vM4W2OjgQ0gJm6QdfmTUEB/+ElDqc+gGCfXRkb7bKpjascZ/uXLMcbHV2SMc6zj2aygNH2+IrqefgbDTNcE11OgpBjF579qgmIVh6fdhMe6ZWk+fcA4QqWUbck3GaL+88A5PWvdXrqEB3yyMixO4j9p8UwI2YqnDKeDkAWdf/VAKigeM+izjX92rXWADwq2v77oGVK35pMYDEjfZBu7wHAAPL7nuG1Kx4Caar8fFB5XKCqWkJGPynyE+GHdZz8/yVUbl/ErpLRFQdjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I7BdVyxfc2zxEUCmBLB2e3OZsPU8GhMD0jfMcqdKulM=;
 b=N9Q+AGleDwL357kA5r1LUHmojf6uHhplypY2ZBaQT3C6ZgGbAdFW4balP188q7sgDL0P0rtrcgZ/ax6xY1yk8tcSGEvsYNURxDxxOAVRR/JcaTaVM4zrocUJidvwh8o6RTXivQ/qJc9NdDWnBiCi4UTV297PPdiFpCniTE9h7MS9D/ehom3XjRNqJmpTRjzcDCkdNhycMlBcycsKcIaeulh/NUM2HsLQEVD8B8SBdppMXf3drKYpN+GY6GU0erfQo1bWxD3/0jVX3MKg1szn2BA+NGBBiTFshwQebdPNFH18gXFXSEWLYJcECWwM8pxcfRpIhqnhdPQD0TtYL7El4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I7BdVyxfc2zxEUCmBLB2e3OZsPU8GhMD0jfMcqdKulM=;
 b=gCswQeKydlDFmCp+V7exwQ22vC2sDdFqJrNhxMbCvl0FrZoq9qbylpfE/a3dTCBRaEzi5F9hTUVdpAyRYaHLFY86N1MCbQL+cUHOEPhkEcovS5whol3+Kn6dOnsZ7aNMgfSD1DZUbc6Ez1X0f7Ijmwiwx/NsP/OXWLbQKJJGMbo=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5577.namprd11.prod.outlook.com (2603:10b6:510:eb::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Fri, 15 Oct
 2021 15:42:59 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%8]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 15:42:59 +0000
Subject: Re: [Intel-gfx] [PATCH] drm/i915: fix blank screen booting crashes
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210922015039.26411-1-matthew.brost@intel.com>
 <YU3Bq+XLVeRTIS4c@intel.com> <87pmsl2qdk.fsf@intel.com>
 <96f4f4e3-e5ac-fca8-44ed-bee0a6fe67e7@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <6baae64b-e0c3-c7bb-ba69-dcdd2b771987@intel.com>
Date: Fri, 15 Oct 2021 08:42:56 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <96f4f4e3-e5ac-fca8-44ed-bee0a6fe67e7@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: MW4PR03CA0321.namprd03.prod.outlook.com
 (2603:10b6:303:dd::26) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 MW4PR03CA0321.namprd03.prod.outlook.com (2603:10b6:303:dd::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 15:42:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c0ffd83-582e-45d8-1b1f-08d98ff276d9
X-MS-TrafficTypeDiagnostic: PH0PR11MB5577:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB55773B4790C2D70A944B9F78BDB99@PH0PR11MB5577.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:397;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uzmiguOVPWqBWYGCc80bedq//8/yB3oIU5xt+kHeNpI/hZcb8dfFyc8zhjJqlrIb6dPoi15ubhdxs6lJ/CcGTDvO58M7Xvno8irEXg1RkukHTjfbGKbOOnwmedoxyaTIOFgrEN816oZr0NSbdh+F7hA/PUTc6ABKTeEPO6P93B6dhPzBz6WYM94LiIuxLZ9fgn/SvMrqmpOEucTn8hCRnvA7SOpXYUY+XTp6d1cQWV/0eep5VcaUelFNeovXPV9FU5Lx+YQ2V1rrltyITRnAYTfT2EGcLCO6hA0Hp/07SRaw8f+lBTaPgZKcG6qU6fHdI84tLefMhdSdKL0xIUle6HHaVJSfJmeFzSXw0k1WJ3aFB7S9geJurgfmsvIQRnW+BnboNzGz6dVqxmGyfl166XIei5Nqol7+lzUJxstaYiZkLZj7m/4FRGzBOqfWeCYX5Ql57P8avNrt2+zlgJvHgvzja0udHPZbPXYmGdWcqfaPOCRc3SDQo2kdu5zwsY0hgZ6nTWTMOnESLKR5GCKOTRIWdoRuCYOfi6jSVnEtOIRWVT0EQ/CGUhKFsUxDpC+kUcV+WdnXoR43L/3bkE2TVtFZuspgzVi732eQo1DoIay/0jDzWHD+XhW+Pm8Gqi1Whqyf72GBrKORVpnuSoVQftXDjEFEeudjolBwqp8gjBk9AqA7EUN49EouDN8TOYszNthcDb3MpEP+XB2p+QrZNfF9GKlqLuwddZctMgrvwd78vjAaOlSVorznz0AjgF0cJKK9aH6CWfxMIsVLhUl2px9Y0RHMwgKCXmFtXLVoFdiI95ofZMncZ6Iq+9oYeHvj/pW4GEQzSq99dnas4L1eTQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(66476007)(8936002)(86362001)(66556008)(966005)(16576012)(316002)(26005)(66574015)(45080400002)(6636002)(53546011)(6486002)(5660300002)(110136005)(186003)(8676002)(508600001)(2616005)(30864003)(2906002)(83380400001)(31686004)(956004)(36756003)(4326008)(38100700002)(31696002)(82960400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnlYVG9VZHgwUHhVSThNQmFlUkdLeDYrb2trUkVrdG9nWGNFSWwwaEx1RXZN?=
 =?utf-8?B?a3JOQ2hkT3hLaHNnZ01vU1JZcVVyZE5CSUZZdjZ4TW1PYjJ1c3hwbmxBMmcz?=
 =?utf-8?B?UDU0Y3d3QlJiTWxHcXlMMXNNOVlydklKMEpTc28yUHk1NTZCNUwwRmI1VXJa?=
 =?utf-8?B?eUpKWXpMQUhJMkk0TDdkZUhhd3R0Nm9HQ3IvY0VEaFNDTDYwSWZ2dzlaQ1Bj?=
 =?utf-8?B?VDQwU3VaVktUQmdNUFdVMFI2Wnc3dUpWMVJOaHJJckdhUVNhK09GZVlaNXUy?=
 =?utf-8?B?Z2V2Mnk0U2ZRSHFJMHlyWnZjMXRlbnVlTzl3N25lMFYxdFAweFM2NHZoRnpw?=
 =?utf-8?B?TTlWc21KbUp3U3BxYitvUkRCaTUzMlpsNktQVlNLQ3NYUXFDcVlrNlpZS2p2?=
 =?utf-8?B?SG91a1NTRElHeFc0UEJqUkVuVjM3YWFEV3dYM3J6WVhaKzBScUZ2dTdkd3BY?=
 =?utf-8?B?THgxWlgzTG9GYlFIZWVPNEk3dkFERkFmNE41YnhtYUtxK3YyeVFlWWNBaklF?=
 =?utf-8?B?WFQ4ek9LYkFYc2RzejdKWGNaWVIyQ0RRMFRqblZTUTFnZDJNOG9VQXN6Tm00?=
 =?utf-8?B?dkd3WEloREl0ejdKak0yc0tjZldDdEE0cFpEaXJ1WWl2eXNONTlPck51MGhC?=
 =?utf-8?B?dEZOMDVSL1JYVEVOZHBJMG01UDBUVXZDQzZqWmxXQ0V3blFyTExTdXcxcXha?=
 =?utf-8?B?WU04Uk10M25UeWtZVWs3L3NLOEV4ZDU0Ulczb2xkeVRkZFFDOVF2THpjU0Z3?=
 =?utf-8?B?bzBtS3NqUzRKOXF6V1NKR3N6dG9QUDRpZjZPUjVBNnJtb3dzQTFNNGxUbzU4?=
 =?utf-8?B?MWFwWGFJOUNva0V1d25XVjlycm0zekJ6aXNTSnRXcCtNcm1MYVdTWENIaGM3?=
 =?utf-8?B?dGp0NERieUp5bGxNZFpqUUt1dXI1UDAycU94bEc2cFBjUXVkemZXSUZ1Sm1n?=
 =?utf-8?B?K3Z1SWxSNi9OOWIxQXIyOG50cFFTZjlidmpPNFVRM1FPVkVsN3dzVkJLMXlm?=
 =?utf-8?B?RHgrZnBzSlVvcmw2Yk1hY3NhY0ViV00yK3NiK2R2SVN1UHBua1dEQXlnRHU4?=
 =?utf-8?B?anNJcWYzTVE5OEZ5ZC96akdjcXVuTWxQUmxHUzNJdWluWk9ITGxTL2ZiMmJw?=
 =?utf-8?B?cEVRd24ySFplTG5XTXVPS2huRW41TElWZWpBRWNhK3Y2TnNKeFc3QVhZRnRT?=
 =?utf-8?B?NkFPTCt6YWVOcWtJOElGdFNwVHZCMEJ3K00xeUhBWWVrUkFSUkdrUDRSWE9r?=
 =?utf-8?B?azJDUU5wQU1MSkNWK3lxdm1RdWthOXRtU0JEYXI0QTA1bWpjUk1WQjJrZm5s?=
 =?utf-8?B?SmsvTnI1Z2JxbDRIa0dObi9JZExDN3E3WlIwa2RndjdLM1czK1VBbW8zQ0Rp?=
 =?utf-8?B?MTZjVEVHdHpicElOdHJYWXdvWEYvQVcvL0U2TkZHcC9RSHJVRm15TFA0UDg3?=
 =?utf-8?B?Z2loaVRTSkFWcWRPc3Qrb0lQMWc2SGZ3Q25ZYmxZTDhTODJLZkYyQlR3TFQr?=
 =?utf-8?B?Vk1jUVU0L0k3dnpGMUQ3SXhXZVhWUW1wZU5ld0VDSUozdzFyVllyS2hqZEJP?=
 =?utf-8?B?eC8zTHFiVmZIZ3I5d1VSTWhDSzNSbzJNMFhCMFdGa3BMZTVnQk5tT3d5WElK?=
 =?utf-8?B?RTZiR09NUkxuS1AzcDRyUTR4TWc5ZzFvUG9NZnpqdVFpV0d4Slo4b3RiWTdz?=
 =?utf-8?B?MFd5cDBWSG9NMXMvYTRSQyttQUdpUTQwcnFKbVhERGxZbXRhZnNGWk0zYThj?=
 =?utf-8?Q?CJ/V3XBAsUtbpsSegLATgf2BA3wqfOQ/+oqTWqS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c0ffd83-582e-45d8-1b1f-08d98ff276d9
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 15:42:59.0354 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: keBku7O3TN5GQqKAlBh5EOoU6u5AJGPpbnQ2/9SnDUzmhKasDzykTcIQKuHSEWjb8LtmkjitvvW8znscxcLH5fdxTuL+HxJxXztnQnRA5s4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5577
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/15/2021 07:52, Tvrtko Ursulin wrote:
> On 04/10/2021 08:36, Jani Nikula wrote:
>> On Fri, 24 Sep 2021, Ville Syrjälä <ville.syrjala@linux.intel.com> 
>> wrote:
>>> On Tue, Sep 21, 2021 at 06:50:39PM -0700, Matthew Brost wrote:
>>>> From: Hugh Dickins <hughd@google.com>
>>>>
>>>> 5.15-rc1 crashes with blank screen when booting up on two ThinkPads
>>>> using i915.  Bisections converge convincingly, but arrive at different
>>>> and surprising "culprits", none of them the actual culprit.
>>>>
>>>> netconsole (with init_netconsole() hacked to call i915_init() when
>>>> logging has started, instead of by module_init()) tells the story:
>>>>
>>>> kernel BUG at drivers/gpu/drm/i915/i915_sw_fence.c:245!
>>>> with RSI: ffffffff814d408b pointing to sw_fence_dummy_notify().
>>>> I've been building with CONFIG_CC_OPTIMIZE_FOR_SIZE=y, and that
>>>> function needs to be 4-byte aligned.
>>>>
>>>> v2:
>>>>   (Jani Nikula)
>>>>    - Change BUG_ON to WARN_ON
>>>> v3:
>>>>   (Jani / Tvrtko)
>>>>    - Short circuit __i915_sw_fence_init on WARN_ON
>>>> v4:
>>>>   (Lucas)
>>>>    - Break WARN_ON changes out in a different patch
>>>>
>>>> Fixes: 62eaf0ae217d ("drm/i915/guc: Support request cancellation")
>>>> Signed-off-by: Hugh Dickins <hughd@google.com>
>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/i915/gt/intel_context.c | 4 ++--
>>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c 
>>>> b/drivers/gpu/drm/i915/gt/intel_context.c
>>>> index ff637147b1a9..e7f78bc7ebfc 100644
>>>> --- a/drivers/gpu/drm/i915/gt/intel_context.c
>>>> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
>>>> @@ -362,8 +362,8 @@ static int __intel_context_active(struct 
>>>> i915_active *active)
>>>>       return 0;
>>>>   }
>>>>   -static int sw_fence_dummy_notify(struct i915_sw_fence *sf,
>>>> -                 enum i915_sw_fence_notify state)
>>>> +static int __i915_sw_fence_call
>>>> +sw_fence_dummy_notify(struct i915_sw_fence *sf, enum 
>>>> i915_sw_fence_notify state)
>>>>   {
>>>>       return NOTIFY_DONE;
>>>>   }
>>>
>>> This thing seems broken beyond just this alignment stuff. I'm getting
>>> this spew from DEBUG_OBJECTS all the time on a glk here:
>>
>> Nobody followed through with this, so:
>>
>> https://lore.kernel.org/r/20211002020257.34a0e882@oasis.local.home
>>
>> and
>>
>> cdc1e6e225e3 ("drm/i915: fix blank screen booting crashes")
>
> John you pushed this yesterday? Will this cause a problem now if we 
> have two commits for the same bug:
I'm thoroughly confused.

I finally got far enough down my backlog to reach this and it did not 
appear to be in the tree yet so I tried pushing it. The DIM tool gave me 
a bunch of errors that didn't seem to make any sense. It certainly gave 
me the impression that it did not actually do anything. So I gave up on 
it. But now it seems like it did actually push something? And it was 
already merged after all?

John.

>
> commit b0179f0d18dd7e6fb6b1c52c49ac21365257e97e
> Author:     Hugh Dickins <hughd@google.com>
> AuthorDate: Tue Sep 21 18:50:39 2021 -0700
> Commit:     John Harrison <John.C.Harrison@Intel.com>
> CommitDate: Thu Oct 14 18:29:01 2021 -0700
>
>     drm/i915: fix blank screen booting crashes
>
>
>
> commit cdc1e6e225e3256d56dc6648411630e71d7c776b
> Author:     Hugh Dickins <hughd@google.com>
> AuthorDate: Sat Oct 2 03:17:29 2021 -0700
> Commit:     Linus Torvalds <torvalds@linux-foundation.org>
> CommitDate: Sat Oct 2 09:39:15 2021 -0700
>
>     drm/i915: fix blank screen booting crashes
>
> Regards,
>
> Tvrtko
>
>>
>>
>> BR,
>> Jani.
>>
>>
>>>
>>> [   48.122629] ------------[ cut here ]------------
>>> [   48.122640] ODEBUG: init destroyed (active state 0) object type: 
>>> i915_sw_fence hint: sw_fence_dummy_notify+0x0/0x10 [i915]
>>> [   48.122963] WARNING: CPU: 0 PID: 815 at lib/debugobjects.c:505 
>>> debug_print_object+0x6e/0x90
>>> [   48.122976] Modules linked in: i915 i2c_algo_bit ttm 
>>> drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops 
>>> prime_numbers intel_gtt agpgart fuse nls_iso8859_1 nls_cp437 vfat 
>>> fat intel_rapl_msr wmi_bmof intel_rapl_common x86_pkg_temp_thermal 
>>> r8169 realtek mdio_devres coretemp libphy efi_pstore evdev sdhci_pci 
>>> cqhci sdhci mei_me mmc_core i2c_i801 intel_pmc_core mei led_class 
>>> wmi i2c_smbus sch_fq_codel drm ip_tables x_tables ipv6 autofs4
>>> [   48.123119] CPU: 0 PID: 815 Comm: kms_async_flips Not tainted 
>>> 5.15.0-rc2-hsw+ #131
>>> [   48.123125] Hardware name: Intel Corporation NUC7CJYH/NUC7JYB, 
>>> BIOS JYGLKCPX.86A.0027.2018.0125.1347 01/25/2018
>>> [   48.123129] RIP: 0010:debug_print_object+0x6e/0x90
>>> [   48.123137] Code: 07 08 02 83 c0 01 8b 4b 14 4c 8b 45 00 48 c7 c7 
>>> a0 19 0a 82 89 05 66 07 08 02 8b 43 10 48 8b 14 c5 c0 0d e4 81 e8 d7 
>>> 2e 3c 00 <0f> 0b 83 05 c5 c0 0c 01 01 48 83 c4 08 5b 5d c3 83 05 b7 
>>> c0 0c 01
>>> [   48.123142] RSP: 0018:ffffc90000dabae0 EFLAGS: 00010282
>>> [   48.123150] RAX: 0000000000000000 RBX: ffff88810004f848 RCX: 
>>> 0000000000000000
>>> [   48.123154] RDX: 0000000080000001 RSI: ffffffff8112673f RDI: 
>>> ffffffff8112673f
>>> [   48.123159] RBP: ffffffffa0577480 R08: ffff88827fbfcfe8 R09: 
>>> 000000000009fffb
>>> [   48.123163] R10: 00000000fffe0000 R11: 3fffffffffffffff R12: 
>>> ffff88810a04d100
>>> [   48.123167] R13: ffff88810a07d308 R14: ffff888109990800 R15: 
>>> ffff88810997b800
>>> [   48.123171] FS:  00007ffff624b9c0(0000) GS:ffff888276e00000(0000) 
>>> knlGS:0000000000000000
>>> [   48.123176] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> [   48.123181] CR2: 00007ffff7f93bf0 CR3: 0000000108e56000 CR4: 
>>> 0000000000350ef0
>>> [   48.123185] Call Trace:
>>> [   48.123190]  i915_sw_fence_reinit+0x15/0x40 [i915]
>>> [   48.123341]  intel_context_init+0x16b/0x1d0 [i915]
>>> [   48.123492]  intel_context_create+0x33/0x100 [i915]
>>> [   48.123642]  default_engines+0x9d/0x120 [i915]
>>> [   48.123806]  i915_gem_create_context+0x465/0x630 [i915]
>>> [   48.125964]  ? trace_kmalloc+0x29/0xd0
>>> [   48.125976]  ? kmem_cache_alloc_trace+0x121/0x620
>>> [   48.125984]  i915_gem_context_open+0x145/0x1d0 [i915]
>>> [   48.126172]  i915_gem_open+0x75/0xb0 [i915]
>>> [   48.126364]  drm_file_alloc+0x1b1/0x280 [drm]
>>> [   48.126427]  drm_open+0xde/0x250 [drm]
>>> [   48.126482]  drm_stub_open+0xa8/0x130 [drm]
>>> [   48.126538]  chrdev_open+0xbf/0x240
>>> [   48.126547]  ? cdev_device_add+0x90/0x90
>>> [   48.126553]  do_dentry_open+0x151/0x3a0
>>> [   48.126560]  path_openat+0x76f/0xa10
>>> [   48.126568]  do_filp_open+0xa9/0x150
>>> [   48.126575]  ? preempt_count_sub+0x9b/0xd0
>>> [   48.126584]  ? _raw_spin_unlock+0x29/0x40
>>> [   48.126593]  do_sys_openat2+0x97/0x160
>>> [   48.126600]  __x64_sys_openat+0x54/0x90
>>> [   48.126607]  do_syscall_64+0x38/0x90
>>> [   48.126614]  entry_SYSCALL_64_after_hwframe+0x44/0xae
>>> [   48.126622] RIP: 0033:0x7ffff7cdca5b
>>> [   48.126630] Code: 25 00 00 41 00 3d 00 00 41 00 74 4b 64 8b 04 25 
>>> 18 00 00 00 85 c0 75 67 44 89 e2 48 89 ee bf 9c ff ff ff b8 01 01 00 
>>> 00 0f 05 <48> 3d 00 f0 ff ff 0f 87 91 00 00 00 48 8b 4c 24 28 64 48 
>>> 33 0c 25
>>> [   48.126636] RSP: 002b:00007fffffffda20 EFLAGS: 00000246 ORIG_RAX: 
>>> 0000000000000101
>>> [   48.126645] RAX: ffffffffffffffda RBX: 00007fffffffdb60 RCX: 
>>> 00007ffff7cdca5b
>>> [   48.126649] RDX: 0000000000000002 RSI: 00007fffffffdb60 RDI: 
>>> 00000000ffffff9c
>>> [   48.126654] RBP: 00007fffffffdb60 R08: 0000000000000001 R09: 
>>> 000000000000000e
>>> [   48.126658] R10: 0000000000000000 R11: 0000000000000246 R12: 
>>> 0000000000000002
>>> [   48.126663] R13: 00007ffff7f9406a R14: 0000000000000000 R15: 
>>> 00000000fffffffb
>>> [   48.126669] irq event stamp: 29565
>>> [   48.126673] hardirqs last  enabled at (29571): 
>>> [<ffffffff81126357>] __up_console_sem+0x67/0x70
>>> [   48.126682] hardirqs last disabled at (29576): 
>>> [<ffffffff8112633c>] __up_console_sem+0x4c/0x70
>>> [   48.126689] softirqs last  enabled at (29394): 
>>> [<ffffffff81c0032c>] __do_softirq+0x32c/0x499
>>> [   48.126696] softirqs last disabled at (29371): 
>>> [<ffffffff810ba2ed>] irq_exit_rcu+0xdd/0x130
>>> [   48.126704] ---[ end trace 4978f2ce56481e4b ]---
>>> [   48.126711] ------------[ cut here ]------------
>>> [   48.126714] ODEBUG: activate destroyed (active state 0) object 
>>> type: i915_sw_fence hint: sw_fence_dummy_notify+0x0/0x10 [i915]
>>> [   48.127053] WARNING: CPU: 1 PID: 815 at lib/debugobjects.c:505 
>>> debug_print_object+0x6e/0x90
>>> [   48.127062] Modules linked in: i915 i2c_algo_bit ttm 
>>> drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops 
>>> prime_numbers intel_gtt agpgart fuse nls_iso8859_1 nls_cp437 vfat 
>>> fat intel_rapl_msr wmi_bmof intel_rapl_common x86_pkg_temp_thermal 
>>> r8169 realtek mdio_devres coretemp libphy efi_pstore evdev sdhci_pci 
>>> cqhci sdhci mei_me mmc_core i2c_i801 intel_pmc_core mei led_class 
>>> wmi i2c_smbus sch_fq_codel drm ip_tables x_tables ipv6 autofs4
>>> [   48.127216] CPU: 1 PID: 815 Comm: kms_async_flips Tainted: 
>>> G        W         5.15.0-rc2-hsw+ #131
>>> [   48.127221] Hardware name: Intel Corporation NUC7CJYH/NUC7JYB, 
>>> BIOS JYGLKCPX.86A.0027.2018.0125.1347 01/25/2018
>>> [   48.127226] RIP: 0010:debug_print_object+0x6e/0x90
>>> [   48.127232] Code: 07 08 02 83 c0 01 8b 4b 14 4c 8b 45 00 48 c7 c7 
>>> a0 19 0a 82 89 05 66 07 08 02 8b 43 10 48 8b 14 c5 c0 0d e4 81 e8 d7 
>>> 2e 3c 00 <0f> 0b 83 05 c5 c0 0c 01 01 48 83 c4 08 5b 5d c3 83 05 b7 
>>> c0 0c 01
>>> [   48.127238] RSP: 0018:ffffc90000daba88 EFLAGS: 00010282
>>> [   48.127245] RAX: 0000000000000000 RBX: ffff88810004f848 RCX: 
>>> 0000000000000000
>>> [   48.127250] RDX: 0000000080000001 RSI: ffffffff8112673f RDI: 
>>> ffffffff8112673f
>>> [   48.127254] RBP: ffffffffa0577480 R08: ffff88827fbfcfe8 R09: 
>>> 000000000009fffb
>>> [   48.127259] R10: 00000000fffe0000 R11: 3fffffffffffffff R12: 
>>> ffff88810a04d468
>>> [   48.127263] R13: ffffffffa0577480 R14: ffffffff835ce0b8 R15: 
>>> ffff88810997b800
>>> [   48.127268] FS:  00007ffff624b9c0(0000) GS:ffff888276e80000(0000) 
>>> knlGS:0000000000000000
>>> [   48.127273] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> [   48.127277] CR2: 000055555556f5e8 CR3: 0000000108e56000 CR4: 
>>> 0000000000350ee0
>>> [   48.127282] Call Trace:
>>> [   48.127287]  debug_object_activate+0x174/0x200
>>> [   48.127296]  i915_sw_fence_commit+0x15/0x20 [i915]
>>> [   48.127461]  intel_context_init+0x173/0x1d0 [i915]
>>> [   48.127627]  intel_context_create+0x33/0x100 [i915]
>>> [   48.127792]  default_engines+0x9d/0x120 [i915]
>>> [   48.127971]  i915_gem_create_context+0x465/0x630 [i915]
>>> [   48.128195]  ? trace_kmalloc+0x29/0xd0
>>> [   48.128203]  ? kmem_cache_alloc_trace+0x121/0x620
>>> [   48.128211]  i915_gem_context_open+0x145/0x1d0 [i915]
>>> [   48.128389]  i915_gem_open+0x75/0xb0 [i915]
>>> [   48.128577]  drm_file_alloc+0x1b1/0x280 [drm]
>>> [   48.128632]  drm_open+0xde/0x250 [drm]
>>> [   48.128687]  drm_stub_open+0xa8/0x130 [drm]
>>> [   48.128742]  chrdev_open+0xbf/0x240
>>> [   48.128749]  ? cdev_device_add+0x90/0x90
>>> [   48.128754]  do_dentry_open+0x151/0x3a0
>>> [   48.128761]  path_openat+0x76f/0xa10
>>> [   48.128768]  do_filp_open+0xa9/0x150
>>> [   48.128775]  ? preempt_count_sub+0x9b/0xd0
>>> [   48.128782]  ? _raw_spin_unlock+0x29/0x40
>>> [   48.128789]  do_sys_openat2+0x97/0x160
>>> [   48.128795]  __x64_sys_openat+0x54/0x90
>>> [   48.128802]  do_syscall_64+0x38/0x90
>>> [   48.128808]  entry_SYSCALL_64_after_hwframe+0x44/0xae
>>> [   48.128815] RIP: 0033:0x7ffff7cdca5b
>>> [   48.128821] Code: 25 00 00 41 00 3d 00 00 41 00 74 4b 64 8b 04 25 
>>> 18 00 00 00 85 c0 75 67 44 89 e2 48 89 ee bf 9c ff ff ff b8 01 01 00 
>>> 00 0f 05 <48> 3d 00 f0 ff ff 0f 87 91 00 00 00 48 8b 4c 24 28 64 48 
>>> 33 0c 25
>>> [   48.128826] RSP: 002b:00007fffffffda20 EFLAGS: 00000246 ORIG_RAX: 
>>> 0000000000000101
>>> [   48.128835] RAX: ffffffffffffffda RBX: 00007fffffffdb60 RCX: 
>>> 00007ffff7cdca5b
>>> [   48.128839] RDX: 0000000000000002 RSI: 00007fffffffdb60 RDI: 
>>> 00000000ffffff9c
>>> [   48.128844] RBP: 00007fffffffdb60 R08: 0000000000000001 R09: 
>>> 000000000000000e
>>> [   48.128848] R10: 0000000000000000 R11: 0000000000000246 R12: 
>>> 0000000000000002
>>> [   48.128852] R13: 00007ffff7f9406a R14: 0000000000000000 R15: 
>>> 00000000fffffffb
>>> [   48.128859] irq event stamp: 30217
>>> [   48.128862] hardirqs last  enabled at (30223): 
>>> [<ffffffff81126357>] __up_console_sem+0x67/0x70
>>> [   48.128869] hardirqs last disabled at (30228): 
>>> [<ffffffff8112633c>] __up_console_sem+0x4c/0x70
>>> [   48.128875] softirqs last  enabled at (30050): 
>>> [<ffffffff81c0032c>] __do_softirq+0x32c/0x499
>>> [   48.128881] softirqs last disabled at (30035): 
>>> [<ffffffff810ba2ed>] irq_exit_rcu+0xdd/0x130
>>> [   48.128888] ---[ end trace 4978f2ce56481e4c ]---
>>> [   48.128895] ------------[ cut here ]------------
>>> [   48.128899] ODEBUG: active_state destroyed (active state 0) 
>>> object type: i915_sw_fence hint: sw_fence_dummy_notify+0x0/0x10 [i915]
>>> [   48.129179] WARNING: CPU: 1 PID: 815 at lib/debugobjects.c:505 
>>> debug_print_object+0x6e/0x90
>>> [   48.129187] Modules linked in: i915 i2c_algo_bit ttm 
>>> drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops 
>>> prime_numbers intel_gtt agpgart fuse nls_iso8859_1 nls_cp437 vfat 
>>> fat intel_rapl_msr wmi_bmof intel_rapl_common x86_pkg_temp_thermal 
>>> r8169 realtek mdio_devres coretemp libphy efi_pstore evdev sdhci_pci 
>>> cqhci sdhci mei_me mmc_core i2c_i801 intel_pmc_core mei led_class 
>>> wmi i2c_smbus sch_fq_codel drm ip_tables x_tables ipv6 autofs4
>>> [   48.129328] CPU: 1 PID: 815 Comm: kms_async_flips Tainted: 
>>> G        W         5.15.0-rc2-hsw+ #131
>>> [   48.129334] Hardware name: Intel Corporation NUC7CJYH/NUC7JYB, 
>>> BIOS JYGLKCPX.86A.0027.2018.0125.1347 01/25/2018
>>> [   48.129338] RIP: 0010:debug_print_object+0x6e/0x90
>>> [   48.129344] Code: 07 08 02 83 c0 01 8b 4b 14 4c 8b 45 00 48 c7 c7 
>>> a0 19 0a 82 89 05 66 07 08 02 8b 43 10 48 8b 14 c5 c0 0d e4 81 e8 d7 
>>> 2e 3c 00 <0f> 0b 83 05 c5 c0 0c 01 01 48 83 c4 08 5b 5d c3 83 05 b7 
>>> c0 0c 01
>>> [   48.129350] RSP: 0018:ffffc90000dabaa8 EFLAGS: 00010286
>>> [   48.129357] RAX: 0000000000000000 RBX: ffff88810004f848 RCX: 
>>> 0000000000000000
>>> [   48.129362] RDX: 0000000080000001 RSI: ffffffff8112673f RDI: 
>>> ffffffff8112673f
>>> [   48.129366] RBP: ffffffffa0577480 R08: ffff88827fbfcfe8 R09: 
>>> 000000000009fffb
>>> [   48.129371] R10: 00000000fffe0000 R11: 3fffffffffffffff R12: 
>>> ffff88810a04d100
>>> [   48.129375] R13: ffff88810a07d308 R14: 0000000000000000 R15: 
>>> ffff88810997b800
>>> [   48.129379] FS:  00007ffff624b9c0(0000) GS:ffff888276e80000(0000) 
>>> knlGS:0000000000000000
>>> [   48.129384] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> [   48.129389] CR2: 000055555556f5e8 CR3: 0000000108e56000 CR4: 
>>> 0000000000350ee0
>>> [   48.129393] Call Trace:
>>> [   48.129398]  __i915_sw_fence_complete+0x70/0x240 [i915]
>>> [   48.129564]  ? preempt_count_sub+0x9b/0xd0
>>> [   48.129572]  intel_context_init+0x173/0x1d0 [i915]
>>> [   48.129738]  intel_context_create+0x33/0x100 [i915]
>>> [   48.129902]  default_engines+0x9d/0x120 [i915]
>>> [   48.130080]  i915_gem_create_context+0x465/0x630 [i915]
>>> [   48.130258]  ? trace_kmalloc+0x29/0xd0
>>> [   48.130264]  ? kmem_cache_alloc_trace+0x121/0x620
>>> [   48.130271]  i915_gem_context_open+0x145/0x1d0 [i915]
>>> [   48.130449]  i915_gem_open+0x75/0xb0 [i915]
>>> [   48.130635]  drm_file_alloc+0x1b1/0x280 [drm]
>>> [   48.130689]  drm_open+0xde/0x250 [drm]
>>> [   48.130744]  drm_stub_open+0xa8/0x130 [drm]
>>> [   48.130801]  chrdev_open+0xbf/0x240
>>> [   48.130807]  ? cdev_device_add+0x90/0x90
>>> [   48.130813]  do_dentry_open+0x151/0x3a0
>>> [   48.130819]  path_openat+0x76f/0xa10
>>> [   48.130826]  do_filp_open+0xa9/0x150
>>> [   48.130833]  ? preempt_count_sub+0x9b/0xd0
>>> [   48.130839]  ? _raw_spin_unlock+0x29/0x40
>>> [   48.130847]  do_sys_openat2+0x97/0x160
>>> [   48.130853]  __x64_sys_openat+0x54/0x90
>>> [   48.130860]  do_syscall_64+0x38/0x90
>>> [   48.130866]  entry_SYSCALL_64_after_hwframe+0x44/0xae
>>> [   48.130873] RIP: 0033:0x7ffff7cdca5b
>>> [   48.130878] Code: 25 00 00 41 00 3d 00 00 41 00 74 4b 64 8b 04 25 
>>> 18 00 00 00 85 c0 75 67 44 89 e2 48 89 ee bf 9c ff ff ff b8 01 01 00 
>>> 00 0f 05 <48> 3d 00 f0 ff ff 0f 87 91 00 00 00 48 8b 4c 24 28 64 48 
>>> 33 0c 25
>>> [   48.130883] RSP: 002b:00007fffffffda20 EFLAGS: 00000246 ORIG_RAX: 
>>> 0000000000000101
>>> [   48.130892] RAX: ffffffffffffffda RBX: 00007fffffffdb60 RCX: 
>>> 00007ffff7cdca5b
>>> [   48.130896] RDX: 0000000000000002 RSI: 00007fffffffdb60 RDI: 
>>> 00000000ffffff9c
>>> [   48.130901] RBP: 00007fffffffdb60 R08: 0000000000000001 R09: 
>>> 000000000000000e
>>> [   48.130905] R10: 0000000000000000 R11: 0000000000000246 R12: 
>>> 0000000000000002
>>> [   48.130909] R13: 00007ffff7f9406a R14: 0000000000000000 R15: 
>>> 00000000fffffffb
>>> [   48.130916] irq event stamp: 30843
>>> [   48.130919] hardirqs last  enabled at (30849): 
>>> [<ffffffff81126357>] __up_console_sem+0x67/0x70
>>> [   48.130926] hardirqs last disabled at (30854): 
>>> [<ffffffff8112633c>] __up_console_sem+0x4c/0x70
>>> [   48.130932] softirqs last  enabled at (30050): 
>>> [<ffffffff81c0032c>] __do_softirq+0x32c/0x499
>>> [   48.130938] softirqs last disabled at (30035): 
>>> [<ffffffff810ba2ed>] irq_exit_rcu+0xdd/0x130
>>> [   48.130944] ---[ end trace 4978f2ce56481e4d ]---
>>> [   48.130950] ------------[ cut here ]------------
>>> [   48.130954] ODEBUG: active_state destroyed (active state 0) 
>>> object type: i915_sw_fence hint: sw_fence_dummy_notify+0x0/0x10 [i915]
>>> [   48.131232] WARNING: CPU: 1 PID: 815 at lib/debugobjects.c:505 
>>> debug_print_object+0x6e/0x90
>>> [   48.131240] Modules linked in: i915 i2c_algo_bit ttm 
>>> drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops 
>>> prime_numbers intel_gtt agpgart fuse nls_iso8859_1 nls_cp437 vfat 
>>> fat intel_rapl_msr wmi_bmof intel_rapl_common x86_pkg_temp_thermal 
>>> r8169 realtek mdio_devres coretemp libphy efi_pstore evdev sdhci_pci 
>>> cqhci sdhci mei_me mmc_core i2c_i801 intel_pmc_core mei led_class 
>>> wmi i2c_smbus sch_fq_codel drm ip_tables x_tables ipv6 autofs4
>>> [   48.131381] CPU: 1 PID: 815 Comm: kms_async_flips Tainted: 
>>> G        W         5.15.0-rc2-hsw+ #131
>>> [   48.131387] Hardware name: Intel Corporation NUC7CJYH/NUC7JYB, 
>>> BIOS JYGLKCPX.86A.0027.2018.0125.1347 01/25/2018
>>> [   48.131391] RIP: 0010:debug_print_object+0x6e/0x90
>>> [   48.131397] Code: 07 08 02 83 c0 01 8b 4b 14 4c 8b 45 00 48 c7 c7 
>>> a0 19 0a 82 89 05 66 07 08 02 8b 43 10 48 8b 14 c5 c0 0d e4 81 e8 d7 
>>> 2e 3c 00 <0f> 0b 83 05 c5 c0 0c 01 01 48 83 c4 08 5b 5d c3 83 05 b7 
>>> c0 0c 01
>>> [   48.131402] RSP: 0018:ffffc90000dabaa8 EFLAGS: 00010286
>>> [   48.131410] RAX: 0000000000000000 RBX: ffff88810004f848 RCX: 
>>> 0000000000000000
>>> [   48.131414] RDX: 0000000080000001 RSI: ffffffff8112673f RDI: 
>>> ffffffff8112673f
>>> [   48.131419] RBP: ffffffffa0577480 R08: ffff88827fbfcfe8 R09: 
>>> 000000000009fffb
>>> [   48.131423] R10: 00000000fffe0000 R11: 3fffffffffffffff R12: 
>>> ffff88810a04d100
>>> [   48.131427] R13: ffff88810a07d308 R14: 0000000000000000 R15: 
>>> ffff88810997b800
>>> [   48.131432] FS:  00007ffff624b9c0(0000) GS:ffff888276e80000(0000) 
>>> knlGS:0000000000000000
>>> [   48.131437] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> [   48.131441] CR2: 000055555556f5e8 CR3: 0000000108e56000 CR4: 
>>> 0000000000350ee0
>>> [   48.131446] Call Trace:
>>> [   48.131450]  __i915_sw_fence_complete+0x9c/0x240 [i915]
>>> [   48.131614]  ? preempt_count_sub+0x9b/0xd0
>>> [   48.131622]  intel_context_init+0x173/0x1d0 [i915]
>>> [   48.131787]  intel_context_create+0x33/0x100 [i915]
>>> [   48.131951]  default_engines+0x9d/0x120 [i915]
>>> [   48.132129]  i915_gem_create_context+0x465/0x630 [i915]
>>> [   48.132306]  ? trace_kmalloc+0x29/0xd0
>>> [   48.132313]  ? kmem_cache_alloc_trace+0x121/0x620
>>> [   48.132320]  i915_gem_context_open+0x145/0x1d0 [i915]
>>> [   48.132498]  i915_gem_open+0x75/0xb0 [i915]
>>> [   48.132685]  drm_file_alloc+0x1b1/0x280 [drm]
>>> [   48.132739]  drm_open+0xde/0x250 [drm]
>>> [   48.132793]  drm_stub_open+0xa8/0x130 [drm]
>>> [   48.132849]  chrdev_open+0xbf/0x240
>>> [   48.132855]  ? cdev_device_add+0x90/0x90
>>> [   48.132861]  do_dentry_open+0x151/0x3a0
>>> [   48.132867]  path_openat+0x76f/0xa10
>>> [   48.132874]  do_filp_open+0xa9/0x150
>>> [   48.132881]  ? preempt_count_sub+0x9b/0xd0
>>> [   48.132887]  ? _raw_spin_unlock+0x29/0x40
>>> [   48.132895]  do_sys_openat2+0x97/0x160
>>> [   48.132901]  __x64_sys_openat+0x54/0x90
>>> [   48.132907]  do_syscall_64+0x38/0x90
>>> [   48.132914]  entry_SYSCALL_64_after_hwframe+0x44/0xae
>>> [   48.132921] RIP: 0033:0x7ffff7cdca5b
>>> [   48.132926] Code: 25 00 00 41 00 3d 00 00 41 00 74 4b 64 8b 04 25 
>>> 18 00 00 00 85 c0 75 67 44 89 e2 48 89 ee bf 9c ff ff ff b8 01 01 00 
>>> 00 0f 05 <48> 3d 00 f0 ff ff 0f 87 91 00 00 00 48 8b 4c 24 28 64 48 
>>> 33 0c 25
>>> [   48.132931] RSP: 002b:00007fffffffda20 EFLAGS: 00000246 ORIG_RAX: 
>>> 0000000000000101
>>> [   48.132939] RAX: ffffffffffffffda RBX: 00007fffffffdb60 RCX: 
>>> 00007ffff7cdca5b
>>> [   48.132944] RDX: 0000000000000002 RSI: 00007fffffffdb60 RDI: 
>>> 00000000ffffff9c
>>> [   48.132948] RBP: 00007fffffffdb60 R08: 0000000000000001 R09: 
>>> 000000000000000e
>>> [   48.132952] R10: 0000000000000000 R11: 0000000000000246 R12: 
>>> 0000000000000002
>>> [   48.132956] R13: 00007ffff7f9406a R14: 0000000000000000 R15: 
>>> 00000000fffffffb
>>> [   48.132963] irq event stamp: 31465
>>> [   48.132966] hardirqs last  enabled at (31471): 
>>> [<ffffffff81126357>] __up_console_sem+0x67/0x70
>>> [   48.132973] hardirqs last disabled at (31476): 
>>> [<ffffffff8112633c>] __up_console_sem+0x4c/0x70
>>> [   48.132979] softirqs last  enabled at (30050): 
>>> [<ffffffff81c0032c>] __do_softirq+0x32c/0x499
>>> [   48.132984] softirqs last disabled at (30035): 
>>> [<ffffffff810ba2ed>] irq_exit_rcu+0xdd/0x130
>>> [   48.132991] ---[ end trace 4978f2ce56481e4e ]---
>>> [   48.132996] ------------[ cut here ]------------
>>> [   48.133000] ODEBUG: deactivate destroyed (active state 0) object 
>>> type: i915_sw_fence hint: sw_fence_dummy_notify+0x0/0x10 [i915]
>>> [   48.133277] WARNING: CPU: 1 PID: 815 at lib/debugobjects.c:505 
>>> debug_print_object+0x6e/0x90
>>> [   48.133284] Modules linked in: i915 i2c_algo_bit ttm 
>>> drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops 
>>> prime_numbers intel_gtt agpgart fuse nls_iso8859_1 nls_cp437 vfat 
>>> fat intel_rapl_msr wmi_bmof intel_rapl_common x86_pkg_temp_thermal 
>>> r8169 realtek mdio_devres coretemp libphy efi_pstore evdev sdhci_pci 
>>> cqhci sdhci mei_me mmc_core i2c_i801 intel_pmc_core mei led_class 
>>> wmi i2c_smbus sch_fq_codel drm ip_tables x_tables ipv6 autofs4
>>> [   48.133425] CPU: 1 PID: 815 Comm: kms_async_flips Tainted: 
>>> G        W         5.15.0-rc2-hsw+ #131
>>> [   48.133430] Hardware name: Intel Corporation NUC7CJYH/NUC7JYB, 
>>> BIOS JYGLKCPX.86A.0027.2018.0125.1347 01/25/2018
>>> [   48.133434] RIP: 0010:debug_print_object+0x6e/0x90
>>> [   48.133440] Code: 07 08 02 83 c0 01 8b 4b 14 4c 8b 45 00 48 c7 c7 
>>> a0 19 0a 82 89 05 66 07 08 02 8b 43 10 48 8b 14 c5 c0 0d e4 81 e8 d7 
>>> 2e 3c 00 <0f> 0b 83 05 c5 c0 0c 01 01 48 83 c4 08 5b 5d c3 83 05 b7 
>>> c0 0c 01
>>> [   48.133445] RSP: 0018:ffffc90000dabaa8 EFLAGS: 00010286
>>> [   48.133453] RAX: 0000000000000000 RBX: ffff88810004f848 RCX: 
>>> 0000000000000000
>>> [   48.133458] RDX: 0000000080000001 RSI: ffffffff8112673f RDI: 
>>> ffffffff8112673f
>>> [   48.133462] RBP: ffffffffa0577480 R08: ffff88827fbfcfe8 R09: 
>>> 000000000009fffb
>>> [   48.133468] R10: 00000000fffe0000 R11: 3fffffffffffffff R12: 
>>> ffff88810a04d100
>>> [   48.133472] R13: ffff88810a07d308 R14: 0000000000000000 R15: 
>>> ffff88810997b800
>>> [   48.133476] FS:  00007ffff624b9c0(0000) GS:ffff888276e80000(0000) 
>>> knlGS:0000000000000000
>>> [   48.133481] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> [   48.133486] CR2: 000055555556f5e8 CR3: 0000000108e56000 CR4: 
>>> 0000000000350ee0
>>> [   48.133490] Call Trace:
>>> [   48.133495]  __i915_sw_fence_complete+0xab/0x240 [i915]
>>> [   48.133658]  ? preempt_count_sub+0x9b/0xd0
>>> [   48.133666]  intel_context_init+0x173/0x1d0 [i915]
>>> [   48.133830]  intel_context_create+0x33/0x100 [i915]
>>> [   48.142705]  default_engines+0x9d/0x120 [i915]
>>> [   48.142861]  i915_gem_create_context+0x465/0x630 [i915]
>>> [   48.142996]  ? trace_kmalloc+0x29/0xd0
>>> [   48.143003]  ? kmem_cache_alloc_trace+0x121/0x620
>>> [   48.143009]  i915_gem_context_open+0x145/0x1d0 [i915]
>>> [   48.143141]  i915_gem_open+0x75/0xb0 [i915]
>>> [   48.143438]  drm_file_alloc+0x1b1/0x280 [drm]
>>> [   48.143516]  drm_open+0xde/0x250 [drm]
>>> [   48.143557]  drm_stub_open+0xa8/0x130 [drm]
>>> [   48.143598]  chrdev_open+0xbf/0x240
>>> [   48.143604]  ? cdev_device_add+0x90/0x90
>>> [   48.143608]  do_dentry_open+0x151/0x3a0
>>> [   48.143614]  path_openat+0x76f/0xa10
>>> [   48.143619]  do_filp_open+0xa9/0x150
>>> [   48.143625]  ? preempt_count_sub+0x9b/0xd0
>>> [   48.143631]  ? _raw_spin_unlock+0x29/0x40
>>> [   48.143638]  do_sys_openat2+0x97/0x160
>>> [   48.143644]  __x64_sys_openat+0x54/0x90
>>> [   48.143648]  do_syscall_64+0x38/0x90
>>> [   48.143654]  entry_SYSCALL_64_after_hwframe+0x44/0xae
>>> [   48.143660] RIP: 0033:0x7ffff7cdca5b
>>> [   48.143664] Code: 25 00 00 41 00 3d 00 00 41 00 74 4b 64 8b 04 25 
>>> 18 00 00 00 85 c0 75 67 44 89 e2 48 89 ee bf 9c ff ff ff b8 01 01 00 
>>> 00 0f 05 <48> 3d 00 f0 ff ff 0f 87 91 00 00 00 48 8b 4c 24 28 64 48 
>>> 33 0c 25
>>> [   48.143668] RSP: 002b:00007fffffffda20 EFLAGS: 00000246 ORIG_RAX: 
>>> 0000000000000101
>>> [   48.143675] RAX: ffffffffffffffda RBX: 00007fffffffdb60 RCX: 
>>> 00007ffff7cdca5b
>>> [   48.143679] RDX: 0000000000000002 RSI: 00007fffffffdb60 RDI: 
>>> 00000000ffffff9c
>>> [   48.143682] RBP: 00007fffffffdb60 R08: 0000000000000001 R09: 
>>> 000000000000000e
>>> [   48.143685] R10: 0000000000000000 R11: 0000000000000246 R12: 
>>> 0000000000000002
>>> [   48.143688] R13: 00007ffff7f9406a R14: 0000000000000000 R15: 
>>> 00000000fffffffb
>>> [   48.143693] irq event stamp: 32275
>>> [   48.143696] hardirqs last  enabled at (32281): 
>>> [<ffffffff81126357>] __up_console_sem+0x67/0x70
>>> [   48.143701] hardirqs last disabled at (32286): 
>>> [<ffffffff8112633c>] __up_console_sem+0x4c/0x70
>>> [   48.143706] softirqs last  enabled at (32138): 
>>> [<ffffffff81c0032c>] __do_softirq+0x32c/0x499
>>> [   48.143710] softirqs last disabled at (32125): 
>>> [<ffffffff810ba2ed>] irq_exit_rcu+0xdd/0x130
>>> [   48.143716] ---[ end trace 4978f2ce56481e4f ]---
>>

