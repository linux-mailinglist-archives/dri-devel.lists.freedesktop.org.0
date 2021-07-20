Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCC23CF156
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 03:28:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EFB289BA1;
	Tue, 20 Jul 2021 01:28:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317E189B84;
 Tue, 20 Jul 2021 01:28:56 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10050"; a="272274661"
X-IronPort-AV: E=Sophos;i="5.84,253,1620716400"; d="scan'208";a="272274661"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 18:28:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,253,1620716400"; d="scan'208";a="468786892"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga008.fm.intel.com with ESMTP; 19 Jul 2021 18:28:53 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 19 Jul 2021 18:28:53 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 19 Jul 2021 18:28:52 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Mon, 19 Jul 2021 18:28:51 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Mon, 19 Jul 2021 18:28:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PHWoDSIwv+vOBRmlvTdn/LRG5EepLEukPkFnu9CLIf+aCD43aLf46HH4eGTIDyto676o+2U/TG3BxGifmRie0547srA2qoMoP5bVCgncaC7FVU2A5cm5vW+Gt0nsM4Go6FJtIrTECdoI2VMjHzVl+txEWH1Hdw45wwxhaGNUvKeMv2zuKc9sJil390WUTvn2pofxXdH/ByHaOputv09Y2efbablHzHB3hJDe6Kmj+6B0FLuuomJIMzLEZHw92i6KK2/lxJ9Jwnjm3aFF6t3XVERXO2pdThru/NBmDA8F5iBe9WhGfq8MoEh/kYI61kJXudM8x10kSchHiC+LtXMiKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDRFPyr6/1raOhDeyxf5/OdXxaZf9uEjoH/u6vUI1m8=;
 b=IjYiJ++3FoeunywwIEwV89o0pYnosdY41LG9qa0cLr1nHKh3MXNcTyS5vUFNRxgkLdxW4REXEu//hvZ4mGny2V8q1glw3vUK5Mc16MOPdbn2I+ZCXsZzqtxSECMBnBSSBZs13FJ/Bj1jHJLJShhGVaJt8jGf7MRRc9CodFX2ol/jkzwBJbxd5FIc6tqngxQ5/GFQPuYyPfwsx3MaA74PR82ghm75x3UaNPTnKmB57cWm3HUGNcX3e5VEQhteohZw2f1tCoyJi64RUPfp2YYUvpBKFP1mm+A6Ja0OsyCYl/BLhIDptPwIH7kbJ3N0lvepX5ziiJbST49DtX4dHYFwWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDRFPyr6/1raOhDeyxf5/OdXxaZf9uEjoH/u6vUI1m8=;
 b=ONpvgz8cG6YZhacjrJ7X5TxcQBYa2evA1tbaPVRIHuqe7xmWwtWvwMBxXSTs59mNeqsrsWXD/ZpE7SeaLgiuIRk+gqqnOTLAIqZgyS0x+YhvAOPvbuwntlu0TN4tH01nDezNf4zcvug/ah5hTvSTwkx8iZOPeOnfO1tBoX+d6n0=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5644.namprd11.prod.outlook.com (2603:10b6:510:ef::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Tue, 20 Jul
 2021 01:28:49 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4%8]) with mapi id 15.20.4331.032; Tue, 20 Jul 2021
 01:28:49 +0000
Subject: Re: [PATCH 20/51] drm/i915: Track 'serial' counts for virtual engines
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210716201724.54804-1-matthew.brost@intel.com>
 <20210716201724.54804-21-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <bb16d191-b605-9a93-0686-d6dacd722f1b@intel.com>
Date: Mon, 19 Jul 2021 18:28:47 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <20210716201724.54804-21-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MWHPR07CA0016.namprd07.prod.outlook.com
 (2603:10b6:300:116::26) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.221] (73.157.192.58) by
 MWHPR07CA0016.namprd07.prod.outlook.com (2603:10b6:300:116::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Tue, 20 Jul 2021 01:28:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d811c173-20e9-4061-5c02-08d94b1db9f9
X-MS-TrafficTypeDiagnostic: PH0PR11MB5644:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5644B0F410B4292FC567A502BDE29@PH0PR11MB5644.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XmkanROagYJ8mbcAhNZAzMCNa0NOlb9pBNfF5O5CIguqVPUGQatPy5SOTGzLCHYilOi1s8dx8PYJJSTTVW4ULPoVQvXutV4eYIdK1vsNf3j8bOtw3M3g9x3Au3Ho0drddEnb4vFf85hfIQbYsPg9TCf2T6787MVm5A54uBDf+Evdu+xscjbMIBankVLZEIf90/qIRjjuXkScus3f7v7GMJSvNKg550jXdIuepkQ6DCKc0lY4Rn9onnflTnd30/oioobCuAgiAHlelO56mOuj/27DzVtvf9FaeJcyjIr5aUUseTOxGrqkwXWFbPT89ZPdeUZqfEEP0tiIezYoB7mwBcVy2XuNAiP1fGEPEpCNq576B2/JcUdBAZkK+1Pu+hOZX1QKJQHHFWvbEAFL0p6Yx4VbSuyWavDDK7Uo7dVsLvBlB1mfDSviQGHkwnQGx5mxOmWt/IRRdj81Vd/DLAcZvYhV6o/qZ/wtPW8tUvKQtNCpYrfN558PvW35ilWVjmUprA3ar9+i8kDAKeP9/Sv/RBthYeIpMgPaE70kJvOQMDthJL0F8GH1qWGMmYk+dHkBIaNWgcd1UtOUG9+jxtIFMyfpCmZxRg8sHgqUg3g9RMFfO5mTiT/TnloNN9PF4aKuCQTTtxsgVhyFU1tUi/374zy943iYq5SFSFL3eIlZV2kpMeYo7J1175vbMqveGG1Ki8aKIXDEJAgt0Ti/VXHUiH66SIkdcgiKiKUN7BGhBr0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39860400002)(376002)(346002)(366004)(38100700002)(53546011)(66946007)(450100002)(83380400001)(2906002)(86362001)(4326008)(8936002)(186003)(478600001)(2616005)(5660300002)(31696002)(36756003)(956004)(107886003)(16576012)(26005)(6486002)(66476007)(316002)(31686004)(8676002)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWIwaFBtLzhPQ0VlamJrekZPRFdKajlpK0hNcXJtY3hyc1M2WkFTZ1MxanJD?=
 =?utf-8?B?bTZwSmo4TVhqWnpTVGRwbHhWSk41UjBua3JTNFltWkJrTElVZXJidS8yMllE?=
 =?utf-8?B?ODN0MXBGRlhDamgwTXk5c0QwOUwrY3FOeDhWdGh5bXFYRlg4SEw3bVFlcE1l?=
 =?utf-8?B?UUxZQ1drajBqcXNCc1ZhNUcvZHhMZEtnQ1liQy9oR2pvc1BRcDQva1dpUHRM?=
 =?utf-8?B?R0JVMWFCSndjeGo4OCt5cXFzNzR6K1JHTUozbVdNYmxuQytSa2NTd2pnYTFi?=
 =?utf-8?B?L1Z3UWx3dmZQeU5NN2VuSERuN0FrY1RTTWU3R1E2UDAyUUVWQ0dndk91aDc4?=
 =?utf-8?B?Y1cwSGx6M1FsYVNTOC85Vmx2YkM5MXcvRUFwbFg3NFV6eFFXaWVrb1RqMVZ2?=
 =?utf-8?B?QWdwOE9uQndXVklFU0JNNUY2QTBrbnQrdnE5LzlUSjR0ZVRndWxmS0dLbmRJ?=
 =?utf-8?B?RUpQdG15azExSDZsTmd2Y1hpYmZvdVhIYjBhWjdrNVJndzJucENoL0pnWmcy?=
 =?utf-8?B?UXhsNmJsanFyOFJEVUp1OUdvK3hVRXZ6M0kwZ2JlTmFucDlXS2oyZEN3cUIw?=
 =?utf-8?B?OVJML01rcERCTFU3bGhRQm44WnFZUHFjdnJIVFoyTjdIUzdueWNhVEFzZGli?=
 =?utf-8?B?ZHcxZzc2blRldUtSU3JQdHRXNGRvd3RmRU4vbDdsU1lSODdXL1dCeDlpUEpt?=
 =?utf-8?B?T3k5elN1VTJjYWpLU2YzMk5YeEgrVmp1MTZzcWJva1lFUkJIVGM1elpRZzZt?=
 =?utf-8?B?SDh4K0dZc2h0ZFp2bXpvZytmd0k0ZDh5RXA5MGpLSFJ1d0hXM3lFN3Ruamlh?=
 =?utf-8?B?N0NjTFg0V09NSFEyZnZSV1BTa1M1SGFIa1lMNGpzcC9rMGhtanNSWFNzQ053?=
 =?utf-8?B?anl5VmtzblV0OUhZVXB3RlA3dFZ2dXR1M2EvSzdhOXV5L0NvMTFNUHc0aTVv?=
 =?utf-8?B?ZnNYRnBySDZqVWNIN2syUzlocEVBTHN3WUdDWmtNNnJPaGJOeXlHejBFR1Ex?=
 =?utf-8?B?UHdmcktOeno4Tm1IS05WMzdaT21aRFJzVzdzWjRQS21vUGlGNUJkTnd5dkdX?=
 =?utf-8?B?UHNSOEpZQjNXK01vRDRBNXhpcCtEb2JZTHlpSW1ESWxBbXVDeDVVTUwxdEpI?=
 =?utf-8?B?dmFvMGpCTi8ycmZ2b21wL3A2K1F0dnBnOE1oYkQ3QVZEanlZaFRFZWVpS0lG?=
 =?utf-8?B?NXB1OG9XZjdYbEFmbFpBRkhSNUVZQVJkQ0FjK0VabUcrSkpzaUVFTDBqVmNZ?=
 =?utf-8?B?SU80QzNsNk5TUXp6L05qenlSYUdScnBzbWgxYStZUmV4VmhuVHRuUERabG9j?=
 =?utf-8?B?QU8xeVFoU3ZuWVcydTJXcm1rc2NXL1VaSU4wVkZ4QmFhTzl1UG55SzI0OFJt?=
 =?utf-8?B?N0VuTDk2c3M3YkFRUnFxM085OExLdm5BVGRjQ01aSVBGZ1ZjeGxpSG9hNnM1?=
 =?utf-8?B?VkRiNDVxK1dkcHphVFd3RVRrVGpCY09FdGVKdU01SHVrUDZ5bU81YXF4bU8v?=
 =?utf-8?B?a0dYd0Q4b1hDc1h2S3ZJcm1TWjJWbTJ1WWJWYXU1THFGVlkvSU1vZVJSeTNj?=
 =?utf-8?B?RjQzNSs4RTJjVUxUYXNlNUowVERkQXVzSDRvdGY2T0dwVW5ZZENuSHUzVkFE?=
 =?utf-8?B?SUw2TER4WUtFSUQ3eVFrY3dMNy83ei81WE5LUk44ejRvZVFhYTQ4cVlUY3VW?=
 =?utf-8?B?K1hvMVRJQTdwdVFWaGZsekJpUnFhb0R0TmpHL3dWZGhiZ0grWnhyY2ZuWUZV?=
 =?utf-8?Q?BAKS15SlSvUpUJIpiUa9XiTMxgJIWiWGfRkgjjA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d811c173-20e9-4061-5c02-08d94b1db9f9
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 01:28:49.7002 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qa7L+C0N9sOMzBKqv5tMcYalPS/QA2TgZremZpfp/+VPGphPyCdN81grmtfb+3ThJtAhAuCsfqsiYQcqHk++KQqOuM5nwktXbkkyF0KkQjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5644
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
Cc: daniele.ceraolospurio@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/16/2021 13:16, Matthew Brost wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> The serial number tracking of engines happens at the backend of
> request submission and was expecting to only be given physical
> engines. However, in GuC submission mode, the decomposition of virtual
> to physical engines does not happen in i915. Instead, requests are
> submitted to their virtual engine mask all the way through to the
> hardware (i.e. to GuC). This would mean that the heart beat code
> thinks the physical engines are idle due to the serial number not
> incrementing.
>
> This patch updates the tracking to decompose virtual engines into
> their physical constituents and tracks the request against each. This
> is not entirely accurate as the GuC will only be issuing the request
> to one physical engine. However, it is the best that i915 can do given
> that it has no knowledge of the GuC's scheduling decisions.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Still needs to pull in Tvrtko's updated subject and description.

John.

> ---
>   drivers/gpu/drm/i915/gt/intel_engine_types.h     |  2 ++
>   .../gpu/drm/i915/gt/intel_execlists_submission.c |  6 ++++++
>   drivers/gpu/drm/i915/gt/intel_ring_submission.c  |  6 ++++++
>   drivers/gpu/drm/i915/gt/mock_engine.c            |  6 ++++++
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c    | 16 ++++++++++++++++
>   drivers/gpu/drm/i915/i915_request.c              |  4 +++-
>   6 files changed, 39 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> index 1cb9c3b70b29..8ad304b2f2e4 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> @@ -388,6 +388,8 @@ struct intel_engine_cs {
>   	void		(*park)(struct intel_engine_cs *engine);
>   	void		(*unpark)(struct intel_engine_cs *engine);
>   
> +	void		(*bump_serial)(struct intel_engine_cs *engine);
> +
>   	void		(*set_default_submission)(struct intel_engine_cs *engine);
>   
>   	const struct intel_context_ops *cops;
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index 28492cdce706..920707e22eb0 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -3191,6 +3191,11 @@ static void execlists_release(struct intel_engine_cs *engine)
>   	lrc_fini_wa_ctx(engine);
>   }
>   
> +static void execlist_bump_serial(struct intel_engine_cs *engine)
> +{
> +	engine->serial++;
> +}
> +
>   static void
>   logical_ring_default_vfuncs(struct intel_engine_cs *engine)
>   {
> @@ -3200,6 +3205,7 @@ logical_ring_default_vfuncs(struct intel_engine_cs *engine)
>   
>   	engine->cops = &execlists_context_ops;
>   	engine->request_alloc = execlists_request_alloc;
> +	engine->bump_serial = execlist_bump_serial;
>   
>   	engine->reset.prepare = execlists_reset_prepare;
>   	engine->reset.rewind = execlists_reset_rewind;
> diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> index 5c4d204d07cc..61469c631057 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> @@ -1047,6 +1047,11 @@ static void setup_irq(struct intel_engine_cs *engine)
>   	}
>   }
>   
> +static void ring_bump_serial(struct intel_engine_cs *engine)
> +{
> +	engine->serial++;
> +}
> +
>   static void setup_common(struct intel_engine_cs *engine)
>   {
>   	struct drm_i915_private *i915 = engine->i915;
> @@ -1066,6 +1071,7 @@ static void setup_common(struct intel_engine_cs *engine)
>   
>   	engine->cops = &ring_context_ops;
>   	engine->request_alloc = ring_request_alloc;
> +	engine->bump_serial = ring_bump_serial;
>   
>   	/*
>   	 * Using a global execution timeline; the previous final breadcrumb is
> diff --git a/drivers/gpu/drm/i915/gt/mock_engine.c b/drivers/gpu/drm/i915/gt/mock_engine.c
> index 68970398e4ef..9203c766db80 100644
> --- a/drivers/gpu/drm/i915/gt/mock_engine.c
> +++ b/drivers/gpu/drm/i915/gt/mock_engine.c
> @@ -292,6 +292,11 @@ static void mock_engine_release(struct intel_engine_cs *engine)
>   	intel_engine_fini_retire(engine);
>   }
>   
> +static void mock_bump_serial(struct intel_engine_cs *engine)
> +{
> +	engine->serial++;
> +}
> +
>   struct intel_engine_cs *mock_engine(struct drm_i915_private *i915,
>   				    const char *name,
>   				    int id)
> @@ -318,6 +323,7 @@ struct intel_engine_cs *mock_engine(struct drm_i915_private *i915,
>   
>   	engine->base.cops = &mock_context_ops;
>   	engine->base.request_alloc = mock_request_alloc;
> +	engine->base.bump_serial = mock_bump_serial;
>   	engine->base.emit_flush = mock_emit_flush;
>   	engine->base.emit_fini_breadcrumb = mock_emit_breadcrumb;
>   	engine->base.submit_request = mock_submit_request;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 7b3e1c91e689..372e0dc7617a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1485,6 +1485,20 @@ static void guc_release(struct intel_engine_cs *engine)
>   	lrc_fini_wa_ctx(engine);
>   }
>   
> +static void guc_bump_serial(struct intel_engine_cs *engine)
> +{
> +	engine->serial++;
> +}
> +
> +static void virtual_guc_bump_serial(struct intel_engine_cs *engine)
> +{
> +	struct intel_engine_cs *e;
> +	intel_engine_mask_t tmp, mask = engine->mask;
> +
> +	for_each_engine_masked(e, engine->gt, mask, tmp)
> +		e->serial++;
> +}
> +
>   static void guc_default_vfuncs(struct intel_engine_cs *engine)
>   {
>   	/* Default vfuncs which can be overridden by each engine. */
> @@ -1493,6 +1507,7 @@ static void guc_default_vfuncs(struct intel_engine_cs *engine)
>   
>   	engine->cops = &guc_context_ops;
>   	engine->request_alloc = guc_request_alloc;
> +	engine->bump_serial = guc_bump_serial;
>   
>   	engine->sched_engine->schedule = i915_schedule;
>   
> @@ -1828,6 +1843,7 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count)
>   
>   	ve->base.cops = &virtual_guc_context_ops;
>   	ve->base.request_alloc = guc_request_alloc;
> +	ve->base.bump_serial = virtual_guc_bump_serial;
>   
>   	ve->base.submit_request = guc_submit_request;
>   
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index 01aa3d1ee2b1..30ecdc46a12f 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -669,7 +669,9 @@ bool __i915_request_submit(struct i915_request *request)
>   				     request->ring->vaddr + request->postfix);
>   
>   	trace_i915_request_execute(request);
> -	engine->serial++;
> +	if (engine->bump_serial)
> +		engine->bump_serial(engine);
> +
>   	result = true;
>   
>   	GEM_BUG_ON(test_bit(I915_FENCE_FLAG_ACTIVE, &request->fence.flags));

