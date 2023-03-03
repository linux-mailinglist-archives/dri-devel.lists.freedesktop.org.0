Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BE56A9FFA
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 20:20:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4314C10E731;
	Fri,  3 Mar 2023 19:20:49 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFD8D10E731;
 Fri,  3 Mar 2023 19:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677871246; x=1709407246;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=itM9Vd/MSLrd3dUcxFvabnU943eS28z/LMaigmm+GU0=;
 b=G8XuySkmGI7EWTdeoDImPcgbSYtVh/EMrofqk72nPZrnJqueeNlhtm3u
 5/QIe4JSiXljV0GeuVANmFIBr9t0PJeqZR32/aNWSGGU2TIAITsUShcdR
 pCRCisBydIUENlBY6INbQNVseXslRdMcoTqPgJY+Pz7zHZJcuDkmvtPvC
 Q8hH2ZqdEVt+bl3qdSrEYx+DpGyPptNC7EgkoOS9Axg+CZgCc8kOsS7k6
 5LvbE5n365gys5VaS8yokPRuRYU8ufmM2QdcG7JmsLCCE1LVvrdiZwyIR
 aY8/0cUqf0Gv9Ej2oAg9iXquRlRl+HalZMNslvLJ9lMfSXgCf5lXbccyf w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="336653715"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400"; d="scan'208";a="336653715"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 11:20:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="1004694644"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400"; d="scan'208";a="1004694644"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 03 Mar 2023 11:20:45 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 3 Mar 2023 11:20:45 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 3 Mar 2023 11:20:45 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 3 Mar 2023 11:20:45 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 3 Mar 2023 11:20:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PsrVxV75dZuAh2Q5m3IpBv3jmpVbTdvvTFSR6iT2J55ngUI9qioOMdnFkKMUbqwmIyf0rhu137UjLBxsZsZCEVCYWhoaUl7H8RCcNS/JV5gmr6Xe+bKblV6DiciBCN9xdoXuvLA2mEJLlSTyCX8JaCXg4lRJq8v5KSb1BhWBD4MxsGAaZKseGxWb2kjqy/+l8EksWnd0UMMBWjyvF60zd0X6ljTeqOXplFxeq7f6hSwMZKccixUjB2QgWuOURdjh36SacgE6usCNLuCJCksaiJ9hPdcFvLVYpufaMXcVRtzZPJaFalTBV2FOw2lMYx+FsEF5uCREc309kKh9KfZUdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hO2zu49Zxh29UI218zO9bk94Zk++fN4+FAwrf7VCQDo=;
 b=ZsDVDYMcrzdRL8jHR9UIs1QwGXtWXmR85F3oQWW6Y9OuTji2CxarLK1wL8xQjfD+kgPRAACqafnhzz/jDvjxq2ZIepunq2NQGKXnCGZQBymumeHwol5xoqviQvlHkmMdy7OihxcMfg9ECdqpuxqpN4lmfFvAX39pa9E0XpXNeDMpgiiTkRRQO0Md3eEpkVQZFxPOesg7hMp0/TpPRvVuIOARIeS7qSlUQnhz7gdTd0+NP8vYhVEjAtTgn+fNNkgB/hOp0nduvGbwD5RFD6aSzJuTFr/akB06317HhhfDRJKasMQgZVYMk6dOSg+SIg1CrQLGvXLLaiiG0GeNKju3Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 SA1PR11MB7700.namprd11.prod.outlook.com (2603:10b6:806:330::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.21; Fri, 3 Mar
 2023 19:20:43 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::218f:c449:80c8:7ad9]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::218f:c449:80c8:7ad9%6]) with mapi id 15.20.6156.022; Fri, 3 Mar 2023
 19:20:43 +0000
Message-ID: <3baf596b-cd5e-87c0-bbd4-54a0e39f9e8c@intel.com>
Date: Fri, 3 Mar 2023 11:20:40 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915/guc: Allow for very slow GuC
 loading
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230217234715.3609670-1-John.C.Harrison@Intel.com>
 <20230217234715.3609670-3-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230217234715.3609670-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0119.namprd03.prod.outlook.com
 (2603:10b6:a03:333::34) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|SA1PR11MB7700:EE_
X-MS-Office365-Filtering-Correlation-Id: 49166508-cb54-43e4-34b4-08db1c1c61d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ximk582drG3dpIumX7J04pqZsqlyHBcGHCXk00F6QVUhQnusCgh6rAVz0VcMj64F+OnCyRrcxmuiI76lYQyFscZfJXBeRn+DzobhVWLUibyo3WrNGLIxssOJaeU7XBB9UKLRcvarGpTzbfa3hoPLuesPGBkPuFlhde+YIRlqZBwDFMP3RE3CZ/q18Hcm5IwdgOZ4ycxXGK2rPQ3HUZ4m/Zk+0uK3CzcpOzRhcItvuz7wUwJcokieOC/ayhvIdQNZMhEneCGrd/jBEqhN5GjPVvgzbIZ7TmYZdax2YGgLoSO4NZH4mXbpGf89hIdKZBOdVoUcQvOXnlJZf4bjj+fwiGNr8uCX5jI8kW7DNSzEf2k77+IiqJU2fMUX0/GMPGMZ2T7tNWHbQDJyt31WCPQP3kJNDM2B4UyKOyKaxAqfd1rhPy9oNEp+nwb605dvG1T/ghINt5vxiRj2+5lqmmd9VETFbEEZe8lBt+7p99kYjsZd8fEjUY1xzjap00JL0miZSvL4Fiq/NQQeC6Vn+aqVCkB9a4MLVHahsurw69Vuxv6RLsRQVCbs5NdPOeBB+aPPn59YYsbAc29o9ph7+zYb2aeDdlzmnC1t/yMbzHBXS45NxrP4HrMzCKsjKkf0580Sc/tUqQQxLSj1szM7tqVJWj94hJOiI9g3NhPC6wDRGXAyjtHwy2HwEHQqUrgSDOp+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(39860400002)(366004)(346002)(376002)(451199018)(36756003)(31696002)(31686004)(26005)(6506007)(966005)(53546011)(6512007)(6486002)(186003)(2616005)(450100002)(41300700001)(4326008)(316002)(66556008)(2906002)(8676002)(66476007)(8936002)(82960400001)(478600001)(86362001)(66946007)(5660300002)(38100700002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUJ1a0o5Q1pQb0MrNExkOUdyTUJLbjJnQ2I0NUtFaml2dEJyTkVRVFY2cXI5?=
 =?utf-8?B?MVBjYjJoSUE2V3EvU29GWVBCTUdLVk5OM09tVS9ZUHV6K3Rzd3NqL1FJQkNL?=
 =?utf-8?B?MS9RSFdSdUNLWTcwYWZ1NTFWUEp5QkxWSFRmdzBBa2xDWDNLWGdscWJVamU4?=
 =?utf-8?B?UmJ1eVI3UVhqTm1WSEU0VDRheHlSR0dYdVFVbEd6ZUthSlZMM1lxcE14YkZB?=
 =?utf-8?B?UGxGS2FIcm1XVTNQWHFQWGtaREpCZmJLRUpkRmtWZDVSeFcvYjhDY1VjQXo4?=
 =?utf-8?B?SU5hMU9LWkJuL3ZDZzhvWlFQcDdxcmlOd3pPa1hVRGU5bWdWa2Q1WEUzSG45?=
 =?utf-8?B?TXgwYW9EV3VmdEsvcjRyemd4eXNpVDRhR3dJZ2phSjh3MGc3NzA1VE90c1ND?=
 =?utf-8?B?K3NYMkU2cnFtM1JPVXlxcXJFWFdxaXExNWduZkxGaUpKY21RTGRKeWZxc2ZX?=
 =?utf-8?B?SHNSYjhxaDdsdHdOTlBveE1YYWZWazBsMm5LSHJWM3lmR1I3bU9PWUJRbGt6?=
 =?utf-8?B?blpDdnRJOUJBOElkK2RZNzBCMXczazlDZURib05TdStMbm54dzFyTmtlKzJa?=
 =?utf-8?B?bVFwUEVueUkyK08rUVJlcE4vTFlzaEpJd3NVOXJ5WDZURjNsaU1rbS9tQjNE?=
 =?utf-8?B?SGNHMy9lV1drN3VieXBPVGxObnU4eGIrL0V1RWVTQUdyTkttUUZNS0pEQXoz?=
 =?utf-8?B?S2pXVmhKc3cxK1c5ODBHdEROYXJFeWdKYTBqTWZEME9NZ1lqQWo2UnpOYVpv?=
 =?utf-8?B?UmVZcmFGK0lOY0lJN1d5eFpzMHhYSEJZbDhNMlJZVzlwSlY4cXJzSC9DdWhp?=
 =?utf-8?B?Q0xvOFpKUzg3S2pGMG5XTlBBYkhkUzh3RHVnaENTeGhzMUgweUdLMElLNnJT?=
 =?utf-8?B?OVFTbGRsbEROUG5jbnNXd3NHdE5oUmtiMmxzUjdNRmhtZ1B4N0poVDFOYzJW?=
 =?utf-8?B?MkJMZ0hadzhXYWVOZW5Qb0NLelBJbzlvaGwyc09zaWRIYmVyVzdiK1NQYUh6?=
 =?utf-8?B?QmdOb3MrczNLSDNHcGUrQzM4UHVNWGhwbUc1a0w3blBNcjdFNGdGRTYyb2xZ?=
 =?utf-8?B?SGlhcjB6VENaNFRRRHdhZVFlZWVFSnpCd0F3RGEvb2Fldi9wdWxrOVAveitH?=
 =?utf-8?B?SUFmbUsyQ0FZL1A5dElUQllYQmNSTEZNYWxaQUlJRXhlVEpBT0JYYnRFU3FG?=
 =?utf-8?B?dzlGNWdjZlUzeGJyZ25qS3V6dG9qTXFGciswNkF2WWFlWFZjbmZGeHFERm4z?=
 =?utf-8?B?R2w0T1E3L1ZVTytERkovK04xeXA0OGJLNC9zRHI1YjUzMFR5L25tK3VVaFNw?=
 =?utf-8?B?M0laZlRYR05nVXViRC9yZEFsYksrMnJDZjA4bTdnTEowUm9hQTBpRnR1QmVM?=
 =?utf-8?B?OHI1TUNUZHBVZXVuazlvdjJKZjBNQmZsVExmNHg4cnZLdUYwckpDK1hleldZ?=
 =?utf-8?B?QWJYYUdPS1NnODVYZURod1BVOURVOGRVbTRRcko5ZlE4c3MrSU1Cd1M4cFJa?=
 =?utf-8?B?QVlxQTMwam9YcDlIOEM5d2ZhZ1JEcVFxTTZtMWxFTk1vNU5kSXFWTUJoUlNW?=
 =?utf-8?B?VE81aXlzUkgrU25hd0pnemkxMmRad3ZEK21iNG5HMWVmYnFVSCt0UVNXcDlw?=
 =?utf-8?B?dzBhbjhIYkJtMVVZSkhNK0JGY3Zvd3RyMkQvR1E2NkpTNytrVmJNbGVTUzNo?=
 =?utf-8?B?elJSL1lsb2N1SUxIajhNL1VveGdubzVvQW5XbVBxdXo0R1FDQk5XTUxvKzdY?=
 =?utf-8?B?bEVuVkx6VHp0ZnZRa1Qzaml1S2ZyN3hiZ2o1WWE2TDVLT1BySFdzS2U5b0Ra?=
 =?utf-8?B?Ni96MDBmNFBjbUtYZkJ0RjhKNlE2UUtydy8xejVadE1YeUlVd0VFTHF2aEF1?=
 =?utf-8?B?ZFNmbFNTY2gyRXlZYWI4U1E4djZWdDdKZ0c2R1BEaUppQ1VPOXVCMTlocU5S?=
 =?utf-8?B?c0xJUkcxa3JPb1ZCNWpKQlJPTmZBc2N1aDVhOTJrMm1nQkp6UFczZTYzRlV6?=
 =?utf-8?B?Vm5GRVoxa0ZPT205bmNHL3diYnk4SXlKNXdiWnh1M3lYZUk3U2hvQUp1dmZk?=
 =?utf-8?B?OXpMUkNaOElkelVVcW1LbEFrQ0luU0llU1JwT2V4b2VJZUtjYWpadG5Qb3M4?=
 =?utf-8?B?V3lWSGxRY2IvR1VzUzBBbEFNbW8xb3hiRG5EZGlhUFJCeEdiOG1weEFESktq?=
 =?utf-8?Q?HAhZmZcDoQdNLHlru7PEgL4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49166508-cb54-43e4-34b4-08db1c1c61d1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 19:20:43.0694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9PTyS7R1wMbNoSTRQhMUU8rOetb08A8mH7fqXS0rN4/tCLlqeeq4kMM0/huZZPVxoKypQGMpaGLXYCV67Qy6S/3kWLiwBfIPRu7H02SYPfQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7700
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/17/2023 3:47 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> A failure to load the GuC is occasionally observed where the GuC log
> actually showed that the GuC had loaded just fine. The implication
> being that the load just took ever so slightly longer than the 200ms
> timeout. Given that the actual time should be tens of milliseconds at
> the slowest, this should never happen. So far the issue has generally
> been caused by a bad IFWI resulting in low frequencies during boot
> (depsite the KMD requesting max frequency). However, the issue seems
> to happen more often than one would like.
>
> So a) increase the timeout so that the user still gets a working
> system even in the case of slow load. And b) report the frequency
> during the load to see if that is the case of the slow down.

Some refs would be good here. From a quick search, these seems to match:

https://gitlab.freedesktop.org/drm/intel/-/issues/7931
https://gitlab.freedesktop.org/drm/intel/-/issues/8060
https://gitlab.freedesktop.org/drm/intel/-/issues/8083
https://gitlab.freedesktop.org/drm/intel/-/issues/8136
https://gitlab.freedesktop.org/drm/intel/-/issues/8137

>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c | 37 +++++++++++++++++++++--
>   1 file changed, 34 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> index 2f5942606913d..72e003f50617d 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> @@ -12,6 +12,7 @@
>   #include "gt/intel_gt.h"
>   #include "gt/intel_gt_mcr.h"
>   #include "gt/intel_gt_regs.h"
> +#include "gt/intel_rps.h"
>   #include "intel_guc_fw.h"
>   #include "intel_guc_print.h"
>   #include "i915_drv.h"
> @@ -139,9 +140,12 @@ static int guc_wait_ucode(struct intel_guc *guc)
>   {
>   	struct intel_gt *gt = guc_to_gt(guc);
>   	struct intel_uncore *uncore = gt->uncore;
> +	ktime_t before, after, delta;
>   	bool success;
>   	u32 status;
> -	int ret;
> +	int ret, count;
> +	u64 delta_ms;
> +	u32 before_freq;
>   
>   	/*
>   	 * Wait for the GuC to start up.
> @@ -159,13 +163,32 @@ static int guc_wait_ucode(struct intel_guc *guc)
>   	 * issues to be resolved. In the meantime bump the timeout to
>   	 * 200ms. Even at slowest clock, this should be sufficient. And
>   	 * in the working case, a larger timeout makes no difference.
> +	 *
> +	 * IFWI updates have also been seen to cause sporadic failures due to
> +	 * the requested frequency not being granted and thus the firmware
> +	 * load is attempted at minimum frequency. That can lead to load times
> +	 * in the seconds range. However, there is a limit on how long an
> +	 * individual wait_for() can wait. So wrap it in a loop.
>   	 */
> -	ret = wait_for(guc_load_done(uncore, &status, &success), 200);
> +	before_freq = intel_rps_read_actual_frequency(&uncore->gt->rps);
> +	before = ktime_get();
> +	for (count = 0; count < 20; count++) {
> +		ret = wait_for(guc_load_done(uncore, &status, &success), 1000);

Isn't 20 secs a bit too long for an in-place wait? I get that if the GuC 
doesn't load (or fail to) within a few secs the HW is likely toast, but 
still that seems a bit too long to me. What's the worst case load time 
ever observed? I suggest reducing the wait to 3 secs as a compromise, if 
that's bigger than the worst case.

The patch LGTM apart from this point.

Daniele

> +		if (!ret || !success)
> +			break;
> +
> +		guc_dbg(guc, "load still in progress, count = %d, freq = %dMHz\n",
> +			count, intel_rps_read_actual_frequency(&uncore->gt->rps));
> +	}
> +	after = ktime_get();
> +	delta = ktime_sub(after, before);
> +	delta_ms = ktime_to_ms(delta);
>   	if (ret || !success) {
>   		u32 ukernel = REG_FIELD_GET(GS_UKERNEL_MASK, status);
>   		u32 bootrom = REG_FIELD_GET(GS_BOOTROM_MASK, status);
>   
> -		guc_info(guc, "load failed: status = 0x%08X, ret = %d\n", status, ret);
> +		guc_info(guc, "load failed: status = 0x%08X, time = %lldms, freq = %dMHz, ret = %d\n",
> +			 status, delta_ms, intel_rps_read_actual_frequency(&uncore->gt->rps), ret);
>   		guc_info(guc, "load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
>   			 REG_FIELD_GET(GS_MIA_IN_RESET, status),
>   			 bootrom, ukernel,
> @@ -206,6 +229,14 @@ static int guc_wait_ucode(struct intel_guc *guc)
>   		/* Uncommon/unexpected error, see earlier status code print for details */
>   		if (ret == 0)
>   			ret = -ENXIO;
> +	} else if (delta_ms > 200) {
> +		guc_warn(guc, "excessive init time: %lldms! [freq = %dMHz, before = %dMHz, status = 0x%08X, count = %d, ret = %d]\n",
> +			 delta_ms, intel_rps_read_actual_frequency(&uncore->gt->rps),
> +			 before_freq, status, count, ret);
> +	} else {
> +		guc_dbg(guc, "init took %lldms, freq = %dMHz, before = %dMHz, status = 0x%08X, count = %d, ret = %d\n",
> +			delta_ms, intel_rps_read_actual_frequency(&uncore->gt->rps),
> +			before_freq, status, count, ret);
>   	}
>   
>   	return ret;

