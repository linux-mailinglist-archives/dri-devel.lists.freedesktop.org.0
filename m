Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A33975E6EBE
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 23:47:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39B9310E41A;
	Thu, 22 Sep 2022 21:47:30 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA1E10E409;
 Thu, 22 Sep 2022 21:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663883244; x=1695419244;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qliz70sPA4ffEqVj2KsRW+DGFvSP30+2ghnTFLirp8g=;
 b=nzA7ZEcQQCaDxvPYq5K6PrpLp2fuAsf/B9HACqkkKKq8O0C39Usad6Rc
 1TyjyigraTaQMw/JpF8mf55W/S/2yMav+pCX7oo14wYi6dkC0t6fMWwg5
 xs1k7RmBSe3W22Wxtmyyvi7YagokO/uuaxxMZMYq/mNN9bpNwfF4HpE8/
 MRBgXq5xTlUKnYdaie4TE+bhOeLOjoUeDT5bFUCdYtuuzyZFns/HphK4q
 KKMVMThQjQh7Ur09EM9/EAL3H59rd+93pJHyPFHJnWpAetaNkeX3lIhfr
 P91gorKLTpODMhb0mcP/WiUltEP641GMNY888dndqnnhjVQtVwiCDPEie Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="362244323"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="362244323"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 14:47:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="865048547"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 22 Sep 2022 14:47:23 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 14:47:23 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 14:47:23 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 22 Sep 2022 14:47:23 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 22 Sep 2022 14:47:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P/1t0+anmubnYd0mdDsXjPGPjsLzSMu5D44ocxGS7l5e8B6RACpsjt0SlFEfJMmC+d8w7uT4qUaxX051iRp9MACknETivHAzqdHyBccHsIl/EkAmfHUv6CKJSiAoiP9QVk0TCG9om/5s8DonXwTjZJ9BXVP8YWuksbwqhl6j7CQYNY6Xmx3iD532czPJHcB1nQcInvCd7249K14rhnDVaQFlJvxd2ePxkSZHy8H2FCqCyWlZ284JAenRtxkJKM1SqH4Hm3k+xVaPHgm87kkDzaX8mrES9o+tRJ/Z9pTABrWjWEmg3MBWEtgjv6KLKz/mUc3hLZRRGZd6Nx8ysaedfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/jKXWKlwjyGbxif/aHnQKUOUXsWWGyX0JVsF7Yfl34=;
 b=Y+pEEirEVQxfL+5t376dXcnq+YJhjef16GhqW5TE6Dc+vGi/riUB3gLe8IVctbM2VCzmw2Al5wONdc54xZlKsnQBxAWO24+8zEhQV6IlVkA6JmGlmWGnTqKyqZ2LWmzFuPrmkgLq8/FttXAxwm1JjxNJpXbILAuvRP+dWUD0QhflnE+XR2nWHb9wVf/rkdWctPPPMo1BP2vcimhUNssOON0Viwslj8SaEIekQ1iKa9HeWqqcGQvgiv+XdLY1UZ0KyrsHbdNnHoAN1thaqwuNgaum6BIMRhBenIVT/MUYbL3UF5iIeY8Qtcy4wl3CGnKm7CPD9epjOJtzHnzjv0TqGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 SA0PR11MB4591.namprd11.prod.outlook.com (2603:10b6:806:9c::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.19; Thu, 22 Sep 2022 21:47:20 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::9c80:295f:7c50:625f]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::9c80:295f:7c50:625f%4]) with mapi id 15.20.5654.016; Thu, 22 Sep 2022
 21:47:20 +0000
Date: Thu, 22 Sep 2022 14:47:10 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <John.C.Harrison@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/1] drm/i915/guc: Enable compute scheduling
 on DG2
Message-ID: <YyzX3hsObw6m37Tk@unerlige-ril>
References: <20220922201209.1446343-1-John.C.Harrison@Intel.com>
 <20220922201209.1446343-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20220922201209.1446343-2-John.C.Harrison@Intel.com>
X-ClientProxiedBy: BYAPR07CA0040.namprd07.prod.outlook.com
 (2603:10b6:a03:60::17) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|SA0PR11MB4591:EE_
X-MS-Office365-Filtering-Correlation-Id: 50f5e091-cae8-4913-5190-08da9ce4064b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4Qrccrx1YHQmgYl/MK2E+omY8jyzmIV8f2mhFNAj7QAJdAtdEKeIAQxN7xtWK3LxGjMpJHVerOHseSGiT9Ss3VibsM8eahYX9eqiNVGCy9w544L4exxOvpZus1rz3qWnc8TsyaU8yXA8Aa++X78u5vFHHPWe/0d+IPkM/BmPRSZ2gur953NajOC8bEabSR19rFuQPjPVrMOxtHDtJuWrRQKuzUypLHWZpgeYBYIpK3haGmhG7bglEJhiCUWFEEE6JtbApRityuS7nHMH3f97BG3UJnOyUlMoV3U/BubCiULKlMeYXA0cZpED8q6Mbx+WEzmhhV2V3tWV18RHRThohaunuiywZw8mZiljeSkTPMAS881MtbK9xKtcBm01efrcWlSIcxnPMSb/jaGgR2i3z4+QGcjv575JPR4+32DU49RfWm1hSQgO7NrKRzwRRyPenGKXfoIe600RIYQA9wFDrAPGUJ+fN1XxSSwWnREST5lXw7r+1lWwrwN579ZNZkJS5oX7ee4/jp3ElnsYAlF/OQ/JOe7ng6dk7+a9Clq1h8DkP3yHZ+3+59VUGpJGiLzDjBL2Try7SPISXda9BTCLCookFFAk0P8Ur9TaAK3m8NKnckFrpGvTuhteQPwyBMoQLudx4F4GhbiriKKaYWAKJhfT/d1Xvc9JtLB+InGuD48IiTDMy205YnpmQ/5NPuwySI5UCy96hsrtmAG4tc+sxQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(396003)(366004)(39860400002)(376002)(136003)(346002)(451199015)(66476007)(4326008)(66946007)(450100002)(316002)(66556008)(8676002)(5660300002)(6506007)(9686003)(41300700001)(6512007)(26005)(6666004)(2906002)(34206002)(8936002)(82960400001)(33716001)(38100700002)(83380400001)(86362001)(186003)(6636002)(478600001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RG40aS84OU1VSTkweDZjU0RqZTh2VG50VmZaZ3NPWkl2Y2w4ekpjRWxYSjdl?=
 =?utf-8?B?MDc1eDdqNmExRUF4S2F5TDhtbWtFR3c3b2ZaR0pUQ2Z5akF2cERrS3Y3OVQ1?=
 =?utf-8?B?R09HdkZaakJHdEY3aWVaeGdObkxTbHk5RkhSdlZlK2RnN2pzS3BGTGsybi9s?=
 =?utf-8?B?MVdMM0lzMFU0Y2dvWmJqVzJHbGpWNDEvVElMNHNGb0ZEalFlSnVxOEFZVDBp?=
 =?utf-8?B?TU1XUERleEhBOE9SSk9MWW52Nm8wR0doSlhwNFIzajhySmgvZGUzdUQwRVFk?=
 =?utf-8?B?WnJNVXYxd3hOcXVsMWhHdXU0eU0zaERJQmtaTkV1K2F5bkVjY2hjK0xobnVE?=
 =?utf-8?B?MlRQUUV2b0picTFBbXJtaEV3aGtnY1phb0ZCT0hyQlRqT2dBOHU5TjZHTHp4?=
 =?utf-8?B?RnV6RHlnZUg3dnB1NjdnREQ2MnVaL0JLQkJDTXV6OUNhakpMY0pmcTNUS05X?=
 =?utf-8?B?NFNERlozTEZIeWdoUndMNUQrOElOM3ZjUlpxaFFSTGVPNGg2QzVCOVM4UGQ5?=
 =?utf-8?B?MVJkWVc4RjhLVUZXVjROVXVFaFFWUURJdVExaHVkNE92N1pPMEdRY1U2Y2lm?=
 =?utf-8?B?VnVUQ3QxZlV4LzRKQ0k5UDhLTjJpN1N2TytFaytWVFhuckE2L2NMdkNSNUdw?=
 =?utf-8?B?UWN5RS95S3dNU3hBd2owT0tmUkE5M05ZUHVKQ0pxZVI2aHVnWHViRjlZQWRa?=
 =?utf-8?B?d2d0L2kvazRxQTN4OUtXVTEwVzRRTjJyMzZlN1pVbWxSb2UzN1Y3anFTSGc4?=
 =?utf-8?B?RUttUjV4NEtjcHBjd1lEUFE3dnhHVERTTU1FT283ODRqSndHZHlaQ2xuQ3hH?=
 =?utf-8?B?ZnVVVHpMZHc4cEhuaGVhVDB2UHZLS0V3UEdHNk56L0pYa2xYRFppNHRrbldB?=
 =?utf-8?B?eXZDWkwxTU5aemVyOU1sdW1mUE56S09NdzZ0ZTB5cENESkkxdDhNOVhDbzFM?=
 =?utf-8?B?UmlGQ1ZuWUlmclFvN0YyUGVXRlFmZjVRcGgvMXFqSEgxNllLUzkvWUpzM2t1?=
 =?utf-8?B?bnAwT2NCenA1aHFOVUx5Mm5xWTFIT3FJUURBckFXZDMybWxpK01kTUdkMjJC?=
 =?utf-8?B?SlgxRHZZZytLaWM1VE9QNzVRSkpmZ2lSYmJWRFo0aGpBSDdCajQwSjdzSkRw?=
 =?utf-8?B?WnZKMkpqT0c0ejhWNFlCaU82S1oxU0grMFl5ei9NekpQVXZ4NDFBN0tJQy9u?=
 =?utf-8?B?a1IrRVZWb2s2ckw5RG8rUlpKWndTSXhPNFNSWW5wNEU2aC8rdGhRbi80Ymx2?=
 =?utf-8?B?TFQ0QmRRYUY1bGZGMm5LRzJTMEVIb3pTQ01HREZueHZ1MnN6dDlScXJnZXlt?=
 =?utf-8?B?ZkVsYmNHZDB3OUNyQ2Q1UHFNeFYyUUVwdElGR3lzY2VLUTRlUnZ3NkR1cmF0?=
 =?utf-8?B?WTF4cGZtd1BCRitpUjh4UE1nMmttM2hETG11R0hEb3ZFcVh2c2lFSTBpZGlO?=
 =?utf-8?B?ckp1SUVlRm9hOEJ1TTNsbkNTQnAxUkNNZ0taMGxTNmhTVXNCSGsxRWRHSEtP?=
 =?utf-8?B?bUtlNE9zaDNmT0ZZRzJNeHZHNGhqeU4xOVp1TmlxMUtHSHRody9HdDBCVnhN?=
 =?utf-8?B?TmVsTG8yK0NSamJCVXExbXJPWkMvL2xIOVdRT2FXbWFuYVJwL1hRL1cwTm9w?=
 =?utf-8?B?RmlCek5sdUFyMS9IKzg5SEU1aFVsd2krRzJWUWEvQS9qa0RnRUpaUlhOUGRL?=
 =?utf-8?B?VEdYSVpZcTR2WmNCUlJ1MlYxdzZMTXAvQmtLanZ1c2cvbnVTTWJXOU9CWUh0?=
 =?utf-8?B?eU0xcWN6UjdjUGtsK0ExMUJCNGJ0ajkzVEg4cE4rYUdEYzRCMzdmQVE0akpI?=
 =?utf-8?B?SnJJS1oxK2NXZmFyTjZKa093NjBKbjdLY1M3R2RmUGE0R2NjZ3k2ZTFUK044?=
 =?utf-8?B?aDJWYk02Ykp4ZE9IcE45Q0VtME9PM1Rkakcydk1rOE5OejJCTjNXQisvemx5?=
 =?utf-8?B?czVYcmczR3NzZ2ZlTzAwdTM3M25YQkdDU3VYcVR1TnZxK1RrSGNid0NqYmZz?=
 =?utf-8?B?bVJsQmNOaCtxZkNDb1A1YjhjbEtaM09BMnZHc3VvUUNpSVgxWm9zeStWTHp1?=
 =?utf-8?B?NzhVeVRGU0RINE1hN3pBdWw2UE9NbG8zR1VxUUJoVnlXTjB0Ym9BQWtZRlha?=
 =?utf-8?B?U2J1UGd5TXFYa2t5cEg0R25YVTZ2V01zZGhEVzI0NWNJellDcGxQSndwTWx2?=
 =?utf-8?Q?vF3WQsFw6wqm46oqFMAtbQ4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50f5e091-cae8-4913-5190-08da9ce4064b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 21:47:19.9672 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 51vgWs3BCCUaa9vX5pXD1r9VQ/ZBXa9YWa4i49eIVdAJk23iiOEjYrEsmJDCbyeqSknyJxj8pt16OpSS16d0neyk9G0zAFEi2bW4OTnLN9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4591
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
Cc: Intel-GFX@lists.freedesktop.org, DRI-Devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 22, 2022 at 01:12:09PM -0700, John.C.Harrison@Intel.com wrote:
>From: John Harrison <John.C.Harrison@Intel.com>
>
>DG2 has issues. To work around one of these the GuC must schedule
>apps in an exclusive manner across both RCS and CCS. That is, if a
>context from app X is running on RCS then all CCS engines must sit
>idle even if there are contexts from apps Y, Z, ... waiting to run. A
>certain OS favours RCS to the total starvation of CCS. Linux does not.
>Hence the GuC now has a scheduling policy setting to control this
>abitration.
>
>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

lgtm,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Regards,
Umesh
>---
> .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |  1 +
> drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h |  9 +-
> drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   | 22 +++++
> .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 93 +++++++++++++++++++
> 4 files changed, 124 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
>index 29ef8afc8c2e4..f359bef046e0b 100644
>--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
>+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
>@@ -117,6 +117,7 @@ enum intel_guc_action {
> 	INTEL_GUC_ACTION_ENTER_S_STATE = 0x501,
> 	INTEL_GUC_ACTION_EXIT_S_STATE = 0x502,
> 	INTEL_GUC_ACTION_GLOBAL_SCHED_POLICY_CHANGE = 0x506,
>+	INTEL_GUC_ACTION_UPDATE_SCHEDULING_POLICIES_KLV = 0x509,
> 	INTEL_GUC_ACTION_SCHED_CONTEXT = 0x1000,
> 	INTEL_GUC_ACTION_SCHED_CONTEXT_MODE_SET = 0x1001,
> 	INTEL_GUC_ACTION_SCHED_CONTEXT_MODE_DONE = 0x1002,
>diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
>index 4a59478c3b5c4..58012edd4eb0e 100644
>--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
>+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
>@@ -81,10 +81,17 @@
> #define GUC_KLV_SELF_CFG_G2H_CTB_SIZE_KEY		0x0907
> #define GUC_KLV_SELF_CFG_G2H_CTB_SIZE_LEN		1u
>
>+/*
>+ * Global scheduling policy update keys.
>+ */
>+enum {
>+	GUC_SCHEDULING_POLICIES_KLV_ID_RENDER_COMPUTE_YIELD	= 0x1001,
>+};
>+
> /*
>  * Per context scheduling policy update keys.
>  */
>-enum  {
>+enum {
> 	GUC_CONTEXT_POLICIES_KLV_ID_EXECUTION_QUANTUM			= 0x2001,
> 	GUC_CONTEXT_POLICIES_KLV_ID_PREEMPTION_TIMEOUT			= 0x2002,
> 	GUC_CONTEXT_POLICIES_KLV_ID_SCHEDULING_PRIORITY			= 0x2003,
>diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>index 323b055e5db97..e7a7fb450f442 100644
>--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>@@ -290,6 +290,25 @@ struct guc_update_context_policy {
> 	struct guc_klv_generic_dw_t klv[GUC_CONTEXT_POLICIES_KLV_NUM_IDS];
> } __packed;
>
>+/* Format of the UPDATE_SCHEDULING_POLICIES H2G data packet */
>+struct guc_update_scheduling_policy_header {
>+	u32 action;
>+} __packed;
>+
>+/*
>+ * Can't dynmically allocate memory for the scheduling policy KLV because
>+ * it will be sent from within the reset path. Need a fixed size lump on
>+ * the stack instead :(.
>+ *
>+ * Currently, there is only one KLV defined, which has 1 word of KL + 2 words of V.
>+ */
>+#define MAX_SCHEDULING_POLICY_SIZE 3
>+
>+struct guc_update_scheduling_policy {
>+	struct guc_update_scheduling_policy_header header;
>+	u32 data[MAX_SCHEDULING_POLICY_SIZE];
>+} __packed;
>+
> #define GUC_POWER_UNSPECIFIED	0
> #define GUC_POWER_D0		1
> #define GUC_POWER_D1		2
>@@ -298,6 +317,9 @@ struct guc_update_context_policy {
>
> /* Scheduling policy settings */
>
>+#define GLOBAL_SCHEDULE_POLICY_RC_YIELD_DURATION	100	/* in ms */
>+#define GLOBAL_SCHEDULE_POLICY_RC_YIELD_RATIO		50	/* in percent */
>+
> #define GLOBAL_POLICY_MAX_NUM_WI 15
>
> /* Don't reset an engine upon preemption failure */
>diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>index 22ba66e48a9b0..f09f530198f4d 100644
>--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>@@ -4177,6 +4177,98 @@ int intel_guc_submission_setup(struct intel_engine_cs *engine)
> 	return 0;
> }
>
>+struct scheduling_policy {
>+	/* internal data */
>+	u32 max_words, num_words;
>+	u32 count;
>+	/* API data */
>+	struct guc_update_scheduling_policy h2g;
>+};
>+
>+static u32 __guc_scheduling_policy_action_size(struct scheduling_policy *policy)
>+{
>+	u32 *start = (void *)&policy->h2g;
>+	u32 *end = policy->h2g.data + policy->num_words;
>+	size_t delta = end - start;
>+
>+	return delta;
>+}
>+
>+static struct scheduling_policy *__guc_scheduling_policy_start_klv(struct scheduling_policy *policy)
>+{
>+	policy->h2g.header.action = INTEL_GUC_ACTION_UPDATE_SCHEDULING_POLICIES_KLV;
>+	policy->max_words = ARRAY_SIZE(policy->h2g.data);
>+	policy->num_words = 0;
>+	policy->count = 0;
>+
>+	return policy;
>+}
>+
>+static void __guc_scheduling_policy_add_klv(struct scheduling_policy *policy,
>+					    u32 action, u32 *data, u32 len)
>+{
>+	u32 *klv_ptr = policy->h2g.data + policy->num_words;
>+
>+	GEM_BUG_ON((policy->num_words + 1 + len) > policy->max_words);
>+	*(klv_ptr++) = FIELD_PREP(GUC_KLV_0_KEY, action) |
>+		       FIELD_PREP(GUC_KLV_0_LEN, len);
>+	memcpy(klv_ptr, data, sizeof(u32) * len);
>+	policy->num_words += 1 + len;
>+	policy->count++;
>+}
>+
>+static int __guc_action_set_scheduling_policies(struct intel_guc *guc,
>+						struct scheduling_policy *policy)
>+{
>+	int ret;
>+
>+	ret = intel_guc_send(guc, (u32 *)&policy->h2g,
>+			     __guc_scheduling_policy_action_size(policy));
>+	if (ret < 0)
>+		return ret;
>+
>+	if (ret != policy->count) {
>+		drm_warn(&guc_to_gt(guc)->i915->drm, "GuC global scheduler policy processed %d of %d KLVs!",
>+			 ret, policy->count);
>+		if (ret > policy->count)
>+			return -EPROTO;
>+	}
>+
>+	return 0;
>+}
>+
>+static int guc_init_global_schedule_policy(struct intel_guc *guc)
>+{
>+	struct scheduling_policy policy;
>+	struct intel_gt *gt = guc_to_gt(guc);
>+	intel_wakeref_t wakeref;
>+	int ret = 0;
>+
>+	if (GET_UC_VER(guc) < MAKE_UC_VER(70, 3, 0))
>+		return 0;
>+
>+	__guc_scheduling_policy_start_klv(&policy);
>+
>+	with_intel_runtime_pm(&gt->i915->runtime_pm, wakeref) {
>+		u32 yield[] = {
>+			GLOBAL_SCHEDULE_POLICY_RC_YIELD_DURATION,
>+			GLOBAL_SCHEDULE_POLICY_RC_YIELD_RATIO,
>+		};
>+
>+		__guc_scheduling_policy_add_klv(&policy,
>+						GUC_SCHEDULING_POLICIES_KLV_ID_RENDER_COMPUTE_YIELD,
>+						yield, ARRAY_SIZE(yield));
>+
>+		ret = __guc_action_set_scheduling_policies(guc, &policy);
>+		if (ret)
>+			i915_probe_error(gt->i915,
>+					 "Failed to configure global scheduling policies: %pe!\n",
>+					 ERR_PTR(ret));
>+	}
>+
>+	return ret;
>+}
>+
> void intel_guc_submission_enable(struct intel_guc *guc)
> {
> 	struct intel_gt *gt = guc_to_gt(guc);
>@@ -4189,6 +4281,7 @@ void intel_guc_submission_enable(struct intel_guc *guc)
>
> 	guc_init_lrc_mapping(guc);
> 	guc_init_engine_stats(guc);
>+	guc_init_global_schedule_policy(guc);
> }
>
> void intel_guc_submission_disable(struct intel_guc *guc)
>-- 
>2.37.3
>
