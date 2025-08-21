Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F00FB2FF4C
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 17:55:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC53E10E38B;
	Thu, 21 Aug 2025 15:55:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EHu7/F3f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39D3E10EA05;
 Thu, 21 Aug 2025 15:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755791732; x=1787327732;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gUOvBTG4jadIUTteGR0ZtsleRFn5of4U9xjbRxHY6fo=;
 b=EHu7/F3fWD24Md0zHk04k+R40afZrGyKlegGmZAZTRrOfcbcyjEhzPgK
 K7vkhgGIp3LnGMeUsGjW3yrs0rHSDLDthAbEu0ZYLVHPSwqN2zsglIHOc
 jdmlgrAmeJUTgfqxcEbVTZn5Y6vd33DM8oLUeGh2HheEi44K0uQwuaedC
 tQONa/jonYyfTgeKd5kg9TdhEguTPa8cgujiQU43DejFRjsPidWi5OZ16
 9xhusYDx+lfOVECNDlXblMZ7xlssUcE9ZhZVVyCqY7MBKJaoZ+tcPYyHF
 vAaNEgH+Hm0UTMtfWuFjf/w/UYBWOJ/lym0N2CozjgX9jZHy9lVkjbIqg A==;
X-CSE-ConnectionGUID: GGV8Z5kqSFS6o+4rWp8gMA==
X-CSE-MsgGUID: TPnehovdQCCsepwoZEynpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="68358722"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="68358722"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 08:55:21 -0700
X-CSE-ConnectionGUID: QpyfbN7hQIGAu6ekkHNcnA==
X-CSE-MsgGUID: 7nrNdEi0TYeBMCSu2FZ0Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="168675422"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 08:55:21 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 08:55:20 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 21 Aug 2025 08:55:20 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.52)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 08:55:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yzcNhtQD7JMj+qvDU5Q33Kg+FfjtlzlJtR2ROxK1KhN/K5X14sKE+CAU5rPWipTfwIvF+s5JFWJup843Wroj0eneruLclTvFFpRZn8oiUZ6tlsdtCjmLhO91aABZdQpit66jzgk4EXuA1F14vAhTAzTHGkbWokmXCTfqyZn3VEwAS1YIB1KiQv/0NZjsUBn5L9404Hgzv4Fc4E1s+7jCLv7gh2Py6TMqvorp6nPcs3zsH2dICwEz8xeD3joH9NTzRbRLHfiBrSVjxv8KsemghUodmP89NiqpWVpHNgF6DryX99LL9fFCguTXo0n8ZjTx3m+FjQvKXpholOSRvSfdpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0HuiZ3lAP2lU7DWPnWxnG7/oK0VYHZ+zYG1V0N1G9dM=;
 b=DMYEE9l9mp2+YlHM7HLp8lh+vb787Eii/gpSGl9XyOGvLyRQZopgb2u/M/eb9HOn09GJZfGxtlRbCYEZ5lqGlDtp2ieAoF2opLnJArsyQ4FEX0jhX2TpulN14mQ89eF+NUYA3JGLsaW7AV+I0hnkSfvhkk7nqoEDm9c7bl+7XA/++L3xHiBZ8SNKNooQpnpJmYpRECs3SgRiYu/XLFoqOOastutVhL1DEFwd6ei88N0ChWRsRrUZiSMHoijY8zHzDjypt/1Ok0zpH65ZICpnSxiR6R++bhNYdv7Y6gMuZ3eY4T2K1Vf3iqKEimZyAkdx5BDUWldL01OmcVf4p3v6fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS4PPF399DBF572.namprd11.prod.outlook.com (2603:10b6:f:fc02::1e)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.16; Thu, 21 Aug
 2025 15:55:17 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 15:55:17 +0000
Date: Thu, 21 Aug 2025 11:55:13 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
CC: <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <simona@ffwll.ch>, <airlied@gmail.com>, <tursulin@ursulin.net>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <mairacanal@riseup.net>
Subject: Re: [PATCH 8/9 v3] drm/i915: Drop unused struct_mutex from
 drm_i915_private
Message-ID: <aKdBYXuZ8N6shL4w@intel.com>
References: <20250813135035.144762-1-luiz.mello@estudante.ufscar.br>
 <20250813135035.144762-9-luiz.mello@estudante.ufscar.br>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250813135035.144762-9-luiz.mello@estudante.ufscar.br>
X-ClientProxiedBy: SJ0PR05CA0096.namprd05.prod.outlook.com
 (2603:10b6:a03:334::11) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS4PPF399DBF572:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a65f8fe-93a0-4d2c-2479-08dde0cb1faf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZYz7NsuDqYBhweLbAeHd7E1byZ6fnFChr/gnYKe0S/SIqda64FAMddp7KGsE?=
 =?us-ascii?Q?J0kSqV745MurgfJOLrZbclPBH9ClbKO3NcZHW0Pgg43+1LySUbkXuuDv31Jv?=
 =?us-ascii?Q?n1mQOzvtvEQH5mULCWhPKxYYUOkScUGVXY9MBkErDRLWuCcPVTknUFhhmy7y?=
 =?us-ascii?Q?uXw6rCpdHWPQSe2aWaBm7sUqZl0R189sgaqca4U7ZoBgOH4bJVFVbG6NXcDr?=
 =?us-ascii?Q?pEMwJDAt2w2D+Oq/+wIlyxzvwL5A93XWmwmwwFl5wRfBHERHs6chOAgrsgz7?=
 =?us-ascii?Q?yrpFg4Nof1LVpfHM62LZ0ZEf8AQdCtrhGlyxnye8NRibITPBUuJC23Es2w/I?=
 =?us-ascii?Q?PSO4h9rYWZn/EzOhZpOaVORLkWfFYSMcGswxBiynA8H0L8yBdYGMfScZGzYy?=
 =?us-ascii?Q?jaXV6GYO9YtxH4wPWnI2WC4ETBPOYBal+SrZBpeyJVG1S9Hr3ZdSLSOIpcR6?=
 =?us-ascii?Q?UGY7i82iy1LKL48csTzLJOkBMBQcPZPS0rd8Vx1zOFX/DyTEOk7MPfJEuvvH?=
 =?us-ascii?Q?t+99WwFFWDnuEWrQN+zt2TG4HU9lz8OZOBscojY7C/k20NlffjMESHKbsqMo?=
 =?us-ascii?Q?HJssGy8ckOx7XPvior0Vtzq7mDnlEAHE67fuL4QpvJM/0b4AfCcZk2QcJojs?=
 =?us-ascii?Q?tzHCgae6PWeKAgKyqQAWg+4qJapfI+0TWWf7bEe6x/Mlt9ur+HAYETynbzio?=
 =?us-ascii?Q?RpbWKttNAxYxKi+JKFyC3qCSJxqMsYLvmoFpSvEKtWU0iwDqywLAq7nD+JSC?=
 =?us-ascii?Q?JaO6n4ZR5sUu1GsBzJwfxR4F7lPmvikvtO24832UQCKUJGrCfA4dFuQPCv4w?=
 =?us-ascii?Q?J3jvTofyCQFQ5f06rjfRuHC1oxGK5gSky1DA37nKQK2IVhU2Dl+kHuSQgjvi?=
 =?us-ascii?Q?Feb3GcfCJeYh44e5fq/NRAXRAn3dafLuT+4iPheEw7Hv/RCnRJINO5QN2H7K?=
 =?us-ascii?Q?FpySKgGyvGnlEBDq76ACRXxEbY3B9sUbUquq5mFUHTwXn+8MZpYTb+bcYLNf?=
 =?us-ascii?Q?HIQEegI3ktSNsTF8jutAAMZlb945osRtBcSD44u4YiWdx1mdvGOlyX4I5oC9?=
 =?us-ascii?Q?f/yaLaSgZY0StUJZCFlq6bTdVL/DYrq9pYi8D/l6r84bR+1ME+zG5acyGJ32?=
 =?us-ascii?Q?vPCWdJZKAA90B3Qwr/KVmfcqdrs5qUnBwOMvMntztSitaN+wYEjxZx1uCU/p?=
 =?us-ascii?Q?xcYTMIDVRdO6HQ3rxs6fWuqrFalH7HnD+vYb93gGzTX/qw5HJSbafsbABJCA?=
 =?us-ascii?Q?w+oFJzAksti1Mu45IAjjhWZbrHpAjKVIlEChGdl4a/DtcDOMSHS3CJVDQX7e?=
 =?us-ascii?Q?mYKfLZauMzEJ1dq3E3avfpQ2oPp/6ZmG+j6lfU5Jb/Pn20UCJLbyUe5lidWW?=
 =?us-ascii?Q?HK72PEgg953ynlkBMTOvvupzKW4SawADlYAblYQ4oxOt4ko/hA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?flNWveRoG1ONdRROz3A78NMUZN1djKvTDN7Ia9QioUheRRuXrKkBV42CPzWE?=
 =?us-ascii?Q?AZCg/xy/ZupewZNtquB4NJOgCOsWwTJXrY4++zkbWOMMnGR+2UKrnA2ODljo?=
 =?us-ascii?Q?cKYnGdEQA4HAuRTdYTO2bUJuS5ZhszJ0gd7eGPZP+IRkt+LSISaBq/DGm2TU?=
 =?us-ascii?Q?jb/dYyUXyO9LnRXyUSE7BLdzZNIv3LDkwgXdZMNzfnOE/poztwXIEKufax4x?=
 =?us-ascii?Q?YSo0IweGpWCpHDQQ5ioh8qNschKAkZT+RgrPO+3iJVD9tsFEfbJ3hLiJUgb2?=
 =?us-ascii?Q?wLog+gKXDb6Jja8RIX4RHcxFNNz+12GXrQXBN5aJW1+j1kiYu+4Me3vGkvbt?=
 =?us-ascii?Q?mfqgpS1nhKphglxjlNJ6VZOC1bpZrIJCERQNOaHvbW+8rxO632yuIDX7FK49?=
 =?us-ascii?Q?zou5bSI+BD5u6O3HVzMWKKYm1FTCc8J9SN+uxoaWKFQNHPfa+AgPL4BHBA0L?=
 =?us-ascii?Q?m0lcGDvwcOQ3Fkug8Pj2wN3eAj8b/DBkoBfHE/J9qoe8XxmeR0Av2HHnjfMx?=
 =?us-ascii?Q?a/ONfoN2Nclg8D8l7K51LPiQV8xwO0usoSqOm2LM8jBGeZQzlbh0BEC5GkfN?=
 =?us-ascii?Q?mOOnj/FS5KcPdw2o+ETDgH/lQapxP5vaRiVQB/no4akge+LzrVxsa7OgjRKK?=
 =?us-ascii?Q?l5EZBhnyNilZQK6Y0ysWjXOdFwYLGvPuCuWykfI44gWr55eVxdcGG6m/OSY/?=
 =?us-ascii?Q?YDzMQdQzeorlPoKfY7qPhH7AcYRRcN4C5IHPt9Lso9z0BhvU6xnLaNbRTtGc?=
 =?us-ascii?Q?dHotc2rp1S2l+yH5/iZT11tpYuphoCJ7MZEPleiGpOiYmvOPkB/dFk1cKDOB?=
 =?us-ascii?Q?Ja0aBoyAehScppKCLYs5IdHKZcN5OyioLGyYR+vQLYcKzCnm+oEbx8eEXNL2?=
 =?us-ascii?Q?lAAvQ8Ny6rwCt4pf4CqTQw+5HYDbZJd5lX/exXHb6T25oYei9MJtdNxG+pu4?=
 =?us-ascii?Q?w/Zyqx5GrnCCExpS+wT5psUZgNoWT3jTbov2D7Df9RkBNkgl7nUSkBGH3K32?=
 =?us-ascii?Q?TI+v6teTxnpQSJfaaogQFipq57KR0sJxo6T1a4elOHk9nme3g/3hStPnhIEk?=
 =?us-ascii?Q?/K9XahfwTS2wqreKsbQx/qbLrQrKcwrdmnXNtQjlvAv4etnyvVRvFLwD2U37?=
 =?us-ascii?Q?dJ282p7fORt9BKTZkMlDzvfaN7TiULtpNc0NLsFPT9VJW5pnXU3VJRzVmHGm?=
 =?us-ascii?Q?Q1H3cJtmwGOiUz3dLnWThHwadbEAzrCztGvGiSwQUqoR/mBDTonPTy+35rRg?=
 =?us-ascii?Q?ocyJaJXUCNPvxfE7Qmq3ReJBusQF2E4Y8ZutpYv6EHgSHDyI66NLZELqrmxQ?=
 =?us-ascii?Q?g7atTxwD2uGYG1tuFWCwiuXesU/Cb4xF0kLYDPo4J7RYY7EIOdOAbHlWed43?=
 =?us-ascii?Q?M6HVY+PuHse66iRwH6mxOcb8iG8yZhZuzC0I2ev3tnVtiWYMkKxV+s6Rm56M?=
 =?us-ascii?Q?Lz4AYNOdygtAmI+gvhX7BKr8J0BordYz/Jwcs+4uSsCTANMFx0wZBDL4AorK?=
 =?us-ascii?Q?85t6iFUo+xMX1A1wcvbO54nhycoTWAMRqwvOsiKD7sBI2i2eKnktbRNk3xxi?=
 =?us-ascii?Q?ikVkFHAT0RpwNh1qFoK9IHyTnkxz7dLcGAXWz0gZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a65f8fe-93a0-4d2c-2479-08dde0cb1faf
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 15:55:17.4934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ln6NZnviQl5EnMGiNtEU3qipmesE2g+j6DYNVFCmskWriAhizzt+bhOZ3g8hrhnQrqwcQpglTJXAEe8Uq5wevw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF399DBF572
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

On Wed, Aug 13, 2025 at 10:50:32AM -0300, Luiz Otavio Mello wrote:
> The struct_mutex field in drm_i915_private is no longer used anywhere in
> the driver. This patch removes it completely to clean up unused code and
> avoid confusion.
> 
> Signed-off-by: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_driver.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index d1559fd8ad3d..c6263c6d3384 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -233,7 +233,6 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
>  
>  	intel_sbi_init(display);
>  	vlv_iosf_sb_init(dev_priv);
> -	mutex_init(&dev_priv->struct_mutex);
>  	mutex_init(&dev_priv->sb_lock);
>  
>  	i915_memcpy_init_early(dev_priv);
> @@ -292,7 +291,6 @@ static void i915_driver_late_release(struct drm_i915_private *dev_priv)
>  	i915_workqueues_cleanup(dev_priv);
>  
>  	mutex_destroy(&dev_priv->sb_lock);
> -	mutex_destroy(&dev_priv->struct_mutex);
>  	vlv_iosf_sb_fini(dev_priv);
>  	intel_sbi_fini(display);

Hi Luiz,

I was going to merge this series right now, but for my surprise this patch
is missing a chunk present in the previous versions, which remove for good
the struct_mutex and that comment block.

You probably forgot a git add while fixing the rebase conflict.

Could you please get it back and resend the series?

Thanks,
Rodrigo.

>  
> -- 
> 2.50.1
> 
