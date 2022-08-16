Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 617A75956D0
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 11:43:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E30296E9D;
	Tue, 16 Aug 2022 09:43:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F8CD18A9CB;
 Tue, 16 Aug 2022 09:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660642955; x=1692178955;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TJjijefVuqGOz5o7uY86UKRdQNNSM6SL6mgVZGtJya8=;
 b=VXsNakehen2uHDySz/TS8ntYJLP2+lVGf47czSUlL8zxpFDsn92WDA3f
 TlL5MouOtLZ/nC9NkTNBX2iBTPKUNjGd3SP3repm8WO0qMOzpeJbNyAKv
 IhHSUmF4rsQIMKC8TIhT0A7PlCMGekFcTQ/hNBdAmfUOvZlQvUq7hkRNI
 z5yCddWMdP0xV5uurEsvpqvvSNe6JSuO/lXbTRYo+JUHftbNwEZAhrjwC
 qhI+wK9ZdwMxCEQFMNejf9OGh+HRxI6CXd+RQ+7kklER/gV7zbHtPr4pg
 knI6XdNjjQnQlcX5m1uQow0j3OdNfCP+dLHCGt6O8YM1ttKFYvU1X8oy1 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="292970216"
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; d="scan'208";a="292970216"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2022 02:42:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; d="scan'208";a="696297282"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 16 Aug 2022 02:42:33 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 16 Aug 2022 02:42:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 16 Aug 2022 02:42:33 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Tue, 16 Aug 2022 02:42:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lzD/H+ZK0QqSON6pdD/uphMboFpEmLFICW3HYu3Xt8SSlkAtGhR/iuIIRO1dk/ycoosCTgIWX0yrczEzlvrDmUrUmyNcZe8v3SJNm/8euU+M5I+aaekD0oYCMzPSysHUj7sscoFuiknS5cCnud+eQfeZNhcXotKu13GV6APO0K0ULyEAXoyxM7H3nV8A7MUbT2gsXBhUZd48A072+Gg9qpMjpU2tEhtWjiRcjuvTMPbdwn12I67kwSlkjc+3drpmCB1dQ1NoT36rFmSbRG1YePjZ79rnd0R4krgsLv94W4ct8McbBBiPSI8VcwIBo20FzFUHd9zMyQXTGtTHJu+lAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mG1EfVcH2ntHktNgVkbLMoUjKs4gUqPKPwelFWurkgk=;
 b=GIX7/zpqhxXWEtmM0u02BWNDQAdq3X2vRqRCvPi1RxEQ6yq/icW87/vZU89HD7qdUcq873hEeE3RN/ryrVx9LoEkhl3RkZO5HWjWiIzBZxWM4A/RNRxBU6E2SYOOmh2BcwkLAcQ8BpbmLtXsw2TYSIGs3LJENqnj7hotvhumuD0hYQCDfIWLKT81eyAmKSo0CYyVZO9wARgqAjkQgxGMi3dTx77pMmDEV5vf8MXBtyT60C4YbOrkQwdZdRSFB1BgOF7wgXQdSQEfQaH8ONMOz2N/t9I0OOrOUxTxrZAXM8BgM7Ev2ovh2daE6Cp2u+bJsgPYYxVlfIvPsgvvB5aGNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5409.namprd11.prod.outlook.com (2603:10b6:610:d0::7)
 by DM5PR11MB0044.namprd11.prod.outlook.com (2603:10b6:4:64::38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Tue, 16 Aug
 2022 09:42:30 +0000
Received: from CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::70e4:76ca:fc65:df73]) by CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::70e4:76ca:fc65:df73%3]) with mapi id 15.20.5504.028; Tue, 16 Aug 2022
 09:42:30 +0000
Message-ID: <92e5ebbd-9af1-c7e3-6d9e-7ea2958ad9c8@intel.com>
Date: Tue, 16 Aug 2022 18:42:12 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v6 5/8] drm/i915: Check for integer truncation on the
 configuration of ttm place
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20220813010857.4043956-1-gwan-gyeong.mun@intel.com>
 <20220813010857.4043956-6-gwan-gyeong.mun@intel.com>
 <877d3arl0u.fsf@intel.com>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <877d3arl0u.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0060.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::35) To CH0PR11MB5409.namprd11.prod.outlook.com
 (2603:10b6:610:d0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69e7c232-b4cd-4647-b628-08da7f6ba2fc
X-MS-TrafficTypeDiagnostic: DM5PR11MB0044:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3RJsRJH5tb77lNibNabO10yJl16G7BNIHMGSN8nMZBul/LsCFAKlASZiec9mEcD+q9D9CcmZ8ClvsZex+PvCwX/fLTzaUQCmZuCISfFRmxf++j+8rZ7FqZOJoCj870t5uTUjh5Z83FXGtpLaSW1Vap5n8wRhnudwYulN/urpEg46hc3FxytSDHfpXUJ7Um4R6abnvUpp8gHSQ5r7XAzE3b/2UKQDRxSY7tPngDc7qcIA57XAKcLHcdQ4uz4UIF0giMlQStR0RWZIxusnGuuZ/ndGBje5U3pgLMvqs9u0Z50aNPkJ+MxNfW0iAkeQc9RJFCyYuMVO4nY2djW0LIhNm5WBK+e3xat30ZWpeYWCSMvpUfjlAH1d3aJbD6Lhuc54yWsQfd29MkjpbpWAGUZBoJJTK5pgTDC7VyB0lBUEpC3ir1VOwIAL+ZzeQq3HxFTKsspKjdnpYzndG+CJXRhFpr3JZdELsSVCqmWG7gwtUGVW44bS+eMEOtlcIL1j9/bMMts9u7qqIPfxR2LCxS3sdxzXMYgL7Ym7lI5NRjpztVQXvGwf8xMIyrawUv0sO6EP3tnNU4YFklzMEdQt1SbugDSI1gRqT6KlENJsz6dycXY/Nz/j4ZWdgegG77akTXzlHTJ4zCsyehVP9Zrk/3ZY5v8bDDaSCR/tB9NVykRZTb4u/4oOugnNQ4g4sX3ILXfrdyRpXB1vo/4+FzBJxWS+jgEpIdnryePtIhcO+DFCXl+dnz2Q9bPQi+zYmm1ajqBsY6gu9UXnznpSnNJptARotW+YUp+vtR286ZOhBFSWh+SaOk7MO8CZ3HdS1lnwSqaxlCIngm3uPVuh1kaZw5NiBw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(396003)(136003)(366004)(346002)(376002)(5660300002)(83380400001)(41300700001)(6512007)(82960400001)(31686004)(8936002)(6506007)(478600001)(6666004)(26005)(53546011)(6486002)(8676002)(66556008)(36756003)(2906002)(4326008)(66476007)(66946007)(2616005)(38100700002)(316002)(86362001)(186003)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ek1JMkQ2K25XR1F5MTZVNlp3VFpFY0FVQkIwUlJob2tHSUJxWDNzWGtJRldR?=
 =?utf-8?B?NG15enBqWm82VEF2T1kwZzFmS25XcmFpS01rRWNXQjNuT2JnUEtXekVhKzFp?=
 =?utf-8?B?WEI4Yk1DbEwvajdFdE82THlyN1JEcVQwZFpFSnRUWkp6ZGFZb0RUYk9pNURx?=
 =?utf-8?B?NjJINzFBUDgwU1g2R1d5bGxES3UwRUVPcGtUYWVmdlZwRzBzdjhhMEh6a3hJ?=
 =?utf-8?B?VFhrY1JoTGd1YTRNNXVHR1d6aGZOV09rRCtNb1Z6ZVhZYWNsNmlUUTNzK1cz?=
 =?utf-8?B?RFU4MGEycTN0ZTBYRTJTRnBnZEkyakY5dUtZLzloT09kQnYxK0tMRnZacFpL?=
 =?utf-8?B?ampub1EyWmZpMzRGeW95emsrMnhBQTdUeGpEVkxyMTA2SVl0UU5MeU9aQ1Jt?=
 =?utf-8?B?REIyeDV1dUl4OWhTZVlsN0lQL2NQQjQ0MkppT2ZiV1VqY0s2Z3F4QVpURHV1?=
 =?utf-8?B?dG9COGl6eEpIb1AyV1p1Q0FFM3ZuYWhCbUpVQkVqelYyY1RIVEcyY0x4ekVG?=
 =?utf-8?B?eldoK0k4VGlsSXlMQnRVb1c3VGlyQ0JOOW5IVkZleVNYaTRlRHNYNGNMakZq?=
 =?utf-8?B?czM4b0pDUlRyZWxBelJxNUMxMTZHb1RRdG5hZTlMcnB1dGdBS3BRcy9lZ3d2?=
 =?utf-8?B?NDY4b0lLbjQ1WEhLM2YvK0V3VmlhRjJlSkp0Wnl2VjVsVU82M3JJdmpHNVZz?=
 =?utf-8?B?VitwUUxaSktxN3BDbjFjb3FIMEJqNy9iaVZrOVZ2Yk5hcUpINkpyMXFtT3o0?=
 =?utf-8?B?RitHdkxUSTVibVJEWXVpdXhwNTZtZ0wxNkFmZ0Y2a3BrSnlkU0lxOER2cVBo?=
 =?utf-8?B?bE5CQU9PdnNYWlJzNTBUUWRENEZhaG9aUTFWRXdhakpHYWVxUmVIRDJ2YXFm?=
 =?utf-8?B?d01LMnovZ2p3N04vTFRKKzJORndOdWovb1RVY2dEOGFmWVM1OGs3M1dZc213?=
 =?utf-8?B?WURNRHRWd2R5bzNrM1lVWURadk9FbGpVTnhjUm1IVStVSlI3VEdCWjBXbXZ1?=
 =?utf-8?B?R1R5b2gyRm4xYUhLQUhkb09raGtOYXNHbzV2aGN5NFo3NjdzemVOWGJrdDdU?=
 =?utf-8?B?dSsxa0RNQWxtdW1EOElMQzMvdDZZVmVYd3ZnNTJsTGdKTlFFU2xVQUhuMUpk?=
 =?utf-8?B?ZFlEaFhiVnJlOGR4aGFINW0wTG42TEFqYzFwUnhiU3hseXdSNm5mT2d3TXI0?=
 =?utf-8?B?dzNCWkU4cFZtaE9rVllUZW00VUlhNnZqTUJkeTFoMW5KbFllNVVDVktlZjdm?=
 =?utf-8?B?d2czUm56RXo5eHZMQ0RqTHhXYWI5SFVoTXo5NjZsMVE4NlJXWnVIMGh4djVp?=
 =?utf-8?B?Y3ZUSk9MTFlFM2N3VWZMSEVlemJHcDArZ2NLYjlRdzVYOFJmRFpQR2pVeGwy?=
 =?utf-8?B?Zk9vOHA1Mk1tT2NvTlFSVXF1VW9YcEtQLzc0SytnUm5SSkM5b2VvZUQxMzBY?=
 =?utf-8?B?WE12TDZJVnM0QTV0MTRsRnFkeFFjVmhlSnlBbzk3N1h3MlI1eW11ais0SmtE?=
 =?utf-8?B?enFTeENZb3VRbC9RbElLQTE0ZFg3S1ltZmpYUEwzcjFTbkxJRlVpU2REZWYx?=
 =?utf-8?B?Z2YvTjhYdzl0dTJvWTJiQW9va2p2TWlaTlQzWXF2MFFRZ2w1cVJuYUllN291?=
 =?utf-8?B?cnlkbkdtTlgvNm0zOG9oMndKTGNrNWJ1MlJSL2pIenlDUURMUTVqUUxhZHBC?=
 =?utf-8?B?QTJvK2lhQXpIU05xWXpRNDdaM2NUKzZnRk5PeFQ2NTNiczE4Q1c3aFRMcElw?=
 =?utf-8?B?SU9JL0tWWkV5UHRzUDNGYkhCQjg2QWhxaGxEdUtva0dSdUxLbmdaOUxwSW90?=
 =?utf-8?B?K1VuT1RHNHRlQ2dIajlXTWVhOFFUOFBRRVNrQ2dEa0g2UEZ3TmMzM2g5eGFz?=
 =?utf-8?B?UjN2REpTQmhLaC9OaUZwUmJEU1Z3MmJYdHAyRFhyd0VlbHZUR2lyVWNtUEpI?=
 =?utf-8?B?MGY1akdnbWVObHVTUElWMkpmd0pITGc4cmFZWFcvUVhlS3VOaVlBa25tMHNV?=
 =?utf-8?B?KzRVRENjaVVHMUE2RExMRTVlL1psREtwSWFrbVJ2V1R5MHpueUtxV3ZBcXA2?=
 =?utf-8?B?TzRKWlhiTHFJRW5BV2d5MXJha0dweThhbzc3K0NLbGlnZWtlamh6c1d0SHBW?=
 =?utf-8?B?RERmN0lwME55TlhLa0NLMWtvZEVuTHFWY0VyTk41MnhzZnVISUJDMmJaSWxt?=
 =?utf-8?B?SGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 69e7c232-b4cd-4647-b628-08da7f6ba2fc
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2022 09:42:30.2169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1f1gjzYf9NBhPxV973N+n9p+sDM0s4s7/W+MPWMZATH+5PoD8kVrZ/Uo+y/096fiy9PGR6HAyRtSkST6A6g/by8jBGx8M3CpGp1bKr5cCHE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0044
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
Cc: thomas.hellstrom@linux.intel.com, andi.shyti@linux.intel.com,
 airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 andrzej.hajda@intel.com, matthew.auld@intel.com, mchehab@kernel.org,
 nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/15/22 5:03 PM, Jani Nikula wrote:
> On Sat, 13 Aug 2022, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com> wrote:
>> There is an impedance mismatch between the first/last valid page
>> frame number of ttm place in unsigned and our memory/page accounting in
>> unsigned long.
>> As the object size is under the control of userspace, we have to be prudent
>> and catch the conversion errors.
>> To catch the implicit truncation as we switch from unsigned long to
>> unsigned, we use overflows_type check and report E2BIG or overflow_type
>> prior to the operation.
>>
>> v3: Not to change execution inside a macro. (Mauro)
>>      Add safe_conversion_gem_bug_on() macro and remove temporal
>>      SAFE_CONVERSION() macro.
>> v4: Fix unhandled GEM_BUG_ON() macro call from safe_conversion_gem_bug_on()
>> v6: Fix to follow general use case for GEM_BUG_ON(). (Jani)
>>
>> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>> Cc: Chris Wilson <chris@chris-wilson.co.uk>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Jani Nikula <jani.nikula@intel.com>
>> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com> (v2)
>> Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org> (v3)
>> Reported-by: kernel test robot <lkp@intel.com>
>> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com> (v5)
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c |  6 +++---
>>   drivers/gpu/drm/i915/intel_region_ttm.c | 22 +++++++++++++++++++---
>>   2 files changed, 22 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> index 9f2be1892b6c..30f488712abe 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> @@ -140,14 +140,14 @@ i915_ttm_place_from_region(const struct intel_memory_region *mr,
>>   	if (flags & I915_BO_ALLOC_CONTIGUOUS)
>>   		place->flags |= TTM_PL_FLAG_CONTIGUOUS;
>>   	if (offset != I915_BO_INVALID_OFFSET) {
>> -		place->fpfn = offset >> PAGE_SHIFT;
>> -		place->lpfn = place->fpfn + (size >> PAGE_SHIFT);
>> +		GEM_BUG_ON(!safe_conversion(&place->fpfn, offset >> PAGE_SHIFT));
>> +		GEM_BUG_ON(!safe_conversion(&place->lpfn, place->fpfn + (size >> PAGE_SHIFT)));
> 
> This would be the natural thing to do with BUG_ON/WARN_ON. And I'd like
> it if we could use it like this. But, as I tried to say, GEM_BUG_ON is
> nothing like BUG_ON/WARN_ON, and no code is generated for
> CONFIG_DRM_I915_DEBUG_GEM=n. And our CI will never catch it because it
> always has CONFIG_DRM_I915_DEBUG_GEM=y.
> 
Hi Jani,

Thanks for the detailed explanation of what the build option 
CONFIG_DRM_I915_DEBUG_GEM doesn't cover.

Using the WARN_ON() macro, I modified with the way in your comments on 
v5 version and sent the v7 patch again.

Many thanks,

G.G

> BR,
> Jani.
> 
> 
>>   	} else if (mr->io_size && mr->io_size < mr->total) {
>>   		if (flags & I915_BO_ALLOC_GPU_ONLY) {
>>   			place->flags |= TTM_PL_FLAG_TOPDOWN;
>>   		} else {
>>   			place->fpfn = 0;
>> -			place->lpfn = mr->io_size >> PAGE_SHIFT;
>> +			GEM_BUG_ON(!safe_conversion(&place->lpfn, mr->io_size >> PAGE_SHIFT));
>>   		}
>>   	}
>>   }
>> diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i915/intel_region_ttm.c
>> index 575d67bc6ffe..c480b0b50bcc 100644
>> --- a/drivers/gpu/drm/i915/intel_region_ttm.c
>> +++ b/drivers/gpu/drm/i915/intel_region_ttm.c
>> @@ -209,14 +209,28 @@ intel_region_ttm_resource_alloc(struct intel_memory_region *mem,
>>   	if (flags & I915_BO_ALLOC_CONTIGUOUS)
>>   		place.flags |= TTM_PL_FLAG_CONTIGUOUS;
>>   	if (offset != I915_BO_INVALID_OFFSET) {
>> -		place.fpfn = offset >> PAGE_SHIFT;
>> -		place.lpfn = place.fpfn + (size >> PAGE_SHIFT);
>> +		if (!safe_conversion(&place.fpfn, offset >> PAGE_SHIFT)) {
>> +			GEM_BUG_ON(!safe_conversion(&place.fpfn,offset >> PAGE_SHIFT));
>> +			ret = -E2BIG;
>> +			goto out;
>> +		}
>> +		if (!safe_conversion(&place.lpfn, place.fpfn + (size >> PAGE_SHIFT))) {
>> +			GEM_BUG_ON(!safe_conversion(&place.lpfn,
>> +						    place.fpfn + (size >> PAGE_SHIFT)));
>> +			ret = -E2BIG;
>> +			goto out;
>> +		}
>>   	} else if (mem->io_size && mem->io_size < mem->total) {
>>   		if (flags & I915_BO_ALLOC_GPU_ONLY) {
>>   			place.flags |= TTM_PL_FLAG_TOPDOWN;
>>   		} else {
>>   			place.fpfn = 0;
>> -			place.lpfn = mem->io_size >> PAGE_SHIFT;
>> +			if (!safe_conversion(&place.lpfn, mem->io_size >> PAGE_SHIFT)) {
>> +				GEM_BUG_ON(!safe_conversion(&place.lpfn,
>> +							    mem->io_size >> PAGE_SHIFT));
>> +				ret = -E2BIG;
>> +				goto out;
>> +			}
>>   		}
>>   	}
>>   
>> @@ -224,6 +238,8 @@ intel_region_ttm_resource_alloc(struct intel_memory_region *mem,
>>   	mock_bo.bdev = &mem->i915->bdev;
>>   
>>   	ret = man->func->alloc(man, &mock_bo, &place, &res);
>> +
>> +out:
>>   	if (ret == -ENOSPC)
>>   		ret = -ENXIO;
>>   	if (!ret)
> 
