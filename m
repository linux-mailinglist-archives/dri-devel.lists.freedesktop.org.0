Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D565A5218
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 18:47:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC04410E35E;
	Mon, 29 Aug 2022 16:47:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A1CF10E24B;
 Mon, 29 Aug 2022 16:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661791635; x=1693327635;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=g2lRIEgkVJ3QYjoSsc92NahG9hEYWO3D8zEWogbVLy0=;
 b=EX/tL28qEKWBy11cIrHlTrYn0cji7tugHxntkhTo3meGvSpDi5rNUvWf
 8SU8MsIih0L19AekfpAeNUV9oZg9E1l6fuKXGYsWBR3XU1OuKw+LNFiFx
 4DBhL9NHsYQEMPn5w8vXGKV0Nrnf4SD79P6h/0aHSmUUlrJuPGX04vSjt
 hTOFocJcYYdnMwV7g5oZ5lE0UNdJa11SC1CyCc2ZVmcFxKUd7g2yq1fKj
 BYqZW6nDNwooRUb1aHrRD3h8jAoApR+lQ1bsc/F2j6vDof84BQdT/9LaN
 rT5MKCPQosFmG5Qw+/lvhk6nBshiIHL6SeEqFO7HBqFgeewENjM5hxQjR A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10454"; a="321054980"
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; d="scan'208";a="321054980"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2022 09:14:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; d="scan'208";a="607494176"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 29 Aug 2022 09:14:46 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 29 Aug 2022 09:14:45 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 29 Aug 2022 09:14:45 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 29 Aug 2022 09:14:45 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 29 Aug 2022 09:14:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dB3tftK/KwHrSGHbJJzisn6Tttv+BeZwe+eorHM1dM6eYfJYsCbjcPIkmjv13X6EML5WMFTLLAKaPAQc7l1Dy6AiNi6QE9Ma0/qTcUnegVAB8r3t6vu9KHjQLHiOs8A1+SQVTtg0vc59vABNwuqN7qCUSYPeL1j3ota0NuoSL3SSGw2xuf673fIDQ0CP8bI0PfAIkZVk3LSkq69K7n0UpNjBzIPtSYSrhJZR07Xl4zRYumBBCwi+RS2zvEmdQDBZYclCuRoHel1qfEde8MgSXLNp8KwShAfXpTXlP6dvUHoP5aj/cEQsHnWwFGbx45Y3SJlwMRokok2wQcluVuORjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7g894VUyKhP8amRQnD6CHV5DJ12mdN7NMvn8T7GM2wE=;
 b=fadZ/71Kc/IG00AJ+BervAwKGVw0lUOPjkuELvnL+KAlmiFWLtJQog1gU8NJCVbeTLxE05cIwtC3953rU88+QUHyPOZhAbjc/DO37oKaUnS3GUtCXxmTHF+Kp2VnaCMDUFzHHig10TBje7SqYrUBHivmiYExUXexvwHVW2c3Go+3LudKHdorLlLhncEDAR0Kc8/KgktqmOdemRV3QIzzfjvtoApOzLYJhGpSoZuYepkLK1GzId/6GQXEP/dM4K6tKlm9es0eMdb0myrDVzcr2/VvWcS6uO22yrWLMupfpfHU3sGj9opxzr1HtwRNO0YAfKpHPMAYNnOLLUuc8qgG1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB4239.namprd11.prod.outlook.com (2603:10b6:208:192::20)
 by MW3PR11MB4570.namprd11.prod.outlook.com (2603:10b6:303:5f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 16:14:38 +0000
Received: from MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::6470:ee62:f519:5a9b]) by MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::6470:ee62:f519:5a9b%2]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 16:14:38 +0000
Date: Mon, 29 Aug 2022 09:14:34 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH] Revert "drm/i915/dg2: Add preemption changes
 for Wa_14015141709"
Message-ID: <Ywzl6q2dBMVLqiNf@msatwood-mobl>
References: <20220826210233.406482-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20220826210233.406482-1-matthew.d.roper@intel.com>
X-ClientProxiedBy: BY3PR04CA0019.namprd04.prod.outlook.com
 (2603:10b6:a03:217::24) To MN2PR11MB4239.namprd11.prod.outlook.com
 (2603:10b6:208:192::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e68fdea-769b-4a90-05af-08da89d99204
X-MS-TrafficTypeDiagnostic: MW3PR11MB4570:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BEH/CxdukPh5gAd+QddtHXj5i6h3ETAmrNkVM5MtMQ05brkwWHDsqyBYKhBunf/XKEo1C+/r1hDNeXV01cyp02S69rft4E4NEGm3+wlh7Lto9r0RH4iJRp4QCf0AbyGU5IIdrhqKiZFXgLFslP7uLomBB5RzmI9MAsZIZZwoFZX9selXDZtqQ6SbIs3A2r4OVcnXwsr/AzSq5iiCgWzYG74Ax50UFmth9MLMd9NJkA4ljApiI8P5S69c2a8u8ZzEdgNr0DrPknQfUztP3m8LMgytf+R9Gd3nKNGCcXSCe8IIvBEyZ9wOTbauBeZapnB++8kQmIh433bHy7naNun7EgK89g3p8hNYQRTLAopZ4RAAeT3DoyauiPIqZPofrOzP410jFm4DAMJnOxoHN1TixQzr/iAIpV3tzRtr3n78GPvBe69Qoh95HQGvYWZkxxa+W6FqDI5ayk8JRLNZtC47S7qQ8/KyokI4fYqi7V6v80aXqUOMyVRiT0mH6RRSS371Bqjewhw6iopGnZXc9MhTT6XLcTMfZ2ijzFOBYEARFiaDANfIYzBo2qcjLx5wXWPsbUQQcXwe/+oJ/kBtg0LJXWnbbYIju93bA7vjI4iDl9zSuH5H+x21syjuOZnL/niQAnYl8r5lxdj+x9r1CVPzl7hkH46gAJUxuI0QWPx5/F84Fgk6AiQbSAXxs4e0RF4WgP221slzF2JIkte6ou13sQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4239.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(39860400002)(376002)(346002)(396003)(366004)(136003)(82960400001)(66946007)(66556008)(8676002)(38100700002)(86362001)(450100002)(83380400001)(186003)(9686003)(6512007)(6506007)(478600001)(41300700001)(6666004)(6486002)(316002)(33716001)(66476007)(2906002)(5660300002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnowR3FLRGduaGdpQitVRkY1allieG5uYVN2aG4zcXpad2w1N29aUFdKSlBa?=
 =?utf-8?B?NnJXd09UZkN3NEdEQ1RmbWhsTkRzZlRXdE90N09DNjU2UVlBYmRnMmxFQlBp?=
 =?utf-8?B?aFVXLzMza3JZRUFNNWFFSVRuazgzQWd3Q0lYZ010MXdTUVZCRFpGQjVQOFdF?=
 =?utf-8?B?ckNld3pqME5QUTNXM015YkdseFpVVjhZa3pwdG1MblpERWVEcW1LaHBnVC9w?=
 =?utf-8?B?KytQbENqT3E5YjR4QTdnZHZPeHJUSDNISktIWkhnYTJwU0lFNGdsMndCRXlN?=
 =?utf-8?B?VERqeUMrbTZTbldzeElSamtEQ1Z3RFd6Y25TZHFQcmo2NzdINE9nVUVPWkcx?=
 =?utf-8?B?RlZxczZrR2JVMk5MSjllQ2x0c2V4VzdjeEtZQTN1ZHI1UWZ6SE1qU2pZdDQ2?=
 =?utf-8?B?NEZseWZkcFdGZ1o3d2ROWHRGWHNwUGtCZDJ1ZHlPUzBCd0VmZlNqNUdKVnR5?=
 =?utf-8?B?Qks2alhCOHRPUEQzdTV3VHVZbGFhZkZkYjM1Ym81bm5KME1WTzNoWlQvbVFj?=
 =?utf-8?B?d2w3WnhneTVPUURZb0g3S2R4SVhJc28vdkIwcHIrMm0rU2ZxVVZKYjFGUDdo?=
 =?utf-8?B?Vyt0ZjF3eFd3Sy9jS29hek1DTFpxT0UyVHhINXkvcDlDRnBkNnlaVzd4allB?=
 =?utf-8?B?Nmk5aitUUlR5ZnhoZWVHN1d4VmxrRGlYYTNyVzZuYVgzODNLTUkxcFNlbkJT?=
 =?utf-8?B?SXlOZHFMK2o3cVNTUUU4NUU2SnJ4b3dZWmx1d2dHN1lxT3FON3NXWUlSOEpj?=
 =?utf-8?B?U2FuWHE1L1RtTUR4aGVtVGxPMWJXUjRkVW9VemUyQVZBbmFvM1lHM1NRbXFy?=
 =?utf-8?B?QnN0UGw4YVVHSXhPMjdGSzZiZEFiUnIva0EyU1pYajhnaUdxN09MdmNZTkd2?=
 =?utf-8?B?TjArbk9VbU1oRjgzU0hBNWV3QWJOUG85bEhLS2ZaMEZBeGZQYW9SL1dHNlZF?=
 =?utf-8?B?ZE5zT1RLNk02S0VtdzhmU2M1YlVBc1hJN2x5eGRmbGUySzN3eE1UQ2UvUmpS?=
 =?utf-8?B?L2tYcm5hYllVd1RidWdkVkxhOExKOVBvcHVocmJJL2dPb0YwWGZkYkRUekZG?=
 =?utf-8?B?Yk44RmdOWVZCTTQvRndsdDFHWmFKS2JpNFB3enJkK3V4Slhsd015TEVFejc2?=
 =?utf-8?B?Vkd6Nnh2cUpmUDVKY2krQS9jOU1Nd24zY3FUZUUrakZMcWQ4Sm5TRnBTNWEv?=
 =?utf-8?B?cVM3VzFnUWRCREpDN3ZyK1JxcG9VcDJIRGlrWDFwaFlZTVdyaFVKT1NmUHBR?=
 =?utf-8?B?VHRSNE9SaElvZFhFeW9ldzhRVDdxeEVMZklDZUVyNTAwSk5CUDdhS0NnV2wz?=
 =?utf-8?B?TVZBM3BMdWNpVW1JMTA1QWNVd3VLazEvOEZsYk13VnNpbHlFaldCQkNtcjZB?=
 =?utf-8?B?N00zcVNyOXhwc0tUazUxZlM5SVlreEoxL25iSllRaENqUFRYWlhySUdZU0FQ?=
 =?utf-8?B?aURyK2sxRHpOc0pRTlNCUWxjaSt6TzdRaG1DSUFCcTVpOE5nRklOaXpJaGdk?=
 =?utf-8?B?QmFTdU84M0xtZWN3Z0lCVjhKNzhJT1JuZmJuTVhoazdGbzhUUlJ5d29LY3ph?=
 =?utf-8?B?NWxWQkk4RUJZZEpSWkRKcmdlbkYxK1lYRUh4ekpHTUI3MUdBbERvMjBna1h4?=
 =?utf-8?B?NU0wMmNJT09ScjZTMzZRdXNPRnBQWlN2aUJoVmV2OHlSNm1KeUJyUzd3WUpI?=
 =?utf-8?B?cHJnNWxsNHRWVDM3bVBLbEtZZWxTSWxhMk5WWnVnaFREMVdRL3oyNjlmc0VD?=
 =?utf-8?B?d2NqcW0wRlh5LysrenVTMFN5UEYzaGdGSVk4L3Q5MnV1eTVtV29CM3VobGRs?=
 =?utf-8?B?c01uZzNOckV1R3BicnV2Q2JGeW9JQkhJL1o0TkxKMFA2ZmVTN3Z1TTZUZmU5?=
 =?utf-8?B?eVRTUS9SNGtmZGdMbzVnRVhyQ2JJNEd2WUtRcm9hNHE2emRRM2p3SGRsZVZx?=
 =?utf-8?B?ZEVQSUZySXV4aEhkWmJ6UGN3UjJ0WFFTUG5KT1V6Q3JrNXp5NHNwdmFDVHkv?=
 =?utf-8?B?MWZmQ3pEVUZoL0FMdzMwdTZHSEJKd0V5cURab1pZNGpvK2hTVlA3ZElPMGVL?=
 =?utf-8?B?TTlvK1drK0tRczhsRDVYbW5VVnk5WWkvMHhiUWU4ek5GNHJnV2JhT01iSi9j?=
 =?utf-8?B?L21vcU9OQlVzbEUwckRIWnhKOVFLaFJqTlJQcmEvYkFJcElwTWdVWFN3Um5P?=
 =?utf-8?Q?W+TU1/JkNfDJSuSy64bm5No=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e68fdea-769b-4a90-05af-08da89d99204
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4239.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 16:14:38.5741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U6DiRA+G4Ub5nVLk+BGfYXUlC4JrvkSvbKJDgvin09Kb77YaGSA7o9qktsLEWMszCkcWv7Llc6Ey8Z+8dWuLHRjDS9duy9ybg6UpDlE/rN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4570
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 26, 2022 at 02:02:33PM -0700, Matt Roper wrote:
> This reverts commit ca6920811aa5428270dd78af0a7a36b10119065a.
> 
> The intent of Wa_14015141709 was to inform us that userspace can no
> longer control object-level preemption as it has on past platforms
> (i.e., by twiddling register bit CS_CHICKEN1[0]).  The description of
> the workaround in the spec wasn't terribly well-written, and when we
> requested clarification from the hardware teams we were told that on the
> kernel side we should also probably stop setting
> FF_SLICE_CS_CHICKEN1[14], which is the register bit that directs the
> hardware to honor the settings in per-context register CS_CHICKEN1.  It
> turns out that this guidance about FF_SLICE_CS_CHICKEN1[14] was a
> mistake; even though CS_CHICKEN1[0] is non-operational and useless to
> userspace, there are other bits in the register that do still work and
> might need to be adjusted by userspace in the future (e.g., to implement
> other workarounds that show up).  If we don't set
> FF_SLICE_CS_CHICKEN1[14] in i915, then those future workarounds would
> not take effect.
> 
> This miscommunication came to light because another workaround
> (Wa_16013994831) has now shown up that requires userspace to adjust the
> value of CS_CHICKEN[10] in certain circumstances.  To ensure userspace's
> updates to this chicken bit are handled properly by the hardware, we
> need to make sure that FF_SLICE_CS_CHICKEN1[14] is once again set by the
> kernel.
> 
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 2 +-
>  drivers/gpu/drm/i915/i915_drv.h             | 3 ---
>  2 files changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 3cdb8294e13f..69a0c6a74474 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -2389,7 +2389,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>  			     FF_DOP_CLOCK_GATE_DISABLE);
>  	}
>  
> -	if (HAS_PERCTX_PREEMPT_CTRL(i915)) {
> +	if (IS_GRAPHICS_VER(i915, 9, 12)) {
>  		/* FtrPerCtxtPreemptionGranularityControl:skl,bxt,kbl,cfl,cnl,icl,tgl */
>  		wa_masked_en(wal,
>  			     GEN7_FF_SLICE_CS_CHICKEN1,
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 2b00ef3626db..d6a1ab6f65de 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -1352,9 +1352,6 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>  #define HAS_GUC_DEPRIVILEGE(dev_priv) \
>  	(INTEL_INFO(dev_priv)->has_guc_deprivilege)
>  
> -#define HAS_PERCTX_PREEMPT_CTRL(i915) \
> -	((GRAPHICS_VER(i915) >= 9) &&  GRAPHICS_VER_FULL(i915) < IP_VER(12, 55))
> -
>  #define HAS_D12_PLANE_MINIMIZATION(dev_priv) (IS_ROCKETLAKE(dev_priv) || \
>  					      IS_ALDERLAKE_S(dev_priv))
>  
> -- 
> 2.37.2
> 
