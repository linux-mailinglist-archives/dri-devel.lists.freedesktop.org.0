Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73367473986
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 01:27:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A52410E9AE;
	Tue, 14 Dec 2021 00:27:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B247C10E9AE;
 Tue, 14 Dec 2021 00:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639441673; x=1670977673;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=klVgRqZKbzMO91gWOeq3kTi7CffJGrLg1c0GLQqfRg0=;
 b=R2sH3Nz1DNpUhLsgl2f9Cpx0HQjtje8y+kMKaULVJiXGvGZS3sN95Gol
 TO1E9kjYH5llDthS/am6qUwPw2T2IwVdxwMJ/1ySgDnRgMsMCbrMxn03I
 +qTSukYiBubr1AlsjZsyaDq+owKBvcepLvNqSvLbR4WpqBFRo/uSHtVdU
 IIwAd9jCKRsDY55sj8/HjqH5nvGPG33x3wuBTmhRiCB0Gc8j9Z0dy4L4o
 COmT/HSgD5iGnvPwL049vT3/dDqlfvXH1ySjA1Ajw08jTcH8at9GJDtE4
 /Do6LVgcgGcF0gSm/zxbE2bQR9M1tCCklopWdjUe2bWXHYiIi4R2qEeqd A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="236393227"
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; d="scan'208";a="236393227"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 16:27:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; d="scan'208";a="614027076"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 13 Dec 2021 16:27:53 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 13 Dec 2021 16:27:52 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 13 Dec 2021 16:27:52 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 13 Dec 2021 16:27:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m+1q9s8bdHErc+glSFDhMgXibi39KwEp7/FDBTkBSPNz+1qGCGDVccQgwrpf1iK+6LgUPBPbhfyMViWeNqMQo/UGnfU9KUtGa2mtKp7iPrR3I3rBfKNaQ87YRdaUTMirF2ZaXA5ml442B0tGiYvmuIzoHv/lH4901Pd0ntTtULyccrfsfx4oXTduV62vk3yjKBbQ3GWI5HbtVoW6IjSvLK2cM14MipjgCN7nLscjcgaV/rea9foPBTBljrnq7VOB04DpwuxAwm/g/5AEnEJRe7st3vlL3geKYdQ/32425c0ZB7u9GQP5oxd0Lz6LcHLeVEtcawUdaeprjNJduGNSuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4sYjA1EkQaDfs9MzzZHTcI81wSJ4Egtr2BUcn/6aMxY=;
 b=KnriNYQOLQZW64mnBdmTNFfycLX4a/lNQZfohY5jcq8TLPfG4/rdeBa9mo9Za0R/FCg1mDgBKKRj1cbcAhkGxxRDzS2ApmM1jJdn4omBdz9NhCo+pzGx38P63WnWRrFKPDxE7TM3mSPVpwasB36xEYUNOHgTrk3HQ5XaHxFMs8J6y0awOV+xHzq+OMHTQVtPBY0L3JeiAWuKto2RLbxRavGTt7jvVUvgUbEH37k5vcuSLsDe37skNU6SeVjbi5BOjbsl+F2WA45FhkiToKKFUcgommg3wct1zhAjT24Rw3Si+eT1FYmECg438CtVIsKfGD5Xz6bs+4iUwS8g49fb4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4sYjA1EkQaDfs9MzzZHTcI81wSJ4Egtr2BUcn/6aMxY=;
 b=lL50wqUpe7lijBLrkYklyCKEot6sg33Uj6pOAqDcdHNCU+pQeqw1CHZmdZ5ZxdsjLiYfu47sdi9eOdFZPadKsrU7i4tjSEPpxO8VxP0zDVeNH4Q6BnNXHVd2bySpVZrEMadwZjBHaKVL2GZWmE5IsYfRhfb6YWnQ9Ki+/HOoE8A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BY5PR11MB4306.namprd11.prod.outlook.com (2603:10b6:a03:1bb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Tue, 14 Dec
 2021 00:27:49 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::8460:d836:4335:641e]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::8460:d836:4335:641e%5]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 00:27:49 +0000
Message-ID: <25ac6057-a223-8434-2b7e-42020d718b7e@intel.com>
Date: Mon, 13 Dec 2021 16:27:46 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.0
Subject: Re: [PATCH 6/7] drm/i915/guc: Kick G2H tasklet if no credits
Content-Language: en-GB
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20211211173545.23536-1-matthew.brost@intel.com>
 <20211211173545.23536-7-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20211211173545.23536-7-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0044.namprd04.prod.outlook.com
 (2603:10b6:303:6a::19) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4677fa2a-63a1-41e5-c22f-08d9be988eee
X-MS-TrafficTypeDiagnostic: BY5PR11MB4306:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BY5PR11MB430641087D46A9ED71B1BAB5BD759@BY5PR11MB4306.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:164;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zNUysxpzyzPI4Lf5H1lWcr3GA9MdbX36bW/0ex3q4J3h3GhozuMqt6XrLmy1QslXYufW6OsNTdB8ddTRzjcy7rwksCE/KxgUOXHr7ioKjtQy/dLbdvBcjNvHgRZVhLTNSVdlquwzna4kmayuV8kpwAVt3tLsscxKJCSJAr4CVRvp1xiFlmUxklgtBrx1LUSRnOmX8iUf519riS6SwGI06hw/NqxijILRuebVs/OMYSSSqvYrXKelxpG0xCpHls6Szlg3sGudG5v5RSIADxUHX/VHR83qgJB/e31c+/V5l0DJzvSx7CdIdKAcLL36yDmvmIMxyyv4gqQI9U1vK1bx6lywBfR8PUDooOyP6yl9QQhzN5iohAbleG2Mz6KY3CQAMBBm+9sg9yIXgIC3oK4bo0PPAxL+W/yWJCYAirENol3xCDBL+amuAhovOTDGK8K2/kVCU1858A5PBEuNw7Tc4BUN2qPudyw2nwwaBt45GRWFTXAMgFpPbs0nUPkKHBAMwopeLtiwYnC3MTlu/NJa4kq9tPOfQhtAfpkb8psMVX2PczQALow38k412TJUOC2xIAz8OzjBVc6MrA6cvPlM2yvnmyKECfk2K6njExmEl7eqFHmlD+32yZGGFKAdk+mTBdDK98MAXF+S2FeMXFD847XFA9QNX3sPc4WAGzsgGTYUG8j/XMt6+Qqnx5aAvAkow8lKr94bX2pyJ8op3CXmpkaz05ZH4/d1H2riTvJkzW+hUi3Wje66ErtNYPiBygOP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(450100002)(31696002)(2616005)(82960400001)(8676002)(4326008)(6506007)(107886003)(86362001)(31686004)(26005)(83380400001)(53546011)(38100700002)(66476007)(186003)(66946007)(6512007)(6486002)(2906002)(36756003)(66556008)(316002)(5660300002)(508600001)(8936002)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWdMM0lFR05pOXNRdEtvYlRQYmZ1YWthNUhDWUxRSHRYSlJUS0hLbmF4Z3Fq?=
 =?utf-8?B?WUE0ZS9oU3o1d1dIZHVlWkx1c2gvYTdpSzR0Qnp3Tkh3a0xFd0lQVDZhVXFI?=
 =?utf-8?B?aEVIODlkSStmSk1QSXEwb1JwS09yY1VaNWRVZnhMQ1o1QjJRWUswMUF2cy9U?=
 =?utf-8?B?Q3VHMEh3TmJFOVJBKzBkTkp1NEl3L3NPOG5NZkN2NXFjUk9mVk5hYWRpMEFx?=
 =?utf-8?B?NktsSlpaMTRPODVFcXVoL0ZQdmhwN0ZRT2RvWnNvUWtXcXZLdVNiaHBVQ2tm?=
 =?utf-8?B?OTlna3hMTllPbmQ1MGl1U0JjS0FCTUdrTFhLUVdBSStTaS9NOVU4R01xM21J?=
 =?utf-8?B?NktnM0xNOGNsbVpGYWJSQXRpZ3NJL3JGZThrMDJnNjVEeitBQ1dKWjZWbHFm?=
 =?utf-8?B?RDRVQjhQK2U0NWlkeGkvTU1LM0hmbzlDdWF0UlBXdEhLdW9paGtOR29RSHJZ?=
 =?utf-8?B?cWRCWnI5ZGkrck5kWS9FQ0RzRC8ySkMrNmx5ODBLdTlHSFhoVTlqTERUMDNL?=
 =?utf-8?B?ZjdWRloxVEFoaWVWZ3ZBbE9oZkVlcXZRYUpWSUk2Q1F2OFlBYjRFRjZ0ZHl6?=
 =?utf-8?B?Q093YjQwVHg5Z2RSeEpCWXorWlJ3REIyVEhJVCswbUlqVDZmWWFtRVNVcDFB?=
 =?utf-8?B?Mm5hSFpVTW5EVHZDY1krT085bXBoSzY5OHMxcnRYMk9wQ0FNbW13cEdVZTNT?=
 =?utf-8?B?U0EvN3JuSEVuK2ZLbXlUbDErVEtTcTRGV2dldlluNEM0UXhnQjZvMld3NWYz?=
 =?utf-8?B?d2RVRXpVeFhucVR3MDROREVKdk5COXZibXZMUTZpMXYydUhFeUNWL2RhcmRu?=
 =?utf-8?B?aHE5bXNrcmRhLzl1bUVZTk5LY25aQ0NKekdmZDk5Sm5PRkNpNDhROXdBbWg5?=
 =?utf-8?B?T3FvVGhEREhURG9WbjhsWExjM0ZTaFgzTDl4Wkh3NGU1cXgwQUZaYjZnVmV0?=
 =?utf-8?B?M0pHcnFPdXdQNGdQYWJLYk0yQ0RXYk94Y25hcTFDc3ZQNWM4NU0rcndXUnpj?=
 =?utf-8?B?cURkK0dXM2VFMHRwSklva0lsZ09Oc09xK1h1L1EybDhBN29lRzhnckVkVnBR?=
 =?utf-8?B?c1U1K3BheG9mZ2tiQ251dGlZeTJtZ25CTkJBUFhYY3FMNENuUmdBS2p2RTNQ?=
 =?utf-8?B?cW83SStKV25yK3o5QjFIQlpPelNxQ09GY2tYM1BqQjdnRkg0TitmNnpndzlu?=
 =?utf-8?B?T2NFTy90NWZIaWUrK1lXQkZaRmZSTkVwMWM3TGRBVUlTVFZOSjQrdWl3bjZM?=
 =?utf-8?B?QjhabFpuUHNaUGJBZ3BUa0VLYXY1R0pOL25hVVlXdEFFSnN5VWV3RWN0Yi8v?=
 =?utf-8?B?SUtOSE53MUp3M0tvRGRoTXp2ZkNPQzJaOS9UaDdBSTQ0ZzdUSnJJa0hWNEVu?=
 =?utf-8?B?aDFXSEtzdjZ2WTIzYTNabFMzUnVZZGJOT2RyOHFjMDlGSzhQSEIwU1VRQmE0?=
 =?utf-8?B?bUhzWmgrdzJSamtSMHdLMy9TYUJkejNjcHpEYmRYMDkrMjlCai9qVGxnc2JF?=
 =?utf-8?B?SE8yWjVMQVZuc3V1TlJ3TGkvRzM5bWtQSi9CcWhScTNReVIzSFdGM2xjemRi?=
 =?utf-8?B?U0MvNDVnOVArM3ZSbzZoZlhrUkdIZk1ydnJTdU9yc2lxTGh6UzI5U2ZXcXNr?=
 =?utf-8?B?Nk54K0U0K0UwOFd3YXMwTDBDclo0MzdPMHEwVytTOVZSbGVJd2c3V3FTVzZB?=
 =?utf-8?B?blZURjB3dWJYbUVORkhBblFIRmR0dnRxditrU1FqUXNHMG1GaGY5WEFrNmRN?=
 =?utf-8?B?R1lUY3JtSElPOHczRHhVZWl0T3VsM2RTeXkxMUJxQ0UveDJWVGpZMTQyQjUw?=
 =?utf-8?B?ai9HRnlxZmxRdkpkOGV0M0ZJZ3lkaENtdjZyeVZpU1Y1bHIzdUhVWDFMRTZT?=
 =?utf-8?B?RVhlU2hNUTZSWTNLYzk4eFJ0bmtoVU9NTjdGcHB5TlE5RlRFaXNhTHZyZ1o1?=
 =?utf-8?B?UE1aTzRLY1pzd3VJSG5Fb2R5MU15c2YvVE1xek5EMlRSV0NNTmdHc1RKY2VG?=
 =?utf-8?B?SWpaUytUK3oxcGsxdHdRYkxhRG1BbkRSdGYraXZjQjlPeHVEaFNPSllhbEgv?=
 =?utf-8?B?dTAwRnRBVlBZcWRsbjE5Sy9ZdWx4NlVIU3JlZVY0bWp5OXkrRFp6ZUxNL1J1?=
 =?utf-8?B?aGxjQjBxYVBDTFB1SE5FdWpjcWxvdFB6S2JwQmhWbC82dEcrNUtrTHFuSmtt?=
 =?utf-8?B?NXNCVTlzby90eGpvL0M2ZTZ5TzFXL0dKcWM5TWthcTVwZGFUNmxwNzZObVcr?=
 =?utf-8?Q?dRpxz2zQ+aJsoK7jyID0U25+YC8x/W9vakB0/lB1wE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4677fa2a-63a1-41e5-c22f-08d9be988eee
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 00:27:49.3204 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SBbfFusPZLQzUVgvOcc+VZ0gwQ0PaoNrYItDkNeq6IudnSJ07sEKQWLIUqxNDhFBxfsKNbspkypshjaErzmzOLeXdynJ6pmnAuq6w8yTamc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4306
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

On 12/11/2021 09:35, Matthew Brost wrote:
> Let's be paranoid and kick the G2H tasklet, which dequeues messages, if
> G2H credits are exhausted.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index 741be9abab68..aa6dd6415202 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -591,12 +591,19 @@ static inline bool h2g_has_room(struct intel_guc_ct *ct, u32 len_dw)
>   
>   static int has_room_nb(struct intel_guc_ct *ct, u32 h2g_dw, u32 g2h_dw)
>   {
> +	bool h2g = h2g_has_room(ct, h2g_dw);
> +	bool g2h = g2h_has_room(ct, g2h_dw);
> +
>   	lockdep_assert_held(&ct->ctbs.send.lock);
>   
> -	if (unlikely(!h2g_has_room(ct, h2g_dw) || !g2h_has_room(ct, g2h_dw))) {
> +	if (unlikely(!h2g || !g2h)) {
>   		if (ct->stall_time == KTIME_MAX)
>   			ct->stall_time = ktime_get();
>   
> +		/* Be paranoid and kick G2H tasklet to free credits */
> +		if (!g2h)
> +			tasklet_hi_schedule(&ct->receive_tasklet);
> +
>   		if (unlikely(ct_deadlocked(ct)))
>   			return -EPIPE;
>   		else

