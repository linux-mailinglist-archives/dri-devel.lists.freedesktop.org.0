Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A3168C442
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 18:10:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3393D10E181;
	Mon,  6 Feb 2023 17:10:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10A1889349;
 Mon,  6 Feb 2023 17:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675703431; x=1707239431;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AfIUHbJGcGDU4COl2nZaSARyGAeEXLUx3Jq6wsTWXi4=;
 b=FGov3f+jY2CO9zJgpqks5RdBHSt+gUYofBR14krbwcZdgdj6zLYxJ6N4
 hcV3653zyjvQIq3eTHU0onJF25Gkg59029sEZyRThjyHGTfcPpjrlde0u
 dl2AQG2aG/4Sm2vVpnAc8wmsvbG3DYsvVV+dGfgVfyAsS4DpGNGAxgw+9
 EP4Sq7S+SUOB6yn1Fp4pcKYO4E5sDT8e6R0Uhx1Al4WLFEPmvFoYKexkd
 FeU6BY5q6KN/Jf+5Sx3NjoU9lNMHcDOgfLSp1DQ4NgWtQIWJ/C19onKzD
 GVXU4t+lJpX8FvW4ztoekAmphkzarsSkeCDxNwk4OVzti7sbSlDS5XOb9 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="330550982"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="330550982"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2023 09:08:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="616500712"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="616500712"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 06 Feb 2023 09:08:59 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 6 Feb 2023 09:08:59 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 6 Feb 2023 09:08:59 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 6 Feb 2023 09:08:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SmgI04Mb3svlwb0Sn76wt8XAg7e77d8Ec87+tjUaTTEIjdsuQIeZwZPs0ZJv+NvtpMGe8PgjrmgClGnjm56RbtNNQCWsGei8d97DzjBR16hWtbbJtZaFaxABMSwFeTUXOGwz6+SVw7f2VguB3+AwOx+jWWCg1Wjd9kX5IL3UTN5lR6WmeF8jMbwDf+Lv+S1TJ47MM9AwXB0nBO7SKneg+FbTZXmOwlCAEE/Sy0C6xo07f/LC6FJ+j+hAF2Ps1MyDgfjO5dMDaBNwx1BDWSxSso67vLeLx/GOrd9ymurkus16vRiGrnUa41SlarFqEJ7ne2ses9JR8KuOpqzsNWFCGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pcndxH/hyk9jc8PHmsOVasuwgfhfqu/P3B1SuK7oFmY=;
 b=dS5HFTsjcDk7esRmwWl0E4L6YnMOSFOSGsI7UbTWWi1tpgevUSsM58UdOZ2xn8fZdQWRIkeriEYZIVwJW8DgdlUikoT0rVjYr6Q1FOw7E8d16qUpkwywwDF5sR5WdLDpuKB4pL93rH0j7tm9x3EuOCX4i9tQJ9kdb0JwIgkMfvE9nNuSD4eiqfyctcJdu/QSveTPK2wkBvG3zyZKeTseUcWPdOtQXrb5Q+CJZIzUrSh2aJr71A1E7eO8jgQKKMyXhN+P1rBPnIf2GMcMxpQNkPT10LwWYVXbC6FXQvL8XrFsJtzdKuo6Io+7O6bxH15FEG7uKcl4zDcSv2Efxpigow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 BY1PR11MB8079.namprd11.prod.outlook.com (2603:10b6:a03:52e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 17:08:57 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b%5]) with mapi id 15.20.6064.034; Mon, 6 Feb 2023
 17:08:57 +0000
Date: Mon, 6 Feb 2023 09:08:52 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 2/2] drm/i915: Remove unused/wrong
 INF_UNIT_LEVEL_CLKGATE
Message-ID: <Y+E0JBR+2O88t6BK@mdroper-desk1.amr.corp.intel.com>
References: <20230206165410.3056073-1-lucas.demarchi@intel.com>
 <20230206165410.3056073-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230206165410.3056073-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR04CA0199.namprd04.prod.outlook.com
 (2603:10b6:303:86::24) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|BY1PR11MB8079:EE_
X-MS-Office365-Filtering-Correlation-Id: 28b4e745-f097-4c9c-4de9-08db0864d503
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yGtZ2CwzTN/IFtMZQf3x5busjijwu4y1SUdO2G4zX/rmVo4yAEA18PLvoRhurLLliR+iaopF1Tn0ZMK4AZIrl+cTpoWSXCw9T3gPWi/TyhiJ8tv/HFcr8vI9SfO9QcymEjJa2T6RePnAD4RkVeR4TH0iYMP08DodhmuaTw/6XgAgUZszJyniGxh3/T5YVftPJOZXJnamwqAtus+EiOUMMBVxJXvjbBzTPkqg/yUNgnlauueDSbK0x1eL+c8Y/6u0fOq696WS/5cSXgMZ8C3u5rb5En3dVtgMYSaXGFqL4B8AgFZy+X+y/WPWyrQdpe1egPqc5Y9v+otoTwneHkGesQsiPFu5qUOjKGVpTukm/yW5oaKXBwyughUx6XYGobUbj4o4JcK/6twjeOLqdZr2uAdBwr9ucO4+S3g2CMAgEcIKqZIqawvyM8HE6lO0tluT+qKygA2nhqX17HDQdJExSnTIub2Bz44w01duIdwwjwUgq5Wx9vMTpIbbvHoIdOkBlxfCxVNHeSOpiKipbOfW73gVPU4SIcLiKcwaA4AmYOdMdEdbnB/fYvFGeoMhEENiIQGDtefi38nVlbS0Gs2MGZ51wQHqMvbO9rYdQvDnPjtxnEJLfLk2bXR1MM2wUZOnrxmFEj+rQri43GFk1aFy1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(136003)(366004)(39860400002)(346002)(396003)(451199018)(86362001)(82960400001)(38100700002)(66476007)(5660300002)(41300700001)(8936002)(8676002)(6862004)(66556008)(6636002)(54906003)(316002)(66946007)(450100002)(4326008)(2906002)(83380400001)(6486002)(478600001)(26005)(186003)(6512007)(6666004)(107886003)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e1eaos7QANPnxHkdMUFP9x9v3R4wscEj/YLHT6nSMqBZ7BbdQGl9UcChVfy9?=
 =?us-ascii?Q?cBQAuQ/ffZnYBmqjVr1udB7z2+ezPWoQSYVN73PdlNVk/OdGhMnghsQL6B3m?=
 =?us-ascii?Q?yuEe1KMxoF+Yl15X0XnMO5N+RUHTMVQJjsNFqDCbKUzGmYUi9xsSoFyYhPCv?=
 =?us-ascii?Q?V1s9m3UJ2BJqU1u7p1bvkbVVoqzuCAUHhaaeFlRim4HljLtzOgPwrvCRgkuD?=
 =?us-ascii?Q?8kzFv+HIns18AFN2vBXy2xhCMVnqFdwnT5ghAyI98WePV72SZr8hpQoyT6sX?=
 =?us-ascii?Q?YN3Os87Np5xb/SmodtpJnsbwBywsxX0yKy2C/uHWL94eSAwpwEK/hyF1OFGz?=
 =?us-ascii?Q?mKkwPk5wN9M2hv1IbBoflgDpB2XtDMxq2Uk5M2zS7bGdHmDgoA/+WrN+KvBI?=
 =?us-ascii?Q?d72g7pfyuzf2tfcao7rt88xCgm0RtZHjL9qUpLZIIMlmUNDZ3DPXp7nyyBqq?=
 =?us-ascii?Q?ef6Tt0mpPGHIRo5AmNgNYLV3EyY77VVMkdxXwvR0hNrwdvX4foJxUCupS++E?=
 =?us-ascii?Q?WCYO1JUPnzUPDWjyfd//FjB/l5bpQkm64I/CdA4RXKf+gpOy5DYZtQ7v0cFZ?=
 =?us-ascii?Q?2gHrzA9tDOmFa+hf9mU4mhHSv1x1tXmmy0utF2FXSOxNxk1V+71ITbViK8l2?=
 =?us-ascii?Q?du+0CdhCjvHmyW54X+kjUw4QLf8njx1FoHq1VyGuj8TQzhz/P/XWsxXqb1d4?=
 =?us-ascii?Q?pebuBFnX+toW2nN6sitKTLLvc1DsUzhERXZuGXikiSeL6yhTuRWGtqavcNgQ?=
 =?us-ascii?Q?IEq1+7BDTeeARl7S5ZCYAAZ+QD+pB0zL6wbnHHamvrN376lF28bGk6oRwgcT?=
 =?us-ascii?Q?CpaJYhCiYRgb/qe1+THfWpb4zcfKLtqDx93wWC+oCvLpGuIpWR9jBYkMwffR?=
 =?us-ascii?Q?VzP+zkVd0uYor4rhC/TqHPMT04RdsEAnpf+4F8Q3IhYMTPsVf6FMSSN841I+?=
 =?us-ascii?Q?AFcF+Yf0XPouS5ZDsBbXiWOT8AeNj0rjdmoE3Xi84+SxU54xEmF3AONyHQjA?=
 =?us-ascii?Q?9/RuDGeeDk3kPh3rvnWKJXHQHXbP5fDx7ouyvnFh9lWsIOTy+oM7NRiEmW37?=
 =?us-ascii?Q?ElO4sd4ZAGMKWpYbhULwDF8HTWbJKH/+BnmnUN/TxaNGlgi5wDDDT6x2kwo2?=
 =?us-ascii?Q?FGJtXJV/AxL2FoiimDBCFL7wOrBgBV6D3TuM3LDqAYmhKFD+VRkcJ/EqBdw9?=
 =?us-ascii?Q?rm0d0/CsIqEFhZgCxY4L1ZOUaVh/kBrMuPIjIw49R2wFnOw6zeVqxq8czAdR?=
 =?us-ascii?Q?ZSvTvCWOydzM4hbbaDaal5Vj9pJujRC8bgGDzVNWuwQShx9lPmj7VC1vSJy1?=
 =?us-ascii?Q?eoSRWTz+9ZyQIBg4HFZ8uzttBhFATAQd5fxBU0b9pYr7A0Dm8/eQxhKHbW/0?=
 =?us-ascii?Q?F5CBLKcogrwxDfTBQf//rOgg5TvnWnzFKdKjGhVzF20IQ42awlWC2cyAFUbc?=
 =?us-ascii?Q?SujcYhFu6epdJ4kRwEyNTTRu5/kA8JPhpHirjhESWx8sIA8358UqBk2S1P8j?=
 =?us-ascii?Q?gXXcRzY3CcD1LlDeWaOX6zoKL4EgUxav9yULkTajyf0Cl/GXHFpNdlx/w7VL?=
 =?us-ascii?Q?Yh6kTlLbHHOG2SflY7BVuBOuePT07h9D9CZ8hFbFdmqXsfW0quQ7WEaqbz4F?=
 =?us-ascii?Q?1A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28b4e745-f097-4c9c-4de9-08db0864d503
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 17:08:56.7978 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rlab0SpYY7bZE45DGdri/UAKdMJ0T2lUErshomx9Q1ywkVDRpdwakRtt1EB5+UFx2SeAW00n1CKMSIFS3CrShPiT1fbZM7Cm5xT+ootHvIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8079
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
Cc: intel-gfx@lists.freedesktop.org,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 06, 2023 at 08:54:10AM -0800, Lucas De Marchi wrote:
> INF_UNIT_LEVEL_CLKGATE is not replicated, but since it's not actually
> used it can just be removed.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Looks like the only reference to the register was removed in

	commit eee42141e498fa3df3ce524846d52f67a92b6845
	Author:     Matt Roper <matthew.d.roper@intel.com>
	AuthorDate: Tue Jul 13 12:36:35 2021 -0700
	Commit:     Matt Roper <matthew.d.roper@intel.com>
	CommitDate: Wed Jul 14 17:49:02 2021 -0700

	    drm/i915/icl: Drop workarounds that only apply to pre-production steppings

> ---
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index cc1539c7a6b6..7256f7e3fd11 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -769,9 +769,6 @@
>  #define GEN10_DFR_RATIO_EN_AND_CHICKEN		MCR_REG(0x9550)
>  #define   DFR_DISABLE				(1 << 9)
>  
> -#define INF_UNIT_LEVEL_CLKGATE			MCR_REG(0x9560)
> -#define   CGPSF_CLKGATE_DIS			(1 << 3)
> -
>  #define MICRO_BP0_0				_MMIO(0x9800)
>  #define MICRO_BP0_2				_MMIO(0x9804)
>  #define MICRO_BP0_1				_MMIO(0x9808)
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
