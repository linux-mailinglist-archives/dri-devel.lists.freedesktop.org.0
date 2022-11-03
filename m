Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A876173C3
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 02:33:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97AB610E558;
	Thu,  3 Nov 2022 01:33:15 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3582510E20A;
 Thu,  3 Nov 2022 01:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667439192; x=1698975192;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=03t6z7sknGT1mFGnt42KMwKROg8KHjcHRS5vv5anqto=;
 b=PctwolXV3KgSRcJr3+zr1d3AslBxN05DRWrYpMUUtxVDOL+tmXWTQStp
 PbLzauJXsCdDD9N3rznoudBtf0nAVbnrbbkPos8a6ahJ3CBgbXe/mySDg
 HQGgRdVbu7qUXCaDGR7ANjcP2l4f9HrcZc8Lr/nj4K4yYVJ58KAXqd/F7
 GXRn9QiZpv7IftuFJ12gJyc8iHNVL23ToEJW43tLSA/blAxSIkJsQioSQ
 FA/smZc4/6qCU/I4cmbIflJlbUWvnjdP5tQK2vnnuJgoRq1AA3skoOfAO
 izaG+MZkMyFufG5nyqAX+INbdE/P98uvdsdqop6tBdPRu+9CfuzIlG/NZ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="308277504"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; d="scan'208";a="308277504"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2022 18:33:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="667790455"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; d="scan'208";a="667790455"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 02 Nov 2022 18:33:10 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 2 Nov 2022 18:33:10 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 2 Nov 2022 18:33:09 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 2 Nov 2022 18:33:09 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 2 Nov 2022 18:33:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N3fQ1KFe+G01JM+5pK0tluCnoO3U6xxqbFhHWKHw9o/LtSFIS1yVTaUXuvHreAFIQsgpoGaPH0guRnOBeJZvUSgchUDXm1W112DbMsxR1qHv31DS4nZDWQdGWB6HDJ3AffB18OXKyk/BPjJqzavD9DU0Fj+AZvJcXSTgnyXL2943mQ9TqbXxtwod3Cyew9scrgCY3HnaPUWZ4UNBqrSzUgJ5O+KFqZImyn1CGjvWUzR7dWQ/lPdgZnHGhj8KZr/Tb128kFRjxAtTaVP8U86bgiRBuLAYeDRIUPySYljBQIYLNaLmnnIuDBIoe2eug5ffT3ZeSj4tETNGLNOwdejs0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/aw6YZWZfda2eV8vY/bDQowaIITKcuQ88dIeprZZjws=;
 b=HxfHD4IjJvCdza1+KKwMTyF0lZh2HlJHdUfy3M1Cxa2H/czp02z3lxVMdH2ABwuXgF2PMCkVApoMA6uIWKb8PkiNX+jy9PQ2Sg94VuV/1oN3oP+m2bC7Ov2JuaOctq/K6A178t1Pgg61KXwnrtNCgbzbtzsmKPlUDvRInQhmDUnqS2AYFyHyPH6HBkPcHGI5aI8UmbNPtLDRVdgvXQ5DLIYk7P4Z0K59B4DCErOT0Vyx/BhXP8nzalCdnes2f0hPakFso6zXEgMPxhbvzMaFnYgBvzdNNoOiVkYPohQ5Gm3AOfyH8I3filCZNeKkFkGLN2Nd0XbQ33OvwLEEEZxK/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by PH8PR11MB6706.namprd11.prod.outlook.com (2603:10b6:510:1c5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Thu, 3 Nov
 2022 01:33:07 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036%7]) with mapi id 15.20.5791.020; Thu, 3 Nov 2022
 01:33:07 +0000
Message-ID: <5e22de43-d75c-fc21-9ae7-f27d116c5688@intel.com>
Date: Wed, 2 Nov 2022 18:33:05 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Don't wait forever in drop_caches
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20221101235053.1650364-1-John.C.Harrison@Intel.com>
 <87k04d7dyn.fsf@intel.com>
 <c710a428-50f6-6181-3f93-4d7667a9ac3f@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <c710a428-50f6-6181-3f93-4d7667a9ac3f@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR02CA0005.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::18) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|PH8PR11MB6706:EE_
X-MS-Office365-Filtering-Correlation-Id: 23365c71-652d-4582-d29e-08dabd3b5c42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O/fjwuq2DKnAkdy/hCMyNZHvCuUs5cek/OoFFqXmjVvNQyBDqY7K3/EBYQkqumvYVE3G5V122HEw6QNI2F8sugn4nvswWjZMOF4Q+PMuL9XXZgpZrRE9WW59SZK2214ssDkvm9RFti9UmSjbNPysQNuUZS7gXHZgyyp0KWo61KHnKhFXr0jRuUTYGoJKx11yWSvVf/S4zfNwjmQQi2AcWiov5bugUgKJYMcLGTbAhLAYRptuDDT5ccXQs1GHjqycvW0CCVDRRumT4L8DKdZwzbM0AJPZbZCzNivNQ+Zcu/DrW3NQ/niW+em4IYKozErnhp+0DPp4W6s/0CnkK5eBzkmtk1zf0vZIkI+xFd4Rjp/M1boWySVWyx51sJQC3LpMJDQO6FjTaJxr+P9n6xi/DB0AK2ELTOFPOkUKbEIKZrt2y9zZrF8O36xFrwZetkckUR5RyrlBGllwNkqaWzEA37J056nUhnNYIqq8sf0JWUVHGB/Dod6QFOxbjEllA2xAZ7R3i5+PyxDC/AF99HpnZXwtWaIzYgUt8xabn4heZagP/+O6SOV/pmwk7DvX1kOkgzDdtiRrpO++SkTAHJwv70Ik+drlg2fdmRBJYocTdyQrIclHPNmEb4xEMfuVJC0E9WtKjI1ZRCB+609N2yvek2EDQ51dCpmRcIzHlxN9Ncxow8rcqBukDw/JwPiVEjEQNwPL4AhYPEwohiZfnIobNO78am7/8zdhOgczE0sb0aGvcfGSlPML+Iu3k3mr6ejlD0YtctjluDTJB8BIWdVPShTmTcfpu/8xCdPzrCbvNeI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(346002)(39860400002)(136003)(396003)(366004)(451199015)(316002)(4326008)(110136005)(31686004)(6506007)(66946007)(8676002)(66476007)(2906002)(2616005)(53546011)(6512007)(478600001)(6486002)(186003)(26005)(8936002)(5660300002)(36756003)(31696002)(86362001)(66556008)(82960400001)(41300700001)(83380400001)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUdlQmQ4cDZLZStFakUxS3F1RE9WTVFSQUh3V1ZaYWRpQTFRdnZ1L21EMkFL?=
 =?utf-8?B?dGF4Q0tkeklLVjdObmUzK3dvRzZzYXA2a1FOZ1VDTDY1eTQzbFcrR1pONWRI?=
 =?utf-8?B?YjBiRWtkVytvN0tuUURESkttQ200RlFsTVVYdFBZL2RhTkx3aUxCeS9VaHhy?=
 =?utf-8?B?b3NFZTQ0RVVjR2RaQ2l1VDIrOElYQ0xOcXBiNFNLcmZmaUxMc0wwSWhIMjlO?=
 =?utf-8?B?cXhVU1lOSUV5Wk1kVmZXMGdyNGs0NjdCMHpPbVlpRlVoVDB2LzU4T2dSZWJQ?=
 =?utf-8?B?WmZqVVVkTnhqWkNIVnl1cDRsUDJLR3E5Z3RuZC9Iam96T3N5TVBHMkVPNDdl?=
 =?utf-8?B?blpYWE5pWi9jUk9jcTEvQVF1L29FWkNObjZJMFpBbWd4Z2lWSm9Ia0FscFJl?=
 =?utf-8?B?RUxubmpNMWp0NGlOS1lMeEZ3UVd2MDFuZFBTOGV1ME5JQ3FhV3lqcDlkWGZk?=
 =?utf-8?B?ZElQUHFXQ0hhMGdOczZvRmo2cHdhaXZQTW1oMDFtK2t0RmtEcHdMdFJDdDVz?=
 =?utf-8?B?Zzc3MnpITW1Gcmx6Mzc4QmpHSnVSenl0OVZNQUl0UzBhd2MvU1ZuM3dERGlk?=
 =?utf-8?B?UU9iUHBXSjRWK3ppM0Q5M0tFdjFnS2pqRjYvaVVlVXFYQklLT0dCVzRlTWYw?=
 =?utf-8?B?dVlTUGd2aFc2T2s1dEcrNHd6L2I2cTlHRnFJalU4ZUJ2aGpKYmFjQmFkWWhj?=
 =?utf-8?B?L0F0cGlGaDYrak5vR1hjeU5mZ2dqdWlWYmZKZnR5NlNnR2ZqYXdOakE5amVM?=
 =?utf-8?B?bDlNa3VjYWgwV2JyeEd5M2JNU3h0UjM2b2Nab3BqSzczbWVWT2VkRmZtNnpi?=
 =?utf-8?B?RVZjNjQ4TWdnOWRkOVcrRW4vUGNEUjREcG04Q0dSWWppT1IrYk90NDZubWwy?=
 =?utf-8?B?YmY4RXNteXBSeHBtZnVvTlEyOHJ4NEh3V2VndzhRSWd4T2xvWjRsNGZvekRl?=
 =?utf-8?B?T3NjQzZFK2hESjIvZ0plUzRqSGwxcENLQzRWN2g0Nlo2anpIQll1VkN1aEJF?=
 =?utf-8?B?Z1hRMzVJYjlNRGdtUXovU2NBTzV2VGttYlRSTGxmMnNVa3RVdmd3MGpYMkx6?=
 =?utf-8?B?LzZUaXZ6VFFZcnYwdDcrWjhkQmRaQ0lNSHp6cUtxTHBGRyt3azhsRE1taHoz?=
 =?utf-8?B?MEtERXFmeDcxMUdaZG52Uk01TnR5c01LanJVSnY4RlFwQlh3aEVQNlJlS25i?=
 =?utf-8?B?ZDJRZ3JYVHp5OW5weFlMeFRFNndPeXRyL0pnRUpybE1UOWhKa3JxdG56WDBv?=
 =?utf-8?B?TFBObEVKMmFQUE4zclZwcE5hblNjeVM4Y3ZJRWJKY0ZXMjJLRzQxajNsSHNt?=
 =?utf-8?B?a1NkSnpvR3JGMHp1N3pCY0ZmdFhXKzRDQ05NdE54OUoybzYrL0phbEdsQzBG?=
 =?utf-8?B?NjNIK2VZbzIxVDlkdVd3VU9aZWI2QWFPMFZ1MWowRm5xZFBsMTBDM2s1bkVy?=
 =?utf-8?B?RnhyUWNxdTFtbTUvS2V0dll0c0p3T1ZqUHllUFY3dmM4anFJSHRkSmZ2bGtX?=
 =?utf-8?B?QXlwWmV6dzBZdTM2dmx5Mk9wMmRaN0hScGZmSE52NFdtTXVEdG1VU2N6U0Vl?=
 =?utf-8?B?YWJKOGduY2U2SGVxUUllT09qUW5EVS8zakR2U0FHQldvODVBNjY0MnlWVmtL?=
 =?utf-8?B?K0NxRVd0QTdHbUtacHFWY2ZBY3ZnRmhNQnZueGd5cDdZNlFHOEZLdkE3V0RO?=
 =?utf-8?B?REFvTU9Ma3J3RFl3UXZxeG5OZmp1SDV0NkdVS1NzRlZpd3E2OUF5enZ0cmZ4?=
 =?utf-8?B?aHhkRXRyUmV6QS9WQTQ3K2NkeWp2NlVWQ2RNem5nOEZCKzZWcjVsM2RvaHVS?=
 =?utf-8?B?V0N1dGp0Wjl5Rk1ZU28rMWlKc3E5N1pmTjg1MzJVQXVOUEdGOFVLSGVVVE50?=
 =?utf-8?B?ZVBKWEpZdFBHT0JQM0srTkZSdWVYemY0UnlNUmZ2NDNRMm8xTGF6Y1pFRUpF?=
 =?utf-8?B?TDVmVGtFbk1UM1ZyT3dsZ2I1eVozN0FKckxkTHpwOWNOWmRDNlFCUXBvdW1K?=
 =?utf-8?B?aEdlQktEcWNRVGlCRHpBdExVYTg2MFEybE1yMUovdEVtZTFIVTVMK2RuQlo4?=
 =?utf-8?B?alBLUitLaktNazIzVmFTeGZqMTRFK1hXcyt6NUZVSkJYQm11NUl6VEl1VC9B?=
 =?utf-8?B?SUpmN0JZQ0ZoNjF6a2FuaEphVm5WamNyNm1WcjNtNjNDRVFMTUV2TldOMVVB?=
 =?utf-8?B?RVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 23365c71-652d-4582-d29e-08dabd3b5c42
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 01:33:07.6356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eAUC3WtgTr6nqPxnWIky8tZfaJw/f639c+Q7vkH3hhh6rvIqqjU4AqQnrUi0qdbPd1Zj7IUjlbRq27ainULGDiBluwmUVc2HTX5MXcEYo1o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6706
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

On 11/2/2022 07:20, Tvrtko Ursulin wrote:
> On 02/11/2022 12:12, Jani Nikula wrote:
>> On Tue, 01 Nov 2022, John.C.Harrison@Intel.com wrote:
>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>> At the end of each test, IGT does a drop caches call via sysfs with
>>
>> sysfs?
Sorry, that was meant to say debugfs. I've also been working on some 
sysfs IGT issues and evidently got my wires crossed!

>>
>>> special flags set. One of the possible paths waits for idle with an
>>> infinite timeout. That causes problems for debugging issues when CI
>>> catches a "can't go idle" test failure. Best case, the CI system times
>>> out (after 90s), attempts a bunch of state dump actions and then
>>> reboots the system to recover it. Worst case, the CI system can't do
>>> anything at all and then times out (after 1000s) and simply reboots.
>>> Sometimes a serial port log of dmesg might be available, sometimes not.
>>>
>>> So rather than making life hard for ourselves, change the timeout to
>>> be 10s rather than infinite. Also, trigger the standard
>>> wedge/reset/recover sequence so that testing can continue with a
>>> working system (if possible).
>>>
>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/i915_debugfs.c | 7 ++++++-
>>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c 
>>> b/drivers/gpu/drm/i915/i915_debugfs.c
>>> index ae987e92251dd..9d916fbbfc27c 100644
>>> --- a/drivers/gpu/drm/i915/i915_debugfs.c
>>> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
>>> @@ -641,6 +641,9 @@ DEFINE_SIMPLE_ATTRIBUTE(i915_perf_noa_delay_fops,
>>>             DROP_RESET_ACTIVE | \
>>>             DROP_RESET_SEQNO | \
>>>             DROP_RCU)
>>> +
>>> +#define DROP_IDLE_TIMEOUT    (HZ * 10)
>>
>> I915_IDLE_ENGINES_TIMEOUT is defined in i915_drv.h. It's also only used
>> here.
>
> So move here, dropping i915 prefix, next to the newly proposed one?
Sure, can do that.

>
>> I915_GEM_IDLE_TIMEOUT is defined in i915_gem.h. It's only used in
>> gt/intel_gt.c.
>
> Move there and rename to GT_IDLE_TIMEOUT?
>
>> I915_GT_SUSPEND_IDLE_TIMEOUT is defined and used only in intel_gt_pm.c.
>
> No action needed, maybe drop i915 prefix if wanted.
>
These two are totally unrelated and in code not being touched by this 
change. I would rather not conflate changing random other things with 
fixing this specific issue.

>> I915_IDLE_ENGINES_TIMEOUT is in ms, the rest are in jiffies.
>
> Add _MS suffix if wanted.
>
>> My head spins.
>
> I follow and raise that the newly proposed DROP_IDLE_TIMEOUT applies 
> to DROP_ACTIVE and not only DROP_IDLE.
My original intention for the name was that is the 'drop caches timeout 
for intel_gt_wait_for_idle'. Which is quite the mouthful and hence 
abbreviated to DROP_IDLE_TIMEOUT. But yes, I realised later that name 
can be conflated with the DROP_IDLE flag. Will rename.


>
> Things get refactored, code moves around, bits get left behind, who 
> knows. No reason to get too worked up. :) As long as people are taking 
> a wider view when touching the code base, and are not afraid to send 
> cleanups, things should be good.
On the other hand, if every patch gets blocked in code review because 
someone points out some completely unrelated piece of code could be a 
bit better then nothing ever gets fixed. If you spot something that you 
think should be improved, isn't the general idea that you should post a 
patch yourself to improve it?


>
> For the actual functional change at hand - it would be nice if code 
> paths in question could handle SIGINT and then we could punt the 
> decision on how long someone wants to wait purely to userspace. But 
> it's probably hard and it's only debugfs so whatever.
>
The code paths in question will already abort on a signal won't they? 
Both intel_gt_wait_for_idle() and intel_guc_wait_for_pending_msg(), 
which is where the uc_wait_for_idle eventually ends up, have an 
'if(signal_pending) return -EINTR;' check. Beyond that, it sounds like 
what you are asking for is a change in the IGT libraries and/or CI 
framework to start sending signals after some specific timeout. That 
seems like a significantly more complex change (in terms of the number 
of entities affected and number of groups involved) and unnecessary.

> Whether or not 10s is enough CI will hopefully tell us. I'd probably 
> err on the side of safety and make it longer, but at most half from 
> the test runner timeout.
This is supposed to be test clean up. This is not about how long a 
particular test takes to complete but about how long it takes to declare 
the system broken after the test has already finished. I would argue 
that even 10s is massively longer than required.

>
> I am not convinced that wedging is correct though. Conceptually could 
> be just that the timeout is too short. What does wedging really give 
> us, on top of limiting the wait, when latter AFAIU is the key factor 
> which would prevent the need to reboot the machine?
>
It gives us a system that knows what state it is in. If we can't idle 
the GT then something is very badly wrong. Wedging indicates that. It 
also ensure that a full GT reset will be attempted before the next test 
is run. Helping to prevent a failure on test X from propagating into 
failures of unrelated tests X+1, X+2, ... And if the GT reset does not 
work because the system is really that badly broken then future tests 
will not run rather than report erroneous failures.

This is not about getting a more stable system for end users by sweeping 
issues under the carpet and pretending all is well. End users don't run 
IGTs or explicitly call dodgy debugfs entry points. The sole motivation 
here is to get more accurate results from CI. That is, correctly 
identifying which test has hit a problem, getting valid debug analysis 
for that test (logs and such) and allowing further testing to complete 
correctly in the case where the system can be recovered.

John.

> Regards,
>
> Tvrtko

