Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C91F60D8DA
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 03:34:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4815210E1EE;
	Wed, 26 Oct 2022 01:34:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C461C10E1E9;
 Wed, 26 Oct 2022 01:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666748050; x=1698284050;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=goo7S5IKwbnfdsdf4W4V+ewYao6e1RPRO5zHJpc8rg0=;
 b=TV2KwdgSqvXR+WDNGDlvuYDpSpIcDAFgMbutu2bhz+cSDtFuTIsGPFPV
 KuJ4pHpHzh8jYbysiXBYpbz9rROugUJ9gkBlIJn4+CT1K7a3iuCPvnmWB
 AVlkoBF7U3/vON+q4NytE+eIFBLBnFpdF9dkInC828K3fHvBgUTRQHp48
 Z+2hGiWj+dfmYnQHpBdsctvxYNJnT3+UQf/1Uu5De5a+1GIKwlF69oamQ
 +ICabgWMo2ndLEhoU08meknxgM34dLMN50mCZyFu2u4sIWykyVGCIEQe3
 VvVM7y/tPKRhvfWo4Twb2c2X18RPvE4rsI/huWE9QfyDCxyBlykFoJikW Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="394145756"
X-IronPort-AV: E=Sophos;i="5.95,213,1661842800"; d="scan'208";a="394145756"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2022 18:34:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="757136085"
X-IronPort-AV: E=Sophos;i="5.95,213,1661842800"; d="scan'208";a="757136085"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 25 Oct 2022 18:34:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 25 Oct 2022 18:34:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 25 Oct 2022 18:34:03 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 25 Oct 2022 18:34:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S9MgdCUYAY/Vt7gkhuAaJUxiXdnAy6KrCKGfjgn1jbQLOTsz3GRWbWqIOSjn1JDB+FHrLtgCxVjbbza2Bz0CBw73iEdbbAfuZFRizFTwmM8hpyXoSGtwvKK2DVQ8Ua3ETYuxDUqK5I2r6hVK5RF5DOTcnRgx/a1gHo1ZKjhqAGQBX5O4ZU3LNLc7585IrBrW4P3FnxptSDic9EcJR40Of67nCjeICyUsc8ia4Sk0JtdszqtEulgTGJ+YVJAC6rN3f7SqYZu4UTUmpH5oA4UJ8hb/Hcv+O6UrFpeGbCeVXgIoxav9uBvl9PsiFC1WfdOsjyHrtYTdYcboB8CLoh1lTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kzuwBYp2ebzL4fS4/XTVv8rF4jB2yW6U77oeLfRp+sY=;
 b=NU/4h6pzvXksW6aL3JSlLvkjZniP+1WyyHweNFNSCSOfZz4mEGYOd5xs7bWrkFbMJIvZllhq+g6r2NsddWRugzu7Lx51VsZDzjt2Gr8ACnD76NpZPmGzl6Iuffmh8U/NdTgANqkP8H7vJCYLGnRK2LkQpwENtKYps0sxrQL3g/mjt0EwHshFVAp7dWROVvxDiUZtEvSTIf93F0H1HcAawFgszoU9Ik3oSmfslp6ewK67bR447QhAHsLnTa/+yClAlBMvNQ99SoPCtbwi66wy3nNd8KNzo388CtTapWsPOevA1/xYaW9Os4ceWygHXWQobsv/Gfh4emwxpUzhIaF9wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by PH0PR11MB5805.namprd11.prod.outlook.com (2603:10b6:510:14a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Wed, 26 Oct
 2022 01:34:01 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036%7]) with mapi id 15.20.5746.028; Wed, 26 Oct 2022
 01:34:01 +0000
Message-ID: <3be1b1fd-b258-d193-c1a6-ec61a85aac23@intel.com>
Date: Tue, 25 Oct 2022 18:33:59 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.0
Subject: Re: [PATCH] drm/i915/mtl: Handle wopcm per-GT and limit calculations.
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20221022001008.2340224-6-daniele.ceraolospurio@intel.com>
 <20221024222642.2377564-1-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20221024222642.2377564-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR04CA0025.namprd04.prod.outlook.com
 (2603:10b6:a03:40::38) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|PH0PR11MB5805:EE_
X-MS-Office365-Filtering-Correlation-Id: 4db17801-8d61-455e-f970-08dab6f22907
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OYujBlrasfL3RND4fwCTKdGwdGj7y2r+1s4pJzIElM1fDYgHDPqr43utYMmOONEcRr0GoLebB6sU1tOXCyyzUo+vrGBEmSN632twvF45oEau65tKaw2l5Mx2tuD1w2dlYegPtZLvq2lbK8XyScPz7b/TwoB3RJ4kKAe/XVuqQsa1lniLmLT0d7czcMsNPFTIWPGCX6C4s/Ag+mjXaYRBuXl78PHkTjh/BAbHH6PGj1uGkidzyJ9hiT7IGJV0O1S5IU8icTlcM3bxdauuKFhNK+Mpo4QdnLbJvUwV1kSOoaVIZlfcE6W0IqMemDFw5coG1SrTJw43S1E2sp9+Q5We7y70G6ynHr5tpfixGEOGx3KfIQuCAALHtBPXYTeGR1/dSAg0Jz/32Hs6OzQM7dny+FBzeBdWR6Q+NI0gLiBnLl/4lD8eevsKHPbIhjvwGlhgTnie5JWLFmROnenPaLGzAvqx/JP9Am//J3R4kuVC7TDjXQ55VTNNk1/8IkRbZ6+df+X5r7ily77BkmJ2ZSan0Ga+Ba+/aUIkY/pf3Idv4P1omamtwKQUPyvEPFl5KoAMcNXLseyr4c1oxO6tCYpkU3m/uqbVJuu0EPOUu58DVJ+sxOZ054m9CA3E/bgGQwAac1BluSnAszdQ4euInZO9ay376Hrej7Q4MjinV+AqWw8PQtSj+qmHUmPXJ7VNi8dsqMvWEqLq7QtpKwnifFq5YVn6wTkYKzIlnptq2Vb8bWwXQtMiFIM6YLFiFxN/6WsTAV2Z6SO94DbdlLjuowD6XCbrI42WiWTbUu4YVQW1DuA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(346002)(366004)(39860400002)(396003)(136003)(451199015)(2616005)(82960400001)(30864003)(186003)(31686004)(2906002)(478600001)(6486002)(5660300002)(54906003)(41300700001)(36756003)(6506007)(38100700002)(8936002)(6512007)(26005)(31696002)(83380400001)(86362001)(66556008)(66899015)(4326008)(66476007)(66946007)(53546011)(8676002)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0lYTG5Yby9sQVFTS0pENDF1dENqQno3Tzl5L1B2dHNiNkVKTzhEc1h4YzR6?=
 =?utf-8?B?WUhsc2dvTEc1MHpuTWdyS0pVMUdZdGVXVkZXUlhtZWdOSGY5UFpmbWZjV3VQ?=
 =?utf-8?B?b25JNU1rbWgrOGg5UlZEY0c1R3JSM3B4Z1NVazBoNUliUU00WEEvMXZnekVC?=
 =?utf-8?B?RWhHV1FTdnhSSk9McE45Y1l3N0Y3Z3RmY2Qzclhacit0eDJxSDAwR0hZeVVp?=
 =?utf-8?B?TzlHT3kwcmliRDg5aXRlNXdsZ3JTTXBzdFpaeUp2bFFDRHhsRHIxek9mWHha?=
 =?utf-8?B?b1JrWjJrNzNuODVlY21oSWg1MGowMStxZldhbGsrcjNVOUk1MjV4RVlTY2t4?=
 =?utf-8?B?azB6TUJaaWdYZjd0emZybENIcms2R3E1Wkh5dVBVZlU3cGxPemRoVWU2RlJx?=
 =?utf-8?B?Y0w4dFJTbnBpalh0S1BpYzJTbHdpSUFQQnZnZG5rSEdvbGxYNUtFOVlOZTdy?=
 =?utf-8?B?bTFKcU9DV1Z0R0wySjZFN1NLRGVkeUpFV3Rubkw3OU5YOWZQYXFsc3BlTUxH?=
 =?utf-8?B?SUx6ZmFsVmFGT3RnQnl5ZWh2VG1SeWRmakpDRXk2Mm5Gb3ZxdElXNkZBVVR4?=
 =?utf-8?B?NGY5bis0L01KVFNaRWNTQXVKOXQ3SzlDamdlekNmMWpjKzZmRGx2MndOUGZS?=
 =?utf-8?B?SEVDS2tsT20yNitlbElZZ0hnazFNVVQzYmpqa2VtVEVucUpBQnhvdUptWERi?=
 =?utf-8?B?dVVkK2hZQUN0SzVZUmxhT0tHeVdpSk0rYmJxWGNHRmxteFhjVjJLQVBwUlJ3?=
 =?utf-8?B?V1A1LzBJd25DZmZSNG1OQTBveG9mNDJwaHluTHJzT0RsenVqSUhNT1ZjdEtM?=
 =?utf-8?B?Rkw5TzlmWXRPOXRCWmVvR1VNMGR4MUpYWGFqcE1hUnBRbExSNjc4NUhKZm5P?=
 =?utf-8?B?ZHdUWDJTVDRDdDNoS0JPK0dCWC9LQmFHYkNDbXZhTmxOTGZSRy8yUW04SGZz?=
 =?utf-8?B?WE9Xd2xEbHdjaUJWbG9pWnN3ZWZ2azErUmRvanFvSlp6RXhBd05xYnlDOVFm?=
 =?utf-8?B?WkpjVVJCQjhxVHVVQ0lLMUM2SEZUVUZSOGJjYkxlSXFCNFJWajRVK25lWmRD?=
 =?utf-8?B?bzM2MjFtKzMvYWNHeEtBamFrOEV0QVl2c0FBQXY4TUs5Mnd6cnE4SlFvd2h4?=
 =?utf-8?B?a0orNE5nMHp1UVQwNGJGNkV5OVloUVFDOVg4TVZtNzBVZWV4clZ1NSt1K3BO?=
 =?utf-8?B?MlhRRXg4cDR5SjArUXJqNmNhQ25tdXNhV3FoeXdHUW5NcHZkNTZIcUZXVXNC?=
 =?utf-8?B?SGthQkhDdDQ3NGhpMUlXRjlBeHdJZFNPQ1pKTEh5Z1JPb2w1VWtrZW00QjdG?=
 =?utf-8?B?QVRTeU5vcHJ3b0NWL0U0SHFlMTlvZkpuaW9kU0s4VUtKRE91WEhpNGdHOVkv?=
 =?utf-8?B?c2dCNXRrRFhHdXB0cVNNazNYMmVmbUdZcjdNMFU3YzZzT1RuWmh0VjNKTFRh?=
 =?utf-8?B?S3g5aGNBczFvZ3U0YmZXMjlqbkY5R3pjYTFTZEU4cC93OHl6OWN3aEpQRkM3?=
 =?utf-8?B?clNIbE5nTHZyMVRweUg0NXJnS21Cc0tVVjJEOVJwZGM2enFrbGhzUjZRbGpT?=
 =?utf-8?B?YlpPQVB1Rkg4cEhWQXE5akEzYVhqeEhzV2JIczA0N2JGV3JJaHhoRm5KWDVH?=
 =?utf-8?B?UjAzUk1IS2lSZ0hHVVNRbHJwbmk4MFJ6MkpvZnNqa0dBK3NVRXllS3psSVFw?=
 =?utf-8?B?K2dKNHpRRDNodk90YTBWbzNERk1iNDFpNURYNG5qTEJmWTB1R0hNM2k0bWMx?=
 =?utf-8?B?aytzRkRlSGoyMG9KSDdkRTNyaktudFE0TkxKV25zNWJDSGVPR25iTTVHTlpQ?=
 =?utf-8?B?TTNPTWlIbnJyNUloaFI1T3NsenVFZ1J1SW5DVkdCdFJwNy9wYTRCYnp2L3dr?=
 =?utf-8?B?MFJINktCcGkzUGJRVzdOdDlxT0lydXdTQjlsb3Y4YmxJY2IxN2dCcWtSL0JU?=
 =?utf-8?B?bjl5V05GTUZocVQyK29PNWE1R3F6dXZJcHhFNm8xdHlYeHoxQ1ZybkUzTWE3?=
 =?utf-8?B?eEZHaW8xcm85RkhhL042bUdTU1FVZTV3ZWRsSHJJaSszZ3RzeE44Nk9JWjVS?=
 =?utf-8?B?Q3NLaHBlc1F6RVpmYnFSRFNxZm9MUlNJRWF6SURyTlRETUwwWkhzbldMcmR0?=
 =?utf-8?B?a0k3cTQ2NlhDT1NJRlZ4bmFjbjBoVitLbVFhVit4ZGFKWSt3TS80NFZNbStv?=
 =?utf-8?B?MkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4db17801-8d61-455e-f970-08dab6f22907
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 01:34:01.4325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IUQppf7OYbmYkgLyz3RYT3X4q775EjRA+wej1oJRoqZa2DWSmeeO7pwXpv+/AP6E5If2TXQffjN0CadM7x9zv9PWb9yV9zXNexdGpSnhWoE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5805
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
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 dri-devel@lists.freedesktop.org, Alan
 Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/24/2022 15:26, Daniele Ceraolo Spurio wrote:
> From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>
> With MTL standalone media architecture the wopcm layout has changed,
> with separate partitioning in WOPCM for the root GT GuC and the media
> GT GuC. The size of WOPCM is 4MB with the lower 2MB reserved for the
> media GT and the upper 2MB for the root GT.
>
> Given that MTL has GuC deprivilege, the WOPCM registers are pre-locked
> by the bios. Therefore, we can skip all the math for the partitioning
> and just limit ourselves to sanity-checking the values.
>
> v2: fix makefile file ordering (Jani)
> v3: drop XELPM_SAMEDIA_WOPCM_SIZE, check huc instead of VDBOX (John)
> v4: further clarify commit message, remove blank line (John)
>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   Documentation/gpu/i915.rst                  |  2 +-
>   drivers/gpu/drm/i915/Makefile               |  5 ++-
>   drivers/gpu/drm/i915/gt/intel_ggtt.c        |  2 +-
>   drivers/gpu/drm/i915/gt/intel_gt.c          |  1 +
>   drivers/gpu/drm/i915/gt/intel_gt_types.h    |  2 +
>   drivers/gpu/drm/i915/{ => gt}/intel_wopcm.c | 43 ++++++++++++++-------
>   drivers/gpu/drm/i915/{ => gt}/intel_wopcm.h |  0
>   drivers/gpu/drm/i915/gt/uc/intel_uc.c       |  4 +-
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c    | 14 ++++---
>   drivers/gpu/drm/i915/i915_driver.c          |  2 -
>   drivers/gpu/drm/i915/i915_drv.h             |  3 --
>   drivers/gpu/drm/i915/i915_gem.c             |  5 ++-
>   12 files changed, 51 insertions(+), 32 deletions(-)
>   rename drivers/gpu/drm/i915/{ => gt}/intel_wopcm.c (87%)
>   rename drivers/gpu/drm/i915/{ => gt}/intel_wopcm.h (100%)
>
> diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
> index 4e59db1cfb00..60ea21734902 100644
> --- a/Documentation/gpu/i915.rst
> +++ b/Documentation/gpu/i915.rst
> @@ -494,7 +494,7 @@ WOPCM
>   WOPCM Layout
>   ~~~~~~~~~~~~
>   
> -.. kernel-doc:: drivers/gpu/drm/i915/intel_wopcm.c
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_wopcm.c
>      :doc: WOPCM Layout
>   
>   GuC
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 2535593ab379..cf3a96b3cd58 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -127,9 +127,11 @@ gt-y += \
>   	gt/intel_sseu.o \
>   	gt/intel_sseu_debugfs.o \
>   	gt/intel_timeline.o \
> +	gt/intel_wopcm.o \
>   	gt/intel_workarounds.o \
>   	gt/shmem_utils.o \
>   	gt/sysfs_engines.o
> +
>   # x86 intel-gtt module support
>   gt-$(CONFIG_X86) += gt/intel_ggtt_gmch.o
>   # autogenerated null render state
> @@ -183,8 +185,7 @@ i915-y += \
>   	  i915_trace_points.o \
>   	  i915_ttm_buddy_manager.o \
>   	  i915_vma.o \
> -	  i915_vma_resource.o \
> -	  intel_wopcm.o
> +	  i915_vma_resource.o
>   
>   # general-purpose microcontroller (GuC) support
>   i915-y += gt/uc/intel_uc.o \
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> index 6b58c95ad6a0..9263f10ecd28 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> @@ -560,7 +560,7 @@ static int init_ggtt(struct i915_ggtt *ggtt)
>   	 * why.
>   	 */
>   	ggtt->pin_bias = max_t(u32, I915_GTT_PAGE_SIZE,
> -			       intel_wopcm_guc_size(&ggtt->vm.i915->wopcm));
> +			       intel_wopcm_guc_size(&ggtt->vm.gt->wopcm));
>   
>   	ret = intel_vgt_balloon(ggtt);
>   	if (ret)
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 27dbb9e4bd6c..8c751314df3d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -56,6 +56,7 @@ void intel_gt_common_init_early(struct intel_gt *gt)
>   	seqcount_mutex_init(&gt->tlb.seqno, &gt->tlb.invalidate_lock);
>   	intel_gt_pm_init_early(gt);
>   
> +	intel_wopcm_init_early(&gt->wopcm);
>   	intel_uc_init_early(&gt->uc);
>   	intel_rps_init_early(&gt->rps);
>   }
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> index 64aa2ba624fc..2d18fd9ab11f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> @@ -30,6 +30,7 @@
>   #include "intel_migrate_types.h"
>   #include "intel_wakeref.h"
>   #include "pxp/intel_pxp_types.h"
> +#include "intel_wopcm.h"
>   
>   struct drm_i915_private;
>   struct i915_ggtt;
> @@ -100,6 +101,7 @@ struct intel_gt {
>   
>   	struct intel_uc uc;
>   	struct intel_gsc gsc;
> +	struct intel_wopcm wopcm;
>   
>   	struct {
>   		/* Serialize global tlb invalidations */
> diff --git a/drivers/gpu/drm/i915/intel_wopcm.c b/drivers/gpu/drm/i915/gt/intel_wopcm.c
> similarity index 87%
> rename from drivers/gpu/drm/i915/intel_wopcm.c
> rename to drivers/gpu/drm/i915/gt/intel_wopcm.c
> index 322fb9eeb880..7ebbcc191c2d 100644
> --- a/drivers/gpu/drm/i915/intel_wopcm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_wopcm.c
> @@ -64,9 +64,9 @@
>   #define GEN9_GUC_FW_RESERVED	SZ_128K
>   #define GEN9_GUC_WOPCM_OFFSET	(GUC_WOPCM_RESERVED + GEN9_GUC_FW_RESERVED)
>   
> -static inline struct drm_i915_private *wopcm_to_i915(struct intel_wopcm *wopcm)
> +static inline struct intel_gt *wopcm_to_gt(struct intel_wopcm *wopcm)
>   {
> -	return container_of(wopcm, struct drm_i915_private, wopcm);
> +	return container_of(wopcm, struct intel_gt, wopcm);
>   }
>   
>   /**
> @@ -77,7 +77,8 @@ static inline struct drm_i915_private *wopcm_to_i915(struct intel_wopcm *wopcm)
>    */
>   void intel_wopcm_init_early(struct intel_wopcm *wopcm)
>   {
> -	struct drm_i915_private *i915 = wopcm_to_i915(wopcm);
> +	struct intel_gt *gt = wopcm_to_gt(wopcm);
> +	struct drm_i915_private *i915 = gt->i915;
>   
>   	if (!HAS_GT_UC(i915))
>   		return;
> @@ -157,10 +158,11 @@ static bool check_hw_restrictions(struct drm_i915_private *i915,
>   	return true;
>   }
>   
> -static bool __check_layout(struct drm_i915_private *i915, u32 wopcm_size,
> +static bool __check_layout(struct intel_gt *gt, u32 wopcm_size,
>   			   u32 guc_wopcm_base, u32 guc_wopcm_size,
>   			   u32 guc_fw_size, u32 huc_fw_size)
>   {
> +	struct drm_i915_private *i915 = gt->i915;
>   	const u32 ctx_rsvd = context_reserved_size(i915);
>   	u32 size;
>   
> @@ -181,12 +183,14 @@ static bool __check_layout(struct drm_i915_private *i915, u32 wopcm_size,
>   		return false;
>   	}
>   
> -	size = huc_fw_size + WOPCM_RESERVED_SIZE;
> -	if (unlikely(guc_wopcm_base < size)) {
> -		drm_err(&i915->drm, "WOPCM: no space for %s: %uK < %uK\n",
> -			intel_uc_fw_type_repr(INTEL_UC_FW_TYPE_HUC),
> -			guc_wopcm_base / SZ_1K, size / SZ_1K);
> -		return false;
> +	if (intel_uc_supports_huc(&gt->uc)) {
> +		size = huc_fw_size + WOPCM_RESERVED_SIZE;
> +		if (unlikely(guc_wopcm_base < size)) {
> +			drm_err(&i915->drm, "WOPCM: no space for %s: %uK < %uK\n",
> +				intel_uc_fw_type_repr(INTEL_UC_FW_TYPE_HUC),
> +				guc_wopcm_base / SZ_1K, size / SZ_1K);
> +			return false;
> +		}
>   	}
>   
>   	return check_hw_restrictions(i915, guc_wopcm_base, guc_wopcm_size,
> @@ -228,8 +232,8 @@ static bool __wopcm_regs_writable(struct intel_uncore *uncore)
>    */
>   void intel_wopcm_init(struct intel_wopcm *wopcm)
>   {
> -	struct drm_i915_private *i915 = wopcm_to_i915(wopcm);
> -	struct intel_gt *gt = to_gt(i915);
> +	struct intel_gt *gt = wopcm_to_gt(wopcm);
> +	struct drm_i915_private *i915 = gt->i915;
>   	u32 guc_fw_size = intel_uc_fw_get_upload_size(&gt->uc.guc.fw);
>   	u32 huc_fw_size = intel_uc_fw_get_upload_size(&gt->uc.huc.fw);
>   	u32 ctx_rsvd = context_reserved_size(i915);
> @@ -274,6 +278,19 @@ void intel_wopcm_init(struct intel_wopcm *wopcm)
>   		goto check;
>   	}
>   
> +	/*
> +	 * On platforms with a media GT, the WOPCM is partitioned between the
> +	 * two GTs, so we would have to take that into account when doing the
> +	 * math below. There is also a new section reserved for the GSC context
> +	 * that would have to be factored in. However, all platforms with a
> +	 * media GT also have GuC depriv enabled, so the WOPCM regs are
> +	 * pre-locked and therefore we don't have to do the math ourselves.
> +	 */
> +	if (unlikely(i915->media_gt)) {
> +		drm_err(&i915->drm, "Unlocked WOPCM regs with media GT\n");
> +		return;
> +	}
> +
>   	/*
>   	 * Aligned value of guc_wopcm_base will determine available WOPCM space
>   	 * for HuC firmware and mandatory reserved area.
> @@ -295,7 +312,7 @@ void intel_wopcm_init(struct intel_wopcm *wopcm)
>   		guc_wopcm_base / SZ_1K, guc_wopcm_size / SZ_1K);
>   
>   check:
> -	if (__check_layout(i915, wopcm_size, guc_wopcm_base, guc_wopcm_size,
> +	if (__check_layout(gt, wopcm_size, guc_wopcm_base, guc_wopcm_size,
>   			   guc_fw_size, huc_fw_size)) {
>   		wopcm->guc.base = guc_wopcm_base;
>   		wopcm->guc.size = guc_wopcm_size;
> diff --git a/drivers/gpu/drm/i915/intel_wopcm.h b/drivers/gpu/drm/i915/gt/intel_wopcm.h
> similarity index 100%
> rename from drivers/gpu/drm/i915/intel_wopcm.h
> rename to drivers/gpu/drm/i915/gt/intel_wopcm.h
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index dbd048b77e19..4cd8a787f9e5 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -357,8 +357,8 @@ static int uc_init_wopcm(struct intel_uc *uc)
>   {
>   	struct intel_gt *gt = uc_to_gt(uc);
>   	struct intel_uncore *uncore = gt->uncore;
> -	u32 base = intel_wopcm_guc_base(&gt->i915->wopcm);
> -	u32 size = intel_wopcm_guc_size(&gt->i915->wopcm);
> +	u32 base = intel_wopcm_guc_base(&gt->wopcm);
> +	u32 size = intel_wopcm_guc_size(&gt->wopcm);
>   	u32 huc_agent = intel_uc_uses_huc(uc) ? HUC_LOADING_AGENT_GUC : 0;
>   	u32 mask;
>   	int err;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index 81e06d71c1a8..0c80ba51a4bd 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -478,10 +478,11 @@ static int check_gsc_manifest(const struct firmware *fw,
>   	return 0;
>   }
>   
> -static int check_ccs_header(struct drm_i915_private *i915,
> +static int check_ccs_header(struct intel_gt *gt,
>   			    const struct firmware *fw,
>   			    struct intel_uc_fw *uc_fw)
>   {
> +	struct drm_i915_private *i915 = gt->i915;
>   	struct uc_css_header *css;
>   	size_t size;
>   
> @@ -523,10 +524,10 @@ static int check_ccs_header(struct drm_i915_private *i915,
>   
>   	/* Sanity check whether this fw is not larger than whole WOPCM memory */
>   	size = __intel_uc_fw_get_upload_size(uc_fw);
> -	if (unlikely(size >= i915->wopcm.size)) {
> +	if (unlikely(size >= gt->wopcm.size)) {
>   		drm_warn(&i915->drm, "%s firmware %s: invalid size: %zu > %zu\n",
>   			 intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
> -			 size, (size_t)i915->wopcm.size);
> +			 size, (size_t)gt->wopcm.size);
>   		return -E2BIG;
>   	}
>   
> @@ -554,7 +555,8 @@ static int check_ccs_header(struct drm_i915_private *i915,
>    */
>   int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>   {
> -	struct drm_i915_private *i915 = __uc_fw_to_gt(uc_fw)->i915;
> +	struct intel_gt *gt = __uc_fw_to_gt(uc_fw);
> +	struct drm_i915_private *i915 = gt->i915;
>   	struct intel_uc_fw_file file_ideal;
>   	struct device *dev = i915->drm.dev;
>   	struct drm_i915_gem_object *obj;
> @@ -562,7 +564,7 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>   	bool old_ver = false;
>   	int err;
>   
> -	GEM_BUG_ON(!i915->wopcm.size);
> +	GEM_BUG_ON(!gt->wopcm.size);
>   	GEM_BUG_ON(!intel_uc_fw_is_enabled(uc_fw));
>   
>   	err = i915_inject_probe_error(i915, -ENXIO);
> @@ -615,7 +617,7 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>   	if (uc_fw->loaded_via_gsc)
>   		err = check_gsc_manifest(fw, uc_fw);
>   	else
> -		err = check_ccs_header(i915, fw, uc_fw);
> +		err = check_ccs_header(gt, fw, uc_fw);
>   	if (err)
>   		goto fail;
>   
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index ffff49868dc5..ba4b71aedc40 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -371,8 +371,6 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
>   	if (ret)
>   		goto err_ttm;
>   
> -	intel_wopcm_init_early(&dev_priv->wopcm);
> -
>   	ret = intel_root_gt_init_early(dev_priv);
>   	if (ret < 0)
>   		goto err_rootgt;
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 9453fdd4205f..66aa2cd9aefe 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -62,7 +62,6 @@
>   #include "intel_runtime_pm.h"
>   #include "intel_step.h"
>   #include "intel_uncore.h"
> -#include "intel_wopcm.h"
>   
>   struct drm_i915_clock_gating_funcs;
>   struct drm_i915_gem_object;
> @@ -235,8 +234,6 @@ struct drm_i915_private {
>   
>   	struct intel_gvt *gvt;
>   
> -	struct intel_wopcm wopcm;
> -
>   	struct pci_dev *bridge_dev;
>   
>   	struct rb_root uabi_engines;
> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
> index 9093d2be9e1c..7a9ce81600a0 100644
> --- a/drivers/gpu/drm/i915/i915_gem.c
> +++ b/drivers/gpu/drm/i915/i915_gem.c
> @@ -1140,9 +1140,10 @@ int i915_gem_init(struct drm_i915_private *dev_priv)
>   	if (ret)
>   		return ret;
>   
> -	for_each_gt(gt, dev_priv, i)
> +	for_each_gt(gt, dev_priv, i) {
>   		intel_uc_fetch_firmwares(&gt->uc);
> -	intel_wopcm_init(&dev_priv->wopcm);
> +		intel_wopcm_init(&gt->wopcm);
> +	}
>   
>   	ret = i915_init_ggtt(dev_priv);
>   	if (ret) {

