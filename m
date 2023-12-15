Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38749814D8B
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 17:50:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29CE410EA50;
	Fri, 15 Dec 2023 16:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D331F10EA4C;
 Fri, 15 Dec 2023 16:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702659046; x=1734195046;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=h0wtxIIfn8MKNFG08zwWEHX4h19uCjWIoV+sJAN9FNw=;
 b=kex9Efr81fAE/2i1Gc4VqjJq9rCeKlP+eMWuoJCTBkeNmyI3ora0sggB
 tT5blNsEVgvRBfphJkAR7ZO7OJ1JGWUgSJe7BDaBSTTWfK5YYmuvFIa20
 ETEn2Hts+t1ZrmweTwUD+v5w0OiyopU6kq9ay+3Fs7QWp6rj04aEaF86E
 xkp5b9zyIxlj/+8gGw/yvtpcsXVsOc+3W7GJNPcH6r+4P9UpF9mbF4PhR
 RVltP2UpgeA3N51f4glkUPeTzb7FVaDP4YJvplcQ8nOn9l7+oIVYTyVe0
 7B+mDT5tAbm2zWgbudemIGuHuZQSYJcWsmGSLpOG9rTIQY4i4iM3oZvTs w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="392474745"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="392474745"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 08:50:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="845184595"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="845184595"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Dec 2023 08:50:31 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 08:50:31 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 08:50:30 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Dec 2023 08:50:30 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Dec 2023 08:50:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CpMb9Uo0jH+LtuAchfGLFPLePrlIyMW3ZrqKqBgdod0aLlp1YNpxlhZ94dZa/OLyhM187jUgSWa0O1JPBHhY95eTF1Ei/W8/9rqH2SonF92xsnYSjw3FqKnrjFKKKxmy7g9lLKD0RvjpoCVEoxq8Z8eA4dcWfjANMS8W4NtEr02F2cgdWniiS1M5YX7IeTZ920EYa60VwihkYfF+QTLSkqIAMVHlDZb/so7/mMKkCLZljhS7mHL/bHCSKQdkp0dxStgrWEmgURrzeTRpFwXbrrQ3Tlvnw+JZaxzWHjq+chf0SycxyhIDKn/n8Qr2CSNbIa25RSmS1FAxXeicca3pqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PDpwDRPwNhg153x5OSepwSoTJTGvOgbbENog6wFF8Ho=;
 b=Nlo5z4Uz2Cx2Vcjp0ovHNAKBbswele9ozxrSZtgTWqxw0j68k4SaivzHeGfmfD60sHI2zwZr9pqT5nAuqikKw2ir/VnGJqSgbaJ+XcmBQNIDuAnj7dhRvvpY8xQZnJzlVKkACpyLOm+8mF62ri1P2B3g2wRs7naqjf2jBwSdFYJDAahKnjR7y+2MwM40G7PWHOOm04/OsnqOrJ6mP6eNfUdiDpOLlHz8vG7BZ2DrBURIQXpiTURfQJhu0lHfagP3laRVIPDxk63ToaqtWs/HMiAskhriXrlztrtBmLVUktxDGKDM29BzwWLi+2VGtYAKy6bbt1IV/WOVahkKGpodMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6137.namprd11.prod.outlook.com (2603:10b6:930:2b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Fri, 15 Dec
 2023 16:50:20 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7091.032; Fri, 15 Dec 2023
 16:50:20 +0000
Date: Fri, 15 Dec 2023 11:50:15 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH topic/core-for-CI] perf: Fix perf_event_validate_size()
 lockdep splat
Message-ID: <ZXyDxyBV3gBRdXQm@intel.com>
References: <20231215162217.3273876-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231215162217.3273876-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0349.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::24) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY5PR11MB6137:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b878cc5-2f0c-4fe2-9839-08dbfd8dec40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /pCBQlFF8BZQR/oEH9VikVCosdSSGFjC5R5XBWV+4E95HWm1Tab9FNuDJvI1AamRzcczp3ImoFodi9HHhdjtdbSrHbGysDbEZwqqj/7DKYBr6/5Mi2k6wWib94+alLWszPgLuHu/qc5Os9IDG/nBzSAz8eYrYqQkAv42GUVWqWajrbaDTbxw9xJG3Ql/i+J/vq0T/EBUPwtnX1sUoLM1ITFZbLvDyur27VR0Gh9CBJGly35csIeql/b0CRvG5VIfA6fqJWcRwP742LLfRES8TG5AW6Re+dhvBCM7bsoAZ9ZEaeza2Os6C33vcYxAFr8/bMB73usgO1a0bf3InPiQ97WHLhUWY6fcEurDP8Xsc0kF6etu08wtY9Ymy4C8DVsmzQbA+yyc+SzceuJwo7SjZCjzuqsp3XDN4IF1OX2kv6v8z2xc7uyNHRMiLTdxY1AYXsMbamEBVSBHTCEqim5TW3f8R2PRv2UWkYiF2M/0EGJOo9GN2ttvJuVs/5xzz9QFEx0cwPQLCQ3UQ0MfukBIqmuiivMe9azy2r7gagQNcozKI362ueKfWA2S4uqtOUxfaAEG5+M5qBNBBBqOPaN/BIcnFJg0We75WEhFj4GRTJVgI25rHXOZM0PIHHL+aUy/G8bVfXdFl+GB0u/tZHWKycNkQkGWvpmYS587shHfQsU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(136003)(376002)(39860400002)(366004)(230922051799003)(230273577357003)(230173577357003)(64100799003)(1800799012)(451199024)(186009)(83380400001)(82960400001)(2616005)(41300700001)(36756003)(26005)(6486002)(6666004)(8676002)(5660300002)(966005)(6862004)(8936002)(4326008)(86362001)(478600001)(66476007)(66556008)(38100700002)(450100002)(66946007)(37006003)(6636002)(6512007)(44832011)(2906002)(316002)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v3L+qW+YfCF5hjTXQn7E6UiJ6wxKv6wSVRGx5BEK6WcA7hxURtYlKf35Sv5P?=
 =?us-ascii?Q?cBGrPZEWcgGO9cd7R0K01sOqVB+2HV5AyC8fKbHoGVXfjvzE0IGSk9jnqlq0?=
 =?us-ascii?Q?Eq0UH02TDpGuWg7FpapiiK6CSMw+9+rI+r+WBo4BSW8V19XEVVOsxjAlN+Ny?=
 =?us-ascii?Q?SFMZYnQETvsoaFDf3cXW8c8WOy93djs1g1M60i235U3qbrjnaT0Md3cXGfWu?=
 =?us-ascii?Q?ERcbEqasOUc8PVGeltJ3VNbLIsIqlqjL+gG45BuM06BNL3/PYagc0OBFQk8/?=
 =?us-ascii?Q?++CuvktGObfjRST0AtvAOoZEQZKU59XShao25pM2aQEZK4iYfPKNk7PNKAuV?=
 =?us-ascii?Q?IhjqBab5CXJ8/BKqilabhggZPtups6S+fu5fSxnUHK+EvK2E3rYthrIufF24?=
 =?us-ascii?Q?R2jY59yN0sXT7v3UB0LhuGnpdKX5AyrldquaAyBdjTWfceS+sy6bC8XMHzQA?=
 =?us-ascii?Q?g1uq1O/z2WyRT4olyMH8PQeTWpE3yruNDXJo0Y7lLQutaikNlvZONjh8uJf9?=
 =?us-ascii?Q?FDo0gRFvwPoNEUsS3R0FW4SzuNnMVlS5Y6m4XeHBD5zlbVUPcbKzhFzierHZ?=
 =?us-ascii?Q?bhqcwovlUtNSWG0CSjgXKd9tVwWbSPP7FxvAsa4rJJxdQLp6YBUu1RUVZNOz?=
 =?us-ascii?Q?dJT58VwWIq3PJWrKdZHJU7XvJo86C7Xos+t/i+g6MpzAGRnnYuRDcyeq3VGO?=
 =?us-ascii?Q?wWfZlDgkRL8trbIvLWrUywkKglRvtUeUUjAAXBtGX9Kqci+BogNp5F2bsujl?=
 =?us-ascii?Q?1LlugMiqEZvUakA9mDVfaTh37EwneXv1EuLXALLN4KTGFPI3jZzm/r7LGCf4?=
 =?us-ascii?Q?fo4B2O7KVSg47HkjpqUhpFTkdkpAHb4XNOsTmmEKAasFm35dK8GBTlxeDicL?=
 =?us-ascii?Q?ED4RDKFr8d5QDkTykIUp5NO2dEf3flHc/odppqZ79y1T7rja4Q854rMQ8Wog?=
 =?us-ascii?Q?QpJFoYKiO1jM6bOZ13e5tWFAM2TpTuJ9FP20U9bBpqbxxPDlw9IYo7YV8idt?=
 =?us-ascii?Q?Zf2H9b7kKgYmPhpNfErsx9Kwtx6c3IWpQcht2fHIC/JS0UWsBk320hALe/NL?=
 =?us-ascii?Q?9qyuXimt+fD3x10cmgykXvRfmsKpmhKqLN7ckY/zvUisC8Gg/DCKJb3d7/5w?=
 =?us-ascii?Q?mkB+XjTGn18ad0E9uy7VtJtH/GGrphO6eaS8cx1Uolew4jvoL8nrMmB5lswg?=
 =?us-ascii?Q?UCQk/Oi3SsAS0E0lyo0Y21g2dYg8ylKHRNcY8lAvE4FRaj0vrujzZwhrh8NG?=
 =?us-ascii?Q?NOAiPGAxiSxuRwurM/1lGOCMe3YGMl1INrFYNQCJehtHd0CwAd9tOWg5LtAE?=
 =?us-ascii?Q?2R7sgrJFRTbdsORVDlnjlOau1saJfUjI7n6T1FTcQLSIxx0gcBrb2K5e1oQq?=
 =?us-ascii?Q?+ful38uu4lQLZJHhysMkWTKlk1OdXGPzrJdLhZ/ubgph4ID0SjA3jL1tD6Oi?=
 =?us-ascii?Q?52SAKC25faTgnqS77ZLbdEPM82Avkgx/e/p9zbAQFFuYrpPEhwBLxfg0+v57?=
 =?us-ascii?Q?dimfE4Jppe39rmIEUw2JOgotfmdJcb5wtKyglcrLRIiebbOrBV0SnVXOYYTq?=
 =?us-ascii?Q?ZrRoYDiLaRHgOL6xgbZRiLBcn2YhuiWjejEhmUsEtTHVDjLCB1zZTDbrTPdf?=
 =?us-ascii?Q?LA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b878cc5-2f0c-4fe2-9839-08dbfd8dec40
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2023 16:50:20.3350 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9YzpOGbjOyD3aq9Rwr+J1wC0au569jtHkVn2Zp2OmfBimdZ1/xpkrG+ECS8UgAbTzW10xa/1u6WD4K1hqvJDCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6137
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 15, 2023 at 08:22:17AM -0800, Lucas De Marchi wrote:
> From: Mark Rutland <mark.rutland@arm.com>
> 
> When lockdep is enabled, the for_each_sibling_event(sibling, event)
> macro checks that event->ctx->mutex is held. When creating a new group
> leader event, we call perf_event_validate_size() on a partially
> initialized event where event->ctx is NULL, and so when
> for_each_sibling_event() attempts to check event->ctx->mutex, we get a
> splat, as reported by Lucas De Marchi:
> 
>   WARNING: CPU: 8 PID: 1471 at kernel/events/core.c:1950 __do_sys_perf_event_open+0xf37/0x1080
> 
> This only happens for a new event which is its own group_leader, and in
> this case there cannot be any sibling events. Thus it's safe to skip the
> check for siblings, which avoids having to make invasive and ugly
> changes to for_each_sibling_event().
> 
> Avoid the splat by bailing out early when the new event is its own
> group_leader.
> 
> Fixes: 382c27f4ed28f803 ("perf: Fix perf_event_validate_size()")
> Closes: https://lore.kernel.org/lkml/20231214000620.3081018-1-lucas.demarchi@intel.com/
> Closes: https://lore.kernel.org/lkml/ZXpm6gQ%2Fd59jGsuW@xpf.sh.intel.com/
> Reported-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Reported-by: Pengfei Xu <pengfei.xu@intel.com>
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Link: https://lkml.kernel.org/r/20231215112450.3972309-1-mark.rutland@arm.com
> [ cherry pick from tip/urgent heading to 6.7-rc6 ]
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  kernel/events/core.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index acfc5a569818..a64165af45c1 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -1947,6 +1947,16 @@ static bool perf_event_validate_size(struct perf_event *event)
>  				   group_leader->nr_siblings + 1) > 16*1024)
>  		return false;
>  
> +	/*
> +	 * When creating a new group leader, group_leader->ctx is initialized
> +	 * after the size has been validated, but we cannot safely use
> +	 * for_each_sibling_event() until group_leader->ctx is set. A new group
> +	 * leader cannot have any siblings yet, so we can safely skip checking
> +	 * the non-existent siblings.
> +	 */
> +	if (event == group_leader)
> +		return true;
> +
>  	for_each_sibling_event(sibling, group_leader) {
>  		if (__perf_event_read_size(sibling->attr.read_format,
>  					   group_leader->nr_siblings + 1) > 16*1024)
> -- 
> 2.40.1
> 
