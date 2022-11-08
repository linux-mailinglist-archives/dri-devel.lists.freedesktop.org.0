Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2CD621D4D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 20:54:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AEB410E01F;
	Tue,  8 Nov 2022 19:53:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5F3D10E01F;
 Tue,  8 Nov 2022 19:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667937233; x=1699473233;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DbpZWkvXseBmxYnruIiUmr9d4oJhg2+y7x4q53lsjkI=;
 b=PY4Lk33F+3mT0w5is1MtBOibymLAyXPRWQsUIan1mVbz0hDwZbeif+wt
 FqDQzEniSkweJi7xmh8Mt2CmN7qRLq4j8mJRQC58MvoslvW2T+yXShh2C
 QUpiOhsxxxBPZ5P5pK0D//73riL4eobxwJ18hLdnojxCbpvC85rKsBXJW
 x5LbXoG/Xcu8mRg4hToJQlrmMXdyb1M7Eh1vtV8tNwuK95e/i2eOoDV/S
 3tzqZZVi8FPeO1TENB4OIoSSh+pmDLRpbXbs5qY5HD9YraKZYGzkncgP7
 DSHL6CzPUuXX2kUw7URq5+bmdN3K4OKW5PFQl7bCBxjIHt8Ya1tOG7rts A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="312585267"
X-IronPort-AV: E=Sophos;i="5.96,148,1665471600"; d="scan'208";a="312585267"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2022 11:53:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="700056291"
X-IronPort-AV: E=Sophos;i="5.96,148,1665471600"; d="scan'208";a="700056291"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 08 Nov 2022 11:53:52 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 8 Nov 2022 11:53:52 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 8 Nov 2022 11:53:52 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 8 Nov 2022 11:53:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NpedxvleY6a+G61sd+GpytyAvOlDFKpXHY0BkpmQMFQtTmrO1cOFqNqHJ0NfcoF5Msbsxeu8j6MnXP6fxC/5603xLObwodR7vCadhtndxB8VKxzcnKS4MwdTJWzmLnIc2Xdh/l8mzY0D99cPFssTNe/CMWKY9yJwq7ZOoKC8iC+yKj1BJAyU8Z6DZxeZ2wa137V1xVohPqLmsM39wh2v6BrSWqOmd8is9QuBotHxMATHGPP4lm7vTlgsjxZL+kTKeVxXShcPa9zZiMfnAW17E0Y2PTSmY18CQFEsQfZwVX7cEWT/PikC7HfWSe4oVQ9avokSksrA+vEBe2xDp2Uc1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ItYqCUUawksmEQUjSjSjZ77Jf1MrgsleweBQFA9T39I=;
 b=VkOBfuqOY7EztMid4nYSVxhtJ37sBPyeVUFWz8Q9iUmEiKqXLnRO4dIIWL2D0sVhtqgl7Vt83o45F8+asuZPo7FhpKjK0/THqntZ4zlmhRIOrbS8p6WipO3x1CKxLLXSGedsTD9CZuM+g1GOilsjvYZYqgXoyNvo3lDTzLct/d+WB4xALZALyj7t/XDTknbQ0k3QSI7pK0JvPohLw64axInoFeqQuHuUtfCat8YFyRBytnNJCtKUpxny1Ug4QpBw6Aq+0ccG/sezodqDEE/WTwYcJt52SQKopFYMT3M2VW/c2Fc1GrhYP2BN8mfHMIP5XG+QQY5PqMuVQhRJajGnaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SJ0PR11MB6696.namprd11.prod.outlook.com (2603:10b6:a03:44f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.24; Tue, 8 Nov
 2022 19:53:49 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036%7]) with mapi id 15.20.5791.026; Tue, 8 Nov 2022
 19:53:49 +0000
Message-ID: <5722a25b-6ed8-2cb2-ee9f-6b57bfc4e9e3@intel.com>
Date: Tue, 8 Nov 2022 11:53:46 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.1
Subject: Re: [PATCH v2] drm/i915: Partial abandonment of legacy DRM logging
 macros
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-gfx@lists.freedesktop.org>
References: <20221108114950.2017869-1-tvrtko.ursulin@linux.intel.com>
 <20221108122608.2196810-1-tvrtko.ursulin@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20221108122608.2196810-1-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:a03:254::22) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SJ0PR11MB6696:EE_
X-MS-Office365-Filtering-Correlation-Id: 19939363-4523-4c60-b26f-08dac1c2f45c
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ICx5WI7l2KuKhlsJupAW/pCgG4aGAM+FItRDTjKg6ad0feWb+bL2YW1T50yYnbcDXHfKXchu9pLW5LyDjovy1KBSD2wi/j6xTKVVrBJEofygELFrL5gVpopNdm7WPYWdrpekXoeaf+yxp9ahdrX16ZmKdfLjtqyCsNGZ9X750qzSedSI13KKQTsSBdOmBuFBUYmY+8w9egClRzCnIxuri5u9dcnvhRo5ah/5G5v9ODBUHdYwgeQ320DQzOfh8XW5iAQcXAciCsDOgkarap8EooYV5lQnkFKIOJczwOkpuidFEGt4pwsueLvkCjbaBBm01K6FKO2x90mHzEZxhCh0V4NLq3mdCi0ZbEe5NqLIBEehdb86BMHP4ZG6ESSqsDGYR3hj5+gnWD3VbeJHoPW7T6cJ1j/XqgQ62IiKoTb5g0PeLjIGPtvbPs3c++XYA7uGj4w5aAmKwNbslAXdqxJ4sb8l2hNIdb6k3NNayTZ89l2SuxcEwRe6Tt6FhJq2xx/a9sFslCdEYQI8DsQ3uNwBGOB03BtxITPQiUOCo2s/bT+/OSI1mMxZMmsbwKMRwgHrxZ0Zas7I2zdoWMArIVUs4M+6DdIg+8cBunwFsiROYSM9KhKSc6r+Afx9FImix7W8jH9IkmTIe9fY+18RdFC5CH0wT4UKz6lq4dJ25nPaEP9a8rusOJOL6fGnCuwhqrWDhboP8lGvXK4DOoHGgZj/NJeWglzNPohXPYa3pU+w/e76cb3SB4SeRTnUuLpugsvA0P4VagIiLA5Hq5IRoXvWFrWKObj1e/lQHR804mI6O18=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(39860400002)(346002)(396003)(366004)(136003)(451199015)(316002)(31686004)(6486002)(478600001)(38100700002)(31696002)(82960400001)(86362001)(6666004)(5660300002)(54906003)(2616005)(30864003)(6506007)(41300700001)(36756003)(186003)(4326008)(8936002)(2906002)(66574015)(6512007)(66946007)(26005)(53546011)(8676002)(66556008)(66476007)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnlKSjFxaEVqbjc0M0VEdEhTemtQZ09LRUd2R3l3WmVvT1VweXRGWlJqa2hv?=
 =?utf-8?B?a0VuZWRxbUhIZVdWWjFhWDloT29VTlYxL0ZNV2dIWmNVT1JZc3JSbW13cm5x?=
 =?utf-8?B?S3JUYTFReGdkUXJDTXp5L1ZFQ2xKMVZvZ2J4ak96d3gwVUpuMk1FZVJHNnJL?=
 =?utf-8?B?aVp1bEJ1OEp3djNtVjZTY1hEb2QwL3YySzRkcnZvQldsTmMwTkFVb1Q0Y2Jo?=
 =?utf-8?B?bW1pYkRGS0I2NWc3SzJ6Y1lIQkRkSW1XRDgrdVUxN1JLWEs4bGxJYTVpRy9M?=
 =?utf-8?B?Wm5ZOHFMUHRSWTRFUE9kRkVzckJyS0NlUW0vRk9KMGt3aFpYRGlKcnJCMVI5?=
 =?utf-8?B?WUFRYTFHZ2lJbSt2MGhGLzk1eHErcUMrSTMzc0pkMWVINVR0cXRQNFArcEsv?=
 =?utf-8?B?em5YSFBLSUpGczB3aHN4TXlZVWM5Zys4NFVHbEROVXZjQUxROXBIMXJXU3VS?=
 =?utf-8?B?cUYwejY2bzNMN0FleVB2TXF0TndSUEZGbHQ5UVVweWJWc0JUNkkvT2ttdXVD?=
 =?utf-8?B?Q0pnRklKUGpXTkJqS2Q2TGUxMm0ybUE0eG91T0FUNm13a3A4Yk5NZjdmZEN4?=
 =?utf-8?B?YnBCK2tXaEE3aTZTUkR3VUxYU2JBQkJlamQ0ZExyMFM3M3RLY2lqQTVEUkZ0?=
 =?utf-8?B?R0h4YmIrbHdGWWRCQzB1WC9zaEhzQklObXZnWDdmTjVDVXNsZHphSmp0eDgy?=
 =?utf-8?B?cGhWTXlYZFJ5Umg0RDlZUXVGWnhOUERVOFo4d094Z3daMVF4QlltVFZrQS9N?=
 =?utf-8?B?U25Fc04yTm12VGIwSEZtaWdRTUNTUmN5UW40RVloUk1nQjBIR3oyWWNrNm1r?=
 =?utf-8?B?SDFYWnh3NEtYVG1Lc3gva3JxUGRSQ2xESmwySmptcEh5d0RpYUFHYnRzbmNw?=
 =?utf-8?B?YUJQRFlwaFVpOUhpS1l3NE50WWNmbnM3SmZVRkN6NmFXOFpKVWFHaG9kVk1H?=
 =?utf-8?B?Rmg4WWxKbVB5SkEzQk1qMDV6cTlXNFFXRGlpZk5pMUZlSks3dEg3dC8yQ2dH?=
 =?utf-8?B?dTRMeHNHUmMwN0owc2p4OS9PVEt4eFRtdjBXbFBxN1lYZzJlazJiNzFscFdl?=
 =?utf-8?B?bGpzbE5tcHk5cTl3Um5QNlNIYlFzV0RQWWhQTlpnb0JNQnp3REpFb2hjNW9s?=
 =?utf-8?B?bTllN0Vnclh0MjVGSkJtdjBHYWZHTm1veHh5bXNjUzRERXlWSkUwWEpMaEll?=
 =?utf-8?B?UjVoUitPN0VXNXhiWng1TTNnU0p6ZG1EempRQVdKOTY2MDBhOWVpU1ZZeWJ1?=
 =?utf-8?B?dmIrazgwWStWam4rSjBqaVJGMXdZbnhvWTZ5UEhmVVEySFdFTHdySyt2Yy9P?=
 =?utf-8?B?M3RQT2NUc2d3RDdoWVRUS0g2ckY1dmF4UGYwdGViSTFScGNlQmo3TEVVN3di?=
 =?utf-8?B?U1llTnpuaU1oZEpoWTRldlNXS1BJWnZwMWsweHl5L3N4WXNqaHRxVGVIY3R2?=
 =?utf-8?B?dklBNFprbUhhWW8zUDBBaHF1T2VrNEdETnFsNlc4MTNieDl6WnZ0c0JFMElW?=
 =?utf-8?B?RmVmQTJtYzY2dnRFR3YybWMyc2hTRWl6T0IzMFlYNjJ5VFo5cDNQaGVna1B2?=
 =?utf-8?B?ZW5IM3lRZUtCUmxGYkJVdERlQ1lySDVqUHcxSXJSTzVvTmJ2ODVZdVppemxD?=
 =?utf-8?B?TjJ2UGdibjljQm02Ym04TVFPVTZ5U2t0M201RUs2aitRN3NaejRpVVBqc09l?=
 =?utf-8?B?VzFncjdOVUhrWWJuTEs2eDZyZjRtTFJzUVgvR0lwekZwdFJmeWhpbHBLcytj?=
 =?utf-8?B?VXpwWTJiT2NxQnU5TjlaZitkZ2I2UWthS3hOZ2RSZHI3MENuSVBCQWZZYjJ5?=
 =?utf-8?B?NExpRjY1aElXT0gyTHlHT3lvU0E0cEkzUWx1UWNvUjMzWCs3OXB5N1JOdGlh?=
 =?utf-8?B?UTdJdG5WcmNPejYzalNha1hsWWNZZkJsSnBxNU4rRW54c1JVVDRMUGlLU2dQ?=
 =?utf-8?B?eTRBY2VOU2o4Vm5oMW5nNm52QWhjaGNVc0JuR09vVm5odi9OaFNYUmpKb2Js?=
 =?utf-8?B?MktyRERHa1hCVEhpNzZ5Tk1EVzJyNzZ5VEZTNFlXQ2pPUWhCZ1VXRHJKS0Iv?=
 =?utf-8?B?YTRpbGhKVlJzUkdOb0RjS3dJcUZONlY3K25vYkxMeUxrVFU5YklBTnBlSFBr?=
 =?utf-8?B?emEwWEJsck9QR29BdmhhZUhVc2lKRHh0cDdiaWFUUnNobXZhQlRQS3JncG12?=
 =?utf-8?B?dkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 19939363-4523-4c60-b26f-08dac1c2f45c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 19:53:49.5128 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NyTwg5+r9RQqUo1Z++7XWoSQR6STqw5VCemIIAAIf2tGGlfIxGz0M1dMYnwZ8gSC/oLWyS5WmrjEIqex84DejDPhvWmeHlwIN61nidCEl6c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6696
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
Cc: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/8/2022 04:26, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Convert some usages of legacy DRM logging macros into versions which tell
> us on which device have the events occurred.
>
> v2:
>   * Don't have struct drm_device as local. (Jani, Ville)
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_context.c   |  2 +-
>   .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 26 +++++++----
>   .../drm/i915/gt/intel_execlists_submission.c  | 13 +++---
>   drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c  |  4 +-
>   drivers/gpu/drm/i915/gt/intel_gt.c            |  4 +-
>   drivers/gpu/drm/i915/gt/intel_gt_irq.c        |  8 ++--
>   drivers/gpu/drm/i915/gt/intel_rps.c           |  6 ++-
>   drivers/gpu/drm/i915/gt/intel_workarounds.c   | 43 +++++++++++--------
>   .../gpu/drm/i915/gt/intel_workarounds_types.h |  4 ++
>   .../gpu/drm/i915/gt/selftest_workarounds.c    |  4 +-
>   drivers/gpu/drm/i915/i915_debugfs.c           |  4 +-
>   drivers/gpu/drm/i915/i915_gem.c               |  2 +-
>   drivers/gpu/drm/i915/i915_getparam.c          |  2 +-
>   drivers/gpu/drm/i915/i915_irq.c               | 12 +++---
>   drivers/gpu/drm/i915/i915_perf.c              | 14 +++---
>   drivers/gpu/drm/i915/i915_query.c             | 12 +++---
>   drivers/gpu/drm/i915/i915_sysfs.c             |  3 +-
>   drivers/gpu/drm/i915/i915_vma.c               | 16 ++++---
>   drivers/gpu/drm/i915/intel_uncore.c           | 21 +++++----
>   19 files changed, 119 insertions(+), 81 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 01402f3c58f6..7f2831efc798 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -546,7 +546,7 @@ set_proto_ctx_engines_bond(struct i915_user_extension __user *base, void *data)
>   	}
>   
>   	if (intel_engine_uses_guc(master)) {
> -		DRM_DEBUG("bonding extension not supported with GuC submission");
> +		drm_dbg(&i915->drm, "bonding extension not supported with GuC submission");
>   		return -ENODEV;
>   	}
>   
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 1160723c9d2d..f65fd03f7cf2 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -2148,7 +2148,8 @@ static int eb_move_to_gpu(struct i915_execbuffer *eb)
>   	return err;
>   }
>   
> -static int i915_gem_check_execbuffer(struct drm_i915_gem_execbuffer2 *exec)
> +static int i915_gem_check_execbuffer(struct drm_i915_private *i915,
> +				     struct drm_i915_gem_execbuffer2 *exec)
>   {
>   	if (exec->flags & __I915_EXEC_ILLEGAL_FLAGS)
>   		return -EINVAL;
> @@ -2161,7 +2162,7 @@ static int i915_gem_check_execbuffer(struct drm_i915_gem_execbuffer2 *exec)
>   	}
>   
>   	if (exec->DR4 == 0xffffffff) {
> -		DRM_DEBUG("UXA submitting garbage DR4, fixing up\n");
> +		drm_dbg(&i915->drm, "UXA submitting garbage DR4, fixing up\n");
>   		exec->DR4 = 0;
>   	}
>   	if (exec->DR1 || exec->DR4)
> @@ -2799,7 +2800,8 @@ add_timeline_fence_array(struct i915_execbuffer *eb,
>   
>   		syncobj = drm_syncobj_find(eb->file, user_fence.handle);
>   		if (!syncobj) {
> -			DRM_DEBUG("Invalid syncobj handle provided\n");
> +			drm_dbg(&eb->i915->drm,
> +				"Invalid syncobj handle provided\n");
>   			return -ENOENT;
>   		}
>   
> @@ -2807,7 +2809,8 @@ add_timeline_fence_array(struct i915_execbuffer *eb,
>   
>   		if (!fence && user_fence.flags &&
>   		    !(user_fence.flags & I915_EXEC_FENCE_SIGNAL)) {
> -			DRM_DEBUG("Syncobj handle has no fence\n");
> +			drm_dbg(&eb->i915->drm,
> +				"Syncobj handle has no fence\n");
>   			drm_syncobj_put(syncobj);
>   			return -EINVAL;
>   		}
> @@ -2816,7 +2819,9 @@ add_timeline_fence_array(struct i915_execbuffer *eb,
>   			err = dma_fence_chain_find_seqno(&fence, point);
>   
>   		if (err && !(user_fence.flags & I915_EXEC_FENCE_SIGNAL)) {
> -			DRM_DEBUG("Syncobj handle missing requested point %llu\n", point);
> +			drm_dbg(&eb->i915->drm,
> +				"Syncobj handle missing requested point %llu\n",
> +				point);
>   			dma_fence_put(fence);
>   			drm_syncobj_put(syncobj);
>   			return err;
> @@ -2842,7 +2847,8 @@ add_timeline_fence_array(struct i915_execbuffer *eb,
>   			 * 0) would break the timeline.
>   			 */
>   			if (user_fence.flags & I915_EXEC_FENCE_WAIT) {
> -				DRM_DEBUG("Trying to wait & signal the same timeline point.\n");
> +				drm_dbg(&eb->i915->drm,
> +					"Trying to wait & signal the same timeline point.\n");
>   				dma_fence_put(fence);
>   				drm_syncobj_put(syncobj);
>   				return -EINVAL;
> @@ -2913,14 +2919,16 @@ static int add_fence_array(struct i915_execbuffer *eb)
>   
>   		syncobj = drm_syncobj_find(eb->file, user_fence.handle);
>   		if (!syncobj) {
> -			DRM_DEBUG("Invalid syncobj handle provided\n");
> +			drm_dbg(&eb->i915->drm,
> +				"Invalid syncobj handle provided\n");
>   			return -ENOENT;
>   		}
>   
>   		if (user_fence.flags & I915_EXEC_FENCE_WAIT) {
>   			fence = drm_syncobj_fence_get(syncobj);
>   			if (!fence) {
> -				DRM_DEBUG("Syncobj handle has no fence\n");
> +				drm_dbg(&eb->i915->drm,
> +					"Syncobj handle has no fence\n");
>   				drm_syncobj_put(syncobj);
>   				return -EINVAL;
>   			}
> @@ -3515,7 +3523,7 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
>   		return -EINVAL;
>   	}
>   
> -	err = i915_gem_check_execbuffer(args);
> +	err = i915_gem_check_execbuffer(i915, args);
>   	if (err)
>   		return err;
>   
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index 0187bc72310d..d92512780467 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -3921,6 +3921,7 @@ static struct intel_context *
>   execlists_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
>   			 unsigned long flags)
>   {
> +	struct drm_i915_private *i915 = siblings[0]->i915;
>   	struct virtual_engine *ve;
>   	unsigned int n;
>   	int err;
> @@ -3929,7 +3930,7 @@ execlists_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
>   	if (!ve)
>   		return ERR_PTR(-ENOMEM);
>   
> -	ve->base.i915 = siblings[0]->i915;
> +	ve->base.i915 = i915;
>   	ve->base.gt = siblings[0]->gt;
>   	ve->base.uncore = siblings[0]->uncore;
>   	ve->base.id = -1;
> @@ -3988,8 +3989,9 @@ execlists_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
>   
>   		GEM_BUG_ON(!is_power_of_2(sibling->mask));
>   		if (sibling->mask & ve->base.mask) {
> -			DRM_DEBUG("duplicate %s entry in load balancer\n",
> -				  sibling->name);
> +			drm_dbg(&i915->drm,
> +				"duplicate %s entry in load balancer\n",
> +				sibling->name);
It was already decided to convert these to use a GT specific printer. So 
this patch is only half implemented.

>   			err = -EINVAL;
>   			goto err_put;
>   		}
> @@ -4023,8 +4025,9 @@ execlists_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
>   		 */
>   		if (ve->base.class != OTHER_CLASS) {
>   			if (ve->base.class != sibling->class) {
> -				DRM_DEBUG("invalid mixing of engine class, sibling %d, already %d\n",
> -					  sibling->class, ve->base.class);
> +				drm_dbg(&i915->drm,
> +					"invalid mixing of engine class, sibling %d, already %d\n",
> +					sibling->class, ve->base.class);
>   				err = -EINVAL;
>   				goto err_put;
>   			}
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
> index ea775e601686..995082d45cb2 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
> @@ -816,8 +816,8 @@ i915_gem_object_save_bit_17_swizzle(struct drm_i915_gem_object *obj,
>   	if (obj->bit_17 == NULL) {
>   		obj->bit_17 = bitmap_zalloc(page_count, GFP_KERNEL);
>   		if (obj->bit_17 == NULL) {
> -			DRM_ERROR("Failed to allocate memory for bit 17 "
> -				  "record\n");
> +			drm_err(&to_i915(obj->base.dev)->drm,
> +				"Failed to allocate memory for bit 17 record\n");
>   			return;
>   		}
>   	}
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 8e914c4066ed..0ba7d6f36b28 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -190,7 +190,7 @@ int intel_gt_init_hw(struct intel_gt *gt)
>   
>   	ret = i915_ppgtt_init_hw(gt);
>   	if (ret) {
> -		DRM_ERROR("Enabling PPGTT failed (%d)\n", ret);
> +		drm_err(&i915->drm, "Enabling PPGTT failed (%d)\n", ret);
>   		goto out;
>   	}
>   
> @@ -262,7 +262,7 @@ intel_gt_clear_error_registers(struct intel_gt *gt,
>   		 * some errors might have become stuck,
>   		 * mask them.
>   		 */
> -		DRM_DEBUG_DRIVER("EIR stuck: 0x%08x, masking\n", eir);
> +		drm_dbg(&gt->i915->drm, "EIR stuck: 0x%08x, masking\n", eir);
>   		rmw_set(uncore, EMR, eir);
>   		intel_uncore_write(uncore, GEN2_IIR,
>   				   I915_MASTER_ERROR_INTERRUPT);
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> index b197f0e9794f..4c8ddd074b78 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> @@ -44,8 +44,9 @@ gen11_gt_engine_identity(struct intel_gt *gt,
>   		 !time_after32(local_clock() >> 10, timeout_ts));
>   
>   	if (unlikely(!(ident & GEN11_INTR_DATA_VALID))) {
> -		DRM_ERROR("INTR_IDENTITY_REG%u:%u 0x%08x not valid!\n",
> -			  bank, bit, ident);
> +		drm_err(&gt->i915->drm,
> +			"INTR_IDENTITY_REG%u:%u 0x%08x not valid!\n",
> +			bank, bit, ident);
>   		return 0;
>   	}
>   
> @@ -364,7 +365,8 @@ void gen6_gt_irq_handler(struct intel_gt *gt, u32 gt_iir)
>   	if (gt_iir & (GT_BLT_CS_ERROR_INTERRUPT |
>   		      GT_BSD_CS_ERROR_INTERRUPT |
>   		      GT_CS_MASTER_ERROR_INTERRUPT))
> -		DRM_DEBUG("Command parser error, gt_iir 0x%08x\n", gt_iir);
> +		drm_dbg(&gt->i915->drm, "Command parser error, gt_iir 0x%08x\n",
> +			gt_iir);
>   
>   	if (gt_iir & GT_PARITY_ERROR(gt->i915))
>   		gen7_parity_error_irq_handler(gt, gt_iir);
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> index 6c34a83c24b3..effe60ac22cd 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> @@ -430,7 +430,8 @@ static int __gen5_rps_set(struct intel_rps *rps, u8 val)
>   
>   	rgvswctl = intel_uncore_read16(uncore, MEMSWCTL);
>   	if (rgvswctl & MEMCTL_CMD_STS) {
> -		DRM_DEBUG("gpu busy, RCS change rejected\n");
> +		drm_dbg(&rps_to_i915(rps)->drm,
> +			"gpu busy, RCS change rejected\n");
>   		return -EBUSY; /* still busy with another command */
>   	}
>   
> @@ -1953,7 +1954,8 @@ void gen6_rps_irq_handler(struct intel_rps *rps, u32 pm_iir)
>   		intel_engine_cs_irq(gt->engine[VECS0], pm_iir >> 10);
>   
>   	if (pm_iir & PM_VEBOX_CS_ERROR_INTERRUPT)
> -		DRM_DEBUG("Command parser error, pm_iir 0x%08x\n", pm_iir);
> +		drm_dbg(&rps_to_i915(rps)->drm,
> +			"Command parser error, pm_iir 0x%08x\n", pm_iir);
>   }
>   
>   void gen5_rps_irq_handler(struct intel_rps *rps)
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 3cdf5c24dbc5..2af97d954fc4 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -55,8 +55,11 @@
>    * - Public functions to init or apply the given workaround type.
>    */
>   
> -static void wa_init_start(struct i915_wa_list *wal, const char *name, const char *engine_name)
> +static void wa_init_start(struct i915_wa_list *wal,
> +			  struct drm_i915_private *i915,
> +			  const char *name, const char *engine_name)
>   {
> +	wal->i915 = i915;
>   	wal->name = name;
>   	wal->engine_name = engine_name;
>   }
> @@ -80,13 +83,14 @@ static void wa_init_finish(struct i915_wa_list *wal)
>   	if (!wal->count)
>   		return;
>   
> -	DRM_DEBUG_DRIVER("Initialized %u %s workarounds on %s\n",
> -			 wal->wa_count, wal->name, wal->engine_name);
> +	drm_dbg(&wal->i915->drm, "Initialized %u %s workarounds on %s\n",
> +		wal->wa_count, wal->name, wal->engine_name);
>   }
>   
>   static void _wa_add(struct i915_wa_list *wal, const struct i915_wa *wa)
>   {
>   	unsigned int addr = i915_mmio_reg_offset(wa->reg);
> +	struct drm_i915_private *i915 = wal->i915;
>   	unsigned int start = 0, end = wal->count;
>   	const unsigned int grow = WA_LIST_CHUNK;
>   	struct i915_wa *wa_;
> @@ -99,7 +103,7 @@ static void _wa_add(struct i915_wa_list *wal, const struct i915_wa *wa)
>   		list = kmalloc_array(ALIGN(wal->count + 1, grow), sizeof(*wa),
>   				     GFP_KERNEL);
>   		if (!list) {
> -			DRM_ERROR("No space for workaround init!\n");
> +			drm_err(&i915->drm, "No space for workaround init!\n");
>   			return;
>   		}
>   
> @@ -122,9 +126,10 @@ static void _wa_add(struct i915_wa_list *wal, const struct i915_wa *wa)
>   			wa_ = &wal->list[mid];
>   
>   			if ((wa->clr | wa_->clr) && !(wa->clr & ~wa_->clr)) {
> -				DRM_ERROR("Discarding overwritten w/a for reg %04x (clear: %08x, set: %08x)\n",
> -					  i915_mmio_reg_offset(wa_->reg),
> -					  wa_->clr, wa_->set);
> +				drm_err(&i915->drm,
> +					"Discarding overwritten w/a for reg %04x (clear: %08x, set: %08x)\n",
> +					i915_mmio_reg_offset(wa_->reg),
> +					wa_->clr, wa_->set);
>   
>   				wa_->set &= ~wa->clr;
>   			}
> @@ -826,7 +831,7 @@ __intel_engine_init_ctx_wa(struct intel_engine_cs *engine,
>   {
>   	struct drm_i915_private *i915 = engine->i915;
>   
> -	wa_init_start(wal, name, engine->name);
> +	wa_init_start(wal, i915, name, engine->name);
>   
>   	/* Applies to all engines */
>   	/*
> @@ -1676,7 +1681,7 @@ void intel_gt_init_workarounds(struct intel_gt *gt)
>   {
>   	struct i915_wa_list *wal = &gt->wa_list;
>   
> -	wa_init_start(wal, "GT", "global");
> +	wa_init_start(wal, gt->i915, "GT", "global");
>   	gt_init_workarounds(gt, wal);
>   	wa_init_finish(wal);
>   }
> @@ -1698,12 +1703,14 @@ wal_get_fw_for_rmw(struct intel_uncore *uncore, const struct i915_wa_list *wal)
>   }
>   
>   static bool
> -wa_verify(const struct i915_wa *wa, u32 cur, const char *name, const char *from)
> +wa_verify(struct drm_i915_private *i915, const struct i915_wa *wa, u32 cur,
> +	  const char *name, const char *from)
>   {
>   	if ((cur ^ wa->set) & wa->read) {
> -		DRM_ERROR("%s workaround lost on %s! (reg[%x]=0x%x, relevant bits were 0x%x vs expected 0x%x)\n",
> -			  name, from, i915_mmio_reg_offset(wa->reg),
> -			  cur, cur & wa->read, wa->set & wa->read);
> +		drm_err(&i915->drm,
> +			"%s workaround lost on %s! (reg[%x]=0x%x, relevant bits were 0x%x vs expected 0x%x)\n",
> +			name, from, i915_mmio_reg_offset(wa->reg),
> +			cur, cur & wa->read, wa->set & wa->read);
>   
>   		return false;
>   	}
> @@ -1749,7 +1756,7 @@ wa_list_apply(struct intel_gt *gt, const struct i915_wa_list *wal)
>   				intel_gt_mcr_read_any_fw(gt, wa->mcr_reg) :
>   				intel_uncore_read_fw(uncore, wa->reg);
>   
> -			wa_verify(wa, val, wal->name, "application");
> +			wa_verify(wal->i915, wa, val, wal->name, "application");
>   		}
>   	}
>   
> @@ -1779,7 +1786,7 @@ static bool wa_list_verify(struct intel_gt *gt,
>   	intel_uncore_forcewake_get__locked(uncore, fw);
>   
>   	for (i = 0, wa = wal->list; i < wal->count; i++, wa++)
> -		ok &= wa_verify(wa, wa->is_mcr ?
> +		ok &= wa_verify(wal->i915, wa, wa->is_mcr ?
>   				intel_gt_mcr_read_any_fw(gt, wa->mcr_reg) :
>   				intel_uncore_read_fw(uncore, wa->reg),
>   				wal->name, from);
> @@ -2127,7 +2134,7 @@ void intel_engine_init_whitelist(struct intel_engine_cs *engine)
>   	struct drm_i915_private *i915 = engine->i915;
>   	struct i915_wa_list *w = &engine->whitelist;
>   
> -	wa_init_start(w, "whitelist", engine->name);
> +	wa_init_start(w, i915, "whitelist", engine->name);
>   
>   	if (IS_PONTEVECCHIO(i915))
>   		pvc_whitelist_build(engine);
> @@ -3012,7 +3019,7 @@ void intel_engine_init_workarounds(struct intel_engine_cs *engine)
>   	if (GRAPHICS_VER(engine->i915) < 4)
>   		return;
>   
> -	wa_init_start(wal, "engine", engine->name);
> +	wa_init_start(wal, engine->i915, "engine", engine->name);
>   	engine_init_workarounds(engine, wal);
>   	wa_init_finish(wal);
>   }
> @@ -3193,7 +3200,7 @@ static int engine_wa_list_verify(struct intel_context *ce,
>   		if (mcr_range(rq->engine->i915, i915_mmio_reg_offset(wa->reg)))
>   			continue;
>   
> -		if (!wa_verify(wa, results[i], wal->name, from))
> +		if (!wa_verify(wal->i915, wa, results[i], wal->name, from))
>   			err = -ENXIO;
>   	}
>   
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds_types.h b/drivers/gpu/drm/i915/gt/intel_workarounds_types.h
> index 7c8b01d00043..7e51e0219a5d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds_types.h
> @@ -10,6 +10,8 @@
>   
>   #include "i915_reg_defs.h"
>   
> +struct drm_i915_private;
> +
>   struct i915_wa {
>   	union {
>   		i915_reg_t	reg;
> @@ -24,6 +26,8 @@ struct i915_wa {
>   };
>   
>   struct i915_wa_list {
> +	struct drm_i915_private *i915;
> +
Adding an i915 is wrong given that these are all supposed to be being 
converted to GT specific prints. wa_init_start is always called with 
access to a GT. So that is what should be saved for future message 
output usage.

John.


>   	const char	*name;
>   	const char	*engine_name;
>   	struct i915_wa	*list;
> diff --git a/drivers/gpu/drm/i915/gt/selftest_workarounds.c b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
> index 21b1edc052f8..3dd761a690d7 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
> @@ -66,14 +66,14 @@ reference_lists_init(struct intel_gt *gt, struct wa_lists *lists)
>   
>   	memset(lists, 0, sizeof(*lists));
>   
> -	wa_init_start(&lists->gt_wa_list, "GT_REF", "global");
> +	wa_init_start(&lists->gt_wa_list, gt->i915, "GT_REF", "global");
>   	gt_init_workarounds(gt, &lists->gt_wa_list);
>   	wa_init_finish(&lists->gt_wa_list);
>   
>   	for_each_engine(engine, gt, id) {
>   		struct i915_wa_list *wal = &lists->engine[id].wa_list;
>   
> -		wa_init_start(wal, "REF", engine->name);
> +		wa_init_start(wal, gt->i915, "REF", engine->name);
>   		engine_init_workarounds(engine, wal);
>   		wa_init_finish(wal);
>   
> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
> index ae987e92251d..6c7ac73b69a5 100644
> --- a/drivers/gpu/drm/i915/i915_debugfs.c
> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
> @@ -688,8 +688,8 @@ i915_drop_caches_set(void *data, u64 val)
>   	unsigned int flags;
>   	int ret;
>   
> -	DRM_DEBUG("Dropping caches: 0x%08llx [0x%08llx]\n",
> -		  val, val & DROP_ALL);
> +	drm_dbg(&i915->drm, "Dropping caches: 0x%08llx [0x%08llx]\n",
> +		val, val & DROP_ALL);
>   
>   	ret = gt_drop_caches(to_gt(i915), val);
>   	if (ret)
> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
> index 299f94a9fb87..8132743ca87e 100644
> --- a/drivers/gpu/drm/i915/i915_gem.c
> +++ b/drivers/gpu/drm/i915/i915_gem.c
> @@ -1286,7 +1286,7 @@ int i915_gem_open(struct drm_i915_private *i915, struct drm_file *file)
>   	struct i915_drm_client *client;
>   	int ret = -ENOMEM;
>   
> -	DRM_DEBUG("\n");
> +	drm_dbg(&i915->drm, "\n");
>   
>   	file_priv = kzalloc(sizeof(*file_priv), GFP_KERNEL);
>   	if (!file_priv)
> diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i915/i915_getparam.c
> index 3047e80e1163..61ef2d9cfa62 100644
> --- a/drivers/gpu/drm/i915/i915_getparam.c
> +++ b/drivers/gpu/drm/i915/i915_getparam.c
> @@ -179,7 +179,7 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
>   		value = i915_perf_oa_timestamp_frequency(i915);
>   		break;
>   	default:
> -		DRM_DEBUG("Unknown parameter %d\n", param->param);
> +		drm_dbg(&i915->drm, "Unknown parameter %d\n", param->param);
>   		return -EINVAL;
>   	}
>   
> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
> index b0180ea38de0..6c20817f8967 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -1086,8 +1086,9 @@ static void ivb_parity_work(struct work_struct *work)
>   		kobject_uevent_env(&dev_priv->drm.primary->kdev->kobj,
>   				   KOBJ_CHANGE, parity_event);
>   
> -		DRM_DEBUG("Parity error: Slice = %d, Row = %d, Bank = %d, Sub bank = %d.\n",
> -			  slice, row, bank, subbank);
> +		drm_dbg(&dev_priv->drm,
> +			"Parity error: Slice = %d, Row = %d, Bank = %d, Sub bank = %d.\n",
> +			slice, row, bank, subbank);
>   
>   		kfree(parity_event[4]);
>   		kfree(parity_event[3]);
> @@ -2774,7 +2775,8 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>   		master_ctl = raw_reg_read(regs, GEN11_GFX_MSTR_IRQ);
>   		raw_reg_write(regs, GEN11_GFX_MSTR_IRQ, master_ctl);
>   	} else {
> -		DRM_ERROR("Tile not supported: 0x%08x\n", master_tile_ctl);
> +		drm_err(&i915->drm, "Tile not supported: 0x%08x\n",
> +			master_tile_ctl);
>   		dg1_master_intr_enable(regs);
>   		return IRQ_NONE;
>   	}
> @@ -3940,7 +3942,7 @@ static void i8xx_error_irq_ack(struct drm_i915_private *i915,
>   static void i8xx_error_irq_handler(struct drm_i915_private *dev_priv,
>   				   u16 eir, u16 eir_stuck)
>   {
> -	DRM_DEBUG("Master Error: EIR 0x%04x\n", eir);
> +	drm_dbg(&dev_priv->drm, "Master Error: EIR 0x%04x\n", eir);
>   
>   	if (eir_stuck)
>   		drm_dbg(&dev_priv->drm, "EIR stuck: 0x%04x, masked\n",
> @@ -3975,7 +3977,7 @@ static void i9xx_error_irq_ack(struct drm_i915_private *dev_priv,
>   static void i9xx_error_irq_handler(struct drm_i915_private *dev_priv,
>   				   u32 eir, u32 eir_stuck)
>   {
> -	DRM_DEBUG("Master Error, EIR 0x%08x\n", eir);
> +	drm_dbg(&dev_priv->drm, "Master Error, EIR 0x%08x\n", eir);
>   
>   	if (eir_stuck)
>   		drm_dbg(&dev_priv->drm, "EIR stuck: 0x%08x, masked\n",
> diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
> index 0dd597a7a11f..9e6f060592d8 100644
> --- a/drivers/gpu/drm/i915/i915_perf.c
> +++ b/drivers/gpu/drm/i915/i915_perf.c
> @@ -530,9 +530,9 @@ static bool oa_buffer_check_unlocked(struct i915_perf_stream *stream)
>   
>   		if (OA_TAKEN(hw_tail, tail) > report_size &&
>   		    __ratelimit(&stream->perf->tail_pointer_race))
> -			DRM_NOTE("unlanded report(s) head=0x%x "
> -				 "tail=0x%x hw_tail=0x%x\n",
> -				 head, tail, hw_tail);
> +			drm_notice(&stream->uncore->i915->drm,
> +				   "unlanded report(s) head=0x%x tail=0x%x hw_tail=0x%x\n",
> +				   head, tail, hw_tail);
>   
>   		stream->oa_buffer.tail = gtt_offset + tail;
>   		stream->oa_buffer.aging_tail = gtt_offset + hw_tail;
> @@ -1015,7 +1015,8 @@ static int gen7_append_oa_reports(struct i915_perf_stream *stream,
>   		 */
>   		if (report32[0] == 0) {
>   			if (__ratelimit(&stream->perf->spurious_report_rs))
> -				DRM_NOTE("Skipping spurious, invalid OA report\n");
> +				drm_notice(&uncore->i915->drm,
> +					   "Skipping spurious, invalid OA report\n");
>   			continue;
>   		}
>   
> @@ -1602,8 +1603,9 @@ static void i915_oa_stream_destroy(struct i915_perf_stream *stream)
>   	free_noa_wait(stream);
>   
>   	if (perf->spurious_report_rs.missed) {
> -		DRM_NOTE("%d spurious OA report notices suppressed due to ratelimiting\n",
> -			 perf->spurious_report_rs.missed);
> +		drm_notice(&gt->i915->drm,
> +			   "%d spurious OA report notices suppressed due to ratelimiting\n",
> +			   perf->spurious_report_rs.missed);
>   	}
>   }
>   
> diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
> index 6ec9c9fb7b0d..00871ef99792 100644
> --- a/drivers/gpu/drm/i915/i915_query.c
> +++ b/drivers/gpu/drm/i915/i915_query.c
> @@ -250,8 +250,9 @@ static int query_perf_config_data(struct drm_i915_private *i915,
>   		return total_size;
>   
>   	if (query_item->length < total_size) {
> -		DRM_DEBUG("Invalid query config data item size=%u expected=%u\n",
> -			  query_item->length, total_size);
> +		drm_dbg(&i915->drm,
> +			"Invalid query config data item size=%u expected=%u\n",
> +			query_item->length, total_size);
>   		return -EINVAL;
>   	}
>   
> @@ -418,9 +419,10 @@ static int query_perf_config_list(struct drm_i915_private *i915,
>   	} while (n_configs > alloc);
>   
>   	if (query_item->length < sizeof_perf_config_list(n_configs)) {
> -		DRM_DEBUG("Invalid query config list item size=%u expected=%zu\n",
> -			  query_item->length,
> -			  sizeof_perf_config_list(n_configs));
> +		drm_dbg(&i915->drm,
> +			"Invalid query config list item size=%u expected=%zu\n",
> +			query_item->length,
> +			sizeof_perf_config_list(n_configs));
>   		kfree(oa_config_ids);
>   		return -EINVAL;
>   	}
> diff --git a/drivers/gpu/drm/i915/i915_sysfs.c b/drivers/gpu/drm/i915/i915_sysfs.c
> index 1e2750210831..595e8b574990 100644
> --- a/drivers/gpu/drm/i915/i915_sysfs.c
> +++ b/drivers/gpu/drm/i915/i915_sysfs.c
> @@ -218,7 +218,8 @@ static const struct bin_attribute error_state_attr = {
>   static void i915_setup_error_capture(struct device *kdev)
>   {
>   	if (sysfs_create_bin_file(&kdev->kobj, &error_state_attr))
> -		DRM_ERROR("error_state sysfs setup failed\n");
> +		drm_err(&kdev_minor_to_i915(kdev)->drm,
> +			"error_state sysfs setup failed\n");
>   }
>   
>   static void i915_teardown_error_capture(struct device *kdev)
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index c39488eb9eeb..3b969d679c1e 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -73,14 +73,16 @@ static void vma_print_allocator(struct i915_vma *vma, const char *reason)
>   	char buf[512];
>   
>   	if (!vma->node.stack) {
> -		DRM_DEBUG_DRIVER("vma.node [%08llx + %08llx] %s: unknown owner\n",
> -				 vma->node.start, vma->node.size, reason);
> +		drm_dbg(&to_i915(vma->obj->base.dev)->drm
> +			"vma.node [%08llx + %08llx] %s: unknown owner\n",
> +			vma->node.start, vma->node.size, reason);
>   		return;
>   	}
>   
>   	stack_depot_snprint(vma->node.stack, buf, sizeof(buf), 0);
> -	DRM_DEBUG_DRIVER("vma.node [%08llx + %08llx] %s: inserted at %s\n",
> -			 vma->node.start, vma->node.size, reason, buf);
> +	drm_dbg(&to_i915(vma->obj->base.dev)->drm,
> +		"vma.node [%08llx + %08llx] %s: inserted at %s\n",
> +		vma->node.start, vma->node.size, reason, buf);
>   }
>   
>   #else
> @@ -782,9 +784,9 @@ i915_vma_insert(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>   	 * attempt to find space.
>   	 */
>   	if (size > end) {
> -		DRM_DEBUG("Attempting to bind an object larger than the aperture: request=%llu > %s aperture=%llu\n",
> -			  size, flags & PIN_MAPPABLE ? "mappable" : "total",
> -			  end);
> +		drm_dbg(&to_i915(vma->obj->base.dev)->drm,
> +			"Attempting to bind an object larger than the aperture: request=%llu > %s aperture=%llu\n",
> +			size, flags & PIN_MAPPABLE ? "mappable" : "total", end);
>   		return -ENOSPC;
>   	}
>   
> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
> index 2a3e2869fe71..6c25c9e7090a 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.c
> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> @@ -178,8 +178,9 @@ static inline void
>   fw_domain_wait_ack_clear(const struct intel_uncore_forcewake_domain *d)
>   {
>   	if (wait_ack_clear(d, FORCEWAKE_KERNEL)) {
> -		DRM_ERROR("%s: timed out waiting for forcewake ack to clear.\n",
> -			  intel_uncore_forcewake_domain_to_str(d->id));
> +		drm_err(&d->uncore->i915->drm,
> +			"%s: timed out waiting for forcewake ack to clear.\n",
> +			intel_uncore_forcewake_domain_to_str(d->id));
>   		add_taint_for_CI(d->uncore->i915, TAINT_WARN); /* CI now unreliable */
>   	}
>   }
> @@ -226,11 +227,12 @@ fw_domain_wait_ack_with_fallback(const struct intel_uncore_forcewake_domain *d,
>   		fw_clear(d, FORCEWAKE_KERNEL_FALLBACK);
>   	} while (!ack_detected && pass++ < 10);
>   
> -	DRM_DEBUG_DRIVER("%s had to use fallback to %s ack, 0x%x (passes %u)\n",
> -			 intel_uncore_forcewake_domain_to_str(d->id),
> -			 type == ACK_SET ? "set" : "clear",
> -			 fw_ack(d),
> -			 pass);
> +	drm_dbg(&d->uncore->i915->drm,
> +		"%s had to use fallback to %s ack, 0x%x (passes %u)\n",
> +		intel_uncore_forcewake_domain_to_str(d->id),
> +		type == ACK_SET ? "set" : "clear",
> +		fw_ack(d),
> +		pass);
>   
>   	return ack_detected ? 0 : -ETIMEDOUT;
>   }
> @@ -255,8 +257,9 @@ static inline void
>   fw_domain_wait_ack_set(const struct intel_uncore_forcewake_domain *d)
>   {
>   	if (wait_ack_set(d, FORCEWAKE_KERNEL)) {
> -		DRM_ERROR("%s: timed out waiting for forcewake ack request.\n",
> -			  intel_uncore_forcewake_domain_to_str(d->id));
> +		drm_err(&d->uncore->i915->drm,
> +			"%s: timed out waiting for forcewake ack request.\n",
> +			intel_uncore_forcewake_domain_to_str(d->id));
>   		add_taint_for_CI(d->uncore->i915, TAINT_WARN); /* CI now unreliable */
>   	}
>   }

