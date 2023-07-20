Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1320C75B8E9
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 22:52:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F46710E18E;
	Thu, 20 Jul 2023 20:52:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB5B10E18E;
 Thu, 20 Jul 2023 20:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689886334; x=1721422334;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DRfw5ft61tuYKI396p4NrMt++TjfZJ+InS6WBiYc4ZA=;
 b=AONDDZgLWE7PrArAJkKLdYkXPwVN62T7s59q2tqGpILeFcmPo0oFvWa8
 2oQ2au7Yp/ld8rnio4A3czkyREKhgAXGBeXKLFCYBcA/P7dlmHSB3XMTR
 Aq3jLPUzm4h3zRM4TqkzXzUISftH6OkrT80NqEdpnZvEdU44fxU3ucylO
 Dqg30+RvvdSE4E7EZEQd/HX2PaOV3bC/wKwsdKNa7+Kl0Z4K9RxPTVji7
 Tg8XySprjJFsS8iXrzJFXhVDpjBLyQyGysjtEzVoIEMw5nK7gV0BRmOzJ
 NIomvL6EsUjcBK2m8gMh566+z5UAhNlUCzYGpqE13Jbj22Pl8XL4iUIca g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="433083108"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="433083108"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 13:52:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="701796701"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="701796701"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP; 20 Jul 2023 13:52:13 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 13:52:13 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 13:52:13 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 20 Jul 2023 13:52:13 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 20 Jul 2023 13:52:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GW78yX+CKAc8ZJQCpNchVuoetLfiA1RruEnd5IA16hkbm5CD4dc7qbLlHgCpRZO4PeABjgRwFXpxDmltD6eGUUK4cwNxyfsjAVoETjNv0Duv5ppgqo8JelRxF6I8xGu9SJkwAiX0qr56UdxtxIbhOCJItN6kJiX5912Hl2IOovitsF3FXR4gn/pGO7G9jWFxTTLHN83yTdNXlcA51zaJrd/w2nqOtgJB890I8VUENcJJcs7Rwvh7sA826hV16//wT27OvkqLEdNXWo+nyvSJBLJeq5ah5aqGZsQgafos9/csT6Df08oICqBp/F490Y9G+NnleotQ508jpCTBCeqVuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qQ9vxro+I2XwTiq2VM1D3nLqYAjk4dlfe+mBNA6fMFY=;
 b=WouJTa4D/pYtkwT2G/w+rmXke3VZwClj8dnxTAx6MklnfpamvG6UPfpHDFWEUClFvjIgyv8qL9YWiSbkm0iOaXKHoQKS68RxH/FWJjA9p0YJ6kKL5+g00406Fkvbj6XCz/dU1ZsLscno8cMJ7DIKTAwOWcIQO/nAu/Qs8/hw1XCZmQksIDc1R+k45Gz6DGRX+Cs4HXQP9sFj74bXwg5PkfOHdUXzqidcJmnoVvkDV7MOPKwBJZ67n9kk32Ku+gGLXvt9yPKKzfJpMiZ31PezPq2yRG24pY1x4E1rCalrufdHu0oARZwGY76KBh8msd2znoquExfgQIMhQEAOsqmOKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SA1PR11MB8594.namprd11.prod.outlook.com (2603:10b6:806:3b1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Thu, 20 Jul
 2023 20:52:04 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d218:3a45:e9ae:f699]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d218:3a45:e9ae:f699%4]) with mapi id 15.20.6609.025; Thu, 20 Jul 2023
 20:52:03 +0000
Message-ID: <4965b5e0-5bad-bba8-7cd9-0975478105ad@intel.com>
Date: Thu, 20 Jul 2023 13:52:00 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5] drm/i915/selftest/gsc: Ensure GSC Proxy init completes
 before selftests
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230712231243.2459135-1-alan.previn.teres.alexis@intel.com>
Content-Language: en-US
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230712231243.2459135-1-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0070.namprd02.prod.outlook.com
 (2603:10b6:a03:54::47) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SA1PR11MB8594:EE_
X-MS-Office365-Filtering-Correlation-Id: 535937ef-e6dc-42d6-e069-08db89632b86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TnKUI5TlG2iZpWRbEvzhKG5/XHsr1jZ1egtr/3IBcTwZv/rgVtRQD/v8odCzV/MO7sV76dY8fd0kZI6DQMMkiBl02/GtdwhrkDq/aXfs/QJ+GZBP2ytbyfnHNI1UVdZNZteJTqJzm/fYntWTYsj5e7T7hmLGSYuzty+q2Q500gwa9rWpah1l/u0lvrSNN7wYbxPuL6IQokzZauyiLDUlBLTuyWfzPoL/HwSJg1nTNESDnW7aJO69DartAvjKdufuJouUGfSBzmFhOXBCCY2jReormv+c2hCvhYEUl9ms8H9HSBOSyIJJIysli4jBfEUgxqnRXego8XIysgrNh1WkyudtEtyykq4SFzgirSYz/xpol1Qt0IF1PUjeWMDTulxwLSHG9aLKbK0btzurXyu6I5Of46zWzFKY8iB682H1JZjEdvbTDZUMPy3nCVyyW2X7QAtn+ANQMD8ZsS+CX0Zbo3treXYZNmHCKIkWVVF25oCQXZFsa1UduYWokW+kIwHzPBw7krdg8NxA7nKZLG8VHH+s8sklt1jRoVZteWqTqwhDYP4zeh/CiAWlrUFa6sEykK+Zh9YKbbqSVY62rhsFgqOjxarq27hJbgh/wVcNq+qEkpMq+RoxLHhpCqRPykv4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(39860400002)(346002)(396003)(136003)(451199021)(966005)(66946007)(6512007)(66556008)(66476007)(6486002)(107886003)(2906002)(53546011)(8676002)(316002)(8936002)(4326008)(36756003)(450100002)(5660300002)(82960400001)(6506007)(2616005)(38100700002)(186003)(26005)(41300700001)(83380400001)(86362001)(478600001)(31686004)(54906003)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SldOVWxJRHRoOW5JRk9oYzJaYS9yUGRCZG5PWW0xbjlWNnBEVkREYzlRMEk0?=
 =?utf-8?B?SmYxV2tLUE90WHJBTkhzOFA2VG9ZTGI0M2t5bkM0dks2SlpBNXJKZWp0NXkz?=
 =?utf-8?B?cUpiVlBONWszeTJ1eUxaT2VMdC9sbzU3anlRM2JpZmpKeFE5UU5mRmN1b2NP?=
 =?utf-8?B?SXF4YWNRaVp1aFhkY1FqWTkrTkIyREFYQlI4OG0yN28yMVdoQTRFQVAyYWhs?=
 =?utf-8?B?cmpqVlM2UjByazZpOG5TdXVFVG9pTzZEZExBNzJVTWwrc3JLQUhMakllSy9N?=
 =?utf-8?B?QXNGdVNaaGVQY1VDTVBXTzErNWpQSnRFZS94Y0N2bitlcUNXRlZNWThJdG81?=
 =?utf-8?B?UVFpWXNNMTZGWE5ZSEdCb1B4QmdPVVpnVWVyVlJqa3ZTbE00aThTTEFETjlW?=
 =?utf-8?B?WjJlWXZHSEEwTlhwVVhLMXJEanQvZVR6bFZVVVkvQW1nalpaS3VVb1pQMS8x?=
 =?utf-8?B?ZEgzZ2VCdENORGt1diswVXhWdDJ2TGlTbUJWUFM4eWFscTVtQXJYZlpMZUdn?=
 =?utf-8?B?ZnRPRnhZSm1SODR3R1ZMRWJ3MHJ6SnhFQXFISVR1ZnFiNHNQM1pNZGZmUVNT?=
 =?utf-8?B?SVdkQis2bnJscVZkUVhaVFA5RGNZeXhTVllldXQ2MjJIT3ViL0FwZTlLWWVP?=
 =?utf-8?B?RzdyWVNGd2ltZjErdVVJQjQxVXVNWWp3SUFYcHBEZEJiMUxqVUhMNExyNjBN?=
 =?utf-8?B?b0JrKzl1WTZSV1Q4VUZmK2xXOEdKL0tBWXNkeG1kRU0yMEZ5cnkzaXh2SkYr?=
 =?utf-8?B?VFlpV0FZYjAyMnFLWDVVVGVjQ1JnSGlzbmR6SlRlQTRleFJtTUVRNnprQkdU?=
 =?utf-8?B?aVYwNzlTWHFUdVVDVnZSWlkwMHZYVGhOQUVHdWt6T29jNk5FYmE4MmxIRm41?=
 =?utf-8?B?UmpvaTVqL3lEd1dtODdhZGg1ZnpxYUdFZHpRcFVXTGhOQTcxWHZUd2xSSTFv?=
 =?utf-8?B?Y0ExRHM3ajhRZG9MZjlEWGp3SEx1M2VVUGxhMWppRFdyZzRGQjkyK2d6Znkw?=
 =?utf-8?B?SFY5V2VXZzlLOXIxQnRSS0VabHI5aGU2czU0STdCQWRKOTRwSHBiUUp6WU5K?=
 =?utf-8?B?ajVrYTNjNnc1MlpQTldxeExRdkwxOEcrWVlMWnd2bTJuS2RUVmdaUy9DUGhp?=
 =?utf-8?B?QUlrajBxeHlXY1FsWlpQWC9CNy9hOFdmUFFTRmFVNWsyMDVPOEZSS3VidXcz?=
 =?utf-8?B?eE0rZkdLSEJTZFkxL1FnOS9admVQcGpnNkszWlV4NW55N1ZOeUFpbEp3WXNy?=
 =?utf-8?B?ZjY4SGVHWVc0a2Nzb0ZiZ3Y4VE1EcFp5SWJOdVJyalhEUzMzQWd3cVAxaHdL?=
 =?utf-8?B?OEVnVkttTEdXTVBXMVA1UGZ3U2N0aEl6S2NsQXZ1RHN4SlNKNmk0SHUvcWdN?=
 =?utf-8?B?cDE4dGxvT1BlOVUwcUg2WnpwKzJkaXpwaUhnM0VITTg3Y0s4bUlMTk5pa3Ux?=
 =?utf-8?B?aDZaYldwc3FxMFRJN0g3MUl4QytoVGo3ekliK2hBM3BqSkJpbXZmRFZCMVlz?=
 =?utf-8?B?UWdSVlMvOXI4T3QvZWxndk1VV05ZMHl3aUFwdjVVT2xJY09Da1FFOVZ0SVZ0?=
 =?utf-8?B?OHkySWp0ejFqYnFUSHloUGl0RFlXL1g4ZEFpRVpuQUNFZWJLYmR5OUdlRDVP?=
 =?utf-8?B?aFFYRWdYRVV2ZGJzQ2tuOEJjQy9zVWVoZFgvOWUvbTNxSWVpVVB2bE5WVlhu?=
 =?utf-8?B?SEpEWUEyM01pRnZtN0ZlejFPdUZjS29tazFOdS9XUHhFSzNOcVgrSEdpUHpO?=
 =?utf-8?B?aHVzem9wTCt1RVpta0I4QjhuK2VKN2RTV0QzV2UyQmJabmFoUUoyTlpVc1gw?=
 =?utf-8?B?Y0RsKzVWQXhLUDFsbS95WVBEUzJaTWpPbGpXOExyMW93Q0htSnRjYVMxWWpl?=
 =?utf-8?B?eHZ2VEU5b3BWK2QzWWVlRkwrMnZISWJLNks5ams5cW9YU29pakJkK1BxVnZF?=
 =?utf-8?B?UXFOVXRTam5KbFpzQ2JhMm9kQUc5RGpTajRhRE5Fb250U3k5MGpYcXJkdTQ4?=
 =?utf-8?B?WFUxQXF6NnQ3VGlxQTVjRGFOaEhyMVRKTmQrSVFTcExQWGloMis3bC9OZWZL?=
 =?utf-8?B?WFlhNWUzRStiTUVMNFBPSGs1T05FbkpRVGQ2ckRIZmdhVUtmODFpS0NwbnQz?=
 =?utf-8?B?czZ3dVZjQ2lOTnlUam9tV2hMRXVWc2pIQTZaT0FpbmdmaDNEY054Mys0c2Nh?=
 =?utf-8?Q?HMQQ2yH1oR87P4OxItnVT0E=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 535937ef-e6dc-42d6-e069-08db89632b86
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 20:52:03.0199 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lsg3dHdMw37+C5sJHkQ7f3Zouxpx+eoHiIvNemjozeGc6jIVleptd54MCrN0hXJU6AxeWI3kCJ0l5X3eucKtG3irMkeUSf39M9bBFGeZ9Gw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8594
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
Cc: Zhanjun Dong <zhanjun.dong@intel.com>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/12/2023 4:12 PM, Alan Previn wrote:
> On MTL, if the GSC Proxy init flows haven't completed, submissions to the
> GSC engine will fail. Those init flows are dependent on the mei's
> gsc_proxy component that is loaded in parallel with i915 and a
> worker that could potentially start after i915 driver init is done.
>
> That said, all subsytems that access the GSC engine today does check
> for such init flow completion before using the GSC engine. However,
> selftests currently don't wait on anything before starting.
>
> To fix this, add a waiter function at the start of __run_selftests
> that waits for gsc-proxy init flows to complete.
>
> Difference from prior versions:
>     v5: - Move the call to __wait_gsc_proxy_completed from common
>           __run_selftests dispatcher to the group-level selftest
>           function (Trvtko).
>         - change the pr_info to pr_warn if we hit the timeout.
>     v4: - Remove generalized waiters function table framework (Tvrtko).
>         - Remove mention of CI-framework-timeout from comments (Tvrtko).
>     v3: - Rebase to latest drm-tip.
>     v2: - Based on internal testing, increase the timeout for gsc-proxy
>           specific case to 8 seconds.
>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   .../gpu/drm/i915/selftests/i915_selftest.c    | 26 +++++++++++++++++++
>   1 file changed, 26 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/selftests/i915_selftest.c b/drivers/gpu/drm/i915/selftests/i915_selftest.c
> index 39da0fb0d6d2..b03d03eac3d6 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_selftest.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_selftest.c
> @@ -24,6 +24,8 @@
>   #include <linux/random.h>
>   
>   #include "gt/intel_gt_pm.h"
> +#include "gt/uc/intel_gsc_fw.h"
> +
>   #include "i915_driver.h"
>   #include "i915_drv.h"
>   #include "i915_selftest.h"
> @@ -127,6 +129,26 @@ static void set_default_test_all(struct selftest *st, unsigned int count)
>   		st[i].enabled = true;
>   }
>   
> +static void
> +__wait_gsc_proxy_completed(struct drm_i915_private *i915)
> +{
> +	bool need_to_wait = (IS_ENABLED(CONFIG_INTEL_MEI_GSC_PROXY) &&
> +			     i915->media_gt &&
> +			     HAS_ENGINE(i915->media_gt, GSC0) &&
> +			     intel_uc_fw_is_loadable(&i915->media_gt->uc.gsc.fw));
> +	/*
> +	 * The gsc proxy component depends on the kernel component driver load ordering
> +	 * and in corner cases (the first time after an IFWI flash), init-completion
> +	 * firmware flows take longer.
> +	 */
> +	unsigned long timeout_ms = 8000;
> +
> +	if (need_to_wait &&
> +	    (wait_for(intel_gsc_uc_fw_proxy_init_done(&i915->media_gt->uc.gsc, true),

Small issue here: if proxy init fails, intel_gsc_uc_fw_proxy_init_done 
will keep returning false, so we'll wait for the full 8 secs. Maybe we 
can instead have a proxy_init_status function to differentiate between 
pending/failed/done. This would basically be a generalization of the 
checks you already have in https://patchwork.freedesktop.org/series/118723/.
Patch LGTM apart from this.

Daniele

> +	    timeout_ms)))
> +		pr_warn(DRIVER_NAME "Timed out waiting for gsc_proxy_completion!\n");
> +}
> +
>   static int __run_selftests(const char *name,
>   			   struct selftest *st,
>   			   unsigned int count,
> @@ -206,6 +228,8 @@ int i915_live_selftests(struct pci_dev *pdev)
>   	if (!i915_selftest.live)
>   		return 0;
>   
> +	__wait_gsc_proxy_completed(pdev_to_i915(pdev));
> +
>   	err = run_selftests(live, pdev_to_i915(pdev));
>   	if (err) {
>   		i915_selftest.live = err;
> @@ -227,6 +251,8 @@ int i915_perf_selftests(struct pci_dev *pdev)
>   	if (!i915_selftest.perf)
>   		return 0;
>   
> +	__wait_gsc_proxy_completed(pdev_to_i915(pdev));
> +
>   	err = run_selftests(perf, pdev_to_i915(pdev));
>   	if (err) {
>   		i915_selftest.perf = err;
>
> base-commit: 57ea1a97c50c63c77e3bfa46ee486e8a451be5e7

