Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6150741CD86
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 22:45:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 255386E21C;
	Wed, 29 Sep 2021 20:45:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0AD56E215;
 Wed, 29 Sep 2021 20:45:18 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10122"; a="221835076"
X-IronPort-AV: E=Sophos;i="5.85,334,1624345200"; d="scan'208";a="221835076"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 13:44:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,334,1624345200"; d="scan'208";a="520964915"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga001.jf.intel.com with ESMTP; 29 Sep 2021 13:44:16 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 29 Sep 2021 13:44:16 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 29 Sep 2021 13:44:15 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 29 Sep 2021 13:44:15 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 29 Sep 2021 13:44:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ByMdHVyng3Qg75aC+6KAR6wE1oNWcOjw+BrjS+l2wDbmYIzDn68kGDLwAepsdKfdo7/LD8NFX1TuxPVknSVLUVdUXAJF5UK4UUgtucKHc+LEmvA2XcNsyz4obu7Qbet+Ph2ch3DOiDrKSwo8POWMQkIell/ILlFEcg5UC1Rni+eL1TgnlMeqsQi+2z3GfAU7HmOp0jotHEWV502W7C0I33mfJKCidNDf5kVVDajhLdPfhQPQN2CQdbCKuztIenJG6IeTrefwLS59q5PkEGE4vfFZWAqkgzHFb11dOPEIH68TWXmNp0kkO58FnOXtV8cxrujf/A6y7lDPkkclWeucIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Lc+XdEgVnIyEO8s58AsUowiJzGJuS7kgm6YDgflGm/U=;
 b=eL+52JiIfsi0dwFj9phmZX6AWK5/XkDS8irq+i9VtzQjKJC8QrTwBdX6gXPRvs7pCXO3M5V6u7egCNVFOMU6z+hkshVq6EE8ZXzVcWRj6FJLN15cOtV/f2fp+JJnHd4OWKxk0qWQ2DviOM2OHgteOYI/npY2RVRi95EIQwqdpl039o/hEGBYwwLIA96F3zDx/VNAowSZrw46Lj8LoL6RiGLmxdi3Wg42hJQRjQ6Xo1bVeL+DlJrsxerwcrvRU5qZ+mi7MaqQDAHLVpvKhQkf/6fDSKUIwV6u1DJ9Sf9Q0fKEYieu9FcQ+Lf0nXB/sa2sEFvzXYY94QJTcANiyGSZyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lc+XdEgVnIyEO8s58AsUowiJzGJuS7kgm6YDgflGm/U=;
 b=CFqD+coVJ42ujOqXmYDsNA3MhGuvQdJMl8CcUcpePiGa/Bj2au8TXhdXcWC8SMr8XHDHOs64Z1eEuMVNKcRNGy9+vw9FlnzsMezWALiXRFqxV1OAsZ/4D0kFigfj4O+B5AlaaO6htY9/Uf/2famx8QqmHXp4PkOn5J0jOj+lyB8=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5593.namprd11.prod.outlook.com (2603:10b6:510:e0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Wed, 29 Sep
 2021 20:44:14 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%7]) with mapi id 15.20.4566.014; Wed, 29 Sep 2021
 20:44:14 +0000
Subject: Re: [Intel-gfx] [PATCH 25/27] drm/i915/guc: Handle errors in
 multi-lrc requests
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniel.vetter@ffwll.ch>, <tony.ye@intel.com>, <zhengguo.xu@intel.com>
References: <20210820224446.30620-1-matthew.brost@intel.com>
 <20210820224446.30620-26-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <9c27ba5e-cf18-006f-b63a-908a863d52f7@intel.com>
Date: Wed, 29 Sep 2021 13:44:10 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20210820224446.30620-26-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MW4PR03CA0090.namprd03.prod.outlook.com
 (2603:10b6:303:b6::35) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.221] (73.157.192.58) by
 MW4PR03CA0090.namprd03.prod.outlook.com (2603:10b6:303:b6::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.15 via Frontend Transport; Wed, 29 Sep 2021 20:44:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59461940-5b55-4674-8f7b-08d98389e5df
X-MS-TrafficTypeDiagnostic: PH0PR11MB5593:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5593CA6EF55CC6640DFB32EFBDA99@PH0PR11MB5593.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cefcDXFJUQaNes8YWq6N0Ezt/O3ne45X1uwpGgMjaY4iADxt/nPjVK01vH40NQ9HjEpqgjn5Egdk8WN8pU9dG/FqGaSywmhGyaUBqBJeE7vJs57YWhpebbG3gNQ+aTg2X0ED+tdjvNHx+EKmXL4r5OIOCa6eMkoBiay7UvI0HvaqUvO/TJRz2maCJ9fElLQV/g2d5nTP1DpsjcvQTPW9EtGOLyq/5PCQT5uFceA+5p4CSW4x/WWZWjFoTlavdf7bFSkle2GLef9aG615fP6nkycCcudXxtgtVQleXo/pwYSffMWDyiuGRsRR1cLWLlkMuuWp2meU5gHa8YVoeAFfezxmZpzwPfMTtLNhudYNYcZBUCFStfFgWFfXv8/iJIHxf+/JLUNEntVKjC0sSD+OzO9nf2jmDfROOpobYMJlGK9Vzn6vYCO7ikToY/pd6qSFNjZ0cNDYCcvtpWYNUziuLgNGnB6U+OgbCyuDz9KChq4VEwi15hMk1dY8sbBuEfg/aiqc0K27uAk/o0CqlJuIjVarPNfrHiXf9paidsFIk2GUQYXLuraXvMnUdDeim9M3YgF8MuErATQM5cdhh2hl3xQFpZ1heFS7GG+I2M/Lpfc3fDLOu4rD199xxDHAUOxQ8fu8ZUVPSxUcQa4AV/cNCZSiI1fjTIrOoiTqCJzcv+ehe+HwVqoXDuFocjasJnqvgPD5co1do8FaCtZPMlGJG50VvfllSNHiB9RbViA2PYBcGn4aFMFaoko4M/1c0xpO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(956004)(16576012)(66476007)(316002)(107886003)(2616005)(508600001)(36756003)(66946007)(8936002)(31696002)(26005)(2906002)(86362001)(53546011)(5660300002)(4326008)(6486002)(83380400001)(8676002)(186003)(31686004)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUp6WVNJeDJ2RitObXJoYUlieVdlQkhlWnA3cXo5amc1YzMyZk5xUHJpc21V?=
 =?utf-8?B?RTc4UUNsYjFwbVRRZDQ3MkRjV0hlZUVxUVlKOVBGaGRDQ2htVXRla0hIVW5I?=
 =?utf-8?B?KzBJODA0UVkyRlB4cVJvaTNoUjB3Rkg5OEhMNjdJdlZzVjdPdWdwVC9QT1cw?=
 =?utf-8?B?YTZERzM3LzlmMGh1Sk9EeCthNHNsSXh2OWx2SFlidnVNTURsQ2NmVERJSmRt?=
 =?utf-8?B?RWp0L3JZQm0xNld1amMzTGxlNzZabHMxVEUySkZFUkIzNDIrWTQ5NDM2Z1NQ?=
 =?utf-8?B?c3VWbWcrcW15U05kSGNrR3dxUHlhRzk3MXVlNWpiWng5Snc0UzRpc2JZbEda?=
 =?utf-8?B?cnpGNGt4VlJSUnpZOXNLc0ZCQTZJRko1aFFLMFdIQmQrOXZIbS9vK2JndmRo?=
 =?utf-8?B?cGJwK3NXOGJnM3o3MWVVQkhaaUwzZExldi81Z0tZeGpZUTNkQW1nWGlnSXFi?=
 =?utf-8?B?NzQwWW5sdjdBTDVWMXNPem44T2hSMjhsVjFucjBCL0pGOVdvV3RLbXdGRHM3?=
 =?utf-8?B?MUtCUjRoSU5lY0swV0lET2t6QjRTelFwQzRWZ1RabnFEemprZXhlK2xIVGxr?=
 =?utf-8?B?R05FK1hETzVXb3pIZWtRNW1BalVLSnVHa3EvN0ZFSkRSRFFSS1Y4NjFlQk5o?=
 =?utf-8?B?UGpwVzBFSFlCbHpwY2lxcngzSW93bEdpdFQzdWNZVkNNVy8rZUtzZXhoQUdw?=
 =?utf-8?B?WXppaFZ4QitWbGNRcjIvNkt0dzhjY012a05uRzlnKzFTTDdJZzFRUGhsK2RY?=
 =?utf-8?B?NEh3VURFUCsvTzI4N0lJa1RwUG12LzBpZFdveWpIWDErU0ZDdUlmd3MzMmdj?=
 =?utf-8?B?MVhFd3hoUmljaTUrZzhzVU5CRkNybzZCSmFaWE1FRzN3YytjaEs5RExpTnow?=
 =?utf-8?B?c1pJRkR3NmJoN0w1QVI5NGZ4dm1GQnNVZS9vdEIwRXJENE9lbmsyM1QrR1h6?=
 =?utf-8?B?WTMwWnNLRmU1OUZ1eXJlN0dMVm5pYTY2QU10cEpnK3BQN3JsY25ldzgvV0FS?=
 =?utf-8?B?aVJ6RGt0Yk5DT2w4WHlweUhqQ0FkRURuVGFPaEN2bDZQVnlRWjZhY2M2cXU1?=
 =?utf-8?B?ZGp1aGZ5VzJrYktrTTNwdDFIcm1jL2pOeU5xQ0JTTXhBcTR4aVhzR3RWUU80?=
 =?utf-8?B?d3JPSVVVMmlvb2ZzTXZYNHBIa0RHSXBIZ0M0OTl0OGdPT3hiazJGRFRPd0JM?=
 =?utf-8?B?M0dQcldlc3ZBQndQWGIwSHQ4UW5uNml6UEVCL21lcE1EYWdMdUpDWUZXVWtl?=
 =?utf-8?B?V3lJNTEzbjNieGpBM3lkS3J3aU1FR3NXbW1zL3Q1amJXTkpMM1BzaXJ2Tkpk?=
 =?utf-8?B?T1RNbnE1MjFud0dNaCtUQzVDYWFFR1NWL213ZVozclVpWXlHU2w0TXFPYklM?=
 =?utf-8?B?aDhHRm5Bbm8yYkJVUmpvTFY0TjVqV0NaRUh2cnBjcVlPQ2tKZjhFN05JeXhC?=
 =?utf-8?B?a1V4dzB5WnBCdi9BblVJaktoMFFMVnMwMTJLc2hrU1UvMnYwSzdpSXdxUW1t?=
 =?utf-8?B?VUpHTmZYTk5TTHZVY2cwZkJjSVY1cUNBNEprZDYwWDRscEt6NExZRTJ1Q201?=
 =?utf-8?B?TkJ6cXVXSTE2S2Y1Zjk0Z2RmWGtmdXlqOTYySkVYUWNFMENyTVhYNTJvakRE?=
 =?utf-8?B?YTRjL3ozYmlNWmlhdnRoNkZlY3pvdE41Rm1yRWdCN1lkUU02bUl6eStwNmhq?=
 =?utf-8?B?UkMraThEVnNkbDRvRVlpRjcveGRjSWN6WkpZcGo3ZmwzSjU1ZFJKdTRaalBm?=
 =?utf-8?Q?W9nppk+R9w6A9FOpm4EpvIHIrv0vQk22gKXA80O?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 59461940-5b55-4674-8f7b-08d98389e5df
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 20:44:14.1152 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0vNLA5mtU6loQDuXoGhgESKrJhvwQqMrZYyfzESF56Cjb5IuwAkhahUuQNyi8vNKx+GjZz1q9sd12br7FLCQoFSFxkWPTi0b0ks4K7nPT5s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5593
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

On 8/20/2021 15:44, Matthew Brost wrote:
> If an error occurs in the front end when multi-lrc requests are getting
> generated we need to skip these in the backend but we still need to
> emit the breadcrumbs seqno. An issues arrises because with multi-lrc
arrises -> arises

> breadcrumbs there is a handshake between the parent and children to make
> forwad progress. If all the requests are not present this handshake
forwad -> forward

> doesn't work. To work around this, if multi-lrc request has an error we
> skip the handshake but still emit the breadcrumbs seqno.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 61 ++++++++++++++++++-
>   1 file changed, 58 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 2ef38557b0f0..61e737fd1eee 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -3546,8 +3546,8 @@ static int emit_bb_start_child_no_preempt_mid_batch(struct i915_request *rq,
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
> @@ -3575,6 +3575,41 @@ emit_fini_breadcrumb_parent_no_preempt_mid_batch(struct i915_request *rq,
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
> +		memset(cs, 0, sizeof(u32) *
> +		       (ce->engine->emit_fini_breadcrumb_dw - 6));
> +		cs += ce->engine->emit_fini_breadcrumb_dw - 6;
Why -6? There are 12 words about to be written. Indeed the value of 
emit_..._dw is '12 + 4*num_children'. This should only be skipping over 
the 4*children, right? As it stands, it will skip all but the last six 
words, then write an extra twelve words and thus overflow the 
reservation by six. Unless I am totally confused?

I assume there is some reason why the amount of data written must 
exactly match the space reserved? It's a while since I've looked at the 
ring buffer code!

Seems like it would be clearer to not split the semaphore writes out but 
have them right next to the skip code that is meant to replicate them 
but with no-ops.

> +	} else {
> +		cs = __emit_fini_breadcrumb_parent_no_preempt_mid_batch(rq, cs);
> +	}
> +
>   	/* Emit fini breadcrumb */
>   	cs = gen8_emit_ggtt_write(cs,
>   				  rq->fence.seqno,
> @@ -3591,7 +3626,8 @@ emit_fini_breadcrumb_parent_no_preempt_mid_batch(struct i915_request *rq,
>   }
>   
>   static u32 *
> -emit_fini_breadcrumb_child_no_preempt_mid_batch(struct i915_request *rq, u32 *cs)
> +__emit_fini_breadcrumb_child_no_preempt_mid_batch(struct i915_request *rq,
> +						  u32 *cs)
>   {
>   	struct intel_context *ce = rq->context;
>   
> @@ -3617,6 +3653,25 @@ emit_fini_breadcrumb_child_no_preempt_mid_batch(struct i915_request *rq, u32 *cs
>   	*cs++ = get_children_go_addr(ce->parent);
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
> +		memset(cs, 0, sizeof(u32) *
> +		       (ce->engine->emit_fini_breadcrumb_dw - 6));
> +		cs += ce->engine->emit_fini_breadcrumb_dw - 6;
> +	} else {
> +		cs = __emit_fini_breadcrumb_child_no_preempt_mid_batch(rq, cs);
> +	}
Same points as above - why -6 not -12 and would be clearer to keep the 
no-ops and the writes adjacent.

John.

> +
>   	/* Emit fini breadcrumb */
>   	cs = gen8_emit_ggtt_write(cs,
>   				  rq->fence.seqno,

