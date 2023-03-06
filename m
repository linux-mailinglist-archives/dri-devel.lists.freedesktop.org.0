Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 130C16AD2B7
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 00:15:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5300810E239;
	Mon,  6 Mar 2023 23:15:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E932B10E012;
 Mon,  6 Mar 2023 23:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678144527; x=1709680527;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dQ7drXWCJwJ+PVezDXgwxSy8bA03jmpHRXLyaEoJRk4=;
 b=gEl5eVy4rOs9qHTSDuqp7Vgbro4owJNlxx0rXUUVkBZ6gcosnj2oZAId
 hWFIUJFkRstvbJvrbB3zedfLZFrj5mTBe6NIbY0bMWfKfPoONefjDHhmy
 6uNzi0ajmN17SgG8fWJBlSg4Y5WB57F4H8vFQCgjgE+VbMhE87kQKoMSJ
 zvVVudnuBjcoAPf3p9P6slPuHQ8BGqgbDhgpYgN3ru/fjidEKxXpmbHyW
 /tj2aEphpPuR0Yo69ZOQ1Byr4vd4xPI37xNyYp8kOtBNEFi/tFJTz+O7O
 exEA3bfux2dLSMi2LqNo4Cc9s0Am7UmltMka6ISk7u0R/fOc35zOUkUX6 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="316105390"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="316105390"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 15:15:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="653754974"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="653754974"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP; 06 Mar 2023 15:15:22 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 6 Mar 2023 15:15:22 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 6 Mar 2023 15:15:21 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 6 Mar 2023 15:15:21 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 6 Mar 2023 15:15:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jPfujY6bysh4ykAR8d57aXsmPG+ZIqo0NHrJraetfnbeMPkcz/jHn0GoNujUwgauxmSNs+EnWb90xp+QK9djxpklwCPZTm2ltHxIlaA8pj4CpHgeqCVXirNAaulAmoTfa9thyAyfntqLPDKwPNLXhRgBAaKexKokRcRJkjBI4SjYCnJbOP7cTXmig3kMXqMhk9AcVyXhYZAZq9Gn5B5E2/leRCacWcGhfZPYRM6wF1brFhXe2VR+2D3cRvzW7uf+Cudyq0sbaDF/a2TMdoYNTeWhTVxqkgoMIOAWJ9PPfgCCJqcyOeW/0AkQRPJaZe9Ey5GnAobBrrSy/2tzn0h+fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQesOn1GOC+BkiLYlmuiWw3FHkWYwxavdcBPb3g3EZY=;
 b=WssyKbX8D8jF7IlqHrarRS8SduyMRZ9IzYZSSGtduv2WBekpqIAY+l1cGnIAqIVM3FMJIQy/j72FDUxJSPQsA8KRfOk2z2/B+fiRTabVN6Jqv/yskCuOdkIP6hoflnUBQTvU/0RAjc6sh/ZQz+wk7pm9wv6cbq+kEqUOoOpR4Qwbojpnit5kJcFN3CxaKCn6MM3BDWETqdYlQXc6oNOyZmKtZ29BX/5LU5HybC5hCQJ0P1c630RkNpuWLl56VgYz1FMBUhcf77eO4DdMNzd0MwMSqTTZTwTbzf9PawMKfdq17G04oJhDtM2Nc1AcAkSuEOfyR8wBv7cFuvbaPlosDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CH3PR11MB8209.namprd11.prod.outlook.com (2603:10b6:610:15d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.27; Mon, 6 Mar
 2023 23:15:19 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b%6]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 23:15:19 +0000
Date: Mon, 6 Mar 2023 15:15:16 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/i915: Remove redundant check for DG1
Message-ID: <20230306231516.GI1543793@mdroper-desk1.amr.corp.intel.com>
References: <20230306204954.753739-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230306204954.753739-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR05CA0089.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::30) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CH3PR11MB8209:EE_
X-MS-Office365-Filtering-Correlation-Id: 35b203ba-0944-4bcb-4ad2-08db1e98a73d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m7GalKVSHa4/emcglUPdK5QxqjycugCFciCWkbDDzCCLleo6Sc5MfbYzUVOioDT8bAYsOATpCvTHAeBA+kl6bZ771Ss9WWL96fXRFK3MxkgWuWoT6k8JmYmkOgS83mucY3q99inBGPLFy58OV7yRQxTE2POnEV+kMHr3MrD/d4g2mbiQk70A+p9Sb+wVtCEnmOGVIuHUcVeUL2x5juzWW0umzMmOC8Hw/+/KSQO4cFX/bmm5qWzi46qd9qjtIAQL2PAwx/f1anU0bQV46XBtNnTlXeBHVioxeyhiOEMHxCH07t/3lO+jwOsMjwFtlVsfmkayvUn5xktHZI908lEnYFShTnbjyHb7nYpUosd6tFTgZaM8u3lmr+2usEsOfhT4202yXDLwgaAOja2pQG78wk4K5EOmRbfDQMbo3osroHw04KjcucLRAZmJ48NHenMaBgkfAkPyS6Cy7DzpCWtt+4e092UE1RnBkzCPHCbYIuzq3GW/nWTTZ88Ub+FPuivYiLw3tLxIytPTR2RdcIbq8AVsm3nheSRORVbC0fV6lrZYRz2q9cmyHegsag77h4S1lzkXZlPmSSf29VJKvr/jcmAha7UiKb2sNnS1p42vn9X2q4zADac94Az81Tr/01mufmiVMej9m50weKAHBpiTmA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(396003)(366004)(346002)(39860400002)(136003)(451199018)(450100002)(6666004)(66946007)(66556008)(8676002)(6506007)(6512007)(1076003)(186003)(26005)(316002)(4326008)(66476007)(82960400001)(86362001)(38100700002)(33656002)(5660300002)(83380400001)(41300700001)(8936002)(6862004)(6636002)(6486002)(2906002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l3m0LOWqar0l4JezOagKRq8BBA5IFpL4gmlyeL8fsC6pzFFv1m7gR/0VmrEs?=
 =?us-ascii?Q?ysR9RjBhJAwQFwTftjPHwEAHFotuShJawxslx32yb0JL/qHV/xQnHWxb807k?=
 =?us-ascii?Q?Qnc3V8koRvrXMKLbYAe9QNUkI6X9kvv7e9p+AYxiCrWDxeIlRTgqlNWE4H9s?=
 =?us-ascii?Q?0Lc+p6FcSPBM/6Inx6655XMUdO5oZ8juVfIvG1SbMi0oJfq43+Qg4REd7pV1?=
 =?us-ascii?Q?OHIbWVXaZOJeWA/b5nYDfJpmhRVscjzwQchWaKhUWEBj+GZoAUd3zJpRp5LU?=
 =?us-ascii?Q?UGDnxZPpeYwgRGaarR1xm9h8dvx7AgVAX1777UEAojva3f93Hhkf8u3GnS+e?=
 =?us-ascii?Q?dGh4tbPQx8T3tIQumzpXJWHiiAWynEJwbNDhTemQ6EFujk/c/ZOInvzHwwaB?=
 =?us-ascii?Q?Px1StVBeS/igvqvBrID4fNNa/K7d0jc/D6jj4J9xNeo0xWB7qiyiRs0y6vFB?=
 =?us-ascii?Q?YZ5T0qgKPRuutDr2wjhkD0nHTyeStbuaDX/NOxua2ZlBkrg/9OJSB+cxsvbU?=
 =?us-ascii?Q?seBXBJe0mIJL9Ed0ab3x9HaKHDO3gfvLtVxYMN20lwCMMMSP4h6PRiiCxEVN?=
 =?us-ascii?Q?EJSGj8D4dGL/kISVxvE29irUc/ayPnujKmL0hoJX3FUE2jrVFEdAN1LebWOj?=
 =?us-ascii?Q?xuiPsCjcwJhpYKTgK4t1MW7yx7eUKK2XxeG71o8A6HaugligEiguDvmPU60I?=
 =?us-ascii?Q?B9oItU06n2+F45U8OzNysNmWXV9E4WbW8JfsE9CwGseQ/LZhgx9Ceyq0Vp96?=
 =?us-ascii?Q?MH7K0s6tMdjtofYiZwFQn89w0kkHIpj/5oF/IuS2k/HjOquU8FnF8di9O76L?=
 =?us-ascii?Q?8TKflDf8/Ro+iFX+A/kh/C2/YB4b8MgJnkmEe/lT8rKXT7mrend1rl2pQKEA?=
 =?us-ascii?Q?jkAkWq2Yw9GwdwtVZMpv+nh7j19h2rcM466Fw+TQZndcowQsP7MzdD8N6+vH?=
 =?us-ascii?Q?zdHBOCfO2QfPyT8vNjHPr8iq0o5OdS5HUObNaT9czx5LwDQI/q0UFwVcg7x5?=
 =?us-ascii?Q?dOGGuKiT3jquJAxMsGksp9TdhxfJ1L+i/A8yCu0O3SCUkO4/5EkrXpj+4L+X?=
 =?us-ascii?Q?zlm3qNi04SWmomkPbr8L8QMb9gTnNV63+XMjsEtPkoUMYVW3RmkhFbmYC7g2?=
 =?us-ascii?Q?+CwEp7JiPi3PDA5QvhPCa4S2DabdBdgYhivvDM5waELmKYbeeSko6eWRpW/3?=
 =?us-ascii?Q?6WzMvTSLkQwnzrHTYOD404N5SXKH0xW6zDYoVUogF0kjKe9QK0WYXIWeJ5bj?=
 =?us-ascii?Q?CEasYpRKgpak6UowNPCLhrNezFA3ISMc1f3KdApxgAuUkfXbQ4sevqfIJs4g?=
 =?us-ascii?Q?kUkC0BEeVEdCxY3hQSgx0uCxKT6vueg+wUv7033p7rnOEew3yiYrDAAYCzS/?=
 =?us-ascii?Q?MJgoqMHSUxDtBiarNkJijB63BUHaTVyhmjVjzvZt/6IUxY5CqHFBzTF0Vglm?=
 =?us-ascii?Q?Ugkp23coZZOX9qc91SBxKJxg7zOSQ33GH6SAN9rGYvS4I2UuuF2wsILFYZPf?=
 =?us-ascii?Q?JCidk0a0++17QMrBjI8bCTegtsP7J6c8w8Uqgp8oNEW108awIQABlq940jMI?=
 =?us-ascii?Q?O4nTyxfC7rkH/BPzjcXl1bGLeqEeHVQEdG5DhFbtBzu/ESxL6n9rNAWyLmT5?=
 =?us-ascii?Q?9w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35b203ba-0944-4bcb-4ad2-08db1e98a73d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 23:15:19.5700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BAhe3CyET6aGmsUqEEuGQJ0WyFJmVTIOvDcK9oYOumjcy/pb8gS31YDjVce9S+ieEznu2r6bvyZltWOw36HEw7fYiel514sxovcSRbKxaug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8209
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

On Mon, Mar 06, 2023 at 12:49:52PM -0800, Lucas De Marchi wrote:
> dg1_gt_workarounds_init() is only ever called for DG1, so there is no
> point checking it again.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 32aa1647721a..eb6cc4867d67 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -1472,21 +1472,15 @@ gen12_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  static void
>  dg1_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  {
> -	struct drm_i915_private *i915 = gt->i915;
> -
>  	gen12_gt_workarounds_init(gt, wal);
>  
>  	/* Wa_1409420604:dg1 */
> -	if (IS_DG1(i915))
> -		wa_mcr_write_or(wal,
> -				SUBSLICE_UNIT_LEVEL_CLKGATE2,
> -				CPSSUNIT_CLKGATE_DIS);
> +	wa_mcr_write_or(wal, SUBSLICE_UNIT_LEVEL_CLKGATE2,
> +			CPSSUNIT_CLKGATE_DIS);
>  
>  	/* Wa_1408615072:dg1 */
>  	/* Empirical testing shows this register is unaffected by engine reset. */
> -	if (IS_DG1(i915))
> -		wa_write_or(wal, UNSLICE_UNIT_LEVEL_CLKGATE2,
> -			    VSUNIT_CLKGATE_DIS_TGL);
> +	wa_write_or(wal, UNSLICE_UNIT_LEVEL_CLKGATE2, VSUNIT_CLKGATE_DIS_TGL);
>  }
>  
>  static void
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
