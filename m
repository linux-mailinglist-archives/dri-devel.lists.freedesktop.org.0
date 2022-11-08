Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CE7621D7A
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 21:15:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CE0210E518;
	Tue,  8 Nov 2022 20:15:21 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DECB810E2BF;
 Tue,  8 Nov 2022 20:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667938514; x=1699474514;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gGRT7fonrELDkNtHPmjNWBT0OpN7hEQof5td0mf32rc=;
 b=Sonxfyiz6q5k1BKF8FOQC4PzQi2AaS/LohNqWZS5EkVoMmGFLWjC1auM
 tj0ZDIjHvrP+aq5JZXD/k+8srUJipjTbnIPCBRPoNULxr0RQLtdxpNOS3
 FCzI3mbef3VdLoF9iYe1tQMZBotSNYAWcdK6Tx4ClkQQcy7XBJ92GGC9x
 HXrgv1kALTHY3IZmqpke+KyjUScijS/GJ7bebfY8y/zLAjkXrwHMGauLJ
 mPXgNHmTozKSc/ufCyDKBq6spFNg3XxzhLgXNmi6rImA1WwcjcPfgz0uo
 6r6IlBRUK9CsKCNwMyZftBsVd6o+MiElKqhWrUGrWmTsT0CoSpyOAkT3m A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="311955816"
X-IronPort-AV: E=Sophos;i="5.96,148,1665471600"; d="scan'208";a="311955816"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2022 12:15:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="761621159"
X-IronPort-AV: E=Sophos;i="5.96,148,1665471600"; d="scan'208";a="761621159"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 08 Nov 2022 12:15:13 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 8 Nov 2022 12:15:13 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 8 Nov 2022 12:15:13 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 8 Nov 2022 12:15:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CLPKfnZjXeDhhvmYv70X12iKL4cSLP6I4bLjuK8SW/6UJzOl5zqQpR4iAnrlvaWIitPpGiGbdOlEoMGDDRPXQ+lgkabWBCVyVKI+qalK4JMrn7R/szImHMNhBD+4BmEbTIYaB9fy+1Dr+PuLMuo6D1WjGomJvCDkcBwlhYXyWBoG2q7NP6FNMIy88uHJkQhW6Rgvt8ALMhA91+kbeu8Zpp3xSLhgK3c/yiOij+q3Uzb/cTW8A1tk1huPp+1+V4zJYdGzEZAN/71doYGphKIvyliB7Bj7YmvjV7AWT12fCrndKByH1jiWLoeY6LkK6zcpYe6Vui59BNG+gG6X5FR6Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q9JlU8fxCXQ9kw66NWqxd6BpKpfr4BlqEetP9sPdrps=;
 b=oIb+xkJXnI4Jqc9yP0R8AZPlPdRIYzeA/Bh82Y4RJ4D5I3Sjx11NDi0pIxcTe8f1z/91EqMAg0tpoMEzfGYDaulLihZpr3trb0TVzzexOfFqluv7mXqJ068bSnzmHUgVnSLCOjAdyAPqjLGZd8wFbTm0lSrqO03iOnwvN/XVtcv/eLGUi6zqXcIGAJwLOYGg3XdBLh1KwN/ap+rhns/vie6Sc88ek+7vECFszQukKo/Sfz+he2nrM1PlN9iOMHd2mQKhZYWDLeog4kqkR5kWxN8sBp//r7AToI0idzLWpDVJzjih0xOK0PSFdWuFNPdqaldDPgVy/0t+pVqSiRp9pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by DM4PR11MB6549.namprd11.prod.outlook.com (2603:10b6:8:8e::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.27; Tue, 8 Nov 2022 20:15:10 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036%7]) with mapi id 15.20.5791.026; Tue, 8 Nov 2022
 20:15:10 +0000
Message-ID: <c9742b0f-546f-cccc-021a-7bad68410838@intel.com>
Date: Tue, 8 Nov 2022 12:15:08 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.1
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915/gt: Add GT oriented dmesg output
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20221104172525.569913-1-John.C.Harrison@Intel.com>
 <20221104172525.569913-2-John.C.Harrison@Intel.com>
 <6a4d1ac0-a1a0-e1d4-7d83-54b43d226371@intel.com>
 <fabaf9ee-f3fc-c18f-56b3-6d073618da41@linux.intel.com>
 <82055e8f-9bee-2b03-3dce-dcf66c30c903@linux.intel.com>
 <2583bccd-82fd-967a-aec9-e6d3837dbbed@intel.com>
 <1ad6bce7-9626-afa6-d73e-6d8f7a9c4d2a@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <1ad6bce7-9626-afa6-d73e-6d8f7a9c4d2a@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR10CA0014.namprd10.prod.outlook.com
 (2603:10b6:a03:255::19) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|DM4PR11MB6549:EE_
X-MS-Office365-Filtering-Correlation-Id: 44c51418-08e1-4096-a50f-08dac1c5effc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F737LmpkJZJXnRSlv+2iMHf30hnNJ1CpJ3Es1FL1adn0Js1QGgaaxPqNg8BAEE7QPWr+oWNlkvqUABd6yN/WIOPyn9RpRckAeWNh9ygBFvTJeLvLMm85GlRUrEep4jP4xYt/B3Jng8UnpBAnlbh3phD9n4Qvd+FvfSLSehW276fNJUH5mQBm+Kd+MvvvcRAuq+emH17CSQZR57ajA0Jbu28vMFt+XrHQ0JXaD6DCu5QHYA+faLcQ8cB3XgDtaEHETnp4XgMrPz3qs0l1ZFONY3HgR0i3jqXSAtoFP172eOk3eTwlDz4kpjV32g1sfX3nwpzazjjagHH70FYlfR2iBDLpDVArn90KuqnT8oHa2joluhxd8/cnf69YQe6O3ujEe5/asEJFg0IY1JGEIeJAxn+bb8qjscd3C4N4Ti3qd3nRzJgZtlTcUw7fId3df1oIq8rfnsnCp2CkJUQmerZzv09SBkeDmdtWIsMH4xkiBINy3A1X2VtKksYdlsi+G1VH+eohFIarV1NYQUwBseLl8jOiXRSiJ28cxk1QxJ37UjqVqZtfub/naSDtuqHsPQGJkcLMxGGs2RL2ZXgQRFEZmHUTB18ZWRArFUZMJYk4clF+vKssBHFeH6zo7V2xJ6sebi4RcwRhjQ3MG7Gps2VBUVLjxquwlatuZFSwTj480QnspOpI4Haifm1xMe9+NsBYYMciLAxnYp0hSXHQxL9Ym/DPfNja1Q/eCGdZkJ0OraGWl39dwQ5ij3e9RNpNH6mU7uvp+hlY5gBoCRsXWQRLjMFPRzcCKNTJW2AsqFTUIfELgGJJATju5qVjSotoIJFy0XYY/Z72QrDLvM1ksZ0TWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(39860400002)(376002)(136003)(396003)(366004)(451199015)(83380400001)(86362001)(31696002)(38100700002)(82960400001)(6486002)(478600001)(8936002)(66476007)(5660300002)(66556008)(8676002)(66946007)(4326008)(110136005)(54906003)(316002)(41300700001)(2616005)(26005)(53546011)(2906002)(186003)(6506007)(6512007)(36756003)(31686004)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckg3UUszZVN5OFhRVlZZUXkzUW9jS3diWmU4UUJsM2UyL25iTzRzT1hLckda?=
 =?utf-8?B?Y1R0a2RwK3E2THFJMnpCa2VVZ3hrRmk2dUZZWmUxRmFXdlE1elVlaGNWTXQ0?=
 =?utf-8?B?dGY2ZWJLcjhlK3RaQkpwTjJCRjhjeDBkMnY5L2d3QU8xUmRzZWxiQjEybVpV?=
 =?utf-8?B?UXordHJGQkdjS3A5a0RBWGdqOXc0a2lFZTlKSmR2S1Ivam9nZVY0MTBENitn?=
 =?utf-8?B?aGFxa3lqdnVFcmk1ck9qc243bk1WQzRoSkcxajNsSFFSZXh0V3NKWDY0ZW9y?=
 =?utf-8?B?RmZTcm5pZ3JLV2gvVXEyelA1TmFHa2RDQS9WOFNpWG9JM1U1d00vLzRteUhj?=
 =?utf-8?B?SWhla0lHdHpJTS92bmZHT1F4SW9hNW0xWDQ4Z1cwVzl2dGNCMytMWXZCREZF?=
 =?utf-8?B?bDFDeDl1Z0lYQ3lQMDFiZnZLd3lsRHV6V09JcjEyNVhjU1lqcHpGaXNxRjVE?=
 =?utf-8?B?UW9mZE9Xa2RMeExKbG5zNUhhMk0rOUl6VWpxK2kyQUlHcFIyb1FvUS9HeFFS?=
 =?utf-8?B?cGtDSDM5THJVSWszb3FkeDlzeG9FYm5WdDZ0ZkplNnV3SWFNZk9QM0Y1Y0pF?=
 =?utf-8?B?cjRBSFB3SE1tVVhLVTdhZ3Fwem94M0dLNy9vZXFzem5WMFEvTXV4T1FTTkZV?=
 =?utf-8?B?Y094RjVoUTltd3lndGFFZ1JUVm1DbVB5NitxRmRjbnRUeENoOHhpbEhKYzVN?=
 =?utf-8?B?QjhTWkg1RE9CQU44cFN3Nk9ORGRWeGRwUzJLbGxRa2lGRnBjYTlOK09OSjE2?=
 =?utf-8?B?YjBhb0pwdjRvWTZDakc0anB1ZXJXRktUQ2l2QlcxY25OU3lZQVEzUi9SMHFT?=
 =?utf-8?B?THo1bHRNVG5UVlhicC8rR3NtcFF6dlZiNDRkZHRqL01Ock92Tmo0aEsvU0Q1?=
 =?utf-8?B?WFB6emk0clhzR2RQM0NOdTBvSmczMUdkREJucVI3b3VydDlOUmxuYkVOSHRL?=
 =?utf-8?B?TVJSOGkyYUk2TlRGSDVWVHh0QS9CUHVSR242cUw0MFhSc2JwcU52dmJLSVFw?=
 =?utf-8?B?OFdUcVhlbnJUbWxxT2ZaMVVBSUZKaHhLa0lyZFpCMHEvOEZDcmpubEZwSFZq?=
 =?utf-8?B?RE1MVGI2Z3p0ZzBmT0pyUU81Qll1QXo5enBUNFZmM0tTQ2Q5YjhTMkl3bnpW?=
 =?utf-8?B?WThLRUVDMG1SS0pRc3ovUXNiY3QwSEQ2UHVrVFBVOHhaVVRIOEtMNURiT3F5?=
 =?utf-8?B?WUpNcUM3OVVvUDJrTFY5dkFDMFM2UFFSUmd5bnQ2TU43eTBPWnFxb2NSeGhq?=
 =?utf-8?B?dWpGejBoTjA5cWlWdXdKTnY5VE9TZy9naGx2dXdRd2NNVXFQSDFYaytLNHdL?=
 =?utf-8?B?ai9Fd05DaWdYMkdrNjNIVGZSRVU2OVdBOGZKelIvbHlVaisya3RmS3lQVTA4?=
 =?utf-8?B?bld4NHg3clgzWEJuZnlsQTVLdXF3ZUZ6Ym5RcVQ0Zk9vQ2lCTlB4S1RiWlN4?=
 =?utf-8?B?SUdKbjZTaFI3RS9vUFBRMGlTYUlQZndvWXVKYmNCTGFPVndybVh6ZHdwWmd6?=
 =?utf-8?B?a0ZiZkpPK1hHcFlOa3BBUzlGWU16SllaRGtEU0lXK2tZcW1FWUUrU3R4UWI5?=
 =?utf-8?B?T1BLNGhMZ1lrbzZXSU5TUDIzQlI2NklrYzRCZDRMK0JoMm9CdTM0eHZqY0NY?=
 =?utf-8?B?QWZRbVlmbGJKUmJvLzdEWUVqbjgwbDA5WlVEY2ZKT3VVeG9aVmx4ZzZYVytO?=
 =?utf-8?B?WGhyZnIycDdBdVVKUG05RlE1cXh4WVpvRFZCMEowR0twdjZkb1FWTFZYV0FP?=
 =?utf-8?B?VjNqRnNLbXY4TGY0alNMcG95aGZmWUI1YWoxd2VaQWlqTlozY1BSNFRhSy9R?=
 =?utf-8?B?SnpReUlzc3VuS3F5UnNoQ3NmWkNtWHdjMGRxdGhHZjV4cklwVm5pd1BoWm02?=
 =?utf-8?B?bGpVYVFuREJmNlR5aGdYcHZMZ1NoK1hoSzdJai9LR1pSTFpZTlFaSU4xWFNa?=
 =?utf-8?B?dWZ6NzVFTXpzUE5kbVQ3alIvQVYra3Z5VUdUU1NmY2ZtTkxHTnE2MHdsR2s3?=
 =?utf-8?B?SXM4RHlyT1lmSXBteDVDZnBEOWRRUEM1OGFSNnljdS94azBaZWltc21ERTRS?=
 =?utf-8?B?Qy90c2J6UnY4UGh5dmxXT3lmQk9LM2o1cHRDWlhJaHRzNFRWbWFnb1NqOXMv?=
 =?utf-8?B?WmxMcG9pR3AvcEtWRGtTTitkRE16a0JSVERLTGlGYUFlbXhNQjlBYXpoNFMr?=
 =?utf-8?B?Y2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44c51418-08e1-4096-a50f-08dac1c5effc
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 20:15:10.7563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gh7GhKHnMj36ocMPp1mN4CqtvfZUhBIKTTC9kexsGBCKGnWA+SOnHXEJFb2iBX6APso97bJL74dIJTTCXN0J/8ckE1ZGzqjmKqkLW8e+rMc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6549
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
Cc: DRI-Devel@Lists.FreeDesktop.Org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/8/2022 01:01, Tvrtko Ursulin wrote:
> On 07/11/2022 19:14, John Harrison wrote:
>> On 11/7/2022 08:17, Tvrtko Ursulin wrote:
>>> On 07/11/2022 09:33, Tvrtko Ursulin wrote:
>>>> On 05/11/2022 01:03, Ceraolo Spurio, Daniele wrote:
>>>>> On 11/4/2022 10:25 AM, John.C.Harrison@Intel.com wrote:
>>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>>
>>>>>> When trying to analyse bug reports from CI, customers, etc. it 
>>>>>> can be
>>>>>> difficult to work out exactly what is happening on which GT in a
>>>>>> multi-GT system. So add GT oriented debug/error message wrappers. If
>>>>>> used instead of the drm_ equivalents, you get the same output but 
>>>>>> with
>>>>>> a GT# prefix on it.
>>>>>>
>>>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>>>
>>>>> The only downside to this is that we'll print "GT0: " even on 
>>>>> single-GT devices. We could introduce a gt->info.name and print 
>>>>> that, so we could have it different per-platform, but IMO it's not 
>>>>> worth the effort.
>>>>>
>>>>> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>>>>
>>>>> I think it might be worth getting an ack from one of the 
>>>>> maintainers to make sure we're all aligned on transitioning to 
>>>>> these new logging macro for gt code.
>>>>
>>>> Idea is I think a very good one. First I would suggest 
>>>> standardising to lowercase GT in logs because:
>>>>
>>>> $ grep "GT%" i915/ -r
>>>> $ grep "gt%" i915/ -r
>>>> i915/gt/intel_gt_sysfs.c: gt->i915->sysfs_gt, "gt%d", gt->info.id))
>>>> i915/gt/intel_gt_sysfs.c:                "failed to initialize gt%d 
>>>> sysfs root\n", gt->info.id);
>>>> i915/gt/intel_gt_sysfs_pm.c:                     "failed to create 
>>>> gt%u RC6 sysfs files (%pe)\n",
>>>> i915/gt/intel_gt_sysfs_pm.c: "failed to create gt%u RC6p sysfs 
>>>> files (%pe)\n",
>>>> i915/gt/intel_gt_sysfs_pm.c:                     "failed to create 
>>>> gt%u RPS sysfs files (%pe)",
>>>> i915/gt/intel_gt_sysfs_pm.c:                     "failed to create 
>>>> gt%u punit_req_freq_mhz sysfs (%pe)",
>>>> i915/gt/intel_gt_sysfs_pm.c: "failed to create gt%u throttle sysfs 
>>>> files (%pe)",
>>>> i915/gt/intel_gt_sysfs_pm.c: "failed to create gt%u 
>>>> media_perf_power_attrs sysfs (%pe)\n",
>>>> i915/gt/intel_gt_sysfs_pm.c:                     "failed to add 
>>>> gt%u rps defaults (%pe)\n",
>>>> i915/i915_driver.c: drm_err(&gt->i915->drm, "gt%d: intel_pcode_init 
>>>> failed %d\n", id, ret);
>>>> i915/i915_hwmon.c:              snprintf(ddat_gt->name, 
>>>> sizeof(ddat_gt->name), "i915_gt%u", i);
>>>>
>>
>> Just because there are 11 existing instances of one form doesn't mean 
>> that the 275 instances that are waiting to be converted should be 
>> done incorrectly. GT is an acronym and should be capitalised.
>
> Okay just make it consistent then.
>
>> Besides:
>> grep -r "GT " i915 | grep '"'
>> i915/vlv_suspend.c:             drm_err(&i915->drm, "timeout 
>> disabling GT waking\n");
>> i915/vlv_suspend.c:                     "timeout waiting for GT wells 
>> to go %s\n",
>> i915/vlv_suspend.c:     drm_dbg(&i915->drm, "GT register access while 
>> GT waking disabled\n");
>> i915/i915_gpu_error.c:  err_printf(m, "GT awake: %s\n", 
>> str_yes_no(gt->awake));
>> i915/i915_debugfs.c:    seq_printf(m, "GT awake? %s [%d], %llums\n",
>> i915/selftests/i915_gem_evict.c: pr_err("Failed to idle GT (on %s)", 
>> engine->name);
>> i915/intel_uncore.c:                  "GT thread status wait timed 
>> out\n");
>> i915/gt/uc/selftest_guc_multi_lrc.c: drm_err(&gt->i915->drm, "GT 
>> failed to idle: %d\n", ret);
>> i915/gt/uc/selftest_guc.c: drm_err(&gt->i915->drm, "GT failed to 
>> idle: %d\n", ret);
>> i915/gt/uc/selftest_guc.c: drm_err(&gt->i915->drm, "GT failed to 
>> idle: %d\n", ret);
>> i915/gt/intel_gt_mcr.c: * Some GT registers are designed as 
>> "multicast" or "replicated" registers:
>> i915/gt/selftest_rps.c:                 pr_info("%s: rps counted %d 
>> C0 cycles [%lldns] in %lldns [%d cycles], using GT clock frequency of 
>> %uKHz\n",
>> i915/gt/selftest_hangcheck.c:                   pr_err("[%s] GT is 
>> wedged!\n", engine->name);
>> i915/gt/selftest_hangcheck.c:           pr_err("GT is wedged!\n");
>> i915/gt/intel_gt_clock_utils.c:                 "GT clock frequency 
>> changed, was %uHz, now %uHz!\n",
>> i915/gt/selftest_engine_pm.c:           pr_err("Unable to flush GT pm 
>> before test\n");
>> i915/gt/selftest_engine_pm.c: pr_err("GT failed to idle\n");
>> i915/i915_sysfs.c:                       "failed to register GT sysfs 
>> directory\n");
>> i915/intel_uncore.h:     * of the basic non-engine GT registers 
>> (referred to as "GSI" on
>> i915/intel_uncore.h:     * newer platforms, or "GT block" on older 
>> platforms)?  If so, we'll
>>
>>
>>
>>>> Then there is a question of naming. Are we okay with GT_XXX or, do 
>>>> we want intel_gt_, or something completely different. I don't have 
>>>> a strong opinion at the moment so I'll add some more folks to Cc.
>>>
>> You mean GT_ERR("msg") vs intel_gt_err("msg")? Personally, I would 
>> prefer just gt_err("msg") to keep it as close to the official drm_* 
>> versions as possible. Print lines tend to be excessively long 
>> already. Taking a 'gt' parameter instead of a '&gt->i915->drm' 
>> parameter does help with that but it seems like calling the wrapper 
>> intel_gt_* is shooting ourselves in the foot on that one. And GT_ERR 
>> vs gt_err just comes down to the fact that it is a macro wrapper and 
>> therefore is required to be in upper case.
>>
>>> There was a maintainer level mini-discussion on this topic which I 
>>> will try to summarise.
>>>
>>> Main contention point was the maintenance cost and generally an 
>>> undesirable pattern of needing to add many 
>>> subsystem/component/directory specific macros. Which then typically 
>>> need extra flavours and so on. But over verbosity of the 
>> How many versions are you expecting to add? Beyond the tile instance, 
>> what further addressing requirements are there? The card instance is 
>> already printed as part of the PCI address. The only other reason to 
>> add per component wrappers would be to wrap the mechanism for getting 
>> from some random per component object back to the intel_gt structure. 
>> But that is hardware a new issue being added by this wrapper. It is 
>> also not a requirement. Much of the code has a gt pointer already. 
>> For the parts that don't, some of it would be a trivial engine->gt 
>> type dereference, some of it is a more complex container_of type 
>> construction. But for those, the given file will already have 
>> multiple instances of that already (usually as the first or second 
>> line of the function - 'intel_gt *gt = fancy_access_method(my_obj)' 
>> so adding one or two more of those as necessary is not making the 
>> code harder to read.
>>
>>> code is obviously also bad, so one compromise idea was to add a 
>>> macro which builds the GT string and use drm logging helpers 
>>> directly. This would be something like:
>>>
>>>  drm_err(GT_LOG("something went wrong ret=%d\n", gt), ret);
>>>  drm_info(GT_LOG(...same...));
>> Seriously? As above, some of these lines are already way too long, 
>> this version makes them even longer with no obvious benefit. Worse, 
>> it makes it harder to read what is going on. It is much less 
>> intuitive to read than just replacing the drm_err itself. And having 
>> two sets of parenthesis with some parameters inside the first and 
>> some only inside the second is really horrid! Also, putting the 'gt' 
>> parameter in the middle just confuses it with the rest of the printf 
>> arguments even though there is no %d in the string for it. So now a 
>> quick glances tells you that your code is wrong because you have 
>> three format specifiers but four parameters.
>>
>> Whereas, just replacing drm_err with gt_err (or GT_ERR or 
>> intel_gt_err) keeps everything else consistent. The first parameter 
>> changes from 'drm' to 'gt' but is still the master object parameter 
>> and it matches the function/macro prefix so inherently looks correct. 
>> Then you have your message plus parameters. No confusing orders, no 
>> confusing parenthesis, no excessive macro levels, no confusion at 
>> all. Just nice simple, easy to read, easy to maintain code.
>
> I am personally okay with gt_err/GT_ERR some other folks might object 
> though. And I can also understand the argument why it is better to not 
> have to define gt_err, gt_warn, gt_info, gt_notice, gt_debug, 
> gt_err_ratelimited, gt_warn_once.. and instead have only one macro.
A small set of trivial macro definitions vs a complicated and unreadable 
construct on every single print? Erm, isn't that the very definition of 
abstracting to helpers as generally required by every code review ever?

And what 'other folks might object'? People already CC'd? People outside 
of i915?


>
> Because of that I was passing on to you the compromise option.
>
> It maybe still has net space savings since we wouldn't have to be 
> repeating the gt->i915->drm whatever and gt->info.id on every line.
>
> You are free to try the most compact one and see how hard those 
> objections will be.
Um. I already did. This patch. And you are the only person to have 
objected in any manner at all.

John.

>
>>> Whether or not to put the gt as parameter to the helper macro or 
>>> outside wasn't really decided upon. Anyway the macro would be adding 
>>> the magic "gt%u: " prefix, drm device and all.
>>>
>>> Also the name GT_LOG (or case) is just for illustration, that part 
>>> wasn't really discussed.
>>>
>>> If agreeable this pattern could then be used to consolidate some 
>>> other macros that we have. Although apart from CT_DEBUG/ERROR I 
>>> don't know if we have any others.
>> By consolidating as what? I hope you aren't meaning something like 
>> 'drm_err(CT_DEBUG(GT_LOG("msg")))?'
>
> No, consolidate as in use the same pattern of directly calling drm 
> logging helpers with our own formatting macro which changes per 
> subsystem/component/directory/whatever.
>
> Regards,
>
> Tvrtko

