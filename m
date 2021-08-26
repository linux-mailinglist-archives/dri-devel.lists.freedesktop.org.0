Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9652C3F7F5B
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 02:44:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D3686E440;
	Thu, 26 Aug 2021 00:44:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC2F56E43C;
 Thu, 26 Aug 2021 00:44:17 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10087"; a="217642151"
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; d="scan'208";a="217642151"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 17:44:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; d="scan'208";a="464944908"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga007.jf.intel.com with ESMTP; 25 Aug 2021 17:44:17 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 25 Aug 2021 17:44:16 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 25 Aug 2021 17:44:16 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Wed, 25 Aug 2021 17:44:16 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Wed, 25 Aug 2021 17:44:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ty2DoM4byTxuebiwZOP+mzHERvUmqyAlI26UtT5RYMUFtaKoa4drfWHXDp7VQmnTBT8abeX01BUDux8U7BAzhOYcYUs+W8FgfHbWtyLkdNQCaZtCWigmzKt9jlg/4MY6LEcSSLe5Rx+c3DmzKPptwyi7ttEydnQ1WKMKnKR3y819rdV6vVXTLeEnaLML7MqvVS03wsokIEj5AqWwFfWdQ2ZrCBqh8zrUCjOr03GKkWsWcVSebxRK4iJFle9REOa2dmKjf+yx6GobmswwqbfYRy/dRJcY/o3WOC38Lp+5tKpE6eOs3euGIYV7D3K39a63y/0LlacP89hzrbdNKSnduQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4RHzxQpp325UU9/y1dey7jA81t3W2cTpjxK4u1FV9JI=;
 b=HAe5ftcyRvb3rqFyyTC3oQRxOjfcGq7t0gTviBsZprZDAimzlWtwvtWt5Z3QI45y/JW7OPc1kzaQLA/QhnZOD7Ro9/nb+p5kNdw2+EhUdo+FjRQtqU6AJ5xjGDlzQal8PSs1f5fUNlCzB3X3Vyn+3m9ykop5GCpDLEFGrhRJwhQa9YT7rl1GNK/sc6SDWbsCs/8YU8XRBvpoWwSGRKfVaee5ZQ9mlyMZSuQBvWeGM542ATdDgnto57HsqgRGp6KEf8eEriHWIlcoilOiPwDJC/+hF+N+U7xukrQmKlUtHQ2cTpm72snWYbsnyrxIRsVGnkSNrP5eX88TZ3HKViwewQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4RHzxQpp325UU9/y1dey7jA81t3W2cTpjxK4u1FV9JI=;
 b=vvIxmumfOW4zaNUigVt/WjexEcCWbf0v5HfjIYbbBTH/scMheYuVyccph5LKdNQPDGHJwq7hXxOZFkjI0TYjBDjHpCrtgA3rUG7CE6QxwSxjkL/9G4KyBw5jptILFuG2kE6uBl6Og716uVXxbE2PboTGZ9iVC8WPfJER8BybKLA=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM5PR11MB1419.namprd11.prod.outlook.com (2603:10b6:3:c::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.22; Thu, 26 Aug 2021 00:44:14 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::450:6ab1:b0a:a165]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::450:6ab1:b0a:a165%7]) with mapi id 15.20.4457.019; Thu, 26 Aug 2021
 00:44:14 +0000
Subject: Re: [Intel-gfx] [PATCH 21/27] drm/i915/guc: Proper xarray usage for
 contexts_lookup
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniel.vetter@ffwll.ch>
References: <20210819061639.21051-1-matthew.brost@intel.com>
 <20210819061639.21051-22-matthew.brost@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <b0a58b7b-25bc-c76c-8b6c-41ae81c3e629@intel.com>
Date: Wed, 25 Aug 2021 17:44:11 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210819061639.21051-22-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: BYAPR06CA0023.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::36) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.65] (99.72.232.53) by
 BYAPR06CA0023.namprd06.prod.outlook.com (2603:10b6:a03:d4::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.18 via Frontend Transport; Thu, 26 Aug 2021 00:44:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7194b39-f6c7-4c3d-f891-08d9682aa08f
X-MS-TrafficTypeDiagnostic: DM5PR11MB1419:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR11MB14196232A5F84B641BAFE95AF4C79@DM5PR11MB1419.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wTob2+76fhY5xGUQF7u+/sEOuuRoH8AwdXcQxEw9o6ORb4I3b0t0s018N2cGU4+KfmJFOHk5f7mDssHEYPkDWMW9/c/XhQLdtjGZ8eW6AegTii6d+TDx735vlvApH+FYSOVikN5CouHH6DDu9a0UraPjXjrxG2nYzzZgZqNjow11BTOVjmV0RGEbvViWEuFW0BPQgiiNmJROfB/RmNxqdTTZEnXnXgXhFaOXzjpAjVqtGBArwQPjeQ/RW4ZhU9mUgygLanrSfrfaPm8g0So6OsjMDA0Wlnu//V4nuG0Y2mxE8ySXgo0Ekr6R9umYXo0Jkw7foXRSp18Uc22cWCZUVKjqck/g+X3JVTe0CsNzQFFCfRCwbJdWxLQjUzLyxK81nrSjv8kfiu3YQg9LC8ASwr8MqiBAP8tJ8GuGr0FDzEZM08KqgkY5eE+xMLGRoEaNkvXurvuK54+k8ZVKJKhAQGGnZk8XJCXMCeO5J8D9ECrhPSt3OJVnv2AGK0mjrk6flh3ghyzSEjCiBRto4LlzVFInID3I+dStsQ2r8EArW2r+ZM89p7CdHW/Od4EqWTctGOnXSMZqK+eNwqtuVhkd+8WQMPQC1HfQJGwGXhWL3baDFheAMB3dWfVumjQ9op8rtLy434eVdiuisbkVtOchYpdGCiCuyHqYpwS70X7Mi7C7VDvvybo1jQq/rSIaRDkBelgc03Cnkn0XPf27H9qiJmgTuB5D7qib8AhlluavUVQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(8936002)(31696002)(53546011)(478600001)(6486002)(66946007)(66476007)(66556008)(4326008)(38100700002)(2906002)(26005)(956004)(2616005)(36756003)(186003)(31686004)(16576012)(8676002)(5660300002)(316002)(86362001)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3Vwd3J0ZU0xaGVLMTQvbVdVZWlTVk1QOTAzMnFjZFNOaE1ybDRlQ0dURlR1?=
 =?utf-8?B?SDMrTExJTmxwZ05CTm9RZFNvaHdKVjFrUmtsYmRJbEQ2ZmNYdDVSYkptVzMz?=
 =?utf-8?B?UVQzWVlKYU1MeFozOGxCM2oyMkZRWjNnMmhOL2pjSVR4Q0dQME50WXpaaUNJ?=
 =?utf-8?B?b0FiODMwUkk5Z3BPQjhtNUoyMWF5T2w2bXRmV3NyUnJoVitzZGpIRVRtOGxY?=
 =?utf-8?B?L1BNZzdBemR2YWlZa2E3b0dNc09GUGlUbmYyNUhSaE1mYWt6MWhwNUlzYXgr?=
 =?utf-8?B?SlNYUk5RWTBIamJuMWplNzV6NHgvV0NZMlNqMk1JMkJWNFN3dEhtOVo1dWZL?=
 =?utf-8?B?Zjg2NlJNa2Z6NHhabmZRRXhST0R2bk5VMFRmZWpmYlhOZDhPUHUrQ0p2dnBx?=
 =?utf-8?B?NC9vL0thNG1obWZWdzNLM2ZIdyt4dU12Skw3SUFUT21nNTFRbVlNeWZWczlv?=
 =?utf-8?B?SlY5STg5R3ZtLyttV0pQSlVFOEFMVXJFbkdqOTFSRzJuWTV3ckovRjBtQmNm?=
 =?utf-8?B?K3FmbFk4T0lBWDFxNXdJRU5XY0prdmlSSXdpZGIybkk2SXh6czBtZnQ2Ri9N?=
 =?utf-8?B?RytIazhROGhOektrRnB2MFZFeU9jSlhPNzdScnk2dlNKQ3FSd2RzYStmWlRQ?=
 =?utf-8?B?eTZMa3MvUUZ1MGh6WExWYml1OXhyamd5em1kL3hreTlQclZWZU9SeUQvZnlC?=
 =?utf-8?B?TURHYnN2N2RnYnloZGlEMTV6bjR4dC9acDQ0WlZiMldYQ29TWnMvOXVmRGZu?=
 =?utf-8?B?VGM2R29hOUlqSGpiZytwdm9XeC9mZnk0ZUFtTFJ4M1FOZk04TStTdGpaY2pm?=
 =?utf-8?B?VmN3aG1TeGlmU1A3MEh3YjNKOTA0QkNkSkkzTnpqa3RHc0trd1NxcTE4UW83?=
 =?utf-8?B?cVN5ajAwSWF3MzJvSDBPYzJMZXBNR0g3Rm1lUXVyeit6MFNGT1p2T2pCUWZH?=
 =?utf-8?B?SEhSUXhhUHZxcUZlWUtXSG5GQk9Genl4ZlVyRkgxK05VU0t5Vmt0bUJtM2c1?=
 =?utf-8?B?cFpTeVhDMlpxWWlvYlgvcGY5UGt3WDdXQnVPcGU1WGhFbTJmakRRcXZoUVBN?=
 =?utf-8?B?MUsxREh4bTRma0NyVGRmSU44VU91bFN2MVJFMS82b01kNXl1eDNYd1FwNnVp?=
 =?utf-8?B?T3UxT05YK0JxWHJGZSs0b1hnKzA1dG9YcDhWRWZNZWt1L0VOUFJ6RjdFVVlQ?=
 =?utf-8?B?ZG5GazJFUHZ3ZHd0d0orbURKcFg1bS9BbEhDRWJLYjZQTlArUEFEbldkZWhX?=
 =?utf-8?B?dWZ1Zm40b0UvZmpVWlBBbjJjOC9QcGFWa1FJMG1hUGVaYmpGd1ZtM2s2alBp?=
 =?utf-8?B?SEJZYjFwSTA0Q2p2ZDZpb2tHaHBQWHJpZ2d0ZGVEVll4YzVqVjU1T1VveFRo?=
 =?utf-8?B?dElCdjV2bUF6Zk5La1p5U0pVU0tpYmRRNWJPVmxXSmIycHcwRElSd0ZGR3hs?=
 =?utf-8?B?QzF5Uk93NlhWeUlDblNDMFpWRWhXem5DRTlRZXlNaE05c3o1QWJuVnc5VVd0?=
 =?utf-8?B?MVhvMTVLOTNXeDRIaDg4RDNLKzd4aStNc3h3MncvSWhjSVQ5dCtKM2ViZ3dG?=
 =?utf-8?B?Si9Ick1PclhnQ3ZSaitPUUhyalFZTFV6UEhxU2tlWDkvbGZYb0Mybng3TVFX?=
 =?utf-8?B?RGdRb3hsSFk3MlVCWkVLc2ZNQkJTMHpXdnhoaWp4OFY0cXlHMXk3R1dPZ1Rh?=
 =?utf-8?B?UWt5SVgzRUhYNVdPb2c3QmVsQ3cvRjZrYk56bXhTVmlQSFlrUGRaZ2tRS0VY?=
 =?utf-8?Q?lXHYNqWK6vTm7QVXuAw4fFhCd2oEbxKLTkQCWfV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7194b39-f6c7-4c3d-f891-08d9682aa08f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 00:44:14.3371 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jHWszKlwfvsTa/pbAjubb33sliFzBCrWwPkxuDhW7xFsJM3LKeBfkFBaOLn6ZdIRTLMOehskP8iPMx1ahzwB5n2jHWnV1BNb1iPNG+DfOUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1419
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



On 8/18/2021 11:16 PM, Matthew Brost wrote:
> Lock the xarray and take ref to the context if needed.
>
> v2:
>   (Checkpatch)
>    - Add new line after declaration
>   (Daniel Vetter)
>    - Correct put / get accounting in xa_for_loops
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 103 +++++++++++++++---
>   1 file changed, 88 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 509b298e7cf3..5f77f25322ca 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -606,8 +606,18 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
>   	unsigned long index, flags;
>   	bool pending_disable, pending_enable, deregister, destroyed, banned;
>   
> +	xa_lock_irqsave(&guc->context_lookup, flags);
>   	xa_for_each(&guc->context_lookup, index, ce) {
> -		spin_lock_irqsave(&ce->guc_state.lock, flags);
> +		/*
> +		 * Corner case where the ref count on the object is zero but and
> +		 * deregister G2H was lost. In this case we don't touch the ref
> +		 * count and finish the destroy of the context.
> +		 */
> +		bool do_put = kref_get_unless_zero(&ce->ref);
> +
> +		xa_unlock(&guc->context_lookup);
> +
> +		spin_lock(&ce->guc_state.lock);
>   
>   		/*
>   		 * Once we are at this point submission_disabled() is guaranteed
> @@ -623,7 +633,9 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
>   		banned = context_banned(ce);
>   		init_sched_state(ce);
>   
> -		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> +		spin_unlock(&ce->guc_state.lock);
> +
> +		GEM_BUG_ON(!do_put && !destroyed);
>   
>   		if (pending_enable || destroyed || deregister) {
>   			decr_outstanding_submission_g2h(guc);
> @@ -646,13 +658,19 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
>   			}
>   			intel_context_sched_disable_unpin(ce);
>   			decr_outstanding_submission_g2h(guc);
> -			spin_lock_irqsave(&ce->guc_state.lock, flags);
> +
> +			spin_lock(&ce->guc_state.lock);
>   			guc_blocked_fence_complete(ce);
> -			spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> +			spin_unlock(&ce->guc_state.lock);
>   
>   			intel_context_put(ce);
>   		}
> +
> +		if (do_put)
> +			intel_context_put(ce);

is it safe to do the put outside the xa_lock, in case the refcount goes 
to zero with this? I know it is unlikely because the refcount was > 0 if 
do_put is true, but it might've gone down between us checking earlier 
and now.

> +		xa_lock(&guc->context_lookup);
>   	}
> +	xa_unlock_irqrestore(&guc->context_lookup, flags);
>   }
>   
>   static inline bool
> @@ -873,16 +891,29 @@ void intel_guc_submission_reset(struct intel_guc *guc, bool stalled)
>   {
>   	struct intel_context *ce;
>   	unsigned long index;
> +	unsigned long flags;
>   
>   	if (unlikely(!guc_submission_initialized(guc))) {
>   		/* Reset called during driver load? GuC not yet initialised! */
>   		return;
>   	}
>   
> -	xa_for_each(&guc->context_lookup, index, ce)
> +	xa_lock_irqsave(&guc->context_lookup, flags);
> +	xa_for_each(&guc->context_lookup, index, ce) {
> +		if (!kref_get_unless_zero(&ce->ref))
> +			continue;
> +
> +		xa_unlock(&guc->context_lookup);
> +
>   		if (intel_context_is_pinned(ce))
>   			__guc_reset_context(ce, stalled);
>   
> +		intel_context_put(ce);
> +
> +		xa_lock(&guc->context_lookup);
> +	}
> +	xa_unlock_irqrestore(&guc->context_lookup, flags);
> +
>   	/* GuC is blown away, drop all references to contexts */
>   	xa_destroy(&guc->context_lookup);
>   }
> @@ -957,11 +988,24 @@ void intel_guc_submission_cancel_requests(struct intel_guc *guc)
>   {
>   	struct intel_context *ce;
>   	unsigned long index;
> +	unsigned long flags;
> +
> +	xa_lock_irqsave(&guc->context_lookup, flags);
> +	xa_for_each(&guc->context_lookup, index, ce) {
> +		if (!kref_get_unless_zero(&ce->ref))
> +			continue;
> +
> +		xa_unlock(&guc->context_lookup);
>   
> -	xa_for_each(&guc->context_lookup, index, ce)
>   		if (intel_context_is_pinned(ce))
>   			guc_cancel_context_requests(ce);
>   
> +		intel_context_put(ce);
> +
> +		xa_lock(&guc->context_lookup);
> +	}
> +	xa_unlock_irqrestore(&guc->context_lookup, flags);
> +
>   	guc_cancel_sched_engine_requests(guc->sched_engine);
>   
>   	/* GuC is blown away, drop all references to contexts */
> @@ -2850,21 +2894,28 @@ void intel_guc_find_hung_context(struct intel_engine_cs *engine)
>   	struct intel_context *ce;
>   	struct i915_request *rq;
>   	unsigned long index;
> +	unsigned long flags;
>   
>   	/* Reset called during driver load? GuC not yet initialised! */
>   	if (unlikely(!guc_submission_initialized(guc)))
>   		return;
>   
> +	xa_lock_irqsave(&guc->context_lookup, flags);
>   	xa_for_each(&guc->context_lookup, index, ce) {
> -		if (!intel_context_is_pinned(ce))
> +		if (!kref_get_unless_zero(&ce->ref))
>   			continue;
>   
> +		xa_unlock(&guc->context_lookup);
> +
> +		if (!intel_context_is_pinned(ce))
> +			goto next;
> +
>   		if (intel_engine_is_virtual(ce->engine)) {
>   			if (!(ce->engine->mask & engine->mask))
> -				continue;
> +				goto next;
>   		} else {
>   			if (ce->engine != engine)
> -				continue;
> +				goto next;
>   		}
>   
>   		list_for_each_entry(rq, &ce->guc_active.requests, sched.link) {
> @@ -2874,9 +2925,17 @@ void intel_guc_find_hung_context(struct intel_engine_cs *engine)
>   			intel_engine_set_hung_context(engine, ce);
>   
>   			/* Can only cope with one hang at a time... */
> -			return;
> +			intel_context_put(ce);
> +			xa_lock(&guc->context_lookup);
> +			goto done;
>   		}
> +next:
> +		intel_context_put(ce);
> +		xa_lock(&guc->context_lookup);
> +

nit: extra newline

Daniele

>   	}
> +done:
> +	xa_unlock_irqrestore(&guc->context_lookup, flags);
>   }
>   
>   void intel_guc_dump_active_requests(struct intel_engine_cs *engine,
> @@ -2892,23 +2951,34 @@ void intel_guc_dump_active_requests(struct intel_engine_cs *engine,
>   	if (unlikely(!guc_submission_initialized(guc)))
>   		return;
>   
> +	xa_lock_irqsave(&guc->context_lookup, flags);
>   	xa_for_each(&guc->context_lookup, index, ce) {
> -		if (!intel_context_is_pinned(ce))
> +		if (!kref_get_unless_zero(&ce->ref))
>   			continue;
>   
> +		xa_unlock(&guc->context_lookup);
> +
> +		if (!intel_context_is_pinned(ce))
> +			goto next;
> +
>   		if (intel_engine_is_virtual(ce->engine)) {
>   			if (!(ce->engine->mask & engine->mask))
> -				continue;
> +				goto next;
>   		} else {
>   			if (ce->engine != engine)
> -				continue;
> +				goto next;
>   		}
>   
> -		spin_lock_irqsave(&ce->guc_active.lock, flags);
> +		spin_lock(&ce->guc_active.lock);
>   		intel_engine_dump_active_requests(&ce->guc_active.requests,
>   						  hung_rq, m);
> -		spin_unlock_irqrestore(&ce->guc_active.lock, flags);
> +		spin_unlock(&ce->guc_active.lock);
> +
> +next:
> +		intel_context_put(ce);
> +		xa_lock(&guc->context_lookup);
>   	}
> +	xa_unlock_irqrestore(&guc->context_lookup, flags);
>   }
>   
>   void intel_guc_submission_print_info(struct intel_guc *guc,
> @@ -2962,7 +3032,9 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
>   {
>   	struct intel_context *ce;
>   	unsigned long index;
> +	unsigned long flags;
>   
> +	xa_lock_irqsave(&guc->context_lookup, flags);
>   	xa_for_each(&guc->context_lookup, index, ce) {
>   		drm_printf(p, "GuC lrc descriptor %u:\n", ce->guc_id);
>   		drm_printf(p, "\tHW Context Desc: 0x%08x\n", ce->lrc.lrca);
> @@ -2981,6 +3053,7 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
>   
>   		guc_log_context_priority(p, ce);
>   	}
> +	xa_unlock_irqrestore(&guc->context_lookup, flags);
>   }
>   
>   static struct intel_context *

