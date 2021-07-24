Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C65673D440C
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jul 2021 02:47:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1416C6E8BF;
	Sat, 24 Jul 2021 00:47:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 966C26E8BF;
 Sat, 24 Jul 2021 00:47:52 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10054"; a="199234648"
X-IronPort-AV: E=Sophos;i="5.84,265,1620716400"; d="scan'208";a="199234648"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 17:47:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,265,1620716400"; d="scan'208";a="416000325"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP; 23 Jul 2021 17:47:51 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 23 Jul 2021 17:47:51 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Fri, 23 Jul 2021 17:47:51 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Fri, 23 Jul 2021 17:47:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B112kT8NeKWzAThl920No3chJWymzrNjAzoguA6a7zVdXE881gnQ5mnmiaSkFRTdybGYIB+ratiK/ouoDYZ9V6dyzyQ+jUEDEww+7LvWytHNCFy18FMXur2MlijCMNxM+PBZ3JZlP7pDjfsgjDIfZeAx/2yoQ+frO1Wr3lZeOVE3i/J31kZhCeopjH5uVIsYATGezuBN3oxZYRtTY8LKn4lHxzDmN2Vkw4illIfxdFfJB0OI6LBekGNWSbt5zJjXvt4TrIHQZCwmmzYX5sTCmc1JQCcLvur+ll4y5WYh/0psxz3mIDr78rggqCddtZv2ObNUZAqJvvyB3TLg5/aenQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DyK/jFBt2z6kANrkAKdXYLYJ1TmTl+VJVerEdXkgNDE=;
 b=aBOXVuR7nRbOxRjulBE8DUpQDn9kWfansBjhpsoQ6S9UxNLqRPcXzq/0cszjRZk11SPfF/IWkBmO9aSLfLAEl1Wy6DOxTBVQeMYjL72wSjjAwm2QT7KatCW1Q94uIhdbMS/k9+ZuhuoFGH7G50O4E9wYPImCzU+01W5dV12jCz49ad5gCzp3YJEgOXy0seWUQPzlblpZCmWAtTOLVTkLp7OnbjjELShVztc7RAOJDrQMBFEe1sPdHIpaMcMqU5NfiB0QE9kBrFQ/bf0rl29wE+YtVAVHGymbDvhUq91tHD560M93B49EPxRGIeYxs4Rq5eESHS0v/vFJbL69HeT3zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DyK/jFBt2z6kANrkAKdXYLYJ1TmTl+VJVerEdXkgNDE=;
 b=VK+6XqVBRCONGxJ+bGqXZVKmMYg4lMNUk5uwyJs7o8o54ZjVJS2GDs8RtBw5nofvE5eFhjinpkNX67I/OlauIrrid2EMJWk229GrVJmt7guLt23A33zEEpoE4yCqW9CaYGRRuPD6UT9G9wmRWTtbzUniuiAsYxODkRzjyiHTasw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM6PR11MB4674.namprd11.prod.outlook.com (2603:10b6:5:2a0::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.25; Sat, 24 Jul 2021 00:47:49 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4017:e7ce:ef66:48d7]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4017:e7ce:ef66:48d7%9]) with mapi id 15.20.4352.029; Sat, 24 Jul 2021
 00:47:49 +0000
Subject: Re: [Intel-gfx] [PATCH 01/33] drm/i915/guc: GuC virtual engines
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210722235426.31831-1-matthew.brost@intel.com>
 <20210722235426.31831-2-matthew.brost@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <9491cc8b-7406-a715-9542-792adc9dd9a6@intel.com>
Date: Fri, 23 Jul 2021 17:47:45 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <20210722235426.31831-2-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: MW4PR03CA0235.namprd03.prod.outlook.com
 (2603:10b6:303:b9::30) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.65] (99.72.232.53) by
 MW4PR03CA0235.namprd03.prod.outlook.com (2603:10b6:303:b9::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.25 via Frontend Transport; Sat, 24 Jul 2021 00:47:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62d0f0bc-f2a4-4507-5540-08d94e3ca8ec
X-MS-TrafficTypeDiagnostic: DM6PR11MB4674:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR11MB4674533A25B3DF4424F4B0C6F4E69@DM6PR11MB4674.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1qPv5dmkkzWmQcjdbfHcfUGPW5O/JTVtn4+Obriol4eJZi99TxKMnA6AgyqD41RufQ57Um5ZmG4xJAStvtjV18JB+8Luadvqh+g5u+TQe4EAHz+QjsCVJl8tudBrMSgMrqT/yH2e3U6b3TqZC3SdW4oCvaC1VCx+70o2+3vEgmHWYmvUwO7lNIIWQr+eSRFBGFACz9gjfpXjO9RB5oDGLeXHpTWhOr5cinjbo6SiP1QRtJCoJ0Iriiu5BkQw333FUkFIqSK763EQP4cZMQ6AZb6YZEGqn5NdRtJw7PuvAYFpE86LowPV9H5E5YnmnDrfRVY/zMu0heaNC91Mho66WO7UP4iwYreW2cizIg4cRY0/U9J4Rr0oZJDUC+Y2gvu3U38tACEYCMdmUiIF49lmWE8KiPNXRG+BuPC+K5hK0c+35SsBcJSzMvkfmNtbZjZA6Ka4RQXqTphX4SuWNhkxJ9evDtYn8d/W+MpFHa0LVWrQ9P6ad6Lhm+eMHTr+BKpbnyDYy+h6vogIRedOtI6b1LEUc2o6Eb4YHWEAGRKjafUYXuLtF+XRfaZ4pT5B8V6vwYVvNmxHYF8ycvkQjJSTzUxa8n0B94664hIYbZNx4CshZQZf112jnEmBNxlTSN45UBADnKPJKlN4MLzRX3UEgAcM9JKa8i/SXHb1SXune47sLaoeW3ArqWemTPigr/W9P5TNLTsStAY9rtUj8YDfW5zVUKib+mld0Jn6XCIbaxm5ctDgFbano1H5BDKsZHmdfbvvS6Tt40RUQut9g9KXiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(366004)(376002)(39860400002)(346002)(8676002)(30864003)(53546011)(26005)(450100002)(2906002)(5660300002)(36756003)(186003)(66946007)(478600001)(956004)(83380400001)(2616005)(6666004)(16576012)(316002)(31696002)(66556008)(86362001)(38100700002)(31686004)(66476007)(6486002)(8936002)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXA2dmtKQ2xpM3ZnMnZ4RlA4OU5zcXh2Mlp0cVhjRGkwUGNsZFZZcW1aVzd2?=
 =?utf-8?B?eWJjWUg2Z21PYi84aEVsNEd1L2FLNUc0RVdqejJrWitZTkJFUkVqWmx1dVpQ?=
 =?utf-8?B?bGd6blBFYzBNeDNuQWx6cFYzT0ovMmN2ZnlKTVBxam4va2NSUmYzdkM3c3BJ?=
 =?utf-8?B?emVjWUJFM3pjdFFmK3BFK0labzRtbUxRU1poQlhXT3A4ajVoakNpZTlCVHpq?=
 =?utf-8?B?UzhJeDV4UUVJaDR4Ym0rTFI2MFc0VmhVRThQVW5tWW55RDV6VkF4TWF3S1Vq?=
 =?utf-8?B?b2t5SllrWEJQVk9jNTdkVHpqQzhDaFJ2RHI1UkFUVE5waWZGK1FndHc4NHNk?=
 =?utf-8?B?b1phdmxoZ1E5ZjJpd0dXcWFGUnZ5TkxmbmxGd0lUNUh1QmpsZDlzNW5oT29q?=
 =?utf-8?B?QmdiTEljQUVlTTZkT2VESWt0dkpFMnB0cGN2Z1d0MU0yUEEzVmd4OWsxYVB2?=
 =?utf-8?B?SkVwOVJ2WmtITjF4bHltSklvUzBxdm5zeS9yM1ZRRVVJYlE3OWNWYnBFME96?=
 =?utf-8?B?clJtVDJ2S0ZoVG85T3VYWjNrMUpFNE5RYjMvektvUmtmL1M1YWNqNkpjdTdT?=
 =?utf-8?B?OUdWZDVjR1JwVDlSY1krWXo4WkJnNkZFY08wVDRGaEFuak1ybWJUeDBTS3hY?=
 =?utf-8?B?RERCYm1uUmlCNmFzMGJYY2hWY21MS1lIbUwyNW9UbkJVWklDSll6TVJMTzRq?=
 =?utf-8?B?b2gxNkd4djkzL0MwWTVlcU9iV1hUUGthVTFwQVZvelZqMXJ4L2U4YUpSM3I3?=
 =?utf-8?B?bm9qYm1KMXc1a0FmeHR0ZlZDWjJNb2djUnpiemxLdkNNeWcvWDhlMjUvWEMy?=
 =?utf-8?B?UjE1cGNsL2FRNXUwNWdiVVBSWHA0Uy9zb2ZibGx4M280dTFIakVUaTB2Zzky?=
 =?utf-8?B?QmNFRDc5amxxYUZYV2sxTlRBZXNFUng5TCtqNzJzREJCZDBtTnhLMEdwUzdh?=
 =?utf-8?B?OThwYzJ4TC9SNmRqSXk4bzZoYk92eE83VmlBaVBFbDZIakJHT0VCMGk0cCtX?=
 =?utf-8?B?OTJpOFlTbVgvKzNzT2dYc0E0Rm9KajhrWnJIMzJJTXhuZ0dKRUk2Tm4wd2VI?=
 =?utf-8?B?bUUrR0hPWlBFYVJ0NnV1NDhVTjZ4Qm14OG9XU3JoZU5IZEhQWFZkWkJSR3FL?=
 =?utf-8?B?WWZFcmo0OXBSVXRNRG9Ga1o4Vkgyb2lsV1dweXFSUmN6MEVWK25wMmFZNkYx?=
 =?utf-8?B?TGtnQmVrZHpHUHkrYksrYUZCYlpFOHBuV0JLa2NYRGlHZHNPbHZqRzVEL2tH?=
 =?utf-8?B?bzJId3hHbFUzcEFCZ2JSWThMZW1SMHo1cUtRSnNLNEV5WndVOTVVbE4valBv?=
 =?utf-8?B?TE1NU3JsaG1RZUZZMGhsb2FtOHNMcEtrNTNqQWt5MFZIN0hCT1RyOWdXaktU?=
 =?utf-8?B?cHE4Y0VmcVZEN2ZObmxKcWIxaW9mWlNpNlZGQVk5Q0dxdURuM2Vxbmdwc2NV?=
 =?utf-8?B?OUxFWXFJRkN4YlVxaGMxYURkdG9RR1oxMkYwSk92Y1JIenBIN3NNZUkvbDdX?=
 =?utf-8?B?VTBSUTJCeEhmeWFUejExdGJPUW9ZY3FYNitHaEdYUFRnOWNWVUJwOVVlanJz?=
 =?utf-8?B?ZlJNWGEvRW00Y0tqNzZHSG9mK2o4ZUdlYjAwTEoyUkdjUmhNTXhiUkIwNkRS?=
 =?utf-8?B?WXlkWkdOUmpYZHBXM29YL0phaytZS3lKcEdsR01yY0FRZVFWcWhlbmpEL0Iv?=
 =?utf-8?B?dmcxUFZGd2Fxc0E1UFdFTUxxV1NpK2pzZWJRd3J5NXpIb2dBa3FuZHVNRlRr?=
 =?utf-8?Q?PhJz6TVdvgE577cOLU5fdTkZ7ItRU5ii9somvAY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 62d0f0bc-f2a4-4507-5540-08d94e3ca8ec
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2021 00:47:49.1438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IKEQpQXvbwdPvrTUORclUPqlIKApvoy0ygjK1MAP5fICZfMzYVCYCZtFRBXzW5PnTg+Bm4VsA1Bjn+S0Qu+XPrH8spnwXj+9BEObpHcI9RA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4674
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



On 7/22/2021 4:53 PM, Matthew Brost wrote:
> Implement GuC virtual engines. Rather simple implementation, basically
> just allocate an engine, setup context enter / exit function to virtual
> engine specific functions, set all other variables / functions to guc
> versions, and set the engine mask to that of all the siblings.
>
> v2: Update to work with proto-ctx
> v3:
>   (Daniele)
>    - Drop include, add comment to intel_virtual_engine_has_heartbeat
>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_context.c   |   8 +-
>   drivers/gpu/drm/i915/gt/intel_context_types.h |   6 +
>   drivers/gpu/drm/i915/gt/intel_engine.h        |  30 ++-
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  14 +
>   .../drm/i915/gt/intel_execlists_submission.c  |  29 ++-
>   .../drm/i915/gt/intel_execlists_submission.h  |   4 -
>   drivers/gpu/drm/i915/gt/selftest_execlists.c  |  12 +-
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 244 +++++++++++++++++-
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.h |   2 +
>   9 files changed, 313 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 89ca401bf9ae..bc52eeed782a 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -74,7 +74,6 @@
>   #include "gt/intel_context_param.h"
>   #include "gt/intel_engine_heartbeat.h"
>   #include "gt/intel_engine_user.h"
> -#include "gt/intel_execlists_submission.h" /* virtual_engine */
>   #include "gt/intel_gpu_commands.h"
>   #include "gt/intel_ring.h"
>   
> @@ -363,9 +362,6 @@ set_proto_ctx_engines_balance(struct i915_user_extension __user *base,
>   	if (!HAS_EXECLISTS(i915))
>   		return -ENODEV;
>   
> -	if (intel_uc_uses_guc_submission(&i915->gt.uc))
> -		return -ENODEV; /* not implement yet */
> -
>   	if (get_user(idx, &ext->engine_index))
>   		return -EFAULT;
>   
> @@ -950,8 +946,8 @@ static struct i915_gem_engines *user_engines(struct i915_gem_context *ctx,
>   			break;
>   
>   		case I915_GEM_ENGINE_TYPE_BALANCED:
> -			ce = intel_execlists_create_virtual(pe[n].siblings,
> -							    pe[n].num_siblings);
> +			ce = intel_engine_create_virtual(pe[n].siblings,
> +							 pe[n].num_siblings);
>   			break;
>   
>   		case I915_GEM_ENGINE_TYPE_INVALID:
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index 4a5518d295c2..542c98418771 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -47,6 +47,12 @@ struct intel_context_ops {
>   
>   	void (*reset)(struct intel_context *ce);
>   	void (*destroy)(struct kref *kref);
> +
> +	/* virtual engine/context interface */
> +	struct intel_context *(*create_virtual)(struct intel_engine_cs **engine,
> +						unsigned int count);
> +	struct intel_engine_cs *(*get_sibling)(struct intel_engine_cs *engine,
> +					       unsigned int sibling);
>   };
>   
>   struct intel_context {
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
> index f911c1224ab2..13bfb7ec33b2 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine.h
> @@ -273,13 +273,41 @@ intel_engine_has_preempt_reset(const struct intel_engine_cs *engine)
>   	return intel_engine_has_preemption(engine);
>   }
>   
> +struct intel_context *
> +intel_engine_create_virtual(struct intel_engine_cs **siblings,
> +			    unsigned int count);

looks like I missed this earlier, but this forward decl seems unneeded.

> +
> +static inline bool
> +intel_virtual_engine_has_heartbeat(const struct intel_engine_cs *engine)
> +{
> +	/*
> +	 * For non-GuC submission we expect the back-end to look at the
> +	 * heartbeat status of the actual physical engine that the work
> +	 * has been (or is being) scheduled on, so we should only reach
> +	 * here with GuC submission enabled.
> +	 */
> +	GEM_BUG_ON(!intel_engine_uses_guc(engine));
> +
> +	return intel_guc_virtual_engine_has_heartbeat(engine);
> +}
> +
>   static inline bool
>   intel_engine_has_heartbeat(const struct intel_engine_cs *engine)
>   {
>   	if (!IS_ACTIVE(CONFIG_DRM_I915_HEARTBEAT_INTERVAL))
>   		return false;
>   
> -	return READ_ONCE(engine->props.heartbeat_interval_ms);
> +	if (intel_engine_is_virtual(engine))
> +		return intel_virtual_engine_has_heartbeat(engine);
> +	else
> +		return READ_ONCE(engine->props.heartbeat_interval_ms);
> +}
> +
> +static inline struct intel_engine_cs *
> +intel_engine_get_sibling(struct intel_engine_cs *engine, unsigned int sibling)
> +{
> +	GEM_BUG_ON(!intel_engine_is_virtual(engine));
> +	return engine->cops->get_sibling(engine, sibling);
>   }
>   
>   #endif /* _INTEL_RINGBUFFER_H_ */
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index c1c96ced2a4b..7dee9a1209bc 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -1755,6 +1755,20 @@ ktime_t intel_engine_get_busy_time(struct intel_engine_cs *engine, ktime_t *now)
>   	return total;
>   }
>   
> +struct intel_context *
> +intel_engine_create_virtual(struct intel_engine_cs **siblings,
> +			    unsigned int count)
> +{
> +	if (count == 0)
> +		return ERR_PTR(-EINVAL);
> +
> +	if (count == 1)
> +		return intel_context_create(siblings[0]);
> +
> +	GEM_BUG_ON(!siblings[0]->cops->create_virtual);
> +	return siblings[0]->cops->create_virtual(siblings, count);
> +}
> +
>   static bool match_ring(struct i915_request *rq)
>   {
>   	u32 ring = ENGINE_READ(rq->engine, RING_START);
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index 87cedaeb4bf8..b2580cd2ce51 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -199,6 +199,9 @@ static struct virtual_engine *to_virtual_engine(struct intel_engine_cs *engine)
>   	return container_of(engine, struct virtual_engine, base);
>   }
>   
> +static struct intel_context *
> +execlists_create_virtual(struct intel_engine_cs **siblings, unsigned int count);
> +
>   static struct i915_request *
>   __active_request(const struct intel_timeline * const tl,
>   		 struct i915_request *rq,
> @@ -2599,6 +2602,8 @@ static const struct intel_context_ops execlists_context_ops = {
>   
>   	.reset = lrc_reset,
>   	.destroy = lrc_destroy,
> +
> +	.create_virtual = execlists_create_virtual,
>   };
>   
>   static int emit_pdps(struct i915_request *rq)
> @@ -3545,6 +3550,17 @@ static void virtual_context_exit(struct intel_context *ce)
>   		intel_engine_pm_put(ve->siblings[n]);
>   }
>   
> +static struct intel_engine_cs *
> +virtual_get_sibling(struct intel_engine_cs *engine, unsigned int sibling)
> +{
> +	struct virtual_engine *ve = to_virtual_engine(engine);
> +
> +	if (sibling >= ve->num_siblings)
> +		return NULL;
> +
> +	return ve->siblings[sibling];
> +}
> +
>   static const struct intel_context_ops virtual_context_ops = {
>   	.flags = COPS_HAS_INFLIGHT,
>   
> @@ -3559,6 +3575,8 @@ static const struct intel_context_ops virtual_context_ops = {
>   	.exit = virtual_context_exit,
>   
>   	.destroy = virtual_context_destroy,
> +
> +	.get_sibling = virtual_get_sibling,
>   };
>   
>   static intel_engine_mask_t virtual_submission_mask(struct virtual_engine *ve)
> @@ -3707,20 +3725,13 @@ static void virtual_submit_request(struct i915_request *rq)
>   	spin_unlock_irqrestore(&ve->base.sched_engine->lock, flags);
>   }
>   
> -struct intel_context *
> -intel_execlists_create_virtual(struct intel_engine_cs **siblings,
> -			       unsigned int count)
> +static struct intel_context *
> +execlists_create_virtual(struct intel_engine_cs **siblings, unsigned int count)
>   {
>   	struct virtual_engine *ve;
>   	unsigned int n;
>   	int err;
>   
> -	if (count == 0)
> -		return ERR_PTR(-EINVAL);
> -
> -	if (count == 1)
> -		return intel_context_create(siblings[0]);
> -
>   	ve = kzalloc(struct_size(ve, siblings, count), GFP_KERNEL);
>   	if (!ve)
>   		return ERR_PTR(-ENOMEM);
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.h b/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
> index ad4f3e1a0fde..a1aa92c983a5 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
> @@ -32,10 +32,6 @@ void intel_execlists_show_requests(struct intel_engine_cs *engine,
>   							int indent),
>   				   unsigned int max);
>   
> -struct intel_context *
> -intel_execlists_create_virtual(struct intel_engine_cs **siblings,
> -			       unsigned int count);
> -
>   bool
>   intel_engine_in_execlists_submission_mode(const struct intel_engine_cs *engine);
>   
> diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
> index 22a124b134b6..f12ffe797639 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
> @@ -3733,7 +3733,7 @@ static int nop_virtual_engine(struct intel_gt *gt,
>   	GEM_BUG_ON(!nctx || nctx > ARRAY_SIZE(ve));
>   
>   	for (n = 0; n < nctx; n++) {
> -		ve[n] = intel_execlists_create_virtual(siblings, nsibling);
> +		ve[n] = intel_engine_create_virtual(siblings, nsibling);
>   		if (IS_ERR(ve[n])) {
>   			err = PTR_ERR(ve[n]);
>   			nctx = n;
> @@ -3929,7 +3929,7 @@ static int mask_virtual_engine(struct intel_gt *gt,
>   	 * restrict it to our desired engine within the virtual engine.
>   	 */
>   
> -	ve = intel_execlists_create_virtual(siblings, nsibling);
> +	ve = intel_engine_create_virtual(siblings, nsibling);
>   	if (IS_ERR(ve)) {
>   		err = PTR_ERR(ve);
>   		goto out_close;
> @@ -4060,7 +4060,7 @@ static int slicein_virtual_engine(struct intel_gt *gt,
>   		i915_request_add(rq);
>   	}
>   
> -	ce = intel_execlists_create_virtual(siblings, nsibling);
> +	ce = intel_engine_create_virtual(siblings, nsibling);
>   	if (IS_ERR(ce)) {
>   		err = PTR_ERR(ce);
>   		goto out;
> @@ -4112,7 +4112,7 @@ static int sliceout_virtual_engine(struct intel_gt *gt,
>   
>   	/* XXX We do not handle oversubscription and fairness with normal rq */
>   	for (n = 0; n < nsibling; n++) {
> -		ce = intel_execlists_create_virtual(siblings, nsibling);
> +		ce = intel_engine_create_virtual(siblings, nsibling);
>   		if (IS_ERR(ce)) {
>   			err = PTR_ERR(ce);
>   			goto out;
> @@ -4214,7 +4214,7 @@ static int preserved_virtual_engine(struct intel_gt *gt,
>   	if (err)
>   		goto out_scratch;
>   
> -	ve = intel_execlists_create_virtual(siblings, nsibling);
> +	ve = intel_engine_create_virtual(siblings, nsibling);
>   	if (IS_ERR(ve)) {
>   		err = PTR_ERR(ve);
>   		goto out_scratch;
> @@ -4354,7 +4354,7 @@ static int reset_virtual_engine(struct intel_gt *gt,
>   	if (igt_spinner_init(&spin, gt))
>   		return -ENOMEM;
>   
> -	ve = intel_execlists_create_virtual(siblings, nsibling);
> +	ve = intel_engine_create_virtual(siblings, nsibling);
>   	if (IS_ERR(ve)) {
>   		err = PTR_ERR(ve);
>   		goto out_spin;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 26aadad10b12..28404454a97a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -60,6 +60,15 @@
>    *
>    */
>   
> +/* GuC Virtual Engine */
> +struct guc_virtual_engine {
> +	struct intel_engine_cs base;
> +	struct intel_context context;
> +};
> +
> +static struct intel_context *
> +guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count);
> +
>   #define GUC_REQUEST_SIZE 64 /* bytes */
>   
>   /*
> @@ -931,14 +940,17 @@ static int guc_lrc_desc_pin(struct intel_context *ce)
>   	return ret;
>   }
>   
> -static int guc_context_pre_pin(struct intel_context *ce,
> -			       struct i915_gem_ww_ctx *ww,
> -			       void **vaddr)
> +static int __guc_context_pre_pin(struct intel_context *ce,
> +				 struct intel_engine_cs *engine,
> +				 struct i915_gem_ww_ctx *ww,
> +				 void **vaddr)
>   {
> -	return lrc_pre_pin(ce, ce->engine, ww, vaddr);
> +	return lrc_pre_pin(ce, engine, ww, vaddr);
>   }
>   
> -static int guc_context_pin(struct intel_context *ce, void *vaddr)
> +static int __guc_context_pin(struct intel_context *ce,
> +			     struct intel_engine_cs *engine,
> +			     void *vaddr)
>   {
>   	if (i915_ggtt_offset(ce->state) !=
>   	    (ce->lrc.lrca & CTX_GTT_ADDRESS_MASK))
> @@ -949,7 +961,19 @@ static int guc_context_pin(struct intel_context *ce, void *vaddr)
>   	 * explaination of why.
>   	 */
>   
> -	return lrc_pin(ce, ce->engine, vaddr);
> +	return lrc_pin(ce, engine, vaddr);
> +}
> +
> +static int guc_context_pre_pin(struct intel_context *ce,
> +			       struct i915_gem_ww_ctx *ww,
> +			       void **vaddr)
> +{
> +	return __guc_context_pre_pin(ce, ce->engine, ww, vaddr);
> +}
> +
> +static int guc_context_pin(struct intel_context *ce, void *vaddr)
> +{
> +	return __guc_context_pin(ce, ce->engine, vaddr);
>   }
>   
>   static void guc_context_unpin(struct intel_context *ce)
> @@ -1054,6 +1078,21 @@ static inline void guc_lrc_desc_unpin(struct intel_context *ce)
>   	deregister_context(ce, ce->guc_id);
>   }
>   
> +static void __guc_context_destroy(struct intel_context *ce)
> +{
> +	lrc_fini(ce);
> +	intel_context_fini(ce);
> +
> +	if (intel_engine_is_virtual(ce->engine)) {
> +		struct guc_virtual_engine *ve =
> +			container_of(ce, typeof(*ve), context);
> +
> +		kfree(ve);
> +	} else {
> +		intel_context_free(ce);
> +	}
> +}
> +
>   static void guc_context_destroy(struct kref *kref)
>   {
>   	struct intel_context *ce = container_of(kref, typeof(*ce), ref);
> @@ -1068,11 +1107,11 @@ static void guc_context_destroy(struct kref *kref)
>   	 * registered with the GuC.
>   	 */
>   	if (context_guc_id_invalid(ce)) {
> -		lrc_destroy(kref);
> +		__guc_context_destroy(ce);
>   		return;
>   	} else if (!lrc_desc_registered(guc, ce->guc_id)) {
>   		release_guc_id(guc, ce);
> -		lrc_destroy(kref);
> +		__guc_context_destroy(ce);
>   		return;
>   	}
>   
> @@ -1087,7 +1126,7 @@ static void guc_context_destroy(struct kref *kref)
>   	spin_lock_irqsave(&guc->contexts_lock, flags);
>   	if (context_guc_id_invalid(ce)) {
>   		spin_unlock_irqrestore(&guc->contexts_lock, flags);
> -		lrc_destroy(kref);
> +		__guc_context_destroy(ce);
>   		return;
>   	}
>   
> @@ -1132,6 +1171,8 @@ static const struct intel_context_ops guc_context_ops = {
>   
>   	.reset = lrc_reset,
>   	.destroy = guc_context_destroy,
> +
> +	.create_virtual = guc_create_virtual,
>   };
>   
>   static void __guc_signal_context_fence(struct intel_context *ce)
> @@ -1260,6 +1301,83 @@ static int guc_request_alloc(struct i915_request *rq)
>   	return 0;
>   }
>   
> +static struct intel_engine_cs *
> +guc_virtual_get_sibling(struct intel_engine_cs *ve, unsigned int sibling)
> +{
> +	struct intel_engine_cs *engine;
> +	intel_engine_mask_t tmp, mask = ve->mask;
> +	unsigned int num_siblings = 0;
> +
> +	for_each_engine_masked(engine, ve->gt, mask, tmp)
> +		if (num_siblings++ == sibling)
> +			return engine;
> +
> +	return NULL;
> +}
> +
> +static int guc_virtual_context_pre_pin(struct intel_context *ce,
> +				       struct i915_gem_ww_ctx *ww,
> +				       void **vaddr)
> +{
> +	struct intel_engine_cs *engine = guc_virtual_get_sibling(ce->engine, 0);
> +
> +	return __guc_context_pre_pin(ce, engine, ww, vaddr);
> +}
> +
> +static int guc_virtual_context_pin(struct intel_context *ce, void *vaddr)
> +{
> +	struct intel_engine_cs *engine = guc_virtual_get_sibling(ce->engine, 0);
> +
> +	return __guc_context_pin(ce, engine, vaddr);
> +}
> +
> +static void guc_virtual_context_enter(struct intel_context *ce)
> +{
> +	intel_engine_mask_t tmp, mask = ce->engine->mask;
> +	struct intel_engine_cs *engine;
> +
> +	for_each_engine_masked(engine, ce->engine->gt, mask, tmp)
> +		intel_engine_pm_get(engine);
> +
> +	intel_timeline_enter(ce->timeline);
> +}
> +
> +static void guc_virtual_context_exit(struct intel_context *ce)
> +{
> +	intel_engine_mask_t tmp, mask = ce->engine->mask;
> +	struct intel_engine_cs *engine;
> +
> +	for_each_engine_masked(engine, ce->engine->gt, mask, tmp)
> +		intel_engine_pm_put(engine);
> +
> +	intel_timeline_exit(ce->timeline);
> +}
> +
> +static int guc_virtual_context_alloc(struct intel_context *ce)
> +{
> +	struct intel_engine_cs *engine = guc_virtual_get_sibling(ce->engine, 0);
> +
> +	return lrc_alloc(ce, engine);
> +}
> +
> +static const struct intel_context_ops virtual_guc_context_ops = {
> +	.alloc = guc_virtual_context_alloc,
> +
> +	.pre_pin = guc_virtual_context_pre_pin,
> +	.pin = guc_virtual_context_pin,
> +	.unpin = guc_context_unpin,
> +	.post_unpin = guc_context_post_unpin,
> +
> +	.enter = guc_virtual_context_enter,
> +	.exit = guc_virtual_context_exit,
> +
> +	.sched_disable = guc_context_sched_disable,
> +
> +	.destroy = guc_context_destroy,
> +
> +	.get_sibling = guc_virtual_get_sibling,
> +};
> +
>   static void sanitize_hwsp(struct intel_engine_cs *engine)
>   {
>   	struct intel_timeline *tl;
> @@ -1566,7 +1684,7 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
>   	} else if (context_destroyed(ce)) {
>   		/* Context has been destroyed */
>   		release_guc_id(guc, ce);
> -		lrc_destroy(&ce->ref);
> +		__guc_context_destroy(ce);
>   	}
>   
>   	decr_outstanding_submission_g2h(guc);
> @@ -1681,3 +1799,109 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
>   			   atomic_read(&ce->guc_sched_state_no_lock));
>   	}
>   }
> +
> +static struct intel_context *
> +guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count)
> +{
> +	struct guc_virtual_engine *ve;
> +	struct intel_guc *guc;
> +	unsigned int n;
> +	int err;
> +
> +	ve = kzalloc(sizeof(*ve), GFP_KERNEL);
> +	if (!ve)
> +		return ERR_PTR(-ENOMEM);
> +
> +	guc = &siblings[0]->gt->uc.guc;
> +
> +	ve->base.i915 = siblings[0]->i915;
> +	ve->base.gt = siblings[0]->gt;
> +	ve->base.uncore = siblings[0]->uncore;
> +	ve->base.id = -1;
> +
> +	ve->base.uabi_class = I915_ENGINE_CLASS_INVALID;
> +	ve->base.instance = I915_ENGINE_CLASS_INVALID_VIRTUAL;
> +	ve->base.uabi_instance = I915_ENGINE_CLASS_INVALID_VIRTUAL;
> +	ve->base.saturated = ALL_ENGINES;
> +	ve->base.breadcrumbs = intel_breadcrumbs_create(&ve->base);
> +	if (!ve->base.breadcrumbs) {
> +		kfree(ve);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	snprintf(ve->base.name, sizeof(ve->base.name), "virtual");
> +
> +	ve->base.sched_engine = i915_sched_engine_get(guc->sched_engine);
> +
> +	ve->base.cops = &virtual_guc_context_ops;
> +	ve->base.request_alloc = guc_request_alloc;
> +
> +	ve->base.submit_request = guc_submit_request;
> +
> +	ve->base.flags = I915_ENGINE_IS_VIRTUAL;
> +
> +	intel_context_init(&ve->context, &ve->base);
> +
> +	for (n = 0; n < count; n++) {
> +		struct intel_engine_cs *sibling = siblings[n];
> +
> +		GEM_BUG_ON(!is_power_of_2(sibling->mask));
> +		if (sibling->mask & ve->base.mask) {
> +			DRM_DEBUG("duplicate %s entry in load balancer\n",
> +				  sibling->name);
> +			err = -EINVAL;
> +			goto err_put;
> +		}
> +
> +		ve->base.mask |= sibling->mask;
> +
> +		if (n != 0 && ve->base.class != sibling->class) {
> +			DRM_DEBUG("invalid mixing of engine class, sibling %d, already %d\n",
> +				  sibling->class, ve->base.class);
> +			err = -EINVAL;
> +			goto err_put;
> +		} else if (n == 0) {
> +			ve->base.class = sibling->class;
> +			ve->base.uabi_class = sibling->uabi_class;
> +			snprintf(ve->base.name, sizeof(ve->base.name),
> +				 "v%dx%d", ve->base.class, count);
> +			ve->base.context_size = sibling->context_size;
> +
> +			ve->base.emit_bb_start = sibling->emit_bb_start;
> +			ve->base.emit_flush = sibling->emit_flush;
> +			ve->base.emit_init_breadcrumb =
> +				sibling->emit_init_breadcrumb;
> +			ve->base.emit_fini_breadcrumb =
> +				sibling->emit_fini_breadcrumb;
> +			ve->base.emit_fini_breadcrumb_dw =
> +				sibling->emit_fini_breadcrumb_dw;
> +
> +			ve->base.flags |= sibling->flags;
> +
> +			ve->base.props.timeslice_duration_ms =
> +				sibling->props.timeslice_duration_ms;
> +			ve->base.props.preempt_timeout_ms =
> +				sibling->props.preempt_timeout_ms;
> +		}
> +	}
> +
> +	return &ve->context;
> +
> +err_put:
> +	intel_context_put(&ve->context);
> +	return ERR_PTR(err);
> +}
> +
> +
> +

Too many new lines.

with the 2 nits addressed:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> +bool intel_guc_virtual_engine_has_heartbeat(const struct intel_engine_cs *ve)
> +{
> +	struct intel_engine_cs *engine;
> +	intel_engine_mask_t tmp, mask = ve->mask;
> +
> +	for_each_engine_masked(engine, ve->gt, mask, tmp)
> +		if (READ_ONCE(engine->props.heartbeat_interval_ms))
> +			return true;
> +
> +	return false;
> +}
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> index 2b9470c90558..5f263ac4f46a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> @@ -26,6 +26,8 @@ void intel_guc_submission_print_info(struct intel_guc *guc,
>   void intel_guc_submission_print_context_info(struct intel_guc *guc,
>   					     struct drm_printer *p);
>   
> +bool intel_guc_virtual_engine_has_heartbeat(const struct intel_engine_cs *ve);
> +
>   static inline bool intel_guc_submission_is_supported(struct intel_guc *guc)
>   {
>   	/* XXX: GuC submission is unavailable for now */

