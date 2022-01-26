Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E97A49D235
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 20:03:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE2910E697;
	Wed, 26 Jan 2022 19:03:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9388E10E68A;
 Wed, 26 Jan 2022 19:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643223813; x=1674759813;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lBlAdKjXoH2UAuRGkHSddZS0t2Pm7180f4EPGKvNfDQ=;
 b=Ywi/As2grCgUc7ZDpLnQAgyQENQ6xE+4fd/b8foS9RRVVvJIesk+FofQ
 GmaOuCfmjChG0d23Qs6Tl1Ngi43WqzR5XDdyPhu1iBjU9DlRbBFXuPY0G
 0NsW3kjtLLwVXi8VTy0KzXqfD72GIV24+vPF6fJ5NK+XOrVFbIaqy7vwO
 Q/Pz4FNZc/cY9WmyRUmEErXm2RGbx0hw//eRuyISK3+o7l436XsSHOEgV
 lDvoi89Uo+6Mt2BMXNBHdqYK49bV6Go6Zor9ky0VrsvTysvwvchgU0NgL
 ySwrjQTsrzpX7uhPk/fRJqZxcda7tYrAteY6q/RXyzYo4teXuBo3+fQuy Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="332981320"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="332981320"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 11:03:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="563501481"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 26 Jan 2022 11:03:32 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 26 Jan 2022 11:03:31 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 26 Jan 2022 11:03:31 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 26 Jan 2022 11:03:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KYT6N79Nyeu/6HRsO3QLNkHQl0qnTvb5NV6Vnfe1ZZxG26jJqy4H68WfVytVxkvEHlnL60DVbbZbeaacVfK03+YATvSfDIZOZfjKn2obPA6QKnUfsG87/mH7QTozAQA7cmNCdsBmfbCcoJYrw92hitz2FZKOctl4FQzVi9iNAl8nXyvbZ6BxX7lX7KVgFzOYvnpyz2tl+QKcSvAjOk1oyy2cKyIrAWCzzVhgQeEZUmHdgopY8U75f+gA3sRkN0yfjqSwguap0o+XzeTcV4MA6RQ/UdKzBjrAjP3f8SN+UgeFMPnMdc3KfGLzPL/BLjvIrjT6Uunh3Be7G1HOkvR9Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RSj5o+jK30ek57y6+sGx5P2PT7gk9+XezRkIVLjS2o8=;
 b=V4NvtRIAs3CpNFmow3JtVS3V3AQHxOv61E/qkvqq2i21RG5snxBTp5BPT9VyZEuNWhjLQrcBFvbAiTvo3ITn2V0AchJfBrfZjpB8z4PK2TqPZh17fM0pkSDoHNxpPVMoN/AC/pwnUy73k+nLSKmelL7sIjIS9Y/1JYeU/74tOtUHTp7XvAFwh3c9JuXfeCDGmeySFvWZYkKGO5H5lhcqeueErYQHnssvBEDnx2IemWTFoymlOZiF93hwM7rDl0RN2sIVtfxT6ssfBDgdo+n1TKiViYonaHJzbHau1zpRveTm5ZszbfQwQNhP1lLplXq8Rb2AfyHO2XO3z0uA4SYE7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BL0PR11MB3233.namprd11.prod.outlook.com (2603:10b6:208:68::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 19:03:27 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::b006:30e2:f354:3ea5]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::b006:30e2:f354:3ea5%5]) with mapi id 15.20.4930.015; Wed, 26 Jan 2022
 19:03:27 +0000
Message-ID: <0dde05fe-146c-c145-360f-d7333966f61c@intel.com>
Date: Wed, 26 Jan 2022 11:03:24 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 3/4] drm/i915/execlists: Fix execlists request
 cancellation corner case
Content-Language: en-GB
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20220124150157.15758-1-matthew.brost@intel.com>
 <20220124150157.15758-4-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20220124150157.15758-4-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0336.namprd04.prod.outlook.com
 (2603:10b6:303:8a::11) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d6c7919-2300-44f7-4952-08d9e0fe88c1
X-MS-TrafficTypeDiagnostic: BL0PR11MB3233:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BL0PR11MB3233D9C9B2BA049FF8DB6C49BD209@BL0PR11MB3233.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bs33TMArlTXNxyYikfsTPGhcIdQyqanQlsRiIxSCgU19Ppw5lYRsJ3K3HyYmeKVPLhOVeOkedsI83mQtWz2Zs62y/7QkJw8ekDvevOC/rI7iYwfDCFrH5tdO7J7Fi2Gwk4DlALHazge9b+FdyxFg7jNsxYDS09nJMmfs73y4anZmrL2lApORkcdiyIg9LzraCUwgvGBeiwmIOM+Qxz1dyaZmWC2EZmwePfhQJMR0AAUmyDlSVr9ovvvlpNCe+wwEaeSi/ffFAoMksj8JkILjzIzodo3te2pfHghd/pqx06AL1sqQag4rUGSo1ZNjaq+r2suk7TPLuheefHXg/WIZrEx5B6CV/d5aPBc5MMl+9yhb8AnTwTlpr791uOQXNnN36mkhqinfGmPkOMD2BygCQPctTOpMiyhp2ek5hexuH9NT580646mswF5cjnKwqt6bMjDsApvHEBk+6C/qvW9pgqK72jbEuJH9QAJ8bd+RW4eHPnO2+iBPnJDg0myr97L5TPflnC3W4Q/gOIO4KKpOLi91J7hd73P/EJdIkkqNybvpFQ/rRQriQ63ZvjSIy/tkuBfxAc0DceGjer5PKjLkhaxgzNPCnwQguI3ECgK5Y2DiGdw48/ynB9y7FRPivJaTkI5tu4nNFXz3zBBXQyspaPrxLdkBRzrzDqbeyf0vxFyKQQxunLwq8WWECtju1R7J3gyS1cFyknc4YlO52pd6axopC1IHZbHdYSgBCfjTkfi7QHgS82DKgZQ5dHh9Ym0z
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6486002)(31686004)(36756003)(186003)(2616005)(26005)(38100700002)(2906002)(83380400001)(508600001)(82960400001)(107886003)(86362001)(66946007)(6506007)(6512007)(6666004)(316002)(53546011)(8936002)(31696002)(8676002)(66476007)(66556008)(5660300002)(4326008)(450100002)(43740500002)(45980500001)(20210929001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ym1Yd3hSTk1mNU0rL2c1K0NGbURNQUtIdGNuM0dRSHhuZXJ6V2dtN1ZQOXlu?=
 =?utf-8?B?TER1d3FWODdybk9mRTVQM2FqVW9hRW4zS3NaTTF3aGF6dUFxcWE2RUt2RHRG?=
 =?utf-8?B?Znc5eUowSTlpOXorRXh2ODJmK1lVNGdxT2RDNjU5UmtEVlNRYk5aWm1YK1Nt?=
 =?utf-8?B?TUtOZklrRmltU01hcE8rRGxKL01hdU1LcWl4ejd5Zi9wMXBka2RNOE5SVlF1?=
 =?utf-8?B?dDIwc2dNUWpFckVOME5Fdm94YU9GSHRQTGxaNjBCbVBucEw3NjNxTmlCMlhK?=
 =?utf-8?B?OVNkR1J5NXk2UEM0aHJnQzZrakwyVUpwZ2tHZjZjSTZsQkMxTjZackhrM2Fi?=
 =?utf-8?B?aE5OZkd1SkUxTmU2SkJYQ3B2bHhlRS9aTGlDWDRJSERLZ2FyWkZIR0VnZnZ2?=
 =?utf-8?B?M0tpRDlLNzUwMHA5TG1IaVZ6TithdzRlK3NWVVMwUTVtVytmaUxzeXd3VFZk?=
 =?utf-8?B?SWxYZlhEa2dwdVVaYzhIeDNuYk40dFlEMWZvNDJpNVpXa0F0amZ2TUI5eVZx?=
 =?utf-8?B?SExCZmtEZGxNUnpETS8xczJ1Q3dzaTh0REVFVk94bHl4Um5tL1EwZ2duU29y?=
 =?utf-8?B?aEFpbnZOUlc2dHdpOU0yaTVjdkdPWmNhc1U0WTJBd21iY3prVW8vVjhkcUZD?=
 =?utf-8?B?Ykl4dVRmbVlUdytGbXhyaEg2ZFVraU1SdVIrb2lOanArK3NDU3U5U3FNOW9S?=
 =?utf-8?B?LzhoYm5GOWFLdUJMSGMxT0xtUDNXLytYWXVTb01zTG5OVC93aXNveFZiS3RT?=
 =?utf-8?B?VjlnaW9XUWUvUDAzaExkdVV6VGtRSkFOMk1TaFFabjFETndLb3lldWpkR0J1?=
 =?utf-8?B?ZUlpV3ZSMlQvaTc5UjJtVmJyamt4c01HZlJ4R2dQMXBSU1RYeUlWNkFYbDRH?=
 =?utf-8?B?enBsQnoyQ2Q3K2dxTWZXSHhua2I4anVockhJVmdUOWM1Rms4OEd3dUluVVVR?=
 =?utf-8?B?MGh5WTl3eWVEMERKUDhZL2JXQnJkcXNnWEMycHRHQTR4UG1adnNSNHNPQ1Fu?=
 =?utf-8?B?cXlCc3NJNmxOUTVjZWtQbld6Q21wUGdNaTc0QlkzaUFHbjVKNG9YeWtBQ09T?=
 =?utf-8?B?NzJuUkFOOUw4d3RDc1djTWdUOW9JMVkyUm9lTy9uY1A1OWp0ZHZjdXB6eEZ0?=
 =?utf-8?B?TnFFMjFpRFFNNmNOWnAwam5TdExwUWtXT3UvMS9lREJBa2tBbVdybU5uYWdW?=
 =?utf-8?B?elBhUzNnak1aS0pybEdXQUZYdG5VbWdLVGc4QitPaG03K0FrandFUW9icFpk?=
 =?utf-8?B?ekhIV1FuUDRGd2twVmRzRi9IMElndmhVY05sVS9FWnk5akxxL1FrdzRMY2ll?=
 =?utf-8?B?YjBHWUpXR0JnQzhmN052SnBZNE01VjBYdUV2K3NEdDFOMXVzRHdyTjdjdHFV?=
 =?utf-8?B?eDU0T25vYjhmRUt5cCtscXdTY0pVY2xIaVN5SUp0R1p3SUhvUWY0UGcvZ2JQ?=
 =?utf-8?B?ZUY4K2JPMDZvWHUwM2JwRWdqZ0FuYjZXaVEvOXYwaDhScDR0SjZwUEwrRHlL?=
 =?utf-8?B?NE5kek01blR1WTB5MytsZUpjOGNYTnRvLyt5UTRSNjFnRWtoRWFjbm1RekdE?=
 =?utf-8?B?MDJsOEFSeW5KeWx5YUhkcHhtdlZYcnBPUUdOU0x6ZmxZMVlDVVVCNWNDemZx?=
 =?utf-8?B?UUZ0MTlCSGtCcUZEZ0k3ZXF1bnZoWHJqRUE1TlJoQWRiZ1lHYWRaYkJOR3Mv?=
 =?utf-8?B?ZCtpRm84QnZURThpVFV4MzFtV3lXZDlVVTExcHhqTHBLOTErMFNrTFVDNjRQ?=
 =?utf-8?B?SElQRGN0ZCtjNFJYc2pramdYeVhCQm02ZERzeTZTZDY3bVY0a3JUeW1BN1VJ?=
 =?utf-8?B?OGVsdzE1RFpQcVhjZjlGK3Btb0ozNEpWd21PalovQ0x6Ym5rWDI5R3ZqeURO?=
 =?utf-8?B?SjEwcG8venJ3NDBoY0c3eTQwMnVYLzhXWFhlQVdJNk16NnRvVFZxQzBWczI0?=
 =?utf-8?B?dHp5VkZEaFJIdm5tN1dpdGVkM2dnMzZQckFna0dleld2Mmp1MGJPVm56VURs?=
 =?utf-8?B?a0ozM1cxM05seHhBdHczVjUwNUxrOG1iZ1FkOHJiR0pUV01tT3VwT1VseGRH?=
 =?utf-8?B?alg0dHUvdE50ZnlDcEZ2Vy9MdVk2QVRWWU81R1ZoSFBBWmIwK0NiblAzckJ0?=
 =?utf-8?B?dUVTZlhxZ1YyOWZaTzcyQnZQV1IxN0NJWkgzUG43cS9xSGxGWXN6elRtL3FK?=
 =?utf-8?B?U0crSm1jdGpuNnVJaGZsdGYrNUx3MndPczY5L2lyRmlod0lDU1c1SXlscDN0?=
 =?utf-8?Q?arIWHL1l5WyFx/V5lZ7X8/WGrgZi/SxDHAoj1A0ZPE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d6c7919-2300-44f7-4952-08d9e0fe88c1
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 19:03:27.2038 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QBuztTBc0B30JJP5rCXJAu2ycdSQSZ55vtjBQbBSTOCiZVxNF3+nJ/NdQ1NBeAT4+xiEzZYC7qWPOKspX62+b4IrpJkXPbkhLvUrzel7K8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3233
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
Cc: daniele.ceraolospurio@intel.com, tvrtko.ursulin@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/24/2022 07:01, Matthew Brost wrote:
> More than 1 request can be submitted to a single ELSP at a time if
> multiple requests are ready run to on the same context. When a request
> is canceled it is marked bad, an idle pulse is triggered to the engine
> (high priority kernel request), the execlists scheduler sees that
> running request is bad and sets preemption timeout to minimum value (1
> ms). This fails to work if multiple requests are combined on the ELSP as
> only the most recent request is stored in the execlists schedule (the
> request stored in the ELSP isn't marked bad, thus preemption timeout
> isn't set to the minimum value). If the preempt timeout is configured to
> zero, the engine is permanently hung. This is shown by an upcoming
> selftest.
>
> To work around this, mark the idle pulse with a flag to force a preempt
> with the minimum value.
>
> Fixes: 38b237eab2bc7 ("drm/i915: Individual request cancellation")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   .../gpu/drm/i915/gt/intel_engine_heartbeat.c  | 23 +++++++++++++++----
>   .../gpu/drm/i915/gt/intel_engine_heartbeat.h  |  1 +
>   .../drm/i915/gt/intel_execlists_submission.c  | 18 ++++++++++-----
>   drivers/gpu/drm/i915/i915_request.h           |  6 +++++
>   4 files changed, 38 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
> index a3698f611f457..efd1c719b4072 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
> @@ -243,7 +243,8 @@ void intel_engine_init_heartbeat(struct intel_engine_cs *engine)
>   	INIT_DELAYED_WORK(&engine->heartbeat.work, heartbeat);
>   }
>   
> -static int __intel_engine_pulse(struct intel_engine_cs *engine)
> +static int __intel_engine_pulse(struct intel_engine_cs *engine,
> +				bool force_preempt)
>   {
>   	struct i915_sched_attr attr = { .priority = I915_PRIORITY_BARRIER };
>   	struct intel_context *ce = engine->kernel_context;
> @@ -258,6 +259,8 @@ static int __intel_engine_pulse(struct intel_engine_cs *engine)
>   		return PTR_ERR(rq);
>   
>   	__set_bit(I915_FENCE_FLAG_SENTINEL, &rq->fence.flags);
> +	if (force_preempt)
> +		__set_bit(I915_FENCE_FLAG_FORCE_PREEMPT, &rq->fence.flags);
>   
>   	heartbeat_commit(rq, &attr);
>   	GEM_BUG_ON(rq->sched.attr.priority < I915_PRIORITY_BARRIER);
> @@ -299,7 +302,7 @@ int intel_engine_set_heartbeat(struct intel_engine_cs *engine,
>   
>   		/* recheck current execution */
>   		if (intel_engine_has_preemption(engine)) {
> -			err = __intel_engine_pulse(engine);
> +			err = __intel_engine_pulse(engine, false);
>   			if (err)
>   				set_heartbeat(engine, saved);
>   		}
> @@ -312,7 +315,8 @@ int intel_engine_set_heartbeat(struct intel_engine_cs *engine,
>   	return err;
>   }
>   
> -int intel_engine_pulse(struct intel_engine_cs *engine)
> +static int _intel_engine_pulse(struct intel_engine_cs *engine,
> +			       bool force_preempt)
>   {
>   	struct intel_context *ce = engine->kernel_context;
>   	int err;
> @@ -325,7 +329,7 @@ int intel_engine_pulse(struct intel_engine_cs *engine)
>   
>   	err = -EINTR;
>   	if (!mutex_lock_interruptible(&ce->timeline->mutex)) {
> -		err = __intel_engine_pulse(engine);
> +		err = __intel_engine_pulse(engine, force_preempt);
>   		mutex_unlock(&ce->timeline->mutex);
>   	}
>   
> @@ -334,6 +338,17 @@ int intel_engine_pulse(struct intel_engine_cs *engine)
>   	return err;
>   }
>   
> +int intel_engine_pulse(struct intel_engine_cs *engine)
> +{
> +	return _intel_engine_pulse(engine, false);
> +}
> +
> +
> +int intel_engine_pulse_force_preempt(struct intel_engine_cs *engine)
> +{
> +	return _intel_engine_pulse(engine, true);
> +}
> +
>   int intel_engine_flush_barriers(struct intel_engine_cs *engine)
>   {
>   	struct i915_sched_attr attr = { .priority = I915_PRIORITY_MIN };
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.h b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.h
> index 5da6d809a87a2..d9c8386754cb3 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.h
> @@ -21,6 +21,7 @@ void intel_gt_park_heartbeats(struct intel_gt *gt);
>   void intel_gt_unpark_heartbeats(struct intel_gt *gt);
>   
>   int intel_engine_pulse(struct intel_engine_cs *engine);
> +int intel_engine_pulse_force_preempt(struct intel_engine_cs *engine);
>   int intel_engine_flush_barriers(struct intel_engine_cs *engine);
>   
>   #endif /* INTEL_ENGINE_HEARTBEAT_H */
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index 960a9aaf4f3a3..f0c2024058731 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -1222,26 +1222,29 @@ static void record_preemption(struct intel_engine_execlists *execlists)
>   }
>   
>   static unsigned long active_preempt_timeout(struct intel_engine_cs *engine,
> -					    const struct i915_request *rq)
> +					    const struct i915_request *rq,
> +					    bool force_preempt)
>   {
>   	if (!rq)
>   		return 0;
>   
>   	/* Force a fast reset for terminated contexts (ignoring sysfs!) */
> -	if (unlikely(intel_context_is_banned(rq->context) || bad_request(rq)))
> +	if (unlikely(intel_context_is_banned(rq->context) || bad_request(rq) ||
> +		     force_preempt))
>   		return 1;
>   
>   	return READ_ONCE(engine->props.preempt_timeout_ms);
>   }
>   
>   static void set_preempt_timeout(struct intel_engine_cs *engine,
> -				const struct i915_request *rq)
> +				const struct i915_request *rq,
> +				bool force_preempt)
>   {
>   	if (!intel_engine_has_preempt_reset(engine))
>   		return;
>   
>   	set_timer_ms(&engine->execlists.preempt,
> -		     active_preempt_timeout(engine, rq));
> +		     active_preempt_timeout(engine, rq, force_preempt));
>   }
>   
>   static bool completed(const struct i915_request *rq)
> @@ -1584,12 +1587,15 @@ static void execlists_dequeue(struct intel_engine_cs *engine)
>   	    memcmp(active,
>   		   execlists->pending,
>   		   (port - execlists->pending) * sizeof(*port))) {
> +		bool force_preempt = test_bit(I915_FENCE_FLAG_FORCE_PREEMPT,
> +					      &last->fence.flags);
> +
>   		*port = NULL;
>   		while (port-- != execlists->pending)
>   			execlists_schedule_in(*port, port - execlists->pending);
>   
>   		WRITE_ONCE(execlists->yield, -1);
> -		set_preempt_timeout(engine, *active);
> +		set_preempt_timeout(engine, *active, force_preempt);
>   		execlists_submit_ports(engine);
>   	} else {
>   		ring_set_paused(engine, 0);
> @@ -2594,7 +2600,7 @@ static void execlists_context_cancel_request(struct intel_context *ce,
>   
>   	i915_request_active_engine(rq, &engine);
>   
> -	if (engine && intel_engine_pulse(engine))
> +	if (engine && intel_engine_pulse_force_preempt(engine))
>   		intel_gt_handle_error(engine->gt, engine->mask, 0,
>   				      "request cancellation by %s",
>   				      current->comm);
> diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
> index 28b1f9db54875..7e6312233d4c7 100644
> --- a/drivers/gpu/drm/i915/i915_request.h
> +++ b/drivers/gpu/drm/i915/i915_request.h
> @@ -170,6 +170,12 @@ enum {
>   	 * fence (dma_fence_array) and i915 generated for parallel submission.
>   	 */
>   	I915_FENCE_FLAG_COMPOSITE,
> +
> +	/*
> +	 * I915_FENCE_FLAG_FORCE_PREEMPT - Force preempt immediately regardless
> +	 * of preempt timeout configuration
> +	 */
> +	I915_FENCE_FLAG_FORCE_PREEMPT,
This would be execlist only? I'm a bit concerned about adding a global 
flag that cannot be implemented on current and future hardware.

John.

>   };
>   
>   /**

