Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0293F6D10
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 03:22:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B73F6E0F7;
	Wed, 25 Aug 2021 01:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E896E0F5;
 Wed, 25 Aug 2021 01:22:04 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="217432424"
X-IronPort-AV: E=Sophos;i="5.84,349,1620716400"; d="scan'208";a="217432424"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2021 18:22:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,349,1620716400"; d="scan'208";a="507833396"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga001.jf.intel.com with ESMTP; 24 Aug 2021 18:22:04 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 24 Aug 2021 18:22:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 24 Aug 2021 18:22:03 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 24 Aug 2021 18:22:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oAHd9fxGNfhGu7kTaBRtLG6hVB00mUQxHnpbzPXjGC9ToTTzRJ9cicGe2H7TP9+qXKsYVHKlCI09ilaUzXWnq8ojSbsWA8NhJZ4k1JchhkEMgVYdfGgDZiRq5rl4goFg1qgU+o4U/rzGLfE7B1u+Fu+VyJzM7G5hpX5v1MRbUUBTp1gNP+Wr2yJXyy5ZRS6BPT5EnIha/q7Y15sehe4f9VKU5n2piAtv2bEwMCvd1xwU5YXUE59SIu/mZeU9ddgYLVKD0oFbzor0+xL3/n+NdeespqVsy1TJG+8BigDkZKWNEXf6yd9kgXCvdpCsJejTXNvt5qf1pWYcfHpMuyF2TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rz3qIMnFGyWnY7vduxf3ECEjC8A6sAW7Vsr7L7ibXQg=;
 b=AolTuyho0T4pukeJ4isgTqmYlou1AJrWgOcOx0tkKIYCDfwgfDZKBlvcDOh2qduGmwxBvMOVnQzHJzwEDy/KhsMceFP7kqAX7zc0wrFMlBT7KIpF0kgyUFy/E8yHW+T9cvexSqwcDUFnFg6KYDnc/GFSdFYtWFPApU55lXJKYIAhCnzg1Mn5q/+X3TkSuilEoj2mM9vwOPjDfWNH6XY6Ngkx8Kuz9sLNgS3WEmNPYChM2Skf5qEXo9MT1GbR9W36lIlJUCmfhS+oZbTOHhjnzvWXSLzTuDt4d1gbj9KRo6Stgm6vyck3qmDPfvG9IZftc4E2CpEcjVUWbBXNtQen/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rz3qIMnFGyWnY7vduxf3ECEjC8A6sAW7Vsr7L7ibXQg=;
 b=wWDazplF5Jp15Ncm5Os72d/hImdYwuyL3nn8eMqjPxTb0ZhXM1z7VB7tKH4aGIzyUHaeeINWfTP8Y3t3F+zo4kDcP/UJSHnTjkSPRrSE9p/U+guZ+uayRxZW7q5rSrQrCh9O0k6aTard1H2IPqLkEtie+ZhqQNLfTEcH3IFDrWA=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5475.namprd11.prod.outlook.com (2603:10b6:610:d6::21)
 by CH0PR11MB5234.namprd11.prod.outlook.com (2603:10b6:610:e1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Wed, 25 Aug
 2021 01:21:56 +0000
Received: from CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::e5ff:a40e:c7d1:570e]) by CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::e5ff:a40e:c7d1:570e%9]) with mapi id 15.20.4457.017; Wed, 25 Aug 2021
 01:21:56 +0000
Subject: Re: [PATCH 13/27] drm/i915/guc: Take context ref when cancelling
 request
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <daniel.vetter@ffwll.ch>
References: <20210819061639.21051-1-matthew.brost@intel.com>
 <20210819061639.21051-14-matthew.brost@intel.com>
 <d25c1702-f529-8601-dd1c-ca0ac59d5f5b@intel.com>
 <20210824154241.GA9672@jons-linux-dev-box>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <deada6f9-ba3c-e976-3d22-1a1ff7d59e24@intel.com>
Date: Tue, 24 Aug 2021 18:21:54 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210824154241.GA9672@jons-linux-dev-box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: SJ0PR03CA0206.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::31) To CH0PR11MB5475.namprd11.prod.outlook.com
 (2603:10b6:610:d6::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.65] (99.72.232.53) by
 SJ0PR03CA0206.namprd03.prod.outlook.com (2603:10b6:a03:2ef::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Wed, 25 Aug 2021 01:21:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f0108b8-c78a-46b3-0f5d-08d96766babb
X-MS-TrafficTypeDiagnostic: CH0PR11MB5234:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH0PR11MB523465321CCA5AC6E206652EF4C69@CH0PR11MB5234.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2zBWoWJIPZHx1KYDmkR1q8T17NYjqe53OujXsrEwpWZo9/L0oHMADtVzpzSpx8DF0kQY1vq8M1yopNZoLA3cY4noRJZozvV6j5xVOjc3Vsd5bGPOQ/WWcev7WsIogHADBamTbZHWUt+6B8fLG6s0VsQ7Kv6q3gtOqdgpbTfdFXODdhiTaxE1GNVTUIknakFRqrjeEWueNByiWyWhf/T85Ra82SH837rXSHgCowYMxiWKyu/OT9F9uKW4tB9emyJ0WbZVbKv7cteHawiowM4Zv0es3zD1J9AAtloa0clBxHrnm4uIoH6VZrpIfTzETczhI/rVf+vFtwR4vJ4QDZ3HRY3HP6EAEw6K1/V13dNQ70ack/+PRY10CXGs9V3eV/fVygu26mwQK9brHovUwkgJcfn4mUP1R1BKdkuryIX/iZbG58fax1P8l29EJjbDtHl8BkOICcTxdrpePFfQ6wOqJWxth4gxQhCCFZrQb5J+0tHEMvXf300+IDCW3nA1pxh3nGc9wZQtJJGV6Hp4mqBUiAF3yId6xxZaVxtEYm2lUpWixwQsqtpE+qDoF3FuiAy7bFuzl5pDFVq59d59PVtTZkLe+SfYhI88NCT16q+wZ1xBxBvqMViCK2rSUAVgPvvvUPpiWI+bD39bwWLeRHTtsXMLwxFLzkSbx6Q9wx4G0P9bDogtRQeetYTvc6LpktjuBrCHURHhbS60KKSn+n/MMnmw/UIRIsFz8+lGqbu4i3c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5475.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(366004)(39860400002)(136003)(956004)(8676002)(31696002)(6862004)(6636002)(4326008)(36756003)(86362001)(2616005)(83380400001)(478600001)(38100700002)(37006003)(8936002)(31686004)(66556008)(66476007)(26005)(316002)(5660300002)(16576012)(2906002)(186003)(6486002)(53546011)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTYyczJMRHVTbFlOMzJUUTdNTE5TSC9VWFo1c0xaL2xnMlVjaGlYbk8xYkRp?=
 =?utf-8?B?a2xaVjdHWWtHeUJnbnlXQm9nOGdNOWEySHlQZ05PK1hOWUJyTXNacW96Yzli?=
 =?utf-8?B?MVgwbmpvSVcxWVRTbm14MWlnUEpSZStsaWZkSlo5RldXcFA1L1l4SDNHbU9k?=
 =?utf-8?B?a3RwNERFZ2UwcW03ZEp1Vm93QUgxaTA4ZzhnTmJreHpXb1BHaWFHRTVjWDgr?=
 =?utf-8?B?NCsvZ0wwaFcwdERiTTNkdFJpcnh6QVdxVnlYaXBZTERITDZmTHZzYmlqUDlF?=
 =?utf-8?B?Z1NVUzNlU3hoRDcxYXU4YjQ5cGk3aXJqbkcxQjU5eGZIaUZ6dVE5cE16R2Vz?=
 =?utf-8?B?MjRNNDFpckVQZ3NsSXVYNHlqUFBuYWRScDY4NzIwdGdjempzejhwNzJ3bVR4?=
 =?utf-8?B?ZHNCM1ppQkxFMk4zc0hxcnFLem1BRWVQd2ZDbUpPZWZWRE5mdEFVemV5a25Q?=
 =?utf-8?B?WjNLeExoK2RocEJob1BGeTdNbTBjT1YrTEZCVkovY0lYTy82cG4rQlI4Ym16?=
 =?utf-8?B?L1RjTnJXKzBIQkFTbWFwZzh4dWRVaDQ2c0lDazM0bk5WcERSbllZdEIxZTY3?=
 =?utf-8?B?K0prdmlFNHc3cnZ4V3pQdHcrVHd5U1lzOHpXWW10NjJ1cEZocDZxTzhIM05r?=
 =?utf-8?B?VVBNcUYzMVZGcllJUWNKVHZJTTI5MEFCT3k1TTNpUml5NWJXdHREQlhab3Fj?=
 =?utf-8?B?aE5QWFl1bGpLTGlKNEU4Mmo3L2YxMFpZTytwUlhnZktFai9iZXFhbmE3TGk1?=
 =?utf-8?B?cVlUOFFMWmFKMVlqazNnT3lyRUZCd3JZZ2J5ejVWV0MrWlAxM0NYZDlDeTQ0?=
 =?utf-8?B?STEvU2twcU56SG1jQlFyL0JsaG9ndFlWY3IrT1hObndFaGY5dVVXU1ptR0tw?=
 =?utf-8?B?N3Rva3dRaWwwYzFzWm1NU3V2emxSL2NUZGF5M3JLWmkzU2NpNG02NkJsVXA1?=
 =?utf-8?B?azVXdlR2WEN2TXVrUHBiSm44NDFXeVRXalBGMjBoZHNSVDd0U0pBVjFrZStZ?=
 =?utf-8?B?dTk5UlZaWmVtTFBRQWpud2pmVVNtUlh6aGlQVTZ0Q2xra3VaWlc2KzNwOXRl?=
 =?utf-8?B?OTBXSTlHL1hCWk1iTGRBSFFGVXhPSTNLam1LZUNLNDV0UkZKU2Z3WXhqVUdr?=
 =?utf-8?B?eTV0b1RrRXh3Q3Q3NUJFVlpPMWQrczVoZmxNSE03QVE4Z0FQYnpTMTgyTkV6?=
 =?utf-8?B?WG40RkVWemhjQk0vSGl5TE1CNjREdWRhb3luZktaSFdyeHY4SEZjWTB2V1RV?=
 =?utf-8?B?RzQvemxKdkdnYlY1b2RhOHR5R2Zlay91OFovMDc2ZXJoeXJzVDRBWTgwdEFC?=
 =?utf-8?B?M2U1cTdqeGw3WFhPRFg4ZWE2RHB3OEtGMWZkbzBEOW5GWjhXSGpuTWJ3bWpR?=
 =?utf-8?B?anc0ME05c0JVL0h2T1ZaMVZ2aGN0OE5Kc1QxOVRqVWZnWmtEYWx6WFlpY25K?=
 =?utf-8?B?bWVSQWkzdEVJZXladlZiN2RMTmx0ZGtKZm8rRzBkMEZVUmMyZlFSSE4rc1Er?=
 =?utf-8?B?RGI5UkRZMFFnWTR0U2lVSS9UcjZWbEZOb210NDFCWCs4NFdXZ1YzQWJQQTVT?=
 =?utf-8?B?aS82S3VyOHVpZ1RQaFdON0hsSTlJWWsvc1RlUnFNRnl2allYY1pyLzZtSGVt?=
 =?utf-8?B?TzR3ZDEwSHczQXArdjNEeUFtNWNuOFFISUx5c2pkSDVBNGVjWWdUejByN0lI?=
 =?utf-8?B?elpRUlRBSVNjanN6VUJIN041UVEwaDRKc2YxajJ4OXgvY0R5dS9xd2R5SzZt?=
 =?utf-8?Q?d0fjhxRj7ijHnbqBC6TzJkttd8oehp3ykt0By7Z?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f0108b8-c78a-46b3-0f5d-08d96766babb
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5475.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 01:21:56.8664 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KKE1w9Tsq03yHu81BWmlbnpWgQ6KA7Fp+uTp6Olg+6Q6WR20FkulV/HDykY2pDaP485zNlAXLHUqnw48O7c7ZImDo08LrI71Cv7rIDXUSqE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5234
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



On 8/24/2021 8:42 AM, Matthew Brost wrote:
> On Fri, Aug 20, 2021 at 05:07:27PM -0700, Daniele Ceraolo Spurio wrote:
>>
>> On 8/18/2021 11:16 PM, Matthew Brost wrote:
>>> A context can get destroyed after cancelling a request so take a
>>> reference to context when cancelling a request.
>> What's the exact race? AFAICS __i915_request_skip does not have a
>> context_put().
> This commit message isn't quite right, it is really a context reset or a
> GT reset which could result in the context getting destroyed. I haven't
> actually seen this happen but this just being paranoid about ref
> counting. Can fix up the commit message.

ok, with an updated commit message:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

>
> Matt
>
>> Daniele
>>
>>> Fixes: 62eaf0ae217d ("drm/i915/guc: Support request cancellation")
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 5 ++++-
>>>    1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> index e0e85e4ad512..85f96d325048 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> @@ -1620,8 +1620,10 @@ static void guc_context_cancel_request(struct intel_context *ce,
>>>    				       struct i915_request *rq)
>>>    {
>>>    	if (i915_sw_fence_signaled(&rq->submit)) {
>>> -		struct i915_sw_fence *fence = guc_context_block(ce);
>>> +		struct i915_sw_fence *fence;
>>> +		intel_context_get(ce);
>>> +		fence = guc_context_block(ce);
>>>    		i915_sw_fence_wait(fence);
>>>    		if (!i915_request_completed(rq)) {
>>>    			__i915_request_skip(rq);
>>> @@ -1636,6 +1638,7 @@ static void guc_context_cancel_request(struct intel_context *ce,
>>>    		flush_work(&ce_to_guc(ce)->ct.requests.worker);
>>>    		guc_context_unblock(ce);
>>> +		intel_context_put(ce);
>>>    	}
>>>    }

