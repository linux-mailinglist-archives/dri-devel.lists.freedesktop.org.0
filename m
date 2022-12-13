Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC4A64AD5A
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 02:52:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2584910E19D;
	Tue, 13 Dec 2022 01:52:40 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09C7910E19D;
 Tue, 13 Dec 2022 01:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670896356; x=1702432356;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ucaTL7CGJLyzI5gLjH3Q6HmhhukF7taf9pg7TbFqTwQ=;
 b=HG52jpFC6vnfnrCeHuKqhxj9AYFeDrBzFOvFgUxjyG4ZXlvfY+DAe9FM
 LeiI/vVTZAizLKy8TMj0ubwpg6RKJWaClLxJVxtYsPXDujc8tJ/XmmVd0
 xFaERoHnLZ7plZ2FAHvTkQGHd1ZTKPmcDHLQmhPsbiuIoI4mgqgokZGRr
 P9CBBjqfVmrn+dha2JAZ3bwCyZfWendCzHzL0Lad19TuiaE3ksmOTL9Od
 EXlriLMDxeSk+7AnV/Mye8WQemc5LM495Ao+nc/19Jj61wohE/oHZHKlw
 p9TgDTx4RzwhekgmSYy5G0mAdAZdMaCHxyrSpB0zaMhQbFxdw1b6fuQhw w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="315650203"
X-IronPort-AV: E=Sophos;i="5.96,240,1665471600"; d="scan'208";a="315650203"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2022 17:52:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="893727879"
X-IronPort-AV: E=Sophos;i="5.96,240,1665471600"; d="scan'208";a="893727879"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP; 12 Dec 2022 17:52:32 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 12 Dec 2022 17:52:32 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 12 Dec 2022 17:52:31 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 12 Dec 2022 17:52:31 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 12 Dec 2022 17:52:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WP/fIS7J0bhcBuyJnooRXiWouzBTU311y+jylNlGLYc1fOcgTnfZrxUJ0CH4+KTzMqO8Ut3xFcf+XYgaty/L7lEGYkaol3MBUMTeH0AZNDzc55ReTQCBeNzcCJ9DyHEaJfyVyWpGTWv51JqZ7vvxyKm8Ttaqe+Dl7+aLC4FPL6K3b1TrBGSugcq87nfqCEL5udapfq5+su/LiR9B4AMnAEhSuuUenGJWlcsPyDMSEq/btcrwt5s2AX0SERJuoYTMcbi6DvH+96FW10upiqNISSuHi3giV4eyfIWtR7NMhs3Y9PVkBMyIzktMpadmNDz2vlxb7fwNSODW9FgQM+6OVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xUyk1KWr7kTjVq/gRbkiIO508G6vgN/fhSPVGpthdLs=;
 b=krrm24obfhvPdLEllrvuXGMH4r49iXRxWRnHLurJg2apWXoZIv0G67v2GRuy+cwzqvLO9Bs+3kpbi/r9sJn1J9MFyQZdpPVy7TLPF/mQdneZZySmO+J1UYUvGmZ47QhQdCnKdnV6LUaoSw5Q/GLXlNI96KEqIlWoksXf1ZnbNWLEZ1bJ+O+S9TYeINaPAIJCa4J5FuD+9pjRtZCIH7ZKBZc+k2cvUNrz08xcx9XI490gBIIt9mlh4m4U6nbCRWUQ658Vy4HJnCtveCsInXLgLsaXqPl4uSRq5yvQgfAftC40rMyJXl2/gqMmAmQvsgMJ4LbDYVltgw4jBMajZDba1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 PH0PR11MB4776.namprd11.prod.outlook.com (2603:10b6:510:30::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.19; Tue, 13 Dec 2022 01:52:29 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::78e2:5141:1238:973a]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::78e2:5141:1238:973a%4]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 01:52:29 +0000
Date: Mon, 12 Dec 2022 17:52:23 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <John.C.Harrison@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915: Allow error capture without a
 request
Message-ID: <Y5fa1w2yIUVgBhyp@unerlige-ril>
References: <20221129211253.3183480-1-John.C.Harrison@Intel.com>
 <20221129211253.3183480-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20221129211253.3183480-2-John.C.Harrison@Intel.com>
X-ClientProxiedBy: BYAPR11CA0048.namprd11.prod.outlook.com
 (2603:10b6:a03:80::25) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|PH0PR11MB4776:EE_
X-MS-Office365-Filtering-Correlation-Id: a73ef7c3-91fe-4452-40a3-08dadcacb173
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: klnTuevNCAIRjGknUxx9TPY2g/KFKU9GkqX4PUtAqCeYBSFAbFzPcDuu8vHME03eyGiJG9Zipqh2evjuuz/uBfpedyqLbwtUVRdHdD2srTwWXaupZ4QehVIdfTahV9phu13HGguWzY5TMD493mgKE4RsjEL1knjtYwGo5fGrnLvRUp62RfkOOWicHJ+wKnemWgp4ixxk5qS3qLX1DSzkzDjdotL2eLEOJYK0WV137or8qnhj6UB2XklxDxnMDLXIWgRMKda7hzP+GE5GDC0fEoky9YKI2FmMKZr/aKSnUTeXnWWi0lpnObzhB9tkmKX8f2udTFSn0dayT/540mshG4xLcxmag8/h8H6N7BQVArO3ejH+wS2/ZeuPIXqPnNHKzCwVAjq1yyn8G9xDsHAvcK2N1unJxKuAyWLfBMl8rljBxbMYNfZXfiG5Tev347OSgUVlg2sa33XqQXlO2jvATUbkyv6Yl/kWvuxamHxJ9wgOgJYxgoj+V6iUIajZ2QxaPU6sAxKupDxq1dnkNQbK8jNcnY+wD+gco9yLeYGyQNnMr5FyePmTaaKax0chmc5BY6EHUTd4eURSPWl4tZqmB+3Htlp9xt4AOzInVleNoDYvzLbQiHbky79o3fIiXgjYITB81q5XxybHshQe/HuT0Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(376002)(346002)(136003)(396003)(366004)(39860400002)(451199015)(33716001)(9686003)(316002)(6506007)(6666004)(6512007)(26005)(186003)(6636002)(6486002)(86362001)(83380400001)(66476007)(82960400001)(8676002)(66556008)(66946007)(4326008)(38100700002)(41300700001)(478600001)(5660300002)(34206002)(2906002)(8936002)(450100002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzQyMERwRHc1MXhTMEg3L1ZhTTBsc3duSU5RdzhlMmN3Y2l2dkZHMFlIT0kv?=
 =?utf-8?B?aFNFT2YyUnRCZW83WWIralF6TVRIcXBvU2Q0a0xEQ0NuV2drc24wOEpQZ1dk?=
 =?utf-8?B?azFWazJyQUlGZktOWElmbnZ0ZW5oNkZJcThIa25kQUFDNmVsWCtmN2dva0lS?=
 =?utf-8?B?b1pIWGFKZHhZdUlYaWtGTTRUM3BPaTF2R2xsVDlxZ0FFV1pWYkV5VkVmRGZL?=
 =?utf-8?B?UVlHY3YwdnBlaXUxWTZJdXJlbm9YVzJSQ0pXMmlyY3RwVTFHeHZXN2NPRHpo?=
 =?utf-8?B?ckJET0svay9teGVDNWtFT0hPVUpJRlJsajVLQXd6TEw4WTBEMUdWaWlEMSth?=
 =?utf-8?B?OTNRdUNRM25KQ0ZCUzhRNzQzMElNUDlPYzFId1FPN3RPVnFBS3FKRWxxQ2xB?=
 =?utf-8?B?TndWTUQzUkdOR0l3bk5PbmRjbzJmRVJiTlZOSnVPS09lT1QxVmJ4QmhMdkU0?=
 =?utf-8?B?UVVpTzJSSk5mcm9qa1lUQVIrOEIyS1ROK0NjYkk3V0FaOWlhQ1N2b0g5aEky?=
 =?utf-8?B?OXU5d1FCekg1WmhuRXRUVFhUdWZCRElBbUNoUHJPajBKZHZqbTBNeUN6aEhh?=
 =?utf-8?B?RW5nbktIb0FNWXhiU2Jnc2YyM0pxWVFUT0RkSFQ2bVFnS01pM21UUFdSTGIv?=
 =?utf-8?B?aEdiTXZHYjhpaDhrN3B1RVBKR3RaekJrNGJEZ2tIYi9XZEQ2eXdMeEpYQ081?=
 =?utf-8?B?cmpDL3p5eTFmWFlJWUl4N0RkOUcwM3p4QUpvRnRUaHM3YkpTMDZFWXZucXZn?=
 =?utf-8?B?QS85MXU2Zi9pTUtxN1pTcHg5NVdMa3lVaE14OEhud3lpeFBleFJMMStkNkRN?=
 =?utf-8?B?QmIwaHY4em4zZ3BJNndvWGhnVWdHOHpOYlRnZ1pPZjUwMTArRENzR3dZaisy?=
 =?utf-8?B?NkU3NC9JWEpZdnpYelNQY2RhdlEvMUJKM2ZLaytTMTRaWCtLSjIyMGxEd015?=
 =?utf-8?B?SmhrVm5CUUVKYXc4UDZ0N2s0NUYwalBRUjNaa1ZCZS84QytJVkhTRGV6eVh1?=
 =?utf-8?B?MGNodUNPdTh5VWJ6M1UrV0d5eHFRU0s3WU5SN1JkNEZjTUNQWFUvUEZIemdE?=
 =?utf-8?B?NnlTaVpPN1A1UGs4SkZuUVhYUGk1Zm40YjI3R2llTUFlU3dEbTVXSU1CRUpq?=
 =?utf-8?B?WnBPNmNyYUZ2a3poOXBZY3hXY24wNzRwVnpuNExEODdWK05hWDgxNDJtMjV2?=
 =?utf-8?B?eHkxM1dIaE42UXAxb0lEWG1hSEtMcmdZaHdpZVZDK0VtZWtiK2tLOXRsdXlE?=
 =?utf-8?B?R3MvTGQzT3MrQWlWR1QxUWFrOG4vbzRxMWtaNFdqK3FJdlV3UEUwWjkydTZ0?=
 =?utf-8?B?K292UWhPcy9TRC81L1RFaWZtdHVveEpiQjhrOUYwQllsbnpFUHFJT0x2VExX?=
 =?utf-8?B?Y2ZqV1NNLzU1aXp2MlZObEVkeldXdVF2a2NqWklGRUEvT3JraFVKcEVIS1dW?=
 =?utf-8?B?ZWk4c2JHWThQYzNra0traFgzQkNmSTM0NHo1bEx6a1p1MU5DUXBHVzc0Mlpp?=
 =?utf-8?B?YzJaSWs0SGM5eTM3L1FwRTZLejZhN3VZZ3Z2aVEycVZudlVQOWhJMThZZGU0?=
 =?utf-8?B?VDhsYy94dlZOS2tSakhwbTNuanNVKzVCM3pTMjVIMDRHcHhMaWRwczJqbkhS?=
 =?utf-8?B?NHNnZW44cUNXWEhxY2RXd0gyczJwZVNQanRoR1h3L29CaDdFMVNPTERmT2RM?=
 =?utf-8?B?amM2bmFGVjBiclNxVXNGZXZKT2RWZ2gwSW1QRUJZUTF4bXcwVWVEZGh2T2NR?=
 =?utf-8?B?MzRoNmpSdW9EeHl1amRxMHV5WTRJRVdGYlZEd1hvV0tIMXd2dlNxN2JwRU11?=
 =?utf-8?B?S0ZxNW1XTmNiZkw2N0hEYi9LZHNPYVhuUGlTN2pLMGFXS0J0KzdmZS8rZlZi?=
 =?utf-8?B?ODc2L0dBNmxZWG9ySld3OG55d3ltaTZxd0NmRnZtb0x2ejJKV2lqaGh5THk4?=
 =?utf-8?B?eGNIeDhMZ1B1ZjNRVzBaQ2NSOEZycmJWMG5TVWtaWjk0Y3NDRkJ5cVQydUNZ?=
 =?utf-8?B?anhFRnZ6SnF0WmNkMlBBYjJmYVZUQXJxaTVURHlVSm9OaEQ0MUhHMHczMk12?=
 =?utf-8?B?aCtSTDA5dHJvKzhJaGxXYnZVVk1ZK3p0alU2dFY1emZiampVM3lTWVcwSGxD?=
 =?utf-8?B?RjRRK0U1bmlwME9QVlBSak5wTGQxQVRPdkx3YUszb0hIV2xFeUFXMjVYeE1j?=
 =?utf-8?Q?qsDDYdDhy4WbVC0m4zKhXpU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a73ef7c3-91fe-4452-40a3-08dadcacb173
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 01:52:29.7671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2beHpO58QjLJEUirHuBXP9qwyi8ik7uyW/P8+xvJrFuttVUK0RQN4QemJcma3poG1FB/POLuQ1LS4geq5iZDe0RFC61wfBM0Nq0lmMxoLp0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4776
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

On Tue, Nov 29, 2022 at 01:12:52PM -0800, John.C.Harrison@Intel.com wrote:
>From: John Harrison <John.C.Harrison@Intel.com>
>
>There was a report of error captures occurring without any hung
>context being indicated despite the capture being initiated by a 'hung
>context notification' from GuC. The problem was not reproducible.
>However, it is possible to happen if the context in question has no
>active requests. For example, if the hang was in the context switch
>itself then the breadcrumb write would have occurred and the KMD would
>see an idle context.
>
>In the interests of attempting to provide as much information as
>possible about a hang, it seems wise to include the engine info
>regardless of whether a request was found or not. As opposed to just
>prentending there was no hang at all.
>
>So update the error capture code to always record engine information
>if an engine is given. Which means updating record_context() to take a
>context instead of a request (which it only ever used to find the
>context anyway). And split the request agnostic parts of
>intel_engine_coredump_add_request() out into a seaprate function.
>
>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>---
> drivers/gpu/drm/i915/i915_gpu_error.c | 55 +++++++++++++++++++--------
> 1 file changed, 40 insertions(+), 15 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
>index 9d5d5a397b64e..2ed1c84c9fab4 100644
>--- a/drivers/gpu/drm/i915/i915_gpu_error.c
>+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
>@@ -1370,14 +1370,14 @@ static void engine_record_execlists(struct intel_engine_coredump *ee)
> }
>
> static bool record_context(struct i915_gem_context_coredump *e,
>-			   const struct i915_request *rq)
>+			   struct intel_context *ce)
> {
> 	struct i915_gem_context *ctx;
> 	struct task_struct *task;
> 	bool simulated;
>
> 	rcu_read_lock();
>-	ctx = rcu_dereference(rq->context->gem_context);
>+	ctx = rcu_dereference(ce->gem_context);
> 	if (ctx && !kref_get_unless_zero(&ctx->ref))
> 		ctx = NULL;
> 	rcu_read_unlock();
>@@ -1396,8 +1396,8 @@ static bool record_context(struct i915_gem_context_coredump *e,
> 	e->guilty = atomic_read(&ctx->guilty_count);
> 	e->active = atomic_read(&ctx->active_count);
>
>-	e->total_runtime = intel_context_get_total_runtime_ns(rq->context);
>-	e->avg_runtime = intel_context_get_avg_runtime_ns(rq->context);
>+	e->total_runtime = intel_context_get_total_runtime_ns(ce);
>+	e->avg_runtime = intel_context_get_avg_runtime_ns(ce);
>
> 	simulated = i915_gem_context_no_error_capture(ctx);
>
>@@ -1532,15 +1532,37 @@ intel_engine_coredump_alloc(struct intel_engine_cs *engine, gfp_t gfp, u32 dump_
> 	return ee;
> }
>
>+static struct intel_engine_capture_vma *
>+engine_coredump_add_context(struct intel_engine_coredump *ee,
>+			    struct intel_context *ce,
>+			    gfp_t gfp)
>+{
>+	struct intel_engine_capture_vma *vma = NULL;
>+
>+	ee->simulated |= record_context(&ee->context, ce);
>+	if (ee->simulated)
>+		return NULL;
>+
>+	/*
>+	 * We need to copy these to an anonymous buffer
>+	 * as the simplest method to avoid being overwritten
>+	 * by userspace.
>+	 */
>+	vma = capture_vma(vma, ce->ring->vma, "ring", gfp);
>+	vma = capture_vma(vma, ce->state, "HW context", gfp);
>+
>+	return vma;
>+}
>+
> struct intel_engine_capture_vma *
> intel_engine_coredump_add_request(struct intel_engine_coredump *ee,
> 				  struct i915_request *rq,
> 				  gfp_t gfp)
> {
>-	struct intel_engine_capture_vma *vma = NULL;
>+	struct intel_engine_capture_vma *vma;
>
>-	ee->simulated |= record_context(&ee->context, rq);
>-	if (ee->simulated)
>+	vma = engine_coredump_add_context(ee, rq->context, gfp);
>+	if (!vma)
> 		return NULL;
>
> 	/*
>@@ -1550,8 +1572,6 @@ intel_engine_coredump_add_request(struct intel_engine_coredump *ee,
> 	 */
> 	vma = capture_vma_snapshot(vma, rq->batch_res, gfp, "batch");
> 	vma = capture_user(vma, rq, gfp);
>-	vma = capture_vma(vma, rq->ring->vma, "ring", gfp);
>-	vma = capture_vma(vma, rq->context->state, "HW context", gfp);
>
> 	ee->rq_head = rq->head;
> 	ee->rq_post = rq->postfix;
>@@ -1608,8 +1628,11 @@ capture_engine(struct intel_engine_cs *engine,
> 	if (ce) {
> 		intel_engine_clear_hung_context(engine);
> 		rq = intel_context_find_active_request(ce);
>-		if (!rq || !i915_request_started(rq))
>-			goto no_request_capture;
>+		if (rq && !i915_request_started(rq)) {
>+			drm_info(&engine->gt->i915->drm, "Got hung context on %s with no active request!\n",
>+				 engine->name);
>+			rq = NULL;
>+		}
> 	} else {
> 		/*
> 		 * Getting here with GuC enabled means it is a forced error capture
>@@ -1625,12 +1648,14 @@ capture_engine(struct intel_engine_cs *engine,
> 	if (rq)
> 		rq = i915_request_get_rcu(rq);
>
>-	if (!rq)
>-		goto no_request_capture;
>+	if (rq)
>+		capture = intel_engine_coredump_add_request(ee, rq, ATOMIC_MAYFAIL);

2 back-to-back if (rq) could merge together,


otherwise, lgtm

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh
>+	else if (ce)
>+		capture = engine_coredump_add_context(ee, ce, ATOMIC_MAYFAIL);
>
>-	capture = intel_engine_coredump_add_request(ee, rq, ATOMIC_MAYFAIL);
> 	if (!capture) {
>-		i915_request_put(rq);
>+		if (rq)
>+			i915_request_put(rq);
> 		goto no_request_capture;
> 	}
> 	if (dump_flags & CORE_DUMP_FLAG_IS_GUC_CAPTURE)
>-- 
>2.37.3
>
