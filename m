Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5680342CFBC
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 02:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A633E6EC11;
	Thu, 14 Oct 2021 00:57:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE966E893;
 Thu, 14 Oct 2021 00:57:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="251002720"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="251002720"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 17:57:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="659765709"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga005.jf.intel.com with ESMTP; 13 Oct 2021 17:57:33 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 13 Oct 2021 17:57:33 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 13 Oct 2021 17:57:32 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 13 Oct 2021 17:57:32 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 13 Oct 2021 17:57:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FLKGBwidm4bDvtjIvPl68u4cKJnBpfe9qPhUS5SVWJ8K7ytx+7XKYslcd4QWZcJJ/ntTM0re4BifeGyM7/6QJzkDKW6h5fs3wjhHgGqKurIMksY0Kh6w7fQVqoyyjVO+Jh/W1Yfb3YFJCJP4D2S/mS0hbvd6/iyP4gbytc5gtPWOV3g17F59u9tAKeHkNpX9f9E6UEBIdr246D7UaEgL6/ssA3WrtP2kBfjV2oJmej5eW8OhIN7Ht40vw96ScggOZUlp5vkaYyFHEKD6+DQAeD0DUJnUVzYl/rKiCsPC01SKmTMNBAx4x9Ytyco8Wb7od8tCj07/pXRHQHRK2sFrtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S2jXpAQ2NKQlM1K63FJqlJSIFy6E4rphYlJd45eX8qo=;
 b=gqBIQEwIvfygWTrxw/8Ar1nKxWg3u6LZDHvkDoKBj3Y8fVw83pi842gXIEMvhAFr0cciAHlicmJoaCMRylQ+wxX8WfBFK7SMEhH0ADnhaILLi8K6HjSeJacnhcr2xAgaZDbay5siZ1HXlCTEscJ49B08KMHw1qXUDBpnFYfpHClO+C0M3jK3KRW25Sh9WtVmazyMiSuVtOoDJbsVHkpDtnlG1SzlvtnmQCUXzn1P1ep5MRzT+rsHtWDQH1mF5EWt0M0xLMi3Hx5Z4pD9JdpFyvOrJzWjyrim9/yzTIWYDkpkaLadOdB6wlZ8C+w1RJTLciecSvb6biQBPQ43MzRSjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S2jXpAQ2NKQlM1K63FJqlJSIFy6E4rphYlJd45eX8qo=;
 b=jBngHGFSAOcTe6XuwdlmEqKzqzUTsYgYNQW9SWRCEx5YprnTrkfok5HJas2sC32R7SCMeqexcM3mT2wjKgWRxIOxwzgkdJrZmso0zEulF9bnRdTMee7WJIMg7lJ1Y9dRtJRWi0DtJm5xjtwE6Tkwa8syvczQ7E4hug0oNll3yQw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5673.namprd11.prod.outlook.com (2603:10b6:510:d6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Thu, 14 Oct
 2021 00:57:29 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%8]) with mapi id 15.20.4587.026; Thu, 14 Oct 2021
 00:57:29 +0000
Subject: Re: [PATCH 21/25] drm/i915/guc: Handle errors in multi-lrc requests
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20211013204231.19287-1-matthew.brost@intel.com>
 <20211013204231.19287-22-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <4e9962a0-b4c8-5871-1cb7-2fa8f4bcd366@intel.com>
Date: Wed, 13 Oct 2021 17:57:27 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20211013204231.19287-22-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MWHPR14CA0006.namprd14.prod.outlook.com
 (2603:10b6:300:ae::16) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 MWHPR14CA0006.namprd14.prod.outlook.com (2603:10b6:300:ae::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Thu, 14 Oct 2021 00:57:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db0b9667-55af-4b8e-c6f4-08d98ead9900
X-MS-TrafficTypeDiagnostic: PH0PR11MB5673:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB567360860C41499740FAE21CBDB89@PH0PR11MB5673.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aYLQTeKiEB6LI6RqcaX8xT7LG9ajRGY5/XD07+P0ky01iaJ7tSw2CnlcTNeD5HdTV1F+kWiyz0NBkBM5U8v+NI+rhF3mFoCcOyi4JD26L8FiCT8Pbufe1mETErSXonapUB31duH8SjSLMQ2+NlMay/XrRYkcPjxH8Q1ZZ50f1R8W8voA8ztzRBwVbU+7f0Jd97gV245UU4WDJ3ab+clapYwWXnJNTUj+6fS8mwXEx0HrEOFON/x3oeT9PmubENezZCvM3wEm07NM24o8uYPQh7oN1sUzO/Wv9crvF8iU+geP0gYlnj+jgEZN74RfyZeXY6AFarVnYBqSd4uriSB+uLe2YDN65tG4qRqICoZTuHAAewKeYnE4ya9P0mOlZybr3Yrp1+zZ3lDruGCDJWxkkefNLJxZqodpeMTl+ANJSyXqJWU4m5krwS0R7s9QHj2Jur2Noi6kedPdVZorHJZtFEHBLc8rsRbpu77p6jgHUqz5v1v516RLtvLxUImaY37cbRC5yOpqP9+QSwAZeg4XUYSvj0Suho+tdKU03LR2JHICis6Oy3Rlta9RPJuOiNzSNmhe0DF/rlbm7q5W2z2pmBmiMwOxaqGL0pZZjWrv7iAnapJt/YVz6tDXjIyQ1O4cGdwkecustIWuufhlCpsHTIB6fdEGORsdGtdS9vpxzk5TAXHvVnWXwSj7Ugj64+wgZkpbOZ9MaA6D8c1/PB3y/pi4R6EI6J5e4vSXaTFLzV3XgyFVvryhTeYIoqy6dB5e
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(82960400001)(16576012)(86362001)(508600001)(5660300002)(66476007)(450100002)(36756003)(6486002)(956004)(31696002)(2616005)(8936002)(316002)(186003)(8676002)(2906002)(31686004)(66556008)(66946007)(53546011)(26005)(83380400001)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a29nb1kra3h1dUVjbzhOa2VNRmVVV09ReVNTbzd6WEhyYS8xelJWdktoNlZL?=
 =?utf-8?B?NktqYllMVTFwYVNlTUpQY2VHNVRXRDlOMG9iQUFMTGhUTnZ3QVZMRmFRZDV5?=
 =?utf-8?B?N3NLSU5VR04vRHAreiswbFR2VmZJam1qdjdYMEQrZFZWaUwwdjNvWlBQSlpB?=
 =?utf-8?B?dmdDUEhiSjVzbVFwbUZEZ081WXJFdFJSYmEwMHJPTkdtTXh1RVdTZXRqNmh5?=
 =?utf-8?B?OHA1K0Vjdk9Od2grNzZBUkt0eHhhamM5TElhUXZEWHNRcjIvZitlRDQ1UUJ6?=
 =?utf-8?B?U3JHMXNONEp6R3BwWnBHeVF3VEdhMnM4bmZkby9NMHpIcklxSno3bDRsWlJK?=
 =?utf-8?B?U21GYVVKQTNLMThGR0dEbG1lYVFMZDhqVU9MeDkzRWhKbmcyV2NlUnUrTVRh?=
 =?utf-8?B?eXZNZEs5SzZ3R1lPdzVKYXV3WHVWNkdSK2JjZ0tWZHR6TDZrWHVPaEZXaVRB?=
 =?utf-8?B?cndWYWMvb1llclM1SVhwTVdZUDRITGhFMHo4akpSNU5Zdks0MzZKODFHeGZE?=
 =?utf-8?B?amwxRmdLdERMeWhVdGhPOVhRajMxWHVYb3lqNTlRSk44cUR4bVUvMU8xaDNU?=
 =?utf-8?B?ejRPOC9IYXZKMGFOdkFVTyttMmN2MVhIK0FzQXBTcUNwNnpWRjdXN1A3dDFY?=
 =?utf-8?B?YSswUkRFNGthdUsvbVU1YzJZUVRQQTNiTkdOUDJzT3BpVzdZVTF4TVJ1OXFY?=
 =?utf-8?B?TDJmS0ZXU2NjdWhNekdlSzdXSFB2ZWR0OHlYWlUvSEt2SGx1anhMNlRITkgr?=
 =?utf-8?B?cy9Wams5aFdnczV0cEhaYWdPNG9EZXpZVWI2WTNwa2llT0I5L1hnQVBLcnJi?=
 =?utf-8?B?MUdnblNtNmNHbTFpNHY4RUlrOW1UbDV2L2ViTnQvMFBmVzQ5TTZxWjlkSmxr?=
 =?utf-8?B?aDhxNGdvOEJmd1F3RVlCQkg5eXllQ0FrNnRIQ0VmdXlQU1BLZ2JCUVlIS1JC?=
 =?utf-8?B?VGkrVytMckhNUGd0UFZVbC96dnkrMHMwS1huMEtnQXJlU1AzUkRibHQvbEZ3?=
 =?utf-8?B?bm9OemtRSkhDNDJsTG1EVXZQcVFpZjU3MEZpcmNXdytEckN6U1ZMN21jeHRE?=
 =?utf-8?B?QjJuYjNPKy9paGNlZk9VTjBEOWFuVG5KcVQzZVFHVXQ5bmhxaG92VU1uQTkv?=
 =?utf-8?B?NExtd3k1c25yb2IzT2pMdUdXLzQ4eEdqVERGeWZlNWpHTU9iYVZNWlRabmRv?=
 =?utf-8?B?OVNIL2Uyck9qVWhTTG52NlhvTmo2K08rV09DMUpYc2VlY3QvN05GM3JFSTNi?=
 =?utf-8?B?Y09KWUFheEtDMkVtY285Vnd4S1BVUUlKNVo0eGVVckNUZzJqbUtEY2ZlejNu?=
 =?utf-8?B?RFdsT1JCWHlPU1RHKytPUzFiNXgwRW5nWGc5ckRWaGpmVUIrVC94d1JJTk9l?=
 =?utf-8?B?U2hhc01CSGR1TkkzRHcvRStwRW5sVlBHUjJUdUVjWHlWcVlWck05VzlHSlZE?=
 =?utf-8?B?dnpyeVZpb3VXZXREZGx3U3lzd1dnMWZxUlhZSGh5M1pPNXp4VnJOV1kza28v?=
 =?utf-8?B?QlMrT1F1WXVCVGl5MldtQWpBbW5haExQSEhkL2tCc2ZjQ0h6VU5admo1THlR?=
 =?utf-8?B?bjh4dmtBQ3VPbDdqL0lIczJUMVdOZlBSTWM3dGV4VjNabzF3RnVDQTA4VDhF?=
 =?utf-8?B?MmpiK2x2QUJNL0t3QWlsdTNJc0QyQzRHK1lhU3M1NUlNSTJtSXJPQTkwOThy?=
 =?utf-8?B?VklGZHNTaWNhL2EyektPdXpZUW0vcGlWbmxIL0tyWEZJcjVtTlZhSk9ESzJp?=
 =?utf-8?Q?y2neCQbY7Nzper3cTIfQTqyhrfNflgoiW8ecaWV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db0b9667-55af-4b8e-c6f4-08d98ead9900
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 00:57:29.8501 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mgAEdRnq4gZMGMiMWJbIPA8Rtv5i7bUvCkCK3s2OImabrqPFnJyBjjH/qPeApFmsKC8lkX9H4eaAWaQ2X5RHUwohu0GyABfuR53HCy0psKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5673
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

On 10/13/2021 13:42, Matthew Brost wrote:
> If an error occurs in the front end when multi-lrc requests are getting
> generated we need to skip these in the backend but we still need to
> emit the breadcrumbs seqno. An issues arises because with multi-lrc
> breadcrumbs there is a handshake between the parent and children to make
> forward progress. If all the requests are not present this handshake
> doesn't work. To work around this, if multi-lrc request has an error we
> skip the handshake but still emit the breadcrumbs seqno.
>
> v2:
>   (John Harrison)
>    - Add comment explaining the skipping of the handshake logic
>    - Fix typos in the commit message
> v3:
>   (John Harrison)
>    - Fix up some comments about the math to NOP the ring
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 69 ++++++++++++++++++-
>   1 file changed, 66 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index bfafe996e2d2..80d8ce68ff59 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -4076,8 +4076,8 @@ static int emit_bb_start_child_no_preempt_mid_batch(struct i915_request *rq,
>   }
>   
>   static u32 *
> -emit_fini_breadcrumb_parent_no_preempt_mid_batch(struct i915_request *rq,
> -						 u32 *cs)
> +__emit_fini_breadcrumb_parent_no_preempt_mid_batch(struct i915_request *rq,
> +						   u32 *cs)
>   {
>   	struct intel_context *ce = rq->context;
>   	u8 i;
> @@ -4105,6 +4105,45 @@ emit_fini_breadcrumb_parent_no_preempt_mid_batch(struct i915_request *rq,
>   				  get_children_go_addr(ce),
>   				  0);
>   
> +	return cs;
> +}
> +
> +/*
> + * If this true, a submission of multi-lrc requests had an error and the
> + * requests need to be skipped. The front end (execuf IOCTL) should've called
> + * i915_request_skip which squashes the BB but we still need to emit the fini
> + * breadrcrumbs seqno write. At this point we don't know how many of the
> + * requests in the multi-lrc submission were generated so we can't do the
> + * handshake between the parent and children (e.g. if 4 requests should be
> + * generated but 2nd hit an error only 1 would be seen by the GuC backend).
> + * Simply skip the handshake, but still emit the breadcrumbd seqno, if an error
> + * has occurred on any of the requests in submission / relationship.
> + */
> +static inline bool skip_handshake(struct i915_request *rq)
> +{
> +	return test_bit(I915_FENCE_FLAG_SKIP_PARALLEL, &rq->fence.flags);
> +}
> +
> +static u32 *
> +emit_fini_breadcrumb_parent_no_preempt_mid_batch(struct i915_request *rq,
> +						 u32 *cs)
> +{
> +	struct intel_context *ce = rq->context;
> +
> +	GEM_BUG_ON(!intel_context_is_parent(ce));
> +
> +	if (unlikely(skip_handshake(rq))) {
> +		/*
> +		 * NOP everything in __emit_fini_breadcrumb_parent_no_preempt_mid_batch,
> +		 * the -6 comes from the length of the emits below.
> +		 */
> +		memset(cs, 0, sizeof(u32) *
> +		       (ce->engine->emit_fini_breadcrumb_dw - 6));
> +		cs += ce->engine->emit_fini_breadcrumb_dw - 6;
> +	} else {
> +		cs = __emit_fini_breadcrumb_parent_no_preempt_mid_batch(rq, cs);
> +	}
> +
>   	/* Emit fini breadcrumb */
>   	cs = gen8_emit_ggtt_write(cs,
>   				  rq->fence.seqno,
> @@ -4121,7 +4160,8 @@ emit_fini_breadcrumb_parent_no_preempt_mid_batch(struct i915_request *rq,
>   }
>   
>   static u32 *
> -emit_fini_breadcrumb_child_no_preempt_mid_batch(struct i915_request *rq, u32 *cs)
> +__emit_fini_breadcrumb_child_no_preempt_mid_batch(struct i915_request *rq,
> +						  u32 *cs)
>   {
>   	struct intel_context *ce = rq->context;
>   	struct intel_context *parent = intel_context_to_parent(ce);
> @@ -4148,6 +4188,29 @@ emit_fini_breadcrumb_child_no_preempt_mid_batch(struct i915_request *rq, u32 *cs
>   	*cs++ = get_children_go_addr(parent);
>   	*cs++ = 0;
>   
> +	return cs;
> +}
> +
> +static u32 *
> +emit_fini_breadcrumb_child_no_preempt_mid_batch(struct i915_request *rq,
> +						u32 *cs)
> +{
> +	struct intel_context *ce = rq->context;
> +
> +	GEM_BUG_ON(!intel_context_is_child(ce));
> +
> +	if (unlikely(skip_handshake(rq))) {
> +		/*
> +		 * NOP everything in __emit_fini_breadcrumb_child_no_preempt_mid_batch,
> +		 * the -6 comes from the length of the emits below.
> +		 */
> +		memset(cs, 0, sizeof(u32) *
> +		       (ce->engine->emit_fini_breadcrumb_dw - 6));
> +		cs += ce->engine->emit_fini_breadcrumb_dw - 6;
> +	} else {
> +		cs = __emit_fini_breadcrumb_child_no_preempt_mid_batch(rq, cs);
> +	}
> +
>   	/* Emit fini breadcrumb */
>   	cs = gen8_emit_ggtt_write(cs,
>   				  rq->fence.seqno,

