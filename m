Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A237652D177
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 13:28:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B50511A36A;
	Thu, 19 May 2022 11:28:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3205211A362;
 Thu, 19 May 2022 11:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652959688; x=1684495688;
 h=message-id:date:subject:from:to:references:cc:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EMkt3Ht6yGkYPgQbNQtMP2jxRwlNK9TKM3sM+RVPYJg=;
 b=fOSFlh8AyDn4goy4YkOWG6VUER+BGjIKf/KNQbDbFZJBKoQ9AqlBD9fR
 upIrDpc9jFfhZZZAqa10SigzqaPKBp6zLg3qvlVNQkF99eDL4/oZwGy9v
 NyQm95smM71ZrYAR3l/gLrm7/hOPu21PFWR3qMNB5FywQ+CtQlxl65MJr
 WFi0BAZnbEXbqh3254yw0hfDZayFpziAxqi6YBu1JjWHActJL3HEKyuO5
 W+dH/3bod8hKN7SLx83lsWlNNPzQI6mXKS+T5UkbdWigPo0YN9OEv/bh1
 nZt4lB5doJ4T0oQSbqlJ/P2ekOkLC6Rbh54zxCmxGUX3sbHpW53uMm6RN A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10351"; a="297456487"
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="297456487"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 04:28:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="742870049"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga005.jf.intel.com with ESMTP; 19 May 2022 04:28:07 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 19 May 2022 04:28:07 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 19 May 2022 04:28:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 19 May 2022 04:28:06 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 19 May 2022 04:28:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kLluZlnPEAihZxHrlU3d24hO9BYMjGdqhmYEa2okEwsXCThoopTA2QREk9E+EeJPu0+JZobcMdSCdDXlX8/a5C2VL9UssCqEoHM0nDJlq7wdYE7jhijlT8s65TcvqWw6EVjIHBsp0cppodmTJVN3rP6qAVnFVSbOlSsx+wk6kkTDZKRhVYrp3boUWG0zsoWAaKsSI+yPxxOzD+PbI29sIaxz54Qyl7G546WRHqPdtGPD7311wAP7L41VKhK+bR+mNm5tdDg+nCWQ8wPcH4MUGZ+AGxDC7qnwJ4qFCpKmL9sgpie48JkGCu6hQo5VEVZEAGjKegNx28QOvO7KKVCEWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FJqgIzbDgxaiW0fEi+gQeDVwIfgEiUoLvD0E65ISKJg=;
 b=JWFGTQfM8p96QwF0ZppHmmMJqU3XFFff+0NlaxXfq8Lmtwv7K5NeDOIavh1GnU5gQGvAxulPh+xo+w2NKELGMOsUkDmq2viFnFyTO+qeX2NxWwMb9UbwEmVaz6Tk/UqGW/AbLIPOS/bd6MFB6amdVcUO3plpKhfVAsz3siIM/RhprNNgsm/NVWy0c4Jakb31MFiPK0sq9SUH+8yrgXiYbZQTjAEI+0graFFhlk0Ko87n5NNoePMSYKhG0vvcw1vA+i3P0hLLNdXxh1oFC+YK0zSfhWhdAZJFS0NDdVF8oKDrStMfFD+M/NLy+kFXY+EpfFggRfS9XLcAJREKfKpKcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB3169.namprd11.prod.outlook.com (2603:10b6:208:69::32)
 by MWHPR11MB1695.namprd11.prod.outlook.com (2603:10b6:300:22::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Thu, 19 May
 2022 11:28:04 +0000
Received: from BL0PR11MB3169.namprd11.prod.outlook.com
 ([fe80::ace0:8624:96b8:d6c7]) by BL0PR11MB3169.namprd11.prod.outlook.com
 ([fe80::ace0:8624:96b8:d6c7%5]) with mapi id 15.20.5273.014; Thu, 19 May 2022
 11:28:03 +0000
Message-ID: <31c41789-2b6c-0de4-8218-733579e79471@intel.com>
Date: Thu, 19 May 2022 13:27:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [Intel-gfx] [PATCH v6] drm/i915/display: disable HPD workers
 before display driver unregister
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: <intel-gfx@lists.freedesktop.org>
References: <20220513160641.3096487-1-andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220513160641.3096487-1-andrzej.hajda@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0035.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::23) To BL0PR11MB3169.namprd11.prod.outlook.com
 (2603:10b6:208:69::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56251e44-c86a-4b08-e6e0-08da398aa354
X-MS-TrafficTypeDiagnostic: MWHPR11MB1695:EE_
X-Microsoft-Antispam-PRVS: <MWHPR11MB1695C75BA5EADAB9AB5EA0C6EBD09@MWHPR11MB1695.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MZaJ9n18f9OyM5dF5S7lJcf5T6Srs3BYcSZ/QqPTkURN3PRCOzSVt38xdkX1BTQirKBGUXqn060si11PEwlnPm9K7NQgITB/QrOy11gQr+mA4gvoiQmsRELs9UW2/yrQUBo/2dmJ3Fhn0QdjlOqRc5lexgL+FOEeZMQnehDUCLKHwiLrF3M5FTO1+Cmqav2Ho0UtR+eB/oG2h8lwWZPQOHtcaWZgK9KuDjlxirzVdlwXCqwL8b4syRMYPFQLzjwwFCXmvWVwe/k1chGi/bbiQCRa6YkY2lI0kTT5BYtIwxPRv2M2yArGtGXWFzkN8Cem5os84H9ry/5c4x29MzTOC3J+eBAz/QbF4Qegp5fn67wquR3vrc+h+wMmvwfTblUSxRu4J3dqeQuoFJv8Adrh25JV9lGEmUlWdJALt46dZgpNcNjiIYlBpdnYvqkLyUFRewQcTDcWrPPqEybeHc0MX6MHHgOcEXm3L0hwZcNXzwm6Bzd5HsbdxoSwO3YoshVc85R7Vj0RhdgGzwBst05B3koakoyg5Vj5aCn4nWoON6HgDBR6TKFxhb8VyPjjw/oxjTWfNGDycI6ot4afsfYsUtGgmUTJXLC9R/dr8G0e09+EIrI4LnV1p5SA8Q4idGZiL8wKZ3IzOHScrfPwHMSYJmKSxTHVZllCGhZVn5fI05a7ZZUm1C7pct9++orlbDajeGbsBBGGnGMaOAKbL95dgiMaM++LcbEPtvbaZkalwS8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB3169.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66946007)(5660300002)(8936002)(508600001)(31696002)(86362001)(44832011)(54906003)(186003)(6512007)(26005)(6916009)(53546011)(36756003)(66476007)(66556008)(966005)(4326008)(2616005)(8676002)(2906002)(6486002)(36916002)(6666004)(6506007)(83380400001)(316002)(82960400001)(38100700002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjZLUUx6dUEvNDhaZjZERis3TE1YNjM2VWVLWGtrcUtkZXM4V0JucjB5Kzl2?=
 =?utf-8?B?UkNCSmtWTXFRb045eC9EejV1WWJkSlljY25WWGtaSWhEdW10bDNuenprcWEx?=
 =?utf-8?B?MmZLclIxRTRIajB5ZWZhYjN0YUFpaS91M0p3V3RmWlhFMnVnZGEvb1lIellR?=
 =?utf-8?B?UFRMdThSSGJVVG0vclBTbWd2alVmQmtDckhleFNjMFZFa3FVRmtYTlpnUTNZ?=
 =?utf-8?B?TXM5VWM3RCt2NVE1bGxidUFzdW5oNlBkbjRwZ1dEWFpGRXN4R01yK1VFNUZn?=
 =?utf-8?B?QUNKYTk5V2E0c1paT01ZMmt5Yjh2c1g5S01mMkpzOFBLd0dobFI5L2FMdk1X?=
 =?utf-8?B?c1ZaQVFhRXFidUxwaENySEVLTWIxN1RsM3lFclNzUU9FYUpQN3E1N2htQlJX?=
 =?utf-8?B?U21kS3FHcGZFUGdoZGZpREdCSkNnVXgyMlEwN1BmRHdDckp0bEwyYzZjTzRZ?=
 =?utf-8?B?VkYvZTRscm9tbGxEc1lqL0cvbUNmS0RqRm1FVUNUZDVXNFh3S1JkMlUydmtF?=
 =?utf-8?B?Sm01NFdsZUlUNmpjYTI0ODNCRWNvck9IcXg4K3NROU8vMUNZZzd3bllhN0hW?=
 =?utf-8?B?dWFtSVVJYzNWdUdqMHd2UVZjdXViOGordHlnVGkzRTlpNXkxZmE4K05sK1BM?=
 =?utf-8?B?SVZNbTZKSGQ5ZlZRaC9lWGhiZkp0VzROZURBTlRONW45a0tYTkZDaWYxZTFv?=
 =?utf-8?B?eXpuc2JtWGNVMS92Mjg5cWRXUG9CeW5vRVFMcEdXQVJLdVp3YjFHaTQ0YVha?=
 =?utf-8?B?S1A1Y3lybTVGOHpxbGpvWHJGMnRsVDJlNDU3MlhlenkwaE9PUTJ2YlBvUy9X?=
 =?utf-8?B?QlAvWDNudHBKSENkanRoMkQrbzBUMFRzcm9UZ3J0ZFAyek1Na0hhZlp4bklE?=
 =?utf-8?B?ZnpkQk9HbmRIcWpDOEtBcTRVWFdNMjcyVW53UFhrMEVudFVEaHBaZFJabnJv?=
 =?utf-8?B?S3lEb3plWlhqK1I2c2FxQXp4OHlrczVVb29VUXRTbGJ1eWRwNkJsRWxteTRC?=
 =?utf-8?B?Y2ZVbmdYdEIxcGhpRWpsYXNnRWRma2pnUkF5K1Zia2lzQUJMY1BqUVVGL3BU?=
 =?utf-8?B?YUFPbFBHUTV6dW9vY1ROa3piVVIwUWhtcTNlZHl0TDVWYU9WSFYwOXNmbGND?=
 =?utf-8?B?MTh5eWdFYXpPQTVvckcxMzUwYVNlNTU3MlBQTzZONmRUeU1EME94Q2pLNGVE?=
 =?utf-8?B?MDVTd2NkVW5mWEdOM2NZbEIrdkZaZ2t0ZDdPYmFPOUpNcWx5QkFiQkFBR3BS?=
 =?utf-8?B?ck15WGxvbWdwR01zU2lzOHBkSS80K1MrUHozbjQwSWNaUmZJYzhGd1hYNUtu?=
 =?utf-8?B?cjVORWN6enhpU0NGZEoxVzhZTDVMemx6ZGpqcjQ3K05GcmdRcXhCeWVqeElC?=
 =?utf-8?B?VE1BdXY1TDM1R2Qzb1RjeFplWjFCUG9DNGxsTFJ6bVhQbjd6OWJvaUN5WUdQ?=
 =?utf-8?B?SmpFODJrYmtFcndKNTMrcHo2cjVLUTBMYVN2UU9iUm9selowenJja2dZRGZD?=
 =?utf-8?B?ZnREcG1tTXM1UlBWQlcxQ2pJQUpJWEVwM3dva2tqMzE5bnpIVnlpSFhKZnJD?=
 =?utf-8?B?YmZMZ2tNRE9kbEN0UTFhYmRjQTZIcGtTL2hsUUZXaDNQWmZQd3BpRExYS2lO?=
 =?utf-8?B?SGMvN1ZjakU3aWhqUmFGWndYZjZadVhLa1lXTjBLTy92dnpqTGxTRnYwcXNw?=
 =?utf-8?B?RWpJc3hEK3YvVTBFQk00b0NON1NBcE1qU1VMYWpQQy9JVVk3disyOEVXb0t6?=
 =?utf-8?B?WHAzTjUzVGRab2R1QmVxTGM3cTlERGZRWUp3TnNVSmxlc3JUcEtpaFFLWTk3?=
 =?utf-8?B?OVBpTDZaRXdtM0duRmt6RU54cjBveUFpRVdUUkxhVjRZQngzQzF1WlVtTWFq?=
 =?utf-8?B?dFNJRTMxMzVUZ1IyWSt1cGwvdW45bHFxdHExYzVNaXpmMC9NNS9rNElMRzBk?=
 =?utf-8?B?UnNVaW1DNzN3S0UvQXRjbDJwZlRWKzhadlFGYW5DMk8rNkRJLzdHc215R2JJ?=
 =?utf-8?B?anFicC9Sc3hsclh0SzlxeGIyYUJOZDNFSnZISXJHTWo1NHJ6eHBScGNBZ1Vi?=
 =?utf-8?B?K2FCV2QrcFR0a1hFK1FCT1I0Q2NOdVZZOUVLbFR5UU5zUDdqQVliTlNhUWJG?=
 =?utf-8?B?RzdiTEI5c3hZdVVZZEZxZFlqNVVkYkwrTnRvM2QzWjRVRlFKT3hZMkRMRThN?=
 =?utf-8?B?V3MzOU03RU5OU0pHY2dHdHZDNWpRc1IvZHJEWGJrYkNmTGMwcWRDWFBpVFhL?=
 =?utf-8?B?T2lZWitUZ3cxR05kYVFrZVQ3Mm5BTlpORk9LdW9RY3hNbGs5dzlKT25IWWVL?=
 =?utf-8?B?ckNUcDdaTFV1MmpJMEMxU2lIa3BUdlAzZE43WHVKMlNFdzZBd0pHYmhPTGt5?=
 =?utf-8?Q?WewZ3/1qgSQtMNZg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56251e44-c86a-4b08-e6e0-08da398aa354
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3169.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 11:28:03.8929 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DQ6T1AKUfWeYdButcKxfKoCe8D8VRWMdPjKgxwwzieY9ZuK8ODkDCFv6AV/2bhgRzE5N/tOvHchwtaTipQMeIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1695
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Seems the patch correctly fixes the the issue and passes CI so added 
maintainers/reviewers to CC.


On 13.05.2022 18:06, Andrzej Hajda wrote:
> Handling HPD during driver removal is pointless, and can cause different
> use-after-free/concurrency issues:
> 1. Setup of deferred fbdev after fbdev unregistration.
> 2. Access to DP-AUX after DP-AUX removal.
> 
> Below stacktraces of both cases observed on CI:
> 
> [272.634530] general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6b6b: 0000 [#1] PREEMPT SMP NOPTI
> [272.634536] CPU: 0 PID: 6030 Comm: i915_selftest Tainted: G     U            5.18.0-rc5-CI_DRM_11603-g12dccf4f5eef+ #1
> [272.634541] Hardware name: Intel Corporation Raptor Lake Client Platform/RPL-S ADP-S DDR5 UDIMM CRB, BIOS RPLSFWI1.R00.2397.A01.2109300731 09/30/2021
> [272.634545] RIP: 0010:fb_do_apertures_overlap.part.14+0x26/0x60
> ...
> [272.634582] Call Trace:
> [272.634583]  <TASK>
> [272.634585]  do_remove_conflicting_framebuffers+0x59/0xa0
> [272.634589]  remove_conflicting_framebuffers+0x2d/0xc0
> [272.634592]  remove_conflicting_pci_framebuffers+0xc8/0x110
> [272.634595]  drm_aperture_remove_conflicting_pci_framebuffers+0x52/0x70
> [272.634604]  i915_driver_probe+0x63a/0xdd0 [i915]
> 
> [283.405824] cpu_latency_qos_update_request called for unknown object
> [283.405866] WARNING: CPU: 2 PID: 240 at kernel/power/qos.c:296 cpu_latency_qos_update_request+0x2d/0x100
> [283.405912] CPU: 2 PID: 240 Comm: kworker/u64:9 Not tainted 5.18.0-rc6-Patchwork_103738v3-g1672d1c43e43+ #1
> [283.405915] Hardware name: Intel Corporation Raptor Lake Client Platform/RPL-S ADP-S DDR5 UDIMM CRB, BIOS RPLSFWI1.R00.2397.A01.2109300731 09/30/2021
> [283.405916] Workqueue: i915-dp i915_digport_work_func [i915]
> [283.406020] RIP: 0010:cpu_latency_qos_update_request+0x2d/0x100
> ...
> [283.406040] Call Trace:
> [283.406041]  <TASK>
> [283.406044]  intel_dp_aux_xfer+0x60e/0x8e0 [i915]
> [283.406131]  ? finish_swait+0x80/0x80
> [283.406139]  intel_dp_aux_transfer+0xc5/0x2b0 [i915]
> [283.406218]  drm_dp_dpcd_access+0x79/0x130 [drm_display_helper]
> [283.406227]  drm_dp_dpcd_read+0xe2/0xf0 [drm_display_helper]
> [283.406233]  intel_dp_hpd_pulse+0x134/0x570 [i915]
> [283.406308]  ? __down_killable+0x70/0x140
> [283.406313]  i915_digport_work_func+0xba/0x150 [i915]
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
> Hi all,
> 
> This is my Nth attempt to solve some old CI bug[1].
> v-2: caused issues in kms code [2],
> v-1: revealed that not only fbdev does not like HPD on removal [3],
> v3: lacks drm_kms_helper_poll_disable[4]
> v4: added dump_stack to detect late fb registration
> v5: added intel_dp_mst_suspend to stop late fb registration
> v6: removed dump_stack with hope everything is handled
> 
> Moreover this is quite rare bug, but due to specific configuration
> of one of CI machines it appears there very frequently.
> Forgive me spamming the list.
> 
> [1]: https://gitlab.freedesktop.org/drm/intel/-/issues/5329
> [2]: https://patchwork.freedesktop.org/series/103621/
> [3]: https://patchwork.freedesktop.org/series/103738/
> [4]: https://patchwork.freedesktop.org/series/103811/
> 
> Regards
> Andrzej
> ---
>   drivers/gpu/drm/i915/display/intel_display.c | 11 ++++-------
>   1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 806d50b302ab92..007bc6daef7d31 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -10486,13 +10486,6 @@ void intel_modeset_driver_remove_noirq(struct drm_i915_private *i915)
>   	 */
>   	intel_hpd_poll_fini(i915);
>   
> -	/*
> -	 * MST topology needs to be suspended so we don't have any calls to
> -	 * fbdev after it's finalized. MST will be destroyed later as part of
> -	 * drm_mode_config_cleanup()
> -	 */
> -	intel_dp_mst_suspend(i915);
> -
>   	/* poll work can call into fbdev, hence clean that up afterwards */
>   	intel_fbdev_fini(i915);
>   
> @@ -10584,6 +10577,10 @@ void intel_display_driver_unregister(struct drm_i915_private *i915)
>   	if (!HAS_DISPLAY(i915))
>   		return;
>   
> +	intel_dp_mst_suspend(i915);
> +	intel_hpd_cancel_work(i915);
> +	drm_kms_helper_poll_disable(&i915->drm);
> +
>   	intel_fbdev_unregister(i915);
>   	intel_audio_deinit(i915);
>   
